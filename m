Return-Path: <swee.aun.khor@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E792560043
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Sep 2017 14:37:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Sep 2017 07:37:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,372,1500966000"; d="scan'208";a="1170853601"
Received: from echidna.jf.intel.com ([10.54.77.34])
	by orsmga001.jf.intel.com with ESMTP; 10 Sep 2017 07:37:29 -0700
From: swee.aun.khor@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Sep 2017 00:28:30 -0700
Message-Id: <1505028510-18691-1-git-send-email-swee.aun.khor@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: saul.wold@intel.com
Subject: [PATCH] dpkg: Support muslx32 build
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
X-List-Received-Date: Sun, 10 Sep 2017 14:37:29 -0000

From: sweeaun <swee.aun.khor@intel.com>

Modified ostable and tupletable to support muslx32 build.

Signed-off-by: sweeaun <swee.aun.khor@intel.com>
---
 .../dpkg/0001-dpkg-Support-muslx32-build.patch     | 41 ++++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.18.24.bb         |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch b/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch
new file mode 100644
index 0000000..50e6894
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch
@@ -0,0 +1,41 @@
+From a328c8bec0bf8071ae8f20fee4c7475205064ba1 Mon Sep 17 00:00:00 2001
+From: sweeaun <swee.aun.khor@intel.com>
+Date: Sun, 10 Sep 2017 00:14:15 -0700
+Subject: [PATCH] dpkg: Support muslx32 build
+
+Upstream-Status: Pending.
+Changes made on ostable and tupletable to enable muslx32 build.
+
+Signed-off-by: sweeaun <swee.aun.khor@intel.com>
+---
+ data/ostable    | 1 +
+ data/tupletable | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/data/ostable b/data/ostable
+index be64342..87db273 100644
+--- a/data/ostable
++++ b/data/ostable
+@@ -19,6 +19,7 @@ base-uclibc-linux	linux-uclibc		linux[^-]*-uclibc
+ eabihf-musl-linux	linux-musleabihf	linux[^-]*-musleabihf
+ eabi-musl-linux		linux-musleabi		linux[^-]*-musleabi
+ base-musl-linux		linux-musl		linux[^-]*-musl
++x32-musl-linux		linux-muslx32		linux[^-]*-muslx32
+ eabihf-gnu-linux	linux-gnueabihf		linux[^-]*-gnueabihf
+ eabi-gnu-linux		linux-gnueabi		linux[^-]*-gnueabi
+ abin32-gnu-linux	linux-gnuabin32		linux[^-]*-gnuabin32
+diff --git a/data/tupletable b/data/tupletable
+index 28f00bf..748ffab 100644
+--- a/data/tupletable
++++ b/data/tupletable
+@@ -10,6 +10,7 @@ base-uclibc-linux-<cpu>		uclibc-linux-<cpu>
+ eabihf-musl-linux-arm		musl-linux-armhf
+ eabi-musl-linux-arm		musl-linux-armel
+ base-musl-linux-<cpu>		musl-linux-<cpu>
++x32-musl-linux-amd64		x32
+ ilp32-gnu-linux-arm64		arm64ilp32
+ eabihf-gnu-linux-arm		armhf
+ eabi-gnu-linux-arm		armel
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.18.24.bb b/meta/recipes-devtools/dpkg/dpkg_1.18.24.bb
index f06b604..7e241af 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.18.24.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.18.24.bb
@@ -13,6 +13,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz \
            file://0005-dpkg-compiler.m4-remove-Wvla.patch \
            file://0006-add-musleabi-to-known-target-tripets.patch \
            file://0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch \
+           file://0001-dpkg-Support-muslx32-build.patch \
            "
 SRC_URI_append_class-native = " file://glibc2.5-sync_file_range.patch "
 
-- 
2.7.4


