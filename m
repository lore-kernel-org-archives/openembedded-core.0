Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96DA3C433EF
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 21:30:28 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web09.30141.1638653427255145543
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Dec 2021 13:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kbv1jJ1P;
 spf=pass (domain: gmail.com, ip: 209.85.167.48,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id r26so15352458lfn.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Dec 2021 13:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5tqgAHScgGTkTrk9Gr9nMFvoGlCH0PY/sdx9UXjLCDU=;
        b=kbv1jJ1PM3P/LW5c7bHPfqWJ+9VH1o3xkEc31GLdybZQSNXgPWtfikCOCqxx+iKd4e
         CosZYCr2j1D2Zkymje8o4NwbPO5FhRyafdv3EoxK6NsvRoDMOy5Io0aZpuvC0rs/TwSj
         NM/gePWtNHqHdxrv4qnZC9OosjrUjys1NM+UXsWIcs2U4SrxXlqMv4nHGeKdJurpWcqp
         aS0nQXsqikCWaTvr93cblwbzibE2IYlVlLrb2TbnOmbv3C+Q7bKPsUWwOESOhusNmTE9
         7zNehemIvBf7P/xaYlkKsT7iYERaQ42p4jUUkWFimF/6qbrxK2P4kNRXuehrSh/ZRmx1
         +AoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5tqgAHScgGTkTrk9Gr9nMFvoGlCH0PY/sdx9UXjLCDU=;
        b=bik0PoyIXvKpY1jL6b4Ofo9730N8PJ8jfDXaPD6ymn8nphq9wCiB5fw74bmOS15tte
         QGhQMhnXKV8yIm2/DsietcQmdGTw3lvRF+l6IKDQ86dNS7w1tI2gJFY7ZQrKLre571Qn
         cytn5MewlBJ1iQ4gQBIjSLKoye4PRjTJvurm0w8SnI4HAP8fzjmjKvIaeb42aeQXeM9e
         FP7+671EP4G9GNXgm/d6DyHR3lSLkRSCu0jdmTc+wVn6w7Vqf45pvpjIb0EAf3P0Jy30
         NlWbSVLcZ7bKjWT0I42oj6V0gYk7u56W4C5M4GvWuiALbPR+rmN4ebq7eB4yEe+697YH
         2W7A==
X-Gm-Message-State: AOAM5309bmkjMCcfGKb+b6P7++/6ojdVZdTOOBkcPEd2Ne9vp+juXZif
	Ktv0tjk+kCZFb7BWyqqWGjeWlgsnNfaMQA==
X-Google-Smtp-Source: 
 ABdhPJyZ14SnmAJrkB8o+jHl/pntf+dhOltsEgHS3MMbQjYvnsb3BXYqTxTvW0F2XnhyG9AEyphQPA==
X-Received: by 2002:ac2:4e70:: with SMTP id
 y16mr23822389lfs.436.1638653425253;
        Sat, 04 Dec 2021 13:30:25 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 p3sm874262lfh.124.2021.12.04.13.30.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 13:30:24 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH v3 3/4] bitbake.conf: Use dummy rpaths in native binaries
Date: Sat,  4 Dec 2021 22:29:39 +0100
Message-Id: <20211204212940.3787349-4-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204212940.3787349-1-jacob.kroon@gmail.com>
References: <20211204212940.3787349-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 21:30:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159184

Try to make sure that the RUNTIME dynamic entry size is the same for all
binaries produced with the native compiler. This is necessary in order to
produce identical binaries when using differently sized buildpaths.

This is a first step for producing identical native binaries when using
different build paths. 'zstd-native' is a working example.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/classes/chrpath.bbclass | 5 ++++-
 meta/conf/bitbake.conf       | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
index 26b984c4db..a0f2cf0598 100644
--- a/meta/classes/chrpath.bbclass
+++ b/meta/classes/chrpath.bbclass
@@ -2,7 +2,7 @@ CHRPATH_BIN ?= "chrpath"
 PREPROCESS_RELOCATE_DIRS ?= ""
 
 def process_file_linux(cmd, fpath, rootdir, baseprefix, tmpdir, d, break_hardlinks = False):
-    import subprocess, oe.qa
+    import subprocess, oe.qa, re
 
     with oe.qa.ELFFile(fpath) as elf:
         try:
@@ -20,6 +20,9 @@ def process_file_linux(cmd, fpath, rootdir, baseprefix, tmpdir, d, break_hardlin
     # Throw away everything other than the rpath list
     curr_rpath = out.partition("RPATH=")[2]
     #bb.note("Current rpath for %s is %s" % (fpath, curr_rpath.strip()))
+    # Inject native libdir and baselibdir
+    curr_rpath = re.sub(r'/non/existent/libdir-native-marker-x+', d.expand('${STAGING_LIBDIR_NATIVE}'), curr_rpath)
+    curr_rpath = re.sub(r'/non/existent/base-libdir-native-marker-x+', d.expand('${STAGING_BASE_LIBDIR_NATIVE}'), curr_rpath)
     rpaths = curr_rpath.strip().split(":")
     new_rpaths = []
     modified = False
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index fba99e8f0c..1799127c2a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -585,8 +585,8 @@ export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
                         -Wl,--enable-new-dtags \
                         -Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} \
                         -Wl,-rpath-link,${STAGING_BASE_LIBDIR_NATIVE} \
-                        -Wl,-rpath,${STAGING_LIBDIR_NATIVE} \
-                        -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE} \
+                        -Wl,-rpath,${@'/non/existent/libdir-native-marker-'.ljust(256, 'x')} \
+                        -Wl,-rpath,${@'/non/existent/base-libdir-native-marker-'.ljust(256, 'x')} \
                         -Wl,-O1"
 
 BUILDSDK_LDFLAGS = "-Wl,-O1"

