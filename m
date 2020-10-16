Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.12424.1602843683752291991
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 3E8D338C17C4
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:23 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] json-glib: upgrading to 1.6.0 FAILED
Message-ID: <MADEUP.163E71D6EDC580C5.13247@lists.openembedded.org>
X-Groupsio-MsgNum: 143465
Content-Type: multipart/mixed; boundary="===============4481694319003892434=="

--===============4481694319003892434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *json-glib* to *1.6.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-json-glib-upgrade-1.4.4-1.6.0.patch
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

--===============4481694319003892434==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-json-glib-upgrade-1.4.4-1.6.0.patch"

From ce189c9a8eea978c4e6d0e0fd6896494aee5e971 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 07:27:29 +0000
Subject: [PATCH] json-glib: upgrade 1.4.4 -> 1.6.0

---
 ...o-instead-of-cast-to-convert-pointer.patch | 33 -------------------
 ...{json-glib_1.4.4.bb => json-glib_1.6.0.bb} |  7 ++--
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-gnome/json-glib/json-glib/0001-scanner-use-macro-instead-of-cast-to-convert-pointer.patch
 rename meta/recipes-gnome/json-glib/{json-glib_1.4.4.bb => json-glib_1.6.0.bb} (80%)

diff --git a/meta/recipes-gnome/json-glib/json-glib/0001-scanner-use-macro-instead-of-cast-to-convert-pointer.patch b/meta/recipes-gnome/json-glib/json-glib/0001-scanner-use-macro-instead-of-cast-to-convert-pointer.patch
deleted file mode 100644
index 2a834b674d..0000000000
--- a/meta/recipes-gnome/json-glib/json-glib/0001-scanner-use-macro-instead-of-cast-to-convert-pointer.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From d60fcd5bd5c2675e4342775b910a2ea48ec0eccb Mon Sep 17 00:00:00 2001
-From: Dimitry Andric <dim@FreeBSD.org>
-Date: Wed, 19 Aug 2020 03:35:16 +0000
-Subject: [PATCH] scanner: use macro instead of cast to convert pointer to integer
-
-Clang 11 build failed due to a new warning (part of -Werror=pointer-to-int-cast):
-../json-glib/json-scanner.c:928:13: error: cast to smaller integer type 'GTokenType' from 'gpointer' (aka 'void *') [-Werror,-Wvoid-pointer-to-enum-cast]
-        *token_p = (GTokenType) value_p->v_symbol;
-                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/json-glib/-/commit/8c5fabe962b7337066dac7a697d23fce257a5d64]
-Signed-off-by: Jan Beich <jbeich@FreeBSD.org>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- json-glib/json-scanner.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/json-glib/json-scanner.c b/json-glib/json-scanner.c
-index 0c9919f..59dd29c 100644
---- a/json-glib/json-scanner.c
-+++ b/json-glib/json-scanner.c
-@@ -925,7 +925,7 @@ json_scanner_get_token_i (JsonScanner	*scanner,
-       
-     case G_TOKEN_SYMBOL:
-       if (scanner->config->symbol_2_token)
--	*token_p = (GTokenType) value_p->v_symbol;
-+	*token_p = GPOINTER_TO_INT (value_p->v_symbol);
-       break;
-       
-     case G_TOKEN_BINARY:
--- 
-2.28.0
-
diff --git a/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb b/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb
similarity index 80%
rename from meta/recipes-gnome/json-glib/json-glib_1.4.4.bb
rename to meta/recipes-gnome/json-glib/json-glib_1.6.0.bb
index add9ff41a1..8d3153674c 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb
@@ -14,11 +14,8 @@ DEPENDS = "glib-2.0"
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase lib_package gobject-introspection gtk-doc gettext ptest-gnome manpages upstream-version-is-even
 
-SRC_URI += "file://run-ptest \
-            file://0001-scanner-use-macro-instead-of-cast-to-convert-pointer.patch \
-"
-SRC_URI[archive.md5sum] = "4d4bb9837f6d31e32d0ce658ae135f68"
-SRC_URI[archive.sha256sum] = "720c5f4379513dc11fd97dc75336eb0c0d3338c53128044d9fabec4374f4bc47"
+SRC_URI += " file://run-ptest"
+SRC_URI[archive.sha256sum] = "0d7c67602c4161ea7070fab6c5823afd9bd7f7bc955f652a50d3753b08494e73"
 
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native"
 
-- 
2.18.4


--===============4481694319003892434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1452 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (784 cached, 1 parsed). 1356 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:797fba0aa131f0cb894645a10429fca656b2612f"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 218 Found 210 Missed 8 Current 499 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1209 of 2251 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb:do_fetch)
NOTE: Running task 1493 of 2251 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb:do_write_config)
NOTE: recipe json-glib-1.6.0-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1583 of 2251 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb:do_unpack)
NOTE: Running task 1584 of 2251 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.6.0-r0: task do_write_config: Started
NOTE: recipe json-glib-1.6.0-r0: task do_unpack: Started
NOTE: recipe json-glib-1.6.0-r0: task do_write_config: Succeeded
NOTE: recipe json-glib-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-glib-1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 2233 of 2251 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb:do_patch)
NOTE: recipe json-glib-1.6.0-r0: task do_patch: Started
NOTE: recipe json-glib-1.6.0-r0: task do_patch: Succeeded
NOTE: Running task 2238 of 2251 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2239 of 2251 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb:do_populate_lic)
NOTE: recipe json-glib-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-glib-1.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-glib-1.6.0-r0: task do_populate_lic: Started
NOTE: recipe json-glib-1.6.0-r0: task do_populate_lic: Succeeded
NOTE: recipe json-glib-1.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2240 of 2251 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb:do_configure)
NOTE: recipe json-glib-1.6.0-r0: task do_configure: Started
ERROR: json-glib-1.6.0-r0 do_configure: meson failed
ERROR: json-glib-1.6.0-r0 do_configure: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/temp/run.do_configure.2895414' failed with exit code 1:
gtkdocize: neither configure.ac nor configure.in exist
The Meson build system
Version: 0.55.1
Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/json-glib-1.6.0
Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/build
Build type: cross build
Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/recipe-sysroot/usr/share/pkgconfig'

