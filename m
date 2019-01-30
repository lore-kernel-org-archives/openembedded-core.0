Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0B80A6D4C6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 08:29:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0U8TG0t023752
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 00:29:17 -0800 (PST)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.435.0;
	Wed, 30 Jan 2019 00:29:16 -0800
To: <openembedded-core@lists.openembedded.org>
References: <1548835368-52735-1-git-send-email-changqing.li@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <8105ba49-1123-05b1-f942-5c810e4fe342@windriver.com>
Date: Wed, 30 Jan 2019 16:28:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1548835368-52735-1-git-send-email-changqing.li@windriver.com>
X-Originating-IP: [128.224.162.228]
Subject: Re: [PATCH] gcc-runtime: fix C++ header mapping for n32/x32 tune
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
X-List-Received-Date: Wed, 30 Jan 2019 08:29:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Please ignore this patch. I accidentally sent it 3 times.

On 1/30/19 4:02 PM, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
>      The SDK was unable to find the C++ header pieces correctly since it's
>      using a generic compiler, not one specifically targeting the multilib
>      vendor prefix and default tune.  This adds the right mapping to ensure
>      SDKs work as expected. And fix problem in below configurations:
>
>      multilib configuration:
>      MACHINE="qemumips64"
>      MULTILIBS ?= "multilib:lib32 multilib:libn32"
>      DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
>      DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
>      MULTILIB_GLOBAL_VARIANTS_append = " libn32"
>      require conf/multilib.conf
>
>      ignoring nonexistent directory "<path>/sysroots/mips64-poky-linux/usr/include/c++/8.2.0/mips64-poky-linux/32
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta/recipes-devtools/gcc/gcc-runtime.inc | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index 50ecc81..e0f5c80 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -98,16 +98,16 @@ do_install_append_class-target () {
>   
>   	if [ "${TARGET_OS}" = "linux-gnun32" ]; then
>   		if [ "${MULTILIBS}" != "" ]; then
> -			mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-pokymllib64-linux
> -			ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-pokymllib64-linux/32
> +			mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux
> +			ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux/32
>   		else
>   			ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
>   		fi
>   	fi
>   	if [ "${TARGET_OS}" = "linux-gnux32" ]; then
>   		if [ "${MULTILIBS}" != "" ]; then
> -			mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-poky-linux
> -			ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-poky-linux/x32
> +			mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux
> +			ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux/x32
>   		else
>   			ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
>   		fi

-- 
BRs

Sandy(Li Changqing)


