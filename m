Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCA0C54EBC
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 22:55:24 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.6142.1672872920174953348
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 14:55:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gvquu6yf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 17C66240004;
	Wed,  4 Jan 2023 22:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672872918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nrTiVQbz7lLapD86NR69gy2Vk0IJPRBQRMazhuVo1/w=;
	b=gvquu6yf05ies5eq9/W7bTb56aDhssZrTWLKAwcxRYuI5bM0uieTt0kOTj/iPT8zvsCZas
	s852Vs1s5NuNMw9aIiyPe1pnnGFZiLyqJrRXY/jjqwC4BOxVBcrp3FKpdYpztbn5DsKe7o
	mmPOgsVVDCCiHvbz32ly4Zha3YTn2b3FOujmOWuDAaRZbtUxmoRBYeSmIY/1Yr5nQmzhx3
	HbMJjX+UULM68x3HGcdCvCLXNjdH2JT6Rw7ufjAn3BmBkr7DU7851rsveF/e65YHD2DrMh
	fh/cv9IZUwlOqVV7ILWUJ2XNlNSwS+eBDOYQzSdGX9Vouh2WXanCU5immBXQDg==
Date: Wed, 4 Jan 2023 23:55:17 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH] gcr3: update 3.40.0 -> 3.41.1
Message-ID: <Y7YD1ZgSe7b+UIBt@mail.local>
References: <20230101142414.463881-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230101142414.463881-1-f_l_k@t-online.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 22:55:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175511

This failed on the AB:

https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/3976/steps/11/logs/stdio

