Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88017D1CDDD
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 04:30:42 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35238.1764822635873114183
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 20:30:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k8TlZCK0;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-88051279e87so4526066d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 20:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764822635; x=1765427435; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYHEj/Th/yGFpbNsbW9Qp02OKNh9FrLCdI4QN+rsA98=;
        b=k8TlZCK0yZ4iL+scitYoS2Eo4XcBNWYXdYQ82ZJm4/iMC2riZkyA2ZJnIS5hndhxJB
         QsF0tOoSy1z0Dna00hmZsS3silpFG6n7qTOhc4x6176ua6jx4YHasiiJDW6AbupIyMmh
         13MG02aPBF1ESQXortGpleRpSEYYboKIuo3mPF71w//7SSCghnun9B4RxZwRkhDhSF0k
         Mv7VoiguPmPCq/J7OgsNaDd02zGKtnC9pVYX0eTCBaHW4YWAu8PqJtzKDW3kVQ8Zidy9
         O1je8lHgeZ5xJeq8SNTjPCjWm8bd3ad70v0KUhNj4W3XOzaudtl6j3nnhNb8YuVKnuW/
         fSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764822635; x=1765427435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HYHEj/Th/yGFpbNsbW9Qp02OKNh9FrLCdI4QN+rsA98=;
        b=s18rLnqHVVgURhyDyDNS9cThsI6NOnhu35gpJdm6wlqHMvbmcXUMgMkkhhQGuXXmpw
         RDkP8KNMyfLFzojBqZlPUGKGY1NXfV1fLlw3Mn6V04GaVFqJrP9TRVDhjRTJAoYIW4Ik
         bGIWbbKzhBPUgcF508qgCteU8UhUjbWiUOATAU6YgsmoIMkcznwUGgmCMwASGojduUh1
         Z26wGJMK8dItqEYGy695Sog0FXvjwic2C5mS7jnFWvU00iDL0eyCkvJAjBVDMSgg5W/p
         EVUAE3CO1hhPD5iB24Fm4h6MhUDyoiESirYJtJ6ydsPAdtz2DgG5YgWueTvicOFQbuIp
         5gMg==
X-Gm-Message-State: AOJu0YyDATQhUdT/z5TuGdzOYNHxX0GV/Ivk9re6xkqLLYrlmKC0kO4x
	tB7K6pEcHe1I4NMxpYbXnSFCzxywSCVJCMYuy5E6wD+gWTzSPqHlAMpk
X-Gm-Gg: ASbGncvkDO7UoY8gzcLfc3ytN1yOkL9XnOqUH+ubqWG5dHWrH3XWbWPB5QYh4C3e9IS
	NCgAQQ6+C7z6l8KSyzRjZ+oHiYbWk7o6MSSogPNs2vmdLcJqsq34KOkda7zrmYKJP/Cy7GBNIFb
	GjjJqjaDZWSfQZXKTPklZZyGMNbm+HnL72ubrycyZ6Lq4IGQcnAucxUcn/8krwsPBY//aJ02IDp
	IxQNaXvpJdCnJ0d5nsqKWBiBq3wFflcrDSPTCY2nn5XHfzUDBJX9x6ZyqFClEGabdCpeyM9OXeJ
	gWur39eKIXwe2NsdPXAbu2A5gpB/T4dh2PRKoksIBYGNBLrm+gFqVnsItl1sz4BvCLKSJAA+im7
	luu+zWRy68w9j9oJVwvI6PrCS860QdDqx4kyw1KEDK+aOTELSnubtCRl53m4lM/JIfHV1cYN2DP
	Nsb6+bwkKAPtBKBWZQ9cuRRWXpslGXwFogIXi7QDazp/kaPZbK+XVeEyil/D9Z8HPDL5KHNHrPn
	7bZw7Pa75sO2kKW/Ak5uYFAuA==
X-Google-Smtp-Source: AGHT+IEMN60qxVbprvw6CorSmTydelOaqNAZ4f20WPfrlFyJqsw5ySykQIwHXLLy1hTZW+fSb2xmsg==
X-Received: by 2002:a05:6214:4697:b0:87c:2687:979a with SMTP id 6a1803df08f44-888194eeffamr75416956d6.29.1764822634816;
        Wed, 03 Dec 2025 20:30:34 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88827f3347asm3191476d6.6.2025.12.03.20.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:30:33 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/16] linux-yocto/6.17: update CVE exclusions (6.17.7)
Date: Wed,  3 Dec 2025 23:30:15 -0500
Message-Id: <a914367244b9abc312ce60667f08402b431b3b7c.1764822465.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1764822465.git.bruce.ashfield@gmail.com>
References: <cover.1764822465.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 04:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227254

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 5 changes (0 new | 5 updated): - 0 new CVEs: - 5 updated CVEs: CVE-2025-43384, CVE-2025-43408, CVE-2025-43435, CVE-2025-43474, CVE-2025-43478
        Date: Tue, 4 Nov 2025 13:42:11 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.17.inc | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.17.inc b/meta/recipes-kernel/linux/cve-exclusion_6.17.inc
index 126afb8ede6..f60050d6470 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.17.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.17.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-10-30 16:47:14.266821+00:00 for kernel version 6.17.6
-# From linux_kernel_cves cve_2025-10-30_1600Z-2-g07cefa3115c
+# Generated at 2025-11-04 13:42:54.522185+00:00 for kernel version 6.17.7
+# From linux_kernel_cves cve_2025-11-04_1300Z-2-geaff4df6d09
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.17.6"
+    this_version = "6.17.7"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -17644,7 +17644,7 @@ CVE_STATUS[CVE-2025-40082] = "cpe-stable-backport: Backported in 6.17.3"
 
 CVE_STATUS[CVE-2025-40083] = "fixed-version: Fixed from version 6.16"
 
-# CVE-2025-40084 has no known resolution
+CVE_STATUS[CVE-2025-40084] = "cpe-stable-backport: Backported in 6.17.6"
 
 CVE_STATUS[CVE-2025-40085] = "cpe-stable-backport: Backported in 6.17.5"
 
@@ -17688,6 +17688,10 @@ CVE_STATUS[CVE-2025-40104] = "cpe-stable-backport: Backported in 6.17.5"
 
 CVE_STATUS[CVE-2025-40105] = "cpe-stable-backport: Backported in 6.17.5"
 
+CVE_STATUS[CVE-2025-40106] = "cpe-stable-backport: Backported in 6.17.6"
+
+CVE_STATUS[CVE-2025-40107] = "fixed-version: Fixed from version 6.17"
+
 CVE_STATUS[CVE-2025-40114] = "fixed-version: Fixed from version 6.15"
 
 CVE_STATUS[CVE-2025-40300] = "fixed-version: Fixed from version 6.17"
-- 
2.39.2


