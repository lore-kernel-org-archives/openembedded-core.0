Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 51E5E77D2F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 16:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490892207; x=1522428207;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=Oq3AeMzR7zzG6nN0RKiuJZRHJ6iiqnZYvgzcheJ2eNc=;
	b=bL5TuYk0LKzwbSy+mQ2D7xT9BJJEpr9BM19EI+pFL+dGU5UrLFTujNwf
	kjrMb2lhwcxTKqGIJ/NsOw7MzC6c4g==;
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Mar 2017 09:43:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,247,1486454400"; d="scan'208";a="66984643"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 30 Mar 2017 09:43:26 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id CF2C72C8001;
	Thu, 30 Mar 2017 09:43:18 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 19:43:21 +0300
Message-Id: <1490892201-37433-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1490864524.13980.343.camel@linuxfoundation.org>
References: <1490864524.13980.343.camel@linuxfoundation.org>
Subject: [PATCHv2] quilt: Fix paths for patch and perl
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
X-List-Received-Date: Thu, 30 Mar 2017 16:43:25 -0000

Currently some shebang lines end up as
    #! /usr/bin/env perl -w
env does not like the argument. Also the current sed to insert env
does not cover the copies ptests use. Fix these issues by:
 - using --with-perl to insert "env"
 - Replacing "-w" in shebang lines with a new "use warning;" line
   before configure

Remove a EXTRA_OECONF_append_class_target from the native recipe.
Don't overwrite EXTRA_OECONF in native: the values should be correct
for native as well.

--with-patch is used within the gnu patch wrapper only: before this
commit the wrapper contained a (build host) path to native patch.

Also tweak one test so busybox mv output is accepted.

All ptests should now pass: Fixes [YOCTO #11221].

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

nativesdk-quilt does not actually exist but using env to find perl
is still good form... So changes in v2:
 * Use --with-perl="${USRBINPATH}/env perl"
 * Instead of "-w" use "use warning;"
 * Use EXTRA_OECONF from .inc for native as well

Thanks,
  Jussi


 meta/recipes-devtools/quilt/quilt-native.inc       |  3 +--
 meta/recipes-devtools/quilt/quilt.inc              |  9 ++++++-
 ...0001-tests-Allow-different-output-from-mv.patch | 29 ++++++++++++++++++++++
 meta/recipes-devtools/quilt/quilt_0.65.bb          | 10 --------
 4 files changed, 38 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-devtools/quilt/quilt/0001-tests-Allow-different-output-from-mv.patch

diff --git a/meta/recipes-devtools/quilt/quilt-native.inc b/meta/recipes-devtools/quilt/quilt-native.inc
index fce5fa1..adbd77a 100644
--- a/meta/recipes-devtools/quilt/quilt-native.inc
+++ b/meta/recipes-devtools/quilt/quilt-native.inc
@@ -5,8 +5,7 @@ INHIBIT_AUTOTOOLS_DEPS = "1"
 inherit native
 
 PATCHTOOL = "patch"
-EXTRA_OECONF = "--disable-nls"
-EXTRA_OECONF_append_class-target = "--with-perl=perl"
+EXTRA_OECONF_append = "--disable-nls"
 
 do_configure () {
 	oe_runconf
diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index 57e2a14..c7bb741 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -8,6 +8,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/quilt/quilt-${PV}.tar.gz \
         file://run-ptest \
         file://Makefile \
         file://test.sh \
+        file://0001-tests-Allow-different-output-from-mv.patch \
 "
 
 SRC_URI[md5sum] = "c67ba0228f5b7b8bbe469474661f92d6"
@@ -33,10 +34,16 @@ RDEPENDS_${PN} = "bash"
 EXTRA_OE_MAKE_ARGS_darwin ?= ""
 EXTRA_OE_MAKE_ARGS ?= "BUILD_ROOT=${D}"
 
-EXTRA_OECONF = "--with-perl=perl"
+EXTRA_OECONF = "--with-perl='${USRBINPATH}/env perl' --with-patch=patch"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_BASH=/bin/bash"
 
+# Make sure we don't have "-w" in shebang lines: it breaks using
+# "/usr/bin/env perl" as parser
+do_configure_prepend () {
+	find ${S} -name "*.in" -exec sed -i -e "1s,^#\!.*@PERL@ -w$,#\! @PERL@\nuse warnings;," {} \;
+}
+
 # Don't setup symlinks to host utilities, we don't need them
 do_configure_append () {
 	sed -e 's,^COMPAT_SYMLINKS.*:=.*,COMPAT_SYMLINKS	:=,' -i ${S}/Makefile
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


