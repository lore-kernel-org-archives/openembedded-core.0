Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20733C88E5D
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 22:16:02 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50893.1789164952255613770
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 15:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=biMdg2VD;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so1967905e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 15:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789164950; x=1789769750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nAYu83NUihV8yhAk+YaLXMx6JOScET0E9BQeu4jPkGc=;
        b=biMdg2VDiPx9BjL4Dqtb2ycrZLjn7NI0dX8N6rCGPuQE1EQ6F/MJldfgqMRJ2fEFcx
         GgRqlW1jBm91VXiUJlzuUUND6RpqL+J4QjYp211RJ+k5vvCldd48NvCns52VfhJFnGWF
         yW0I12JzGcPVBUO06FveKNSCIUHvaoyMbOt1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164950; x=1789769750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nAYu83NUihV8yhAk+YaLXMx6JOScET0E9BQeu4jPkGc=;
        b=Qw5vYg4OYBuFlUrNnTnHbCdr0o/W2UMtWxF3OZ86ipw3C4aMpQY0VvR92ghvBUzUpI
         8oQokvJ8Fa704tHrvqSS6fNX00hY6QHsp8LqCMPSAhqEPTWs87eUuoBWJzKS0kX1Lah6
         yucbiAWZGQEnIGZdieDxUPFlPZ71PLjOXUGdBcXUSdRJOK5SEAnJXoMDqVYBmeYdCAf8
         rkTQWpW3TZhngIF8IHE5aXdPSqzHSbLGKtTsTWH3z7Ryg4Cdg7JTlCH0b1sW9cZMNdCM
         qiENWTe60Dix5warbAGVieYc/6A4OAKuYYpZ2yMaAdrv2a83t7q6Hwvu3ZiwMiksBiEZ
         fMag==
X-Gm-Message-State: AFuF++ny8/Ciaydi+ZXtDPAHcfUU3P3kylXEg/XR3tLeZamN29Xzucd6
	kHKHxDRWDqJXGOEgn45W1eY6JCjevw1wj4YB/rjw0C9WNHkLlGuD0T4eJThKeqdbu8jxoNTdhTO
	yvMzzB+c=
X-Gm-Gg: AYBFou2R9oHpt/P/E9bF6/IOeIh6wnrlhlZiUtUP+v/r/jaO3ZqO7EPE2Tp3M2TcY5/
	0JUw/ULDpI7/uLLE5F4KnOzrkl7tbh/b0OjNTxHLSL6aXYjTIQ5Yo/9hV4hZTMKVv7MDj6123Un
	gEWRNyKSGMabKS96bzh8MxOpbeCm+YEEr2c2DexBx1JoxGNjkFiiZsV97VulA6Wx4AjbzFeAgsa
	jBEJk0SK9PAmnTFOQd1CRniFy+Mfb/Rp2q7a7YE2m3OZO1v6MqGcpON99KsQt/3mW0aWPVf9/M2
	alb1wazslrceFdtcTKXjM4Qh1B3d4P9jsOxvCjJVGF+1R7ikfhch1XWfpWGVADhKF48bouDHmTo
	xvhSXyoooxv08ikl0YRtOoyLevaNG24XXRW0MIAyp6JIrMqJ5JlUa6RYYrdsqX49QrVlNs4icYP
	Aw1J1YMAaXkuYNFJ9/hwSgx/GHoGh2lCNiVvIfTjd0vHLfHRVCwBiQOLH7kV5p98tNYwPV83q0u
	kpU4hQNKHiwc1UQq/O9zdC7hQft2rw6VGMLzQwKuIvgsRnzEC3m3R83P81pxFv+nAtr2a3tDsA=
X-Received: by 2002:a05:600c:a40e:b0:49e:65ac:eb5f with SMTP id 5b1f17b1804b1-49e65aced4bmr95420965e9.10.1789164950388;
        Fri, 11 Sep 2026 15:15:50 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm8434045e9.11.2026.09.11.15.15.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:50 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/13] u-boot: share CVE_PRODUCT with u-boot-tools
Date: Sat, 12 Sep 2026 00:15:06 +0200
Message-ID: <3efc243b9260e393d88ece4dc445551726f688c7.1789163914.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789163914.git.yoann.congal@smile.fr>
References: <cover.1789163914.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 22:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245682

From: Devansh Patel <devanshp@cisco.com>

u-boot-tools builds host utilities from the same source as u-boot, but it
does not inherit the existing CVE_PRODUCT assignment and falls back to its
unrecognized recipe-name identity.  Move the mapping to u-boot-common.inc
so both recipes inherit it.

Use "u-boot:u-boot" for the CNA/CVE List V5 affected-data identity and
"denx:u-boot" for the NVD dictionary CPE and configuration identity.  The
CNA records are also covered by NVD today, but retaining both authoritative
identities permits direct matching independently of NVD enrichment.

(cherry picked from commit bc30a343627e2d207c38d2262a7b07f506259051)

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc | 2 ++
 meta/recipes-bsp/u-boot/u-boot.inc        | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 5f6bd44ab77..27e6ac9db5b 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -10,6 +10,8 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
 PE = "1"
 
+CVE_PRODUCT = "u-boot:u-boot denx:u-boot"
+
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
 SRCREV = "866ca972d6c3cabeaf6dbac431e8e08bb30b3c8e"
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 00dda93b4ac..7935f2b4aa4 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -19,8 +19,6 @@ PACKAGECONFIG ??= "openssl"
 # a host build dependency.
 PACKAGECONFIG[openssl] = ",,openssl-native"
 
-CVE_PRODUCT = "denx:u-boot"
-
 # Allow setting an additional version string that will be picked up by the
 # u-boot build system and appended to the u-boot version.  If the .scmversion
 # file already exists it will not be overwritten.

