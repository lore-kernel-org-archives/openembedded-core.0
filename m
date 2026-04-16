Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 563E0F8806B
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:42 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7587.1776322120228954561
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2le0kczn;
 spf=pass (domain: smile.fr, ip: 209.85.221.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-43eb05b1875so434919f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322118; x=1776926918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dnyQthd4W5Spmw+L7gS3Gbq370V6fdiXpTS+X67Gxc4=;
        b=2le0kcznU0aTyDX+GuKhW6a/muYIZz7KjvtRB9RXnSfeLPp7v4iJGFdZHsB4SCR6St
         q1wUeBCz5UXqGITLcR49tesabZ5wy4iBL8ByR0rAe5/ze187ZA3RjeRvFK+OD2tw/bo9
         o2/vGzlrF02G7ElZADGiryiti6WBEdHjIA9g8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322118; x=1776926918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dnyQthd4W5Spmw+L7gS3Gbq370V6fdiXpTS+X67Gxc4=;
        b=pOAQrM6ze9XHPm6llDwBCx+OfV4oWQmiO7LzJ91ARgGoCFVU96HsOAcmAWToAAKE2+
         zqA1BE+JUCk8Z8djVl42jHm8TubUg/QKsgfQUFOdoZljpE+ejj85NaT+s+VKiXOg7843
         tVqo45OjDPz+jEB90bwuEubpf0lC/e53lc6ClDr5XN4wcXiqBglJuT0lwck9SH1oNPU+
         S6Y3YWSd8whaRkaYFh0pbTY515PVOsl5x++DPJQGGcfkl27QNsOsO3gg1iADdw/inYZl
         W86NaI2ltzhaWKzFvb5mP0R7/QidQqni4GvYjcdxowndxaiWTpwxmeHlk45vRl8DszDF
         kZkg==
X-Gm-Message-State: AOJu0YzMjYKHiYQ+uZYZVm2i3pqwGe4Y7nTO4F4HMK5Loj7SGxr7/vcB
	z1U9pG+PciVlvZosQEekS5mahcl1PywbVeM4i1uCH3lvYfZ4mlyy1Zyk2MG4FhnqqeCIj6WQmTw
	8Ts8HjzkM6tpH
X-Gm-Gg: AeBDieuQ98pERAFS9UOQWs/kUBhaKkZJtmF7VIsy0Au1WnEfD4ufX57JMIsEqQ58aPu
	bFkqUL50h8AVF+FIvFfj4L9c+Hz6b/08f3Ly7XozL3wUkvvlDn8C1LcOke1UCG03XeRCLPWN2td
	xaLCrXzDsRYMHuE7+ZcV+lOq3JvIJDFf8shH/vXjvu/tQYo/eY6gdAEXSVLq9YQFPXRyTbv2KYX
	705ZLMeyJVzkjYpX8SdeoRVihgFfY8SUsv0TUNO5NivJQWwz2u5O7fPPXR7/FoECK6xXIg8F44H
	uxydeUtpbPO4DINdlPyPBAzmE7BILs1x0rEeG+jd5l3Jn7PlEHedQgS42gooUByrsga45CWOLVo
	Sbn3y7/X8Kg356s2xvgxYl7YpLfpgBS5/WI5joBWWhd/W57FAvf0XhKlUc54eim5oSBD8cYOcwq
	8GZ438TCT1piAoXdBPrF77M/0SOpFniVGgGQDK+VN7JSFTkB6SCbSUEmpW/awrEwfiX2pxc1+yX
	rRH0spqZyNoGBhh9TCHa/7MJVJceVM9KLRy/g==
X-Received: by 2002:a05:6000:603:b0:43d:77ad:ebee with SMTP id ffacd0b85a97d-43d77adee92mr24583324f8f.9.1776322118275;
        Wed, 15 Apr 2026 23:48:38 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:37 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 31/47] ovmf: backport a fix for build with gcc-16
Date: Thu, 16 Apr 2026 08:47:32 +0200
Message-ID: <ca1f42f9dca8c068bf1df0d9d052329b4dc0d666.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235373

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

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...Tools-StringFuncs-fix-gcc-16-warning.patch | 42 ++++++++++++++++++
 ...aseTools-EfiRom-fix-compiler-warning.patch | 44 +++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  2 +
 3 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0006-BaseTools-StringFuncs-=
fix-gcc-16-warning.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0007-BaseTools-EfiRom-fix-c=
ompiler-warning.patch

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
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index 577310a6782..bf41bbbf6e9 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -25,6 +25,8 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps;ta
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake=
.patch \
            file://0003-debug-prefix-map.patch \
            file://0004-reproducible.patch \
+           file://0006-BaseTools-StringFuncs-fix-gcc-16-warning.patch \
+           file://0007-BaseTools-EfiRom-fix-compiler-warning.patch \
            "
=20
 PV =3D "edk2-stable202508"

