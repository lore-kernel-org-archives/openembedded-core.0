Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B628C83F09
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 14:54:25 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.17757.1752072859142986132
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 07:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 569EsHei430823
	for <openembedded-core@lists.openembedded.org>; Wed, 9 Jul 2025 09:54:18 -0500
Received: from [192.168.2.97] ([192.168.2.97])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 569EsHkc001260
	for <openembedded-core@lists.openembedded.org>; Wed, 9 Jul 2025 09:54:17 -0500
Message-ID: <a23f5658-d4a8-4ad1-8eb5-924a36d04bad@kernel.crashing.org>
Date: Wed, 9 Jul 2025 09:54:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 6/6] qemuriscv: Dynamically configure qemu
 CPU
To: openembedded-core@lists.openembedded.org
References: <1751492664-12569-1-git-send-email-mark.hatle@kernel.crashing.org>
 <1751492664-12569-7-git-send-email-mark.hatle@kernel.crashing.org>
 <84caeee4b92dad27f67c745c63aaafbf9abb6c1b.camel@linuxfoundation.org>
Content-Language: en-US
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <84caeee4b92dad27f67c745c63aaafbf9abb6c1b.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 569EsHei430823
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 14:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220090

I will investigate.

I suspect SOME of this may be test cases with hard coded riscv assembly i=
n them=20
using extensions that we've not enabled.

The configuration listed in the logs for the kernel are:

rv64imafdc

  '[    0.000000] riscv: base ISA extensions acdfim\n'
  '[    0.000000] riscv: ELF capabilities acdfim\n'

The 'v' (vector) extension is intentionally not enabled to match the soft=
ware=20
configuration, but some tests may be trying to use it.

I'll walk through this and attempt to get this identified for real.

--Mark

On 7/9/25 4:17 AM, Richard Purdie via lists.openembedded.org wrote:
> On Wed, 2025-07-02 at 16:44 -0500, Mark Hatle via lists.openembedded.or=
g wrote:
>> From: Mark Hatle <mark.hatle@amd.com>
>>
>> Use TUNE_FEATURES to dynamically configure the QEMU emulated CPU for t=
he
>> options selected by the DEFAULTTUNE.
>>
>> Note: OpenSBI currently requires 'c' (compressed instructions) or it w=
ill
>> not work.
>>
>> Change the base device configuration to use a different variable to se=
lect
>> the emulate devices.=C2=A0 This will allow a user to override or appen=
d the
>> QB_OPT_APPEND without the riscv32 override getting in the way.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
>> ---
>>  =C2=A0meta/conf/machine/include/riscv/qemuriscv.inc | 31 ++++++++++++=
+++++--
>>  =C2=A01 file changed, 28 insertions(+), 3 deletions(-)
>>
>=20
> FWIW I narrowed down the ptest failures to this patch.
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220084): https://lists.openembedded.org/g/openembed=
ded-core/message/220084
> Mute This Topic: https://lists.openembedded.org/mt/113956553/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
mark.hatle@kernel.crashing.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

