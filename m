Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9F99562133
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 17:31:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6VHVxce009567
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 10:31:59 -0700
Received: from soho-mhatle-m.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 31 Jul 2017 10:31:58 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1501521367-17192-1-git-send-email-akuster808@gmail.com>
	<1501521367-17192-2-git-send-email-akuster808@gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <b07d8080-7ad5-c68e-5c8b-471db09ff515@windriver.com>
Date: Mon, 31 Jul 2017 12:31:58 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501521367-17192-2-git-send-email-akuster808@gmail.com>
Subject: Re: [PATCH 1/2] armv8: update to use armv8-a tune
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
X-List-Received-Date: Mon, 31 Jul 2017 17:31:58 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/31/17 12:16 PM, Armin Kuster wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/conf/machine/include/arm/arch-armv8.inc | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/meta/conf/machine/include/arm/arch-armv8.inc b/meta/conf/machine/include/arm/arch-armv8.inc
> index 5e832fa..dc1ba5e 100644
> --- a/meta/conf/machine/include/arm/arch-armv8.inc
> +++ b/meta/conf/machine/include/arm/arch-armv8.inc
> @@ -1 +1,26 @@
> +DEFAULTTUNE ?= "armv8-a"

do we want the '-a'?  The other arm (7) are of the format armv7a (no '-').

--Mark

> +
> +TUNEVALID[armv8-a] = "Enable instructions for ARMv8-a"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-a', ' -march=armv8-a', '', d)}"
> +
> +TUNEVALID[crypto] = "Enable crypto instructions for ARMv8-a"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+crypto', '', d)}"
> +
> +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-a', 'armv8a:', '' ,d)}"
> +
>  require conf/machine/include/arm/arch-arm64.inc
> +
> +AVAILTUNES += "armv8-a armv8-a-crypto"
> +ARMPKGARCH_tune-armv8-a ?= "armv8-a"
> +
> +# Enable Crypto extension. This also enables Advanced SIMD and floating-point instructions
> +ARMPKGARCH_tune-armv8-a-crypto ?= "armv8-a"
> +
> +TUNE_FEATURES_tune-armv8-a = "aarch64 armv8-a"
> +TUNE_FEATURES_tune-armv8-a-crypto = "${TUNE_FEATURES_tune-armv8-a} crypto"
> +
> +PACKAGE_EXTRA_ARCHS_tune-armv8-a = "aarch64 armv8-a"
> +PACKAGE_EXTRA_ARCHS_tune-armv8-a-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8-a} armv8-a-crypto"
> +
> +BASE_LIB_tune-armv8-a = "${BASE_LIB_tune-aarch64}"
> +BASE_LIB_tune-armv8-a-crypto = "${BASE_LIB_tune-aarch64}"
> 


