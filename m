Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 84EE17069F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 13:54:29 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id q107so5089451qgd.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 06:54:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=K0vAq5ZyWl4cE8jmVvTk/wYL0zzbYiBywSPDpS1Hrt8=;
	b=WlaXKH7/5uojSc1h4mAr86SqN44W/AB2h32n3lLNLBykS31bxY+HZooFEGbIBtnTme
	wqyexfbS1rroQaVNnRhUyQB8yggCV6wZ9GI92yxoKzNS3l2exHjFgXLMvJutM/SUKwvv
	hX+mvrRJAQrQvM/V8P9idp0L5sKPqxCaGWqJDU9ib4xCbyPJDA2rK/Htm9vdxej7bbkh
	IWEEqsW81lB9IPlNWOnicY18u3ja+rh6Al007n40CtBW8iZDC4hwUZjUjZWftJr9dFfn
	J7HyrzixjkSvRJcguHLEUbdMoVQzxCWbO+4yZ1QpvvYrV3ZOc+27CjsKKniQwedXAkpI
	DQkg==
X-Gm-Message-State: ALoCoQn5gmoP0MAQYB1Sbq83iuhu382/kMMWQL1S92Z2k2wXJvE9GOE+0p93SeIuFAYMX3nkbESW
X-Received: by 10.224.122.83 with SMTP id k19mr26886146qar.78.1406296470445;
	Fri, 25 Jul 2014 06:54:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Fri, 25 Jul 2014 06:54:10 -0700 (PDT)
In-Reply-To: <1406295506-29531-1-git-send-email-otavio@ossystems.com.br>
References: <1406295506-29531-1-git-send-email-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 25 Jul 2014 14:54:10 +0100
Message-ID: <CAJTo0LbSMHyyUyeJP0d6mQS8hRJpEXGc0DFtL03nyAZ3xiPaWg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cogl-1.0: Add libcogl-path package
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
X-List-Received-Date: Fri, 25 Jul 2014 13:54:31 -0000
Content-Type: text/plain; charset=UTF-8

Context is that upstream split this library out from libcogl20.so, so
the libcogl package no longer gets renamed to libcogl20 as it contains
multiple libraries.

Acked-by: Ross Burton <ross.burton@intel.com>

Ross

On 25 July 2014 14:38, Otavio Salvador <otavio@ossystems.com.br> wrote:
> The new library needs to be put in a specific package, or rootfs
> generation fails as:
>
> ,----[ Error in rootfs generation ]
> | Updating cache...               ########################### [100%]
> | Computing transaction...error: Can't install
> |   libclutter-1.0-0-1.18.2-r0@cortexa9hf_vfp_neon_mx6: unable to
> |   install provider for libcogl-path.so.20:
> |      error: libcogl-path20-1.18.2-r0@cortexa9hf_vfp_neon_mx6 is
> |        conflicted by libcogl20-1.18.2-r0@cortexa9hf_vfp_neon_mx6
> `----
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/recipes-graphics/cogl/cogl-1.0.inc | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
> index e25968e..b763dd5 100644
> --- a/meta/recipes-graphics/cogl/cogl-1.0.inc
> +++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
> @@ -8,7 +8,8 @@ DEPENDS = "glib-2.0 gdk-pixbuf"
>  PACKAGES =+ "${PN}-examples \
>               libcogl libcogl-dev \
>               libcogl-gles2 libcogl-gles2-dev \
> -             libcogl-pango libcogl-pango-dev"
> +             libcogl-pango libcogl-pango-dev \
> +             libcogl-path libcogl-path-dev"
>  AUTOTOOLS_AUXDIR = "${S}/build"
>
>  # Extra DEPENDS for PACKAGECONFIG
> @@ -75,6 +76,12 @@ FILES_libcogl-pango-dev = "${includedir}/cogl/cogl-pango \
>                             ${libdir}/libcogl-pango.la \
>                             ${libdir}/pkgconfig/cogl-pango-1.0.pc"
>
> +FILES_libcogl-path = "${libdir}/libcogl-path${SOLIBS}"
> +FILES_libcogl-path-dev = "${includedir}/cogl/cogl-path \
> +                          ${libdir}/libcogl-path${SOLIBSDEV} \
> +                          ${libdir}/libcogl-path.la \
> +                          ${libdir}/pkgconfig/cogl-path-1.0.pc"
> +
>  # For backwards compatibility after Debian-renaming
>  RPROVIDES_libcogl = "cogl-1.0"
>  RCONFLICTS_libcogl = "cogl-1.0"
> --
> 2.0.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

