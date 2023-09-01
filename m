Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8129CA0FE6
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 13:01:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web11.5659.1693573285195678325
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Sep 2023 06:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=L7PU+eE/;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693573288; x=1725109288;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=R9uoOQeFHgu4rYnt3ACB5yxYUWf2q2kZHECd2i+HmJw=;
  b=L7PU+eE/SSVta0cJA8dot/IQGY1Y+qyu465gE5X+aDns6QRwZQYAxH/J
   FF/9Te/91afvWH1YJy4dNWFPc5rRRzuIxkClkThvNyz4qIHKmHNRH3BfR
   kp3BdpugQWAYCB8Yg5OMs+wxMWfDTk6u+ryO82N3+WvzKsXLc+Evl400Y
   SNPGCcfug4nkv+gy3VCShQGbMxj2db5vD3vouA+uwCQZ4q/Y1mX2h4l8v
   4ZhBFpwQy+XUnYSTFWSmQ4tuGthZ7EQ5k51tYHo1l6sMjmUdtDyQKRG2u
   3uQ4aN5+DqwYJ9SN/LCyS2nRLw78AjkzJtZ1paltReZwZWUSD7o38zVab
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="361239749"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="361239749"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 06:01:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="739924104"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="739924104"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga002.jf.intel.com with ESMTP; 01 Sep 2023 06:01:23 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [mickledore][patch 4/4] go: upgrade 1.20.6 -> 1.20.7
Date: Fri,  1 Sep 2023 20:41:43 +0800
Message-Id: <20230901124143.1639925-4-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230901124143.1639925-1-chee.yang.lee@intel.com>
References: <20230901124143.1639925-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 13:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187009

From: Sakib Sajal <sakib.sajal@windriver.com>

Upgrade to latest 1.20.x release [1]:

$ git log --oneline go1.20.6..go1.20.7 origin/release-branch.go1.20
adb775e309 (tag: go1.20.7, origin/release-branch.go1.20) [release-branch.go1.20] go1.20.7
659f2a2207 [release-branch.go1.20] crypto/tls: restrict RSA keys in certificates to <= 8192 bits
10d85fa0f6 [release-branch.go1.20] cmd/asm, cmd/internal/obj: generate proper atomic ops for riscv64
bd3a1f24e7 [release-branch.go1.20] net: tolerate permission errors in interface tests
6211a024b4 [release-branch.go1.20] cmd/compile: on PPC64, fix sign/zero extension when masking

[1] https://github.com/golang/go/compare/go1.20.6...go1.20.7

Upgrade include fix for CVE-2023-29409 CVE-2023-39533

(cherry picked from commit 039324d917ed124228a14ac1effdd66b27d9e82b)

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/go/{go-1.20.6.inc => go-1.20.7.inc}   | 2 +-
 ...o-binary-native_1.20.6.bb => go-binary-native_1.20.7.bb} | 6 +++---
 ...cross-canadian_1.20.6.bb => go-cross-canadian_1.20.7.bb} | 0
 .../go/{go-cross_1.20.6.bb => go-cross_1.20.7.bb}           | 0
 .../go/{go-crosssdk_1.20.6.bb => go-crosssdk_1.20.7.bb}     | 0
 .../go/{go-native_1.20.6.bb => go-native_1.20.7.bb}         | 0
 .../go/{go-runtime_1.20.6.bb => go-runtime_1.20.7.bb}       | 0
 meta/recipes-devtools/go/{go_1.20.6.bb => go_1.20.7.bb}     | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.20.6.inc => go-1.20.7.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.20.6.bb => go-binary-native_1.20.7.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.20.6.bb => go-cross-canadian_1.20.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.20.6.bb => go-cross_1.20.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.20.6.bb => go-crosssdk_1.20.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.20.6.bb => go-native_1.20.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.20.6.bb => go-runtime_1.20.7.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.20.6.bb => go_1.20.7.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.20.6.inc b/meta/recipes-devtools/go/go-1.20.7.inc
similarity index 90%
rename from meta/recipes-devtools/go/go-1.20.6.inc
rename to meta/recipes-devtools/go/go-1.20.7.inc
index 6277020fec..009a67e89e 100644
--- a/meta/recipes-devtools/go/go-1.20.6.inc
+++ b/meta/recipes-devtools/go/go-1.20.7.inc
@@ -17,4 +17,4 @@ SRC_URI += "\
     file://CVE-2023-24531_1.patch \
     file://CVE-2023-24531_2.patch \
 "
-SRC_URI[main.sha256sum] = "62ee5bc6fb55b8bae8f705e0cb8df86d6453626b4ecf93279e2867092e0b7f70"
+SRC_URI[main.sha256sum] = "2c5ee9c9ec1e733b0dbbc2bdfed3f62306e51d8172bf38f4f4e542b27520f597"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.6.bb b/meta/recipes-devtools/go/go-binary-native_1.20.7.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.20.6.bb
rename to meta/recipes-devtools/go/go-binary-native_1.20.7.bb
index 5b2f8f4352..3decde1954 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.20.6.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.20.7.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "b945ae2bb5db01a0fb4786afde64e6fbab50b67f6fa0eb6cfa4924f16a7ff1eb"
-SRC_URI[go_linux_arm64.sha256sum] = "4e15ab37556e979181a1a1cc60f6d796932223a0f5351d7c83768b356f84429b"
-SRC_URI[go_linux_ppc64le.sha256sum] = "a1b91a42a40bba54bfd5c96c23d72250e0c424038d0d2b5c7950b828b4905822"
+SRC_URI[go_linux_amd64.sha256sum] = "f0a87f1bcae91c4b69f8dc2bc6d7e6bfcd7524fceec130af525058c0c17b1b44"
+SRC_URI[go_linux_arm64.sha256sum] = "44781ae3b153c3b07651d93b6bc554e835a36e2d72a696281c1e4dad9efffe43"
+SRC_URI[go_linux_ppc64le.sha256sum] = "6318a1db307c12b8afe68808bd6fae4fba1e558a85b958216096869ed506dcb3"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.6.bb b/meta/recipes-devtools/go/go-cross-canadian_1.20.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.20.6.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.20.7.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.20.6.bb b/meta/recipes-devtools/go/go-cross_1.20.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.20.6.bb
rename to meta/recipes-devtools/go/go-cross_1.20.7.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.6.bb b/meta/recipes-devtools/go/go-crosssdk_1.20.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.20.6.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.20.7.bb
diff --git a/meta/recipes-devtools/go/go-native_1.20.6.bb b/meta/recipes-devtools/go/go-native_1.20.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.20.6.bb
rename to meta/recipes-devtools/go/go-native_1.20.7.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.20.6.bb b/meta/recipes-devtools/go/go-runtime_1.20.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.20.6.bb
rename to meta/recipes-devtools/go/go-runtime_1.20.7.bb
diff --git a/meta/recipes-devtools/go/go_1.20.6.bb b/meta/recipes-devtools/go/go_1.20.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.20.6.bb
rename to meta/recipes-devtools/go/go_1.20.7.bb
-- 
2.37.3


