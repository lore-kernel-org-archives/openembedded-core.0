Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E3FC61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 20:42:35 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.2427.1678394546324700086
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 12:42:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout10.t-online.de (Postfix) with SMTP id 104DD16D58
	for <openembedded-core@lists.openembedded.org>; Thu,  9 Mar 2023 21:42:23 +0100 (CET)
Received: from [192.168.178.83] ([79.219.229.247]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1paN5d-2ZHzVY0; Thu, 9 Mar 2023 21:42:17 +0100
Date: Thu, 09 Mar 2023 21:42:11 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][RFC][PATCH 6/6] webkitgtk: update 2.38.5 -> 2.39.91
To: openembedded-core@lists.openembedded.org
Message-Id: <BIT9RR.SETAPS7EH7BI1@t-online.de>
In-Reply-To: <20230309203933.834098-6-f_l_k@t-online.de>
References: <20230309203933.834098-1-f_l_k@t-online.de>
	<20230309203933.834098-6-f_l_k@t-online.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-ifLKED47z9idS3ICQ9wO"
X-TOI-EXPURGATEID: 150726::1678394537-BA7FBDB0-DBD9B02A/0/0 CLEAN NORMAL
X-TOI-MSGID: a70df9ca-1f21-4bc3-b982-bb8531194d02
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 20:42:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178270

--=-ifLKED47z9idS3ICQ9wO
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

This will be required changes for the upcoming gnome release

