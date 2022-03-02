Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F6FC433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 22:06:05 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web12.3874.1646258764650392390
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 14:06:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=D4SQCtFw;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id DECD35C0109;
	Wed,  2 Mar 2022 17:06:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 02 Mar 2022 17:06:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; bh=56+HK7Uzp5R6W1jQtUcQjk8LXf2qF8jiqIm9dl
	q6WZc=; b=D4SQCtFwDLy7DUkxAIblbR0SstsOsp2Sd/lfWN9j0+P1cJmXYEWyUb
	lDXBAk6lba8a1H1HmrzoU5dO86noOmeeTcMfEx6evAnd0+E8e49+rPJ1ncTHswy2
	DTFe8DkzS/hrQSz8f64tLFy9S02EG8ukn8DYVB8rlvdVien3SnV9RRj62S97Yzor
	yhb+7is+D2wx0jvQQJ6u699mQlWk3RMtAaRGKrH8Tiw6k628lNxexFi2kW12V55N
	5SQu4Eqx1YF7NJSvj80pNNi8YTZytXKDAxUqI5w2Z+XCdQm1PpertmmvRfUGJRz8
	gF7l5a5R1pq8NChnaJhQet+2wX5Yb9Gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=56+HK7Uzp5R6W1jQt
	UcQjk8LXf2qF8jiqIm9dlq6WZc=; b=IAmHPwJsdt8y6aUNiSXxSt2RcuVOGaZAc
	IOD9QqevbHiIstubM7xPYYcqUpgpKk84unNGQmp2HzEK2AKbr3DOj2kfzPPWEwtq
	zuykWh8/QQZiKDxrJGK1oLizRWsNpFCfTAj9l8lpqQ7Cg4R+NxTcsEAJz0pQUZIX
	MrgJ0RiJmB1MmTc0xNB9mSFZ3RmUCmNjCQL4EUGNvucnVnocyVSOb5afuY4HmCa+
	yajvbHadLXz7lJKUEeccekZdPJC70BltVl8G6PhZfhH8RUj3hmE+3Q4dUJYBIsmA
	lOriCv08t5KkNPATPIsoQvTw2kJtQdjYTXqMdrKY8XPZyi98lxWyQ==
X-ME-Sender: <xms:S-ofYsv-AFog3s_XKxB0cVNsbORr0BKFu3d4mxIHNcBOBzeIu1AEvw>
    <xme:S-ofYpf6cGyPH7vXL1c9WH5stY03qHAoluVaY770OkEm6wIcD82Q6TyYeWfqtbuwu
    FI6DGKMiy8ZJ7HtqYo>
X-ME-Received: 
 <xmr:S-ofYny00pnZ8uQTZYoJZMbkdiSrebAeITSV8vmkvnCxS09P-tML-f9GXcxT0Q>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddtgedgudehvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvkfgjfhfugggtsegrtdersgdttdejnecuhfhrohhmpeetnhgurhgv
    ihcuifhhvghriigrnhcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqnecuggftrf
    grthhtvghrnhepgfevheetudevheeiteelvedvheeugefgheetveevleffveekudduueei
    vdejffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:S-ofYvOsEfyLvFZkY1LWp5jvLWbzBGm3LjF61wpkIaDmwSiCUjkLFg>
    <xmx:S-ofYs-5MJsN6QIORBlkuyx81OjFfLfDSOflZdVWchRcliW7KsMdow>
    <xmx:S-ofYnWzaSiQd8iEuW2VW9gJDP0qHDwDSdQjas085LZxk9QPOHhUVg>
    <xmx:S-ofYhFle_TN3pNRW4urXs7NM61RwfdUdSWEkhtt-aM6xr1VEdBb8g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Mar 2022 17:06:03 -0500 (EST)
Date: Wed, 2 Mar 2022 22:06:02 +0000 (UTC)
From: Andrei Gherzan <andrei@gherzan.com>
To: Bill Pittman <bill.pittman@ni.com>
Cc: openembedded-core@lists.openembedded.org
Message-ID: <50482c34-35af-4e12-8ce6-db2f1b7c1914@gherzan.com>
In-Reply-To: 
 <SN6PR04MB49095E1D789819C9E3CEC881EC349@SN6PR04MB4909.namprd04.prod.outlook.com>
References: 
 <SN6PR04MB49095E1D789819C9E3CEC881EC349@SN6PR04MB4909.namprd04.prod.outlook.com>
Subject: Re: [OE-core] [PATCH] wic: Use custom kernel path if provided
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_Part_5_152330063.1646258762144"
X-Correlation-ID: <50482c34-35af-4e12-8ce6-db2f1b7c1914@gherzan.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 22:06:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162627

------=_Part_5_152330063.1646258762144
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Feb 15, 2022 16:54:28 Bill Pittman <bill.pittman@ni.com>:

> If the custom kernel path is provided in options, then
> use that path instead of the default path.

Just to understand this a bit, what is your usecase here?
--
Andrei Gherzan
gpg: rsa4096/D4D94F67AD0E9640

------=_Part_5_152330063.1646258762144
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html> 
 <head></head> 
 <body> 
  <br> <span dir="ltr" style="font-family:sans-serif;margin-top:0; margin-bottom:0">Feb 15, 2022 16:54:28 Bill Pittman &lt;bill.pittman@ni.com&gt;:</span> 
  <br> 
  <br> <span dir="ltr" style="font-family:sans-serif;margin-top:0; margin-bottom:0">&gt; If the custom kernel path is provided in options, then</span> 
  <br> <span dir="ltr" style="font-family:sans-serif;margin-top:0; margin-bottom:0">&gt; use that path instead of the default path.</span> 
  <br> 
  <br> <span dir="ltr" style="font-family:sans-serif;margin-top:0; margin-bottom:0">Just to understand this a bit, what is your usecase here?</span> 
  <br> 
  <div> <span dir="ltr" style="margin-top:0; margin-bottom:0;">--</span> 
   <br> <span dir="ltr" style="margin-top:0; margin-bottom:0;">Andrei Gherzan</span> 
   <br> <span dir="ltr" style="margin-top:0; margin-bottom:0;">gpg: rsa4096/D4D94F67AD0E9640</span> 
   <br> 
  </div>  
 </body>
</html>
------=_Part_5_152330063.1646258762144--

