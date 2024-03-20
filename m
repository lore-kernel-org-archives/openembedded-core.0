Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCB83CD11BF
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:44:33 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.50321.1710953064553940664
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=y1HStOz1;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5c229dabbb6so12249a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710953064; x=1711557864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bY7pSB6C4iD/cu6hZe6L4ZY7xYl/RsMnvn93Bu5nuQE=;
        b=y1HStOz1BaSkybwN3q6KE26cAmLSj8RM3fzKB/cI93IRrcJf6qXXdD+Cwr+GJEX2j7
         KRaMGFMFBEuOs/LuuJ9S4w0yKaw7VhBlsiTw+0oqFbryiR1/EMzTETUTl/KsVuKZvRuR
         vDal9hImO8Zv7c2+vYR9arvMWTKnk0K2SEOI29XV1E6MY45krENbzH6ZRfm/VO32HTXM
         I5IMRtxTkFltzvfn4bm//8d/hP8Tz7TB+Aj4oq3awEefnhirFsr+KvGwLiQcEns0riGA
         0cunNEW4V3Tusah9c6jWK8pG/0uS42lRv2kb8TbtUYai8aap/5hAW3SHOC/h4lDXz8ag
         uzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710953064; x=1711557864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bY7pSB6C4iD/cu6hZe6L4ZY7xYl/RsMnvn93Bu5nuQE=;
        b=E1kiKldLMtw0HgxaPRFMNvySqLjevaSCIH9pzHblBuL1ahrllGAmqmo5DtdV6Tk5dx
         J1iZnAaEdciru7vaKhe6T9DVMTLvP+T0yMoEnI/KjHjOQh2wDfQMvFkI9obb0gjSYVde
         oa7wHZRtuPEWfcDZ848PYgpETmnjxGB5iQsLCc1RRWg1UdBQh7L8+FI6l+MJbY6q/Vj5
         JxrABqZBQU2sd9lsCEKJvDmuFLRX95y5obA2r0yY3J4UWKZtrAiLiKjmfLlJiQn/nFGM
         CH9Q4Wblc8zrkyZoE5SSNxiIrLOfBPXP0ewWn8VtqHywDIhd7mFQAi6xlNbr4x5yp/EU
         BBtQ==
X-Gm-Message-State: AOJu0YwC290KsUMDpLnQ/EABHXxJ1a6Wr7yoiyKD+4plJC5JF6OnvBbz
	+lVKUmTBAYX7bmQusUJzkDBzB6tQcZXSvPyKzbbtY6qAQU+ywZm3JyceNGbG3ZE972EcKLpQhmw
	S2Zo=
X-Google-Smtp-Source: AGHT+IH7j2/ngd/p3RPTc4cMUmm1FbwPPGRwTnkwiC5Lx3SjoVf7ghULUb8mgGmWZ1cmIqcOziqc8Q==
X-Received: by 2002:a05:6a20:3503:b0:1a3:64a9:11e5 with SMTP id d3-20020a056a20350300b001a364a911e5mr5249549pze.50.1710953063849;
        Wed, 20 Mar 2024 09:44:23 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a3-20020a62d403000000b006e6bfff6085sm12725437pfh.143.2024.03.20.09.44.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:44:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/12] cve-update-nvd2-native: Add an age threshold for incremental update
Date: Wed, 20 Mar 2024 06:43:57 -1000
Message-Id: <c9a3e5a4ca297249f8fd7380a824dce0c407280b.1710952928.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710952928.git.steve@sakoman.com>
References: <cover.1710952928.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197390

From: Yoann Congal <yoann.congal@smile.fr>

Add a new variable "CVE_DB_INCR_UPDATE_AGE_THRES", which can be used to
specify the maximum age of the database for doing an incremental update
For older databases, a full re-download is done.

With a value of "0", this forces a full-redownload.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 74c1765111b6610348eae4b7e41d7045ce58ef86)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../meta/cve-update-nvd2-native.bb            | 20 +++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 9b6e746add..af21989d58 100644
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
2.34.1


