Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAAA4C47072
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:45:17 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.150990.1703864707989847905
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:45:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Fvitb9WU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d3eae5c1d7so30788445ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864707; x=1704469507; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iN6MCj8BtC0v+WxMrTIp3OSbfSMroofxG4vHbiZA/ko=;
        b=Fvitb9WUETyIzQkLZMfdXYyzj00rmnD9Yg348/kYMnAzJYxaL5PU8Ajfh726iMaJtJ
         LHfGKIj5/hQJ3dWkMP9g40WFnjIAijcO2BdlMyVFeeSEErz/ktD6xnjXeaKZ/rxXsVMR
         dquBKmejO+gKBCIPMoWC4gOxcjq7B0hzLBZyqretw5ZaCmbSqWvINYCFo34jDG/PPLu0
         lD1Cs93e+N7s/Gke+zfR8KHwLGVdMh+jrqYXRqsyfq+brdtzzkO00zztgn3xFNWk07jm
         zj3mQ+FA0OdeKC5FfoPjZKGXr7WqzzUI1bE9kwyGrYX7F7G88WMCz1T+f91BpFkHLidx
         K4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864707; x=1704469507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iN6MCj8BtC0v+WxMrTIp3OSbfSMroofxG4vHbiZA/ko=;
        b=ITK35b8wOw2qF0FcBOkGBvtBm3F4Rc67ILmHpHer2DvBNCLgb4m4hKNJuE93JW/yl9
         XedW/AEzGBvqnsEC5fVyHNdaA+aGZrSFXp5SXB5bZd55wTOPYbYAU/HULuhLMRFkB/n4
         I5Hl8K+09emDC5j72YXoP1wh385K5YQjRZdBWhlJlIBSW/813eF7RhRIYoEhFE/bbwNL
         XKg8k0eX6WjUDeCYAA5pKzUpO4GndPBw1Ow//qTEtxMxEvyD1JO1EQaON/n2ZtVusrDq
         iOGYZjTuwyXg5CBSy9H7Z05wrE4WyytnMiFGUAF1Qh+eKp63n8z06Ng83gOUqqvNnAPS
         JKNg==
X-Gm-Message-State: AOJu0YwSOg9cB+fzZprXW+s0cN2HIlRCRrwhIAKTmmWWT7oeovFysa5d
	7oLenaPuu9WISLFcz8h5SwrGnniTk6ZIy8xTJtSnBkeTmbKw2A==
X-Google-Smtp-Source: AGHT+IHaBFrNrKN0r1jmuj9qxDdmkQ2s1uh/LKJHNsU23UgQX27CChyXNS2rG+FlGv2ccV75WG3Kng==
X-Received: by 2002:a17:903:2306:b0:1d4:97cb:37ae with SMTP id d6-20020a170903230600b001d497cb37aemr1509831plh.58.1703864706637;
        Fri, 29 Dec 2023 07:45:06 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.45.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:45:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 02/41] cve-update-nvd2-native: make number of fetch attemtps configurable
Date: Fri, 29 Dec 2023 05:44:16 -1000
Message-Id: <3573b0ab09359f7eca37fd86400dc3945f5fa7c1.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193019

From: Peter Marko <peter.marko@siemens.com>

Sometimes NVD servers are unstable and return too many errors.

Last time we increased number of attempts from 3 to 5, but
further increasing is not reasonable as in normal case
too many retries is just abusive.

Keep retries low as default and allow to increase as needed.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6b6fd8043d83b99000054ab6ad2c745d07c6bcc1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 08895013cf..9ab8dc6050 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -26,6 +26,9 @@ NVDCVE_API_KEY ?= ""
 # Use a negative value to skip the update
 CVE_DB_UPDATE_INTERVAL ?= "86400"
 
+# Number of attmepts for each http query to nvd server before giving up
+CVE_DB_UPDATE_ATTEMPTS ?= "5"
+
 CVE_DB_TEMP_FILE ?= "${CVE_CHECK_DB_DIR}/temp_nvdcve_2.db"
 
 CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_2.db"
@@ -111,7 +114,7 @@ def cleanup_db_download(db_file, db_tmp_file):
     if os.path.exists(db_tmp_file):
         os.remove(db_tmp_file)
 
-def nvd_request_next(url, api_key, args):
+def nvd_request_next(url, attempts, api_key, args):
     """
     Request next part of the NVD dabase
     """
@@ -127,7 +130,7 @@ def nvd_request_next(url, api_key, args):
         request.add_header("apiKey", api_key)
     bb.note("Requesting %s" % request.full_url)
 
-    for attempt in range(5):
+    for attempt in range(attempts):
         try:
             r = urllib.request.urlopen(request)
 
@@ -183,10 +186,11 @@ def update_db_file(db_tmp_file, d, database_time):
         index = 0
         url = d.getVar("NVDCVE_URL")
         api_key = d.getVar("NVDCVE_API_KEY") or None
+        attempts = int(d.getVar("CVE_DB_UPDATE_ATTEMPTS"))
 
         while True:
             req_args['startIndex'] = index
-            raw_data = nvd_request_next(url, api_key, req_args)
+            raw_data = nvd_request_next(url, attempts, api_key, req_args)
             if raw_data is None:
                 # We haven't managed to download data
                 return False
-- 
2.34.1


