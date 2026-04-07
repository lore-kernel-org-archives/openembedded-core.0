Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A3E1FF513F
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 20:47:14 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.91650.1775594831204071376
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 13:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TomyZUbc;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-65032e9cf01so5240681d50.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 13:47:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775594830; cv=none;
        d=google.com; s=arc-20240605;
        b=lJbUKUQNaRKtQ+CrChGuL5I5rfsLfbTK4j69uYWbUIK6t515Fg+grMvJ00WEMxvV4n
         qfUcxduu/YHLAJ62nP3v4B+oesuMmrci2DTcPdDKOKjzDxwo2DZ1cUYSMQwUyq1Xt5KM
         PO6QBjwCsKMblcsM2lmMX1JNkpuTPQ7LTGhfkyJ3SYXrvUrnZOsISkLGvNE6TGSy2icx
         ehBKbFC5ysUupWbQOCuB2Fz6HxK/9qYRuQjwMfQxCK+Q19MgEYuvd41pKCmtTRCGa9x8
         BGUhMAecQWKTq9YSfmTUfInsktVfGsWT5hn4Q0HHB5P5KZkgfTD3ZA7uV3aHPNkRgrWe
         92Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=er4366Php4l1PcxR20ckgUaqT+2bZuzM9GycHw1gRCg=;
        fh=QEHLwtqS71Z2YUr9+lozElpw6h8TYix4W/jHxWTlj80=;
        b=i7++BS6cc1s3AsCYWs0CsBVTQfLdFa2QgzHrvcziI2EVKkSeK9poPnyka/yEMxOZWm
         vj90GKsV7nNBfZIUAT7Ih3FAv88Fo9NVUId93gzHFQlljEr6GkK7iODZVt7+HhkOYO8E
         U9iWdXwdZCvixzUYQRPEOl5p0WJOQ2UiVVFtfh1tpYHUq9yrw16cUyt078W9Q4iB3LYr
         W99CHa3c7kOj+/MlsJHGon1tF524aseR69wSC0895q0zT77Ca/3y1uShpy7N5nnOjsWJ
         VmbOnY5vT2kc25KMN4fRyKErjhOBWFe1gbOPiDBPJMhCzPhjX7T+GzFFNv2FkU4cUt/d
         QSsw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775594830; x=1776199630; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=er4366Php4l1PcxR20ckgUaqT+2bZuzM9GycHw1gRCg=;
        b=TomyZUbcsvd/ljBrw/2T30ChYfrxFqgt1pNgtosdD5qq09AeNqp0tQ2tc7jLl8VbIu
         bSQlQgLpb9X9dwXupUFMcW0aHncGJBFXn9OaMaz0PdLwf+5JaoVXPkpt50DKjJnO77Wm
         9eCnXyzjzd++h9ygOiRTjF2C45SNYUiCKT+vShn//dc6KqF4khrb5SEgDAXadGLHhoLh
         ekkp2RY6EW6SIqh4JqjpbW8F59hlxl8gqBN7r8dlXO9tCqk/rQK8LKsaLp1cwoVPVk+I
         mn2Mh/ucgbTSNbysXNVj6HRGJ+6fWK4nBtCYAmfsHGgrn7bbQM4Q/V4oDqpwaeldTGXy
         T2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775594830; x=1776199630;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=er4366Php4l1PcxR20ckgUaqT+2bZuzM9GycHw1gRCg=;
        b=pKCZA6rvKQN2VowSRsyjkSgJEhu0VdvvFclr5VKFL6FHmWAhadQzTGwh2mK+jdQlcP
         ardU8C2o15C+sYJooz4goTHmWFYb/poqgie1YZ586a3EX4iGD/n7eK6edSOHhUhGqPSJ
         GYa0eVG0CHTeKv6U0ddkAdtwxI3kWnnr6cuiBAwXTuJ9WklLJ821iMFAADdoJ8w5gt/B
         Qu1wZN2KlrJ2paxBbl/V/+H3epXD8liS32OljhN7QplrRXJig24i0K2EU0LuAHtmmIG4
         Uzfto4zhBwEbKi8kMi9m38oB4NuGALpGuSxNrQJIFzvUdSEP+Oc0JVa5WyP3EW3OcWbE
         Zo/Q==
X-Gm-Message-State: AOJu0YxH5RW5CKViHpUoFKOENw8gMoWtcSFopt4EbKaT2I3UjSqlMTaM
	CYhxfyTsdBxL4BtLhpBzpW1bPE0h1HS8/k1jEp2GoT1sFuYMS0WNROj9UwhJ1G9qPSjLLXpOkW9
	k5rsHDOB7o9tyJQKu7+iHIfIVsvLhDYCz/A==
