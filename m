Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51AF7C3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 14:03:36 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.23902.1704463407062240969
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 06:03:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0x/aa1zC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6dac8955af0so956179b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 06:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704463405; x=1705068205; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ciOVFYN4NTpoEnTDMR4neSUumR8U4dkfVFt7Vr8U6OY=;
        b=0x/aa1zCqu1gBDNEtm8OYyBMAUuKz6zmqvH/uqkneKYUSgE7FPnqPDA+aoH1HTrfDT
         6WbvfeMpRlBNwrC1kMkcEvt4J/zHFaszob6/l6ormXPQEdfpF3qF5ACZAFTOtpSuOzeg
         FkAdL53yfl/gtifxZQiQ8xfVOnYL8vEbRSSEEfPiOrea/1z4nGLv02GFQxwDD7g6xkQx
         Vpkmfrra2slrXUOb4+zVBGSorHtd1tGiUkE6Q+uvsB9cMqe4TSkAu9Mi8pjgdueC+7+W
         JDUfyxcf77SaBFX161jpedYYBbdanXJT46/dR4++gXdNXRPPXp168+xd214ts/Nj5frn
         +Fyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704463405; x=1705068205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ciOVFYN4NTpoEnTDMR4neSUumR8U4dkfVFt7Vr8U6OY=;
        b=MHk1WcqSBqC4RLdye/32MoaqClJG5T0pQMCU06s+7AGyd6/hp9ZlnClX0gP5Ng7K/v
         dvocat7EmoqgoaWgBivIw55XU8QUcmjmias12d4fPF9za109BGIq2n0R1zNq/ilkf3Fi
         Tx5cTYho3anbvsTyXdiqDFndtecAxqGR1OJsXxKA013jfP2B85QcDLwFot+RBqM3Ig6k
         bWA2CIbJonOIFUJMgWULJKTHNIL0azn8cvi13O/ph93GW3KJSqwM+zkGTN0kBbNK4rk4
         nfR27hYuszJPw8uCWS8S8HtX1rQ4XKCeca656ktXquSWrk2nkVzaxDOePlw5JfWt7rfu
         2/qA==
X-Gm-Message-State: AOJu0Yzhwny3MAUDiFd6Mw/FqRDGxBgixv5K83pFdP4LBT9PDbNErubM
	XgIJmSCKbcsLfrDhX2b95Wc0B5MSNjX49P/50ToJJAcrmRfvHg==
X-Google-Smtp-Source: AGHT+IFc4GNW/J8KGwSMRScqzvMmRBguou6eC4EMpcdgnIn83I2CTyI07LIQUqH4ie0zrJtqNjm30A==
X-Received: by 2002:a05:6a00:3cc9:b0:6d9:b319:294e with SMTP id ln9-20020a056a003cc900b006d9b319294emr2085356pfb.44.1704463405455;
        Fri, 05 Jan 2024 06:03:25 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id y2-20020aa79e02000000b006d9bcf301ffsm1430097pfq.194.2024.01.05.06.03.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 06:03:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/5] cve-update-nvd2-native: make number of fetch attemtps configurable
Date: Fri,  5 Jan 2024 04:03:05 -1000
Message-Id: <ee2a6ade703317d09f7df60ef7ce300d8f868f54.1704463208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704463208.git.steve@sakoman.com>
References: <cover.1704463208.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 14:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193362

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


