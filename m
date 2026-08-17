Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 149FBC5B572
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 11:07:05 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27699.1786964821635434127
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 04:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R1OQpNIb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so26282505e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 04:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786964820; x=1787569620; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NuGVhboVsEU2B4P05No2MkC8uzkkYmSLOD7c4uy/6Mk=;
        b=R1OQpNIbruB+ORs4Mh8OuXLY6Tbgj+nH9SN680yyaIC4c5lCUoRmSUu4a8X4ukQrTc
         T9zvWTLeeXRVPOJzQZBR77N7SLuXOH+1ze878WSdEJb6CvfLOa02esJfJ6+I0II/iu2d
         ZouD6MYtkWEx1B84ietM4MKovxIjVhMWkHiC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786964820; x=1787569620;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NuGVhboVsEU2B4P05No2MkC8uzkkYmSLOD7c4uy/6Mk=;
        b=IVfgPLRQndQWsgxtdQuUTA7I4VBmC4bUdT3XsWHVaDB6ovgyhrphdVAvUxEnJeBrO3
         H8voxHLhoQHPrv/JVQBr/AfsvntCntzgSJXgv9t/3BEUAxLWymvDdzcHxtWy9za+YZGH
         nGCpJGZKHOrDfU9VLpyrY94C1PZ7cutOM2JMO8ZBID54aqyBZJZnkmc9NbK+vKp8XT1u
         kDmFD9WNbHnUoKfzBrE5HsnCi0JXN67LUMOJc6EtjPl76DFGc73GroyxqAIjpGINojus
         f2ke/bzVR+HROCuLl6jgZLMFTT+2ztoQaIfr8codcZ+rgzWI8huO5yJYGt1myMJb33OO
         InoQ==
X-Gm-Message-State: AOJu0Yx2NUZYob3tN44AaClOrIbTfSAXPgl7MOPkQ+7gxftgmKeruLVS
	XAfdp+Kr6mibpTGxJmwrPJ5CVXOEdzMD5UHF7ZwPJ80FfpSMSZnNjLXC8R+dK0E24tw=
X-Gm-Gg: AR+sD13vidhwaWTLGH0g7wCD1OODXu9YQxzmiVCVXg6xZSrBJ1Yhi8mliOn5h53Y3xg
	UeQ91N/NYbsxPsT3i7e3/dmeY9+pC2xN3cW43MVq8GyUuxLsqP6LtgIaAy0zBwSvhxb4VpnPHgQ
	ZMJ6NssvSR+5R9d3TxtbpjQYv3GmDdFOVeFgW2HgB7MKYGqP4pgUaK6mU+UUIyAEa565n6i7JlT
	bLx35DdF1kRwL/PCVY6PWnq1nUk6nYvkpHxHKR7TFkD4e0nMXjB2jGQxURwl/Lsq1JbOThc72zl
	PILQwaEpvuRJTJvjbI5FrtOBokuge/sP9fhhucIGp6DHisFfLP4QFWRmR3vlI9+JN1QdpBBTrLi
	Z+kRuA5oY2RIPEof9KwAJpnRpQeSyFRXJvd4dHZ5IclYwwmCR4uwUz6IQieZHbmOqDxLUyIrgW+
	OEvu+vafD1lhR5aWUTLZZ4Biwj5XC0n1t3reK7Kq6fnyxem1MdtezmZnlqScqBBFWd7dOdDn2uZ
	854vqD/44DPy+rlhZ3biQeuDvodrOZub/nhK+zemEuo4mpRrbYjFw==
