Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A27A2C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 09:43:41 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web08.9059.1661334218184315988
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 02:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=WBDzO8jH;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 846A85C0162;
	Wed, 24 Aug 2022 05:43:37 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Wed, 24 Aug 2022 05:43:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1661334217; x=1661420617; bh=/E/po2eFFW
	LP+dC+MXPJcY5pUEr+C6I6zKUbOZWVw54=; b=WBDzO8jHXjUgL1VhF1cJpYjlLH
	GLZSXtSb9q3PacZ6xEUBKdmda5HrySQMQ04bUEX3YEP+xQYpfVkmkpigmvJ1dyY6
	QQSV259wpACCQkK99FrsI6P4BN/IvQ+DTSEFKYuEcOpPxFrjkPSr3IduQGICmQAH
	mtNo2SdaBN0eJaFXF6x9nwOZOBQu3KHXoety6CxpGwS3Shz5PNB9j4wDz5axmTTN
	wsgu39eUWuakL5LLDUCbTXi6o3LgZiu14WOilxumexpeoKlVkgRv+6fZ87IC5fxr
	Box9Jt/g3ePzPzOhp7S94KO/cnGoi6nlmvCo149FC0zKUWItPPE6lfUqiRQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661334217; x=1661420617; bh=/E/po2eFFWLP+dC+MXPJcY5pUEr+
	C6I6zKUbOZWVw54=; b=n32xglHAa2Qj0o2KUHWV+UEioZT9jfum0+KM3jcB4sr0
	umyiPvFxaOYNxL9Sv/KiCL39mjzxgoJeGsThkdBnOkxOljXtFUYGhHbHAvopZ+a1
	KCXwmc1RZJPDSV127PKFe2iuLFS8ZJkRAjdad48QRNejz/48WMcsYBzhTZlorZIA
	hi7/i3ucL7iSOcN7AZLo/7isnLgmyH6coWMqlSWTdAuBkVJhnhTuhYsZEd5v7EwG
	b3nb98TfgPH+od8bSCNqouSAUqC1W5epuQUDDQ7pHajs6iIEtUzuUD+Ar8aCyQ0L
	wjUs0gCvGTty7eUEzIpJXBGSexJFcqzZVsLabD8jIw==
X-ME-Sender: <xms:yfIFY0sqyaBE3AYO2Ys0RhqSwUd4e38cg1m3Da59Ryl5eguC0kZ2MQ>
    <xme:yfIFYxeAwIAq5A7Ga0ep_A8zZ3DwHK8irkux04OyaKDLsducRdSnMR2zVbjFrCXVq
    EktzZ8F6DL-Z0UnrFE>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejuddgudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqne
    cuggftrfgrthhtvghrnheptdfffffgudeutdeluddujeeghfdtffegfedtjefgueegkeef
    ieevhefhveevudffnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpohhpvghnvghmsg
    gvugguvggurdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:yfIFY_yLn8M3K3wS9vG0Wnem8T-jaDLafJla79Rq8pjnBzFwcY8GCg>
    <xmx:yfIFY3Nu5nuJWjr00Kzoqjedi7F8g55MU0RcUNFvLeYwttggRqeykw>
    <xmx:yfIFY08doJBewaY5XZox_XJ4Pw0Uga9ySkZiuc3yx_qrFqaNcgnK_w>
    <xmx:yfIFY9L-dWSKk6AZMuUGL5TiMKVn9v9HJugy3kRF872Anbl87MZ3pg>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 576662340077; Wed, 24 Aug 2022 05:43:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <b21e39ca-36d2-412a-b899-1f5ae4a0cf1c@www.fastmail.com>
In-Reply-To: 
 <CANNYZj8q9otP4D_72P9SJAStrx+FvVfrGbWp=k4iBxr1Jv_-3w@mail.gmail.com>
References: <20220823235624.2488133-3-andrei@gherzan.com>
 <20220823235624.2488133-6-andrei@gherzan.com>
 <CANNYZj-XzOu-zd1aTn7aQ0DyrsiN8J3mOPuG-4wcJw0DzegRww@mail.gmail.com>
 <c18472e4-db71-491a-8f9c-b82245c47800@www.fastmail.com>
 <CANNYZj-LRM_fR3zuRQrR4kkhY_TuF5pGPBDePDaLbEWSJaoQQQ@mail.gmail.com>
 <d0b7534b-bbec-43da-9a02-2fbd9fa453f4@www.fastmail.com>
 <CANNYZj8+qFQzobfqrow-LmbJ+Q8e249dTpz-xa1Rx4JN8OvSiA@mail.gmail.com>
 <d90ffe02-9459-414b-9c9c-758bfdf6355a@www.fastmail.com>
 <CANNYZj-9x5KFk-FMp9tbfDkPa-8uyhPx2R+rHvfsxufS+w1NkA@mail.gmail.com>
 <d040d16d-1354-4d8f-a5f3-ff681e6efa22@www.fastmail.com>
 <CANNYZj8q9otP4D_72P9SJAStrx+FvVfrGbWp=k4iBxr1Jv_-3w@mail.gmail.com>
Date: Wed, 24 Aug 2022 10:43:17 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 6/6] shadow: Avoid nss warning/error with musl
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 09:43:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169805

On Wed, 24 Aug 2022, at 10:39, Alexander Kanavin wrote:
> Almost there :) As the patch was not actually submitted, the correct
> metadata is:
>
> Upstream-Status: Inappropriate [issue reported at
> https://github.com/shadow-maint/shadow/issues/557]

Now I know :)

https://lists.openembedded.org/g/openembedded-core/message/169804

Andrei

