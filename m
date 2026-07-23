Return-Path: <nora.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0FC2C531CA
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 12:50:19 +0000 (UTC)
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22771.1784811015229973925
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 05:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ew.tq-group.com header.s=default2602 header.b=gwobsp1x;
 spf=pass (domain: ew.tq-group.com, ip: 188.40.3.216, mailfrom: nora.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=RO5HAgdbcPU+3UrMRgFuEemUShW4IzCEhz3+aERZQ2M=; b=gwobsp1x6KoQ0+a6VNA3SgDSz0
	7Volkk3yjEJdD73ZECayRndS8ljOL511ndxB76GxKZkrHzR8ddlR8SCwVCxZXn021swC2G0MIffmW
	SFbk0P6gY52UE9+apOLHk1MyNInpoC1qribaYfy8VwD1RWmGlc6DUoBeC4PGLto7paig+EYLvyNOa
	YyaGNXStsgADkKtWt15tKU96G/jB6AYGXM/b5OAiMvV9p1xiN3fQ9fPhhOSAyWPMZvktmnJKkw3Nw
	GdHSqRCEJJB2rKiu1al3MzX3NpFMvSP+kGZKuoLL4YdA2ROfCOPutHmo2GTaLQH70r9fNGclAMRkx
	dOPhjhiA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wmssP-000KwK-0i;
	Thu, 23 Jul 2026 14:50:13 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wmssO-0001T4-24;
	Thu, 23 Jul 2026 14:50:12 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: oss@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH 1/3] kernel-uboot: move FIT_KERNEL_COMP_ALG to image-fitimage.conf
Date: Thu, 23 Jul 2026 14:49:42 +0200
Message-ID: <20260723124944.69070-2-nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260723124944.69070-1-nora.schiffer@ew.tq-group.com>
References: <20260723124944.69070-1-nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28069/Thu Jul 23 08:24:48 2026)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 12:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241832

Move the default setting to the config with the other FIT_* variables.

It is a bit weird that FIT_KERNEL_COMP_ALG also affects uImage creation,
as kernel-uboot.bbclass is used for both, but fixing that would
unnecessarily break backwards compatibility.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 meta/classes-recipe/kernel-uboot.bbclass | 3 +--
 meta/conf/image-fitimage.conf            | 3 +++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel-uboot.bbclass b/meta/classes-recipe/kernel-uboot.bbclass
index fa28be1715..9beccc2dff 100644
--- a/meta/classes-recipe/kernel-uboot.bbclass
+++ b/meta/classes-recipe/kernel-uboot.bbclass
@@ -4,8 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-# fitImage kernel compression algorithm
-FIT_KERNEL_COMP_ALG ?= "gzip"
+require conf/image-fitimage.conf
 
 # Kernel image type passed to mkimage (i.e. kernel kernel_noload...)
 UBOOT_MKIMAGE_KERNEL_TYPE ?= "kernel"
diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
index a06d30e494..abb17186a5 100644
--- a/meta/conf/image-fitimage.conf
+++ b/meta/conf/image-fitimage.conf
@@ -48,6 +48,9 @@ FIT_OS ?= "linux"
 # DTBs are provided separately in a FIT image.
 FIT_LINUX_BIN ?= "linux.bin"
 
+# fitImage kernel compression algorithm
+FIT_KERNEL_COMP_ALG ?= "gzip"
+
 # Additional mkimage options for FIT image creation
 FIT_MKIMAGE_EXTRA_OPTS ?= ""
 
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


