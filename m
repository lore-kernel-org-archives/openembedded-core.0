Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B05C8E66886
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 21:37:46 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68790.1766353057580792755
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 13:37:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TPwzcviB;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so2167421b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 13:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766353057; x=1766957857; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1aFG+Vo0TGhYFQuOADCH7z0GE0t1Hge9fdIvbZgzNlM=;
        b=TPwzcviB6Xsugfv3M8ySFjzXE3yc5BW64tOGL0jsv1QQU9AKUercxXWijCtEfS/qz7
         jCItyVTdaEXQC2jbFuD1We/wPWWMqIHUeq6nq6RuV4/LPB4yhipr1fBTtUSWMY3lkgHO
         K6j+Ec8nyIYCEiWqCM1BKtApVmynGHMndPrZTeuM1lKIXuUOYWSq3/dFCoXs6Ng1iSGS
         engZzZFDPvrz9Lk+oCPDGIMvMO2tpuHHVtuldjHQOUiIa8UxYtY7T+I0SuTOpe/h+whu
         llavQn3fvwaQGTN1vqRLrlqhBYPLVk+fEj5JDQxmtdhYP0kQXhPiH3PQYlUT5qBfp1SY
         MSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353057; x=1766957857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1aFG+Vo0TGhYFQuOADCH7z0GE0t1Hge9fdIvbZgzNlM=;
        b=S4HDJamoKWhYcE72/ZmcMyfajj7CEWka842/ElXEtuj3fuSy4rQqfN0faRQDpKjZNO
         ROx1ZNvNmq/jjkLXh8OWkqqmHtTHd46TXc6ncaFDg/zFshjedpD6XufZ87/sJ9pbXBAE
         z9wT3zJXY7YHYrWv7zWJiM6/V4aQjz3mgaDTyftEoqgaYJqE6aAAREODDOxOZpuqXJQ6
         0oYdxvKrRyyAEHu3bxD4DNwtCx0SZZkJwwqMxqgq76iUBvLpHRdGT7dIhugIdmjad80k
         YkbVRv5wAiiNrQtQpsCTl/fPLpHQfZip0XBqxbblQFSn3eRiG6qfgBdDUzz4ck2G95RO
         C0Rw==
X-Gm-Message-State: AOJu0Yx6HizG6od/RQ+FLkH9xtOCQTRgf5C0A6XQrJkSfOO4LC5PJ9AM
	gZ0HrKxhiS9+j0DrEy+0JdxO5FkIoRq0IDmu31NYdIr7R1OAUg1Sau5jpXUu4setezDc5WO0feZ
	h8PAN5bc=
X-Gm-Gg: AY/fxX7YR9SsbGTIbc1LDVxbcbgWqI8vwIYjQiXfx6wEUQX5MjkPSRCxuE3eF0sLzNk
	ev9QR130TADfP3yOBhhHRHPym3K/IyPZm4/xZ4/cw5/cs8TbCRaoKi6oYmmHIDw72PYGVVgrVvU
	9Li4L4VFQ0ZAYpO/iVis3VQnL2WOQm3jJVuLFrxjQln6L1HL/36QT5rLOLDUuxzxiLJ6j6eRNYp
	7e4LkEEHXXzMlW8qOFvlqFkWcg+kdZcnHa5wFaZyEGOGEaNZzCRsd6nv7UaS3eehXTXy9+TAf5O
	wL05H+TNaeM9iOC8IwcphbcVkxGgai1oZvvYawi7g/miZIfzyw5WxA6nbBr00HnIk3yDc4zLk07
	Y1NfYTG9CnmRh1DWHegdJ09IW9u/2wCEnTLyVcQ6xjqFZe7ayXJIBMsb24e1ORYkorqClL7dP/v
	PL
X-Google-Smtp-Source: AGHT+IE8d4gAIwdu3pNTmU5hbmkDV/qowYvcxMX3PSOL9ATfpswaNfx+AgCXsSvy+DieVwwX9gsQ4Q==
X-Received: by 2002:a05:6a00:2995:b0:7e8:4587:e8bf with SMTP id d2e1a72fcca58-7ff664798e5mr6661948b3a.50.1766353056782;
        Sun, 21 Dec 2025 13:37:36 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:dd61:72c7:d0b8:fed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfabcbcsm8211166b3a.31.2025.12.21.13.37.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 13:37:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 09/18] linux-yocto/6.12: update CVE exclusions (6.12.60)
Date: Sun, 21 Dec 2025 13:37:02 -0800
Message-ID: <58f51f4544d730f751f7648d226aafa336b0fe28.1766352840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766352840.git.steve@sakoman.com>
References: <cover.1766352840.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 21:37:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228267

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 1 changes (0 new | 1 updated): - 0 new CVEs: - 1 updated CVEs: CVE-2025-7195
        Date: Tue, 2 Dec 2025 23:31:01 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a6d867758190322d1d2bb91d4bdfc40d68847ec4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.12.inc | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 583ce7aa40..5ca6f53fde 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-12-01 16:43:28.801277+00:00 for kernel version 6.12.59
-# From linux_kernel_cves cve_2025-12-01_1600Z-2-g8d7b13eec97
+# Generated at 2025-12-02 23:35:41.082808+00:00 for kernel version 6.12.60
+# From linux_kernel_cves cve_2025-12-02_2300Z-2-g67370d1b4b8
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.59"
+    this_version = "6.12.60"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -4028,8 +4028,6 @@ CVE_STATUS[CVE-2022-49907] = "fixed-version: Fixed from version 6.1"
 
 CVE_STATUS[CVE-2022-49908] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2022-49909] = "fixed-version: Fixed from version 6.1"
-
 CVE_STATUS[CVE-2022-49910] = "fixed-version: Fixed from version 6.1"
 
 CVE_STATUS[CVE-2022-49911] = "fixed-version: Fixed from version 6.1"
-- 
2.43.0


