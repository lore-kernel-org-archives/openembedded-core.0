Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by mx.groups.io with SMTP id smtpd.web09.8878.1615816037958199048
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 06:47:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.9, mailfrom: sbabic@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4Dzd562hSpz1qsZs;
	Mon, 15 Mar 2021 14:47:06 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4Dzd562Vjbz1qqkJ;
	Mon, 15 Mar 2021 14:47:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id lSF6QupHoNDQ; Mon, 15 Mar 2021 14:47:05 +0100 (CET)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net [88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Mon, 15 Mar 2021 14:47:05 +0100 (CET)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id 127584541312;
	Mon, 15 Mar 2021 14:47:05 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([IPv6:::1])
	by localhost (mail.babic.homelinux.org [IPv6:::1]) (amavisd-new, port 10024)
	with ESMTP id mu4Lmqsn3JQR; Mon, 15 Mar 2021 14:47:02 +0100 (CET)
Received: from [192.168.178.48] (paperino.fritz.box [192.168.178.48])
	by babic.homelinux.org (Postfix) with ESMTP id 0AA184540C3D;
	Mon, 15 Mar 2021 14:47:01 +0100 (CET)
To: Mike Looijmans <mike.looijmans@topic.nl>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.8fe74b17-765d-490b-bd80-d5971d41488f@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.1e9416a1-3cc9-4dc0-8334-9bfb06079d86@emailsignatures365.codetwo.com>
 <4e1a212c-32d2-b474-3bc4-06b271e68f82@topic.nl>
From: "Stefano Babic" <sbabic@denx.de>
Subject: Re: [OE-core] Build the "boot" partition image (just like the rootfs)
Message-ID: <19f19fd4-a80e-45ae-3fcc-36016baf8754@denx.de>
Date: Mon, 15 Mar 2021 14:47:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <4e1a212c-32d2-b474-3bc4-06b271e68f82@topic.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On 15.03.21 14:13, Mike Looijmans wrote:
> For software updates, I want to have what would have gone into the boot=
=20
> partition of the WIC image as a separate file.
>=20
> If I want to have the contents of the rootfs as an ext4 image, I can=20
> just specify IMAGE_TYPES=3D"ext4" in my image recipe.
>  > This image I can feed to SWUdate and write to the rootfs storage.
>=20
> But I also want to be able to update the boot partition (for example,=20
> the raspberrypi has the annoying property that devicetree and kernel=20
> reside here).

This is very annoying, but you could also get rid of it. You can install=20
kernel and device tree in your rootfs (then they are located in /boot as=20
usual), and you switch to U-Boot ( RPI_USE_U_BOOT =3D "1"). The=20
proprietary bootloader will start U-Boot instead of kernel, and in=20
u-boot you can load kernel and device tree from your rootfs.

>=20
> If I create a WIC image, the boot partition is in there with the proper=
=20
> files (from IMAGE_BOOT_FILES) so I would really like to re-use that=20
> code. I could create the wic image and then cut out the part I want, bu=
t=20
> that doesn't seem particularly nice.

You can add vfat support for IMAGE_FSTYPES, and then you can build an=20
image (you can just take the files you have in IMAGE_BOOT_FILES).

>=20
> What I want to do at update time is to write the new boot partition to=20
> another location on disk, and then adjust the partition table to make=20
> the first partition entry point to the new copy. That way, in case of=20
> unexpected failure (power loss for example), the device remains bootabl=
e.

This does not seem to be atomic. It remains the risk that partition=20
table gets corrupted and then even the first bootloader cannot run. If=20
you want to have a power-cut safe way to update is not enough.

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
