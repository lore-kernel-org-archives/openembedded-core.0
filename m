Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B809AC5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 12:50:36 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12172.1786711835409901467
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 05:50:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=K1ho1OB0;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66bee28e978so964187d50.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 05:50:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786711834; cv=none;
        d=google.com; s=arc-20260327;
        b=JW3VepaSnSC1JzBhnBeBfqjVguctdncwRaivhLj4jKTSnAEdFk2kNyjhclzdBEsTbY
         gXidLWCuSIsOQDegtNERYBCjg7q8Z6ClZsUHDhBv1C9lfYboWv+YPWl7J1NNXosG6qUV
         CZuSRZXSA2+zJ4ggkmKBPEXDv3BAPejGIt2+h0VEuhXLOKXDAw6P6DJ0B1b+yoeZ16v0
         Zv+xj+IocBbXl0hu3q2ffmRbmpJ1NLFRCpdKD4ir1USgXfv99kwXL4YeS8OnmZz/QDim
         +6sJjl3rb9Sw+JX7o7UPF0Wz+kgQPaPZ4iVA07N/4DpynupKVcyBWl/3+kPf/1dxIjLT
         eWJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lBfYiL5/6M57HSy2wUUlVco7DUxr1x/V7cp7AcUDWbI=;
        fh=heBv7Q8QSBlQD5pj12K48PD4D2gkoJcezBJG9xnrvFM=;
        b=KNVVycC/pmgv2SI+RcWhAuNdVA6voATabpZu5P+JDaD8dbwHKqhJFh+ABDwkqTtNkl
         2fNXDji24CE/U6NZkDP9ly26HszC5xfe08haqQzwAS9lV4S96xtPa8ZNOOJcsl+vDTiz
         Xdz5XMO1b858Qb7RcKoit7Tr+H1xRXgJrZsSVxhJm33QswTZWsrYdnlz6oeB7VFB6/gR
         w6f09E2g8KsO2zBDsHEy0byB5fgha2O1C/IsomzUxo0sUSXSlThEVY5ie8G06/GF/qab
         ma+vqKdos+KPAlxylwFR45lS1Oe+fytEfrYspGC88ZhmvJUYf35YbBwDrJpttCvTkpoj
         OawQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786711834; x=1787316634; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lBfYiL5/6M57HSy2wUUlVco7DUxr1x/V7cp7AcUDWbI=;
        b=K1ho1OB0ZN/18aqmLE81WF3FjfKYv3lVdivrrZ6GNqYAuLQRxiAlq4QV9pxakH0QYp
         Mq66hi/aUCo/Fr/mDuHhZcE4+PJmzTSZ/LK0zPuvqh7qqLViZCcT/4RKQqQza1b5vPBC
         l7/I/2QmD1qnvXVz1znoIrCugfmyp81hTZtc5CKauPdmeAseuhqJeYdiPj/d0VkUkPow
         4Cw63xDYYHiiES4ZC0RW6/OhYuOFbOKDTiKM2NQi7RkXWjeL2jtfa5sxHaSDpehOFxzH
         JcVXEUOQPEbDI2rMrpaWr/eHh/Y0FCkCT3egbOYRHF6S+dNbSPm0csJlxghNoc6aLsRk
         f6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786711834; x=1787316634;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lBfYiL5/6M57HSy2wUUlVco7DUxr1x/V7cp7AcUDWbI=;
        b=kh37+TDAatcStvwJSbm+uBh4ygoMIxedbKjt6BF28NzT/2Bf+mcypVBuIsPe00q0FN
         iEqK6Lz2PBToVPpJO0BaaGnRbI11dxPgE34Zj8W7GMlqjIkHwHAiKGeF+cwJZoFrs7xP
         kIzWxJ97pLD1S1omBWK289Hn5uxiZa9S7RbtoaDvCY6PpHNvcfR8a3FtwqYlfcRWwDTx
         6TAcxmKOuDjk2uU/ycrPf4zu6B6AccTiSxELv+rogPL4SYtQgRU5KgvbVHclVByP+lWn
         TLe0cdtkfMCAxRyhL3DZ93pjKdHt9BkmT2toJUGt05bNzfO/I9J83jVAgobbd6JCKntb
         w0/g==
X-Forwarded-Encrypted: i=1; AHgh+RoO8ZUJq5V/4hvxRkZfR9YiqfnFwDlCYoj5F/1aWF/7rpVXsykW3GvhsCMP8exIzEWfB2Il18FZa6ZCZKSzEEqAkw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzVKqjCAVq5NXXIQgtLY/YA7VVbw8M+QwkOID6zFr4x7nzBn+qW
	X2J5u/KaWKXwo2oLxrDLx3WA7iq3E3V7kQYPyMe79tcviia9QUC4vC9eDMaH2CsBUumoGsJhyN3
	hPVjEJ4+rq00BkGWqCxcqEiMMPlxS5bw=
