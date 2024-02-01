Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9CCC4828D
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 20:47:13 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.6743.1706820427490990621
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 12:47:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net ([70.99.78.136])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 411Kk16o007767;
	Thu, 1 Feb 2024 14:46:02 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Cc: mark.hatle@amd.com, raj.khem@gmail.com, jon.mason@arm.com
Subject: [PATCH v2 1/4] tune-cortexa78.inc: Add cortexa78 tune, based on cortexa77
Date: Thu,  1 Feb 2024 14:45:50 -0600
Message-Id: <1706820353-6967-2-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1706820353-6967-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1706820353-6967-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 20:47:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194746

From: Mark Hatle <mark.hatle@amd.com>

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 .../include/arm/armv8-2a/tune-cortexa78.inc     | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa78.inc

diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa78.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa78.inc
new file mode 100644
index 0000000000..198b94c679
--- /dev/null
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa78.inc
@@ -0,0 +1,17 @@
+#
+# Tune Settings for Cortex-A78
+#
+DEFAULTTUNE                                        ?= "cortexa78"
+
+TUNEVALID[cortexa78] = "Enable Cortex-A78 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa78', ' -mcpu=cortex-a78', '', d)}"
+
+require conf/machine/include/arm/arch-armv8-2a.inc
+
+# Little Endian base configs
+AVAILTUNES                                         += "cortexa78"
+ARMPKGARCH:tune-cortexa78                           = "cortexa78"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-cortexa78                        = "aarch64 crypto cortexa78"
+PACKAGE_EXTRA_ARCHS:tune-cortexa78                  = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto} cortexa78"
+BASE_LIB:tune-cortexa78                             = "lib64"
-- 
2.34.1


