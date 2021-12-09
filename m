Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C5DC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 15:39:00 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web12.12866.1639064339242045017
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 07:38:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm3 header.b=hbQYrgby;
 spf=pass (domain: gherzan.com, ip: 66.111.4.29, mailfrom: andrei@gherzan.com)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 8BA9D5C01BE;
	Thu,  9 Dec 2021 10:38:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 09 Dec 2021 10:38:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm3; bh=/insfdJzFInnFhU4WlYRadS3ww
	8VOA0MkTKefvNynPU=; b=hbQYrgbyoYLSJ1zgPqj17A77al8Vb8P9TK+GTWnHkm
	VRyY3ow4f96T3jgF61Zt8WlV/iW8kyFOvoiK3D/+Nn8hOYxo8h7IS36EZW8808Br
	+Ab3XhxIDNKkccnVqLzYqLpmLHiv6VYst+7of6ZOjngWxA7s6nlE8+eW3YTkGtVj
	O8RsvF9/TFx+DrZhwyai8pIp1wDBI7i1sXIi6YYhmLGLTbR4PZkr+/LIWxyKN/44
	GlMAz/vrCi0KjGmtdRTe09DvlvzDqf9d/PVuOfnccIS8MEu/Ae1G/0Zjvw2zhHMe
	WbQp4XP46jM228cnA53kl3hzJzjn1bm8+qqpxO9lsVqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=/insfdJzFInnFhU4W
	lYRadS3ww8VOA0MkTKefvNynPU=; b=WOJ76r+CkZcv+GVCykdH10w0K1TRZIEjf
	yoznh8iG/4jGmF47gK8mufMuX6GpzGPkC1u2QbWpoL3fouILhbQuotBuwYVVrQv+
	0h3OHYoj7VgvJqcjPMnGfWeKMwy40/Hl3FoM+9RoysyYMVHR8Md/sRXcUqKuhPrK
	ZsyadYeXMCj5uQJXGVQ1Cl6eTGyPWIxfyGEl8Iq9JygBLGxr9+44X1Y6wS9ZWa0U
	bqGEToNz6BquiE5+L59jtagHJshMjvCWuHQB8kanIWzJ+x8NEFN2w1SFq9h3278H
	CbnPTRtfU3Lw0tYMZRFtVLUmOzCIs59mcgIbRskytcDN30Rabpbpw==
X-ME-Sender: <xms:ESOyYUTEK72bsEObnHfWdYhCY_W_r3NpTA7ZWXO1sYDf1QUUlAFZuA>
    <xme:ESOyYRzFnQwlNZu8uMldrG6vI8LdfcA7ZWU_PYR6_0GHAJVQWmGe1FkEXqomXQFAz
    9lil7PozoDOuW4vY4E>
X-ME-Received: 
 <xmr:ESOyYR1tdBMfbXHtE5E_Ov7-9CyZ4yTyfzqzXV76_p2h5jYy2YWktaTM0EJK4xg25dEuj5QGVML3iUCvv7h5V1Gy1KZ_eGGtRe_EewPIa76WDClVoAuw4rbP>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvuddrkedtgdekudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhhvghr
    iigrnhdrtghomheqnecuggftrfgrthhtvghrnhepvdetuedtuedthfevgffgieefheevte
    fhueffkeegieeigfekhfehheejieejjedunecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:ESOyYYDvOeT8bakS8QU6AKuNnwMU6Wcmt4rH3Wg6q7saKqQfgg4_9w>
    <xmx:ESOyYdi9G0BX930OAmInpNpPAY6KUZB12Pjs71WvdiS9unBPyLnnMw>
    <xmx:ESOyYUqBZgzaywG2gA-68gcQHiMZlc2jKEsoSWGbNAmjVI4tPKnVhA>
    <xmx:EiOyYdZqD6BeJN-5_RQOr8lctEH0N-qKPD2huPY7EPMKj0wxu5Ny1w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Dec 2021 10:38:56 -0500 (EST)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH] mesa: Avoid PACKAGECONFIG warning for broadcom entry
Date: Thu,  9 Dec 2021 16:38:39 +0100
Message-Id: <20211209153839.2322513-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 15:39:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159456

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index c894c2dab5..8db91a7b2e 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -128,6 +128,7 @@ PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
 PACKAGECONFIG[broadcom] = ""
 PACKAGECONFIG[etnaviv] = ""
 PACKAGECONFIG[freedreno] = ""
+PACKAGECONFIG[broadcom] = ""
 PACKAGECONFIG[kmsro] = ""
 PACKAGECONFIG[vc4] = ""
 PACKAGECONFIG[v3d] = ""
-- 
2.25.1


