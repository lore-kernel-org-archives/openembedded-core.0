Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74BB0CD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 06:52:18 +0000 (UTC)
Received: from mail-106105.protonmail.ch (mail-106105.protonmail.ch [79.135.106.105])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6270.1779259931563962640
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 23:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=protonmail3 header.b=nxPKJlQD;
 spf=pass (domain: geanix.com, ip: 79.135.106.105, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail3; t=1779259929; x=1779519129;
	bh=b+eU5Zj/uXwEo4ajrvi68wk9hoc/QLRH1QYIKpbEzls=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nxPKJlQDg463ShmBKImARYv1QodhYneCZarWM4PyC+btaj89q+HXN0J4k5TjpVI0/
	 /qapSZOlhMnEFwQCvnm/tFylrJX9axV4YGvfaFWOct965sYyekarRjs6LOaWj5f6uY
	 /UzA+YYy56NsosHuoCopA00z+ZwgcEOwuYX1yYcqidJ7WVRj+tkjEY0Dihovy8mCj4
	 p4YsBhdhBPw2VYIMJ07dv7H8vD6OgQwi47dFRVx63XUPvKNFgvl6669+GaSKVmRe2F
	 07xb5q5VWOmbOGkNHi0DycmHJwjAIojomu6+r+hR/yrS4abpvWx0I7nV0ti1xDzGPN
	 T+pMhHS9+Gr/Q==
Date: Wed, 20 May 2026 06:52:04 +0000
To: saisneha196@gmail.com, openembedded-core@lists.openembedded.org
From: =?utf-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
Cc: yoann.congal@smile.fr, corentin.guillevic@smile.fr
Subject: Re: [OE-core] [PATCH v2 0/3] Add missing SRCREV check for SCM URIs
Message-ID: <3135866948b9f03fd55f43509a5e803261caef5c.camel@geanix.com>
In-Reply-To: <20260519103249.236132-1-saisneha196@gmail.com>
References: <20260519103249.236132-1-saisneha196@gmail.com>
Feedback-ID: 134068524:user:proton
X-Pm-Message-ID: d6d60bc75da94e652460d6b3fcf259f0890964c2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 06:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237386

Hi Sai,

Please add a changelog to the patches, so we can follow the evolution
of the patches.

And remember to update the version in the cover letter subject too.

// Martin

On Tue, 2026-05-19 at 16:02 +0530, Sai Sneha via lists.openembedded.org
wrote:
> This patch series adds a check for git:// (and other SCM) URIs in
> SRC_URI that are missing a corresponding SRCREV, addressing
> Bugzilla #16051 [1] and building on Corentin Guillevic's RFC series
> [2].
>=20
> =3D=3D Problem =3D=3D
>=20
> A recipe with a git:// URI and no SRCREV causes two problems:
>=20
> 1. Under BB_NO_NETWORK=3D1, parsing fails with a FetchError that halts
> =C2=A0=C2=A0 parsing of ALL recipes, not just the offending one. This bre=
aks CI
> =C2=A0=C2=A0 pipelines that use "bitbake --parse-only" as a sanity check,=
 which
> =C2=A0=C2=A0 was the original motivation reported by Ross Burton [3].
>=20
> 2. Without BB_NO_NETWORK, BitBake silently queries the remote
> =C2=A0=C2=A0 repository on every parse, breaking reproducibility.
>=20
> =3D=3D Why the trivial fix doesn't work =3D=3D
>=20
> The obvious fix of checking SRCREV in insane.bbclass do_recipe_qa
> was attempted by Corentin Guillevic [2] but fails because
> fetcher_hashes_dummyfunc[vardepvalue] expands SRCREV at parse time
> BEFORE QA checks run. This triggers get_autorev() which causes:
>=20
> =C2=A0 "AUTOREV/SRCPV set too late for the fetcher to work properly"
>=20
> This was confirmed by Mathieu Dubois-Briand's autobuilder testing
> [2].
> Corentin's series needed 4 patches including devtool/recipetool
> workarounds to paper over the expansion crash.
>=20
> =3D=3D This series' approach =3D=3D
>=20
> We intercept at the vardepvalue expansion point itself in
> base.bbclass:
>=20
> =C2=A0 fetcher_hashes_dummyfunc[vardepvalue] =3D \
> =C2=A0=C2=A0=C2=A0 "${@bb.fetch.get_hashvalue(d) if check_srcrev_set(d) e=
lse ''}"
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
> =C2=A0=C2=A0 srcrev_internal_helper() expands SRCREV internally, which tr=
iggers
> =C2=A0=C2=A0 get_autorev() and live git ls-remote calls =E2=80=94 exactly=
 what we are
