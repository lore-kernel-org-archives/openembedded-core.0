Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E108B65D59
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 07:11:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0J7BWmT002737
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Jan 2015 23:11:32 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 18 Jan 2015 23:11:32 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 18 Jan 2015 23:11:29 -0800
Message-ID: <3cfd8f83d4ff3e11f5634581fb5de4725e36db53.1421651378.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421651378.git.liezhi.yang@windriver.com>
References: <cover.1421651378.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] python3: fix for cross compiling
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
X-List-Received-Date: Mon, 19 Jan 2015 07:11:35 -0000
Content-Type: text/plain

Fixed:
* python3 has introduced _PYTHON_PROJECT_BASE which is used for separate
  B and S, but it doesn't work when compile Modules, the target python3 runs
  python3-native's sysconfig to get srcdir which is the native's, there
  would be errors when native's srcdir has been removed, add
  _PYTHON_PROJECT_SRC to fix the problem.

* Check cross_compiling when get FLAGS

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../python/python3-native_3.3.3.bb                 |    2 +
 ...p.py-check-cross_compiling-when-get-FLAGS.patch |   50 ++++++++++++++++++
 .../sysconfig.py-add-_PYTHON_PROJECT_SRC.patch     |   54 ++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.3.3.bb      |   10 ++--
 4 files changed, 112 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/setup.py-check-cross_compiling-when-get-FLAGS.patch
 create mode 100644 meta/recipes-devtools/python/python3/sysconfig.py-add-_PYTHON_PROJECT_SRC.patch

diff --git a/meta/recipes-devtools/python/python3-native_3.3.3.bb b/meta/recipes-devtools/python/python3-native_3.3.3.bb
index 9ae2a0b..73ce095 100644
--- a/meta/recipes-devtools/python/python3-native_3.3.3.bb
+++ b/meta/recipes-devtools/python/python3-native_3.3.3.bb
@@ -27,6 +27,8 @@ file://fix-ast.h-dependency.patch \
 file://makerace.patch \
 ${DISTRO_SRC_URI} \
 file://python3-fix-build-error-with-Readline-6.3.patch \
+file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
+file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
 "
 SRC_URI[md5sum] = "f3ebe34d4d8695bf889279b54673e10c"
 SRC_URI[sha256sum] = "e526e9b612f623888364d30cc9f3dfc34dcef39065c713bdbcddf47df84d8dcb"
