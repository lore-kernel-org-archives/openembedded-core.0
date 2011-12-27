Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RfcPc-0008FB-0Q
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Dec 2011 20:10:14 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Dec 2011 11:02:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="91989106"
Received: from unknown (HELO [10.255.12.84]) ([10.255.12.84])
	by orsmga002.jf.intel.com with ESMTP; 27 Dec 2011 11:02:55 -0800
Message-ID: <4EFA165F.1060309@linux.intel.com>
Date: Tue, 27 Dec 2011 11:02:55 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1318534968.3158.2.camel@lenovo.internal.reciva.com>
	<1324505762-30279-1-git-send-email-victor.quicksilver@gmail.com>
In-Reply-To: <1324505762-30279-1-git-send-email-victor.quicksilver@gmail.com>
Cc: philb@gnu.org
Subject: Re: [PATCH v2] conf: machine: includes: add armv6-novfp support
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
X-List-Received-Date: Tue, 27 Dec 2011 19:10:14 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/21/2011 02:16 PM, Víctor Enríquez wrote:
> This work was made by Victor Enriquez and then modified by Denis Carikli who was helped by Mark Hatle comments (who is fray on
> #yocto channel on Freenode).
>
> The changes are for adding support to armv6-novfp, for building binaries for armv6 machines without vfp, for example the htc
> dream.
>
> Signed-off-by: Mark Hatle<mark.hatle@windriver.com>
> Signed-off-by: Denis 'GNUtoo' Carikli<GNUtoo@no-log.org>
> Signed-off-by: Víctor Enríquez<victor.quicksilver@gmail.com>
> ---
>   meta/conf/machine/include/arm/arch-armv6.inc      |   28 +++++++++++++-------
>   meta/conf/machine/include/arm/feature-arm-vfp.inc |    4 ++-
>   2 files changed, 21 insertions(+), 11 deletions(-)
>
> diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
> index da8274e..f9c112e 100644
> --- a/meta/conf/machine/include/arm/arch-armv6.inc
> +++ b/meta/conf/machine/include/arm/arch-armv6.inc
> @@ -10,24 +10,32 @@ MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv6", ":armv6", ""
>   require conf/machine/include/arm/arch-armv5-dsp.inc
>
>   # Little Endian
> -AVAILTUNES += "armv6 armv6t armv6hf armv6thf"
> +AVAILTUNES += "armv6-novfp armv6 armv6t armv6t-novfp armv6hf armv6thf"
> +TUNE_FEATURES_tune-armv6-novfp ?= "armv6"
>   TUNE_FEATURES_tune-armv6 ?= "armv6 vfp"
> +TUNE_FEATURES_tune-armv6t-novfp ?= "armv6 thumb"
>   TUNE_FEATURES_tune-armv6t ?= "armv6 vfp thumb"
>   TUNE_FEATURES_tune-armv6hf ?= "${TUNE_FEATURES_tune-armv6} callconvention-hard"
>   TUNE_FEATURES_tune-armv6thf ?= "${TUNE_FEATURES_tune-armv6t} callconvention-hard"
> -PACKAGE_EXTRA_ARCHS_tune-armv6 = "${PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp} armv6-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv6t = "${PACKAGE_EXTRA_ARCHS_tune-armv5te-vfp} armv6-vfp armv6t-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv6hf = "${PACKAGE_EXTRA_ARCHS_tune-armv5ehf-vfp} armv6hf-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv6thf = "${PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp} armv6hf-vfp armv6thf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv6-novfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5e} armv6-novfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv6 = "${PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp} armv6-novfp armv6"
> +PACKAGE_EXTRA_ARCHS_tune-armv6t-novfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5e} armv6-novfp armv6t-novfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv6t = "${PACKAGE_EXTRA_ARCHS_tune-armv5te-vfp} armv6-novfp armv6t-novfp armv6-vfp armv6t"
I am not sure I fully understand the changes here, so this might be a 
mis-understanding on my part, but should this and the tune-armv6 have 
both -vfp and -novfp in it?

