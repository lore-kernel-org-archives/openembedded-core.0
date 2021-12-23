Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02964C433F5
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 12:24:27 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.31814.1640262266214720867
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 04:24:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.232,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id D7EC7200003;
	Thu, 23 Dec 2021 12:24:23 +0000 (UTC)
Date: Thu, 23 Dec 2021 13:24:19 +0100
From: Quentin Schulz <foss+yocto@0leil.net>
To: yocto@lists.yoctoproject.org, JH <jupiter.hce@gmail.com>,
 yocto <yocto@lists.yoctoproject.org>
CC: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Where to define udev to load kernel modules in boot?
In-Reply-To: 
 <CAA=hcWSFfUY8rh4WCvqNmbDPOO2=BMH5CUA9ZkEXuKit+3LK6Q@mail.gmail.com>
References: 
 <CAA=hcWSFfUY8rh4WCvqNmbDPOO2=BMH5CUA9ZkEXuKit+3LK6Q@mail.gmail.com>
Message-ID: <41D27EB7-6A9C-4640-8224-9BA33FBCC0CB@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Dec 2021 12:24:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159977

Hi JH,

On December 23, 2021 11:28:55 AM GMT+01:00, JH <jupiter=2Ehce@gmail=2Ecom>=
 wrote:
>Hi,
>
>I built an OE/Yocto IoT device to include kernel modules of usb_wwan,
>usbserial, mwifiex_sdio, mwifiex etc, there is one udev from
>meta-freescale/recipes-core/udev/udev-rules-imx/10-imx=2Erules
>
># ls /etc/udev/rules=2Ed
>10-imx=2Erules       touchscreen=2Erules
>
>My device does not have a touchscreen so that touchscreen=2Erules should
>not be there=2E The 10-imx=2Erules does not define any kernel modules
>usb_wwan, usbserial, mwifiex_sdio, mwifiex, the device does not have
>video or any input
>
># cat /etc/udev/rules=2Ed/10-imx=2Erules
>KERNEL=3D=3D"mc13783_connectiv*",  NAME=3D"mc13783_connectivity"
># Anyone has readonly permission to IIM device file
>KERNEL=3D=3D"mxc_iim",  MODE=3D"0444", SYMLINK+=3D"mxc_mem"
>KERNEL=3D=3D"mxs_viim", MODE=3D"0444", SYMLINK+=3D"mxc_mem"
>KERNEL=3D=3D"mxc_ipu",  MODE=3D"0666"
>KERNEL=3D=3D"mxc_vpu",  MODE=3D"0666"
>SUBSYSTEM=3D=3D"video", MODE=3D"0660"
>KERNEL=3D=3D"fb[0-9]",  MODE=3D"0660", GROUP=3D"video"
>KERNEL=3D=3D"gsl_kmod", MODE=3D"0660", GROUP=3D"video"
>KERNEL=3D=3D"galcore",  MODE=3D"0660", GROUP=3D"video"
>
>How can I define udev in recipes to make the system to load kernel
>modules of usb_wwan, usbserial, mwifiex_sdio, mwifiex in boot?
>

IIRC, you need to add your package to KERNEL_MODULE_AUTOLOAD, c=2Ef=2E htt=
ps://docs=2Eyoctoproject=2Eorg/ref-manual/variables=2Ehtml#term-KERNEL_MODU=
LE_AUTOLOAD

Cheers,
Quentin

>Thank you=2E
>
>Kind regards,
>
>- jh

