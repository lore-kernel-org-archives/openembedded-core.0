Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC41EE2095
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 12:22:42 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10330.1770380557611413399
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 04:22:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=nNP/yg+Q;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 87CA74E42440;
	Fri,  6 Feb 2026 12:22:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5E41860729;
	Fri,  6 Feb 2026 12:22:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B302C119D1CBA;
	Fri,  6 Feb 2026 13:22:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770380554; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9AltWsM8A855kANLjY0k4p7jh/52xcxrcHX+9ak/STY=;
	b=nNP/yg+Q+0hCTOt9roCQo+nP2LHdMtxql8LOLiqlbiMPM0fx7V6+oMJjJTmB7K9UsKp7uk
	qs+S7ipo+5WKGYtIZszYbrPQEeWLDjhgvZD90z5tqJ4TA2T7dZlR+xnDg9aV+LKkm1LmeU
	RGUYnoVcM00Vu40wTewQlR0Pi4/rZQeRSpBJjYoe9DWJwYTxDrfN97YKQMxEF/Pt3MeIl7
	+5Hkd1pzUFxWO9MY0ceBPaTeaOBdi1bmVLt8zT2ZejR7w1P+bYCR85ofGHquSHTpziVko0
	u5ZAI6RdCCrsWZqQpc7tOvHBEsRVI+GXcLC/d459WaEL+ayCwrjGhpHT62wNgw==
From: Benjamin ROBIN <benjamin.robin@bootlin.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 openembedded-architecture <openembedded-architecture@lists.openembedded.org>
Subject: Re: Comparing cve-check with sbom-cve-check
Date: Fri, 06 Feb 2026 13:22:32 +0100
Message-ID: <1996818.6tgchFWduM@brobin-bootlin>
In-Reply-To: 
 <CAJdd5GZuXM06+x+OPnpi5jkv2Hc=rz-qVesPG+0YePeYFvaxCw@mail.gmail.com>
References: 
 <2CD10DD9-FB2A-4B10-B98A-85918EB6B4B7@arm.com>
 <2051957.usQuhbGJ8B@brobin-bootlin>
 <CAJdd5GZuXM06+x+OPnpi5jkv2Hc=rz-qVesPG+0YePeYFvaxCw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 12:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230618

Hello Joshua,

On Thursday, February 5, 2026 at 6:29=E2=80=AFPM, Joshua Watt wrote:
> I think I have the SPDX changes that will be required _mostly_ ready
> for you to look at:
> git.openembedded.org/openembedded-core-contrib/log/?h=3Djpew/recipe-sbom

Thank you. I am currently evaluating your commits.

While being able to generate a SBOM for an entire layer is useful, the=20
urgency, in my opinion, is to have a SBOM (the one that can be found in the=
=20
deploy folder) with all the important information for a complete analysis:
=2D Elements (packages) "installed" on the target.
=2D And also build elements (what you have created: software_Package with
  software_SoftwarePurpose.specification).

Users are doing the build anyway; the generated SBOM associated with the bu=
ild=20
should contain "everything" for a proper CVE analysis. But I guess the comm=
its=20
that you have written are a first test, and it is not complete.

> Run the command:
> ```
> bitbake -c create_recipe_sbom meta-world-recipe-sbom
> ```
> Which will make a complete recipe-level SBoM (names may change, since
> "recipe" is a little confusing in this context) in
> ${DEPLOY_DIR_IMAGE}/meta-world-recipe-sbom-recipe-sbom.spdx.json

This is great; it will be very useful for a layer maintainer.

But on my side, I first tried a normal build with an empty build directory.=
=20
The build failed around SPDX generation. For information I used the followi=
ng=20
KAS configuration:

=2D------------------
header:
  version: 18

build_system: openembedded
machine: qemuarm
distro: poky
target: core-image-minimal

repos:
  bitbake:
    url: https://git.openembedded.org/bitbake
    commit: af9dd012e7f4d16dccd1d6118be5da94ede68f85
    branch: master
    path: layers/bitbake
    layers:
      .: disabled

  openembedded-core:
    url: https://git.openembedded.org/openembedded-core-contrib
    #commit: 6ce19709f7835ee5cd7915e181f89397975236c8
    commit: 43737d14ab039c507a1a71177da68c7b41e4622f
    branch: jpew/recipe-sbom
    path: layers/openembedded-core
    layers:
      meta:

  meta-yocto:
    url: https://git.yoctoproject.org/meta-yocto
    commit: de4abc0a175af12eacc761a2e1e60ca7fdfeaa1b
    branch: master
    path: layers/meta-yocto
    layers:
      meta-poky:

  meta-openembedded:
    url: https://git.openembedded.org/meta-openembedded
    commit: 3787ecadbb198f56ac43025a15b3339c810c3a66
    branch: master-next
    path: layers/meta-openembedded
    layers:
      meta-oe:
      meta-python:
      meta-networking:

  meta-sbom-cve-check:
    url: https://github.com/bootlin/meta-sbom-cve-check.git
    commit: ea9fecee6073abab0f8d5d7ccb02077d1c6dc504
    branch: main
    path: layers/meta-sbom-cve-check

