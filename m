Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5984AC48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 14:54:47 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.23407.1707231280761148538
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 06:54:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sl90IfKj;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51149561a39so3045385e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 06:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707231279; x=1707836079; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3R1zlFZcpoDOOCPeJLi+1jn3jIVdFTsfcmzsQfzYKD0=;
        b=Sl90IfKjo7jSZAN1tfk6EADL2CRZU9QR4XVn3m1HicpAsFxdmq5duc7YdzVzul1uNJ
         jyOeQLyLnd1+zjqIQyCReutNdhT2s+F9yh8Z64YXQ015VMCmulWpBV3/03ryjf1+I160
         GX+hqMQsflDHdz04GSoBgwp2Ro7qCpbDPeOUCAzDpsGRMA9+k1rjesj+UkmXje/K8qwN
         p3GwuBHp9idWFKcGXXjZjPJcuomMVb2r4AGIVJBuqMyKBTc0FqOsIwtMSYfmWGqWpZEZ
         2kE0b+2i2ia144vnFKbaHjKKNBn5lcpFRAH8fRTeYxfdVHWUPt6qUM9CTEH9xXb7fc8t
         hz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707231279; x=1707836079;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3R1zlFZcpoDOOCPeJLi+1jn3jIVdFTsfcmzsQfzYKD0=;
        b=GM04v5Epk63UEA19TPY/bKKR/t/YKcDvMnIhForCjL3T0gNo1HEyJ2sD89ixfN4/8/
         1toUFJwfwYCRDZKqxkog9nbO2kqw58NXSnXvzMZoCTD/FsUNq1f6fTWPX6ppyty1a1bd
         CZb9SivYxBce4DPm50kcZoEMAQAP/eKajKC0n71AT6xz0TTbq0w7VAuUi/RiKdO58A4A
         xryrYJVut9QzCxIUckdimmoLSgqf0KEBFsrNYirdX+Sbw8IHjQHKiDQ6xW0zOrKq7JEt
         T4bOfWePN5rU6t0SFRON8Dz/4tVfahwzP/znjeHm4EcEjAEmA3R3NibaIc9en+1wiaWs
         ynQw==
X-Gm-Message-State: AOJu0Yx2fmSCvBrtpYbT+UcMQRR6Md+Wix1+g2827tuF6fAjHX1sHP5c
	m4k2oD45gobre5SWjgYtO0z2Z7NMRqukJnIREpvi1TBpy8JDzfX/47WUCdFHLrAnf+P9SwHQlb2
	yDkkcDb26q3F5Q3reIKVluZrCLak=
X-Google-Smtp-Source: AGHT+IHIsyAv5i7vEwbZ+xo8wLZNDPit19b+nKlZSh8wYjXwNi0Ue3m21qIvcW79c18WvEJuMxlgwL3V9vFvJT40tDk=
X-Received: by 2002:a05:6512:2316:b0:511:54e5:491d with SMTP id
 o22-20020a056512231600b0051154e5491dmr2267870lfu.15.1707231278784; Tue, 06
 Feb 2024 06:54:38 -0800 (PST)
MIME-Version: 1.0
References: <20231206092536.2874022-1-andrey.z@gmail.com> <CANNYZj8x2t2H9rj0jjjYW-GZqnqn_x6mNOJtydqUakO1sLU=ag@mail.gmail.com>
 <CAHtQpK69mRhcq6xMYLSgFQT7aKiXnh323AJP08noyMNX5fJMgQ@mail.gmail.com>
 <CANNYZj8-9PHqeiRuExw+kdPhCNspCERzH1zKA9O7L06F=bx27w@mail.gmail.com>
 <VI1PR10MB31822295979B4CE4CDB89E8EF784A@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
 <17AF75010791E9CF.16460@lists.openembedded.org>
In-Reply-To: <17AF75010791E9CF.16460@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 6 Feb 2024 15:54:27 +0100
Message-ID: <CANNYZj-zu9+a_zX21YWjN_SF0kL+rm=Fu5000s=an17r3SUaiQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] scripts/oe-setup-layers: add option to skip
 revs in json
To: alex.kanavin@gmail.com, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Jermain Horsman <jermain.horsman@nedap.com>, Andrey Zhizhikin <andrey.z@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 14:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194997

On Wed, 31 Jan 2024 at 15:30, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> > > Look for the patchset '[RFC 0/7] bitbake-layers: Add
> > > update-layers-setup' posted on 7 November, particularly the comments
> > > to the individual patches, where we get to the design that should work
> > > and cover the use cases.
> >
> > I had to work on some other issues that needed my attention,
> > so not too much progress since, however, I have reserved some
> > time this month and was planning to work on this.
>
> The patches are now in testing so Andrey can take a look and check if
> they handle he use case he wants to solve:
>
> https://git.yoctoproject.org/poky-contrib/log/?h=abelloni%2Fmaster-next&qt=author&q=horsman

And now looks like they're not. Alexandre, was there some reason to drop them?

[PATCH 1/2] bitbake-layers: Add ability to update the reference of repositories
[PATCH 2/2] bitbake-layers: Add test case layers setup for custom references


Alex

