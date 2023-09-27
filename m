Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7486E810D9
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 12:06:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.15780.1695816400126947556
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 05:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=BYuQQWFE;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695816401; x=1727352401;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=l2/c0qmIT9EgpTnSKF3BY/q3WYoD1mr6QhSs/1ql8sU=;
  b=BYuQQWFEyLUPIBNeEsAuvs3DDNmF+cC3z1sX1PIheVP1ItULb7Yf8mIR
   +1DQ8PT9gavdSRKecAOObQydY4geUfARVl6+mE174rI6vqoyqyogB3f6o
   7WRC6IygTPRG1qJK3HTX9W9DhnRRl+p/OT/q2trWvetaCMAbiUgKcSbTP
   NIY8bMAO5Mdk+pkWbn41SSaC3NpgplgUOhNwlQ5z4BGWHIfdgf05MJbQd
   jhsjkMiz77Ew4CCNN6DT301mJJNtX3U7Gl4Jm91AEGI0QziMFnMxe82Fv
   K3PiznFAq+laqeOwFBchAHtYdIe7kUkxyJsthz0K2aKmCWHt3ZIYsQaUw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="384595476"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="384595476"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 05:06:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="892579517"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="892579517"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga001.fm.intel.com with ESMTP; 27 Sep 2023 05:05:33 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH 3/3] cups: Fix CVE-2023-4504
Date: Wed, 27 Sep 2023 19:47:01 +0800
Message-Id: <20230927114701.131513-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230927114701.131513-1-chee.yang.lee@intel.com>
References: <20230927114701.131513-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 12:06:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188312

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2023-4504.patch             | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-4504.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 4d0c52eab85..047ab338983 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -18,6 +18,7 @@ SRC_URI = "https://github.com/OpenPrinting/cups/releases/download/v${PV}/cups-${
            file://CVE-2023-32324.patch \
            file://CVE-2023-34241.patch \
 	   file://CVE-2023-32360.patch \
+	   file://CVE-2023-4504.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2023-4504.patch b/meta/recipes-extended/cups/cups/CVE-2023-4504.patch
new file mode 100644
index 00000000000..e52e43a209b
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