local_conf_header:
  cleanup: |
    INHERIT +=3D "rm_work"
  spdx: |
    INHERIT +=3D "vex"
=2D------------------

If I am using commit 6ce19709f7835ee5cd7915e181f89397975236c8 everything=20
works, but static libraries are not listed (no associated package). But thi=
s=20
is=20
expected, since none of your changes were included.

If I try to switch to your commit (43737d14ab039c507a1a71177da68c7b41e4622f)
and run: bitbake -c create_recipe_sbom meta-world-recipe-sbom
I have the following errors (a lot of them) if I do not destroy the build=20
directory:

ERROR: zlib-native-1.3.1-r0 do_create_recipe_spdx_setscene: Recipe zlib-nat=
ive=20
is trying to install files into a shared area when those files already exis=
t.=20
The files and the manifests listing them are:
  /work/build/tmp/deploy/spdx/3.0.1/x86_64/by-spdxid-hash/
70/706d8ec1deffb40c8b72ba34c22aaf543671078abd1a000c5fa0ee6f35274d2b.spdx.js=
on
    (matched in manifest-x86_64-zlib-native.create_spdx)
  /work/build/tmp/deploy/spdx/3.0.1/x86_64/recipes/recipe-zlib-
native.spdx.json
    (matched in manifest-x86_64-zlib-native.create_spdx)
Please adjust the recipes so only one recipe provides a given file.


However, if I destroy the build directory and run again the command, it=20
successfully generates meta-world-recipe-sbom-recipe-sbom.spdx.json

And in this case, the software_Package providing the static library is=20
created,=20
and the application "dependsOn" this static library.
It also "dependsOn" gcc-cross-arm (a software_Package), which is great.
*But* there is no way to know that gcc-cross-arm package is a native packag=
e.

> This SBoM uses new "recipe" packages that _should_ be sufficient to do
> CVE analysis, but let me know if anything is missing; it also is
> pretty quick to generate since it doesn't require doing a build.


> We actually already track this for the SPDXDocument class as an
> extension, since the native recipes need to handle a few things
> differently. We could pretty easily add a similar extension to the new
> recipe package that you could look at.

Unless I'm mistaken, this information is not provided in the SBOM that can =
be=20
found in the deploy directory.

The following command does not return anything:

python3 -m json.tool build/tmp/deploy/images/qemuarm/core-image-minimal-
qemuarm.rootfs.spdx.json | grep -E "is.native"

Same result with meta-world-recipe-sbom-recipe-sbom.spdx.json

>=20
> >  - If possible (though not a priority), including layer information
> > =20
> >    (URL, Git version, etc.) associated with a `build_Build` object would
> >    be
> >    valuable.
>=20
> We would like to do that and it's on the backlog. It's a little bit
> tricky to get right, especially when dealing with multiple remotes in
> the git repos, bbapends, etc. FWIW, our Yocto PURLs support this also,
> we just don't have it implemented.

Yeah, I know finding all the layers that impact a recipe could be tricky...

> It also probably shouldn't be attached to the `build_Build`, but the
> new "recipe" package (See below). I'm hoping you can now completely
> ignore the build provenance information for CVE analysis now (unless
> you want it to filter on source files or something). In fact, with the
> new recipe packages, we could make the build provenance optional in
> the SBoM output.

I currently use the `build_Build` in sbom-cve-check. The goal is to speed u=
p=20
CVE analysis, since a recipe should only provide "one" CPE (there can be=20
multiple CPEs, but they all identify the same "component") and one version.

=46rom the `build_Build` object, the packages are grouped (if they share th=
e=20
same=20
CPEs and version), and the analysis is done on this group. This is especial=
ly=20
important for the kernel and associated modules. We could have hundreds of=
=20
kernel packages sharing the same CPE.

I noticed that the `build_Build` object is no longer used when generating
meta-world-recipe-sbom-recipe-sbom.spdx.json. sbom-cve-check currently cann=
ot=20
handle that, but I could change the way it works, will see. We really need =
to=20
discuss that.

> > "Better" might be too strong, we support *more* data sources.
> > Sometimes, version ranges in the CVE List are incorrect, while the NVD
> > database may provide more accurate information. However, users can
> > configure their preferred data sources via a custom configuration file,
> > so this isn=E2=80=99t a major concern from my perspective.
>=20
> I think there is also a lot of value in a separate tool that can be
> updated independently to deal with new sources using the same SPDX
> data. For example, if we ever figure out a sane thing to do with PURLs
> for vulnerability management, using e.g. OSV might be an option also
> (esp. since the PURLs are already in the SPDX data).

Indeed OSV might be added as an additional database. But I need to find the=
=20
"time" to do that. There is so much to do :)

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




