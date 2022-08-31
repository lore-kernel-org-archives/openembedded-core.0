Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0AD4ECAAD1
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 16:24:07 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web11.954.1661963036955346140
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 09:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm1
 header.b=UvXO9aKh;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.27, mailfrom: pavel@zhukoff.net)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 1F5CF5C00D7;
	Wed, 31 Aug 2022 12:23:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 31 Aug 2022 12:23:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1661963036; x=1662049436; bh=fZ
	Yeh68dnnLuhAr57D2RcvPXowl0ln3HCYfvZlVvR5w=; b=UvXO9aKhJNlRuaDJZQ
	HnYmpqTAL2tNxB+xxtbHXfa4GXBmtuteZnukhqrXz+SuHKOY5s713ZOkydFRu8Gj
	VNZZ0fmG91IHFWVT8Fw6UCD2k1H2ursVJDgC6YRm2uea+w9orlHLqqSPvp5MAJmf
	QnfoNISHwL7ghEuC8djy3sAB6B9n33LiQW790IWMNFr+ewFRq6xya8HK1OR25ggB
	zScvTMjSpjyBjXLI8CrTvccYtiOSb26T/eweumJaD7AVm9/aOffdCdtSX6xPujgH
	ne2ytsky553RTYRYo/u6xZC3KPh7ESQK3WgT05yuax7xPK+bPAg3Bze4GzWM6Ipt
	q9qA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1661963036; x=1662049436; bh=fZYeh68dnnLuh
	Ar57D2RcvPXowl0ln3HCYfvZlVvR5w=; b=CSs36ReET12j8gXFslSRRXCxT5oMj
	mbnbgZZodImTWxZwOZ2XXCo3okzmDLOHjbpxBU2jhrovX2R76/rp+BsRPNXZJLEA
	0RCW48zlbVUo2pbyofdxTdIMHLBMZ8Zt6kIqXKwgRIvLXxZKQw9uIPD9FBKbWExb
	vKLOMs8A25nES46FuKYrFPtbkjUGhfjc2TPwuC8kI1/ZLXRCPY4o4YlOnZAuD/4X
	v0gCDYKF4alpxhygu9ZKJ9MRHvz2Nv8cKmO9wQtXN5IYhgsK0NbZzD/RjUX382X9
	eIAVtB2cLEQxTwIlUdJjHYNG7c+YGjeKEA6jmFyWuvcQcx+IoEynSHOvw==
X-ME-Sender: <xms:G4sPY1dNyYv9Xgf0yz52Ev7J_5vaRALWoOGccUC9IncNcyuQT3D7ig>
    <xme:G4sPYzM0XGYmAXjq_w8spQ8pKlKudDvtEGB4aYQoHoy0rla0BagVumtFX8rZ7jDye
    klcyzCx-wuMCVqKyOM>
X-ME-Received: 
 <xmr:G4sPY-hjjLzp3_Glw7j7mVns0eZ5wa3GBA4aXRjhMxdeR2BEyDKGxRWQZMrE332w2vlwaYM>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdekiedgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfhgfhffvvefuffhrjgfkgggtsehttdertddtredtnecuhfhrohhmpefrrghv
    vghlucgkhhhukhhovhcuoehprghvvghlseiihhhukhhofhhfrdhnvghtqeenucggtffrrg
    htthgvrhhnpedtgefhleduhedvveeuhfejuedujeevgfevhfeigeelfeduveefieeffffg
    jeduffenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhophgvnhgvmhgsvgguuggvug
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:G4sPY-9lTPgyj_l1-aK34Uc4xB-4DEO4_LVGIXeDKX2KEcmzCHF7Xw>
    <xmx:G4sPYxvls9Jhr8Wk9SCnN7Iq8QV_7Gvga2d0CDrIK1CUzGjrGKs4Hg>
    <xmx:G4sPY9FqOXY7tXjpKNDrNyMxCHXkMSwbJyNRXJ-6CwxnPuf1HI3OZA>
    <xmx:HIsPYyWgCr2pIt5tEqUef5F_AvsO-F-ZI03TUQc0XVhFx1a6LGXfKQ>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 31 Aug 2022 12:23:55 -0400 (EDT)
References: <20220831160712.189938-1-richard.purdie@linuxfoundation.org>
 <CANNYZj8T_Cntva5-+YXX7Dzhf2YJNOyPkbbEYWWZAmHUm4g3xA@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 28.1
From: Pavel Zhukov <pavel@zhukoff.net>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] vim: Upgrade 9.0.0242 -> 9.0.0341
Date: Wed, 31 Aug 2022 18:20:44 +0200
Reply-To: pavel@zhukoff.net
In-reply-to: 
 <CANNYZj8T_Cntva5-+YXX7Dzhf2YJNOyPkbbEYWWZAmHUm4g3xA@mail.gmail.com>
Message-ID: <877d2ojsbh.fsf@gentoo.zhukoff.net>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 16:24:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170137


"Alexander Kanavin" <alex.kanavin@gmail.com> writes:

> I have to wonder, what is really going on there? :-) This never ending
> stream of CVEs makes vim formally the most insecure item in core. Does
> anyone know?
Is it rhetorical question? :)
Vim has very old codebase and nobody carried about security at that
time.
There were few attemps to rewrite vim recently (neovim for example) but
I don't know the outcome.
>
> Alex
>
> On Wed, 31 Aug 2022 at 18:07, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> Addresses CVE-2022-2980, CVE-2022-2946 and CVE-2022-2982.
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>  meta/recipes-support/vim/vim.inc | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
>> index 5b95ab2625c..33a82992433 100644
>> --- a/meta/recipes-support/vim/vim.inc
>> +++ b/meta/recipes-support/vim/vim.inc
>> @@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
>>             file://no-path-adjust.patch \
>>             "
>>
>> -PV .= ".0242"
>> -SRCREV = "171c683237149262665135c7d5841a89bb156f53"
>> +PV .= ".0341"
>> +SRCREV = "92a3d20682d46359bb50a452b4f831659e799155"
>>
>>  # Remove when 8.3 is out
>>  UPSTREAM_VERSION_UNKNOWN = "1"
>> --
>> 2.34.1
>>
>>
>> 
>>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170135): https://lists.openembedded.org/g/openembedded-core/message/170135
> Mute This Topic: https://lists.openembedded.org/mt/93374420/6390638
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [pavel@zhukoff.net]
> -=-=-=-=-=-=-=-=-=-=-=-


