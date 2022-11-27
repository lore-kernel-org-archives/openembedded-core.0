Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E48F7C43217
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 19:11:44 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.98772.1669576297403172396
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 11:11:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dXOI7ArP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CA5B71C0002;
	Sun, 27 Nov 2022 19:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669576295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p09aouA/SnQ2n2poz38wWDe7oL55ufxS5F9QDCudolU=;
	b=dXOI7ArP7jcr3TdQUaXOOcKw+pnH/2HfxAKSQFkAlGr964uibxjy45u1iRhCrjIJ8Bb4wj
	66fhlcONU7ZhUaMkJxvS+qQu11qpNVbj07HnUTHEiWclTNIMxCx+tg9O9vNkuD+3vlQHNn
	1wZ1Tv7GGw+OQbGZQ5KKfal6LdAjttUoN/OBI8O563PS/HLE98Ms65UuFPbIjTvzeCjfT+
	q9Vc+rxtHpyoBLKxB4Mbyx2ZW9NXkMkhj4BuwS7PCFt5i7IS9NCK57C9OskKaGmcKOMMqG
	pKy7oWcaQiNK/Ho+KP0YcVksEFVS6UcCjG7girXrev5Pwyv3WnbAULaigD/fwg==
Date: Sun, 27 Nov 2022 20:11:34 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCHv2] gcr: add recipe for gcr-4, needed to build
 with gtk4
Message-ID: <Y4O2Zu5VubWJiFhP@mail.local>
References: <20221127122744.1404648-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221127122744.1404648-1-f_l_k@t-online.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 19:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173882

Hello,

This causes:

stdio: WARNING: Nothing PROVIDES 'gtk4' (but /home/pokybuild/yocto-worker/a-full/build/meta/recipes-gnome/gcr/gcr_4.0.0.bb DEPENDS on or otherwise requires it)
stdio: WARNING: Nothing RPROVIDES 'gcr' (but /home/pokybuild/yocto-worker/a-full/build/meta/recipes-gnome/gcr/gcr_4.0.0.bb RDEPENDS on or otherwise requires it)
stdio: WARNING: Nothing RPROVIDES 'gcr-dev' (but /home/pokybuild/yocto-worker/a-full/build/meta/recipes-gnome/gcr/gcr_4.0.0.bb RDEPENDS on or otherwise requires it)

