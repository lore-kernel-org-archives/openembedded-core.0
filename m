Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34BF3C7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 16:51:47 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.715.1750265496768363836
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 09:51:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 55IGoYfW005009;
	Wed, 18 Jun 2025 11:50:34 -0500
Received: from [192.168.2.13] ([192.168.2.13])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 55IGoXxi025172;
	Wed, 18 Jun 2025 11:50:33 -0500
Message-ID: <ff5c2e4d-d913-4d94-87a4-4c2065d96153@kernel.crashing.org>
Date: Wed, 18 Jun 2025 11:50:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 1/7] riscv tunes: ISA Implementation of
 RISC-V tune features
Content-Language: en-US
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: Alistair Francis <alistair23@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <1750203584-32065-1-git-send-email-mark.hatle@kernel.crashing.org>
 <1750203584-32065-2-git-send-email-mark.hatle@kernel.crashing.org>
 <CAKmqyKObqM_S_kWWts-uJcFRkbmbimpD2iTXTC5w_ycc48Z8rA@mail.gmail.com>
 <184A2891E949D242.11882@lists.openembedded.org>
In-Reply-To: <184A2891E949D242.11882@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 55IGoYfW005009
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 16:51:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219024

one minor addendum below

On 6/18/25 9:12 AM, Mark Hatle wrote:
>=20
>=20
> On 6/17/25 11:00 PM, Alistair Francis wrote:
>> On Wed, Jun 18, 2025 at 9:39=E2=80=AFAM Mark Hatle via lists.openembed=
ded.org
>> <mark.hatle=3Dkernel.crashing.org@lists.openembedded.org> wrote:
>>>
>>> From: Mark Hatle <mark.hatle@amd.com>
>>>
>>> This implements the following base ISAs:
>>>
>>> * rv32i, rv64i
>>> * rv32e, rv64i
>>>
>>> The following ABIs:
>>> * ilp32, ilp32e, ilp32f, ilp32d
>>> * lp64, lp64e, lp64f, lp64d
>>>
>>> The following ISA extension are also implemented:
>>> * M - Integer Multiplication and Division Extension
>>> * A - Atomic Memory Extension
>>> * F - Single-Precision Floating-Point Extension
>>> * D - Double-Precision Floating-Point Extension
>>> * C - Compressed Extension
>>> * B - Bit Manipulation Extension (implies Zba, Zbb, Zbs)
>>> * V - Vector Operations Extension
>>> * Zicsr - Control and Status Register Access Extension
>>> * Zifencei - Instruction-Fetch Fence Extension
>>> * Zba - Address bit manipulation extension
>>> * Zbb - Basic bit manipulation extension
>>> * Zbc - Carry-less multiplication extension
>>> * Zbs - Single-bit manipulation extension
>>> * Zicbom - Cache-block management extension
>>>
>>> The existing processors tunes are preserved:
>>> * riscv64 (rv64gc)
>>> * riscv32 (rv32gc)
>>> * riscv64nf (rv64imac_zicsr_zifencei)
>>> * riscv32nf (rv32imac_zicsr_zifencei)
>>> * riscv64nc (rv64imafd_zicsr_zifencei)
>>
>> I'm not sure this is the way we want to handle this. You are picking
>> and choosing each individual extension, which is difficult for users
>> to do. Not to mention it's easy to get wrong as some extensions
>> conflict with other extensions.

We already have TUNE_CONFLICTS, which must be used to ensure that conflic=
ting=20
extensions do not get defined together.  This conflict will error during =
parsing=20
and hopefully give the user helpful information.  In the existing impleme=
ntation=20
(part of this patch), I am using this already as:

TUNECONFLICTS[32] =3D "64"
TUNECONFLICTS[64] =3D "32"
TUNECONFLICTS[e] =3D "i"
TUNECONFLICTS[i] =3D "e"

The other thing with risc-v ISA features is some items imply other things=
.=20
Unfortunately there is not such a mechanism today.  This MIGHT be a reaso=
nable=20
extension to the tune stuff.. but until then, I've implemented this like:

${@bb.utils.contains_any("TUNE_FEATURES", "b zba", "_zba", "", d)}

since b implies zba (just like d implies f... and f or d implies zicsr)


It would be nice if we could do:

TUNEIMPLIES[b] =3D "zba zbb zbs"

So when code inspects TUNE_FEATURES, it can ignore 'b' and just use 'zba'=
, but=20
this might be difficult to implelement in a more efficient way then what =
we=20
currently have.

