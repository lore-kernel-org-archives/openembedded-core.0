Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD7E3C61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 09:14:31 +0000 (UTC)
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8591.1787735664551221963
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 02:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=EeRid/i4;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=cENl93/p;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id A43031D00123;
	Wed, 26 Aug 2026 05:14:23 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 26 Aug 2026 05:14:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787735663;
	 x=1787822063; bh=AE+73M+GztHX67iOgVFlbHtcSYeuStbFSeMKV78tFKE=; b=
	EeRid/i49AyDKIigv5aiH9cTIopMeio9SGVXgrgpcFB9iTW9Cu9kKet/xIrm4zZ2
	UAxP9FXBQffB65DcE//KpaBOZFrIi07g6PPQUaSZPUsLFdrUSBMZ5ZsVoFrJ+smM
	6aLV0S002AqSJzNpK4pgDtB2KrBiHXPfnHN6p+gqKoBOTvrulNIQyGI2lRxMH7Kz
	/ezyRcPKb81CUS4jLpdPAyXd61u576m81Fw1+SP7w9YNRJ6eHN3YGg99vS66k432
	pwiEe/wUYH3D79JS3IydBUvyPeR+IDonIVQnkmI7k0XJqja8oUpYS9Rh+P7TJ5W4
	hiqB2/RhC+m3fwdLSTsj+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787735663; x=
	1787822063; bh=AE+73M+GztHX67iOgVFlbHtcSYeuStbFSeMKV78tFKE=; b=c
	ENl93/psGKJWmCxwMMuRxT88ryfCsZZqaOgjKeG+xSSbn6c72XXPNkcLHMgeFrkq
	aUrKV4Ae9xzSINA/lmS81k94AijWGVQxnpoytljDuP1gFe1qPrzA5O22kunlL1K0
	4YsY6gh0IuprpRthPbp2rKRLKyDLv8wN32/W0R6ThXbQeaxpya+F98MO7QsPlErj
	MEuFtzX8ggtMIw1HxH/kZnV7KF0sCFH6ya1F2REaRzCjffdV07R+o+ISAuyz6U3P
	YEqhknLqAG02mxDHq9iyjadytvLtsrIT+WN2+8XqcOzwxjJcZ4oawS/2uhd9bke9
	uUeY7hKM0as788vH9djTA==
X-ME-Sender: <xms:b66OatjQooq40hsGkCVTWDNm84Krbn6_wawo-YwphxWWMAvRnJGWeg>
    <xme:b66Oapfz5tfcBkKQVeYB-foZXW04q2EL4yVsnYG3JD3mF5YfZuhU_S7KgYlP9P1hp
    zDJiK0xrFl-5RZf-m6FrD-P6dGpm5YGqsCm99SPvriHr_9zhfJNKsdV>
X-ME-Received: <xmr:b66Oaqdp4SEWSRvTFOAYeSNCQgG_yXJ2DL8obaaPSFvaTwqS-lWtYWWs6txa49vX6YOXPiNBqTl9wVgv8U2-l9a5EXc3J5KpGAMLXLAx-SIP>
X-ME-Proxy-Cause: dmFkZTFv7bnBqCPJ1D5cTu3TWbPEVH3ZPmm092kUG3iB+/9/YxoygIl339dWGjqDmhsbvC
    YhmC0bnATACgLSkmMBxUf0zsYLhCfFrgX8eQ8+hroMpVZ9yA6qk/34WJQemrcPbIIP+KE/
    rdPnduPdH7VD5VVpkYa4JwCt1EVk4rnKQKE4zKlAQ/6WVMS40CCBhDmT7Jz8mBOTEwF/qy
    /STKWYl2qrtEOcBbEgWLBfGuNYBOrJHQrClfsR2/GLL7As88UdID8TDwlAoSq1lVLdbzqk
    MK3FoakMlH0HtymkRd6XNjtuJzMUaXryHQSqhUWrbb9KJSjmu+0AiZlm7w9oXfiYK7DGte
    amW7Mbspz2ufZ5XKxijD1OOt5LX1D6ik/UTOdBamYDb+5p5Tx86quXET2QB7D6SJn3Deag
    DuOC3v1XHd5ZadnuI3P8GoW/3mID7IPi5ncerYZvUlkTqbHHUMN24VXa4o1nBJg1OJ1z//
    eeYkhNODypVWWlpIDHOusFBfjjq/IkeEgzDz4XLy/8z0ZDZQHoUQUFfD87l8hHrV/GVe9g
    pz48LqjpR9Aq1zPal6y3F6XQv+egwd3LP1unB+rbtcxr5mR+D2td2pxe7efN4MixoT+pUG
    aCSmWhOu2aQeTsawiQcTB84eCSr23UIqi0OdCNu9jXuZf7TwAMYOXlTbQCYA
