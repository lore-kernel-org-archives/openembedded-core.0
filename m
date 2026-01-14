Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C1CAD37E34
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:39:25 +0000 (UTC)
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10241.1768397958457642563
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:39:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=w6DHdzAc;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=R0BBNiVr;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id C7B9F1D00165;
	Wed, 14 Jan 2026 08:39:17 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Wed, 14 Jan 2026 08:39:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1768397957; x=1768484357; bh=GgOfc9BcAH
	xu3BtOI4JLaI+DU701JxwulyBG9MkUkf8=; b=w6DHdzAcT6kQ0NfweiR8Vmhjrn
	BYdvYSNlBkiXmNE+NdEBfF/gd61+PhcM/4Yu3Gygdl1tTr2VbE28prRkqRsJ7Q4i
	GLJykK4qmEt4pUIJrILg6vDyo1/4Rz+hHBfGhnW1HtI0la80r7kgxmkV8oZ05TwH
	VgUDSH7hbzkLTYO+JnDdCDl44Z/oBUqn3Mhj1yYlDeZ8hfgNlA71kvJFn396xGeD
	rDc8gF1A+oqXyo2WYRCGvr0Ximsl2RBI3xUbRCdq9KuC1vpJB9K0qOlBpGmFqLJk
	mnEe+THAKMXdWS2rhPSuq+uDmF3VyDbaACSOFPYHwCepzYM0NtQkDJS7uLuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1768397957; x=1768484357; bh=GgOfc9BcAHxu3BtOI4JLaI+DU701JxwulyB
	G9MkUkf8=; b=R0BBNiVrtoV0pq4XDMUp3OJ7JyolwL9ljHtYbaIoZlwy49z2jST
	6jDZJjvXZXo2MnZZHiHkp/dtPuPlssKvXznR2uy9tNDVtU2iYzTRa0PkPHkM+6DZ
	jqZWamFndSAPlXxz/pTSf4AHQnYx/gNP+6c9qptJznSS0//qQO6t/G1Y2aFjOhP+
	I/2+doNbMWr6qYwqAH/RBn7twbJGWINJ/VA9C2nMOR4xZNt+mPr++WYEtbVSMBJH
	1QIeXaKhX4s69I0wowhGSsmp3RXccdqmifk56ii0Kfs/YHxWqZAeuWMhqDlVLDiM
	7qexS98RA9mx1FYaxV7S3sIiqGfnL4Nzmxg==
X-ME-Sender: <xms:hZxnadyN4np8dGQrKopsTEXAwkfXzFIrtiplpkcXp4Hd-KItpH-B1Q>
    <xme:hZxnaTSuTUWdYOHT4u7XU7YHc9_te62rUxkO2T1WncLQBBOPuIL4_iXlk5MeXtsnZ
    rQKGYAf09TBggnW_rrBEOT3mPJZcXaocLT0FNhRg9oPmAnCWEmc480P>
X-ME-Received: <xmr:hZxnaU_azjCO0W-u3nnBUDdMiXK2g-KYqIcjx_sZ3Cr46C_kgL8wIwrs0xYX0FLspTAwG7hiQ3sw-jNbxPVZBxcY6xmXRabIsRKDbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdeffedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepudegteehueffvddthfelgfeuffejgeehgedtue
    etkeetveetvddtgfekuefhjeetnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdr
    ohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphht
    thhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehoohgsihhtohhtshestg
    hishgtohdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehl
    ihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:hZxnaao25IqiNNoNxbr4KP28QhiBuI4mtCYFb1K1jRMXXsDRf5ZzhA>
    <xmx:hZxnaRmAxubnWAmelh6rj-3_9ZcZE6sgoEDrkF5cDm3LLaNmq4T_Yw>
    <xmx:hZxnaRLsPvxl9pKrKFYtifhv1zkQuV8mSa1EXgXbMH4gVFcPlKKajw>
    <xmx:hZxnaWxiDwcoL7WUDYpjuLeytXn1-VD5Cn65e9QwpnUDdZz08vwd7g>
    <xmx:hZxnaVDuHNn872kolh8UVb20EHbHc9PnP-PprQF00wnj7f4j8Ss9C0cy>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Jan 2026 08:39:16 -0500 (EST)
Message-ID: <a257bb5d7582180349df7c5bf468441b70f91d17.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH V2] patch.py: add checks for patch_path
From: Paul Barker <paul@pbarker.dev>
To: oobitots@cisco.com, openembedded-core@lists.openembedded.org
Date: Wed, 14 Jan 2026 13:39:10 +0000
In-Reply-To: <20260114125207.497436-1-oobitots@cisco.com>
References: <20260114125207.497436-1-oobitots@cisco.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-UIBog4RCrEfK8R5jvfK8"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 13:39:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229331


--=-UIBog4RCrEfK8R5jvfK8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-01-14 at 04:52 -0800, Oleksiy Obitotskyy via
lists.openembedded.org wrote:
> All URLs from SRC checked to be a patch.
> In some rare cases, when we have "diff" or
> "patch" into URL it is treated as a patch not
> like proper resource (e.g. repository). This
> happens in case of using mirrors. Without
> pre-downloaded repository archive we have
> directory into downloads and exit from
> patch_path before checking for patch/diff.
>=20
> Let's limit patch_path call for url's that
> has "apply" parameter set or has original
> extensions .diff or .patch.
>=20
> Error example for this URL:
> git://github.com/pkg/diff;name=3Ddiff;\
> destsuffix=3Dbuild/vendor/src/github.com/pkg/diff;branch=3Dmain;protocol=
=3Dhttps
>=20
> ERROR: nativesdk-yq-4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0=
 do_patch: \
> Importing patch 'github.com.pkg.diff' with striplevel '1'
> FileNotFoundError(2, 'No such file or directory')
>=20
> Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>

You mention the `apply` parameter in your commit message. Can you just
add `;apply=3Dno` to the relevant SRC_URI entry?

Best regards,

--=20
Paul Barker


--=-UIBog4RCrEfK8R5jvfK8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaWecfhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bpWBAQDPQMF42J2GGYho8mTZaqT4Ulh18T5dZK0g
R9ck8909/gD9GP0abC0JHQs7jpqK59fqKmH9XZiBep2y0RkrrXxPvAU=
=IB4a
-----END PGP SIGNATURE-----

--=-UIBog4RCrEfK8R5jvfK8--