>> You also end up using the `rv32` or `rv64` CPUs with QEMU and enabling
>> extensions manually. We will probably remove those CPUs from QEMU in
>> the future as they cause a lot of user confusion.

Yes, this was intentional as emulating more extensions that what we're co=
mpiling=20
for means that testing won't cover if we have assembly or compilation tha=
t uses=20
instructions we don't want.  (i.e. OpenSBI requires 'c', while not all CP=
Us are=20
required to implement 'c'.)  This was discovered specifically because of =
this=20
'only enable' the instructions we have enabled behavior.

>> I think instead we should be moving towards the RISC-V profiles.
>> Individual extensions can still be enabled/disabled on top of a
>> profile if required. That's what we are doing in QEMU and it makes
>> things a lot clearer to users exactly what is/isn't enabled.
>=20
> As I've said elsewhere, profiles mean ISA + extensions.
>=20
>     "Profiles only describe ISA features, not a complete execution envi=
ronment."
>=20
>  =20
> https://github.com/riscv/riscv-profiles/blob/main/src/profiles.adoc#2-p=
rofiles-versus-platforms
>=20
> For someone who understands what a specific profile is, it should be im=
plemented
> in the new meta/lib/oe/tune.py file.  Any missing TUNE_FEATURES should =
be added.
>=20
> I'd recommend a new function like:
>=20
> riscv_profile_to_tune(profile):
>=20
> and/or
>=20
> riscv_profile_to_isa(profile):
>=20
> (the later could call the existing riscv_isa_to_tune)
>=20
> Then in the tune-<name>.inc file, the user would implement it as:
>=20
>     require conf/machine/include/riscv/arch-riscv.inc
>=20
>     DEFAULTTUNE ?=3D "my-magic-cpu"
>=20
>     AVAILTUNES +=3D "my-magic-cpu"
>=20
>     TUNE_FEATURES:tune-my-magic-cpu :=3D "${@riscv_profile_to_tune("rva=
20u32")} m a"
>     PACKAGE_EXTRA_ARCHS:tune-my-magic-cpu =3D "${TUNE_RISCV_PKGARCH}"
>=20
> The above should result in:
>=20
> rv 32 i m a , since RVI20U32 says "no mandatory extensions" but M A F D=
 C
> Zifencei and Zicntr are optional. (rvi20u64 is similar)
>=20
> Note: rv 32 i m a is not Linux compatible, we need zicsr and zifencei a=
s well,
> but Zicsr is not listed as mandatory or optional
>=20
> while RVA22U64 defines a specific set that contains extensions which my=
 parts do
> NOT support.
>=20
> Thus we _MUST_ have a way to be able to use ISA + extension which is th=
e lowest
> common denominator of what _WE_ support, while giving users views into =
the
> approaches they want.
>=20
> _I_ do not intend to implement the profile_to_... functions, as I won't=
 see any
> use in the parts that I have to support.  But as a project, I do think =
someone
> should implement thing table and function to make it easier for people =
who want
> to use profiles to specify something.
>=20
> --Mark
>=20
>> Alistair
>>
>>>
>>> Previously defined feature 'big-endian' has been removed as it was no=
t used.
>>>
>>> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
>>> ---
>>>    meta/conf/machine/include/riscv/README        | 122 ++++++++++++++=
++
>>>    .../conf/machine/include/riscv/arch-riscv.inc | 138 ++++++++++++++=
+++-
>>>    .../conf/machine/include/riscv/tune-riscv.inc |  40 ++---
>>>    meta/conf/machine/qemuriscv32.conf            |   4 +-
>>>    meta/lib/oe/__init__.py                       |   2 +-
>>>    meta/lib/oe/tune.py                           |  81 ++++++++++
>>>    6 files changed, 349 insertions(+), 38 deletions(-)
>>>    create mode 100644 meta/conf/machine/include/riscv/README
>>>    create mode 100644 meta/lib/oe/tune.py
>>>
>>> diff --git a/meta/conf/machine/include/riscv/README b/meta/conf/machi=
ne/include/riscv/README
>>> new file mode 100644
>>> index 0000000000..beef68f523
>>> --- /dev/null
>>> +++ b/meta/conf/machine/include/riscv/README
>>> @@ -0,0 +1,122 @@
>>> +2025/06/08 - Mark Hatle <mark.hatle@amd.com>
>>> + - Initial Revision
>>> +
>>> +The RISC-V ISA is broken into two parts, a base ISA and extensions. =
 As
