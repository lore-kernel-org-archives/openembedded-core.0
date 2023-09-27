Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91202E810CB
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 10:53:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web11.14649.1695811994584200626
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 03:53:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=XnUWvnv2;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695811994; x=1727347994;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=p7Lsqo0XpJMBJG89N8n7b7PONCyEree1jkGBcu0+cpY=;
  b=XnUWvnv2pFhjhvvDUiQ5gg8e+mE7YHRepbQF4T2p+zBV07Hv9+ytrvDZ
   NnAgGoPb0hf7LLO9a2S4jnTWmOFHwJa47KO9048bcq1iKOA1zx3VHWsRf
   2WlvAZKx7bWQ4ieahUlrvU9CYrSgQkx0OPykqnL1HmZqLQsMNgYOSNWGU
   Q71CTWZtihVqk1okPS2WKLoZDuB/qJzRpiGzgIoYFaXodc+LLO96h4C4l
   REJBFhV/rnDnXgKQgE4eplA3pY3lnA9mWw5H/5ar1uHjOAiEAAhcvf+DS
   sO+elZDDmHkuB8RjsLqgH9jMqIILCcuGKMQWM6tPKmu9IQ4b2SGOgo2jJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="372137930"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="372137930"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 03:53:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="494552"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orviesa001.jf.intel.com with ESMTP; 27 Sep 2023 03:52:41 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cups: fix CVE-2023-4504
Date: Wed, 27 Sep 2023 18:33:36 +0800
Message-Id: <20230927103336.68765-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 10:53:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188303

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2023-4504.patch             | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-4504.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 36feaddcf8..fa32c38549 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -15,6 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://0004-cups-fix-multilib-install-file-conflicts.patch \
            file://volatiles.99_cups \
            file://cups-volatiles.conf \
+           file://CVE-2023-4504.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2023-4504.patch b/meta/recipes-extended/cups/cups/CVE-2023-4504.patch
new file mode 100644
index 0000000000..e52e43a209
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2023-4504.patch
@@ -0,0 +1,42 @@
+CVE: CVE-2023-4504
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/2431caddb7e6a87f04ac90b5c6366ad268b6ff31 ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+From 2431caddb7e6a87f04ac90b5c6366ad268b6ff31 Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Wed, 20 Sep 2023 14:45:17 +0200
+Subject: [PATCH] raster-interpret.c: Fix CVE-2023-4504
+
+We didn't check for end of buffer if it looks there is an escaped
+character - check for NULL terminator there and if found, return NULL
+as return value and in `ptr`, because a lone backslash is not
+a valid PostScript character.
+---
+ cups/raster-interpret.c | 14 +++++++++++++-
+ 1 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/cups/raster-interpret.c b/cups/raster-interpret.c
+index 6fcf731b5..b8655c8c6 100644
+--- a/cups/raster-interpret.c
++++ b/cups/raster-interpret.c
+@@ -1116,7 +1116,19 @@ scan_ps(_cups_ps_stack_t *st,		/* I  - Stack */
+ 
+ 	    cur ++;
+ 
+-            if (*cur == 'b')
++	   /*
++	    * Return NULL if we reached NULL terminator, a lone backslash
++	    * is not a valid character in PostScript.
++	    */
++
++	    if (!*cur)
++	    {
++	      *ptr = NULL;
++
++	      return (NULL);
++	    }
++
++	    if (*cur == 'b')
+ 	      *valptr++ = '\b';
+ 	    else if (*cur == 'f')
+ 	      *valptr++ = '\f';
-- 
2.37.3


