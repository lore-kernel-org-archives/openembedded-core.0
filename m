Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F361C001B0
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 07:30:32 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.102472.1691998225710330782
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Aug 2023 00:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=otAhzXMj;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6471e5bc1d1so5534136d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 00:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691998225; x=1692603025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dMnUMdrs50wT4k0uKdiHPHEZ1Zzrkb/XhBbS4Eswr6U=;
        b=otAhzXMjzVdEdloOMbP/GW8ZHKzQWpdjTgRZp2BaxcmO7Ayx68yXHuulbnJ1nSURMY
         EqfWbQUiV7Io1ne811Z2255iwapN1DkAS6LxABfRunYV1DWIZ9Issx5nMSb0NXp9Mpet
         fGZ2fyPrMwWz+3GWJE2QG7WmD8GC1WMwrAvOOld/M76QFk8GcFxgK120+2Z5hIdMMHlr
         HGNOcO6wCAxIx4CC47RBHL/IuM+o55bs7QsdyiHaOZMP2FNh3B3HxK8OgtRpxJ9wlt8f
         ShOip4nwKUsUfn7rVvZCMGBIJuh2dzzl57jf2DSD9fWMTn3u200ad2QD8Eg8QQnn2E5A
         +wdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691998225; x=1692603025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dMnUMdrs50wT4k0uKdiHPHEZ1Zzrkb/XhBbS4Eswr6U=;
        b=VmFUyMFgKOcbuD4ltloNkiXgvWSfOQ0sHPvEMWTopqosEh7cDNpGzvFl+mTC5/Z6OQ
         NKiBSHYbPZdYARVRspcslxPX16KFde0C4+p81Bjr/QkPTxVUQSbTTTO9X02+PmNPAHu1
         ruPk8/+BMTHzu057s3nhE2AWSvJFHaMKL4oxAer9L93dly1v0iwTMs83EnIlP01CeM8D
         8OJ983sefB+GnmfK8tQQXuPGoMUbxlS3YGtG+9nzmvMuR157Cj7BJbaCoS00sKAaDcrc
         PZtcql9Le2Mu5NkomEODYMFBiJkTHpEq3C8Q3P/nyohBHGB4wstQ+lwC0GJQIgx6lHqF
         qtdQ==
X-Gm-Message-State: AOJu0YzxZmtjCFo3fxBi6HAX8OCASYNV9pB2ZYIyaXT3XoDE0nj+XW2r
	eNXixD+8rlluNUWERXRbuIfOa1/kOPIAQiA/+Dk=
X-Google-Smtp-Source: AGHT+IHZs5UFhv3RMw97JtWbf05TUqHyQ4D6wIFvvCKsTdzF1kLYhNfPTTEuhevVvjmI6bmxQgCYKaM3rJf2fd2m+CE=
X-Received: by 2002:a0c:f1c7:0:b0:63d:7aa8:b59f with SMTP id
 u7-20020a0cf1c7000000b0063d7aa8b59fmr8359390qvl.7.1691998224605; Mon, 14 Aug
 2023 00:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1691914589.git.frederic.martinsons@gmail.com>
 <c4d2d924272d180ed88076e61dc59abc71d227f0.camel@linuxfoundation.org>
 <CA+cAkeptfJVB=EzEm46898iXjnNodr7Ct9TzQ7FycOkCkiA0_Q@mail.gmail.com>
 <177AED879B83B027.8497@lists.openembedded.org> <177AF35A822C5F89.12117@lists.openembedded.org>
 <89d5c672b989d1ac30a10093c89227da182748e3.camel@linuxfoundation.org>
 <CA+cAkeqexEemD1vcRoVOdha8e32Wfzr-9-5z-xU3enC_Y41QoQ@mail.gmail.com> <843d59933f8943bfa78919faf608a7b0feaf3dce.camel@linuxfoundation.org>
