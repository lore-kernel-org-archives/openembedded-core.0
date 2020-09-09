Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web10.9125.1599692360561111530
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 15:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 089MxGMn021849
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Wed, 9 Sep 2020 17:59:17 -0500
Subject: Re: [OE-core] [meta-oe][RFC 2/6] arch-armv8-2a.inc: Add Cortex-A55 tunings
To: Jon Mason <jdmason@kudzu.us>, openembedded-core@lists.openembedded.org
References: <20200909224535.27164-1-jon.mason@arm.com>
 <20200909224535.27164-3-jon.mason@arm.com>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Message-ID: <46623150-db60-1948-c669-0abe72fdc122@kernel.crashing.org>
Date: Wed, 9 Sep 2020 17:59:15 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200909224535.27164-3-jon.mason@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I like the direction of this work, but one comment.. (down below)

On 9/9/20 5:45 PM, Jon Mason wrote:
> Migrate the settings in tune-cortexa55.inc to arch-armv8-2a.inc.  This
> will allow for a single file to include all of the tunings of a family
> of processors.  This will reduce the proliferation of unique files per
> processor currently occuring in conf/machine/include/
> 
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  .../machine/include/arm/arch-armv8-2a.inc     | 31 ++++++++++++++-----
>  meta/conf/machine/include/tune-cortexa55.inc  | 12 -------
>  2 files changed, 23 insertions(+), 20 deletions(-)
>  delete mode 100644 meta/conf/machine/include/tune-cortexa55.inc
> 
> diff --git a/meta/conf/machine/include/arm/arch-armv8-2a.inc b/meta/conf/machine/include/arm/arch-armv8-2a.inc
> index b40ebf176e43..38564a17d98b 100644
> --- a/meta/conf/machine/include/arm/arch-armv8-2a.inc
> +++ b/meta/conf/machine/include/arm/arch-armv8-2a.inc
> @@ -1,4 +1,19 @@
> -DEFAULTTUNE ?= "armv8-2a"
> +#
> +# Tune Settings for Cortex-A55
> +#
> +TUNEVALID[cortexa55] = "Enable Cortex-A55 specific processor optimizations"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa55', ' -mcpu=cortex-a55', '', d)}"
> +
> +# Little Endian base configs
> +AVAILTUNES                                         += "cortexa55"
> +ARMPKGARCH_tune-cortexa55                           = "cortexa55"
> +TUNE_FEATURES_tune-cortexa55                        = "aarch64 cortexa55 crypto"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa55                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa55"
> +
> +#
> +# Defaults for ARMv8-a
> +#
> +DEFAULTTUNE                                        ?= "armv8-2a"
>  
>  TUNEVALID[armv8-2a] = "Enable instructions for ARMv8-a"
>  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', ' -march=armv8.2-a', '', d)}"
> @@ -8,10 +23,10 @@ MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', 'armv8-2a
>  require conf/machine/include/arm/arch-armv8a.inc
>  
>  # Little Endian base configs
> -AVAILTUNES += "armv8-2a armv8-2a-crypto"
> -ARMPKGARCH_tune-armv8-2a                    ?= "armv8-2a"
> -ARMPKGARCH_tune-armv8-2a-crypto             ?= "armv8-2a"
> -TUNE_FEATURES_tune-armv8-2a                  = "aarch64 armv8-2a"
> -TUNE_FEATURES_tune-armv8-2a-crypto           = "${TUNE_FEATURES_tune-armv8-2a} crypto"
> -PACKAGE_EXTRA_ARCHS_tune-armv8-2a            = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8-2a"
> -PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a} armv8-2a-crypto"
> +AVAILTUNES                                         += "armv8-2a armv8-2a-crypto"
> +ARMPKGARCH_tune-armv8-2a                           ?= "armv8-2a"
> +ARMPKGARCH_tune-armv8-2a-crypto                    ?= "armv8-2a"
> +TUNE_FEATURES_tune-armv8-2a                         = "aarch64 armv8-2a"
> +TUNE_FEATURES_tune-armv8-2a-crypto                  = "${TUNE_FEATURES_tune-armv8-2a} crypto"
> +PACKAGE_EXTRA_ARCHS_tune-armv8-2a                   = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8-2a"
> +PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto            = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a} armv8-2a-crypto"

It may make sense, instead of deleting it, to have just the 'require
conf/machine/include/arm/arch-armv8-2a.inc' file for transition.  (If a
transition period is NOT required or desired, then this isn't necessary!)

Tricky part is how to notify someone they're in the midst of the transition
period, and using the deprecated behavior.

(In past work, I've had a class that looked for a variable to exist, if it did
it printed the contents as warning messages to the console after parsing.  I'd
love to see something like this as standard behavior for future cases like this.)

> diff --git a/meta/conf/machine/include/tune-cortexa55.inc b/meta/conf/machine/include/tune-cortexa55.inc
> deleted file mode 100644
> index 099b6d72851a..000000000000
> --- a/meta/conf/machine/include/tune-cortexa55.inc
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -DEFAULTTUNE ?= "cortexa55"
> -
> -TUNEVALID[cortexa55] = "Enable Cortex-A55 specific processor optimizations"
> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa55', ' -mcpu=cortex-a55', '', d)}"
> -
> -require conf/machine/include/arm/arch-armv8-2a.inc
> -
> -# Little Endian base configs
> -AVAILTUNES += "cortexa55"
> -ARMPKGARCH_tune-cortexa55             = "cortexa55"
> -TUNE_FEATURES_tune-cortexa55          = "aarch64 cortexa55 crypto"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa55    = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa55"
> 
> 
> 
> 
