Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCE01-0006CP-7f
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:14:17 +0200
Received: by ggnq1 with SMTP id q1so3019435ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=4FCCOCN/24bjeAbxUqfXpRf+8C13kZ85W8bR0G4+m44=;
	b=D0lLX0SEXAGlEmQjvFEDkpVj9CInSL95LvksxlAmkVElv8F0g+DIQpEZbrp338xEYH
	F9xNWN/3a1nVKI/hzXGicoIwhYzLQbW+FRC66ZQdna2epl45ypB8zCWARNoCl8p9FNS2
	edBNti5jlm/i3XGsssGi1Uhwv1mLMSComWOU4=
Received: by 10.223.5.3 with SMTP id 3mr11911724fat.4.1318007317169;
	Fri, 07 Oct 2011 10:08:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f25sm13632556faf.7.2011.10.07.10.08.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:08:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 19:05:18 +0200
Message-Id: <9ea0b16fd2da2b76aa2e35865722191222c8cc6d.1318007055.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
References: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318007055.git.Martin.Jansa@gmail.com>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 23/31] libx11: add new version 1.4.4
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
X-List-Received-Date: Fri, 07 Oct 2011 17:14:17 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-lib/libx11-1.4.4/keysymdef_include.patch  |   23 +++++++++++++++
 .../libx11-1.4.4/x11_disable_makekeys.patch        |   29 ++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb     |   18 ++++++++++++
 3 files changed, 70 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-1.4.4/keysymdef_include.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-1.4.4/x11_disable_makekeys.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb

diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/keysymdef_include.patch b/meta/recipes-graphics/xorg-lib/libx11-1.4.4/keysymdef_include.patch
new file mode 100644
index 0000000..d1bdab9
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11-1.4.4/keysymdef_include.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+
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
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb b/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb
new file mode 100644
index 0000000..823b3dc
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb
@@ -0,0 +1,18 @@
+require libx11.inc
+inherit gettext
+
+BBCLASSEXTEND = "native nativesdk"
+
+EXTRA_OECONF += "--with-keysymdefdir=${STAGING_INCDIR}/X11"
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
1.7.7