On 01/01/2023 15:24:14+0100, Markus Volk wrote:
>  - remove unneded backport patches
>  - partly import the patch to fix ssh_agent option from gcr4 recipe
> 
> gcr 3.41.1:
> - meson: Fix unknown kw argument in gnome.generate_gir [GNOME/gcr!68]
> - gcr: Add G_SPAWN_CLOEXEC_PIPES flag to all the g_spawn commands
> - docs: Port from gtk-doc to gi-docgen [GNOME/gcr!76]
> - Unbreak build without systemd [GNOME/gcr!75]
> - Several CI fixes
> - Updated translations
> 
> gcr 3.41.0:
> - Port ssh-agent from gnome-keyring [GNOME/gcr!67]
> - build: Fix parallel build failure due to missing marshal dependency [GNOME/gcr!68]
> - Fix warnings by dropping `volatile` for g_once_init_inter locations [GNOME/gcr!69]
> - tests: More robust against GTask unref race condition [GNOME/gcr!72,GNOME/gcr#84]
> - Updated translations
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...build-fix-one-parallel-build-failure.patch | 37 -----------
>  ...ectly-handle-disabled-ssh_agent-opti.patch | 36 +++++++++++
>  ...1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch | 61 -------------------
>  .../gcr/{gcr3_3.40.0.bb => gcr3_3.41.1.bb}    | 17 ++++--
>  4 files changed, 47 insertions(+), 104 deletions(-)
>  delete mode 100644 meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
>  create mode 100644 meta/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch
>  delete mode 100644 meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
>  rename meta/recipes-gnome/gcr/{gcr3_3.40.0.bb => gcr3_3.41.1.bb} (69%)
> 
> diff --git a/meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-parallel-build-failure.patch b/meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
> deleted file mode 100644
> index 81c4bdbbcc..0000000000
> --- a/meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From cb3708bad88e713e4ccf705cb8c14c5996cd9d06 Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Fri, 23 Apr 2021 16:32:38 +0800
> -Subject: [PATCH] gcr/meson.build: fix one parallel build failure
> -
> -ui/gcr-live-search.c includes gcr/gcr-marshal.h. Because missing
> -dependency, following error occurred intermittently during doing parallel
> -build:
> -
> - -o ui/libgcr-ui-3.so.1.0.0.p/gcr-live-search.c.o -c ../gcr-3.38.1/ui/gcr-live-search.c
> -../gcr-3.38.1/ui/gcr-live-search.c:32:10: fatal error: gcr/gcr-marshal.h: No such file or directory
> -   32 | #include "gcr/gcr-marshal.h"
> -      |          ^~~~~~~~~~~~~~~~~~~
> -compilation terminated.
> -
> -Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gcr/-/merge_requests/68/diffs]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - gcr/meson.build | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/gcr/meson.build b/gcr/meson.build
> -index 06c3a63..d9d4b8f 100644
> ---- a/gcr/meson.build
> -+++ b/gcr/meson.build
> -@@ -181,6 +181,7 @@ gcr_base_dep = declare_dependency(
> -   sources: [
> -     gcr_enums_gen[1],
> -     gcr_oids[1],
> -+    gcr_marshal_gen[1],
> -   ],
> - )
> - 
> --- 
> -2.17.1
> -
> diff --git a/meta/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch b/meta/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch
> new file mode 100644
> index 0000000000..d3c26d97ae
> --- /dev/null
> +++ b/meta/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch
> @@ -0,0 +1,36 @@
> +From 9b67bb18d8409e0e693cc6000507acbd73a30eab Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Wed, 16 Nov 2022 11:27:24 +0100
> +Subject: [PATCH 1/2] meson.build: correctly handle disabled ssh_agent option
> +
> +Existing code produces these errors:
> +| gcr/meson.build:61:0: ERROR: Unable to get the path of a not-found external program
> +| gcr/meson.build:101:5: ERROR: Unknown variable "ssh_add_path".
> +
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +
> +Upstream-Status: Backport [ https://gitlab.gnome.org/GNOME/gcr/-/commit/9b67bb18d8409e0e693cc6000507acbd73a30eab ]
> +---
> + meson.build | 12 ++++++++----
> + 1 file changed, 8 insertions(+), 4 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 3f35173..11d7fa7 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -96,8 +98,10 @@ conf.set('HAVE_TIMEGM', cc.has_function('timegm'))
> + conf.set('HAVE_MLOCK', cc.has_function('mlock'))
> + conf.set_quoted('GPG_EXECUTABLE', gpg_path)
> + conf.set_quoted('LIBGCRYPT_VERSION', libgcrypt_dep.version())
> +-conf.set_quoted('SSH_ADD_EXECUTABLE', ssh_add_path)
> +-conf.set_quoted('SSH_AGENT_EXECUTABLE', ssh_agent_path)
> ++if get_option('ssh_agent')
> ++  conf.set_quoted('SSH_ADD_EXECUTABLE', ssh_add_path)
> ++  conf.set_quoted('SSH_AGENT_EXECUTABLE', ssh_agent_path)
> ++endif
> + conf.set10('WITH_SYSTEMD', with_systemd)
> + config_file = configure_file(
> +   output: 'config.h',
> +-- 
> +2.34.1
> +
> diff --git a/meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch b/meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
> deleted file mode 100644
> index ae4e2ac1eb..0000000000
> --- a/meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -From b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8 Mon Sep 17 00:00:00 2001
> -From: Jakub Jirutka <jakub@jirutka.cz>
> -Date: Wed, 12 Jan 2022 00:24:20 +0100
> -Subject: [PATCH] meson: Fix unknown kw argument in gnome.generate_gir
> -
> -This argument has been removed in Meson 0.61.0:
> -
> -    gck/meson.build:130:2: ERROR: gnome.generate_gir got unknown keyword arguments "packages"
> -
> -https://github.com/mesonbuild/meson/commit/f8fc5cb860465718fe7c79a1bf1fe00659f138de:
> -
> -> The packages argument to gnome.generate_gir was allowed, but never did anything, so stop passing it.
> -
> -Fixes #89
> -Upstream-Status: Backport
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - gck/meson.build | 1 -
> - gcr/meson.build | 1 -
> - ui/meson.build  | 1 -
> - 3 files changed, 3 deletions(-)
> -
> -diff --git a/gck/meson.build b/gck/meson.build
> -index 756b486..a21a1e9 100644
> ---- a/gck/meson.build
> -+++ b/gck/meson.build
> -@@ -131,7 +131,6 @@ if get_option('introspection')
> -     sources: gck_gir_sources,
> -     namespace: 'Gck',
> -     nsversion: '@0@'.format(gck_major_version),
> --    packages: gck_deps,
> -     export_packages: 'gck-@0@'.format(gck_major_version),
> -     includes: [ 'GObject-2.0', 'Gio-2.0' ],
> -     header: 'gck/gck.h',
> -diff --git a/gcr/meson.build b/gcr/meson.build
> -index 2233a44..c83641b 100644
> ---- a/gcr/meson.build
> -+++ b/gcr/meson.build
> -@@ -190,7 +190,6 @@ if get_option('introspection')
> -     sources: [ gcr_base_public_sources, gcr_base_headers ],
> -     namespace: 'Gcr',
> -     nsversion: '@0@'.format(gcr_major_version),
> --    packages: gcr_base_deps,
> -     export_packages: 'gcr-base-@0@'.format(gcr_major_version),
> -     includes: [
> -       'GObject-2.0',
> -diff --git a/ui/meson.build b/ui/meson.build
> -index e656ea2..32ee057 100644
> ---- a/ui/meson.build
> -+++ b/ui/meson.build
> -@@ -152,7 +152,6 @@ if get_option('introspection')
> -     export_packages: 'gcr-ui-@0@'.format(gcr_major_version),
> -     identifier_prefix: 'Gcr',
> -     symbol_prefix: 'gcr',
> --    packages: gcr_ui_deps,
> -     includes: [
> -       'GObject-2.0',
> -       'Gio-2.0',
> --- 
> -GitLab
> -
> diff --git a/meta/recipes-gnome/gcr/gcr3_3.40.0.bb b/meta/recipes-gnome/gcr/gcr3_3.41.1.bb
> similarity index 69%
> rename from meta/recipes-gnome/gcr/gcr3_3.40.0.bb
> rename to meta/recipes-gnome/gcr/gcr3_3.41.1.bb
> index 5318768db6..273728f6c8 100644
> --- a/meta/recipes-gnome/gcr/gcr3_3.40.0.bb
> +++ b/meta/recipes-gnome/gcr/gcr3_3.41.1.bb
> @@ -20,24 +20,27 @@ GTKDOC_MESON_OPTION = "gtk_doc"
>  inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
>  UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>\d+\.(?!9\d+)(\d*[02468])+(\.\d+)+)\.tar"
>  
> -SRC_URI = " \
> -	https://download.gnome.org/sources/gcr/3.40/gcr-${PV}.tar.xz;name=archive \
> -	file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch \
> -	file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch"
> -
> -SRC_URI[archive.sha256sum] = "b9d3645a5fd953a54285cc64d4fc046736463dbd4dcc25caf5c7b59bed3027f5"
> +SRC_URI = "https://download.gnome.org/sources/gcr/3.41/gcr-${PV}.tar.xz;name=archive"
> +SRC_URI += "file://0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch"
> +SRC_URI[archive.sha256sum] = "bb7128a3c2febbfee9c03b90d77d498d0ceb237b0789802d60185c71c4bea24f"
>  
>  S = "${WORKDIR}/gcr-${PV}"
>  
>  PACKAGECONFIG ??= " \
> +	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
>  	${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
>  	${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'gtk', '', d)} \
>  "
>  PACKAGECONFIG[gtk] = "-Dgtk=true,-Dgtk=false,gtk+3"
> +PACKAGECONFIG[ssh_agent] = "-Dssh_agent=true,-Dssh_agent=false,libsecret,openssh"
> +#'Use systemd socket activation for server programs'
> +PACKAGECONFIG[systemd] = "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
>  
>  FILES:${PN} += " \
>      ${datadir}/dbus-1 \
>      ${datadir}/gcr-3 \
> +    ${systemd_user_unitdir}/gcr-ssh-agent.socket \
> +    ${systemd_user_unitdir}/gcr-ssh-agent.service \
>  "
>  
>  # http://errors.yoctoproject.org/Errors/Details/20229/
> @@ -50,5 +53,7 @@ do_write_config:append() {
>      cat >${WORKDIR}/meson-${PN}.cross <<EOF
>  [binaries]
>  gpg2 = '${bindir}/gpg2'
> +ssh-add = '${bindir}/ssh-add'
> +ssh-agent = '${bindir}/ssh-agent'
>  EOF
>  }
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175187): https://lists.openembedded.org/g/openembedded-core/message/175187
> Mute This Topic: https://lists.openembedded.org/mt/95988912/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

