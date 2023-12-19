Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D37C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 05:35:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.6203.1702964146303066482
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 21:35:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=louXnCxM;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702964146; x=1734500146;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WxFnsEgi8A0973Rkhr7/F+GSD7RRBqigJ681L58g8eU=;
  b=louXnCxM7j+z9maP8W3CMFX0tRA07JK46LoyLmkEMLuLv1gO+bX0pOPL
   E9mhTsxvf+vgOXzNAE9G3T6DH3O+fioDlxl4gVSHRprkO2JDsYttteRgU
   DQ1E/9JmDtupv0udpmR4xf/723D31NZbguq2f7frnWYpbp6rE7WCMQYVZ
   ZpD4wrb3O2qWdlL4zuH0IUnS7GAKRyLEyDw8AcUeD/rxrmj8ZYdLnj45j
   0Ie+nTdNxWqCMZ1F3DPWG8UyttY6h2yUQCZTPNKX+iCxLi0hjub9CBy1c
   fDrGY2VDr5lo9SRyEa6zd8B+KLsYMZhSEtpK486AO7L6/wgzidZO21kE8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="386030462"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="386030462"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 21:35:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="775841654"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="775841654"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga002.jf.intel.com with ESMTP; 18 Dec 2023 21:35:44 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][patch] curl: fix CVE-2023-46218
Date: Tue, 19 Dec 2023 13:16:06 +0800
Message-Id: <20231219051606.3610076-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 05:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192692

From: Lee Chee Yang <chee.yang.lee@intel.com>

import patch from ubuntu
http://archive.ubuntu.com/ubuntu/pool/main/c/curl/curl_7.68.0-1ubuntu2.21.debian.tar.xz

upstream https://github.com/curl/curl/commit/2b0994c29a721c91c57

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../curl/curl/CVE-2023-46218.patch            | 52 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-46218.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-46218.patch b/meta/recipes-support/curl/curl/CVE-2023-46218.patch
new file mode 100644
index 0000000000..c9677b6a84
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-46218.patch
@@ -0,0 +1,52 @@
+CVE: CVE-2023-46218
+Upstream-Status: Backport [ import from ubuntu http://archive.ubuntu.com/ubuntu/pool/main/c/curl/curl_7.68.0-1ubuntu2.21.debian.tar.xz  upstream https://github.com/curl/curl/commit/2b0994c29a721c91c57  ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+Backport of:
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
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -967,15 +967,23 @@ Curl_cookie_add(struct Curl_easy *data,
+ #ifdef USE_LIBPSL
+   /* Check if the domain is a Public Suffix and if yes, ignore the cookie. */
+   if(domain && co->domain && !isip(co->domain)) {
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
++        acceptable = !bad_domain(domain);
+     }
+-    else
+-      acceptable = !bad_domain(domain);
+ 
+     if(!acceptable) {
+       infof(data, "cookie '%s' dropped, domain '%s' must not "
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index 82b07bc554..a8e6c4f3ee 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -57,6 +57,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2023-38546.patch \
            file://CVE-2023-28321.patch \
            file://CVE-2023-28322.patch \
+           file://CVE-2023-46218.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.37.3


