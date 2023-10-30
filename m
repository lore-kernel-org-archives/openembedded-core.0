Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6991C4167B
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 02:21:18 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web11.140925.1698632473030552933
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Oct 2023 19:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UJD9DWG5;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.48, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-58706a0309dso207384eaf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Oct 2023 19:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1698632472; x=1699237272; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mv6L6th7l9/yfHrfniEZ93rLz1uu2SI8cEtfuG3z8B4=;
        b=UJD9DWG5JNQATnyuLES3S9WHCQeG3H+BnexpX+J2IgSslnuhchRWRm5ykxtbT4CvPu
         blC+uiGHGTCDh8EzCJZuoOs5VMeeBTjIp636WxYD8jXUD+6SeVzWuAP5Imw53yINk6/O
         7az4rthSQEVqAa1ynimbHFzIVETV7SJHgcHuSH2UGRvBB68AYr9Wn8JlAPBD9s7VA3MB
         FNzGsfbYcTkzbfTFLH4US1bsh+MCc31oUaXebbnFPr/Z+d6bd+abvfyxopgZh+nbrvig
         e7FXzEOVhiKbjFbeSsYPnu1fbKvR3juszs3yMDtVJ8LUihPDRFK1X+Pq5HN2IXG3Uosr
         TN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698632472; x=1699237272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mv6L6th7l9/yfHrfniEZ93rLz1uu2SI8cEtfuG3z8B4=;
        b=X/aOcSA6YvDXnIy4+StFPa5bF7wKIlvuXb9luI2opWlSTo5o7x6ccpGysaa6HaJPEY
         DvvLCNQ7eGQ714KA+LAyn4zHseLQeBhLj+ZPUPqHUY4PyPm1r812SV0ydJUyBnrYwVUQ
         mOFbmpbImX5yaqbYEPs+vUeVIAgxNrnyd3WDclgjh3BkhKeNozG1+8YUbSTwuQOoiBgE
         DtD2fzP8OsZsrKsg+PvLudFxiDcB0OfXADFvxq6l6c4T3WFaPJ5SHPA2ze3sF5DtVO2O
         ESCCJhoNSGQCO9sAYbmB7SBQSuqDxZlyMA1waZ0xvMTUQoykYdooRhGd6qYd16kN0sR4
         IK7A==
X-Gm-Message-State: AOJu0YwgtDAZHjUn6el3sEliKKYjzGrdKsDnqM1LonSNP51e7QATlCaa
	8tJcZ7Fz80H+ydBAxCGtl+jZJLYHXIdTbzSQJIgJgA==
X-Google-Smtp-Source: AGHT+IHWmZW2pw6W2qBebnb7tnfr+Kipwb88dz/nFHgaoSClQNwNvkbuw8/Y4+3kz22/qhDJ0M20ew==
X-Received: by 2002:a05:6358:590a:b0:168:e8ef:2415 with SMTP id g10-20020a056358590a00b00168e8ef2415mr11778133rwf.8.1698632471711;
        Sun, 29 Oct 2023 19:21:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k2-20020a637b42000000b0057412d84d25sm3900046pgn.4.2023.10.29.19.21.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Oct 2023 19:21:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/7] cve-exclusion_5.10.inc: update for 5.10.197
Date: Sun, 29 Oct 2023 16:20:52 -1000
Message-Id: <effa2f7a7424e0f25eaf3680326164e859378332.1698632320.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698632320.git.steve@sakoman.com>
References: <cover.1698632320.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 02:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189781

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/cve-exclusion_5.10.inc              | 123 ++++++++++++++----
 1 file changed, 100 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.10.inc b/meta/recipes-kernel/linux/cve-exclusion_5.10.inc
