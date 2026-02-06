Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685F1EE20B5
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 16:15:14 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.935.1770394505934545708
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 08:15:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Q8KyG/rA;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C4FA84E42332
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Feb 2026 16:15:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9407F60729;
	Fri,  6 Feb 2026 16:15:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1455119D2062;
	Fri,  6 Feb 2026 17:15:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770394503; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=76ts84wT5ghkSYCY4LHEhfOyltC5jm+ZIB03jixNeiw=;
	b=Q8KyG/rAVZgcen4Oq7Amv+utvaLxByi1vdKMgNj+5Y8SYuFKvn3P8ZTdUMhirkeVE71K4R
	gpVlnSrOC6FUBkKHeDySHVxsKeI3bVMTvh2/2P28Sf9ALBeFHsZUrH/8BUm5vsTrAa0q6+
	UcKAba86r5+SoqBBwvSIpku6ru8H/jeBZB+vxvN2FE7LSif9Zkn/ZO72A9lg7RA1Zat3qZ
	V2EXQBwfqNnXEnGmehCEGgnrmBVnvdtdRelm2l6fXhaWQSD+2vG4mqlJjUojf/tZn20fF1
	efXYlKpyre2+f3qhvztHA5EG+LoHIMVtYDktGZcEHEf/pJpsSrH4+VeP1oECJg==
From: Benjamin ROBIN <benjamin.robin@bootlin.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 openembedded-architecture <openembedded-architecture@lists.openembedded.org>
Subject: Re: Comparing cve-check with sbom-cve-check
Date: Fri, 06 Feb 2026 17:15:00 +0100
Message-ID: <5534486.GXAFRqVoOG@brobin-bootlin>
In-Reply-To: 
 <CAJdd5GZOeL0ZfGuPtWj9VuY0jdpcGEi6v-mRDZWB1t7rFv8PnA@mail.gmail.com>
References: 
 <2CD10DD9-FB2A-4B10-B98A-85918EB6B4B7@arm.com>
 <1996818.6tgchFWduM@brobin-bootlin>
 <CAJdd5GZOeL0ZfGuPtWj9VuY0jdpcGEi6v-mRDZWB1t7rFv8PnA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 16:15:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230629

On Friday, February 6, 2026 at 4:50=E2=80=AFPM, Joshua Watt wrote:
> > But on my side, I first tried a normal build with an empty build
> > directory.
> > The build failed around SPDX generation. For information I used the
> > following KAS configuration:

I should have specified that when building a minimal image with your branch=
, I=20
have the following error:

ERROR: opkg-utils-native-0.7.0-r0 do_create_recipe_sbom: Could not find a=20
recipes SPDX document named recipe-opkg-utils-native
ERROR: Logfile of failure stored in: /work/build/tmp/work/x86_64-linux/opkg-
utils-native/0.7.0/temp/log.do_create_recipe_sbom.113690
ERROR: Task (virtual:native:/work/build/../layers/openembedded-core/meta/
recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_sbom) fail=
ed=20
with exit code '1'

I am not able to build an image using your branch.

> > -------------------
> >=20
> > header:
> >   version: 18
> >=20
> > build_system: openembedded
> > machine: qemuarm
> > distro: poky
> > target: core-image-minimal
> >=20
> > repos:
> >   bitbake:
> >     url: https://git.openembedded.org/bitbake
> >     commit: af9dd012e7f4d16dccd1d6118be5da94ede68f85
> >     branch: master
> >     path: layers/bitbake
> >    =20
> >     layers:
> >       .: disabled
> >  =20
> >   openembedded-core:
> >     url: https://git.openembedded.org/openembedded-core-contrib
> >     #commit: 6ce19709f7835ee5cd7915e181f89397975236c8
> >     commit: 43737d14ab039c507a1a71177da68c7b41e4622f
> >     branch: jpew/recipe-sbom
> >     path: layers/openembedded-core
> >    =20
> >     layers:
> >       meta:
> >   meta-yocto:
> >     url: https://git.yoctoproject.org/meta-yocto
> >     commit: de4abc0a175af12eacc761a2e1e60ca7fdfeaa1b
> >     branch: master
> >     path: layers/meta-yocto
> >    =20
> >     layers:
> >       meta-poky:
> >   meta-openembedded:
> >     url: https://git.openembedded.org/meta-openembedded
> >     commit: 3787ecadbb198f56ac43025a15b3339c810c3a66
> >     branch: master-next
> >     path: layers/meta-openembedded
> >    =20
> >     layers:
> >       meta-oe:
> >       meta-python:
> >  =20
> >       meta-networking:
> >   meta-sbom-cve-check:
> >     url: https://github.com/bootlin/meta-sbom-cve-check.git
> >     commit: ea9fecee6073abab0f8d5d7ccb02077d1c6dc504
> >     branch: main
> >     path: layers/meta-sbom-cve-check
> >=20
> > local_conf_header:
> >   cleanup: |
> >  =20
> >     INHERIT +=3D "rm_work"
> >  =20
> >   spdx: |
> >  =20
> >     INHERIT +=3D "vex"
> >=20
> > -------------------



