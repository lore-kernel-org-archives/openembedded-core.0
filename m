Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QLrng-0006F0-85
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 09:01:08 +0200
Received: by wwb17 with SMTP id 17so3911723wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 May 2011 23:58:16 -0700 (PDT)
Received: by 10.227.54.196 with SMTP id r4mr956622wbg.68.1305529096145;
	Sun, 15 May 2011 23:58:16 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id z13sm2940016wbd.29.2011.05.15.23.58.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 15 May 2011 23:58:13 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <ca9a918a98510eac991c84ce1ebe8fecbdf38361.1305525725.git.raj.khem@gmail.com>
Date: Mon, 16 May 2011 08:58:10 +0200
Message-Id: <13617913-C458-40F1-AA46-489ACEADF340@dominion.thruhere.net>
References: <cover.1305525725.git.raj.khem@gmail.com>
	<ca9a918a98510eac991c84ce1ebe8fecbdf38361.1305525725.git.raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 2/2] tclibc-uclibc.inc: Append -uclibc only to target recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 May 2011 07:01:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 mei 2011, om 08:04 heeft Khem Raj het volgende geschreven:

> Do not define DEPLOY_DIR_IMAGE
> Append -uclibc to STAGING_DIR_TARGET only for target recipe and cross
> recipes
> Append -uclibc to STAGING_DIR_HOST only for target recipes.
>=20
> These changes make sure that we still share the native sysroot

I still stay we append tclibc unconditionally.

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> meta/conf/distro/include/tclibc-uclibc.inc |    5 ++---
> 1 files changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/tclibc-uclibc.inc =
b/meta/conf/distro/include/tclibc-uclibc.inc
> index 27f6ec6..4bd313f 100644
> --- a/meta/conf/distro/include/tclibc-uclibc.inc
> +++ b/meta/conf/distro/include/tclibc-uclibc.inc
> @@ -20,10 +20,9 @@ CXXFLAGS +=3D "-fvisibility-inlines-hidden"
>=20
> IMAGE_LINGUAS =3D ""
>=20
> -DEPLOY_DIR_IMAGE =3D "${TMPDIR}/deploy/images"
> DEPLOY_DIR_append =3D "-uclibc"
> -STAGING_DIR_TARGET_append =3D "-uclibc"
> -STAGING_DIR_HOST_append =3D "-uclibc"
> +STAGING_DIR_TARGET_append =3D "${@['-uclibc', =
''][oe.utils.inherits(d, 'native', 'nativesdk')]}"
> +STAGING_DIR_HOST_append =3D "${@['-uclibc', ''][oe.utils.inherits(d, =
'native', 'nativesdk', 'cross', 'crosssdk')]}"
> SSTATE_MANIFESTS_append =3D "-uclibc"
>=20
> LIBC_DEPENDENCIES =3D "\
> --=20
> 1.7.4.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



