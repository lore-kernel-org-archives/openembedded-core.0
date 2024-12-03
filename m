Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2BDE64A9F
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 13:37:44 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.19585.1733233060625198165
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 05:37:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JUIu/Uwn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-215810fff52so26067995ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 05:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733233060; x=1733837860; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zF00SuKBwxVv/UMXHZzUAWFBgqhIQBb5PUBhdzzRIyI=;
        b=JUIu/UwngN649mkCj3AjOJbwQCwRM6GhnQHh8KiXJmiE4h43i6XGoxUJ1rTARW3gQM
         xraSbd+ZG5e4Y3C6PdBFnwmaxDFeeYdYjmfVnVXsDf4kKCP658/Ko/d5CN7JpCf+5A7j
         z+W8tFXgiLjYlJyJ6gSiLcxeKYrQUnEnrABDhl4QrAYqObeIb6fkDodFH3QDCJfvSCFF
         Duy9l5Xcbl68eqAK4BmQ/WQBb4kOvCaP2ls118kUM2jaZ5N0riVf1RGA1zh1NVEiVVT/
         LidioyBFvr8t4VY7RKUgyLL4tOZpmrvjVEHULch1/dzNW7FP+wzjyK+I3yio7POKTOxv
         LVow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733233060; x=1733837860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zF00SuKBwxVv/UMXHZzUAWFBgqhIQBb5PUBhdzzRIyI=;
        b=vLZjWPbAMGsWNUcmKgNOjV37Si8co9qwx1iD6SsVhjHaY2IbWbUGdLWOK90Wk7N69q
         U7lC5TMOVE5SAy9jVvaoAWK22tmZguu9rL2ggdKtua9OoZc9DRGJo/4njVd28j33+OZT
         ErDcHf848hNmgfkW+lbZM/P7PKBmcILCmsFCSWWW1k233FTTWfJaHp7waV+H5MpUIbZu
         JxW6TTyDg3A5cL3Yc8aKEoNk8guNmYkddfvqtU6GsKaXqywO0/KgxqLLqGKZyAO6TH7k
         8iIf1M4SX3BXI/T3nG4zog+JmIQwFEQUTgOyrGUkgQWv20vExQ4ZH8LMx2E6DXx/eEm7
         Q2pg==
X-Gm-Message-State: AOJu0YwjTq1mo+SA333X3kzGsoS4QtSKyn6/Q0Lvod5HfyZzsbWfxHl1
	dMD3u4e1tSA7px5sQFtTuyzHQn47mfs8ok9BDXNz8ITM4MrA/DrKlX/8fY9rA3v/asRl/jgc0WN
	m
X-Gm-Gg: ASbGncutfsvHy6Pxg11YVnF/OL0pus0/Jm2xAmCDPJHJCtf1nOKatQP6/x9W98vcsmv
	g5W/Nem3Tj4oEnJ1IDWtKCK3+5c2TWaq1qNJZdM/idW2BxnZ8oI2uZC+38KhAcG8bvMeDcpqQhw
	DwONPrSqqAIJ6zduv97dLkE4NCI0i6zuoOmyFc7qPttwEP/NM25BfTsaBUbJaCkSkTCcr5AbmYx
	dYNx1LPwEonvIjtAs31ECtfT590nhj0+vEk41U=
X-Google-Smtp-Source: AGHT+IEV9gePUgAiSrqu5ZkYZ+O6PK0KqABCT+O0EGtmsTA4DqSqgoLVv5MArxQAilNkIhNQKd0YxA==
X-Received: by 2002:a17:902:ec81:b0:215:76c7:451d with SMTP id d9443c01a7336-215bd1c9e43mr25243045ad.13.1733233059853;
        Tue, 03 Dec 2024 05:37:39 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2153540d792sm84560225ad.66.2024.12.03.05.37.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:37:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/16] python3-urllib3: upgrade 2.2.1 -> 2.2.2
Date: Tue,  3 Dec 2024 05:37:11 -0800
Message-Id: <ee42ec7146a7c3ceb25c1e0f5afee93849cf9143.1733232895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733232895.git.steve@sakoman.com>
References: <cover.1733232895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 13:37:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208196

From: Trevor Gamblin <tgamblin@baylibre.com>

(From OE-Core rev: 32fdd5673c25084af4ba295b271455cd92ca09d5)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


