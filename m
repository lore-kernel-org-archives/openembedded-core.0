Return-Path: <cazfi74@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B7C5C25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 21:32:36 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.5983.1717450349073053330
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 14:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fXMh43/m;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: cazfi74@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e96f29884dso3677401fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 14:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717450347; x=1718055147; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B2Ey79GJ0Wl0JoJYchnHMgr9zuKdsAhIPhK32NN3OBg=;
        b=fXMh43/m8vov6B3oM7dPgJ3t9/c/qseWFq0ZauumbVZ5aFCUmV+9RmUq+8poLW5Trs
         2Em8+ZcUmGw9hVX8Cm5JbpSBe/Z+1iMvtfGVZXTpgaEFyRIvaP45ilcAMIT/S3W58+Aj
         o2jHNuyITuG5tpL7jQAuWnSK9XSCX9spbXhhNrtUimhw7+K7hGLb/SqItiE47BxhcUWV
         mRrTkOEvwYoAoR8uAg37SLfVNt2va39+lvp4XP6B71Lwe2QWx7Q3EpK0PADGnd/KYUqU
         hRSaUedfoyhOLgrgPHLk64vvnxm2o7mvVOLj1J52u6hn2bCt367CoTKzbL+x+aYh8WVL
         aA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717450347; x=1718055147;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2Ey79GJ0Wl0JoJYchnHMgr9zuKdsAhIPhK32NN3OBg=;
        b=U+eL0z1elzAWzvlP7g+IYBdPacIJWI3bQR39pRnE4qRuxVf6hesgaGPUIRkLZRpxvr
         ZVvtOGWwqXT06w/cet9XFVzi0Tfqkdg3eCzYopNeF5IL6h0aQKrZH++Dr8aSfCpRwr0Q
         E/BTHGuXfIuh2mOzDKeN6hNy3EVx+pTCG/YR7abdrLxuLeDp9j9UJBC3kHoexUaiLZ1B
         5EoZNmWfQt7qmx/QO+azmj2YXOmjMXXryuIc9Q4WW6I4WewxoQdDCG4fTVvZX8HUYX5M
         ibZOP95FxAwUlidEaHrP2zSk3h4Ux8RU2t1Gs/oWVCzssGK3QkALYu1P8wNEQJOwVOKo
         fqfg==
X-Forwarded-Encrypted: i=1; AJvYcCXtzeKOHokumo7GPQJWtuxxPhyYjb0YrT1gyI5q/TJBB/Uw+NXEo3toBVatZQdRxiAt3EcQEXSP74uFV1GTYFSfeUiNXV3nHFS2MBeDMCxBnwaxAlmvD/IN
X-Gm-Message-State: AOJu0Yxl0aDmG+QWPfcp1donCJ1arCkaEmHOh5iOP6LHNOVhFHYlRjlJ
	+nFtUXrQiMo4VxRtnuRvgUUh9VsZZEaPQfG0c61qjPd1f+MK3O+UN2FET3IxGBF63eI211khm0M
	VtpoKHZh8tBNISduSCYosUKYCvOw=
X-Google-Smtp-Source: AGHT+IE7zb4Zklh3wAodAxP+kbXIGyElyOgSGt3RmopcXEe5PNNRMzniSfB4W6XPwnNQLxlZl6ufAIeV+o56TjN1q4A=
X-Received: by 2002:a2e:b54b:0:b0:2ea:7a33:2c09 with SMTP id
 38308e7fff4ca-2ea951e0bb4mr62402041fa.32.1717450346880; Mon, 03 Jun 2024
 14:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <f709a2b1-450a-47ab-9438-577c8d5e6bba@ti.com> <648acd46523f9be85df778aa235d082312ead1ff.camel@linuxfoundation.org>
In-Reply-To: <648acd46523f9be85df778aa235d082312ead1ff.camel@linuxfoundation.org>
From: Marko Lindqvist <cazfi74@gmail.com>
Date: Tue, 4 Jun 2024 00:32:14 +0300
Message-ID: <CAF6bG8ePV1ti4E91k9=0RFZ5_i=OCHStde0few-qR+MKadQWvQ@mail.gmail.com>
Subject: Re: [oe-core] [RFC] meson.bbclass: pkg-config vs pkgconf
To: richard.purdie@linuxfoundation.org
Cc: Randolph Sapp <rs@ti.com>, alex.kanavin@gmail.com, 
	openembedded-core@lists.openembedded.org, Ryan Eatmon <reatmon@ti.com>, 
	Denys Dmytriyenko <denys@konsulko.com>, cordlandwehr@kde.org, 
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 21:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200283

On Tue, 4 Jun 2024 at 00:22, Richard Purdie via lists.openembedded.org
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
>
> Keeping it simple and saying "pkg-config behaviour"
> everywhere is simpler IMO.

 Do you think that pkg-config will still gain livelihood? I've
considered it a dead project for some time now. I was about to check
how many years it's since the latest commit to their repository, but
the repo URL from freedesktop site now gave 404.


 - ML

