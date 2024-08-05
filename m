Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A16C3DA4A
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 16:16:38 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.12050.1722874595661314205
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Aug 2024 09:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HegFXVCQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1ff1cd07f56so83559905ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 09:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722874595; x=1723479395; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wfSvfYcfRr4SZKAwKwAMq/ceBUJkJtDqg8+NDttV4IQ=;
        b=HegFXVCQFxYUy35qlhFyy85Jr/gDYdKWHLVZaS4GESSf137YnB7yt7Ct85wpAPm6Oa
         fdu7B5gEVJ+rjHZ40kB9Eewk+ze4HaPjCBXOQ+9e4B7aqwKHqbtFbKuufERFkace9HfA
         uSPXYwlDpfXx2HO5aQy7sgKGcRvu5LjtWHsOmZwhCKqY9ag3d1Q6YUg2rIniTVLS6oRA
         8/BJt1zQQ9Zy9RdWvL1/a9pG+0UUh9m5xmU/7DZJ/qhLrcNe8tWZvSb0xVrhXYOuYMD5
         ypuPyUmDtfZ0c04/u61Jd5jtS215Ek1wbA2M3SGcyp3SghwpVslfdsfDAcP+qQ7pJn69
         XVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722874595; x=1723479395;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wfSvfYcfRr4SZKAwKwAMq/ceBUJkJtDqg8+NDttV4IQ=;
        b=TpbmK5UUM11Qm1Kw16RrZm45D2pF4nATMJ8GSWaI+bvv6ktlffYXoTMi8ScnlSD6ur
         LtHLwBYASpYvPtAZ/xfZJ2Uju96VBeoDBuItQGOCEzCpy6iFej6olW3vYse3ntThF5ar
         8DTqCiqmnAao2ioe0SGNggD/KHtynFE2+ZNCE/wdqrwatDsEQYT8WSzFwi/AyPcrmSSU
         JFztmD3ny5oRfoXT7x5AqsWb/CELPoHa4lNiqdIq8NgpepNifzIVGUj0Biw3m6BWbtpW
         7KOi/TwF8anOtgsZXSBjv1udSV15FNPaXeyeT5RVjMV1HnAOkcEXp8ZF52lvdGaG5gWM
         sBhw==
X-Gm-Message-State: AOJu0Yyt8czPkxiKE1FhD2D6h0NGPY6N5Cq9rltMC2Ac9r861HVKe/+4
	lIASKtWksSjER06diqHM3Y5bttHHguApzMgaCRpUiJZJvrNEc6Cm5QEVl0v0Z61cQro4BDuvFVL
	qwgAwlq6HdGk+Z9KGrm9vkhE6vCucEw==
X-Google-Smtp-Source: AGHT+IH4Zzh0mhIYrBDZJYyCfnXYUfXaKZ09EzX5OSlgb7UuskW3SMJUUFqKK5Bna7ys0NQOsbNoYNoRu9ElT2pQgdE=
X-Received: by 2002:a17:902:f2d1:b0:1fb:1cc3:646d with SMTP id
 d9443c01a7336-1ff57297c12mr116883645ad.29.1722874594763; Mon, 05 Aug 2024
 09:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240804130936.1339847-1-richard.purdie@linuxfoundation.org>
 <CAApg2=TWFeTC5SML6mGhwo3dXBA_PyoJykxGfjqa=1b=JwFNfA@mail.gmail.com> <0162f8e09fb05ba123eab2987ecdf52b9340dd65.camel@linuxfoundation.org>
In-Reply-To: <0162f8e09fb05ba123eab2987ecdf52b9340dd65.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 5 Aug 2024 18:16:22 +0200
Message-ID: <CAApg2=RLDhjfF31BOdE-hFAKqJswWi5X2YM-J_b6YHSGEoo3_g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] cve_check: Use a local copy of the database
 during builds
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000036adca061ef20052"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 16:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203005

