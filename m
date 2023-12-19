Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E2AC41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 03:54:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.5042.1702958068352517925
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 19:54:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=NPn3f+su;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702958068; x=1734494068;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c/g8BMB5BNmh0mbgHp9FGcQB9WaVfL2DKWK47cCZkys=;
  b=NPn3f+sunegwQLazJmpC5o3NrpCL2k83hTmzqsc68EBMN0T3f58EnSDU
   fkkzmMAfCOs2uuMjIGXH/8c6j/kHrodR5wo4ZqqdYxm5mtjbkmSb/260+
   PZeXt8B3aR8jAZobDFC9s07cjFXYFYT2dE0iXmXXJeoo3M6C2lEVNCe1c
   6FlYB+IJDDyvDxEi36gB/rgwDxHh3lkB4nHxSzLbxXkyXWNsdtUSYxYi+
   SPVP+UnkUZmxvqJrlCAuF1PwHko07ShvS9WCcpAbUdfLWHcFs1s0r0oxo
   cad2NGuIGQzm2LGbNJhdG0JnxQDeRAT7soCHf0hsG3LpGN7nwJyqXL47n
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="459943877"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="459943877"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 19:54:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="810078979"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="810078979"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga001.jf.intel.com with ESMTP; 18 Dec 2023 19:54:26 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [nanbield][PATCH] curl: fix CVE-2023-46218
Date: Tue, 19 Dec 2023 11:34:48 +0800
Message-Id: <20231219033448.3579600-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 03:54:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192688

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../curl/curl/CVE-2023-46218.patch            | 52 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.4.0.bb       |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-46218.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-46218.patch b/meta/recipes-support/curl/curl/CVE-2023-46218.patch
new file mode 100644
index 0000000000..de2f095664
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-46218.patch
@@ -0,0 +1,52 @@
+CVE: CVE-2023-46218 
+Upstream-Status: Backport [ https://github.com/curl/curl/commit/2b0994c29a721c91c57 ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+From 2b0994c29a721c91c572cff7808c572a24d251eb Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 23 Nov 2023 08:15:47 +0100
+Subject: [PATCH] cookie: lowercase the domain names before PSL checks
+
+Reported-by: Harry Sintonen
+
+Closes #12387
+---
+ lib/cookie.c | 24 ++++++++++++++++--------
+ 1 file changed, 16 insertions(+), 8 deletions(-)
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index 568cf537ad1b1f..9095cea3e97f22 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -1027,15 +1027,23 @@ Curl_cookie_add(struct Curl_easy *data,
+    * dereference it.
+    */
+   if(data && (domain && co->domain && !Curl_host_is_ipnum(co->domain))) {
+-    const psl_ctx_t *psl = Curl_psl_use(data);
+-    int acceptable;
+-
+-    if(psl) {
+-      acceptable = psl_is_cookie_domain_acceptable(psl, domain, co->domain);
+-      Curl_psl_release(data);
++    bool acceptable = FALSE;
++    char lcase[256];
++    char lcookie[256];
++    size_t dlen = strlen(domain);
++    size_t clen = strlen(co->domain);
++    if((dlen < sizeof(lcase)) && (clen < sizeof(lcookie))) {
++      const psl_ctx_t *psl = Curl_psl_use(data);
++      if(psl) {
++        /* the PSL check requires lowercase domain name and pattern */
++        Curl_strntolower(lcase, domain, dlen + 1);
++        Curl_strntolower(lcookie, co->domain, clen + 1);
++        acceptable = psl_is_cookie_domain_acceptable(psl, lcase, lcookie);
++        Curl_psl_release(data);
++      }
++      else
++        acceptable = !bad_domain(domain, strlen(domain));
+     }
+-    else
+-      acceptable = !bad_domain(domain, strlen(domain));
+ 
+     if(!acceptable) {
+       infof(data, "cookie '%s' dropped, domain '%s' must not "
diff --git a/meta/recipes-support/curl/curl_8.4.0.bb b/meta/recipes-support/curl/curl_8.4.0.bb
index 5f97730bf4..8f1ba52692 100644
--- a/meta/recipes-support/curl/curl_8.4.0.bb
+++ b/meta/recipes-support/curl/curl_8.4.0.bb
@@ -13,6 +13,7 @@ SRC_URI = " \
     https://curl.se/download/${BP}.tar.xz \
     file://run-ptest \
     file://disable-tests \
+    file://CVE-2023-46218.patch \
 "
 SRC_URI[sha256sum] = "16c62a9c4af0f703d28bda6d7bbf37ba47055ad3414d70dec63e2e6336f2a82d"
 
-- 
2.37.3


