Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7EB89772D5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:43:53 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2015 01:43:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,286,1444719600"; d="scan'208";a="599686548"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Nov 2015 01:43:53 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 11:46:47 +0200
Message-Id: <0d1025e2caf91f17cc4b91b879839cd09b42cce4.1447405312.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
References: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1447405312.git.jussi.kukkonen@intel.com>
References: <cover.1447405312.git.jussi.kukkonen@intel.com>
Subject: [PATCH 02/19] pango: Upgrade 1.36.8 -> 1.38.1
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
X-List-Received-Date: Fri, 13 Nov 2015 09:43:53 -0000

Pango is now a simple a simple library and no longer has
 - modules
 - engines
 - configuration
Dropping all related things from the recipe.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/pango/pango.inc              | 50 +--------------
 .../pango/pango/multilib-fix-clean.patch           | 75 ----------------------
 meta/recipes-graphics/pango/pango_1.36.8.bb        | 10 ---
 meta/recipes-graphics/pango/pango_1.38.1.bb        |  9 +++
 4 files changed, 11 insertions(+), 133 deletions(-)
 delete mode 100644 meta/recipes-graphics/pango/pango/multilib-fix-clean.patch
 delete mode 100644 meta/recipes-graphics/pango/pango_1.36.8.bb
 create mode 100644 meta/recipes-graphics/pango/pango_1.38.1.bb

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index df0fdf6..c0109b2 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -21,51 +21,20 @@ PACKAGECONFIG[ptest] = "--enable-installed-tests,--disable-installed-tests,glib-
 BBCLASSEXTEND = "native"
 DEPENDS_class-native = "glib-2.0-native cairo-native harfbuzz-native"
 
-PACKAGES_DYNAMIC += "^pango-module-.*"
-
-RRECOMMENDS_${PN} = "pango-module-basic-fc"
-
 inherit gnomebase gtk-doc qemu ptest
 
-# Create a pango-modules package
-ALLOW_EMPTY_${BPN}-modules = "1"
-PACKAGES += "${BPN}-modules"
-RRECOMMENDS_${BPN}-modules =  "${@" ".join([p for p in d.getVar('PACKAGES', True).split() if p.find("pango-module") != -1])}"
-
-
 EXTRA_AUTORECONF = ""
 
 # seems to go wrong with default cflags
 FULL_OPTIMIZATION_arm = "-O2"
 
 EXTRA_OECONF = "--disable-introspection \
-		--enable-explicit-deps=no \
 	        --disable-debug \
-	        --with-mlprefix=${MLPREFIX}"
+	        "
 
 LEAD_SONAME = "libpango-1.0*"
 LIBV = "1.8.0"
 
