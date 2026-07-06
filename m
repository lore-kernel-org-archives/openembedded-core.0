Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB3BCC44508
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:33 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155305.1783358244923020303
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fuWwBiTp;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so21068695e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358243; x=1783963043; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9aFH1Nozi6dwZT2G6pcn/XKkkAUV0WGQWCjhOz0Ynlc=;
        b=fuWwBiTpCdK8uhjU04rJVTLf591bA7sup/AT/DvxJdUiC8aK0TNpplQcPJEZj/kmC6
         OrEuY3sov8rgHWWkPWpIyiq+foNZqxMfCoteTCHLxGt1GlRGYERTWxyqxc0qnq4yc/WC
         Dnqqr3vvMUhPpOuv4331yvjblUiE0bprSFeOXi4bs24Qzsshx7Gr7PwqWHcR1HFNJRT8
         4jju2iqBN+QjbKGwHWIFmsqdrWsrphVbctAfkorzB2waqkD7TIsYbvaqZvfS4cs84lk4
         R1QaRa1enEb6w9OufCjfN8I/huWFERjRwZDZQJaN6Fg3mbC+bTAC6kZ84GkIYRTgWPuu
         fh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358243; x=1783963043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9aFH1Nozi6dwZT2G6pcn/XKkkAUV0WGQWCjhOz0Ynlc=;
        b=NoMS67P7cUyabKTsstaaBbUvhKBJnV88x8dRf77kP3kiaAemitspHGH3sJmZ9B5sez
         91CVgxGbG+1akHwJCg5o0bqWQeF6pFBrJeVzH1VwGpAUQ4SExS5FTW7UcQ8JmvciwNBK
         nrwQXoHgKdfZz8KCBZHmDogxZrmeo7OMzQi9LoJjckrLBFbBEyTABEHMbL2g7c/EDCxR
         YBktHcMQr2khHSqwwtraHdGjcv5sdWJNlY4cNC/sgN9+yTJ9lDmB7gmAo5z0mvO6IN2e
         WVjUfHKpaEAI5bsaptYX88tuPp3eIxYocqOP3YQodG5I40vw0qX4bYIWEZHRMJqr9ftX
         kEgQ==
X-Gm-Message-State: AOJu0YzJbdKIpH3UFIabuchDKnm73u24Lq+0uuvN7H2etAf51qHI0H6+
	HbZmyJSfwYOj6rPa5sy5NVitYeOKo+gNGdT6EHk7zSDEZ3tayIR0V+BkPQLipA==
X-Gm-Gg: AfdE7cn5gpk0Jv/cWbd5fpmo/0AxbKcoARY+6Yn6fl+DSn5aDbN9dkwbCbOA7evKmIU
	I5q3ezGQbKeVRPYpfjjIQwFKQjHKmkKrBvvvdVYKWGbIJ8K4VdKy8/ci3qi7nKi3KB2DlmTFF9m
	m3I8n8FPJtgYSbMJEJCmXg5fF1M7t167ctFYfpcIQYb84UbzzwT98VBLzgxORH1u28Xe1Ho6Z1e
	7y4aoJZd2MDF8l/HkyVFWMXQPGSdN2TuujWtwpb2vEczx8694nhPoh+413tDvGoRAz55XjxPRKe
	K1Hr2YeEHNRB6LDg2HSXYWRMY9B+sVs8jO6nJv6Yq/LYnq4axgyhA7ZFTtlnSI/qhz08lOrwDRD
	iqJQLkROnhIslfRVN2JQ3i4V9dKVhkzBdC8v14HK/CJKMtS4ydaYzXYNXcTJNGmWbHgITN/PVuB
	qlqZw4Jjtmu+q49N/r97ZzJuQ4COssaDELI1bbgCYgvTLALgu8
X-Received: by 2002:a05:600c:870c:b0:492:4a70:faaa with SMTP id 5b1f17b1804b1-493df06fefbmr17689005e9.11.1783358243114;
        Mon, 06 Jul 2026 10:17:23 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:22 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/45] libpsl: upgrade 0.21.5 -> 0.22.0
Date: Mon,  6 Jul 2026 19:16:35 +0200
Message-ID: <20260706171701.70536-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240307

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libpsl/{libpsl_0.21.5.bb => libpsl_0.22.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libpsl/{libpsl_0.21.5.bb => libpsl_0.22.0.bb} (92%)

diff --git a/meta/recipes-support/libpsl/libpsl_0.21.5.bb b/meta/recipes-support/libpsl/libpsl_0.22.0.bb
similarity index 92%
rename from meta/recipes-support/libpsl/libpsl_0.21.5.bb
rename to meta/recipes-support/libpsl/libpsl_0.22.0.bb
index b9341a986e..741038ddc5 100644
--- a/meta/recipes-support/libpsl/libpsl_0.21.5.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.22.0.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9f9e317096db2a598fc44237c5b8a4f7 \
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            "
-SRC_URI[sha256sum] = "1dcc9ceae8b128f3c0b3f654decd0e1e891afc6ff81098f227ef260449dae208"
+SRC_URI[sha256sum] = "c45c3aa17576b99873e05a9b09a44041b065bbfa390e6d474d06fbfaeb9c7722"
 
 GITHUB_BASE_URI = "https://github.com/rockdaboot/libpsl/releases"
 
-- 
2.47.3


