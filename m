Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA3EEE20BA
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 17:22:24 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2780.1770398543965671658
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 09:22:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 616HM84T3901179;
	Fri, 6 Feb 2026 11:22:08 -0600
Received: from [192.168.2.137] ([192.168.2.137])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 616HM7Pu004947;
	Fri, 6 Feb 2026 11:22:07 -0600
Message-ID: <5d54066e-2a1f-42cc-b4f3-bf7ad49da5dc@kernel.crashing.org>
Date: Fri, 6 Feb 2026 11:22:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Openembedded-architecture] Comparing cve-check with
 sbom-cve-check
Content-Language: en-US
To: ross.burton@arm.com,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        openembedded-architecture <openembedded-architecture@lists.openembedded.org>
Cc: Joshua Watt <JPEWhacker@gmail.com>,
        "benjamin.robin@bootlin.com" <benjamin.robin@bootlin.com>
References: <2CD10DD9-FB2A-4B10-B98A-85918EB6B4B7@arm.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <2CD10DD9-FB2A-4B10-B98A-85918EB6B4B7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 616HM84T3901179
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 17:22:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230630

All of these improvements sound like a really good idea to me.

I'm definitely on board with an image and build SPDX.  They both have val=
ue, and=20
I know for my own purposes I often compare what is in an image to a build=
=20
looking for things that could have been missed (such as static linking).

(There are ways we can identify static linking with dwarf debug symbols. =
 Some=20
work has been done on this in the past, but I also know we do our best to=
 avoid=20
static linking so it's not really progressed very far.   If we do know of=
 places=20
where there is static linking that is NOT be identified in another way, i=
t might=20
be reason to finally spend some effort on that work again.)

--Mark

On 2/4/26 11:29 AM, Ross Burton via lists.openembedded.org wrote:
> Hi,
>=20
> I spent a little time this week comparing our cve-check with Bootlin=E2=
=80=99s sbom-cve-check[1].
>=20
> tl;dr: has promise, needs a little further work. I think we can swap cv=
e-check for sbom-cve-check in the LTS if we hurry.
>=20
> The background to this is that the existing cve-check class has some kn=
own limitations:
> - Uses the FKIE fork of the NVD database as a source of CVE data, which=
 does not have the level of metadata it used to have
> - Only can be ran as part of a bitbake run, no way to do repeat scans a=
 month later without involving bitbake
>=20
> Whereas sbom-cve-check is:
> (1) an independent tool,
> (2) scanning a SPDX manifest,
> (2) using both the FKIE/NVD database and the CVE Project cvelist.
>=20
> To elaborate on those points:
>=20
> 1) As an independent tool it can be ran at build time (potentially usin=
g meta-sbom-cve-check[2], or by calling the tool directly), or at any poi=
nt in time after the build using just archived metadata to check for new =
issues. This is very useful for manufacturers who want to scan for issues=
 routinely without having to do builds.
>=20
> 2) Whereas cve-check scans for CVEs at build-time in a recipe task and =
will (badly) generate aggregate reports for images, sbom-cve-check uses t=
he image SPDX to know what products to look for issues in. This means it =
_only_ supports the =E2=80=9Cwhat issues does my image have=E2=80=9D use-=
case and not =E2=80=9Cwhat issues are on my build machine=E2=80=9D (eg is=
sues in native tools).
>=20
> 3) The use of two different databases means it has more scope for impro=
ved metadata.  It currently supports the FKIE mirror of the NVD data, the=
 CVE List by the CVE Project (which is gaining improved metadata via thei=
r Enrichment Program), and further sources would be simple to add.
>=20
> As a test I did a build of core-image-sato and generated a report using=
 both cve-check and sbom-cve-check.  The differences were interesting.
>=20
> cve-check produced this report for the whole build:
>=20
> WARNING: avahi-0.8-r0 do_cve_check: Found unpatched CVE (CVE-2025-59529=
 CVE-2025-68468 CVE-2025-68471)
