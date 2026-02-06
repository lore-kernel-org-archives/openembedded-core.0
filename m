Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E818EE6B4D
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 19:34:22 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1709.1770406456314989543
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 11:34:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Inxm6Uvy;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64ad019bbd4so791385d50.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 11:34:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770406455; cv=none;
        d=google.com; s=arc-20240605;
        b=eNV6GlyqVxgisSXAJgHH96a9+axCE7rM3KR/b/PQIbs7eYQrxu6LY5GIp07YZtG2XV
         JtWkL8UPsuWYO5ncw9UF+QtXa9iEziViNOTHc0ak92kaTio6FUU7ozsXZ7KgLhB+pTC5
         dahrZVaG6kP1TV9i1VX/cjE2zexXUc1st4sq+K39Yua2OSc1SkH4dhBxhNA8o6RdHCvw
         p/dXRlnP90IHxyNdt13zjHhGO5upJSDLKTryWOEevoKP5AoTAWASotyGUtYvwN9zZoCN
         L2+JPfYhnIDtxLDrB/iYkfLbfG0zIkOf5feiLgYH+ZxnVnlFm/uZjfoeIsfPSwG36p6T
         P59A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P9pLBAV9Qwc9q7X6K1MDslqUBgB87dfJrihHvvjBJ0c=;
        fh=0SlXyuukFXlM5AdYW1UeufIG+J3zaRD24WXXeDiUUOs=;
        b=iD+OQzQbYSDWSdB7YaxH+F/tTOMQOYyJdyIcj9xDa1WQLY/xaKbgicfIKx3lhI3YPY
         Ikx2R4t3yOuHAN2DphXicESmNwOfRfwLg5xFd/CtV65CbSUuGqn4AsmE/U/tpQ41Ca7E
         45Xv4aYNYfkXAhKPaUQRjpni5aIZ2HZrSBsAsa8+PPKBN1xHhJRPGrOXp2y9CdXhvW58
         LIslfJf98cWxwaTB2RmvWkNzCtGp0TsoDQB+WLDUCLJQnsF9CM0F4WM+gEH9/IS4eVZg
         CSP4kFIG3J00ssJPe9bT34XSuMQJBxTGhb1b0xHOT4Q1/SiB+dG4JfIHrwMhZ7WtJBiW
         K6Gg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770406455; x=1771011255; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9pLBAV9Qwc9q7X6K1MDslqUBgB87dfJrihHvvjBJ0c=;
        b=Inxm6UvyszPe6xdLlohRjFbCOlT7fgSTMqbaHvNGs9uGvM7skpMZ31qrzI67ncLFN5
         dGrrlOENnZE387JU2UwHhVkMa6D001DVlwnHHe/iUDLL4oH88NEOIkJIsp12XY25jN4d
         ncj7iOaLc1pRVlj+bRDIDbLskGav1ye4OQ5ra3+u/cXSMBV2+KEUqtksRtohXBTfXMeO
         eGCdu+vwaohg92pDfEY97sIm9ewoMGc/05dXy6bdAlvkyYv4CvdtBSO4lE5SlABAxYOB
         E5+uu3P6F1c5hHm8VJ3gVrx3QPA8G+uKUHF1SpS4H9tKjrfA1tUXihpTYmiJI4Xxrnot
         xWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770406455; x=1771011255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P9pLBAV9Qwc9q7X6K1MDslqUBgB87dfJrihHvvjBJ0c=;
        b=BLl25tT69rrgo2lxK1WhhbiTjde1fNLpZiSrryvzIlVedueLoveiX1gYqL+OWTdsXL
         dCveBbs9n5Oe4swmFql/QcsUPp95g26EQrk8WpAPMW60LWFV5mCTEs40SB0u6SqkRPPO
         iQ78uvEfs/Gyb9BnDcKAIZRYxEFqaa9427kzXgX1kG69Ol11eDfGNkRmT7UdHv8YA+fc
         xFiT7ZqpDT0edmUcVvP5YjfS+AtIbc6I/zIbx+3NNSALpRV5Y86HtthsPeT7YXHXfJkJ
         KyjiINIh1c/PyYymRdQkSPRzKBgqTJdBnxUGWd7et5+Osbrr5zN7auIMh2hzhvOfjxoV
         2xsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLDPHQ0devLROTIkUCf1GS6dPxwzWcOpZnoQCYY1WPBN89C7grwjmAqHsTaG5Mv4i711GGGHZRSc+L8NmIarSQsQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw7ZeA4VcnGopA/1mZys7PtZG60yWBRaeW1VCjemIg3zKkNgXGP
	ZHvvQW8RgHsnyaRG/sfnamzTSXe99XgYfamZt3HGEIEMgffqavRDCHa13WcYmhu+D0pti8YueL9
	amwjZa4ibcR/bku+RLGmr1RWc2txnBYU=
