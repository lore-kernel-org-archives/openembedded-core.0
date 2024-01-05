Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3BBC47077
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 14:03:36 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.23974.1704463408137013250
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 06:03:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WkXdA+KA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6d9bec20980so1047103b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 06:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704463407; x=1705068207; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RyFqBbnSUU+ogcAP6atDmRL4dkW4omDzlWpY7cBzWsc=;
        b=WkXdA+KAFvKzzCa1ToFHAXQaP5Dwdt+3nrUlQ6QbZy1yULW/2nX/eH/nUKvqdJfDKR
         6cOi/g15F7+dSdlV2BsFV+UT2KltGH4HMa7djzxQRKa3kSYqZ0qMqCKoStCu86cDnVsD
         3fEvXCrFA6FIb/Ut9vyMVR628PDJ9e8VdFQQXF9rg9RxX024v5bBqW5E9pKaidGujso9
         L9XBhwr+7frR9UhakW1T0ktnNuc+o6/FxtwIuTWX8cnFAlecJQ2tWSF+1feGfKZrA1Tb
         /+21uGzg2D3I7BIhvPXVfan0aUV1sZMsVM/8O3tgqxGlYuxiRx+JIUmeNcyU4otehAw4
         Mfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704463407; x=1705068207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RyFqBbnSUU+ogcAP6atDmRL4dkW4omDzlWpY7cBzWsc=;
        b=NmgS7mrY96UKiv/CvZ3OwVSnzMvCZUpWS4rPyLQRMwHvzpyenRlRNJebcT31tZh3KS
         mHuRYMlQL1q7E4j8S/XtaBnkJXlusw6OOMMglO5frML30sQjd7U6nRgYYlidf3/GI6Vz
         jgwXZUGceV+HUK+0KdhuaMgnQhijQ5oN2W3mZGz2JV97WYmrb1KVPyzvVbv7lO/1NvR7
         RgOT8/fptNf+vjfRvvCwY+nF1SGJMmyQ9Qb1NxLLsEJrajR0/3su26an1rPXD1/ZGtxY
         zXoFkEj4HMT7fqkF+30YFE03si3tDAwUPdK3zJluajaqRpvvr6LlR2RkMRqZ7T00HVnZ
         8fqQ==
X-Gm-Message-State: AOJu0Yx+2m8EWOaPzMlWVC2v3MK+Q9k9rnD3HRmTCAUvso6DHUXuIOM5
	LTfF4ZaOMB4BlDIV0xBf2vPJTtk1V69R2Wlp/0PlfzaVveHc4A==
X-Google-Smtp-Source: AGHT+IGlyfHCq05Y/qok6teymY1a1K2E8KhKNvLm1F89tATUFYTlXrFX1Cly/l9DTsOh0j7XQtd0GQ==
X-Received: by 2002:a05:6a00:ccb:b0:6d9:bad6:52e6 with SMTP id b11-20020a056a000ccb00b006d9bad652e6mr2119200pfv.23.1704463407200;
        Fri, 05 Jan 2024 06:03:27 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id y2-20020aa79e02000000b006d9bcf301ffsm1430097pfq.194.2024.01.05.06.03.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 06:03:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/5] cve-update-nvd2-native: faster requests with API keys
Date: Fri,  5 Jan 2024 04:03:06 -1000
Message-Id: <eb5ab00be33a503205401541e88c32ba9da1d75c.1704463208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704463208.git.steve@sakoman.com>
References: <cover.1704463208.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 14:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193363

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


