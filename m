Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RVTUY-0001f7-UE
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 20:37:23 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 Nov 2011 11:30:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="81010876"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2011 11:30:43 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 11:30:39 -0800
Message-Id: <00a1fc186edfc057e07b1bd2a37672d270563c6f.1322594901.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <48bd68cce53c87c7f9296a0a0ad5286efef7d5cc.1322594901.git.nitin.a.kamble@intel.com>
References: <48bd68cce53c87c7f9296a0a0ad5286efef7d5cc.1322594901.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1322594901.git.nitin.a.kamble@intel.com>
References: <cover.1322594901.git.nitin.a.kamble@intel.com>
Subject: [PATCH 2/4] binutils: fix for .debug files QA warnings
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
X-List-Received-Date: Tue, 29 Nov 2011 19:37:23 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

THis commit fixes these QA warnings for binutils recipe
WARNING: For recipe binutils, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/arm-oe-linux-gnueabi/bin/.debug
WARNING:   /usr/arm-oe-linux-gnueabi/bin/.debug/strip
WARNING:   /usr/arm-oe-linux-gnueabi/bin/.debug/objcopy
WARNING:   /usr/arm-oe-linux-gnueabi/bin/.debug/objdump
WARNING:   /usr/arm-oe-linux-gnueabi/bin/.debug/ld
WARNING:   /usr/arm-oe-linux-gnueabi/bin/.debug/nm
WARNING:   /usr/arm-oe-linux-gnueabi/bin/.debug/as
WARNING:   /usr/arm-oe-linux-gnueabi/bin/.debug/ranlib
WARNING:   /usr/arm-oe-linux-gnueabi/bin/.debug/ld.bfd
WARNING:   /usr/arm-oe-linux-gnueabi/bin/.debug/ar

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../binutils/binutils-cross-canadian_2.22.bb       |    2 +-
 .../binutils/binutils-crosssdk_2.22.bb             |    2 +-
 meta/recipes-devtools/binutils/binutils.inc        |    2 ++
 meta/recipes-devtools/binutils/binutils_2.22.bb    |    2 +-
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.22.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.22.bb
index 7dad2a6..e91e7dc 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.22.bb
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.22.bb
@@ -1,3 +1,3 @@
 require binutils_${PV}.bb
 require binutils-cross-canadian.inc
-PR = "r0"
+PR = "r1"
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
index 0d6efff..21289cd 100644
--- a/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
+++ b/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
@@ -4,7 +4,7 @@ inherit crosssdk
 
 PROVIDES = "virtual/${TARGET_PREFIX}binutils-crosssdk"
 
-PR = "r0"
+PR = "r1"
 
 do_configure_prepend () {
 	sed -i 's#/usr/local/lib /lib /usr/lib#${SDKPATHNATIVE}/lib ${SDKPATHNATIVE}/usr/lib /usr/local/lib /lib /usr/lib#' ${S}/ld/configure.tgt
diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 51e4257..5cb2cc9 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -45,6 +45,8 @@ FILES_${PN}-symlinks = " \
 	${bindir}/size \
 	${bindir}/strip"
 
+FILES_${PN}-dbg += "${prefix}/${TARGET_SYS}/bin/.debug"
+
 B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
 
 EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
diff --git a/meta/recipes-devtools/binutils/binutils_2.22.bb b/meta/recipes-devtools/binutils/binutils_2.22.bb
index f0ed5e8..f1e7e12 100644
--- a/meta/recipes-devtools/binutils/binutils_2.22.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.22.bb
@@ -1,6 +1,6 @@
 require binutils.inc
 
-PR = "r0"
+PR = "r1"
 
 LIC_FILES_CHKSUM="\
     file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
-- 
1.7.6.4



