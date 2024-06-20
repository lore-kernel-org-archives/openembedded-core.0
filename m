Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C6E6C27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 14:08:11 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.48411.1718892488617777106
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 07:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Zr6OQg1R;
 spf=pass (domain: baylibre.com, ip: 209.85.222.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7955841fddaso81138085a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 07:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718892487; x=1719497287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JodhTO+2g/C25PjrPbLwunoEqHWVggG374vYr2dQ63A=;
        b=Zr6OQg1RnRUenmXXNw22QvxmZ2mtuGU5POgwp31BzxHyK+VNnrLabYy75GFS/fV64z
         ToslIrCJr9MphcwknxDRV57ktdajM9mn46JTlDW/8G0sWlRd1VF+ZJZ063dG2TwrOPfZ
         RDfHUD/oLWz37BtVKw2Q1HnR+qtnENhjOnEFprDa5Ni+MUDFGZdgMhnccyk21nYSE3ew
         7BrGkt69X/lLzzm+74M89atnkCr6fSS7ZVe8mAm1AfjK58ojh1qcqcnm/QmITAPJ/2Sw
         RdPp08/YerQSPRUn82DTz5PCS96s3b9RaZOAlmaGMQDeewB+egbyIHAIyKpTVCXYuuXr
         qIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718892487; x=1719497287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JodhTO+2g/C25PjrPbLwunoEqHWVggG374vYr2dQ63A=;
        b=ZtqI2m1ItTKW/c8J2WSXk/7PzZs14qYEG9T/0IXCWJ4UNH5F11hMBOwT0YIqAl2M9l
         2J74xoNXa1Jm1oAvxXwOnlbAqGmUTfsT3UHraf6TaAp40p8cBQTPBvtRpqDpXr1ao4u6
         uhgMjB4TA+HQFidG3I3/vp7a8UyjnbRxd/41anwdnktN9Upq33zPPFao/RGdUkKwTtrr
         j6nVRLrGoK0oJeTJT38ySmk5wMu8qV4fR+OJk3jJB5wKreJ05MlKn56szuXaIHOm6ENn
         o5QXX1wmsoht6ja5Zb3y/x73abuVoIvlc5WyzgU5tfaiUEZmdgjqdkGSwX8UbF9xJau1
         P3rg==
X-Gm-Message-State: AOJu0YzfiQ2s3ixWkhXCQJNXQ7KOgMPdZn3zqCFxXRZ3wA2B7VpIjpsD
	9KmVBeoNZ9XJzEMnba4zHpeiufQw8RRfjAItc1/7db3HzVqdlxwy7nqEGHL9xFjAi5mpiofTXL6
	G
X-Google-Smtp-Source: AGHT+IGcoXKflF6JMkk5g8UMEoRq5viS74W50xkG+bJ2heE11xxeBbb+WsJRO0jyG4VaTLTTedh2ug==
X-Received: by 2002:a05:620a:240b:b0:796:de79:f577 with SMTP id af79cd13be357-79bb343f962mr1058208785a.7.1718892487556;
        Thu, 20 Jun 2024 07:08:07 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abe6efc7sm691579185a.131.2024.06.20.07.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 07:08:06 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH 4/6] python3-urllib3: upgrade 2.2.1 -> 2.2.2
Date: Thu, 20 Jun 2024 10:07:51 -0400
Message-ID: <20240620140753.392220-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620140753.392220-1-tgamblin@baylibre.com>
References: <20240620140753.392220-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 14:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200959

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-urllib3_2.2.1.bb => python3-urllib3_2.2.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.2.1.bb => python3-urllib3_2.2.2.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.2.1.bb b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-urllib3_2.2.1.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
index fc1828b4ee..31a03a60b3 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.2.1.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "d0570876c61ab9e520d776c38acbbb5b05a776d3f9ff98a5c8fd5162a444cf19"
+SRC_URI[sha256sum] = "dd505485549a7a552833da5e6063639d0d177c04f23bc3864e41e5dc5f612168"
 
 inherit pypi python_hatchling
 
-- 
2.45.2


