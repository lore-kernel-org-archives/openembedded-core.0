Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5E3BA716CE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 21:52:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 20 Feb 2015 13:48:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,617,1418112000"; d="scan'208";a="669289535"
Received: from unknown (HELO aehernan-DevStation.zpn.intel.com)
	([10.219.4.152])
	by fmsmga001.fm.intel.com with ESMTP; 20 Feb 2015 13:52:30 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Feb 2015 15:52:28 -0600
Message-Id: <d610b534c39cdb575b6343f43cf6a0d4bf9d1fcf.1424468668.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1424468668.git.alejandro.hernandez@linux.intel.com>
References: <cover.1424468668.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] python-native: Reverts usage of distutils.sysconfig
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
X-List-Received-Date: Fri, 20 Feb 2015 21:52:31 -0000

 On older versions of Python, sysconfig read the Makefile and Python.h, generated
 at build time now it uses _sysconfigdata which contains information about the
 HOST, erroneous in our case, this causes an error when bulding something
 using distutils since it obtains compiler information and such.

Also fixes configuration of _ctypes/libffi

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../revert_use_of_sysconfigdata.patch              | 86 ++++++++++++++++++++++
 .../recipes-devtools/python/python-native_2.7.9.bb | 25 ++++---
 2 files changed, 99 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-native/revert_use_of_sysconfigdata.patch

diff --git a/meta/recipes-devtools/python/python-native/revert_use_of_sysconfigdata.patch b/meta/recipes-devtools/python/python-native/revert_use_of_sysconfigdata.patch
new file mode 100644
index 0000000..202aaf1
--- /dev/null
+++ b/meta/recipes-devtools/python/python-native/revert_use_of_sysconfigdata.patch
@@ -0,0 +1,86 @@
+On older versions of Python, sysconfig read the data from both the Makefile and
+the Python.h file generated at build time, created dictionaries with their variables
+and used those when using get_config_var(), now it uses _sysconfigdata.build_time_vars[]
+which contains information from the HOST, erroneous in our case, this patch reverts this
+behavior and uses Python.h and Makefile to get information.
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
+
+Index: Python-2.7.9/Lib/distutils/sysconfig.py
+===================================================================
+--- Python-2.7.9.orig/Lib/distutils/sysconfig.py
++++ Python-2.7.9/Lib/distutils/sysconfig.py
+@@ -401,12 +401,66 @@ _config_vars = None
+ 
+ def _init_posix():
+     """Initialize the module as appropriate for POSIX systems."""
+-    # _sysconfigdata is generated at build time, see the sysconfig module
+-    from _sysconfigdata import build_time_vars
+-    global _config_vars
+-    _config_vars = {}
+-    _config_vars.update(build_time_vars)
++    g = {}
++    # load the installed Makefile:
++    try:
++        filename = get_makefile_filename()
++        parse_makefile(filename, g)
++    except IOError, msg:
++        my_msg = "invalid Python installation: unable to open %s" % filename
++        if hasattr(msg, "strerror"):
++            my_msg = my_msg + " (%s)" % msg.strerror
++
++        raise DistutilsPlatformError(my_msg)
++
++    # load the installed pyconfig.h:
++    try:
++        filename = get_config_h_filename()
++        parse_config_h(file(filename), g)
++    except IOError, msg:
++        my_msg = "invalid Python installation: unable to open %s" % filename
++        if hasattr(msg, "strerror"):
++            my_msg = my_msg + " (%s)" % msg.strerror
++
++        raise DistutilsPlatformError(my_msg)
++
++    # On AIX, there are wrong paths to the linker scripts in the Makefile
++    # -- these paths are relative to the Python source, but when installed
++    # the scripts are in another directory.
++    if python_build:
++        g['LDSHARED'] = g['BLDSHARED']
+ 
++    elif get_python_version() < '2.1':
++        # The following two branches are for 1.5.2 compatibility.
++        if sys.platform == 'aix4':          # what about AIX 3.x ?
++            # Linker script is in the config directory, not in Modules as the
++            # Makefile says.
++            python_lib = get_python_lib(standard_lib=1)
++            ld_so_aix = os.path.join(python_lib, 'config', 'ld_so_aix')
++            python_exp = os.path.join(python_lib, 'config', 'python.exp')
++
++            g['LDSHARED'] = "%s %s -bI:%s" % (ld_so_aix, g['CC'], python_exp)
++
++        elif sys.platform == 'beos':
++            # Linker script is in the config directory.  In the Makefile it is
++            # relative to the srcdir, which after installation no longer makes
++            # sense.
++            python_lib = get_python_lib(standard_lib=1)
++            linkerscript_path = string.split(g['LDSHARED'])[0]
++            linkerscript_name = os.path.basename(linkerscript_path)
++            linkerscript = os.path.join(python_lib, 'config',
++                                        linkerscript_name)
++
++            # XXX this isn't the right place to do this: adding the Python
++            # library to the link, if needed, should be in the "build_ext"
++            # command.  (It's also needed for non-MS compilers on Windows, and
++            # it's taken care of for them by the 'build_ext.get_libraries()'
++            # method.)
++            g['LDSHARED'] = ("%s -L%s/lib -lpython%s" %
++                             (linkerscript, PREFIX, get_python_version()))
++
++    global _config_vars
++    _config_vars = g
+ 
+ def _init_nt():
+     """Initialize the module as appropriate for NT"""
diff --git a/meta/recipes-devtools/python/python-native_2.7.9.bb b/meta/recipes-devtools/python/python-native_2.7.9.bb
index dfde361..d964ab8 100644
--- a/meta/recipes-devtools/python/python-native_2.7.9.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.9.bb
@@ -5,17 +5,18 @@ DEPENDS = "openssl-native bzip2-replacement-native zlib-native readline-native s
 PR = "${INC_PR}.1"
 
 SRC_URI += "\
-           file://05-enable-ctypes-cross-build.patch \
-           file://10-distutils-fix-swig-parameter.patch \
-           file://11-distutils-never-modify-shebang-line.patch \
-           file://12-distutils-prefix-is-inside-staging-area.patch \
-           file://debug.patch \
-           file://unixccompiler.patch \
-           file://nohostlibs.patch \
-           file://multilib.patch \
-           file://add-md5module-support.patch \
-           file://builddir.patch \
-           file://parallel-makeinst-create-bindir.patch \
+            file://05-enable-ctypes-cross-build.patch \
+            file://10-distutils-fix-swig-parameter.patch \
+            file://11-distutils-never-modify-shebang-line.patch \
+            file://12-distutils-prefix-is-inside-staging-area.patch \
+            file://debug.patch \
+            file://unixccompiler.patch \
+            file://nohostlibs2.patch \
+            file://multilib.patch \
+            file://add-md5module-support.patch \
+            file://builddir.patch \
+            file://parallel-makeinst-create-bindir.patch \
+            file://revert_use_of_sysconfigdata.patch \
            "
 S = "${WORKDIR}/Python-${PV}"
 
@@ -36,7 +37,7 @@ EXTRA_OEMAKE = '\
 '
 
 do_configure_prepend() {
-	autoreconf --verbose --install --force --exclude=autopoint Modules/_ctypes/libffi || bbnote "_ctypes failed to autoreconf"
+	autoreconf --verbose --install --force --exclude=autopoint ../Python-${PV}/Modules/_ctypes/libffi
 }
 
 do_install() {
-- 
1.9.1


