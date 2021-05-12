Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.4489.1620855135878440838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 14:32:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YSed79KE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id m9so25060546wrx.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 14:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8vDbpVugHXJlv5aLd5Y3Z/rW5lyV57KFkQ/aljDamPg=;
        b=YSed79KEoSodTIqzuD1aU+6kbt1oT5ImrSznTduRoAFYV9UQJAyzd+iazpli5sHnDa
         j6CFLrhhrBuWryDGi0t5ixlV5PL6tewaYth6c38M1FQ2qehCjwaf+0dsvcRf/y17W8gu
         n2/n7bm+R+ROdSYzX9pVKvNypS3cR3p3GCow8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8vDbpVugHXJlv5aLd5Y3Z/rW5lyV57KFkQ/aljDamPg=;
        b=Z5iQFj9OoAuAwBrUCXgqMi2MDziou3r15vEE29JS9WOVpJpxMvPo/pNeSNVwTNohJv
         WQk070Pn8NbsLPU40FGrxgRrlonw3oG/cJ+as/7tOoFyRIGYoA43LJlKQGsru8YuCyl4
         VN/Nr9Cb0/A3rf/Nr/DNXqwv5IdOkh2/uBLCDmNbLp7TXeD3nxRZn6r08w5RYKJKdHeN
         yqZ39EzT7wgYrUZvXjmUffUsYfV+GTTC3QCqzEbpVv1duDPTNc0A6b2GWWLPRyLY7i+/
         0wO0t43eV0zSe78QnmEaFSC2kQIKkG+yFsoJbTf1yKu8/amqZbQSRUge9R+fiKdx2QE9
         xkCg==
X-Gm-Message-State: AOAM531pRektvwUSeOHX6C8aGbweMIC+J0TCg9x8SkxKhrV2HK+VnMYe
	3UrIvtD5C3GgA5wFNf55WlT+CW+ppSyC3A==
X-Google-Smtp-Source: ABdhPJwn9yxJw0TNyaJgczc4CZCVumUMBhX9wGNdmSB/srG2jj9hRtlGdZrn7ABp7/VFNWrqhAvjsw==
X-Received: by 2002:adf:ef92:: with SMTP id d18mr49082133wro.413.1620855134240;
        Wed, 12 May 2021 14:32:14 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f649:3481:d239:bb03])
        by smtp.gmail.com with ESMTPSA id j10sm893861wrt.32.2021.05.12.14.32.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 14:32:14 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] ovmf: Fix other reproducibility issues
Date: Wed, 12 May 2021 22:32:12 +0100
Message-Id: <20210512213212.2283022-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210512213212.2283022-1-richard.purdie@linuxfoundation.org>
References: <20210512213212.2283022-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When building in longer paths, the ovmf build changes in many ways. This ad=
ds a
patch addressing various causes of problems. Full details are in the patch =
header.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-core/ovmf/ovmf/reproducible.patch | 165 ++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |   1 +
 2 files changed, 166 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/reproducible.patch

diff --git a/meta/recipes-core/ovmf/ovmf/reproducible.patch b/meta/recipes-=
core/ovmf/ovmf/reproducible.patch
new file mode 100644
index 00000000000..5d2aeaacfe5
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/reproducible.patch
@@ -0,0 +1,165 @@
+This patch fixes various things which make the build more reproducible. So=
me changes
+here only change intermediate artefacts but that means when you have two b=
uild trees
+giving differing results, the differences can be isolated more easily. The=
 issues here
