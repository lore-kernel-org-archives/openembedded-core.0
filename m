Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE7FC55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 11:52:45 +0000 (UTC)
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18015.1786017157921478452
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 04:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=qYLIUjJT;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=NGYsWqS7;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 83C067A0152;
	Thu,  6 Aug 2026 07:52:36 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 06 Aug 2026 07:52:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1786017156; x=1786103556; bh=gbceSMzCBY
	3Q0f7ueCFcFsgogpssUCKGcYDJ3Ll9AB4=; b=qYLIUjJTqOf5PiCCuMgxPGtN8U
	No4CU4PpRzYVCgCtvB2DIjfz1EfopHzifXvgsIpAFD5TMCV696SBEK9eodRm7OUV
	nyRzhZADYaRHiPLjq1rhPOjpjTQBwlDD75+9qd89C6HZfbvBQwRYUwJ+x1y03uy2
	ID+dVObymv4f69tFN94J3oXTBKVQS+JfpaUK2ouwHN71n6+lHXWeerY6mx9pXBtZ
	G0AI4bmnquCNfAQrwvvaDvzr6NMUQsrQ9qLb+umgmaJSIrhcIa44flF6+f3KD/rP
	PRmwMbe23ZXWA+/maZfIzU3nyAH7ZGI8M36rD3woOpeVFDcDDPo2Fo4hM4fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1786017156; x=1786103556; bh=gbceSMzCBY3Q0f7ueCFcFsgogpssUCKGcYD
	J3Ll9AB4=; b=NGYsWqS7V3dJiHfVtELO+jmnC8DYUtjFu9fTmFCpzYokcHJpz+0
	sRQEZX7C4v1lNWza6msRZhtLRrJE4uTF7Ma4YzVqa9FksHGrbp0XcZb8pxChdR31
	ChyI9aeJMm/C7Z5ZTp3X5FzLq4Y1VP3hscj41MeKjLOjZmRrPytE9J2MCKrGv/6l
	mqck7dc8hZR7tmrNZvDJ0q26HfUpsJooJ/XCND+o5Ajez9Wh0PTbUFSz0mVY0Wmg
	7vRWmtm+znc1UdkgJvl1OITWVRvWc/xkJR+okFPPPs72QAOWjjky4rNsr+48XU/4
	CIOVwXd81/mGdhwpdslw9x56JIouu8NTKgw==
X-ME-Sender: <xms:hHV0asDSDOlAYtMPr48SoPUnoMg2s7tdljVQDRcz64YExRBXz7VXsg>
    <xme:hHV0alj8_OsK_o4PrSK9z3bQac5ynTauJtX1EAuSdEeQLI_RO5cG6VkbsflbM62Ri
    wHrTUhW1RpIb6r3KF0hDijzQNCqgC5oOq_0x-hJLdZYu_DGPwqeHvc>
X-ME-Received: <xmr:hHV0akmPeCTTUwx_fk08bSlTFkPBr3M4nJMvNy-fUG1itldtJkwfbs4rF2aIVBHSsGG6D18wgRmNI6TChrZYEDjVSaaEpuQ418coAvg>
X-ME-Proxy-Cause: dmFkZTGf0Ytbviub0C5BImn2MyV2Kxq799QlEIzv5XMz/KzF+gFxQOa0af9Bna80TtYUxZ
    1LPPx1Is4nAfzdNsvVfL2bfTZoKYZnu4X7Ei1zIuP0BaY8q+Bfc0YOc8xDelCpN0ktDs9A
    w1/rTAXfEOGTTqlwc2wkppw+YXD7rG7yF6SBi/y0nH5xN0dKYyAPvPRyuSGwYyOpj+sI4W
    gi0IgtHoLg0y7vfN4ZtiTMBXGRZYZZt1yT3sonbu9LSXuEIyd3T+Lvv2qv0O+Tiqsn1zwu
    89xzaEoYPz3kLdxP7Sn/eAeMfj+sZgC9GAEsCJbPhFWVvl790gUI/TnrD26Bqb7TmleYrs
    iIH/Sfm4xRJiRwCtXkzI+x8iaohLpkWFQT0Wz8i8raUErvqJC3Tw7LJ7RaFBurVuZE+4iW
    g+zKaFIg3FO/JTSepa8FmwR5cs77VQd2nAqySTqLakgDVdI/qN9p4RINMQe0J6TC9HSupo
    1N3gBSKKCRzimhzp9V3kv0Pd+LG+UZ5UjD8IVGQITUfiGkdVV/czy2hQ+cbMDIYFyBCMJi
    KSlGeHb7IBjcksvc1+sPPCuSecX5TZ+AuEyOvRKbIWYa3LO/PDXk/6ueYQavBiXEwtLpK2
    FdHi+/aWohof0t+VQsvn59SBOlqhY+T6cv8LHrXNEbdJJPNxp6yglh+9yLLg
