Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE689C55167
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 23:02:35 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1650.1785452551350351742
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 16:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=p5G3oBC/;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so1198125e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 16:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785452550; x=1786057350; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m4fcJgSG8qPMb7/OZqNf/676+rN2ao4JUeOnnX+ckHg=;
        b=p5G3oBC/JckOZDSRSJvboFOQ7Q81sPef/T41MdTyuoB6DuhTVW1kOu60eefmVMFBa+
         BBdM8loOhqXyqmcsEp5mDNlVRf8BepuIV5slWgwlw7yrqoy6rTVeDgGEHulXHYE+5QkJ
         W2hgYoOwQ8WaNFaErbRGUWjYqp4AMd7CATxg2KYXtS/AW4sVyr9//wDezMsvAa+A6hIF
         jX3YmVb7EuQMKIOaKCXmkwbDAVsJ5/6wupP62GKgbi00xUX1d1NFxNQk7P6p2Pvglt3D
         OMwV3yr7a4531HiJ+AIdHecGCZqTVeqVuSbqvuRj9WjbIz4pXesJf1cctWLPrL+b5tBm
         wxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785452550; x=1786057350;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m4fcJgSG8qPMb7/OZqNf/676+rN2ao4JUeOnnX+ckHg=;
        b=J7ka9HgF3B1ZDHryA7GsxR0YfeMFC9V38oEFwKQFhRuB3P1WkUuVLQRt9sGiexG6jm
         Wqv0VJy535k+XMwZKJRu0RPnN2eSjc0vw6RVYJOcOM9jmchHRYCW5CY+1lEX18FkmjUV
         jqoYyj/dBVAHHlYDOP7eeS39EcbizBVuHAyJ68xbgOmsn+WErFSP9xx6YMiyiNYq0IFt
         9zM/woaHEX/IuzWXCl43KfP9quoV6FrLAgapAZ6bcZyCbz6XPZVU6U5aRht16s8Pwuii
         VeRU1b795/twm3SSDuegWbPQ1FAhlb7lzr1Up/OZJ1zfo1tqoZRauKwOXirGGXijtlX0
         fN2g==
X-Forwarded-Encrypted: i=1; AHgh+RqNmngu5R0MLS7MQtNyAgrPKxD0+qBW5e7tABI6yZxfwsTq4PqCbas3oTgP79Uy6ERkbcJ8CwG7JK38aWfGQIaaKQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yykv6k4fW/8SI1Y9e3qoR4N7oeTGh2xcDGRrzlE6H4O3sTd9kTz
	ObOoRNmlVJWzcjtfv/ONeIboyA+lPy5pBSPMh5E0oaUeYyJYkxOmz8pG
X-Gm-Gg: AR+sD11yk6SAoVrgfQFMecyTGsKS3e3QXwcByt3Ldnn3zhBAjtAB+K9RXYRD54tROjg
	NC1ebYimH5fQGg5p+6ClLX/qzrXdUiYsbDJxG6TgOTuZ2TnnjuAdBcBYL01lP+LLRrj4VK0x3RA
	KqxRQmlq0VcO9+tHUnwBYfTD+/ClN2BerXT5f5GUgLj4UqdDX+alo/dYJ2ajNBWIYEZbI7f1t5+
	SZyTUCern93duqqC7AN6lwIKp16fOAhCsAhxnvPXVE2WVG7N0n9DLsp8lxIVpz5G0REklNA/KAT
	hpQHAerB1MFFKzSh109zEYiYgeuRXvsMcOlrYz5YeGpnuGlv5CXLbatjS3qdQRNU3kmWnkwlPo/
	rEQI5kX5gCqNPQVtCoG4Qc+d5a0y/nON8619BgDigoaeI8z46qfmj02yogpYYSUag891st2XgJf
	PwL2zn0odcW+bTNn+vmE2uJwm1IWb1RxbmKE8hAp0k2AHEt8zIW1AaE/DGuGMOsqT1fARBzc1PN
	RP0qth/0VWDyKGRt0o0ZLW9d4PHWjoSjs41UPzOze1g6uG5
X-Received: by 2002:a05:600c:358e:b0:495:3fe1:4ce4 with SMTP id 5b1f17b1804b1-49800eaa1fdmr66464715e9.26.1785452549332;
        Thu, 30 Jul 2026 16:02:29 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc892cc2esm9281141f8f.19.2026.07.30.16.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:02:28 -0700 (PDT)
