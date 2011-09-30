Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9Xb1-0005dc-Hd
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 09:33:23 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so1506871bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 00:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=FHiKJaSiyJVGZ7f31DD77o7An+X6Fk1S7SlpNOx8MRw=;
	b=Kux9QsG2F14OMmPNdQLjvbIuoRewwNQRVGgvVLpmRc6vbOXQ3SqXYJ2aTm0lMgAIUO
	E6EipxR5vYPsJjnuFKn2YSY2WoYIcgnO0PmeTkA6HObD2AoIOa9nsjn2pU6SMJSGxewL
	SFqJL7yYVdEvKcU9k4cmmBEr/CRR7eFEg/WkQ=
Received: by 10.204.7.70 with SMTP id c6mr7280143bkc.149.1317367677018;
	Fri, 30 Sep 2011 00:27:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l15sm3926714bkw.9.2011.09.30.00.27.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 00:27:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 09:27:15 +0200
Message-Id: <206cf15c98897c551720e9510ff58f644b2cd304.1317367429.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <06d9f58329265e028db9c5104ecbd7726daa077c.1317367429.git.Martin.Jansa@gmail.com>
References: <06d9f58329265e028db9c5104ecbd7726daa077c.1317367429.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317367429.git.Martin.Jansa@gmail.com>
References: <cover.1317367429.git.Martin.Jansa@gmail.com>
Subject: [PATCH 04/13] libx11: upgrade to 1.4.4
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
X-List-Received-Date: Fri, 30 Sep 2011 07:33:23 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-lib/libx11-1.4.4/keysymdef_include.patch  |   19 +++++++
 .../libx11-1.4.4/x11_disable_makekeys.patch        |   29 +++++++++++
 meta/recipes-graphics/xorg-lib/libx11.inc          |   52 ++++++++++++--------
 meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb     |   14 +++++
 4 files changed, 94 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-1.4.4/keysymdef_include.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-1.4.4/x11_disable_makekeys.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb

diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/keysymdef_include.patch b/meta/recipes-graphics/xorg-lib/libx11-1.4.4/keysymdef_include.patch
new file mode 100644
index 0000000..1a30e34
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11-1.4.4/keysymdef_include.patch
@@ -0,0 +1,19 @@
+diff -uNr libX11-1.3.6.orig//configure.ac libX11-1.3.6/configure.ac
+--- libX11-1.3.6.orig//configure.ac	2010-09-20 08:04:16.000000000 +0200
++++ libX11-1.3.6/configure.ac	2010-09-28 16:29:26.000000000 +0200
+@@ -355,7 +355,14 @@
+ # Find keysymdef.h
+ #
+ AC_MSG_CHECKING([keysym definitions])
+-KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
++AC_ARG_WITH(keysymdefdir,
++        AC_HELP_STRING([--with-keysymdefdir=DIR], [The location of keysymdef.h]),
++        KEYSYMDEFDIR=$withval, KEYSYMDEFDIR="")
++
++if test x$KEYSYMDEFDIR = x; then
++	KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
++fi
++
+ FILES="keysymdef.h XF86keysym.h Sunkeysym.h DECkeysym.h HPkeysym.h"
+ for i in $FILES; do
+     if test -f "$KEYSYMDEFDIR/$i"; then
diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/x11_disable_makekeys.patch b/meta/recipes-graphics/xorg-lib/libx11-1.4.4/x11_disable_makekeys.patch
new file mode 100644
index 0000000..9763313
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11-1.4.4/x11_disable_makekeys.patch
@@ -0,0 +1,29 @@
+Index: libX11-1.3.4/src/util/Makefile.am
+===================================================================
+--- libX11-1.3.4.orig/src/util/Makefile.am
++++ libX11-1.3.4/src/util/Makefile.am
+@@ -1,24 +1 @@
+-
+-noinst_PROGRAMS=makekeys
+-
+-makekeys_CFLAGS = \
+-	$(X11_CFLAGS) \
+-	$(CWARNFLAGS)
+-
+-CC = @CC_FOR_BUILD@
+-CPPFLAGS = @CPPFLAGS_FOR_BUILD@
+-CFLAGS = @CFLAGS_FOR_BUILD@
+-LDFLAGS = @LDFLAGS_FOR_BUILD@
+-
+ EXTRA_DIST = mkks.sh
+-
+-if LINT
+-# Check source code with tools like lint & sparse
+-
+-ALL_LINT_FLAGS=$(LINT_FLAGS) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
+-		$(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS)
+-
+-lint:
+-	$(LINT) $(ALL_LINT_FLAGS) makekeys.c
+-
+-endif LINT
diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index 455753f..8da9512 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -8,35 +8,47 @@ require xorg-lib-common.inc
 
 inherit siteinfo
 
