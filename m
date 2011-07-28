Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QmQLc-00080A-DK
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 15:09:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Jul 2011 06:05:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,282,1309762800"; d="scan'208";a="33091574"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 28 Jul 2011 06:05:40 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2011 21:03:05 +0800
Message-Id: <b5416aada1f601affe6bd00a1058a130218392df.1311858056.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1311858056.git.edwin.zhai@intel.com>
References: <cover.1311858056.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1311858056.git.edwin.zhai@intel.com>
References: <cover.1311858056.git.edwin.zhai@intel.com>
Subject: [PATCH 3/7] apr: Upgrade to 1.4.5
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
X-List-Received-Date: Thu, 28 Jul 2011 13:09:56 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Remove buildconf_fix.patch as already in upstream.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-support/apr/apr/buildconf_fix.patch   |   27 --------------------
 .../apr/{apr_1.4.2.bb => apr_1.4.5.bb}             |    9 +++---
 2 files changed, 5 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-support/apr/apr/buildconf_fix.patch
 rename meta/recipes-support/apr/{apr_1.4.2.bb => apr_1.4.5.bb} (85%)

diff --git a/meta/recipes-support/apr/apr/buildconf_fix.patch b/meta/recipes-support/apr/apr/buildconf_fix.patch
deleted file mode 100644
index 2c9d62e..0000000
--- a/meta/recipes-support/apr/apr/buildconf_fix.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Remove the new libtool detection method to avoid config failure. Poky's libtool
-has different format for "aclocaldir", and there is no elegant parsing method,
-so fall back to old detection.
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: apr-1.4.2/buildconf
-===================================================================
---- apr-1.4.2.orig/buildconf	2009-11-13 06:19:49.000000000 +0800
-+++ apr-1.4.2/buildconf	2010-11-29 14:39:19.000000000 +0800
-@@ -50,14 +50,6 @@
- 
- if [ -f libtool.m4 ]; then 
-    ltfile=`pwd`/libtool.m4
--elif grep all_pkgmacro_files $libtoolize > /dev/null; then
--    # libtool 2.x
--   aclocal_dir=`sed -n '/^aclocaldir=/{s/.*=//;p;q;}' < $libtoolize`
--   ltfiles=`sed -n '/^all_pkgmacro_files=/{s/.*=//;;s/"//;p;q;}' < $libtoolize`
--   for f in $ltfiles; do
--       test -f "$aclocal_dir/$f" && cp "$aclocal_dir/$f" build
--   done
--   ltfile=$aclocal_dir/libtool.m4
- else
-    ltfindcmd="`sed -n \"/=[^\\\`]/p;/libtool_m4=/{s/.*=/echo /p;q;}\" \
-                    < $libtoolize`"
diff --git a/meta/recipes-support/apr/apr_1.4.2.bb b/meta/recipes-support/apr/apr_1.4.5.bb
similarity index 85%
rename from meta/recipes-support/apr/apr_1.4.2.bb
rename to meta/recipes-support/apr/apr_1.4.5.bb
index 89bdadf..26a1818 100644
--- a/meta/recipes-support/apr/apr_1.4.2.bb
+++ b/meta/recipes-support/apr/apr_1.4.5.bb
@@ -11,11 +11,10 @@ PR = "r0"
 SRC_URI = "${APACHE_MIRROR}/apr/${P}.tar.bz2 \
            file://configure_fixes.patch;patch=1 \
 	   file://cleanup.patch;patch=1 \
-           file://configfix.patch;patch=1 \
-           file://buildconf_fix.patch;patch=1"
+           file://configfix.patch;patch=1"
 
-SRC_URI[md5sum] = "4b00e8f70c067893d075577962656b35"
-SRC_URI[sha256sum] = "2017ca700694d09d2b0b21dd7c4d195e43a48735aac88526160c6195ee8f5391"
+SRC_URI[md5sum] = "8b53f5a5669d0597f2da889a2f576eb6"
+SRC_URI[sha256sum] = "38c61cacb39be649411cdab212979c71ce29495549c249c2e9a1b0d12480c93e"
 
 inherit autotools lib_package binconfig
 
@@ -26,6 +25,8 @@ do_configure_prepend() {
 	./buildconf
 }
 
+FILES_${PN}-dev += "${libdir}/apr.exp ${datadir}/build-1/*"
+
 #for some reason, build/libtool.m4 handled by buildconf still be overwritten
 #when autoconf, so handle it again.
 do_configure_append() {
-- 
1.7.1



