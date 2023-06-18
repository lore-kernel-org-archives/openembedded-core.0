Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F4EAEB64D9
	for <webhook@archiver.kernel.org>; Sun, 18 Jun 2023 01:58:03 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web11.3580.1687053475835877358
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Jun 2023 18:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=fXdXBt6C;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-558a7faa989so1395846eaf.1
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Jun 2023 18:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687053475; x=1689645475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMlLiO/zMqQk+SiGJez04ZlfXW1kNr0trAI6cvMylww=;
        b=fXdXBt6CwPafR9gyIKHbct6IYAk2WCR6Ux9FcZRQ+yIed50NwaQSgn8XYIJ5jxtCs3
         KEnnmlqAzjWPa3J5buvgvpIDvSse+3X5OllKmgLY6iKQBis6qrSIKYQf69rK4WXgHIrh
         mcZFr09UkBb+e3xdIh7uyn4oPjURuZs6tKF7J9+Xo4ix/wMODuDzlhZVsYAVXZ/mbdvR
         3YEi9QoJLVCiwjvws0XJB64oRz3ebwUE7VFg15kI32KXy4QSqFV2eyj8zpJjn2q/ymvj
         HKmw7oMW2xnbn1DMG5NE+hKLGuGHS1M3QxFYRWOtTURLScdkOyi2rGCUkEx6Y5B+n/QK
         UZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687053475; x=1689645475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMlLiO/zMqQk+SiGJez04ZlfXW1kNr0trAI6cvMylww=;
        b=bPy56vENvsWZvll2YdCt182fr+VUHEwEOa/QQGttMX0vi+I7XIua8q+gJIg7pCtkoE
         vRVyH9R+8TImpHEhUexy55ZuvPXbQiBE8BphSdDx8bS8Z2YJYGUajKej4pryv6PC0Z7F
         sui9kHQRe4jxyemvXkgzTdFfB5Y0QSZ2hQ8oclvFdvxBxCgCVN+/6IY8iuQqOA67b77H
         hEFG6EWkzYwiSuBoSKpbUnYlf321JMPMRm6VykLHyUlGBwy8mo/i9dD9yqIWoHnO9Lfy
         8ul2GES5HR6I4ZSCKsZhYxmyZ7heI1+OmqVYDeMreDdQkYaVnsOXL3vFaiYyP/PbW851
         YfGw==
X-Gm-Message-State: AC+VfDznyb4FXd0JrdUg/DOMOvXJk9DiEZ1E8s60c/6rWAjY7EXLbibj
	2KxryIZx5HSXS5AhLtZo0gBh+oiBidA7ml+6OhA=
X-Google-Smtp-Source: ACHHUZ4RH+IHlLcueIs2XbuNbW5XP7UWDzXDVsJfI8koeS7XUbOEHMxFJu9bjqB+V6E0hnpRCW7XJFmiEixI2uJFDyo=
X-Received: by 2002:a54:4790:0:b0:39e:94a4:1284 with SMTP id
 o16-20020a544790000000b0039e94a41284mr5374713oic.8.1687053474996; Sat, 17 Jun
 2023 18:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230615105447.29690-1-aplanas@suse.com> <20230615105447.29690-2-aplanas@suse.com>
 <3c195fe070c377e91e697d5eb9eda135e2959ff4.camel@linuxfoundation.org>
 <DB7PR04MB466644241F9DEDB9DB022EBEC55BA@DB7PR04MB4666.eurprd04.prod.outlook.com>
 <e3536a055768ea84598762f8873165f5570da0b8.camel@linuxfoundation.org>
In-Reply-To: <e3536a055768ea84598762f8873165f5570da0b8.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 17 Jun 2023 18:57:29 -0700
Message-ID: <CAMKF1sqsFtmgiqxOfvm8DzJjYkaAEEFN0rHJ3PKdHyR9u1bWkQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] bitbake.conf: add unzstd in HOSTTOOLS
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alberto Planas Dominguez <aplanas@suse.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 01:58:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183055

I am seeing some race condition see

https://errors.yoctoproject.org/Errors/Details/708923/


On Thu, Jun 15, 2023 at 6:34=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2023-06-15 at 12:58 +0000, Alberto Planas Dominguez wrote:
> > > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > > Couldn't we just use zstd -d in the script? They're always the same
> > > binary anyway as far as I understand it...
> >
> > Yes, this should work. I decided to include the second patch to avoid
> > changing the rpm2cpio.sh code, that is a verbatim copy of the
> > upstream script (minus the added comment from the old version, that
> > reference where to find the script)
> >
> > If this is the preferred way I can do a v3 that drop this patch and
> > changes rpm2cpio.sh.
>
> I guess we can stay in sync then, I was just hoping not to add more to
> HOSTTOOLS. Thanks for the context.
>
> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182861): https://lists.openembedded.org/g/openembedde=
d-core/message/182861
> Mute This Topic: https://lists.openembedded.org/mt/99546093/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

