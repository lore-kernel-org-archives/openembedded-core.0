Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F29C636CC
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 16:33:21 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web10.14476.1676565191115273466
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 08:33:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm1 header.b=nDWgkJ8s;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.19, mailfrom: pavel@zhukoff.net)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 4418132009C5;
	Thu, 16 Feb 2023 11:33:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 16 Feb 2023 11:33:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1676565189; x=1676651589; bh=qZ
	hsjSirhmyDo5ouLJCdYD0BddsFJ5wHp9NlhAg/TCA=; b=nDWgkJ8s8rRvffrVsw
	VIRALfFsjjZxYUo9eu3jsRx4lLsE/uKA5DDVSoNYa7ncvAqcul5tvuLPnfZg9SWR
	OHzP49Rb80Lln6+wBzcRavPgF+AfMddGUURylNaxG52E8yto3VOoDp+YdWTKqiFY
	wZQml2LDwrB7BS3aXd76ejPCXV8KP+Yq+2fAZtdpkHobZXpcaQUEvxody0x5L22Z
	RzJDxlrtP/cqR9n35SlVxZh6PS65EZ/IMd7pHAMtt+N8PFVUuzfdotAHZwk+RZ9V
	O/QBzsdW4ZMk/jYXMmTyfxh4dYE2C0j1CMAtTweOBd51K2RuNeR7T3ftuOq4YwaQ
	P0RQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1676565189; x=1676651589; bh=qZhsjSirhmyDo
	5ouLJCdYD0BddsFJ5wHp9NlhAg/TCA=; b=agQdtVK6LQlY2EfvuW8/N2OS75syz
	qTtrHpW0l0rikC3p1fcCUEkjLo4NtOl+7MGcJ9YnIY1XNL5ZXKuWfYQpwkCGx4gJ
	HzwhMrJb8Ad0cnos/AG/Y4Mw+1s09jPeCJv05uQTkJRJImdDUxUllwcuAgnxDSSA
	VJYY0BzNdU3GNOEvGpP9rPJfMiOWx9NCDeYU1M+AtnVOX6EUwQj5FNIZkfGeey80
	vMxWf8u5J97Fq84yHpmUu/kOVg6brCX1fr2RkgVaarOgCwyJqT2HB5CsGuENc3Lf
	djaLc4JFh3ycxrB5iXZBMkvM55HCeE4HaWRee618Vo0xmSXHgs6PzUQLg==
X-ME-Sender: <xms:xVruYzjv0d75mNE5JTxNQgpYWdhNV85Mr3eSHUauW1221b6vIimKZw>
    <xme:xVruYwBH5dsOpnsgU_AdmfF48y7i7--dv5C261y0C73KtjmpUfhNmerjBxjGhv7Cb
    3GuDfsSm49m6ZIm90M>
X-ME-Received: <xmr:xVruYzGTyQm4S3tQCBKd5Z9oxMNBwoEImaLb45Ttkv3j5VseM2ak2j9QjmZ6l_XwI_A_U8FL-RZXRj6MJT5hm4s2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeijedgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfhgfhffvvefuffhorhgjkfggtgesthdtredttdertdenucfhrhhomheprfgr
    vhgvlhcukghhuhhkohhvuceophgrvhgvlhesiihhuhhkohhffhdrnhgvtheqnecuggftrf
    grthhtvghrnhepfeekudeuhfegtdduieeffffhudehvdevgeeljeehiedvhfegkeekhefh
    ueekudevnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhu
    khhofhhfrdhnvght
X-ME-Proxy: <xmx:xVruYwQeIbmxn6Fml-dvCqAf21Q3qynNndHLJlzT19MUxVb8cRkskg>
    <xmx:xVruYwwkBfSJ7kC3PKSpbuImIMdGJXCt4FBlwbXRDAxxCXtH_GGyRw>
    <xmx:xVruY269iahwbazmF7mvfQ4nuIx2UlnidMZpY6Lfu0GGPKXofiQJ5w>
    <xmx:xVruY9pl1FxIn1Irzs8nqXMr6ZfK9yILxnXlcn2XAa5O6bjypvHyLg>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Feb 2023 11:33:08 -0500 (EST)
References: <20230216122338.17270-1-pavel@zhukoff.net>
 <e5864a794c05bea8639b7e309d957508cce9bc2e.camel@linuxfoundation.org>
User-agent: mu4e 1.8.13; emacs 28.2
From: Pavel Zhukov <pavel@zhukoff.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] wic: Fix populating of IMAGE_EFI_BOOT_FILES
 with uefi-kernel
Date: Thu, 16 Feb 2023 17:30:09 +0100
Organization: Linux Private Site
Reply-To: pavel@zhukoff.net
In-reply-to: <e5864a794c05bea8639b7e309d957508cce9bc2e.camel@linuxfoundation.org>
Message-ID: <874jrl6059.fsf@desktop.zhukoff.net>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 16:33:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177297


"Richard Purdie" <richard.purdie@linuxfoundation.org> writes:

> On Thu, 2023-02-16 at 13:23 +0100, Pavel Zhukov wrote:
>> wic plugin crashed if IMAGE_EFI_BOOT_FILES is not empty and uefi-kernel
>> loader specified because of preliminary return from the function.
>> [Yocto #15033]
>> Fixes:
>> >   File "/mnt/builds/yocto/sources/scripts/lib/wic/plugins/source/bootimg-efi.py", line 371, in do_prepare_partition
>> >     for src_path, dst_path in cls.install_task:
>> >                               ^^^^^^^^^^^^^^^^
>> > AttributeError: type object 'BootimgEFIPlugin' has no attribute 'install_task'. Did you mean: 'do_install_disk'?
>> 
>> Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
>> ---
>>  scripts/lib/wic/plugins/source/bootimg-efi.py | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
>> index 4b00913a70..d6aeab2aad 100644
>> --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
>> +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
>> @@ -221,7 +221,7 @@ class BootimgEFIPlugin(SourcePlugin):
>>              elif source_params['loader'] == 'systemd-boot':
>>                  cls.do_configure_systemdboot(hdddir, creator, cr_workdir, source_params)
>>              elif source_params['loader'] == 'uefi-kernel':
>> -                return
>> +                pass
>>              else:
>>                  raise WicError("unrecognized bootimg-efi loader: %s" % source_params['loader'])
>>          except KeyError:
>
> Thanks for finding that!
>
> Is there some way we should be tweaking the wic tests to avoid this
> regressing in future?
Sure.
Seems like bootmgr-efi plugin is not covered by the tests. I'll create
some. 

>
> Cheers,
>
> Richard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177287): https://lists.openembedded.org/g/openembedded-core/message/177287
> Mute This Topic: https://lists.openembedded.org/mt/97004405/6390638
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [pavel@zhukoff.net]
> -=-=-=-=-=-=-=-=-=-=-=-


