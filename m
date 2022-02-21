Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C79EC433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 15:55:26 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web08.406.1645458924748928410
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 07:55:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XbpWnnL4;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id f37so19420284lfv.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 07:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z/sCOzH89n6OwYYZUu8WdnUPEFlBmea+hZGE1E5vK/w=;
        b=XbpWnnL4oWP9Cmcw2yRfMPxrnRgQnCRLieUYgSXJapykxUEqwdNAeCecDXRN6blTFV
         6x5fDGsBHEiGs2CSSzuvicKKLxN8DcnyXtk4SDdckA6M1d2bQDuAOAU5ULT6Bac5FvNh
         izP2erj3unK1jrP4tOVTk3hQOY8ai7wtDv0gYZWqhLf2lSMOWYhBVtbtW/hz6DJxG7e7
         60OjX9LVUM+CiS00zOgkUhqjcJPV8LpIU7bHPT+2+zs26eQDg7xvnWJGj2fvBQECFl9p
         K+i0mfXqUnmdBpA8ZDmUDSIM42n+s7XSQOHEHRbUbgH+XZ6YcytMbhvjZCHAEEZhq24Z
         3I+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z/sCOzH89n6OwYYZUu8WdnUPEFlBmea+hZGE1E5vK/w=;
        b=6ryETX4h7Guq7zglKAEIoCAcu84v2qqzpuO0AfW9qc4OPHSiqlfr5j+3rtIcl8SKY6
         5TGzmHhK8y28ZsTEBeowuMJa1vdUEZRG26iS1XBq103DMzMLZJGRHZv7fOmTdWbyupzL
         A/TrI4ndNGVdCemhbQ8vuRQwnvCAulznQqUsBcCiKrMios0qJ7E94AaTtr89BdR5yrtw
         en94cnqEHqV/DeBKCKHh5RlezxczbIVrrECuq8VAFM3XdZd4TwUTpQwZRmryVZbTrSKB
         yJxXhBpzspIYoCaLhZz70+gUf9aYuIV7PIYGQFNnWl+EWCAbkYXSgB5bUghevsbL62wV
         t3eQ==
X-Gm-Message-State: AOAM531bJQE5RaxJFZK+AkSo/O7QGEDaUqMhciH6gp0VQC1ZziG5gMo5
	LR1z9miV/QmWeQak38fBpJjrkF5Njh8zNVP3nIk=
X-Google-Smtp-Source: 
 ABdhPJxph8fwvEHkHI/XgrfNfmk/xPvgvgymTrNOqd9jQe+6pxGnAymlf3SxiwJn7aRPilhrXJjaCxjQDsqyP8vfLnA=
X-Received: by 2002:a19:6b15:0:b0:443:b6ae:2ab7 with SMTP id
 d21-20020a196b15000000b00443b6ae2ab7mr11279879lfa.555.1645458922929; Mon, 21
 Feb 2022 07:55:22 -0800 (PST)
MIME-Version: 1.0
References: <20220221085118.2267900-1-quaresma.jose@gmail.com>
 <CAAnfSTuxOD2LVkod3wTk7K=w_Q_6KjbYoa_-FqD1WHy0hqy0jA@mail.gmail.com>
 <CANPvuRm1t9fn1Voa=yLL+MPogq2nGDu51AEEyubCxOwMY3j=ag@mail.gmail.com>
 <CANNYZj8EuqEdU9A4397BemMWtiqNmZ1yZmV9hwzT3PS8k4pZjA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8EuqEdU9A4397BemMWtiqNmZ1yZmV9hwzT3PS8k4pZjA@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 21 Feb 2022 15:55:13 +0000
Message-ID: 
 <CANPvuRkgwwdEs48khk3zUvACw9xgQJS6xWX7cOd=_iuKr_H+MQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] meson.bbclass: add support for running
 the meson tests at build time
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Ross Burton <ross@burtonini.com>,
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000098040405d889421f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 15:55:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162057

--00000000000098040405d889421f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia segunda,
21/02/2022 =C3=A0(s) 15:30:

> On Mon, 21 Feb 2022 at 16:00, Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> > It works on pulseaudio that has only one test and some others that I
> don't remember now,
> > but the tests run successfully only when there are few.
> > I use it extensively with gstreamer and the failures is mainly because
> of files that are not
> > found inside the qemu user mode.
> >
> > I think that this feature is useful for some other people, it helps me =
a
> lot in debug some tests in gstreamer.
> > Anyway the feature is disabled by default so for sure it will not
> introduce any regression on OE-core.
>
> What prevents you from running the tests in the target image with full
> system qemu?
>
> Alex
>

Nothing and this is the supported and tested way for running the test with
PTEST.

It can be only a different workflow, afaik for run the test with system
qemu we need to:

1) build the recipe with the tested code
2) create an image with the test that will run installed
3) launch the image with runqemu
4) run the test

With this approach we only need:

1) bitbake recipe

Jose

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000098040405d889421f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Alexander,</div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">Alexander Kanavin &lt;<a href=3D"mailto:=
alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; escreveu no dia segu=
nda, 21/02/2022 =C3=A0(s) 15:30:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Mon, 21 Feb 2022 at 16:00, Jose Quaresma &lt;<a href=3D=
"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com<=
/a>&gt; wrote:<br>
&gt; It works on pulseaudio that has only one test and some others that I d=
on&#39;t remember now,<br>
&gt; but the tests run successfully only when there are few.<br>
&gt; I use it extensively with gstreamer and the failures is mainly because=
 of files that are not<br>
&gt; found inside the qemu user mode.<br>
&gt;<br>
&gt; I think that this feature is useful for some other people, it helps me=
 a lot in debug some tests in gstreamer.<br>
&gt; Anyway the feature is disabled by default so for sure it will not intr=
oduce any regression on OE-core.<br>
<br>
What prevents you from running the tests in the target image with full<br>
system qemu?<br>
<br>
Alex<br>
</blockquote></div><br clear=3D"all"><div><div>Nothing and this is the supp=
orted=C2=A0and tested way for running the test with PTEST.</div><div><br></=
div><div>It can be only a different workflow, afaik for run the test with s=
ystem qemu we need to:</div><div><br></div><div>1) build the recipe with th=
e tested code</div><div>2) create an image with the test that will run inst=
alled=C2=A0</div><div>3) launch=C2=A0the image with runqemu=C2=A0<br></div>=
<div>4) run the test<br></div><div><br></div><div>With this approach we onl=
y need:<br><br>1) bitbake recipe</div></div><div><br></div><div>Jose</div><=
div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D=
"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></div>

--00000000000098040405d889421f--

