Return-Path: <navinreddy23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D7DC561F8
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 14:16:23 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39634.1771596982156677253
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 06:16:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cKcBfE3C;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: navinreddy23@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59e64657f0cso2386422e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 06:16:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771596980; cv=none;
        d=google.com; s=arc-20240605;
        b=AGGWI4tD4k3hWKPyckYIMkx6klhNS8yD6gZPxHH4lwfrWZ/aq0zsJSJZyFkpq8MFyL
         r8KjOXjnuxo5V+aUd8ywkbQqZSNzasJV3ABYSLh9Pm7A0dkf9WFkiaBkSbrNRy+icDMG
         RSzCHspYI2ynYRsghq+suy2LksRuFe1UXux3mdhZtW1Mjb2N4Nz3VyXiA8LMJzmH9Ana
         U5XmdI2/ofNaJkobH1EZLINh7eoPXYs96G8K3aRPQWQKhrCwvugWsugGR+wpzD65abE3
         TAqZbYcYNKZH34QeBrfXL+yeGu0h89Otgi8KQ3epEyydRAWtR1GKH7wgvta3cMhdIKvX
         0O2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=63qISF6aVnIPcbw0mFrlYV52I1CvVKTBhtGUrIRfj2o=;
        fh=ke8gtA3jdqx75e3fVOkTookWBp0UiauaPy7/s3M1zFQ=;
        b=le4dFDpVdCX0CHA4++p0zDLF7FES6u/CKKimMQtZWsTYeg+YDcb1mvhE2BvG5Tzmyh
         K+hg6EeAw9ZfbwPtH0PdBBeC0W204pdG7M/7n0ddbfN2IuHqDXFWhm+98IREVptGid4r
         uoCo1sF8I2nsZPdggUIz2t1CRt0PSBLG1iGIjF7ZKWlfG4YajOoErvabX/d4odGMGXbY
         H7HLmx65vy1ukJuCLPiMpGKZ8QQLazWL9LwQg0SPjKdBEeJAtBVf9j5bt0PXC9QrpILS
         Z1x94o49Wt9+CI5Mg7GD4ZTLjw7v8K874I3dFOXATC2wdpiJGVxvb2avm0Ou+9RWF4Te
         YT7A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771596980; x=1772201780; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=63qISF6aVnIPcbw0mFrlYV52I1CvVKTBhtGUrIRfj2o=;
        b=cKcBfE3CcL9hVgR2SIQCyWxCVhK3FuMBu5KjItI0dJK5SIJIseHw795lkYytqnHNfo
         Db1Z13xnTo8ObeKpAnORz8sX1TQqHp3KbDh2niNB4fvsr0DpyveTe03MQV4ALjQ0wiQC
         LlxceMjLR/D8NLwNYeDaP6oB6QPwaVtadW6KSolMe6HTOjMc8s1knx7KCeQ324cm5f7Z
         NUrE3HeMuU/DmKrA8g/+Ft4IrbP43TeubRld69etkemkKQb3HzH+3Kw45tAgxJbEMfQa
         SHpjASmcFsP2cgL9cQ8uh+ilLCWOqOr7DoQpdgW4rKjcIMhBn9x9zoG8Ppd2qvoTGAgn
         VnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771596980; x=1772201780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63qISF6aVnIPcbw0mFrlYV52I1CvVKTBhtGUrIRfj2o=;
        b=nfvwXd/ypLOZ1B0KhqRtQZPBL19caG4LWFzH0x4fQG0FtxzC9/6Svum7HILLKyieHA
         nAChiDzNrmcbMOWqeF1UQOpnmhVUfi3nOU4C4TeinSeS27hp/EjjqUuG+pEMR7z8uV1E
         mGpng0KDxhSzSnU6h+wP8vVYuPLiA98dJy7GwsC2X4krGYvFLcxzSRWRIDbx60965Ks2
         +BoXqRvmAF1YMydmOIPEqjRWns8gElIC78YJmqiDdfd+xA4tAp6b4wUZDdpAZ7AfIkgs
         z5GrIZ9GmiogEHuMkySkWu9ZjcKAjXe81E3Zne0wQkGVNPqGa/P5Q80Hz6RCvAptY+wg
         OCTw==
