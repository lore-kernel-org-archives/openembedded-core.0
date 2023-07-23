Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E11C0015E
	for <webhook@archiver.kernel.org>; Sun, 23 Jul 2023 03:09:52 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.19013.1690081784126751758
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jul 2023 20:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=P7iXqK67;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1b0138963ffso2640061fac.0
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 20:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690081783; x=1690686583;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QWGp/ACEaGtMbPcgcXbtO7x2vK8EwRlmu7I3u6XjWIM=;
        b=P7iXqK67zo7CiL83MwahcjCyqMSzH7PU3FXV4ebQU/czqNyfcuhXREw6HSHGsaPlxj
         8fOIzymh/Ltt230SKeMwHXLdnbUtoFGGWr0puuvq1ZJ31onuntvYKmdKwzFzR6meJMpW
         hZVHreb9Gs+CQxRziZguXkjSPH+9XNbLWL+pCvAA9eHOyYKRIP5k9YQtwWx+tB4gzovx
         0MUUO7DDQCojK1sVwTvgDc9yEZVkrdjM+kKvC5yIldfSedHj521UZaOQQkDY/dlWalJm
         gnPIkoVaxe++drfIDNw00IKcLjChsEWlmf4jdoaYm+rcg0IbV8p3MQiYuw0jNrxXUiRN
         ikUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690081783; x=1690686583;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QWGp/ACEaGtMbPcgcXbtO7x2vK8EwRlmu7I3u6XjWIM=;
        b=GL7nfLJORwmos/YknH0Kl4/L5POZx8SKgUM/xt+BECy0Sotb/pDMMHGkZf0OvYHTy2
         CovkHCo22vxT4RpAaW3VCsnDs5BL0CAdd3WpoC1uHQ/cbJoYNsK8sG/zUyoXhDF9ZNls
         NStEg5NgGt2rcAOVismiCjwg76ua1nCDAYwjsU8QzytuMpUjqrGc/ponnm91ldLXsfbN
         AQeJm8Binopl7LOzq6Q6ZwxYPZ+mIuKiXktMknX9VdbKbigVPAt51o9whk74c5L0kUlJ
         pABcyLJyH0KLnofGhlbbPL7euzQIZwzvN5UlMuEtSZSMQxiJ41e659N9MWWRTttbBHbQ
         FSRw==
X-Gm-Message-State: ABy/qLZ88rDKfidF1UjDnAkinozBj9HIQQ68Nz2IHdwbsVTTi9ZPlpQK
	t3zQeqL60siftsxWTJ01YmGuIt48OLZ4BcefrJI=
X-Google-Smtp-Source: APBJJlH5lzWZBEnEcCRF+o82F9tItj7aKwKe9DmN4zubRd4vMQT8I1QzZfUmx8ckxOJ+1GgYDKHE3P8zQFfki8K9MFg=
X-Received: by 2002:a05:6871:299:b0:19f:9495:95ff with SMTP id
 i25-20020a056871029900b0019f949595ffmr7382737oae.27.1690081783057; Sat, 22
 Jul 2023 20:09:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230711201042.38285-1-raj.khem@gmail.com> <B1D99B0D-B820-43F0-A699-C7A121D74205@arm.com>
 <CAMKF1spwCD0=UumG2ffh+_1F8AVcsLxxs63+pDkbkvHAwYr7sA@mail.gmail.com> <20230721143426fc21c0b0@mail.local>
In-Reply-To: <20230721143426fc21c0b0@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 22 Jul 2023 20:09:32 -0700
Message-ID: <CAMKF1sqZ=vBnyMRwhRxs_6ToheBEApv-7M73uCM9LnZuJv5dPw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] tunes: Add support for sve instructions on armv8/armv9
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000052123506011ed49b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 03:09:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184741

--00000000000052123506011ed49b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 21, 2023 at 7:34 AM Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> Hello Khem,
>
> On 12/07/2023 09:12:54-0700, Khem Raj wrote:
> > On Wed, Jul 12, 2023 at 3:29=E2=80=AFAM Ross Burton <Ross.Burton@arm.co=
m> wrote:
> > >
> > > On 11 Jul 2023, at 21:10, Khem Raj via lists.openembedded.org
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> > > >
> > > > This helps in defining correct compiler options and configure optio=
ns
> > > > for glibc and overall ABI for toolchain
> > >
> > > Given this, shouldn=E2=80=99t the glibc patch respect the tune flags =
instead
> of forcibly turning sve off?
> >
> > It will as a follow up.
>
> I think we are still waiting for the follow up.


Hmm I was thinking of sending it separate since it does not impact this
pull I am away this week perhaps will do upon return next week

>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--00000000000052123506011ed49b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Jul 21, 2023 at 7:34 AM Alexandre Belloni &lt;<a hr=
ef=3D"mailto:alexandre.belloni@bootlin.com">alexandre.belloni@bootlin.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello Khem,<br>
<br>
On 12/07/2023 09:12:54-0700, Khem Raj wrote:<br>
&gt; On Wed, Jul 12, 2023 at 3:29=E2=80=AFAM Ross Burton &lt;<a href=3D"mai=
lto:Ross.Burton@arm.com" target=3D"_blank">Ross.Burton@arm.com</a>&gt; wrot=
e:<br>
&gt; &gt;<br>
&gt; &gt; On 11 Jul 2023, at 21:10, Khem Raj via <a href=3D"http://lists.op=
enembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org=
</a> &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" tar=
get=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This helps in defining correct compiler options and configur=
e options<br>
&gt; &gt; &gt; for glibc and overall ABI for toolchain<br>
&gt; &gt;<br>
&gt; &gt; Given this, shouldn=E2=80=99t the glibc patch respect the tune fl=
ags instead of forcibly turning sve off?<br>
&gt; <br>
&gt; It will as a follow up.<br>
<br>
I think we are still waiting for the follow up.</blockquote><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Hmm I was thinking of sending it separate si=
nce it does not impact this pull I am away this week perhaps will do upon r=
eturn next week</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto">
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--00000000000052123506011ed49b--

