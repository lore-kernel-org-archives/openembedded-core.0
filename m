Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45482C77B61
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 04:09:57 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.27244.1679890194716653871
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Mar 2023 21:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QyrAF6l3;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id y35so4984630ljq.4
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 21:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679890193;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S5lCmcS5UzJWmr8crUqBYwH4oB/pENY1IOiJ68zLRGU=;
        b=QyrAF6l3XDkR7bC1Petry9+cfyE5mUsh6EIIP4wve5er3F4cavwFMmPanBepFSYsWt
         g/xYypckIYSAb+z3WSE0uvbKMQ5KZws4oKYuS0mkT3PgP1l0FfmR39XffIlqsKyQ3A/v
         BLeKcV62saWUNdTgIxfeR7vvDhIToHiKgaokJVmAWmB1XMgDhz2qjFGU3ToQCeJhrK+x
         CndxcJO3VhM4zqzO0w5oyl2TU1fidQrC3+SRRlSfmMp0YIC6VuqWPbXmfWzLWGSPvuu0
         5gmTBJc58QzhmTSFKgeND+C7G/CevF6CsX6mx1A7ULeS1wfT0uK5L0ISO/jGPmIk+caV
         GaUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679890193;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S5lCmcS5UzJWmr8crUqBYwH4oB/pENY1IOiJ68zLRGU=;
        b=zA1YT2MZ6rCkPqaV05Mpsk5tJiT1lqY5X0gQJLe+xCtVyxCKmKxLHp00l7XkG9PLYU
         AyjZZH2rT9l5fUGkrfysL0iBZOCvNlU01/1NddupDZnWzlREm71zCkyIpGsn73Ea42Mt
         6Xevc5/Xjtw6CpXs8/9Btoo/0UTNHmD2wDbNjhJIU8IcFIi7KTMgDIhrU1+f9n5WOxjo
         dqgNU2w66u1wxeitNL5aosWH6eAsmFnQMbSMevfUetLp6sdAkOiK9c8/LZarsM1844ZW
         Rf9u6FnUJ7CRVEPtAcRXVl6AzWJusah/7okv3HkMD/F3L5YgFSzB0dDHuLQFx3IQ852V
         u/Gw==
X-Gm-Message-State: AAQBX9c7EzFVVObV2ZsA30dDsddzTA55aC63Lf8+Aj0DsurZX4y3Orey
	a0F/4lwVXaczBiqaRCZ8ENGzzB/y3o6A3k2zvMc=
X-Google-Smtp-Source: AKy350Z9SmVU1o4s4MVjYPYLnE6JQ5y/2bW5LlDd9brsxuV+haoXBh9nR/+SAjXKTJEUV+qlVE/UwNkR/R9Q5FechA8=
X-Received: by 2002:a05:651c:10e:b0:295:a82e:ec06 with SMTP id
 a14-20020a05651c010e00b00295a82eec06mr3020159ljb.3.1679890192873; Sun, 26 Mar
 2023 21:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1679734210.git.frederic.martinsons@gmail.com>
 <b48dd61e593e57d7673b65a34a44cd304cb7b7b8.1679734210.git.frederic.martinsons@gmail.com>
 <CANNYZj_W+qLQRMVTuW8RMSJeBSgstixSPh1rZh77KxvN4vsCgg@mail.gmail.com>
 <CA+cAkep6MPVsP=sY_y9jonjgn8X2oEJL4OPiidfGyT5jJUjVzQ@mail.gmail.com>
 <CA+cAkeqFrnuoSL5Z2d1MrPNv3VbmLfUPV0w0BBQ-w3Jd2-A3YA@mail.gmail.com> <CANNYZj_B6vmr86JBZ-DPzJnJ=g9DHAvOwAt6=vPANHGDGcgkgA@mail.gmail.com>
In-Reply-To: <CANNYZj_B6vmr86JBZ-DPzJnJ=g9DHAvOwAt6=vPANHGDGcgkgA@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Mon, 27 Mar 2023 06:09:41 +0200
Message-ID: <CA+cAkerdTKWLoan8-Y14Qxo4pnmZ03bNh4==sEfOgJ6WeKc4jg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] devtool: add support for multiple git url
 inside a cargo based recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, alex.kiernan@gmail.com
Content-Type: multipart/alternative; boundary="000000000000353edc05f7d9ea07"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 04:09:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179137

--000000000000353edc05f7d9ea07
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok I'll provide a V3 where the zvariant recipe is removed.

