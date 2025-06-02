Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DFFDC5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 12:33:56 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web11.48613.1748867629372841185
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 05:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hAYH3Udd;
 spf=pass (domain: gmail.com, ip: 209.85.217.44, mailfrom: festevam@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4e591544d42so1437511137.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 05:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748867628; x=1749472428; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nrrWZ5KEnFDRsHTqoXpNqNUv+W/3C7HSd45htgchyxo=;
        b=hAYH3UddPkieCB8WAeuK+ahJ8t8vw0x9sq7V80fzlnRM82Vvp9iiTvxK5X9H+4huk+
         R43nc8KhIikMX8J1FIg7yI6af5DynLLeYJMQUnASeRIBREhx/mDQXuQtDOpDbLo2TAhC
         92A4UKVkeLk+qC8bx+U+ANQlPhRWKRrWOZmXdFMv43zjV+jpg6af2kFV8TsmW1Oo98zF
         65yui0N6l2dhDfI9GrPh/Ia4TDokF4uiyWbgxwG4nfTC5/1EEMU/M02v/w6MghThDSdd
         ZCYrUxefaSkC9Z+Vv83h1RbEWzk5Vmyk0hYr3uorAbjAEn69jPssP5b+ZE+HG5XKZtsb
         2RvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748867628; x=1749472428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nrrWZ5KEnFDRsHTqoXpNqNUv+W/3C7HSd45htgchyxo=;
        b=DfdNJQH02NFXLxejgwnoyeCfetZdU9STa6eItRUZa9U/UDDGYkybXKqWCFBR1Ldu6Z
         PccMEMjJmIUEk/01zA3Agye2+mfRBeE8o4KpaPASUlQSG/0F4f6nlH7e7S+zeyJmRHd3
         JQj2K74sQ9OgQrlFhLx19lmPvECF8F4EIoDbvo2YBZ1XNAcw8bIATsvEg56/kFyT1Ipo
         1I6+tgpJbrWDZcDXB8kMBFpHp6clnD0HfSGj5bwUfhuRgxk0NL/rzPPHdDNx3zTHYAKB
         2cxl2xeijsI42QKhTZvDhChemyzCmS3cd5U6F1vWXXtJPhjzzHHFRKiHCbOycEGVxW/Q
         ogVA==
X-Gm-Message-State: AOJu0Yz1hE0aObTa8WvZqRhc0MrXan5Nhti8X2MZg+jkvLrBPDDKnCuU
	aCuxKzlMffx4lMKJYJjbE+v03lJ/rygi6UD1BTv8yGj72oYKkOyVKBdbjhEwOA==
X-Gm-Gg: ASbGncvvEo8IQ71EUf8Bqqe9lqlsF3vJ26oAA1U8HtqtGP2do6sQ+IzU2RxuMxe7yTO
	TYOpzXpoVHh4z9oB4o4ytY+87JwDrftXhmSsgSDWgRtYJYgFnG9HXZrdp5Odsg9sCI//kYutDje
	SbEqtgpslP2niZlF+2/A+Psw9oiArr1bre3fi11e4h9Jv83oaCFB2EJyUlCy5Zee/+5lh4ZMvzn
	HvsV1k6Eqb6E36YNpazh4mgDUPYR/y5Gx78DbeHnxzJUwT59QxYDS3kH6e4weui8z4FU8tq8wnv
	HzRyFVUPbO9za+2fSrbD0eDFmK2b+lYoyzG78BxKwD0O827q+cW0HSwyjTIB6A3W5g==
X-Google-Smtp-Source: AGHT+IEG5LHbTRfnEtxTqLDoeJAnLV2yI7GU+8XcQvy+W0FaUUSg+QMnXD80efO3XifP/5q38scuPg==
X-Received: by 2002:a05:6102:2922:b0:4e2:86e6:468a with SMTP id ada2fe7eead31-4e701bd046emr4175460137.6.1748867627883;
        Mon, 02 Jun 2025 05:33:47 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:e792:4663:e5dc:ed1f])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e6444295e2sm7050810137.5.2025.06.02.05.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 05:33:47 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] mtd-utils: Update the upstream status
Date: Mon,  2 Jun 2025 09:33:41 -0300
Message-Id: <20250602123341.15723-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 12:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217717

All the patches have been accepted upstream.

Update the Upstream-Status tags accordingly.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Fix typo in the commit log: Uptream-Status -> Upstream-Status.

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


