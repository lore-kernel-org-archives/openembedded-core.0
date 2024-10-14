Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F71ED1812E
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 16:16:07 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.1133.1728922562913197630
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 09:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M0C0TEy3;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: rybczynska@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7ea7e250c54so826470a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 09:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728922562; x=1729527362; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uWX535MMw/GuHxmL9gU0ThrBBEv+D+/jvpde7wj7s58=;
        b=M0C0TEy3SLUexyHPaQOOOBKpTUZMsmSuz8UFX7LLfnfKsCdsXAKv/en0Bu3nvkcDBC
         /NlOz+A5KWYOxhzzZdqMxldbi130cIngOIALLQ4C0QdUO3l3ZGVf1v1PQU8I5jdMd0Md
         a8Cp2AOawl+lJQXZscRZfce0DErf5kr9zCUTQ/aJMnuppw0B4Q2oBQMuX+hoCSl14LM9
         zCE8XJKaL7z3+rd4pZaTmZbJuapOxVfPw2vVgxVEC/1m9ZSv4WXU6x2kVTGwKNq/0/A9
         boyX49YIPhbaqRyhwVQc88YYD9g4xzAw8ONmMRgzCxwg+CUzty9buuj3N0/wqFvDk9kr
         +iSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728922562; x=1729527362;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uWX535MMw/GuHxmL9gU0ThrBBEv+D+/jvpde7wj7s58=;
        b=fKhUn28Fq905zqXlJ1JwJVpMiKAi+8nP0toszoeffnAJ6ZJ1UF3wtuiPI8O3naIQK/
         SnLIfZqoK8Q5WkYqKe2m9I8mBxMtHiEVJHhXCu2iGSxGpDGhrI4fXNMp5AGESZlPFe8T
         KXU7OPAp37JjV0am51vlv990lZMqL2+XFw1jwr9ciqiAlsAa1N8d4gWdm+B3sxhNTRTm
         xylUi7ZoWnBwp2e3TXzHYiFWiHzpdYu60uPyAhomRackJ7xmzliJrVnSgyE5YgP+f7XT
         yd6TnkbIrm4udhafo0TueKC3Zzid52VNj8w0voWJa2T1SzuT9YAKmkBbTL+6gLJxwYRf
         8rHg==
X-Gm-Message-State: AOJu0Yz3ZRvCLjyOo1vqZ7bZ+LLnHJXuc84Z/0tU2O6IrvL0GopclpBl
	ceLkWUWZS2eaXR2t54+nYl9gDZKzcgtG8cycqkYrdD1mDcwFDgLwAUaKg/whJIm3wZZcFHWrFLC
	ixlFkW/bJqVTnmfeZ2Phr7uvgn0I=
X-Google-Smtp-Source: AGHT+IE1I3pQhUqyPXtNoMWHRmNEIxfJtctrP/vfky0UKX4yrmQVn5nS3jt2W7mNPhR8NciPKNbJAnLylJgM94y/N6Q=
X-Received: by 2002:a17:90b:3bce:b0:2e2:d175:5f8d with SMTP id
 98e67ed59e1d1-2e3152cada8mr11560420a91.10.1728922562118; Mon, 14 Oct 2024
 09:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <17FD60BEC9A54A4B.2207@lists.openembedded.org> <8281d9cb51a5e652f99ed998fd71c7b6a84e1e63.camel@linuxfoundation.org>
 <CAApg2=RmrYULa7KMi6EMdGAhW3-uVA81ggVJg5BGDMSg0M0nLA@mail.gmail.com>
 <0092cbd5b19661f2c88084cc2c00811c7c2f6563.camel@linuxfoundation.org>
 <CAApg2=R_F-YUiv23wC_ACZFNe590h+RGxJ4R=-n2uT_LE5rqFg@mail.gmail.com>
 <17FDF275CE46F21A.4702@lists.openembedded.org> <08e6b15b245d20bcece798cac0ffbaa11c6be13b.camel@linuxfoundation.org>
In-Reply-To: <08e6b15b245d20bcece798cac0ffbaa11c6be13b.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 14 Oct 2024 18:15:50 +0200
Message-ID: <CAApg2=QMcH1rZRrZS14W5534GZh39JsVAaLm=YBP4SbOJEjnhg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-check-update-nvd2-native: Incremement
 DL_DIR database location
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Marta Rybczynska <marta.rybczynska@syslinbit.com>, Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="00000000000028d4890624722772"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 16:16:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205787

