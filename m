Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D72C61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 11:31:46 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.6537.1677065496536304865
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 03:31:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout08.t-online.de (Postfix) with SMTP id A64841C80B;
	Wed, 22 Feb 2023 12:31:33 +0100 (CET)
Received: from [192.168.178.83] ([79.219.232.91]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pUnLQ-3QB9jE0; Wed, 22 Feb 2023 12:31:32 +0100
Date: Wed, 22 Feb 2023 12:31:26 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] vte: update 0.70.2 -> 0.70.3
To: alexandre.belloni@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Message-Id: <E0CHQR.1QEIEEWRAOEA1@t-online.de>
In-Reply-To: <Y/X3vQAjD2tR/HVs@mail.local>
References: <20230221185231.454421-1-f_l_k@t-online.de>
	<Y/X3vQAjD2tR/HVs@mail.local>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-guZzMI0YycrNFbT1PDS7"
X-TOI-EXPURGATEID: 150726::1677065492-B934BDFF-3A3BC6C9/0/0 CLEAN NORMAL
X-TOI-MSGID: f0d82eb5-f977-4f65-abba-2973978ce2f9
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 11:31:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177566

--=-guZzMI0YycrNFbT1PDS7
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

What would be the preferred way to fix it?

I'd prefer the more progressive way and add BBCLASSEXTEND +=3D"nativesdk"=20
to gtk.bb
But this would also add the need to build libxkbcommon and=20
xkeyboard-config for nativesdk

vte recipe already has a PACKAGECONFIG:remove line, so i guess it will=20
be less invasive to additionally add:
PACKAGECONFIG:remove:class-nativesdk =3D "gtk4"

