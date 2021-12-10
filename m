Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61021C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 06:01:07 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.3645.1639116065782677773
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 22:01:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.230,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 5A063240007;
	Fri, 10 Dec 2021 06:01:03 +0000 (UTC)
Date: Fri, 10 Dec 2021 07:00:59 +0100
From: Quentin Schulz <foss+yocto@0leil.net>
To: Joshua Watt <jpewhacker@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] webkitgtk: Add packageconfig for libsoup2
In-Reply-To: 
 <CAJdd5GZAwWsFPwpdHWpKmUqNeYFGM+LKwkLB2h6tsZA_ACvr8Q@mail.gmail.com>
References: <20211209204417.3924102-1-JPEWhacker@gmail.com>
 <0784B528-B0F6-4BF6-A0FA-0F69B97441EC@0leil.net>
 <CAJdd5GZAwWsFPwpdHWpKmUqNeYFGM+LKwkLB2h6tsZA_ACvr8Q@mail.gmail.com>
Message-ID: <1E44FFF6-DCE9-4FE9-8478-88386DE0D66A@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 06:01:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159491



On December 9, 2021 11:08:31 PM GMT+01:00, Joshua Watt <jpewhacker@gmail=
=2Ecom> wrote:
>On Thu, Dec 9, 2021 at 3:55 PM Quentin Schulz <foss+yocto@0leil=2Enet> wr=
ote:
>>
>> Hi Joshua,
>>
>> On December 9, 2021 9:44:17 PM GMT+01:00, Joshua Watt <JPEWhacker@gmail=
=2Ecom> wrote:
>> >Adds a PACKAGECONFIG option to use libsoup2 instead of libsoup3=2E
>> >Including libsoup2 and libsoup3 in the same process can cause strange
>> >runtime failures, and the latest release of each major version will
>> >cause the process to exit if either if both are detected on process
>> >startup=2E
>> >
>> >The default is changed from libsoup3 back to libsoup2=2E Most GNOME
>> >packages are still using libsoup2, and a large number of these pull in
>> >webkitgtk either directly or indirectly=2E If webkitgtk uses libsoup3,
>> >this causes all of these packages to fail at startup=2E It appears tha=
t
>> >most GNOME packages will have to switch to libsoup3 when they transiti=
on
>> >to GTK4=2E
>> >
>> >Signed-off-by: Joshua Watt <JPEWhacker@gmail=2Ecom>
>> >---
>> > meta/recipes-sato/webkit/webkitgtk_2=2E34=2E2=2Ebb | 6 ++++--
>> > 1 file changed, 4 insertions(+), 2 deletions(-)
>> >
>> >diff --git a/meta/recipes-sato/webkit/webkitgtk_2=2E34=2E2=2Ebb b/meta=
/recipes-sato/webkit/webkitgtk_2=2E34=2E2=2Ebb
>> >index 413e0cdf92=2E=2E279e260441 100644
>> >--- a/meta/recipes-sato/webkit/webkitgtk_2=2E34=2E2=2Ebb
>> >+++ b/meta/recipes-sato/webkit/webkitgtk_2=2E34=2E2=2Ebb
>> >@@ -38,12 +38,12 @@ DEPENDS =3D " \
>> >           atk \
>> >           libwebp \
>> >           gtk+3 \
>> >-          libsoup \
>> >           libxslt \
>> >           libtasn1 \
>> >           libnotify \
>> >           gstreamer1=2E0 \
>> >           gstreamer1=2E0-plugins-base \
>> >+          ${@bb=2Eutils=2Econtains("PACKAGECONFIG", "soup2", "libsoup=
-2=2E4", "libsoup", d)} \
>> >           "
>> >
>> > PACKAGECONFIG ??=3D "${@bb=2Eutils=2Efilter('DISTRO_FEATURES', 'syste=
md wayland x11', d)} \
>> >@@ -52,6 +52,7 @@ PACKAGECONFIG ??=3D "${@bb=2Eutils=2Efilter('DISTRO_=
FEATURES', 'systemd wayland x11',
>> >                    ${@bb=2Eutils=2Econtains('DISTRO_FEATURES', 'openg=
l', 'opengl-or-es', '', d)} \
>> >                    enchant \
>> >                    libsecret \
>> >+                   soup2 \
>> >                   "
>> >
>> > PACKAGECONFIG[wayland] =3D "-DENABLE_WAYLAND_TARGET=3DON,-DENABLE_WAY=
LAND_TARGET=3DOFF,wayland libwpe wpebackend-fdo wayland-native"
>> >@@ -70,6 +71,7 @@ PACKAGECONFIG[openjpeg] =3D "-DUSE_OPENJPEG=3DON,-DU=
SE_OPENJPEG=3DOFF,openjpeg"
>> > PACKAGECONFIG[systemd] =3D "-DUSE_SYSTEMD=3DON,-DUSE_SYSTEMD=3Doff,sy=
stemd"
>> > PACKAGECONFIG[reduce-size] =3D "-DCMAKE_BUILD_TYPE=3DMinSizeRel,-DCMA=
KE_BUILD_TYPE=3DRelease,,"
>> > PACKAGECONFIG[lcms] =3D "-DUSE_LCMS=3DON,-DUSE_LCMS=3DOFF,lcms"
>> >+PACKAGECONFIG[soup2] =3D "-DUSE_SOUP2=3DON,-DUSE_SOUP2=3DOFF,,"
>> >
>>
>> What about leveraging package conflicts in PACKAGECONFIG?
>>
>> e=2Eg=2E:
>> PACKAGECONFIG[soup2] =3D "-DUSE_SOUP2=3DON,-DUSE_SOUP2=3DOFF,libsoup-2=
=2E4,,,soup"
>> PACKAGECONFIG[soup] =3D ",,libsoup,,,soup2"
>> ?
>> No need for the check on PACKAGECONFIG in depends then=2E
>
>Ya, the weird part there is that if you want libsoup3, you *must* put
>"soup" in PACKAGECONFIG *and* remove soup2, otherwise libsoup won't be
>added to DEPENDS and the build fails=2E
>

I can suggest a solution =C3=A0 la qt package from meta-qt5:
PACKAGECONFIG_LIBSOUP ?=3D "soup2"
PACKAGECONFIG ??=3D "[=2E=2E=2E] ${PACKAGECONFIG_LIBSOUP}"

If you want to make really sure one or the other is selected, you can add =
a check in an anonymous Python function?

This should tackle the "must" part and also allow easy swap in bbappends i=
n addition of making sure libsoup and libsoup-2=2E4 can't be selected at th=
e same time?

What do you think?

On a side note, I feel like this patch could be split in two=2E One for th=
e libsoup switch mechanism and one for switching the default to libsoup-2=
=2E4? I don't think Richard care usually though, so no biggie :)

Cheers,
Quentin

>>
>> > # webkitgtk is full of /usr/bin/env python, particular for generating=
 docs
>> > do_configure[postfuncs] +=3D "setup_python_link"
>> >@@ -124,7 +126,7 @@ EXTRA_OECMAKE:append:x86-x32 =3D " -DENABLE_JIT=3D=
OFF "
>> > SECURITY_CFLAGS:remove:aarch64 =3D "-fpie"
>> > SECURITY_CFLAGS:append:aarch64 =3D " -fPIE"
>> >
>> >-FILES:${PN} +=3D "${libdir}/webkit2gtk-4=2E1/injected-bundle/libwebki=
t2gtkinjectedbundle=2Eso"
>> >+FILES:${PN} +=3D "${libdir}/webkit2gtk-4=2E*/injected-bundle/libwebki=
t2gtkinjectedbundle=2Eso"
>> >
>>
>> Was this change suppose to make it in this commit?
>
>Yes=2E The minor version of the library changes based on libsoup3 (4=2E1)
>vs=2E libsoup2 (4=2E0)
>
>>
>> Cheers,
>> Quentin
>>
>> > RRECOMMENDS:${PN} +=3D "ca-certificates shared-mime-info"
>> >

