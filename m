Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAihk-0005A2-7c
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 15:37:12 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356292bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=4FCCOCN/24bjeAbxUqfXpRf+8C13kZ85W8bR0G4+m44=;
	b=SfuxhkwAY+1bjRA4ZQP3BIPprPdTPKgi+sI+wiksB2vK/MwqoVHfddq2n63+SJDrPC
	YmOgW2gsXsYNKR7DMFafRf4DfwNZjqq+kFYPG2qoqQHU44IJ8vXf93WVZLOUEvKpQv9n
	xH0xishWqVQMXrH5L0AJDeUvV5LTZF/4wybcQ=
Received: by 10.204.136.151 with SMTP id r23mr8367539bkt.200.1317648695159;
	Mon, 03 Oct 2011 06:31:35 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l15sm13228012bkw.9.2011.10.03.06.31.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:31:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:28:50 +0200
Message-Id: <764c4e5c7f2760f6d03491f96e784c38e431cf16.1317648041.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648040.git.Martin.Jansa@gmail.com>
References: <cover.1317648040.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 19/30] libx11: add new version 1.4.4
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
X-List-Received-Date: Mon, 03 Oct 2011 13:43:44 -0000

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



