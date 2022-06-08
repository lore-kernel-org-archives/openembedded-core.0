Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1000C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 05:54:16 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web09.3319.1654667647424911525
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 22:54:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm2
 header.b=cpo/RsJr;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.25,
 mailfrom: pavel@zhukoff.net)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 1946E3200B14;
	Wed,  8 Jun 2022 01:54:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 08 Jun 2022 01:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1654667643; x=1654754043; bh=sFCNUjWuuwC3wpdhF5vfqZKpy
	GZT+VI/7dri3PFSQZ0=; b=cpo/RsJrZLsT30l5t6QGA2WojFY4vP0x6hELHaD9u
	YVHj2l/De4YXrdShcfBYRlwyKQ3nIC8W8zHZ8vDdyPfLroH8KQG+7svZ1WT1vUDW
	xE6gZtT7xj3sFQow9ve67yTzaqUKpvo6FTs6FrxUUftyGVWOTnCWnxvdxnDjmnt4
	MG4HLOw+52KJ+XCtSpbHhwq8Zj8LIetwJ4zQVDvmXVIwuwjg0tnyYRz5PTtXEZ8G
	sDyYpdqc1Pr21GS+IWxNUQR+KHdAWCKmSLfdVZyl4JHOEX7OaiJk25He55WZQx2S
	OSpljyrepx+47C880r31a0swYI5ySeWJtP5TkJsLa9iwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1654667643; x=1654754043; bh=sFCNUjWuuwC3wpdhF5vfqZKpyGZT+VI/7dr
	i3PFSQZ0=; b=vYzr6NNDsY/Lk91syfI+Q2dhn1qD4qAJ8VnN3TAZU0ypGY53z0f
	qFs4/Mkz84/hMEImRpdo/6xXf3R9ohEgQYXycWzuGnLZGiGsOkFHHo2ldkMfKCUc
	lO7sioRHHB8uVydGbdPxOZHgnbD6+uK8ELR6VaMcFZpqe9CiFvi+PzchLBQAddO3
	zhjCmMC2ZYeib8BZCwtQe7/+YUnJ2RkHTxfDgpgcX/vlZ3VxbDORuYhdV+gY0+ij
	azF6M2c5UlNXSmMdtjJP4HJgLRdtD6ULr8T7XH7BQYKSm3l6VqgmUt8SznTHhPfs
	hQfgvSMWOAmsZTilsyAQUo4UwwRJzIZRNDA==
X-ME-Sender: <xms:ezmgYuMzdtSzRBgsON-TNavKzI5DCNCcrTxG0hr2DDK__gV2dvlpBA>
    <xme:ezmgYs8lLKCLgm2ufHPV0xsxsdSVZ8Nmnma4lZgd-WDn8t-oYhLGr_nMvrmleOyH9
    sU9mnxkU8cAqGgug34>
X-ME-Received: 
 <xmr:ezmgYlRr-DCUMJrU09tJuVyYiUz4sAU10dJhTk2JilgBo2ngEsXa08LZ27C0M8zO7iraOi59qCvMpsPT1DFQMnY>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedruddtiedguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrrghvvghl
    ucgkhhhukhhovhcuoehprghvvghlseiihhhukhhofhhfrdhnvghtqeenucggtffrrghtth
    gvrhhnpeevfeejkeejudegledtkeejhfettdefjeeuffehieekvddugfdtffffledvvdef
    hfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprg
    hvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:ezmgYuuWhhj9coyhcslTrX18MXI87RGwDbMCLiCxZ5J1t4kbzxeWOg>
    <xmx:ezmgYmcozYPyTcps-GoEuOsWZApsCH0071zihepRW9H0UUbVPuq_dA>
    <xmx:ezmgYi1agYLFBJbdK4V6VF4Ak978_FyOqa5euNNZBgOwAmRZ0ibaxA>
    <xmx:ezmgYl46I-ndnsw7ZzHAubpZCSPqd5_9iYb7B0OH_KppKrxIDpknWQ>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Jun 2022 01:54:02 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>,
	Pavel Zhukov <pavel@zhukoff.net>,
	Pavel Zhukov <pavel.zhukov@huawei.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] bitbake.conf: Make TCLIBC and TCMODE lazy assigned
Date: Wed,  8 Jun 2022 07:53:46 +0200
Message-Id: <20220608055346.6526-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 05:54:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166691

This allows two level of overriding (distro level and local.conf/shell
variable). Previous settings blocked shell variables overring
if it was overriden on distro level.

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit de6c3f9cb2c589aecbf8d9d25fa83cd18bf80891)
Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 0e939aca4f..2a3cf6f8aa 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -386,8 +386,8 @@ FILESYSTEM_PERMS_TABLES ?= "${@'files/fs-perms.txt' if oe.types.boolean(d.getVar
 # General work and output directories for the build system.
 ##################################################################
 
-TCMODE ?= "default"
-TCLIBC ?= "glibc"
+TCMODE ??= "default"
+TCLIBC ??= "glibc"
 TMPDIR ?= "${TOPDIR}/tmp"
 
 CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(d.getVar('MACHINE'))][bool(d.getVar('MACHINE'))]}${@['', '/' + str(d.getVar('SDKMACHINE'))][bool(d.getVar('SDKMACHINE'))]}"
-- 
2.35.1