X-Gm-Message-State: AOJu0Yzk5Z9jmuIaF2uQHTGf6am5QQrEkk+ipL2cDYnZovWwhRgZNdL1
	MKH1R2fEWFeadp0Vj6HaZRFY/0yIO/AvEfBydJG2eZ1Ru8w+Z+20VkrVA5s39LdOrfBb+NUQOXZ
	0ynUBL3VP/Qku2qdYt06R7BI1t2MHp9tAOYPg
X-Gm-Gg: AZuq6aLsKWvYul0Fl9PT3JgIkmljNjh6rI1GERj7pwNoXsSI8DCshf69e8lqoyGr1xf
	sT0/5UoIbD0K5w/xhewfdJYBMruMhDvbQKik3ls15gP8mI7RmeTaizOMo2lQ6R0eSghoedDa1xu
	rwhaLlNLPRdvlUMcaNpJLfkc3jVZOiQVL+lSNjyjyUQKRQ0B2ZmInr7WuR6s8MDhdZjCHyylQEW
	ADo7dutDybXmfGRfz/A19RnllhyWnq9j81Hw4qRLFcijMPbQ1Iz+OsraglQDCf1F1dSpdU9xZLV
	gobSj/qPcvxVm6Um+nUe+WuXxUfmeDw7P8RZgav3
X-Received: by 2002:a05:6512:114a:b0:59e:340:e557 with SMTP id
 2adb3069b0e04-59f6d357cd8mr6854764e87.19.1771596979462; Fri, 20 Feb 2026
 06:16:19 -0800 (PST)
MIME-Version: 1.0
References: <nOYT.1771515503207887946.99kd@lists.openembedded.org>
 <DGJ22TW6NQ7J.26KZXIRN87D9B@smile.fr> <48326.1771577023423291484@lists.openembedded.org>
 <DGJNZS5SAUYX.5NJP35H0U9G3@smile.fr> <CACNOY6JqR97WvxzCxPcp_BMrcB3xr-MKUHGyDuH0OWcF3L=gzg@mail.gmail.com>
 <DGJOKQ7XZ0AN.1UKSUPQOVW00S@smile.fr>
In-Reply-To: <DGJOKQ7XZ0AN.1UKSUPQOVW00S@smile.fr>
From: Navin R <navinreddy23@gmail.com>
Date: Fri, 20 Feb 2026 15:15:43 +0100
X-Gm-Features: AaiRm51ao99H6nxsk6QL1R5BkDhQ_IgYCjVyv6nrYQV8fvivrvDRk5DiA4YJq_Q
Message-ID: <CACNOY6+wwymxjvMtmGrX=nV5AdTvTZmuBoPmvtBj5cdUiXa_Gw@mail.gmail.com>
Subject: Re: Private: Re: [OE-core] How to backport latest go version?
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Content-Type: multipart/alternative; boundary="000000000000a5659c064b4210d5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 14:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231514

--000000000000a5659c064b4210d5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Forwarding for better visibility.

Best regards,
Navin Reddy




On Fri, Feb 20, 2026 at 10:27=E2=80=AFAM Yoann Congal <yoann.congal@smile.f=
r> wrote:

> On Fri Feb 20, 2026 at 10:10 AM CET, Navin R wrote:
> > Thank you for the response!
> > Could you please provide some tips or pointers on how to go about it? I
> am
> > very new to Yocto and open source.
> >
> > =E2=9D=AF find . -name "*create_go*"
> >
> ./openembedded-core/scripts/lib/recipetool/__pycache__/create_go.cpython-=
312.pyc
> > ./openembedded-core/scripts/lib/recipetool/create_go.py
> >
> > I believe that this file also needs to be updated to work with
> > go-mod-update-modules. Not sure if that is going to be then part of
> > meta-lts-mixins.
>
> For this I have no idea but a general hunch.
>
> You should really try to send this to the list (target the "group" if
> you use the website) instead of just me : I'm not the maintainer of the
> mixin layers (not even a user).
>
> >
> > Best regards,
> > Navin Reddy
> >
> >
> >
> >
> > On Fri, Feb 20, 2026 at 10:00=E2=80=AFAM Yoann Congal <yoann.congal@smi=
le.fr>
> wrote:
> >
> >> (Re-adding the list in CC)
> >>
> >> On Fri Feb 20, 2026 at 9:43 AM CET, navinreddy23 via
> >> Lists.Openembedded.Org wrote:
> >> > Hello Yoann,
> >> >
> >> > Perfect, it works well!
> >> > I have added it as a new layer, checked out the branch you specified
> and
> >> changed the preferred version to 1.25.7.
> >> >
> >> > Thank you.
> >> >
> >> > Another issue I had with Scarhtgap recipetool is that the generated
> >> recipes do not work right away.
> >> > While that was not true for Whinlatter poky build (with bitbake
> steup).
> >> >
> >> > I see that go-mod-update-modules (
> >>
> https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/g=
o-mod-update-modules.bbclass?h=3Dwhinlatter
> >> ) is missing from the recipes. What is the best way to have these
> features
> >> in scarthgap branch?
> >>
> >> Since backporting this class to scarthgap is not permitted (as it is a
> new
> >> feature). Maybe your best guess is to get it merged in the mixin layer=
?
> >>
> >> --
> >> Yoann Congal
> >> Smile ECS
> >>
> >>
>
>
> --
> Yoann Congal
> Smile ECS
>
>

