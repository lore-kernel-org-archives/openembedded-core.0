Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F63EEF333
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 08:55:51 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39957.1772700950160086952
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 00:55:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=i9QcqZth;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439c944bb62so1211079f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 00:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772700948; x=1773305748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zdaMzEodhNxK4FzPXn5r1stqGhDppxkJrKueAaSt3rc=;
        b=i9QcqZth2JUMIPKtMlOoiizOdsjUco73Vk5G6JZ/9lvtfDW59Wias9yk+1nJ477FpM
         aAHZwwJe1pgC55gb7JbrP+1ZuyOxXgxzDLveHMS//GPBRi15aYdeNe5/7DufEInivnDf
         7198LRv9a0Bedfp1CwDoRcPiA09FPMFr+lP2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772700948; x=1773305748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zdaMzEodhNxK4FzPXn5r1stqGhDppxkJrKueAaSt3rc=;
        b=bQ71CN8sTVq9rhMWzcA0auzGnaW/R3ZmgBHIjQaTVz2RuIRYVZPAoSl78PAGljsPmP
         R7R5qHe0BEL7y1C4w0AUgQP6hBG7paZ2H9zvKn14yrmKm0XN0ias3Xql4qoz/5yXLdD7
         EiovW9VtDvj0Q02ui7saqc+RbbVstnyLrxCR4almLLm1nX89AUs1mut8mGHDhNFyzenf
         AfdPV3ucqHOmlhenuLoyqQyfBxwtDeOTLMRY35qbhUKDeUEFcklMGawkEtscUzQ0YBFs
         rzGYEJ/bBDohHfg9YOooNxI4IZda59dDnA+ZQStnUVJxZLytGTTQkP/erFunndRsGboM
         Svmw==
X-Gm-Message-State: AOJu0YzFx/nyNqKYJHQgAXn9ELDldi0XXCW3BxYKSHCAsPUJt/aQ+VLM
	IIyVZAVBFrXHXxelX3KwBV5RR/xLw/tr5KoQIcoAcFXgcWpPniqQWTS5t2P+A+Xkba5aain2YFq
	7jxbd
X-Gm-Gg: ATEYQzwWyGK5raYiQ44VuJX+PRWkvbxEsKwK0iDObIxv7wUOEoRomsfbooIV9mKhGnP
	wMu8bgptwixotk1vBPSH/VdQX5/tysoo9aPzi6uNDKQpPM+fZeTKWYOX92kI9uqxZvplWAm4KQ8
	63+qOum2afkmQgWPM7jfGLtFRQY3FgnoeOTVE7ZtwGR/FTynKdgNEGaLcWQA0Vx2Oq53eRsDTkS
	/DdlSvFnNivz71TTR70OJhK+peHALM0pc5M2llZifGDH4VdlEm1YgCCNRGudB5ZzlLnMFIswgyn
	8emooaTUYHDIRscvKS37XX1jhxWTZLEItOjp2ajwybUAHuef5/Os1WYq+mQDyNtqDv5ALt3hc4U
	cflG87nsN5ujMpS18YljW2NwmLepyx8jZoY1eGNbt3V/irDrG5ljJdcubqNZb84YBY0tAnrXkqD
	8MY3+kqDJOkDfxuFuUFAIY8r6FSA1Z/bRF2f2NYO/CcTkBBXGdEK6cu/lVAA5qG7ZcBalXPd3Ts
	JXdLyd1QQ45fDCwcnWMk11DU2gz
X-Received: by 2002:a05:600c:8105:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-4851983bf08mr72690695e9.6.1772700948295;
        Thu, 05 Mar 2026 00:55:48 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00675b4cbd8c1678f5.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:675b:4cbd:8c16:78f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb27a20sm59405175e9.9.2026.03.05.00.55.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 00:55:47 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 04/12] linux-yocto: apply cve-exclusions also to rt and tiny recipe variants
Date: Thu,  5 Mar 2026 09:54:53 +0100
Message-ID: <b601ac4e4ec910633a9f5168d1a21fadef32d9ba.1772700454.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772700454.git.yoann.congal@smile.fr>
References: <cover.1772700454.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 08:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232456

From: Peter Marko <peter.marko@siemens.com>

Version is the same as base kernel, only configuration differs.
There is no reason to not apply the exclusions to all variants.

This commit is equivalent of master commit
77fb0331ecc0cb9eff6a711c2a7889f2f6bdda92

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   | 1 +
 meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb   | 1 +
 meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb | 1 +
 meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb | 1 +
 4 files changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index e720629b14d..5816902a7ff 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -3,6 +3,7 @@ KBRANCH ?= "v6.12/standard/preempt-rt/base"
 require recipes-kernel/linux/linux-yocto.inc
 
 # CVE exclusions
+include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
 # Skip processing of this recipe if it is not explicitly specified as the
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
index d1f7e76501d..2b54315670b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
@@ -3,6 +3,7 @@ KBRANCH ?= "v6.16/standard/preempt-rt/base"
 require recipes-kernel/linux/linux-yocto.inc
 
 # CVE exclusions
+include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.16.inc
 
 # Skip processing of this recipe if it is not explicitly specified as the
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 164557eaa0a..5828ff986bd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -6,6 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 require recipes-kernel/linux/linux-yocto.inc
 
 # CVE exclusions
+include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
 LINUX_VERSION ?= "6.12.69"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
index ef904adad48..92c26d42e3d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
@@ -6,6 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 require recipes-kernel/linux/linux-yocto.inc
 
 # CVE exclusions
+include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.16.inc
 
 LINUX_VERSION ?= "6.16.11"

