Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 24FBF7E0DC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2019 08:17:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4C8Ha9q024236
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 May 2019 01:17:37 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Sun, 12 May 2019 01:17:36 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Sun, 12 May 2019 16:16:26 +0800
Message-ID: <61781f82e8baf804ede70fbaa82a79840b93c807.1557628550.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1557628550.git.hongxu.jia@windriver.com>
References: <cover.1557628550.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/10] gpgme: upgrade 1.12.0 -> 1.13.0
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
X-List-Received-Date: Sun, 12 May 2019 08:17:36 -0000
Content-Type: text/plain

- Revert gpgrt-config support which oe-core does not support it

- Rebase 0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
  and 0001-pkgconfig.patch

- Tweak LANGUAGES, since upstream auto check the version of python rather
  than specify option
  [ff6ff61 python: Auto-check for all installed python versions.]

License-update: SPDX identifiers site and formats
[8d91c0f Add SPDX identifiers to most source files]
"s/LGPL-2.1+/LGPL-2.1-or-later/"
"s#https://www.gnu.org/licenses#https://gnu.org/licenses#"

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...d-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch | 134 +++++++++++++++++++++
 .../gpgme/gpgme/0001-pkgconfig.patch               |  72 +++++------
 ...python-gpg-error-config-should-not-be-use.patch |  33 +++--
 .../gpgme/0008-do-not-auto-check-var-PYTHON.patch  |  36 ++++++
 .../gpgme/{gpgme_1.12.0.bb => gpgme_1.13.0.bb}     |  12 +-
 5 files changed, 222 insertions(+), 65 deletions(-)
 create mode 100644 meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
 create mode 100644 meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch
 rename meta/recipes-support/gpgme/{gpgme_1.12.0.bb => gpgme_1.13.0.bb} (88%)