X-Gm-Gg: AZuq6aI3Hp5z0HfsHI9QvzubqVawUJQksfBwJef7SlCCbvsXBkwTWSqvdFA5cdBPA3L
	Q9Ub0M735kz8KSQR0nif+DQjfxsF81SgCzLJGLq6VE3BKxYe0UD5+HKoHFfqEwgIRQ2Uy+klg9i
	phwMZVc1IRcNXQ5YPtd8zCNxJMa57QkCO+dwjHedk9XSVejI8IO4P20GJcAC/CM0RMJJlpJ7QbT
	no3S5GLW8v558ON5Z72POtRPG2a7/MPffquwfklxgSxtdKjZrNejdRai5e0ASogc4VaO8v1quNl
	qXkecsiX
X-Received: by 2002:a53:acd7:0:20b0:649:d59f:dccc with SMTP id
 956f58d0204a3-649f1e768ebmr3161504d50.25.1770406455296; Fri, 06 Feb 2026
 11:34:15 -0800 (PST)
MIME-Version: 1.0
References: <2CD10DD9-FB2A-4B10-B98A-85918EB6B4B7@arm.com> <5d54066e-2a1f-42cc-b4f3-bf7ad49da5dc@kernel.crashing.org>
In-Reply-To: <5d54066e-2a1f-42cc-b4f3-bf7ad49da5dc@kernel.crashing.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 6 Feb 2026 12:34:04 -0700
X-Gm-Features: AZwV_Qh7aqssjJEvhFo2U6nZ-2kMedIHR2hw0uge8db8WSEk1mVmVJnrhByuJ0s
Message-ID: <CAJdd5GY8a7LVSV0TecZSttnH5PCEHKY4iJB2kk_5vpARnqgh=w@mail.gmail.com>
Subject: Re: [Openembedded-architecture] Comparing cve-check with sbom-cve-check
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: ross.burton@arm.com, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	"benjamin.robin@bootlin.com" <benjamin.robin@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 19:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230642

On Fri, Feb 6, 2026 at 10:22=E2=80=AFAM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
>
> All of these improvements sound like a really good idea to me.
>
> I'm definitely on board with an image and build SPDX.  They both have val=
ue, and
> I know for my own purposes I often compare what is in an image to a build
> looking for things that could have been missed (such as static linking).

Just to be clear: There is now difference today between an "build"
SBoM and and "image" SBoM. All SBoMs we produce include both. I don't
want to produce multiple different types of (final) SBoM documents;
it's just much easier for use to produce a single SBoM file and let
users slice it up later then have to work about inter-document
linkages (see our SPDX 2.2 output for why :). I'm more than happy to
guide people on how to write tools to do that.

>
> (There are ways we can identify static linking with dwarf debug symbols. =
 Some
> work has been done on this in the past, but I also know we do our best to=
 avoid
> static linking so it's not really progressed very far.   If we do know of=
 places
> where there is static linking that is NOT be identified in another way, i=
t might
> be reason to finally spend some effort on that work again.)

We can actually do this, but it is maybe not as direct as you might
expect. If you set SPDX_INCLUDE_SOURCES =3D "1" the SPDX code will
include all source files in the output SPDX. If you do this, the code
will check output binary debug symbols, and cross reference the files
listed from all build time dependency source files (which is why
SPDX_INCLUDE_SOURCES must be set). Normally, the build_Build only does
`hasInputs` on source files from the recipe itself, but when it does
this it can end up referencing input files from other recipes as well.
The practical output of this is that if a package uses a static
library, the build that produces that package will `hasInput` on the
sources of that static library (of note, this conveniently should also
works for source libraries). It would be nice to also make another
link (maybe `contains`?) that directly links the binary to the static
library binary, but this takes extra steps since you need to cross
reference source files to the correct static library binary, which is
non trivial.

