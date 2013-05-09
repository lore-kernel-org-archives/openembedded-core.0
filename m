Received: from mail-da0-f46.google.com ([209.85.210.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UaOfx-0002Za-AY
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 13:06:23 +0200
Received: by mail-da0-f46.google.com with SMTP id e20so1519298dak.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2013 03:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=kN5Yl3QwRQ0yv8eRm9Gz5OEmY1FObwhPm+um3GsST20=;
	b=rNt1xMCvnX/iuM54GmykEUyxuXouqyDD8KCa2XC22IuJZPcfLK7ShUsCDbH5Yx4M9F
	VPOO5UlWYZE68f4HKiNEFwe8ilzSM4gFJU2rD+yBKumcpSYRtWp6fE/NhHSghf7G+BdP
	99wOzZfZuL7GGAouys1AROLiJjWqGeoFHUZE8q5kcvRMzsa3dXguavHemmEqF9pvlHm0
	+RvUoxG8Lf8R9pDqOkLNOzWkidJcU+WBIGGBb0t7BgMz1nCX4O3ZiO4PJ6sfOlC/Y8Lh
	Ylwss/lb+IBb+OUSCvn22+1bL0Hg4GNGA77a/mnFzHiY4L9LLp3YCKxlqo/BFLTkgOeQ
	s2UQ==
X-Received: by 10.66.155.39 with SMTP id vt7mr12304768pab.99.1368096492999;
	Thu, 09 May 2013 03:48:12 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	yp2sm3217144pab.10.2013.05.09.03.48.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 09 May 2013 03:48:11 -0700 (PDT)
Date: Thu, 9 May 2013 12:48:04 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130509104804.GD3188@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: autotools_preconfigure not removing separate B
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
X-List-Received-Date: Thu, 09 May 2013 11:06:36 -0000
X-Groupsio-MsgNum: 38941
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eheScQNz3K90DVRs"
Content-Disposition: inline

--eheScQNz3K90DVRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Do we really need -e "${CONFIGURESTAMPFILE}" check in autotools_preconfigur=
e?

In some cases when do_configure is failing (but after creating e.g. .qmake.=
cache)
it would be better to start with clean B on 2nd attempt to configure it, but
CONFIGURESTAMPFILE wasn't created yet.

Does someone remember why we need to test CONFIGURESTAMPFILE existence firs=
t=20
(was it only to prevent cat ${CONFIGURESTAMPFILE} to fail?)

autotools_preconfigure() {
        if [ -n "${CONFIGURESTAMPFILE}" -a -e "${CONFIGURESTAMPFILE}" ]; th=
en
                if [ "`cat ${CONFIGURESTAMPFILE}`" !=3D "${BB_TASKHASH}" -a=
 "${S}" !=3D "${B}" ]; then
                        echo "Previously configured separate build director=
y detected, cleaning ${B}"


--eheScQNz3K90DVRs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGLfuQACgkQN1Ujt2V2gBz81QCfYUtrB4Y0A3ZG5du95M831g1E
7mYAnA/JwmlmCYaBC3y6Cwrf+S2C8+sn
=Chg7
-----END PGP SIGNATURE-----

--eheScQNz3K90DVRs--
