Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04AE4C53200
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 14:18:46 +0000 (UTC)
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20243.1784902722076148645
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 07:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=XurMcAdr;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=ii843FZO;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 32B7E7A012A;
	Fri, 24 Jul 2026 10:18:41 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 24 Jul 2026 10:18:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1784902721; x=1784989121; bh=HziY5uOPBk
	ANfyNltqnTN/RN8Z7Aol2QI2JTVxetw58=; b=XurMcAdrjbWt9pY3uP8btx/5kN
	AHPXwef10S2MfW3Uj2H5cQRDijb+Qx0oOOt0RUh8Ftz6ke0FPu7mGI/sUbHqgGNs
	5zizyDeggykav1mw+Vyw5e2tWIqPy6HW5aa1nqz1SOnTFPw+UHJMwNKYi+6Z9LqW
	RYt8x1+BQKWlfMZ7Vb+pGtkbM1N19HqSbp+lcHygehtlN0ScvgYkHYXCkZthK0vp
	gN+3XPSP1jBjLNcEABmya7MK7J+XP2s/aEJIi9r+8czL94JkG0mVPy0/YCX1HAKY
	+WysBWm1h66siCEiQJbVeG9XzVQ+hmhcjOgEBvXgV6B6Ydus1U37g2/D412Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784902721; x=1784989121; bh=HziY5uOPBkANfyNltqnTN/RN8Z7Aol2QI2J
	TVxetw58=; b=ii843FZO4vrNz1kZDWoswis3qhXfrYxY6g2Exav1WnHKvYFhREp
	McWBrW0VU0BWqy+CleIOG/QccbtBXIW1H4fC8te9b9SIQDdZBNDR9hFAfWyPQpgx
	tugQxUTXFkCbo1XdSSFo+ECeBzuIFRi+gxHkfLBQGdOhC4D4wdMmXuMIOTOP/xAG
	y+moFXJYZ+FyMZ/bqGclKfr4eAai/75DtGn74JCuNE4AkN33brBWt3Unu/kr8ePw
	4+GR3q1AjBU2nDcnLoLFPXWp+CkijY3OQEQoiSqqYCpMK20/226As/Fl4flcu2dL
	9gBcoifmyC4siNOq9qTJ0oIcbYa8XmX0KQg==
X-ME-Sender: <xms:QHRjatdYzhzn8I9jZMP6BqpmhVf7LU5J4VPHyjRYvm2VhiHDWgY3Uw>
    <xme:QHRjamIcEY8SgFL3Df3uyNlyDExNMM5OB5l0URg9xrKhakqDRzzSrd3WQgG9pdLNy
    sh9FOda484dVMcMOtayQhVs38qV-OeTMkkT-3mFw30Wa7LgtbSxzfs>
X-ME-Received: <xmr:QHRjaliYKX4O9yRsw7HDV0Q1ythHK6s3zBDj4KXRCAxLrK2g0PqIuQ0mw5C8ARvpAXMjgmUfk3ZYGJjZgBdi-0NF0YYOGUxSnTg4rn7DrBlQ>
X-ME-Proxy-Cause: dmFkZTE4Y8KK7RL4jbyytPyiSsq5OWkjJ7i0CGy3+j1OWasbi16NTX4MuZjeZGiM09tZc6
    FR+E6FvRXDNUg3TpryZcz/R5hH6KormPlqC8R9jlVndfRltbSa+1hiIjv01AEaMUlggsg9
    j0CI9CCULczAUmBr+HQGbqDXG9jgk0Qn10PpS5GJpTnMkCRFFI+o74d89G33YjSbjRWjmu
    kMNDFU2lgQvZFOCrtZUhR2ED+GzFT7M14DaD4uqAIXhFEEBRGH/+vK+7nyyptYfmXoMzjs
    VgfUN52+JMYXxM+v5hXVhpn06DO8pK3QoBmYrx76gKcgrHoB2SksGC+/7tRKo8IMRj6Ci0
    5cQ/0s0DmLYDf6wgC0D3j3tfCM9RB4fB7vin2PrNuRQL7PcPwVKeRhQhWaQSj3FR19/OoR
    BAut5jtj+PiqYJ/YlW1xSFcIxduV/VMuqR13bbd4MXgPQwTXaUQ4+3G4eIsX7xbgqCnmII
    DRbrqKn9dPBt8LFfPIZJkvR0RTSWAIiWna2QcLY27Epnu2pCXdsSMH3ZSWlANolIF10IqI
    UZA3E1KVYPUk1Bw+Xl4NUAafr2/zDQjEV38DFdMgdVYK7OyxAwHzIVV3wFKo7PuPDxTeQe
    Ik+A5qYGE+YTmMgOqrgBkoAviNbuYQsFegKeRkI8a187e1/U7w98D7o+UAag
