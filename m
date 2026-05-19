Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC29BCD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 10:29:19 +0000 (UTC)
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18342.1779186549881743125
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 03:29:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=APUul3Rj;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=tf9xEy0X;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0AFC1140010E;
	Tue, 19 May 2026 06:29:09 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 19 May 2026 06:29:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1779186549; x=1779272949; bh=wO/8yna5Yd
	VJXblzY8OTJVDvPaeBqQO4SwfCzXB8aAQ=; b=APUul3Rj9gr7Dc2D2KkbKpqAQL
	ZThJEKKELBEINtizjxemk7ZVEkqO7ul9ovGY7NHTOooc1pVnXALFBmST/bJHSO0N
	OYqUMe9uq4wCXr79SDAFx57oteWdhJNjHhqNqipcJDd5SzZZTuX9cbC6dMnV46P7
	6MwYr0Aau01lTuBOUw6i3RCU5oWy6BRoQy4X5RjdqNK1roOTktylEnw1bDe9vIZu
	vXeMGcyluu96GuAsgEZQJ0TYpf9/EpRrBYB9lJMNOOnTAgb059U/Pqrs0GJFOqQX
	GDIqHtwkBRqnmw+uOXTnYc/CPOvlDDFN2ZA/ywRz8JdrRKYyxoBlTM1Xe03w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1779186549; x=1779272949; bh=wO/8yna5YdVJXblzY8OTJVDvPaeBqQO4Swf
	CzXB8aAQ=; b=tf9xEy0XmzmaTbvDxQeuNXyl3SwlGOGEZg0gKMYqVt7neFXKUZK
	sye3cbhIoj6ojqWwBjYd7No5v3mjvEeTc4QJvJzb475CaWUAaVu+du5OxrLFEj2t
	W/KD54lYXHWB34kI8BgnNudZ2SNR45t9EBSABn/m0VyeZI3/R2DOHrTuE10mazq2
	2O38o6jASz2U73tq2VdmSciXVgSPmQrY93PUFJJGe+hXXgyF3opOqU//pOpDK0nM
	XaF1C7JMCm6esF16Vdilkir3ALFaeXv/lFSas9+LGdt5vq3ULgVJlNB69Padj0Je
	E+6z8KSkR889FYKkh1obyh/nSQ6BLPwkeYw==
X-ME-Sender: <xms:dDsMahc2u6LxfSvN-2GxONNbgSL2BCUby2cwnSAiX-zXQulonRHNOQ>
    <xme:dDsMamNysa7Rx6XMpNxjPk6xBgg7m5aDrYSfxV04bBLlqxJVYDksJyRy7XARhLSAt
    D3KLO6Su2kGEUgJLZNYiIJzxX-s_2SrBOVa0p95tunYe5RV-PnpZuk>
X-ME-Received: <xmr:dDsMavizgImjvLEjvBTOHa6iYCTzVe8GPs6WpjVRq9MzzqQRntivBU1GqMTATyDwQTNgoTaEV0IbCjnwO8iz6OP-nd_oLJIRVzMuCVwd1j_t>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeduheduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfevffgjfhgtfgggsehgtderre
    dtreejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghr
    rdguvghvqeenucggtffrrghtthgvrhhnpeegleduteetiefgudevhfdvvdekudejffevle
    dvieejudfgveeifeefgfethfejffenucffohhmrghinhepohhpvghnvghmsggvugguvggu
    rdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehp
    sggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuth
    dprhgtphhtthhopehsrghishhnvghhrgduleeisehgmhgrihhlrdgtohhmpdhrtghpthht
    ohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvug
    guvggurdhorhhgpdhrtghpthhtohephihorghnnhdrtghonhhgrghlsehsmhhilhgvrdhf
    rhdprhgtphhtthhopegtohhrvghnthhinhdrghhuihhllhgvvhhitgesshhmihhlvgdrfh
    hr
