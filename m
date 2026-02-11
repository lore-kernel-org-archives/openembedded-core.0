Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28866EB5945
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 00:00:23 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7456.1770768019748341626
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 16:00:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MrZ9M81N;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64ad8435f46so4107961d50.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 16:00:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770768019; cv=none;
        d=google.com; s=arc-20240605;
        b=bnL24T2je7ls9Jkt28OnDXfqOvZfThp1evjsBYKpbwWg4tvXxoPKY5DMwLlc7YF4/Q
         uPpJLR0Xztn8uxqNFtt20pdYz30mOcBCgemdVdNnZMkqzhtSirEDhGxGSMv0+REjHBa9
         1APy5HPkLA+mX/CrbGyFhwt8uHFs0TzOKdvpiaEAC13pSj1N2wi7tqXOvY7BtrCNkDir
         qAaDb8RUf3iI0mt/LdWKcQWtMGhLeSBaENrl+c/KIg6PS3y+gqjOIuqnMhKQh4DxQVJT
         hcouolclehMOMHsB95qFqBOzTbWO/cSy4IXnhH4UYXvshIylsi4bll0YZUvd8rgKRJyp
         JEqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wNLYWo+ZQQu0leQ6Ry0WiCul9uYBOCsUvYJnq5Y/1nc=;
        fh=O+0EfxzondsO0yxRJNYJRzapuqMfn1s4RAWLYqE/iO8=;
        b=CyGgy0qN2R2EWZ1/AN7wojYs9al7mn+kcy5rhGI2E7PD9Po4IskpI4jPJfKMBkPUNL
         sA/Ttkq0ES6JuNoJ/R3o6MvR2YhsZHHTtwlJOX7URfQ6TgUKNybao4qbp3wBhyP+b7LW
         xvLkGFYZfe+VWRI/5fjA0Zu+TbSzWKysRyKS3RAi3i9acTfe7I9Wc8KsAKgvpG+HYQiu
         lw0pdVfeT+hcFJXPZpYOYV61kTV3B789b+57o1jUXaYeaMeCwCzBevTHXNdLkbUto8DG
         x/+Q7L4CfGqAmc1roEgFLa3lBS1tyjlPhkIDnIwfRKIQ3+1KnS6CQNYwrZk0CE6hLRpd
         JI1g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770768019; x=1771372819; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNLYWo+ZQQu0leQ6Ry0WiCul9uYBOCsUvYJnq5Y/1nc=;
        b=MrZ9M81NoKEWbNpaIzXaC5HdZQBUEr1Oj4irS9jLq2fhcdH/q2QRCkcor/6v63gEaA
         psVLLIIhBeV6dBrF3JoafkwersZI9yJuN5TF8/9A5dbKXLDxCNDcB3Y2BYWcsROQ7QAv
         7AH54V0xxqmdzRT66IX3TylzTobK1cr9iY+laqb9x8Oq9XRp/2lDMSzGgizg8VofGRl8
         oJwyUwnAKmgXEx9V1Cxj2Ac+t/V9cD+Ru+XAMskfSS4hOT+9eJPiX+cT4b/HovgZnpFc
         W9zIb3SEer2XZGHohZlKSNAZT8PP4sC587jMERA2PUQFxxrAFWI61Y30cz7VA6q4gaPm
         cmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770768019; x=1771372819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wNLYWo+ZQQu0leQ6Ry0WiCul9uYBOCsUvYJnq5Y/1nc=;
        b=kpIOmQgabyGaPH1dT13mb1qdGDhpwKB1pNUvJS+OpLX03g2uNTu9i9pE7lYpirKUhc
         gXNmTQZeeHZ9T44ftsElNq5Eiw5SvRSu4BlgauCrA4jXoq68Khe0AkOitggO2+xgOLk6
         t9VPCFZ8ACWCCW3er/iPJI3ve1fQmxebRCFNnUk9YC4FJZR1x7qwHPaj0OcGWJVEHlQG
         HKc9y+WiFN7BGLVw0K0IFBJ2bOzBlW627phYypg4HxD2nd898IeSZFOz0V4/Kl10JL91
         rYV1WdbkLghEQMVE9TxrKjANTHP7zqMNuWUIttq2JqjLn99AD1xzYsCe3otG6vrW8qw1
         gsjg==
