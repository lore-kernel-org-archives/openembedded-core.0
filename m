Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4811C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 04:09:24 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.27324.1641787762773038697
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 20:09:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=jnxmZlP3;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641787763; x=1673323763;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ng6HRyKwvCHURzJyTEqM0M3AQwP7oJacXPc3KQlM3Mc=;
  b=jnxmZlP3hJgb5jkRdS/a4gZ7PTnli5Uf4DwRtmcpoAS1GBF1VD3hwhX4
   IzDlD7dtjM1qyHJNXlcIR1D3LEcBxr7OIny/yClPtV0AZc4qkyIc836du
   MzUaWv4CLPqgN02pq4WRtr+CYAPfnG0jgugGkOh4a4Hu0YVwez504mtP7
   1/Temd5EDkrc8BTJ9ynQgZ7BYXnJBRiZ8LRJXEwSHBYpcHuu3Vdb2CCO+
   c59m+XvBUAAnGZoSXQTnnaGkN0Y9BYq1TykEJYs6peVoEOQEz+Dx6puqS
   1ZQyc9NSD0T3BfYTvprljKdP2O36/iScu2FUgoU0P816W/ubOSL3NZYI3
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="243347343"
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600";
   d="scan'208";a="243347343"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 20:09:23 -0800
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600";
   d="scan'208";a="764402190"
Received: from bboox-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.135.82])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 20:09:22 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 01/10] linux-yocto: add libmpc-native to DEPENDS
Date: Mon, 10 Jan 2022 12:09:05 +0800
Message-Id: 
 <b6325e65ab0dffa63c5b46ff5dd0409db82d30ae.1641787452.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1641787452.git.anuj.mittal@intel.com>
References: <cover.1641787452.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 04:09:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160322

From: Ross Burton <ross@burtonini.com>

5.10.85 changed how the GCC plugins are built, which means they now
depend on both GMP and MPC to be built. We already depend on gmp-native,
so add libmpc-native aswell.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index c62157d850..bbb25f7393 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -36,7 +36,7 @@ LINUX_VERSION ?= "5.10.87"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-DEPENDS += "gmp-native"
+DEPENDS += "gmp-native libmpc-native"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.33.1