--00000000000028d4890624722772
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 6:07=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2024-10-13 at 08:26 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Fri, 2024-10-11 at 13:24 +0200, Marta Rybczynska wrote:
> > >
> > >
> > > On Fri, Oct 11, 2024 at 1:19=E2=80=AFPM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > On Fri, 2024-10-11 at 13:17 +0200, Marta Rybczynska wrote:
> > > > >
> > > > > On Fri, Oct 11, 2024 at 1:02=E2=80=AFPM Richard Purdie via
> > > > > lists.openembedded.org
> > > > > <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org>
> > > > > wrote:
> > > > > >
> > > > > > I now do have an example of a corrupted database:
> > > > > >
> > > > > > https://valkyrie.yocto.io/pub/shared-failure-data/nvdcve_2-1.db
> > > > > >
> > > > > > I'm not sure why this is happening but the older releases are
> > > > > > all
> > > > > > accessing the DB over NFS which makes me nervous. We're
> > > > > > seeing a
> > > > > > lot of
> > > > > > failures on the new cluster, hopefully this will help isolate
> > > > > > the
> > > > > > problem.
> > > > > >
> > > > >
> > > > >
> > > > > The database isn't completely corrupted, it looks like it is
> > > > > partial,
> > > > > however. What was the error
> > > > > that you got in that build? Any or just strange results? I'm
> > > > > running
> > > > > a verification vs a fresh database.
> > > >
> > > >
> https://valkyrie.yoctoproject.org/#/builders/23/builds/238/steps/14/logs/=
stdio
> > > >
> > > > Exception: sqlite3.DatabaseError: database disk image is
> > > > malformed
> > > >
> > > >
> > >
> > >
> > > Managed to get the same error with the sqlite command line.
> >
> >
> > I merged this patch as it would rule out a lot of things.
>
> It looks like I didn't do this. I will do so, then we can rule out a
> few things.
>
>
I've analysed the corrupted file a bit. This is somewhat complex as I do
not have a "golden" copy with the
exact same content. However, what I can see:
1.  This is not a partial download, quite new CVEs from 2024 are there (as
from other years)
2. Damaged records come from various years (a theory to check: if they all
have been recently modified)
3. Only part of the database is broken and both NVD and PRODUCTS tables.
You can read various CVEs depending on how you format your SELECT (getting
all cve_ids works fine, for example)

If you suspect there are jobs accessing the file that shouldn't, what about
installing inotify hooks on the file?

As I've never seen such a corruption on my side, I could imagine either an
external job, or an effect of a re-download of the database during tests
(but this should use locks).

Regards,
Marta

--00000000000028d4890624722772
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 14, 2024 at 6:07=E2=80=AF=
PM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Sun, 2024-10-13 at 08:26 +0100, Richa=
rd Purdie via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; On Fri, 2024-10-11 at 13:24 +0200, Marta Rybczynska wrote:<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; On Fri, Oct 11, 2024 at 1:19=E2=80=AFPM Richard Purdie<br>
&gt; &gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; &gt; On Fri, 2024-10-11 at 13:17 +0200, Marta Rybczynska wrote:<b=
r>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; On Fri, Oct 11, 2024 at 1:02=E2=80=AFPM Richard Purdie =
via<br>
&gt; &gt; &gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"norefe=
rrer" target=3D"_blank">lists.openembedded.org</a><br>
&gt; &gt; &gt; &gt; &lt;richard.purdie=3D<a href=3D"mailto:linuxfoundation.=
org@lists.openembedded.org" target=3D"_blank">linuxfoundation.org@lists.ope=
nembedded.org</a>&gt;<br>
&gt; &gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; I now do have an example of a corrupted database:<=
br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <a href=3D"https://valkyrie.yocto.io/pub/shared-fa=
ilure-data/nvdcve_2-1.db" rel=3D"noreferrer" target=3D"_blank">https://valk=
yrie.yocto.io/pub/shared-failure-data/nvdcve_2-1.db</a><br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; I&#39;m not sure why this is happening but the old=
er releases are<br>
&gt; &gt; &gt; &gt; &gt; all<br>
&gt; &gt; &gt; &gt; &gt; accessing the DB over NFS which makes me nervous. =
We&#39;re<br>
&gt; &gt; &gt; &gt; &gt; seeing a<br>
&gt; &gt; &gt; &gt; &gt; lot of<br>
&gt; &gt; &gt; &gt; &gt; failures on the new cluster, hopefully this will h=
elp isolate<br>
&gt; &gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; problem.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; The database isn&#39;t completely corrupted, it looks l=
ike it is<br>
&gt; &gt; &gt; &gt; partial,<br>
&gt; &gt; &gt; &gt; however. What was the error<br>
&gt; &gt; &gt; &gt; that you got in that build? Any or just strange results=
? I&#39;m<br>
&gt; &gt; &gt; &gt; running<br>
&gt; &gt; &gt; &gt; a verification vs a fresh database.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <a href=3D"https://valkyrie.yoctoproject.org/#/builders/23/b=
uilds/238/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https:/=
/valkyrie.yoctoproject.org/#/builders/23/builds/238/steps/14/logs/stdio</a>=
<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Exception: sqlite3.DatabaseError: database disk image is<br>
&gt; &gt; &gt; malformed<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; Managed to get the same error with the sqlite command line.<br>
&gt; <br>
&gt; <br>
&gt; I merged this patch as it would rule out a lot of things.<br>
<br>
It looks like I didn&#39;t do this. I will do so, then we can rule out a<br=
>
few things.<br>
<br></blockquote><div><br></div><div>I&#39;ve analysed the corrupted file a=
 bit. This is somewhat complex as I do not have a &quot;golden&quot; copy w=
ith the</div><div>exact same content. However, what I can see:</div><div>1.=
=C2=A0 This is not a partial download, quite new CVEs from 2024 are there (=
as from other years)</div><div>2. Damaged records come from various years (=
a theory to check: if they all have been recently modified)</div><div>3. On=
ly part of the database is broken and both NVD and PRODUCTS tables. You can=
 read various CVEs depending on how you format your SELECT (getting all cve=
_ids works fine, for example)</div><div><br></div><div>If you suspect there=
 are jobs accessing the file that shouldn&#39;t, what about installing inot=
ify hooks on the file?</div><div><br></div><div>As I&#39;ve never seen such=
 a corruption on my side, I could imagine either an external job, or an eff=
ect of a re-download of the database during tests (but this should use lock=
s).<br></div><div><br></div><div>Regards,</div><div>Marta<br></div></div></=
div>

--00000000000028d4890624722772--

