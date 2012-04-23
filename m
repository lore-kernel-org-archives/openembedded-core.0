Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SMRFB-0000dZ-MF for openembedded-core@lists.openembedded.org;
	Mon, 23 Apr 2012 23:56:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3NLkqFw026481
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2012 22:46:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25646-08 for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2012 22:46:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3NLkgIt026475
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2012 22:46:43 +0100
Message-ID: <1335217602.12692.85.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Apr 2012 22:46:42 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] python: Fix various contamination issues leading to broken/missing c modules
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
X-List-Received-Date: Mon, 23 Apr 2012 21:56:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The move of libcrypto to /lib instead of /usr/lib has broken the _hashlib module
compilation. There were also a number of other failing modules which should
have been building correctly. This turned out partly to be the /lib issue
but also due to a number of native paths creeping into compiler commandlines.

These changes add in /lib as part of the searh directory and remove
a number of host contamination issues within setup.py. Post release we
should really further go through this file and just delete large sections
of it as its hard to be sure what strange paths python is injecting as
search paths.

This patch also fixes issues where re-execution of the compile task
would corrupt the Makefile in various ways, again leading to puzzling
paths within the configuration.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
index 27afc03..691bead 100644
--- a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
+++ b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
@@ -119,8 +119,8 @@ Index: Python-2.7.2/setup.py
  
          # XXX Omitted modules: gl, pure, dl, SGI-specific modules
  
-+        lib_dirs = [ os.getenv( "STAGING_LIBDIR" ) ]
-+        inc_dirs = [ os.getenv( "STAGING_INCDIR" ) ]
++        lib_dirs = [ os.getenv("STAGING_LIBDIR"),  os.getenv("STAGING_BASELIBDIR") ]
++        inc_dirs = [ os.getenv("STAGING_INCDIR") ]
 +
          #
          # The following modules are all pretty straightforward, and compile
diff --git a/meta/recipes-devtools/python/python/setuptweaks.patch b/meta/recipes-devtools/python/python/setuptweaks.patch
new file mode 100644
index 0000000..c34ef16
--- /dev/null
+++ b/meta/recipes-devtools/python/python/setuptweaks.patch
@@ -0,0 +1,57 @@
+This patch removes various ways native system options can pass into the python 
+compilation and somehow break C modules.
+
+Upstream-Status: Configuration [OE Specific]
+
+RP 2012/04/23
+
+Index: Python-2.7.2/setup.py
+===================================================================
+--- Python-2.7.2.orig/setup.py	2012-04-23 20:03:47.295582553 +0000
++++ Python-2.7.2/setup.py	2012-04-23 20:03:15.000000000 +0000
+@@ -231,7 +231,13 @@
+         # compilers
+         if compiler is not None:
+             (ccshared,cflags) = sysconfig.get_config_vars('CCSHARED','CFLAGS')
+-            args['compiler_so'] = compiler + ' ' + ccshared + ' ' + cflags
++            # Need to filter out -isysroot from the flags. Ideally should 
++            # figure out target flags here.
++            flags = []
++            for f in cflags.split():
++                if not f.startswith("-isystem"):
++                    flags.append(f)
++            args['compiler_so'] = compiler + ' ' + ccshared + ' ' + ' '.join(flags)
+         self.compiler.set_executables(**args)
+ 
+         build_ext.build_extensions(self)
+@@ -393,7 +399,6 @@
+         # into configure and stored in the Makefile (issue found on OS X 10.3).
+         for env_var, arg_name, dir_list in (
+                 ('LDFLAGS', '-R', self.compiler.runtime_library_dirs),
+-                ('LDFLAGS', '-L', self.compiler.library_dirs),
+                 ('CPPFLAGS', '-I', self.compiler.include_dirs)):
+             env_val = sysconfig.get_config_var(env_var)
+             if env_val:
+@@ -419,16 +424,16 @@
+                     for directory in reversed(options.dirs):
+                         add_dir_to_list(dir_list, directory)
+ 
+-        if os.path.normpath(sys.prefix) != '/usr' \
+-                and not sysconfig.get_config_var('PYTHONFRAMEWORK'):
++#        if os.path.normpath(sys.prefix) != '/usr' \
++#                and not sysconfig.get_config_var('PYTHONFRAMEWORK'):
+             # OSX note: Don't add LIBDIR and INCLUDEDIR to building a framework
+             # (PYTHONFRAMEWORK is set) to avoid # linking problems when
+             # building a framework with different architectures than
+             # the one that is currently installed (issue #7473)
+-            add_dir_to_list(self.compiler.library_dirs,
+-                            sysconfig.get_config_var("LIBDIR"))
+-            add_dir_to_list(self.compiler.include_dirs,
+-                            sysconfig.get_config_var("INCLUDEDIR"))
++#            add_dir_to_list(self.compiler.library_dirs,
++#                            sysconfig.get_config_var("LIBDIR"))
++#            add_dir_to_list(self.compiler.include_dirs,
++#                            sysconfig.get_config_var("INCLUDEDIR"))
+ 
+         try:
+             have_unicode = unicode
diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index 95e17a8..e067ba5 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -1,6 +1,6 @@
 require python.inc
 DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
