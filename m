Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62FECFD354
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 11:24:29 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.9240.1728645868520632904
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 04:24:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eVbxlvPw;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20c71603217so17821225ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 04:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728645868; x=1729250668; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AV52spDn/AawCEVwBFTzTNog6cxjFPRSV2R9hxvhsEY=;
        b=eVbxlvPw+7m71Vnne7mFnikfuoHpIGJ4wJg9p0KeGU+eYhE9PfjSUA05w4H47Hww3F
         bkHuu8Yyrgb8zoQxKiMQAsGwc0K6Aa2VnLoCeMM3sPipVrHumHzcf3ccQYX2Wu3NwNsa
         kAA+Ie3+8HjWsojJOogWlD+kqjFV3e4URKQRm2dftx6ILS+dWOQqBRl1ECpGqrxtyEVZ
         FhXQQZqQwmTl8clHiHVz5Nkm62Gqmquwpq5eAqQiBwxPqXKt4T9eUAeEjnbXgaeaq+oJ
         R2lJYh9CJHJ3Llvf7jefZp1Y90XAfQDeE0mlBJeL6zF3vKquwCVW2z7ubZWgM9W0jZzC
         VoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728645868; x=1729250668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AV52spDn/AawCEVwBFTzTNog6cxjFPRSV2R9hxvhsEY=;
        b=j3iFepYB/4ubH967yDtV+tILDZgGSeikOmffgTazBnpUvIRJ8nLksCIbzR5VtK2wOG
         8b9YrQnrV2W5CNRAcsdN5bsJUyoBCC0/kKon3+YvgdJ9OoVZ5w0jn2tpmKAvbudX10qW
         /bOqSC0L3wFeqpcMfdzPf70Z/hHWdm8v4iFHIXTvmlB4q3azN1kjNRKJIY9jIVurjd2q
         wjdWH+aMTIDf67gVcK3rxOV7vv8rrnUtWv3VN6elmHkeIwVxCbBzn2bIaV7ManD2UWh8
         IUBtu1QzxVS94x5PhFUesoHGsrvwJads+qip3H5qrxq3Q1laycnXkDM5PR02yL1GTD1b
         w0PA==
X-Gm-Message-State: AOJu0YwUzVgPkxKwlR1uCPRCUr9cphnmFirb3+4gKsTaXWZpOBTxvP9R
	MC6vE64/3UAezobA8x++Jtre1ryBomx46vSpQEurCf38sr3JBRHah7IxqVcO5MLglld8LTmFtLX
	3lcm166b7+falON6C+RW+AObhgRA=
X-Google-Smtp-Source: AGHT+IG8ag3bkLN4eH5gXlL1DJfQju+fB1aCtq9gvOVdJppOKlQCZACV/3nPgsgM1n3NIaN3k1vHEymKfDgVvxh7sI8=
X-Received: by 2002:a17:903:240e:b0:20b:7ec0:ee21 with SMTP id
 d9443c01a7336-20ca1434e12mr39211435ad.19.1728645867709; Fri, 11 Oct 2024
 04:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <17FD60BEC9A54A4B.2207@lists.openembedded.org> <8281d9cb51a5e652f99ed998fd71c7b6a84e1e63.camel@linuxfoundation.org>
 <CAApg2=RmrYULa7KMi6EMdGAhW3-uVA81ggVJg5BGDMSg0M0nLA@mail.gmail.com> <0092cbd5b19661f2c88084cc2c00811c7c2f6563.camel@linuxfoundation.org>
In-Reply-To: <0092cbd5b19661f2c88084cc2c00811c7c2f6563.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 11 Oct 2024 13:24:16 +0200
Message-ID: <CAApg2=R_F-YUiv23wC_ACZFNe590h+RGxJ4R=-n2uT_LE5rqFg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-check-update-nvd2-native: Incremement
 DL_DIR database location
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Marta Rybczynska <marta.rybczynska@syslinbit.com>, Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="000000000000e32cab062431ba0a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 11:24:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205675

--000000000000e32cab062431ba0a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 1:19=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2024-10-11 at 13:17 +0200, Marta Rybczynska wrote:
> >
> > On Fri, Oct 11, 2024 at 1:02=E2=80=AFPM Richard Purdie via
> > lists.openembedded.org
> > <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> > >
> > > I now do have an example of a corrupted database:
> > >
> > > https://valkyrie.yocto.io/pub/shared-failure-data/nvdcve_2-1.db
> > >
> > > I'm not sure why this is happening but the older releases are all
> > > accessing the DB over NFS which makes me nervous. We're seeing a
> > > lot of
> > > failures on the new cluster, hopefully this will help isolate the
> > > problem.
> > >
> >
> >
> > The database isn't completely corrupted, it looks like it is partial,
> > however. What was the error
> > that you got in that build? Any or just strange results? I'm running
> > a verification vs a fresh database.
>
>
> https://valkyrie.yoctoproject.org/#/builders/23/builds/238/steps/14/logs/=
stdio
>
> Exception: sqlite3.DatabaseError: database disk image is malformed
>
>
Managed to get the same error with the sqlite command line.

Marta

--000000000000e32cab062431ba0a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 11, 2024 at 1:19=E2=80=AF=
PM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Fri, 2024-10-11 at 13:17 +0200, Marta=
 Rybczynska wrote:<br>
&gt; <br>
&gt; On Fri, Oct 11, 2024 at 1:02=E2=80=AFPM Richard Purdie via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; &lt;richard.purdie=3D<a href=3D"mailto:linuxfoundation.org@lists.opene=
mbedded.org" target=3D"_blank">linuxfoundation.org@lists.openembedded.org</=
a>&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; I now do have an example of a corrupted database:<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://valkyrie.yocto.io/pub/shared-failure-data/nvdc=
ve_2-1.db" rel=3D"noreferrer" target=3D"_blank">https://valkyrie.yocto.io/p=
ub/shared-failure-data/nvdcve_2-1.db</a><br>
&gt; &gt; <br>
&gt; &gt; I&#39;m not sure why this is happening but the older releases are=
 all<br>
&gt; &gt; accessing the DB over NFS which makes me nervous. We&#39;re seein=
g a<br>
&gt; &gt; lot of<br>
&gt; &gt; failures on the new cluster, hopefully this will help isolate the=
<br>
&gt; &gt; problem.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; The database isn&#39;t completely corrupted, it looks like it is parti=
al,<br>
&gt; however. What was the error<br>
&gt; that you got in that build? Any or just strange results? I&#39;m runni=
ng<br>
&gt; a verification vs a fresh database.<br>
<br>
<a href=3D"https://valkyrie.yoctoproject.org/#/builders/23/builds/238/steps=
/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://valkyrie.yocto=
project.org/#/builders/23/builds/238/steps/14/logs/stdio</a><br>
<br>
Exception: sqlite3.DatabaseError: database disk image is malformed<br>
<br></blockquote><div><br></div><div>Managed to get the same error with the=
 sqlite command line.</div><div><br></div><div>Marta <br></div></div></div>

--000000000000e32cab062431ba0a--

