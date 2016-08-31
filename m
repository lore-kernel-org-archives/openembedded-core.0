Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob22.registeredsite.com (atl4mhob22.registeredsite.com
	[209.17.115.116])
	by mail.openembedded.org (Postfix) with ESMTP id 63226606D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 13:22:58 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.211])
	by atl4mhob22.registeredsite.com (8.14.4/8.14.4) with ESMTP id
	u7VDMvtD120496 for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 09:22:57 -0400
Received: (qmail 26411 invoked by uid 0); 31 Aug 2016 13:22:57 -0000
X-TCPREMOTEIP: 37.74.225.130
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@37.74.225.130)
	by 0 with ESMTPA; 31 Aug 2016 13:22:57 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Aug 2016 15:22:51 +0200
Message-Id: <1472649771-10124-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] initscripts: Start devpts at 06 instead of 38
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
X-List-Received-Date: Wed, 31 Aug 2016 13:23:00 -0000

For example bootlogd needs devpts to be running, but bootlogd starts
at 07. Starting bootlogd early makes perfect sense, so the best option
here is to move devpts up to 06 to prevent this error message at boot:
cannot allocate pseudo tty: No such file or directory

Systems that have CONFIG_LEGACY_PTYS in the kernel will not see this
message. Since it is called "LEGACY" for a reason, fixing this in
userspace appears to be the better option here.

The devpts script does not need anything except a mounted "/dev" which
has been arranged in "S02sysfs.sh" already.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 148491f..8f110b0 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -138,7 +138,7 @@ do_install () {
 	update-rc.d -r ${D} sysfs.sh start 02 S .
 	update-rc.d -r ${D} populate-volatile.sh start 37 S .
 	update-rc.d -r ${D} read-only-rootfs-hook.sh start 29 S .
-	update-rc.d -r ${D} devpts.sh start 38 S .
+	update-rc.d -r ${D} devpts.sh start 06 S .
 	if [ "${TARGET_ARCH}" = "arm" ]; then
 	        update-rc.d -r ${D} alignment.sh start 06 S .
 	fi
-- 
1.9.1


