Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A17CA600C
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 15:42:31 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18606.1791474151209514251
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 08:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 698FgSMr3957659;
	Thu, 8 Oct 2026 10:42:28 -0500
Received: from [192.168.2.47] ([192.168.2.47])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 698FgQbW009800;
	Thu, 8 Oct 2026 10:42:26 -0500
Message-ID: <630fe2e1-f7b2-4443-98e9-b9aeb94fd0fc@kernel.crashing.org>
Date: Thu, 8 Oct 2026 10:42:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH RFC v2 00/19] riscv: add new ISA extensions and
 profile support
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, Paul Barker <paul@pbarker.dev>
Cc: Trevor Gamblin <tgamblin@baylibre.com>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com>
 <549aa667517325c9a178dd71e0e2563910303ca8.camel@pbarker.dev>
 <CAMKF1srDRW04xpAa36w5PsdELfDU0uiSyf2y=5204D4C3qoVBQ@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <CAMKF1srDRW04xpAa36w5PsdELfDU0uiSyf2y=5204D4C3qoVBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 698FgSMr3957659
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 15:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247435



On 10/8/26 5:56 AM, Khem Raj wrote:
> I will review rest of series in detail later
>=20
> On Thu, Oct 1, 2026, 11:13=E2=80=AFAM Paul Barker <paul@pbarker.dev=20
> <mailto:paul@pbarker.dev>> wrote:
>=20
>     Hi Trevor,
>=20
>     Snipping a lot of the cover letter to give some initial thoughts...
>=20
>     On Wed, 2026-09-30 at 12:38 -0400, Trevor Gamblin wrote:
>      > A list of changes, by group:
>      >
>      > 1. Basic clarification changes and extra tunings:
>      >=C2=A0 =C2=A0 =C2=A0a. tune-riscv: be explicit about riscv32gc, r=
iscv64gc defaults
>      >=C2=A0 =C2=A0 =C2=A0b. tune-riscv.inc: add 'riscv64gcv' tune
>=20
>     I think these changes make sense, and now master has diverged from
>     blacksail it may be a good time to take them.
>=20
>      > 2. Adding official RVA20 profile extensions, and supporting the =
explicit
>     choice
>      > of 'rva20u64' as a tuning option for builds:
>      >=C2=A0 =C2=A0 =C2=A0a. arch-riscv.inc: add missing RVA20 extensio=
ns
>      >=C2=A0 =C2=A0 =C2=A0b. meta/lib/oe/tune.py: support profile strin=
gs, add rva20u64
>      >=C2=A0 =C2=A0 =C2=A0c. tune-riscv.inc: add rva20u64 to AVAILTUNES
>      > 3. Adding RVA22 profile support:
>      >=C2=A0 =C2=A0 =C2=A0a. arch-riscv.inc: add rva22u64 extensions
>      >=C2=A0 =C2=A0 =C2=A0b. meta/lib/oe/tune.py: add rva22u64 profile
>      >=C2=A0 =C2=A0 =C2=A0c. tune-riscv.inc: add rva22u64 to AVAILTUNES
>      > 4. Adding RVA23 profile support:
>      >=C2=A0 =C2=A0 =C2=A0a. arch-riscv.inc: add rva23u64 extensions
>      >=C2=A0 =C2=A0 =C2=A0b. meta/lib/oe/tune.py: add rva23u64 profile
>      >=C2=A0 =C2=A0 =C2=A0c. tune-riscv.inc: add rva23u64 to AVAILTUNES
>      > 5. Quality-of-life fixups after 1-4:
>      >=C2=A0 =C2=A0 =C2=A0a. meta/lib/oe/tune.py: add riscv_pkgarch()
>      >=C2=A0 =C2=A0 =C2=A0b. arch-riscv.inc: rename TUNE_RISCV_PKGARCH =
-> TUNE_RISCV_PKGARCH_EXACT
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 in assignments
>      >=C2=A0 =C2=A0 =C2=A0c. tune.py: add implied tuning logic
>      >=C2=A0 =C2=A0 =C2=A0d. tune.py: add vector extensions to RISCV_IM=
PLIED
>      >=C2=A0 =C2=A0 =C2=A0e. tune-riscv.inc: add RISCV_PKGARCH vars, se=
t PACKAGE_EXTRA_ARCHS
>      >=C2=A0 =C2=A0 =C2=A0f. tune-riscv.inc: clarify zifencei comment
>      > 6. Selftests:
>      >=C2=A0 =C2=A0 =C2=A0a. selftest: oelib: add tune.py
>      >=C2=A0 =C2=A0 =C2=A0b. selftest: cases: add riscvtune.py
>=20
>     There are no users of the RVA20, RVA22 or RVA23 profiles in OE-core=
, so
>     it's hard to be confident that the approach is right here. I assume=
 the
>     goal is to convert some of the machines in meta-riscv to use the
>     appropriate TUNE once these changes are merged? If so, it may be be=
tter
>     to first add support for the new profiles in meta-riscv and update
>     relevant machine configurations to use them. Once they've had some =
time
>     to stabilise in meta-riscv we could then move them into OE-core.
>=20
>=20
> Its better to handle it in one place in oe-core. We do similar for arm.=
 Where we=20
> have all kind of tunes in core its simpler to get the logic working tha=
t way.=20
> Older editions of architectures aren't going away anytime soon.

I'm not attempting to speak for RP here, but when I did the initial code.=
  RP=20
wanted to be sure that we did not introduce additional maintenance by jus=
t=20
adding a boat load of new ISA options without someone willing to maintain=
 them,=20
a way to test them (i.e. gcc/llvm/etc), and more to the point some sort o=
f=20
target system(s) that were actively using them.

