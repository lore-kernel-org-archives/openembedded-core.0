Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A10BEB5948
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 00:18:33 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7752.1770769103641457664
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 16:18:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 61B0IISG008290;
	Tue, 10 Feb 2026 18:18:18 -0600
Received: from [192.168.2.236] ([192.168.2.236])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 61B0IHaq004845;
	Tue, 10 Feb 2026 18:18:17 -0600
Message-ID: <fc94731f-2044-4573-920b-b32c2cee4cf8@kernel.crashing.org>
Date: Tue, 10 Feb 2026 18:18:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Openembedded-architecture] Comparing cve-check with
 sbom-cve-check
Content-Language: en-US
To: Joshua Watt <jpewhacker@gmail.com>
Cc: ross.burton@arm.com,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>,
        "benjamin.robin@bootlin.com" <benjamin.robin@bootlin.com>
References: <2CD10DD9-FB2A-4B10-B98A-85918EB6B4B7@arm.com>
 <e8021b4e-fbae-4f19-8fe5-832b72f88e80@kernel.crashing.org>
 <CAJdd5GZoqkHpP+D33T9huzmWbuuqKewpeG=H=hXut7xH5Ozi6w@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <CAJdd5GZoqkHpP+D33T9huzmWbuuqKewpeG=H=hXut7xH5Ozi6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 61B0IISG008290
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 00:18:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230942



On 2/10/26 6:00 PM, Joshua Watt wrote:
> On Tue, Feb 10, 2026 at 4:45=E2=80=AFPM Mark Hatle
> <mark.hatle@kernel.crashing.org> wrote:
>>
>> After doing some unrelated work, I think I need to point out something=
 I think
>> has been missed in this discussion.
>>
>> Not all DEPLOYED content is in an image.  deployed content can include=
 firmware
>> components built by the system as well.  These ARE target packages, bu=
t they may
>> involve raw data flashed directly to a QSPI/OSPI, copied into a magic =
memory
>> location, etc.
>=20
> Yes this is a know limitation of our current SBoM generation: It only
> works for images. It's on the TODO list to fix this, but it's tricky
> because while images are well formed with a defined task workflow,
> "deployed" artifacts are the wild west in how they work (you don't
> even need to call the task "do_deploy"), so some thought needs to be
> done to figure out how to address that.
>=20
>>
>> So there MUST be a way to handle these situations as part of the SPDX,=
 SBOM and
>> CVE processing.  (This appears to be a gap in the current implementati=
on today.)

MUST is there must be a way to do this, not that it is done for random ex=
ternal=20
packages automatically.

I.e. if I deploy my qspi and it contains a binary blob, and u-boot.  I ne=
ed a=20
way to tell it a manifest of: "this binary blob", "u-boot" ... and then h=
ave it=20
do the same thing it does for other images.

So I think it would be completely reasonable for a qspi recipe to include=
 one or=20
more CVE/License/SPDX/SBOM, fill out one or more variables as a list of t=
hings=20
that are included into this item, and then have the same(similar) code pr=
oduce=20
the output that a regular image would.

I'm hoping this is as 'simple' as collecting a manifest and processing it=
, but I=20
don't honestly know.

