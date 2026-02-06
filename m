Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB9AEE20B1
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 15:50:44 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.288.1770393039509258824
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 07:50:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gMc5MZku;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-649b22e5894so2832202d50.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 07:50:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770393038; cv=none;
        d=google.com; s=arc-20240605;
        b=iZyKu9Q6kLHvSNnnK1lao6ayjZdMG1zLADfURXJDKt1ItfLpWZXWIJLG0Kjq7CU0Yx
         bRr83FapucCGPXXTOWl4R34h/ONhABHYKV5QWoOlC6xRMCi0UfAeBSbXur1j/mHFu5n9
         Yg9rPb5Ctd1AvB87kuiEUk4FxY4p0kosvHG6b8m5RLKAX3ehUbbEc9bf9PS82WQRZJ6k
         a8WJTpC3XPMoiFOEoGxJdjyE5OMymkMuNCbenyQG/SRibsreAI7UqntbxlfXopL2UeSF
         gQOss4zsbRkTQWmzyiPa4zFKaT3O+yRKqxZkaSXxVFaZjHo3jA6TU0i6wIU12jzoBwBC
         tESg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=exX4Frqjgyef7uD4A5WTOQGMApmAGV8j83LMGrFVLMo=;
        fh=yxwvfP2MBoxfKODQlk5mCw+BH/FpxH+twEsthCQCQWQ=;
        b=k+XSglhQad9tprX57H9Tg0N5LYwou5nnU5s5KPPeuR4qNyzveZZlCVWMwk4KQtd+Cc
         jTnHDLcrnKYvdKQlnLxtpmkYiWWdo+CYqRY8D4tj0tkt3reEU7SJcLWuEzng1Ovmx00A
         2kkhNNBnCX1sTMpkAvv60UjBdrYPHFIZjiRpeMmbbaw0zDcjGQdElpg74A9DFR3MNkb6
         cbKLQHPgIeHIBIxgr+inRRW6V+MMP9y332FqErNqC2Lv4CrrKr1MbNvTwHmknnEreLNK
         zuWzxKGYQELvkRPIhm27NvO47N0DccdP8/OfJVuia1GFkGI04zPNNoxvDd0Hi1ma/6AI
         HTTg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770393038; x=1770997838; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exX4Frqjgyef7uD4A5WTOQGMApmAGV8j83LMGrFVLMo=;
        b=gMc5MZkujD4J5R10c3MmVMaql6+t25ImHcI4riiqYac3mwvHou98/Bua6wbF81jSzm
         pW+bJbiUDjjoAl3epIZZhzu9ywWK3YxPvQfYkiqBgH0rTE3WgmOGESERflC/AVoRoCDR
         qEFu9vultG/LHN1NFbm8tlo0l7a0F/I/FAUOI3bXkN+ujCJ5ameZcbjdR05HFE3YKVLH
         Orvy8MRfOFtfSy0BWXnCmN0sScG2LJNrMV5Ppf8ZamffJyEwMENyp2UcBe8PdifWd38s
         +lyABEwiSTstEgz6N3b6e+8opGT5A+xDhg0xc4891JUhk2VnhWdE4rhc01TNTaLm+LF8
         dCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770393038; x=1770997838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=exX4Frqjgyef7uD4A5WTOQGMApmAGV8j83LMGrFVLMo=;
        b=BNYNDeUcYirvvqecoj90VFYismsGXAUXMfmv2kc+qPs8ao4HWQ2AINTXN0GUjzW1rC
         hHvCO2uRSc2UsytZNoRgo797EV40JIKxsbN164lGfOT3Dd+DQ/UrfIjH09OaHn+DTC7K
         ctuIQJ4wDCvPdcCQyD1TOiw94X4VHNC8YxDjm3eROWeSBoR9Da5ixXttmCJyUDzOe+k9
         OB/2mIs1edx3P9u+bZIHpiILN14LhfcL5xewuKJ4cszv/o0qUs5Gy4zf8aeG9bUmkYGo
         i4HgRSVhZbMilX15dj2CySodI5Tn2SfEFSvWK93Xqh0+305tc82fkrPB4QeFLh25hSZP
         CKTA==