--00000000000036adca061ef20052
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 5:50=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2024-08-05 at 17:41 +0200, Marta Rybczynska wrote:
> > On Sun, Aug 4, 2024 at 3:09=E2=80=AFPM Richard Purdie via lists.openemb=
edded.org
> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> > > Rtaher than trying to use a sqlite database over NFS from DL_DIR,
> > > work from
> > > a local copy in STAGING DIR after fetching.
> >
> > I saw this patch this morning when I was nearly done with my version
> > and waiting for the fresh build to finish...
>
> Sorry, I never saw an email saying you were writing the patch or a
> reply to my mail asking about it, I only wanted to try and help :(
>

Bad communication from my side, sorry.


>
> > Do you plan to keep it for longer or is it for testing only? If for
> > longer, I would likely keep old variable names for cve-update-nvd2-
> > native.bb
> >
> > Did it help with the corruption issue?
>
> It is really hard to say as it is an intermittent issue. I ended up
> merging it earlier on today, partly as I wanted to get it wider
> exposure for testing to see whether it really does help or not. It will
> take time to see whether it recurs.
>
> Regardless, operating on a local copy of the database rather than a
> shared copy in DL_DIR should help performance and avoid some sets of
> potential NFS issues.
>
> Which variable names did you want to keep? I kept the wider
> class/public names the same and only changed things within the recipe
> to try and ensure fewer compatibility issues. Happy to look at a
> different version of the patch/approach on top of mine.
>

My approach was basically the same, but I kept the DL_DIR for the initial
download for compatibility reasons. If it actually helps, I will send an
update of variable names. Let's wait a day, what do you think?

Regards,
Marta

--00000000000036adca061ef20052
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 5, 2024 at 5:50=E2=80=AFP=
M Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">=
richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Mon, 2024-08-05 at 17:41 +0200, Marta =
Rybczynska wrote:<br>
&gt; On Sun, Aug 4, 2024 at 3:09=E2=80=AFPM Richard Purdie via <a href=3D"h=
ttp://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.op=
enembedded.org</a> &lt;richard.purdie=3D<a href=3D"mailto:linuxfoundation.o=
rg@lists.openembedded.org" target=3D"_blank">linuxfoundation.org@lists.open=
embedded.org</a>&gt; wrote:<br>
&gt; &gt; Rtaher than trying to use a sqlite database over NFS from DL_DIR,=
<br>
&gt; &gt; work from<br>
&gt; &gt; a local copy in STAGING DIR after fetching.<br>
&gt; <br>
&gt; I saw this patch this morning when I was nearly done with my version<b=
r>
&gt; and waiting for the fresh build to finish...<br>
<br>
Sorry, I never saw an email saying you were writing the patch or a<br>
reply to my mail asking about it, I only wanted to try and help :(<br></blo=
ckquote><div><br></div><div>Bad communication from my side, sorry.<br></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Do you plan to keep it for longer or is it for testing only? If for<br=
>
&gt; longer, I would likely keep old variable names for cve-update-nvd2-<br=
>
&gt; <a href=3D"http://native.bb" rel=3D"noreferrer" target=3D"_blank">nati=
ve.bb</a><br>
&gt; <br>
&gt; Did it help with the corruption issue?<br>
<br>
It is really hard to say as it is an intermittent issue. I ended up<br>
merging it earlier on today, partly as I wanted to get it wider<br>
exposure for testing to see whether it really does help or not. It will<br>
take time to see whether it recurs.<br>
<br>
Regardless, operating on a local copy of the database rather than a<br>
shared copy in DL_DIR should help performance and avoid some sets of<br>
potential NFS issues.<br>
<br>
Which variable names did you want to keep? I kept the wider<br>
class/public names the same and only changed things within the recipe<br>
to try and ensure fewer compatibility issues. Happy to look at a<br>
different version of the patch/approach on top of mine.<br></blockquote><di=
v><br></div><div>My approach was basically the same, but I kept the DL_DIR =
for the initial</div><div>download for compatibility reasons. If it actuall=
y helps, I will send an</div><div>update of variable names. Let&#39;s wait =
a day, what do you think?</div><div><br></div><div>Regards,</div><div>Marta=
 <br></div></div></div>

--00000000000036adca061ef20052--

