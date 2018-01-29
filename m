Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 021B67878B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 21:49:24 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id t134so7556418qke.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 13:49:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=G81/CDuiH2Bdp33ckIc2zqA3bppXEaA6mSmOH6Rkp4M=;
	b=F+d/ePlJsF23rDaCD3o64SpLNvp1Qt+YbXDtgWEBAzh1wqHMFSnaZNgcYZt7oM9v3U
	G4i/5NMYRgxfKSF6yENMDFCmyaTG1r4d0DctuDNBDoaPk/L2RbV4Uoe+/rFrnlNelFyp
	QsTc+n2LxaC2EO2xb1xtZJTmkdSMLC9h0ZTpmkXvulF/6e365cAa87Tj7mjHHkG8vxTk
	zL9+ZRC6g98YFjzngRqrFOwtG3rSoqw5mFUPocTzwFAlGX/G/o+cOJIdUascgcqc5k9k
	Pf6yPAGO+n0h+JhSqa31tkwG2beA6Y9aVHb7j9Du2B8lBU6lrsazm1LLTbGr6ds7uLkA
	RzoQ==
X-Gm-Message-State: AKwxyteYmxbmbe6t+zrcsMAODUzDJWmGe/HKSPkgotdI4D8xJ8K8IoBx
	7anUdvu6jrrMRlpC9apEzWOpgteP
X-Google-Smtp-Source: AH8x224OmQcirFPxnr4CCDuzYzRxpG7W70OswY8Yo21HEIdDhEgDmZkwBwlnx6IevniYc/Oubb5TJQ==
X-Received: by 10.55.12.4 with SMTP id 4mr38981982qkm.158.1517262565113;
	Mon, 29 Jan 2018 13:49:25 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	u1sm10892832qtb.44.2018.01.29.13.49.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 Jan 2018 13:49:24 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 16:49:01 -0500
Message-Id: <1517262541-8719-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] python: Upgrade both python and python-native to 2.7.14
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
X-List-Received-Date: Mon, 29 Jan 2018 21:49:25 -0000

Rebased:
  - python/01-use-proper-tools-for-cross-build.patch
  - python/fix-makefile-for-ptest.patch
  - python/parallel-makeinst-create-bindir.patch

Removed Upstreamed Patch:
  - python/Don-t-use-getentropy-on-Linux.patch

Updated license checksum for changes in the copyright date.  The license
terms remain unchanged

Added an extra do_compile item to create the native pgen that no longer
gets compiled by default

Update the json manifest with the latest dependency set

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...on-native_2.7.13.bb => python-native_2.7.14.bb} |  6 ++++
 meta/recipes-devtools/python/python.inc            |  6 ++--
 .../01-use-proper-tools-for-cross-build.patch      | 17 +++++----
 .../python/Don-t-use-getentropy-on-Linux.patch     | 41 ----------------------
 .../python/python/fix-makefile-for-ptest.patch     |  6 ++--
 .../python/parallel-makeinst-create-bindir.patch   | 12 +++----
 .../python/python/python2-manifest.json            |  8 +++--
 .../python/{python_2.7.13.bb => python_2.7.14.bb}  |  1 -
 8 files changed, 34 insertions(+), 63 deletions(-)
 rename meta/recipes-devtools/python/{python-native_2.7.13.bb => python-native_2.7.14.bb} (94%)
 delete mode 100644 meta/recipes-devtools/python/python/Don-t-use-getentropy-on-Linux.patch
 rename meta/recipes-devtools/python/{python_2.7.13.bb => python_2.7.14.bb} (99%)

diff --git a/meta/recipes-devtools/python/python-native_2.7.13.bb b/meta/recipes-devtools/python/python-native_2.7.14.bb
similarity index 94%
rename from meta/recipes-devtools/python/python-native_2.7.13.bb
rename to meta/recipes-devtools/python/python-native_2.7.14.bb
index 2b74003..622cb38 100644
--- a/meta/recipes-devtools/python/python-native_2.7.13.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.14.bb
@@ -36,6 +36,12 @@ do_configure_append() {
 	autoreconf --verbose --install --force --exclude=autopoint ../Python-${PV}/Modules/_ctypes/libffi
 }
 
