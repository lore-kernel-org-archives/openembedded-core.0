Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S7CrV-0006WZ-4f
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 22:33:01 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Mar 2012 22:24:08 +0100
Message-Id: <1331587452-27755-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1331587452-27755-1-git-send-email-obi@opendreambox.org>
References: <1331587452-27755-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 1/5] python, python-native: always set platform to linux2
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
X-List-Received-Date: Mon, 12 Mar 2012 21:33:01 -0000

* Fixes many problems with linux2 vs. linux3. At least:
  - Detected version was from build-host instead of target-host.
  - linuxaudiodev and ossaudiodev were disabled for linux3.
  - Files were missing in /usr/lib/python2.7/plat-linux3.
* Imported from upstream HG rev c816479f6aaf
* Bugtracker URL: http://bugs.python.org/issue12326

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../sys_platform_is_now_always_linux2.patch        |   39 ++++++++++++++++++++
 .../recipes-devtools/python/python-native_2.7.2.bb |    1 +
 .../python/python/07-linux3-regen-fix.patch        |   18 ---------
 .../python/sys_platform_is_now_always_linux2.patch |   39 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.2.bb       |    2 +-
 5 files changed, 80 insertions(+), 19 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-native/sys_platform_is_now_always_linux2.patch
 delete mode 100644 meta/recipes-devtools/python/python/07-linux3-regen-fix.patch
 create mode 100644 meta/recipes-devtools/python/python/sys_platform_is_now_always_linux2.patch

diff --git a/meta/recipes-devtools/python/python-native/sys_platform_is_now_always_linux2.patch b/meta/recipes-devtools/python/python-native/sys_platform_is_now_always_linux2.patch
new file mode 100644
index 0000000..ed52936
--- /dev/null
+++ b/meta/recipes-devtools/python/python-native/sys_platform_is_now_always_linux2.patch
@@ -0,0 +1,39 @@
+Upstream-Status: Accepted [http://hg.python.org/cpython/rev/c816479f6aaf/]
+Bugtracker: http://bugs.python.org/issue12326
+
+[Removed "Misc/NEWS" hunk]
+
+Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
+
+# HG changeset patch
+# User Victor Stinner <victor.stinner@haypocalc.com>
+# Date 1313841758 -7200
+# Node ID c816479f6aaf71dbd3f3fe4b239186d60c55ce48
+# Parent  3e093590ac57fdda428c7da3f72ddf0c475ecf2b
+Issue #12326: sys.platform is now always 'linux2' on Linux
+
+Even if Python is compiled on Linux 3.
+
+diff --git a/configure b/configure
+--- a/configure
++++ b/configure
+@@ -2995,6 +2995,7 @@ then
+ 	MACHDEP="$ac_md_system$ac_md_release"
+ 
+ 	case $MACHDEP in
++	linux*) MACHDEP="linux2";;
+ 	cygwin*) MACHDEP="cygwin";;
+ 	darwin*) MACHDEP="darwin";;
+ 	atheos*) MACHDEP="atheos";;
+diff --git a/configure.in b/configure.in
+--- a/configure.in
++++ b/configure.in
+@@ -293,6 +293,7 @@ then
+ 	MACHDEP="$ac_md_system$ac_md_release"
+ 
+ 	case $MACHDEP in
++	linux*) MACHDEP="linux2";;
+ 	cygwin*) MACHDEP="cygwin";;
+ 	darwin*) MACHDEP="darwin";;
+ 	atheos*) MACHDEP="atheos";;
+
diff --git a/meta/recipes-devtools/python/python-native_2.7.2.bb b/meta/recipes-devtools/python/python-native_2.7.2.bb
index 8bf0af0..b00e2fc 100644
--- a/meta/recipes-devtools/python/python-native_2.7.2.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.2.bb
@@ -13,6 +13,7 @@ SRC_URI += "file://04-default-is-optimized.patch \
            file://nohostlibs.patch \
            file://multilib.patch \
            file://add-md5module-support.patch \
+           file://sys_platform_is_now_always_linux2.patch \
            "
 S = "${WORKDIR}/Python-${PV}"
 
