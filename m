Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7125EC433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 22:13:09 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web12.3504.1645135988952715979
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 14:13:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=a8i36BXv;
 spf=pass (domain: konsulko.com, ip: 209.85.222.179,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-qk1-f179.google.com with SMTP id j78so1464034qke.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 14:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7Kc2F+zOme1uvV159mYF+buIzRKoptrCwLSE7h3oadk=;
        b=a8i36BXvdJLQWyv4y3Kbn34B6dhQADOxRukQfG+gpIbTV9bzxPimYyll/XC9MVufzD
         NUuBYxB2rzVqADJ5et2eCyu7thmtne/+pdujQf/GMtHdfy1k/GzAQld9Np/cxzUxuTxC
         8hPQlGT5/Sg+cHR7uwxz4G4eUqQaRSjQADt7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7Kc2F+zOme1uvV159mYF+buIzRKoptrCwLSE7h3oadk=;
        b=si5l2zwCBXxK6k6XjUNbT/g5XXzu7aaRxanEpWt1YxlrXOdOvVRkzMzwa857fq06ux
         y0y1CFBBzrS61eedY5uYon10V5z4dbenMKVRW2dmz4p3TtJmdaRT/CvB2o7TLPRcJHKw
         arh+3wv1gE1EPJlD1V4xj8ZOxyVNcvHGFonsRNB3Y6oQpSIkpPHmAG1zK8pT1RX8SeGg
         zvvZdmL6YJ8fZ4KUZgOy1cipz8X9dy4P8ENKSEPI4nS3OqdR8KRXAvgENx7TXxB9dpf+
         83S1orwqUBapa5OkhizYNpPIXTP4P4psJUKMTqC+cNHFTQi0YtPGc50MD9LFSaGndKDq
         oeJw==
X-Gm-Message-State: AOAM531JEbHcPcY3UHmM3f0cVy8uJpl+UFTVBCh2U7ktFvRUjn/rFvy8
	G5aOhaTYB9M0kpRPWDvmyfrvR2YfID8QAw==
X-Google-Smtp-Source: 
 ABdhPJxkTMBC5yeOa8xWbDR3eDybFD7Z2l6ahBtksRHeneU0c3M7yLruDjvD388HhemDLte6uENeAQ==
X-Received: by 2002:a37:bd81:0:b0:47d:7533:1578 with SMTP id
 n123-20020a37bd81000000b0047d75331578mr2916805qkf.732.1645135987628;
        Thu, 17 Feb 2022 14:13:07 -0800 (PST)
Received: from ghidorah.spiteful.org ([192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 w4sm21768137qko.123.2022.02.17.14.13.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 14:13:07 -0800 (PST)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Update BB_DISKMON_DIRS use
Date: Thu, 17 Feb 2022 17:12:55 -0500
Message-Id: <20220217221255.1532588-1-scott.murray@konsulko.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 22:13:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161863

Update the example BB_DISKMON_DIRS definitions in the sample
local.conf files for the rename of the "ABORT" action to "HALT",
and also update related error messages in one selftest to use
the new action name.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 meta/conf/local.conf.sample                  | 10 +++++-----
 meta/conf/local.conf.sample.extended         |  2 +-
 meta/lib/oeqa/selftest/cases/buildoptions.py |  4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 7119f0f165..82efc2c4f5 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -163,7 +163,7 @@ PATCHRESOLVE = "noop"
 #
 # Monitor the disk space during the build. If there is less that 1GB of space or less
 # than 100K inodes in any key build location (TMPDIR, DL_DIR, SSTATE_DIR), gracefully
-# shutdown the build. If there is less than 100MB or 1K inodes, perform a hard abort
+# shutdown the build. If there is less than 100MB or 1K inodes, perform a hard halt
 # of the build. The reason for this is that running completely out of space can corrupt
 # files and damages the build in ways which may not be easily recoverable.
 # It's necessary to monitor /tmp, if there is no space left the build will fail
@@ -173,10 +173,10 @@ BB_DISKMON_DIRS ??= "\
     STOPTASKS,${DL_DIR},1G,100K \
     STOPTASKS,${SSTATE_DIR},1G,100K \
     STOPTASKS,/tmp,100M,100K \
-    ABORT,${TMPDIR},100M,1K \
-    ABORT,${DL_DIR},100M,1K \
-    ABORT,${SSTATE_DIR},100M,1K \
-    ABORT,/tmp,10M,1K"
+    HALT,${TMPDIR},100M,1K \
+    HALT,${DL_DIR},100M,1K \
+    HALT,${SSTATE_DIR},100M,1K \
+    HALT,/tmp,10M,1K"
 
 #
 # Shared-state files from other locations
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index e72fb80361..2ea27d044a 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -196,7 +196,7 @@
 # "action,directory,minimum_space,minimum_free_inode"
 #
 # The "action" must be set and should be one of:
-# ABORT: Immediately abort
+# HALT: Immediately halt
 # STOPTASKS: The new tasks can't be executed any more, will stop the build
 #           when the running tasks have been done.
 # WARN: show warnings (see BB_DISKMON_WARNINTERVAL for more information)
diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index 651bb03c7e..bfe613b847 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -62,9 +62,9 @@ class DiskMonTest(OESelftestTestCase):
         res = bitbake("delay -c delay", ignore_status = True)
         self.assertTrue('ERROR: No new tasks can be executed since the disk space monitor action is "STOPTASKS"!' in res.output, msg = "Tasks should have stopped. Disk monitor is set to STOPTASK: %s" % res.output)
         self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
-        self.write_config('BB_DISKMON_DIRS = "ABORT,${TMPDIR},100000G,100K"\nBB_HEARTBEAT_EVENT = "1"')
+        self.write_config('BB_DISKMON_DIRS = "HALT,${TMPDIR},100000G,100K"\nBB_HEARTBEAT_EVENT = "1"')
         res = bitbake("delay -c delay", ignore_status = True)
-        self.assertTrue('ERROR: Immediately abort since the disk space monitor action is "ABORT"!' in res.output, "Tasks should have been aborted immediatelly. Disk monitor is set to ABORT: %s" % res.output)
+        self.assertTrue('ERROR: Immediately halt since the disk space monitor action is "HALT"!' in res.output, "Tasks should have been halted immediately. Disk monitor is set to HALT: %s" % res.output)
         self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
         self.write_config('BB_DISKMON_DIRS = "WARN,${TMPDIR},100000G,100K"\nBB_HEARTBEAT_EVENT = "1"')
         res = bitbake("delay -c delay")
-- 
2.35.1


