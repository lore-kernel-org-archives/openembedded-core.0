Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ADB3C47258
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 14:30:38 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.15239.1706711430673126360
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 06:30:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BCtEOfNh;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51124d86022so1244725e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 06:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706711429; x=1707316229; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lZxontrWMjGPy/JsdBBSA3amARIK5oygswl0wjhMxjA=;
        b=BCtEOfNhorIF8rxchLNjYGwW3KA9CRET/TL94vTqGWdjD1WYt1XvkBGYU0PcbKYafk
         XLx99xfaCjpFX/8NA2gqsh8lwgnRM9EkVXFE3kQpF/9Daol58Xqi6buT3XMjmIyG2N55
         7shQmhQK+9q2X0pSugJEZ/cmAQHwnxZPHAA6AiVmIC08Gfxpxn2Q8pIlGv7DtPzN2xNs
         C5VRawrp1XlpDWsB7Zbfd03gt54KCig0esxJ3POBNSn0vTo95qgX0Rzm1exJRQCVwq4j
         41jjyzHLsTMcUlILrib/4xkfBEg8o3vho6KTbSwyi4PWKiLaV+1WmnJqeArALB3zkCsh
         c7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706711429; x=1707316229;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZxontrWMjGPy/JsdBBSA3amARIK5oygswl0wjhMxjA=;
        b=PFVfrS8DWF1Y/Zwx67XA97gVotoUnBtLTepX7x/LsWxKatWGuv3PkbO+P/UKLlnFHC
         FsEvl0UaFDbC+eAMiw+et9yrFSKxG55mPRgkcc7Z0RF1by7awOnOzqL0zQtp0AdwgcyH
         5XVPfvo/EuNnRJRHbjVxAcJ7FoZqwcZGLt7d4mL7UZwMBpqFeqmSgqCNyI7WUVUz8EOw
         fDSNDSjviOqm38edR1Fpmt6quag44Rj+GzPNOJpresg2BqnrRmqv/pZSmjjtNcs3aDWU
         oROoMSiYR1nSFm5ERI+x9BOqF7TlRzzhTr6ZAZ6CgkM4avd90mSQc8JfvxAd91fr8y71
         P2IA==
X-Gm-Message-State: AOJu0YxXWAkJNJfhUOAb7kX6C5loyDS3HHUXbrLWVtU7WCwJVKvWFdIf
	niW27WwFoV4t8N/d0pfx+wK7vzMka6tWd3sbXTooL21QoEQwtGivDX7Mn8Pdi2giGOcolxRyJtC
	NI5ApnulgTyJ5G8Lu1Zno98dPs/c=
X-Google-Smtp-Source: AGHT+IE6ckrRSy6fbObYi8d2Zxx+t2R9ctDmgwKgzQ0zTGzZKxAa2yWiF6uIK0HRZ/2aqtGK8LGw2ZpkDiqICfy1/hE=
X-Received: by 2002:ac2:48a7:0:b0:50f:1c06:f9ba with SMTP id
 u7-20020ac248a7000000b0050f1c06f9bamr1306241lfg.64.1706711428499; Wed, 31 Jan
 2024 06:30:28 -0800 (PST)
MIME-Version: 1.0
References: <20231206092536.2874022-1-andrey.z@gmail.com> <CANNYZj8x2t2H9rj0jjjYW-GZqnqn_x6mNOJtydqUakO1sLU=ag@mail.gmail.com>
 <CAHtQpK69mRhcq6xMYLSgFQT7aKiXnh323AJP08noyMNX5fJMgQ@mail.gmail.com>
 <CANNYZj8-9PHqeiRuExw+kdPhCNspCERzH1zKA9O7L06F=bx27w@mail.gmail.com> <VI1PR10MB31822295979B4CE4CDB89E8EF784A@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <VI1PR10MB31822295979B4CE4CDB89E8EF784A@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 31 Jan 2024 15:30:17 +0100
Message-ID: <CANNYZj8Ku_GRqC3gXFpACOfJKKPoxKsPRLa6zBmAGwgwZQdVAg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] scripts/oe-setup-layers: add option to skip
 revs in json
To: Jermain Horsman <jermain.horsman@nedap.com>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 14:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194526

On Wed, 6 Dec 2023 at 13:38, Jermain Horsman <jermain.horsman@nedap.com> wrote:
>
> > Look for the patchset '[RFC 0/7] bitbake-layers: Add
> > update-layers-setup' posted on 7 November, particularly the comments
> > to the individual patches, where we get to the design that should work
> > and cover the use cases.
>
> I had to work on some other issues that needed my attention,
> so not too much progress since, however, I have reserved some
> time this month and was planning to work on this.

The patches are now in testing so Andrey can take a look and check if
they handle he use case he wants to solve:

https://git.yoctoproject.org/poky-contrib/log/?h=abelloni%2Fmaster-next&qt=author&q=horsman

Alex

