Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 389D7C02196
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 17:44:12 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.94494.1738604642080259395
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 09:44:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 513Hi0ku021685
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Feb 2025 11:44:01 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemuboot.bbclass: Fix QB_DEFAULT_KERNEL expansion
Date: Mon,  3 Feb 2025 11:44:00 -0600
Message-Id: <1738604640-31507-1-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 17:44:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210725

QB_DEFAULT_KERNEL was not being expanded unless INITRAMFS_LINK_NAME
was defined.  This only happens when building a kernel with an
integrated (bundled) initramfs.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes-recipe/qemuboot.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
index 0f80c60..ee71a2f 100644
--- a/meta/classes-recipe/qemuboot.bbclass
+++ b/meta/classes-recipe/qemuboot.bbclass
@@ -96,6 +96,9 @@
 QB_MEM ?= "-m 256"
 QB_SMP ?= ""
 QB_SERIAL_OPT ?= "-serial mon:stdio -serial null"
+# Define INITRAMFS_LINK_NAME to ensure that QB_DEFAULT_KERNEL expands,
+# even when INITRAMFS_LINK_NAME would not otherwise be defined.
+INITRAMFS_LINK_NAME ??= ""
 QB_DEFAULT_KERNEL ?= "${@bb.utils.contains("INITRAMFS_IMAGE_BUNDLE", "1", "${KERNEL_IMAGETYPE}-${INITRAMFS_LINK_NAME}.bin", "${KERNEL_IMAGETYPE}", d)}"
 QB_DEFAULT_FSTYPE ?= "ext4"
 QB_RNG ?= "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
-- 
1.8.3.1


