Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A2512731D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 07:29:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3B7TMeQ020260
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 00:29:22 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 11 Apr 2016 00:29:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Apr 2016 00:29:08 -0700
Message-ID: <8281f1f46c2876587c0193adb44b8687ea6642bb.1460359568.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1460359568.git.liezhi.yang@windriver.com>
References: <cover.1460359568.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/14] nfs-utils: bugfix: adjust name of statd service unit
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
X-List-Received-Date: Mon, 11 Apr 2016 07:29:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Ulrich Ölmann <u.oelmann@pengutronix.de>

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
2.7.4


