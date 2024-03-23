Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4582EC54E58
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 06:57:26 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web10.4153.1711177042102525536
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 22 Mar 2024 23:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qyp9moZc;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5a4817189c8so1633001eaf.1
        for <Openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 23:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711177041; x=1711781841; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GKCVRFmyD2SpZhY5NTKneTezF4EWiDb4fzRSFXOBbw=;
        b=Qyp9moZc/p0AhlBwyDwibBi1eaHNF9izmOvZzCkU5yN25OynCFZA9FGqFcWzbrhbDj
         yik1D2Tq0wGRB58sDygc3oelH5a44osg0hfPEMZgXgi0TwHi5dZULDkMlD7U9xJCtg4u
         LXMvo+5AWkM1obpywNPwg4AtR/qQU0z+mxuRuNLY2lgz0gGjcYoB9djt9BxYsXhZ5Ttp
         3ELG2jMqYPV8gitVbSlLHm8FVvTamORR5X4bg9d/5f7nL+8YCH0PRphy6da8pe4Eydnl
         mbq4eTRrATjShBNuEyPAykAOnJ4znmPBNPGooJHuJEonpQLA7XTbuu5ydAq32/ASYdQy
         qmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711177041; x=1711781841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GKCVRFmyD2SpZhY5NTKneTezF4EWiDb4fzRSFXOBbw=;
        b=acEVU1duTeMr0WTHRLDn2e8SMBV2kliuWv/JkBjhYipMUTy526DLSrbkBSkmP3MDNc
         6rdHO2zy/W7/P3AYpLH+5mbmjqKOoOcjQ5SRaTju6g8YS5JgdwucjXz/tYu7CB1CfQE4
         cZvdBesjkcrE+GZwqjyMshwhGCyvsPGwMOfb09iR1bMEsMDFTqaibN9VE1ctJpkm1ijw
         ThtZLi0N2+Ftt/aAUoeirS98VRSVTzYxMo5g0mv+hJ+ZO6WBBb83g2H1CTXmebUMzd42
         bKT60WRB5G+b/3rx35uQopvh2stwusAQCor9obwQBX/1SUaUpZPQ3R6w8Ju95UCeXDfS
         bcdg==
X-Forwarded-Encrypted: i=1; AJvYcCXo7XnrQ/9tTvQTFbk9Fa0gvliIwn8m699QknUxUXl3k1zB3rS/Q7X1PvlcZ3kaSlx68iAkYCAKbmj+NhQHOZaqV4Yd3jEQEoAZ2iRX6n6Hf4UKTRbS7nI5
X-Gm-Message-State: AOJu0YyOgW6LIviTpoZVfXe1dfDuaSlT1Vd0cqHI6E/fc4p0pMioKQ+X
	+UJOIVw0rUeQ9Y3dbDVJbushc913i+rDM5/P/FjNtLCHDMUF4FK3PWC1nvkGzW3GpXccGPZv1S8
	IPYEw3kJGZiSo3V3yDVK+m+4rqDLx7cstaxY=
X-Google-Smtp-Source: AGHT+IFBCKpnOcE6rxbHOmIY4IvevLcSQailyxCLgAw7BOBSoKL5uRwnC7fFJV25JKVVBh3Zp67mPBckdwWRRSgd7Ao=
X-Received: by 2002:a05:6820:2007:b0:5a4:2b8d:d642 with SMTP id
 by7-20020a056820200700b005a42b8dd642mr1974982oob.7.1711177041227; Fri, 22 Mar
 2024 23:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <CABKMkPKN__Jh6jvc_CfHtwp3HGbRsBJ3YxHxGb1RPPN2WWqRMw@mail.gmail.com>
 <20240321220849ed4253c3@mail.local> <CAMKF1srrNXOGk8E1wzdDeRVtxmdu1sQrHpnFJA3zTs-cQA7NSQ@mail.gmail.com>
In-Reply-To: <CAMKF1srrNXOGk8E1wzdDeRVtxmdu1sQrHpnFJA3zTs-cQA7NSQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Mar 2024 23:56:54 -0700
Message-ID: <CAMKF1sp4jpg2fhWLXzvQG0+rizoK_1Hb_08vXiCTWhYUB_D5Yg@mail.gmail.com>
Subject: Re: [OE-core] [master] riscv: libcamera stack smashing detected
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Joel Winarske <joel.winarske@gmail.com>, 
	OE-core <Openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Mar 2024 06:57:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197451

Joel, please test the patch I posted to oe ml which should hopefully
fix the problem you are seeing on rv64 Let me know if it is working or
not working for your use case.

https://lore.kernel.org/openembedded-devel/20240323065503.4149463-1-raj.khe=
m@gmail.com/T/#u

On Thu, Mar 21, 2024 at 3:15=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> yes I am aware of it.
>
> On Thu, Mar 21, 2024 at 3:08=E2=80=AFPM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > Hello,
> >
> > This report should have gone to the openembedded-devel mailing list as
> > libcamera is in meta-oe. But I guess Khem will have a look anyway.
> >
> >
> > On 20/03/2024 09:10:05-0700, Joel Winarske wrote:
> > > In master there is a problem running the libcamera "cam" app on a RIS=
C-V
> > > device:
> > >
> > > *** stack smashing detected ***: terminated
> > >
> > > If I remove the patches in the libcamera recipe, it builds and runs o=
n
> > > target without issue.
> > >
> > > libcamera bug has the details:
> > > https://bugs.libcamera.org/show_bug.cgi?id=3D214
> > >
> > > Joel
> >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#197371): https://lists.openembedded.org/g/openemb=
edded-core/message/197371
> > > Mute This Topic: https://lists.openembedded.org/mt/105047726/3617179
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [alexandre.belloni@bootlin.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

