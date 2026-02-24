Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37066EF06E0
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:23 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21692.1771943595187393702
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:33:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SG+YlxPv;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so53775395e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943593; x=1772548393; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7lBUKvpzKUWbIgi4UGfAVKNokrvGyoXbA+EI1eario=;
        b=SG+YlxPvVpg1+aW+UJuy3trKFxOKzeloHN5tpLU4U6rWJKA2VcAtZBsuRDJOwv8652
         EFLsTXCb3StZMUwsdJSARK8YJODIzZvuJ7ZR3dE5t30sKGT+yE3EF1m7NaNGm88P6JDT
         beuQ/npKL+Lo8+3fMQPyze5uq7xXDPSueSPwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943593; x=1772548393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o7lBUKvpzKUWbIgi4UGfAVKNokrvGyoXbA+EI1eario=;
        b=lKyB0HOkE6CnrFrq5ntuYaFwm7bJo/zXmEi1EvfZFUMX7uDu1mxXLWY1PdhWvB7b3W
         VmuGzYEUr/oCIbitAeKxWs+F8fwG1wfd5WyG4viPAI1DfqPay6B0QR52u0UlhXzzRjcd
         IDztYsNRLb/sjpFYxazzRKHa4laVGTsoIzlsk1WFVSXdGbDhFBPHxHNbCZMXHd8Gm+lA
         KAmKutC9a7b0FGYT03aO25XrSytkM1zA1LT9DdssmSb1cQrFfFbRHrmUl3621iUgQ7Nq
         7IlQ822nPyiqUMaEh/Y3vM75dPNLwpbpkuLJk3gvzKGDOl4L8h688BbfXnMima8ymx2Y
         P+6g==
X-Gm-Message-State: AOJu0YxKng8l+meH08l7hA404hkpTFgHtjIcvFG2Y6SJwrQhisXgvaaE
	kGUbyv3FgQH4YnmAcY2M4n/YWHiCwxCNWLSemcmNFxbmhrAshP1dV+OGzafhbSlR2RRf9qk/vIc
	AAq9o
X-Gm-Gg: AZuq6aIpaBFWszAC04w7h9thMnemTEv97dnyvLm8C/wNGPEUntWsPevbwuYy0qv8kLC
	etP0xFUVm7SEZ5SepEniysx9+wN2cNYoizOdGPpYBm4udofO5wjtPrJuezfD7Z9GeYnWA+SLGB5
	a7q7WeDiBXaooUweNrltgfetIxw0ylyK6Cir7NhL1ggyzka3k6IVv41hWHrQOxKM9IJGpJKj4Xs
	9+Ic77SD7OzKDI6lh58nXCmCJlwJ5XuOQhX5MFIZZmmy9rN0xeNvEPJa1FBtGOC0LM5KTvJ1fyB
	9V5pXNyBSwn/hpYFLMLdsM7CyE50heC8IL98UBiq1JaUhjep6RegXDOZG6vl42mYQMjkuK/lNL+
	UYI2vuXRHGJKxjrDhhmP4thVbPcjblvBYk4IoJR5Qo1N4HaFlJ8n6cXWaFxfmtkkBLhAsOVZk/A
	HKLj0MO5cmZUCDG5tm/+DLF28mXsvOSSb0E7y5z8rnuzlLHH7UcKCaqawo1h3oaK1bk6jZSay5k
	IIteRKax/OQ40jHxzY8Yi+NuSgNBWpK6w==
X-Received: by 2002:a05:600c:548e:b0:47a:935f:61a0 with SMTP id 5b1f17b1804b1-483a95643b3mr217033185e9.0.1771943593221;
        Tue, 24 Feb 2026 06:33:13 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.33.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:33:12 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 34/44] scripts/install-buildtools: Update to 5.0.15
Date: Tue, 24 Feb 2026 15:32:02 +0100
Message-ID: <3257a0c0f84a21f31d7d2cfc43d838fe35305855.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231841

From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>

Update to the 5.0.15 release of the 5.0 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index f1c3084245a..c874494f4ab 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.14'
-DEFAULT_INSTALLER_VERSION = '5.0.14'
+DEFAULT_RELEASE = 'yocto-5.0.15'
+DEFAULT_INSTALLER_VERSION = '5.0.15'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check

