Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FEEC433EF
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 22:06:08 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.346.1652306758202567962
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 15:05:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: joe.slater@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 24BM5pK7025625
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 15:05:51 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 24BM5oWE007250
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 15:05:51 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 11 May 2022 15:05:50 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 11 May 2022 15:05:50 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [hardknott][oe-core][PATCH 1/1] util-linux: fix two CVEs
Date: Wed, 11 May 2022 15:05:50 -0700
Message-ID: <20220511220550.20068-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 22:06:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165530

Advance to 2.38 to fix CVE-2021-3995 and CVE-2021-3996
by pulling that recipe from master.  The first version
on master to fix these was 2.37.4.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 ...d_2.36.2.bb => util-linux-libuuid_2.38.bb} |   2 +-
 meta/recipes-core/util-linux/util-linux.inc   |  18 ++-
 ...-tags-add-use-system-commands-option.patch |  35 -----
 ...RA_LTLIBRARIES-instead-of-noinst_LTL.patch |  49 -------
 .../util-linux/CVE-2021-37600.patch           |  38 -----
 .../util-linux/avoid_parallel_tests.patch     |  27 ++--
 .../util-linux/util-linux/ptest.patch         |  15 +-
 .../util-linux/util-linux/run-ptest           |  24 +---
 ...til-linux_2.36.2.bb => util-linux_2.38.bb} | 130 ++++++++----------
 9 files changed, 98 insertions(+), 240 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.36.2.bb => util-linux-libuuid_2.38.bb} (95%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-tabfiles-tags-add-use-system-commands-option.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch
 rename meta/recipes-core/util-linux/{util-linux_2.36.2.bb => util-linux_2.38.bb} (77%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb
similarity index 95%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb
index 9612c491cd..5d759aed94 100644
--- a/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb
+++ b/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb
@@ -9,7 +9,7 @@ S = "${WORKDIR}/util-linux-${PV}"
 EXTRA_OECONF += "--disable-all-programs --enable-libuuid"
 LICENSE = "BSD-3-Clause"
 
-do_install_append() {
+do_install:append() {
 	rm -rf ${D}${datadir} ${D}${bindir} ${D}${base_bindir} ${D}${sbindir} ${D}${base_sbindir} ${D}${exec_prefix}/sbin
 }
 
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 00b8777b8b..c9bddfb7a6 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -6,11 +6,11 @@ disk partitioning, kernel message management, filesystem creation, and system lo
 
 SECTION = "base"
 
-LICENSE = "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause"
-LICENSE_${PN}-libblkid = "LGPLv2.1+"
-LICENSE_${PN}-libfdisk = "LGPLv2.1+"
-LICENSE_${PN}-libmount = "LGPLv2.1+"
-LICENSE_${PN}-libsmartcols = "LGPLv2.1+"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Clause & BSD-4-Clause"
+LICENSE:${PN}-libblkid = "LGPL-2.1-or-later"
+LICENSE:${PN}-libfdisk = "LGPL-2.1-or-later"
+LICENSE:${PN}-libmount = "LGPL-2.1-or-later"
+LICENSE:${PN}-libsmartcols = "LGPL-2.1-or-later"
 
 LIC_FILES_CHKSUM = "file://README.licensing;md5=0fd5c050c6187d2bf0a4492b7f4e33da \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
@@ -25,7 +25,7 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=0fd5c050c6187d2bf0a4492b7f4e33da
                     file://libsmartcols/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
 "
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/util-linux:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/util-linux:"
 MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.xz \
            file://configure-sbindir.patch \
@@ -35,8 +35,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
-           file://Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch \
-           file://CVE-2021-37600.patch \
-           file://0001-tabfiles-tags-add-use-system-commands-option.patch \
            "
-SRC_URI[sha256sum] = "f7516ba9d8689343594356f0e5e1a5f0da34adfbc89023437735872bb5024c5f"
+
+SRC_URI[sha256sum] = "6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-tabfiles-tags-add-use-system-commands-option.patch b/meta/recipes-core/util-linux/util-linux/0001-tabfiles-tags-add-use-system-commands-option.patch
deleted file mode 100644
index 9f5a3c2d02..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-tabfiles-tags-add-use-system-commands-option.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From be3ecff8b1bc1de4d29ca6381ee9ab42e6c15947 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Fri, 12 Nov 2021 15:33:53 +0800
-Subject: [PATCH] tabfiles-tags: add use-system-commands option
-
-Pass --use-system-commands option to make blkid command available
-Fixes:
- # ./ts/libmount/tabfiles-tags
- [snip]
- ./ts/libmount/../../functions.sh: line 652: /usr/lib64/util-linux/ptest/blkid: No such file or directory
- FAILED (libmount/tabfiles-tags)'
-
-Upstream-Status: Inappropriate [configuration specific]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- tests/ts/libmount/tabfiles-tags | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/ts/libmount/tabfiles-tags b/tests/ts/libmount/tabfiles-tags
-index 69b06a9..17176ef 100755
---- a/tests/ts/libmount/tabfiles-tags
-+++ b/tests/ts/libmount/tabfiles-tags
-@@ -4,7 +4,7 @@ TS_TOPDIR="${0%/*}/../.."
- TS_DESC="tags"
- 
- . $TS_TOPDIR/functions.sh
--ts_init "$*"
-+ts_init "$* --use-system-commands"
- 
- ts_skip_nonroot
- 
--- 
-2.17.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch b/meta/recipes-core/util-linux/util-linux/Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch
deleted file mode 100644
index 272518914e..0000000000
--- a/meta/recipes-core/util-linux/util-linux/Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Author: Luca Boccassi <luca.boccassi@microsoft.com>
-Description: Automake: use EXTRA_LTLIBRARIES instead of noinst_LTLIBRARIES
- noinst_LTLIBRARIES causes the libraries to be always built
- unconditionally. EXTRA_LTLIBRARIES causes them to be built
- only if other build target needs them.
- In other words, avoid building libcommon.a and libtcolors.a
- unless they are needed by another library/executable and
- save some build time.
-Upstream-Status: backport, commit:c65953d72bbc7412f32e566d9fa6e780d84f0696
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -39,7 +39,7 @@ bashcompletiondir = @bashcompletiondir@
- 
- dist_noinst_HEADERS =
- noinst_PROGRAMS =
--noinst_LTLIBRARIES =
-+EXTRA_LTLIBRARIES =
- usrbin_exec_PROGRAMS =
- usrsbin_exec_PROGRAMS =
- dist_man_MANS =
-@@ -169,7 +169,7 @@ else
- edit_cmd += -e 's|@vendordir[@]||g'
- endif
- 
--CLEANFILES += $(PATHFILES)
-+CLEANFILES += $(PATHFILES) $(EXTRA_LTLIBRARIES)
- EXTRA_DIST += $(PATHFILES:=.in)
- 
- $(PATHFILES): Makefile
---- a/lib/Makemodule.am
-+++ b/lib/Makemodule.am
-@@ -9,7 +9,7 @@
- # Note that you need "make install-strip" (or proper rpm / Debian build)
- # to generate binaries with only relevant stuff.
- #
--noinst_LTLIBRARIES += libcommon.la
-+EXTRA_LTLIBRARIES += libcommon.la
- libcommon_la_CFLAGS = $(AM_CFLAGS)
- libcommon_la_SOURCES = \
- 	lib/blkdev.c \
-@@ -59,7 +59,7 @@ libcommon_la_SOURCES += lib/sysfs.c
- endif
- endif
- 
--noinst_LTLIBRARIES += libtcolors.la
-+EXTRA_LTLIBRARIES += libtcolors.la
- libtcolors_la_CFLAGS = $(AM_CFLAGS)
- libtcolors_la_SOURCES = lib/colors.c lib/color-names.c include/colors.h include/color-names.h
- libtcolors_la_LIBADD =
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch b/meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch
deleted file mode 100644
index 11934eee8d..0000000000
--- a/meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 1c9143d0c1f979c3daf10e1c37b5b1e916c22a1c Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Tue, 27 Jul 2021 11:58:31 +0200
-Subject: [PATCH] sys-utils/ipcutils: be careful when call calloc() for uint64
- nmembs
-
-Fix: https://github.com/karelzak/util-linux/issues/1395
-Signed-off-by: Karel Zak <kzak@redhat.com>
-
-CVE: CVE-2021-37600
-
-after version 2.37.1
-https://github.com/karelzak/util-linux.git 1c9143d0c1d...
-unmodified
-
-Upstream-Status: Backport
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
----
- sys-utils/ipcutils.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sys-utils/ipcutils.c b/sys-utils/ipcutils.c
-index e784c4d..18868cf 100644
---- a/sys-utils/ipcutils.c
-+++ b/sys-utils/ipcutils.c
-@@ -218,7 +218,7 @@ static void get_sem_elements(struct sem_data *p)
- {
- 	size_t i;
- 
--	if (!p || !p->sem_nsems || p->sem_perm.id < 0)
-+	if (!p || !p->sem_nsems || p->sem_nsems > SIZE_MAX || p->sem_perm.id < 0)
- 		return;
- 
- 	p->elements = xcalloc(p->sem_nsems, sizeof(struct sem_elem));
--- 
-2.7.4
-
diff --git a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
index 748b6ef096..f1cbdb3beb 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,20 +1,29 @@
+From ee3c7812e1efa6719af68b994804f0e6caceabd8 Mon Sep 17 00:00:00 2001
+From: Tudor Florea <tudor.florea@enea.com>
+Date: Mon, 14 Jun 2021 14:00:31 +0200
+Subject: [PATCH] util-linux: Add ptest
+
 Ptest needs buildtest-TESTS and runtest-TESTS targets.
 serial-tests is required to generate those targets.
-Revert run.sh script accordingly to serialize running tests 
+Revert run.sh script accordingly to serialize running tests
 
 Signed-off-by: Tudor Florea  <tudor.florea@enea.com>
-Upstream-Status: Inappropriate 
+Upstream-Status: Inappropriate
+
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: util-linux-2.32/configure.ac
-===================================================================
---- util-linux-2.32.orig/configure.ac
-+++ util-linux-2.32/configure.ac
+diff --git a/configure.ac b/configure.ac
+index 5664f9f..075ef27 100644
+--- a/configure.ac
++++ b/configure.ac
 @@ -11,7 +11,7 @@ AC_CONFIG_MACRO_DIR([m4])
  dnl AC_USE_SYSTEM_EXTENSIONS must be called before any macros that run
- dnl the compiler (like AC_PROG_LIBTOOL) to avoid autoconf errors.
+ dnl the compiler (like LT_INIT) to avoid autoconf errors.
  AC_USE_SYSTEM_EXTENSIONS
--AM_INIT_AUTOMAKE([-Wall foreign 1.10 tar-pax no-dist-gzip dist-xz subdir-objects])
-+AM_INIT_AUTOMAKE([-Wall foreign 1.10 tar-pax no-dist-gzip dist-xz subdir-objects serial-tests])
+-AM_INIT_AUTOMAKE([-Wall -Wno-portability foreign 1.10 tar-pax no-dist-gzip dist-xz subdir-objects])
++AM_INIT_AUTOMAKE([-Wall -Wno-portability foreign 1.10 tar-pax no-dist-gzip dist-xz subdir-objects serial-tests])
  
  m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])],
  			    [AC_SUBST([AM_DEFAULT_VERBOSITY], [1])])
diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/recipes-core/util-linux/util-linux/ptest.patch
index 0537f7d856..ba2bd3f6ac 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,23 +1,24 @@
-Define TESTS variable
+From af073c13ef184ca75811df688e0a0a25827b36c3 Mon Sep 17 00:00:00 2001
+From: Tudor Florea <tudor.florea@enea.com>
+Date: Thu, 3 Dec 2015 04:08:00 +0100
+Subject: [PATCH] Define TESTS variable
 
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Upstream-Status: Pending
+
 ---
  Makefile.am | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index bbaccb1..7d5a6bb 100644
+index 886598d..1cf4346 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -48,6 +48,7 @@ systemdsystemunit_DATA =
+@@ -57,6 +57,7 @@ systemdsystemunit_DATA =
  dist_bashcompletion_DATA =
  check_PROGRAMS =
  dist_check_SCRIPTS =
 +TESTS = $(check_PROGRAMS)
  
  PATHFILES =
- 
--- 
-2.8.3
-
+ ADOCFILES_COMMON =
diff --git a/meta/recipes-core/util-linux/util-linux/run-ptest b/meta/recipes-core/util-linux/util-linux/run-ptest
index e135ee583b..097107cd09 100644
--- a/meta/recipes-core/util-linux/util-linux/run-ptest
+++ b/meta/recipes-core/util-linux/util-linux/run-ptest
@@ -13,31 +13,15 @@ current_path=$(readlink -f $0)
 export bindir=$(dirname $current_path)
 export PATH=$bindir/bin:$PATH
 
