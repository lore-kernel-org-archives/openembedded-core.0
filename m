Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DF9CD4F3C
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 07:27:20 +0000 (UTC)
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3302.1779089235798983446
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 00:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=AYRzmeRa;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=vE75uOUT;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.153, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1373B7A0073;
	Mon, 18 May 2026 03:27:15 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 18 May 2026 03:27:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1779089234; x=1779175634; bh=cAaa5BevPu
	ZtoKINO3AfXmvJ5s4249XgjnfOSPRlgrE=; b=AYRzmeRaRWOos6c8shYtlk14n9
	EGUqpTd84XkITWg62y+wmMTMKPZv2OuGkogrRQlRtTRHbAjZPm3g9/6+fFP1Iawj
	U0efuBf0XdYs3x0DfpBwea0OLS5KgXiST650hNNcMt+eeebPBN+f3ewpCXQumAQS
	QXFQZZcOHdIcEEgr3ybqL1fKiRo9uraDUrciFdzTyn6HtKvrFrfxb5a+PwwgCU1h
	/xaq3s9TqIxNe75uD3+OClWtQdouXXBwV8+IRKe/h7DL6u+f/u7FmhpRljELOWCa
	RLKLq/kYB7TkPjhj1NiUrM/d2ouVpQ0BMEqys016xED1n0riRJvWojtZAGlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1779089234; x=1779175634; bh=cAaa5BevPuZtoKINO3AfXmvJ5s4249Xgjnf
	OSPRlgrE=; b=vE75uOUTaz8aro0iUMiW6lgh8WOCG1vdwh4KzqSijq0FOzXkSg7
	JWETx+3bAMmlgw3leQB42e1EkYM8ofDmeJHCkl1itqZujNfycAkkGNJcd6LIqHdH
	r+dsIAzXBy+kp4UOyCpn8XjbHmOqVGxMFL1/sZlzlBt4i/mPG/u8kt9C/0krmIdp
	BXbKim67Ts8DZY7/xJLAYWCiv+oEU+xAd7/Yif4aDHgWZ2NuDAKyWnWWSVaXE8Lz
	jqMoXvGxcUFM9tvg5MX3kEnQrjmjZUFyFXP+wu5VPtJmWzT9wumSlW8BgLg+B5Zr
	sQ4E6LJu2ylpvDMLX6YrWm9X++V8OJ0L3tg==
X-ME-Sender: <xms:Ur8KasPdiQdk-IDQZBYQHkLtXbyIgjiaitAsljh-Ue6RbKFFLHYd-g>
    <xme:Ur8KaqaVhk71zKNwWLMYLbUyOG4ll_SUgizuRWiVAyT_eH55RKeYooAo6f3mvvNRr
    nc6C60jkcCvjmlQVBeROZfzxoqSDK-hrSHBtbB-v4IpP2BBs1IhX-c>
X-ME-Received: <xmr:Ur8KagrkRnedePQ15fMiNw-YlshVbQswZqyo9xCYh9SxtYFz8ofpjcaDzPhY8EZquAsmUBMOHleSePciKHGT9m6opkV2bz17cRB8Aw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeekvdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epgeefieekgeefkeejgfeuvdejhfffffevjedtfefgueefffdukeetffejfeefgfevnecu
    ffhomhgrihhnpehtvghsthgpsghughiiihhllhgrpggvnhhtrhihpghfohhrmhgrthdrfh
    grihhlpdhtvghsthgptghomhhmihhtpghmvghsshgrghgvpghprhgvshgvnhgtvgdrfhgr
    ihhlpdhtvghsthgptghomhhmihhtpghmvghsshgrghgvpghushgvrhgpthgrghhsrdhfrg
    hilhdpthgvshhtpghnohhnpggruhhhpghuphhgrhgruggvrdhfrghilhdpthgvshhtpghs
    hhhorhhtlhhoghgpfhhorhhmrghtrdhfrghilhdpthgvshhtpghshhhorhhtlhhoghgplh
    gvnhhgthhhrdhfrghilhdpthgvshhtpghmrgigpghlihhnvggplhgvnhhgthhhrdhfrghi
    lhdpthgvshhtpggtvhgvpghtrghgpghfohhrmhgrthdrfhgrihhlpdhtvghsthgpphgrth
    gthhgpmhgrlhhfohhrmhgvuggptghonhhtvgigthdrfhgrihhlpdhtvghsthgpphgrthgt
    hhgpthhrrghilhhinhhgpgifhhhithgvshhprggtvgdrfhgrihhlpdhtvghsthgpshhigh
    hnvggupghofhhfpggshigpphhrvghsvghntggvrdhfrghilhdpthgvshhtpghuphhsthhr
    vggrmhgpshhtrghtuhhspghprhgvshgvnhgtvggpfhhorhhmrghtrdhfrghilhenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgs
    rghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepthhgrghmsghlihhnsegsrgihlhhisghrvgdrtghomhdprhgtphhtthho
    pehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguug
    gvugdrohhrghdprhgtphhtthhopeihohgrnhhnrdgtohhnghgrlhesshhmihhlvgdrfhhr
