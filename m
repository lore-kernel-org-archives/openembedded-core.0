Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web10.7902.1589296814394359415
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 08:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h+o89+/j;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id f7so6504085pfa.9
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 08:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Y3xKt4qc5vxn8AOOt0lRT98vzvXX+V5Ba8lMOQkPjOU=;
        b=h+o89+/jbPlr76+cNSjIAAbQye7FsZaN6bHwPBUJ3Nhl/VtQ9mvD/GZEb2ovCoCZY1
         4Ts2VRWve0mbEnuBdcAc3mQUu1Zs4q0IWzBez7491nBk3q8G8dBE+wGbK4btvi5UoVYr
         58kXNXAmOogmyCjxHN69facLAryvX7wNfQVVLBaNWTfruSmJV4Mydjii1DYDscWwCRJ3
         cNyNNBL1dFRRa58HAIm1ZuhA8RWSCIsMvJ4hb1tjCTIhh7QYodQcDg7ytj1hk64ZMaI6
         0BbePYWDBIbL8ML+tai0KOwL2CDT2nrHiaTQxuM0mH3pMlDs9zswPSNk46ScyEP5bM74
         gk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Y3xKt4qc5vxn8AOOt0lRT98vzvXX+V5Ba8lMOQkPjOU=;
        b=bDmxSdi5SUT1YKlz8NCaxKB/DD2XkPkf7PahzvWfeyLzfAeoqJBzmDA0kD78rTsUzV
         P4E06L2MrVNZTqj7znrABdO/yHgPvb8vRxnSDSuiD4TmGyXrCBPhpQWX2xh6XxB6H0V2
         ZRiEPK76UWpGC2I+s8I+HgvYK7XDC+F/efK2rnUNs7CNmO0hgfqnpJ0dgM9qygi9SRoD
         8/zsa/bCjA9E8KqlYVC/eyRWbjBZQ+bRxnqGwr7wORzCy8fhQO1yAgoaDHTXvQ6jiTYQ
         aodeU+E5b3l2HWBOTkKg9xTThytONEwEkJUwGELwaO0Klckj6rmPpptJKPR40ahx20oT
         5ezw==
X-Gm-Message-State: AGi0PuYiGvli7J3GedpjLsYk7dDxQ/g+jehilrPAMPmE+ipWjY7rYM2T
	/FJvZ6Av4RBNYWG01l9vagzGRVDm9mg=
X-Google-Smtp-Source: APiQypI3Kx8uKZjlIVleJq8YxGCwO/adEaAV2Zwp57O8G+x8+Lb2JONgMOYuQBcq4n4OHsHOpbCyLQ==
X-Received: by 2002:a63:1854:: with SMTP id 20mr20544974pgy.257.1589296813130;
        Tue, 12 May 2020 08:20:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:e967:869:15dc:c2fd? ([2601:646:9200:4e0:e967:869:15dc:c2fd])
        by smtp.gmail.com with ESMTPSA id j13sm13375253pje.1.2020.05.12.08.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2020 08:20:12 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 1/3] bitbake.conf: propagate 'opengl' DISTRO_FEATURE to native/nativesdk from target
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20200512151125.30472-1-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <6194fc05-2ee6-f7fd-823f-71a88dc19149@gmail.com>
Date: Tue, 12 May 2020 08:20:11 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200512151125.30472-1-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/12/20 8:11 AM, Alexander Kanavin wrote:
> This will allow better control over native virgl/qemu configurations.
> 
> Adjust gtk+3/cairo native configurations to actually ignore opengl
> when building for -native: we do not need it, and it would cause build
> failures as only a limited subset of mesa-native is currently built.
> 
> Drop native/nativesdk overrides from virglrenderer/libepoxy recipes
> as opengl feature is now correctly set for those variants.
> 

DISTRO_FEATURES are meant for target most of the time so this seems not 
the right way to go about it. perhaps HOST_DISTRO_FEATURES or some such
would be the way to go, since it should not be enforced on folks who do
not want it and dont use qemu as machine but just as a veneer to cross 
build stuff.

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   meta/conf/bitbake.conf                                     | 4 ++--
>   meta/recipes-gnome/gtk+/gtk+3.inc                          | 2 ++
>   meta/recipes-graphics/cairo/cairo_1.16.0.bb                | 2 ++
>   meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb           | 2 --
>   meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb | 2 --
>   5 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index bdade79abe..f7700f1191 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -833,8 +833,8 @@ DISTRO_FEATURES_NATIVESDK ?= "x11"
>   
>   # Normally target distro features will not be applied to native builds:
>   # Native distro features on this list will use the target feature value
> -DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation"
> -DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation"
> +DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation opengl"
> +DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation opengl"
>   
>   DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit gobject-introspection-data ldconfig"
>   MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
> diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
> index 5d1f59ea1a..6154154004 100644
> --- a/meta/recipes-gnome/gtk+/gtk+3.inc
> +++ b/meta/recipes-gnome/gtk+/gtk+3.inc
> @@ -46,6 +46,8 @@ do_compile_prepend() {
>   
>   PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl wayland x11', d)} \
>                      ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'glx', '', d)}"
> +PACKAGECONFIG_class-native = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> +PACKAGECONFIG_class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
>   
>   PACKAGECONFIG[x11] = "--enable-x11-backend,--disable-x11-backend,at-spi2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr libxrender libxcomposite libxfixes"
>   # this is provided by oe-core patch that removes epoxy/gl dependency from a X11 build
> diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> index b772c2ece2..092c77b826 100644
> --- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> +++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> @@ -42,6 +42,8 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
>                      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
>                      ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)} \
>                      trace"
> +PACKAGECONFIG_class-native = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)}"
> +PACKAGECONFIG_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)}"
>   
>   PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --disable-xlib,${X11DEPENDS}"
>   PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
> diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
> index 0782c6ce35..6646ef79fe 100644
> --- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
> +++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
> @@ -19,8 +19,6 @@ UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
>   inherit meson pkgconfig features_check
>   
>   REQUIRED_DISTRO_FEATURES = "opengl"
> -REQUIRED_DISTRO_FEATURES_class-native = ""
> -REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
>   
>   PACKAGECONFIG[egl] = "-Degl=yes, -Degl=no, virtual/egl"
>   PACKAGECONFIG[x11] = "-Dglx=yes, -Dglx=no -Dx11=false, virtual/libx11 virtual/libgl"
> diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
> index 1046b8504f..29b12628d0 100644
> --- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
> +++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
> @@ -22,5 +22,3 @@ inherit meson pkgconfig features_check
>   BBCLASSEXTEND = "native nativesdk"
>   
>   REQUIRED_DISTRO_FEATURES = "opengl"
> -REQUIRED_DISTRO_FEATURES_class-native = ""
> -REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
> 
> 
> 
> 
