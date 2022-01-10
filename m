Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8F0C4332F
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 18:43:29 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web12.35884.1641840207667440808
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 10:43:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FXEYTIwH;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id s19so15366838qtc.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 10:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bvXCoAxTg0EUcCzxvH1U0SGHjSN+zRZpZOjvHPlEXuQ=;
        b=FXEYTIwHctVrrhO6G+mQg2pfSepQKlkAefzuF0CQl37EW3fw8XZt2qLpxX0PKUBXtD
         tCqG6BfJkCnp/yi85A/xPdR4Bre8FZdAYEhMJ/HJB+HDnLkCfgf1C4+hHYWcs44DsVlN
         Q3AFaQKjj/FWOls8exLtuex/Q31mfNeZ0jjsb4QnmHooMdG2CkN2TJWWBcXD27RYDwID
         5USsO5jyObaeW4kibiwOJS9BxTAqvyAt7WEpGpp3TcazxQkdth1WiJrYTAMYIjuQONoA
         73bSJdvNqn0PWlIxK6ge4BuTHMImzutv6hnxbASkP1gnX1z4rO2Sbvq9KA/beO94cXOM
         jEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bvXCoAxTg0EUcCzxvH1U0SGHjSN+zRZpZOjvHPlEXuQ=;
        b=NGEBACXZqDvMtjcXVxGKAc96Tz2Tex18Lo5QVNImjQCPXr6DdJeZx0srdEaMYrhINF
         v+KLa25eDBuZ2ejeSxXvOlzNNiRmF50kQmvNToERk25Lmx/AUwDyXTOXGapVLAlCJDPo
         5fc7t09+c/a5dshaDzjTxlUXg/ChuCkmd2Mf9mbZWz61pk9Gv4k2E5Fm3AKwuDzDrldg
         +Zq2ptUxyyR0cHucmccDXWFfK4hdP16n1gGzkHlZeVPWLDwEj0OhTzRMG5YOzrtdsyIB
         HFc7aFU7X5kqy3MfKJv+3oc79jYn8r0tEwjFwcaJWkPL1Sd/iowkLrZIHjFTD4OREZ6p
         7kMA==
X-Gm-Message-State: AOAM533wJW9NmYbhI+lvD6NDvwfeDQVZk0KhAhBqMLwbRRvhGEmiIio4
	saT4eaC+YZhXJwpl9x4kBXlLrowMlkmSoQAPTT4=
X-Google-Smtp-Source: 
 ABdhPJwaZzArCeO/MDGnOwHuIcy8v+yPX6sztlUNLv2r5DpP4zNxfYjWU6uLTxAcaePd3DdRZ7l0wDuAXIWWXO3XblQ=
X-Received: by 2002:aed:30a3:: with SMTP id 32mr916986qtf.660.1641840206703;
 Mon, 10 Jan 2022 10:43:26 -0800 (PST)
MIME-Version: 1.0
References: <20220109222732.2252416-1-alex@linutronix.de>
 <20220109222732.2252416-10-alex@linutronix.de>
In-Reply-To: <20220109222732.2252416-10-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Jan 2022 10:43:00 -0800
Message-ID: 
 <CAMKF1sqW2NaY+=49oWG24=6mrrLjM_jam375tbHS_yo8xD2+hA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/14] epiphany: make libportal optional, and
 move it to meta-oe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 18:43:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160373

seeing this error

https://errors.yoctoproject.org/Errors/Details/621908/

On Sun, Jan 9, 2022 at 2:28 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 -
>  meta/recipes-gnome/epiphany/epiphany_41.0.bb  |  2 +-
>  meta/recipes-gnome/libportal/libportal_0.5.bb | 17 -----------------
>  3 files changed, 1 insertion(+), 19 deletions(-)
>  delete mode 100644 meta/recipes-gnome/libportal/libportal_0.5.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 0af6974a3d..ab7915482a 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -369,7 +369,6 @@ RECIPE_MAINTAINER:pn-libpcre = "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-libpcre2 = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-libpipeline = "Wang Mingyu <wangmy@fujitsu.com>"
>  RECIPE_MAINTAINER:pn-libpng = "Anuj Mittal <anuj.mittal@intel.com>"
> -RECIPE_MAINTAINER:pn-libportal = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER:pn-libproxy = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-libpthread-stubs = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER:pn-libptytty = "Alexander Kanavin <alex.kanavin@gmail.com>"
> diff --git a/meta/recipes-gnome/epiphany/epiphany_41.0.bb b/meta/recipes-gnome/epiphany/epiphany_41.0.bb
> index 8f3bd87340..a64cdefd86 100644
> --- a/meta/recipes-gnome/epiphany/epiphany_41.0.bb
> +++ b/meta/recipes-gnome/epiphany/epiphany_41.0.bb
> @@ -15,7 +15,6 @@ DEPENDS = " \
>            libarchive \
>            libdazzle \
>            libhandy \
> -          libportal \
>            glib-2.0-native \
>            "
>
> @@ -37,6 +36,7 @@ PACKAGECONFIG ??= "${PACKAGECONFIG_SOUP}"
>  PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
>  PACKAGECONFIG[soup2] = "-Dsoup2=enabled,-Dsoup2=disabled,libsoup-2.4,,,soup3"
>  PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
> +PACKAGECONFIG[libportal] = "-Dlibportal=enabled,-Dlibportal=disabled,libportal"
>
>  FILES:${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
>  RDEPENDS:${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
> diff --git a/meta/recipes-gnome/libportal/libportal_0.5.bb b/meta/recipes-gnome/libportal/libportal_0.5.bb
> deleted file mode 100644
> index 67f63fea68..0000000000
> --- a/meta/recipes-gnome/libportal/libportal_0.5.bb
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -SUMMARY = "libportal provides GIO-style async APIs for most Flatpak portals."
> -DESCRIPTION = "It provides simple asynchronous wrappers for most Flatpak portals \
> -with a familiar GObject API along side the D-Bus API"
> -HOMEPAGE = "https://github.com/flatpak/libportal"
> -BUGTRACKER = "https://github.com/flatpak/libportal/issues"
> -LICENSE = "LGPLv3"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
> -
> -SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=master"
> -SRCREV = "467a397fd7996557f837cdc26ac07c01c62810e5"
> -S = "${WORKDIR}/git"
> -
> -inherit meson gtk-doc gobject-introspection
> -
> -DEPENDS += "glib-2.0 glib-2.0-native gtk+3"
> -
> -EXTRA_OEMESON = "-Dbackends=gtk3 -Dvapi=false"
> --
> 2.20.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160313): https://lists.openembedded.org/g/openembedded-core/message/160313
> Mute This Topic: https://lists.openembedded.org/mt/88311445/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

