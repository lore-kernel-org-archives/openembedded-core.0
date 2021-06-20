Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.32502.1624189110251663955
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jun 2021 04:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id 86DB738C08EC
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Jun 2021 11:38:29 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bluez5: upgrading to 5.59 FAILED
Message-ID: <MADEUP.168A4763FD5FD488.3236@lists.openembedded.org>
X-Groupsio-MsgNum: 153102
Content-Type: multipart/mixed; boundary="===============1741350163058075820=="

--===============1741350163058075820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bluez5* to *5.59* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-bluez5-upgrade-5.58-5.59.patch
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

--===============1741350163058075820==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-bluez5-upgrade-5.58-5.59.patch"

From 9f0c107c3e1420e3f899b5dd25305d69f9e594ad Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Jun 2021 06:29:59 +0000
Subject: [PATCH] bluez5: upgrade 5.58 -> 5.59

---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 -
 ....am-add-missing-mkdir-for-ell-shared.patch | 25 -------------------
 .../bluez5/{bluez5_5.58.bb => bluez5_5.59.bb} |  2 +-
 3 files changed, 1 insertion(+), 27 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-Makefile.am-add-missing-mkdir-for-ell-shared.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.58.bb => bluez5_5.59.bb} (95%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 635cad813e..74b59e406c 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -53,7 +53,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
            file://0001-audio-Rename-pause-funciton-to-avoid-shadowing-glibc.patch \
-           file://0001-Makefile.am-add-missing-mkdir-for-ell-shared.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-Makefile.am-add-missing-mkdir-for-ell-shared.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-Makefile.am-add-missing-mkdir-for-ell-shared.patch
deleted file mode 100644
index 03b42f73cb..0000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-Makefile.am-add-missing-mkdir-for-ell-shared.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From d341ba650af1b7068d9ad034732b4f41b91bb2c1 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Sun, 25 Apr 2021 18:56:41 +0200
-Subject: [PATCH] Makefile.am: add missing mkdir for ell/shared
-
-This addresses build errors out of source tree.
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index be5d5c7..72ad425 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -623,6 +623,7 @@ lib/bluetooth/%.h: lib/%.h
- 	$(AM_V_GEN)$(LN_S) -f $(abspath $<) $@
- 
- ell/shared: Makefile
-+	$(AM_V_at)$(MKDIR_P) ell
- 	$(AM_V_GEN)for f in $(ell_shared) ; do \
- 		if [ ! -f $$f ] ; then \
- 			$(LN_S) -t ell -f $(abs_srcdir)/../ell/$$f ; \
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.58.bb b/meta/recipes-connectivity/bluez5/bluez5_5.59.bb
similarity index 95%
rename from meta/recipes-connectivity/bluez5/bluez5_5.58.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.59.bb
index eb8475ec1e..7842eac76d 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.58.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.59.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "c8065e75a5eb67236849ef68a354b1700540305a8c88ef0a0fd6288f19daf1f1"
+SRC_URI[sha256sum] = "046b95b386d0bfb2a16311fe799d517ee7735045512d89902c4ed701db477316"
 
 # These issues have kernel fixes rather than bluez fixes so exclude here
 CVE_CHECK_WHITELIST += "CVE-2020-12352 CVE-2020-24490"
-- 
2.20.1


--===============1741350163058075820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1455 entries from dependency cache.
Parsing recipes...done.
Parsing of 818 .bb files complete (817 cached, 1 parsed). 1455 targets, 32 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-68c81b2615b37296d675d591f8a867cde14faabd"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:68c81b2615b37296d675d591f8a867cde14faabd"
workspace            = "master:f585bf4c959ae0b52be8462d278cd289db79b813"

Initialising tasks...done.
Sstate summary: Wanted 12 Local 5 Network 0 Missed 7 Current 874 (41% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1673 of 2767 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_fetch)
NOTE: recipe bluez5-5.59-r0: task do_fetch: Started
NOTE: recipe bluez5-5.59-r0: task do_fetch: Succeeded
NOTE: Running task 2184 of 2767 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_unpack)
NOTE: Running task 2185 of 2767 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.59-r0: task do_unpack: Started
NOTE: recipe bluez5-5.59-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.59-r0: task do_unpack: Succeeded
NOTE: Running task 2753 of 2767 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_patch)
NOTE: recipe bluez5-5.59-r0: task do_patch: Started
NOTE: recipe bluez5-5.59-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.59-r0: task do_patch: Succeeded
NOTE: Running task 2754 of 2767 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_deploy_source_date_epoch)
NOTE: Running task 2755 of 2767 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_populate_lic)
NOTE: recipe bluez5-5.59-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.59-r0: task do_populate_lic: Started
NOTE: recipe bluez5-5.59-r0: task do_populate_lic: Succeeded
NOTE: recipe bluez5-5.59-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2756 of 2767 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_configure)
NOTE: recipe bluez5-5.59-r0: task do_configure: Started
ERROR: bluez5-5.59-r0 do_configure: configure failed
ERROR: bluez5-5.59-r0 do_configure: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/temp/run.do_configure.31993' failed with exit code 1:
automake (GNU automake) 1.16.3
Copyright (C) 2020 Free Software Foundation, Inc.
License GPLv2+: GNU GPL version 2 or later <https://gnu.org/licenses/gpl-2.0.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Tom Tromey <tromey@redhat.com>
       and Alexandre Duret-Lutz <adl@gnu.org>.
