Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4A09C60851
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 02:33:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8K2XLQS032573
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 19 Sep 2016 19:33:21 -0700
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 19 Sep 2016 19:33:20 -0700
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
	<openembedded-core@lists.openembedded.org>
References: <1474283673-48449-1-git-send-email-Zubair.Kakakhel@imgtec.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <266d3484-6a50-7e5b-6a1e-9efc2eebb50f@windriver.com>
Date: Tue, 20 Sep 2016 10:33:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1474283673-48449-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Subject: Re: [Patch] arch-mips: Restructure mips64 and add mips64r2
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
X-List-Received-Date: Tue, 20 Sep 2016 02:33:26 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

It seems that this one causes build failures on qemumips64 + multilib:

config:
http://autobuilder.yocto.io:8010/builders/nightly-multilib/builds/64/steps/CreateAutoConf_5/logs/stdio

error:
http://autobuilder.yocto.io:8010/builders/nightly-multilib/builds/64/steps/BuildImages_5/logs/stdio

ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
     Either fix the cause of this error or at your own risk disable the checker 
(see sanity.conf).
     Following is the list of potential problems / advisories:

     Toolchain tunings invalid:
Tuning 'mips32r2' has no defined features, and cannot be used.

// Robert

On 09/19/2016 07:14 PM, Zubair Lutfullah Kakakhel wrote:
> The current file structure felt slightly unsuitable for adding
> MIPS64r2. So I restructured it slightly and added MIPS64r2
> support
>
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> ---
>  meta/conf/machine/include/mips/arch-mips.inc | 60 --------------------
>  meta/conf/machine/include/tune-mips32.inc    | 22 +++++++-
>  meta/conf/machine/include/tune-mips64.inc    | 80 +++++++++++++++++++++++++-
>  meta/conf/machine/include/tune-mips64r2.inc  | 84 ++++++++++++++++++++++++++++
>  4 files changed, 184 insertions(+), 62 deletions(-)
>  create mode 100644 meta/conf/machine/include/tune-mips64r2.inc
>
> diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
> index d3e83d1..6be84be 100644
> --- a/meta/conf/machine/include/mips/arch-mips.inc
> +++ b/meta/conf/machine/include/mips/arch-mips.inc
> @@ -42,64 +42,4 @@ MIPSPKGSFX_ABI = "${@bb.utils.contains('TUNE_FEATURES', 'n32', '-n32', '', d)}"
>  TUNE_ARCH = "mips${MIPSPKGSFX_BYTE}${MIPSPKGSFX_ENDIAN}"
>  TUNE_PKGARCH = "${MIPSPKGSFX_VARIANT_tune-${DEFAULTTUNE}}${MIPSPKGSFX_FPU}${MIPSPKGSFX_ABI}"
>
> -# Base tunes
> -AVAILTUNES += "mips mips64-n32 mips64 mipsel mips64el-n32 mips64el mips-nf mips64-nf-n32 mips64-nf mipsel-nf mips64el-nf-n32 mips64el-nf"
> -TUNE_FEATURES_tune-mips = "o32 bigendian fpu-hard"
> -BASE_LIB_tune-mips = "lib"
> -MIPSPKGSFX_VARIANT_tune-mips = "${TUNE_ARCH}"
> -PACKAGE_EXTRA_ARCHS_tune-mips = "mips"
>
> -TUNE_FEATURES_tune-mips64-n32 = "n32 bigendian fpu-hard"
> -BASE_LIB_tune-mips64-n32 = "lib32"
> -MIPSPKGSFX_VARIANT_tune-mips64-n32 = "${TUNE_ARCH}"
> -PACKAGE_EXTRA_ARCHS_tune-mips64-n32 = "mips64-n32"
> -
> -TUNE_FEATURES_tune-mips64 = "n64 bigendian fpu-hard"
> -BASE_LIB_tune-mips64 = "lib64"
> -MIPSPKGSFX_VARIANT_tune-mips64 = "${TUNE_ARCH}"
> -PACKAGE_EXTRA_ARCHS_tune-mips64 = "mips64"
> -
> -TUNE_FEATURES_tune-mipsel = "o32 fpu-hard"
> -BASE_LIB_tune-mipsel = "lib"
> -MIPSPKGSFX_VARIANT_tune-mipsel = "${TUNE_ARCH}"
> -PACKAGE_EXTRA_ARCHS_tune-mipsel = "mipsel"
> -
> -TUNE_FEATURES_tune-mips64el-n32 = "n32 fpu-hard"
> -BASE_LIB_tune-mips64el-n32 = "lib32"
> -MIPSPKGSFX_VARIANT_tune-mips64el-n32 = "${TUNE_ARCH}"
> -PACKAGE_EXTRA_ARCHS_tune-mips64el-n32 = "mips64el-n32"
> -
> -TUNE_FEATURES_tune-mips64el = "n64 fpu-hard"
> -BASE_LIB_tune-mips64el = "lib64"
> -MIPSPKGSFX_VARIANT_tune-mips64el = "${TUNE_ARCH}"
> -PACKAGE_EXTRA_ARCHS_tune-mips64el = "mips64el"
> -
> -TUNE_FEATURES_tune-mips-nf = "o32 bigendian"
> -BASE_LIB_tune-mips-nf = "lib"
> -MIPSPKGSFX_VARIANT_tune-mips-nf = "${TUNE_ARCH}"
> -PACKAGE_EXTRA_ARCHS_tune-mips-nf = "mips-nf"
> -
> -TUNE_FEATURES_tune-mips64-nf-n32 = "n32 bigendian"
> -BASE_LIB_tune-mips64-nf-n32 = "lib32"
> -MIPSPKGSFX_VARIANT_tune-mips64-nf-n32 = "${TUNE_ARCH}"
> -PACKAGE_EXTRA_ARCHS_tune-mips64-nf-n32 = "mips64-nf-n32"
> -
> -TUNE_FEATURES_tune-mips64-nf = "n64 bigendian"
> -BASE_LIB_tune-mips64-nf = "lib64"
> -MIPSPKGSFX_VARIANT_tune-mips64-nf = "${TUNE_ARCH}"
> -PACKAGE_EXTRA_ARCHS_tune-mips64-nf = "mips64-nf"
> -
> -TUNE_FEATURES_tune-mipsel-nf = "o32"
> -BASE_LIB_tune-mipsel-nf = "lib"
> -MIPSPKGSFX_VARIANT_tune-mipsel-nf = "${TUNE_ARCH}"
> -PACKAGE_EXTRA_ARCHS_tune-mipsel-nf = "mipsel-nf"
> -
> -TUNE_FEATURES_tune-mips64el-nf-n32 = "n32"
> -BASE_LIB_tune-mips64el-nf-n32 = "lib32"
> -MIPSPKGSFX_VARIANT_tune-mips64el-nf-n32 = "${TUNE_ARCH}"
> -PACKAGE_EXTRA_ARCHS_tune-mips64el-nf-n32 = "mips64el-nf-n32"
> -
> -TUNE_FEATURES_tune-mips64el-nf = "n64"
> -BASE_LIB_tune-mips64el-nf = "lib64"
> -MIPSPKGSFX_VARIANT_tune-mips64el-nf = "${TUNE_ARCH}"
> -PACKAGE_EXTRA_ARCHS_tune-mips64el-nf = "mips64el-nf"
> diff --git a/meta/conf/machine/include/tune-mips32.inc b/meta/conf/machine/include/tune-mips32.inc
> index ce0445f..4c3d93f 100644
> --- a/meta/conf/machine/include/tune-mips32.inc
> +++ b/meta/conf/machine/include/tune-mips32.inc
> @@ -6,7 +6,27 @@ TUNEVALID[mips32] = "Enable mips32 specific processor optimizations"
>  TUNECONFLICTS[mips32] = "n64 n32"
>  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mips32', ' -march=mips32', '', d)}"
>
> -AVAILTUNES += "mips32 mips32el mips32-nf mips32el-nf"
> +AVAILTUNES += "mips mipsel mips-nf mipsel-nf mips32 mips32el mips32-nf mips32el-nf"
> +
> +TUNE_FEATURES_tune-mips = "o32 bigendian fpu-hard"
> +BASE_LIB_tune-mips = "lib"
> +MIPSPKGSFX_VARIANT_tune-mips = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips = "mips"
> +
> +TUNE_FEATURES_tune-mipsel = "o32 fpu-hard"
> +BASE_LIB_tune-mipsel = "lib"
> +MIPSPKGSFX_VARIANT_tune-mipsel = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mipsel = "mipsel"
> +
> +TUNE_FEATURES_tune-mips-nf = "o32 bigendian"
> +BASE_LIB_tune-mips-nf = "lib"
> +MIPSPKGSFX_VARIANT_tune-mips-nf = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips-nf = "mips-nf"
> +
> +TUNE_FEATURES_tune-mipsel-nf = "o32"
> +BASE_LIB_tune-mipsel-nf = "lib"
> +MIPSPKGSFX_VARIANT_tune-mipsel-nf = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mipsel-nf = "mipsel-nf"
>
>  TUNE_FEATURES_tune-mips32 = "${TUNE_FEATURES_tune-mips} mips32"
>  MIPSPKGSFX_VARIANT_tune-mips32 = "mips32"
> diff --git a/meta/conf/machine/include/tune-mips64.inc b/meta/conf/machine/include/tune-mips64.inc
> index 9be0e0f..e0c9d2c 100644
> --- a/meta/conf/machine/include/tune-mips64.inc
> +++ b/meta/conf/machine/include/tune-mips64.inc
> @@ -1,3 +1,81 @@
>  DEFAULTTUNE ?= "mips64"
>
> -require conf/machine/include/tune-mips32r2.inc
> +require conf/machine/include/mips/arch-mips.inc
> +
> +# Base tunes
> +AVAILTUNES += "mips64 mips64el"
> +
> +TUNE_FEATURES_tune-mips64 = "n64 bigendian fpu-hard"
> +BASE_LIB_tune-mips64 = "lib64"
> +MIPSPKGSFX_VARIANT_tune-mips64 = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64 = "mips64"
> +
> +TUNE_FEATURES_tune-mips64el = "n64 fpu-hard"
> +BASE_LIB_tune-mips64el = "lib64"
> +MIPSPKGSFX_VARIANT_tune-mips64el = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64el = "mips64el"
> +
> +# MIPS 64 Soft Float
> +AVAILTUNES += "mips64-nf mips64el-nf"
> +
> +TUNE_FEATURES_tune-mips64-nf = "n64 bigendian"
> +BASE_LIB_tune-mips64-nf = "lib64"
> +MIPSPKGSFX_VARIANT_tune-mips64-nf = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64-nf = "mips64-nf"
> +
> +TUNE_FEATURES_tune-mips64el-nf = "n64"
> +BASE_LIB_tune-mips64el-nf = "lib64"
> +MIPSPKGSFX_VARIANT_tune-mips64el-nf = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64el-nf = "mips64el-nf"
> +
> +# MIPS 64 n32
> +AVAILTUNES += "mips64-n32 mips64el-n32"
> +
> +TUNE_FEATURES_tune-mips64-n32 = "n32 bigendian fpu-hard"
> +BASE_LIB_tune-mips64-n32 = "lib32"
> +MIPSPKGSFX_VARIANT_tune-mips64-n32 = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64-n32 = "mips64-n32"
> +
> +TUNE_FEATURES_tune-mips64el-n32 = "n32 fpu-hard"
> +BASE_LIB_tune-mips64el-n32 = "lib32"
> +MIPSPKGSFX_VARIANT_tune-mips64el-n32 = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64el-n32 = "mips64el-n32"
> +
> +# MIPS 64 n32 and Soft Float
> +AVAILTUNES += "mips64-nf-n32 mips64el-nf-n32"
> +
> +TUNE_FEATURES_tune-mips64-nf-n32 = "n32 bigendian"
> +BASE_LIB_tune-mips64-nf-n32 = "lib32"
> +MIPSPKGSFX_VARIANT_tune-mips64-nf-n32 = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64-nf-n32 = "mips64-nf-n32"
> +
> +TUNE_FEATURES_tune-mips64el-nf-n32 = "n32"
> +BASE_LIB_tune-mips64el-nf-n32 = "lib32"
> +MIPSPKGSFX_VARIANT_tune-mips64el-nf-n32 = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64el-nf-n32 = "mips64el-nf-n32"
> +
> +# MIPS 64 o32
> +AVAILTUNES += "mips64-o32 mips64el-o32"
> +
> +TUNE_FEATURES_tune-mips64-o32 = "o32 bigendian fpu-hard"
> +BASE_LIB_tune-mips64-o32 = "lib32"
> +MIPSPKGSFX_VARIANT_tune-mips64-o32 = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64-o32 = "mips64-o32"
> +
> +TUNE_FEATURES_tune-mips64el-o32 = "o32 fpu-hard"
> +BASE_LIB_tune-mips64el-o32 = "lib32"
> +MIPSPKGSFX_VARIANT_tune-mips64el-o32 = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64el-o32 = "mips64el-o32"
> +
> +# MIPS 64 o32 and Soft Float
> +AVAILTUNES += "mips64-nf-o32 mips64el-nf-o32"
> +
> +TUNE_FEATURES_tune-mips64-nf-o32 = "o32 bigendian"
> +BASE_LIB_tune-mips64-nf-o32 = "lib32"
> +MIPSPKGSFX_VARIANT_tune-mips64-nf-o32 = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64-nf-o32 = "mips64-nf-o32"
> +
> +TUNE_FEATURES_tune-mips64el-nf-o32 = "o32"
> +BASE_LIB_tune-mips64el-nf-o32 = "lib32"
> +MIPSPKGSFX_VARIANT_tune-mips64el-nf-o32 = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64el-nf-o32 = "mips64el-nf-o32"
> diff --git a/meta/conf/machine/include/tune-mips64r2.inc b/meta/conf/machine/include/tune-mips64r2.inc
> new file mode 100644
> index 0000000..f64983d
> --- /dev/null
> +++ b/meta/conf/machine/include/tune-mips64r2.inc
> @@ -0,0 +1,84 @@
> +DEFAULTTUNE ?= "mips64r2"
> +
> +require conf/machine/include/tune-mips64.inc
> +
> +TUNEVALID[mips64r2] = "Enable mips64r2 specific processor optimizations"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mips64r2', ' -march=mips64r2', '', d)}"
> +
> +# Base tunes
> +AVAILTUNES += "mips64r2 mips64r2el"
> +
> +TUNE_FEATURES_tune-mips64r2 = "${TUNE_FEATURES_tune-mips64} mips64r2"
> +BASE_LIB_tune-mips64r2 = "lib64"
> +MIPSPKGSFX_VARIANT_tune-mips64r2 = "mips64r2"
> +PACKAGE_EXTRA_ARCHS_tune-mips64r2 = "mips64 mips64r2"
> +
> +TUNE_FEATURES_tune-mips64r2el = "${TUNE_FEATURES_tune-mips64el} mips64r2"
> +BASE_LIB_tune-mips64r2el = "lib64"
> +MIPSPKGSFX_VARIANT_tune-mips64r2el = "mips64r2el"
> +PACKAGE_EXTRA_ARCHS_tune-mips64r2el = "mips64el mips64r2el"
> +
> +# MIPS 64r2 Soft Float
> +AVAILTUNES += "mips64r2-nf mips64r2el-nf"
> +
> +TUNE_FEATURES_tune-mips64r2-nf = "${TUNE_FEATURES_tune-mips64-nf} mips64r2"
> +BASE_LIB_tune-mips64r2-nf = "lib64"
> +MIPSPKGSFX_VARIANT_tune-mips64r2-nf = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64r2-nf = "mips64-nf mips64r2-nf"
> +
> +TUNE_FEATURES_tune-mips64r2el-nf = "${TUNE_FEATURES_tune-mips64el-nf} mips64r2"
> +BASE_LIB_tune-mips64r2el-nf = "lib64"
> +MIPSPKGSFX_VARIANT_tune-mips64r2el-nf = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64r2el-nf = "mips64el-nf mips64r2el-nf"
> +
> +# MIPS 64r2 n32
> +AVAILTUNES += "mips64r2-n32 mips64r2el-n32"
> +
> +TUNE_FEATURES_tune-mips64r2-n32 = "${TUNE_FEATURES_tune-mips64-n32} mips64r2"
> +BASE_LIB_tune-mips64r2-n32 = "lib32"
> +MIPSPKGSFX_VARIANT_tune-mips64r2-n32 = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64r2-n32 = "mips64-n32 mips64r2-n32"
> +
> +TUNE_FEATURES_tune-mips64r2el-n32 = "${TUNE_FEATURES_tune-mips64el-n32} mips64r2"
> +BASE_LIB_tune-mips64r2el-n32 = "lib32"
> +MIPSPKGSFX_VARIANT_tune-mips64r2el-n32 = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64r2el-n32 = "mips64el-n32 mips64r2el-n32"
> +
> +# MIPS 64r2 n32 and Soft Float
> +AVAILTUNES += "mips64r2-nf-n32 mips64r2el-nf-n32"
> +
> +TUNE_FEATURES_tune-mips64r2-nf-n32 = "${TUNE_FEATURES_tune-mips64-nf-n32} mips64r2"
> +BASE_LIB_tune-mips64r2-nf-n32 = "lib32"
> +MIPSPKGSFX_VARIANT_tune-mips64r2-nf-n32 = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64r2-nf-n32 = "mips64-nf-n32 mips64r2-nf-n32"
> +
> +TUNE_FEATURES_tune-mips64r2el-nf-n32 = "${TUNE_FEATURES_tune-mips64el-nf-n32} mips64r2"
> +BASE_LIB_tune-mips64r2el-nf-n32 = "lib32"
> +MIPSPKGSFX_VARIANT_tune-mips64r2el-nf-n32 = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64r2el-nf-n32 = "mips64el-nf-n32 mips64r2el-nf-n32"
> +
> +# MIPS 64r2 o32
> +AVAILTUNES += "mips64r2-o32 mips64r2el-o32"
> +
> +TUNE_FEATURES_tune-mips64r2-o32 = "${TUNE_FEATURES_tune-mips64-o32} mips64r2"
> +BASE_LIB_tune-mips64r2-o32 = "lib32"
> +MIPSPKGSFX_VARIANT_tune-mips64r2-o32 = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64r2-o32 = "mips mips64-o32 mips64r2-o32"
> +
> +TUNE_FEATURES_tune-mips64r2el-o32 = "${TUNE_FEATURES_tune-mips64el-o32} mips64r2"
> +BASE_LIB_tune-mips64r2el-o32 = "lib32"
> +MIPSPKGSFX_VARIANT_tune-mips64r2el-o32 = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64r2el-o32 = "mipsel mips64el-o32 mips64r2el-o32"
> +
> +# MIPS 64r2 o32 and Soft Float
> +AVAILTUNES += "mips64r2-nf-o32 mips64r2el-nf-o32"
> +
> +TUNE_FEATURES_tune-mips64r2-nf-o32 = "${TUNE_FEATURES_tune-mips64-nf-o32} mips64r2"
> +BASE_LIB_tune-mips64r2-nf-o32 = "lib32"
> +MIPSPKGSFX_VARIANT_tune-mips64r2-nf-o32 = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64r2-nf-o32 = "mips-nf mips64r2-nf-o32"
> +
> +TUNE_FEATURES_tune-mips64r2el-nf-o32 = "${TUNE_FEATURES_tune-mips64el-nf-o32} mips64r2"
> +BASE_LIB_tune-mips64r2el-nf-o32 = "lib32"
> +MIPSPKGSFX_VARIANT_tune-mips64r2el-nf-o32 = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64r2el-nf-o32 = "mipsel-nf mips64r2el-nf-o32"
>

