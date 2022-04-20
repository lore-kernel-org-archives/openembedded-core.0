Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35ECEC63715
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web11.9411.1650469214765092252
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 08:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=bW/KX+KK;
 spf=pass (domain: gherzan.com, ip: 66.111.4.25, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id EE89D5C01D7;
	Wed, 20 Apr 2022 11:40:13 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Wed, 20 Apr 2022 11:40:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1650469213; x=1650555613; bh=Utu0HhTxTt
	yJLEb4G2GLrAZhv/KObU/ODb0OlEdwMqY=; b=bW/KX+KKcASLeMgR2Y81laHtvd
	RR+99pBGAOyYKsXxDUQ4PBWGjSDiNPLw/7GHb9pjZyEgNu3YQtCpAyPC6gcipVLH
	Vyqtfdvh0abejYNZOUh/3FwgVonKrG+BbzGgKqEIQG9ZgB5Shk0O/cBum97Md0uw
	Oz8PSzQnfYnJHKrAyavtNMG7HsDVmBRjp64YL6IyREf/ddniy3MHBLdFdRauyrb6
	NHzY4ffS19qfesxt1qafQTYXPbhSv/nOr1Q8veZmeDUnZvqChOa9SLvFLk4ru6GJ
	JjL+Di2cxcrGejqUucaYEQaV8BiCIqhldEDQwHtz/SFnJDQrDodHVbiM9RJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650469213; x=
	1650555613; bh=Utu0HhTxTtyJLEb4G2GLrAZhv/KObU/ODb0OlEdwMqY=; b=B
	zi9dxMb8XzMEblKiHzw/QvmYcO+iGAyn5IXtYiRfHKTgJghZroyRp1ieijiEJnAk
	HMrGOgTt8UIblv+YUbxqGqHaJIZXFAWpAlojekeYarbwLwWKmAMNWvYjmLyWMiRW
	Nm3KHvLSWW/Q2+Fguu+9cTL+WIQiJmnt9fUeS1HcjSNXF4q23EPhxgj6SrSt5Bxt
	UEM8GeNQQ4dMKIAqGIqCc07jzX1fxqgUxRw6T11xOCiDEUnk/l/8Rl7F2jh8kfwT
	L1PfPz9uTG+NrGd11ZV14wUP/3BjeL2X8urtjswulS/TsqluR51hnWduf8KKq/zW
	icPRsOVmI+OywkcyMx2lw==
X-ME-Sender: <xms:XSlgYu0Env9pHp9G4bmtrC6KmemN-aoNQrph_14jAlBfWelH32LASA>
    <xme:XSlgYhEjJyc9FUum4U0czpdzQZJVtCvdB-qZcb5VmHCGCqQFmpr2RU4awxHhb-_Ve
    NSmDTvpJvWmRdTLoKQ>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrtddtgdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvihcuifhhvghriigrnhdfuceorghnughrvghisehghhgvrhiirghnrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeelhfeljeetuedvuefhjeffiefgudeilefgudeuffeutefhgeeg
    tedvveffffeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:XSlgYm6MN97ovV-qgG--qXCSSlqCEKlbtJh01Pnj64aB5mx5e20GrQ>
    <xmx:XSlgYv0KHaS7EdDoTKN0OhjXaAcWaD_17UM1csjX0o3-bIkoAOtbqA>
    <xmx:XSlgYhHAvLsF3cDewGlyXmgvkBODwPMTsyuRt_mx0vgm9Adephm3_g>
    <xmx:XSlgYkOJlOsZHBwSP5OgjuNI9Im6nYVUtwFuAYJKeppv3yfaUbx9Sw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8E4823C081A; Wed, 20 Apr 2022 11:40:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-568-g521196dd5d-fm-20220414.001-g521196dd
Mime-Version: 1.0
Message-Id: <916d6075-766b-40be-a59a-2f869cf99f1e@www.fastmail.com>
In-Reply-To: 
 <CAMKF1so-iefcUsTqSjLSGjo8oEPr3brLfy=Jm+e2Uj4zC7cjnA@mail.gmail.com>
References: <20220420151725.468761-1-andrei@gherzan.com>
 <CAMKF1so-iefcUsTqSjLSGjo8oEPr3brLfy=Jm+e2Uj4zC7cjnA@mail.gmail.com>
Date: Wed, 20 Apr 2022 16:39:53 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>,
 "Andrei Gherzan" <andrei.gherzan@huawei.com>
Subject: Re: [OE-core] [PATCH 1/1] automake: Drop redundant 'u' flag in
 ARFLAGS
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164706

On Wed, 20 Apr 2022, at 16:36, Khem Raj wrote:
> On Wed, Apr 20, 2022 at 8:17 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>>
>> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>>
>> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
>> ---
>>  .../automake/0001-Drop-ar-u-argument.patch    | 32 +++++++++++++++++++
>>  .../automake/automake_1.16.5.bb               |  1 +
>>  2 files changed, 33 insertions(+)
>>  create mode 100644 meta/recipes-devtools/automake/automake/0001-Drop-ar-u-argument.patch
>>
>> diff --git a/meta/recipes-devtools/automake/automake/0001-Drop-ar-u-argument.patch b/meta/recipes-devtools/automake/automake/0001-Drop-ar-u-argument.patch
>> new file mode 100644
>> index 0000000000..260c51f517
>> --- /dev/null
>> +++ b/meta/recipes-devtools/automake/automake/0001-Drop-ar-u-argument.patch
>> @@ -0,0 +1,32 @@
>> +From bed646918bc67e9e2151ccbda03aae34717821fe Mon Sep 17 00:00:00 2001
>> +From: Andrei Gherzan <andrei.gherzan@huawei.com>
>> +Date: Wed, 20 Apr 2022 14:57:14 +0200
>> +Subject: [PATCH] Drop ar 'u' argument
>> +
>> +binutils/ar is configured in deterministic mode by default making the
>> +'u' argument irrelevant while leading to warning massages similar to:
>> +
>> +| ar: `u' modifier ignored since `D' is the default (see `U')
>> +
>
> this is perhaps due to the way we build binutils and I am fine with
> removing -u here but
> I think the patch is OE specific. While you are here can you add -D
> explicitly, because we
> do have option to use llvm ar and it would help those distributions to
> create reproducible archives too.

Agreed. I'll send v2.

Andrei

