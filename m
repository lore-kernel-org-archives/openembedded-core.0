Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C15D3C6FD1F
	for <webhook@archiver.kernel.org>; Sun, 19 Mar 2023 22:55:46 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.1827.1679266536201619040
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Mar 2023 15:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=qTDts20E;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id EC9798339E;
	Sun, 19 Mar 2023 23:55:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1679266533;
	bh=jOZK9izshjeVVagHAIm8Rrme1vlT/Fqh2Wa+uZQkRdE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qTDts20EiLpwsfu3ss+MTk8RIlk/H/C450FHIQdsFSnNEvHNXjkzhjX6X033swfjO
	 xLVmQAbQbC+gtKDWpZFulC4p0ERWfBhkD8z1cF24rLU0tu5Cjcb5X9x5T5EKGXtnW8
	 kUJsj4kNeOznNzefiHBqIT3AeMEgDPCY6sI2JtES/aOxvK2AqLP0UaEZv9vRal+GvI
	 9qZibl1WEA/YwbAGssy/S808lsrxlrTZ4WlycFpoHj6F9iQXNAGzyurxveae5GVGZS
	 g+6X/TMf3Y+an95Q68b3up0yZlA9n9gwUj9Swa8mrGrHTPiIm+fVJHNtsZYAXPEygg
	 q0AJW2TxTHhgQ==
Message-ID: <4cea1d51-8291-48a9-629c-8ebdd1a97e71@denx.de>
Date: Sun, 19 Mar 2023 23:55:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core] [PATCH] systemd-systemctl: Create machine-id with
 "uninitialized" text in it
Content-Language: en-US
To: "Chen, Qi" <Qi.Chen@windriver.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Armin Kuster <akuster808@gmail.com>, Bob Henz <robert_henz@jabil.com>,
 Kristian Klausen <kristian@klausen.dk>,
 Nick Potenski <nick.potenski@garmin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20230227191548.95504-1-marex@denx.de>
 <b006eac7-bc3b-59f7-0ac3-7701042bac54@windriver.com>
 <34a6fdfb-f96d-536d-7761-fb46b06a302f@denx.de>
 <CO6PR11MB560219C3F043786F9A9EF378EDBD9@CO6PR11MB5602.namprd11.prod.outlook.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CO6PR11MB560219C3F043786F9A9EF378EDBD9@CO6PR11MB5602.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Mar 2023 22:55:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178797

On 3/17/23 15:32, Chen, Qi wrote:
> Hi Marek,

Hi,

sorry for the delay

> I used the following line in local.conf and the firstboot worked:
> IMAGE_PREPROCESS_COMMAND:remove =3D "systemd_preset_all;"

But doesn't that also inhibit the rootfs-time preset-all ? I would like=20
to keep that, I just need for the systemd firstboot units to run on=20
first boot to do first boot system setup things, which they won't=20
without the 'uninitialized' in /etc/machine-id .

> -----Original Message-----
> From: Marek Vasut <marex@denx.de>
> Sent: Friday, March 17, 2023 7:54 PM
> To: Chen, Qi <Qi.Chen@windriver.com>; openembedded-core@lists.openembed=
ded.org
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>; Armin Kuster <ak=
uster808@gmail.com>; Bob Henz <robert_henz@jabil.com>; Kristian Klausen <=
kristian@klausen.dk>; Nick Potenski <nick.potenski@garmin.com>; Richard P=
urdie <richard.purdie@linuxfoundation.org>
> Subject: Re: [OE-core] [PATCH] systemd-systemctl: Create machine-id wit=
h "uninitialized" text in it
>=20
> On 3/15/23 11:10, ChenQi wrote:
>=20
> Hi,
>=20
>> This patch is forcing systemd to do preset-all at boot time (first
>> boot) in a function that simulates 'preset-all' at rootfs time.
>>
>> If we look at the comments above the changed line, we can see that the
>> /etc/machine-id file was deliberately created as empty, for the
>> purpose of making systemd not treat the system as first boot.
>> """
>>   =C2=A0=C2=A0=C2=A0 # If we populate the systemd links we also create
>> /etc/machine-id, which
>>   =C2=A0=C2=A0=C2=A0 # allows systemd to boot with the filesystem read=
-only before
>> generating
>>   =C2=A0=C2=A0=C2=A0 # a real value and then committing it back.
>>   =C2=A0=C2=A0=C2=A0 #
>>   =C2=A0=C2=A0=C2=A0 # For the stateless configuration, where /etc is =
generated at
>> runtime
>>   =C2=A0=C2=A0=C2=A0 # (for example on a tmpfs), this script shouldn't=
 run at all and
>> we
>>   =C2=A0=C2=A0=C2=A0 # allow systemd to completely populate /etc.
>> """
>>
>> I'm going to send out a patch to revert this patch.
>=20
> Hmmm, the problem is that without this patch, systemd firstboot does no=
t work and I would like to use that. How can we accommodate both options,=
 i.e. no breakage for you and working systemd-firstboot ?

