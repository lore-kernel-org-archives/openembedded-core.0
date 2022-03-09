Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C0CC433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 10:03:14 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.3999.1646820193096012514
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 02:03:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nZRKk4zd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5F13D2000F;
	Wed,  9 Mar 2022 10:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646820190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ZxWqiemJ9KZJF/ef3wDoikeW7bGdm4p3hCo3zQZwFA=;
	b=nZRKk4zdfOv8gHVYrTMP0Mm/HyUKHXh7ip+PQ9cXP1iGt9mN0ck6JLMqw4R0CyJ8L04zTP
	E6TCQalfk63fPk76/Nl8zzG1IG8BDMpSUv/NMRROco3e6WCuaryZKQxlVzW/k9utM4fL4w
	KWUxUGDubPDIb23RFhapdZcJZynhs0ANJK/Z+LA0Nu+muh1Uesg2h3byxwV1g/5ZgWFzC7
	wtC4octYHhyaIDk61KI5Y8UT/eSZGC8knwby9gFUaLMoiqlAwHsIgwFRV5Lnbsf4TlQXlt
	MUS7TInRqXHvsylo8Rdp2ntkaE8irc4oqNm1GYAUH+kUDNKtYbs5srjJej6F7g==
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH RESEND] conf/machine: fix QEMU x86 sound options
Date: Wed,  9 Mar 2022 11:02:59 +0100
Message-Id: <20220309100259.607050-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <16CC0B71E636B8E0.7993@lists.openembedded.org>
References: <16CC0B71E636B8E0.7993@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 10:03:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162955

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
index 755d49acd6..ad8489902a 100644
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


