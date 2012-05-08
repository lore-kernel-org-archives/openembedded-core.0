Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1SRlkE-0002k9-Jv
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 16:50:30 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 May 2012 07:40:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="163439117"
Received: from yocto-build3.sh.intel.com ([10.239.48.5])
	by fmsmga002.fm.intel.com with ESMTP; 08 May 2012 07:40:36 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2012 22:43:49 +0800
Message-Id: <53bfc4a4c70630c2d546e49fcb93eb2ad7315d27.1336487657.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1336487657.git.edwin.zhai@intel.com>
References: <cover.1336487657.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1336487657.git.edwin.zhai@intel.com>
References: <cover.1336487657.git.edwin.zhai@intel.com>
Subject: [PATCH 1/1] pango: Fix modules load failure in multilib environment
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
X-List-Received-Date: Tue, 08 May 2012 14:50:30 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Multi-libs of Pango need different modules, thus different config files and
utils. This patch separate config file and utils with different MLPREFIX to
avoid conflict.

[YOCTO #2356] got fixed.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../pango/pango-1.28.4/multilib-fix-clean.patch    |   40 ++++++++++++++++++++
 meta/recipes-graphics/pango/pango.inc              |   13 +++++-
 meta/recipes-graphics/pango/pango_1.28.4.bb        |    7 ++-
 3 files changed, 55 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-graphics/pango/pango-1.28.4/multilib-fix-clean.patch

diff --git a/meta/recipes-graphics/pango/pango-1.28.4/multilib-fix-clean.patch b/meta/recipes-graphics/pango/pango-1.28.4/multilib-fix-clean.patch
new file mode 100644
index 0000000..addda5f
--- /dev/null
+++ b/meta/recipes-graphics/pango/pango-1.28.4/multilib-fix-clean.patch
@@ -0,0 +1,40 @@
+Index: pango-1.28.4/configure.in
+===================================================================
+--- pango-1.28.4.orig/configure.in	2011-04-05 04:29:16.000000000 +0800
++++ pango-1.28.4/configure.in	2012-05-08 21:32:17.000000000 +0800
+@@ -205,6 +205,11 @@
+ 
+ AC_SUBST(PANGO_DEBUG_FLAGS)
+ 
++AC_ARG_WITH(mlprefix,
++            AC_HELP_STRING([--with-mlprefix=<ARG>], [multilib prefix]),
++            mlprefix_str=$withval, mlprefix_str="")
++AC_DEFINE_UNQUOTED([MLPREFIX], ["$mlprefix_str"], [multilib prefix.])
++
+ AC_ARG_ENABLE(rebuilds,
+               [AC_HELP_STRING([--disable-rebuilds],
+                               [disable all source autogeneration rules])],,
+Index: pango-1.28.4/pango/modules.c
+===================================================================
+--- pango-1.28.4.orig/pango/modules.c	2010-09-22 03:37:01.000000000 +0800
++++ pango-1.28.4/pango/modules.c	2012-05-08 21:21:02.000000000 +0800
+@@ -529,7 +529,8 @@
+ 
+   if (!file_str)
+     file_str = g_build_filename (pango_get_sysconf_subdirectory (),
+-				 "pango.modules",
++/* For multilib case, keep multiple config file for different libs */
++				 MLPREFIX "pango.modules",
+ 				 NULL);
+ 
+   files = pango_split_file_list (file_str);
+@@ -640,7 +641,8 @@
+       if (!no_module_warning)
+ 	{
+ 	  gchar *filename = g_build_filename (pango_get_sysconf_subdirectory (),
+-					      "pango.modules",
++/* For multilib case, keep multiple config file for different libs */
++					      MLPREFIX "pango.modules",
+ 					      NULL);
+ 	  g_critical ("No modules found:\n"
+ 		      "No builtin or dynamically loaded modules were found.\n"
diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index a2d5dc3..d59a4d1 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -32,9 +32,11 @@ EXTRA_AUTORECONF = ""
 # seems to go wrong with default cflags
 FULL_OPTIMIZATION_arm = "-O2"
 
+# keep multiple util/config with MLPREFIX in multilib environment
 EXTRA_OECONF = "--disable-glibtest \
 		--enable-explicit-deps=no \
-	        --disable-debug"
+	        --disable-debug \
+	        --with-mlprefix=${MLPREFIX}"
 
 LEAD_SONAME = "libpango-1.0*"
 LIBV = "1.6.0"
@@ -49,12 +51,19 @@ if ! [ -e $D${sysconfdir}/pango ] ; then
 fi
 }
 
+do_install_append () {
+	if [ "${MLPREFIX}" != "" ]; then
+		mv ${D}/${bindir}/pango-querymodules ${D}/${bindir}/${MLPREFIX}pango-querymodules 
+	fi
+}
+
+
 python populate_packages_prepend () {
 	prologue = d.getVar("postinst_prologue", True)
 
 	modules_root = d.expand('${libdir}/pango/${LIBV}/modules')
 
-	do_split_packages(d, modules_root, '^pango-(.*)\.so$', 'pango-module-%s', 'Pango module %s', prologue + 'pango-querymodules > /etc/pango/pango.modules')
+	do_split_packages(d, modules_root, '^pango-(.*)\.so$', 'pango-module-%s', 'Pango module %s', prologue + '${bindir}/${MLPREFIX}pango-querymodules > /etc/pango/${MLPREFIX}pango.modules')
 }
 
 FILES_${PN} = "${sysconfdir}/pango/* ${bindir}/* ${libdir}/libpango*${SOLIBS}"
diff --git a/meta/recipes-graphics/pango/pango_1.28.4.bb b/meta/recipes-graphics/pango/pango_1.28.4.bb
index 8d71de0..7055158 100644
--- a/meta/recipes-graphics/pango/pango_1.28.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.28.4.bb
@@ -2,10 +2,11 @@ require pango.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
-PR = "r7"
+PR = "r8"
 
-SRC_URI += "file://no-tests.patch"
-SRC_URI += "file://noconst.patch"
+SRC_URI += "file://no-tests.patch \
+            file://noconst.patch \
+            file://multilib-fix-clean.patch"
 
 SRC_URI[archive.md5sum] = "3f3989700f04e9117d30544a9078b3a0"
 SRC_URI[archive.sha256sum] = "7eb035bcc10dd01569a214d5e2bc3437de95d9ac1cfa9f50035a687c45f05a9f"
-- 
1.7.1



