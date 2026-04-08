Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B28161073C89
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 09:54:33 +0000 (UTC)
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.102693.1775642072987280108
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 02:54:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=DwFqnW65;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=eAB/zHTw;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0DF761400190;
	Wed,  8 Apr 2026 05:54:32 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 08 Apr 2026 05:54:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1775642072; x=1775728472; bh=jtn8dpsYuD
	l0f8znk6iAdbRUO38rgB1NEDGlS+stGkY=; b=DwFqnW65yzJUmSRSyoHuPkJemv
	OKtyz/PF6YocLw22SbpJbZZJSSRDokoLURhgUjwax2TsPmjQd16YI4FPoP5fFCnb
	j7WruLdsug4QBdip9QLHyYd9uRh20tabtRUJdRSp388/5hS6IOdb2hiiNXeIJV8C
	dqPzpqgckhttea41u8HtjLOXgLes9JJ5llyqbtMU0zTZv5BkSLwViMI40JcZwQxm
	YBr4jgAtwq6g3zb+3nPFjRGRK7v2kW0q7tnOnQXnYao2EDP3ssSDOUcPoERNGFOQ
	HlG1Iih94Xg3Bqh7RiuWDGrugXZd9iXYSIa5eEZKWqqCL1JykQE1CczSbSOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775642072; x=1775728472; bh=jtn8dpsYuDl0f8znk6iAdbRUO38rgB1NEDG
	lS+stGkY=; b=eAB/zHTw342kqyQFiMp8Uv6a/uQ2uGBeUci424n2BjWzCcUqPaV
	G8VWvUNC2XksaBHAxDdoOUVXuS6eX/PviQ8OeXlxOnDtPVXk5J7B06mHJ+tAWxon
	9u3gov+0eB6Nx8yEzVZDjrNiC6V+HD+fkj6hhqnu3nzMou5a+Y2W+jInyOx0UmQr
	V4GES9M7uTaEcToKQqS7FfMP3b0Uhpn7ZB90hemniauA9akSB0a92Ip5SoXRZ0xW
	DWJUabmeYFMgvCVYpm4v6qC2LO8GpF+ghVZzYyNZnnc+gebXr4S+Rko16oq29xvB
	DrAoJ1zqE4xM/BpZXyniTkPfJqvICuFqC5w==
X-ME-Sender: <xms:1yXWaYvzKRsR347NR3uBCZn_36PXNzIkVw9raL7L2_AvI7jRJtbHqw>
    <xme:1yXWabczYyhAVEhvrnZv4cdECSY5T4tsw6sQvxQqPl4kfhJPnLl-VAk8cfAO-nVjV
    n4ozDK3wkxTAFX-GgJNv7G7spYbvakQnCjW2Xhy-58-Z6_aPwArvQ>
X-ME-Received: <xmr:1yXWaRZlsOUeUOvMDUJqoOQg1rtdSII4XW5kKUuPog9Cr2nw9e29gl76W2g690Jq63ARN95d9JZiNdtwkzaM4QqoXqhU8heDdInGoQ4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvfedviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgjfhgtfgggsehgtderredtre
    ejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghrrdgu
    vghvqeenucggtffrrghtthgvrhhnpeeiffejgeejkeegjedujeejffdvjeelhedvleette
    duuedugfevgfdtjefgjeduveenucffohhmrghinhepohhpvghnvghmsggvugguvggurdho
    rhhgpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthht
    ohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohephhhjvghnvghmrghrkhesgh
    hmrghilhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehl
    ihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:1yXWaWUXD7OjTXv2DTBQ8mRE1I9ENT40a7471TF2gFJRKxRt6W2cXg>
    <xmx:1yXWabgxVN0e3HFnjBX_4CRoZGPhg3DaBE5X11xjB_0l_0Is0YvEKg>
    <xmx:1yXWacVmvOTqPFgGqVHtYPPcft75BcWVqPvExXU6blasXTUMoCbiew>
    <xmx:1yXWaaNyvRfxs3hgmHaLweDdPI_dKV_glFOeEQpel8B30vszn9_3ow>
    <xmx:2CXWaV8ub_v-oqzoocHkBDbs67LTaqSwH3wdqV3InVBQod_HqptETsTX>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Apr 2026 05:54:31 -0400 (EDT)
Message-ID: <c654ad89e15b45c555b7388d75db910a7f05fa46.camel@pbarker.dev>
Subject: Re: [OE-core] [scarthgap] git tags not present in upstream repo
From: Paul Barker <paul@pbarker.dev>
To: hjenemark@gmail.com, Openembedded-core@lists.openembedded.org
Date: Wed, 08 Apr 2026 10:54:28 +0100
In-Reply-To: <CAFx0Op0o1LkXfe253sQHJTULuYn1=Tw-BzZqfxSOPx7UNUf_Sw@mail.gmail.com>
References: 
	<CAFx0Op0o1LkXfe253sQHJTULuYn1=Tw-BzZqfxSOPx7UNUf_Sw@mail.gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-FvWxBYVmM7QGy2jq1W1n"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 09:54:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234825


--=-FvWxBYVmM7QGy2jq1W1n
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-04-08 at 11:20 +0200, Hans-Jacob Enemark via
lists.openembedded.org wrote:
> Hi
> In the process of updating a fork of oe-core, I have noticed that series =
of
> tags are present in the fork that I'm managing and not in the upstream re=
po
> at git.openembedded.org/openembedded-core
>=20
> The latest tags I have that are pointing to the same commit are:
> yocto-5.0.11, 2024-04.11-scarthgap, 2024-04.11.
>=20
> I don't see the last two tags on the upstream repo.
>=20
> Did you make a cleanup of tags at some point during the last six months o=
r
> do I have to find other mirrors to sync my fork to?
>=20
> Thanks in advance for the answer.

Hi Hans-Jacob,

We've cleaned up obsolete duplicate tags recently to fix regression report
issues and make things less confusing for users [1].

[1]: https://lore.kernel.org/yocto/CADfgfoZ2-_Vypjx4mDypmh=3DHace4+gm5_4S-a=
N=3DZad6O_CKw9A@mail.gmail.com/

Best regards,

--=20
Paul Barker


--=-FvWxBYVmM7QGy2jq1W1n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCadYl1BEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bgMoAQDhHmZqIqMD1lqTBOeMIECDvXerkeR7sXtu
foX01QEkNAEA2WGo6K0E9HJhH2/SWOuodSl+na8j0MkOZ5iIrzojYgg=
=DGIQ
-----END PGP SIGNATURE-----

--=-FvWxBYVmM7QGy2jq1W1n--

