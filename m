Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A403CDB481
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 13:30:17 +0000 (UTC)
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7123.1782307809451529261
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 06:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=BvOMCd6k;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=eWZ0BLsA;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E4A351400107;
	Wed, 24 Jun 2026 09:30:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 24 Jun 2026 09:30:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1782307807; x=1782394207; bh=SNDKMXAExY
	IYarCCbwn17DS9us8B/dZTZBBTqAhXKhM=; b=BvOMCd6kfV0dmGILPpd9+LmJq3
	SUBS/syGcZRgP38cC+bh8Kb8Wcwci8Kg53VgRxo3UprfPkOmj/E8hZgGsFgReYKs
	MU8MM1nEA5STUi/clcxbVar82B9nQK2lDB+dJLfwglEPCec23zLoSgm2GR3UcDgy
	b398xlebvyZHK9jtf1xg1FTzsyLcEvLIGML27zqze47DXOhnzCYUCoRXD27dN48L
	2vpR4/5L4S4ow8hTZRdkL1X0oPM+lrc8qoiybRP012Ga0ddjcPyr1hxwqRvF/inF
	5VqAFUWjR9et3i4mOTg9517zjDtuON3wK43JOkx7xfPIY0OQ9/3Pe5F3+OOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1782307807; x=1782394207; bh=SNDKMXAExYIYarCCbwn17DS9us8B/dZTZBB
	TqAhXKhM=; b=eWZ0BLsAybwRAE/Aq0k3Sm+vwPikWXOoekv2IKG/3aJgHJx3/jf
	4F0UBwpsXksIpwhAp9IlabuXn8vF3bCvMFH/A9ENmPxsnstJ65Y+HFLnUX8efozV
	xvtp+doDVlg0tcNwEkzVKbAkXWpwLhBkrxzggHhPxEWjma600+I6T6yTN8xe36GD
	qASBq1pTaP/LR3K3G3ccGnQRPZdNOxjGnXJFVsi/R+VCxBE5NsO3sKpkWR8aaFRl
	kdX21I1ZHDJNy+whF1qC7zmlROsuTu7PZ31pb7V0YcqIWjFcz7JoQk61aik9nIk4
	0HS/rHWlVKa1YuSo0F0pVYTo+duTAzTpATg==
X-ME-Sender: <xms:39s7agsAWDw9P4K9jJlVmB4XaII-4vsCegsYhW3X9xmXeuLzsEWgKQ>
    <xme:39s7ak7edwfuZf8dv_9g9c0MiDWUA22oRGEVNUV3gzOjoOrvx_qKDRZPeJr47PEE7
    vcTwJ2CDmf7LdDzK02X39lpdVYU9nYIowfh9FOUDspkJCIMDrYcKQ>
X-ME-Received: <xmr:39s7apLDKajPP8MijowoA4YMjlIAfXeM2n-AyVN-lKCx1ciuQ3FJkMxu-d5_MpqhubXSZAFPvXcojzYCcdhyisrunGBNMsir5LNw8lv5odGa>
X-ME-Proxy-Cause: dmFkZTESzUKaFdY23yjo+Ko4GAAptlqn75Fs5viapeaLjzgoMu9fTeThjj4f/fq9CB3i9B
    6UHKj9VS6WTkazKX9Nv/nUvI4wYUPrFMT813J6UF8D+vl12deBrp70ZAaXzsgEG6UJ2jdT
    SaOr0u1SiMKrLvVpcWTzcdHt8ubrM9mcO/yB2YBNNklHGOtgI1WL7761eFM8R7o3Oi0k8z
    NuqV6EVd2QLqQN6Au7C+G5k9Gu8XSUfES8S10G/hS33+8kmRyfnms9AnoEacxMxnJY1pLj
    LEUR14wxUm2F910aZrB2Tf6TJPkRKKEsr6/OXqDZgKVEbyOjVpLngF76p6zNjlh9EvduNl
    wU60HH6v8/UdhpNqxPNy70gh9TTurqmCr1SKGwZyw9+LJbf8xzqNjkkaS1o+Zm62+dWNbf
    S3Qq/NJIX3pqQAWHGURS455RFPjaoBSL9DtHezAHeDt+07RDX9pr3an1uWrR5X0TjsM1Wg
    4URX+wj2A77wIncJg2qNRz5BSDIz6q9QQmFAMmAWd6a5Bfvyfb/z/BTjVgi/EYEMys+Exf
    2k3iHK5Z3ikgl/y2NjGgAzQXRe+RIF4hAb8nWxmpxMHPTIptG1b+KuSc0T0OXArd0eJkx3
    LiR8rb7oaizVM31wpCcvXZ8tYLI4x69lerm8euWVNtkE8mcaT+lbEORHbvSw