X-ME-Proxy: <xmx:hHV0ahqmfBYWhp7rrbBKhK1_0odM4VyUSWULbd53_vvpAr4u39aYWg>
    <xmx:hHV0atFKh-meT-Oe482FRZAOh42dk209-hNap_aKT0xb_sgtbyE7Cw>
    <xmx:hHV0atzuFIF6E0TDZmDn9CttuuaywEn0FjzUVdN6nKE451byI0HIYQ>
    <xmx:hHV0aipvPkcXsMy9gnG-0T4JmobiXZXn71zRIlo1l3cpSga3WoC9qQ>
    <xmx:hHV0ag7bJKXvG8QKh23VJC-iy-WnbO4M9cun7n-xsaCM4z6qLQkLrk70>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Aug 2026 07:52:35 -0400 (EDT)
Message-ID: <8bf8e31c06972ab4bfed61083d8d8c57e6c48d9e.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH v2 00/10] cve-exclusion: triage ten kernel CVEs
 lacking upstream fix data
From: Paul Barker <paul@pbarker.dev>
To: Junjie Cao <junjie.cao@linux.dev>, 
	openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, Venkata.Navuduri@windriver.com
Date: Thu, 06 Aug 2026 12:52:26 +0100
In-Reply-To: <20260803084827.1348810-1-junjie.cao@linux.dev>
References: <20260803084827.1348810-1-junjie.cao@linux.dev>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-VgmOa54vp77WHEaaCY8s"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 11:52:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242935


--=-VgmOa54vp77WHEaaCY8s
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-08-03 at 01:48 -0700, Junjie Cao wrote:
> This is v2 of the triage of the CVEs from Paul Barker's "linux-yocto CVEs
> in need of triage" request [1], reworked according to his review [2]:
> one patch per CVE, primary sources cited in every commit message, and
> the three CVEs which have no upstream fix recorded as "unpatched" rather
> than left out.

Hi Junjie,

We briefly discussed this patch series on the review call today. We're
concerned about taking CVE status changes based on AI-Generated analysis
from a new contributor, when there are multiple ways to interpret the
various discussions online about these issues and it's not immediately
clear what the "right" answer is. So we need to give these patches a
thorough review. As we often point out in the weekly status emails, we
have limited bandwidth to do this sort of in-depth review, so we may not
be able to handle these patches quickly.

Some quick thoughts below:

> Summary of the ten verdicts:
>=20
>   fixed-version     CVE-2022-1247   v6.17, rose_neigh refcount conversion

rose_connect() is now gone from mainline, so we can easily say this was
fixed with the removal of net/rose. Pointing at an earlier fix requires
more detailed review.

>                     CVE-2023-4010   v6.18, imon URB resubmit loop

This sounds like we're trying to infer the reporter's intent based on
'imon' being visible in a screenshot. We shouldn't be making guesses
just because the initial report quality is poor.

>   disputed          CVE-2022-0400   never substantiated, closed by three =
vendors

This is probably right, but needs another look.

>   upstream-wontfix  CVE-2019-14899  weak host model, config-only mitigati=
on

We shouldn't use upstream-wontfix unless that is an actual upstream
opinion. Ubuntu/RedHat are not upstream for the Linux kernel.

>                     CVE-2021-3714   inherent to KSM deduplication

As above.

>                     CVE-2021-3864   two fix attempts, neither merged

As above. Was the fix actually rejected by upstream or did it just go quiet=
?

>                     CVE-2022-4543   KASLR not a boundary against local at=
tackers

Sounds like there was some discussion with the kernel security team but
probably not a clear wontfix decision.

>   unpatched         CVE-2023-3397   JFS txEnd UAF, proposed fix withdrawn

Unclear if there is still a real problem here in mainline.

>                     CVE-2023-6238   NVMe fix applied then reverted

Probably correct but not completely sure.

>                     CVE-2023-6240   RSA timing oracle, fixed only in RHEL

Also probably correct but not completely sure. The commit message has
artifacts of the LLM being confused (Marvell/s390/unrelated commit
reference), those can be dropped.

Best regards,

--=20
Paul Barker


--=-VgmOa54vp77WHEaaCY8s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCanR1ehEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bsO6AQDQYzMtRYELgmo3X/wF/iNX6mIvDy1Kzrqs
elCGM5VK1AD9GTZUG+04YUG9cST4UQydNO344Xy5NWyG57OcgceHGwg=
=0jHS
-----END PGP SIGNATURE-----

--=-VgmOa54vp77WHEaaCY8s--

