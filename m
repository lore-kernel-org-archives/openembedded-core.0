Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2441FC55162
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 14:02:17 +0000 (UTC)
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12522.1785420129022747161
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 07:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=S7zJwEH/;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=FgFbFnIy;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2F8677A00AC;
	Thu, 30 Jul 2026 10:02:08 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 30 Jul 2026 10:02:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785420128; x=1785506528; bh=c+tOEi4Wzi
	OvLA8KH2tXFcGQqbnEuyTBWICPfIQnt/w=; b=S7zJwEH/iJkYg872f9QO/bMDmX
	wbpldkq9m7ULsrne5iFk8HHFdRKAjHBNOlVJwtlTWjEaK1d52h7t2JaanUL91u/u
	jlNko/8w7GOqWoQhLDgwilYRrCLOcTEqban7DxfLaqZ/5265Q1h9lMzrTlwSfS/8
	iVO6mNORos/NEZBjLFCqZIxT846GEfVa/QVr4lSukEp4Zl9CGlYq/jjSigc1bnop
	hItDUh8TCe90XINbLgkUrBJaOm+GUlUrhM3Rs+dbxdPEu+3TER1fbRgIBwLTDx1Q
	BSsh8pgdKzmLNcO4AbIZvMuoKd6iwN032AQwWUpwv4BghekrGIB90sA0MGsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785420128; x=1785506528; bh=c+tOEi4WziOvLA8KH2tXFcGQqbnEuyTBWIC
	PfIQnt/w=; b=FgFbFnIyMTYert7dlymWdfqwhDcAqWGsIliUeNXUyoq3Qhuulbn
	tC43tnfLg7zkfekUzr8rcx/4or0rJh7Hx/cXXivkmU//VoiLE+s/UQTRkw4V6KBk
	zpziQLVE1ehhOolxIgc1B8vN+aiAm09bBVCrSZe3+i7bsxzeYHjseZj8zNGUNfYH
	TrgHC3B5S5Fpoo0lfo+UuIs5/fJ83TihbUQ0RBWx2BrxMVqNwDtFBaEOticZE58U
	149XRq8BXf7s03fUlO9EZ9R2GaQRhPCn131aiuu+0lhzaB9lR6e/004D8kBpdQ35
	XI1REoGUHAL3La+WCxx+yLPOpFQAcMGOzOQ==
X-ME-Sender: <xms:X1lraobVF2P7JW9xtPmRHydW3PMbrN3W-97mwYYordsk4_IgA_3ZYg>
    <xme:X1lrapbtF38CKWIZAvb0YwCnUJcWP5y1PjQcx0pRr2uKSuDkPDIcirNS7Q4Fv13jM
    bX4p_OzHj7rHn4O0HhZGiKpMszq9P-SWlEWRKh9T-PO1a6X1-tCqQ>
X-ME-Received: <xmr:X1lragnjNesPCSyaCWPOmjlOaIA-rLBC8cOytyW3SbqNK2ROJolJtMfpxJ74ze4TlDrP1LPNUIvzAIvzpAmJc-n5E4ADepnZPcGuZLltbC2M>
X-ME-Proxy-Cause: dmFkZTEjN8c36e+ZkeJvD5VyHRfaDLqXd+SGWO1YBEdZGzKlQADQU6W+uDHhkLn7EMKUiA
    6lFJOatvDUbvXIClAF4p7ojl7pETR8BOJy5hklPTyuTZtHlN1oZCRMplsYqzgXpTxgTDox
    n7RLiWf54iMmmji8scSC0u4fc/NNyJr3abfsZ+pLk/RQu4ppB87QxPw922tudAiyYAtgzu
    7xcOC70sOaG0UUlQjUAlm+xBdhrqg8mHfAmph8iaMVrTIv2kg9TSDM3hp3CMKppaJebySn
    pKdN8E7tseJ7JRb7ooGncUYzE0PEIAOuD6tZ1YFYYLfyeGVa1AFHBsRn2I54HhMuuv/knJ
    Ny12bkqF0ZH6X/mYGSZM8lui55FhWzvdZpfUCGNhUty51Q3xKgY09jc3j9vLZ1YeJJ1sMM
    /Lw092umNUh1M+gYMDySapz0hzxzfNjn712eJVGZ5y+ONkyiQQqXEpg2xFITKME49HwlS7
    J1qIpgqGv6tSqnMbJek8wLroDcrSBQJgI4gLTOV6HjhmlGH/Hdtrn9ArR2p7IgP6eYsuZZ
    HQuddTyXK2G5I4cy/CMkhpYbgUU+37ojsWmz4lpl+H+Ld0oKcTKBKghxwVsHtYmMqla72n
    PDnOe0OwpHMw0Zz9VXJU10wY+lY7Q7T4WURdoEgccgs8agrH8LbTyaDyeRnQ
