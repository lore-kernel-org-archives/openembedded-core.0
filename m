Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TDYoP-0008L8-Ob
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 12:44:21 +0200
Received: by wibhn17 with SMTP id hn17so1806097wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 03:31:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=FJqM12cAgIhQIukW6zEgAzcJzAZAYVLeJngEiuzxfv0=;
	b=FU7Y8UVy1/eUQZEzNlPcc07OLKrS7xR3HqTYVsiJGxKprHqz2MBfVRxN7SPUIpKGxy
	ijJh/0VqYx70rmVNbEJCwQjDD8Qhw3S73Ss6zP71rzbKBZLqDXVRvJuR8Fb/ZDufVEmn
	m2p4hKIbRqEsoAHz9Pj7St3y2dNaPBNHwHV8ZJBw2QKOCsDpCmGRJZIsTRR1fvDYxE7f
	nA/vu69+coZVyVDSjzLC1OQCNGNaZqka8sqywDC7YgqkJylqVvVcHckMye3HN/RP4I6o
	C2qOEZUBRiN7iUWMX5N2N1FnKEMxz/GUUAJO+avQ3i+kWhv4KIrMmBfljsi4LtQLSQRP
	i2CQ==
Received: by 10.216.184.196 with SMTP id s46mr5601153wem.66.1347877902961;
	Mon, 17 Sep 2012 03:31:42 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id t7sm24968727wix.6.2012.09.17.03.31.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 03:31:41 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2012 12:30:49 +0200
Message-Id: <1347877853-30738-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
X-Gm-Message-State: ALoCoQlaAst/dJOsOnMeOGnQNuapFIptfLUPu3L/NOsaaPilBn+eoEn0R42S2pLPvTBay9wnLlqn
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [for-denzil][bluez-updates 1/5] bluez4: make alsa support conditional upon DISTRO_FEATURES
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
X-List-Received-Date: Mon, 17 Sep 2012 10:44:21 -0000

From: Jonas Danielsson <jonas.danielsson@lundinova.se>

Do not enable alsa in bluez4 unless it's included in DISTRO_FEATURES.

Signed-off-by: Jonas Danielsson <jonas.danielsson@lundinova.se>
---
 meta/recipes-connectivity/bluez/bluez4.inc     |    6 ++++--
 meta/recipes-connectivity/bluez/bluez4_4.99.bb |    3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-connectivity/bluez/bluez4.inc
index fbbe0bf..6dc06f4 100644
--- a/meta/recipes-connectivity/bluez/bluez4.inc
+++ b/meta/recipes-connectivity/bluez/bluez4.inc
@@ -7,9 +7,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e \
                     file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb191"
-DEPENDS = "udev alsa-lib libusb dbus-glib glib-2.0 libcheck"
+DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck"
 RDEPENDS_${PN}-dev = "bluez-hcidump"
 
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
+PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
+
 ASNEEDED = ""
 
 SRC_URI = "\
@@ -21,7 +24,6 @@ inherit autotools
 
 EXTRA_OECONF = "\
   --disable-gstreamer \
-  --enable-alsa \
   --enable-usb \
   --enable-tools \
   --enable-bccmd \
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.99.bb b/meta/recipes-connectivity/bluez/bluez4_4.99.bb
index 5033d34..32831e7 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.99.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.99.bb
@@ -1,6 +1,6 @@
 require bluez4.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI += "file://bluetooth.conf \
             file://sbc_mmx.patch \
@@ -19,6 +19,7 @@ do_install_append() {
 
 RDEPENDS_${PN}-dev = "bluez-hcidump"
 
+ALLOW_EMPTY_libasound-module-bluez = "1"
 PACKAGES =+ "libasound-module-bluez"
 
 FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
-- 
1.7.7.6