diff --git a/meta/recipes-devtools/python/python3/setup.py-check-cross_compiling-when-get-FLAGS.patch b/meta/recipes-devtools/python/python3/setup.py-check-cross_compiling-when-get-FLAGS.patch
new file mode 100644
index 0000000..fc2e12d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/setup.py-check-cross_compiling-when-get-FLAGS.patch
@@ -0,0 +1,50 @@
+From 8dad810f3a3d073f09ad72e1a3ee0a895eab2ca1 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sun, 18 Jan 2015 19:05:36 -0800
+Subject: [PATCH] setup.py:check cross_compiling when get FLAGS
+
+Fixed when compile target pythnon3:
+gcc -isystem/path/to/sysroots/x86_64-linux/usr/include \
+    -L=/path/to/sysroots/x86_64-linux/usr/lib
+
+This is incorrect, the native sysroot should not be used by target
+python3.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ setup.py |   10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index e8339cd..83fd31f 100644
+--- a/setup.py
++++ b/setup.py
+@@ -238,7 +238,10 @@ class PyBuildExt(build_ext):
+         # unfortunately, distutils doesn't let us provide separate C and C++
+         # compilers
+         if compiler is not None:
+-            (ccshared,cflags) = sysconfig.get_config_vars('CCSHARED','CFLAGS')
++            if cross_compiling:
++                (ccshared,cflags) = (os.environ.get('CCSHARED') or '', os.environ.get('CFLAGS') or '')
++            else:
++                (ccshared,cflags) = sysconfig.get_config_vars('CCSHARED','CFLAGS')
+             args['compiler_so'] = compiler + ' ' + ccshared + ' ' + cflags
+         self.compiler.set_executables(**args)
+ 
+@@ -457,7 +460,10 @@ class PyBuildExt(build_ext):
+                 ('LDFLAGS', '-R', self.compiler.runtime_library_dirs),
+                 ('LDFLAGS', '-L', self.compiler.library_dirs),
+                 ('CPPFLAGS', '-I', self.compiler.include_dirs)):
+-            env_val = sysconfig.get_config_var(env_var)
++            if cross_compiling:
++                env_val = os.environ.get(env_var)
++            else:
++                env_val = sysconfig.get_config_var(env_var)
+             if env_val:
+                 # To prevent optparse from raising an exception about any
+                 # options in env_val that it doesn't know about we strip out
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/python/python3/sysconfig.py-add-_PYTHON_PROJECT_SRC.patch b/meta/recipes-devtools/python/python3/sysconfig.py-add-_PYTHON_PROJECT_SRC.patch
new file mode 100644
index 0000000..de07643
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/sysconfig.py-add-_PYTHON_PROJECT_SRC.patch
@@ -0,0 +1,54 @@
+From fc93b3cc23b4f9698ae92a42986dbb02b6f19588 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sun, 18 Jan 2015 06:29:50 -0800
+Subject: [PATCH] sysconfig.py: add _PYTHON_PROJECT_SRC
+
+python3 has introduced _PYTHON_PROJECT_BASE which is used for separate B
+and S, but it doesn't work when compile Modules, the target python3 runs
+python3-native's sysconfig to get srcdir which is the native's, there
+would be errors when native's srcdir has been removed, add
+_PYTHON_PROJECT_SRC to fix the problem.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Lib/distutils/sysconfig.py |    5 ++++-
+ Lib/sysconfig.py           |    5 ++++-
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
+index a545ab9..74317d1 100644
+--- a/Lib/distutils/sysconfig.py
++++ b/Lib/distutils/sysconfig.py
+@@ -554,7 +554,10 @@ def get_config_vars(*args):
+         _config_vars['exec_prefix'] = EXEC_PREFIX
+ 
+         # Always convert srcdir to an absolute path
+-        srcdir = _config_vars.get('srcdir', project_base)
++        if "_PYTHON_PROJECT_SRC" in os.environ:
++            srcdir = os.path.abspath(os.environ["_PYTHON_PROJECT_SRC"])
++        else:
++            srcdir = _config_vars.get('srcdir', project_base)
+         if os.name == 'posix':
+             if python_build:
+                 # If srcdir is a relative path (typically '.' or '..')
+diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
+index 7287f11..cc92998 100644
+--- a/Lib/sysconfig.py
++++ b/Lib/sysconfig.py
+@@ -562,7 +562,10 @@ def get_config_vars(*args):
+         _CONFIG_VARS['userbase'] = _getuserbase()
+ 
+         # Always convert srcdir to an absolute path
+-        srcdir = _CONFIG_VARS.get('srcdir', _PROJECT_BASE)
++        if "_PYTHON_PROJECT_SRC" in os.environ:
++            srcdir = os.path.abspath(os.environ["_PYTHON_PROJECT_SRC"])
++        else:
++            srcdir = _CONFIG_VARS.get('srcdir', _PROJECT_BASE)
+         if os.name == 'posix':
+             if _PYTHON_BUILD:
+                 # If srcdir is a relative path (typically '.' or '..')
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/python/python3_3.3.3.bb b/meta/recipes-devtools/python/python3_3.3.3.bb
index efa98c0..6147408 100644
--- a/meta/recipes-devtools/python/python3_3.3.3.bb
+++ b/meta/recipes-devtools/python/python3_3.3.3.bb
@@ -39,6 +39,8 @@ SRC_URI += "\
             file://avoid-ncursesw-include-path.patch \
             file://python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
             file://python3-setup.py-no-host-headers-libs.patch \
+            file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
+            file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
            "
 SRC_URI[md5sum] = "f3ebe34d4d8695bf889279b54673e10c"
 SRC_URI[sha256sum] = "e526e9b612f623888364d30cc9f3dfc34dcef39065c713bdbcddf47df84d8dcb"
@@ -66,6 +68,10 @@ TARGET_CC_ARCH += "-DNDEBUG -fno-inline"
 EXTRA_OEMAKE += "CROSS_COMPILE=yes"
 EXTRA_OECONF += "CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/"
 
+export CROSS_COMPILE = "${TARGET_PREFIX}"
+export _PYTHON_PROJECT_BASE = "${B}"
+export _PYTHON_PROJECT_SRC = "${S}"
+
 # No ctypes option for python 3
 PYTHONLSBOPTS = ""
 
@@ -107,8 +113,6 @@ do_compile() {
 	# then call do_install twice we get Makefile.orig == Makefile.sysroot
 	install -m 0644 Makefile Makefile.sysroot
 
-	export CROSS_COMPILE="${TARGET_PREFIX}"
-	export PYTHONBUILDDIR="${B}"
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
@@ -135,8 +139,6 @@ do_install() {
 	# go to ${D}${STAGING...}/...
 	install -m 0644 Makefile.orig Makefile
 
-	export CROSS_COMPILE="${TARGET_PREFIX}"
-	export PYTHONBUILDDIR="${B}"
 	install -d ${D}${libdir}/pkgconfig
 	install -d ${D}${libdir}/python${PYTHON_MAJMIN}/config
 
-- 
1.7.9.5