The initial implementation was formed based on existing OE, plus the AMD =
FPGA=20
based Risc-V components, so everything had an active "user" and test path.

I think RP's request from the initial work is still valid.  We should be =
adding=20
ISA items because they are useful to actual embedded users, and not just =
because=20
someone defined them.  If they don't exist (yet) in gcc, llvm, etc, we sh=
ould=20
not be including them.  If there is no hardware (qemu counts as hardware)=
 to=20
exercise an ISA, I would be reluctant to include it as it just increases=20
maintenance without a path for testing.

With the above said, I don't have a good view of the risc-v world outside=
 of my=20
specific workflows and use-cases, so I can't recommend any particular ISA=
=20
extensions (in this patch set) that should or should not be included, but=
 I=20
think the general design above is a good one to keep things reasonable an=
d bound=20
the problem.  (We could try to implement ALL risc-v ISA extensions, but i=
t's=20
pretty clear to me from reading the docs a lot of them are theoretical or=
 not=20
used within the scope of what OE is current used for.

>=20
>      > One significant change to the way profile strings are processed =
with
>      > these patches shows up in sstate/build path naming, and is part =
of the
>      > reason for patch 5a-5d above. Before, a build directory
>      > might have a path in it like:
>      >
>      > > build/tmp/work/riscv64imafdc_zicsr_zifencei-poky-linux/
>      >
>      > This was fine when the extension list was short (for riscv64gc),=
 but with the
>      > full RVA profiles, the paths started to get so long that bitbake=
 would
>     produce
>      > this error:
>      >
>      > > ERROR: Unable to reduce sstate name to less than 255 chararact=
ers
>      >
>      > To solve this problem, meta/lib/oe/tune.py now supports a very s=
hort
>      > list of profile names, and includes new functions (riscv_pkgarch=
() and
>      > riscv_implied()) designed to compare selected extensions against
>      > dependencies (profile and otherwise), and shorten path names
>      > appropriately. As an example, if you set the following in local.=
conf:
>      >
>      > > AVAILTUNES +=3D "my-rva20-tune"
>      > > TUNE_FEATURES:tune-my-rva20-tune =3D
>     "${@oe.tune.riscv_isa_to_tune('rv64gc')} ziccamoa ziccif zicclsm zi=
ccrse
>     zicntr za128rs"
>      > > PACKAGE_EXTRA_ARCHS:tune-my-rva20-tune =3D "${TUNE_RISCV_PKGAR=
CH}"
>      > > DEFAULTTUNE =3D "my-rva20-tune"
>      >
>      > then 'bitbake-getvar --value TUNE_PKGARCH' shows that it is reco=
gnized
>      > as the RVA20 profile:
>      >
>      > > rva20u64_zifencei
>      >
>      > Extensions implied by others (e.g. 'zmmul', implied by 'm') don'=
t need
>      > to be listed, but if they are the same result is obtained.
>      >
>      > With all of this combined, subdirectories in tmp/work/ look like=
:
>      >
>      > > tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64 $ ls
>     build/tmp/work/
>      > > all-poky-linux=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemuriscv64-p=
oky-linux                =20
>      =C2=A0rva20u64_zcmop_zifencei_zihintpause_zimop_zvbb-poky-linux=20
>     rva23u64_zifencei-poky-linux
>      > > qemuriscv32-poky-linux=C2=A0 riscv32imafdc_zicsr_zifencei-poky=
-linux=20
>     rva20u64_zifencei-poky-linux=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0x86=
_64-linux
>      >
>      > Note that 'rva20u64_zcmop_zifencei_zihintpause_zimop_zvbb-poky-l=
inux' is
>      > a custom configuration that I set in local.conf only for testing
>      > purposes. Custom tunings still run the ris(c|k) of exceeding the=
 naming
>      > length, which we may need some extra hashing logic (maybe a bitm=
ask?) to
>      > handle if we want to enable freely customizing build tunings.
>=20
>     I think this approach makes a lot of sense, given the way RISC-V
>     extensions work it's probably the only way to make things readable.
>=20
>      >
>      > # Testing
>      >
>      > Testing different profiles' validity against the compiler involv=
ed
>      > setting (for example) DEFAULTTUNE =3D "rva23u64" and then runnin=
g 'bitbake
>      > opensbi' (which also results in a kernel rebuild) as a quick smo=
ke test.
>      > I've also opted to do full image builds to make sure that the ne=
w
>      > profiles fully boot and run without any obvious errors. I've als=
o run a
>      > series of boot tests (including ptests for packages like coreuti=
ls).
>      > Note that when the vector extension is enabled (riscv64gcv, rva2=
3u64),
>      > test durations will generally be higher.
>      >
>      > As of v2, I've added some selftests to help:
>      >
>      > 1. The 'oelib.tune' suite at meta/lib/oeqa/selftest/cases/oelib/=
tune.py,
>      >=C2=A0 =C2=A0 for testing the riscv_pkgarch(), riscv_isa_to_tune(=
), and
>      >=C2=A0 =C2=A0 riscv_implied() functions
>      > 2. The 'riscvtune' suite at meta/lib/oeqa/selftest/cases/riscvtu=
ne.py,
>      >=C2=A0 =C2=A0 for parsing and building against defined and unusua=
l custom tunes to
>      >=C2=A0 =C2=A0 ensure they each yield a usable package arch
>=20
>     Looking at qemuriscv.inc we set QB_CPU to rva23s64 for qemuriscv64.=
 I
>     think we should do some boot testing with different QB_CPU values (=
e.g.
>     build for rva20 and test with rva20 virtual CPU).
>=20
>     Long term we may want to set the default TUNE for qemuriscv64 to al=
ign
>     with RVA23.
>=20
>     Best regards,
>=20
>     --=20
>     Paul Barker
>=20

