Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TQZWa-00082D-Pf
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 10:07:44 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so2879964wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 00:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vxgcZIg4NGP0KavNWnEGVuRuOc3x+l9RzozThN2ezy0=;
	b=LS6qVkKXLMlX4a9ulx6FGlAz/KitciBxBhqQ0Q6Lb81cmvwmKKVcJIjBebzb28l6O2
	df/PibImHSugBd2arW6Gh0d9io2bjphFMBzDKTterVhGal3Odlzj8PaEqbGAHsS5gkYk
	fuiknkhDvMAzVGY/I8iHGzz8aP3U6hm35/8Kc1x8SR+GszEz2zCJRDNGfo6NtszBVLks
	lb8jQ4Av5IpdLdHjOpyoxbEwbqXNgza/35O99sZc5X3+Pg88WAMKmWvdRH7eLvpPeYxc
	YAe4OxxdZ8zjbOtIFTfXfuAfEFpTT/ljY+VWAjx2zDPGEYLyTDjTTg3p/UpBq2YvSNuC
	gtUA==
Received: by 10.180.91.71 with SMTP id cc7mr27026856wib.2.1350978859059;
	Tue, 23 Oct 2012 00:54:19 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fp6sm34983245wib.0.2012.10.23.00.54.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Oct 2012 00:54:18 -0700 (PDT)
Date: Tue, 23 Oct 2012 09:54:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
Message-ID: <20121023075434.GM3269@jama.jama.net>
References: <1350919952-14859-1-git-send-email-giuseppe.condorelli@st.com>
MIME-Version: 1.0
In-Reply-To: <1350919952-14859-1-git-send-email-giuseppe.condorelli@st.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] base-files: do_install_basefilesissue error
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
X-List-Received-Date: Tue, 23 Oct 2012 08:07:44 -0000
X-Groupsio-MsgNum: 30856
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1hVIwB4NpNcOOTEe"
Content-Disposition: inline

--1hVIwB4NpNcOOTEe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 22, 2012 at 05:32:32PM +0200, Giuseppe CONDORELLI wrote:
> Fixed error in do_install_basefilesissue, printf is now replaced by echo.

Looks like partial revert of

commit a19880ad10ccb5d7d909dcf9de5c3dc58a0ebcd3
Author: Andrei Gherzan <andrei@gherzan.ro>
Date:   Thu Sep 20 12:56:59 2012 +0300

    Replace "echo -e" with "printf" to have the same behavior in dash or ba=
sh

    oe-core removed the prerequisite to have sh as bash. POSIX doesn't defi=
ne
    any options and furthermore allows 'echo -e' to be the default behavior.
    This means that in dash 'echo -e' will actually print '-e' and interpret
    backslashes by default. We use instead 'printf' builtin command with or
    without '\n' to simulate 'echo -e' or 'echo -n'.
    'printf' needs format while 'echo' can be used without any arguments. So
    'echo >' was replaced by 'printf "" >'.
    'echo' without '-n' flag adds a new line by default so to keep the same
    behavior of two new lines while using 'echo "\n"', 'printf "\n\n"' is
    used.

    [YOCTO #3138]

with very weak explanation why..

>=20
> Signed-off-by: Giuseppe Condorelli <giuseppe.condorelli@st.com>
> ---
>  meta/recipes-core/base-files/base-files_3.0.14.bb |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/rec=
ipes-core/base-files/base-files_3.0.14.bb
> index ba355ee..766b0e5 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -117,11 +117,11 @@ do_install_basefilesissue () {
> =20
>  	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir} =20
>          if [ -n "${DISTRO_NAME}" ]; then
> -		printf "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
> -		printf "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
> +		echo "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
> +		echo "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
>  		if [ -n "${DISTRO_VERSION}" ]; then
> -			printf "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue
> -			printf "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue.net
> +			echo "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue
> +			echo "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue.net
>  		fi
>  		echo "\n \l" >> ${D}${sysconfdir}/issue
>  		echo >> ${D}${sysconfdir}/issue
> --=20
> 1.7.4.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1hVIwB4NpNcOOTEe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCGTToACgkQN1Ujt2V2gBzDFQCfblneHTBwz6vMSiRsTXiNVsrx
U6wAn3JMNZcwvFYCTH7PiRHKDycSb0yN
=KnKZ
-----END PGP SIGNATURE-----

--1hVIwB4NpNcOOTEe--
