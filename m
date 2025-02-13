Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05866C021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 11:17:21 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.8919.1739445434711484303
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 03:17:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Cv2toLG/;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38dc5764fc0so632823f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 03:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739445433; x=1740050233; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wCH6aeYuqW/GN3wVcRxvQ3z6cjsevq29drBpo/H0/4k=;
        b=Cv2toLG/1tMW280ZxH4GOYf4IBlx58HGFexaZU+uNb2QIvWy5yGb7aHxdc5WCT5HCZ
         sAxnbBsTkSUBDjKRxUXxUifralnBbfWhQ816uX1zaN4FXVBMbJbYuwxjm1OnmYc9+5VS
         c4XqGGxKzlkevYNa2rMOK9MuWte38vQpIJ4xI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739445433; x=1740050233;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wCH6aeYuqW/GN3wVcRxvQ3z6cjsevq29drBpo/H0/4k=;
        b=Afsg48kmuLn7Q+Y67M/xjoxrjWDJGJ6XQLzDgr+bNY+5YRU7XGP+MjnsGy35ZKV93S
         H1hU2W/yGusqYlSf0uSXVYyZ67xYx399X9aqA7Eg1CTQD5Hsgel3DoDHitiY2uXofCc9
         HxY8kgrovdpG+Mxb4HogzvKAjEQF4lMvUrFGnOQzhD+sf6nY3itjcXJjT0wzw76Do6Gw
         ZEFyP9XXT4UZmQFj7oroHvL92VEeFhZs1g5OAuXIEBPvle4LFHu+WhbVtNnDHeJ+EMFz
         4YPnjbwu8RKkTNY7Ykap/hI0cF9qsGQqmJvGosCSozqMcIJr1lZ8luLzMjKcOrKfRiCX
         RkGw==
X-Forwarded-Encrypted: i=1; AJvYcCXlUcCMY4jwAYeV3Cqnyxzjkms3Ttvzq2hCB17iZydamfNeQmsWNN+Z7ZJCNNV2Zj5FV7EK39WHlsyam5W/TskEgQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxtajMFLIto3WlepjHszUTQHrn9fuLg1QmXtf0EZLOfi66SQyUI
	4LrfySr09c9Lsv8X4zBmb8xit1+Bp1cfw3EYkjWEdm0YQWdpZEQfgi5J4pAPKA3cdbfAwbFLaJx
	8dx0zFUiAUwkjGRRDqwlFpSqwm9ciu6FbqB9lVg==
X-Gm-Gg: ASbGnctlci/pVSLoISc3AcEA6MAJFBPV66mf0QMozbj5MmDDB50FC7IXQPoDux3c7QF
	+0TxxgI+S2KZndjFOhuTUC0XqQl8gWVov9SiyJ3GlGZCzbA2UlmDK9JENZ4IW+bVuEaeEM4FZ
X-Google-Smtp-Source: AGHT+IGjStHhDD40GEr3Pbpi3LTRvczOGOvPVy2bZdMPiQBkdMgcB3ibT6l3VnIxJclrCX9rjJSVwZMTrJq4x7edtgU=
X-Received: by 2002:a5d:5f89:0:b0:38d:e572:4dc2 with SMTP id
 ffacd0b85a97d-38dea2e9439mr7475744f8f.40.1739445428437; Thu, 13 Feb 2025
 03:17:08 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb9Fr9MFy5uub2_pTRWmVbt96OWBJ5ty+eAB9Qn+LYa_Wg@mail.gmail.com>
 <CANNYZj-PbWQDa5hAc5X6sqHVMvJ0QE01XXwytya8rprwvSsqag@mail.gmail.com>
 <d22a4cec5e317e62f1f44d8d9a810cf4745ccb48.camel@linuxfoundation.org>
 <CAMSfU+6d7gvYkjC5sbUPu6D_hOOF43ZUnM_NMEwmLUxZn6ysSA@mail.gmail.com>
 <4e883a56eb9b74a5663d7ad258194d16b1c79912.camel@linuxfoundation.org>
 <CAMSfU+44qwScnoDP4As37TNHYvwx5mBmTdGEQgq_VVz7woh6sQ@mail.gmail.com>
 <CAMSfU+4MY-JVmWPUixJYiUrtKd2CXHrJuQ0sMJJrrkLzrvAuvA@mail.gmail.com>
 <CANNYZj_8o=SHOn-kRBxzwc8vp3omCL290SA-jKkL_En1m2SWEA@mail.gmail.com>
 <2c1bcbb1d5b75b925d9af2bd300d376a973e314e.camel@linuxfoundation.org>
 <CANNYZj88RSkyChK6NwJU2OVxmGXzD2W8UcGyYe92ii8v8hdFqQ@mail.gmail.com>
 <CAMSfU+5Af0=w0N_kK1HLx4nNnQqGOv54C2qC-e7Q0Lm5NQ0Vrw@mail.gmail.com>
 <CANNYZj_8qPoOjhR=uR_7WRZu0V0YdhbcN43fA6mbnQBU5198fw@mail.gmail.com> <14a350e52c4e567fa995b08978b418fe1e43831e.camel@linuxfoundation.org>
