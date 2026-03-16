Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94BE8F46424
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 09:29:18 +0000 (UTC)
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46881.1773653350448890262
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 02:29:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=RC5WuMRE;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=dgjjpxRg;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 97FE1EC05FC;
	Mon, 16 Mar 2026 05:29:09 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Mon, 16 Mar 2026 05:29:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1773653349; x=1773739749; bh=WcemfevBng
	xy+h6LnLrn8YVcRicjZGwK0vBeoIOJEyY=; b=RC5WuMREW9/KnQSQJgaXCKL0cb
	w4O5sYGz+IkkUqMr+rG1MPuF4TQughKj/XzEKYg3CXjp6fM0z1hcCPig5hW8f4eK
	LOllg3UWSxh8dAzmNXdOwxo/LeKo4vNlCVr15/sq+LZI3GPKdwegrSueoJfxOs97
	gqtvMv1ePdyJ1JFlrhy0ay9Zi5i3h7NArFcaVqkc1fQgec9i4zQKQmZJlRtoQNrU
	RoiHW+XnmM7o/59nW1JTZvpzBLcQ/QVpTsjFPAOeDOeJuzaPmWuhPWxCh6601xpk
	EmXk/MOOwKyiUhFDoU6EuoE+qdI1Rvt+krTymkldRR/oWVWeu3JKBOfFq/Fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1773653349; x=1773739749; bh=WcemfevBngxy+h6LnLrn8YVcRicjZGwK0vB
	eoIOJEyY=; b=dgjjpxRgVevRlCbr7RrcR7zCmdm4dV+Tk8bl0Y12hhN7hidvmFJ
	6Lc1gHAHIW3DQ3KxhJONn8VFXUm3F6pRy0fCoqFKPYv+ElgP1TbYGcAbXECqpRVB
	xOlypyOfOWroF4ejiuTxD86VJhJM3BnKlEqfq1pDJXLl4OXsIAoaLY7+IvFJiQbQ
	D8guOZeRVf+H0aKKXOvW/yoCOKaUYjcgKQZ6Ke7NQ47NeiH0lZGTQO0B9eQy+Szu
	qm+FS+FdHg0t4NsV8eCm+uXr1uvQxl/iqO8Bayi/4xWvYd6KjpFQ4lIfxGgbQBtt
	fZC/L9mpdb98XONTVdq2xvqiaMBUxljW9yQ==
X-ME-Sender: <xms:Zc23ac3fmw-GqEKf6ztUH7gmzl9k4E6Q-2VmT0ZNF9cQmSE0N7Otug>
    <xme:Zc23aYmiDU2hmmbXUQasafSoO-gCVDYBZ_XmpQFLkiUyBOfq_91i3BkDZq8ocfCRH
    pud5qCm8LSGkX70Kq64zKR3M638nQFaSifEMg8sezqNh08BWU2ah_JG>
X-ME-Received: <xmr:Zc23aU8HN-iKicABUGy13JegY9_XkrnbiWs6lzSbBk4RWHyiJH9SGGbITwlp1y_Kbha1u4_A7MQFv84cisCRGDMLyG1_CkSGepcVeQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvleektddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    ephfekhfeugfelfeeludellefhkeetvdffiedttdeuueekhfeiudeivdefueehuddtnecu
    ffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggv
    vhdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprh
    grshhmuhhsrdhvihhllhgvmhhovghssehprhgvvhgrshdrughkpdhrtghpthhtoheprhgr
    shhmuhhsrdhvihhllhgvmhhovghspehprhgvvhgrshdrughksehlihhsthhsrdhophgvnh
    gvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtgho
    rhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehrih
    gthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgt
    phhtthhopegvmhhkrghnsehprhgvvhgrshdrughk
X-ME-Proxy: <xmx:Zc23aVpwz5KUBKGwyKItGoB3BH5hHgUniUwNSEm-7xijs7cpJKEBVw>
    <xmx:Zc23aVn6dNaldJKIHjit6AOoai8KzLn8HGlRXfH-4D614iJCOUKkGA>
    <xmx:Zc23aUjPN1i7QgTekhGpGO2dcNtzujxvcWautwfTp4EkKBScJk19gg>
    <xmx:Zc23aVdMIYN3Z-xWVg-PKKrp15x4YwexFgt_V3ccqODmq2nZHhzkDw>
    <xmx:Zc23aUK2H1B0AAdlTcAk0ZJQ7uPd2-Gvg-APJe450z99WruJyD1VRKGu>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Mar 2026 05:29:08 -0400 (EDT)
