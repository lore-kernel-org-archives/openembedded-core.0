Return-Path: <tom.zanussi@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A9D9060557
	for <Openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 23:25:33 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 04 Nov 2014 15:25:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="411503249"
Received: from unknown (HELO [10.255.13.96]) ([10.255.13.96])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Nov 2014 15:17:04 -0800
Message-ID: <1415143532.24776.2.camel@empanada.home.network>
From: Tom Zanussi <tom.zanussi@intel.com>
To: nitin.a.kamble@intel.com
Date: Tue, 04 Nov 2014 17:25:32 -0600
In-Reply-To: <9c2742ca226e51d4d369e9c761c270c8acbe7b2a.1412112668.git.nitin.a.kamble@intel.com>
References: <cover.1412112668.git.nitin.a.kamble@intel.com>
	<9c2742ca226e51d4d369e9c761c270c8acbe7b2a.1412112668.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: dvhart@linux.intel.com, Openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: Re: [Patch v2 1/1] kernel.bbclass: enable a link for external module building
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
X-List-Received-Date: Tue, 04 Nov 2014 23:25:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-09-30 at 14:40 -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> Even though the kernel-dev package provides the required support for
> building external kernel modules on the target, some commonly used scripts
> and utilities fail as they are not finding the kernel module build support
> files at the desired location.
> 
> Create the /lib/modules/<kernel-version>/build link on target pointing to
> the sources provided by the kernel-dev package, to fix the issue.
> 
> Fixes Bug:
> [YOCTO #2968]
> 

I just updated my dizzy branch and am getting this when building a
kernel with no modules:

Build Configuration:
BB_VERSION        = "1.24.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Fedora-19"
TARGET_SYS        = "i586-poky-linux-uclibc"
MACHINE           = "galileo"
DISTRO            = "poky-micro"
DISTRO_VERSION    = "1.7"
TUNE_FEATURES     = "m32 i586"
TARGET_FPU        = ""
meta              
meta-yocto        
meta-yocto-bsp    = "dizzy0:64643804aea02e3062a7cde7af236771c56311fd"
meta-intel        = "dizzy0:002bef4c2a59e95503a2bb7729e7749cd5a9f65b"
meta-micro-galileo = "dizzy0:f30310dc84dcd96b9e93bb6e5b531631d57d26d6"

NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Function failed: do_install (log file is located at /home/trz/yocto/galileo-work/build/tmp/work/galileo-poky-linux-uclibc/linux-yocto-micro/3.17+gitAUTOINC+fb21bdc896_522a64f489-r4.1.1/temp/log.do_install.25369)
ERROR: Logfile of failure stored in: /home/trz/yocto/galileo-work/build/tmp/work/galileo-poky-linux-uclibc/linux-yocto-micro/3.17+gitAUTOINC+fb21bdc896_522a64f489-r4.1.1/temp/log.do_install.25369
Log data follows:
| DEBUG: Executing python function package_get_auto_pr
| DEBUG: Python function package_get_auto_pr finished
| DEBUG: Executing shell function do_install
| NOTE: no modules to install
| ln: failed to create symbolic link '/home/trz/yocto/galileo-work/build/tmp/work/galileo-poky-linux-uclibc/linux-yocto-micro/3.17+gitAUTOINC+fb21bdc896_522a64f489-r4.1.1/image/lib/modules/3.17.0-rc7-yocto-micro/build': No such file or directory
| WARNING: /home/trz/yocto/galileo-work/build/tmp/work/galileo-poky-linux-uclibc/linux-yocto-micro/3.17+gitAUTOINC+fb21bdc896_522a64f489-r4.1.1/temp/run.do_install.25369:1 exit 1 from
|   ln -sf /usr/src/kernel "/home/trz/yocto/galileo-work/build/tmp/work/galileo-poky-linux-uclibc/linux-yocto-micro/3.17+gitAUTOINC+fb21bdc896_522a64f489-r4.1.1/image/lib/modules/3.17.0-rc7-yocto-micro/build"
| ERROR: Function failed: do_install (log file is located at /home/trz/yocto/galileo-work/build/tmp/work/galileo-poky-linux-uclibc/linux-yocto-micro/3.17+gitAUTOINC+fb21bdc896_522a64f489-r4.1.1/temp/log.do_install.25369)
ERROR: Task 4 (/home/trz/yocto/galileo-work/meta-intel/meta-micro-galileo/recipes-kernel/linux/linux-yocto-micro_3.17.bb, do_install) failed with exit code '1'
NOTE: Tasks Summary: Attempted 387 tasks of which 386 didn't need to be rerun and 1 failed.
No currently running tasks (357 of 395)

Summary: 1 task failed:
  /home/trz/yocto/galileo-work/meta-intel/meta-micro-galileo/recipes-kernel/linux/linux-yocto-micro_3.17.bb, do_install
Summary: There was 1 ERROR message shown, returning a non-zero exit code.


Reverting this patch gets past it.

Tom

> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  meta/classes/kernel.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 78b33ce..5ac4ff4 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -213,6 +213,7 @@ kernel_do_install() {
>  	#
>  	kerneldir=${D}${KERNEL_SRC_PATH}
>  	install -d $kerneldir
> +	ln -sf ${KERNEL_SRC_PATH} "${D}/lib/modules/${KERNEL_VERSION}/build"
>  
>  	#
>  	# Store the kernel version in sysroots for module-base.bbclass
> @@ -346,7 +347,7 @@ PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-mod
>  FILES_${PN} = ""
>  FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
>  FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
> -FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH}"
> +FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
>  FILES_kernel-vmlinux = "/boot/vmlinux*"
>  FILES_kernel-modules = ""
>  RDEPENDS_kernel = "kernel-base"
> -- 
> 1.8.1.4
> 



