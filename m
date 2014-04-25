Return-Path: <petter@technux.se>
Received: from vsp-authed-02-02.binero.net (vsp-authed02.binero.net
	[195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id DBA7B65D99
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 22:11:35 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-02-02.binero.net (Halon Mail Gateway) with ESMTPS;
	Sat, 26 Apr 2014 00:11:31 +0200 (CEST)
Received: from eldbvzzwp1-7x.lan (81-229-90-163-no67.tbcn.telia.com
	[81.229.90.163]) (Authenticated sender: petter@technux.se)
	by smtp-01-01.atm.binero.net (Postfix) with ESMTPSA id 6BD763A1CA;
	Sat, 26 Apr 2014 00:11:29 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Sat, 26 Apr 2014 00:11:19 +0200
Message-Id: <b9ff9866b658eef7f8798f2d449e92930250640b.1398462168.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1398462168.git.petter@technux.se>
References: <cover.1398462168.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCH 1/2] x-load: fix broken beaglebone support
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
X-List-Received-Date: Fri, 25 Apr 2014 22:11:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When beagleboard was renamed to beaglebone, some parts in x-load was
missed. This caused x-load to fail when building it for beaglebone target.

Also use this commit to re-create the beaglebone patch name.patch using
git-format and write a proper patch description.

Signed-off-by: Petter Mabäcker <petter@technux.se>
---
 .../x-load/x-load-git/beagleboard/name.patch       |   18 ----------
 .../0001-Change-omap3530beagle-target-name.patch   |   37 ++++++++++++++++++++
 meta/recipes-bsp/x-load/x-load_git.bb              |    4 +--
 3 files changed, 39 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-bsp/x-load/x-load-git/beagleboard/name.patch
 create mode 100644 meta/recipes-bsp/x-load/x-load-git/beaglebone/0001-Change-omap3530beagle-target-name.patch

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
diff --git a/meta/recipes-bsp/x-load/x-load-git/beaglebone/0001-Change-omap3530beagle-target-name.patch b/meta/recipes-bsp/x-load/x-load-git/beaglebone/0001-Change-omap3530beagle-target-name.patch
new file mode 100644
index 0000000..2d4195b
--- /dev/null
+++ b/meta/recipes-bsp/x-load/x-load-git/beaglebone/0001-Change-omap3530beagle-target-name.patch
@@ -0,0 +1,37 @@
+From 36642d018667950027fd6cbcc98cfa12b2c81ad1 Mon Sep 17 00:00:00 2001
+From: Petter Mabacker <petter@technux.se>
+Date: Fri, 25 Apr 2014 16:44:31 +0200
+Subject: [PATCH] Change omap3530beagle target name
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Support the usage of ${MACHINE}_config as proper target name for
+beaglebone.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Petter Mabäcker <petter@technux.se>
+---
+ Makefile |    5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 1930db5..1410dae 100644
+--- a/Makefile
++++ b/Makefile
+@@ -222,8 +222,9 @@ omap3evm_config :	unconfig
+ overo_config :	unconfig
+ 	@$(MKCONFIG) $(@:_config=) arm omap3 overo
+ 
+-omap3530beagle_config :    unconfig
+-	@$(MKCONFIG) $(@:_config=) arm omap3 omap3530beagle
++beaglebone_config :    unconfig
++	@$(MKCONFIG) omap3530beagle arm omap3 omap3530beagle
++	@./mkconfig omap3530beagle arm omap3 omap3530beagle
+ 
+ igep0020_config :    unconfig
+ 	@$(MKCONFIG) $(@:_config=) arm omap3 igep0020
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-bsp/x-load/x-load_git.bb b/meta/recipes-bsp/x-load/x-load_git.bb
index 65dc85c..5112349 100644
--- a/meta/recipes-bsp/x-load/x-load_git.bb
+++ b/meta/recipes-bsp/x-load/x-load_git.bb
@@ -12,10 +12,10 @@ PV = "1.5.0+git${SRCPV}"
 #SRC_URI = "git://gitorious.org/x-load-omap3/mainline.git;branch=master"
 SRC_URI = "git://gitorious.org/x-loader/x-loader.git;branch=master"
 
-SRC_URI_append_beagleboard = " file://name.patch "
+SRC_URI_append_beaglebone = " file://0001-Change-omap3530beagle-target-name.patch "
 
 S = "${WORKDIR}/git"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-COMPATIBLE_MACHINE = "(beagleboard|omap3evm|overo)"
+COMPATIBLE_MACHINE = "(beaglebone|omap3evm|overo)"
-- 
1.7.9.5