>>> +of the writing of this document these are documented at:
>>> +
>>> +https://lf-riscv.atlassian.net/wiki/spaces/HOME/pages/16154769/RISC-=
V+Technical+Specifications
>>> +
>>> +Specifically "The RISC-V Instruction Set Manual Volume I: Unprivileg=
ed ISA"
>>> +was used to create this implementation.
>>> +
>>> +Requirements
>>> +------------
>>> +As RISC-V is a =E2=80=9Cvariable=E2=80=9D ISA (a base isa plus numer=
ous extensions), a
>>> +mechanism is required to specify a series of ISA features that a use=
r or
>>> +tune can use to specify a specific CPU instantiation.
>>> +
>>> +Not all ratified or draft features should or can be implemented with=
 the
>>> +available resources.
>>> +
>>> +The implementation should work for Linux, baremetal (newlib), zephyr=
 and
>>> +other operating systems.  Supported extensions should be based on
>>> +real-world examples.
>>> +
>>> +Linux
>>> +-----
>>> +Linux required base and support extensions should be available.  Lin=
ux
>>> +requires:
>>> +* Base: rv32ima & rv64ima
>>> +* Optional FPU: fd
>>> +* Optional RISCV_ISA_C: c
>>> +* Optiona RISCV_ISA_V: v
>>> +* Required additional: _zicsr_zifencei
>>> +* Optional RISCV_ISA_ZBA: _zba
>>> +* Optional RISCV_ISA_ZBB: _zbb
>>> +* Optional RISCV_ISA_ZBC: _zbc (not supported by current QEMU design=
)
>>> +
>>> +See: https://git.yoctoproject.org/linux-yocto/tree/arch/riscv/Makefi=
le?h=3Dv6.12/base
>>> +
>>> +Baremetal
>>> +---------
>>> +AMD Microblaze-V FPGA support uses the following static configuratio=
ns:
>>> +Base: rv32e, rv32i, rv64i
>>> +Extensions: m, a, f, d, c, b, zicsr, zifencei
>>> +
>>> +Zephyr
>>> +------
>>> +AMD Microblaze-V development for Zephyr is the same as Baremetal, wi=
th a
>>> +few additional extensions: zbc, zicbom
>>> +
>>> +ABI
>>> +---
>>> +The following ABIs are supported GNU tools and some combination of s=
ystems.
>>> +* ilp32 - Integer, long and pointer are 32-bit
>>> +* lp64 - Long and pointer are 64-bit (integer is 32-bit)
>>> +
>>> +The ABI is dependent upon the core system implementation, as ilp32 c=
an
>>> +only used on an =E2=80=98rv32=E2=80=99 system, while lp64 can only b=
e used on an =E2=80=98rv64=E2=80=99
>>> +system.
>>> +
>>> +There are additional variations of each ABI:
>>> +* e - used with the Reduced register extension
>>> +* f - used when single precision floating point (but not double prec=
ision) is
>>> +      enabled
>>> +* d - used when both single and double precision floating point is e=
nabled
>>> +
>>> +Based on the above, the ABI should be automatically determined based=
 on
>>> +the selected Base ISA and Extensions.
>>> +
>>> +Implementation
>>> +--------------
>>> +To make it easier to generate the RISC-V canonical arch, ISA based -=
march,
>>> +and the ABI string, a few new variables are added for specific RISC-=
V items.
>>> +
>>> +TUNE_RISCV_ARCH - This contains the canonical GNU style arch, genera=
lly this
>>> +                  will evaluate to "riscv32" or "riscv64".
>>> +
>>> +TUNE_RISCV_MARCH - This will contain an ISA based -march string comp=
atible
>>> +                   with gcc and similar toolchains.  For example:
>>> +                   rv32imacfd_zicsr_zifencei
>>> +
>>> +TUNE_RISCV_ABI - This is the generated ABI that corresponds to the A=
RCH and
>>> +                 MARCH/ISA values.  For riscv32, the value will be i=
lp32
>>> +                 (int, long and pointer is 32-bit) with the ISA
>>> +                 variation.  For riscv64, the value will be lp64 (lo=
ng
>>> +                 and pointer are 64-bit bit, while int is 32-bit) wi=
th the
>>> +                 ISA variation.  The ISA affects the ABI when the 'e=
', 'f'
>>> +                 and 'd' extension are used.
>>> +
>>> +TUNE_RISCV_PKGARCH - This is the generated PKGARCH value.
>>> +
>>> +The standard variables are defined as:
>>> +
>>> +TUNE_CCARGS =3D "${@ '-march=3D${TUNE_RISCV_MARCH} -mabi=3D${TUNE_RI=
SCV_ABI}' if not d.getVar('TUNE_CCARGS:tune-${DEFAULTTUNE}') else 'TUNE_C=
CARGS:tune-${DEFAULTTUNE}'}"
>>> +
>>> +The above will allow the user to specify an implementation specific
>>> +TUNE_CCARGS for a given processor tune if the default implementtion =
is
>>> +not adequate for some reason.  It is expected that most, if not all,
>>> +implementations will use the default behavior.
>>> +
>>> +TUNE_ARCH =3D "${TUNE_RISCV_ARCH}"
>>> +TUNE_PKGARCH =3D "${TUNE_RISCV_PKGARCH}"
>>> +
>>> +The above two will always base their setting off the standard TUNE_F=
EATURES.
>>> +
>>> +Ratified and draft extensions should be implemented as TUNE_FEATURES=
 in
