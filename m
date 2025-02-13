Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B20C0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 09:53:20 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.7458.1739440392555723656
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 01:53:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BqXg0pyQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43946b5920cso4020975e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 01:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739440391; x=1740045191; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cdjJEkYYd50oR6Hkyv4SZ0G40z2EMtSvLiDv3LHEmjw=;
        b=BqXg0pyQvJRSM3abupnL47vIwxm7A8g3qdDKYIEREjom29OvgoZUfOClUfBOCf3+pR
         V17PZdji/UqV8cHMXTm9jPTL9E5d1B+1w/Z4pS0aWCRvF7hKoKD/cTcWgUj8OSIzZ2fj
         8z3sostYEoh0W8CsXyPUKrp4yB3M/s+oANJoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739440391; x=1740045191;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cdjJEkYYd50oR6Hkyv4SZ0G40z2EMtSvLiDv3LHEmjw=;
        b=XA+L/choak1C9xhIPUwm6rqq7W6j6CmoVAjpla2MpZRRXnbqnaVIAvQZss2yx9M/0F
         KcydDA+4Kv21T3Emop2x9U0wX+Xd4UmJW2qD1Nn/0fobyxvYmQOe8V3oLfKvs0DrfLqM
         929qX/xhy9N8v8epm+e14B2vtgIAKBibRiz4aWnLRV2/bngmQKFS4bcNwnXb3pSMmqiP
         2dYcqyxnZ0bttZcFlYKr6f3kUyuhHqKRxQ36XbGGvne4kjS8zJFiRZH3d4tdQWHbcCWQ
         eaHv1k0JfAri0AwBMl08NerG7SyKMeVINz8QVVNSa7dEjI8ipI2cBuHrgKxkP3vnKGn5
         3Fgw==
X-Forwarded-Encrypted: i=1; AJvYcCUZ0L1Glcn+/FiBjzn5os0G3b8CCfV0ADSI/zns9RwvwOYF/nNo1p6WtM08m+6/Y5Av1ITdvcZ78Phj8R8NTbEqiQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxwjXCJ4JIdCvj5kMCANw0Uo438JlCnzIhXnqhJw2aYckoxNYth
	QFDnMuyMtuBH/7h6PwQ2e3a0ChDNSd1yEEu2xAP0XJXByslNqdd3vAob3wacficjCDge7FCyL+L
	MfNE4L4O4deM67VOP9qh1L9azw97AOSzLuznuCQ==
X-Gm-Gg: ASbGncsVwyAfXyJU7kv0AwKWV26IiUrjJHF+aV8ZONQMI9j0SMa6kbP4lECSFR7SBm+
	MlALXgk4TXs4NiPjHnCxJud6JO8DKxovVD42f3y6K7jAlCSdLV+L6EryqK/hdcaVTnAQt/UbIsh
	j8EI5U7OPyYKTiPOzqT6Sz3yUIkfs=
X-Google-Smtp-Source: AGHT+IHtQvV04f1GgnmjDw37VUOTe6z3D2r3gELAw4cxtAcf5Fb2HmczDI7oOxI1pYRP/haCk0HxKt3cFmdYc++K00o=
X-Received: by 2002:a05:600c:3b8f:b0:439:34d3:63c0 with SMTP id
 5b1f17b1804b1-43960185dc9mr29496505e9.16.1739440390860; Thu, 13 Feb 2025
 01:53:10 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb9Fr9MFy5uub2_pTRWmVbt96OWBJ5ty+eAB9Qn+LYa_Wg@mail.gmail.com>
 <CANNYZj-PbWQDa5hAc5X6sqHVMvJ0QE01XXwytya8rprwvSsqag@mail.gmail.com>
 <d22a4cec5e317e62f1f44d8d9a810cf4745ccb48.camel@linuxfoundation.org>
 <CAMSfU+6d7gvYkjC5sbUPu6D_hOOF43ZUnM_NMEwmLUxZn6ysSA@mail.gmail.com>
 <4e883a56eb9b74a5663d7ad258194d16b1c79912.camel@linuxfoundation.org>
 <CAMSfU+44qwScnoDP4As37TNHYvwx5mBmTdGEQgq_VVz7woh6sQ@mail.gmail.com>
 <CAMSfU+4MY-JVmWPUixJYiUrtKd2CXHrJuQ0sMJJrrkLzrvAuvA@mail.gmail.com>
 <CANNYZj_8o=SHOn-kRBxzwc8vp3omCL290SA-jKkL_En1m2SWEA@mail.gmail.com>
 <2c1bcbb1d5b75b925d9af2bd300d376a973e314e.camel@linuxfoundation.org> <CANNYZj88RSkyChK6NwJU2OVxmGXzD2W8UcGyYe92ii8v8hdFqQ@mail.gmail.com>
