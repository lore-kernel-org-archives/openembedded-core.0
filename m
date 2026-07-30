Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CAA5C55162
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 11:51:16 +0000 (UTC)
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9901.1785412275156839587
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 04:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=a9kRCXUI;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=oZCvUZua;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.153, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2796E14000E0;
	Thu, 30 Jul 2026 07:51:14 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 30 Jul 2026 07:51:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785412274; x=1785498674; bh=yIJ1x3Ckqh
	SQADMeE43hpIEcY4gTMJ42YNPq35e8fH0=; b=a9kRCXUIwWI7cSwISlAhOyngf3
	FnED7EgJPklufkrZSyWY1oLUfMa/CJy/LBDd/GTOZwngTE0IogIDBOhpX/dZeZBB
	41gIo37UU1qAcbu7qwan69/Nm49haHW3mGGcxKRbfBh+fxPzRz0kdLR2nhQijF5H
	OYGd0AHZR09QRQ/+TDsaN15OCPV4pAR6UpT3e6ZUMWMJuNOii4f7Xf06eJT7fv8c
	X52teCv/tXNodTOPUUdwdzaQOdNYTEhQuHjKlOlCrlYJu3dEjTG1NLZR6GUwI3kA
	xKqjAPfV2KQEPWVVW+dd24ZQnxB2lhX93YGnNfphnVHU3niXALiZnwMwgRzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785412274; x=1785498674; bh=yIJ1x3CkqhSQADMeE43hpIEcY4gTMJ42YNP
	q35e8fH0=; b=oZCvUZuaTNM6eFX89i98HsIVwcMQUv7G6dADs6RAUC93169H5VW
	UN5V+xnBOToQOQ3H8dEJ53/wzw6+Yg2whJrw+a58uZXVqVtvpEmrZztEAqLrDveS
	L+qCbfwFvG9Qrm/rukNAQUb4H7rFlwOhFDNx7mKLrnVAYwYjd2TxylApgiIjypRd
	ZZ86EIeFipqpzcEkXUmujXPE7Sp2AcEx17nD+hwWT07VQ99tJ1E4LbOA4ksLNk6h
	wMHOxN8iuNXg89CeJgx9sVCqQV8tNKAWmnumNnGWFSOmtGTedriX6TY9JQflj4ke
	RhyWiw/zxktcSG6P31IAFhPl0I504ak8rhw==
X-ME-Sender: <xms:sTpragbwz8rA7dBmBhPa_cnUiZEvMrvEexGap0hcLEL9x54aCe21MA>
    <xme:sTprahY2Sn4rIBjzgfqO9mlPcdsGcnHS1PJZBSr5GGx5b-K2MKh-0vpB2iTyksBKl
    t-yc4eA5nNx2f_cYI5u-cTDfjWfo_XkcZCJ9pYvn7-JGw35JnbLOg>
X-ME-Received: <xmr:sTpraonBwZanFh1DeqzaP3WKSgjspcXGU7V9fP0J01CWE0PTfp6QwEwpDdqlLD2NSRbhghFHycT2Ij_wPBngYyOiqXsEmJmyEMLBit3eLRzu>
X-ME-Proxy-Cause: dmFkZTGcuTcQDwJqOQTv8nmVkc6/Zm874noLTCFexGTQqhDKnsGdDcPi/M4/0EY4QkKXHy
    Lt7rEBIPnNHrQftDd+YhSdCQzUNg/CHiiEMmqsSzYP1JSkzGoxmOW38kVE/hvKxOkUcvrt
    46ukXXGeUvqhMWZJRKjfj/83f/w1s4Q/ZZHw731KyBan3E/E58VX+ii/aGbw1h+VWeZ2qi
    7gAEAwFQr+DFyc96ACIjxcwh31Smx6rj4BEpztETyxBNEF0aLxLMtmICo09KtV298d+d+j
    MTHoz8DmeExX9JiqqFi7pQ9pFehz0bFzXlWgksw7DW4WYH07acWe+tGFlPodh9dNLAaVts
    YHC533rSh30SOgLVZRYzi1IK2S17om8Eej9i//IUEt0TzstY9FmTbHdQUO4XONgzzUPFn5
    NN1E7qGm5xO/uDa1bOB6gtpVhB1X2U59nfMJv7OkkRcpQY2THEwDwOUfJ7WZfsCxpb4PxQ
    xer8Q4eoU0GVooi6XOHDUAUQGIjR/7E1F2JC28fQ9DZcF5oFcJF79BHsLblmiFwnOdVmXi
    w47BIDPlVzM47GfudCKgaVyTrKx6hHM2wyJ4lDsXrnWfUz+6Ok9FCfiWzhPgBowMheEu/X
    gJG2QFHmFUczOw5k3bRvvJfd6gS1Ld/62XMqZZ39cCj3ME1FYV9FSbjNPqfQ
