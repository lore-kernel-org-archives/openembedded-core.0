Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5F7EC607A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 22:33:55 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so28426838wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 15:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ZRROyFq4Pbg0uOXPUsjcnhw459L6v8ulFeUIliberA4=;
	b=mxlplgfnMNqW9ehfrFvdo74SZnRcqkb45BY+MUxvZPUmKPeZJUo2DJBMk9UWsrQc4b
	I4hpkmpG4cXSpqib5ejEb2ZY0MEuVCXkuR4GyW6fyyCwdch4dgSvLr3AOmxevkCwuXnl
	0kgvlmd0RTi3atiHKqEu1CMoTUCv6Emz5+uks2s3O6gEBKTulUsQyJvhvYiMXq38Alm4
	stzcHu6ihAjc/Xl62lN3PwxWgB3/woNOFgWRVbZjHe7ZwGY+IpMYSAsVgdNSBc/jYGWR
	flFNUgmWx5Y54myb9DIgzhZ3gz83uEsWNpC47bH7DjJomgiPvkDQ5Lz2YIPwoON5DP4O
	Kpxw==
X-Gm-Message-State: ALoCoQnpO9Cl6p4SZS74cXnop3VY/V9Nwwe7b3xu1HSRDkiBpj7fs3IjFZA0/rtSWMe78Mn+VyU8
X-Received: by 10.194.89.72 with SMTP id bm8mr23660921wjb.116.1437086035661;
	Thu, 16 Jul 2015 15:33:55 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	i6sm15273482wjf.29.2015.07.16.15.33.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Jul 2015 15:33:55 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jul 2015 23:28:13 +0100
Message-Id: <1437085693-28893-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] gamin: remove
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
X-List-Received-Date: Thu, 16 Jul 2015 22:33:59 -0000

Gamin hasn't been required for many years now, maintenance upstream stopped in
2008 and the addition of inotify to the kernel made it redundant.

