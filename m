Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.5827.1590112381980552092
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 18:53:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04M1qCmp014840
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Thu, 21 May 2020 18:52:33 -0700
Received: from [128.224.162.131] (128.224.162.131) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Thu, 21 May 2020
 18:52:21 -0700
Subject: Re: [OE-core] [PATCH] libsecret: add meson option introspection
To: Martin Jansa <martin.jansa@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20200521092241.28336-1-kai.kang@windriver.com>
 <CA+chaQf==RCLZSOE_-76sh9qhjavL_v2M=zTQfXbug1zmnNFhg@mail.gmail.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <e7432958-4da7-e631-8f74-728000a60871@windriver.com>
Date: Fri, 22 May 2020 09:52:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQf==RCLZSOE_-76sh9qhjavL_v2M=zTQfXbug1zmnNFhg@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------009CACB2FEA2E5310924B9DC"
Content-Language: en-US

--------------009CACB2FEA2E5310924B9DC
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 04M1qCmp014840

On 2020/5/21 =E4=B8=8B=E5=8D=886:07, Martin Jansa wrote:
> If it's no longer mandatory, then please remove:
> https://github.com/openembedded/openembedded-core/commit/08c86406186828d=
ce19e101adfd118ed5d9e947e
>
> together with:
> # gobject-introspection is mandatory and cannot be configured
> REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
> UNKNOWN_CONFIGURE_WHITELIST_append =3D " introspection"
>
> and revert
> https://github.com/openembedded/openembedded-core/commit/cab86a3196ef4fc=
d2714591597f2503aa8138df0
> as well

I'll check these patches and v2 will be sent.

Regards,
Kai


>
>
> On Thu, May 21, 2020 at 11:23 AM kai <kai.kang@windriver.com=20
> <mailto:kai.kang@windriver.com>> wrote:
>
>     From: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>
>     Add meson option introspection for libsecret. For bsp which doesn't
>     support qemu usermode, it could disable gobject introspection build.
>
>     Signed-off-by: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>     ---
>     =C2=A0.../0001-meson-add-option-introspection.patch | 137
>     ++++++++++++++++++
>     =C2=A0.../libsecret/libsecret_0.20.3.bb <http://libsecret_0.20.3.bb>=
 =C2=A0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +
