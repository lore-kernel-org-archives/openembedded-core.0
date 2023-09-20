Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48A4CE79AB
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 09:09:04 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.33220.1695200937789527795
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 02:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout01.t-online.de (Postfix) with SMTP id 4EA2D2F7A1;
	Wed, 20 Sep 2023 11:08:55 +0200 (CEST)
Received: from [192.168.178.62] ([84.163.37.179]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qitCY-0RyJSS0; Wed, 20 Sep 2023 11:08:54 +0200
Date: Wed, 20 Sep 2023 11:08:56 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv3] vte: upgrade 2.72.2 -> 2.74.0
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Message-Id: <WE1A1S.DXWRML62SJAB@t-online.de>
In-Reply-To: <17868FF621F1F057.29111@lists.openembedded.org>
References: <17868FF621F1F057.29111@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-gnXBouQZ/6ue1+m4JiC+"
X-TOI-EXPURGATEID: 150726::1695200934-650B27A2-3BD0120F/0/0 CLEAN NORMAL
X-TOI-MSGID: be454c11-5af4-4a98-9d25-ae81e6cf2707
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 09:09:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187902

--=-gnXBouQZ/6ue1+m4JiC+
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

v3 adds xkeyboard-config, libxkbcommon and gtk4 to the nativesdk build

I have verified that nativesdk-gtk4 can be built with pure oe-core and=20
also with my environment, that includes libclc and spirv-tools to the=20
mesa build

