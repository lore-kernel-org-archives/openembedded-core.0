Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C0B336FFAB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 08:42:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6P8gX9g009483
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 01:42:33 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Jul 2016 01:42:31 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2016 04:42:30 -0400
Message-ID: <1469436150-121312-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] avahi-ui: use PACKAGECONFIG for gtk features
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
X-List-Received-Date: Mon, 25 Jul 2016 08:42:36 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The commit "054ea20 avahi-ui: Build with Gtk+3"
enabled gtk3 and disabled gtk2, which causes failure on
some package depends on gtk2, like gnome-disk-utility
in meta-openembedded/meta-gnome:

| checking for GTK2... yes
| checking for AVAHI_UI... no
| configure: error: Package requirements (avahi-ui >= 0.6.25) were not met:
|
| No package 'avahi-ui' found

The gtk2 and gtk3 feature for avahi-ui is not exclusive, so change
to use PACKAGECONFIG for them so we can easily enable/disable one
of them or both of them as needed.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb |  4 ++--
 meta/recipes-connectivity/avahi/avahi.inc          | 10 +++++++---
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
index c6f67f1..d77d5b8 100644
--- a/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
+++ b/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
@@ -13,9 +13,9 @@ SRC_URI += "file://0001-configure.ac-install-GtkBuilder-interface-files-for-.pat
 SRC_URI[md5sum] = "22b5e705d3eabb31d26f2e1e7b074013"
 SRC_URI[sha256sum] = "d54991185d514a0aba54ebeb408d7575b60f5818a772e28fa0e18b98bc1db454"
 
-DEPENDS += "avahi gtk+3"
+DEPENDS += "avahi"
 
-AVAHI_GTK = "--disable-gtk --enable-gtk3 --disable-pygtk"
+AVAHI_GTK = "gtk gtk3"
 
 S = "${WORKDIR}/avahi-${PV}"
 
diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 340b3e6..234646d 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -23,8 +23,14 @@ SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}
           "
 UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
 
-PACKAGECONFIG ??= "dbus"
+# For gtk related PACKAGECONFIGs: gtk, gtk3 and pygtk
+AVAHI_GTK ?= ""
+
+PACKAGECONFIG ??= "dbus ${AVAHI_GTK}"
 PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
+PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+"
+PACKAGECONFIG[gtk3] = "--enable-gtk3,--disable-gtk3,gtk+3"
+PACKAGECONFIG[pygtk] = "--enable-pygtk,--disable-pygtk,"
 
 USERADD_PACKAGES = "avahi-daemon avahi-autoipd"
 USERADD_PARAM_avahi-daemon = "--system --home /var/run/avahi-daemon \
@@ -51,14 +57,12 @@ EXTRA_OECONF = "--with-avahi-priv-access-group=adm \
              --disable-manpages \
              ${EXTRA_OECONF_SYSVINIT} \
              ${EXTRA_OECONF_SYSTEMD} \
-             ${AVAHI_GTK} \
            "
 
 # The distro choice determines what init scripts are installed
 EXTRA_OECONF_SYSVINIT = "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','--with-distro=debian','--with-distro=none',d)}"
 EXTRA_OECONF_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES','systemd','--with-systemdsystemunitdir=${systemd_unitdir}/system/','--without-systemdsystemunitdir',d)}"
 
-AVAHI_GTK ?= "--disable-gtk --disable-gtk3"
 
 LDFLAGS_append_libc-uclibc = " -lintl"
 LDFLAGS_append_uclinux-uclibc = " -lintl"
-- 
2.8.1


