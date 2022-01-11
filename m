Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8076EC433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 02:50:42 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.1465.1641869441482191935
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 18:50:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182,
 mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-70-112-59-126.austin.res.rr.com
 [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id 2902D20B7179;
	Mon, 10 Jan 2022 18:50:40 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2902D20B7179
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] gcc-cross-canadian: Fix cross canadian compiler for baremetal
 targets
Date: Mon, 10 Jan 2022 19:50:30 -0700
Message-Id: <20220111025030.1428488-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 02:50:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160383

While building GCC it checks whether the include directory exists,
if it doesnt it throws an error and exits:

| The directory that should contain system headers does not exist:
| tmp/work/x86_64-nativesdk-pokysdk-linux/gcc-cross-canadian-riscv32/
    11.2.0-r0/recipe-sysroot/usr/include/
| make[1]: *** [Makefile:3257: stmp-fixinc] Error 1

Even though for the baremetal toolchain not having this directory
does make sense.

We overcame this by removing the --with-sysroot=3D/not/exist argument
for baremetal toolchains (via TARGET_OS override), however, the
newlib toolchain does have headers and an includedir, hence by fixing
the baremetal toolchain we broke the newlib one since it uses the same
TARGET_OS as baremetal, causing for example (on newlib):

/sdk/sysroots/x86_64-pokysdk-linux/usr/lib/riscv32-poky-elf/gcc/
    riscv32-poky-elf/11.2.0/include/stdint.h:9:16:
fatal error: stdint.h: No such file or directory

| # include_next <stdint.h>
                 ^~~~~~~~~~
compilation terminated.

By creating a dummy includedir, and removing the previous fix we
allow GCC to be built the same way, unifying the cross compiler
for all targets.

After this fix both TCLIBC=3Dbaremetal and TCLIBC=3Dnewlib SDKs work
properly.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/reci=
pes-devtools/gcc/gcc-cross-canadian.inc
index 495dd9070b..168486bd4e 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -45,6 +45,9 @@ export WINDRES_FOR_TARGET =3D "${TARGET_PREFIX}windres"
 export ARCH_FLAGS_FOR_TARGET =3D "--sysroot=3D${STAGING_DIR_TARGET}"
=20
 do_configure () {
+        if [ ! -d ${RECIPE_SYSROOT}/${target_includedir} ]; then
+            mkdir -p ${RECIPE_SYSROOT}/${target_includedir}
+        fi
 	export CC_FOR_BUILD=3D"${BUILD_CC}"
 	export CXX_FOR_BUILD=3D"${BUILD_CXX}"
 	export CFLAGS_FOR_BUILD=3D"${BUILD_CFLAGS}"
@@ -180,9 +183,6 @@ SYSTEMLIBS =3D "${target_base_libdir}/"
 SYSTEMLIBS1 =3D "${target_libdir}/"
=20
 EXTRA_OECONF +=3D "--enable-poison-system-directories"
-EXTRA_OECONF:remove:elf =3D "--with-sysroot=3D/not/exist"
-EXTRA_OECONF:remove:eabi =3D "--with-sysroot=3D/not/exist"
-EXTRA_OECONF:append:elf =3D " --without-headers --with-newlib"
-EXTRA_OECONF:append:eabi =3D " --without-headers --with-newlib"
+
 # gcc 4.7 needs -isystem
 export ARCH_FLAGS_FOR_TARGET =3D "--sysroot=3D${STAGING_DIR_TARGET} -isy=
stem=3D${target_includedir}"
--=20
2.25.1


