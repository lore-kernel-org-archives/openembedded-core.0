Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id 9E3396CA7C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2013 10:54:23 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r92AsL6G019657; 
	Wed, 2 Oct 2013 05:54:23 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Oct 2013 15:55:32 +0500
Message-Id: <1380711332-10808-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] systemd-compat-units: Use correct run-postinsts script link
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
X-List-Received-Date: Wed, 02 Oct 2013 10:54:23 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

OE-Core commit 75a14923da1ba91eddde47f0907345c19c82d6f0 has moved
run-postinsts script execution from S98 to S99 in rcS.d. run-postinsts.service
should check for this script and run it on first boot rather than
S98run-postinsts, which is for opkg/dpkg.

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 .../systemd-compat-units/run-postinsts.service     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service b/meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
index 02c1d86..4ebc234 100644
--- a/meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
+++ b/meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
@@ -1,12 +1,12 @@
 [Unit]
 Description=Run pending postinsts
 DefaultDependencies=no
-ConditionPathExists=|/etc/rcS.d/S98run-postinsts
+ConditionPathExists=|/etc/rcS.d/S99run-postinsts
 After=systemd-remount-fs.service systemd-tmpfiles-setup.service tmp.mount
 Before=sysinit.target
 
 [Service]
-ExecStart=/etc/rcS.d/S98run-postinsts
+ExecStart=/etc/rcS.d/S99run-postinsts
 RemainAfterExit=No
 Type=oneshot
 StandardOutput=syslog
-- 
1.7.9.5


