Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T76RV-0000bg-D5
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 17:14:01 +0200
Received: by wgbdr1 with SMTP id dr1so1286512wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 08:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=54hjX/xJU//YmoI0CNu3o2her2yTkZsTYYjE8edgAX0=;
	b=ZxQbWH75ia5VE7Zo2AjzbCnZLEvQ7OT6PA6xEiItwV76FHOincNe09zgKsCJkOuucz
	zlNDJ12VjkJPAf7p5NolsCxjtKuuXKITTbe3npvktB/1jut0+eA1gSFvNCbnc9Tf/Isc
	4qIsSe1Ztsed8l23ZANWZRRLAH/twU+afGw8kMpzsqsd2kiE/15OVa7ouO2ddsrHddX5
	r781SrdoZbN0Evu5zT6wqCcyPjdoLi9pbx8WJkI+9PSF+d81n/ScMtkYFKa7jtAoYNLC
	qpkNrjQLro2zh1TSw9VTVsgFE3x9/ibm7iyayfcabt55Bp9owpD2xyUeuV+MZJ1fssgv
	2APw==
Received: by 10.216.238.79 with SMTP id z57mr3264963weq.184.1346338906135;
	Thu, 30 Aug 2012 08:01:46 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q4sm1140384wix.9.2012.08.30.08.01.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 08:01:44 -0700 (PDT)
Date: Thu, 30 Aug 2012 17:02:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Marc Ferland <ferlandm@sonatest.com>
Message-ID: <20120830150200.GB22519@jama.jama.net>
References: <1346337941-15848-1-git-send-email-ferlandm@sonatest.com>
MIME-Version: 1.0
In-Reply-To: <1346337941-15848-1-git-send-email-ferlandm@sonatest.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] sysstat: Explicitly disable sensors support.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2012 15:14:01 -0000
X-Groupsio-MsgNum: 28427
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Content-Disposition: inline

--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 30, 2012 at 10:45:41AM -0400, Marc Ferland wrote:
> Since no lmsensors recipe exists by default in oe-core, explicitly disable
> support for it in sysstat. In my case sysstat would fail linking complain=
ing
> about undefined references when adding my own lmsensors recipe.
>=20
> Signed-off-by: Marc Ferland <ferlandm@sonatest.com>
> ---
>  meta/recipes-extended/sysstat/sysstat.inc       |    2 ++
>  meta/recipes-extended/sysstat/sysstat_10.0.3.bb |    2 +-
>  2 files changed, 3 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-ext=
ended/sysstat/sysstat.inc
> index 9da40a7..a89109c 100644
> --- a/meta/recipes-extended/sysstat/sysstat.inc
> +++ b/meta/recipes-extended/sysstat/sysstat.inc
> @@ -3,12 +3,14 @@ DESCRIPTION =3D "The sysstat utilities are a collection=
 of performance monitoring
>  HOMEPAGE =3D "http://sebastien.godard.pagesperso-orange.fr/"
>  LICENSE =3D "GPLv2+"
>  SECTION =3D "console/utils"
> +INC_PR =3D "r0"
> =20
>  SRC_URI =3D "http://pagesperso-orange.fr/sebastien.godard/sysstat-${PV}.=
tar.gz \
>  		   file://99_sysstat"
> =20
>  inherit autotools gettext
> =20
> +EXTRA_OECONF +=3D "--disable-sensors"
>  EXTRA_OEMAKE +=3D 'LFLAGS=3D""'
> =20
>  do_install() {
> diff --git a/meta/recipes-extended/sysstat/sysstat_10.0.3.bb b/meta/recip=
es-extended/sysstat/sysstat_10.0.3.bb
> index 7ef6c60..e9b95d8 100644
> --- a/meta/recipes-extended/sysstat/sysstat_10.0.3.bb
> +++ b/meta/recipes-extended/sysstat/sysstat_10.0.3.bb
> @@ -2,7 +2,7 @@ require sysstat.inc
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c=
28b"
> =20
> -PR =3D "r1"
> +PR =3D "${INC_PR}.1"

r0.1 sorts lower then old r1

> =20
>  SRC_URI[md5sum] =3D "0e1ed5200f31f69a3b90ff1e81c07745"
>  SRC_URI[sha256sum] =3D "7c0dd172f09edaff100b33db29ef502e15e71867b505c6d5=
19f76a24fabcc1f5"
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlA/gGgACgkQN1Ujt2V2gBz97gCfXfwcbyxTYOmjcETbj6klbAnH
M5gAn2SOwBloV2UgBOZu46OrUWiMpHOy
=b5Ai
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--
