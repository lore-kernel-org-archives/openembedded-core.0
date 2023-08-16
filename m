Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08748C41513
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:49:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.152137.1692150576737064304
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=mf+1eEsO;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692150576; x=1723686576;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZPhMiulz2qsDBNeB7MLjtCnNuh3POYulfN7gUhetKqc=;
  b=mf+1eEsOlepfF8cDVEvD8rQ8/o+b8REmwBFZXlILxQ9qMK35R9wMVf+B
   Mpymk1b1gx+72kYrcC5JsZltWV+cCPUhyaOXCkD0GYZa8IsJZefQY6iWD
   vZ7wC3NWFepk11w9tp8qwtdn0AVufyWyg3ijeS6L3gFvq8BTXAVwDlFke
   FdymAc00oHdHGqP/lEmuXL9ih5A7FTvVzZOEetB0Vr7gufD7xH/MonZDw
   JyQB1l3euaBiMNJMXu8yub2VTssJAkfY0UKjFYJFtKiZKuk0+uDFnIjxE
   poRqad2iMAMlbcL00GZt+/RUXH4qlc15oBdwRUtlLy8qWjOaM+BtZVPm8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="375189096"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="375189096"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 18:49:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="737101834"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="737101834"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga007.fm.intel.com with ESMTP; 15 Aug 2023 18:49:34 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [mickledore][patch] curl: fix CVE-2023-32001
Date: Wed, 16 Aug 2023 09:29:58 +0800
Message-Id: <20230816012958.1335216-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 01:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186105

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../curl/curl/CVE-2023-32001.patch            | 39 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.0.1.bb       |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-32001.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-32001.patch b/meta/recipes-support/curl/curl/CVE-2023-32001.patch
new file mode 100644
index 0000000000..c9ca3ae514
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-32001.patch
@@ -0,0 +1,39 @@
+CVE: CVE-2023-32001
+Upstream-Status: Backport [https://github.com/curl/curl/commit/0c667188e0c6cda615a036b8a2b4125f2c404dde]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+
+From 0c667188e0c6cda615a036b8a2b4125f2c404dde Mon Sep 17 00:00:00 2001
+From: SaltyMilk <soufiane.elmelcaoui@gmail.com>
+Date: Mon, 10 Jul 2023 21:43:28 +0200
+Subject: [PATCH] fopen: optimize
+
+Closes #11419
+---
+ lib/fopen.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/lib/fopen.c b/lib/fopen.c
+index c9c9e3d6e73a2..b6e3cadddef65 100644
+--- a/lib/fopen.c
++++ b/lib/fopen.c
+@@ -56,13 +56,13 @@ CURLcode Curl_fopen(struct Curl_easy *data, const char *filename,
+   int fd = -1;
+   *tempname = NULL;
+ 
+-  if(stat(filename, &sb) == -1 || !S_ISREG(sb.st_mode)) {
+-    /* a non-regular file, fallback to direct fopen() */
+-    *fh = fopen(filename, FOPEN_WRITETEXT);
+-    if(*fh)
+-      return CURLE_OK;
++  *fh = fopen(filename, FOPEN_WRITETEXT);
++  if(!*fh)
+     goto fail;
+-  }
++  if(fstat(fileno(*fh), &sb) == -1 || !S_ISREG(sb.st_mode))
++    return CURLE_OK;
++  fclose(*fh);
++  *fh = NULL;
+ 
+   result = Curl_rand_hex(data, randsuffix, sizeof(randsuffix));
+   if(result)
diff --git a/meta/recipes-support/curl/curl_8.0.1.bb b/meta/recipes-support/curl/curl_8.0.1.bb
index ecef173df2..bcfe4a6088 100644
--- a/meta/recipes-support/curl/curl_8.0.1.bb
+++ b/meta/recipes-support/curl/curl_8.0.1.bb
@@ -17,6 +17,7 @@ SRC_URI = " \
     file://CVE-2023-28319.patch \
     file://CVE-2023-28320.patch \
     file://CVE-2023-28321.patch \
+    file://CVE-2023-32001.patch \
 "
 SRC_URI[sha256sum] = "0a381cd82f4d00a9a334438b8ca239afea5bfefcfa9a1025f2bf118e79e0b5f0"
 
-- 
2.37.3


