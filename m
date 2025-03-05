Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F69BC19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 15:47:04 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.16367.1741189616752212747
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 07:46:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KZdCzIHT;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-472242b0da5so62551941cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 07:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741189616; x=1741794416; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TZkq0XNMNelg6R1fOm5pkAYJ5vNZd57+XSbNuButYtA=;
        b=KZdCzIHTzVuEeuTSQXWh76dpB9nkWVvwfPhB5abfKcxqWgJktEZcqyQ6wyquWTyO3t
         NnloDrrg3pH8DyxUuQQBvYoWfFDlVYMECL3L4c0gW+79ZOB5XDL0FhEKCGr3Pe1TMdL9
         e/1ezegPvHNmOkTe9i8HJJwk08p6FyyDUO1SE/FXrCxPXogLnMZxLrwrs0Etz99hEjWI
         lz4WMfGdPkYLHtAj62gwlVxe5yDK3mygadoCPD8+0fM+T91RvyDVKmY2omdGk92Z334o
         XeQ6wWZxIKWfhO0liITD5K/DqISqP+eG+yA2EVyLEiZi/hQXHdFy7fgl3GLhmsWbA9HO
         /iIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741189616; x=1741794416;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZkq0XNMNelg6R1fOm5pkAYJ5vNZd57+XSbNuButYtA=;
        b=aNiVvCrODyMFcRxr8+Un21cMhOOUfbjtafee3Uuhp7lQ/ZGB5c0vHuRad7r/yDqX36
         AxbyPPWy9ovEcPF0QfNtlKRW0U8Vmr3cjGfvOtRm/b+8HOIONyKB+tGxhxldplvdsYC5
         s5NWBnDyXYWmE1WI9Y6t/1J3132Z9Quvto9KoKiZVtEpQENWZGUapujFGjqWJrH5askK
         bJCrNdrGJyqxQqyWe6ai9Ot21i92JdHIVqs1U9UiTLWMJiKrVg+MkaIHN8uX85aP3gP7
         6MJa0yTPby450ArPy3m/M3pQCDbf94/ErFp6mDoZhgMQLc6hbB1Z/ckiMFdvNotgOXQ/
         0wDw==
X-Gm-Message-State: AOJu0YxPBQxquOyShpp87a55kITH3CxaW6l2N8ok1il5PVc6cuL+DDGI
	rF5GldyBGsN+ZAYqpOzZ8u9aKCaC7X0U48ZIwCv6x0uo2ygfnI+IPpURo/L4PCInjBSpXk3sx7r
	bwxbpylzJxZVGzUkC5xdtK/buyHg=
X-Gm-Gg: ASbGncsBcaBjW9gjw+OtPQPuJTjNHbPp2Wszg24WSZbX6aGxf+IWZqxlzcLjQe9MxSM
	OJsawHg2D6zypYHWcPnzP0rjAVxv6dz0W6NFcSyvBCwwSlyGtjTGu7x5sSHS7AuUsOtgFYlFtHl
	QWH0LncHajDDjoOV6RCUM6s3BG5ibYYDr7yu8Dx30K0rvHiYHxcpfRx4P/LMVB
X-Google-Smtp-Source: AGHT+IGrobWoAsnWYCgiKVQdOq0Ir1Oh2eUz/Jag8EHd4amQFjKxzMnT9SoZchM2XvQBVb6xZJGrM6F5WRY3d4/s1Bs=
X-Received: by 2002:a05:6214:3002:b0:6e8:9797:f94e with SMTP id
 6a1803df08f44-6e8e6d13921mr47929226d6.35.1741189615019; Wed, 05 Mar 2025
 07:46:55 -0800 (PST)
