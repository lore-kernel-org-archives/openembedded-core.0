Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A3EDE6025E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 09:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2D9pJ9O002587; Mon, 13 Mar 2017 09:51:19 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yJIXm6m42az9; Mon, 13 Mar 2017 09:51:19 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2D9pGlp002584
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 13 Mar 2017 09:51:17 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cnMdI-0000rZ-5e; Mon, 13 Mar 2017 09:51:16 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Mar 2017 09:51:15 +0000
Message-Id: <1489398675-3275-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] u-boot: Update patch to match upstream
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
X-List-Received-Date: Mon, 13 Mar 2017 09:51:31 -0000

After discussions with upstream this version of the patch was proposed
and is being submitted to upstream u-boot. Update to that version
(which is better than my workaround).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/u-boot/files/default-gcc.patch   | 42 +++++++++++++++--------
 meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb |  2 +-
 2 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/files/default-gcc.patch b/meta/recipes-bsp/u-boot/files/default-gcc.patch
index 76d192e..04184df 100644
--- a/meta/recipes-bsp/u-boot/files/default-gcc.patch
+++ b/meta/recipes-bsp/u-boot/files/default-gcc.patch
@@ -3,23 +3,37 @@ through the make command, it overwrites not only this setting but also the
 setting in tools/Makefile wrapped in ifneq ($(CROSS_BUILD_TOOLS),) which 
 breaks the build.
 
-We therefore add a way of changing the default in the top level Makefile 
-without interfering with the other setting.
+We therefore use override to ensure the value of HOSTCC is overwritten when
+needed.
+
+RP: Updated the patch to the version being submitted to upstream u-boot
 
 Upstream-Status: Submitted [emailed to Masahiro Yamada for discussion]
 RP 2017/3/11
 
-Index: git/Makefile
+Index: git/tools/Makefile
+===================================================================
+--- git.orig/tools/Makefile
++++ git/tools/Makefile
+@@ -262,7 +262,7 @@ $(LICENSE_H): $(obj)/bin2header $(srctre
+ subdir- += env
+ 
+ ifneq ($(CROSS_BUILD_TOOLS),)
+-HOSTCC = $(CC)
++override HOSTCC = $(CC)
+ 
+ quiet_cmd_crosstools_strip = STRIP   $^
+       cmd_crosstools_strip = $(STRIP) $^; touch $@
+Index: git/tools/env/Makefile
 ===================================================================
---- git.orig/Makefile
-+++ git/Makefile
-@@ -254,7 +254,8 @@ CONFIG_SHELL := $(shell if [ -x "$$BASH"
- 	  else if [ -x /bin/bash ]; then echo /bin/bash; \
- 	  else echo sh; fi ; fi)
+--- git.orig/tools/env/Makefile
++++ git/tools/env/Makefile
+@@ -8,7 +8,7 @@
+ # fw_printenv is supposed to run on the target system, which means it should be
+ # built with cross tools. Although it may look weird, we only replace "HOSTCC"
+ # with "CC" here for the maximum code reuse of scripts/Makefile.host.
+-HOSTCC = $(CC)
++override HOSTCC = $(CC)
  
--HOSTCC       = cc
-+DEFAULTHOSTCC = cc
-+HOSTCC       = $(DEFAULTHOSTCC)
- HOSTCXX      = c++
- HOSTCFLAGS   = -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer \
- 		$(if $(CONFIG_TOOLS_DEBUG),-g)
+ # Compile for a hosted environment on the target
+ HOST_EXTRACFLAGS  = $(patsubst -I%,-idirafter%, $(filter -I%, $(UBOOTINCLUDE))) \
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
index 9b5772e..1aa95e7 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
@@ -5,7 +5,7 @@ SRC_URI += "file://default-gcc.patch"
 SUMMARY = "U-Boot bootloader image creation tool"
 DEPENDS = "openssl"
 
-EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" DEFAULTHOSTCC="${BUILD_CC}" STRIP=true V=1'
+EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
 EXTRA_OEMAKE_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
 EXTRA_OEMAKE_class-nativesdk = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
 
-- 
2.7.4


