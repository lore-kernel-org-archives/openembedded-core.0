Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0BBC433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 15:34:06 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.27671.1646667243891781057
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 07:34:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ViwXD+wV;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1646667244;
  x=1678203244;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=lbVoHtxj3qlyFnlH2nN6oHMfdWJoOj6Wa03gZmBaJJA=;
  b=ViwXD+wVHY7b8ic/NKEIMEA81jk1ypEo4wBBBgWrNqQo7+nySK5uILWK
   1UF1ZjcKval1+3OIiFajfSoj8s4YjMiqtqPmR1wCCaHosLJosB08Psp06
   UJOS79xooeRP1j5IugAeoDUcj8vtbh+7tM0Ty0M+250LILym4uj/WV0eH
   Kyc0SQVUTpc7zxAhoJKkL1gvJyrlfMOk4LVN58iSECWnfJW3j00rz5EOs
   N9F7t3h7uNuF3kq/c/U0fWcDHKwuxh5hp1gFudBdV68IDHKCcICWp7+p/
   R4JrpfAq+4lI41B4pGlLY+gSKwI3xITVL69J1J7EWIWkMRSnJmJjr9zTX
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Jose Quaresma <quaresma.jose@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH v4] gstreamer1.0-plugins-bad/ugly: use the
 GPL-2.0-or-later only when it is in use
Thread-Topic: [PATCH v4] gstreamer1.0-plugins-bad/ugly: use the
 GPL-2.0-or-later only when it is in use
Thread-Index: AQHYMgGoW6qeAuVxxkad9kAmAOW4Qqy0C4MA
Date: Mon, 7 Mar 2022 15:33:57 +0000
Message-ID: <d0ce368f42264868a8af1e4c390fbe58@axis.com>
References: <20220307085919.426627-1-quaresma.jose@gmail.com>
In-Reply-To: <20220307085919.426627-1-quaresma.jose@gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 15:34:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162851

> -----Original Message-----
> From: Jose Quaresma <quaresma.jose@gmail.com>
> Sent: den 7 mars 2022 09:59
> To: openembedded-core@lists.openembedded.org
> Cc: Jose Quaresma <quaresma.jose@gmail.com>; Peter Kjellerstedt <peter.kj=
ellerstedt@axis.com>
> Subject: [PATCH v4] gstreamer1.0-plugins-bad/ugly: use the GPL-2.0-or-lat=
er only when it is in use
>=20
> Since all gstreamer modules uses LGPLv2.1 with exceptions
> for some plugins in bad and ugly modules that has GPLv2+.
>=20
> For the GPLv2+ this patch set the license only for each plugin
> that is affected by this license. The commercial LICENSE_FLAGS
> is enabled if any of the previous plugins is builded.
>=20
> CC: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  .../gstreamer1.0-plugins-bad_1.20.0.bb        |  5 ++--
>  .../gstreamer1.0-plugins-license.inc          | 26 +++++++++++++++++++
>  .../gstreamer1.0-plugins-ugly_1.20.0.bb       |  8 +++---
>  3 files changed, 33 insertions(+), 6 deletions(-)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-license.inc
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1=
.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.=
0.bb
> index 44532222fa..17799040ef 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.b=
b
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.b=
b
> @@ -1,4 +1,5 @@
>  require gstreamer1.0-plugins-common.inc
> +require gstreamer1.0-plugins-license.inc
>=20
>  DESCRIPTION =3D "'Bad' GStreamer plugins and helper libraries "
>  HOMEPAGE =3D "https://gstreamer.freedesktop.org/"
> @@ -92,8 +93,8 @@ PACKAGECONFIG[webrtcdsp]       =3D "-Dwebrtcdsp=3Denabl=
ed,-Dwebrtcdsp=3Ddisabled,webrt
>  PACKAGECONFIG[zbar]            =3D "-Dzbar=3Denabled,-Dzbar=3Ddisabled,z=
bar"
>  PACKAGECONFIG[x11]             =3D "-Dx11=3Denabled,-Dx11=3Ddisabled,lib=
xcb libxkbcommon"
>=20
> -# GPL - only built if gpl option is also enabled!
> -PACKAGECONFIG[gpl]             =3D "-Dgpl=3Denabled,-Dgpl=3Ddisabled"
> +GSTREAMER_GPL =3D "${@bb.utils.filter('PACKAGECONFIG', 'faad resindvd x2=
65', d)}"

Seems a bit odd to have this variable in the middle of=20
the PACKAGECONFIGs.

