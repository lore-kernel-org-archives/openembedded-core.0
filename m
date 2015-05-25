Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 446F96AC95
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 May 2015 19:22:09 +0000 (UTC)
Received: by wizk4 with SMTP id k4so56030831wiz.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 May 2015 12:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type:subject:from:date:to
	:message-id; bh=0jy/8rfLf9cA1OkQd+U9D72D40haO7rFrpkNHNDG2ZI=;
	b=s3U4FYWjLvMa310xhnrmD+x4GWlNiZ8LjtrvsHzipaJIMSAN+NnlYnTyUrGFCKfG25
	qb66xzd0RbiGPwr+3ePiIx2x1duuBmzDBd49ulFDgUkPCRsLYx6nQEgu3V2N/eJ/gAV+
	W/OheOxZsXb9NpeqDDvI+Xh/X9J7b4SRljiy/VNALLsHiCx7Jwk1RizSnYRxDymMSAC1
	cBIttIOhyxjE4RRxirnctoIfr1D+cYxcgpDyD2h9ECeDXt/T2Qkqh+jU9jH6U0P4YTTJ
	5B/Nkxt0GQz0sRiBzoEETtY5+QK+UC5AEc6S4qsyWNM/QzPNe5LrpmlP9zTnT+p00ZKB
	K2KA==
X-Received: by 10.180.187.232 with SMTP id fv8mr34661299wic.28.1432581730663; 
	Mon, 25 May 2015 12:22:10 -0700 (PDT)
Received: from [10.42.80.36] (089144194036.atnat0003.highway.a1.net.
	[89.144.194.36]) by mx.google.com with ESMTPSA id
	fa8sm13272266wib.14.2015.05.25.12.22.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 May 2015 12:22:09 -0700 (PDT)
User-Agent: K-9 Mail for Android
In-Reply-To: <29648ea4a7ec6d1d02cca78e9268e1629ee20fe9.1432324432.git.raj.khem@gmail.com>
References: <cover.1432324432.git.raj.khem@gmail.com>
	<29648ea4a7ec6d1d02cca78e9268e1629ee20fe9.1432324432.git.raj.khem@gmail.com>
MIME-Version: 1.0
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Mon, 25 May 2015 21:22:03 +0200
To: Khem Raj <raj.khem@gmail.com>,openembedded-core@lists.openembedded.org
Message-ID: <2E240E9F-CA5F-46EF-B99E-CD5EEAAC7797@gmail.com>
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
X-List-Received-Date: Mon, 25 May 2015 19:22:12 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

On May 22, 2015 9:56:51 PM GMT+02:00, Khem Raj <raj.khem@gmail.com> wrote:
>Patch is submitted upstream as well
>
>Signed-off-by: Khem Raj <raj.khem@gmail.com>
>---
>...ine-GCC_VERSION-macro-to-cover-upto-gcc-5.patch | 53
>++++++++++++++++++++++
> .../recipes-connectivity/openssl/openssl_1.0.2a.bb |  1 +
> 2 files changed, 54 insertions(+)
>create mode 100644
>meta/recipes-connectivity/openssl/openssl/0001-Define-GCC_VERSION-macro-to-cover-upto-gcc-5.patch
>
>diff --git
>a/meta/recipes-connectivity/openssl/openssl/0001-Define-GCC_VERSION-macro-to-cover-upto-gcc-5.patch
>b/meta/recipes-connectivity/openssl/openssl/0001-Define-GCC_VERSION-macro-to-cover-upto-gcc-5.patch
>new file mode 100644
>index 0000000..46d1adf
>--- /dev/null
>+++
>b/meta/recipes-connectivity/openssl/openssl/0001-Define-GCC_VERSION-macro-to-cover-upto-gcc-5.patch
>@@ -0,0 +1,53 @@
>+From 0aa68f7681a74f6ff80a80c5843bc35e5effffb9 Mon Sep 17 00:00:00 2001
>+From: Khem Raj <raj.khem@gmail.com>
>+Date: Fri, 22 May 2015 12:43:39 -0700
>+Subject: [PATCH] Define GCC_VERSION macro to cover upto gcc-5
>+
>+Current check is limited to gcc 4 with minor versions
>+but when we use gcc 5.1, then minor version check fails
>+with current setup and we end up with build errors like
>+
>+| In file included from bn_div.c:62:0:
>+| bn_div.c: In function 'BN_div':
>+| bn_lcl.h:311:9: error: impossible constraint in 'asm'
>+|          asm ("dmultu    %2,%3"          \
>+|          ^
>+| bn_div.c:402:13: note: in expansion of macro 'BN_UMULT_LOHI'
>+|              BN_UMULT_LOHI(t2l, t2h, d1, q);
>+|              ^
>+| <builtin>: recipe for target 'bn_div.o' failed
>+| make[2]: *** [bn_div.o] Error 1
>+
>+Signed-off-by: Khem Raj <raj.khem@gmail.com>
>+
>+---
>+Upstream-Status: [Submitted]
>+ crypto/bn/bn_lcl.h | 5 ++++-
>+ 1 file changed, 4 insertions(+), 1 deletion(-)
>+
>+diff --git a/crypto/bn/bn_lcl.h b/crypto/bn/bn_lcl.h
>+index 196df7e..e801ba7 100644
>+--- a/crypto/bn/bn_lcl.h
>++++ b/crypto/bn/bn_lcl.h
>+@@ -118,6 +118,9 @@
>+ extern "C" {
>+ #endif
>+ 
>++#define GCC_VERSION (__GNUC__ * 10000 \
>++                     + __GNUC_MINOR__ * 100 \
>++                     + __GNUC_PATCHLEVEL__)
>+ /*-
>+  * Bignum consistency macros
>+  * There is one "API" macro, bn_fix_top(), for stripping leading
>zeroes from
>+@@ -443,7 +446,7 @@ unsigned __int64 _umul128(unsigned __int64 a,
>unsigned __int64 b,
>+ #   endif
>+ #  elif defined(__mips) && (defined(SIXTY_FOUR_BIT) ||
>defined(SIXTY_FOUR_BIT_LONG))
>+ #   if defined(__GNUC__) && __GNUC__>=2
>+-#    if __GNUC__>=4 && __GNUC_MINOR__>=4
>++#    if GCC_VERSION > 40400

Not that it would really matter nowadays, but this should likely be >=

Cheers,

>+                                      /* "h" constraint is no more
>since 4.4 */
>+ #     define BN_UMULT_HIGH(a,b)          (((__uint128_t)(a)*(b))>>64)
>+ #     define BN_UMULT_LOHI(low,high,a,b) ({     \
>+-- 
>+2.1.4
>+
>diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb
>b/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb
>index 9a218be..c05be1f 100644
>--- a/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb
>+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb
>@@ -37,6 +37,7 @@ SRC_URI += "file://configure-targets.patch \
>             file://ptest-deps.patch \
>             file://run-ptest \
>             file://crypto_use_bigint_in_x86-64_perl.patch \
>+           
>file://0001-Define-GCC_VERSION-macro-to-cover-upto-gcc-5.patch \
>            "
> 
> SRC_URI[md5sum] = "a06c547dac9044161a477211049f60ef"



