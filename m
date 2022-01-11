Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDD6C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 07:49:56 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web12.4152.1641887395189013563
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 23:49:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DBJqUoUf;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id g2so363196qkp.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 23:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cmcc5xiR5J6l7zBktXLVNGkVZjFLOQcsOcQopeGms0s=;
        b=DBJqUoUflVwYTYG0KBtEg3qiJV+azMKdaUpXcUlepHw7iX3fCQGoFSXmMB16L7DQo1
         V4oC9DJyrtCruQf4XFI1QyCnzW3bdT2fOq3RvViDAUXUuP6E0uBTxPjl35Ud7S1C30z2
         xa115KG4BjJT0tW25r+HLZUgk9LIh3hQLA//pkChzxFKpJ+VRY2Q2iQakGoeVxPlK7vM
         pdWKL+bWufLvEcdKqctxEFG85/Oq2LS8qP6KeTdHEImbTXByyM67NuRgvuHE0wgQW+Ta
         1krzxECdkvFh7fxR1yv+xcM+UQK6FIanWVNs+G5SXsZ9qBSRqytnYd0Wets7/v57Tj+V
         4etw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cmcc5xiR5J6l7zBktXLVNGkVZjFLOQcsOcQopeGms0s=;
        b=ZQ2QQPnoT88BqWaZCs5pIsNYLWB7TXgRh6efIkUDBea9sJyyuQ19H1G7zqJZ5X+o5S
         HuRYBPDVj1xhOC5mVVnNovGZQrfPJSB0WoxMpQqUDNPjeyh3O1436gd6Uo4FlzQgRlBg
         DZVtHOjsUl9kfZSrtyC3qSmW9D/78M0WN54pAUHjvkZZqhbITs7IGu2c1kw9yqr0GC3+
         tTEFkKvgW13EY4P/xfVodN21HKrXTurCsH6QAHoxxe51zLgE+fSVq0SsTCFd6zOfVJZH
         Kx0iRjVKu+xJ0IwGbQIz2BMu2VB8RpWwj1OpDUIpZaU3Y3/EbMB9S+fP62YFAMJS3Ouq
         5R2Q==
X-Gm-Message-State: AOAM53043QaXtX9iF9af7aVucPB8uNCaJlipF79Uk1p4ozEbLepWh9ZC
	NB6D20hKrzzMolFXp9bf/J6rL6VL15v9D0zheKA=
X-Google-Smtp-Source: 
 ABdhPJwbN289zAtqfEAtO7GzjK4jG/27EM8B3IfTy9uzBq4UDhNetOPOf69QRP4ZYPNe4qV+EJQ88bi4o+Ll4YJ5sqc=
X-Received: by 2002:a05:620a:f06:: with SMTP id
 v6mr2381998qkl.149.1641887394052;
 Mon, 10 Jan 2022 23:49:54 -0800 (PST)
MIME-Version: 1.0
References: <20220109222732.2252416-1-alex@linutronix.de>
 <20220109222732.2252416-10-alex@linutronix.de>
 <CAMKF1sqW2NaY+=49oWG24=6mrrLjM_jam375tbHS_yo8xD2+hA@mail.gmail.com>
 <CANNYZj8jt-Wh4nyBNdXm5ykPjOkK1nvoLH7vcJwgZpPnxn=NeQ@mail.gmail.com>
 <CAMKF1sr4VpWwTqER4h4tYUm4p2v_di8BcmcE_As8GFkiEJO6kQ@mail.gmail.com>
 <CANNYZj9e6DDGBEL7_bcSdU=6z-faXOEjCnDcsJ-rAtEqK_aVrQ@mail.gmail.com>
 <CAMKF1sp3ujr7iaktTzxH0bSXT8MKJ5c06t4ObUro8m5zCczD5Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sp3ujr7iaktTzxH0bSXT8MKJ5c06t4ObUro8m5zCczD5Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Jan 2022 23:49:28 -0800
Message-ID: 
 <CAMKF1srFMGqOXKSiU_J-D04g2-E45OGVY7kgeXwdXf0MgPKxmQ@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 07:49:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160387

On Mon, Jan 10, 2022 at 12:54 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Jan 10, 2022 at 11:18 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > For epiphany you also need the oe-core patch. Nautilus should switch to an optional dependency via PACKAGECONFIG, similar to epiphany.
>
> I might have missed the OE-core patch perhaps, I will rebuild with
> latest master-next perhaps and see if that helps

digging a bit deeper reveals this

../nautilus-41.1/src/nautilus-files-view.c:95:10: fatal error:
'libportal/portal-gtk3.h' file not found
#include <libportal/portal-gtk3.h>
        ^~~~~~~~~~~~~~~~~~~~~~~~~
1 error generated.

but libportal is staging it in

% find ../ -name portal-gtk3.h
../recipe-sysroot/usr/include/libportal-gtk3/portal-gtk3.h

and this is happening with 0.5 upgrade of libportal. I guess nautilus
needs to be patches perhaps.

