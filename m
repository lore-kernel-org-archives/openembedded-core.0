Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A59C47DD9
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 21:51:50 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.25926.1708638707116394790
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 13:51:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KWFQEhJ0;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41MLpkuu035364;
	Thu, 22 Feb 2024 15:51:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708638706;
	bh=2MclyHy/VP1bPCa/g4IcM4uDX742PSwdLWo7wtjE+Yw=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=KWFQEhJ0od2P31fZ/wxq6Dm6PaUAnUxD2VLAq916Inl5o0ZH20CNFKtkmV3OzZOHd
	 S49sz1ZfcKrfpmCM5FEiFtd2pZ9vMCPELr2P6lZRvd6ayW2YOYay2IrZ185eZrmg2W
	 jOF21US54pHsYVbDn8ipSlMsKl8TojrsVGDon6Eo=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41MLpk5J047413
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Feb 2024 15:51:46 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Feb 2024 15:51:45 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Feb 2024 15:51:45 -0600
Received: from [10.249.39.53] ([10.249.39.53])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41MLpjLN027594;
	Thu, 22 Feb 2024 15:51:45 -0600
Message-ID: <b0eff6e6-f931-4fff-bcf4-dcff40562fc8@ti.com>
Date: Thu, 22 Feb 2024 15:51:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kirkstone][PATCH 3/3] kernel: make LOCALVERSION consistent
 between recipes
Content-Language: en-US
To: Andreas Helbech Kleist <andreaskleist@gmail.com>,
        <openembedded-core@lists.openembedded.org>
References: <20240222103545.2970387-1-andreaskleist@gmail.com>
 <20240222103545.2970387-4-andreaskleist@gmail.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240222103545.2970387-4-andreaskleist@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 21:51:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196043



On 2/22/2024 4:35 AM, Andreas Helbech Kleist wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> The initial fix for localversion setting in 6.3+ broke older
> recipes and also broke recipes setting localversion in a kernel
> recipe, as make-mod-scripts (and other locations) can trigger
> a regeneration of files and don't have access to the variable.
> 
> Moving the setting of this variable to the global namespace
> doesn't make sense, so we follow the example of the kernel-abiversion
> and save a kernel-localversion to the build artifacts.
> 
> Recipes that may regenerate scripts/dynamic files, must
> depend on the do_shared_workedir of the kernel and use the helper
> function to read the file storing the localversion.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> cherry-picked from master b378eec156998eea55ba61e59103cb34fab0d07c
> 
> Signed-off-by: Andreas Helbech Kleist <andreaskleist@gmail.com>

I'm not sure what is going on with our meta-ti testing.  This set of 
changes causes the same issue we were seeing before.  Plus, now that I'm 
looking into it deeper, I'm seeing a breakage in master related to these 
same patches on there.  Not sure why the changes were not caught in our 
testing on master back when the patches were accepted there...  Clearly 
I need some better checks on the images as part of our QC process...

I need to figure out how to fix the issue on master and see if the same 
change can be applied to these patches on kirkstone.  I'll try and get 
all this done as quickly as I can.



