Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QPyHZ-00082o-Ec
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 16:44:57 +0200
Received: by wye20 with SMTP id 20so1487721wye.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 07:41:52 -0700 (PDT)
Received: by 10.216.140.219 with SMTP id e69mr1240869wej.45.1306507312420;
	Fri, 27 May 2011 07:41:52 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id m8sm1235762wbh.62.2011.05.27.07.41.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2011 07:41:51 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 May 2011 16:41:48 +0200
Message-Id: <1306507308-8674-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH v2] dbus 1.4.1: create UUIDDIR in postinst
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
X-List-Received-Date: Fri, 27 May 2011 14:44:57 -0000

This fixes dbus usage in non-sysV init systems. Volatiles aren't needed in systemd land, since /run is tmpfs and the dbus units take care of all this.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---

Changes since v1:

	* addressed pbs concerns about the || true and chgrp dots
	* check for volatiles before trying to run the script

 meta/recipes-core/dbus/dbus.inc      |   12 +++++++++---
 meta/recipes-core/dbus/dbus_1.4.1.bb |    2 +-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 2a5f8bd..38acf35 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -49,13 +49,17 @@ pkg_postinst_dbus() {
 
 	MESSAGEUSER=messagebus
 	MESSAGEHOME=/var/run/dbus
+	UUIDDIR=/var/lib/dbus
 
-	mkdir -p $MESSAGEHOME || true
+	mkdir -p $MESSAGEHOME
+	mkdir -p $UUIDDIR
 	chgrp "$MESSAGEUSER" "$MESSAGEHOME" 2>/dev/null || addgroup "$MESSAGEUSER"
-	chown "$MESSAGEUSER"."$MESSAGEUSER" "$MESSAGEHOME" 2>/dev/null || \
+	chown "$MESSAGEUSER":"$MESSAGEUSER" "$MESSAGEHOME" 2>/dev/null || \
 		adduser --system --home "$MESSAGEHOME" --no-create-home --disabled-password \
 			--ingroup "$MESSAGEUSER" "$MESSAGEUSER"
 
+	chown "$MESSAGEUSER":"$MESSAGEUSER" "$UUIDDIR"
+
 	grep -q netdev: /etc/group || addgroup netdev
 
 	chown root:"$MESSAGEUSER" /usr/libexec/dbus-daemon-launch-helper
@@ -63,7 +67,9 @@ pkg_postinst_dbus() {
 
 	# add volatile after new user/grp are created
 	echo "d messagebus messagebus 0755 /var/run/dbus none" > /etc/default/volatiles/99_dbus
-	/etc/init.d/populate-volatile.sh update
+	if [ -e /etc/init.d/populate-volatile.sh ] ; then
+		/etc/init.d/populate-volatile.sh update
+	fi
 }
 
 EXTRA_OECONF_X = "--with-x"
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



