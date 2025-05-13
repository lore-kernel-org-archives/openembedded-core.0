Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912CDC3ABCC
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 13:33:32 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.76207.1747143209417347331
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 06:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bOJEyQjC;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22e70a9c6bdso77770805ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 06:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747143209; x=1747748009; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oGkLebpuvizcK6QVDA731qcp1Ugs7ccnSdGfJU7PZ84=;
        b=bOJEyQjCnQecdSlR9N9O/hN8hH9jjFJWK0Epb7RznD29Jelm0moIsiPxd/Z2vBFkol
         JSVNPt1pwbIOLV3QSvtP1zSLJ+Fu+SXL1ihD3XB7bYTwIqnjEGMwMwYl+AM+zKG57ydx
         4ZAoaUQDfcHz2Xdlqp6b95kW02DwJ23s9U+Pm3rDnyHK30FOe2YGw7CRAJKk8m/7/OEz
         +iZrQ+2dfY2oFvDazQMv2mJgugwrShGzYeT4MGKW6WAjfAHtvoTKPZAcTk/7U7g32r0T
         OwlbmeB7vX67ewz06SeQWt8SUK9w5c7vwvr8tIcif5BScaerzKuh6aO4bX4THAJgWYyX
         LnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747143209; x=1747748009;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oGkLebpuvizcK6QVDA731qcp1Ugs7ccnSdGfJU7PZ84=;
        b=vthwNjZrTk8f363OOdt0nxKRudmEieiOksRY6ghyzUSdKZPVyiKc9kxgTEaKxPyXbO
         q9sG4FjXQERt9cmUz3kv549cGBMvu+CxMtYMr7P01q7YjdpRE/pblX4QT6BpAsqkbNqC
         tpvgFvE0r6UVdET4e7JACSZfn4Z4BpUMXtlmoks8+b0GwN8i8ahu94aFiBny+yrbUJFM
         T6c6TsQ42WigriQ3FMCahz4GiAYFzTJg9p38a+hnI4YCV+vX3Rqi1OpWpRbG6G3wEU7V
         MZz6PzgDg12b4K3Zt7GPA1aRX/taOS2VKnd/CB8QKCandZGz3K/ll0Rs3nt8pRblMhiv
         df4w==
X-Gm-Message-State: AOJu0YwsWBAbLPjmrVeJK7VkKdiOWgJQWIfgx/Sndvi1NYZx1qAQIE2C
	HnLreWT8nG4vH5R0y/yyqWHZ5BbGohzMJbGiAdI2c91VVI7ciz8zaDOeQWiZ0kpAGgAjPCBKqKB
	94wT6kEIRcBMLS7stQ1AmopBgSNE=
X-Gm-Gg: ASbGncvCdNExyXpsTv8PswhK9tSa2hBgGUbUI/XkAsENZoO8su5FHWF32JyRy8lqImu
	l96MOd68u7dfHI2FYPactiaPAp4WHfATUFJkEbakN3yQHTqI5xo6Lfi+buyhPpm0fBXIABpIwxu
	+nVc9FEJJbrgyytVn2RHAH1L91WiJKAtH40g==
X-Google-Smtp-Source: AGHT+IExVAon64ahKuUyP1GJ52yDkyqGC6dB813/1YPCMunRQktzJPt1AmhvPp+kbWwMbJMkL7/u1e31W0JLEJOuJMA=
X-Received: by 2002:a17:903:1a6f:b0:220:c067:7be0 with SMTP id
 d9443c01a7336-22fc8affe8cmr228636255ad.6.1747143208432; Tue, 13 May 2025
 06:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250429143904.634082-1-daniel.turull@ericsson.com>
 <20250429143904.634082-2-daniel.turull@ericsson.com> <CAApg2=T7+hrOyfYAYHgy7OBOXL_s2UVPV8RkuBFgQ8vuKaYHpQ@mail.gmail.com>
 <183AD3A846246CA8.415@lists.openembedded.org> <PR3PR07MB66663E510A72EC92AF7A81B88A832@PR3PR07MB6666.eurprd07.prod.outlook.com>
 <CAApg2=T02-Wg17_BXhZt=hGP=WS2r8PJbLhB4ttksg8+nH2Qrg@mail.gmail.com> <PR3PR07MB66663DC5DB6E46A2F66B07208A88A@PR3PR07MB6666.eurprd07.prod.outlook.com>
In-Reply-To: <PR3PR07MB66663DC5DB6E46A2F66B07208A88A@PR3PR07MB6666.eurprd07.prod.outlook.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 13 May 2025 15:33:14 +0200
X-Gm-Features: AX0GCFuL_kNdc1wbXRo91OwZrPk83GrnzgSfT1f9Q5KohLinKOgzgqIlsmccfoA
Message-ID: <CAApg2=RarZpVt1SQh+1pL1Tvh1bfda=_0p0qEPDxLVcS+QdWrQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/8] linux-vulns: fetch kernel.org CNA info
To: Daniel Turull <daniel.turull@ericsson.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Peter.Marko@siemens.com" <Peter.Marko@siemens.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000004f7a810635047ac3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 13:33:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216425

--0000000000004f7a810635047ac3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Daniel,
I have had a look and I think that a post-processing tool is the right way
to go. If you have the file list in SPDX, you can do checks, and possibly
with other metadata (the kernel CVE database does not list affected kernel
options, and that would be a really valuable information source for such a
kind of a check). It will also be code way easier to maintain, as version
checks are complex to perform and debug.

Where we're at this: there will be a need to add information about what
kind of CVE filtering has been done (the default, filtering by files etc).
This might be necessary for maintenance reasons and when you will be
comparing check results between firmware versions et al. A kind of
"used_tools" kind of a field will be necessary.

Kind regards,
Marta

On Wed, May 7, 2025 at 10:05=E2=80=AFAM Daniel Turull <daniel.turull@ericss=
on.com>
wrote:

