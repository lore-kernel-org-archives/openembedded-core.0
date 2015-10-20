Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob02.myregisteredsite.com
	(atl4mhob02.myregisteredsite.com [209.17.115.40])
	by mail.openembedded.org (Postfix) with ESMTP id 8CAC376FF2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 06:43:52 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.205])
	by atl4mhob02.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	t9K6hoLo021437 for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 02:43:50 -0400
Received: (qmail 30615 invoked by uid 0); 20 Oct 2015 06:43:50 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 20 Oct 2015 06:43:50 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Oct 2015 08:43:47 +0200
Message-Id: <1445323427-29234-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] initscripts/sysfs.sh: Mount devtmpfs on /dev/ if needed
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
X-List-Received-Date: Tue, 20 Oct 2015 06:43:55 -0000

When booting from an initrd disk, or when the kernel config option
DEVTMPFS_MOUNT isn't provided, /dev/ will not be mounted at boot.

This small addition will check if /dev/ is "useful", and if not, will
mount devtmpfs if the kernel provides it.

With this change, it is possible to set an initscripts style image type
to "cpio.gz" and boot it as initrd. Without this change, the image won't
work properly because of the missing devices.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh b/meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh
index 0cfe76e..0a52c90 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh
@@ -21,3 +21,7 @@ fi
 if [ -e /sys/kernel/debug ] && grep -q debugfs /proc/filesystems; then
   mount -t debugfs debugfs /sys/kernel/debug
 fi
+
+if ! [ -e /dev/zero ] && [ -e /dev ] && grep -q devtmpfs /proc/filesystems; then
+  mount -n -t devtmpfs devtmpfs /dev
+fi
-- 
1.9.1