On Wed, Sep 20 2023 at 11:03:10 AM +02:00:00, Markus Volk=20
<f_l_k@t-online.de> wrote:
> Rework recipe
>=20
> - remove legacy of the autotools buildsystem
> - build	vapi dependent on gi-data
> - docs require gir, add	a EXTRA_OEMESON:append to avoid	fail in
>   a combination	where docs=3Dtrue	and gir=3Dfalse
> - gtk+3 and gtk4 are requested by default-> add gtk4 dependency
> - allow to build gtk4-nativesdk
> - install systemd support files	depending on DISTRO_FEATURE
> - update 0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> ---
>  meta/recipes-gnome/gtk+/gtk4_4.12.1.bb        |  2 +-
>  .../xorg-lib/libxkbcommon_1.5.0.bb            |  2 +-
>  .../xorg-lib/xkeyboard-config_2.39.bb         |  2 +-
>  ...EXITCODE-macro-for-non-glibc-systems.patch | 35=20
> ++++++++-----------
>  .../vte/{vte_0.72.2.bb =3D> vte_0.74.0.bb}      | 24 ++++---------
>  5 files changed, 24 insertions(+), 41 deletions(-)
>  rename meta/recipes-support/vte/{vte_0.72.2.bb =3D> vte_0.74.0.bb}=20
> (64%)
>=20
> diff --git a/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb=20
> b/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb
> index aa7115b11e..29adee4adf 100644
> --- a/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb
> +++ b/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb
> @@ -47,7 +47,7 @@ inherit meson gettext pkgconfig gi-docgen=20
> update-alternatives gsettings features
>  # gobject-introspection.bbclass pins introspection off for nativesk.=20
> As long as
>  # we do not remove this wisdom or hack gtk4, it is not possible to=20
> build
>  # nativesdk-gtk4
> -BBCLASSEXTEND =3D "native"
> +BBCLASSEXTEND =3D "native nativesdk"
>=20
>  GSETTINGS_PACKAGE:class-native =3D ""
>=20
> diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb=20
> b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb
> index 62e9b158e4..09da677de4 100644
> --- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb
> +++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb
> @@ -35,6 +35,6 @@ python populate_packages:prepend () {
>  # xkbcommon: ERROR: couldn't find a Compose file for locale "C"
>  RDEPENDS:${PN} =3D "${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'x11',=20
> 'libx11-locale', 'libx11-compose-data', d)}"
>=20
> -BBCLASSEXTEND +=3D "native"
> +BBCLASSEXTEND +=3D "native nativesdk"
>=20
>  CVE_PRODUCT +=3D "xkbcommon:libxkbcommon"
> diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb=20
> b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb
> index 4795464ac0..8a87d49399 100644
> --- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb
> +++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb
> @@ -29,4 +29,4 @@ do_install:append () {
>      cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
>  }
>=20
> -BBCLASSEXTEND +=3D "native"
> +BBCLASSEXTEND +=3D "native nativesdk"
> diff --git=20
> a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-sy=
stems.patch=20
> b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-sy=
stems.patch
> index b4100fc381..8934d5f80a 100644
> ---=20
> a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-sy=
stems.patch
> +++=20
> b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-sy=
stems.patch
> @@ -11,32 +11,25 @@ Upstream-Status: Submitted [1]
>  Signed-off-by: Andreas M=FCller <schnitzeltony@gmail.com=20
> <mailto:schnitzeltony@gmail.com>>
>=20
>  [1] <https://gitlab.gnome.org/GNOME/vte/issues/72>
> -
>  ---
> - src/missing.hh | 4 ++++
> - src/widget.cc  | 1 +
> - 2 files changed, 5 insertions(+)
> + src/widget.cc  | 4 +++
> + 1 files changed, 4 insertions(+)
>=20
> ---- a/src/missing.hh
> -+++ b/src/missing.hh
> -@@ -24,6 +24,10 @@
> - #define NSIG (8 * sizeof(sigset_t))
> - #endif
> +diff --git a/src/widget.cc b/src/widget.cc
> +index 07f7cabf..31a77f68 100644
> +--- a/src/widget.cc
> ++++ b/src/widget.cc
> +@@ -16,6 +16,10 @@
> +  * along with this library.  If not, see=20
> <<https://www.gnu.org/licenses/>>.
> +  */
>=20
>  +#ifndef W_EXITCODE
>  +#define W_EXITCODE(ret, sig) ((ret) << 8 | (sig))
>  +#endif
>  +
> - #ifndef HAVE_FDWALK
> - int fdwalk(int (*cb)(void* data, int fd),
> -            void* data);
> ---- a/src/widget.cc
> -+++ b/src/widget.cc
> -@@ -21,6 +21,7 @@
> - #include "widget.hh"
> -
> - #include <sys/wait.h> // for W_EXITCODE
> -+#include "missing.hh" // for W_EXITCODE on non-glibc systems
> + #include "config.h"
>=20
> - #include <exception>
> - #include <new>
> + #include "widget.hh"
> +--
> +2.42.0
> +
> diff --git a/meta/recipes-support/vte/vte_0.72.2.bb=20
> b/meta/recipes-support/vte/vte_0.74.0.bb
> similarity index 64%
> rename from meta/recipes-support/vte/vte_0.72.2.bb
> rename to meta/recipes-support/vte/vte_0.74.0.bb
> index 4249b75ac0..74574d3684 100644
> --- a/meta/recipes-support/vte/vte_0.72.2.bb
> +++ b/meta/recipes-support/vte/vte_0.74.0.bb
> @@ -11,38 +11,28 @@ LIC_FILES_CHKSUM =3D " \
>      file://COPYING.XTERM;md5=3Dd7fc3a23c16c039afafe2e042030f057=20
> <file://copying.xterm;md5=3Dd7fc3a23c16c039afafe2e042030f057/> \
>  "
>=20
> -DEPENDS =3D "glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native=20
> gperf-native icu"
> +DEPENDS =3D "glib-2.0 glib-2.0-native gtk+3 gtk4 libpcre2=20
> libxml2-native gperf-native icu"
>=20
>  GNOMEBASEBUILDCLASS =3D "meson"
>  GIR_MESON_OPTION =3D 'gir'
>  GIDOCGEN_MESON_OPTION =3D "docs"
>=20
> -inherit gnomebase gi-docgen features_check upstream-version-is-even=20
> gobject-introspection
> +inherit gnomebase gi-docgen features_check upstream-version-is-even=20
> gobject-introspection vala
>=20
> -# vapigen.m4 is required when vala is not present (but the one from=20
> vala should be used normally)
>  SRC_URI +=3D=20
> "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"=20
> <file://0001-add-w_exitcode-macro-for-non-glibc-systems.patch/>
> -SRC_URI[archive.sha256sum] =3D=20
> "f7966fd185a6981f53964162b71cfef7e606495155d6f5827b72aa0dd6741c9e"
> +SRC_URI[archive.sha256sum] =3D=20
> "9ae08f777952ba793221152d360550451580f42d3b570e3341ebb6841984c76b"
>=20
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>=20
> -# Help g-ir-scanner find the .so for linking
> -do_compile:prepend() {
> -    export GIR_EXTRA_LIBS_PATH=3D"${B}/src/.libs"
> -}
> +EXTRA_OEMESON +=3D "${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('GI_DATA_ENABLED', 'True',=20
> '-Dvapi=3Dtrue', '-Dvapi=3Dfalse', d)}"
> +EXTRA_OEMESON:append =3D " ${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('GI_DATA_ENABLED', 'False',=20
> '-Ddocs=3Dfalse', '', d)}"
>=20
> -# Package additional files
> -FILES:${PN}-dev +=3D "${datadir}/vala/vapi/*"
> -
> -PACKAGECONFIG ??=3D "gnutls"
> -PACKAGECONFIG[vala] =3D "-Dvapi=3Dtrue,-Dvapi=3Dfalse,vala-native vala"
> +PACKAGECONFIG ??=3D "gnutls ${@bb.utils.filter=20
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'systemd', d)}"
>  PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Dtrue,-Dgnutls=3Dfalse,gnutls"
>  PACKAGECONFIG[systemd] =3D "-D_systemd=3Dtrue,-D_systemd=3Dfalse,systemd=
"
> -# vala requires gir
> -PACKAGECONFIG:remove:class-native =3D "vala"
> -
> -CFLAGS +=3D "-D_GNU_SOURCE"
>=20
>  PACKAGES =3D+ "libvte ${PN}-prompt"
> +FILES:${PN} +=3D"${systemd_user_unitdir}"
>  FILES:libvte =3D "${libdir}/*.so.* ${libdir}/girepository-1.0/*"
>  FILES:${PN}-prompt =3D " \
>      ${sysconfdir}/profile.d \
> --
> 2.42.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187899):=20
> <https://lists.openembedded.org/g/openembedded-core/message/187899>
> Mute This Topic: <https://lists.openembedded.org/mt/101474702/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org=20
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-core/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-gnXBouQZ/6ue1+m4JiC+
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>v3 adds xkeyboard-config, libxkbco=
mmon and gtk4 to the nativesdk build</div><div><br></div><div>I have verifi=
ed that nativesdk-gtk4 can be built with pure oe-core and also with my envi=
ronment, that includes libclc and spirv-tools to the mesa build</div></div>=
<div id=3D"geary-quote" dir=3D"auto"><br>On Wed, Sep 20 2023 at 11:03:10 AM=
 +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote typ=
