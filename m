Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04AECD711DE
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:22:26 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9460.1766114541966442963
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:22:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dYEc/jqs;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso2125109b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114541; x=1766719341; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGCxxoOhxNtMhWzMsPDUirtdAGm3sKX3DKpGoUU3Bu4=;
        b=dYEc/jqs2woSi8RDBvyqRnRWP1pMiqpggReN/Y7McfHOHPj/H08k2t8Zk4QqhpgcGk
         l8ULaB9ly6u24I22QeEn2BJcAnMSP80uh1+TVZQCur5zaGpylATx8qaIydrAXgE+RvlW
         19zcrWyF6jhzpRVS0K6qfosoLCnoLW5j7d1QJE1ettGj50+IIQ4TWGGzCWEgpDFlJ8FR
         fSmxET9m/suCd9b1e5CS1c/GFXsySdukIjRvxWquho07rwVXMJtEqZy1XtQ8o90k2OCw
         BS4l9J+9SQffPQLsPPzEHZO+zhTwY5g4J2u9Kq3eiG9IDJpeEDBULyYyfvK8+zmEP1RP
         llTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114541; x=1766719341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pGCxxoOhxNtMhWzMsPDUirtdAGm3sKX3DKpGoUU3Bu4=;
        b=sz3K3Fuf5ep2uQ78ZbgcvA4pkfV0sL3hclD3kvVWGQYREqIjJ4HnjLp3+OsgI681ST
         mRitIn6LZnMd8gJljin8BQhqUkj5xbygQsyz4vBn9vnOILTiOSiiaJew/vc6YJev24Pt
         q78adVHPn9rliIxADuZdCItNb6bBuPbFyzFmaiQn+8gaEZcByp14ZdtN7u0ohCpNNNDn
         h2ZjmrVYuX6pnpkgB0sMYJiCr8J1EPyHAlfJ6eHEzBKzMY6y4BL4dAC64ZA9UKckUlT3
         rjN93Pw35FLyT1YH6xpsGOx51H+wjSPt5CbRQkk+HJ64lx9BrrWIrQNZbDDiCx6YvJAS
         aa1w==
X-Gm-Message-State: AOJu0Yx5NGb6y13DGDFLO55z8f/vnfIJEVRzu4SzdvCpSCPLSWfDBeAc
	cOUQybMxGMzKb9pqLRIqtbXjYEyzk3hza7oDPp/1N7gbrsztkzhJLBNry+uCUA==
X-Gm-Gg: AY/fxX7uILg8r4gDp1H7qOLmCDv5afOZmn6FZwiIu5e2i9EwVuY1/oiNOly+IpgUORq
	kODT1cjxLPhVtb8O/Jn7DKC1D0DtTxdiP56b81QJFaL/+gM6LfuvvcmkMbSVHtivt4j1il6XYHg
	fQ5l76nla4Pr+2cJHtjkT0wsMFKA58xpQSqxzPnR3DqEYsO0GLHDCnetWt2+bKtByhCAwr1gX0v
	ua0aYScqXBPPYB/S0APEWBj5wuTNKxd77mmucSfHs4IEbjR2RwBsRwClMFZAxWsotURPJ7RATaK
	8aSqSaAGzLb/gwEtLk4pFxFepAEumiebovg8VcyXyRIK1FKf89/dS9Oa1x9yWuqMlE4RjKnP1vf
	+eoIifOLUB/xrJyNoCrV+lF47/VZMAOY3SrsMSJCwM0T2uBQNFbOuCHzAbBHsL+E+ozAsNp9q7e
	9NvxaSPcsFamTx10OwQItj2WH7XREPIwsiInE=
X-Google-Smtp-Source: AGHT+IF1+jVscmLpiwqm/29+4X8ExFfw+dd+YYUOG2UUnDs/iqWqUFaedS4yWhaoBeLjnvjZjsAi9Q==
X-Received: by 2002:a05:6a00:ac08:b0:7e8:450c:618c with SMTP id d2e1a72fcca58-7ff664814e0mr1499430b3a.35.1766114541115;
        Thu, 18 Dec 2025 19:22:21 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:22:20 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH v2 02/29] libarchive: upgrade 3.8.2 -> 3.8.3
Date: Fri, 19 Dec 2025 08:51:41 +0530
Message-ID: <20251219032209.960840-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:22:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228170

From: Peter Marko <peter.marko@siemens.com>

Release Notes [1]:
Libarchive 3.8.3 is a bugfix and security release.
Security fixes:
* lib: Create temporary files in the target directory (#2753)
* lha: Fix for an out-of-bounds buffer overrun when using p[H_LEVEL_OFFSET] (#2768)
* 7-zip: Fix a buffer overrun when reading truncated 7zip headers (#2769)
Notable bugxies:
* lz4 and zstd: Support both lz4 and zstd data with leading skippable frames (#2771)
Full Changelog: [2]

[1] https://github.com/libarchive/libarchive/releases/tag/v3.8.3
[2] https://github.com/libarchive/libarchive/compare/v3.8.2...v3.8.3

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 4b32b43a607bf708e5433366a3ef6cbcd5b8b221)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libarchive/{libarchive_3.8.2.bb => libarchive_3.8.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.2.bb => libarchive_3.8.3.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.2.bb b/meta/recipes-extended/libarchive/libarchive_3.8.3.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.8.2.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.3.bb
index d4f367009a..e3706ba3bb 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.3.bb
@@ -32,7 +32,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 
-SRC_URI[sha256sum] = "5f2d3c2fde8dc44583a61165549dc50ba8a37c5947c90fc02c8e5ce7f1cfb80d"
+SRC_URI[sha256sum] = "a290c2d82bce7b806d1e5309558a7bd0ef39067a868f4622a0e32e71a4de8cb6"
 
 inherit autotools update-alternatives pkgconfig
 