>
> --Mark
>
> On 2/4/26 11:29 AM, Ross Burton via lists.openembedded.org wrote:
> > Hi,
> >
> > I spent a little time this week comparing our cve-check with Bootlin=E2=
=80=99s sbom-cve-check[1].
> >
> > tl;dr: has promise, needs a little further work. I think we can swap cv=
e-check for sbom-cve-check in the LTS if we hurry.
> >
> > The background to this is that the existing cve-check class has some kn=
own limitations:
> > - Uses the FKIE fork of the NVD database as a source of CVE data, which=
 does not have the level of metadata it used to have
> > - Only can be ran as part of a bitbake run, no way to do repeat scans a=
 month later without involving bitbake
> >
> > Whereas sbom-cve-check is:
> > (1) an independent tool,
> > (2) scanning a SPDX manifest,
> > (2) using both the FKIE/NVD database and the CVE Project cvelist.
> >
> > To elaborate on those points:
> >
> > 1) As an independent tool it can be ran at build time (potentially usin=
g meta-sbom-cve-check[2], or by calling the tool directly), or at any point=
 in time after the build using just archived metadata to check for new issu=
es. This is very useful for manufacturers who want to scan for issues routi=
nely without having to do builds.
> >
> > 2) Whereas cve-check scans for CVEs at build-time in a recipe task and =
will (badly) generate aggregate reports for images, sbom-cve-check uses the=
 image SPDX to know what products to look for issues in. This means it _onl=
y_ supports the =E2=80=9Cwhat issues does my image have=E2=80=9D use-case a=
nd not =E2=80=9Cwhat issues are on my build machine=E2=80=9D (eg issues in =
native tools).
> >
> > 3) The use of two different databases means it has more scope for impro=
ved metadata.  It currently supports the FKIE mirror of the NVD data, the C=
VE List by the CVE Project (which is gaining improved metadata via their En=
richment Program), and further sources would be simple to add.
> >
> > As a test I did a build of core-image-sato and generated a report using=
 both cve-check and sbom-cve-check.  The differences were interesting.
> >
> > cve-check produced this report for the whole build:
> >
> > WARNING: avahi-0.8-r0 do_cve_check: Found unpatched CVE (CVE-2025-59529=
 CVE-2025-68468 CVE-2025-68471)
> > WARNING: busybox-1.37.0-r0 do_cve_check: Found unpatched CVE (CVE-2025-=
60876)
> > WARNING: expat-2.7.3-r0 do_cve_check: Found unpatched CVE (CVE-2025-663=
82 CVE-2026-24515)
> > WARNING: expat-native-2.7.3-r0 do_cve_check: Found unpatched CVE (CVE-2=
025-66382 CVE-2026-24515)
> > WARNING: ffmpeg-8.0.1-r0 do_cve_check: Found unpatched CVE (CVE-2023-51=
791 CVE-2023-51793 CVE-2023-51794 CVE-2023-51795 CVE-2023-51796 CVE-2023-51=
797 CVE-2023-51798 CVE-2025-22921 CVE-2025-25468 CVE-2025-25469)
> > WARNING: glibc-2.42+git-r1 do_cve_check: Found unpatched CVE (CVE-2010-=
4756)
> > WARNING: libpam-1.7.1-r0 do_cve_check: Found unpatched CVE (CVE-2024-10=
041)
> > WARNING: libsndfile1-1.2.2-r0 do_cve_check: Found unpatched CVE (CVE-20=
24-50613 CVE-2025-52194 CVE-2025-56226)
> > WARNING: linux-yocto-6.18.6+git-r0 do_cve_check: Found unpatched CVE (C=
VE-2008-4609 CVE-2010-4563 CVE-2019-14899 CVE-2021-3714 CVE-2021-3864 CVE-2=
022-0400 CVE-2022-1247 CVE-2022-38096 CVE-2022-4543 CVE-2023-3397 CVE-2023-=
3640 CVE-2023-39176 CVE-2023-39179 CVE-2023-39180 CVE-2023-4010 CVE-2023-62=
38 CVE-2023-6240 CVE-2023-6535)
> > WARNING: polkit-127-r0 do_cve_check: Found unpatched CVE (CVE-2016-2568=
)
> > WARNING: qemu-native-10.2.0-r0 do_cve_check: Found unpatched CVE (CVE-2=
019-12067 CVE-2021-20255 CVE-2024-6519)
> > WARNING: qemu-system-native-10.2.0-r0 do_cve_check: Found unpatched CVE=
 (CVE-2019-12067 CVE-2021-20255 CVE-2024-6519)
