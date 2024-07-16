Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63293C3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 13:46:50 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.11264.1721137609283331067
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 06:46:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NRSmPxt2;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2eec7e431d9so71558081fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 06:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721137607; x=1721742407; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G8DDVcccpUm3QyYFkaHk4qrdtXHGs/E436IYmXpmA28=;
        b=NRSmPxt2AE1xJQAVwB3j10IsA8FRgcKPfkv/M9ybHeCWjC4uiCAXBYxJ2aA+jAF2Ff
         is8SPwV3BPcazDEqxphT4MlrZOIWqOS+X9ZP2M6El/heXPH6QNM7MdCz65M+b+608IDc
         m+Q8ncusRWcEEvqnJ1BoboHjI7D2l+EG++4WOmWG0EmbIauTInaOaKqdY2u28lDF8AuN
         vSSBOZeouwZZARWoKW5xM1KAF/eoIWRePxCk9QnaO7zOGrRD7AgH7p7FkCjpVGp97SBA
         +2R6dinqXnZe039Y3glR+4JLKm47mwisRGLfeSpNq4ASbS3CLb4fA6yp0W5FrKm0PLnj
         oVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721137607; x=1721742407;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8DDVcccpUm3QyYFkaHk4qrdtXHGs/E436IYmXpmA28=;
        b=dcybODaLjGTctgNBGuB7rIqH3d+hwzkl5cbfSIKXw1GrX8LC1cXdMmj5mIUliqyZeD
         /cEZEdNclAk958Ul+OCP3y4g+haX8LsLJ2wpMVAPqFc5ctBCGHT2lNXiagn9hOLLfmcc
         /+BP4c3Ah4uKpxDYXK8YFsz/226y98Fgetag6fQQftf7co0dWWbtkgjCGWceUvYiOb3P
         Ar1eECYa3FUJ8ZyRF3lHusFLi3bsPK+vRjCLa7GlNRozU9I4JHBTwr4x2tnOi6nr7K7r
         YkP2bZU1zRukwdsqpHpZIxisFjwu4ywsqDlA8bOCoT8yB63GFktg1ai42GhzqSzPPxCl
         qgvg==
X-Gm-Message-State: AOJu0YyCl+VFlgDkKyj2lUDZQfFOngqqLz6pkcSvnRxBIot/CTLU1Vsj
	kUTvWdiByOGRuTqOh7/VqNRdnRED8xnR7xJt1GsLyKd8OuOJ/9rtK6hTKaU6M6pRi2v/gszvTmd
	oy1/5BhH+Zaap6rEbMnyFpymCKno=
X-Google-Smtp-Source: AGHT+IFPV56zM3E5Or3awWPKyzPAzEF/qu1HlU9Dp2X92sEPWWo4IDZaXyvMeWWd5oNrgoUQAIBnZgF6v1Mk7MVSAb4=
X-Received: by 2002:a2e:9b8e:0:b0:2ee:8d07:3d5e with SMTP id
 38308e7fff4ca-2eef41681bbmr16200531fa.9.1721137606959; Tue, 16 Jul 2024
 06:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240703140059.4096394-1-JPEWhacker@gmail.com>
 <20240712160304.3514496-1-JPEWhacker@gmail.com> <54c574fdb35ef25b71baaf1e1adfa8bd909a5f39.camel@linuxfoundation.org>
 <CAJdd5GaA4tByvK04pNycoApWYHeznYVe=y1ckSWsUVu=jwmjnQ@mail.gmail.com>
 <330caeaef519ceaf40dceac15ccd00be2ed38d60.camel@linuxfoundation.org>
 <CAJdd5GZV2Ygb4iAPtRgyHt_40nBAonzfS6=XzmH9KwxOyUfyag@mail.gmail.com>
 <17E2852F1C219F3B.14505@lists.openembedded.org> <532dd83f68d908269ade266c450767921733f7ad.camel@linuxfoundation.org>
