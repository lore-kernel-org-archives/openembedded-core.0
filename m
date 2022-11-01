Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C98BC433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 21:02:21 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.764.1667336538226802699
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 14:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=UZ0IMxJS;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id CF90284EEF;
	Tue,  1 Nov 2022 22:02:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1667336535;
	bh=GqlB15Ostk2ePTguQJsPyUdIlob4k22dwJUwNdBjNkA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UZ0IMxJSVO11tcw9VpX7qN5GW/ymDxLiWKm7KBQYXfA13o++j8I4PCjcxZmEqwEnN
	 O9AnuYx0vO8HKIR0MQCi1A7Jl0fr1FUKqliKJlNBh3i22SKNE6e/JH+N0bUmQqUXTS
	 4VqLZ4R3tZnc43nzNoFAlqcikULqVQg8CC57CVGuPicoOtD+rhveMjtVDgCeZtwdpw
	 uh1oeNOF6q7heNayP0vtJ9yO72mESP0P5PYFBbzToKPLo0SIvBKc73PiazGKJG234b
	 sMii60uIpvhBDSeFoQY6GcZuiPrAm9F+if+R1rnR+Jx2vb7y7LS81c2X9jlVtI1rQH
	 tVpN5v80FdE9g==
Message-ID: <29c6d2f8-fbe1-6251-7e47-424a19d662a5@denx.de>
Date: Tue, 1 Nov 2022 22:02:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [OE-core] [PATCH v2] bluez5: Point hciattach bcm43xx firmware
 search path to /lib/firmware
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20221101115445.18282-1-marex@denx.de>
 <1a13e680-26ec-d87f-95c3-7be37ff316ca@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <1a13e680-26ec-d87f-95c3-7be37ff316ca@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 21:02:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172389

On 11/1/22 21:41, Khem Raj wrote:
> On 11/1/22 4:54 AM, Marek Vasut wrote:
>> Currently the hciattach bcm43xx firmware loader looks up the firmware
>> blob in /etc/firmware . Change this to /lib/firmware instead, so that
>> the path is consistent with Linux kernel which also looks up firmware
>> for the WiFi part in /lib/firmware .
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Alexander Kanavin <alex@linutronix.de>
>> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>> V2: Replace hard-coded /lib with ${nonarch_base_libdir}
>> ---
>> =C2=A0 meta/recipes-connectivity/bluez5/bluez5.inc | 2 ++
>> =C2=A0 1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc=20
>> b/meta/recipes-connectivity/bluez5/bluez5.inc
>> index f07e318897..a2aa7b86c4 100644
>> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
>> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
>> @@ -68,6 +68,8 @@ EXTRA_OECONF =3D "\
>> =C2=A0=C2=A0=C2=A0 --without-zsh-completion-dir \
>> =C2=A0 "
>> +CFLAGS:append =3D " -DFIRMWARE_DIR=3D\\"${nonarch_base_libdir}/firmwa=
re\\""
>=20
> why do we use append and not +=3D here ?

Isn't the override syntax preferred now ?