../json-glib-1.6.0/meson.build:1:0: ERROR: Value "true" for combo option "Build the introspection data (requires gobject-introspection)" is not one of the choices. Possible choices are: "enabled", "disabled", "auto".

A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/build/meson-logs/meson-log.txt
WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/temp/run.do_configure.2895414:211 exit 1 from 'exit 1'
WARNING: Backtrace (BB generated script): 
	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/temp/run.do_configure.2895414, line 211
	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/temp/run.do_configure.2895414, line 175
	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/temp/run.do_configure.2895414, line 160
	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/temp/run.do_configure.2895414, line 215

Backtrace (metadata-relative locations):
	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/logging.bbclass, line 72
	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/meson.bbclass, line 138
	#3: do_configure, autogenerated, line 9
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/temp/log.do_configure.2895414
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.10.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/prelink/prelink_git.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 
 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.55.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.32.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.32.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_5.1.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot', '/home/pok
 ybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['ninja-native', 'python3-native', 'gobject-introspection', 'gobject-introspection-native', 'prelink-native', 'quilt-native', 'pkgconfig-native', 'meson-native', 'gcc-cross-i686', 'gtk-doc-native', 'patch-native', 'glibc', 'glib-2.0', 'qemu-native', 'xz-native', 'gcc-runtime', 'pseudo-native', 'gettext-native', 're2c-native', 'openssl-native', 'libtool-native', 'autoconf-native', 'libnsl2-native', 'sqlite3-native', 'gdbm-native', 'gnu-config-native', 'zlib-native', 'bzip2-native', 'automake-native', 'libtirpc-native', 'readline-native', 'libffi-native', 'util-linux-native', 'zlib', 'opkg-utils', 'python3', 'autoconf-archive', 'libffi', 'glib-2.0-native', 'flex-native', 'binutils-native', 'elfutils-native', 'python3-setuptools-native', 'mpfr-native', 'libmpc-native', 'texinfo-dummy-native', 'binutils-cross-i686', 'linux-libc-headers', 'gmp-native', 'attr-native', 'util-linux', 'bash-completion', 'libpcre', 'dbus', 'gettext-minimal-native'
 , 'libgcc', 'm4-native', 'ncurses-native', 'libpcre2-native', 'libcap-ng-native', 'libnsl2', 'readline', 'sqlite3', 'bzip2', 'libxcrypt', 'openssl', 'gdbm', 'xz', 'libtirpc', 'libpcre-native', 'unzip-native', 'libcap-ng', 'ncurses', 'base-files', 'libx11', 'shadow-sysroot', 'expat', 'initscripts', 'libsm', 'shadow-native', 'update-rc.d', 'shadow', 'base-passwd', 'util-macros', 'xorgproto', 'xtrans', 'libxcb', 'libice', 'attr', 'xcb-proto', 'libxdmcp', 'libpthread-stubs', 'libxau']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| gtkdocize: neither configure.ac nor configure.in exist
| NOTE: Executing meson -Ddocs=false -Dintrospection=true -Dman=false...
| The Meson build system
| Version: 0.55.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/json-glib-1.6.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/build
| Build type: cross build
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/recipe-sysroot/usr/share/pkgconfig'
| 
| ../json-glib-1.6.0/meson.build:1:0: ERROR: Value "true" for combo option "Build the introspection data (requires gobject-introspection)" is not one of the choices. Possible choices are: "enabled", "disabled", "auto".
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/temp/run.do_configure.2895414:211 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/temp/run.do_configure.2895414, line 211
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/temp/run.do_configure.2895414, line 175
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/temp/run.do_configure.2895414, line 160
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/temp/run.do_configure.2895414, line 215
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/temp/run.do_configure.2895414' failed with exit code 1:
| gtkdocize: neither configure.ac nor configure.in exist
| The Meson build system
| Version: 0.55.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/json-glib-1.6.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/build
| Build type: cross build
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/recipe-sysroot/usr/share/pkgconfig'
| 
| ../json-glib-1.6.0/meson.build:1:0: ERROR: Value "true" for combo option "Build the introspection data (requires gobject-introspection)" is not one of the choices. Possible choices are: "enabled", "disabled", "auto".
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/build/meson-logs/meson-log.txt
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/temp/run.do_configure.2895414:211 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/temp/run.do_configure.2895414, line 211
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/temp/run.do_configure.2895414, line 175
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/temp/run.do_configure.2895414, line 160
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/json-glib/1.6.0-r0/temp/run.do_configure.2895414, line 215
| 
| Backtrace (metadata-relative locations):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/logging.bbclass, line 72
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/meson.bbclass, line 138
| 	#3: do_configure, autogenerated, line 9
NOTE: recipe json-glib-1.6.0-r0: task do_configure: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb:do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2240 tasks of which 2232 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb:do_configure
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============4481694319003892434==--
