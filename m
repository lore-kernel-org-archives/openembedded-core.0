Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E72C61DC4
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 14:24:15 +0000 (UTC)
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37295.1787840646548083862
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 07:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=LHC2kFPB;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=ib1eBhyY;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 94037EC0217;
	Thu, 27 Aug 2026 10:24:05 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Thu, 27 Aug 2026 10:24:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787840645;
	 x=1787927045; bh=VEf1FNhTCDUrF7+LkZUHqLjthRbzTFP4IJCkbjbh5w4=; b=
	LHC2kFPBuynN8mvGy1fi8aEycqzp5dEwafygp5JnNIhX7jamWCn+aEIUysc8pwkx
	txcEamXWfc6gC9Qj3BseNmFYWHyn1QFFpGV+5BHiIt2Zl7prGuqIKpYL3mzullTE
	pjvc4Ks4na7JGnF5KCdWfoS/Kwh7b1L11Toi3L05CNfz/nBgMx93phyBDQIvHWkM
	a4TS4TJBFOdZau/wCPzijZ3v9biip+B+mTeDhTbAONSi8RvSnpSkmzDXRbzFICQI
	lf1PWmbAiqiog20+n3UAQIt8IPLTxDVAbonZK6k7OI1SZc0QsptBhCmTQYm40+jG
	X45fH9eGQZIkCnCXcku70Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1787840645; x=1787927045; bh=V
	Ef1FNhTCDUrF7+LkZUHqLjthRbzTFP4IJCkbjbh5w4=; b=ib1eBhyY03ETvYVsY
	MMkCYw7nwDg0wfp/fOw599n4cY+LXsxwStbzFB2ME9P3hl9u1LJF0VhB2LZUIsW4
	tOpjhjU0jJ9ElY8kE3ErOmVfPnrfLgXWJQjq4Osp6wFddKP82bhiT+SxElz+rede
	aFbx0DHt0mN+vKOeGo4pkLNza5t9PljGqQdZCz267BgUPbSEjUklzb566tUQSLDL
	I7Kgbij/hhIPflKQvSPBqXpf6ZrUm9bOKSOEugvNSnwDuVAdafVJkQOg4UDiQgwh
	eWw6ABjemFJ9+ix9rSGj/7oBw51CVOk3rIFRk8RmkktpufvRuqOinESwr5pLD6PJ
	wkCxw==
X-ME-Sender: <xms:hUiQamsmVhnUu4B5RholNu0NY5v3eK3J-7aD5Qx-T7bH1lBgmoizbA>
    <xme:hUiQahcdaj2yOci8jDIlvi2MBVGrJEN83EPRHsOP3aY2L5yIRLK49U7SiqnyVSn-j
    s2mJszLXxz3qZ0nQkCvygFPtwWvP-ByXMRLwuGTYltlf68puP3L_r8>
X-ME-Received: <xmr:hUiQavYCznOaZcFC7ALaX7afpH0RYcrTb7MHCIqsV-F0UJiE9uAOi0T8NbWlp9MGWek7H7JK6pq7tGYPNKsoWFvmKnD0mdMeYs9mBQw>
X-ME-Proxy-Cause: dmFkZTGPB9k6TVh5Pen6LZxBVQPspT2D6oXGZjF6neZcwuAIolIGZXcTJi+8mQ7qirBzCa
    MWmMKyGin4BOSAr/HyDjPJHhfaW3If4ID7B1JcWmcvp8UNwwzwAJpRue6BZyhnyBIdKdpw
    9bYS0k+siu6mUzG52ETFnhfhTRm03guSaya1ROmgGILIZSBKYjkXxIMbdA3/x5DMl8wRVu
    s2omvyK+lYfGi+xS8w2l9S+f3XgmEgp3wq6vxnM5MakEt/vTFEHgvITGKW9Bf35t00Krlt
    qxUAxn4KAeGavcreVbva/cGGIx56zyUGCsZRR9QrZgOywpHn41BR0FkelrlJIUYN2Wckgj
    zy5otG0NS0Au3jAzPOu6gSGnc+nLW1+QWNE8qcCNPiYtdVUN1tndrWJ1pzxyPSViHWWqVt
    bYFdT+butoCSpM90RIGN8bJO6z+QHMD1hOjCn1SLX8EQWqEpnvjgC1ldqxgOkbVUThLrvR
    yyaWraMOzQdvaqzU76Rrk7l1IUjQzdX/nQcfoLcrUEBbJW4otDRHdpRuiiOGSx0o3Fetvu
    2MFndwA7PcdC2Vezbs0u0KaBY9ys+0ywJbgThcpxL+WGfwu8rBjFQ/0yOG0QzsubGFBeNE
    4rOnzGzcke1z9TxTOkHMOHBunOAuOEWydwD2sRNnt0nOYR2hUs11Vir5y24A
X-ME-Proxy: <xmx:hUiQasWPApxt77cj-aylkSBLfGQpadLZ-IiKPS6hFwGCqguopjyUhw>
    <xmx:hUiQapiypAPOUxrzqss5OsimQClQvDg3smbbcDqXY-exHkc0NNh0lQ>
    <xmx:hUiQaiWGTJf67ZUa7MHmdoIfONEwdQROkBiw3QwRbUVeQPDaA2ghxA>
    <xmx:hUiQaoMOy8fQ4SKfRjBZ7so-IwJCTvBt2ZS-TDpozdwtr93bjn9UQw>
    <xmx:hUiQale0HP88ub60UyU6UZuI69PMb68AVEJjI5PYIfNmqErf98oi_jag>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Aug 2026 10:24:04 -0400 (EDT)
