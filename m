Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD160D2CE0B
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 16:58:16 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.23585.1729616291770760284
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 09:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=H5vkr24/;
 spf=pass (domain: baylibre.com, ip: 209.85.222.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b1418058bbso440628685a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 09:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729616291; x=1730221091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Sxe4Th5cbj700WRxtw+GTnkggVg/TUHbxExObbueQc=;
        b=H5vkr24/OYNFVymrzAasX0tDff4mCyynnk/Fau+uXlaOzR9Z67UegXMl+R0fvG1Gfh
         tr+c2SHLEn56s1qHUcBymZEprnQjxMWO2ftWpBw9U4t9WSbs9Wj3R2sUotzBqM+2uILK
         RL4/M1m4vAkNIje7PXKbhCZdF6xXOu/6tN0zDdxkJIk5HuJEa5hG9dY09tLZMy3PM96+
         FDlu95q/gAgmeKM+d7xvtoju1b9+psUxYM2iEw1RuSeXjqGm+gntYTg3Me+cj8Qx/QOe
         dswZAjB0R3E1oWWfS3kWp2sV7qRVo3bw+PDkF67lfo8RmvyHszgjslLCQB1f87ZYQ4lO
         tqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729616291; x=1730221091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Sxe4Th5cbj700WRxtw+GTnkggVg/TUHbxExObbueQc=;
        b=cSO4ADiYx4CZWPbT1S7yWv3wWuFQC+WMqyUvBuPxW8wsq/fOGOq8s0fhfg3YYaz3J6
         63PC0Xp8YH1xI3rOHc9zd0NRbVHyRxnai8ZD0QRpjem0bPNfMjrXlFQrYc2uA8lsjhqh
         E16TWMTaZwpUvaccmUrqIXWBDn8G8AvwZT8uqlmMaV9XRS1KCaRjF38e4uir8eKZwJKb
         igC8bZGc9BJixgLzfpUfGakcZmbJ/G+LWtGUHkyxTIRNl2mqx4wGaWGJE/BqqpxjkmX9
         oD1b+Le0MMSf3JaYbjTFkKNA/r7iTuWIquVbON2mODLK99cZpusWsnDlCIXyu2w/q23m
         27Ig==
X-Gm-Message-State: AOJu0Yyds0VEYY+ow/TO2xSI4wChdUivN6GYgBaZD+HSr4RvP8Nlo91k
	2eR7hpOB0tteiCFbqpfsmMAAg9VUNlqwGNW6L+Fm0iy23YyWKtgerU+U26MsSbixYR/i9VjosU9
	s
X-Google-Smtp-Source: AGHT+IFYxyz8bux23agnozXJiFrT3YmtaPSLwQ3Bj85a0dMNWkvE4YSRtyY/5JFr8fDubCA4GDqYCQ==
X-Received: by 2002:a05:620a:17a7:b0:7af:c818:bd9 with SMTP id af79cd13be357-7b17dd52df2mr11294685a.61.1729616290644;
        Tue, 22 Oct 2024 09:58:10 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b1659b97f5sm297130985a.6.2024.10.22.09.58.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 09:58:10 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 4/6] python3-hypothesis: upgrade 6.112.4 -> 6.115.3
Date: Tue, 22 Oct 2024 12:58:05 -0400
Message-Id: <20241022165807.2601020-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241022165807.2601020-1-tgamblin@baylibre.com>
References: <20241022165807.2601020-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 16:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206164

Changelog (https://hypothesis.readthedocs.io/en/latest/changes.html):

6.115.3 - 2024-10-16
- This patch fixes a regression from version 6.115.2 where generating
  values from integers() with certain values for min_value and max_value
  would error.

6.115.2 - 2024-10-14
- This release improves integer shrinking by folding the endpoint
  upweighting for integers() into the weights parameter of our IR (issue
  #3921). If you maintain an alternative backend as part of our (for now
  explicitly unstable) Alternative backends for Hypothesis, this release
  changes the type of the weights parameter to draw_integer and may be a
  breaking change for you.

6.115.1 - 2024-10-14
- This patch improves the performance of from_type() with
  pydantic.types.condate (issue #4000).

6.115.0 - 2024-10-12
- This improves the formatting of dataclasses and attrs classes when
  printing falsifying examples.

6.114.1 - 2024-10-10
- This patch upgrades remaining type annotations to Python 3.9 syntax.

6.114.0 - 2024-10-09
- This release drops support for Python 3.8, which reached end of life
  on 2024-10-07.

6.113.0 - 2024-10-09
- This release adds hypothesis.errors.BackendCannotProceed, an unstable
  API for use by Alternative backends for Hypothesis.

6.112.5 - 2024-10-08
- This release fixes a regression where hypothesis.stateful.Bundle did
  not work properly with flatmap functionality (issue #4128).

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...hon3-hypothesis_6.112.4.bb => python3-hypothesis_6.115.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.112.4.bb => python3-hypothesis_6.115.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.112.4.bb b/meta/recipes-devtools/python/python3-hypothesis_6.115.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.112.4.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.115.3.bb
index b66fa9ce47b..c8dc1b08eb3 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.112.4.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.115.3.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "8fe64e4a6d0862e209e3c36b42037aee9665cb839d619d9281be45345ab7d856"
+SRC_URI[sha256sum] = "d4efc8c7371bd4ec906d2777f1f18fee5539e47b3d7c7cdc93d1026ad35d9b33"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.39.5


