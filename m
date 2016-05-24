Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id E4C3360797
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 20:14:32 +0000 (UTC)
Received: from seahawk.toradex.int
	(75-146-58-181-Washington.hfc.comcastbusiness.net [75.146.58.181])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 722965C0776;
	Tue, 24 May 2016 22:12:03 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 13:14:29 -0700
Message-Id: <1464120869-26056-1-git-send-email-stefan@agner.ch>
X-Mailer: git-send-email 1.9.1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1464120724; bh=BGU+vaYI98YiMqLIjwuUPC07nzvpUZIdmOUOUQ3b3B8=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=HhICj9ERClUN3VcPapShz00dKeqwQ14NB4gH8QNCq88eLY/2JuEcqZS1IiSInKnKDqTvk02Q8MTMBNBV70tSpgcky0t+lOht8ImAQmfwJJwNo9DRk9nmMoMrXA/QkHGfeckg1p1EWFxAxLjXZ6PG0vPy2uSkjJKTdjXNg8d30nc=
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [meta-oe][PATCH] florence: move to latest GTK2 version 0.5.4
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
X-List-Received-Date: Tue, 24 May 2016 20:14:35 -0000

From: Stefan Agner <stefan.agner@toradex.com>

The latest GTK2 version is 0.5.4, which contains several bug fixes.
Noteable, it fixes an issue where the SVG keys have not been displayed
with recent versions of its dependencies.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 .../florence/files/fix-no-atspi-compile.patch      | 30 ++++++++++++++++++++++
 .../recipes-support/florence/florence_0.5.1.bb     | 20 ---------------
 .../recipes-support/florence/florence_0.5.4.bb     | 20 +++++++++++++++
 3 files changed, 50 insertions(+), 20 deletions(-)
 create mode 100644 meta-gnome/recipes-support/florence/files/fix-no-atspi-compile.patch
 delete mode 100644 meta-gnome/recipes-support/florence/florence_0.5.1.bb
 create mode 100644 meta-gnome/recipes-support/florence/florence_0.5.4.bb

diff --git a/meta-gnome/recipes-support/florence/files/fix-no-atspi-compile.patch b/meta-gnome/recipes-support/florence/files/fix-no-atspi-compile.patch
new file mode 100644
index 0000000..0bb5dee
--- /dev/null
+++ b/meta-gnome/recipes-support/florence/files/fix-no-atspi-compile.patch
@@ -0,0 +1,30 @@
+diff --git a/src/florence.c b/src/florence.c
+index b27c31b..feadefe 100644
+--- a/src/florence.c
++++ b/src/florence.c
+@@ -44,12 +44,6 @@
+ /* exit signal */
+ static int flo_exit=FALSE;
+ 
+-#ifdef ENABLE_AT_SPI2
+-void flo_check_show (struct florence *florence, AtspiAccessible *obj);
+-#else
+-void flo_check_show (struct florence *florence, Accessible *obj);
+-#endif
+-
+ /* Called on destroy event (systray quit or close window) */
+ void flo_destroy (void)
+ {
+@@ -61,6 +55,12 @@ void flo_destroy (void)
+ }
+ 
+ #ifdef AT_SPI
++#ifdef ENABLE_AT_SPI2
++void flo_check_show (struct florence *florence, AtspiAccessible *obj);
++#else
++void flo_check_show (struct florence *florence, Accessible *obj);
++#endif
++
+ /* Called to destroy the icon */
+ void flo_icon_destroy (GtkWidget *widget, gpointer user_data)
+ {
diff --git a/meta-gnome/recipes-support/florence/florence_0.5.1.bb b/meta-gnome/recipes-support/florence/florence_0.5.1.bb
deleted file mode 100644
index 71014f0..0000000
--- a/meta-gnome/recipes-support/florence/florence_0.5.1.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "Florence is a virtual keyboard (also called on-screen-keyboard), which allows the user to input text through a touchscreen."
-HOMEPAGE = "http://florence.sourceforge.net/english.html"
-
-#NOTICE: If florence can't find its gconf settings, you need to start florence with --config for one time and save the configuration once.
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-
-PR = "r1"
-
-DEPENDS = "gtk+ libxml2 libglade librsvg libxtst gconf cairo intltool-native gnome-doc-utils libnotify"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/florence/florence/${PV}/florence-${PV}.tar.bz2 \
-           file://0001-Fix-glib-includes.patch"
-SRC_URI[md5sum] = "56d12e5b47c100d9df172aa5ddc0f609"
-SRC_URI[sha256sum] = "7b06ed84ef2b7b22d8d2cf0c7d013a05409bd82028240ac8719a68b192d5bc62"
-
-inherit gettext autotools gconf pkgconfig
-
-EXTRA_OECONF = "--disable-scrollkeeper --without-docs --without-at-spi --without-panelapplet"
diff --git a/meta-gnome/recipes-support/florence/florence_0.5.4.bb b/meta-gnome/recipes-support/florence/florence_0.5.4.bb
new file mode 100644
index 0000000..dfdb6bd
--- /dev/null
+++ b/meta-gnome/recipes-support/florence/florence_0.5.4.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Florence is a virtual keyboard (also called on-screen-keyboard), which allows the user to input text through a touchscreen."
+HOMEPAGE = "http://florence.sourceforge.net/english.html"
+
+#NOTICE: If florence can't find its gconf settings, you need to start florence with --config for one time and save the configuration once.
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+PR = "r1"
+
+DEPENDS = "gtk+ libxml2 libglade librsvg libxtst gconf cairo intltool-native gnome-doc-utils libnotify gstreamer"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/florence/florence/${PV}-gtk2/florence-${PV}.tar.bz2 \
+           file://fix-no-atspi-compile.patch"
+SRC_URI[md5sum] = "8d5c2367a28485bfcf577650b0badab7"
+SRC_URI[sha256sum] = "26d33aa20d5fbf34ceeded4c41cb922d2988b6082e33d9acc46dd7bfe56d31a1"
+
+inherit gettext autotools gconf pkgconfig
+
+EXTRA_OECONF = "--disable-scrollkeeper --without-docs --without-at-spi --without-panelapplet --without-xrecord"
-- 
1.9.1


