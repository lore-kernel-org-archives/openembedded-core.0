Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF923CD6E44
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 15:09:09 +0000 (UTC)
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13123.1779980942088542527
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 08:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=r4Le2qij;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=GFa/S0Q7;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id 9C4A41D000D7;
	Thu, 28 May 2026 11:09:00 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Thu, 28 May 2026 11:09:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1779980940; x=1780067340; bh=wkBF913Cth
	+uY34gsIzAWZ5eRmigmOEPZ+iulORX0XQ=; b=r4Le2qijlW4lN5HQSJ/mlEqzL+
	eT1KV5nPyuQqLIgM8tV/bBFtnFlGeN8Uz9dCLOQkA1OkSKSbOYZwslrGP72wZNhf
	Ky7HxMkK9dq9N+phMQd4t6WrMTifP+YBtDyBk7lf6Qb5KMn1J6VuTf2MKWc43Z9G
	rcFiMQdcKpv0aVcj/9DjT1sf2vv24fygHx6WzCmyFAID9UgZOiua65OUx9+x6lfg
	mwYkbcs6KhRFI7Ld0axVwk0N8MgzFWTcC3R4kz0XYxlwiFT68ZUM9h1SVlIwdaPU
	DgLcXloez8EmQPPHu4Ji7ryqRn6thUaKsR52IRmx4j0OPgZnIuHOVqAm34+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1779980940; x=1780067340; bh=wkBF913Cth+uY34gsIzAWZ5eRmigmOEPZ+i
	ulORX0XQ=; b=GFa/S0Q7MmwXDgqhm0oFug9qCng/ANcnvAhkytQ44gT1Bnp9kIg
	BEFnBBe9LzPZ37mDn3IvEr4A25o2Vs1ae1zLwncPyJkQbnQEHY3nvogtq41imYn9
	HZpLnDY4c+Cm7oGL06pcuW7ljGm3mSj6NTjvnZmfmO63Y5ul92NJnXOYmyrkvrO2
	UsBli9naI7spqd9k5Bh5nZGQcwIKkNuHwMCeVgIDrQ/6HUOjEHgyfmi0tkvJICRO
	n32O3CLv0KZphMh+EBy2JKx66+ysxLE07v2aIOGw7/SRACTZ3lJkvjgKTl/wA9AQ
	9ftpOw7BMUbokufyzJ0heTcSQWnP5qHhczA==
X-ME-Sender: <xms:i1oYanP6OE2aSi1V0YmLdDfOah0Ewk7m0vU26DvFQ2LkXsuv6gU51A>
    <xme:i1oYao3bdslrQ7aaFuS2IaKjZBcX0H2Aroee-ombWLGf7raHEe9N04X1UWLLsqI6q
    T8x49kf5qqA5cM7YNCg-Bv9-vO3RDmR5DSg7yEroReh80dyqtEizy7y>
X-ME-Received: <xmr:i1oYaum76t9ruQJOK8VqeImK0uzruiDxo8A9txEiNcZN8_7X6fefsoRxOOeH3qAi2wkzcUYFaFMaR_dwTncK958mJ7sc_tWePw5eIsNNraZODdrbewrvsGYn6prvj5x->
X-ME-Proxy-Cause: dmFkZTEJNBOSFJNsdMuCIKIe4Q+Rn/1J+jhjsgEQa5Xg1+D7LU7pLilZOmLCXoMVyryEeA
    wO+5ggmvmX3XYanUIXLlsslVWrmggXaNA2AnA6FIcMW3S2cKw0yhFGakuumw0benQm86Dg
    lxLzSboJ9YAFXx4DqkhCLRtSMdZNJO7AmNlN/69F3n88VtJfI9+EjHy7pFB2zgW8IXXJ2O
    JLYeedi9QmJfPiilgEUeaRttxrdiyjCdK5KDW5Qxh8wJa6IoU21c66IY8OW1f+OfLkxjlS
    ADztgCePsjuIVHQaDu8qYGBptJGO8MUDEFqB0gRSpT4gHu5SiRc0JdU2sw2d6Ea3gX5OlQ
    OJjO2JDV9VT7YU6OO9YdiQOR9M9qY6wBC2j2EqtWQQsz1T1D28KiPX0P5OP/Kq5iMVy0z6
    3vpVIDX8GdhFy6GyGiPDTQhD6Aru1nkIRsL1OZF3wNwBFuQ3QgkSOXZp4k2S4S6T2QgFHV
    mCZ2ZZyCKFJ4oIqgciImOyd5nVqOPxSqOby1Ag+V6g68lhEkrbWacGO2K6kA3TB5fjMZwx
    SEJ+VBebnK1fIXfRbsFhkwLbd61f5ihsnrUJyxaskjFnHSv9K+9a5Dh/BQs3PGNhT3NEjZ
    FrP600Grg2d3etZupZNZrmQCT3r9F9PduRYzJQDsA8JFo49tia4cfHwqDrIg