-cd tests || exit 1                                                          
+# losetup tests will be skipped and/or fail otherwise
+modprobe loop
 
-comps=$(find ts/ -type f -perm -111 -regex ".*/[^\.~]*" |  sort)
-
-
-echo
-echo "-------------------- util-linux regression tests --------------------"
-echo
-echo "                    For development purpose only.                    "
-echo "                 Don't execute on production system!                 "
-echo
-
-res=0
-count=0
-for ts in $comps; 
-do 
-   $ts | sed -u '{        
+./tests/run.sh --use-system-commands --parsable --show-diff | sed -u '{
       s/^\(.*\):\(.*\) \.\.\. OK$/PASS: \1:\2/                              
       s/^\(.*\):\(.*\) \.\.\. FAILED \(.*\)$/FAIL: \1:\2 \3/                
       s/^\(.*\):\(.*\) \.\.\. SKIPPED \(.*\)$/SKIP: \1:\2 \3/               
-   }' 
-done
-
+   }'
 
 if [ "x$UDEV_PID" != "x" ]; then
     /etc/init.d/udev start
 fi
-
diff --git a/meta/recipes-core/util-linux/util-linux_2.36.2.bb b/meta/recipes-core/util-linux/util-linux_2.38.bb
similarity index 77%
rename from meta/recipes-core/util-linux/util-linux_2.36.2.bb
rename to meta/recipes-core/util-linux/util-linux_2.38.bb
index 5a28c093e9..9531bbde47 100644
--- a/meta/recipes-core/util-linux/util-linux_2.36.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.38.bb
@@ -10,12 +10,12 @@ PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', '${PN}-pylibmou
 python util_linux_binpackages () {
     def pkg_hook(f, pkg, file_regex, output_pattern, modulename):
         pn = d.getVar('PN')
-        d.appendVar('RRECOMMENDS_%s' % pn, ' %s' % pkg)
+        d.appendVar('RRECOMMENDS:%s' % pn, ' %s' % pkg)
 
-        if d.getVar('ALTERNATIVE_' + pkg):
+        if d.getVar('ALTERNATIVE:' + pkg):
             return
         if d.getVarFlag('ALTERNATIVE_LINK_NAME', modulename):
-            d.setVar('ALTERNATIVE_' + pkg, modulename)
+            d.setVar('ALTERNATIVE:' + pkg, modulename)
 
     bindirs = sorted(list(set(d.expand("${base_sbindir} ${base_bindir} ${sbindir} ${bindir}").split())))
     for dir in bindirs:
@@ -37,13 +37,14 @@ python util_linux_binpackages () {
                     continue
 
                 pkg = os.path.basename(os.readlink(file))
-                extras[pkg] = extras.get(pkg, '') + ' ' + file.replace(dvar, '', 1)
+                extras.setdefault(pkg, [])
+                extras[pkg].append(file.replace(dvar, '', 1))
 
     pn = d.getVar('PN')
     for pkg, links in extras.items():
-        of = d.getVar('FILES_' + pn + '-' + pkg)
-        links = of + links
-        d.setVar('FILES_' + pn + '-' + pkg, links)
+        of = d.getVar('FILES:' + pn + '-' + pkg)
+        links = of + " " + " ".join(sorted(links))
+        d.setVar('FILES:' + pn + '-' + pkg, links)
 }
 
 # we must execute before update-alternatives PACKAGE_PREPROCESS_FUNCS
@@ -63,7 +64,7 @@ PACKAGES_DYNAMIC = "^${PN}-.*"
 
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=ms"
 UTIL_LINUX_LIBDIR = "${libdir}"
-UTIL_LINUX_LIBDIR_class-target = "${base_libdir}"
+UTIL_LINUX_LIBDIR:class-target = "${base_libdir}"
 EXTRA_OECONF = "\
     --enable-libuuid --enable-libblkid \
     \
@@ -71,7 +72,7 @@ EXTRA_OECONF = "\
     --enable-mount --enable-partx --enable-raw --enable-rfkill \
     --enable-unshare --enable-write \
     \
-    --disable-bfs --disable-chfn-chsh --disable-login \
+    --disable-bfs --disable-login \
     --disable-makeinstall-chown --disable-minix --disable-newgrp \
     --disable-use-tty-group --disable-vipw --disable-raw \
     \
@@ -81,17 +82,17 @@ EXTRA_OECONF = "\
     --libdir='${UTIL_LINUX_LIBDIR}' \
 "
 
-EXTRA_OECONF_append_class-target = " --enable-setpriv"
-EXTRA_OECONF_append_class-native = " --without-cap-ng --disable-setpriv"
-EXTRA_OECONF_append_class-nativesdk = " --without-cap-ng --disable-setpriv"
-EXTRA_OECONF_append = " --disable-hwclock-gplv3"
+EXTRA_OECONF:append:class-target = " --enable-setpriv"
+EXTRA_OECONF:append:class-native = " --without-cap-ng --disable-setpriv"
+EXTRA_OECONF:append:class-nativesdk = " --without-cap-ng --disable-setpriv"
+EXTRA_OECONF:append = " --disable-hwclock-gplv3"
 
 # enable pcre2 for native/nativesdk to match host distros
 # this helps to keep same expectations when using the SDK or
 # build host versions during development
 #
 PACKAGECONFIG ?= "pcre2"
-PACKAGECONFIG_class-target ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
+PACKAGECONFIG:class-target ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'chfn-chsh pam', '', d)}"
 # inherit manpages requires this to be present, however util-linux does not have
 # configuration options, and installs manpages always
 PACKAGECONFIG[manpages] = ""
