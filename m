Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E1F5C54E58
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 23:37:43 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.8461.1709854656927028208
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 15:37:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BKnqQLTN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1dd178fc492so10106855ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 15:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709854656; x=1710459456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2xKSHYRJTeunhwzSTpz38LTTrpNedQ7mRq3FVENnbfk=;
        b=BKnqQLTNML3qtFqKd+YOs4bDeXto1aU//zw6vJMg3dVhLIY8rTKgiGoDEKOJoErCxf
         SBmSN2GtgT5eIgZDWiERShOywpe8IurIDbde8oNK4z+tFhWyxr+c0Y09un3Dx468zZmB
         ItobsxqnVu5Z4TZMsGnWKWMyCwhIt5gQ1Afa8wLXEeparMbdHkYoXqwRVrOPZvePrmgw
         7VaN+RVtSXILPNKg8uAJ83tmNMsnHwhtO2wBUfmyiA2vP9WbzhmHm/LWnuhpWRn/jk7j
         yucxoSup/7IfBVwLEJkCQGNw81aQwC/rB8s3oVwZPnoVdMLbn38QcY15tru+nW7xmDxq
         ZtGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709854656; x=1710459456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2xKSHYRJTeunhwzSTpz38LTTrpNedQ7mRq3FVENnbfk=;
        b=qgznXNAnF7zWMAf0s6gXTPh56IllrpxQkRoIEItinAQYFSdZapyNU36dXBAuld+T83
         uUyNnDyqKCnaJFojlTgZKF5sPqrbTuFsU25R5Pucc7sXvu4R3OJwRsSGZpnuPLUm1x0T
         5WA4xQUs4Od2c+asA+qladEgtffC1Nr/XzDMmLoxSgbbUGpVl4vnMhpUjYZEofBWgES1
         +QH90/YubXchPorZ0wDfAXP2xc3WEyy+uwy8Z/DtNRYaFJrBubO4412Cm6Jr/iywuzvr
         iKHxeWjNzCjD3JMYe/kxzdwf4ZdxjeF73qVaLjuA1ibcwmy591x4u85tkWcWlq8pRDVu
         8LKA==
X-Gm-Message-State: AOJu0YxT20InO9Y6f8v/SJ+4lpGa0PMG6pGs9MXVb1GGOU7WH8YKxqsX
	W6JPtprz8GUw7a1RJPfXvMVD0ankGqn9vk5l/fcMjcYk9/P6b+737neXdUytn7QYHlfnJdqlFWT
	//p4=
X-Google-Smtp-Source: AGHT+IEQ0Oga/JFguNNHW5KrY5dlIyUHJnlRbs8S713iYWtkeroMttL9hFwo93HVJ+bQ17r1LF6N5w==
X-Received: by 2002:a17:903:2448:b0:1db:f811:66f7 with SMTP id l8-20020a170903244800b001dbf81166f7mr10230992pls.60.1709854656171;
        Thu, 07 Mar 2024 15:37:36 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id h18-20020a170902f7d200b001dd526ff7d2sm1933243plw.308.2024.03.07.15.37.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 15:37:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/9] Revert "linux-yocto/5.15: update CVE exclusions"
Date: Thu,  7 Mar 2024 13:37:15 -1000
Message-Id: <929849eba86b5fe0d0aeaaf7ee78316b4dd77d99.1709853987.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709853987.git.steve@sakoman.com>
References: <cover.1709853987.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 23:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196830

This series is causing issues with adding and resizing partitions.

This reverts commit c7c86d97f6a0e1d09eaca999ecec13656655f299.
---
 .../linux/cve-exclusion_5.15.inc              | 44 +++----------------
 1 file changed, 7 insertions(+), 37 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
