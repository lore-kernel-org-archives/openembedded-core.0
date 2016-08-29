Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 44B456E630
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 11:16:22 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i5so9046520wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 04:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=O61v1uEL+hglRki/ox6Hnmz5l60BNln9+6qdBaxilkU=;
	b=Wvhm+qqktRd5NfTQ3loargN/pqVzemNL6352FXeTHGPnT889awmjzdFpYhuZhbdtqJ
	lU7IBbtbvAh66bkrPqaxdiZqXShqy0DVaQSIAS9hiovWgVruZeKTdpM2EjTm6lOQkza4
	jfhJcsPEHgwW9lKi2kz42TPZ866WYLIHyqjSAlGXKivTs19go7C8uySZsz4vEYeUgjdj
	+cyzobvT1seyfW4T5AiHIkZBMp5ZQW+32eg4lb2/wvTGVMXOcOklf11TFVZdARl0R0XT
	1J+zdjdomZIjDJnHPyXOYI2FmmSsfqKEfwYs0ILNj1K8cJz0+oSKT+MkdxKob5DK2SSz
	BtEw==
X-Gm-Message-State: AE9vXwMQ0DJazVmD+S7J2RAggsGAcVCaAlYFSgfTbn4r6stIzpGc9bAP3jN3J5rbrkiA1Q==
X-Received: by 10.28.232.149 with SMTP id f21mr10302272wmi.51.1472469383277;
	Mon, 29 Aug 2016 04:16:23 -0700 (PDT)
Received: from localhost ([185.46.212.59]) by smtp.gmail.com with ESMTPSA id
	us9sm33837801wjb.43.2016.08.29.04.16.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 29 Aug 2016 04:16:22 -0700 (PDT)
Message-ID: <1472469381.8449.16.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 12:16:21 +0100
In-Reply-To: <20160829110341.13100-3-git@andred.net>
References: <20160829110341.13100-1-git@andred.net>
	<20160829110341.13100-3-git@andred.net>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/3] boost: fix compilation using soft float toolchains
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
X-List-Received-Date: Mon, 29 Aug 2016 11:16:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Khem,

I expect that http://git.openembedded.org/openembedded-core/tree/meta/recipe
s-support/boost/boost/consider-hardfp.patch won't be needed for arm any more
with this patch applied (but am not in a position to test)

Cheers,
Andre'

