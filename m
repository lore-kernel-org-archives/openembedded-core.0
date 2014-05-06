Return-Path: <petter@technux.se>
Received: from vsp-authed-02-02.binero.net (vsp-authed02.binero.net
	[195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id 09FD166008
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 14:08:33 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-02-02.binero.net (Halon Mail Gateway) with ESMTPS;
	Tue,  6 May 2014 16:03:29 +0200 (CEST)
Received: from localhost.localdomain
	(host-90-236-146-96.mobileonline.telia.com [90.236.146.96])
	(Authenticated sender: petter@technux.se)
	by smtp-01-01.atm.binero.net (Postfix) with ESMTPSA id 76DAE3A1C8;
	Tue,  6 May 2014 16:03:19 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 May 2014 16:03:12 +0200
Message-Id: <2ddfd116517d43dc6b2a3578929dd342d5f0b4c9.1399384792.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1399384792.git.petter@technux.se>
References: <cover.1399384792.git.petter@technux.se>
Subject: [PATCH 1/1] x-load: remove recipe
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
X-List-Received-Date: Tue, 06 May 2014 14:08:34 -0000

From: Petter Mabacker <petter@technux.se>

x-load has been superseded by u-boot SPL for all cortex based TI SoCs.
For legacy boards meta-ti layer (that contains a maintained recipe)
should be used instead.

Signed-off-by: Petter Mabacker <petter@technux.se>
---
 .../x-load/x-load-git/beagleboard/name.patch       |   18 ---------
 meta/recipes-bsp/x-load/x-load.inc                 |   40 --------------------
 meta/recipes-bsp/x-load/x-load_git.bb              |   21 ----------
 3 files changed, 79 deletions(-)
 delete mode 100644 meta/recipes-bsp/x-load/x-load-git/beagleboard/name.patch
 delete mode 100644 meta/recipes-bsp/x-load/x-load.inc
 delete mode 100644 meta/recipes-bsp/x-load/x-load_git.bb

diff --git a/meta/recipes-bsp/x-load/x-load-git/beagleboard/name.patch b/meta/recipes-bsp/x-load/x-load-git/beagleboard/name.patch
deleted file mode 100644
index 29c26a9..0000000
--- a/meta/recipes-bsp/x-load/x-load-git/beagleboard/name.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: git/Makefile
-===================================================================
---- git.orig/Makefile
-+++ git/Makefile
-@@ -225,8 +225,9 @@ omap3evm_config :	unconfig
- overo_config :	unconfig
- 	@$(MKCONFIG) $(@:_config=) arm omap3 overo
- 
--omap3530beagle_config :    unconfig
--	@$(MKCONFIG) $(@:_config=) arm omap3 omap3530beagle
-+beagleboard_config :    unconfig
-+	@$(MKCONFIG) omap3530beagle arm omap3 omap3530beagle
-+	@./mkconfig omap3530beagle arm omap3 omap3530beagle
- 
- #########################################################################
- ## OMAP4 (ARM-CortexA9) Systems
diff --git a/meta/recipes-bsp/x-load/x-load.inc b/meta/recipes-bsp/x-load/x-load.inc
deleted file mode 100644
index 05d5ff0..0000000
--- a/meta/recipes-bsp/x-load/x-load.inc
+++ /dev/null
@@ -1,40 +0,0 @@
-SUMMARY = "First level bootloader for OMAP SoCs"
-SECTION = "bootloaders"
-LICENSE = "GPL"
-
-inherit deploy
-
-DEPENDS = ""
-
-PARALLEL_MAKE=""
-
-EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX}"
-
-XLOAD_MACHINE ?= "${MACHINE}_config"
-
-XLOAD_IMAGE ?= "x-load-${MACHINE}-${PV}-${PR}.bin.ift"
-XLOAD_SYMLINK ?= "x-load-${MACHINE}.bin.ift"
-MLO_IMAGE ?= "MLO-${MACHINE}-${PV}-${PR}"
-MLO_SYMLINK ?= "MLO-${MACHINE}"
-
-do_compile () {
-	unset LDFLAGS
-	unset CFLAGS
-	unset CPPFLAGS
-	oe_runmake distclean
-	oe_runmake ${XLOAD_MACHINE}
-	oe_runmake ift
-}
-
-do_deploy () {
-	install ${S}/x-load.bin.ift ${DEPLOYDIR}/${XLOAD_IMAGE}
-	install ${S}/x-load.bin.ift ${DEPLOYDIR}/${MLO_IMAGE}
-
-	cd ${DEPLOYDIR}
-	rm -f ${XLOAD_SYMLINK}
-	ln -sf ${XLOAD_IMAGE} ${XLOAD_SYMLINK}
-	rm -f ${MLO_SYMLINK}
-	ln -sf ${MLO_IMAGE} ${MLO_SYMLINK}
-}
-addtask deploy before do_build after do_compile
-
diff --git a/meta/recipes-bsp/x-load/x-load_git.bb b/meta/recipes-bsp/x-load/x-load_git.bb
deleted file mode 100644
index 65dc85c..0000000
--- a/meta/recipes-bsp/x-load/x-load_git.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require x-load.inc
-
-FILESPATH = "${FILE_DIRNAME}/x-load-git/${MACHINE}:${FILE_DIRNAME}/x-load-git/"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://README;beginline=1;endline=25;md5=ef08d08cb99057bbb5b9d6d0c5a4396f"
-
-SRCREV = "9f94c6577e3a018b6b75cbe39f32bb331871f915"
-PV = "1.5.0+git${SRCPV}"
-
-#SRC_URI = "git://www.sakoman.net/git/x-load-omap3.git;branch=master"
-#SRC_URI = "git://gitorious.org/x-load-omap3/mainline.git;branch=master"
-SRC_URI = "git://gitorious.org/x-loader/x-loader.git;branch=master"
-
-SRC_URI_append_beagleboard = " file://name.patch "
-
-S = "${WORKDIR}/git"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-COMPATIBLE_MACHINE = "(beagleboard|omap3evm|overo)"
-- 
1.7.9.5


