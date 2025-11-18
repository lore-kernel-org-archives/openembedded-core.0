Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44D4CEE349
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 18:12:50 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3583.1763489569274145727
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Nov 2025 10:12:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j/jp10kB;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477a1c28778so32589765e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 10:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763489567; x=1764094367; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I/0djniakMh3UPx+SiFQsVJRhpaZsUMu51JJYDL1QD4=;
        b=j/jp10kBE/f3TzagsDYhqSrcPfutoBSTuAyJuZ6WafOS+hyForjUDCk+0MCqN9xoc4
         9kgHUJU4KXbrcG4dgavkTLkYUjYDNFC6kq+PqVcXKjiZlQnNPqVLNkdPrBIgt6iBSzmy
         28HL34YIksPcOl3oLW06HjyX7k6S2TcltFm30KaAPd+4CV7FBEgUCB/voQ4B3yd0FP/Z
         1wTbUhO62anM/fe75Qk2GNV4NgHQkDFmeMT+VDWfxXUS9Dxv8oQJS4qD2RPEU5ZXLPlm
         xTaNkAgWez9PWUP2exnMb9mapKtFRIQcq3dsT/OX5ICAeJ1ELezvd3ssTEYFUzZTRFiJ
         jxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763489567; x=1764094367;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/0djniakMh3UPx+SiFQsVJRhpaZsUMu51JJYDL1QD4=;
        b=Xx3W+ZEmFrvK+epmF55Z5ufvpUNacbdOhEUWrduE7BNJQec3n2uFJJAMqvptCHkz9f
         8A+6Jw1v1g5Qd4bIVGUwXBzGSFzYKwuAEZRGp6EUvaueutx+y2ggJhi9qNyExiV/C6Qd
         yIx7wKyahc64cm0KvCMsmU64n8nUCBCRSBFbWy3jHojgSh97N1TEf84IEF+UPN38+9FE
         hQn3UctPmT1r6Vwf/I0Ap1mmipjFne+HayH3brWXlgOuo5gK5JnjJgqtwzDOHjMtIyBc
         KEULFUJ6P0ZzxVjgm4qKvK8JMBMM0TZ1iyHgYvtHMYmPDASvNo0FHL5z/iUqdpd7ddqF
         hG3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSx6HiLTWxk+/3S7pLfv6FZQqIZ7U8JZ4bR83J5gjvXEZCtYM0fRxaehfMR2sbV/KiM+IyzlZCdySeGtY6b6neEg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YziLLTbEzYi/RY5f1e2VPh0RtSL1Ne9nJcqRfDqgNbXhdyTOX/v
	Jt41qGujF52j0olXibTHGZ7eQzWb9rT1wyTJM0rnl71U0xoqn5WvMkNg
X-Gm-Gg: ASbGnct03bPeAQnizef4XhlOZj/uAY9tZLRw56LKckrFo4sfRpgzr2ugjliUj81tZUH
	UZV1Jie3uTl32b9uy5Y+Ze2u06GyNiK1IP0Qlk6z3Lh3mpFQnXsuZQ+F6eOEgcXH8X1YvS1CtWJ
	I9lzKEHIcCaJLoCVA9tpcPbR//zqy/PWipGpSZuyrZPBdeUBO3L4UCSw9qCxHMlddmWBvucm9bK
	j/X1aNu56oT5xvsd/ED0N8hufPD/TqyR71GBc3R6Xtm3gD81sw7PhS4V7XQpMePgcdjBnOmB3oo
	G8QNhIRGP5nIDauAIt7xC+aF155PYbHecXVhOkvzztWar1uMqgBYREy846ZhGK7wI2S6tLEt6b6
	3p6oGFRjFxUsVt8f1QNGWLGGFZDXOJme3pN3DVM6NMTcE1kVcYFyeY43JboI7czGLadhV2+bq5d
	LmRzOJB9iyqqIpLayTLjeV1qAUQjrPjQ==
X-Google-Smtp-Source: AGHT+IG6jGyrs5QxUwoJULduOkdg+nSDme4TzHzeDqFSnQVAasAfKcXNgHpDSGfbHy0gOO6s9/+46g==
X-Received: by 2002:a05:600c:154a:b0:477:b0b9:3131 with SMTP id 5b1f17b1804b1-477b0b932cfmr6319095e9.8.1763489567326;
        Tue, 18 Nov 2025 10:12:47 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9deb126sm21523955e9.9.2025.11.18.10.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 10:12:46 -0800 (PST)
