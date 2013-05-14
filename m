Received: from atl4mhfb01.myregisteredsite.com ([209.17.115.55])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1Uc90Q-0007qT-O7
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 08:46:41 +0200
Received: from atl4mhob09.myregisteredsite.com
	(atl4mhob09.myregisteredsite.com [209.17.115.47])
	by atl4mhfb01.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r4E6STdv009056 for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2013 02:28:29 -0400
Received: from mail.hostingplatform.com ([10.30.71.209])
	by atl4mhob09.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r4E6SR61028574 for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2013 02:28:27 -0400
Received: (qmail 374 invoked by uid 0); 14 May 2013 06:28:27 -0000
Received: from unknown (HELO paradigit.TOPIC.LOCAL)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 14 May 2013 06:28:27 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 May 2013 08:28:17 +0200
Message-Id: <1368512897-29997-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] busybox-mdev: Startup at level S03 instead of S06
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 May 2013 06:46:54 -0000

The udev hotplug deamon starts at 03, so mdev should start at the same
point.

This fixes the bug that when modutils (runs at 04) initializes devices
that the mdev hotplug will often not pick them up, resulting in missing
device nodes and similar problems.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/recipes-core/busybox/busybox.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 00c88ab..c8908b0 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -29,7 +29,7 @@ INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hw
 INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
 INITSCRIPT_NAME_${PN}-hwclock = "hwclock.sh"
 INITSCRIPT_NAME_${PN}-mdev = "mdev"
-INITSCRIPT_PARAMS_${PN}-mdev = "start 06 S ."
+INITSCRIPT_PARAMS_${PN}-mdev = "start 03 S ."
 INITSCRIPT_NAME_${PN}-syslog = "syslog"
 INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd" 
 
-- 
1.7.5.4



