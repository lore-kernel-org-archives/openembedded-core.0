Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3116FC7618A
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:20:22 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.16024.1678375216647153480
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:20:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QnpXTsJY;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id q16so2253548wrw.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678375215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y+lsqhM6MtrK4ogtLuS+nxQmYWR9zaifZUmwQEtv1Zg=;
        b=QnpXTsJYUFI2ZBQ5wOd9mytsFvnPlox9slIuT19qt9Dl5gori5RsIZvbyY7+NuLOA4
         rRh7eUxMLTJTtelC+r+I7gjkE7RwNC1OrfE4SQ/KmSV+4XhR4eZBi2huXRAQiDwpNl9P
         wuPS7Rxd+WattzJR+CcRZlzsCFy1hfiKRR89NpflGn+Ih7z6sy9/iYf4gqqSFfg05+Zd
         xIpOsUg65V9N9ommqFa/DCJCSr09Oh7vMVi87WF8iNZJ6atTHiU0h51xAYzhQT09C74p
         Rxl8BY6NCnuMAQyJm09hYbl+clgG95hxgNoaf3dO+iFArcaW3FrBvFfjm2SV2csbRyRK
         7Shw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y+lsqhM6MtrK4ogtLuS+nxQmYWR9zaifZUmwQEtv1Zg=;
        b=D6gH4buAZz/frCS8DFlH8OXsAQwZkTZYmphoNfzmkCIAN+DmGFP449a00xAep9hwiJ
         +hcTh9eEZpyhu1jcmgckakQ8aKefptNZHVoU1qbEfGZ8nFFhyCpGRDwfEiFKTG+8eOpF
         8vxf45Zt3wHBS+ygftLjqLjnfueTawoEeHBbnUKpIFoZ51rlfbRtowTTP/s6/8hYVE38
         o/ngSFuAAZiCtF2k9qFLunptYhyTSEdMBrAh0CzPKMmpjzVrAWxHSMxcpkSfAFFksEvy
         JmXYZBbeo/TPts4SE5lWbK1Iy1b6n3KtW1/iyeOjCfPMOqgZb80WZg6+PkUst6lmR+0T
         YisA==
X-Gm-Message-State: AO0yUKVVRUurr6hSTGhGgjNjqkxXwxGbwjv8ndCDXZZa2RN9aCtWRMfC
	macMQo0nm9G8uvBGUSgwCtdGIk4ZY7c=
X-Google-Smtp-Source: AK7set/Vr7unoHLntUlAvMVDV8+L9RD+gvlnl3ijFmlzXp8uZ4QhHZH+9Ywhm4XtnSzLa0+4xaxPQg==
X-Received: by 2002:adf:ee86:0:b0:2c8:1247:a858 with SMTP id b6-20020adfee86000000b002c81247a858mr15363809wro.4.1678375215257;
        Thu, 09 Mar 2023 07:20:15 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s10-20020adfea8a000000b002c7e1a39adcsm18314521wrm.23.2023.03.09.07.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:20:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/26] puzzles: upgrade to latest revision
Date: Thu,  9 Mar 2023 16:19:53 +0100
Message-Id: <20230309151958.3619193-21-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230309151958.3619193-1-alex@linutronix.de>
References: <20230309151958.3619193-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178246

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 5998c23dcd..87b6fac024 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "7364ce8e266d947be146d635958a7b282752aac6"
+SRCREV = "5a491c5ad333ef34c1e7713f920f51cbb205af60"
 PE = "2"
 PV = "0.0+git${SRCPV}"
 
-- 
2.30.2


