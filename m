Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SuTRO-0007fn-Ee
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:09:42 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Jul 2012 11:58:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="177968685"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by orsmga002.jf.intel.com with ESMTP; 26 Jul 2012 11:58:10 -0700
Message-ID: <50119342.1030003@linux.intel.com>
Date: Thu, 26 Jul 2012 11:58:10 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343299888-30141-1-git-send-email-paul.eggleton@linux.intel.com>
In-Reply-To: <1343299888-30141-1-git-send-email-paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH v2] usbutils: avoid dependency on bash
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2012 19:09:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/26/2012 03:51 AM, Paul Eggleton wrote:
> By virtue of having #!/bin/bash, the usb-devices script declared that it
> requires bash, however manual examination, checkbashisms and tests with
> dash and busybox show that it doesn't contain any bashisms, so change
> the script's header and remove the RDEPENDS on bash.
>
> Additionally, update-usbids.sh was manually checked for bashisms, run
> through checkbashisms and tested with busybox (although it did not have
> a bash-specific header).
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>   .../usb-devices-avoid-dependency-on-bash.patch     |   30 ++++++++++++++++++++
>   meta/recipes-bsp/usbutils/usbutils_0.91.bb         |    7 +++--
>   2 files changed, 34 insertions(+), 3 deletions(-)
>   create mode 100644 meta/recipes-bsp/usbutils/usbutils/usb-devices-avoid-dependency-on-bash.patch
>
> diff --git a/meta/recipes-bsp/usbutils/usbutils/usb-devices-avoid-dependency-on-bash.patch b/meta/recipes-bsp/usbutils/usbutils/usb-devices-avoid-dependency-on-bash.patch
> new file mode 100644
> index 0000000..a6b241f
> --- /dev/null
> +++ b/meta/recipes-bsp/usbutils/usbutils/usb-devices-avoid-dependency-on-bash.patch
> @@ -0,0 +1,30 @@
> +From 333d5fbbc03481f1aa222bd68c2609db168ae3e0 Mon Sep 17 00:00:00 2001
> +From: Paul Eggleton <paul.eggleton@linux.intel.com>
> +Date: Thu, 26 Jul 2012 10:37:32 +0100
> +Subject: [PATCH] usb-devices: avoid dependency on bash
> +
> +By virtue of having #!/bin/bash this script declared that it requires
> +bash, however manual examination, checkbashisms and tests with dash
> +and busybox show that it doesn't contain any bashisms, so change the
> +header to avoid the dependency.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> +---
> + usb-devices |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/usb-devices b/usb-devices
> +index b2052e2..14a5358 100755
> +--- a/usb-devices
> ++++ b/usb-devices
> +@@ -1,4 +1,4 @@
> +-#!/bin/bash
> ++#!/bin/sh
> +
> + # Copyright: 2009 Greg Kroah-Hartman <greg@kroah.com>
> + #            2009 Randy Dunlap <rdunlap@xenotime.net>
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-bsp/usbutils/usbutils_0.91.bb b/meta/recipes-bsp/usbutils/usbutils_0.91.bb
> index 490b05a..04d1681 100644
> --- a/meta/recipes-bsp/usbutils/usbutils_0.91.bb
> +++ b/meta/recipes-bsp/usbutils/usbutils_0.91.bb
> @@ -7,9 +7,10 @@ LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>
>   DEPENDS = "libusb zlib"
> -PR = "r3"
> +PR = "r4"
>
> -SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz"
> +SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
> +           file://usb-devices-avoid-dependency-on-bash.patch"
>
>   SRC_URI[md5sum] = "49de2403b40bf3a9863faaa8d3858deb"
>   SRC_URI[sha256sum] = "c122346b0225121bcf159abf804116f826a4a3462c94ce7b8871f7559e6b3a46"
> @@ -26,4 +27,4 @@ PACKAGES += "${PN}-ids"
>   FILES_${PN}-dev += "${datadir}/pkgconfig"
>   FILES_${PN}-ids = "${datadir}/usb*"
>
> -RDEPENDS_${PN} = "${PN}-ids bash"
> +RDEPENDS_${PN} = "${PN}-ids"
>

Merged into OE-Core

Thanks
	Sau!


