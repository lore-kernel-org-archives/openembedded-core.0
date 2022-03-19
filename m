Return-Path: <bero@lindev.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F0EC433F5
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 16:55:53 +0000 (UTC)
Received: from mail.lindev.ch (mail.lindev.ch [5.39.83.55])
 by mx.groups.io with SMTP id smtpd.web08.9237.1647708952053756091
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 09:55:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@lindev.ch header.s=dkim header.b=QhSTe3A1;
 spf=pass (domain: lindev.ch, ip: 5.39.83.55, mailfrom: bero@lindev.ch)
Received: from c64.fritz.box (unknown [81.221.122.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: bero@lindev.ch)
	by mail.lindev.ch (Postfix) with ESMTPSA id 88AB141002FA;
	Sat, 19 Mar 2022 17:55:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lindev.ch; s=dkim;
	t=1647708948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OiIpj/D062qtOjjd1M9Kebg3TU4pZGQR2OTOKSzkf38=;
	b=QhSTe3A1MpGF0QeFsIKuIcQEtQuURextDbecf3/RZMkL9fjEs4RQVOqLBEgK4MWmLGeJLB
	5bRmWfIj7/NjyS08PMX8z8FGnQfoJwDWRmngjYSVRlIAQnmbFo7L7Pramd+/3FVpac1KeL
	C/yCZaZsgzjx5jhD21Lg1hkngB5HjZo=
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@lindev.ch>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?=
 <bernhard.rosenkraenzer.ext@huawei.com>
Subject: [PATCH] recipes-core/ovmf: Fix build with gcc 12
Date: Sat, 19 Mar 2022 17:55:38 +0100
Message-Id: <20220319165538.510074-1-bero@lindev.ch>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Mar 2022 16:55:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163472

From: Bernhard Rosenkr=C3=A4nzer <bernhard.rosenkraenzer.ext@huawei.com>

edk2 doesn't compile with gcc 12 - due to 2 legitimate bugs (trying to
use a file handle as if it were a string) and 2 new warnings in code
using -Werror (they need further investigation to determine if they're
legitimate bugs or false positives; in the mean time we can keep things
building by disabling the warnings for the particular lines triggering
them).

The proper fixes have already been submitted upstream at
https://github.com/tianocore/edk2/pull/2602
Will not submit the workarounds for the warnings upstream for now.

Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bernhard.rosenkraenzer.ext@huawe=
i.com>
---
 ...nfusion-between-file-handle-and-name.patch | 44 +++++++++++++++++++
 ...orkaround-for-gcc-12-build-failure-2.patch | 33 ++++++++++++++
 ...-workaround-for-gcc-12-build-failure.patch | 28 ++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  3 ++
 4 files changed, 108 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/edk2-fix-confusion-between-=
file-handle-and-name.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/edk2-workaround-for-gcc-12-=
build-failure-2.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/edk2-workaround-for-gcc-12-=
build-failure.patch

diff --git a/meta/recipes-core/ovmf/ovmf/edk2-fix-confusion-between-file-ha=
ndle-and-name.patch b/meta/recipes-core/ovmf/ovmf/edk2-fix-confusion-betwee=
n-file-handle-and-name.patch
new file mode 100644
index 0000000000..98023f93c2
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/edk2-fix-confusion-between-file-handle-an=
d-name.patch
@@ -0,0 +1,44 @@
+From 74e7ad4e400ea3f942805e70df4d3ed6990759f3 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Bernhard=3D20Rosenkr=3DC3=3DA4nzer?=3D <bero@lindev.ch>
+Date: Tue, 8 Mar 2022 18:56:23 +0100
+Subject: [PATCH] GenFfs: Don't treat a file handle as a string
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The current code tries to print the file handle as a string on error.
+Do what it is meant to do instead: Print the file name.
+
+Upstream-Status: Submitted [https://github.com/tianocore/edk2/pull/2602]
+Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bero@lindev.ch>
+---
+ BaseTools/Source/C/GenFfs/GenFfs.c | 2 +-
+ BaseTools/Source/C/GenSec/GenSec.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/BaseTools/Source/C/GenFfs/GenFfs.c b/BaseTools/Source/C/GenFf=
s/GenFfs.c
+index 949025c33325..06e009e279ce 100644
+--- a/BaseTools/Source/C/GenFfs/GenFfs.c
++++ b/BaseTools/Source/C/GenFfs/GenFfs.c
+@@ -542,7 +542,7 @@ GetAlignmentFromFile(char *InFile, UINT32 *Alignment)
+   PeFileBuffer =3D (UINT8 *) malloc (PeFileSize);=0D
+   if (PeFileBuffer =3D=3D NULL) {=0D
+     fclose (InFileHandle);=0D
+-    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s",=
 InFileHandle);=0D
++    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s",=
 InFile);=0D
+     return EFI_OUT_OF_RESOURCES;=0D
+   }=0D
+   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);=0D
+diff --git a/BaseTools/Source/C/GenSec/GenSec.c b/BaseTools/Source/C/GenSe=
c/GenSec.c
+index d54a4f9e0a7d..1ad92de1d50e 100644
+--- a/BaseTools/Source/C/GenSec/GenSec.c
++++ b/BaseTools/Source/C/GenSec/GenSec.c
+@@ -1062,7 +1062,7 @@ GetAlignmentFromFile(char *InFile, UINT32 *Alignment)
+   PeFileBuffer =3D (UINT8 *) malloc (PeFileSize);=0D
+   if (PeFileBuffer =3D=3D NULL) {=0D
+     fclose (InFileHandle);=0D
+-    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s",=
 InFileHandle);=0D
