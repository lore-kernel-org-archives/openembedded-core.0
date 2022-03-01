Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C640C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 11:42:40 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web09.7221.1646134959159770356
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 03:42:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=P81tPq0I;
 spf=pass (domain: gherzan.com, ip: 66.111.4.29, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 7C43B5C014F;
	Tue,  1 Mar 2022 06:42:38 -0500 (EST)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Tue, 01 Mar 2022 06:42:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; bh=7fKzNBwSJ5eg548v1YqZ2jQH7RO1bcgOnQZEOH
	Z54mU=; b=P81tPq0IWMfdTg6dHSObIzfMSFbXJxP0ZMpeZ7nUiFlRk50gh8jCPp
	3Ds5QqKMzfMukyTBLKRxww9dk8ZdeBQqftAsgeMqHP5WFDk8b+lpXP+i9ipiiHCt
	tcxgWl9DDGOqioGhV6eadmX3oKr8VahkAfBreiRq59XBynfn27IUXtG/HQTmyvFO
	Ce5KLmT46gnJ+waUXVPcep9xyzf+v6wt/scO+UYbwvzuB0I5jSkkylmld2AwAfpN
	jIJoI13slj8Ly/RaXy5oyXyAnIcOGo7zwOXLw0XfeEYKtnFMX/DNd5eBpIfT/PCg
	TigD/ypveuQQNAeLJlRczbEcFtqNQKLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=7fKzNBwSJ5eg548v1
	YqZ2jQH7RO1bcgOnQZEOHZ54mU=; b=P3AKCjO2q6iwdLrIRJPFP8NtQ6UA7uk7G
	2VeXnodZHLcvYDUxSwXR3QIlRDoVf8SWicBibbyTF5CJJqjrp581epM3AV/l3R5S
	F+cyBxuDZ8m0fvztZuxNuuee6/6aTR2VGLR8/HHJ+Ca47QGLpX63V9UpTj9dZrus
	2mQSS5vb29Wmj4xk2NuijPwhflkKTcmsqKleHYLeYhMTfQtR5SMN2/pgqZr9xlq/
	6TqOdQaCWF3O5ADt6Iw3uv3jqaML0u3rU67rmLwSe9efRlhhyn4Ok+EPty+NmOHN
	Qa+seDY0A6v1Jf1HLlVQbMeMmQ66e/cxAQHRl9tyKPxWNFV39STLw==
X-ME-Sender: <xms:rgYeYu8X5Jc9ZYyh2VJyJypTfbLA4-WMPfBvdfIGLo4aUlyYe-J4PA>
    <xme:rgYeYusG6TNnKQdufvx3bpLOv5fozxr09Cli8_mGHyknCCq9ylFBDoWDGzWGEni4v
    IOi4Jn26DqtcQJwCqU>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddtvddgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvihcuifhhvghriigrnhdfuceorghnughrvghisehghhgvrhiirghnrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpefhtdelfeeiieettddukeelfeevjefggeeuffegffejueelveet
    iedvjeevheduheenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhgoh
    hlrghnghdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:rgYeYkBsc5gFU3Tvkt_xsu7AgB6rJscL5LXIsTdroWgj_F1R8mxpBA>
    <xmx:rgYeYmcDSiy3SOLcfXMW7quvPp2OmL__x9rY-Za6TM-lSfYY-v8NoQ>
    <xmx:rgYeYjPByQuahnNVs7hXVW_CbdHWnuNNhFwn0m_mwRofb-ihbJetPA>
    <xmx:rgYeYlXRqeQctsjscS-wIc1ux26OTBPDQrfjYdVHK3KuX7bzzQ0kuA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5007E3C00CF; Tue,  1 Mar 2022 06:42:38 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4778-g14fba9972e-fm-20220217.001-g14fba997
Mime-Version: 1.0
Message-Id: <85ec6efd-44f0-4f9c-8844-b65ec255b2d1@www.fastmail.com>
In-Reply-To: 
 <CADkTA4MEqxJc7=RNEKS4emNKOy_7ytPs4rF6F5E=EPCCMTLQSQ@mail.gmail.com>
References: <20220228235433.3948994-1-andrei@gherzan.com>
 <16D81CEE77B62019.3953@lists.openembedded.org>
 <CADkTA4MEqxJc7=RNEKS4emNKOy_7ytPs4rF6F5E=EPCCMTLQSQ@mail.gmail.com>
Date: Tue, 01 Mar 2022 11:42:18 +0000
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>,
 zygmunt.krynicki@huawei.com
Subject: Re: [OE-core] [PATCH 1/1] go.bbclass: Allow network in do_compile
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 11:42:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162542

On Tue, 1 Mar 2022, at 01:55, Bruce Ashfield wrote:
> On Mon, Feb 28, 2022 at 8:17 PM Bruce Ashfield via
> lists.openembedded.org
> <bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
>>
>> On Mon, Feb 28, 2022 at 6:54 PM Andrei Gherzan <andrei@gherzan.com> wrote:
>> >
>> > From: Andrei Gherzan <andrei.gherzan@huawei.com>
>> >
>> > Compile pulls in the go.mod list requiring network. Without this, do
>> > compile would fail with a similar error to the following:
>> >
>> > dial tcp: lookup proxy.golang.org: Temporary failure in name resolution
>>
>> This is something that needs to be carried in your own layers, IMHO it
>> isn't appropriate for core.
>>
>> It isn't about the fetching, it is the entire gap in functionality
>> that we are missing if go starts fetching dependencies during compile.
>
> A further thought is that if this is for go.mod issues, there is the
> go-mod.bbclass.
>
> Perhaps enabling it in that class and doing a bbwarn about go fetching
> dependencies would be appropriate ?
>
> Otherwise, someone may not know that this is happening and that a no
> network configuration has no chance of working.
>

I reckon that is reasonable. I'll personally go down the recipe level to workaround this change but understanding and agreeing with the reasoning behind this change, I want to invest a bit into trying to find a proper solution in the core. Bruce, I know you invested a fair amount of time into this already. Would you be willing to sync up and see how we can work together in tackling this? 

Added Zyga to CC as he is also interested in this as part of his go development activities.

Thanks,
Andrei

