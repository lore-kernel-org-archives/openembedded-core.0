Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6EC5D7C29D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 16:52:00 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id o125so140511qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 08:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BTbGOTf8pMRfozp8ZsJrB1YkTIXH3DLW0YahsvNUKMM=;
	b=rGbBZLeqtZSZfr1Zs5xTh/saMCtYsjJmQwOh2JUVqCHuEdk4UUpfd96wzQQcrB2ios
	/7v58Q6yiOAk2T5pSQOaNJZvK0U2cDeCo97OaUUF1dSAmMjM3zPaKs00cshRXvxXYGQR
	yNMrkjNdotSw6JlsDvsd1sVPHDEHV9SuGJdGVALPsLjJTrXQvSxlCLn2w5p5+/dP/3u8
	hdZTiJT97QaAfepOWlL/Y9FZreLDK7DcNC9PtLuqv0TiPwBa8gjs0MCBYkG/HLcFYt64
	talXAiwyeLZvUvyAeLqtjXTwI1HeoZVUkEDscuPA8SKuTiJrl/ZpdnExF+rLVkxmg4az
	94kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BTbGOTf8pMRfozp8ZsJrB1YkTIXH3DLW0YahsvNUKMM=;
	b=sfmYvgKLlPtSrVZ/G0obCS0RYP26LohSIxWLxxnGcAZr34rnOWaAxm/joE30JR+Veq
	8VZPTw68YvNC0d7iarsYNqOzCuD71DbZlG9tizVJcv0McTAWJqOSe5f0q+fHwfQzCrpo
	fJjpZr1sCUmPRtpYqGpv2iJW4cn3CpKXR6PYI/ciN4bzNeFR+A2zFOd2Q//1SEbOb22W
	v30Jh3xgnYgLwygPNWLn343lYAfaXf1JJygIr17dAxGe3Rv2EoqfkIWeRVfrBWQ+aeQK
	pclkZReUX+MUxO/9e12b4LF/WbRzGPRXJCPL+fuvnh+emJvciMUdkgcYyWCs5tif4urX
	/hUg==
X-Gm-Message-State: AJcUukd6/DRhWIzVdNP50bK6v4T/WbR5NozYgA84CCOcr3qidyHQn4Py
	HDATxJoLqe3XgjJTUUMyZs9+72CBqAlzP1nzTM8Myh50
X-Google-Smtp-Source: ALg8bN5tkgaHQd9yrLlbH4pSUad5v3z8NrqfYU2L4IkdW6So+NlatZ2JouNP+RdqFwyK+A24I6fVnkdLCo0HUVa9Yk8=
X-Received: by 2002:ae9:dc43:: with SMTP id q64mr27804206qkf.223.1548867121210;
	Wed, 30 Jan 2019 08:52:01 -0800 (PST)
MIME-Version: 1.0
References: <1548835368-52735-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1548835368-52735-1-git-send-email-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Jan 2019 08:51:35 -0800
Message-ID: <CAMKF1sr1_QEVWfcWEXY+StDW1Kt5OSQnB_VG7L=7djdcOPXY2A@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-runtime: fix C++ header mapping for n32/x32 tune
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
X-List-Received-Date: Wed, 30 Jan 2019 16:52:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 30, 2019 at 12:03 AM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
>     The SDK was unable to find the C++ header pieces correctly since it's
>     using a generic compiler, not one specifically targeting the multilib
>     vendor prefix and default tune.  This adds the right mapping to ensure
>     SDKs work as expected. And fix problem in below configurations:
>
>     multilib configuration:
>     MACHINE="qemumips64"
>     MULTILIBS ?= "multilib:lib32 multilib:libn32"
>     DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
>     DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
>     MULTILIB_GLOBAL_VARIANTS_append = " libn32"
>     require conf/multilib.conf
>
>     ignoring nonexistent directory "<path>/sysroots/mips64-poky-linux/usr/include/c++/8.2.0/mips64-poky-linux/32
>

seems fine to me.

> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-runtime.inc | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index 50ecc81..e0f5c80 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -98,16 +98,16 @@ do_install_append_class-target () {
>
>         if [ "${TARGET_OS}" = "linux-gnun32" ]; then
>                 if [ "${MULTILIBS}" != "" ]; then
> -                       mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-pokymllib64-linux
> -                       ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-pokymllib64-linux/32
> +                       mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux
> +                       ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux/32
>                 else
>                         ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
>                 fi
>         fi
>         if [ "${TARGET_OS}" = "linux-gnux32" ]; then
>                 if [ "${MULTILIBS}" != "" ]; then
> -                       mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-poky-linux
> -                       ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-poky-linux/x32
> +                       mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux
> +                       ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux/x32
>                 else
>                         ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
>                 fi
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

