Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC4FAD5E36E
	for <webhook@archiver.kernel.org>; Sat,  9 Nov 2024 13:48:16 +0000 (UTC)
Subject: Question: Need advise with providing native Bluetooth sockets for Python
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudni.m.g@gmail.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Firefox 132
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 09 Nov 2024 05:48:09 -0800
Message-ID: <1pUB.1731160089648756611.yX3t@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="AEhHyQrlWpkvZut13FJO"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Nov 2024 13:48:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206905

--AEhHyQrlWpkvZut13FJO
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I am upgrading a project from Scarthgap to Styhead and am facing a problem =
again which I somewhat solved before though not properly. And now I want to=
 fix it for good and hopefully have the solution upstream too.

The problem: I have a Python application which needs bluetooth.h header fro=
m BlueZ (https://github.com/bluez/bluez/tree/master/lib) at compile time. T=
his is needed by Python's configure script (https://github.com/python/cpyth=
on/blob/6293d00e7201f3f28b1f4512e57dc4f03855cabd/configure#L10937) at such =
that the Python installation includes support for sockets like AF_BLUETOOTH=
 and BTPROTO_RFCOMM.

Without this, a line like the following will simply fail: sock =3D socket.s=
ocket(socket.AF_BLUETOOTH, socket.SOCK_STREAM, socket.BTPROTO_RFCOMM)

On Scarthgap I could do this by adding bbappend for Python with: DEPENDS +=
=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)}=
". This however is prone to creating dependency loops.

To fix this properly, I need to somehow provide only the contents of this f=
older: https://github.com/bluez/bluez/tree/master/lib ( https://github.com/=
bluez/bluez/tree/master/lib ) to Python at build-time while not depending o=
n building BlueZ package and its dependencies. To my knowledge there is no =
way to use the current BlueZ recipe to do this, though I may be wrong. I am=
 curious how others would solve this problem. Is a new recipe the best way?

--AEhHyQrlWpkvZut13FJO
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi everyone,</div>
<div>&nbsp;</div>
<div>I am upgrading a project from Scarthgap to Styhead and am facing a pro=
blem again which I somewhat solved before though not properly. And now I wa=
nt to fix it for good and hopefully have the solution upstream too.</div>
<div>&nbsp;</div>
<div>The problem: I have a Python application which needs bluetooth.h heade=
r from BlueZ (https://github.com/bluez/bluez/tree/master/lib) at compile ti=
me. This is needed by Python's configure script (https://github.com/python/=
cpython/blob/6293d00e7201f3f28b1f4512e57dc4f03855cabd/configure#L10937) at =
such that the Python installation includes support for sockets like AF_BLUE=
TOOTH and BTPROTO_RFCOMM.</div>
<div>&nbsp;</div>
<div>Without this, a line like the following will simply fail: sock =3D soc=
ket.socket(socket.AF_BLUETOOTH, socket.SOCK_STREAM, socket.BTPROTO_RFCOMM)<=
/div>
<div>&nbsp;</div>
<div>On Scarthgap I could do this by adding bbappend for Python with: DEPEN=
DS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '',=
 d)}". This however is prone to creating dependency loops.</div>
<div>&nbsp;</div>
<div>To fix this properly, I need to somehow provide only the contents of t=
his folder: <a href=3D"https://github.com/bluez/bluez/tree/master/lib" targ=
et=3D"_blank" rel=3D"noopener">https://github.com/bluez/bluez/tree/master/l=
ib </a>to Python at build-time while not depending on building BlueZ packag=
e and its dependencies. To my knowledge there is no way to use the current =
BlueZ recipe to do this, though I may be wrong. I am curious how others wou=
ld solve this problem. Is a new recipe the best way?</div>

--AEhHyQrlWpkvZut13FJO--

