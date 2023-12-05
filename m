Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D52BC4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 02:35:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web11.90255.1701743732350797304
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 18:35:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=nApohNWC;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701743733; x=1733279733;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=QLthavnv+2RvKDjFJftsRh49lZACXHsMfjHJjeOYFyU=;
  b=nApohNWC04V9gw8Ri2LdRJlu+N4wRcmBGg0UpGf3N0Jjq3mwstjlupzx
   gtrglNPyaU+E9EOipFrXoK1WG/vxu9dsZUh0qrZ9w6G1LYfV/SNdsAD1q
   6L4+PaRdr7iTT7WYAtL+gS9EuH2DGnjAatnOwRaQs6Ex6ZJfeZoaXgn9x
   NacwlmwF6T1PLK4OcrBGVvc6/aO9lDADgBMu5z1gtAIC6j04ZGO2xPgBs
   bqK1u9duuzjXRt8cKkiFnzUl6jq+yjvrxJT4skCSYw+vOdDFoGRR5B8Ul
   4VXIealj1X40jtBV8WEj7Z7Lg47zuAeOUKuVzaYqW7fs9IHmn7WgjmGhN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="460319209"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="460319209"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 18:35:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="836817759"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="836817759"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga008.fm.intel.com with ESMTP; 04 Dec 2023 18:35:31 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH 2/2] qemu: ignore CVE-2021-20295 CVE-2023-2680
Date: Tue,  5 Dec 2023 10:15:52 +0800
Message-Id: <20231205021552.2248854-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20231205021552.2248854-1-chee.yang.lee@intel.com>
References: <20231205021552.2248854-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 02:35:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191774

From: Lee Chee Yang <chee.yang.lee@intel.com>

Ignore RHEL specific CVE-2021-20295 CVE-2023-2680.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index a24915c35c..9dd90e8789 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -166,6 +166,13 @@ CVE_CHECK_WHITELIST += "CVE-2020-27661"
 # this bug related to windows specific.
 CVE_CHECK_WHITELIST += "CVE-2023-0664"
 
+# As per https://bugzilla.redhat.com/show_bug.cgi?id=2203387
+# RHEL specific issue
+CVE_CHECK_WHITELIST += "CVE-2023-2680"
+
+# Affected only `qemu-kvm` shipped with Red Hat Enterprise Linux 8.3 release.
+CVE_CHECK_WHITELIST += "CVE-2021-20295"
+
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
 
-- 
2.37.3