> =C2=A0=C2=A0 trying to prevent. We intentionally use d.getVar(candidate, =
False)
> =C2=A0=C2=A0 instead. Our fallback chain mirrors BitBake's resolution ord=
er
> =C2=A0=C2=A0 exactly, as confirmed by BitBake's own error messages:
> =C2=A0=C2=A0=C2=A0=C2=A0 SRCREV_default:pn-X, SRCREV_default, SRCREV:pn-X=
, SRCREV
>=20
> 2. Why duplicate warnings at parse time AND QA time?
>=20
> =C2=A0=C2=A0 Parse-time warnings (base.bbclass) are necessary for CI pipe=
lines
> =C2=A0=C2=A0 running "bitbake --parse-only" with BB_NO_NETWORK=3D1 =
=E2=80=94 they would
> =C2=A0=C2=A0 miss the issue entirely if only QA-time warnings existed.
> =C2=A0=C2=A0 QA-time warnings (insane.bbclass) are necessary for proper
> =C2=A0=C2=A0 WARN_QA/ERROR_QA layer control and QA framework integration.
> =C2=A0=C2=A0 This pattern is already established =E2=80=94 src-uri-bad fi=
res at both
> =C2=A0=C2=A0 parse and QA time.
>=20
> 3. Why hardcode git/gitsm/hg/svn schemes?
>=20
> =C2=A0=C2=A0 These are the fetchers that require SRCREV. This is a known
> =C2=A0=C2=A0 limitation =E2=80=94 if new SCM fetchers are added in future=
, this list
> =C2=A0=C2=A0 will need updating. Noted as a follow-on improvement.
>=20
> =3D=3D Enforcement levels =3D=3D
>=20
> =C2=A0 Normal builds, all layers=C2=A0 =E2=86=92=C2=A0 WARN_QA=C2=A0=
=C2=A0 (warning, build continues)
> =C2=A0 oe-core layer=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=86=92=C2=A0 ERROR_QA=C2=A0 (error, stric=
t enforcement)
> =C2=A0 yocto-check-layer runs=C2=A0=C2=A0=C2=A0=C2=A0 =E2=86=92=C2=A0 ERR=
OR=C2=A0=C2=A0=C2=A0=C2=A0 (layer validation fails)
>=20
> This matches the graduated enforcement requested in Bug 16051
> Comments 2 and 3.
>=20
> =3D=3D Testing =3D=3D
>=20
> Tested on openembedded-core with:
>=20
> - Recipe with missing SRCREV =E2=86=92 WARNING/ERROR at parse time =
=E2=9C=93
> - Recipe with SRCREV =3D "${AUTOREV}" =E2=86=92 silent passthrough =
=E2=9C=93
> - Recipe with rev=3D in URI =E2=86=92 no false positive =E2=9C=93
> - Recipe with multiple SCM URIs =E2=86=92 all missing SRCREVs reported =
=E2=9C=93
> - oe-core recipe =E2=86=92 ERROR instead of WARNING =E2=9C=93
> - yocto-check-layer on layer with missing SRCREV =E2=86=92 FAIL =E2=9C=
=93
> - 952 other recipes parse cleanly =E2=86=92 0 errors =E2=9C=93
>=20
> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16051
> [2]
> https://lore.kernel.org/openembedded-core/20260304104342.869457-1-corenti=
n.guillevic@smile.fr/
> [3]
> https://lists.openembedded.org/g/openembedded-devel/topic/115911777
>=20
> Sai Sneha (3):
> =C2=A0 base.bbclass: warn when SRCREV is missing for SCM URIs at parse
> time
> =C2=A0 insane.bbclass: add missing-srcrev QA check for SCM URIs
> =C2=A0 yocto-check-layer.bbclass: enforce missing SRCREV check during
> layer validation
>=20
> =C2=A0meta/classes-global/base.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 40
> +++++++++++++++++++
> =C2=A0meta/classes-global/insane.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 32 +++++++++++++++
> =C2=A0meta/classes-global/yocto-check-layer.bbclass| 32 +++++++++++++++
> =C2=A03 files changed, 104 insertions(+), 2 deletions(-)
>=20
>=20
> --
> Note: This patch series was developed with assistance from Anthropic
> Claude (AI). All code has been reviewed, tested, and verified by the
> contributor. The Signed-off-by line represents the contributor's own
> certification per the Developer's Certificate of Origin.
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#237306):
> https://lists.openembedded.org/g/openembedded-core/message/237306
> Mute This Topic: https://lists.openembedded.org/mt/119387995/3618414
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> martin@geanix.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


