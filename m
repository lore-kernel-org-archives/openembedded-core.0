Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C8C1C369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 15:04:36 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.935.1746025467607233556
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 08:04:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ShLKGCJb;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: rybczynska@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-879d2e419b9so6692551a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 08:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746025467; x=1746630267; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=af2bqt/THbQdLkUdsdKBB6YoFPfOuzi0HQz/ufPbdi0=;
        b=ShLKGCJbZHueXudjj9MGuP5w/og5H/orWC9vNUz2vh3T5IyvcnVB4ZLEKCi2Xt7nMa
         rIX2JbeQPP3MuuGWLHbtMYC4WGUsNrI74THdsJBNbKO5+S5yHAUoTkJs/PHx8DFnK2ui
         Tf0hRdt3Un/BkgVWsDCMEdWl+NXs5gbbAuOl54TiqE5LMzAodkQj+owzGSPmpXUjNVXw
         lpfiRok71q5SPScktmaYvv2DBJRbqCaIV+G88zXAHT1tw1PAezxlbiN5WosCCeyeaqkK
         TtYH1HyqoG9N61uONnRzfPiXRyd1WVec9OUjy5CqdscRKHR4kyQNNs35MJMK4rPlnL1d
         pHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025467; x=1746630267;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=af2bqt/THbQdLkUdsdKBB6YoFPfOuzi0HQz/ufPbdi0=;
        b=iAfJ0ktscgBqR2uIGVWHaqw1vUAiVi2qD575Nbxl5/2uxNx/mirxh4ii7K/nNQAG/v
         D6e5vtbp0h7WfgOW/mfQJo3CyJeeg6lpk+IMKMeUROggVAdxB6tgWKdCX+Dh2qXWpSFz
         e0Xz52WKDlgiWuTYNHdhoKn1XbuD4dgsbigrMhssl5GMbqCOyMODrWaxsE+RNhvtE94v
         gBmASEsqkeiDoYFvHQOEHJWu7SMR25bzeyGjCP/JyxsxsXHHNlKwaVy0GBmxNDg12PRv
         UDzgLTniUh50MkiWq0pllBawJj/nMDMm17Z20XCJOL2LbTE1gOrzjvmUfCXke+yR8YAk
         mePA==
X-Gm-Message-State: AOJu0YyuWpfZWzKQ361zYLKuQ0BYXSUygCOwQmcv/5t8XDuwWNtpa6RO
	SCQaMVxmyDW71rcMMXCIw9ZlZNUtCTyLMHdIGgvbBQb9nY9Ev2PmSVNsOdliUEBvIorkGtwNjGr
	9JIx10lbAYxKfGqAgJzH6QBkNfeU=
X-Gm-Gg: ASbGncu8/KJypn4vDBFXmT+0dz7+UVbSxAq7vio0QrhcX8fet4jNdiQoQ3uXc3B2tpN
	HbLFVgP3S5K2PierKBM0AiLFU91qEK3tlw1ZCjIwaKNepr/qYZJss1Fk0EjUZRu8DMG/FiXTJNW
	azQHxH1nDFTEPlWFk82miT7JNBo8ZnXOp+VC7iElX9HvFlhuudrot6tgUr
X-Google-Smtp-Source: AGHT+IF68bDKh2u31vAqNvYbOuEKyymMq/5jFC5+iTBGnN2sNjKrtPkCW4QdJS5IRD378u2QIaobN7O8gg9aS5W2760=
X-Received: by 2002:a17:90b:56c8:b0:2fa:157e:c790 with SMTP id
 98e67ed59e1d1-30a332df688mr4681263a91.5.1746025466525; Wed, 30 Apr 2025
 08:04:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250429143904.634082-1-daniel.turull@ericsson.com>
 <20250429143904.634082-2-daniel.turull@ericsson.com> <CAApg2=T7+hrOyfYAYHgy7OBOXL_s2UVPV8RkuBFgQ8vuKaYHpQ@mail.gmail.com>
 <183AD3A846246CA8.415@lists.openembedded.org> <PR3PR07MB66663E510A72EC92AF7A81B88A832@PR3PR07MB6666.eurprd07.prod.outlook.com>
