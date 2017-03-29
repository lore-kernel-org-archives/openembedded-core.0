Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CB39377BFF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 14:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490798669; x=1522334669;
	h=from:to:cc:subject:date:message-id;
	bh=H5vdfTXGGaxMTq8mM3KVJlPuaY+PgGN3SAoI8j90RnY=;
	b=CtjO6C48HD4dhEWXxYAXVG0pvXXN2erznwZQXBWI0MOIEAxwSDiwkgJ+
	3srOzyfoOVHMduAcFR+/zRZRrWpOIg==;
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Mar 2017 07:44:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,241,1486454400"; d="scan'208";a="1148396933"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 29 Mar 2017 07:44:21 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 903096A4080;
	Wed, 29 Mar 2017 07:44:13 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Mar 2017 17:44:07 +0300
Message-Id: <1490798647-28191-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] quilt: Fix paths for patch and perl
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
X-List-Received-Date: Wed, 29 Mar 2017 14:44:28 -0000

--with-perl value is used as part of shebang lines: the previous
do_install_append hack did not work as it was often used as
    #! /usr/bin/env perl -w
Env does not support arguments, set --with-perl instead. Native
recipe already overrides this so should not break.

--with-patch is used within the gnu patch wrapper only: before this
commit the wrapper contained a path to (build host) native patch.

Also tweak one test so busybox mv output is accepted.

All ptests should now pass: Fixes [YOCTO #11221].

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-devtools/quilt/quilt.inc              |  3 ++-
 ...0001-tests-Allow-different-output-from-mv.patch | 29 ++++++++++++++++++++++
 meta/recipes-devtools/quilt/quilt_0.65.bb          | 10 --------
 3 files changed, 31 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-devtools/quilt/quilt/0001-tests-Allow-different-output-from-mv.patch

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index 57e2a14..e6a63ce 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -8,6 +8,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/quilt/quilt-${PV}.tar.gz \
         file://run-ptest \
         file://Makefile \
         file://test.sh \
+        file://0001-tests-Allow-different-output-from-mv.patch \
 "
 
 SRC_URI[md5sum] = "c67ba0228f5b7b8bbe469474661f92d6"
@@ -33,7 +34,7 @@ RDEPENDS_${PN} = "bash"
 EXTRA_OE_MAKE_ARGS_darwin ?= ""
 EXTRA_OE_MAKE_ARGS ?= "BUILD_ROOT=${D}"
 
-EXTRA_OECONF = "--with-perl=perl"
+EXTRA_OECONF = "--with-perl=${bindir}/perl --with-patch=patch"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_BASH=/bin/bash"
 
diff --git a/meta/recipes-devtools/quilt/quilt/0001-tests-Allow-different-output-from-mv.patch b/meta/recipes-devtools/quilt/quilt/0001-tests-Allow-different-output-from-mv.patch
new file mode 100644
index 0000000..21219a0
--- /dev/null
+++ b/meta/recipes-devtools/quilt/quilt/0001-tests-Allow-different-output-from-mv.patch
@@ -0,0 +1,29 @@
+From 1530138960cfafbeefb95f2a760954c00b4d0ef0 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Wed, 29 Mar 2017 15:11:59 +0300
+Subject: [PATCH] tests: Allow different output from mv
+
+busybox mv has different error messages: fix the test
+
+Upstream-Status: Inappropriate [embedded]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ test/failbackup.test | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/failbackup.test b/test/failbackup.test
+index 37046f7..fce6725 100644
+--- a/test/failbackup.test
++++ b/test/failbackup.test
+@@ -16,7 +16,7 @@ What happens when refresh fails because of a permission error?
+ 	$ cat > test.txt
+ 	< This is updated test.txt.
+ 	$ quilt refresh --backup
+-	>~ mv: cannot move [`']?%{P}test.diff'? to [`']?%{P}test.diff~'?: Permission denied
++	>~ mv: .*: Permission denied
+ 	$ echo %{?}
+ 	> 1
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/quilt/quilt_0.65.bb b/meta/recipes-devtools/quilt/quilt_0.65.bb
index 00f900a..12859f0 100644
--- a/meta/recipes-devtools/quilt/quilt_0.65.bb
+++ b/meta/recipes-devtools/quilt/quilt_0.65.bb
@@ -4,13 +4,3 @@ RDEPENDS_${PN} += "patch diffstat bzip2 util-linux"
 SRC_URI += "file://aclocal.patch \
             file://gnu_patch_test_fix_target.patch \
            "
-
-# fix build-distro specific perl path in the target perl scripts
-do_install_append() {
-	for perlscript in ${D}${datadir}/quilt/scripts/remove-trailing-ws ${D}${datadir}/quilt/scripts/dependency-graph ${D}${datadir}/quilt/scripts/edmail ${D}${bindir}/guards
-	do
-		if [ -f $perlscript ]; then
-			sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' $perlscript
-		fi
-	done
-}
-- 
2.1.4


