Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E498AC0218B
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 21:34:05 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by mx.groups.io with SMTP id smtpd.web11.27572.1737495235316748710
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 13:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=mx-20241105 header.b=NXIYjJJ/;
 spf=pass (domain: denx.de, ip: 89.58.32.78, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19B8010408F83;
	Tue, 21 Jan 2025 22:33:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1737495233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6uDwhJEpUrBaeGu50G3FbzIxDFouJbY6OYX5Ua5DUsk=;
	b=NXIYjJJ/9I54Q8vG9HT9qfhxNAcr60zGRxhg/nfBxEkEf2iy53KhdblupxoCaoLMl6Ni7q
	dYV5bvyRxfuP+FYJq87KEfeNDljn7TubvRIuJhf0BvNfuqWJUk/6L9ISmgYUf6VX0p1DD+
	w7jaMmOpxfOEOKGlaH+prggJX4hixIMvt8FfgrQXauH2UreZMmId09kRTSx34GW4leOyfL
	FkSsul/vaTi5TGqmBkgeXqoWFZt9IZfTepNb1Nfp5m5zZx/khkWJbMoPGWW5wP3YdaXXwr
	MVcKalsPWgmmOxAglO+4rb8a5j7thtwLqCIq83IZm5JQxhFmTTXJoufIEw0mKg==
Message-ID: <409ccbbe-7e4b-45b1-ada6-204304a1ccdc@denx.de>
Date: Tue, 21 Jan 2025 22:23:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] u-boot: kernel-fitimage: Fix dependency loop if
 UBOOT_SIGN_ENABLE and UBOOT_ENV enabled
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sean Anderson <sean.anderson@seco.com>
References: <20250119180926.41739-1-marex@denx.de>
 <8c83d1715bb0c8e523f4b947b0f215700f4c8c51.camel@linuxfoundation.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <8c83d1715bb0c8e523f4b947b0f215700f4c8c51.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 21:34:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210109

On 1/21/25 1:34 PM, Richard Purdie wrote:
> On Sun, 2025-01-19 at 19:08 +0100, Marek Vasut wrote:
>> In case both UBOOT_SIGN_ENABLE and UBOOT_ENV are enabled and
>> kernel-fitimage.bbclass is in use to generate signed kernel
>> fitImage, there is a circular dependency between uboot-sign
>> and kernel-fitimage bbclasses . The loop looks like this:
>>
>> kernel-fitimage.bbclass:
>> - do_populate_sysroot depends on do_assemble_fitimage
>>  =C2=A0 - do_assemble_fitimage depends on virtual/bootloader:do_popula=
te_sysroot
>>  =C2=A0=C2=A0=C2=A0 - virtual/bootloader:do_populate_sysroot depends o=
n virtual/bootloader:do_install
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D> The virtual/bootloader:do_install=
 installs and the
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 virtual/bootloader:d=
o_populate_sysroot places into
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sysroot an U-Boot en=
vironment script embedded into
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kernel fitImage duri=
ng do_assemble_fitimage run .
>>
>> uboot-sign.bbclass:
>> - DEPENDS on KERNEL_PN, which is really virtual/kernel. More accuratel=
y
>>  =C2=A0 - do_deploy depends on do_uboot_assemble_fitimage
>>  =C2=A0 - do_install depends on do_uboot_assemble_fitimage
>>  =C2=A0 - do_uboot_assemble_fitimage depends on virtual/kernel:do_popu=
late_sysroot
>>  =C2=A0=C2=A0=C2=A0 =3D> do_install depends on virtual/kernel:do_popul=
ate_sysroot
>>
>> =3D> virtual/bootloader:do_install depends on virtual/kernel:do_popula=
te_sysroot
>>  =C2=A0=C2=A0 virtual/kernel:do_populate_sysroot depends on virtual/bo=
otloader:do_install
>>
>> Attempt to resolve the loop. Pull fitimage configuration options into =
separate
>> new bbclass kernel-fitimage-config.bbclass so these configuration opti=
ons can
>> be shared by both uboot-sign.bbclass and kernel-fitimage.bbclass, and =
make use
>> of mkimage -f auto-conf / mkimage -f auto option to insert /signature =
node key-*
>> subnode into U-Boot control DT without depending on the layout of kern=
el fitImage
>> itself. This is perfectly valid to do, because the U-Boot /signature n=
ode key-*
>> subnodes 'required' property can contain either of two values, 'conf' =
or 'image'
>> to authenticate either selected configuration or all of images when bo=
oting the
>> fitImage.
>>
>> For details of the U-Boot fitImage signing process, see:
>> https://docs.u-boot.org/en/latest/usage/fit/signature.html
>> For details of mkimage -f auto-conf and -f auto, see:
>> https://manpages.debian.org/experimental/u-boot-tools/mkimage.1.en.htm=
l#EXAMPLES
>>
>> Fixes: 5e12dc911d0c ("u-boot: Rework signing to remove interdependenci=
es")
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
>> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Cc: Sean Anderson <sean.anderson@seco.com>
>> ---
>> V2: Take a different approach, split the kernel-fitimage.bbclass and
>>  =C2=A0=C2=A0=C2=A0 use it to generate dummy fitImage on demand
>> V3: Use mkimage -f auto-conf and mkimage -f auto to break the loop,
>>  =C2=A0=C2=A0=C2=A0 the fitImage .its source is not even needed becaus=
e the 'required'
>>  =C2=A0=C2=A0=C2=A0 property can only have two values, 'conf' or 'imag=
e' .
>> V4: Restore CC list
>> V5: - Add missing trailing backslash after unused.itb
>>  =C2=A0=C2=A0=C2=A0 - Replace ${UBOOT_MKIMAGE_MODE} with $UBOOT_MKIMAG=
E_MODE
>>  =C2=A0=C2=A0=C2=A0 - Move -d /dev/null to the end of mkimage invocati=
on
>> ---
>>  =C2=A0.../kernel-fitimage-config.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 50 +++++++++++++++++
>>  =C2=A0meta/classes-recipe/kernel-fitimage.bbclass=C2=A0=C2=A0 | 54 +-=
-----------------
>>  =C2=A0meta/classes-recipe/uboot-sign.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 27 +++++-----
>>  =C2=A03 files changed, 65 insertions(+), 66 deletions(-)
>>  =C2=A0create mode 100644 meta/classes-recipe/kernel-fitimage-config.b=
bclass
>=20
> This looks great and I'm nearly ready to merge it but I do have one
> further request. Instead of creating kernel-fitimage-config.bbclass,
> could you create something like meta/conf/image-fitimage.conf?
>=20
> There is already precedent for this with image-uefi.conf and you can
> include with require ../conf/image-fitimage.conf. I'd like to see
> config variables being in conf files rather than class files.
>=20
> Adding some comments at the top of the new file explaining which config
> settings are there and what it is for would also be good.
I hope they are all addressed in V6, thanks.