> +PACKAGE_EXTRA_ARCHS_tune-armv6hf = "${PACKAGE_EXTRA_ARCHS_tune-armv5ehf-vfp} armv6hf"
> +PACKAGE_EXTRA_ARCHS_tune-armv6thf = "${PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp} armv6hf-vfp armv6thf"
>
>   # Big Endian
> -AVAILTUNES += "armv6b armv6tb armv6hfb armv6thfb"
> +AVAILTUNES += "armv6b-novfp armv6b armv6tb-novfp armv6tb armv6hfb armv6thfb"
> +TUNE_FEATURES_tune-armv6b-novfp ?= "${TUNE_FEATURES_tune-armv6-novfp} bigendian"
>   TUNE_FEATURES_tune-armv6b ?= "${TUNE_FEATURES_tune-armv6} bigendian"
> +TUNE_FEATURES_tune-armv6tb-novfp ?= "${TUNE_FEATURES_tune-armv6t-novfp} bigendian"
>   TUNE_FEATURES_tune-armv6tb ?= "${TUNE_FEATURES_tune-armv6t} bigendian"
>   TUNE_FEATURES_tune-armv6hfb ?= "${TUNE_FEATURES_tune-armv6b} callconvention-hard"
>   TUNE_FEATURES_tune-armv6thfb ?= "${TUNE_FEATURES_tune-armv6tb} callconvention-hard"
> -PACKAGE_EXTRA_ARCHS_tune-armv6b = "${PACKAGE_EXTRA_ARCHS_tune-armv5eb-vfp} armv6b-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv6tb = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb-vfp} armv6b-vfp armv6tb-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv6hfb = "${PACKAGE_EXTRA_ARCHS_tune-armv5ehfb-vfp} armv6hfb-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv6thfb = "${PACKAGE_EXTRA_ARCHS_tune-armv5tehfb-vfp} armv6hfb-vfp armv6thfb-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv6b-novfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5eb} armv6b-novfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv6b = "${PACKAGE_EXTRA_ARCHS_tune-armv5eb-vfp} armv6b"
Why not like the armv6 above with -novfp (again, maybe my misunderstanding

> +PACKAGE_EXTRA_ARCHS_tune-armv6tb-novfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5eb} armv6b-novfp armv6tb-novfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv6tb = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb-vfp} armv6b-novfp armv6tb-novfp armv6b-vfp armv6tb"
This seems to match armv6t above.

> +PACKAGE_EXTRA_ARCHS_tune-armv6hfb = "${PACKAGE_EXTRA_ARCHS_tune-armv5ehfb-vfp} armv6hfb"
> +PACKAGE_EXTRA_ARCHS_tune-armv6thfb = "${PACKAGE_EXTRA_ARCHS_tune-armv5tehfb-vfp} armv6hfb-vfp armv6thfb"
>
> diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/conf/machine/include/arm/feature-arm-vfp.inc
> index 29a925c..78f453c 100644
> --- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
> @@ -1,5 +1,7 @@
>   TUNEVALID[vfp] = "Enable Vector Floating Point (vfp) unit."
> -ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfp", "-vfp", "" ,d)}"
> +TUNE_ARM_VFP = "${@bb.utils.contains("ARMPKGARCH", "armv6", "", "vfp" ,d)}"
should this be -vfp?

> +TUNE_ARM_NOVFP = "${@bb.utils.contains("ARMPKGARCH", "armv6", "-novfp", "" ,d)}"
> +ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfp", "${TUNE_ARM_VFP}", "${TUNE_ARM_NOVFP}" ,d)}"
>
>   TUNEVALID[callconvention-hard] = "Enable EABI hard float call convention, requires VFP."
>   TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", "-mfloat-abi=hard", "-mfloat-abi=softfp", d), "" ,d)}"


