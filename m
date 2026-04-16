Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C767F8D759
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 15:27:47 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17033.1776353262809133803
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 08:27:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dkLKadCs;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38df1889fb9so88932861fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 08:27:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776353260; cv=none;
        d=google.com; s=arc-20240605;
        b=O/rxungt5nB0MdN8iKyY0vgC/WOLUt3f+hLSpOJIIr6UWe0luwnWgKd8OLhqrKb8Do
         CkBT63SArXNC6vr1GpbE1KdcCpwZFSZXfPxb9kFCFtoB0ImK0ML5tfAI28kLwxiPHqhJ
         hSa/2Rd9zvYl6GRHgJPECaB3yAtYK280tBTAUivJBZerGPeznakqFAlM8+gLvLGxp/7H
         ZltBWnmZUxZfsP8cPrEnBrLobfSOETWHZ9SaUtAqedEtD5BoE7q17TPqHpQucYbUN1o/
         U/V/aNyTXOzMKJjrx5y8XAt0VQ+AK1wCcz05OK7cusE0Y5+kPvJnYF0MYXprzvZY0mGI
         zD3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w3LXGtFdXe3bHpqMN7R7BIb8cqOxNm/sFW5YYZrf/H4=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=CwqTaUek3U9Hkh1KX3iOYa5x2FqLXf8BVfVRaVX3sez8aI+5uqJ5+AucFWcJSiV9kJ
         TxQqjz79hqxHf4zjtJx2h4IXS5rlbaj1gA7NHBf3v7W03migLYwX2rFxAa4dj5Ce5Vdp
         xnppj2uVsadxprqfxciwq/zv/4URvBfKdiYS1nwKvkluIRn1jurZyRj1iP2sqhYZUaym
         vDIeRNbucTG3pzWFQfWer1l+l/peMWBIfngjT3vw4dZZCbJDgTMKNhQ9EpN1vO8h6COt
         yq8q06wi6CGu9vHvt0FqswDE1gqJXH3lnczKbcESqPbjlPq/Rqa4dFZ3uon9x7kcU+6J
         WJrw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776353260; x=1776958060; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3LXGtFdXe3bHpqMN7R7BIb8cqOxNm/sFW5YYZrf/H4=;
        b=dkLKadCsCEWI6tQ3sMJFj6opHGO2L/QjpRH4ISEM5flaLC8fkpTgLae0tVI0TyKR0t
         tKkGx29yU9sTbmNp0VE3D3Jg7qUcuRcZdRpjgkgNvFIum4AV+YGIgMyH9idBQgA7YlyU
         SfArjwzf4F6MM2nDf9xhqe2gPH62bESRbp1ongU6mnjgDYK2eXLx0/bkgbxbWSGB79XJ
         djBWhR7KFlcKYQvAqZaZIeyTise/D+fTJqvHLd6sfG/Yg3frRSUCdL3blDHSAcQsQ89l
         BRJ5q32yJ5v16+YPyOscCDCU6Q3j3kp2k/tQP1xB0HOwlk5t8P10OkBp6jn35IBLrerm
         5DTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776353260; x=1776958060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w3LXGtFdXe3bHpqMN7R7BIb8cqOxNm/sFW5YYZrf/H4=;
        b=laO4cfnIsA35GVywZUX70GgNxvUsHV2p4WrGpx8pc/dkg2HmawEN4TOIZh4owRFHWq
         wI2Nh1HaG2i078WLpkht7Ckxi39erOm80fE70JTZ7ZbiG2M2mN5YR43dMHtd2FvKe/2X
         qmJjysU2P+XBEHF4+Zgx0wu9kEF4HAf0HYu3/Ok6oVgEOoIoLcfC1+GZx4z4Y9+Bk1x+
         HJYltNCfRxHA1wwVgQ7tzKohaqSlnes68dY/ETG56LSbfP1fkNjNIYwFRYSr2LkyD50a
         jePhJzyk/QB6KCr+VRc/s7mJuoYKxaF4ZTnOh6AidmJAkI5JVNqfRwE51dnuAWIq/1hP
         HIoQ==
