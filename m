Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44382EA794D
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 23:54:36 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9399.1770249272616912154
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 15:54:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Iz4AKtZ7;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-649d4690174so530409d50.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 15:54:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770249272; cv=none;
        d=google.com; s=arc-20240605;
        b=BPAYUmarjRuNHV4p5icd4aHOVlanuE15JrP1kzqogcQP/EJyknSOp4K3UvIssI1aos
         H56O7TezLBs8nK6FROr3tngq7MJI/uSPLq+XoxchaienRDrYVPJLsh+Pm6wHFGVcW2HL
         mxrIo+roxQ7XG1VKJ/+g6Wnna72s04vD4PIE6eyX6b68nCENt5LyEs28Zg84/Ns8904C
         F+RE3AYwk36XKoCr+QcKjSI9NcXetgm1g0HtYS12zu/+CFdrmY1XdJvYCWoqQKMpOQ9q
         HvyN5nN6aIwLvAp8lzvImVe0zsmqzQGNFHPKMWybUkdz6hUIZbVHUjt7GXIt4odtNPnz
         KaNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qRpVmAnTFgoD/roN3pO1yDc613IIzr6DN67oAWoUiN8=;
        fh=GJpBIM1oERFLYjGOXiZa0wUYhKPDGtz4qZ3lboTBJys=;
        b=XYgxutmVeVscPFUYJbfD7tC6JII/pJamwQ12vXQs+sVylY1RgT6c9KooTPJ8EbYu8X
         /z8zu8gwLoMPpmIMQs5ssEXy1O6KApT2qjAW4atPNUt244LIKGkrbA38ySN209gyIO2D
         Pz0wq6qExy9D1l8MyezHqHEU8j+G6WsMFYGE64+teSamodKaNd/P1dS7iAlthEpkWTLA
         yKUjY69VtB7ZRXffbbv3xAXDDE8No7voSdI3FOWb5MNP417SfiqOvn1+SpfgE1L7/Gma
         knfjUbp16rN0Vj/JbioLPZ7K925WMdmNdy+Ph+KRGaxKmb3ozD5BLQpWg9VPZ95oJBN3
         jWRQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770249272; x=1770854072; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRpVmAnTFgoD/roN3pO1yDc613IIzr6DN67oAWoUiN8=;
        b=Iz4AKtZ7qo+ssF1j0rV2QQ0+I/Q8JwH0U7PwW0dXF9IXQeh0QsyEiE6sPe7N78CgkD
         3jFyR6wT6M8XAsLexIKftxqcG9/dGvZXWWt/tznXUYWgFw/eqiCSePJimpc+jUtre683
         44eJOWwEJRqEONTkI64HwCzXeQbzC87NgCAvJocYZtnCT8obuHGkkIzBhHYvlHTamvvc
         5AgIDyunNjdfJL4jivTEoOHHL0KrW0Mb3lvCuQC0RpmFyFcqQkuL/KaQMH/d7SwGRk1L
         eoEvRFlud+MppghOpiYWT5ZAuWc+BhCbfcvOCE5vVVDa21+E9dnBDDvVwoSyhAyVF4I3
         vmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770249272; x=1770854072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qRpVmAnTFgoD/roN3pO1yDc613IIzr6DN67oAWoUiN8=;
        b=W3S+P2UshjmOdhITkGKmneMyTgyNAkdgGT3na2ABzujbULK8UnzaD6jo+/aqWY5GNo
         vHE1Lyot7qw8Kh+KDLXS7ArDwvkwZZ7rV0zvwprn1235X3tYPOsHwJc+kObqQBI7ny2c
         NO9L+Tz1NUeEEhcK+wTRfkr1hQbnT4iXc5mxL/mzESorAGnWI0nRs3GkD+9GHSID+vIi
         TvcK8/cHlIdGXjC7wWN3XgEkR30jZqahqt+b2iGaMlPlLR5ylBe2JPtY8WbjqlPLl2LP
         aTbSOY9465gqOhFzxq2wsIM8XiqdhrJZWpJGJEXvwD8JiBwCAglht7ctGZrEKfXA3ozh
         TekQ==
X-Gm-Message-State: AOJu0YztO+5wr4Z7wcDB2OVQMoa//MfAiN4IJRsPhPHBwPG0xiHibMDn
	JLm5xvGiccGPb5YgpNcSNqZWWr2Gd9XxvmE5w+tjklnMgck366JyXq+uvN7CvxF2V9JCo/y2ju1
	YUc7U6myyI9OrG3+qo2oX1dAm4UbW9TryuQ==
