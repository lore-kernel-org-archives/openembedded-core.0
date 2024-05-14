Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A23C04FFE
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 15:54:04 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.19571.1715702043202738496
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 May 2024 08:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AJueKjVl;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-51f74fa2a82so6841844e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 08:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715702041; x=1716306841; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cX8hrkJULULgnMEvFg5NEaHXqOCtkKj4/TX98zyCETQ=;
        b=AJueKjVl9x3HItBcv/NP2UgOtB/Uaw5nrosp3BSWg4bqeESs45BfIb62gMJwl/W1IE
         i4T3xfzDMeK9UTqjZmiI+zF7vugkzFpsHyCATi6Em3PogQSM12CaImQeT03c/zeC7CGe
         J3sJpsMzwi/qEUIQ+gPtgS00HZQfgPqtRHlVgk5gQfygaYh+fKX5jqnlsP6c9z/orATq
         iOWCiWE9wzQBYPZTMFpkUGs/pdkW3HBeSw6Nvp/l7jo12B36MKmQdFU3PPVXH1joPNmm
         1Nk0enqyfmqH9+jNfAc5He7Dns+d/kb/48G95AaPu98YNa3qoR4JOh8MRsnBqeHzEtDQ
         54cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715702041; x=1716306841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cX8hrkJULULgnMEvFg5NEaHXqOCtkKj4/TX98zyCETQ=;
        b=MfVTCSsAFxtbL9CNVYubFM72DW17zKeIj4CRPtnBAKWhxO5QGln9YgralA5C1ek3Hp
         Jn94/coMog+Yl+drmd21eBbNvqB2YYR2ZiXFRKaQplMct2F78uxJkp0RUmErjZxJkBAu
         kXBw5PYSICIb70OquwDFIT9CgtOM30FqJIdiItmLItt4suHIJFgFtymc1l1kbSkB6qcx
         UDzwCCNnVsKXKYULyldvGcB7/E4nsKaSWbAgcq5K7Ug3r/ENCzELD2Cn6NqOYeJeTGfc
         83sVLpD4UM7rdQy1Q8bZDZa1pmqWdMs2sAj3s8CRPz2bjQ0dPMRiAnrTxwEyxmAzT2ag
         fZZw==
X-Forwarded-Encrypted: i=1; AJvYcCXnxq1qdXEHuXu8H/I3QIAX3fTxFvOFd9NLd42DH8UJBVm9989mmxJgy86/2tpEPA3CQVBi1amlbJZoUKonQjpm3Ltpt8KSpxavJ3B5L6ogXFlv63ql5RUh
X-Gm-Message-State: AOJu0YxHc4xUc+GCyINbgQCHXz7uWwsnPe96DQw6UpIzdg9DKN+mjilO
	F9utMEGtzrePxLUJ32xnK+/8IDweDob/n4qhRMWOyS1mASwtlrr43bbQCtR4rObS7qyiGMMoiCd
	Q5VGSy+SIDSNXqGarrEUu1W2ubYY=
X-Google-Smtp-Source: AGHT+IHRz0C5Cy0/SbYonu6v0BRvHiCdJnK+16HauX5WZTgJJVAZJUFqj5H0xrlzOup8ojisSCzA5YlheC4cP8aD5YU=
X-Received: by 2002:ac2:5457:0:b0:523:8a79:21b with SMTP id
 2adb3069b0e04-5238a790e3fmr38239e87.11.1715702041106; Tue, 14 May 2024
 08:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240507053320.1566814-1-raj.khem@gmail.com> <20240507053320.1566814-7-raj.khem@gmail.com>
 <CANNYZj_w95u_j3XTgAMzHJ3_dYKyBzqL4tj6V3pS=sAXFjyP_g@mail.gmail.com>
 <CAMKF1soraS1+kfj9jkSqOo6LiaZnOOqzj9PimZXssfDu0kuHqw@mail.gmail.com>
 <CANNYZj_dZEQgVtihxZ-PtiBHBB44OqMF7ebLKQTEg7Bt+rrJCw@mail.gmail.com>
 <bccbb448-10d9-48e8-9b9a-72de5b7d9072@windriver.com> <CAMKF1soLPQ4y85_VYZNbTDU7joD8MX+iLx82c8jJ5cDRXk+sdg@mail.gmail.com>
In-Reply-To: <CAMKF1soLPQ4y85_VYZNbTDU7joD8MX+iLx82c8jJ5cDRXk+sdg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 May 2024 17:53:49 +0200
Message-ID: <CANNYZj-yQ9KtQMyXTJepyntxMgXE5Th8Vcs3PyCZpLVu1e9UFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 07/11] kea: Remove -fvisibility-inlines-hidden
 from C++ flags
To: Khem Raj <raj.khem@gmail.com>
Cc: Randy MacLeod <randy.macleod@windriver.com>, openembedded-core@lists.openembedded.org, 
	Martin Jansa <martin.jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 15:54:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199263

