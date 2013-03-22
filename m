Received: from mail-da0-f41.google.com ([209.85.210.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UJ0Yf-0005IY-2Q
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 12:54:54 +0100
Received: by mail-da0-f41.google.com with SMTP id w4so2240344dam.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2013 04:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=so/o9bGEuWoPAFosBFIkf5ayS/5ZJ30+uLMnwwO8+iA=;
	b=Bp7HCEOGAqRF+0J12uucvc/mMaY1m9vDG7XOIYzceZHrLT28cBXqG1TXOgo2cdBvj9
	usqeftZ/iFgLbyavGsifWDRuOGcDif2JstjDuXhZ1nMw71sWF26L8zI4pc5ePz9T2GaA
	P/XQkSjlV1yvBteJA3cvEe07AJXisQCzt+Gt0jPGz/WiAVtA/N0CKj53kRLi6RMoB2sS
	MYgFZ05H3feWi18Y0RrzjJmjrE8aYxgmwusrXaqDsgCLbBr9Ii6adkMdSzLO1iaBqSIq
	oFvQID698FaNhdEctdYU7NhO9uFhRoTLMnJPErN7es2IPMvjZWTfYEOkoTyEENhx2qv2
	CR5g==
X-Received: by 10.66.228.194 with SMTP id sk2mr2811948pac.51.1363952278494;
	Fri, 22 Mar 2013 04:37:58 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id vc4sm2689597pab.10.2013.03.22.04.37.55
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 04:37:57 -0700 (PDT)
Date: Fri, 22 Mar 2013 12:37:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <20130322113755.GS3219@jama>
References: <20130228231551.3998F5022B@opal> <20130306062358.GC14869@jama>
	<5136F97E.1030906@topic.nl>
MIME-Version: 1.0
In-Reply-To: <5136F97E.1030906@topic.nl>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] MiLo : util-linux: Add package for libmount
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
X-List-Received-Date: Fri, 22 Mar 2013 11:54:55 -0000
X-Groupsio-MsgNum: 36898
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cjNiBkmi8s9yAE0W"
Content-Disposition: inline

--cjNiBkmi8s9yAE0W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 06, 2013 at 09:08:30AM +0100, Mike Looijmans wrote:
> On 03/06/2013 07:23 AM, Martin Jansa wrote:
> > On Thu, Feb 28, 2013 at 11:15:51PM +0000, git@git.openembedded.org wrot=
e:
> >> Module: openembedded-core.git
> >> Branch: master
> >> Commit: 2e79110e31da940728d42411cad3d019d570fc31
> >> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcom=
mit;h=3D2e79110e31da940728d42411cad3d019d570fc31
> >>
> >> Author: MiLo <milo-software@users.sourceforge.net>
> >> Date:   Tue Feb 19 18:23:15 2013 +0100
> >>
> >> util-linux: Add package for libmount
> >>
> >> The libmount shared library was part of util-linux. This caused
> >> util-linux-mount to RDEPEND on util-linux, so including that would
> >> also drag in all of util-linux and all its recommendations.
> >>
> >> To break this circular dependency, add a libmount package that holds
> >> the libmount.so.* files, just like the other libraries built by util-
> >> linux.
> >
> > Breaks upgrade path:
> >
> >   * check_data_file_clashes: Package libmount1 wants to install file
> >   * /lib/libmount.so.1.1.0
> >          But that file is already provided by package  * util-linux
> >   * check_data_file_clashes: Package libmount1 wants to install file
> >   * /lib/libmount.so.1
> >          But that file is already provided by package  * util-linux
> >
> > RREPLACES is probably needed.
>=20
> Indeed, I can reproduce that too. But I'm not sure how to fix this, as I=
=20
> cannot bluntly claim that libmount replaces util-linux, because it=20
> really doesn't. So RREPLACES_util-linux-libmount =3D "util-linux" is=20
> probably not the way to go here. Or is it? It does not "feel" right=20
> anyway, because the old situation should have never happened.

It should work (it doesn't replace util-linux completely until it also
RPROVIDES it and opkg wont try to remove util-linux until it also
RCONFLICTS with ti).=20

But to be sure test it on device as with every other change.

> Prior to the libmount patch, it was not possible to remove util-linux=20
> from any system that installed util-linux-mount (or any other that=20
> requires libmount), without applying "force". And util-linux itself=20
> depends on packages that in turn depend on util-linux. That's the circle=
=20
> I wanted to break out of.
>=20
> How does one properly inform opkg that a file has moved from one=20
> (installed) package to another?

RREPLACES

> >> Signed-off-by: MiLo <milo-software@users.sourceforge.net>
> >> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> >>
> >> ---
> >>
> >>   meta/recipes-core/util-linux/util-linux.inc       |    3 +++
> >>   meta/recipes-core/util-linux/util-linux_2.22.2.bb |    2 +-
> >>   2 files changed, 4 insertions(+), 1 deletions(-)
> >>
> >> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipe=
s-core/util-linux/util-linux.inc
> >> index 10439c0..bd7b089 100644
> >> --- a/meta/recipes-core/util-linux/util-linux.inc
> >> +++ b/meta/recipes-core/util-linux/util-linux.inc
> >> @@ -31,6 +31,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-li=
nux/v${MAJOR_VERSION}/util-lin
> >>   PACKAGES =3D+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk =
util-linux-sfdisk \
> >>                util-linux-swaponoff util-linux-losetup util-linux-umou=
nt \
> >>                util-linux-mount util-linux-readprofile util-linux-libb=
lkid \
> >> +             util-linux-libmount util-linux-libmount-dev \
> >>                util-linux-libblkid-dev util-linux-libuuid util-linux-l=
ibuuid-dev \
> >>                util-linux-uuidgen util-linux-lscpu util-linux-fsck uti=
l-linux-blkid \
> >>                util-linux-mkfs util-linux-mcookie util-linux-reset"
> >> @@ -64,6 +65,8 @@ FILES_util-linux-reset =3D "${base_bindir}/reset"
> >>
> >>   FILES_util-linux-libblkid =3D "${base_libdir}/libblkid.so.*"
> >>   FILES_util-linux-libblkid-dev =3D "${base_libdir}/libblkid.so ${base=
_libdir}/libblkid.la ${includedir}/blkid ${libdir}/pkgconfig/blkid.pc"
> >> +FILES_util-linux-libmount =3D "${base_libdir}/libmount.so.*"
> >> +FILES_util-linux-libmount-dev =3D "${base_libdir}/libmount.so ${base_=
libdir}/libmount.la ${includedir}/libmount ${libdir}/pkgconfig/mount.pc"
> >>   FILES_util-linux-libuuid =3D "${base_libdir}/libuuid.so.*"
> >>   FILES_util-linux-libuuid-dev =3D "${base_libdir}/libuuid.so ${base_l=
ibdir}/libuuid.la ${includedir}/uuid ${libdir}/pkgconfig/uuid.pc"
> >>   FILES_util-linux-lscpu =3D "${bindir}/lscpu"
> >> diff --git a/meta/recipes-core/util-linux/util-linux_2.22.2.bb b/meta/=
recipes-core/util-linux/util-linux_2.22.2.bb
> >> index dd95573..f91784b 100644
> >> --- a/meta/recipes-core/util-linux/util-linux_2.22.2.bb
> >> +++ b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
> >> @@ -1,5 +1,5 @@
> >>   MAJOR_VERSION =3D "2.22"
> >> -PR =3D "r0"
> >> +PR =3D "r1"
> >>   require util-linux.inc
> >>
> >>   # note that `lscpu' is under GPLv3+
> >>
> >>
> >> _______________________________________________
> >> Openembedded-commits mailing list
> >> Openembedded-commits@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commi=
ts
> >
>=20
>=20
> --=20
> Mike Looijmans - Topic Automation
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cjNiBkmi8s9yAE0W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFMQpMACgkQN1Ujt2V2gBydzwCgpgrt5NXfEHBOYuHGWqkTnMi3
VNIAn1HQO5K+ia428uby5TjCnbY50JaW
=ou+U
-----END PGP SIGNATURE-----

--cjNiBkmi8s9yAE0W--