X-Gm-Gg: AeBDietRwF53+TFvlG40PfB6dxaBCqQv1VERAwru0EB5No/J6tSZlm8UOfiQHs3i6MT
	71pjrvXDlsp4mauXMgM1YDgftzIASF2tRWDwrXC7ZDy47XNDeaxhDuYdxqVzZLzVV3cU0qy3cGw
	Bknjxwk5zIf7eclWe4nyU/rKBi6YozDcR/grg0xcu1JzObwJwC6V/0Rb04fvJItioc66h215Aid
	gNRRi72HZVfkEYrivDv8eUHeVC4cQvKbGewuTmEqBdSPxkol2QiFn78c/pUwNVzfdz9YP+hGbIh
	RgLO37o4MOndhXf+LrwN5Xw5DU/47zIi26Yu7PEcyvNSNKfPrwNeDGHzmX4gMVEescEv9I9Yd1g
	pnMYLEhnRzZbsmYUC+3S0oDAVqnfoATYgrIY=
X-Received: by 2002:a05:690e:4285:20b0:64e:e762:30ee with SMTP id
 956f58d0204a3-6504884f9e5mr13775744d50.49.1775594830180; Tue, 07 Apr 2026
 13:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260330132825.1784802-1-ross.burton@arm.com> <20260330132825.1784802-3-ross.burton@arm.com>
 <FDFC46B5-DAD2-4885-BA62-AAE6F2389F03@arm.com> <CAMKF1soVrVe3C7G4gzQA5-w07NA+yctDiNED_YpwPObdorYeOA@mail.gmail.com>
 <3D2C57DF-F779-4AE1-8DED-F12EBB274DC4@arm.com>
In-Reply-To: <3D2C57DF-F779-4AE1-8DED-F12EBB274DC4@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Apr 2026 13:46:58 -0700
X-Gm-Features: AQROBzCpnswkbWkohp8d7agZ8mkp6blThn-OtJsXUgwcPGY8iyku2zZLu6hy4h8
Message-ID: <CAMKF1srVAyz-yQQtPZjuYd6MEdVjiWMK4Jrbs_+xc6-i97VUCQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/4] autoconf: upgrade to 2.73
To: Ross Burton <Ross.Burton@arm.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001e3773064ee4e372"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 20:47:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234779

--0000000000001e3773064ee4e372
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2026, 12:44=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> wro=
te:

> On 1 Apr 2026, at 21:33, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > btw. This version of autotools enforces C23 standard for C code (
> -std=3Dgnu23 ), while good in general for code hygiene, it will push port=
ing
> work for these packages.
> > since it is going to break quite a few of them, I ran a build including
> meta-e and the count is 30-35
>
>
> Did you mean meta-oe?  I did a build today on the AB (
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1442)
> and it mostly build fine, a few problems due to the TMPDIR splitting thin=
g
> that you=E2=80=99ve sent a patch for.  Is the AB not building enough, or =
have you
> already fixed some of the failures?
>

Build failures are more prominent with clang as default compiler for some
common ones i have sent patches

>
> Ross

--0000000000001e3773064ee4e372
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 7, 2026, 12:44=E2=80=
=AFPM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@ar=
m.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On 1 Apr 2026, at 21:33, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt; wrote=
:<br>
&gt; <br>
&gt; btw. This version of autotools enforces C23 standard for C code ( -std=
=3Dgnu23 ), while good in general for code hygiene, it will push porting wo=
rk for these packages.<br>
&gt; since it is going to break quite a few of them, I ran a build includin=
g meta-e and the count is 30-35<br>
<br>
<br>
Did you mean meta-oe?=C2=A0 I did a build today on the AB (<a href=3D"https=
://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1442" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://autobuilder.yoctoproject.o=
rg/valkyrie/#/builders/81/builds/1442</a>) and it mostly build fine, a few =
problems due to the TMPDIR splitting thing that you=E2=80=99ve sent a patch=
 for.=C2=A0 Is the AB not building enough, or have you already fixed some o=
f the failures?<br></blockquote></div></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Build failures are more prominent with clang as default comp=
iler for some common ones i have sent patches</div><div dir=3D"auto"><div c=
lass=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>
Ross</blockquote></div></div></div>

--0000000000001e3773064ee4e372--