Can you also try webkitgtk please? It's directly in core, no extra
layer or special setup needed.


Alex

On Tue, 14 May 2024 at 17:43, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, May 14, 2024 at 8:25=E2=80=AFAM Randy MacLeod
> <randy.macleod@windriver.com> wrote:
> >
> > On 2024-05-07 3:56 p.m., Alexander Kanavin via lists.openembedded.org w=
rote:
> >
> > On Tue, 7 May 2024 at 18:13, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Firstly I am inclined towards removing it if we can, since I think it s=
hould be
> > packages to decide to use it, then they can maintain it better from tes=
ting POV,
> > However, there is something
> > to consider w.r.t. to this option. This does help in optimizing loading=
 DSOs
> > by reducing the number of PLTs and improves loading time for DSOs which=
 might
> > be quite meaningful for embedded devices that we target. However, we on=
ly
> > enable hidden visibility only for inlines so it won't be full benefits =
but we do
> > have better default compatibility.
> >
> > Since we have had this option for a long time and it still seems
> > relevant, I would
> > think it would make sense to do some benchmarking on a sizeable C++ pro=
gram
> > perhaps chromium or webkit, and see the difference in DSOs sizes with
> > and without
> > this option and also benchmark the loading time of the resulting
> > chromium package.
> >
> > maybe we will find that the gains are not as significant, in that case
> > we might drop
> > it from defaults.
> >
> > I digged deeper and this is where I think it originated:
> > https://git.openembedded.org/openembedded/commit/?id=3Dddd6d1fd26416a37=
66d754eeda4237a680a65520
> >
> > Ah the simpler times of oe-classic, when one could bundle four
> > unrelated changes into one commit and explain none of them.
> >
> > Benchmarking I have no time for right now, just wanted to point out
> > that adding the flag was never justified in commit log. Can you
> > experiment with webkit?
> >
> >
> > I tried to build chromium with and without this flag but ran into build=
 problems - sigh.
> >
> > I pulled out the next most-bloated single executable that I could think=
 of: nodejs
> >
> > The bottom line is that the flag reduces the nodejs executable size  by=
 ~6%.
> > Actual sizes:
> >
> > >>> 37333922 - 35245092
> > 2088830
> >
> > so 2 MB out of 37 MB !
> >
> > Chromium has been updated over the weekend so I'll try that next.
> >
> > What else would people like to see to assess the utility of this compil=
er option?
> >
> Thanks for taking this up.
> I think chromium and nodejs are large enough packages to give us a
> good idea of its benefits.
> We should add a comment to config files where this option is added for
> future reference.
>
> >
> > ../Randy
> >
> > Original build:
> >
> > =E2=9D=AF size ../chromium-poky-m-aab1335523/tmp/work/core2-64-poky-lin=
ux/nodejs/20.12.2/packages-split/nodejs/usr/bin/node
> >    text    data     bss     dec     hex filename
> > 35245092         628548  154792 36028432        225c010 ../chromium-pok=
y-m-aab1335523/tmp/work/core2-64-poky-linux/nodejs/20.12.2/packages-split/n=
odejs/usr/bin/node
> >
> > With this patch:
> >
> > =E2=9D=AF git diff
> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.12.2.bb b/meta-o=
e/recipes-devtools/nodejs/nodejs_20.12.2.bb
> > index d86c38f2f..50cff533f 100644
> > --- a/meta-oe/recipes-devtools/nodejs/nodejs_20.12.2.bb
> > +++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.12.2.bb
> > @@ -42,6 +42,8 @@ S =3D "${WORKDIR}/node-v${PV}"
> >
> >  CVE_PRODUCT +=3D "node.js"
> >
> > +CXXFLAGS:remove =3D "-fvisibility-inlines-hidden"
> > +
> >  # v8 errors out if you have set CCACHE
> >  CCACHE =3D ""
> >
> >
> >
> > =E2=9D=AF size tmp/work/core2-64-poky-linux/nodejs/20.12.2/packages-spl=
it/nodejs/usr/bin/node
> >    text    data     bss     dec     hex filename
> > 37333922         628548  154792 38117262        2459f8e tmp/work/core2-=
64-poky-linux/nodejs/20.12.2/packages-split/nodejs/usr/bin/node
> >
> > =E2=9D=AF python3
> > Python 3.10.12 (main, Nov 20 2023, 15:14:05) [GCC 11.4.0] on linux
> > Type "help", "copyright", "credits" or "license" for more information.
> > >>> 35245092.0/37333922.0*100.0
> > 94.40500786389386
> >
> >
> >
> >
> > Alex
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#199104): https://lists.openembedded.org/g/openembed=
ded-core/message/199104
> > Mute This Topic: https://lists.openembedded.org/mt/105955497/3616765
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
> >
> > --
> > # Randy MacLeod
> > # Wind River Linux

