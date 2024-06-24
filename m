Return-Path: <sreejith.ravi087@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC756C2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 12:23:11 +0000 (UTC)
Subject: Re: [PATCH] package.bbclass: Fix broken dev package dependency.
To: openembedded-core@lists.openembedded.org
From: "Sreejith Ravi" <sreejith.ravi087@gmail.com>
X-Originating-Location: Richmond, England, GB (90.216.150.195)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 24 Jun 2024 05:23:03 -0700
References: <CANNYZj8eaSiyiAkCHgedu-+3T8ph3ETK_O4aq7T=y_kDCJ1JKA@mail.gmail.com>
In-Reply-To: <CANNYZj8eaSiyiAkCHgedu-+3T8ph3ETK_O4aq7T=y_kDCJ1JKA@mail.gmail.com>
Message-ID: <2056.1719231783802644622@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="8Fu3PTpnIgpIzGKR7dXo"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 12:23:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201080

--8Fu3PTpnIgpIzGKR7dXo
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

We are building the components through Yocto and using dev IPKs for the dep=
endent packages (generated from Yocto) to resolve the build dependencies.

Steps:
1) Generate the libical IPKs from Yocto.
2) Copy the IPKs to a folder and create the local opkg feed.
3) Remove libical from the BlueZ dependencies list.
4) Install the libical-dev IPK from the local feed to the BlueZ recipe sysr=
oot.
4) Build the BlueZ package.

When we tried to build BlueZ from source, by using the libical dev IPK, we =
are getting the error.
"
configure:14460: checking for libical
configure:14467: $PKG_CONFIG --exists --print-errors "libical"
Package icu-i18n was not found in the pkg-config search path.
Perhaps you should add the directory containing `icu-i18n.pc'
to the PKG_CONFIG_PATH environment variable
Package 'icu-i18n', required by 'libical', not found
configure:14470: $? =3D 1
configure:14484: $PKG_CONFIG --exists --print-errors "libical"
Package icu-i18n was not found in the pkg-config search path.
Perhaps you should add the directory containing `icu-i18n.pc'
to the PKG_CONFIG_PATH environment variable
Package 'icu-i18n', required by 'libical', not found
configure:14487: $? =3D 1
configure:14501: result: no
Package 'icu-i18n', required by 'libical', not found
configure:14517: error: libical is required
"

Similarly, when we are trying to build the 'gstreamer1.0_1.18' package, whi=
ch has a dependency on 'glib2-0,' and using the glib2-0 dev IPK, it is fail=
ing with the error below due to the missing zlib dependency chain.
"
pkg-config error with 'gio-2.0': Could not generate cargs for gio-2.0:
Package zlib was not found in the pkg-config search path.
Perhaps you should add the directory containing `zlib.pc'
to the PKG_CONFIG_PATH environment variable
Package 'zlib', required by 'gio-2.0', not found
"

--8Fu3PTpnIgpIzGKR7dXo
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

We are building the components through Yocto and using dev IPKs for the dep=
endent packages (generated from Yocto) to resolve the build dependencies.<b=
r /><br />Steps:<br />1) Generate the libical IPKs from Yocto.<br />2) Copy=
 the IPKs to a folder and create the local opkg feed.<br />3) Remove libica=
l from the BlueZ dependencies list.<br />4) Install the libical-dev IPK fro=
m the local feed to the BlueZ recipe sysroot.<br />4) Build the BlueZ packa=
ge.<br /><br />When we tried to build BlueZ from source, by using the libic=
al dev IPK, we are getting the error.<br />"<br />configure:14460: checking=
 for libical<br />configure:14467: $PKG_CONFIG --exists --print-errors "lib=
ical"<br />Package icu-i18n was not found in the pkg-config search path.<br=
 />Perhaps you should add the directory containing `icu-i18n.pc'<br />to th=
e PKG_CONFIG_PATH environment variable<br />Package 'icu-i18n', required by=
 'libical', not found<br />configure:14470: $? =3D 1<br />configure:14484: =
$PKG_CONFIG --exists --print-errors "libical"<br />Package icu-i18n was not=
 found in the pkg-config search path.<br />Perhaps you should add the direc=
tory containing `icu-i18n.pc'<br />to the PKG_CONFIG_PATH environment varia=
ble<br />Package 'icu-i18n', required by 'libical', not found<br />configur=
e:14487: $? =3D 1<br />configure:14501: result: no<br />Package 'icu-i18n',=
 required by 'libical', not found<br />configure:14517: error: libical is r=
equired<br />"<br /><br />Similarly, when we are trying to build the 'gstre=
amer1.0_1.18' package, which has a dependency on 'glib2-0,' and using the g=
lib2-0 dev IPK, it is failing with the error below due to the missing zlib =
dependency chain.<br />"<br />pkg-config error with 'gio-2.0': Could not ge=
nerate cargs for gio-2.0:<br />Package zlib was not found in the pkg-config=
 search path.<br />Perhaps you should add the directory containing `zlib.pc=
'<br />to the PKG_CONFIG_PATH environment variable<br />Package 'zlib', req=
uired by 'gio-2.0', not found<br />"

--8Fu3PTpnIgpIzGKR7dXo--

