Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D375DC61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 21:35:14 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web10.66.1677101705206658262
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 13:35:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm1 header.b=NeQ8FBIJ;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.27, mailfrom: pavel@zhukoff.net)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 7D54F5C016A;
	Wed, 22 Feb 2023 16:35:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 22 Feb 2023 16:35:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1677101704; x=1677188104; bh=1Wj2IOZrrJmnB9e4mCd1E8gt8
	HcpILRWLxS5V/gKW3A=; b=NeQ8FBIJkYBM+UmkJ6IhRPF4Q/F3dpn/ZEAxWkL6j
	t69yJlVFZU079scWpw7AO8qyF6bZZ+HUkLRzJYL6Q07KVr0I7o7f60mtLWf6B2eO
	T1GkTTEcT7jvEE1uhpnJ93keEHM8udN8z6SP6sDl75SDyM/REwxytD31gNnhTyty
	ueBMYcJjTC41QdjwkLqHcqWuQCBl5Z8WxCmYtPBcgX0q9iXrWakC5b+hzIIVdnU3
	6rhA1zuXI4dxTDABITqJcE1Hq5IzxTlmV6IMb7uYzxvTdQE8oxcVkK+SHFkrG4Va
	gb+0X5ERgXuoT4/VDNRk3DD9PtKLZKV8iO4vGRK3mgRHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1677101704; x=1677188104; bh=1Wj2IOZrrJmnB9e4mCd1E8gt8HcpILRWLxS
	5V/gKW3A=; b=K9JYJMmI3RLsxuRMMy1Y08htl94kv4dtJIfWCEpDLR3ZdBrkHbU
	Uqqc4gwSxbCzmwkYc5pgmehsTAlNPfvAVjWlDU28THlRHewN4RAevGK+X+HhwP9X
	GbW8GKxQ9ITVwmqCdhWUmsPVXgOxqt4idXetLOtIwICmjwGZjPeq+ZMQ9bBV1sF/
	bio4DKDiZ74vIGVeddiDyoMMEbAzluQv44YYDJ2uSCffXPmX0XLy5awJdnpJAE45
	x3ghAUeYB1NiwlKLSLfJ+15vNwZG+mUD+llKbpl254mmoZozLKZF+KVE6j//Wjgl
	vK0HGS2tcWmeufPER8VsPAYUBukveV4DT8Q==
X-ME-Sender: <xms:iIr2Y-ylMdxOZwlhZw36rVt-jJ5lwzvOff5tJfzfivFDisoPa-KwWA>
    <xme:iIr2Y6TJu0HBCnjRMdApIwLaOn_eBK0KdmZbudINM7uoC4aSCovJaKdX3ARrRlChz
    YGCOmbXF2Cv2sj9cGs>
X-ME-Received: <xmr:iIr2YwWLrsYvgeALdkTqnIysqpMjROZnJXMux-RU6SKDXEA3HVUrikr7uwlwQxatv95BiGZJNYg7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejledgudegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomheprfgrvhgvlhcukghhuhhkohhvuceophgrvhgvlhesiihhuhhk
    ohhffhdrnhgvtheqnecuggftrfgrthhtvghrnhepveefjeekjedugeeltdekjefhtedtfe
    ejueffheeikedvudfgtdffffelvddvfefhnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepphgrvhgvlhesiihhuhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:iIr2Y0gbtywb_IGTAZJzfw463MTsYq8tunSfyM-IQpaJh76VIVW6Ng>
    <xmx:iIr2YwASHV8AbldDlm5fbB8ruSc2a5GLKWdRe-WtOzASpvJEyOWCuA>
    <xmx:iIr2Y1JGc7b9Ayqt4Jc1AAp26KTpftHI8Zg-jbM1yAf1mOtaeRMkfg>
    <xmx:iIr2Y7oj3l_hUmtAZhYDxxCZIrX4AFY98srbEI8LwMO_H9CxFkbG-g>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Feb 2023 16:35:03 -0500 (EST)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH] u-boot: Map arm64 into map for u-boot dts installation
Date: Wed, 22 Feb 2023 22:33:41 +0100
Message-Id: <20230222213340.2388-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 21:35:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177587

While arm64 is a valid UBOOT_ARCH (according to mkimage -A) u-boot
keeps arm64 specific dts under 'arch/arm' directory.
As the result the recipe tries to install arch/arm64 (if UBOOT_DTB
was specified) and fails with [1]. Remapping "arm64" to "arm" to fix this
issue.

[1]
| install: cannot stat '.../u-boot/1_2023.01-r0/build/arch/arm64/dts/u-boot.dtb': No such file or directory

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 4636dd733b..b3482dcef3 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -32,7 +32,7 @@ do_savedefconfig() {
 }
 do_savedefconfig[nostamp] = "1"
 addtask savedefconfig after do_configure
-
+UBOOT_ARCH_DIR = "${@'arm' if d.getVar('UBOOT_ARCH').startswith('arm') else d.getVar('UBOOT_ARCH')}"
 do_compile () {
     if [ "${@bb.utils.filter('DISTRO_FEATURES', 'ld-is-gold', d)}" ]; then
         sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' ${S}/config.mk
@@ -334,7 +334,7 @@ do_deploy () {
 
     if [ -n "${UBOOT_DTB}" ]
     then
-        install -m 644 ${B}/arch/${UBOOT_ARCH}/dts/${UBOOT_DTB_BINARY} ${DEPLOYDIR}/
+        install -m 644 ${B}/arch/${UBOOT_ARCH_DIR}/dts/${UBOOT_DTB_BINARY} ${DEPLOYDIR}/
     fi
 }
 
-- 
2.39.1