On Sun, 26 Mar 2023 at 20:01, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> I'm fine with v2, except for the zvariant recipe, that should probably
> go to meta-rust (which itself should go to meta-oe, with cleanups).
>
> Alex
>
> On Sun, 26 Mar 2023 at 16:58, Fr=C3=A9d=C3=A9ric Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> > I submit a V2 series where I made modifications you suggested, I choose
> to use a more
> > generic type (git-dependency instead of cargo-dep) since I foresee that
> could be used also
> > for npm based recipe (see
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D11015)
> >
> > For the moment, I let the example recipe in oe-core because I don't kno=
w
> where it should
> > go (or even if I should keep it or remove it)
> >
> > On Sun, 26 Mar 2023 at 07:15, Fr=C3=A9d=C3=A9ric Martinsons <
> frederic.martinsons@gmail.com> wrote:
> >>
> >> Ah, good idea, I'll try that and provide a V2 of this series if it fit=
s.
> >>
> >> On Sat, 25 Mar 2023 at 20:02, Alexander Kanavin <alex.kanavin@gmail.co=
m>
> wrote:
> >>>
> >>> On Sat, 25 Mar 2023 at 10:01, Frederic Martinsons
> >>> <frederic.martinsons@gmail.com> wrote:
> >>> > @@ -72,6 +73,8 @@ python () {
> >>> >                      url_data.type =3D=3D 'npmsw' or url_data.type =
=3D=3D
> 'crate' or
> >>> >                      'type' in parm and parm['type'] =3D=3D 'kmeta'=
):
> >>> >                  local_srcuri.append(url)
> >>> > +            if url in cargo_git_deps:
> >>> > +                local_srcuri.append(url)
> >>>
> >>> Come to think of it, it's better to use the same type parameter with =
a
> >>> special value as in kernel recipes:
> >>>
> >>> git://.....;type=3Dcargo-dep;...
> >>>
> >>> This would avoid the ugly special variable.
> >>>
> >>> Alex
>

--000000000000353edc05f7d9ea07
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok I&#39;ll provide a V3 where the zvariant recipe is remo=
ved.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Sun, 26 Mar 2023 at 20:01, Alexander Kanavin &lt;<a href=3D"mailto:a=
lex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">I&#39;m fine with v2, except f=
or the zvariant recipe, that should probably<br>
go to meta-rust (which itself should go to meta-oe, with cleanups).<br>
<br>
Alex<br>
<br>
On Sun, 26 Mar 2023 at 16:58, Fr=C3=A9d=C3=A9ric Martinsons<br>
&lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank">fred=
eric.martinsons@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I submit a V2 series where I made modifications you suggested, I choos=
e to use a more<br>
&gt; generic type (git-dependency instead of cargo-dep) since I foresee tha=
t could be used also<br>
&gt; for npm based recipe (see <a href=3D"https://bugzilla.yoctoproject.org=
/show_bug.cgi?id=3D11015" rel=3D"noreferrer" target=3D"_blank">https://bugz=
illa.yoctoproject.org/show_bug.cgi?id=3D11015</a>)<br>
&gt;<br>
&gt; For the moment, I let the example recipe in oe-core because I don&#39;=
t know where it should<br>
&gt; go (or even if I should keep it or remove it)<br>
&gt;<br>
&gt; On Sun, 26 Mar 2023 at 07:15, Fr=C3=A9d=C3=A9ric Martinsons &lt;<a hre=
f=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank">frederic.marti=
nsons@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Ah, good idea, I&#39;ll try that and provide a V2 of this series i=
f it fits.<br>
&gt;&gt;<br>
&gt;&gt; On Sat, 25 Mar 2023 at 20:02, Alexander Kanavin &lt;<a href=3D"mai=
lto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt=
; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Sat, 25 Mar 2023 at 10:01, Frederic Martinsons<br>
&gt;&gt;&gt; &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D=
"_blank">frederic.martinsons@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt; &gt; @@ -72,6 +73,8 @@ python () {<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 url_data.type =3D=3D &#39;npmsw&#39; or url_data.type =
=3D=3D &#39;crate&#39; or<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;type&#39; in parm and parm[&#39;type&#39;] =3D=3D=
 &#39;kmeta&#39;):<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 local_srcuri.append(url)<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if url in carg=
o_git_deps:<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
local_srcuri.append(url)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Come to think of it, it&#39;s better to use the same type para=
meter with a<br>
&gt;&gt;&gt; special value as in kernel recipes:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; git://.....;type=3Dcargo-dep;...<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This would avoid the ugly special variable.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Alex<br>
</blockquote></div>

--000000000000353edc05f7d9ea07--

