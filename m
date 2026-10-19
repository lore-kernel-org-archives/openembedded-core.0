Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9490CCF2E6
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 15:00:32 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36943.1792422023701380884
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 08:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KowUFSUz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1e34ecb02so9705515e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 08:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792422022; x=1793026822; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=edTbAM9U/7G8XCnp6ngUXyPoglo+XwDjIezaPHqHhwc=;
        b=KowUFSUziWqriS6QkCDT6XgiJxwlkP7LUCrVcMYDovGPo5WDjMg3W9oSMY4D7T9xhH
         BRYwZpuZnlVzLYhSe9zUZCpddJwQaRISQ4cWoe7IQRQvPGbbEEP2Y+Sajym2+LT4ajZZ
         tClWj+HGgJtKLvPZD9kB9YZI7sDc8Zdm+yYss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792422022; x=1793026822;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=edTbAM9U/7G8XCnp6ngUXyPoglo+XwDjIezaPHqHhwc=;
        b=OKm3tnw1uNAdKQPMVOXXJkYUmQwOgmwhPLIocpE0kkCEoC5vGYktRyOMEt9glh0zd2
         kfnOe+xUsQ2UEHlYwYOblola7HlcI2ngbIjTeYKx4and/KUrN76gc40eZ9ospNzqNT6A
         VisUM/OQaMvbf9WlMzjiCaEDQu12JF7tlri1EajN4PpjIQl9A7F8KYg+HZVBbPMLen4P
         IYXfjnsFZqXfvRpioCUXlSyHWNosoc71RXrabOcNowPbx0IjvWRN8UmaOaqUeqn7cPRl
         Y+RIf4kisuAyZpblfzj89f+ggTNgQ6fLZ/BlCNCmLwy6PGlwh+hq225Lt/36g9YU87II
         UvGg==
X-Forwarded-Encrypted: i=1; AKwUvByxuYGWky51IU2rGRZ/LXCQWAu9k/isKAFOOMnmqI/59WU53GCRFy60dEqiQ3OpzBSBT/G/gR6IMS6axYxZ4+3sgA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYL1cy0o7OsmNbROYd5gdwslFCo96lcoqlf87HUM6OYl/BmZC1WW
	YxFb+fZt6PYU2Aov4YXm1nx4Gjreg5TdHfMM3Pf7AXS0k9reObVXcr6PP7jg4fmDHr0/VPXdTGd
	qj6EdIQM=
X-Gm-Gg: AYBFou1/OkTCGMZZJCvHORViHoH7q2mXJDFzOOm4gMxUJuKPSI19TYoqRk85cgWjWEl
	mqYhYOHZ0q/V9D4p4SSjoclM7owunEgwmeVXolFsFGSksDcb1Opat8YbTq4c7ezVioqsO3o4gHp
	YsouQcX6jUgHhttWghbShL0jASilAfA1iK5KwPdg0zqZ5sWwfw6Wa+r32vtixmBo5Pt3lq70zI0
	OjEPdrnNw9yMEfPi2HDyPeqGgQ6wYVZC3GRf8Jl5TEIo5Zw1bn5e7XkyY6b+BzRn2Spc1wFod+5
	5drHquWx87C49LRpDVFIV94kI1tG2xrlGguCE3pNI34xcVP43OfcjdnyvIvGCtLmToIbmmIoy4Y
	Tk60k7cpsLp/h+aqNabJiGZ7nkYa8w39nl6oGTrckRcL0yRGPh9ReXtsODds/zIZu9dcCqMJZfI
	jud5GamjfDnb/ff0b/bpareJ7sh8jJjXwlkA1UPqJNX+mtGMGAlsRPte3yvABNTarVHm/wbJ8mL
	+IaG6VpbbrP2xSFUgdBN9dScTbt9SY9KzhIJ4ILu5e9uMjfC75FTEm/wg==
X-Received: by 2002:a05:600c:3513:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4a1d760e58fmr170365255e9.27.1792422021460;
        Mon, 19 Oct 2026 08:00:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2c01:6d06:43:9326? ([2001:8b0:aba:5f3c:2c01:6d06:43:9326])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca585f6sm147662465e9.4.2026.10.19.08.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 08:00:20 -0700 (PDT)
