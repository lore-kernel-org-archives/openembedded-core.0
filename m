Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1Rt3JM-0005Hf-8q
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 21:31:16 +0100
Received: by eaal10 with SMTP id l10so529166eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2012 12:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=6ZJcKpdDqU23/oHATb3C4/UbPhsZmMXrK/i/GFrAo3Y=;
	b=g65NAag52HOoKUQTjSy++/edngap+O8twZDXpicML156xFlGisvn9z+EHCOU9VVmPP
	6PZydz+Y0+PUn2ArbT3UyL1Vnax/A0YCMRzBmEkqHY9mSzzLl+zwegy3mi2O3DwrUc6o
	iAkzkyOyGhJsWHviB0cMYP3bh1WSfchKHWGV0=
Received: by 10.213.9.9 with SMTP id j9mr727566ebj.53.1328214199023;
	Thu, 02 Feb 2012 12:23:19 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id e12sm13046535eea.5.2012.02.02.12.23.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Feb 2012 12:23:18 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2012 21:21:11 +0100
Message-Id: <1328214071-6782-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] webkit-gtk: Make it webgl support configurable via DISTRO_FEATURES.
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
X-List-Received-Date: Thu, 02 Feb 2012 20:31:16 -0000

* Add missing dependancy on virtual/libgl
* Make webgl configurable via DISTRO_FEATURES="opengl"
* Fix wrong resource path for error.html file

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 meta/recipes-sato/webkit/webkit-gtk_svn.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
index 9652953..2d9ec80 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
@@ -8,13 +8,14 @@ LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
                     file://Source/JavaScriptCore/parser/Parser.h;endline=23;md5=2f3cff0ad0a9c486da5a376928973a90"
 
 DEPENDS = "zlib enchant gnome-keyring libsoup-2.4 curl icu libxml2 cairo libxslt libxt libidn gnutls gtk+ gstreamer gst-plugins-base flex-native gperf-native perl-native-runtime sqlite3"
+DEPENDS += " ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)}"
 DEPENDS_darwin8 = "curl icu libxml2 cairo libxslt libidn gnutls gtk+ gstreamer flex-native gperf-native perl-native-runtime sqlite3"
 
 SRCREV_FORMAT = "source"
 
 SRCREV = "101488"
 PV = "1.7.2+svnr${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "\
   svn://svn.webkit.org/repository/webkit/trunk/;module=Source;proto=http;name=source \
@@ -41,6 +42,7 @@ EXTRA_OECONF = "\
                 --enable-image-resizer \
                 --enable-link-prefetch \
                 --with-gtk=2.0 \
+                ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-webgl', '--disable-webgl', d)} \
                 UNICODE_CFLAGS=-D_REENTRANT \
                "
 
@@ -81,7 +83,7 @@ FILES_${PN}launcher = "${bindir}/GtkLauncher"
 FILES_${PN}launcher-dbg = "${bindir}/.debug/GtkLauncher"
 FILES_libjavascriptcore = "${libdir}/libjavascriptcoregtk-1.0.so.*"
 FILES_${PN}-webinspector = "${datadir}/webkitgtk-*/webinspector/"
-FILES_${PN} += "${datadir}/webkit-*/resources/error.html \
+FILES_${PN} += "${datadir}/webkitgtk-*/resources/error.html \
                 ${datadir}/webkitgtk-*/images \
                 ${datadir}/glib-2.0/schemas"
 
-- 
1.7.3.4



