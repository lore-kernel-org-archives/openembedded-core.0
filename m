Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C183CEB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 20:12:36 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web11.523.1689883948339083357
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 13:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=JED1eMf/;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-78374596182so57662039f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 13:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689883947; x=1690488747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v676Thotvnz+usFXGI9dK8fR3vBqZ+n6e8JQtv8xp8I=;
        b=JED1eMf/W4HnAG5LZVp9DKqjZwUjhc5omM6b+NigdPU5Q2Ymm8D0NQifdn56hqkLxZ
         X25t3IHhqf6SsI4NKt1haHlTSOI/IZZzXQe3bIBz1lFDhdn8+7JXVJ7t3XAQn0O21OOb
         u5In67qPWKdknXeaXARfid5dNiCgj0ygyMm2aYnHsiTC6b8lIMc6935I8uYz3z+ws9aq
         HbbNcrhLTbR21nR2zQ+MD2GhnIbLCRo30bzmH/ph2+RnkMEw6Zl+/ca4V7VmjcBY/uc0
         Zw+Dk+x7MCv1cSjqQMsV2T7LJWsDbyFGgwy9zQQnEvovMswOc8nNdQRixBN2uLe1HSQy
         7lxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689883947; x=1690488747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v676Thotvnz+usFXGI9dK8fR3vBqZ+n6e8JQtv8xp8I=;
        b=jYIfaw44JpRFYUnKp3VEDDtQU/HFLuoq80qd4lsJKcRuWalBn6cRYshgRDsmHCFeUo
         N0SW+ee9DnnHNlBdmihkr9/xmYBbErBNY6VvSEQVnrnbM85IbeSGiDQeSUw7XR0+yVL2
         n9tPeojYHxE5yO/TRblslgqBdFsh8hwATzKoivGlXIICfc8QHf55lpV3o8l0V9E3BtdI
         s7CRuNCrqGedDiG9URH/9xCijm/WKJj+MKuqhjn4/Nv8MHaaQHQps1l0E5y+0JoJv4nb
         o4fyajLyyLQEQBhNvlN8ouq7E/J8oyCSYZiqPoeNWiAHlwgUdxJ1JfaHt5htJ0UXhLwE
         xLAw==
X-Gm-Message-State: ABy/qLbkiDX+vDNNJT0A8QbZ53jRF+O++32ocJ52ZkmAYZQUr2VF+c1O
	6ER26mxpOzAcX4DpXLnyK0fXYGcv1ljOUqqMZY0=
X-Google-Smtp-Source: APBJJlG5tzs0jDdWCi2sh50sw0V2Uw0JlBqI7Ws96ay/1V+D8mgyhDOy+1srfytQmq5QB8/LCFbqC6fqDLSXEfvO3U4=
X-Received: by 2002:a6b:901:0:b0:77e:3e85:34ee with SMTP id
 t1-20020a6b0901000000b0077e3e8534eemr8927769ioi.13.1689883947524; Thu, 20 Jul
 2023 13:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <TY2PR02MB367800CEED14B7DA7EE92C5F8139A@TY2PR02MB3678.apcprd02.prod.outlook.com>
 <CADkTA4O92vHqJbTEqUDPktnuaCp-vzskCZeb_5iqr5NmfGNONg@mail.gmail.com>
 <TY2PR02MB3678ED281AB36D9AB6CBA9C68139A@TY2PR02MB3678.apcprd02.prod.outlook.com>
 <CADkTA4OBjLFxO8x3X1tBvzwU9P=nFU4iVx-qgAphbrboqxu1nw@mail.gmail.com>
 <TY2PR02MB367838917BD294BF286FE226813EA@TY2PR02MB3678.apcprd02.prod.outlook.com>
 <CADkTA4P6NXH-7am1emePfWaZN43e58FsWe9_Rdj2_PdXD6b9RA@mail.gmail.com>
 <TY2PR02MB3678FC5D7379332D46E8A7EB813EA@TY2PR02MB3678.apcprd02.prod.outlook.com>
 <177395F667E9B0AB.1070@lists.openembedded.org>
In-Reply-To: <177395F667E9B0AB.1070@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 20 Jul 2023 16:12:19 -0400
Message-ID: <CADkTA4PpqL53dcwL_QKidp1so6pTYafGr59ufdFdLdprywhHhA@mail.gmail.com>
Subject: Re: [OE-core] make-mod-scripts doesn't know KERNEL_LOCALVERSION
To: bruce.ashfield@gmail.com
Cc: Petr Gotthard <petr.gotthard@advantech.cz>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 20:12:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184661

On Thu, Jul 20, 2023 at 9:19=E2=80=AFAM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Thu, Jul 20, 2023 at 9:16=E2=80=AFAM Petr Gotthard
> <petr.gotthard@advantech.cz> wrote:
> >
> > > My question was about CONFIG_LOCALVERSION_AUTO being something that y=
ou
> > > changed after the first issue popped up (I understood what it was cha=
nging from
> > > your first description) I can't clearly see if you turned it on in re=
sponse to the
> > > breakage, but I'm assuming that the answer is yes.
> >
> > Oh, sorry for the consuion. Yes, I changed the CONFIG_LOCALVERSION_AUTO=
 only to reduce the number of suffixes.
>
> Ack'd. Thanks for confirming.
>
> I'm coming up with something that will keep 6.3+ working, and not
> break older/existing recipes.
>

I have a fix under test. I'm just running into a bit of sstate
oddities that I need to sort out!

Bruce


> Cheers,
>
> Bruce
>
> >
> >
> > Cheers,
> > Petr
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184638): https://lists.openembedded.org/g/openembedde=
d-core/message/184638
> Mute This Topic: https://lists.openembedded.org/mt/100240236/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

