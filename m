Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 214DE7FBE2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 23:25:51 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p17so11132589wma.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 15:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=5usSniRpubqgZA8H1YIVtWo2QBjgYzXmpLIIwaJUHOE=;
	b=D9LyKba6f6NhMMo5mWVRoRzTqYu+buRKhOhA3b1PQhAiqMSCr2n7fTECcGbTB1b0cp
	j0SkDS4hBUXf5vGxJHJ5nXyU5eUWw+dJFPCVJZm/m5kTI3vFTQYdjLLldLH9JZyCKUD/
	YYk3z3/hncVx9jh6jwU+2E4kLx9T9FQClTiiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=5usSniRpubqgZA8H1YIVtWo2QBjgYzXmpLIIwaJUHOE=;
	b=PaUnJJ+/aI4vUHqYTgsTPkG8Hf5kq47tlHNtRJANu9LRW3/cC4DeSDvafJ2e2vv3g/
	akN2lNP24tk+qJKHgDF4YV11BAFgbC8wvpXNSCgl59MCCoiN7jo1/GMnqsa6iONYTzJ7
	rCf8gVt6LyBX/Ms3+rYAAyy6FryU6WwXck6sX9d6Tut+mccka5F2EZKB8jvZaY/fz2ME
	BuSD+QtGzpQQcVKlc1JpqJG1WY+wfS1ucRBrLWQGqcdEhm2baLEYEZu3QVohcceGQpPZ
	a3nXKmCZfHWWckFbAfuS9QqGkG5Y6I4pYqzQC3nx5DP1nFJrALwUXc+nRHlR6cjwGTWq
	jDIA==
X-Gm-Message-State: APjAAAWJAg3cKUsr3YRHUNDP6/I3PPaY8VG6NEyl9xfKbTqnTe/fe2Uz
	v3FDiMKUa+2ptJ6q/eBmNYlD8B8BQFM=
X-Google-Smtp-Source: APXvYqzs8HwTpOWl9MHe5jQMIClBB1uViSie/xtrtmh1jzAu9q9a9L/cD5WUB766p12EuPIH/64F0w==
X-Received: by 2002:a7b:c759:: with SMTP id w25mr11364907wmk.15.1579389952670; 
	Sat, 18 Jan 2020 15:25:52 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b68sm16551465wme.6.2020.01.18.15.25.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 15:25:51 -0800 (PST)
Message-ID: <4d2cae78a231b62d03bdf88f0e0514220faff21e.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2020 23:25:50 +0000
In-Reply-To: <1579382560-2540-2-git-send-email-alejandro@enedino.org>
References: <1579382560-2540-1-git-send-email-alejandro@enedino.org>
	<1579382560-2540-2-git-send-email-alejandro@enedino.org>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] newlib: Enable building libstdc++ for newlib based toolchains
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
X-List-Received-Date: Sat, 18 Jan 2020 23:25:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-01-18 at 13:22 -0800, Alejandro Enedino Hernandez
Samaniego wrote:
> Some baremetal applications might require support from libstdc++.
> 
> On newlib based toolchains, libstdc++ can be built as a static
> library that applications can then link against it.
> 
> Pass libsdtc++-(static)dev to LIBC_DEPENDENCIES allowing the
> library to be present for cross compilation as well as on
> sdk builds.
> 
> This also requires to modify the gcc-runtime recipe to
> explictly build only libsdtc++ correctly.
> 
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org>
> ---
>  meta/conf/distro/include/tclibc-newlib.inc | 7 +++----
>  meta/recipes-devtools/gcc/gcc-runtime.inc  | 6 ++++++
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/conf/distro/include/tclibc-newlib.inc
> b/meta/conf/distro/include/tclibc-newlib.inc
> index 896c0b1..8338003 100644
> --- a/meta/conf/distro/include/tclibc-newlib.inc
> +++ b/meta/conf/distro/include/tclibc-newlib.inc
> @@ -25,12 +25,11 @@ LIBC_DEPENDENCIES = "\
>      libgloss-dbg \
>      libgcc-dev \
>      libgcc-dbg \
> +    libstdc++-dev \
> +    libstdc++-staticdev \
>      "
>  
> -# compilerlibs defaults to gcc-runtime, but we get runtime from
> libgloss
> -# we set ASSUME_PROVIDED because we cant set PREFERRED_PROVIDER
> -# for compilerlibs since its overridden by tcmode-default
> -ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}compilerlibs
> virtual/crypt"
> +ASSUME_PROVIDED += "virtual/crypt"
>  
>  # Its useful to be able to extend newlib, but we dont provide a
> native variant of libgloss
>  NEWLIB_EXTENDED ?=  "libgloss libgcc"
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
> b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index d3f8ae8..f035fbd 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -17,6 +17,9 @@ EXTRA_OECONF_PATHS = "\
>  EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
>  EXTRA_OECONF_append = " --cache-file=${B}/config.cache"
>  
> +EXTRA_OECONF_remove_libc-newlib = "--enable-symvers=gnu"
> +EXTRA_OECONF_append_libc-newlib = " --with-newlib"
> +

I really don't like using remove in core. Can we restructure this so
that symvers is set something like:

SYMVERS_CONF = " --enable-clocale=gnu"
SYMVERS_CONF_libc-newlib = ""
EXTRA_OECONF_append += "${SYMVERS_CONF}"

?

>  # Disable ifuncs for libatomic on arm conflicts -march/-mcpu
>  EXTRA_OECONF_append_arm = " libat_cv_have_ifunc=no "
>  
> @@ -33,6 +36,9 @@ RUNTIMELIBITM_riscv64 = ""
>  RUNTIMELIBSSP ?= ""
>  RUNTIMELIBSSP_mingw32 ?= "libssp"
>  
> +# Only build libstdc++ for newlib
> +RUNTIMETARGET_libc-newlib = "libstdc++-v3"
> +
>  RUNTIMETARGET = "${RUNTIMELIBSSP} libstdc++-v3 libgomp libatomic
> ${RUNTIMELIBITM} \
>      ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'],
> 'libquadmath', '', d)} \
>  "

Convention is top put the overridden version under the original.

Cheers,

Richard


