Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE7FACCF2F7
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 12:41:40 +0000 (UTC)
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33991.1768826499492412469
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 04:41:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=j7Ag7EzE;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=I2ZgGn12;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 758D91400022;
	Mon, 19 Jan 2026 07:41:38 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 19 Jan 2026 07:41:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1768826498; x=1768912898; bh=YumCNvJUec
	cuZYJzlHhx84UOanaa4m6aaf94aKi0PNo=; b=j7Ag7EzEfU5nO9i+boBC2nUeD0
	meO7pMjfJrUulmdCpOn3UTrob177X33Edsxm6w39YasskLIg2XHRIlzSO0RRgFsW
	7+y6s9iU0TNeMGP2wf7UGOt7vvR3XDn/ugDfhewkV7XRcKEMMZXT4b5cIqHdAVbc
	fAPzo+kV1kvfCJSdeF09BO5wKnfMSFYaRoFb1YmNLSpEDekcAdZ5oXkD7LSHE+Tf
	AZry6mKbUmHYaWvMpcq1nJ1eMkOd+NrquMhmw8F87cnfTe4lDqMYeAttdH1NTdAD
	ldVB/SrTiJOlaRkYJ3HMeDDY/1fa5pK2UccFro2a69PP7fSCU9Up1i6bTbSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1768826498; x=1768912898; bh=YumCNvJUeccuZYJzlHhx84UOanaa4m6aaf9
	4aKi0PNo=; b=I2ZgGn126PJ3gM/gvoxPDF8X+yS8yZTkyWOz0lSEl9rJBvKJeX9
	b8f/fgawui3BefSFzyTJFg2g0u4JAgylivJzaGD/aLW/QtWipNl3qTQeVAOjmU1U
	n4GCHyxckybkX7QgMS0pFIvlCBVWpUWzhWIHYKexLT77B1ebdkencFe0m9g7yfYl
	LGv87EGB+11Q0J9A5lC2l0z0ocmXb2XdAamg9Dpg86dleJuPmX8P8siu5W9vYK5w
	3Ar0D068cJM71QC6pr6OUxB8Xn7zw+X7Onr6Q2AGph3ewuCAQu2S8bX883c8YZir
	O0SX3riy4Rl0EImy0oUkdXuf2Mqs9ZCX6ZA==
X-ME-Sender: <xms:giZuaYxk358DsMPuaTfEgi9vQdqBmeNvoBzeiFF7BVDVSdP36XQcAg>
    <xme:giZuaTRYskKp-kd8npDumko8rtPLXm8rxZnCC9ImakDbMzNpMJ_7VphNfem3bLtjd
    tPrE8iwrJ3XhivLuI0o-YEfsfb2gdehdOwWdVNHmpwvORS46BWBTow>
X-ME-Received: <xmr:giZuafVTCHckW8TXQDzn4j28jlA3UwNDiPFSLQyYTD11T1ZyuIrXlC_7YMuaIDUqiMTyDBQFaWoBMGiW66IM0Nc0ibk-u_ghg40FqRU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufeejheelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    ephffhleegffejteffgfejieeigeeijefhkeelueeigeefgedvueffffeigffhgfetnecu
    ffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphhhtthhpshdqohhnlhihlh
    grhigvrhhmvghtrggurghtrgdrnhgvfidpuddvjedrtddrtddruddpvgigrghmphhlvgdr
    tghomhdphihotghtohhprhhojhgvtghtrdhorhhgpdhophgvnhhsohhurhgtvgdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghu
    lhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtoheprghlvgigrdhkrghnrghvihhnsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepghgvihhsshhonhgrthhorhesghhmrghilhdrtghomhdprhgtphhtthhope
    hophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggv
    ugdrohhrghdprhgtphhtthhopehgvghishhsohhnrghtohhrseihrghhohhordgtohhm
X-ME-Proxy: <xmx:giZuaVbr9d6S0ywHjUZ8G0tTuTCDS0GtMpl3f_eGLYxWVpG38YwtDQ>
    <xmx:giZuaV2trRQoVqrG9AItAQClaDOAfh5TyTqB6CEsGpzGU2tsLCCwWQ>
    <xmx:giZuaXisBp5y1wGs8nTFe-9gzxfFW7I3hlGarF5c_PA8rWm8pzKAdg>
    <xmx:giZuaZZSVt5nuk8fzW0d8L-_qsNB_r6Bu1wVv3AuoiMT6Uridm3Umw>
    <xmx:giZuaUsu_LYSx93vM7nXssMe4ferOpcQmGjqLfT44hDDWL0jkP8RO5FQ>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jan 2026 07:41:37 -0500 (EST)
Message-ID: <95b21b1f4a91a3d74faedaf62932a66d7ee26497.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH] global: convert all http to https
From: Paul Barker <paul@pbarker.dev>
To: alex.kanavin@gmail.com, geissonator@gmail.com
Cc: openembedded-core@lists.openembedded.org, Andrew Geissler
	 <geissonator@yahoo.com>
Date: Mon, 19 Jan 2026 12:41:29 +0000
In-Reply-To: <CANNYZj896UuNjPEzb4yOdQHe6dX=2oAxZGf6bF1Av2cGShLpNw@mail.gmail.com>
References: <20260116191256.3265364-1-geissonator@yahoo.com>
	 <CANNYZj896UuNjPEzb4yOdQHe6dX=2oAxZGf6bF1Av2cGShLpNw@mail.gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-oRR4QCFjMnvbdGbz79h5"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 12:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229612


--=-oRR4QCFjMnvbdGbz79h5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-01-19 at 13:29 +0100, Alexander Kanavin via
lists.openembedded.org wrote:
> I don't necessarily disagree with the conversion, but I would like
> proper verification of all links, and not not just 'some random
> validation'. You can extract all the new links from the patch and
> write a script that runs wget on them perhaps.
>=20
> I also want to point out that there's no mechanism to enforce
> https-only layer metadata. New http links will creep in, there's no
> test to stop them.
>=20
> Alex
>=20
> On Fri, 16 Jan 2026 at 20:13, Andrew Geissler via
> lists.openembedded.org <geissonator=3Dgmail.com@lists.openembedded.org>
> wrote:
> >=20
> > Recently an internal lab network turned off all outgoing http access.
> > This means we are unable to build oe-core without manually setting up a
> > local cache or mirror. Given the security vulnerabilities around http a=
nd
> > that moving to https appears to have no impact on building, this commit
> > just moves everything over to https.
> >=20
> > I wrote a python script and had it leave the following http links as-is=
:
> > - http://localhost, http://127.0.0.1
> > - http://example.com
> > - http://errors.yoctoproject.org
> >=20
> > For testing I confirmed core-image-minimal still builds and did some
> > random validation of the links changed (but not every one of them).

Further to what Alex said: This patch needs splitting up to make it
reviewable. Perhaps one patch changing links in comments, one patch
changing links in HOMEPAGE/BUGTRACKER variables, and one patch changing
SRC_URI entries.

Links such as http://www.opensource.org/licenses/mit-license.php should
be replaced with a pointer to the LICENSE.MIT file at the root of the
repository.

Best regards,

--=20
Paul Barker


--=-oRR4QCFjMnvbdGbz79h5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaW4meREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bixUAP9vNmfqlcO3FSlInkPZGAI9cem/xgftSjEk
oiAIJYIb5AD/Xw09eR3+R6aYgAv7LfcA+/2FNZ0iJ3iWGI3P02jSJwY=
=PSZt
-----END PGP SIGNATURE-----

--=-oRR4QCFjMnvbdGbz79h5--

