Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E44B0C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 13:30:18 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web11.31694.1641821417360502450
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 05:30:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm3 header.b=uMnDCWwO;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25,
 mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 6E88E3200EE0;
	Mon, 10 Jan 2022 08:30:16 -0500 (EST)
Received: from imap41 ([10.202.2.91])
  by compute4.internal (MEProxy); Mon, 10 Jan 2022 08:30:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	mime-version:message-id:in-reply-to:references:date:from:to:cc
	:subject:content-type; s=fm3; bh=Zk9edmrhVKBv+TZseOIFJ0+e4Y79OpK
	p5RA3/L3xsOA=; b=uMnDCWwOpMp10GYjY0EzojpQ835zHDB7M+8U95xwTCroYCT
	f2cMWX63x7hKhKE39c+dlKX3NcOTkXjUi1S8pvddUSH3RpvSSdOZbaHkG26nYeih
	f4aB3mP/mM6Bz5pH38DrxThSQqeHWdcw1Z+7zARQdLTyzU4Vip+FWogT0O2fxgbQ
	RjnKGntz4fDlWd4kXcb2Dl888nfJfGtrvWtdOH+986p3w453B0dpVyVXPub9y9ZO
	Pq3+wteNwQ8Pi2nl+HBCfUvU7bpyV6YhobqvqqFcVmnm6wBYsysu8iYUCVKTUUg5
	M1ABFeSNgEywi2dtajfmtPR5ieQMShU933PGeHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Zk9edm
	rhVKBv+TZseOIFJ0+e4Y79OpKp5RA3/L3xsOA=; b=SG75gcyAM2LT1Yg/tAnrA6
	LyMIukG0kx+xgVWOVT0PQSxMtb9bqWyHA+RqraaIHCrfnDbGuwTh2Grli3ps8SeI
	uL3aG5Z9aUcMDLiXif8ymUEQxQG6Jc9rUh/JVvVjnaxwk5f7YxlTRe0eeHp1gOiN
	2VmLkNshl8ZP0DEYVHyhi3nvpu0dTMZmTW3iwxd6Shs3cKs02fEPq5AbYU71zxeQ
	0U84wkZ7iTAXfjSJGacsm2heMS0/jDRD8kG6/hOuT2h2kDyDArsVxX+jJrorDxTS
	oRM3ZH+ICR4/9AKNRMm2K8/8gDg6gK73C3FSQba3yISJSIgmhkBMMyoqjb5zHATA
	==
X-ME-Sender: <xms:5zTcYeyRV8S6FPFBZo9cOfLkNByY0ZZQOof_j43Nt-MFJ8ICYkXLJg>
    <xme:5zTcYaRF6bsFOWn5RZaw8d25mG9r1XcgpoUYAborRxhu5WVqtKX1AXjRTRrZosTU-
    REfXtuDr3oV_Ve6ajc>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvuddrudehuddgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesrgdtreerreertdenucfhrhhomhepfdetnhgu
    rhgvihcuifhhvghriigrnhdfuceorghnughrvghisehghhgvrhiirghnrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeehuefgfeeuhfdtueegffettdejjefgheeugeefgfegffethfdv
    ffejgeefieetgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:5zTcYQVXdPnA5KJEdFvcFC6CfUh5SmXjO7I0qRoZoJk8_AaoHJqlSQ>
    <xmx:5zTcYUj3NpAWVLWJxX3p2lO2wAQZg8ok5OAcwsX5s829g5LgmQ1Z8Q>
    <xmx:5zTcYQC-NWzRD8sZuWD9OCHvH1OAeBr1CzrPmIu7RVeD1_2zcXkAcg>
    <xmx:5zTcYbpvEUGk7fxcI8trph9bnEssvSU74xFOKkt_A_8ll5AJdz3Veg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A9A3D3C0146; Mon, 10 Jan 2022 08:30:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4527-g032417b6d6-fm-20220109.002-g032417b6
Mime-Version: 1.0
Message-Id: <a2530aa1-d85e-4ffd-abe5-bcabb9d1b0a8@www.fastmail.com>
In-Reply-To: 
 <CANNYZj8VVqOpQYdg3MJFYjXKaZu8+cLinjggSvcwxEiEtzngeA@mail.gmail.com>
References: <20220106201234.159792-1-saul.wold@windriver.com>
 <b44541ed-2bb1-485d-99d3-e6ab1fe61664@www.fastmail.com>
 <647ddff7-c27c-4023-aa70-a423876f4e20@www.fastmail.com>
 <CANNYZj_DDFsXrftLA3ySaAefWbqO=CRwHROiisY8_x80DDT4nA@mail.gmail.com>
 <ac4676b0-7d40-4f2e-bf3d-892fef657037@www.fastmail.com>
 <CANNYZj8VVqOpQYdg3MJFYjXKaZu8+cLinjggSvcwxEiEtzngeA@mail.gmail.com>
Date: Mon, 10 Jan 2022 13:29:56 +0000
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>, bero@lindev.ch
Subject: Re: [OE-core] [PATCH v2] perl: Enable threading
Content-Type: multipart/alternative;
 boundary=20a398a15c1640a68179308d60d33003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 13:30:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160351

--20a398a15c1640a68179308d60d33003
Content-Type: text/plain

On Mon, 10 Jan 2022, at 13:15, Alexander Kanavin wrote:
> On Mon, 10 Jan 2022 at 14:08, Andrei Gherzan <andrei@gherzan.com> wrote:
>> 
>> You need to clean before every build. Perl doesn't correctly reconfigure itself when settings like this change.
>> 
>> I'm not sure I get you here. Are you saying that this is normal behavior or that it is a known issue? If the latter, do we have an bug raised on it?
> 
> Yes, it's something to be fixed, I'm just saying that the specific change itself is not the source of trouble.

That makes sense and after a bit more debugging it seems to match my testing as well.

Thanks,
Andrei

--20a398a15c1640a68179308d60d33003
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}
p.MsoNormal,p.MsoNoSpacing{margin:0}</style></head><body><div>On Mon, 10=
 Jan 2022, at 13:15, Alexander Kanavin wrote:<br></div><blockquote type=3D=
"cite" id=3D"qt" style=3D""><div dir=3D"ltr"><div class=3D"qt-gmail_quot=
e"><div dir=3D"ltr" class=3D"qt-gmail_attr">On Mon, 10 Jan 2022 at 14:08=
, Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.com">andrei@gherza=
n.com</a>&gt; wrote:<br></div><blockquote class=3D"qt-gmail_quote" style=
=3D"margin-top:0px;margin-right:0px;margin-bottom:0px;margin-left:0.8ex;=
border-left-color:rgb(204, 204, 204);border-left-style:solid;border-left=
-width:1px;padding-left:1ex;"><div><div><br></div><div dir=3D"ltr"><div>=
You need to clean before every build. Perl doesn't correctly reconfigure=
 itself when settings like this change.<br></div></div><div><br></div><d=
iv>I'm not sure I get you here. Are you saying that this is normal behav=
ior or that it is a known issue? If the latter, do we have an bug raised=
 on it?<br></div></div></blockquote></div><div class=3D"qt-gmail_quote">=
<br></div><div class=3D"qt-gmail_quote">Yes, it's something to be fixed,=
 I'm just saying that the specific change itself is not the source of tr=
ouble.<br></div></div></blockquote><div><br></div><div>That makes sense =
and after a bit more debugging it seems to match my testing as well.<br>=
</div><div><br></div><div>Thanks,<br></div><div>Andrei<br></div><div><br=
></div></body></html>
--20a398a15c1640a68179308d60d33003--

