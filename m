Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5757C25B76
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 18:21:05 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.2033.1717438857784628379
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 11:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 453IKvnc027502
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Jun 2024 13:20:57 -0500
Received: from [192.168.3.156] ([192.168.3.156])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 453IJm8G009147
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Jun 2024 13:20:56 -0500
Message-ID: <2f11f6ce-d102-4678-a8a9-106bb06d1c46@kernel.crashing.org>
Date: Mon, 3 Jun 2024 13:20:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] RFC: CVE check standalone (introducing yocto-vex-check)
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <CAApg2=RLRbMABzs=WV-6vzYBGFvQbuVf14trJGAD=P14+Mt7aQ@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <CAApg2=RLRbMABzs=WV-6vzYBGFvQbuVf14trJGAD=P14+Mt7aQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 453IKvnc027502
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 18:21:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200279

I reviewed the RFC.  It looks good to me.  I had one minor comment on the=
 2/3 of=20
patch.

Reviewed-by: Mark Hatle <mark.hatle@kernel.crashing.org>

On 5/31/24 9:06 AM, Marta Rybczynska wrote:
> Hello,
> We have been working on the standalone version of the cve-check that ca=
n run=20
> over an SBOM (SPDX+VEX-like information) since April. This is the momen=
t for the=20
> RFC. This way we can verify use cases, discuss what is needed to add an=
d do=20
> testing early! (and the curious people can start running it too)
>=20
> The tooling consists of a patchset over OE-core:
> https://lists.openembedded.org/g/openembedded-core/message/200074=20
> <https://lists.openembedded.org/g/openembedded-core/message/200074>
> https://lists.openembedded.org/g/openembedded-core/message/200075=20
> <https://lists.openembedded.org/g/openembedded-core/message/200075>
> and a modification heeded for the CVE backend (the Kernel CNA uses "lin=
ux" and=20
> not "linux_kernel")
> https://lists.openembedded.org/g/openembedded-core/message/200076=20
> <https://lists.openembedded.org/g/openembedded-core/message/200076>
>=20
> The standalone tool RFC is here:=20
> https://gitlab.com/syslinbit/public/yocto-vex-check=20
> <https://gitlab.com/syslinbit/public/yocto-vex-check> This repo will mi=
grate to=20
> the YP infra, likely in a form of multiple ones (we also have autobuild=
er=20
> changes, and will likely split binary data to a separate repository).
>=20
> The yocto-vex-check supports two databases today: NVD and CVE.
>=20
> How to use the tool (from the README)
>=20
> This tool allows to check SBOMs for vulnerabilities. You can take SBOM/=
VEX of a=20
> Yocto Project build and generate a fresh vulnerability status. It uses =
the SPDX=20
> archive as the list of packages to check, with the additional informati=
on from=20
> the VEX class.
>=20
> WARNING: this tool is under active development, file formats and option=
s do=20
> change regularly.
> Functionalities:
>  =C2=A0- reads YP SPDX 2.2 files and YP cve-check JSON files
>  =C2=A0- converts SPDX/cve-check JSON to VEX (close to OpenVEX)
>  =C2=A0- performs a check for vulnerabilities taking the VEX and using =
the specified=20
> database
>  =C2=A0- uses output of the "vex" class of OpenEmbedded-core
>=20
>  =C2=A0How to use:
>  =C2=A01. Download the database to use:
>  =C2=A0- for NVD, use cve-update-nvd2-native.py
>  =C2=A0- for the CVE database, get the CVEv5 git repository: either the=
 upsteam one=20
> at https://github.com/CVEProject/cvelistV5=20
> <https://github.com/CVEProject/cvelistV5> or the one with OE-related fi=
xes at=20
> https://github.com/mrybczyn/cvelistV5-overrides=20
> <https://github.com/mrybczyn/cvelistV5-overrides> (recommended)
>=20
> 2. Enable the vex class in your YP-based distribution build by adding t=
o your=20
> local.conf:
> INHERIT +=3D "vex"
>=20
> 3. Build your image as usual and note the location of the CVE JSON file=
 (in the=20
> output of the build)
>=20
> 4. (Recommended for production builds) archive the CVE JSON file and th=
e SPDX=20
> archive
>=20
>  =C2=A05. Use the tool as described below at any moment to generate a f=
resh=20
> vulnerability status
>=20
>  =C2=A06. (Optional) You can convert the output to text or CSV format u=
sing=20
> scripts/cve-report.py
>=20
> Descrition of tools:
>=20
> The high-level wrapper performs the whole process of a given database. =
The usage=20
> is as follows:
>=20
>  =C2=A0./wrap-yocto-vex-check.py -i <cve-check-JSON-file> -o <output_di=
r> -t=20
> <temporary_dir> -b <build directory like tmp-glibc> -db <database path>=
 -db-type=20
> <database type>
>=20
> where:
> -i <cve-check-JSON-file> is the CVE JSON file as given in the output of=
 the build
> -o <output_dir> is the output directory for the updated CVE file
> -t <temporary_dir> is a temporary directory used during the scan
> -b <build directory like tmp-glibc> is the build directory that contain=
s the=20
> SPDX archive
> -db <database path> is the path to the database file (NVD) or downloade=
d git=20
> repository (CVE)
> -db-type <database type> is the database type: NVD or CVE
>=20
>  =C2=A0Lower-level tools:
>=20
> - cve-update-nvd2-native.py - allows to download the NVD database
> - yocto-vex-check.py - step-by-step conversions; imports SPDX archive, =
allows to=20
> convert SPDX+CVE JSON to VEX, runs the vulnerability check on the given=
 database
>=20
>  =C2=A0Limitations:
> - today the SPDX generation in YP works for images and SDK, not for the=
 world build
> - the MITRE (CVE) database contains a number of difficult-to-parse entr=
ies;=20
> especially before 2024.
>=20
> We know there are some bugs (one related to the linux_kernel), the fix =
is in=20
> progress.
>=20
> Questions/comments/use-cases welcome!
>=20
> Our questions for further steps:
> 1. We started with the assumption of SPDX as the package list to scan a=
nd the=20
> CVE JSON data as the supplementary data needed for the scan. However, S=
PDX=20
> archive isn't generated for world builds. We can 1) add the only remain=
ing=20
> information to the VEX (CVE-JSON) which is the CPE list and allow to us=
e the VEX=20
> file as source and 2) add the remaining archives to SPDX.
>=20
> At the end we will likely want both, also because SPDX2.2 requires the =
complete=20
> build, and that is long in case of world.
>=20
> 2. The tool currently supports either one backend (CVE, NVD), or the ot=
her.=20
> Results are different. We can merge results by post-processing or add a=
 list of=20
> databases to use. In both cases, there is a difficulty to decide on pri=
ority of=20
> conflicting scan results.
>=20
> 3. We'd like to have unit tests using binary data (static NVD database,=
=20
> specially choosen CVE entries etc). It makes sense to keep them in a se=
parate=20
> repository because of the size.
>=20
> 4. It turned out to be complicated to find locate variables needed to p=
ass to=20
> the tool directly from bitbake. CVE check and SPDX are running at diffe=
rent=20
> phases, and there would be a need for changes in task ordering and poss=
ibly some=20
> inheritance. This is complicated and bug prone, so the question is: wha=
t about=20
> using the tool separately from the build? We can generate configuration=
 files as=20
> the list of options increases
>=20
> What do you think?
>=20
> Regards,
> Marta and Samantha
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200079): https://lists.openembedded.org/g/openembed=
ded-core/message/200079
> Mute This Topic: https://lists.openembedded.org/mt/106408578/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
mark.hatle@kernel.crashing.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

