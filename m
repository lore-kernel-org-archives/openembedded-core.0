Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 348A5C54E5C
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 23:37:43 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.8650.1709854660736034779
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 15:37:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=X5yG3OQ7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1dd0d46ecc3so11624775ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 15:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709854660; x=1710459460; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yxgAcm+U20P1c9gSl04H0bSsA4UrALAVTnympCGAJHk=;
        b=X5yG3OQ74gbWj7/bs4XZfvFCOXCuxIAM/lQ6Z1TPfX2yZOGT5oINSg27sEzD4tAqIj
         8dZTrWp8xWFXMrH2i+Nz/Yzj2IRaY6D477bAAhQyiipDMCODMFRD0sm/Dx+91GdWcyx9
         cUapy41DMI0fsevkfOKRuioPXoDm843M8FsrTl3QL9mKrqJcx+9tja3XjqBATgXVcMxc
         hq8r6nIwSYNhYga09nAW6iR8DKoipQg6Udg9lrsYKa+io4raBA/Kb3gNWP9FoHJ1iKBE
         IflljT3nLP+zlWeGHDt08niAF3PeYIvuRMAfCmrgNiSO3ymIYE4LT0eNFXTYBJTD6+I8
         36dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709854660; x=1710459460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxgAcm+U20P1c9gSl04H0bSsA4UrALAVTnympCGAJHk=;
        b=NcO1SdOIfGa4gghsQwkZXApMGlzwZ3SbKDQnrQG4tXP5tLWkzFZVFRNgawbD9s/bCm
         aXuRA+/gS5r0nTO7TnbrMYLYTATeEZH0ZF8r5cys6jGSG0eIMpSCAHO2XiMvgTHkJacl
         Nfq8ilPe8l7Zi0u+whb6uRBSu3bmKkM61Cz5+mch/tuJEd880lpOR/vVVmpISA3flJKA
         btj21O1tA52Jd57Yhy+J8tZiyxdNtWRpCxpL7Wei8/lUVb+tVJTMEbiW9Gdd330u3HU8
         wmZRdleRDGW0jvhmR599cYr6vFKTxk+Dvuc5e98jr5kVcCRJvpRFfjqdCxK991JR4Res
         abKA==
X-Gm-Message-State: AOJu0YyKqS13B78mLMmIZas2fPBLMTmGRL6wR33NXry+8y57Q2Z4A+tX
	LrGyl0+0up4kV9rvGHhYBCKMy6jntjrXBRE5TC7V4iWdO7AWd5fFX6/wSAgZ+RqaQMOiOxp+x17
	SgSk=
X-Google-Smtp-Source: AGHT+IFTANfrK/e0K2cN6MWcq2erSGWEkYqtAFWuzc1w2MUXONTxPvuVYw3znRYGSpsiPTCYt1k2sg==
X-Received: by 2002:a17:902:8608:b0:1dd:39:d651 with SMTP id f8-20020a170902860800b001dd0039d651mr9724201plo.69.1709854659887;
        Thu, 07 Mar 2024 15:37:39 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id h18-20020a170902f7d200b001dd526ff7d2sm1933243plw.308.2024.03.07.15.37.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 15:37:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/9] Revert "linux-yocto/5.15: update CVE exclusions"
Date: Thu,  7 Mar 2024 13:37:17 -1000
Message-Id: <bc9a9528ea4e12e6a8ba696e2dfbb811fed57891.1709853987.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709853987.git.steve@sakoman.com>
References: <cover.1709853987.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 23:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196832

This series is causing issues with adding and resizing partitions.

This reverts commit 22b1db5362e18ee6c2a90049facc72c3554542dd.
---
 .../linux/cve-exclusion_5.15.inc              | 259 +++---------------
 1 file changed, 36 insertions(+), 223 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