Message-ID: <f864f675c915f6af5e922c1be5f893301dba222a.camel@gmail.com>
Subject: Re: [OE-core][wrynose 05/17] kernel-fit-image: Add
 KERNEL_DTBVENDORED support for FIT_CONF_DEFAULT_DTB
From: adrian.freihofer@gmail.com
To: reatmon@ti.com, "Freihofer, Adrian" <adrian.freihofer@siemens.com>, 
 "yoann.congal@smile.fr"
	 <yoann.congal@smile.fr>, Paul Barker <paul@pbarker.dev>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Jul 2026 01:02:28 +0200
In-Reply-To: <201b14d0-56e6-4076-834f-b939cd64a4b7@ti.com>
References: <cover.1784364567.git.yoann.congal@smile.fr>
	 <1b6dd4f66b2f4c1a12791a1db3a53729ce043fd0.1784364567.git.yoann.congal@smile.fr>
	 <c791b1b82e236039c614ab41402844c965fdc6c5.camel@pbarker.dev>
	 <DK3HWGV0JCOP.14DJEFKWLP67L@smile.fr> <DK3I8NXUCRHK.C3U8MB8K4NZV@smile.fr>
	 <df0810bd8195bed1f754fb754f94eb64133491e6.camel@siemens.com>
	 <201b14d0-56e6-4076-834f-b939cd64a4b7@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 23:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242381

On Thu, 2026-07-30 at 09:59 -0500, Ryan Eatmon via
lists.openembedded.org wrote:
>=20
>=20
> On 7/20/2026 12:11 PM, Freihofer, Adrian wrote:
> >=20
> > Hi Yoann
> >=20
> > Just a confirmation from my side: Taking the 4 patches is the best
> > we
> > can do. Considering them as a series of bug fixes is right. Getting
> > the
> > test back-ported is of course nice to have.
> >=20
> > Regards
> > Adrian
>=20
>=20
> Backporting the test will be challenging as I built the test on top
> of=20
> the 7 patch series from you that overhauled a lot of the fitImage
> testing.
>=20
> https://lore.kernel.org/openembedded-core/20260619112046.125876-1-adrian.=
freihofer@siemens.com/
> https://lore.kernel.org/openembedded-core/20260619112046.125876-2-adrian.=
freihofer@siemens.com/
> https://lore.kernel.org/openembedded-core/20260619112046.125876-3-adrian.=
freihofer@siemens.com/
> https://lore.kernel.org/openembedded-core/20260619112046.125876-4-adrian.=
freihofer@siemens.com/
> https://lore.kernel.org/openembedded-core/20260619112046.125876-5-adrian.=
freihofer@siemens.com/
> https://lore.kernel.org/openembedded-core/20260619112046.125876-7-adrian.=
freihofer@siemens.com/
>=20
> That means that my backport would need to be making a bunch of
> changes=20
> that these patches may have done.=C2=A0 I can do that, if everyone wants
> me=20
> to.=C2=A0 I know specifically that this patch is a big one that mine is=
=20
> making use of:
>=20
> https://git.openembedded.org/openembedded-core/commit/meta/lib/oeqa/selft=
est/cases/fitimage.py?id=3D4b08cf6048b6575c39aa9b3bea282cdeae228e8a
>=20

I agree that this is not very easy. It would require a pretty wrynose
specific patch. This is also sort of developing on stable.

On the existing tests on wrynose there is coverage for
FIT_CONF_DEFAULT_DTB for DTB names without a path. Since the beaglebone
is the reference, there is only
FIT_CONF_DEFAULT_DTB =3D "am335x-bonegreen.dtb"
https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/selftest/=
cases/fitimage.py?h=3Dwrynose#n983

Adding test coverage on master is much simpler because there we can
also find a reference machine with a default DTB like "arm/foundation-
v8.dtb"
https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/selftest/=
cases/fitimage.py#n120

@Yoann: The missing detail is test coverage for default DTBs with a
directory in the name. All the rest seems to be covered by the existing
tests.

Alternative would be to go with only three patches. From a users
perspective that would mean a breaking change with FIT_CONF_DEFAULT_DTB
when updating from wrynose to a later version. With the four patches it
will be future proof from now onward.

So my opinion is: Let's go with four patches and 99% coverage for
wrynose. That's good enough.

Regards,
Adrian

> > >=20
> > >=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#242366):
> https://lists.openembedded.org/g/openembedded-core/message/242366
> Mute This Topic: https://lists.openembedded.org/mt/120329199/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

