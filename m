Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C6ADC433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 15:44:04 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web12.12939.1639064643221323045
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 07:44:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm3 header.b=W3WkXLFA;
 spf=pass (domain: gherzan.com, ip: 66.111.4.29, mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 7C2B75C015B;
	Thu,  9 Dec 2021 10:44:02 -0500 (EST)
Received: from imap41 ([10.202.2.91])
  by compute4.internal (MEProxy); Thu, 09 Dec 2021 10:44:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	mime-version:message-id:in-reply-to:references:date:from:to:cc
	:subject:content-type; s=fm3; bh=poldSLwPvUlAB97hgafAZFQsWu5TAaI
	oZsUHtAJpc0s=; b=W3WkXLFAMK+E6wB5j99w4ToD39/BRl/GkLDhoiMsaCti057
	byetL2c85W+JTdkbkXn3FF4/nTIjpc2bXqNoG6f07vdgHZqWUAagRPwRc6Ilchda
	UwT5a1Lcs+rwBn/nIB3IaLolIo0eQjkNmt1ORPRS+34VZiQrPKQc3nsRth46tSaF
	A8LKMSb+urlI+EfS4oXVUEobJnWc8bkCBxEbeaCr5IeUpUtSNiJxXhG9DukrjXVu
	ve9EZDus5tSVKKnnARRR5gGPtomOp2r/NYZPNdHFlqjxBSQIzfoWKXlFJrGydqsM
	g/11/1FOhn+yDITxAvB9/tvx+rrxYUqWne4KbUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=poldSL
	wPvUlAB97hgafAZFQsWu5TAaIoZsUHtAJpc0s=; b=MjXquJXYhlHeBgevP+N/zN
	iNGAdPOu86OMtoBPM9KxXYcPVayvTUk6KhZXImtivN2wOt1hMZpGk6Q/YjUSu9ro
	OT9OPm2f6v3JEj9ayVjFjJSHvbeXJRxaH8WyfAC3AK2zcBrmgijvHxX4gFsLMMGf
	wrkhKgUzvWTXkqRAl3C57Sme7TFW48ri+iPduBl8Qk4YqRmB/HyNprIdb+SxBAFr
	BtQ/aIbkDAVljmvyjDwITzowf2uY7NvxhRX5Pr/BhzyWtLBXJvxivayMc59z+AdU
	HEHTGJhNi5yf++7ACQCfeeGHUUlaknAsg+u6CmOtuqxsYvzgQ+cHq9ug4Yl9JtMg
	==
X-ME-Sender: <xms:QiSyYdsrEfsEcq68OeXCc0brdIwOpKANELZNNc3g6LL1ek_c1p6f3w>
    <xme:QiSyYWeKkPPw2hzQFFTG-CUuP9tr-9DGWKZvJEO4eqsXoHyZIjdvvUaANbNCJe9wT
    GLivlUcxM5zjGXHWc0>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvuddrkedtgdekvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqnecugg
    ftrfgrthhtvghrnhepgfehgeettdfgtdeifeehkeekffeftddvgfegtddvfeefleegvdeg
    ueefuedtvdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:QiSyYQzQN3GzrR8DeACP0ehXHoEct1G_GameFcZ5At69qrHs5xOTnw>
    <xmx:QiSyYUPJodE-JC6PkBZE7aX8oF_2aHnMuBb_FIo4jLW1WQIvqo1-pA>
    <xmx:QiSyYd-nvHzyxYRlOmWiOKt6Ekg9Q6brQZbYRpI_Z1KdvNrmbvgiaw>
    <xmx:QiSyYaFicvBIpNj4MIklnVaaEIdsaFN-rsMQ5b3illfKTMmSYSib_A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 16F1D3C0246; Thu,  9 Dec 2021 10:44:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4506-g4374de3f18-fm-20211208.001-g4374de3f
Mime-Version: 1.0
Message-Id: <c22a0493-5778-42ef-9819-c3887a83e2b7@www.fastmail.com>
In-Reply-To: 
 <AM9PR09MB464283999240AEEFBE8453ADA8709@AM9PR09MB4642.eurprd09.prod.outlook.com>
References: <20211209153839.2322513-1-andrei@gherzan.com>
 <AM9PR09MB464283999240AEEFBE8453ADA8709@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 09 Dec 2021 15:43:41 +0000
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Konrad Weihmann" <kweihmann@outlook.com>,
 openembedded <openembedded-core@lists.openembedded.org>
Cc: "Andrei Gherzan" <andrei.gherzan@huawei.com>
Subject: Re: [OE-core] [PATCH] mesa: Avoid PACKAGECONFIG warning for broadcom
 entry
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 15:44:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159459

Hi,

On Thu, 9 Dec 2021, at 15:41, Konrad Weihmann wrote:
> On 09.12.21 16:38, Andrei Gherzan wrote:
>> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>> 
>> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
>> ---
>>   meta/recipes-graphics/mesa/mesa.inc | 1 +
>>   1 file changed, 1 insertion(+)
>> 
>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
>> index c894c2dab5..8db91a7b2e 100644
>> --- a/meta/recipes-graphics/mesa/mesa.inc
>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>> @@ -128,6 +128,7 @@ PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
>>   PACKAGECONFIG[broadcom] = ""
>
> Isn't that the very same as this one ^^^?

It is indeed. Khem was faster and I haven't seen his patch. Can be ignored.

It was fixes as part of

commit 6add96e4af46eaabb6c70e3ce3a27a4b198d7cb6
Author: Khem Raj <raj.khem@gmail.com>
Date:   Tue Dec 7 12:16:43 2021 -0800
    mesa: Define broadcom packageconfig knob

--
Andrei

