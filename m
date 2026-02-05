Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC7FE91293
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 08:50:30 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16478.1770281426122818328
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 00:50:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LcrOxsme;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 093E8C243A8;
	Thu,  5 Feb 2026 08:50:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 053C0606FD;
	Thu,  5 Feb 2026 08:50:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD646119A8891;
	Thu,  5 Feb 2026 09:50:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770281423; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UHegEK2qftb4WGJkRW8JsAHyX0HlwUw32oYSeAAQ/GM=;
	b=LcrOxsme53e+441/7Z2TWjSj7xwjgeF3aef5eGxxReeDr4bVNjpkX6c7fmkRa0F0kRXtaD
	xg9hZ1Dw2D3koieglOwZNZObGJ7eeOjIrp3bs3Aq8j2BacZKdXexoxdQyBlqdUQdVhZrUv
	8BJbOqStPpkV7h/oTlO4AzxFc98yH+OiXAn7Q+Puung85nSLYUeSGvppDnL8/BAZasQ0vT
	GPGUJqBK/w+IjpHMREl4D6spBLJVfSjnOUj6h05wBsByp1Jn8nIScbyssb/NYQn9gPd/xF
	qi0sKJbsdU3lnlTX9iVz3uV3tVwKxH9QEpP6583qO0+47X4AJVSe5cc1DTEnag==
From: Benjamin ROBIN <benjamin.robin@bootlin.com>
To: Ross Burton <Ross.Burton@arm.com>, Joshua Watt <jpewhacker@gmail.com>
Cc: 
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 openembedded-architecture <openembedded-architecture@lists.openembedded.org>
Subject: Re: Comparing cve-check with sbom-cve-check
Date: Thu, 05 Feb 2026 09:50:21 +0100
Message-ID: <2051957.usQuhbGJ8B@brobin-bootlin>
In-Reply-To: 
 <CAJdd5GbqsCVjVDkLFFbpzihurQxHxTrAGjA_K1OGNPTHj=gakw@mail.gmail.com>
References: 
 <2CD10DD9-FB2A-4B10-B98A-85918EB6B4B7@arm.com>
 <CAJdd5GbqsCVjVDkLFFbpzihurQxHxTrAGjA_K1OGNPTHj=gakw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 08:50:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230566

Hello,

On Thursday, February 5, 2026 at 12:54=E2=80=AFAM, Joshua Watt wrote:
> Yes, I agree this should be the strategy for handling CVEs. It would
> also be really good to get this in before the LTS

Targeting Wrynose (around April 2026) is ambitious, but it might be feasibl=
e.

> I'm working on some changes to SPDX that I think will help with this.
> Specifically, I'm adding "Package" objects to describe recipes. This
> allows the recipes to be linked as build time dependencies
> independently of the build provenance (which does the same thing, but
> for builds). The data in the recipe package will contain only data
> that can be statically determined without actually building the
> recipe, so it will give us the avenue to do CVE analysis without
> actually building anything[1]. This should allow CVE analysis on the
> native and static libraries since they will be included as build time
> dependencies, even though they don't appear in the final image.

Thank you for working on this. I have a couple of requests:
 - It would be helpful to distinguish between native and target packages.
   The goal is to support a flag in `sbom-cve-check` that limits analysis t=
o=20
   packages deployed in the target (including static dependencies) or exten=
ds
   it to all components.
 - If possible (though not a priority), including layer information
   (URL, Git version, etc.) associated with a `build_Build` object would be
   valuable.
=20
> [1]: Sadly, it _can't_ include license information because
> NO_GENERIC_LICENSE means you can have license text that you don't know
> until after do_unpack; we should consider doing something about that.
>=20
> On Wed, Feb 4, 2026 at 10:31=E2=80=AFAM Ross Burton <Ross.Burton@arm.com>=
 wrote:

> > To summarise [5] the pros and cons:
> > + sbom-cve-check can run at any point after the build
> > + has better data sources which report more issues

"Better" might be too strong, we support *more* data sources.
Sometimes, version ranges in the CVE List are incorrect, while the NVD=20
database may provide more accurate information. However, users can configur=
e=20
their preferred data sources via a custom configuration file, so this isn=
=E2=80=99t a=20
major concern from my perspective.

> > - only scans the literal packages that are in a final image, so we don=
=E2=80=99t
> > get coverage of native packages or static linkage
> >=20
> > I wonder if the easiest fix for this gap is to enhance the SPDX generat=
ion
> > to not only generate an =E2=80=9Cimage SPDX=E2=80=9D but also a =E2=80=
=9Cbuild SPDX=E2=80=9D, which is
> > essentially an aggregation of every recipe=E2=80=99s SPDX that is prese=
nt. A
> > recursive execution of the SPDX generation task will mean this covers
> > both any native tools and static libraries that are in the dependency
> > graph, for maximal coverage.
> >=20
> > This gives a solution without needing to be more clever in the image SP=
DX
> > generation, for example including packages for all of the build
> > dependencies (be them native or target).

I agree with Joshua: improving the SPDX SBOM file is the right direction.

> > If this is done then I think sbom-cve-check is at least at parity with
> > cve-check, and in many ways far superior. This will allow us to merge t=
he
> > few recipes and class from meta-sbom-cve-check into core, and delete
> > cve-check.

I concur, but we (Joshua?) need to tackle the SPDX generation improvements,=
=20
which is no small task. On my end, I=E2=80=99ll update `sbom-cve-check` to =
handle=20
these changes properly.

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




