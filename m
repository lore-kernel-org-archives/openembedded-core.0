Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-10.prod.phx3.secureserver.net
	(p3plsmtpa08-10.prod.phx3.secureserver.net [173.201.193.111])
	by mail.openembedded.org (Postfix) with ESMTP id D9D366BA72
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 11:07:53 +0000 (UTC)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa08-10.prod.phx3.secureserver.net with 
	id JB7s1m0081mTNtu01B7sh7; Wed, 28 Aug 2013 04:07:54 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Aug 2013 06:07:45 -0500
Message-Id: <1377688065-16372-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.4
Subject: [PATCH] bluez4: fix network Connect parameter validation
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
X-List-Received-Date: Wed, 28 Aug 2013 11:07:56 -0000

The incorrect validation prevents connection to the NAP service on another
device.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 ...ork-fix-network-Connect-method-parameters.patch | 30 ++++++++++++++++++++++
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/network-fix-network-Connect-method-parameters.patch

diff --git a/meta/recipes-connectivity/bluez/bluez4-4.101/network-fix-network-Connect-method-parameters.patch b/meta/recipes-connectivity/bluez/bluez4-4.101/network-fix-network-Connect-method-parameters.patch
new file mode 100644
index 0000000..37f9199
--- /dev/null
+++ b/meta/recipes-connectivity/bluez/bluez4-4.101/network-fix-network-Connect-method-parameters.patch
@@ -0,0 +1,30 @@
+Upstream-Status: Backport
+Signed-off-by: Peter A. Bigot <pab@pabigot.com>
+
+From 57170b311f1468330f4a9961dc0b3ac45f97bc13 Mon Sep 17 00:00:00 2001
+From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
+Date: Sat, 30 Jun 2012 00:39:05 -0300
+Subject: [PATCH] network: fix network Connect() method parameters
+
+---
+ network/connection.c |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/network/connection.c b/network/connection.c
+index 544ec3a..59423a9 100644
+--- a/network/connection.c
++++ b/network/connection.c
+@@ -554,7 +554,9 @@ static void path_unregister(void *data)
+ 
+ static const GDBusMethodTable connection_methods[] = {
+ 	{ GDBUS_ASYNC_METHOD("Connect",
+-			NULL, NULL, connection_connect) },
++				GDBUS_ARGS({"uuid", "s"}),
++				GDBUS_ARGS({"interface", "s"}),
++				connection_connect) },
+ 	{ GDBUS_METHOD("Disconnect",
+ 			NULL, NULL, connection_disconnect) },
+ 	{ GDBUS_METHOD("GetProperties",
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.101.bb b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
index 7af1305..d6c3e26 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.101.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://bluetooth.conf \
             file://sbc_mmx.patch \
             file://fix-udev-paths.patch \
             file://obsolete_automake_macros.patch \
+            file://network-fix-network-Connect-method-parameters.patch \
 "
 
 SRC_URI[md5sum] = "fb42cb7038c380eb0e2fa208987c96ad"
-- 
1.8.4


