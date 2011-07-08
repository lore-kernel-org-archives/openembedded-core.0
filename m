Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Qf0M1-0005pU-Mo
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 03:59:41 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Jul 2011 18:55:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,496,1304319600"; d="scan'208";a="22891257"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.20])
	by orsmga002.jf.intel.com with ESMTP; 07 Jul 2011 18:55:48 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jul 2011 10:11:54 +0800
Message-Id: <1fe84f84d97483fed090aa4e34f68f1edf253ca4.1310090994.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1310090994.git.dongxiao.xu@intel.com>
References: <cover.1310090994.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1310090994.git.dongxiao.xu@intel.com>
References: <cover.1310090994.git.dongxiao.xu@intel.com>
Subject: [PATCH 2/2] alsa-tools: Fix recipe build error.
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
X-List-Received-Date: Fri, 08 Jul 2011 01:59:42 -0000

1. Fix the autoreconf error with gtk2 and alsa.
2. Add libtool sysroot path while configuration.
3. Remove one element in alsa-tools which depends on qt2.

[YOCTO #1038]

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../alsa/alsa-tools-1.0.24.1/autotools.patch       |   31 ++++++++++++++++++++
 .../recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb |   16 ++++++++--
 2 files changed, 44 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-tools-1.0.24.1/autotools.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-tools-1.0.24.1/autotools.patch b/meta/recipes-multimedia/alsa/alsa-tools-1.0.24.1/autotools.patch
new file mode 100644
index 0000000..27e887a
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-tools-1.0.24.1/autotools.patch
@@ -0,0 +1,31 @@
+Add aclocal path to the autoreconf command.
+Remove qlo10k1 element which depends on qt2.
+
+Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
+
+Upstream-Status: Inappropriate [configuration]
+
+diff -ruN alsa-tools-1.0.24.1-orig//ld10k1/gitcompile alsa-tools-1.0.24.1/ld10k1/gitcompile
+--- alsa-tools-1.0.24.1-orig//ld10k1/gitcompile	2011-07-06 11:27:40.227665002 +0800
++++ alsa-tools-1.0.24.1/ld10k1/gitcompile	2011-07-08 09:49:11.177665001 +0800
+@@ -1,6 +1,6 @@
+ #!/bin/bash
+ 
+-autoreconf -fi || exit 1
++autoreconf -fi $ACLOCAL_FLAGS || exit 1
+ export CFLAGS='-O2 -Wall -pipe -g'
+ echo "CFLAGS=$CFLAGS"
+ echo "./configure $@"
+diff -ruN alsa-tools-1.0.24.1-orig//Makefile alsa-tools-1.0.24.1/Makefile
+--- alsa-tools-1.0.24.1-orig//Makefile	2011-07-06 11:27:40.207665000 +0800
++++ alsa-tools-1.0.24.1/Makefile	2011-07-08 09:48:39.157665001 +0800
+@@ -2,8 +2,7 @@
+ TOP = .
+ SUBDIRS = ac3dec as10k1 envy24control hdsploader hdspconf hdspmixer \
+ 	  mixartloader pcxhrloader rmedigicontrol sb16_csp seq sscape_ctl \
+-	  us428control usx2yloader vxloader echomixer ld10k1 qlo10k1 \
+-	  hwmixvolume
++	  us428control usx2yloader vxloader echomixer ld10k1 hwmixvolume
+ 
+ all:
+ 	@for i in $(SUBDIRS); do \
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb
index 5b3ea98..d370d3c 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb
@@ -3,15 +3,25 @@ BROKEN = "1"
 DESCRIPTION = "Alsa Tools"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
-DEPENDS = "alsa-lib ncurses"
+DEPENDS = "alsa-lib ncurses gtk+ fltk"
 
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
+do_compile_prepend() {
+	subdirs="envy24control rmedigicontrol echomixer"
+	for i in $subdirs; do
+		mv ${S}/${i}/aclocal.m4 ${S}/${i}/acinclude.m4
+	done
+}
+
+EXTRA_OEMAKE += "GITCOMPILE_ARGS='--host=${HOST_SYS} --build=${BUILD_SYS} --target=${TARGET_SYS} --with-libtool-sysroot=${STAGING_DIR_HOST}' ACLOCAL_FLAGS='-I ${STAGING_DATADIR}/aclocal'"
-- 
1.7.1



