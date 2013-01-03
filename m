Received: from mail-la0-f45.google.com ([209.85.215.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TqnaS-0002B6-3l
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 17:24:22 +0100
Received: by mail-la0-f45.google.com with SMTP id ep20so8027715lab.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2013 08:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=p6RW/UlPLCOHFIPN4Q5/syggyzic2MJcRhC3weJzgPo=;
	b=nr761mQkKjYjZVhESGGTQwOouc/oP2M3V33VGYXNpq/PazFcMKegYaMcQ+12h7FKmn
	iSKZpvoVj6T2uJ1mSkevmcH0K8tCYhp7JTZ2CwOcIPeeiGAtgLJnV0EKGvff2V6lHOdd
	G1Dt2XyblhTqd7OHqgJbm4cbnxjmIfpXyoF7jM5qFCZQhRuUKAK0BtrmJiJfb+Xxtef+
	Sph+GS8IEShien8fr4YE/A/QrrC0JE8RTwaQ+hBgERyy9whAuPKCq0hp01DKXWUJjA+7
	mwr9k7ZN3b75iiSPl7i1bvt5mX6eEOgoRSw5ZybOfkX2drEiRgR2t5SRt4ms/VvVY1jB
	ZHCA==
X-Received: by 10.112.82.166 with SMTP id j6mr20238738lby.25.1357229343970;
	Thu, 03 Jan 2013 08:09:03 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id n7sm17147878lbz.5.2013.01.03.08.09.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 08:09:03 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TqnLo-0002qj-LB; Thu, 03 Jan 2013 18:09:00 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Jan 2013 18:08:58 +0200
Message-Id: <1357229338-11959-2-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357229338-11959-1-git-send-email-cazfi74@gmail.com>
References: <1357229338-11959-1-git-send-email-cazfi74@gmail.com>
Subject: [PATCH] pango: update to upstream version 1.32.5
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
X-List-Received-Date: Thu, 03 Jan 2013 16:24:22 -0000

multilib-fix-clean.patch adjusted to apply cleanly, and to handle
new modules.cache file.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../pango/pango-1.30.1/multilib-fix-clean.patch    |   42 --------------
 .../pango/pango-1.32.5/multilib-fix-clean.patch    |   60 ++++++++++++++++++++
 .../{pango-1.30.1 => pango-1.32.5}/no-tests.patch  |    0
 meta/recipes-graphics/pango/pango.inc              |    6 +-
 .../pango/{pango_1.30.1.bb => pango_1.32.5.bb}     |    4 +-
 5 files changed, 65 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-graphics/pango/pango-1.30.1/multilib-fix-clean.patch
 create mode 100644 meta/recipes-graphics/pango/pango-1.32.5/multilib-fix-clean.patch
 rename meta/recipes-graphics/pango/{pango-1.30.1 => pango-1.32.5}/no-tests.patch (100%)
 rename meta/recipes-graphics/pango/{pango_1.30.1.bb => pango_1.32.5.bb} (59%)

diff --git a/meta/recipes-graphics/pango/pango-1.30.1/multilib-fix-clean.patch b/meta/recipes-graphics/pango/pango-1.30.1/multilib-fix-clean.patch
deleted file mode 100644
index 3f00ad8..0000000
--- a/meta/recipes-graphics/pango/pango-1.30.1/multilib-fix-clean.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Upstream-Status: Pending
-
-Index: pango-1.28.4/configure.in
-===================================================================
---- pango-1.28.4.orig/configure.in	2011-04-05 04:29:16.000000000 +0800
-+++ pango-1.28.4/configure.in	2012-05-08 21:32:17.000000000 +0800
-@@ -205,6 +205,11 @@
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
-Index: pango-1.28.4/pango/modules.c
-===================================================================
---- pango-1.28.4.orig/pango/modules.c	2010-09-22 03:37:01.000000000 +0800
-+++ pango-1.28.4/pango/modules.c	2012-05-08 21:21:02.000000000 +0800
-@@ -529,7 +529,8 @@
- 
-   if (!file_str)
-     file_str = g_build_filename (pango_get_sysconf_subdirectory (),
--				 "pango.modules",
-+/* For multilib case, keep multiple config file for different libs */
-+				 MLPREFIX "pango.modules",
- 				 NULL);
- 
-   files = pango_split_file_list (file_str);
-@@ -640,7 +641,8 @@
-       if (!no_module_warning)
- 	{
- 	  gchar *filename = g_build_filename (pango_get_sysconf_subdirectory (),
--					      "pango.modules",
-+/* For multilib case, keep multiple config file for different libs */
-+					      MLPREFIX "pango.modules",
- 					      NULL);
- 	  g_critical ("No modules found:\n"
- 		      "No builtin or dynamically loaded modules were found.\n"
diff --git a/meta/recipes-graphics/pango/pango-1.32.5/multilib-fix-clean.patch b/meta/recipes-graphics/pango/pango-1.32.5/multilib-fix-clean.patch
new file mode 100644
index 0000000..a0236c7
--- /dev/null
+++ b/meta/recipes-graphics/pango/pango-1.32.5/multilib-fix-clean.patch
@@ -0,0 +1,60 @@
+Upstream-Status: Pending
+
+Updated to apply to pango-1.32.5
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+
+diff -Nurd pango-1.32.5/configure.ac pango-1.32.5/configure.ac
+--- pango-1.32.5/configure.ac	2012-12-07 04:43:25.000000000 +0200
++++ pango-1.32.5/configure.ac	2012-12-28 02:52:09.281438378 +0200
+@@ -213,6 +213,11 @@
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
+diff -Nurd pango-1.32.5/pango/modules.c pango-1.32.5/pango/modules.c
+--- pango-1.32.5/pango/modules.c	2012-12-17 20:27:56.000000000 +0200
++++ pango-1.32.5/pango/modules.c	2012-12-28 02:41:57.577451799 +0200
+@@ -555,11 +555,11 @@
+       files = g_new (char *, 3);
+
+       files[0] = g_build_filename (pango_get_sysconf_subdirectory (),
+-                                   "pango.modules",
++                                   MLPREFIX "pango.modules",
+                                    NULL);
+       files[1] = g_build_filename (pango_get_lib_subdirectory (),
+                                    MODULE_VERSION,
+-                                   "modules.cache",
++                                   MLPREFIX "modules.cache",
+                                    NULL);
+       files[2] = NULL;
+     }
+@@ -674,7 +674,8 @@
+       if (!no_module_warning)
+	{
+	  gchar *filename = g_build_filename (pango_get_sysconf_subdirectory (),
+-					      "pango.modules",
++/* For multilib case, keep multiple config file for different libs */
++					      MLPREFIX "pango.modules",
+					      NULL);
+	  g_critical ("No modules found:\n"
+		      "No builtin or dynamically loaded modules were found.\n"
+diff -Nurd pango-1.32.5/pango/querymodules.c pango-1.32.5/pango/querymodules.c
+--- pango-1.32.5/pango/querymodules.c	2012-08-28 15:27:18.000000000 +0300
++++ pango-1.32.5/pango/querymodules.c	2012-12-28 02:45:08.053447620 +0200
+@@ -304,7 +304,7 @@
+
+       cache_file = g_build_filename (pango_get_lib_subdirectory (),
+                                      MODULE_VERSION,
+-                                     "modules.cache",
++                                     MLPREFIX "modules.cache",
+                                      NULL);
+       err = NULL;
+       if (!g_file_set_contents (cache_file, contents->str, -1, &err))
diff --git a/meta/recipes-graphics/pango/pango-1.30.1/no-tests.patch b/meta/recipes-graphics/pango/pango-1.32.5/no-tests.patch
similarity index 100%
rename from meta/recipes-graphics/pango/pango-1.30.1/no-tests.patch
rename to meta/recipes-graphics/pango/pango-1.32.5/no-tests.patch
diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index 839c00d..d89b96a 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -10,13 +10,13 @@ SECTION = "libs"
 LICENSE = "LGPLv2.0+"
 
 X11DEPENDS = "virtual/libx11 libxft"
-DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv cairo elfutils"
+DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv cairo elfutils harfbuzz"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[x11] = "--with-x,--without-x,${X11DEPENDS}"
 
 BBCLASSEXTEND = "native"
-DEPENDS_class-native = "glib-2.0-native cairo-native"
+DEPENDS_class-native = "glib-2.0-native cairo-native harfbuzz-native"
 
 PACKAGES_DYNAMIC += "^pango-module-.*"
 
@@ -41,7 +41,7 @@ EXTRA_OECONF = "--disable-glibtest \
 	        --with-mlprefix=${MLPREFIX}"
 
 LEAD_SONAME = "libpango-1.0*"
-LIBV = "1.6.0"
+LIBV = "1.8.0"
 
 postinst_prologue() {
 if [ "x$D" != "x" ]; then
diff --git a/meta/recipes-graphics/pango/pango_1.30.1.bb b/meta/recipes-graphics/pango/pango_1.32.5.bb
similarity index 59%
rename from meta/recipes-graphics/pango/pango_1.30.1.bb
rename to meta/recipes-graphics/pango/pango_1.32.5.bb
index 7254321..e71f514 100644
--- a/meta/recipes-graphics/pango/pango_1.30.1.bb
+++ b/meta/recipes-graphics/pango/pango_1.32.5.bb
@@ -9,7 +9,7 @@ GNOME_COMPRESS_TYPE="xz"
 SRC_URI += "file://no-tests.patch \
             file://multilib-fix-clean.patch"
 
-SRC_URI[archive.md5sum] = "ec3c1f236ee9bd4a982a5f46fcaff7b9"
-SRC_URI[archive.sha256sum] = "3a8c061e143c272ddcd5467b3567e970cfbb64d1d1600a8f8e62435556220cbe"
+SRC_URI[archive.md5sum] = "8e846804d6e219bc795a26a4a39b5bfd"
+SRC_URI[archive.sha256sum] = "7d7bc99c3d9b580cb4fe787fe47824e56e39534b9040e1c8a2a159248d8e5821"
 
 #PARALLEL_MAKE = ""
-- 
1.7.10.4



