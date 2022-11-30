Return-Path: <lukma@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B52CC4321E
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 08:28:52 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.6093.1669796923082305917
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 00:28:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=qM7YiefP;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: lukma@denx.de)
Received: from wsk (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 744DB85261;
	Wed, 30 Nov 2022 09:28:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1669796920;
	bh=BG+gjNvhaeIWcXjiOiBlKe6y3iak3/X1yGXfygiMjUE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qM7YiefPWgK8Dho+/hCO2e8AyAX+DUtsVtWnBeOrZ31j/dfs6P475VTTlI2FcTDvC
	 UFx+CMComsiC94sCnjI8up/3DMUwag9I6PJKs6/qjsKrbKwrvh6ex25dJCHp2nRze+
	 +Cs/6GqZf1qzUCZfk9Saxp0D8IeLmR4f+xOSfXQmApJghb0Bk+gn2xEOolEw7C2Ptm
	 OiXA5nXr+zsFWERqX0xy/DiRaUjyITalvxhHNhbGOreYspSx/aXE6YAuAQze3lK50q
	 CpDLTsAsxuR1Jj+LS0sAg95dEkSdlHFSih3mrh+8auBjHUX1CUuISGaxq5uFKcaquh
	 mQLrzC/6vNGkg==
Date: Wed, 30 Nov 2022 09:28:32 +0100
From: Lukasz Majewski <lukma@denx.de>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>, Yocto-mailing-list
 <yocto@lists.yoctoproject.org>, OE-core
 <openembedded-core@lists.openembedded.org>, Stephen Jolley
 <sjolley.yp.pm@gmail.com>, Richard Purdie
 <richard.purdie@linuxfoundation.org>
Subject: Re: [yocto] Y2038 proposal
Message-ID: <20221130092832.62067104@wsk>
In-Reply-To: <CANNYZj8Y37+s6Jzo1XvX0uCYNFc=NqOH8PWrFSL9_=TOS2ja7Q@mail.gmail.com>
References: <0b6801d90409$885d6860$99183920$@gmail.com>
	<CANNYZj8Y37+s6Jzo1XvX0uCYNFc=NqOH8PWrFSL9_=TOS2ja7Q@mail.gmail.com>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U+gzpj/rf=+K2NHRtJGM9mC";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 08:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173996

--Sig_/U+gzpj/rf=+K2NHRtJGM9mC
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

> On Tue, 29 Nov 2022 at 16:45, Stephen Jolley
> <sjolley.yp.pm@gmail.com> wrote:
> > We=E2=80=99d welcome a proposal/series on how to move forward with the
> > Y2038 work for 32 bit platforms. =20
>=20
> I have the following proposal:
>=20
> 1. A branch is made where:
> a. "-D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64" is enabled globally.
> b. qemu is always started with "-rtc base=3D2040-01-01", simulating
> Y2038 actually occurring.
> c. an additional runtime test verifies that both RTC clock and system
> clock report 2040.
>=20

Please find a few comments:

1. There is already provided meta-y2038 [1] to test if 32 bit systems
correctly support Y2038 problem. It uses qemu machines from OE/Yocto

2. There are ptest available [2] to validate if the Y2038 problem works
correctly.

3. Support for running ptests mentioned in point 2. is already
available in the poky repository [3].



> 2. This branch is run through a-full on the autobuilder. Any uncovered
> issues are filed as bugs.
>=20
> 3. Once *all* of the bugs are addressed, repeat point 2.
>=20
> 4. Once there are no more open bugs, 1a is merged into master.
>=20
> Any fatal flaws in the plan?
>=20
> It's not hard to see that Y2038 problem is real and serious, e.g. on
> qemux86 core-image-full-cmdline built from master:
>=20
> root@qemux86:~# ls /
> bin  boot  dev    etc  home  lib    lost+found  media  mnt    proc
> run  sbin  sys  tmp  usr    var
> root@qemux86:~# date -s "2040-01-01"
> Sun Jan  1 00:00:00 UTC 2040
> root@qemux86:~# ls /
> bin  boot  dev    etc  home  lib    lost+found  media  mnt    proc
> run  sbin  sys  tmp  usr    var
> root@qemux86:~# ls /
> -sh: ls: command not found
>=20
> On qemux86_64 the same sequence works as expected, of course.
>=20

Yes, y2038 is an important issue.

I would be more than happy if we could reuse the previous work [1].

I've used OE/Yocto to validate the code during developing support for
'-D_TIME_BITS=3D64 ' flag in glibc.

It looks like the meta-y2038 can be used out of the box (after checking
if it still works with newest poky) when added to the Yocto Project
build/test infrastructure.


> Alex

Links:

[1] - https://github.com/lmajewski/meta-y2038
[2] - https://github.com/lmajewski/meta-y2038/blob/master/README#L201
[3] -
https://git.yoctoproject.org/poky/commit/?id=3D0e0c481a25f10f8f7ff1d69bda7f=
015186da0202


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/U+gzpj/rf=+K2NHRtJGM9mC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmOHFDAACgkQAR8vZIA0
zr1VjAgAu+CjWDhj+ewHhE3G+0SdO50R6VuosTXKfo8Yp7JDz7X78/vUQgUh60Vb
/UJhOd3+hdVIndw1xWHujq+9GLLn4b9+okICZrzJLLpnhpJ0qowmlZP29xDHn1FA
FgqGLfPRbKSW/08u18wbjg5BefTzr0ubmDhDXRE6TGP+FuVs21HQZteqWEWPJwoe
61Z4ZM3lhdCWIvPwIPQ2yvhFag29iiIN7NlSRL/aeqDJ25FJP+QyUKebsmxmPouh
VAXKnrq/7TS54oyB+78Ccrxb3nJ9pJHLxiwInsVHcK3e4WKGot45usDJP6OZQQAd
fK8k42ilfvFKvUS0I61FTQQEvDIFOA==
=p88T
-----END PGP SIGNATURE-----

--Sig_/U+gzpj/rf=+K2NHRtJGM9mC--

