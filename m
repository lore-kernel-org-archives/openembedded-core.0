Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3E6F9605C3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Feb 2018 02:39:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w182dwNp009227
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Feb 2018 18:39:59 -0800 (PST)
Received: from [128.224.163.193] (128.224.163.193) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 7 Feb 2018 18:39:52 -0800
To: <openembedded-core@lists.openembedded.org>
References: <1517813643-16075-1-git-send-email-zhe.he@windriver.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <6bad679b-fb8f-5c89-39b1-0e0519e272aa@windriver.com>
Date: Thu, 8 Feb 2018 10:35:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1517813643-16075-1-git-send-email-zhe.he@windriver.com>
X-Originating-IP: [128.224.163.193]
Cc: Ashfield Bruce <bruce.ashfield@windriver.com>
Subject: Re: [PATCH] kernel: Fix QA buildpaths warning for kernel modules
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
X-List-Received-Date: Thu, 08 Feb 2018 02:39:58 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Bruce,

I should have cc this to you.

Thanks,
Zhe

On 2018年02月05日 14:54, zhe.he@windriver.com wrote:
> From: He Zhe <zhe.he@windriver.com>
>
> CFLAGS is unset during kernel_do_compile and thus the default build
> path substitutions in DEBUG_PREFIX_MAP are missing.
>
> To enhance reproducible build for kernel modules, such as lttng-modules
> and cryptodev-module, this patch appends them, plus substitution of
> STAGING_KERNEL_DIR, to KERNEL_CC.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta/classes/kernel-arch.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
> index cf0edb6..e0fe22b 100644
> --- a/meta/classes/kernel-arch.bbclass
> +++ b/meta/classes/kernel-arch.bbclass
> @@ -57,7 +57,7 @@ HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
>  TARGET_AR_KERNEL_ARCH ?= ""
>  HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
>  
> -KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd"
> +KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH}"
>  KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
>  KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
>  TOOLCHAIN = "gcc"


