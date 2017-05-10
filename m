Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 01C4871AB8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 14:13:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 10 May 2017 07:13:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,319,1491289200"; d="scan'208";a="1167201638"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 10 May 2017 07:13:22 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 17:13:19 +0300
Message-Id: <f639ded0808f72a28e1197f36dff16bc40701a12.1494425038.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
In-Reply-To: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
References: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
Subject: [RFC PATCH 01/10] python: update to 3.5.3
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
X-List-Received-Date: Wed, 10 May 2017 14:13:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Prior versions of python do not support openssl 1.1; updating to
Python 3.6 on the other hand is a lot more involved, and so should
be done by a specialist/maintainer.

LICENSE checksum change due to copyright years.

Drop upstreamed python3-fix-CVE-2016-1000110.patch

Rebase upstream-random-fixes.patch (taken from
https://github.com/python/cpython/commit/ff558f5aba40bd173f336503def886a12f8db016 )

Rebase 0001-Do-not-use-the-shell-version-of-python-config-that-w.patch

Rebase 000-cross-compile.patch

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...on3-native_3.5.2.bb => python3-native_3.5.3.bb} |   8 +-
 ...the-shell-version-of-python-config-that-w.patch |  10 +-
 ...pile.patch => 0001-cross-compile-support.patch} |  56 ++--
 .../python3/python3-fix-CVE-2016-1000110.patch     | 148 -----------
 .../python/python3/upstream-random-fixes.patch     | 288 ++++++++++-----------
 .../python/{python3_3.5.2.bb => python3_3.5.3.bb}  |   9 +-
 6 files changed, 180 insertions(+), 339 deletions(-)
 rename meta/recipes-devtools/python/{python3-native_3.5.2.bb => python3-native_3.5.3.bb} (90%)
 rename meta/recipes-devtools/python/python3/{000-cross-compile.patch => 0001-cross-compile-support.patch} (65%)
 delete mode 100644 meta/recipes-devtools/python/python3/python3-fix-CVE-2016-1000110.patch
 rename meta/recipes-devtools/python/{python3_3.5.2.bb => python3_3.5.3.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-native_3.5.2.bb b/meta/recipes-devtools/python/python3-native_3.5.3.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-native_3.5.2.bb
rename to meta/recipes-devtools/python/python3-native_3.5.3.bb
index edcf2244f57..250697fbbc9 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.2.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.3.bb
@@ -7,7 +7,7 @@ DISTRO_SRC_URI_linuxstdbase = ""
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 file://12-distutils-prefix-is-inside-staging-area.patch \
 file://python-config.patch \
-file://000-cross-compile.patch \
+file://0001-cross-compile-support.patch \
 file://030-fixup-include-dirs.patch \
 file://070-dont-clean-ipkg-install.patch \
 file://080-distutils-dont_adjust_files.patch \
@@ -26,10 +26,10 @@ file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
 file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
 "
 
-SRC_URI[md5sum] = "8906efbacfcdc7c3c9198aeefafd159e"  
-SRC_URI[sha256sum] = "0010f56100b9b74259ebcd5d4b295a32324b58b517403a10d1a2aa7cb22bca40" 
+SRC_URI[md5sum] = "57d1f8bfbabf4f2500273fb0706e6f21"
+SRC_URI[sha256sum] = "eefe2ad6575855423ab630f5b51a8ef6e5556f774584c06beab4926f930ddbb0"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6b60258130e4ed10d3101517eb5b9385"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b680ed99aa60d350c65a65914494207e"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
index b7e0ac63544..8ea3f03fe03 100644
--- a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
+++ b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
@@ -1,4 +1,4 @@
-From 045c99b5f1eb6e4e0d8ad1ef9f0ba6574f738150 Mon Sep 17 00:00:00 2001
+From 04df959365e2b54d7503edf0e5534ff094284f2d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 23 Oct 2015 12:25:09 +0300
 Subject: [PATCH] Do not use the shell version of python-config that was
@@ -14,13 +14,13 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 3 insertions(+), 6 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index d7fc9a0..47e60bc 100644
+index 236f005..5c4337f 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1270,12 +1270,9 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -1348,12 +1348,9 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	sed -e "s,@EXENAME@,$(BINDIR)/python$(LDVERSION)$(EXE)," < $(srcdir)/Misc/python-config.in >python-config.py
  	# Replace makefile compat. variable references with shell script compat. ones; $(VAR) -> ${VAR}
- 	sed -e 's,\$$(\([A-Za-z0-9_]*\)),\$$\{\1\},g' < Misc/python-config.sh >python-config
+ 	LC_ALL=C sed -e 's,\$$(\([A-Za-z0-9_]*\)),\$$\{\1\},g' < Misc/python-config.sh >python-config
 -	# On Darwin, always use the python version of the script, the shell
 -	# version doesn't use the compiler customizations that are provided
 -	# in python (_osx_support.py).
@@ -34,5 +34,5 @@ index d7fc9a0..47e60bc 100644
  
  # Install the include files
 -- 
-2.1.4
+2.11.0
 
diff --git a/meta/recipes-devtools/python/python3/000-cross-compile.patch b/meta/recipes-devtools/python/python3/0001-cross-compile-support.patch
similarity index 65%
rename from meta/recipes-devtools/python/python3/000-cross-compile.patch
rename to meta/recipes-devtools/python/python3/0001-cross-compile-support.patch
index 2d822218f49..118d75ddc5a 100644
--- a/meta/recipes-devtools/python/python3/000-cross-compile.patch
+++ b/meta/recipes-devtools/python/python3/0001-cross-compile-support.patch
@@ -1,27 +1,32 @@
+From 624c029abcc73c724020ccea9a2b4b5b5c00f2a6 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 31 Mar 2017 15:42:46 +0300
+Subject: [PATCH] cross-compile support
+
 We cross compile python. This patch uses tools from host/native
 python instead of in-tree tools
 
 -Khem
 
 Upstream-Status: Inappropriate[Configuration Specific]
-
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
- Makefile.pre.in |   25 +++++++++++++------------
- 1 file changed, 13 insertions(+), 12 deletions(-)
+ Makefile.pre.in | 14 ++++++++------
+ 1 file changed, 8 insertions(+), 6 deletions(-)
 
-Index: Python-3.5.2/Makefile.pre.in
-===================================================================
---- Python-3.5.2.orig/Makefile.pre.in
-+++ Python-3.5.2/Makefile.pre.in
-@@ -220,6 +220,7 @@ LIBOBJS=	@LIBOBJS@
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index a88b7d5..7cb8bb3 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -221,6 +221,7 @@ LIBOBJS=	@LIBOBJS@
  
  PYTHON=		python$(EXE)
  BUILDPYTHON=	python$(BUILDEXE)
-+HOSTPYTHON=	$(BUILDPYTHON)
++HOSTPYTHON=    $(BUILDPYTHON)
  
- cross_compiling=@cross_compiling@
+ PYTHON_FOR_GEN=@PYTHON_FOR_GEN@
  PYTHON_FOR_BUILD=@PYTHON_FOR_BUILD@
-@@ -279,6 +280,7 @@ LIBFFI_INCLUDEDIR=	@LIBFFI_INCLUDEDIR@
+@@ -280,6 +281,7 @@ LIBFFI_INCLUDEDIR=	@LIBFFI_INCLUDEDIR@
  ##########################################################################
  # Parser
  PGEN=		Parser/pgen$(EXE)
@@ -29,7 +34,7 @@ Index: Python-3.5.2/Makefile.pre.in
  
  PSRCS=		\
  		Parser/acceler.c \
-@@ -509,7 +511,7 @@ build_all_generate_profile:
+@@ -510,7 +512,7 @@ build_all_generate_profile:
  
  run_profile_task:
  	: # FIXME: can't run for a cross build
@@ -38,16 +43,16 @@ Index: Python-3.5.2/Makefile.pre.in
  
  build_all_merge_profile:
  	$(LLVM_PROF_MERGER)
-@@ -792,7 +794,7 @@ $(GRAMMAR_H): $(GRAMMAR_INPUT) $(PGEN)
+@@ -787,7 +789,7 @@ $(IO_OBJS): $(IO_H)
+ 
+ $(GRAMMAR_H): @GENERATED_COMMENT@ $(GRAMMAR_INPUT) $(PGEN)
  	@$(MKDIR_P) Include
- 	# Avoid copying the file onto itself for an in-tree build
- 	if test "$(cross_compiling)" != "yes"; then \
--		$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C); \
-+		$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C); \
- 	else \
- 		cp $(srcdir)/Include/graminit.h $(GRAMMAR_H).tmp; \
- 		mv $(GRAMMAR_H).tmp $(GRAMMAR_H); \
-@@ -990,7 +992,7 @@ $(LIBRARY_OBJS) $(MODOBJS) Programs/pyth
+-	$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
++	$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
+ $(GRAMMAR_C): @GENERATED_COMMENT@ $(GRAMMAR_H)
+ 	touch $(GRAMMAR_C)
+ 
+@@ -976,7 +978,7 @@ $(LIBRARY_OBJS) $(MODOBJS) Programs/python.o: $(PYTHON_HEADERS)
  ######################################################################
  
  TESTOPTS=	$(EXTRATESTOPTS)