Message-ID: <84993796-5eab-4fff-9980-3946f4bb6034@gmail.com>
Date: Tue, 18 Nov 2025 19:12:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 2/2] bitbake.conf: Switch prefix mapping to
 use -ffile-prefix-map
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Cc: Jacob Kroon <jacob.kroon@gmail.com>, Martin Jansa <Martin.Jansa@gmail.com>
References: <20250421172915.1651803-1-raj.khem@gmail.com>
 <20250421172915.1651803-2-raj.khem@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250421172915.1651803-2-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 18:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226534

This patch seems to have caused some regression in packaging the source
for some recipes.
I don't have a lot of info yet, just finished bisecting.

The issue I see is with "audiofile" recipe from meta-oe that I wanted to
debug with master branch: with this patch the -src package is empty.
Without it, it is populated fine. I guess there are other recipes also,
but that's what I stumbled upon.

Will try to look at it, but if you have any ideas, I'm all ears. But in
any case, FYI.

On 4/21/25 19:29, Khem Raj via lists.openembedded.org wrote:
> -ffile-prefix map is more comprehensive when it comes to reproducible
> builds and its superset of all prefix-mapping options in compilers
>
> This makes is cleaner and workable across gcc and clang, clang does not
> support -fcanon-prefix-map and it has to be explicitly omitted when using
> clang.
>
> There are lambdas generated in templates by clang which still get the
> absolute paths despite -fdebug-prefix-map, this helps with that as well.
>
> nasm is an outlier and we have fixed it by adding -fdebug-prefix-map option
> luckily we do not pass DEBUG_PREFIX_MAP to nasm, in all recipes which use
> nasm either pass -fdebug-prefix-map explicitly to nasm or they rewrite it
> to use nasm flags syntax.
>
> We have discussed this in past [1]
>
> [1] https://patchwork.yoctoproject.org/project/oe-core/patch/20230428032030.2047920-1-raj.khem@gmail.com/#10281
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Jacob Kroon <jacob.kroon@gmail.com>
> Cc: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> v2: Drop using --ffile-prefix in go
> v3: Fix copydebugsources to use --file-prefix-map instead of -fdebug-prefix-map
>     and few more places
>
>  meta/classes-recipe/kernel-arch.bbclass            |  6 ++----
>  meta/conf/bitbake.conf                             | 14 +++++---------
>  meta/lib/oe/package.py                             |  2 +-
>  meta/recipes-devtools/gcc/libgfortran.inc          |  2 +-
>  .../python/python3-maturin_1.8.3.bb                |  2 +-
>  meta/recipes-devtools/rust/cargo_1.85.1.bb         |  2 +-
>  6 files changed, 11 insertions(+), 17 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
> index 968551267f9..7aea9cd3e8e 100644
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
> index 8f90026f7c2..b4e1964f77d 100644
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
> index 0db14f21642..0bcc04ea54a 100644
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
> index 4560421ed1f..fa6aecaaa30 100644
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
> index 3ec4d0c103b..08975e177f0 100644
> --- a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
> +++ b/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
> @@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "304762f86fd53a8031b1bf006d12572a2aa0a5235485031113195cc015
>  
>  S = "${WORKDIR}/maturin-${PV}"
>  
> -CFLAGS += "-fdebug-prefix-map=${CARGO_HOME}=${TARGET_DBGSRC_DIR}/cargo_home"
> +CFLAGS += "-ffile-prefix-map=${CARGO_HOME}=${TARGET_DBGSRC_DIR}/cargo_home"
>  
>  DEPENDS += "\
>      python3-setuptools-rust-native \
> diff --git a/meta/recipes-devtools/rust/cargo_1.85.1.bb b/meta/recipes-devtools/rust/cargo_1.85.1.bb
> index db18ecfda9a..150c2d2b801 100644
> --- a/meta/recipes-devtools/rust/cargo_1.85.1.bb
> +++ b/meta/recipes-devtools/rust/cargo_1.85.1.bb
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
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215180): https://lists.openembedded.org/g/openembedded-core/message/215180
> Mute This Topic: https://lists.openembedded.org/mt/112379635/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


