Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 494CAC3DA64
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 12:22:10 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.5931.1722946923730326548
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 05:22:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k7j+dGto;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: rybczynska@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70d1a74a43bso392221b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 05:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722946923; x=1723551723; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gB7NVAne5DUU5JAmRdWON953OW0/9Sn1JGBeiGVtPWE=;
        b=k7j+dGtobibGxZDtceVDJc6xSDfGe2RQBDMI2J7VW3hKu+jjRcPDK1xPHRCy4/SW13
         TEtVVyacM1NBF8ZwgogfyfxdPXd35Nd63Pj5gLU7vIQIyTPU8IJNWQscGwP6t67s4xt8
         Iusi1JyjI+XGY810c7kr6k8ViFwDEPAAbxPV8nlPlBIAUAKSDC5cD9JalfoR54+et6JJ
         6Sr6sq+PY+1AOOsOYIkGW0xNByU/Ua3Migf3rD4a7ziRdRgReDbzYY/tFeNNWCRGt8Fz
         Pd8UciwD/PI2kympuagKNzGAo/Eb7bzEXDzR4yRYAerofk/YRabY5DtuPE0ycCLW2RjZ
         CQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722946923; x=1723551723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gB7NVAne5DUU5JAmRdWON953OW0/9Sn1JGBeiGVtPWE=;
        b=jeiRrfhUCcDhGJdfETJMh0dLW9v6DOkFpySV2iovoKlkjKC48Tz9bRsezK0AYXGo2x
         NvT7iw/+3dMuSBKibt5ktR0l90TcmQoAgqOZuwYehJhgh1N0DNAgCvoTS1XkYQNiOb7A
         T0VtcbfM5uSm6LvkPqAcuEflzhP7OUTyLzvaKkaq4B2F7ngM9eo7xD/KOYy+n+4Jhd8F
         t2KnHypyRmMxKnBL4TFGgJi8Cw/GcxRLmVdTpXUdhKofr3OoQMJqbdHci7UqNzAtjud1
         v23a6NG5hvtwBVzNngq1to7RmVnhhKqrTHBi1ddNgmz8yMBpGcOsFPBlynNmZ/gjUD71
         KLUQ==
X-Gm-Message-State: AOJu0YyYOxwqpMRdtkcibcwBbTcChXDB9YM3CapeJPmoY7VhdomMMN0X
	AVIwwx/42KVEM9DIwmyufk0usZ+nO+K1fJWAXXKbDILsAQbOv21lFC0aUrzjZg4IOi5JODuNGOx
	gC0GnFZ0Mbb0TFt/QxgHZjkmDYbo=
X-Google-Smtp-Source: AGHT+IFL9mzGijlXnE3+H+6OS+LrGDIpLvfeTkm/NE6C4NhIVJ1BHjC8mFjJIg1xTO8ChWE4NmOjgoKpiC6vbSs0YRo=
X-Received: by 2002:a05:6a20:1e43:b0:1c6:ac1c:630d with SMTP id
 adf61e73a8af0-1c6ac1c63f1mr7763486637.1.1722946922876; Tue, 06 Aug 2024
 05:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240804130936.1339847-1-richard.purdie@linuxfoundation.org>
 <CAApg2=TWFeTC5SML6mGhwo3dXBA_PyoJykxGfjqa=1b=JwFNfA@mail.gmail.com>
 <0162f8e09fb05ba123eab2987ecdf52b9340dd65.camel@linuxfoundation.org>
 <CAApg2=RLDhjfF31BOdE-hFAKqJswWi5X2YM-J_b6YHSGEoo3_g@mail.gmail.com> <153f71725fc8d9fafe9da91d0af0262cb8af878f.camel@linuxfoundation.org>
In-Reply-To: <153f71725fc8d9fafe9da91d0af0262cb8af878f.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 6 Aug 2024 14:21:51 +0200
Message-ID: <CAApg2=TmyDs9JTpa-M6Gk1CxS7jJF67dKc4B9OMfmpn8C8Ekrw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] cve_check: Use a local copy of the database
 during builds
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004e1a09061f02d795"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 12:22:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203017