diff --git a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
new file mode 100644
index 0000000..0ed4eb6
--- /dev/null
+++ b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
@@ -0,0 +1,134 @@
+From a001b3c23bf80fd752044615b9bba6b926ff9666 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 10 May 2019 14:18:04 +0800
+Subject: [PATCH] Revert "build: Make gpgme.m4 use gpgrt-config with *.pc."
+
+This reverts commit 60828a505a1c74fd34476c181df2a588ea6f9c83.
+
+The oe-core does not support gpgrt-config, so revert it
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/gpgme.m4 | 58 ++++++++++------------------------------------------------
+ 1 file changed, 10 insertions(+), 48 deletions(-)
+
+diff --git a/src/gpgme.m4 b/src/gpgme.m4
+index 2a72f18..6c2be44 100644
+--- a/src/gpgme.m4
++++ b/src/gpgme.m4
+@@ -1,5 +1,5 @@
+ # gpgme.m4 - autoconf macro to detect GPGME.
+-# Copyright (C) 2002, 2003, 2004, 2014, 2018 g10 Code GmbH
++# Copyright (C) 2002, 2003, 2004, 2014 g10 Code GmbH
+ #
+ # This file is free software; as a special exception the author gives
+ # unlimited permission to copy and/or distribute it, with or without
+@@ -9,7 +9,7 @@
+ # WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
+ # implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+ #
+-# Last-changed: 2018-11-12
++# Last-changed: 2014-10-02
+ 
+ 
+ AC_DEFUN([_AM_PATH_GPGME_CONFIG],
+@@ -36,24 +36,10 @@ AC_DEFUN([_AM_PATH_GPGME_CONFIG],
+      fi
+   fi
+ 
+-  use_gpgrt_config=""
+-  if test x"${GPGME_CONFIG}" = x -a x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
+-    if $GPGRT_CONFIG gpgme --exists; then
+-      GPGME_CONFIG="$GPGRT_CONFIG gpgme"
+-      AC_MSG_NOTICE([Use gpgrt-config as gpgme-config])
+-      use_gpgrt_config=yes
+-    fi
+-  fi
+-  if test -z "$use_gpgrt_config"; then
+-    AC_PATH_PROG(GPGME_CONFIG, gpgme-config, no)
+-  fi
++  AC_PATH_PROG(GPGME_CONFIG, gpgme-config, no)
+ 
+   if test "$GPGME_CONFIG" != "no" ; then
+-    if test -z "$use_gpgrt_config"; then
+-      gpgme_version=`$GPGME_CONFIG --version`
+-    else
+-      gpgme_version=`$GPGME_CONFIG --modversion`
+-    fi
++    gpgme_version=`$GPGME_CONFIG --version`
+   fi
+   gpgme_version_major=`echo $gpgme_version | \
+                sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\1/'`
+@@ -66,16 +52,12 @@ AC_DEFUN([_AM_PATH_GPGME_CONFIG],
+ 
+ AC_DEFUN([_AM_PATH_GPGME_CONFIG_HOST_CHECK],
+ [
+-    if test -z "$use_gpgrt_config"; then
+-      gpgme_config_host=`$GPGME_CONFIG --host 2>/dev/null || echo none`
+-    else
+-      gpgme_config_host=`$GPGME_CONFIG --variable=host 2>/dev/null || echo none`
+-    fi
++    gpgme_config_host=`$GPGME_CONFIG --host 2>/dev/null || echo none`
+     if test x"$gpgme_config_host" != xnone ; then
+       if test x"$gpgme_config_host" != x"$host" ; then
+   AC_MSG_WARN([[
+ ***
+-*** The config script "$GPGME_CONFIG" was
++*** The config script $GPGME_CONFIG was
+ *** built for $gpgme_config_host and thus may not match the
+ *** used host $host.
+ *** You may want to use the configure option --with-gpgme-prefix
+@@ -136,11 +118,7 @@ AC_DEFUN([AM_PATH_GPGME],
+      # If we have a recent GPGME, we should also check that the
+      # API is compatible.
+      if test "$req_gpgme_api" -gt 0 ; then
+-        if test -z "$use_gpgrt_config"; then
+-          tmp=`$GPGME_CONFIG --api-version 2>/dev/null || echo 0`
+-        else
+-          tmp=`$GPGME_CONFIG --variable=api_version 2>/dev/null || echo 0`
+-        fi
++        tmp=`$GPGME_CONFIG --api-version 2>/dev/null || echo 0`
+         if test "$tmp" -gt 0 ; then
+            if test "$req_gpgme_api" -ne "$tmp" ; then
+              ok=no
+@@ -280,11 +258,7 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
+      # If we have a recent GPGME, we should also check that the
+      # API is compatible.
+      if test "$req_gpgme_api" -gt 0 ; then
+-        if test -z "$use_gpgrt_config"; then
+-          tmp=`$GPGME_CONFIG --api-version 2>/dev/null || echo 0`
+-        else
+-          tmp=`$GPGME_CONFIG --variable=api_version 2>/dev/null || echo 0`
+-        fi
++        tmp=`$GPGME_CONFIG --api-version 2>/dev/null || echo 0`
+         if test "$tmp" -gt 0 ; then
+            if test "$req_gpgme_api" -ne "$tmp" ; then
+              ok=no
+@@ -293,20 +267,8 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
+      fi
+   fi
+   if test $ok = yes; then
+-    if test -z "$use_gpgrt_config"; then
+-      GPGME_GLIB_CFLAGS=`$GPGME_CONFIG --glib --cflags`
+-      GPGME_GLIB_LIBS=`$GPGME_CONFIG --glib --libs`
+-    else
+-      if $GPGRT_CONFIG gpgme-glib --exists; then
+-        GPGME_CONFIG="$GPGRT_CONFIG gpgme-glib"
+-        GPGME_GLIB_CFLAGS=`$GPGME_CONFIG --cflags`
+-        GPGME_GLIB_LIBS=`$GPGME_CONFIG --libs`
+-      else
+-        ok = no
+-      fi
+-    fi
+-  fi
+-  if test $ok = yes; then
++    GPGME_GLIB_CFLAGS=`$GPGME_CONFIG --glib --cflags`
++    GPGME_GLIB_LIBS=`$GPGME_CONFIG --glib --libs`
+     AC_MSG_RESULT(yes)
+     ifelse([$2], , :, [$2])
+     _AM_PATH_GPGME_CONFIG_HOST_CHECK
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
index 176723c..827d95a 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
@@ -1,7 +1,7 @@
-From 6492c952d61bb93a8bf8200c093d7e491456aa5a Mon Sep 17 00:00:00 2001
+From 98ce65902b197faa8f660564613ca2e504c2f8f8 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Fri, 29 Jun 2018 14:35:41 +0800
-Subject: [PATCH 1/7] pkgconfig
+Date: Fri, 10 May 2019 14:23:55 +0800
+Subject: [PATCH] pkgconfig
 
 Update gpgme to use pkgconfig instead of -config files since its
 simpler and less error prone when cross compiling.
@@ -11,7 +11,7 @@ RP 2015/4/17
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
-Rebase to 1.11.1
+Rebase to 1.13.0
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
@@ -19,43 +19,40 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  src/Makefile.am         |   4 +-
  src/gpgme-pthread.pc.in |  15 +++++++
  src/gpgme.m4            | 114 ++++--------------------------------------------
- src/gpgme.pc.in         |  15 +++++++
- 5 files changed, 42 insertions(+), 107 deletions(-)
+ src/gpgme.pc.in         |   4 +-
+ 5 files changed, 28 insertions(+), 110 deletions(-)
  create mode 100644 src/gpgme-pthread.pc.in
- create mode 100644 src/gpgme.pc.in
 
 diff --git a/configure.ac b/configure.ac
-index af569ac..865bd10 100644
+index 25184f4..1c0a386 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -895,6 +895,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
-                 src/versioninfo.rc
+@@ -899,6 +899,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
+                 src/gpgme-glib.pc
                  src/gpgme.h)
  AC_CONFIG_FILES(src/gpgme-config, chmod +x src/gpgme-config)
-+AC_CONFIG_FILES(src/gpgme.pc src/gpgme-pthread.pc)
++AC_CONFIG_FILES(src/gpgme-pthread.pc)
  AC_CONFIG_FILES(lang/cpp/Makefile lang/cpp/src/Makefile)
+ AC_CONFIG_FILES(lang/cpp/tests/Makefile)
  AC_CONFIG_FILES(lang/cpp/src/GpgmeppConfig-w32.cmake.in)
- AC_CONFIG_FILES(lang/cpp/src/GpgmeppConfig.cmake.in)
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 1394c02..8451c3a 100644
+index d85a85c..d942f3e 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -19,12 +19,14 @@
+@@ -20,11 +20,11 @@
  ## Process this file with automake to produce Makefile.in
  
+ pkgconfigdir = $(libdir)/pkgconfig
+-pkgconfig_DATA = gpgme.pc gpgme-glib.pc
++pkgconfig_DATA = gpgme.pc gpgme-glib.pc gpgme-pthread.pc
+ 
  EXTRA_DIST = gpgme-config.in gpgme.m4 libgpgme.vers ChangeLog-2011 \
--	     gpgme.h.in versioninfo.rc.in gpgme.def
-+	     gpgme.h.in versioninfo.rc.in gpgme.def gpgme.pc.in gpgme-pthread.pc.in
+ 	     gpgme.h.in versioninfo.rc.in gpgme.def \
+-	     gpgme.pc.in gpgme-glib.pc.in
++	     gpgme.pc.in gpgme-glib.pc.in gpgme-pthread.pc.in
  
  bin_SCRIPTS = gpgme-config
  m4datadir = $(datadir)/aclocal
- m4data_DATA = gpgme.m4
- nodist_include_HEADERS = gpgme.h
-+pkgconfigdir = $(libdir)/pkgconfig
-+pkgconfig_DATA = gpgme.pc gpgme-pthread.pc
- 
- bin_PROGRAMS = gpgme-tool gpgme-json
- 
 diff --git a/src/gpgme-pthread.pc.in b/src/gpgme-pthread.pc.in
 new file mode 100644
 index 0000000..074bbf6
@@ -277,27 +274,18 @@ index 6c2be44..d8a75cb 100644
 -  AC_SUBST(GPGME_GLIB_LIBS)
  ])
 diff --git a/src/gpgme.pc.in b/src/gpgme.pc.in
-new file mode 100644
-index 0000000..b69539f
---- /dev/null
+index be288b8..16f56ac 100644
+--- a/src/gpgme.pc.in
 +++ b/src/gpgme.pc.in
-@@ -0,0 +1,15 @@
-+prefix=@prefix@
-+exec_prefix=@exec_prefix@
-+libdir=@libdir@
-+includedir=@includedir@
-+
-+# API info
-+api_version=@GPGME_CONFIG_API_VERSION@
-+host=@GPGME_CONFIG_HOST@
-+
-+Name: gpgme
-+Description: GnuPG Made Easy (GPGME) is a C language library that allows to addsupport for cryptography to a program.
-+Version: @VERSION@
-+Libs: -L${libdir} -lgpgme
+@@ -9,6 +9,6 @@ Name: gpgme
+ Description: GnuPG Made Easy to access GnuPG
+ Requires: gpg-error, libassuan
+ Version: @PACKAGE_VERSION@
+-Cflags: @GPGME_CONFIG_CFLAGS@
+-Libs: @GPGME_CONFIG_LIBS@
 +Cflags: -I${includedir}
-+Requires: libassuan gpg-error
-\ No newline at end of file
++Libs: -L${libdir} -lgpgme
+ URL: https://www.gnupg.org/software/gpgme/index.html
 -- 
 2.7.4
 
diff --git a/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch b/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
index 0d0d0c6..ecd1793 100644
--- a/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
+++ b/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
@@ -1,6 +1,6 @@
-From 03819ad1270a279223219c0e70ba631bfe517714 Mon Sep 17 00:00:00 2001
+From 52f8fd2010b900c7d382a7c4e6c1a317d8160585 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 17 Oct 2018 23:32:19 +0800
+Date: Fri, 10 May 2019 14:30:36 +0800
 Subject: [PATCH 2/7] gpgme/lang/python: gpg-error-config should not be used
 
 gpg-error-config was modified by OE to always return an error.
@@ -11,39 +11,38 @@ Upstream-Status: Inappropriate [changes are specific to OE]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-Rebase to 1.12.0
+Rebase to 1.13.0
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- lang/python/setup.py.in | 11 +----------
- 1 file changed, 1 insertion(+), 10 deletions(-)
+ lang/python/setup.py.in | 9 +--------
+ 1 file changed, 1 insertion(+), 8 deletions(-)
 
 diff --git a/lang/python/setup.py.in b/lang/python/setup.py.in
-index 65a4be0..11b8413 100755
+index 9785a28..006216d 100755
 --- a/lang/python/setup.py.in
 +++ b/lang/python/setup.py.in
 @@ -30,7 +30,6 @@ import subprocess
  import sys
  
  # Out-of-tree build of the gpg bindings.
--gpg_error_config = ["gpg-error-config"]
- gpgme_config_flags = ["--thread=pthread"]
- gpgme_config = ["gpgme-config"] + gpgme_config_flags
- gpgme_h = ""
-@@ -181,16 +180,8 @@ class BuildExtFirstHack(build):
-         shutil.copy2(source_name, sink_name)
+-gpg_error_config = ['gpg-error-config']
+ gpgme_config_flags = ['--thread=pthread']
+ gpgme_config = ['gpgme-config'] + gpgme_config_flags
+ gpgme_h = ''
+@@ -182,15 +181,9 @@ class BuildExtFirstHack(build):
  
      def _generate_errors_i(self):
--
+ 
 -        try:
 -            subprocess.check_call(
 -                gpg_error_config + ['--version'], stdout=devnull)
 -        except:
--            sys.exit("Could not find gpg-error-config.  " +
--                     "Please install the libgpg-error development package.")
--
+-            sys.exit('Could not find gpg-error-config.  ' +
+-                     'Please install the libgpg-error development package.')
+ 
          gpg_error_content = self._read_header(
--            "gpg-error.h", getconfig("cflags", config=gpg_error_config))
+-            'gpg-error.h', getconfig('cflags', config=gpg_error_config))
 +            "gpg-error.h", os.environ.get('CFLAGS').split())
  
          filter_re = re.compile(r'GPG_ERR_[^ ]* =')
diff --git a/meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch b/meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch
new file mode 100644
index 0000000..3afbfc8
--- /dev/null
+++ b/meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch
@@ -0,0 +1,36 @@
+From fc3d9cc218e60582fd158d21a1cd537a3dc1b007 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 10 May 2019 16:19:54 +0800
+Subject: [PATCH] do not auto check var-PYTHON
+
+Upstream auto check the version of python rather than specify option
+[ff6ff61 python: Auto-check for all installed python versions.]
+
+In oe-core, don't check var-PYTHON, use the setting from recipe,
+only check specific python 2.7 and 3.7
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index cb2f073..7d74a6d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -423,8 +423,8 @@ if test "$found_py" = "1"; then
+ 	if test "$found_py" = "1" -o "$found_py3" = "1"; then
+ 	  # Reset everything, so that we can look for another Python.
+           m4_foreach([mym4pythonver],
+-                     [[2.7],[3.4],[3.5],[3.6],[3.7],[3.8],[all]],
+-           [unset PYTHON
++                     [[2.7],[3.7]],
++           [
+ 	    unset PYTHON_VERSION
+ 	    unset PYTHON_CPPFLAGS
+ 	    unset PYTHON_LDFLAGS
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/gpgme/gpgme_1.12.0.bb b/meta/recipes-support/gpgme/gpgme_1.13.0.bb
similarity index 88%
rename from meta/recipes-support/gpgme/gpgme_1.12.0.bb
rename to meta/recipes-support/gpgme/gpgme_1.13.0.bb
index b46c5fc..cbd37da 100644
--- a/meta/recipes-support/gpgme/gpgme_1.12.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.13.0.bb
@@ -6,11 +6,12 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LESSER;md5=bbb461211a33b134d42ed5ee802b37ff \
-                    file://src/gpgme.h.in;endline=23;md5=4d6319e587fd944adfe61a41a8f15b36 \
+                    file://src/gpgme.h.in;endline=23;md5=2f0bf06d1c7dcb28532a9d0f94a7ca1d \
                     file://src/engine.h;endline=22;md5=4b6d8ba313d9b564cc4d4cfb1640af9d"
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
+           file://0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch \
            file://0001-pkgconfig.patch \
            file://0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch \
            file://0003-Correctly-install-python-modules.patch \
@@ -18,10 +19,11 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch \
            file://0006-fix-build-path-issue.patch \
            file://0007-python-Add-variables-to-tests.patch \
+           file://0008-do-not-auto-check-var-PYTHON.patch \
           "
 
-SRC_URI[md5sum] = "902fca3a94907efe4e929b2ade545a7c"
-SRC_URI[sha256sum] = "b4dc951c3743a60e2e120a77892e9e864fb936b2e58e7c77e8581f4d050e8cd8"
+SRC_URI[md5sum] = "e511a0d95c507ab87e713140c82fc7d0"
+SRC_URI[sha256sum] = "d4b23e47a9e784a63e029338cce0464a82ce0ae4af852886afda410f9e39c630"
 
 DEPENDS = "libgpg-error libassuan"
 RDEPENDS_${PN}-cpp += "libstdc++"
@@ -44,9 +46,7 @@ PACKAGECONFIG[python3] = ",,python3 swig-native,"
 # support. Since these bindings are currently not needed, we can disable them.
 DEFAULT_LANGUAGES = ""
 DEFAULT_LANGUAGES_class-target = "cpp"
-LANGUAGES ?= "${DEFAULT_LANGUAGES}"
-LANGUAGES .= "${@bb.utils.contains('PACKAGECONFIG', 'python2', ' python2', '', d)}"
-LANGUAGES .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', ' python3', '', d)}"
+LANGUAGES ?= "${DEFAULT_LANGUAGES} python"
 
 PYTHON_INHERIT = "${@bb.utils.contains('PACKAGECONFIG', 'python2', 'pythonnative', '', d)}"
 PYTHON_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native', '', d)}"
-- 
2.7.4


