Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA2B9D711B9
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 15:32:15 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.16318.1732116731740382110
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 07:32:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LUa1v+m/;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso41968815e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 07:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732116730; x=1732721530; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OuPjufug0K7IJOE9+nxBi2GBaoftvvt3G/7iVR1y0xA=;
        b=LUa1v+m/PVvM56pCRr7/JdcYBUdl1ilWDM+JoOmVCBzfM8tcZURG2dKHgoLljeZ5Pu
         VzheHMWiIQrPybrGAdPIt3P0RdoZW5wzh+oP1o3OIpj6uAiAg+dK1qyxBMxoFdmpDDA1
         YxYTOhnxsRYVSzRvVh2xAS0MH5C1qdyrKkUUs3RVTuGFKLvKqfNUQ/+VItKgkBiueHQM
         iJCP61X+wOte6hukQlq40yqqZLqEHsENEMR51Eh7FX+aX2bgdKrlBi+FjRoPOl27A6IH
         8NKuR6Nlz8aLqp/SAoNOwYMI2SupiAoFgvnzPNXpq5ly3ReJQ345dPQPgp7yUOToQuPx
         26RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732116730; x=1732721530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OuPjufug0K7IJOE9+nxBi2GBaoftvvt3G/7iVR1y0xA=;
        b=I49nO7QJR3ln/fpoZLbLhNB5j0xlIfoXAVJPzHSop1DZPDjiwNLimJJT0i1KiEEFHh
         EWipQ+MIE5Yre1q002CFGEppnYdfz7MZaqUGb05yQzY3vJD952Mk1gNBMo6zijK/tYXm
         dIk01CFs1m5S/tW9w0k9BJPUiUCIg2vstvA6PPQ4DwKpKMr4fCwPiYAhzK2WDotXKl9m
         HMk2fcBGkcHcN80KtJtS8DMP9GA2aNFktezR1CKOsGcTJ10xR+SytIs4wzbZt2uXhAfY
         U7FM7dBh2+1D30ZwmWqK+mg/bp0fAsBTiZwpGBmU/ONieUEuWs+I86SLScaKMSGJpKaY
         rERg==
X-Gm-Message-State: AOJu0YyWvm0Vff/pFqw6rYVut9bq0pgSNcAS2s5gWOaMznycyg26b4y7
	D8Q4b27P2OWZ6X00hUhFIuUexLhiQaZyiHha7PIfXAwP2xShxPzF4gK5fw==
X-Google-Smtp-Source: AGHT+IFGe6LXHmvrSS4ziMTLA4Qt3hVFlIhroO0S2VBvQMTt3Yl+4dBYsTMTiGDtgQPPn1qTYS6dhA==
X-Received: by 2002:a05:6000:2a8:b0:382:4a45:15ed with SMTP id ffacd0b85a97d-38254b1625cmr1651136f8f.41.1732116729618;
        Wed, 20 Nov 2024 07:32:09 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825490522csm2363349f8f.17.2024.11.20.07.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 07:32:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 1/3] bitbake.conf: make ZSTD_COMPRESSION_LEVEL a number rather than a dash-prefixed option
Date: Wed, 20 Nov 2024 16:32:03 +0100
Message-Id: <20241120153205.2525735-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 15:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207461

From: Alexander Kanavin <alex@linutronix.de>

This allows using it where only a number is needed, such as rpm compression
setting.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 02bbf0e7a52..b8b321dd1b7 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -881,8 +881,8 @@ XZ_DEFAULTS[vardepsexclude] += "XZ_MEMLIMIT XZ_THREADS"
 ZSTD_THREADS ?= "${@oe.utils.cpu_count(at_least=2)}"
 ZSTD_THREADS[vardepvalue] = "1"
 
-ZSTD_COMPRESSION_LEVEL ?= "-3"
-ZSTD_DEFAULTS ?= "--threads=${ZSTD_THREADS} ${ZSTD_COMPRESSION_LEVEL}"
+ZSTD_COMPRESSION_LEVEL ?= "3"
+ZSTD_DEFAULTS ?= "--threads=${ZSTD_THREADS} -${ZSTD_COMPRESSION_LEVEL}"
 ZSTD_DEFAULTS[vardepsexclude] = "ZSTD_THREADS"
 
 # Limit the number of threads that OpenMP libraries will use. Otherwise they
-- 
2.39.5