In-Reply-To: <532dd83f68d908269ade266c450767921733f7ad.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 16 Jul 2024 07:46:34 -0600
Message-ID: <CAJdd5GZXou9=YK0x_XXecpU3tcsJNQQA+-xVUUay9uXdRSJ28A@mail.gmail.com>
Subject: Re: [OE-core][PATCH v6 00/12] Add SPDX 3.0 support
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ac277a061d5d931a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 13:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202113

--000000000000ac277a061d5d931a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024, 7:18=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2024-07-16 at 00:00 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Mon, 2024-07-15 at 15:26 -0600, Joshua Watt wrote:
> > > On Mon, Jul 15, 2024 at 3:07=E2=80=AFPM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > On Mon, 2024-07-15 at 14:40 -0600, Joshua Watt wrote:
> > > > > On Sat, Jul 13, 2024 at 12:44=E2=80=AFAM Richard Purdie
> > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > >
> > > > > > On Fri, 2024-07-12 at 09:58 -0600, Joshua Watt via
> > > > > > lists.openembedded.org wrote:
> > > > > > > This patch series add support for SPDX 3.0 and sets it as the
> > > > > > > default.
> > > > > > > Currently it is not possible to have SPDX 2.2 and SPDX 3.0
> > > > > > > enabled at
> > > > > > > the same time
> > > > > > >
> > > > > > > v2: Added tests and addressed feedback
> > > > > > > v3: Fixed several oe-selftest and build failures
> > > > > > > v4: Fixed silly typo mistake in staging.bbclass
> > > > > > > v5: Reworked to make SPDX 3 output reproducible by default.
> > > > > > > Variables
> > > > > > >     that introduce non-reproducible output are documented as
> > > > > > > such.
> > > > > > > v6: Many changes:
> > > > > > >   * Fixed bug where building baremetal images would break
> > > > > > > SPDX
> > > > > > > 2.2
> > > > > > >   * Most SPDX code is now in python library files instead of
> > > > > > > tasks
> > > > > > >   * Removed dependency on pacakge_write_* tasks
> > > > > > >   * Fixed sstate selftest cases to account for SPDX 3.0 task
> > > > > > > names
> > > > > >
> > > > > > This had a lot of failures in testing I'm afraid:
> > > > > >
> > > > > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7134
> > > > >
> > > > > This appears to be caused because the SPDX tasks are not running
> > > > > for
> > > > > some recipes (e.g. automake). It looks like this like:
> > > > >
> > > > >   do_create_rootfs_spdx[recrdeptask] +=3D "do_create_spdx
> > > > > do_create_package_spdx"
> > > > >
> > > > > is not actually strong enough to make sure the SPDX tasks for
> > > > > automake
> > > > > run for e.g. core-image-sato-sdk, but I don't know why. I'll keep
> > > > > looking, but if anyone happens to know off the top of their head
> > > > > let
> > > > > me know
> > > >
> > > > Can you be specific about which tasks you mean when you say "make
> > > > sure
> > > > the SPDX tasks for automake run"? Do you mean do_create_spdx,
> > > > do_create_package_spdx or a different one?
> > >
> > > Specifically, do_create_package_spdx must be run for each package
> > > installed in the rootfs before do_create_rootfs_spdx runs. I thought
> > > that
> > >
> > >   do_create_rootfs_spdx[recrdeptask] +=3D "do_create_spdx
> > > do_create_package_spdx"
> > >
> > > would do this (the do_create_spdx is probably not necessary), since
> > > AFIACT, this is also how the packages get generated before being
> > > installed in the root file system via manipulation of
> > > do_rootfs[recrdeptask], but I think I'm missing something?
> >
> >
> > In packagegroups.bbclass there is this being added:
> >
> > do_create_package_spdx[deptask] =3D "do_create_spdx"
> > do_create_package_spdx[rdeptask] =3D ""
> >
> > and
> >
> > bitbake core-image-sato-sdk -g -c create_rootfs_spdx
> >
> > lists
> >
> > "core-image-sato-sdk.do_create_rootfs_spdx" ->
> "automake.do_create_package_spdx"
> >
> > in tasks-depends.dot if I disable it.
> >
> > I'm not 100% sure what is going on and should sleep but wanted to share
> > that before I did.
>
> I deleted those two lines and ran a build which passed testing.
>
> I don't think we need them with spdx 3 since it doesn't have the "hash
> changing" issue that we had that caused us to add that for spdx2?
>