>     =C2=A02 files changed, 139 insertions(+)
>     =C2=A0create mode 100644
>     meta/recipes-gnome/libsecret/files/0001-meson-add-option-introspecti=
on.patch
>
>     diff --git
>     a/meta/recipes-gnome/libsecret/files/0001-meson-add-option-introspec=
tion.patch
>     b/meta/recipes-gnome/libsecret/files/0001-meson-add-option-introspec=
tion.patch
>     new file mode 100644
>     index 0000000000..51ee66f42b
>     --- /dev/null
>     +++
>     b/meta/recipes-gnome/libsecret/files/0001-meson-add-option-introspec=
tion.patch
>     @@ -0,0 +1,137 @@
>     +meson: add option introspection
>     +
>     +Add an option 'introspection' for meson which could control whether
>     +build GIR files or not.
>     +
>     +Upstream-Status: Submitted
>     [https://gitlab.gnome.org/GNOME/libsecret/-/merge_requests/53]
>     +
>     +Signed-off-by: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>     +---
>     + libsecret/meson.build | 86
>     ++++++++++++++++++++++---------------------
>     + meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +
>     + meson_options.txt=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +
>     + 3 files changed, 46 insertions(+), 42 deletions(-)
>     +
>     +diff --git a/libsecret/meson.build b/libsecret/meson.build
>     +index 759b5ef..2ee8850 100644
>     +--- a/libsecret/meson.build
>     ++++ b/libsecret/meson.build
>     +@@ -104,50 +104,52 @@ libsecret_dep =3D declare_dependency(
>     + )
>     +
>     + # GObject Introspection
>     +-libsecret_gir_sources =3D [
>     +-=C2=A0 'secret-attributes.c',
>     +-=C2=A0 'secret-attributes.h',
>     +-=C2=A0 'secret-backend.c',
>     +-=C2=A0 'secret-backend.h',
>     +-=C2=A0 'secret-collection.c',
>     +-=C2=A0 'secret-collection.h',
>     +-=C2=A0 'secret-item.c',
>     +-=C2=A0 'secret-item.h',
>     +-=C2=A0 'secret-methods.c',
>     +-=C2=A0 'secret-password.c',
>     +-=C2=A0 'secret-password.h',
>     +-=C2=A0 'secret-paths.c',
>     +-=C2=A0 'secret-paths.h',
>     +-=C2=A0 'secret-prompt.c',
>     +-=C2=A0 'secret-prompt.h',
>     +-=C2=A0 'secret-retrievable.c',
>     +-=C2=A0 'secret-retrievable.h',
>     +-=C2=A0 'secret-schema.c',
>     +-=C2=A0 'secret-schema.h',
>     +-=C2=A0 'secret-schemas.c',
>     +-=C2=A0 'secret-schemas.h',
>     +-=C2=A0 'secret-service.c',
>     +-=C2=A0 'secret-service.h',
>     +-=C2=A0 'secret-types.h',
>     +-=C2=A0 'secret-value.c',
>     +-=C2=A0 'secret-value.h',
>     +-]
>     +-libsecret_gir_sources +=3D version_h
>     +-libsecret_gir_sources +=3D _enums_generated
>     +-
>     +-libsecret_gir =3D gnome.generate_gir(libsecret,
>     +-=C2=A0 sources: libsecret_gir_sources,
>     +-=C2=A0 namespace: 'Secret',
>     +-=C2=A0 nsversion: api_version_major,
>     +-=C2=A0 export_packages: 'libsecret-@0@'.format(api_version_major),
>     +-=C2=A0 includes: [ 'GObject-2.0', 'Gio-2.0' ],
>     +-=C2=A0 header: 'libsecret/secret.h',
>     +-=C2=A0 extra_args: [ '-D SECRET_COMPILATION'],
>     +-=C2=A0 install: true,
>     +-)
>     ++if with_gir
>     ++=C2=A0 libsecret_gir_sources =3D [
>     ++=C2=A0 =C2=A0 'secret-attributes.c',
>     ++=C2=A0 =C2=A0 'secret-attributes.h',
>     ++=C2=A0 =C2=A0 'secret-backend.c',
>     ++=C2=A0 =C2=A0 'secret-backend.h',
>     ++=C2=A0 =C2=A0 'secret-collection.c',
>     ++=C2=A0 =C2=A0 'secret-collection.h',
>     ++=C2=A0 =C2=A0 'secret-item.c',
>     ++=C2=A0 =C2=A0 'secret-item.h',
>     ++=C2=A0 =C2=A0 'secret-methods.c',
>     ++=C2=A0 =C2=A0 'secret-password.c',
>     ++=C2=A0 =C2=A0 'secret-password.h',
>     ++=C2=A0 =C2=A0 'secret-paths.c',
>     ++=C2=A0 =C2=A0 'secret-paths.h',
>     ++=C2=A0 =C2=A0 'secret-prompt.c',
>     ++=C2=A0 =C2=A0 'secret-prompt.h',
>     ++=C2=A0 =C2=A0 'secret-retrievable.c',
>     ++=C2=A0 =C2=A0 'secret-retrievable.h',
>     ++=C2=A0 =C2=A0 'secret-schema.c',
>     ++=C2=A0 =C2=A0 'secret-schema.h',
>     ++=C2=A0 =C2=A0 'secret-schemas.c',
>     ++=C2=A0 =C2=A0 'secret-schemas.h',
>     ++=C2=A0 =C2=A0 'secret-service.c',
>     ++=C2=A0 =C2=A0 'secret-service.h',
>     ++=C2=A0 =C2=A0 'secret-types.h',
>     ++=C2=A0 =C2=A0 'secret-value.c',
>     ++=C2=A0 =C2=A0 'secret-value.h',
>     ++=C2=A0 ]
>     ++=C2=A0 libsecret_gir_sources +=3D version_h
>     ++=C2=A0 libsecret_gir_sources +=3D _enums_generated
>     ++
>     ++=C2=A0 libsecret_gir =3D gnome.generate_gir(libsecret,
>     ++=C2=A0 =C2=A0 sources: libsecret_gir_sources,
>     ++=C2=A0 =C2=A0 namespace: 'Secret',
>     ++=C2=A0 =C2=A0 nsversion: api_version_major,
>     ++=C2=A0 =C2=A0 export_packages: 'libsecret-@0@'.format(api_version_=
major),
>     ++=C2=A0 =C2=A0 includes: [ 'GObject-2.0', 'Gio-2.0' ],
>     ++=C2=A0 =C2=A0 header: 'libsecret/secret.h',
>     ++=C2=A0 =C2=A0 extra_args: [ '-D SECRET_COMPILATION'],
>     ++=C2=A0 =C2=A0 install: true,
>     ++=C2=A0 )
>     ++endif
>     +
>     + # Vapi
>     +-if with_vapi
>     ++if with_vapi and with_gir
>     +=C2=A0 =C2=A0libsecret_vapi =3D
>     gnome.generate_vapi('libsecret-@0@'.format(api_version_major),
>     +=C2=A0 =C2=A0 =C2=A0sources: libsecret_gir[0],
>     +=C2=A0 =C2=A0 =C2=A0metadata_dirs: meson.source_root() / 'libsecret=
',
>     +diff --git a/meson.build b/meson.build
>     +index a26d046..d22e008 100644
>     +--- a/meson.build
>     ++++ b/meson.build
>     +@@ -22,6 +22,7 @@ with_gcrypt =3D get_option('gcrypt')
>     + enable_debug =3D get_option('debugging')
>     + with_vapi =3D get_option('vapi')
>     + with_gtkdoc =3D get_option('gtk_doc')
>     ++with_gir =3D get_option('introspection')
>     +
>     + # Some variables
>     + config_h_dir =3D include_directories('.')
>     +diff --git a/meson_options.txt b/meson_options.txt
>     +index c1fda5d..445aeb0 100644
>     +--- a/meson_options.txt
>     ++++ b/meson_options.txt
>     +@@ -3,3 +3,4 @@ option('gcrypt', type: 'boolean', value: true,
>     description: 'With gcrypt and tra
>     + option('debugging', type: 'boolean', value: false, description:
>     'Turn debugging on/off')
>     + option('vapi', type: 'boolean', value: true, description:
>     'Create VAPI file.')
>     + option('gtk_doc', type: 'boolean', value: true, description:
>     'Build reference documentation using gtk-doc')
>     ++option('introspection', type: 'boolean', value: true,
>     description: 'Create GIR file.')
>     +--
>     +2.17.1
>     +
>     diff --git a/meta/recipes-gnome/libsecret/libsecret_0.20.3.bb
>     <http://libsecret_0.20.3.bb>
>     b/meta/recipes-gnome/libsecret/libsecret_0.20.3.bb
>     <http://libsecret_0.20.3.bb>
>     index 8d317c8efc..9830c80448 100644
>     --- a/meta/recipes-gnome/libsecret/libsecret_0.20.3.bb
>     <http://libsecret_0.20.3.bb>
>     +++ b/meta/recipes-gnome/libsecret/libsecret_0.20.3.bb
>     <http://libsecret_0.20.3.bb>
>     @@ -13,6 +13,8 @@ inherit gnomebase gtk-doc vala
>     gobject-introspection manpages features_check
>
>     =C2=A0DEPENDS +=3D "glib-2.0 libgcrypt gettext-native"
>
>     +SRC_URI +=3D "file://0001-meson-add-option-introspection.patch"
>     +
>     =C2=A0SRC_URI[archive.md5sum] =3D "47c3fdfeb111a87b509ad271e4a6f496"
>     =C2=A0SRC_URI[archive.sha256sum] =3D
>     "4fcb3c56f8ac4ab9c75b66901fb0104ec7f22aa9a012315a14c0d6dffa5290e4"
>
>     --=20
>     2.17.1
>
>    =20
>

--=20
Kai Kang
Wind River Linux


--------------009CACB2FEA2E5310924B9DC
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 04M1qCmp014840

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-=
8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2020/5/21 =E4=B8=8B=E5=8D=886:07, Ma=
rtin Jansa
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CA+chaQf=3D=3DRCLZSOE_-76sh9qhjavL_v2M=3DzTQfXbug1zmnNFhg@mail=
.gmail.com">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUT=
F-8">
      <div dir=3D"ltr">If it's no longer mandatory, then please remove:
        <div><a
href=3D"https://github.com/openembedded/openembedded-core/commit/08c864061=
86828dce19e101adfd118ed5d9e947e"
            moz-do-not-send=3D"true">https://github.com/openembedded/opene=
mbedded-core/commit/08c86406186828dce19e101adfd118ed5d9e947e</a><br>
        </div>
        <div><br>
        </div>
        <div>together with:</div>
        <div># gobject-introspection is mandatory and cannot be
          configured<br>
          REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"<br>
          UNKNOWN_CONFIGURE_WHITELIST_append =3D " introspection"<br>
        </div>
        <div><br>
        </div>
        <div>and revert</div>
        <div><a
href=3D"https://github.com/openembedded/openembedded-core/commit/cab86a319=
6ef4fcd2714591597f2503aa8138df0"
            moz-do-not-send=3D"true">https://github.com/openembedded/opene=
mbedded-core/commit/cab86a3196ef4fcd2714591597f2503aa8138df0</a><br>
        </div>
        <div>as well</div>
      </div>
    </blockquote>
    <p>I'll check these patches and v2 will be sent.</p>
    <p>Regards,<br>
      Kai</p>
    <p><br>
    </p>
    <blockquote type=3D"cite"
cite=3D"mid:CA+chaQf=3D=3DRCLZSOE_-76sh9qhjavL_v2M=3DzTQfXbug1zmnNFhg@mail=
.gmail.com">
      <div dir=3D"ltr">
        <div><br>
        </div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 21, 2020 at 11:2=
3
          AM kai &lt;<a href=3D"mailto:kai.kang@windriver.com"
            moz-do-not-send=3D"true">kai.kang@windriver.com</a>&gt; wrote:=
<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">F=
rom:
          Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com"
            target=3D"_blank" moz-do-not-send=3D"true">kai.kang@windriver.=
com</a>&gt;<br>
          <br>
          Add meson option introspection for libsecret. For bsp which
          doesn't<br>
          support qemu usermode, it could disable gobject introspection
          build.<br>
          <br>
          Signed-off-by: Kai Kang &lt;<a
            href=3D"mailto:kai.kang@windriver.com" target=3D"_blank"
            moz-do-not-send=3D"true">kai.kang@windriver.com</a>&gt;<br>
          ---<br>
          =C2=A0.../0001-meson-add-option-introspection.patch | 137
          ++++++++++++++++++<br>
          =C2=A0.../libsecret/<a href=3D"http://libsecret_0.20.3.bb"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
libsecret_0.20.3.bb</a>=C2=A0
          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
          =C2=A02 files changed, 139 insertions(+)<br>
          =C2=A0create mode 100644
meta/recipes-gnome/libsecret/files/0001-meson-add-option-introspection.pat=
ch<br>
          <br>
          diff --git
a/meta/recipes-gnome/libsecret/files/0001-meson-add-option-introspection.p=
atch
b/meta/recipes-gnome/libsecret/files/0001-meson-add-option-introspection.p=
atch<br>
          new file mode 100644<br>
          index 0000000000..51ee66f42b<br>
          --- /dev/null<br>
          +++
b/meta/recipes-gnome/libsecret/files/0001-meson-add-option-introspection.p=
atch<br>
          @@ -0,0 +1,137 @@<br>
          +meson: add option introspection<br>
          +<br>
          +Add an option 'introspection' for meson which could control
          whether<br>
          +build GIR files or not.<br>
          +<br>
          +Upstream-Status: Submitted [<a
            href=3D"https://gitlab.gnome.org/GNOME/libsecret/-/merge_reque=
sts/53"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
https://gitlab.gnome.org/GNOME/libsecret/-/merge_requests/53</a>]<br>
          +<br>
          +Signed-off-by: Kai Kang &lt;<a
            href=3D"mailto:kai.kang@windriver.com" target=3D"_blank"
            moz-do-not-send=3D"true">kai.kang@windriver.com</a>&gt;<br>
          +---<br>
          + libsecret/meson.build | 86
          ++++++++++++++++++++++---------------------<br>
          + meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 =
+<br>
          + meson_options.txt=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
          + 3 files changed, 46 insertions(+), 42 deletions(-)<br>
          +<br>
          +diff --git a/libsecret/meson.build b/libsecret/meson.build<br>
          +index 759b5ef..2ee8850 100644<br>
          +--- a/libsecret/meson.build<br>
          ++++ b/libsecret/meson.build<br>
          +@@ -104,50 +104,52 @@ libsecret_dep =3D declare_dependency(<br>
          + )<br>
          + <br>
          + # GObject Introspection<br>
          +-libsecret_gir_sources =3D [<br>
          +-=C2=A0 'secret-attributes.c',<br>
          +-=C2=A0 'secret-attributes.h',<br>
          +-=C2=A0 'secret-backend.c',<br>
          +-=C2=A0 'secret-backend.h',<br>
          +-=C2=A0 'secret-collection.c',<br>
          +-=C2=A0 'secret-collection.h',<br>
          +-=C2=A0 'secret-item.c',<br>
          +-=C2=A0 'secret-item.h',<br>
          +-=C2=A0 'secret-methods.c',<br>
          +-=C2=A0 'secret-password.c',<br>
          +-=C2=A0 'secret-password.h',<br>
          +-=C2=A0 'secret-paths.c',<br>
          +-=C2=A0 'secret-paths.h',<br>
          +-=C2=A0 'secret-prompt.c',<br>
          +-=C2=A0 'secret-prompt.h',<br>
          +-=C2=A0 'secret-retrievable.c',<br>
          +-=C2=A0 'secret-retrievable.h',<br>
          +-=C2=A0 'secret-schema.c',<br>
          +-=C2=A0 'secret-schema.h',<br>
          +-=C2=A0 'secret-schemas.c',<br>
          +-=C2=A0 'secret-schemas.h',<br>
          +-=C2=A0 'secret-service.c',<br>
          +-=C2=A0 'secret-service.h',<br>
          +-=C2=A0 'secret-types.h',<br>
          +-=C2=A0 'secret-value.c',<br>
          +-=C2=A0 'secret-value.h',<br>
          +-]<br>
          +-libsecret_gir_sources +=3D version_h<br>
          +-libsecret_gir_sources +=3D _enums_generated<br>
          +-<br>
          +-libsecret_gir =3D gnome.generate_gir(libsecret,<br>
          +-=C2=A0 sources: libsecret_gir_sources,<br>
          +-=C2=A0 namespace: 'Secret',<br>
          +-=C2=A0 nsversion: api_version_major,<br>
          +-=C2=A0 export_packages:
          'libsecret-@0@'.format(api_version_major),<br>
          +-=C2=A0 includes: [ 'GObject-2.0', 'Gio-2.0' ],<br>
          +-=C2=A0 header: 'libsecret/secret.h',<br>
          +-=C2=A0 extra_args: [ '-D SECRET_COMPILATION'],<br>
          +-=C2=A0 install: true,<br>
          +-)<br>
          ++if with_gir<br>
          ++=C2=A0 libsecret_gir_sources =3D [<br>
          ++=C2=A0 =C2=A0 'secret-attributes.c',<br>
          ++=C2=A0 =C2=A0 'secret-attributes.h',<br>
          ++=C2=A0 =C2=A0 'secret-backend.c',<br>
          ++=C2=A0 =C2=A0 'secret-backend.h',<br>
          ++=C2=A0 =C2=A0 'secret-collection.c',<br>
          ++=C2=A0 =C2=A0 'secret-collection.h',<br>
          ++=C2=A0 =C2=A0 'secret-item.c',<br>
          ++=C2=A0 =C2=A0 'secret-item.h',<br>
          ++=C2=A0 =C2=A0 'secret-methods.c',<br>
          ++=C2=A0 =C2=A0 'secret-password.c',<br>
          ++=C2=A0 =C2=A0 'secret-password.h',<br>
          ++=C2=A0 =C2=A0 'secret-paths.c',<br>
          ++=C2=A0 =C2=A0 'secret-paths.h',<br>
          ++=C2=A0 =C2=A0 'secret-prompt.c',<br>
          ++=C2=A0 =C2=A0 'secret-prompt.h',<br>
          ++=C2=A0 =C2=A0 'secret-retrievable.c',<br>
          ++=C2=A0 =C2=A0 'secret-retrievable.h',<br>
          ++=C2=A0 =C2=A0 'secret-schema.c',<br>
          ++=C2=A0 =C2=A0 'secret-schema.h',<br>
          ++=C2=A0 =C2=A0 'secret-schemas.c',<br>
          ++=C2=A0 =C2=A0 'secret-schemas.h',<br>
          ++=C2=A0 =C2=A0 'secret-service.c',<br>
          ++=C2=A0 =C2=A0 'secret-service.h',<br>
          ++=C2=A0 =C2=A0 'secret-types.h',<br>
          ++=C2=A0 =C2=A0 'secret-value.c',<br>
          ++=C2=A0 =C2=A0 'secret-value.h',<br>
          ++=C2=A0 ]<br>
          ++=C2=A0 libsecret_gir_sources +=3D version_h<br>
          ++=C2=A0 libsecret_gir_sources +=3D _enums_generated<br>
          ++<br>
          ++=C2=A0 libsecret_gir =3D gnome.generate_gir(libsecret,<br>
          ++=C2=A0 =C2=A0 sources: libsecret_gir_sources,<br>
          ++=C2=A0 =C2=A0 namespace: 'Secret',<br>
          ++=C2=A0 =C2=A0 nsversion: api_version_major,<br>
          ++=C2=A0 =C2=A0 export_packages:
          'libsecret-@0@'.format(api_version_major),<br>
          ++=C2=A0 =C2=A0 includes: [ 'GObject-2.0', 'Gio-2.0' ],<br>
          ++=C2=A0 =C2=A0 header: 'libsecret/secret.h',<br>
          ++=C2=A0 =C2=A0 extra_args: [ '-D SECRET_COMPILATION'],<br>
          ++=C2=A0 =C2=A0 install: true,<br>
          ++=C2=A0 )<br>
          ++endif<br>
          + <br>
          + # Vapi<br>
          +-if with_vapi<br>
          ++if with_vapi and with_gir<br>
          +=C2=A0 =C2=A0libsecret_vapi =3D
          gnome.generate_vapi('libsecret-@0@'.format(api_version_major),<b=
r>
          +=C2=A0 =C2=A0 =C2=A0sources: libsecret_gir[0],<br>
          +=C2=A0 =C2=A0 =C2=A0metadata_dirs: meson.source_root() / 'libse=
cret',<br>
          +diff --git a/meson.build b/meson.build<br>
          +index a26d046..d22e008 100644<br>
          +--- a/meson.build<br>
          ++++ b/meson.build<br>
          +@@ -22,6 +22,7 @@ with_gcrypt =3D get_option('gcrypt')<br>
          + enable_debug =3D get_option('debugging')<br>
          + with_vapi =3D get_option('vapi')<br>
          + with_gtkdoc =3D get_option('gtk_doc')<br>
          ++with_gir =3D get_option('introspection')<br>
          + <br>
          + # Some variables<br>
          + config_h_dir =3D include_directories('.')<br>
          +diff --git a/meson_options.txt b/meson_options.txt<br>
          +index c1fda5d..445aeb0 100644<br>
          +--- a/meson_options.txt<br>
          ++++ b/meson_options.txt<br>
          +@@ -3,3 +3,4 @@ option('gcrypt', type: 'boolean', value:
          true, description: 'With gcrypt and tra<br>
          + option('debugging', type: 'boolean', value: false,
          description: 'Turn debugging on/off')<br>
          + option('vapi', type: 'boolean', value: true, description:
          'Create VAPI file.')<br>
          + option('gtk_doc', type: 'boolean', value: true, description:
          'Build reference documentation using gtk-doc')<br>
          ++option('introspection', type: 'boolean', value: true,
          description: 'Create GIR file.')<br>
          +-- <br>
          +2.17.1<br>
          +<br>
          diff --git a/meta/recipes-gnome/libsecret/<a
            href=3D"http://libsecret_0.20.3.bb" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">libsecret_0.20.3.bb=
</a>
          b/meta/recipes-gnome/libsecret/<a
            href=3D"http://libsecret_0.20.3.bb" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">libsecret_0.20.3.bb=
</a><br>
          index 8d317c8efc..9830c80448 100644<br>
          --- a/meta/recipes-gnome/libsecret/<a
            href=3D"http://libsecret_0.20.3.bb" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">libsecret_0.20.3.bb=
</a><br>
          +++ b/meta/recipes-gnome/libsecret/<a
            href=3D"http://libsecret_0.20.3.bb" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">libsecret_0.20.3.bb=
</a><br>
          @@ -13,6 +13,8 @@ inherit gnomebase gtk-doc vala
          gobject-introspection manpages features_check<br>
          <br>
          =C2=A0DEPENDS +=3D "glib-2.0 libgcrypt gettext-native"<br>
          <br>
          +SRC_URI +=3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://=
0001-meson-add-option-introspection.patch">"file://0001-meson-add-option-in=
trospection.patch"</a><br>
          +<br>
          =C2=A0SRC_URI[archive.md5sum] =3D "47c3fdfeb111a87b509ad271e4a6f=
496"<br>
          =C2=A0SRC_URI[archive.sha256sum] =3D
          "4fcb3c56f8ac4ab9c75b66901fb0104ec7f22aa9a012315a14c0d6dffa5290e=
4"<br>
          <br>
          -- <br>
          2.17.1<br>
          <br>
          <br>
        </blockquote>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------009CACB2FEA2E5310924B9DC--
