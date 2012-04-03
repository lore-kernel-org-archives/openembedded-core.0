Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFCjq-0005kD-F6
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 01:02:10 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Apr 2012 15:52:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="126759961"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by azsmga001.ch.intel.com with ESMTP; 03 Apr 2012 15:52:59 -0700
Message-ID: <4F7B7F4B.20503@linux.intel.com>
Date: Tue, 03 Apr 2012 15:52:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1332898665-13590-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1332898665-13590-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH V2] tune/armv7: Delete
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
X-List-Received-Date: Tue, 03 Apr 2012 23:02:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/27/2012 06:37 PM, Khem Raj wrote:
> armv7 is least common denominator of armv7-a
> armv7-m and armv7-r and armv7-m does not support
> ARM instructions but only thumb2 instruction set
> which means armv7 when chosen will complain if
> code is compiled in arm mode which is default
> in OE if not specified other wise
>
> if we chose this tuning errors like below pop up
>
> error: target CPU does not support ARM mode
>
> This tuning seems theoretical and base tune
> for armv7 would be one of armv7-a,  armv7-m or
> armv7-r
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   meta/conf/machine/include/arm/arch-armv7.inc  |   56 -------------------------
>   meta/conf/machine/include/arm/arch-armv7a.inc |    3 +-
>   meta/conf/machine/include/tune-armv7.inc      |    2 -
>   3 files changed, 2 insertions(+), 59 deletions(-)
>   delete mode 100644 meta/conf/machine/include/arm/arch-armv7.inc
>   delete mode 100644 meta/conf/machine/include/tune-armv7.inc
>
> diff --git a/meta/conf/machine/include/arm/arch-armv7.inc b/meta/conf/machine/include/arm/arch-armv7.inc
> deleted file mode 100644
> index 33d9f0d..0000000
> --- a/meta/conf/machine/include/arm/arch-armv7.inc
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -DEFAULTTUNE ?= "armv7"
> -
> -ARMPKGARCH ?= "armv7"
> -
> -TUNEVALID[armv7] = "Enable instructions for ARMv7"
> -TUNE_CONFLICTS[armv7] = "armv4 armv5 armv6"
> -TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7", "-march=armv7", "", d)}"
> -MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv7", ":armv7", "" ,d)}"
> -
> -require conf/machine/include/arm/arch-armv6.inc
> -require conf/machine/include/arm/feature-arm-neon.inc
> -
> -# Little Endian base configs
> -AVAILTUNES += "armv7 armv7t armv7-neon armv7t-neon"
> -TUNE_FEATURES_tune-armv7 ?= "armv7 vfp"
> -TUNE_FEATURES_tune-armv7t ?= "armv7 vfp thumb"
> -TUNE_FEATURES_tune-armv7-neon ?= "armv7 vfp neon"
> -TUNE_FEATURES_tune-armv7t-neon ?= "armv7 vfp neon thumb"
> -PACKAGE_EXTRA_ARCHS_tune-armv7 = "${PACKAGE_EXTRA_ARCHS_tune-armv6} armv7-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv7t = "${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7-vfp armv7t2-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv7-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-armv7t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7-vfp-neon armv7at2-vfp-neon"
> -
> -# VFP Tunes
> -AVAILTUNES += "armv7hf armv7thf armv7hf-neon armv7thf-neon"
> -TUNE_FEATURES_tune-armv7hf ?= "${TUNE_FEATURES_tune-armv7} callconvention-hard"
> -TUNE_FEATURES_tune-armv7thf ?= "${TUNE_FEATURES_tune-armv7t} callconvention-hard"
> -TUNE_FEATURES_tune-armv7hf-neon ?= "${TUNE_FEATURES_tune-armv7-neon} callconvention-hard"
> -TUNE_FEATURES_tune-armv7thf-neon ?= "${TUNE_FEATURES_tune_armv7t-neon} callconvention-hard"
> -PACKAGE_EXTRA_ARCHS_tune-armv7hf = "${PACKAGE_EXTRA_ARCHS_tune-armv6hf} armv7hf-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv7thf = "${PACKAGE_EXTRA_ARCHS_tune-armv6thf} armv7hf-vfp armv7t2hf-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv7hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7hf} armv7hf-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-armv7thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7thf} armv7hf-vfp-neon armv7at2hf-vfp-neon"
> -
> -# Big Endian
> -AVAILTUNES += "armv7b armv7tb armv7b-neon armv7tb-neon"
> -TUNE_FEATURES_tune-armv7b ?= "${TUNE_FEATURES_tune-armv7} bigendian"
> -TUNE_FEATURES_tune-armv7tb ?= "${TUNE_FEATURES_tune-armv7t} bigendian"
> -TUNE_FEATURES_tune-armv7b-neon ?= "${TUNE_FEATURES_tune-armv7-neon} bigendian"
> -TUNE_FEATURES_tune-armv7tb-neon ?= "${TUNE_FEATURES_tune-armv7t-neon} bigendian"
> -PACKAGE_EXTRA_ARCHS_tune-armv7b = "${PACKAGE_EXTRA_ARCHS_tune-armv6} armv7b-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv7tb = "${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7b-vfp armv7t2b-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv7b-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7b-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-armv7tb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7b-vfp-neon armv7at2b-vfp-neon"
> -
> -# Big Endian + VFP
> -AVAILTUNES += "armv7hfb armv7thfb armv7hfb-neon armv7thfb-neon"
> -TUNE_FEATURES_tune-armv7hfb ?= "${TUNE_FEATURES_tune-armv7b} callconvention-hard"
> -TUNE_FEATURES_tune-armv7thfb ?= "${TUNE_FEATURES_tune-armv7tb} callconvention-hard"
> -TUNE_FEATURES_tune-armv7hfb-neon ?= "${TUNE_FEATURES_tune-armv7b-neon} callconvention-hard"
> -TUNE_FEATURES_tune-armv7thfb-neon ?= "${TUNE_FEATURES_tune_armv7tb-neon} callconvention-hard"
> -PACKAGE_EXTRA_ARCHS_tune-armv7hfb = "${PACKAGE_EXTRA_ARCHS_tune-armv6hfb} armv7hfb-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv7thfb = "${PACKAGE_EXTRA_ARCHS_tune-armv6thfb} armv7hfb-vfp armv7t2hfb-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv7hfb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7hfb} armv7hfb-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-armv7thfb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7thfb} armv7hfb-vfp-neon armv7at2hfb-vfp-neon"
> -
> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
> index de39cb5..92640e2 100644
> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
> @@ -7,7 +7,8 @@ TUNE_CONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
>   TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7a", "-march=armv7-a -fno-tree-vectorize", "", d)}"
>   MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv7a", ":armv7a", "" ,d)}"
>
> -require conf/machine/include/arm/arch-armv7.inc
> +require conf/machine/include/arm/arch-armv6.inc
> +require conf/machine/include/arm/feature-arm-neon.inc
>
>   # Little Endian base configs
>   AVAILTUNES += "armv7a armv7at armv7a-neon armv7at-neon"
> diff --git a/meta/conf/machine/include/tune-armv7.inc b/meta/conf/machine/include/tune-armv7.inc
> deleted file mode 100644
> index 664c24b..0000000
> --- a/meta/conf/machine/include/tune-armv7.inc
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require conf/machine/include/arm/arch-armv7.inc
> -

Merged into OE-Core

Thanks
	Sau!


