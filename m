Received: from mail-da0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ULE6n-0007Py-89
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2013 15:47:17 +0100
Received: by mail-da0-f45.google.com with SMTP id v40so4554019dad.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2013 07:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=V4fJds6+kTBwTXRQd4CDrbC21/v+9KFcLM0kagxzi0c=;
	b=rhSPIA9s/RlXs2inccYCcKonHBLuZ39JWd8+MHfKAoV8Ie70guTpommSuiwtU0HpEn
	PiSJzRBrK8whk1tHiuyU0tYxiLSSReM55U+aVW2BVHDyvfcGgB8go1/oU0PDy0Z0vSwm
	t/uXfBQ6Bsn6jM74w6YMs8adpFKEJllnKbIK05Uscfr7PpREyzL+NHWqFHmHM+LpIq6G
	Obm4dFRvQ2M9D7nP5L7bmXYMP0S+oPuDxwxBLBXU2wHRnCJcSaJx4g0EJT76zM6sB5J1
	4l1OMyrDjRdHvbAHv2ROZdViBRWB2kcIV/CqO1r/qyHfd1fCskx6XloS0YVdqxCbTdpa
	LUmg==
X-Received: by 10.66.248.99 with SMTP id yl3mr36918687pac.134.1364481013709;
	Thu, 28 Mar 2013 07:30:13 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id u9sm27908613paf.22.2013.03.28.07.30.10
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 28 Mar 2013 07:30:12 -0700 (PDT)
Date: Thu, 28 Mar 2013 15:30:06 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130328143006.GC5105@jama>
References: <1364478849-3696-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1364478849-3696-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] openssh: don't add update-rc.d to RDEPENDS
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
X-List-Received-Date: Thu, 28 Mar 2013 14:47:22 -0000
X-Groupsio-MsgNum: 37197
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f+W+jCU1fRNres8c"
Content-Disposition: inline

--f+W+jCU1fRNres8c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2013 at 02:54:09PM +0100, Martin Jansa wrote:
> * sysvinit/systemd assumes that update-rc.d can be inhibited
> * with systemd enabled, sysvinit scripts are missing in packages
>   and update-rc.d needs to be put in BAD_RECOMMENDATIONS to prevent
>   update-rc.d trying to install them in postinst
> * update-rd.c shouldn't be in DEPENDS
> ---
>  meta/recipes-connectivity/openssh/openssh_6.1p1.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/openssh/openssh_6.1p1.bb b/meta/re=
cipes-connectivity/openssh/openssh_6.1p1.bb
> index 32c3b2c..0cffd23 100644
> --- a/meta/recipes-connectivity/openssh/openssh_6.1p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_6.1p1.bb
> @@ -96,8 +96,7 @@ FILES_${PN}-misc =3D "${bindir}/ssh* ${libexecdir}/ssh*"
>  FILES_${PN}-keygen =3D "${bindir}/ssh-keygen"
> =20
>  RDEPENDS_${PN} +=3D "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
> -DEPENDS_${PN}-sshd +=3D "update-rc.d"
> -RDEPENDS_${PN}-sshd +=3D "update-rc.d ${PN}-keygen"
> +RDEPENDS_${PN}-sshd +=3D "${PN}-keygen"
> =20
>  CONFFILES_${PN}-sshd =3D "${sysconfdir}/ssh/sshd_config"
>  CONFFILES_${PN}-ssh =3D "${sysconfdir}/ssh/ssh_config"

This allows to remove update-rc.d from image.
Changing error message from fatal
Configuring dbus-1.
update-rc.d: /etc/init.d/dbus-1: file does not exist
Configuring udev.
update-rc.d: /etc/init.d/systemd-udevd: file does not exist

to less fatal
Configuring dbus-1.
//var/lib/opkg/info/dbus-1.postinst: line 9: type: update-rc.d: not found
Configuring udev.
//var/lib/opkg/info/udev.postinst: line 7: type: update-rc.d: not found

I'll send separate patch to hide also stderr from "type".

Unfortunately it still hangs forever in some images when trying to start
lib/systemd/system/run-postinsts.service

After removing this service it boots fine.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f+W+jCU1fRNres8c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFUU+4ACgkQN1Ujt2V2gBzHrgCeKf5CrmDp1WeZK8LNra64izmq
wR4An0LmQU4V0DOoEnZoSu0MgQocmz1u
=uMu/
-----END PGP SIGNATURE-----

--f+W+jCU1fRNres8c--
