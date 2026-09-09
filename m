Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D14C88E40
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:24 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6330.1788939015027318241
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UtctylrJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b9320423cso62402995e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788939013; x=1789543813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3TsAXj5s84GpEqC5k8/riVCCceTI60eu6933Jo9uEdA=;
        b=UtctylrJITpeZiKkACsRJvVdYMSfYXzXTiA06rXCdeX9UxXB+osSWTPmwv+8AC/xCF
         cuiWMbd3rkJEoej4fD3iMYYiL4uW2R4JqdeeqjQZ7t92k7l58s4kFj41gFQ8qIey1+0s
         Te7OTTZsV8huW+/cQuCnyB8iit/Yy9rqLPHG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939013; x=1789543813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3TsAXj5s84GpEqC5k8/riVCCceTI60eu6933Jo9uEdA=;
        b=FbJ2/vNZRyR3iaNc2S5gT1CnK+Nk1xvN6VayuxQsbT1lYSL3+tfA9Dy7S0yp0/n3vU
         0W+nIoMByDnTM0tF0yQchjwdetIilr8+M6eeVXLf8vN0cu08ImrlKftLdi7uXexlKuEL
         YoTJg8Pks2XHnW0zepmsDdi0lYTJVEqxKvk5F+SfFEbhxBuaEuZhM2Mp36Ao1gvZJq6N
         xnuXKN569uYopVbiOph5HujiHuD3aHLDXKaoss/KQ8HSCKYRYLKThzkmS55mzyEUnPYR
         RhWPYJSE3HeppKNq9YG3iMKqNXknzVJ9YWFMFWs7qU2gwQTer/9s5MJVNpLzd4GhDAYJ
         DPKQ==
X-Gm-Message-State: AFuF++nW13eR13y+TP9Tw7kwpLha2KQmF1j5UTfeBwIc+xUMYKtjjjAB
	/UtZcUSWV+TG6yzA+J4CsD3BN26aPtK7vRDqVuuk+SAdpoNryvKu38V4c8Y3darPN+vzW/AHCti
	KcRDZAoY=
X-Gm-Gg: AYBFou39Xus/qwTLAgrlE4DDS84sONDTpnfF/0nqHpumy5He/6/tHiggtwb6g0n7R7D
	xyvA2eTvZ3CYcFeoABz1wqRq9VL3/h+ZDp3AFvUymszwGzAAcWlyVfxAPLiDvsL1EarAQEfhC8Z
	+Kw1SjY+wlWJP8iMlWG4iwuFj2BMBGHJWU/WBBpA/dx1zlLhmFbx+iduGn+chBHSMCN9zVKwta5
	8e3oeBzRviUGD9PdkzFlyUPurqiPRHxIcLUyik0u5ni6E99BXbbL7tfpqK8jlMoG+NOWPOcalHz
	ioxiRx7Zj/2FPR69DVLfZdLGXFNPKF1GjShjBahjd1cdF8Hq9XUCZMcDqNRgJN9PASFVKODk8+7
	6tT9BssS93DDkw78IrXCLDNvtyt9HaxL9iN9RDql2AF00Hwui4O/GDSVW/CYHCIm460u7iA6816
	1yGXsZfCd8uFhGH2ZM/VZ18H02IEJz0W/lJHrIRlkz/b+YUegkQKRt1swe1HzyGL4ZPG/skORIl
	WKwky5iiUfIkDaOC3D3NNWjKpvPNxrH0DqGrwQfgSNIeNF1Emx2vSlTFse/jMicWnXKvXQBXXn+
	GRdmBSP6QQ==
X-Received: by 2002:a05:600c:1990:b0:49c:f512:2361 with SMTP id 5b1f17b1804b1-49cf82524a2mr517934265e9.14.1788939012996;
        Wed, 09 Sep 2026 00:30:12 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.30.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:30:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 28/38] u-boot-tools: Ignore CVE-2026-29008
Date: Wed,  9 Sep 2026 09:29:27 +0200
Message-ID: <c0c845f478a452116ab9cfda0bb9a78a1a597790.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245437

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- NVD identifies the vulnerable code as net/tcp.c when
  CONFIG_PROT_TCP is enabled [1].
- tools-only_defconfig disables networking, so this code is not built
  into u-boot-tools [2].
- Hence ignoring the CVE for this recipe.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-29008
[2] https://github.com/u-boot/u-boot/blob/v2026.01/configs/tools-only_defconfig

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
index 0e57bb88849..6b28718c54a 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
@@ -2,3 +2,4 @@ require u-boot-common.inc
 require u-boot-tools.inc
 
 CVE_STATUS[CVE-2026-29007] = "not-applicable-config: tools-only_defconfig disables networking; net/tcp.c is not compiled into u-boot-tools."
+CVE_STATUS[CVE-2026-29008] = "not-applicable-config: tools-only_defconfig disables networking; net/tcp.c is not compiled into u-boot-tools."

