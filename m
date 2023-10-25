Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E40AEC25B48
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 02:29:54 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.165471.1698200987385220404
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 19:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sLt9Hl7B;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5859a7d6556so4088389a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 19:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1698200986; x=1698805786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHRN8BDQ1+JCMASQrxenQxIe+Yw3YocGqoXCw4Wd0Y8=;
        b=sLt9Hl7BZbL631ypdh5cZRG0BDqbhZeJ5xsv7G9Oy7FU80MRzzrsO6Rz+5PhcYsA6B
         azpqy1c76PKiUkrntI9j1CUbuy2VLyB0RcgTKLUSly1a+jvppnZPIGr3VNmUNTVhIwKv
         +OTp+fQ/pFPSbVK7a6VAWpgRxfaDWXrY7PROZp2+qt3X8Z9YZmgy0i53mh1Pz9oEiI7x
         6WpZsQQvuNRinhTKcIyVeIUH7HygC2KNG3Iup6RZe0zyV7Umgi5W0I6DFvinmGEHSgpm
         LMXV+2LSI6HQRzZQWMd3h3sHtrfJxbYBtW61+KDKTST3CKClNHHIQir3foRjTVY0EKRA
         aSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698200986; x=1698805786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nHRN8BDQ1+JCMASQrxenQxIe+Yw3YocGqoXCw4Wd0Y8=;
        b=HwjfmQogutDGCV9AKlzhkIxTet/sGw3KSBLYg9A/bzR3WCr1AuU6+CTuic+EDF0zbB
         UILWNzGYppdj4b6DtW8XPs35rE0BVXXo0mx8zfGR4kd4CbAwcv6w6U5vVzFU4clqVOE9
         aDW7axDi4/OaQ2RwGTdP5WFz5hIXz9EUmJEeXr+Ss/G+TqetIy4HI4wq/yBRn0Ax9wC0
         5Gd9co76lU/gek2JK9XdoLOhNmoLg09H9ustnPD29TTel3b7REqC1UhZjb4UNMtqh195
         HHb3uiu9rfqD5CdfzpwkQ9TUPQofRDZTCAjmk59faWtkyExAjYMyTtFr7Ces+ldFmk4w
         uRgQ==
X-Gm-Message-State: AOJu0YzDN3REfcmaO/MApvf77JBpx0KrlysTKcbCtqKXYAWn2f2J4iVL
	I4uTPYDdZmA4nMe8JqIVGGcaGH0DNzBCugvR2h8=
X-Google-Smtp-Source: AGHT+IH3XR6c77enenWSEvh013UrbiIne5GHUtyT5FyelGvy2Z+7cldMFNxETjW2wHT7CWzwfpz0BA==
X-Received: by 2002:a17:90a:a38d:b0:27d:3a34:2194 with SMTP id x13-20020a17090aa38d00b0027d3a342194mr13431890pjp.14.1698200986238;
        Tue, 24 Oct 2023 19:29:46 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id x2-20020a17090a388200b0027d0d4d4128sm8538615pjb.25.2023.10.24.19.29.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 19:29:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/6] cve-exclusion_5.4.inc: update for 5.4.257
Date: Tue, 24 Oct 2023 16:29:29 -1000
Message-Id: <0f75737a408aef19937ee023a5e6b3e881cbd99b.1698200772.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698200772.git.steve@sakoman.com>
References: <cover.1698200772.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 02:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189666

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/cve-exclusion_5.4.inc               | 207 +++++++++++++++---
 1 file changed, 179 insertions(+), 28 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.4.inc b/meta/recipes-kernel/linux/cve-exclusion_5.4.inc
