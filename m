Received: from smtp7.emailarray.com (smtp7.emailarray.com [65.39.216.66])
 by mx.groups.io with SMTP id smtpd.web08.4327.1610805401767282091
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Jan 2021 05:56:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: balister.org, ip: 65.39.216.66, mailfrom: philip@balister.org)
Received: (qmail 62445 invoked by uid 89); 16 Jan 2021 13:56:16 -0000
Received: from unknown (HELO ?192.168.11.139?) (cGhpbGlwQG9wZW5zZHIuY29tQDczLjI1MS4xMC4xNDM=) (POLARISLOCAL)  
  by smtp7.emailarray.com with SMTP; 16 Jan 2021 13:56:16 -0000
Subject: Re: [OE-core] [PATCH] boost: drop arm-intrinsics.patch
To: Mans Rullgard <mans@mansr.com>, openembedded-core@lists.openembedded.org
References: <20210116133408.16089-1-mans@mansr.com>
From: "Philip Balister" <philip@balister.org>
Message-ID: <1cc86f41-5e83-0a90-97de-8f88d324194d@balister.org>
Date: Sat, 16 Jan 2021 08:55:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210116133408.16089-1-mans@mansr.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/16/21 8:34 AM, Mans Rullgard wrote:
> This patch makes gcc produce broken code.  It is unclear why it is there
> in the first place.  Drop it.

I'm having flashbacks to a time where gcc didn't support
__sync_add_and_fetch and friends, so code that looks like this was
copedi around as a work around. Compilers caught up and this patch
should have been dropped years ago :)

I looked around and can't find any similar patterns in oe-core.

For amusement I looked in oe-classic and there are hints of this issue.
And this specific patch comes from oe-classic.

Thanks for finding this Mans!

Philip

> 
> Signed-off-by: Mans Rullgard <mans@mansr.com>
> ---
>  .../boost/boost/arm-intrinsics.patch          | 55 -------------------
>  meta/recipes-support/boost/boost_1.75.0.bb    |  2 +-
>  2 files changed, 1 insertion(+), 56 deletions(-)
>  delete mode 100644 meta/recipes-support/boost/boost/arm-intrinsics.patch
> 
> diff --git a/meta/recipes-support/boost/boost/arm-intrinsics.patch b/meta/recipes-support/boost/boost/arm-intrinsics.patch
> deleted file mode 100644
> index fe85c69a827a..000000000000
> --- a/meta/recipes-support/boost/boost/arm-intrinsics.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -Upstream-Status: Backport
> -
> -8/17/2010 - rebased to 1.44 by Qing He <qing.he@intel.com>
> -
> -diff --git a/boost/smart_ptr/detail/atomic_count_sync.hpp b/boost/smart_ptr/detail/atomic_count_sync.hpp
> -index b6359b5..78b1cc2 100644
> ---- a/boost/smart_ptr/detail/atomic_count_sync.hpp
> -+++ b/boost/smart_ptr/detail/atomic_count_sync.hpp
> -@@ -33,17 +33,46 @@ public:
> - 
> -     long operator++()
> -     {
> -+#ifdef __ARM_ARCH_7A__
> -+       int v1, tmp;
> -+       asm volatile ("1:                 \n\t"
> -+                     "ldrex   %0, %1     \n\t"
> -+                     "add     %0 ,%0, #1 \n\t"
> -+                     "strex   %2, %0, %1 \n\t"
> -+                     "cmp     %2, #0     \n\t"
> -+                     "bne     1b         \n\t"
> -+                     : "=&r" (v1), "+Q"(value_), "=&r"(tmp)
> -+                    );
> -+#else
> -         return __sync_add_and_fetch( &value_, 1 );
> -+#endif
> -     }
> - 
> -     long operator--()
> -     {
> -+#ifdef __ARM_ARCH_7A__
> -+       int v1, tmp;
> -+       asm volatile ("1:                 \n\t"
> -+                     "ldrex   %0, %1     \n\t"
> -+                     "sub     %0 ,%0, #1 \n\t"
> -+                     "strex   %2, %0, %1 \n\t"
> -+                     "cmp     %2, #0     \n\t"
> -+                     "bne     1b         \n\t"
> -+                     : "=&r" (v1), "+Q"(value_), "=&r"(tmp)
> -+                    );
> -+       return value_;
> -+#else
> -         return __sync_add_and_fetch( &value_, -1 );
> -+#endif
> -     }
> - 
> -     operator long() const
> -     {
> -+#if __ARM_ARCH_7A__
> -+        return value_;
> -+#else
> -         return __sync_fetch_and_add( &value_, 0 );
> -+#endif
> -     }
> - 
> - private:
> diff --git a/meta/recipes-support/boost/boost_1.75.0.bb b/meta/recipes-support/boost/boost_1.75.0.bb
> index 33137e236dba..23b0ffc67e29 100644
> --- a/meta/recipes-support/boost/boost_1.75.0.bb
> +++ b/meta/recipes-support/boost/boost_1.75.0.bb
> @@ -1,7 +1,7 @@
>  require boost-${PV}.inc
>  require boost.inc
>  
> -SRC_URI += "file://arm-intrinsics.patch \
> +SRC_URI += " \
>             file://boost-CVE-2012-2677.patch \
>             file://boost-math-disable-pch-for-gcc.patch \
>             file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
> 
> 
> 
> 
> 
