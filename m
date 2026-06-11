Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DFF2CD98C7
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 08:58:21 +0000 (UTC)
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41104.1781168292940919093
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 01:58:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=WQzS/7Ul;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=KGcfbCGm;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.158, mailfrom: paul@pbarker.dev)
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 37CC97A01B0;
	Thu, 11 Jun 2026 04:58:12 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Thu, 11 Jun 2026 04:58:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1781168291; x=1781254691; bh=zKTgnCQ08W
	Y65b1oI56wmGUS0vOZZmUvru2qDoch7Cc=; b=WQzS/7UlIjQJW3s3NEyNXp0J3T
	kOL6nTsCZRG81St4HDkKkc/kVOI6vFYa7KM6IUNruPLEKBw13Ajob26Q7/hHRJ2q
	Wx9OKQ6hetQkkPiBd28y2pFEmv77TtHPEBpTA4rV+/HFfSaTaQ5KPMaFBuAr0tgp
	DJjkgWyftjbTp4lWEVr3b99UpIdwNhoOo+SCBv3bVD55RV1jPCp69kK5bXaOMV99
	yDVKI6VwR8D7ZOrEl3TIMiMH5PdG3HctSyXzqWkb9nkRiNLMztUuDyzpD7zu+asN
	zBLQCaTw/c6X+blDHDDcl6D/fnnD0U/4Lf4jG41MPh5RDYKPtEycl73LFMEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781168291; x=1781254691; bh=zKTgnCQ08WY65b1oI56wmGUS0vOZZmUvru2
	qDoch7Cc=; b=KGcfbCGmVixWgnhWIaTdKzKLgDXg7MHzqyWfPh4ODPj/e9PbMIi
	JyMImWo04FFKUC/FMoa/IlN+X1EQJMZk1NKORrRpdDKcleXQBmr2XtKCpMIr/B+6
	Y7NPuK0c5rkLv8RifAeYO7gYmkuDUHWGhOw9RYmae9mQCoWXZ6kbhtNFRMAHfUkT
	Ao7LX8y9D/WFkBm1PBfpP0EsoSWX+sHx8kwgmXZ1Mt9sIn0eKV4HvHdPmI2YUsjj
	/4AjfC5qowA3IQK1bshvNZuPBJ6Jmsvs1/LI6nGLPxf1z0tDO5oBlKvf/Zh3hS7T
	IHMCB7rCsTYZHqhtFHsyu3Os2GtAn8cjB2g==
X-ME-Sender: <xms:o3gqaqgG8L-wIXmdKafsD-UjrSRyT2nyeTyyUhmahv2p23-Ert39zQ>
    <xme:o3gqahBloQqtcfpjUAOXWASpfHLZ4j5SOqZvJT5LT64zoxCSx4St5qVhEa0eI9Oc3
    SFOnPh3CoTTM8f5_Ztu1PQwWl2gMWemrx9G7qdvILwFr77IOYXMB5k>
X-ME-Received: <xmr:o3gqavtdjcYyj-uBuf1vPNo4fR_kJ7yky19jnZ6svGHiSkR4IwZPGAHY3IjtjuGTwfWC>
X-ME-Proxy-Cause: dmFkZTGmSKrqluVg6jlMEQaS5bkzZVekcrUHdNZLp/VV4xoDvS+37Jh59fVp0ItaB1h7lz
    FK2Edmv6HHXn8x7hO8QJF6HQ6vcPkzdxZt4EYB3O7JLYIPe1LWfrxx9FWuJDtXDL1nV1gE
    JVSUJ0QO3ltQuvPAyVQ+lNE0WG8YpvS3kJK3f4cQZeoTv3lqHYryvKYUH9V72tZCcN335P
    Vr66ylymPljrUnd2bJYZaU4yCR2yoPpE7HfYxMe0IvCsWDzrX/fiRgLnmLFdYOmImelYdU
    iSEkpvHcTWW4WVBEgLZaSWnL3cGZZmiWcyknN7KEI+lB6nkdD0GyOSjaXVIAeCWujl2JU0
    t8si2gOQA4PsZ3pw+ucUByD1jj7yg/gAR8qQsKLnfw+t2NBf5ZAMU2x3pNQkNVca7ET7dt
    Pw9v2aDUIrdwl0SGsDUSr6sEoLkdobXD2UgBLpxd+TWDSRwiDdsp5JnnN8uufhz+Qkx7sQ
    2cfx1uPqLYdntNZA5X4wyEVMk5Rjru1q1TvvnwdBgBc1bSP39bJQg2fZOdBS/xFWDh098/
    r4XqB7qVQXpj4P15OToCf3xpWoJvnj3zJr30v2/1dsFWOwnpVL4wcIOx4tiixRn6k7vrpi
    55u+UYw8xGnXhrMnxwiIywYRPbGl8xohy9c2aWnyrnWUkm65cfftaooV18yw