index 28e66d6f4f..4c17b701df 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.4.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.4.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-08-25 15:56:12.313882 for version 5.4.251
+# Generated at 2023-10-24 06:03:05.289306 for version 5.4.257
 
 python check_kernel_cve_status_version() {
-    this_version = "5.4.251"
+    this_version = "5.4.257"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -4832,6 +4832,9 @@ CVE_CHECK_WHITELIST += "CVE-2020-27194"
 # cpe-stable-backport: Backported in 5.4.23
 CVE_CHECK_WHITELIST += "CVE-2020-2732"
 
+# cpe-stable-backport: Backported in 5.4.25
+CVE_CHECK_WHITELIST += "CVE-2020-27418"
+
 # cpe-stable-backport: Backported in 5.4.75
 CVE_CHECK_WHITELIST += "CVE-2020-27673"
 
@@ -4966,6 +4969,9 @@ CVE_CHECK_WHITELIST += "CVE-2020-36558"
 # cpe-stable-backport: Backported in 5.4.86
 CVE_CHECK_WHITELIST += "CVE-2020-36694"
 
+# cpe-stable-backport: Backported in 5.4.62
+CVE_CHECK_WHITELIST += "CVE-2020-36766"
+
 # cpe-stable-backport: Backported in 5.4.143
 CVE_CHECK_WHITELIST += "CVE-2020-3702"
 
@@ -6408,7 +6414,8 @@ CVE_CHECK_WHITELIST += "CVE-2022-40768"
 # cpe-stable-backport: Backported in 5.4.213
 CVE_CHECK_WHITELIST += "CVE-2022-4095"
 
-# CVE-2022-40982 has no known resolution
+# cpe-stable-backport: Backported in 5.4.252
+CVE_CHECK_WHITELIST += "CVE-2022-40982"
 
 # cpe-stable-backport: Backported in 5.4.229
 CVE_CHECK_WHITELIST += "CVE-2022-41218"
@@ -6489,9 +6496,9 @@ CVE_CHECK_WHITELIST += "CVE-2022-4382"
 # fixed-version: only affects 5.11rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2022-43945"
 
-# CVE-2022-44032 has no known resolution
+# CVE-2022-44032 needs backporting (fixed from 6.4rc1)
 
-# CVE-2022-44033 has no known resolution
+# CVE-2022-44033 needs backporting (fixed from 6.4rc1)
 
 # CVE-2022-44034 has no known resolution
 
@@ -6504,14 +6511,17 @@ CVE_CHECK_WHITELIST += "CVE-2022-45869"
 
 # CVE-2022-45885 has no known resolution
 
-# CVE-2022-45886 has no known resolution
+# cpe-stable-backport: Backported in 5.4.246
+CVE_CHECK_WHITELIST += "CVE-2022-45886"
 
-# CVE-2022-45887 has no known resolution
+# cpe-stable-backport: Backported in 5.4.246
+CVE_CHECK_WHITELIST += "CVE-2022-45887"
 
 # fixed-version: only affects 5.14rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2022-45888"
 
-# CVE-2022-45919 has no known resolution
+# cpe-stable-backport: Backported in 5.4.246
+CVE_CHECK_WHITELIST += "CVE-2022-45919"
 
 # cpe-stable-backport: Backported in 5.4.229
 CVE_CHECK_WHITELIST += "CVE-2022-45934"
@@ -6586,7 +6596,8 @@ CVE_CHECK_WHITELIST += "CVE-2023-0047"
 # fixed-version: only affects 6.0rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-0122"
 
-# CVE-2023-0160 has no known resolution
+# cpe-stable-backport: Backported in 5.4.243
+CVE_CHECK_WHITELIST += "CVE-2023-0160"
 
 # fixed-version: only affects 5.5rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-0179"
@@ -6661,12 +6672,14 @@ CVE_CHECK_WHITELIST += "CVE-2023-1192"
 
 # CVE-2023-1193 has no known resolution
 
-# CVE-2023-1194 has no known resolution
+# fixed-version: only affects 5.15rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-1194"
 
 # fixed-version: only affects 5.16rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-1195"
 
-# CVE-2023-1206 needs backporting (fixed from 6.5rc4)
+# cpe-stable-backport: Backported in 5.4.253
+CVE_CHECK_WHITELIST += "CVE-2023-1206"
 
 # CVE-2023-1249 needs backporting (fixed from 5.18rc1)
 
@@ -6695,7 +6708,8 @@ CVE_CHECK_WHITELIST += "CVE-2023-1513"
 # fixed-version: only affects 5.19rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-1583"
 
-# CVE-2023-1611 needs backporting (fixed from 6.3rc5)
+# cpe-stable-backport: Backported in 5.4.253
+CVE_CHECK_WHITELIST += "CVE-2023-1611"
 
 # cpe-stable-backport: Backported in 5.4.189
 CVE_CHECK_WHITELIST += "CVE-2023-1637"
@@ -6744,9 +6758,10 @@ CVE_CHECK_WHITELIST += "CVE-2023-2008"
 # fixed-version: only affects 5.12rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-2019"
 
-# CVE-2023-20569 has no known resolution
+# cpe-stable-backport: Backported in 5.4.252
+CVE_CHECK_WHITELIST += "CVE-2023-20569"
 
-# CVE-2023-20588 has no known resolution
+# CVE-2023-20588 needs backporting (fixed from 6.5rc6)
 
 # cpe-stable-backport: Backported in 5.4.250
 CVE_CHECK_WHITELIST += "CVE-2023-20593"
@@ -6772,7 +6787,8 @@ CVE_CHECK_WHITELIST += "CVE-2023-2124"
 # fixed-version: only affects 5.16rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-21255"
 
-# CVE-2023-21264 needs backporting (fixed from 6.4rc5)
+# fixed-version: only affects 5.17rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-21264"
 
 # CVE-2023-21400 has no known resolution
 
@@ -6866,6 +6882,9 @@ CVE_CHECK_WHITELIST += "CVE-2023-25012"
 # cpe-stable-backport: Backported in 5.4.242
 CVE_CHECK_WHITELIST += "CVE-2023-2513"
 
+# fixed-version: only affects 5.14rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-25775"
+
 # fixed-version: only affects 6.3rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-2598"
 
@@ -6918,7 +6937,8 @@ CVE_CHECK_WHITELIST += "CVE-2023-2898"
 # cpe-stable-backport: Backported in 5.4.235
 CVE_CHECK_WHITELIST += "CVE-2023-2985"
 
-# CVE-2023-3006 needs backporting (fixed from 6.1rc1)
+# cpe-stable-backport: Backported in 5.4.253
+CVE_CHECK_WHITELIST += "CVE-2023-3006"
 
 # Skipping CVE-2023-3022, no affected_versions
 
@@ -6940,11 +6960,11 @@ CVE_CHECK_WHITELIST += "CVE-2023-3106"
 
 # CVE-2023-31082 has no known resolution
 
-# CVE-2023-31083 has no known resolution
+# CVE-2023-31083 needs backporting (fixed from 6.6rc1)
 
 # CVE-2023-31084 needs backporting (fixed from 6.4rc3)
 
-# CVE-2023-31085 has no known resolution
+# CVE-2023-31085 needs backporting (fixed from 5.4.258)
 
 # cpe-stable-backport: Backported in 5.4.247
 CVE_CHECK_WHITELIST += "CVE-2023-3111"
@@ -7017,7 +7037,8 @@ CVE_CHECK_WHITELIST += "CVE-2023-3317"
 # cpe-stable-backport: Backported in 5.4.240
 CVE_CHECK_WHITELIST += "CVE-2023-33203"
 
-# CVE-2023-33250 has no known resolution
+# fixed-version: only affects 6.2rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-33250"
 
 # CVE-2023-33288 needs backporting (fixed from 6.3rc4)
 
@@ -7055,7 +7076,10 @@ CVE_CHECK_WHITELIST += "CVE-2023-34255"
 # cpe-stable-backport: Backported in 5.4.243
 CVE_CHECK_WHITELIST += "CVE-2023-34256"
 
-# CVE-2023-34319 has no known resolution
+# fixed-version: only affects 6.1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-34319"
+
+# CVE-2023-34324 needs backporting (fixed from 5.4.258)
 
 # fixed-version: only affects 5.15rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-3439"
@@ -7094,21 +7118,28 @@ CVE_CHECK_WHITELIST += "CVE-2023-3609"
 # fixed-version: only affects 5.9rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-3610"
 
-# CVE-2023-3611 needs backporting (fixed from 6.5rc2)
+# cpe-stable-backport: Backported in 5.4.253
+CVE_CHECK_WHITELIST += "CVE-2023-3611"
 
 # CVE-2023-3640 has no known resolution
 
-# CVE-2023-37453 has no known resolution
+# fixed-version: only affects 6.3rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-37453"
 
 # CVE-2023-37454 has no known resolution
 
-# CVE-2023-3772 has no known resolution
+# cpe-stable-backport: Backported in 5.4.255
+CVE_CHECK_WHITELIST += "CVE-2023-3772"
 
-# CVE-2023-3773 has no known resolution
+# fixed-version: only affects 5.17rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-3773"
 
 # cpe-stable-backport: Backported in 5.4.251
 CVE_CHECK_WHITELIST += "CVE-2023-3776"
 
+# fixed-version: only affects 5.9rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-3777"
+
 # cpe-stable-backport: Backported in 5.4.224
 CVE_CHECK_WHITELIST += "CVE-2023-3812"
 
@@ -7139,12 +7170,44 @@ CVE_CHECK_WHITELIST += "CVE-2023-38432"
 # cpe-stable-backport: Backported in 5.4.251
 CVE_CHECK_WHITELIST += "CVE-2023-3863"
 
+# fixed-version: only affects 5.15rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-3865"
+
+# fixed-version: only affects 5.15rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-3866"
+
+# fixed-version: only affects 5.15rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-3867"
+
+# cpe-stable-backport: Backported in 5.4.257
+CVE_CHECK_WHITELIST += "CVE-2023-39189"
+
+# CVE-2023-39191 needs backporting (fixed from 6.3rc1)
+
+# cpe-stable-backport: Backported in 5.4.257
+CVE_CHECK_WHITELIST += "CVE-2023-39192"
+
+# cpe-stable-backport: Backported in 5.4.257
+CVE_CHECK_WHITELIST += "CVE-2023-39193"
+
+# cpe-stable-backport: Backported in 5.4.255
+CVE_CHECK_WHITELIST += "CVE-2023-39194"
+
 # fixed-version: only affects 5.6rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-4004"
 
 # CVE-2023-4010 has no known resolution
 
-# CVE-2023-4128 needs backporting (fixed from 6.5rc5)
+# fixed-version: only affects 5.9rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-4015"
+
+# cpe-stable-backport: Backported in 5.4.253
+CVE_CHECK_WHITELIST += "CVE-2023-40283"
+
+# CVE-2023-40791 needs backporting (fixed from 6.5rc6)
+
+# cpe-stable-backport: Backported in 5.4.253
+CVE_CHECK_WHITELIST += "CVE-2023-4128"
 
 # cpe-stable-backport: Backported in 5.4.251
 CVE_CHECK_WHITELIST += "CVE-2023-4132"
@@ -7156,9 +7219,97 @@ CVE_CHECK_WHITELIST += "CVE-2023-4132"
 # fixed-version: only affects 5.9rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-4147"
 
-# CVE-2023-4155 has no known resolution
+# fixed-version: only affects 5.11rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-4155"
+
+# fixed-version: only affects 6.3rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-4194"
+
+# cpe-stable-backport: Backported in 5.4.253
+CVE_CHECK_WHITELIST += "CVE-2023-4206"
+
+# cpe-stable-backport: Backported in 5.4.253
+CVE_CHECK_WHITELIST += "CVE-2023-4207"
 
-# CVE-2023-4194 needs backporting (fixed from 6.5rc5)
+# cpe-stable-backport: Backported in 5.4.253
+CVE_CHECK_WHITELIST += "CVE-2023-4208"
+
+# fixed-version: only affects 5.6rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-4244"
 
-# CVE-2023-4273 needs backporting (fixed from 6.5rc5)
+# fixed-version: only affects 5.7rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-4273"
+
+# cpe-stable-backport: Backported in 5.4.257
+CVE_CHECK_WHITELIST += "CVE-2023-42752"
+
+# cpe-stable-backport: Backported in 5.4.257
+CVE_CHECK_WHITELIST += "CVE-2023-42753"
+
+# CVE-2023-42754 needs backporting (fixed from 5.4.258)
+
+# cpe-stable-backport: Backported in 5.4.257
+CVE_CHECK_WHITELIST += "CVE-2023-42755"
+
+# fixed-version: only affects 6.4rc6 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-42756"
+
+# cpe-stable-backport: Backported in 5.4.198
+CVE_CHECK_WHITELIST += "CVE-2023-4385"
+
+# cpe-stable-backport: Backported in 5.4.196
+CVE_CHECK_WHITELIST += "CVE-2023-4387"
+
+# fixed-version: only affects 5.7rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-4389"
+
+# fixed-version: only affects 5.16rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-4394"
+
+# fixed-version: only affects 5.11rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-44466"
+
+# cpe-stable-backport: Backported in 5.4.196
+CVE_CHECK_WHITELIST += "CVE-2023-4459"
+
+# fixed-version: only affects 5.6rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-4563"
+
+# fixed-version: only affects 5.13rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-4569"
+
+# cpe-stable-backport: Backported in 5.4.235
+CVE_CHECK_WHITELIST += "CVE-2023-45862"
+
+# CVE-2023-45863 needs backporting (fixed from 6.3rc1)
+
+# cpe-stable-backport: Backported in 5.4.257
+CVE_CHECK_WHITELIST += "CVE-2023-45871"
+
+# CVE-2023-45898 needs backporting (fixed from 6.6rc1)
+
+# CVE-2023-4610 has no known resolution
+
+# fixed-version: only affects 6.4rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-4611"
+
+# CVE-2023-4622 needs backporting (fixed from 6.5rc1)
+
+# cpe-stable-backport: Backported in 5.4.257
+CVE_CHECK_WHITELIST += "CVE-2023-4623"
+
+# CVE-2023-4732 needs backporting (fixed from 5.14rc1)
+
+# CVE-2023-4881 needs backporting (fixed from 6.6rc1)
+
+# cpe-stable-backport: Backported in 5.4.257
+CVE_CHECK_WHITELIST += "CVE-2023-4921"
+
+# CVE-2023-5158 has no known resolution
+
+# fixed-version: only affects 5.9rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-5197"
+
+# fixed-version: only affects 6.1rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-5345"
 
-- 
2.34.1


