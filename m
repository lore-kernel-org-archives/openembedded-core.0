Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob02.myregisteredsite.com
	(atl4mhob02.myregisteredsite.com [209.17.115.40])
	by mail.openembedded.org (Postfix) with ESMTP id 443EF730F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:32:24 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.207])
	by atl4mhob02.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	v1MEWPsd021873 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 09:32:25 -0500
Received: (qmail 10039 invoked by uid 0); 22 Feb 2017 14:32:25 -0000
X-TCPREMOTEIP: 37.74.225.130
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@37.74.225.130)
	by 0 with ESMTPA; 22 Feb 2017 14:32:24 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 15:32:09 +0100
Message-Id: <1487773929-7952-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] initscripts/sysfs.sh: mount configfs if present
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
X-List-Received-Date: Wed, 22 Feb 2017 14:32:25 -0000

configfs is another kernel virtual file system that should be mounted
if configured, so if it's configured into the kernel, mount it. It is
used to configure e.g. USB gadget mode and devicetree overlays.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh b/meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh
index 0a52c90..f5b5b99 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh
@@ -22,6 +22,10 @@ if [ -e /sys/kernel/debug ] && grep -q debugfs /proc/filesystems; then
   mount -t debugfs debugfs /sys/kernel/debug
 fi
 
+if [ -e /sys/kernel/config ] && grep -q configfs /proc/filesystems; then
+  mount -t configfs configfs /sys/kernel/config
+fi
+
 if ! [ -e /dev/zero ] && [ -e /dev ] && grep -q devtmpfs /proc/filesystems; then
   mount -n -t devtmpfs devtmpfs /dev
 fi
-- 
1.9.1


