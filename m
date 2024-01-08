Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E72FC47079
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 16:14:48 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.842.1704730485978013172
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 08:14:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CVeKvjoD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6d9af1f12d5so1687119b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 08:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704730484; x=1705335284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xi6qd1JPF3xPg/DCk1ZF3l4NxD/DbyPunGfZCoOuSLI=;
        b=CVeKvjoDdJfmU+91XlBw84RAndqx/VMhSMDazAI63A0zGFAU1Ct5izdBpTnBonAO4b
         qhkwIbGNTBesx7joZR9EOAMwtAvKuDx3/e3TQtqlxkfZK0odIarH4T2Zek0nC8NVxiV+
         8Jnm5Ds7PBemHpeTvzoye4I9Oinz9S+RwUtpOGjh1KZ/aFClQi8L979w8ptBqv6TzuTn
         9BmhoJzsQ/zavjTcOx5phgcDKwSVH+huPvtc3u/DNzMG8Zi/sh8QkRpEq+YZV7tn09a6
         niyH5CzSQ8GX77rNCt60mcdmTHymv4MiQk8ZlDK/aNGaQ+rEhxoFnd84z5nCwovUFVD0
         0GCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704730484; x=1705335284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xi6qd1JPF3xPg/DCk1ZF3l4NxD/DbyPunGfZCoOuSLI=;
        b=T/701pF0deFlE3MySL42Mzsr0J5gBrqC3jf8Y8JzC/ONj60nT0XQdADVbB/leVYPN9
         17ucpv4R+xME5lQQUwd5X+yMIvORSjzcXkY9p8VUEo+xwWGtkxj9IVe43l38M+tMmVyd
         bvUx3JkaEdF/3HYOADY/ilyQpFNN2JA+Ljajl2jQ9sSahUeSyYpU0vZVl4oiXFo0Qzra
         au043PLyXEnSvt+vQpjQMlP823WU1DmIQ4AOHAMoHL0ixAHxZpEjGuwXHg2sNfZ5oSvO
         xQAqERmYLnPM5NOyxPgt07L7wGn8pe1tL83udczISjVwH1qnvHs03txFa3bM4oHW9SLx
         RI0Q==
X-Gm-Message-State: AOJu0Yy+6FDiJsmfSdb05IhVxQJRG2bkIfnnkBkl9CNSRytNOYEGjk8X
	82URy19hq4+uyVgh+aFGnqfa+JoKlvGCiJMnCTdVQCk1Y8PbMQ==
X-Google-Smtp-Source: AGHT+IGCa6g4Yvi5H2d/e92qK5MSF/t1Sh9IZdnmISRZlIr1aQuwEub+R3Zhp2B1jOc9WjW6hx7Xqw==
X-Received: by 2002:a05:6a20:1e60:b0:199:86ea:5e26 with SMTP id cy32-20020a056a201e6000b0019986ea5e26mr3131921pzb.112.1704730484678;
        Mon, 08 Jan 2024 08:14:44 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a11-20020aa78e8b000000b006da14f68ac1sm45753pfr.198.2024.01.08.08.14.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 08:14:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/6] cve-update-nvd2-native: remove unused variable CVE_SOCKET_TIMEOUT
Date: Mon,  8 Jan 2024 06:14:28 -1000
Message-Id: <0a73edbdda8af9d4b82367827d1351feef810607.1704730354.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704730354.git.steve@sakoman.com>
References: <cover.1704730354.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 16:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193417

From: Peter Marko <peter.marko@siemens.com>

This variable is not referenced in oe-core anymore.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 905b45a814cb33327503b793741c19b44c8550b3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 67d76f75dd..64a96a46f0 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -26,9 +26,6 @@ NVDCVE_API_KEY ?= ""
 # Use a negative value to skip the update
 CVE_DB_UPDATE_INTERVAL ?= "86400"
 
-# Timeout for blocking socket operations, such as the connection attempt.
-CVE_SOCKET_TIMEOUT ?= "60"
-
 CVE_DB_TEMP_FILE ?= "${CVE_CHECK_DB_DIR}/temp_nvdcve_2.db"
 
 CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_2.db"
-- 
2.34.1


