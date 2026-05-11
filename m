Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6CD3CD37AC
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 10:02:19 +0000 (UTC)
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46512.1778493737912371095
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 03:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=c0FvBVBr;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=Zkoxjnzk;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 20D127A00D3;
	Mon, 11 May 2026 06:02:17 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 11 May 2026 06:02:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1778493736; x=1778580136; bh=w2YXl4d7/d
	P5p88zeJJENTn6BQB1qhI9SOJa052GZQ0=; b=c0FvBVBrRP8tz2yTLyjn9vvmWr
	hZsa4uUL00rfE1seALlro1XuMUcGit0wIdoXUybCgqYsa/t9Lo3FLFHVhwkifmup
	S4CkzmHeIGI60QhP76U4QmhAtpUQLrk7yzQTYq1mZ3SWqnPO2Uxhto9WUx0hNhJK
	mUShVG3vVpdljOnoW1VZqK1ocyxWxNs2pn74tTh5QtAMxTulP4srgap3j64dDDXS
	Cw+d634DScnZxlZ63d22FJMdEampuO1E0LnaQSLQS6peu5p47m5+EzIdN77Yedoc
	V+iF2iI2TQmB89CcteOtrRZyYGcp0p5yW1i5oFE8LNlUpOU4dJCDQs8O2UIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778493736; x=1778580136; bh=w2YXl4d7/dP5p88zeJJENTn6BQB1qhI9SOJ
	a052GZQ0=; b=ZkoxjnzkS5ne8CFeEr06oUrp3e9nO/sqWVskaYNK01cCtb08q4f
	fb+rj6POX3igbJBX24ulW0YWDNWspuBlUZu8BrJlf0JvkWp1Ls/UFtBoP2Y8nGyP
	vi/DXpPU2rjHce3KlUbWUItDV1HZDXsEv+xfD5SU+LTsW8HEosdrngXALgJVS/Ea
	+o3VKGBagGH2wdv3Q7zlhwjLNKwnmUbUBtZtA6NjqzYokNwhkz0NzuVuHERjarlD
	28lEiW0r8SN/+Mm5hPkU+F1zy33OQVhkyvT/IEVHj4h19feTGcLGStETRqthWhr7
	tqIbGOuOPFyGb+H6Wyjyscm7G9WTbzenimQ==
X-ME-Sender: <xms:KKkBaisbLzq3Mi_6fGvU8t7FVe3WWF1Zc1kHrYsA-A-iy1bkFHWGKA>
    <xme:KKkBatfSrkbExWLLrov6dVmeVHw5TsXln3UOFziwMZIi_rKc1-SMu5adAD9OWaQgD
    Maf7dtfca2wJW5lpRbr1Vw4A83QzmiJE3E285YSyoML4wwsrvn9fXc>
X-ME-Received: <xmr:KKkBarblWS6nrZmc_4EG1esVMzOcc2i5ycAhY0gqV2lw27M8Dxqk2uJp3ezpuMSxz0kez5VsCBsiUCahS6sWXQ1LUqf0bh4MW1wFNxU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudekieehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    fhieeufffgtddvleefuddvgfeuheejueevtedvkeeuheetjeefleevkeefffeggeenucff
    ohhmrghinhepvghnughsfihithhhrdhphienucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghr
    tghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrmhdrjhhohh
    hnrdhkvghnthesghhmrghilhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggv
    ugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:KKkBaoWbSkCoMVQbYxjO9gx2CHqbknOsKraffL53xhjSUi38wkvJRw>
    <xmx:KKkBalgz4AXGaAGonaXgp54TrQAYOmTwLScnfxlLuh0ObH3AMkzA-A>
    <xmx:KKkBauXXTjEx0_elnPdAf3cMFsT7MuuIZpJURFyfRkPRC8cxoSXiLA>
    <xmx:KKkBakNdOk0OShM9qZpN5CC9UrMtdT4m_hHw-St7bEcD6oMwpdSz6g>
    <xmx:KKkBav9JSqrE8WNblyKn3o-4_1ZXS_dglR10t8lYiBWB4UT60JvazIlJ>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 May 2026 06:02:16 -0400 (EDT)
Message-ID: <0ad1aa2e945023107fcfa0d5bb1f251394c00a4a.camel@pbarker.dev>
Subject: Re: [PATCH 1/2] image_types_wic: make do_rootfs_wicenv hash-safe
From: Paul Barker <paul@pbarker.dev>
To: Sam Kent <sam.john.kent@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 11 May 2026 11:02:12 +0100
In-Reply-To: <20260430083905.2967342-1-sam.john.kent@gmail.com>
References: <20260430083905.2967342-1-sam.john.kent@gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ycHK2Fjfe4En8TdEMA2u"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 10:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236796


--=-ycHK2Fjfe4En8TdEMA2u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-04-30 at 09:39 +0100, Sam Kent wrote:
> BBLAYERS and BBPATH contain host-specific paths which contaminate the
> hash and result in unnecessary cache misses.
>=20
> Exclude BBLAYERS and BBPATH from vardeps and instead enumerate the wic
> plugin .py files tracking them via file-checksums.
>=20
> The hash now only changes when a plugin file is actually added, removed,
> or modified.
>=20
> Fixes [YOCTO #15662]
>=20
> Signed-off-by: Sam Kent <sam.john.kent@gmail.com>
> ---
>  meta/classes-recipe/image_types_wic.bbclass | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-r=
ecipe/image_types_wic.bbclass
> index ea8c1c9..e6f77e9 100644
> --- a/meta/classes-recipe/image_types_wic.bbclass
> +++ b/meta/classes-recipe/image_types_wic.bbclass
> @@ -68,6 +68,22 @@ def wks_checksums(files, search_path):
>              ret =3D ret + " " + found + ":True"
>      return ret
> =20
> +def wic_plugin_checksums(bblayers, bbpath):
> +    entries =3D []
> +    seen =3D set()
> +    paths =3D (bblayers or "").split() + [p for p in (bbpath or "").spli=
t(":") if p]
> +    for path in paths:
> +        if path in seen:
> +            continue
> +        seen.add(path)
> +        plugin_dir =3D os.path.join(path, "lib", "wic", "plugins")
> +        if os.path.isdir(plugin_dir):
> +            for root, dirs, files in os.walk(plugin_dir):
> +                dirs.sort()
> +                for f in sorted(files):
> +                    if f.endswith(".py"):
> +                        entries.append(os.path.join(root, f) + ":True")
> +    return " ".join(entries)

Re-implementing the wic plugin search logic here is likely to lead to
inconsistencies. For example, wic currently searches for plugins based
on BBLAYERS but not BBPATH, and it looks in both scripts/lib/wic/plugins
and lib/wic/plugins. Even if we align the two implementations now, it
will be very easy for them to drift apart again in the future.

Could we instead rely on wic to perform the plugin search? There is
currently a `wic list source-plugins` command, we could add a `wic list
imager-plugins` command or perhaps a `wic list plugins` command to list
all plugins. We could then call that here to get the list.

We should also move this to an event handler so that we don't
unnecessarily re-run this search whenever the bitbake data store is
updated. See image-postinst-intercepts.bbclass for an example of how to
do this.

Best regards,

--=20
Paul Barker


--=-ycHK2Fjfe4En8TdEMA2u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCagGpJBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bsxfAQCqnirs87hRg4B9dZirjHmsPdHcZ8PinROC
g8H0sVAXZgEA175xenQht20m3OrW6eSQ/XWp3WslyqCPtjh5+l8ekwk=
=vDyw
-----END PGP SIGNATURE-----

--=-ycHK2Fjfe4En8TdEMA2u--