-pango_postinst() {
-if ! [ -e $D${sysconfdir}/pango ] ; then
-	mkdir -p $D${sysconfdir}/pango
-fi
-
-if [ -n "$D" ]; then
-	${@qemu_run_binary(d, '$D','${bindir}/${MLPREFIX}pango-querymodules')} \
-		$D${libdir}/pango/${LIBV}/modules/*.so \
-		> $D${sysconfdir}/pango/${MLPREFIX}pango.modules 2>/dev/null
-
-	[ $? -ne 0 ] && exit 1
-
-	sed -i -e "s:$D::" $D${sysconfdir}/pango/${MLPREFIX}pango.modules
-
-	exit 0
-else
-	${bindir}/${MLPREFIX}pango-querymodules > /etc/pango/${MLPREFIX}pango.modules
-fi
-}
-
 # This binary needs to be compiled for the host architecture.  This isn't pretty!
 do_compile_prepend () {
 	if ${@base_contains('DISTRO_FEATURES', 'ptest', 'true', 'false', d)}; then
@@ -73,22 +42,7 @@ do_compile_prepend () {
 	fi
 }
 
-do_install_append () {
-	if [ "${MLPREFIX}" != "" ]; then
-		mv ${D}/${bindir}/pango-querymodules ${D}/${bindir}/${MLPREFIX}pango-querymodules 
-	fi
-}
-
-
-python populate_packages_prepend () {
-    pango_postinst = d.getVar("pango_postinst", True)
-
-    modules_root = d.expand('${libdir}/pango/${LIBV}/modules')
-
-    do_split_packages(d, modules_root, '^pango-(.*)\.so$', 'pango-module-%s', 'Pango module %s', pango_postinst)
-}
-
-FILES_${PN} = "${sysconfdir}/pango/* ${bindir}/* ${libdir}/libpango*${SOLIBS}"
+FILES_${PN} = "${bindir}/* ${libdir}/libpango*${SOLIBS}"
 FILES_${PN}-dbg += "${libdir}/pango/${LIBV}/modules/.debug"
 FILES_${PN}-dev += "${libdir}/pango/${LIBV}/modules/*.la"
 
diff --git a/meta/recipes-graphics/pango/pango/multilib-fix-clean.patch b/meta/recipes-graphics/pango/pango/multilib-fix-clean.patch
deleted file mode 100644
index ad414dd..0000000
--- a/meta/recipes-graphics/pango/pango/multilib-fix-clean.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-Upstream-Status: Pending
-
-Updated to apply to pango-1.32.5
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd pango-1.32.5/configure.ac pango-1.32.5/configure.ac
---- pango-1.32.5/configure.ac	2012-12-07 04:43:25.000000000 +0200
-+++ pango-1.32.5/configure.ac	2013-01-09 08:27:40.328516792 +0200
-@@ -213,6 +213,11 @@
-
- AC_SUBST(PANGO_DEBUG_FLAGS)
-
-+AC_ARG_WITH(mlprefix,
-+            AC_HELP_STRING([--with-mlprefix=<ARG>], [multilib prefix]),
-+            mlprefix_str=$withval, mlprefix_str="")
-+AC_DEFINE_UNQUOTED([MLPREFIX], ["$mlprefix_str"], [multilib prefix.])
-+
- AC_ARG_ENABLE(rebuilds,
-               [AC_HELP_STRING([--disable-rebuilds],
-                               [disable all source autogeneration rules])],,
-diff -Nurd pango-1.32.5/pango/modules.c pango-1.32.5/pango/modules.c
---- pango-1.32.5/pango/modules.c	2012-12-17 20:27:56.000000000 +0200
-+++ pango-1.32.5/pango/modules.c	2013-01-09 08:31:16.336512052 +0200
-@@ -555,11 +555,11 @@
-       files = g_new (char *, 3);
-
-       files[0] = g_build_filename (pango_get_sysconf_subdirectory (),
--                                   "pango.modules",
-+                                   MLPREFIX "pango.modules",
-                                    NULL);
-       files[1] = g_build_filename (pango_get_lib_subdirectory (),
-                                    MODULE_VERSION,
--                                   "modules.cache",
-+                                   MLPREFIX "modules.cache",
-                                    NULL);
-       files[2] = NULL;
-     }
-@@ -674,7 +674,8 @@
-       if (!no_module_warning)
-	{
-	  gchar *filename = g_build_filename (pango_get_sysconf_subdirectory (),
--					      "pango.modules",
-+/* For multilib case, keep multiple config file for different libs */
-+					      MLPREFIX "pango.modules",
-					      NULL);
-	  g_critical ("No modules found:\n"
-		      "No builtin or dynamically loaded modules were found.\n"
-diff -Nurd pango-1.32.5/pango/modules.c.rej pango-1.32.5/pango/modules.c.rej
---- pango-1.32.5/pango/modules.c.rej	1970-01-01 02:00:00.000000000 +0200
-+++ pango-1.32.5/pango/modules.c.rej	2013-01-09 08:27:40.328516792 +0200
-@@ -0,0 +1,12 @@
-+--- pango/modules.c	2010-09-22 03:37:01.000000000 +0800
-++++ pango/modules.c	2012-05-08 21:21:02.000000000 +0800
-+@@ -529,7 +529,8 @@
-+
-+   if (!file_str)
-+     file_str = g_build_filename (pango_get_sysconf_subdirectory (),
-+-				 "pango.modules",
-++/* For multilib case, keep multiple config file for different libs */
-++				 MLPREFIX "pango.modules",
-+ 				 NULL);
-+
-+   files = pango_split_file_list (file_str);
-diff -Nurd pango-1.32.5/pango/querymodules.c pango-1.32.5/pango/querymodules.c
---- pango-1.32.5/pango/querymodules.c	2012-08-28 15:27:18.000000000 +0300
-+++ pango-1.32.5/pango/querymodules.c	2013-01-09 08:31:47.828511359 +0200
-@@ -304,7 +304,7 @@
-
-       cache_file = g_build_filename (pango_get_lib_subdirectory (),
-                                      MODULE_VERSION,
--                                     "modules.cache",
-+                                     MLPREFIX "modules.cache",
-                                      NULL);
-       err = NULL;
-       if (!g_file_set_contents (cache_file, contents->str, -1, &err))
diff --git a/meta/recipes-graphics/pango/pango_1.36.8.bb b/meta/recipes-graphics/pango/pango_1.36.8.bb
deleted file mode 100644
index f4e4250..0000000
--- a/meta/recipes-graphics/pango/pango_1.36.8.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require pango.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
-
-SRC_URI += "file://run-ptest \
-            file://multilib-fix-clean.patch \
-"
-
-SRC_URI[archive.md5sum] = "217a9a753006275215fa9fa127760ece"
-SRC_URI[archive.sha256sum] = "18dbb51b8ae12bae0ab7a958e7cf3317c9acfc8a1e1103ec2f147164a0fc2d07"
diff --git a/meta/recipes-graphics/pango/pango_1.38.1.bb b/meta/recipes-graphics/pango/pango_1.38.1.bb
new file mode 100644
index 0000000..d85c17b
--- /dev/null
+++ b/meta/recipes-graphics/pango/pango_1.38.1.bb
@@ -0,0 +1,9 @@
+require pango.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
+
+SRC_URI += "file://run-ptest \
+"
+
+SRC_URI[archive.md5sum] = "7fde35d4a127b55ce8bbcefe109bc80d"
+SRC_URI[archive.sha256sum] = "1320569f6c6d75d6b66172b2d28e59c56ee864ee9df202b76799c4506a214eb7"
-- 
2.1.4


