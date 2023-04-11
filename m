Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2ED2C76196
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 17:03:22 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.20257.1681232596984535586
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Apr 2023 10:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gkqDaXl7;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id bx15so7273710ljb.7
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 10:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681232595;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MAHAp0QEz1E/lbzNMkNMzby7uaH99x+wUoz7t1d74fg=;
        b=gkqDaXl77+wijj5egm0kcYHbg33fv1iZ/Vp3Id8mloAtGe/QlIgly/Ep8s6fBWyKUY
         A2L0THRK/Q+8Lg/nhPyqyU2Yv0pvNQds+9AK4VExFTYtRUXXAYL9AXBB6UjFF0WVKw+9
         pIIaJNKrkwy+PG2KGo9S/vhY0s3+4d2joKT1cpPD/uAwtCijLLC9Cr3mo5rENcHi3soB
         ctHHcLN0yGjAIyLymC6z57zXQva6NN1OJV4fFN0kyN2vJLMQa25VEAEDWmYM3/Xdz4ff
         RunbpkncCKN3xoQgEmpKNUH5UUSrKRHYVLzVcE2X66W/y7AwhvpqdKWsw5wpremvm/Dj
         bn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681232595;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MAHAp0QEz1E/lbzNMkNMzby7uaH99x+wUoz7t1d74fg=;
        b=hPn54k8NJUVfNZTVwLCTpGGauwEzIjDpwAAX79zhMJ1P0rThM7qwm9DgeWFLZirBkC
         XJ66qNI9q9QGSUPE+PmwR4D6YItk4bTty62bdgvH7z0YjhHokm5GwTElSFHyiIrFn5Of
         +IMIJvrb+rpNw7omhpoyt2H/1DnLxlQNnd2W273RNgvc3BNOliv6IvZ6VxKTDxyZzQBR
         Wy1kK1Jm9jHVHV1jDrkorYz0hREc1I0eT1t8OSEOuAVgu6Rn9pRcdQy55vpCPeEmhAtW
         cWDarF5UO+Qj2X0ojQ6+ve3YGXC1xFrJoptdEaiDa9GV35bjBhJxrteatHtiDzBdfbC1
         drsw==
X-Gm-Message-State: AAQBX9c5CHgeho86pnsHN6HC018gfKzHG/FWiJ8t39QcntAhW6xB2mPF
	KOSJtFyJ4YnuL2qECdCPhkSOcj8Sm63wIUwQiLI=
X-Google-Smtp-Source: AKy350ZnJCn89h94P99akASI1kLDCujozgJgGlTRgvI7+q1GosUMUiKd95NcDFf/VRIACUkBO86Y7OhhMPuEEeK1pwU=
X-Received: by 2002:a2e:9d0a:0:b0:2a7:8607:2e64 with SMTP id
 t10-20020a2e9d0a000000b002a786072e64mr1272963lji.3.1681232594739; Tue, 11 Apr
 2023 10:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <1753B0402875C548.11304@lists.openembedded.org>
 <CA+cAkerWUvabx_kzN2s6S64454t88ifOR+nqtaLwk0wHfw3n2Q@mail.gmail.com>
 <6381549a7f058cb233c656dca9324ae4d7a435c2.camel@linuxfoundation.org>
 <CA+cAkerd92jAqwA1iDrNOV+W1mK5Tb39yvT_Dp-t18=LCNm09w@mail.gmail.com>
 <CANPvuRkfQuVdP-WJw58UOK9WVhy95UgujST4k6unnUvYQ7FySA@mail.gmail.com>
 <1754A030DDACF987.21832@lists.openembedded.org> <CA+cAkerdCUTNQFcMnAVrR6ZOFZUjTPUZcFWSGU+SsCJm+aQqZg@mail.gmail.com>
 <21660e0a3de594390aca712d5fc204b14a83f489.camel@linuxfoundation.org>
In-Reply-To: <21660e0a3de594390aca712d5fc204b14a83f489.camel@linuxfoundation.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Tue, 11 Apr 2023 19:03:03 +0200
Message-ID: <CA+cAkeqiBEHY7-m832p7aEMTbaakEA9NvjkBiRt-jPuZQkPv0A@mail.gmail.com>
Subject: Re: [OE-core] Reproducible build
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009824cb05f91277ae"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 17:03:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179936

--0000000000009824cb05f91277ae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 11 avr. 2023, 18:41, Richard Purdie <
richard.purdie@linuxfoundation.org> a =C3=A9crit :