X-Gm-Gg: AZuq6aLa/D5G82KVBr+9X8CoJaoEloEOlU+v1sLpstv0ZkMbWgm0KBcHGZuHdtKkswJ
	CGwe9tboLs78FUVeM/D2GuOuYQhEICp8vY/T5KZJrFuxh1O3zihRNBlCnqGLIj2b6X+mFAwnDaW
	uA7uMq9VuaZLXV1uMoje3ll8jW+Lxo1Ocvjrq/1QrjGlDRNyU9P2XXvEWI5htoRPAf/aJnDiufX
	gDNymGcr5w5YMO3CXvpMUF75VwBSorUI9drSqcEn+b43K08od+J8BeaPFc73nPBnNWTz8jrx5He
	1AO/6RwjcA==
X-Received: by 2002:a53:e232:0:b0:649:b8c5:7512 with SMTP id
 956f58d0204a3-649db33fce0mr3110364d50.8.1770249271568; Wed, 04 Feb 2026
 15:54:31 -0800 (PST)
MIME-Version: 1.0
References: <2CD10DD9-FB2A-4B10-B98A-85918EB6B4B7@arm.com>
In-Reply-To: <2CD10DD9-FB2A-4B10-B98A-85918EB6B4B7@arm.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 4 Feb 2026 16:54:19 -0700
X-Gm-Features: AZwV_Qjv2f3X8pYBYWMgQGwl7eodVV9PoMJojJRoG0oLfSu1ABiuCECknRkaEOc
Message-ID: <CAJdd5GbqsCVjVDkLFFbpzihurQxHxTrAGjA_K1OGNPTHj=gakw@mail.gmail.com>
Subject: Re: Comparing cve-check with sbom-cve-check
To: Ross Burton <Ross.Burton@arm.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	"benjamin.robin@bootlin.com" <benjamin.robin@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 23:54:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230562

Yes, I agree this should be the strategy for handling CVEs. It would
also be really good to get this in before the LTS

I'm working on some changes to SPDX that I think will help with this.
Specifically, I'm adding "Package" objects to describe recipes. This
allows the recipes to be linked as build time dependencies
independently of the build provenance (which does the same thing, but
for builds). The data in the recipe package will contain only data
that can be statically determined without actually building the
recipe, so it will give us the avenue to do CVE analysis without
actually building anything[1]. This should allow CVE analysis on the
native and static libraries since they will be included as build time
dependencies, even though they don't appear in the final image.


[1]: Sadly, it _can't_ include license information because
NO_GENERIC_LICENSE means you can have license text that you don't know
until after do_unpack; we should consider doing something about that.


On Wed, Feb 4, 2026 at 10:31=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> Hi,
>
> I spent a little time this week comparing our cve-check with Bootlin=E2=
=80=99s sbom-cve-check[1].
>
> tl;dr: has promise, needs a little further work. I think we can swap cve-=
check for sbom-cve-check in the LTS if we hurry.
>
> The background to this is that the existing cve-check class has some know=
n limitations:
> - Uses the FKIE fork of the NVD database as a source of CVE data, which d=
oes not have the level of metadata it used to have
> - Only can be ran as part of a bitbake run, no way to do repeat scans a m=
onth later without involving bitbake
>
> Whereas sbom-cve-check is:
> (1) an independent tool,
> (2) scanning a SPDX manifest,
> (2) using both the FKIE/NVD database and the CVE Project cvelist.
>
> To elaborate on those points:
>
> 1) As an independent tool it can be ran at build time (potentially using =
meta-sbom-cve-check[2], or by calling the tool directly), or at any point i=
n time after the build using just archived metadata to check for new issues=
. This is very useful for manufacturers who want to scan for issues routine=
ly without having to do builds.
>
> 2) Whereas cve-check scans for CVEs at build-time in a recipe task and wi=
ll (badly) generate aggregate reports for images, sbom-cve-check uses the i=
mage SPDX to know what products to look for issues in. This means it _only_=
 supports the =E2=80=9Cwhat issues does my image have=E2=80=9D use-case and=
 not =E2=80=9Cwhat issues are on my build machine=E2=80=9D (eg issues in na=
tive tools).
>
> 3) The use of two different databases means it has more scope for improve=
d metadata.  It currently supports the FKIE mirror of the NVD data, the CVE=
 List by the CVE Project (which is gaining improved metadata via their Enri=
chment Program), and further sources would be simple to add.
>
> As a test I did a build of core-image-sato and generated a report using b=
oth cve-check and sbom-cve-check.  The differences were interesting.
>
> cve-check produced this report for the whole build:
>
> WARNING: avahi-0.8-r0 do_cve_check: Found unpatched CVE (CVE-2025-59529 C=
VE-2025-68468 CVE-2025-68471)
> WARNING: busybox-1.37.0-r0 do_cve_check: Found unpatched CVE (CVE-2025-60=
876)
> WARNING: expat-2.7.3-r0 do_cve_check: Found unpatched CVE (CVE-2025-66382=
 CVE-2026-24515)
