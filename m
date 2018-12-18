Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 346326093A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 17:24:28 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id r14so19111805qtp.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 09:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iEolpA4oVB5kgTOf3nIg5fQ/Fmd1fzvnqJAnDEJ0/4Q=;
	b=okDHqXL/ReAjg0bRrL+ip977iiAuGbULjYPio6VwUHeB4QDd7PW+jqrWHkSjzPOUL1
	2MOiW/Oj9/T1w5dQkeKFmR16ZOJuWgz7V2d4G+8t+LoOaz5Y+n6eldyKXT4mdY6i7rpo
	yDQIxQRK8sHK/uNh7t6SCr/bmfkP9nCGd03ev7G3ldzrBsy4G6bjgkCpZATH2HbOvQla
	VLsWaET0NpPLvxlmG+AY/refbPPQINJSHFJDk3nQ5QAVmgUi/agiYaqRdmryW7Y+pj3E
	ZzoMWBbp9RVBsn+MNPPswhyvU6dCrQI2V7gHVye/3fvY7K9H7fNkp1Hd+2ZFh+09svZC
	wDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iEolpA4oVB5kgTOf3nIg5fQ/Fmd1fzvnqJAnDEJ0/4Q=;
	b=O5/1wrp03RIN+e2F5BG7VpLCYmp7UkjOTyukgzdK3OEwNFzqFLereamg2VNC52Zil/
	Js9pjZJT2frPYQl2ZhLUyGFYpvZZQIT16ONdJl1QMH6arYxf3b8Fp21PbcnmHrGjxT2O
	iXZYfDO2FBJhl/mvaBe/+v/f4Wp8W8zCT3OxTgX+aLt5ttjdIxhzBlQV9Q0xuJj50RjN
	cF3THdqVg6I8nGfuA8oPIX5XUg2Z1xMd8Ia+gr/Jr504HZsJmQxTxv4e1cQgLCeIzar2
	z8TFXyzTix8e02FvTQE2x88R3n/5axV/WtU4qItPxa9mNPCZfwj6Vnx/GMa5ffV4vk7T
	8l6Q==
X-Gm-Message-State: AA+aEWYZ8p4gcnnJKBQKNH2rODOTSLGCrxE/8rDWWBOU2Ji8tVYQN3yQ
	C0wkhlyQC6HOtH8dzher4LN2CSOMW+egwPyvWEA=
X-Google-Smtp-Source: AFSGD/XngfCsnt74PdutmJu1R4j2zxYlCDnGzer65yJCkGtB+aJ2CacDZMoT2cc5JkNFbk/+AGJgR/1II4T03AqYcIM=
X-Received: by 2002:ac8:36ba:: with SMTP id a55mr18070771qtc.236.1545153869485;
	Tue, 18 Dec 2018 09:24:29 -0800 (PST)
MIME-Version: 1.0
References: <20181218120337.25019-1-richard.purdie@linuxfoundation.org>
	<20181218120337.25019-6-richard.purdie@linuxfoundation.org>
In-Reply-To: <20181218120337.25019-6-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Dec 2018 09:24:03 -0800
Message-ID: <CAMKF1sqjBL2CHOq4yawojdnmFnYs+9N5VRMUvTdiGh-FU7_cmQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] gcc-runtime: Add missing libc dependency
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
X-List-Received-Date: Tue, 18 Dec 2018 17:24:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 18, 2018 at 4:05 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> For reasons lost in the depths of time, perhaps performane related,
> we only have a dependency on libc at packaging time. This is too late,
> as demonstrated by a recent build failure on non-IA builds where
> the glibc 2.29 upgrade had been removed from the build:
>
> ld: recipe-sysroot/usr/lib/../lib/libstdc++.so: undefined reference to `log@GLIBC_2.29'
>
> libstdc++ should have been rebuilt but had not as the dependency
> wasn't present.
>
> Add the missing dependency to avoid this problem (and drop the other
> form of dependency which is no longer needed).
>

this is good find. lgtm

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/gcc/gcc-runtime.inc | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index 9e7e7c5b3d6..95153da20cd 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -128,7 +128,7 @@ do_install_append_class-target () {
>  }
>
>  INHIBIT_DEFAULT_DEPS = "1"
> -DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++ libgcc"
> +DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++ libgcc virtual/${MLPREFIX}libc"
>  PROVIDES = "virtual/${TARGET_PREFIX}compilerlibs"
>
>  BBCLASSEXTEND = "nativesdk"
> @@ -288,7 +288,3 @@ FILES_libmpx-dev = "\
>  SUMMARY_libmpx-dev = "Intel Memory Protection Extension library - development files"
>  FILES_libmpx-staticdev = "${libdir}/libmpx.a ${libdir}/libmpxwrappers.a"
>  SUMMARY_libmpx-staticdev = "Intel Memory Protection Extension library - static development files"
> -
> -do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
> -do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
> -do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

