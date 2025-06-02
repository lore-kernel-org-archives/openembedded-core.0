Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B58C5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 12:26:36 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web11.48454.1748867195245959267
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 05:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eZcvTynX;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: festevam@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4e5a73028d2so1383193137.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 05:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748867193; x=1749471993; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q55eca1dXRnzfYof3dMGBKcqKpRTYIhfGO2vn98MhZw=;
        b=eZcvTynXVINlZEkVHAopwg25CiYUUGY6DvZCsdTwkFndvf0XLem8k0XYuYUfjuRybS
         FdPB9xCYUnB4ifGmF8yDcj0ba6gumhGj/NxrFE9ePFTXLvUfW2VbZ6udGdF2bYlZgwGU
         e3LL1iBbupfP8Vwy7AFueJBw8RW9iSmtMpCSKKha6MQvULD+1npzaItpQ1JGf3KzZmJH
         EQVmi9MClXkkG5EwUlryLluA8BIjZH7iaCtTwXy13vwZxYv89f2bYAfg9bmwnXnUCG2e
         o3vqhO5dD5rEFP65K0VYZ84Ng1GDVA+wqHyWgL0cxifY9GpczTGy1KpPYJcpcXXnoViv
         dviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748867193; x=1749471993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q55eca1dXRnzfYof3dMGBKcqKpRTYIhfGO2vn98MhZw=;
        b=ORw+7SKhBF1SS6FpNeVVvw7V4GPuVLzKsAEDRt/4er5zi7ROXZRL7vwqKLVOoyd01S
         orep+GsaQ5Y1JjqOmsnJ72Uwd/5VKMKRbPsWEbAhGlvx6SaA6O93XVkUzdbYg7SA3S6H
         ep1VQo+3ccPDgbGGHORIG5kU6GJfwsZH3QrEkSASaWiT8phl0B2jKWXqsqsNGygT/zp1
         seqcHK6CSM/w1kt0maM0vhFA2gugLTMAask7ahdNw32HcH3GN8YBtMsqUoRjBFDr4fwr
         dIaR3wN3ezG4mD1Bj4dDQKyf7sbZLtZlC9a+XTRjYwDh0+IWkkE4BKMEcrd4TAMULt2w
         idwg==
X-Gm-Message-State: AOJu0YztFbc3BCm73p6pG4ouFfN/emyqQ59JWqQ5gxPiBSPVt6NmhTDx
	2/Smoa5CRBPqJBGESc7H962fY/abbY7WOUHZbvkZ/dkJtHcSYkiHe+sD1NO8lw==
X-Gm-Gg: ASbGncvl/vnBgiQw1dHRC9Sklk+7RpdNYYUASKGKnV8OnCCN77uwpgz8lvVk/M/VEO7
	0hZ0FqMZeInAgToIFDW3R8n4VpNtxj1CbBfTlfa2uQb3xSgiDEnAOmpnhdIE0VdFBDyUayFp4Az
	zNDJ/A6cWm3arEpvlY4g9Eh9y9J7Uq7Wj6E6Sp0YCdJXkPFAcQwbMaRaCUlgUy4agjsylKkMsls
	gLjFhQAh/eV4arkNyfLs6WCBj36sewyYEOQzrJ0ImNV+HvqCZa0b5P8DQyO6mI+XWFfKPCjT6iN
	6vZx3YuJRm8zjdtEuMk2/kWuIUEw9wcFQCMprMWX+9PLs2JMfDoYOv71ET7gbyhgHg==
X-Google-Smtp-Source: AGHT+IGVnS8I+51H1p9gFPOMeU2XxfPK1eLEoznmpir+GfuVeTEX2wICJClsKxgxB2W6bY6LU+eC0w==
X-Received: by 2002:a05:6102:41a8:b0:4de:c7fe:34b3 with SMTP id ada2fe7eead31-4e6ecbfd66amr9208343137.0.1748867193473;
        Mon, 02 Jun 2025 05:26:33 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:e792:4663:e5dc:ed1f])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e64e9f8d65sm6993611137.30.2025.06.02.05.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 05:26:33 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] mtd-utils: Update the upstream status
Date: Mon,  2 Jun 2025 09:26:23 -0300
Message-Id: <20250602122623.14483-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 12:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217715

All the patches have been accepted upstream.

Update the Uptream-Status tags accordingly.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../mtd/files/0001-Improve-check-for-GCC-compiler-version.patch | 2 +-
 .../mtd/files/0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch    | 2 +-
 .../mtd/files/0002-ubifs-utils-journal-Include-sys-stat.h.patch | 2 +-
 ...3-ubifs-utils-link-libmissing.a-in-case-execinfo.h-isn.patch | 2 +-
 .../0004-ubifs-utils-extract_files-Include-linux-limits.h.patch | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/mtd/files/0001-Improve-check-for-GCC-compiler-version.patch b/meta/recipes-devtools/mtd/files/0001-Improve-check-for-GCC-compiler-version.patch
index 3cd58e053db5..2329dfece387 100644
--- a/meta/recipes-devtools/mtd/files/0001-Improve-check-for-GCC-compiler-version.patch
+++ b/meta/recipes-devtools/mtd/files/0001-Improve-check-for-GCC-compiler-version.patch
@@ -8,7 +8,7 @@ When using unreleased compiler has version like
 becomes true, therefore check for full version string
 which is more rubust.
 