> > WARNING: vim-9.1.1683-r0 do_cve_check: Found unpatched CVE (CVE-2025-66=
476)
> >
> > Aside: cve-check=E2=80=99s per-image reporting appears to be slightly b=
roken and claimed that my sato image included images from meta-oe, which it=
 did not. The report above is the reporting that is logged during the build=
.
> >
> > After writing some tooling for textual summaries, sbom-cve-check produc=
ed a report that is similar. The recipe list has differences: vim and a han=
dful of other are  not listed; but previously unreported CVEs in busybox, c=
airo, expat, glib-networking, gnupg, libgcrypt, libsoup, libxml2, mpg123, p=
erl, tar, and the kernel are added.
> >
> > The recipes that are not listed are either native tools (which, by defi=
nition, are not in the image) or recipes that are built for dependencies bu=
t do not end up in the this specific image. In this case, dosfstools-ptest =
RDEPENDS on xxd which is built by vim, but as dosfstools-ptest is not insta=
lled there is no need for xxd.
> >
> > A number of CVEs are added, for example CVE-2024-58251 is a CVE in busy=
box which is missing the machine-readable CPE in the NVD data[3] but the CV=
E List has been =E2=80=9Cenriched=E2=80=9D and has machine-readable data[4]=
.  I=E2=80=99ve not yet triaged every one to identify the reason for the ad=
dition, but I expect this is the main reason.
> >
> > A more interesting feature gap is where a recipe statically links to an=
other recipe: in this case there is no SPDX package entry for the library, =
so issues in the library will not be reported. With cve-check, the build-re=
port will cover this, but the image-report will not.
> >
> > To summarise [5] the pros and cons:
> > + sbom-cve-check can run at any point after the build
> > + has better data sources which report more issues
> > - only scans the literal packages that are in a final image, so we don=
=E2=80=99t get coverage of native packages or static linkage
> >
> > I wonder if the easiest fix for this gap is to enhance the SPDX generat=
ion to not only generate an =E2=80=9Cimage SPDX=E2=80=9D but also a =E2=80=
=9Cbuild SPDX=E2=80=9D, which is essentially an aggregation of every recipe=
=E2=80=99s SPDX that is present. A recursive execution of the SPDX generati=
on task will mean this covers both any native tools and static libraries th=
at are in the dependency graph, for maximal coverage.
> >
> > This gives a solution without needing to be more clever in the image SP=
DX generation, for example including packages for all of the build dependen=
cies (be them native or target).
> >
> > If this is done then I think sbom-cve-check is at least at parity with =
cve-check, and in many ways far superior. This will allow us to merge the f=
ew recipes and class from meta-sbom-cve-check into core, and delete cve-che=
ck.
> >
> > Any thoughts? (looking at Josh and Benjamin primarily)
> >
> > Thanks,
> > Ross
> >
> > [1] https://github.com/bootlin/sbom-cve-check
> > [2] https://github.com/bootlin/meta-sbom-cve-check
> > [3] https://nvd.nist.gov/vuln/detail/CVE-2024-58251
> > [4] https://www.cve.org/CVERecord?id=3DCVE-2024-58251
> > [5] At this point I=E2=80=99m realising I need to read The Art of Expla=
nation by Ros Atkins...
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#2232): https://lists.openembedded.org/g/openembedde=
d-architecture/message/2232
> > Mute This Topic: https://lists.openembedded.org/mt/117638559/3616948
> > Group Owner: openembedded-architecture+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-architecture=
/unsub [mark.hatle@kernel.crashing.org]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