X-ME-Proxy: <xmx:39s7as703-4jFJ9a0RTOISXMvhrOkJfWCzvEdme2beG9_6a6nECBeA>
    <xmx:39s7akzLlafKVhX9TBeUxrnKOHUP680vVAvoXMaKkbatOixgrbB77g>
    <xmx:39s7aoZYD0wU9oSrW9NmM17g7cQHwj7bX1sYmMXEz_AsFptl_a6Zeg>
    <xmx:39s7auQebGnhs_dDrOCNN8hcMfYLiJe68xDFW9QrzsBgRoJgXUTpew>
    <xmx:39s7ahdukaeQloSVS1LUdKzHO895JXqRoE-xpD7Wu1j7VHbu0voUYFaq>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Jun 2026 09:30:05 -0400 (EDT)
Message-ID: <e6178006d4f0ee7415bf64289818d292fb9805b3.camel@pbarker.dev>
Subject: Re: [oe-core][master][PATCH] nptl: open threads comm with
 O_WRONLY|O_CLOEXEC
From: Paul Barker <paul@pbarker.dev>
To: git-patches@bmwtechworks.in, openembedded-core@lists.openembedded.org, 
	sana.kazi@bmwtechworks.in
Date: Wed, 24 Jun 2026 14:29:56 +0100
In-Reply-To: <20260622050921.985873-1-git-patches@bmwtechworks.in>
References: <20260622050921.985873-1-git-patches@bmwtechworks.in>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-MGOS4NjI36TDHYAFudZT"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 13:30:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239507


--=-MGOS4NjI36TDHYAFudZT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-06-22 at 10:39 +0530, Sana Kazi via lists.openembedded.org
wrote:
> From: Sana Kazi <sana.kazi@bmwtechworks.in>
>=20
> pthread_setname_np opens the thread's comm file using O_RDWR, but the
> function only ever writes to it.  This causes two distinct problems:
>=20
> 1. Missing O_CLOEXEC: the file descriptor is not marked close-on-exec,
> so it remains open across fork+exec.  A child process that audits
> its inherited file-descriptor set will encounter an unexpected /proc
> fd it did not open and may treat this as a security violation and
> abort.
> 2. Unnecessary O_RDWR: requesting read+write access when only write
> access is needed can cause open() to fail under security policies
> that permit writing to /proc/<tid>/comm but deny reading it.
>=20
> Fix both issues by replacing O_RDWR with O_WRONLY|O_CLOEXEC
> Similarly, updated pthread_getname_np to use O_CLOEXEC.
>=20
> Signed-off-by: Sana Kazi <sana.kazi@bmwtechworks.in>

Hi,

It looks like you've copied the commit message from the upstream patch.
We don't need to duplicate the information - the commit message for your
patch to OE-cre should reference the recipe that is being changed and
why this patch is needed. For example, the commit summary should look
like "glibc: ..." as you're adding a patch to the glibc recipe.

The key thing is to also explain *why* this is needed in OE-core. What
problem is solved by backporting this patch?

Please see the contribution docs [1] and previous commits for examples.

[1]: https://docs.yoctoproject.org/contributor-guide/submit-changes.html#im=
plement-and-commit-changes

The original upstream commit message should remain in the .patch file.

Thanks,

--=20
Paul Barker


--=-MGOS4NjI36TDHYAFudZT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCajvb1BEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bnzsAQDJrDwKcuv8IHR8HOL7HpVOALJ1GYSc4rTK
cgc3p95RaAEAhz+72i7mU+ZOQdrI7WnR6t6Y1fcZBIhYBG4XuJ4r5AA=
=LS2v
-----END PGP SIGNATURE-----

--=-MGOS4NjI36TDHYAFudZT--

