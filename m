Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.39491.1605551303698542795
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 10:28:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 16EBA38C110B
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 18:28:23 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] elfutils: upgrading to 0.182 FAILED
Message-ID: <MADEUP.1648106789677CF0.12355@lists.openembedded.org>
X-Groupsio-MsgNum: 144639
Content-Type: multipart/mixed; boundary="===============5381774450379339731=="

--===============5381774450379339731==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *elfutils* to *0.182* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-elfutils-upgrade-0.181-0.182.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============5381774450379339731==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-elfutils-upgrade-0.181-0.182.patch"

From 81b8ff8d7355969b85d38a21a9540639e923ba0c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 16 Nov 2020 13:44:27 +0000
Subject: [PATCH] elfutils: upgrade 0.181 -> 0.182

---
 .../elfutils/{elfutils_0.181.bb => elfutils_0.182.bb}     | 8 ++++++--
 .../elfutils/files/0001-musl-obstack-fts.patch            | 6 +++---
 meta/recipes-devtools/elfutils/files/0002-musl-libs.patch | 8 ++++----
 .../recipes-devtools/elfutils/files/0003-musl-utils.patch | 6 +++---
 .../elfutils/files/0004-Fix-error-on-musl.patch           | 2 +-
 .../files/0015-config-eu.am-do-not-use-Werror.patch       | 2 +-
 meta/recipes-devtools/elfutils/files/run-ptest            | 6 ------
 7 files changed, 18 insertions(+), 20 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.181.bb => elfutils_0.182.bb} (95%)
 delete mode 100644 meta/recipes-devtools/elfutils/files/run-ptest

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.181.bb b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
similarity index 95%
rename from meta/recipes-devtools/elfutils/elfutils_0.181.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.182.bb
index 6c49a5fc26..1277bac53d 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.181.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
@@ -17,9 +17,13 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch \
            file://0001-skip-the-test-when-gcc-not-deployed.patch \
            file://0001-ppc_initreg.c-Incliude-asm-ptrace.h-for-pt_regs-defi.patch \
-           file://run-ptest \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
+           file://0001-musl-obstack-fts.patch \
+           file://0002-musl-libs.patch \
+           file://0003-musl-utils.patch \
+           file://0004-Fix-error-on-musl.patch \
+           file://0015-config-eu.am-do-not-use-Werror.patch \
            "
 SRC_URI_append_libc-musl = " \
            file://0001-musl-obstack-fts.patch \
@@ -28,7 +32,7 @@ SRC_URI_append_libc-musl = " \
            file://0004-Fix-error-on-musl.patch \
            file://0015-config-eu.am-do-not-use-Werror.patch \
            "
-SRC_URI[sha256sum] = "29a6ad7421ec2acfee489bb4a699908281ead2cb63a20a027ce8804a165f0eb3"
+SRC_URI[sha256sum] = "ecc406914edf335f0b7fc084ebe6c460c4d6d5175bfdd6688c1c78d9146b8858"
 
 inherit autotools gettext ptest pkgconfig
 
diff --git a/meta/recipes-devtools/elfutils/files/0001-musl-obstack-fts.patch b/meta/recipes-devtools/elfutils/files/0001-musl-obstack-fts.patch
index 67d4703c80..ca7caf08d8 100644
--- a/meta/recipes-devtools/elfutils/files/0001-musl-obstack-fts.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-musl-obstack-fts.patch
@@ -1,4 +1,4 @@
-From 1a62bb8e8f2cb0f180c749946a48114e8f391b55 Mon Sep 17 00:00:00 2001
+From dbaa05a519acfe4f6040784f5d4a28ca586c0fc4 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Aug 2019 10:17:25 +0800
 Subject: [PATCH] musl-obstack-fts
@@ -20,10 +20,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  3 files changed, 58 insertions(+), 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index ab9c751..b057d86 100644
+index 53bab6a..dfea85e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -538,6 +538,60 @@ else
+@@ -539,6 +539,60 @@ else
  fi
  AC_SUBST([argp_LDADD])
  
