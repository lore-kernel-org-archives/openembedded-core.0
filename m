Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web10.467.1608052303416611984
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 09:11:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ycnl7+Xy;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id n3so209170pjm.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 09:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=VrzNPxE5WbCP0NfydwMhjD8rwfMomZE/uYed0nExZbo=;
        b=Ycnl7+XyiQ0vMSnKr59FrY0ZLXjUl6NBgsq+6iiCPhPxzClNCNgk43vcJawhUbgJYH
         r1FDnYs76L0jva1DrSeNWBFx9xwm6dFNIDFshdUvDI1/6Q3zkz27NWUOtvj62clQjwNc
         +mg9Ufcxr7Uq49nBzbrwBSsOuHx01oiD+QayDwfN1yotj5RopooIqVKU3trTLVcMDOBq
         Rb8bb/FMaEVynIOEy1ExJCtofxi2iWTuELKtuakTBZmraHDDOmLm4TTTopI+KABB8g8o
         U7sNKhUXzv9Eptn9KdOrwyOoS59glQjmowmpoulsCCzp+ZOwnHcvGEoHcw7L3xlj0XFA
         EUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VrzNPxE5WbCP0NfydwMhjD8rwfMomZE/uYed0nExZbo=;
        b=t7B2TKHfD1i2Sfg+oxEEVD9fkHl48gApXHAr8bUsC+peaGujaJWYzizwikHZ+0R+iK
         82AkTz3bGrL7Sr5EgXXvBfFEx0qAuFVw+9GfoZY/dFcB1OIot8ZeSy22nVMctNAz0RMK
         +iLEphbJknjw2qi+3j3ohNr+WjQVwqBDP3Y0T8yOubYo4AzRYjvNg5Zi94wI4kfDwb+R
         p6MM37ddUuafZGUBNf8H34Y52bTzQgcgPFr01+m4/2+PX/W9fxjxg0ylD9it+GcK3cq5
         oppjojhjQI9HDWNHMkhZ6E8vpMd8voBcLJb+p94bUbIDt2Y8nrIgu7VQLA9ZXH/Zt62B
         bwfQ==
X-Gm-Message-State: AOAM533Z31X40AQknlUQ+xZoj+ZdTKyv7HJtetbjfkGPPy1gZ1m65P14
	7wvV66gTqISAjjeJmfEe9MrH/VBYD5DXFw==
X-Google-Smtp-Source: ABdhPJxjUfpHQnjLAx+cljxddLwq9Bjrauh9cJAJAkyhK0P58YdK1Er3vt0NS/XF69S4SZz21ZV3ig==
X-Received: by 2002:a17:90a:ba88:: with SMTP id t8mr30932131pjr.229.1608052301991;
        Tue, 15 Dec 2020 09:11:41 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::64a3? ([2601:646:9200:4e0::64a3])
        by smtp.gmail.com with ESMTPSA id 6sm24810770pfj.216.2020.12.15.09.11.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Dec 2020 09:11:41 -0800 (PST)
Subject: Re: [OE-core] [PATCH] gcc: Add patch to resolve i*86 tune configuration overrides
To: openembedded-core@lists.openembedded.org
References: <20201215083458.1360882-1-nathan@nathanrossi.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <752bd23e-e192-255d-af8d-645497cb1c13@gmail.com>
Date: Tue, 15 Dec 2020 09:11:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201215083458.1360882-1-nathan@nathanrossi.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/15/20 12:34 AM, Nathan Rossi wrote:
> When compiling gcc-runtime for i686 libatomic, libgomp and libitm are
> compiled with additional '-march' and '-mtune' overrides. This typically
> does not cause build errors (e.g. core2-32 tune), and results in less
> optimally tuned outputs. However with specific TUNE_CCARGS (e.g. has
> '-mfpmath=sse' but not '-msse*'), the build errors with conflicting
> '-mfpmath' options.
> 
> This is caused by gcc-runtime specific configure scripts and Makefile
> options that override by adding additional '-march'/'-mtune' args. OE
> builds gcc-runtime differently to other build systems, and provides
> target specific arch/tune options directly. As such, this change adds a
> patch for gcc to remove the specific cases where the args are added.
> 

looks fine to me.

> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> ---
>   meta/recipes-devtools/gcc/gcc-10.2.inc             |   1 +
>   .../gcc/0001-lib-Remove-i-86-march-overrides.patch | 113 +++++++++++++++++++++
>   2 files changed, 114 insertions(+)
>   create mode 100644 meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-march-overrides.patch
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-10.2.inc b/meta/recipes-devtools/gcc/gcc-10.2.inc
> index e88f2ade6d..1e69c91311 100644
> --- a/meta/recipes-devtools/gcc/gcc-10.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-10.2.inc
> @@ -69,6 +69,7 @@ SRC_URI = "\
>              file://0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch \
>              file://0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch \
>              file://0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch \
> +           file://0001-lib-Remove-i-86-march-overrides.patch \
>   "
>   SRC_URI[sha256sum] = "b8dd4368bb9c7f0b98188317ee0254dd8cc99d1e3a18d0ff146c855fe16c1d8c"
>   
> diff --git a/meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-march-overrides.patch b/meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-march-overrides.patch
> new file mode 100644
> index 0000000000..3f04e121ba
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-march-overrides.patch
> @@ -0,0 +1,113 @@
> +From 3776789cde95916f95deef48acf9532b0ebf91ae Mon Sep 17 00:00:00 2001
> +From: Nathan Rossi <nathan@nathanrossi.com>
> +Date: Tue, 15 Dec 2020 11:43:36 +1000
> +Subject: [PATCH] lib*: Remove i*86 march overrides
> +
> +OE does not pass the '--with-arch' option to gccs configure, as such
> +some gcc-runtime libraries try to override the value of '-march' and
> +'-mtune' which OE already provides. This causes conflicts with other
> +i*86 instruction/architecture flags (e.g. -msse* and -mfpmath=*).
> +Additionally this caused the following libraries to be built with less
> +optimized tune configurations.
> +
> +Upstream suggests that this should be detecting or otherwise checking if
> +the target supports the desired functionality before overriding.
> +
> +    https://gcc.gnu.org/legacy-ml/gcc-patches/2016-04/msg01344.html
> +
> +libatomic also overrides the '-march' specifically for IFUNC objects.
> +OE already supplies the correct march flag, so remove setting.
> +
> +Upstream-Status: Inappropriate [OE Specific]
> +Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> +---
> + libatomic/Makefile.am   | 1 -
> + libatomic/Makefile.in   | 1 -
> + libatomic/configure.tgt | 9 ---------
> + libgomp/configure.tgt   | 8 --------
> + libitm/configure.tgt    | 9 ---------
> + 5 files changed, 28 deletions(-)
> +
> +diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
> +index ac1ca64587..5aa16e0699 100644
> +--- a/libatomic/Makefile.am
> ++++ b/libatomic/Makefile.am
> +@@ -133,7 +133,6 @@ libatomic_la_LIBADD += $(foreach s,$(SIZES),$(addsuffix _$(s)_1_.lo,$(SIZEOBJS))
> + libatomic_la_LIBADD += $(addsuffix _8_2_.lo,$(SIZEOBJS))
> + endif
> + if ARCH_I386
> +-IFUNC_OPTIONS	     = -march=i586
> + libatomic_la_LIBADD += $(addsuffix _8_1_.lo,$(SIZEOBJS))
> + endif
> + if ARCH_X86_64
> +diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
> +index 97df2d7ff0..82c511d420 100644
> +--- a/libatomic/Makefile.in
> ++++ b/libatomic/Makefile.in
> +@@ -432,7 +432,6 @@ libatomic_la_LIBADD = $(foreach s,$(SIZES),$(addsuffix \
> + 	_$(s)_.lo,$(SIZEOBJS))) $(am__append_1) $(am__append_2) \
> + 	$(am__append_3) $(am__append_4)
> + @ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=armv7-a+fp -DHAVE_KERNEL64
> +-@ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=i586
> + @ARCH_X86_64_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -mcx16
> + libatomic_convenience_la_SOURCES = $(libatomic_la_SOURCES)
> + libatomic_convenience_la_LIBADD = $(libatomic_la_LIBADD)
> +diff --git a/libatomic/configure.tgt b/libatomic/configure.tgt
> +index 5dd0926d20..3cc41773c3 100644
> +--- a/libatomic/configure.tgt
> ++++ b/libatomic/configure.tgt
> +@@ -82,15 +82,6 @@ case "${target_cpu}" in
> + 	;;
> +
> +   i[3456]86)
> +-	case " ${CC} ${CFLAGS} " in
> +-	  *" -m64 "*|*" -mx32 "*)
> +-	    ;;
> +-	  *)
> +-	    if test -z "$with_arch"; then
> +-	      XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
> +-	      XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
> +-	    fi
> +-	esac
> + 	ARCH=x86
> + 	# ??? Detect when -march=i686 is already enabled.
> + 	try_ifunc=yes
> +diff --git a/libgomp/configure.tgt b/libgomp/configure.tgt
> +index 4790a31e39..46c4c958e6 100644
> +--- a/libgomp/configure.tgt
> ++++ b/libgomp/configure.tgt
> +@@ -72,14 +72,6 @@ if test x$enable_linux_futex = xyes; then
> +     # Note that bare i386 is not included here.  We need cmpxchg.
> +     i[456]86-*-linux*)
> + 	config_path="linux/x86 linux posix"
> +-	case " ${CC} ${CFLAGS} " in
> +-	  *" -m64 "*|*" -mx32 "*)
> +-	    ;;
> +-	  *)
> +-	    if test -z "$with_arch"; then
> +-	      XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
> +-	    fi
> +-	esac
> + 	;;
> +
> +     # Similar jiggery-pokery for x86_64 multilibs, except here we
> +diff --git a/libitm/configure.tgt b/libitm/configure.tgt
> +index 04109160e9..3d78ea609d 100644
> +--- a/libitm/configure.tgt
> ++++ b/libitm/configure.tgt
> +@@ -59,15 +59,6 @@ case "${target_cpu}" in
> +   arm*)		ARCH=arm ;;
> +
> +   i[3456]86)
> +-	case " ${CC} ${CFLAGS} " in
> +-	  *" -m64 "*|*" -mx32 "*)
> +-	    ;;
> +-	  *)
> +-	    if test -z "$with_arch"; then
> +-	      XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
> +-	      XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
> +-	    fi
> +-	esac
> + 	XCFLAGS="${XCFLAGS} -mrtm"
> + 	ARCH=x86
> + 	;;
> ---
> 2.29.2
> 
> 
> 
> 
> 