> Ya, this is because I tried to "reuse" the recipe deploy directory for
> do_create_recipe_spdx; I can fix this.

Thanks.

> > Unless I'm mistaken, this information is not provided in the SBOM that =
can
> > be found in the deploy directory.
> >=20
> > The following command does not return anything:
> >=20
> > python3 -m json.tool build/tmp/deploy/images/qemuarm/core-image-minimal-
> > qemuarm.rootfs.spdx.json | grep -E "is.native"
> >=20
> > Same result with meta-world-recipe-sbom-recipe-sbom.spdx.json
>=20
> Yes, sorry. My statement was not clear; you won't find any native
> markers in the SBoM output today, but we have mechanisms in place to
> do that, so it should be pretty easy and I can work on it.

Oh, OK. I was confused because, when I was looking at the code, this was=20
indeed not implemented.

> > I currently use the `build_Build` in sbom-cve-check. The goal is to spe=
ed
> > up CVE analysis, since a recipe should only provide "one" CPE (there can
> > be multiple CPEs, but they all identify the same "component") and one
> > version.
> >=20
> > From the `build_Build` object, the packages are grouped (if they share =
the
> > same
> > CPEs and version), and the analysis is done on this group. This is
> > especially important for the kernel and associated modules. We could ha=
ve
> > hundreds of kernel packages sharing the same CPE.
> >=20
> > I noticed that the `build_Build` object is no longer used when generati=
ng
> > meta-world-recipe-sbom-recipe-sbom.spdx.json. sbom-cve-check currently
> > cannot handle that, but I could change the way it works, will see. We
> > really need to discuss that.
>=20
> Right, it kinda depends on your use case. There are basically two of
> them right now:
> 1) Running CVE analysis on all recipes to determine if any _recipes_
> have new CVEs that need to be triaged. This should be doable without
> actually having to build the recipes, since that would take a long
> time. This is the more "proactive" CVE maintenance that upstream and
> many companies want to do.
> 2) Running CVE analysis on a specific product SBoM to determine if
> there are any CVEs that affect that product. Your tool currently
> handles this really well.
>=20
> I've not looked too closely at the code for your tool, but I'm hoping
> that it wouldn't be too difficult to handle either use case. I'm kinda
> thinking the tool should be able to handle either, since the SBoM for
> #2 is just a superset of #1. If there is something that we need to do
> to the SBoM to clearly distinguish the difference between them so your
> tool can do the right thing, let me know.

Yes, if I understood correctly, #2 will be a superset of #1. But sbom-cve-
check relies (for now) on build_Build which is included in #2 (but not in #=
1).=20
So this is not going to work for #1.

sbom-cve-check heavily relies on the concept of a build (recipe), which=20
provides: sources and packages.

Since I am not able to generate a "normal" SBOM file associated with a buil=
t=20
image, I can check what would be the format of this SBOM after the changes=
=20
that you have made.

> Waiting on this seems best. It's not clear what the best long-term
> solution is going to be right now, and I wouldn't want to spend time
> developing a solution that was a dead end.

Yes, I agree.

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




