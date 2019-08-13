Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id DC9F17DE5A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 14:22:59 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id 31so107975133wrm.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 07:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=nOQ2+EpKnCfpo3HLQHwaIpKxraZT2/rc8EZt0Q8k7pc=;
	b=J4xo2ScUQfxnaHpGVqizj0yHOF98VnnsOZQ5ChNn/9BjRst51DwYncJriPuwaqRpj7
	a5P/1r6ttWHY5LpDcGpxnusS8LAAJxD38B3UsA7CsKk31kTlnyUYjuQc+/EqUv34K747
	C9b2MVyfL0QXQtxzQS7UDw8ZphzCt+NzQPeI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=nOQ2+EpKnCfpo3HLQHwaIpKxraZT2/rc8EZt0Q8k7pc=;
	b=tWWDuSWEPBQC5U1KKPiIxywErE+9fIqtAq3incn5tMWNI1jYWrXsN4XyDrQpZ8ydn7
	3LKH0VH4054cod624XHCZhD/z6Evtb9EIpHGluRIZhR6YcU0egNSocc/apA2I0q5xajq
	OnuajJek5vaTFeTHR4tuBntl6kpQ06pHtO4U4XoKVP3SFbvGqi10Rcwbduf6vUxon6Ro
	i2EQYSJ+wFE2kNMCT3zzABAH54XPT9VJNBtU1IA+CuD/TIp66KactYt9iPVZzHbLvPdv
	i8gBX6hQh4PXByAwz9L0A4P9hkokUUHCjDixoNPzEuacfg64d7uTludM6uqbG/+EHfGl
	tlgQ==
X-Gm-Message-State: APjAAAXyqOx/qvGz5M+zg37SGs4waMgdA4w2yhoX7OtrNjmypLgfZLld
	QP54a4dfBOog7WbqrzRWudvMbA==
X-Google-Smtp-Source: APXvYqzYAcX7ABQgQE4jV/SygBeJ0AQPav0H9TYxcUom0wgii8UjA1ryycUu70X7G94H70jf4FXCIQ==
X-Received: by 2002:a5d:404d:: with SMTP id w13mr8379837wrp.253.1565706180599; 
	Tue, 13 Aug 2019 07:23:00 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	m23sm2281124wml.41.2019.08.13.07.22.59
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 13 Aug 2019 07:22:59 -0700 (PDT)
Message-ID: <9a259359b640fefefd52b5eee616156b75aa0e80.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2019 15:22:58 +0100
In-Reply-To: <20190812232234.41199-1-raj.khem@gmail.com>
References: <20190812232234.41199-1-raj.khem@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] gcc-runtime: Move content from gcclibdir into libdir
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
X-List-Received-Date: Tue, 13 Aug 2019 14:23:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-08-12 at 16:22 -0700, Khem Raj wrote:
> OE does not use the traditional /usr/lib/gcc prefix to store gcc-
> runtime
> it basically is moved into libdir, however some newer files were
> installed by newer versions of gcc especially libgomp ( omp.h
> openacc.h )
> into gcclibdir, so we have content in both directories, this confuses
> other tools which are trying to guess the gcc installation and its
> runtime location, since now we have two directories, the tools either
> choose one or other and we get inconsistent behavior, e.g. clang for
> aarch64 uses /usr/lib but same clang for riscv64 chose /usr/lib/gcc
> 
> This change ensures that OE ends up with single valid location for
> gcc
> runtime files
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-runtime.inc    | 5 +++++
>  meta/recipes-devtools/gcc/gcc-runtime_8.3.bb | 3 ++-
>  meta/recipes-devtools/gcc/gcc-runtime_9.1.bb | 3 ++-
>  3 files changed, 9 insertions(+), 2 deletions(-)

This appears to break mingw:

https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/925

Cheers,

Richard


> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
> b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index a5c2600d7f..ebba774108 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -77,6 +77,11 @@ do_install () {
>  		cd ${B}/${TARGET_SYS}/$d/
>  		oe_runmake 'DESTDIR=${D}'
> MULTIBUILDTOP=${B}/${TARGET_SYS}/$d/ install
>  	done
> +	if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include ]; then
> +		install -d ${D}${libdir}/${TARGET_SYS}/${BINV}/include 
> +		mv ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/*
> ${D}${libdir}/${TARGET_SYS}/${BINV}/include
> +		rmdir --ignore-fail-on-non-empty -p
> ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include
> +	fi
>  	rm -rf ${D}${infodir}/libgomp.info ${D}${infodir}/dir
>  	rm -rf ${D}${infodir}/libitm.info ${D}${infodir}/dir
>  	rm -rf ${D}${infodir}/libquadmath.info ${D}${infodir}/dir
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb
> b/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb
> index a1c7a76d0b..172af4e7e1 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb
> +++ b/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb
> @@ -5,7 +5,8 @@ require gcc-runtime.inc
>  EXTRA_OECONF_append_arm = " libat_cv_have_ifunc=no "
>  
>  FILES_libgomp-dev += "\
> -    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \
> +    ${libdir}/${TARGET_SYS}/${BINV}/include/omp.h \
> +    ${libdir}/${TARGET_SYS}/${BINV}/include/openacc.h \
>  "
>  
>  # Building with thumb enabled on armv6t fails
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb
> b/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb
> index a1c7a76d0b..172af4e7e1 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb
> +++ b/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb
> @@ -5,7 +5,8 @@ require gcc-runtime.inc
>  EXTRA_OECONF_append_arm = " libat_cv_have_ifunc=no "
>  
>  FILES_libgomp-dev += "\
> -    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \
> +    ${libdir}/${TARGET_SYS}/${BINV}/include/omp.h \
> +    ${libdir}/${TARGET_SYS}/${BINV}/include/openacc.h \
>  "
>  
>  # Building with thumb enabled on armv6t fails
> -- 
> 2.22.0
> 


