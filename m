Received: from mail-da0-f42.google.com ([209.85.210.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ULEIf-0000W3-BZ
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2013 15:59:54 +0100
Received: by mail-da0-f42.google.com with SMTP id n15so4561162dad.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2013 07:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TgBJzkTjqMedlGeRzMpeR7mRf45SNAq1Q9ogC0v7HqE=;
	b=0JNOA37X3nluPJVrNSVjBcBgDEXrzY6twjnkp2VNYgeIUA3Yzj86plSnLu6sQdx0cr
	DT/j/MTlMUZlsh6rjV6wQI5HWHlVBLZKTzNjWrW05ALjE5byMopCJThnbXXmDh0yv79G
	tO/j94pJnie4iAufJmiSwCv9JJzPy5KOp3XEKIsz+lev+DuuTLD7Pm5xAltWO2OcPY3c
	NVg4ctB6duZeXeVVpMouJHel0n2clzovWjBKS6o+IdllsDXP8c63DKq9h2pvhYRWSsAf
	fB225NE8+q6hxEehNWv/dZJcnSZjqyVPJRo/sZUa3IZfWr1XfjkFnFdIG0cYYBNF9UI2
	RqIQ==
X-Received: by 10.66.102.10 with SMTP id fk10mr21177389pab.169.1364481749007; 
	Thu, 28 Mar 2013 07:42:29 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id in5sm25794812pbc.20.2013.03.28.07.42.26
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 28 Mar 2013 07:42:27 -0700 (PDT)
Date: Thu, 28 Mar 2013 15:42:21 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130328144221.GD5105@jama>
References: <1364478849-3696-1-git-send-email-Martin.Jansa@gmail.com>
	<20130328143006.GC5105@jama>
MIME-Version: 1.0
In-Reply-To: <20130328143006.GC5105@jama>
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
X-List-Received-Date: Thu, 28 Mar 2013 15:00:18 -0000
X-Groupsio-MsgNum: 37198
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eheScQNz3K90DVRs"
Content-Disposition: inline

--eheScQNz3K90DVRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2013 at 03:30:06PM +0100, Martin Jansa wrote:
> On Thu, Mar 28, 2013 at 02:54:09PM +0100, Martin Jansa wrote:
> > * sysvinit/systemd assumes that update-rc.d can be inhibited
> > * with systemd enabled, sysvinit scripts are missing in packages
> >   and update-rc.d needs to be put in BAD_RECOMMENDATIONS to prevent
> >   update-rc.d trying to install them in postinst
> > * update-rd.c shouldn't be in DEPENDS
> > ---
> >  meta/recipes-connectivity/openssh/openssh_6.1p1.bb | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >=20
> > diff --git a/meta/recipes-connectivity/openssh/openssh_6.1p1.bb b/meta/=
recipes-connectivity/openssh/openssh_6.1p1.bb
> > index 32c3b2c..0cffd23 100644
> > --- a/meta/recipes-connectivity/openssh/openssh_6.1p1.bb
> > +++ b/meta/recipes-connectivity/openssh/openssh_6.1p1.bb
> > @@ -96,8 +96,7 @@ FILES_${PN}-misc =3D "${bindir}/ssh* ${libexecdir}/ss=
h*"
> >  FILES_${PN}-keygen =3D "${bindir}/ssh-keygen"
> > =20
> >  RDEPENDS_${PN} +=3D "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
> > -DEPENDS_${PN}-sshd +=3D "update-rc.d"
> > -RDEPENDS_${PN}-sshd +=3D "update-rc.d ${PN}-keygen"
> > +RDEPENDS_${PN}-sshd +=3D "${PN}-keygen"
> > =20
> >  CONFFILES_${PN}-sshd =3D "${sysconfdir}/ssh/sshd_config"
> >  CONFFILES_${PN}-ssh =3D "${sysconfdir}/ssh/ssh_config"
>=20
> This allows to remove update-rc.d from image.
> Changing error message from fatal
> Configuring dbus-1.
> update-rc.d: /etc/init.d/dbus-1: file does not exist
> Configuring udev.
> update-rc.d: /etc/init.d/systemd-udevd: file does not exist
>=20
> to less fatal
> Configuring dbus-1.
> //var/lib/opkg/info/dbus-1.postinst: line 9: type: update-rc.d: not found
> Configuring udev.
> //var/lib/opkg/info/udev.postinst: line 7: type: update-rc.d: not found
>=20
> I'll send separate patch to hide also stderr from "type".
>=20
> Unfortunately it still hangs forever in some images when trying to start
> lib/systemd/system/run-postinsts.service
>=20
> After removing this service it boots fine.

first boot after removing it:

root@qemux86-64:~# systemctl status run-postinsts.service
run-postinsts.service
          Loaded: error (Reason: No such file or directory)
          Active: inactive (dead)

Mar 28 14:32:01 qemux86-64 S98run-postinsts[55]: //var/lib/opkg/info/dbus-1=
=2E...d
Mar 28 14:32:03 qemux86-64 S98run-postinsts[55]: //var/lib/opkg/info/udev.p=
o...d
Mar 28 14:32:04 qemux86-64 S98run-postinsts[55]: adding crontab
Mar 28 14:32:04 qemux86-64 S98run-postinsts[55]: ln -s '/lib/systemd/system=
/...'
root@qemux86-64:~# systemctl start run-postinsts.service
Failed to issue method call: Unit run-postinsts.service failed to load: No =
such file or directory. See system logs and 'systemctl status run-postinsts=
=2Eservice' for details.

And starting it manually after returning the service:
root@qemux86-64:~# systemctl start run-postinsts.service
root@qemux86-64:~# systemctl status run-postinsts.service
run-postinsts.service - Run pending postinsts
          Loaded: loaded (/lib/systemd/system/run-postinsts.service; disabl=
ed)
          Active: inactive (dead) since Thu 2013-03-28 14:39:14 UTC; 4s ago
        Main PID: 887 (code=3Dexited, status=3D0/SUCCESS)
          CGroup: name=3Dsystemd:/system/run-postinsts.service

Mar 28 14:39:11 qemux86-64 systemd[1]: Starting Run pending postinsts...
Mar 28 14:39:14 qemux86-64 systemd[1]: Started Run pending postinsts.
Mar 28 14:39:16 qemux86-64 S98run-postinsts[887]: //var/lib/opkg/info/dbus-=
1....
Mar 28 14:39:17 qemux86-64 S98run-postinsts[887]: //var/lib/opkg/info/udev.=
po...
Mar 28 14:39:19 qemux86-64 S98run-postinsts[887]: Configuring dbus-1.
Mar 28 14:39:19 qemux86-64 S98run-postinsts[887]: Configuring udev-hwdb.
Mar 28 14:39:19 qemux86-64 S98run-postinsts[887]: Configuring udev.
Mar 28 14:39:19 qemux86-64 S98run-postinsts[887]: Configuring ntpdate.

So it's broken only on first boot, maybe started too soon, but=20
After=3Dremount-rootfs.service tmp.mount
looks sufficient.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eheScQNz3K90DVRs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFUVs0ACgkQN1Ujt2V2gBzEYQCeO3wzGeM8kQZtND+hkP+WYitX
BD4An0QDPvls0ZCQ2S+G7wYOtI+4GjCl
=2HPd
-----END PGP SIGNATURE-----

--eheScQNz3K90DVRs--
