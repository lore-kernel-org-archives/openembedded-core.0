Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0A7EB64DD
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 09:39:42 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.104018.1692005981497893001
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Aug 2023 02:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ekHAH0dG;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-40a9918ec08so25014921cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 02:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692005980; x=1692610780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G5grUE0ZolY7I6c+kN6jsi3wIHPDwDbteIj5ILcSEJ8=;
        b=ekHAH0dG3BwEVSr7Znb3alAIUAhH5f5m+02MANacBanCP6LZ0liLU+3U/8+eAs18d/
         6x6sWzruZotM4/ln+tT3JBKq/7u/hw3nZd9qjrBukByqbGKGebPoEYCF6/d8xe7QBvJt
         ZJB5+d7tw1+9eXvde03m9GwtlBexsvV+FZWMV2FsYuclE5FMbHPTMT4jlKGFSryVoRsn
         f1znzUj+i1x9Ri9HXTLkYsBfBMWvwheah/Jyj6ygDYFBJjeqOjlrkWKudPfl05ocBrGc
         nwM/36RbmTkqjqyK5WqpKSNvre9/dxr3J3FwPvAtnRtqqbBP1Qo5m2kh8k2C7PEE7Tn2
         Rutw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692005980; x=1692610780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5grUE0ZolY7I6c+kN6jsi3wIHPDwDbteIj5ILcSEJ8=;
        b=LSUh2C/FvgLuzR5M89o7i3I+Xqfac0jEuoTWZQSUqlN7oU3VnsWAzZMfwa4v7Vce8W
         aRFNLjGqIrb7dQYosFrCpbho/8BR0pvfMA0m60mb2P3Wefy5bfnrnXhZxAv9MdGy2/IG
         YPX1lEunZMN4KxhxLzP5Vv/6dER2FZucaboVXBPEOfRnqX/F8ZYBQmc7xQpJt3MUUjzU
         HY+JaZFgxwjnkHUlvQCRNoHOp9+6yOF5N2v6WObH00m1JtV7aAEQHN8EC7tv0clO9IKE
         NDBlqBbViRgaFZA3Okjt6QClqb2/zbkoQuRL+FVbV7hQrNybAA7KYyjIB6Qav3OAY20u
         GP0g==
X-Gm-Message-State: AOJu0YyBda+JYyLySuPRLr56fS4ONA0OajnwVmif9lG9hiniUZW+UFzj
	APcitK4GwgyYwz3HLKA9Q3OkTOynalJhJtZ0VCw=
X-Google-Smtp-Source: AGHT+IEJY5eLH+VaOEKH3R0sR9SSEW4IXLaSoivoxFHUQ8zA7rgTDs4xzoameb0vqParjKiNrYFMUQ3HFIUlfazEY3U=
X-Received: by 2002:a0c:f1d0:0:b0:641:e7b8:6a62 with SMTP id
 u16-20020a0cf1d0000000b00641e7b86a62mr7936746qvl.60.1692005980350; Mon, 14
 Aug 2023 02:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1691914589.git.frederic.martinsons@gmail.com>
 <c4d2d924272d180ed88076e61dc59abc71d227f0.camel@linuxfoundation.org>
 <CA+cAkeptfJVB=EzEm46898iXjnNodr7Ct9TzQ7FycOkCkiA0_Q@mail.gmail.com>
 <177AED879B83B027.8497@lists.openembedded.org> <177AF35A822C5F89.12117@lists.openembedded.org>
 <89d5c672b989d1ac30a10093c89227da182748e3.camel@linuxfoundation.org>
 <CA+cAkeqexEemD1vcRoVOdha8e32Wfzr-9-5z-xU3enC_Y41QoQ@mail.gmail.com>
 <843d59933f8943bfa78919faf608a7b0feaf3dce.camel@linuxfoundation.org>
 <CA+cAkeqdLTze+=synu194ezFrQqeCidwmDdwGD-527H3-cb=7g@mail.gmail.com> <a06d63fa5557a0c0274573539aad381656e00890.camel@linuxfoundation.org>
In-Reply-To: <a06d63fa5557a0c0274573539aad381656e00890.camel@linuxfoundation.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Mon, 14 Aug 2023 11:39:29 +0200
Message-ID: <CA+cAkeoq5z8RA8SPdN3JpuTqgocBnxCQp9rKLO+9Sq3dan_Nzw@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCHV2 0/4] Introduction of cargo-c class and recipe
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006aad140602ded726"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 09:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185928

--0000000000006aad140602ded726
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 14 ao=C3=BBt 2023, 10:46, Richard Purdie <
richard.purdie@linuxfoundation.org> a =C3=A9crit :

