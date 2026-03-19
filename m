Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 350D01090256
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 16:35:33 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.457.1773938129359709493
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 09:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=0cuqFeu9;
 spf=pass (domain: baylibre.com, ip: 209.85.222.182, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8cfc2d1fdbfso47995085a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 09:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773938127; x=1774542927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wvabTcHeBg7y+cgeUjIxT/UX9VV5W30AygCE/lKckPk=;
        b=0cuqFeu94dgb4JznuO+y3akhrTuHBmSWki5+EA2Oso4bajCwVGGtENHk/73I3tfiP3
         uY0sui/jmUwBElvaQTfXj78CYrYrq9hU4PaoHh8cLrVnQe0xJ4XpA+AVRmUIk/6YVroR
         BZeKMsPQ7j0Koq+ryltE/v0Xce19tU4E+RfQIoLY8p7liMt4x0WY4m0DsaAkPBNOxtOh
         2O8F3cEuG137cF/6lpeq39n/TpiSOMmBfPncu8kVGT/0eY83vgkXbeW0btq5HvF4skuY
         hkpOWPnk+CCqpCsTJt1Ncc8TUaPU+zpQOpAYFi+3pNfnyTwJ/OjWo8rjwXbU+2vA4chf
         76fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773938127; x=1774542927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wvabTcHeBg7y+cgeUjIxT/UX9VV5W30AygCE/lKckPk=;
        b=O52aR8iryYdWbaw4Mx9I/Czu3kyRKK/+gkta3+4Dk5Tv9b7YcaHOY9xvT/UP1xMFWk
         a8fJYAIUdtF7FH/B+XR6DViIZAW3udt0/Sq3Ds6ZcPkN+7SsibqLURfNzSAZlxSvY8sv
         LekQ1n0HhErNinRfChkbPuhJCoXegFOg6YZuHlNEBl5BMNOc6FNiAtKWeaQgrV9dtr8C
         0pCezSyAe6AxBHfvTCR2yBfo6Qf/Vyqi4doifU5yUeVhAH7ZBl5B/cDCmeg5RTMInOuF
         mA/BaQDCQdSoBzC32d4zOQ17lzC9byWHCdWC442Rl+cgLobE+70zlm7LmPNJQcjW31my
         BN7w==
X-Gm-Message-State: AOJu0YwElL/h1oMX1W2weSNbmTHUlIrIelt9CDWqEjwS9r4pPKdlB/8o
	OCPZNfaJuUy/4/pWrHCFQStamNPZcHSlmqjhU6yNc7dZA1F+1zwcBq4OdZC4d9KV3JLam4ZgXGZ
	iO5N6YmA=
X-Gm-Gg: ATEYQzys2xnbTzBqIVlYZGPSmeN6/0oXdQPk5GBEKbpKqUB73BkXDjhkLXh9mjdFhXm
	OYPaoAxURFLXIBZSr1AqPxQOtYfUqPm+Cwn/p4liJuHw3+27D4BgV3HUBCG6Q1wo+YO3zx2MJCU
	A9bbQbbPWgHv/b1hSGjS8CIILwQmWMX2nlbr5kjrdwpv3K/Z/lnqGfRtGGYQBIEO3cDDxpAYPqD
	0ysL4QNYpzf3MuEk8XZJuvSa6hTs58w8pOXJzyxTsr6VVdQ4fo8HZZU8DJbpjQmCzwHI5u9I9R0
	wlE7zytIhBKRPs6SEdjmcQ3+2RKb1sxH/RtDoL5Mwe5pod040A+nfG6tNah4mEmyWOR9H2RKP4v
	fmlm4asqJfc/o82WC8JKm5JG3kcLrg2G9uSGmzJv3GHluFPb8Y0aaZ9yWFPIgCbk6LkkSE7yaHn
	SWnjRuEZXfo4nMGpQrSFvBrFwkUuI=
X-Received: by 2002:a05:620a:3710:b0:8cd:8938:f007 with SMTP id af79cd13be357-8cfad221e2dmr1098743485a.11.1773938127081;
        Thu, 19 Mar 2026 09:35:27 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfacde4598sm584347585a.15.2026.03.19.09.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 09:35:26 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com
Subject: [OE-core][PATCH] qemuboot-x86: add qemux86 kvm workaround
Date: Thu, 19 Mar 2026 12:35:24 -0400
Message-ID: <20260319163524.45554-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 16:35:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233543

[YOCTO #16074]

As per the bug listed, investigation of an intermittent failure with
KVM-enabled qemux86 VMs has shown that there is a possible issue with a
spectre v2 retpoline mitigation when running on hosts with certain Intel
CPUs, e.g. the Intel Ultra 7 265. We have confirmed that disabling the
KVM paravirtualized clock prevents the failure; so for now, avoid it by
specifying '-cpu IvyBridge,kvmclock=off' instead of simply '-cpu
IvyBridge' in qemuboot-x86 for the KVM case.

Note that this issue does not affect qemux86-64.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/machine/include/x86/qemuboot-x86.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/x86/qemuboot-x86.inc b/meta/conf/machine/include/x86/qemuboot-x86.inc
index 82ef4a0b73..abdbc12fa1 100644
--- a/meta/conf/machine/include/x86/qemuboot-x86.inc
+++ b/meta/conf/machine/include/x86/qemuboot-x86.inc
@@ -2,7 +2,7 @@
 IMAGE_CLASSES += "qemuboot"
 QB_SMP ?= "-smp 4"
 QB_CPU:x86 ?= "-cpu IvyBridge -machine q35,i8042=off"
-QB_CPU_KVM:x86 ?= "-cpu IvyBridge -machine q35,i8042=off"
+QB_CPU_KVM:x86 ?= "-cpu IvyBridge,kvmclock=off -machine q35,i8042=off"
 
 QB_CPU:x86-64 ?= "-cpu Skylake-Client -machine q35,i8042=off"
 QB_CPU_KVM:x86-64 ?= "-cpu Skylake-Client -machine q35,i8042=off"
-- 
2.53.0