X-ME-Proxy: <xmx:b66Oar-JpBLNnuZ9MiYKWN32kmwcCMT57MgiOJJD0B_y4rju725ORQ>
    <xmx:b66Oaum7RcwLiYQ9Q6056W1pWm6bCCisHdRpRo0uc293Iry8c9NGoQ>
    <xmx:b66Oal_Z4fMqDZm8LMlfghy-7xd9KFDyXIyShUMLtalIIzMTyju6Iw>
    <xmx:b66Oaknx2_OhGjBq9-PMQrrwMUaoxwt_AOyJCjPSg6NN_JGlga5UQw>
    <xmx:b66Oahm9unYdN5kVoNjqzqzAhOllXBDqdeql7Q3ZmccALSGevvONcq4H>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Aug 2026 05:14:22 -0400 (EDT)
Message-ID: <00e0e186e5a205596c1adf3b2fb31d299c1e1d2e.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH] avahi: correct CVE_PRODUCT mapping
From: Paul Barker <paul@pbarker.dev>
To: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	 <devanshp@cisco.com>, openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Date: Wed, 26 Aug 2026 10:14:21 +0100
In-Reply-To: <20260824110156.25632-1-devanshp@cisco.com>
References: <20260824110156.25632-1-devanshp@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 09:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244389

On Mon, 2026-08-24 at 04:01 -0700, Devansh Patel -X (devanshp - E
INFOCHIPS PRIVATE LIMITED at Cisco) wrote:
> From: Devansh Patel <devanshp@cisco.com>
>=20
> The current "avahi" mapping generates a vendor-wildcard product identity
> for the packaged Avahi source.
>=20
> Use "avahi:avahi", which matches the active NVD dictionary CPE, NVD
> configuration criteria, and CNA affected data for the upstream project.
>=20
> This changes the generated identity from
> cpe:2.3:*:*:avahi:0.9~rc5:*:*:*:*:*:*:* to
> cpe:2.3:*:avahi:avahi:0.9~rc5:*:*:*:*:*:*:*, but sbom-cve-check 1.3.3
> with the frozen 2026-08-10 databases has no current CVE report delta.
>=20
> Signed-off-by: Devansh Patel <devanshp@cisco.com>
> ---
>  meta/recipes-connectivity/avahi/avahi_0.9.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-connectivity/avahi/avahi_0.9.bb b/meta/recipes-=
connectivity/avahi/avahi_0.9.bb
> index 7cf0eb2b71..9397baa6ab 100644
> --- a/meta/recipes-connectivity/avahi/avahi_0.9.bb
> +++ b/meta/recipes-connectivity/avahi/avahi_0.9.bb
> @@ -29,6 +29,8 @@ SRC_URI =3D "git://github.com/avahi/avahi;protocol=3Dht=
tps;branch=3Dmaster;tag=3Dv0.9-rc
>  PV =3D "0.9~rc5"
>  SRCREV =3D "71b640e686964efb27cb708f4457ffaed183c319"
> =20
> +CVE_PRODUCT =3D "avahi:avahi"

Hi,

I have the same feedback as I sent for the binutils patch [1].

What is the motivation for this CVE_PRODUCT assignment?

[1]: https://lore.kernel.org/openembedded-core/82653ab103f8116bfb0a9a675cf9=
d7f38a92a588.camel@pbarker.dev/

Best regards,

--=20
Paul Barker


