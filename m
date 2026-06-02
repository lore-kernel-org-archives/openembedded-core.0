Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BFC8CD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 13:52:27 +0000 (UTC)
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26030.1780408342900425455
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 06:52:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=b6yh3zH5;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=Avohr5nu;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DF6181400169;
	Tue,  2 Jun 2026 09:52:21 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 02 Jun 2026 09:52:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1780408341; x=1780494741; bh=3GFymUavmb
	7g1KZywhkobyxEuGAxWwpV/UUhrQZh/KM=; b=b6yh3zH53rkSykhUkAyXsQwbcI
	0/Ypn0dopcQz6zBOA4OoauNtlHNw71Qssy56+fP5HiEhSMV4UfiX7dhJze+LlsMR
	QN4foBK1P9zqkgNA7j+smKnNJIayfU3jqvkmjIcujYhVJZN9CRfcmZih0hFGcTTe
	G+ifDPSA5ju+53c3ODQmosAa6ZMpqc6mxJNc1nC5J3V6t/jOTm5eLhNOV1NIS1yR
	z8B/uxAvgQ6F8IChPaIQeRT+JI3TMUeqDtb/7xPREycy9MNwo1WnDZbLP/VFjCav
	6xW0caKj5fI4BjdD8nGMo9xmxHe8sEop35jBIjAyUXYU7sBv5vLDKeqGbjIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780408341; x=1780494741; bh=3GFymUavmb7g1KZywhkobyxEuGAxWwpV/UU
	hrQZh/KM=; b=Avohr5nuJqSu3paiRCZKplz8eEz6HnCzyprP3u/oM/94DrMJWvl
	6rHC0K2xuiWA1/l8JR9dOLc76XImyPREHZ8XuizEkGM911zP9NvcDlhKbi6AAdGn
	Viy1rDrrRn1FemCJ8o2vHxh2sE4bPRHjNnGAWEknHBWX0tpi40pDnkvemzAPEXe7
	7BL/FrdKMMiqut8b2b2diXNLlJqo/HN0oiCXlrnQQBDkh8IgUsyoXGor1QKQ7dwM
	iEGIfmPgxT9bjOQpbjayujaRqQw1eNiuLB4ehmdplfXceuGR175ycCLnlN/AcP5t
	4LznU0Ophnb9JmDUG0LHHkb6l4eM6yvrOBQ==
X-ME-Sender: <xms:FeAeavje6ShIKu8_4JPY6-clR4_LdPhR3WFC7lNtyrMuQ4pm7c8Xyg>
    <xme:FeAeavsA-B1qn9rAP_UgvVmUR0gT3NeQE04SSyjFIcOMg3YrCu9-X9hiIlsebVbHN
    CQAQreLz5Xkicyz2Ev7yRf9GZ3FZuHot_sdmzMd1fJ2ITny2aCJprE>
X-ME-Received: <xmr:FeAeao5HoW1BtVrcrg4BSuNRZbovNEYzgQM19e7NvTRAforE8m_WIg0Gags22DDrk_REbV4MP6lx1IH3alPEJUIQZzz_gBOIpwS0iT5ThnUSW33v4txUxi8r8_6_NhTm>
X-ME-Proxy-Cause: dmFkZTGfA6EuxFmZ297MEHNf5712DRn8POjAKThIJD0MxSv/bHflo1bVXnP7hB7Isj7Khw
    3azhOgRuL8xBnok7T6PTK3zfbH5Y0HPQiiAzPU5kRDY6Fnyxy9hgXPfBF/jwkNVA+0NFFz
    LX50lOXrk3SnwL2ZqWdMnV7pG7pERS5xQrwgP9S2Zgi6NDuOKH8+2XX3rE36kp5PI3jrz+
    Q2RdH/2gGLSHzuiuWvqzQJIWD5uaLGzV5UfRkmqpPWjFcgnvdj5oh7VbHTvSfCbxOAjXw6
    0kfOjhFiGxboEPdDOIAaPwBWsdGZIFzW83WTokNE53rxSgf1lRMhidbgWe1o0ojcVh6URi
    vhonLELQ+Slcfx3MMtAIr0b4vLH+WDCP+wcMamucxxueJUPw2mWlwMcUpC2EtfyBVe55lZ
    eryzmHQt3PfrVAY7tR/bLQi4snZNOBqFw83xR/0CJy1p9+B80izw6CxizrKHTGvsXHrxWA
    dS+l+bULVrmzAA7JZ3IU/ZiIwr7LDK+pUn2Kqy6ihLddnKRUtoR63ELG7pFcfvHbzg65rw
    jhbZFkNR6oBrmc0MwE15yZD/jOannGEZK6oudea3tyYhzzo8QyajpwtpJc0MVa2OrFczYR
    SKdfwbytAi4b2oaLjcyd0gjNOB6HqUmVKLZnPYztlU/9b8y3JEx2JIVMcp8g
