Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.4757.1631695072551779919
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 01:37:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 80E821C0006;
	Wed, 15 Sep 2021 08:37:48 +0000 (UTC)
Date: Wed, 15 Sep 2021 10:37:48 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Pavel Zhukov <pavel@zhukoff.net>
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] weston: wrapper for weston modules argument
Message-ID: <YUGw3PclF4eWtwT9@piout.net>
References: <87k0jrzghc.fsf@gentoo.zhukoff.net>
MIME-Version: 1.0
In-Reply-To: <87k0jrzghc.fsf@gentoo.zhukoff.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Pavel,

I'm sorry but your patch has been mangled and I didn't manage to apply
it, do you mind sending it again?

On 08/09/2021 09:14:23+0200, Pavel Zhukov wrote:
> 
> Due to custom option parser implementation weston accepts only one
> argument of a given type. As the result if multiple modules add
> multiple --modules agruments only last will be used. This fix
> introduces wrapper around modules in terms of weston-init to prepare
> proper modules argument for weston and adds systemd-notify module into
> weston-init module to support Type=notify in systemd service file.
> 
> Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
> ---
> .../recipes-graphics/wayland/weston-init/weston-start | 11 +++++++++++
> .../wayland/weston/systemd-notify.weston-start        |  9 +++++++++
> meta/recipes-graphics/wayland/weston_9.0.0.bb         |  5 +++++
> 3 files changed, 25 insertions(+)
> create mode 100644
> meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
> 
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start
> b/meta/recipes-graphics/wayland/weston-init/weston-start
> index 0b93dc964a..0f1bc4c29d 100755
> --- a/meta/recipes-graphics/wayland/weston-init/weston-start
> +++ b/meta/recipes-graphics/wayland/weston-init/weston-start
> @@ -21,6 +21,14 @@ add_weston_argument() {
> # Add openvt extra argument
> add_openvt_argument() {
> 	openvt_args="$openvt_args $1"
> +
> +}
> +## Add module to --modules argument
> +add_weston_module() {
> +	if [[ "x${weston_modules}" == "x" ]]; then
> +		weston_modules="--modules "
> +	fi;
> +	weston_modules+="${1},"
> }
> 
> if [ -n "$WAYLAND_DISPLAY" ]; then
> @@ -68,6 +76,9 @@ if [ -d "$modules_dir" ]; then
> 
> 		# process module
> 		. $m
> +		if [[ x"{$weston_modules}" != "x" ]]; then
> +			add_weston_argument "${weston_modules}"
> +		fi;
> 	done
> fi
> 
> diff --git
> a/meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
> b/meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
> new file mode 100644
> index 0000000000..a97e7b38d9
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +  +# SPDX-FileCopyrightText: Huawei Inc.
> +# SPDX-License-Identifier: Apache-2.0
> +
> +
> +if [[ -x "/usr/lib/weston/systemd-notify.so" ]]; then
> +        add_weston_module "systemd-notify.so"
> +fi
> diff --git a/meta/recipes-graphics/wayland/weston_9.0.0.bb
> b/meta/recipes-graphics/wayland/weston_9.0.0.bb
> index 1f1d62ea7c..59ab217a3b 100644
> --- a/meta/recipes-graphics/wayland/weston_9.0.0.bb
> +++ b/meta/recipes-graphics/wayland/weston_9.0.0.bb
> @@ -9,6 +9,7 @@ SRC_URI =
> "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
>            file://weston.png \
>            file://weston.desktop \
>            file://xwayland.weston-start \
> +           file://systemd-notify.weston-start \

> file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
> \

> file://0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch
> \
>            file://0001-meson.build-fix-incorrect-header.patch \
> @@ -111,6 +112,10 @@ do_install:append() {
> 		install -Dm 644 ${WORKDIR}/xwayland.weston-start
> ${D}${datadir}/weston-start/xwayland
> 	fi
> 
> +	if [ "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'yes', 'no', d)}" =
> "yes" ]; then
> +		install -Dm 644 ${WORKDIR}/systemd-notify.weston-start
> ${D}${datadir}/weston-start/systemd-notify
> +	fi
> +
> 	if [ "${@bb.utils.contains('PACKAGECONFIG', 'launch', 'yes', 'no', d)}" =
> "yes" ]; then
> 		chmod u+s ${D}${bindir}/weston-launch
> 	fi
> -- 
> 2.31.1
> 

> 
> 
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