> Hello Marta,
>
> Did you had time to look at it and how to continue the work?
>
>
>
> Will it make sense that for know I reduce the scope and only add the
> option to extract the compiled files in a =E2=80=9Clog=E2=80=9D file and =
into the spdx
> sources? And have the processing in a script in the script/contrib folder=
.
>
> Then the logic can be used to have the independent tool. We already have
> part of the logic in meta/recipes-kernel/linux/generate-cve-exclusions.py
>
>
>
> Thanks
>
>
>
> Daniel
>
>
>
> *From:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> *On Behalf Of *Marta Rybczynska
> via lists.openembedded.org
> *Sent:* Wednesday, 30 April 2025 17:04
> *To:* Daniel Turull <daniel.turull@ericsson.com>
> *Cc:* openembedded-core@lists.openembedded.org; Peter.Marko@siemens.com;
> richard.purdie@linuxfoundation.org
> *Subject:* Re: [OE-core] [PATCH v3 1/8] linux-vulns: fetch kernel.org CNA
> info
>
>
>
> Hell Daniel,
>
> Thanks for the work. I plan to take some time in the next day to have a
> look and provide a viewpoint of what makes sense to do next.
>
>
>
> BTW This code is shorter than I expect this work to be (and yes, there ar=
e
> multiple people working on the same), and this is good news. It makes a
> review way easier than I expected!
>
>
>
> Kind regards,
>
> Marta
>
>
>
> On Wed, Apr 30, 2025 at 10:32=E2=80=AFAM Daniel Turull <daniel.turull@eri=
csson.com>
> wrote:
>
> Hi again Marta,
>
>
>
> I really appreciate your comments. You are doing a great job in this spac=
e.
>
>
>
> With the post-processing do you mean another task after the do_cve_check
> or outside the build, maybe in a script in openembedded-core/scripts?
>
>
>
> I see benefits in both (in the build and outside). If we keep it in the
> build we have more accurate data at the time of the build, while outside
> can be easily updated with new information.
>
> We also include missing information and add resilience having multiple
> sources.
>
>
>
> Before sending another round of patches, I=E2=80=99ll like to reach some =
consensus
> how we should implement this, and your comments together with Peter=E2=80=
=99s and
> Richard=E2=80=99s will be very appreciated.
>
>
>
> New proposal:
>
>    - Keep as option to extract the compiled file, and store them in spdx
>    as well. Basically:
>
>
>    1. kernel: add support to extract compiled files
>
>
>    - store the file in log/cve/ with a unique name
>
>
>    2. spdx: add option to include only compiled kernel files
>
>
>    - Add option to have multiple sources of cve, in cve-check, using
>    vulns or cvelistv5
>    - Keep the bug fixes, though probably I could send them independently
>    from this series.
>    - And then we have 3 options:
>
>
>    1. Keep the existing cve-check, vex, spdx: use metadata from
>       linux-vulns
>       2. Create a new a post-processing script in
>       openembedded-core/scripts that triages CVEs with files that are not
>       compiled that matches a CVEs, with similar functionality as the one
>       proposed in cve-check, vex, spdx: use metadata from linux-vulns to =
enhance
>       CVE reporting. But then in cveinfo in the SPDX won=E2=80=99t be acc=
urate, since now
>       I was adding the fixes in the get_patched_cves. On the other hand, =
this
>       also get outdated, and for the not applicable with already have the
>       CVE_STATUS.
>       3. Have both 1 and 2, since they are not mutually exclusive. Now
>       probably I=E2=80=99m lining more to this option.
>
>
>
> For the new script, the first version of the script will take as input th=
e
> output from the kernel gen_compile_commands.py, a directory to vulns or
> cvelistv5, and the cve-summary.json and generate a new cve-summary with
> updated information. This potentially could be integrated on the scripts
> that Marta has on vex or use as input. For example:
>
>                ./improve_kernel_cve_reporting.py --sources
> compile_commands.json --cve-data <dir to vulns or cvelistv5>
> --old-cve-report cve-summary.json =E2=80=93new-cve-report cve-summary-enh=
ance.json
>
>
>
> How does it sound? Or do you have a better proposal?
>
>
>
> And for the question comparing with using only the NVD database, I=E2=80=
=99m
> getting less CVEs, since some do not have their cpe, due to their big
> backlog.
>
>
>
> I  have modified slightly the patches and I can fetch the cvelistv5 repo,
> but it is slower since it contains much more files. But then I guess it
> could be used as a source for the cve_check as alternative source.
>
> CVE files as today:
>
> Vulns: 5941
>
> Cvelistv5: 291484
>
>
>
> When comparing using data from cvelistv5 vs vulns, the functionally to
> exclude based on compiled files has the same results, except that with th=
e
> former the script find more vulnerable CVEs, which later are corrected by
> the data from NVD.
>
>
>
> Only NVD 14
>
> linux-yocto-6.12.23+git-r0 do_cve_check: Found unpatched CVE
> (CVE-1999-0524 CVE-2008-4609 CVE-2010-4563 CVE-2022-0400 CVE-2022-38096
> CVE-2022-4543 CVE-2023-3397 CVE-2023-4010 CVE-2023-6240 CVE-2024-57995
> CVE-2025-21751 CVE-2025-21833 CVE-2025-21949 CVE-2025-37838)
>
>
>
> vulns: 33 vulnerable + 32 not applicable
>
> CVE (CVE-1999-0524 CVE-2008-4609 CVE-2010-4563 CVE-2022-0400
> CVE-2022-38096 CVE-2022-4543 CVE-2023-3397 CVE-2023-4010 CVE-2023-6240
> CVE-2024-57976 CVE-2024-58074 CVE-2024-58093 CVE-2025-21709 CVE-2025-2175=
2
> CVE-2025-21807 CVE-2025-21817 CVE-2025-21833 CVE-2025-21837 CVE-2025-2188=
4
> CVE-2025-22026 CVE-2025-22105 CVE-2025-22108 CVE-2025-22111 CVE-2025-2211=
3
> CVE-2025-22115 CVE-2025-22121 CVE-2025-22122 CVE-2025-22124 CVE-2025-2212=
5
> CVE-2025-22126 CVE-2025-23137 CVE-2025-37838 CVE-2025-40325)
>
>
>
> cvelistv5: 36 vulnerable + 32 not applicable
>
> Found unpatched CVE (CVE-1999-0524 CVE-2008-4609 CVE-2010-4563
> CVE-2021-28711 CVE-2021-28712 CVE-2021-28713 CVE-2022-0400 CVE-2022-38096
> CVE-2022-4543 CVE-2023-3397 CVE-2023-4010 CVE-2023-6240 CVE-2024-57976
> CVE-2024-58074 CVE-2024-58093 CVE-2025-21709 CVE-2025-21752 CVE-2025-2180=
7
> CVE-2025-21817 CVE-2025-21833 CVE-2025-21837 CVE-2025-21884 CVE-2025-2202=
6
> CVE-2025-22105 CVE-2025-22108 CVE-2025-22111 CVE-2025-22113 CVE-2025-2211=
5
> CVE-2025-22121 CVE-2025-22122 CVE-2025-22124 CVE-2025-22125 CVE-2025-2212=
6
> CVE-2025-23137 CVE-2025-37838 CVE-2025-40325)
>
>
>
> Best regards,
>
> Daniel
>
>
>
> *From:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> *On Behalf Of *Daniel Turull
> via lists.openembedded.org
> *Sent:* Tuesday, 29 April 2025 17:29
> *To:* Marta Rybczynska <rybczynska@gmail.com>
> *Cc:* openembedded-core@lists.openembedded.org; Peter.Marko@siemens.com
> *Subject:* Re: [OE-core] [PATCH v3 1/8] linux-vulns: fetch kernel.org CNA
> info
>
>
>
> Hi Marta,
>
> The CVE database from NVD doesn=E2=80=99t have all the metadata, speciall=
y the
> files affected.
>
>
>
> I=E2=80=99ll test it with https://github.com/CVEProject/cvelistV5, since =
the data
> from the kernel should be the same. But the repository is much bigger.
>
>
>
> No, I haven=E2=80=99t tested with world builds. I=E2=80=99ll give it a tr=
y. Probably the
> file that I=E2=80=99m generating with should be specific for a config, so=
 we don=E2=80=99t
