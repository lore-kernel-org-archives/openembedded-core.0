Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 33E1F77BB4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 19:12:14 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Sep 2017 12:12:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,446,1500966000"; d="scan'208";a="156261606"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga005.fm.intel.com with ESMTP; 27 Sep 2017 12:12:16 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Sep 2017 12:12:15 -0700
Message-Id: <20170927191215.15752-1-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH v2] python-native: Build with ipv6 enabled
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
X-List-Received-Date: Wed, 27 Sep 2017 19:12:15 -0000

Before we introduced DISTRO_FEATURES_NATIVE on commit:
db1f1adace58763c35774e3fdfeaac5c3ca646fd

ipv6 was enabled by default on DISTRO_FEATURES via DISTRO_FEATURES_LIBC
hence python-native was built with ipv6 support.

After this, the check for ipv6 on DISTRO_FEATURES stopped working for the
python-native recipe and it was always disabled.

On some python packages this may cause errors when they try to download
something on their do_compile stage.

This patch fixes the implementation of EXTRA_OECONF to get the ipv6
configuration correctly, still letting the user choose if they'd like
support for ipv6 on python for target, but forcing ipv6 support for
python native, to avoid errors

[YOCTO #11978]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/python/python.inc       | 12 ++++++++++--
 meta/recipes-devtools/python/python3_3.5.3.bb |  2 +-
 meta/recipes-devtools/python/python_2.7.13.bb |  2 +-
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index b40f551ab39..28aadb176c3 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -22,13 +22,21 @@ PYTHON_MAJMIN = "2.7"
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF = "\
+EXTRA_OECONF_class-target = "\
+  --enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)} \
+"
+# Enable ipv6 support for native by default, without having to modify DISTRO_FEATURES_NATIVE 
+EXTRA_OECONF_class-native = "\
+  --enable-ipv6=yes \
+"
+
+# _append automatically gets appended to the correct EXTRA_OECONF_class-<>
+EXTRA_OECONF_append = "\
   --with-threads \
   --with-pymalloc \
   --without-cxx-main \
   --with-signal-module \
   --enable-shared \
-  --enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)} \
   ac_cv_header_bluetooth_bluetooth_h=no ac_cv_header_bluetooth_h=no \
   ${PYTHONLSBOPTS} \
 "
diff --git a/meta/recipes-devtools/python/python3_3.5.3.bb b/meta/recipes-devtools/python/python3_3.5.3.bb
index 13df12fe566..2657ed09618 100644
--- a/meta/recipes-devtools/python/python3_3.5.3.bb
+++ b/meta/recipes-devtools/python/python3_3.5.3.bb
@@ -66,7 +66,7 @@ CACHED_CONFIGUREVARS = "ac_cv_have_chflags=no \
 TARGET_CC_ARCH += "-DNDEBUG -fno-inline"
 SDK_CC_ARCH += "-DNDEBUG -fno-inline"
 EXTRA_OEMAKE += "CROSS_COMPILE=yes"
-EXTRA_OECONF += "CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ --without-ensurepip"
+EXTRA_OECONF_append = " CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ --without-ensurepip"
 
 export CROSS_COMPILE = "${TARGET_PREFIX}"
 export _PYTHON_PROJECT_BASE = "${B}"
diff --git a/meta/recipes-devtools/python/python_2.7.13.bb b/meta/recipes-devtools/python/python_2.7.13.bb
index 4d73cd25c8b..c346b0988bd 100644
--- a/meta/recipes-devtools/python/python_2.7.13.bb
+++ b/meta/recipes-devtools/python/python_2.7.13.bb
@@ -37,7 +37,7 @@ inherit autotools multilib_header python-dir pythonnative
 
 CONFIGUREOPTS += " --with-system-ffi "
 
-EXTRA_OECONF += "ac_cv_file__dev_ptmx=yes ac_cv_file__dev_ptc=no"
+EXTRA_OECONF_append = " ac_cv_file__dev_ptmx=yes ac_cv_file__dev_ptc=no"
 
 do_configure_append() {
 	rm -f ${S}/Makefile.orig
-- 
2.12.3


