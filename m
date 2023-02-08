Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 395FEC6FA9D
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:15 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.3135.1675840925760944754
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ENPkrjME;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id bg26so12675632wmb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGIBvF+h68tg0iPNoZfiU6y3Se7ll0F1dVkaaYjRihA=;
        b=ENPkrjME0n8O6awxvmnyY3ATpv8uhdCt/s3G/CVuQAgBkvYdmtgI/xBowt3zxS15MX
         hCYSqdF5DWnDlNC6z5uJxefLbYPQLPx0i22iUNLXxhdQsAOGYBl8fxJ05kky1U+DBIbr
         8ARVAdKUFrAk5RQOhITP+c369mGjCOyETT3FSoxYaMat9OdzGsNWSloz/2qcqH+zj/2M
         P5q7xgvx0WGg7QC84IgcAKlAimKuvlGIJM6NzhQcnMUM/MH/PBQzKUx5gOnLWSwbCfCF
         NVDRIXcO0t6RSZFIGyAaQbKulBQb+hTyqeCl/CFXf8fg00Nk55n9yi1/K+0tHFAHET17
         09/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tGIBvF+h68tg0iPNoZfiU6y3Se7ll0F1dVkaaYjRihA=;
        b=CrGyEqJ4A8yOJtW4VJLmmHs5ZYYZgSsM3Rtylo8pHgKEnCImJhb0Eh3fau5DiuVy3Y
         ZKu/Dm+SYBDZGO1prswZRrdI45m5Nc5/eUdf9nvQ7l6az/moMxEJu4W1WmVDkA5vgEy8
         jUHe9ksSC+4rk3A4Yb+xLMhEBB1oMvJF1wqrE0DyOl+t3GCo0+g2H9gGavZ/CXlT3SsJ
         RU33D/YDT8NKe4rdN8msj6ECyY0vwWVAf+QbmFzl0juFPy9/+wJQ8UCNGTQkSH5WWZNi
         5DBJr4tzUo5osvmmX3hrmMs3KNBUYCHh0NixHbeiBTiQcF7mRZu7bUnaeaDUQ+PqVrhV
         rxkg==
X-Gm-Message-State: AO0yUKW8PKpLV1KT+F1shJXvkz/5SmDad+rGXtVl/IglMB1ak8vgMnsQ
	rd+7flmxlYH2bVHr1bB2gP7ffdjdWw4=
X-Google-Smtp-Source: AK7set8QIjoeQrpKVIY7/KFFj6jv7Rq+rUSo0kqXwcG4jwS6WS/trLrCznUSD0BXJr5cCDziCghv0A==
X-Received: by 2002:a05:600c:3083:b0:3e0:481:c897 with SMTP id g3-20020a05600c308300b003e00481c897mr5529695wmn.37.1675840924366;
        Tue, 07 Feb 2023 23:22:04 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 29/52] python3-pycryptodomex: upgrade 3.16.0 -> 3.17
Date: Wed,  8 Feb 2023 08:21:20 +0100
Message-Id: <20230208072143.2930292-29-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176870

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...n3-pycryptodomex_3.16.0.bb => python3-pycryptodomex_3.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.16.0.bb => python3-pycryptodomex_3.17.bb} (69%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.16.0.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.17.bb
similarity index 69%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.16.0.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.17.bb
index 36ef772863..720aec2d36 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.16.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.17.bb
@@ -1,7 +1,7 @@
 require python-pycryptodome.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "e9ba9d8ed638733c9e95664470b71d624a6def149e2db6cc52c1aca5a6a2df1d"
+SRC_URI[sha256sum] = "0af93aad8d62e810247beedef0261c148790c52f3cd33643791cc6396dd217c1"
 
 FILES:${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
-- 
2.30.2


