Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DEAC36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 13:25:50 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.21063.1742563547726288205
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 06:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=IWhDeqJY;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-547bcef2f96so2313083e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 06:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742563546; x=1743168346; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xULRQVdTY/LxRb9S1oZ219XVrnqgSCEV0rTfQfvvQAA=;
        b=IWhDeqJYxE4Qzstrz22NKt7DVG/vbMeNADj8LUDDSecNcuGN9sy3A1YredoeYscGur
         VvptlNu6oGvG2tT5Au1gtmVY0TUssuQv/Z0cgYq6lsbWuNxIGsE/FxHrXDzhOIeEemlW
         jcDlvPld17Qr85gbiFFCzI4U9odrHs99+PQjD2clBDs69IdBgxdcz0xp2w7UgbsaEqzF
         ejLkMEsmRMi4RsWIzTmVPfQ9QTRL1YL8o6mRwLSVfwKRmqVDmO7+HVVeWCBEax2zS9jt
         v+XQR9GcRNdBdLnKMf3E1dKXiM+uCD2mTb2jeOeiIqXgmraCHzunVeRBEfxx5t0TGsQC
         jf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742563546; x=1743168346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xULRQVdTY/LxRb9S1oZ219XVrnqgSCEV0rTfQfvvQAA=;
        b=JG1V30w59PTRN4LWR6ARgZ7uXzumj6GSpFM4rCK2JaYV2w5i9NUIw7HjkZ5oBjTH7L
         NoHd6l/8rc0BAvv5YdwPe/0URfNSuFkVpzcXPJX4vzxK8W8+yZH+6ZeprQ0R3FA1REQK
         ymUbikA1Xq2v8QADO0znHB5fjcYrHepGAzcOPPPZ8ii2ufZsAIV4B7CHjYRot0/C8qdc
         bM/IekRqSVQt1kr9IOEpd37poK1Jf4wl2TVq0rh+jJL5TtLpCONv8jlLtsO1l/oPyMN0
         9DLq/puXYNTixy6wSRQCt5yVwvRMsyxc7nLQfVnGPQA9TnlNF6SzO+S7JIF5HeD3UN5T
         9rMA==
X-Gm-Message-State: AOJu0YyRWDzmqaHtV0aBuLPlZIj0DkSU4RJ0VMJYkNSFVsG+78Z0S0og
	kASiWw/UOWN47pJ/nvdCkK4bdM760gf2IL5enEsM5J/W59O6JbnJChskxmRJdRcIYI5nD0OebUD
	EkJk=
X-Gm-Gg: ASbGncsjAMPrk1ce1j2GVyshAVpA1isW7aVdRKrOi9dH5sjORWKS10oqAbsslBlV775
	Cq+6OKvjM6nxrFxQK8DiRxdkdo8eC6Zo8FC0ztUNaXVdjQZGvXMkqjuEcqMU2gmd+UFWdiKwxSf
	u28ZcSLyOnZXrxYG+TEQL79v08jsKYv3ov470oJAGYQFyONbvL0byHXNSHYIjW+xSA45q6EY5YM
	gfXbIDLcA8QlrmRLaJjvhrRDq65n5Y3B6zmj9yqKhWg9hO02JOczz+YXYQ+CCnvatUROhuWKwHY
	zO/c2/pvlr5gzZXThO2jJ8DXZRZMdF65sgEtjrTWY3tG1awxdD6tLnQj+3kDOC1cJlvUNnsyrp3
	joMt/mw/4SDlxlHbcKiBbOw==
X-Google-Smtp-Source: AGHT+IFgMXqx29PR+36cldAqLLow5ONmqVI67LYZ20IXynlT32jJwMo0LgYX3Twb9JZSsp2+PFREPw==
X-Received: by 2002:a05:6512:b85:b0:545:2f5d:d5ab with SMTP id 2adb3069b0e04-54ad6501e12mr1320010e87.37.1742563545908;
        Fri, 21 Mar 2025 06:25:45 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6468a25sm182634e87.11.2025.03.21.06.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:25:44 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 02/11] uki.bbclass: drop serial console from kernel command line
Date: Fri, 21 Mar 2025 15:25:08 +0200
Message-ID: <20250321132517.670372-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250321132517.670372-1-mikko.rapeli@linaro.org>
References: <20250321132517.670372-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 13:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213458

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