--0000000000004e1a09061f02d795
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 6:40=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2024-08-05 at 18:16 +0200, Marta Rybczynska wrote:
> > On Mon, Aug 5, 2024 at 5:50=E2=80=AFPM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > > On Mon, 2024-08-05 at 17:41 +0200, Marta Rybczynska wrote:
> > > > On Sun, Aug 4, 2024 at 3:09=E2=80=AFPM Richard Purdie via
> lists.openembedded.org <richard.purdie=3D
> linuxfoundation.org@lists.openembedded.org> wrote:
> > > > >
> > >
> > > > Do you plan to keep it for longer or is it for testing only? If for
> > > > longer, I would likely keep old variable names for cve-update-nvd2-
> > > > native.bb
> > > >
> > > > Did it help with the corruption issue?
> > >
> > > It is really hard to say as it is an intermittent issue. I ended up
> > > merging it earlier on today, partly as I wanted to get it wider
> > > exposure for testing to see whether it really does help or not. It wi=
ll
> > > take time to see whether it recurs.
> > >
> > > Regardless, operating on a local copy of the database rather than a
> > > shared copy in DL_DIR should help performance and avoid some sets of
> > > potential NFS issues.
> > >
> > > Which variable names did you want to keep? I kept the wider
> > > class/public names the same and only changed things within the recipe
> > > to try and ensure fewer compatibility issues. Happy to look at a
> > > different version of the patch/approach on top of mine.
> > >
> >
> >
> > My approach was basically the same, but I kept the DL_DIR for the initi=
al
> > download for compatibility reasons. If it actually helps, I will send a=
n
> > update of variable names. Let's wait a day, what do you think?
>
> My version keeps the initial download in DL_DIR?
>

I meant the variable name. I'm sending a patch, will be easier to discuss
this way.

Kind regards,
Marta

--0000000000004e1a09061f02d795
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 5, 2024 at 6:40=E2=80=AFP=
M Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">=
richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Mon, 2024-08-05 at 18:16 +0200, Marta =
Rybczynska wrote:<br>
&gt; On Mon, Aug 5, 2024 at 5:50=E2=80=AFPM Richard Purdie &lt;<a href=3D"m=
ailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@=
linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; On Mon, 2024-08-05 at 17:41 +0200, Marta Rybczynska wrote:<br>
&gt; &gt; &gt; On Sun, Aug 4, 2024 at 3:09=E2=80=AFPM Richard Purdie via <a=
 href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank=
">lists.openembedded.org</a> &lt;richard.purdie=3D<a href=3D"mailto:linuxfo=
undation.org@lists.openembedded.org" target=3D"_blank">linuxfoundation.org@=
lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; &gt; Do you plan to keep it for longer or is it for testing only?=
 If for<br>
&gt; &gt; &gt; longer, I would likely keep old variable names for cve-updat=
e-nvd2-<br>
&gt; &gt; &gt; <a href=3D"http://native.bb" rel=3D"noreferrer" target=3D"_b=
lank">native.bb</a><br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Did it help with the corruption issue?<br>
&gt; &gt; <br>
&gt; &gt; It is really hard to say as it is an intermittent issue. I ended =
up<br>
&gt; &gt; merging it earlier on today, partly as I wanted to get it wider<b=
r>
&gt; &gt; exposure for testing to see whether it really does help or not. I=
t will<br>
&gt; &gt; take time to see whether it recurs.<br>
&gt; &gt; <br>
&gt; &gt; Regardless, operating on a local copy of the database rather than=
 a<br>
&gt; &gt; shared copy in DL_DIR should help performance and avoid some sets=
 of<br>
&gt; &gt; potential NFS issues.<br>
&gt; &gt; <br>
&gt; &gt; Which variable names did you want to keep? I kept the wider<br>
&gt; &gt; class/public names the same and only changed things within the re=
cipe<br>
&gt; &gt; to try and ensure fewer compatibility issues. Happy to look at a<=
br>
&gt; &gt; different version of the patch/approach on top of mine.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; My approach was basically the same, but I kept the DL_DIR for the init=
ial<br>
&gt; download for compatibility reasons. If it actually helps, I will send =
an<br>
&gt; update of variable names. Let&#39;s wait a day, what do you think?<br>
<br>
My version keeps the initial download in DL_DIR?<br></blockquote><div><br><=
/div><div>I meant the variable name. I&#39;m sending a patch, will be easie=
r to discuss this way.</div><div><br></div><div>Kind regards,</div><div>Mar=
ta <br></div></div></div>

--0000000000004e1a09061f02d795--