> ---
>   meta/classes/kernel-arch.bbclass                   |  8 --------
>   meta/classes/kernel.bbclass                        | 14 ++++++++++++++
>   meta/classes/kernelsrc.bbclass                     |  1 +
>   meta/classes/linux-kernel-base.bbclass             | 11 +++++++++++
>   meta/classes/module-base.bbclass                   |  1 +
>   .../make-mod-scripts/make-mod-scripts_1.0.bb       |  3 +++
>   6 files changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
> index 0a79dea0af..62c8211621 100644
> --- a/meta/classes/kernel-arch.bbclass
> +++ b/meta/classes/kernel-arch.bbclass
> @@ -65,11 +65,3 @@ KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DE
>   KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
>   KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
>   TOOLCHAIN ?= "gcc"
> -
> -# 6.3+ requires the variable LOCALVERSION to be set to not get a "+" in
> -# the local version. Having it empty means nothing will be added, and any
> -# value will be appended to the local kernel version. This replaces the
> -# use of .scmversion file for setting a localversion without using
> -# the CONFIG_LOCALVERSION option.
> -KERNEL_LOCALVERSION ??= ""
> -export LOCALVERSION ?= "${KERNEL_LOCALVERSION}"
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 940f1a3cf4..96e41b5192 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -541,6 +541,7 @@ do_shared_workdir () {
>   	#
>   
>   	echo "${KERNEL_VERSION}" > $kerneldir/${KERNEL_PACKAGE_NAME}-abiversion
> +	echo "${KERNEL_LOCALVERSION}" > $kerneldir/${KERNEL_PACKAGE_NAME}-localversion
>   
>   	# Copy files required for module builds
>   	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
> @@ -630,6 +631,19 @@ python check_oldest_kernel() {
>   check_oldest_kernel[vardepsexclude] += "OLDEST_KERNEL KERNEL_VERSION"
>   do_configure[prefuncs] += "check_oldest_kernel"
>   
> +KERNEL_LOCALVERSION ??= ""
> +
> +# 6.3+ requires the variable LOCALVERSION to be set to not get a "+" in
> +# the local version. Having it empty means nothing will be added, and any
> +# value will be appended to the local kernel version. This replaces the
> +# use of .scmversion file for setting a localversion without using
> +# the CONFIG_LOCALVERSION option.
> +#
> +# Note: This class saves the value of localversion to a file
> +# so other recipes like make-mod-scripts can restore it via the
> +# helper function get_kernellocalversion_file
> +export LOCALVERSION="${KERNEL_LOCALVERSION}"
> +
>   kernel_do_configure() {
>   	# fixes extra + in /lib/modules/2.6.37+
>   	# $ scripts/setlocalversion . => +
> diff --git a/meta/classes/kernelsrc.bbclass b/meta/classes/kernelsrc.bbclass
> index a951ba3325..a79bf18b09 100644
> --- a/meta/classes/kernelsrc.bbclass
> +++ b/meta/classes/kernelsrc.bbclass
> @@ -5,6 +5,7 @@ do_patch[depends] += "virtual/kernel:do_shared_workdir"
>   do_patch[noexec] = "1"
>   do_package[depends] += "virtual/kernel:do_populate_sysroot"
>   KERNEL_VERSION = "${@get_kernelversion_file("${STAGING_KERNEL_BUILDDIR}")}"
> +LOCAL_VERSION = "${@get_kernellocalversion_file("${STAGING_KERNEL_BUILDDIR}")}"
>   
>   inherit linux-kernel-base
>   
> diff --git a/meta/classes/linux-kernel-base.bbclass b/meta/classes/linux-kernel-base.bbclass
> index 73a6fe36d9..0e2a4a4abe 100644
> --- a/meta/classes/linux-kernel-base.bbclass
> +++ b/meta/classes/linux-kernel-base.bbclass
> @@ -33,6 +33,17 @@ def get_kernelversion_file(p):
>       except IOError:
>           return None
>   
> +def get_kernellocalversion_file(p):
> +    fn = p + '/kernel-localversion'
> +
> +    try:
> +        with open(fn, 'r') as f:
> +            return f.readlines()[0].strip()
> +    except IOError:
> +        return ""
> +
> +    return ""
> +
>   def linux_module_packages(s, d):
>       suffix = ""
>       return " ".join(map(lambda s: "kernel-module-%s%s" % (s.lower().replace('_', '-').replace('@', '+'), suffix), s.split()))
> diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
> index 27bd69ff33..5b2fde8144 100644
> --- a/meta/classes/module-base.bbclass
> +++ b/meta/classes/module-base.bbclass
> @@ -14,6 +14,7 @@ export CROSS_COMPILE = "${TARGET_PREFIX}"
>   export KBUILD_OUTPUT = "${STAGING_KERNEL_BUILDDIR}"
>   
>   export KERNEL_VERSION = "${@oe.utils.read_file('${STAGING_KERNEL_BUILDDIR}/kernel-abiversion')}"
> +export LOCALVERSION = "${@oe.utils.read_file('${STAGING_KERNEL_BUILDDIR}/kernel-localversion')}"
>   KERNEL_OBJECT_SUFFIX = ".ko"
>   
>   # kernel modules are generally machine specific
> diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> index f6f47cfff5..8727d003f9 100644
> --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> @@ -21,6 +21,9 @@ DEPENDS += "gmp-native"
>   EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
>   EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}" CROSS_COMPILE=${TARGET_PREFIX}"
>   
> +KERNEL_LOCALVERSION = "${@get_kernellocalversion_file("${STAGING_KERNEL_BUILDDIR}")}"
> +export LOCALVERSION="${KERNEL_LOCALVERSION}"
> +
>   # Build some host tools under work-shared.  CC, LD, and AR are probably
>   # not used, but this is the historical way of invoking "make scripts".
>   #

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