X-ME-Proxy: <xmx:dDsMap1-Pf-PzUyPe8Ermk7a5JGYSBEXRsPTtb6gxx0U-2JW_EQJ2Q>
    <xmx:dDsMapgs7XidYGUU4WvKMs1GmECKRf5xojewduuekEU6UUSIYOhiNw>
    <xmx:dDsMapfaws1c8FPF-IOUNVhgyNYapV73ZL7F42H-QyiEOd2oTS1TIg>
    <xmx:dDsMasnPealIqxtIL_5PQJSoEZtQl8Q7VVN2EjfD4pzynqde22Nj4A>
    <xmx:dTsMarQPNNTLaVuaWiWyA5Y4rvWVtGfyJ4JOvIHhT_sgjOQQ_qiAk__W>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 May 2026 06:29:08 -0400 (EDT)
Message-ID: <d50ef0732d7d0a6b3df432cb9c072acf456d5c3a.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v2 0/3] Add missing SRCREV check for SCM URIs
From: Paul Barker <paul@pbarker.dev>
To: saisneha196@gmail.com, openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr, corentin.guillevic@smile.fr
Date: Tue, 19 May 2026 11:29:05 +0100
In-Reply-To: <20260519100904.235971-1-saisneha196@gmail.com>
References: <20260519100904.235971-1-saisneha196@gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-KXw53WHzeNbYzF35Wn1W"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 10:29:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237305


