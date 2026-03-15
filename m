Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D8BF30283
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 20:20:46 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36015.1773606038200235017
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 13:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Z9Qe/zZ2;
 spf=pass (domain: konsulko.com, ip: 209.85.222.180, mailfrom: scott.murray@konsulko.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8cd80f56b27so354696585a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1773606037; x=1774210837; darn=lists.openembedded.org;
        h=mime-version:references:message-id:in-reply-to:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tWHso62CUIvip4tP2npwectWM7SYNQRUJKQu2gwdLPs=;
        b=Z9Qe/zZ20MTeFW9TkvAuspvg8HFs0Oqp9jngIgXrmX7Wa+DBSYbJuJ85ksaVN9fcHd
         yBZosJh34hD8MabEXEKYrvQarW+EbR3EaZNQnetRD1otLy9x9DYXMp35crLkWzIjMThF
         lMUn0+qK0K7otPKwDakRyWdP64ckZ3ICBvhmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773606037; x=1774210837;
        h=mime-version:references:message-id:in-reply-to:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tWHso62CUIvip4tP2npwectWM7SYNQRUJKQu2gwdLPs=;
        b=Ud7ZOanYOwOQJTrSMCJBDwkukfpKSKM3OeIJU3j7Z43b7BUpVvLfE2CsXdO6nak7N/
         XNc0R5CEpWyGrArFbxPOKXOGgsLnYuKjQ8n+kaCLzAE9CzumIXo0z+9sS1WcReZHZ41D
         TiZqhH00VCC++RphEp1hOaynEfJJOg9lrvmBmMDNot2l6DboVzeL1cUTh6NJtO3/2ejd
         AjyDBP1X128Z19RaU/xXQtqx7x3bBH6TE9Vpo1hqWzXpLT3rbBuDH1cShhBobm0oT/oO
         dq5FRWNpZcq4JEXIp1YchIQAYz0PC6sis8+mU9fKKrtbJU4AecFf4nHUIIO0YdzSKN21
         1wgQ==
X-Gm-Message-State: AOJu0Yzv5KJe0ARdrg9hWsgihpkIR2TeGTbR/ISPpw6fXaEbfH/Y51UY
	PUNVZrWW6HzbzpVV/stTj0ARAjb+AVroaGY6zgqc+Qy2JawnCdHknRAG5JBcC3CMLwFfpu15gc7
	8L878
X-Gm-Gg: ATEYQzyYK1nT338vLscvAj7pbOgYMF7wqWYcOxy6YNV3mjV0ujeTQX/zKq296At1xes
	wdqJBcn8jjPKJoNsRMcgzMX/biBCqXIvPe+LHjge9vp2k9VzACLXf3Hjj8Cfsp6C0dwVA5zwjgA
	Ggx9PShmJ6POH8k/mVGm+ZUlo8vqmEYq+MgzhyMCKrWJfhhME1D229fhJGoSDrBG9NAsd2Q0pHC
	o+QxLj9Va+8kB0VDh/IwEp5iPl77+ieOw4USgR6F0U6WFiqy3rI9eBxrfhOdb6uIAJiR3dwaki9
	La14r5L6fXjJfobNf/rITnMkWFKp08ydcPG4/9RQGbhtgGXJd2Kkzcs+H7yKk5ArnA+0/WAi7ol
	kt4ihmEpg8Iyy0Byoavsp1zwGv0KC/8KQ2ts20no07UFcruQ/pPGfYzIj398oscAJ6Z+4DmVP4d
	aszOomnTallyTA6wtcoVGgWt4DxQ6Ai9egUZ7265WG0bSW+6SU070EBuKUUSIQbDJkFWAwo7fYE
	aDTVShAMao0pWZNg84lILkn/w4lfjBQlfr1hsTf3YdDYnU=
X-Received: by 2002:ac8:5fc9:0:b0:509:1ee2:69e4 with SMTP id d75a77b69052e-50957b8cafcmr141675241cf.11.1773606036719;
        Sun, 15 Mar 2026 13:20:36 -0700 (PDT)
Received: from godzilla (107-179-213-3.cpe.teksavvy.com. [107.179.213.3])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50939e8e4b6sm99293671cf.1.2026.03.15.13.20.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 13:20:35 -0700 (PDT)
Date: Sun, 15 Mar 2026 16:20:06 -0400 (EDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/1] weston: update to 15.0.0
In-Reply-To: <189AD5373B81538B.1148757@lists.openembedded.org>
Message-ID: <0eb0b20e-05f8-f9ac-d70b-0da29d58c7aa@konsulko.com>
References: <cover.1772963425.git.scott.murray@konsulko.com> <189AD5373B81538B.1148757@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 20:20:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233200

On Sun, 8 Mar 2026, Scott Murray via lists.openembedded.org wrote:

> Announcement:
> https://lore.freedesktop.org/wayland-devel/aZbDU-xtVMLhB0wD@xpredator/
>
> Functional changes:
> - New Vulkan renderer. A "vulkan" PACKAGECONFIG option has been
>   added to enable building it, and it is enabled if "vulkan" is
>   present in DISTRO_FEATURES, similar to how X11 and Wayland are
>   handled.
> - New Lua shell. A "lua-shell" PACkAGECONFIG option has been added
>   to enable building it, but it has not been enabled by defsult to
>   avoid affecting build times.
> - Fullscreen shell and screen-share module marked as deprecated.
>   Their PACKAGECONFIG options have been updated to still work, but
>   have not been renamed to avoid breaking working configurations.
> - Perfetto support. A "perfetto" PACKAGECONFIG option has been
>   added to enable building it, but it is not on by default due
>   to meta-oe being required to build.
> - The "client-no-resize" option for the RDP backend has been
>   replaced with "resizeable/no-resizeable" to match the VNC
>   backend. The example in weston.ini has been updated.
>
> Signed-off-by: Scott Murray <scott.murray@konsulko.com>

I couldn't make the dev call this past week due to being at Embedded
World, but I've seen no replies (perhaps a good thing wrt patchbot)
and this does not seem to have made it to master-next.  Is there
something else required to get it considered for M3?

Thanks,

Scott


> ---
>  .../wayland/weston-init/weston.ini            |  2 +-
>  ...d-drm-meson.build-allow-libdisplay-i.patch | 28 -------------------
>  .../{weston_14.0.2.bb => weston_15.0.0.bb}    | 17 +++++++----
>  3 files changed, 12 insertions(+), 35 deletions(-)
>  delete mode 100644 meta/recipes-graphics/wayland/weston/0001-libweston-backend-drm-meson.build-allow-libdisplay-i.patch
>  rename meta/recipes-graphics/wayland/{weston_14.0.2.bb => weston_15.0.0.bb} (88%)
>
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston.ini b/meta/recipes-graphics/wayland/weston-init/weston.ini
> index 6bd5aef55a..0ec70c3ef3 100644
> --- a/meta/recipes-graphics/wayland/weston-init/weston.ini
> +++ b/meta/recipes-graphics/wayland/weston-init/weston.ini
> @@ -69,7 +69,7 @@ require-input=false
>  #max_accel_factor = 1.0
>
>  [screen-share]
> -command=/usr/bin/weston --backend=rdp-backend.so --shell=fullscreen-shell.so --no-clients-resize
> +command=/usr/bin/weston --backend=rdp-backend.so --shell=fullscreen-shell.so --no-resizeable
>
>  #[xwayland]
>  #path=/usr/bin/Xwayland
> diff --git a/meta/recipes-graphics/wayland/weston/0001-libweston-backend-drm-meson.build-allow-libdisplay-i.patch b/meta/recipes-graphics/wayland/weston/0001-libweston-backend-drm-meson.build-allow-libdisplay-i.patch
> deleted file mode 100644
> index 07916f77b3..0000000000
> --- a/meta/recipes-graphics/wayland/weston/0001-libweston-backend-drm-meson.build-allow-libdisplay-i.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From fe8166164170465458561581afd55c325d8e138b Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex@linutronix.de>
> -Date: Wed, 17 Dec 2025 12:54:20 +0100
> -Subject: [PATCH] libweston/backend-drm/meson.build: allow libdisplay-info
> - 0.3.0
> -
> -The patch in the main branch is against top level meson.build,
> -so I manually edited in the same tweak in the 14.x codebase.
> -
> -Upstream-Status: Backport [https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1815]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - libweston/backend-drm/meson.build | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/libweston/backend-drm/meson.build b/libweston/backend-drm/meson.build
> -index 002669e..a8f2ea5 100644
> ---- a/libweston/backend-drm/meson.build
> -+++ b/libweston/backend-drm/meson.build
> -@@ -4,7 +4,7 @@ endif
> -
> - dep_libdisplay_info = dependency(
> - 	'libdisplay-info',
> --	version: ['>= 0.1.1', '< 0.3.0'],
> -+	version: ['>= 0.1.1', '< 0.4.0'],
> - 	fallback: ['display-info', 'di_dep'],
> - 	default_options: [
> - 		'werror=false',
> diff --git a/meta/recipes-graphics/wayland/weston_14.0.2.bb b/meta/recipes-graphics/wayland/weston_15.0.0.bb
> similarity index 88%
> rename from meta/recipes-graphics/wayland/weston_14.0.2.bb
> rename to meta/recipes-graphics/wayland/weston_15.0.0.bb
> index c53b03def0..94ae818656 100644
> --- a/meta/recipes-graphics/wayland/weston_14.0.2.bb
> +++ b/meta/recipes-graphics/wayland/weston_15.0.0.bb
> @@ -11,10 +11,9 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
>             file://weston.desktop \
>             file://xwayland.weston-start \
>             file://systemd-notify.weston-start \
> -           file://0001-libweston-backend-drm-meson.build-allow-libdisplay-i.patch \
>             "
>
> -SRC_URI[sha256sum] = "b47216b3530da76d02a3a1acbf1846a9cd41d24caa86448f9c46f78f20b6e0ac"
> +SRC_URI[sha256sum] = "58c6186d29a5d2f0be0dec4882af71cc190a11da803f6ed1bf0b2c74120da973"
>
>  UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/weston/-/tags"
>  UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
> @@ -36,7 +35,7 @@ EXTRA_OEMESON += "-Dpipewire=false -Dtests=false"
>
>  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms wayland egl clients', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
> -                   ${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)} \
> +                   ${@bb.utils.filter('DISTRO_FEATURES', 'systemd vulkan x11', d)} \
>                     ${@bb.utils.contains_any('DISTRO_FEATURES', 'wayland x11', '', 'headless', d)} \
>                     image-jpeg \
>                     screenshare \
> @@ -63,9 +62,11 @@ PACKAGECONFIG[headless] = "-Dbackend-headless=true,-Dbackend-headless=false"
>  # Weston on RDP
>  PACKAGECONFIG[rdp] = "-Dbackend-rdp=true,-Dbackend-rdp=false,freerdp,freerdp"
>  # VA-API desktop recorder
> -PACKAGECONFIG[vaapi] = "-Dbackend-drm-screencast-vaapi=true,-Dbackend-drm-screencast-vaapi=false,libva"
> +PACKAGECONFIG[vaapi] = "-Ddeprecated-backend-drm-screencast-vaapi=true,-Ddeprecated-backend-drm-screencast-vaapi=false,libva"
>  # Weston with EGL support
>  PACKAGECONFIG[egl] = "-Drenderer-gl=true,-Drenderer-gl=false,virtual/egl"
> +# Weston with Vulkan support
> +PACKAGECONFIG[vulkan] = "-Drenderer-vulkan=true,-Drenderer-vulkan=false,glslang-native vulkan-loader vulkan-headers"
>  # Weston with lcms support
>  PACKAGECONFIG[lcms] = "-Dcolor-management-lcms=true,-Dcolor-management-lcms=false,lcms"
>  # Weston with webp support
> @@ -79,21 +80,25 @@ PACKAGECONFIG[clients] = "-Dsimple-clients=${SIMPLECLIENTS} -Ddemo-clients=true,
>  # Virtual remote output with GStreamer on DRM backend
>  PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer1.0 gstreamer1.0-plugins-base"
>  # Weston with screen-share support
> -PACKAGECONFIG[screenshare] = "-Dscreenshare=true,-Dscreenshare=false"
> +PACKAGECONFIG[screenshare] = "-Ddeprecated-screenshare=true,-Ddeprecated-screenshare=false"
>  # Traditional desktop shell
>  PACKAGECONFIG[shell-desktop] = "-Dshell-desktop=true,-Dshell-desktop=false"
>  # Fullscreen shell
> -PACKAGECONFIG[shell-fullscreen] = "-Dshell-fullscreen=true,-Dshell-fullscreen=false"
> +PACKAGECONFIG[shell-fullscreen] = "-Ddeprecated-shell-fullscreen=true,-Ddeprecated-shell-fullscreen=false"
>  # In-Vehicle Infotainment (IVI) shell
>  PACKAGECONFIG[shell-ivi] = "-Dshell-ivi=true,-Dshell-ivi=false"
>  # Kiosk shell
>  PACKAGECONFIG[shell-kiosk] = "-Dshell-kiosk=true,-Dshell-kiosk=false"
> +# Lua shell
> +PACKAGECONFIG[shell-lua] = "-Dshell-lua=true,-Dshell-lua=false,lua"
>  # JPEG image loading support
>  PACKAGECONFIG[image-jpeg] = "-Dimage-jpeg=true,-Dimage-jpeg=false, jpeg"
>  # screencasting via PipeWire
>  PACKAGECONFIG[pipewire] = "-Dbackend-pipewire=true,-Dbackend-pipewire=false,pipewire,pipewire"
>  # VNC remote screensharing
>  PACKAGECONFIG[vnc] = "-Dbackend-vnc=true,-Dbackend-vnc=false,neatvnc libpam"
> +# Perfetto performance analysis support
> +PACKAGECONFIG[perfetto] = "-Dperfetto=true,-Dperfetto=false,libperfetto"
>
>  do_install:append() {
>  	# Weston doesn't need the .la files to load modules, so wipe them
>

