Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2572E762E9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 15:25:41 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so117857549wib.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 08:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BwqEcA/0MLbQ2613qkx2pzP0jSfB850ST8ZwmbfbHzI=;
	b=GvD6T4uppxDK7JtV8XhuHjHwOQP0yYQqYSI4i6gi1YXmwLHmPJFG+ceUGrNLo00Oou
	t+3IzDH6aNmkoJABooK/pYO6Y7GkI2lDaA5gO0WYU5RXKADh5To9oH8X0xz6AxB7F1S1
	gkwATTcP7IGC9nF6RJODoZS0NaV9CzrIw7qbA2/bes7wwDcbJ+UWm5+P+Cj945D3duCB
	bEWisukrEiS8tDPh36Hk8mip4bRawVMSw/q9OcUmrP6Q7bQI4X6B6Zsf4RwCs5joiFOO
	L4Y+E3B1du1Z/m8ukDmMKAYCi8F6uBPO4ZriiVUkYOyxDgqmhEgw5ywqVYlIP8wTfo3D
	kksg==
X-Received: by 10.194.103.130 with SMTP id fw2mr59316353wjb.121.1438010741523; 
	Mon, 27 Jul 2015 08:25:41 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id r8sm14192446wiz.5.2015.07.27.08.25.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Jul 2015 08:25:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 27 Jul 2015 17:25:44 +0200
To: Tobias Olausson <tobias.olausson@pelagicore.com>
Message-ID: <20150727152544.GA307@jama>
References: <1437500771-20097-1-git-send-email-tobias.olausson@pelagicore.com>
MIME-Version: 1.0
In-Reply-To: <1437500771-20097-1-git-send-email-tobias.olausson@pelagicore.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa: fix sed for MESA_EGL_NO_X11_HEADERS in fido
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
X-List-Received-Date: Mon, 27 Jul 2015 15:25:42 -0000
X-Groupsio-MsgNum: 68437
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline

--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2015 at 10:46:11AM -0700, Tobias Olausson wrote:
> In 10.4 versions of mesa, the check for MESA_EGL_NO_X11_HEADERS uses an #=
ifdef,
> not an #if define().

So this commit which was recently backported to fido branch should be
reverted:

commit 12e467f436fbc22f274558c753f0ac9756ce1071
Author:     Robert Yang <liezhi.yang@windriver.com>
AuthorDate: Wed May 6 00:08:35 2015 -0700
Commit:     Richard Purdie <richard.purdie@linuxfoundation.org>
CommitDate: Sun Jun 28 09:41:54 2015 +0100

    mesa: fix do_install_append
   =20
    "ifdef MESA_EGL_NO_X11_HEADERS" -> "if defined(MESA_EGL_NO_X11_HEADERS)"
   =20
    (From OE-Core master rev: 3a464d67b60f70b865f7db768e7edc53e40ff450)
   =20
    Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
    Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>

with proper commit message (preferably separately from
9c746017af381884cc20c7cd563fc429c2c66112 backport), otherwise I like
what this patch is doing.

Thanks

>=20
> Also, this backports commit 9c746017af381884cc20c7cd563fc429c2c66112
> to fido from master.
>=20
> Signed-off-by: Tobias Olausson <tobias.olausson@pelagicore.com>
> ---
>  meta/recipes-graphics/mesa/mesa_10.4.4.bb | 2 +-
>  meta/recipes-graphics/mesa/mesa_git.bb    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa_10.4.4.bb b/meta/recipes-gra=
phics/mesa/mesa_10.4.4.bb
> index 90cccbe..a5f510d 100644
> --- a/meta/recipes-graphics/mesa/mesa_10.4.4.bb
> +++ b/meta/recipes-graphics/mesa/mesa_10.4.4.bb
> @@ -11,6 +11,6 @@ S =3D "${WORKDIR}/Mesa-${PV}"
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
>  do_install_append() {
>      if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}=
; then
> -        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)/#if ${@bb.uti=
ls.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/e=
glplatform.h
> +        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if defined(MESA_EG=
L_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1',=
 d)}/' ${D}${includedir}/EGL/eglplatform.h
>      fi
>  }
> diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphi=
cs/mesa/mesa_git.bb
> index 1598019..269ae1e 100644
> --- a/meta/recipes-graphics/mesa/mesa_git.bb
> +++ b/meta/recipes-graphics/mesa/mesa_git.bb
> @@ -13,6 +13,6 @@ S =3D "${WORKDIR}/git"
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
>  do_install_append() {
>      if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}=
; then
> -        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)/#if ${@bb.uti=
ls.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/e=
glplatform.h
> +        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if defined(MESA_EG=
L_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1',=
 d)}/' ${D}${includedir}/EGL/eglplatform.h
>      fi
>  }
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW2TXgACgkQN1Ujt2V2gByfkgCfenxMkTRcmaoMuUX/bT9k7fGU
PS4AnicwOp81JNeslMEeiFNcHceyjMa2
=xf3F
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