> On Mon, 2023-08-14 at 09:30 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> >
> >
> > On Sun, 13 Aug 2023 at 17:05, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Sun, 2023-08-13 at 17:00 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrot=
e:
> > > > On Sun, 13 Aug 2023 at 16:53, Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > >
> > > > > and a reproducibility failure:
> > > > >
> > > > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3355/s=
teps/13/logs/stdio
> > > > >
> > > > > which leads to:
> > > > >
> > > > >
> http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230813-z_b2j=
3ha/packages/diff-html/
> > > > >
> > > >
> > > >
> > > > Argh, this makes me remember
> > > > of https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15090
> > > > Do you know if any of cargo based recipe is reproducible ?
> > > > Should I add EXCLUDE_FROM_WORLD in cargo-c ?
> > >
> > > At some point we're going to have to dive in and fix the
> > > reproducibility issues so I'm reluctant to take more patches with
> > > that
> > > set...
> > >
> >
> >
> > It will hardly be doable to correct the reproducibility of rust
> > packages since rust/cargo
> > itself have issues upstream. I take a look and there are lot of open
> > issues
> > cargo:
> > https://github.com/rust-lang/cargo/issues?q=3Dis%3Aissue+is%3Aopen+labe
> > l%3AA-reproducibility+
> > rust:
> > https://github.com/rust-lang/rust/issues?q=3Dis%3Aissue+is%3Aopen+label
> > %3AA-reproducibility
>
> I believe there is one problematic reference left which causes problems
> for core rust. Fixing that issue would be the best place to start and
> then we can work from there.
>
> We do already have a lot of good reproducibility pieces in the
> toolchain so not every upstream bug will apply to us.
>

I'm afraid I do not see what is your point, can you elaborate please? What
is the "problematic reference left which causes problems
for core rust" you refer to?


