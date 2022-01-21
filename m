Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A33C433F5
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 14:51:15 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.12868.1642776670242435373
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 06:51:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Isik2Rir;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642776674; x=1674312674;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=gg1Z3M4c1S4T0vB9jt9L0SRVjSjJ8rSrvohU202E08A=;
  b=Isik2Rirb7GO/759dA6pe1ZOaBfEX4xupdLGcSSOHLINRKCFgae8VC61
   WqO0NMiFUM9YjiZ3cH+KBqofbQdWesMjZ6G5w+maPCvIL1mRkDZ9Pq1b4
   VJx9RsY3lbE1XaHYNoJ+n/r5llc0SHEa2497HxaooxQi/ri7eez3KINvY
   k1SfRUo3GThmfi+F1NdaVLT+jFkn4CzSIl1+14tid8IQjmYRgmoDf8TAD
   7tONbIlJntkcBp3rHQNvCFySAUdhW4DG4Z+7HuLZOBiqchdyh06bXkY0b
   t8IkFgTfw0/HeFCV5chJOnntsQOlweRsBvkyfgIj7vSyaKKFf3QK4a8EU
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245886035"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600";
   d="scan'208";a="245886035"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 06:51:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600";
   d="scan'208";a="623336657"
Received: from gordonyx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.131.118])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 06:51:13 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 03/15] arch-armv8-5a.inc: Add tune include for
 armv8.5a
Date: Fri, 21 Jan 2022 22:50:51 +0800
Message-Id: 
 <8cd6d67c08b275f81a5467aeba1192bce957f604.1642736951.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1642736950.git.anuj.mittal@intel.com>
References: <cover.1642736950.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 14:51:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160834

From: Kevin Hao <kexin.hao@windriver.com>

This adds support for the armv8.5a architecture and the crypto
extension.

(From OE-Core rev: 0cb1a6d9cb4c32526d79dad93c8053b3793053f8)

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Kevin: Convert to the old style override syntax]
Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../machine/include/arm/arch-armv8-5a.inc     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/conf/machine/include/arm/arch-armv8-5a.inc

diff --git a/meta/conf/machine/include/arm/arch-armv8-5a.inc b/meta/conf/machine/include/arm/arch-armv8-5a.inc
new file mode 100644
index 0000000000..44c3b5bd22
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv8-5a.inc
@@ -0,0 +1,19 @@
+DEFAULTTUNE ?= "armv8-5a"
+
+TUNEVALID[armv8-5a] = "Enable instructions for ARMv8.5-a"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-5a', ' -march=armv8.5-a', '', d)}"
+# TUNE crypto will be handled by arch-armv8a.inc below
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-5a', 'armv8-5a:', '', d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Little Endian base configs
+AVAILTUNES += "armv8-5a armv8-5a-crypto"
+ARMPKGARCH_tune-armv8-5a                    ?= "armv8-5a"
+ARMPKGARCH_tune-armv8-5a-crypto             ?= "armv8-5a"
+TUNE_FEATURES_tune-armv8-5a                  = "aarch64 armv8-5a"
+TUNE_FEATURES_tune-armv8-5a-crypto           = "${TUNE_FEATURES_tune-armv8-5a} crypto"
+PACKAGE_EXTRA_ARCHS_tune-armv8-5a            = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8-5a"
+PACKAGE_EXTRA_ARCHS_tune-armv8-5a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8-5a} armv8-5a-crypto"
+BASE_LIB_tune-armv8-5a                       = "lib64"
+BASE_LIB_tune-armv8-5a-crypto                = "lib64"
-- 
2.34.1


