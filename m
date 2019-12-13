Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id D732B7F8B8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 22:05:25 +0000 (UTC)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id xBDM5PHZ013703
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NO) for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 16:05:25 -0600
To: openembedded-core@lists.openembedded.org
References: <20191213220309.3964324-1-JPEWhacker@gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Message-ID: <1370d17b-c688-ef9a-3bdf-bfa4857d4666@kernel.crashing.org>
Date: Fri, 13 Dec 2019 16:05:24 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191213220309.3964324-1-JPEWhacker@gmail.com>
Subject: Re: [PATCH] tune-cortexa72-cortexa53: Add tune
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
X-List-Received-Date: Fri, 13 Dec 2019 22:05:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/13/19 4:03 PM, Joshua Watt wrote:
> Adds a tune for Cortex-A72 Cortex-A53 big.LITTLE SoCs, e.g.  Rockchip
> RK3399
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  .../include/tune-cortexa72-cortexa53.inc       | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta/conf/machine/include/tune-cortexa72-cortexa53.inc
> 
> diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
> new file mode 100644
> index 00000000000..30e49d20769
> --- /dev/null
> +++ b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
> @@ -0,0 +1,18 @@
> +DEFAULTTUNE ?= "cortexa72-cortexa53"
> +require conf/machine/include/arm/arch-armv8a.inc
> +
> +TUNEVALID[cortexa72-cortexa53] = "Enable big.LITTLE Cortex-A72.Cortex-A53 specific processor optimizations"
> +TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
> +
> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "aarch64", " -march=armv8-a", "" ,d)}"
> +
> +MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", "cortexa72-cortexa53:", "" ,d)}"
> +
> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", " -mtune=cortex-a72.cortex-a53", "", d)}"
> +
> +# Little Endian base configs
> +AVAILTUNES += "cortexa72-cortexa53"
> +ARMPKGARCH_tune-cortexa72-cortexa53 = "cortexa72-cortexa53"

I'm wondering if the pkgarch should be shorter.. This really does make package
names very long.  (I don't know offhand if that is an actual problem or not.)

Also a similar tune has been used by NXP and Wind River.  So hopefully we don't
end up with conflicts.

--Mark

> +TUNE_FEATURES_tune-cortexa72-cortexa53 = "${TUNE_FEATURES_tune-aarch64} cortexa72-cortexa53"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53 = "${PACKAGE_EXTRA_ARCHS_tune-aarch64} cortexa72-cortexa53"
> +BASE_LIB_tune-cortexa72-cortexa53 = "lib64"
> 