X-Received: by 2002:a05:600c:468e:b0:495:6a50:3fb8 with SMTP id 5b1f17b1804b1-49987944202mr339716385e9.1.1786964819629;
        Mon, 17 Aug 2026 04:06:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4d4c:ee18:5ecd:c132? ([2001:8b0:aba:5f3c:4d4c:ee18:5ecd:c132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981e54b31sm162327105e9.4.2026.08.17.04.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:06:56 -0700 (PDT)
Message-ID: <65e07c6da0b0bcc19780a4a72c82c017a49082cc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/4] lttng-modules: update from 2.15.2 to
 2.16.0-rc2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 17 Aug 2026 12:06:56 +0100
In-Reply-To: <aoLq3Tmi75dFRKCs@nuoska>
References: <20260814064812.1071873-1-mikko.rapeli@linaro.org>
	 <20260814064812.1071873-2-mikko.rapeli@linaro.org>
	 <2b6fbd07547d07ddb00539fc0bf7b8434633f26e.camel@linuxfoundation.org>
	 <an77qXLFBuw245kW@nuoska>
	 <CADkTA4PdqyL4GjRAE+ob4vYMxVuKdQZ22Yc+3kTE-O1NMrji2Q@mail.gmail.com>
	 <aoLq3Tmi75dFRKCs@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 11:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243611

On Mon, 2026-08-17 at 14:05 +0300, Mikko Rapeli wrote:
> Hi,
>=20
> On Fri, Aug 14, 2026 at 08:50:20AM -0400, Bruce Ashfield wrote:
> > On Fri, Aug 14, 2026 at 7:27=E2=80=AFAM Mikko Rapeli <mikko.rapeli@lina=
ro.org> wrote:
> > > On Fri, Aug 14, 2026 at 11:48:32AM +0100, Richard Purdie wrote:
> > > > On Fri, 2026-08-14 at 09:48 +0300, Mikko Rapeli via lists.openembed=
ded.org wrote:
> > > > > To support kernel version 7.2. Fixes build error:
> > > > >=20
> > > > > > lttng-syscalls.c: In function 'lttng_syscall_event_enabler_crea=
te_event':
> > > > > > lttng-syscalls.c:612:17: error: implicit declaration of functio=
n 'strncpy' [-Wimplicit-function-declaration]
> > > > > > =C2=A0 612 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 strncpy(ev.name, desc->event_=
name, LTTNG_KERNEL_ABI_SYM_NAME_LEN - 1);
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~
> > > > > > lttng-syscalls.c:101:1: note: include '<string.h>' or provide a=
 declaration of 'strncpy'
> > > > > > =C2=A0 100 | #include <instrumentation/syscalls/syscalls_unknow=
n.h>
> > > > > > =C2=A0 +++ |+#include <string.h>
> > > > > > =C2=A0 101 | #undef TRACE_SYSTEM
> > > > > > lttng-syscalls.c:612:17: warning: incompatible implicit declara=
tion of built-in function 'strncpy' [-Wbuiltin-declaration-mismatch]
> > > > > > =C2=A0 612 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 strncpy(ev.name, desc->event_=
name, LTTNG_KERNEL_ABI_SYM_NAME_LEN - 1);
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~
> > > > > > lttng-syscalls.c:612:17: note: include '<string.h>' or provide =
a declaration of 'strncpy'
> > > > > > lttng-syscalls.c:704:17: warning: incompatible implicit declara=
tion of built-in function 'strncpy' [-Wbuiltin-declaration-mismatch]
> > > > > > =C2=A0 704 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 strncpy(ev.name, desc->event_=
name, LTTNG_KERNEL_ABI_SYM_NAME_LEN - 1);
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~
> > > > > > lttng-syscalls.c:704:17: note: include '<string.h>' or provide =
a declaration of 'strncpy'
> > > > >=20
> > > > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > > ---
> > > > > =C2=A0.../{lttng-modules_2.15.2.bb =3D> lttng-modules_2.16.0-rc2.=
bb} | 5 +++--
> > > > > =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
> > > > > =C2=A0rename meta/recipes-kernel/lttng/{lttng-modules_2.15.2.bb =
=3D> lttng-modules_2.16.0-rc2.bb} (94%)
> > > >=20
> > > > This probably needs to have a PV of 2.16.0~rc2 else the version sor=
ting
> > > > when we upgrade to the release won't work...
> > >=20
> > > Then the version is different compared to upstream tags. For CVEs I c=
an set
> > > CVE_VERSION.
> > >=20
> > > > Do we know how far off the final release is?
> > >=20
> > > Honestly I don't know. Past releases seem to have around six weeks be=
tween
> > > last release candidate and actual release. v2.16.0-rc1 was tagged 7 w=
eeks ago,
> > > v2.16.0-rc2 just two weeks ago so feels like it is quite close now.
> >=20
> > That's why I've always avoided the lttng-modules -rc releases and have =
opted
> > to just cherry-pick the patches supporting the newer kernels when I go =
through
> > an uprev cycle.
> >=20
> > That being said, the -rc isn't any riskier than that approach, I just d=
on't like
> > timing their release.
>=20
> Digging a bit more into this I found that the needed patches are also in =
upstream 2.15 stable
> branch pending release. I will pick those separately to current 2.15 reci=
pe and they can be
> dropped when new point release update is done.

Ok, that sounds better than the versioning pain with the rc2.

I did check with Mathieu and it looks like the next 2.15 stable and the
2.16 releases will be in 1-2 weeks FWIW.

Cheers,

Richard

