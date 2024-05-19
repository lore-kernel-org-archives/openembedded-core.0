Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA659C25B75
	for <webhook@archiver.kernel.org>; Sun, 19 May 2024 05:48:06 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.33220.1716097686553463808
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 May 2024 22:48:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from localhost.localdomain (unknown [37.19.221.174])
	by linux.microsoft.com (Postfix) with ESMTPSA id 3C2492054203;
	Sat, 18 May 2024 22:48:05 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3C2492054203
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH 1/4] newlib: Use mcmodel=medany for RISCV64
Date: Sat, 18 May 2024 23:50:47 -0600
Message-ID: <20240519055050.2331637-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 May 2024 05:48:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199544

It was previously discovered that mcmodel=3Dmedany should be used for RIS=
CV64,
however this was only being set for the applications themselves, but not =
for
newlib, this meant that we ended up with C library that used a code model=
 and
an application that used another one which is not something we want.

Pass mcmodel=3Dmedany when building newlib for RISCV64 as well.

Also, s/CFLAGS/TARGET_CFLAGS to standarize across recipes, the variable
expansion provides no functional difference at this point.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 meta/classes-recipe/baremetal-image.bbclass | 2 +-
 meta/recipes-core/newlib/newlib.inc         | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/baremetal-image.bbclass b/meta/classes-r=
ecipe/baremetal-image.bbclass
index b9a584351a..4e7d413626 100644
--- a/meta/classes-recipe/baremetal-image.bbclass
+++ b/meta/classes-recipe/baremetal-image.bbclass
@@ -103,7 +103,7 @@ QB_OPT_APPEND:append:qemuriscv32 =3D " -bios none"
 # since medlow can only access addresses below 0x80000000 and RAM
 # starts at 0x80000000 on RISC-V 64
 # Keep RISC-V 32 using -mcmodel=3Dmedlow (symbols lie between -2GB:2GB)
-CFLAGS:append:qemuriscv64 =3D " -mcmodel=3Dmedany"
+TARGET_CFLAGS:append:qemuriscv64 =3D " -mcmodel=3Dmedany"
=20
=20
 ## Emulate image.bbclass
diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newl=
ib/newlib.inc
index 6113f5e831..34b0f3f747 100644
--- a/meta/recipes-core/newlib/newlib.inc
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -28,6 +28,14 @@ B =3D "${WORKDIR}/build"
 ## disable stdlib
 TARGET_CC_ARCH:append =3D " -nostdlib"
=20
+# Both the C library and the application should share the same mcmodel.
+# Use the medium-any code model for the RISC-V 64 bit implementation,
+# since medlow can only access addresses below 0x80000000 and RAM
+# starts at 0x80000000 on RISC-V 64
+# Keep RISC-V 32 using -mcmodel=3Dmedlow (symbols lie between -2GB:2GB)
+TARGET_CFLAGS:append:qemuriscv64 =3D " -mcmodel=3Dmedany"
+
+
 EXTRA_OECONF =3D " \
                 --build=3D${BUILD_SYS}  \
                 --target=3D${TARGET_SYS} \
--=20
2.45.1


