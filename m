Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A1DC433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 15:59:05 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.14227.1635263944386033352
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:59:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="290783250"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="290783250"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:58:58 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="578786303"
Received: from wandsuan-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.17])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:58:57 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 01/37] tar: filter CVEs using vendor name
Date: Tue, 26 Oct 2021 23:57:32 +0800
Message-Id: 
 <d11e970c6e2482ad0b21994e4ec85ddf2aea1ede.1635257336.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635257336.git.anuj.mittal@intel.com>
References: <cover.1635257336.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 15:59:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157404

From: Ralph Siemsen <ralph.siemsen@linaro.org>

Recently a number of CVEs have been logged against a nodejs project
called "node-tar". These appear as false positives against the GNU tar
being built by Yocto. Some of these have been manually excluded using
CVE_CHECK_WHITELIST.

To avoid this problem, use the vendor name (in addition to package name)
for filtering CVEs. The syntax for this is:
  CVE_PRODUCT = "vendor:package"
When not specified, the vendor defaults to "%" which matches anything.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 45d1a0bea0c628f84a00d641a4d323491988106f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/tar/tar_1.34.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/tar/tar_1.34.bb b/meta/recipes-extended/tar/tar_1.34.bb
index 3488a6c955..5a415c775a 100644
--- a/meta/recipes-extended/tar/tar_1.34.bb
+++ b/meta/recipes-extended/tar/tar_1.34.bb
@@ -63,6 +63,6 @@ NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
 
 BBCLASSEXTEND = "native nativesdk"
 
-# These are both specific to the NPM package node-tar
-CVE_CHECK_WHITELIST += "CVE-2021-32803 CVE-2021-32804"
-CVE_CHECK_WHITELIST += "CVE-2021-37701 CVE-2021-37712 CVE-2021-37713"
+# Avoid false positives from CVEs in node-tar package
+# For example CVE-2021-{32803,32804,37701,37712,37713}
+CVE_PRODUCT = "gnu:tar"
-- 
2.31.1