Message-ID: <b9729972d5637869372b96d3ac94989f80a4230b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] pseudo: Pull in various fixes and logging
 improvements
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ryan Eatmon <reatmon@ti.com>, openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2026 16:00:19 +0100
In-Reply-To: <750ba0a1-c139-4cb5-8d5a-49d7b68efdc8@ti.com>
References: <20261016112606.1072360-1-richard.purdie@linuxfoundation.org>
	 <750ba0a1-c139-4cb5-8d5a-49d7b68efdc8@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10build1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 15:00:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248189

On Mon, 2026-10-19 at 09:54 -0500, Ryan Eatmon wrote:
>=20
> I'm getting build errors with this:
>=20
> pseudo_wrapfuncs.c:12012:14: error: conflicting types for=20
> =E2=80=98real_open_tree_attr=E2=80=99; have =E2=80=98int (*)(int,=C2=A0 c=
onst char *, unsigned int,=20
> struct mount_attr *, size_t)=E2=80=99 {aka =E2=80=98int (*)(int,=C2=A0 co=
nst char *, unsigned=20
> int,=C2=A0 struct mount_attr *, long unsigned int)=E2=80=99}
> 12012 | static int (*real_open_tree_attr)(int dirfd, const char *path,=
=20
> unsigned int flags, struct mount_attr *attr, size_t size) =3D NULL;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~
> In file included from pseudo_wrappers.c:45:
> pseudo_wrapfuncs.h:535:14: note: previous declaration of=20
> =E2=80=98real_open_tree_attr=E2=80=99 with type =E2=80=98int (*)(int,=C2=
=A0 const char *, unsigned
> int,=C2=A0 struct mount_attr *, size_t)=E2=80=99 {aka =E2=80=98int (*)(in=
t,=C2=A0 const char *,
> unsigned int,=C2=A0 struct mount_attr *, long unsigned int)=E2=80=99}
> 535 | static int (*real_open_tree_attr)(int dirfd, const char *path,=20
> unsigned int flags, struct mount_attr *attr, size_t size);
> =C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~
>=20
>=20
> pseudo_wrapfuncs.c:12012:14: error: conflicting types for=20
> =E2=80=98real_open_tree_attr=E2=80=99; have =E2=80=98int (*)(int,=C2=A0 c=
onst char *, unsigned int,=20
> struct mount_attr *, size_t)=E2=80=99 {aka =E2=80=98int (*)(int,=C2=A0 co=
nst char *, unsigned=20
> int,=C2=A0 struct mount_attr *, long unsigned int)=E2=80=99}
> 12012 | static int (*real_open_tree_attr)(int dirfd, const char *path,=
=20
> unsigned int flags, struct mount_attr *attr, size_t size) =3D NULL;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~
> In file included from pseudo_wrappers.c:45:
> pseudo_wrapfuncs.h:535:14: note: previous declaration of=20
> =E2=80=98real_open_tree_attr=E2=80=99 with type =E2=80=98int (*)(int,=C2=
=A0 const char *, unsigned
> int,=C2=A0 struct mount_attr *, size_t)=E2=80=99 {aka =E2=80=98int (*)(in=
t,=C2=A0 const char *,
> unsigned int,=C2=A0 struct mount_attr *, long unsigned int)=E2=80=99}
> =C2=A0=C2=A0=C2=A0 535 | static int (*real_open_tree_attr)(int dirfd, con=
st char *path,=20
> unsigned int flags, struct mount_attr *attr, size_t size);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~
> In file included from pseudo_wrappers.c:295:
> pseudo_wrapfuncs.c:12017:72: warning: =E2=80=98struct mount_attr=E2=80=99=
 declared=20
> inside parameter list will not be visible outside of this definition or=
=20
> declaration
> 12017 | open_tree_attr(int dirfd, const char *path, unsigned int flags,=
=20
> struct mount_attr *attr, size_t size) {
> 2026-10-17 13:57:58 - INFO=C2=A0=C2=A0=C2=A0=C2=A0 - |=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
>=20
>=20
>=20
> Anyone else seeing this?

Which host distro is that with? It will be something to do with the
system headers not having the declaration we need...

Not sure why we didn't see it in testing...

Cheers,

Richard