-PR = "${INC_PR}.12"
+PR = "${INC_PR}.14"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
@@ -21,6 +21,7 @@ SRC_URI += "\
   file://host_include_contamination.patch \
   file://sys_platform_is_now_always_linux2.patch \
   file://fix_for_using_different_libdir.patch \
+  file://setuptweaks.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
@@ -33,6 +34,7 @@ TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
 TARGET_CC_ARCH_append_armv7a = " -D__SOFTFP__"
 
 do_configure_prepend() {
+	rm -f ${S}/Makefile.orig
 	autoreconf -Wcross --verbose --install --force --exclude=autopoint Modules/_ctypes/libffi || bbnote "_ctypes failed to autoreconf"
 }
 
@@ -65,10 +67,17 @@ do_compile() {
 	# remove any bogus LD_LIBRARY_PATH
 	sed -i -e s,RUNSHARED=.*,RUNSHARED=, Makefile
 
-	install -m 0644 Makefile Makefile.orig
-	sed -i -e 's,${includedir},${STAGING_INCDIR},' Makefile
-	sed -i -e 's,${libdir},${STAGING_LIBDIR},' Makefile
-	sed -i -e 's,LDFLAGS=,LDFLAGS=-L. -L${STAGING_LIBDIR},' Makefile
+	if [ ! -f Makefile.orig ]; then
+		install -m 0644 Makefile Makefile.orig
+	fi
+	sed -i -e 's,^LDFLAGS=.*,LDFLAGS=-L. -L${STAGING_LIBDIR},g' \
+		-e 's,libdir=${libdir},libdir=${STAGING_LIBDIR},g' \
+		-e 's,libexecdir=${libexecdir},libexecdir=${STAGING_DIR_HOST}${libexecdir},g' \
+		-e 's,^LIBDIR=.*,LIBDIR=${STAGING_LIBDIR},g' \
+		-e 's,includedir=${includedir},includedir=${STAGING_INCDIR},g' \
+		-e 's,^INCLUDEDIR=.*,INCLUDE=${STAGING_INCDIR},g' \
+		-e 's,^CONFINCLUDEDIR=.*,CONFINCLUDE=${STAGING_INCDIR},g' \
+		Makefile
 	install -m 0644 Makefile ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
 	# save copy of it now, because if we do it in do_install and 
 	# then call do_install twice we get Makefile.orig == Makefile.sysroot
@@ -79,6 +88,7 @@ do_compile() {
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
+		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
 		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
 		OPT="${CFLAGS}" libpython${PYTHON_MAJMIN}.so
@@ -89,6 +99,7 @@ do_compile() {
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
+		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
 		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
 		OPT="${CFLAGS}"
 }
@@ -105,6 +116,7 @@ do_install() {
 		CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
+		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
 		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
 		DESTDIR=${D} LIBDIR=${libdir} install
 




