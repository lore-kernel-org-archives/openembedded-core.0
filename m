Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web12.6498.1596440597179829427
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2020 00:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: a.fatoum@pengutronix.de)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1k2V7q-0007Kx-Rw; Mon, 03 Aug 2020 09:43:14 +0200
Subject: Re: [OE-core] [dunfell][PATCH] core: glib-2.0: fix requested libmount/mkostemp/selinux not being linked in
To: openembedded-core@lists.openembedded.org, akuster808@gmail.com
References: <16236F46F8876220.6175@lists.openembedded.org>
From: "Ahmad Fatoum" <a.fatoum@pengutronix.de>
Message-ID: <631dc54f-8199-be04-c4e5-8ff48450ab42@pengutronix.de>
Date: Mon, 3 Aug 2020 09:43:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <16236F46F8876220.6175@lists.openembedded.org>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hello,

On 7/20/20 12:30 PM, Ahmad Fatoum wrote:
> Since 010202076760 ("meson.bbclass: avoid unexpected operating-system
> names"), meson is no longer used with a cross file that appends the used
> libc to the operating system name, e.g. linux-gnueabi.
> 
> Prior to that commit, the host_system == 'linux' checks in glib's meson
> failed, which led to glib being compiled without libmount, mkostemp and
> selinux even if explicitly requested.
> 
> As the aforementioned commit affects all recipes built by glib, it might
> not be a candidate for backporting to current stable branches. To fix
> just the glib issue, instances of host_system == 'linux' are patched
> locally.
> 
> The patch is marked as Upstream-Status: Inappropriate as it is rendered
> unnecessary for OE releases newer than Dunfell.

Gentle Ping.

> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  ...ot-hardcode-linux-as-the-host-system.patch | 49 +++++++++++++++++++
>  meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch
> 
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch b/meta/recipes-core/glib-2.0/glib-2.0/0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch
> new file mode 100644
> index 000000000000..616bbd8a7d7c
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch
> @@ -0,0 +1,49 @@
> +From a300a09661124451d4783d4be66e3993262dc9be Mon Sep 17 00:00:00 2001
> +From: Ahmad Fatoum <a.fatoum@pengutronix.de>
> +Date: Thu, 9 Jul 2020 13:00:16 +0200
> +Subject: [PATCH] meson.build: do not hardcode 'linux' as the host system
> +
> +OE build system can set this to other values that include 'linux',
> +e.g. 'linux-gnueabi'. This led to glib always being built without
> +libmount, mkostemp and selinux support.
> +
> +Upstream-Status: Inappropriate [other]
> +Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> +---
> + meson.build | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 3a47a7cc4b98..af09dfc853e5 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -632,7 +632,7 @@ else
> + endif
> + message('Checking whether to use statfs or statvfs .. ' + stat_func_to_use)
> + 
> +-if host_system == 'linux'
> ++if host_system.contains('linux')
> +   if cc.has_function('mkostemp',
> +                      prefix: '''#define _GNU_SOURCE
> +                                 #include <stdlib.h>''')
> +@@ -1857,7 +1857,7 @@ glib_conf.set_quoted('GLIB_LOCALE_DIR', join_paths(glib_datadir, 'locale'))
> + # libmount is only used by gio, but we need to fetch the libs to generate the
> + # pkg-config file below
> + libmount_dep = []
> +-if host_system == 'linux' and get_option('libmount')
> ++if host_system.contains('linux') and get_option('libmount')
> +   libmount_dep = [dependency('mount', version : '>=2.23', required : true)]
> +   glib_conf.set('HAVE_LIBMOUNT', 1)
> + endif
> +@@ -1867,7 +1867,7 @@ if host_system == 'windows'
> + endif
> + 
> + selinux_dep = []
> +-if host_system == 'linux'
> ++if host_system.contains('linux')
> +   selinux_dep = dependency('libselinux', required: get_option('selinux'))
> + 
> +   glib_conf.set('HAVE_SELINUX', selinux_dep.found())
> +-- 
> +2.27.0
> +
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
> index d496235003d4..fd7f5ee920d8 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
> @@ -19,6 +19,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>             file://0011-GMainContext-Fix-GSource-iterator-if-iteration-can-m.patch \
>             file://0012-GMainContext-Fix-memory-leaks-and-memory-corruption-.patch \
>             file://0013-GMainContext-Move-mutex-unlocking-in-destructor-righ.patch \
> +           file://0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch \
>             "
>  
>  SRC_URI_append_class-native = " file://relocate-modules.patch"
> 
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