In-Reply-To: <PR3PR07MB66663E510A72EC92AF7A81B88A832@PR3PR07MB6666.eurprd07.prod.outlook.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 30 Apr 2025 17:04:14 +0200
X-Gm-Features: ATxdqUFFQgR2CV9qOml-5upaSch0GDitbFNsPQhGpdg4sASbfK1oZiHxQ4YZCrY
Message-ID: <CAApg2=T02-Wg17_BXhZt=hGP=WS2r8PJbLhB4ttksg8+nH2Qrg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/8] linux-vulns: fetch kernel.org CNA info
To: Daniel Turull <daniel.turull@ericsson.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Peter.Marko@siemens.com" <Peter.Marko@siemens.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000b37e8d0634003b52"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 15:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215751

--000000000000b37e8d0634003b52
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hell Daniel,
Thanks for the work. I plan to take some time in the next day to have a
look and provide a viewpoint of what makes sense to do next.

BTW This code is shorter than I expect this work to be (and yes, there are
multiple people working on the same), and this is good news. It makes a
review way easier than I expected!

Kind regards,
Marta

On Wed, Apr 30, 2025 at 10:32=E2=80=AFAM Daniel Turull <daniel.turull@erics=
son.com>
wrote:

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
>       1. kernel: add support to extract compiled files
>          - store the file in log/cve/ with a unique name
>       2. spdx: add option to include only compiled kernel files
>    - Add option to have multiple sources of cve, in cve-check, using
>    vulns or cvelistv5
>    - Keep the bug fixes, though probably I could send them independently
>    from this series.
>    - And then we have 3 options:
>       1. Keep the existing cve-check, vex, spdx: use metadata from
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

--000000000000b37e8d0634003b52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hell Daniel,</div><div>Thanks for the work. I plan to=
 take some time in the next day to have a look and provide a viewpoint of w=
hat makes sense to do next.<br></div><div><br></div><div>BTW This code is s=
horter than I expect this work to be (and yes, there are multiple people wo=
rking on the same), and this is good news. It makes a review way easier tha=
n I expected!</div><div><br></div><div>Kind regards,</div><div>Marta<br></d=
iv></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"l=
tr" class=3D"gmail_attr">On Wed, Apr 30, 2025 at 10:32=E2=80=AFAM Daniel Tu=
rull &lt;<a href=3D"mailto:daniel.turull@ericsson.com">daniel.turull@ericss=
on.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div class=3D"msg-3202681501638976730">





<div lang=3D"en-SE" style=3D"overflow-wrap: break-word;">
<div class=3D"m_-3202681501638976730WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Hi again Marta,<u></u=
><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">I really appreciate y=
our comments. You are doing a great job in this space.<u></u><u></u></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">With the post-process=
ing do you mean another task after the do_cve_check or outside the build, m=
aybe in a script in openembedded-core/scripts?
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">I see benefits in bot=
h (in the build and outside). If we keep it in the build we have more accur=
ate data at the time of the build, while outside can be easily updated with=
 new information.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">We also include missi=
ng information and add resilience having multiple sources.<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Before sending anothe=
r round of patches, I=E2=80=99ll like to reach some consensus how we should=
 implement this, and your comments together with Peter=E2=80=99s and Richar=
d=E2=80=99s will be very appreciated.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">New proposal:<u></u><=
u></u></span></p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li class=3D"m_-3202681501638976730MsoListParagraph" style=3D"margin-left:0=
cm"><span style=3D"font-size:11pt">Keep as option to extract the compiled f=
ile, and store them in spdx as well. Basically:<u></u><u></u></span></li><o=
l style=3D"margin-top:0cm" start=3D"1" type=3D"1">
<li class=3D"m_-3202681501638976730MsoListParagraph" style=3D"margin-left:0=
cm"><span style=3D"font-size:11pt">kernel: add support to extract compiled =
files<u></u><u></u></span></li><ul style=3D"margin-top:0cm" type=3D"square"=
>
<li class=3D"m_-3202681501638976730MsoListParagraph" style=3D"margin-left:0=
cm"><span style=3D"font-size:11pt">store the file in log/cve/ with a unique=
 name<u></u><u></u></span></li></ul>
<li class=3D"m_-3202681501638976730MsoListParagraph" style=3D"margin-left:0=
cm"><span style=3D"font-size:11pt">spdx: add option to include only compile=
d kernel files<u></u><u></u></span></li></ol>
<li class=3D"m_-3202681501638976730MsoListParagraph" style=3D"margin-left:0=
cm"><span style=3D"font-size:11pt">Add option to have multiple sources of c=
ve, in cve-check, using vulns or cvelistv5<u></u><u></u></span></li><li cla=
ss=3D"m_-3202681501638976730MsoListParagraph" style=3D"margin-left:0cm"><sp=
an style=3D"font-size:11pt">Keep the bug fixes, though probably I could sen=
d them independently from this series.<u></u><u></u></span></li><li class=
=3D"m_-3202681501638976730MsoListParagraph" style=3D"margin-left:0cm"><span=
 style=3D"font-size:11pt">And then we have 3 options:<u></u><u></u></span><=