> WARNING: busybox-1.37.0-r0 do_cve_check: Found unpatched CVE (CVE-2025-=
60876)
> WARNING: expat-2.7.3-r0 do_cve_check: Found unpatched CVE (CVE-2025-663=
82 CVE-2026-24515)
> WARNING: expat-native-2.7.3-r0 do_cve_check: Found unpatched CVE (CVE-2=
025-66382 CVE-2026-24515)
> WARNING: ffmpeg-8.0.1-r0 do_cve_check: Found unpatched CVE (CVE-2023-51=
791 CVE-2023-51793 CVE-2023-51794 CVE-2023-51795 CVE-2023-51796 CVE-2023-=
51797 CVE-2023-51798 CVE-2025-22921 CVE-2025-25468 CVE-2025-25469)
> WARNING: glibc-2.42+git-r1 do_cve_check: Found unpatched CVE (CVE-2010-=
4756)
> WARNING: libpam-1.7.1-r0 do_cve_check: Found unpatched CVE (CVE-2024-10=
041)
> WARNING: libsndfile1-1.2.2-r0 do_cve_check: Found unpatched CVE (CVE-20=
24-50613 CVE-2025-52194 CVE-2025-56226)
> WARNING: linux-yocto-6.18.6+git-r0 do_cve_check: Found unpatched CVE (C=
VE-2008-4609 CVE-2010-4563 CVE-2019-14899 CVE-2021-3714 CVE-2021-3864 CVE=
-2022-0400 CVE-2022-1247 CVE-2022-38096 CVE-2022-4543 CVE-2023-3397 CVE-2=
023-3640 CVE-2023-39176 CVE-2023-39179 CVE-2023-39180 CVE-2023-4010 CVE-2=
023-6238 CVE-2023-6240 CVE-2023-6535)
> WARNING: polkit-127-r0 do_cve_check: Found unpatched CVE (CVE-2016-2568=
)
> WARNING: qemu-native-10.2.0-r0 do_cve_check: Found unpatched CVE (CVE-2=
019-12067 CVE-2021-20255 CVE-2024-6519)
> WARNING: qemu-system-native-10.2.0-r0 do_cve_check: Found unpatched CVE=
 (CVE-2019-12067 CVE-2021-20255 CVE-2024-6519)
> WARNING: vim-9.1.1683-r0 do_cve_check: Found unpatched CVE (CVE-2025-66=
476)
>=20
> Aside: cve-check=E2=80=99s per-image reporting appears to be slightly b=
roken and claimed that my sato image included images from meta-oe, which =
it did not. The report above is the reporting that is logged during the b=
uild.
>=20
> After writing some tooling for textual summaries, sbom-cve-check produc=
ed a report that is similar. The recipe list has differences: vim and a h=
andful of other are  not listed; but previously unreported CVEs in busybo=
x, cairo, expat, glib-networking, gnupg, libgcrypt, libsoup, libxml2, mpg=
123, perl, tar, and the kernel are added.
>=20
> The recipes that are not listed are either native tools (which, by defi=
nition, are not in the image) or recipes that are built for dependencies =
but do not end up in the this specific image. In this case, dosfstools-pt=
est RDEPENDS on xxd which is built by vim, but as dosfstools-ptest is not=
 installed there is no need for xxd.
>=20
> A number of CVEs are added, for example CVE-2024-58251 is a CVE in busy=
box which is missing the machine-readable CPE in the NVD data[3] but the =
CVE List has been =E2=80=9Cenriched=E2=80=9D and has machine-readable dat=
a[4].  I=E2=80=99ve not yet triaged every one to identify the reason for =
the addition, but I expect this is the main reason.
>=20
> A more interesting feature gap is where a recipe statically links to an=
other recipe: in this case there is no SPDX package entry for the library=
, so issues in the library will not be reported. With cve-check, the buil=
d-report will cover this, but the image-report will not.
>=20
> To summarise [5] the pros and cons:
> + sbom-cve-check can run at any point after the build
> + has better data sources which report more issues
> - only scans the literal packages that are in a final image, so we don=E2=
=80=99t get coverage of native packages or static linkage
>=20
> I wonder if the easiest fix for this gap is to enhance the SPDX generat=
ion to not only generate an =E2=80=9Cimage SPDX=E2=80=9D but also a =E2=80=
=9Cbuild SPDX=E2=80=9D, which is essentially an aggregation of every reci=
pe=E2=80=99s SPDX that is present. A recursive execution of the SPDX gene=
ration task will mean this covers both any native tools and static librar=
ies that are in the dependency graph, for maximal coverage.
>=20
> This gives a solution without needing to be more clever in the image SP=
DX generation, for example including packages for all of the build depend=
encies (be them native or target).
>=20
> If this is done then I think sbom-cve-check is at least at parity with =
cve-check, and in many ways far superior. This will allow us to merge the=
 few recipes and class from meta-sbom-cve-check into core, and delete cve=
-check.
>=20
> Any thoughts? (looking at Josh and Benjamin primarily)
>=20
> Thanks,
> Ross
>=20
> [1] https://github.com/bootlin/sbom-cve-check
> [2] https://github.com/bootlin/meta-sbom-cve-check
> [3] https://nvd.nist.gov/vuln/detail/CVE-2024-58251
> [4] https://www.cve.org/CVERecord?id=3DCVE-2024-58251
> [5] At this point I=E2=80=99m realising I need to read The Art of Expla=
nation by Ros Atkins...
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2232): https://lists.openembedded.org/g/openembedde=
d-architecture/message/2232
> Mute This Topic: https://lists.openembedded.org/mt/117638559/3616948
> Group Owner: openembedded-architecture+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-architecture=
/unsub [mark.hatle@kernel.crashing.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