+# Regenerate all of the generated files
+# This ensures that pgen and friends get created during the compile phase
+do_compile_prepend() {
+    oe_runmake regen-all
+}
+
 do_install() {
 	oe_runmake 'DESTDIR=${D}' install
 	install -d ${D}${bindir}/${PN}
diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index b40f551..979b601 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -5,12 +5,12 @@ SECTION = "devel/python"
 # bump this on every change in contrib/python/generate-manifest-2.7.py
 INC_PR = "r1"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6b60258130e4ed10d3101517eb5b9385"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f741e51de91d4eeea5930b9c3c7fa69d"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "53b43534153bb2a0363f08bae8b9d990"
-SRC_URI[sha256sum] = "35d543986882f78261f97787fd3e06274bfa6df29fac9b4a94f73930ff98f731"
+SRC_URI[md5sum] = "1f6db41ad91d9eb0a6f0c769b8613c5b"
+SRC_URI[sha256sum] = "71ffb26e09e78650e424929b2b457b9c912ac216576e6bd9e7d204ed03296a66"
 
 # python recipe is actually python 2.x
 # also, exclude pre-releases for both python 2.x and 3.x
diff --git a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
index 366ce3e..e795a74 100644
--- a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
+++ b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
@@ -9,6 +9,9 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 Rebased for python-2.7.9
 Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
+Rebased for python-2.7.14
+Signed-off-by: Derek Straka <derek@asterius.io>
+
 Index: Python-2.7.13/Makefile.pre.in
 ===================================================================
 --- Python-2.7.13.orig/Makefile.pre.in
@@ -30,14 +33,14 @@ Index: Python-2.7.13/Makefile.pre.in
  
  # Create build directory and generate the sysconfig build-time data there.
  # pybuilddir.txt contains the name of the build dir and is used for
-@@ -681,7 +682,7 @@ Modules/pwdmodule.o: $(srcdir)/Modules/p
- 
- $(GRAMMAR_H): @GENERATED_COMMENT@ $(GRAMMAR_INPUT) $(PGEN)
+@@ -663,7 +663,7 @@
+ 	# Regenerate Include/graminit.h and Python/graminit.c
+ 	# from Grammar/Grammar using pgen
  	@$(MKDIR_P) Include
--	$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
-+	$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
- $(GRAMMAR_C): @GENERATED_COMMENT@ $(GRAMMAR_H)
- 	touch $(GRAMMAR_C)
+-	$(PGEN) $(srcdir)/Grammar/Grammar \
++	$(HOSTPGEN) $(srcdir)/Grammar/Grammar \
+ 		$(srcdir)/Include/graminit.h \
+ 		$(srcdir)/Python/graminit.c
  
 @@ -1121,27 +1122,27 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
diff --git a/meta/recipes-devtools/python/python/Don-t-use-getentropy-on-Linux.patch b/meta/recipes-devtools/python/python/Don-t-use-getentropy-on-Linux.patch
deleted file mode 100644
index 38e5377..0000000
--- a/meta/recipes-devtools/python/python/Don-t-use-getentropy-on-Linux.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
-
-From 905d1b30ac7cb0e31c57cec0533825c8f170b942 Mon Sep 17 00:00:00 2001
-From: Victor Stinner <victor.stinner@gmail.com>
-Date: Mon, 9 Jan 2017 11:10:41 +0100
-Subject: [PATCH] Don't use getentropy() on Linux
-
-Issue #29188: Support glibc 2.24 on Linux: don't use getentropy() function but
-read from /dev/urandom to get random bytes, for example in os.urandom().  On
-Linux, getentropy() is implemented which getrandom() is blocking mode, whereas
-os.urandom() should not block.
-
-(cherry picked from commit 2687486756721e39164fa9f597e468c35d495227)
----
- Python/random.c | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/Python/random.c b/Python/random.c
-index b4bc1f3..f3f5d14 100644
---- a/Python/random.c
-+++ b/Python/random.c
-@@ -94,8 +94,15 @@ win32_urandom(unsigned char *buffer, Py_ssize_t size, int raise)
- }
- 
- /* Issue #25003: Don't use getentropy() on Solaris (available since
-- * Solaris 11.3), it is blocking whereas os.urandom() should not block. */
--#elif defined(HAVE_GETENTROPY) && !defined(sun)
-+   Solaris 11.3), it is blocking whereas os.urandom() should not block.
-+
-+   Issue #29188: Don't use getentropy() on Linux since the glibc 2.24
-+   implements it with the getrandom() syscall which can fail with ENOSYS,
-+   and this error is not supported in py_getentropy() and getrandom() is called
-+   with flags=0 which blocks until system urandom is initialized, which is not
-+   the desired behaviour to seed the Python hash secret nor for os.urandom():
-+   see the PEP 524 which was only implemented in Python 3.6. */
-+#elif defined(HAVE_GETENTROPY) && !defined(sun) && !defined(linux)
- #define PY_GETENTROPY 1
- 
- /* Fill buffer with size pseudo-random bytes generated by getentropy().
diff --git a/meta/recipes-devtools/python/python/fix-makefile-for-ptest.patch b/meta/recipes-devtools/python/python/fix-makefile-for-ptest.patch
index 669112d..90dcd57 100644
--- a/meta/recipes-devtools/python/python/fix-makefile-for-ptest.patch
+++ b/meta/recipes-devtools/python/python/fix-makefile-for-ptest.patch
@@ -15,7 +15,7 @@ diff -ruN a/Makefile.pre.in b/Makefile.pre.in
 +TESTOPTS=	-l -v $(EXTRATESTOPTS)
  TESTPROG=	$(srcdir)/Lib/test/regrtest.py
 -TESTPYTHON=	$(RUNSHARED) ./$(BUILDPYTHON) -Wd -3 -E -tt $(TESTPYTHONOPTS)
--test:		all platform
+-test:		@DEF_MAKE_RULE@ platform
 -		-find $(srcdir)/Lib -name '*.py[co]' -print | xargs rm -f
 +TESTPYTHON=	$(RUNSHARED) $(BUILDPYTHON) -Wd -3 -E -tt $(TESTPYTHONOPTS)
 +test:		build-test
@@ -26,8 +26,8 @@ diff -ruN a/Makefile.pre.in b/Makefile.pre.in
  		-$(TESTPYTHON) $(TESTPROG) $(TESTOPTS)
  		$(TESTPYTHON) $(TESTPROG) $(TESTOPTS)
  
-+build-test:	all platform
++build-test:	@DEF_MAKE_RULE@ platform
 +
- testall:	all platform
+ testall:	@DEF_MAKE_RULE@ platform
  		-find $(srcdir)/Lib -name '*.py[co]' -print | xargs rm -f
  		$(TESTPYTHON) $(srcdir)/Lib/compileall.py
diff --git a/meta/recipes-devtools/python/python/parallel-makeinst-create-bindir.patch b/meta/recipes-devtools/python/python/parallel-makeinst-create-bindir.patch
index 951cb46..abab41e 100644
--- a/meta/recipes-devtools/python/python/parallel-makeinst-create-bindir.patch
+++ b/meta/recipes-devtools/python/python/parallel-makeinst-create-bindir.patch
@@ -8,12 +8,12 @@ Upstream-Status: Pending
 
 --- Python-2.7.3.orig/Makefile.pre.in
 +++ Python-2.7.3/Makefile.pre.in
-@@ -1008,7 +1008,7 @@ LIBPL=		$(LIBP)/config
+@@ -1187,7 +1187,7 @@
  LIBPC=		$(LIBDIR)/pkgconfig
-
- libainstall:	all python-config
+ 
+ libainstall:	@DEF_MAKE_RULE@ python-config
 -	@for i in $(LIBDIR) $(LIBP) $(LIBPL) $(LIBPC); \
 +	@for i in $(LIBDIR) $(LIBP) $(LIBPL) $(LIBPC) $(BINDIR); \
-	do \
-		if test ! -d $(DESTDIR)$$i; then \
-			echo "Creating directory $$i"; \
+ 	do \
+ 		if test ! -d $(DESTDIR)$$i; then \
+ 			echo "Creating directory $$i"; \
diff --git a/meta/recipes-devtools/python/python/python2-manifest.json b/meta/recipes-devtools/python/python/python2-manifest.json
index 03d4bbd..723e513 100644
--- a/meta/recipes-devtools/python/python/python2-manifest.json
+++ b/meta/recipes-devtools/python/python/python2-manifest.json
@@ -680,6 +680,7 @@
             "${libdir}/python2.7/cgi.py"
         ],
         "rdepends": [
+            "compression",
             "contextlib",
             "core",
             "crypt",
@@ -692,7 +693,8 @@
             "shell",
             "textutils",
             "threading",
-            "unixadmin"
+            "unixadmin",
+            "zlib"
         ],
         "summary": "Python Internet Protocol servers"
     },
@@ -838,9 +840,11 @@
             "${libdir}/python2.7/shutil.py"
         ],
         "rdepends": [
+            "compression",
             "core",
             "io",
-            "unixadmin"
+            "unixadmin",
+            "zlib"
         ],
         "summary": "Python shell-like functionality"
     },
diff --git a/meta/recipes-devtools/python/python_2.7.13.bb b/meta/recipes-devtools/python/python_2.7.14.bb
similarity index 99%
rename from meta/recipes-devtools/python/python_2.7.13.bb
rename to meta/recipes-devtools/python/python_2.7.14.bb
index dbafb95..13455ff 100644
--- a/meta/recipes-devtools/python/python_2.7.13.bb
+++ b/meta/recipes-devtools/python/python_2.7.14.bb
@@ -28,7 +28,6 @@ SRC_URI += "\
   file://parallel-makeinst-create-bindir.patch \
   file://use_sysroot_ncurses_instead_of_host.patch \
   file://add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
-  file://Don-t-use-getentropy-on-Linux.patch \
   file://pass-missing-libraries-to-Extension-for-mul.patch \
   file://support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch \
 "
-- 
2.7.4


