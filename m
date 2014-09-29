Return-Path: <niqingliang2003@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4E2056FE10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 01:13:07 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id l18so11355470wgh.33
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Sep 2014 18:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=kCFAJ2ng2qFUyywed5p0qOaZRKIoYsPFdvl/NuJQimQ=;
	b=GHQZxLgAJLNRGWg3zTlT6mcgYVorP5zc3EE6Re84XYx7A3lEQYLBeM5jOrRGHApCU3
	ZQvifIf3YiKICGbF8rNoq+jfLNseIyVsRQqbkKDJFJFhLUGpMMRSMFGSc90JioAdwg5p
	2AM/ASN8lIfmdwqZk7Tr5haDSluk11jSjtfD+Tq5SK4SpWmLXm0OfxQOZsbIY0QChcp+
	BNXtu4tsRGCSSnzxQhn3285EivEoZB5SR0nBIeOG8ynaZBkZu1BEPel6glyTD/Q9NZo1
	jrj3nyxFRpuzEgIK0GgMt6aEEsxTb1bC6obfbtNuyJAASyPxghuhNBHKlgqLn0yzlOne
	fh0A==
MIME-Version: 1.0
X-Received: by 10.194.209.207 with SMTP id mo15mr38761302wjc.6.1411953188553; 
	Sun, 28 Sep 2014 18:13:08 -0700 (PDT)
Received: by 10.217.141.70 with HTTP; Sun, 28 Sep 2014 18:13:08 -0700 (PDT)
In-Reply-To: <1411918666-21996-1-git-send-email-pab@pabigot.com>
References: <1411918666-21996-1-git-send-email-pab@pabigot.com>
Date: Mon, 29 Sep 2014 09:13:08 +0800
Message-ID: <CADwFkYfY1v7THe9DpymFHaJhjWuPxesKjoaja9vFnYPh26o0Qg@mail.gmail.com>
From: Yi Qingliang <niqingliang2003@gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost: fix atomics for armv6
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
X-List-Received-Date: Mon, 29 Sep 2014 01:13:15 -0000
Content-Type: multipart/alternative; boundary=047d7b3a83143e4aa8050429f83e

--047d7b3a83143e4aa8050429f83e
Content-Type: text/plain; charset=UTF-8

It work for me on my s3c6410 board. The new image run without exception.

Signed-off-by: Yi Qingliang <niqingliang2003@gmail.com>
<niqingliang2003@gmail.com>

On Sun, Sep 28, 2014 at 11:37 PM, Peter A. Bigot <pab@pabigot.com> wrote:

