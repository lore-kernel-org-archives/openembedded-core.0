Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 500BD76497
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 18:53:20 +0000 (UTC)
Received: by wicmv11 with SMTP id mv11so32016896wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 11:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RoBt95rOAh2WGDNQoJ74lkcjUU1dyvK41r/MkAy58as=;
	b=yrEfgq21r/quwtar2pJQ4r9dm4IzRqZUUj3oCxhELGsCH5qsQGW3If+CGKslti0fQQ
	3I8RpF9kWeH43i/GYsUYWRRfm9xobWj1NXbAWIOYlek2ExFwmUHKNHrAm9QnsdfkE1Z4
	A1fXnolSFDKs8A7Z/uNJt7hVUW9+ZPquBTqLvtSiHoZDboXiTfZuabdWPJoZxI4dpTp+
	8K7WaxJW19vLeLpMRBhkZXzzo0NhxT1rpK3QPRMZ4MKSoHIoqRkR6EqtW3gcprWF5d4G
	OCgHVPn1P05hobnHHokpHXjPR9aRi94WdZc7lmbPG2RXNDpN1PbB1+3JISF7L/p0mBNR
	kBkA==
X-Received: by 10.194.203.3 with SMTP id km3mr86592647wjc.114.1438282400630;
	Thu, 30 Jul 2015 11:53:20 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id mc4sm514439wic.6.2015.07.30.11.53.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jul 2015 11:53:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 30 Jul 2015 20:53:35 +0200
To: Tobias Olausson <tobias.olausson@pelagicore.com>
Message-ID: <20150730185335.GO2457@jama>
References: <1438280587-5379-1-git-send-email-tobias.olausson@pelagicore.com>
MIME-Version: 1.0
In-Reply-To: <1438280587-5379-1-git-send-email-tobias.olausson@pelagicore.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] Revert "mesa: fix do_install_append"
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
X-List-Received-Date: Thu, 30 Jul 2015 18:53:21 -0000
X-Groupsio-MsgNum: 68782
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xn9xNsWbHJd/50IB"
Content-Disposition: inline

--xn9xNsWbHJd/50IB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2015 at 11:23:06AM -0700, Tobias Olausson wrote:
> The commit changed an #ifdef to #if defined(), but the source
> code for 10.4 branch of mesa still uses #ifdef.

Please use [fido] in subject to make it clear where it should be
applied.

> This reverts commit 12e467f436fbc22f274558c753f0ac9756ce1071.
> ---
>  meta/recipes-graphics/mesa/mesa_10.4.4.bb | 2 +-
>  meta/recipes-graphics/mesa/mesa_git.bb    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa_10.4.4.bb b/meta/recipes-gra=
phics/mesa/mesa_10.4.4.bb
> index 90cccbe..8140411 100644
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
> +        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@bb.utils.con=
tains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglpl=
atform.h
>      fi
>  }
> diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphi=
cs/mesa/mesa_git.bb
> index 1598019..cbe8911 100644
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
> +        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@bb.utils.con=
tains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglpl=
atform.h
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

--xn9xNsWbHJd/50IB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW6cq4ACgkQN1Ujt2V2gBxbnQCgjP4MRW/mH9U+nKZ3ejkJmyZT
Jg8An2joLW9gPfnRnwNUZ4qxIYpxSuOo
=ww80
-----END PGP SIGNATURE-----

--xn9xNsWbHJd/50IB--