X-Gm-Gg: AR+sD13MvmqhvJdu/YMIb3PYyDprxxGCeH8GvrZZ7bIePbvxF3QqKT/3W0Pg8La2OwS
	08NuAinjn7BUlZj3bPKFPgsOCHeaq/7o9CTSE17J7UUWNGDWfQhG8lO1hkYH3wPFqsAk1lg9dnE
	yZ2D2UCj7Kia84WtTlZXeUY8UUl9wCojmgbBOFBZYFPvMvxGegYd3spfckRlg2DbH3YysSAdGRS
	vKVjKdxslY3w+QzwfdIW1M1w4AESyCdc4u9wy7i+ZuVDRHQaebKIsfY/vZG9hkoBxUTbQY5a5Fu
	3IsnuOyVtbDnxotohYyEBsEMFtcN1F7umgOe1DEU+wEX4edl7PoILe+nazCE3yINTdYi6vLTS+f
	PuzWWpOIiBc5CskIGSwRPwudJNSRbFWxt9B1s4eDOSET4BjF1PMylSkN6fadZT7k=
X-Received: by 2002:a05:690e:1904:b0:66b:178c:936 with SMTP id
 956f58d0204a3-66c72ce70edmr2594474d50.43.1786711834267; Fri, 14 Aug 2026
 05:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260814064812.1071873-1-mikko.rapeli@linaro.org>
 <20260814064812.1071873-2-mikko.rapeli@linaro.org> <2b6fbd07547d07ddb00539fc0bf7b8434633f26e.camel@linuxfoundation.org>
 <an77qXLFBuw245kW@nuoska>
In-Reply-To: <an77qXLFBuw245kW@nuoska>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 14 Aug 2026 08:50:20 -0400
X-Gm-Features: AUfX_mwQNKZInooVSFJ_Nes347XYfeoZYpwREzDRKe5KOIiM7TL3oiK9uxDWbW8
Message-ID: <CADkTA4PdqyL4GjRAE+ob4vYMxVuKdQZ22Yc+3kTE-O1NMrji2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] lttng-modules: update from 2.15.2 to 2.16.0-rc2
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 12:50:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243450

On Fri, Aug 14, 2026 at 7:27=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.o=
rg> wrote:
>
> Hi,
>
> On Fri, Aug 14, 2026 at 11:48:32AM +0100, Richard Purdie wrote:
> > On Fri, 2026-08-14 at 09:48 +0300, Mikko Rapeli via lists.openembedded.=
org wrote:
> > > To support kernel version 7.2. Fixes build error:
> > >
> > > > lttng-syscalls.c: In function 'lttng_syscall_event_enabler_create_e=
vent':
> > > > lttng-syscalls.c:612:17: error: implicit declaration of function 's=
trncpy' [-Wimplicit-function-declaration]
> > > >   612 |                 strncpy(ev.name, desc->event_name, LTTNG_KE=
RNEL_ABI_SYM_NAME_LEN - 1);
> > > >       |                 ^~~~~~~
> > > > lttng-syscalls.c:101:1: note: include '<string.h>' or provide a dec=
laration of 'strncpy'
> > > >   100 | #include <instrumentation/syscalls/syscalls_unknown.h>
> > > >   +++ |+#include <string.h>
> > > >   101 | #undef TRACE_SYSTEM
> > > > lttng-syscalls.c:612:17: warning: incompatible implicit declaration=
 of built-in function 'strncpy' [-Wbuiltin-declaration-mismatch]
> > > >   612 |                 strncpy(ev.name, desc->event_name, LTTNG_KE=
RNEL_ABI_SYM_NAME_LEN - 1);
> > > >       |                 ^~~~~~~
> > > > lttng-syscalls.c:612:17: note: include '<string.h>' or provide a de=
claration of 'strncpy'
> > > > lttng-syscalls.c:704:17: warning: incompatible implicit declaration=
 of built-in function 'strncpy' [-Wbuiltin-declaration-mismatch]
> > > >   704 |                 strncpy(ev.name, desc->event_name, LTTNG_KE=
RNEL_ABI_SYM_NAME_LEN - 1);
> > > >       |                 ^~~~~~~
> > > > lttng-syscalls.c:704:17: note: include '<string.h>' or provide a de=
claration of 'strncpy'
> > >
> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > ---
> > >  .../{lttng-modules_2.15.2.bb =3D> lttng-modules_2.16.0-rc2.bb} | 5 +=
++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >  rename meta/recipes-kernel/lttng/{lttng-modules_2.15.2.bb =3D> lttng=
-modules_2.16.0-rc2.bb} (94%)
> >
> > This probably needs to have a PV of 2.16.0~rc2 else the version sorting
> > when we upgrade to the release won't work...
>
> Then the version is different compared to upstream tags. For CVEs I can s=
et
> CVE_VERSION.
>
> > Do we know how far off the final release is?
>
> Honestly I don't know. Past releases seem to have around six weeks betwee=
n
> last release candidate and actual release. v2.16.0-rc1 was tagged 7 weeks=
 ago,
> v2.16.0-rc2 just two weeks ago so feels like it is quite close now.

That's why I've always avoided the lttng-modules -rc releases and have opte=
d
to just cherry-pick the patches supporting the newer kernels when I go thro=
ugh
an uprev cycle.

That being said, the -rc isn't any riskier than that approach, I just don't=
 like
timing their release.

Bruce

>
> Cheers,
>
> -Mikko



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

