Return-Path: <pbarker.renesas@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2614C5478A
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 15:06:37 +0000 (UTC)
Received: from relmlie5.idc.renesas.com (relmlie5.idc.renesas.com [210.160.252.171])
 by mx.groups.io with SMTP id smtpd.web11.15133.1708527991686560286
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 07:06:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: bp.renesas.com, ip: 210.160.252.171, mailfrom: paul.barker.ct@bp.renesas.com)
X-IronPort-AV: E=Sophos;i="6.06,175,1705330800"; 
   d="asc'?scan'208";a="194765311"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 22 Feb 2024 00:06:30 +0900
Received: from [10.226.92.101] (unknown [10.226.92.101])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C783B400294B;
	Thu, 22 Feb 2024 00:06:28 +0900 (JST)
Message-ID: <95d22879-3f51-466c-a544-91db3fff6dcd@bp.renesas.com>
Date: Wed, 21 Feb 2024 15:06:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Openembedded-architecture] [RFC PATCH] Add genericarm64 MACHINE
 using upstream defconfig
Content-Language: en-GB
To: Ross Burton <ross.burton@arm.com>, poky@lists.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org,
 openembedded-architecture@lists.openembedded.org
References: <20240221105723.1501833-1-ross.burton@arm.com>
From: Paul Barker <paul.barker.ct@bp.renesas.com>
Organization: Renesas Electronics Corporation
In-Reply-To: <20240221105723.1501833-1-ross.burton@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------csoYlLXK53C5kKn8vpX7sq12"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 15:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195979

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------csoYlLXK53C5kKn8vpX7sq12
Content-Type: multipart/mixed; boundary="------------OSnyHBxn7NInbsG03EN9Am0A";
 protected-headers="v1"
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Ross Burton <ross.burton@arm.com>, poky@lists.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org,
 openembedded-architecture@lists.openembedded.org
Message-ID: <95d22879-3f51-466c-a544-91db3fff6dcd@bp.renesas.com>
Subject: Re: [Openembedded-architecture] [RFC PATCH] Add genericarm64 MACHINE
 using upstream defconfig
References: <20240221105723.1501833-1-ross.burton@arm.com>
In-Reply-To: <20240221105723.1501833-1-ross.burton@arm.com>

--------------OSnyHBxn7NInbsG03EN9Am0A
Content-Type: multipart/mixed; boundary="------------WiNo5PKznUooS1ETuenWnuCJ"

--------------WiNo5PKznUooS1ETuenWnuCJ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 21/02/2024 10:57, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
>=20
> This is a new 64-bit "generic" Arm machine, that expects the hardware t=
o
> be SystemReady IR compatible. This is slightly forward-leaning as there=
's
> not a _lot_ of SystemReady hardware in the wild, but most modern boards=

> are and the number will only grow.  Also, this is the only way to have =
a
> 'generic' machine as without standardised bootloaders and firmware it
> would be impossible.
>=20
> The base machine configuration isn't that exciting: it's a fully featur=
ed
> machine that supports most things, booting via UEFI and an initramfs.
>=20
> However, the kernel is more interesting.  This RFC uses the upstream de=
fconfig
> because unlike some other platforms, the arm64 defconfig is actively
> maintained with the goal of being a 'boots on most hardware' configurat=
ion.
> My argument is: why would we duplicate that effort?
>=20
> The "linux-yocto way" is configuration fragments and after a week of
> hair-pulling I do actually have fragments that boot on a BeaglePlay, bu=
t
> to say this was a tiresome and frustrating exercise would be understati=
ng it.
>=20
> So, a request for comments: is it acceptable to use the upstream defcon=
fig in
> a reference BSP?  Personally I'm torn: the Yocto way is fragments not m=
onolithic
> configs, but repeating the effort to fragmentise the configuration and =
then
> also have it sufficiently modular that it can be used in pieces - inste=
ad of
> just being a large file split up into smaller files - is a lot of effor=
t for
> what might end up being minimal gain.  My fear is we end up with a frag=
mented
> configuration that can't be easily modified without breaking some platf=
orms,
> and badly copies what the defconfig already does.

I am in favour of this - I think the "genericarm64" machine should use
the in-tree defconfig so that it can support the widest array of
hardware. If someone wants to trim down the kernel for a particular
platform then they should probably create a specific MACHINE anyway.

If we take the other approach of building up the kernel config from
fragments, how would we know that all SystemReady IR capable systems
will be supported? Yocto Project doesn't have the resources to test
every platform.

For the Renesas RZ SoCs I work on these days, the in-tree defconfig is
the configuration we test with the mainline kernel.

Thanks,

--=20
Paul Barker
--------------WiNo5PKznUooS1ETuenWnuCJ
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------WiNo5PKznUooS1ETuenWnuCJ--

--------------OSnyHBxn7NInbsG03EN9Am0A--

--------------csoYlLXK53C5kKn8vpX7sq12
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZdYRcwUDAAAAAAAKCRDbaV4Vf/JGvU/8
AP4sk1Z6JwTLMMafid/gTcEAZ2JeiMcrZxa2/xDe1Rlu9QD/f94Ku/ajrZkxsBATASdTHyt8Qutb
lgFlkFHXmDgz4Q0=
=g6cZ
-----END PGP SIGNATURE-----

--------------csoYlLXK53C5kKn8vpX7sq12--

