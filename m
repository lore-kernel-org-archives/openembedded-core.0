Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TeOgc-0005JM-I7
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 12:23:17 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so233550lag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 03:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=qdhyPrv1UXrk1z5y7yDbRp+AI6hCNbWn5XClGymLPbA=;
	b=jXEN+UOsgKDOXlZllHVRrx4SeLe5UIYTPyR6l9d40gtuXto9nEa/r/ONsA8mZTlACI
	2kbPGOmlihO2VFoLbs/3cGthkgqYFZroP5RBP4it1EA0kWfnH33LZqP7tiuW9sVG7XmF
	A3TOyGDrx+HoP4i2HTCcmgW87DqzmuHGn75XeipGRHQD5xfq3bya16IeixvbDYGF9ZqM
	RHBbezVe8A0ZWhvdI16cJV0E71j14xiFzt4hORvwdNqn2osmYZ1KhK/JYTGzfeSjk2J8
	t0VaLnSgfCotLsTj/IZagSqs8VplFmTeeCOmKGBoIZqcGRFIvRogp11BlA6Qe19awjzg
	ueAw==
Received: by 10.152.145.202 with SMTP id sw10mr932109lab.22.1354273737225;
	Fri, 30 Nov 2012 03:08:57 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id ma15sm1866514lab.4.2012.11.30.03.08.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Nov 2012 03:08:56 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TeOSl-0001r7-7Z; Fri, 30 Nov 2012 13:08:55 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2012 13:08:54 +0200
Message-Id: <1354273734-7103-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] coreutils: update to upstream version 8.20
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
X-List-Received-Date: Fri, 30 Nov 2012 11:23:17 -0000

* remove-gets.patch removed as issue is fixed upstream
* cross-prime-list.patch added to fix cross-compilation
* noman.patch added to disable manpage creation that does not
  work while cross-compiling

* License texts are identical to old, but old md5sum was
  erronously calculated from the beginning of the ls.c file, and
  not from the beginning of license text segment.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../coreutils/coreutils-8.14/remove-gets.patch     |   23 ----------------
 .../coreutils-build-with-acl.patch                 |    0
 .../coreutils-8.20/cross-prime-list.patch          |   29 ++++++++++++++++++++
 .../coreutils/coreutils-8.20/noman.patch           |   19 +++++++++++++
 .../remove-usr-local-lib-from-m4.patch             |    0
 .../{coreutils_8.14.bb => coreutils_8.20.bb}       |   11 ++++----
 6 files changed, 54 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch
 rename meta/recipes-core/coreutils/{coreutils-8.14 => coreutils-8.20}/coreutils-build-with-acl.patch (100%)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.20/cross-prime-list.patch
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.20/noman.patch
 rename meta/recipes-core/coreutils/{coreutils-8.14 => coreutils-8.20}/remove-usr-local-lib-from-m4.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils_8.14.bb => coreutils_8.20.bb} (91%)