X-ME-Proxy: <xmx:i1oYanWCMgqILvMY1knpOHmW2gFqv-NqKkc6XPMr9Ja2WiR5i-Pj5Q>
    <xmx:i1oYastmqKdmAHa7oxoK8evYKDNJ4Gkx1F8xLSAqr4z36QUv0E83Cw>
    <xmx:i1oYaiaALoAGIATbfQJeR_aFSBewVe3fFw9tFP2lCBEMYBX6CcX86g>
    <xmx:i1oYajX8L8hh6TOaJZ21N5Mf0bh4JBbmQKkLv8i1wdgcqVpPKIQO8A>
    <xmx:jFoYaqiAaXr_2pYIqjh1iMFFQFASWUKaVJbrHm_5bwTTXs-RkTbD0Vy4>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 May 2026 11:08:56 -0400 (EDT)
Message-ID: <d1023d5b6fa9f1ba8173d685c633c04a7b1a169e.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v4 2/4] base.bbclass: warn when SRCREV is
 missing for SCM URIs at parse time
From: Paul Barker <paul@pbarker.dev>
To: saisneha196@gmail.com, openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr, corentin.guillevic@smile.fr, martin@geanix.com
Date: Thu, 28 May 2026 16:08:34 +0100
In-Reply-To: <20260527111756.1306022-3-saisneha196@gmail.com>
References: <20260527111756.1306022-1-saisneha196@gmail.com>
	 <20260527111756.1306022-3-saisneha196@gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ly2jZLJfFUJlEi1bvG1Y"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 15:09:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237713


