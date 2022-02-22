Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F602C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:45 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.13738.1645542524375105249
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=GRMgtL2i;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542524; x=1677078524;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=zxvn7McdsK+1A/TyGbmilMmDrdZUnVXrI2SwSQl+zVc=;
  b=GRMgtL2iau/JChaxdO+4ec5Xrn60EVfZjjrqYQxWZpslRDixjysJ7jzw
   voftgNRaYnhGRz4KsUgvSbzcI8y4nEocvpwZ96A8a+t7YfsOnT/ua2IeB
   FG8luVMNP5jKg62rmSb4TDJOYMaJzur8hFP424N2o285Q0ZF0AgAM2vQO
   TGlvqQTshK5pv+ZXC5QvaWPOIcxoXN4IL62oEvuVyjSGVqaC/eA3AXBGl
   iHU/CoHqysppkpucXecYru4K0AG7FeHTgM014HNQBks7ap/2vNJt4AGCi
   /cIOswHpm+IMq/zafxcIyFFAFxm021UxBt+OqD64FNA9jZ3J33oupCcVI
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249305249"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="249305249"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:31 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258754"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:30 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 27/38] libpcap: Disable DPDK explicitly
Date: Tue, 22 Feb 2022 23:07:28 +0800
Message-Id: 
 <61fe2321426af41cc36f3fdbdf9774edae398933.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162163

From: Sean Anderson <sean.anderson@seco.com>

libpcap looks for DPDK in the same way it looks for DAG. This can poison
the build even if it doesn't find anything. Explicitly disable dpdk.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit be5442f065da40b41d3cd60793341e22654f2681)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
index 9a8c46e0ef..dbe2fd8157 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
@@ -19,10 +19,11 @@ BINCONFIG = "${bindir}/pcap-config"
 
 # Explicitly disable dag support. We don't have recipe for it and if enabled here,
 # configure script poisons the include dirs with /usr/local/include even when the
-# support hasn't been detected.
+# support hasn't been detected. Do the same thing for DPDK.
 EXTRA_OECONF = " \
                  --with-pcap=linux \
                  --without-dag \
+                 --without-dpdk \
                  "
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
-- 
2.35.1


