Return-Path: <Zhenbo.Gao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD90E6012C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 07:46:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u297k41S004474
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Mar 2016 23:46:04 -0800 (PST)
Received: from pek-zgao-d1.corp.ad.wrs.com (128.224.162.191) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 8 Mar 2016 23:46:04 -0800
From: Zhenbo Gao <zhenbo.gao@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <zhenbo.gao@windriver.com>
Date: Wed, 9 Mar 2016 15:45:08 +0800
Message-ID: <1457509508-5800-1-git-send-email-zhenbo.gao@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] initscripts: correct the runlevels for urandom
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
X-List-Received-Date: Wed, 09 Mar 2016 07:46:05 -0000
Content-Type: text/plain

The description of urandom is: Save the random seed on shutdown
and restore it on boot.

So this script should be used with 'stop' at runlevel 0 and 6, and
'start' at runlevel 1 2 3 4 5.

Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/urandom | 2 +-
 meta/recipes-core/initscripts/initscripts_1.0.bb      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/urandom b/meta/recipes-core/initscripts/initscripts-1.0/urandom
index af1625b..8cb1b57 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/urandom
+++ b/meta/recipes-core/initscripts/initscripts-1.0/urandom
@@ -3,7 +3,7 @@
 # Provides:          urandom
 # Required-Start:    $local_fs mountvirtfs
 # Required-Stop:     $local_fs
-# Default-Start:     S
+# Default-Start:     1 2 3 4 5
 # Default-Stop:      0 6
 # Short-Description: Save and restore the random seed
 # Description:       Save the random seed on shutdown and restore it on boot,
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 148491f..a0aa124 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -123,7 +123,7 @@ do_install () {
 #
 	update-rc.d -r ${D} rmnologin.sh start 99 2 3 4 5 .
 	update-rc.d -r ${D} sendsigs start 20 0 6 .
-	update-rc.d -r ${D} urandom start 38 S 0 6 .
+	update-rc.d -r ${D} urandom start 38 1 2 3 4 5 . stop 62 0 6 .
 	update-rc.d -r ${D} umountnfs.sh start 31 0 1 6 .
 	update-rc.d -r ${D} umountfs start 40 0 6 .
 	update-rc.d -r ${D} reboot start 90 6 .
-- 
1.9.1