In-Reply-To: <CANNYZj88RSkyChK6NwJU2OVxmGXzD2W8UcGyYe92ii8v8hdFqQ@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 13 Feb 2025 10:52:44 +0100
X-Gm-Features: AWEUYZlFyLK2BobtxmnLq_5iJ-cIFNzN-E7-_YXQ0Bo-65PWqGSyQ_sDFqz1vnQ
Message-ID: <CAMSfU+5Af0=w0N_kK1HLx4nNnQqGOv54C2qC-e7Q0Lm5NQ0Vrw@mail.gmail.com>
Subject: Re: [yocto] [OE-core] Yocto Project Status 11 Feb. 2025 (WW07)
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Yocto Mailing list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009b0c1f062e0306a0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 09:53:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211312

--0000000000009b0c1f062e0306a0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 13 f=C3=A9vr. 2025 =C3=A0 10:50, Alexander Kanavin <alex.kanavin@gm=
ail.com> a
=C3=A9crit :

> On Thu, 13 Feb 2025 at 10:45, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > I don't think the github repo is going to work for either YP or OE
> > since there are repositories in both that use pull requests and we
> > can't have a one size fits all message. I think that means we would
> > have to do this with a .github directory in the repos themselves.
> >
> > Also note, the global repos probably need TSC agreement. On a per repo
> > basis it would fall to the maintainer.
> >
> > Yoann: Thanks for looking into this!
>
> Alright. Then Yoann, can you propose patches specifically to these
> two, with the aim of gently pushing back against new pull
> requests/redirecting them to mailing list? It doesn't need to be
> perfect, just a proposal (or several proposals) that we can select
> from and refine.
>
> https://github.com/openembedded/bitbake
> https://github.com/openembedded/openembedded-core
>

That would mean to create a ".github/" directory in those. Are we ready to
do this?


> Alex
>


--=20
Yoann Congal
Smile ECS - Tech expert

--0000000000009b0c1f062e0306a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 13=
 f=C3=A9vr. 2025 =C3=A0=C2=A010:50, Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; a =C3=A9crit=C2=A0:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 13 Feb =
2025 at 10:45, Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; I don&#39;t think the github repo is going to work for either YP or OE=
<br>
&gt; since there are repositories in both that use pull requests and we<br>
&gt; can&#39;t have a one size fits all message. I think that means we woul=
d<br>
&gt; have to do this with a .github directory in the repos themselves.<br>
&gt;<br>
&gt; Also note, the global repos probably need TSC agreement. On a per repo=
<br>
&gt; basis it would fall to the maintainer.<br>
&gt;<br>
&gt; Yoann: Thanks for looking into this!<br>
<br>
Alright. Then Yoann, can you propose patches specifically to these<br>
two, with the aim of gently pushing back against new pull<br>
requests/redirecting them to mailing list? It doesn&#39;t need to be<br>
perfect, just a proposal (or several proposals) that we can select<br>
from and refine.<br>
<br>
<a href=3D"https://github.com/openembedded/bitbake" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/openembedded/bitbake</a><br>
<a href=3D"https://github.com/openembedded/openembedded-core" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/openembedded/openembedded-core</=
a><br></blockquote><div><br></div><div>That would mean to create a &quot;.g=
ithub/&quot; directory in those. Are we ready to do this?</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
Alex<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS - Tech expert<br></font></div></div><=
/div></div>

--0000000000009b0c1f062e0306a0--

