Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 289E7778DB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 14:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2BEox9U021377; Sat, 11 Mar 2017 14:50:59 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zCdEOAcMUk1t; Sat, 11 Mar 2017 14:50:59 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2BEougV021371
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 11 Mar 2017 14:50:57 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cmiMC-0005BI-FU; Sat, 11 Mar 2017 14:50:56 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 11 Mar 2017 14:50:53 +0000
Message-Id: <1489243854-19877-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] u-boot-mkimage: Fix use of 'cc' instead of BUILD_CC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 11 Mar 2017 14:51:02 -0000

OE needs to be able to change the default compiler. If we pass in HOSTCC
through the make command, it overwrites not only this setting but also the
setting in tools/Makefile wrapped in ifneq ($(CROSS_BUILD_TOOLS),) which
breaks the build.

We therefore add a way of changing the default in the top level Makefile
without interfering with the other setting.

I've emailed this workaround to Masahiro Yamada for discussion.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/u-boot/files/default-gcc.patch   | 25 +++++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb |  4 +++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/default-gcc.patch

diff --git a/meta/recipes-bsp/u-boot/files/default-gcc.patch b/meta/recipes-bsp/u-boot/files/default-gcc.patch
new file mode 100644
index 0000000..76d192e
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/default-gcc.patch
@@ -0,0 +1,25 @@
+OE needs to be able to change the default compiler. If we pass in HOSTCC
+through the make command, it overwrites not only this setting but also the 
+setting in tools/Makefile wrapped in ifneq ($(CROSS_BUILD_TOOLS),) which 
+breaks the build.
+
+We therefore add a way of changing the default in the top level Makefile 
+without interfering with the other setting.
+
+Upstream-Status: Submitted [emailed to Masahiro Yamada for discussion]
+RP 2017/3/11
+
+Index: git/Makefile
+===================================================================
+--- git.orig/Makefile
++++ git/Makefile
+@@ -254,7 +254,8 @@ CONFIG_SHELL := $(shell if [ -x "$$BASH"
+ 	  else if [ -x /bin/bash ]; then echo /bin/bash; \
+ 	  else echo sh; fi ; fi)
+ 
+-HOSTCC       = cc
++DEFAULTHOSTCC = cc
++HOSTCC       = $(DEFAULTHOSTCC)
+ HOSTCXX      = c++
+ HOSTCFLAGS   = -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer \
+ 		$(if $(CONFIG_TOOLS_DEBUG),-g)
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
index c110226..9b5772e 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
@@ -1,9 +1,11 @@
 require u-boot-common_${PV}.inc
 
+SRC_URI += "file://default-gcc.patch"
+
 SUMMARY = "U-Boot bootloader image creation tool"
 DEPENDS = "openssl"
 
-EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" STRIP=true V=1'
+EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" DEFAULTHOSTCC="${BUILD_CC}" STRIP=true V=1'
 EXTRA_OEMAKE_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
 EXTRA_OEMAKE_class-nativesdk = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
 
-- 
2.7.4


