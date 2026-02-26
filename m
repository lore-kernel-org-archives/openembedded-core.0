Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577C8FC591F
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 09:59:59 +0000 (UTC)
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67092.1772099997947395420
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 01:59:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=UDsgmWfO;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=c940k1vz;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.152, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 422E97A018F;
	Thu, 26 Feb 2026 04:59:57 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 26 Feb 2026 04:59:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1772099996; x=1772186396; bh=LriQeM6xqsbkOtSirlAzMgcTLMxkDEzE
	d2wSzX7RvEE=; b=UDsgmWfOzNJxY82AaqMYvNjooXCMlQrCR+Lsoqf4Cc4+tgES
	h3+O0M7ynf2OrF4RIkiUe21XgTNmJggUmgAXUjn+6QbKTUna6t6oX1rYdimPsIXx
	NwKDp/l1yFBtBGKejgfBMQ9SBIRqK5fS9zJwo7+t5ii95oLp0aIFYpfZDnTLtDYB
	YIptrrfvWz74OxkRnAwlQ3NIwOegUAFQQyY5YxVAO8bVkv0mOmqeucFJYLO5sSF6
	dSwNw1jN6RuKt91s5+cEX9EoWHeIhObgQ7/UqZANQkQHlY7Kh8fiySnBBcWVTpWd
	HKGrZLbbzhZ/pDdQnhOYol7iuTyJh+Kib8wH2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1772099996; x=
	1772186396; bh=LriQeM6xqsbkOtSirlAzMgcTLMxkDEzEd2wSzX7RvEE=; b=c
	940k1vzOuqoHiGIkkH1LcVp+npiKTpMJbKTcrSNIXZsadQYXnOslIftQdmT9nuI/
	G5zjki29g5jZK1btlTrXfa71KUXN6w4odA5/uQxAR2jnj+MeLJhGnmVTOpj0ywRT
	XVdg0V3plkEEzL/tkvSGZtYmna0hkZ2jOm1MuQNu3APNoXdS7uQ8FeplgYyWraTz
	ZVb47YgwSK6CO9gsoYxHw/PrVtxSSwNmCmLFcOZIvgl53DGGhxkhznz/kgOam8wP
	y8YvLzNCVS/i1dm7iEm/NNmq0vxSX472yxassmYqwKm9G4nKt0qdq2mDNTdrakLZ
	0QjvFiYheggYuLyU7IMNw==
X-ME-Sender: <xms:nBmgab1whMncYpAHj3Mczq-X-JUYUh136fFw_jPLYknBZC07IayAAQ>
    <xme:nBmgaYAXxMYApBFS8IPtgQEmP62Pi6QAnsFgpB1QiBSxqd222sOi9uBWLf7CguHCh
    EutuiXjQ3nwqmhGBBIxWFFS8Gs-bvaGmRYNxfQmzZYh7Hk-PT1aMVLn>
X-ME-Received: <xmr:nBmgaTd_YWJFG8ovLeLK4u03Qa8KBmMZ3YLNhA18KTq13HvXIosCRz8Ei-0jcI3V-_FjnzqwCivv8Ixq5YZ3pimp5Nd7-e3fX6d3yukBnmea>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeehjeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvffftggfggesghdtreertderje
    enucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggv
    vheqnecuggftrfgrthhtvghrnhepleeugeffleefveehgeevuddvgfeihfelvedvleelte
    fgudeuvdetfeffiedujedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrg
    hrkhgvrhdruggvvhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepohhpvghnvghmsggvugguvgguqdgrrhgthhhithgvtghtuhhrvgeslhhish
    htshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepohhpvghnvghmsggv
    ugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:nBmgadh_GhKUfXKro28ET3xtliyb5QBl6nx8NiuktUA7b0O2z8_j5A>
    <xmx:nBmgabox2Ypbi67IPCkfimM2VOrQ8s2rMwlHNoR5qld-ZQZJuN7JxQ>
    <xmx:nBmgadE_cRay31yEfycUHJSMjttU4Hp3DwLMjJKHDK93E6sRtSye-Q>
    <xmx:nBmgaVn6t5RFhoUa8q1y_m0AoUOhcW0FKQqiZ9J37cizKVULtG1N3A>
    <xmx:nBmgaQ2nWASZCbXBtR0dCN8b0H_5TYdSeOBfjOvhsjBCwHOJnKe9W3wf>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Feb 2026 04:59:56 -0500 (EST)
Message-ID: <ba0a57bc87f3563f43f46f663e1733fd552a7a03.camel@pbarker.dev>
Subject: Improving DISTRO_FEATURES backfill & opt-out
From: Paul Barker <paul@pbarker.dev>
To: "openembedded-architecture@lists.openembedded.org"
	 <openembedded-architecture@lists.openembedded.org>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Feb 2026 09:59:52 +0000
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Fiz0eVea0G5GbDtBp1nC"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 09:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231996


--=-Fiz0eVea0G5GbDtBp1nC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

