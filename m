Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6DEE275A2F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Oct 2015 18:36:32 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 12 Oct 2015 11:36:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,674,1437462000"; d="scan'208";a="662820011"
Received: from linux-vcyq.jf.intel.com ([10.7.198.81])
	by orsmga003.jf.intel.com with ESMTP; 12 Oct 2015 11:36:27 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Oct 2015 11:30:24 -0700
Message-Id: <1444674624-9191-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1444674624-9191-1-git-send-email-juro.bystricky@intel.com>
References: <1435660700.7287.84.camel@intel.com>
	<1444674624-9191-1-git-send-email-juro.bystricky@intel.com>
Cc: richard.purdie@intel.com
Subject: [daisy][PATCH v2 ] qemu: OpenSUSE 13.2 configure error
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
X-List-Received-Date: Mon, 12 Oct 2015 18:36:32 -0000

Under some circumstances, on OpenSUSE 13.2 qemu-native configure
can fail with the error:

ERROR: User requested feature sdl
        configure was not able to find it

The following sequence can reproduce the build error:

$ bitbake libgpg-error-native
$ bitbake qemu-native

Qemu configure tests for the presence/existance of SDL by
trying to link against libSDL. libSDL in turn attempts to load
libcrypt which will then attempt to load libgpg-error.
The bitbaked libgpg-error will be built with ABI incompatible
with the one required by libcrypt.
The remedy is to force qemu configure to use the host's
libgpg-error instead. This is achieved by modifying the linker
library search order.

[YOCTO#7469]

Upstream-Status: Inappropriate [configuration]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 .../qemu/files/qemu-libcrypt-search-path-fix.patch | 37 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_1.7.0.bb           |  2 ++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/files/qemu-libcrypt-search-path-fix.patch

diff --git a/meta/recipes-devtools/qemu/files/qemu-libcrypt-search-path-fix.patch b/meta/recipes-devtools/qemu/files/qemu-libcrypt-search-path-fix.patch
new file mode 100644
index 0000000..e44d883
--- /dev/null
+++ b/meta/recipes-devtools/qemu/files/qemu-libcrypt-search-path-fix.patch
@@ -0,0 +1,37 @@
+--- a/configure
++++ b/configure
+@@ -1802,6 +1802,8 @@ if test -n "$cross_prefix" && test "$(ba
+ fi
+ 
+ sdl_too_old=no
++sdl_cflags_ex="-L/usr/lib  -L/usr/lib64 -Wl,-rpath-link,/usr/lib  -Wl,-rpath-link,/usr/lib64"
++ 
+ if test "$sdl" != "no" ; then
+   cat > $TMPC << EOF
+ #include <SDL.h>
+@@ -1814,7 +1816,7 @@ EOF
+   else
+     sdl_libs=`$sdlconfig --libs 2> /dev/null`
+   fi
+-  if compile_prog "$sdl_cflags" "$sdl_libs" ; then
++  if compile_prog "$sdl_cflags $sdl_cflags_ex" "$sdl_libs" ; then
+     if test "$_sdlversion" -lt 121 ; then
+       sdl_too_old=yes
+     else
+@@ -1853,7 +1855,7 @@ if test "$sdl" = "yes" ; then
+ #endif
+ int main(void) { return 0; }
+ EOF
+-  if compile_prog "$sdl_cflags" "$sdl_libs" ; then
++  if compile_prog "$sdl_cflags $sdl_cflags_ex" "$sdl_libs" ; then
+     sdl_libs="$sdl_libs -lX11"
+   fi
+   libs_softmmu="$sdl_libs $libs_softmmu"
+@@ -4287,6 +4289,7 @@ echo "OBJCOPY=$objcopy" >> $config_host_
+ echo "LD=$ld" >> $config_host_mak
+ echo "WINDRES=$windres" >> $config_host_mak
+ echo "LIBTOOL=$libtool" >> $config_host_mak
++CFLAGS="$CFLAGS $sdl_cflags_ex"
+ echo "CFLAGS=$CFLAGS" >> $config_host_mak
+ echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
+ echo "QEMU_INCLUDES=$QEMU_INCLUDES" >> $config_host_mak
diff --git a/meta/recipes-devtools/qemu/qemu_1.7.0.bb b/meta/recipes-devtools/qemu/qemu_1.7.0.bb
index a519645..812d372 100644
--- a/meta/recipes-devtools/qemu/qemu_1.7.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_1.7.0.bb
@@ -7,6 +7,8 @@ SRC_URI += "file://fxrstorssefix.patch \
             file://qemu-enlarge-env-entry-size.patch \
             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
             file://ide-CVE-2014-2894.patch"
+            
+SRC_URI_append_virtclass-native = " file://qemu-libcrypt-search-path-fix.patch"
 
 SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
 SRC_URI[md5sum] = "32893941d40d052a5e649efcf06aca06"
-- 
2.1.4


