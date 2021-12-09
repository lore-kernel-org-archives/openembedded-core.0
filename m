Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A348C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 21:06:48 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web12.17471.1639084007268970179
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 13:06:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=CnbIEXfs;
 spf=pass (domain: konsulko.com, ip: 209.85.160.178,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-qt1-f178.google.com with SMTP id 8so6590875qtx.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 13:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=qudcGfLjEAyy8IVTFGtVtYYIcdZms5Ks2NbYfoVNdRY=;
        b=CnbIEXfsxo4vqNGAh97BYDlVUIqJ4drM9+nIkTKpzXznL97qpNQoi3aLqnxHjhPbuT
         Zi4YuFT0EgNZXDEPICRXQuPfIIx5gIByOxL83ZRI+m3ByVHHsRySvn3+QqXoVCmw0tCO
         NQg3lWCiXee9hTV1SqahIxNFKq6u47k97rpFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=qudcGfLjEAyy8IVTFGtVtYYIcdZms5Ks2NbYfoVNdRY=;
        b=vclmFpWVt7waKD8XolbpzaMitB2nI2SuWPqkV5BP1NMT9rFuPLXbIdQooDEc03Auo9
         7OGppiRCGSL79f9vKxW+3Ko3vLRPL3pOnA7jW3xg8kds4q9plZn9v53Rm/b/i7IANpgK
         OuNxuOIiFr+5OWSJgyrQlQiKbvn1KLY/tnDd2VLf6c0RksiTUjtVAbc2FP4APyDAOBMl
         cdA5QI9TUMaz8vZweJQqkc03IrplsYZjCzYSs+HHGhLFOZHOubDGFz0MC+XuPH2uaJjK
         PPzXX3quDZKnpbAO29F2BdFlxeG0ste8235WKktUvcMoik/Zyh/JGgUv4y9Q2Or/qOuK
         GR/Q==
X-Gm-Message-State: AOAM533WgbXGrTH+HyyDmZEOCcOa6cxBYGYaiVYzHU5OJ2LevAufUgA7
	cTp0cb7YUzOVsiVzvnQxBI8BrrpMQ8xRBQ==
X-Google-Smtp-Source: 
 ABdhPJzqWa+vEdnOQez4GXrZzbzviJF/WbU/a9f2Asr9/xGZ+NfcmOoiXb7u7KJtQzMOuuAjyL7fcQ==
X-Received: by 2002:ac8:7f06:: with SMTP id f6mr21022971qtk.258.1639084006203;
        Thu, 09 Dec 2021 13:06:46 -0800 (PST)
Received: from godzilla (192-0-174-222.cpe.teksavvy.com. [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 ay42sm368397qkb.40.2021.12.09.13.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 13:06:45 -0800 (PST)
Date: Thu, 9 Dec 2021 16:06:45 -0500 (EST)
From: Scott Murray <scott.murray@konsulko.com>
To: Joshua Watt <JPEWhacker@gmail.com>
cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] webkitgtk: Add packageconfig for libsoup2
In-Reply-To: <20211209204417.3924102-1-JPEWhacker@gmail.com>
Message-ID: <4de5682a-7213-d019-1dde-d860501aaa2@spiteful.org>
References: <20211209204417.3924102-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 21:06:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159481

On Thu, 9 Dec 2021, Joshua Watt wrote:

> Adds a PACKAGECONFIG option to use libsoup2 instead of libsoup3.
> Including libsoup2 and libsoup3 in the same process can cause strange
> runtime failures, and the latest release of each major version will
> cause the process to exit if either if both are detected on process

I'm guessing the "if either" is a leftover from editing?

> startup.
>
> The default is changed from libsoup3 back to libsoup2. Most GNOME
> packages are still using libsoup2, and a large number of these pull in
> webkitgtk either directly or indirectly. If webkitgtk uses libsoup3,
> this causes all of these packages to fail at startup. It appears that
> most GNOME packages will have to switch to libsoup3 when they transition
> to GTK4.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.34.2.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb
> index 413e0cdf92..279e260441 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb
> @@ -38,12 +38,12 @@ DEPENDS = " \
>            atk \
>            libwebp \
>            gtk+3 \
> -          libsoup \
>            libxslt \
>            libtasn1 \
>            libnotify \
>            gstreamer1.0 \
>            gstreamer1.0-plugins-base \
> +          ${@bb.utils.contains("PACKAGECONFIG", "soup2", "libsoup-2.4", "libsoup", d)} \
>            "
>
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
> @@ -52,6 +52,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11',
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl-or-es', '', d)} \
>                     enchant \
>                     libsecret \
> +                   soup2 \
>                    "
>
>  PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland libwpe wpebackend-fdo wayland-native"
> @@ -70,6 +71,7 @@ PACKAGECONFIG[openjpeg] = "-DUSE_OPENJPEG=ON,-DUSE_OPENJPEG=OFF,openjpeg"
>  PACKAGECONFIG[systemd] = "-DUSE_SYSTEMD=ON,-DUSE_SYSTEMD=off,systemd"
>  PACKAGECONFIG[reduce-size] = "-DCMAKE_BUILD_TYPE=MinSizeRel,-DCMAKE_BUILD_TYPE=Release,,"
>  PACKAGECONFIG[lcms] = "-DUSE_LCMS=ON,-DUSE_LCMS=OFF,lcms"
> +PACKAGECONFIG[soup2] = "-DUSE_SOUP2=ON,-DUSE_SOUP2=OFF,,"
>
>  # webkitgtk is full of /usr/bin/env python, particular for generating docs
>  do_configure[postfuncs] += "setup_python_link"
> @@ -124,7 +126,7 @@ EXTRA_OECMAKE:append:x86-x32 = " -DENABLE_JIT=OFF "
>  SECURITY_CFLAGS:remove:aarch64 = "-fpie"
>  SECURITY_CFLAGS:append:aarch64 = " -fPIE"
>
> -FILES:${PN} += "${libdir}/webkit2gtk-4.1/injected-bundle/libwebkit2gtkinjectedbundle.so"
> +FILES:${PN} += "${libdir}/webkit2gtk-4.*/injected-bundle/libwebkit2gtkinjectedbundle.so"

Is this required for the libsoup2 changes?

>  RRECOMMENDS:${PN} += "ca-certificates shared-mime-info"
>
>

Cheers,

Scott




