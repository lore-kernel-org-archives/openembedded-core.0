Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DC6BF79860
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 03:47:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8D3klxB017032
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Sep 2018 20:46:58 -0700
Received: from server.local (128.224.20.171) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 12 Sep 2018 20:46:36 -0700
To: Khem Raj <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <20180913010531.41241-1-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <45b763b2-4d9b-80e0-35b3-122d844c2b21@windriver.com>
Date: Wed, 12 Sep 2018 23:46:36 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180913010531.41241-1-raj.khem@gmail.com>
Subject: Re: [PATCH 1/2] linux-libc-headers: Include linux/stddef.h in linux/swab.h
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
X-List-Received-Date: Thu, 13 Sep 2018 03:47:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2018-09-12 9:05 PM, Khem Raj wrote:
> This helps compiling bpf tests using non-glibc C libraries e.g. musl

Looks good to me. Thanks for the cc', most appreciated.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>   ...linux-stddef.h-in-swab.h-uapi-header.patch | 44 +++++++++++++++++++
>   .../linux-libc-headers_4.18.bb                |  1 +
>   2 files changed, 45 insertions(+)
>   create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-include-linux-stddef.h-in-swab.h-uapi-header.patch
> 
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-include-linux-stddef.h-in-swab.h-uapi-header.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-include-linux-stddef.h-in-swab.h-uapi-header.patch
> new file mode 100644
> index 0000000000..9d17daa70f
> --- /dev/null
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-include-linux-stddef.h-in-swab.h-uapi-header.patch
> @@ -0,0 +1,44 @@
> +From 9708dc74d9f49488d669e070982f6224a888d61a Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 12 Sep 2018 17:08:58 -0700
> +Subject: [PATCH] include linux/stddef.h in swab.h uapi header
> +
> +swab.h uses __always_inline without including the header where it is
> +defined, this is exposed by musl based distributions where this macro is
> +not defined by system C library headers unlike glibc where it is defined
> +in sys/cdefs.h and that header gets pulled in indirectly via
> +
> +features.h -> sys/cdefs.h
> +
> +and features.h gets pulled in a lot of headers. Therefore it may work in
> +cases where features.h is includes but not otherwise.
> +
> +Adding linux/stddef.h here ensures that __always_inline is always
> +defined independent of which C library is used in userspace
> +
> +Upstream-Status: Submitted [https://lkml.org/lkml/2018/9/13/78]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Cc: Philippe Ombredanne <pombredanne@nexb.com>
> +Cc: Kate Stewart <kstewart@linuxfoundation.org>
> +Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> +Cc: Thomas Gleixner <tglx@linutronix.de>
> +---
> + include/uapi/linux/swab.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/include/uapi/linux/swab.h b/include/uapi/linux/swab.h
> +index 23cd84868cc3..acddbe50a20d 100644
> +--- a/include/uapi/linux/swab.h
> ++++ b/include/uapi/linux/swab.h
> +@@ -3,6 +3,7 @@
> + #define _UAPI_LINUX_SWAB_H
> +
> + #include <linux/types.h>
> ++#include <linux/stddef.h>
> + #include <linux/compiler.h>
> + #include <asm/swab.h>
> +
> +--
> +2.19.0
> +
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb
> index e38872bb91..eb7bee72b0 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb
> @@ -6,6 +6,7 @@ SRC_URI_append_libc-musl = "\
>       file://0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch \
>       file://0001-libc-compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch \
>       file://0001-if_ether-move-muslc-ethhdr-protection-to-uapi-file.patch \
> +    file://0001-include-linux-stddef.h-in-swab.h-uapi-header.patch \
>      "
>   
>   SRC_URI[md5sum] = "bee5fe53ee1c3142b8f0c12c0d3348f9"
> 


