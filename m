Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S2Bal-0001B3-Md
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 02:10:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 7A3CF31594C2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 02:02:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id odVSlIkjI26I
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 02:02:24 +0100 (CET)
Received: from [172.22.22.61] (drms-590eca4b.pool.mediaWays.net [89.14.202.75])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id ED4C331596F9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 02:02:23 +0100 (CET)
Message-ID: <4F4C279E.8020801@opendreambox.org>
Date: Tue, 28 Feb 2012 02:02:22 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1330362610-12851-1-git-send-email-obi@opendreambox.org>
	<CAP9ODKr1faEWrO877gfeMkutp8_STOvNp81iA00uiC0w46A1qQ@mail.gmail.com>
	<1624619.CXJLtNuTG7@helios>
In-Reply-To: <1624619.CXJLtNuTG7@helios>
Subject: [PATCH v2] qt4.inc: depend on tiff
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
X-List-Received-Date: Tue, 28 Feb 2012 01:10:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 27.02.2012 18:24, Paul Eggleton wrote:
> On Monday 27 February 2012 14:20:15 Otavio Salvador wrote:
>> On Mon, Feb 27, 2012 at 14:10, Andreas Oberritter <obi@opendreambox.org> 
> wrote:
>>> * Fixes the following error with qt4-embedded-4.8.0 and possibly others:
>>> | ../../../gui/image/qtiffhandler.cpp:48:20: fatal error: tiffio.h: No
>>> | such file or directory
>> Please bump INC_PR.
> 
> FYI, there's no INC_PR in qt4.inc but you can bump INC_PR in qt4-embedded.inc 
> and qt4-x11-free.inc since those are the only places that include qt4.inc.

In this case, bumping PR just wastes everybody's CPU cycles for no gain.
Anyway, here's an updated patch:

From fdececee9146f4d23494361d29a34877d67b879b Mon Sep 17 00:00:00 2001
From: Andreas Oberritter <obi@opendreambox.org>
Date: Mon, 27 Feb 2012 18:03:22 +0100
Subject: [PATCH] qt4.inc: depend on tiff

* Fixes the following error with qt4-embedded-4.8.0 and possibly others:

| ../../../gui/image/qtiffhandler.cpp:48:20: fatal error: tiffio.h: No such file or directory

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-qt/qt4/qt4-embedded.inc |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc |    2 +-
 meta/recipes-qt/qt4/qt4.inc          |    4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index e472af5..80948f3 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is
 SECTION = "libs"
 HOMEPAGE = "http://qt.nokia.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r40"
+INC_PR = "r41"
 
 QT_BASE_LIB  ?= "libqt-embedded"
 
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 40939de..75487f7 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://qt.nokia.com"
 SECTION = "x11/libs"
 DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 
-INC_PR = "r37"
+INC_PR = "r38"
 
 QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 = "-opengl"
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index ea868ff..161daa3 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -1,6 +1,6 @@
 inherit qmake_base
 
-DEPENDS += "qt4-tools-native freetype jpeg libpng zlib dbus openssl glib-2.0 gstreamer gst-plugins-base sqlite3"
+DEPENDS += "qt4-tools-native freetype jpeg libpng zlib dbus openssl glib-2.0 gstreamer gst-plugins-base sqlite3 tiff"
 
 require qt4_arch.inc
 QT_ARCH := "${@qt_arch(d)}"
@@ -15,7 +15,7 @@ QT_GLFLAGS ?= ""
 
 QT_CONFIG_FLAGS += "-release -no-cups -reduce-relocations \
                     -shared -no-nas-sound -no-nis \
-                    -system-libjpeg -system-libpng -system-zlib \
+                    -system-libjpeg -system-libpng -system-libtiff -system-zlib \
                     -no-pch -qdbus -stl -glib -phonon -webkit \
                     -xmlpatterns -no-rpath -qt3support -silent \
                     ${QT_SQL_DRIVER_FLAGS} \
-- 
1.7.5.4