Am Mi, 22. Feb 2023 um 12:08:45 +0100 schrieb Alexandre Belloni via=20
lists.openembedded.org=20
<alexandre.belloni=3Dbootlin.com@lists.openembedded.org>:
> Hello,
>=20
> This causes:
>=20
> stdio: WARNING: Nothing PROVIDES 'nativesdk-gtk4' (but=20
> virtual:nativesdk:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-=
support/vte/vte_0.70.3.bb=20
> DEPENDS on or otherwise requires it). Close matches:
> stdio: WARNING: Nothing RPROVIDES 'nativesdk-vte' (but=20
> virtual:nativesdk:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-=
support/vte/vte_0.70.3.bb=20
> RDEPENDS on or otherwise requires it)
> stdio: WARNING: Nothing RPROVIDES 'nativesdk-vte-dev' (but=20
> virtual:nativesdk:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-=
support/vte/vte_0.70.3.bb=20
> RDEPENDS on or otherwise requires it)
>=20
> On 21/02/2023 19:52:31+0100, Markus Volk wrote:
>>  - Allow to build the gtk4 widget and vapi
>>    This is needed to build gtk4 based terminals like blackbox
>>  - Update dependencies
>>  - Cleanup recipe and remove unneeded patch
>>=20
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   ...EXITCODE-macro-for-non-glibc-systems.patch | 42=20
>> -------------------
>>   .../vte/{vte_0.70.2.bb =3D> vte_0.70.3.bb}      | 22 +++++-----
>>   2 files changed, 10 insertions(+), 54 deletions(-)
>>   delete mode 100644=20
>> meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-sys=
tems.patch
>>   rename meta/recipes-support/vte/{vte_0.70.2.bb =3D> vte_0.70.3.bb}=20
>> (69%)
>>=20
>>  diff --git=20
>> a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-s=
ystems.patch=20
>> b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-s=
ystems.patch
>>  deleted file mode 100644
>>  index b4100fc381..0000000000
>>  ---=20
>> a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-s=
ystems.patch
>>  +++ /dev/null
>>  @@ -1,42 +0,0 @@
>>  -From de9639baac792327c701e509258b8a13f6959e82 Mon Sep 17 00:00:00=20
>> 2001
>>  -From: Danilo Spinella <danyspin97@protonmail.com=20
>> <mailto:danyspin97@protonmail.com>>
>>  -Date: Thu, 21 Mar 2019 14:19:26 +0100
>>  -Subject: [PATCH] Add W_EXITCODE macro for non-glibc systems
>>  -MIME-Version: 1.0
>>  -Content-Type: text/plain; charset=3DUTF-8
>>  -Content-Transfer-Encoding: 8bit
>>  -
>>  -Upstream-Status: Submitted [1]
>>  -
>>  -Signed-off-by: Andreas M=FCller <schnitzeltony@gmail.com=20
>> <mailto:schnitzeltony@gmail.com>>
>>  -
>>  -[1] <https://gitlab.gnome.org/GNOME/vte/issues/72>
>>  -
>>  ----
>>  - src/missing.hh | 4 ++++
>>  - src/widget.cc  | 1 +
>>  - 2 files changed, 5 insertions(+)
>>  -
>>  ---- a/src/missing.hh
>>  -+++ b/src/missing.hh
>>  -@@ -24,6 +24,10 @@
>>  - #define NSIG (8 * sizeof(sigset_t))
>>  - #endif
>>  -
>>  -+#ifndef W_EXITCODE
>>  -+#define W_EXITCODE(ret, sig) ((ret) << 8 | (sig))
>>  -+#endif
>>  -+
>>  - #ifndef HAVE_FDWALK
>>  - int fdwalk(int (*cb)(void* data, int fd),
>>  -            void* data);
>>  ---- a/src/widget.cc
>>  -+++ b/src/widget.cc
>>  -@@ -21,6 +21,7 @@
>>  - #include "widget.hh"
>>  -
>>  - #include <sys/wait.h> // for W_EXITCODE
>>  -+#include "missing.hh" // for W_EXITCODE on non-glibc systems
>>  -
>>  - #include <exception>
>>  - #include <new>
>>  diff --git a/meta/recipes-support/vte/vte_0.70.2.bb=20
>> b/meta/recipes-support/vte/vte_0.70.3.bb
>>  similarity index 69%
>>  rename from meta/recipes-support/vte/vte_0.70.2.bb
>>  rename to meta/recipes-support/vte/vte_0.70.3.bb
>>  index ec2fb1f522..a39598216b 100644
>>  --- a/meta/recipes-support/vte/vte_0.70.2.bb
>>  +++ b/meta/recipes-support/vte/vte_0.70.3.bb
>>  @@ -11,30 +11,28 @@ LIC_FILES_CHKSUM =3D " \
>>       file://COPYING.XTERM;md5=3Dd7fc3a23c16c039afafe2e042030f057=20
>> <file://copying.xterm;md5=3Dd7fc3a23c16c039afafe2e042030f057/> \
>>   "
>>=20
>>  -DEPENDS =3D "glib-2.0 gtk+3 libpcre2 libxml2-native gperf-native icu"
>>  +DEPENDS =3D "fribidi glib-2.0 gtk+3 libpcre2 libxml2-native=20
>> gperf-native icu pango zlib"
>>=20
>>   GNOMEBASEBUILDCLASS =3D "meson"
>>   GIR_MESON_OPTION =3D 'gir'
>>   GIDOCGEN_MESON_OPTION =3D "docs"
>>=20
>>  -inherit gnomebase gi-docgen features_check=20
>> upstream-version-is-even gobject-introspection
>>  +inherit gnomebase gi-docgen features_check=20
>> upstream-version-is-even gobject-introspection vala
>>=20
>>  -# vapigen.m4 is required when vala is not present (but the one=20
>> from vala should be used normally)
>>  -SRC_URI +=3D=20
>> "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"=20
>> <file://0001-add-w_exitcode-macro-for-non-glibc-systems.patch/>
>>  -SRC_URI[archive.sha256sum] =3D=20
>> "4d15b4380de3f564d57eabd006389c407c705df5b0c70030fdcc24971a334d80"
>>  +SRC_URI[archive.sha256sum] =3D=20
>> "9457134a02f3157fca04f7e0d39bdb0f3099be0a3ce82b7139d0c98a80748f23"
>>=20
>>   ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>>=20
>>  -# Help g-ir-scanner find the .so for linking
>>  -do_compile:prepend() {
>>  -    export GIR_EXTRA_LIBS_PATH=3D"${B}/src/.libs"
>>  -}
>>  -
>>   # Package additional files
>>   FILES:${PN}-dev +=3D "${datadir}/vala/vapi/*"
>>=20
>>  -PACKAGECONFIG ??=3D "gnutls"
>>  -PACKAGECONFIG[vala] =3D "-Dvapi=3Dtrue,-Dvapi=3Dfalse,vala-native vala=
"
>>  +PACKAGECONFIG ??=3D " \
>>  +    gnutls \
>>  +    ${@bb.utils.contains=20
>> <mailto:${@bb.utils.contains>('DISTRO_FEATURES',=20
>> 'gobject-introspection-data', 'vala', '', d)} \
>>  +    ${@bb.utils.contains=20
>> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'opengl', 'gtk4',=20
>> '', d)} \
>>  +"
>>  +PACKAGECONFIG[gtk4] =3D "-Dgtk4=3Dtrue,-Dgtk4=3Dfalse,gtk4"
>>  +PACKAGECONFIG[vala] =3D "-Dvapi=3Dtrue,-Dvapi=3Dfalse"
>>   PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Dtrue,-Dgnutls=3Dfalse,gnutls"
>>   PACKAGECONFIG[systemd] =3D "-D_systemd=3Dtrue,-D_systemd=3Dfalse,syste=
md"
>>   # vala requires gir
>>  --
>>  2.34.1
>>=20
>=20
>>=20
>>=20
>>=20
>=20
>=20
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com <https://bootlin.com/>
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177564):=20
> <https://lists.openembedded.org/g/openembedded-core/message/177564>
> Mute This Topic: <https://lists.openembedded.org/mt/97115916/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org=20
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-core/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-guZzMI0YycrNFbT1PDS7
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>What would be the preferred way to=
 fix it?</div><div><br></div><div>I'd prefer the more progressive way and a=
