Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LEa-0001C4-Ib
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:41:32 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Mar 2012 17:32:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="139657420"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by fmsmga002.fm.intel.com with ESMTP; 15 Mar 2012 17:32:44 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:19 +0800
Message-Id: <7cddd583adb74fa793fa498a1a5500ccdc749cae.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 22/60] busybox: upgrade to 1.19.4
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
X-List-Received-Date: Fri, 16 Mar 2012 00:41:33 -0000

Removing the patch busybox-1.19.3-getty.patch is because it is already in the upstream.

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../busybox-1.19.3/busybox-1.19.3-getty.patch      |   17 -----------------
 .../B921600.patch                                  |    0
 .../busybox-appletlib-dependency.patch             |    0
 .../busybox-udhcpc-no_deconfig.patch               |    0
 .../{busybox-1.19.3 => busybox-1.19.4}/defconfig   |    0
 .../get_header_tar.patch                           |    0
 .../run-parts.in.usr-bin.patch                     |    0
 .../udhcpc-fix-nfsroot.patch                       |    0
 .../udhcpscript.patch                              |    0
 .../{busybox_1.19.3.bb => busybox_1.19.4.bb}       |    7 +++----
 10 files changed, 3 insertions(+), 21 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox-1.19.3/busybox-1.19.3-getty.patch
 rename meta/recipes-core/busybox/{busybox-1.19.3 => busybox-1.19.4}/B921600.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.19.3 => busybox-1.19.4}/busybox-appletlib-dependency.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.19.3 => busybox-1.19.4}/busybox-udhcpc-no_deconfig.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.19.3 => busybox-1.19.4}/defconfig (100%)
 rename meta/recipes-core/busybox/{busybox-1.19.3 => busybox-1.19.4}/get_header_tar.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.19.3 => busybox-1.19.4}/run-parts.in.usr-bin.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.19.3 => busybox-1.19.4}/udhcpc-fix-nfsroot.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.19.3 => busybox-1.19.4}/udhcpscript.patch (100%)
 rename meta/recipes-core/busybox/{busybox_1.19.3.bb => busybox_1.19.4.bb} (82%)

diff --git a/meta/recipes-core/busybox/busybox-1.19.3/busybox-1.19.3-getty.patch b/meta/recipes-core/busybox/busybox-1.19.3/busybox-1.19.3-getty.patch
deleted file mode 100644
index 0578d78..0000000
--- a/meta/recipes-core/busybox/busybox-1.19.3/busybox-1.19.3-getty.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Backport
-
-Patch is taken from upstream 
-http://busybox.net/downloads/fixes-1.19.3/busybox-1.19.3-getty.patch
-
---- busybox-1.19.3/loginutils/getty.c
-+++ busybox-1.19.3-getty/loginutils/getty.c
-@@ -271,7 +271,9 @@ static void termios_init(int speed)
- #ifdef CMSPAR
- 		| CMSPAR  /* mark or space parity */
- #endif
-+#ifdef CBAUD
- 		| CBAUD   /* (output) baud rate */
-+#endif
- #ifdef CBAUDEX
- 		| CBAUDEX /* (output) baud rate */
- #endif
diff --git a/meta/recipes-core/busybox/busybox-1.19.3/B921600.patch b/meta/recipes-core/busybox/busybox-1.19.4/B921600.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.19.3/B921600.patch
rename to meta/recipes-core/busybox/busybox-1.19.4/B921600.patch
diff --git a/meta/recipes-core/busybox/busybox-1.19.3/busybox-appletlib-dependency.patch b/meta/recipes-core/busybox/busybox-1.19.4/busybox-appletlib-dependency.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.19.3/busybox-appletlib-dependency.patch
rename to meta/recipes-core/busybox/busybox-1.19.4/busybox-appletlib-dependency.patch
diff --git a/meta/recipes-core/busybox/busybox-1.19.3/busybox-udhcpc-no_deconfig.patch b/meta/recipes-core/busybox/busybox-1.19.4/busybox-udhcpc-no_deconfig.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.19.3/busybox-udhcpc-no_deconfig.patch
rename to meta/recipes-core/busybox/busybox-1.19.4/busybox-udhcpc-no_deconfig.patch
diff --git a/meta/recipes-core/busybox/busybox-1.19.3/defconfig b/meta/recipes-core/busybox/busybox-1.19.4/defconfig
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.19.3/defconfig
rename to meta/recipes-core/busybox/busybox-1.19.4/defconfig
diff --git a/meta/recipes-core/busybox/busybox-1.19.3/get_header_tar.patch b/meta/recipes-core/busybox/busybox-1.19.4/get_header_tar.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.19.3/get_header_tar.patch
rename to meta/recipes-core/busybox/busybox-1.19.4/get_header_tar.patch
diff --git a/meta/recipes-core/busybox/busybox-1.19.3/run-parts.in.usr-bin.patch b/meta/recipes-core/busybox/busybox-1.19.4/run-parts.in.usr-bin.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.19.3/run-parts.in.usr-bin.patch
rename to meta/recipes-core/busybox/busybox-1.19.4/run-parts.in.usr-bin.patch
diff --git a/meta/recipes-core/busybox/busybox-1.19.3/udhcpc-fix-nfsroot.patch b/meta/recipes-core/busybox/busybox-1.19.4/udhcpc-fix-nfsroot.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.19.3/udhcpc-fix-nfsroot.patch
rename to meta/recipes-core/busybox/busybox-1.19.4/udhcpc-fix-nfsroot.patch
diff --git a/meta/recipes-core/busybox/busybox-1.19.3/udhcpscript.patch b/meta/recipes-core/busybox/busybox-1.19.4/udhcpscript.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.19.3/udhcpscript.patch
rename to meta/recipes-core/busybox/busybox-1.19.4/udhcpscript.patch
diff --git a/meta/recipes-core/busybox/busybox_1.19.3.bb b/meta/recipes-core/busybox/busybox_1.19.4.bb
similarity index 82%
rename from meta/recipes-core/busybox/busybox_1.19.3.bb
rename to meta/recipes-core/busybox/busybox_1.19.4.bb
index 49ac859..dff616d 100644
--- a/meta/recipes-core/busybox/busybox_1.19.3.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.4.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r5"
+PR = "r0"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://udhcpscript.patch \
@@ -7,7 +7,6 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://B921600.patch \
            file://get_header_tar.patch \
            file://busybox-appletlib-dependency.patch \
-           file://busybox-1.19.3-getty.patch \
            file://run-parts.in.usr-bin.patch \
            file://busybox-udhcpc-no_deconfig.patch \
            file://find-touchscreen.sh \
@@ -26,7 +25,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://umount.busybox \
            file://defconfig"
 
-SRC_URI[tarball.md5sum] = "c3938e1ac59602387009bbf1dd1af7f6"
-SRC_URI[tarball.sha256sum] = "a1a9a35732c719ef384f02b6e357c324d8be25bc154af91a48c4264b1e6038f0"
+SRC_URI[tarball.md5sum] = "9c0cae5a0379228e7b55e5b29528df8e"
+SRC_URI[tarball.sha256sum] = "9b853406da61ffb59eb488495fe99cbb7fb3dd29a31307fcfa9cf070543710ee"
 
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
-- 
1.7.6