>
> >
> > Alex
> >
> > On Mon, 10 Jan 2022 at 19:57, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> On Mon, Jan 10, 2022 at 10:49 AM Alexander Kanavin
> >> <alex.kanavin@gmail.com> wrote:
> >> >
> >> > Was this patch included in the build?
> >>
> >> I had included the meta-oe patch that you posted for sure. I am also
> >> seeing failing build with similar errors for nautilus see
> >> https://errors.yoctoproject.org/Errors/Details/621931/
> >>
> >> >
> >> > Alex
> >> >
> >> > On Mon, 10 Jan 2022 at 19:43, Khem Raj <raj.khem@gmail.com> wrote:
> >> >>
> >> >> seeing this error
> >> >>
> >> >> https://errors.yoctoproject.org/Errors/Details/621908/
> >> >>
> >> >> On Sun, Jan 9, 2022 at 2:28 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >> >> >
> >> >> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> >> >> > ---
> >> >> >  meta/conf/distro/include/maintainers.inc      |  1 -
> >> >> >  meta/recipes-gnome/epiphany/epiphany_41.0.bb  |  2 +-
> >> >> >  meta/recipes-gnome/libportal/libportal_0.5.bb | 17 -----------------
> >> >> >  3 files changed, 1 insertion(+), 19 deletions(-)
> >> >> >  delete mode 100644 meta/recipes-gnome/libportal/libportal_0.5.bb
> >> >> >
> >> >> > diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> >> >> > index 0af6974a3d..ab7915482a 100644
> >> >> > --- a/meta/conf/distro/include/maintainers.inc
> >> >> > +++ b/meta/conf/distro/include/maintainers.inc
> >> >> > @@ -369,7 +369,6 @@ RECIPE_MAINTAINER:pn-libpcre = "Yi Zhao <yi.zhao@windriver.com>"
> >> >> >  RECIPE_MAINTAINER:pn-libpcre2 = "Unassigned <unassigned@yoctoproject.org>"
> >> >> >  RECIPE_MAINTAINER:pn-libpipeline = "Wang Mingyu <wangmy@fujitsu.com>"
> >> >> >  RECIPE_MAINTAINER:pn-libpng = "Anuj Mittal <anuj.mittal@intel.com>"
> >> >> > -RECIPE_MAINTAINER:pn-libportal = "Alexander Kanavin <alex.kanavin@gmail.com>"
> >> >> >  RECIPE_MAINTAINER:pn-libproxy = "Anuj Mittal <anuj.mittal@intel.com>"
> >> >> >  RECIPE_MAINTAINER:pn-libpthread-stubs = "Alexander Kanavin <alex.kanavin@gmail.com>"
> >> >> >  RECIPE_MAINTAINER:pn-libptytty = "Alexander Kanavin <alex.kanavin@gmail.com>"
> >> >> > diff --git a/meta/recipes-gnome/epiphany/epiphany_41.0.bb b/meta/recipes-gnome/epiphany/epiphany_41.0.bb
> >> >> > index 8f3bd87340..a64cdefd86 100644
> >> >> > --- a/meta/recipes-gnome/epiphany/epiphany_41.0.bb
> >> >> > +++ b/meta/recipes-gnome/epiphany/epiphany_41.0.bb
> >> >> > @@ -15,7 +15,6 @@ DEPENDS = " \
> >> >> >            libarchive \
> >> >> >            libdazzle \
> >> >> >            libhandy \
> >> >> > -          libportal \
> >> >> >            glib-2.0-native \
> >> >> >            "
> >> >> >
> >> >> > @@ -37,6 +36,7 @@ PACKAGECONFIG ??= "${PACKAGECONFIG_SOUP}"
> >> >> >  PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
> >> >> >  PACKAGECONFIG[soup2] = "-Dsoup2=enabled,-Dsoup2=disabled,libsoup-2.4,,,soup3"
> >> >> >  PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
> >> >> > +PACKAGECONFIG[libportal] = "-Dlibportal=enabled,-Dlibportal=disabled,libportal"
> >> >> >
> >> >> >  FILES:${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
> >> >> >  RDEPENDS:${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
> >> >> > diff --git a/meta/recipes-gnome/libportal/libportal_0.5.bb b/meta/recipes-gnome/libportal/libportal_0.5.bb
> >> >> > deleted file mode 100644
> >> >> > index 67f63fea68..0000000000
> >> >> > --- a/meta/recipes-gnome/libportal/libportal_0.5.bb
> >> >> > +++ /dev/null
> >> >> > @@ -1,17 +0,0 @@
> >> >> > -SUMMARY = "libportal provides GIO-style async APIs for most Flatpak portals."
> >> >> > -DESCRIPTION = "It provides simple asynchronous wrappers for most Flatpak portals \
> >> >> > -with a familiar GObject API along side the D-Bus API"
> >> >> > -HOMEPAGE = "https://github.com/flatpak/libportal"
> >> >> > -BUGTRACKER = "https://github.com/flatpak/libportal/issues"
> >> >> > -LICENSE = "LGPLv3"
> >> >> > -LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
> >> >> > -
> >> >> > -SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=master"
> >> >> > -SRCREV = "467a397fd7996557f837cdc26ac07c01c62810e5"
> >> >> > -S = "${WORKDIR}/git"
> >> >> > -
> >> >> > -inherit meson gtk-doc gobject-introspection
> >> >> > -
> >> >> > -DEPENDS += "glib-2.0 glib-2.0-native gtk+3"
> >> >> > -
> >> >> > -EXTRA_OEMESON = "-Dbackends=gtk3 -Dvapi=false"
> >> >> > --
> >> >> > 2.20.1
> >> >> >
> >> >> >
> >> >> > -=-=-=-=-=-=-=-=-=-=-=-
> >> >> > Links: You receive all messages sent to this group.
> >> >> > View/Reply Online (#160313): https://lists.openembedded.org/g/openembedded-core/message/160313
> >> >> > Mute This Topic: https://lists.openembedded.org/mt/88311445/1997914
> >> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
> >> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> >> >> > -=-=-=-=-=-=-=-=-=-=-=-
> >> >> >

