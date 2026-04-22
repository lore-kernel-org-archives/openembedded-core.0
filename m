Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC80F9B5F8
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 09:33:54 +0000 (UTC)
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76749.1776850429916395149
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 02:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=SdpmobLx;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=WvD2CnyP;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.148, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 1DF5A1D0023D;
	Wed, 22 Apr 2026 05:33:49 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 22 Apr 2026 05:33:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1776850428; x=1776936828; bh=x4pO7klqeX
	BJ35bjqbaKZnIebFEUxuBAGDERsnO9SRU=; b=SdpmobLx8tkP81/h2sooFefiY8
	Vpd2RRWW1LIByhzoIKk2epJW3Pk0pUtRXp8yY1h2JqC7Bud07cQGnZxXyIxBdtq5
	MCkJpzWgGTa2n99B5zU/FLQ/W67iLWqjXqD4IHC/IDxe/+ddWYGutLpjPk2PIJfo
	z8FbO9FzUScisLNDnoKCpYt0G3TEY9nZidt1q387yVQfCYioHVAxF2bEpVYgARYE
	4GBOq/bF6NKNdvDg0uegMB8D3ksqG/kUYRRU3pW63hvp2a7kfZjsfbYyH7SvF6YG
	qa3xMzEiVivFKGBeo0BCGzEvC/gV/8ysZuja1JVtokwnCYLnccUemweQc2og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776850428; x=1776936828; bh=x4pO7klqeXBJ35bjqbaKZnIebFEUxuBAGDE
	RsnO9SRU=; b=WvD2CnyPCLlXKy91lrje6TSkZtYv8ZzTSf1LOGEGqm06ScId9on
	14LiYBeueZoAL4jU5pPkihSgs65ioNDQZ+9skBRKGLCUCXsMKNC7jQ8KmHUyHsUH
	F9qL7l98jzlep+DN4BeGsyczyRQflhyIVD3zirvwBVCYV1Upf/SsXk+oNaqNEY8D
	73hjga7oS4WgwqXEjemUWymAj6om3uTztNSDuHRsvHE5JU/8lt8BfglcEl73qUgS
	KkPFi1fbH95Yagd55M3+O+Fc2G4WFtr4euDcC+rySsx/oSg59IEe+zugFiTvch/v
	BkcJCekztFvS5id1ViwdRKiVZEN6792SuNw==
X-ME-Sender: <xms:_JXoabFgAuHRREU41S2y0EIyRvI2P_pbeV_bb8I56UaD_dU3Aycmlw>
    <xme:_JXoafwo4EO9ZYlRQzSsgCGg2ylfCmGBX92IFTQcSE93amNJKr7_1c1yIiV4zx349
    pFVBUxu72GSKzv-dbj4s5RawQMCRniiF0tp6yL6EJpjSL4dq5s_Emk>
X-ME-Received: <xmr:_JXoaajjEdD3V-0LQa5ykGG0eQSD2pVqa-4i0Qy6sMteabxtM-rX9WmxxIHKB89ke_HjFN50S7uxc93Sv57KlfeEkcDDYGrPjZmMH13pY_nB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeifeelvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkuffhvfevffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    egieegtddukeevgffhfeejffettefhtdevjeetudevfeelvdegleeileeutdegieenucff
    ohhmrghinhepsggrrhgvsghogidrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhk
    vghrrdguvghvpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopegrrdhfrghtohhumhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohep
    ohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvg
    gurdhorhhgpdhrtghpthhtohephihotghtohesphgvnhhguhhtrhhonhhigidruggv
X-ME-Proxy: <xmx:_JXoaSxi0SGLTONsnBZ2TBqTM7tAXe6XBst26y6_O3q-puWXffLvjA>
    <xmx:_JXoaVLQS5e8l4OYq26d8Hm4BiFP2bQKm585je_ZVv-Q08UpmJpsGA>
    <xmx:_JXoaRTgmrpHtKOEqpSr7_LuJtBMltEszNWbLVoBpy0hBrc-VlESiQ>
    <xmx:_JXoaVpqhvHkalOJVa6MwHV_FNTJV-0l_dLsBqK7o85g9TM3jx0mzA>
    <xmx:_JXoaWnzMq8P31IK0UnuBZSoYnMj9lfXgMUJsS19h3HVVwodUhdDHUJu>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Apr 2026 05:33:48 -0400 (EDT)
Message-ID: <e527213d5944e137dffca719318b9630a741c552.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH] barebox: upgrade 2026.03.1 -> 2026.04.0
From: Paul Barker <paul@pbarker.dev>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Date: Wed, 22 Apr 2026 10:33:41 +0100
In-Reply-To: <25b4ca00-a528-473b-9451-e3696ecc4a35@pengutronix.de>
References: <18A7DC2A7C609741.1451107@lists.openembedded.org>
	 <25b4ca00-a528-473b-9451-e3696ecc4a35@pengutronix.de>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-xiMbG7rYWsr521vsgQvv"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 09:33:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235705


--=-xiMbG7rYWsr521vsgQvv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-04-20 at 11:40 +0200, Ahmad Fatoum wrote:
> Hi,
>=20
> On 4/19/26 10:30 PM, Ahmad Fatoum wrote:
> > Main highlight of this release is the new devboot mechanism, which
> > allows overriding any combination of kernel, device tree and
> > initramfs in an existing boot flow with network-hosted files,
> > simplifying iterative development:
> >=20
> >   https://www.barebox.org/doc/latest/user/devboot.html
> >=20
> > This release also restores compatibility with new TF-A versions acting
> > as SCMI clock provider, after TF-A v2.14 broke the SCMI v2.0 clock
> > protocol used by earlier barebox (and Linux <=3D v6.6).
>=20
> I see now that this barely missed the M3 freeze.
> barebox releases are monthly, but we were intending to provide long term
> support for v2026.04.0, so it would be great if this could make it in.
>=20
> The majority of new commits in this release are bugfixes[1] and even the
> highlighted feature resolves a boot-time breakage for barebox when
> compiled as EFI app.
>=20
> [1]: https://github.com/barebox/barebox/compare/v2026.03.0...v2026.04.0

Hi Ahmad,

Thanks for the extra information here. We've queued this one for the 6.0
M4 build as it's worthwhile to align with your LTS release when we know
you're actively involved.

Best regards,

--=20
Paul Barker


--=-xiMbG7rYWsr521vsgQvv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaeiV9REccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0btYUAQCGzCU+fh6Bh1I47OZecwiJ3B5AcSk6F7Dj
mGVuqKetHwD8DqSsJXKDRmwNNdQQLRLmWN2uokRRvI7ADqd7tOExKg4=
=zttO
-----END PGP SIGNATURE-----

--=-xiMbG7rYWsr521vsgQvv--