dd BBCLASSEXTEND +=3D"nativesdk" to gtk.bb</div><div>But this would also ad=
d the need to build libxkbcommon and xkeyboard-config for nativesdk</div><d=
iv><br></div><div>vte recipe already has a PACKAGECONFIG:remove line, so i =
guess it will be less invasive to additionally add:</div><div>PACKAGECONFIG=
:remove:class-nativesdk =3D "gtk4"</div></div><div id=3D"geary-quote" dir=
=3D"auto"><br>Am Mi, 22. Feb 2023 um 12:08:45 +0100 schrieb Alexandre Bello=
ni via lists.openembedded.org &lt;alexandre.belloni=3Dbootlin.com@lists.ope=
nembedded.org&gt;:<br><blockquote type=3D"cite"><div class=3D"plaintext" st=
yle=3D"white-space: break-spaces;">Hello,

This causes:

stdio: WARNING: Nothing PROVIDES 'nativesdk-gtk4' (but virtual:nativesdk:/h=
ome/pokybuild/yocto-worker/a-full/build/meta/recipes-support/vte/vte_0.70.3=
.bb DEPENDS on or otherwise requires it). Close matches:
stdio: WARNING: Nothing RPROVIDES 'nativesdk-vte' (but virtual:nativesdk:/h=
ome/pokybuild/yocto-worker/a-full/build/meta/recipes-support/vte/vte_0.70.3=
.bb RDEPENDS on or otherwise requires it)
stdio: WARNING: Nothing RPROVIDES 'nativesdk-vte-dev' (but virtual:nativesd=
k:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-support/vte/vte_0.=
70.3.bb RDEPENDS on or otherwise requires it)

On 21/02/2023 19:52:31+0100, Markus Volk wrote:
<blockquote> - Allow to build the gtk4 widget and vapi
   This is needed to build gtk4 based terminals like blackbox
 - Update dependencies
 - Cleanup recipe and remove unneeded patch
=20
 Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
 ---
  ...EXITCODE-macro-for-non-glibc-systems.patch | 42 -------------------
  .../vte/{vte_0.70.2.bb =3D&gt; vte_0.70.3.bb}      | 22 +++++-----
  2 files changed, 10 insertions(+), 54 deletions(-)
  delete mode 100644 meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro=
-for-non-glibc-systems.patch
  rename meta/recipes-support/vte/{vte_0.70.2.bb =3D&gt; vte_0.70.3.bb} (69=
%)
=20
 diff --git a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-no=
n-glibc-systems.patch b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-ma=
cro-for-non-glibc-systems.patch
 deleted file mode 100644
 index b4100fc381..0000000000
 --- a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc=
-systems.patch
 +++ /dev/null
 @@ -1,42 +0,0 @@
 -From de9639baac792327c701e509258b8a13f6959e82 Mon Sep 17 00:00:00 2001
 -From: Danilo Spinella &lt;<a href=3D"mailto:danyspin97@protonmail.com">da=
nyspin97@protonmail.com</a>&gt;
 -Date: Thu, 21 Mar 2019 14:19:26 +0100
 -Subject: [PATCH] Add W_EXITCODE macro for non-glibc systems
 -MIME-Version: 1.0
 -Content-Type: text/plain; charset=3DUTF-8
 -Content-Transfer-Encoding: 8bit
 -
 -Upstream-Status: Submitted [1]
 -
 -Signed-off-by: Andreas M=FCller &lt;<a href=3D"mailto:schnitzeltony@gmail=
.com">schnitzeltony@gmail.com</a>&gt;
 -
 -[1] <a href=3D"https://gitlab.gnome.org/GNOME/vte/issues/72">https://gitl=
