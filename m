Return-Path: <uol@pengutronix.de>
Received: from metis.ext.4.pengutronix.de (metis.ext.4.pengutronix.de
	[92.198.50.35])
	by mail.openembedded.org (Postfix) with ESMTP id 6E6D060767
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 08:47:42 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:RSA_AES_128_CBC_SHA1:128) (Exim 4.80)
	(envelope-from <uol@pengutronix.de>)
	id 1aieS6-0004F2-E3; Wed, 23 Mar 2016 09:47:42 +0100
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.86_2)
	(envelope-from <uol@pengutronix.de>)
	id 1aieS6-0004nC-52; Wed, 23 Mar 2016 09:47:42 +0100
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Dan McGregor <danismostlikely@gmail.com>
Date: Wed, 23 Mar 2016 09:47:40 +0100
Message-Id: <1458722860-17353-2-git-send-email-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1458722860-17353-1-git-send-email-u.oelmann@pengutronix.de>
References: <CACS+7ZTw_vCMo5dfGCT9PyUMFvq7QaoXRbK5Ou60Y=m=YGhL_g@mail.gmail.com>
	<1458722860-17353-1-git-send-email-u.oelmann@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [jethro][PATCH] nfs-utils: bugfix: adjust name of statd service unit
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
X-List-Received-Date: Wed, 23 Mar 2016 08:47:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upstream nfs-utils use 'rpc-statd.service' and Yocto introduced
'nfs-statd.service' instead but forgot to update the mount.nfs helper
'start-statd' accordingly.

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 .../files/bugfix-adjust-statd-service-name.patch   | 34 ++++++++++++++++++++++
 .../nfs-utils/nfs-utils_1.3.1.bb                   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/files/bugfix-adjust-statd-service-name.patch

diff --git a/meta/recipes-connectivity/nfs-utils/files/bugfix-adjust-statd-service-name.patch b/meta/recipes-connectivity/nfs-utils/files/bugfix-adjust-statd-service-name.patch
new file mode 100644
index 0000000..14bd403
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/files/bugfix-adjust-statd-service-name.patch
@@ -0,0 +1,34 @@
+From 398fed3bb0350cb1229e54e7020ae0e044c206d1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
+Date: Wed, 17 Feb 2016 08:33:45 +0100
+Subject: bugfix: adjust statd service name
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream uses 'rpc-statd.service' and Yocto introduced 'nfs-statd.service'
+instead but forgot to update the mount.nfs helper 'start-statd' accordingly.
+
+Upstream-Status: Inappropriate [other]
+
+Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
+---
+ utils/statd/start-statd | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/utils/statd/start-statd b/utils/statd/start-statd
+index 8211a90..3c2aa6f 100755
+--- a/utils/statd/start-statd
++++ b/utils/statd/start-statd
+@@ -16,7 +16,7 @@ fi
+ # First try systemd if it's installed.
+ if [ -d /run/systemd/system ]; then
+     # Quit only if the call worked.
+-    systemctl start rpc-statd.service && exit
++    systemctl start nfs-statd.service && exit
+ fi
+ 
+ # Fall back to launching it ourselves.
+-- 
+2.1.4
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
index 42101de..f346fdc 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
@@ -31,6 +31,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://proc-fs-nfsd.mount \
            file://nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch \
            file://nfs-utils-debianize-start-statd.patch \
+           file://bugfix-adjust-statd-service-name.patch \
 "
 
 SRC_URI[md5sum] = "8de676b9ff34b8f9addc1d0800fabdf8"
-- 
2.7.0


