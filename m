Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D69FDD59D99
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 12:16:24 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47021.1765800977784661027
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 04:16:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dqqq6WIh;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64472c71fc0so2824650d50.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 04:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765800977; x=1766405777; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cr1Z368GWx9hXt2IVuqU3kjuP6x//KmH0V+Om2+7mBE=;
        b=dqqq6WIhcbuSceyhp1kYcjQwLK9AAcbMzGqg0jphGqZ1KpcHncUvELnDyGTlt2gnTS
         zqwiaEN72h9bnfHkvyk2eCthDLTouVuOJHr/z6lEoxr8Yf4MXnINH21i/s4OwErH0OZM
         ST6rGsd4c+yA3/WbshJ99/ZWjRh1TD02zMTpDOR8CT6R/YuLLnoMiVs18sbEMiWlvrl8
         Ajp5zCyqdTOhsCB1khFQBmIS+2xMhedZ9gjldW0B7D9VY8+iZmYWthsfiLm6qdPEdU7a
         MCOkVn9VRq93Bs6lfeDNV3x+YXyooDrniWuAaSoIsX2wf0ZvhW4wMDyQ8txjm2w5CAmZ
         PXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765800977; x=1766405777;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cr1Z368GWx9hXt2IVuqU3kjuP6x//KmH0V+Om2+7mBE=;
        b=xBwcZrmV9shgEtvuvpkCfmUDwR9JNf7Co9DumVXtihxn/cD8wdfUeMuvNJjeWpDRdk
         EFD62aHIPp2GAH7BVoZaiwpschvtKxiqnbIZ7uNeoeGfy43YkHI9rCZ+g0/Sw68x52Zs
         pn2LJAgm6uR6O8aCKdpIEVUDLBseaWLKC2+G36Q02bSigYST0ivs8WuVyidN/UxqliSB
         F2ngAMKSxR0kD+pX6mzwflg333AE/RauR6/E6MPbEa72eZUqfC2dGYz70aKnQ/6vPtL9
         8MhP25APgB3lBFYv7DAoLQ3uJur7YEM2zzLkC0kq57wv83TdXcySbGXymUC6aFYUCRVa
         uQlQ==
X-Gm-Message-State: AOJu0Yz+SH0muXfiWpIGYjbKmQP13rp5hx7gUhdDf/iLEBaBenaHEztW
	AmMaZivMdT+JVwtyNatMW0JQx25xvgqJlnEau8XK/0PhpS3MJYzHtmvTANmmoLjm5jJj1W3p9BD
	q4A3BNLW4DQjHRizST0Ni/NZylH5DQ8k=
X-Gm-Gg: AY/fxX4vNhZMzpH4+lkcIGKzyTo5e+03wUGggIjZHyX3lHJx98l0TRybXaM4QZFDjUM
	F4A5Tban7aY7hA8WaHaGTUID6gE4bwUWfUopka3loSKn1qC6g3Dr8l1IdQDOa9j0KwgIAlyr/eU
	Fq1NC4XzHvGkM5J1wLDNuidPsi6pPv+t5JaRaSMf4ej8781qA4AaTLoTji1dolH1Vng3BUNIjHX
	YqKEqQaZUBbm1M7dQrHPQwgy5fNDBFiyLc3Rx0ehadnMD/acad3DgvsnLid4HgKdkwwHIxi0bZU
	+L4TrwBOZZSAPMz0qv4mfvLfUWJwokaMWp1cqD3+/NsIBHbWjVSZucK/JhevexNv4Dqw5VM/fRI
	4Br+VeojEcNa/8A==
X-Google-Smtp-Source: AGHT+IGjVvPA9qD9QitsxzsJLQTPbVJKEZoHoVVU57cG+CFO93oEDAbFYRiCXsItBVmHj7U5xByjK+vGxGsEOWVQgt8=
X-Received: by 2002:a05:690e:118b:b0:645:5b1f:4cc0 with SMTP id
 956f58d0204a3-6455b1f75b5mr6239557d50.70.1765800976771; Mon, 15 Dec 2025
 04:16:16 -0800 (PST)
MIME-Version: 1.0
References: <20251213095528.1027888-1-raj.khem@gmail.com> <741b70037a7d648b9191cccb0cb73768bb80acad.camel@pbarker.dev>
In-Reply-To: <741b70037a7d648b9191cccb0cb73768bb80acad.camel@pbarker.dev>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Dec 2025 04:16:05 -0800
X-Gm-Features: AQt7F2pNADjYwKz_lm6BQa7zyv9nV_mfnJI8wCMyZSJlald_nokFo6xnthuao8Q
Message-ID: <CAMKF1sq70d9GKHbs3czyOwhboYn_NOiiP2L+oDbBfuSUksyy7w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kexec-tools: Add riscv64 support
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f6f0970645fc93e9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 12:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227735

