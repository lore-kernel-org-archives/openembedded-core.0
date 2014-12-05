Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob07.myregisteredsite.com
	(atl4mhob07.myregisteredsite.com [209.17.115.45])
	by mail.openembedded.org (Postfix) with ESMTP id B790572304
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 09:59:05 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.211])
	by atl4mhob07.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	sB59x5Md024527 for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Dec 2014 04:59:05 -0500
Received: (qmail 29216 invoked by uid 0); 5 Dec 2014 09:59:05 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO paradigit.TOPIC.LOCAL)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 5 Dec 2014 09:59:05 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Dec 2014 10:58:59 +0100
Message-Id: <1417773539-19172-2-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1417773539-19172-1-git-send-email-mike.looijmans@topic.nl>
References: <1417688866-8329-1-git-send-email-mike.looijmans@topic.nl>
	<1417773539-19172-1-git-send-email-mike.looijmans@topic.nl>
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH 2/2] busybox-mdev: Add hotplug kernel module support to mdev.conf
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
X-List-Received-Date: Fri, 05 Dec 2014 09:59:13 -0000

Add a line to mdev.conf that tells mdev to load kernel modules when
required.

For example, if you built wifi support as an external module, inserting
a wifi stick into a USB port will now automatically load that module
into the kernel and the wlan device will be ready for configuration.
Without this patch, you have to load required modules manually or force
them to load at system startup.
---
 meta/recipes-core/busybox/files/mdev.conf |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/busybox/files/mdev.conf b/meta/recipes-core/busybox/files/mdev.conf
index c83bb4c..17e93da 100644
--- a/meta/recipes-core/busybox/files/mdev.conf
+++ b/meta/recipes-core/busybox/files/mdev.conf
@@ -1,3 +1,5 @@
+$MODALIAS=.* 0:0 660 @modprobe "$MODALIAS"
+
 console 0:0 0600 
 cpu_dma_latency 0:0 0660 
 fb0:0 44 0660 
-- 
1.7.9.5