-Upstream-Status: Submitted [https://lists.infradead.org/pipermail/linux-mtd/2025-March/108860.html]
+Upstream-Status: Backport [https://github.com/sigma-star/mtd-utils/commit/ac0ab65ebcd7b11739986b81343457469fbb43b0]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  ubifs-utils/common/atomic.h | 6 +++++-
diff --git a/meta/recipes-devtools/mtd/files/0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch b/meta/recipes-devtools/mtd/files/0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch
index a9ececc14c60..b603ac8fd678 100644
--- a/meta/recipes-devtools/mtd/files/0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch
+++ b/meta/recipes-devtools/mtd/files/0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch
@@ -25,7 +25,7 @@ when building with musl:
 |       |                                            off_t
 | make: *** [Makefile:4878: ubifs-utils/common/mkfs_ubifs-compr.o] Error 1
 
-Upstream-Status: Submitted [https://lore.kernel.org/linux-mtd/20250219130244.2119582-1-festevam@gmail.com/T/#t]
+Upstream-Status: Backport [https://github.com/sigma-star/mtd-utils/commit/12bc9ad824bd8f18a5ec9c7154ad2374cf8c7ae3]
 Signed-off-by: Fabio Estevam <festevam@gmail.com>
 Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
 Reviewed-by: Khem Raj <raj.khem@gmail.com>
diff --git a/meta/recipes-devtools/mtd/files/0002-ubifs-utils-journal-Include-sys-stat.h.patch b/meta/recipes-devtools/mtd/files/0002-ubifs-utils-journal-Include-sys-stat.h.patch
index ea376437df91..d92a3fb4b6eb 100644
--- a/meta/recipes-devtools/mtd/files/0002-ubifs-utils-journal-Include-sys-stat.h.patch
+++ b/meta/recipes-devtools/mtd/files/0002-ubifs-utils-journal-Include-sys-stat.h.patch
@@ -14,7 +14,7 @@ when building with musl:
 | ../git/ubifs-utils/libubifs/journal.c:415:14: error: 'S_IFREG' undeclared (first use in this function)
 |   415 |         case S_IFREG:
 
-Upstream-Status: Submitted [https://lore.kernel.org/linux-mtd/20250219130244.2119582-2-festevam@gmail.com/T/#t]
+Upstream-Status: Backport [https://github.com/sigma-star/mtd-utils/commit/173f9714c8da1d685bfa951d43b9310d16bbab3c]
 Signed-off-by: Fabio Estevam <festevam@gmail.com>
 Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
 ---
diff --git a/meta/recipes-devtools/mtd/files/0003-ubifs-utils-link-libmissing.a-in-case-execinfo.h-isn.patch b/meta/recipes-devtools/mtd/files/0003-ubifs-utils-link-libmissing.a-in-case-execinfo.h-isn.patch
index b4c190d554ee..efaedad70b8f 100644
--- a/meta/recipes-devtools/mtd/files/0003-ubifs-utils-link-libmissing.a-in-case-execinfo.h-isn.patch
+++ b/meta/recipes-devtools/mtd/files/0003-ubifs-utils-link-libmissing.a-in-case-execinfo.h-isn.patch
@@ -13,7 +13,7 @@ backtrace().
 Guard the execinfo.h include and if it isn't available instead include
 libmissing.h, and link to libmissing.a to provide backtrace() if needed.
 
-Upstream-Status: Submitted [https://lore.kernel.org/linux-mtd/20250226182400.1723418-1-ross.burton@arm.com/]
+Upstream-Status: Backport [https://github.com/sigma-star/mtd-utils/commit/8a83b306db64d6f60186d4396b0b770163b85b6e]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
 Signed-off-by: Fabio Estevam <festevam@gmail.com>
diff --git a/meta/recipes-devtools/mtd/files/0004-ubifs-utils-extract_files-Include-linux-limits.h.patch b/meta/recipes-devtools/mtd/files/0004-ubifs-utils-extract_files-Include-linux-limits.h.patch
index 87806af27d3c..3444f330dccb 100644
--- a/meta/recipes-devtools/mtd/files/0004-ubifs-utils-extract_files-Include-linux-limits.h.patch
+++ b/meta/recipes-devtools/mtd/files/0004-ubifs-utils-extract_files-Include-linux-limits.h.patch
@@ -13,7 +13,7 @@ with musl:
 | ../git/ubifs-utils/fsck.ubifs/extract_files.c:144:47: note: each undeclared identifier is reported only once for each function it appears in
 | make: *** [Makefile:4374: ubifs-utils/fsck.ubifs/fsck_ubifs-extract_files.o] Error 1
 
-Upstream-Status: Submitted [https://lore.kernel.org/linux-mtd/20250219130244.2119582-4-festevam@gmail.com/T/#t]
+Upstream-Status: Backport [https://github.com/sigma-star/mtd-utils/commit/77981a2888c711268b0e7f32af6af159c2288e23]
 Signed-off-by: Fabio Estevam <festevam@gmail.com>
 Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
 ---
-- 
2.34.1


