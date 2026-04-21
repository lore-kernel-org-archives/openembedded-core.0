Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8558F55811
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 11:45:54 +0000 (UTC)
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24857.1776771950286948479
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 04:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=RBKfC7Jn;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=aQxt8gfZ;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.150, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 57446EC0120;
	Tue, 21 Apr 2026 07:45:49 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 21 Apr 2026 07:45:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1776771949; x=1776858349; bh=66H9zSylyi
	1ZnfUIHRvyC3fzA9jedIztPZXRHqbFc+0=; b=RBKfC7JnVBa+Le3cm0qeih4X3f
	uWvVWg9jXyRmRatUdHCDTypKkH1Z3v3MUxkDwqdwvgmHyM6P2bbDV2DVDVu7Mhw6
	bi4UVhds9AFy84MNGtEOEtZ4/K5ic7U9mGYYR4sMHSXbXn+qUiWyJ1Nk4/4em5ZM
	0WNwAMEbVZ3LPDrUYP82qjc0BR4ppVgUhPWMhsBTsLl11mT65MK+IrtB7V7rMHMU
	q1f9GgALxtNVTIqxMq6HjpCTyz6fCVVO0PpJKGm5f2vNhE79+XCThVaiiqvhSr2Q
	ISZ/gY5D82L8Whm04ThCezUk+Xv+Sj/Lm2Ai6Q8UUSyeUm8ZvWYAsIHrPpaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776771949; x=1776858349; bh=66H9zSylyi1ZnfUIHRvyC3fzA9jedIztPZX
	RHqbFc+0=; b=aQxt8gfZAjdjdloVBegSaKpHebmvfzbSZKbBc9iKvRZKp1XEjxb
	kWQiPffugDINMTA61Baj2ANh4N8WqmtrVOkoHDAgxyooBS94LtOoAEFF/IWON89X
	Bd++2KHMGRWMTcNioaQ+uuooZyDiiXgXfmocOdHCgHrXQcaImUOpdLTep+o7QrHh
	sFrWBuDbfyN5yOeO5+k1MHUSLu+eKi6he0W99vm7qcQY8UJWT1qspY/lfsea6o3E
	PR35cpowYVL0dTaoV/Om6nm0DteE/OG/alUmYOKIzywdN9XftaJBi+ZkOTkCUXw+
	VTWwEeEJZ+jjHqckfJ8hycU8n2uY1VeIDzg==
X-ME-Sender: <xms:bWPnadMHNmMQV-zCdrLp57o1wSmyBDXCxWQeGJ0W5Fl7GMWKHGdR5A>
    <xme:bWPnaXbeXqsUF04jKXDbbdy2SslmQt48h0b9T1XKsUHqQe5Maou-uFKR3gX-7gJK4
    5FwvILOxV6MNbhI_y0KyexdaYUIdA9j8fys4y7MY-YWSnixbHg8OQ8>
X-ME-Received: <xmr:bWPnaZrEiNAl_2FxEn4wmvBYf-qSHZ7u8syJ9E8gk1wTZFlhSGcfYgeLQsDvGeqv6-r0dFN6fps8yC15D0_IjhaotGxL9YQYcy318xP-JMc9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeiudeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecufghrlhcuvffnffculddquddtmdenucfjughrpefkuffhvf
    evffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceo
    phgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpeejkeegveekie
    euheekheeljeeggfdtveehffevtdetueffvdduhfehgeethedtueenucffohhmrghinhep
    ohhpvghnvghmsggvugguvggurdhorhhgpdhnihhsthdrghhovhenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdr
    uggvvhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    ephhhjrgguohhnsegtihhstghordgtohhmpdhrtghpthhtohepohhpvghnvghmsggvuggu
    vgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpth
    htohepvhgthhgrvhgurgestghishgtohdrtghomh
X-ME-Proxy: <xmx:bWPnaTaVoF3RGtKvnByA6qLFqk7lxz1h43KFYnDVJVniTo_n5jfykg>
    <xmx:bWPnaZSHl-8xYG4SpDX7UmpQrsf3FSKADcLqPV36uff7c9PvhzCXtQ>
    <xmx:bWPnaS4zVYbR-uA2ys7WXgma_2dyHJs6wHsPp6sUSOcfQm0qXfxM1g>
    <xmx:bWPnaWwofT6mVjSaYZrNheES9abfJc3bLFTE7bVYfmCFAVjka2ZAAQ>
    <xmx:bWPnafCXiXbLXR3A2llFbNwDDI3C8FjeZENCTxz6lhLGiDppAoBXvoum>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Apr 2026 07:45:48 -0400 (EDT)
Message-ID: <b6875fed11ec10d190215ff3587a9553362a55a2.camel@pbarker.dev>
Subject: Re: [OE-core] [master] [PATCH] apt: Add CVE_PRODUCT to support
 product name
From: Paul Barker <paul@pbarker.dev>
To: hjadon@cisco.com, openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Date: Tue, 21 Apr 2026 12:45:44 +0100
In-Reply-To: <20260421111028.2501890-1-hjadon@cisco.com>
References: <20260421111028.2501890-1-hjadon@cisco.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-dV8+QsNGcI/aE6ccqXx2"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 11:45:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235673


--=-dV8+QsNGcI/aE6ccqXx2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-04-21 at 04:10 -0700, Himanshu Jadon -X (hjadon - E
INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Himanshu Jadon <hjadon@cisco.com>
>=20
> - NVD contains older debian:apt CPEs, but they are deprecated and
>   explicitly replaced by debian:advanced_package_tool, so the recipe
>   should use the active normalized product identity.
> - Therefore, set CVE_PRODUCT to align with the NVD CPE and ensure
>   correct CVE reporting.
>=20
> Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
> ---
>  meta/recipes-devtools/apt/apt_3.0.3.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/apt/apt_3.0.3.bb b/meta/recipes-devtoo=
ls/apt/apt_3.0.3.bb
> index d2dfe48e9a..871564baea 100644
> --- a/meta/recipes-devtools/apt/apt_3.0.3.bb
> +++ b/meta/recipes-devtools/apt/apt_3.0.3.bb
> @@ -148,3 +148,6 @@ do_install:append() {
>  	# Avoid non-reproducible -src package
>  	sed -i -e "s,${B}/include/,,g" ${B}/apt-pkg/tagfile-keys.cc
>  }
> +
> +# Add CVE_PRODUCT to match the NVD CPE product name
> +CVE_PRODUCT =3D "debian:advanced_package_tool"

CVE-2020-3810 [1] appears to have CPE "debian:apt" but not
"debian:advanced_package_tool", so I don't think we should exclude the
older CPE here.

[1]: https://nvd.nist.gov/vuln/detail/CVE-2020-3810

What is the goal of this patch and other patches from Cisco which set
CVE_PRODUCT? In most cases there don't seem to be any false positives
that you're trying to resolve, so I'm still unsure why CVE_PRODUCT needs
to be set in so many recipes.

Best regards,

--=20
Paul Barker


--=-dV8+QsNGcI/aE6ccqXx2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaedjaREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bgybAP9EfaM/z6zNK3bjMLSP9ELtZn8TDgSV5ztb
sA7JfV+SJAEA477tuyRM0hgshMw+hfUwQRLINDwbI5K50fE51oQVXAg=
=T/Kw
-----END PGP SIGNATURE-----

--=-dV8+QsNGcI/aE6ccqXx2--