MIME-Version: 1.0
References: <c29e6b35-9b3c-009b-3ff5-25d57725da8b@duagon.com>
In-Reply-To: <c29e6b35-9b3c-009b-3ff5-25d57725da8b@duagon.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Mar 2025 16:46:43 +0100
X-Gm-Features: AQ5f1JpcVOhJdDeL79VcIvPMOOZSBQTTKZgayypyZTCpDxOEMyVRPrJWGv2dbc4
Message-ID: <CANNYZj_H_CQzwynmj418=5qgn0x8pjz8EaOhWcWUkSF_2Avi1g@mail.gmail.com>
Subject: Re: [PATCH v2] python3: Remove DEBUG_PREFIX_MAP completely from sysconfigdata
To: Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 15:47:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212321

Thanks, lgtm.

Alex

On Wed, 5 Mar 2025 at 15:47, Jorge Sanjuan Garcia
<dev-jorge.sanjuangarcia@duagon.com> wrote:
>
> Paths in DEBUG_PREFIX_MAP are not being removed from sysconfigdata correctly.
>
> The contents of DEBUG_PREFIX_MAP is typically a set of flags defined as
> space separeted values. However, the sysconfigdata build artifact contains
> those as line separated values.
>
> Eg of DEBUG_PREFIX_MAP:
> ```
> DEBUG_PREFIX_MAP="
>          -fcanon-prefix-map  \
>          -fmacro-prefix-map=/build/tmp/work/core2-64-oe-linux/python3/3.13.2/Python-3.13.2=/usr/src/debug/python3/3.13.2 \
>          -fdebug-prefix-map=/build/tmp/work/core2-64-oe-linux/python3/3.13.2/Python-3.13.2=/usr/src/debug/python3/3.13.2  \
>          -fmacro-prefix-map=/build/tmp/work/core2-64-oe-linux/python3/3.13.2/build=/usr/src/debug/python3/3.13.2 \
>          ... \
> "
> ```
>
> From sysconfigdata artifact:
> ```
> 'CFLAGS': '-fno-strict-overflow '
>            '-Wsign-compare '
>            '-DNDEBUG '
>            '-g '
>            '-O3 '
>            '-Wall '
>            '-O2 '
>            '-g '
>            '-fcanon-prefix-map  '
>            '-fmacro-prefix-map=/build/tmp/work/core2-64-oe-linux/python3/3.13.2/Python-3.13.2=/usr/src/debug/python3/3.13.2  '
>            '-fdebug-prefix-map=/build/tmp/work/core2-64-oe-linux/python3/3.13.2/Python-3.13.2=/usr/src/debug/python3/3.13.2  '
>            '-fmacro-prefix-map=/build/tmp/work/core2-64-oe-linux/python3/3.13.2/build=/usr/src/debug/python3/3.13.2  '
>            '-fdebug-prefix-map=/build/tmp/work/core2-64-oe-linux/python3/3.13.2/build=/usr/src/debug/python3/3.13.2  '
>            '-fdebug-prefix-map=/build/tmp/work/core2-64-oe-linux/python3/3.13.2/recipe-sysroot=  '
>            '-fmacro-prefix-map=/build/tmp/work/core2-64-oe-linux/python3/3.13.2/recipe-sysroot=  '
>            '-fdebug-prefix-map=/build/tmp/work/core2-64-oe-linux/python3/3.13.2/recipe-sysroot-native=  '
>            '-fmacro-prefix-map=/build/tmp/work/core2-64-oe-linux/python3/3.13.2/recipe-sysroot-native=  '
>            '-pipe  '
>            ...
> ```
>
> Create regular expresion for sed that would replace every entry from
> DEBUG_PREFIX_MAP to remove build paths.
>
> Also, avoid having previous sed expressions that may partially replace
> values from DEBUG_PREFIX_MAP with `/build/path/unavailable/`, which will
> make the removal of all DEBUG_PREFIX_MAP entries fail.
>
> Before applying this patch:
> ```
> 'CFLAGS': '-fno-strict-overflow '
>             '-Wsign-compare '
>             '-DNDEBUG '
>             '-g '
>             '-O3 '
>             '-Wall '
>             '-O2 '
>             '-g '
>             '-fcanon-prefix-map  '
>             '-fmacro-prefix-map=/python3/3.13.2/Python-3.13.2=/usr/src/debug/python3/3.13.2  '
>             '-fdebug-prefix-map=/python3/3.13.2/Python-3.13.2=/usr/src/debug/python3/3.13.2  '
>             '-fmacro-prefix-map=/build/path/unavailable/=/usr/src/debug/python3/3.13.2  '
>             '-fdebug-prefix-map=/build/path/unavailable/=/usr/src/debug/python3/3.13.2  '
>             '-fdebug-prefix-map==  '
>             '-fmacro-prefix-map==  '
>             '-fdebug-prefix-map==  '
>             '-fmacro-prefix-map==  '
>             '-pipe  '
>             ...
> ```
>
> After applying this patch:
> ```
> 'CFLAGS': '-fno-strict-overflow '
>            '-Wsign-compare '
>            '-DNDEBUG '
>            '-g '
>            '-O3 '
>            '-Wall '
>            '-O2 '
>            '-g                   '
>            '-pipe '
>            ...
> ```
>
> Signed-off-by: Jorge Sanjuan Garcia <jorge.sanjuangarcia@duagon.com>
> ---
>   meta/recipes-devtools/python/python3_3.13.2.bb | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python3_3.13.2.bb b/meta/recipes-devtools/python/python3_3.13.2.bb
> index 52fac76c00..e6922f74fa 100644
> --- a/meta/recipes-devtools/python/python3_3.13.2.bb
> +++ b/meta/recipes-devtools/python/python3_3.13.2.bb
> @@ -206,10 +206,6 @@ do_install:append:class-native() {
>           # tarballs and sysroot creation.
>           find ${D} -name *.pyc -delete
>
> -        # Nothing should be looking into ${B} for python3-native
> -        sed -i -e 's:${B}:/build/path/unavailable/:g' \
> -                ${D}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}*/Makefile
> -
>           # disable the lookup in user's site-packages globally
>           sed -i 's#ENABLE_USER_SITE = None#ENABLE_USER_SITE = False#' ${D}${libdir}/python${PYTHON_MAJMIN}/site.py
>
> @@ -217,6 +213,7 @@ do_install:append:class-native() {
>           mv ${D}/${bindir}/${PN}/python*config ${D}/${bindir}/
>   }
>
> +
>   do_install:append() {
>           for c in ${D}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py; do
>               python3 ${UNPACKDIR}/reformat_sysconfig.py $c
> @@ -231,7 +228,6 @@ do_install:append() {
>                   -e "s,^ 'CONFINCLUDEDIR'.*, 'CONFINCLUDEDIR': '${STAGING_INCDIR}'\,,g" \
>                   -e "s,^ 'INCLUDEPY'.*, 'INCLUDEPY': '${STAGING_INCDIR}/python${PYTHON_MAJMIN}'\,,g" \
>                   -e "s,^ 'CONFINCLUDEPY'.*, 'CONFINCLUDEPY': '${STAGING_INCDIR}/python${PYTHON_MAJMIN}'\,,g" \
> -                -e "s,${B},/build/path/unavailable/,g" \
>                   $sysconfigfile
>           cp $sysconfigfile ${D}${libdir}/python-sysconfigdata/_sysconfigdata.py
>
> @@ -290,11 +286,13 @@ SSTATE_HASHEQUIV_FILEMAP = " \
>       populate_sysroot:*/lib*/python-sysconfigdata/_sysconfigdata.py:${COREBASE} \
>       "
>   PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
> +DEBUG_PREFIX_MAP_REGEX = "${@'\\|'.join(d.getVar('DEBUG_PREFIX_MAP').split())}"
>
>   py_package_preprocess () {
>           # Remove references to buildmachine paths in target Makefile and _sysconfigdata
>           sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' -e s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g \
> -                -e 's|${DEBUG_PREFIX_MAP}||g' \
> +                -e 's,${DEBUG_PREFIX_MAP_REGEX},,g' \
> +                -e 's,${B},/build/path/unavailable/,g' \
>                   -e 's:${HOSTTOOLS_DIR}/::g' \
>                   -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
>                   -e 's:${RECIPE_SYSROOT}::g' \
> --
> 2.43.0
>

