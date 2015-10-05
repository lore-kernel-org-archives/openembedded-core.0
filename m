Return-Path: <rpurdie@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5917B77055
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Oct 2015 10:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t95AG7HU010573; Mon, 5 Oct 2015 11:16:07 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id q7ZgyAiaYSzG; Mon,  5 Oct 2015 11:16:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t95AFm5k010556
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 5 Oct 2015 11:16:06 +0100
Message-ID: <1444033589.5118.11.camel@rpsys.net>
From: Richard Purdie <rpurdie@rpsys.net>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
In-Reply-To: <1c6dbb3997ae1ff49ebe227475b73e3eb072f12b.1443730882.git.alejandro.hernandez@linux.intel.com>
References: <cover.1443730882.git.alejandro.hernandez@linux.intel.com>
	<1c6dbb3997ae1ff49ebe227475b73e3eb072f12b.1443730882.git.alejandro.hernandez@linux.intel.com>
Date: Mon, 05 Oct 2015 09:26:29 +0100
Mime-Version: 1.0
X-Mailer: Evolution 3.12.11-0ubuntu3 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] gma500_gfx: Avoid inserting gma500_gfx module for certain devices
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Oct 2015 10:16:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-10-01 at 20:23 +0000, Alejandro Hernandez wrote:
> The gma500_gfx driver will match certain devices on which it causes incorrect functionality,
> we want to avoid inserting this module, basicallly blacklist it for specific hardware,
> but still allow it to work on other hardware by default; usually when we have an already working system,
> using udev rules would do the job, but since we are building it, it is impossible to blacklist
> a driver when a certain udev rule matches, since rootfs isn't writeable at this point during boot time,
> the solution is to use modprobe install, which runs a certain command instead of inserting a matching module,
> this command needs to insert the module manually afterwards and have a flag --ignore-install
> so it doesnt create an infinite loop executing itself everytime it wants to insert the module,
> busybox's modprobe doesn't provide this functionality, so a small hack had to be used to avoid
> the infite loop instead.
> 
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> ---
>  meta-yocto-bsp/conf/machine/genericx86.conf            |  2 ++
>  .../gma500-gfx-check/gma500-gfx-check.conf             |  2 ++
>  .../gma500-gfx-check/gma500-gfx-check.sh               | 11 +++++++++++
>  .../gma500-gfx-check/gma500-gfx-check_1.0.bb           | 18 ++++++++++++++++++
>  4 files changed, 33 insertions(+)
>  create mode 100644 meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check/gma500-gfx-check.conf
>  create mode 100644 meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check/gma500-gfx-check.sh
>  create mode 100644 meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check_1.0.bb
> 
> diff --git a/meta-yocto-bsp/conf/machine/genericx86.conf b/meta-yocto-bsp/conf/machine/genericx86.conf
> index 2642cab..798b62ec 100644
> --- a/meta-yocto-bsp/conf/machine/genericx86.conf
> +++ b/meta-yocto-bsp/conf/machine/genericx86.conf
> @@ -6,3 +6,5 @@
>  DEFAULTTUNE ?= "core2-32"
>  require conf/machine/include/tune-core2.inc
>  require conf/machine/include/genericx86-common.inc
> +
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "gma500-gfx-check"
> diff --git a/meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check/gma500-gfx-check.conf b/meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check/gma500-gfx-check.conf
> new file mode 100644
> index 0000000..69f109e
> --- /dev/null
> +++ b/meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check/gma500-gfx-check.conf
> @@ -0,0 +1,2 @@
> +# Mimic modprobe's install funcitonality with busybox's modprobe
> +install gma500_gfx lsmod | grep gma || { gma500_gfx_check.sh || modprobe gma500_gfx; }
> diff --git a/meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check/gma500-gfx-check.sh b/meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check/gma500-gfx-check.sh
> new file mode 100644
> index 0000000..0c7b3aa
> --- /dev/null
> +++ b/meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check/gma500-gfx-check.sh
> @@ -0,0 +1,11 @@
> +#!/bin/sh
> +
> +# Check for devices we wish to avoid gma500_gfx for
> +DEVICES="0x8119 0x4108"
> +for DEVICE in $DEVICES; do
> +    if udevadm trigger --subsystem-match=pci --verbose --attr-match=device=$DEVICE | grep "pci" >> /dev/null ; then
> +        echo "Found $DEVICE, avoiding gma500_gfx module" >> /dev/kmsg;
> +        exit 0
> +    fi
> +done
> +exit 1
> diff --git a/meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check_1.0.bb b/meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check_1.0.bb
> new file mode 100644
> index 0000000..c68dd7b
> --- /dev/null
> +++ b/meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check_1.0.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Intel gma500_gfx fix for certain hardware"
> +DESCRIPTION = "Avoid inserting gma500_gfx module for certain hardware devices."
> +LICENSE="GPLv2"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> +
> +SRC_URI = "file://gma500-gfx-check.conf \
> +	file://gma500-gfx-check.sh "
> +
> +do_install(){
> +    install -d ${D}${sysconfdir}/modprobe.d/
> +    install -m 755 ${WORKDIR}/gma500-gfx-check.sh ${D}${sysconfdir}/modprobe.d/gma500-gfx-check.sh
> +    install -m 644 ${WORKDIR}/gma500-gfx-check.conf ${D}${sysconfdir}/modprobe.d/gma500-gfx-check.conf
> +}
> +
> +FILES_${PN}="${sysconfdir}/modprobe.d/gma500-gfx-check.conf \
> +             ${sysconfdir}/modprobe.d/gma500-gfx-check.sh"
> +
> +COMPATIBLE_MACHINE_genericx86 = "genericx86"

This patch needs to go to the poky mailing list as its against
meta-yocto. I think this should also be:

COMPATIBLE_MACHINE = "genericx86"

the other syntax is used to avoid certain issues in recipes like
linux-yocto but there is no default COMPATIBLE_MACHINE here so using
that override syntax isn't correct.

Cheers,

Richard


