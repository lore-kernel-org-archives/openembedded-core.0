Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C928765CBF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 21:42:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 14 Mar 2016 14:42:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,337,1455004800"; d="scan'208";a="910269062"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga001.jf.intel.com with ESMTP; 14 Mar 2016 14:42:36 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Mar 2016 14:29:11 -0700
Message-Id: <1457990951-32467-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1457990951-32467-1-git-send-email-juro.bystricky@intel.com>
References: <1457990951-32467-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 1/1] ncurses_6: Improve installation
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
X-List-Received-Date: Mon, 14 Mar 2016 21:42:34 -0000

As "install.libs" also installs header files, it is
redundant to also call "install.includes".
In fact, doing so can lead to a race, as both targets could
try to install the header files at the same time if running
parallel make. Obviously, with only calling "install.libs",
there is no race with "install.includes".
If there is no race, then the patch fix-include-files-race.patch
is no longer needed.


Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 .../ncurses/files/fix-include-files-race.patch     | 32 ----------------------
 meta/recipes-core/ncurses/ncurses.inc              | 11 ++++++--
 meta/recipes-core/ncurses/ncurses_6.0+20160213.bb  |  1 -
 3 files changed, 8 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-core/ncurses/files/fix-include-files-race.patch

diff --git a/meta/recipes-core/ncurses/files/fix-include-files-race.patch b/meta/recipes-core/ncurses/files/fix-include-files-race.patch
deleted file mode 100644
index 6f22e98..0000000
--- a/meta/recipes-core/ncurses/files/fix-include-files-race.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-There is a race condition when running 
-
-    $ make install.libs install.includes
-    
-As both targets install identical files. The remedy is to either prevent
-parallel make of install.libs and install.includes, or ensure only one 
-target installs the files. 
-The second approch will only work if we always install both libs and 
-includes (which we do).
-
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: git/mk-hdr.awk
-===================================================================
---- a/mk-hdr.awk
-+++ b/mk-hdr.awk
-@@ -73,11 +73,13 @@ BEGIN	{
- END	{
- 		if ( count > 0 )
- 		{
-+			print" # patched here: Removed install.libs due the race "
- 			print "${INCLUDEDIR} :"
- 			print "	mkdir -p $@"
- 			print ""
-+			print "install.libs :: ;"
-+			print ""
- 			print "install \\"
--			print "install.libs \\"
- 			print "install.includes :: ${AUTO_SRC} ${INCLUDEDIR} \\"
- 
- 			for (i = 0; i < count - 1; ++i) {
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 35b8b94..acd2579 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -145,9 +145,14 @@ do_test() {
 # Split original _install_opts to two parts.
 # One is the options to install contents, the other is the parameters \
 # when running command "make install"
-_install_opts = "\
-  install.libs install.includes install.man \
-"
+# Note that install.libs will also implicitly install header files,
+# so we do not need to explicitly specify install.includes.
+# Doing so could in fact result in a race condition, as both targets
+# (install.libs and install.includes) would install the same headers
+# at the same time
+
+_install_opts = " install.libs install.man "
+
 _install_cfgs = "\
   DESTDIR='${D}' \
   PKG_CONFIG_LIBDIR='${libdir}/pkgconfig' \
diff --git a/meta/recipes-core/ncurses/ncurses_6.0+20160213.bb b/meta/recipes-core/ncurses/ncurses_6.0+20160213.bb
index fef4e0f..0d56481 100644
--- a/meta/recipes-core/ncurses/ncurses_6.0+20160213.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.0+20160213.bb
@@ -2,7 +2,6 @@ require ncurses.inc
 
 SRC_URI += "file://tic-hang.patch \
             file://config.cache \
-            file://fix-include-files-race.patch \
 "
 # commit id corresponds to the revision in package version
 SRCREV = "a25949ff653ac5ae7a204381a3ebfd800feeaa01"
-- 
1.9.1


