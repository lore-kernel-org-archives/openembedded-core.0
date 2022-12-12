Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E06C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 22:18:23 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web10.58081.1670883498902831895
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Dec 2022 14:18:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@stwcx.xyz header.s=fm2 header.b=T/DxUB+w;
 spf=pass (domain: stwcx.xyz, ip: 64.147.123.25, mailfrom: patrick@stwcx.xyz)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 2AC2C320092B;
	Mon, 12 Dec 2022 17:18:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 12 Dec 2022 17:18:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1670883497; x=1670969897; bh=TGLjH4uudHiwnzEzpOsC1mI28
	rT0mvPkQguCUSkSOfc=; b=T/DxUB+wETco7FGQEgCpIrRrp/Lizjf0A1Z4BYwS0
	Xipl/mhBWfLqYLAqKthO6or+/WW3YcB0k4lokVPGVdoVQG3sF8zDXd/EiBI1MqQg
	ZN/ExtF97QruQ3fysybQQUsZkVlqZaOnyv3+6U/QD7XixQTAPWBkDTxyCbj7wuDO
	jULmvQsSbX2Ch4nuKw5l69ld+r46J97MHe/1WlUbgM3VJHDOEZceO+QWe01vgyHZ
	eDIBSiHvYwheal5MxadjKnFoa4c/afmBMKAuQlQwCuuwxzFtYtSWUlGjN7uYauYV
	0am1BedXEvEUTOWnKNqqWZ7Ym+QCUdj/vxtK4wwHNoPjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1670883497; x=1670969897; bh=TGLjH4uudHiwnzEzpOsC1mI28rT0mvPkQgu
	CUSkSOfc=; b=jK2Q0DuKx0uN/GquKAEwo58snrQya7vhoiCv/T6K06CtrDQ9F1F
	Wb9JcgCfS18lz4TX28stcvL91vjgdol2kYfYzq/zfc/fjAWoXhuVfTeDWigK1Lpy
	h4UzBGaA5D+vFvFGbPtdyztWbOY7OKn4iQFq6T8npznnnKIodLa3yJWg6v3sFCSy
	wwkgsGZ/npBWrfaT7tgMOECKt+x+gwSpytF8n+jYv4bjeYgU6JMGUCo51aBrOR1M
	P9D/kmd9vWHI2L45f4luvV4SABtN+MApWBRIwm+DekYPgif67r6JT1PhaUJ5ddS4
	/b1Z3fp1OHNFh/YKuRf3HZkddFezv+mQBXA==
X-ME-Sender: <xms:qaiXY7SgI4jCf8UxJn4vr88mhgc5me0e1lcptLM8XjK2wZ2sahmX_A>
    <xme:qaiXY8xAc39CqD387SvJs_Ll2vg_lYXTIO6OCtJZrqdB1_dsrfyiGVbnbaXFHknMv
    E0qchsoCj2GGwIF0NI>
X-ME-Received: <xmr:qaiXYw03umvgoZWceyxWFb-emmUwv8dQxn6EMK5cyvIS6q8QggqRPOMfVz_PUlzOmyNECrWXQ1sqhljX6njFQpO8Ld1i1NsWyms>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekgddufeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpefhvf
    evufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrrghtrhhitghkucghihhllhhi
    rghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpe
    evtdevgfdthfefveejudelheeghefhhfdtteetheehudeiueefhfetkeejleefteenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitg
    hksehsthiftgigrdighiii
X-ME-Proxy: <xmx:qaiXY7CKnnbj8IcDjXLOmj9X1cThn7t2wFBnTfUvEU1ioiaQ0Qvlpg>
    <xmx:qaiXY0jxnqgBQPLmJDL99SDWt66klvLpY8egZPKAj-Sjsnpa63maZg>
    <xmx:qaiXY_oHuvdLj1KaYYk1yMVPK1HGnkKubj2nmdOiLYQcGZY9QobEMQ>
    <xmx:qaiXY8JIYLv0wW8aWIBHjWB1i6GUL3t23aQk7-CstfTZg1SkFA5ILA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Dec 2022 17:18:17 -0500 (EST)
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-core@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH] kernel-fitimage: reduce dependency to the cpio
Date: Mon, 12 Dec 2022 16:18:08 -0600
Message-Id: <20221212221808.753268-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 22:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174504

In order to build a fitimage, we don't need the image to be "complete"
but we need the cpio portion of it built since the cpio is what ends
up inside the FIT.  By reducing the dependency to `do_image_cpio` we
are able to include an image's rootfs as the ramdisk for a FIT and
then bundle that FIT into a larger SPI flash layout.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 7980910aa8..ccc132482e 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -38,7 +38,7 @@ python __anonymous () {
 
         image = d.getVar('INITRAMFS_IMAGE')
         if image:
-            d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
+            d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_cpio')
 
         ubootenv = d.getVar('UBOOT_ENV')
         if ubootenv:
-- 
2.37.4


