Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 405ABC43334
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 02:50:18 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web10.7317.1654570208770827571
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 19:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=bCNWHsQD;
 spf=none, err=permanent DNS error (domain: linux.intel.com,
 ip: 134.134.136.65, mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654570208; x=1686106208;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=j3brNuCLLxR0cXZuqCoVI+Mn/mkI0jXQawcBxjfOKY0=;
  b=bCNWHsQD9+SVw+t0iHwy1mQtsbBnvvp0zmVxSxz6kOv4g6bc3nCE21Gl
   rxuuKsEXMmZiBu9yO6HM3Vfuf27wYSTRH9FIzFEzPGp8EMzs47P9RKER4
   mQr8kjvtp9pGIDlwFCkq1MDhF/QmjmMZKlulOXG6O64HrqO4hxsxeo0+T
   +dIm4ptkVEkQkoyoIUN9FJveQUS08htnFZdGav/rDJZ43LgajBsTQFE+Z
   LxDjIOJ4tXhW4uak/J0V2QDFHV240pAQJAyfgoqcGVU1efQrKSf89EC5R
   t3xwqfaNrfOMzntL7QbHvf+SF6CKLmigyGIHCeIQ7W+v+TBrmi8I0+XiJ
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="277283455"
X-IronPort-AV: E=Sophos;i="5.91,282,1647327600";
   d="scan'208";a="277283455"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 19:50:02 -0700
X-IronPort-AV: E=Sophos;i="5.91,282,1647327600";
   d="scan'208";a="635903513"
Received: from unknown (HELO jiaqingz-bmcdev-container.sh.intel.com)
 ([10.239.138.232])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 19:49:59 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: [oe-core] [PATCH v2] systemd: Correct
 0001-pass-correct-parameters-to-getdents64.patch
Date: Tue,  7 Jun 2022 10:49:23 +0800
Message-Id: <20220607024923.3980139-1-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jun 2022 02:50:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166657

Current patch removes the uint8_t* cast in src/basic/recurse-dir.c:57
to fix musl build, but it changes the value here as pointer arithmetic
is type-depended in C. This patch corrects the behavior by adding an
extra cast to struct dirent*.

Also changes the patch's Upstream-Status to Inappropriate as it's musl-
specific.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
---
 ...0001-pass-correct-parameters-to-getdents64.patch | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch b/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
index 028f50b243..9ebff9825a 100644
--- a/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
+++ b/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
@@ -1,4 +1,4 @@
-From 8c8899b4641125cfe8e7baee32e5c5f452545d2c Mon Sep 17 00:00:00 2001
+From dab02796780f00d689cc1c7a0ba81abe7c5f28d0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 21 Jan 2022 15:15:11 -0800
 Subject: [PATCH] pass correct parameters to getdents64
@@ -12,16 +12,16 @@ Fixes
         n = getdents64(fd, &buffer, sizeof(buffer));
                            ^~~~~~~
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [musl specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
+Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
 ---
  src/basic/recurse-dir.c | 2 +-
  src/basic/stat-util.c   | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/basic/recurse-dir.c b/src/basic/recurse-dir.c
-index efa1797b7b..797285e3be 100644
+index efa1797b7b..03ff10ebe9 100644
 --- a/src/basic/recurse-dir.c
 +++ b/src/basic/recurse-dir.c
 @@ -54,7 +54,7 @@ int readdir_all(int dir_fd,
@@ -29,7 +29,7 @@ index efa1797b7b..797285e3be 100644
                  assert(bs > de->buffer_size);
  
 -                n = getdents64(dir_fd, (uint8_t*) de->buffer + de->buffer_size, bs - de->buffer_size);
-+                n = getdents64(dir_fd, de->buffer + de->buffer_size, bs - de->buffer_size);
++                n = getdents64(dir_fd, (struct dirent*)((uint8_t*) de->buffer + de->buffer_size), bs - de->buffer_size);
                  if (n < 0)
                          return -errno;
                  if (n == 0)
@@ -46,3 +46,6 @@ index c2269844f8..7cd6c7fa42 100644
          if (n < 0)
                  return -errno;
  
+-- 
+2.34.1
+
-- 
2.34.1


