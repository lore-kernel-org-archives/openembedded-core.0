Return-Path: <code@reto-schneider.ch>
X-Greylist: delayed 2054 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 18 Sep 2018 22:29:22 UTC
Received: from mxout017.mail.hostpoint.ch (mxout017.mail.hostpoint.ch
	[217.26.49.177])
	by mail.openembedded.org (Postfix) with ESMTP id A7DE9744DA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 22:29:22 +0000 (UTC)
Received: from [10.0.2.45] (helo=asmtp012.mail.hostpoint.ch)
	by mxout017.mail.hostpoint.ch with esmtp (Exim 4.91 (FreeBSD))
	(envelope-from <code@reto-schneider.ch>)
	id 1g2Nxd-000AzN-5g; Tue, 18 Sep 2018 23:55:09 +0200
Received: from [2a02:168:603b:1:5414:13f1:25c:1b29]
	(helo=ryzen2700.dss.husqvarnagroup.com)
	by asmtp012.mail.hostpoint.ch with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.91 (FreeBSD))
	(envelope-from <code@reto-schneider.ch>)
	id 1g2Nxd-000ISm-3Y; Tue, 18 Sep 2018 23:55:09 +0200
X-Authenticated-Sender-Id: reto-schneider@reto-schneider.ch
From: Reto Schneider <code@reto-schneider.ch>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2018 23:54:28 +0200
Message-Id: <20180918215428.18617-1-code@reto-schneider.ch>
X-Mailer: git-send-email 2.11.0
Cc: Reto Schneider <reto.schneider@husqvarnagroup.com>
Subject: [PATCH] kernel-uimage.bbclass: Dependency on u-boot-mkimage-native for all uImages
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
X-List-Received-Date: Tue, 18 Sep 2018 22:29:23 -0000

From: Reto Schneider <reto.schneider@husqvarnagroup.com>

u-boot-mkimage-native is needed to build any type of uImages, be it
the uImage target itself or for example uImage.lzma. The dependency
however gets only added when at least one of KERNEL_IMAGETYPE and
KERNEL_ALT_IMAGETYPE is exactly uImage. Building uImage.bin and uImage.lzma is
not possible this way.

This patch adds a dependency to u-boot-mkimage-native for all imagetypes which
contains the string uImage.

Signed-off-by: Reto Schneider <code@reto-schneider.ch>
---
 meta/classes/kernel-uimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
index 1d8656e76e..c2de6bb40d 100644
--- a/meta/classes/kernel-uimage.bbclass
+++ b/meta/classes/kernel-uimage.bbclass
@@ -1,7 +1,7 @@
 inherit kernel-uboot
 
 python __anonymous () {
-    if "uImage" in (d.getVar('KERNEL_IMAGETYPES') or "").split():
+    if "uImage" in d.getVar('KERNEL_IMAGETYPES'):
         depends = d.getVar("DEPENDS")
         depends = "%s u-boot-mkimage-native" % depends
         d.setVar("DEPENDS", depends)
-- 
2.11.0