On Mo, 2016-08-29 at 12:03 +0100, André Draszik wrote:
> In particular mips*-nf
> 
> Signed-off-by: André Draszik <git@andred.net>
> ---
>  .../boost/0002-config-gcc-BOOST_NO_FENV_H.patch    | 75
> ++++++++++++++++++++++
>  meta/recipes-support/boost/boost_1.61.0.bb         |  1 +
>  2 files changed, 76 insertions(+)
>  create mode 100644 meta/recipes-support/boost/boost/0002-config-gcc-
> BOOST_NO_FENV_H.patch
> 
> diff --git a/meta/recipes-support/boost/boost/0002-config-gcc-
> BOOST_NO_FENV_H.patch b/meta/recipes-support/boost/boost/0002-config-gcc-
> BOOST_NO_FENV_H.patch
> new file mode 100644
> index 0000000..55a0c07
> --- /dev/null
> +++ b/meta/recipes-support/boost/boost/0002-config-gcc-
> BOOST_NO_FENV_H.patch
> @@ -0,0 +1,75 @@
> +From c97b70d96b63ec116a486e3b599dd505d13f5478 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
> +Date: Wed, 24 Aug 2016 20:58:59 +0100
> +Subject: [PATCH 2/3] config: gcc: #define BOOST_NO_FENV_H on FPU-less
> arches
> +
> +gcc.compile.c++ <builddir>/boost/bin.v2/libs/test/build/gcc-
> 4.3.1/release/threading-multi/execution_monitor.o
> +
> +    "mipsel-poky-linux-musl-g++" "-mel" "-mabi=32" "-msoft-float" "-
> march=mips32r2" "-mips16" "-minterlink-compressed" "-mtune=24kec" "-mdsp"
> "-Wl,-O1" "-Wl,--as-needed" "-fstack-protector-strong" "-Wl,-z,relro,-
> z,now" "--sysroot=<sysroot>"  -ftemplate-depth-128 -O2 -pipe -g
> -feliminate-unused-debug-types -fdebug-prefix-
> map=<srcdir>=/usr/src/debug/boost/1.61.0-r0 -fdebug-prefix-
> map=<sysroot_host>= -fdebug-prefix-map=<sysroot>= -fstack-protector-strong 
> -pie -fpie -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-
> security -fvisibility-inlines-hidden -O3 -finline-functions -Wno-inline
> -Wall -pedantic -pthread -fPIC -Wno-variadic-macros -DBOOST_ALL_NO_LIB=1
> -DBOOST_CHRONO_DYN_LINK=1 -DBOOST_SYSTEM_DYN_LINK=1
> -DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_TEST_DYN_LINK=1
> -DBOOST_TIMER_DYN_LINK=1 -DNDEBUG  -I"." -c -o
> "<builddir>/boost/bin.v2/libs/test/build/gcc-4.3.1/release/threading-
> multi/execution_monitor.o" "libs/test/src/execution_monitor.cpp"
> +
> +In file included from ./boost/test/impl/execution_monitor.ipp:31:0,
> +                 from libs/test/src/execution_monitor.cpp:16:
> +./boost/test/execution_monitor.hpp:491:27: error: 'FE_DIVBYZERO' was not
> declared in this scope
> +     BOOST_FPE_DIVBYZERO = FE_DIVBYZERO,
> +                           ^~~~~~~~~~~~
> +./boost/test/execution_monitor.hpp:492:27: error: 'FE_INEXACT' was not
> declared in this scope
> +     BOOST_FPE_INEXACT   = FE_INEXACT,
> +                           ^~~~~~~~~~
> +./boost/test/execution_monitor.hpp:493:27: error: 'FE_INVALID' was not
> declared in this scope
> +     BOOST_FPE_INVALID   = FE_INVALID,
> +                           ^~~~~~~~~~
> +./boost/test/execution_monitor.hpp:494:27: error: 'FE_OVERFLOW' was not
> declared in this scope
> +     BOOST_FPE_OVERFLOW  = FE_OVERFLOW,
> +                           ^~~~~~~~~~~
> +./boost/test/execution_monitor.hpp:495:27: error: 'FE_UNDERFLOW' was not
> declared in this scope
> +     BOOST_FPE_UNDERFLOW = FE_UNDERFLOW,
> +                           ^~~~~~~~~~~~
> +
> +The reason is that some (notably FPU-less) architectures,
> +including mips*-nf, don't define/implement some of the
> +floating point constants, even though fenv.h is
> +available.
> +
> +At least on MIPS, while FE_ALL_EXCEPT is #define'd, its
> +value is 0.
> +
> +A similar problem exists on FPU-less ARM machines.
> +
> +  https://svn.boost.org/trac/boost/ticket/11756
> +
> +Other projects have similar issues, e.g. pixman, and
> +apply similar work-arounds:
> +  https://lists.freedesktop.org/archives/pixman/2014-February/003172.html
> +
> +Signed-off-by: André Draszik <adraszik@tycoint.com>
> +---
> +Upstream-Status: Submitted https://svn.boost.org/trac/boost/ticket/11756
> + boost/config/compiler/gcc.hpp | 18 ++++++++++++++++++
> + 1 file changed, 18 insertions(+)
> +
> +diff --git a/boost/config/compiler/gcc.hpp
> b/boost/config/compiler/gcc.hpp
> +index fbd3dd9..7c4fd06 100644
> +--- a/boost/config/compiler/gcc.hpp
> ++++ b/boost/config/compiler/gcc.hpp
> +@@ -262,6 +262,18 @@
> + #  define BOOST_NO_CXX14_BINARY_LITERALS
> + #endif
> + 
> ++// C++11 floating-point environment
> ++#if !defined(BOOST_NO_FENV_H)
> ++   // Some (notably FPU-less) architectures,
> ++   // including mips*-nf, don't define/implement some of
> ++   // the floating point constants, even though fenv.h
> ++   // is available.
> ++#  include <bits/fenv.h>
> ++#  if !defined(FE_ALL_EXCEPT) || (FE_ALL_EXCEPT == 0)
> ++#    define BOOST_NO_FENV_H
> ++#  endif
> ++#endif
> ++
> + // C++14 features in 4.9.0 and later
> + //
> + #if (BOOST_GCC_VERSION < 40900) || (__cplusplus < 201300)
> +-- 
> +2.9.3
> +
> diff --git a/meta/recipes-support/boost/boost_1.61.0.bb b/meta/recipes-
> support/boost/boost_1.61.0.bb
> index 41ff203..09137db 100644
> --- a/meta/recipes-support/boost/boost_1.61.0.bb
> +++ b/meta/recipes-support/boost/boost_1.61.0.bb
> @@ -6,4 +6,5 @@ SRC_URI += "\
>      file://consider-hardfp.patch \
>      file://boost-CVE-2012-2677.patch \
>      file://0001-boost-asio-detail-socket_types.hpp-fix-poll.h-
> includ.patch \
> +    file://0002-gcc-config-BOOST_NO_FENV_H.patch \
>  "

