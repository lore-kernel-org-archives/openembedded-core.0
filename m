Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66DDEC54E66
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 15:15:22 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.19755.1710342912431104875
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 08:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=vP14R/7t;
 spf=pass (domain: smile.fr, ip: 209.85.167.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-513ccc70a6dso321389e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 08:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1710342910; x=1710947710; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52YJ3Iv5myq3ifLCacpCvi4CVaMFk8eqD7kqVAK4KDY=;
        b=vP14R/7t/XUxvRePVMtlyyJYUUQy1DZoWWMHEq0mQ9K9V9SlUZ3q4Wxks48VlRJpvp
         wde54kXIrFFQUmHZugEXZ7oYVObE/dP6g66Ex5LSuMKJcY6G9T8cYHD8LH96lc3xN2nL
         AqrEPCSQ1G2E7+IqzV1cFJ5jXbkIihHpFaGsr1/MUE2v54QaOIr4RTyCyIh6qP0+aeAw
         A086abm0Ccp/+rFOHTzF/OaxOAPTcxTKDqWuQraJKzIkxs4AmcmG+qRb1ZAU2kVX1r9p
         Kvg2XMMwBpriI1kZtsem5TXdX61cJWJQmxw5HQvCuLlF2xmxGsf36t6A5qUGx8U7eOpt
         s1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710342910; x=1710947710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=52YJ3Iv5myq3ifLCacpCvi4CVaMFk8eqD7kqVAK4KDY=;
        b=Es60IJHJB4Zd8zsq8DwhQamFNkIFAMO3N6EQxZ1gplly0jJT5ubdOaoK4Uq3kfPJNX
         5DC1SfHu98S3B44FKBJRuySRTTrcKGsTdhVoRjJy+D0z9wxO4BBCzEwDOXMbSY8n5Avv
         G/mnxBhQ4LHmxTzC0Gt6cRVlOx+aZbOuMIPkHWKAHxXTUtCb/qgxiOXstLr/J0GpxKm2
         NN8y8Ljs5+96txsTntSSx1/6h3I8qWc9rXseoKV6NGXBMGLwxjp1UyU/ZosAw5BbJNUH
         TAjfKvCh8dMiR/ORtzkrHgXpQbXxkz8tiUu6uzQj8cLBolL1pN2iG88pGnD2VjK+AMsg
         oKMw==
X-Gm-Message-State: AOJu0YwWU4ZVV/GcT2Gt+S+mhe/Fz0EKtUJ4SmgIISV9wasC/8cmeSSJ
	V2QqWJ5Bl00/qz+fEF9bogoR+lZ5QxUfJ0K3tgWA+LhUzvSdL/fqO+uP3mbwP3gO7kobULaL7Ws
	cOvg=
X-Google-Smtp-Source: AGHT+IFO8m6x3KWfPkGEQZz4jIiwFlIQT5EXu96NMT9aPMdKTnXi61SDzWmzEo0dd887aMGS7fLi/A==
X-Received: by 2002:a19:381b:0:b0:513:caa7:3773 with SMTP id f27-20020a19381b000000b00513caa73773mr966282lfa.63.1710342910212;
        Wed, 13 Mar 2024 08:15:10 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id f11-20020a05600c4e8b00b004132f3ace5csm2555875wmq.37.2024.03.13.08.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 08:15:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 2/2] cve-update-nvd2-native: Add an age threshold for incremental update
Date: Wed, 13 Mar 2024 16:13:27 +0100
Message-Id: <20240313151327.2123368-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313151327.2123368-1-yoann.congal@smile.fr>
References: <20240313151327.2123368-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 15:15:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197046

Add a new variable "CVE_DB_INCR_UPDATE_AGE_THRES", which can be used to
specify the maximum age of the database for doing an incremental update
For older databases, a full re-download is done.

With a value of "0", this forces a full-redownload.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../meta/cve-update-nvd2-native.bb            | 20 +++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index f21c139aa5..d565887498 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -26,6 +26,12 @@ NVDCVE_API_KEY ?= ""
 # Use a negative value to skip the update
 CVE_DB_UPDATE_INTERVAL ?= "86400"
 
+# CVE database incremental update age threshold, in seconds. If the database is
+# older than this threshold, do a full re-download, else, do an incremental
+# update. By default: the maximum allowed value from NVD: 120 days (120*24*60*60)
+# Use 0 to force a full download.
+CVE_DB_INCR_UPDATE_AGE_THRES ?= "10368000"
+
 # Number of attempts for each http query to nvd server before giving up
 CVE_DB_UPDATE_ATTEMPTS ?= "5"
 
@@ -172,18 +178,24 @@ def update_db_file(db_tmp_file, d, database_time):
 
     req_args = {'startIndex' : 0}
 
-    # The maximum range for time is 120 days
-    # Force a complete update if our range is longer
-    if (database_time != 0):
+    incr_update_threshold = int(d.getVar("CVE_DB_INCR_UPDATE_AGE_THRES"))
+    if database_time != 0:
         database_date = datetime.datetime.fromtimestamp(database_time, tz=datetime.timezone.utc)
         today_date = datetime.datetime.now(tz=datetime.timezone.utc)
         delta = today_date - database_date
-        if delta.days < 120:
+        if incr_update_threshold == 0:
+            bb.note("CVE database: forced full update")
+        elif delta < datetime.timedelta(seconds=incr_update_threshold):
             bb.note("CVE database: performing partial update")
+            # The maximum range for time is 120 days
+            if delta > datetime.timedelta(days=120):
+                bb.error("CVE database: Trying to do an incremental update on a larger than supported range")
             req_args['lastModStartDate'] = database_date.isoformat()
             req_args['lastModEndDate'] = today_date.isoformat()
         else:
             bb.note("CVE database: file too old, forcing a full update")
+    else:
+        bb.note("CVE database: no preexisting database, do a full download")
 
     with bb.progress.ProgressHandler(d) as ph, open(os.path.join(d.getVar("TMPDIR"), 'cve_check'), 'a') as cve_f:
 
-- 
2.39.2


