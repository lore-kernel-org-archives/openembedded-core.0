Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4602BC6379F
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 14:11:38 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.15749.1676470289290306935
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 06:11:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i9mZowSK;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id bp15so27697711lfb.13
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 06:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BqkI2gnnsZhRCMBRuAY5Ug62O8mAkxEf7PhTLUkCorU=;
        b=i9mZowSKgak+9zBJSVRtqSqN71zaDpb10njuYogsCmdUbkcKvijMracldkAt1O0GTY
         GXvWAbhQFv7TlgGIZd0m89aT0N1Cs/j47Xbkdr7l0HmE2sN1FWNFU+Qubap92dG8mh4r
         r+C1pXw2CCVKeqXZHtZBuCCO6qvg5C+iAGG/1KcjG5pPoPj2tP45NDL8r2tZ2XZCfe4d
         m0JBEwlwevmoH/jHwyTlcliC7Y6z/gQpW8lFehNIbiu3sWtHmy3OikvwTaR1HSCqlRaZ
         WiLb8bSRHR8HO9Dw4o7jZz1dp2hegl8eK/ARHkGwayLRvseG6TFmV7GdbsZXQAH9YYph
         68NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BqkI2gnnsZhRCMBRuAY5Ug62O8mAkxEf7PhTLUkCorU=;
        b=cBFUXKrnSUHG4yow+ElenUOh/N8HBIR/pian22lE3aezCsOdQ1LUEBIJoYX/EWkTYm
         /C4rKWOA6BPeoRHngN+yr2caEs6CDXfNKQSU55AaDSSAF8aDdhVpTxvC8gKfWng4yvSU
         DBXkwZd8FcQ7IKefJ9mXy1jzk9nI1t2k2keNvK3C2kpvFbNbVU40BOVbF/7HmhVZeMXw
         uQdoEAXIcxTnmtTuCv0tJhcLFd/m22wQNkkEzU7KDF5+FHczh4+lwDTG7GqdtK0rt2m7
         2bL1lQf97dOGe46eH/MCUlQIykKDMdvlq3hlWe72NIMCJ1u8csCThXUZKBix6zQ/RkMi
         wXuA==
X-Gm-Message-State: AO0yUKW5eBRTmnYvptZRyOD+XCLu/crzprAH+78/B9H90fXmTzuQVh7D
	WUeVdt4m3nBU6b9Feq/ZoquE5jDM8HRN6ypsvSk=
X-Google-Smtp-Source: AK7set+WhAHUEIkS/FG7I6wQPivOwnaFZY/LO6MOPuvDjLvEhjgCbs1MYhLsPmp4mEmjCY/V+bKO8v89azhvthtkEgA=
X-Received: by 2002:ac2:4439:0:b0:4d5:ca42:aeed with SMTP id
 w25-20020ac24439000000b004d5ca42aeedmr515146lfl.13.1676470287521; Wed, 15 Feb
 2023 06:11:27 -0800 (PST)
MIME-Version: 1.0
References: <20230203135011.2061939-1-m.felsch@pengutronix.de>
 <12e370a3183d04572da1c5749d8e64dcf5091a0c.camel@linuxfoundation.org>
 <acf8b79c23675a2b4c7225e55e4ab369fbcf7f54.camel@pengutronix.de>
 <7f5ebf2315c969ce7c76d024ec373f45cc8eff3f.camel@linuxfoundation.org>
 <CAP9ODKokQpGL3ttukqRaq3-8m0ci7qp8mckbgudGJx1HOu-fPw@mail.gmail.com>
 <CANNYZj8_RkjMASpozi+oSu3XOHCW04n9YUC5UgHKy+2vm=cDrQ@mail.gmail.com> <CAP9ODKqjkCuhyVkfhskOSdF3g57=R9MO6Bcy2R5zBV9fVd6wZQ@mail.gmail.com>
In-Reply-To: <CAP9ODKqjkCuhyVkfhskOSdF3g57=R9MO6Bcy2R5zBV9fVd6wZQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Feb 2023 15:11:16 +0100
Message-ID: <CANNYZj_jLK-FXrGx+bF6fXrSsc-so6G_kpyZKNTpatqJKxQeRg@mail.gmail.com>
Subject: Re: [yocto] [OE-core] [PATCH 1/2] barebox: add initial support
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	=?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>, 
	Marco Felsch <m.felsch@pengutronix.de>, openembedded-core@lists.openembedded.org, 
	yocto@pengutronix.de, barebox@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 14:11:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177197

On Wed, 15 Feb 2023 at 14:53, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> I think the Barebox inside OE-Core allows a bigger integration and
> reuse of existing tooling for signing and other classes currently well
> integrated with U-Boot. For me, a critical point for decision is if
> Pengutronix will commit to support it.

You should be well aware there's a history of people contributing
stuff to core and even assigning themselves as maintainers, then
disappearing. And then it falls (largely) on me to keep things
(barely) going. What happens if ptx withdraws its commitment? Can I
then send a commit that removes barebox from core? Imagine the angry
lynch mob that will show up after my head.

Adding things to core is a decision that cannot be easily reversed, so
I'd rather have barebox in meta-barebox for a while, with any needed
fixing to classes and infra in core.

Alex