X-ME-Proxy: <xmx:Ur8KauaXEkgSCRfbS-z0bf734hOuWQplFkjFAXT2FJB4iMTkFKIweQ>
    <xmx:Ur8KaoTMzEr95vCZOHsXLIwn6C3AkPEmScI_jfwgSyLbd3wJ9JMhcQ>
    <xmx:Ur8Kal4tM-WoDaROQF2QUo_jwU2IDvqlF22P74YcBe15GuGZfyFSIA>
    <xmx:Ur8KatzOB1bWaMYr-AZh4JindEqVBsfSnNnucpFbCCERva-zmpeGIw>
    <xmx:Ur8KarinR-MnJaS8zU0lUp-XVmkw4fwZbtWWgStWCiLEr4NP8c0RJeWa>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 May 2026 03:27:13 -0400 (EDT)
Message-ID: <545a0006d99223f869d13bd5370837ba58474d8a.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH 00/11] patchtest: improve testing coverage
From: Paul Barker <paul@pbarker.dev>
To: Trevor Gamblin <tgamblin@baylibre.com>, 
	openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Date: Mon, 18 May 2026 08:27:11 +0100
In-Reply-To: <20260514194207.1958325-1-tgamblin@baylibre.com>
References: <20260514194207.1958325-1-tgamblin@baylibre.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Xig7DPq2a5wuzUnA1iON"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 07:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237204


--=-Xig7DPq2a5wuzUnA1iON
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-05-14 at 15:41 -0400, Trevor Gamblin wrote:
> Make changes to the patchtest script, helper modules, test suites, and se=
lftest
> files to address various shortcomings with the current version, including=
:
>=20
> - Re-enable the previously included mergeability tests, which have been b=
roken
>   since prior to the 2023 Yocto RFQ
> - Improve series testing by fixing signal handling and return code logic =
for the
>   '--directory' flag, and by making it possible for patchtest to report t=
he
>   shortlog for failing commits when testing series as single files
> - Make branch checking for merge tests more robust but retain flexibility=
 for
>   the selftest suite, and so that users can test series against branches =
other
>   than the target one
> - Add new tests for malformed lines and whitespace in the TestPatch modul=
e
> - Refactors across the entire suite to remove dead code, simplify logic, =
and
>   update selftest files
> - Expand the selftest file suite for all of the new cases added, bringing=
 us
