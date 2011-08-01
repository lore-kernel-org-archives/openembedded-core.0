Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QnwWA-0000iB-Ts
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 19:43:07 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 01 Aug 2011 10:38:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,301,1309762800"; d="scan'208";a="34608528"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by fmsmga002.fm.intel.com with ESMTP; 01 Aug 2011 10:38:45 -0700
Message-ID: <4E36E4A5.3090508@linux.intel.com>
Date: Mon, 01 Aug 2011 10:38:45 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311870676.30326.452.camel@phil-desktop>
In-Reply-To: <1311870676.30326.452.camel@phil-desktop>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH] arch-armv6, arch-armv5-dsp: correct endianness confusion
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
X-List-Received-Date: Mon, 01 Aug 2011 17:43:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/28/2011 09:31 AM, Phil Blundell wrote:
> PACKAGE_EXTRA_ARCHS_tune-armv5eb needs to be defined in terms of
> the non-e with the same endianness, i.e. PACKAGE_EXTRA_ARCHS_tune-armv5b
> not PACKAGE_EXTRA_ARCHS_tune-armv5, otherwise PACKAGE_EXTRA_ARCHS will
> end up containing a semi-random mixture of endiannesses and disaster
> will ensue.  Likewise for the vfp and armv6 variants.
>
> This is all a bit confusing because TUNE_FEATURES is done the opposite
> way around, i.e. TUNE_FEATURES_tune-armv5eb is derived by taking the
> armv5e version and adding bigendian.  But fixing that is probably
> a subject for a separate patch.
>
> Signed-off-by: Phil Blundell<philb@gnu.org>
> ---
>   meta/conf/machine/include/arm/arch-armv5-dsp.inc |    8 ++++----
>   meta/conf/machine/include/arm/arch-armv6.inc     |    4 ++--
>   2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/conf/machine/include/arm/arch-armv5-dsp.inc b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
> index 498a012..9f03a0f 100644
> --- a/meta/conf/machine/include/arm/arch-armv5-dsp.inc
> +++ b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
> @@ -24,8 +24,8 @@ PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5thf-vf
>   AVAILTUNES += "armv5eb armv5teb"
>   TUNE_FEATURES_tune-armv5eb ?= "${TUNE_FEATURES_tune-armv5e} bigendian"
>   TUNE_FEATURES_tune-armv5teb ?= "${TUNE_FEATURES_tune-armv5te} bigendian"
> -PACKAGE_EXTRA_ARCHS_tune-armv5eb = "${PACKAGE_EXTRA_ARCHS_tune-armv5} armv5eb"
> -PACKAGE_EXTRA_ARCHS_tune-armv5teb = "${PACKAGE_EXTRA_ARCHS_tune-armv5t} armv5eb armv5teb"
> +PACKAGE_EXTRA_ARCHS_tune-armv5eb = "${PACKAGE_EXTRA_ARCHS_tune-armv5b} armv5eb"
> +PACKAGE_EXTRA_ARCHS_tune-armv5teb = "${PACKAGE_EXTRA_ARCHS_tune-armv5tb} armv5eb armv5teb"
>
>   # Big Endian + VFP/DSP
>   AVAILTUNES += "armv5eb-vfp armv5teb-vfp armv5ehfb-vfp armv5tehfb-vfp"
> @@ -33,8 +33,8 @@ TUNE_FEATURES_tune-armv5eb-vfp ?= "${TUNE_FEATURES_tune-armv5e-vfp} bigendian"
>   TUNE_FEATURES_tune-armv5teb-vfp ?= "${TUNE_FEATURES_tune-armv5te-vfp} bigendian"
>   TUNE_FEATURES_tune-armv5ehfb-vfp ?= "${TUNE_FEATURES_tune-armv5eb-vfp} callconvention-hard"
>   TUNE_FEATURES_tune-armv5tehfb-vfp ?= "${TUNE_FEATURES_tune-armv5teb-vfp} callconvention-hard"
> -PACKAGE_EXTRA_ARCHS_tune-armv5eb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5-vfp} armv5eb armv5eb-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv5teb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5t-vfp} armv5eb armv5teb armv5eb-vfp armv5teb-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv5eb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5b-vfp} armv5eb armv5eb-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv5teb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5tb-vfp} armv5eb armv5teb armv5eb-vfp armv5teb-vfp"
>   PACKAGE_EXTRA_ARCHS_tune-armv5ehfb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5hfb-vfp} armv5ehfb-vfp"
>   PACKAGE_EXTRA_ARCHS_tune-armv5tehfb-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5thfb-vfp} armv5ehfb-vfp armv5tehfb-vfp"
>
> diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
> index 20924c9..9f2e9ac 100644
> --- a/meta/conf/machine/include/arm/arch-armv6.inc
> +++ b/meta/conf/machine/include/arm/arch-armv6.inc
> @@ -25,8 +25,8 @@ TUNE_FEATURES_tune-armv6b ?= "${TUNE_FEATURES_tune-armv6} bigendian"
>   TUNE_FEATURES_tune-armv6tb ?= "${TUNE_FEATURES_tune-armv6t} bigendian"
>   TUNE_FEATURES_tune-armv6hfb ?= "${TUNE_FEATURES_tune-armv6b} callconvention-hard"
>   TUNE_FEATURES_tune-armv6thfb ?= "${TUNE_FEATURES_tune-armv6tb} callconvention-hard"
> -PACKAGE_EXTRA_ARCHS_tune-armv6b = "${PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp} armv6b-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv6tb = "${PACKAGE_EXTRA_ARCHS_tune-armv5te-vfp} armv6b-vfp armv6tb-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv6b = "${PACKAGE_EXTRA_ARCHS_tune-armv5eb-vfp} armv6b-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv6tb = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb-vfp} armv6b-vfp armv6tb-vfp"
>   PACKAGE_EXTRA_ARCHS_tune-armv6hfb = "${PACKAGE_EXTRA_ARCHS_tune-armv5ehfb-vfp} armv6hfb-vfp"
>   PACKAGE_EXTRA_ARCHS_tune-armv6thfb = "${PACKAGE_EXTRA_ARCHS_tune-armv5tehfb-vfp} armv6hfb-vfp armv6thfb-vfp"
>

Merged into OE-Core

Thanks
	Sau!