X-ME-Proxy: <xmx:QHRjasTxgtZois-0gpO7HkdLo8anOMslyRibtcBcAKSu1Ly5kbinRg>
    <xmx:QHRjanXk6r5oP533lsRSZaYrOIZkcWffN0Se0aBGNG-0BTwd7f1P2w>
    <xmx:QHRjagTSz_NVwZs_C0QowusHiIKD20c-w3We29rHyHcx_ymDWBRgOw>
    <xmx:QHRjahnYkOEX4R3kZ3yZH7ZeM-OHt7n08EGAuWQs0isHFOZI7q7Mqw>
    <xmx:QXRjanrpXypjZTN-3zgsMFWE1tKYgxKAMjtfwa4cLxpWgTbvj9z2gTh4>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Jul 2026 10:18:39 -0400 (EDT)
Message-ID: <8caf4e5c11f6df7fcc9d52b69f9edbac8f0373cf.camel@pbarker.dev>
Subject: Re: [OE-core] [yocto] linux-yocto CVEs in need of triage
From: Paul Barker <paul@pbarker.dev>
To: Venkata.Navuduri@windriver.com, "MacLeod, Randy"
	 <Randy.MacLeod@windriver.com>, "yocto@lists.yoctoproject.org"
	 <yocto@lists.yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, 
 "linux-yocto@lists.yoctoproject.org"
	 <linux-yocto@lists.yoctoproject.org>
Cc: "Korovkin, Dmitriy" <Dmitriy.Korovkin@windriver.com>
Date: Fri, 24 Jul 2026 15:18:37 +0100
In-Reply-To: <1ab8694b-1f76-4059-b0ce-6604bbef3d2f@windriver.com>
References: <4ac849a706feb16688020d5bcc3e74aececd63cf.camel@pbarker.dev>
	 <2c3d1180-5390-4a4a-af2b-39f1bc78c385@windriver.com>
	 <1ab8694b-1f76-4059-b0ce-6604bbef3d2f@windriver.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-FXjoV3aPt1CGHMOhc3d9"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 14:18:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241937


--=-FXjoV3aPt1CGHMOhc3d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-07-23 at 12:15 +0000, Navuduri, Venkata Adhitya via
lists.openembedded.org wrote:
> Hello,
>=20
> Regarding CVE-2023-3640 (x86 cpu_entry_area KASLR bypass, CVSS 7.8):
> The mainline fix is commit 97e3d26b5e5f ("x86/mm: Randomize per-cpu entry=
 area") by Peter Zijlstra, merged in v6.2-rc1 https://git.kernel.org/pub/sc=
m/linux/kernel/git/torvalds/linux.git/commit/?id=3D97e3d26b5e5f
>=20
>=20
> So, for Yocto releases shipping kernel >=3D6.2 version this fix is alread=
y present. This fix needs back porting to kernel <6.2
>=20
> For now, I can prepare a patch to add this CVE in the cve-exclusion.inc t=
o stop the CVE tool from reporting on this.
>=20

Hi Adhitya,

Please send a patch to update cve-exclusion.inc, in the commit message
please include any information or references you have to to identify
commit 97e3d26b5e5f as the fix.

Best regards,

--=20
Paul Barker


--=-FXjoV3aPt1CGHMOhc3d9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCamN0PREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0boK8AQCjGMUGE0trQbRtkzhSEs8/8s4/lKI5vroO
yX+yMw63wQEAk1PrI0oL3+e7WeA6cHl4E8zfYXiefHTMw/Efab3wiQs=
=vRQ4
-----END PGP SIGNATURE-----

--=-FXjoV3aPt1CGHMOhc3d9--

