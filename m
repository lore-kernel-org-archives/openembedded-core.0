Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD7CC71159
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 14:09:06 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.31556.1750082941225848030
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 07:09:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 55GE7wJo006006;
	Mon, 16 Jun 2025 09:07:59 -0500
Received: from [192.168.2.13] ([192.168.2.13])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 55GE7vLs009575;
	Mon, 16 Jun 2025 09:07:57 -0500
Message-ID: <1420b5be-ecb2-4c97-90ee-9de2f1d65863@kernel.crashing.org>
Date: Mon, 16 Jun 2025 09:07:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 6/6] linux-yocto.inc: State riscv required
 tune_features
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <1750040965-15015-1-git-send-email-mark.hatle@kernel.crashing.org>
 <1750040965-15015-7-git-send-email-mark.hatle@kernel.crashing.org>
 <CADkTA4PS5PwR6dL9GFQzMst-WdWSL+FAoWz4tBkuLGnqafxQFA@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <CADkTA4PS5PwR6dL9GFQzMst-WdWSL+FAoWz4tBkuLGnqafxQFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 55GE7wJo006006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 14:09:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218826



On 6/16/25 6:05 AM, Bruce Ashfield wrote:
>=20
>=20
> On Sun, Jun 15, 2025 at 10:29=E2=80=AFPM Mark Hatle via lists.openembed=
ded.org=20
> <http://lists.openembedded.org>=20
> <mark.hatle=3Dkernel.crashing.org@lists.openembedded.org=20
> <mailto:kernel.crashing.org@lists.openembedded.org>> wrote:
>=20
>     From: Mark Hatle <mark.hatle@amd.com <mailto:mark.hatle@amd.com>>
>=20
>     Required:
>      =C2=A0 =C2=A0rv32ima_zicsr_zifencei
>      =C2=A0 =C2=A0rv64ima_zicsr_zifencei
>=20
>     See the arch/riscv/Makefile:
>=20
>     riscv-march-$(CONFIG_ARCH_RV32I)=C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D rv=
32ima
>     riscv-march-$(CONFIG_ARCH_RV64I)=C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D rv=
64ima
>     riscv-march-$(CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI) :=3D
>     $(riscv-march-y)_zicsr_zifencei
>=20
>     Signed-off-by: Mark Hatle <mark.hatle@amd.com <mailto:mark.hatle@am=
d.com>>
>     ---
>      =C2=A0meta/recipes-kernel/linux/linux-yocto.inc | 5 +++++
>      =C2=A01 file changed, 5 insertions(+)
>=20
>     diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>     b/meta/recipes-kernel/linux/linux-yocto.inc
>     index cdf2583698..80db85fe89 100644
>     --- a/meta/recipes-kernel/linux/linux-yocto.inc
>     +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>     @@ -51,6 +51,11 @@ SRC_URI_RISCV =3D "\
>      =C2=A0SRC_URI:append:riscv32 =3D "${SRC_URI_RISCV}"
>      =C2=A0SRC_URI:append:riscv64 =3D "${SRC_URI_RISCV}"
>=20
>     +inherit features_check
>     +
>     +REQUIRED_TUNE_FEATURES:riscv32 =3D "rv 32 i m a zicsr zifencei"
>     +REQUIRED_TUNE_FEATURES:riscv64 =3D "rv 64 i m a zicsr zifencei"
>     +
>=20
>=20
> I don't think we should be enforcing this at this level. The kernel has=
 always been
> responsible for setting the compiler options that it requires.=C2=A0 An=
d we don't=20
> check or
> otherwise manipulate that from the build system.
>=20
> What exactly are you trying to enforce / check here ?

On risc-v there is a minimum risc-v ISA required by Linux,  rv32ima + zic=
sr +=20
zifencei (or rv64ima).  The risc-v spec allows you to configure your CPU =
in a=20
way that may not meet the minimum kernel requirement(s) (especially on FP=
GA=20
based configurable CPUs.)

Since the arch/riscv/Makefile has a minimum requirement specified in it, =
I added=20
the feature check to prevent a long build and eventual runtime failure.  =
(Since=20
the kernel just sets whatever values it uses, you won't get a compilation=
=20
failure, just a failure of "it doesn't boot".)

(As an FYI, looking at how the kernel is configured and works, I doubt th=
at=20
there will be a future change to remove the 'm a zicsr and zifencei'=20
requirements, the rv32i and rv64i are the base spec 32-bit and 64-bit ISA=
s.)

--Mark

> Bruce
>=20
>      =C2=A0# A KMACHINE is the mapping of a yocto $MACHINE to what is b=
uilt
>      =C2=A0# by the kernel. This is typically the branch that should be=
 built,
>      =C2=A0# and it can be specific to the machine or shared
>     --=20
>     2.34.1
>=20
>=20
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#218760):
>     https://lists.openembedded.org/g/openembedded-core/message/218760
>     <https://lists.openembedded.org/g/openembedded-core/message/218760>
>     Mute This Topic: https://lists.openembedded.org/mt/113664657/105081=
0
>     <https://lists.openembedded.org/mt/113664657/1050810>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe: https://lists.openembedded.org/g/openembedded-core/uns=
ub
>     <https://lists.openembedded.org/g/openembedded-core/unsub>
>     [bruce.ashfield@gmail.com <mailto:bruce.ashfield@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
>=20
>=20
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at=20
> its end
> - "Use the force Harry" - Gandalf, Star Trek II
>=20