--000000000000f6f0970645fc93e9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 6:31=E2=80=AFAM Paul Barker <paul@pbarker.dev> wrot=
e:

> On Sat, 2025-12-13 at 01:55 -0800, Khem Raj via lists.openembedded.org
> wrote:
> > These patches are used in several distros and are part of kexec-tools
> > riscv-collab fork. Unfortunately upstreaming for this fork is slow
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../kexec-tools/riscv64-hotplug-support.patch |   25 +
> >  .../kexec/kexec-tools/riscv64-support.patch   | 1469 +++++++++++++++++
> >  .../kexec/kexec-tools_2.0.31.bb               |    4 +-
> >  3 files changed, 1497 insertions(+), 1 deletion(-)
> >  create mode 100644
> meta/recipes-kernel/kexec/kexec-tools/riscv64-hotplug-support.patch
> >  create mode 100644
> meta/recipes-kernel/kexec/kexec-tools/riscv64-support.patch
>
> Hi Khem,
>
> RISC-V support does appear to be part of kexec-tools 2.0.32 [1], how do
> these patches relate to what has been merged upstream?
>
> Perhaps we can upgrade to 2.0.32 and apply any remaining diff on top of
> that.
>
> [1]:
> https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/tree/ke=
xec/arch/riscv?h=3Dv2.0.32
>
> Thanks,
>

Yes I had this patch before the merge of support upstream however I did see
the merge and was waiting for release and I have already sent v2 same day
as this patch so this patch is superseded see

https://lore.kernel.org/openembedded-core/20251213183522.1194934-1-raj.khem=
@gmail.com/



> --
> Paul Barker
>
>

--000000000000f6f0970645fc93e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 15, 2025 at 6:31=E2=80=AFAM=
 Paul Barker &lt;<a href=3D"mailto:paul@pbarker.dev">paul@pbarker.dev</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;=
border-left-color:rgb(204,204,204)">On Sat, 2025-12-13 at 01:55 -0800, Khem=
 Raj via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targe=
t=3D"_blank">lists.openembedded.org</a><br>
wrote:<br>
&gt; These patches are used in several distros and are part of kexec-tools<=
br>
&gt; riscv-collab fork. Unfortunately upstreaming for this fork is slow<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../kexec-tools/riscv64-hotplug-support.patch |=C2=A0 =C2=A025 +=
<br>
&gt;=C2=A0 .../kexec/kexec-tools/riscv64-support.patch=C2=A0 =C2=A0| 1469 +=
++++++++++++++++<br>
&gt;=C2=A0 .../kexec/<a href=3D"http://kexec-tools_2.0.31.bb" rel=3D"norefe=
rrer" target=3D"_blank">kexec-tools_2.0.31.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 4 +-<br>
&gt;=C2=A0 3 files changed, 1497 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/riscv64=
-hotplug-support.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/riscv64=
-support.patch<br>
<br>
Hi Khem,<br>
<br>
RISC-V support does appear to be part of kexec-tools 2.0.32 [1], how do<br>
these patches relate to what has been merged upstream?<br>
<br>
Perhaps we can upgrade to 2.0.32 and apply any remaining diff on top of<br>
that.<br>
<br>
[1]: <a href=3D"https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-too=
ls.git/tree/kexec/arch/riscv?h=3Dv2.0.32" rel=3D"noreferrer" target=3D"_bla=
nk">https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/tree/=
kexec/arch/riscv?h=3Dv2.0.32</a><br>
<br>
Thanks,<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yes I had this p=
atch before the merge of support upstream however I did see the merge and w=
as waiting for release=C2=A0and I have already sent v2 same day as this pat=
ch so this patch is superseded see</div><div dir=3D"auto"><br></div><div di=
r=3D"auto"><div><a href=3D"https://lore.kernel.org/openembedded-core/202512=
13183522.1194934-1-raj.khem@gmail.com/">https://lore.kernel.org/openembedde=
d-core/20251213183522.1194934-1-raj.khem@gmail.com/</a></div><br></div><div=
 dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left=
:1ex;border-left-color:rgb(204,204,204)"><br>
-- <br>
Paul Barker<br>
<br>
</blockquote></div></div>

--000000000000f6f0970645fc93e9--

