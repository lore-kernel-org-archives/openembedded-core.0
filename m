Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD76F44879
	for <webhook@archiver.kernel.org>; Sun, 12 Apr 2026 09:36:54 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.234773.1775986604152091247
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 02:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EVx+n+VX;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cf8d550bdso3413168f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 02:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775986602; x=1776591402; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c3tfw3pt15h9/p2jDi9qlXZ9V8Zk0H7A6r674s817GM=;
        b=EVx+n+VXW8Mwf5e68klcaAZi84iCP3tiiVy63N/7+hFyItb4DRMyTeFgoo+YGfYL6e
         FD4VNHz35vRyZFcPKt+oCTpL7Sv1/CZ6iv0zx+YJuCIstSHmRd1kXwFUM4zhut8mAnIf
         qFttmgsD+LRx8ww9KeaFWQI1DsiAXjd/VgsOOu2aRyP8cKm2k6LAvfJK0NFG7JNjj7iX
         qFEOryyKp+U2VnE4QrLow6I7J1VHb92bSMCNvh5ulSGt91cq5qSRZNh8BS7z29939G8s
         5BU8tu182q1VITWQ14L5mWlk34Mocv9OCjVhFUpQecCSPVgsasmx5c1pyt3VOTvqgKdk
         kPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775986602; x=1776591402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3tfw3pt15h9/p2jDi9qlXZ9V8Zk0H7A6r674s817GM=;
        b=O+Cz7rTuIVoDeDAmsJxbtmnYt+x75cwtBHBW4nBs/3cStZafm9b/YMjR//pXcvU2xS
         BvE2MRHR3bKC3eMrLGIPGEF0dre1OBCGWN6JdYz0JVln/f0lKQ8OwUqhTuglONjWjtOX
         hRVaNr0X6TLAwHjtPu63AltwDmclSDRP+fWY1ci1kc0Sv2FWSPaftxqIJjo/AxoJsaSw
         j/8yebapwW1W0IBGUBw/kBq6/BxXS9/mxm77RIVc5kS0odwzdHqaKjURTrBNHdP4pzKv
         q6D0DIaB2VK/chychc3hxF9JhvCYIphH17s9f5y4tdBFfnE9JDwBoMl6Z0SRIbR7R5US
         6N1g==
X-Gm-Message-State: AOJu0YxhI+d85tsd6pbWIBZa11kyzlPXm8lbi2vx6JoJqRWC5rQ7cRVG
	/fyB5b2TyCpvJTz7DOyLcnKzptDQ9ZzPr8tJKlpZy0tnPDMjixRv5ntiIdx1Sw==
X-Gm-Gg: AeBDiesJZ25/MzAqwp+zWGz/nMhBB26tk7HR5xwvIEuxl7Gq+hH1CAPVrjh2pnIMLGL
	G3VDkssPr01VJt2eErSIc/D2eKNhYJYfAxhgL2oR5Els++Un3wKHk332xEZ+RgJD3Js/K3si8oa
	Y6dcukQEz7VGHBQ43aB5/D5vXf495EohUjqb36cFPcGHvc6qDoqWfaA0y13ZeyyK3+IolHTLjcH
	u1cQXTqrVMNuv3eEvn7kp/gJBSq5nuFCsbXlwfyx5i5/+nTP75mg0rz8GbAfcKL7Upf+30BgVHT
	POXYXZdcNbpxiZH0tFTwsy/KA7cgsTP1UzoWhLXRQSsfxpqFMutZpweqwV7HkOcJfbrarqPnhC1
	nkkpyFM0BwDX/uzCDfXzB/ROpyia9LNWFaUSD4kyvNH746/i+DXuOr0oyrAZvc9xCAG3NC7PD2o
	S/28ES/FM92f9bGdje0RKxJeC5lUeM4MAVTx+/SIRAarR11EIyvDUpMJgc9GqcvomHjLcIH9GMS
	uMPzU1R0w==
X-Received: by 2002:a5d:64e9:0:b0:43d:76d8:5794 with SMTP id ffacd0b85a97d-43d76d8593emr1229708f8f.36.1775986602362;
        Sun, 12 Apr 2026 02:36:42 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5ccdasm24488432f8f.34.2026.04.12.02.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 02:36:41 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [whinlatter][PATCH] ovmf: backport a fix for build with gcc-16
Date: Sun, 12 Apr 2026 11:36:37 +0200
Message-ID: <20260412093637.819659-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 09:36:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235059

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
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index 577310a678..bf41bbbf6e 100644
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

