Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98218C021A0
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 20:49:58 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.17294.1739652592701915425
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 12:49:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D19bUR1j;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: festevam@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2fc3fa00323so1912511a91.3
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739652591; x=1740257391; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xpAlARgXtUkcEDaGw4x/NRBkwE8cd9rq2qSo/vvggPE=;
        b=D19bUR1j+DUe6J3B/GTi0X7bXFs147Zjy+v5GyHcrjtnmfd1a+OaCG2pax4+Gab5CZ
         v8UjZufZMOOSRQSmPH7XMMtZhNfBmDVvC0aitWx+bOunMqaFpbZrmsoDQBE2cMP/D+OG
         f9xr710tmlQFEMdcIErKeO3gY6jnvRAjpW5jLEapEiB8kaPchuv9S+v6JxWwwJ667oWu
         ut+M9EXoPpKKDxd3jxjTN5MbFbWJj7z1/1aAHhgOqW+hXlmfcgX54lEJuxOALko9YiLr
         L2que2cBP+X4hL1ZZhwBYw8+fZvxuyXIOAPLI3EfvkBIMrIPHFnB0JV2pMk0VZTSBwcX
         dE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739652591; x=1740257391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpAlARgXtUkcEDaGw4x/NRBkwE8cd9rq2qSo/vvggPE=;
        b=V1QqEmn3KLwLthWyO5mPBy5ZSRiZQIGp1wzP/A8Roxsty6jR0pjo4DtvFUg1rprf/t
         1djQB06dp5P/NFQSZ/Kfpcms0MWewHlq0FG+K2TqXxgxGT7/iQU2TRD5A6H/pjvVHxV0
         rQUWI/xVu3GDqsM6gMYo7d7UOrUp8vVvgHHPkELL0a8Dae8/Dzv4qAHRsVxerVCKce9x
         ZwtsERe3m9grHHiSdCHKgFgymzqAIYC/JyaqlU2lwoehhAqXOCu6tryfVjW7EDZ3h4GM
         cgdF4/vX+WI7qBtZ1gkWuoDcLjo3hdFSosp278kvSfN6wfrJ5UDU4J9ekFTT9jY8UO54
         OFbw==
X-Gm-Message-State: AOJu0Yw8a14eU7R3IQkvrrKM4Dp1byC2bGdv3ZlNojOpwj0JYJEHtuLF
	tOrkNTjvj0+lwlXFstkX8hZfXTQl2t7muqcBhn5nLp5/1lPLDqdhGJ6Jqw==
X-Gm-Gg: ASbGnctrKIKp5wGkzEmiiHt4XngtLs7WvvbdZZQ3txY1PxGJgNcPOGY/o/jmU8N+RVl
	kMTYGuZGkd1mpE57ymOa5fJNnZQUlHtpbVU5pU3uOti28ojNlHycqi6cMr8oQn0veEUWRcbcXRF
	FUEC79IWpwy3LYfDvTRShNktoir/s5obzlHMZzkQPsiSL0QXRDQO2Ivi6SijvSBrYA8gR8XEkA0
	5Va4xqQgjNC+u3ESSyfpvZ8Sf306VNYYX/03fL5fADrSzwgh6RrTsNSETXR5ZXbBx0liPbYm23r
	nhDs7iuGF7kHQrPg998vbhKv1prA+A==
X-Google-Smtp-Source: AGHT+IGN50toqoUurx8n7MkDGNwd1tdKq97TmGfqYxcLVh9UQ6y1IU8m/87xFktNvODyIFRksvbtUA==
X-Received: by 2002:a17:90b:1e08:b0:2fa:1851:a023 with SMTP id 98e67ed59e1d1-2fc41150587mr6216000a91.35.1739652591102;
        Sat, 15 Feb 2025 12:49:51 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:1ae6:f300:bb6c:66d2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fc327a9d68sm3731353a91.1.2025.02.15.12.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 12:49:49 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] mtd-utils: Upgrade to 2.3.0
Date: Sat, 15 Feb 2025 17:49:41 -0300
Message-Id: <20250215204941.1453502-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 20:49:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211490

From: Fabio Estevam <festevam@denx.de>

Upgrade to mtd-utils 2.3.0.

Details about the 2.3.0 release:

https://lore.kernel.org/linux-mtd/1b7a55a6-1c5b-4e86-8006-e2010e54367e@sigma-star.at/T/#u

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../mtd/{mtd-utils_2.2.1.bb => mtd-utils_2.3.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/mtd/{mtd-utils_2.2.1.bb => mtd-utils_2.3.0.bb} (98%)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_2.2.1.bb b/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
similarity index 98%
rename from meta/recipes-devtools/mtd/mtd-utils_2.2.1.bb
rename to meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
index 5ab5f6c729..e27a8b0a17 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_2.2.1.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
@@ -11,7 +11,7 @@ inherit autotools pkgconfig update-alternatives
 DEPENDS = "zlib e2fsprogs util-linux"
 RDEPENDS:mtd-utils-tests += "bash"
 
-SRCREV = "13ec33609213c1dbd75852a09560a707a7f19a5c"
+SRCREV = "4594fc1f4496a0ed55cabd31fbeba4e3fbf05602"
 SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.40.1


