Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC379C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 19:18:51 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web10.36610.1641842331072185944
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 11:18:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mA+5W0dq;
 spf=pass (domain: gmail.com, ip: 209.85.222.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id p37so25386087uae.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 11:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PNSSxUOXjIry2FCmE72hwVFpePy8BFMXLmEdK22GV0E=;
        b=mA+5W0dqRl1m+rbSjEyZIJcTLAdXfv+VwZxBL2nohn1P7mpIgeO2mL+C5zmcJ7zKGW
         o1Jjr5lnxZwyV1UwGWI8ycyUKOY+r6jY+tRGZuRDeFX0I/mjxXpChqmFT6O/u+7u8Q3l
         q6rGwILJlz3PoOAjDxldSx70GYcYSNw2gPbUSRK4eWD2QzHFQV6QMr81OHFC3plx403y
         YdJFlqCnGTTSP8TKtLqxJPqPTdHs1eTPEJOmPPA/5ErdV0TK5o2oviHfure2pm4qzM0y
         k1GYhUm8+o1knRHVU/iC+mFBDYngYMIL/QmekQW+REclpvIyCl07d6h9buiXBWbzSp0p
         It+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PNSSxUOXjIry2FCmE72hwVFpePy8BFMXLmEdK22GV0E=;
        b=QB0rYZjZByNV0CRyYTosZjyiwAJkV6iIOGjhc35OlbVzLOplkkr3MaCWpzocoFgLj6
         s7eH15LsFtOlS8kd/yyrmmNScTUVdtY+s93U5zkS8Ca/t4Fmlc9jS/inwznqtmhX0mEj
         jieZ5vxXD4huoSWC7sEobWQpNX7vNbOFcablN3Lt55S5Z21Uvf1Es7Yu3kbnf41aHD+s
         sIvbtUGHGL4G4Adih4Q/71kEFtL6bSMna7OitEGnE6ho9NM4lYrBWtrkjyMS/hiUW2y9
         OihqMN9B4NJpc4A+A27ifgQvry9R1bICoPMVCqZFDgKla9hCMH81QpDygZgXo91e3dMz
         OpGw==
X-Gm-Message-State: AOAM530hQv+F46HZgSAk3Aq5xW6xna0iXxwWIhgTwasDYXXncIx8xXro
	KaD3EMwNDoo6Ly0cfRsgr8OvVi64WkO/Fw9HFnI=
X-Google-Smtp-Source: 
 ABdhPJzzhIdf9eBssTB+nM4VRJqXe+pMzaz1OdU87UAgiVaGa6Pi8Ydlkif26gee3QXdtQl7xRSkdgJwNOPfYnjStLA=
X-Received: by 2002:ab0:22c5:: with SMTP id z5mr609805uam.100.1641842329707;
 Mon, 10 Jan 2022 11:18:49 -0800 (PST)
MIME-Version: 1.0
References: <20220109222732.2252416-1-alex@linutronix.de>
 <20220109222732.2252416-10-alex@linutronix.de>
 <CAMKF1sqW2NaY+=49oWG24=6mrrLjM_jam375tbHS_yo8xD2+hA@mail.gmail.com>
 <CANNYZj8jt-Wh4nyBNdXm5ykPjOkK1nvoLH7vcJwgZpPnxn=NeQ@mail.gmail.com>
 <CAMKF1sr4VpWwTqER4h4tYUm4p2v_di8BcmcE_As8GFkiEJO6kQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sr4VpWwTqER4h4tYUm4p2v_di8BcmcE_As8GFkiEJO6kQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 10 Jan 2022 20:18:38 +0100
Message-ID: 
 <CANNYZj9e6DDGBEL7_bcSdU=6z-faXOEjCnDcsJ-rAtEqK_aVrQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/14] epiphany: make libportal optional, and
 move it to meta-oe
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000d6e9c205d53f34f1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 19:18:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160376

--000000000000d6e9c205d53f34f1
Content-Type: text/plain; charset="UTF-8"

For epiphany you also need the oe-core patch. Nautilus should switch to an
optional dependency via PACKAGECONFIG, similar to epiphany.

Alex

