Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E07CAC433F5
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 08:34:19 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.3862.1637570053453876204
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 00:34:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="232232000"
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800";
   d="scan'208";a="232232000"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 00:34:19 -0800
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800";
   d="scan'208";a="508448618"
Received: from amohdwah-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.239.176])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 00:34:18 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 4/5] create-spdx: Protect against None from
 LICENSE_PATH
Date: Mon, 22 Nov 2021 16:34:05 +0800
Message-Id: 
 <123ee0fc0d1470427cc563f512f621e0172cc232.1637569916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637569916.git.anuj.mittal@intel.com>
References: <cover.1637569916.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 08:34:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158558

From: Saul Wold <Saul.Wold@windriver.com>

If LICENSE_PATH is not set, then the split() will fail on a NoneType.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d6260decae6d2654f6e058f12ca02d582a8ef5a4)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/create-spdx.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 1d5c8b3bc1..d0cc5b1ca2 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -92,7 +92,7 @@ def convert_license_to_spdx(lic, document, d, existing={}):
             extracted_info.extractedText = "Software released to the public domain"
         elif name in available_licenses:
             # This license can be found in COMMON_LICENSE_DIR or LICENSE_PATH
-            for directory in [d.getVar('COMMON_LICENSE_DIR')] + d.getVar('LICENSE_PATH').split():
+            for directory in [d.getVar('COMMON_LICENSE_DIR')] + (d.getVar('LICENSE_PATH') or '').split():
                 try:
                     with (Path(directory) / name).open(errors="replace") as f:
                         extracted_info.extractedText = f.read()
@@ -145,7 +145,6 @@ def convert_license_to_spdx(lic, document, d, existing={}):
 
     return ' '.join(convert(l) for l in lic_split)
 
-
 def process_sources(d):
     pn = d.getVar('PN')
     assume_provided = (d.getVar("ASSUME_PROVIDED") or "").split()
-- 
2.33.1