X-Forwarded-Encrypted: i=1; AJvYcCWmpKr4Bnt1BE6yS2C0smzrfIKXeX+ULmSiJfvcpoxmJYPhW7iLDlXvir+kyTb/otiFynjK2Xd2y0BxdesVIEeVdg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyEJCuVKRZUP6+ImSKZGSgKjf7ef19d5H9P5kJkX9Smp5IrGIeg
	19lFO0LW5jfnv47q76wX/k12pR7pyUdFQHiTIc9lAoBl5vnS0NksJqPrNhLpBV1JfqQsK7pszdP
	WRAAOcn+T5RjBIaoTeLdQYQgVKaljInc=
X-Gm-Gg: AZuq6aKfpPrzs8spr/nIuoDt/ePyjfxLLQUYumdo7tIDQ8HHIVdxPbXjo7WNsxNkLzm
	opMJpbxjcBFK0w8o/xiUPk4uQ9jVJi1ZFIEPJ57XS/oxTjwGNJznaSsdfGlZAqKaj3aAn5DtCi6
	Qm35b5z2C6I0EytUREO8Xlw+Wf6mSRLWLdGjihBscWTQv3ynEzUJhZk7/F0aNINBDABX4tQvZx8
	eE7Ps6z4YjU1iVFpHwxGyUijkUKJD0zpvDLrlY29qEjx3e+TaAPIUp4hINPs0tyy74mnkmeAyXy
	etjm1wZp
X-Received: by 2002:a05:690e:2554:b0:649:da7e:9950 with SMTP id
 956f58d0204a3-649f1e68083mr2441973d50.6.1770393038426; Fri, 06 Feb 2026
 07:50:38 -0800 (PST)
MIME-Version: 1.0
References: <2CD10DD9-FB2A-4B10-B98A-85918EB6B4B7@arm.com> <2051957.usQuhbGJ8B@brobin-bootlin>
 <CAJdd5GZuXM06+x+OPnpi5jkv2Hc=rz-qVesPG+0YePeYFvaxCw@mail.gmail.com> <1996818.6tgchFWduM@brobin-bootlin>
In-Reply-To: <1996818.6tgchFWduM@brobin-bootlin>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 6 Feb 2026 08:50:26 -0700
X-Gm-Features: AZwV_QhXbtGQJWtoB_90h5vy60QQQS6WBP9-H35Cm0R63lLITXczNgbIeaCT3Gg
Message-ID: <CAJdd5GZOeL0ZfGuPtWj9VuY0jdpcGEi6v-mRDZWB1t7rFv8PnA@mail.gmail.com>
Subject: Re: Comparing cve-check with sbom-cve-check
To: Benjamin ROBIN <benjamin.robin@bootlin.com>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 15:50:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230627

