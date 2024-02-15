Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5966BC48BC4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 16:18:38 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.18136.1708013916342999726
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 08:18:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2IJ+uKCR;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d731314e67so8205095ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 08:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708013916; x=1708618716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q9YD1YHq7yT2yboBO4x9Iwtgp84MFSYSHeIDtIbC3ic=;
        b=2IJ+uKCR2tT94eFMnMDBPIFeq7YqHZHJ4yxQRJxkTeRu8ZIzQU0uOZPk/+OPa/IjhO
         e6O212AixyJJMIPEPSGiz8Tc83/POPW83sxSGuS0L2c3DYH/Iiqz9DRcjm19U1NaZLi1
         Y3vU7PUKRQ19LhboTP9xdDmwPCrN0b9vYnK9755JFP/eVsOMcifLbamAzFHK/diOneBd
         xg1mkkY+OewFl+zWcZmuvDYgkZCnPExBdQBxeNf9vWXCUMBK7GQeRTQC1ewoOMsNLBAn
         aHlCxuMoBjetFBMREgmCZhLF0Qnitl+EiD1N9aB+Dr8yvyAkTIzaWweH0l30AhqJkHIH
         E3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708013916; x=1708618716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q9YD1YHq7yT2yboBO4x9Iwtgp84MFSYSHeIDtIbC3ic=;
        b=IjxvjyYj4FhwFF/UeJv47gqEk/M5mYPDYEdtX550boQgkG165Cu1MaO9JKY0gkMHTG
         bEakKjjrD9VkBH/dDd6j8O0i+skU3TroLmBZt4evipVUN83gN6LlWFr6Qngb+uITAHvN
         hhXAuYWXt0migQfOIEwocjBmG4tuXwW5Ei8LCdxNjBHcpTChxi4CfcgAaxTsilLsCoZ4
         sWrvprERqp6rM/LV6Pd9lzP7+ho+32GUfPKVshh7g5WTvCPqyI8FaJfbDg+qNhCKmEHf
         VHcrgIxxfv8OoW2Xqj74Ok1EevrW0UKbuECoY2XaSYb6vWUQWPm19UVxRBb9ectMhnTf
         jfYQ==
X-Gm-Message-State: AOJu0Yywn5opnBvPl7uSOTSRufMmuAbn1rD/jkRQRR4B/VbT1W/EDCFK
	MLbz9UTd9EcB3DGVEMmKHUWgp6Ux5swSE8X/22+LcCd9HW7ILkB2VbfdEe4t7sXrTC7DkRi0vA/
	xkHA=
X-Google-Smtp-Source: AGHT+IG7OLKqJs50tMpk+0PKJmMiegpW1r4FRo9WBXrpgdaMlw11GW0HyyAZtwPs+MMgTpybmzYVkA==
X-Received: by 2002:a17:903:2352:b0:1db:299e:2567 with SMTP id c18-20020a170903235200b001db299e2567mr2435033plh.53.1708013915605;
        Thu, 15 Feb 2024 08:18:35 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l17-20020a170902d05100b001db66f3748bsm1445683pll.121.2024.02.15.08.18.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 08:18:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 13/21] cpio: upgrade 2.14 -> 2.15
Date: Thu, 15 Feb 2024 06:17:56 -1000
Message-Id: <e912a11c5fa6709708428f2d0fe3a29a344cd43a.1708012696.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708012696.git.steve@sakoman.com>
References: <cover.1708012696.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 16:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195533

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix operation of --no-absolute-filenames --make-directories
* Restore access and modification times of symlinks in copy-in
  and copy-pass modes.

0001-configure-Include-needed-header-for-major-minor-macr.patch
revmoed since it's included in 2.15

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c4fb7512a5b1c13234e3733cba1c4bf246c77861)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../cpio/{cpio_2.14.bb => cpio_2.15.bb}       |  3 +-
 ...e-needed-header-for-major-minor-macr.patch | 48 -------------------
 2 files changed, 1 insertion(+), 50 deletions(-)
 rename meta/recipes-extended/cpio/{cpio_2.14.bb => cpio_2.15.bb} (94%)
 delete mode 100644 meta/recipes-extended/cpio/files/0001-configure-Include-needed-header-for-major-minor-macr.patch

diff --git a/meta/recipes-extended/cpio/cpio_2.14.bb b/meta/recipes-extended/cpio/cpio_2.15.bb
similarity index 94%
rename from meta/recipes-extended/cpio/cpio_2.14.bb
rename to meta/recipes-extended/cpio/cpio_2.15.bb
index 560038d2a6..55e9add5cd 100644
--- a/meta/recipes-extended/cpio/cpio_2.14.bb
+++ b/meta/recipes-extended/cpio/cpio_2.15.bb
@@ -7,12 +7,11 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
 SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
-           file://0001-configure-Include-needed-header-for-major-minor-macr.patch \
            file://run-ptest \
            file://test.sh \
            "
 
-SRC_URI[sha256sum] = "145a340fd9d55f0b84779a44a12d5f79d77c99663967f8cfa168d7905ca52454"
+SRC_URI[sha256sum] = "efa50ef983137eefc0a02fdb51509d624b5e3295c980aa127ceee4183455499e"
 
 inherit autotools gettext texinfo ptest
 
diff --git a/meta/recipes-extended/cpio/files/0001-configure-Include-needed-header-for-major-minor-macr.patch b/meta/recipes-extended/cpio/files/0001-configure-Include-needed-header-for-major-minor-macr.patch
deleted file mode 100644
index 95ece0bbf3..0000000000
--- a/meta/recipes-extended/cpio/files/0001-configure-Include-needed-header-for-major-minor-macr.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 8179be21e664cedb2e9d238cc2f6d04965e97275 Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Thu, 11 May 2023 10:18:44 +0300
-Subject: [PATCH] configure: Include needed header for major/minor macros
-
-This helps in avoiding the warning about implicit function declaration
-which is elevated as error with newer compilers e.g. clang 16
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- configure.ac | 18 ++++++++++++++++--
- 1 file changed, 16 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index de479e7..c601029 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -43,8 +43,22 @@ AC_TYPE_UID_T
- AC_CHECK_TYPE(gid_t, int)
- 
- AC_HEADER_DIRENT
--AX_COMPILE_CHECK_RETTYPE([major], [0])
--AX_COMPILE_CHECK_RETTYPE([minor], [0])
-+AX_COMPILE_CHECK_RETTYPE([major], [0], [
-+#include <sys/types.h>
-+#ifdef MAJOR_IN_MKDEV
-+# include <sys/mkdev.h>
-+#endif
-+#ifdef MAJOR_IN_SYSMACROS
-+# include <sys/sysmacros.h>
-+#endif])
-+AX_COMPILE_CHECK_RETTYPE([minor], [0], [
-+#include <sys/types.h>
-+#ifdef MAJOR_IN_MKDEV
-+# include <sys/mkdev.h>
-+#endif
-+#ifdef MAJOR_IN_SYSMACROS
-+# include <sys/sysmacros.h>
-+#endif])
- 
- AC_CHECK_FUNCS([fchmod fchown])
- # This is needed for mingw build
--- 
-2.34.1
-
-- 
2.34.1


