Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by mx.groups.io with SMTP id smtpd.web12.9805.1615820321310283228
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 07:58:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.9, mailfrom: sbabic@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4Dzfgg5WFzz1qtQx;
	Mon, 15 Mar 2021 15:58:39 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4Dzfgg4tq3z1qqkT;
	Mon, 15 Mar 2021 15:58:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id UTDcZx1x5HlU; Mon, 15 Mar 2021 15:58:38 +0100 (CET)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net [88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Mon, 15 Mar 2021 15:58:38 +0100 (CET)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id 59AC64541312;
	Mon, 15 Mar 2021 15:58:38 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([IPv6:::1])
	by localhost (mail.babic.homelinux.org [IPv6:::1]) (amavisd-new, port 10024)
	with ESMTP id 5HkJpJt0EbVO; Mon, 15 Mar 2021 15:58:35 +0100 (CET)
Received: from [192.168.178.48] (paperino.fritz.box [192.168.178.48])
	by babic.homelinux.org (Postfix) with ESMTP id D63014540C3D;
	Mon, 15 Mar 2021 15:58:35 +0100 (CET)
To: Mike Looijmans <mike.looijmans@topic.nl>, Stefano Babic <sbabic@denx.de>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.8fe74b17-765d-490b-bd80-d5971d41488f@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.1e9416a1-3cc9-4dc0-8334-9bfb06079d86@emailsignatures365.codetwo.com>
 <4e1a212c-32d2-b474-3bc4-06b271e68f82@topic.nl>
 <19f19fd4-a80e-45ae-3fcc-36016baf8754@denx.de>
 <073fe5f4-0a45-aaa5-39f8-2f0c0b3c30d0@topic.nl>
From: "Stefano Babic" <sbabic@denx.de>
Subject: Re: [OE-core] Build the "boot" partition image (just like the rootfs)
Message-ID: <f988e8a8-eba4-63d0-334f-caabb0e86a83@denx.de>
Date: Mon, 15 Mar 2021 15:58:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <073fe5f4-0a45-aaa5-39f8-2f0c0b3c30d0@topic.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On 15.03.21 15:46, Mike Looijmans wrote:
>=20
> Met vriendelijke groet / kind regards,
>=20
> Mike Looijmans
> System Expert
>=20
>=20
> TOPIC Embedded Products B.V.
> Materiaalweg 4, 5681 RJ Best
> The Netherlands
>=20
> T: +31 (0) 499 33 69 69
> E: mike.looijmans@topicproducts.com
> W: www.topicproducts.com
>=20
> Please consider the environment before printing this e-mail
> On 15-03-2021 14:47, Stefano Babic wrote:
>> Hi Mike,
>>
>> On 15.03.21 14:13, Mike Looijmans wrote:
>>> For software updates, I want to have what would have gone into the=20
>>> boot partition of the WIC image as a separate file.
>>>
>>> If I want to have the contents of the rootfs as an ext4 image, I can=20
>>> just specify IMAGE_TYPES=3D"ext4" in my image recipe.
>>> =C2=A0> This image I can feed to SWUdate and write to the rootfs stor=
age.
>>>
>>> But I also want to be able to update the boot partition (for example,=
=20
>>> the raspberrypi has the annoying property that devicetree and kernel=20
>>> reside here).
>>
>> This is very annoying, but you could also get rid of it. You can=20
>> install kernel and device tree in your rootfs (then they are located=20
>> in /boot as usual), and you switch to U-Boot ( RPI_USE_U_BOOT =3D "1")=
.=20
>> The proprietary bootloader will start U-Boot instead of kernel, and in=
=20
>> u-boot you can load kernel and device tree from your rootfs.
>=20
> That's what I did on other boards, but for the RPi that's not enough.=20
> There's also firmware there, which interacts with the kernel, and the=20
> firmware is altering the devicetree too. It's pretty likely that the=20
> firmware needs an update too when the kernel gets a big update.
>=20
>=20
>>
>>>
>>> If I create a WIC image, the boot partition is in there with the=20
>>> proper files (from IMAGE_BOOT_FILES) so I would really like to re-use=
=20
>>> that code. I could create the wic image and then cut out the part I=20
>>> want, but that doesn't seem particularly nice.
>>
>> You can add vfat support for IMAGE_FSTYPES, and then you can build an=20
>> image (you can just take the files you have in IMAGE_BOOT_FILES).
>=20
> But that's *exactly* my problem: How do I get these IMAGE_BOOT_FILES=20
> into an image of sorts? Just setting IMAGE_FSTYPE=3D"vfat" will put the=
=20
> rootfs contents in there, not the bootfiles I'm after.

rpi-bootfiles inherit nopackage, so you should write a recipe that=20
instead of simply deploying the files as this recipe does, install them.=20
You should then install it into /, as this is where they are put on the=20
VFAT partition. If they are in the package, you can write an image=20
recipe to install it via IMAGE_INSTALL, and via post process command you=20
drop what is not necessary (/etc,...).

Anyway, as far as I know, an IMAGE_FSTYPES +=3D "vfat" is not supported,=20
you have also to add support for it.

>=20
>>
>>>
>>> What I want to do at update time is to write the new boot partition=20
>>> to another location on disk, and then adjust the partition table to=20
>>> make the first partition entry point to the new copy. That way, in=20
>>> case of unexpected failure (power loss for example), the device=20
>>> remains bootable.
>>
>> This does not seem to be atomic. It remains the risk that partition=20
>> table gets corrupted and then even the first bootloader cannot run. If=
=20
>> you want to have a power-cut safe way to update is not enough.
>=20
> It's not perfect but it's close enough. The partition table resides in =
a=20
> single sector, so chances of power-out at exactly this moment are small=
=20
> enough that I'm willing to take my chances here.
>=20
> My experience is that there's more chance of the SD card completely=20
> dying because of power-out during some internal mumbojumbo than=20
> corrupting that partition table.

True, that is. So simply the hardware does not allow a safe update,=20
point. Fully agree. Or use a very expensive industrial grade SD, but any=20
board with eMMC is then cheaper.

> Against that SD failure there's nothing=20
> I can do...

Absolutely true.

Best regards,
Stefano Babic


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