X-Gm-Message-State: AOJu0YyES1Z6W0LlLIcxS8DgaOqDZA+5UWDMaJzEpq3M5F4Ijk+Vzu1Z
	7c5p+mWFTKez3G0CRsmPkbG9O0neOyprQkCYwvUf2hRkrRAQ0neoTTgAavPYGYCxgR8Tc3s527E
	tkSImQ9hqfBgboJEBYEYflqLzNEt63ps=
X-Gm-Gg: AeBDies+y2feKUzRtdHu+cy3dQN0pedetYL/lIqSbd2U3qafqyZzOjuAoGdGfPlnBlp
	53gMP+DSJ981dOpcAaRkVj8cjHhUtco7ErnanZ8TQcNdm1O4P24WeK/tRC/yhixJxtwDurlDnVk
	Ln+Og1Ol4IDJ6j5c1bdCc4Cc5kgtyucsuTgAbQ1ucG8yAPSVwxY8hehR81tNdrhnDVUs/bScKMO
	X5nheXBELHfuPMt4DAkf5LsGBFxU4u27CJWE3B51uJKRz5q73bTRL4qaDppBBvg+qcMA9U04X7Y
	0RSYSlzedf53cDoFdJVK9RSmldqe9isDkhanVhyVCyYosAWDVC+il5zbkofEHin/kAy7DhGVGMk
	2
X-Received: by 2002:a05:6512:114d:b0:5a4:1b8:1a92 with SMTP id
 2adb3069b0e04-5a401b81ac8mr5373992e87.21.1776353260094; Thu, 16 Apr 2026
 08:27:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260409152839.2894434-1-martin.jansa@gmail.com>
 <20260409152839.2894434-9-martin.jansa@gmail.com> <DHUN1SXX5RDI.1OA9PUGO3NH3H@smile.fr>
In-Reply-To: <DHUN1SXX5RDI.1OA9PUGO3NH3H@smile.fr>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 16 Apr 2026 17:27:25 +0200
X-Gm-Features: AQROBzAKuDtkVpRCB5Hqn78rOat3v3sKV8AeuQpXwjcsgajKoje-S6VxUyCuhhw
Message-ID: <CA+chaQd8uvetTzEaKtSjh4LH3go=z8KeAnCtC_JzVNBrhUZZUQ@mail.gmail.com>
Subject: Re: [OE-core] [whinlatter][PATCH 9/9] binutils: backport patch to fix
 build with glibc-2.43 on host
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235410

On Thu, Apr 16, 2026 at 4:11=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
> wrote:
>
> On Thu Apr 9, 2026 at 5:28 PM CEST, Martin Jansa via lists.openembedded.o=
rg wrote:
> > From: Martin Jansa <martin.jansa@gmail.com>
> >
> > Fixes:
> > ../../../gprofng/libcollector/linetrace.c: In function =E2=80=98__colle=
ctor_ext_line_install=E2=80=99:
> > ../../../gprofng/libcollector/linetrace.c:219:45: error: expected ident=
ifier before =E2=80=98_Generic=E2=80=99
> >   219 |   if (java_follow_env !=3D NULL && CALL_UTIL (strstr)(java_foll=
ow_env, COLLECTOR_JVMTI_OPTION))
> >       |                                             ^~~~~~
> > ../../../gprofng/libcollector/linetrace.c:219:34: note: in expansion of=
 macro =E2=80=98CALL_UTIL=E2=80=99
> >   219 |   if (java_follow_env !=3D NULL && CALL_UTIL (strstr)(java_foll=
ow_env, COLLECTOR_JVMTI_OPTION))
> >       |                                  ^~~~~~~~~
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
>
> Hello Martin,
>
> Thank you for your patches. Ultimately, I took the equivalent patch from
> Zolt=C3=A1n:
> https://lore.kernel.org/all/20260407133521.840916-1-zboszor@gmail.com/

OK, no problem, I've already checked that both do the same. I was
using mine, because I had it in the series for scarthgap already, but
they backport the same change from upstream. (It was similar with the
patch for gcc where I was using the one I've sent to master a while
ago)

Cheers,