Good catch, I missed that was related to packagegroups. No, we don't need
that for SPDX 3 (still need it for 2.2 though)


> The commit was:
>
> https://git.yoctoproject.org/poky/commit/meta/classes-recipe/packagegroup=
.bbclass?id=3D06b5f249ced23b6bc442758131832b8640164b44
>
> Cheers,
>
> Richard
>
>

--000000000000ac277a061d5d931a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Jul 16, 2024, 7:18=E2=80=AFAM Richard Purdie &=
lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@lin=
uxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On =
Tue, 2024-07-16 at 00:00 +0100, Richard Purdie via <a href=3D"http://lists.=
openembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.ope=
nembedded.org</a> wrote:<br>
&gt; On Mon, 2024-07-15 at 15:26 -0600, Joshua Watt wrote:<br>
&gt; &gt; On Mon, Jul 15, 2024 at 3:07=E2=80=AFPM Richard Purdie<br>
&gt; &gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank" rel=3D"noreferrer">richard.purdie@linuxfoundation.org</a>&gt; w=
rote:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; On Mon, 2024-07-15 at 14:40 -0600, Joshua Watt wrote:<br>
&gt; &gt; &gt; &gt; On Sat, Jul 13, 2024 at 12:44=E2=80=AFAM Richard Purdie=
<br>
&gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.or=
g" target=3D"_blank" rel=3D"noreferrer">richard.purdie@linuxfoundation.org<=
/a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; On Fri, 2024-07-12 at 09:58 -0600, Joshua Watt via=
<br>
&gt; &gt; &gt; &gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; This patch series add support for SPDX 3.0 an=
d sets it as the<br>
&gt; &gt; &gt; &gt; &gt; &gt; default.<br>
&gt; &gt; &gt; &gt; &gt; &gt; Currently it is not possible to have SPDX 2.2=
 and SPDX 3.0<br>