In-Reply-To: <14a350e52c4e567fa995b08978b418fe1e43831e.camel@linuxfoundation.org>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 13 Feb 2025 12:16:41 +0100
X-Gm-Features: AWEUYZlFJg4F9nNDA_Lh9ae1YewCMJQsaGyZtv8WxFRM5SwhM5Cz0PuldGjDVak
Message-ID: <CAMSfU+6s3fLkwGfK=5esnnW9yJd7Ln9WiULJ8TUP2gxhZaz1Sg@mail.gmail.com>
Subject: Re: [yocto] [OE-core] Yocto Project Status 11 Feb. 2025 (WW07)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Yocto Mailing list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000de5434062e043289"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 11:17:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211325

--000000000000de5434062e043289
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 13 f=C3=A9vr. 2025 =C3=A0 11:03, Richard Purdie <
richard.purdie@linuxfoundation.org> a =C3=A9crit :

> On Thu, 2025-02-13 at 10:54 +0100, Alexander Kanavin wrote:
> > On Thu, 13 Feb 2025 at 10:53, Yoann Congal <yoann.congal@smile.fr>
> wrote:
> > > > > I don't think the github repo is going to work for either YP or O=
E
> > > > > since there are repositories in both that use pull requests and w=
e
> > > > > can't have a one size fits all message. I think that means we wou=
ld
> > > > > have to do this with a .github directory in the repos themselves.
> >
> > > That would mean to create a ".github/" directory in those. Are we
> ready
> > > to do this?
> >
> > I think so. RP pretty much confirmed this just above?
>
> I said that it was probably the only viable way we've seen so far. I'm
> not happy at the idea. I've not said "yes we should" as yet.
>
> I'm wondering if we should set up that default repo saying "no pull
> requests" then ask repos that do accept them to override the message
> with their own pull request file? The default repo is only used as a
> fallback. Does an empty file do the right thing just to remove the
> default message?
>

Just tested, it does : with an empty ".github/pull_request_template.md" a
repo following the github workflow gets the global default "Add your
description here..." template.


> Cheers,
>
> Richard
>
>
>
>
>

--=20
Yoann Congal
Smile ECS - Tech expert

--000000000000de5434062e043289
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 13=
 f=C3=A9vr. 2025 =C3=A0=C2=A011:03, Richard Purdie &lt;<a href=3D"mailto:ri=
chard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt=
; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Thu, 2025-02-13 at 10:54 +0100, Alexander Kanavin wrote:<br>
&gt; On Thu, 13 Feb 2025 at 10:53, Yoann Congal &lt;<a href=3D"mailto:yoann=
.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt; wrote:<br=
>
&gt; &gt; &gt; &gt; I don&#39;t think the github repo is going to work for =
either YP or OE<br>
&gt; &gt; &gt; &gt; since there are repositories in both that use pull requ=
ests and we<br>
&gt; &gt; &gt; &gt; can&#39;t have a one size fits all message. I think tha=
t means we would<br>
&gt; &gt; &gt; &gt; have to do this with a .github directory in the repos t=
hemselves.<br>
&gt; <br>
&gt; &gt; That would mean to create a &quot;.github/&quot; directory in tho=
se. Are we ready=C2=A0<br>
&gt; &gt; to do this?<br>
&gt; <br>
&gt; I think so. RP pretty much confirmed this just above?<br>
<br>
I said that it was probably the only viable way we&#39;ve seen so far. I&#3=
9;m<br>
not happy at the idea. I&#39;ve not said &quot;yes we should&quot; as yet.<=
br>
<br>
I&#39;m wondering if we should set up that default repo saying &quot;no pul=
l<br>
requests&quot; then ask repos that do accept them to override the message<b=
r>
with their own pull request file? The default repo is only used as a<br>
fallback. Does an empty file do the right thing just to remove the<br>
default message?<br></blockquote><div><br></div><div>Just tested, it does :=
 with an empty &quot;.github/pull_request_template.md&quot; a repo followin=
g the github workflow gets the global default &quot;Add your description he=
re...&quot; template.</div><div>=C2=A0 <br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS - Tech expert<br></font></div></div><=
/div></div>

--000000000000de5434062e043289--