diff --git a/meta/recipes-devtools/python/python/07-linux3-regen-fix.patch b/meta/recipes-devtools/python/python/07-linux3-regen-fix.patch
deleted file mode 100644
index d7fb313..0000000
--- a/meta/recipes-devtools/python/python/07-linux3-regen-fix.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Without this patch it calls cross-compiled python if host is running linux-3.0
-python$EXE ../../Tools/scripts/h2py.py -i '(u_long)' /usr/include/netinet/in.h
-| ./regen: line 3: /OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/python-2.6.6-nk2.8/Python-2.6.6/python: cannot execute binary file
-
-diff -uNr Python-2.6.6.orig//Lib/plat-linux3/regen Python-2.6.6/Lib/plat-linux3/regen
---- Python-2.6.6.orig//Lib/plat-linux3/regen	1970-01-01 01:00:00.000000000 +0100
-+++ Python-2.6.6/Lib/plat-linux3/regen	2001-08-09 14:48:17.000000000 +0200
-@@ -0,0 +1,8 @@
-+#! /bin/sh
-+case `uname` in
-+Linux*)	;;
-+*)	echo Probably not on a Linux system 1>&2
-+	exit 1;;
-+esac
-+set -v
-+h2py -i '(u_long)' /usr/include/sys/types.h /usr/include/netinet/in.h /usr/include/dlfcn.h
diff --git a/meta/recipes-devtools/python/python/sys_platform_is_now_always_linux2.patch b/meta/recipes-devtools/python/python/sys_platform_is_now_always_linux2.patch
new file mode 100644
index 0000000..ed52936
--- /dev/null
+++ b/meta/recipes-devtools/python/python/sys_platform_is_now_always_linux2.patch
@@ -0,0 +1,39 @@
+Upstream-Status: Accepted [http://hg.python.org/cpython/rev/c816479f6aaf/]
+Bugtracker: http://bugs.python.org/issue12326
+
+[Removed "Misc/NEWS" hunk]
+
+Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
+
+# HG changeset patch
+# User Victor Stinner <victor.stinner@haypocalc.com>
+# Date 1313841758 -7200
+# Node ID c816479f6aaf71dbd3f3fe4b239186d60c55ce48
+# Parent  3e093590ac57fdda428c7da3f72ddf0c475ecf2b
+Issue #12326: sys.platform is now always 'linux2' on Linux
+
+Even if Python is compiled on Linux 3.
+
+diff --git a/configure b/configure
+--- a/configure
++++ b/configure
+@@ -2995,6 +2995,7 @@ then
+ 	MACHDEP="$ac_md_system$ac_md_release"
+ 
+ 	case $MACHDEP in
++	linux*) MACHDEP="linux2";;
+ 	cygwin*) MACHDEP="cygwin";;
+ 	darwin*) MACHDEP="darwin";;
+ 	atheos*) MACHDEP="atheos";;
+diff --git a/configure.in b/configure.in
+--- a/configure.in
++++ b/configure.in
+@@ -293,6 +293,7 @@ then
+ 	MACHDEP="$ac_md_system$ac_md_release"
+ 
+ 	case $MACHDEP in
++	linux*) MACHDEP="linux2";;
+ 	cygwin*) MACHDEP="cygwin";;
+ 	darwin*) MACHDEP="darwin";;
+ 	atheos*) MACHDEP="atheos";;
+
diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index 2b18c53..7c2ce57 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -12,7 +12,6 @@ SRC_URI += "\
   file://05-enable-ctypes-cross-build.patch \
   file://06-ctypes-libffi-fix-configure.patch \
   file://06-avoid_usr_lib_termcap_path_in_linking.patch \
-  file://07-linux3-regen-fix.patch \
   file://99-ignore-optimization-flag.patch \
   ${DISTRO_SRC_URI} \
   file://multilib.patch \
@@ -21,6 +20,7 @@ SRC_URI += "\
   file://setup_py_skip_cross_import_check.patch \
   file://add-md5module-support.patch \
   file://host_include_contamination.patch \
+  file://sys_platform_is_now_always_linux2.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.7.5.4



