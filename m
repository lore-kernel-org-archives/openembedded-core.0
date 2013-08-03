Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8E90660664;
	Sat,  3 Aug 2013 23:22:25 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b10so933628eae.38
	for <multiple recipients>; Sat, 03 Aug 2013 16:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AubyOJLzvnc80cxiHoO8QU5cIMrMH1kjJgns1dIWSxs=;
	b=wjJE/GXskk8LILs7NLoHvm8lHoTqENNf/g5BIVsIWX3LbHHm1znbkwTPCXM80IcdvN
	nx3WeF7MXBhK3vXw2gRp2lQHG26kogkDiM/4KhTz7+i6pPmSK6v3FW/qSF+Ti14OpOCY
	d9QW0atNRYB1JRm9mjymmWJPhtrt2IRU3EnWLDsGwBXoCZQJvSaglLDBFuEmSF3txSQM
	uvyCZ364YvXeuYVt5IgAUPfgQfdqxGmGnbk39lBHP6yQL0fHymueURdiGr0BIkc5tK7n
	EgnrQv0OjEt4OuzKrS9jI0SVVwWKNCBDJ/shMIyJPbk7wvHi188d+/a9n/fswJFcz7H3
	1QDQ==
X-Received: by 10.14.179.4 with SMTP id g4mr9398939eem.93.1375572145064;
	Sat, 03 Aug 2013 16:22:25 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	e44sm22440932eeh.11.2013.08.03.16.22.23 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 03 Aug 2013 16:22:24 -0700 (PDT)
Date: Sun, 4 Aug 2013 01:23:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Muhammad Shakeel <muhammad_shakeel@mentor.com>
Message-ID: <20130803232303.GA3280@jama>
References: <20130731055134.2BD98504B3@opal>
MIME-Version: 1.0
In-Reply-To: <20130731055134.2BD98504B3@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Muhammad Shakeel : systemd: Remove init. d dir if systemd unit file is present and sysvinit not a distro feature
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
X-List-Received-Date: Sat, 03 Aug 2013 23:22:26 -0000
X-Groupsio-MsgNum: 42939
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GrZJL/A7LJaW37J8"
Content-Disposition: inline

--GrZJL/A7LJaW37J8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2013 at 05:51:34AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 823c90ad344ca2205f3055e2dcae08c6616f29b7
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D823c90ad344ca2205f3055e2dcae08c6616f29b7
>=20
> Author: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> Date:   Mon Jul 29 13:09:51 2013 +0500
>=20
> systemd: Remove init.d dir if systemd unit file is present and sysvinit n=
ot a distro feature
>=20
> If systemd is supported DISTRO_FEATURE and sysvinit is not and also if
> systemd_unitdir contains anything then no need to keep init.d scripts
> for sysvinit compatibility.
>=20
> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

There is small issue with this patch applied:

do_rootfs failing:
| Collected errors:
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies
for packagegroup-core-boot:
|  *    busybox-hwclock *
|  * opkg_install_cmd: Cannot install package packagegroup-core-boot.

Systemd images with packagegroup-core-boot RDEPEND on busybox-hwclock:
meta/recipes-core/packagegroups/packagegroup-core-boot.bb:
${@base_contains("MACHINE_FEATURES", "rtc", "busybox-hwclock", "", d)} \

Which is created only when there is /etc/init.d/hwclock.sh file:
FILES_${PN}-hwclock =3D "${sysconfdir}/init.d/hwclock.sh"

There are at least 3 options
1) ALLOW_EMPTY_${PN}-hwclock =3D "1"
in busybox.inc
2) add hwclock.service to the same package
3) change packagegroup-core-boot to depend on busybox-hwclock only with
sysvinit enabled

I think the best way to resolve this is 2), any volunteer?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GrZJL/A7LJaW37J8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlH9kNcACgkQN1Ujt2V2gBwmmgCeJSgWzo1oZu7IgQgOOiIhBnfx
OFkAn3iiszMVx3fCpTzOx7sR9jTlhATN
=TI+S
-----END PGP SIGNATURE-----

--GrZJL/A7LJaW37J8--
