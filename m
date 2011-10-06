Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RBwyl-0003Cw-Dy for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 01:03:51 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p96N4kvL004578 for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Oct 2011 00:04:46 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3pp-m+tXj+uS
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2011 00:04:46 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p96N4iHV004560
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Oct 2011 00:04:46 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 06 Oct 2011 23:58:07 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317941895.19281.0.camel@ted>
Mime-Version: 1.0
Subject: [PATCH] pkgconfig: Fix logic that was accidently leaving legacy pkg-config functionality enabled
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
X-List-Received-Date: Thu, 06 Oct 2011 23:03:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/disable-legacy.patch b/meta/recipes-devtools/pkgconfig/pkgconfig/disable-legacy.patch
index 1b3c12a..30db36c 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig/disable-legacy.patch
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig/disable-legacy.patch
@@ -7,13 +7,13 @@ pkgconfig with the --disable-legacy-scripts option, to maintain compatibility
 the default is to leave the scripts enabled.
 
 JL - 22/06/10
-Index: pkg-config-0.23/configure.in
+Index: pkg-config-0.25/configure.in
 ===================================================================
---- pkg-config-0.23.orig/configure.in	2008-01-16 22:48:07.000000000 +0000
-+++ pkg-config-0.23/configure.in	2010-06-22 13:05:58.951984140 +0100
-@@ -125,6 +125,14 @@
-   AC_CONFIG_SUBDIRS(glib-1.2.10)
- fi # !native_win32
+--- pkg-config-0.25.orig/configure.in	2011-10-05 18:52:24.879726050 +0100
++++ pkg-config-0.25/configure.in	2011-10-05 18:55:39.639726152 +0100
+@@ -151,6 +151,18 @@
+ AC_SUBST([POPT_LIBS])
+ AM_CONDITIONAL([USE_INSTALLED_POPT], [test "x$with_installed_popt" = xyes])
  
 +# legacy *-configure scripts can cause headaches, add option to disable
 +AC_ARG_ENABLE(legacy-scripts,
@@ -21,20 +21,24 @@ Index: pkg-config-0.23/configure.in
 +                        [Whether pkg-config will try and use legacy scripts such as glib-config and gnome-config @<:@default=yes@:>@])],
 +        [],
 +        [enable_legacy=yes])
-+AM_CONDITIONAL([LEGACY_SCRIPTS], [test x$enable_legacy = xyes])
++AM_CONDITIONAL([NO_LEGACY_SCRIPTS], [test x$enable_legacy != xyes])
++if test x$enable_legacy != xyes; then
++  AC_DEFINE(NO_LEGACY_SCRIPTS, 1, [We are not using legacy scripts])
++fi
++
 +
  AC_FUNC_ALLOCA
  
  AC_CHECK_FUNCS(setresuid setreuid,break)
-Index: pkg-config-0.23/parse.c
+Index: pkg-config-0.25/parse.c
 ===================================================================
---- pkg-config-0.23.orig/parse.c	2008-01-16 20:42:49.000000000 +0000
-+++ pkg-config-0.23/parse.c	2010-06-22 13:09:10.410129471 +0100
-@@ -1195,6 +1195,11 @@
+--- pkg-config-0.25.orig/parse.c	2011-10-05 18:52:24.869726050 +0100
++++ pkg-config-0.25/parse.c	2011-10-05 18:54:49.909726133 +0100
+@@ -1237,6 +1237,11 @@
     * messages.
     */
    return NULL;
-+#elif defined(LEGACY_SCRIPTS)
++#elif defined(NO_LEGACY_SCRIPTS)
 +  /* There are scenarios where we might not want to use these legacy
 +   * scripts even if they are available.
 +   */
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb
index a1f9508..76c0df9 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb
@@ -1,6 +1,6 @@
 require pkgconfig.inc
 
-PR = "r0"
+PR = "r2"
 
 SRC_URI[md5sum] = "a3270bab3f4b69b7dc6dbdacbcae9745"
 SRC_URI[sha256sum] = "3ba691ee2431f32ccb8efa131e59bf23e37f122dc66791309023ca6dcefcd10e"




