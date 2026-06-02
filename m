Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A053FCD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 12:23:16 +0000 (UTC)
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23992.1780402995126206280
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 05:23:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=0hWOOAUW;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=BxIve8GV;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 44766EC06C9;
	Tue,  2 Jun 2026 08:23:14 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 02 Jun 2026 08:23:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1780402994; x=1780489394; bh=EYr4AS2CPK
	m7Oj7REK5v+hC/WAPf6wib8OUYGiKGDec=; b=0hWOOAUWbz0Ihjm0xPJW83TrVe
	hxVWv0tOVc4PGe3JI8aS50RONJH3ykKARWryRNjf4kWZZqV5+0YCqqTAJDq2VQ7y
	tqeBn3RzxHqV5NFXQTQFFCr7nlrJNKBkTqiKvIXF2USqHkLZZTwinJdclSU0sZSe
	z5QrVU92I8HLzInUDfFk28xKDg3XKpAXIqQLzyfUleEqNTWV3ZaeSfQVbwueY2rQ
	fbxz6QKduGJ9hGFD2QH4Yx+TUfqb9OIV9xKz/XgxyYq2jiglesxMLDZZPyhjL2SC
	JG0oa3MeoFie56vtRYFUsXPgsdTosydYmHkaMZhK2NatgF3q9olbddt7u9qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780402994; x=1780489394; bh=EYr4AS2CPKm7Oj7REK5v+hC/WAPf6wib8OU
	YGiKGDec=; b=BxIve8GVrUb+QbYsmEs9d8dflXNU/1+TQXFVtGnbsPy2aOxpxJp
	7MdUWJJ6ibC6Q6rEx91dg6sM/n2NJMWAgAv1TXc0YX35juCkwv8S6Gl2FbTmR4wl
	evcT4PLUut5aVmA73pB4E+fUkxXW3mbGf/60YH2npr6ZQVqmfjPrN46Eq/0eYGxq
	9ZWr99Ec5D1r0J453dTuy0OzP7OGXoOUFLmoLsd04bsGwECcJAWd/bqM9GYWTlv6
	pke4g1Kpk/5GY/yYyXdHwaUTQ5VTutSTCaDRGEBoJdtIKPkYfdpLylHRev65DD05
	tXMUD8ZImqbXvahL8jYmD5a56e3yzrExUHQ==
X-ME-Sender: <xms:Msseala4wjPtyUpYDpKa58t5ye52tI6RAF0SktY0WLKbDNiduhoKrg>
    <xme:MsseagECP3ZwdFpOw3YyHB2dnTrSdz8bNxcPGUNVxdcwomq7shdMNAYqIKpFD9PWk
    RcSF-vbvHWtrDDw7K1hHW1a3sZIe8Z7ShyeZFVz8efMEXMAQrgSstU>
X-ME-Received: <xmr:MsseahwbUPRhzqFxEbON_8w793c_ak5qKAIq3Pplx72KY7IW3-NX4mpvpmfNq4O84t8NNDe8sJ55DXO1Bt74tMRKKbbJDn7lsY1of53vCQZFUvY6jUMpEXq2Jy_xeBgF>
X-ME-Proxy-Cause: dmFkZTGHbXVdfZYdZQpQuRHe+v+rC8CjmP9ngD2mUuI6mVZlSmeuStMjR8h9Sd5scUQDbS
    SfPfkHX2/dr4ZSzNC8IFfvUO7DM2jnKDh4uAur271xCH3kRwme6ki/yegXBjmPhLPGZkaT
    4/DT6mweQn1AvRRRKREzVJS6Z4HkLQzdXg1H6XvWmUsa3w/P4IMeSwDygUM/63Bn9PooGL
    kPERV84WM21H29fbmCXpJUfxAQRhAt4DTg6ulNeJG0uBldGDy+8vXsFyscAML+sTMCxJqu
    moCcOFSAtjmje+L6SazD3FgyCnkcgskNkuAnjUS1fbfgJ0ubOufkBfHn/BvykcJs1ziCR9
    FWfFrN9JD34xZr0fG2BY1F3glYCdJqgJf9hfF6pY9s/yg+Efc8MVoNCe5+enrlE7BvuL+K
    WIx+cSQw0z2p0Zx1SpmIHlvwYt3s1OC57jcrXs6EW8omu/d9PBzKNHHbPHEtFQd7ludyWc
    NSOyU4xWDQFVXjxZqsV4mHaPXyTXFQ+5pidlTSXpGCf6WzWQstoOoLca0JQCrhEQUhAn/T
    3kkrt2lVqiduuOqm7FqZ0a9Z5AOiNPqgrgsr7j2me4YqFpo3I08bc9QSJU2S3S7v4lmEk5
    VcVIh+eq0GYpgsOq4db2GKSY8XZIydqTwMu1sXDtytNWmaDWnLw3+UW6kc3g
X-ME-Proxy: <xmx:MsseaqkiNCiieCss64_lU8VVabXU88htcTiaC7tCv2T_Hb34AebtJQ>
    <xmx:MsseailnmN0iNk7EajSMbGsyadbQD-unkBS9j6kUpHtSlb1vwsOgvA>
    <xmx:Msseakzhjn340vxsVNjoFo2kzPyrtwYfS0IFsoN77pkXsgrPhUc0Zw>
    <xmx:MsseavqrWHyPWdPVWhC_vv3YAf7jf0tyjxkz34MVJX-ct_IatRBWCg>
    <xmx:MsseajoBNxQ07oWeZGolnsvyfhmZYAAcCOIgVLzF9Y2B7LctDeKuYbhx>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Jun 2026 08:23:13 -0400 (EDT)