>   from 38 to 51 selftests.
>=20
> Before:=20
>=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > Testsuite summary for patchtest
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > # TOTAL: 38
> > # XPASS: 18
> > # XFAIL: 18
> > # XSKIP: 2
> > # PASS: 0
> > # FAIL: 0
> > # SKIP: 0
> > # ERROR: 0
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> After:
>=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > Testsuite summary for patchtest
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > # TOTAL: 51
> > # XPASS: 25
> > # XFAIL: 26
> > # XSKIP: 0
> > # PASS: 0
> > # FAIL: 0
> > # SKIP: 0
> > # ERROR: 0
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> As always, there's lots of room for patchtest to grow further (I'd still =
very
> much like to convert it to a standalone Python tool one day). However, th=
is is
> already a sizeable rework, and it should bring immediate benefit to anyon=
e using
> it. I've made a point to label each individual patch appropriately, but f=
or
> emphasis this work has been done in tandem with the Claude AI, specifical=
ly
> Sonnet 4.6 and 4.7.=20
>=20
> Given the skepticism that many of us have towards AI tooling, I made a po=
int to
> do a review of the changes Claude had made myself before performing the f=
inal
> squash and rebase. This did reveal some bloat that I've since removed, bu=
t for
> the most part it made functional and useful changes. The selftest suite w=
as
> routinely triggered locally to ensure it didn't cause any bizarre regress=
ions,
> and new selftest files were added immediately for new test cases (or, in =
the
> case of the mergeability tests, refactored so that they were no longer la=
beled
> as skips). I've also made a point to pull patch series at random from the
> mailing list and test directly.
>=20
> Parts of this series (such as the '--directory' usage improvements) were =
written
> to address the needs of folks at Smile. Others address one or more outsta=
nding
> bugs in Bugzilla, which I haven't consistently labeled as such (but I'll =
close
> them when this gets merged). The next priority will be to improve the act=
ual
> deployment of the Patchtest service on the Yocto Project infrastructure.
>=20
> Trevor Gamblin (11):
>   patchtest: check for meta-selftest, cleanup script
>   patchtest: test series mergeability
>   patchtest: tests: cleanup test suites
>   patchtest: correctly abort --directory test
>   patchtest: fix branch applicability reporting
>   patchtest: test_patch: improve patch-specific tests
>   patchtest: test_mbox: skip cover letters
>   patchtest: mbox.py: improve 'From' line matching
>   patchtest: selftest: stop if patchtest fails
>   patchtest: selftest: rework test files
>   patchtest: selftest: extend test file suite
>=20
>  meta/lib/patchtest/mbox.py                    |  56 ++---
>  meta/lib/patchtest/patchtest_parser.py        |   2 +-
>  meta/lib/patchtest/patchtest_patterns.py      |   5 +
>  meta/lib/patchtest/repo.py                    |  48 +++++
>  ...x.pretest_series_applies_on_branch.1.pass} |  22 +-
>  ...x.pretest_series_applies_on_branch.2.fail} |   0
>  .../TestMbox.test_bugzilla_entry_format.fail  |   5 +-
>  .../TestMbox.test_bugzilla_entry_format.pass  |   5 +-
>  ...TestMbox.test_commit_message_presence.fail |   5 +-
>  ...TestMbox.test_commit_message_presence.pass |   5 +-
>  ...tMbox.test_commit_message_user_tags.1.pass |   5 +-
>  ...tMbox.test_commit_message_user_tags.2.pass |   5 +-
>  ...estMbox.test_commit_message_user_tags.fail |   5 +-
>  .../files/TestMbox.test_mbox_format.pass      |   5 +-
>  .../files/TestMbox.test_non_auh_upgrade.fail  |  25 +++
>  .../files/TestMbox.test_non_auh_upgrade.pass  |  25 +++
>  .../files/TestMbox.test_shortlog_format.fail  |   5 +-
>  .../files/TestMbox.test_shortlog_format.pass  |   5 +-
>  .../files/TestMbox.test_shortlog_length.fail  |   5 +-
>  .../files/TestMbox.test_shortlog_length.pass  |   5 +-
>  ...estMbox.test_signed_off_by_presence.1.fail |   5 +-
>  ...estMbox.test_signed_off_by_presence.2.fail |   5 +-
>  .../TestMbox.test_signed_off_by_presence.pass |   5 +-
>  .../TestMbox.test_target_mailing_list.1.fail  |  26 +++
>  .../TestMbox.test_target_mailing_list.2.fail  |  24 +++
>  .../TestMbox.test_target_mailing_list.pass    |  25 +++
>  .../TestMetadata.test_max_line_length.fail    |  26 +++
>  .../TestMetadata.test_max_line_length.pass    |  25 +++
>  .../files/TestPatch.test_cve_tag_format.fail  |   5 +-
>  .../files/TestPatch.test_cve_tag_format.pass  |   5 +-
>  ...estPatch.test_patch_malformed_context.fail |  38 ++++
>  ...estPatch.test_patch_malformed_context.pass |  38 ++++
>  ...tPatch.test_patch_trailing_whitespace.fail |  38 ++++
>  ...tPatch.test_patch_trailing_whitespace.pass |  38 ++++
>  ...TestPatch.test_signed_off_by_presence.fail |   5 +-
>  ...TestPatch.test_signed_off_by_presence.pass |   5 +-
>  ....test_upstream_status_presence_format.fail |  61 ++++++
>  ....test_upstream_status_presence_format.pass |  62 ++++++
>  meta/lib/patchtest/selftest/selftest          |  25 ++-
>  meta/lib/patchtest/tests/base.py              | 117 ++++------
>  meta/lib/patchtest/tests/test_mbox.py         |  56 +++--
>  meta/lib/patchtest/tests/test_metadata.py     | 112 +++++-----
>  meta/lib/patchtest/tests/test_patch.py        | 113 ++++++++--
>  .../lib/patchtest/tests/test_python_pylint.py |   8 +-
>  scripts/patchtest                             | 200 +++++++++---------
>  45 files changed, 904 insertions(+), 406 deletions(-)
>  rename meta/lib/patchtest/selftest/files/{TestMbox.test_series_merge_on_=
head.1.skip =3D> TestMbox.pretest_series_applies_on_branch.1.pass} (66%)
>  rename meta/lib/patchtest/selftest/files/{TestMbox.test_series_merge_on_=
head.2.skip =3D> TestMbox.pretest_series_applies_on_branch.2.fail} (100%)
>  create mode 100644 meta/lib/patchtest/selftest/files/TestMbox.test_non_a=
uh_upgrade.fail
>  create mode 100644 meta/lib/patchtest/selftest/files/TestMbox.test_non_a=
uh_upgrade.pass
>  create mode 100644 meta/lib/patchtest/selftest/files/TestMbox.test_targe=
t_mailing_list.1.fail
>  create mode 100644 meta/lib/patchtest/selftest/files/TestMbox.test_targe=
t_mailing_list.2.fail
>  create mode 100644 meta/lib/patchtest/selftest/files/TestMbox.test_targe=
t_mailing_list.pass
>  create mode 100644 meta/lib/patchtest/selftest/files/TestMetadata.test_m=
ax_line_length.fail
>  create mode 100644 meta/lib/patchtest/selftest/files/TestMetadata.test_m=
ax_line_length.pass
>  create mode 100644 meta/lib/patchtest/selftest/files/TestPatch.test_patc=
h_malformed_context.fail
>  create mode 100644 meta/lib/patchtest/selftest/files/TestPatch.test_patc=
h_malformed_context.pass
>  create mode 100644 meta/lib/patchtest/selftest/files/TestPatch.test_patc=
h_trailing_whitespace.fail
>  create mode 100644 meta/lib/patchtest/selftest/files/TestPatch.test_patc=
h_trailing_whitespace.pass
>  create mode 100644 meta/lib/patchtest/selftest/files/TestPatch.test_upst=
ream_status_presence_format.fail
>  create mode 100644 meta/lib/patchtest/selftest/files/TestPatch.test_upst=
ream_status_presence_format.pass

Hi Trevor,

This is a difficult series to review, there are a lot of changes and
several of the patches do more than one thing. Patches 1 & 2 are
especially busy, and patch 6 both adds new tests and fixes existing
tests - these should be separated into multiple commits that each do one
thing.

Is it possible to break this apart into a couple of separate patch
series? That would make review significantly easier. Perhaps start with
an initial series which just includes bugfixes and cleanup of existing
test cases, then once that is merged send a second series which adds new
test cases.

Best regards,

--=20
Paul Barker


--=-Xig7DPq2a5wuzUnA1iON
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCagq/TxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bpplAP49HEnwBIX/RJppfCo/8QbvbD2Vsy7Pvanv
zgVr92YOawD+Ke0pZGftqm3vV7ad9N4e8WlaJ6yOCPqkN2kBdfz08gQ=
=Cibw
-----END PGP SIGNATURE-----

--=-Xig7DPq2a5wuzUnA1iON--