e=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spaces;">Re=
work recipe

- remove legacy of the autotools buildsystem
- build	vapi dependent on gi-data
- docs require gir, add	a EXTRA_OEMESON:append to avoid	fail in
  a combination	where docs=3Dtrue	and gir=3Dfalse
- gtk+3 and gtk4 are requested by default-&gt; add gtk4 dependency
- allow to build gtk4-nativesdk
- install systemd support files	depending on DISTRO_FEATURE
- update 0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t=
-online.de</a>&gt;
---
 meta/recipes-gnome/gtk+/gtk4_4.12.1.bb        |  2 +-
 .../xorg-lib/libxkbcommon_1.5.0.bb            |  2 +-
 .../xorg-lib/xkeyboard-config_2.39.bb         |  2 +-
 ...EXITCODE-macro-for-non-glibc-systems.patch | 35 ++++++++-----------
 .../vte/{vte_0.72.2.bb =3D&gt; vte_0.74.0.bb}      | 24 ++++---------
 5 files changed, 24 insertions(+), 41 deletions(-)
 rename meta/recipes-support/vte/{vte_0.72.2.bb =3D&gt; vte_0.74.0.bb} (64%=
)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb b/meta/recipes-gnome/gt=
k+/gtk4_4.12.1.bb
index aa7115b11e..29adee4adf 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb
@@ -47,7 +47,7 @@ inherit meson gettext pkgconfig gi-docgen update-alternat=
ives gsettings features
 # gobject-introspection.bbclass pins introspection off for nativesk. As lo=
