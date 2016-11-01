Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 325 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 01 Nov 2016 13:36:38 UTC
Received: from atl4mhfb03.myregisteredsite.com
	(atl4mhfb03.myregisteredsite.com [209.17.115.119])
	by mail.openembedded.org (Postfix) with ESMTP id 751346078D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 13:36:37 +0000 (UTC)
Received: from atl4mhob03.myregisteredsite.com
	(atl4mhob03.myregisteredsite.com [209.17.115.41])
	by atl4mhfb03.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	uA1DVFuB023170 for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Nov 2016 09:31:15 -0400
Received: from mailpod.hostingplatform.com ([10.30.71.207])
	by atl4mhob03.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	uA1DVAig010341 for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Nov 2016 09:31:10 -0400
Received: (qmail 12990 invoked by uid 0); 1 Nov 2016 13:31:10 -0000
X-TCPREMOTEIP: 37.74.225.130
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@37.74.225.130)
	by 0 with ESMTPA; 1 Nov 2016 13:31:10 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2016 14:30:56 +0100
Message-Id: <1478007056-16301-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] busybox/mdev.conf: Ignore eMMC RPMB and boot block devices
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
X-List-Received-Date: Tue, 01 Nov 2016 13:36:38 -0000

eMMC devices may report block devices like "mmcblk0rpmb" and
"mmcblk0boot0". These are not actually block devices and any
read/write operation on them will fail. To prevent spamming error
messages attempting to mount them, just ignore these devices.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/recipes-core/busybox/files/mdev.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/busybox/files/mdev.conf b/meta/recipes-core/busybox/files/mdev.conf
index 17e93da..4e9c23f 100644
--- a/meta/recipes-core/busybox/files/mdev.conf
+++ b/meta/recipes-core/busybox/files/mdev.conf
@@ -39,4 +39,6 @@ input/mouse.* 0:0 0660
 tun[0-9]* 0:0 0660 =net/
 
 [hs]d[a-z][0-9]? 0:0 660 */etc/mdev/mdev-mount.sh
+mmcblk[0-9]rpmb 0:0 660
+mmcblk[0-9]boot[0-9] 0:0 660
 mmcblk[0-9].* 0:0 660 */etc/mdev/mdev-mount.sh
-- 
1.9.1


