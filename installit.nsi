!cd mozilla-build

!include WinVer.nsh
RequestExecutionLevel highest

name "Mozilla Build"
SetCompressor /SOLID lzma
OutFile "..\MozillaBuildSetup.exe"
InstallDir "C:\mozilla-build"

LicenseData "..\license.rtf"
Page license
Page directory
Page instfiles

Section "MozillaBuild"
  MessageBox MB_YESNO|MB_ICONQUESTION "This will overwrite everything in $INSTDIR. Do you want to continue?" /SD IDYES IDYES continue
  SetErrors
  return
  continue:
  SetOutPath $INSTDIR
  File /r *.*
  ; write the full path to ca-bundle.crt in wget.ini
  FileOpen $0 "$INSTDIR\wget\wget.ini" w
  FileWrite $0 "ca_certificate=$INSTDIR\wget\ca-bundle.crt$\r$\n"
  FileClose $0
SectionEnd
