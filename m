Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AB9EB600B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 16:22:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8NGMmS1026881
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 23 Sep 2016 09:22:48 -0700
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 23 Sep 2016 09:22:47 -0700
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
	<openembedded-core@lists.openembedded.org>
References: <1474638470-53738-1-git-send-email-Zubair.Kakakhel@imgtec.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <bb1f9130-fd9a-1ef8-fbdd-ae7bd16ec934@windriver.com>
Date: Fri, 23 Sep 2016 11:22:47 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1474638470-53738-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Subject: Re: [Patch v3] arch-mips: Add mips64r2 tunes
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
X-List-Received-Date: Fri, 23 Sep 2016 16:22:52 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Acked, no concerns.

--Mark

On 9/23/16 8:47 AM, Zubair Lutfullah Kakakhel wrote:
> Add MIPS64r2 optimizations
> 
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> 
> ---
> V2 -> V3
> Removed the unnecessary restructuring of the base tunings.
> 
> V1 -> V2
> Fixed a subtle bug in the include files for tune-mips64.inc which
> resulted in a build failure for multi-lib configuration.
> ---
>  meta/conf/machine/include/tune-mips64r2.inc | 84 +++++++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 meta/conf/machine/include/tune-mips64r2.inc
> 
> diff --git a/meta/conf/machine/include/tune-mips64r2.inc b/meta/conf/machine/include/tune-mips64r2.inc
> new file mode 100644
> index 0000000..75d7535
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
> +BASE_LIB_tune-mips64r2-o32 = "lib"
> +MIPSPKGSFX_VARIANT_tune-mips64r2-o32 = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64r2-o32 = "mips mips64-o32 mips64r2-o32"
> +
> +TUNE_FEATURES_tune-mips64r2el-o32 = "${TUNE_FEATURES_tune-mips64el-o32} mips64r2"
> +BASE_LIB_tune-mips64r2el-o32 = "lib"
> +MIPSPKGSFX_VARIANT_tune-mips64r2el-o32 = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64r2el-o32 = "mipsel mips64el-o32 mips64r2el-o32"
> +
> +# MIPS 64r2 o32 and Soft Float
> +AVAILTUNES += "mips64r2-nf-o32 mips64r2el-nf-o32"
> +
> +TUNE_FEATURES_tune-mips64r2-nf-o32 = "${TUNE_FEATURES_tune-mips64-nf-o32} mips64r2"
> +BASE_LIB_tune-mips64r2-nf-o32 = "lib"
> +MIPSPKGSFX_VARIANT_tune-mips64r2-nf-o32 = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64r2-nf-o32 = "mips-nf mips64r2-nf-o32"
> +
> +TUNE_FEATURES_tune-mips64r2el-nf-o32 = "${TUNE_FEATURES_tune-mips64el-nf-o32} mips64r2"
> +BASE_LIB_tune-mips64r2el-nf-o32 = "lib"
> +MIPSPKGSFX_VARIANT_tune-mips64r2el-nf-o32 = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64r2el-nf-o32 = "mipsel-nf mips64r2el-nf-o32"
> 