> I'm not sure that it MUST be done as a prerequisite; AFAIK all the
> current CVE scanning we do is either 1) per image (see vex.bbclass and
> cve-check.bbclass) or per-recipe (without building anything, e.g.
> cve-check.bbclass). We will have the same functionality with this new
> system where you can either scan a filesystem image, or all recipes
> (without building) with the SPDX scanning code. I don't really want to
> say that we MUST fix the deployed artifacts problem to roll this out
> when that's not even a covered use case of the current implementation
> :) If you want to make sure you cover all your bases, I would
> recommend doing both types of scans, as the all-recipe CVE analysis
> should catch all CVEs (at the expense of more false positives since it
> can't do as much filtering as per-image SBoMs can).
>=20
> However, the ideal case would be once we do eventually solve the
> deployed artifact problem, sbom-cve-check won't need special logic to
> understand it since it's just more data in the SBoM.

Yes.

--Mark

>>
>> --Mark
>>
>> On 2/4/26 11:29 AM, Ross Burton via lists.openembedded.org wrote:
>>> Hi,
>>>
>>> I spent a little time this week comparing our cve-check with Bootlin=E2=
=80=99s sbom-cve-check[1].
>>>
>>> tl;dr: has promise, needs a little further work. I think we can swap =
cve-check for sbom-cve-check in the LTS if we hurry.
>>>
>>> The background to this is that the existing cve-check class has some =
known limitations:
>>> - Uses the FKIE fork of the NVD database as a source of CVE data, whi=
ch does not have the level of metadata it used to have
>>> - Only can be ran as part of a bitbake run, no way to do repeat scans=
 a month later without involving bitbake
>>>
>>> Whereas sbom-cve-check is:
>>> (1) an independent tool,
>>> (2) scanning a SPDX manifest,
>>> (2) using both the FKIE/NVD database and the CVE Project cvelist.
>>>
>>> To elaborate on those points:
>>>
>>> 1) As an independent tool it can be ran at build time (potentially us=
ing meta-sbom-cve-check[2], or by calling the tool directly), or at any p=
oint in time after the build using just archived metadata to check for ne=
w issues. This is very useful for manufacturers who want to scan for issu=
es routinely without having to do builds.
>>>
>>> 2) Whereas cve-check scans for CVEs at build-time in a recipe task an=
d will (badly) generate aggregate reports for images, sbom-cve-check uses=
 the image SPDX to know what products to look for issues in. This means i=
t _only_ supports the =E2=80=9Cwhat issues does my image have=E2=80=9D us=
e-case and not =E2=80=9Cwhat issues are on my build machine=E2=80=9D (eg =
issues in native tools).
>>>
>>> 3) The use of two different databases means it has more scope for imp=
roved metadata.  It currently supports the FKIE mirror of the NVD data, t=
he CVE List by the CVE Project (which is gaining improved metadata via th=
eir Enrichment Program), and further sources would be simple to add.
>>>
>>> As a test I did a build of core-image-sato and generated a report usi=
ng both cve-check and sbom-cve-check.  The differences were interesting.
>>>
>>> cve-check produced this report for the whole build:
>>>
>>> WARNING: avahi-0.8-r0 do_cve_check: Found unpatched CVE (CVE-2025-595=
29 CVE-2025-68468 CVE-2025-68471)
>>> WARNING: busybox-1.37.0-r0 do_cve_check: Found unpatched CVE (CVE-202=
5-60876)
>>> WARNING: expat-2.7.3-r0 do_cve_check: Found unpatched CVE (CVE-2025-6=
6382 CVE-2026-24515)
>>> WARNING: expat-native-2.7.3-r0 do_cve_check: Found unpatched CVE (CVE=
-2025-66382 CVE-2026-24515)
>>> WARNING: ffmpeg-8.0.1-r0 do_cve_check: Found unpatched CVE (CVE-2023-=
51791 CVE-2023-51793 CVE-2023-51794 CVE-2023-51795 CVE-2023-51796 CVE-202=
3-51797 CVE-2023-51798 CVE-2025-22921 CVE-2025-25468 CVE-2025-25469)
>>> WARNING: glibc-2.42+git-r1 do_cve_check: Found unpatched CVE (CVE-201=
0-4756)
>>> WARNING: libpam-1.7.1-r0 do_cve_check: Found unpatched CVE (CVE-2024-=
10041)
>>> WARNING: libsndfile1-1.2.2-r0 do_cve_check: Found unpatched CVE (CVE-=
2024-50613 CVE-2025-52194 CVE-2025-56226)
>>> WARNING: linux-yocto-6.18.6+git-r0 do_cve_check: Found unpatched CVE =
(CVE-2008-4609 CVE-2010-4563 CVE-2019-14899 CVE-2021-3714 CVE-2021-3864 C=
VE-2022-0400 CVE-2022-1247 CVE-2022-38096 CVE-2022-4543 CVE-2023-3397 CVE=
-2023-3640 CVE-2023-39176 CVE-2023-39179 CVE-2023-39180 CVE-2023-4010 CVE=
-2023-6238 CVE-2023-6240 CVE-2023-6535)
>>> WARNING: polkit-127-r0 do_cve_check: Found unpatched CVE (CVE-2016-25=
68)
>>> WARNING: qemu-native-10.2.0-r0 do_cve_check: Found unpatched CVE (CVE=
-2019-12067 CVE-2021-20255 CVE-2024-6519)
>>> WARNING: qemu-system-native-10.2.0-r0 do_cve_check: Found unpatched C=
VE (CVE-2019-12067 CVE-2021-20255 CVE-2024-6519)
>>> WARNING: vim-9.1.1683-r0 do_cve_check: Found unpatched CVE (CVE-2025-=
66476)
>>>
>>> Aside: cve-check=E2=80=99s per-image reporting appears to be slightly=
 broken and claimed that my sato image included images from meta-oe, whic=
