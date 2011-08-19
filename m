Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QuI7J-0006T9-OC
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 07:59:41 +0200
Received: by gyg4 with SMTP id 4so1927532gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2011 22:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=02hKbp+bV7z43dAwHVlpR4bjaoK10pQfYtCzllHD3k0=;
	b=RLiBji6u+AxWV3QEu9Ua5EH12f18T8/UmBy3SwlQYg+v4LfXEz/MABJ1K2SRImoeIi
	5iBaYtQJAeoscbYSh4/v21fcqJvr2rSCeVgsE+2YvEH2OYikKTcMBAORw0eXRlbs3nL8
	e+ft9yLYs62AEADP7Vq30y0C6m0gHr58/3s0M=
Received: by 10.236.191.74 with SMTP id f50mr4110007yhn.66.1313733301010;
	Thu, 18 Aug 2011 22:55:01 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id g21sm1375524ibl.7.2011.08.18.22.54.59
	(version=SSLv3 cipher=OTHER); Thu, 18 Aug 2011 22:55:00 -0700 (PDT)
Message-ID: <4E4DFAB0.7080007@gmail.com>
Date: Thu, 18 Aug 2011 22:54:56 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4E4CAE28.8050600@linux.intel.com>
In-Reply-To: <4E4CAE28.8050600@linux.intel.com>
Subject: Re: [PATCH][RFC] cortexa8: use hard floating point
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
X-List-Received-Date: Fri, 19 Aug 2011 05:59:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 8/17/2011 11:16 PM, Darren Hart wrote:
>  From what I could gather, it makes sense to address using mfloat-abi=hard
> for the beagleboard in the cortexa8 tune file. Before I submit this as a pull
> request, I'd appreciate a sanity check from the Beagleboard experts.
>
> Is there any reason the cortexa8 tune file should not be using "hf" by default?
>
> Thanks,
>
> Darren
>
> --------
> Fixes [YOCTO #1203]
>
> mfloat-abi is currently set to soft for beagleboard (cortexa8) and needs to be
> set to hard to take advantage of the floating point hardware.
>
> Append "hf" to each of the cortexa8 TUNE_FEATURES and PACKAGE_EXTRA_ARCHS
> variables. This enables "callconvention-hard" from the included
> arch-armv7a.inc.
>
> Add a missing closing quote to the VFP AVAILTUNES append operation.
>
> Signed-off-by: Darren Hart<dvhart@linux.intel.com>
> CC: Jason Kridner<jkridner@beagleboard.org>
> CC: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/conf/machine/include/arm/arch-armv7a.inc |    2 +-
>   meta/conf/machine/include/tune-cortexa8.inc   |   10 +++++-----
>   2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
> index 704f86b..d508352 100644
> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
> @@ -20,7 +20,7 @@ PACKAGE_EXTRA_ARCHS_tune-armv7at = "${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7a ar
>   PACKAGE_EXTRA_ARCHS_tune-armv7at-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfp-neon armv7at2-vfp-neon"
>
>   # VFP Tunes
> -AVAILTUNES += "armv7hf armv7thf armv7hf-neon armv7thf-neon
> +AVAILTUNES += "armv7hf armv7thf armv7hf-neon armv7thf-neon"
>   TUNE_FEATURES_tune-armv7ahf ?= "${TUNE_FEATURES_tune-armv7a} callconvention-hard"
>   TUNE_FEATURES_tune-armv7athf ?= "${TUNE_FEATURES_tune-armv7at} callconvention-hard"
>   TUNE_FEATURES_tune-armv7ahf-neon ?= "${TUNE_FEATURES_tune-armv7a-neon} callconvention-hard"
> diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
> index 02b560c..e7483b9 100644
> --- a/meta/conf/machine/include/tune-cortexa8.inc
> +++ b/meta/conf/machine/include/tune-cortexa8.inc
> @@ -6,11 +6,11 @@ TUNEVALID[cortexa8] = "Enable Cortex-A8 specific processor optimizations"
>   TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa8", "-mtune=cortex-a8", "", d)}"
>
>   AVAILTUNES += "cortexa8 cortexa8t"
> -TUNE_FEATURES_tune-cortexa8 = "${TUNE_FEATURES_tune-armv7a} cortexa8"
> -TUNE_FEATURES_tune-cortexa8t = "${TUNE_FEATURES_tune-armv7at} cortexa8"
> +TUNE_FEATURES_tune-cortexa8 = "${TUNE_FEATURES_tune-armv7ahf} cortexa8"
> +TUNE_FEATURES_tune-cortexa8t = "${TUNE_FEATURES_tune-armv7athf} cortexa8"
>   TUNE_FEATURES_tune-cortexa8-neon = "${TUNE_FEATURES_tune-cortexa8} neon"
>
> -PACKAGE_EXTRA_ARCHS_tune-cortexa8 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa8t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon}"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8t = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf}"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}"
>

It it could be made possible then you could work towards making hardfp 
to be a multilib option along with softfp remaining the default. So 
people can use certain applications with hardfp which will really 
benefit from hardfp. General applications may not benefit so much from 
hardfp ABI