--=-ly2jZLJfFUJlEi1bvG1Y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-05-27 at 16:47 +0530, Sai Sneha via lists.openembedded.org
wrote:
> A recipe with a git:// (or other SCM) URI in SRC_URI must have a
> corresponding SRCREV set. Without it, BitBake performs a live query
> on the remote repository at every parse, breaking reproducibility
> and causing parse failures under BB_NO_NETWORK=3D1.
>=20
> The trivial fix of checking SRCREV in insane.bbclass do_recipe_qa
> fails because fetcher_hashes_dummyfunc[vardepvalue] expands SRCREV
> at parse time before QA checks run, causing a FetchError that halts
> parsing entirely. This was identified in Corentin Guillevic's RFC
> series and confirmed by Mathieu Dubois-Briand's autobuilder testing.
>=20
> The fix intercepts at the vardepvalue expansion point by introducing
> check_srcrev_set() which uses the shared oe.qa.check_uri_srcrev()
> helper. The function is called conditionally:
>=20
>   fetcher_hashes_dummyfunc[vardepvalue] =3D
>     "${@bb.fetch.get_hashvalue(d) if check_srcrev_set(d) else ''}"
>=20
> Note on design choice: we intentionally use d.getVar(candidate, False)
> in oe.qa.check_uri_srcrev() rather than srcrev_internal_helper()
> because the latter expands SRCREV, triggering get_autorev() and live
> network fetches -- the exact problem this patch fixes.
>=20
> Note: parse-time warnings intentionally complement the QA-time warnings
> added in insane.bbclass. This is necessary because CI pipelines running
> 'bitbake --parse-only' with BB_NO_NETWORK=3D1 (the original motivation
> from Ross Burton) would miss the issue entirely if only QA-time
> warnings existed. This pattern is already established in the codebase
> (e.g. src-uri-bad fires at both parse and QA time).
>=20
> Reported-by: Yoann Congal <yoann.congal@smile.fr>
> Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16051
> AI-Generated: Developed with assistance from Anthropic Claude
> Signed-off-by: Sai Sneha <saisneha196@gmail.com>
> ---
>=20
> Changes in v4:
> - Refactored to use shared oe.qa.check_uri_srcrev() helper
> - Eliminates duplicated URI parsing logic
> - Added docstring explaining True/False return values
>=20
> Changes in v3:
> - Added AI-Generated disclosure and Reported-by tag
> - Added design decision notes to commit message
>=20
> Changes in v2:
> - Initial public submission
>  meta/classes-global/base.bbclass | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.=
bbclass
> index 62f2814bb7..7de896ca7d 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -164,14 +164,40 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=3D=
True):
> =20
>      if notfound and fatal:
>          bb.fatal("The following required tools (as specified by HOSTTOOL=
S) appear to be unavailable in PATH, please install them in order to procee=
d:\n  %s" % " ".join(notfound))
> +   =20
> +def check_srcrev_set(d):
> +    """
> +    Inspect SRC_URI for SCM URIs missing a valid SRCREV.
> +
> +    Returns True if all SCM URIs have a valid SRCREV or AUTOREV set,
> +    allowing get_hashvalue(d) to proceed normally.
> +
> +    Returns False if any SCM URI is missing SRCREV, suppressing
> +    get_hashvalue(d) to prevent a FetchError parse crash.
> +    """
> +    import oe.qa
> +    src_uri =3D (d.getVar('SRC_URI', False) or '').split()
> +    pn =3D d.getVar('PN')
> +    for uri in src_uri:
> +        rev =3D oe.qa.check_uri_srcrev(pn, uri, d)
> +        if rev is None:
> +            # SRCREV missing =E2=80=94 warn and suppress hash expansion
> +            if bb.utils.contains('ERROR_QA', 'missing-srcrev', True, Fal=
se, d):
> +                bb.error("%s: SRCREV not set for %s" % (pn, uri))
> +            elif bb.utils.contains('WARN_QA', 'missing-srcrev', True, Fa=
lse, d):
> +                bb.warn("%s: SRCREV not set for %s" % (pn, uri))
> +            return False
> +        if rev and '${AUTOREV}' in rev:
> +            return True
> +    return True
> +=20
> =20
>  # We can't use vardepvalue against do_fetch directly since that would ov=
erwrite
>  # the other task dependencies so we use an indirect function.
>  python fetcher_hashes_dummyfunc() {
>      return
>  }
> -fetcher_hashes_dummyfunc[vardepvalue] =3D "${@bb.fetch.get_hashvalue(d)}=
"
> -
> +fetcher_hashes_dummyfunc[vardepvalue] =3D "${@bb.fetch.get_hashvalue(d) =
if check_srcrev_set(d) else ''}"

How confident are you that this is a safe change to make?

This is an area where I would not make AI-driven changes myself, as a
change here could cause quite subtle issues. We may not have sufficient
test coverage to catch such issues.

Specifically, what happens if a SRC_URI has a 'tag=3D...' property, SRCREV
is not set, and the tag is changed upstream?

Best regards,

--=20
Paul Barker


--=-ly2jZLJfFUJlEi1bvG1Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCahhachEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bjabAQCGBjlG/BFDtQgb0UbFuW5IgVyRRvS7glYK
43yCUERDSgEAygaUJ8UyLc8yOCicq7XSU/ub1Xcx9HgNJLaOG3xnBgY=
=u0GL
-----END PGP SIGNATURE-----

--=-ly2jZLJfFUJlEi1bvG1Y--

