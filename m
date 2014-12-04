Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 319 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 04 Dec 2014 10:33:10 UTC
Received: from atl4mhfb01.myregisteredsite.com
	(atl4mhfb01.myregisteredsite.com [209.17.115.55])
	by mail.openembedded.org (Postfix) with ESMTP id 3393760601
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 10:33:10 +0000 (UTC)
Received: from atl4mhob18.myregisteredsite.com
	(atl4mhob18.myregisteredsite.com [209.17.115.111])
	by atl4mhfb01.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	sB4ARuce024866 for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Dec 2014 05:27:56 -0500
Received: from mailpod.hostingplatform.com ([10.30.71.203])
	by atl4mhob18.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	sB4ARqtB032253 for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Dec 2014 05:27:52 -0500
Received: (qmail 15267 invoked by uid 0); 4 Dec 2014 10:27:52 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO paradigit.TOPIC.LOCAL)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 4 Dec 2014 10:27:52 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Dec 2014 11:27:46 +0100
Message-Id: <1417688866-8329-3-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1417688866-8329-1-git-send-email-mike.looijmans@topic.nl>
References: <1417688866-8329-1-git-send-email-mike.looijmans@topic.nl>
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH 2/2] busybox/find-touchscreen.sh: Simplify script and recognize USB devices
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
X-List-Received-Date: Thu, 04 Dec 2014 10:33:16 -0000

Simplify the grep expression, use the more common "grep" command instead
of "egrep", avoid forking extra processes, join multiple invokations into
a single combined expression.

Change the touchscreen regex so that it also recognizes various USB
touchscreen controllers and the ad7879 i2c device.

Based on code used in OpenPLi and meta-topic.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 .../recipes-core/busybox/files/find-touchscreen.sh |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/busybox/files/find-touchscreen.sh b/meta/recipes-core/busybox/files/find-touchscreen.sh
index 1582ea8..52c5e7a 100644
--- a/meta/recipes-core/busybox/files/find-touchscreen.sh
+++ b/meta/recipes-core/busybox/files/find-touchscreen.sh
@@ -1,9 +1,6 @@
 #!/bin/sh
 
-if [ `egrep "input:.*-e0.*,3,.*a0,1,.*18,.*" /sys/class/input/$MDEV/device/modalias|wc -l` -gt 0 ]; then
-	ln -sf /dev/input/$MDEV /dev/input/touchscreen0
+if grep -q "input:.*-e0.*,3,.*a0,1,\|ads7846" /sys/class/$MDEV/device/modalias ; then
+	ln -sf /dev/$MDEV /dev/input/touchscreen0
 fi
 
-if [ `egrep "ads7846" /sys/class/input/$MDEV/device/modalias|wc -l` -gt 0 ]; then
-	ln -sf /dev/input/$MDEV /dev/input/touchscreen0
-fi
-- 
1.7.9.5


