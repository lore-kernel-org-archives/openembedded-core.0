Return-Path: <tharvey@gateworks.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id A1F5E77EFD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 01:11:23 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id b84so220004159wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 18:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gateworks-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=U2Cc4pxeYn9TjAvKAu7bUN8DEX43z7wdOhqSkw2/1/A=;
	b=00Wcr8eMX10R9mQig2ArrciP8V6S2TTQYPOE1eeUrKzOGTfGVFSB9DpuSbi1YKKq3Y
	muuPiX6pFEr94KYnt/Uvi2gaz0J3d8SQuB6aD2d9nN/tkB7PHnEgT5XU/pBA+6JHccJu
	zWReTsJtQwipgZotJllE3VUF7GfA/6nO03LPlzo+LX69WUM+aj7aly3MiPoI3UkiktbC
	EtnXC5x8vFpGmHI7rEnLgrP96LeFmpSHV7YTpxnFYQOrdHeH4dgWaCylLjcP5HjcMXgt
	N4MFT1opJWHxJX+qgp880xvwbefBSSbA+3X5e1uQypP9VzR9OF7bGU8zhnOdfZz1P6zm
	jP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=U2Cc4pxeYn9TjAvKAu7bUN8DEX43z7wdOhqSkw2/1/A=;
	b=B4V21lPd0Kqdxy7qgtf/ofWIeag8QFA7PwO3sD7Dj4ky/0kW3NKDxwGZ28pJ3xdulj
	Tbs0jTwrcQdKhk2NreLwTBDKAYasx3dYIexYSBDAdKh1rtya0J0fKcUPLICTSjHCaoU9
	yihyGxiSIsK8fxBpTGpFG8/WjEjC5Ftf3XesnK2ZFmTxk7GjEN1i6Atu4m3BZUY0geXg
	E7bAAMSSCsG5i339A8EMgeQySGmA87XICC2d+eG5mg4H17y7pP3W417GGnaXU9SeTtgn
	afVQFGelsjOb8BuKY9XLnVoYcJX8HlXlS3oAYvVliYWANQHbBMxfm69M+fcVqfgAVRhW
	iMLg==
X-Gm-Message-State: AODbwcDfLukVdEgqhZm5QciSUsT4ko6LevA1TFIIsGyHoqgDQ+XNV1vN
	tzzorpZiq5CYJwh5H1dxZKCbC27PrZq2
X-Received: by 10.28.191.89 with SMTP id p86mr4381164wmf.27.1495156283908;
	Thu, 18 May 2017 18:11:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.142.206 with HTTP; Thu, 18 May 2017 18:11:23 -0700 (PDT)
In-Reply-To: <20170517201134.26758-1-max.krummenacher@toradex.com>
References: <20170517201134.26758-1-max.krummenacher@toradex.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 18 May 2017 18:11:23 -0700
Message-ID: <CAJ+vNU1sSaxxBiUxs1HRajgCuNhv3qK-6qfsRy+-DLmCw4=7SA@mail.gmail.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot-mkimage: fix nativesdk build
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
X-List-Received-Date: Fri, 19 May 2017 01:11:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 17, 2017 at 1:11 PM, Max Krummenacher <max.oss.09@gmail.com> wrote:
> If building for nativesdk the wrong rss sysroot is used leading the
> following error message.
>
> | ERROR: oe_runmake failed
> | In file included from tools/imximage.c:13:0:
> | include/image.h:1024:27: fatal error: openssl/evp.h: No such file or directory
> |  # include  <openssl/evp.h>
>
> Tools needed on the build host (script/basic/fixdep) and code compiled
> for the SDK machine are both built with the build host's compiler,
> leading to additinal errors.
>
> Adding CROSS_COMPILE="${HOST_PREFIX}" and using the cross-compiler for
> the SDK_ARCH fixes the build error.
> The resulting binary in the SDK is working.
>
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
> index 1aa95e7..de999e7 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
> @@ -7,7 +7,7 @@ DEPENDS = "openssl"
>
>  EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
>  EXTRA_OEMAKE_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
> -EXTRA_OEMAKE_class-nativesdk = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
> +EXTRA_OEMAKE_class-nativesdk = 'CROSS_COMPILE="${HOST_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
>
>  do_compile () {
>         oe_runmake sandbox_defconfig
> --

This resolved build sdk issues on pyro

Tested-by: Tim Harvey <tharvey@gateworks.com> - pyro branch

