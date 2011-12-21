Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RdSOm-0001NT-NX
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 21:04:25 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pBLJvI5a006218
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 11:57:18 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 21 Dec 2011 11:57:18 -0800
Message-ID: <4EF23A1D.1050609@windriver.com>
Date: Wed, 21 Dec 2011 13:57:17 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1318534968.3158.2.camel@lenovo.internal.reciva.com>
	<1324496894-29239-1-git-send-email-victor.quicksilver@gmail.com>
In-Reply-To: <1324496894-29239-1-git-send-email-victor.quicksilver@gmail.com>
Subject: Re: [PATCH] conf: machine: includes: add armv6-novfp support
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
X-List-Received-Date: Wed, 21 Dec 2011 20:04:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/21/11 1:48 PM, vquicksilver wrote:
> This work was made by Victor Enriquez and then modified by
> Denis Carikli who was helped by Mark Hatle comments( who is
> fray on #yocto channel on Freenode ).
>
> The changes are for adding support to armv6-novfp, forbuilding
> binaries for armv6 machines without vfp, for examplethe htcdream.
>
> Signed-off-by: Denis 'GNUtoo' Carikli<GNUtoo@no-log.org>
> Signed-off-by: vquicksilver<victor.quicksilver@gmail.com>
> ---
>   meta/conf/machine/include/arm/arch-armv6.inc      |   31 +++++++++++++--------
>   meta/conf/machine/include/arm/feature-arm-vfp.inc |    4 ++-
>   2 files changed, 22 insertions(+), 13 deletions(-)
>
> diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
> index da8274e..3396c69 100644
> --- a/meta/conf/machine/include/arm/arch-armv6.inc
> +++ b/meta/conf/machine/include/arm/arch-armv6.inc
> @@ -1,33 +1,40 @@
>   DEFAULTTUNE ?= "armv6"
>
> -ARMPKGARCH ?= "armv6"
> +ARMPKGARCH := "armv6"

The ?= is what is needed here.  The ARMPKGARCH needs to be able to be 
overwritten by other config files.  (The order in which arch-armv6 and 
potentially other arm archs are included by a machine matters...)

>   TUNEVALID[armv6] = "Enable instructions for ARMv6"
>   TUNE_CONFLICTS[armv6] = "armv4 armv5"
>   TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv6", "-march=armv6", "", d)}"
> -MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv6", ":armv6", "" ,d)}"

I believe the override is still needed as well.  This allows someone to do armv6 
specific options -- such as: OE_CONFIG_armv6 = "--cpu-config=armv6"

... I think everything else looks good..

--Mark


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
> +PACKAGE_EXTRA_ARCHS_tune-armv6tb-novfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5eb} armv6b-novfp armv6tb-novfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv6tb = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb-vfp} armv6b-novfp armv6tb-novfp armv6b-vfp armv6tb"
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
> +TUNE_ARM_NOVFP = "${@bb.utils.contains("ARMPKGARCH", "armv6", "-novfp", "" ,d)}"
> +ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfp", "${TUNE_ARM_VFP}", "${TUNE_ARM_NOVFP}" ,d)}"
>
>   TUNEVALID[callconvention-hard] = "Enable EABI hard float call convention, requires VFP."
>   TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", "-mfloat-abi=hard", "-mfloat-abi=softfp", d), "" ,d)}"



