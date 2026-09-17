Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E476C88E72
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 12:51:43 +0000 (UTC)
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38899.1789649501001998502
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 05:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=An7lor6g;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=mz9mY9u+;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id E5FC21D00065;
	Thu, 17 Sep 2026 08:51:39 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Thu, 17 Sep 2026 08:51:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789649499;
	 x=1789735899; bh=n4HYDN+afUKijnPEjyrysOEpIaC107aNP3lWb33WP9g=; b=
	An7lor6gaHRtJbWK0aFcY6mLXAiZaXdz67cAqau5BsYhgEhyvVCwnx82oYK0zDtP
	v2FOKoVDo0LF5bsvBZvbvPGbLZxuMTHxwsf2NDoVH1nQtxD6KckZRoJQ9BMJ+dgE
	VpH+8j8/P+NcD5ko2jOnLS1wmKOaAWerTt0Mx1b9h2fK7rjZBi6MO4Av/VLfqTeZ
	1cgKZAa/yLbzZXJwxsww3lr7fLyZriPqIkJRXQ0sxBxfttiL+PNsHjm8MFVMQsSV
	JIqu6qDaPaLHnxJgumjViuNkf8OvVXc2l4DIBn50eP3Ton3LjUm3T5X+K5WnpdnR
	8ZV2EmcWhLcwh5T24CP2Zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789649499; x=1789735899; bh=n
	4HYDN+afUKijnPEjyrysOEpIaC107aNP3lWb33WP9g=; b=mz9mY9u+w0GmmvSOy
	YfOzb0rKAnBYKpsxKPlHICNP/ZOET/8bzrRLOHtw8uij8qUl3PptfDWX2x9Y1qcI
	zpfn+xrV1wWkPeyrOJASgosYGES9ViiAC67l2ECuZeKNSmKroUFNlq2sEnFH0dYM
	iENoTFopZ+heBnSjoWTCO2uChzu+3zIbV2JmrVTeJjC8frgRXwH+FGym1bxcoLzj
	Ty5NqOaWeXqyURCNnJ0ZSR1DIVG/Ay08k2mcBAgCeyDRs4YEaqQBycBsubIzx/5v
	QcKdDSHpdPbsRO5xego0kJX9jTdZmdrsxJx/yc6LupKI6fgeooJhX2vR29AROfxg
	CAR1g==
X-ME-Sender: <xms:W-KragSkyYhQMT7jW_EdbRsCZtjhzblwpm6yFuSwtPOvVwaB06x85A>
    <xme:W-KralNluMTbqlQt0mESen75evCa011P2ZLWJMKQV2exhHBe_4hC1XWvqTdkcGxMw
    TO4aR9LwRVW8si0Odrd-uCeanJLU4cvgsRN37W7UIq7byJd6WKYcYmo>
X-ME-Received: <xmr:W-KrarO-jQSv_jk1XPnZOYcO99Df6Ns39_l0uQprNlFaWOpLQ8gybONV8osbBSLAWnF0d0uLuN20Ue-VbxrsMLWZTlBwXQzAbKYwLFQ>
X-ME-Proxy-Cause: dmFkZTG346lI9QGr82yVFp4aYh7f3E9wvD6zliTkt1/kwrnjWPEkgrPf4UfdiITuWz5aNv
    P50e9NqG0we2A2wSWkDuT0gFaQSQTbU/4kXJhaNYj2Cn8SAcrFq+IOf2DsbEr43jozbrO/
    dYKqLuYlxF2Adv4hLgo0OHum2nNFCG2I8NqnaPg6ySmJg4FrCiD/dd28cs354WMXO2XrgO
    QNBtEYZAO1HQAsgKzCrozGRTpJser+THmV14mREJVcNoRLjmuIbHaOa24uWPUidtDkDST4
    lyGacLlF5caxP/trPESjXK4OMtySt4cSlGOXNXtC53EQ271wJ96akbyBF95zC5VVTod2lO
    4zkJ1mnIJ3y0jWwLGfGOOeROfmVVxBzqyYVz/x62O6T1J+KLAfPkKQ9tNMbRAwQioygR/a
    nYIp4XHZy+9ytiRFmpBYsyroFzh2KrWPJZ5Sy48HT5igBsZlYC0ssqXSbo/EddPhHlmpyA
    Xo74VNKRaEpPsgX6251S2/Xy87wEMrKVhZjlbkfKXWDcuGjfHLxvDJeQbAfD3bKCMoKqGg
    IZbFB2BaF0JmYHUCo3V/SmX0nLvzyYphRMaBuQM0Mhf4gHtEjMUpm7xSLFtj7CPNw+WFvb
    /slV7fhbf0RWQAeItj/SZKTPLXkWcnQCUP/9LIZmfihN1QP4Lp6aif1Xyq1w
X-ME-Proxy: <xmx:W-KratuHfTlrqwv5qiuBHWsNNNeG_QATln5xBNrZdKEj36CrcFSe7Q>
    <xmx:W-KratUVx9QOOYmgmxkWqWqDB3_PiiyVn5c85FnG8rDUEORBIt_Cog>
    <xmx:W-KratsqT1f9r6WtWXuMeKaF5fiu8nlStcXAJXxfzDb_lf8t5m-Xkw>
    <xmx:W-KrahUL7SYQylwBu1xmh1fw7B3il8mupOS_XOsX_mWIwxCeKc4RUw>
    <xmx:W-Kragc6VEvRGTYFccYGjhcFkGlG9SCOy53JElZ3O4W7dhs7XCrW65l9>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Sep 2026 08:51:38 -0400 (EDT)
