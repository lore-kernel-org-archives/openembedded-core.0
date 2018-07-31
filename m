Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3308578D7C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 01:57:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6V1vFGr025471
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 30 Jul 2018 18:57:15 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Mon, 30 Jul 2018 18:57:14 -0700
To: =?UTF-8?Q?Daniel_D=c3=adaz?= <daniel.diaz@linaro.org>,
	<openembedded-core@lists.openembedded.org>
References: <1532543734-17529-1-git-send-email-daniel.diaz@linaro.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <e6cdc11a-c949-df7b-0b41-806fdcc74689@windriver.com>
Date: Tue, 31 Jul 2018 10:01:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1532543734-17529-1-git-send-email-daniel.diaz@linaro.org>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH] glibc: Avoid multilibbing on wordsize.h
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
X-List-Received-Date: Tue, 31 Jul 2018 01:57:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

This patch causes a regression in multilib SDK for qemuarm64.

Error: Transaction check error:
   file /usr/include/bits/wordsize.h conflicts between attempted installs of lib32-libc6-dev-2.27-r0.armv7vet2hf_vfp and libc6-dev-2.27-r0.aarch64

Please consider sending a follow-up patch to fix this regression.

Best Regards,
Chen Qi

On 07/26/2018 02:35 AM, Daniel Díaz wrote:
> Once another header #includes <bits/wordsize.h>, there is a
> potential recursion going on because the
> multilib_header_wrapper.h #includes <bits/wordsize.h> again!
>
> This should not happen because an __arm__ (32-bits) or an
> __aarch64__ (64-bits) environment guarantees that we will
> be getting the correct definition, but when building against
> a different target (like BPF), recursion is what happens.
>
> This can be seen, for instance, when building eBPF programs
> from the kernel with `clang -target bpf', such as the ones
> located in linux/tools/testing/selftests/bpf/.
>
> Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
> Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
> ---
>   meta/recipes-core/glibc/glibc-package.inc | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
> index ae3f2f6..a4f61f8 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -136,8 +136,7 @@ do_install_append_armeb () {
>   }
>   
>   do_install_armmultilib () {
> -
> -	oe_multilib_header bits/endian.h bits/fcntl.h bits/fenv.h bits/fp-fast.h bits/hwcap.h bits/ipc.h bits/link.h bits/wordsize.h
> +	oe_multilib_header bits/endian.h bits/fcntl.h bits/fenv.h bits/fp-fast.h bits/hwcap.h bits/ipc.h bits/link.h
>   	oe_multilib_header bits/local_lim.h bits/mman.h bits/msq.h bits/pthreadtypes.h bits/pthreadtypes-arch.h  bits/sem.h  bits/semaphore.h bits/setjmp.h
>   	oe_multilib_header bits/shm.h bits/sigstack.h bits/stat.h bits/statfs.h bits/typesizes.h
>   