Remove the recipe from oe-core, and references to it in pacakgegroup-core-lsb
(LSB doesn't require gamin) and packagegroup-self-hosted.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../packagegroups/packagegroup-self-hosted.bb      |  1 -
 .../gamin-0.1.10/obsolete_automake_macros.patch    | 23 ---------
 .../gamin/gamin/no-abstract-sockets.patch          | 56 --------------------
 meta/recipes-extended/gamin/gamin/noconst.patch    | 59 ----------------------
 meta/recipes-extended/gamin/gamin_0.1.10.bb        | 36 -------------
 .../packagegroups/packagegroup-core-lsb.bb         |  1 -
 6 files changed, 176 deletions(-)
 delete mode 100644 meta/recipes-extended/gamin/gamin-0.1.10/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-extended/gamin/gamin/no-abstract-sockets.patch
 delete mode 100644 meta/recipes-extended/gamin/gamin/noconst.patch
 delete mode 100644 meta/recipes-extended/gamin/gamin_0.1.10.bb

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 531f729..7d5a41a 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -118,7 +118,6 @@ RDEPENDS_packagegroup-self-hosted-extended = "\
     diffutils \
     elfutils \
     expat \
-    gamin \
     gawk \
     gdbm \
     gettext \
diff --git a/meta/recipes-extended/gamin/gamin-0.1.10/obsolete_automake_macros.patch b/meta/recipes-extended/gamin/gamin-0.1.10/obsolete_automake_macros.patch
deleted file mode 100644
index c4300ca..0000000
--- a/meta/recipes-extended/gamin/gamin-0.1.10/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=693449]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd gamin-0.1.10/configure.in gamin-0.1.10/configure.in
---- gamin-0.1.10/configure.in	2008-11-24 17:23:06.000000000 +0200
-+++ gamin-0.1.10/configure.in	2013-02-08 23:11:59.656279992 +0200
-@@ -1,7 +1,7 @@
- dnl Process this file with autoconf to produce a configure script.
- AC_PREREQ(2.52)
- AC_INIT(libgamin)
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
- AC_CANONICAL_SYSTEM
-
- # get any external flags setting before we start playing with the CFLAGS variable
-@@ -31,7 +31,6 @@
-
- AC_USE_SYSTEM_EXTENSIONS
- AC_PROG_CC
--AM_PROG_CC_STDC
- AC_HEADER_STDC
- AC_PROG_INSTALL
- AC_PROG_MAKE_SET
diff --git a/meta/recipes-extended/gamin/gamin/no-abstract-sockets.patch b/meta/recipes-extended/gamin/gamin/no-abstract-sockets.patch
deleted file mode 100644
index cddf2dc..0000000
--- a/meta/recipes-extended/gamin/gamin/no-abstract-sockets.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
---- /tmp/configure.in	2007-04-30 13:08:49.000000000 +0200
-+++ gamin-0.1.8/configure.in	2007-04-30 13:10:53.285251000 +0200
-@@ -354,51 +354,6 @@
-     AC_DEFINE(HAVE_CMSGCRED,1,[Have cmsgcred structure])
- fi
- 
--#### Abstract sockets
--
--AC_MSG_CHECKING(abstract socket namespace)
--AC_LANG_PUSH(C)
--AC_RUN_IFELSE([AC_LANG_PROGRAM(
--[[
--#include <sys/types.h>
--#include <stdlib.h>
--#include <string.h>
--#include <stdio.h>
--#include <sys/socket.h>
--#include <sys/un.h>
--#include <errno.h>
--]],
--[[
--  int listen_fd;
--  struct sockaddr_un addr;
--  
--  listen_fd = socket (PF_UNIX, SOCK_STREAM, 0);
--  
--  if (listen_fd < 0)
--    {
--      fprintf (stderr, "socket() failed: %s\n", strerror (errno));
--      exit (1);
--    }
--
--  memset (&addr, '\0', sizeof (addr));
--  addr.sun_family = AF_UNIX;
--  strcpy (addr.sun_path, "X/tmp/dbus-fake-socket-path-used-in-configure-test");
--  addr.sun_path[0] = '\0'; /* this is what makes it abstract */
--  
--  if (bind (listen_fd, (struct sockaddr*) &addr, SUN_LEN (&addr)) < 0)
--    {
--       fprintf (stderr, "Abstract socket namespace bind() failed: %s\n", 
--                strerror (errno));
--       exit (1);
--    }
--  else 
--    exit (0);
--]])],
--              [have_abstract_sockets=yes],
--              [have_abstract_sockets=no])
--AC_LANG_POP(C)
--AC_MSG_RESULT($have_abstract_sockets)
--
- if test x$enable_abstract_sockets = xyes; then
-     if test x$have_abstract_sockets = xno; then
- 	AC_MSG_ERROR([Abstract sockets explicitly required, and support not detected.])
diff --git a/meta/recipes-extended/gamin/gamin/noconst.patch b/meta/recipes-extended/gamin/gamin/noconst.patch
deleted file mode 100644
index 7b2998c..0000000
--- a/meta/recipes-extended/gamin/gamin/noconst.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-G_CONST_RETURN is deprecated in glib 2.30 so remove to to avoid
-build failures.
-
-RP 2011/10/12
-
-Upstream-Status: Pending
-
-Index: gamin-0.1.10/server/gam_node.c
-===================================================================
---- gamin-0.1.10.orig/server/gam_node.c	2011-10-12 15:25:45.217178314 +0100
-+++ gamin-0.1.10/server/gam_node.c	2011-10-12 15:26:17.807178293 +0100
-@@ -122,7 +122,7 @@
-  * it has finished with the string.  If it must keep it longer, it
-  * should makes its own copy.  The returned string must not be freed.
-  */
--G_CONST_RETURN char *
-+const char *
- gam_node_get_path(GamNode * node)
- {
-     g_assert(node);
-Index: gamin-0.1.10/server/gam_node.h
-===================================================================
---- gamin-0.1.10.orig/server/gam_node.h	2011-10-12 15:25:46.857178269 +0100
-+++ gamin-0.1.10/server/gam_node.h	2011-10-12 15:26:28.637178297 +0100
-@@ -58,7 +58,7 @@
- void                  gam_node_set_is_dir          (GamNode         *node,
- 						   gboolean        is_dir);
- 	
--G_CONST_RETURN char  *gam_node_get_path            (GamNode         *node);
-+const char  *gam_node_get_path            (GamNode         *node);
- 
- GList                *gam_node_get_subscriptions   (GamNode         *node);
- 
-Index: gamin-0.1.10/server/gam_subscription.c
-===================================================================
---- gamin-0.1.10.orig/server/gam_subscription.c	2011-10-12 15:25:40.497177525 +0100
-+++ gamin-0.1.10/server/gam_subscription.c	2011-10-12 15:26:39.867178304 +0100
-@@ -141,7 +141,7 @@
-  * @param sub the GamSubscription
-  * @returns The path being monitored.  It should not be freed.
-  */
--G_CONST_RETURN char *
-+const char *
- gam_subscription_get_path(GamSubscription * sub)
- {
-     if (sub == NULL)
-Index: gamin-0.1.10/server/gam_subscription.h
-===================================================================
---- gamin-0.1.10.orig/server/gam_subscription.h	2011-10-12 15:25:28.507178266 +0100
-+++ gamin-0.1.10/server/gam_subscription.h	2011-10-12 15:25:58.817178285 +0100
-@@ -21,7 +21,7 @@
- 
- int                  gam_subscription_get_reqno    (GamSubscription *sub);
- 
--G_CONST_RETURN char *gam_subscription_get_path     (GamSubscription *sub);
-+const char *gam_subscription_get_path     (GamSubscription *sub);
- 
- GamListener         *gam_subscription_get_listener (GamSubscription *sub);
- 
diff --git a/meta/recipes-extended/gamin/gamin_0.1.10.bb b/meta/recipes-extended/gamin/gamin_0.1.10.bb
deleted file mode 100644
index 375d265..0000000
--- a/meta/recipes-extended/gamin/gamin_0.1.10.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "Gamin the File Alteration Monitor"
-DESCRIPTION = "Gamin is a file and directory monitoring system defined to \
-be a subset of the FAM (File Alteration Monitor) system."
-HOMEPAGE = "http://people.gnome.org/~veillard/gamin/"
-
-LICENSE = "LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=412a9be54757a155d0b997b52b519f62"
-
-DEPENDS = "glib-2.0"
-PROVIDES = "fam"
-PR = "r5"
-
-SRC_URI = "http://www.gnome.org/~veillard/gamin/sources/gamin-${PV}.tar.gz \
-           file://no-abstract-sockets.patch \
-           file://noconst.patch \
-           file://obsolete_automake_macros.patch \
-"
-
-SRC_URI[md5sum] = "b4ec549e57da470c04edd5ec2876a028"
-SRC_URI[sha256sum] = "28085f0ae8be10eab582ff186af4fb0be92cc6c62b5cc19cd09b295c7c2899a1"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = "--without-python"
-
-PACKAGES += "lib${BPN} lib${BPN}-dev"
-FILES_${PN} = "${libexecdir}"
-FILES_${PN}-dbg += "${libexecdir}/.debug"
-FILES_lib${BPN} = "${libdir}/lib*.so.*"
-FILES_lib${BPN}-dev = "${includedir} ${libdir}/pkgconfig ${libdir}/lib*.la \
-                      ${libdir}/lib*.a ${libdir}/lib*.so"
-
-RDEPENDS_lib${BPN} = "${PN}"
-
-LEAD_SONAME = "libgamin-1.so"
-
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index 3cb2305..ce82385 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -55,7 +55,6 @@ RDEPENDS_packagegroup-core-lsb = "\
 RDEPENDS_packagegroup-core-sys-extended = "\
     curl \
     dhcp-client \
-    gamin \
     hdparm \
     lighttpd \
     libaio \
-- 
2.1.4