X-ME-Proxy: <xmx:X1lratwJEtIj54hFK-a5nDOnwH-AT3X4oZ5PLDFI1yHvDLzZ3CB7ow>
    <xmx:X1lramNYIG_wN8yFwhn2o72Vp7Vvcs0w6-wIHUZHOAw1bZc-xCYhSg>
    <xmx:X1lrapR_ClNeJzVVv7aSyX7rYQ-VC2UZoNG8k9WaEtt33SMFvmaJ4g>
    <xmx:X1lrasb8G5oz_YhGKPobMWXUktZcfDwJaRGAsundLTprnPkcjyPvLA>
    <xmx:YFlrajiFYNFPEdHdrpaSq3FeKJ7O0SR7AhwHOo2v02jtjcj-ThIuoGIf>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jul 2026 10:02:07 -0400 (EDT)
Message-ID: <75bfa2482b53c06b0fde989f660d21b88ecf34c7.camel@pbarker.dev>
Subject: Re: [PATCH 2/2] ncurses: stop moving terminfo files from /usr/share
 to /etc
From: Paul Barker <paul@pbarker.dev>
To: Rasmus Villemoes <ravi@prevas.dk>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2026 15:02:03 +0100
In-Reply-To: <20260723074054.2125126-2-ravi@prevas.dk>
References: <20260723074054.2125126-1-ravi@prevas.dk>
	 <20260723074054.2125126-2-ravi@prevas.dk>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ONViRC6J224K1XQSNrPH"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 14:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242363


--=-ONViRC6J224K1XQSNrPH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-07-23 at 09:40 +0200, Rasmus Villemoes wrote:
> From: Rasmus Villemoes <ravi@prevas.dk>
>=20
> Why it is done that way is lost in history; the gentoo reference
> doesn't help much, as gentoo nowadays certainly doesn't move the
> terminfo files around like that.
>=20
> This also drops the xterm -> xterm-color symlink. I don't think that
> symlink is appropriate nowadays either, as running
>=20
>   infocmp -L -d xterm xterm-color
>=20
> shows that "xterm" (aka xterm-new, aka xterm-p370) has far more
> capabilities than "xterm-color". So instead, just add plain 'xterm' to
> the TERMINFO_BASE variable.
>=20
> Moreover, as the xterm -> xterm-color symlink only existed under /etc,
> people who install the full ncurses-terminfo would have a
> /usr/share/terminfo/x/xterm which did not match /etc/terminfo/x/xterm,
> and which one an application would pick up is not obvious.
>=20
> Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>

Hi Rasmus,

The change looks good, please re-submit a v2 with the incorrect gentoo
reference dropped from the commit message.

Best regards,

--=20
Paul Barker


--=-ONViRC6J224K1XQSNrPH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCamtZWxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bnWZAP9nPyzSRQbIQCIxPbwiT/mWRB8VpBBQJgFF
5C503TquWgD9Fbe40mgXHr93vM51Sw4JN8OwJvZPGycMfkHPIn0GLwA=
=AIOU
-----END PGP SIGNATURE-----

--=-ONViRC6J224K1XQSNrPH--