> override it.
>
>
>
> Best regards,
>
> Daniel
>
>
>
> *From:* Marta Rybczynska <rybczynska@gmail.com>
> *Sent:* Tuesday, 29 April 2025 16:48
> *To:* Daniel Turull <daniel.turull@ericsson.com>
> *Cc:* openembedded-core@lists.openembedded.org; Peter.Marko@siemens.com
> *Subject:* Re: [OE-core] [PATCH v3 1/8] linux-vulns: fetch kernel.org CNA
> info
>
>
>
> Thank you for providing this work Daniel.
>
>
>
> Are you able to obtain the same result with the raw CVE database? This
> patchset works for the Linux kernel only.
>
>
>
> Also, have you tested if it works with the world build for multiple kerne=
l
> images (i.e. different configs) from the same source tree?
>
>
>
> I would be rather going for a post-processing with a given config after
> generating the json files instead of modifying the processing.
>
>
>
> My 0.02.
>
>
>
> Kind regards,
>
> Marta
>
>
>
> On Tue, Apr 29, 2025 at 4:39=E2=80=AFPM Daniel Turull via lists.openembed=
ded.org
> <daniel.turull=3Dericsson.com@lists.openembedded.org> wrote:
>
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> Add CVE data source for kernel.org.
>
> It includes more information than the one provided by NVD.
> Use similar mechanism and same variables as cve-check to define
> when to update.
>
> To use without internet access, change variable VULNS_URL to a local
> copy or mirror.
>
> CC: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  meta/conf/distro/include/maintainers.inc  |  1 +
>  meta/recipes-core/meta/linux-vulns_git.bb | 76 +++++++++++++++++++++++
>  2 files changed, 77 insertions(+)
>  create mode 100644 meta/recipes-core/meta/linux-vulns_git.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 8065287c17..ec427fe6a4 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -468,6 +468,7 @@ RECIPE_MAINTAINER:pn-lighttpd =3D "Unassigned <
> unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-linux-dummy =3D "Unassigned <
> unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-linux-firmware =3D "Otavio Salvador <
> otavio.salvador@ossystems.com.br>"
>  RECIPE_MAINTAINER:pn-linux-libc-headers =3D "Bruce Ashfield <
> bruce.ashfield@gmail.com>"
> +RECIPE_MAINTAINER:pn-linux-vulns =3D "Unassigned <
> unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-linux-yocto =3D "Bruce Ashfield <
> bruce.ashfield@gmail.com>"
>  RECIPE_MAINTAINER:pn-linux-yocto-dev =3D "Bruce Ashfield <
> bruce.ashfield@gmail.com>"
>  RECIPE_MAINTAINER:pn-linux-yocto-rt =3D "Bruce Ashfield <
> bruce.ashfield@gmail.com>"
> diff --git a/meta/recipes-core/meta/linux-vulns_git.bb
> b/meta/recipes-core/meta/linux-vulns_git.bb
> new file mode 100644
> index 0000000000..fc48558eb8
> --- /dev/null
> +++ b/meta/recipes-core/meta/linux-vulns_git.bb
> @@ -0,0 +1,76 @@
> +SUMMARY =3D "CVE information from kernel.org"
> +DESCRIPTION =3D "Repo for tracking and maintaining the CVE identifiers
> reserved \
> +and assigned to the Linux kernel project."
> +HOMEPAGE =3D "
> https://git.kernel.org/pub/scm/linux/security/vulns.git/about/"
> +LICENSE =3D "GPL-2.0-only & cve-tou"
> +SECTION =3D "base"
> +
> +INHIBIT_DEFAULT_DEPS =3D "1"
> +
> +inherit native
> +inherit nopackages
> +
> +VULNS_URL ?=3D "https://git.kernel.org/pub/scm/linux/security/vulns"
> +CVE_CHECK_KERNEL_DB_DIR ??=3D "${DL_DIR}/CVE_CHECK/vulns"
> +
> +# Use same intervals as cve-update-db-native. By default: once a day
> (24*60*60).
> +# Use 0 to force the update
> +# Use a negative value to skip the update
> +
> +CVE_DB_UPDATE_INTERVAL ??=3D "86400"
> +
> +python do_fetch(){
> +    import os
> +    import bb.utils
> +
> +    bb.utils.export_proxies(d)
> +    db_file =3D d.getVar("CVE_CHECK_KERNEL_DB_DIR")
> +    repo_url =3D d.getVar("VULNS_URL")
> +
> +    try:
> +        import time
> +        update_interval =3D int(d.getVar("CVE_DB_UPDATE_INTERVAL"))
> +
> +        if update_interval < 0:
> +            bb.note("Kernel CVE database update skipped")
> +            return
> +        if time.time() - os.path.getmtime(db_file) < update_interval:
> +            bb.debug(2,"Kernel CVE database, recently updated, skipping"=
)
> +            return
> +
> +    except OSError:
> +        pass
> +
> +    bb.utils.mkdirhier(os.path.dirname(db_file))
> +    # Configure cmd
> +    if not os.path.exists(db_file):
> +        cmd =3D f"git clone {repo_url} {db_file}"
> +    else:
> +        cmd =3D f"git -C {db_file} pull"
> +    try:
> +        bb.fetch2.runfetchcmd(cmd, d)
> +    except bb.fetch2.FetchError as e:
> +        bb.warn(f"Kernel vulns repo url not accessible. {repo_url}")
> +        bb.warn("Set VULNS_URL in local.conf to point to a local copy or
> mirror")
> +}
> +
> +do_clean() {
> +    rm -rf ${CVE_CHECK_KERNEL_DB_DIR}
> +}
> +
> +deltask do_patch
> +deltask do_unpack
> +deltask do_configure
> +deltask do_compile
> +deltask do_install
> +deltask do_populate_sysroot
> +deltask do_runtime_spdx
> +deltask do_create_spdx
> +deltask do_populate_lic
> +deltask do_cve_check
> +
> +do_fetch[nostamp] =3D "1"
> +do_fetch[file-checksums] =3D ""
> +do_fetch[vardeps] =3D ""
> +
> +EXCLUDE_FROM_WORLD =3D "1"
>
>

--0000000000004f7a810635047ac3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Daniel,</div><div>I have had a look and I think=
 that a post-processing tool is the right way to go. If you have the file l=
ist in SPDX, you can do checks, and possibly with other metadata (the kerne=
l CVE database does not list affected kernel options, and that would be a r=
eally valuable information source for such a kind of a check). It will also=
 be code way easier to maintain, as version checks are complex to perform a=
nd debug.</div><div><br></div><div>Where we&#39;re at this: there will be a=
 need to add information about what kind of CVE filtering has been done (th=
e default, filtering by files etc). This might be necessary for maintenance=
 reasons and when you will be comparing check results between firmware vers=
ions et al. A kind of &quot;used_tools&quot; kind of a field will be necess=
ary.<br></div><div><br></div><div>Kind regards,</div><div>Marta<br></div></=
div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Wed, May 7, 2025 at 10:05=E2=80=AFAM Daniel Turull &=
lt;<a href=3D"mailto:daniel.turull@ericsson.com">daniel.turull@ericsson.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div class=3D"msg-2915664117848752070">





<div lang=3D"en-SE" style=3D"overflow-wrap: break-word;">
<div class=3D"m_-2915664117848752070WordSection1">
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">Hello =
Marta,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">Did yo=
u had time to look at it and how to continue the work?<u></u><u></u></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt"><u></u=
>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">Will i=
t make sense that for know I reduce the scope and only add the option to ex=
tract the compiled files in a =E2=80=9Clog=E2=80=9D file and into the spdx =
sources? And have the processing
 in a script in the script/contrib folder.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">Then t=
he logic can be used to have the independent tool. We already have part of =
the logic in meta/recipes-kernel/linux/generate-cve-exclusions.py<u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt"><u></u=
>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">Thanks=
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt"><u></u=
>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">Daniel=
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt"><u></u=
>=C2=A0<u></u></span></p>
<div style=3D"border-width:1pt medium medium;border-style:solid none none;b=
order-color:rgb(225,225,225) currentcolor currentcolor;padding:3pt 0cm 0cm"=
>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11pt;font=
-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-US=
" style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,sans-serif"> <a h=
ref=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blank">o=
penembedded-core@lists.openembedded.org</a> &lt;<a href=3D"mailto:openembed=
ded-core@lists.openembedded.org" target=3D"_blank">openembedded-core@lists.=
openembedded.org</a>&gt;
<b>On Behalf Of </b>Marta Rybczynska via <a href=3D"http://lists.openembedd=
ed.org" target=3D"_blank">lists.openembedded.org</a><br>
<b>Sent:</b> Wednesday, 30 April 2025 17:04<br>
<b>To:</b> Daniel Turull &lt;<a href=3D"mailto:daniel.turull@ericsson.com" =
target=3D"_blank">daniel.turull@ericsson.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a>; <a href=3D"mail=
to:Peter.Marko@siemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>; =
<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">ric=
hard.purdie@linuxfoundation.org</a><br>
<b>Subject:</b> Re: [OE-core] [PATCH v3 1/8] linux-vulns: fetch <a href=3D"=
http://kernel.org" target=3D"_blank">kernel.org</a> CNA info<u></u><u></u><=
/span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"en-SE"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">Hell Daniel,<u></u><u></u></spa=
n></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">Thanks for the work. I plan to =
take some time in the next day to have a look and provide a viewpoint of wh=
at makes sense to do next.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">BTW This code is shorter than I=
 expect this work to be (and yes, there are multiple people working on the =
same), and this is good news. It makes a review way easier than I expected!=
<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">Kind regards,<u></u><u></u></sp=
an></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">Marta<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"en-SE"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">On Wed, Apr 30, 2025 at 10:32</=
span><span lang=3D"en-SE" style=3D"font-family:&quot;Arial&quot;,sans-serif=
">=E2=80=AF</span><span lang=3D"en-SE">AM Daniel Turull &lt;<a href=3D"mail=
to:daniel.turull@ericsson.com" target=3D"_blank">daniel.turull@ericsson.com=
</a>&gt; wrote:<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-width:medium medium medium 1pt;border-style:non=
e none none solid;border-color:currentcolor currentcolor currentcolor rgb(2=
04,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0cm 5pt 4.8pt">
<div>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">Hi aga=
in Marta,</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">=C2=A0=
</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">I real=
ly appreciate your comments. You are doing a great job in this space.</span=
><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">=C2=A0=
</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">With t=
he post-processing do you mean another task after the do_cve_check or outsi=
de the build, maybe in a script in openembedded-core/scripts?
</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">=C2=A0=
</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">I see =
benefits in both (in the build and outside). If we keep it in the build we =
have more accurate data at the time of the build, while
 outside can be easily updated with new information.</span><span lang=3D"en=
-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">We als=
o include missing information and add resilience having multiple sources.</=
span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">=C2=A0=
</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">Before=
 sending another round of patches, I=E2=80=99ll like to reach some consensu=
s how we should implement this, and your comments together with
 Peter=E2=80=99s and Richard=E2=80=99s will be very appreciated.</span><spa=
n lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">=C2=A0=
</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">New pr=
oposal:</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<ul type=3D"disc">
<li class=3D"m_-2915664117848752070m-3202681501638976730msolistparagraph">
<span lang=3D"en-SE" style=3D"font-size:11pt">Keep as option to extract the=
 compiled file, and store them in spdx as well. Basically:</span><span lang=
=3D"en-SE"><u></u><u></u></span></li></ul>
<ul type=3D"disc">
<ol start=3D"1" type=3D"1">
<li class=3D"m_-2915664117848752070m-3202681501638976730msolistparagraph">
<span lang=3D"en-SE" style=3D"font-size:11pt">kernel: add support to extrac=
t compiled files</span><span lang=3D"en-SE"><u></u><u></u></span></li></ol>
</ul>
<ul type=3D"disc">
<ol start=3D"1" type=3D"1">
<ul type=3D"square">
<li class=3D"m_-2915664117848752070m-3202681501638976730msolistparagraph">
<span lang=3D"en-SE" style=3D"font-size:11pt">store the file in log/cve/ wi=
th a unique name</span><span lang=3D"en-SE"><u></u><u></u></span></li></ul>
</ol>
</ul>
<ul type=3D"disc">
<ol start=3D"2" type=3D"1">
<li class=3D"m_-2915664117848752070m-3202681501638976730msolistparagraph">
<span lang=3D"en-SE" style=3D"font-size:11pt">spdx: add option to include o=
nly compiled kernel files</span><span lang=3D"en-SE"><u></u><u></u></span><=
/li></ol>
</ul>
<ul type=3D"disc">
<li class=3D"m_-2915664117848752070m-3202681501638976730msolistparagraph">
<span lang=3D"en-SE" style=3D"font-size:11pt">Add option to have multiple s=
ources of cve, in cve-check, using vulns or cvelistv5</span><span lang=3D"e=
n-SE"><u></u><u></u></span></li><li class=3D"m_-2915664117848752070m-320268=
1501638976730msolistparagraph">
<span lang=3D"en-SE" style=3D"font-size:11pt">Keep the bug fixes, though pr=
obably I could send them independently from this series.</span><span lang=
=3D"en-SE"><u></u><u></u></span></li><li class=3D"m_-2915664117848752070m-3=
202681501638976730msolistparagraph">
<span lang=3D"en-SE" style=3D"font-size:11pt">And then we have 3 options:</=
span><span lang=3D"en-SE"><u></u><u></u></span></li></ul>
<ul type=3D"disc">
<ol start=3D"1" type=3D"1">
<li class=3D"m_-2915664117848752070m-3202681501638976730msolistparagraph">
<span lang=3D"en-SE" style=3D"font-size:11pt">Keep the existing cve-check, =
vex, spdx: use metadata from linux-vulns</span><span lang=3D"en-SE"><u></u>=
<u></u></span></li><li class=3D"m_-2915664117848752070m-3202681501638976730=
msolistparagraph">
<span lang=3D"en-SE" style=3D"font-size:11pt">Create a new a post-processin=
g script in openembedded-core/scripts that triages CVEs with files that are=
 not compiled that matches a CVEs, with similar functionality as the one pr=
oposed in cve-check, vex, spdx: use
 metadata from linux-vulns to enhance CVE reporting. But then in cveinfo in=
 the SPDX won=E2=80=99t be accurate, since now I was adding the fixes in th=
e get_patched_cves. On the other hand, this also get outdated, and for the =
not applicable with already have the CVE_STATUS.</span><span lang=3D"en-SE"=
><u></u><u></u></span></li><li class=3D"m_-2915664117848752070m-32026815016=
38976730msolistparagraph">
<span lang=3D"en-SE" style=3D"font-size:11pt">Have both 1 and 2, since they=
 are not mutually exclusive. Now probably I=E2=80=99m lining more to this o=
ption.</span><span lang=3D"en-SE"><u></u><u></u></span></li></ol>
</ul>
<p class=3D"m_-2915664117848752070m-3202681501638976730msolistparagraph"><s=
pan lang=3D"en-SE" style=3D"font-size:11pt">=C2=A0</span><span lang=3D"en-S=
E"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">For th=
e new script, the first version of the script will take as input the output=
 from the kernel gen_compile_commands.py, a directory
 to vulns or cvelistv5, and the cve-summary.json and generate a new cve-sum=
mary with updated information. This potentially could be integrated on the =
scripts that Marta has on vex or use as input. For example:</span><span lan=
g=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ./improve_kernel_cve_reporting.py --sources compile_commands.json --cve=
-data &lt;dir to vulns or cvelistv5&gt; --old-cve-report
 cve-summary.json =E2=80=93new-cve-report cve-summary-enhance.json</span><s=
pan lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">=C2=A0=
</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">How do=
es it sound? Or do you have a better proposal?</span><span lang=3D"en-SE"><=
u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">=C2=A0=
</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">And fo=
r the question comparing with using only the NVD database, I=E2=80=99m gett=
ing less CVEs, since some do not have their cpe, due to their
 big backlog.</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">=C2=A0=
</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">I =C2=
=A0have modified slightly the patches and I can fetch the cvelistv5 repo, b=
ut it is slower since it contains much more files. But then
 I guess it could be used as a source for the cve_check as alternative sour=
ce.</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">CVE fi=
les as today:</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">Vulns:=
 5941</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">Cvelis=
tv5: 291484</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">=C2=A0=
</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">When c=
omparing using data from cvelistv5 vs vulns, the functionally to exclude ba=
sed on compiled files has the same results, except that
 with the former the script find more vulnerable CVEs, which later are corr=
ected by the data from NVD.
</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">=C2=A0=
</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">Only N=
VD 14</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">linux-=
yocto-6.12.23+git-r0 do_cve_check: Found unpatched CVE (CVE-1999-0524 CVE-2=
008-4609 CVE-2010-4563 CVE-2022-0400 CVE-2022-38096
 CVE-2022-4543 CVE-2023-3397 CVE-2023-4010 CVE-2023-6240 CVE-2024-57995 CVE=
-2025-21751 CVE-2025-21833 CVE-2025-21949 CVE-2025-37838)</span><span lang=
=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">=C2=A0=
</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">vulns:=
 33 vulnerable + 32 not applicable</span><span lang=3D"en-SE"><u></u><u></u=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">CVE (C=
VE-1999-0524 CVE-2008-4609 CVE-2010-4563 CVE-2022-0400 CVE-2022-38096 CVE-2=
022-4543 CVE-2023-3397 CVE-2023-4010 CVE-2023-6240 CVE-2024-57976
 CVE-2024-58074 CVE-2024-58093 CVE-2025-21709 CVE-2025-21752 CVE-2025-21807=
 CVE-2025-21817 CVE-2025-21833 CVE-2025-21837 CVE-2025-21884 CVE-2025-22026=
 CVE-2025-22105 CVE-2025-22108 CVE-2025-22111 CVE-2025-22113 CVE-2025-22115=
 CVE-2025-22121 CVE-2025-22122 CVE-2025-22124
 CVE-2025-22125 CVE-2025-22126 CVE-2025-23137 CVE-2025-37838 CVE-2025-40325=
)</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">=C2=A0=
</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">cvelis=
tv5: 36 vulnerable + 32 not applicable</span><span lang=3D"en-SE"><u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">Found =
unpatched CVE (CVE-1999-0524 CVE-2008-4609 CVE-2010-4563 CVE-2021-28711 CVE=
-2021-28712 CVE-2021-28713 CVE-2022-0400 CVE-2022-38096
 CVE-2022-4543 CVE-2023-3397 CVE-2023-4010 CVE-2023-6240 CVE-2024-57976 CVE=
-2024-58074 CVE-2024-58093 CVE-2025-21709 CVE-2025-21752 CVE-2025-21807 CVE=
-2025-21817 CVE-2025-21833 CVE-2025-21837 CVE-2025-21884 CVE-2025-22026 CVE=
-2025-22105 CVE-2025-22108 CVE-2025-22111
 CVE-2025-22113 CVE-2025-22115 CVE-2025-22121 CVE-2025-22122 CVE-2025-22124=
 CVE-2025-22125 CVE-2025-22126 CVE-2025-23137 CVE-2025-37838 CVE-2025-40325=
)</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">=C2=A0=
</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">Best r=
egards,</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">Daniel=
</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">=C2=A0=
</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<div>
<div style=3D"border-width:1pt medium medium;border-style:solid none none;p=
adding:3pt 0cm 0cm;border-color:currentcolor">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11pt;font=
-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-US=
" style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,sans-serif">
</span><span lang=3D"en-SE"><a href=3D"mailto:openembedded-core@lists.opene=
mbedded.org" target=3D"_blank"><span lang=3D"EN-US" style=3D"font-size:11pt=
;font-family:&quot;Calibri&quot;,sans-serif">openembedded-core@lists.openem=
bedded.org</span></a></span><span lang=3D"EN-US" style=3D"font-size:11pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif">
 &lt;</span><span lang=3D"en-SE"><a href=3D"mailto:openembedded-core@lists.=
openembedded.org" target=3D"_blank"><span lang=3D"EN-US" style=3D"font-size=
:11pt;font-family:&quot;Calibri&quot;,sans-serif">openembedded-core@lists.o=
penembedded.org</span></a></span><span lang=3D"EN-US" style=3D"font-size:11=
pt;font-family:&quot;Calibri&quot;,sans-serif">&gt;
<b>On Behalf Of </b>Daniel Turull via </span><span lang=3D"en-SE"><a href=
=3D"http://lists.openembedded.org/" target=3D"_blank"><span lang=3D"EN-US" =
style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,sans-serif">lists.o=
penembedded.org</span></a></span><span lang=3D"EN-US" style=3D"font-size:11=
pt;font-family:&quot;Calibri&quot;,sans-serif"><br>
<b>Sent:</b> Tuesday, 29 April 2025 17:29<br>
<b>To:</b> Marta Rybczynska &lt;</span><span lang=3D"en-SE"><a href=3D"mail=
to:rybczynska@gmail.com" target=3D"_blank"><span lang=3D"EN-US" style=3D"fo=
nt-size:11pt;font-family:&quot;Calibri&quot;,sans-serif">rybczynska@gmail.c=
om</span></a></span><span lang=3D"EN-US" style=3D"font-size:11pt;font-famil=
y:&quot;Calibri&quot;,sans-serif">&gt;<br>
<b>Cc:</b> </span><span lang=3D"en-SE"><a href=3D"mailto:openembedded-core@=
lists.openembedded.org" target=3D"_blank"><span lang=3D"EN-US" style=3D"fon=
t-size:11pt;font-family:&quot;Calibri&quot;,sans-serif">openembedded-core@l=
ists.openembedded.org</span></a></span><span lang=3D"EN-US" style=3D"font-s=
ize:11pt;font-family:&quot;Calibri&quot;,sans-serif">;
</span><span lang=3D"en-SE"><a href=3D"mailto:Peter.Marko@siemens.com" targ=
et=3D"_blank"><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:&quo=
t;Calibri&quot;,sans-serif">Peter.Marko@siemens.com</span></a></span><span =
lang=3D"EN-US" style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,sans=
-serif"><br>
<b>Subject:</b> Re: [OE-core] [PATCH v3 1/8] linux-vulns: fetch </span><spa=
n lang=3D"en-SE"><a href=3D"http://kernel.org/" target=3D"_blank"><span lan=
g=3D"EN-US" style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,sans-se=
rif">kernel.org</span></a></span><span lang=3D"EN-US" style=3D"font-size:11=
pt;font-family:&quot;Calibri&quot;,sans-serif">
 CNA info</span><span lang=3D"en-SE"><u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">=C2=A0<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">Hi Mar=
ta,</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">The CV=
E database from NVD doesn=E2=80=99t have all the metadata, specially the fi=
les affected.</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">=C2=A0=
</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">I=E2=
=80=99ll test it with
</span><span lang=3D"en-SE"><a href=3D"https://github.com/CVEProject/cvelis=
tV5" target=3D"_blank"><span style=3D"font-size:11pt">https://github.com/CV=
EProject/cvelistV5</span></a></span><span lang=3D"en-SE" style=3D"font-size=
:11pt">, since the data from the kernel
 should be the same. But the repository is much bigger.</span><span lang=3D=
"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">=C2=A0=
</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">No, I =
haven=E2=80=99t tested with world builds. I=E2=80=99ll give it a try. Proba=
bly the file that I=E2=80=99m generating with should be specific for a conf=
ig,
 so we don=E2=80=99t override it.</span><span lang=3D"en-SE"><u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">=C2=A0=
</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">Best r=
egards,</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">Daniel
</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">=C2=A0=
</span><span lang=3D"en-SE"><u></u><u></u></span></p>
<div style=3D"border-width:1pt medium medium;border-style:solid none none;p=
adding:3pt 0cm 0cm;border-color:currentcolor">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11pt;font=
-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-US=
" style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,sans-serif"> Mart=
a
 Rybczynska &lt;</span><span lang=3D"en-SE"><a href=3D"mailto:rybczynska@gm=
ail.com" target=3D"_blank"><span lang=3D"EN-US" style=3D"font-size:11pt;fon=
t-family:&quot;Calibri&quot;,sans-serif">rybczynska@gmail.com</span></a></s=
pan><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:&quot;Calibri&=
quot;,sans-serif">&gt;
<br>
<b>Sent:</b> Tuesday, 29 April 2025 16:48<br>
<b>To:</b> Daniel Turull &lt;</span><span lang=3D"en-SE"><a href=3D"mailto:=
daniel.turull@ericsson.com" target=3D"_blank"><span lang=3D"EN-US" style=3D=
"font-size:11pt;font-family:&quot;Calibri&quot;,sans-serif">daniel.turull@e=
ricsson.com</span></a></span><span lang=3D"EN-US" style=3D"font-size:11pt;f=
ont-family:&quot;Calibri&quot;,sans-serif">&gt;<br>
<b>Cc:</b> </span><span lang=3D"en-SE"><a href=3D"mailto:openembedded-core@=
lists.openembedded.org" target=3D"_blank"><span lang=3D"EN-US" style=3D"fon=
t-size:11pt;font-family:&quot;Calibri&quot;,sans-serif">openembedded-core@l=
ists.openembedded.org</span></a></span><span lang=3D"EN-US" style=3D"font-s=
ize:11pt;font-family:&quot;Calibri&quot;,sans-serif">;
</span><span lang=3D"en-SE"><a href=3D"mailto:Peter.Marko@siemens.com" targ=
et=3D"_blank"><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:&quo=
t;Calibri&quot;,sans-serif">Peter.Marko@siemens.com</span></a></span><span =
lang=3D"EN-US" style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,sans=
-serif"><br>
<b>Subject:</b> Re: [OE-core] [PATCH v3 1/8] linux-vulns: fetch </span><spa=
n lang=3D"en-SE"><a href=3D"http://kernel.org/" target=3D"_blank"><span lan=
g=3D"EN-US" style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,sans-se=
rif">kernel.org</span></a></span><span lang=3D"EN-US" style=3D"font-size:11=
pt;font-family:&quot;Calibri&quot;,sans-serif">
 CNA info</span><span lang=3D"en-SE"><u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">=C2=A0<u></u><u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">Thank you for providing this wo=
rk Daniel.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">Are you able to obtain the same=
 result with the raw CVE database? This patchset works for the Linux kernel=
 only.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">Also, have you tested if it wor=
ks with the world build for multiple kernel images (i.e. different configs)=
 from the same source tree?<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">I would be rather going for a p=
ost-processing with a given config after generating the json files instead =
of modifying the processing.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">My 0.02.<u></u><u></u></span></=
p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">Kind regards,<u></u><u></u></sp=
an></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">Marta<u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">=C2=A0<u></u><u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">On Tue, Apr 29, 2025 at 4:39</s=
pan><span lang=3D"en-SE" style=3D"font-family:&quot;Arial&quot;,sans-serif"=
>=E2=80=AF</span><span lang=3D"en-SE">PM Daniel Turull via
<a href=3D"http://lists.openembedded.org/" target=3D"_blank">lists.openembe=
dded.org</a> &lt;daniel.turull=3D<a href=3D"mailto:ericsson.com@lists.opene=
mbedded.org" target=3D"_blank">ericsson.com@lists.openembedded.org</a>&gt; =
wrote:<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-width:medium medium medium 1pt;border-style:non=
e none none solid;padding:0cm 0cm 0cm 6pt;margin:5pt 0cm 5pt 4.8pt;border-c=
olor:currentcolor currentcolor currentcolor rgb(204,204,204)">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span lang=3D"en-SE">Fr=
om: Daniel Turull &lt;<a href=3D"mailto:daniel.turull@ericsson.com" target=
=3D"_blank">daniel.turull@ericsson.com</a>&gt;<br>
<br>
Add CVE data source for <a href=3D"http://kernel.org/" target=3D"_blank">ke=
rnel.org</a>.<br>
<br>
It includes more information than the one provided by NVD.<br>
Use similar mechanism and same variables as cve-check to define<br>
when to update.<br>
<br>
To use without internet access, change variable VULNS_URL to a local<br>
copy or mirror.<br>
<br>
CC: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" target=3D"_b=
lank">peter.marko@siemens.com</a>&gt;<br>
Signed-off-by: Daniel Turull &lt;<a href=3D"mailto:daniel.turull@ericsson.c=
om" target=3D"_blank">daniel.turull@ericsson.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 |=C2=A0 1 +<br>
=C2=A0meta/recipes-core/meta/<a href=3D"http://linux-vulns_git.bb/" target=
=3D"_blank">linux-vulns_git.bb</a> | 76 +++++++++++++++++++++++<br>
=C2=A02 files changed, 77 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/meta/<a href=3D"http://linux-vul=
ns_git.bb/" target=3D"_blank">linux-vulns_git.bb</a><br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index 8065287c17..ec427fe6a4 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -468,6 +468,7 @@ RECIPE_MAINTAINER:pn-lighttpd =3D &quot;Unassigned &lt;=
<a href=3D"mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned=
@yoctoproject.org</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-linux-dummy =3D &quot;Unassigned &lt;<a href=3D"=
mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproje=
ct.org</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-linux-firmware =3D &quot;Otavio Salvador &lt;<a =
href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.s=
alvador@ossystems.com.br</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-linux-libc-headers =3D &quot;Bruce Ashfield &lt;=
<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfiel=
d@gmail.com</a>&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-linux-vulns =3D &quot;Unassigned &lt;<a href=3D"mailt=
o:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproject.or=
g</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-linux-yocto =3D &quot;Bruce Ashfield &lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail=
.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-linux-yocto-dev =3D &quot;Bruce Ashfield &lt;<a =
href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@g=
mail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-linux-yocto-rt =3D &quot;Bruce Ashfield &lt;<a h=
ref=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gm=
ail.com</a>&gt;&quot;<br>
diff --git a/meta/recipes-core/meta/<a href=3D"http://linux-vulns_git.bb/" =
target=3D"_blank">linux-vulns_git.bb</a> b/meta/recipes-core/meta/<a href=
=3D"http://linux-vulns_git.bb/" target=3D"_blank">linux-vulns_git.bb</a><br=
>
new file mode 100644<br>
index 0000000000..fc48558eb8<br>
--- /dev/null<br>
+++ b/meta/recipes-core/meta/<a href=3D"http://linux-vulns_git.bb/" target=
=3D"_blank">linux-vulns_git.bb</a><br>
@@ -0,0 +1,76 @@<br>
+SUMMARY =3D &quot;CVE information from <a href=3D"http://kernel.org/" targ=
et=3D"_blank">kernel.org</a>&quot;<br>
+DESCRIPTION =3D &quot;Repo for tracking and maintaining the CVE identifier=
s reserved \<br>
+and assigned to the Linux kernel project.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://git.kernel.org/pub/scm/linux/securit=
y/vulns.git/about/" target=3D"_blank">https://git.kernel.org/pub/scm/linux/=
security/vulns.git/about/</a>&quot;<br>
+LICENSE =3D &quot;GPL-2.0-only &amp; cve-tou&quot;<br>
+SECTION =3D &quot;base&quot;<br>
+<br>
+INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
+<br>
+inherit native<br>
+inherit nopackages<br>
+<br>
+VULNS_URL ?=3D &quot;<a href=3D"https://git.kernel.org/pub/scm/linux/secur=
ity/vulns" target=3D"_blank">https://git.kernel.org/pub/scm/linux/security/=
vulns</a>&quot;<br>
+CVE_CHECK_KERNEL_DB_DIR ??=3D &quot;${DL_DIR}/CVE_CHECK/vulns&quot;<br>
+<br>
+# Use same intervals as cve-update-db-native. By default: once a day (24*6=
0*60).<br>
+# Use 0 to force the update<br>
+# Use a negative value to skip the update<br>
+<br>
+CVE_DB_UPDATE_INTERVAL ??=3D &quot;86400&quot;<br>
+<br>
+python do_fetch(){<br>
+=C2=A0 =C2=A0 import os<br>
+=C2=A0 =C2=A0 import bb.utils<br>
+<br>
+=C2=A0 =C2=A0 bb.utils.export_proxies(d)<br>
+=C2=A0 =C2=A0 db_file =3D d.getVar(&quot;CVE_CHECK_KERNEL_DB_DIR&quot;)<br=
>
+=C2=A0 =C2=A0 repo_url =3D d.getVar(&quot;VULNS_URL&quot;)<br>
+<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 import time<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 update_interval =3D int(d.getVar(&quot;CVE_DB_=
UPDATE_INTERVAL&quot;))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if update_interval &lt; 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;Kernel CVE databas=
e update skipped&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if time.time() - os.path.getmtime(db_file) &lt=
; update_interval:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(2,&quot;Kernel CVE data=
base, recently updated, skipping&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
+=C2=A0 =C2=A0 except OSError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
+<br>
+=C2=A0 =C2=A0 bb.utils.mkdirhier(os.path.dirname(db_file))<br>
+=C2=A0 =C2=A0 # Configure cmd<br>
+=C2=A0 =C2=A0 if not os.path.exists(db_file):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D f&quot;git clone {repo_url} {db_file}&=
quot;<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D f&quot;git -C {db_file} pull&quot;<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fetch2.runfetchcmd(cmd, d)<br>
+=C2=A0 =C2=A0 except bb.fetch2.FetchError as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(f&quot;Kernel vulns repo url not acces=
sible. {repo_url}&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Set VULNS_URL in local.conf to p=
oint to a local copy or mirror&quot;)<br>
+}<br>
+<br>
+do_clean() {<br>
+=C2=A0 =C2=A0 rm -rf ${CVE_CHECK_KERNEL_DB_DIR}<br>
+}<br>
+<br>
+deltask do_patch<br>
+deltask do_unpack<br>
+deltask do_configure<br>
+deltask do_compile<br>
+deltask do_install<br>
+deltask do_populate_sysroot<br>
+deltask do_runtime_spdx<br>
+deltask do_create_spdx<br>
+deltask do_populate_lic<br>
+deltask do_cve_check<br>
+<br>
+do_fetch[nostamp] =3D &quot;1&quot;<br>
+do_fetch[file-checksums] =3D &quot;&quot;<br>
+do_fetch[vardeps] =3D &quot;&quot;<br>
+<br>
+EXCLUDE_FROM_WORLD =3D &quot;1&quot;<u></u><u></u></span></p>
</blockquote>
</div>
</div>
</div>
</div>
</div>
</blockquote>
</div>
</div>
</div>

</div></blockquote></div>

--0000000000004f7a810635047ac3--