index 2f58117d6f..7b4f68c428 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.10.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.10.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-09-23 10:42:09.595192 for version 5.10.188
+# Generated at 2023-10-24 06:17:08.900468 for version 5.10.197
 
 python check_kernel_cve_status_version() {
-    this_version = "5.10.188"
+    this_version = "5.10.197"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -4834,7 +4834,8 @@ CVE_CHECK_IGNORE += "CVE-2020-27194"
 # fixed-version: Fixed after version 5.6rc4
 CVE_CHECK_IGNORE += "CVE-2020-2732"
 
-# CVE-2020-27418 has no known resolution
+# fixed-version: Fixed after version 5.6rc5
+CVE_CHECK_IGNORE += "CVE-2020-27418"
 
 # fixed-version: Fixed after version 5.10rc1
 CVE_CHECK_IGNORE += "CVE-2020-27673"
@@ -4976,6 +4977,9 @@ CVE_CHECK_IGNORE += "CVE-2020-36691"
 # fixed-version: Fixed after version 5.10
 CVE_CHECK_IGNORE += "CVE-2020-36694"
 
+# fixed-version: Fixed after version 5.9rc1
+CVE_CHECK_IGNORE += "CVE-2020-36766"
+
 # cpe-stable-backport: Backported in 5.10.61
 CVE_CHECK_IGNORE += "CVE-2020-3702"
 
@@ -6424,7 +6428,8 @@ CVE_CHECK_IGNORE += "CVE-2022-40768"
 # cpe-stable-backport: Backported in 5.10.142
 CVE_CHECK_IGNORE += "CVE-2022-4095"
 
-# CVE-2022-40982 needs backporting (fixed from 5.10.189)
+# cpe-stable-backport: Backported in 5.10.189
+CVE_CHECK_IGNORE += "CVE-2022-40982"
 
 # cpe-stable-backport: Backported in 5.10.163
 CVE_CHECK_IGNORE += "CVE-2022-41218"
@@ -6683,12 +6688,14 @@ CVE_CHECK_IGNORE += "CVE-2023-1192"
 
 # CVE-2023-1193 has no known resolution
 
-# CVE-2023-1194 has no known resolution
+# fixed-version: only affects 5.15rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-1194"
 
 # fixed-version: only affects 5.16rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-1195"
 
-# CVE-2023-1206 needs backporting (fixed from 5.10.190)
+# cpe-stable-backport: Backported in 5.10.190
+CVE_CHECK_IGNORE += "CVE-2023-1206"
 
 # cpe-stable-backport: Backported in 5.10.110
 CVE_CHECK_IGNORE += "CVE-2023-1249"
@@ -6768,9 +6775,11 @@ CVE_CHECK_IGNORE += "CVE-2023-2008"
 # fixed-version: only affects 5.12rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-2019"
 
-# CVE-2023-20569 needs backporting (fixed from 5.10.189)
+# cpe-stable-backport: Backported in 5.10.189
+CVE_CHECK_IGNORE += "CVE-2023-20569"
 
-# CVE-2023-20588 needs backporting (fixed from 5.10.190)
+# cpe-stable-backport: Backported in 5.10.190
+CVE_CHECK_IGNORE += "CVE-2023-20588"
 
 # cpe-stable-backport: Backported in 5.10.187
 CVE_CHECK_IGNORE += "CVE-2023-20593"
@@ -6973,7 +6982,7 @@ CVE_CHECK_IGNORE += "CVE-2023-3106"
 
 # CVE-2023-31084 needs backporting (fixed from 6.4rc3)
 
-# CVE-2023-31085 has no known resolution
+# CVE-2023-31085 needs backporting (fixed from 5.10.198)
 
 # cpe-stable-backport: Backported in 5.10.184
 CVE_CHECK_IGNORE += "CVE-2023-3111"
@@ -7089,6 +7098,8 @@ CVE_CHECK_IGNORE += "CVE-2023-34256"
 # fixed-version: only affects 6.1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-34319"
 
+# CVE-2023-34324 needs backporting (fixed from 5.10.198)
+
 # fixed-version: only affects 5.15rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-3439"
 
@@ -7136,7 +7147,8 @@ CVE_CHECK_IGNORE += "CVE-2023-37453"
 
 # CVE-2023-37454 has no known resolution
 
-# CVE-2023-3772 needs backporting (fixed from 5.10.192)
+# cpe-stable-backport: Backported in 5.10.192
+CVE_CHECK_IGNORE += "CVE-2023-3772"
 
 # fixed-version: only affects 5.17rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-3773"
@@ -7186,16 +7198,35 @@ CVE_CHECK_IGNORE += "CVE-2023-3866"
 # fixed-version: only affects 5.15rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-3867"
 
+# cpe-stable-backport: Backported in 5.10.195
+CVE_CHECK_IGNORE += "CVE-2023-39189"
+
+# CVE-2023-39191 needs backporting (fixed from 6.3rc1)
+
+# cpe-stable-backport: Backported in 5.10.195
+CVE_CHECK_IGNORE += "CVE-2023-39192"
+
+# cpe-stable-backport: Backported in 5.10.195
+CVE_CHECK_IGNORE += "CVE-2023-39193"
+
+# cpe-stable-backport: Backported in 5.10.192
+CVE_CHECK_IGNORE += "CVE-2023-39194"
+
 # cpe-stable-backport: Backported in 5.10.188
 CVE_CHECK_IGNORE += "CVE-2023-4004"
 
 # CVE-2023-4010 has no known resolution
 
-# CVE-2023-4015 needs backporting (fixed from 5.10.190)
+# cpe-stable-backport: Backported in 5.10.190
+CVE_CHECK_IGNORE += "CVE-2023-4015"
 
-# CVE-2023-40283 needs backporting (fixed from 5.10.190)
+# cpe-stable-backport: Backported in 5.10.190
+CVE_CHECK_IGNORE += "CVE-2023-40283"
 
-# CVE-2023-4128 needs backporting (fixed from 5.10.190)
+# CVE-2023-40791 needs backporting (fixed from 6.5rc6)
+
+# cpe-stable-backport: Backported in 5.10.190
+CVE_CHECK_IGNORE += "CVE-2023-4128"
 
 # cpe-stable-backport: Backported in 5.10.188
 CVE_CHECK_IGNORE += "CVE-2023-4132"
@@ -7204,7 +7235,8 @@ CVE_CHECK_IGNORE += "CVE-2023-4132"
 
 # CVE-2023-4134 needs backporting (fixed from 6.5rc1)
 
-# CVE-2023-4147 needs backporting (fixed from 5.10.190)
+# cpe-stable-backport: Backported in 5.10.190
+CVE_CHECK_IGNORE += "CVE-2023-4147"
 
 # fixed-version: only affects 5.11rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-4155"
@@ -7212,15 +7244,33 @@ CVE_CHECK_IGNORE += "CVE-2023-4155"
 # fixed-version: only affects 6.3rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-4194"
 
-# CVE-2023-4206 needs backporting (fixed from 5.10.190)
+# cpe-stable-backport: Backported in 5.10.190
+CVE_CHECK_IGNORE += "CVE-2023-4206"
+
+# cpe-stable-backport: Backported in 5.10.190
+CVE_CHECK_IGNORE += "CVE-2023-4207"
+
+# cpe-stable-backport: Backported in 5.10.190
+CVE_CHECK_IGNORE += "CVE-2023-4208"
+
+# CVE-2023-4244 needs backporting (fixed from 5.10.198)
+
+# cpe-stable-backport: Backported in 5.10.190
+CVE_CHECK_IGNORE += "CVE-2023-4273"
 
-# CVE-2023-4207 needs backporting (fixed from 5.10.190)
+# cpe-stable-backport: Backported in 5.10.195
+CVE_CHECK_IGNORE += "CVE-2023-42752"
 
-# CVE-2023-4208 needs backporting (fixed from 5.10.190)
+# cpe-stable-backport: Backported in 5.10.195
+CVE_CHECK_IGNORE += "CVE-2023-42753"
 
-# CVE-2023-4244 needs backporting (fixed from 6.5rc7)
+# CVE-2023-42754 needs backporting (fixed from 5.10.198)
 
-# CVE-2023-4273 needs backporting (fixed from 5.10.190)
+# cpe-stable-backport: Backported in 5.10.197
+CVE_CHECK_IGNORE += "CVE-2023-42755"
+
+# fixed-version: only affects 6.4rc6 onwards
+CVE_CHECK_IGNORE += "CVE-2023-42756"
 
 # cpe-stable-backport: Backported in 5.10.121
 CVE_CHECK_IGNORE += "CVE-2023-4385"
@@ -7234,22 +7284,49 @@ CVE_CHECK_IGNORE += "CVE-2023-4389"
 # fixed-version: only affects 5.16rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-4394"
 
+# fixed-version: only affects 5.11rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-44466"
+
 # cpe-stable-backport: Backported in 5.10.118
 CVE_CHECK_IGNORE += "CVE-2023-4459"
 
-# CVE-2023-4563 needs backporting (fixed from 6.5rc6)
+# CVE-2023-4563 needs backporting (fixed from 5.10.198)
 
 # fixed-version: only affects 5.13rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-4569"
 
+# cpe-stable-backport: Backported in 5.10.173
+CVE_CHECK_IGNORE += "CVE-2023-45862"
+
+# CVE-2023-45863 needs backporting (fixed from 6.3rc1)
+
+# cpe-stable-backport: Backported in 5.10.195
+CVE_CHECK_IGNORE += "CVE-2023-45871"
+
+# CVE-2023-45898 needs backporting (fixed from 6.6rc1)
+
+# CVE-2023-4610 has no known resolution
+
 # fixed-version: only affects 6.4rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-4611"
 
 # CVE-2023-4622 needs backporting (fixed from 6.5rc1)
 
-# CVE-2023-4623 needs backporting (fixed from 6.6rc1)
+# cpe-stable-backport: Backported in 5.10.195
+CVE_CHECK_IGNORE += "CVE-2023-4623"
+
+# cpe-stable-backport: Backported in 5.10.53
+CVE_CHECK_IGNORE += "CVE-2023-4732"
+
+# CVE-2023-4881 needs backporting (fixed from 5.10.198)
 
-# CVE-2023-4881 needs backporting (fixed from 6.6rc1)
+# cpe-stable-backport: Backported in 5.10.195
+CVE_CHECK_IGNORE += "CVE-2023-4921"
 
-# CVE-2023-4921 needs backporting (fixed from 6.6rc1)
+# CVE-2023-5158 has no known resolution
+
+# CVE-2023-5197 needs backporting (fixed from 5.10.198)
+
+# fixed-version: only affects 6.1rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-5345"
 
-- 
2.34.1


