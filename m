Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web08.13053.1620740665465587574
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 May 2021 06:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.198, mailfrom: robert.joslyn@redrectangle.org)
X-Originating-IP: 173.197.191.182
Received: from smtpclient.apple (rrcs-173-197-191-182.west.biz.rr.com [173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B68F7C000E;
	Tue, 11 May 2021 13:44:22 +0000 (UTC)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: [OE-core] [PATCH v2] epiphany: Update to 40.1
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
In-Reply-To: <CANNYZj8wmXHEScrv6PU=QBeRr-_XUK7=WVmGYQG-OTdk0DpaZQ@mail.gmail.com>
Date: Tue, 11 May 2021 06:44:19 -0700
Cc: OE-core <openembedded-core@lists.openembedded.org>
Message-Id: <5C41FDD2-7471-47F6-B92B-B0BD4AA79865@redrectangle.org>
References: <20210511053907.246803-1-robert.joslyn@redrectangle.org>
 <CANNYZj8wmXHEScrv6PU=QBeRr-_XUK7=WVmGYQG-OTdk0DpaZQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On May 11, 2021, at 4:29 AM, Alexander Kanavin <alex.kanavin@gmail.com> =
wrote:
>=20
> Thanks Robert, I guess we should drop upstream-version-is-even from all =
gnome recipes which I'll take care of - these new 40.x versions weren't pro=
perly reported somehow.
>=20
> Alex

That=E2=80=99s a good point, the new versioning scheme doesn=E2=80=99t do =
the even is release, odd is development thing anymore. I can send a v3, or =
a separate patch if that=E2=80=99s easier since v2 is already on master-nex=
t.

Thanks,
Robert

> On Tue, 11 May 2021 at 07:39, Robert Joslyn <robert.joslyn@redrectangle.=
org> wrote:
> Refresh patch and adjust version directory for new version numbering
> scheme. Add new dependency on libarchive.
>=20
> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> ---
>  .../epiphany/{epiphany_3.38.3.bb =3D> epiphany_40.1.bb}     | 7 ++++---
>  .../0002-help-meson.build-disable-the-use-of-yelp.patch   | 8 ++++----
>  2 files changed, 8 insertions(+), 7 deletions(-)
>  rename meta/recipes-gnome/epiphany/{epiphany_3.38.3.bb =3D> epiphany_40=
.1.bb} (82%)
>=20
> diff --git a/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb b/meta/recip=
es-gnome/epiphany/epiphany_40.1.bb
> similarity index 82%
> rename from meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
> rename to meta/recipes-gnome/epiphany/epiphany_40.1.bb
> index ce24336ace..e1e3ad7868 100644
> --- a/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
> +++ b/meta/recipes-gnome/epiphany/epiphany_40.1.bb
> @@ -8,18 +8,19 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb67=
3463ab874e80d47fae504"
>=20
>  DEPENDS =3D "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr =
gnutls \
>            gsettings-desktop-schemas libxml2-native \
> -          glib-2.0 glib-2.0-native json-glib libdazzle libhandy libport=
al"
> +          glib-2.0 glib-2.0-native json-glib libdazzle libhandy libport=
al \
> +          libarchive"
>=20
>  GNOMEBASEBUILDCLASS =3D "meson"
>  inherit gnomebase gsettings features_check upstream-version-is-even get=
text mime-xdg
>  REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
>=20
> -SRC_URI =3D "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNO=
MEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=3Darchive \
> +SRC_URI =3D "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}=
", 1)}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=3Darchive \
>             file://0002-help-meson.build-disable-the-use-of-yelp.patch \
>             file://migrator.patch \
>             file://distributor.patch \
>             "
> -SRC_URI[archive.sha256sum] =3D "ce62c1fa3e442a9d6131fc884a6bc9a65cf0622=
4c30d649c49624c2ebcb0d275"
> +SRC_URI[archive.sha256sum] =3D "696a426b1702774af8d0f056828f5d9ff935050=
7aba7f4c7e3e499f07a581ad0"
>=20
>  # Developer mode enables debugging
>  PACKAGECONFIG[developer-mode] =3D "-Ddeveloper_mode=3Dtrue,-Ddeveloper_=
mode=3Dfalse"
> diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-dis=
able-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-me=
son.build-disable-the-use-of-yelp.patch
> index 118b5d1825..a6c4f92c86 100644
> --- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-th=
e-use-of-yelp.patch
> +++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-th=
e-use-of-yelp.patch
> @@ -1,4 +1,4 @@
> -From 3725c254f1d1d8204fa299e71c1e2bfd0ff6a634 Mon Sep 17 00:00:00 2001
> +From 77c9f87dc2b3ad0854a678e234e22dfb31902b82 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Wed, 31 Jan 2018 15:50:38 +0200
>  Subject: [PATCH] help/meson.build: disable the use of yelp
> @@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail=
.com>
>   1 file changed, 4 insertions(+), 4 deletions(-)
>=20
>  diff --git a/help/meson.build b/help/meson.build
> -index 484860c..d9b2e80 100644
> +index ff324dd..f5e421d 100644
>  --- a/help/meson.build
>  +++ b/help/meson.build
> -@@ -32,7 +32,7 @@ help_media =3D [
> -   'media/epiphany-private-3-36.png'
> +@@ -31,7 +31,7 @@ help_media =3D [
> +   'media/org.gnome.Epiphany.svg'
>   ]
>=20
>  -gnome.yelp(meson.project_name(),
> --=20
> 2.26.3
>=20
>=20
>=20
>=20

