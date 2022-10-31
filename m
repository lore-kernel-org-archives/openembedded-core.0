Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5040FA3741
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 21:48:40 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.1955.1667252913957606626
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 14:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=iP2yGUns;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 0ADA68509A;
	Mon, 31 Oct 2022 22:48:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1667252911;
	bh=xlFIYgQMog9wZcfoikMg3jnamIJHtoahVHSD0McLxyg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iP2yGUnsA1FlPA9TuTKbd0EyRAILF7YlFK9yZlIdCFoNbvC/wSL2/GPW5CaTiFMya
	 W9gkC0Oq6ykGeeuRwQbiab6TCuDLLwhk2OXTmCCzRub2prgd6NkB4QW7deIs+1Jrv8
	 Hk6fiGvFOslFeMMCCPw6SDSJDOnd6pMLY8xxLBvJV5Anlu9teZAGlEPI8r8Nux6hwE
	 OsN9ee91751BNC3A2ir6QmFHVsBgMRmbFhIeIh4xgWmC4H2Gzoesn9j5fAcj+FCWVR
	 0977Rvp9RqQ4UTOCDFbSYh8wkrGQ7uPnIPo8QVIBdwzwQKio8epqcrMYKKY9eGIHYI
	 fL9jiF1vY94Zw==
Message-ID: <b887a9e5-5d2a-1091-c6b4-13e2ac6266f7@denx.de>
Date: Mon, 31 Oct 2022 21:54:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [OE-core] [PATCH] bluez5: Point hciattach bcm43xx firmware search
 path to /lib/firmware
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Alexander Kanavin <alex@linutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20221031163015.19021-1-marex@denx.de>
 <CANPvuRnxR-wLqt4iONT7wjbEpKMOHC97KqAu=cxqX5t04gAZvw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CANPvuRnxR-wLqt4iONT7wjbEpKMOHC97KqAu=cxqX5t04gAZvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 21:48:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172340

On 10/31/22 20:18, Jose Quaresma wrote:
> Hi Marek,

Hi,

> Marek Vasut <marex@denx.de> escreveu no dia segunda, 31/10/2022 =C3=A0(=
s) 16:30:
>=20
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
>>   meta/recipes-connectivity/bluez5/bluez5.inc | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc
>> b/meta/recipes-connectivity/bluez5/bluez5.inc
>> index f07e318897..fe10be7324 100644
>> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
>> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
>> @@ -68,6 +68,8 @@ EXTRA_OECONF =3D "\
>>     --without-zsh-completion-dir \
>>   "
>>
>> +CFLAGS:append =3D " -DFIRMWARE_DIR=3D\\"/lib/firmware\\""
>>
>=20
> Escape chars can be tricky when parsing and as the path
> doesn't have any space we can have " -DFIRMWARE_DIR=3D/lib/firmware"
> or not?

No, because then the macro gets expanded in place in hciconfig_bcm43xx.c=20
to something like printf(/lib/firmware); which the compiler does not=20
like obviously. The quotes are really mandatory there, I tried various=20
combinations (sigh) until I arrived at this working one.

> Another options to avoid escape chars can be
> CFLAGS:append =3D ' -DFIRMWARE_DIR=3D"/lib/firmware"'

[...]