X-Forwarded-Encrypted: i=1; AJvYcCXTlnW2EedLnwy7ypwOfYJ8Q4xYj8iE2dfUDKrMc/AXkUSrdeh8R2LdzfqRldAbXBGF/M3J8YF9MJIKiH+n+DNtEQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx1/raQTc/QanFFrGkVE/NBeNx940PkR8yKYtuz0YHIC0Dr72dQ
	ORaGPY+Na2xZRCY4LSLM8/9FqiF0xPg/MeWMbq2M+QfSldWvUf4tHjqoufvZacKvxC/6/69QIcB
	+CwcWvcKqG+YQ77R0jab+4TPXwXg8zbbWeg==
X-Gm-Gg: AZuq6aIjxAzt2DianHsqPbq4ZeXsewiaR5hwS9vUWayLPZVsdl1xsl64IZRezCqmUec
	nynJK5F3N6vyqkxVQlRZ0qBc53836W/A2Saq6mzKTs8/RMtXTY6kHgcotxDz0AoiNWIvAbUFH/F
	Ahd2CDbrv8pAtqlEor/CxdRFCv8z4WyzhYfyyK9hNFOrhnD8ZAY/gkBq22fULXpB0gc0XAm0wg2
	KBY1Pe5d8qM4fGwtrc0j4viqBR+1mdpBcUMBZCCGE6ZI9RFKgix//Cp+7pS3332w3VcRpAqEWGU
	7ivrBB7XZG4l8RHp/jw5BQ==
X-Received: by 2002:a05:690e:128b:b0:649:69a0:e0c6 with SMTP id
 956f58d0204a3-64afba5fafdmr733707d50.91.1770768018509; Tue, 10 Feb 2026
 16:00:18 -0800 (PST)
MIME-Version: 1.0
References: <2CD10DD9-FB2A-4B10-B98A-85918EB6B4B7@arm.com> <e8021b4e-fbae-4f19-8fe5-832b72f88e80@kernel.crashing.org>
In-Reply-To: <e8021b4e-fbae-4f19-8fe5-832b72f88e80@kernel.crashing.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 10 Feb 2026 17:00:06 -0700
X-Gm-Features: AZwV_QjV3uVWbO3-HKWF60Sobm6KUaPioT7CkfmhTk-7lhMICovsHgbY4NLKr9U
Message-ID: <CAJdd5GZoqkHpP+D33T9huzmWbuuqKewpeG=H=hXut7xH5Ozi6w@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 00:00:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230940

On Tue, Feb 10, 2026 at 4:45=E2=80=AFPM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
>
> After doing some unrelated work, I think I need to point out something I =
think
> has been missed in this discussion.
>
> Not all DEPLOYED content is in an image.  deployed content can include fi=
rmware
> components built by the system as well.  These ARE target packages, but t=
hey may
> involve raw data flashed directly to a QSPI/OSPI, copied into a magic mem=
ory
> location, etc.

Yes this is a know limitation of our current SBoM generation: It only
works for images. It's on the TODO list to fix this, but it's tricky
because while images are well formed with a defined task workflow,
"deployed" artifacts are the wild west in how they work (you don't
even need to call the task "do_deploy"), so some thought needs to be
done to figure out how to address that.

>
> So there MUST be a way to handle these situations as part of the SPDX, SB=
OM and
> CVE processing.  (This appears to be a gap in the current implementation =
today.)

I'm not sure that it MUST be done as a prerequisite; AFAIK all the
current CVE scanning we do is either 1) per image (see vex.bbclass and
cve-check.bbclass) or per-recipe (without building anything, e.g.
cve-check.bbclass). We will have the same functionality with this new
system where you can either scan a filesystem image, or all recipes
(without building) with the SPDX scanning code. I don't really want to
say that we MUST fix the deployed artifacts problem to roll this out
when that's not even a covered use case of the current implementation
:) If you want to make sure you cover all your bases, I would
recommend doing both types of scans, as the all-recipe CVE analysis
should catch all CVEs (at the expense of more false positives since it
can't do as much filtering as per-image SBoMs can).

However, the ideal case would be once we do eventually solve the
deployed artifact problem, sbom-cve-check won't need special logic to
understand it since it's just more data in the SBoM.

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

