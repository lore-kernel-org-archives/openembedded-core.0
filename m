Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7CF8C6FA82
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 13:02:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7241.1662555732899253604
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 06:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0A6C1042;
	Wed,  7 Sep 2022 06:02:18 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04B9E3F7B4;
	Wed,  7 Sep 2022 06:02:11 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/3] gcc: remove obsolete 0012-export-CPP.patch
Date: Wed,  7 Sep 2022 14:02:07 +0100
Message-Id: <20220907130207.2258074-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220907130207.2258074-1-ross.burton@arm.com>
References: <20220907130207.2258074-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 13:02:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170391

This patch is no longer needed, the upstream Makefile exports CPP from
CPP_FOR_BUILD since 12.1.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/gcc/gcc-12.2.inc        |  1 -
 .../gcc/gcc/0012-export-CPP.patch             | 50 -------------------
 2 files changed, 51 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0012-export-CPP.patch

diff --git a/meta/recipes-devtools/gcc/gcc-12.2.inc b/meta/recipes-devtoo=
ls/gcc/gcc-12.2.inc
index 572fd8b6692..7cc34b26215 100644
--- a/meta/recipes-devtools/gcc/gcc-12.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-12.2.inc
@@ -49,7 +49,6 @@ SRC_URI =3D "${BASEURI} \
            file://0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI=
.patch \
            file://0010-Use-the-multilib-config-files-from-B-instead-of-u=
sin.patch \
            file://0011-Avoid-using-libdir-from-.la-which-usually-points-=
to-.patch \
-           file://0012-export-CPP.patch \
            file://0013-Ensure-target-gcc-headers-can-be-included.patch \
            file://0014-Don-t-search-host-directory-during-relink-if-inst=
_pr.patch \
            file://0015-libcc1-fix-libcc1-s-install-path-and-rpath.patch =
\
diff --git a/meta/recipes-devtools/gcc/gcc/0012-export-CPP.patch b/meta/r=
ecipes-devtools/gcc/gcc/0012-export-CPP.patch
deleted file mode 100644
index 7e1ebef463a..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0012-export-CPP.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 20afebc61199cd74481b0b831c1b56465cd37fa0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 20 Feb 2015 09:40:59 +0000
-Subject: [PATCH] export CPP
-
-The OE environment sets and exports CPP as being the target gcc. When
-building gcc-cross-canadian for a mingw targetted sdk, the following can=
 be found
-in build.x86_64-pokysdk-mingw32.i586-poky-linux/build-x86_64-linux/libib=
erty/config.log:
-
-configure:3641: checking for _FILE_OFFSET_BITS value needed for large fi=
les
-configure:3666: gcc  -c -isystem/media/build1/poky/build/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  conftest.c >&5
-configure:3666: $? =3D 0
-configure:3698: result: no
-configure:3786: checking how to run the C preprocessor
-configure:3856: result: x86_64-pokysdk-mingw32-gcc -E --sysroot=3D/media=
/build1/poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw32
-configure:3876: x86_64-pokysdk-mingw32-gcc -E --sysroot=3D/media/build1/=
poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw32 conftest=
.c
-configure:3876: $? =3D 0
-
-Note this is a *build* target (in build-x86_64-linux) so it should be
-using the host "gcc", not x86_64-pokysdk-mingw32-gcc. Since the mingw32
-headers are very different, using the wrong cpp is a real problem. It is=
 leaking
-into configure through the CPP variable. Ultimately this leads to build
-failures related to not being able to include a process.h file for pem-u=
nix.c.
-
-The fix is to ensure we export a sane CPP value into the build
-environment when using build targets. We could define a CPP_FOR_BUILD va=
lue which may be
-the version which needs to be upstreamed but for now, this fix is good e=
nough to
-avoid the problem.
-
-RP 22/08/2013
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile.in b/Makefile.in
-index 1d9c83cc566..11819667751 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -152,6 +152,7 @@ BUILD_EXPORTS =3D \
- 	AR=3D"$(AR_FOR_BUILD)"; export AR; \
- 	AS=3D"$(AS_FOR_BUILD)"; export AS; \
- 	CC=3D"$(CC_FOR_BUILD)"; export CC; \
-+	CPP=3D"$(CC_FOR_BUILD) -E"; export CPP; \
- 	CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
- 	CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
- 	CPP=3D"$(CPP_FOR_BUILD)"; export CPP; \
--=20
2.34.1


