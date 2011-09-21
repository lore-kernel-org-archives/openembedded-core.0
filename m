Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R6Rnh-0001GK-IJ
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 20:45:42 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so2123691bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 11:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=c61qIvdGSuCR6PRNhCtFmODkv3kr+ENHZiMiuy5eWs0=;
	b=jAv21LPs0CvnFPxqSBevaUoZcVG/d1taJtf6OwkigdzCvsnibpB/5orkNIS43XJKaH
	ozuJ1LBqcEZ+ONSxWpP6kLl7NrfCSgfRdyzuYmkft+7O88Z4KwPSTj2SMG+803Bz98Lf
	98ho1m1DkYSsYX2DG7lBtvAQgPj//o/qi292Q=
Received: by 10.204.156.156 with SMTP id x28mr842572bkw.108.1316630425118;
	Wed, 21 Sep 2011 11:40:25 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id t16sm5806554bkv.11.2011.09.21.11.40.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 11:40:24 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2011 22:39:54 +0400
Message-Id: <1316630404-10336-7-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
References: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 07/17] gtk+: packaging fixups
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
X-List-Received-Date: Wed, 21 Sep 2011 18:45:42 -0000

1) Package gail modules into libgail package. .la files go into main
gtk+-dev package, debug symbols to gtk+-dbg.

2) For completeness add printerbackends .la files to gtk+-dev

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc       |   10 ++++++++++
 meta/recipes-gnome/gtk+/gtk+_2.12.7.bb |    2 +-
 meta/recipes-gnome/gtk+/gtk+_2.16.6.bb |    2 +-
 meta/recipes-gnome/gtk+/gtk+_2.22.1.bb |    2 +-
 4 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index 886f55d..0e5c45c 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -15,6 +15,8 @@ DEPENDS = "glib-2.0 pango atk jpeg libpng libxext libxcursor \
 
 inherit autotools pkgconfig
 
+PACKAGES += "libgail"
+
 FILES_${PN} = "${bindir}/gtk-update-icon-cache \
 	${bindir}/gtk-query-immodules-2.0 \
 	${libdir}/lib*${SOLIBS} \
@@ -24,17 +26,25 @@ FILES_${PN} = "${bindir}/gtk-update-icon-cache \
 FILES_${PN}-dev += " \
         ${datadir}/gtk-2.0/include \
 	${libdir}/gtk-2.0/include \
+	${libdir}/gtk-2.0/modules/*.la \
 	${libdir}/gtk-2.0/${LIBV}/loaders/*.la \
 	${libdir}/gtk-2.0/${LIBV}/immodules/*.la \
+	${libdir}/gtk-2.0/${LIBV}/printbackends/*.la \
 	${libdir}/gtk-2.0/${LIBV}/engines/*.la \
 	${bindir}/gtk-builder-convert"
 
 FILES_${PN}-dbg += " \
+	${libdir}/gtk-2.0/modules/.debug/* \
         ${libdir}/gtk-2.0/${LIBV}/loaders/.debug/* \
 	${libdir}/gtk-2.0/${LIBV}/immodules/.debug/* \
 	${libdir}/gtk-2.0/${LIBV}/engines/.debug/* \
 	${libdir}/gtk-2.0/${LIBV}/printbackends/.debug/*"
 
+FILES_libgail = " \
+	${libdir}/gtk-2.0/modules/libgail.so \
+	${libdir}/gtk-2.0/modules/libferret.so \
+	"
+
 GTKBASE_RRECOMMENDS ?= "liberation-fonts gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg gdk-pixbuf-loader-gif gdk-pixbuf-loader-xpm shared-mime-info"
 GTKGLIBC_RRECOMMENDS ?= "${GTKBASE_RRECOMMENDS} glibc-gconv-iso8859-1"
 
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.12.7.bb b/meta/recipes-gnome/gtk+/gtk+_2.12.7.bb
index 00c4ee8..118bf74 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.12.7.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.12.7.bb
@@ -1,6 +1,6 @@
 require gtk+.inc
 
-PR = "r12"
+PR = "r13"
 
 SRC_URI = "http://download.gnome.org/sources/gtk+/2.12/gtk+-${PV}.tar.bz2 \
            file://xsettings.patch \
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb b/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb
index 09b917f..47a4660 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb
@@ -1,6 +1,6 @@
 require gtk+.inc
 
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "http://download.gnome.org/sources/gtk+/2.16/gtk+-${PV}.tar.bz2 \
            file://xsettings.patch \
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.22.1.bb b/meta/recipes-gnome/gtk+/gtk+_2.22.1.bb
index ba90e0e..a52250d 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.22.1.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.22.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://gtk/gtk.h;endline=27;md5=c59e0b4490dd135a5726ebf851f9b17f \
                     file://gdk/gdk.h;endline=27;md5=07db285ec208fb3e0bf7d861b0614202 \
                     file://tests/testgtk.c;endline=27;md5=262db5db5f776f9863e56df31423e24c"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://download.gnome.org/sources/gtk+/2.22/gtk+-${PV}.tar.bz2 \
            file://xsettings.patch \
-- 
1.7.2.5