diff --git a/meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch b/meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch
deleted file mode 100644
index 4f61c92..0000000
--- a/meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-use gets iff its defined. eglibc 2.16 removed gets
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-Index: coreutils-8.14/lib/stdio.in.h
-===================================================================
---- coreutils-8.14.orig/lib/stdio.in.h	2011-09-24 04:20:48.000000000 -0700
-+++ coreutils-8.14/lib/stdio.in.h	2012-07-03 10:36:19.886296576 -0700
-@@ -713,11 +713,13 @@
- _GL_CXXALIAS_SYS (gets, char *, (char *s));
- #  undef gets
- # endif
-+# if defined gets
- _GL_CXXALIASWARN (gets);
- /* It is very rare that the developer ever has full control of stdin,
-    so any use of gets warrants an unconditional warning.  Assume it is
-    always declared, since it is required by C89.  */
- _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
-+# endif
- #endif
- 
- 
diff --git a/meta/recipes-core/coreutils/coreutils-8.14/coreutils-build-with-acl.patch b/meta/recipes-core/coreutils/coreutils-8.20/coreutils-build-with-acl.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.14/coreutils-build-with-acl.patch
rename to meta/recipes-core/coreutils/coreutils-8.20/coreutils-build-with-acl.patch
diff --git a/meta/recipes-core/coreutils/coreutils-8.20/cross-prime-list.patch b/meta/recipes-core/coreutils/coreutils-8.20/cross-prime-list.patch
new file mode 100644
index 0000000..524c636
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils-8.20/cross-prime-list.patch
@@ -0,0 +1,29 @@
+Build make-prime-list for build system
+
+make-prime-list is used in build time only for generating the prime list.
+Build it executable in build system.
+
+Upstream-Status: Pending
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd coreutils-8.20/src/local.mk coreutils-8.20/src/local.mk
+--- coreutils-8.20/src/local.mk	2012-10-23 17:14:12.000000000 +0300
++++ coreutils-8.20/src/local.mk	2012-11-30 11:47:11.155372281 +0200
+@@ -37,7 +37,6 @@
+ # Needed by the testsuite.
+ noinst_PROGRAMS =		\
+   src/getlimits			\
+-  src/make-prime-list		\
+   src/setuidgid
+ 
+ noinst_HEADERS =		\
+@@ -370,6 +369,9 @@
+ src_libstdbuf_so_LDFLAGS = -shared
+ src_libstdbuf_so_CFLAGS = -fPIC $(AM_CFLAGS)
+ 
++src/make-prime-list: src/make-prime-list.c
++	$(CC_FOR_BUILD) -o src/make-prime-list -I$(top_builddir)/lib $(srcdir)/src/make-prime-list.c
++
+ BUILT_SOURCES += src/dircolors.h
+ src/dircolors.h: src/dcgen src/dircolors.hin
+ 	$(AM_V_GEN)rm -f $@ $@-t
diff --git a/meta/recipes-core/coreutils/coreutils-8.20/noman.patch b/meta/recipes-core/coreutils/coreutils-8.20/noman.patch
new file mode 100644
index 0000000..90521e2
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils-8.20/noman.patch
@@ -0,0 +1,19 @@
+Do not build man pages
+
+Coreutils manpage creation does not work when cross-compiling and
+produced binaries are not executable in build system. Don't even try.
+
+Upstream-Status: Inappropriate [Other]
+Workaround suitable for OpenEmbedded, but not acceptable in generic case
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd coreutils-8.20/Makefile.am coreutils-8.20/Makefile.am
+--- coreutils-8.20/Makefile.am	2012-10-23 17:14:12.000000000 +0300
++++ coreutils-8.20/Makefile.am	2012-11-30 11:58:00.123358042 +0200
+@@ -205,5 +205,5 @@
+ include $(top_srcdir)/lib/local.mk
+ include $(top_srcdir)/src/local.mk
+ include $(top_srcdir)/doc/local.mk
+-include $(top_srcdir)/man/local.mk
++# include $(top_srcdir)/man/local.mk
+ include $(top_srcdir)/tests/local.mk
diff --git a/meta/recipes-core/coreutils/coreutils-8.14/remove-usr-local-lib-from-m4.patch b/meta/recipes-core/coreutils/coreutils-8.20/remove-usr-local-lib-from-m4.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.14/remove-usr-local-lib-from-m4.patch
rename to meta/recipes-core/coreutils/coreutils-8.20/remove-usr-local-lib-from-m4.patch
diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb b/meta/recipes-core/coreutils/coreutils_8.20.bb
similarity index 91%
rename from meta/recipes-core/coreutils/coreutils_8.14.bb
rename to meta/recipes-core/coreutils/coreutils_8.20.bb
index 3f58cfd..456d928 100644
--- a/meta/recipes-core/coreutils/coreutils_8.14.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.20.bb
@@ -6,8 +6,8 @@ HOMEPAGE = "http://www.gnu.org/software/coreutils/"
 BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
-                    file://src/ls.c;startline=5;endline=16;md5=e1a509558876db58fb6667ba140137ad"
-PR = "r5"
+                    file://src/ls.c;beginline=4;endline=15;md5=2e9acd8818fe6db4c2981d20ca632553"
+PR = "r0"
 DEPENDS = "gmp libcap"
 DEPENDS_class-native = ""
 
@@ -15,11 +15,12 @@ inherit autotools gettext
 
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
-           file://remove-gets.patch \
            file://coreutils-build-with-acl.patch \
+           file://cross-prime-list.patch \
+           file://noman.patch \
           "
-SRC_URI[md5sum] = "bcb135ce553493a45aba01b39eb3920a"
-SRC_URI[sha256sum] = "0d120817c19292edb19e92ae6b8eac9020e03d51e0af9cb116cf82b65d18b02d"
+SRC_URI[md5sum] = "3d69af8f561fce512538a9fe85f147ff"
+SRC_URI[sha256sum] = "dbcb798764827a0f74be738662ecb516705cf520330cd3d7b2640fdffa499eb2"
 
 EXTRA_OECONF_class-native = "--without-gmp"
 
-- 
1.7.10.4