--=-KXw53WHzeNbYzF35Wn1W
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-05-19 at 15:39 +0530, Sai Sneha via lists.openembedded.org
wrote:
> This patch series adds a check for git:// (and other SCM) URIs in
> SRC_URI that are missing a corresponding SRCREV, addressing
> Bugzilla #16051 [1] and building on Corentin Guillevic's RFC series [2].
>=20
> =3D=3D Problem =3D=3D
>=20
> A recipe with a git:// URI and no SRCREV causes two problems:
>=20
> 1. Under BB_NO_NETWORK=3D1, parsing fails with a FetchError that halts
>    parsing of ALL recipes, not just the offending one. This breaks CI
>    pipelines that use "bitbake --parse-only" as a sanity check, which
>    was the original motivation reported by Ross Burton [3].
>=20
> 2. Without BB_NO_NETWORK, BitBake silently queries the remote
>    repository on every parse, breaking reproducibility.
>=20
> =3D=3D Why the trivial fix doesn't work =3D=3D
>=20
> The obvious fix of checking SRCREV in insane.bbclass do_recipe_qa
> was attempted by Corentin Guillevic [2] but fails because
> fetcher_hashes_dummyfunc[vardepvalue] expands SRCREV at parse time
> BEFORE QA checks run. This triggers get_autorev() which causes:
>=20
>   "AUTOREV/SRCPV set too late for the fetcher to work properly"
>=20
> This was confirmed by Mathieu Dubois-Briand's autobuilder testing [2].
> Corentin's series needed 4 patches including devtool/recipetool
> workarounds to paper over the expansion crash.
>=20
> =3D=3D This series' approach =3D=3D
>=20
> We intercept at the vardepvalue expansion point itself in base.bbclass:
>=20
>   fetcher_hashes_dummyfunc[vardepvalue] =3D \
>     "${@bb.fetch.get_hashvalue(d) if check_srcrev_set(d) else ''}"
>=20
> check_srcrev_set() uses d.getVar(candidate, False) =E2=80=94 the False fl=
ag
> prevents expansion entirely, so get_autorev() is never triggered and
> no network access occurs. This solves the root cause in one patch
> without needing devtool/recipetool changes.
>=20
> =3D=3D Design decisions =3D=3D
>=20
> 1. Why not use srcrev_internal_helper()?
>=20
>    srcrev_internal_helper() expands SRCREV internally, which triggers
>    get_autorev() and live git ls-remote calls =E2=80=94 exactly what we a=
re
>    trying to prevent. We intentionally use d.getVar(candidate, False)
>    instead. Our fallback chain mirrors BitBake's resolution order
>    exactly, as confirmed by BitBake's own error messages:
>      SRCREV_default:pn-X, SRCREV_default, SRCREV:pn-X, SRCREV
>=20
> 2. Why duplicate warnings at parse time AND QA time?
>=20
>    Parse-time warnings (base.bbclass) are necessary for CI pipelines
>    running "bitbake --parse-only" with BB_NO_NETWORK=3D1 =E2=80=94 they w=
ould
>    miss the issue entirely if only QA-time warnings existed.
>    QA-time warnings (insane.bbclass) are necessary for proper
>    WARN_QA/ERROR_QA layer control and QA framework integration.
>    This pattern is already established =E2=80=94 src-uri-bad fires at bot=
h
>    parse and QA time.
>=20
> 3. Why hardcode git/gitsm/hg/svn schemes?
>=20
>    These are the fetchers that require SRCREV. This is a known
>    limitation =E2=80=94 if new SCM fetchers are added in future, this lis=
t
>    will need updating. Noted as a follow-on improvement.
>=20
> =3D=3D Enforcement levels =3D=3D
>=20
>   Normal builds, all layers  =E2=86=92  WARN_QA   (warning, build continu=
es)
>   oe-core layer              =E2=86=92  ERROR_QA  (error, strict enforcem=
ent)
>   yocto-check-layer runs     =E2=86=92  ERROR     (layer validation fails=
)
>=20
> This matches the graduated enforcement requested in Bug 16051
> Comments 2 and 3.
>=20
> =3D=3D Testing =3D=3D
>=20
> Tested on openembedded-core with:
>=20
> - Recipe with missing SRCREV =E2=86=92 WARNING/ERROR at parse time =E2=9C=
=93
> - Recipe with SRCREV =3D "${AUTOREV}" =E2=86=92 silent passthrough =E2=9C=
=93
> - Recipe with rev=3D in URI =E2=86=92 no false positive =E2=9C=93
> - Recipe with multiple SCM URIs =E2=86=92 all missing SRCREVs reported =
=E2=9C=93
> - oe-core recipe =E2=86=92 ERROR instead of WARNING =E2=9C=93
> - yocto-check-layer on layer with missing SRCREV =E2=86=92 FAIL =E2=9C=93
> - 952 other recipes parse cleanly =E2=86=92 0 errors =E2=9C=93
>=20
> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16051
> [2] https://lore.kernel.org/openembedded-core/20260304104342.869457-1-cor=
entin.guillevic@smile.fr/
> [3] https://lists.openembedded.org/g/openembedded-devel/topic/115911777
>=20
> Sai Sneha (3):
>   base.bbclass: warn when SRCREV is missing for SCM URIs at parse time
>   insane.bbclass: add missing-srcrev QA check for SCM URIs
>   yocto-check-layer.bbclass: enforce missing SRCREV check during layer va=
lidation
>=20
>  meta/classes-global/base.bbclass             | 40 +++++++++++++++++++
>  meta/classes-global/insane.bbclass           | 32 +++++++++++++++
>  meta/classes-global/yocto-check-layer.bbclass| 32 +++++++++++++++
>  3 files changed, 104 insertions(+), 2 deletions(-)

Hi Sai,

Why do we need to implement the same test three times? Even if the test
needs to run from different places, we should be able to factor out
common code to a function. And we shouldn't need to re-implement this in
yocto-check-layer anyway, Yoann's comment in bugzilla said to add the QA
check to CHECKLAYER_REQUIRED_TESTS [1].

Patches 3 & 4 of Corentin's series [2] are not workarounds, they are
ensuring that recipes modified by recipetool or devtool only use
${AUTOREV} if it is appropriate.

[1]: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16051#c2
[2]: https://lore.kernel.org/openembedded-core/20260304104342.869457-1-core=
ntin.guillevic@smile.fr/T/

Best regards,

--=20
Paul Barker


--=-KXw53WHzeNbYzF35Wn1W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCagw7cREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bqVFAP9x20joYFkrfHBwPtspULC58TL9UgUbHI/M
Pa1FMa5+mgD+KogQe/j2zJA1+viWkUYyucMifiMD6F1gPMPB2gCFuQk=
=oUKe
-----END PGP SIGNATURE-----

--=-KXw53WHzeNbYzF35Wn1W--

