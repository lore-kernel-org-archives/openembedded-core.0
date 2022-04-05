Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9673C38A02
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.7190.1649169707422558639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 07:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=WhWydUg3;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649169737; x=1680705737;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=s3CM695WR7fERWC+FGdDsBwLIj+UhdXWamobfCN9rAo=;
  b=WhWydUg3N9z+Vjb1ffkcNzgIfr3y++U17wXX527jl2ygiCi1+hkcD4ho
   iZny8aBlA7XZQF48IMmUO7MB4Sdmk3sgbhbZrf8S9hSEj/JRP5IgISxIL
   Ml7kLrLTSvbLP9srxo1xYdS2K05Tc+jthBhfXFa+eQbVqVNY4mdBPVl9K
   R0K6ncjEjMnlwPL6xkHmlvEtE2OlCqUdEVXgfbcrF8ciwAhdx3QnD8nXD
   1jpAiNLZd1FIfOL5Q/ydRRk68w6oQ/iwK2HHJGSH1/hkcbegqVyPXpdYP
   4ZMdnLlpTrUyEvmIofSH816p/hfgioSiy0+VVPITz1Hx0Tx3l/FMYZWn2
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="258348979"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="258348979"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:42:16 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="696953671"
Received: from ntabdull-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.226.238])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:42:15 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 20/22] oeqa/selftest/devtool: ensure Git username is
 set before upgrade tests
Date: Tue,  5 Apr 2022 22:41:39 +0800
Message-Id: 
 <d6b3ee9a7499e6d38a5feeb42a43b9590f9d1a83.1649169646.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1649169646.git.anuj.mittal@intel.com>
References: <cover.1649169646.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164038

From: Ross Burton <ross@burtonini.com>

The 'devtool upgrade' tests fail if Git doesn't know the user's name or
email, so verify this before the tests start and skip if it is not.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit b4d8aca97a1ead38ce55f3bb5859d3d05d9dd84f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index a2b4d7f7d1..1fe0628a44 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1464,6 +1464,14 @@ class DevtoolExtractTests(DevtoolBase):
 
 class DevtoolUpgradeTests(DevtoolBase):
 
+    def setUp(self):
+        super().setUp()
+        try:
+            runCmd("git config --global user.name")
+            runCmd("git config --global user.email")
+        except:
+            self.skip("Git user.name and user.email must be set")
+
     def test_devtool_upgrade(self):
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
-- 
2.35.1