--000000000000a5659c064b4210d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Forwarding for better visibility.</div><div><br></div=
><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_si=
gnature"><div dir=3D"ltr">Best regards,<div>Navin Reddy</div><div><br></div=
><div><br></div></div></div></div><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 20,=
 2026 at 10:27=E2=80=AFAM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@s=
mile.fr">yoann.congal@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">On Fri Feb 20, 2026 at 10:10 AM CET, Navin R =
wrote:<br>
&gt; Thank you for the response!<br>
&gt; Could you please provide some tips or pointers on how to go about it? =
I am<br>
&gt; very new to Yocto and open source.<br>
&gt;<br>
&gt; =E2=9D=AF find . -name &quot;*create_go*&quot;<br>
&gt; ./openembedded-core/scripts/lib/recipetool/__pycache__/create_go.cpyth=
on-312.pyc<br>
&gt; ./openembedded-core/scripts/lib/recipetool/create_go.py<br>
&gt;<br>
&gt; I believe that this file also needs to be updated to work with<br>
&gt; go-mod-update-modules. Not sure if that is going to be then part of<br=
>
&gt; meta-lts-mixins.<br>
<br>
For this I have no idea but a general hunch.<br>
<br>
You should really try to send this to the list (target the &quot;group&quot=
; if<br>
you use the website) instead of just me : I&#39;m not the maintainer of the=
<br>
mixin layers (not even a user).<br>
<br>
&gt;<br>
&gt; Best regards,<br>
&gt; Navin Reddy<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Fri, Feb 20, 2026 at 10:00=E2=80=AFAM Yoann Congal &lt;<a href=3D"m=
ailto:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt=
; wrote:<br>
&gt;<br>
&gt;&gt; (Re-adding the list in CC)<br>
&gt;&gt;<br>
&gt;&gt; On Fri Feb 20, 2026 at 9:43 AM CET, navinreddy23 via<br>
&gt;&gt; <a href=3D"http://Lists.Openembedded.Org" rel=3D"noreferrer" targe=
t=3D"_blank">Lists.Openembedded.Org</a> wrote:<br>
&gt;&gt; &gt; Hello Yoann,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Perfect, it works well!<br>
&gt;&gt; &gt; I have added it as a new layer, checked out the branch you sp=
ecified and<br>
&gt;&gt; changed the preferred version to 1.25.7.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Thank you.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Another issue I had with Scarhtgap recipetool is that the gen=
erated<br>
&gt;&gt; recipes do not work right away.<br>
&gt;&gt; &gt; While that was not true for Whinlatter poky build (with bitba=
ke steup).<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I see that go-mod-update-modules (<br>
&gt;&gt; <a href=3D"https://git.openembedded.org/openembedded-core/tree/met=
a/classes-recipe/go-mod-update-modules.bbclass?h=3Dwhinlatter" rel=3D"noref=
errer" target=3D"_blank">https://git.openembedded.org/openembedded-core/tre=
e/meta/classes-recipe/go-mod-update-modules.bbclass?h=3Dwhinlatter</a><br>
&gt;&gt; ) is missing from the recipes. What is the best way to have these =
features<br>
&gt;&gt; in scarthgap branch?<br>
&gt;&gt;<br>
&gt;&gt; Since backporting this class to scarthgap is not permitted (as it =
is a new<br>
&gt;&gt; feature). Maybe your best guess is to get it merged in the mixin l=
ayer?<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Yoann Congal<br>
&gt;&gt; Smile ECS<br>
&gt;&gt;<br>
&gt;&gt;<br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div>

--000000000000a5659c064b4210d5--

