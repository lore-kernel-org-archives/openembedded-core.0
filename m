Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FFD3C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 17:53:02 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.94417.1738605171866393625
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 09:52:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 513Hpnri022565;
	Mon, 3 Feb 2025 11:51:49 -0600
Received: from [192.168.2.40] ([192.168.2.40])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 513Hpmuq031585;
	Mon, 3 Feb 2025 11:51:48 -0600
Message-ID: <a7ea6dbe-4296-4b66-a619-2f3d8727db8d@kernel.crashing.org>
Date: Mon, 3 Feb 2025 11:51:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] qemuboot.bbclass: Fix QB_DEFAULT_KERNEL
 expansion
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <1738604640-31507-1-git-send-email-mark.hatle@kernel.crashing.org>
 <c9286cc8f33e97e8678d2639c17f8617a49b20a4.camel@linuxfoundation.org>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <c9286cc8f33e97e8678d2639c17f8617a49b20a4.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 513Hpnri022565
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 17:53:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210729



On 2/3/25 11:48 AM, Richard Purdie wrote:
> On Mon, 2025-02-03 at 11:44 -0600, Mark Hatle via lists.openembedded.or=
g wrote:
>> QB_DEFAULT_KERNEL was not being expanded unless INITRAMFS_LINK_NAME
>> was defined.=C2=A0 This only happens when building a kernel with an
>> integrated (bundled) initramfs.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
>> ---
>>  =C2=A0meta/classes-recipe/qemuboot.bbclass | 3 +++
>>  =C2=A01 file changed, 3 insertions(+)
>>
>> diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recip=
e/qemuboot.bbclass
>> index 0f80c60..ee71a2f 100644
>> --- a/meta/classes-recipe/qemuboot.bbclass
>> +++ b/meta/classes-recipe/qemuboot.bbclass
>> @@ -96,6 +96,9 @@
>>  =C2=A0QB_MEM ?=3D "-m 256"
>>  =C2=A0QB_SMP ?=3D ""
>>  =C2=A0QB_SERIAL_OPT ?=3D "-serial mon:stdio -serial null"
>> +# Define INITRAMFS_LINK_NAME to ensure that QB_DEFAULT_KERNEL expands=
,
>> +# even when INITRAMFS_LINK_NAME would not otherwise be defined.
>> +INITRAMFS_LINK_NAME ??=3D ""
>>  =C2=A0QB_DEFAULT_KERNEL ?=3D "${@bb.utils.contains("INITRAMFS_IMAGE_B=
UNDLE", "1", "${KERNEL_IMAGETYPE}-${INITRAMFS_LINK_NAME}.bin", "${KERNEL_=
IMAGETYPE}", d)}"
>>  =C2=A0QB_DEFAULT_FSTYPE ?=3D "ext4"
>>  =C2=A0QB_RNG ?=3D "-object rng-random,filename=3D/dev/urandom,id=3Drn=
g0 -device virtio-rng-pci,rng=3Drng0"
>=20
> Is the kernel really called ${KERNEL_IMAGETYPE}-.bin in that scenario?
> That looks a bit odd :/

I assume the "kernel-artifact-names" (where this is defined) is set when=20
building a bundled image with the kernel.

So if INITRAMFS_IMAGE_BUNDLE is 1, then kernel-artifacts-name should be s=
et.  If=20
it's NOT 1, then it will be built as a regular image recipe and=20
INITRAMFS_LINK_NAME is not set, causing QB_DEFAULT_KERNEL to not expand. =
 (but=20
the value should default to KERNEL_IMAGETYPE)

--Mark

> It feels like a situation we shouldn't be getting into in the first pla=
ce somehow.
>=20
> Cheers,
>=20
> Richard

