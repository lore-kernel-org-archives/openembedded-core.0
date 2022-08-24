Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA591C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 09:37:21 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web11.9005.1661333833564511692
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 02:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=KqdVBvw3;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id E78445C00DA;
	Wed, 24 Aug 2022 05:37:12 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Wed, 24 Aug 2022 05:37:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1661333832; x=1661420232; bh=kWbaaQ9W5U
	+5XilYa2flanqhJyGf7dZL9a3/gnvL/B0=; b=KqdVBvw3HO7953Jep2S9HzHr9G
	dKMuQGT4K1KmjoMWj5we7LVzQVNPtWfq0ZsfCJA0kVl+zaM3qnEVyjc+uEcnAs7n
	RB9nviuLlZerdo5QQCW/Kle9AhXohdR3PamEM61apAcXJVvaDwKLtoE1hzPZHAay
	NXkB0DC+nh9nI6Ahb1p8MzMO/BMp8V6EXxR4HVpk4RLKsOzRuJVmxoIKWN607pkX
	+5QG7ToyyxNQHHLpKYiV8A+ekDmf2zA8K8FN0w4k6sLQNNgNn8B0XaeLDnP+JDOb
	kxo6yoXQwc42CqpyQMdsYKoTzAV+rzATA/4ZAQzBpqX0AsHVxBWQ1KUWOw2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661333832; x=1661420232; bh=kWbaaQ9W5U+5XilYa2flanqhJyGf
	7dZL9a3/gnvL/B0=; b=fbQzoCiuocK283xK4Li0xOK1WBpimoTtGYwcVGxzRFYm
	cRqjxahW/JQg2KskabE4UhXySovEB6IottS34QfUazEcAj5F7rLc8yKrfiRLESmj
	GGeNmj9RZseILS3on2YWQ7kzIeOVLipa47gzwYTVfs/ZL86BieqR+nAJOM2UeVX6
	QHfoTijF5VIy0s/dL23idCKK/tStCYAKU8DI88Z9Z0+UazqhRWxgpBh/Tp3Ya91q
	xHjI3ss48NiOl6VvPTUCZoosGSvkRDAcAU2W9eTYCpyJtV2WHitKPuVZ3vhoWfse
	kq4eF34KdLHzfFqhmPA38K39w0xNQqULkBYqRZ6RVg==
X-ME-Sender: <xms:SPEFY-5fNK-QFsO2Sw6mwdlJXCI3cZ8eqLbBHBSnCkKgsF-j7991mQ>
    <xme:SPEFY37I2sK0DI_QcOO6pyKO8wlEROamqOPSPy9lg6LlM1o2uHDGPxAr4iUXE5gCf
    Zkb39E7Q7QH94Ap9uw>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejuddgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqne
    cuggftrfgrthhtvghrnheplefhudehiedugeejjefguedugeevffduuefhvdfgtefhgedv
    geeujeelgeeikedunecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgv
    ihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:SPEFY9fp0Jav3vn-rDYBwrhs4eWfdaJmcHSiQOIJiWnx0SuOPeE0tw>
    <xmx:SPEFY7ImIjIKHrw0VqtHofLVNp5kTZjy_nIMME4sc6Sy8HtdoPzNmg>
    <xmx:SPEFYyIqqktCcs6ECHjzbMa0l1rwbqzSGB0q3xT-PTQ7w9TmIcOIJw>
    <xmx:SPEFYxlNtKx7t6iInmEK8B4Y34GJNJ5wvpEgol36a5kONa-T9IAe9A>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B5A682340077; Wed, 24 Aug 2022 05:37:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <d040d16d-1354-4d8f-a5f3-ff681e6efa22@www.fastmail.com>
In-Reply-To: 
 <CANNYZj-9x5KFk-FMp9tbfDkPa-8uyhPx2R+rHvfsxufS+w1NkA@mail.gmail.com>
References: <20220823235624.2488133-3-andrei@gherzan.com>
 <20220823235624.2488133-6-andrei@gherzan.com>
 <CANNYZj-XzOu-zd1aTn7aQ0DyrsiN8J3mOPuG-4wcJw0DzegRww@mail.gmail.com>
 <c18472e4-db71-491a-8f9c-b82245c47800@www.fastmail.com>
 <CANNYZj-LRM_fR3zuRQrR4kkhY_TuF5pGPBDePDaLbEWSJaoQQQ@mail.gmail.com>
 <d0b7534b-bbec-43da-9a02-2fbd9fa453f4@www.fastmail.com>
 <CANNYZj8+qFQzobfqrow-LmbJ+Q8e249dTpz-xa1Rx4JN8OvSiA@mail.gmail.com>
 <d90ffe02-9459-414b-9c9c-758bfdf6355a@www.fastmail.com>
 <CANNYZj-9x5KFk-FMp9tbfDkPa-8uyhPx2R+rHvfsxufS+w1NkA@mail.gmail.com>
Date: Wed, 24 Aug 2022 10:36:47 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 6/6] shadow: Avoid nss warning/error with musl
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 09:37:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169801

On Wed, 24 Aug 2022, at 09:56, Alexander Kanavin wrote:
> Thanks, can you also resend the patch with the link to the ticket included?

Sure. https://lists.openembedded.org/g/openembedded-core/message/169800

Andrei

