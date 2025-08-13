Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C56C87FCF
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 16:12:01 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.560.1755101520856780208
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 09:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QmLctAYl;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6154655c8aeso9418889a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 09:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755101519; x=1755706319; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dt9EJaCioOdC9I5P5GSP9alBrAJPz2zMQIqAjk9NypE=;
        b=QmLctAYlsgumm9nJuuq4A1McIP6xjc6DCpkZl2Xk4tG98dHzWT5jTnoQQpIHMPMcZo
         iLF8XRTWZqmuMvMBDvsXN4bys1GfLc1pSZsR5Zk3Vs5xzKrDtKtD7X+wqLeHpmZ6ApPk
         Loie/Usf+2osKxu9j7zuBvmcyDFAtSxa4Oo8RldLgfZ2wQvX+MeA8yrwWHMonbdKhlbY
         U3PRuxgP0ONjBYqqBxCy8fr5BxwxhprwfeTp/mue01chwav1vVMqIjUgXjI0z/eFiL3q
         UD9M4i7RiEkrmLlzHwyRFNLRc8vfnIQw0bxCy2RSBYtJTTlJ9To1k/5Ft1zN/VmHOjiR
         ogig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755101519; x=1755706319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dt9EJaCioOdC9I5P5GSP9alBrAJPz2zMQIqAjk9NypE=;
        b=H0gumRnHWtA4pLtDYMWBvaX2alpHX4k4/F0vDykjPss6eWRG9eLiHsfIBBRviith9/
         ybp08ODLwsC9GC9+wdEHHlENpfAYZMB4571sEBmG79NlRx810Jxz9fwsy/RK1nz0gyyJ
         D7/DWB3Ivau8c9s3M9ejUF/JqQ3Djg0+pK5NqfBQGj+SWFY3YmCWtIoSx6gtIATeEppO
         Cdvl2y2HBh9WiyyGQAW0MNX+BQ1fSBYZBJX8WW3qoyIohKdGc/56ev2hQtegY+kJFfp3
         WlBsEjwVVDuc55/gbaGstnazkvTiCcB/Wbcao2BYavETKIVe6PPYZDvmtjC3JdJKMzhq
         Rv5w==
X-Forwarded-Encrypted: i=1; AJvYcCWB8+0Sfyx5ODHi/rJaSAeKTmwBdBl0XE/EEST8xO+hXrNUT45I4oPXP0z2C8tdfCIK4vvM4FX528VYbrMN0PKNiQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy1/4Ic1v5N6bdiP3rlixicNhaOabA4HgA5kxJPv5e5vbPSQx3Q
	zX5FwHTxTgc2tfABk3kdG8f4BgZEnQk7SVCzW0V/vRNZZ0AoX7w1K1iq
X-Gm-Gg: ASbGncvGNHPaWI84ppwSy24YQR5uReYIggAVGYAjwv+RMDb3gjeEz7AzjiCG8wnxCXZ
	BRXvaAooCPUUw7ZjyKtEe7bG7njdw6nFTsXTif5ETJzM1iQWSPXO8zqe+BeXajMIF5EKkslERBQ
	E+dHEGXl17j9mxwV1Y79MxZvwfFA2OgRu9tLfXai99zB3ZpEkMnnQ3xV0O7lRdGvJERBxk9Y2Pw
	nEXtNkT3hGs+RgGzvR5cTL3+2/81g2s55Bl5Qve/nkTcOU9wFtQDRm/dtj7R+7ZY7PQO9RQEEma
	xB9dZ6QolAUahoIHmOq2+VECkH5xDuX2PbGwYUkID+aRHDeDasZxphOn5VCJvz0OKUDwBgDMIn2
	MVJxpuAquCILpjB6DTkM6c30B9cyX3w==
X-Google-Smtp-Source: AGHT+IEBUrUmALZRXKsfttc43MNs3zTNt+9z9A+m66rr30eafjtiSn4LUDX5OCZ5GFZQ8oimP2s22g==
X-Received: by 2002:a17:906:830e:b0:af9:1720:425a with SMTP id a640c23a62f3a-afca4e0b1ccmr279159466b.30.1755101518846;
        Wed, 13 Aug 2025 09:11:58 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a1e6cecsm2428773166b.70.2025.08.13.09.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 09:11:58 -0700 (PDT)
Message-ID: <ebdeab05-86f3-41b8-8611-43318652b7e6@gmail.com>
Date: Wed, 13 Aug 2025 18:11:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][walnascar 3/3] bitbake.conf: Switch prefix mapping to
 use -ffile-prefix-map
To: steve@sakoman.com, openembedded-core@lists.openembedded.org
References: <cover.1755005205.git.steve@sakoman.com>
 <1a8f58b2e7c2005757fcf1a5d4b57f7239925133.1755005205.git.steve@sakoman.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1a8f58b2e7c2005757fcf1a5d4b57f7239925133.1755005205.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 16:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221815

Is this more than cosmetic in walnascar? If it isn't, than should this
really go into a stable branch? In my understanding this will require a
brand new sstate cache.