> > There was an RFC accepted back in may
> > (https://github.com/rust-lang/rfcs/pull/3127) and implementation
> > progress have a tracking issue in cargo
> > (https://github.com/rust-lang/cargo/issues/12137) and in rust
> > (https://github.com/rust-lang/rust/issues/111540).
> >
> > Don't know if it will fix our root issue
> > (https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14875) but I don't
> > see how to workaround all of that without this upstream work.
> >
> > For cargo-c specific issues, I'll try to make things better (the
> > TMPDIR in debug symbols) but I'm wondering
> > something, reproducibility is  desirable for all generated artifacts
> > or is it only for target ones ?  I mean,
> > the cargo-c is used in native so I'm wondering if making it native
> > only would be acceptable ?
>
> That would certainly avoid this issue. It would also make on target
> testing of the functionality not possible.
>

The test I added is on the final binary generated (rust-c-lib-examble-bin),
not cargo-c itself. So the target test would still be valid.

I tested a release build with a custom patch that strips debuginfo
(strip=3D"debug info" in Cargo.toml) and I do not have build path leaking i=
n
debug symbol anymore. I'll dig this up more and see if I can upstream that.

But the reproducible issue remain despite that.


> Cheers,
>
> Richard
>
>
>

--0000000000006aad140602ded726
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le lun. 14 ao=C3=BBt 2023, 10:46, Richard Purdie &lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank" rel=
=3D"noreferrer">richard.purdie@linuxfoundation.org</a>&gt; a =C3=A9crit=C2=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">On Mon, 2023-08-14 at 09:30 +0=
200, Fr=C3=A9d=C3=A9ric Martinsons wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Sun, 13 Aug 2023 at 17:05, Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" rel=3D"noref=
errer noreferrer" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt; wrote:<br>
&gt; &gt; On Sun, 2023-08-13 at 17:00 +0200, Fr=C3=A9d=C3=A9ric Martinsons =
wrote:<br>
&gt; &gt; &gt; On Sun, 13 Aug 2023 at 16:53, Richard Purdie<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" re=
l=3D"noreferrer noreferrer" target=3D"_blank">richard.purdie@linuxfoundatio=
n.org</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; and a reproducibility failure:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon=
/#/builders/117/builds/3355/steps/13/logs/stdio" rel=3D"noreferrer noreferr=
er noreferrer" target=3D"_blank">https://autobuilder.yoctoproject.org/typho=
on/#/builders/117/builds/3355/steps/13/logs/stdio</a><br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; which leads to:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <a href=3D"http://autobuilder.yocto.io/pub/repro-fail/o=
e-reproducible-20230813-z_b2j3ha/packages/diff-html/" rel=3D"noreferrer nor=
eferrer noreferrer" target=3D"_blank">http://autobuilder.yocto.io/pub/repro=
-fail/oe-reproducible-20230813-z_b2j3ha/packages/diff-html/</a><br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Argh, this makes me remember<br>
&gt; &gt; &gt; of=C2=A0<a href=3D"https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D15090" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank=
">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15090</a><br>
&gt; &gt; &gt; Do you know if any of cargo based recipe is reproducible ?<b=
r>
&gt; &gt; &gt; Should I add EXCLUDE_FROM_WORLD in cargo-c ?<br>
&gt; &gt; <br>
&gt; &gt; At some point we&#39;re going to have to dive in and fix the<br>
&gt; &gt; reproducibility issues so I&#39;m reluctant to take more patches =
with<br>
&gt; &gt; that<br>
&gt; &gt; set...<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; It will hardly be doable to correct the reproducibility of rust<br>
&gt; packages since rust/cargo<br>
&gt; itself have issues upstream. I take a look and there are lot of open<b=
r>
&gt; issues<br>
&gt; cargo:=C2=A0<br>
&gt; <a href=3D"https://github.com/rust-lang/cargo/issues?q=3Dis%3Aissue+is=
%3Aopen+labe" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">ht=
tps://github.com/rust-lang/cargo/issues?q=3Dis%3Aissue+is%3Aopen+labe</a><b=
r>
&gt; l%3AA-reproducibility+<br>
&gt; rust:=C2=A0<br>
&gt; <a href=3D"https://github.com/rust-lang/rust/issues?q=3Dis%3Aissue+is%=
3Aopen+label" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">ht=
tps://github.com/rust-lang/rust/issues?q=3Dis%3Aissue+is%3Aopen+label</a><b=
r>
&gt; %3AA-reproducibility<br>
<br>
I believe there is one problematic reference left which causes problems<br>
for core rust. Fixing that issue would be the best place to start and<br>
then we can work from there.<br>
<br>
We do already have a lot of good reproducibility pieces in the<br>
toolchain so not every upstream bug will apply to us.<br></blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m afraid I do no=
t see what is your point, can you elaborate please? What is the &quot;probl=
ematic reference left which causes problems</div>for core rust&quot; you re=
fer to?=C2=A0<div dir=3D"auto"><br><div dir=3D"auto"><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
<br>
&gt; There was an RFC accepted back in may<br>
&gt; (<a href=3D"https://github.com/rust-lang/rfcs/pull/3127" rel=3D"norefe=
rrer noreferrer noreferrer" target=3D"_blank">https://github.com/rust-lang/=
rfcs/pull/3127</a>) and implementation<br>
&gt; progress have a tracking issue in cargo<br>
&gt; (<a href=3D"https://github.com/rust-lang/cargo/issues/12137" rel=3D"no=
referrer noreferrer noreferrer" target=3D"_blank">https://github.com/rust-l=
ang/cargo/issues/12137</a>) and in rust<br>
&gt; (<a href=3D"https://github.com/rust-lang/rust/issues/111540" rel=3D"no=
referrer noreferrer noreferrer" target=3D"_blank">https://github.com/rust-l=
ang/rust/issues/111540</a>).<br>
&gt; <br>
&gt; Don&#39;t know if it will fix our root issue<br>
&gt; (<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14875"=
 rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://bugzill=
a.yoctoproject.org/show_bug.cgi?id=3D14875</a>) but I don&#39;t<br>
&gt; see how to workaround all of that without this upstream work.<br>
&gt;<br>
&gt; For cargo-c specific issues, I&#39;ll try to make things better (the<b=
r>
&gt; TMPDIR in debug symbols) but I&#39;m wondering<br>
&gt; something, reproducibility is=C2=A0 desirable for all generated artifa=
cts<br>
&gt; or is it only for target ones ?=C2=A0 I mean,=C2=A0<br>
&gt; the cargo-c is used in native so I&#39;m wondering if making=C2=A0it n=
ative<br>
&gt; only would be acceptable ?<br>
<br>
That would certainly avoid this issue. It would also make on target<br>
testing of the functionality not possible.<br></blockquote></div></div></di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">The test I added is on the =
final binary generated (rust-c-lib-examble-bin), not cargo-c itself. So the=
 target test would still be valid.=C2=A0</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">I tested a release build with a custom patch that strips d=
ebuginfo (strip=3D&quot;debug info&quot; in Cargo.toml) and I do not have b=
uild path leaking in debug symbol anymore. I&#39;ll dig this up more and se=
e if I can upstream that.=C2=A0</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">But the reproducible issue remain despite that.=C2=A0</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto"><div dir=3D"auto"><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div></div></div></div>

--0000000000006aad140602ded726--

