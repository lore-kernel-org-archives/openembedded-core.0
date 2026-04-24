Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E4AAFF8850
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:03 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32590.1777064219575183755
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=cDKnEmDT;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so59586125e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064218; x=1777669018; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tc5pVo+pxEvrXXfEMaiRA8o7zTGivZF1bcp7kV4hzqw=;
        b=cDKnEmDT/djdFfYr7t/HmgjerHB8SN6xQyxIXhXcAsXK/WSzgNigUiwFhXYvLwykim
         axW4cg9c4cXcoX1Ck6jWXvMjMrRYjYloCkkIflq0BMexIoJtSURqqGw4M1jr71uuFNIg
         RQ8vih7OykX6D+jtmt1Cu83aRPUHsvX3NhcsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064218; x=1777669018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tc5pVo+pxEvrXXfEMaiRA8o7zTGivZF1bcp7kV4hzqw=;
        b=s4fztLVE/+39exuBWDQdMOqa/jkHhRIvgZIPCnSJfUlNOpqMvRCoBHdXnH1l/5Y+8u
         OV1Wy52VP67WktACwEpxm6TVL+fiKqS7Uuzx03aYS80bAAbMJRJ7HlFTpXTgKTcEzVy7
         VSFonJPsYmBikhQ4HONXdCM+csN2L4Mkv1lYc00Wt9E6fqfw1g0R8xI3NzRRpbVT8DHT
         JpPZSWPxDRbkAQ+rFJpkhJstG3Uunc2Fy+dDvSFSHbpQGHvfu5JAQpHUsw3hY8i6ooae
         9h6UaVERR1w+IcaZOBNsesWJ/uoexltCHjU3UN40kbev72YwhaFsq6CazhnlXKSyPVGv
         r2cA==
X-Gm-Message-State: AOJu0Ywj/qKwToy43fw6jPjr/arKjUfLeOBDsvtdTO7HG3ERDkO81Ybr
	FgO5IOce33SVGoESd+iEgYAeoGu+FQrzSx8EiuU6c0Z9euRQgETd6GLyaQUnipkAbCH3DjhKj06
	acrLUA4Eu7uug
X-Gm-Gg: AeBDieu855EhqQw8OA3emElG6EAFG1DPjMuCHUWtYonrs6dm1u0hgsF+9GsqsYkUAZK
	HngkWe+WG6iVgKNGg3v2PatIGuRe2JAQ7t+wYckSrgF2zJ8wD7Q0LUjH+02lGq+J6K48SgQfHiW
	+LR6b+TI3/4bG/iCDOk9KXKuFMo8i/5+po7uqAaNABd/teMhUu06V5HBEc8Pz9jUh4tiOWlxQmn
	zyYeoOlYUKF3SAWx/QKkgu6BIAG3zbjyJfPagcnj/OU+8TG/ZZ0UEeeWce/SBFkEihyFJf9SI31
	jZjdusz1d8mOLF+V1qpeXz5FPzeQPxKQaIMWLrwfjAJB8k/HKWmENODW4MiBYfrJxGzMX2A9ma+
	PJ1ddNYSQo/S2xdET0oqZFpR2gLT1gtboVGjbz/QvUPyU2a0RhqCjihtx8s6r6GQfBRoVycAYQO
	TcCmtmW+SSqXNJqmJ5lGO0ip80eWW/N3KoHBrM99kyAcqlJmOIzJ6FJKF0fTCLGCSuAWHR/glfw
	v+OvGG19uYe+b0SOWSEyzmwvwp9iiWL43+fUg==
X-Received: by 2002:a05:600c:a103:b0:48a:58e1:6d17 with SMTP id 5b1f17b1804b1-48a58e16ee0mr176496695e9.20.1777064217673;
        Fri, 24 Apr 2026 13:56:57 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:57 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 37/66] ovmf: backport a fix for build with gcc-16
Date: Fri, 24 Apr 2026 22:55:36 +0200
Message-ID: <7de54889b3547a94bc7c6015731ec1c099e4d629.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235910

From: Martin Jansa <martin.jansa@gmail.com>

Fixes build on host with gcc-16:

StringFuncs.c: In function =E2=80=98SplitStringByWhitespace=E2=80=99:
StringFuncs.c:113:15: error: variable =E2=80=98Item=E2=80=99 set but not us=
ed [-Werror=3Dunused-but-set-variable=3D]
  113 |   UINTN       Item;
      |               ^~~~

and

