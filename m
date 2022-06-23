Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E685C43334
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 07:44:47 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.4762.1655970281280858783
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 00:44:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fnVhg/RE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty.fritz.box (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 718F16000C;
	Thu, 23 Jun 2022 07:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655970279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ucKUiIq7Az3gb1V/RethN/DY9Nrj6j5y25mHEGdf5H8=;
	b=fnVhg/RE2GxKEE+uK3NhxSGhU8qzSYFIp/tm9r08ea7yjr38+eNhqAn/ou33N6IgQ0uEAs
	Gbo1rGl1JbLV1v8MXQ/mI28SZqx9WCt76ROA2kMr1rGgsIfIZlT0DJnEF9u8THgcpDpANh
	N0lB0y6jSfMo5JPn2PbOW5I6RetGq+ZSn16GCRTyJUzWentDueS5aK+BQCS1hP28brvzDX
	kVWShOvJ0ogHsimXFlUN2O8CbfgXStkE2Dp8T+I/S5IkmrrKu75PSqxrRaXaeutWSaBajc
	vhXZ+U++hJkkDFXjc98CDwJzmtF/7luysQoEtTBdE3hGtjlfSqzSeE+Q6mFtWQ==
From: luca.ceresoli@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: "Markus Volk" <f_l_k@t-online.de>,
	"Stefan Herbrechtsmeier" <stefan.herbrechtsmeier-oss@weidmueller.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v2] llvm: add PACKAGECONFIG[optviewer]
Date: Thu, 23 Jun 2022 09:44:29 +0200
Message-Id: <20220623074429.259889-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jun 2022 07:44:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167262

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

Currently the CMake configuration for llvm finds the python pygments and
pyyaml if they are installed on the host. This makes builds
non-reproducible across different machines, some having those modules
installed and some others not.

This has been causing a 'reproducible' failure on one of the autobuilders:

  AssertionError: The following deb packages are missing or different and not in exclusion list: /home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/deploy/deb/./core2-64/llvm-dev_14.0.4-r0_amd64.deb
  The following ipk packages are missing or different and not in exclusion list: /home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/llvm-dev_14.0.4-r0_core2-64.ipk
  The following rpm packages are missing or different and not in exclusion list: /home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/deploy/rpm/./core2_64/llvm-dev-14.0.4-r0.core2_64.rpm

Fix by adding an explicit PACKAGECONFIG to control the
LLVM_HAVE_OPT_VIEWER_MODULES option in CMake. If unset, it forces CMake to
ignore pygments and pyyaml, no matter it they are available on the host. If
set, it DEPENDS on the pygments and pyyaml modules so that CMake will find
and use them.

Based on suggestions from Stefan and Markus -- thanks.

Proposed-by: "Stefan Herbrechtsmeier" <stefan.herbrechtsmeier-oss@weidmueller.com>
Proposed-by: "Markus Volk" <f_l_k@t-online.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v2:
 - add the modules as RDEPENDS too (spotted by Markus)
---
 meta/recipes-devtools/llvm/llvm_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 67ed1eab00fe..2ec5c1e1c0a3 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -56,6 +56,10 @@ def get_llvm_arch(bb, d, arch_var):
 def get_llvm_host_arch(bb, d):
     return get_llvm_arch(bb, d, 'HOST_ARCH')
 
+PACKAGECONFIG ??= ""
+# if optviewer OFF, force the modules to be not found or the ones on the host would be found
+PACKAGECONFIG[optviewer] = ",-DPY_PYGMENTS_FOUND=OFF -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=OFF -DPY_YAML_FOUND=OFF,python3-pygments python3-pyyaml,python3-pygments python3-pyyaml"
+
 #
 # Default to build all OE-Core supported target arches (user overridable).
 #
-- 
2.34.1