> +
>  PACKAGECONFIG[faad]            =3D "-Dfaad=3Denabled,-Dfaad=3Ddisabled,f=
aad2"
>  PACKAGECONFIG[resindvd]        =3D "-Dresindvd=3Denabled,-Dresindvd=3Ddi=
sabled,libdvdread libdvdnav"
>  PACKAGECONFIG[x265]            =3D "-Dx265=3Denabled,-Dx265=3Ddisabled,x=
265"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-licen=
se.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-license.inc
> new file mode 100644
> index 0000000000..23a42d9c24
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-license.inc
> @@ -0,0 +1,26 @@
> +# This .inc file contains functionality for automatically setting
> +# the common license of all plugins so we can overwride some of them
> +#
> +# This is mainly used by the gstreamer1.0-plugins-* plugin set recipes,
> +# but can be used in any recipe that produces GStreamer plugins.
> +
> +PACKAGESPLITFUNCS:append =3D " set_gstreamer_license "
> +
> +python set_gstreamer_license () {
> +    import oe.utils
> +    pn =3D d.getVar('PN') + '-'
> +    gpl_plugins_names =3D [pn+plugin for plugin in d.getVar('GSTREAMER_G=
PL').split()]
> +    for pkg in oe.utils.packages_filter_out_system(d):
> +        if pkg in gpl_plugins_names:
> +            d.setVar('LICENSE:' + pkg, 'GPL-2.0-or-later')
> +        else:
> +            d.setVar('LICENSE:' + pkg, 'LGPL-2.1-or-later')
> +}
> +
> +EXTRA_OEMESON +=3D " \
> +    ${@bb.utils.contains_any('PACKAGECONFIG', "${GSTREAMER_GPL}", '-Dgpl=
=3Denabled', '-Dgpl=3Ddisabled', d)} \
> +    "
> +
> +LICENSE_FLAGS =3D " \
> +    ${@bb.utils.contains_any('PACKAGECONFIG', "${GSTREAMER_GPL}", 'comme=
rcial', '', d)} \
> +    "
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_=
1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2=
0.0.bb
> index 9b6f80aa89..577ba16af7 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.=
bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.=
bb
> @@ -1,4 +1,5 @@
>  require gstreamer1.0-plugins-common.inc
> +require gstreamer1.0-plugins-license.inc
>=20
>  DESCRIPTION =3D "'Ugly GStreamer plugins"
>  HOMEPAGE =3D "https://gstreamer.freedesktop.org/"
> @@ -8,7 +9,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6=
cdffcea4f398e37343 \
>=20
> file://tests/check/elements/xingmux.c;beginline=3D1;endline=3D21;md5=3D4c=
771b8af188724855cb99cadd390068"
>=20
>  LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later"
> -LICENSE_FLAGS =3D "commercial"

I still think this is wrong. I.e., the commercial flag is not=20
related to a plugin using GPL or not, but rather the fact that it=20
is in ugly. E.g., the reason may be patent considerations and=20
can apply to any of the plugins regardless of license.

>=20
>  SRC_URI =3D " \
>              https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-p=
lugins-ugly-${PV}.tar.xz \
> @@ -23,14 +23,14 @@ GST_PLUGIN_SET_HAS_EXAMPLES =3D "0"
>=20
>  PACKAGECONFIG ??=3D " \
>      ${GSTREAMER_ORC} \
> -    gpl a52dec mpeg2dec \
> +    a52dec mpeg2dec \
>  "
>=20
>  PACKAGECONFIG[amrnb]    =3D "-Damrnb=3Denabled,-Damrnb=3Ddisabled,openco=
re-amr"
>  PACKAGECONFIG[amrwb]    =3D "-Damrwbdec=3Denabled,-Damrwbdec=3Ddisabled,=
opencore-amr"
>=20
> -# GPL - only built if gpl option is also enabled!
> -PACKAGECONFIG[gpl]      =3D "-Dgpl=3Denabled,-Dgpl=3Ddisabled"
> +GSTREAMER_GPL =3D "${@bb.utils.filter('PACKAGECONFIG', 'cdio a52dec dvdr=
ead mpeg2dec x264', d)}"
> +
>  PACKAGECONFIG[cdio]     =3D "-Dcdio=3Denabled,-Dcdio=3Ddisabled,libcdio"
>  PACKAGECONFIG[a52dec]   =3D "-Da52dec=3Denabled,-Da52dec=3Ddisabled,liba=
52"
>  PACKAGECONFIG[dvdread]  =3D "-Ddvdread=3Denabled,-Ddvdread=3Ddisabled,li=
bdvdread"
> --
> 2.35.1

//Peter


