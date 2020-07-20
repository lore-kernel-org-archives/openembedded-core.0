Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.35678.1595242572756199307
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2020 03:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SCZ7eun7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id 22so21820331wmg.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2020 03:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=2Pd2qWOeJZZlBxZwiZvMDES5P/2sm7m9VkUHL5At2zU=;
        b=SCZ7eun7DTLbXULw+i70CmVgC+OGVuE417uvZeOuWrSD1OE/1/TAJuRfkK1bgnToPL
         EoVA/r3tRa+43LYQFExODzhCEeSS2+hY2V9SQ93zvyzGq2MgY9wj1VcAqRd2S57CdVB2
         NygHDshboSlD8uGyFvVpQSapcdidg5wcOnzpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2Pd2qWOeJZZlBxZwiZvMDES5P/2sm7m9VkUHL5At2zU=;
        b=b1YcYM1PgVjhTR7fo6n0QpKvueVeW9zBGWsnN1IPc/zorTYbzhJHWbg5x4SuIPLqcA
         KKb1gq0+AGmtLE/tst5X4Vi1WzYrPyfB8f/NchbD+f4qVjdw1eLnmJ8esZ3oWzV0edQQ
         Smjj1AJStYrMxzA/LscPmhLBekJR9jWNktbtxZyw6Hgb8xvlnSPvl+dQeRuCDkzeC6xC
         ym2dGQLu7fijxcvMCzFPceH0/pjSitWn8aPz+aygo1MW/fpvV5sPIfrZWkI/c+CDJCJf
         wmkfsMt2X4ekQ80n0Ls2chG3Hyw085CdSgTxGU+lhnN1s6t63yLErGki1yW7281IWPTO
         /ndA==
X-Gm-Message-State: AOAM530hl2AGqNxETNNE8aRH3+yoHXq/u8QX1JDGYZDP29qx/+jwnVDR
	I9WUqTfQ1aj8xMqHWFNVr9rT7w==
X-Google-Smtp-Source: ABdhPJwafcw0h3nYKOvlacE0X6sNrAA0en0lWcfFkkkEk7PvuQOnEeUMNKCJU+WlH3DvvYuJ+y1quA==
X-Received: by 2002:a05:600c:249:: with SMTP id 9mr19782015wmj.80.1595242571187;
        Mon, 20 Jul 2020 03:56:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 5.f.a.a.6.6.c.6.8.7.0.3.0.b.c.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (5.f.a.a.6.6.c.6.8.7.0.3.0.b.c.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1cb0:3078:6c66:aaf5])
        by smtp.gmail.com with ESMTPSA id t2sm31328627wma.43.2020.07.20.03.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 03:56:10 -0700 (PDT)
Message-ID: <10e70d05e34d232d27ec4a3125828745ac4efe09.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v9] expat: Added ptest
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: oleksandr.s.popovych@globallogic.com, 
	openembedded-core@lists.openembedded.org
Cc: jpewhacker@gmail.com
Date: Mon, 20 Jul 2020 11:56:08 +0100
In-Reply-To: <20200718160209.18117-1-oleksandr.s.popovych@globallogic.com>
References: <20200718160209.18117-1-oleksandr.s.popovych@globallogic.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-07-18 at 19:02 +0300, Oleksandr via lists.openembedded.org wrote:
> For ptest support of expat package:
> 
>  - expat_2.2.9.bb recipe was switched on cmake-based building system to
> avoid cahnges in autotools build system which considered in upstream as
> potentially deprecated (https://github.com/libexpat/libexpat/issues/330).
> 
>  - cmake-native_3.17.3.bb recipe was forced to use bundled version of
> expat from CMake source tree. Therefore expat-native package has been removed
> from DEPENDS variable for cmake-native recipe. Without
> these changes, next dependency loop appears:
> 
> Dependency loop #1 found:
>   Task /home/opopovych/repos/poky/meta/recipes-devtools/cmake/cmake-native_3.17.3.bb:do_compile (dependent Tasks ['cmake-native_3.17.3.bb:do_configure'])
>   Task /home/opopovych/repos/poky/meta/recipes-devtools/cmake/cmake-native_3.17.3.bb:do_install (dependent Tasks ['cmake-native_3.17.3.bb:do_compile'])
>   Task /home/opopovych/repos/poky/meta/recipes-devtools/cmake/cmake-native_3.17.3.bb:do_populate_sysroot (dependent Tasks ['cmake-native_3.17.3.bb:do_install'])
>   Task virtual:native:/home/opopovych/repos/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_prepare_recipe_sysroot (dependent Tasks ['cmake-native_3.17.3.bb:do_populate_sysroot', 'ninja_1.10.0.bb:do_populate_sysroot', 'expat_2.2.9.bb:do_fetch'])
>   Task virtual:native:/home/opopovych/repos/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_configure (dependent Tasks ['expat_2.2.9.bb:do_patch', 'expat_2.2.9.bb:do_prepare_recipe_sysroot', 'expat_2.2.9.bb:do_generate_toolchain_file', 'expat_2.2.9.bb:do_deploy_source_date_epoch'])
>   Task virtual:native:/home/opopovych/repos/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_compile (dependent Tasks ['expat_2.2.9.bb:do_configure'])
>   Task virtual:native:/home/opopovych/repos/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_install (dependent Tasks ['expat_2.2.9.bb:do_compile'])
>   Task virtual:native:/home/opopovych/repos/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_populate_sysroot (dependent Tasks ['expat_2.2.9.bb:do_install'])
>   Task /home/opopovych/repos/poky/meta/recipes-devtools/cmake/cmake-native_3.17.3.bb:do_prepare_recipe_sysroot (dependent Tasks ['expat_2.2.9.bb:do_populate_sysroot', 'xz_5.2.5.bb:do_populate_sysroot', 'bzip2_1.0.8.bb:do_populate_sysroot', 'ncurses_6.2.bb:do_populate_sysroot', 'zlib_1.2.11.bb:do_populate_sysroot', 'cmake-native_3.17.3.bb:do_fetch', 'curl_7.71.1.bb:do_populate_sysroot'])
>   Task /home/opopovych/repos/poky/meta/recipes-devtools/cmake/cmake-native_3.17.3.bb:do_configure (dependent Tasks ['cmake-native_3.17.3.bb:do_deploy_source_date_epoch', 'cmake-native_3.17.3.bb:do_patch', 'cmake-native_3.17.3.bb:do_prepare_recipe_sysroot'])
> 
>  - run-ptest script that initalizes testing, copies testing
> executables' output to log file and measures execution time of each testing
> executable was added.
> 
>  - patch that implements output of each testcase result in testing exectutable
> was added.
> 
> Signed-off-by: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
> ---
>  meta/recipes-core/expat/expat_2.2.9.bb             | 14 ++++++++++----
>  meta/recipes-devtools/cmake/cmake-native_3.17.3.bb |  3 ++-
>  2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-core/expat/expat_2.2.9.bb b/meta/recipes-core/expat/expat_2.2.9.bb
> index 8f3db41352..61bbca1709 100644
> --- a/meta/recipes-core/expat/expat_2.2.9.bb
> +++ b/meta/recipes-core/expat/expat_2.2.9.bb
> @@ -8,15 +8,21 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5b8620d98e49772d95fc1d291c26aa79"
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
>             file://libtool-tag.patch \
> +	   file://run-ptest \
> +	   file://0001-Add-output-of-tests-result.patch \
>  	  "

Could you resend with the two files added to the patch please?

Thanks,

Richard