EfiRom.c: In function =E2=80=98main=E2=80=99:
EfiRom.c:78:17: error: assignment discards =E2=80=98const=E2=80=99 qualifie=
r from pointer target type [-Werror=3Ddiscarded-qualifiers]
   78 |       if ((Ptr0 =3D strstr ((CONST CHAR8 *) mOptions.FileList->File=
Name, DEFAULT_OUTPUT_EXTENSION)) !=3D NULL) {
      |                 ^

and one more for older version used in scarthgap

main.c: In function =E2=80=98ProcessArgs=E2=80=99:
main.c:163:42: error: too many arguments to function =E2=80=98p->process=E2=
=80=99; expected 0, have 2
  163 |                                         (*p->process)( *argv, *(arg=
v+1) );
      |                                         ~^~~~~~~~~~~~  ~~~~~
main.c:120:34: note: declared here
  120 |                         WildFunc process;
      |                                  ^~~~~~~
main.c:168:42: error: too many arguments to function =E2=80=98p->process=E2=
=80=99; expected 0, have 1
  168 |                                         (*p->process)( *argv );
      |                                         ~^~~~~~~~~~~~  ~~~~~
main.c:120:34: note: declared here
  120 |                         WildFunc process;
      |                                  ^~~~~~~

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
[YC: upstream commit a1db482ecd2824a4ae67a3c2a8e607b607ab4a43]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...Tools-StringFuncs-fix-gcc-16-warning.patch | 42 ++++++++++++++++++
 ...aseTools-EfiRom-fix-compiler-warning.patch | 44 +++++++++++++++++++
 .../0008-BaseTools-Pccts-set-C-standard.patch | 44 +++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  3 ++
 4 files changed, 133 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0006-BaseTools-StringFuncs-=
fix-gcc-16-warning.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0007-BaseTools-EfiRom-fix-c=
ompiler-warning.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0008-BaseTools-Pccts-set-C-=
standard.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0006-BaseTools-StringFuncs-fix-gcc=
-16-warning.patch b/meta/recipes-core/ovmf/ovmf/0006-BaseTools-StringFuncs-=
fix-gcc-16-warning.patch
new file mode 100644
index 00000000000..a465dede9c3
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0006-BaseTools-StringFuncs-fix-gcc-16-war=
ning.patch
@@ -0,0 +1,42 @@
+From 015c26aea52a54e96319887ea542870b4804fb91 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Thu, 29 Jan 2026 09:23:32 +0100
+Subject: [PATCH] BaseTools/StringFuncs: fix gcc 16 warning
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+StringFuncs.c: In function =E2=80=98SplitStringByWhitespace=E2=80=99:
+StringFuncs.c:113:15: error: variable =E2=80=98Item=E2=80=99 set but not u=
sed [-Werror=3Dunused-but-set-variable=3D]
+  113 |   UINTN       Item;
+      |               ^~~~
+
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport [edk2-stable202602 https://github.com/tianocore/=
edk2/commit/3597306191297b504683b83fe7750e49c6a2e836]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ BaseTools/Source/C/Common/StringFuncs.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/BaseTools/Source/C/Common/StringFuncs.c b/BaseTools/Source/C/=
Common/StringFuncs.c
+index 53e44365e9..df02d9c808 100644
+--- a/BaseTools/Source/C/Common/StringFuncs.c
++++ b/BaseTools/Source/C/Common/StringFuncs.c
+@@ -110,7 +110,6 @@ SplitStringByWhitespace (
+   CHAR8       *EndOfSubString;=0D
+   CHAR8       *EndOfString;=0D
+   STRING_LIST *Output;=0D
+-  UINTN       Item;=0D
+ =0D
+   String =3D CloneString (String);=0D
+   if (String =3D=3D NULL) {=0D
+@@ -120,7 +119,7 @@ SplitStringByWhitespace (
+ =0D
+   Output =3D NewStringList ();=0D
+ =0D
+-  for (Pos =3D String, Item =3D 0; Pos < EndOfString; Item++) {=0D
++  for (Pos =3D String; Pos < EndOfString;) {=0D
+     while (isspace ((int)*Pos)) {=0D
+       Pos++;=0D
+     }=0D
diff --git a/meta/recipes-core/ovmf/ovmf/0007-BaseTools-EfiRom-fix-compiler=
-warning.patch b/meta/recipes-core/ovmf/ovmf/0007-BaseTools-EfiRom-fix-comp=
iler-warning.patch
new file mode 100644
index 00000000000..7aaafe6efbf
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0007-BaseTools-EfiRom-fix-compiler-warnin=
g.patch
@@ -0,0 +1,44 @@
+From 4d2bdadcd6d45f6708b1b4827b0dc9b6e4b8edd2 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Mon, 8 Dec 2025 10:28:50 +0100
+Subject: [PATCH] BaseTools/EfiRom: fix compiler warning
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+New warning after updating gcc:
+
+EfiRom.c: In function =E2=80=98main=E2=80=99:
+EfiRom.c:78:17: error: assignment discards =E2=80=98const=E2=80=99 qualifi=
er from pointer target type [-Werror=3Ddiscarded-qualifiers]
+
+The assigned value is not used, so fix the warning by just removing it.
+
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport [edk2-stable202602 https://github.com/tianocore/=
edk2/commit/9af06ef3cbb052b142f9660c2c01e7aeb401300c]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ BaseTools/Source/C/EfiRom/EfiRom.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/BaseTools/Source/C/EfiRom/EfiRom.c b/BaseTools/Source/C/EfiRo=
m/EfiRom.c
+index fa7bf0e62e..6e903b3504 100644
+--- a/BaseTools/Source/C/EfiRom/EfiRom.c
++++ b/BaseTools/Source/C/EfiRom/EfiRom.c
+@@ -44,7 +44,6 @@ Returns:
+   FILE_LIST *FList;=0D
+   UINT32    TotalSize;=0D
+   UINT32    Size;=0D
+-  CHAR8     *Ptr0;=0D
+ =0D
+   SetUtilityName(UTILITY_NAME);=0D
+ =0D
+@@ -75,7 +74,7 @@ Returns:
+   //=0D
+   if (mOptions.DumpOption =3D=3D 1) {=0D
+     if (mOptions.FileList !=3D NULL) {=0D
+-      if ((Ptr0 =3D strstr ((CONST CHAR8 *) mOptions.FileList->FileName, =
DEFAULT_OUTPUT_EXTENSION)) !=3D NULL) {=0D
++      if (strstr ((CONST CHAR8 *) mOptions.FileList->FileName, DEFAULT_OU=
TPUT_EXTENSION) !=3D NULL) {=0D
+         DumpImage (mOptions.FileList);=0D
+         goto BailOut;=0D
+       } else {=0D
diff --git a/meta/recipes-core/ovmf/ovmf/0008-BaseTools-Pccts-set-C-standar=
d.patch b/meta/recipes-core/ovmf/ovmf/0008-BaseTools-Pccts-set-C-standard.p=
atch
new file mode 100644
index 00000000000..de4ccb8a47d
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0008-BaseTools-Pccts-set-C-standard.patch
@@ -0,0 +1,44 @@
+From 74bc6545e72707a47dd9dae42ce33b8877b10000 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Mon, 20 Jan 2025 09:40:31 +0100
+Subject: [PATCH] BaseTools/Pccts: set C standard
+
+The prehistoric code base doesn't build with ISO C23.  Set the C
+standard to C11 (for both clang and gcc) so it continues to build with
+gcc 15 (which uses C23 by default).
+
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport [edk2-stable202502 https://github.com/tianocore/=
edk2/commit/e063f8b8a53861043b9872cc35b08a3dc03b0942]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ BaseTools/Source/C/VfrCompile/Pccts/antlr/makefile | 2 +-
+ BaseTools/Source/C/VfrCompile/Pccts/dlg/makefile   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/BaseTools/Source/C/VfrCompile/Pccts/antlr/makefile b/BaseTool=
s/Source/C/VfrCompile/Pccts/antlr/makefile
+index 746d58b5e2..b47c8a37af 100644
+--- a/BaseTools/Source/C/VfrCompile/Pccts/antlr/makefile
++++ b/BaseTools/Source/C/VfrCompile/Pccts/antlr/makefile
+@@ -169,7 +169,7 @@ ANTLR=3D${BIN_DIR}/antlr
+ DLG=3D${BIN_DIR}/dlg=0D
+ OBJ_EXT=3Do=0D
+ OUT_OBJ =3D -o=0D
+-CFLAGS=3D $(COPT) -I. -I$(SET) -I$(PCCTS_H) -DUSER_ZZSYN $(COTHER) -DZZLE=
XBUFSIZE=3D65536=0D
++CFLAGS=3D $(COPT) -I. -I$(SET) -I$(PCCTS_H) -DUSER_ZZSYN $(COTHER) -DZZLE=
XBUFSIZE=3D65536 -std=3Dgnu11=0D
+ CPPFLAGS=3D=0D
+ #=0D
+ # SGI Users, use this CFLAGS=0D
+diff --git a/BaseTools/Source/C/VfrCompile/Pccts/dlg/makefile b/BaseTools/=
Source/C/VfrCompile/Pccts/dlg/makefile
+index e45ac98e04..d72bee3d70 100644
+--- a/BaseTools/Source/C/VfrCompile/Pccts/dlg/makefile
++++ b/BaseTools/Source/C/VfrCompile/Pccts/dlg/makefile
+@@ -123,7 +123,7 @@ endif
+ COPT=3D-O=0D
+ ANTLR=3D${BIN_DIR}/antlr=0D
+ DLG=3D${BIN_DIR}/dlg=0D
+-CFLAGS=3D $(COPT) -I. -I$(SET) -I$(PCCTS_H) -DUSER_ZZSYN -DZZLEXBUFSIZE=
=3D65536=0D
++CFLAGS=3D $(COPT) -I. -I$(SET) -I$(PCCTS_H) -DUSER_ZZSYN -DZZLEXBUFSIZE=
=3D65536 -std=3Dgnu11=0D
+ CPPFLAGS=3D=0D
+ OBJ_EXT=3Do=0D
+ OUT_OBJ =3D -o=0D
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index 319f03a8d2a..badde30d97e 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -26,6 +26,9 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://0004-reproducible.patch \
            file://0001-MdePkg-Fix-overflow-issue-in-BasePeCoffLib.patch \
            file://0001-MdeModulePkg-Potential-UINT32-overflow-in-S3-Resume=
C.patch \
+           file://0006-BaseTools-StringFuncs-fix-gcc-16-warning.patch \
+           file://0007-BaseTools-EfiRom-fix-compiler-warning.patch \
+           file://0008-BaseTools-Pccts-set-C-standard.patch \
            "
=20
 PV =3D "edk2-stable202402"

