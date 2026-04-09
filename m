Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6EF9E9DE66
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 08:13:33 +0000 (UTC)
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127652.1775722410980433886
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 01:13:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=0WOFtH8M;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=KuqHr5Y2;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id B88F91D0013C;
	Thu,  9 Apr 2026 04:13:29 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Thu, 09 Apr 2026 04:13:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1775722409; x=1775808809; bh=0LkpnxOTW4
	AZ2xhYoJpS0GR4+lvC4MtVrxZRdWcM/ks=; b=0WOFtH8My/Z0KdkckIxC5+9kdg
	5VftVVosk1Zk4LFEBvPzYDtW1yfNSOAIcj7ijw8uwWSFIZMDGjDZI/rsXOEdNini
	TV6QJWc8YgU6TT8aGiInGlEwwRP3AI5/jZfweMd17ExBvUNiEF5dD6GFj89ElWj8
	RNhKwTcETsKqjMkpsDvJmizVQIuFTWdLxfVCUxq5zYCjqBpvyQkClRhkNuKimM7U
	oYEhiCAQB0rAy2QjEKXh/dF0G6N0i5BBzTGZL/grshZqnbfYCK9OKNcgFWB3Pk9p
	8qUQhXNz7m1dg/mP4d1om2SFknQXL6xi358cMdUKkssyeKfgJiWXZJek9X7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775722409; x=1775808809; bh=0LkpnxOTW4AZ2xhYoJpS0GR4+lvC4MtVrxZ
	RdWcM/ks=; b=KuqHr5Y26b1lIVz6MftiBFG25RWnPM/HyLyNwwhW0GtAQEM+Oci
	liMyhZ/yipH4NssqoL1EUmeXgnsyl5hLpes87Pip7HxFDJVGjEdiNYS4usAGCTKk
	DQeXo97BaAwpeQ401ER9l71h1IQE00AL54SBbs15D3uZyiQyoa9ykwtzTwWVlt4h
	40bJoYFx7hFHtlfpvX9tp4Bb83FYXLL/ha1zXgD9apKyRaZmxVHqOg9KyXudOp1W
	BXi1K98ai7RD+uzxQGIJLzTEgsAoRK20Q6xR6gDUyn+b2h9C8ZbVm/fvpGa/Hu7Q
	GBmmV8EcG9SKTwD6OqmxAWjnKXvF6YRpVFw==
X-ME-Sender: <xms:qV_XaYimr7Fh7BiP_THRq7ckAwwzguWn7tS-NRso07XGHJCxMOG8_Q>
    <xme:qV_XaShCaXK9dOhCS_BxbQRz7IoaUDyYyeJX_0GgwjJvc4r7xi0V4pJ98pekZNW7z
    _Rab4pPxeUsv5vgH_KV_3yr1zdtWr_VyCj_WiaggzL0gWj1bL42kSU>
X-ME-Received: <xmr:qV_XaQLYNipnMZTVTllnxVrmnt2xL_dpy_eQVbxGy5UHDu-SwhMf-g93bhPlXWcUO111xeNa3pcvytCc55Xy-KKJO3ejk83yTS_AliwmNxk3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvheeliecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecufghrlhcuvffnffculddqiedmnecujfgurhepkffuhffvve
    ffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehp
    rghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnhepieegjeeiieelud
    ejvdejhffhjeffkeefgfdtueeugfeglefhgfdtjeekjeetueffnecuffhomhgrihhnpeho
    phgvnhgvmhgsvgguuggvugdrohhrghdpnhhishhtrdhgohhvpdhlihgsrhgvtghmtgdroh
    hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
    rghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohephedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepvghrnhhsthhpsehgmhgrihhlrdgtohhmpdhrtghpthht
    ohephihorghnnhdrtghonhhgrghlsehsmhhilhgvrdhfrhdprhgtphhtthhopehhphhrrg
    hjrghprghtihesmhhvihhsthgrrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvuggu
    vgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpth
    htohepjhhinhhfvghnghdrfigrnhhgrdgtnhepfihinhgurhhivhgvrhdrtghomheslhhi
    shhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:qV_XaZEeQCGkZ1qNHd8jqzCmmqJh7CJh6M-p2qt1Bx0QeYR9NNELWA>
    <xmx:qV_XacSRqAUkqL0ixFE1N4rHgdIDd8qtTyZeRZBGX-T5OmOV0e_sHg>
    <xmx:qV_Xaddp3StG8gV0hrmFXfqoz5SGpWDsC9gTSgdN4tnuD6PgYvD5MQ>
    <xmx:qV_XaTqVVOf717q-OLeY-0a5sOnpemlLW8zjKzywwJSvI3XCpYSNZg>
    <xmx:qV_XaX3-Bt915YkSUIcBCbq1YyB7bVNlTz9EhlOOW8gZa1wLAibMjOeE>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Apr 2026 04:13:28 -0400 (EDT)
