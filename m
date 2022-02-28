Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DD8C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:01:52 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.19879.1646056878394925946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:01:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=gMjm4eM8;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056912; x=1677592912;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=DNFiuEbaX+GDLi7TJyLvHF70nkja8zW7oCKtFZVFlUM=;
  b=gMjm4eM8+lyuWQTvNzkXCEih+LUQFYuNNJ8+iivgtT12Mfah9BL0L6qa
   4lIPSfxvvRi349S5lKFokI2tWxbqYkHyq/408uveoll3nxtGvTImU6C13
   g3IsA18m7w5mKOvy+pgFtfE9rDY7IJO+WdXnSwmSA1z38NzsAa47dfZc0
   pGaelU2zO/G1Jhp2p8MML501FVYaNp6Sq/5B0QKyvzjvlrG/HZPxCkUpb
   RKE8zPye6KrpP2W8+OLGpssghPUHt2JmJnhlFwZFsfhqlQKZlexT/Eq/a
   0+kGYHfSWnWy15kEe1xztqUcxS+TsGHOUgpYu82pXt7v9HEi6cjn3H4S3
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857495"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857495"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:34 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092837"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:33 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 37/39] package_manager: ipk: Fix host manifest
 generation
Date: Mon, 28 Feb 2022 22:00:27 +0800
Message-Id: 
 <86cdad6283148232c69128870a4d27c6ac84663b.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:01:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162493

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
2.35.1


