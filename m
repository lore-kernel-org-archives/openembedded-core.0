Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SmqG9-0004vV-Jn
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 19:54:33 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Jul 2012 10:43:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="167453993"
Received: from unknown (HELO [10.255.12.176]) ([10.255.12.176])
	by orsmga002.jf.intel.com with ESMTP; 05 Jul 2012 10:43:10 -0700
Message-ID: <4FF5D22E.3090405@linux.intel.com>
Date: Thu, 05 Jul 2012 10:43:10 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <alpine.DEB.2.02.1207030503530.28720@oneiric>
In-Reply-To: <alpine.DEB.2.02.1207030503530.28720@oneiric>
Subject: Re: pcmcia-cs: Remove references to long-deprecated pcmcia-cs.
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
X-List-Received-Date: Thu, 05 Jul 2012 17:54:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/03/2012 02:09 AM, Robert P. J. Day wrote:
>
> pcmciautils is the appropriate PCMCIA package these days.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
>    the only reference left to pcmcia-cs is this acceptable historical
> reference:
>
> $ grep -r pcmcia-cs *
> meta/recipes-core/udev/udev/network.sh:# Code taken from pcmcia-cs:/etc/pcmcia/network
> $
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index f6d6f7d..005f7bc 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -690,7 +690,7 @@ DL_DIR ?= "${TOPDIR}/downloads"
>   SSTATE_DIR ?= "${TOPDIR}/sstate-cache"
>   IMAGE_FSTYPES ?= "tar.gz"
>   INITRAMFS_FSTYPES ?= "cpio.gz"
> -PCMCIA_MANAGER ?= "pcmcia-cs"
> +PCMCIA_MANAGER ?= "pcmciautils"
>   DEFAULT_TASK_PROVIDER ?= "task-base"
>   MACHINE_TASK_PROVIDER ?= "${DEFAULT_TASK_PROVIDER}"
>   IMAGE_ROOTFS_SIZE ?= "65536"
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index 24b307b..e8a1811 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -109,7 +109,7 @@ T[doc]       = "Temporary directory within the WORKDIR."
>   GROUP_locale[doc] = "Locale generation of the GNU libc implementation"
>   ENABLE_BINARY_LOCALE_GENERATION[doc] = "Enable the use of qemu to generate locale information during build time on the host instead of runtime on the target. If you have trouble with qemu-native you should make this an empty var. @group locale"
>
> -PCMCIA_MANAGER[doc] = "Specify which package(s) to install to handle PCMCIA slots (usually pcmcia-cs or pcmciautils)."
> +PCMCIA_MANAGER[doc] = "Specify which package(s) to install to handle PCMCIA slots (currently, pcmciautils)."
>
>   SYSVINIT_ENABLED_GETTYS[doc] = "Specify which VTs should be running a getty, the default is 1"
>
> diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils.inc b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
> index c0c1d0c..fa35daf 100644
> --- a/meta/recipes-bsp/pcmciautils/pcmciautils.inc
> +++ b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>
>   DEPENDS = "sysfsutils flex-native"
>   RDEPENDS_${PN} = "udev module-init-tools"
> -RCONFLICTS_${PN} += "pcmcia-cs"
>
>   SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/pcmcia/pcmciautils-${PV}.tar.bz2"
>
> diff --git a/meta/recipes-core/udev/udev/network.sh b/meta/recipes-core/udev/udev/network.sh
> index 5016328..bccd422 100644
> --- a/meta/recipes-core/udev/udev/network.sh
> +++ b/meta/recipes-core/udev/udev/network.sh
> @@ -1,8 +1,5 @@
>   #!/bin/sh
>
> -# Do not run when pcmcia-cs is installed
> -test -x /sbin/cardctl && exit 0
> -
>   # We get two "add" events for hostap cards due to wifi0
>   echo "$INTERFACE" | grep -q wifi && exit 0
>
>
Merged into OE-Core

Thanks
	Sau!




