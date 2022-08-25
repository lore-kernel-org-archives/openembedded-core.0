Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF787ECAA24
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 18:00:00 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web08.27402.1661450392499634320
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 10:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=F8AyRzNC;
 spf=pass (domain: gherzan.com, ip: 66.111.4.25, mailfrom: andrei@gherzan.com)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id C94255C00C6;
	Thu, 25 Aug 2022 13:59:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 25 Aug 2022 13:59:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1661450391; x=1661536791; bh=sh4OaczTom28ImlIafb90F2r8
	tANWzLbqVEXiBoA64o=; b=F8AyRzNCtHBrlj/9zWPu3vJDPA4dTSqvGKgws5X3E
	MnJCCweVl3PD914GtqWcJEyMz0dnZypgkJwx4imeLkfzCuI3c78DsTkz3XTP2PKB
	fQ9VN1cM2Da3ujqOzEygadyJqot9V/IffisrC5904+KpZV4lPQ/7uP4IAVj0FGVj
	9192UT0kBTMd7vxMqpan6PAS1go+SxljBdRJj28qN77GcDInUPdLBg2OaoKPEsyN
	V0smlAyUv29EHX17ZeNLCVdlZm/J7lMWc329O1K+fRAg3FED2Ogi7hrxFJ1jlwMi
	2C4/YkW8PKlpPQlWfbqKHGSSPqx4rGprWr0ye3uHTTRHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1661450391; x=1661536791; bh=sh4OaczTom28ImlIafb90F2r8tANWzLbqVE
	XiBoA64o=; b=0Wb1VJPuEjcZq6Vxos8oc8/E4OZZxkRjZ/0oFePc86aNv5a8kNg
	/elz4CSqflgj2+dsc7M1N5Tl8V/ERq2f5yAFCvqMRFoPhG5Ni7UHlRz2xV3BB+HR
	TASuK4DYlKHEYtkGBow/UNpYc2Vlr6PLvQG0sM0vp45CdZyTBQiA1w8tFAe/8Dsf
	XUXGiHcGvLgtCrvgG05asQ2+pvuIeDzw/k3qc9ix2cGiGwVCjnrM8N9Vqji2ME+Y
	WIe1SVMEizDVqw1+Mcvn2deuNJU4aqxhFEW4KEy0o87Z/k4amOj4IuTE5slfMXpy
	7c9SXbntGD2JOHkGH/rlSyuJT0lrMreVFqw==
X-ME-Sender: <xms:l7gHY_hUwbbjYlXKe18lQ5J-IdPwi3E9WK9GEAyrh0orxvKtBYvNjQ>
    <xme:l7gHY8AZPi8Surdzd_SWw1upNLcISUdEEY0QmHUhciCpciMp2GHa4np0sJ9PUPVUS
    lrNMpnlHoMIAnhJszI>
X-ME-Received: 
 <xmr:l7gHY_HO8xwXPtJM_AOfG15N7wtC0aI5jYknwouqXDCFpBwn3d5b50bt_nr2DZGPEt79htEdWALWTFde36g6XeStHQknAmSjkypP3rcpu7xt5lAOiJKef3-z>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejfedguddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehg
    hhgvrhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieduueeifedvuddvveeuve
    evvdekueefgfekudefueelueekteekkeekjeeileenucffohhmrghinhephihotghtohhp
    rhhojhgvtghtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:l7gHY8QOy2iVUD8BlfgUJNhdquscrRkZ2gDcY4ss2CI__k4I84yUww>
    <xmx:l7gHY8wlrd7UjXaJvATgL8ph64xBBBOvHg794L4YmMt3nYJjccyP-g>
    <xmx:l7gHYy78pKAvr9JKybEquSWd_QjYab5gbt85F6WnD6UJMrwWL5tIZA>
    <xmx:l7gHY5quA5qDICt5IoNIYdvVHMtsqOQVgzDnEJXxwgOp41bq1nwiSA>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 13:59:50 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH] linux-yocto: Fix COMPATIBLE_MACHINE regex match
Date: Thu, 25 Aug 2022 19:59:15 +0200
Message-Id: <20220825175914.1238235-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 18:00:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169883

From: Andrei Gherzan <andrei.gherzan@huawei.com>

With the current regex expression, a machine that is not part of the
compatible could match the regex expression.

For example, consider the following COMPATIBLE_MACHINE:

COMPATIBLE_MACHINE = "qemuarm|qemuarm64"

A machine definition bringing in "qemuarm-foo" would match against the
COMPATIBLE_MACHINE pattern above (see base.bbclass for implementation
details).

Fix this by matching the start and the end of the string.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb       | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.19.bb      | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 5a420b7fb2..b1b57beac3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -50,7 +50,7 @@ PACKAGECONFIG[dt-validation] = ",,python3-dtschema-native"
 # we need the wrappers if validation isn't in the packageconfig
 DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'dt-validation', '', 'python3-dtschema-wrapper-native', d)}"
 
-COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64)"
+COMPATIBLE_MACHINE = "^(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64)$"
 
 KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index f374fb593f..9e37494a4b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -31,7 +31,7 @@ KCONF_BSP_AUDIT_LEVEL = "1"
 
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)"
+COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)$"
 
 KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
index 60ca638bdd..c12bec3e4e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
@@ -31,7 +31,7 @@ KCONF_BSP_AUDIT_LEVEL = "1"
 
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)"
+COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)$"
 
 KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index f1b6f98c77..2de32ffecd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -22,7 +22,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5"
+COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5)$"
 
 # Functionality flags
 KERNEL_FEATURES = ""
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
index c1638f5cc2..339f7f69a6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
@@ -22,7 +22,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
 
-COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5"
+COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5)$"
 
 # Functionality flags
 KERNEL_FEATURES = ""
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 26cdfb744a..40c430aee3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -51,7 +51,7 @@ KCONF_BSP_AUDIT_LEVEL = "1"
 
 KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
 
-COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32"
+COMPATIBLE_MACHINE = "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32)$"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
index 15c5aca8da..0ff28aa952 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -51,7 +51,7 @@ KCONF_BSP_AUDIT_LEVEL = "1"
 
 KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
 
-COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32"
+COMPATIBLE_MACHINE = "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32)$"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-- 
2.25.1


