Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFB6C0015E
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 11:55:59 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.10692.1688730951186356636
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jul 2023 04:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=Y5fo0JZl;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688730951; x=1720266951;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Xb51EPzA1SLw7tH4lfITSeEV16C+MjJgqFJZDJpBNMM=;
  b=Y5fo0JZlnIPJsHx7FhScWOSsn1B1Klm3Uf1U9QU4v0La9dwav8VM4ujA
   KmwRTE6zDJ/G3XRvkS3ecZqHtXdvNQMzWgwIACy8si3ukaceKru7FHU2D
   ccrkJGX2fY6mTWTiX7Do/tHX+Letdc2pVRjxKZVvkJZMP0nrjauledneC
   5hE3+3YCKwNK5J98cOPiiIsX7QErU06QQzLB1l2wVZCjMvxTmZNb0RciJ
   oNkvqjTdGZGE7UVGQJe1XzAxytfedMjhRxKwbz79hhpEqhR8wAbX51h52
   UBqW/KqReATRrViK2mXrGI+todu3V2de+VYuti0zRSbNAoyeLW2LuXoPf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="427559238"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="427559238"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 04:55:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="697216162"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="697216162"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga006.jf.intel.com with ESMTP; 07 Jul 2023 04:55:48 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][patch  1/2] sysstat: fix CVE-2023-33204
Date: Fri,  7 Jul 2023 19:44:07 +0800
Message-Id: <20230707114408.1780251-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 11:55:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184008

From: Chee Yang Lee <chee.yang.lee@intel.com>

import patch from debian to fix CVE-2023-33204
http://security.debian.org/debian-security/pool/updates/main/s/sysstat/sysstat_12.0.3-2+deb10u2.debian.tar.xz

upstream patch:
https://github.com/sysstat/sysstat/commit/6f8dc568e6ab072bb8205b732f04e685bf9237c0

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../sysstat/sysstat/CVE-2023-33204.patch      | 46 +++++++++++++++++++
 .../sysstat/sysstat_12.2.1.bb                 |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch

diff --git a/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch b/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch
new file mode 100644
index 0000000000..9a27945a8b
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch
@@ -0,0 +1,46 @@
+Origin: https://github.com/opencontainers/runc/commit/6f8dc568e6ab072bb8205b732f04e685bf9237c0
+Reviewed-by: Sylvain Beucler <beuc@debian.org>
+Last-Update: 2023-02-18
+
+From 954ff2e2673cef48f0ed44668c466eab041db387 Mon Sep 17 00:00:00 2001
+From: Pavel Kopylov <pkopylov@cloudlinux.com>
+Date: Wed, 17 May 2023 11:33:45 +0200
+Subject: [PATCH] Fix an overflow which is still possible for some values.
+
+CVE: CVE-2023-33204
+Upstream-Status: Backport [ upstream: https://github.com/sysstat/sysstat/commit/6f8dc568e6ab072bb8205b732f04e685bf9237c0 
+debian: http://security.debian.org/debian-security/pool/updates/main/s/sysstat/sysstat_12.0.3-2+deb10u2.debian.tar.xz ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+---
+ common.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+Index: sysstat-12.0.3/common.c
+===================================================================
+--- sysstat-12.0.3.orig/common.c
++++ sysstat-12.0.3/common.c
+@@ -1449,15 +1449,16 @@ int parse_values(char *strargv, unsigned
+  */
+ void check_overflow(size_t val1, size_t val2, size_t val3)
+ {
+-	if ((unsigned long long) val1 *
+-	    (unsigned long long) val2 *
+-	    (unsigned long long) val3 > UINT_MAX) {
++	if ((val1 != 0) && (val2 != 0) && (val3 != 0) &&
++	    (((unsigned long long) UINT_MAX / (unsigned long long) val1 <
++	      (unsigned long long) val2) ||
++	     ((unsigned long long) UINT_MAX / ((unsigned long long) val1 * (unsigned long long) val2) <
++	      (unsigned long long) val3))) {
+ #ifdef DEBUG
+-		fprintf(stderr, "%s: Overflow detected (%llu). Aborting...\n",
+-			__FUNCTION__,
+-			(unsigned long long) val1 * (unsigned long long) val2 *	(unsigned long long) val3);
++		fprintf(stderr, "%s: Overflow detected (%u,%u,%u). Aborting...\n",
++			__FUNCTION__, val1, val2, val3);
+ #endif
+-	exit(4);
++		exit(4);
+ 	}
+ }
+ 
diff --git a/meta/recipes-extended/sysstat/sysstat_12.2.1.bb b/meta/recipes-extended/sysstat/sysstat_12.2.1.bb
index 2c0d5c8136..ac7b898db9 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.2.1.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.2.1.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch \
             file://CVE-2022-39377.patch \
+            file://CVE-2023-33204.patch \
            "
 
 SRC_URI[md5sum] = "9dfff5fac24e35bd92fb7896debf2ffb"
-- 
2.37.3


