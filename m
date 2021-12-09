Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F91DC433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 18:40:17 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web08.15682.1639075215881893216
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 10:40:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm3 header.b=WO/mNnvz;
 spf=pass (domain: gherzan.com, ip: 66.111.4.25, mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 21A445C003D;
	Thu,  9 Dec 2021 13:40:15 -0500 (EST)
Received: from imap41 ([10.202.2.91])
  by compute4.internal (MEProxy); Thu, 09 Dec 2021 13:40:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	mime-version:message-id:in-reply-to:references:date:from:to:cc
	:subject:content-type; s=fm3; bh=t5qqq5M3c2sQjUQV89Pudz5z2yKlAXp
	KNj3WzR6eXjs=; b=WO/mNnvzlKD+1VIp88Y+qXXnAsvtEtjEH0fKDFmZFVQglJQ
	I2bHstsG14JJBkOnqlphQT41lwdNFYX4BDQsBNC2LVx6jsQEokSNpFsdPahMDgmi
	PzNtqx+/+YS2MTJsW48TXIAkI7UQ20a8wwkUqSmByQmhSXg5xq2WeBH1eRRIOIXH
	coDxtfWbUb1etaT+T9d3oVJfia/AQnG//YlPKJrUBuKMPGXo/81tPUfvltdE94Gd
	c4kpl2FDIUFLqN4QRp5dbDJy+kwdwCHCtz+yOooBkqr9JfcLvxykhJYC+6dasDWX
	/aSrE5iRb61TtdGgp7SiBXCKIUhftGfLFGURWkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=t5qqq5
	M3c2sQjUQV89Pudz5z2yKlAXpKNj3WzR6eXjs=; b=CQX/DCEYIqucsG3iP+bP+R
	oGlSFH65FL33V3nGQm/R9Zd8TxJt17zksewZ3VHg0q+cOJwXuaF9uwoKDyWJvmTs
	h4o7OJ+2xZjgqBAUdcohcgM+s+WYXmLufEF0w8b3ldveRdyUDvhZE4ADx3zhTAt1
	NbJ76HyakYgM9WVbi+c04OXKG1DhhCR1QyJ6zkpxDW//2aoL4w+oNBOsepB6Jwxp
	VT7hn5cVKHS8y1NVcHuNff5rvn4VhCfviCG0kPB/K/9Fb5wCGCklwg15VhcWNMRs
	HECkzidskacKteK28iMVtuD7xajIRiAaTTtYK2kRaZ2/XKe73SOTi0T3gpwcT3uQ
	==
X-ME-Sender: <xms:jk2yYWJ6WlbX51Z2tbzdAhPJ2CNXvjMFLiRKvut06CrqOeHemFWZVw>
    <xme:jk2yYeJDyCTuqRzNUdpxJMsfmi_m5oxvCruZZJfh_jkb9Yvuz4j3VdclJ33ybWVA_
    7D9oUd85kW5lEuD1OA>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvuddrkedtgdduudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvihcuifhhvghriigrnhdfuceorghnughrvghisehghhgvrhiirghnrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpefgheegtedtgfdtieefheekkefffedtvdfggedtvdeffeelgedv
    geeufeeutddvfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:jk2yYWtL-h2YZbta5dMa-teKzK4B9zH_cKzM5u9BxPaz1IAMWshQMQ>
    <xmx:jk2yYbaq2zjeQttpEuzr-fuqhoS6R9w__-AAuJz-vGrP_DRuYK51Og>
    <xmx:jk2yYdb38gCSjJhHy0LcUV1oSVuX-5CnxM5Cjj_qOb7lQKLofxisUA>
    <xmx:j02yYcwW_ZRasZSwrzPavIOHG4MSdT7wJohZapIrJ-bH3oauvFKIKA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C627D3C0246; Thu,  9 Dec 2021 13:40:14 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4506-g4374de3f18-fm-20211208.001-g4374de3f
Mime-Version: 1.0
Message-Id: <09f8ff3a-829d-41e4-95c1-fd203eaba643@www.fastmail.com>
In-Reply-To: 
 <CAMKF1srj=FoX1Omr-57j35T6gGgU5JcGTdJMdghVjFy45K73-A@mail.gmail.com>
References: <20211209154006.2323679-1-andrei@gherzan.com>
 <CAMKF1srj=FoX1Omr-57j35T6gGgU5JcGTdJMdghVjFy45K73-A@mail.gmail.com>
Date: Thu, 09 Dec 2021 18:39:54 +0000
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>,
 "Andrei Gherzan" <andrei.gherzan@huawei.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?=
 <bernhard.rosenkraenzer.ext@huawei.com>
Subject: Re: [OE-core] [PATCH] gcc: Fix tm.h plugin header
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 18:40:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159474

On Thu, 9 Dec 2021, at 16:40, Khem Raj wrote:
> On Thu, Dec 9, 2021 at 7:40 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>>
>> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>>
>> On x86-64, tm.h (needed to build gcc plugins) tries to include
>> config/i386/linux64.h, which isn't installed. Fortunately it also isn't
>> used, so simply removing the include statement is an ok fix.
>>
>
> is it due to multilib support ? if so we might be ok since we may not
> be using it
> but really it will be good to check it with multilib builds of x86_64/x86

I don't think it is related to multilib but I'll give multilib a try. In my case, the issue was revealed when compiling a kernel plugin config. I can't remember right now which one but I can replicate it for logs.

--
Andrei

