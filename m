Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B537C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 20:54:56 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.38193.1641848085485655077
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 12:54:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OPDUFY6g;
 spf=pass (domain: gmail.com, ip: 209.85.222.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id t66so16689160qkb.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 12:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xzi8O+Atm/YHZufUHdrTeKfXpKLBAqxVDFgbC1g9CZ8=;
        b=OPDUFY6gokMo1SYgTOGF3dq6If7oJWiU+2ObUR8ymWe0kJHAaFoyDZF6ZTso45hkc+
         IKDx3j4B/dc6/XdiOG3qwsP5xhnQeK7+sTSwOn2VBKbyEBdzhxHiXGyI37fRkJV2zyeo
         XRYMABVvgRnbiAidWFd/xfE5O/xWAzQ2WVRNrL1XxZoP059RGLZuHjUkt3A9HAWxv8ay
         xxMZx7HTWIEGZmW+0a/krVm7hu+DyCrUfWx2LPoURsZt7FBtWHK+SL9ghag7TPSrNsdF
         97b83F/2pcRPMElmQW13ZegclQ/5wZE/Jl0u6Zbr0lRY52u2TMLJCYPszrdivRDBNpkv
         X9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xzi8O+Atm/YHZufUHdrTeKfXpKLBAqxVDFgbC1g9CZ8=;
        b=dyJb2hObA29nWYjcKf3WdYlwJnqYN2r3bKJk9rcZnEpegUrZeaIlCuMFYmpcgH6P7A
         f6b+HZilZqwRkKDZ8JsBlfiLaFx0NBHqrtjHrYTsNgO5fM2oF+chHCNUJOBLIci5lCxk
         5crkM8dMLpnFSvg4+KujK5f1Uh6sLHXaGYMVPXpBUcUCa7jMr1w8ealbcK6TWyitc8pk
         p2NU2TskdjVvAxC+eumzW1EAGJ8Qxm+y4etV9W2G2u3PPVeA0gr8Kw2LuJqTyWDLJZH9
         jgfVTkl5+xkQ64zUA95vvlJpur15RHriOBOx5+eyMoRzyrE6c3I4evcyrz4/H9N9PVjT
         wNRw==
X-Gm-Message-State: AOAM532XEUSCM07kwARePck85AGcBXtFM3mLry/BDn4hdUiuMz2UEVnq
	ISBwIQosUFF1bdHj6VTEh8Ihyr3VshX6MmQDYAw=
X-Google-Smtp-Source: 
 ABdhPJzDh3cEAYZhvpu6p/EryUb6UzCYOtplOSTLsHwCM9wXyF5xkBxDNPgv06v2sTC719/Jhw2Jv/VH+COeg/Fow98=
X-Received: by 2002:a05:620a:11b8:: with SMTP id
 c24mr1142843qkk.227.1641848084314;
 Mon, 10 Jan 2022 12:54:44 -0800 (PST)
MIME-Version: 1.0
References: <20220109222732.2252416-1-alex@linutronix.de>
 <20220109222732.2252416-10-alex@linutronix.de>
 <CAMKF1sqW2NaY+=49oWG24=6mrrLjM_jam375tbHS_yo8xD2+hA@mail.gmail.com>
 <CANNYZj8jt-Wh4nyBNdXm5ykPjOkK1nvoLH7vcJwgZpPnxn=NeQ@mail.gmail.com>
 <CAMKF1sr4VpWwTqER4h4tYUm4p2v_di8BcmcE_As8GFkiEJO6kQ@mail.gmail.com>
 <CANNYZj9e6DDGBEL7_bcSdU=6z-faXOEjCnDcsJ-rAtEqK_aVrQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9e6DDGBEL7_bcSdU=6z-faXOEjCnDcsJ-rAtEqK_aVrQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Jan 2022 12:54:18 -0800
Message-ID: 
 <CAMKF1sp3ujr7iaktTzxH0bSXT8MKJ5c06t4ObUro8m5zCczD5Q@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 20:54:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160380

On Mon, Jan 10, 2022 at 11:18 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> For epiphany you also need the oe-core patch. Nautilus should switch to an optional dependency via PACKAGECONFIG, similar to epiphany.

I might have missed the OE-core patch perhaps, I will rebuild with
latest master-next perhaps and see if that helps

>
> Alex
>
> On Mon, 10 Jan 2022 at 19:57, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Mon, Jan 10, 2022 at 10:49 AM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > Was this patch included in the build?
>>
>> I had included the meta-oe patch that you posted for sure. I am also
>> seeing failing build with similar errors for nautilus see
>> https://errors.yoctoproject.org/Errors/Details/621931/
>>
>> >
>> > Alex
>> >
>> > On Mon, 10 Jan 2022 at 19:43, Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >> seeing this error
>> >>
>> >> https://errors.yoctoproject.org/Errors/Details/621908/
>> >>
>> >> On Sun, Jan 9, 2022 at 2:28 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>> >> >
>> >> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> >> > ---
>> >> >  meta/conf/distro/include/maintainers.inc      |  1 -
>> >> >  meta/recipes-gnome/epiphany/epiphany_41.0.bb  |  2 +-
>> >> >  meta/recipes-gnome/libportal/libportal_0.5.bb | 17 -----------------
>> >> >  3 files changed, 1 insertion(+), 19 deletions(-)
>> >> >  delete mode 100644 meta/recipes-gnome/libportal/libportal_0.5.bb
>> >> >
>> >> > diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
>> >> > index 0af6974a3d..ab7915482a 100644
>> >> > --- a/meta/conf/distro/include/maintainers.inc
>> >> > +++ b/meta/conf/distro/include/maintainers.inc
>> >> > @@ -369,7 +369,6 @@ RECIPE_MAINTAINER:pn-libpcre = "Yi Zhao <yi.zhao@windriver.com>"
>> >> >  RECIPE_MAINTAINER:pn-libpcre2 = "Unassigned <unassigned@yoctoproject.org>"
>> >> >  RECIPE_MAINTAINER:pn-libpipeline = "Wang Mingyu <wangmy@fujitsu.com>"
>> >> >  RECIPE_MAINTAINER:pn-libpng = "Anuj Mittal <anuj.mittal@intel.com>"
>> >> > -RECIPE_MAINTAINER:pn-libportal = "Alexander Kanavin <alex.kanavin@gmail.com>"
>> >> >  RECIPE_MAINTAINER:pn-libproxy = "Anuj Mittal <anuj.mittal@intel.com>"
>> >> >  RECIPE_MAINTAINER:pn-libpthread-stubs = "Alexander Kanavin <alex.kanavin@gmail.com>"
>> >> >  RECIPE_MAINTAINER:pn-libptytty = "Alexander Kanavin <alex.kanavin@gmail.com>"
>> >> > diff --git a/meta/recipes-gnome/epiphany/epiphany_41.0.bb b/meta/recipes-gnome/epiphany/epiphany_41.0.bb
>> >> > index 8f3bd87340..a64cdefd86 100644
>> >> > --- a/meta/recipes-gnome/epiphany/epiphany_41.0.bb
>> >> > +++ b/meta/recipes-gnome/epiphany/epiphany_41.0.bb
>> >> > @@ -15,7 +15,6 @@ DEPENDS = " \
>> >> >            libarchive \
>> >> >            libdazzle \
>> >> >            libhandy \
>> >> > -          libportal \
>> >> >            glib-2.0-native \
>> >> >            "
>> >> >
>> >> > @@ -37,6 +36,7 @@ PACKAGECONFIG ??= "${PACKAGECONFIG_SOUP}"
>> >> >  PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
>> >> >  PACKAGECONFIG[soup2] = "-Dsoup2=enabled,-Dsoup2=disabled,libsoup-2.4,,,soup3"
>> >> >  PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
>> >> > +PACKAGECONFIG[libportal] = "-Dlibportal=enabled,-Dlibportal=disabled,libportal"
>> >> >
>> >> >  FILES:${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
>> >> >  RDEPENDS:${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
>> >> > diff --git a/meta/recipes-gnome/libportal/libportal_0.5.bb b/meta/recipes-gnome/libportal/libportal_0.5.bb
>> >> > deleted file mode 100644
>> >> > index 67f63fea68..0000000000
>> >> > --- a/meta/recipes-gnome/libportal/libportal_0.5.bb
>> >> > +++ /dev/null
>> >> > @@ -1,17 +0,0 @@
>> >> > -SUMMARY = "libportal provides GIO-style async APIs for most Flatpak portals."
>> >> > -DESCRIPTION = "It provides simple asynchronous wrappers for most Flatpak portals \
>> >> > -with a familiar GObject API along side the D-Bus API"
>> >> > -HOMEPAGE = "https://github.com/flatpak/libportal"
>> >> > -BUGTRACKER = "https://github.com/flatpak/libportal/issues"
>> >> > -LICENSE = "LGPLv3"
>> >> > -LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
>> >> > -
>> >> > -SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=master"
>> >> > -SRCREV = "467a397fd7996557f837cdc26ac07c01c62810e5"
>> >> > -S = "${WORKDIR}/git"
>> >> > -
>> >> > -inherit meson gtk-doc gobject-introspection
>> >> > -
>> >> > -DEPENDS += "glib-2.0 glib-2.0-native gtk+3"
>> >> > -
>> >> > -EXTRA_OEMESON = "-Dbackends=gtk3 -Dvapi=false"
>> >> > --
>> >> > 2.20.1
>> >> >
>> >> >
>> >> > -=-=-=-=-=-=-=-=-=-=-=-
>> >> > Links: You receive all messages sent to this group.
>> >> > View/Reply Online (#160313): https://lists.openembedded.org/g/openembedded-core/message/160313
>> >> > Mute This Topic: https://lists.openembedded.org/mt/88311445/1997914
>> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
>> >> > -=-=-=-=-=-=-=-=-=-=-=-
>> >> >

