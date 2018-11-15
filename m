Return-Path: <Awais_Belal@mentor.com>
X-Greylist: delayed 950 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 15 Nov 2018 14:46:50 UTC
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id BA01560017
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 14:46:50 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-MBX-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1gNIfc-0000CA-TC from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2018 06:31:00 -0800
Received: from svr-pkl-eng-07.mgc.mentorg.com (137.202.0.90) by
	SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) with Microsoft SMTP
	Server (TLS) id 15.0.1320.4; Thu, 15 Nov 2018 14:30:56 +0000
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Nov 2018 19:30:42 +0500
Message-ID: <20181115143042.13666-1-awais_belal@mentor.com>
X-Mailer: git-send-email 2.11.1
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-07.mgc.mentorg.com (139.181.222.7) To
	SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
Subject: [sumo][PATCH] busybox: enable reboot in defconfig
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
X-List-Received-Date: Thu, 15 Nov 2018 14:46:50 -0000
Content-Type: text/plain

996247ba7dfffbeb444f793f7e105fcfb5ffa939 moved the power
flags (POWEROFF, HALT, REBOOT) to a fragment init.cfg which
is only included when busybox is selected as the init_manager.
This assumption is incorrect in scenarios where installation
mechanism is provided through live images and almost all the
initramfs scripts use the reboot command at the end of installation.
Without this change we see
reboot: not found

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 2 +-
 meta/recipes-core/busybox/busybox/init.cfg  | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 59d93c7079..eb7665dfa2 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -470,7 +470,7 @@ CONFIG_FEATURE_XARGS_SUPPORT_REPL_STR=y
 # CONFIG_FEATURE_BOOTCHARTD_CONFIG_FILE is not set
 # CONFIG_HALT is not set
 # CONFIG_POWEROFF is not set
-# CONFIG_REBOOT is not set
+CONFIG_REBOOT=y
 # CONFIG_FEATURE_CALL_TELINIT is not set
 # CONFIG_TELINIT_PATH is not set
 # CONFIG_INIT is not set
diff --git a/meta/recipes-core/busybox/busybox/init.cfg b/meta/recipes-core/busybox/busybox/init.cfg
index 3c1fdd42b6..3b839c515c 100644
--- a/meta/recipes-core/busybox/busybox/init.cfg
+++ b/meta/recipes-core/busybox/busybox/init.cfg
@@ -2,7 +2,6 @@ CONFIG_INIT=y
 CONFIG_FEATURE_USE_INITTAB=y
 CONFIG_HALT=y
 CONFIG_POWEROFF=y
-CONFIG_REBOOT=y
 CONFIG_FEATURE_KILL_DELAY=0
 CONFIG_TELINIT_PATH=""
 CONFIG_INIT_TERMINAL_TYPE=""
-- 
2.11.1


