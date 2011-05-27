Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QPxKL-0006FQ-UL
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 15:43:48 +0200
Received: by wwb17 with SMTP id 17so1575916wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 06:40:29 -0700 (PDT)
Received: by 10.227.128.203 with SMTP id l11mr2142213wbs.79.1306503629336;
	Fri, 27 May 2011 06:40:29 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o38sm1196312wba.3.2011.05.27.06.40.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2011 06:40:28 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 May 2011 15:40:25 +0200
Message-Id: <1306503625-719-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] dbus 1.4.1: create UUIDDIR in postinst
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
X-List-Received-Date: Fri, 27 May 2011 13:43:48 -0000

This fixes dbus usage in non-sysV init systems.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/dbus/dbus.inc      |    4 ++++
 meta/recipes-core/dbus/dbus_1.4.1.bb |    2 +-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 2a5f8bd..75a4d9d 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -49,13 +49,17 @@ pkg_postinst_dbus() {
 
 	MESSAGEUSER=messagebus
 	MESSAGEHOME=/var/run/dbus
+	UUIDDIR=/var/lib/dbus
 
 	mkdir -p $MESSAGEHOME || true
+	mkdir -p $UUIDDIR || true
 	chgrp "$MESSAGEUSER" "$MESSAGEHOME" 2>/dev/null || addgroup "$MESSAGEUSER"
 	chown "$MESSAGEUSER"."$MESSAGEUSER" "$MESSAGEHOME" 2>/dev/null || \
 		adduser --system --home "$MESSAGEHOME" --no-create-home --disabled-password \
 			--ingroup "$MESSAGEUSER" "$MESSAGEUSER"
 
+	chown "$MESSAGEUSER"."$MESSAGEUSER" "$UUIDDIR"
+
 	grep -q netdev: /etc/group || addgroup netdev
 
 	chown root:"$MESSAGEUSER" /usr/libexec/dbus-daemon-launch-helper
diff --git a/meta/recipes-core/dbus/dbus_1.4.1.bb b/meta/recipes-core/dbus/dbus_1.4.1.bb
index 1c8aeaa..f65ef35 100644
--- a/meta/recipes-core/dbus/dbus_1.4.1.bb
+++ b/meta/recipes-core/dbus/dbus_1.4.1.bb
@@ -1,6 +1,6 @@
 include dbus.inc
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI[md5sum] = "99cb057700c0455fb68f8d57902f77ac"
 SRC_URI[sha256sum] = "caa1a0ded2d0f2e95c1d4ec7e3c8bd44834928c5b0ed41a7189963f3593983bd"
-- 
1.6.6.1