-PROVIDES = "virtual/libx11"
+LICENSE = "MIT & MIT-style & BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
-XORG_PN = "libX11"
-LEAD_SONAME = "libX11.so"
+BBCLASSEXTEND = "native nativesdk"
+PROVIDES = "virtual/libx11"
+PE = "1"
 
-EXTRA_OECONF += "--with-keysymdef=${STAGING_INCDIR}/X11/keysymdef.h --disable-specs"
+PACKAGES =+ "${PN}-xcb"
 
 FILES_${PN} += "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${libdir}/X11/Xcms.txt"
+FILES_${PN}-xcb += "${libdir}/libX11-xcb.so.*"
 FILES_${PN}-locale += "${datadir}/X11/locale ${libdir}/X11/locale"
 
-do_compile() {
-	cd ${S}/src/util
-	mv makekeys.c.orig makekeys.c || true
-	touch makekeys-makekeys.o
+XORG_PN = "libX11"
+
+EXTRA_OECONF += "--with-keysymdefdir=${STAGING_INCDIR}/X11 --with-groff=no --with-ps2pdf=no --with-fop=no --disable-specs"
+
+# Below option is added to overcome the GCC bug on ARM
+# see http://gcc.gnu.org/PR42981 for further details.
+# We could potentially take it off when its fixed in gcc 4.5
+
+CFLAGS_append_arm = " -fforward-propagate "
+
+do_compile_prepend() {
 	(
 		unset CC LD CXX CCLD CFLAGS CPPFLAGS LDFLAGS CXXFLAGS
+		cd ${S}/src/util; 
+		mv makekeys.c.orig makekeys.c || true
+		# MIN_REHASH 10 is only in 1.0.1
+		sed -i -e 's:MIN_REHASH 10:MIN_REHASH 16:g' makekeys.c
+		sed -i -e 's:MIN_REHASH 15:MIN_REHASH 16:g' makekeys.c
+		touch makekeys-makekeys.o;
 		if [ "${SITEINFO_BITS}" == "64" ]; then
-                        ${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCDIR_NATIVE} makekeys.c -o makekeys
-                else
-                        ${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCDIR_NATIVE} -DUSE32 makekeys.c -o makekeys
-                fi
-	)
-	if [ "$?" != "0" ]; then
-		exit 1
-	fi
-	# mv to stop it getting rebuilt
-	mv makekeys.c makekeys.c.orig
-	cd ${S}
-	oe_runmake
+			${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCDIR_NATIVE} makekeys.c -o makekeys
+		else
+			${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCDIR_NATIVE} -DUSE32 makekeys.c -o makekeys
+		fi
+		# mv to stop it getting rebuilt
+		mv makekeys.c makekeys.c.orig
+		cd ../../
+	) || exit 1
 }
 
 # Multiple libx11 derivatives from from this file and are selected by virtual/libx11
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb b/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb
new file mode 100644
index 0000000..8b62149
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb
@@ -0,0 +1,14 @@
+require libx11.inc
+inherit gettext
+
+DEPENDS += "util-macros xtrans libxdmcp libxau \
+            bigreqsproto xproto xextproto xcmiscproto \
+            xf86bigfontproto kbproto inputproto libxcb \
+            xproto-native"
+
+SRC_URI += " file://keysymdef_include.patch \
+             file://x11_disable_makekeys.patch \
+             "
+
+SRC_URI[md5sum] = "ed7c382cbf8c13425b6a66bcac0ca5d9"
+SRC_URI[sha256sum] = "7fe62180f08ef5f0a0062fb444591e349cae2ab5af6ad834599f5c654e6c840d"
-- 
1.7.6.1