On 8/12/25 15:29, Steve Sakoman via lists.openembedded.org wrote:
> From: Khem Raj <raj.khem@gmail.com>
>
> -ffile-prefix map is more comprehensive when it comes to reproducible
> builds and its superset of all prefix-mapping options in compilers
>
> (From OE-Core rev: ff73fa7ef7666a6dbe34f15515bc3ab6e574c5b0)
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/classes-recipe/kernel-arch.bbclass            |  6 ++----
>  meta/conf/bitbake.conf                             | 14 +++++---------
>  meta/lib/oe/package.py                             |  2 +-
>  meta/recipes-devtools/gcc/libgfortran.inc          |  2 +-
>  .../python/python3-maturin_1.8.3.bb                |  2 +-
>  meta/recipes-devtools/rust/cargo_1.84.1.bb         |  2 +-
>  6 files changed, 11 insertions(+), 17 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
> index 36a6e0a60a..749a266ea3 100644
> --- a/meta/classes-recipe/kernel-arch.bbclass
> +++ b/meta/classes-recipe/kernel-arch.bbclass
> @@ -73,10 +73,8 @@ HOST_OBJCOPY_KERNEL_ARCH ?= "${TARGET_OBJCOPY_KERNEL_ARCH}"
>  
>  KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} \
>   -fuse-ld=bfd ${DEBUG_PREFIX_MAP} \
> - -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
> - -fmacro-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
> - -fdebug-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
> - -fmacro-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
> + -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
> + -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
>  "
>  KERNEL_LD = "${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
>  KERNEL_AR = "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 501808204e..b1dae17267 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -652,15 +652,11 @@ EXTRA_OEMAKE:prepend:task-install = "${PARALLEL_MAKEINST} "
>  ##################################################################
>  TARGET_DBGSRC_DIR ?= "/usr/src/debug/${PN}/${PV}"
>  # Beware: applied last to first
> -DEBUG_PREFIX_MAP ?= "-fcanon-prefix-map \
> - -fmacro-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
> - -fdebug-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
> - -fmacro-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
> - -fdebug-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
> - -fdebug-prefix-map=${STAGING_DIR_HOST}= \
> - -fmacro-prefix-map=${STAGING_DIR_HOST}= \
> - -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
> - -fmacro-prefix-map=${STAGING_DIR_NATIVE}= \
> +DEBUG_PREFIX_MAP ?= "\
> + -ffile-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
> + -ffile-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
> + -ffile-prefix-map=${STAGING_DIR_HOST}= \
> + -ffile-prefix-map=${STAGING_DIR_NATIVE}= \
>  "
>  DEBUG_LEVELFLAG ?= "-g"
>  
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index 0db14f2164..0bcc04ea54 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -991,7 +991,7 @@ def copydebugsources(debugsrcdir, sources, d):
>  
>          prefixmap = {}
>          for flag in cflags.split():
> -            if not flag.startswith("-fdebug-prefix-map"):
> +            if not flag.startswith("-ffile-prefix-map"):
>                  continue
>              if "recipe-sysroot" in flag:
>                  continue
> diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
> index 4560421ed1..fa6aecaaa3 100644
> --- a/meta/recipes-devtools/gcc/libgfortran.inc
> +++ b/meta/recipes-devtools/gcc/libgfortran.inc
> @@ -8,7 +8,7 @@ EXTRA_OECONF_PATHS = "\
>  # An arm hard float target like raspberrypi4 won't build
>  # as CFLAGS don't make it to the fortran compiler otherwise
>  # (the configure script sets FC to $GFORTRAN unconditionally)
> -export GFORTRAN = "${FC} -fcanon-prefix-map -fdebug-prefix-map=${S}=${TARGET_DBGSRC_DIR} -fdebug-prefix-map=${B}=${TARGET_DBGSRC_DIR} -gno-record-gcc-switches"
> +export GFORTRAN = "${FC} -ffile-prefix-map=${S}=${TARGET_DBGSRC_DIR} -ffile-prefix-map=${B}=${TARGET_DBGSRC_DIR} -gno-record-gcc-switches"
>  
>  do_configure () {
>  	for target in libbacktrace libgfortran
> diff --git a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb b/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
> index 17c8fb7083..ad61aac856 100644
> --- a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
> +++ b/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
> @@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "304762f86fd53a8031b1bf006d12572a2aa0a5235485031113195cc015
>  
>  S = "${WORKDIR}/maturin-${PV}"
>  
> -CFLAGS += "-fdebug-prefix-map=${CARGO_HOME}=${TARGET_DBGSRC_DIR}/cargo_home"
> +CFLAGS += "-ffile-prefix-map=${CARGO_HOME}=${TARGET_DBGSRC_DIR}/cargo_home"
>  
>  DEPENDS += "\
>      python3-setuptools-rust-native \
> diff --git a/meta/recipes-devtools/rust/cargo_1.84.1.bb b/meta/recipes-devtools/rust/cargo_1.84.1.bb
> index db18ecfda9..150c2d2b80 100644
> --- a/meta/recipes-devtools/rust/cargo_1.84.1.bb
> +++ b/meta/recipes-devtools/rust/cargo_1.84.1.bb
> @@ -19,7 +19,7 @@ CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
>  
>  inherit cargo pkgconfig
>  
> -DEBUG_PREFIX_MAP += "-fdebug-prefix-map=${RUSTSRC}/vendor=${TARGET_DBGSRC_DIR}"
> +DEBUG_PREFIX_MAP += "-ffile-prefix-map=${RUSTSRC}/vendor=${TARGET_DBGSRC_DIR}"
>  
>  do_cargo_setup_snapshot () {
>  	${UNPACKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
>


