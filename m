Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D769C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:32 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.13723.1645542509609922511
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=ek0xfnMO;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542511; x=1677078511;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=iavloehfw09rtXFuxdkzEJj1ovQkUMr5mbljbzi7Zsk=;
  b=ek0xfnMOm46UXF6/xhSD/mwHthJl+8279QnAbo6bQ+UbghaCYgflUcrA
   yc6Z70xi6uGfqeOPu7gC/PyFZB4L87QTMGFs97Arvid+2ALMv/kapje6n
   689piNsFILhHR0jFxhm9TpnC1ClTg6ELj0fuliCvmZknw0UCApshOuC9q
   pJkpQn9NfsMdijE0GOk7U5u7nEPTfKyHkOW4w4fJurU/9AvxrrZ8LKRds
   rDA5XrSLBAMNX+6FmUOVSmzom9AiVIfrbyx6vqYbH4jlhFVC4ZWMq7tJd
   u57icLntlBbdQAebGRol2Uy85T4w7/F8aXxwQI3HgA0+tEs99V3/Ad4jA
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249305103"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="249305103"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258606"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:12 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 16/38] cve-check: create directory of
 CVE_CHECK_MANIFEST before copy
Date: Tue, 22 Feb 2022 23:07:17 +0800
Message-Id: 
 <74888f3ba0c31d635930d94b066750e5440cc906.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162151

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
index 6c04ff9f09..21d3da7974 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -144,6 +144,7 @@ python cve_check_write_rootfs_manifest () {
         manifest_name = d.getVar("CVE_CHECK_MANIFEST")
         cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
 
+        bb.utils.mkdirhier(os.path.dirname(manifest_name))
         shutil.copyfile(cve_tmp_file, manifest_name)
 
         if manifest_name and os.path.exists(manifest_name):
-- 
2.35.1