>>> +the arch-riscv.inc file.
>>> +
>>> +Vendor specific extensions and processor specific settings should go
>>> +into a 'tune-<vendor>.inc' file, with tune-riscv.inc being reserved =
for
>>> +general purpose tunes.
>>> +
>>> +TUNE_FEATURE Helper
>>> +-------------------
>>> +A special helper function has been written that will convert RISC-V =
ISA
>>> +notation into TUNE_FEATURE notion, for example:
>>> +
>>> +rv32g -> rv 32 i m a f d zicsr zifencei
>>> +
>>> +The helper can be called using oe.tune.riscv_isa_to_tune("<ISA>") su=
ch as
>>> +oe.tune.riscv_isa_to_tune("rv64gc") which would return:
>>> + rv 64 i m a f d c zicsr zifencei
>>> diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/co=
nf/machine/include/riscv/arch-riscv.inc
>>> index b34064e78f..99bed8fde5 100644
>>> --- a/meta/conf/machine/include/riscv/arch-riscv.inc
>>> +++ b/meta/conf/machine/include/riscv/arch-riscv.inc
>>> @@ -1,14 +1,140 @@
>>>    # RISCV Architecture definition
>>>
>>> -DEFAULTTUNE ?=3D "riscv64"
>>> +# Based on the RISC-V Instruction Set Manual Volume I: Unprivileged =
ISA from May 2025
>>> +# As well as the RISC-V options for using GCC (as of June 2025)
>>>
>>> -TUNE_ARCH =3D "${TUNE_ARCH:tune-${DEFAULTTUNE}}"
>>> -TUNE_PKGARCH =3D "${TUNE_PKGARCH:tune-${DEFAULTTUNE}}"
>>> -TUNE_CCARGS:append =3D "${@bb.utils.contains('TUNE_FEATURES', 'riscv=
64nf', ' -mabi=3Dlp64', ' ', d)}"
>>> -TUNE_CCARGS:append =3D "${@bb.utils.contains('TUNE_FEATURES', 'riscv=
32nf', ' -mabi=3Dilp32', ' ', d)}"
>>> +# Note: the following should be implemented in the order that GCC ex=
pects
>>> +# -march=3D values to be defined in.
>>>
>>> -TUNE_CCARGS:append =3D "${@bb.utils.contains('TUNE_FEATURES', 'riscv=
64nc', ' -march=3Drv64imafd', ' ', d)}"
>>> +# Base ISA
>>> +# All supported march strings must start with rv32 or rv64
>>> +TUNEVALID[rv] =3D "RISC-V"
>>> +TUNE_RISCV_ARCH =3D "${@bb.utils.contains("TUNE_FEATURES", "rv", "ri=
scv", "", d)}"
>>> +TUNE_RISCV_MARCH =3D "${@bb.utils.contains("TUNE_FEATURES", "rv", "r=
v", "", d)}"
>>> +TUNE_RISCV_ABI =3D ""
>>>
>>> +# There are two primary ABIs, ilp32 and lp64
>>> +# There are variants of both, that appears to be based on extensions=
 above