/li><ol style=3D"margin-top:0cm" start=3D"1" type=3D"1">
<li class=3D"m_-3202681501638976730MsoListParagraph" style=3D"margin-left:0=
cm"><span style=3D"font-size:11pt">Keep the existing cve-check, vex, spdx: =
use metadata from linux-vulns<u></u><u></u></span></li><li class=3D"m_-3202=
681501638976730MsoListParagraph" style=3D"margin-left:0cm"><span style=3D"f=
ont-size:11pt">Create a new a post-processing script in openembedded-core/s=
cripts that triages CVEs with files that are not compiled that matches a CV=
Es, with similar
 functionality as the one proposed in cve-check, vex, spdx: use metadata fr=
om linux-vulns to enhance CVE reporting. But then in cveinfo in the SPDX wo=
n=E2=80=99t be accurate, since now I was adding the fixes in the get_patche=
d_cves. On the other hand, this also get
 outdated, and for the not applicable with already have the CVE_STATUS.<u><=
/u><u></u></span></li><li class=3D"m_-3202681501638976730MsoListParagraph" =
style=3D"margin-left:0cm"><span style=3D"font-size:11pt">Have both 1 and 2,=
 since they are not mutually exclusive. Now probably I=E2=80=99m lining mor=
e to this option.<u></u><u></u></span></li></ol>
</ul>
<p class=3D"m_-3202681501638976730MsoListParagraph"><span style=3D"font-siz=
e:11pt"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">For the new script, t=
he first version of the script will take as input the output from the kerne=
l gen_compile_commands.py, a directory to vulns or cvelistv5, and the cve-s=
ummary.json and generate a new cve-summary
 with updated information. This potentially could be integrated on the scri=
pts that Marta has on vex or use as input. For example:<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ./improve_k=
ernel_cve_reporting.py --sources compile_commands.json --cve-data &lt;dir t=
o vulns or cvelistv5&gt; --old-cve-report cve-summary.json =E2=80=93new-cve=
-report cve-summary-enhance.json<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">How does it sound? Or=
 do you have a better proposal?<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">And for the question =
comparing with using only the NVD database, I=E2=80=99m getting less CVEs, =
since some do not have their cpe, due to their big backlog.<u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">I =C2=A0have modified=
 slightly the patches and I can fetch the cvelistv5 repo, but it is slower =
since it contains much more files. But then I guess it could be used as a s=
ource for the cve_check as alternative
 source.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">CVE files as today:<u=
></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Vulns: 5941<u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Cvelistv5: 291484<u><=
/u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">When comparing using =
data from cvelistv5 vs vulns, the functionally to exclude based on compiled=
 files has the same results, except that with the former the script find mo=
re vulnerable CVEs, which later are
 corrected by the data from NVD. <u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Only NVD 14<u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">linux-yocto-6.12.23+g=
it-r0 do_cve_check: Found unpatched CVE (CVE-1999-0524 CVE-2008-4609 CVE-20=
10-4563 CVE-2022-0400 CVE-2022-38096 CVE-2022-4543 CVE-2023-3397 CVE-2023-4=
010 CVE-2023-6240 CVE-2024-57995 CVE-2025-21751
 CVE-2025-21833 CVE-2025-21949 CVE-2025-37838)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">vulns: 33 vulnerable =
+ 32 not applicable<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">CVE (CVE-1999-0524 CV=
E-2008-4609 CVE-2010-4563 CVE-2022-0400 CVE-2022-38096 CVE-2022-4543 CVE-20=
23-3397 CVE-2023-4010 CVE-2023-6240 CVE-2024-57976 CVE-2024-58074 CVE-2024-=
58093 CVE-2025-21709 CVE-2025-21752
 CVE-2025-21807 CVE-2025-21817 CVE-2025-21833 CVE-2025-21837 CVE-2025-21884=
 CVE-2025-22026 CVE-2025-22105 CVE-2025-22108 CVE-2025-22111 CVE-2025-22113=
 CVE-2025-22115 CVE-2025-22121 CVE-2025-22122 CVE-2025-22124 CVE-2025-22125=
 CVE-2025-22126 CVE-2025-23137 CVE-2025-37838
 CVE-2025-40325)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">cvelistv5: 36 vulnera=
