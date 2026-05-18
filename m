Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C293CD4F4A
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 19:22:30 +0000 (UTC)
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5294.1779132142944622545
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 12:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=lKxEihDV;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=hKdlXl1L;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.152, mailfrom: paul@pbarker.dev)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 14A8E7A007A;
	Mon, 18 May 2026 15:22:22 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Mon, 18 May 2026 15:22:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1779132141; x=1779218541; bh=5t/3KDZlKd
	+nW5cyA1FZygbZZntwYlcKDgPfNrcybv0=; b=lKxEihDVO7MmnGoWz6gxqsO7W8
	RVX78zAnE9q5j9ePtvtKdCJhBWLnTnHJfKq/8viaLLiyv9eh0IAxmHgbjvJFl6HQ
	WbIhI5qsnhgUjmSl/2fpegVWFlp3PKSadQGA149D/oAelx1Kzw3SaqZuweTeJsXF
	rY44Lh9b+BRODPI8Mfv7lxZL7+DsC4u6zdWNlqi151FFRpQLr+wLCbPee173NLQT
	2LSVVYbSa8wyjWG9ni+2rWnVv21XmAY6/JFvCSLXCmaPjr/z0kw98ktyeRwHhfDy
	yR7QFh0MTj0+FA54bUuZzjTqy90XxfkhqMviuArqBmGYW19WlxSIGxhVNdbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1779132141; x=1779218541; bh=5t/3KDZlKd+nW5cyA1FZygbZZntwYlcKDgP
	fNrcybv0=; b=hKdlXl1LkBTxOPKcO3fhvLarb62ftvVtGCHYWsMVEEAFm0UNmPY
	jke0TbBKQdsD1iaa8vB3csI2D9Z33S0nx8hlm2FyP21T39uZ+S9atBTLLJfsq93o
	Gbu6EpnlW0iGg1HCoxg6Wkc0yO4ISAaFSgWdedZ+pJI8RtUfQKbEJOxVTr3VhcJo
	0VSzAXFzylphAZYO20f4Ow6SfpcCnR7x222crDQdTAr6rR2zAeFD/FHwqt7JRBXy
	eQIKdn2fkTvz8StyCvWv/oM8cUrBOy8cHlqBtlas1BWQpW7FLVWqtw7kf6PMzqPs
	RiJUTQf/fPct42gZtxjnDTX9RpMAv70/GKA==
X-ME-Sender: <xms:7WYLauIH5ou7KibUWO20bqcpnT8penemesvaxDekTqBpBod6P8zTVQ>
    <xme:7WYLatInjd-XvrxIZZbIMScbVZKqnuK5n9G_238O7DrdwMjnZZ24I2fKk_3e1bEIa
    ZN47vfp9RFkoKOoN95rJJmqmE-n_B4KbALohQQf7LT6Lac3PQe0-c8>
X-ME-Received: <xmr:7WYLajuuYkCWvlkvIpbxBN9hHKvqdCeGqL-pOahofUfzQPdPUI5vQVNYdeh3KJdreVO1cS49hgwl1bHwVpwBiTA7F7JGjSBperpmimvrAo3h>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeeljedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epfeffvdefgeevkeduhfetueehhfeikedvieeufeevieffueektdeluddtgfegveehnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlse
    hpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomhdprh
    gtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgv
    mhgsvgguuggvugdrohhrghdprhgtphhtthhopehtrhhohigplhgvvgesrghsphgvvgguth
    gvtghhrdgtohhmpdhrtghpthhtohepvhhinhgtvggptghhrghnghesrghsphgvvgguthgv
    tghhrdgtohhm
X-ME-Proxy: <xmx:7WYLaiQ_EbQ1zi_9AaPeM3PZGFOUSLwClhUnGwN4VGQld-Z5X2hBTw>
    <xmx:7WYLahNwg0S4oEGStmINFubHU1_Ug1DyPenc5Xyv-CgJJAupUAKGdw>
    <xmx:7WYLavYXwlwYHcNkXwBGe2PbVXCZtE8c5L47dyrZns4TDnBz5J0sCw>
    <xmx:7WYLajxL3tJLbO8yEXfvLVipEedHF0Y5rv8dhP5e3UVZVIoWA8hsxA>
    <xmx:7WYLanGF2aXpM49lJIsZaZMUlMgNKh0IXjx4jtJAEgUEJgWsQB3kCWzz>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 May 2026 15:22:20 -0400 (EDT)