On Fri, Feb 6, 2026 at 5:22=E2=80=AFAM Benjamin ROBIN
<benjamin.robin@bootlin.com> wrote:
>
> Hello Joshua,
>
> On Thursday, February 5, 2026 at 6:29=E2=80=AFPM, Joshua Watt wrote:
> > I think I have the SPDX changes that will be required _mostly_ ready
> > for you to look at:
> > git.openembedded.org/openembedded-core-contrib/log/?h=3Djpew/recipe-sbo=
m
>
> Thank you. I am currently evaluating your commits.
>
> While being able to generate a SBOM for an entire layer is useful, the
> urgency, in my opinion, is to have a SBOM (the one that can be found in t=
he
> deploy folder) with all the important information for a complete analysis=
:
> - Elements (packages) "installed" on the target.
> - And also build elements (what you have created: software_Package with
>   software_SoftwarePurpose.specification).
>
> Users are doing the build anyway; the generated SBOM associated with the =
build
> should contain "everything" for a proper CVE analysis. But I guess the co=
mmits
> that you have written are a first test, and it is not complete.
>
> > Run the command:
> > ```
> > bitbake -c create_recipe_sbom meta-world-recipe-sbom
> > ```
> > Which will make a complete recipe-level SBoM (names may change, since
> > "recipe" is a little confusing in this context) in
> > ${DEPLOY_DIR_IMAGE}/meta-world-recipe-sbom-recipe-sbom.spdx.json
>
> This is great; it will be very useful for a layer maintainer.
>
> But on my side, I first tried a normal build with an empty build director=
y.
> The build failed around SPDX generation. For information I used the follo=
wing
> KAS configuration:
>
> -------------------
> header:
>   version: 18
>
> build_system: openembedded
> machine: qemuarm
> distro: poky
> target: core-image-minimal
>
> repos:
>   bitbake:
>     url: https://git.openembedded.org/bitbake
>     commit: af9dd012e7f4d16dccd1d6118be5da94ede68f85
>     branch: master
>     path: layers/bitbake
>     layers:
>       .: disabled
>
>   openembedded-core:
>     url: https://git.openembedded.org/openembedded-core-contrib
>     #commit: 6ce19709f7835ee5cd7915e181f89397975236c8
>     commit: 43737d14ab039c507a1a71177da68c7b41e4622f
>     branch: jpew/recipe-sbom
>     path: layers/openembedded-core
>     layers:
>       meta:
>
>   meta-yocto:
>     url: https://git.yoctoproject.org/meta-yocto
>     commit: de4abc0a175af12eacc761a2e1e60ca7fdfeaa1b
>     branch: master
>     path: layers/meta-yocto
>     layers:
>       meta-poky:
>
>   meta-openembedded:
>     url: https://git.openembedded.org/meta-openembedded
>     commit: 3787ecadbb198f56ac43025a15b3339c810c3a66
>     branch: master-next
>     path: layers/meta-openembedded
>     layers:
>       meta-oe:
>       meta-python:
>       meta-networking:
>
>   meta-sbom-cve-check:
>     url: https://github.com/bootlin/meta-sbom-cve-check.git
>     commit: ea9fecee6073abab0f8d5d7ccb02077d1c6dc504
>     branch: main
>     path: layers/meta-sbom-cve-check
>
> local_conf_header:
>   cleanup: |
>     INHERIT +=3D "rm_work"
>   spdx: |
>     INHERIT +=3D "vex"
> -------------------
>
> If I am using commit 6ce19709f7835ee5cd7915e181f89397975236c8 everything
> works, but static libraries are not listed (no associated package). But t=
his
> is
> expected, since none of your changes were included.
>
> If I try to switch to your commit (43737d14ab039c507a1a71177da68c7b41e462=
2f)
> and run: bitbake -c create_recipe_sbom meta-world-recipe-sbom
> I have the following errors (a lot of them) if I do not destroy the build
> directory:
>
> ERROR: zlib-native-1.3.1-r0 do_create_recipe_spdx_setscene: Recipe zlib-n=
ative
> is trying to install files into a shared area when those files already ex=
ist.
> The files and the manifests listing them are:
>   /work/build/tmp/deploy/spdx/3.0.1/x86_64/by-spdxid-hash/
> 70/706d8ec1deffb40c8b72ba34c22aaf543671078abd1a000c5fa0ee6f35274d2b.spdx.=
json
>     (matched in manifest-x86_64-zlib-native.create_spdx)
>   /work/build/tmp/deploy/spdx/3.0.1/x86_64/recipes/recipe-zlib-
> native.spdx.json
>     (matched in manifest-x86_64-zlib-native.create_spdx)
> Please adjust the recipes so only one recipe provides a given file.
>
>
> However, if I destroy the build directory and run again the command, it
> successfully generates meta-world-recipe-sbom-recipe-sbom.spdx.json

Ya, this is because I tried to "reuse" the recipe deploy directory for
do_create_recipe_spdx; I can fix this.