>>> +# For example:
>>> +#   rv32i uses ilp32, rv32e uses ilp32e, rv32f uses ilp32f
>>> +#   rv64i uses lp64, rv64if uses lp64f, rv64id uses lp64d
>>> +TUNEVALID[32] =3D "ISA XLEN - 32-bit"
>>> +TUNECONFLICTS[32] =3D "64"
>>> +TUNE_RISCV_ARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "32", "3=
2", "", d)}"
>>> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "32", "=
32", "", d)}"
>>> +TUNE_RISCV_ABI .=3D "${@bb.utils.contains("TUNE_FEATURES", "32", "il=
p32", "", d)}"
>>> +
>>> +TUNEVALID[64] =3D "ISA XLEN - 64-bit"
>>> +TUNECONFLICTS[64] =3D "32"
>>> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "64", "=
64", "", d)}"
>>> +TUNE_RISCV_ARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "64", "6=
4", "", d)}"
>>> +TUNE_RISCV_ABI .=3D "${@bb.utils.contains("TUNE_FEATURES", "64", "lp=
64", "", d)}"
>>> +
>>> +# The package arch starts with the canonical arch, but adds some ext=
ensions to make
>>> +# package compatibility clear
>>> +TUNE_RISCV_PKGARCH =3D "${TUNE_RISCV_ARCH}"
>>> +
>>> +# i, e, or g are defined by gcc, but 'g' refers to 'i' + extensions =
'MAFD Zicsr Zifencei'
>>> +# So 'g' will not be defined here as it is an abbreviation of the ex=
panded version
>>> +TUNEVALID[e] =3D "Reduced register base integer extension"
>>> +TUNECONFLICTS[e] =3D "i"
>>> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "e", "e=
", "", d)}"
>>> +TUNE_RISCV_ABI .=3D "${@bb.utils.contains("TUNE_FEATURES", "e", "e",=
 "", d)}"
>>> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "e", =
"e", "", d)}"
>>> +
>>> +TUNEVALID[i] =3D "Base integer extension"
>>> +TUNECONFLICTS[i] =3D "e"
>>> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "i", "i=
", "", d)}"
>>> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "i", =
"i", "", d)}"
>>> +
>>> +# Extensions
>>> +TUNEVALID[m] =3D "Integer multiplication and division extension"
>>> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "m", "m=
", "", d)}"
>>> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "m", =
"m", "", d)}"
>>> +
>>> +TUNEVALID[a] =3D "Atomic extension"
>>> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "a", "a=
", "", d)}"
>>> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "a", =
"a", "", d)}"
>>> +
>>> +TUNEVALID[f] =3D "Single-precision floating-point extension"
>>> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "f =
d", "f", "", d)}"
>>> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "=
f d", "f", "", d)}"
>>> +
>>> +TUNEVALID[d] =3D "Double-precision floating-point extension"
>>> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "d", "d=
", "", d)}"
>>> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "d", =
"d", "", d)}"
>>> +
>>> +# Only f OR d, but just one
>>> +TUNE_RISCV_ABI .=3D "${@bb.utils.contains("TUNE_FEATURES", "d", "d",=
 bb.utils.contains("TUNE_FEATURES", "f", "f", "", d), d)}"
>>> +
>>> +TUNEVALID[c] =3D "Compressed extension"
>>> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "c", "c=
", "", d)}"
>>> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "c", =
"c", "", d)}"
>>> +
>>> +TUNEVALID[b] =3D "Bit Manipulation extension"
>>> +# Handled below via zba, zbb, zbs
>>> +# This matches current Linux kernel behavior
>>> +#TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "b", "=
b", "", d)}"
>>> +#TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "b",=
 "b", "", d)}"
>>> +
>>> +TUNEVALID[v] =3D "Vector operations extension"
>>> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "v", "v=
", "", d)}"
>>> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "v", =
"v", "", d)}"
>>> +
>>> +# Now the special Z extensions
>>> +TUNEVALID[zicbom] =3D "Cache-block management extension"
>>> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zi=
cbom", "_zicbom", "", d)}"
>>> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "=
zicbom", "_zicbom", "", d)}"
>>> +
>>> +TUNEVALID[zicsr] =3D "Control and status register access extension"
>>> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zi=
csr f d", "_zicsr", "", d)}"
>>> +# If zicsr (or zifencei) is in the path, OpenSBI fails to use the ex=
tensions, do to (Makefile):
>>> +#   # Check whether the assembler and the compiler support the Zicsr=
 and Zifencei extensions
>>> +#   CC_SUPPORT_ZICSR_ZIFENCEI :=3D $(shell $(CC) $(CLANG_TARGET) $(R=
ELAX_FLAG) -nostdlib -march=3Drv$(OPENSBI_CC_XLEN)imafd_zicsr_zifencei -x=
 c /dev/null -o /dev/null 2>&1 | grep -e "zicsr" -e "zifencei" > /dev/nul=
