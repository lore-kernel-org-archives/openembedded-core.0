Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D99C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 14:18:36 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web09.318.1645107508890252839
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 06:18:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=X4fcX4IQ;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645107515; x=1676643515;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=O53Gmmu4Ja+yNHlhN7tjsG9HFdtbPVlyfImEvyZ8vzg=;
  b=X4fcX4IQpfXzklsv2/q8PykwURrRpHWGCMZtYu3Z8MUiT5hkl+brNj5m
   4Q1Q5Mabk+8Lbij1/eodqTr4vqN0v3N0/XlhGuvq+ramrA0Tn3KvFLWTt
   Ju4kQBh+BrZcUbmu/+uzjsYo8+9jysbZfu/cxkTm+FgJT3kjD8gOwHVGD
   pUYNceNXR3onJTpxeputY95G5n2GPvzgcc5TRS7iEGzA9m3iwJVP87ICd
   czuuhbb0Ew+C5P92GxX5VyMUQGM9meH8m/xu/FVDC41Wa+n/1f/3AGzGB
   yNpBDN6RI2ml406TTvlFC2Mm4Qvrqf6ZwT8snKX2EAG/cqE7397ayUSub
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="250617976"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600";
   d="scan'208";a="250617976"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:18:35 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600";
   d="scan'208";a="530249244"
Received: from kkoay3-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.130.102])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:18:33 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 05/14] cve-check: create directory of
 CVE_CHECK_MANIFEST before copy
Date: Thu, 17 Feb 2022 22:18:14 +0800
Message-Id: 
 <113b21fd3edc599c280f34875ca1477606424eec.1645106980.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645106980.git.anuj.mittal@intel.com>
References: <cover.1645106980.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 14:18:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161805

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Create directory of the CVE_CHECK_MANIFEST variable before copy to it,
so that the variable can use an arbitrary directory name.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9829c16301bf2dce39fa046401a984f112fa0322)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/cve-check.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 3add826fca..a95e810605 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -143,6 +143,7 @@ python cve_check_write_rootfs_manifest () {
         manifest_name = d.getVar("CVE_CHECK_MANIFEST")
         cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
 
+        bb.utils.mkdirhier(os.path.dirname(manifest_name))
         shutil.copyfile(cve_tmp_file, manifest_name)
 
         if manifest_name and os.path.exists(manifest_name):
-- 
2.35.1