On 27/11/2022 13:27:44+0100, Markus Volk wrote:
> gcr-3 recipe is still needed for gnome projects that stick to gtk+3, rename to gcr3.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...build-fix-one-parallel-build-failure.patch |  0
>  ...1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch |  0
>  .../gcr/{gcr_3.40.0.bb => gcr3_3.40.0.bb}     |  8 ++-
>  meta/recipes-gnome/gcr/gcr_4.0.0.bb           | 56 +++++++++++++++++++
>  4 files changed, 62 insertions(+), 2 deletions(-)
>  rename meta/recipes-gnome/gcr/{gcr => gcr3}/0001-gcr-meson.build-fix-one-parallel-build-failure.patch (100%)
>  rename meta/recipes-gnome/gcr/{gcr => gcr3}/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch (100%)
>  rename meta/recipes-gnome/gcr/{gcr_3.40.0.bb => gcr3_3.40.0.bb} (87%)
>  create mode 100644 meta/recipes-gnome/gcr/gcr_4.0.0.bb
> 
> diff --git a/meta/recipes-gnome/gcr/gcr/0001-gcr-meson.build-fix-one-parallel-build-failure.patch b/meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
> similarity index 100%
> rename from meta/recipes-gnome/gcr/gcr/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
> rename to meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
> diff --git a/meta/recipes-gnome/gcr/gcr/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch b/meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
> similarity index 100%
> rename from meta/recipes-gnome/gcr/gcr/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
> rename to meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
> diff --git a/meta/recipes-gnome/gcr/gcr_3.40.0.bb b/meta/recipes-gnome/gcr/gcr3_3.40.0.bb
> similarity index 87%
> rename from meta/recipes-gnome/gcr/gcr_3.40.0.bb
> rename to meta/recipes-gnome/gcr/gcr3_3.40.0.bb
> index 917be5938b..5318768db6 100644
> --- a/meta/recipes-gnome/gcr/gcr_3.40.0.bb
> +++ b/meta/recipes-gnome/gcr/gcr3_3.40.0.bb
> @@ -20,11 +20,15 @@ GTKDOC_MESON_OPTION = "gtk_doc"
>  inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
>  UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>\d+\.(?!9\d+)(\d*[02468])+(\.\d+)+)\.tar"
>  
> -SRC_URI += "file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch \ 
> -            file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch"
> +SRC_URI = " \
> +	https://download.gnome.org/sources/gcr/3.40/gcr-${PV}.tar.xz;name=archive \
> +	file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch \
> +	file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch"
>  
>  SRC_URI[archive.sha256sum] = "b9d3645a5fd953a54285cc64d4fc046736463dbd4dcc25caf5c7b59bed3027f5"
>  
> +S = "${WORKDIR}/gcr-${PV}"
> +
>  PACKAGECONFIG ??= " \
>  	${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
>  	${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'gtk', '', d)} \
> diff --git a/meta/recipes-gnome/gcr/gcr_4.0.0.bb b/meta/recipes-gnome/gcr/gcr_4.0.0.bb
> new file mode 100644
> index 0000000000..fafc85e6a3
> --- /dev/null
> +++ b/meta/recipes-gnome/gcr/gcr_4.0.0.bb
> @@ -0,0 +1,56 @@
> +SUMMARY = "A library for bits of crypto UI and parsing etc"
> +DESCRIPTION = "GCR is a library for displaying certificates, and crypto UI, \
> +accessing key stores. It also provides the viewer for crypto files on the \
> +GNOME desktop."
> +HOMEPAGE = "https://gitlab.gnome.org/GNOME/gcr"
> +BUGTRACKER = "https://gitlab.gnome.org/GNOME/gcr/issues"
> +
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
> +
> +DEPENDS = "p11-kit glib-2.0 libgcrypt gnupg-native libsecret \
> +           ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-native', '', d)}"
> +
> +CACHED_CONFIGUREVARS += "ac_cv_path_GPG='gpg2'"
> +
> +CFLAGS += "-D_GNU_SOURCE"
> +
> +GNOMEBASEBUILDCLASS = "meson"
> +GTKDOC_MESON_OPTION = "gtk_doc"
> +inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
> +UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>\d+\.(?!9\d+)(\d*[02468])+(\.\d+)+)\.tar"
> +
> +SRC_URI[archive.sha256sum] = "c45855924f0ee7bab43e2dd38bfafd2ac815c6e9864341c0161e171173dcec7c"
> +
> +PACKAGECONFIG ??= " \
> +	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> +	${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
> +	${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'gtk', '', d)} \
> +"
> +PACKAGECONFIG[gtk] = "-Dgtk4=true,-Dgtk4=false,gtk4"
> +PACKAGECONFIG[ssh_agent] = "-Dssh_agent=true,-Dssh_agent=false,,openssh"
> +#'Use systemd socket activation for server programs'
> +PACKAGECONFIG[systemd] = "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
> +
> +FILES:${PN} += " \
> +    ${datadir}/dbus-1 \
> +    ${datadir}/gcr-4 \
> +"
> +
> +# http://errors.yoctoproject.org/Errors/Details/20229/
> +ARM_INSTRUCTION_SET:armv4 = "arm"
> +ARM_INSTRUCTION_SET:armv5 = "arm"
> +ARM_INSTRUCTION_SET:armv6 = "arm"
> +
> +EXTRA_OEMESON += "--cross-file ${WORKDIR}/meson-${PN}.cross"
> +do_write_config:append() {
> +    cat >${WORKDIR}/meson-${PN}.cross <<EOF
> +[binaries]
> +gpg2 = '${bindir}/gpg2'
> +EOF
> +}
> +
> +do_configure:prepend() {
> +    sed -i "s|ssh_add_path = find_program('ssh-add', required: get_option('ssh_agent')).full_path()|ssh_add_path = '${bindir}/ssh-add'|" ${S}/meson.build
> +    sed -i "s|ssh_agent_path = find_program('ssh-agent', required: get_option('ssh_agent')).full_path()|ssh_agent_path = '${bindir}/ssh-agent'|" ${S}/meson.build
> +}
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173839): https://lists.openembedded.org/g/openembedded-core/message/173839
> Mute This Topic: https://lists.openembedded.org/mt/95287600/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