ng as
 # we do not remove this wisdom or hack gtk4, it is not possible to build
 # nativesdk-gtk4
-BBCLASSEXTEND =3D "native"
+BBCLASSEXTEND =3D "native nativesdk"
=20
 GSETTINGS_PACKAGE:class-native =3D ""
=20
diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb b/meta/re=
cipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb
index 62e9b158e4..09da677de4 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb
@@ -35,6 +35,6 @@ python populate_packages:prepend () {
 # xkbcommon: ERROR: couldn't find a Compose file for locale "C"
 RDEPENDS:${PN} =3D "<a href=3D"mailto:${@bb.utils.contains">${@bb.utils.co=
ntains</a>('DISTRO_FEATURES', 'x11', 'libx11-locale', 'libx11-compose-data'=
, d)}"
=20
-BBCLASSEXTEND +=3D "native"
+BBCLASSEXTEND +=3D "native nativesdk"
=20
 CVE_PRODUCT +=3D "xkbcommon:libxkbcommon"
diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb b/meta=
/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb
index 4795464ac0..8a87d49399 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb
@@ -29,4 +29,4 @@ do_install:append () {
     cd ${D}${datadir}/X11/xkb/rules &amp;&amp; ln -sf base xorg
 }
=20
-BBCLASSEXTEND +=3D "native"
+BBCLASSEXTEND +=3D "native nativesdk"
diff --git a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non=
-glibc-systems.patch b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-mac=
ro-for-non-glibc-systems.patch
index b4100fc381..8934d5f80a 100644
--- a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-=
systems.patch
+++ b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-=
systems.patch
@@ -11,32 +11,25 @@ Upstream-Status: Submitted [1]
 Signed-off-by: Andreas M=FCller &lt;<a href=3D"mailto:schnitzeltony@gmail.=
com">schnitzeltony@gmail.com</a>&gt;
=20
 [1] <a href=3D"https://gitlab.gnome.org/GNOME/vte/issues/72">https://gitla=
b.gnome.org/GNOME/vte/issues/72</a>
-
 ---
- src/missing.hh | 4 ++++
- src/widget.cc  | 1 +
- 2 files changed, 5 insertions(+)
+ src/widget.cc  | 4 +++
+ 1 files changed, 4 insertions(+)
=20
---- a/src/missing.hh
-+++ b/src/missing.hh
-@@ -24,6 +24,10 @@
- #define NSIG (8 * sizeof(sigset_t))
- #endif
+diff --git a/src/widget.cc b/src/widget.cc
+index 07f7cabf..31a77f68 100644
+--- a/src/widget.cc
++++ b/src/widget.cc
+@@ -16,6 +16,10 @@
+  * along with this library.  If not, see &lt;<a href=3D"https://www.gnu.o=
rg/licenses/">https://www.gnu.org/licenses/</a>&gt;.
+  */
 =20
 +#ifndef W_EXITCODE
 +#define W_EXITCODE(ret, sig) ((ret) &lt;&lt; 8 | (sig))
 +#endif
 +
- #ifndef HAVE_FDWALK
- int fdwalk(int (*cb)(void* data, int fd),
-            void* data);
---- a/src/widget.cc
-+++ b/src/widget.cc
-@@ -21,6 +21,7 @@
- #include "widget.hh"
-=20
- #include &lt;sys/wait.h&gt; // for W_EXITCODE
-+#include "missing.hh" // for W_EXITCODE on non-glibc systems
+ #include "config.h"
 =20
- #include &lt;exception&gt;
- #include &lt;new&gt;
+ #include "widget.hh"
+--=20
+2.42.0
+
diff --git a/meta/recipes-support/vte/vte_0.72.2.bb b/meta/recipes-support/=
vte/vte_0.74.0.bb
similarity index 64%
rename from meta/recipes-support/vte/vte_0.72.2.bb
rename to meta/recipes-support/vte/vte_0.74.0.bb
index 4249b75ac0..74574d3684 100644
--- a/meta/recipes-support/vte/vte_0.72.2.bb
+++ b/meta/recipes-support/vte/vte_0.74.0.bb
@@ -11,38 +11,28 @@ LIC_FILES_CHKSUM =3D " \
     <a href=3D"file://COPYING.XTERM;md5=3Dd7fc3a23c16c039afafe2e042030f057=
">file://COPYING.XTERM;md5=3Dd7fc3a23c16c039afafe2e042030f057</a> \
 "
=20
-DEPENDS =3D "glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native gperf-=
native icu"
+DEPENDS =3D "glib-2.0 glib-2.0-native gtk+3 gtk4 libpcre2 libxml2-native g=
perf-native icu"
=20
 GNOMEBASEBUILDCLASS =3D "meson"
 GIR_MESON_OPTION =3D 'gir'
 GIDOCGEN_MESON_OPTION =3D "docs"
=20
-inherit gnomebase gi-docgen features_check upstream-version-is-even gobjec=
t-introspection
+inherit gnomebase gi-docgen features_check upstream-version-is-even gobjec=
t-introspection vala
=20
-# vapigen.m4 is required when vala is not present (but the one from vala s=
hould be used normally)
 SRC_URI +=3D "<a href=3D"file://0001-Add-W_EXITCODE-macro-for-non-glibc-sy=