+usually become apparent with longer paths.
+
+This was all debugged with:
+TMPDIR =3D "${TOPDIR}/tmp"
+vs.
+TMPDIR =3D "${TOPDIR}/tmp-inital-mylongpath-mylongpath-mylongpath-mylongpa=
th-mylongpath-mylongpath-mylongpath-mylongpath-mylongpath"
+
+The patch specifically:
+
+ * Sorts output in GNUmakefile
+ * Always generates indirect flags files used to avoid pathlength issues e=
lse the=20
+   compile commands suddenly change when using longer paths
+ * Sorts the AutoGenTimeStamp file contents
+ * Makes the TargetDescBlock objects from BuildEngine sortable to allow th=
e makefile fix
+ * Fix ElfConvert within GenFw so that only the basename of the binary bei=
ng converted=20
+   is used, else the output from "GenFw XXX.bin" differs from "GenFw /long=
/path/XXX.bin"
+   with sufficiently long paths
+
+Upstream-Status: Pending [At least some of this might be interesting to up=
stream]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: git/BaseTools/Source/Python/AutoGen/GenMake.py
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/BaseTools/Source/Python/AutoGen/GenMake.py
++++ git/BaseTools/Source/Python/AutoGen/GenMake.py
+@@ -571,7 +571,7 @@ cleanlib:
+                 os.remove(RespFileList)=0D
+ =0D
+         # convert source files and binary files to build targets=0D
+-        self.ResultFileList =3D [str(T.Target) for T in MyAgo.CodaTargetL=
ist]=0D
++        self.ResultFileList =3D sorted([str(T.Target) for T in MyAgo.Coda=
TargetList])=0D
+         if len(self.ResultFileList) =3D=3D 0 and len(MyAgo.SourceFileList=
) !=3D 0:=0D
+             EdkLogger.error("build", AUTOGEN_ERROR, "Nothing to build",=0D
+                             ExtraData=3D"[%s]" % str(MyAgo))=0D
+@@ -722,7 +722,7 @@ cleanlib:
+         OutputFile =3D ''=0D
+         DepsFileList =3D []=0D
+ =0D
+-        for Cmd in self.GenFfsList:=0D
++        for Cmd in sorted(self.GenFfsList):=0D
+             if Cmd[2]:=0D
+                 for CopyCmd in Cmd[2]:=0D
+                     Src, Dst =3D CopyCmd=0D
+@@ -755,7 +755,7 @@ cleanlib:
+             self.BuildTargetList.append('\t%s' % CmdString)=0D
+ =0D
+             self.ParseSecCmd(DepsFileList, Cmd[1])=0D
+-            for SecOutputFile, SecDepsFile, SecCmd in self.FfsOutputFileL=
ist :=0D
++            for SecOutputFile, SecDepsFile, SecCmd in sorted(self.FfsOutp=
utFileList):=0D
+                 self.BuildTargetList.append('%s : %s' % (self.ReplaceMacr=
o(SecOutputFile), self.ReplaceMacro(SecDepsFile)))=0D
+                 self.BuildTargetList.append('\t%s' % self.ReplaceMacro(Se=
cCmd))=0D
+             self.FfsOutputFileList =3D []=0D
+@@ -794,13 +794,13 @@ cleanlib:
+ =0D
+     def CommandExceedLimit(self):=0D
+         FlagDict =3D {=0D
+-                    'CC'    :  { 'Macro' : '$(CC_FLAGS)',    'Value' : Fa=
lse},=0D
+-                    'PP'    :  { 'Macro' : '$(PP_FLAGS)',    'Value' : Fa=
lse},=0D
+-                    'APP'   :  { 'Macro' : '$(APP_FLAGS)',   'Value' : Fa=
lse},=0D
+-                    'ASLPP' :  { 'Macro' : '$(ASLPP_FLAGS)', 'Value' : Fa=
lse},=0D
+-                    'VFRPP' :  { 'Macro' : '$(VFRPP_FLAGS)', 'Value' : Fa=
lse},=0D
+-                    'ASM'   :  { 'Macro' : '$(ASM_FLAGS)',   'Value' : Fa=
lse},=0D
+-                    'ASLCC' :  { 'Macro' : '$(ASLCC_FLAGS)', 'Value' : Fa=
lse},=0D
++                    'CC'    :  { 'Macro' : '$(CC_FLAGS)',    'Value' : Tr=
ue},=0D
++                    'PP'    :  { 'Macro' : '$(PP_FLAGS)',    'Value' : Tr=
ue},=0D
++                    'APP'   :  { 'Macro' : '$(APP_FLAGS)',   'Value' : Tr=
ue},=0D
++                    'ASLPP' :  { 'Macro' : '$(ASLPP_FLAGS)', 'Value' : Tr=
ue},=0D
++                    'VFRPP' :  { 'Macro' : '$(VFRPP_FLAGS)', 'Value' : Tr=
ue},=0D
++                    'ASM'   :  { 'Macro' : '$(ASM_FLAGS)',   'Value' : Tr=
ue},=0D
++                    'ASLCC' :  { 'Macro' : '$(ASLCC_FLAGS)', 'Value' : Tr=
ue},=0D
+                    }=0D
+ =0D
+         RespDict =3D {}=0D
+@@ -1003,9 +1003,9 @@ cleanlib:
+                 if not self.ObjTargetDict.get(T.Target.SubDir):=0D
+                     self.ObjTargetDict[T.Target.SubDir] =3D set()=0D
+                 self.ObjTargetDict[T.Target.SubDir].add(NewFile)=0D
+-        for Type in self._AutoGenObject.Targets:=0D
++        for Type in sorted(self._AutoGenObject.Targets):=0D
+             resp_file_number =3D 0=0D
+-            for T in self._AutoGenObject.Targets[Type]:=0D
++            for T in sorted(self._AutoGenObject.Targets[Type]):=0D
+                 # Generate related macros if needed=0D
+                 if T.GenFileListMacro and T.FileListMacro not in self.Fil=
eListMacros:=0D
+                     self.FileListMacros[T.FileListMacro] =3D []=0D
+Index: git/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
++++ git/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
+@@ -1484,6 +1484,9 @@ class ModuleAutoGen(AutoGen):
+             for File in Files:=0D
+                 if File.lower().endswith('.pdb'):=0D
+                     AsBuiltInfDict['binary_item'].append('DISPOSABLE|' + =
File)=0D
++=0D
++        AsBuiltInfDict['binary_item'] =3D sorted(AsBuiltInfDict['binary_i=
tem'])=0D
++=0D
+         HeaderComments =3D self.Module.HeaderComments=0D
+         StartPos =3D 0=0D
+         for Index in range(len(HeaderComments)):=0D
+@@ -1759,7 +1762,7 @@ class ModuleAutoGen(AutoGen):
+             if os.path.exists (self.TimeStampPath):=0D
+                 os.remove (self.TimeStampPath)=0D
+ =0D
+-            SaveFileOnChange(self.TimeStampPath, "\n".join(FileSet), Fals=
e)=0D
++            SaveFileOnChange(self.TimeStampPath, "\n".join(sorted(FileSet=
)), False)=0D
+ =0D
+         # Ignore generating makefile when it is a binary module=0D
+         if self.IsBinaryModule:=0D
+Index: git/BaseTools/Source/Python/AutoGen/BuildEngine.py
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/BaseTools/Source/Python/AutoGen/BuildEngine.py
++++ git/BaseTools/Source/Python/AutoGen/BuildEngine.py
+@@ -70,6 +70,9 @@ class TargetDescBlock(object):
+         else:=0D
+             return str(Other) =3D=3D self.Target.Path=0D
+ =0D
++    def __lt__(self, other):=0D
++        return str(self) < str(other)=0D
++=0D
+     def AddInput(self, Input):=0D
+         if Input not in self.Inputs:=0D
+             self.Inputs.append(Input)=0D
+Index: git/BaseTools/Source/C/GenFw/Elf64Convert.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/BaseTools/Source/C/GenFw/Elf64Convert.c
++++ git/BaseTools/Source/C/GenFw/Elf64Convert.c
+@@ -14,6 +14,8 @@ SPDX-License-Identifier: BSD-2-Clause-Pa
+ #ifndef __GNUC__=0D
+ #include <windows.h>=0D
+ #include <io.h>=0D
++#else=0D
++#define _GNU_SOURCE=0D
+ #endif=0D
+ #include <assert.h>=0D
+ #include <stdio.h>=0D
+@@ -770,7 +772,7 @@ ScanSections64 (
+   }=0D
+   mCoffOffset =3D mDebugOffset + sizeof(EFI_IMAGE_DEBUG_DIRECTORY_ENTRY) =
+=0D
+                 sizeof(EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY) +=0D
+-                strlen(mInImageName) + 1;=0D
++                strlen(basename(mInImageName)) + 1;=0D
+ =0D
+   mCoffOffset =3D CoffAlign(mCoffOffset);=0D
+   if (SectionCount =3D=3D 0) {=0D
+@@ -1609,7 +1611,7 @@ WriteDebug64 (
+   EFI_IMAGE_DEBUG_DIRECTORY_ENTRY     *Dir;=0D
+   EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY *Nb10;=0D
+ =0D
+-  Len =3D strlen(mInImageName) + 1;=0D
++  Len =3D strlen(basename(mInImageName)) + 1;=0D
+ =0D
+   Dir =3D (EFI_IMAGE_DEBUG_DIRECTORY_ENTRY*)(mCoffFile + mDebugOffset);=0D
+   Dir->Type =3D EFI_IMAGE_DEBUG_TYPE_CODEVIEW;=0D
+@@ -1619,7 +1621,7 @@ WriteDebug64 (
+ =0D
+   Nb10 =3D (EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY*)(Dir + 1);=0D
+   Nb10->Signature =3D CODEVIEW_SIGNATURE_NB10;=0D
+-  strcpy ((char *)(Nb10 + 1), mInImageName);=0D
++  strcpy ((char *)(Nb10 + 1), basename(mInImageName));=0D
+ =0D
+ =0D
+   NtHdr =3D (EFI_IMAGE_OPTIONAL_HEADER_UNION *)(mCoffFile + mNtHdrOffset)=
;=0D
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index ef5545bf705..696c2340359 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://0004-ovmf-Update-to-latest.patch \
            file://zero.patch \
            file://debug_prefix_map.patch \
+           file://reproducible.patch \
            "
=20
 PV =3D "edk2-stable202102"
--=20
2.30.2