We discussed Richard's patch to enable the opengl, ptest, multiarch,
wayland & vulkan DISTRO_FEATURES by default [1] on the patch review call
on Monday. We agreed the idea was sound, but couldn't reach agreement on
the implementation. There were two approaches:

1) Add the new features to `DISTRO_FEATURES_BACKFILL`. This enables them
   automatically for all users, even those who define
   `DISTRO_FEATURES` themselves, which may be surprising. It's possible
   to opt-out of the new features by listing them in
   `DISTRO_FEATURES_BACKFILL_CONSIDERED`.

2) Add the new features to `DISTRO_FEATURES_DEFAULT`. This enables them
   automatically for most users, but does not affect those who define
   `DISTRO_FEATURES` themselves. Opting-out of the new features is less
   straightforward, either you need to fully define `DISTRO_FEATURES`
   yourself without using `DISTRO_FEATURES_DEFAULT`, or you need to use
   `DISTRO_FEATURES:remove` which has its own issues.

I took a step back and looked at how we're handling `DISTRO_FEATURES`
overall. There was some discussion about the terminology
(`DISTRO_FEATURES_BACKFILL_CONSIDERED` was not liked) and some
suggestion that it should be easy to opt-out of any of the default
distro features. So, I'd like to propose a third possible solution:

3) Merge the current contents of `DISTRO_FEATURES_BACKFILL` into
   `DISTRO_FEATURES_DEFAULT`. This variable will be filtered to disable
   any items listed in `DISTRO_FEATURES_OPTOUT` before use, efficiently
   and without the use of `:remove`. Deprecate
   `DISTRO_FEATURES_BACKFILL` and `DISTRO_FEATURES_BACKFILL_CONSIDERED`,
   issuing warnings if either is used.

What does that look like practically? Something like this I think:

    DISTRO_FEATURES_BASELINE =3D " \
        acl alsa bluetooth debuginfod ext2 ipv4 ipv6 pcmcia usbgadget \
        usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp \
        pulseaudio gobject-introspection-data ldconfig \
    "

    DISTRO_FEATURES_DEFAULT =3D "${@filter_default_features('DISTRO_FEATURE=
S', d)}"
    DISTRO_FEATURES ?=3D "${DISTRO_FEATURES_DEFAULT}"

    DISTRO_FEATURES_OPTOUT ?=3D "${DISTRO_FEATURES_BACKFILL_CONSIDERED}"

    def filter_default_features(varname, d):
        baseline_features =3D (d.getVar(varname + "_BASELINE") or "").split=
()
        optout_features =3D (d.getVar(varname + "_OPTOUT") or "").split()

        return [feature for feature in baseline_features \
                if feature not in optout_features]

(un-tested, may also need some tweaks for performance)

Applying the filtering as part of the definition of
`DISTRO_FEATURES_DEFAULT` makes it easy to use. If you're already using
`DISTRO_FEATURES_DEFAULT:remove` or `DISTRO_FEATURES:remove`, these will
still work, though we'd encourage you to adopt the new
`DISTRO_FEATURES_OPTOUT` variable. If you're using
`DISTRO_FEATURES_BACKFILL_CONSIDERED`, this would still work but our
encouragement would be louder - we can issue a warning if this is set
saying that it is deprecated and will be removed in a future release.

There is one group adversely impacted by this change - anyone who
defines `DISTRO_FEATURES` fully themselves without including
`DISTRO_FEATURES_DEFAULT` will need to manually add the backfilled
features (pulseaudio, gobject-introspection-data & ldconfig) or adapt
how they set `DISTRO_FEATURES`. Personally I think that having to adapt
to this will not be difficult and it can be well documented as part of
the release notes and migration guide.

A patch to implement the change should be straightforward, it may need a
little effort to address any fall out before release. There are no tests
for the `DISTRO_FEATURES_BACKFILL` logic right now, tests for the
filtering and opt-out variable can be added along with this change.
Impact on the autobuilder should be minimal, I think this is something
we can take in with little risk to the core project so it is unlike the
proposal to change the default init system for poky. The impact is
mostly on users who define their own distro, and we can make migration
as easy as possible as outlined above. I should be able to get this in
before the M3 build if we want to go ahead with this change before the
LTS.

We can extend this to `MACHINE_FEATURES_DEFAULT` as well, deprecating
`MACHINE_FEATURES_BACKFILL` and `MACHINE_FEATURES_BACKFILL_CONSIDERED`.

Thoughts and opinions?

[1]: https://lore.kernel.org/openembedded-core/20260221084230.3219379-2-ric=
hard.purdie@linuxfoundation.org/

Best regards,

--=20
Paul Barker


--=-Fiz0eVea0G5GbDtBp1nC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaaAZmBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bs6gAP9tWLxaFvSbj3HHYrlgBUOE5eCO9SRjGwIV
AJrlFLkAXgD/ZYlZw8f5XdWWBCbCbRwJSOlYq7e2nGUI+bIKobblAQY=
=As1T
-----END PGP SIGNATURE-----

--=-Fiz0eVea0G5GbDtBp1nC--