@@ -105,51 +106,51 @@ PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 # PCRE support in hardlink
 PACKAGECONFIG[pcre2] = ",,libpcre2"
 PACKAGECONFIG[cryptsetup] = "--with-cryptsetup,--without-cryptsetup,cryptsetup"
+PACKAGECONFIG[chfn-chsh] = "--enable-chfn-chsh,--disable-chfn-chsh,"
 
 EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'"
 
-ALLOW_EMPTY_${PN} = "1"
-FILES_${PN} = ""
-FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
-FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.la"
-FILES_${PN}-mount = "${sysconfdir}/default/mountall"
-FILES_${PN}-runuser = "${sysconfdir}/pam.d/runuser*"
-FILES_${PN}-su = "${sysconfdir}/pam.d/su-l"
-FILES_${PN}-uuidd = " \
+ALLOW_EMPTY:${PN} = "1"
+FILES:${PN} = ""
+FILES:${PN}-doc += "${datadir}/getopt/getopt-*.*"
+FILES:${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.la"
+FILES:${PN}-mount = "${sysconfdir}/default/mountall"
+FILES:${PN}-runuser = "${sysconfdir}/pam.d/runuser*"
+FILES:${PN}-su = "${sysconfdir}/pam.d/su-l"
+FILES:${PN}-uuidd = " \
     /etc/tmpfiles.d/uuidd.conf \
     /etc/default/volatiles/99_uuidd \
 "
-
-CONFFILES_${PN}-su = "${sysconfdir}/pam.d/su-l"
-FILES_${PN}-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so \
+CONFFILES:${PN}-su = "${sysconfdir}/pam.d/su-l"
+FILES:${PN}-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so \
                           ${PYTHON_SITEPACKAGES_DIR}/libmount/__init__.* \
                           ${PYTHON_SITEPACKAGES_DIR}/libmount/__pycache__/*"
 
 # Util-linux' blkid replaces the e2fsprogs one
-RCONFLICTS_${PN}-blkid = "${MLPREFIX}e2fsprogs-blkid"
-RREPLACES_${PN}-blkid = "${MLPREFIX}e2fsprogs-blkid"
+RCONFLICTS:${PN}-blkid = "${MLPREFIX}e2fsprogs-blkid"
+RREPLACES:${PN}-blkid = "${MLPREFIX}e2fsprogs-blkid"
 
-RRECOMMENDS_${PN}_class-native = ""
-RRECOMMENDS_${PN}_class-nativesdk = ""
-RDEPENDS_${PN}_class-native = ""
-RDEPENDS_${PN}_class-nativesdk = ""
+RRECOMMENDS:${PN}:class-native = ""
+RRECOMMENDS:${PN}:class-nativesdk = ""
+RDEPENDS:${PN}:class-native = ""
+RDEPENDS:${PN}:class-nativesdk = ""
 
-RDEPENDS_${PN} += " util-linux-libuuid"
-RDEPENDS_${PN}-dev += " util-linux-libuuid-dev"
+RDEPENDS:${PN} += " util-linux-libuuid"
+RDEPENDS:${PN}-dev += " util-linux-libuuid-dev"
 
-RPROVIDES_${PN}-dev = "${PN}-libblkid-dev ${PN}-libmount-dev"
+RPROVIDES:${PN}-dev = "${PN}-libblkid-dev ${PN}-libmount-dev"
 
-RDEPENDS_${PN}-bash-completion += "${PN}-lsblk"
-RDEPENDS_${PN}-ptest += "bash bc btrfs-tools coreutils e2fsprogs grep iproute2 kmod mdadm procps sed socat which xz"
-RRECOMMENDS_${PN}-ptest += "kernel-module-scsi-debug"
-RDEPENDS_${PN}-swaponoff = "${PN}-swapon ${PN}-swapoff"
-ALLOW_EMPTY_${PN}-swaponoff = "1"
+RDEPENDS:${PN}-bash-completion += "${PN}-lsblk"
+RDEPENDS:${PN}-ptest += "bash bc btrfs-tools coreutils e2fsprogs findutils grep iproute2 kmod mdadm procps sed socat which xz"
+RRECOMMENDS:${PN}-ptest += "kernel-module-scsi-debug kernel-module-sd-mod kernel-module-loop kernel-module-algif-hash"
+RDEPENDS:${PN}-swaponoff = "${PN}-swapon ${PN}-swapoff"
+ALLOW_EMPTY:${PN}-swaponoff = "1"
 
 #SYSTEMD_PACKAGES = "${PN}-uuidd ${PN}-fstrim"
-SYSTEMD_SERVICE_${PN}-uuidd = "uuidd.socket uuidd.service"
-SYSTEMD_AUTO_ENABLE_${PN}-uuidd = "disable"
-SYSTEMD_SERVICE_${PN}-fstrim = "fstrim.timer fstrim.service"
-SYSTEMD_AUTO_ENABLE_${PN}-fstrim = "disable"
+SYSTEMD_SERVICE:${PN}-uuidd = "uuidd.socket uuidd.service"
+SYSTEMD_AUTO_ENABLE:${PN}-uuidd = "disable"
+SYSTEMD_SERVICE:${PN}-fstrim = "fstrim.timer fstrim.service"
+SYSTEMD_AUTO_ENABLE:${PN}-fstrim = "disable"
 
 pkg_postinst_${PN}-uuidd() {
 	if [ -z "$D" ] && [ -e ${sysconfdir}/init.d/populate-volatile.sh ] ; then
@@ -194,7 +195,7 @@ do_install () {
 	rm -f ${D}${bindir}/chkdupexe
 }
 
-do_install_append_class-target () {
+do_install:append:class-target () {
 	if [ "${@bb.utils.filter('PACKAGECONFIG', 'pam', d)}" ]; then
 		install -d ${D}${sysconfdir}/pam.d
 		install -m 0644 ${WORKDIR}/runuser.pamd ${D}${sysconfdir}/pam.d/runuser
@@ -217,14 +218,14 @@ do_install_append_class-target () {
 }
 # nologin causes a conflict with shadow-native
 # kill causes a conflict with coreutils-native (if ${bindir}==${base_bindir})
-do_install_append_class-native () {
+do_install:append:class-native () {
 	rm -f ${D}${base_sbindir}/nologin
 	rm -f ${D}${base_bindir}/kill
 }
 
 # dm-verity support introduces a circular build dependency, so util-linux-libuuid is split out for target builds
 # Need to build libuuid for uuidgen, but then delete it and let the other recipe ship it
-do_install_append () {
+do_install:append () {
 	rm -rf ${D}${includedir}/uuid ${D}${libdir}/pkgconfig/uuid.pc ${D}${libdir}/libuuid* ${D}${base_libdir}/libuuid*
 }
 
@@ -233,24 +234,27 @@ ALTERNATIVE_PRIORITY = "80"
 ALTERNATIVE_LINK_NAME[blkid] = "${base_sbindir}/blkid"
 ALTERNATIVE_LINK_NAME[blockdev] = "${base_sbindir}/blockdev"
 ALTERNATIVE_LINK_NAME[cal] = "${bindir}/cal"
+ALTERNATIVE_LINK_NAME[chfn] = "${bindir}/chfn"
+ALTERNATIVE_LINK_NAME[chsh] = "${bindir}/chsh"
 ALTERNATIVE_LINK_NAME[chrt] = "${bindir}/chrt"
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
 ALTERNATIVE_LINK_NAME[fallocate] = "${bindir}/fallocate"
 ALTERNATIVE_LINK_NAME[fdisk] = "${base_sbindir}/fdisk"
+ALTERNATIVE_LINK_NAME[findfs] = "${sbindir}/findfs"
 ALTERNATIVE_LINK_NAME[flock] = "${bindir}/flock"
 ALTERNATIVE_LINK_NAME[fsck] = "${base_sbindir}/fsck"
 ALTERNATIVE_LINK_NAME[fsfreeze] = "${sbindir}/fsfreeze"
 ALTERNATIVE_LINK_NAME[fstrim] = "${base_sbindir}/fstrim"
 ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
-ALTERNATIVE_${PN}-agetty = "getty"
+ALTERNATIVE:${PN}-agetty = "getty"
 ALTERNATIVE_LINK_NAME[getty] = "${base_sbindir}/getty"
 ALTERNATIVE_TARGET[getty] = "${base_sbindir}/agetty"
 ALTERNATIVE_LINK_NAME[hexdump] = "${bindir}/hexdump"
 ALTERNATIVE_LINK_NAME[hwclock] = "${base_sbindir}/hwclock"
 ALTERNATIVE_LINK_NAME[ionice] = "${bindir}/ionice"
 ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
-ALTERNATIVE_${PN}-last = "last lastb"
+ALTERNATIVE:${PN}-last = "last lastb"
 ALTERNATIVE_LINK_NAME[last] = "${bindir}/last"
 ALTERNATIVE_LINK_NAME[lastb] = "${bindir}/lastb"
 ALTERNATIVE_LINK_NAME[logger] = "${bindir}/logger"
@@ -284,11 +288,11 @@ ALTERNATIVE_LINK_NAME[utmpdump] = "${bindir}/utmpdump"
 ALTERNATIVE_LINK_NAME[uuidgen] = "${bindir}/uuidgen"
 ALTERNATIVE_LINK_NAME[wall] = "${bindir}/wall"
 
-ALTERNATIVE_${PN}-doc = "\
+ALTERNATIVE:${PN}-doc = "\
 blkid.8 eject.1 findfs.8 fsck.8 kill.1 last.1 lastb.1 libblkid.3 logger.1 mesg.1 \
 mountpoint.1 nologin.8 rfkill.8 sulogin.8 utmpdump.1 uuid.3 wall.1\
 "
-ALTERNATIVE_${PN}-doc += "${@bb.utils.contains('PACKAGECONFIG', 'pam', 'su.1', '', d)}"
+ALTERNATIVE:${PN}-doc += "${@bb.utils.contains('PACKAGECONFIG', 'pam', 'su.1', '', d)}"
 
 ALTERNATIVE_LINK_NAME[blkid.8] = "${mandir}/man8/blkid.8"
 ALTERNATIVE_LINK_NAME[eject.1] = "${mandir}/man1/eject.1"
@@ -310,7 +314,6 @@ ALTERNATIVE_LINK_NAME[utmpdump.1] = "${mandir}/man1/utmpdump.1"
 ALTERNATIVE_LINK_NAME[uuid.3] = "${mandir}/man3/uuid.3"
 ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
 
-
 BBCLASSEXTEND = "native nativesdk"
 
 PTEST_BINDIR = "1"
@@ -329,25 +332,10 @@ do_install_ptest() {
     cp -pR ${S}/tests/ts ${D}${PTEST_PATH}/tests/
     cp ${WORKDIR}/build/config.h ${D}${PTEST_PATH}
 
-    # The original paths of executables to be tested point to a local folder containing
-    # the executables. We want to test the installed executables, not the local copies.
-    # So strip the paths, the executables will be located via "which"
-    sed  -i \
-         -e '/^TS_CMD/ s|$top_builddir/||g' \
-         -e '/^TS_HELPER/ s|$top_builddir|${PTEST_PATH}|g' \
-         ${D}${PTEST_PATH}/tests/commands.sh
-
-    # Change 'if [ ! -x "$1" ]' to 'if [ ! -x "`which $1 2>/dev/null`"]'
-    sed -i -e \
-        '/^\tif[[:space:]]\[[[:space:]]![[:space:]]-x[[:space:]]"$1"/s|$1|`which $1 2>/dev/null`|g' \
-         ${D}${PTEST_PATH}/tests/functions.sh
-
-    # Running "kill" without the the complete path would use the shell's built-in kill
-    sed -i -e \
-         '/^TS_CMD_KILL/ s|kill|${PTEST_PATH}/bin/kill|g' \
-         ${D}${PTEST_PATH}/tests/commands.sh
-
-
-    sed -i 's|@base_sbindir@|${base_sbindir}|g'       ${D}${PTEST_PATH}/run-ptest
+    sed -i 's|@base_sbindir@|${base_sbindir}|g' ${D}${PTEST_PATH}/run-ptest
 
+    # chfn needs PAM
+    if ! ${@bb.utils.contains('PACKAGECONFIG', 'pam', 'true', 'false', d)}; then
+        rm -rf ${D}${PTEST_PATH}/tests/ts/chfn
+    fi
 }
-- 
2.35.1