Message-ID: <6aba349f497903351a0cd8d06708e94119bd5d05.camel@pbarker.dev>
Subject: Re: [OE-core] TMPDIR, bitbake v posix
From: Paul Barker <paul@pbarker.dev>
To: rasmus.villemoes@prevas.dk, "Rasmus Villemoes via
 lists.openembedded.org" <rasmus.villemoes=prevas.dk@lists.openembedded.org>
Cc: openembedded-core@lists.openembedded.org, Richard Purdie
	 <richard.purdie@linuxfoundation.org>, emkan@prevas.dk
Date: Mon, 16 Mar 2026 09:29:02 +0000
In-Reply-To: <87cy14p1on.fsf@prevas.dk>
References: <188B34BEFB66411E.2721127@lists.openembedded.org>
	 <87cy14p1on.fsf@prevas.dk>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-EzTj/cDHTnmIv6W+tULg"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 09:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233221


--=-EzTj/cDHTnmIv6W+tULg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-03-16 at 10:24 +0100, Rasmus Villemoes via
lists.openembedded.org wrote:
> On Fri, Jan 16 2026, "Rasmus Villemoes via lists.openembedded.org" <rasmu=
s.villemoes=3Dprevas.dk@lists.openembedded.org> wrote:
>=20
> > Hi
> >=20
> > When some task uses mktemp(1) or similar functionality (e.g. the
> > python tempfile module) to create a temporary file or dir, those end up
> > being created in the global /tmp directory. That's obviously not ideal,
> > as those might be left behind in case of an unclean shutdown or if the
> > script is not properly written, and won't be cleaned by do_clean or
> > RM_WORK. Also, /tmp is often a tmpfs instance, while some tasks might
> > want to create rather large temporary files.
> >=20
> > Most such utilities/interfaces respect the TMPDIR environment variable,
> > if set. However, since that name is used by bitbake for a rather centra=
l
> > concept, one cannot simply 'export TMPDIR', as one doesn't want that
> > top-level build dir polluted by random build files, and it still
> > wouldn't be removed by do_clean or RM_WORK. Ideally, all tasks would
> > have a TMPDIR _environment_ variable set to something below ${WORKDIR},
> > maybe even something unique per task (say ${T}/${taskname}.d). But
> > there's no simple way to do that that doesn't conflict with bitbake's
> > use of the TMPDIR name.
> >=20
> > Can we do anything about this?
> >=20
> > (1) Do nothing, live with this limitation.
> >=20
> > (2) Special-case TMPDIR, so that all tasks are created with a proper
> > value of TMPDIR in the environment, not derived from the bitbake
> > variable of the same name. Could be settable with some new TASK_TMPDIR
> > or do_foo[tmpdir] flag. Somewhat hacky, though.
> >=20
> > (3) Bite the bullet and plan for renaming TMPDIR -> BBTMPDIR, so that
> > the TMPDIR name becomes available for use with its standard POSIX
> > meaning. Obviously a huge thing to do, but hopefully most direct TMPDIR
> > references are in core or bitbake and used for deriving other standard
> > variables.
>=20
> I tried doing TMPDIR -> BB_TMPDIR in bitbake and most places in core
> (there are some places which use TMPDIR in the posix sense), and it
> seems to build a core-image-minimal without problems.
>=20
> So it's not impossible, and one could prepare for the transition by
> eliminating quite a few direct TMPDIR references using already existing
> or new derived variables (e.g. BASE_SHAREDWORKDIR =3D
> ${TMPDIR}/work-shared), making the number of places that would need
> the rename rather small.
>=20
> I'd be happy to send such preparatory patches, but it would be pointless
> if the community doesn't deem this to be a problem worth fixing.

Hi Rasmus,

I think it's worth trying to disambiguate between the two uses of TMPDIR
if we can, but it's not a change we can take this close to the next LTS
release. I recommend sending an RFC patch for people to ealuate, after
the 6.0 "wrynose" release.

Thanks,

--=20
Paul Barker



--=-EzTj/cDHTnmIv6W+tULg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCabfNXhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bocmAQC3Hwo+S1ZpgIgphHg5HfYpyGLH0IpxsRh6
oSZyg9SQLQD/UeBcQ0voU30ejSGoQn3Bp5AdH3HkUceGJ4eOch03Igk=
=nooY
-----END PGP SIGNATURE-----

--=-EzTj/cDHTnmIv6W+tULg--

