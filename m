Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QoivZ-0002Bt-3O
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 23:24:33 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Aug 2011 14:20:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,312,1309762800"; d="scan'208";a="34056930"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 03 Aug 2011 14:19:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 14:19:29 -0700
Message-Id: <3494baf2161b31b3edc74fde6bdd62d13567acfe.1312394851.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312394851.git.sgw@linux.intel.com>
References: <cover.1312394851.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312394851.git.sgw@linux.intel.com>
References: <cover.1312394851.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 16/33] apr: Upgrade to 1.4.5
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
X-List-Received-Date: Wed, 03 Aug 2011 21:24:33 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Remove buildconf_fix.patch as already in upstream.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>

Merged with ${BPN} change

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/apr/apr/buildconf_fix.patch   |   27 --------------------
 .../apr/{apr_1.4.2.bb => apr_1.4.5.bb}             |   13 +++++----
 2 files changed, 7 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-support/apr/apr/buildconf_fix.patch
 rename meta/recipes-support/apr/{apr_1.4.2.bb => apr_1.4.5.bb} (82%)

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
similarity index 82%
rename from meta/recipes-support/apr/apr_1.4.2.bb
rename to meta/recipes-support/apr/apr_1.4.5.bb
index 2d5edaa..b65e042 100644
--- a/meta/recipes-support/apr/apr_1.4.2.bb
+++ b/meta/recipes-support/apr/apr_1.4.5.bb
@@ -9,13 +9,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0c35ff3c4c83b89d2f076e315caac28b \
 PR = "r1"
 
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
-           file://configure_fixes.patch;patch=1 \
-	   file://cleanup.patch;patch=1 \
-           file://configfix.patch;patch=1 \
-           file://buildconf_fix.patch;patch=1"
+           file://configure_fixes.patch \
+           file://cleanup.patch \
+           file://configfix.patch"
 
-SRC_URI[md5sum] = "4b00e8f70c067893d075577962656b35"
-SRC_URI[sha256sum] = "2017ca700694d09d2b0b21dd7c4d195e43a48735aac88526160c6195ee8f5391"
+SRC_URI[md5sum] = "8b53f5a5669d0597f2da889a2f576eb6"
+SRC_URI[sha256sum] = "38c61cacb39be649411cdab212979c71ce29495549c249c2e9a1b0d12480c93e"
 
 inherit autotools lib_package binconfig multilib_header
 
@@ -26,6 +25,8 @@ do_configure_prepend() {
 	./buildconf
 }
 
+FILES_${PN}-dev += "${libdir}/apr.exp ${datadir}/build-1/*"
+
 #for some reason, build/libtool.m4 handled by buildconf still be overwritten
 #when autoconf, so handle it again.
 do_configure_append() {
-- 
1.7.3.4



