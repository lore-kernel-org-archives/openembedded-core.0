Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8530C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 10:06:42 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.6981.1699351599583638432
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 02:06:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PchIKGoI;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-507c1936fd5so6980790e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 02:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699351598; x=1699956398; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R1xU3ZfH9fKVLDqMKbccbOCf6TT0ZH0oWYObHfZudH4=;
        b=PchIKGoI6weOq9tLDpYsskfxrMP5G8BSk7S8jeiwm28HWWtyFZftzc35gEdne67paO
         B/yEAwxhwyA8BiEL3xGNhAuWwa5wgXuVLO1ZyTmt/uO6tDzpinygafsE0S44bG6qS1DN
         hfKUBj5Ov20LWMkU/32Ut3C3v96d/59zYXTkkKsa+3iM6WFCgLWNMwd6AF0Wo5IWMRM8
         +pSiCs93eROV2te5U62l0lRH47+h3ux+dXEb0i0rIssXIjuHuEKl9hUE91iodGm2JTUC
         p0ZtUBE+UzEA1CfvPcnsstHVPqQA0T8or2ChFrTIXJJxMJ2heM6PCQGT9XBh05St/FDx
         rvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699351598; x=1699956398;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R1xU3ZfH9fKVLDqMKbccbOCf6TT0ZH0oWYObHfZudH4=;
        b=Dg9pLmB8cUOfi6MxN4klHjswaVLlxDUO6DWpJvnJAs1sx7j+8N38trO/r3RjlfBXGK
         U6xM8ylW88j7yDP5Wb8gTB71XtFCEZEBanTEjaI9YXLEVnAzbtQfF7xFaz0lgm+bN6ZB
         izB+A/JUj+YBKk4GtnqkfHi5w7s1WYAksEcNUlEO3Zz5G0o6bWjE7xKnEnDFP8gTApoX
         atssKLFhafj20pxet4aJ3O52K4DqThjVSIEFKg7MSx932+a2GEW1CGEhsm8fkU3UzKMq
         OssIVSrMQ7C20t5Y593oEpz4avoancQWr72+hnAGgkp1mk3hdsu33QhhVfapNym/G5dR
         tz3w==
X-Gm-Message-State: AOJu0YzRTB7IvPInOSdyH+Mj39EJ6dmmAOJ+8HizaOCStudIoCu2bDQE
	lAjSg/HE0UZzRmpgutzvVLDc5Nvu/L9xJshq1ps=
X-Google-Smtp-Source: AGHT+IFjQ9kB3X6h1721wylTL39o6h4GrEsebRDyPVAR6nK63RDNS+XKWo5afOeVtweLX2k7dNapO25jTxSYaotni3s=
X-Received: by 2002:a05:6512:2382:b0:509:4730:9103 with SMTP id
 c2-20020a056512238200b0050947309103mr1007848lfv.6.1699351597588; Tue, 07 Nov
 2023 02:06:37 -0800 (PST)
MIME-Version: 1.0
References: <20231107100149.1048627-1-f_l_k@t-online.de>
In-Reply-To: <20231107100149.1048627-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 Nov 2023 11:06:26 +0100
Message-ID: <CANNYZj-+78t2Pu908g3zRGgGYG4GUM_S3ZkrPBmkjPq+tUwsxg@mail.gmail.com>
Subject: Re: [oe-core][RFC][PATCH] vala.bbclass: enable vapi build if class is inherited
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 10:06:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190262

There is quite a bit more recipes in core that inherit vala. Shouldn't
they be as well tweaked to rely on the class doing the right thing?

[ak@fedora poky]$ grep -ir vala meta*|grep inher
meta/recipes-support/libical/libical_3.0.16.bb:inherit cmake pkgconfig
gobject-introspection vala github-releases
meta/recipes-support/libproxy/libproxy_0.5.3.bb:inherit meson
pkgconfig gobject-introspection vala gi-docgen
meta/recipes-support/appstream/appstream_0.16.3.bb:inherit meson
gobject-introspection gettext gtk-doc pkgconfig vala
meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:inherit gnomebase
upstream-version-is-even vala features_check gobject-introspection
meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:inherit cargo_common
gnomebase pixbufcache gobject-introspection rust vala gi-docgen
cargo-update-recipe-crates
meta/recipes-gnome/gcr/gcr_4.1.0.bb:inherit gnomebase gtk-icon-cache
gi-docgen features_check vala gobject-introspection gettext mime
mime-xdg
meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:inherit meson
gobject-introspection vala gettext gi-docgen features_check pkgconfig
meta/recipes-gnome/libadwaita/libadwaita_1.4.0.bb:inherit gnomebase
gobject-introspection gi-docgen vala features_check
meta/recipes-gnome/libportal/libportal_0.7.1.bb:inherit meson
gi-docgen gobject-introspection vala features_check pkgconfig
meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:inherit gnomebase
gi-docgen vala gobject-introspection manpages