l && echo n || echo y)
>>> +# this will match on the path containing zicsr or zifencei when an e=
rror is reported, which
>>> +# will always happens in this check.
>>> +#
>>> +# Yocto Project Bugzilla 15897
>>> +#
>>> +#TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", =
"zicsr f d", "_zicsr", "", d)}"
>>> +
>>> +TUNEVALID[zifencei] =3D "Instruction-fetch fence extension"
>>> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zifenc=
ei", "_zifencei", "", d)}"
>>> +# See above Bug 15897
>>> +#TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zif=
encei", "_zifencei", "", d)}"
>>> +
>>> +TUNEVALID[zba] =3D "Address bit manipulation extension"
>>> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "b =
zba", "_zba", "", d)}"
>>> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "=
b zba", "_zba", "", d)}"
>>> +
>>> +TUNEVALID[zbb] =3D "Basic bit manipulation extension"
>>> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "b =
zbb", "_zbb", "", d)}"
>>> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "=
b zbb", "_zbb", "", d)}"
>>> +
>>> +TUNEVALID[zbc] =3D "Carry-less multiplication extension"
>>> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zb=
c", "_zbc", "", d)}"
>>> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "=
zbc", "_zbc", "", d)}"
>>> +
>>> +TUNEVALID[zbs] =3D "Single-bit manipulation extension"
>>> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "b =
zbs", "_zbs", "", d)}"
>>> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "=
b zbs", "_zbs", "", d)}"
>>> +
>>> +# Construct TUNE_CCARGS
>>> +# This should result in a CCARG similar to:
>>> +#   -march=3Drv32imac -mabi=3Dilp32
>>> +TUNE_CCARGS =3D "${@ '-march=3D${TUNE_RISCV_MARCH} -mabi=3D${TUNE_RI=
SCV_ABI}' if not d.getVar('TUNE_CCARGS:tune-${DEFAULTTUNE}') else 'TUNE_C=
CARGS:tune-${DEFAULTTUNE}'}"
>>> +
>>> +# Construct TUNE_ARCH
>>> +# This should result in an arch string similar to:
>>> +#   riscv32
>>> +TUNE_ARCH =3D "${TUNE_RISCV_ARCH}"
>>> +
>>> +# Construct TUNE_PKGARCH
>>> +# This should result in a package are like:
>>> +#    riscv32imac
>>> +TUNE_PKGARCH =3D "${TUNE_RISCV_PKGARCH}"
>>> +
>>> +# Misc settings
>>>    # Fix: ld: unrecognized option '--hash-style=3Dsysv'
>>>    LINKER_HASH_STYLE:libc-newlib =3D ""
>>>    LINKER_HASH_STYLE:libc-picolibc =3D ""
>>> diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/co=
nf/machine/include/riscv/tune-riscv.inc
>>> index 804712077e..12c1125c8b 100644
>>> --- a/meta/conf/machine/include/riscv/tune-riscv.inc
>>> +++ b/meta/conf/machine/include/riscv/tune-riscv.inc
>>> @@ -1,41 +1,23 @@
>>>    require conf/machine/include/riscv/arch-riscv.inc
>>>
>>> -TUNEVALID[riscv64] =3D "Enable 64-bit RISC-V optimizations"
>>> -TUNEVALID[riscv32] =3D "Enable 32-bit RISC-V optimizations"
>>> -
>>> -TUNEVALID[riscv64nf] =3D "Enable 64-bit RISC-V optimizations no floa=
ting point"
>>> -TUNEVALID[riscv32nf] =3D "Enable 32-bit RISC-V optimizations no floa=
ting point"
>>> -
>>> -TUNEVALID[riscv64nc] =3D "Enable 64-bit RISC-V optimizations without=
 compressed instructions"
