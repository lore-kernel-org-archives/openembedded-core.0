Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Txky8-0000UB-DL
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 22:01:27 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Jan 2013 12:44:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,516,1355126400"; d="scan'208";a="280755944"
Received: from unknown (HELO envy.home) ([10.255.15.13])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jan 2013 12:44:18 -0800
Message-ID: <50FEFA22.2090008@linux.intel.com>
Date: Tue, 22 Jan 2013 12:44:18 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1358634922.git.raj.khem@gmail.com>
	<613da782b369ba5424b5619b4315ea34e645d53c.1358634922.git.raj.khem@gmail.com>
In-Reply-To: <613da782b369ba5424b5619b4315ea34e645d53c.1358634922.git.raj.khem@gmail.com>
X-Enigmail-Version: 1.5
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jan 2013 21:01:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/19/2013 02:40 PM, Khem Raj wrote:
> kernel compiler is not special and we currently have it so
> we want to pass -march and -mtune options as CFLAGS to kernel
> build so that compiler picks the right subarch flags when
> compiling assembly files in particular. Otherwise defaults
> are chosen which may not be right in many case e.g. when
> compiling kernel for collie machine we should use arch=armv4
> but it uses toolchain/as defaults which is armv5te
> 
> in some case e.g. thumb1 we know that kernel can not be compiled
> in thumb1 mode so we can provide that information e.g. -marm
> option through KERNEL_HOST_CC_ARCH variable as we do now
> 

Makes me nervous... only because I'm not well versed enough across the
architectures to catch some little gotchas. How much testing has this
seen? Which architectures?

--
Darren

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/kernel-arch.bbclass |   13 +++++++++++++
>  meta/classes/kernel.bbclass      |   16 +---------------
>  meta/classes/module-base.bbclass |   16 ----------------
>  3 files changed, 14 insertions(+), 31 deletions(-)
> 
> diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
> index b3b78b6..a51e82b 100644
> --- a/meta/classes/kernel-arch.bbclass
> +++ b/meta/classes/kernel-arch.bbclass
> @@ -43,3 +43,16 @@ def map_uboot_arch(a, d):
>  
>  export UBOOT_ARCH = "${@map_uboot_arch(d.getVar('ARCH', True), d)}"
>  
> +# Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
> +# specific options necessary for building the kernel and modules.
> +TARGET_CC_KERNEL_ARCH ?= ""
> +HOST_CC_KERNEL_ARCH ?= "${TARGET_CC_KERNEL_ARCH}"
> +TARGET_LD_KERNEL_ARCH ?= ""
> +HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
> +TARGET_AR_KERNEL_ARCH ?= ""
> +HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
> +
> +KERNEL_CC = "${CC} ${HOST_CC_KERNEL_ARCH}"
> +KERNEL_LD = "${LD} ${HOST_LD_KERNEL_ARCH}"
> +KERNEL_AR = "${AR} ${HOST_AR_KERNEL_ARCH}"
> +
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index d459569..e2a582b 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -1,7 +1,7 @@
>  inherit linux-kernel-base module_strip
>  
>  PROVIDES += "virtual/kernel"
> -DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX}"
> +DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native"
>  
>  # we include gcc above, we dont need virtual/libc
>  INHIBIT_DEFAULT_DEPS = "1"
> @@ -37,20 +37,6 @@ KERNEL_PRIORITY ?= "${@int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.
>  
>  KERNEL_RELEASE ?= "${KERNEL_VERSION}"
>  
> -KERNEL_CCSUFFIX ?= ""
> -KERNEL_LDSUFFIX ?= ""
> -
> -# Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
> -# specific options necessary for building the kernel and modules.
> -#FIXME: should be this: TARGET_CC_KERNEL_ARCH ?= "${TARGET_CC_ARCH}"
> -TARGET_CC_KERNEL_ARCH ?= ""
> -HOST_CC_KERNEL_ARCH ?= "${TARGET_CC_KERNEL_ARCH}"
> -TARGET_LD_KERNEL_ARCH ?= ""
> -HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
> -
> -KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc${KERNEL_CCSUFFIX} ${HOST_CC_KERNEL_ARCH}${TOOLCHAIN_OPTIONS}"
> -KERNEL_LD = "${HOST_PREFIX}ld${KERNEL_LDSUFFIX} ${HOST_LD_KERNEL_ARCH}${TOOLCHAIN_OPTIONS}"
> -
>  # Where built kernel lies in the kernel tree
>  KERNEL_OUTPUT ?= "arch/${ARCH}/boot/${KERNEL_IMAGETYPE}"
>  KERNEL_IMAGEDEST = "boot"
> diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
> index 210c47c..cfee50a 100644
> --- a/meta/classes/module-base.bbclass
> +++ b/meta/classes/module-base.bbclass
> @@ -7,22 +7,6 @@ export CROSS_COMPILE = "${TARGET_PREFIX}"
>  
>  export KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
>  KERNEL_OBJECT_SUFFIX = ".ko"
> -KERNEL_CCSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-ccsuffix')}"
> -KERNEL_LDSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-ldsuffix')}"
> -KERNEL_ARSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-arsuffix')}"
> -
> -# Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
> -# specific options necessary for building the kernel and modules.
> -TARGET_CC_KERNEL_ARCH ?= ""
> -HOST_CC_KERNEL_ARCH ?= "${TARGET_CC_KERNEL_ARCH}"
> -TARGET_LD_KERNEL_ARCH ?= ""
> -HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
> -TARGET_AR_KERNEL_ARCH ?= ""
> -HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
> -
> -KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc${KERNEL_CCSUFFIX} ${HOST_CC_KERNEL_ARCH}"
> -KERNEL_LD = "${HOST_PREFIX}ld${KERNEL_LDSUFFIX} ${HOST_LD_KERNEL_ARCH}"
> -KERNEL_AR = "${HOST_PREFIX}ar${KERNEL_ARSUFFIX} ${HOST_AR_KERNEL_ARCH}"
>  
>  # kernel modules are generally machine specific
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