diff --git a/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch b/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
index 894e46c3c4..ad71fe4dee 100644
--- a/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
+++ b/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
@@ -1,4 +1,4 @@
-From 2e1f8ca0b67c1d1991c14d509938c347e09bae94 Mon Sep 17 00:00:00 2001
+From 1e17a6e128d81f7a88fc5db0c38dc9db5ee53049 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Aug 2019 10:18:47 +0800
 Subject: [PATCH] musl-libs
@@ -104,7 +104,7 @@ index 7bcf61c..11dcc8b 100644
        return elf_errmsg (error & 0xffff);
      case OTHER_ERROR (LIBDW):
 diff --git a/libdwfl/linux-kernel-modules.c b/libdwfl/linux-kernel-modules.c
-index 0434f1e..5afaee8 100644
+index 548cb56..0900d8f 100644
 --- a/libdwfl/linux-kernel-modules.c
 +++ b/libdwfl/linux-kernel-modules.c
 @@ -50,6 +50,7 @@
@@ -116,7 +116,7 @@ index 0434f1e..5afaee8 100644
  /* If fts.h is included before config.h, its indirect inclusions may not
     give us the right LFS aliases of these functions, so map them manually.  */
 diff --git a/libelf/elf.h b/libelf/elf.h
-index 197b557..8e5b94c 100644
+index ff9f1da..1de8e82 100644
 --- a/libelf/elf.h
 +++ b/libelf/elf.h
 @@ -21,7 +21,9 @@
@@ -130,7 +130,7 @@ index 197b557..8e5b94c 100644
  
  /* Standard ELF types.  */
  
-@@ -4103,6 +4105,7 @@ enum
+@@ -4105,6 +4107,7 @@ enum
  #define R_ARC_TLS_LE_S9		0x4a
  #define R_ARC_TLS_LE_32		0x4b
  
diff --git a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
index 2a21cd37ce..a8b39b5f93 100644
--- a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
@@ -1,4 +1,4 @@
-From 9b237f19f82d5ab1e0702637fece1866b1ef6681 Mon Sep 17 00:00:00 2001
+From e7e5333ed2e19f25ecbd7121f424eec99d61265a Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Aug 2019 10:19:48 +0800
 Subject: [PATCH] musl-utils
@@ -58,7 +58,7 @@ index 6ba6af4..0c7674b 100644
  ARGP_PROGRAM_VERSION_HOOK_DEF = print_version;
  
 diff --git a/src/readelf.c b/src/readelf.c
-index 685d0b1..a842b10 100644
+index 64067a5..630739c 100644
 --- a/src/readelf.c
 +++ b/src/readelf.c
 @@ -4829,10 +4829,11 @@ listptr_base (struct listptr *p)
@@ -142,7 +142,7 @@ index 48792a7..198a2e4 100644
  
  /* Name and version of program.  */
 diff --git a/src/unstrip.c b/src/unstrip.c
-index 9b8c09a..1fb5063 100644
+index a855038..df6fc1c 100644
 --- a/src/unstrip.c
 +++ b/src/unstrip.c
 @@ -56,6 +56,15 @@
diff --git a/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch b/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch
index c79c737c62..0d162ebe1b 100644
--- a/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch
+++ b/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch
@@ -1,4 +1,4 @@
-From d3dc5f98f653342af97ebfbdf3479ee1f0d0cf38 Mon Sep 17 00:00:00 2001
+From ed87f11f7297c0edb3ca8950de1cc23e9b96217c Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 1 May 2019 22:15:03 +0100
 Subject: [PATCH] Fix error on musl:
diff --git a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
index 48fd4d41f3..ec1b927c2e 100644
--- a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
+++ b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
@@ -1,4 +1,4 @@
-From 9b7554a3e21ccb455b3661a6b4e767636c2c5cf3 Mon Sep 17 00:00:00 2001
+From 574ac484c01125a97ba8737cf7292ca926897310 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jun 2020 21:35:16 +0000
 Subject: [PATCH] config/eu.am: do not use -Werror
