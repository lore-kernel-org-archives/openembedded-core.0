Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FEBBC4707C
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 16:14:58 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.843.1704730489448448794
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 08:14:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xZ7REDnt;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6da9c834646so1641151b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 08:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704730488; x=1705335288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RyFqBbnSUU+ogcAP6atDmRL4dkW4omDzlWpY7cBzWsc=;
        b=xZ7REDntfG6EUXVOMQMffB3hKAE5CJ1fvHCDJB9Biz4Yu63Z114wxMexoYI512Qcf4
         b2vmGV/0YPQMV7uP0oIquCDK32tEPo5wEEDow1dUTM5G9VhDng11QpX0YXhnURpbMTX5
         xPdA3GYh5G9fHPMhEerZjL2OVfx6P4zJmCR6vWoIGDGUCnIBq+TrxWVI96jFQN10tJRN
         vvVRYEPguw1c0KPLaQW5KOlRDUNj3R37HnqPWd9oATX8nUur/3C4fTlhrOG5dOxHcmCW
         q9EABidsZ25N7dZWRKyijAYz95/zs0YXt6UeC5fq6UsGKzExahT5x9SSfufXwsYkG3+c
         Lhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704730488; x=1705335288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RyFqBbnSUU+ogcAP6atDmRL4dkW4omDzlWpY7cBzWsc=;
        b=wlKoKdvOyVOXnvoP7zZzRbEQoi+t7BpjhxdkDnrYk1vUHfcAaOYNBpzlrwDFTK9d7F
         n7H79qB9CyCKBxWzxRSn2nLYaKSPoMd50anbTij/MvDvuCUMJW3z1LSK1gRa6eJtw3zd
         vihwf5wMzZr0VRhwZZGsUjG/CsdjCRXHTV2Rnpwxca73Dl5O/23Uhe0Pvo014dcpmHAH
         rn8FECxurXmyCMIbVCV7kr0yAISZUe4911PcXiAMmhOligAcSweOJUWSxDeIg3StlO1p
         uKDgqYsNLJz9Z7Q28CqL8kx8yojJ0sdmWbzsiQtcxwzoJmp/+bmvVygqqvYg8osE3O3R
         szaQ==
X-Gm-Message-State: AOJu0Yy3T3DzCqAMcQt7aOfkoQKwHS+Dy2+0v9xCLxUJjG9XPAezjAYR
	E/EN5KVNsJ7TD8Zqefnny4JPFdqKixSYswy19k4SiXm+LWSrug==
X-Google-Smtp-Source: AGHT+IEytvhSrF9rhMbD6GAdN2429oIPHN1UJjsjV3VfyoJhos+YQusKtoRnYEk/9eixt+ug6J71Yw==
X-Received: by 2002:a05:6a00:4e59:b0:6da:dc3f:e831 with SMTP id gu25-20020a056a004e5900b006dadc3fe831mr4755815pfb.63.1704730488220;
        Mon, 08 Jan 2024 08:14:48 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a11-20020aa78e8b000000b006da14f68ac1sm45753pfr.198.2024.01.08.08.14.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 08:14:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/6] cve-update-nvd2-native: faster requests with API keys
Date: Mon,  8 Jan 2024 06:14:30 -1000
Message-Id: <99f519fc8b141137406bf87a9ad273c82cc0236e.1704730354.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704730354.git.steve@sakoman.com>
References: <cover.1704730354.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 16:14:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193419

From: Dhairya Nagodra <dnagodra@cisco.com>

As per NVD, the public rate limit is 5 requests in 30s (6s delay).
Using an API key increases the limit to 50 requests in 30s (0.6s delay).
However, NVD still recommends sleeping for several seconds so that the
other legitimate requests are serviced without denial or interruption.
Keeping the default sleep at 6 seconds and 2 seconds with an API key.

For failures, the wait time is unchanged (6 seconds).

Reference: https://nvd.nist.gov/developers/start-here#RateLimits

Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 5c32e2941d1dc3d04a799a1b7cbd275c1ccc9e79)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index dab0b69edc..0a8b6a8a0a 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -188,6 +188,11 @@ def update_db_file(db_tmp_file, d, database_time):
         api_key = d.getVar("NVDCVE_API_KEY") or None
         attempts = int(d.getVar("CVE_DB_UPDATE_ATTEMPTS"))
 
+        # Recommended by NVD
+        wait_time = 6
+        if api_key:
+            wait_time = 2
+
         while True:
             req_args['startIndex'] = index
             raw_data = nvd_request_next(url, attempts, api_key, req_args)
@@ -210,7 +215,7 @@ def update_db_file(db_tmp_file, d, database_time):
                break
 
             # Recommended by NVD
-            time.sleep(6)
+            time.sleep(wait_time)
 
         # Update success, set the date to cve_check file.
         cve_f.write('CVE database update : %s\n\n' % datetime.date.today())
-- 
2.34.1


