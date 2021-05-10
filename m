Received: from outbound.soverin.net (outbound.soverin.net [116.202.65.218])
 by mx.groups.io with SMTP id smtpd.web12.31780.1620652988307594300
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 06:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@embed.me.uk header.s=soverin header.b=IBUVRTxD;
 spf=pass (domain: embed.me.uk, ip: 116.202.65.218, mailfrom: ml@embed.me.uk)
Received: from smtp.soverin.net (unknown [10.10.3.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id 5A1B5600ED
	for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 13:23:05 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [159.69.232.138]) by soverin.net
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=embed.me.uk;
	s=soverin; t=1620652984;
	bh=cMY43rs1v1FuRShDg6MNw2l259y8z6Aut2TVN3w1b1c=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=IBUVRTxDFvmsVkLmbs6ObYxcuh/AwnEQPzkUE6vbvHWlEaKAbfx1gA8FIC00wtn+C
	 Qmh76i2BjYGR5fCyG7QhnryS6bPypM5ui+UhH3qKhz8H0W6MlNJlzSAoMDPYmj0Z4D
	 9Zrj4WZ3UXfi5y2U7PSA+W/PJOBBTpkEVRKpVZvdUtLCHLGf4M50ZXs0DdxA/wzyom
	 MiRb47oFg3t3+lJfWIY+AYvr5/Y+Ik7Jv70JSgeCqGyHaSkBHrom6DYn+X48f686q5
	 M947JOsv2GQ4IZrEj0Xy/hSfrwLLvRVM6g2ImRpcab7Y/w65WyFz1jFUcc1aC+9n07
	 rp5gLfwpIEryA==
Subject: Re: [OE-core] [PATCH] rng-tools: disable the CPU affinity mask
To: openembedded-core@lists.openembedded.org
References: <20210510023310.5516-1-mingli.yu@windriver.com>
 <5aa52a186119be3add2555d6dbc89f348699aae8.camel@linuxfoundation.org>
From: "Jack Mitchell" <ml@embed.me.uk>
Message-ID: <fac5bcb3-fa84-5b3d-20be-779b6b55781a@embed.me.uk>
Date: Mon, 10 May 2021 14:23:02 +0100
MIME-Version: 1.0
In-Reply-To: <5aa52a186119be3add2555d6dbc89f348699aae8.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: quoted-printable

On 10/05/2021 10:48, Richard Purdie wrote:
> On Mon, 2021-05-10 at 10:33 +0800, Yu, Mingli wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> For the jitter entropy source, each task thread will create an interna=
l
>> counter timer thread when the system clock resolution is under 5MHz.
>>
>> But it will introduce high cpu usage for a long time and also make ran=
dom
>> data generate too slow if sets the CPU affinity mask of the internal c=
ounter
>> timer thread.
>>
>> There is no solution until now and the Upstream recommends to disable
>> the internal timer and think Jitter RNG will not work due to the coars=
e
>> timer. Check [1] and [2] for more details.
>>
>> So disable the CPU affinity mask as a workaround to avoid lots of cont=
ext
>> switch and too high cpu load for a long time.
>>
>> [1] https://github.com/smuellerDD/jitterentropy-library/issues/37
>> [2] https://github.com/nhorman/rng-tools/pull/123
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>> =C2=A0...tter.c-disable-the-CPU-affinity-mask.patch | 48 +++++++++++++=
++++++
>> =C2=A0.../rng-tools/rng-tools_6.11.bb               |  1 +
>> =C2=A02 files changed, 49 insertions(+)
>> =C2=A0create mode 100644 meta/recipes-support/rng-tools/rng-tools/0001=
-rngd_jitter.c-disable-the-CPU-affinity-mask.patch
>=20
> Thanks for investigating this upstream. From an OE-Core perspective, I'=
ve very
> reluctant to take what looks like a very board specific change which th=
e upstream
> is advising against. The issue is that this will affect all hardware, n=
ot just
> the hardware which has the issue. I think we need to find a better solu=
tion.
>=20
> Cheers,
>=20
> Richard
>=20

FWIW I forcefully have to ensure nothing pulls in rng-tools in my builds
which are for two different Rockchip chipsets (armv7 and armv8) as the
rng-tools binary pegs the CPU at 100% for minutes after boot, every
boot. It's particularly annoying as openssh brings it in by default
which I've unsuccessfully argued is wrong before. I believe the problem
is probably fairly widespread but just unnoticed.

Regards,

--=20
Jack Mitchell, Consultant
https://www.tuxable.co.uk
