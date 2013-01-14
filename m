Received: from mail-pa0-f45.google.com ([209.85.220.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TunSW-0004EN-05
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Jan 2013 18:04:45 +0100
Received: by mail-pa0-f45.google.com with SMTP id bg2so2328653pad.32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2013 08:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=8SPavOG1CJ0NEzOI949Z3n3tjZCB+DmD6LxXMjjgdHw=;
	b=z0mkxEJXDwONDHY9672InhLyrTVpibzEa+wkX1s8YKUuzxEwZBSL3E5UAbpBsESqHA
	56NbGr1F9R0ctDuTs8MCYMGC91A9/UIJ+zs65fcDvN/kXGN9uyLnu0YYZV05Tns9NvhR
	Mle9Ju4S6V5thaRoJiYsPN9pKvWD9rKdqKqfJM0V2D1hd4y+6TwiH+o5mnYE6HpOuOrY
	TG65DU1nj0YqqCPiENifC81rMHo13ada6AOE12ANP+i2VERg9RBWkC+pUyXBVMV/f00y
	NCZrLugSVimvV7TA5wSHM2F/K/Y0HAArenrAyeFL63B0uid/VaQ0bTfUgbK2gZNeSOdI
	iiqw==
X-Received: by 10.66.83.232 with SMTP id t8mr97657030pay.73.1358182148056;
	Mon, 14 Jan 2013 08:49:08 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id l8sm9043761pax.9.2013.01.14.08.49.05
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 14 Jan 2013 08:49:06 -0800 (PST)
Date: Mon, 14 Jan 2013 17:49:05 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Message-ID: <20130114164905.GF2992@jama>
References: <1358181569-30628-1-git-send-email-laurentiu.palcu@intel.com>
MIME-Version: 1.0
In-Reply-To: <1358181569-30628-1-git-send-email-laurentiu.palcu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox.inc: have the busybox-syslog postinstall run on host
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
X-List-Received-Date: Mon, 14 Jan 2013 17:04:45 -0000
X-Groupsio-MsgNum: 33787
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jkO+KyKz7TfD21mV"
Content-Disposition: inline

--jkO+KyKz7TfD21mV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 14, 2013 at 06:39:29PM +0200, Laurentiu Palcu wrote:
> update-rc.d fails when executing the postinstall on host. That's because
> 'syslog' is renamed to 'syslog.busybox' and a 'syslog' link to it is made
> instead. However, on host, the link is not valid and update-rc.d will
> complain that the file does not exist. On target, this does not happen.
>=20
> So, this patch will have update-rc.d create the necessary links to
> syslog.busybox instead. Technically, the behavior is unchanged and
> syslogd will be started as usual. The only change will be the links in
> rcX.d directories:
>=20
> Instead of: S20syslog -> ../init.d/syslog
> we will have: S20syslog.busybox -> ../init.d/syslog.busybox
>=20
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  meta/recipes-core/busybox/busybox.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/bu=
sybox/busybox.inc
> index 972e7d0..c70ba62 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -25,7 +25,7 @@ FILES_${PN}-hwclock =3D "${sysconfdir}/init.d/hwclock.s=
h"
>  INITSCRIPT_PACKAGES =3D "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mde=
v ${PN}-hwclock"
> =20
>  INITSCRIPT_NAME_${PN}-httpd =3D "busybox-httpd"
> -INITSCRIPT_NAME_${PN}-syslog =3D "syslog"
> +INITSCRIPT_NAME_${PN}-syslog =3D "syslog.${BPN}"

What if syslog-ng is installed? won't it run both syslog implementations?

>  INITSCRIPT_NAME_${PN}-mdev =3D "mdev"
>  INITSCRIPT_NAME_${PN}-hwclock =3D "hwclock.sh"
>  INITSCRIPT_PARAMS_${PN}-mdev =3D "start 06 S ."
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jkO+KyKz7TfD21mV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD0NwEACgkQN1Ujt2V2gBzT6ACeNJgAVDjDCAh1jlxDrfNYivlC
RawAoIKljedWrytl7MzAcgVh3C5NAHLA
=FFHR
-----END PGP SIGNATURE-----

--jkO+KyKz7TfD21mV--