index 0d54b414d9..84d0becb8d 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-01-18 18:47:24.084935 for version 5.15.147
+# Generated at 2024-01-11 21:16:55.956074 for version 5.15.146
 
 python check_kernel_cve_status_version() {
-    this_version = "5.15.147"
+    this_version = "5.15.146"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -6626,9 +6626,6 @@ CVE_CHECK_IGNORE += "CVE-2022-48425"
 # cpe-stable-backport: Backported in 5.15.121
 CVE_CHECK_IGNORE += "CVE-2022-48502"
 
-# cpe-stable-backport: Backported in 5.15.42
-CVE_CHECK_IGNORE += "CVE-2022-48619"
-
 # fixed-version: Fixed after version 5.0rc1
 CVE_CHECK_IGNORE += "CVE-2023-0030"
 
@@ -6750,8 +6747,6 @@ CVE_CHECK_IGNORE += "CVE-2023-1382"
 # fixed-version: Fixed after version 5.11rc4
 CVE_CHECK_IGNORE += "CVE-2023-1390"
 
-# CVE-2023-1476 has no known resolution
-
 # cpe-stable-backport: Backported in 5.15.95
 CVE_CHECK_IGNORE += "CVE-2023-1513"
 
@@ -6926,8 +6921,7 @@ CVE_CHECK_IGNORE += "CVE-2023-23559"
 # fixed-version: Fixed after version 5.12rc1
 CVE_CHECK_IGNORE += "CVE-2023-23586"
 
-# fixed-version: only affects 5.18rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-2430"
+# CVE-2023-2430 needs backporting (fixed from 6.2rc5)
 
 # cpe-stable-backport: Backported in 5.15.105
 CVE_CHECK_IGNORE += "CVE-2023-2483"
@@ -7357,8 +7351,7 @@ CVE_CHECK_IGNORE += "CVE-2023-45871"
 # fixed-version: only affects 6.5rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-45898"
 
-# fixed-version: only affects 6.4rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-4610"
+# CVE-2023-4610 needs backporting (fixed from 6.4)
 
 # fixed-version: only affects 6.4rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-4611"
@@ -7393,8 +7386,7 @@ CVE_CHECK_IGNORE += "CVE-2023-5090"
 # cpe-stable-backport: Backported in 5.15.135
 CVE_CHECK_IGNORE += "CVE-2023-5158"
 
-# cpe-stable-backport: Backported in 5.15.146
-CVE_CHECK_IGNORE += "CVE-2023-51779"
+# CVE-2023-51779 needs backporting (fixed from 6.7rc7)
 
 # cpe-stable-backport: Backported in 5.15.137
 CVE_CHECK_IGNORE += "CVE-2023-5178"
@@ -7425,8 +7417,6 @@ CVE_CHECK_IGNORE += "CVE-2023-5972"
 
 # CVE-2023-6039 needs backporting (fixed from 6.5rc5)
 
-# CVE-2023-6040 needs backporting (fixed from 5.18rc1)
-
 # fixed-version: only affects 6.6rc3 onwards
 CVE_CHECK_IGNORE += "CVE-2023-6111"
 
@@ -7438,13 +7428,8 @@ CVE_CHECK_IGNORE += "CVE-2023-6176"
 
 # CVE-2023-6238 has no known resolution
 
-# CVE-2023-6270 has no known resolution
-
 # CVE-2023-6356 has no known resolution
 
-# fixed-version: only affects 6.1rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-6531"
-
 # CVE-2023-6535 has no known resolution
 
 # CVE-2023-6536 has no known resolution
@@ -7454,16 +7439,14 @@ CVE_CHECK_IGNORE += "CVE-2023-6546"
 
 # CVE-2023-6560 needs backporting (fixed from 6.7rc4)
 
-# cpe-stable-backport: Backported in 5.15.146
-CVE_CHECK_IGNORE += "CVE-2023-6606"
+# CVE-2023-6606 needs backporting (fixed from 6.7rc7)
 
 # CVE-2023-6610 needs backporting (fixed from 6.7rc7)
 
 # cpe-stable-backport: Backported in 5.15.143
 CVE_CHECK_IGNORE += "CVE-2023-6622"
 
-# fixed-version: only affects 6.7rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-6679"
+# CVE-2023-6679 needs backporting (fixed from 6.7rc6)
 
 # cpe-stable-backport: Backported in 5.15.143
 CVE_CHECK_IGNORE += "CVE-2023-6817"
@@ -7476,16 +7459,3 @@ CVE_CHECK_IGNORE += "CVE-2023-6932"
 
 # CVE-2023-7042 has no known resolution
 
-# cpe-stable-backport: Backported in 5.15.100
-CVE_CHECK_IGNORE += "CVE-2023-7192"
-
-# fixed-version: only affects 6.5rc6 onwards
-CVE_CHECK_IGNORE += "CVE-2024-0193"
-
-# CVE-2024-0340 needs backporting (fixed from 6.4rc6)
-
-# fixed-version: only affects 6.2rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2024-0443"
-
-# Skipping dd=CVE-2023-1476, no affected_versions
-
-- 
2.34.1


