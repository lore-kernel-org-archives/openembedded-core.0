Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC397C47079
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:45:17 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.150991.1703864709361837763
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:45:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=E/ms1eZC;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-28c075ad8e7so4789427a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864708; x=1704469508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t1GTXBESAPxJFv/dMvQM/MB5S1C+rtsxCLbTlHCGYj8=;
        b=E/ms1eZCZvqMT2wcKsFHPVoTkuvkHC6B1nKNxdcA7HnOgpfuIgeFA9HxwwGHch0dhc
         ffHap36sxUZ/PBBDBciiwPB4QCyAnSuGBg3zx4Cwj8ArpM3WP5Xd8sW6nTJ9YtGGHvok
         rS+DM7epGPpyUeLI3Otgzx8ftehreoaM+WESw8ouDD75DBbDti/5jn1sFkpvz/yb4uuH
         +m8e7rkgN31/qgkfs+LmbqTi/H5eTbn8cfiZv2l6ivMByHsqCoUfoPQ3RtVlOgJFvAHD
         cpCFGM51LkroZyhiZDjTvK8qsO5NtQyuPnRAKibZvMDgEFtvyfQ+IzK3oHLr+rj+1eYc
         wEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864708; x=1704469508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t1GTXBESAPxJFv/dMvQM/MB5S1C+rtsxCLbTlHCGYj8=;
        b=rcmtz3kRkoHwKmB1X8bFqZQ8V5CPz6/ERS76PH2+ojuhPr6y4GCBJsrr4O7DSxVhPx
         MZ+NMBzPOAEzQYtrMT0xjN02g+Gf7I2kAmHoU74LqKBQ1UeBTsmSs3D1Ris9bUfFs/LP
         GOg52GSv0LVSElEhLQgPeq28hfw+nwL3nKcGbf7lhUp6PoAsNJnNN9mAPWjGuKIweUxU
         Uq4mH3WJetleier70hIPid0TjpjzhBAPUP38W1lCltcnvr5K/KxZbKHIEew2kM/ZAU72
         vW6fGQUmi1bXC/yeiKTIypuKZ6WVylT5sbRO+8Y23cOWs5MYkcGCYa6u3THeW7Z2GCs/
         /2/Q==
X-Gm-Message-State: AOJu0YwGznIASfSCVj9Pzrs6yT+cTRUPuu0w+GoFAZsYwgDMfKO1bGEx
	Vfjuplef1wr9yRrOfhhZ2TI84C4y08PqDC03JFR5FWkCduuNbw==
X-Google-Smtp-Source: AGHT+IGaWgtAVLO6D08OBuJQQkCy/HZq22DOeLYSRvNAoeBk3DFyVd0CzPCtSoCBO1dltAaufMqU6w==
X-Received: by 2002:a17:90a:6082:b0:28b:77c5:9017 with SMTP id z2-20020a17090a608200b0028b77c59017mr6634788pji.35.1703864708412;
        Fri, 29 Dec 2023 07:45:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.45.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:45:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 03/41] cve-update-nvd2-native: faster requests with API keys
Date: Fri, 29 Dec 2023 05:44:17 -1000
Message-Id: <6998b433a0b0609bbcfb99e7c8e96e5d6b534921.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193020

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
index 9ab8dc6050..941fca34c6 100644
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


