Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17EE8C87FCF
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 20:49:33 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.7048.1755118171038410872
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 13:49:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A74u3WK2;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-70a9f5d4d97so3886776d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 13:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755118170; x=1755722970; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2G/rbx13N32uOtjBXB5kevlP1DexzAZWbsavpv/uSs0=;
        b=A74u3WK2X/zO5A9h0fqbIRgXgn8OGep/hI96qzLS3ynizO+yhjYq9CzRnEkFBojrrn
         sRGGddtD6tW8qJ3ttnFkVLJCUxn2B8ctPdROEIvHYT2GryInwv58yJBIhLjLm9ogCfU0
         AWjsYKqFkgT+2TGZpVeUYvXKfsekOYt4ow59DcSdx6VjhkeSbcYi93KrZW/Re81eC0kG
         nUpwdQ7U46L1MOkd4vn8rQbEAJKfV+o36LFX3W+9QFyp/SSTTO4d4+BZjauKd4UxP43x
         YwFg5zeyu5Xl9lslwlsRyeLldmbpqLwQHgZtFpig3UK+FfS9cx+JK49Q9eM7yltIA5pe
         ge1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755118170; x=1755722970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2G/rbx13N32uOtjBXB5kevlP1DexzAZWbsavpv/uSs0=;
        b=ekFdbsskr45oOnKVn6W9PWdIgO6jsiRkn7zA0CMJjzltBz8cCz2+Go9Xx1O0ZyBlhj
         zt+gHrIPybDDhevOXVdMTvxbE9hhclkOGzs7ok884N+miZNa6gZ/CIZPtJM8kznONOKx
         JkCoT9hf2Fe1+pDyKNwFkY/jBZ4ffl0c15r2KszTJRKbmqC/aXUNtxPo1w5/vSwIcQRT
         FFFMtXZ49fdZWfO+OgWeGQKQxQmxRs3RC9nRtMl3HYOfiidkYUzd/0u+RCogcN1J5Joe
         0GdE5w28E/g7DPfDevtL1xOJfI/YF8oci0HVCl0AF2iQae1oEq+1P47qGrLjkkVJaTV7
         HTfA==
X-Gm-Message-State: AOJu0YzZc/R+lzmLS4EC4SXGnpSubAghvInBK5uxhD5znXJSeagGb08M
	3KzBLY4UrGhJnCfg9r3qUMFzYkmYALFtonrNfPT8UvKgHe/Bsch+Ynor
X-Gm-Gg: ASbGncsqpJ0liu1T+U/AHnfi17flqTV3JeXVrQYKAit0eZzKEk0q4OB9uaZPL0kQd26
	YUGUgfmErkb51V6yiY9C7ZXSEvtRrNPVhDGSP6kp9lTaKfdrODImBgKBZqJuxoTcImxfQdDXodp
	l+OZ7Y4s+gmlyH/H4REd36xa8qmoraxypYactbswey9VwiDdh7lZI1B7ouM6UYj0qT2vJbv1LHe
	Sj0SuP1lrYLqZF3kWuPpbwQjYdxu4gK8yDOGkMkNtMWQRoSdVZiX79VRziTEjS9+17pj40t/VGK
	wPuRmvs5sN1Q8YyQ+8mAffnIAohKIAaYJahFRoix0rNVObsfFC5cPcBmV2h2BBQ0nmIgfop2uar
	q3XWs2k33kv9a+YElDHduZuXFt5NmghQszbZ1l7hKmXajyERbs0zgRIxB2JyQm4HYSmfsc36BN1
	+nJWm4S9tmz+RbcZ+MYw96/BI=
X-Google-Smtp-Source: AGHT+IEGZRRFQOaxfJH1ceA0Cv2cdREzSVtoHkpd06YP6BphzeraA9rKxxU0xmFDubAaBTdHfvotKw==
X-Received: by 2002:a05:6214:500a:b0:702:daca:9049 with SMTP id 6a1803df08f44-70ae6d37321mr13484666d6.7.1755118169950;
        Wed, 13 Aug 2025 13:49:29 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70af5b07658sm3326516d6.43.2025.08.13.13.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 13:49:29 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] linux-yocto/6.12: update CVE exclusions (6.12.40)
Date: Wed, 13 Aug 2025 16:49:18 -0400
Message-Id: <1167278d1e94e749b48f3ed1d10dba8115c0ed4b.1755118020.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1755118020.git.bruce.ashfield@gmail.com>
References: <cover.1755118020.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 20:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221824

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 4 changes (1 new | 3 updated): - 1 new CVEs: CVE-2025-8126 - 3 updated CVEs: CVE-2025-31952, CVE-2025-31953, CVE-2025-31955
        Date: Fri, 25 Jul 2025 02:18:30 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.12.inc | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index e428258bb1..ee2f30b3db 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-07-18 14:17:49.367230+00:00 for kernel version 6.12.39
-# From linux_kernel_cves cve_2025-07-18_1400Z
+# Generated at 2025-07-25 02:49:32.259439+00:00 for kernel version 6.12.40
+# From linux_kernel_cves cve_2025-07-25_0100Z-1-g854b2f05e2c
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.39"
+    this_version = "6.12.40"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -12938,7 +12938,7 @@ CVE_STATUS[CVE-2025-22112] = "cpe-stable-backport: Backported in 6.12.35"
 
 CVE_STATUS[CVE-2025-22114] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2025-22115 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-22115] = "cpe-stable-backport: Backported in 6.12.40"
 
 # CVE-2025-22116 needs backporting (fixed from 6.15)
 
@@ -14236,6 +14236,12 @@ CVE_STATUS[CVE-2025-38348] = "cpe-stable-backport: Backported in 6.12.35"
 
 CVE_STATUS[CVE-2025-38349] = "cpe-stable-backport: Backported in 6.12.39"
 
+CVE_STATUS[CVE-2025-38350] = "cpe-stable-backport: Backported in 6.12.37"
+
+# CVE-2025-38351 needs backporting (fixed from 6.16rc6)
+
+CVE_STATUS[CVE-2025-38352] = "cpe-stable-backport: Backported in 6.12.34"
+
 CVE_STATUS[CVE-2025-38479] = "cpe-stable-backport: Backported in 6.12.23"
 
 CVE_STATUS[CVE-2025-38575] = "cpe-stable-backport: Backported in 6.12.23"
-- 
2.39.2


