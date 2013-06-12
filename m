Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id B3F666A9E5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 16:57:20 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 Jun 2013 09:57:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,853,1363158000"; d="scan'208";a="315962977"
Received: from unknown (HELO [10.255.13.2]) ([10.255.13.2])
	by azsmga001.ch.intel.com with ESMTP; 12 Jun 2013 09:57:20 -0700
Message-ID: <51B8A870.6040900@linux.intel.com>
Date: Wed, 12 Jun 2013 09:57:20 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Andy Voltz <andy.voltz@timesys.com>
References: <1371055081-15301-1-git-send-email-andy.voltz@timesys.com>
In-Reply-To: <1371055081-15301-1-git-send-email-andy.voltz@timesys.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tune-cortexa*.inc: fix tunings for cortex a5, a7, a8, a9, a15 machines.
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
X-List-Received-Date: Wed, 12 Jun 2013 16:57:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2013 09:38 AM, Andy Voltz wrote:
> Using CORTEX_ID variable reference in the tuning overrides did not work.
> This reverts those changes, and adds a tuning file for the cortex-a5.
>
> Revert "tune-cortexa5.inc: Add tune file for cortex-a5"
> Revert "tune-cortexa.inc: create a common include for cortex-a armv7a tuning"
>
Andy, does this patch supersede your -mtune not -mcpu patch?  I seem to 
have some trouble applying this patch.

It might be best to provide a series that includes the reverts with 
appropriate commit messages.

Thanks
	Sau!


