Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SXfue-0002yu-16
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 23:49:40 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2012 14:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148125528"
Received: from sgarman-ws.jf.intel.com ([10.7.199.160])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2012 14:38:49 -0700
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 14:38:39 -0700
Message-Id: <535e298b98182d95c3280d2d46aa6388e27aac40.1337892418.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
Subject: [PATCH 28/32] pango: Fix modules load failure in multilib environment
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
X-List-Received-Date: Thu, 24 May 2012 21:49:42 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Multi-libs of Pango need different modules, thus different config files and
utils. This patch separate config file and utils with different MLPREFIX to
avoid conflict.

[YOCTO #2356] got fixed.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../pango/pango-1.28.4/multilib-fix-clean.patch    |   40 ++++++++++++++++++++
 meta/recipes-graphics/pango/pango.inc              |   12 +++++-
 meta/recipes-graphics/pango/pango_1.28.4.bb        |    7 ++--
 3 files changed, 54 insertions(+), 5 deletions(-)
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
index a2d5dc3..8ed92d3 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -34,7 +34,8 @@ FULL_OPTIMIZATION_arm = "-O2"
 
 EXTRA_OECONF = "--disable-glibtest \
 		--enable-explicit-deps=no \
-	        --disable-debug"
+	        --disable-debug \
+	        --with-mlprefix=${MLPREFIX}"
 
 LEAD_SONAME = "libpango-1.0*"
 LIBV = "1.6.0"
@@ -49,12 +50,19 @@ if ! [ -e $D${sysconfdir}/pango ] ; then
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
1.7.9.5