Alex

On Tue, 7 Nov 2023 at 11:01, Markus Volk <f_l_k@t-online.de> wrote:
>
> Try to enable vapi build automatically if GI_DATA_ENABLED = True.
> Do it basically the same way it is done for gi
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/classes-recipe/vala.bbclass              | 23 +++++++++++++++++++
>  .../libdazzle/libdazzle_3.44.0.bb             |  1 +
>  .../appstream/appstream_0.16.3.bb             |  2 --
>  3 files changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-recipe/vala.bbclass b/meta/classes-recipe/vala.bbclass
> index 460ddb36f0..45c3993c54 100644
> --- a/meta/classes-recipe/vala.bbclass
> +++ b/meta/classes-recipe/vala.bbclass
> @@ -16,6 +16,29 @@ export STAGING_DATADIR
>  # Upstream Vala >= 0.11 looks in XDG_DATA_DIRS for .vapi files
>  export XDG_DATA_DIRS = "${STAGING_DATADIR}:${STAGING_LIBDIR}"
>
> +VALA_ENABLED:class-native = "False"
> +VALA_ENABLED ?= "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'True', 'False', d)}"
> +
> +# meson: default option name to enable/disable vala. This matches most
> +# project's configuration. In doubts - check meson_options.txt in project's
> +# source path.
> +VALA_MESON_OPTION ?= 'vapi'
> +VALA_MESON_ENABLE_FLAG ?= 'true'
> +VALA_MESON_DISABLE_FLAG ?= 'false'
> +
> +# Define vala options such that they can be disabled completely when VALA_MESON_OPTION is empty
> +VALAMESONTARGET = "-D${VALA_MESON_OPTION}=${@bb.utils.contains('VALA_ENABLED', 'True', '${VALA_MESON_ENABLE_FLAG}', '${VALA_MESON_DISABLE_FLAG}', d)} "
> +VALAMESONBUILD = "-D${VALA_MESON_OPTION}=${VALA_MESON_DISABLE_FLAG} "
> +
> +EXTRA_OECONF:prepend:class-target = "${@bb.utils.contains('VALA_ENABLED', 'True', '--enable-vala', '--disable-vala', d)} "
> +EXTRA_OEMESON:prepend:class-target = "${@['', '${VALAMESONTARGET}'][d.getVar('VALA_MESON_OPTION') != '']} "
> +# When building native recipes, disable vala, as it is not necessary,
> +# pulls in additional dependencies, and makes build times longer
> +EXTRA_OECONF:prepend:class-native = "--disable-vala "
> +EXTRA_OEMESON:prepend:class-native = "${@['', '${VALAMESONBUILD}'][d.getVar('VALA_MESON_OPTION') != '']}"
> +EXTRA_OECONF:prepend:class-nativesdk = "--disable-vala "
> +EXTRA_OEMESON:prepend:class-nativesdk = "${@['', '${VALAMESONBUILD}'][d.getVar('VALA_MESON_OPTION') != '']}"
> +
>  # Package additional files
>  FILES:${PN}-dev += "\
>      ${datadir}/vala/vapi/*.vapi \
> diff --git a/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb b/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb
> index 49ebc818b0..e561bfa22a 100644
> --- a/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb
> +++ b/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb
> @@ -15,5 +15,6 @@ DEPENDS = "glib-2.0-native glib-2.0 gtk+3"
>  SRC_URI[archive.sha256sum] = "3cd3e45eb6e2680cb05d52e1e80dd8f9d59d4765212f0e28f78e6c1783d18eae"
>
>  GIR_MESON_OPTION = 'with_introspection'
> +VALA_MESON_OPTION = "with_vapi"
>
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> diff --git a/meta/recipes-support/appstream/appstream_0.16.3.bb b/meta/recipes-support/appstream/appstream_0.16.3.bb
> index bde679e256..dafeff2555 100644
> --- a/meta/recipes-support/appstream/appstream_0.16.3.bb
> +++ b/meta/recipes-support/appstream/appstream_0.16.3.bb
> @@ -40,6 +40,4 @@ PACKAGECONFIG[stemming] = "-Dstemming=true,-Dstemming=false,libstemmer"
>
>  FILES:${PN} += "${datadir}"
>
> -EXTRA_OEMESON += "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dvapi=true', '-Dvapi=false', d)}"
> -
>  BBCLASSEXTEND = "native"
> --
> 2.42.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190261): https://lists.openembedded.org/g/openembedded-core/message/190261
> Mute This Topic: https://lists.openembedded.org/mt/102439967/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

