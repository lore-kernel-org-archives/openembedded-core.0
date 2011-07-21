Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Qjxjm-0004C4-1k
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 20:12:42 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Jul 2011 11:08:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,242,1309762800"; d="scan'208";a="30441257"
Received: from doubt.jf.intel.com (HELO [10.7.199.53]) ([10.7.199.53])
	by orsmga001.jf.intel.com with ESMTP; 21 Jul 2011 11:08:33 -0700
Message-ID: <4E286B3C.4020405@linux.intel.com>
Date: Thu, 21 Jul 2011 11:09:00 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <cover.1311267679.git.bruce.ashfield@windriver.com>
	<6796e1125a6b209fdd4d56e470f915063be67916.1311267679.git.bruce.ashfield@windriver.com>
In-Reply-To: <6796e1125a6b209fdd4d56e470f915063be67916.1311267679.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 1/4] linux-yocto: kernel-3.0 support recipe
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
X-List-Received-Date: Thu, 21 Jul 2011 18:12:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 07/21/2011 10:16 AM, Bruce Ashfield wrote:
> Establish the infrastructure to start more comprehensive linux-3.0
> testing. With this in place, the populated linux-yocto 3.0 can
> optionally be built for supported machines.
> 
> Note: this commit does not change the default for any targets and
> as such, it would need to be explicitly set as the preferred version
> to be built. The staged introduction allows some remaining issues to
> be solved, while making this available. Subsequent commits will be
> done to switch qemu machines ones they have been validated. If the
> default for a machine is not this kernel, consider it best effort.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Acked-by: Darren Hart <dvhart@linux.intel.com>

> ---
>  meta/recipes-kernel/linux/linux-yocto_3.0.bb |   47 ++++++++++++++++++++++++++
>  1 files changed, 47 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto_3.0.bb
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
> new file mode 100644
> index 0000000..342993f
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
> @@ -0,0 +1,47 @@
> +inherit kernel
> +require recipes-kernel/linux/linux-yocto.inc
> +
> +KMACHINE = "yocto/standard/base"
> +KMACHINE_qemux86  = "yocto/standard/common-pc/base"
> +KMACHINE_qemux86-64  = "yocto/standard/common-pc-64/base"
> +KMACHINE_qemuppc  = "yocto/standard/qemu-ppc32"
> +KMACHINE_qemumips = "yocto/standard/mti-malta32-be"
> +KMACHINE_qemuarm  = "yocto/standard/arm-versatile-926ejs"
> +
> +KBRANCH = ${KMACHINE}
> +KMETA = meta
> +
> +LINUX_VERSION ?= "3.0"
> +LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
> +
> +SRCREV_machine_qemuarm = "021129d0ad7dd63cbe68c9a1d369519a9e5e8440"
> +SRCREV_machine_qemumips = "e86282b3085c5310d1c43af66242845ddadd49b6"
> +SRCREV_machine_qemuppc = "f4ce805d0b74f9f32b6455730485120e27a4711e"
> +SRCREV_machine_qemux86 = "3216e7d5c3cada16161481826cdb39c930457587"
> +SRCREV_machine_qemux86-64 = "3216e7d5c3cada16161481826cdb39c930457587"
> +SRCREV_machine = "3216e7d5c3cada16161481826cdb39c930457587"
> +SRCREV_meta = "9010d1cbef2633dac7e559a7705c326b7601dd4c"
> +
> +PR = "r0"
> +PV = "${LINUX_VERSION}+git${SRCPV}"
> +SRCREV_FORMAT = "meta_machine"
> +
> +SRC_URI = "git://git.pokylinux.org/linux-yocto-3.0;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
> +
> +COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
> +
> +# Functionality flags
> +KERNEL_REVISION_CHECKING ?= "t"
> +KERNEL_FEATURES="features/netfilter"
> +KERNEL_FEATURES_append=" features/taskstats"
> +KERNEL_FEATURES_append_qemux86=" cfg/sound"
> +KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
> +
> +YOCTO_KERNEL_META_DATA=t
> +
> +# extra tasks
> +addtask kernel_link_vmlinux after do_compile before do_install
> +addtask validate_branches before do_patch after do_kernel_checkout
> +addtask kernel_configcheck after do_configure before do_compile
> +
> +require linux-tools.inc

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


