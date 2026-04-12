Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E6BAF44859
	for <webhook@archiver.kernel.org>; Sun, 12 Apr 2026 09:36:44 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.234298.1775986593937371074
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 02:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nmzg7z7b;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d7605ec91so169613f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 02:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775986592; x=1776591392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M9Izu+5O7H7082eQLXsZe3nBvkdyJYQGyVW1AUXihZA=;
        b=nmzg7z7bwAABx6a9UfEbWGiXevXWSabwKA2YTMOC92ZEY1lWtMll4wwMOYqFenL8xE
         PXqR4opFVucryKVy96qpvxCsHOHkz0bxbVQPXPan7RHF2n9bx9iHIEaTfk9i0jvuZI01
         x5G/W0WwX6hO1il9Nrq7A1Ou5+FEwt3SSlvpbS9XXqHZ7gnK7uEbbGdigwQJcrarNwJj
         iKwkv1t3EhFUTIQ67MfXYvvrZAE6cDyAY2jRA3tAQMeB0ZBr4pswaj1EzQP3JLj+nRuk
         ZJa7AfxbWrCmYajEV02tOoVLzFisNgim2i7ziHIIMjxtdX76YkEDjIJ6ziK3VzVThIDy
         HmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775986592; x=1776591392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9Izu+5O7H7082eQLXsZe3nBvkdyJYQGyVW1AUXihZA=;
        b=j/S6Ei08F9LhRUO53+6vA3QHsa+7u3xAIelv1bIa29ALtO/XkMa0ws370k08mddFsi
         qXpX+KbPI0aZM35XeNIVvBopbXQGmLY13wMKEbr1ucd8Lj+dQ4ELbSLmMO81+11z7Fuy
         3uvshKBIDzpdS6O6VPElRguZyIfKbFOQc0YhIzCGYEduPx2ssZ7qmg/tRgyWSBFKS9/m
         /aJKH/a+Up6/8c0nlKemJahdfIW5S43LzsLGbrppqNLaUDmY579bXv5O3ejqgV9tM6ly
         NowvQN87caSKY7+yTXhRaVLeQVigQrWq8s88skPZkgHASupEC0kPaw9Uf9Czvv49W77C
         Xarw==
X-Gm-Message-State: AOJu0YxMaWGrmeOzlcNH5jECb/q48iEAQuYBa6fVYmlYCzF6/4dnMmKV
	J+q/Fp15m8i7sYeLkDN5NWBVASpyXTrHSt1uksKnyojmQVMvgq/6vsunuAqbow==
X-Gm-Gg: AeBDiesAm+sfjHuLRxXQzVnhR8yxSGlFuEEaAq4PVeXaLTmr89X0f64k2QqNANo01R9
	TpEiQzODIhdj0SI4aha56LGAN239b5BtWr4lc7QuIdUaaedEEmufbGte9kPkjkuZmJiDrqEuqXv
	8SLr71YGzBCY3U7iAzh2CNHJjc9m8jKYrucsZ6/Gl9QFBf0QiMqjMkgzq8xK+ymWaBcECLBAWNt
	bGevEoOJ1DiEx7Vpay6ECkDgVy9AqF9LSqvWzEBPjVbOVhMOAkF7poUbLUm6z8kCF5JrqVxIUDL
	xdtgan4bQJfZh1QYaruCQxgOvu6BXZ2Ch+uRFpiL+AS4v9Lwj0mNO/2mTSAkTMnPO90UvGge6GP
	l3JT2OUW4WGS4sMxtRrsOjvRPjNM4YPmH7JvNOndRr9QTmSTzwxS51Zji3WNQLaosHAIupwEMxm
	4PvWB1OIpdJq414zvDMlIU42m6kwg89B3XH2p9ch7yXLMtNuwUKVPDAaBFQhWUYqQsiLbjwvfwE
	6rB2nOP2A==
X-Received: by 2002:a05:600c:64cd:b0:485:3cf3:1010 with SMTP id 5b1f17b1804b1-488d67df592mr130979105e9.2.1775986592118;
        Sun, 12 Apr 2026 02:36:32 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d58a8438sm227951975e9.5.2026.04.12.02.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 02:36:31 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH] ovmf: backport a fix for build with gcc-16
Date: Sun, 12 Apr 2026 11:36:29 +0200
Message-ID: <20260412093629.816730-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 09:36:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235058

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
index 0000000000..a465dede9c
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
index 0000000000..7aaafe6efb
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
index 0000000000..de4ccb8a47
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
index 319f03a8d2..badde30d97 100644
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