On Mon, 10 Jan 2022 at 19:57, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Jan 10, 2022 at 10:49 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Was this patch included in the build?
>
> I had included the meta-oe patch that you posted for sure. I am also
> seeing failing build with similar errors for nautilus see
> https://errors.yoctoproject.org/Errors/Details/621931/
>
> >
> > Alex
> >
> > On Mon, 10 Jan 2022 at 19:43, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> seeing this error
> >>
> >> https://errors.yoctoproject.org/Errors/Details/621908/
> >>
> >> On Sun, Jan 9, 2022 at 2:28 PM Alexander Kanavin <
> alex.kanavin@gmail.com> wrote:
> >> >
> >> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> >> > ---
> >> >  meta/conf/distro/include/maintainers.inc      |  1 -
> >> >  meta/recipes-gnome/epiphany/epiphany_41.0.bb  |  2 +-
> >> >  meta/recipes-gnome/libportal/libportal_0.5.bb | 17 -----------------
> >> >  3 files changed, 1 insertion(+), 19 deletions(-)
> >> >  delete mode 100644 meta/recipes-gnome/libportal/libportal_0.5.bb
> >> >
> >> > diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> >> > index 0af6974a3d..ab7915482a 100644
> >> > --- a/meta/conf/distro/include/maintainers.inc
> >> > +++ b/meta/conf/distro/include/maintainers.inc
> >> > @@ -369,7 +369,6 @@ RECIPE_MAINTAINER:pn-libpcre = "Yi Zhao <
> yi.zhao@windriver.com>"
> >> >  RECIPE_MAINTAINER:pn-libpcre2 = "Unassigned <
> unassigned@yoctoproject.org>"
> >> >  RECIPE_MAINTAINER:pn-libpipeline = "Wang Mingyu <wangmy@fujitsu.com
> >"
> >> >  RECIPE_MAINTAINER:pn-libpng = "Anuj Mittal <anuj.mittal@intel.com>"
> >> > -RECIPE_MAINTAINER:pn-libportal = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> >> >  RECIPE_MAINTAINER:pn-libproxy = "Anuj Mittal <anuj.mittal@intel.com
> >"
> >> >  RECIPE_MAINTAINER:pn-libpthread-stubs = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> >> >  RECIPE_MAINTAINER:pn-libptytty = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> >> > diff --git a/meta/recipes-gnome/epiphany/epiphany_41.0.bb
> b/meta/recipes-gnome/epiphany/epiphany_41.0.bb
> >> > index 8f3bd87340..a64cdefd86 100644
> >> > --- a/meta/recipes-gnome/epiphany/epiphany_41.0.bb
> >> > +++ b/meta/recipes-gnome/epiphany/epiphany_41.0.bb
> >> > @@ -15,7 +15,6 @@ DEPENDS = " \
> >> >            libarchive \
> >> >            libdazzle \
> >> >            libhandy \
> >> > -          libportal \
> >> >            glib-2.0-native \
> >> >            "
> >> >
> >> > @@ -37,6 +36,7 @@ PACKAGECONFIG ??= "${PACKAGECONFIG_SOUP}"
> >> >  PACKAGECONFIG[developer-mode] =
> "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
> >> >  PACKAGECONFIG[soup2] =
> "-Dsoup2=enabled,-Dsoup2=disabled,libsoup-2.4,,,soup3"
> >> >  PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
> >> > +PACKAGECONFIG[libportal] =
> "-Dlibportal=enabled,-Dlibportal=disabled,libportal"
> >> >
> >> >  FILES:${PN} += "${datadir}/dbus-1
> ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
> >> >  RDEPENDS:${PN} = "iso-codes adwaita-icon-theme
> gsettings-desktop-schemas"
> >> > diff --git a/meta/recipes-gnome/libportal/libportal_0.5.bb
> b/meta/recipes-gnome/libportal/libportal_0.5.bb
> >> > deleted file mode 100644
> >> > index 67f63fea68..0000000000
> >> > --- a/meta/recipes-gnome/libportal/libportal_0.5.bb
> >> > +++ /dev/null
> >> > @@ -1,17 +0,0 @@
> >> > -SUMMARY = "libportal provides GIO-style async APIs for most Flatpak
> portals."
> >> > -DESCRIPTION = "It provides simple asynchronous wrappers for most
> Flatpak portals \
> >> > -with a familiar GObject API along side the D-Bus API"
> >> > -HOMEPAGE = "https://github.com/flatpak/libportal"
> >> > -BUGTRACKER = "https://github.com/flatpak/libportal/issues"
> >> > -LICENSE = "LGPLv3"
> >> > -LIC_FILES_CHKSUM =
> "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
> >> > -
> >> > -SRC_URI = "git://
> github.com/flatpak/${BPN}.git;protocol=https;branch=master
> <http://github.com/flatpak/$%7BBPN%7D.git;protocol=https;branch=master>"
> >> > -SRCREV = "467a397fd7996557f837cdc26ac07c01c62810e5"
> >> > -S = "${WORKDIR}/git"
> >> > -
> >> > -inherit meson gtk-doc gobject-introspection
> >> > -
> >> > -DEPENDS += "glib-2.0 glib-2.0-native gtk+3"
> >> > -
> >> > -EXTRA_OEMESON = "-Dbackends=gtk3 -Dvapi=false"
> >> > --
> >> > 2.20.1
> >> >
> >> >
> >> > -=-=-=-=-=-=-=-=-=-=-=-
> >> > Links: You receive all messages sent to this group.
> >> > View/Reply Online (#160313):
> https://lists.openembedded.org/g/openembedded-core/message/160313
> >> > Mute This Topic: https://lists.openembedded.org/mt/88311445/1997914
> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [raj.khem@gmail.com]
> >> > -=-=-=-=-=-=-=-=-=-=-=-
> >> >
>

--000000000000d6e9c205d53f34f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>For epiphany you also need the oe-core patch. Nautilu=
s should switch to an optional dependency via PACKAGECONFIG, similar to epi=
phany.<br></div><div><br></div><div>Alex<br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 10 Jan 2022 at 19=
:57, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Mon, Jan 10, 2022 at 10:49 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Was this patch included in the build?<br>
<br>
I had included the meta-oe patch that you posted for sure. I am also<br>
seeing failing build with similar errors for nautilus see<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/621931/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/621931/</a><br>
<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Mon, 10 Jan 2022 at 19:43, Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; seeing this error<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/621908/"=
 rel=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Error=
s/Details/621908/</a><br>
&gt;&gt;<br>
&gt;&gt; On Sun, Jan 9, 2022 at 2:28 PM Alexander Kanavin &lt;<a href=3D"ma=
ilto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&g=
t; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@l=
inutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 1 -<br>
&gt;&gt; &gt;=C2=A0 meta/recipes-gnome/epiphany/<a href=3D"http://epiphany_=
41.0.bb" rel=3D"noreferrer" target=3D"_blank">epiphany_41.0.bb</a>=C2=A0 |=
=C2=A0 2 +-<br>
&gt;&gt; &gt;=C2=A0 meta/recipes-gnome/libportal/<a href=3D"http://libporta=
l_0.5.bb" rel=3D"noreferrer" target=3D"_blank">libportal_0.5.bb</a> | 17 --=
---------------<br>
&gt;&gt; &gt;=C2=A0 3 files changed, 1 insertion(+), 19 deletions(-)<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-gnome/libportal/<a href=
=3D"http://libportal_0.5.bb" rel=3D"noreferrer" target=3D"_blank">libportal=
_0.5.bb</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/conf/distro/include/maintainers.inc b/meta/=
conf/distro/include/maintainers.inc<br>
&gt;&gt; &gt; index 0af6974a3d..ab7915482a 100644<br>
&gt;&gt; &gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt;&gt; &gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt;&gt; &gt; @@ -369,7 +369,6 @@ RECIPE_MAINTAINER:pn-libpcre =3D &quot;Yi=
 Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=3D"_blank">yi.zha=
o@windriver.com</a>&gt;&quot;<br>
&gt;&gt; &gt;=C2=A0 RECIPE_MAINTAINER:pn-libpcre2 =3D &quot;Unassigned &lt;=
<a href=3D"mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned=
@yoctoproject.org</a>&gt;&quot;<br>
&gt;&gt; &gt;=C2=A0 RECIPE_MAINTAINER:pn-libpipeline =3D &quot;Wang Mingyu =
&lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.=
com</a>&gt;&quot;<br>
&gt;&gt; &gt;=C2=A0 RECIPE_MAINTAINER:pn-libpng =3D &quot;Anuj Mittal &lt;<=
a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel=
.com</a>&gt;&quot;<br>
&gt;&gt; &gt; -RECIPE_MAINTAINER:pn-libportal =3D &quot;Alexander Kanavin &=
lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin=
@gmail.com</a>&gt;&quot;<br>
&gt;&gt; &gt;=C2=A0 RECIPE_MAINTAINER:pn-libproxy =3D &quot;Anuj Mittal &lt=
;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@int=
el.com</a>&gt;&quot;<br>
&gt;&gt; &gt;=C2=A0 RECIPE_MAINTAINER:pn-libpthread-stubs =3D &quot;Alexand=
er Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">=
alex.kanavin@gmail.com</a>&gt;&quot;<br>
&gt;&gt; &gt;=C2=A0 RECIPE_MAINTAINER:pn-libptytty =3D &quot;Alexander Kana=
vin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.ka=
navin@gmail.com</a>&gt;&quot;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-gnome/epiphany/<a href=3D"http://ep=
iphany_41.0.bb" rel=3D"noreferrer" target=3D"_blank">epiphany_41.0.bb</a> b=
/meta/recipes-gnome/epiphany/<a href=3D"http://epiphany_41.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">epiphany_41.0.bb</a><br>
&gt;&gt; &gt; index 8f3bd87340..a64cdefd86 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-gnome/epiphany/<a href=3D"http://epiphany_=
41.0.bb" rel=3D"noreferrer" target=3D"_blank">epiphany_41.0.bb</a><br>
&gt;&gt; &gt; +++ b/meta/recipes-gnome/epiphany/<a href=3D"http://epiphany_=
41.0.bb" rel=3D"noreferrer" target=3D"_blank">epiphany_41.0.bb</a><br>
&gt;&gt; &gt; @@ -15,7 +15,6 @@ DEPENDS =3D &quot; \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libarchive \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libdazzle \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libhandy \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libportal \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glib-2.0-native \<br=
>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; @@ -37,6 +36,7 @@ PACKAGECONFIG ??=3D &quot;${PACKAGECONFIG_S=
OUP}&quot;<br>
&gt;&gt; &gt;=C2=A0 PACKAGECONFIG[developer-mode] =3D &quot;-Ddeveloper_mod=
e=3Dtrue,-Ddeveloper_mode=3Dfalse&quot;<br>
&gt;&gt; &gt;=C2=A0 PACKAGECONFIG[soup2] =3D &quot;-Dsoup2=3Denabled,-Dsoup=
2=3Ddisabled,libsoup-2.4,,,soup3&quot;<br>
&gt;&gt; &gt;=C2=A0 PACKAGECONFIG[soup3] =3D &quot;,,libsoup,,,soup2&quot;<=
br>
&gt;&gt; &gt; +PACKAGECONFIG[libportal] =3D &quot;-Dlibportal=3Denabled,-Dl=
ibportal=3Ddisabled,libportal&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 FILES:${PN} +=3D &quot;${datadir}/dbus-1 ${datadir}/gno=
me-shell/search-providers ${datadir}/metainfo&quot;<br>
&gt;&gt; &gt;=C2=A0 RDEPENDS:${PN} =3D &quot;iso-codes adwaita-icon-theme g=
settings-desktop-schemas&quot;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-gnome/libportal/<a href=3D"http://l=
ibportal_0.5.bb" rel=3D"noreferrer" target=3D"_blank">libportal_0.5.bb</a> =
b/meta/recipes-gnome/libportal/<a href=3D"http://libportal_0.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">libportal_0.5.bb</a><br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index 67f63fea68..0000000000<br>
&gt;&gt; &gt; --- a/meta/recipes-gnome/libportal/<a href=3D"http://libporta=
l_0.5.bb" rel=3D"noreferrer" target=3D"_blank">libportal_0.5.bb</a><br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,17 +0,0 @@<br>
&gt;&gt; &gt; -SUMMARY =3D &quot;libportal provides GIO-style async APIs fo=
r most Flatpak portals.&quot;<br>
&gt;&gt; &gt; -DESCRIPTION =3D &quot;It provides simple asynchronous wrappe=
rs for most Flatpak portals \<br>
&gt;&gt; &gt; -with a familiar GObject API along side the D-Bus API&quot;<b=
r>
&gt;&gt; &gt; -HOMEPAGE =3D &quot;<a href=3D"https://github.com/flatpak/lib=
portal" rel=3D"noreferrer" target=3D"_blank">https://github.com/flatpak/lib=
portal</a>&quot;<br>
&gt;&gt; &gt; -BUGTRACKER =3D &quot;<a href=3D"https://github.com/flatpak/l=
ibportal/issues" rel=3D"noreferrer" target=3D"_blank">https://github.com/fl=
atpak/libportal/issues</a>&quot;<br>
&gt;&gt; &gt; -LICENSE =3D &quot;LGPLv3&quot;<br>
&gt;&gt; &gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D3000208d539e=
c061b899bce1d9ce9404&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/flatpak=
/$%7BBPN%7D.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=
=3D"_blank">github.com/flatpak/${BPN}.git;protocol=3Dhttps;branch=3Dmaster<=
/a>&quot;<br>
&gt;&gt; &gt; -SRCREV =3D &quot;467a397fd7996557f837cdc26ac07c01c62810e5&qu=
ot;<br>
&gt;&gt; &gt; -S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -inherit meson gtk-doc gobject-introspection<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -DEPENDS +=3D &quot;glib-2.0 glib-2.0-native gtk+3&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -EXTRA_OEMESON =3D &quot;-Dbackends=3Dgtk3 -Dvapi=3Dfalse&quo=
t;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.20.1<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; &gt; View/Reply Online (#160313): <a href=3D"https://lists.openemb=
edded.org/g/openembedded-core/message/160313" rel=3D"noreferrer" target=3D"=
_blank">https://lists.openembedded.org/g/openembedded-core/message/160313</=
a><br>
&gt;&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt=
/88311445/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/mt/88311445/1997914</a><br>
&gt;&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@list=
s.openembedded.org" target=3D"_blank">openembedded-core+owner@lists.openemb=
edded.org</a><br>
&gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/open=
embedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;<br>
</blockquote></div>

--000000000000d6e9c205d53f34f1--

