Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QiyQg-0002hR-55
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 02:44:54 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Jul 2011 17:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,225,1309762800"; d="scan'208";a="28717404"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by azsmga001.ch.intel.com with ESMTP; 18 Jul 2011 17:40:47 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2011 08:37:54 +0800
Message-Id: <aeaf3f15ab9f47906c77fa591982c0e35510507a.1311035762.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1311035762.git.dongxiao.xu@intel.com>
References: <cover.1311035762.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1311035762.git.dongxiao.xu@intel.com>
References: <cover.1311035762.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/1] alsa-tools: Fix recipe build error.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jul 2011 00:44:54 -0000

Remove some elements in alsa-tools to avoid build error and further
dependency on new recipes.

[YOCTO #1038]

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../alsa/alsa-tools-1.0.24.1/autotools.patch       |   34 ++++++++++++++++++++
 .../recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb |    7 +++-
 2 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-tools-1.0.24.1/autotools.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-tools-1.0.24.1/autotools.patch b/meta/recipes-multimedia/alsa/alsa-tools-1.0.24.1/autotools.patch
new file mode 100644
index 0000000..c7bc2d6
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-tools-1.0.24.1/autotools.patch
@@ -0,0 +1,34 @@
+Add parameters to autoreconf to support cross compile.
+Remove some sub-components which needs further recipe support.
+
+Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
+
+Upstream-Status: Inappropriate [configuration]
+
+diff -ruN alsa-tools-1.0.24.1-orig//ld10k1/gitcompile alsa-tools-1.0.24.1/ld10k1/gitcompile
+--- alsa-tools-1.0.24.1-orig//ld10k1/gitcompile	2011-07-06 11:27:40.227665002 +0800
++++ alsa-tools-1.0.24.1/ld10k1/gitcompile	2011-07-14 13:26:18.017665004 +0800
+@@ -1,6 +1,6 @@
+ #!/bin/bash
+ 
+-autoreconf -fi || exit 1
++autoreconf $ACLOCAL_FLAGS -fi || exit 1
+ export CFLAGS='-O2 -Wall -pipe -g'
+ echo "CFLAGS=$CFLAGS"
+ echo "./configure $@"
+diff -ruN alsa-tools-1.0.24.1-orig//Makefile alsa-tools-1.0.24.1/Makefile
+--- alsa-tools-1.0.24.1-orig//Makefile	2011-07-06 11:27:40.207665000 +0800
++++ alsa-tools-1.0.24.1/Makefile	2011-07-14 15:08:08.877665009 +0800
+@@ -1,9 +1,8 @@
+ VERSION = 1.0.24.1
+ TOP = .
+-SUBDIRS = ac3dec as10k1 envy24control hdsploader hdspconf hdspmixer \
+-	  mixartloader pcxhrloader rmedigicontrol sb16_csp seq sscape_ctl \
+-	  us428control usx2yloader vxloader echomixer ld10k1 qlo10k1 \
+-	  hwmixvolume
++SUBDIRS = ac3dec as10k1 hdsploader mixartloader pcxhrloader sb16_csp \
++          seq sscape_ctl us428control usx2yloader vxloader ld10k1 \
++          hwmixvolume
+ 
+ all:
+ 	@for i in $(SUBDIRS); do \
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb
index 5b3ea98..1bf9cd0 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb
@@ -5,13 +5,16 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 DEPENDS = "alsa-lib ncurses"
 
-PR = "r1"
+PR = "r2"
 
 LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/alsa-tools-${PV}.tar.bz2"
+SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/alsa-tools-${PV}.tar.bz2 \
+           file://autotools.patch"
 
 SRC_URI[md5sum] = "08fe93a12006093e590d7ecc02b119dd"
 SRC_URI[sha256sum] = "17d43de93ab2db98886d89a53e45341daa46a4ef6edd405db87f4b5a5dc64a05"
 
 inherit autotools
+
+EXTRA_OEMAKE += "GITCOMPILE_ARGS='--host=${HOST_SYS} --build=${BUILD_SYS} --target=${TARGET_SYS} --with-libtool-sysroot=${STAGING_DIR_HOST}' ACLOCAL_FLAGS='-I ${STAGING_DATADIR}/aclocal'"
-- 
1.7.1