Message-ID: <6aad1ce63d1f75e5d5cde45b2691ac68151762ce.camel@pbarker.dev>
Subject: Re: [PATCH] binutils: correct CVE_PRODUCT mapping
From: Paul Barker <paul@pbarker.dev>
To: Devansh Patel <devanshp@cisco.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2026 15:24:03 +0100
In-Reply-To: <2789044.1787834827643066647@lists.openembedded.org>
References: <20260824110156.25702-1-devanshp@cisco.com>
	 <82653ab103f8116bfb0a9a675cf9d7f38a92a588.camel@pbarker.dev>
	 <2789044.1787834827643066647@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 14:24:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244494

On Thu, 2026-08-27 at 05:47 -0700, Devansh Patel wrote:
> On Wed, Aug 26, 2026 at 02:32 PM, Paul Barker wrote:
>=20
> >=20
> > On Mon, 2026-08-24 at 04:01 -0700, Devansh Patel -X (devanshp - E
> > INFOCHIPS PRIVATE LIMITED at Cisco) wrote:
> >=20
> > > From: Devansh Patel <devanshp@cisco.com>
> > >=20
> > > The current "binutils" mapping generates a vendor-wildcard product
> > > identity for the packaged GNU Binutils source.
> > >=20
> > > Use "gnu:binutils", which matches the active NVD dictionary CPE, NVD
> > > configuration criteria, and CNA affected data for the Sourceware proj=
ect.
> > >=20
> > > This changes the generated identity from
> > > cpe:2.3:*:*:binutils:2.47:*:*:*:*:*:*:* to
> > > cpe:2.3:*:gnu:binutils:2.47:*:*:*:*:*:*:*, but sbom-cve-check 1.3.3
> > > with the frozen 2026-08-10 databases has no current CVE report delta.
> > >=20
> > > Signed-off-by: Devansh Patel <devanshp@cisco.com>
> > > ---
> > > meta/recipes-devtools/binutils/binutils_2.47.bb | 2 ++
> > > 1 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/meta/recipes-devtools/binutils/binutils_2.47.bb
> > > b/meta/recipes-devtools/binutils/binutils_2.47.bb
> > > index 79bcac2025..798d886614 100644
> > > --- a/meta/recipes-devtools/binutils/binutils_2.47.bb
> > > +++ b/meta/recipes-devtools/binutils/binutils_2.47.bb
> > > @@ -1,6 +1,8 @@
> > > require binutils.inc
> > > require binutils-${PV}.inc
> > >=20
> > > +CVE_PRODUCT =3D "gnu:binutils"
> >=20
> > Hi,
> >=20
> > We have a default CVE_PRODUCT value so that we don't have to manually
> > maintain mappings in every recipe. Per-recipe CVE_PRODUCT assignments
> > are useful when the default mapping either misses CVEs or matches
> > unrelated CVEs.
> >=20
> > In this case you say there is no CVE report delta between having this
> > CVE_PRODUCT assignment and not having it - so is there any reason it is
> > needed?
>=20
> Hi Paul,
>=20
> Thanks for the feedback. I wanted to clarify the broader intention
> behind these CVE_PRODUCT updates, as there are two related use cases
> we are trying to address.
>=20
> CVE_PRODUCT is used for both CVE report generation and for deriving
> the CPE identity exposed in the SPDX SBOM. The default ${BPN}-based
> mapping can be sufficient for CVE matching when the recipe and NVD
> product names already align, which is why in some of these patches
> there is no immediate CVE report delta.
>=20
> However, from the SBOM perspective, product-name-only matching can
> still leave the vendor unspecified. Since this CPE identity is exposed
> in the SPDX 2.3/3.0 output and consumed by downstream security
> tooling, we want the SBOM to carry an explicit and accurate upstream
> component identity rather than relying on an implicit vendor-wildcard
> mapping.
>=20
> The "no CVE report delta" in these patches was therefore intended as a
> regression check, not as the motivation for the change: it confirms
> that making the identity more specific does not lose currently
> reported CVEs.
>=20
> This is also an evolution of the earlier discussion around CVE_PRODUCT
> [1]. Initially, the focus was on cases where the recipe name did not
> correspond to the vulnerability product name and explicit mappings
> were needed to avoid missed CVEs. We are continuing that same work but
> also covering the second consumer of this metadata: the SBOM. In older
> flows such as Scarthgap, CVE reporting and SPDX generation are
> separate consumers of the recipe metadata. In Wrynose, cve-check has
> been replaced by sbom-cve-check, where the generated SPDX itself is
> used as input to the CVE analysis. So, maintaining an accurate
> component identity in the SBOM is increasingly part of the CVE
> reporting path itself.
>=20
> So, the overall goal is to keep CVE_PRODUCT accurate for both
> purposes: complete CVE correlation and an unambiguous vendor/product
> identity in the generated SPDX SBOM, while preserving any aliases
> required for valid CVE coverage.
>=20
> [1] https://lists.openembedded.org/g/openembedded-core/topic/118935618

Hi Devansh,

The commit messages for these changes make no mention of the SBOM
output. Commit messages need to explain *why* a change is proposed. So
from the patches you sent I could only infer that this was solely about
CVE matching accuracy.

CVE_PRODUCT assignments have so far been used when the default leads to
either CVEs being missed, or unrelated CVEs being matched. We haven't
carried CVE_PRODUCT assignments purely for SBOM accuracy. I don't really
have the context to understand if this is required or not - I think we
need some discussion and input from others here. Could you send an email
to the openembedded-architecture list to discuss the need for additional
CVE_PRODUCT assignments before sending further patches like this?

Best regards,

--=20
Paul Barker


