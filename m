Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D19C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 09:32:36 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.6467.1646731955179116969
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:32:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iPKFSgND;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id d10so37770620eje.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N7X0VswVDCiVwKNiP9hReKABmCcxwsf9qrRCUJ+OFNI=;
        b=iPKFSgNDSAda/gNSyqVGH8DOBOBIp4M84piAkExRbn1G76RIkiJNn/0QCSNQlT/ruX
         fOS+1PhIU0anYyxYQnYrGdZCsHPiFCXrmjz/GVM3HUDBBUft2xQltEzKtTYU+3YTMtiV
         IuCDtL7VJ6j3SB7RS1GFPxafm1Tb479AIpy9+Nb37d305L6pI9kZK8k1rnPQviyzIoaF
         Yp/KsisZETaRmCjPyuRjsVtmsOrj2Qc0v8HRjzgaGKXeFHywABVkzC46DgmPJ8/akNc6
         pZHjeUwpUaRyOC2nu+nGbqmyxJOYcKEaGjJlmwPF0F+HTJs8NVJJ4IiP+ytc38RUVFG2
         hOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N7X0VswVDCiVwKNiP9hReKABmCcxwsf9qrRCUJ+OFNI=;
        b=KDeif9/IRduNFMo32Bs2/0H9xp3nbZGpgYXB/1ObSdA3OTxrp+xA+/Ygatr9wIO4HT
         B7tifb9TEhCTur1g1vam+8cQUIrikPebku8lTi9WPnOg1W2rwpVYHq++OQ2r6MS3tbH9
         NdlvnRZ9B49TLxOrnxkrLdUIZ55yVSdDvHXc199W8n/qH3WGo/oxxwdmqxdGXtepWuV6
         P82ExYuH7/wq2W3m75f990ocw49au023xHhkOA2E9nyIqA50ZF1nqGJPGJ9kD7hMmeRk
         r5viNG08oC0dmtf6FrJflACi+26hjmKi7DSVpjVajBA6uOo7AKDX9561i0PwOQTliWU4
         HnBw==
X-Gm-Message-State: AOAM531Gu62+QLLoiYc6BG8Tfc+0fInZp0CZA/RKYmmvxI5NooZQGXK7
	N0GSGwdaKGa6St0j/P5MskzYs6Ue/gQ=
X-Google-Smtp-Source: 
 ABdhPJzr+Cg4zfTD0iRRxjHojOqyvhfr3oKra2tHkNkHzGwDXLFLHD/QHVXmprwyxzJo6PS3tiQH2g==
X-Received: by 2002:a17:906:7307:b0:6da:92db:c78f with SMTP id
 di7-20020a170906730700b006da92dbc78fmr12683723ejc.35.1646731953789;
        Tue, 08 Mar 2022 01:32:33 -0800 (PST)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 g22-20020a170906395600b006cec40b9cf0sm5640178eje.92.2022.03.08.01.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 01:32:33 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/16] mmc-utils: upgrade to latest revision
Date: Tue,  8 Mar 2022 10:32:16 +0100
Message-Id: <20220308093224.3436483-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308093224.3436483-1-alex@linutronix.de>
References: <20220308093224.3436483-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 09:32:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162885

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index e4faa99e33..addefe9abf 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "4637a7c0df49ba349f9f0e4ab0828133fc06cc81"
+SRCREV = "4303889c8bd9a2357587eb6ebacecb70098a264d"
 
 PV = "0.1+git${SRCPV}"
 
-- 
2.30.2


