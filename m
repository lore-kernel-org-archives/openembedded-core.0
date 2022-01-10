Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49BCC433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 04:09:27 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.27324.1641787762773038697
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 20:09:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=HLOFf2qT;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641787766; x=1673323766;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=zVGD1PZC5bCKep4q7rgKqMrCFxR+So/l1w1C0msr8ME=;
  b=HLOFf2qTG5J3YVlgtbs2aBIeFTZKaNjTXC41zQ848opAH30UEKtNcWzt
   XhTKLIq7Yk95e1krxujU+thKndCGNeshVTDlHNji4Cq7/sEBTGiudu8Ji
   3+6vztZZs8EjI+qhzPOurOmKlpMp6BrWDaswsIeU18JaCXt6DXEXZ7k1K
   Va91dxFBjsHp2DUTzLJnAFKRCdpovtLg/eIXAl/gnFtWT0tdNXp2T2CkW
   VuAsKbb1eyLrPdwfONx/K1AxLZIoAt4dpTh4CtwY+gitn40SriqPlCBYO
   NZOTX8nj5Dxaquchgw6aTrSw1FeWikO8v46NLfB3pbwme5jn29UqX1bwr
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="243347353"
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600";
   d="scan'208";a="243347353"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 20:09:26 -0800
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600";
   d="scan'208";a="764402201"
Received: from bboox-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.135.82])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 20:09:25 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 03/10] package_manager: ipk: Fix host manifest
 generation
Date: Mon, 10 Jan 2022 12:09:07 +0800
Message-Id: 
 <fe439e296f7b5f6d6b126952ba8aa3812d31d4e8.1641787452.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1641787452.git.anuj.mittal@intel.com>
References: <cover.1641787452.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 04:09:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160324

From: Oleksiy Obitotskyy <oobitots@cisco.com>

Since honister host manifest stopped to generate, i.e.
manifest file is empty but all ipks/files into sdk is
ok.

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 79a2392f5d2a4cb6509a83afb40bca01bac59914)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/sdk.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 37b59afd1a..27347667e8 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -115,6 +115,10 @@ def sdk_list_installed_packages(d, target, rootfs_dir=None):
 
         rootfs_dir = [sdk_output, os.path.join(sdk_output, target_path)][target is True]
 
+    if target is False:
+        ipkgconf_sdk_target = d.getVar("IPKGCONF_SDK")
+        d.setVar("IPKGCONF_TARGET", ipkgconf_sdk_target)
+
     img_type = d.getVar('IMAGE_PKGTYPE')
     import importlib
     cls = importlib.import_module('oe.package_manager.' + img_type)
-- 
2.33.1


