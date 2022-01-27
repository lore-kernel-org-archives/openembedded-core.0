Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21FE4C433FE
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 05:10:41 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web09.24368.1643260217446113039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 21:10:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=c+sFKN2z;
 spf=pass (domain: intel.com, ip: 192.55.52.120,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643260240; x=1674796240;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=pSuqpZG6D4zhlICYdGLI4iyVL5hKJeoX9KLWFO6266g=;
  b=c+sFKN2zN82uFje0VVwNAoy3tIkb+RDbm73keB6jXEzkUMtGOYktr7L6
   vdd6fyFjdscQH73nWm2J/yJX5IP51uVRFZcbMTXrRHHZBYLd5RB/Rd2/8
   yMMyZBc7BAORh1MlJqlbSIGeykkZ2e2urmCcUVIDTFgT/lqQYuwA+RNW3
   E/vQRjU/PHQmAUFKG2BhHo7NG2TbdtYl7jeWK5ALmlPCrPrd3psZcKfz4
   SZHCx+hPIJnEqRUwAGqt28Cm1AVpe+CVgV2XbCPApTOrW3mlvlEH5TUBr
   HUnTb1yUv1apFWdMu3QykSpji+3pQvfpXg8t+NlBgHdraPb1cndXPQ//g
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="245590375"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600";
   d="scan'208";a="245590375"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 21:10:40 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600";
   d="scan'208";a="618209067"
Received: from huiyinkx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.134.201])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 21:10:39 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 14/17] expat: fix CVE-2021-45960
Date: Thu, 27 Jan 2022 13:10:07 +0800
Message-Id: 
 <8d475823acf95d81596c1c125bc7dd4d0e0f5f1c.1643259953.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643259953.git.anuj.mittal@intel.com>
References: <cover.1643259953.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 05:10:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161017

From: Steve Sakoman <steve@sakoman.com>

In Expat (aka libexpat) before 2.4.3, a left shift by 29 (or more)
places in the storeAtts function in xmlparse.c can lead to realloc
misbehavior (e.g., allocating too few bytes, or only freeing memory).

Backport patch from:
https://github.com/libexpat/libexpat/pull/534/commits/0adcb34c49bee5b19bd29b16a578c510c23597ea

CVE: CVE-2021-45960
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 22fe1dea3164a5cd4d5636376f3671641ada1da9)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../expat/expat/CVE-2021-45960.patch          | 65 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.10.bb       |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2021-45960.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2021-45960.patch b/meta/recipes-core/expat/expat/CVE-2021-45960.patch
new file mode 100644
index 0000000000..523449e22c
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2021-45960.patch
@@ -0,0 +1,65 @@
+From 0adcb34c49bee5b19bd29b16a578c510c23597ea Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 27 Dec 2021 20:15:02 +0100
+Subject: [PATCH] lib: Detect and prevent troublesome left shifts in function
+ storeAtts (CVE-2021-45960)
+
+Upstream-Status: Backport:
+https://github.com/libexpat/libexpat/pull/534/commits/0adcb34c49bee5b19bd29b16a578c510c23597ea
+
+CVE: CVE-2021-45960
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+
+---
+ expat/lib/xmlparse.c | 31 +++++++++++++++++++++++++++++--
+ 1 file changed, 29 insertions(+), 2 deletions(-)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index d730f41c3..b47c31b05 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3414,7 +3414,13 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+   if (nPrefixes) {
+     int j; /* hash table index */
+     unsigned long version = parser->m_nsAttsVersion;
+-    int nsAttsSize = (int)1 << parser->m_nsAttsPower;
++
++    /* Detect and prevent invalid shift */
++    if (parser->m_nsAttsPower >= sizeof(unsigned int) * 8 /* bits per byte */) {
++      return XML_ERROR_NO_MEMORY;
++    }
++
++    unsigned int nsAttsSize = 1u << parser->m_nsAttsPower;
+     unsigned char oldNsAttsPower = parser->m_nsAttsPower;
+     /* size of hash table must be at least 2 * (# of prefixed attributes) */
+     if ((nPrefixes << 1)
+@@ -3425,7 +3431,28 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+         ;
+       if (parser->m_nsAttsPower < 3)
+         parser->m_nsAttsPower = 3;
+-      nsAttsSize = (int)1 << parser->m_nsAttsPower;
++
++      /* Detect and prevent invalid shift */
++      if (parser->m_nsAttsPower >= sizeof(nsAttsSize) * 8 /* bits per byte */) {
++        /* Restore actual size of memory in m_nsAtts */
++        parser->m_nsAttsPower = oldNsAttsPower;
++        return XML_ERROR_NO_MEMORY;
++      }
++
++      nsAttsSize = 1u << parser->m_nsAttsPower;
++
++      /* Detect and prevent integer overflow.
++       * The preprocessor guard addresses the "always false" warning
++       * from -Wtype-limits on platforms where
++       * sizeof(unsigned int) < sizeof(size_t), e.g. on x86_64. */
++#if UINT_MAX >= SIZE_MAX
++      if (nsAttsSize > (size_t)(-1) / sizeof(NS_ATT)) {
++        /* Restore actual size of memory in m_nsAtts */
++        parser->m_nsAttsPower = oldNsAttsPower;
++        return XML_ERROR_NO_MEMORY;
++      }
++#endif
++
+       temp = (NS_ATT *)REALLOC(parser, parser->m_nsAtts,
+                                nsAttsSize * sizeof(NS_ATT));
+       if (! temp) {
diff --git a/meta/recipes-core/expat/expat_2.2.10.bb b/meta/recipes-core/expat/expat_2.2.10.bb
index 5a123305c4..7a892b0304 100644
--- a/meta/recipes-core/expat/expat_2.2.10.bb
+++ b/meta/recipes-core/expat/expat_2.2.10.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 	   file://run-ptest \
 	   file://0001-Add-output-of-tests-result.patch \
            file://CVE-2022-22822-27.patch \
+           file://CVE-2021-45960.patch \
 	  "
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.34.1


