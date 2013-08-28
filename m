Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id D6F4A6BA1B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 15:39:25 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Aug 2013 08:39:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,976,1367996400"; d="scan'208";a="287902607"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.7])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Aug 2013 08:39:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Aug 2013 16:39:19 +0100
Message-Id: <1377704359-5104-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] busybox: set default log buffer size to 64 at compile time
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
X-List-Received-Date: Wed, 28 Aug 2013 15:39:34 -0000

This provides a more reasonable log buffer size to avoid losing earlier
events, and 64K is not a problem for modern systems. When the buffer is
used on sysvinit-based systems, which it isn't by default, 64K is already
the runtime default size unless /etc/syslog-startup.conf is modified or
deleted, so this only really affects systems using systemd. This
completely removes the need for the busybox bbappend in meta-oe.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/busybox/busybox-1.21.1/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox-1.21.1/defconfig b/meta/recipes-core/busybox/busybox-1.21.1/defconfig
index bdfdadf..e287a0d 100644
--- a/meta/recipes-core/busybox/busybox-1.21.1/defconfig
+++ b/meta/recipes-core/busybox/busybox-1.21.1/defconfig
@@ -1012,7 +1012,7 @@ CONFIG_FEATURE_SYSLOGD_DUP=y
 CONFIG_FEATURE_SYSLOGD_CFG=y
 CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=256
 CONFIG_FEATURE_IPC_SYSLOG=y
-CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=16
+CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=64
 CONFIG_LOGREAD=y
 CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING=y
 CONFIG_KLOGD=y
-- 
1.8.1.2