AUTOV is 1.16
autoreconf: export WARNINGS=cross,no-obsolete
autoreconf: Entering directory '.'
autoreconf: configure.ac: not using Gettext
autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/share/aclocal/ --force 
autoreconf: configure.ac: tracing
autoreconf: running: libtoolize --copy --force
libtoolize: putting auxiliary files in '.'.
libtoolize: copying file './ltmain.sh'
libtoolize: Consider adding 'AC_CONFIG_MACRO_DIRS([m4])' to configure.ac,
libtoolize: and rerunning libtoolize and aclocal.
libtoolize: Consider adding '-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
autoreconf: configure.ac: not using Intltool
autoreconf: configure.ac: not using Gtkdoc
autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/share/aclocal/ --force 
autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/share/aclocal/ --force
autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/share/aclocal/ --force
autoreconf: running: automake --add-missing --copy --force-missing
configure.ac:21: installing './compile'
configure.ac:5: installing './missing'
Makefile.am: installing './depcomp'
autoreconf: './config.sub' is updated
autoreconf: './config.guess' is updated
autoreconf: Leaving directory '.'
configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/endian-little
configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/ix86-common
configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-linux
configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-glibc
configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common
configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot/usr/share/i686-poky-linux_config_site.d/ncurses_config
checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c
checking whether build environment is sane... yes
checking for i686-poky-linux-strip... i686-poky-linux-strip
checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether make supports nested variables... yes
checking how to create a pax tar archive... gnutar
checking whether make supports nested variables... (cached) yes
checking whether to enable maintainer-specific portions of Makefiles... no
checking for i686-poky-linux-pkg-config... no
checking for pkg-config... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/bin/pkg-config
configure: WARNING: using cross tools not prefixed with host triplet
checking pkg-config is at least version 0.9.0... yes
checking whether make supports the include directive... yes (GNU style)
checking for i686-poky-linux-gcc... i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... yes
checking for suffix of object files... o
checking whether the compiler supports GNU C... yes
checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot accepts -g... yes
checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot option to enable C11 features... none needed
checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot understands -c and -o together... yes
checking dependency style of i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot... none
checking for C/C++ restrict keyword... __restrict
checking for i686-poky-linux-gcc... (cached) i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot
checking whether the compiler supports GNU C... (cached) yes
checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot accepts -g... (cached) yes
checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot option to enable C11 features... (cached) none needed
checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot understands -c and -o together... (cached) yes
checking dependency style of i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot... (cached) none
checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot accepts -fPIE... yes
checking build system type... x86_64-pc-linux-gnu
checking host system type... i686-poky-linux-gnu
checking how to print strings... printf
checking for a sed that does not truncate output... (cached) sed
checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep
checking for egrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -E
checking for fgrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -F
checking for ld used by i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot... i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot  
checking if the linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot  ) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... i686-poky-linux-gcc-nm
checking the name lister (i686-poky-linux-gcc-nm) interface... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 1572864
checking how to convert x86_64-pc-linux-gnu file names to i686-poky-linux-gnu format... func_convert_file_noop
checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
checking for i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot   option to reload object files... -r
checking for i686-poky-linux-objdump... i686-poky-linux-objdump
checking how to recognize dependent libraries... pass_all
checking for i686-poky-linux-dlltool... no
checking for dlltool... no
checking how to associate runtime and link libraries... printf %s\n
checking for i686-poky-linux-ar... i686-poky-linux-gcc-ar
checking for archiver @FILE support... @
checking for i686-poky-linux-strip... (cached) i686-poky-linux-strip
checking for i686-poky-linux-ranlib... i686-poky-linux-gcc-ranlib
checking command to parse i686-poky-linux-gcc-nm output from i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot object... ok
checking for sysroot... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot
checking for a working dd... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/dd
checking how to truncate binary pipes... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/dd bs=4096 count=1
checking for i686-poky-linux-mt... no
checking for mt... no
checking if : is a manifest tool... no
checking for stdio.h... (cached) yes
checking for stdlib.h... (cached) yes
checking for string.h... (cached) yes
checking for inttypes.h... (cached) yes
checking for stdint.h... (cached) yes
checking for strings.h... (cached) yes
checking for sys/stat.h... (cached) yes
checking for sys/types.h... (cached) yes
checking for unistd.h... (cached) yes
checking for dlfcn.h... yes
checking for objdir... .libs
checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot supports -fno-rtti -fno-exceptions... no
checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot option to produce PIC... -fPIC -DPIC
checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot PIC flag -fPIC -DPIC works... yes
checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot static flag -static works... yes
checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot supports -c -o file.o... yes
checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot supports -c -o file.o... (cached) yes
checking whether the i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot  ) supports shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... no
checking for explicit_bzero... yes
checking for rawmemchr... yes
checking for signalfd... yes
checking for clock_gettime in -lrt... yes
checking for pthread_create in -lpthread... yes
checking for dlopen in -ldl... yes
checking for linux/types.h... yes
checking for linux/if_alg.h... yes
checking for glib-2.0 >= 2.28... yes
checking for dbus-1 >= 1.6... yes
checking D-Bus configuration directory... /etc
checking D-Bus system bus services dir... /usr/share/dbus-1/system-services
checking D-Bus session bus services dir... /usr/share/dbus-1/services
checking for libudev >= 172... yes
checking for udev_hwdb_new in -ludev... yes
checking udev directory... /lib/udev
checking for libical... yes
checking for readline/readline.h... yes
checking systemd system unit dir... /lib/systemd/system
checking systemd user unit dir... /usr/lib/systemd/user
checking for rst2man... no
checking for rst2man.py... no
configure: error: rst2man is required
WARNING: exit code 1 from a shell command.

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/temp/log.do_configure.31993
Log data follows:
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i686-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf/autoconf_2.71.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-ru
 ntime_11.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-systemctl-native.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/automake/automake_1.16.3.bb:do_popul
 ate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.10.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['xz-native', 'libtool-native', 'pkgconfig-native', 'dbus', 'libtool-cross', 'glib-2.0', 'autoconf-native', 'gcc-runtime', 'initscripts', 'update-rc.d', 'quilt-native', 'gcc-cross-i686', 'systemd-systemctl-native', 'glibc', 'systemd', 'automake-native', 'libical', 'patch-native', 'pseudo-native', 'readline', 'gettext-minimal-native', 'texinfo-dummy-native', 'shadow', 'expat', 'autoconf-archive', 'libx11', 'libsm', 'shadow-sysroot', 'base-files', 'shadow-native', 'base-passwd', 'binutils-cross-i686', 'libffi', 'util-linux', 'zlib', 'libpcre', 'bash-completion', 'gnu-config-native', 'm4-native', 'libgcc', 'linux-libc-headers', 'flex-native', 'libmpc-native', 'zlib-native', 'gmp-native', 'mpfr-native', 'libcap', 'acl', 'opkg-utils', 'libseccomp', 'xz', 'libpam', 'libxkbcommon', 'kmod', 'icu', 'libxml2', 'attr-native', 'ncurses', 'libxcrypt', 'attr', 'xorgproto', 'util-macros', 'xtrans', 'libxcb', 'libice', 'util-linux-libuuid', 'libcap-ng',
  'bzip2', 'cracklib', 'flex', 'wayland-protocols', 'xkeyboard-config', 'wayland', 'python3', 'xcb-proto', 'libpthread-stubs', 'libxau', 'libxdmcp', 'unzip-native', 'gdbm', 'libnsl2', 'libtirpc', 'sqlite3', 'openssl']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.16.3