ble + 32 not applicable<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Found unpatched CVE (=
CVE-1999-0524 CVE-2008-4609 CVE-2010-4563 CVE-2021-28711 CVE-2021-28712 CVE=
-2021-28713 CVE-2022-0400 CVE-2022-38096 CVE-2022-4543 CVE-2023-3397 CVE-20=
23-4010 CVE-2023-6240 CVE-2024-57976
 CVE-2024-58074 CVE-2024-58093 CVE-2025-21709 CVE-2025-21752 CVE-2025-21807=
 CVE-2025-21817 CVE-2025-21833 CVE-2025-21837 CVE-2025-21884 CVE-2025-22026=
 CVE-2025-22105 CVE-2025-22108 CVE-2025-22111 CVE-2025-22113 CVE-2025-22115=
 CVE-2025-22121 CVE-2025-22122 CVE-2025-22124
 CVE-2025-22125 CVE-2025-22126 CVE-2025-23137 CVE-2025-37838 CVE-2025-40325=
)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Best regards,<u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Daniel<u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<div>
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
<b>On Behalf Of </b>Daniel Turull via <a href=3D"http://lists.openembedded.=
org" target=3D"_blank">lists.openembedded.org</a><br>
<b>Sent:</b> Tuesday, 29 April 2025 17:29<br>
<b>To:</b> Marta Rybczynska &lt;<a href=3D"mailto:rybczynska@gmail.com" tar=
get=3D"_blank">rybczynska@gmail.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a>; <a href=3D"mail=
to:Peter.Marko@siemens.com" target=3D"_blank">Peter.Marko@siemens.com</a><b=
r>
<b>Subject:</b> Re: [OE-core] [PATCH v3 1/8] linux-vulns: fetch <a href=3D"=
http://kernel.org" target=3D"_blank">kernel.org</a> CNA info<u></u><u></u><=
/span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">Hi Mar=
ta,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">The CV=
E database from NVD doesn=E2=80=99t have all the metadata, specially the fi=
les affected.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt"><u></u=
>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">I=E2=
=80=99ll test it with
<a href=3D"https://github.com/CVEProject/cvelistV5" target=3D"_blank">https=
://github.com/CVEProject/cvelistV5</a>, since the data from the kernel shou=
ld be the same. But the repository is much bigger.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt"><u></u=
>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">No, I =
haven=E2=80=99t tested with world builds. I=E2=80=99ll give it a try. Proba=
bly the file that I=E2=80=99m generating with should be specific for a conf=
ig, so we don=E2=80=99t override it.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt"><u></u=
>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">Best r=
egards,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt">Daniel
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-SE" style=3D"font-size:11pt"><u></u=
>=C2=A0<u></u></span></p>
<div style=3D"border-width:1pt medium medium;border-style:solid none none;b=
order-color:rgb(225,225,225) currentcolor currentcolor;padding:3pt 0cm 0cm"=
>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11pt;font=
-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-US=
" style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,sans-serif"> Mart=
a Rybczynska &lt;<a href=3D"mailto:rybczynska@gmail.com" target=3D"_blank">=
rybczynska@gmail.com</a>&gt;
<br>
<b>Sent:</b> Tuesday, 29 April 2025 16:48<br>
<b>To:</b> Daniel Turull &lt;<a href=3D"mailto:daniel.turull@ericsson.com" =
target=3D"_blank">daniel.turull@ericsson.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a>;
<a href=3D"mailto:Peter.Marko@siemens.com" target=3D"_blank">Peter.Marko@si=
emens.com</a><br>
<b>Subject:</b> Re: [OE-core] [PATCH v3 1/8] linux-vulns: fetch <a href=3D"=
http://kernel.org" target=3D"_blank">kernel.org</a> CNA info<u></u><u></u><=
/span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"en-SE"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">Thank you for providing this wo=
rk Daniel.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">Are you able to obtain the same=
 result with the raw CVE database? This patchset works for the Linux kernel=
 only.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">Also, have you tested if it wor=
ks with the world build for multiple kernel images (i.e. different configs)=
 from the same source tree?<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">I would be rather going for a p=
ost-processing with a given config after generating the json files instead =
of modifying the processing.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"en-SE">My 0.02.<u></u><u></u></span></=
p>
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
<p class=3D"MsoNormal"><span lang=3D"en-SE"><u></u>=C2=A0<u></u></span></p>
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
e none none solid;border-color:currentcolor currentcolor currentcolor rgb(2=
04,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0cm 5pt 4.8pt">
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

</div></blockquote></div>

--000000000000b37e8d0634003b52--