In-Reply-To: <843d59933f8943bfa78919faf608a7b0feaf3dce.camel@linuxfoundation.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Mon, 14 Aug 2023 09:30:13 +0200
Message-ID: <CA+cAkeqdLTze+=synu194ezFrQqeCidwmDdwGD-527H3-cb=7g@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCHV2 0/4] Introduction of cargo-c class and recipe
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000236a730602dd093d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 07:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185923

--000000000000236a730602dd093d
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


It will hardly be doable to correct the reproducibility of rust packages
since rust/cargo
itself have issues upstream. I take a look and there are lot of open issues
cargo:
https://github.com/rust-lang/cargo/issues?q=3Dis%3Aissue+is%3Aopen+label%3A=
A-reproducibility+
rust:
https://github.com/rust-lang/rust/issues?q=3Dis%3Aissue+is%3Aopen+label%3AA=
-reproducibility

There was an RFC accepted back in may (
https://github.com/rust-lang/rfcs/pull/3127) and implementation
progress have a tracking issue in cargo (
https://github.com/rust-lang/cargo/issues/12137) and in rust
(https://github.com/rust-lang/rust/issues/111540).

Don't know if it will fix our root issue (
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14875) but I don't
see how to workaround all of that without this upstream work.

For cargo-c specific issues, I'll try to make things better (the TMPDIR in
debug symbols) but I'm wondering
something, reproducibility is  desirable for all generated artifacts or is
it only for target ones ?  I mean,
the cargo-c is used in native so I'm wondering if making it native only
would be acceptable ?


>
>
Cheers,
>
> Richard
>
>
>

--000000000000236a730602dd093d
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
set...</blockquote><div><br></div><div>It will hardly be doable to correct =
the reproducibility of rust packages since rust/cargo</div><div>itself have=
 issues upstream. I take a look and there are lot of open issues</div><div>=
cargo:=C2=A0<a href=3D"https://github.com/rust-lang/cargo/issues?q=3Dis%3Ai=
ssue+is%3Aopen+label%3AA-reproducibility+">https://github.com/rust-lang/car=
go/issues?q=3Dis%3Aissue+is%3Aopen+label%3AA-reproducibility+</a></div><div=
>rust:=C2=A0<a href=3D"https://github.com/rust-lang/rust/issues?q=3Dis%3Ais=
sue+is%3Aopen+label%3AA-reproducibility">https://github.com/rust-lang/rust/=
issues?q=3Dis%3Aissue+is%3Aopen+label%3AA-reproducibility</a></div><div><br=
></div><div>There was an RFC accepted back in may (<a href=3D"https://githu=
b.com/rust-lang/rfcs/pull/3127">https://github.com/rust-lang/rfcs/pull/3127=
</a>) and implementation</div><div>progress have a tracking issue in cargo =
(<a href=3D"https://github.com/rust-lang/cargo/issues/12137">https://github=
.com/rust-lang/cargo/issues/12137</a>) and in rust</div><div>(<a href=3D"ht=
tps://github.com/rust-lang/rust/issues/111540">https://github.com/rust-lang=
/rust/issues/111540</a>).</div><div><br></div><div>Don&#39;t know if it wil=
l fix our root issue (<a href=3D"https://bugzilla.yoctoproject.org/show_bug=
.cgi?id=3D14875">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14875<=
/a>) but I don&#39;t</div><div>see how to workaround all of that without th=
is upstream work.</div><div><br></div><div>For cargo-c specific issues, I&#=
39;ll try to make things better (the TMPDIR in debug symbols) but I&#39;m w=
ondering</div><div>something, reproducibility is=C2=A0 desirable for all ge=
nerated artifacts or is it only for target ones ?=C2=A0 I mean,=C2=A0</div>=
<div>the cargo-c is used in native so I&#39;m wondering if making=C2=A0it n=
ative only would be acceptable ?</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">=C2=A0<br></blockquote><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div></div>

--000000000000236a730602dd093d--

