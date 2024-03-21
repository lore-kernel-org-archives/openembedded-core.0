Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7913C54E58
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 22:16:05 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.10598.1711059363350799858
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 21 Mar 2024 15:16:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=js4BfCty;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2282597eff5so1033916fac.3
        for <Openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 15:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711059362; x=1711664162; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PL70/O3ID+Vo/w4nINk45e1oA7srrzTqVRU4k7rBKVg=;
        b=js4BfCtyWLXjEVtVrh71vHQlxsknMRglHic0wMHTYdosyVfOBI4pU3sNhcxUcnRVnJ
         SpEemab1h/Mcp8qWvNacZoeGuRVyr7Q9mPd+tbvxLKG9p2V2zNn3gtQIxi8KQep1qFuo
         LhR62hedgxBFnvlhvK/S1hfFVBMk2AwJhFbut3Qgujm4J5252cF83gPlFS6YgJWoIxcj
         0VfNokF5GWFZK1bxo48aSbF2P1CV7MXy1lVtSvvFO7MzpzQxxWYCAQm1Xpeh1aN/6FdM
         r5Jq2CJkQ5OXNZxpVN35m9V17IAIUYoAe2KlgOBnnmWSD0xtszsZWOdrxwM/yFmM9nZK
         Wsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711059362; x=1711664162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PL70/O3ID+Vo/w4nINk45e1oA7srrzTqVRU4k7rBKVg=;
        b=M8ze09KYXU+Yo4Hvx1TJP4emH5cvUnoh5euc3EEJkvN4qIAy6/OTvYT1ZmQ9zDmtCn
         esTRaUAqq2qZ/tSS9XAw9RJ4+hMx57+t1WInsHl5Pu5Xau0AwADo40zk4hARBaO7dt3o
         +dH2NSB0278KRkbxll52h0bo6qb1pdp43rSrCgzaTM4oADarEmAxRpW67XdNXAVs5Ov6
         12XRLvVW/Fz2UYqV+etHBIWYH4an7XAfrGZRUOJUQ670obE47CsjVXu0IN6KGiNuR003
         mDbx3e3hS4g2BBtlMNsqmUDg0A6DRJOBL6lvF1As8OZsJLtEG3QHY7ESqRrJn0xI/hSy
         sjjw==
X-Forwarded-Encrypted: i=1; AJvYcCXRQtWGeUDzqutKmEb7QCTJqHreZui8+AhlPPot/LdOPgLKrOLUmL7uh71sapiv1lynM1Z6Y14fNUYJjwDAii2FbnU791ItTJKJWlF+yks6j9xjdvb/sBof
X-Gm-Message-State: AOJu0Yw5z45tjyLw1/F6sTAmkjzx9kMYW5JbMwxVcDrue1ReM9Jb4q4w
	yekyiBSdDkjaq+3uwmi02YkBJDeu9LrmejNzeVrqiO58VqPYWdpUKmgN3ZwhorQz4LHF0CHlI60
	29R4VlsLHNUzgwkNNNgk1Z1WGLss=
X-Google-Smtp-Source: AGHT+IGcyOluSU0oBQ2dlTIWwuZINXx5hvmJ5q83XjT24usok1Ou7GTCqv6xCw0DbSfsCW2mY412c66LnKIINo+ilaE=
X-Received: by 2002:a05:6870:1643:b0:229:c76b:4927 with SMTP id
 c3-20020a056870164300b00229c76b4927mr537554oae.56.1711059362183; Thu, 21 Mar
 2024 15:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <CABKMkPKN__Jh6jvc_CfHtwp3HGbRsBJ3YxHxGb1RPPN2WWqRMw@mail.gmail.com>
 <20240321220849ed4253c3@mail.local>
In-Reply-To: <20240321220849ed4253c3@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Mar 2024 15:15:34 -0700
Message-ID: <CAMKF1srrNXOGk8E1wzdDeRVtxmdu1sQrHpnFJA3zTs-cQA7NSQ@mail.gmail.com>
Subject: Re: [OE-core] [master] riscv: libcamera stack smashing detected
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Joel Winarske <joel.winarske@gmail.com>, 
	OE-core <Openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 22:16:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197432

yes I am aware of it.

On Thu, Mar 21, 2024 at 3:08=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> This report should have gone to the openembedded-devel mailing list as
> libcamera is in meta-oe. But I guess Khem will have a look anyway.
>
>
> On 20/03/2024 09:10:05-0700, Joel Winarske wrote:
> > In master there is a problem running the libcamera "cam" app on a RISC-=
V
> > device:
> >
> > *** stack smashing detected ***: terminated
> >
> > If I remove the patches in the libcamera recipe, it builds and runs on
> > target without issue.
> >
> > libcamera bug has the details:
> > https://bugs.libcamera.org/show_bug.cgi?id=3D214
> >
> > Joel
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#197371): https://lists.openembedded.org/g/openembed=
ded-core/message/197371
> > Mute This Topic: https://lists.openembedded.org/mt/105047726/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

