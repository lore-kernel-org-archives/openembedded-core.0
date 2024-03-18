Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B80C54E69
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 02:22:21 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.34191.1710728531409118721
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 19:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zgs+skFX;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.179, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3c1a2f7e1d2so2518047b6e.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 19:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710728530; x=1711333330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wi5BCHgmwyVh34ICv3uc3jmpyEeK2NcF79kUjPg2v+w=;
        b=zgs+skFX0qRvhmP+bwDvpUqBr7z2nWVVJlwLahBHE82ScdK/vHJVNlPIt4LM6kfC5G
         PBV9pooeCgjCnSQqHXBKwBEtesM4tvwrZcwUNbOC+t1tLCmxYissPSQFcU3JxvW0bDH5
         KjhP9YOD71xCwebzLPdwP/Fqa/Ydx1fhykTRQI/ICHrKrX2rtfEgh+ikO3MAfY6lm3pu
         bN7IIjCl8372ee7CXOeVUHjcU+33m3WXhW2RYp+BElOWMmy0qS1Axxl5ywq02eaxVqjM
         /lVcabfLBwDiEtRbqhvKmbvDARDbzOSyNMsxYQML5VTQZynk9QknON0JbeCs9CNwytaC
         WB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710728530; x=1711333330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wi5BCHgmwyVh34ICv3uc3jmpyEeK2NcF79kUjPg2v+w=;
        b=CH1TEXRpHptONwMdwh/kiJzp/PO1LKZsJF0/0lJwfglFgU3OkLUs/xbgymsaa5LeJ6
         VVbVxKNkaxnRA3X9P83uubJ9pVKbtfJ2eXCIAAa2jb9jFazR2qcc+fKo/UcothdKFS5N
         aIQxGBR+9D9Y1n+QbdnbDJXw8toCb7tZSebXlpW+WzlIBTEqHMvRho/FZ7gWs46a5GiR
         EhIsoBkqXyvvEcYUvNlWU2SvHAy0tFpTsXCpss1iCMvulNlMQYcqf23ekcW5YCNV2IzQ
         b2tu0HVmvJXRkoQZU68XRuwqGacaFJTyyj1yRimkSOH60pTQq8JJ9k/+6rW8H9ks+ClR
         65PA==
X-Gm-Message-State: AOJu0Ywcp7MNF9Bvn65EXBRTKf+0VPvsBt5Ji6iF78dR6YWrkdTaBpiW
	QGK3ulfoNP749xyX7X2p9Hj0dRkmuq7E2Yj+ZY1mFHvqDYrWLNMiXT/LiDLirt/U/YVlZyBHNgG
	ISppVig==
X-Google-Smtp-Source: AGHT+IEkOttDyMT3Rtk5CpSjMv8qzCAuiINbvl7j7b3bTvChqSugcaWNhdCVYVKZrRA3rpbYP3Q1VQ==
X-Received: by 2002:a05:6808:4c8e:b0:3c2:39c8:435f with SMTP id lt14-20020a0568084c8e00b003c239c8435fmr11424487oib.51.1710728530623;
        Sun, 17 Mar 2024 19:22:10 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 25-20020a630f59000000b005dc2ca5b667sm5953953pgp.10.2024.03.17.19.22.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 19:22:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 04/14] cve-update-nvd2-native: Add an age threshold for incremental update
Date: Sun, 17 Mar 2024 16:21:48 -1000
Message-Id: <665c880ff8be1b18c2abe8fa878643dfa64b7d3d.1710728384.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710728384.git.steve@sakoman.com>
References: <cover.1710728384.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 02:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197279

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
2.34.1


