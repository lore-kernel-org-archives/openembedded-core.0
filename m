Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QRKM4-00084V-7q
	for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2011 10:31:12 +0200
Received: by wye20 with SMTP id 20so3567544wye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 01:28:03 -0700 (PDT)
Received: by 10.216.221.77 with SMTP id q55mr3326245wep.17.1306830482855;
	Tue, 31 May 2011 01:28:02 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id gb6sm3576670wbb.34.2011.05.31.01.28.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 May 2011 01:28:02 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 10:27:59 +0200
Message-Id: <1306830479-6753-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] dbus 1.4.1: disable sysv script properly when using systemd
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
X-List-Received-Date: Tue, 31 May 2011 08:31:12 -0000

OE-core uses 'dbus-1' as initscript name, which no other distribution(-buildsys) does, so we have to take special measures.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/dbus/dbus.inc      |    4 ++++
 meta/recipes-core/dbus/dbus_1.4.1.bb |    2 +-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 22514e9..fb2f6d4 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -89,6 +89,10 @@ do_install() {
 
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/dbus-1.init ${D}${sysconfdir}/init.d/dbus-1
+
+	# disable dbus-1 sysv script on systemd installs
+	# nearly all distros call the initscript plain 'dbus', but OE-core is different
+	ln -sf /dev/null ${D}/${base_libdir}/systemd/system/dbus-1.service
 }
 
 do_install_virtclass-native() {
diff --git a/meta/recipes-core/dbus/dbus_1.4.1.bb b/meta/recipes-core/dbus/dbus_1.4.1.bb
index f65ef35..252d160 100644
--- a/meta/recipes-core/dbus/dbus_1.4.1.bb
+++ b/meta/recipes-core/dbus/dbus_1.4.1.bb
@@ -1,6 +1,6 @@
 include dbus.inc
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI[md5sum] = "99cb057700c0455fb68f8d57902f77ac"
 SRC_URI[sha256sum] = "caa1a0ded2d0f2e95c1d4ec7e3c8bd44834928c5b0ed41a7189963f3593983bd"
-- 
1.6.6.1