Message-ID: <5110ac3567bdc84efcd16b904f4a9b1734ea04f3.camel@pbarker.dev>
Subject: Re: [PATCH v1 2/2] reproducible: Handle nested git repos in
 find_git_repositories
From: Paul Barker <paul@pbarker.dev>
To: Jamin Lin <jamin_lin@aspeedtech.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, Vince Chang
 <vince_chang@aspeedtech.com>
Date: Mon, 18 May 2026 20:22:17 +0100
In-Reply-To: <20260515093615.126849-3-jamin_lin@aspeedtech.com>
References: <20260515093615.126849-1-jamin_lin@aspeedtech.com>
	 <20260515093615.126849-3-jamin_lin@aspeedtech.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-c3vq3/CiOqgwrd3ivAPZ"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 19:22:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237259


--=-c3vq3/CiOqgwrd3ivAPZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-05-15 at 09:36 +0000, Jamin Lin wrote:
> When EXTERNALSRC contains multiple nested git repositories (from
> multiple SRC_URI git entries with different destsuffix values),
> find_git_repositories() walks into sub-repos and
> get_source_date_epoch_from_git() subsequently fails with exit code 128
> when running 'git log -1' inside them.
>=20
> Two fixes:
> - Stop os.walk recursion when a .git entry is found (dirs[:] =3D []) to
>   avoid descending into nested repos.
> - Change 'git log -1' from check=3DTrue to check=3DFalse with explicit
>   error handling, so a failing nested repo is skipped gracefully
>   instead of raising CalledProcessError and aborting do_unpack.
>=20
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  meta/lib/oe/reproducible.py | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
> index a80376010a..6bb25da55a 100644
> --- a/meta/lib/oe/reproducible.py
> +++ b/meta/lib/oe/reproducible.py
> @@ -82,6 +82,7 @@ def find_git_repositories(d, sourcedir):
>          for root, dirs, files in os.walk(mainpath, topdown=3DTrue):
>              if '.git' in dirs or '.git' in files:
>                  git_repositories.append(root)
> +                dirs[:] =3D []  # don't recurse into nested git repos (m=
ultiple SRC_URI destsuffix)
> =20
>      if not git_repositories:
>          bb.warn('Failed to find any git repositories in UNPACKDIR or S')
> @@ -105,7 +106,10 @@ def get_source_date_epoch_from_git(d, sourcedir):
> =20
>          bb.debug(1, "git repository: %s" % repo_path)
>          p =3D subprocess.run(['git', '-C', repo_path, 'log', '-1', '--pr=
etty=3D%ct'],
> -                           check=3DTrue, stdout=3Dsubprocess.PIPE)
> +                           check=3DFalse, stdout=3Dsubprocess.PIPE, stde=
rr=3Dsubprocess.STDOUT)
> +        if p.returncode !=3D 0:
> +            bb.debug(1, "git log failed for %s (exit %d): %s" % (repo_pa=
th, p.returncode, p.stdout.decode('utf-8')))
> +            continue
>          source_dates.append(int(p.stdout.decode('utf-8')))

This causes the repository to be silently (in most cases, since
bb.debug() output is not usually printed) dropped from the source_dates
array. Does this invalidate the returned source date epoch?

We may want a warning here instead of a debug print.

Also note that there may be other reasons for the `git log` command to
fail, and the output that identifies why it failed is likely to be in
stderr rather than stdout so we don't want to throw that way.

Best regards,

--=20
Paul Barker


--=-c3vq3/CiOqgwrd3ivAPZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCagtm6REccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bu+/AQC9GiqX/BVZIGPjEnPUH5aHlQZ+U4Cx1GI7
b3Go/dVOHgD8CUGVMyk8cDcKvEIAABefLOIijNdLJ9fzchphwEEpEwU=
=0HUY
-----END PGP SIGNATURE-----

--=-c3vq3/CiOqgwrd3ivAPZ--