>>> -
>>> -TUNEVALID[bigendian] =3D "Big endian mode"
>>> +DEFAULTTUNE ?=3D "riscv64"
>>>
>>>    AVAILTUNES +=3D "riscv64 riscv32 riscv64nc riscv64nf riscv32nf"
>>>
>>>    # Default
>>> -TUNE_FEATURES:tune-riscv64 =3D "riscv64"
>>> -TUNE_ARCH:tune-riscv64 =3D "riscv64"
>>> -TUNE_PKGARCH:tune-riscv64 =3D "riscv64"
>>> -PACKAGE_EXTRA_ARCHS:tune-riscv64 =3D "riscv64"
>>> +TUNE_FEATURES:tune-riscv64 :=3D "${@oe.tune.riscv_isa_to_tune("rv64g=
c")}"
>>> +PACKAGE_EXTRA_ARCHS:tune-riscv64 =3D "${TUNE_RISCV_PKGARCH}"
>>>
>>> -TUNE_FEATURES:tune-riscv32 =3D "riscv32"
>>> -TUNE_ARCH:tune-riscv32 =3D "riscv32"
>>> -TUNE_PKGARCH:tune-riscv32 =3D "riscv32"
>>> -PACKAGE_EXTRA_ARCHS:tune-riscv32 =3D "riscv32"
>>> +TUNE_FEATURES:tune-riscv32 :=3D "${@oe.tune.riscv_isa_to_tune("rv32g=
c")}"
>>> +PACKAGE_EXTRA_ARCHS:tune-riscv32 =3D "${TUNE_RISCV_PKGARCH}"
>>>
>>>    # No float
>>> -TUNE_FEATURES:tune-riscv64nf =3D "${TUNE_FEATURES:tune-riscv64} risc=
v64nf"
>>> -TUNE_ARCH:tune-riscv64nf =3D "riscv64"
>>> -TUNE_PKGARCH:tune-riscv64nf =3D "riscv64nf"
>>> -PACKAGE_EXTRA_ARCHS:tune-riscv64nf =3D "riscv64nf"
>>> +TUNE_FEATURES:tune-riscv64nf :=3D "${@oe.tune.riscv_isa_to_tune("rv6=
4imac_zicsr_zifencei")}"
>>> +PACKAGE_EXTRA_ARCHS:tune-riscv64nf =3D "${TUNE_RISCV_PKGARCH}"
>>>
>>> -TUNE_FEATURES:tune-riscv32nf =3D "${TUNE_FEATURES:tune-riscv32} risc=
v32nf"
>>> -TUNE_ARCH:tune-riscv32nf =3D "riscv32"
>>> -TUNE_PKGARCH:tune-riscv32nf =3D "riscv32nf"
>>> -PACKAGE_EXTRA_ARCHS:tune-riscv32nf =3D "riscv32nf"
>>> +TUNE_FEATURES:tune-riscv32nf :=3D "${@oe.tune.riscv_isa_to_tune("rv3=
2imac_zicsr_zifencei")}"
>>> +PACKAGE_EXTRA_ARCHS:tune-riscv32nf =3D "${TUNE_RISCV_PKGARCH}"
>>>
>>>    # no compressed
>>> -TUNE_FEATURES:tune-riscv64nc =3D "${TUNE_FEATURES:tune-riscv64} risc=
v64nc"
>>> -TUNE_ARCH:tune-riscv64nc =3D "riscv64"
>>> -TUNE_PKGARCH:tune-riscv64nc =3D "riscv64nc"
>>> -PACKAGE_EXTRA_ARCHS:tune-riscv64nc =3D "riscv64nc"
>>> +TUNE_FEATURES:tune-riscv64nc :=3D "${@oe.tune.riscv_isa_to_tune("rv6=
4imafd_zicsr_zifencei")}"
>>> +PACKAGE_EXTRA_ARCHS:tune-riscv64nc =3D "${TUNE_RISCV_PKGARCH}"
>>> diff --git a/meta/conf/machine/qemuriscv32.conf b/meta/conf/machine/q=
emuriscv32.conf
>>> index d3858dc051..aff36c28a5 100644
>>> --- a/meta/conf/machine/qemuriscv32.conf
>>> +++ b/meta/conf/machine/qemuriscv32.conf
>>> @@ -2,9 +2,9 @@
>>>    #@NAME: generic riscv32 machine
>>>    #@DESCRIPTION: Machine configuration for running a generic riscv32
>>>
>>> -require conf/machine/include/riscv/qemuriscv.inc
>>> +DEFAULTTUNE ?=3D "riscv32"
>>>
>>> -DEFAULTTUNE =3D "riscv32"
>>> +require conf/machine/include/riscv/qemuriscv.inc
>>>
>>>    PREFERRED_VERSION_openocd-native =3D "riscv"
>>>    PREFERRED_VERSION_openocd =3D "riscv"
>>> diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
>>> index dd094a874a..73de774266 100644
>>> --- a/meta/lib/oe/__init__.py
>>> +++ b/meta/lib/oe/__init__.py
>>> @@ -12,4 +12,4 @@ __path__ =3D extend_path(__path__, __name__)
>>>    BBIMPORTS =3D ["qa", "data", "path", "utils", "types", "package", =
"packagedata", \
>>>                 "packagegroup", "sstatesig", "lsb", "cachedpath", "li=
cense", "qemu", \
>>>                 "reproducible", "rust", "buildcfg", "go", "spdx30_tas=
ks", "spdx_common", \
>>> -             "cve_check"]
>>> +             "cve_check", "tune"]
>>> diff --git a/meta/lib/oe/tune.py b/meta/lib/oe/tune.py
>>> new file mode 100644
>>> index 0000000000..7fda19430d
>>> --- /dev/null
>>> +++ b/meta/lib/oe/tune.py
>>> @@ -0,0 +1,81 @@
>>> +#
>>> +# Copyright OpenEmbedded Contributors
>>> +#
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>> +#
>>> +
>>> +# riscv_isa_to_tune(isa)
>>> +#
>>> +# Automatically translate a RISC-V ISA string to TUNE_FEATURES
>>> +#
>>> +# Abbreviations, such as rv32g -> rv32imaffd_zicsr_zifencei are supp=
orted.
>>> +#
>>> +# Profiles, such as rva22u64, are NOT supported, you must use ISA st=
rings.
>>> +#
>>> +def riscv_isa_to_tune(isa):
>>> +    _isa =3D isa.lower()
>>> +
>>> +    feature =3D []
>>> +    iter =3D 0
>>> +
>>> +    # rv or riscv
>>> +    if _isa[iter:].startswith('rv'):
>>> +        feature.append('rv')
>>> +        iter =3D iter + 2
>>> +    elif _isa[iter:].startswith('riscv'):
>>> +        feature.append('rv')
>>> +        iter =3D iter + 5
>>> +    else:
>>> +        # Not a risc-v ISA!
>>> +        return _isa
>>> +
>>> +    while (_isa[iter:]):
>>> +        # Skip _ and whitespace
>>> +        if _isa[iter] =3D=3D '_' or _isa[iter].isspace():
>>> +            iter =3D iter + 1
>>> +            continue
>>> +
>>> +        # Length, just capture numbers here
>>> +        if _isa[iter].isdigit():
>>> +            iter_end =3D iter
>>> +            while iter_end < len(_isa) and _isa[iter_end].isdigit():
>>> +                iter_end =3D iter_end + 1
>>> +
>>> +            feature.append(_isa[iter:iter_end])
>>> +            iter =3D iter_end
>>> +            continue
>>> +
>>> +        # Typically i, e or g is next, followed by extensions.
>>> +        # Extensions are single character, except for Z, Ss, Sh, Sm,=
 Sv, and X
