Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.1572.1594403802041683543
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 10:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HaZHWD9n;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id a6so8960568wmm.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 10:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=VOQBgQ5FlYxlG1dSuScMpLwv1LgNoz4GH+wPoKNRDck=;
        b=HaZHWD9njbcHx3oJl5Hys6RpzXHfvS8VCEEnydBp/dZ7cqMZc0nTFcC1NvG6LCP1d4
         TT7hybKTvxKQOQJXvJ+juqJx3hCrlRApAcYqQ2Nrhlt32cV2NiNtaJdlZ6jb2zBSpKA5
         RLDurT5st1lIhnFbOd1xldMS7ClmgHP+Jb6F0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VOQBgQ5FlYxlG1dSuScMpLwv1LgNoz4GH+wPoKNRDck=;
        b=PrMj1mSf+dygXXyeXy9T5mRqatu3DS9vtsfoxzt99KwkgtzziwFwa4HsytXvP8V6bv
         /ODq7QTIs6JIb/fTYHodcijTHZ7OnHm4pm0X4HfUtT77OgsJVcQ8WSOrkn8IHB6oOdD8
         yVID1t7WwClNytaCfBDGNu1MY6SvZdEHwymILsplqVYA0NCT/SBX1imm890M0OkYTlRG
         kI46FKi1u/0ZtbcVO4rMx/hZ1KkCuPf3MA8RHfI1aP5AeqkoKfMW3v99E0xx91anWVJ5
         FHQkm+3eUYhXsXF+RVGnDlviiY5GfWPYkJCJW/b6nGs9XHDMbCuGHzMyumYssxP2GX6v
         FYpg==
X-Gm-Message-State: AOAM530vlnyxzC6mqM0gWZj2e0MAmfP9WrCtJPzsxwrTXGP59tUSnyUy
	aK6hr+Amo52mLF8/1AULM4CKuQ==
X-Google-Smtp-Source: ABdhPJxbCetRbJMybHQVku3YIv8HY/gWwavgQpF5lEq6jAQIWJvRT5NbBJ9tjkGBMCN+ggUa19++Fw==
X-Received: by 2002:a1c:5646:: with SMTP id k67mr6509891wmb.61.1594403800537;
        Fri, 10 Jul 2020 10:56:40 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id y16sm11469782wro.71.2020.07.10.10.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 10:56:39 -0700 (PDT)
Message-ID: <39c5bc9fcf056d93a42833d113521f524f063d33.camel@linuxfoundation.org>
Subject: Re: [PATCH] qemu: access host pkg-config via HOSTTOOLS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Taras Kondratiuk <takondra@cisco.com>
Cc: xe-linux-external@cisco.com, OE-core
	 <openembedded-core@lists.openembedded.org>, Cristian Iorga
	 <cristian.iorga@intel.com>
Date: Fri, 10 Jul 2020 18:56:38 +0100
In-Reply-To: <20200710174813.1963559-1-takondra@cisco.com>
References: <20200710174813.1963559-1-takondra@cisco.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-07-10 at 10:48 -0700, Taras Kondratiuk wrote:
> On some build hosts qemu-system-native fails to build with errors:
> like:
> > build/tmp/work/x86_64-linux/qemu-system-native/4.1.0-r0/qemu-4.1.0/qemu-keymap.c:16:10: fatal error: xkbcommon/xkbcommon.h: No such file or directory
> >    16 | #include <xkbcommon/xkbcommon.h>
> >       |          ^~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > make: *** [build/tmp/work/x86_64-linux/qemu-system-native/4.1.0-r0/qemu-4.1.0/rules.mak:69: qemu-keymap.o] Error 1
> 
> This is a combination of two factors:
> 1. In our setup we use native toolchain from buildtools-tarball because
>    default host GCC on some machines is too old.
> 2. Qemu recipe adds host pkg-config paths to PKG_CONFIG_PATH using
>    hardcoded pkg-config tool's location (/usr/bin:/bin).  Added by
>    commit 68a5ed337f8f ("qemu: fix qemu-native pkg-config paths")
> 
> Host xkbcommon package is detected in configure. But then the toolchain
> can't find headers because it uses headers from buildtools-tarball only.
> 
> Instead of using hardcoded location, use pkg-config via HOSTTOOLS. It
> will pick up correct pkg-config from PATH and avoid configuration
> discrepancies.
> 
> Signed-off-by: Taras Kondratiuk <takondra@cisco.com>
> ---
>  meta/conf/bitbake.conf              | 2 +-
>  meta/recipes-devtools/qemu/qemu.inc | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 353caacef986..fae1147d397c 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -488,7 +488,7 @@ HOSTTOOLS += " \
>      cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
>      fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
>      head hostname iconv id install ld ldd ln ls make md5sum mkdir mknod \
> -    mktemp mv nm objcopy objdump od patch perl pr printf pwd \
> +    mktemp mv nm objcopy objdump od patch perl pkg-config pr printf pwd \
>      python3 ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
>      sha1sum sha224sum sha256sum sha384sum sha512sum \
>      sleep sort split stat strings strip tail tar tee test touch tr true uname \
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index d41cc8f200b3..881a5ba65025 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -94,7 +94,7 @@ EXTRA_OECONF_append = " --python=${HOSTTOOLS_DIR}/python3"
>  
>  do_configure_prepend_class-native() {
>  	# Append build host pkg-config paths for native target since the host may provide sdl
> -	BHOST_PKGCONFIG_PATH=$(PATH=/usr/bin:/bin pkg-config --variable pc_path pkg-config || echo "")
> +	BHOST_PKGCONFIG_PATH=$(${HOSTTOOLS_DIR}/pkg-config --variable pc_path pkg-config || echo "")
>  	if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
>  		export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
>  	fi

qemu is a little special, its about the only thing we let look into the
system for things like this. We really don't want pkg-config available
generally in HOSTTOOLS.

I'm not 100% sure I understand how this is fixing things either. Is
this using the pkg-config from your buildtools tarball instead?

Cheers,

Richard


