Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 074C3C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 14:54:45 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.12512.1656514478666328353
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 07:54:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=DwiYWpJb;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656514478; x=1688050478;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1b08PhUTxMLPB/xnesi9rAq7Sh8Kmzl0u6EsH87rmu0=;
  b=DwiYWpJb2+X8XB/8NhFHNKCJGLDORhZFsmtcTgpF63R+6p4p0oHU0ZSI
   EVPkJxptHFtbUAx/BDX+uSZ3vatB3krov9tEZFOM+N7EHMYNbT+B+450B
   aETu5/sRPW2yviXKAPawH4Urp6WMSEF1JKhqJZz3i2kzu0GCFIjZWc11r
   lgYm9gkgWdCTb6vAL3e/Xt97gAja11RkZy8DPwkFqb9bcxQYVxxynHmNk
   dq8xYdCrcOLTZBjYQlT+PzWxkRBz3A32eZ9oZvsjEXOelIPw2C6/Qcxy5
   LZPMPqk8GOuOfgt37BbiZRfh1ACPBtwok+tGEk5O6h7dPNd6mCVyb/mjx
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="279594066"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400";
   d="scan'208";a="279594066"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 07:54:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400";
   d="scan'208";a="837153382"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga006.fm.intel.com with ESMTP; 29 Jun 2022 07:54:37 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][kirkstone] ghostscript: fix CVE-2022-2085
Date: Wed, 29 Jun 2022 22:54:36 +0800
Message-Id: <20220629145436.60077-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 14:54:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167379

From: Lee Chee Yang <lcyang92@gmail.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../ghostscript/CVE-2022-2085.patch           | 44 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2022-2085.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2022-2085.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2022-2085.patch
new file mode 100644
index 0000000000..58cb93727a
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2022-2085.patch
@@ -0,0 +1,44 @@
+From ae1061d948d88667bdf51d47d918c4684d0f67df Mon Sep 17 00:00:00 2001
+From: Robin Watts <Robin.Watts@artifex.com>
+Date: Wed, 16 Feb 2022 15:22:50 +0000
+Subject: [PATCH] Bug 704945: Add init_device_procs entry for mem_x_device.
+
+When allocating a buffer device, we rely on an init_device_procs
+being defined for the device we are using as a prototype. Which
+device we use as a prototype depends upon the number of bits per
+pixel we are using. For bpp > 64, we use mem_x_device, which does
+not currently have an init_device_procs defined.
+
+This is a fairly hard case to tickle, as very few devices use
+more than 64 bits per pixel. The DeviceN device is one of the
+few that does, and then the problem only kicks in if the
+MaxBitmap figure is high enough (or conversely the resolution is
+low enough).
+
+
+http://git.ghostscript.com/?p=ghostpdl.git;a=patch;h=ae1061d948d88667bdf51d47d918c4684d0f67df
+Upstream-Status: Backport
+CVE: CVE-2022-2085
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ base/gdevmx.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/base/gdevmx.c b/base/gdevmx.c
+index 08b0cbcfe..89e9ff774 100644
+--- a/base/gdevmx.c
++++ b/base/gdevmx.c
+@@ -1,4 +1,4 @@
+-/* Copyright (C) 2001-2021 Artifex Software, Inc.
++/* Copyright (C) 2001-2022 Artifex Software, Inc.
+    All Rights Reserved.
+ 
+    This software is provided AS-IS with no warranty, either express or
+@@ -25,4 +25,4 @@
+ 
+ /* The device descriptor. */
+ const gx_device_memory mem_x_device =
+-    mem_device("imagex", 256, 0, NULL);
++    mem_device("imagex", 256, 0, mem_initialize_device_procs);
+-- 
+2.25.1
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index c28e62f089..365420fb64 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -33,6 +33,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://do-not-check-local-libpng-source.patch \
                 file://avoid-host-contamination.patch \
                 file://mkdir-p.patch \
+                file://CVE-2022-2085.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.36.1