@@ -56,7 +61,7 @@ Index: Python-3.5.2/Makefile.pre.in
  TESTRUNNER=	$(TESTPYTHON) $(srcdir)/Tools/scripts/run_tests.py
  TESTTIMEOUT=	3600
  
-@@ -1481,7 +1483,7 @@ frameworkinstallstructure:	$(LDLIBRARY)
+@@ -1468,7 +1470,7 @@ frameworkinstallstructure:	$(LDLIBRARY)
  		fi; \
  	done
  	$(LN) -fsn include/python$(LDVERSION) $(DESTDIR)$(prefix)/Headers
@@ -65,7 +70,7 @@ Index: Python-3.5.2/Makefile.pre.in
  	$(LN) -fsn $(VERSION) $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/Versions/Current
  	$(LN) -fsn Versions/Current/$(PYTHONFRAMEWORK) $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/$(PYTHONFRAMEWORK)
  	$(LN) -fsn Versions/Current/Headers $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/Headers
-@@ -1547,7 +1549,7 @@ config.status:	$(srcdir)/configure
+@@ -1534,7 +1536,7 @@ config.status:	$(srcdir)/configure
  
  # Run reindent on the library
  reindent:
@@ -74,7 +79,7 @@ Index: Python-3.5.2/Makefile.pre.in
  
  # Rerun configure with the same options as it was run last time,
  # provided the config.status script exists