ab.gnome.org/GNOME/vte/issues/72</a>
 -
 ----
 - src/missing.hh | 4 ++++
 - src/widget.cc  | 1 +
 - 2 files changed, 5 insertions(+)
 -
 ---- a/src/missing.hh
 -+++ b/src/missing.hh
 -@@ -24,6 +24,10 @@
 - #define NSIG (8 * sizeof(sigset_t))
 - #endif
 -=20
 -+#ifndef W_EXITCODE
 -+#define W_EXITCODE(ret, sig) ((ret) &lt;&lt; 8 | (sig))
 -+#endif
 -+
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
 -=20
 - #include &lt;exception&gt;
 - #include &lt;new&gt;
 diff --git a/meta/recipes-support/vte/vte_0.70.2.bb b/meta/recipes-support=
/vte/vte_0.70.3.bb
 similarity index 69%
 rename from meta/recipes-support/vte/vte_0.70.2.bb
 rename to meta/recipes-support/vte/vte_0.70.3.bb
 index ec2fb1f522..a39598216b 100644
 --- a/meta/recipes-support/vte/vte_0.70.2.bb
 +++ b/meta/recipes-support/vte/vte_0.70.3.bb
 @@ -11,30 +11,28 @@ LIC_FILES_CHKSUM =3D " \
      <a href=3D"file://COPYING.XTERM;md5=3Dd7fc3a23c16c039afafe2e042030f05=
7">file://COPYING.XTERM;md5=3Dd7fc3a23c16c039afafe2e042030f057</a> \
  "
 =20
 -DEPENDS =3D "glib-2.0 gtk+3 libpcre2 libxml2-native gperf-native icu"
 +DEPENDS =3D "fribidi glib-2.0 gtk+3 libpcre2 libxml2-native gperf-native =
icu pango zlib"
 =20
  GNOMEBASEBUILDCLASS =3D "meson"
  GIR_MESON_OPTION =3D 'gir'
  GIDOCGEN_MESON_OPTION =3D "docs"
 =20
 -inherit gnomebase gi-docgen features_check upstream-version-is-even gobje=
ct-introspection
 +inherit gnomebase gi-docgen features_check upstream-version-is-even gobje=
ct-introspection vala
 =20
 -# vapigen.m4 is required when vala is not present (but the one from vala =
should be used normally)
 -SRC_URI +=3D "<a href=3D"file://0001-Add-W_EXITCODE-macro-for-non-glibc-s=
ystems.patch" "=3D"">file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems=
.patch"</a>
 -SRC_URI[archive.sha256sum] =3D "4d15b4380de3f564d57eabd006389c407c705df5b=
0c70030fdcc24971a334d80"
 +SRC_URI[archive.sha256sum] =3D "9457134a02f3157fca04f7e0d39bdb0f3099be0a3=
ce82b7139d0c98a80748f23"
 =20
  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 =20
 -# Help g-ir-scanner find the .so for linking
 -do_compile:prepend() {
 -    export GIR_EXTRA_LIBS_PATH=3D"${B}/src/.libs"
 -}
 -
  # Package additional files
  FILES:${PN}-dev +=3D "${datadir}/vala/vapi/*"
 =20
 -PACKAGECONFIG ??=3D "gnutls"
 -PACKAGECONFIG[vala] =3D "-Dvapi=3Dtrue,-Dvapi=3Dfalse,vala-native vala"
 +PACKAGECONFIG ??=3D " \
 +    gnutls \
 +    <a href=3D"mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DIS=
TRO_FEATURES', 'gobject-introspection-data', 'vala', '', d)} \
 +    <a href=3D"mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DIS=
TRO_FEATURES', 'opengl', 'gtk4', '', d)} \
 +"
 +PACKAGECONFIG[gtk4] =3D "-Dgtk4=3Dtrue,-Dgtk4=3Dfalse,gtk4"
 +PACKAGECONFIG[vala] =3D "-Dvapi=3Dtrue,-Dvapi=3Dfalse"
  PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Dtrue,-Dgnutls=3Dfalse,gnutls"
  PACKAGECONFIG[systemd] =3D "-D_systemd=3Dtrue,-D_systemd=3Dfalse,systemd"
  # vala requires gir
 --=20
 2.34.1
=20
</blockquote>
<blockquote>=20
=20
=20
</blockquote>

<div>--=20
</div>Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
<a href=3D"https://bootlin.com">https://bootlin.com</a>
</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#177564): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/177564">https://lists.openembedded.org/g/openembedd=
ed-core/message/177564</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97115916/3618=
223">https://lists.openembedded.org/mt/97115916/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a hre=
f=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-guZzMI0YycrNFbT1PDS7--


