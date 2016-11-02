Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9D1D3602D9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 14:44:48 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id c17so3391555wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 07:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Xgj9xI3H0OtM5AylJJeNgYB3j5RFGzTFU/PYXp189ms=;
	b=eV067SFZ9GiXZ4rjmBGIEp625G8Lt23oAnzynF14ikZi9SAssMSOZ9YYrn/YkLtBi0
	2ft9Gqw2WzejjCZEsD/mCgBTwJ5cIMzQ3gFb+8Te0fp4Z0SoDSiKiL6LdaWqdnjYMfVs
	WBvMuPVULGGsWaeJaUcafdnPe/hJjP4O1rK52VR+JOIAMPkTjje3EE5mAWcn2atJIhWa
	uOqnMwcWpFqOGQs+QojiYmS2tNro8M4X5nUIroAsJk9BIDXkw/kEMCDLo+ah9ZbSjf8m
	hm2jmeMwkD6Eey70P8gh8fRokiLa54Jzuv/DOOoQCFW53geQ3o9NykvuTC6BZkqiYCgJ
	Wx7A==
X-Gm-Message-State: ABUngvfYmKMW3gwV5Lr2QJLNT0Oqgr5zIKvAZx/+tsjmU9rn5/YiLxWoGsrWPpKt9psgsw==
X-Received: by 10.28.167.139 with SMTP id q133mr3790095wme.15.1478097889452;
	Wed, 02 Nov 2016 07:44:49 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id h2sm3135558wjy.40.2016.11.02.07.44.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 Nov 2016 07:44:48 -0700 (PDT)
Message-ID: <1478097887.24374.8.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 02 Nov 2016 14:44:47 +0000
In-Reply-To: <20161102120724.30063-1-marex@denx.de>
References: <20161102120724.30063-1-marex@denx.de>
X-Mailer: Evolution 3.22.1-2 
Mime-Version: 1.0
Subject: Re: [PATCH] u-boot: mkimage: Fix build of u-boot-mkimage
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
X-List-Received-Date: Wed, 02 Nov 2016 14:44:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-11-02 at 13:07 +0100, Marek Vasut wrote:
> The build failed on qemux86-64 because it couldn't execute
> tools/bin2header on a host due to it being compiled with target
> toolchain. Drop the incorrect EXTRA_OEMAKE and just use the one
> from u-boot-common*.inc . Moreover, since U-Boot buildsystem
> already strips the tools, add INSANE_SKIP = "already-stripped" .
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
> b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
> index 5025961..76b303e 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
> @@ -3,8 +3,6 @@ require u-boot-common_${PV}.inc
>  SUMMARY = "U-Boot bootloader image creation tool"
>  DEPENDS = "openssl"
>  
> -EXTRA_OEMAKE = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS}
> ${LDFLAGS}" STRIP=true V=1'

Can we keep V=1, please? (Unless it's default anyway).

Cheers,
Andre'

> -
>  do_compile () {
>  	oe_runmake sandbox_defconfig
>  	oe_runmake cross_tools NO_SDL=1
> @@ -17,3 +15,4 @@ do_install () {
>  }
>  
>  BBCLASSEXTEND = "native nativesdk"
> +INSANE_SKIP_${PN} = "already-stripped"
> -- 
> 2.9.3
> 