Message-ID: <9faaa5bbc70d619058d8abecda9cd235d210d422.camel@pbarker.dev>
Subject: Re: [OE-core][wrynose][patch] rsync: Security fixes from
 v3.4.1-sec-patches3
From: Paul Barker <paul@pbarker.dev>
To: Yoann Congal <yoann.congal@smile.fr>, vanusuri@mvista.com, 
	openembedded-core@lists.openembedded.org
Date: Thu, 17 Sep 2026 13:51:37 +0100
In-Reply-To: <DLHLDE6HLTRH.2AFGSZ80URG52@smile.fr>
References: <20260917105551.76512-1-vanusuri@mvista.com>
	 <DLHK8G1OWTE8.394FSK4TR0VS5@smile.fr> <DLHLDE6HLTRH.2AFGSZ80URG52@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 12:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246064

On Thu, 2026-09-17 at 14:31 +0200, Yoann Congal wrote:
> On Thu Sep 17, 2026 at 1:38 PM CEST, Yoann Congal wrote:
> > On Thu Sep 17, 2026 at 12:55 PM CEST, Vijay Anusuri via lists.openembed=
ded.org wrote:
> > > Backport the security fixes from the upstream v3.4.1-sec-patches3
> > > branch to address the known rsync security vulnerabilities.
> > >=20
> > > The v3.4.1-sec-patches3 branch contains 239 commits. The GitHub
> > > workflow commits (037, 038, and 160), which only modify
> > > .github/workflows files, and the testsuite-only commits (238 and
> > > 239) are excluded because they are not applicable to the Yocto
> > > build.
> > >=20
> > > The remaining 237 security fixes are combined into a single patch
> > > series and applied on top of the rsync 3.4.1 source.
> > >=20
> > > SUSE has also backported these security fixes to rsync-3.4.1-160000.6=
.1
> > > to address the corresponding CVEs.
> > >=20
> > > References:
> > >=20
> > > https://rsync.samba.org/security.html
> > > https://github.com/RsyncProject/rsync/tree/v3.4.1-sec-patches3
> > > https://bugzilla.suse.com/show_bug.cgi?id=3DCVE-2026-53802
> > >=20
> > > This fix handles CVE-2025-10158 CVE-2026-29518 CVE-2026-43617 CVE-202=
6-43618 CVE-2026-43619 CVE-2026-43620 CVE-2026-45232 CVE-2026-44507 CVE-202=
6-44508 CVE-2026-44509 CVE-2026-44510 CVE-2026-53783 CVE-2026-53784 CVE-202=
6-53785 CVE-2026-53786 CVE-2026-53788 CVE-2026-53789 CVE-2026-53790 CVE-202=
6-53791 CVE-2026-53792 CVE-2026-53793 CVE-2026-53794 CVE-2026-53795 CVE-202=
6-53796 CVE-2026-53797 CVE-2026-53798 CVE-2026-53799 CVE-2026-53800 CVE-202=
6-53801 CVE-2026-53802 CVE-2026-53803 CVE-2026-70452 CVE-2026-70453 CVE-202=
6-70454 CVE-2026-70455 CVE-2026-70456 CVE-2026-70457 CVE-2026-70458 CVE-202=
6-70459 CVE-2026-70460 CVE-2026-70461 CVE-2026-70462 CVE-2026-70463 CVE-202=
6-70464
> > >=20
> > > Dropped CVE-2025-10158.patch
> > > Refreshed the patch 0001-Add-missing-prototypes-to-function-declarati=
ons.patch
> > >=20
> > > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > > ---
> > >  ...-prototypes-to-function-declarations.patch |    81 +-
> > >  .../rsync/files/CVE-2025-10158.patch          |    36 -
> > >  .../files/rsync-3.4.1-sec-patches3.patch      | 34052 ++++++++++++++=
++
> > >  meta/recipes-devtools/rsync/rsync_3.4.1.bb    |     2 +-
> > >  4 files changed, 34071 insertions(+), 100 deletions(-)
> > >  delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2025-10158.=
patch
> > >  create mode 100644 meta/recipes-devtools/rsync/files/rsync-3.4.1-sec=
-patches3.patch
> >=20
> > Hello,
> >=20
> > I don't think I want to carry a 34000 lines patch.
> >=20
> > Does the rsync project released a v3.4.1-sec-patches3 archive?
> >=20
> > If not, can we try to switch the recipe to git and point SRCREV to the
> > "rsync-3.4.1-sec-patches" branch?
> > Since the recipe is not git-based now, we'll need to switch to git
> > first, then upgrade.
>=20
> Paul asked a good question about this idea though: How official is this
> branch?
> Can you ask upstream the status of it? Will it stay published? Will we
> see v3.4.1-sec-patches4,5... branches someday?

Hi Yoann, Vijay,

Some thoughts here...

The upgrade to v3.4.3 was rejected [1] due to a few minor feature
additions. In this case it may be lower risk to take an upgrade rather
than backporting a 34 kLOC patch. I think we should avoid v3.5.0 due to
the number of regressions reported [2]. v3.4.4 is an option. We can then
see how many CVEs remain open and decide what to do about them.

The onus here is on contributors, not on Yoann as stable maintainer. To
go ahead we would need some investigation, testing and a proposal to the
TSC to approve the update as an exception to our usual stable policy.

[1]: https://lore.kernel.org/all/DL0HY2YT9WGM.3ACOQJL408XKI@smile.fr/
[2]: https://github.com/RsyncProject/rsync/issues?q=3Dis%3Aissue%20%223.5.0=
%22

Best regards,

--=20
Paul Barker