> WARNING: expat-native-2.7.3-r0 do_cve_check: Found unpatched CVE (CVE-202=
5-66382 CVE-2026-24515)
> WARNING: ffmpeg-8.0.1-r0 do_cve_check: Found unpatched CVE (CVE-2023-5179=
1 CVE-2023-51793 CVE-2023-51794 CVE-2023-51795 CVE-2023-51796 CVE-2023-5179=
7 CVE-2023-51798 CVE-2025-22921 CVE-2025-25468 CVE-2025-25469)
> WARNING: glibc-2.42+git-r1 do_cve_check: Found unpatched CVE (CVE-2010-47=
56)
> WARNING: libpam-1.7.1-r0 do_cve_check: Found unpatched CVE (CVE-2024-1004=
1)
> WARNING: libsndfile1-1.2.2-r0 do_cve_check: Found unpatched CVE (CVE-2024=
-50613 CVE-2025-52194 CVE-2025-56226)
> WARNING: linux-yocto-6.18.6+git-r0 do_cve_check: Found unpatched CVE (CVE=
-2008-4609 CVE-2010-4563 CVE-2019-14899 CVE-2021-3714 CVE-2021-3864 CVE-202=
2-0400 CVE-2022-1247 CVE-2022-38096 CVE-2022-4543 CVE-2023-3397 CVE-2023-36=
40 CVE-2023-39176 CVE-2023-39179 CVE-2023-39180 CVE-2023-4010 CVE-2023-6238=
 CVE-2023-6240 CVE-2023-6535)
> WARNING: polkit-127-r0 do_cve_check: Found unpatched CVE (CVE-2016-2568)
> WARNING: qemu-native-10.2.0-r0 do_cve_check: Found unpatched CVE (CVE-201=
9-12067 CVE-2021-20255 CVE-2024-6519)
> WARNING: qemu-system-native-10.2.0-r0 do_cve_check: Found unpatched CVE (=
CVE-2019-12067 CVE-2021-20255 CVE-2024-6519)
> WARNING: vim-9.1.1683-r0 do_cve_check: Found unpatched CVE (CVE-2025-6647=
6)
>
> Aside: cve-check=E2=80=99s per-image reporting appears to be slightly bro=
ken and claimed that my sato image included images from meta-oe, which it d=
id not. The report above is the reporting that is logged during the build.
>
> After writing some tooling for textual summaries, sbom-cve-check produced=
 a report that is similar. The recipe list has differences: vim and a handf=
ul of other are  not listed; but previously unreported CVEs in busybox, cai=
ro, expat, glib-networking, gnupg, libgcrypt, libsoup, libxml2, mpg123, per=
l, tar, and the kernel are added.
>
> The recipes that are not listed are either native tools (which, by defini=
tion, are not in the image) or recipes that are built for dependencies but =
do not end up in the this specific image. In this case, dosfstools-ptest RD=
EPENDS on xxd which is built by vim, but as dosfstools-ptest is not install=
ed there is no need for xxd.
>
> A number of CVEs are added, for example CVE-2024-58251 is a CVE in busybo=
x which is missing the machine-readable CPE in the NVD data[3] but the CVE =
List has been =E2=80=9Cenriched=E2=80=9D and has machine-readable data[4]. =
 I=E2=80=99ve not yet triaged every one to identify the reason for the addi=
tion, but I expect this is the main reason.
>
> A more interesting feature gap is where a recipe statically links to anot=
her recipe: in this case there is no SPDX package entry for the library, so=
 issues in the library will not be reported. With cve-check, the build-repo=
rt will cover this, but the image-report will not.
>
> To summarise [5] the pros and cons:
> + sbom-cve-check can run at any point after the build
> + has better data sources which report more issues
> - only scans the literal packages that are in a final image, so we don=E2=
=80=99t get coverage of native packages or static linkage
>
> I wonder if the easiest fix for this gap is to enhance the SPDX generatio=
n to not only generate an =E2=80=9Cimage SPDX=E2=80=9D but also a =E2=80=9C=
build SPDX=E2=80=9D, which is essentially an aggregation of every recipe=E2=
=80=99s SPDX that is present. A recursive execution of the SPDX generation =
task will mean this covers both any native tools and static libraries that =
are in the dependency graph, for maximal coverage.
>
> This gives a solution without needing to be more clever in the image SPDX=
 generation, for example including packages for all of the build dependenci=
es (be them native or target).
>
> If this is done then I think sbom-cve-check is at least at parity with cv=
e-check, and in many ways far superior. This will allow us to merge the few=
 recipes and class from meta-sbom-cve-check into core, and delete cve-check=
.
>
> Any thoughts? (looking at Josh and Benjamin primarily)
>
> Thanks,
> Ross
>
> [1] https://github.com/bootlin/sbom-cve-check
> [2] https://github.com/bootlin/meta-sbom-cve-check
> [3] https://nvd.nist.gov/vuln/detail/CVE-2024-58251
> [4] https://www.cve.org/CVERecord?id=3DCVE-2024-58251
> [5] At this point I=E2=80=99m realising I need to read The Art of Explana=
tion by Ros Atkins...