> On Tue, 2023-04-11 at 17:27 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> > Hello with the patch below:
> >
> > --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> > +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> > @@ -134,9 +134,9 @@ class ReproducibleTests(OESelftestTestCase):
> >      max_report_size =3D 250 * 1024 * 1024
> >
> >      # targets are the things we want to test the reproducibility of
> > -    targets =3D ['core-image-minimal', 'core-image-sato', 'core-image-
> > full-cmdline', 'core-image-weston', 'world']
> > +    targets =3D ['zvariant']
> >      # sstate targets are things to pull from sstate to potentially
> > cut build/debugging time
> > -    sstate_targets =3D []
> > +    sstate_targets =3D ['rust-native', 'cargo-native']
> >      save_results =3D False
> >      if 'OEQA_DEBUGGING_SAVED_OUTPUT' in os.environ:
> >          save_results =3D os.environ['OEQA_DEBUGGING_SAVED_OUTPUT']
> >
> > I managed to reduce the time to test to 30mn (which is reasonable).
> > Today, I made 5 run of this
> > reproducibility test and if library is indeed different between build
> > A and build B every time, this
> > is the same exact difference, that is to day that the 5 libraries in
> > build A are identical and so are
> > the 5 libraries in build B.
> >
> > I admit I'm surprised , I would have waited for some random diff.
> > I'll continue my investigation but if this rang a bell to someone
> > here, feel free to tell (this does
> > seem strange to me).
>
> It likely means it is the path the build is made in that is being
> encoded into the build somehow. The same binary is resulting for a
> given build path?
>
> Cheers,
>
> Richard
>

I issued "strings" and "hexdump -C" on the  libraries and didn't see any
build path (the remap-path-prefix in rust-common.bbclass do it's job and I
only saw /usr/src/debug with the rust source file of zvariant).

But maybe the build path is leaking anyway in some kind of binary format?

>

--0000000000009824cb05f91277ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le mar. 11 avr. 2023, 18:41, Richard Purdie &lt;<a hre=
f=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundat=
ion.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>On Tue, 2023-04-11 at 17:27 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:<br=
>
&gt; Hello with the patch below:<br>
&gt; <br>
&gt; --- a/meta/lib/oeqa/selftest/cases/reproducible.py<br>
&gt; +++ b/meta/lib/oeqa/selftest/cases/reproducible.py<br>
&gt; @@ -134,9 +134,9 @@ class ReproducibleTests(OESelftestTestCase):<br>
&gt; =C2=A0 =C2=A0 =C2=A0max_report_size =3D 250 * 1024 * 1024<br>
&gt; =C2=A0<br>
&gt; =C2=A0 =C2=A0 =C2=A0# targets are the things we want to test the repro=
ducibility of<br>
&gt; - =C2=A0 =C2=A0targets =3D [&#39;core-image-minimal&#39;, &#39;core-im=
age-sato&#39;, &#39;core-image-<br>
&gt; full-cmdline&#39;, &#39;core-image-weston&#39;, &#39;world&#39;]<br>
&gt; + =C2=A0 =C2=A0targets =3D [&#39;zvariant&#39;]<br>
&gt; =C2=A0 =C2=A0 =C2=A0# sstate targets are things to pull from sstate to=
 potentially<br>
&gt; cut build/debugging time<br>
&gt; - =C2=A0 =C2=A0sstate_targets =3D []<br>
&gt; + =C2=A0 =C2=A0sstate_targets =3D [&#39;rust-native&#39;, &#39;cargo-n=
ative&#39;]<br>
&gt; =C2=A0 =C2=A0 =C2=A0save_results =3D False<br>
&gt; =C2=A0 =C2=A0 =C2=A0if &#39;OEQA_DEBUGGING_SAVED_OUTPUT&#39; in os.env=
iron:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0save_results =3D os.environ[&#39;OEQ=
A_DEBUGGING_SAVED_OUTPUT&#39;]<br>
&gt; <br>
&gt; I managed=C2=A0to reduce the time to test to 30mn (which is reasonable=
).<br>
&gt; Today, I made 5 run of this<br>
&gt; reproducibility test and if library is indeed different between build<=
br>
&gt; A and build B every time, this<br>
&gt; is the same exact difference, that is to day that the 5 libraries in<b=
r>
&gt; build A are identical and so are<br>
&gt; the 5 libraries in build B.<br>
&gt; <br>
&gt; I admit I&#39;m surprised=C2=A0, I would have=C2=A0waited for some ran=
dom diff.<br>
&gt; I&#39;ll continue my investigation but if this rang a bell to someone<=
br>
&gt; here, feel free to tell (this does<br>
&gt; seem strange to me).<br>
<br>
It likely means it is the path the build is made in that is being<br>
encoded into the build somehow. The same binary is resulting for a<br>
given build path?<br>
<br>
Cheers,<br>
<br>
Richard<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">I issued &quot;strings&quot; and &quot;hexdump -C&quot; on the=C2=A0=
 libraries and didn&#39;t see any build path (the remap-path-prefix in rust=
-common.bbclass do it&#39;s job and I only saw /usr/src/debug with the rust=
 source file of zvariant).=C2=A0</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">But maybe the build path is leaking anyway in some kind of binary=
 format?=C2=A0</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
</blockquote></div></div></div>

--0000000000009824cb05f91277ae--

