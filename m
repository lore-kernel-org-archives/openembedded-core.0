Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5849FC28B2F
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 11:20:24 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.11880.1741951216977454165
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 04:20:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=pFLxv0tx;
 spf=pass (domain: linaro.org, ip: 209.85.208.182, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30bfc79ad97so31591571fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 04:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741951215; x=1742556015; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xULRQVdTY/LxRb9S1oZ219XVrnqgSCEV0rTfQfvvQAA=;
        b=pFLxv0txW4mAebprqQDctdE7RbbV/vS+MUI0FthITFij5xjRWgYHpjfCGCnyidBp6X
         QeIbdWCO3/HlWZXUi2jam7U0gxgdP1EtPL5r+WIm4kT+pvyPNB+28C9ojlxGkzbhwog+
         90zo5mBI1gFR0PLwwONN1hXHWEz3Cffc6xpO/Do30kRPBeY/Xpv08uSRDsAGblaIvrbq
         Nds2YC35WM18M5TZdofgT2n9ccWarRL3WGhw3l7nDbix7ySFRuCGKRAWhAdz18Do4WO0
         GYaTZc1oD0OuECAXGctjzmDK9YHab6W70fw8sneDY82pu9aYshIeDVAonOQ1bygt5tMF
         bkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741951215; x=1742556015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xULRQVdTY/LxRb9S1oZ219XVrnqgSCEV0rTfQfvvQAA=;
        b=ZXV2NzfvEGc6mei8dgjePGyXADOSxGa2rTFVN1d+Q1n9qgeeC8uXWy7vgjRLWyxJII
         q0MKwd5gZvPa/fiIj+dUTfT1QZlbyYmfH6shEHMwxCcB5X4kLM1Zi4SJC6LevnJq/zuY
         kDsA+2AakIAItDqxe9+g6UURIelJvNXtHMp9hpWJ+pX5oyblaGD089w9F6gMafhAFvk6
         r2rHSWV+XqGWIjlKwskQ1zK2Uc1UKyaaXP66iNI02yDMoEfVwzo2dHLGF/qU5wkiZnOc
         YgByrwx9KRlS/37nz/y5FCx0cJfWkFGqWxWfOT9ahbwBAkc56wwu9RjLA+Ge0ayr7miX
         LIeg==
X-Gm-Message-State: AOJu0YxC4847TYd753SNurw42v2PLuB4d++WlCyrl0JTIaWY4Fw6o/di
	bVd3jCKgQiQ1a3kRfmVaxJHBp4TtSfN/I4NQ+ifrqznyLsY+AypMK+c2sC5DsmlMh46XAHT3hTe
	LjkA=
X-Gm-Gg: ASbGncvmNVjJbxBUWvEPlkdm78yzW9Ekb+/Hu3ld/jcQBMbNcYj3zF3tyx42nn2WRHr
	Xyr1S0cYrM+dLBVRXDWC5UMlVh/Sxok/XJXOQO65xg2mKfIcA9/Std+bFwKU/6+s3si4JgTdmb1
	QOYUqXwB6gCMwR3cJktjgt0wczFYq/xSN/8iyWp6EtvBd49egQrEmwnLA/dJAgym5GUlfsH2ru0
	jlgn2bL1IjLDcZBT27bzggz66G5gDEci6c3ouGiBrwFwyttXOvGv16t7yOcR2r3yz0spDy5jwt3
	6nzU3tbkJu61OrppI5WIKkge8xN4QJdlChwNEuL9k6buieKq3xnail+7353htJqsTN3ENFB4osx
	WKKL5Rhmgh2BfIg==
X-Google-Smtp-Source: AGHT+IGMZNEvcponC1DHxf5eD/n8NYKEy62pa1AIY/6OulzzR3GhhnsoRfG6TIgZak0ivooIISb1Nw==
X-Received: by 2002:a2e:95ca:0:b0:30b:f92c:16f3 with SMTP id 38308e7fff4ca-30c3de16cafmr22612641fa.11.1741951215080;
        Fri, 14 Mar 2025 04:20:15 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0d26e5sm5364391fa.20.2025.03.14.04.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 04:20:13 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 3/6] uki.bbclass: drop serial console from kernel command line
Date: Fri, 14 Mar 2025 13:19:39 +0200
Message-ID: <20250314111942.304800-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250314111942.304800-1-mikko.rapeli@linaro.org>
References: <20250314111942.304800-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 11:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212834

The kernel will continue using console from firmware which is
much better on HW when we may not know at build time which
console HW and drivers are available, e.g. like on
genericarm64 machine.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/uki.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
index d9a7fb0e6f..fedff222c6 100644
--- a/meta/classes-recipe/uki.bbclass
+++ b/meta/classes-recipe/uki.bbclass
@@ -81,7 +81,7 @@ UKIFY_CMD ?= "ukify build"
 UKI_CONFIG_FILE ?= "${UNPACKDIR}/uki.conf"
 UKI_FILENAME ?= "uki.efi"
 UKI_KERNEL_FILENAME ?= "${KERNEL_IMAGETYPE}"
-UKI_CMDLINE ?= "rootwait root=LABEL=root console=${KERNEL_CONSOLE}"
+UKI_CMDLINE ?= "rootwait root=LABEL=root"
 # secure boot keys and cert, needs sbsign-tools-native (meta-secure-core)
 #UKI_SB_KEY ?= ""
 #UKI_SB_CERT ?= ""
-- 
2.43.0


