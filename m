Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FBBAC47079
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 16:14:58 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.868.1704730487924131892
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 08:14:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Kzr/4mgA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6dad22e13dcso918676b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 08:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704730486; x=1705335286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ciOVFYN4NTpoEnTDMR4neSUumR8U4dkfVFt7Vr8U6OY=;
        b=Kzr/4mgAttlY9mQM1Spat1GdYszAxfqgaxnrsMU9P7iRkS7z6OkYQ8M0GgF3LWWzX8
         xzTsg7zJF81uPZqGBcB990LqWmSKo+ITOD35MWNoR7s1wVgxOxiLuHUrtiWdCCoMDR3J
         AXXOeCCD+MexZZS1GaVSfcQMseqN53NcJjFh+tJGU5SBVAt9ITBPXgYyXzXA3sMRIbDk
         DSF182lDkuUJ/EtRYF7NJg3h/M6Y+zCJ5b9p2hCQq4EmqkrghWFc2KQthiGuXnOgHLJQ
         0rsvHG+nypnZ+uBmf/fyhSjDlAHhTOsgvhLX2oGVIg0EgDpL7qSfvufPn1sVQCDjdb7C
         vKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704730486; x=1705335286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ciOVFYN4NTpoEnTDMR4neSUumR8U4dkfVFt7Vr8U6OY=;
        b=buhc2qwJC5eDXp0qis3zgJok8nyyCmQip0+uvyN4RrN0ITuhO05tNqBQUDP7mUVtRf
         wfl8Yw3EPnihfVequurpa3FYYc5+kjxlvFrztd6L1he8hXn09IJaUZAoVCE03085BDz0
         T4gCKYWhOX8XJepky69L/RSDE97rVm4AHwYvdw00D79xD62JtXDWNa8Aybvihuv/ElOY
         NwjRKS+EuY8qDA5f4O4ZJodzFfx5+nIVKn9iNdrFZ5EHikYa1bdagb9E3ueZT/mPR1xT
         Ee4U0Pjkfm4mJOO0r/Zi16E/rE9Z3ERhC5uYP78vigqSHkjaOFVqSNL2AW1zSd52X+NV
         6Xmg==
X-Gm-Message-State: AOJu0YzwCjkAcfgPd5ImnuORB8lkrLIA1dblsuVRbvthVv/BJv+nnyB+
	5WyqdC7vywBFYgijoe05kTNqOVveKmmgEfXWEfam2zF0UGKuNQ==
X-Google-Smtp-Source: AGHT+IFbZ/Iqb8Wu/Ey+RhcROGVlfaedCNrVwxJx7Mi8wim6UPafVlfrIx5rvUeihi607z/HKySWgw==
X-Received: by 2002:a05:6a20:968e:b0:195:3022:9ec6 with SMTP id hp14-20020a056a20968e00b0019530229ec6mr1280771pzc.102.1704730486393;
        Mon, 08 Jan 2024 08:14:46 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a11-20020aa78e8b000000b006da14f68ac1sm45753pfr.198.2024.01.08.08.14.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 08:14:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/6] cve-update-nvd2-native: make number of fetch attemtps configurable
Date: Mon,  8 Jan 2024 06:14:29 -1000
Message-Id: <10f1c16c813668b081ce204cc3c19d1d12963788.1704730354.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704730354.git.steve@sakoman.com>
References: <cover.1704730354.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 16:14:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193418

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
index 64a96a46f0..dab0b69edc 100644
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