X-ME-Proxy: <xmx:FeAeajN7ypKjqKvUfvebilx7LBP_dwnR1hXBXfuB1P8_0gqL5un-7A>
    <xmx:FeAeausVYJ6kTpGECXcdwca_-jkMHIpgaTJSIZRBdNPbv_LRorHj_Q>
    <xmx:FeAeauaVblBLfPUMIYggjLOGIKhHywI6D_oIh4AdusN84drhIzlBGg>
    <xmx:FeAeaozt0kuI5yWpP1ARQePiF6vUl7xqJJvt0wUJHyF5YTenFDxxIg>
    <xmx:FeAeavxcrrJa0Uv2hmVzdzFgvRx9jdWBnqMkD62mK97JhoE3-lzLThJP>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Jun 2026 09:52:20 -0400 (EDT)
Message-ID: <f63c189408309e78860c691aa366835790b42730.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v5 0/4] Add missing SRCREV check for SCM URIs
From: Paul Barker <paul@pbarker.dev>
To: saisneha196@gmail.com, openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr, corentin.guillevic@smile.fr, martin@geanix.com, 
	mathieu.dubois-briand@bootlin.com
Date: Tue, 02 Jun 2026 14:52:17 +0100
In-Reply-To: <20260602062940.3107241-1-saisneha196@gmail.com>
References: <20260602062940.3107241-1-saisneha196@gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-EGglWny6iYunk2UUEH0P"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 13:52:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238050


--=-EGglWny6iYunk2UUEH0P
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-06-02 at 11:59 +0530, Sai Sneha via lists.openembedded.org
wrote:
> This patch series adds a check for git:// (and other SCM) URIs in
> SRC_URI that are missing a corresponding SRCREV, addressing
> Bugzilla #16051 [1] and referencing Corentin Guillevic's RFC series [2].
>=20
> =3D=3D Changes since v4 =3D=3D
>=20
> - Add tag=3D to skip condition in oe.qa.check_uri_srcrev() alongside
>   the existing rev=3D handling. This fixes a selftest breakage
>   (test_git_unpack_nonetwork) reported by Mathieu Dubois-Briand where
>   recipes using tag=3D in SRC_URI intentionally leave SRCREV empty.

We cannot just skip when we see a tag=3D... parameters. The tag would
still need to be looked up in the remote repository at parse time.

> - Update docstring to mention tag=3D parameter
> - Verified by running full bbtests.BitbakeTests selftest suite:
>   32/33 passed, 1 failure (test_image_manifest) is unrelated as it
>   requires building a full image and fails due to network constraints
>=20
> =3D=3D Note on CHECKLAYER_REQUIRED_TESTS =3D=3D
>=20
> Paul suggested using CHECKLAYER_REQUIRED_TESTS instead of Patch 4.
> We tested this but found it promotes missing-srcrev to ERROR_QA for
> ALL layers globally during normal builds, because CHECKLAYER_REQUIRED_TES=
TS
> feeds directly into ERROR_QA. This contradicts Bug 16051 Comment 3
> which requests keeping it as a warning for external layers by default.
> The direct implementation in yocto-check-layer.bbclass enforces it
> strictly only during checklayer validation without affecting normal build=
s.

The correct way to handle this is via a discussion instead of just
re-prompting an LLM. The comments in bugzilla are not requirements, and
some human discussion is probably needed to arrive at a resolution.

>=20
> =3D=3D Note on candidates list order =3D=3D
>=20
> Martin suggested reversing the candidates list so plain SRCREV is
> tested first. We kept most-specific-first order because it mirrors
> BitBake internal srcrev_internal_helper() resolution order exactly,
> as confirmed by BitBake own error messages:
>   SRCREV_default:pn-X, SRCREV_default, SRCREV:pn-X, SRCREV
>=20
> =3D=3D Problem =3D=3D
>=20
> A recipe with a git:// URI and no SRCREV causes two problems:
>=20
> 1. Under BB_NO_NETWORK=3D1, parsing fails with a FetchError that halts
>    parsing of ALL recipes. This breaks CI pipelines that use
>    bitbake --parse-only as a sanity check.
>=20
> 2. Without BB_NO_NETWORK, BitBake silently queries the remote
>    repository on every parse, breaking reproducibility.

