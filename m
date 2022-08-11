Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD96C25B06
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 15:41:40 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web09.7922.1660232496011822469
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 08:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jjFgNK8u;
 spf=pass (domain: gmail.com, ip: 209.85.208.182,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id bx38so19670101ljb.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 08:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=3ra7BiYRoASLgZve3cAiAKGulHO1BNSrzQSHVxy3dJA=;
        b=jjFgNK8uov4y2CU3kBjCsRtEHLDZ8igQzGj9NuQvqOegfClzlOaetdUUFi1ychFpwf
         00VyACfheiSpLuwfFQturqUR3eXwVTBxcvC0j/PiCkE5uDsA1xu9jQtIhMSx2m3p5znQ
         9b48rMH4we5Wc6MoQVSvghfjENVuxHA7SHnhqFIviiSASTGHrJBtKJefY1U9Lw/+CzcT
         wBv7VpYdRHWhJAZRLyO9fM6vlWaUbGzgFY/HSeeqIRAwY9HkaJjov/yZGIZf+QRkK+IS
         tqgVK3Yob9ndg4Vvt5ZoRvsFgO/yja8OJgTXeJpAfc0xdNwaq/akiAZiQUqAfiI+i8Dl
         i8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=3ra7BiYRoASLgZve3cAiAKGulHO1BNSrzQSHVxy3dJA=;
        b=lLpzjnn7ERkGGh0DcPgmgDvq19iGD6dwelEkiDnvyl0r6CC2mm0HOhpb5mB/vF8gWw
         11KSlIMHYHHVe2qZGKIuD64vM5Yax85zHO2DZR81QrQ2n6mG+pVmGvyEU5HHTq7MFTR8
         F2qdd0DKhEzYAnEkJGg9gA8JExCzel9cF9HNq79Okcl4BehKvOpA7G8Xr7hAGDU6yI4t
         pvvCHMytDk/CFphrmsYDIeOi6l7UhIEMfZilDiBo+oBv7Xd3Rko+h8VRHOkARehtW3Nw
         sEw5O4TURA2QqveZ8zMM0m1gg7Qv0cMTLzf2lFLGdt35onIq6JSxI2Od/dqT+ESJZ3/v
         7nTg==
X-Gm-Message-State: ACgBeo0KYe00ojx2rzLo6j3gmHlifIr1jzM8j4aI6BsELhP7V4Xxgrwa
	r3JTuO8flCh6eQEOvqetkhdecPNtIoxHRYtRxpI=
X-Google-Smtp-Source: 
 AA6agR6e76WB6XWsP0a4aAfP/rTwtgdLQhx20UK1vcm0mgShGvX3vmeJbKb2LtbzCOklQORYl4Mq9OJS1R4te7w47V0=
X-Received: by 2002:a2e:3a09:0:b0:25e:4212:5628 with SMTP id
 h9-20020a2e3a09000000b0025e42125628mr9810778lja.68.1660232494199; Thu, 11 Aug
 2022 08:41:34 -0700 (PDT)
MIME-Version: 1.0
References: 
 <5c34f311-8120-42a8-bfe7-18c90a5fabd6@denue6es010.ebgroup.elektrobit.com>
 <CANNYZj_6O9M+VC+1Z3YLFwqppQR3Ns8d9P523JuAjiM-mh33RA@mail.gmail.com>
 <2465e917a63704c5acf072d6c9183f9a8e1d25b3.camel@elektrobit.com>
In-Reply-To: <2465e917a63704c5acf072d6c9183f9a8e1d25b3.camel@elektrobit.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Aug 2022 17:41:22 +0200
Message-ID: 
 <CANNYZj8yGefw7sniQeTfaU4XnHOtD_wJF0Q7Gv+NTcrmiVAyKw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] json-c: Add ptest for json-c
To: =?UTF-8?Q?Wei=C3=9F=2C_Simone?= <Simone.Weiss@elektrobit.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	"Tomerius, Kai" <Kai.Tomerius@elektrobit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 15:41:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169249

Just to be sure, did you use qemu with kvm option? I find it odd that
json library tests would take this long. Can you double check what
they do? We can't afford to extend ptest run time indefinitely, it's
already close to 4 hours.

Alex

On Thu, 11 Aug 2022 at 17:26, Wei=C3=9F, Simone <Simone.Weiss@elektrobit.co=
m> wrote:
>
> Hi,
>
> For me it took around ~500 seconds. I considered it as slow, as
> `PTESTS_FAST` should take around ~30 seconds according to the comment
> on ptest-packagelists.inc.
>
> Simone
> On Thu, 2022-08-11 at 10:23 +0200, Alexander Kanavin via
> lists.openembedded.org wrote:
> > CAUTION: This email originated from outside of the Elektrobit
> > organization. Do not click links or open attachments unless you
> > recognize the sender and know the content is safe.
> >
> >
> > On Wed, 10 Aug 2022 at 21:40, Simone Weiss <
> > simone.weiss@elektrobit.com> wrote:
> > > --- a/meta/conf/distro/include/ptest-packagelists.inc
> > > +++ b/meta/conf/distro/include/ptest-packagelists.inc
> > > @@ -87,6 +87,7 @@ PTESTS_SLOW =3D "\
> > >      findutils-ptest \
> > >      glib-2.0-ptest \
> > >      gstreamer1.0-ptest \
> > > +    json-c-ptest \
> > >      libevent-ptest \
> > >      libgcrypt-ptest \
> > >      lttng-tools-ptest \
> >
> > How long do the tests take to execute? Do they have to be added to
> > the
> > slow list?
> >
> > Alex
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#169236):
> > https://lists.openembedded.org/g/openembedded-core/message/169236
> > Mute This Topic: https://lists.openembedded.org/mt/92944223/6639279
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> >  [simone.weiss@elektrobit.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

