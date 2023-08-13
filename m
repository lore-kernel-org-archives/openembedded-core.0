Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F47C001DB
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 15:10:17 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.86814.1691939415952953494
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 08:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=GMGJVuAf;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-647161eaaebso1733556d6.2
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 08:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691939415; x=1692544215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FnMZpzFPmZiPsT3z41OiBMD+D4pdzeysaA+EkM8iePs=;
        b=GMGJVuAfX3xz7T3DZTPpi4HeMOdZbEmm/FujUYENQvbMQJwuoTWGKM8LCiCEFJPpWX
         wMXY8PjgJ+NMG2ZdBesvacBqOKDdciOZc9UqyxJtyeGI01W/4jLU4KADLwz7b48vaBxA
         aWVJOkYVI/FPXEsGLo7QIZg1KNXFxpkBeH0/IBXM2O0J7MwhFc4nfNfK62dYQHBpBbfn
         dSt7TQ5pCrg2MmsJ7ecmKjHZDocCGFaWnorMOXiWDqas3lrX8vxfQd2l5W0FipANc4G4
         i7uEJFfqu37j9DeAlTd7jfccTo5DSItYXcrzRdbAA99c+51Y0C8v/dfoRpoUdv5GEizG
         vkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691939415; x=1692544215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FnMZpzFPmZiPsT3z41OiBMD+D4pdzeysaA+EkM8iePs=;
        b=BpLXjPH99BwAA/MsfVz9GDxvVx4A5cqJmHDDmiImmhIgnqt2b8AccHvA3GQdfQqcq8
         oPzpKsNeVDkznokxwB7ypKsP24zLVDGbtQ/8rhKV1yndZn5SmOjSs/rGOKTgHVvoVzCn
         IaDTdgF9rZ8rrnZrATjj9gDS2B991gjnhOQMhVpOJLo5aPb2cKaUlWxf0SACebs9ojHe
         fTNgU1dDZDABMEwhE1mOX+63SsN6yw4GEj2hVoaCWyM9KrNd50JFUq67qB1cGKsBOsfN
         Ws92MSei4SQAOJQxOjbwe9af4lOE0gohq/rDCCEzFpNwpS5zULmRNFHrKauQggpRIn6m
         T+aw==
X-Gm-Message-State: AOJu0Yx+KxEUs0Xkn4w1ninb9jf+tRXrY/RYhpYrvSP1D6dUunY+aeuG
	wMdMVezogBJkUoeQsAj53yo0oMXnPCXw0PoEJGM=
X-Google-Smtp-Source: AGHT+IExl2A+B2ZPa9jlzFLAq0JcwqBpbuMfOe9yBbHYdPvgSc0iepnLYlfnfKUaXDArtc9MN4b56tbJOibYIgA8s+I=
X-Received: by 2002:a0c:a9cc:0:b0:636:39ed:4dd9 with SMTP id
 c12-20020a0ca9cc000000b0063639ed4dd9mr6937818qvb.23.1691939414973; Sun, 13
 Aug 2023 08:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1691914589.git.frederic.martinsons@gmail.com>
 <c4d2d924272d180ed88076e61dc59abc71d227f0.camel@linuxfoundation.org>
 <CA+cAkeptfJVB=EzEm46898iXjnNodr7Ct9TzQ7FycOkCkiA0_Q@mail.gmail.com>
 <177AED879B83B027.8497@lists.openembedded.org> <177AF35A822C5F89.12117@lists.openembedded.org>
 <89d5c672b989d1ac30a10093c89227da182748e3.camel@linuxfoundation.org>
 <CA+cAkeqexEemD1vcRoVOdha8e32Wfzr-9-5z-xU3enC_Y41QoQ@mail.gmail.com> <843d59933f8943bfa78919faf608a7b0feaf3dce.camel@linuxfoundation.org>
In-Reply-To: <843d59933f8943bfa78919faf608a7b0feaf3dce.camel@linuxfoundation.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Sun, 13 Aug 2023 17:10:04 +0200
Message-ID: <CA+cAkepBeBiGwp1cTbBE3LvaEX7RuGiCedtnbQCjUZiy1Rg2TQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCHV2 0/4] Introduction of cargo-c class and recipe
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cfa1c00602cf57be"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 15:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185890