Am Do, 9. M=E4r 2023 um 21:39:33 +0100 schrieb Markus Volk=20
<f_l_k@t-online.de>:
> - added PACKAGECONFIGs for av1 support, gamepad and sandboxing
> - cmake tries to find where bwrap and xdg-dbus-proxy are located on=20
> target and reads the path from
>   ${STAGING_BINDIR_NATIVE}. This breaks reproducibility and runtime.=20
> Fix by adding the needed paths manually.
> - ccache seems to be working well now. Enable by default. It=20
> significantly improves buildtime on rebuilds.
> - webkit 2.39.91 removed WebKitJavascriptResult in favor of using=20
> JSCValue directly in GTK4 API. Some files
>   needed adjustment after that. I've created a patch for it and=20
> marked it pending for now. Still need to find
>   the place where this should be sent to.
> - webkitgtk can be built with both, gtk+3 and gtk4 but it cant be=20
> built with support for both at once.
>   there are still some packages that require the gtk3 variant,=20
> nameably surf, gnome-online-accounts and wxwidgets
>   while ephiphany for example has a hard dependency on webkitgtk=20
> built with gtk4. This is why we need to provide
>   recipes for both variants. If built with gtk+3 webkitgtk provides=20
> the 4.0 api, if built with gtk4 it'll provide the
>   6.0 api. The only conflicting file between those two is the=20
> WebKitWebDriver binary. This was renamed for the gtk3
>   variant so both variants can be installed into the same image.
> - update dependencies
> - wpebackend-fdo: update
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> ---
>  ...spection.cmake-prefix-variables-obta.patch |   0
>  ...ter-remove-of-WebKitJavascriptResult.patch |  53 ++++
>  .../reproducibility.patch                     |   0
>  .../webkit/webkitgtk-4_2.39.91.bb             | 168 ++++++++++
>  ...44e17d258106617b0e6d783d073b188a2548.patch | 296=20
> ------------------
>  ...bb461f040b90453bc4e100dcf967243ecd98.patch |  30 --
>  ...bkitgtk_2.38.5.bb =3D> webkitgtk_2.39.91.bb} |  70 +++--
>  ...fdo_1.14.0.bb =3D> wpebackend-fdo_1.14.1.bb} |   2 +-
>  8 files changed, 258 insertions(+), 361 deletions(-)
>  rename meta/recipes-sato/webkit/{webkitgtk =3D>=20
> files}/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch=20
> (100%)
>  create mode 100644=20
> meta/recipes-sato/webkit/files/0001-fix-after-remove-of-WebKitJavascriptR=
esult.patch
>  rename meta/recipes-sato/webkit/{webkitgtk =3D>=20
> files}/reproducibility.patch (100%)
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk-4_2.39.91.bb
>  delete mode 100644=20
> meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a25=
48.patch
>  delete mode 100644=20
> meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd=
98.patch
>  rename meta/recipes-sato/webkit/{webkitgtk_2.38.5.bb =3D>=20
> webkitgtk_2.39.91.bb} (75%)
>  rename meta/recipes-sato/webkit/{wpebackend-fdo_1.14.0.bb =3D>=20
> wpebackend-fdo_1.14.1.bb} (90%)
>=20
> diff --git=20
> a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-=
prefix-variables-obta.patch=20
> b/meta/recipes-sato/webkit/files/0001-FindGObjectIntrospection.cmake-pref=
ix-variables-obta.patch
> similarity index 100%
> rename from=20
> meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-pr=
efix-variables-obta.patch
> rename to=20
> meta/recipes-sato/webkit/files/0001-FindGObjectIntrospection.cmake-prefix=
-variables-obta.patch
> diff --git=20
> a/meta/recipes-sato/webkit/files/0001-fix-after-remove-of-WebKitJavascrip=
tResult.patch=20
> b/meta/recipes-sato/webkit/files/0001-fix-after-remove-of-WebKitJavascrip=
tResult.patch
> new file mode 100644
> index 0000000000..d22d47c94a
> --- /dev/null
> +++=20
> b/meta/recipes-sato/webkit/files/0001-fix-after-remove-of-WebKitJavascrip=
tResult.patch
> @@ -0,0 +1,53 @@
> +Upstream-Status: Pending
> +
> +--- a/Source/WebKit/UIProcess/API/glib/WebKitWebView.h.in	2023-03-09=20
> 16:12:15.019122873 +0100
> ++++ b/Source/WebKit/UIProcess/API/glib/WebKitWebView.h.in	2023-03-09=20
> 16:14:54.879735391 +0100
> +@@ -36,7 +36,6 @@
> + #include <@API_INCLUDE_PREFIX@/WebKitFormSubmissionRequest.h>
> + #include <@API_INCLUDE_PREFIX@/WebKitHitTestResult.h>
> + #include <@API_INCLUDE_PREFIX@/WebKitInputMethodContext.h>
> +-#include <@API_INCLUDE_PREFIX@/WebKitJavascriptResult.h>
> + #include <@API_INCLUDE_PREFIX@/WebKitNavigationAction.h>
> + #include <@API_INCLUDE_PREFIX@/WebKitNotification.h>
> + #include <@API_INCLUDE_PREFIX@/WebKitOptionMenu.h>
> +@@ -58,6 +57,10 @@
> + #include <@API_INCLUDE_PREFIX@/WebKitNetworkSession.h>
> + #endif
> +
> ++#if !ENABLE(2022_GLIB_API)
> ++#include <@API_INCLUDE_PREFIX@/WebKitJavascriptResult.h>
> ++#endif
> ++
> + #if PLATFORM(GTK)
> + #if !ENABLE(2022_GLIB_API)
> + #include <JavaScriptCore/JSBase.h>
> +---=20
> a/Source/WebKit/UIProcess/API/glib/WebKitAutocleanups.h.in	2023-03-09=20
> 16:24:31.886464831 +0100
> ++++=20
> b/Source/WebKit/UIProcess/API/glib/WebKitAutocleanups.h.in	2023-03-09=20
> 16:25:41.333364986 +0100
> +@@ -47,6 +47,7 @@
> + G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitHitTestResult, g_object_unref)
> + G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitInputMethodContext,=20
> g_object_unref)
> + G_DEFINE_AUTOPTR_CLEANUP_FUNC=20
> (WebKitInstallMissingMediaPluginsPermissionRequest, g_object_unref)
> ++G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitJavascriptResult,=20
> webkit_javascript_result_unref)
> + G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitNavigationPolicyDecision,=20
> g_object_unref)
> + G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitMimeInfo,=20
> webkit_mime_info_unref)
> + G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitNotification, g_object_unref)
> +@@ -87,7 +88,6 @@
> + G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitCredential,=20
> webkit_credential_free)
> + G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitITPFirstParty,=20
> webkit_itp_first_party_unref)
> + G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitITPThirdParty,=20
> webkit_itp_third_party_unref)
> +-G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitJavascriptResult,=20
> webkit_javascript_result_unref)
> + G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitMemoryPressureSettings,=20
> webkit_memory_pressure_settings_free)
> + G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitNavigationAction,=20
> webkit_navigation_action_free)
> + G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitNetworkProxySettings,=20
> webkit_network_proxy_settings_free)
> +---=20
> a/Source/WebKit/UIProcess/API/glib/WebKitJavascriptResultPrivate.h	2023-0=
3-09=20
> 16:33:19.420786155 +0100
> ++++=20
> b/Source/WebKit/UIProcess/API/glib/WebKitJavascriptResultPrivate.h	2023-0=
3-09=20
> 16:34:07.046094617 +0100
> +@@ -20,8 +20,8 @@
> + #pragma once
> +
> + #include <WebCore/SerializedScriptValue.h>
> +-#include "WebKitJavascriptResult.h"
> +
> + #if !ENABLE(2022_GLIB_API)
> ++#include "WebKitJavascriptResult.h"
> + WebKitJavascriptResult*=20
> webkitJavascriptResultCreate(WebCore::SerializedScriptValue&);
> + #endif
> diff --git a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch=20
> b/meta/recipes-sato/webkit/files/reproducibility.patch
> similarity index 100%
> rename from meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
> rename to meta/recipes-sato/webkit/files/reproducibility.patch
> diff --git a/meta/recipes-sato/webkit/webkitgtk-4_2.39.91.bb=20
> b/meta/recipes-sato/webkit/webkitgtk-4_2.39.91.bb
> new file mode 100644
> index 0000000000..dde573064a
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk-4_2.39.91.bb
> @@ -0,0 +1,168 @@
> +SUMMARY =3D "WebKit web rendering engine for the GTK+ platform"
> +HOMEPAGE =3D "<https://www.webkitgtk.org/>"
> +BUGTRACKER =3D "<https://bugs.webkit.org/>"
> +
> +LICENSE =3D "BSD-2-Clause & LGPL-2.0-or-later"
> +LIC_FILES_CHKSUM =3D=20
> "file://Source/JavaScriptCore/COPYING.LIB;md5=3Dd0c6d6397a5d84286dda758da=
57bd691=20
> <file://source/JavaScriptCore/COPYING.LIB;md5=3Dd0c6d6397a5d84286dda758da=
57bd691>=20
> \
> +                   =20
> file://Source/WebCore/LICENSE-APPLE;md5=3D4646f90082c40bcf298c285f8bab0b1=
2=20
> <file://source/WebCore/LICENSE-APPLE;md5=3D4646f90082c40bcf298c285f8bab0b=
12>=20
> \
> +                   =20
> file://Source/WebCore/LICENSE-LGPL-2;md5=3D36357ffde2b64ae177b2494445b79d=
21=20
> <file://source/WebCore/LICENSE-LGPL-2;md5=3D36357ffde2b64ae177b2494445b79=
d21>=20
> \
> +                   =20
> file://Source/WebCore/LICENSE-LGPL-2.1;md5=3Da778a33ef338abbaf8b8a7c36b6e=
ec80=20
> <file://source/WebCore/LICENSE-LGPL-2.1;md5=3Da778a33ef338abbaf8b8a7c36b6=
eec80>=20
> \
> +                    "
> +
> +SRC_URI =3D "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz=20
> <https://www.webkitgtk.org/releases/webkitgtk-$%7BPV%7D.tar.xz> \
> +          =20
> file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch=20
> <file://0001-findgobjectintrospection.cmake-prefix-variables-obta.patch/>=
=20
> \
> +           file://reproducibility.patch=20
> <file://reproducibility.patch/> \
> +           "
> +SRC_URI[sha256sum] =3D=20
> "92e8a6f599450529eb0bd552e4fc2d1f691831eb4d89caffb96fb581d2c836d3"
> +
> +S =3D "${WORKDIR}/webkitgtk-${PV}"
> +
> +inherit ccache cmake pkgconfig gobject-introspection perlnative=20
> features_check upstream-version-is-even gi-docgen mime-xdg
> +
> +ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> +
> +CVE_PRODUCT =3D "webkitgtk webkitgtk\+"
> +
> +DEPENDS +=3D " \
> +          atk \
> +          cairo \
> +          gperf-native \
> +          gstreamer1.0 \
> +          gstreamer1.0-plugins-base \
> +          gstreamer1.0-plugins-bad \
> +          ${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('LICENSE_FLAGS', 'commercial',=20
> 'gstreamer1.0-libav', '', d)} \
> +          gtk+3 \
> +          harfbuzz \
> +          jpeg \
> +          libnotify \
> +          libsoup \
> +          libtasn1 \
> +          libwebp \
> +          libxslt \
> +          ruby-native \
> +          unifdef-native \
> +          "
> +
> +PACKAGECONFIG ??=3D "${@bb.utils.filter=20
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'wayland x11 opengl',=20
> d)} \
> +                   ${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'x11 opengl', 'webgl=20
> opengl', '', d)} \
> +                   ${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'wayland opengl',=20
> 'webgl gles2', '', d)} \
> +                   ${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'systemd',=20
> 'journald', '', d)} \
> +                   enchant \
> +                   libsecret \
> +                  "
> +
> +PACKAGECONFIG[wayland] =3D=20
> "-DENABLE_WAYLAND_TARGET=3DON,-DENABLE_WAYLAND_TARGET=3DOFF,wayland=20
> wayland-native libwpe wpebackend-fdo"
> +PACKAGECONFIG[angle] =3D=20
> "-DUSE_ANGLE_EGL=3DON,-DUSE_ANGLE_EGL=3DOFF,virtual/egl"
> +PACKAGECONFIG[bubblewrap] =3D=20
> "-DENABLE_BUBBLEWRAP_SANDBOX=3DON,-DENABLE_BUBBLEWRAP_SANDBOX=3DOFF,bubbl=
ewrap-native=20
> libseccomp xdg-dbus-proxy-native,bubblewrap xdg-dbus-proxy"
> +PACKAGECONFIG[x11] =3D=20
> "-DENABLE_X11_TARGET=3DON,-DENABLE_X11_TARGET=3DOFF,virtual/libx11=20
> libxcomposite libxdamage libxrender libxt"
> +PACKAGECONFIG[libavif] =3D "-DUSE_AVIF=3DON,-DUSE_AVIF=3DOFF,libavif"
> +PACKAGECONFIG[gamepad] =3D=20
> "-DENABLE_GAMEPAD=3DON,-DENABLE_GAMEPAD=3DOFF,libmanette"
> +PACKAGECONFIG[geoclue] =3D=20
> "-DENABLE_GEOLOCATION=3DON,-DENABLE_GEOLOCATION=3DOFF,geoclue"
> +PACKAGECONFIG[enchant] =3D=20
> "-DENABLE_SPELLCHECK=3DON,-DENABLE_SPELLCHECK=3DOFF,enchant2"
> +PACKAGECONFIG[gles2] =3D=20
> "-DENABLE_GLES2=3DON,-DENABLE_GLES2=3DOFF,virtual/libgles2"
> +PACKAGECONFIG[webgl] =3D=20
> "-DENABLE_WEBGL=3DON,-DENABLE_WEBGL=3DOFF,virtual/egl"
> +PACKAGECONFIG[opengl] =3D=20
> "-DUSE_OPENGL_OR_ES=3DON,-DUSE_OPENGL_OR_ES=3DOFF,virtual/egl libepoxy"
> +PACKAGECONFIG[libsecret] =3D=20
> "-DUSE_LIBSECRET=3DON,-DUSE_LIBSECRET=3DOFF,libsecret"
> +PACKAGECONFIG[libhyphen] =3D=20
> "-DUSE_LIBHYPHEN=3DON,-DUSE_LIBHYPHEN=3DOFF,libhyphen"
> +PACKAGECONFIG[woff2] =3D "-DUSE_WOFF2=3DON,-DUSE_WOFF2=3DOFF,woff2"
> +PACKAGECONFIG[openjpeg] =3D=20
> "-DUSE_OPENJPEG=3DON,-DUSE_OPENJPEG=3DOFF,openjpeg"
> +PACKAGECONFIG[reduce-size] =3D=20
> "-DCMAKE_BUILD_TYPE=3DMinSizeRel,-DCMAKE_BUILD_TYPE=3DRelease,,"
> +PACKAGECONFIG[lcms] =3D "-DUSE_LCMS=3DON,-DUSE_LCMS=3DOFF,lcms"
> +PACKAGECONFIG[journald] =3D=20
> "-DENABLE_JOURNALD_LOG=3DON,-DENABLE_JOURNALD_LOG=3DOFF,systemd"
> +
> +# webkitgtk is full of /usr/bin/env python, particular for=20
> generating docs
> +do_configure[postfuncs] +=3D "setup_python_link"
> +setup_python_link() {
> +	if [ ! -e ${STAGING_BINDIR_NATIVE}/python ]; then
> +		ln -s `which python3` ${STAGING_BINDIR_NATIVE}/python
> +	fi
> +}
> +
> +EXTRA_OECMAKE =3D " \
> +		-DENABLE_2022_GLIB_API=3DOFF \
> +		-DPORT=3DGTK \
> +		-DUSE_GTK4=3DOFF \
> +		-DUSE_XDGMIME=3DON \
> +		-DBWRAP_EXECUTABLE=3D${bindir}/bwrap \
> +		-DDBUS_PROXY_EXECUTABLE=3D${bindir}/xdg-dbus-proxy \
> +		${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('GI_DATA_ENABLED', 'True',=20
> '-DENABLE_INTROSPECTION=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \
> +		${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('GIDOCGEN_ENABLED', 'True',=20
> '-DENABLE_DOCUMENTATION=3DON', '-DENABLE_DOCUMENTATION=3DOFF', d)} \
> +		-DENABLE_MINIBROWSER=3DON \
> +                -DPYTHON_EXECUTABLE=3D`which python3` \
> +		"
> +
> +# Javascript JIT is not supported on ARC
> +EXTRA_OECMAKE:append:arc =3D " -DENABLE_JIT=3DOFF "
> +# By default 25-bit "medium" calls are used on ARC
> +# which is not enough for binaries larger than 32 MiB
> +CFLAGS:append:arc =3D " -mlong-calls"
> +CXXFLAGS:append:arc =3D " -mlong-calls"
> +
> +# Needed for non-mesa graphics stacks when x11 is disabled
> +CXXFLAGS +=3D "${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'x11', '',=20
> '-DEGL_NO_X11=3D1', d)}"
> +
> +# Javascript JIT is not supported on powerpc
> +EXTRA_OECMAKE:append:powerpc =3D " -DENABLE_JIT=3DOFF "
> +EXTRA_OECMAKE:append:powerpc64 =3D " -DENABLE_JIT=3DOFF "
> +
> +# ARM JIT code does not build on ARMv4/5/6 anymore
> +EXTRA_OECMAKE:append:armv5 =3D " -DENABLE_JIT=3DOFF "
> +EXTRA_OECMAKE:append:armv6 =3D " -DENABLE_JIT=3DOFF "
> +EXTRA_OECMAKE:append:armv4 =3D " -DENABLE_JIT=3DOFF "
> +
> +EXTRA_OECMAKE:append:mipsarch =3D " -DUSE_LD_GOLD=3DOFF "
> +EXTRA_OECMAKE:append:powerpc =3D " -DUSE_LD_GOLD=3DOFF "
> +
> +# JIT and gold linker does not work on RISCV
> +EXTRA_OECMAKE:append:riscv32 =3D " -DUSE_LD_GOLD=3DOFF -DENABLE_JIT=3DOF=
F"
> +EXTRA_OECMAKE:append:riscv64 =3D " -DUSE_LD_GOLD=3DOFF -DENABLE_JIT=3DOF=
F"
> +
> +# JIT not supported on MIPS either
> +EXTRA_OECMAKE:append:mipsarch =3D " -DENABLE_JIT=3DOFF=20
> -DENABLE_C_LOOP=3DON "
> +
> +# JIT not supported on X32
> +# An attempt was made to upstream JIT support for x32 in
> +# <https://bugs.webkit.org/show_bug.cgi?id=3D100450>, but this was=20
> closed as
> +# unresolved due to limited X32 adoption.
> +EXTRA_OECMAKE:append:x86-x32 =3D " -DENABLE_JIT=3DOFF "
> +
> +SECURITY_CFLAGS:remove:aarch64 =3D "-fpie"
> +SECURITY_CFLAGS:append:aarch64 =3D " -fPIE"
> +
> +FILES:${PN} +=3D "${libdir}/webkit2gtk-4.*/injected-bundle"
> +
> +RRECOMMENDS:${PN} +=3D "ca-certificates shared-mime-info"
> +
> +# <http://errors.yoctoproject.org/Errors/Details/20370/>
> +ARM_INSTRUCTION_SET:armv4 =3D "arm"
> +ARM_INSTRUCTION_SET:armv5 =3D "arm"
> +ARM_INSTRUCTION_SET:armv6 =3D "arm"
> +
> +# <https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9474>
> +# <https://bugs.webkit.org/show_bug.cgi?id=3D159880>
> +# JSC JIT can build on ARMv7 with -marm, but doesn't work on runtime.
> +# Upstream only tests regularly the JSC JIT on ARMv7 with Thumb2=20
> (-mthumb).
> +ARM_INSTRUCTION_SET:armv7a =3D "thumb"
> +ARM_INSTRUCTION_SET:armv7r =3D "thumb"
> +ARM_INSTRUCTION_SET:armv7ve =3D "thumb"
> +
> +# introspection inside qemu-arm hangs forever on musl/arm builds
> +# therefore disable GI_DATA
> +GI_DATA_ENABLED:libc-musl:armv7a =3D "False"
> +GI_DATA_ENABLED:libc-musl:armv7ve =3D "False"
> +
> +PACKAGE_PREPROCESS_FUNCS +=3D "src_package_preprocess"
> +src_package_preprocess () {
> +        # Trim build paths from comments in generated sources to=20
> ensure reproducibility
> +        sed -i -e "s,${WORKDIR},,g" \
> +            ${B}/JavaScriptCore/DerivedSources/*.h \
> +            ${B}/JavaScriptCore/DerivedSources/yarr/*.h \
> +            ${B}/JavaScriptCore/PrivateHeaders/JavaScriptCore/*.h \
> +            ${B}/WebKitGTK/DerivedSources/webkit/*.cpp \
> +            ${B}/WebKitGTK/DerivedSources/webkit/*.h
> +}
> +
> +do_install:append() {
> +	# webkitwebdriver conflicts between webkitgtk and webkitgtk-4 ...=20
> move
> +	mv ${D}${bindir}/WebKitWebDriver ${D}${bindir}/WebKitWebDriver-4
> +}
> diff --git=20
> a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a=
2548.patch=20
> b/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a=
2548.patch
> deleted file mode 100644
> index 32f92f7ff5..0000000000
> ---=20
> a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a=
2548.patch
> +++ /dev/null
> @@ -1,296 +0,0 @@
> -From 0d3344e17d258106617b0e6d783d073b188a2548 Mon Sep 17 00:00:00=20
> 2001
> -From: Adrian Perez de Castro <aperez@igalia.com=20
> <mailto:aperez@igalia.com>>
> -Date: Thu, 2 Jun 2022 11:19:06 +0300
> -Subject: [PATCH] [ARM][NEON] FELightningNEON.cpp fails to build,=20
> NEON fast
> - path seems unused <https://bugs.webkit.org/show_bug.cgi?id=3D241182>
> -
> -Reviewed by NOBODY (OOPS!).
> -
> -Move the NEON fast path for the SVG lighting filter effects into
> -FELightingSoftwareApplier, and arrange to actually use them by
> -forwarding calls to applyPlatformGeneric() into applyPlatformNeon().
> -
> -Some changes were needed to adapt platformApplyNeon() to the current
> -state of filters after r286140. This was not detected because the=20
> code
> -bitrotted due to it being guarded with CPU(ARM_TRADITIONAL), which=20
> does
> -not get used much these days: CPU(ARM_THUMB2) is more common. It=20
> should
> -be possible to use the NEON fast paths also in Thumb mode, but that=20
> is
> -left for a follow-up fix.
> -
> -*=20
> Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp:
> -(WebCore::FELightingSoftwareApplier::platformApplyNeonWorker):
> -(WebCore::FELightingSoftwareApplier::getPowerCoefficients):
> -(WebCore::FELighting::platformApplyNeonWorker): Deleted.
> -(WebCore::FELighting::getPowerCoefficients): Deleted.
> -* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h:
> -(WebCore::FELightingSoftwareApplier::applyPlatformNeon):
> -(WebCore::FELighting::platformApplyNeon): Deleted.
> -* Source/WebCore/platform/graphics/filters/DistantLightSource.h:
> -* Source/WebCore/platform/graphics/filters/FELighting.h:
> -* Source/WebCore/platform/graphics/filters/PointLightSource.h:
> -* Source/WebCore/platform/graphics/filters/SpotLightSource.h:
> -*=20
> Source/WebCore/platform/graphics/filters/software/FELightingSoftwareAppli=
er.h:
> ----
> -Upstream-Status: Submitted=20
> [<https://github.com/WebKit/WebKit/pull/1233>]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com=20
> <mailto:raj.khem@gmail.com>>
> -
> - .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
> - .../graphics/cpu/arm/filters/FELightingNEON.h | 54=20
> +++++++++----------
> - .../graphics/filters/DistantLightSource.h     |  4 ++
> - .../platform/graphics/filters/FELighting.h    |  7 ---
> - .../graphics/filters/PointLightSource.h       |  4 ++
> - .../graphics/filters/SpotLightSource.h        |  4 ++
> - .../software/FELightingSoftwareApplier.h      | 16 ++++++
> - 7 files changed, 57 insertions(+), 36 deletions(-)
> -
> ----=20
> a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
> -+++=20
> b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
> -@@ -49,7 +49,7 @@ short* feLightingConstantsForNeon()
> -     return s_FELightingConstantsForNeon;
> - }
> -
> --void=20
> FELighting::platformApplyNeonWorker(FELightingPaintingDataForNeon*=20
> parameters)
> -+void=20
> FELightingSoftwareApplier::platformApplyNeonWorker(FELightingPaintingData=
ForNeon*=20
> parameters)
> - {
> -     neonDrawLighting(parameters);
> - }
> -@@ -464,7 +464,7 @@ TOSTRING(neonDrawLighting) ":" NL
> -     "b .lightStrengthCalculated" NL
> - ); // NOLINT
> -
> --int FELighting::getPowerCoefficients(float exponent)
> -+int FELightingSoftwareApplier::getPowerCoefficients(float exponent)
> - {
> -     // Calling a powf function from the assembly code would require=20
> to save
> -     // and reload a lot of NEON registers. Since the base is in=20
> range [0..1]
> ----=20
> a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
> -+++=20
> b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
> -@@ -24,14 +24,15 @@
> -  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH=20
> DAMAGE.
> -  */
> -
> --#ifndef FELightingNEON_h
> --#define FELightingNEON_h
> -+#pragma once
> -
> - #if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) &&=20
> COMPILER(GCC_COMPATIBLE)
> -
> --#include "FELighting.h"
> -+#include "FELightingSoftwareApplier.h"
> -+#include "ImageBuffer.h"
> - #include "PointLightSource.h"
> - #include "SpotLightSource.h"
> -+#include <wtf/ObjectIdentifier.h>
> - #include <wtf/ParallelJobs.h>
> -
> - namespace WebCore {
> -@@ -93,14 +94,14 @@ extern "C" {
> - void neonDrawLighting(FELightingPaintingDataForNeon*);
> - }
> -
> --inline void FELighting::platformApplyNeon(const LightingData& data,=20
> const LightSource::PaintingData& paintingData)
> -+inline void FELightingSoftwareApplier::applyPlatformNeon(const=20
> FELightingSoftwareApplier::LightingData& data, const=20
> LightSource::PaintingData& paintingData)
> - {
> --    alignas(16) FELightingFloatArgumentsForNeon floatArguments;
> --    FELightingPaintingDataForNeon neonData =3D {
> -+    WebCore::FELightingFloatArgumentsForNeon alignas(16)=20
> floatArguments;
> -+    WebCore::FELightingPaintingDataForNeon neonData =3D {
> -         data.pixels->data(),
> -         1,
> --        data.widthDecreasedByOne - 1,
> --        data.heightDecreasedByOne - 1,
> -+        data.width - 2,
> -+        data.height - 2,
> -         0,
> -         0,
> -         0,
> -@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeo
> -     // Set light source arguments.
> -     floatArguments.constOne =3D 1;
> -
> --    auto color =3D=20
> m_lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
> -+    auto color =3D=20
> data.lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
> -
> -     floatArguments.colorRed =3D color.red;
> -     floatArguments.colorGreen =3D color.green;
> -     floatArguments.colorBlue =3D color.blue;
> -     floatArguments.padding4 =3D 0;
> -
> --    if (m_lightSource->type() =3D=3D LS_POINT) {
> -+    if (data.lightSource->type() =3D=3D LS_POINT) {
> -         neonData.flags |=3D FLAG_POINT_LIGHT;
> --        PointLightSource& pointLightSource =3D=20
> static_cast<PointLightSource&>(m_lightSource.get());
> -+        const auto& pointLightSource =3D *static_cast<const=20
> PointLightSource*>(data.lightSource);
> -         floatArguments.lightX =3D pointLightSource.position().x();
> -         floatArguments.lightY =3D pointLightSource.position().y();
> -         floatArguments.lightZ =3D pointLightSource.position().z();
> -         floatArguments.padding2 =3D 0;
> --    } else if (m_lightSource->type() =3D=3D LS_SPOT) {
> -+    } else if (data.lightSource->type() =3D=3D LS_SPOT) {
> -         neonData.flags |=3D FLAG_SPOT_LIGHT;
> --        SpotLightSource& spotLightSource =3D=20
> static_cast<SpotLightSource&>(m_lightSource.get());
> -+        const auto& spotLightSource =3D *static_cast<const=20
> SpotLightSource*>(data.lightSource);
> -         floatArguments.lightX =3D spotLightSource.position().x();
> -         floatArguments.lightY =3D spotLightSource.position().y();
> -         floatArguments.lightZ =3D spotLightSource.position().z();
> -@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeo
> -         if (spotLightSource.specularExponent() =3D=3D 1)
> -             neonData.flags |=3D FLAG_CONE_EXPONENT_IS_1;
> -     } else {
> --        ASSERT(m_lightSource->type() =3D=3D LS_DISTANT);
> -+        ASSERT(data.lightSource->type() =3D=3D LS_DISTANT);
> -         floatArguments.lightX =3D=20
> paintingData.initialLightingData.lightVector.x();
> -         floatArguments.lightY =3D=20
> paintingData.initialLightingData.lightVector.y();
> -         floatArguments.lightZ =3D=20
> paintingData.initialLightingData.lightVector.z();
> -@@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeo
> -     // Set lighting arguments.
> -     floatArguments.surfaceScale =3D data.surfaceScale;
> -     floatArguments.minusSurfaceScaleDividedByFour =3D=20
> -data.surfaceScale / 4;
> --    if (m_lightingType =3D=3D FELighting::DiffuseLighting)
> --        floatArguments.diffuseConstant =3D m_diffuseConstant;
> -+    if (data.filterType =3D=3D FilterEffect::Type::FEDiffuseLighting)
> -+        floatArguments.diffuseConstant =3D data.diffuseConstant;
> -     else {
> -         neonData.flags |=3D FLAG_SPECULAR_LIGHT;
> --        floatArguments.diffuseConstant =3D m_specularConstant;
> --        neonData.specularExponent =3D=20
> getPowerCoefficients(m_specularExponent);
> --        if (m_specularExponent =3D=3D 1)
> -+        floatArguments.diffuseConstant =3D data.specularConstant;
> -+        neonData.specularExponent =3D=20
> getPowerCoefficients(data.specularExponent);
> -+        if (data.specularExponent =3D=3D 1)
> -             neonData.flags |=3D FLAG_SPECULAR_EXPONENT_IS_1;
> -     }
> -     if (floatArguments.diffuseConstant =3D=3D 1)
> -         neonData.flags |=3D FLAG_DIFFUSE_CONST_IS_1;
> -
> --    int optimalThreadNumber =3D ((data.widthDecreasedByOne - 1) *=20
> (data.heightDecreasedByOne - 1)) / s_minimalRectDimension;
> -+    static constexpr int minimalRectDimension =3D 100 * 100; //=20
> Empirical data limit for parallel jobs
> -+    int optimalThreadNumber =3D ((data.width - 2) * (data.height -=20
> 2)) / minimalRectDimension;
> -     if (optimalThreadNumber > 1) {
> -         // Initialize parallel jobs
> --        ParallelJobs<FELightingPaintingDataForNeon>=20
> parallelJobs(&WebCore::FELighting::platformApplyNeonWorker,=20
> optimalThreadNumber);
> -+        ParallelJobs<FELightingPaintingDataForNeon>=20
> parallelJobs(&FELightingSoftwareApplier::platformApplyNeonWorker,=20
> optimalThreadNumber);
> -
> -         // Fill the parameter array
> -         int job =3D parallelJobs.numberOfJobs();
> -         if (job > 1) {
> -             int yStart =3D 1;
> --            int yStep =3D (data.heightDecreasedByOne - 1) / job;
> -+            int yStep =3D (data.height - 2) / job;
> -             for (--job; job >=3D 0; --job) {
> -                 FELightingPaintingDataForNeon& params =3D=20
> parallelJobs.parameter(job);
> -                 params =3D neonData;
> -                 params.yStart =3D yStart;
> --                params.pixels +=3D (yStart - 1) *=20
> (data.widthDecreasedByOne + 1) * 4;
> -+                params.pixels +=3D (yStart - 1) * data.width * 4;
> -                 if (job > 0) {
> -                     params.absoluteHeight =3D yStep;
> -                     yStart +=3D yStep;
> -                 } else
> --                    params.absoluteHeight =3D=20
> data.heightDecreasedByOne - yStart;
> -+                    params.absoluteHeight =3D (data.height - 1) -=20
> yStart;
> -             }
> -             parallelJobs.execute();
> -             return;
> -@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeo
> - } // namespace WebCore
> -
> - #endif // CPU(ARM_NEON) && COMPILER(GCC_COMPATIBLE)
> --
> --#endif // FELightingNEON_h
> ---- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> -+++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> -@@ -25,6 +25,10 @@
> - #include "LightSource.h"
> - #include <wtf/Ref.h>
> -
> -+namespace WTF {
> -+class TextStream;
> -+} // namespace WTF
> -+
> - namespace WebCore {
> -
> - class DistantLightSource : public LightSource {
> ---- a/Source/WebCore/platform/graphics/filters/FELighting.h
> -+++ b/Source/WebCore/platform/graphics/filters/FELighting.h
> -@@ -35,8 +35,6 @@
> -
> - namespace WebCore {
> -
> --struct FELightingPaintingDataForNeon;
> --
> - class FELighting : public FilterEffect {
> - public:
> -     const Color& lightingColor() const { return m_lightingColor; }
> -@@ -67,11 +65,6 @@ protected:
> -
> -     std::unique_ptr<FilterEffectApplier> createSoftwareApplier()=20
> const override;
> -
> --#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) &&=20
> COMPILER(GCC_COMPATIBLE)
> --    static int getPowerCoefficients(float exponent);
> --    inline void platformApplyNeon(const LightingData&, const=20
> LightSource::PaintingData&);
> --#endif
> --
> -     Color m_lightingColor;
> -     float m_surfaceScale;
> -     float m_diffuseConstant;
> ---- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
> -+++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
> -@@ -26,6 +26,10 @@
> - #include "LightSource.h"
> - #include <wtf/Ref.h>
> -
> -+namespace WTF {
> -+class TextStream;
> -+} // namespace WTF
> -+
> - namespace WebCore {
> -
> - class PointLightSource : public LightSource {
> ---- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> -+++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> -@@ -26,6 +26,10 @@
> - #include "LightSource.h"
> - #include <wtf/Ref.h>
> -
> -+namespace WTF {
> -+class TextStream;
> -+} // namespace WTF
> -+
> - namespace WebCore {
> -
> - class SpotLightSource : public LightSource {
> ----=20
> a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApp=
lier.h
> -+++=20
> b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApp=
lier.h
> -@@ -36,6 +36,7 @@
> - namespace WebCore {
> -
> - class FELighting;
> -+struct FELightingPaintingDataForNeon;
> -
> - class FELightingSoftwareApplier final : public=20
> FilterEffectConcreteApplier<FELighting> {
> -     WTF_MAKE_FAST_ALLOCATED;
> -@@ -132,8 +133,23 @@ private:
> -
> -     static void applyPlatformGenericPaint(const LightingData&,=20
> const LightSource::PaintingData&, int startY, int endY);
> -     static void applyPlatformGenericWorker(ApplyParameters*);
> -+
> -+#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) &&=20
> COMPILER(GCC_COMPATIBLE)
> -+    static int getPowerCoefficients(float exponent);
> -+    static void=20
> platformApplyNeonWorker(FELightingPaintingDataForNeon*);
> -+    inline static void applyPlatformNeon(const LightingData&, const=20
> LightSource::PaintingData&);
> -+
> -+    inline static void applyPlatformGeneric(const LightingData&=20
> data, const LightSource::PaintingData& paintingData)
> -+    {
> -+        applyPlatformNeon(data, paintingData);
> -+    }
> -+#else
> -     static void applyPlatformGeneric(const LightingData&, const=20
> LightSource::PaintingData&);
> -+#endif
> -+
> -     static void applyPlatform(const LightingData&);
> - };
> -
> - } // namespace WebCore
> -+
> -+#include "FELightingNEON.h"
> diff --git=20
> a/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243e=
cd98.patch=20
> b/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243e=
cd98.patch
> deleted file mode 100644
> index 1ff9dcea7e..0000000000
> ---=20
> a/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243e=
cd98.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From d318bb461f040b90453bc4e100dcf967243ecd98 Mon Sep 17 00:00:00=20
> 2001
> -From: Michael Catanzaro <mcatanzaro@redhat.com=20
> <mailto:mcatanzaro@redhat.com>>
> -Date: Mon, 16 Jan 2023 16:55:26 -0800
> -Subject: [PATCH] WebKitGTK 2.39.4 does not build due to missing=20
> #include in
> - ANGLE <https://bugs.webkit.org/show_bug.cgi?id=3D250689>
> -
> -Unreviewed build fix.
> -
> -* Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h:
> -
> -Canonical link: <https://commits.webkit.org/258968@main>
> -
> -Upstream-Status: Backport=20
> [<https://bugs.webkit.org/show_bug.cgi?id=3D250689>]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com=20
> <mailto:raj.khem@gmail.com>>
> ----
> - Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h=20
> b/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h
> -index 94cb93e01fc0..ec7bda372f30 100644
> ---- a/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h
> -+++ b/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h
> -@@ -12,6 +12,7 @@
> -
> - #include <algorithm>
> - #include <array>
> -+#include <cstdint>
> - #include <string>
> - #include <vector>
> -
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb=20
> b/meta/recipes-sato/webkit/webkitgtk_2.39.91.bb
> similarity index 75%
> rename from meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
> rename to meta/recipes-sato/webkit/webkitgtk_2.39.91.bb
> index e52920883a..30ed0be743 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.39.91.bb
> @@ -12,62 +12,63 @@ LIC_FILES_CHKSUM =3D=20
> "file://Source/JavaScriptCore/COPYING.LIB;md5=3Dd0c6d6397a5d842
>  SRC_URI =3D "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz=20
> <https://www.webkitgtk.org/releases/$%7BBPN%7D-$%7BPV%7D.tar.xz> \
>            =20
> file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch=20
> <file://0001-findgobjectintrospection.cmake-prefix-variables-obta.patch/>=
=20
> \
>             file://reproducibility.patch=20
> <file://reproducibility.patch/> \
> -           file://0d3344e17d258106617b0e6d783d073b188a2548.patch=20
> <file://0d3344e17d258106617b0e6d783d073b188a2548.patch/> \
> -           file://d318bb461f040b90453bc4e100dcf967243ecd98.patch=20
> <file://d318bb461f040b90453bc4e100dcf967243ecd98.patch/> \
> +          =20
> file://0001-fix-after-remove-of-WebKitJavascriptResult.patch=20
> <file://0001-fix-after-remove-of-webkitjavascriptresult.patch/> \
>             "
> -SRC_URI[sha256sum] =3D=20
> "40c20c43022274df5893f22b1054fa894c3eea057389bb08aee08c5b0bb0c1a7"
> +SRC_URI[sha256sum] =3D=20
> "92e8a6f599450529eb0bd552e4fc2d1f691831eb4d89caffb96fb581d2c836d3"
>=20
> -inherit cmake pkgconfig gobject-introspection perlnative=20
> features_check upstream-version-is-even gi-docgen
> +inherit cmake ccache pkgconfig gobject-introspection perlnative=20
> features_check upstream-version-is-even gi-docgen mime-xdg
>=20
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> -REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'wayland', 'opengl',=20
> '', d)}"
> +REQUIRED_DISTRO_FEATURES =3D "opengl"
>=20
>  CVE_PRODUCT =3D "webkitgtk webkitgtk\+"
>=20
>  DEPENDS +=3D " \
> -          ruby-native \
> -          gperf-native \
> +          atk \
>            cairo \
> +          gperf-native \
> +          gstreamer1.0 \
> +          gstreamer1.0-plugins-base \
> +          gstreamer1.0-plugins-bad \
> +          ${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('LICENSE_FLAGS', 'commercial',=20
> 'gstreamer1.0-libav', '', d)} \
>            harfbuzz \
>            jpeg \
> -          atk \
> +          libnotify \
> +          libsoup \
> +          libtasn1 \
>            libwebp \
> -          gtk+3 \
>            libxslt \
> -          libtasn1 \
> -          libnotify \
> -          gstreamer1.0 \
> -          gstreamer1.0-plugins-base \
> +          ruby-native \
> +          unifdef-native \
>            "
>=20
> -PACKAGECONFIG_SOUP ?=3D "soup3"
> -PACKAGECONFIG ??=3D "${@bb.utils.filter=20
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'systemd wayland x11',=20
> d)} \
> +PACKAGECONFIG ??=3D "${@bb.utils.filter=20
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'wayland x11 opengl',=20
> d)} \
>                     ${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'x11 opengl', 'webgl=20
> opengl', '', d)} \
> -                   ${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'x11', '', 'webgl=20
> gles2', d)} \
> -                   ${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'opengl',=20
> 'opengl-or-es', '', d)} \
> +                   ${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'wayland opengl',=20
> 'webgl gles2', '', d)} \
> +                   ${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'systemd',=20
> 'journald', '', d)} \
> +                   gtk4 \
>                     enchant \
>                     libsecret \
> -                   ${PACKAGECONFIG_SOUP} \
>                    "
>=20
> -PACKAGECONFIG[wayland] =3D=20
> "-DENABLE_WAYLAND_TARGET=3DON,-DENABLE_WAYLAND_TARGET=3DOFF,wayland=20
> libwpe wpebackend-fdo wayland-native"
> -PACKAGECONFIG[angle] =3D "-DUSE_ANGLE_WEBGL=3DON,-DUSE_ANGLE_WEBGL=3DOFF=
"
> +PACKAGECONFIG[wayland] =3D=20
> "-DENABLE_WAYLAND_TARGET=3DON,-DENABLE_WAYLAND_TARGET=3DOFF,wayland=20
> wayland-native libwpe wpebackend-fdo"
> +PACKAGECONFIG[angle] =3D=20
> "-DUSE_ANGLE_EGL=3DON,-DUSE_ANGLE_EGL=3DOFF,virtual/egl"
> +PACKAGECONFIG[bubblewrap] =3D=20
> "-DENABLE_BUBBLEWRAP_SANDBOX=3DON,-DENABLE_BUBBLEWRAP_SANDBOX=3DOFF,bubbl=
ewrap-native=20
> libseccomp xdg-dbus-proxy-native,bubblewrap xdg-dbus-proxy"
>  PACKAGECONFIG[x11] =3D=20
> "-DENABLE_X11_TARGET=3DON,-DENABLE_X11_TARGET=3DOFF,virtual/libx11=20
> libxcomposite libxdamage libxrender libxt"
> +PACKAGECONFIG[libavif] =3D "-DUSE_AVIF=3DON,-DUSE_AVIF=3DOFF,libavif"
> +PACKAGECONFIG[gtk4] =3D "-DUSE_GTK4=3DON,-DUSE_GTK4=3DOFF,gtk4"
> +PACKAGECONFIG[gamepad] =3D=20
> "-DENABLE_GAMEPAD=3DON,-DENABLE_GAMEPAD=3DOFF,libmanette"
>  PACKAGECONFIG[geoclue] =3D=20
> "-DENABLE_GEOLOCATION=3DON,-DENABLE_GEOLOCATION=3DOFF,geoclue"
>  PACKAGECONFIG[enchant] =3D=20
> "-DENABLE_SPELLCHECK=3DON,-DENABLE_SPELLCHECK=3DOFF,enchant2"
>  PACKAGECONFIG[gles2] =3D=20
> "-DENABLE_GLES2=3DON,-DENABLE_GLES2=3DOFF,virtual/libgles2"
>  PACKAGECONFIG[webgl] =3D=20
> "-DENABLE_WEBGL=3DON,-DENABLE_WEBGL=3DOFF,virtual/egl"
> -PACKAGECONFIG[opengl] =3D=20
> "-DENABLE_GRAPHICS_CONTEXT_GL=3DON,-DENABLE_GRAPHICS_CONTEXT_GL=3DOFF,vir=
tual/egl"
> -PACKAGECONFIG[opengl-or-es] =3D=20
> "-DUSE_OPENGL_OR_ES=3DON,-DUSE_OPENGL_OR_ES=3DOFF"
> +PACKAGECONFIG[opengl] =3D=20
> "-DUSE_OPENGL_OR_ES=3DON,-DUSE_OPENGL_OR_ES=3DOFF,virtual/egl libepoxy"
>  PACKAGECONFIG[libsecret] =3D=20
> "-DUSE_LIBSECRET=3DON,-DUSE_LIBSECRET=3DOFF,libsecret"
>  PACKAGECONFIG[libhyphen] =3D=20
> "-DUSE_LIBHYPHEN=3DON,-DUSE_LIBHYPHEN=3DOFF,libhyphen"
>  PACKAGECONFIG[woff2] =3D "-DUSE_WOFF2=3DON,-DUSE_WOFF2=3DOFF,woff2"
>  PACKAGECONFIG[openjpeg] =3D=20
> "-DUSE_OPENJPEG=3DON,-DUSE_OPENJPEG=3DOFF,openjpeg"
> -PACKAGECONFIG[systemd] =3D "-DUSE_SYSTEMD=3DON,-DUSE_SYSTEMD=3Doff,syste=
md"
>  PACKAGECONFIG[reduce-size] =3D=20
> "-DCMAKE_BUILD_TYPE=3DMinSizeRel,-DCMAKE_BUILD_TYPE=3DRelease,,"
>  PACKAGECONFIG[lcms] =3D "-DUSE_LCMS=3DON,-DUSE_LCMS=3DOFF,lcms"
> -PACKAGECONFIG[soup2] =3D=20
> "-DUSE_SOUP2=3DON,-DUSE_SOUP2=3DOFF,libsoup-2.4,,,soup3"
> -PACKAGECONFIG[soup3] =3D ",,libsoup,,,soup2"
>  PACKAGECONFIG[journald] =3D=20
> "-DENABLE_JOURNALD_LOG=3DON,-DENABLE_JOURNALD_LOG=3DOFF,systemd"
>=20
>  # webkitgtk is full of /usr/bin/env python, particular for=20
> generating docs
> @@ -79,13 +80,15 @@ setup_python_link() {
>  }
>=20
>  EXTRA_OECMAKE =3D " \
> +		-DENABLE_2022_GLIB_API=3DON \
>  		-DPORT=3DGTK \
> +		-DUSE_XDGMIME=3DON \
> +		-DBWRAP_EXECUTABLE=3D${bindir}/bwrap \
> +		-DDBUS_PROXY_EXECUTABLE=3D${bindir}/xdg-dbus-proxy \
>  		${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('GI_DATA_ENABLED', 'True',=20
> '-DENABLE_INTROSPECTION=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \
>  		${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('GIDOCGEN_ENABLED', 'True',=20
> '-DENABLE_DOCUMENTATION=3DON', '-DENABLE_DOCUMENTATION=3DOFF', d)} \
>  		-DENABLE_MINIBROWSER=3DON \
>                  -DPYTHON_EXECUTABLE=3D`which python3` \
> -                -DENABLE_BUBBLEWRAP_SANDBOX=3DOFF \
> -                -DENABLE_GAMEPAD=3DOFF \
>  		"
>=20
>  # Javascript JIT is not supported on ARC
> @@ -126,7 +129,7 @@ EXTRA_OECMAKE:append:x86-x32 =3D " -DENABLE_JIT=3DOFF=
=20
> "
>  SECURITY_CFLAGS:remove:aarch64 =3D "-fpie"
>  SECURITY_CFLAGS:append:aarch64 =3D " -fPIE"
>=20
> -FILES:${PN} +=3D=20
> "${libdir}/webkit2gtk-4.*/injected-bundle/libwebkit2gtkinjectedbundle.so"
> +FILES:${PN} +=3D "${libdir}/webkitgtk-6.*/injected-bundle"
>=20
>  RRECOMMENDS:${PN} +=3D "ca-certificates shared-mime-info"
>=20
> @@ -148,9 +151,6 @@ ARM_INSTRUCTION_SET:armv7ve =3D "thumb"
>  GI_DATA_ENABLED:libc-musl:armv7a =3D "False"
>  GI_DATA_ENABLED:libc-musl:armv7ve =3D "False"
>=20
> -# Can't be built with ccache
> -CCACHE_DISABLE =3D "1"
> -
>  PACKAGE_PREPROCESS_FUNCS +=3D "src_package_preprocess"
>  src_package_preprocess () {
>          # Trim build paths from comments in generated sources to=20
> ensure reproducibility
> @@ -158,8 +158,10 @@ src_package_preprocess () {
>              ${B}/JavaScriptCore/DerivedSources/*.h \
>              ${B}/JavaScriptCore/DerivedSources/yarr/*.h \
>              ${B}/JavaScriptCore/PrivateHeaders/JavaScriptCore/*.h \
> -            ${B}/WebKit2Gtk/DerivedSources/webkit2/*.cpp \
> -            ${B}/WebKit2Gtk/DerivedSources/webkit2/*.h
> -
> +            ${B}/WebKitGTK/DerivedSources/webkit/*.cpp \
> +            ${B}/WebKitGTK/DerivedSources/webkit/*.h
>  }
>=20
> +do_install:append() {
> +	cp -rf ${B}/JavaScriptCore/Headers/JavaScriptCore ${D}${includedir}
> +}
> diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb=20
> b/meta/recipes-sato/webkit/wpebackend-fdo_1.14.1.bb
> similarity index 90%
> rename from meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb
> rename to meta/recipes-sato/webkit/wpebackend-fdo_1.14.1.bb
> index 708201043b..9f2ea0b7de 100644
> --- a/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb
> +++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.14.1.bb
> @@ -13,7 +13,7 @@ inherit meson features_check pkgconfig
>  REQUIRED_DISTRO_FEATURES =3D "opengl"
>=20
>  SRC_URI =3D "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz=20
> <https://wpewebkit.org/releases/$%7BBPN%7D-$%7BPV%7D.tar.xz>"
> -SRC_URI[sha256sum] =3D=20
> "e75b0cb2c7145448416e8696013d8883f675c66c11ed750e06865efec5809155"
> +SRC_URI[sha256sum] =3D=20
> "01938dd93c62b3a47b18dd13c70d50490a8b8a6caec23c8550a3dbdbcc6bbb50"
>=20
>  # Especially helps compiling with clang which enable this as error=20
> when
>  # using c++11
> --
> 2.34.1
>=20


--=-ifLKED47z9idS3ICQ9wO
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>This will be required changes for =
the upcoming gnome release</div></div><div id=3D"geary-quote" dir=3D"auto">=
<br>Am Do, 9. M=E4r 2023 um 21:39:33 +0100 schrieb Markus Volk &lt;f_l_k@t-=
online.de&gt;:<br><blockquote type=3D"cite"><div class=3D"plaintext" style=
=3D"white-space: break-spaces;">- added PACKAGECONFIGs for av1 support, gam=
epad and sandboxing
- cmake tries to find where bwrap and xdg-dbus-proxy are located on target =
and reads the path from
  ${STAGING_BINDIR_NATIVE}. This breaks reproducibility and runtime. Fix by=
 adding the needed paths manually.
- ccache seems to be working well now. Enable by default. It significantly =
improves buildtime on rebuilds.
- webkit 2.39.91 removed WebKitJavascriptResult in favor of using JSCValue =
directly in GTK4 API. Some files
  needed adjustment after that. I've created a patch for it and marked it p=
ending for now. Still need to find
  the place where this should be sent to.
- webkitgtk can be built with both, gtk+3 and gtk4 but it cant be built wit=
h support for both at once.
  there are still some packages that require the gtk3 variant, nameably sur=
f, gnome-online-accounts and wxwidgets
  while ephiphany for example has a hard dependency on webkitgtk built with=
 gtk4. This is why we need to provide
  recipes for both variants. If built with gtk+3 webkitgtk provides the 4.0=
 api, if built with gtk4 it'll provide the
  6.0 api. The only conflicting file between those two is the WebKitWebDriv=
er binary. This was renamed for the gtk3
  variant so both variants can be installed into the same image.
- update dependencies
- wpebackend-fdo: update

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t=
-online.de</a>&gt;
---
 ...spection.cmake-prefix-variables-obta.patch |   0
 ...ter-remove-of-WebKitJavascriptResult.patch |  53 ++++
 .../reproducibility.patch                     |   0
 .../webkit/webkitgtk-4_2.39.91.bb             | 168 ++++++++++
 ...44e17d258106617b0e6d783d073b188a2548.patch | 296 ------------------
 ...bb461f040b90453bc4e100dcf967243ecd98.patch |  30 --
 ...bkitgtk_2.38.5.bb =3D&gt; webkitgtk_2.39.91.bb} |  70 +++--
 ...fdo_1.14.0.bb =3D&gt; wpebackend-fdo_1.14.1.bb} |   2 +-
 8 files changed, 258 insertions(+), 361 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk =3D&gt; files}/0001-FindGObject=
Introspection.cmake-prefix-variables-obta.patch (100%)
 create mode 100644 meta/recipes-sato/webkit/files/0001-fix-after-remove-of=
-WebKitJavascriptResult.patch
 rename meta/recipes-sato/webkit/{webkitgtk =3D&gt; files}/reproducibility.=
patch (100%)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk-4_2.39.91.bb
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b=
0e6d783d073b188a2548.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453b=
c4e100dcf967243ecd98.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.38.5.bb =3D&gt; webkitgtk_2.3=
9.91.bb} (75%)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.14.0.bb =3D&gt; wpebacke=
nd-fdo_1.14.1.bb} (90%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospecti=
on.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/files/0001-=
FindGObjectIntrospection.cmake-prefix-variables-obta.patch
similarity index 100%
rename from meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospectio=
n.cmake-prefix-variables-obta.patch
rename to meta/recipes-sato/webkit/files/0001-FindGObjectIntrospection.cmak=
e-prefix-variables-obta.patch
diff --git a/meta/recipes-sato/webkit/files/0001-fix-after-remove-of-WebKit=
JavascriptResult.patch b/meta/recipes-sato/webkit/files/0001-fix-after-remo=
ve-of-WebKitJavascriptResult.patch
new file mode 100644
index 0000000000..d22d47c94a
--- /dev/null
+++ b/meta/recipes-sato/webkit/files/0001-fix-after-remove-of-WebKitJavascr=
iptResult.patch
@@ -0,0 +1,53 @@
+Upstream-Status: Pending
+
+--- a/Source/WebKit/UIProcess/API/glib/WebKitWebView.h.in	2023-03-09 16:12=
:15.019122873 +0100
++++ b/Source/WebKit/UIProcess/API/glib/WebKitWebView.h.in	2023-03-09 16:14=
:54.879735391 +0100
+@@ -36,7 +36,6 @@
+ #include &lt;@API_INCLUDE_PREFIX@/WebKitFormSubmissionRequest.h&gt;
+ #include &lt;@API_INCLUDE_PREFIX@/WebKitHitTestResult.h&gt;
+ #include &lt;@API_INCLUDE_PREFIX@/WebKitInputMethodContext.h&gt;
+-#include &lt;@API_INCLUDE_PREFIX@/WebKitJavascriptResult.h&gt;
+ #include &lt;@API_INCLUDE_PREFIX@/WebKitNavigationAction.h&gt;
+ #include &lt;@API_INCLUDE_PREFIX@/WebKitNotification.h&gt;
+ #include &lt;@API_INCLUDE_PREFIX@/WebKitOptionMenu.h&gt;
+@@ -58,6 +57,10 @@
+ #include &lt;@API_INCLUDE_PREFIX@/WebKitNetworkSession.h&gt;
+ #endif
+=20
++#if !ENABLE(2022_GLIB_API)
++#include &lt;@API_INCLUDE_PREFIX@/WebKitJavascriptResult.h&gt;
++#endif
++
+ #if PLATFORM(GTK)
+ #if !ENABLE(2022_GLIB_API)
+ #include &lt;JavaScriptCore/JSBase.h&gt;
+--- a/Source/WebKit/UIProcess/API/glib/WebKitAutocleanups.h.in	2023-03-09 =
16:24:31.886464831 +0100
++++ b/Source/WebKit/UIProcess/API/glib/WebKitAutocleanups.h.in	2023-03-09 =
16:25:41.333364986 +0100
+@@ -47,6 +47,7 @@
+ G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitHitTestResult, g_object_unref)
+ G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitInputMethodContext, g_object_unref)
+ G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitInstallMissingMediaPluginsPermission=
Request, g_object_unref)
++G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitJavascriptResult, webkit_javascript_=
result_unref)
+ G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitNavigationPolicyDecision, g_object_u=
nref)
+ G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitMimeInfo, webkit_mime_info_unref)
+ G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitNotification, g_object_unref)
+@@ -87,7 +88,6 @@
+ G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitCredential, webkit_credential_free)
+ G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitITPFirstParty, webkit_itp_first_part=
y_unref)
+ G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitITPThirdParty, webkit_itp_third_part=
y_unref)
+-G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitJavascriptResult, webkit_javascript_=
result_unref)
+ G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitMemoryPressureSettings, webkit_memor=
y_pressure_settings_free)
+ G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitNavigationAction, webkit_navigation_=
action_free)
+ G_DEFINE_AUTOPTR_CLEANUP_FUNC (WebKitNetworkProxySettings, webkit_network=
_proxy_settings_free)
+--- a/Source/WebKit/UIProcess/API/glib/WebKitJavascriptResultPrivate.h	202=
3-03-09 16:33:19.420786155 +0100
++++ b/Source/WebKit/UIProcess/API/glib/WebKitJavascriptResultPrivate.h	202=
3-03-09 16:34:07.046094617 +0100
+@@ -20,8 +20,8 @@
+ #pragma once
+=20
+ #include &lt;WebCore/SerializedScriptValue.h&gt;
+-#include "WebKitJavascriptResult.h"
+=20
+ #if !ENABLE(2022_GLIB_API)
++#include "WebKitJavascriptResult.h"
+ WebKitJavascriptResult* webkitJavascriptResultCreate(WebCore::SerializedS=
criptValue&amp;);
+ #endif
diff --git a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch b/met=
a/recipes-sato/webkit/files/reproducibility.patch
similarity index 100%
rename from meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
rename to meta/recipes-sato/webkit/files/reproducibility.patch
diff --git a/meta/recipes-sato/webkit/webkitgtk-4_2.39.91.bb b/meta/recipes=
-sato/webkit/webkitgtk-4_2.39.91.bb
new file mode 100644
index 0000000000..dde573064a
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk-4_2.39.91.bb
@@ -0,0 +1,168 @@
+SUMMARY =3D "WebKit web rendering engine for the GTK+ platform"
+HOMEPAGE =3D "<a href=3D"https://www.webkitgtk.org/">https://www.webkitgtk=
.org/</a>"
+BUGTRACKER =3D "<a href=3D"https://bugs.webkit.org/">https://bugs.webkit.o=
rg/</a>"
+
+LICENSE =3D "BSD-2-Clause &amp; LGPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "<a href=3D"file://Source/JavaScriptCore/COPYING.LIB;=
md5=3Dd0c6d6397a5d84286dda758da57bd691">file://Source/JavaScriptCore/COPYIN=
G.LIB;md5=3Dd0c6d6397a5d84286dda758da57bd691</a> \
+                    <a href=3D"file://Source/WebCore/LICENSE-APPLE;md5=3D4=
646f90082c40bcf298c285f8bab0b12">file://Source/WebCore/LICENSE-APPLE;md5=3D=
4646f90082c40bcf298c285f8bab0b12</a> \
+                    <a href=3D"file://Source/WebCore/LICENSE-LGPL-2;md5=3D=
36357ffde2b64ae177b2494445b79d21">file://Source/WebCore/LICENSE-LGPL-2;md5=
=3D36357ffde2b64ae177b2494445b79d21</a> \
+                    <a href=3D"file://Source/WebCore/LICENSE-LGPL-2.1;md5=
=3Da778a33ef338abbaf8b8a7c36b6eec80">file://Source/WebCore/LICENSE-LGPL-2.1=
;md5=3Da778a33ef338abbaf8b8a7c36b6eec80</a> \
+                    "
+
+SRC_URI =3D "<a href=3D"https://www.webkitgtk.org/releases/webkitgtk-${PV}=
.tar.xz">https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz</a> \
+           <a href=3D"file://0001-FindGObjectIntrospection.cmake-prefix-va=
riables-obta.patch">file://0001-FindGObjectIntrospection.cmake-prefix-varia=
bles-obta.patch</a> \
+           <a href=3D"file://reproducibility.patch">file://reproducibility=
.patch</a> \
+           "
+SRC_URI[sha256sum] =3D "92e8a6f599450529eb0bd552e4fc2d1f691831eb4d89caffb9=
6fb581d2c836d3"
+
+S =3D "${WORKDIR}/webkitgtk-${PV}"
+
+inherit ccache cmake pkgconfig gobject-introspection perlnative features_c=
heck upstream-version-is-even gi-docgen mime-xdg
+
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
+
+CVE_PRODUCT =3D "webkitgtk webkitgtk\+"
+
+DEPENDS +=3D " \
+          atk \
+          cairo \
+          gperf-native \
+          gstreamer1.0 \
+          gstreamer1.0-plugins-base \
+          gstreamer1.0-plugins-bad \
+          <a href=3D"mailto:${@bb.utils.contains">${@bb.utils.contains</a>=
('LICENSE_FLAGS', 'commercial', 'gstreamer1.0-libav', '', d)} \
+          gtk+3 \
+          harfbuzz \
+          jpeg \
+          libnotify \
+          libsoup \
+          libtasn1 \
+          libwebp \
+          libxslt \
+          ruby-native \
+          unifdef-native \
+          "
+
+PACKAGECONFIG ??=3D "<a href=3D"mailto:${@bb.utils.filter">${@bb.utils.fil=
ter</a>('DISTRO_FEATURES', 'wayland x11 opengl', d)} \
+                   <a href=3D"mailto:${@bb.utils.contains">${@bb.utils.con=
tains</a>('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
+                   <a href=3D"mailto:${@bb.utils.contains">${@bb.utils.con=
tains</a>('DISTRO_FEATURES', 'wayland opengl', 'webgl gles2', '', d)} \
+                   <a href=3D"mailto:${@bb.utils.contains">${@bb.utils.con=
tains</a>('DISTRO_FEATURES', 'systemd', 'journald', '', d)} \
+                   enchant \
+                   libsecret \
+                  "
+
+PACKAGECONFIG[wayland] =3D "-DENABLE_WAYLAND_TARGET=3DON,-DENABLE_WAYLAND_=
TARGET=3DOFF,wayland wayland-native libwpe wpebackend-fdo"
+PACKAGECONFIG[angle] =3D "-DUSE_ANGLE_EGL=3DON,-DUSE_ANGLE_EGL=3DOFF,virtu=
al/egl"
+PACKAGECONFIG[bubblewrap] =3D "-DENABLE_BUBBLEWRAP_SANDBOX=3DON,-DENABLE_B=
UBBLEWRAP_SANDBOX=3DOFF,bubblewrap-native libseccomp xdg-dbus-proxy-native,=
bubblewrap xdg-dbus-proxy"
+PACKAGECONFIG[x11] =3D "-DENABLE_X11_TARGET=3DON,-DENABLE_X11_TARGET=3DOFF=
,virtual/libx11 libxcomposite libxdamage libxrender libxt"
+PACKAGECONFIG[libavif] =3D "-DUSE_AVIF=3DON,-DUSE_AVIF=3DOFF,libavif"
+PACKAGECONFIG[gamepad] =3D "-DENABLE_GAMEPAD=3DON,-DENABLE_GAMEPAD=3DOFF,l=
ibmanette"
+PACKAGECONFIG[geoclue] =3D "-DENABLE_GEOLOCATION=3DON,-DENABLE_GEOLOCATION=
=3DOFF,geoclue"
+PACKAGECONFIG[enchant] =3D "-DENABLE_SPELLCHECK=3DON,-DENABLE_SPELLCHECK=
=3DOFF,enchant2"
+PACKAGECONFIG[gles2] =3D "-DENABLE_GLES2=3DON,-DENABLE_GLES2=3DOFF,virtual=
/libgles2"
+PACKAGECONFIG[webgl] =3D "-DENABLE_WEBGL=3DON,-DENABLE_WEBGL=3DOFF,virtual=
/egl"
+PACKAGECONFIG[opengl] =3D "-DUSE_OPENGL_OR_ES=3DON,-DUSE_OPENGL_OR_ES=3DOF=
F,virtual/egl libepoxy"
+PACKAGECONFIG[libsecret] =3D "-DUSE_LIBSECRET=3DON,-DUSE_LIBSECRET=3DOFF,l=
ibsecret"
+PACKAGECONFIG[libhyphen] =3D "-DUSE_LIBHYPHEN=3DON,-DUSE_LIBHYPHEN=3DOFF,l=
ibhyphen"
+PACKAGECONFIG[woff2] =3D "-DUSE_WOFF2=3DON,-DUSE_WOFF2=3DOFF,woff2"
+PACKAGECONFIG[openjpeg] =3D "-DUSE_OPENJPEG=3DON,-DUSE_OPENJPEG=3DOFF,open=
jpeg"
+PACKAGECONFIG[reduce-size] =3D "-DCMAKE_BUILD_TYPE=3DMinSizeRel,-DCMAKE_BU=
ILD_TYPE=3DRelease,,"
+PACKAGECONFIG[lcms] =3D "-DUSE_LCMS=3DON,-DUSE_LCMS=3DOFF,lcms"
+PACKAGECONFIG[journald] =3D "-DENABLE_JOURNALD_LOG=3DON,-DENABLE_JOURNALD_=
LOG=3DOFF,systemd"
+
+# webkitgtk is full of /usr/bin/env python, particular for generating docs
+do_configure[postfuncs] +=3D "setup_python_link"
+setup_python_link() {
+	if [ ! -e ${STAGING_BINDIR_NATIVE}/python ]; then
+		ln -s `which python3` ${STAGING_BINDIR_NATIVE}/python
+	fi
+}
+
+EXTRA_OECMAKE =3D " \
+		-DENABLE_2022_GLIB_API=3DOFF \
+		-DPORT=3DGTK \
+		-DUSE_GTK4=3DOFF \
+		-DUSE_XDGMIME=3DON \
+		-DBWRAP_EXECUTABLE=3D${bindir}/bwrap \
+		-DDBUS_PROXY_EXECUTABLE=3D${bindir}/xdg-dbus-proxy \
+		<a href=3D"mailto:${@bb.utils.contains">${@bb.utils.contains</a>('GI_DAT=
A_ENABLED', 'True', '-DENABLE_INTROSPECTION=3DON', '-DENABLE_INTROSPECTION=
=3DOFF', d)} \
+		<a href=3D"mailto:${@bb.utils.contains">${@bb.utils.contains</a>('GIDOCG=
EN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=3DON', '-DENABLE_DOCUMENTATION=
=3DOFF', d)} \
+		-DENABLE_MINIBROWSER=3DON \
+                -DPYTHON_EXECUTABLE=3D`which python3` \
+		"
+
+# Javascript JIT is not supported on ARC
+EXTRA_OECMAKE:append:arc =3D " -DENABLE_JIT=3DOFF "
+# By default 25-bit "medium" calls are used on ARC
+# which is not enough for binaries larger than 32 MiB
+CFLAGS:append:arc =3D " -mlong-calls"
+CXXFLAGS:append:arc =3D " -mlong-calls"
+
+# Needed for non-mesa graphics stacks when x11 is disabled
+CXXFLAGS +=3D "<a href=3D"mailto:${@bb.utils.contains">${@bb.utils.contain=
s</a>('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=3D1', d)}"
+
+# Javascript JIT is not supported on powerpc
+EXTRA_OECMAKE:append:powerpc =3D " -DENABLE_JIT=3DOFF "
+EXTRA_OECMAKE:append:powerpc64 =3D " -DENABLE_JIT=3DOFF "
+
+# ARM JIT code does not build on ARMv4/5/6 anymore
+EXTRA_OECMAKE:append:armv5 =3D " -DENABLE_JIT=3DOFF "
+EXTRA_OECMAKE:append:armv6 =3D " -DENABLE_JIT=3DOFF "
+EXTRA_OECMAKE:append:armv4 =3D " -DENABLE_JIT=3DOFF "
+
+EXTRA_OECMAKE:append:mipsarch =3D " -DUSE_LD_GOLD=3DOFF "
+EXTRA_OECMAKE:append:powerpc =3D " -DUSE_LD_GOLD=3DOFF "
+
+# JIT and gold linker does not work on RISCV
+EXTRA_OECMAKE:append:riscv32 =3D " -DUSE_LD_GOLD=3DOFF -DENABLE_JIT=3DOFF"
+EXTRA_OECMAKE:append:riscv64 =3D " -DUSE_LD_GOLD=3DOFF -DENABLE_JIT=3DOFF"
+
+# JIT not supported on MIPS either
+EXTRA_OECMAKE:append:mipsarch =3D " -DENABLE_JIT=3DOFF -DENABLE_C_LOOP=3DO=
N "
+
+# JIT not supported on X32
+# An attempt was made to upstream JIT support for x32 in
+# <a href=3D"https://bugs.webkit.org/show_bug.cgi?id=3D100450">https://bug=
s.webkit.org/show_bug.cgi?id=3D100450</a>, but this was closed as
+# unresolved due to limited X32 adoption.
+EXTRA_OECMAKE:append:x86-x32 =3D " -DENABLE_JIT=3DOFF "
+
+SECURITY_CFLAGS:remove:aarch64 =3D "-fpie"
+SECURITY_CFLAGS:append:aarch64 =3D " -fPIE"
+
+FILES:${PN} +=3D "${libdir}/webkit2gtk-4.*/injected-bundle"
+
+RRECOMMENDS:${PN} +=3D "ca-certificates shared-mime-info"
+
+# <a href=3D"http://errors.yoctoproject.org/Errors/Details/20370/">http://=
errors.yoctoproject.org/Errors/Details/20370/</a>
+ARM_INSTRUCTION_SET:armv4 =3D "arm"
+ARM_INSTRUCTION_SET:armv5 =3D "arm"
+ARM_INSTRUCTION_SET:armv6 =3D "arm"
+
+# <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9474">htt=
ps://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9474</a>
+# <a href=3D"https://bugs.webkit.org/show_bug.cgi?id=3D159880">https://bug=
s.webkit.org/show_bug.cgi?id=3D159880</a>
+# JSC JIT can build on ARMv7 with -marm, but doesn't work on runtime.
+# Upstream only tests regularly the JSC JIT on ARMv7 with Thumb2 (-mthumb)=
.
+ARM_INSTRUCTION_SET:armv7a =3D "thumb"
+ARM_INSTRUCTION_SET:armv7r =3D "thumb"
+ARM_INSTRUCTION_SET:armv7ve =3D "thumb"
+
+# introspection inside qemu-arm hangs forever on musl/arm builds
+# therefore disable GI_DATA
+GI_DATA_ENABLED:libc-musl:armv7a =3D "False"
+GI_DATA_ENABLED:libc-musl:armv7ve =3D "False"
+
+PACKAGE_PREPROCESS_FUNCS +=3D "src_package_preprocess"
+src_package_preprocess () {
+        # Trim build paths from comments in generated sources to ensure re=
producibility
+        sed -i -e "s,${WORKDIR},,g" \
+            ${B}/JavaScriptCore/DerivedSources/*.h \
+            ${B}/JavaScriptCore/DerivedSources/yarr/*.h \
+            ${B}/JavaScriptCore/PrivateHeaders/JavaScriptCore/*.h \
+            ${B}/WebKitGTK/DerivedSources/webkit/*.cpp \
+            ${B}/WebKitGTK/DerivedSources/webkit/*.h
+}
+
+do_install:append() {
+	# webkitwebdriver conflicts between webkitgtk and webkitgtk-4 ... move
+	mv ${D}${bindir}/WebKitWebDriver ${D}${bindir}/WebKitWebDriver-4
+}
diff --git a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783=
d073b188a2548.patch b/meta/recipes-sato/webkit/webkitgtk/0d3344e17d25810661=
7b0e6d783d073b188a2548.patch
deleted file mode 100644
index 32f92f7ff5..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b18=
8a2548.patch
+++ /dev/null
@@ -1,296 +0,0 @@
-From 0d3344e17d258106617b0e6d783d073b188a2548 Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro &lt;<a href=3D"mailto:aperez@igalia.com">aper=
ez@igalia.com</a>&gt;
-Date: Thu, 2 Jun 2022 11:19:06 +0300
-Subject: [PATCH] [ARM][NEON] FELightningNEON.cpp fails to build, NEON fast
- path seems unused <a href=3D"https://bugs.webkit.org/show_bug.cgi?id=3D24=
1182">https://bugs.webkit.org/show_bug.cgi?id=3D241182</a>
-
-Reviewed by NOBODY (OOPS!).
-
-Move the NEON fast path for the SVG lighting filter effects into
-FELightingSoftwareApplier, and arrange to actually use them by
-forwarding calls to applyPlatformGeneric() into applyPlatformNeon().
-
-Some changes were needed to adapt platformApplyNeon() to the current
-state of filters after r286140. This was not detected because the code
-bitrotted due to it being guarded with CPU(ARM_TRADITIONAL), which does
-not get used much these days: CPU(ARM_THUMB2) is more common. It should
-be possible to use the NEON fast paths also in Thumb mode, but that is
-left for a follow-up fix.
-
-* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp:
-(WebCore::FELightingSoftwareApplier::platformApplyNeonWorker):
-(WebCore::FELightingSoftwareApplier::getPowerCoefficients):
-(WebCore::FELighting::platformApplyNeonWorker): Deleted.
-(WebCore::FELighting::getPowerCoefficients): Deleted.
-* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h:
-(WebCore::FELightingSoftwareApplier::applyPlatformNeon):
-(WebCore::FELighting::platformApplyNeon): Deleted.
-* Source/WebCore/platform/graphics/filters/DistantLightSource.h:
-* Source/WebCore/platform/graphics/filters/FELighting.h:
-* Source/WebCore/platform/graphics/filters/PointLightSource.h:
-* Source/WebCore/platform/graphics/filters/SpotLightSource.h:
-* Source/WebCore/platform/graphics/filters/software/FELightingSoftwareAppl=
ier.h:
----
-Upstream-Status: Submitted [<a href=3D"https://github.com/WebKit/WebKit/pu=
ll/1233">https://github.com/WebKit/WebKit/pull/1233</a>]
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;
-
- .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
- .../graphics/cpu/arm/filters/FELightingNEON.h | 54 +++++++++----------
- .../graphics/filters/DistantLightSource.h     |  4 ++
- .../platform/graphics/filters/FELighting.h    |  7 ---
- .../graphics/filters/PointLightSource.h       |  4 ++
- .../graphics/filters/SpotLightSource.h        |  4 ++
- .../software/FELightingSoftwareApplier.h      | 16 ++++++
- 7 files changed, 57 insertions(+), 36 deletions(-)
-
---- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
-+++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
-@@ -49,7 +49,7 @@ short* feLightingConstantsForNeon()
-     return s_FELightingConstantsForNeon;
- }
-=20
--void FELighting::platformApplyNeonWorker(FELightingPaintingDataForNeon* p=
arameters)
-+void FELightingSoftwareApplier::platformApplyNeonWorker(FELightingPaintin=
gDataForNeon* parameters)
- {
-     neonDrawLighting(parameters);
- }
-@@ -464,7 +464,7 @@ TOSTRING(neonDrawLighting) ":" NL
-     "b .lightStrengthCalculated" NL
- ); // NOLINT
-=20
--int FELighting::getPowerCoefficients(float exponent)
-+int FELightingSoftwareApplier::getPowerCoefficients(float exponent)
- {
-     // Calling a powf function from the assembly code would require to sa=
ve
-     // and reload a lot of NEON registers. Since the base is in range [0.=
.1]
---- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
-+++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
-@@ -24,14 +24,15 @@
-  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-  */
-=20
--#ifndef FELightingNEON_h
--#define FELightingNEON_h
-+#pragma once
-=20
- #if CPU(ARM_NEON) &amp;&amp; CPU(ARM_TRADITIONAL) &amp;&amp; COMPILER(GCC=
_COMPATIBLE)
-=20
--#include "FELighting.h"
-+#include "FELightingSoftwareApplier.h"
-+#include "ImageBuffer.h"
- #include "PointLightSource.h"
- #include "SpotLightSource.h"
-+#include &lt;wtf/ObjectIdentifier.h&gt;
- #include &lt;wtf/ParallelJobs.h&gt;
-=20
- namespace WebCore {
-@@ -93,14 +94,14 @@ extern "C" {
- void neonDrawLighting(FELightingPaintingDataForNeon*);
- }
-=20
--inline void FELighting::platformApplyNeon(const LightingData&amp; data, c=
onst LightSource::PaintingData&amp; paintingData)
-+inline void FELightingSoftwareApplier::applyPlatformNeon(const FELighting=
SoftwareApplier::LightingData&amp; data, const LightSource::PaintingData&am=
p; paintingData)
- {
--    alignas(16) FELightingFloatArgumentsForNeon floatArguments;
--    FELightingPaintingDataForNeon neonData =3D {
-+    WebCore::FELightingFloatArgumentsForNeon alignas(16) floatArguments;
-+    WebCore::FELightingPaintingDataForNeon neonData =3D {
-         data.pixels-&gt;data(),
-         1,
--        data.widthDecreasedByOne - 1,
--        data.heightDecreasedByOne - 1,
-+        data.width - 2,
-+        data.height - 2,
-         0,
-         0,
-         0,
-@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeo
-     // Set light source arguments.
-     floatArguments.constOne =3D 1;
-=20
--    auto color =3D m_lightingColor.toColorTypeLossy&lt;SRGBA&lt;uint8_t&g=
t;&gt;().resolved();
-+    auto color =3D data.lightingColor.toColorTypeLossy&lt;SRGBA&lt;uint8_=
t&gt;&gt;().resolved();
-=20
-     floatArguments.colorRed =3D color.red;
-     floatArguments.colorGreen =3D color.green;
-     floatArguments.colorBlue =3D color.blue;
-     floatArguments.padding4 =3D 0;
-=20
--    if (m_lightSource-&gt;type() =3D=3D LS_POINT) {
-+    if (data.lightSource-&gt;type() =3D=3D LS_POINT) {
-         neonData.flags |=3D FLAG_POINT_LIGHT;
--        PointLightSource&amp; pointLightSource =3D static_cast&lt;PointLi=
ghtSource&amp;&gt;(m_lightSource.get());
-+        const auto&amp; pointLightSource =3D *static_cast&lt;const PointL=
ightSource*&gt;(data.lightSource);
-         floatArguments.lightX =3D pointLightSource.position().x();
-         floatArguments.lightY =3D pointLightSource.position().y();
-         floatArguments.lightZ =3D pointLightSource.position().z();
-         floatArguments.padding2 =3D 0;
--    } else if (m_lightSource-&gt;type() =3D=3D LS_SPOT) {
-+    } else if (data.lightSource-&gt;type() =3D=3D LS_SPOT) {
-         neonData.flags |=3D FLAG_SPOT_LIGHT;
--        SpotLightSource&amp; spotLightSource =3D static_cast&lt;SpotLight=
Source&amp;&gt;(m_lightSource.get());
-+        const auto&amp; spotLightSource =3D *static_cast&lt;const SpotLig=
htSource*&gt;(data.lightSource);
-         floatArguments.lightX =3D spotLightSource.position().x();
-         floatArguments.lightY =3D spotLightSource.position().y();
-         floatArguments.lightZ =3D spotLightSource.position().z();
-@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeo
-         if (spotLightSource.specularExponent() =3D=3D 1)
-             neonData.flags |=3D FLAG_CONE_EXPONENT_IS_1;
-     } else {
--        ASSERT(m_lightSource-&gt;type() =3D=3D LS_DISTANT);
-+        ASSERT(data.lightSource-&gt;type() =3D=3D LS_DISTANT);
-         floatArguments.lightX =3D paintingData.initialLightingData.lightV=
ector.x();
-         floatArguments.lightY =3D paintingData.initialLightingData.lightV=
ector.y();
-         floatArguments.lightZ =3D paintingData.initialLightingData.lightV=
ector.z();
-@@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeo
-     // Set lighting arguments.
-     floatArguments.surfaceScale =3D data.surfaceScale;
-     floatArguments.minusSurfaceScaleDividedByFour =3D -data.surfaceScale =
/ 4;
--    if (m_lightingType =3D=3D FELighting::DiffuseLighting)
--        floatArguments.diffuseConstant =3D m_diffuseConstant;
-+    if (data.filterType =3D=3D FilterEffect::Type::FEDiffuseLighting)
-+        floatArguments.diffuseConstant =3D data.diffuseConstant;
-     else {
-         neonData.flags |=3D FLAG_SPECULAR_LIGHT;
--        floatArguments.diffuseConstant =3D m_specularConstant;
--        neonData.specularExponent =3D getPowerCoefficients(m_specularExpo=
nent);
--        if (m_specularExponent =3D=3D 1)
-+        floatArguments.diffuseConstant =3D data.specularConstant;
-+        neonData.specularExponent =3D getPowerCoefficients(data.specularE=
xponent);
-+        if (data.specularExponent =3D=3D 1)
-             neonData.flags |=3D FLAG_SPECULAR_EXPONENT_IS_1;
-     }
-     if (floatArguments.diffuseConstant =3D=3D 1)
-         neonData.flags |=3D FLAG_DIFFUSE_CONST_IS_1;
-=20
--    int optimalThreadNumber =3D ((data.widthDecreasedByOne - 1) * (data.h=
eightDecreasedByOne - 1)) / s_minimalRectDimension;
-+    static constexpr int minimalRectDimension =3D 100 * 100; // Empirical=
 data limit for parallel jobs
-+    int optimalThreadNumber =3D ((data.width - 2) * (data.height - 2)) / =
minimalRectDimension;
-     if (optimalThreadNumber &gt; 1) {
-         // Initialize parallel jobs
--        ParallelJobs&lt;FELightingPaintingDataForNeon&gt; parallelJobs(&a=
mp;WebCore::FELighting::platformApplyNeonWorker, optimalThreadNumber);
-+        ParallelJobs&lt;FELightingPaintingDataForNeon&gt; parallelJobs(&a=
mp;FELightingSoftwareApplier::platformApplyNeonWorker, optimalThreadNumber)=
;
-=20
-         // Fill the parameter array
-         int job =3D parallelJobs.numberOfJobs();
-         if (job &gt; 1) {
-             int yStart =3D 1;
--            int yStep =3D (data.heightDecreasedByOne - 1) / job;
-+            int yStep =3D (data.height - 2) / job;
-             for (--job; job &gt;=3D 0; --job) {
-                 FELightingPaintingDataForNeon&amp; params =3D parallelJob=
s.parameter(job);
-                 params =3D neonData;
-                 params.yStart =3D yStart;
--                params.pixels +=3D (yStart - 1) * (data.widthDecreasedByO=
ne + 1) * 4;
-+                params.pixels +=3D (yStart - 1) * data.width * 4;
-                 if (job &gt; 0) {
-                     params.absoluteHeight =3D yStep;
-                     yStart +=3D yStep;
-                 } else
--                    params.absoluteHeight =3D data.heightDecreasedByOne -=
 yStart;
-+                    params.absoluteHeight =3D (data.height - 1) - yStart;
-             }
-             parallelJobs.execute();
-             return;
-@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeo
- } // namespace WebCore
-=20
- #endif // CPU(ARM_NEON) &amp;&amp; COMPILER(GCC_COMPATIBLE)
--
--#endif // FELightingNEON_h
---- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
-+++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
-@@ -25,6 +25,10 @@
- #include "LightSource.h"
- #include &lt;wtf/Ref.h&gt;
-=20
-+namespace WTF {
-+class TextStream;
-+} // namespace WTF
-+
- namespace WebCore {
-=20
- class DistantLightSource : public LightSource {
---- a/Source/WebCore/platform/graphics/filters/FELighting.h
-+++ b/Source/WebCore/platform/graphics/filters/FELighting.h
-@@ -35,8 +35,6 @@
-=20
- namespace WebCore {
-=20
--struct FELightingPaintingDataForNeon;
--
- class FELighting : public FilterEffect {
- public:
-     const Color&amp; lightingColor() const { return m_lightingColor; }
-@@ -67,11 +65,6 @@ protected:
-=20
-     std::unique_ptr&lt;FilterEffectApplier&gt; createSoftwareApplier() co=
nst override;
-=20
--#if CPU(ARM_NEON) &amp;&amp; CPU(ARM_TRADITIONAL) &amp;&amp; COMPILER(GCC=
_COMPATIBLE)
--    static int getPowerCoefficients(float exponent);
--    inline void platformApplyNeon(const LightingData&amp;, const LightSou=
rce::PaintingData&amp;);
--#endif
--
-     Color m_lightingColor;
-     float m_surfaceScale;
-     float m_diffuseConstant;
---- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
-+++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
-@@ -26,6 +26,10 @@
- #include "LightSource.h"
- #include &lt;wtf/Ref.h&gt;
-=20
-+namespace WTF {
-+class TextStream;
-+} // namespace WTF
-+
- namespace WebCore {
-=20
- class PointLightSource : public LightSource {
---- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
-+++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
-@@ -26,6 +26,10 @@
- #include "LightSource.h"
- #include &lt;wtf/Ref.h&gt;
-=20
-+namespace WTF {
-+class TextStream;
-+} // namespace WTF
-+
- namespace WebCore {
-=20
- class SpotLightSource : public LightSource {
---- a/Source/WebCore/platform/graphics/filters/software/FELightingSoftware=
Applier.h
-+++ b/Source/WebCore/platform/graphics/filters/software/FELightingSoftware=
Applier.h
-@@ -36,6 +36,7 @@
- namespace WebCore {
-=20
- class FELighting;
-+struct FELightingPaintingDataForNeon;
-=20
- class FELightingSoftwareApplier final : public FilterEffectConcreteApplie=
r&lt;FELighting&gt; {
-     WTF_MAKE_FAST_ALLOCATED;
-@@ -132,8 +133,23 @@ private:
-=20
-     static void applyPlatformGenericPaint(const LightingData&amp;, const =
LightSource::PaintingData&amp;, int startY, int endY);
-     static void applyPlatformGenericWorker(ApplyParameters*);
-+
-+#if CPU(ARM_NEON) &amp;&amp; CPU(ARM_TRADITIONAL) &amp;&amp; COMPILER(GCC=
_COMPATIBLE)
-+    static int getPowerCoefficients(float exponent);
-+    static void platformApplyNeonWorker(FELightingPaintingDataForNeon*);
-+    inline static void applyPlatformNeon(const LightingData&amp;, const L=
ightSource::PaintingData&amp;);
-+
-+    inline static void applyPlatformGeneric(const LightingData&amp; data,=
 const LightSource::PaintingData&amp; paintingData)
-+    {
-+        applyPlatformNeon(data, paintingData);
-+    }
-+#else
-     static void applyPlatformGeneric(const LightingData&amp;, const Light=
Source::PaintingData&amp;);
-+#endif
-+
-     static void applyPlatform(const LightingData&amp;);
- };
-=20
- } // namespace WebCore
-+
-+#include "FELightingNEON.h"
diff --git a/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100d=
cf967243ecd98.patch b/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b9045=
3bc4e100dcf967243ecd98.patch
deleted file mode 100644
index 1ff9dcea7e..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf96724=
3ecd98.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From d318bb461f040b90453bc4e100dcf967243ecd98 Mon Sep 17 00:00:00 2001
-From: Michael Catanzaro &lt;<a href=3D"mailto:mcatanzaro@redhat.com">mcata=
nzaro@redhat.com</a>&gt;
-Date: Mon, 16 Jan 2023 16:55:26 -0800
-Subject: [PATCH] WebKitGTK 2.39.4 does not build due to missing #include i=
n
- ANGLE <a href=3D"https://bugs.webkit.org/show_bug.cgi?id=3D250689">https:=
//bugs.webkit.org/show_bug.cgi?id=3D250689</a>
-
-Unreviewed build fix.
-
-* Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h:
-
-Canonical link: <a href=3D"https://commits.webkit.org/258968@main">https:/=
/commits.webkit.org/258968@main</a>
-
-Upstream-Status: Backport [<a href=3D"https://bugs.webkit.org/show_bug.cgi=
?id=3D250689">https://bugs.webkit.org/show_bug.cgi?id=3D250689</a>]
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;
----
- Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h b/Source=
/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h
-index 94cb93e01fc0..ec7bda372f30 100644
---- a/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h
-+++ b/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h
-@@ -12,6 +12,7 @@
-=20
- #include &lt;algorithm&gt;
- #include &lt;array&gt;
-+#include &lt;cstdint&gt;
- #include &lt;string&gt;
- #include &lt;vector&gt;
-=20
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb b/meta/recipes-sa=
to/webkit/webkitgtk_2.39.91.bb
similarity index 75%
rename from meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.39.91.bb
index e52920883a..30ed0be743 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.39.91.bb
@@ -12,62 +12,63 @@ LIC_FILES_CHKSUM =3D "file://Source/JavaScriptCore/COPY=
ING.LIB;md5=3Dd0c6d6397a5d842
 SRC_URI =3D "<a href=3D"https://www.webkitgtk.org/releases/${BPN}-${PV}.ta=
r.xz">https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz</a> \
            <a href=3D"file://0001-FindGObjectIntrospection.cmake-prefix-va=
riables-obta.patch">file://0001-FindGObjectIntrospection.cmake-prefix-varia=
bles-obta.patch</a> \
            <a href=3D"file://reproducibility.patch">file://reproducibility=
.patch</a> \
-           <a href=3D"file://0d3344e17d258106617b0e6d783d073b188a2548.patc=
h">file://0d3344e17d258106617b0e6d783d073b188a2548.patch</a> \
-           <a href=3D"file://d318bb461f040b90453bc4e100dcf967243ecd98.patc=
h">file://d318bb461f040b90453bc4e100dcf967243ecd98.patch</a> \
+           <a href=3D"file://0001-fix-after-remove-of-WebKitJavascriptResu=
lt.patch">file://0001-fix-after-remove-of-WebKitJavascriptResult.patch</a> =
\
            "
-SRC_URI[sha256sum] =3D "40c20c43022274df5893f22b1054fa894c3eea057389bb08ae=
e08c5b0bb0c1a7"
+SRC_URI[sha256sum] =3D "92e8a6f599450529eb0bd552e4fc2d1f691831eb4d89caffb9=
6fb581d2c836d3"
=20
-inherit cmake pkgconfig gobject-introspection perlnative features_check up=
stream-version-is-even gi-docgen
+inherit cmake ccache pkgconfig gobject-introspection perlnative features_c=
heck upstream-version-is-even gi-docgen mime-xdg
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
-REQUIRED_DISTRO_FEATURES =3D "<a href=3D"mailto:${@bb.utils.contains">${@b=
b.utils.contains</a>('DISTRO_FEATURES', 'wayland', 'opengl', '', d)}"
+REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
 CVE_PRODUCT =3D "webkitgtk webkitgtk\+"
=20
 DEPENDS +=3D " \
-          ruby-native \
-          gperf-native \
+          atk \
           cairo \
+          gperf-native \
+          gstreamer1.0 \
+          gstreamer1.0-plugins-base \
+          gstreamer1.0-plugins-bad \
+          <a href=3D"mailto:${@bb.utils.contains">${@bb.utils.contains</a>=
('LICENSE_FLAGS', 'commercial', 'gstreamer1.0-libav', '', d)} \
           harfbuzz \
           jpeg \
-          atk \
+          libnotify \
+          libsoup \
+          libtasn1 \
           libwebp \
-          gtk+3 \
           libxslt \
-          libtasn1 \
-          libnotify \
-          gstreamer1.0 \
-          gstreamer1.0-plugins-base \
+          ruby-native \
+          unifdef-native \
           "
=20
-PACKAGECONFIG_SOUP ?=3D "soup3"
-PACKAGECONFIG ??=3D "<a href=3D"mailto:${@bb.utils.filter">${@bb.utils.fil=
ter</a>('DISTRO_FEATURES', 'systemd wayland x11', d)} \
+PACKAGECONFIG ??=3D "<a href=3D"mailto:${@bb.utils.filter">${@bb.utils.fil=
ter</a>('DISTRO_FEATURES', 'wayland x11 opengl', d)} \
                    <a href=3D"mailto:${@bb.utils.contains">${@bb.utils.con=
tains</a>('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
-                   <a href=3D"mailto:${@bb.utils.contains">${@bb.utils.con=
tains</a>('DISTRO_FEATURES', 'x11', '', 'webgl gles2', d)} \
-                   <a href=3D"mailto:${@bb.utils.contains">${@bb.utils.con=
tains</a>('DISTRO_FEATURES', 'opengl', 'opengl-or-es', '', d)} \
+                   <a href=3D"mailto:${@bb.utils.contains">${@bb.utils.con=
tains</a>('DISTRO_FEATURES', 'wayland opengl', 'webgl gles2', '', d)} \
+                   <a href=3D"mailto:${@bb.utils.contains">${@bb.utils.con=
tains</a>('DISTRO_FEATURES', 'systemd', 'journald', '', d)} \
+                   gtk4 \
                    enchant \
                    libsecret \
-                   ${PACKAGECONFIG_SOUP} \
                   "
=20
-PACKAGECONFIG[wayland] =3D "-DENABLE_WAYLAND_TARGET=3DON,-DENABLE_WAYLAND_=
TARGET=3DOFF,wayland libwpe wpebackend-fdo wayland-native"
-PACKAGECONFIG[angle] =3D "-DUSE_ANGLE_WEBGL=3DON,-DUSE_ANGLE_WEBGL=3DOFF"
+PACKAGECONFIG[wayland] =3D "-DENABLE_WAYLAND_TARGET=3DON,-DENABLE_WAYLAND_=
TARGET=3DOFF,wayland wayland-native libwpe wpebackend-fdo"
+PACKAGECONFIG[angle] =3D "-DUSE_ANGLE_EGL=3DON,-DUSE_ANGLE_EGL=3DOFF,virtu=
al/egl"
+PACKAGECONFIG[bubblewrap] =3D "-DENABLE_BUBBLEWRAP_SANDBOX=3DON,-DENABLE_B=
UBBLEWRAP_SANDBOX=3DOFF,bubblewrap-native libseccomp xdg-dbus-proxy-native,=
bubblewrap xdg-dbus-proxy"
 PACKAGECONFIG[x11] =3D "-DENABLE_X11_TARGET=3DON,-DENABLE_X11_TARGET=3DOFF=
,virtual/libx11 libxcomposite libxdamage libxrender libxt"
+PACKAGECONFIG[libavif] =3D "-DUSE_AVIF=3DON,-DUSE_AVIF=3DOFF,libavif"
+PACKAGECONFIG[gtk4] =3D "-DUSE_GTK4=3DON,-DUSE_GTK4=3DOFF,gtk4"
+PACKAGECONFIG[gamepad] =3D "-DENABLE_GAMEPAD=3DON,-DENABLE_GAMEPAD=3DOFF,l=
ibmanette"
 PACKAGECONFIG[geoclue] =3D "-DENABLE_GEOLOCATION=3DON,-DENABLE_GEOLOCATION=
=3DOFF,geoclue"
 PACKAGECONFIG[enchant] =3D "-DENABLE_SPELLCHECK=3DON,-DENABLE_SPELLCHECK=
=3DOFF,enchant2"
 PACKAGECONFIG[gles2] =3D "-DENABLE_GLES2=3DON,-DENABLE_GLES2=3DOFF,virtual=
/libgles2"
 PACKAGECONFIG[webgl] =3D "-DENABLE_WEBGL=3DON,-DENABLE_WEBGL=3DOFF,virtual=
/egl"
-PACKAGECONFIG[opengl] =3D "-DENABLE_GRAPHICS_CONTEXT_GL=3DON,-DENABLE_GRAP=
HICS_CONTEXT_GL=3DOFF,virtual/egl"
-PACKAGECONFIG[opengl-or-es] =3D "-DUSE_OPENGL_OR_ES=3DON,-DUSE_OPENGL_OR_E=
S=3DOFF"
+PACKAGECONFIG[opengl] =3D "-DUSE_OPENGL_OR_ES=3DON,-DUSE_OPENGL_OR_ES=3DOF=
F,virtual/egl libepoxy"
 PACKAGECONFIG[libsecret] =3D "-DUSE_LIBSECRET=3DON,-DUSE_LIBSECRET=3DOFF,l=
ibsecret"
 PACKAGECONFIG[libhyphen] =3D "-DUSE_LIBHYPHEN=3DON,-DUSE_LIBHYPHEN=3DOFF,l=
ibhyphen"
 PACKAGECONFIG[woff2] =3D "-DUSE_WOFF2=3DON,-DUSE_WOFF2=3DOFF,woff2"
 PACKAGECONFIG[openjpeg] =3D "-DUSE_OPENJPEG=3DON,-DUSE_OPENJPEG=3DOFF,open=
jpeg"
-PACKAGECONFIG[systemd] =3D "-DUSE_SYSTEMD=3DON,-DUSE_SYSTEMD=3Doff,systemd=
"
 PACKAGECONFIG[reduce-size] =3D "-DCMAKE_BUILD_TYPE=3DMinSizeRel,-DCMAKE_BU=
ILD_TYPE=3DRelease,,"
 PACKAGECONFIG[lcms] =3D "-DUSE_LCMS=3DON,-DUSE_LCMS=3DOFF,lcms"
-PACKAGECONFIG[soup2] =3D "-DUSE_SOUP2=3DON,-DUSE_SOUP2=3DOFF,libsoup-2.4,,=
,soup3"
-PACKAGECONFIG[soup3] =3D ",,libsoup,,,soup2"
 PACKAGECONFIG[journald] =3D "-DENABLE_JOURNALD_LOG=3DON,-DENABLE_JOURNALD_=
LOG=3DOFF,systemd"
=20
 # webkitgtk is full of /usr/bin/env python, particular for generating docs
@@ -79,13 +80,15 @@ setup_python_link() {
 }
=20
 EXTRA_OECMAKE =3D " \
+		-DENABLE_2022_GLIB_API=3DON \
 		-DPORT=3DGTK \
+		-DUSE_XDGMIME=3DON \
+		-DBWRAP_EXECUTABLE=3D${bindir}/bwrap \
+		-DDBUS_PROXY_EXECUTABLE=3D${bindir}/xdg-dbus-proxy \
 		<a href=3D"mailto:${@bb.utils.contains">${@bb.utils.contains</a>('GI_DAT=
A_ENABLED', 'True', '-DENABLE_INTROSPECTION=3DON', '-DENABLE_INTROSPECTION=
=3DOFF', d)} \
 		<a href=3D"mailto:${@bb.utils.contains">${@bb.utils.contains</a>('GIDOCG=
EN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=3DON', '-DENABLE_DOCUMENTATION=
=3DOFF', d)} \
 		-DENABLE_MINIBROWSER=3DON \
                 -DPYTHON_EXECUTABLE=3D`which python3` \
-                -DENABLE_BUBBLEWRAP_SANDBOX=3DOFF \
-                -DENABLE_GAMEPAD=3DOFF \
 		"
=20
 # Javascript JIT is not supported on ARC
@@ -126,7 +129,7 @@ EXTRA_OECMAKE:append:x86-x32 =3D " -DENABLE_JIT=3DOFF "
 SECURITY_CFLAGS:remove:aarch64 =3D "-fpie"
 SECURITY_CFLAGS:append:aarch64 =3D " -fPIE"
=20
-FILES:${PN} +=3D "${libdir}/webkit2gtk-4.*/injected-bundle/libwebkit2gtkin=
jectedbundle.so"
+FILES:${PN} +=3D "${libdir}/webkitgtk-6.*/injected-bundle"
=20
 RRECOMMENDS:${PN} +=3D "ca-certificates shared-mime-info"
=20
@@ -148,9 +151,6 @@ ARM_INSTRUCTION_SET:armv7ve =3D "thumb"
 GI_DATA_ENABLED:libc-musl:armv7a =3D "False"
 GI_DATA_ENABLED:libc-musl:armv7ve =3D "False"
=20
-# Can't be built with ccache
-CCACHE_DISABLE =3D "1"
-
 PACKAGE_PREPROCESS_FUNCS +=3D "src_package_preprocess"
 src_package_preprocess () {
         # Trim build paths from comments in generated sources to ensure re=
producibility
@@ -158,8 +158,10 @@ src_package_preprocess () {
             ${B}/JavaScriptCore/DerivedSources/*.h \
             ${B}/JavaScriptCore/DerivedSources/yarr/*.h \
             ${B}/JavaScriptCore/PrivateHeaders/JavaScriptCore/*.h \
-            ${B}/WebKit2Gtk/DerivedSources/webkit2/*.cpp \
-            ${B}/WebKit2Gtk/DerivedSources/webkit2/*.h
-
+            ${B}/WebKitGTK/DerivedSources/webkit/*.cpp \
+            ${B}/WebKitGTK/DerivedSources/webkit/*.h
 }
=20
+do_install:append() {
+	cp -rf ${B}/JavaScriptCore/Headers/JavaScriptCore ${D}${includedir}
+}
diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb b/meta/recip=
es-sato/webkit/wpebackend-fdo_1.14.1.bb
similarity index 90%
rename from meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb
rename to meta/recipes-sato/webkit/wpebackend-fdo_1.14.1.bb
index 708201043b..9f2ea0b7de 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.14.1.bb
@@ -13,7 +13,7 @@ inherit meson features_check pkgconfig
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
 SRC_URI =3D "<a href=3D"https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz=
">https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz</a>"
-SRC_URI[sha256sum] =3D "e75b0cb2c7145448416e8696013d8883f675c66c11ed750e06=
865efec5809155"
+SRC_URI[sha256sum] =3D "01938dd93c62b3a47b18dd13c70d50490a8b8a6caec23c8550=
a3dbdbcc6bbb50"
=20
 # Especially helps compiling with clang which enable this as error when
 # using c++11
<div>--=20
</div>2.34.1

</div></blockquote></div>
--=-ifLKED47z9idS3ICQ9wO--