index 84d0becb8d..7822040782 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-01-11 21:16:55.956074 for version 5.15.146
+# Generated at 2023-09-23 10:40:51.641475 for version 5.15.124
 
 python check_kernel_cve_status_version() {
-    this_version = "5.15.146"
+    this_version = "5.15.124"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -4839,8 +4839,7 @@ CVE_CHECK_IGNORE += "CVE-2020-27194"
 # fixed-version: Fixed after version 5.6rc4
 CVE_CHECK_IGNORE += "CVE-2020-2732"
 
-# fixed-version: Fixed after version 5.6rc5
-CVE_CHECK_IGNORE += "CVE-2020-27418"
+# CVE-2020-27418 has no known resolution
 
 # fixed-version: Fixed after version 5.10rc1
 CVE_CHECK_IGNORE += "CVE-2020-27673"
@@ -4982,9 +4981,6 @@ CVE_CHECK_IGNORE += "CVE-2020-36691"
 # fixed-version: Fixed after version 5.10
 CVE_CHECK_IGNORE += "CVE-2020-36694"
 
-# fixed-version: Fixed after version 5.9rc1
-CVE_CHECK_IGNORE += "CVE-2020-36766"
-
 # fixed-version: Fixed after version 5.12rc1
 CVE_CHECK_IGNORE += "CVE-2020-3702"
 
@@ -6454,8 +6450,7 @@ CVE_CHECK_IGNORE += "CVE-2022-40768"
 # cpe-stable-backport: Backported in 5.15.66
 CVE_CHECK_IGNORE += "CVE-2022-4095"
 
-# cpe-stable-backport: Backported in 5.15.125
-CVE_CHECK_IGNORE += "CVE-2022-40982"
+# CVE-2022-40982 needs backporting (fixed from 5.15.125)
 
 # cpe-stable-backport: Backported in 5.15.87
 CVE_CHECK_IGNORE += "CVE-2022-41218"
@@ -6541,7 +6536,7 @@ CVE_CHECK_IGNORE += "CVE-2022-43945"
 
 # CVE-2022-44033 needs backporting (fixed from 6.4rc1)
 
-# CVE-2022-44034 needs backporting (fixed from 6.4rc1)
+# CVE-2022-44034 has no known resolution
 
 # CVE-2022-4543 has no known resolution
 
@@ -6596,8 +6591,7 @@ CVE_CHECK_IGNORE += "CVE-2022-47938"
 # cpe-stable-backport: Backported in 5.15.61
 CVE_CHECK_IGNORE += "CVE-2022-47939"
 
-# cpe-stable-backport: Backported in 5.15.145
-CVE_CHECK_IGNORE += "CVE-2022-47940"
+# CVE-2022-47940 needs backporting (fixed from 5.19rc1)
 
 # cpe-stable-backport: Backported in 5.15.61
 CVE_CHECK_IGNORE += "CVE-2022-47941"
@@ -6714,11 +6708,9 @@ CVE_CHECK_IGNORE += "CVE-2023-1118"
 # cpe-stable-backport: Backported in 5.15.113
 CVE_CHECK_IGNORE += "CVE-2023-1192"
 
-# cpe-stable-backport: Backported in 5.15.145
-CVE_CHECK_IGNORE += "CVE-2023-1193"
+# CVE-2023-1193 has no known resolution
 
-# cpe-stable-backport: Backported in 5.15.145
-CVE_CHECK_IGNORE += "CVE-2023-1194"
+# CVE-2023-1194 has no known resolution
 
 # fixed-version: only affects 5.16rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-1195"
@@ -6805,11 +6797,9 @@ CVE_CHECK_IGNORE += "CVE-2023-2008"
 # cpe-stable-backport: Backported in 5.15.61
 CVE_CHECK_IGNORE += "CVE-2023-2019"
 
-# cpe-stable-backport: Backported in 5.15.125
-CVE_CHECK_IGNORE += "CVE-2023-20569"
+# CVE-2023-20569 needs backporting (fixed from 5.15.125)
 
-# cpe-stable-backport: Backported in 5.15.126
-CVE_CHECK_IGNORE += "CVE-2023-20588"
+# CVE-2023-20588 needs backporting (fixed from 5.15.126)
 
 # cpe-stable-backport: Backported in 5.15.122
 CVE_CHECK_IGNORE += "CVE-2023-20593"
@@ -6932,8 +6922,7 @@ CVE_CHECK_IGNORE += "CVE-2023-25012"
 # cpe-stable-backport: Backported in 5.15.61
 CVE_CHECK_IGNORE += "CVE-2023-2513"
 
-# cpe-stable-backport: Backported in 5.15.144
-CVE_CHECK_IGNORE += "CVE-2023-25775"
+# CVE-2023-25775 needs backporting (fixed from 6.6rc1)
 
 # fixed-version: only affects 6.3rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-2598"
@@ -7014,8 +7003,7 @@ CVE_CHECK_IGNORE += "CVE-2023-3106"
 
 # CVE-2023-31084 needs backporting (fixed from 6.4rc3)
 
-# cpe-stable-backport: Backported in 5.15.135
-CVE_CHECK_IGNORE += "CVE-2023-31085"
+# CVE-2023-31085 has no known resolution
 
 # cpe-stable-backport: Backported in 5.15.63
 CVE_CHECK_IGNORE += "CVE-2023-3111"
@@ -7047,26 +7035,20 @@ CVE_CHECK_IGNORE += "CVE-2023-3220"
 # cpe-stable-backport: Backported in 5.15.111
 CVE_CHECK_IGNORE += "CVE-2023-32233"
 
-# cpe-stable-backport: Backported in 5.15.145
-CVE_CHECK_IGNORE += "CVE-2023-32247"
+# CVE-2023-32247 needs backporting (fixed from 6.4rc1)
 
 # cpe-stable-backport: Backported in 5.15.111
 CVE_CHECK_IGNORE += "CVE-2023-32248"
 
-# cpe-stable-backport: Backported in 5.15.145
-CVE_CHECK_IGNORE += "CVE-2023-32250"
+# CVE-2023-32250 needs backporting (fixed from 6.4rc1)
 
-# cpe-stable-backport: Backported in 5.15.145
-CVE_CHECK_IGNORE += "CVE-2023-32252"
+# CVE-2023-32252 needs backporting (fixed from 6.4rc1)
 
-# cpe-stable-backport: Backported in 5.15.145
-CVE_CHECK_IGNORE += "CVE-2023-32254"
+# CVE-2023-32254 needs backporting (fixed from 6.4rc1)
 
-# cpe-stable-backport: Backported in 5.15.145
-CVE_CHECK_IGNORE += "CVE-2023-32257"
+# CVE-2023-32257 needs backporting (fixed from 6.4rc1)
 
-# cpe-stable-backport: Backported in 5.15.145
-CVE_CHECK_IGNORE += "CVE-2023-32258"
+# CVE-2023-32258 needs backporting (fixed from 6.4rc1)
 
 # cpe-stable-backport: Backported in 5.15.93
 CVE_CHECK_IGNORE += "CVE-2023-32269"
@@ -7131,9 +7113,6 @@ CVE_CHECK_IGNORE += "CVE-2023-34256"
 # fixed-version: only affects 6.1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-34319"
 
-# cpe-stable-backport: Backported in 5.15.135
-CVE_CHECK_IGNORE += "CVE-2023-34324"
-
 # CVE-2023-3439 needs backporting (fixed from 5.18rc5)
 
 # cpe-stable-backport: Backported in 5.15.121
@@ -7156,8 +7135,7 @@ CVE_CHECK_IGNORE += "CVE-2023-35824"
 # fixed-version: only affects 5.18rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-35826"
 
-# cpe-stable-backport: Backported in 5.15.136
-CVE_CHECK_IGNORE += "CVE-2023-35827"
+# CVE-2023-35827 has no known resolution
 
 # cpe-stable-backport: Backported in 5.15.111
 CVE_CHECK_IGNORE += "CVE-2023-35828"
@@ -7181,8 +7159,7 @@ CVE_CHECK_IGNORE += "CVE-2023-37453"
 
 # CVE-2023-37454 has no known resolution
 
-# cpe-stable-backport: Backported in 5.15.128
-CVE_CHECK_IGNORE += "CVE-2023-3772"
+# CVE-2023-3772 needs backporting (fixed from 5.15.128)
 
 # fixed-version: only affects 5.17rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-3773"
@@ -7202,8 +7179,7 @@ CVE_CHECK_IGNORE += "CVE-2023-38409"
 # cpe-stable-backport: Backported in 5.15.113
 CVE_CHECK_IGNORE += "CVE-2023-38426"
 
-# cpe-stable-backport: Backported in 5.15.145
-CVE_CHECK_IGNORE += "CVE-2023-38427"
+# CVE-2023-38427 needs backporting (fixed from 6.4rc6)
 
 # cpe-stable-backport: Backported in 5.15.113
 CVE_CHECK_IGNORE += "CVE-2023-38428"
@@ -7211,11 +7187,9 @@ CVE_CHECK_IGNORE += "CVE-2023-38428"
 # cpe-stable-backport: Backported in 5.15.113
 CVE_CHECK_IGNORE += "CVE-2023-38429"
 
-# cpe-stable-backport: Backported in 5.15.145
-CVE_CHECK_IGNORE += "CVE-2023-38430"
+# CVE-2023-38430 needs backporting (fixed from 6.4rc6)
 
-# cpe-stable-backport: Backported in 5.15.145
-CVE_CHECK_IGNORE += "CVE-2023-38431"
+# CVE-2023-38431 needs backporting (fixed from 6.4rc6)
 
 # cpe-stable-backport: Backported in 5.15.121
 CVE_CHECK_IGNORE += "CVE-2023-38432"
@@ -7229,29 +7203,7 @@ CVE_CHECK_IGNORE += "CVE-2023-3865"
 # cpe-stable-backport: Backported in 5.15.121
 CVE_CHECK_IGNORE += "CVE-2023-3866"
 
-# cpe-stable-backport: Backported in 5.15.145
-CVE_CHECK_IGNORE += "CVE-2023-3867"
-
-# cpe-stable-backport: Backported in 5.15.132
-CVE_CHECK_IGNORE += "CVE-2023-39189"
-
-# fixed-version: only affects 5.19rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-39191"
-
-# cpe-stable-backport: Backported in 5.15.132
-CVE_CHECK_IGNORE += "CVE-2023-39192"
-
-# cpe-stable-backport: Backported in 5.15.132
-CVE_CHECK_IGNORE += "CVE-2023-39193"
-
-# cpe-stable-backport: Backported in 5.15.128
-CVE_CHECK_IGNORE += "CVE-2023-39194"
-
-# cpe-stable-backport: Backported in 5.15.121
-CVE_CHECK_IGNORE += "CVE-2023-39197"
-
-# cpe-stable-backport: Backported in 5.15.128
-CVE_CHECK_IGNORE += "CVE-2023-39198"
+# CVE-2023-3867 needs backporting (fixed from 6.5rc1)
 
 # cpe-stable-backport: Backported in 5.15.123
 CVE_CHECK_IGNORE += "CVE-2023-4004"
@@ -7261,14 +7213,9 @@ CVE_CHECK_IGNORE += "CVE-2023-4004"
 # cpe-stable-backport: Backported in 5.15.124
 CVE_CHECK_IGNORE += "CVE-2023-4015"
 
-# cpe-stable-backport: Backported in 5.15.126
-CVE_CHECK_IGNORE += "CVE-2023-40283"
+# CVE-2023-40283 needs backporting (fixed from 5.15.126)
 
-# fixed-version: only affects 6.3rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-40791"
-
-# cpe-stable-backport: Backported in 5.15.126
-CVE_CHECK_IGNORE += "CVE-2023-4128"
+# CVE-2023-4128 needs backporting (fixed from 5.15.126)
 
 # cpe-stable-backport: Backported in 5.15.121
 CVE_CHECK_IGNORE += "CVE-2023-4132"
@@ -7285,35 +7232,15 @@ CVE_CHECK_IGNORE += "CVE-2023-4147"
 # fixed-version: only affects 6.3rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-4194"
 
-# cpe-stable-backport: Backported in 5.15.126
-CVE_CHECK_IGNORE += "CVE-2023-4206"
-
-# cpe-stable-backport: Backported in 5.15.126
-CVE_CHECK_IGNORE += "CVE-2023-4207"
-
-# cpe-stable-backport: Backported in 5.15.126
-CVE_CHECK_IGNORE += "CVE-2023-4208"
+# CVE-2023-4206 needs backporting (fixed from 5.15.126)
 
-# cpe-stable-backport: Backported in 5.15.134
-CVE_CHECK_IGNORE += "CVE-2023-4244"
+# CVE-2023-4207 needs backporting (fixed from 5.15.126)
 
-# cpe-stable-backport: Backported in 5.15.128
-CVE_CHECK_IGNORE += "CVE-2023-4273"
+# CVE-2023-4208 needs backporting (fixed from 5.15.126)
 
-# cpe-stable-backport: Backported in 5.15.132
-CVE_CHECK_IGNORE += "CVE-2023-42752"
+# CVE-2023-4244 needs backporting (fixed from 6.5rc7)
 
-# cpe-stable-backport: Backported in 5.15.132
-CVE_CHECK_IGNORE += "CVE-2023-42753"
-
-# cpe-stable-backport: Backported in 5.15.134
-CVE_CHECK_IGNORE += "CVE-2023-42754"
-
-# cpe-stable-backport: Backported in 5.15.133
-CVE_CHECK_IGNORE += "CVE-2023-42755"
-
-# fixed-version: only affects 6.4rc6 onwards
-CVE_CHECK_IGNORE += "CVE-2023-42756"
+# CVE-2023-4273 needs backporting (fixed from 5.15.128)
 
 # cpe-stable-backport: Backported in 5.15.46
 CVE_CHECK_IGNORE += "CVE-2023-4385"
@@ -7327,135 +7254,21 @@ CVE_CHECK_IGNORE += "CVE-2023-4389"
 # fixed-version: only affects 5.16rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-4394"
 
-# cpe-stable-backport: Backported in 5.15.121
-CVE_CHECK_IGNORE += "CVE-2023-44466"
-
 # cpe-stable-backport: Backported in 5.15.42
 CVE_CHECK_IGNORE += "CVE-2023-4459"
 
-# cpe-stable-backport: Backported in 5.15.134
-CVE_CHECK_IGNORE += "CVE-2023-4563"
+# CVE-2023-4563 needs backporting (fixed from 6.5rc6)
 
-# cpe-stable-backport: Backported in 5.15.128
-CVE_CHECK_IGNORE += "CVE-2023-4569"
-
-# cpe-stable-backport: Backported in 5.15.100
-CVE_CHECK_IGNORE += "CVE-2023-45862"
-
-# cpe-stable-backport: Backported in 5.15.99
-CVE_CHECK_IGNORE += "CVE-2023-45863"
-
-# cpe-stable-backport: Backported in 5.15.132
-CVE_CHECK_IGNORE += "CVE-2023-45871"
-
-# fixed-version: only affects 6.5rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-45898"
-
-# CVE-2023-4610 needs backporting (fixed from 6.4)
+# CVE-2023-4569 needs backporting (fixed from 5.15.128)
 
 # fixed-version: only affects 6.4rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-4611"
 
 # CVE-2023-4622 needs backporting (fixed from 6.5rc1)
 
-# cpe-stable-backport: Backported in 5.15.132
-CVE_CHECK_IGNORE += "CVE-2023-4623"
-
-# cpe-stable-backport: Backported in 5.15.137
-CVE_CHECK_IGNORE += "CVE-2023-46813"
-
-# cpe-stable-backport: Backported in 5.15.140
-CVE_CHECK_IGNORE += "CVE-2023-46862"
-
-# CVE-2023-47233 has no known resolution
-
-# fixed-version: Fixed after version 5.14rc1
-CVE_CHECK_IGNORE += "CVE-2023-4732"
-
-# cpe-stable-backport: Backported in 5.15.132
-CVE_CHECK_IGNORE += "CVE-2023-4881"
-
-# cpe-stable-backport: Backported in 5.15.132
-CVE_CHECK_IGNORE += "CVE-2023-4921"
-
-# CVE-2023-50431 has no known resolution
-
-# fixed-version: only affects 6.0rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-5090"
-
-# cpe-stable-backport: Backported in 5.15.135
-CVE_CHECK_IGNORE += "CVE-2023-5158"
-
-# CVE-2023-51779 needs backporting (fixed from 6.7rc7)
-
-# cpe-stable-backport: Backported in 5.15.137
-CVE_CHECK_IGNORE += "CVE-2023-5178"
-
-# cpe-stable-backport: Backported in 5.15.144
-CVE_CHECK_IGNORE += "CVE-2023-51780"
-
-# cpe-stable-backport: Backported in 5.15.144
-CVE_CHECK_IGNORE += "CVE-2023-51781"
-
-# cpe-stable-backport: Backported in 5.15.144
-CVE_CHECK_IGNORE += "CVE-2023-51782"
-
-# cpe-stable-backport: Backported in 5.15.134
-CVE_CHECK_IGNORE += "CVE-2023-5197"
-
-# fixed-version: only affects 6.1rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-5345"
-
-# fixed-version: only affects 6.2 onwards
-CVE_CHECK_IGNORE += "CVE-2023-5633"
-
-# cpe-stable-backport: Backported in 5.15.137
-CVE_CHECK_IGNORE += "CVE-2023-5717"
-
-# fixed-version: only affects 6.2rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-5972"
-
-# CVE-2023-6039 needs backporting (fixed from 6.5rc5)
-
-# fixed-version: only affects 6.6rc3 onwards
-CVE_CHECK_IGNORE += "CVE-2023-6111"
-
-# cpe-stable-backport: Backported in 5.15.141
-CVE_CHECK_IGNORE += "CVE-2023-6121"
-
-# cpe-stable-backport: Backported in 5.15.132
-CVE_CHECK_IGNORE += "CVE-2023-6176"
-
-# CVE-2023-6238 has no known resolution
-
-# CVE-2023-6356 has no known resolution
-
-# CVE-2023-6535 has no known resolution
-
-# CVE-2023-6536 has no known resolution
-
-# cpe-stable-backport: Backported in 5.15.128
-CVE_CHECK_IGNORE += "CVE-2023-6546"
-
-# CVE-2023-6560 needs backporting (fixed from 6.7rc4)
-
-# CVE-2023-6606 needs backporting (fixed from 6.7rc7)
-
-# CVE-2023-6610 needs backporting (fixed from 6.7rc7)
-
-# cpe-stable-backport: Backported in 5.15.143
-CVE_CHECK_IGNORE += "CVE-2023-6622"
-
-# CVE-2023-6679 needs backporting (fixed from 6.7rc6)
-
-# cpe-stable-backport: Backported in 5.15.143
-CVE_CHECK_IGNORE += "CVE-2023-6817"
-
-# cpe-stable-backport: Backported in 5.15.143
-CVE_CHECK_IGNORE += "CVE-2023-6931"
+# CVE-2023-4623 needs backporting (fixed from 6.6rc1)
 
-# cpe-stable-backport: Backported in 5.15.142
-CVE_CHECK_IGNORE += "CVE-2023-6932"
+# CVE-2023-4881 needs backporting (fixed from 6.6rc1)
 
-# CVE-2023-7042 has no known resolution
+# CVE-2023-4921 needs backporting (fixed from 6.6rc1)
 
-- 
2.34.1


