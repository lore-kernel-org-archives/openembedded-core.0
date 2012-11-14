Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TYeDW-0005gK-91 for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 15:45:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAEEVVSE020594
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 14:31:31 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20196-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 14:31:27 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAEEVND7020588
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 14:31:24 GMT
Message-ID: <1352903484.13332.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Nov 2012 14:31:24 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] python: Resolve intermediate staging issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2012 14:45:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Its bad practise to poke into the sysroot without knowledge of sstate.

This adds a patch to python allowing us to account for cross compiling
and allow it to find the Makefile/pyconfig.h files without needing them 
in the sysroot for do_compile/do_install to complete.

Tested on two architectures and compared with buildhistory with no 
significant delta.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/python/python-native_2.7.3.bb b/meta/recipes-devtools/python/python-native_2.7.3.bb
index d450949..b0b3503 100644
--- a/meta/recipes-devtools/python/python-native_2.7.3.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.3.bb
@@ -15,6 +15,7 @@ SRC_URI += "file://04-default-is-optimized.patch \
            file://nohostlibs.patch \
            file://multilib.patch \
            file://add-md5module-support.patch \
+           file://builddir.patch \
            "
 S = "${WORKDIR}/Python-${PV}"
 
diff --git a/meta/recipes-devtools/python/python/builddir.patch b/meta/recipes-devtools/python/python/builddir.patch
new file mode 100644
index 0000000..930170b
--- /dev/null
+++ b/meta/recipes-devtools/python/python/builddir.patch
@@ -0,0 +1,55 @@
+When cross compiling python, we used to need to install the Makefile, pyconfig.h 
+and the python library to their final location before being able to compile the 
+rest of python. This change allows us to point python at its own source when
+building, avoiding a variety of sysroot staging issues and simplifying the main
+python recipe.
+
+Upstream-Status: Inappropriate
+RP 2012/11/13
+
+Index: Python-2.7.3/Lib/sysconfig.py
+===================================================================
+--- Python-2.7.3.orig/Lib/sysconfig.py	2012-11-13 14:36:08.429167199 +0000
++++ Python-2.7.3/Lib/sysconfig.py	2012-11-13 21:58:31.788551800 +0000
+@@ -93,6 +93,7 @@
+ _EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
+ _CONFIG_VARS = None
+ _USER_BASE = None
++_PYTHONBUILDDIR = os.environ.get("PYTHONBUILDDIR", None)
+ 
+ def _safe_realpath(path):
+     try:
+@@ -100,7 +102,9 @@
+     except OSError:
+         return path
+ 
+-if sys.executable:
++if _PYTHONBUILDDIR:
++    _PROJECT_BASE = _PYTHONBUILDDIR
++elif sys.executable:
+     _PROJECT_BASE = os.path.dirname(_safe_realpath(sys.executable))
+ else:
+     # sys.executable can be empty if argv[0] has been changed and Python is
+Index: Python-2.7.3/Lib/distutils/sysconfig.py
+===================================================================
+--- Python-2.7.3.orig/Lib/distutils/sysconfig.py	2012-11-13 14:36:08.005167209 +0000
++++ Python-2.7.3/Lib/distutils/sysconfig.py	2012-11-13 22:07:05.644540695 +0000
+@@ -26,6 +26,9 @@
+ # live in project/PCBuild9.  If we're dealing with an x64 Windows build,
+ # it'll live in project/PCbuild/amd64.
+ project_base = os.path.dirname(os.path.abspath(sys.executable))
++_PYTHONBUILDDIR = os.environ.get("PYTHONBUILDDIR", None)
++if _PYTHONBUILDDIR:
++    project_base = _PYTHONBUILDDIR
+ if os.name == "nt" and "pcbuild" in project_base[-8:].lower():
+     project_base = os.path.abspath(os.path.join(project_base, os.path.pardir))
+ # PC/VS7.1
+@@ -247,7 +250,7 @@
+ def get_makefile_filename():
+     """Return full pathname of installed Makefile from the Python build."""
+     if python_build:
+-        return os.path.join(os.path.dirname(sys.executable), "Makefile")
++        return os.path.join(project_base, "Makefile")
+     lib_dir = get_python_lib(plat_specific=1, standard_lib=1)
+     return os.path.join(lib_dir, "config", "Makefile")
+ 
diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index 3a17c85..f0d5c90 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -27,6 +27,7 @@ SRC_URI += "\
   file://avoid_warning_for_sunos_specific_module.patch \
   file://python-2.7.3-berkeley-db-5.3.patch \
   file://python-2.7.3-remove-bsdb-rpath.patch \
+  file://builddir.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
@@ -55,17 +56,6 @@ do_compile() {
         sed -e 's,${STAGING_DIR_HOST},,g' -i *.py
         cd -
 
-	#
-	# Copy config.h and an appropriate Makefile for distutils.sysconfig,
-	# which laters uses the information out of these to compile extensions
-	#
-	# The following part (until python compilation) should probably moved to an
-	# -initial recipe to handle staging better
-	#
-	install -d ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
-	install -d ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
-	install -m 0644 pyconfig.h ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
-
 	# remove hardcoded ccache, see http://bugs.openembedded.net/show_bug.cgi?id=4144
 	sed -i -e s,ccache,'$(CCACHE)', Makefile
 
@@ -83,22 +73,12 @@ do_compile() {
 		-e 's,^INCLUDEDIR=.*,INCLUDE=${STAGING_INCDIR},g' \
 		-e 's,^CONFINCLUDEDIR=.*,CONFINCLUDE=${STAGING_INCDIR},g' \
 		Makefile
-	install -m 0644 Makefile ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
 	# save copy of it now, because if we do it in do_install and 
 	# then call do_install twice we get Makefile.orig == Makefile.sysroot
 	install -m 0644 Makefile Makefile.sysroot
 
 	export CROSS_COMPILE="${TARGET_PREFIX}"
-
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python-native/pgen \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native/python \
-		STAGING_LIBDIR=${STAGING_LIBDIR} \
-		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
-		STAGING_INCDIR=${STAGING_INCDIR} \
-		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-		OPT="${CFLAGS}" libpython${PYTHON_MAJMIN}.so
-
-	oe_libinstall -so libpython${PYTHON_MAJMIN} ${STAGING_LIBDIR}
+	export PYTHONBUILDDIR="${S}"
 
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python-native/pgen \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native/python \
@@ -115,6 +95,7 @@ do_install() {
 	install -m 0644 Makefile.orig Makefile
 
 	export CROSS_COMPILE="${TARGET_PREFIX}"
+	export PYTHONBUILDDIR="${S}"
 	
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python-native/pgen \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native/python \




