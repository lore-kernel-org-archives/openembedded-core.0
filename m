Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD34D5807E
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:01:53 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.17096.1732536110435709170
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CxmmkB/e;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539eb97f26aso4777077e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536108; x=1733140908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aacLE2AGsg+f2GkKLe1uEZQu+XnEfe/u5GE0NP5qjq4=;
        b=CxmmkB/eNcgzsL9gjcL8xyf8MF875WTjqnD/X/4oRku5QlUOprwr6LD/oI0TvBzHRV
         twv/xpPHJITRe0KiCZel2227HZQhlNu1oBbHm4qynFR2zgMNLzi+HxCQl9oNraNleqYT
         DF+QpAuR6ZRSABoqqe5CrKJ8PX5dSh44/qgdINPtQ6GBtXEBjYPFU8Zxl0oif/AjGfBl
         T06enA+02Itw9Ytf8Hl938Yy/usWxwFHDNDml70Plwf3xPPxuwsPwA3f/uhG/80hgRlz
         ZsQQ8i9Va70pbIhBxdXQ8YGm9tETT2VvCIZxC8QpbiLYG6xvn9D2Z7r2VvTn++lS8Yzn
         heWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536108; x=1733140908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aacLE2AGsg+f2GkKLe1uEZQu+XnEfe/u5GE0NP5qjq4=;
        b=oo6tBrOmfuWaydMs80Pfn9Q/skzQQN8gex9WtU3+ErvpYj6r5rsRMo+w9Q5rY930u6
         dBGnYcvIQZr9qPZwW/WqK40D0+JmnrBl6C4+n9iKcHdrGyQjB06yTdWOqOcJVrMsZ+QV
         VyHGUA8bUjmQ6TxuXw6zNJN/pgE4lB25m1TrZbjyRyylf92NYgdrbLshlSQRySzeT5bt
         uoYwUIglDhIMVO82ESadLgVMpsMTxTQL+rQJ7pHUB8NXNW8bX2F84Z1qWfHiaa4Pd/B0
         HzqyZ0DUypceDRDWBblhjnd2h6f97dn9701OQTWznf6mCg9tOGQ9jAfiOwcm5mucCTOG
         HyFA==
X-Gm-Message-State: AOJu0Yyr2nqagYkp0EaACClqiu64+DHwvnu6lrLKXUJFWB2nUyzAApNi
	53g86xN1yRZl3J8lbj5t9mJkjaSe7TywlxqvMdyIuilPGIdLH7G1qFpuCA==
X-Gm-Gg: ASbGncvE2F/JIBul1Sd30lVvt2F0pgqtsY7Fl9tAgi+WF8711Pxppahej6Zyc3NYw27
	T0xedfxmVrZNShcsEtmDFXR+UBrCEx/StQm/JmQr1TNkvFx85rf3iK8Z7IRivHMPF069HJ/tDqx
	1lWPu8NEnOGHoiGTxPvSJGWtJeg9IVhxJ9tiMFs7Om0CFqDoWZ7gpCgnMSaD+wXAbZUZ3L6+NmJ
	WnsoH+3/DJt95TthfVVieMRjZmQK2+9wQ+BZxk0tK6PK1chwKxziqk97LAJrAuk/tYvReM1nuBn
	Is/ee+r5gdA=
X-Google-Smtp-Source: AGHT+IGtOx2IlytV7w9qviDj651aCbSMWIImMRWOqIzcMP/O+EWPxWJsZOMi1jYiELJ08w7PxS0BcQ==
X-Received: by 2002:a05:6512:3e0e:b0:539:f807:ada5 with SMTP id 2adb3069b0e04-53dd35a5ca0mr5952614e87.3.1732536108302;
        Mon, 25 Nov 2024 04:01:48 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:47 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 24/35] python3-psutil: upgrade 6.0.0 -> 6.1.0
Date: Mon, 25 Nov 2024 13:01:16 +0100
Message-Id: <20241125120127.2205232-24-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207772

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-psutil_6.0.0.bb => python3-psutil_6.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-psutil_6.0.0.bb => python3-psutil_6.1.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-psutil_6.0.0.bb b/meta/recipes-devtools/python/python3-psutil_6.1.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-psutil_6.0.0.bb
rename to meta/recipes-devtools/python/python3-psutil_6.1.0.bb
index 787bc61e89a..bbff7f3fe52 100644
--- a/meta/recipes-devtools/python/python3-psutil_6.0.0.bb
+++ b/meta/recipes-devtools/python/python3-psutil_6.1.0.bb
@@ -3,7 +3,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a9c72113a843d0d732a0ac1c200d81b1"
 HOMEPAGE = "https://pypi.org/project/psutil/"
 
-SRC_URI[sha256sum] = "8faae4f310b6d969fa26ca0545338b21f73c6b15db7c4a8d934a5482faa818f2"
+SRC_URI[sha256sum] = "353815f59a7f64cdaca1c0307ee13558a0512f6db064e92fe833784f08539c7a"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.5