> Signed-off-by: Andy Voltz <andy.voltz@timesys.com>
> ---
>   meta/conf/machine/include/arm/README         |    3 ---
>   meta/conf/machine/include/tune-cortexa.inc   |   35 --------------------------
>   meta/conf/machine/include/tune-cortexa15.inc |   35 ++++++++++++++++++++++++--
>   meta/conf/machine/include/tune-cortexa5.inc  |   35 ++++++++++++++++++++++++--
>   meta/conf/machine/include/tune-cortexa7.inc  |   35 ++++++++++++++++++++++++--
>   meta/conf/machine/include/tune-cortexa8.inc  |   35 ++++++++++++++++++++++++--
>   meta/conf/machine/include/tune-cortexa9.inc  |   35 ++++++++++++++++++++++++--
>   7 files changed, 165 insertions(+), 48 deletions(-)
>   delete mode 100644 meta/conf/machine/include/tune-cortexa.inc
>
> diff --git a/meta/conf/machine/include/arm/README b/meta/conf/machine/include/arm/README
> index d8d7b64..a1beb75 100644
> --- a/meta/conf/machine/include/arm/README
> +++ b/meta/conf/machine/include/arm/README
> @@ -38,6 +38,3 @@ the core arch-arm.inc file.
>
>   ARMPKGSFX_FPU - This is the FPU specific suffix.  The suffix indicates
>   specific FPU optimizations.  'vfp' and 'neon' are both defined.
> -
> -CORTEX_ID - This is the cortex processor type, and is used to setup the
> -proper tuning (-mtune=cortex-${CORTEX_ID}) in tune-cortexa.inc.
> diff --git a/meta/conf/machine/include/tune-cortexa.inc b/meta/conf/machine/include/tune-cortexa.inc
> deleted file mode 100644
> index 987e4d9..0000000
> --- a/meta/conf/machine/include/tune-cortexa.inc
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -DEFAULTTUNE ?= "armv7a-neon"
> -
> -require conf/machine/include/arm/arch-armv7a.inc
> -
> -TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortex${CORTEX_ID}", " -mcpu=cortex-${CORTEX_ID}", "", d)}"
> -
> -# Little Endian base configs
> -AVAILTUNES += "cortex${CORTEX_ID} cortex${CORTEX_ID}t cortex${CORTEX_ID}-neon cortex${CORTEX_ID}t-neon"
> -ARMPKGARCH_tune-cortex${CORTEX_ID} = "cortex${CORTEX_ID}"
> -ARMPKGARCH_tune-cortex${CORTEX_ID}t = "cortex${CORTEX_ID}"
> -ARMPKGARCH_tune-cortex${CORTEX_ID}-neon = "cortex${CORTEX_ID}"
> -ARMPKGARCH_tune-cortex${CORTEX_ID}t-neon = "cortex${CORTEX_ID}"
> -TUNE_FEATURES_tune-cortex${CORTEX_ID} = "${TUNE_FEATURES_tune-armv7a} cortex${CORTEX_ID}"
> -TUNE_FEATURES_tune-cortex${CORTEX_ID}t = "${TUNE_FEATURES_tune-armv7at} cortex${CORTEX_ID}"
> -TUNE_FEATURES_tune-cortex${CORTEX_ID}-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortex${CORTEX_ID}"
> -TUNE_FEATURES_tune-cortex${CORTEX_ID}t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortex${CORTEX_ID}"
> -PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID} = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortex${CORTEX_ID}-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortex${CORTEX_ID}-vfp cortex${CORTEX_ID}t2-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortex${CORTEX_ID}-vfp cortex${CORTEX_ID}-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortex${CORTEX_ID}-vfp cortex${CORTEX_ID}-vfp-neon cortex${CORTEX_ID}t2-vfp cortex${CORTEX_ID}t2-vfp-neon"
> -
> -# VFP Tunes
> -AVAILTUNES += "cortex${CORTEX_ID}hf cortex${CORTEX_ID}thf cortex${CORTEX_ID}hf-neon cortex${CORTEX_ID}thf-neon"
> -ARMPKGARCH_tune-cortex${CORTEX_ID}hf = "cortex${CORTEX_ID}"
> -ARMPKGARCH_tune-cortex${CORTEX_ID}thf = "cortex${CORTEX_ID}"
> -ARMPKGARCH_tune-cortex${CORTEX_ID}hf-neon = "cortex${CORTEX_ID}"
> -ARMPKGARCH_tune-cortex${CORTEX_ID}thf-neon = "cortex${CORTEX_ID}"
> -TUNE_FEATURES_tune-cortex${CORTEX_ID}hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortex${CORTEX_ID}"
> -TUNE_FEATURES_tune-cortex${CORTEX_ID}thf ?= "${TUNE_FEATURES_tune-armv7athf} cortex${CORTEX_ID}"
> -TUNE_FEATURES_tune-cortex${CORTEX_ID}hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortex${CORTEX_ID}"
> -TUNE_FEATURES_tune-cortex${CORTEX_ID}thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortex${CORTEX_ID}"
> -PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortex${CORTEX_ID}hf-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortex${CORTEX_ID}hf-vfp cortex${CORTEX_ID}t2hf-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortex${CORTEX_ID}hf-vfp cortex${CORTEX_ID}hf-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortex${CORTEX_ID}hf-vfp cortex${CORTEX_ID}hf-vfp-neon cortex${CORTEX_ID}t2hf-vfp cortex${CORTEX_ID}t2hf-vfp-neon"
> diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
> index c89bacc..5529777 100644
> --- a/meta/conf/machine/include/tune-cortexa15.inc
> +++ b/meta/conf/machine/include/tune-cortexa15.inc
> @@ -1,5 +1,36 @@
> -CORTEX_ID = "a15"
> +DEFAULTTUNE ?= "armv7a-neon"
> +
> +require conf/machine/include/arm/arch-armv7a.inc
>
>   TUNEVALID[cortexa15] = "Enable Cortex-A15 specific processor optimizations"
> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa15", " -mtune=cortex-a15", "", d)}"
> +
> +# Little Endian base configs
> +AVAILTUNES += "cortexa15 cortexa15t cortexa15-neon cortexa15t-neon"
> +ARMPKGARCH_tune-cortexa15 = "cortexa15"
> +ARMPKGARCH_tune-cortexa15t = "cortexa15"
> +ARMPKGARCH_tune-cortexa15-neon = "cortexa15"
> +ARMPKGARCH_tune-cortexa15t-neon = "cortexa15"
> +TUNE_FEATURES_tune-cortexa15 = "${TUNE_FEATURES_tune-armv7a} cortexa15"
> +TUNE_FEATURES_tune-cortexa15t = "${TUNE_FEATURES_tune-armv7at} cortexa15"
> +TUNE_FEATURES_tune-cortexa15-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa15"
> +TUNE_FEATURES_tune-cortexa15t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa15"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa15 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa15-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa15t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa15-vfp cortexa15t2-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa15-vfp cortexa15-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa15-vfp cortexa15-vfp-neon cortexa15t2-vfp cortexa15t2-vfp-neon"
>
> -require conf/machine/include/tune-cortexa.inc
> +# VFP Tunes
> +AVAILTUNES += "cortexa15hf cortexa15thf cortexa15hf-neon cortexa15thf-neon"
> +ARMPKGARCH_tune-cortexa15hf = "cortexa15"
> +ARMPKGARCH_tune-cortexa15thf = "cortexa15"
> +ARMPKGARCH_tune-cortexa15hf-neon = "cortexa15"
> +ARMPKGARCH_tune-cortexa15thf-neon = "cortexa15"
> +TUNE_FEATURES_tune-cortexa15hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa15"
> +TUNE_FEATURES_tune-cortexa15thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa15"
> +TUNE_FEATURES_tune-cortexa15hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa15"
> +TUNE_FEATURES_tune-cortexa15thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa15"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa15hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa15hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa15thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa15hf-vfp cortexa15t2hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa15hf-vfp cortexa15hf-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa15hf-vfp cortexa15hf-vfp-neon cortexa15t2hf-vfp cortexa15t2hf-vfp-neon"
> diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/machine/include/tune-cortexa5.inc
> index 5511c5c..139e65c 100644
> --- a/meta/conf/machine/include/tune-cortexa5.inc
> +++ b/meta/conf/machine/include/tune-cortexa5.inc
> @@ -1,5 +1,36 @@
> -CORTEX_ID = "a5"
> +DEFAULTTUNE ?= "armv7a-neon"
> +
> +require conf/machine/include/arm/arch-armv7a.inc
>
>   TUNEVALID[cortexa5] = "Enable Cortex-A5 specific processor optimizations"
> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa5", " -mtune=cortex-a5", "", d)}"
> +
> +# Little Endian base configs
> +AVAILTUNES += "cortexa5 cortexa5t cortexa5-neon cortexa5t-neon"
> +ARMPKGARCH_tune-cortexa5 = "cortexa5"
> +ARMPKGARCH_tune-cortexa5t = "cortexa5"
> +ARMPKGARCH_tune-cortexa5-neon = "cortexa5"
> +ARMPKGARCH_tune-cortexa5t-neon = "cortexa5"
> +TUNE_FEATURES_tune-cortexa5 = "${TUNE_FEATURES_tune-armv7a} cortexa5"
> +TUNE_FEATURES_tune-cortexa5t = "${TUNE_FEATURES_tune-armv7at} cortexa5"
> +TUNE_FEATURES_tune-cortexa5-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa5"
> +TUNE_FEATURES_tune-cortexa5t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa5"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa5-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa5-vfp cortexa5t2-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa5-vfp cortexa5-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa5-vfp cortexa5-vfp-neon cortexa5t2-vfp cortexa5t2-vfp-neon"
>
> -require conf/machine/include/tune-cortexa.inc
> +# VFP Tunes
> +AVAILTUNES += "cortexa5hf cortexa5thf cortexa5hf-neon cortexa5thf-neon"
> +ARMPKGARCH_tune-cortexa5hf = "cortexa5"
> +ARMPKGARCH_tune-cortexa5thf = "cortexa5"
> +ARMPKGARCH_tune-cortexa5hf-neon = "cortexa5"
> +ARMPKGARCH_tune-cortexa5thf-neon = "cortexa5"
> +TUNE_FEATURES_tune-cortexa5hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa5"
> +TUNE_FEATURES_tune-cortexa5thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa5"
> +TUNE_FEATURES_tune-cortexa5hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa5"
> +TUNE_FEATURES_tune-cortexa5thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa5"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa5hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa5hf-vfp cortexa5t2hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa5hf-vfp cortexa5hf-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa5hf-vfp cortexa5hf-vfp-neon cortexa5t2hf-vfp cortexa5t2hf-vfp-neon"
> diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/machine/include/tune-cortexa7.inc
> index c6bc457..f02f0a2 100644
> --- a/meta/conf/machine/include/tune-cortexa7.inc
> +++ b/meta/conf/machine/include/tune-cortexa7.inc
> @@ -1,5 +1,36 @@
> -CORTEX_ID = "a7"
> +DEFAULTTUNE ?= "armv7a-neon"
> +
> +require conf/machine/include/arm/arch-armv7a.inc
>
>   TUNEVALID[cortexa7] = "Enable Cortex-A7 specific processor optimizations"
> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa7", " -mtune=cortex-a7", "", d)}"
> +
> +# Little Endian base configs
> +AVAILTUNES += "cortexa7 cortexa7t cortexa7-neon cortexa7t-neon"
> +ARMPKGARCH_tune-cortexa7 = "cortexa7"
> +ARMPKGARCH_tune-cortexa7t = "cortexa7"
> +ARMPKGARCH_tune-cortexa7-neon = "cortexa7"
> +ARMPKGARCH_tune-cortexa7t-neon = "cortexa7"
> +TUNE_FEATURES_tune-cortexa7 = "${TUNE_FEATURES_tune-armv7a} cortexa7"
> +TUNE_FEATURES_tune-cortexa7t = "${TUNE_FEATURES_tune-armv7at} cortexa7"
> +TUNE_FEATURES_tune-cortexa7-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa7"
> +TUNE_FEATURES_tune-cortexa7t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa7"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa7 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa7-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa7t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa7-vfp cortexa7t2-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa7-vfp cortexa7-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa7-vfp cortexa7-vfp-neon cortexa7t2-vfp cortexa7t2-vfp-neon"
>
> -require conf/machine/include/tune-cortexa.inc
> +# VFP Tunes
> +AVAILTUNES += "cortexa7hf cortexa7thf cortexa7hf-neon cortexa7thf-neon"
> +ARMPKGARCH_tune-cortexa7hf = "cortexa7"
> +ARMPKGARCH_tune-cortexa7thf = "cortexa7"
> +ARMPKGARCH_tune-cortexa7hf-neon = "cortexa7"
> +ARMPKGARCH_tune-cortexa7thf-neon = "cortexa7"
> +TUNE_FEATURES_tune-cortexa7hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa7"
> +TUNE_FEATURES_tune-cortexa7thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa7"
> +TUNE_FEATURES_tune-cortexa7hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa7"
> +TUNE_FEATURES_tune-cortexa7thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa7"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa7hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa7hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa7thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa7hf-vfp cortexa7t2hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa7hf-vfp cortexa7hf-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa7hf-vfp cortexa7hf-vfp-neon cortexa7t2hf-vfp cortexa7t2hf-vfp-neon"
> diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
> index c1a3325..771537f 100644
> --- a/meta/conf/machine/include/tune-cortexa8.inc
> +++ b/meta/conf/machine/include/tune-cortexa8.inc
> @@ -1,5 +1,36 @@
> -CORTEX_ID = "a8"
> +DEFAULTTUNE ?= "armv7a-neon"
> +
> +require conf/machine/include/arm/arch-armv7a.inc
>
>   TUNEVALID[cortexa8] = "Enable Cortex-A8 specific processor optimizations"
> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa8", " -mtune=cortex-a8", "", d)}"
> +
> +# Little Endian base configs
> +AVAILTUNES += "cortexa8 cortexa8t cortexa8-neon cortexa8t-neon"
> +ARMPKGARCH_tune-cortexa8 = "cortexa8"
> +ARMPKGARCH_tune-cortexa8t = "cortexa8"
> +ARMPKGARCH_tune-cortexa8-neon = "cortexa8"
> +ARMPKGARCH_tune-cortexa8t-neon = "cortexa8"
> +TUNE_FEATURES_tune-cortexa8 = "${TUNE_FEATURES_tune-armv7a} cortexa8"
> +TUNE_FEATURES_tune-cortexa8t = "${TUNE_FEATURES_tune-armv7at} cortexa8"
> +TUNE_FEATURES_tune-cortexa8-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa8"
> +TUNE_FEATURES_tune-cortexa8t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa8"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa8-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa8-vfp cortexa8t2-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa8-vfp cortexa8-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa8-vfp cortexa8-vfp-neon cortexa8t2-vfp cortexa8t2-vfp-neon"
>
> -require conf/machine/include/tune-cortexa.inc
> +# VFP Tunes
> +AVAILTUNES += "cortexa8hf cortexa8thf cortexa8hf-neon cortexa8thf-neon"
> +ARMPKGARCH_tune-cortexa8hf = "cortexa8"
> +ARMPKGARCH_tune-cortexa8thf = "cortexa8"
> +ARMPKGARCH_tune-cortexa8hf-neon = "cortexa8"
> +ARMPKGARCH_tune-cortexa8thf-neon = "cortexa8"
> +TUNE_FEATURES_tune-cortexa8hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa8"
> +TUNE_FEATURES_tune-cortexa8thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa8"
> +TUNE_FEATURES_tune-cortexa8hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa8"
> +TUNE_FEATURES_tune-cortexa8thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa8"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa8hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa8hf-vfp cortexa8t2hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa8hf-vfp cortexa8hf-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa8hf-vfp cortexa8hf-vfp-neon cortexa8t2hf-vfp cortexa8t2hf-vfp-neon"
> diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/tune-cortexa9.inc
> index 9b16761..700394b 100644
> --- a/meta/conf/machine/include/tune-cortexa9.inc
> +++ b/meta/conf/machine/include/tune-cortexa9.inc
> @@ -1,5 +1,36 @@
> -CORTEX_ID = "a9"
> +DEFAULTTUNE ?= "armv7a-neon"
> +
> +require conf/machine/include/arm/arch-armv7a.inc
>
>   TUNEVALID[cortexa9] = "Enable Cortex-A9 specific processor optimizations"
> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa9", " -mtune=cortex-a9", "", d)}"
> +
> +# Little Endian base configs
> +AVAILTUNES += "cortexa9 cortexa9t cortexa9-neon cortexa9t-neon"
> +ARMPKGARCH_tune-cortexa9 = "cortexa9"
> +ARMPKGARCH_tune-cortexa9t = "cortexa9"
> +ARMPKGARCH_tune-cortexa9-neon = "cortexa9"
> +ARMPKGARCH_tune-cortexa9t-neon = "cortexa9"
> +TUNE_FEATURES_tune-cortexa9 = "${TUNE_FEATURES_tune-armv7a} cortexa9"
> +TUNE_FEATURES_tune-cortexa9t = "${TUNE_FEATURES_tune-armv7at} cortexa9"
> +TUNE_FEATURES_tune-cortexa9-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa9"
> +TUNE_FEATURES_tune-cortexa9t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa9"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa9 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa9-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa9t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa9-vfp cortexa9t2-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa9-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa9-vfp cortexa9-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa9t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa9-vfp cortexa9-vfp-neon cortexa9t2-vfp cortexa9t2-vfp-neon"
>
> -require conf/machine/include/tune-cortexa.inc
> +# VFP Tunes
> +AVAILTUNES += "cortexa9hf cortexa9thf cortexa9hf-neon cortexa9thf-neon"
> +ARMPKGARCH_tune-cortexa9hf = "cortexa9"
> +ARMPKGARCH_tune-cortexa9thf = "cortexa9"
> +ARMPKGARCH_tune-cortexa9hf-neon = "cortexa9"
> +ARMPKGARCH_tune-cortexa9thf-neon = "cortexa9"
> +TUNE_FEATURES_tune-cortexa9hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa9"
> +TUNE_FEATURES_tune-cortexa9thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa9"
> +TUNE_FEATURES_tune-cortexa9hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa9"
> +TUNE_FEATURES_tune-cortexa9thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa9"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa9hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa9hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa9thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa9hf-vfp cortexa9t2hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa9hf-vfp cortexa9hf-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa9thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa9hf-vfp cortexa9hf-vfp-neon cortexa9t2hf-vfp cortexa9t2hf-vfp-neon"
>

