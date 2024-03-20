Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A60CFCD11DD
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:10:33 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.49259.1710951027108394728
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Z/vysQtu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1e00d1e13acso23500215ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710951026; x=1711555826; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bY7pSB6C4iD/cu6hZe6L4ZY7xYl/RsMnvn93Bu5nuQE=;
        b=Z/vysQtuDSNT3LS7KPS4fXS8ZbOZln7LZkrnVmfgP5d2YWT/ystibHBdmlsiJ2pp76
         zvEImqtbqmfhHKqdbCfJd7Sq5galsXnGL9BnP00k6PFgZ5XEjLiTGYw9y9W2UKdW0MSG
         S4FjsO1pZklX/cGlMnOrbq4GzLIujd+3lvhE3zCLAwP3mo7Tty0CK+XIFlgsXUaTqb0i
         OPBxw0xgvwr5kYXxv5fKNGqmLvz6j8H/D7j61CEDdDz0nmGhm6c3/vmsz0miLYmblGE3
         gJyFNFgvcfNjOgecm6K88f4MmqSh6tBhQJ1+1JTJnxM1MJ0AyQYh0Jn4bC9EucS6m9bP
         5QAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710951026; x=1711555826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bY7pSB6C4iD/cu6hZe6L4ZY7xYl/RsMnvn93Bu5nuQE=;
        b=oiqMzMOL7QNN+Wm7VISrXPUlhMfspRfuVRBKoSTr4jelVP6MHLC7wp+LI3pjCML4LU
         qsxi3iwubapeE8Mhd+SX3Y+g8IZsWSBgRMLHNl0NrKlwaxyf9zIRLAYTjLFVCAlw94Nj
         TFbbftFOiavD/c8knd0PWC/LQbePGWjTDyWcia/+DYBYCn/Gmiu/C4E2mnt9QXCXcbl9
         MXOplulOQWY1V+bwRm9Os74pmTmxJfXhfUwwLOZHAeSow9DKV9SuXp79WHSMollZfGgp
         gU8io7IdGKeZeFRvC8LYd62+gfm9C6/+1Ptlv7KMgcV3jiBfdGZksb7+9mz/JW79/xXk
         5GHw==
X-Gm-Message-State: AOJu0Yw2GI3IXzHILwZ62DW0UKk78HVE0jQfD+771JXhUP6S8u/MeGMO
	P3vs44I2E9W9zKNpuEcjcdT75xZR7Pmsg3HrpP+TS8Cj5uQ5izLsUkrTh/YV70nyiOmU/q5z6dj
	O8sg=
X-Google-Smtp-Source: AGHT+IECbQ9NQj4CkRz7J5K/y8tgZtANTMHVXbehrVomsrFKzUBECP6tBcgE4an3hm0t6dJmIvj3+A==
X-Received: by 2002:a17:903:32cc:b0:1de:f18c:cdd with SMTP id i12-20020a17090332cc00b001def18c0cddmr2791087plr.3.1710951026343;
        Wed, 20 Mar 2024 09:10:26 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l18-20020a170903121200b001ddc93c5759sm13775694plh.196.2024.03.20.09.10.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:10:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/15] cve-update-nvd2-native: Add an age threshold for incremental update
Date: Wed, 20 Mar 2024 06:09:43 -1000
Message-Id: <5259971a4785e7f664c0f588f34f8ef537c5c4c5.1710950846.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710950846.git.steve@sakoman.com>
References: <cover.1710950846.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197376

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