| Copyright (C) 2020 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| 
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.16
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint --exclude=gtkdocize -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in '.'.
| libtoolize: copying file './ltmain.sh'
| libtoolize: Consider adding 'AC_CONFIG_MACRO_DIRS([m4])' to configure.ac,
| libtoolize: and rerunning libtoolize and aclocal.
| libtoolize: Consider adding '-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:21: installing './compile'
| configure.ac:5: installing './missing'
| Makefile.am: installing './depcomp'
| autoreconf: './config.sub' is updated
| autoreconf: './config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../bluez-5.59/configure  --build=x86_64-linux 		  --host=i686-poky-linux 		  --target=i686-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		  --with-libtool-sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot   --enable-test   --enable-datafiles   --enable-library   --without-zsh-completion-dir  --disable-static  --enable-a2dp --enable-avrcp --disable-btpclient --disable-cups --enable-deprecated --disable-health --enable-hid --enable-hog --disable-mesh --disable-midi --enable-network --disable-nfc --enable-obex --enable-client 
 --disable-sap --disable-sixaxis --enable-systemd --disable-testing --disable-threads --enable-tools --enable-udev
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/ix86-common
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot/usr/share/i686-poky-linux_config_site.d/ncurses_config
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c
| checking whether build environment is sane... yes
| checking for i686-poky-linux-strip... i686-poky-linux-strip
| checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking how to create a pax tar archive... gnutar
| checking whether make supports nested variables... (cached) yes
| checking whether to enable maintainer-specific portions of Makefiles... no
| checking for i686-poky-linux-pkg-config... no
| checking for pkg-config... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/bin/pkg-config
| configure: WARNING: using cross tools not prefixed with host triplet
| checking pkg-config is at least version 0.9.0... yes
| checking whether make supports the include directive... yes (GNU style)
| checking for i686-poky-linux-gcc... i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot accepts -g... yes
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot option to enable C11 features... none needed
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot understands -c and -o together... yes
| checking dependency style of i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot... none
| checking for C/C++ restrict keyword... __restrict
| checking for i686-poky-linux-gcc... (cached) i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot
| checking whether the compiler supports GNU C... (cached) yes
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot accepts -g... (cached) yes
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot option to enable C11 features... (cached) none needed
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot understands -c and -o together... (cached) yes
| checking dependency style of i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot... (cached) none
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot accepts -fPIE... yes
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... i686-poky-linux-gnu
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -E
| checking for fgrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -F
| checking for ld used by i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot... i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot
| checking if the linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... i686-poky-linux-gcc-nm
| checking the name lister (i686-poky-linux-gcc-nm) interface... BSD nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to i686-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot   option to reload object files... -r
| checking for i686-poky-linux-objdump... i686-poky-linux-objdump
| checking how to recognize dependent libraries... pass_all
| checking for i686-poky-linux-dlltool... no
| checking for dlltool... no
| checking how to associate runtime and link libraries... printf %s\n
| checking for i686-poky-linux-ar... i686-poky-linux-gcc-ar
| checking for archiver @FILE support... @
| checking for i686-poky-linux-strip... (cached) i686-poky-linux-strip
| checking for i686-poky-linux-ranlib... i686-poky-linux-gcc-ranlib
| checking command to parse i686-poky-linux-gcc-nm output from i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot object... ok
| checking for sysroot... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot
| checking for a working dd... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/dd
| checking how to truncate binary pipes... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/dd bs=4096 count=1
| checking for i686-poky-linux-mt... no
| checking for mt... no
| checking if : is a manifest tool... no
| checking for stdio.h... (cached) yes
| checking for stdlib.h... (cached) yes
| checking for string.h... (cached) yes
| checking for inttypes.h... (cached) yes
| checking for stdint.h... (cached) yes
| checking for strings.h... (cached) yes
| checking for sys/stat.h... (cached) yes
| checking for sys/types.h... (cached) yes
| checking for unistd.h... (cached) yes
| checking for dlfcn.h... yes
| checking for objdir... .libs
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot static flag -static works... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot supports -c -o file.o... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot  ) supports shared libraries... yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| checking for explicit_bzero... yes
| checking for rawmemchr... yes
| checking for signalfd... yes
| checking for clock_gettime in -lrt... yes
| checking for pthread_create in -lpthread... yes
| checking for dlopen in -ldl... yes
| checking for linux/types.h... yes
| checking for linux/if_alg.h... yes
| checking for glib-2.0 >= 2.28... yes
| checking for dbus-1 >= 1.6... yes
| checking D-Bus configuration directory... /etc
| checking D-Bus system bus services dir... /usr/share/dbus-1/system-services
| checking D-Bus session bus services dir... /usr/share/dbus-1/services
| checking for libudev >= 172... yes
| checking for udev_hwdb_new in -ludev... yes
| checking udev directory... /lib/udev
| checking for libical... yes
| checking for readline/readline.h... yes
| checking systemd system unit dir... /lib/systemd/system
| checking systemd user unit dir... /usr/lib/systemd/user
| checking for rst2man... no
| checking for rst2man.py... no
| configure: error: rst2man is required
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/build/config.log
| ERROR: configure failed
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/temp/run.do_configure.31993' failed with exit code 1:
| automake (GNU automake) 1.16.3
| Copyright (C) 2020 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| 
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.16
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in '.'.
| libtoolize: copying file './ltmain.sh'
| libtoolize: Consider adding 'AC_CONFIG_MACRO_DIRS([m4])' to configure.ac,
| libtoolize: and rerunning libtoolize and aclocal.
| libtoolize: Consider adding '-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:21: installing './compile'
| configure.ac:5: installing './missing'
| Makefile.am: installing './depcomp'
| autoreconf: './config.sub' is updated
| autoreconf: './config.guess' is updated
| autoreconf: Leaving directory '.'
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/ix86-common
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot/usr/share/i686-poky-linux_config_site.d/ncurses_config
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c
| checking whether build environment is sane... yes
| checking for i686-poky-linux-strip... i686-poky-linux-strip
| checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking how to create a pax tar archive... gnutar
| checking whether make supports nested variables... (cached) yes
| checking whether to enable maintainer-specific portions of Makefiles... no
| checking for i686-poky-linux-pkg-config... no
| checking for pkg-config... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot-native/usr/bin/pkg-config
| configure: WARNING: using cross tools not prefixed with host triplet
| checking pkg-config is at least version 0.9.0... yes
| checking whether make supports the include directive... yes (GNU style)
| checking for i686-poky-linux-gcc... i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot accepts -g... yes
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot option to enable C11 features... none needed
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot understands -c and -o together... yes
| checking dependency style of i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot... none
| checking for C/C++ restrict keyword... __restrict
| checking for i686-poky-linux-gcc... (cached) i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot
| checking whether the compiler supports GNU C... (cached) yes
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot accepts -g... (cached) yes
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot option to enable C11 features... (cached) none needed
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot understands -c and -o together... (cached) yes
| checking dependency style of i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot... (cached) none
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot accepts -fPIE... yes
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... i686-poky-linux-gnu
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -E
| checking for fgrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -F
| checking for ld used by i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot... i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot
| checking if the linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... i686-poky-linux-gcc-nm
| checking the name lister (i686-poky-linux-gcc-nm) interface... BSD nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to i686-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot   option to reload object files... -r
| checking for i686-poky-linux-objdump... i686-poky-linux-objdump
| checking how to recognize dependent libraries... pass_all
| checking for i686-poky-linux-dlltool... no
| checking for dlltool... no
| checking how to associate runtime and link libraries... printf %s\n
| checking for i686-poky-linux-ar... i686-poky-linux-gcc-ar
| checking for archiver @FILE support... @
| checking for i686-poky-linux-strip... (cached) i686-poky-linux-strip
| checking for i686-poky-linux-ranlib... i686-poky-linux-gcc-ranlib
| checking command to parse i686-poky-linux-gcc-nm output from i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot object... ok
| checking for sysroot... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot
| checking for a working dd... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/dd
| checking how to truncate binary pipes... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/dd bs=4096 count=1
| checking for i686-poky-linux-mt... no
| checking for mt... no
| checking if : is a manifest tool... no
| checking for stdio.h... (cached) yes
| checking for stdlib.h... (cached) yes
| checking for string.h... (cached) yes
| checking for inttypes.h... (cached) yes
| checking for stdint.h... (cached) yes
| checking for strings.h... (cached) yes
| checking for sys/stat.h... (cached) yes
| checking for sys/types.h... (cached) yes
| checking for unistd.h... (cached) yes
| checking for dlfcn.h... yes
| checking for objdir... .libs
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot static flag -static works... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot supports -c -o file.o... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.59-r0/recipe-sysroot  ) supports shared libraries... yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| checking for explicit_bzero... yes
| checking for rawmemchr... yes
| checking for signalfd... yes
| checking for clock_gettime in -lrt... yes
| checking for pthread_create in -lpthread... yes
| checking for dlopen in -ldl... yes
| checking for linux/types.h... yes
| checking for linux/if_alg.h... yes
| checking for glib-2.0 >= 2.28... yes
| checking for dbus-1 >= 1.6... yes
| checking D-Bus configuration directory... /etc
| checking D-Bus system bus services dir... /usr/share/dbus-1/system-services
| checking D-Bus session bus services dir... /usr/share/dbus-1/services
| checking for libudev >= 172... yes
| checking for udev_hwdb_new in -ludev... yes
| checking udev directory... /lib/udev
| checking for libical... yes
| checking for readline/readline.h... yes
| checking systemd system unit dir... /lib/systemd/system
| checking systemd user unit dir... /usr/lib/systemd/user
| checking for rst2man... no
| checking for rst2man.py... no
| configure: error: rst2man is required
| WARNING: exit code 1 from a shell command.
| 
NOTE: recipe bluez5-5.59-r0: task do_configure: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2756 tasks of which 2749 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 0 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_configure
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============1741350163058075820==--
