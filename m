Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SAfuu-0001MX-Q4
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 12:10:53 +0100
Received: by wibhm17 with SMTP id hm17so481809wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 04:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=CgEjpqwItP/lJCdBCUmDXs3QtCuJ9vw/QwSmvy8JLg0=;
	b=TK5SoVKttU4fjrCghxURYiKN4B0+WT7AX/1VeQoIbUjuR92OA/zaUyZ/sffOPTSF4J
	Vtb+o8CU5m5R6m6ykBFNMD27E/7Wa25y4p5Z3wpkzUBb8+dhh0IdjI9MK2wXVypAl4gL
	RLR2i3ss+wo+mo9hueX/kl+ZEaGxvDA+btWkJbxkUeQouLsKXQQVZJv7A5yTsMDgtFXU
	a3N8/53dFO8K7HSwSv0WDS5tEkwjz50ShMFKGfawotncm42PxQdQ4dTsnvtRaRz6YQAP
	5aOXbNeAmbwDno4dXWJfFcjGsZKlNerUolxL2fJ7Hurlsf4QH4JM18PkannnStWK8kVx
	ftbg==
Received: by 10.180.83.42 with SMTP id n10mr4094074wiy.9.1332414118137;
	Thu, 22 Mar 2012 04:01:58 -0700 (PDT)
Received: from localhost.localdomain (p5B0A13EE.dip.t-dialin.net.
	[91.10.19.238])
	by mx.google.com with ESMTPS id fn2sm7546875wib.0.2012.03.22.04.01.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 04:01:57 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2012 12:06:00 +0100
Message-Id: <1332414362-6406-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1332414362-6406-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332414362-6406-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] dbus: use systemd_unitdir
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
X-List-Received-Date: Thu, 22 Mar 2012 11:10:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-core/dbus/dbus.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 588209f..a75583d 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -10,7 +10,7 @@ DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X
 DEPENDS_virtclass-native = "expat-native virtual/libintl-native"
 DEPENDS_virtclass-nativesdk = "expat-nativesdk virtual/libintl-nativesdk virtual/libx11"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch; \
@@ -36,7 +36,7 @@ PACKAGES =+ "${PN}-lib ${PN}-systemd ${@base_contains('DISTRO_FEATURES', 'x11',
 FILES_${PN}-x11 = "${bindir}/dbus-launch"
 RDEPENDS_${PN}-x11 = "${PN}"
 
-FILES_${PN}-systemd = "${base_libdir}/systemd/system/"
+FILES_${PN}-systemd = "${systemd_unitdir}/system/"
 
 FILES_${PN} = "${bindir}/dbus-daemon* \
                ${bindir}/dbus-uuidgen \
@@ -67,7 +67,7 @@ EXTRA_OECONF = "--disable-tests \
                 --disable-doxygen-docs \
                 --disable-libaudit \
                 --with-xml=expat \
-                --with-systemdsystemunitdir=${base_libdir}/systemd/system/ \
+                --with-systemdsystemunitdir=${systemd_unitdir}/system/ \
                 ${EXTRA_OECONF_X}"
 
 do_install() {
@@ -96,7 +96,7 @@ do_install() {
 
 	# disable dbus-1 sysv script on systemd installs
 	# nearly all distros call the initscript plain 'dbus', but OE-core is different
-	ln -sf /dev/null ${D}/${base_libdir}/systemd/system/dbus-1.service
+	ln -sf /dev/null ${D}/${systemd_unitdir}/system/dbus-1.service
 }
 
 do_install_virtclass-native() {
-- 
1.7.4.4



