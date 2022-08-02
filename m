Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBCD5C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 07:24:20 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.3517.1659425049914706409
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 00:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=ocYmBjKO;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from [10.88.0.66] (dslb-002-205-011-086.002.205.pools.vodafone-ip.de
 [2.205.11.86])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 8F54E8300F;
	Tue,  2 Aug 2022 09:24:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1659425047;
	bh=zpWbVUKaUVUIVe1b5B2qYCF+TiIPYAvAAyVEV1Bfddk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ocYmBjKOuf8Og1rE96a5fRuzI8w6Ct+b1rLQZc+qcgGT1/SB9jBQpwz86SRh+fXB1
	 0WISMfLXiL8PAc1ioZNZpUHP39Zhal7KZUl5g/rvYrtALmdf+dG/FEKIFTjxEHt7rp
	 /g1H8w0CnaxsNagODMjIJPp92gCKsuVEVmy+eXKBPxy/3ivronI034EpMn/zFKbI3D
	 AZue6nTn4Tbwmrd5DRxkpPoPeB9e6RCY4mzQaKJMJXRIUHvU4TbcO/Z7GXxhmagtsr
	 cqlkLoGvClCIlpHDDwCG9PtFM8FX82tmETxRxUZRFpyLO1h1VNL/WQbXdgEc5C9JVk
	 GFXN52vsmNJQg==
Message-ID: <d008419a-f8a0-cf0a-7bee-66011b5e929d@denx.de>
Date: Tue, 2 Aug 2022 09:24:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [OE-core][PATCH] rng-tools: Replace obsolete "wants
 systemd-udev-settle"
To: Drew Moseley <drew.moseley@gmail.com>,
 openembedded-core@lists.openembedded.org, raj.khem@gmail.com
References: <e0dab0cb-4eb9-78df-6854-8fdf1ba5d059@denx.de>
 <20220726131758.3371000-1-drew@moseleynet.net>
 <3562f626-f6ca-3573-cf0f-49374af11b80@gmail.com>
Content-Language: en-US
From: Claudius Heine <ch@denx.de>
Organization: Denx Software Engineering
In-Reply-To: <3562f626-f6ca-3573-cf0f-49374af11b80@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 07:24:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168769

Hi Drew,

On 2022-08-01 20:44, Drew Moseley wrote:
> On 7/26/22 9:17 AM, drew.moseley@gmail.com wrote:
>=20
>> From: Drew Moseley <drew@moseleynet.net>
>>
>> The systemd-udev-settle service is listed as obsolete and does in
>> some cases result in a significant boot time.=C2=A0 Replace that with
>> "after systemd-modules-load" to allow the random source hardware
>> to be loaded in the proper sequence.
>>
>> Before this change:
>>
>> =C2=A0=C2=A0=C2=A0 Startup finished in 4.025s (kernel) + 2min 13.236s =
(userspace) =3D=20
>> 2min 17.262s
>> =C2=A0=C2=A0=C2=A0 multi-user.target reached after 2min 8.153s in user=
space
>>
>> After this change:
>>
>> =C2=A0=C2=A0=C2=A0 Startup finished in 3.956s (kernel) + 13.294s (user=
space) =3D 17.250s
>> =C2=A0=C2=A0=C2=A0 multi-user.target reached after 9.522s in userspace
>>
>> Signed-off-by: Drew Moseley <drew@moseleynet.net>
>> ---
>> =C2=A0 meta/recipes-support/rng-tools/rng-tools/rngd.service | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service=20
>> b/meta/recipes-support/rng-tools/rng-tools/rngd.service
>> index 568686e80e..e818cfcf78 100644
>> --- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
>> +++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
>> @@ -3,7 +3,7 @@ Description=3DHardware RNG Entropy Gatherer Daemon
>> =C2=A0 DefaultDependencies=3Dno
>> =C2=A0 After=3Dsystemd-udev-settle.service
>> =C2=A0 Before=3Dsysinit.target shutdown.target
>> -Wants=3Dsystemd-udev-settle.service
>> +After=3Dsystemd-modules-load.service
>> =C2=A0 Conflicts=3Dshutdown.target
>> =C2=A0 [Service]
>=20
>=20
> Hi Khem, Claudius,
>=20
> Any thoughts on this change? Obviously I cannot verify if the original=20
> hardware combination issue is resolved and unfortunately it sounds like=
=20
> you cannot either but I'm using this successfully to work around the=20
> delayed boots I was seeing here.

Well as I said, `systemd-modules-load.service` just waits until all=20
statically configured modules are loaded, however not until the=20
`/dev/hwrng` device node is available. `systemd-udev-settle.service`=20
waits until all udev rules are applied, and that means it includes=20
loading of all dynamically loaded modules as well as executing code that=20
creates symlinks, etc.

Instead of waiting for modules to be loaded, that might be unrelated or=20
waiting for all (mostly unrelated) udev rules to be settled, I think=20
waiting directly for the `/dev/hwrng` device node might be more explicit=20
and specific.

regards,
Claudius

