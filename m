Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE152C4332F
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 14:51:17 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.12868.1642776670242435373
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 06:51:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=fZlA0Erd;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642776676; x=1674312676;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=kE60vFa/vfEsIRKtXR1qL7pbYANgluz/+xrsMphzJdE=;
  b=fZlA0ErddDiso7EP2Kfwm+7u+t8HUz85D5Atq/GUVF7HB7N90H/zWaCg
   ceRkW3ghJCebLMvIfcQ5zJ2VFQUMR2w/xrEDeF3BY+WtMpe4VHLPf7WrE
   Qf6tyvY4tj4ZpUwaukYdCcSW7tqlX0DrVA7Sg4gjorTcMDKSo77Gh7A3I
   fIgma+JzlDhXjOQCfdlTzCiEJL6J09dLi6tXyzL2ovLAZBArFqIq5bpjd
   Fn6DOWW/tyfIRpdKbnjjJ0SzQ6dDmtjbTeDyhV0t9GjChmgxalqP7dbGn
   dB4Lp2dYPB9x+x9Qzo1d7MXLm5tV6d2zH+x2+Y40TnKdAotB32th01ZIg
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245886042"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600";
   d="scan'208";a="245886042"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 06:51:16 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600";
   d="scan'208";a="623336677"
Received: from gordonyx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.131.118])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 06:51:14 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 04/15] armv9a/tune: Add the support for the
 Neoverse N2 core
Date: Fri, 21 Jan 2022 22:50:52 +0800
Message-Id: 
 <3ceee568313ea7cd3afe33df8119319644e12fa4.1642736951.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1642736950.git.anuj.mittal@intel.com>
References: <cover.1642736950.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 14:51:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160835

From: Kevin Hao <kexin.hao@windriver.com>

This adds the support for the Neoverse N2 core, even though the
Neoverse N2 core implements the Arm v9.0-A architecture, but the support
of it in GCC is based on the Arm v8.5-A architecture. Please see the
commit 50d9db203bc3 ("aarch64: Add support for Neoverse N2 CPU") in GCC
for more detail.

(From OE-Core rev: 37597397f03b6b0082a702147dc536ff8b2fa7a3)

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Kevin: Convert to the old style override syntax]
Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../include/arm/armv9a/tune-neoversen2.inc    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc

diff --git a/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc b/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc
new file mode 100644
index 0000000000..dedabcf46e
--- /dev/null
+++ b/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc
@@ -0,0 +1,22 @@
+#
+# Tune Settings for Neoverse-N2
+#
+DEFAULTTUNE ?= "neoversen2"
+
+TUNEVALID[neoversen2] = "Enable Neoverse-N2 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neoversen2', ' -mcpu=neoverse-n2', '', d)}"
+
+# Even though the Neoverse N2 core implemnts the Arm v9.0-A architecture,
+# but the support of it in GCC is based on the Arm v8.5-A architecture.
+require conf/machine/include/arm/arch-armv8-5a.inc
+
+# Little Endian base configs
+AVAILTUNES                                         += "neoversen2 neoversen2-crypto"
+ARMPKGARCH_tune-neoversen2                          = "neoversen2"
+ARMPKGARCH_tune-neoversen2-crypto                   = "neoversen2-crypto"
+TUNE_FEATURES_tune-neoversen2                       = "${TUNE_FEATURES_tune-armv8-5a} neoversen2"
+TUNE_FEATURES_tune-neoversen2-crypto                = "${TUNE_FEATURES_tune-neoversen2} crypto"
+PACKAGE_EXTRA_ARCHS_tune-neoversen2                 = "${PACKAGE_EXTRA_ARCHS_tune-armv8-5a} neoversen2"
+PACKAGE_EXTRA_ARCHS_tune-neoversen2-crypto          = "${PACKAGE_EXTRA_ARCHS_tune-armv8-5a-crypto} neoversen2 neoversen2-crypto"
+BASE_LIB_tune-neoversen2                            = "lib64"
+BASE_LIB_tune-neoversen2-crypto                     = "lib64"
-- 
2.34.1


