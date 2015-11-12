Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 25D2A7720C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 18:27:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tACIQx6w001404
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 12 Nov 2015 10:26:59 -0800
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Thu, 12 Nov 2015 10:26:58 -0800
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	<openembedded-core@lists.openembedded.org>
References: <1447351617-7516-1-git-send-email-alexandre.belloni@free-electrons.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <5644D9F1.2030705@windriver.com>
Date: Thu, 12 Nov 2015 12:26:57 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447351617-7516-1-git-send-email-alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH] tune-cortexa5.inc: Allow tuning for vfpv3d16, vfpv3 and neon-vfpv4
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
X-List-Received-Date: Thu, 12 Nov 2015 18:27:04 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Seems odd to me that the package arch are the same between the generic (assumed
to be the default ARMv7a, which is USUALLY VFPv4-D32 in most cases.)

If we want to limit to v3 and/or D16.  It might make sense for a different
package arch, otherwise there is no way to separate the feeds in a
multiple-machine configuration with different per-target optimizations.

(similarly the -neon versions as well, but that is existing code)

--Mark

On 11/12/15 12:06 PM, Alexandre Belloni wrote:
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  meta/conf/machine/include/tune-cortexa5.inc | 34 +++++++++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/machine/include/tune-cortexa5.inc
> index 139e65c8285d..56ea93e81d5e 100644
> --- a/meta/conf/machine/include/tune-cortexa5.inc
> +++ b/meta/conf/machine/include/tune-cortexa5.inc
> @@ -6,31 +6,61 @@ TUNEVALID[cortexa5] = "Enable Cortex-A5 specific processor optimizations"
>  TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa5", " -mtune=cortex-a5", "", d)}"
>  
>  # Little Endian base configs
> -AVAILTUNES += "cortexa5 cortexa5t cortexa5-neon cortexa5t-neon"
> +AVAILTUNES += "cortexa5 cortexa5t cortexa5-vfpv3d16 cortexa5t-vfpv3d16 cortexa5-vfpv3 cortexa5t-vfpv3 cortexa5-neon cortexa5t-neon cortexa5-neon-vfpv4 cortexa5t-neon-vfpv4"
>  ARMPKGARCH_tune-cortexa5 = "cortexa5"
>  ARMPKGARCH_tune-cortexa5t = "cortexa5"
> +ARMPKGARCH_tune-cortexa5-vfpv3d16 = "cortexa5"
> +ARMPKGARCH_tune-cortexa5t-vfpv3d16 = "cortexa5"
> +ARMPKGARCH_tune-cortexa5-vfpv3 = "cortexa5"
> +ARMPKGARCH_tune-cortexa5t-vfpv3 = "cortexa5"
>  ARMPKGARCH_tune-cortexa5-neon = "cortexa5"
>  ARMPKGARCH_tune-cortexa5t-neon = "cortexa5"
>  TUNE_FEATURES_tune-cortexa5 = "${TUNE_FEATURES_tune-armv7a} cortexa5"
>  TUNE_FEATURES_tune-cortexa5t = "${TUNE_FEATURES_tune-armv7at} cortexa5"
> +TUNE_FEATURES_tune-cortexa5-vfpv3d16 = "${TUNE_FEATURES_tune-armv7a-vfpv3d16} cortexa5"
> +TUNE_FEATURES_tune-cortexa5t-vfpv3d16 = "${TUNE_FEATURES_tune-armv7at-vfpv3d16} cortexa5"
> +TUNE_FEATURES_tune-cortexa5-vfpv3 = "${TUNE_FEATURES_tune-armv7a-vfpv3} cortexa5"
> +TUNE_FEATURES_tune-cortexa5t-vfpv3 = "${TUNE_FEATURES_tune-armv7at-vfpv3} cortexa5"
>  TUNE_FEATURES_tune-cortexa5-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa5"
>  TUNE_FEATURES_tune-cortexa5t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa5"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa5 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa5-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa5t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa5-vfp cortexa5t2-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3d16} cortexa5-vfp cortexa5-vfp-vfpv3d16"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5t-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3d16} cortexa5-vfp cortexa5-vfp-vfpv3d16 cortexa5t2-vfp cortexa5t2-vfp-vfpv3d16"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3} cortexa5-vfp cortexa5-vfp-vfpv3"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5t-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3} cortexa5-vfp cortexa5-vfp-vfpv3 cortexa5t2-vfp cortexa5t2-vfp-vfpv3"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa5-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa5-vfp cortexa5-vfp-neon"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa5t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa5-vfp cortexa5-vfp-neon cortexa5t2-vfp cortexa5t2-vfp-neon"
>  
>  # VFP Tunes
> -AVAILTUNES += "cortexa5hf cortexa5thf cortexa5hf-neon cortexa5thf-neon"
> +AVAILTUNES += "cortexa5hf cortexa5thf cortexa5hf-neon cortexa5thf-neon cortexa5hf-vfpv3d16 cortexa5thf-vfpv3d16 cortexa5hf-vfpv3 cortexa5thf-vfpv3 cortexa5hf-neon-vfpv4 cortexa5thf-neon-vfpv4"
>  ARMPKGARCH_tune-cortexa5hf = "cortexa5"
>  ARMPKGARCH_tune-cortexa5thf = "cortexa5"
> +ARMPKGARCH_tune-cortexa5hf-vfpv3d16 = "cortexa5"
> +ARMPKGARCH_tune-cortexa5thf-vfpv3d16 = "cortexa5"
> +ARMPKGARCH_tune-cortexa5hf-vfpv3 = "cortexa5"
> +ARMPKGARCH_tune-cortexa5thf-vfpv3 = "cortexa5"
>  ARMPKGARCH_tune-cortexa5hf-neon = "cortexa5"
>  ARMPKGARCH_tune-cortexa5thf-neon = "cortexa5"
> +ARMPKGARCH_tune-cortexa5hf-neon-vfpv4 = "cortexa5"
> +ARMPKGARCH_tune-cortexa5thf-neon-vfpv4 = "cortexa5"
>  TUNE_FEATURES_tune-cortexa5hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa5"
>  TUNE_FEATURES_tune-cortexa5thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa5"
> +TUNE_FEATURES_tune-cortexa5hf-vfpv3d16 ?= "${TUNE_FEATURES_tune-armv7ahf-vfpv3d16} cortexa5"
> +TUNE_FEATURES_tune-cortexa5thf-vfpv3d16 ?= "${TUNE_FEATURES_tune-armv7athf-vfpv3d16} cortexa5"
> +TUNE_FEATURES_tune-cortexa5hf-vfpv3 ?= "${TUNE_FEATURES_tune-armv7ahf-vfpv3} cortexa5"
> +TUNE_FEATURES_tune-cortexa5thf-vfpv3 ?= "${TUNE_FEATURES_tune-armv7athf-vfpv3} cortexa5"
>  TUNE_FEATURES_tune-cortexa5hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa5"
>  TUNE_FEATURES_tune-cortexa5thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa5"
> +TUNE_FEATURES_tune-cortexa5hf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7ahf-neon-vfpv4} cortexa5"
> +TUNE_FEATURES_tune-cortexa5thf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7athf-neon-vfpv4} cortexa5"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa5hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa5hf-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa5thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa5hf-vfp cortexa5t2hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3d16} cortexa5hf-vfp cortexa5hf-vfp-vfpv3d16"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5thf-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3d16} cortexa5hf-vfp cortexa5hf-vfp-vfpv3d16 cortexa5t2hf-vfp cortexa5t2hf-vfp-vfpv3d16"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3} cortexa5hf-vfp cortexa5hf-vfp-vfpv3"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5thf-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3} cortexa5hf-vfp cortexa5hf-vfp-vfpv3 cortexa5t2hf-vfp cortexa5t2hf-vfp-vfpv3"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa5hf-vfp cortexa5hf-vfp-neon"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa5thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa5hf-vfp cortexa5hf-vfp-neon cortexa5t2hf-vfp cortexa5t2hf-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4} cortexa5hf-vfp cortexa5hf-vfp-neon cortexa5hf-vfp-vfpv4-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4} cortexa5hf-vfp cortexa5hf-vfp-neon cortexa5t2hf-vfp cortexa5t2hf-vfp-neon cortexa5hf-vfp-vfpv4-neon cortexa5t2hf-vfp-vfpv4-neon"
> 