--000000000000cfa1c00602cf57be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 13 Aug 2023 at 17:05, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2023-08-13 at 17:00 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> > On Sun, 13 Aug 2023 at 16:53, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > and a reproducibility failure:
> > >
> > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3355/s=
teps/13/logs/stdio
> > >
> > > which leads to:
> > >
> > >
> http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230813-z_b2j=
3ha/packages/diff-html/
> > >
> >
> >
> > Argh, this makes me remember
> > of https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15090
> > Do you know if any of cargo based recipe is reproducible ?
> > Should I add EXCLUDE_FROM_WORLD in cargo-c ?
>
> At some point we're going to have to dive in and fix the
> reproducibility issues so I'm reluctant to take more patches with that
> set...


I understand, in the meantime, I issue a simple bibtake cargo-c and see
these (along with the missing SUMMARY):

 WARNING: cargo-c-0.9.18-r0 do_package_qa: QA Issue: File
/usr/bin/.debug/cargo-cinstall in package cargo-c-dbg contains reference to
TMPDIR
File /usr/bin/.debug/cargo-cbuild in package cargo-c-dbg contains reference
to TMPDIR
File /usr/bin/.debug/cargo-ctest in package cargo-c-dbg contains reference
to TMPDIR
File /usr/bin/.debug/cargo-capi in package cargo-c-dbg contains reference
to TMPDIR [buildpaths]

I guess this doesn't help to be reproducible, I'll look at those soon.

Sadly, I didn't see any of these warnings during my tests, I just have to
look sharply for the next time.

>
>
Cheers,
>
> Richard
>
>
>

--000000000000cfa1c00602cf57be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, 13 Aug 2023 at 17:05, Richard=
 Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.p=
urdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Sun, 2023-08-13 at 17:00 +0200, Fr=C3=A9d=C3=A9=
ric Martinsons wrote:<br>
&gt; On Sun, 13 Aug 2023 at 16:53, Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; and a reproducibility failure:<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/117/builds/3355/steps/13/logs/stdio" rel=3D"noreferrer" target=3D"_blank"=
>https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3355/st=
eps/13/logs/stdio</a><br>
&gt; &gt; <br>
&gt; &gt; which leads to:<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"http://autobuilder.yocto.io/pub/repro-fail/oe-reproduc=
ible-20230813-z_b2j3ha/packages/diff-html/" rel=3D"noreferrer" target=3D"_b=
lank">http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230813-z=
_b2j3ha/packages/diff-html/</a><br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; Argh, this makes me remember<br>
&gt; of=C2=A0<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=
=3D15090" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoprojec=
t.org/show_bug.cgi?id=3D15090</a><br>
&gt; Do you know if any of cargo based recipe is reproducible ?<br>
&gt; Should I add EXCLUDE_FROM_WORLD in cargo-c ?<br>
<br>
At some point we&#39;re going to have to dive in and fix the<br>
reproducibility issues so I&#39;m reluctant to take more patches with that<=
br>
set...</blockquote><div><br></div><div>I understand, in the meantime, I iss=
ue a simple bibtake cargo-c and see these (along with the missing SUMMARY):=
</div><div><br></div><div>=C2=A0WARNING: cargo-c-0.9.18-r0 do_package_qa: Q=
A Issue: File /usr/bin/.debug/cargo-cinstall in package cargo-c-dbg contain=
s reference to TMPDIR</div>File /usr/bin/.debug/cargo-cbuild in package car=
go-c-dbg contains reference to TMPDIR<br>File /usr/bin/.debug/cargo-ctest i=
n package cargo-c-dbg contains reference to TMPDIR<br>File /usr/bin/.debug/=
cargo-capi in package cargo-c-dbg contains reference to TMPDIR [buildpaths]=
<br><div><br></div><div>I guess this doesn&#39;t help to be reproducible, I=
&#39;ll look at those soon.</div><div><br></div><div>Sadly, I didn&#39;t se=
e any of these warnings during my tests, I just have to look sharply for th=
e next time.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
=C2=A0<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div></div>

--000000000000cfa1c00602cf57be--

