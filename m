Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62ED2CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 10:59:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web10.35810.1697194781037847552
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 03:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=iqLHG2cp;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697194781; x=1728730781;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=muZBDThfq1hIULX79v8sSzRGD8F/cP0H+wKGe2DwRyk=;
  b=iqLHG2cpiNPQ/Cevol+gEcDdp/K1yGHlvqPgliiIwTXrjo+80RN7vosA
   uCU2+4snYqH1RPZmLI9tc70cMSyTy3a1f/36dq9klGMObGQOs0YnyrWyQ
   TFp6xXSrAacci3HIhVa0sQ5qBO7sZndfYdLHDIfdjZlrQRHsw4ynSJsO+
   J3tgWD+QmDat+JWXc72/DNpre7s/k9NPYL4L1oB2BB17gBi9Ipcev4fwj
   Ga6UuaOI//7ySoEjooiEPefqFKbMTYIBQFHg8jUhg4E70/I4qSrwG82yl
   A3NMb3gvbf8jkPK3QmXOMzJi2to0Yj//W+282fSMqu9cQS8MOlHh9h71k
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="471389781"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="471389781"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 03:59:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="928385168"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="928385168"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga005.jf.intel.com with ESMTP; 13 Oct 2023 03:59:32 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [mickledore][PATCH 2/2] cups: fix CVE-2023-4504
Date: Fri, 13 Oct 2023 18:39:54 +0800
Message-Id: <20231013103954.2205925-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20231013103954.2205925-1-chee.yang.lee@intel.com>
References: <20231013103954.2205925-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 10:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189060

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2023-4504.patch             | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-4504.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index c6a676b747..d09ceb203f 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -17,6 +17,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://cups-volatiles.conf \
            file://CVE-2023-32324.patch \
            file://CVE-2023-34241.patch \
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