&gt; &gt; &gt; &gt; &gt; &gt; enabled at<br>
&gt; &gt; &gt; &gt; &gt; &gt; the same time<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; v2: Added tests and addressed feedback<br>
&gt; &gt; &gt; &gt; &gt; &gt; v3: Fixed several oe-selftest and build failu=
res<br>
&gt; &gt; &gt; &gt; &gt; &gt; v4: Fixed silly typo mistake in staging.bbcla=
ss<br>
&gt; &gt; &gt; &gt; &gt; &gt; v5: Reworked to make SPDX 3 output reproducib=
le by default.<br>
&gt; &gt; &gt; &gt; &gt; &gt; Variables<br>
&gt; &gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0 that introduce non-reprodu=
cible output are documented as<br>
&gt; &gt; &gt; &gt; &gt; &gt; such.<br>
&gt; &gt; &gt; &gt; &gt; &gt; v6: Many changes:<br>
&gt; &gt; &gt; &gt; &gt; &gt; =C2=A0 * Fixed bug where building baremetal i=
mages would break<br>
&gt; &gt; &gt; &gt; &gt; &gt; SPDX<br>
&gt; &gt; &gt; &gt; &gt; &gt; 2.2<br>
&gt; &gt; &gt; &gt; &gt; &gt; =C2=A0 * Most SPDX code is now in python libr=
ary files instead of<br>
&gt; &gt; &gt; &gt; &gt; &gt; tasks<br>
&gt; &gt; &gt; &gt; &gt; &gt; =C2=A0 * Removed dependency on pacakge_write_=
* tasks<br>
&gt; &gt; &gt; &gt; &gt; &gt; =C2=A0 * Fixed sstate selftest cases to accou=
nt for SPDX 3.0 task<br>
&gt; &gt; &gt; &gt; &gt; &gt; names<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; This had a lot of failures in testing I&#39;m afra=
id:<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/ty=
phoon/#/builders/83/builds/7134" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/713=
4</a><br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; This appears to be caused because the SPDX tasks are no=
t running<br>
&gt; &gt; &gt; &gt; for<br>
&gt; &gt; &gt; &gt; some recipes (e.g. automake). It looks like this like:<=
br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; =C2=A0 do_create_rootfs_spdx[recrdeptask] +=3D &quot;do=
_create_spdx<br>
&gt; &gt; &gt; &gt; do_create_package_spdx&quot;<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; is not actually strong enough to make sure the SPDX tas=
ks for<br>
&gt; &gt; &gt; &gt; automake<br>
&gt; &gt; &gt; &gt; run for e.g. core-image-sato-sdk, but I don&#39;t know =
why. I&#39;ll keep<br>
&gt; &gt; &gt; &gt; looking, but if anyone happens to know off the top of t=
heir head<br>
&gt; &gt; &gt; &gt; let<br>
&gt; &gt; &gt; &gt; me know<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Can you be specific about which tasks you mean when you say =
&quot;make<br>
&gt; &gt; &gt; sure<br>
&gt; &gt; &gt; the SPDX tasks for automake run&quot;? Do you mean do_create=
_spdx,<br>
&gt; &gt; &gt; do_create_package_spdx or a different one?<br>
&gt; &gt; <br>
&gt; &gt; Specifically, do_create_package_spdx must be run for each package=
<br>
&gt; &gt; installed in the rootfs before do_create_rootfs_spdx runs. I thou=
ght<br>
&gt; &gt; that<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0 do_create_rootfs_spdx[recrdeptask] +=3D &quot;do_create_sp=
dx<br>
&gt; &gt; do_create_package_spdx&quot;<br>
&gt; &gt; <br>
&gt; &gt; would do this (the do_create_spdx is probably not necessary), sin=
ce<br>
&gt; &gt; AFIACT, this is also how the packages get generated before being<=
br>
&gt; &gt; installed in the root file system via manipulation of<br>
&gt; &gt; do_rootfs[recrdeptask], but I think I&#39;m missing something?<br=
>
&gt; <br>
&gt; <br>
&gt; In packagegroups.bbclass there is this being added:<br>
&gt; <br>
&gt; do_create_package_spdx[deptask] =3D &quot;do_create_spdx&quot;<br>
&gt; do_create_package_spdx[rdeptask] =3D &quot;&quot;<br>
&gt; <br>
&gt; and <br>
&gt; <br>
&gt; bitbake core-image-sato-sdk -g -c create_rootfs_spdx<br>
&gt; <br>
&gt; lists<br>
&gt; <br>
&gt; &quot;core-image-sato-sdk.do_create_rootfs_spdx&quot; -&gt; &quot;auto=
make.do_create_package_spdx&quot;<br>
&gt; <br>
&gt; in tasks-depends.dot if I disable it.<br>
&gt; <br>
&gt; I&#39;m not 100% sure what is going on and should sleep but wanted to =
share<br>
&gt; that before I did.<br>
<br>
I deleted those two lines and ran a build which passed testing.<br>
<br>
I don&#39;t think we need them with spdx 3 since it doesn&#39;t have the &q=
uot;hash<br>
changing&quot; issue that we had that caused us to add that for spdx2?<br><=
/blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Good catch, I missed that was related to packagegrou=
ps. No, we don&#39;t need that for SPDX 3 (still need it for 2.2 though)</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<br>
The commit was:<br>
<a href=3D"https://git.yoctoproject.org/poky/commit/meta/classes-recipe/pac=
kagegroup.bbclass?id=3D06b5f249ced23b6bc442758131832b8640164b44" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">https://git.yoctoproject.org/poky/com=
mit/meta/classes-recipe/packagegroup.bbclass?id=3D06b5f249ced23b6bc44275813=
1832b8640164b44</a><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div></div>

--000000000000ac277a061d5d931a--

