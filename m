Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D412365C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 21:27:25 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 26 Feb 2015 13:23:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,655,1418112000"; d="scan'208";a="460027346"
Received: from gaponcec-mobl2.amr.corp.intel.com (HELO
	aehernan-DevStation.zpn.intel.com) ([10.219.4.48])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Feb 2015 13:11:50 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Feb 2015 15:27:25 -0600
Message-Id: <ebda2f7138e66a721c7986b1d09a6c2bbc6e19b1.1424985901.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1424985901.git.alejandro.hernandez@linux.intel.com>
References: <cover.1424985901.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] python: Fix ctypes/libffi configure
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
X-List-Received-Date: Thu, 26 Feb 2015 21:27:25 -0000

Forces the creation of a configure script for ctypes/libffi Module
by calling autoreconf after it being deleted on do_configure().

Fixes configuration hence compilation of this Python module.

[YOCTO #7373]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/python/python-native_2.7.9.bb | 2 +-
 meta/recipes-devtools/python/python_2.7.9.bb        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python-native_2.7.9.bb b/meta/recipes-devtools/python/python-native_2.7.9.bb
index 28aaa11..34f5c29 100644
--- a/meta/recipes-devtools/python/python-native_2.7.9.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.9.bb
@@ -37,7 +37,7 @@ EXTRA_OEMAKE = '\
   STAGING_INCDIR=${STAGING_INCDIR_NATIVE} \
 '
 
-do_configure_prepend() {
+do_configure_append() {
 	autoreconf --verbose --install --force --exclude=autopoint ../Python-${PV}/Modules/_ctypes/libffi
 }
 
diff --git a/meta/recipes-devtools/python/python_2.7.9.bb b/meta/recipes-devtools/python/python_2.7.9.bb
index 048ec39..4087c2c 100644
--- a/meta/recipes-devtools/python/python_2.7.9.bb
+++ b/meta/recipes-devtools/python/python_2.7.9.bb
@@ -39,9 +39,9 @@ TARGET_CC_ARCH_append_armv7a = " -D__SOFTFP__"
 # The following is a hack until we drop ac_cv_sizeof_off_t from site files
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'ac_cv_sizeof_off_t=8', '', d)} ac_cv_file__dev_ptmx=no ac_cv_file__dev_ptc=no"
 
-do_configure_prepend() {
+do_configure_append() {
 	rm -f ${S}/Makefile.orig
-	autoreconf -Wcross --verbose --install --force --exclude=autopoint Modules/_ctypes/libffi || bbnote "_ctypes failed to autoreconf"
+        autoreconf -Wcross --verbose --install --force --exclude=autopoint ../Python-${PV}/Modules/_ctypes/libffi
 }
 
 do_compile() {
-- 
1.9.1


