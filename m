Return-Path: <pabigot@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5E6716B368
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 22:47:35 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id i10so2162269oag.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 15:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=zTy+otu25CRwkqaMDEusK+vzpGBLY3IhG1GIgPVf4/A=;
	b=ff8Rh20gnyFQVcBV3s3gCMpwFj9SSSbDZ5OmaHhAKPoqNDRMX8EriZm9c/FG25i1QO
	a/ma26qtejmIQzfX4ILm4c3R0AQAHsV6oScxjB/CLZDHRZrkwpqNmPb0bKOcwiIZydY9
	FvCNdVTtjg9a1dJxnzpFoGfKAy6vHk1htWsG+gn5lSznPgi3RBZ5JfnVFxvXnvd247Ch
	N/7NufIPVsWkbIWr3Les96KiM7IBWaoUnQNfQnkat1oSevZoEgKikqVfjo6KxRbQaOK6
	v7HAdk0pPoeQqBWdGxmJXzSkrpXMyHindvTeF6AO+4bxJAvRVvKltG9iOIonBVEQpqfL
	nIoA==
X-Received: by 10.60.178.164 with SMTP id cz4mr4931727oec.87.1377125255696;
	Wed, 21 Aug 2013 15:47:35 -0700 (PDT)
Received: from llc.pab (c-66-41-60-82.hsd1.mn.comcast.net. [66.41.60.82])
	by mx.google.com with ESMTPSA id hm1sm13611262obb.9.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 21 Aug 2013 15:47:35 -0700 (PDT)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Aug 2013 17:47:11 -0500
Message-Id: <1377125231-23508-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH][for-dylan] bluez4: fix network Connect parameter validation
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
X-List-Received-Date: Wed, 21 Aug 2013 22:47:35 -0000

From: "Peter A. Bigot" <pab@pabigot.com>

The incorrect validation prevents connection to the NAP service on another
device.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 ...ork-fix-network-Connect-method-parameters.patch |   30 ++++++++++++++++++++
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |    3 +-
 2 files changed, 32 insertions(+), 1 deletion(-)
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
index f48adfd..ab59075 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.101.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
@@ -1,11 +1,12 @@
 require bluez4.inc
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI += "file://bluetooth.conf \
             file://sbc_mmx.patch \
             file://fix-udev-paths.patch \
             file://obsolete_automake_macros.patch \
+            file://network-fix-network-Connect-method-parameters.patch \
 "
 
 SRC_URI[md5sum] = "fb42cb7038c380eb0e2fa208987c96ad"
-- 
1.7.9.5


