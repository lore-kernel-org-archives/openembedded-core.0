Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D8AFC433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 20:47:15 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.409.1655930831264113209
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 13:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=h1beW3Cx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty.fritz.box (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 05DA56000A;
	Wed, 22 Jun 2022 20:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655930829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JMlpGCMUQ9dlabWZYhh8Lqr5+aWug8+EHLiLPmpBrLo=;
	b=h1beW3CxYT4BVoh7qMwfwHWaMOZYhAfzgTtlqSek8dyEvQ5aFoyD3KN6ZJmgs+el0q2gMA
	wOM0OwvsCI0CEu8/hSX/tsynzkhO6msCRlXrlHfekug3PF8EqIHl1xocR8jbfkQqlcDFgK
	V3W60hqw08aKDxnaifJ2D4bihkG+xmrAlSfEysslsVJcu8HhmUUPRtmXwt99HwkVdr0oEc
	ODvC1dPwgsExgHZ2RS9Gyt335OHsUSba4FUaf4lWwJ+AZlkNTIekI+wHn4NSZsdGY1DiBB
	4PaXqzlirxgyY7NTD5L1490vaH2l8KxF2Kn/fqxWKkudDXMS0Okvk/VPtmUDFw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: "Markus Volk" <f_l_k@t-online.de>,
	"Stefan Herbrechtsmeier" <stefan.herbrechtsmeier-oss@weidmueller.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH] llvm: add PACKAGECONFIG[optviewer]
Date: Wed, 22 Jun 2022 22:47:01 +0200
Message-Id: <20220622204701.254358-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 20:47:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167257

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
 meta/recipes-devtools/llvm/llvm_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 67ed1eab00fe..d06341f06388 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -56,6 +56,10 @@ def get_llvm_arch(bb, d, arch_var):
 def get_llvm_host_arch(bb, d):
     return get_llvm_arch(bb, d, 'HOST_ARCH')
 
+PACKAGECONFIG ??= ""
+# if optviewer OFF, force the modules to be not found or the ones on the host would be found
+PACKAGECONFIG[optviewer] = ",-DPY_PYGMENTS_FOUND=OFF -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=OFF -DPY_YAML_FOUND=OFF,python3-pygments python3-pyyaml"
+
 #
 # Default to build all OE-Core supported target arches (user overridable).
 #
-- 
2.34.1