> meta-raspberrypi and some other systems are ARMv6k but tell OE that
> they're ARMv6 which doesn't fully support non-word atomics.  armv6k
> does, but Boost didn't handle the recognition correctly in the 1.56
> release.  Backport the patch that fixes the build.
>
> See: https://svn.boost.org/trac/boost/ticket/10446
> Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> ---
>
> Note:
>
> I have only tested that this fixes the compile problems; I have not
> verified that the resulting library works correctly with respect to
> atomics.  I'm expecting somebody who uses boost on a platform where this
> is relevant to validate the functional behavior if that's necessary.
>
> Cc: niqingliang2003@gmail.com
> Cc: danismostlikely@gmail.com
>
> Peter
>
>  ...rt-for-extending-operations-to-GCC-atomic.patch | 412
> +++++++++++++++++++++
>  meta/recipes-support/boost/boost_1.56.0.bb         |   5 +-
>  2 files changed, 416 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-support/boost/boost/0001-Added-support-for-extending-operations-to-GCC-atomic.patch
>
> diff --git
> a/meta/recipes-support/boost/boost/0001-Added-support-for-extending-operations-to-GCC-atomic.patch
> b/meta/recipes-support/boost/boost/0001-Added-support-for-extending-operations-to-GCC-atomic.patch
> new file mode 100644
> index 0000000..feece81
> --- /dev/null
> +++
> b/meta/recipes-support/boost/boost/0001-Added-support-for-extending-operations-to-GCC-atomic.patch
> @@ -0,0 +1,412 @@
> +From 415db7054723291042e4ff1ffa8fdd5bc8b07163 Mon Sep 17 00:00:00 2001
> +From: Andrey Semashev <andrey.semashev@gmail.com>
> +Date: Sat, 27 Sep 2014 20:40:09 +0400
> +Subject: [PATCH] Added support for extending operations to GCC atomic
> backend.
> +
> +Fix for #10446. Some platforms (e.g. Raspberry Pi) only support atomic
> ops of some particular size but not less. Use extending arithmetic
> operations for these platforms. Also, make sure bools are always treated as
> 8-bit values, even if the actual type is larger. This makes its use in
> atomic<>, atomic_flag and lock pool more consistent.
> +
> +Upstream-Status: Backport [https://svn.boost.org/trac/boost/ticket/10446]
> +Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> +
> +---
> + include/boost/atomic/capabilities.hpp           |   1 +
> + include/boost/atomic/detail/atomic_template.hpp |   2 +-
> + include/boost/atomic/detail/caps_gcc_atomic.hpp |  82 +++++------
> + include/boost/atomic/detail/ops_gcc_atomic.hpp  | 184
> +++++++++++++++++++++---
> + 4 files changed, 206 insertions(+), 63 deletions(-)
> +
> +diff --git a/include/boost/atomic/capabilities.hpp
> b/include/boost/atomic/capabilities.hpp
> +index 658dd22..05bbb0f 100644
> +--- a/include/boost/atomic/capabilities.hpp
> ++++ b/include/boost/atomic/capabilities.hpp
> +@@ -142,6 +142,7 @@
> + #define BOOST_ATOMIC_ADDRESS_LOCK_FREE BOOST_ATOMIC_POINTER_LOCK_FREE
> +
> + #ifndef BOOST_ATOMIC_BOOL_LOCK_FREE
> ++// We store bools in 1-byte storage in all backends
> + #define BOOST_ATOMIC_BOOL_LOCK_FREE BOOST_ATOMIC_INT8_LOCK_FREE
> + #endif
> +
> +diff --git a/include/boost/atomic/detail/atomic_template.hpp
> b/include/boost/atomic/detail/atomic_template.hpp
> +index 4fd6d79..bc3922a 100644
> +--- a/include/boost/atomic/detail/atomic_template.hpp
> ++++ b/include/boost/atomic/detail/atomic_template.hpp
> +@@ -234,7 +234,7 @@ class base_atomic< bool, int >
> + {
> + private:
> +     typedef bool value_type;
> +-    typedef atomics::detail::operations< storage_size_of< value_type
> >::value, false > operations;
> ++    typedef atomics::detail::operations< 1u, false > operations;
> +
> + protected:
> +     typedef value_type value_arg_type;
> +diff --git a/include/boost/atomic/detail/caps_gcc_atomic.hpp
> b/include/boost/atomic/detail/caps_gcc_atomic.hpp
> +index 8299ad0..f4e7a70 100644
> +--- a/include/boost/atomic/detail/caps_gcc_atomic.hpp
> ++++ b/include/boost/atomic/detail/caps_gcc_atomic.hpp
> +@@ -29,66 +29,48 @@
> + #define BOOST_ATOMIC_DETAIL_X86_HAS_CMPXCHG16B 1
> + #endif
> +
> +-#if __GCC_ATOMIC_BOOL_LOCK_FREE == 2
> +-#define BOOST_ATOMIC_FLAG_LOCK_FREE 2
> +-#else
> +-#define BOOST_ATOMIC_FLAG_LOCK_FREE 0
> +-#endif
> +-#if __GCC_ATOMIC_CHAR_LOCK_FREE == 2
> +-#define BOOST_ATOMIC_CHAR_LOCK_FREE 2
> +-#else
> +-#define BOOST_ATOMIC_CHAR_LOCK_FREE 0
> +-#endif
> +-#if __GCC_ATOMIC_CHAR16_T_LOCK_FREE == 2
> +-#define BOOST_ATOMIC_CHAR16_T_LOCK_FREE 2
> +-#else
> +-#define BOOST_ATOMIC_CHAR16_T_LOCK_FREE 0
> +-#endif
> +-#if __GCC_ATOMIC_CHAR32_T_LOCK_FREE == 2
> +-#define BOOST_ATOMIC_CHAR32_T_LOCK_FREE 2
> ++#if defined(BOOST_ATOMIC_DETAIL_X86_HAS_CMPXCHG16B) &&
> (defined(BOOST_HAS_INT128) || !defined(BOOST_NO_ALIGNMENT))
> ++#define BOOST_ATOMIC_INT128_LOCK_FREE 2
> + #else
> +-#define BOOST_ATOMIC_CHAR32_T_LOCK_FREE 0
> ++#define BOOST_ATOMIC_INT128_LOCK_FREE 0
> + #endif
> +-#if __GCC_ATOMIC_WCHAR_T_LOCK_FREE == 2
> +-#define BOOST_ATOMIC_WCHAR_T_LOCK_FREE 2
> ++
> ++#if __GCC_ATOMIC_LLONG_LOCK_FREE == 2
> ++#define BOOST_ATOMIC_LLONG_LOCK_FREE 2
> + #else
> +-#define BOOST_ATOMIC_WCHAR_T_LOCK_FREE 0
> ++#define BOOST_ATOMIC_LLONG_LOCK_FREE BOOST_ATOMIC_INT128_LOCK_FREE
> + #endif
> +-#if __GCC_ATOMIC_SHORT_LOCK_FREE == 2
> +-#define BOOST_ATOMIC_SHORT_LOCK_FREE 2
> ++
> ++#if __GCC_ATOMIC_LONG_LOCK_FREE == 2
> ++#define BOOST_ATOMIC_LONG_LOCK_FREE 2
> + #else
> +-#define BOOST_ATOMIC_SHORT_LOCK_FREE 0
> ++#define BOOST_ATOMIC_LONG_LOCK_FREE BOOST_ATOMIC_LLONG_LOCK_FREE
> + #endif
> ++
> + #if __GCC_ATOMIC_INT_LOCK_FREE == 2
> + #define BOOST_ATOMIC_INT_LOCK_FREE 2
> + #else
> +-#define BOOST_ATOMIC_INT_LOCK_FREE 0
> +-#endif
> +-#if __GCC_ATOMIC_LONG_LOCK_FREE == 2
> +-#define BOOST_ATOMIC_LONG_LOCK_FREE 2
> +-#else
> +-#define BOOST_ATOMIC_LONG_LOCK_FREE 0
> ++#define BOOST_ATOMIC_INT_LOCK_FREE BOOST_ATOMIC_LONG_LOCK_FREE
> + #endif
> +-#if __GCC_ATOMIC_LLONG_LOCK_FREE == 2
> +-#define BOOST_ATOMIC_LLONG_LOCK_FREE 2
> ++
> ++#if __GCC_ATOMIC_SHORT_LOCK_FREE == 2
> ++#define BOOST_ATOMIC_SHORT_LOCK_FREE 2
> + #else
> +-#define BOOST_ATOMIC_LLONG_LOCK_FREE 0
> ++#define BOOST_ATOMIC_SHORT_LOCK_FREE BOOST_ATOMIC_INT_LOCK_FREE
> + #endif
> +-#if defined(BOOST_ATOMIC_DETAIL_X86_HAS_CMPXCHG16B) &&
> (defined(BOOST_HAS_INT128) || !defined(BOOST_NO_ALIGNMENT))
> +-#define BOOST_ATOMIC_INT128_LOCK_FREE 2
> ++
> ++#if __GCC_ATOMIC_CHAR_LOCK_FREE == 2
> ++#define BOOST_ATOMIC_CHAR_LOCK_FREE 2
> + #else
> +-#define BOOST_ATOMIC_INT128_LOCK_FREE 0
> ++#define BOOST_ATOMIC_CHAR_LOCK_FREE BOOST_ATOMIC_SHORT_LOCK_FREE
> + #endif
> ++
> + #if __GCC_ATOMIC_POINTER_LOCK_FREE == 2
> + #define BOOST_ATOMIC_POINTER_LOCK_FREE 2
> + #else
> + #define BOOST_ATOMIC_POINTER_LOCK_FREE 0
> + #endif
> +-#if __GCC_ATOMIC_BOOL_LOCK_FREE == 2
> +-#define BOOST_ATOMIC_BOOL_LOCK_FREE 2
> +-#else
> +-#define BOOST_ATOMIC_BOOL_LOCK_FREE 0
> +-#endif
> ++
> +
> + #define BOOST_ATOMIC_INT8_LOCK_FREE BOOST_ATOMIC_CHAR_LOCK_FREE
> +
> +@@ -128,6 +110,24 @@
> + #define BOOST_ATOMIC_INT64_LOCK_FREE 0
> + #endif
> +
> ++
> ++#if __GCC_ATOMIC_WCHAR_T_LOCK_FREE == 2
> ++#define BOOST_ATOMIC_WCHAR_T_LOCK_FREE 2
> ++#elif BOOST_ATOMIC_DETAIL_SIZEOF_WCHAR_T == 8
> ++#define BOOST_ATOMIC_WCHAR_T_LOCK_FREE BOOST_ATOMIC_INT64_LOCK_FREE
> ++#elif BOOST_ATOMIC_DETAIL_SIZEOF_WCHAR_T == 4
> ++#define BOOST_ATOMIC_WCHAR_T_LOCK_FREE BOOST_ATOMIC_INT32_LOCK_FREE
> ++#elif BOOST_ATOMIC_DETAIL_SIZEOF_WCHAR_T == 2
> ++#define BOOST_ATOMIC_WCHAR_T_LOCK_FREE BOOST_ATOMIC_INT16_LOCK_FREE
> ++#elif BOOST_ATOMIC_DETAIL_SIZEOF_WCHAR_T == 1
> ++#define BOOST_ATOMIC_WCHAR_T_LOCK_FREE BOOST_ATOMIC_INT8_LOCK_FREE
> ++#else
> ++#define BOOST_ATOMIC_WCHAR_T_LOCK_FREE 0
> ++#endif
> ++
> ++#define BOOST_ATOMIC_CHAR32_T_LOCK_FREE BOOST_ATOMIC_INT32_LOCK_FREE
> ++#define BOOST_ATOMIC_CHAR16_T_LOCK_FREE BOOST_ATOMIC_INT16_LOCK_FREE
> ++
> + #define BOOST_ATOMIC_THREAD_FENCE 2
> + #define BOOST_ATOMIC_SIGNAL_FENCE 2
> +
> +diff --git a/include/boost/atomic/detail/ops_gcc_atomic.hpp
> b/include/boost/atomic/detail/ops_gcc_atomic.hpp
> +index 2297791..2e4c37b 100644
> +--- a/include/boost/atomic/detail/ops_gcc_atomic.hpp
> ++++ b/include/boost/atomic/detail/ops_gcc_atomic.hpp
> +@@ -24,6 +24,15 @@
> + #include <boost/atomic/detail/ops_cas_based.hpp>
> + #endif
> +
> ++#if __GCC_ATOMIC_LLONG_LOCK_FREE != BOOST_ATOMIC_LLONG_LOCK_FREE ||
> __GCC_ATOMIC_LONG_LOCK_FREE != BOOST_ATOMIC_LONG_LOCK_FREE ||\
> ++    __GCC_ATOMIC_INT_LOCK_FREE != BOOST_ATOMIC_INT_LOCK_FREE ||
> __GCC_ATOMIC_SHORT_LOCK_FREE != BOOST_ATOMIC_SHORT_LOCK_FREE ||\
> ++    __GCC_ATOMIC_CHAR_LOCK_FREE != BOOST_ATOMIC_CHAR_LOCK_FREE ||
> __GCC_ATOMIC_BOOL_LOCK_FREE != BOOST_ATOMIC_BOOL_LOCK_FREE ||\
> ++    __GCC_ATOMIC_WCHAR_T_LOCK_FREE != BOOST_ATOMIC_WCHAR_T_LOCK_FREE
> ++// There are platforms where we need to use larger storage types
> ++#include <boost/atomic/detail/int_sizes.hpp>
> ++#include <boost/atomic/detail/ops_extending_cas_based.hpp>
> ++#endif
> ++
> + #ifdef BOOST_HAS_PRAGMA_ONCE
> + #pragma once
> + #endif
> +@@ -154,73 +163,206 @@ struct gcc_atomic_operations
> +     }
> + };
> +
> +-#if BOOST_ATOMIC_INT8_LOCK_FREE > 0
> ++#if BOOST_ATOMIC_INT128_LOCK_FREE > 0
> ++#if defined(__clang__) && defined(BOOST_ATOMIC_DETAIL_X86_HAS_CMPXCHG16B)
> ++
> ++// Workaround for clang bug: http://llvm.org/bugs/show_bug.cgi?id=19149
> ++// Clang 3.4 does not implement 128-bit __atomic* intrinsics even though
> it defines __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16
> + template< bool Signed >
> +-struct operations< 1u, Signed > :
> +-    public gcc_atomic_operations< typename make_storage_type< 1u, Signed
> >::type >
> ++struct operations< 16u, Signed > :
> ++    public cas_based_operations< gcc_dcas_x86_64< Signed > >
> + {
> + };
> ++
> ++#else
> ++
> ++template< bool Signed >
> ++struct operations< 16u, Signed > :
> ++    public gcc_atomic_operations< typename make_storage_type< 16u,
> Signed >::type >
> ++{
> ++};
> ++
> ++#endif
> + #endif
> +
> +-#if BOOST_ATOMIC_INT16_LOCK_FREE > 0
> ++
> ++#if BOOST_ATOMIC_INT64_LOCK_FREE > 0
> ++#if defined(__clang__) && defined(BOOST_ATOMIC_DETAIL_X86_HAS_CMPXCHG8B)
> ++
> ++// Workaround for clang bug http://llvm.org/bugs/show_bug.cgi?id=19355
> + template< bool Signed >
> +-struct operations< 2u, Signed > :
> +-    public gcc_atomic_operations< typename make_storage_type< 2u, Signed
> >::type >
> ++struct operations< 8u, Signed > :
> ++    public cas_based_operations< gcc_dcas_x86< Signed > >
> ++{
> ++};
> ++
> ++#elif (BOOST_ATOMIC_DETAIL_SIZEOF_LLONG == 8 &&
> __GCC_ATOMIC_LLONG_LOCK_FREE != BOOST_ATOMIC_LLONG_LOCK_FREE) ||\
> ++    (BOOST_ATOMIC_DETAIL_SIZEOF_LONG == 8 && __GCC_ATOMIC_LONG_LOCK_FREE
> != BOOST_ATOMIC_LONG_LOCK_FREE) ||\
> ++    (BOOST_ATOMIC_DETAIL_SIZEOF_INT == 8 && __GCC_ATOMIC_INT_LOCK_FREE
> != BOOST_ATOMIC_INT_LOCK_FREE) ||\
> ++    (BOOST_ATOMIC_DETAIL_SIZEOF_SHORT == 8 &&
> __GCC_ATOMIC_SHORT_LOCK_FREE != BOOST_ATOMIC_SHORT_LOCK_FREE) ||\
> ++    (BOOST_ATOMIC_DETAIL_SIZEOF_WCHAR_T == 8 &&
> __GCC_ATOMIC_WCHAR_T_LOCK_FREE != BOOST_ATOMIC_WCHAR_T_LOCK_FREE)
> ++
> ++#define BOOST_ATOMIC_DETAIL_INT64_EXTENDED
> ++
> ++template< bool Signed >
> ++struct operations< 8u, Signed > :
> ++    public extending_cas_based_operations< gcc_atomic_operations<
> typename make_storage_type< 16u, Signed >::type >, 8u, Signed >
> + {
> + };
> ++
> ++#else
> ++
> ++template< bool Signed >
> ++struct operations< 8u, Signed > :
> ++    public gcc_atomic_operations< typename make_storage_type< 8u, Signed
> >::type >
> ++{
> ++};
> ++
> ++#endif
> + #endif
> +
> + #if BOOST_ATOMIC_INT32_LOCK_FREE > 0
> ++#if (BOOST_ATOMIC_DETAIL_SIZEOF_LLONG == 4 &&
> __GCC_ATOMIC_LLONG_LOCK_FREE != BOOST_ATOMIC_LLONG_LOCK_FREE) ||\
> ++    (BOOST_ATOMIC_DETAIL_SIZEOF_LONG == 4 && __GCC_ATOMIC_LONG_LOCK_FREE
> != BOOST_ATOMIC_LONG_LOCK_FREE) ||\
> ++    (BOOST_ATOMIC_DETAIL_SIZEOF_INT == 4 && __GCC_ATOMIC_INT_LOCK_FREE
> != BOOST_ATOMIC_INT_LOCK_FREE) ||\
> ++    (BOOST_ATOMIC_DETAIL_SIZEOF_SHORT == 4 &&
> __GCC_ATOMIC_SHORT_LOCK_FREE != BOOST_ATOMIC_SHORT_LOCK_FREE) ||\
> ++    (BOOST_ATOMIC_DETAIL_SIZEOF_WCHAR_T == 4 &&
> __GCC_ATOMIC_WCHAR_T_LOCK_FREE != BOOST_ATOMIC_WCHAR_T_LOCK_FREE)
> ++
> ++#define BOOST_ATOMIC_DETAIL_INT32_EXTENDED
> ++
> ++#if !defined(BOOST_ATOMIC_DETAIL_INT64_EXTENDED)
> ++
> ++template< bool Signed >
> ++struct operations< 4u, Signed > :
> ++    public extending_cas_based_operations< gcc_atomic_operations<
> typename make_storage_type< 8u, Signed >::type >, 4u, Signed >
> ++{
> ++};
> ++
> ++#else // !defined(BOOST_ATOMIC_DETAIL_INT64_EXTENDED)
> ++
> ++template< bool Signed >
> ++struct operations< 4u, Signed > :
> ++    public extending_cas_based_operations< gcc_atomic_operations<
> typename make_storage_type< 16u, Signed >::type >, 4u, Signed >
> ++{
> ++};
> ++
> ++#endif // !defined(BOOST_ATOMIC_DETAIL_INT64_EXTENDED)
> ++
> ++#else
> ++
> + template< bool Signed >
> + struct operations< 4u, Signed > :
> +     public gcc_atomic_operations< typename make_storage_type< 4u, Signed
> >::type >
> + {
> + };
> ++
> ++#endif
> + #endif
> +
> +-#if BOOST_ATOMIC_INT64_LOCK_FREE > 0
> +-#if defined(__clang__) && defined(BOOST_ATOMIC_DETAIL_X86_HAS_CMPXCHG8B)
> ++#if BOOST_ATOMIC_INT16_LOCK_FREE > 0
> ++#if (BOOST_ATOMIC_DETAIL_SIZEOF_LLONG == 2 &&
> __GCC_ATOMIC_LLONG_LOCK_FREE != BOOST_ATOMIC_LLONG_LOCK_FREE) ||\
> ++    (BOOST_ATOMIC_DETAIL_SIZEOF_LONG == 2 && __GCC_ATOMIC_LONG_LOCK_FREE
> != BOOST_ATOMIC_LONG_LOCK_FREE) ||\
> ++    (BOOST_ATOMIC_DETAIL_SIZEOF_INT == 2 && __GCC_ATOMIC_INT_LOCK_FREE
> != BOOST_ATOMIC_INT_LOCK_FREE) ||\
> ++    (BOOST_ATOMIC_DETAIL_SIZEOF_SHORT == 2 &&
> __GCC_ATOMIC_SHORT_LOCK_FREE != BOOST_ATOMIC_SHORT_LOCK_FREE) ||\
> ++    (BOOST_ATOMIC_DETAIL_SIZEOF_WCHAR_T == 2 &&
> __GCC_ATOMIC_WCHAR_T_LOCK_FREE != BOOST_ATOMIC_WCHAR_T_LOCK_FREE)
> ++
> ++#define BOOST_ATOMIC_DETAIL_INT16_EXTENDED
> ++
> ++#if !defined(BOOST_ATOMIC_DETAIL_INT32_EXTENDED)
> +
> +-// Workaround for clang bug http://llvm.org/bugs/show_bug.cgi?id=19355
> + template< bool Signed >
> +-struct operations< 8u, Signed > :
> +-    public cas_based_operations< gcc_dcas_x86< Signed > >
> ++struct operations< 2u, Signed > :
> ++    public extending_cas_based_operations< gcc_atomic_operations<
> typename make_storage_type< 4u, Signed >::type >, 2u, Signed >
> ++{
> ++};
> ++
> ++#elif !defined(BOOST_ATOMIC_DETAIL_INT64_EXTENDED)
> ++
> ++template< bool Signed >
> ++struct operations< 2u, Signed > :
> ++    public extending_cas_based_operations< gcc_atomic_operations<
> typename make_storage_type< 8u, Signed >::type >, 2u, Signed >
> + {
> + };
> +
> + #else
> +
> + template< bool Signed >
> +-struct operations< 8u, Signed > :
> +-    public gcc_atomic_operations< typename make_storage_type< 8u, Signed
> >::type >
> ++struct operations< 2u, Signed > :
> ++    public extending_cas_based_operations< gcc_atomic_operations<
> typename make_storage_type< 16u, Signed >::type >, 2u, Signed >
> ++{
> ++};
> ++
> ++#endif
> ++
> ++#else
> ++
> ++template< bool Signed >
> ++struct operations< 2u, Signed > :
> ++    public gcc_atomic_operations< typename make_storage_type< 2u, Signed
> >::type >
> + {
> + };
> +
> + #endif
> + #endif
> +
> +-#if BOOST_ATOMIC_INT128_LOCK_FREE > 0
> +-#if defined(__clang__) && defined(BOOST_ATOMIC_DETAIL_X86_HAS_CMPXCHG16B)
> ++#if BOOST_ATOMIC_INT8_LOCK_FREE > 0
> ++#if (BOOST_ATOMIC_DETAIL_SIZEOF_LLONG == 1 &&
> __GCC_ATOMIC_LLONG_LOCK_FREE != BOOST_ATOMIC_LLONG_LOCK_FREE) ||\
> ++    (BOOST_ATOMIC_DETAIL_SIZEOF_LONG == 1 && __GCC_ATOMIC_LONG_LOCK_FREE
> != BOOST_ATOMIC_LONG_LOCK_FREE) ||\
> ++    (BOOST_ATOMIC_DETAIL_SIZEOF_INT == 1 && __GCC_ATOMIC_INT_LOCK_FREE
> != BOOST_ATOMIC_INT_LOCK_FREE) ||\
> ++    (BOOST_ATOMIC_DETAIL_SIZEOF_SHORT == 1 &&
> __GCC_ATOMIC_SHORT_LOCK_FREE != BOOST_ATOMIC_SHORT_LOCK_FREE) ||\
> ++    (BOOST_ATOMIC_DETAIL_SIZEOF_WCHAR_T == 1 &&
> __GCC_ATOMIC_WCHAR_T_LOCK_FREE != BOOST_ATOMIC_WCHAR_T_LOCK_FREE) ||\
> ++    (__GCC_ATOMIC_CHAR_LOCK_FREE != BOOST_ATOMIC_CHAR_LOCK_FREE) ||\
> ++    (__GCC_ATOMIC_BOOL_LOCK_FREE != BOOST_ATOMIC_BOOL_LOCK_FREE)
> ++
> ++#if !defined(BOOST_ATOMIC_DETAIL_INT16_EXTENDED)
> +
> +-// Workaround for clang bug: http://llvm.org/bugs/show_bug.cgi?id=19149
> +-// Clang 3.4 does not implement 128-bit __atomic* intrinsics even though
> it defines __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16
> + template< bool Signed >
> +-struct operations< 16u, Signed > :
> +-    public cas_based_operations< gcc_dcas_x86_64< Signed > >
> ++struct operations< 1u, Signed > :
> ++    public extending_cas_based_operations< gcc_atomic_operations<
> typename make_storage_type< 2u, Signed >::type >, 1u, Signed >
> ++{
> ++};
> ++
> ++#elif !defined(BOOST_ATOMIC_DETAIL_INT32_EXTENDED)
> ++
> ++template< bool Signed >
> ++struct operations< 1u, Signed > :
> ++    public extending_cas_based_operations< gcc_atomic_operations<
> typename make_storage_type< 4u, Signed >::type >, 1u, Signed >
> ++{
> ++};
> ++
> ++#elif !defined(BOOST_ATOMIC_DETAIL_INT64_EXTENDED)
> ++
> ++template< bool Signed >
> ++struct operations< 1u, Signed > :
> ++    public extending_cas_based_operations< gcc_atomic_operations<
> typename make_storage_type< 8u, Signed >::type >, 1u, Signed >
> + {
> + };
> +
> + #else
> +
> + template< bool Signed >
> +-struct operations< 16u, Signed > :
> +-    public gcc_atomic_operations< typename make_storage_type< 16u,
> Signed >::type >
> ++struct operations< 1u, Signed > :
> ++    public extending_cas_based_operations< gcc_atomic_operations<
> typename make_storage_type< 16u, Signed >::type >, 1u, Signed >
> ++{
> ++};
> ++
> ++#endif
> ++
> ++#else
> ++
> ++template< bool Signed >
> ++struct operations< 1u, Signed > :
> ++    public gcc_atomic_operations< typename make_storage_type< 1u, Signed
> >::type >
> + {
> + };
> +
> + #endif
> + #endif
> +
> ++#undef BOOST_ATOMIC_DETAIL_INT16_EXTENDED
> ++#undef BOOST_ATOMIC_DETAIL_INT32_EXTENDED
> ++#undef BOOST_ATOMIC_DETAIL_INT64_EXTENDED
> ++
> + BOOST_FORCEINLINE void thread_fence(memory_order order) BOOST_NOEXCEPT
> + {
> +
>  __atomic_thread_fence(atomics::detail::convert_memory_order_to_gcc(order));
> +--
> +1.8.5.5
> +
> diff --git a/meta/recipes-support/boost/boost_1.56.0.bb
> b/meta/recipes-support/boost/boost_1.56.0.bb
> index b199c88..dcc77bb 100644
> --- a/meta/recipes-support/boost/boost_1.56.0.bb
> +++ b/meta/recipes-support/boost/boost_1.56.0.bb
> @@ -1,4 +1,7 @@
>  include boost-${PV}.inc
>  include boost.inc
>
> -SRC_URI += "file://arm-intrinsics.patch"
> +SRC_URI += "\
> +    file://arm-intrinsics.patch \
> +
> file://0001-Added-support-for-extending-operations-to-GCC-atomic.patch;striplevel=2
> \
> +"
> --
> 1.8.5.5
>
>

--047d7b3a83143e4aa8050429f83e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It work for me on my s3c6410 board. The new image run with=
out exception.<div><br><span style=3D"font-family:arial,sans-serif;font-siz=
e:13px">Signed-off-by: Yi Qingliang=C2=A0</span><a href=3D"mailto:niqinglia=
ng2003@gmail.com" target=3D"_blank" style=3D"font-family:arial,sans-serif;f=
ont-size:13px">&lt;niqingliang2003@gmail.com&gt;</a><br></div></div><div cl=
ass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sun, Sep 28, 2014 at =
11:37 PM, Peter A. Bigot <span dir=3D"ltr">&lt;<a href=3D"mailto:pab@pabigo=
t.com" target=3D"_blank">pab@pabigot.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">meta-raspberrypi and some other systems are ARMv6k bu=
t tell OE that<br>
they&#39;re ARMv6 which doesn&#39;t fully support non-word atomics.=C2=A0 a=
rmv6k<br>
does, but Boost didn&#39;t handle the recognition correctly in the 1.56<br>
release.=C2=A0 Backport the patch that fixes the build.<br>
<br>
See: <a href=3D"https://svn.boost.org/trac/boost/ticket/10446" target=3D"_b=
lank">https://svn.boost.org/trac/boost/ticket/10446</a><br>
Signed-off-by: Peter A. Bigot &lt;<a href=3D"mailto:pab@pabigot.com">pab@pa=
bigot.com</a>&gt;<br>
---<br>
<br>
Note:<br>
<br>
I have only tested that this fixes the compile problems; I have not<br>
verified that the resulting library works correctly with respect to<br>
atomics.=C2=A0 I&#39;m expecting somebody who uses boost on a platform wher=
e this<br>
is relevant to validate the functional behavior if that&#39;s necessary.<br=
>
<br>
Cc: <a href=3D"mailto:niqingliang2003@gmail.com">niqingliang2003@gmail.com<=
/a><br>
Cc: <a href=3D"mailto:danismostlikely@gmail.com">danismostlikely@gmail.com<=
/a><br>
<br>
Peter<br>
<br>
=C2=A0...rt-for-extending-operations-to-GCC-atomic.patch | 412 ++++++++++++=
+++++++++<br>
=C2=A0meta/recipes-support/boost/<a href=3D"http://boost_1.56.0.bb" target=
=3D"_blank">boost_1.56.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A05 +-<br>
=C2=A02 files changed, 416 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-support/boost/boost/0001-Added-suppor=
t-for-extending-operations-to-GCC-atomic.patch<br>
<br>
diff --git a/meta/recipes-support/boost/boost/0001-Added-support-for-extend=
ing-operations-to-GCC-atomic.patch b/meta/recipes-support/boost/boost/0001-=
Added-support-for-extending-operations-to-GCC-atomic.patch<br>
new file mode 100644<br>
index 0000000..feece81<br>
--- /dev/null<br>
+++ b/meta/recipes-support/boost/boost/0001-Added-support-for-extending-ope=
rations-to-GCC-atomic.patch<br>
@@ -0,0 +1,412 @@<br>
+From 415db7054723291042e4ff1ffa8fdd5bc8b07163 Mon Sep 17 00:00:00 2001<br>
+From: Andrey Semashev &lt;<a href=3D"mailto:andrey.semashev@gmail.com">and=
rey.semashev@gmail.com</a>&gt;<br>
+Date: Sat, 27 Sep 2014 20:40:09 +0400<br>
+Subject: [PATCH] Added support for extending operations to GCC atomic back=
end.<br>
+<br>
+Fix for #10446. Some platforms (e.g. Raspberry Pi) only support atomic ops=
 of some particular size but not less. Use extending arithmetic operations =
for these platforms. Also, make sure bools are always treated as 8-bit valu=
es, even if the actual type is larger. This makes its use in atomic&lt;&gt;=
, atomic_flag and lock pool more consistent.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://svn.boost.org/trac/boost/tic=
ket/10446" target=3D"_blank">https://svn.boost.org/trac/boost/ticket/10446<=
/a>]<br>
+Signed-off-by: Peter A. Bigot &lt;<a href=3D"mailto:pab@pabigot.com">pab@p=
abigot.com</a>&gt;<br>
+<br>
+---<br>
+ include/boost/atomic/capabilities.hpp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A01 +<br>
+ include/boost/atomic/detail/atomic_template.hpp |=C2=A0 =C2=A02 +-<br>
+ include/boost/atomic/detail/caps_gcc_atomic.hpp |=C2=A0 82 +++++------<br=
>
+ include/boost/atomic/detail/ops_gcc_atomic.hpp=C2=A0 | 184 ++++++++++++++=
+++++++---<br>
+ 4 files changed, 206 insertions(+), 63 deletions(-)<br>
+<br>
+diff --git a/include/boost/atomic/capabilities.hpp b/include/boost/atomic/=
capabilities.hpp<br>
+index 658dd22..05bbb0f 100644<br>
+--- a/include/boost/atomic/capabilities.hpp<br>
++++ b/include/boost/atomic/capabilities.hpp<br>
+@@ -142,6 +142,7 @@<br>
+ #define BOOST_ATOMIC_ADDRESS_LOCK_FREE BOOST_ATOMIC_POINTER_LOCK_FREE<br>
+<br>
+ #ifndef BOOST_ATOMIC_BOOL_LOCK_FREE<br>
++// We store bools in 1-byte storage in all backends<br>
+ #define BOOST_ATOMIC_BOOL_LOCK_FREE BOOST_ATOMIC_INT8_LOCK_FREE<br>
+ #endif<br>
+<br>
+diff --git a/include/boost/atomic/detail/atomic_template.hpp b/include/boo=
st/atomic/detail/atomic_template.hpp<br>
+index 4fd6d79..bc3922a 100644<br>
+--- a/include/boost/atomic/detail/atomic_template.hpp<br>
++++ b/include/boost/atomic/detail/atomic_template.hpp<br>
+@@ -234,7 +234,7 @@ class base_atomic&lt; bool, int &gt;<br>
+ {<br>
+ private:<br>
+=C2=A0 =C2=A0 =C2=A0typedef bool value_type;<br>
+-=C2=A0 =C2=A0 typedef atomics::detail::operations&lt; storage_size_of&lt;=
 value_type &gt;::value, false &gt; operations;<br>
++=C2=A0 =C2=A0 typedef atomics::detail::operations&lt; 1u, false &gt; oper=
ations;<br>
+<br>
+ protected:<br>
+=C2=A0 =C2=A0 =C2=A0typedef value_type value_arg_type;<br>
+diff --git a/include/boost/atomic/detail/caps_gcc_atomic.hpp b/include/boo=
st/atomic/detail/caps_gcc_atomic.hpp<br>
+index 8299ad0..f4e7a70 100644<br>
+--- a/include/boost/atomic/detail/caps_gcc_atomic.hpp<br>
++++ b/include/boost/atomic/detail/caps_gcc_atomic.hpp<br>
+@@ -29,66 +29,48 @@<br>
+ #define BOOST_ATOMIC_DETAIL_X86_HAS_CMPXCHG16B 1<br>
+ #endif<br>
+<br>
+-#if __GCC_ATOMIC_BOOL_LOCK_FREE =3D=3D 2<br>
+-#define BOOST_ATOMIC_FLAG_LOCK_FREE 2<br>
+-#else<br>
+-#define BOOST_ATOMIC_FLAG_LOCK_FREE 0<br>
+-#endif<br>
+-#if __GCC_ATOMIC_CHAR_LOCK_FREE =3D=3D 2<br>
+-#define BOOST_ATOMIC_CHAR_LOCK_FREE 2<br>
+-#else<br>
+-#define BOOST_ATOMIC_CHAR_LOCK_FREE 0<br>
+-#endif<br>
+-#if __GCC_ATOMIC_CHAR16_T_LOCK_FREE =3D=3D 2<br>
+-#define BOOST_ATOMIC_CHAR16_T_LOCK_FREE 2<br>
+-#else<br>
+-#define BOOST_ATOMIC_CHAR16_T_LOCK_FREE 0<br>
+-#endif<br>
+-#if __GCC_ATOMIC_CHAR32_T_LOCK_FREE =3D=3D 2<br>
+-#define BOOST_ATOMIC_CHAR32_T_LOCK_FREE 2<br>
++#if defined(BOOST_ATOMIC_DETAIL_X86_HAS_CMPXCHG16B) &amp;&amp; (defined(B=
OOST_HAS_INT128) || !defined(BOOST_NO_ALIGNMENT))<br>
++#define BOOST_ATOMIC_INT128_LOCK_FREE 2<br>
+ #else<br>
+-#define BOOST_ATOMIC_CHAR32_T_LOCK_FREE 0<br>
++#define BOOST_ATOMIC_INT128_LOCK_FREE 0<br>
+ #endif<br>
+-#if __GCC_ATOMIC_WCHAR_T_LOCK_FREE =3D=3D 2<br>
+-#define BOOST_ATOMIC_WCHAR_T_LOCK_FREE 2<br>
++<br>
++#if __GCC_ATOMIC_LLONG_LOCK_FREE =3D=3D 2<br>
++#define BOOST_ATOMIC_LLONG_LOCK_FREE 2<br>
+ #else<br>
+-#define BOOST_ATOMIC_WCHAR_T_LOCK_FREE 0<br>
++#define BOOST_ATOMIC_LLONG_LOCK_FREE BOOST_ATOMIC_INT128_LOCK_FREE<br>
+ #endif<br>
+-#if __GCC_ATOMIC_SHORT_LOCK_FREE =3D=3D 2<br>
+-#define BOOST_ATOMIC_SHORT_LOCK_FREE 2<br>
++<br>
++#if __GCC_ATOMIC_LONG_LOCK_FREE =3D=3D 2<br>
++#define BOOST_ATOMIC_LONG_LOCK_FREE 2<br>
+ #else<br>
+-#define BOOST_ATOMIC_SHORT_LOCK_FREE 0<br>
++#define BOOST_ATOMIC_LONG_LOCK_FREE BOOST_ATOMIC_LLONG_LOCK_FREE<br>
+ #endif<br>
++<br>
+ #if __GCC_ATOMIC_INT_LOCK_FREE =3D=3D 2<br>
+ #define BOOST_ATOMIC_INT_LOCK_FREE 2<br>
+ #else<br>
+-#define BOOST_ATOMIC_INT_LOCK_FREE 0<br>
+-#endif<br>
+-#if __GCC_ATOMIC_LONG_LOCK_FREE =3D=3D 2<br>
+-#define BOOST_ATOMIC_LONG_LOCK_FREE 2<br>
+-#else<br>
+-#define BOOST_ATOMIC_LONG_LOCK_FREE 0<br>
++#define BOOST_ATOMIC_INT_LOCK_FREE BOOST_ATOMIC_LONG_LOCK_FREE<br>
+ #endif<br>
+-#if __GCC_ATOMIC_LLONG_LOCK_FREE =3D=3D 2<br>
+-#define BOOST_ATOMIC_LLONG_LOCK_FREE 2<br>
++<br>
++#if __GCC_ATOMIC_SHORT_LOCK_FREE =3D=3D 2<br>
++#define BOOST_ATOMIC_SHORT_LOCK_FREE 2<br>
+ #else<br>
+-#define BOOST_ATOMIC_LLONG_LOCK_FREE 0<br>
++#define BOOST_ATOMIC_SHORT_LOCK_FREE BOOST_ATOMIC_INT_LOCK_FREE<br>
+ #endif<br>
+-#if defined(BOOST_ATOMIC_DETAIL_X86_HAS_CMPXCHG16B) &amp;&amp; (defined(B=
OOST_HAS_INT128) || !defined(BOOST_NO_ALIGNMENT))<br>
+-#define BOOST_ATOMIC_INT128_LOCK_FREE 2<br>
++<br>
++#if __GCC_ATOMIC_CHAR_LOCK_FREE =3D=3D 2<br>
++#define BOOST_ATOMIC_CHAR_LOCK_FREE 2<br>
+ #else<br>
+-#define BOOST_ATOMIC_INT128_LOCK_FREE 0<br>
++#define BOOST_ATOMIC_CHAR_LOCK_FREE BOOST_ATOMIC_SHORT_LOCK_FREE<br>
+ #endif<br>
++<br>
+ #if __GCC_ATOMIC_POINTER_LOCK_FREE =3D=3D 2<br>
+ #define BOOST_ATOMIC_POINTER_LOCK_FREE 2<br>
+ #else<br>
+ #define BOOST_ATOMIC_POINTER_LOCK_FREE 0<br>
+ #endif<br>
+-#if __GCC_ATOMIC_BOOL_LOCK_FREE =3D=3D 2<br>
+-#define BOOST_ATOMIC_BOOL_LOCK_FREE 2<br>
+-#else<br>
+-#define BOOST_ATOMIC_BOOL_LOCK_FREE 0<br>
+-#endif<br>
++<br>
+<br>
+ #define BOOST_ATOMIC_INT8_LOCK_FREE BOOST_ATOMIC_CHAR_LOCK_FREE<br>
+<br>
+@@ -128,6 +110,24 @@<br>
+ #define BOOST_ATOMIC_INT64_LOCK_FREE 0<br>
+ #endif<br>
+<br>
++<br>
++#if __GCC_ATOMIC_WCHAR_T_LOCK_FREE =3D=3D 2<br>
++#define BOOST_ATOMIC_WCHAR_T_LOCK_FREE 2<br>
++#elif BOOST_ATOMIC_DETAIL_SIZEOF_WCHAR_T =3D=3D 8<br>
++#define BOOST_ATOMIC_WCHAR_T_LOCK_FREE BOOST_ATOMIC_INT64_LOCK_FREE<br>
++#elif BOOST_ATOMIC_DETAIL_SIZEOF_WCHAR_T =3D=3D 4<br>
++#define BOOST_ATOMIC_WCHAR_T_LOCK_FREE BOOST_ATOMIC_INT32_LOCK_FREE<br>
++#elif BOOST_ATOMIC_DETAIL_SIZEOF_WCHAR_T =3D=3D 2<br>
++#define BOOST_ATOMIC_WCHAR_T_LOCK_FREE BOOST_ATOMIC_INT16_LOCK_FREE<br>
++#elif BOOST_ATOMIC_DETAIL_SIZEOF_WCHAR_T =3D=3D 1<br>
++#define BOOST_ATOMIC_WCHAR_T_LOCK_FREE BOOST_ATOMIC_INT8_LOCK_FREE<br>
++#else<br>
++#define BOOST_ATOMIC_WCHAR_T_LOCK_FREE 0<br>
++#endif<br>
++<br>
++#define BOOST_ATOMIC_CHAR32_T_LOCK_FREE BOOST_ATOMIC_INT32_LOCK_FREE<br>
++#define BOOST_ATOMIC_CHAR16_T_LOCK_FREE BOOST_ATOMIC_INT16_LOCK_FREE<br>
++<br>
+ #define BOOST_ATOMIC_THREAD_FENCE 2<br>
+ #define BOOST_ATOMIC_SIGNAL_FENCE 2<br>
+<br>
+diff --git a/include/boost/atomic/detail/ops_gcc_atomic.hpp b/include/boos=
t/atomic/detail/ops_gcc_atomic.hpp<br>
+index 2297791..2e4c37b 100644<br>
+--- a/include/boost/atomic/detail/ops_gcc_atomic.hpp<br>
++++ b/include/boost/atomic/detail/ops_gcc_atomic.hpp<br>
+@@ -24,6 +24,15 @@<br>
+ #include &lt;boost/atomic/detail/ops_cas_based.hpp&gt;<br>
+ #endif<br>
+<br>
++#if __GCC_ATOMIC_LLONG_LOCK_FREE !=3D BOOST_ATOMIC_LLONG_LOCK_FREE || __G=
CC_ATOMIC_LONG_LOCK_FREE !=3D BOOST_ATOMIC_LONG_LOCK_FREE ||\<br>
++=C2=A0 =C2=A0 __GCC_ATOMIC_INT_LOCK_FREE !=3D BOOST_ATOMIC_INT_LOCK_FREE =
|| __GCC_ATOMIC_SHORT_LOCK_FREE !=3D BOOST_ATOMIC_SHORT_LOCK_FREE ||\<br>
++=C2=A0 =C2=A0 __GCC_ATOMIC_CHAR_LOCK_FREE !=3D BOOST_ATOMIC_CHAR_LOCK_FRE=
E || __GCC_ATOMIC_BOOL_LOCK_FREE !=3D BOOST_ATOMIC_BOOL_LOCK_FREE ||\<br>
++=C2=A0 =C2=A0 __GCC_ATOMIC_WCHAR_T_LOCK_FREE !=3D BOOST_ATOMIC_WCHAR_T_LO=
CK_FREE<br>
++// There are platforms where we need to use larger storage types<br>
++#include &lt;boost/atomic/detail/int_sizes.hpp&gt;<br>
++#include &lt;boost/atomic/detail/ops_extending_cas_based.hpp&gt;<br>
++#endif<br>
++<br>
+ #ifdef BOOST_HAS_PRAGMA_ONCE<br>
+ #pragma once<br>
+ #endif<br>
+@@ -154,73 +163,206 @@ struct gcc_atomic_operations<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ };<br>
+<br>
+-#if BOOST_ATOMIC_INT8_LOCK_FREE &gt; 0<br>
++#if BOOST_ATOMIC_INT128_LOCK_FREE &gt; 0<br>
++#if defined(__clang__) &amp;&amp; defined(BOOST_ATOMIC_DETAIL_X86_HAS_CMP=
XCHG16B)<br>
++<br>
++// Workaround for clang bug: <a href=3D"http://llvm.org/bugs/show_bug.cgi=
?id=3D19149" target=3D"_blank">http://llvm.org/bugs/show_bug.cgi?id=3D19149=
</a><br>
++// Clang 3.4 does not implement 128-bit __atomic* intrinsics even though =
it defines __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16<br>
+ template&lt; bool Signed &gt;<br>
+-struct operations&lt; 1u, Signed &gt; :<br>
+-=C2=A0 =C2=A0 public gcc_atomic_operations&lt; typename make_storage_type=
&lt; 1u, Signed &gt;::type &gt;<br>
++struct operations&lt; 16u, Signed &gt; :<br>
++=C2=A0 =C2=A0 public cas_based_operations&lt; gcc_dcas_x86_64&lt; Signed =
&gt; &gt;<br>
+ {<br>
+ };<br>
++<br>
++#else<br>
++<br>
++template&lt; bool Signed &gt;<br>
++struct operations&lt; 16u, Signed &gt; :<br>
++=C2=A0 =C2=A0 public gcc_atomic_operations&lt; typename make_storage_type=
&lt; 16u, Signed &gt;::type &gt;<br>
++{<br>
++};<br>
++<br>
++#endif<br>
+ #endif<br>
+<br>
+-#if BOOST_ATOMIC_INT16_LOCK_FREE &gt; 0<br>
++<br>
++#if BOOST_ATOMIC_INT64_LOCK_FREE &gt; 0<br>
++#if defined(__clang__) &amp;&amp; defined(BOOST_ATOMIC_DETAIL_X86_HAS_CMP=
XCHG8B)<br>
++<br>
++// Workaround for clang bug <a href=3D"http://llvm.org/bugs/show_bug.cgi?=
id=3D19355" target=3D"_blank">http://llvm.org/bugs/show_bug.cgi?id=3D19355<=
/a><br>
+ template&lt; bool Signed &gt;<br>
+-struct operations&lt; 2u, Signed &gt; :<br>
+-=C2=A0 =C2=A0 public gcc_atomic_operations&lt; typename make_storage_type=
&lt; 2u, Signed &gt;::type &gt;<br>
++struct operations&lt; 8u, Signed &gt; :<br>
++=C2=A0 =C2=A0 public cas_based_operations&lt; gcc_dcas_x86&lt; Signed &gt=
; &gt;<br>
++{<br>
++};<br>
++<br>
++#elif (BOOST_ATOMIC_DETAIL_SIZEOF_LLONG =3D=3D 8 &amp;&amp; __GCC_ATOMIC_=
LLONG_LOCK_FREE !=3D BOOST_ATOMIC_LLONG_LOCK_FREE) ||\<br>
++=C2=A0 =C2=A0 (BOOST_ATOMIC_DETAIL_SIZEOF_LONG =3D=3D 8 &amp;&amp; __GCC_=
ATOMIC_LONG_LOCK_FREE !=3D BOOST_ATOMIC_LONG_LOCK_FREE) ||\<br>
++=C2=A0 =C2=A0 (BOOST_ATOMIC_DETAIL_SIZEOF_INT =3D=3D 8 &amp;&amp; __GCC_A=
TOMIC_INT_LOCK_FREE !=3D BOOST_ATOMIC_INT_LOCK_FREE) ||\<br>
++=C2=A0 =C2=A0 (BOOST_ATOMIC_DETAIL_SIZEOF_SHORT =3D=3D 8 &amp;&amp; __GCC=
_ATOMIC_SHORT_LOCK_FREE !=3D BOOST_ATOMIC_SHORT_LOCK_FREE) ||\<br>
++=C2=A0 =C2=A0 (BOOST_ATOMIC_DETAIL_SIZEOF_WCHAR_T =3D=3D 8 &amp;&amp; __G=
CC_ATOMIC_WCHAR_T_LOCK_FREE !=3D BOOST_ATOMIC_WCHAR_T_LOCK_FREE)<br>
++<br>
++#define BOOST_ATOMIC_DETAIL_INT64_EXTENDED<br>
++<br>
++template&lt; bool Signed &gt;<br>
++struct operations&lt; 8u, Signed &gt; :<br>
++=C2=A0 =C2=A0 public extending_cas_based_operations&lt; gcc_atomic_operat=
ions&lt; typename make_storage_type&lt; 16u, Signed &gt;::type &gt;, 8u, Si=
gned &gt;<br>
+ {<br>
+ };<br>
++<br>
++#else<br>
++<br>
++template&lt; bool Signed &gt;<br>
++struct operations&lt; 8u, Signed &gt; :<br>
++=C2=A0 =C2=A0 public gcc_atomic_operations&lt; typename make_storage_type=
&lt; 8u, Signed &gt;::type &gt;<br>
++{<br>
++};<br>
++<br>
++#endif<br>
+ #endif<br>
+<br>
+ #if BOOST_ATOMIC_INT32_LOCK_FREE &gt; 0<br>
++#if (BOOST_ATOMIC_DETAIL_SIZEOF_LLONG =3D=3D 4 &amp;&amp; __GCC_ATOMIC_LL=
ONG_LOCK_FREE !=3D BOOST_ATOMIC_LLONG_LOCK_FREE) ||\<br>
++=C2=A0 =C2=A0 (BOOST_ATOMIC_DETAIL_SIZEOF_LONG =3D=3D 4 &amp;&amp; __GCC_=
ATOMIC_LONG_LOCK_FREE !=3D BOOST_ATOMIC_LONG_LOCK_FREE) ||\<br>
++=C2=A0 =C2=A0 (BOOST_ATOMIC_DETAIL_SIZEOF_INT =3D=3D 4 &amp;&amp; __GCC_A=
TOMIC_INT_LOCK_FREE !=3D BOOST_ATOMIC_INT_LOCK_FREE) ||\<br>
++=C2=A0 =C2=A0 (BOOST_ATOMIC_DETAIL_SIZEOF_SHORT =3D=3D 4 &amp;&amp; __GCC=
_ATOMIC_SHORT_LOCK_FREE !=3D BOOST_ATOMIC_SHORT_LOCK_FREE) ||\<br>
++=C2=A0 =C2=A0 (BOOST_ATOMIC_DETAIL_SIZEOF_WCHAR_T =3D=3D 4 &amp;&amp; __G=
CC_ATOMIC_WCHAR_T_LOCK_FREE !=3D BOOST_ATOMIC_WCHAR_T_LOCK_FREE)<br>
++<br>
++#define BOOST_ATOMIC_DETAIL_INT32_EXTENDED<br>
++<br>
++#if !defined(BOOST_ATOMIC_DETAIL_INT64_EXTENDED)<br>
++<br>
++template&lt; bool Signed &gt;<br>
++struct operations&lt; 4u, Signed &gt; :<br>
++=C2=A0 =C2=A0 public extending_cas_based_operations&lt; gcc_atomic_operat=
ions&lt; typename make_storage_type&lt; 8u, Signed &gt;::type &gt;, 4u, Sig=
ned &gt;<br>
++{<br>
++};<br>
++<br>
++#else // !defined(BOOST_ATOMIC_DETAIL_INT64_EXTENDED)<br>
++<br>
++template&lt; bool Signed &gt;<br>
++struct operations&lt; 4u, Signed &gt; :<br>
++=C2=A0 =C2=A0 public extending_cas_based_operations&lt; gcc_atomic_operat=
ions&lt; typename make_storage_type&lt; 16u, Signed &gt;::type &gt;, 4u, Si=
gned &gt;<br>
++{<br>
++};<br>
++<br>
++#endif // !defined(BOOST_ATOMIC_DETAIL_INT64_EXTENDED)<br>
++<br>
++#else<br>
++<br>
+ template&lt; bool Signed &gt;<br>
+ struct operations&lt; 4u, Signed &gt; :<br>
+=C2=A0 =C2=A0 =C2=A0public gcc_atomic_operations&lt; typename make_storage=
_type&lt; 4u, Signed &gt;::type &gt;<br>
+ {<br>
+ };<br>
++<br>
++#endif<br>
+ #endif<br>
+<br>
+-#if BOOST_ATOMIC_INT64_LOCK_FREE &gt; 0<br>
+-#if defined(__clang__) &amp;&amp; defined(BOOST_ATOMIC_DETAIL_X86_HAS_CMP=
XCHG8B)<br>
++#if BOOST_ATOMIC_INT16_LOCK_FREE &gt; 0<br>
++#if (BOOST_ATOMIC_DETAIL_SIZEOF_LLONG =3D=3D 2 &amp;&amp; __GCC_ATOMIC_LL=
ONG_LOCK_FREE !=3D BOOST_ATOMIC_LLONG_LOCK_FREE) ||\<br>
++=C2=A0 =C2=A0 (BOOST_ATOMIC_DETAIL_SIZEOF_LONG =3D=3D 2 &amp;&amp; __GCC_=
ATOMIC_LONG_LOCK_FREE !=3D BOOST_ATOMIC_LONG_LOCK_FREE) ||\<br>
++=C2=A0 =C2=A0 (BOOST_ATOMIC_DETAIL_SIZEOF_INT =3D=3D 2 &amp;&amp; __GCC_A=
TOMIC_INT_LOCK_FREE !=3D BOOST_ATOMIC_INT_LOCK_FREE) ||\<br>
++=C2=A0 =C2=A0 (BOOST_ATOMIC_DETAIL_SIZEOF_SHORT =3D=3D 2 &amp;&amp; __GCC=
_ATOMIC_SHORT_LOCK_FREE !=3D BOOST_ATOMIC_SHORT_LOCK_FREE) ||\<br>
++=C2=A0 =C2=A0 (BOOST_ATOMIC_DETAIL_SIZEOF_WCHAR_T =3D=3D 2 &amp;&amp; __G=
CC_ATOMIC_WCHAR_T_LOCK_FREE !=3D BOOST_ATOMIC_WCHAR_T_LOCK_FREE)<br>
++<br>
++#define BOOST_ATOMIC_DETAIL_INT16_EXTENDED<br>
++<br>
++#if !defined(BOOST_ATOMIC_DETAIL_INT32_EXTENDED)<br>
+<br>
+-// Workaround for clang bug <a href=3D"http://llvm.org/bugs/show_bug.cgi?=
id=3D19355" target=3D"_blank">http://llvm.org/bugs/show_bug.cgi?id=3D19355<=
/a><br>
+ template&lt; bool Signed &gt;<br>
+-struct operations&lt; 8u, Signed &gt; :<br>
+-=C2=A0 =C2=A0 public cas_based_operations&lt; gcc_dcas_x86&lt; Signed &gt=
; &gt;<br>
++struct operations&lt; 2u, Signed &gt; :<br>
++=C2=A0 =C2=A0 public extending_cas_based_operations&lt; gcc_atomic_operat=
ions&lt; typename make_storage_type&lt; 4u, Signed &gt;::type &gt;, 2u, Sig=
ned &gt;<br>
++{<br>
++};<br>
++<br>
++#elif !defined(BOOST_ATOMIC_DETAIL_INT64_EXTENDED)<br>
++<br>
++template&lt; bool Signed &gt;<br>
++struct operations&lt; 2u, Signed &gt; :<br>
++=C2=A0 =C2=A0 public extending_cas_based_operations&lt; gcc_atomic_operat=
ions&lt; typename make_storage_type&lt; 8u, Signed &gt;::type &gt;, 2u, Sig=
ned &gt;<br>
+ {<br>
+ };<br>
+<br>
+ #else<br>
+<br>
+ template&lt; bool Signed &gt;<br>
+-struct operations&lt; 8u, Signed &gt; :<br>
+-=C2=A0 =C2=A0 public gcc_atomic_operations&lt; typename make_storage_type=
&lt; 8u, Signed &gt;::type &gt;<br>
++struct operations&lt; 2u, Signed &gt; :<br>
++=C2=A0 =C2=A0 public extending_cas_based_operations&lt; gcc_atomic_operat=
ions&lt; typename make_storage_type&lt; 16u, Signed &gt;::type &gt;, 2u, Si=
gned &gt;<br>
++{<br>
++};<br>
++<br>
++#endif<br>
++<br>
++#else<br>
++<br>
++template&lt; bool Signed &gt;<br>
++struct operations&lt; 2u, Signed &gt; :<br>
++=C2=A0 =C2=A0 public gcc_atomic_operations&lt; typename make_storage_type=
&lt; 2u, Signed &gt;::type &gt;<br>
+ {<br>
+ };<br>
+<br>
+ #endif<br>
+ #endif<br>
+<br>
+-#if BOOST_ATOMIC_INT128_LOCK_FREE &gt; 0<br>
+-#if defined(__clang__) &amp;&amp; defined(BOOST_ATOMIC_DETAIL_X86_HAS_CMP=
XCHG16B)<br>
++#if BOOST_ATOMIC_INT8_LOCK_FREE &gt; 0<br>
++#if (BOOST_ATOMIC_DETAIL_SIZEOF_LLONG =3D=3D 1 &amp;&amp; __GCC_ATOMIC_LL=
ONG_LOCK_FREE !=3D BOOST_ATOMIC_LLONG_LOCK_FREE) ||\<br>
++=C2=A0 =C2=A0 (BOOST_ATOMIC_DETAIL_SIZEOF_LONG =3D=3D 1 &amp;&amp; __GCC_=
ATOMIC_LONG_LOCK_FREE !=3D BOOST_ATOMIC_LONG_LOCK_FREE) ||\<br>
++=C2=A0 =C2=A0 (BOOST_ATOMIC_DETAIL_SIZEOF_INT =3D=3D 1 &amp;&amp; __GCC_A=
TOMIC_INT_LOCK_FREE !=3D BOOST_ATOMIC_INT_LOCK_FREE) ||\<br>
++=C2=A0 =C2=A0 (BOOST_ATOMIC_DETAIL_SIZEOF_SHORT =3D=3D 1 &amp;&amp; __GCC=
_ATOMIC_SHORT_LOCK_FREE !=3D BOOST_ATOMIC_SHORT_LOCK_FREE) ||\<br>
++=C2=A0 =C2=A0 (BOOST_ATOMIC_DETAIL_SIZEOF_WCHAR_T =3D=3D 1 &amp;&amp; __G=
CC_ATOMIC_WCHAR_T_LOCK_FREE !=3D BOOST_ATOMIC_WCHAR_T_LOCK_FREE) ||\<br>
++=C2=A0 =C2=A0 (__GCC_ATOMIC_CHAR_LOCK_FREE !=3D BOOST_ATOMIC_CHAR_LOCK_FR=
EE) ||\<br>
++=C2=A0 =C2=A0 (__GCC_ATOMIC_BOOL_LOCK_FREE !=3D BOOST_ATOMIC_BOOL_LOCK_FR=
EE)<br>
++<br>
++#if !defined(BOOST_ATOMIC_DETAIL_INT16_EXTENDED)<br>
+<br>
+-// Workaround for clang bug: <a href=3D"http://llvm.org/bugs/show_bug.cgi=
?id=3D19149" target=3D"_blank">http://llvm.org/bugs/show_bug.cgi?id=3D19149=
</a><br>
+-// Clang 3.4 does not implement 128-bit __atomic* intrinsics even though =
it defines __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16<br>
+ template&lt; bool Signed &gt;<br>
+-struct operations&lt; 16u, Signed &gt; :<br>
+-=C2=A0 =C2=A0 public cas_based_operations&lt; gcc_dcas_x86_64&lt; Signed =
&gt; &gt;<br>
++struct operations&lt; 1u, Signed &gt; :<br>
++=C2=A0 =C2=A0 public extending_cas_based_operations&lt; gcc_atomic_operat=
ions&lt; typename make_storage_type&lt; 2u, Signed &gt;::type &gt;, 1u, Sig=
ned &gt;<br>
++{<br>
++};<br>
++<br>
++#elif !defined(BOOST_ATOMIC_DETAIL_INT32_EXTENDED)<br>
++<br>
++template&lt; bool Signed &gt;<br>
++struct operations&lt; 1u, Signed &gt; :<br>
++=C2=A0 =C2=A0 public extending_cas_based_operations&lt; gcc_atomic_operat=
ions&lt; typename make_storage_type&lt; 4u, Signed &gt;::type &gt;, 1u, Sig=
ned &gt;<br>
++{<br>
++};<br>
++<br>
++#elif !defined(BOOST_ATOMIC_DETAIL_INT64_EXTENDED)<br>
++<br>
++template&lt; bool Signed &gt;<br>
++struct operations&lt; 1u, Signed &gt; :<br>
++=C2=A0 =C2=A0 public extending_cas_based_operations&lt; gcc_atomic_operat=
ions&lt; typename make_storage_type&lt; 8u, Signed &gt;::type &gt;, 1u, Sig=
ned &gt;<br>
+ {<br>
+ };<br>
+<br>
+ #else<br>
+<br>
+ template&lt; bool Signed &gt;<br>
+-struct operations&lt; 16u, Signed &gt; :<br>
+-=C2=A0 =C2=A0 public gcc_atomic_operations&lt; typename make_storage_type=
&lt; 16u, Signed &gt;::type &gt;<br>
++struct operations&lt; 1u, Signed &gt; :<br>
++=C2=A0 =C2=A0 public extending_cas_based_operations&lt; gcc_atomic_operat=
ions&lt; typename make_storage_type&lt; 16u, Signed &gt;::type &gt;, 1u, Si=
gned &gt;<br>
++{<br>
++};<br>
++<br>
++#endif<br>
++<br>
++#else<br>
++<br>
++template&lt; bool Signed &gt;<br>
++struct operations&lt; 1u, Signed &gt; :<br>
++=C2=A0 =C2=A0 public gcc_atomic_operations&lt; typename make_storage_type=
&lt; 1u, Signed &gt;::type &gt;<br>
+ {<br>
+ };<br>
+<br>
+ #endif<br>
+ #endif<br>
+<br>
++#undef BOOST_ATOMIC_DETAIL_INT16_EXTENDED<br>
++#undef BOOST_ATOMIC_DETAIL_INT32_EXTENDED<br>
++#undef BOOST_ATOMIC_DETAIL_INT64_EXTENDED<br>
++<br>
+ BOOST_FORCEINLINE void thread_fence(memory_order order) BOOST_NOEXCEPT<br=
>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0__atomic_thread_fence(atomics::detail::convert_memory_=
order_to_gcc(order));<br>
+--<br>
+1.8.5.5<br>
+<br>
diff --git a/meta/recipes-support/boost/<a href=3D"http://boost_1.56.0.bb" =
target=3D"_blank">boost_1.56.0.bb</a> b/meta/recipes-support/boost/<a href=
=3D"http://boost_1.56.0.bb" target=3D"_blank">boost_1.56.0.bb</a><br>
index b199c88..dcc77bb 100644<br>
--- a/meta/recipes-support/boost/<a href=3D"http://boost_1.56.0.bb" target=
=3D"_blank">boost_1.56.0.bb</a><br>
+++ b/meta/recipes-support/boost/<a href=3D"http://boost_1.56.0.bb" target=
=3D"_blank">boost_1.56.0.bb</a><br>
@@ -1,4 +1,7 @@<br>
=C2=A0include boost-${PV}.inc<br>
=C2=A0include boost.inc<br>
<br>
-SRC_URI +=3D &quot;file://arm-intrinsics.patch&quot;<br>
+SRC_URI +=3D &quot;\<br>
+=C2=A0 =C2=A0 file://arm-intrinsics.patch \<br>
+=C2=A0 =C2=A0 file://0001-Added-support-for-extending-operations-to-GCC-at=
omic.patch;striplevel=3D2 \<br>
+&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.8.5.5<br>
<br>
</font></span></blockquote></div><br></div>

--047d7b3a83143e4aa8050429f83e--
