Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D8B9C433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:13 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web08.7297.1651727154549771697
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NgF0M5+c;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id n10so6556895ejk.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hlPo4MfTVym82dcEEzMQJ8+qqs4pkpxlyUhtsUqGei0=;
        b=NgF0M5+cKeWuCbg7LDI2AqzqQF0YKyMb3TyG8gTIsa1Xg87zWpKr2PQ8RWaLHX/dp8
         /gRGtXhA+yl/gJzVDdT4nEu64WCUxdMgPd7BWnrWUshLfryq1smdvgPMdFJCSlI0kABs
         TDKDgvEd6/6nsiRYq921G+fXnr/alexgxIVPXubQCRQgqY3hrbZDSUT1kXiv0HnPg9Qc
         aVUZG5DPDZ2qamX8fWDIskz5Gjq8LM+lYcXKy9W1RZypVrHO8FJf1jFlFQod+BtTznQM
         +e9uTZBne6gM0wZk0iYHR+kuC8+m3G39ICHdDNNLMX7JyBjmUcUW5SyuYW3tDSJ2Lbnf
         7edQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hlPo4MfTVym82dcEEzMQJ8+qqs4pkpxlyUhtsUqGei0=;
        b=vGR+6vEMAlDSsUMkCeWXJgA+CWQ4VN9To+gVsoy8Rn2TBtDwTwHE3EJ/SBeHDqHruO
         S8rQ9wYaHBGJiGnZYpKPJQndDGOKCo4JeWOLCM0ZWf8CmQRqzlBrIcbhdZXAjPizMVSS
         WPVzULEP3HEYyuLSQ/9w1QVlczjT+kuSsSX/pxUXP1NZ+xrQcGgALz6Xek2WNZF8puBn
         2Ve1Em5FE6rJuEZXn5paTneU8fSsLnHTGVnFjHLsSc+QR2OlkF9Hh2507cUsWXIjU5Q2
         gYhv8d/wxRFE6nvy+W+7LWwfL5R0e4h70oXcEWY8IcWvMEGpHj99OW/MVXKM/YGEcTLx
         BjBw==
X-Gm-Message-State: AOAM533iz2+gEw4dW6Wqlg5HvIwksiZaf0VgrEGCmuMO69nu3rnuIJiP
	9+9enfs8SSjliw5BGiUz8gtQd9ZoDsE=
X-Google-Smtp-Source: 
 ABdhPJyvxXvuvRtLK6qzuKJ9Fn3ABsItg6w83vsp4bdvsnqjB8/uJQ0cd96BwJHjAwKpI6VuGyEZAA==
X-Received: by 2002:a17:907:3f8a:b0:6f4:3f00:b1e9 with SMTP id
 hr10-20020a1709073f8a00b006f43f00b1e9mr18745782ejc.59.1651727170629;
        Wed, 04 May 2022 22:06:10 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 30/61] mmc-utils: upgrade to latest revision
Date: Thu,  5 May 2022 07:05:13 +0200
Message-Id: <20220505050544.651895-30-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165259

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index addefe9abf..3e611d1306 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "4303889c8bd9a2357587eb6ebacecb70098a264d"
+SRCREV = "b7e4d5a6ae9942d26a11de9b05ae7d52c0802802"
 
 PV = "0.1+git${SRCPV}"
 
-- 
2.30.2


