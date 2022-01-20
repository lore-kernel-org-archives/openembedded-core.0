Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87569C433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 17:42:28 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web08.15506.1642700547165175078
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 09:42:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2751F24000B;
	Thu, 20 Jan 2022 17:42:24 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] conf/machine: fix QEMU x86 sound options
Date: Thu, 20 Jan 2022 18:42:22 +0100
Message-Id: <20220120174222.1918081-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 17:42:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160774

This updates the QEMU sounds options for x86 emulation,
when "runqemu" is called with the "audio" argument,
to fix the below error:

runqemu - ERROR - Failed to run qemu: qemu-system-x86_64: warning: '-soundhw ac97' is deprecated, please use '-device AC97' instead

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta/classes/qemuboot.bbclass                  | 2 +-
 meta/conf/machine/include/x86/qemuboot-x86.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index cc1cbce69d..0be3d72149 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -29,7 +29,7 @@
 #
 # QB_AUDIO_DRV: qemu audio driver, e.g., "alsa", set it when support audio
 #
-# QB_AUDIO_OPT: qemu audio option, e.g., "-soundhw ac97,es1370", used
+# QB_AUDIO_OPT: qemu audio option, e.g., "-device AC97", used
 #               when QB_AUDIO_DRV is set.
 #
 # QB_RNG: Pass-through for host random number generator, it can speedup boot
diff --git a/meta/conf/machine/include/x86/qemuboot-x86.inc b/meta/conf/machine/include/x86/qemuboot-x86.inc
index d3b91070a8..b7b6428e44 100644
--- a/meta/conf/machine/include/x86/qemuboot-x86.inc
+++ b/meta/conf/machine/include/x86/qemuboot-x86.inc
@@ -8,7 +8,7 @@ QB_CPU:x86-64 = "-cpu IvyBridge -machine q35"
 QB_CPU_KVM:x86-64 = "-cpu IvyBridge -machine q35"
 
 QB_AUDIO_DRV = "alsa"
-QB_AUDIO_OPT = "-soundhw ac97,es1370"
+QB_AUDIO_OPT = "-device AC97"
 QB_KERNEL_CMDLINE_APPEND = "oprofile.timer=1 tsc=reliable no_timer_check rcupdate.rcu_expedited=1"
 QB_OPT_APPEND = "-usb -device usb-tablet"
 
-- 
2.25.1


