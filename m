Return-Path: <mac@mcrowe.com>
Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
	by mail.openembedded.org (Postfix) with ESMTP id 7AC9365C8F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 19:37:32 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id xd75gnXeWx6b6xd76gREoT; Sat, 23 Feb 2019 19:37:32 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=T4GiscCQ c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=CFTnQlWoA9kA:10 a=FQ2ngexZAAAA:8 a=pGLkceISAAAA:8
	a=U4TdsVQjmYHKCgqNpKUA:9 a=CjuIK1q_8ugA:10 a=krBoxCghJ-HPrPY7c7jj:22
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1gxd75-0006G8-AO; Sat, 23 Feb 2019 19:37:31 +0000
Date: Sat, 23 Feb 2019 19:37:31 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Khem Raj <raj.khem@gmail.com>, Randy Li <ayaka@soulik.info>
Message-ID: <20190223193731.hccdkg3vych4y6jr@mcrowe.com>
References: <20190205025727.1937-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190205025727.1937-1-raj.khem@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CMAE-Envelope: MS4wfC4eEeBe3Ari57FUOXi8zZft18MonvIb5SVq4GvDCKaTOdY+hAMygeMyDgIMR4PCt1lYWX3DaQTZuTfPeTdcZq8PYLU8CgL4JZUqcabi0KI/1iZZv8Eh
	O+JV5trLL56S6fVymJ/njNRKvghIZ33r+JI=
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/6] arch-armv8a.inc: add tune include for armv8
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
X-List-Received-Date: Sat, 23 Feb 2019 19:37:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Monday 04 February 2019 at 18:57:22 -0800, Khem Raj wrote:
> From: ayaka <ayaka@soulik.info>
> 
> There are some addtional instructions apart from bare armv8,
> also there is armv8.1, armv8.2.
> 
> Most the processor would support crc, except X-gene 1.
> 
> Signed-off-by: Randy Li <ayaka@soulik.info>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/machine/include/arm/arch-armv8.inc  |  1 -
>  meta/conf/machine/include/arm/arch-armv8a.inc | 28 +++++++++++++++++++
>  2 files changed, 28 insertions(+), 1 deletion(-)
>  delete mode 100644 meta/conf/machine/include/arm/arch-armv8.inc
>  create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc
> 
> diff --git a/meta/conf/machine/include/arm/arch-armv8.inc b/meta/conf/machine/include/arm/arch-armv8.inc
> deleted file mode 100644
> index 5e832fae6d..0000000000
> --- a/meta/conf/machine/include/arm/arch-armv8.inc
> +++ /dev/null
> @@ -1 +0,0 @@
> -require conf/machine/include/arm/arch-arm64.inc
> diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/machine/include/arm/arch-armv8a.inc
> new file mode 100644
> index 0000000000..323d0d7f0f
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/arch-armv8a.inc
> @@ -0,0 +1,28 @@
> +DEFAULTTUNE ?= "armv8a-crc"
> +
> +TUNEVALID[armv8a] = "Enable instructions for ARMv8-a"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', ' -march=armv8-a', '', d)}"
> +TUNEVALID[simd] = "Enable instructions for ARMv8-a Advanced SIMD and floating-point"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'simd', '+simd', '', d)}"
> +TUNEVALID[crc] = "Enable instructions for ARMv8-a Cyclic Redundancy Check (CRC)"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'crc', '+crc', '', d)}"
> +TUNEVALID[crypto] = "Enable instructions for ARMv8-a cryptographic"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+crypto', '', d)}"
> +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', 'armv8a:', '' ,d)}"
> +
> +require conf/machine/include/arm/arch-arm64.inc
> +
> +# Little Endian base configs
> +AVAILTUNES += "armv8a armv8a-crc armv8a-crc-crypto armv8a-crypto"
> +ARMPKGARCH_tune-armv8a                    ?= "armv8a"
> +ARMPKGARCH_tune-armv8a-crc                ?= "armv8a"
> +ARMPKGARCH_tune-armv8a-crypto             ?= "armv8a"
> +ARMPKGARCH_tune-armv8a-crc-crypto         ?= "armv8a"
> +TUNE_FEATURES_tune-armv8a                  = "aarch64 armv8a simd"
> +TUNE_FEATURES_tune-armv8a-crc              = "${TUNE_FEATURES_tune-armv8a} crc"
> +TUNE_FEATURES_tune-armv8a-crypto           = "${TUNE_FEATURES_tune-armv8a} crypto"
> +TUNE_FEATURES_tune-armv8a-crc-crypto       = "${TUNE_FEATURES_tune-armv8a-crc} crypto"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a            = "aarch64 armv8a simd"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc        = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crc"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crypto"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} crypto"
> -- 
> 2.20.1

I believe that this change, along with
6719de403620dded075dc74f2976669d95bffd7a, may have broken multilib for
AArch64. :(

When I enable multilib in local.conf with:

 require conf/multilib.conf
 MULTILIBS = "multilib:lib32"
 DEFAULTTUNE_virtclass-multilib-lib32 = "armv7at-neon"

then both the primary target and lib32- packages end up installing stuff
into /usr/lib (and would presumably conflict, if I got as far as installing
them.)

If I revert 6719de403620dded075dc74f2976669d95bffd7a and
d1db78b0e284e1a1f370e71183ded0cbdc1475db then the primary target packages
end up installing stuff in /usr/lib64 as would be expected.

This appears to be because baselib = "lib" rather than "lib64". That in
turn may be because BASE_LIB_tune-armv8a-crc does not exist.

If I apply this patch:

diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/machine/include/arm/arch-armv8a.inc
index 323d0d7f0f..649deca61b 100644
--- a/meta/conf/machine/include/arm/arch-armv8a.inc
+++ b/meta/conf/machine/include/arm/arch-armv8a.inc
@@ -26,3 +26,4 @@ PACKAGE_EXTRA_ARCHS_tune-armv8a            = "aarch64 armv8a simd"
 PACKAGE_EXTRA_ARCHS_tune-armv8a-crc        = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crc"
 PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crypto"
 PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} crypto"
+BASE_LIB_tune-armv8a-crc = "lib64"

then multilib behaves as it did before. Is this the correct fix?

Thanks.

Mike.