diff --git a/meta/recipes-devtools/elfutils/files/run-ptest b/meta/recipes-devtools/elfutils/files/run-ptest
deleted file mode 100644
index 81b81f2f5d..0000000000
--- a/meta/recipes-devtools/elfutils/files/run-ptest
+++ /dev/null
@@ -1,6 +0,0 @@
-#!/bin/sh
-#
-#This script is used to run elfutils test suites
-cd tests
-
-make -k runtest-TESTS abs_srcdir=$PWD abs_builddir=$PWD srcdir=$PWD top_srcdir=$PWD/../ abs_top_builddir=$PWD/../ elfutils_testrun=installed elfutils_tests_rpath=no program_transform_name=s,^,eu-,
-- 
2.20.1


--===============5381774450379339731==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1386 entries from dependency cache.
Parsing recipes...done.
Parsing of 791 .bb files complete (790 cached, 1 parsed). 1372 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-20201116"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:53d8aef200d2c4d9fada6971c54209a46603803e"
workspace            = "master:aaf6aa3e530deb4a8d818a55a37b9029980b0b0d"

Initialising tasks...done.
Sstate summary: Wanted 518 Found 172 Missed 346 Current 200 (33% match, 51% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 212 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 221 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 231 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 234 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 243 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 244 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 246 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 260 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 266 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 268 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 273 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 276 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 283 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 284 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 290 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 296 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 301 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 305 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 309 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 315 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 319 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 323 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 328 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 332 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 339 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 343 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 349 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 371 of 718 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 374 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 377 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 380 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 443 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 448 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 451 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 455 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 465 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 469 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 473 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 478 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 483 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 487 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 491 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 573 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 583 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.32.bb:do_stash_locale_setscene)
NOTE: Running task 158 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_fetch)
NOTE: Running noexec task 255 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_fetch)
NOTE: Running noexec task 257 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_fetch)
NOTE: Running task 259 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_fetch)
NOTE: Running task 347 of 2262 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_fetch)
NOTE: recipe python3-dbusmock-0.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-locale-2.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe grep-3.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 504 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_fetch)
NOTE: recipe eudev-3.2.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 547 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_fetch)
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bison-3.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_fetch: Started
NOTE: recipe grep-3.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-locale-2.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe init-system-helpers-1.58-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_fetch: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 616 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_unpack)
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 617 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-native-0.182-r0: task do_fetch: Started
NOTE: recipe zlib-1.2.11-r0: task do_fetch: Succeeded
NOTE: Running task 624 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_fetch)
NOTE: Running task 633 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_unpack)
NOTE: recipe glibc-2.32-r0: task do_stash_locale_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 644 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_fetch: Started
NOTE: recipe sed-4.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 591 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe diffutils-3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 592 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-native-0.182-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 593 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 594 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 646 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_fetch)
NOTE: Running task 647 of 2262 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_unpack)
NOTE: recipe bash-5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_fetch: Succeeded
NOTE: Running setscene task 595 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 648 of 2262 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_prepare_recipe_sysroot)
NOTE: Running task 649 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_unpack)
NOTE: Running task 650 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_fetch)
NOTE: Running task 651 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_fetch)
NOTE: Running task 652 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_fetch)
NOTE: Running task 653 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_fetch)
NOTE: Running task 661 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_fetch)
NOTE: Running task 669 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_fetch)
NOTE: Running task 670 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_fetch)
NOTE: Running task 671 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_fetch)
NOTE: recipe eudev-3.2.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 596 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 597 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 598 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 683 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_fetch)
NOTE: Running task 714 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_fetch)
NOTE: recipe bison-3.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 599 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 600 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 601 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 758 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_fetch)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_unpack: Started
NOTE: Running setscene task 602 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_unpack: Started
NOTE: Running setscene task 603 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 773 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_fetch)
NOTE: Running task 774 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_unpack)
NOTE: Running task 775 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_fetch)
NOTE: Running task 776 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_fetch)
NOTE: Running task 777 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_fetch)
NOTE: Running task 778 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.5.bb:do_fetch)
NOTE: Running task 779 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_fetch)
NOTE: Running task 780 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 781 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: Running task 782 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_fetch)
NOTE: Running task 783 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_fetch)
NOTE: Running task 784 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: Running task 786 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_fetch)
NOTE: Running task 787 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 788 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_fetch)
NOTE: Running task 789 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_fetch)
NOTE: Running task 790 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_fetch)
NOTE: Running task 791 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_write_config)
NOTE: Running task 796 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_write_config)
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmnl-1.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 863 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_write_config)
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Succeeded
NOTE: Running setscene task 604 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 864 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: recipe elfutils-0.182-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.8-r0: task do_fetch: Started
NOTE: recipe bash-5.0-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 867 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: recipe elfutils-0.182-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.8-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_fetch: Started
NOTE: recipe diffutils-3.7-r0: task do_fetch: Started
NOTE: Running task 868 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_unpack)
NOTE: recipe base-passwd-3.5.29-r0: task do_unpack: Started
NOTE: Running task 869 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_unpack)
NOTE: recipe mdadm-4.1-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.0-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.3-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-native-0.182-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-native-0.182-r0: task do_unpack: Started
NOTE: Running task 870 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_unpack)
NOTE: recipe coreutils-8.32-r0: task do_fetch: Started
NOTE: Running task 871 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_unpack)
NOTE: recipe diffutils-3.7-r0: task do_fetch: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_fetch: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_fetch: Started
NOTE: Running task 872 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_unpack)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.3-r0: task do_fetch: Succeeded
NOTE: recipe init-system-helpers-1.58-r0: task do_fetch: Started
NOTE: Running task 873 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_unpack)
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_fetch: Started
NOTE: recipe bison-3.7.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_unpack: Succeeded
NOTE: Running task 874 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_unpack)
NOTE: recipe dbus-test-1.12.20-r0: task do_fetch: Succeeded
NOTE: Running task 875 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_patch)
NOTE: recipe libmnl-1.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 876 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_unpack)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_fetch: Started
NOTE: Running task 877 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_fetch)
NOTE: recipe init-system-helpers-1.58-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_fetch: Succeeded
NOTE: Running task 878 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: recipe base-passwd-3.5.29-r0: task do_unpack: Succeeded
NOTE: Running task 879 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_unpack)
NOTE: Running task 880 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_unpack)
NOTE: recipe gmp-6.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 881 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_patch)
NOTE: recipe elfutils-native-0.182-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_fetch: Started
NOTE: Running task 882 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_unpack)
NOTE: recipe procps-3.3.16-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_fetch: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_fetch: Started
NOTE: recipe grep-3.5-r0: task do_fetch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_fetch: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_fetch: Started
NOTE: Running task 901 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_unpack)
NOTE: recipe shared-mime-info-2.0-r0: task do_fetch: Started
NOTE: Running task 909 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_unpack)
NOTE: Running task 910 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe grep-3.5-r0: task do_fetch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_fetch: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 911 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_fetch)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_fetch: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_fetch: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_write_config: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_write_config: Started
NOTE: recipe findutils-4.7.0-r0: task do_fetch: Started
NOTE: Running task 912 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_unpack)
NOTE: recipe socat-1.7.3.4-r0: task do_fetch: Succeeded
NOTE: recipe bison-3.7.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 913 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_unpack)
NOTE: Running task 914 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.5.bb:do_unpack)
NOTE: Running task 915 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_unpack)
NOTE: Running task 916 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.44.bb:do_fetch)
NOTE: Running task 917 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.3.bb:do_fetch)
NOTE: Running task 918 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_fetch: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-dbusmock-0.19-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_write_config: Started
NOTE: recipe binutils-2.35-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_write_config: Started
NOTE: Running task 919 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: Running task 920 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 921 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_unpack)
NOTE: recipe shared-mime-info-2.0-r0: task do_write_config: Succeeded
NOTE: Running task 922 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_unpack)
NOTE: Running task 923 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: Running task 924 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_unpack)
NOTE: Running task 925 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_unpack)
NOTE: recipe gmp-6.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_fetch: Succeeded
NOTE: Running task 926 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_unpack)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_write_config: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Started
NOTE: recipe elfutils-0.182-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_unpack: Started
NOTE: Running task 927 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_fetch)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_write_config: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_unpack: Started
NOTE: recipe sed-4.8-r0: task do_unpack: Started
NOTE: recipe make-4.3-r0: task do_unpack: Started
NOTE: Running task 928 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_fetch)
NOTE: recipe init-system-helpers-1.58-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe gawk-5.1.0-r0: task do_fetch: Succeeded
NOTE: recipe eudev-3.2.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_unpack: Started
NOTE: Running task 929 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: recipe diffutils-3.7-r0: task do_unpack: Started
NOTE: Running task 930 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_unpack)
NOTE: recipe zlib-1.2.11-r0: task do_patch: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_patch: Started
NOTE: recipe libmnl-1.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 931 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_fetch)
NOTE: Running task 932 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_unpack)
NOTE: recipe mdadm-4.1-r0: task do_unpack: Started
NOTE: recipe coreutils-8.32-r0: task do_fetch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_prepare_recipe_sysroot: Started
NOTE: Running task 933 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_unpack)
NOTE: recipe iptables-1.8.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: Running task 934 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_fetch)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_unpack: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_unpack: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_unpack: Started
NOTE: Running task 935 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: Running task 936 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_patch)
NOTE: recipe m4-1.4.18-r0: task do_unpack: Started
NOTE: recipe flex-2.6.4-r0: task do_fetch: Started
NOTE: recipe procps-3.3.16-r0: task do_unpack: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_unpack: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_unpack: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_unpack: Started
NOTE: recipe grep-3.5-r0: task do_unpack: Started
NOTE: Running task 937 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_patch)
NOTE: recipe flex-2.6.4-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_unpack: Started
NOTE: Running task 938 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_fetch)
NOTE: recipe libcap-2.44-r0: task do_fetch: Started
NOTE: recipe bison-3.7.3-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: Running task 939 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_unpack)
NOTE: recipe dbus-test-1.12.20-r0: task do_unpack: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_unpack: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.35-r0: task do_unpack: Started
NOTE: recipe make-4.3-r0: task do_unpack: Succeeded
NOTE: Running task 940 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: Running task 941 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_patch)
NOTE: recipe python3-dbusmock-0.19-r0: task do_unpack: Started
NOTE: Running task 942 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_patch)
NOTE: recipe bison-3.7.3-r0: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_unpack: Started
NOTE: Running task 943 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.3.bb:do_unpack)
NOTE: recipe zlib-1.2.11-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe libcap-2.44-r0: task do_fetch: Succeeded
NOTE: recipe python3-dbusmock-0.19-r0: task do_unpack: Succeeded
NOTE: Running task 945 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.44.bb:do_unpack)
NOTE: Running task 946 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_patch)
NOTE: recipe findutils-4.7.0-r0: task do_unpack: Started
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: Running task 947 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: Running task 948 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe gmp-6.2.0-r0: task do_fetch: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_fetch: Started
NOTE: recipe libmnl-1.0.4-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.9-r0: task do_fetch: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_unpack: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Started
NOTE: Running task 949 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_patch)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 950 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_unpack)
NOTE: Running task 951 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_unpack)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_unpack: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_unpack: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_patch: Started
NOTE: recipe procps-3.3.16-r0: task do_unpack: Succeeded
NOTE: Running task 952 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_patch)
NOTE: Running task 953 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_patch)
NOTE: recipe eudev-3.2.9-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.8-r0: task do_unpack: Succeeded
NOTE: Running task 954 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_unpack)
NOTE: recipe m4-1.4.18-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_fetch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_patch: Started
NOTE: Running task 955 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_patch)
NOTE: recipe coreutils-8.32-r0: task do_unpack: Started
NOTE: Running task 956 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_patch)
NOTE: recipe python3-dbus-1.2.16-r0: task do_patch: Started
NOTE: recipe diffutils-3.7-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_fetch: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_fetch: Started
NOTE: recipe socat-1.7.3.4-r0: task do_unpack: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_unpack: Started
NOTE: recipe make-4.3-r0: task do_patch: Started
NOTE: Running task 957 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_patch)
NOTE: recipe libmnl-1.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 958 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_patch)
NOTE: Running task 959 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_unpack)
NOTE: Running task 960 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_patch)
NOTE: recipe shared-mime-info-2.0-r0: task do_unpack: Succeeded
NOTE: Running task 961 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_patch)
NOTE: recipe bison-3.7.3-r0: task do_unpack: Started
NOTE: recipe libcap-2.44-r0: task do_unpack: Started
NOTE: Running task 962 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_unpack: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_fetch: Succeeded
NOTE: Running task 963 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_patch)
NOTE: Running task 964 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_unpack)
NOTE: recipe shadow-securetty-4.6-r3: task do_patch: Succeeded
NOTE: recipe python3-dbusmock-0.19-r0: task do_patch: Started
NOTE: recipe grep-3.5-r0: task do_unpack: Succeeded
NOTE: Running task 967 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_configure)
NOTE: Running task 968 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.5.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_patch: Succeeded
NOTE: Running setscene task 605 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_unpack: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_patch: Succeeded
NOTE: Running setscene task 606 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_populate_sysroot_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_patch: Started
NOTE: Running task 970 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: Running task 971 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_patch: Started
NOTE: recipe gmp-6.2.0-r0: task do_unpack: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_unpack: Succeeded
NOTE: Running task 973 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_patch)
NOTE: Running task 974 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_patch)
NOTE: recipe eudev-3.2.9-r0: task do_unpack: Started
NOTE: recipe procps-3.3.16-r0: task do_patch: Started
NOTE: recipe libcap-2.44-r0: task do_unpack: Succeeded
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.19-r0: task do_patch: Succeeded
NOTE: Running task 975 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.44.bb:do_patch)
NOTE: Running setscene task 607 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_unpack: Succeeded
NOTE: recipe sed-4.8-r0: task do_patch: Started
NOTE: Running task 977 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_patch)
NOTE: recipe m4-1.4.18-r0: task do_patch: Started
NOTE: recipe findutils-4.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 978 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_patch: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_patch: Started
NOTE: recipe diffutils-3.7-r0: task do_patch: Started
NOTE: recipe libmnl-1.0.4-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_patch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_configure: Started
NOTE: recipe procps-3.3.16-r0: task do_patch: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_patch: Started
NOTE: recipe iptables-1.8.6-r0: task do_unpack: Started
NOTE: recipe grep-3.5-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_patch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot_setscene: Started
NOTE: Running task 983 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe base-passwd-3.5.29-r0: task do_patch: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_unpack: Started
NOTE: recipe perl-5.32.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_patch: Started
NOTE: recipe grep-3.5-r0: task do_patch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_configure: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_patch: Started
NOTE: Running task 986 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_compile)
NOTE: recipe shared-mime-info-2.0-r0: task do_patch: Succeeded
NOTE: recipe eudev-3.2.9-r0: task do_unpack: Succeeded
NOTE: Running task 988 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_patch)
NOTE: recipe libmnl-1.0.4-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.44-r0: task do_patch: Started
NOTE: recipe diffutils-3.7-r0: task do_patch: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_patch: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_unpack: Succeeded
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 992 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_patch)
NOTE: recipe gawk-5.1.0-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_patch: Started
NOTE: recipe findutils-4.7.0-r0: task do_patch: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_patch: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe bash-5.0-r0: task do_unpack: Succeeded
NOTE: Running task 996 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_patch)
NOTE: recipe findutils-4.7.0-r0: task do_patch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: recipe bison-3.7.3-r0: task do_unpack: Succeeded
NOTE: Running task 998 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.3.bb:do_patch)
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_compile: Started
NOTE: Running setscene task 608 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_patch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe eudev-3.2.9-r0: task do_patch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_compile: Succeeded
NOTE: Running task 1001 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: Running task 1002 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_install)
NOTE: recipe iptables-1.8.6-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_patch: Started
NOTE: recipe gawk-5.1.0-r0: task do_patch: Succeeded
NOTE: recipe bash-5.0-r0: task do_patch: Started
NOTE: recipe bison-3.7.3-r0: task do_patch: Started
NOTE: recipe make-4.3-r0: task do_patch: Succeeded
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.44-r0: task do_patch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: recipe bison-3.7.3-r0: task do_patch: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_unpack: Succeeded
NOTE: Running task 1005 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_fetch)
NOTE: recipe flex-2.6.4-r0: task do_patch: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_patch: Succeeded
NOTE: recipe eudev-3.2.9-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1006 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_patch)
NOTE: Running task 1007 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_patch)
NOTE: Running task 1008 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: Running task 1010 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_fetch)
NOTE: Running task 1012 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_patch)
NOTE: recipe acl-2.2.53-r0: task do_patch: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_fetch: Started
NOTE: recipe gmp-6.2.0-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe iptables-1.8.6-r0: task do_patch: Started
NOTE: recipe kmod-27-r0: task do_fetch: Started
NOTE: recipe db-1_5.3.28-r1: task do_fetch: Succeeded
NOTE: Running task 1017 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_unpack)
NOTE: recipe coreutils-8.32-r0: task do_patch: Started
NOTE: recipe kmod-27-r0: task do_fetch: Succeeded
NOTE: Running task 1018 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_unpack)
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: Running task 1019 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: recipe db-1_5.3.28-r1: task do_unpack: Started
NOTE: recipe kmod-27-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 1020 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_unpack)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1021 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_fetch)
NOTE: recipe sed-4.8-r0: task do_patch: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_patch: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1024 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_fetch)
NOTE: recipe init-system-helpers-1.58-r0: task do_unpack: Succeeded
NOTE: Running task 1025 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_patch)
NOTE: recipe shadow-securetty-4.6-r3: task do_install: Started
NOTE: recipe kmod-27-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1026 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_patch)
NOTE: recipe mdadm-4.1-r0: task do_patch: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 610 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 611 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 612 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 613 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_fetch: Started
NOTE: recipe perl-5.32.0-r0: task do_fetch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_install: Succeeded
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_fetch: Succeeded
NOTE: recipe kmod-27-r0: task do_patch: Started
NOTE: Running task 1030 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_unpack)
NOTE: recipe perl-5.32.0-r0: task do_fetch: Succeeded
NOTE: Running task 1031 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_unpack)
NOTE: recipe init-system-helpers-1.58-r0: task do_patch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1034 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: recipe perl-5.32.0-r0: task do_unpack: Started
NOTE: recipe kmod-27-r0: task do_patch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 614 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 615 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 616 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: Running task 1036 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_write_config)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1037 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1038 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_fetch)
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: recipe elfutils-native-0.182-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_fetch: Started
NOTE: Running task 1040 of 2262 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_patch)
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 617 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_fetch: Succeeded
NOTE: Running task 1041 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_unpack)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 618 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 620 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 621 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 622 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 623 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 624 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_unpack: Succeeded
NOTE: Running task 1042 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_patch)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 625 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1043 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_write_config)
NOTE: recipe db-1_5.3.28-r1: task do_unpack: Succeeded
NOTE: Running task 1044 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_patch)
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-native-0.182-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_patch: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1045 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_fetch)
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1046 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_fetch)
NOTE: recipe db-1_5.3.28-r1: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 626 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1047 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_fetch)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 627 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 628 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 629 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 630 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 631 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: Running task 1048 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_fetch)
NOTE: recipe iproute2-5.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 1049 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_patch)
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 632 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 633 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.44-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_fetch: Started
NOTE: recipe libpcre-8.44-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Started
NOTE: Running task 1050 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_unpack)
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1051 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_unpack)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 1052 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: Running task 1053 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_unpack)
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Succeeded
NOTE: Running task 1054 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_unpack)
NOTE: recipe iproute2-5.9.0-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1055 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_fetch)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1056 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_fetch)
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1057 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_unpack: Started
NOTE: Running setscene task 634 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_fetch: Started
NOTE: recipe libpcre-8.44-r0: task do_unpack: Started
NOTE: recipe iproute2-5.9.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 635 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Started
NOTE: Running task 1059 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_fetch)
NOTE: recipe perl-5.32.0-r0: task do_unpack: Succeeded
NOTE: Running task 1060 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_fetch: Succeeded
NOTE: recipe mesa-2_20.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1061 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: Running setscene task 636 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 638 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 640 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 642 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 1062 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1063 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_write_config)
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe glibc-2.32-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_fetch: Started
NOTE: Running setscene task 643 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_10.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1064 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.32.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 1065 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_patch)
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 1066 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_unpack)
NOTE: recipe dbus-1.12.20-r0: task do_unpack: Succeeded
NOTE: Running task 1067 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_unpack)
NOTE: Running task 1068 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running task 1069 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_patch)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 644 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1070 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1071 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_patch: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Succeeded
NOTE: Running task 1073 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_unpack)
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe bash-5.0-r0: task do_patch: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_patch: Succeeded
NOTE: recipe mesa-2_20.2.1-r0: task do_write_config: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_patch: Started
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgcc-initial-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1076 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_fetch)
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_20.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1077 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: Running task 1078 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_fetch)
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glibc-2.32-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1079 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_patch)
NOTE: recipe shadow-4.8.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 645 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 646 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 647 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1080 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 648 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: recipe glibc-2.32-r0: task do_fetch: Succeeded
NOTE: Running setscene task 649 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 650 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 651 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 652 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1081 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.32.bb:do_unpack)
NOTE: Running task 1082 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_write_config)
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Started
NOTE: Running task 1083 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_fetch)
NOTE: recipe libgcc-initial-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running setscene task 653 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_gcc_stash_builddir_setscene)
NOTE: Running setscene task 654 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.4.48-r0: task do_fetch: Started
NOTE: Running task 1087 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe libdrm-2.4.102-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1088 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 655 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.4.48-r0: task do_fetch: Succeeded
NOTE: Running setscene task 656 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 657 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1089 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_write_config)
NOTE: Running task 1090 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_unpack)
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Started
NOTE: recipe shadow-4.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1091 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_patch)
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1092 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_unpack)
NOTE: recipe dbus-1.12.20-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_fetch: Succeeded
ERROR: elfutils-native-0.182-r0 do_patch: Command Error: 'quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.182-r0/recipe-sysroot-native/etc/quiltrc push' exited with 0  Output:
Applying patch 0002-musl-libs.patch
patching file lib/error.h
patching file lib/fixedsizehash.h
patching file lib/libeu.h
patching file libdwfl/dwfl_error.c
patching file libdwfl/linux-kernel-modules.c
patching file libelf/elf.h
Hunk #1 FAILED at 21.
Hunk #2 FAILED at 4105.
2 out of 2 hunks FAILED -- rejects in file libelf/elf.h
Patch 0002-musl-libs.patch does not apply (enforce with -f)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/elfutils-native/0.182-r0/temp/log.do_patch.40575
NOTE: recipe elfutils-native-0.182-r0: task do_patch: Failed
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1094 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_unpack)
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_patch) failed with exit code '1'
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_patch: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_write_config: Started
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Started
NOTE: recipe elfutils-0.182-r0: task do_unpack: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.102-r0: task do_write_config: Started
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.102-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_unpack: Started
NOTE: recipe wayland-1.18.0-r0: task do_write_config: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Started
NOTE: recipe libgcc-initial-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-2.32-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.102-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_patch: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.102-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_20.2.1-r0: task do_unpack: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_patch: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_patch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_20.2.1-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.35-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.32-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_unpack: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1094 tasks of which 890 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_patch
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============5381774450379339731==--
