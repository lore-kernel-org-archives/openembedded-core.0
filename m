Return-Path: <sascha-ml-linux-yocto-oe-core@silbe.org>
Received: from bbox.sascha.silbe.org (bbox.sascha.silbe.org [46.38.230.149])
	by mail.openembedded.org (Postfix) with ESMTP id 91C78751E7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 18:17:56 +0000 (UTC)
Received: from twin.sascha.silbe.org (twin.sascha.silbe.org [192.168.1.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "twin.sascha.silbe.org",
	Issuer "stunnel Pseudo-CA" (verified OK))
	by bbox.sascha.silbe.org (Postfix) with ESMTPS id 38D1BBEF6C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 20:17:56 +0200 (CEST)
Received: (nullmailer pid 16249 invoked by uid 8193);
	Fri, 08 Jun 2018 18:17:56 -0000
To: Alexander Kanavin <alex.kanavin@gmail.com>
In-Reply-To: <CANNYZj_V7knzM_+3J+YnHNyG+mbGmkzYBM_GoxTK1jKoYx9UGw@mail.gmail.com>
References: <20180608161841.10108-1-x-yo17@se-silbe.de>
	<CANNYZj_V7knzM_+3J+YnHNyG+mbGmkzYBM_GoxTK1jKoYx9UGw@mail.gmail.com>
Date: Fri, 08 Jun 2018 20:17:37 +0200
Message-ID: <toeh8mdywfy.fsf@twin.sascha.silbe.org>
MIME-Version: 1.0
From: Sascha Silbe <x-yo17@se-silbe.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gobject-introspection: relocate typelib repository for native builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jun 2018 18:17:57 -0000
X-Groupsio-MsgNum: 112349
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain

Alexander Kanavin <alex.kanavin@gmail.com> writes:

> 2018-06-08 19:18 GMT+03:00 Sascha Silbe <x-yo17@se-silbe.de>:
>> gobject-introspection hard-codes the install path in the search path
>> for the typelib repository, pretty much the same way glib behaves for
>> the gio modules directory. Like for glib, this causes problems when
>> gobject-introspection-native is restored from sstate with a different
>> build directory.
>
> Can you provide an example of how the problems can be reproduced
> please? I think we disable building introspection data for -native,
> and so where typelib dir is shouldn't matter?

I originally encountered this issue in a poky-based project of one of my
customers and used the recipe below to reproduce the issue in current
poky master.

To reproduce you can run:

mkdir -p poky-downloads
( source poky/oe-init-build-env poky-move-test-1 && ln -s ../poky-downloads downloads && bitbake python3-pygobject-test && bitbake -c cleansstate python3-pygobject-test ) && rm -rf poky-move-test-1/tmp && ( source poky/oe-init-build-env poky-move-test-2 && ln -s ../poky-downloads downloads && ln -s ../poky-move-test-1/sstate-cache . && bitbake python3-pygobject-test )

Sascha

SUMMARY = "Python GObject bindings test"
SECTION = "devel/python"
LICENSE = "CLOSED"

DEPENDS = "glib-2.0-native python3-native python3-pygobject-native"

inherit python3native

do_compile() {
    python3 -c 'from gi.repository import GLib'
}

BBCLASSEXTEND = "native"

-- 
Softwareentwicklung Sascha Silbe, Niederhofenstraße 5/1, 71229 Leonberg
https://se-silbe.de/
USt-IdNr.: DE281696641

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJbGshBAAoJEMGPauiBMO2XJHwP/0zMFOG7NbADObP4GKxQuk9g
/ot+pYmahgPboIS+ll1eDU8X+b3QNUrxJXmSQbCyA306A3cmpQaH9fP+smNZYzHz
VR7I/Uh/35dfj07UHsDZakqY/cTXzvXUZ6/MliUgwXR54ktKY8dl3eU8OXU3AeAT
ek7lTpPoRWKOe8h9O+38yCnOmie7qIW9AbXNm54LcrUNkka+2BiBiaYB/yzfG+7y
Wz1+esYUXmuovjv5A13D6WE5ZCPuicwIaQNvYPXGrgPOlNhPa7y6qnlq+PWG9MvW
7eiWCEVmQDh+d/As8hVJgHHzX6HVJUSMF89aV+mIJ88Y6gxEAzlhClEhx8HUsQjy
DnW6uuvL4oqZcyf71pGlTZOosxGmsaVLqw/X3MmqMEmxPFDf8+aQZu/GGiosreec
nTNZYXDB0iMeLMnwJfVlO5HgGmkSvL9PvxS74rWuhO2l5BMdpgOV8E/kTfldNUFo
Z7G6Unxup0cCc+5qwVsoiP1D+UGYhj+khayQK+sCU9XByRDVoWDWadVg13C0XcDm
XGj9tee9CiUgtWVPihxoZGA89IohLznCU6JeQE56TakSE31TgYsdhtiRjLWzjede
Kz0Y89GUcHwvHyKSUaiw+Z2S1udvhPLp0jA31SFztl7u+d7h5Vc46qe5z0CfibfE
ES5voPqcIxeb1FVochR5
=bU+2
-----END PGP SIGNATURE-----

--==-=-=--
