Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F436C41513
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 09:54:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.183668.1692266075942328846
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 02:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=FqP13hnR;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692266079; x=1723802079;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=JaYmDGK2UDXUIvdQbGkkcypIblLmr42HlhQgI/Vak/w=;
  b=FqP13hnRVxIBh4Qo4Vt3WC99e2K3tun5CMSXgWAwQ55D29k78t1/PpsX
   6p/hPx7GLpWOLdULDlLN9BI0ZgNGhcgsXNQdbUy1N53MyC0Pifzz/7qLv
   Zb0n7wnteAcRXiQQeA7q746Y4wAbjZ3y8DpsM4SBBQEFfk5cO9Pc2kE2b
   EpNpIJY4xjXMQP+njs/kmxX5oKoSf6kzbU8zk6ycUtr9LWiH742TNBvYO
   5K+0qRTnn0XBDXBNC9gpJBGE37SlZMw6s3bVNNo4wk9vIgq1h3w+luoVF
   nmcMETj7iPH+dqdsWVbVsUXLowObGe9CTexEe+9KBrh/UtlS9PsPvMP2X
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="352354504"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="352354504"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 02:54:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="734602758"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="734602758"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga002.jf.intel.com with ESMTP; 17 Aug 2023 02:54:35 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [mickledore][patch 2/2] ghostscript: fix CVE-2023-38559
Date: Thu, 17 Aug 2023 17:34:57 +0800
Message-Id: <20230817093457.1973287-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230817093457.1973287-1-chee.yang.lee@intel.com>
References: <20230817093457.1973287-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 09:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186302

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../ghostscript/CVE-2023-38559.patch          | 31 +++++++++++++++++++
 .../ghostscript/ghostscript_10.0.0.bb         |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-38559.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-38559.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-38559.patch
new file mode 100644
index 0000000000..4ef71cba7b
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-38559.patch
@@ -0,0 +1,31 @@
+CVE: CVE-2023-38559
+Upstream-Status: Backport [  https://git.ghostscript.com/?p=ghostpdl.git;a=patch;h=d81b82c70bc1 ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+From d81b82c70bc1fb9991bb95f1201abb5dea55f57f Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Mon, 17 Jul 2023 14:06:37 +0100
+Subject: [PATCH] Bug 706897: Copy pcx buffer overrun fix from
+ devices/gdevpcx.c
+
+Bounds check the buffer, before dereferencing the pointer.
+---
+ base/gdevdevn.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/base/gdevdevn.c b/base/gdevdevn.c
+index 7b14d9c71..6351fb77a 100644
+--- a/base/gdevdevn.c
++++ b/base/gdevdevn.c
+@@ -1983,7 +1983,7 @@ devn_pcx_write_rle(const byte * from, const byte * end, int step, gp_file * file
+         byte data = *from;
+ 
+         from += step;
+-        if (data != *from || from == end) {
++        if (from >= end || data != *from) {
+             if (data >= 0xc0)
+                 gp_fputc(0xc1, file);
+         } else {
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
index 9a900ee04f..9e2cd01ff4 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
@@ -36,6 +36,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://cross-compile.patch \
                 file://cve-2023-28879.patch \
                 file://cve-2023-36664.patch \
+                file://CVE-2023-38559.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.37.3


