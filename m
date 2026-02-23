Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553D3E98E11
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 09:47:04 +0000 (UTC)
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32240.1771840015471673030
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 01:46:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=dj0ypr2u;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=qk2gQY2I;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A082E1400041;
	Mon, 23 Feb 2026 04:46:54 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 23 Feb 2026 04:46:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1771840014; x=1771926414; bh=zNvFKPk16D
	O3mJo0jZzUNA4PLk9zj8PI+MP+foQKG8U=; b=dj0ypr2uu/4CjSyuP2vXAw93ct
	nLolffXgcbwGT3ZE5yH+JJndLTVg3sQwt5nuKxqE0ttLLos8FKM1JHtIKBK8fx2O
	tNQq6ROhzrGp/e7nnsxSHqW3lT511+jm5OK/SCHTAxvosPnIxgWDZET0Uss2ZED7
	5Bc9BqFzxhY1QFNT9xqekSLbmCw6dre5eJoPqK0ku9UUYQBQGvpXXJMbmmzAXMU+
	bQmjDFlukn0FIB1fT744dOKZxG6dhQIoipFdzJlvAnRT+ik0pKgCTq74G1s7UQta
	xiy4T2q+XxWCo+dBmkGzylpxXyamMNBAQsQxRkooyVoJQFtQLUL72xC2+eow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771840014; x=1771926414; bh=zNvFKPk16DO3mJo0jZzUNA4PLk9zj8PI+MP
	+foQKG8U=; b=qk2gQY2IzjzeBItb75wIvmpSGrN4QwfDfyZAnKTC7BacDTc0Mxf
	QrN0p5vynj2SRNzstAUtw/D0QM5egMVNMz4F+m5/XwlDCUc83QhU4EM60YZUI7RT
	SCtvO6/+4tazxKLTRzbAcJmqkA8DmPO1W/2Sh2a2KXAtxfaRnnfvNUUo/ujnOeKs
	znvDpOc9hCA3JNGbm06hlt4QI2KxBBVsCBNwpPbMNdQABxMOL4aILVJPOk1+GI11
	XQdtE2FIzeHM3+edvY/MlYDJxPjwaymlxLS9AJFqYEAk2N+i/bRU7+lsz/3cSFU7
	q4J9uPGkw54qZLWeXltCdPjTQKlHFaCcirA==
X-ME-Sender: <xms:DiKcafqQiHAXicbOze25wfhrvZgA9Ao5XKbBz-sYYEC4w5PFmmSBgw>
    <xme:DiKcaQg9CyrPdUaooUVs4tMbdzJ837ZVd7pklpNxyXjkqBAXnFGW_4opiOEIN8xqq
    QQaB0DdYkJA5lRgUaCeVj1hI6HLMs-LTUgFbdIrAx8clz9nC9kOuQ>
X-ME-Received: <xmr:DiKcaUi_ENav_3dR2EjSZW8MDH3aeVB8XJQ6k3RwFVgSTl_JdRTsWRG27yAsJEMaQKTYBPHRAm3kPkxaPitgfqTDgyz7bKYNthEGngtYRL8a>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeeiledtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    ephfekhfeugfelfeeludellefhkeetvdffiedttdeuueekhfeiudeivdefueehuddtnecu
    ffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggv
    vhdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohephh
    gvthhprghtsegtihhstghordgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvggu
    qdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtoh
    epgigvqdhlihhnuhigqdgvgihtvghrnhgrlhestghishgtohdrtghomhdprhgtphhtthho
    pehvtghhrghvuggrsegtihhstghordgtohhmpdhrtghpthhtohephihorghnnhdrtghonh
    hgrghlsehsmhhilhgvrdhfrh
X-ME-Proxy: <xmx:DiKcaehL_XzU5bSZB9uMsjk10STTLXugOhHkXn20xRzyBFz732gVWQ>
    <xmx:DiKcacJ-ASkf30rpymmg4i6F4OgrVftnRJOvYDXkPuFqW46psfvzgA>
    <xmx:DiKcaVGeWegjXvp6VwhpMt7NOCpn0tqKCoMt47uL7NNHw_uEc1ea1Q>
    <xmx:DiKcaYR2SvlXzfpVKczxLthT1TpDHuklYIh2Q9lIu_UAZk4oP52r3Q>
    <xmx:DiKcaX47DUYG_nyqJ2OOhU0Ja7MItWTdOI-Ssf0qPjR5gOgkQi5r9gpV>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Feb 2026 04:46:53 -0500 (EST)
Message-ID: <f3fb77d862493a82c5b4c3e592cc4352f2c774c8.camel@pbarker.dev>
Subject: Re: [OE-core] [openembedded-core] [scarthgap] [PATCH v1 01/34]
 cve-check: encode affected product/vendor in CVE_STATUS
From: Paul Barker <paul@pbarker.dev>
To: hetpat@cisco.com, openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, vchavda@cisco.com, Yoann Congal
	 <yoann.congal@smile.fr>
Date: Mon, 23 Feb 2026 09:46:45 +0000
In-Reply-To: <20260220053443.3006180-1-hetpat@cisco.com>
References: <20260220053443.3006180-1-hetpat@cisco.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-72xIsAnrauD7pUJfgIBc"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 09:47:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231661


--=-72xIsAnrauD7pUJfgIBc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-02-19 at 21:34 -0800, Het Patel via lists.openembedded.org
wrote:
> From: Marta Rybczynska <rybczynska@gmail.com>
>=20
> CVE_STATUS contains assesment of a given CVE, but until now it didn't hav=
e
> include the affected vendor/product. In the case of a global system inclu=
de,
> that CVE_STATUS was visible in all recipes.
>=20
> This patch allows encoding of affected product/vendor to each CVE_STATUS
> assessment, also for groups. We can then filter them later and use only
> CVEs that correspond to the recipe.
>=20
> This is going to be used in meta/conf/distro/include/cve-extra-exclusions=
.inc
> and similar places.
>=20
> Backport Changes:
> - Discarded the changes to meta/lib/oe/spdx30_tasks.py, as the
> commit history for this file diverges from the base commit
> itself (9c9b9545049a in the scarthgap branch).
> - Additionally, the changes do not introduce any major features
> and are primarily focused on code restructuring.
>=20
> Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit abca80a716e92fc18d3085aba1a15f4bac72379c)
> Signed-off-by: Het Patel <hetpat@cisco.com>

Hi,

When sending a long list of backport patches like this, please include a
cover letter explaining the benefit you see to having these on the
stable branch and include some test results.

Have you confirmed that all the patches in your series are also on the
whinlatter branch as well as master?

Best regards,

--=20
Paul Barker


--=-72xIsAnrauD7pUJfgIBc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaZwiBREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bnKdAP4iKylUXH9hZQq2zNDBbQQZ7F7MLdywgknu
vNQjFyuQYwD/U9SXjZ8LAzq5suS8Y+3fgUmL6RuUjwV5FNHRxn19tgA=
=JYlh
-----END PGP SIGNATURE-----

--=-72xIsAnrauD7pUJfgIBc--