>>> +
>>> +        # If the extension starts with 'Z', 'S' or 'X' use the name =
until the next _, whitespace or end
>>> +        if _isa[iter] in ['z', 's', 'x']:
>>> +            ext_type =3D _isa[iter]
>>> +            iter_end =3D iter + 1
>>> +
>>> +            # Multicharacter extension, these are supposed to have a=
 _ before the next multicharacter extension
>>> +            # See 37.4 and 37.5:
>>> +            # 37.4: Underscores "_" may be used to separate ISA exte=
nsions...
>>> +            # 37.5: All multi-letter extensions ... must be separate=
d from other multi-letter extensions by an underscore...
>>> +            # Some extensions permit only alphabetic characters, whi=
le others allow alphanumeric chartacters
>>> +            while iter_end < len(_isa) and _isa[iter_end] !=3D "_" a=
nd not _isa[iter_end].isspace():
>>> +                iter_end =3D iter_end + 1
>>> +
>>> +            feature.append(_isa[iter:iter_end])
>>> +            iter =3D iter_end
>>> +            continue
>>> +
>>> +        # 'g' is special, it's an abbreviation for imafd_zicsr_zifen=
cei
>>> +        # When expanding the abbreviation, any additional letters mu=
st appear before the _z* extensions
>>> +        if _isa[iter] =3D=3D 'g':
>>> +            _isa =3D 'imafd' + _isa[iter+1:] + '_zicsr_zifencei'
>>> +            iter =3D 0
>>> +            continue
>>> +
>>> +        feature.append(_isa[iter])
>>> +        iter =3D iter + 1
>>> +        continue
>>> +
>>> +    # Eliminate duplicates, but preserve the order
>>> +    feature =3D list(dict.fromkeys(feature))
>>> +    return ' '.join(feature)
>>> --
>>> 2.34.1
>>>
>>>
>>>
>>>
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#219022): https://lists.openembedded.org/g/openemb=
edded-core/message/219022
>>> Mute This Topic: https://lists.openembedded.org/mt/113700338/3616948
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [mark.hatle@kernel.crashing.org]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>