stems.patch" "=3D"">file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.=
patch"</a>
-SRC_URI[archive.sha256sum] =3D "f7966fd185a6981f53964162b71cfef7e606495155=
d6f5827b72aa0dd6741c9e"
+SRC_URI[archive.sha256sum] =3D "9ae08f777952ba793221152d360550451580f42d3b=
570e3341ebb6841984c76b"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
-# Help g-ir-scanner find the .so for linking
-do_compile:prepend() {
-    export GIR_EXTRA_LIBS_PATH=3D"${B}/src/.libs"
-}
+EXTRA_OEMESON +=3D "<a href=3D"mailto:${@bb.utils.contains">${@bb.utils.co=
ntains</a>('GI_DATA_ENABLED', 'True', '-Dvapi=3Dtrue', '-Dvapi=3Dfalse', d)=
}"
+EXTRA_OEMESON:append =3D " <a href=3D"mailto:${@bb.utils.contains">${@bb.u=
tils.contains</a>('GI_DATA_ENABLED', 'False', '-Ddocs=3Dfalse', '', d)}"
=20
-# Package additional files
-FILES:${PN}-dev +=3D "${datadir}/vala/vapi/*"
-
-PACKAGECONFIG ??=3D "gnutls"
-PACKAGECONFIG[vala] =3D "-Dvapi=3Dtrue,-Dvapi=3Dfalse,vala-native vala"
+PACKAGECONFIG ??=3D "gnutls <a href=3D"mailto:${@bb.utils.filter">${@bb.ut=
ils.filter</a>('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Dtrue,-Dgnutls=3Dfalse,gnutls"
 PACKAGECONFIG[systemd] =3D "-D_systemd=3Dtrue,-D_systemd=3Dfalse,systemd"
-# vala requires gir
-PACKAGECONFIG:remove:class-native =3D "vala"
-
-CFLAGS +=3D "-D_GNU_SOURCE"
=20
 PACKAGES =3D+ "libvte ${PN}-prompt"
+FILES:${PN} +=3D"${systemd_user_unitdir}"
 FILES:libvte =3D "${libdir}/*.so.* ${libdir}/girepository-1.0/*"
 FILES:${PN}-prompt =3D " \
     ${sysconfdir}/profile.d \
<div>--=20
</div>2.42.0

</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#187899): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/187899">https://lists.openembedded.org/g/openembedd=
ed-core/message/187899</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101474702/361=
8223">https://lists.openembedded.org/mt/101474702/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a hre=
f=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-gnXBouQZ/6ue1+m4JiC+--


