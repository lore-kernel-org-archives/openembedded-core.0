Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2A619744DA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 10:12:39 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id 10-v6so5637672oix.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 03:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ORvx2AvJhMf7ylO074O2xIB3FJrEe+pAzPiUty1Dgq4=;
	b=wjFQrv1MSpGcp87tRumQMeHVrae4THgiLSPKRfX5FmVqJyqEpcKYpKq4RbSLvlEFp1
	v29ydBMEgMavDjz/k8LAJlrlB4GfrM071HO0BnAXUdZ0sQccic8rEpaR878epaky4Z4p
	9ysp2BowpFvkzBTJB3ihvvyOZcqYdQu+2MJHSbcDlpNCfJ4heQEGmlTcXZEaUMnPF4yr
	Q158lIc6g9oKc+fskt/2fUMD11Mhlgjl/Ujyr1haU2Nvma2DLkH5FyMweLc01CzdrPaH
	yEk4BISE+tQr8SagL1kqYIGAYwC8so0eMmGvtF5+bc7GZyvFgaIfxreSDj2wolZlnvde
	aNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ORvx2AvJhMf7ylO074O2xIB3FJrEe+pAzPiUty1Dgq4=;
	b=doVA2g0QEpKqi6jbddWWKTZd0hn9GP/dNhPz1ykAH/XYmnpifbQRsXCIttHX0RH1oh
	Au+mAR8k4AFJ+aR8VAXoy7tkmqEhRixnCMzJfFhT4qsLg2msdBOtjW89veF26viqIToq
	U73rbvk9oqDVWmpf/q7LQ+iiYITb691xEKfb5SnsZ8LyYDcjDP9+OoVVgK8x+Egq9NOs
	laSOxMSYy7p/B1QNqwMHGXY4zMXtEPbeiBa+H+KWNNzhbjV7l1SXMx/skf0DliRAGedN
	VDu7jkfk8z+Oa50W8V+ynIM/2dEzEIz/adygi6FFsXVNSiRNvgiXk1njWPz3+p9TXRt1
	Tyeg==
X-Gm-Message-State: ALQs6tCSB4Fe7pr9vWwQjGmSeIV72ShiWrw6p71sNEc2wPpKlVmkG80f
	aD9gvx9OAi/rFM3A8EFbDGpnJqx/2Vs18TiTJVk4Xg==
X-Google-Smtp-Source: AIpwx48n+oAAh4HZ/F7Q4GZoBt2CuzZdQip5y5CAw+m+dR2XuK1wA6in0ZfkJ92x3vqMPZFD3ogLPJnqPzVjLfIM/vk=
X-Received: by 2002:aca:698c:: with SMTP id
	e134-v6mr842340oic.18.1523959960861; 
	Tue, 17 Apr 2018 03:12:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Tue, 17 Apr 2018 03:12:20 -0700 (PDT)
In-Reply-To: <20180416065014.29385-3-raj.khem@gmail.com>
References: <20180416065014.29385-1-raj.khem@gmail.com>
	<20180416065014.29385-3-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Apr 2018 11:12:20 +0100
Message-ID: <CAJTo0LZk7nOy5s6fRi2vnRhbvaMqnphAFhoxyazkXVLree525g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] gcc-runtime: Disable gcc version of libssp
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
X-List-Received-Date: Tue, 17 Apr 2018 10:12:40 -0000
Content-Type: text/plain; charset="UTF-8"

This is, I suspect, the cause of nativesdk-perl failing on the autobuilder:

TOPDIR/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-perl/5.24.1-r0/recipe-sysroot-native/usr/bin/x86_64-pokysdk-linux/../../libexec/x86_64-pokysdk-linux/gcc/x86_64-pokysdk-linux/7.3.0/ld:
cannot find -lssp_nonshared
TOPDIR/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-perl/5.24.1-r0/recipe-sysroot-native/usr/bin/x86_64-pokysdk-linux/../../libexec/x86_64-pokysdk-linux/gcc/x86_64-pokysdk-linux/7.3.0/ld:
cannot find -lssp
collect2: error: ld returned 1 exit status
makefile:391: recipe for target 'lib/buildcustomize.pl' failed

http://errors.yoctoproject.org/Errors/Details/176127/

Ross

On 16 April 2018 at 07:50, Khem Raj <raj.khem@gmail.com> wrote:
> libssp is implemented fully in glibc as well as in musl
> so we really do not need the gcc version of this library
> except may be for mingw, where we keep it enabled anyway
> gcc in OE is built with the knowledge that C library
> already provides libssp implementation, we should therefore
> not need the gcc implementation of same.
>
> libssp_nonshared piece is a detail which is needed when gcc
> is the compiler, in glibc this is part of libc_nonshared.a
> already and libc_nonshared.a is linked always when linking
> with -lc becuase libc.so in glibc is actually a linker script
>
> GROUP ( /usr/lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED ( /usr/lib/ld-linux-x86-64.so.2 ) )
>
> which automatically links in the needed runtime bits, this however
> is not the case for musl, where core SSP APIs are implemented in full
> but compiler specific runtime isn't, for this we add a new package
> called libssp_nonshared which generate the needed runtime stub
> and gcc is already carrying patch to link to libssp_nonshared.a
> on musl
>
> This should fix a long standing problem where static PIE executable
> were not buildable with OE since it was conflicting SSP implementation
> one from C library and the other one from gcc and we end up with
> duplicate symbol errors during linking.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-7.3.inc     | 4 +++-
>  meta/recipes-devtools/gcc/gcc-runtime.inc | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc b/meta/recipes-devtools/gcc/gcc-7.3.inc
> index d968c322d2..7e52afc643 100644
> --- a/meta/recipes-devtools/gcc/gcc-7.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-7.3.inc
> @@ -93,10 +93,12 @@ FORTRAN = ""
>  JAVA = ""
>
>  LTO = "--enable-lto"
> +SSP ?= "--disable-libssp"
> +SSP_mingw = "--enable-libssp"
>
>  EXTRA_OECONF_BASE = "\
>      ${LTO} \
> -    --enable-libssp \
> +    ${SSP} \
>      --enable-libitm \
>      --disable-bootstrap \
>      --disable-libmudflap \
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index 97365a21dc..b4e5539575 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -24,8 +24,10 @@ RUNTIMELIBITM_nios2 = ""
>  RUNTIMELIBITM_microblaze = ""
>  RUNTIMELIBITM_riscv32 = ""
>  RUNTIMELIBITM_riscv64 = ""
> +RUNTIMELIBSSP ?= ""
> +RUNTIMELIBSSP_mingw ?= "libssp"
>
> -RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
> +RUNTIMETARGET = "libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
>      ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], 'libquadmath', '', d)} \
>  "
>  RUNTIMETARGET_append_x86 = " libmpx"
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

