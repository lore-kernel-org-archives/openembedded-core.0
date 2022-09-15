Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F642ECAAD3
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 12:51:12 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web08.9667.1663246266153160556
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 05:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm3
 header.b=vOv+c/cS;
 spf=pass (domain: gherzan.com, ip: 64.147.123.21,
 mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 2633C32000F9;
	Thu, 15 Sep 2022 08:51:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 15 Sep 2022 08:51:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1663246264; x=1663332664; bh=fBYfR57yxCkFfRiv1+CdPhxLC
	DyLVbw34+JDNk48U3k=; b=vOv+c/cSJHKGmJtU8hYsBIJ0lOQJewpbyBsowTHng
	kZHMP2/CaIzgnm7yZwqcAKJaXysEDiZdjFjMct1Mn9WlUuVJO7Ne3dAKFAVKdzu6
	4QGelto/iO7/YrgEiD3cN1X/HbzaoY8XWh4FMYCdY/LH02cWsa1eyjdL6CVsxLxO
	pjBEdnzN3lF0k0HhejfDu8BVz659/AZ3u8WlNZ+ydog/3J0285MPxu3wgoTAByGF
	iupa/QLFovduW2v6FNuvcLR3lteq1YmBVSLQA/l9CiYRQo70jsmfdEg25v46RwUf
	pJUMssnE0Yb8A0HVYGGdNtpc/ydDm3rVp9n1DlIFZGTDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1663246264; x=1663332664; bh=fBYfR57yxCkFfRiv1+CdPhxLCDyLVbw34+J
	DNk48U3k=; b=ElwkPV/YwPjFXhABUVZdgEjYUJkfyzKzQjqbxzcQZk6D+O2kPa7
	3m6FCKE2JV1DIVAwQopay5oYaxnaBnjzUfUJ/NexgPdbFPkEvKWK09Jrf5NCQJNi
	1FwD56u8wfh5GqGetgKvz7nqmpj+PFmoJnwvmVVdv2gI/ogjJRA6YHn8qstiGB/3
	wTqgAxvXDAcd4akC96z9eU/HckJDzDWntGKEq8aIJnk4nq53kMqMJ8wfEY/hYBG1
	HmfuGsxHpSh0ck6TO6A3W6Y95vePPYysaOLp9pPMfjlGDQbnDMsPMSlmtteEoZ2V
	QSj+0LzsNP5bDOeyrsyUvMW1xeXB7yTrr/Q==
X-ME-Sender: <xms:uB8jY7zOltfKy90hxJCWWq_FEcgW2-e3K4eGdMDZExhHUTM6sqU42g>
    <xme:uB8jYzQKOS5SDc1tYjlT5lScQ0T0jmwmH5Ah529WCztwBB9WB_DerG2lRioqTJTbJ
    2iouiGmnE9IacRrQ28>
X-ME-Received: 
 <xmr:uB8jY1VoxGQ_Vsz4oPEDVasq1Q823LSu4VIm0NJwhKZg2H8TL0RAatgNoQrgZe_7EI5dQIPGLYdeGVjhI92dmYMZrCxRChPkQ_Y31r5TLeeeQv5Vi7cgIwrx>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrfedukedgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhh
    vghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepieejlefhveevleffveegfeetle
    ejtedvgeejtddthefhhfdtiefhveegffeggeeknecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:uB8jY1g2nIaULgEjvq6f3wIr2Q03HH9MsxVXABT3i07mlW_eUdCMAg>
    <xmx:uB8jY9D3uU68xjGZnzYge7JCAXWiYI3b1uoe3bS8gcMLT3UDR-YCsA>
    <xmx:uB8jY-L_ee5_NfbxUV5VSBfGAUY562ZOx7SqD-_DvyVjkn1iacEm8w>
    <xmx:uB8jY6608v3ZO_gJrIsMBK6ZQ-8uX7v1-ileGmUMnJt0DcYFkWGQ0Q>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Sep 2022 08:51:03 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH] grub: Allow build on armv7ve/a with softfp
Date: Thu, 15 Sep 2022 14:50:45 +0200
Message-Id: <20220915125045.1641790-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 12:51:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170694

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Grub tries to force the compilation in softfp mode for some known target
CPU. That is because it doesn't use floats or doubles and there are
known limitations of using a configuration with hardfp. There are though
target CPUs that grub won't know how to configure failing with something
similar to:

| checking for options to get soft-float... no
| configure: error: could not force soft-float

This change relaxes a bit the COMPATIBLE_HOST restriction to only apply
for hardfp configuration even for arm7ve/a.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 meta/recipes-bsp/grub/grub2.inc | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 47ea561002..6c9952d2d7 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -43,9 +43,18 @@ CVE_CHECK_IGNORE += "CVE-2021-46705"
 
 DEPENDS = "flex-native bison-native gettext-native"
 
-COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|riscv.*)-(linux.*|freebsd.*)'
-COMPATIBLE_HOST:armv7a = 'null'
-COMPATIBLE_HOST:armv7ve = 'null'
+GRUB_COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|riscv.*)-(linux.*|freebsd.*)'
+COMPATIBLE_HOST = "${GRUB_COMPATIBLE_HOST}"
+# Grub doesn't support hard float toolchain and won't be able to forcefully
+# disable it on some of the target CPUs. See 'configure.ac' for
+# supported/unsupported CPUs in hardfp.
+COMPATIBLE_HOST:armv7a = "${@'null' if d.getVar('TUNE_CCARGS_MFLOAT') == 'hardfp' else d.getVar('GRUB_COMPATIBLE_HOST')}"
+COMPATIBLE_HOST:armv7ve = "${@'null' if d.getVar('TUNE_CCARGS_MFLOAT') == 'hardfp' else d.getVar('GRUB_COMPATIBLE_HOST')}"
+
+# Grub doesn't use float or doubles and tries to disable forcefully floating
+# point at configure time. That dynamic flags configuration doesn't always work
+# (for example on arm 32bit) so force the compilation in softfp.
+TUNE_CCARGS_MFLOAT:class-target = "softfp"
 
 # configure.ac has code to set this automagically from the target tuple
 # but the OE freeform one (core2-foo-bar-linux) don't work with that.
-- 
2.25.1


