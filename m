Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2595E77188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:52:13 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.40268.1736844731698028969
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:52:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=F97si8ch;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B4BE24000F;
	Tue, 14 Jan 2025 08:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736844729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lSOYxOWz/HeSiOf+L9GoTzcWbnLx2qV1VPaXLCO8PKo=;
	b=F97si8chxjiasNvhSK1GRsLur/2xatzjeuk09nAqzXN0UBz6fIJl0WISrjVSmyVmhRbwfj
	npK5dSIbCgtFB69DE3MxVRCN/7H6cSVWJjgJPgWiWrI1vRV1Ahx1ErOPxmVQd6T6NH4Ofd
	G6+VY7+lX1L5HLdQl3hyS5uagr4Lz0lRVX/cyQp5cV+yZaPSEFNUIwKkkEJBQGVQ5y7r10
	lh5am8dlDWA9YSrALD7K6FbxGxNnsXKC2TLwx7f70NDcywcu4DrxLSxlGrqp+8jun31SJj
	yl20WMo72A5cTXThjxDyG0TRWn2NVhPlLih8JKY4dcNT5aXIfA/F87gjqmxeAQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Jan 2025 09:52:09 +0100
Message-Id: <D71O2LIHDS5O.VUCRVWWZYSFN@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] u-boot: kernel-fitimage: Fix dependency
 loop if UBOOT_SIGN_ENABLE and UBOOT_ENV enabled
Cc: "Adrian Freihofer" <adrian.freihofer@siemens.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>, "Sean Anderson"
 <sean.anderson@seco.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <marex@denx.de>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250114010202.95843-1-marex@denx.de>
In-Reply-To: <20250114010202.95843-1-marex@denx.de>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 08:52:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209784

On Tue Jan 14, 2025 at 2:01 AM CET, Marek Vasut via lists.openembedded.org =
wrote:
> In case both UBOOT_SIGN_ENABLE and UBOOT_ENV are enabled and
> kernel-fitimage.bbclass is in use to generate signed kernel
> fitImage, there is a circular dependency between uboot-sign
> and kernel-fitimage bbclasses . The loop looks like this:
>
> kernel-fitimage.bbclass:
> - do_populate_sysroot depends on do_assemble_fitimage
>   - do_assemble_fitimage depends on virtual/bootloader:do_populate_sysroo=
t
>     - virtual/bootloader:do_populate_sysroot depends on virtual/bootloade=
r:do_install
>       =3D> The virtual/bootloader:do_install installs and the
>          virtual/bootloader:do_populate_sysroot places into
>          sysroot an U-Boot environment script embedded into
>          kernel fitImage during do_assemble_fitimage run .
>
> uboot-sign.bbclass:
> - DEPENDS on KERNEL_PN, which is really virtual/kernel. More accurately
>   - do_deploy depends on do_uboot_assemble_fitimage
>   - do_install depends on do_uboot_assemble_fitimage
>   - do_uboot_assemble_fitimage depends on virtual/kernel:do_populate_sysr=
oot
>     =3D> do_install depends on virtual/kernel:do_populate_sysroot
>
> =3D> virtual/bootloader:do_install depends on virtual/kernel:do_populate_=
sysroot
>    virtual/kernel:do_populate_sysroot depends on virtual/bootloader:do_in=
stall
>
> Attempt to resolve the loop. Pull fitimage_assemble() into separate new b=
bclass
> kernel-fitimage-its.bbclass and split fitimage_assemble() into two functi=
ons,
> fitimage_assemble_its() to generate the fit-image.its and fitimage_assemb=
le_itb()
> to run mkimage on fit-image.its and produce the final fitImage-none fitIm=
age.
>
> Inherit kernel-fitimage-its.bbclass in uboot-sign.bbclass and use these t=
wo
> new functions to generate a dummy signed fitImage which, instead of conta=
ining
> any meaningful blobs as payloads contains a dummy u-boot.dtb as payload f=
or
> every single blob included in the fitImage. The placement of signature {}
> nodes in this dummy signed fitImage exactly matches the final signed kern=
el
> fitImage, which is very important.
>
> The follow up mkimage invocation which inserts public key material into
> u-boot.dtb /signature {} node does not care about the content of the dumm=
y
> signed fitImage blobs, that mkimage invocation only cares about the place=
ment
> of signature {} nodes in that dummy signed fitImage. That mkimage invocat=
ion
> uses the placement of these signature {} nodes to construct u-boot.dtb
> /signature/<key> 'required' property content, which is used by U-Boot
> when authenticating blobs in the fitImage using the public <key> that
> was currently inserted into the u-boot.dtb by mkimage .
>
> Fixes: 5e12dc911d0c ("u-boot: Rework signing to remove interdependencies"=
)
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---

Hi Marek,

I believe this patch is breaking the oe-selftests on the autobuilder,
with the following error:

ERROR: linux-yocto-6.12.9+git-r0 do_assemble_fitimage: Execution of '/srv/p=
okybuild/yocto-worker/oe-selftest-fedora/build/build-st-844261/tmp/work/qem=
ux86_64-poky-linux/linux-yocto/6.12.9+git/temp/run.do_assemble_fitimage.195=
0022' failed with exit code 127
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/oe-selftes=
t-fedora/build/build-st-844261/tmp/work/qemux86_64-poky-linux/linux-yocto/6=
.12.9+git/temp/log.do_assemble_fitimage.1950022
Log data follows:
| DEBUG: Executing shell function do_assemble_fitimage
| /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-844261/tmp/=
work/qemux86_64-poky-linux/linux-yocto/6.12.9+git/temp/run.do_assemble_fiti=
mage.1950022: line 150: fitimage_assemble: command not found
| WARNING: /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-84=
4261/tmp/work/qemux86_64-poky-linux/linux-yocto/6.12.9+git/temp/run.do_asse=
mble_fitimage.1950022:150 exit 127 from 'fitimage_assemble fit-image.its fi=
tImage-none ""'
| WARNING: Backtrace (BB generated script):
| 	#1: do_assemble_fitimage, /srv/pokybuild/yocto-worker/oe-selftest-fedora=
/build/build-st-844261/tmp/work/qemux86_64-poky-linux/linux-yocto/6.12.9+gi=
t/temp/run.do_assemble_fitimage.1950022, line 150
| 	#2: main, /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-=
844261/tmp/work/qemux86_64-poky-linux/linux-yocto/6.12.9+git/temp/run.do_as=
semble_fitimage.1950022, line 157
NOTE: recipe linux-yocto-6.12.9+git-r0: task do_assemble_fitimage: Failed

https://valkyrie.yoctoproject.org/#/builders/48/builds/726/steps/14/logs/st=
dio

Can you have a look at this issue please ?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


