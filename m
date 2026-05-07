Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E33CD3439
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 15:01:35 +0000 (UTC)
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14240.1778166089641426007
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 08:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=JCd8dPk+;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=g29kwMY1;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.150, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id AA6C71D000AC;
	Thu,  7 May 2026 11:01:28 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 07 May 2026 11:01:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1778166088; x=1778252488; bh=O/Pz1QsMsO
	wCMRoAiviq1CRMpCbxwV4M6+et0tTm3h4=; b=JCd8dPk+7LMnRdT8ToKEmD+JVl
	hYgSGJ7wMWvnJpg+05i87ROExwRAdlolQWQhl1xVq8XpOY03YYLuKxy16AS+WZww
	UsjmJONILm5ROaNDAfT4xVMXcvOPxxAas+Rq+Q+91rl7qa7sfmxRS0kKfTxIOEzp
	Rq9XO6Mi+xtT/NUb29lBFcEx+O6mpSYZd1Ul9RuYCTOWd1zJKlrfPJuhG0FBdxqg
	ql+2rmTODswNXC1WndhP56cfMkJDm34+t4NerVEoodC58j8qewY7M0PYkKSWbJPK
	sto8rbNuBD+W9VKWb+YaVKcmKGFO7HP1eOXZTYAh/LA+qu5OOSo1CMnCbFsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778166088; x=1778252488; bh=O/Pz1QsMsOwCMRoAiviq1CRMpCbxwV4M6+e
	t0tTm3h4=; b=g29kwMY1y9w4ajvT72gdX+c55FqCb0MbXnYXA3wLi4ItqttX0Cg
	Nd+7G580i/EEB8VPz/aNbrueSPsoY0VG+/8bSwP7Bovi6YC1ZLtOp1CXbzUzqvyS
	3EDVDj52rCTOC1D1v5DrqMjKcEA+vD0gwPZ/Xu4eo7tMXKuFKvOUigfBen4eNG7a
	UaRsumDpBgw1I3M9e3/TGfzyVOvuaUodhTC1zPIAwhqPijcHKXDieB8ZXi41gGZ3
	6amXw/3XQQQFJsIE5sOZ7jSj2pGV3/zTFV5TQFydlHWbg8PQq1QDdqHbn3KOBYi6
	9WZBjY4qv/mjhEkmTya5uGkIe1EGsOX4qdg==
X-ME-Sender: <xms:R6n8aXcAm9b6YIlGNzhssXPYarO-SoWa8gwPdahXQZszmvq-gPNPpw>
    <xme:R6n8aUoU8PN1-vEt9NCos03HLyIXuuf4AkIhzF6ha9ufg81TQOQvvknaIdpPQ3Fct
    qAHycn4X_QRnDuE_plJWjTlqjSDdIxJIKmZeFtJ1dxCiMR0--desHU>
X-ME-Received: <xmr:R6n8ad4nKaSpupYgW-bJUi6it7rmu_m0YLlRj0pbaV_-V0R8he53FaUH7KcGNppvCuMW1CYK6uLIiWES6Zy9ol9VlvoXf1xuuJGyU-qWPGGm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutdejjeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfevffgjfhgtfgggsehgtderre
    dtreejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghr
    rdguvghvqeenucggtffrrghtthgvrhhnpeelvdevheetleevfeetleetkedutdfgfeehhe
    evveejffeiveetjeetueekfeevheenucffohhmrghinhepohhpvghnvghmsggvugguvggu
    rdhorhhgpdhgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghp
    thhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlvgigrdhkrghnrg
    hvihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepqhhurghnrdhsuhhnseifihhnughr
    ihhvvghrrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslh
    hishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:R6n8aSrxyQySBq3DTphg4JgLHBJvpQIvRgvE63a5rnjdPG55H7Q1bA>
    <xmx:R6n8aXjmwAlPCnw1pG6GJyKoiL_VY71zLVX69b9ydNTJL9Dkis44Ow>
    <xmx:R6n8aUJyYwc3ntAAvHOy4uTLAvWKGbRQhz1F9md7sRadAVgINDD6vg>
    <xmx:R6n8afD7qXzj-EAdZBGqXmw-UbiT2Yau5mCMns-RMQEt3j-xf8vNrw>
    <xmx:SKn8aVSjvZyqql-vRAa1l95sdkiAkGKySCS6leZ1c9XO1dn80Go-8Jpx>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 May 2026 11:01:27 -0400 (EDT)
Message-ID: <46e6de3dea514e2f30dfe806dbddef9f08caa60a.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
From: Paul Barker <paul@pbarker.dev>
To: alex.kanavin@gmail.com, Quan.Sun@windriver.com
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 07 May 2026 16:01:21 +0100
In-Reply-To: <CANNYZj_++oDps3s2uq51a7j3CQgK1MSuuSgY9Cz0-wFtE2gnSQ@mail.gmail.com>
References: <20260506214835.1578529-1-Quan.Sun@windriver.com>
	 <CANNYZj_++oDps3s2uq51a7j3CQgK1MSuuSgY9Cz0-wFtE2gnSQ@mail.gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-UEux6QLvVnwIDS2qdDom"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 15:01:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236597


--=-UEux6QLvVnwIDS2qdDom
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-05-07 at 13:23 +0200, Alexander Kanavin via
lists.openembedded.org wrote:
> On Wed, 6 May 2026 at 23:49, Quan.Sun via lists.openembedded.org
> <Quan.Sun=3Dwindriver.com@lists.openembedded.org> wrote:
> > +SRC_URI +=3D "git://gitlab.com/qemu-project/python-qemu-qmp.git;protoc=
ol=3Dhttps;branch=3Dmain;destsuffix=3Dpython-qemu-qmp;name=3Dqemu-qmp"
> > +SRCREV_qemu-qmp =3D "82006cb788d27b090a8b84fc7831feb9c528bcdc"
>=20
> This component should be provided with a separate recipe.

To explain this a little more:

- python-qemu-qmp has its own version numbers now that it has been
  broken out into its own repository. So, it would be much better to
  have a proper recipe for this with the correct version number
  specified.

- In the README file, under "Who is this library for?" it says: "This
  library was split out of the QEMU source tree in order to share a
  reference version of a QMP library that was usable both within and
  outside of the QEMU source tree." - so, python-qemu-qmp may be used by
  other software packages in the future as well as being directly used
  by qemu.

- Packaging may be cleaner if this Python library is a separate recipe.

Feel free to ask if you have any questions :)

Best regards,

--=20
Paul Barker


--=-UEux6QLvVnwIDS2qdDom
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCafypQREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bkfLAP9HDDXAh3Y23K9/+a0SxrpVHUZxMpvAyrKw
nVVywSJO3gD8DrBgKYL9UD8Hcis2xYYKyU1pHrk6w02pVVmC23HwBgg=
=sZBt
-----END PGP SIGNATURE-----

--=-UEux6QLvVnwIDS2qdDom--