++    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s",=
 InFile);=0D
+     return EFI_OUT_OF_RESOURCES;=0D
+   }=0D
+   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);=0D
diff --git a/meta/recipes-core/ovmf/ovmf/edk2-workaround-for-gcc-12-build-f=
ailure-2.patch b/meta/recipes-core/ovmf/ovmf/edk2-workaround-for-gcc-12-bui=
ld-failure-2.patch
new file mode 100644
index 0000000000..e7b7269d82
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/edk2-workaround-for-gcc-12-build-failure-=
2.patch
@@ -0,0 +1,33 @@
+From: Bernhard Rosenkr=C3=A4nzer <bernhard.rosenkraenzer.ext@huawei.com>
+Date: Fri, 18 Mar 2022 17:28:47 +0100
+Subject: [PATCH] Disable gcc >=3D 12 stringop-overflow warning
+
+gcc 12 warns about a stringop-overflow with SetDevicePathEndNode
+potentially copying 4 bytes to an area of 1 byte.
+Since edk2 is built with -Werror, this breaks the build.
+
+It is not immedaitely clear whether this is a false warning or if
+SetDevicePathEndNode is being used incorrectly somewhere, but since
+the code seems to work, ignore the warning for the time being to
+keep things buildable.
+
+This should be investigated properly at some point.
+
+Upstream-Status: Inappropriate [Workaround to keep things going, should be=
 fixed properly]
+Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bernhard.rosenkraenzer.ext@huaw=
ei.com>
+
+diff --git a/BaseTools/Source/C/DevicePath/DevicePathUtilities.c b/BaseToo=
ls/Source/C/DevicePath/DevicePathUtilities.c
+index 2ffefa8cee..32c02bdf82 100644
+--- a/BaseTools/Source/C/DevicePath/DevicePathUtilities.c
++++ b/BaseTools/Source/C/DevicePath/DevicePathUtilities.c
+@@ -318,7 +318,10 @@ SetDevicePathEndNode (
+   )=0D
+ {=0D
+   ASSERT (Node !=3D NULL);=0D
++#pragma GCC diagnostic push=0D
++#pragma GCC diagnostic ignored "-Wstringop-overflow"=0D
+   memcpy (Node, &mUefiDevicePathLibEndDevicePath, sizeof (mUefiDevicePath=
LibEndDevicePath));=0D
++#pragma GCC diagnostic pop=0D
+ }=0D
+ =0D
+ /**=0D
diff --git a/meta/recipes-core/ovmf/ovmf/edk2-workaround-for-gcc-12-build-f=
ailure.patch b/meta/recipes-core/ovmf/ovmf/edk2-workaround-for-gcc-12-build=
-failure.patch
new file mode 100644
index 0000000000..048112e3fc
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/edk2-workaround-for-gcc-12-build-failure.=
patch
@@ -0,0 +1,28 @@
+From: Bernhard Rosenkr=C3=A4nzer <bernhard.rosenkraenzer.ext@huawei.com>
+Date: Fri, 18 Mar 2022 17:28:47 +0100
+Subject: [PATCH] Disable gcc >=3D 12 dangling-pointer warning
+
+gcc 12 warns about a pointer into outStream being preserved after outStream
+goes out of scope. Since edk2 is built with -Werror, this breaks the build.
+
+This exact use happens to work with all compilers currently used,
+so ignore the warning for the time being to keep things buildable.
+
+Upstream-Status: Inappropriate [Workaround to keep things going, should be=
 fixed properly]
+Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bernhard.rosenkraenzer.ext@huaw=
ei.com>
+
+diff --git a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c b/BaseTools/S=
ource/C/LzmaCompress/Sdk/C/LzmaEnc.c
+index 4e9b499f8d..5f0e75eeda 100644
+--- a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
++++ b/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
+@@ -2825,7 +2825,10 @@ SRes LzmaEnc_CodeOneMemBlock(CLzmaEncHandle pp, Boo=
lInt reInit,
+ =0D
+   nowPos64 =3D p->nowPos64;=0D
+   RangeEnc_Init(&p->rc);=0D
++#pragma GCC diagnostic push=0D
++#pragma GCC diagnostic ignored "-Wdangling-pointer"=0D
+   p->rc.outStream =3D &outStream.vt;=0D
++#pragma GCC diagnostic pop=0D
+ =0D
+   if (desiredPackSize =3D=3D 0)=0D
+     return SZ_ERROR_OUTPUT_EOF;=0D
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index b15d40eac8..5f255b46b2 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -21,6 +21,9 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://0003-ovmf-Update-to-latest.patch \
            file://0005-debug-prefix-map.patch \
            file://0006-reproducible.patch \
+           file://edk2-fix-confusion-between-file-handle-and-name.patch \
+           file://edk2-workaround-for-gcc-12-build-failure.patch \
+           file://edk2-workaround-for-gcc-12-build-failure-2.patch
            "
=20
 PV =3D "edk2-stable202202"
--=20
2.35.1


