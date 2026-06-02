Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59724CD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 13:36:27 +0000 (UTC)
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25589.1780407383750816021
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 06:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=hUtv+Bpt;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=RibE+Oj0;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CC3691400188;
	Tue,  2 Jun 2026 09:36:22 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 02 Jun 2026 09:36:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1780407382; x=1780493782; bh=9G5rXpslVK
	CX6rwYp/wj9z6Uwx+IExQDZqGn+NmUhCo=; b=hUtv+Bpta+kpenX+xqznWNRH+V
	ncS3rMwfZQvPp/ZjAv/B6xzhe8y+B669ChQPdgIOjOVhadJFevVy3QACQu1OaoqD
	VT+ruRJOG2W0amnJ143V5cJMIs44yqaCXuNXgKGsAWPJ0uWzMWDwssXCChqpUnJW
	aDX1sAtUqbRZ3KItTLdBWmNaLvuvrA7BAV6Y+WVPXRqLKKerQIicDe68GDfO4fNB
	3fpNVc1IK7acrX/Zbh+pzYTUvPSESWInwZaazI69f6L9zd5dv77AF3Cdmqr+OUfg
	thF9/oe1BV5yZAqfsjHMhm09z8tCSbAmQu/GJcgC+/zsSWnyf7UL2O0vRVDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780407382; x=1780493782; bh=9G5rXpslVKCX6rwYp/wj9z6Uwx+IExQDZqG
	n+NmUhCo=; b=RibE+Oj0+mfh5mZn40gDBLKbc5CycBjnbTmk63MaxPggv0GF5G3
	MkOcgJhhvhC/d3p0utfvAFFaMpElIGLCCvlgQMrqzlkB7MXOSM2oRwlZuTMwTcUI
	ave1VSd2OJrOBZiyBFXTFYFkalb5nnib3o5qiUdxnLin5mfr5V9pnxBNqPP6k83v
	avWX0s1eKaDXq1URRrCFgW8KtreIAEOLKLHg61dtfNdj6w6DE7FyGR/Map9xSw6j
	oYKW1QPECrThZrzEaF2ZxrloAT/o6FxbjmRyxrCjbEnVL6PZrmw8avUbi0yZxtTF
	WvDgg7UnNvppRWZdNUIJW15haoy4LUP25dw==
X-ME-Sender: <xms:VtweaiUl88srMT3a6xz2y0ncGo4ygBMzhO8YhCex7dYlPyp6C38mmA>
    <xme:VtweaiRQc5VjSRM3USv9gQCJXJKW5FixDW70fAKwycQOI6uRB2eIn_CDKXMI8PldB
    2exEF1IcgmKEGhpBKJ8gVI2sgarss6iDjMBoMCzM2bgQQ9x-BzY59E>
X-ME-Received: <xmr:VtweagPSDJ7pWwVlxM73Jr_kMIEnCHSZllzmm_bmWlYNxXT9XV80lLUp5P93xpkOxdz3ce4yVO-C5knpJLaT3zVU31YyuNhv3h27EYdS_3zom9BtknKe4R4WFhbJXYAT>
X-ME-Proxy-Cause: dmFkZTESfFpjpTUCpbnXNccX1bVrvGXKfiN5TPDaYclfoIly931EWqTQnY6kTmTmL0J7T9
    XGxtwh9nrIjW9eHzClON5Y9F7KwOMn/6pSejB+zPQPs6jCKwJuMmjxq0ioQpcyKMBNxaxv
    WzSwrwrIhnUH+8qaQU0qcfbhpVohuVz+k25xKR4DajnoAKCrsTaZLNRzFszRLw2xHaF+BY
    U3X3ZlADv2uEMx1bE6yni6vitICVPk6xGR4T8084gz2o6tJEa6JwINzvyEawGOf0eJBPFZ
    JChb1mPz4yK89rNoOBKIz/2tKrhutDrtXw9S+Z3TQXaIXRXsJFmbPcTl1dgnBoKK/hnwLc
    ZraF7WFPnf1hXc4D2MX1IxAINognfwPU77zjUNa6wdinIHuqAZDEMOEY7/cRgrCQ1sVpEj
    JmdUy31uUqN+18wlcs0tB7NvJFFlZKvvLBK6fkJjRlKOh8l8LUMTfi/7Xd/VpApx4KgwuU
    Fa4Pwe6ubzcMYhCUmd8wwGg8o9YbREzovBKzh10ftyGL2ntUinczLtr3j2CmVOBK0Z6WOr
    hZjqAqDMhXnFsdlm5JO4vvcvW50bQrnEnSggnOZaDjsOEJkmGw17n5IvSV5YYizEUCExDF
    u6qf3kcM/M3on10z6C3/uewX9/P9GQjutfMuqgD+KbAfKeZVtOEZH0IhRbxA
