Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8EBAF7568E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 04:53:57 +0000 (UTC)
Received: by igbyr2 with SMTP id yr2so103090920igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 21:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=1yd30eW5oL0XE2NmLX6YJqcCAmWfYIny+8tqz5toWPo=;
	b=cI+3Fbi+srlDZTpEBo05T6PQ45JNmwEMCaUMWnfpWFcgWkYEVna3oViaWtz+9T02tB
	NOtpULLNjLyFV4/EambFhzagNVUP6hPfG696rArHdD4CNNH8EC+wMmkLKNH48Uvm4lWk
	t49LL4NBzjyjZwMixyTjSOPqyBwT2tPm8Vz6f6JvUyI2161PkgLBzF8RSvZG128RnxUH
	OhWlm7SLXZzTluHtFIp0JF1NSkWUpDHk7DWvMSxSnOecV/AemlPnXZfAYPvJM9bZrAuK
	AbitIzFoZR+Y2zhThx/R4px0twfr04xIk+Jk1jqRTDYR1hm+iUFtrw55NClrA2cF08lN
	RhOQ==
X-Received: by 10.50.43.137 with SMTP id w9mr16469357igl.30.1432788838832;
	Wed, 27 May 2015 21:53:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.112.34 with HTTP; Wed, 27 May 2015 21:53:28 -0700 (PDT)
In-Reply-To: <2E240E9F-CA5F-46EF-B99E-CD5EEAAC7797@gmail.com>
References: <cover.1432324432.git.raj.khem@gmail.com>
	<29648ea4a7ec6d1d02cca78e9268e1629ee20fe9.1432324432.git.raj.khem@gmail.com>
	<2E240E9F-CA5F-46EF-B99E-CD5EEAAC7797@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 May 2015 21:53:28 -0700
Message-ID: <CAMKF1soX9KMzPnrC0SdeVoF9X48MUjZ_8DHnH_NW4E06fTMgyw@mail.gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] openssl: Fix build with gcc5 on mips64
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
X-List-Received-Date: Thu, 28 May 2015 04:54:01 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 25, 2015 at 12:22 PM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> On May 22, 2015 9:56:51 PM GMT+02:00, Khem Raj <raj.khem@gmail.com> wrote:
>>Patch is submitted upstream as well
>>
>>Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>---
>>...ine-GCC_VERSION-macro-to-cover-upto-gcc-5.patch | 53
>>++++++++++++++++++++++
>> .../recipes-connectivity/openssl/openssl_1.0.2a.bb |  1 +
>> 2 files changed, 54 insertions(+)
>>create mode 100644
>>meta/recipes-connectivity/openssl/openssl/0001-Define-GCC_VERSION-macro-to-cover-upto-gcc-5.patch
>>
>>diff --git
>>a/meta/recipes-connectivity/openssl/openssl/0001-Define-GCC_VERSION-macro-to-cover-upto-gcc-5.patch
>>b/meta/recipes-connectivity/openssl/openssl/0001-Define-GCC_VERSION-macro-to-cover-upto-gcc-5.patch
>>new file mode 100644
>>index 0000000..46d1adf
>>--- /dev/null
>>+++
>>b/meta/recipes-connectivity/openssl/openssl/0001-Define-GCC_VERSION-macro-to-cover-upto-gcc-5.patch
>>@@ -0,0 +1,53 @@
>>+From 0aa68f7681a74f6ff80a80c5843bc35e5effffb9 Mon Sep 17 00:00:00 2001
>>+From: Khem Raj <raj.khem@gmail.com>
>>+Date: Fri, 22 May 2015 12:43:39 -0700
>>+Subject: [PATCH] Define GCC_VERSION macro to cover upto gcc-5
>>+
>>+Current check is limited to gcc 4 with minor versions
>>+but when we use gcc 5.1, then minor version check fails
>>+with current setup and we end up with build errors like
>>+
>>+| In file included from bn_div.c:62:0:
>>+| bn_div.c: In function 'BN_div':
>>+| bn_lcl.h:311:9: error: impossible constraint in 'asm'
>>+|          asm ("dmultu    %2,%3"          \
>>+|          ^
>>+| bn_div.c:402:13: note: in expansion of macro 'BN_UMULT_LOHI'
>>+|              BN_UMULT_LOHI(t2l, t2h, d1, q);
>>+|              ^
>>+| <builtin>: recipe for target 'bn_div.o' failed
>>+| make[2]: *** [bn_div.o] Error 1
>>+
>>+Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>+
>>+---
>>+Upstream-Status: [Submitted]
>>+ crypto/bn/bn_lcl.h | 5 ++++-
>>+ 1 file changed, 4 insertions(+), 1 deletion(-)
>>+
>>+diff --git a/crypto/bn/bn_lcl.h b/crypto/bn/bn_lcl.h
>>+index 196df7e..e801ba7 100644
>>+--- a/crypto/bn/bn_lcl.h
>>++++ b/crypto/bn/bn_lcl.h
>>+@@ -118,6 +118,9 @@
>>+ extern "C" {
>>+ #endif
>>+
>>++#define GCC_VERSION (__GNUC__ * 10000 \
>>++                     + __GNUC_MINOR__ * 100 \
>>++                     + __GNUC_PATCHLEVEL__)
>>+ /*-
>>+  * Bignum consistency macros
>>+  * There is one "API" macro, bn_fix_top(), for stripping leading
>>zeroes from
>>+@@ -443,7 +446,7 @@ unsigned __int64 _umul128(unsigned __int64 a,
>>unsigned __int64 b,
>>+ #   endif
>>+ #  elif defined(__mips) && (defined(SIXTY_FOUR_BIT) ||
>>defined(SIXTY_FOUR_BIT_LONG))
>>+ #   if defined(__GNUC__) && __GNUC__>=2
>>+-#    if __GNUC__>=4 && __GNUC_MINOR__>=4
>>++#    if GCC_VERSION > 40400
>
> Not that it would really matter nowadays, but this should likely be >=

you are right, I have sent another patch which actually is a backport
of what was applied upstream