-@@ -1683,7 +1685,7 @@ funny:
+@@ -1674,7 +1676,7 @@ funny:
  
  # Perform some verification checks on any modified files.
  patchcheck: all
@@ -83,3 +88,6 @@ Index: Python-3.5.2/Makefile.pre.in
  
  # Dependencies
  
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/python/python3/python3-fix-CVE-2016-1000110.patch b/meta/recipes-devtools/python/python3/python3-fix-CVE-2016-1000110.patch
deleted file mode 100644
index ab1b7230ea6..00000000000
--- a/meta/recipes-devtools/python/python3/python3-fix-CVE-2016-1000110.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-From aab3e8c432b90508ac14755128f5a687be2fdf43 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <Mingli.Yu@windriver.com>
-Date: Thu, 22 Sep 2016 16:39:49 +0800
-Subject: [PATCH] python3: fix CVE-2016-1000110
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Ignore the HTTP_PROXY variable when REQUEST_METHOD environment is set, which
-indicates that the script is in CGI mode.
-
-Issue #27568 Reported and patch contributed by Rémi Rampin. [#27568]
-
-Backport patch from https://hg.python.org/cpython/rev/a0ac52ed8f79
-
-Upstream-Status: Backport
-CVE: CVE-2016-1000110
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
----
- Doc/howto/urllib2.rst          |  5 +++++
- Doc/library/urllib.request.rst | 17 ++++++++++++++++-
- Lib/test/test_urllib.py        | 14 +++++++++++++-
- Lib/urllib/request.py          |  6 ++++++
- Misc/NEWS                      |  4 ++++
- 5 files changed, 44 insertions(+), 2 deletions(-)
-
-diff --git a/Doc/howto/urllib2.rst b/Doc/howto/urllib2.rst
-index 24a4156..d2c7991 100644
---- a/Doc/howto/urllib2.rst
-+++ b/Doc/howto/urllib2.rst
-@@ -538,6 +538,11 @@ setting up a `Basic Authentication`_ handler: ::
-     through a proxy.  However, this can be enabled by extending urllib.request as
-     shown in the recipe [#]_.
- 
-+.. note::
-+
-+    ``HTTP_PROXY`` will be ignored if a variable ``REQUEST_METHOD`` is set; see
-+    the documentation on :func:`~urllib.request.getproxies`.
-+
- 
- Sockets and Layers
- ==================
-diff --git a/Doc/library/urllib.request.rst b/Doc/library/urllib.request.rst
-index 1338906..1291aeb 100644
---- a/Doc/library/urllib.request.rst
-+++ b/Doc/library/urllib.request.rst
-@@ -173,6 +173,16 @@ The :mod:`urllib.request` module defines the following functions:
-    If both lowercase and uppercase environment variables exist (and disagree),
-    lowercase is preferred.
- 
-+    .. note::
-+
-+       If the environment variable ``REQUEST_METHOD`` is set, which usually
-+       indicates your script is running in a CGI environment, the environment
-+       variable ``HTTP_PROXY`` (uppercase ``_PROXY``) will be ignored. This is
-+       because that variable can be injected by a client using the "Proxy:" HTTP
-+       header. If you need to use an HTTP proxy in a CGI environment, either use
-+       ``ProxyHandler`` explicitly, or make sure the variable name is in
-+       lowercase (or at least the ``_proxy`` suffix).
-+
- 
- The following classes are provided:
- 
-@@ -280,6 +290,11 @@ The following classes are provided:
-    list of hostname suffixes, optionally with ``:port`` appended, for example
-    ``cern.ch,ncsa.uiuc.edu,some.host:8080``.
- 
-+    .. note::
-+
-+       ``HTTP_PROXY`` will be ignored if a variable ``REQUEST_METHOD`` is set;
-+       see the documentation on :func:`~urllib.request.getproxies`.
-+
- 
- .. class:: HTTPPasswordMgr()
- 
-@@ -1138,7 +1153,7 @@ the returned bytes object to string once it determines or guesses
- the appropriate encoding.
- 
- The following W3C document, https://www.w3.org/International/O-charset\ , lists
--the various ways in which a (X)HTML or a XML document could have specified its
-+the various ways in which an (X)HTML or an XML document could have specified its
- encoding information.
- 
- As the python.org website uses *utf-8* encoding as specified in its meta tag, we
-diff --git a/Lib/test/test_urllib.py b/Lib/test/test_urllib.py
-index 5d05f8d..247598a 100644
---- a/Lib/test/test_urllib.py
-+++ b/Lib/test/test_urllib.py
-@@ -1,4 +1,4 @@
--"""Regresssion tests for what was in Python 2's "urllib" module"""
-+"""Regression tests for what was in Python 2's "urllib" module"""
- 
- import urllib.parse
- import urllib.request
-@@ -232,6 +232,18 @@ class ProxyTests(unittest.TestCase):
-         self.assertTrue(urllib.request.proxy_bypass_environment('anotherdomain.com:8888'))
-         self.assertTrue(urllib.request.proxy_bypass_environment('newdomain.com:1234'))
- 
-+    def test_proxy_cgi_ignore(self):
-+        try:
-+            self.env.set('HTTP_PROXY', 'http://somewhere:3128')
-+            proxies = urllib.request.getproxies_environment()
-+            self.assertEqual('http://somewhere:3128', proxies['http'])
-+            self.env.set('REQUEST_METHOD', 'GET')
-+            proxies = urllib.request.getproxies_environment()
-+            self.assertNotIn('http', proxies)
-+        finally:
-+            self.env.unset('REQUEST_METHOD')
-+            self.env.unset('HTTP_PROXY')
-+
-     def test_proxy_bypass_environment_host_match(self):
-         bypass = urllib.request.proxy_bypass_environment
-         self.env.set('NO_PROXY',
-diff --git a/Lib/urllib/request.py b/Lib/urllib/request.py
-index 1731fe3..3be327d 100644
---- a/Lib/urllib/request.py
-+++ b/Lib/urllib/request.py
-@@ -2412,6 +2412,12 @@ def getproxies_environment():
-         name = name.lower()
-         if value and name[-6:] == '_proxy':
-             proxies[name[:-6]] = value
-+    # CVE-2016-1000110 - If we are running as CGI script, forget HTTP_PROXY
-+    # (non-all-lowercase) as it may be set from the web server by a "Proxy:"
-+    # header from the client
-+    # If "proxy" is lowercase, it will still be used thanks to the next block
-+    if 'REQUEST_METHOD' in os.environ:
-+        proxies.pop('http', None)
-     for name, value in os.environ.items():
-         if name[-6:] == '_proxy':
-             name = name.lower()
-diff --git a/Misc/NEWS b/Misc/NEWS
-index 4ad2551..2fcc95b 100644
---- a/Misc/NEWS
-+++ b/Misc/NEWS
-@@ -329,6 +329,10 @@ Library
- - Issue #26644: Raise ValueError rather than SystemError when a negative
-   length is passed to SSLSocket.recv() or read().
- 
-+- Issue #27568: Prevent HTTPoxy attack (CVE-2016-1000110). Ignore the
-+  HTTP_PROXY variable when REQUEST_METHOD environment is set, which indicates
-+  that the script is in CGI mode.
-+
- - Issue #23804: Fix SSL recv(0) and read(0) methods to return zero bytes
-   instead of up to 1024.
- 
--- 
-2.8.1
-
diff --git a/meta/recipes-devtools/python/python3/upstream-random-fixes.patch b/meta/recipes-devtools/python/python3/upstream-random-fixes.patch
index 0d9152ccd7c..9b40e8ac9ff 100644
--- a/meta/recipes-devtools/python/python3/upstream-random-fixes.patch
+++ b/meta/recipes-devtools/python/python3/upstream-random-fixes.patch
@@ -1,21 +1,7 @@
-This patch updates random.c to match upstream python's code at revision 
-8125d9a8152b. This addresses various issues around problems with glibc 2.24 
-and 2.25 such that python would fail to start with:
-
-[rpurdie@centos7 ~]$ /tmp/t2/sysroots/x86_64-pokysdk-linux/usr/bin/python3
-Fatal Python error: getentropy() failed
-Aborted
-
-(taken from our buildtools-tarball also breaks eSDK)
-
-Upstream-Status: Backport
-
-# HG changeset patch
-# User Victor Stinner <victor.stinner@gmail.com>
-# Date 1483957133 -3600
-# Node ID 8125d9a8152b79e712cb09c7094b9129b9bcea86
-# Parent  337461574c90281630751b6095c4e1baf380cf7d
-Issue #29157: Prefer getrandom() over getentropy()
+From 035ba5da3e53e45c712b39fe1f6fb743e697c032 Mon Sep 17 00:00:00 2001
+From: Victor Stinner <victor.stinner@gmail.com>
+Date: Mon, 9 Jan 2017 11:18:53 +0100
+Subject: [PATCH] Issue #29157: Prefer getrandom() over getentropy()
 
 Copy and then adapt Python/random.c from default branch. Difference between 3.5
 and default branches:
@@ -26,12 +12,17 @@ and default branches:
 * Python 3.5 has no _PyOS_URandomNonblock() function: _PyOS_URandom()
   works in non-blocking mode on Python 3.5
 
-RP 2017/1/22
+Upstream-Status: Backport [https://github.com/python/cpython/commit/035ba5da3e53e45c712b39fe1f6fb743e697c032]
+Signed-off-by: Alexander Kanavin <alexander.kanavin@intel.com>
+
+---
+ Python/random.c | 494 +++++++++++++++++++++++++++++++++-----------------------
+ 1 file changed, 294 insertions(+), 200 deletions(-)
 
-Index: Python-3.5.2/Python/random.c
-===================================================================
---- Python-3.5.2.orig/Python/random.c
-+++ Python-3.5.2/Python/random.c
+diff --git a/Python/random.c b/Python/random.c
+index d203939..31f61d0 100644
+--- a/Python/random.c
++++ b/Python/random.c
 @@ -1,6 +1,9 @@
  #include "Python.h"
  #ifdef MS_WINDOWS
@@ -42,7 +33,7 @@ Index: Python-3.5.2/Python/random.c
  #else
  #  include <fcntl.h>
  #  ifdef HAVE_SYS_STAT_H
-@@ -36,10 +39,9 @@ win32_urandom_init(int raise)
+@@ -37,10 +40,9 @@ win32_urandom_init(int raise)
      return 0;
  
  error:
@@ -55,7 +46,7 @@ Index: Python-3.5.2/Python/random.c
      return -1;
  }
  
-@@ -52,8 +54,9 @@ win32_urandom(unsigned char *buffer, Py_
+@@ -53,8 +55,9 @@ win32_urandom(unsigned char *buffer, Py_ssize_t size, int raise)
  
      if (hCryptProv == 0)
      {
@@ -66,7 +57,7 @@ Index: Python-3.5.2/Python/random.c
      }
  
      while (size > 0)
-@@ -62,11 +65,9 @@ win32_urandom(unsigned char *buffer, Py_
+@@ -63,11 +66,9 @@ win32_urandom(unsigned char *buffer, Py_ssize_t size, int raise)
          if (!CryptGenRandom(hCryptProv, (DWORD)chunk, buffer))
          {
              /* CryptGenRandom() failed */
@@ -80,7 +71,7 @@ Index: Python-3.5.2/Python/random.c
              return -1;
          }
          buffer += chunk;
-@@ -75,55 +76,29 @@ win32_urandom(unsigned char *buffer, Py_
+@@ -76,58 +77,23 @@ win32_urandom(unsigned char *buffer, Py_ssize_t size, int raise)
      return 0;
  }
  
@@ -129,13 +120,19 @@ Index: Python-3.5.2/Python/random.c
  #if defined(HAVE_GETRANDOM) || defined(HAVE_GETRANDOM_SYSCALL)
  #define PY_GETRANDOM 1
  
+-/* Call getrandom()
 +/* Call getrandom() to get random bytes:
 +
-+   - Return 1 on success
+    - Return 1 on success
+-   - Return 0 if getrandom() syscall is not available (failed with ENOSYS or
+-     EPERM) or if getrandom(GRND_NONBLOCK) failed with EAGAIN (system urandom
+-     not initialized yet) and raise=0.
 +   - Return 0 if getrandom() is not available (failed with ENOSYS or EPERM),
 +     or if getrandom(GRND_NONBLOCK) failed with EAGAIN (system urandom not
 +     initialized yet).
-+   - Raise an exception (if raise is non-zero) and return -1 on error:
+    - Raise an exception (if raise is non-zero) and return -1 on error:
+-     getrandom() failed with EINTR and the Python signal handler raised an
+-     exception, or getrandom() failed with a different error. */
 +     if getrandom() failed with EINTR, raise is non-zero and the Python signal
 +     handler raised an exception, or if getrandom() failed with a different
 +     error.
@@ -144,26 +141,16 @@ Index: Python-3.5.2/Python/random.c
  static int
  py_getrandom(void *buffer, Py_ssize_t size, int raise)
  {
--    /* Is getrandom() supported by the running kernel?
--     * Need Linux kernel 3.17 or newer, or Solaris 11.3 or newer */
-+    /* Is getrandom() supported by the running kernel? Set to 0 if getrandom()
-+       failed with ENOSYS or EPERM. Need Linux kernel 3.17 or newer, or Solaris
-+       11.3 or newer */
-     static int getrandom_works = 1;
- 
-     /* getrandom() on Linux will block if called before the kernel has
-@@ -132,84 +107,165 @@ py_getrandom(void *buffer, Py_ssize_t si
+@@ -142,16 +108,19 @@ py_getrandom(void *buffer, Py_ssize_t size, int raise)
       * see https://bugs.python.org/issue26839. To avoid this, use the
       * GRND_NONBLOCK flag. */
      const int flags = GRND_NONBLOCK;
--    int n;
 +    char *dest;
-+    long n;
+     long n;
  
--    if (!getrandom_works)
-+    if (!getrandom_works) {
+     if (!getrandom_works) {
          return 0;
-+    }
+     }
  
 +    dest = buffer;
      while (0 < size) {
@@ -174,11 +161,8 @@ Index: Python-3.5.2/Python/random.c
 +           requested. */
          n = Py_MIN(size, 1024);
  #else
--        n = size;
-+        n = Py_MIN(size, LONG_MAX);
- #endif
- 
-         errno = 0;
+         n = Py_MIN(size, LONG_MAX);
+@@ -161,34 +130,35 @@ py_getrandom(void *buffer, Py_ssize_t size, int raise)
  #ifdef HAVE_GETRANDOM
          if (raise) {
              Py_BEGIN_ALLOW_THREADS
@@ -209,56 +193,45 @@ Index: Python-3.5.2/Python/random.c
  #endif
  
          if (n < 0) {
--            if (errno == ENOSYS) {
+-            /* ENOSYS: getrandom() syscall not supported by the kernel (but
+-             * maybe supported by the host which built Python). EPERM:
+-             * getrandom() syscall blocked by SECCOMP or something else. */
 +            /* ENOSYS: the syscall is not supported by the kernel.
 +               EPERM: the syscall is blocked by a security policy (ex: SECCOMP)
 +               or something else. */
-+            if (errno == ENOSYS || errno == EPERM) {
+             if (errno == ENOSYS || errno == EPERM) {
                  getrandom_works = 0;
                  return 0;
              }
 +
              if (errno == EAGAIN) {
--                /* If we failed with EAGAIN, the entropy pool was
--                 * uninitialized. In this case, we return failure to fall
--                 * back to reading from /dev/urandom.
--                 *
--                 * Note: In this case the data read will not be random so
--                 * should not be used for cryptographic purposes. Retaining
--                 * the existing semantics for practical purposes. */
-+                /* getrandom(GRND_NONBLOCK) fails with EAGAIN if the system
-+                   urandom is not initialiazed yet. In this case, fall back on
-+                   reading from /dev/urandom.
-+
-+                   Note: In this case the data read will not be random so
-+                   should not be used for cryptographic purposes. Retaining
-+                   the existing semantics for practical purposes. */
-                 getrandom_works = 0;
-                 return 0;
+                 /* getrandom(GRND_NONBLOCK) fails with EAGAIN if the system
+                    urandom is not initialiazed yet. In this case, fall back on
+@@ -202,169 +172,225 @@ py_getrandom(void *buffer, Py_ssize_t size, int raise)
              }
  
              if (errno == EINTR) {
 -                if (PyErr_CheckSignals()) {
--                    if (!raise)
+-                    if (!raise) {
 -                        Py_FatalError("getrandom() interrupted by a signal");
--                    return -1;
 +                if (raise) {
 +                    if (PyErr_CheckSignals()) {
 +                        return -1;
-+                    }
+                     }
+-                    return -1;
                  }
+ 
 -                /* retry getrandom() */
-+
 +                /* retry getrandom() if it was interrupted by a signal */
                  continue;
              }
  
--            if (raise)
-+            if (raise) {
+             if (raise) {
                  PyErr_SetFromErrno(PyExc_OSError);
--            else
+             }
+-            else {
 -                Py_FatalError("getrandom() failed");
-+            }
+-            }
              return -1;
          }
  
@@ -269,12 +242,19 @@ Index: Python-3.5.2/Python/random.c
      return 1;
  }
 -#endif
-+
+ 
+-static struct {
+-    int fd;
+-    dev_t st_dev;
+-    ino_t st_ino;
+-} urandom_cache = { -1 };
 +#elif defined(HAVE_GETENTROPY)
 +#define PY_GETENTROPY 1
-+
+ 
 +/* Fill buffer with size pseudo-random bytes generated by getentropy():
-+
+ 
+-/* Read 'size' random bytes from py_getrandom(). Fall back on reading from
+-   /dev/urandom if getrandom() is not available.
 +   - Return 1 on success
 +   - Return 0 if getentropy() syscall is not available (failed with ENOSYS or
 +     EPERM).
@@ -282,25 +262,47 @@ Index: Python-3.5.2/Python/random.c
 +     if getentropy() failed with EINTR, raise is non-zero and the Python signal
 +     handler raised an exception, or if getentropy() failed with a different
 +     error.
-+
+ 
+-   Call Py_FatalError() on error. */
+-static void
+-dev_urandom_noraise(unsigned char *buffer, Py_ssize_t size)
 +   getentropy() is retried if it failed with EINTR: interrupted by a signal. */
 +static int
 +py_getentropy(char *buffer, Py_ssize_t size, int raise)
-+{
+ {
+-    int fd;
+-    Py_ssize_t n;
 +    /* Is getentropy() supported by the running kernel? Set to 0 if
 +       getentropy() failed with ENOSYS or EPERM. */
 +    static int getentropy_works = 1;
-+
+ 
+-    assert (0 < size);
+-
+-#ifdef PY_GETRANDOM
+-    if (py_getrandom(buffer, size, 0) == 1) {
+-        return;
 +    if (!getentropy_works) {
 +        return 0;
-+    }
-+
+     }
+-    /* getrandom() failed with ENOSYS or EPERM,
+-       fall back on reading /dev/urandom */
+-#endif
+ 
+-    fd = _Py_open_noraise("/dev/urandom", O_RDONLY);
+-    if (fd < 0) {
+-        Py_FatalError("Failed to open /dev/urandom");
+-    }
 +    while (size > 0) {
 +        /* getentropy() is limited to returning up to 256 bytes. Call it
 +           multiple times if more bytes are requested. */
 +        Py_ssize_t len = Py_MIN(size, 256);
 +        int res;
-+
+ 
+-    while (0 < size)
+-    {
+-        do {
+-            n = read(fd, buffer, (size_t)size);
+-        } while (n < 0 && errno == EINTR);
 +        if (raise) {
 +            Py_BEGIN_ALLOW_THREADS
 +            res = getentropy(buffer, len);
@@ -309,7 +311,11 @@ Index: Python-3.5.2/Python/random.c
 +        else {
 +            res = getentropy(buffer, len);
 +        }
-+
+ 
+-        if (n <= 0) {
+-            /* read() failed or returned 0 bytes */
+-            Py_FatalError("Failed to read bytes from /dev/urandom");
+-            break;
 +        if (res < 0) {
 +            /* ENOSYS: the syscall is not supported by the running kernel.
 +               EPERM: the syscall is blocked by a security policy (ex: SECCOMP)
@@ -334,71 +340,44 @@ Index: Python-3.5.2/Python/random.c
 +                PyErr_SetFromErrno(PyExc_OSError);
 +            }
 +            return -1;
-+        }
+         }
+-        buffer += n;
+-        size -= n;
 +
 +        buffer += len;
 +        size -= len;
-+    }
+     }
+-    close(fd);
 +    return 1;
-+}
+ }
 +#endif /* defined(HAVE_GETENTROPY) && !defined(sun) */
-+
  
- static struct {
-     int fd;
-@@ -217,127 +273,123 @@ static struct {
-     ino_t st_ino;
- } urandom_cache = { -1 };
+-/* Read 'size' random bytes from py_getrandom(). Fall back on reading from
+-   /dev/urandom if getrandom() is not available.
  
+-   Return 0 on success. Raise an exception and return -1 on error. */
++static struct {
++    int fd;
++    dev_t st_dev;
++    ino_t st_ino;
++} urandom_cache = { -1 };
++
 +/* Read random bytes from the /dev/urandom device:
- 
--/* Read size bytes from /dev/urandom into buffer.
--   Call Py_FatalError() on error. */
--static void
--dev_urandom_noraise(unsigned char *buffer, Py_ssize_t size)
--{
--    int fd;
--    Py_ssize_t n;
++
 +   - Return 0 on success
 +   - Raise an exception (if raise is non-zero) and return -1 on error
- 
--    assert (0 < size);
++
 +   Possible causes of errors:
- 
--#ifdef PY_GETRANDOM
--    if (py_getrandom(buffer, size, 0) == 1)
--        return;
--    /* getrandom() is not supported by the running kernel, fall back
--     * on reading /dev/urandom */
--#endif
++
 +   - open() failed with ENOENT, ENXIO, ENODEV, EACCES: the /dev/urandom device
 +     was not found. For example, it was removed manually or not exposed in a
 +     chroot or container.
 +   - open() failed with a different error
 +   - fstat() failed
 +   - read() failed or returned 0
- 
--    fd = _Py_open_noraise("/dev/urandom", O_RDONLY);
--    if (fd < 0)
--        Py_FatalError("Failed to open /dev/urandom");
++
 +   read() is retried if it failed with EINTR: interrupted by a signal.
- 
--    while (0 < size)
--    {
--        do {
--            n = read(fd, buffer, (size_t)size);
--        } while (n < 0 && errno == EINTR);
--        if (n <= 0)
--        {
--            /* stop on error or if read(size) returned 0 */
--            Py_FatalError("Failed to read bytes from /dev/urandom");
--            break;
--        }
--        buffer += n;
--        size -= (Py_ssize_t)n;
--    }
--    close(fd);
--}
++
 +   The file descriptor of the device is kept open between calls to avoid using
 +   many file descriptors when run in parallel from multiple threads:
 +   see the issue #18756.
@@ -406,9 +385,7 @@ Index: Python-3.5.2/Python/random.c
 +   st_dev and st_ino fields of the file descriptor (from fstat()) are cached to
 +   check if the file descriptor was replaced by a different file (which is
 +   likely a bug in the application): see the issue #21207.
- 
--/* Read size bytes from /dev/urandom into buffer.
--   Return 0 on success, raise an exception and return -1 on error. */
++
 +   If the file descriptor was closed or replaced, open a new file descriptor
 +   but don't close the old file descriptor: it probably points to something
 +   important for some third-party code. */
@@ -422,22 +399,24 @@ Index: Python-3.5.2/Python/random.c
 -#ifdef PY_GETRANDOM
 -    int res;
 -#endif
- 
+-
 -    if (size <= 0)
 -        return 0;
-+    if (raise) {
-+        struct _Py_stat_struct st;
  
 -#ifdef PY_GETRANDOM
 -    res = py_getrandom(buffer, size, 1);
--    if (res < 0)
+-    if (res < 0) {
 -        return -1;
--    if (res == 1)
+-    }
+-    if (res == 1) {
 -        return 0;
--    /* getrandom() is not supported by the running kernel, fall back
--     * on reading /dev/urandom */
+-    }
+-    /* getrandom() failed with ENOSYS or EPERM,
+-       fall back on reading /dev/urandom */
 -#endif
--
++    if (raise) {
++        struct _Py_stat_struct st;
+ 
 -    if (urandom_cache.fd >= 0) {
 -        /* Does the fd point to the same thing as before? (issue #21207) */
 -        if (_Py_fstat_noraise(urandom_cache.fd, &st)
@@ -516,8 +495,9 @@ Index: Python-3.5.2/Python/random.c
  
 -    do {
 -        n = _Py_read(fd, buffer, (size_t)size);
--        if (n == -1)
+-        if (n == -1) {
 -            return -1;
+-        }
 -        if (n == 0) {
 -            PyErr_Format(PyExc_RuntimeError,
 -                    "Failed to read %zi bytes from /dev/urandom",
@@ -566,7 +546,7 @@ Index: Python-3.5.2/Python/random.c
      return 0;
  }
  
-@@ -349,8 +401,8 @@ dev_urandom_close(void)
+@@ -376,8 +402,8 @@ dev_urandom_close(void)
          urandom_cache.fd = -1;
      }
  }
@@ -576,7 +556,7 @@ Index: Python-3.5.2/Python/random.c
  
  /* Fill buffer with pseudo-random bytes generated by a linear congruent
     generator (LCG):
-@@ -373,29 +425,98 @@ lcg_urandom(unsigned int x0, unsigned ch
+@@ -400,31 +426,100 @@ lcg_urandom(unsigned int x0, unsigned char *buffer, size_t size)
      }
  }
  
@@ -661,7 +641,7 @@ Index: Python-3.5.2/Python/random.c
  #else
 -    return dev_urandom_python((char*)buffer, size);
 +    res = py_getentropy(buffer, size, raise);
- #endif
++#endif
 +    if (res < 0) {
 +        return -1;
 +    }
@@ -673,9 +653,9 @@ Index: Python-3.5.2/Python/random.c
 +#endif
 +
 +    return dev_urandom(buffer, size, raise);
-+#endif
-+}
-+
+ #endif
+ }
+ 
 +/* Fill buffer with size pseudo-random bytes from the operating system random
 +   number generator (RNG). It is suitable for most cryptographic purposes
 +   except long living private keys for asymmetric encryption.
@@ -685,10 +665,12 @@ Index: Python-3.5.2/Python/random.c
 +_PyOS_URandom(void *buffer, Py_ssize_t size)
 +{
 +    return pyurandom(buffer, size, 1);
- }
- 
++}
++
  void
-@@ -436,13 +557,14 @@ _PyRandom_Init(void)
+ _PyRandom_Init(void)
+ {
+@@ -463,13 +558,14 @@ _PyRandom_Init(void)
          }
      }
      else {
@@ -710,7 +692,7 @@ Index: Python-3.5.2/Python/random.c
      }
  }
  
-@@ -454,8 +576,6 @@ _PyRandom_Fini(void)
+@@ -481,8 +577,6 @@ _PyRandom_Fini(void)
          CryptReleaseContext(hCryptProv, 0);
          hCryptProv = 0;
      }
diff --git a/meta/recipes-devtools/python/python3_3.5.2.bb b/meta/recipes-devtools/python/python3_3.5.3.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3_3.5.2.bb
rename to meta/recipes-devtools/python/python3_3.5.3.bb
index 2ff7c9e2780..79c2c519ff7 100644
--- a/meta/recipes-devtools/python/python3_3.5.2.bb
+++ b/meta/recipes-devtools/python/python3_3.5.3.bb
@@ -8,7 +8,7 @@ DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 file://python-config.patch \
-file://000-cross-compile.patch \
+file://0001-cross-compile-support.patch \
 file://030-fixup-include-dirs.patch \
 file://070-dont-clean-ipkg-install.patch \
 file://080-distutils-dont_adjust_files.patch \
@@ -35,13 +35,12 @@ SRC_URI += "\
             file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
             file://setup.py-find-libraries-in-staging-dirs.patch \
             file://configure.ac-fix-LIBPL.patch \
-            file://python3-fix-CVE-2016-1000110.patch \
             file://upstream-random-fixes.patch \
            "
-SRC_URI[md5sum] = "8906efbacfcdc7c3c9198aeefafd159e"
-SRC_URI[sha256sum] = "0010f56100b9b74259ebcd5d4b295a32324b58b517403a10d1a2aa7cb22bca40"
+SRC_URI[md5sum] = "57d1f8bfbabf4f2500273fb0706e6f21"
+SRC_URI[sha256sum] = "eefe2ad6575855423ab630f5b51a8ef6e5556f774584c06beab4926f930ddbb0"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6b60258130e4ed10d3101517eb5b9385"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b680ed99aa60d350c65a65914494207e"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.11.0


