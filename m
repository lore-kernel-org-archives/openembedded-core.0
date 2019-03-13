Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EDECC6D50C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 01:46:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2D1ja5F017308
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Mar 2019 18:46:12 -0700
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Tue, 12 Mar 2019 18:45:41 -0700
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
References: <1551846256-166265-1-git-send-email-mingli.yu@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5C886242.2060008@windriver.com>
Date: Wed, 13 Mar 2019 09:52:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1551846256-166265-1-git-send-email-mingli.yu@windriver.com>
X-Originating-IP: [128.224.162.194]
Subject: Re: [PATCH] gcc-sanitizers: fix the build with -fno-omit-frame-pointer
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
X-List-Received-Date: Wed, 13 Mar 2019 01:46:38 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Ping.

Thanks,

On 2019年03月06日 12:24, mingli.yu@windriver.com wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> Fix the below build issue for gcc-sanitizers when
> both -mthumb and -fno-omit-frame-pointer configured
> for arm.
> | ../../../../libsanitizer/sanitizer_common/sanitizer_linux.cc: In function 'sanitizer::uptr sanitizer::internal_clone(int (*)(void*), void*, int, void*, int*, void*, int*)':
> | ../../../../libsanitizer/sanitizer_common/sanitizer_linux.cc:1540:1: error: r7 cannot be used in asm here
> }
>
> Reference: https://reviews.llvm.org/D50180
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>   meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb
> index f3c7058..2f89c86 100644
> --- a/meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb
> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb
> @@ -5,3 +5,4 @@ require gcc-sanitizers.inc
>   # sanitizer_linux.s:5749: Error: lo register required -- `ldr ip,[sp],#8'
>   ARM_INSTRUCTION_SET_armv4 = "arm"
>   ARM_INSTRUCTION_SET_armv5 = "arm"
> +TARGET_CFLAGS_remove_arm = "${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fno-omit-frame-pointer', '', d)}"
>