X-ME-Proxy: <xmx:sTpralzGhqSu2j9JqWF9Ye0mnkSyftd0pWtKo3bOsOkSE18RStN1rg>
    <xmx:sTprauOaL7LRX_b5laKv5_f-o5muNEVOqYDuyRCnq_1C0nex4KRSFw>
    <xmx:sTprahTQSORhrnuhAEj-6CT0eu06a3KKhx72hliVWsC1p_D84HsjPQ>
    <xmx:sTprakZD96N0URuY6bviH9MkyTsb1uD9EWMjeL32ehJ21wABL1dLEQ>
    <xmx:sjpraowxaZK_Gc4Qucu2RoETtevC-GvfBQXf0lV-X4BZzPAQPoqfLlGJ>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jul 2026 07:51:13 -0400 (EDT)
Message-ID: <e2d0d98e8347500b444140ff9775d84f06ad0fef.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH v2 1/2] package_manager/ipk: skip checksums for
 unsigned local feeds
From: Paul Barker <paul@pbarker.dev>
To: ecordonnier@snap.com, openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2026 12:51:06 +0100
In-Reply-To: <20260730091017.171702-1-ecordonnier@snap.com>
References: <20260730091017.171702-1-ecordonnier@snap.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Bpxuv70Ali4T91E1YaEj"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 11:51:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242341


--=-Bpxuv70Ali4T91E1YaEj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-07-30 at 11:10 +0200, Etienne Cordonnier via
lists.openembedded.org wrote:
> From: Etienne Cordonnier <ecordonnier@snap.com>
>=20
> Computing checksums in the opkg Packages index requires reading every
> .ipk file in full.  For a large image with 7000+ packages (including
> multi-gigabyte debug packages), this adds 150-300s to every do_rootfs run=
.
>=20
> Checksums in the Packages index are only meaningful for signed feeds
> (PACKAGE_FEED_SIGN=3D1): the GPG signature covers the Packages index
> which contains the SHA256Sum of each .ipk, forming a chain of trust
> that prevents tampered packages being swapped on a remote feed.
>=20
> For unsigned local file:// feeds the packages are installed directly
> from the build host filesystem where there is no tampering risk.  Skip
> all checksum generation in that case by passing no --checksum flags to
> opkg-make-index (the tool's default behaviour when given no flags).
> Pass --force-checksum to opkg so it does not error on the absent
> checksum fields.
>=20
> On a test image with 7000+ packages (including a 2.3 GB debug
> package): write_index time reduced from ~180s to ~22s (8x speedup)
> when opkg-make-index is configured to produce no checksums by default.
>=20
> See https://git.openembedded.org/openembedded-core/commit/?id=3De462f4748=
9f35902b6972f9837d9adfa542fc796
> ("Enable sha256 checksums in opkg indexer", 2019) for the original ration=
ale.
>=20
> AI-Generated: Claude Sonnet 4.6
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>

Hi,

The package feed may be made available over a network and/or externally
signed after it has been generated, so I don't think we should disable
writing checksums into the feed by default.

How about adding a variable to control this? It can be enabled by
default in OE-core and you can disable it in a local or distro config if
you know the signatures won't be needed in your use case.

Best regards,

--=20
Paul Barker


--=-Bpxuv70Ali4T91E1YaEj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCams6qhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bs/vAQDCPmTzCwzybmNGriionFnwDIijOmzxhGZY
uUdt/x7JswEAu80vmFYeJCUDvsy/JnM4bkipBO1F6F+Q017ADBxG7ws=
=wZbE
-----END PGP SIGNATURE-----

--=-Bpxuv70Ali4T91E1YaEj--