X-ME-Proxy: <xmx:o3gqaubO3gF8g2a-uf7h_Fom6J0JB-lOWMVUt_T3YzxaEiK20nSeHg>
    <xmx:o3gqaqU5jxN_kvLDGcRinWWRdCpiRYrjn0jsF0fW8RIYpnIKZPktUA>
    <xmx:o3gqaq60edlJVd8B1FRh02L92GmqR_-sf6xRd_mqXogETjy1t2KbJg>
    <xmx:o3gqatj0IkFxqwwfupiJdPOsghfWMoS3-CFzPx2RnDZKY51vO9fVNw>
    <xmx:o3gqavGYaJnH3qT26TCI7SuQ1gg5bKvFLxKzLMIB1BX-hvtzKGOx2hjV>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Jun 2026 04:58:11 -0400 (EDT)
Message-ID: <ccf309b775b890e94e6cc0d5e8c13ffc4d4218ce.camel@pbarker.dev>
Subject: Re: [OE-core][wrynose 18/21] python3: use SKIPPED_TESTS instead of
 test skip patches
From: Paul Barker <paul@pbarker.dev>
To: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Date: Thu, 11 Jun 2026 09:58:05 +0100
In-Reply-To: <c9df7ab1678751caa8c5195fd366d3058a3cc6fa.1781132051.git.yoann.congal@smile.fr>
References: <cover.1781132051.git.yoann.congal@smile.fr>
	 <c9df7ab1678751caa8c5195fd366d3058a3cc6fa.1781132051.git.yoann.congal@smile.fr>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-HwiL3K3lHqyMWztclMbs"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 08:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238434


--=-HwiL3K3lHqyMWztclMbs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-06-11 at 00:55 +0200, Yoann Congal via
lists.openembedded.org wrote:
> From: Trevor Gamblin <tgamblin@baylibre.com>
>=20
> Drop all 13 patches carried for skipping various known ptest failures
> and replace them with usage of the SKIPPED_TESTS variable, which we have
> started doing in recent commits (e.g. 40b0815dc9). Most but not all of
> the test skips are due to load variability, distinguish between them by
> using multiple SKIPPED_TESTS:append blocks with comments taken from the
> patch files indicating their purpose. This adds 62 lines to the Python 3
> recipe, but it also means that we no longer have to maintain the patch
> files across version upgrades, where they often break due to changes in
> the test modules upstream.

Hi Yoann,

What's the reason for backporting this (and the following patch) to the
stable branch?

Best regards,

--=20
Paul Barker


--=-HwiL3K3lHqyMWztclMbs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaip4nREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bhnRAP9aebCrGGwz/2Edw+pZxIe3CqQVlOvH0zsh
3q5+vMi5YAD+IxW8i+lThNpdRnW07YH5tM+n1V6iJhB1N7h7zET4hgU=
=Kuec
-----END PGP SIGNATURE-----

--=-HwiL3K3lHqyMWztclMbs--

