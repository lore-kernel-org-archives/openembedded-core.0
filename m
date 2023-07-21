Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1155BEB64DC
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 05:30:38 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.1087.1689917433932798524
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 22:30:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=RlDFQjiQ;
 spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689917433; x=1721453433;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OhXSaKTyisTUqw9GPU32POaNgssNnBbPXACKUnmg8rI=;
  b=RlDFQjiQYTZswZhGUpccHc2c60coiBLQPl8B+/GtANkjWmpBNXlGIwSr
   tV+o+ZjDO+cWzFpRyBJpYD5LNSgMgl0lCKxv4/f3Te6hds+KUx6PWvB9J
   qlOKZ+Fn9CNd8nHT2y008XgwX/sriC+CrEel5AaDfzUU8ZCv4b9iFCu9w
   KBmdZTcfraa7z7mpIEnjiBW5HBkm6EGuI/4QeTJVrwaWz8e7shqFIxaCs
   iKkXaVkWsbCLhI6AQKXjOZa4drvWRIPyT+lKKA6JCOZWCJHyrM8OmhtPq
   eI+5D0nsfcKAgLEPQVNOiwb/tjPkvkgJWaRND6q2hPcmFobMna09oVMdF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="365835027"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="365835027"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 22:30:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="814817501"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="814817501"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.213.36.233])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 22:30:17 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest/cases/glibc.py: fix the override syntax
Date: Fri, 21 Jul 2023 13:30:13 +0800
Message-ID: <20230721053013.40823-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 05:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184667

Fix the override so we actually pass the correct value to glibc.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/glibc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
index a446543a17..4ec4b85d67 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -28,7 +28,7 @@ class GlibcSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
             features.append('TOOLCHAIN_TEST_HOST_USER = "root"')
             features.append('TOOLCHAIN_TEST_HOST_PORT = "22"')
             # force single threaded test execution
-            features.append('EGLIBCPARALLELISM_task-check:pn-glibc-testsuite = "PARALLELMFLAGS="-j1""')
+            features.append('EGLIBCPARALLELISM:task-check:pn-glibc-testsuite = "PARALLELMFLAGS="-j1""')
         self.write_config("\n".join(features))
 
         bitbake("glibc-testsuite -c check")
-- 
2.41.0