These issues also occur when SRCREV is set to a branch or tag instead of
an explicit commit hash.

>=20
> =3D=3D Why the trivial fix does not work =3D=3D
>=20
> The obvious fix of checking SRCREV in insane.bbclass do_recipe_qa
> was attempted by Corentin Guillevic [2] but fails because
> fetcher_hashes_dummyfunc[vardepvalue] expands SRCREV at parse time
> BEFORE QA checks run. Corentin patches 1 and 2 add the QA check,
> while patches 3 and 4 ensure devtool and recipetool only use
> AUTOREV when appropriate.
>=20
> =3D=3D This series approach =3D=3D
>=20
> We intercept at the vardepvalue expansion point in base.bbclass
> using a shared helper oe.qa.check_uri_srcrev() that uses
> d.getVar(candidate, False) preventing expansion entirely.

I recommend being highly skeptical of AI generating code which modifies
fairly low-level things like vardeps or vardepvalue flags. They are
powerful, but should not be the first thing you reach for when trying to
solve a problem unless you understand fully what they are doing.

>=20
> =3D=3D Design decisions =3D=3D
>=20
> 1. Why not use srcrev_internal_helper()
>=20
>    It expands SRCREV internally, triggering get_autorev() and live
>    network fetches. Our fallback chain mirrors BitBake resolution
>    order exactly without expansion.
>=20
> 2. Why duplicate warnings at parse time AND QA time
>=20
>    Parse-time catches CI parse-only pipelines. QA-time gives proper
>    layer control. This pattern is established - src-uri-bad does same.

Where is this pattern established? src-uri-bad is just handled as a
regular QA check in do_recipe_qa().

>=20
> 3. Why hardcode git/gitsm/hg/svn schemes
>=20
>    Known limitation, noted as follow-on improvement.

"Known limitation" is not an answer to the question "Why?".

>=20
> =3D=3D Enforcement levels =3D=3D
>=20
>   Normal builds, all layers  ->  WARN_QA
>   oe-core layer              ->  ERROR_QA
>   yocto-check-layer runs     ->  ERROR
>=20
> =3D=3D Testing =3D=3D
>=20
> - Recipe with missing SRCREV -> WARNING/ERROR at parse time
> - Recipe with SRCREV =3D AUTOREV -> silent passthrough
> - Recipe with rev=3D in URI -> no false positive
> - Recipe with multiple SCM URIs -> all missing SRCREVs reported
> - oe-core recipe -> ERROR instead of WARNING
> - yocto-check-layer on layer with missing SRCREV -> FAIL
> - 952 other recipes parse cleanly -> 0 errors
>=20
> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16051
> [2] https://lore.kernel.org/openembedded-core/20260304104342.869457-1-cor=
entin.guillevic@smile.fr/
> [3] https://lists.openembedded.org/g/openembedded-devel/topic/115911777
>=20
> Sai Sneha (4):
>   oe/qa.py: add check_uri_srcrev() helper for SCM URI SRCREV validation
>   base.bbclass: warn when SRCREV is missing for SCM URIs at parse time
>   insane.bbclass: add missing-srcrev QA check for SCM URIs
>   yocto-check-layer.bbclass: enforce missing SRCREV check during layer va=
lidation
>=20
>  meta/classes-global/base.bbclass              | 28 ++++++++++
>  meta/classes-global/insane.bbclass            | 13 +++++
>  meta/classes-global/yocto-check-layer.bbclass | 15 ++++++
>  meta/lib/oe/qa.py                             | 30 +++++++++++
>  4 files changed, 86 insertions(+), 2 deletions(-)
>=20
> --
> Note: This patch series was developed with assistance from Anthropic
> Claude (AI). All code has been reviewed, tested, and verified by the
> contributor. The Signed-off-by line represents the contributor own
> certification per the Developer Certificate of Origin.

Best regards,

--=20
Paul Barker


--=-EGglWny6iYunk2UUEH0P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCah7gEREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0brIkAQCZqRXUQfvExph9h00EGn0mSroxi3PsOpTs
fhqBlK8zHwD9GebZX0z0Yz5qhBnutA/+qHfXMgZ2K5loRe/YntSJ/gc=
=Xf/F
-----END PGP SIGNATURE-----

--=-EGglWny6iYunk2UUEH0P--