>
> And in this case, the software_Package providing the static library is
> created,
> and the application "dependsOn" this static library.
> It also "dependsOn" gcc-cross-arm (a software_Package), which is great.
> *But* there is no way to know that gcc-cross-arm package is a native pack=
age.
>
> > This SBoM uses new "recipe" packages that _should_ be sufficient to do
> > CVE analysis, but let me know if anything is missing; it also is
> > pretty quick to generate since it doesn't require doing a build.
>
>
> > We actually already track this for the SPDXDocument class as an
> > extension, since the native recipes need to handle a few things
> > differently. We could pretty easily add a similar extension to the new
> > recipe package that you could look at.
>
> Unless I'm mistaken, this information is not provided in the SBOM that ca=
n be
> found in the deploy directory.
>
> The following command does not return anything:
>
> python3 -m json.tool build/tmp/deploy/images/qemuarm/core-image-minimal-
> qemuarm.rootfs.spdx.json | grep -E "is.native"
>
> Same result with meta-world-recipe-sbom-recipe-sbom.spdx.json

Yes, sorry. My statement was not clear; you won't find any native
markers in the SBoM output today, but we have mechanisms in place to
do that, so it should be pretty easy and I can work on it.

>
> >
> > >  - If possible (though not a priority), including layer information
> > >
> > >    (URL, Git version, etc.) associated with a `build_Build` object wo=
uld
> > >    be
> > >    valuable.
> >
> > We would like to do that and it's on the backlog. It's a little bit
> > tricky to get right, especially when dealing with multiple remotes in
> > the git repos, bbapends, etc. FWIW, our Yocto PURLs support this also,
> > we just don't have it implemented.
>
> Yeah, I know finding all the layers that impact a recipe could be tricky.=
..
>
> > It also probably shouldn't be attached to the `build_Build`, but the
> > new "recipe" package (See below). I'm hoping you can now completely
> > ignore the build provenance information for CVE analysis now (unless
> > you want it to filter on source files or something). In fact, with the
> > new recipe packages, we could make the build provenance optional in
> > the SBoM output.
>
> I currently use the `build_Build` in sbom-cve-check. The goal is to speed=
 up
> CVE analysis, since a recipe should only provide "one" CPE (there can be
> multiple CPEs, but they all identify the same "component") and one versio=
n.
>
> From the `build_Build` object, the packages are grouped (if they share th=
e
> same
> CPEs and version), and the analysis is done on this group. This is especi=
ally
> important for the kernel and associated modules. We could have hundreds o=
f
> kernel packages sharing the same CPE.
>
> I noticed that the `build_Build` object is no longer used when generating
> meta-world-recipe-sbom-recipe-sbom.spdx.json. sbom-cve-check currently ca=
nnot
> handle that, but I could change the way it works, will see. We really nee=
d to
> discuss that.

Right, it kinda depends on your use case. There are basically two of
them right now:
1) Running CVE analysis on all recipes to determine if any _recipes_
have new CVEs that need to be triaged. This should be doable without
actually having to build the recipes, since that would take a long
time. This is the more "proactive" CVE maintenance that upstream and
many companies want to do.
2) Running CVE analysis on a specific product SBoM to determine if
there are any CVEs that affect that product. Your tool currently
handles this really well.

I've not looked too closely at the code for your tool, but I'm hoping
that it wouldn't be too difficult to handle either use case. I'm kinda
thinking the tool should be able to handle either, since the SBoM for
#2 is just a superset of #1. If there is something that we need to do
to the SBoM to clearly distinguish the difference between them so your
tool can do the right thing, let me know.

>
> > > "Better" might be too strong, we support *more* data sources.
> > > Sometimes, version ranges in the CVE List are incorrect, while the NV=
D
> > > database may provide more accurate information. However, users can
> > > configure their preferred data sources via a custom configuration fil=
e,
> > > so this isn=E2=80=99t a major concern from my perspective.
> >
> > I think there is also a lot of value in a separate tool that can be
> > updated independently to deal with new sources using the same SPDX
> > data. For example, if we ever figure out a sane thing to do with PURLs
> > for vulnerability management, using e.g. OSV might be an option also
> > (esp. since the PURLs are already in the SPDX data).
>
> Indeed OSV might be added as an additional database. But I need to find t=
he
> "time" to do that. There is so much to do :)

Waiting on this seems best. It's not clear what the best long-term
solution is going to be right now, and I wouldn't want to spend time
developing a solution that was a dead end.


>
> --
> Benjamin Robin, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
>