h it did not. The report above is the reporting that is logged during the=
 build.
>>>
>>> After writing some tooling for textual summaries, sbom-cve-check prod=
uced a report that is similar. The recipe list has differences: vim and a=
 handful of other are  not listed; but previously unreported CVEs in busy=
box, cairo, expat, glib-networking, gnupg, libgcrypt, libsoup, libxml2, m=
pg123, perl, tar, and the kernel are added.
>>>
>>> The recipes that are not listed are either native tools (which, by de=
finition, are not in the image) or recipes that are built for dependencie=
s but do not end up in the this specific image. In this case, dosfstools-=
ptest RDEPENDS on xxd which is built by vim, but as dosfstools-ptest is n=
ot installed there is no need for xxd.
>>>
>>> A number of CVEs are added, for example CVE-2024-58251 is a CVE in bu=
sybox which is missing the machine-readable CPE in the NVD data[3] but th=
e CVE List has been =E2=80=9Cenriched=E2=80=9D and has machine-readable d=
ata[4].  I=E2=80=99ve not yet triaged every one to identify the reason fo=
r the addition, but I expect this is the main reason.
>>>
>>> A more interesting feature gap is where a recipe statically links to =
another recipe: in this case there is no SPDX package entry for the libra=
ry, so issues in the library will not be reported. With cve-check, the bu=
ild-report will cover this, but the image-report will not.
>>>
>>> To summarise [5] the pros and cons:
>>> + sbom-cve-check can run at any point after the build
>>> + has better data sources which report more issues
>>> - only scans the literal packages that are in a final image, so we do=
n=E2=80=99t get coverage of native packages or static linkage
>>>
>>> I wonder if the easiest fix for this gap is to enhance the SPDX gener=
ation to not only generate an =E2=80=9Cimage SPDX=E2=80=9D but also a =E2=
=80=9Cbuild SPDX=E2=80=9D, which is essentially an aggregation of every r=
ecipe=E2=80=99s SPDX that is present. A recursive execution of the SPDX g=
eneration task will mean this covers both any native tools and static lib=
raries that are in the dependency graph, for maximal coverage.
>>>
>>> This gives a solution without needing to be more clever in the image =
SPDX generation, for example including packages for all of the build depe=
ndencies (be them native or target).
>>>
>>> If this is done then I think sbom-cve-check is at least at parity wit=
h cve-check, and in many ways far superior. This will allow us to merge t=
he few recipes and class from meta-sbom-cve-check into core, and delete c=
ve-check.
>>>
>>> Any thoughts? (looking at Josh and Benjamin primarily)
>>>
>>> Thanks,
>>> Ross
>>>
>>> [1] https://github.com/bootlin/sbom-cve-check
>>> [2] https://github.com/bootlin/meta-sbom-cve-check
>>> [3] https://nvd.nist.gov/vuln/detail/CVE-2024-58251
>>> [4] https://www.cve.org/CVERecord?id=3DCVE-2024-58251
>>> [5] At this point I=E2=80=99m realising I need to read The Art of Exp=
lanation by Ros Atkins...
>>>
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#2232): https://lists.openembedded.org/g/openembed=
ded-architecture/message/2232
>>> Mute This Topic: https://lists.openembedded.org/mt/117638559/3616948
>>> Group Owner: openembedded-architecture+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-architectu=
re/unsub [mark.hatle@kernel.crashing.org]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>

