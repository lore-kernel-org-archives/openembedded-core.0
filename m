Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8123C71153
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 10:22:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web11.45282.1693822968866623877
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 03:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=jxt/s0/m;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693822968; x=1725358968;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CRdwDlkyX02pq5dtHbI+aOaiVhcPJowTMUTNn5HCGW8=;
  b=jxt/s0/mDdl1EIxmeUScrCGlzw7L1px+OEHiDC8Ush/MQahrxNG/CL2/
   7jurdiNd6B3kj6MwMGrhFaCmR6koj/IvkwOLe/AB6Gc6IZmzE0Ei5JmcF
   5W6tDBYhqFCNOmc9dt1PT8450es8hX6oxgerTjtgaRdtisooc8mDmUE9y
   aLPlI4pRg0U/31vvImuYO+1LcrPQY0ZnYwytVsoApt2aej6pkFTIMY1hA
   lDfIl1TVDx6yHiCfqkKGpsp6xZUlIL6llnApO7eyUSO6dciYlVp79KH8Z
   9qIHaTPczpq6II9vRLI7JrCWxa1BpVIAV3b06AF1X92zuLP8jsSGt6u60
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="442965030"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="442965030"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 03:22:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="914465405"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="914465405"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga005.jf.intel.com with ESMTP; 04 Sep 2023 03:22:47 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [mickledore][kirkstone][patch] libssh2: fix CVE-2020-22218
Date: Mon,  4 Sep 2023 18:03:10 +0800
Message-Id: <20230904100310.2066246-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 10:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187169

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../libssh2/libssh2/CVE-2020-22218.patch      | 34 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.10.0.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2020-22218.patch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2020-22218.patch b/meta/recipes-support/libssh2/libssh2/CVE-2020-22218.patch
new file mode 100644
index 0000000000..066233fcae
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2020-22218.patch
@@ -0,0 +1,34 @@
+CVE:  CVE-2020-22218
+Upstream-Status: Backport [ https://github.com/libssh2/libssh2/commit/642eec48ff3adfdb7a9e562b6d7fc865d1733f45 ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+
+From 642eec48ff3adfdb7a9e562b6d7fc865d1733f45 Mon Sep 17 00:00:00 2001
+From: lutianxiong <lutianxiong@huawei.com>
+Date: Fri, 29 May 2020 01:25:40 +0800
+Subject: [PATCH] transport.c: fix use-of-uninitialized-value (#476)
+
+file:transport.c
+
+notes:
+return error if malloc(0)
+
+credit:
+lutianxiong
+---
+ src/transport.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/transport.c b/src/transport.c
+index 96fca6b8cc..adf96c2437 100644
+--- a/src/transport.c
++++ b/src/transport.c
+@@ -472,7 +472,7 @@ int _libssh2_transport_read(LIBSSH2_SESSION * session)
+             /* Get a packet handle put data into. We get one to
+                hold all data, including padding and MAC. */
+             p->payload = LIBSSH2_ALLOC(session, total_num);
+-            if(!p->payload) {
++            if(total_num == 0 || !p->payload) {
+                 return LIBSSH2_ERROR_ALLOC;
+             }
+             p->total_num = total_num;
diff --git a/meta/recipes-support/libssh2/libssh2_1.10.0.bb b/meta/recipes-support/libssh2/libssh2_1.10.0.bb
index d5513373b0..8483a292c2 100644
--- a/meta/recipes-support/libssh2/libssh2_1.10.0.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.10.0.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3e089ad0cf27edf1e7f261dfcd06acc7"
 SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://fix-ssh2-test.patch \
            file://run-ptest \
+           file://CVE-2020-22218.patch \
            "
 
 SRC_URI[sha256sum] = "2d64e90f3ded394b91d3a2e774ca203a4179f69aebee03003e5a6fa621e41d51"
-- 
2.37.3