Message-ID: <efd1613531056e215bff83434217f8d2af7c12fb.camel@pbarker.dev>
Subject: Re: [OE-core] [scarthgap][PATCHv2] busybox: fix for CVE-2026-26157,
 CVE-2026-26158
From: Paul Barker <paul@pbarker.dev>
To: ernstp@gmail.com, yoann.congal@smile.fr
Cc: hprajapati@mvista.com, openembedded-core@lists.openembedded.org, 
	Jinfeng.Wang.CN=windriver.com@lists.openembedded.org
Date: Thu, 09 Apr 2026 09:13:22 +0100
In-Reply-To: <CAD=4a=XhNPQY+RJDRnBsTqOGVPf0gWKFtiowVucWQR-TtpEMaQ@mail.gmail.com>
References: <20260323053041.7848-1-hprajapati@mvista.com>
	 <DHDXTZVTX375.10CYDEYY8UJK9@smile.fr>
	 <CAD=4a=XhNPQY+RJDRnBsTqOGVPf0gWKFtiowVucWQR-TtpEMaQ@mail.gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-zp1IajifTyNzqW2uwszZ"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 08:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234892


--=-zp1IajifTyNzqW2uwszZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-04-09 at 09:54 +0200, Ernst Persson via
lists.openembedded.org wrote:
> What's the best fix for the master branch? Is it time to switch from 1.37
> to a git snapshot?
> 1.37 is soon 2 years old. Or we just keep patching the CVEs there also.

At this stage in the development cycle I'd say stick to CVE patches for
busybox. We're about to build 6.0 M3, and upgrading busybox to an
unreleased upstream commit during the M4 feature freeze would be
unnecessarily risky.

> Den l=C3=B6r 28 mars 2026 kl 00:02 skrev Yoann Congal via lists.openembed=
ded.org
> <yoann.congal=3Dsmile.fr@lists.openembedded.org>:
>=20
> > On Mon Mar 23, 2026 at 6:30 AM CET, Hitendra Prajapati via
> > lists.openembedded.org wrote:
> > > Pick up patch from NVD report.
> > >=20
> > > More details :
> > > [1]: https://nvd.nist.gov/vuln/detail/CVE-2026-26157
> > > [2]: https://nvd.nist.gov/vuln/detail/CVE-2026-26158
> > >=20
> > > Note:
> > > We use patch from busybox mirror that looks trustworthy
> > https://gogs.librecmc.org/OWEALS/busybox.
> > >=20
> > > Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > > ---
> >=20
> > Hello,
> >=20
> > Thank you for this new patch, it looks good now.
> > But, as far as I can tell, this CVE also applies to whinlatter and
> > master. You need to send the fix there before I can take it for
> > scarthgap and kirkstone.

Best regards,

--=20
Paul Barker


--=-zp1IajifTyNzqW2uwszZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaddfohEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bsE/AP9hn1MyTlShDpM08UjGPoTjymfiUy5WQ2js
PQGd192wVQD/cEghBAB++OM/oPGo2YUPeZDoTSatpXYTq/7aAG02eg8=
=PEEP
-----END PGP SIGNATURE-----

--=-zp1IajifTyNzqW2uwszZ--