Message-ID: <071bb7871e571b6d4f4f78fe883b1c2a8109913b.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v5 1/4] oe/qa.py: add check_uri_srcrev()
 helper for SCM URI SRCREV validation
From: Paul Barker <paul@pbarker.dev>
To: saisneha196@gmail.com, openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr, corentin.guillevic@smile.fr, martin@geanix.com, 
	mathieu.dubois-briand@bootlin.com
Date: Tue, 02 Jun 2026 13:23:10 +0100
In-Reply-To: <20260602062940.3107241-2-saisneha196@gmail.com>
References: <20260602062940.3107241-1-saisneha196@gmail.com>
	 <20260602062940.3107241-2-saisneha196@gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-L97JEI2ykMVb9fxWEY1S"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 12:23:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238045


--=-L97JEI2ykMVb9fxWEY1S
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-06-02 at 11:59 +0530, Sai Sneha via lists.openembedded.org
wrote:
> Add a shared helper function check_uri_srcrev() that checks whether
> a single SCM URI has a valid SRCREV set in the datastore.
>=20
> The function uses unexpanded getVar() calls (False flag) to safely
> inspect SRCREV without triggering AUTOREV expansion or live network
> fetches. It mirrors BitBake's internal SRCREV resolution fallback
> chain exactly:
>   SRCREV_<name>:pn-<recipe>, SRCREV_<name>, SRCREV:pn-<recipe>, SRCREV
>=20
> Returns:
>   - The revision string if a valid SRCREV is found
>   - '' for non-SCM URIs or URIs with inline rev=3D or tag=3D parameter (s=
kip)
>   - None if SRCREV is missing or INVALID
>=20
> This shared helper is used by base.bbclass, insane.bbclass and
> yocto-check-layer.bbclass to avoid duplicating the same logic.
>=20
> Reported-by: Yoann Congal <yoann.congal@smile.fr>
> Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16051
> AI-Generated: Developed with assistance from Anthropic Claude
> Signed-off-by: Sai Sneha <saisneha196@gmail.com>
> ---
>=20
> Changes in v5:
> - Add tag=3D to skip condition alongside rev=3D to fix selftest breakage
>   (test_git_unpack_nonetwork) reported by Mathieu Dubois-Briand
> - Update docstring to mention tag=3D parameter
>=20
> Changes in v4:
> - New patch: factored common SRCREV checking logic into shared helper
> - Eliminates code duplication across base.bbclass, insane.bbclass
>   and yocto-check-layer.bbclass
> - Uses for-else pattern, f-strings, simplified name lookup
> - Adds docstring explaining return values
>=20
> Changes in v3:
> - Added AI-Generated disclosure and Reported-by tag
>=20
> Changes in v2:
> - Initial public submission
>  meta/lib/oe/qa.py | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
> index cd36cb5070..0987aaf2c4 100644
> --- a/meta/lib/oe/qa.py
> +++ b/meta/lib/oe/qa.py
> @@ -240,6 +240,36 @@ def check_upstream_status(fullpath):
>              else:
>                  return "Missing Upstream-Status in patch\n%s\nPlease add=
 according to %s ." % (fullpath, guidelines)
> =20
> +def check_uri_srcrev(pn, uri, d):
> +    """
> +    Check that a single SCM URI has a valid SRCREV set.
> +
> +    Returns the resolved revision string if valid (including '${AUTOREV}=
').
> +    Returns '' for non-SCM URIs or URIs with inline rev=3D parameter (sk=
ip).
> +    Returns None if SRCREV is missing or INVALID.
> +    """
> +    import bb.fetch2
> +    try:
> +        (scheme, _, _, _, _, params) =3D bb.fetch2.decodeurl(uri)
> +    except Exception:
> +        return ''
> +    if scheme not in ('git', 'gitsm', 'hg', 'svn'):
> +        return ''

Each fetcher class has a supports_srcrev() method we can call instead of
trying to hard-code a list here.

> +    if params.get('rev', '') or params.get('tag', ''):
> +        return ''
> +    name =3D params.get('name', 'default')
> +    candidates =3D [
> +        f'SRCREV_{name}:pn-{pn}',
> +        f'SRCREV_{name}',
> +        f'SRCREV:pn-{pn}',
> +        'SRCREV',
> +    ]
> +    for candidate in candidates:
> +        rev =3D d.getVar(candidate, False)
> +        if rev and rev !=3D 'INVALID':
> +            return rev
> +    return None

If there is no 'name' param, this code will look for SRCREV_default
before SRCREV, which is not correct. Off the top of my head, I think
this should be looking at `SRCREV_${name}` if name is set, else
`SRCREV`. You should check how the existing fetcher code determines the
SRCREV value to use.

Please also drop overrides handling as I mentioned in the other email I
just sent.

--=20
Paul Barker


--=-L97JEI2ykMVb9fxWEY1S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCah7LLhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bprgAPoDjzL/bHUtNevbbrFMWrD98BWdWt1M6cNi
zT+8Cc6D6AEAvfUWjihPiweDuPzWq5lX24cVDVf1xRZpDBFvRM1hUQE=
=xGoA
-----END PGP SIGNATURE-----

--=-L97JEI2ykMVb9fxWEY1S--