X-ME-Proxy: <xmx:VtweagSN1ei63MCyagk6oJ1B1O1Sj1FAUoeyMFckkVFZZpnpjS6oCw>
    <xmx:VtweauhxxN2Eu5jGdNMwCb2b0oRINziYyTnPjCZ3FVsUDCkFvmcmYg>
    <xmx:Vtweap8OC6zworq_CmAQGgjpyIjNDMPcOkmhqWGwXf6HlpGso0eYTg>
    <xmx:VtwealGKdJreqkkdwgGUWZ5adWbuDZcSA4G_mKZ93kBcKK9PkEbN6A>
    <xmx:VtweankFBfLNO7DVTE-UG_fuEQaP6-AoEFRSVYMJ9-sOqqpGYZ5RT0iO>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Jun 2026 09:36:21 -0400 (EDT)
Message-ID: <277aaeed91654c4a615f840f6fc4c7fd23d902d3.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v5 2/4] base.bbclass: warn when SRCREV is
 missing for SCM URIs at parse time
From: Paul Barker <paul@pbarker.dev>
To: saisneha196@gmail.com, openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr, corentin.guillevic@smile.fr, martin@geanix.com, 
	mathieu.dubois-briand@bootlin.com
Date: Tue, 02 Jun 2026 14:36:17 +0100
In-Reply-To: <20260602062940.3107241-3-saisneha196@gmail.com>
References: <20260602062940.3107241-1-saisneha196@gmail.com>
	 <20260602062940.3107241-3-saisneha196@gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-qiBFoi+eSzdW/kxO6PQn"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 13:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238049


--=-qiBFoi+eSzdW/kxO6PQn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-06-02 at 11:59 +0530, Sai Sneha via lists.openembedded.org
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
> Changes in v5:
> - No changes to this patch
>=20
> Changes in v4:
> - Refactored to use shared oe.qa.check_uri_srcrev() helper
> - Eliminates duplicated URI parsing logic
> - Added docstring explaining True/False return values
>=20
> Changes in v3:
> - Added AI-Generated disclosure and Reported-by tag
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

I think the overall approach here is wrong. This code attempts to mask
the error that would occur if network access is unavailable but the
SRCREV cannot be resolved without network access. However, it fails to
do this properly - what about SRCREV set to a tag instead of a commit
hash? In that case check_uri_srcrev() would return a non-empty string,
check_srcrev_set() would return True and we would still end up looking
up the tag in the remote git repository during parsing.

For the cases where one SRC_URI entry specifies a branch or tag,
and has no SRCREV set, all SRCREV hashes are removed from the vardeps of
the do_fetch function. This means that the fetcher will no longer be
re-ran when the branches or tags are changed upstream. That is breakage
of expected fetcher behaviour.

I recommend discussing the issues further on the bug tracker or mailing
list, making sure you have a full understanding of the behaviour and the
necessary change. Then come back to the implementation.

Best regards,

--=20
Paul Barker


--=-qiBFoi+eSzdW/kxO6PQn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCah7cUREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bu9HAQCzfLIUspxuBu7C68DGWH+3IE8R1B5Yz7kY
gBb+by7eUAEA3b4io/KAjk0TCJ8jcll3MujS2/8at57XpjTQ9z+PeAI=
=f7vW
-----END PGP SIGNATURE-----

--=-qiBFoi+eSzdW/kxO6PQn--

