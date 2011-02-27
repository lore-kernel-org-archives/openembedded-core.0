Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PtcyB-0007DK-Jn
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:15 +0100
Received: by mail-ww0-f43.google.com with SMTP id 15so3168700wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:29:53 -0800 (PST)
Received: by 10.227.54.4 with SMTP id o4mr3798773wbg.210.1298798987305;
	Sun, 27 Feb 2011 01:29:47 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id y29sm2265923wbd.22.2011.02.27.01.29.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:29:46 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:21 +0100
Message-Id: <395872b313349f904f3dcf1f2eae9a22ad959a83.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 15/50] gtk+: disable build of faq and tutorial docs
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
X-List-Received-Date: Sun, 27 Feb 2011 09:31:15 -0000

From: Scott Garman <scott.a.garman@intel.com>

Joshua Lock noted that these problematic doc builds have been removed
upstream, and they are really superfluous for embedded builds.

This fixes [BUGID #741]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../recipes-gnome/gtk+/gtk+-2.22.1/doc-fixes.patch |   44 +++++++-------------
 meta/recipes-gnome/gtk+/gtk+_2.22.1.bb             |    2 +-
 2 files changed, 16 insertions(+), 30 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+-2.22.1/doc-fixes.patch b/meta/recipes-gnome/gtk+/gtk+-2.22.1/doc-fixes.patch
index 67fd29a..c2e3ae7 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.22.1/doc-fixes.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.22.1/doc-fixes.patch
@@ -1,33 +1,19 @@
-This fixes the following build errors with the gtk+ faq and tutorial
-documentation:
+There are issues building the gtk+ tutorial and faq documentation.
+Since they were removed in gtk+ upstream and are superfluous in
+embedded applications, just don't build them.
 
-mv: cannot stat `gtk-faq': No such file or directory
-mv: cannot stat `gtk-tut': No such file or directory
+Thanks to Joshua Lock for suggesting this approach.
 
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-diff -urN gtk+-2.22.1.orig//docs/faq/Makefile.am gtk+-2.22.1/docs/faq/Makefile.am
---- gtk+-2.22.1.orig//docs/faq/Makefile.am	2010-11-15 04:13:09.000000000 -0800
-+++ gtk+-2.22.1/docs/faq/Makefile.am	2011-02-17 13:16:30.603214103 -0800
-@@ -9,7 +9,8 @@
- 	  (cd $(srcdir); \
- 	   db2html gtk-faq.sgml; \
- 	   test -d html && rm -r html; \
--	   mv gtk-faq html); \
-+	   mkdir html; \
-+	   mv *.html html); \
- 	fi
+diff -urN gtk+-2.22.1.orig/docs/Makefile.am gtk+-2.22.1/docs/Makefile.am
+--- gtk+-2.22.1.orig/docs/Makefile.am	2010-11-15 04:13:09.000000000 -0800
++++ gtk+-2.22.1/docs/Makefile.am	2011-02-23 19:25:16.914815097 -0800
+@@ -1,7 +1,7 @@
+ ## Process this file with automake to produce Makefile.in
+ include $(top_srcdir)/Makefile.decl
  
- pdf:
-diff -urN gtk+-2.22.1.orig//docs/tutorial/Makefile.am gtk+-2.22.1/docs/tutorial/Makefile.am
---- gtk+-2.22.1.orig//docs/tutorial/Makefile.am	2010-11-15 04:13:09.000000000 -0800
-+++ gtk+-2.22.1/docs/tutorial/Makefile.am	2011-02-17 13:15:40.110369180 -0800
-@@ -42,7 +42,8 @@
- 	  (cd $(srcdir); \
- 	   db2html gtk-tut.sgml; \
- 	   test -d html && rm -r html; \
--	   mv gtk-tut html; \
-+	   mkdir html; \
-+	   mv *.html html; \
- 	   mkdir html/images; \
- 	   cp images/*.png html/images); \
- 	fi
+-SUBDIRS = tutorial faq reference tools
++SUBDIRS = reference tools
+ 
+ EXTRA_DIST += \
+ 	defsformat.txt			\
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.22.1.bb b/meta/recipes-gnome/gtk+/gtk+_2.22.1.bb
index 9ae762d..ce1e03e 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.22.1.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.22.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://gtk/gtk.h;endline=27;md5=c59e0b4490dd135a5726ebf851f9b17f \
                     file://gdk/gdk.h;endline=27;md5=07db285ec208fb3e0bf7d861b0614202 \
                     file://tests/testgtk.c;endline=27;md5=262db5db5f776f9863e56df31423e24c"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://download.gnome.org/sources/gtk+/2.22/gtk+-${PV}.tar.bz2 \
            file://xsettings.patch;patch=1 \
-- 
1.6.6.1



