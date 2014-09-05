Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id 14B337135D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 09:13:15 +0000 (UTC)
Received: from e6520eb (unknown [88.170.243.169])
	(Authenticated sender: eukrea)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6268EA621D;
	Fri,  5 Sep 2014 11:13:14 +0200 (CEST)
Date: Fri, 5 Sep 2014 11:13:13 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Dvorkin Dmitry <dvorkin@tibbo.com>
Message-ID: <20140905111313.0f978efd@e6520eb>
In-Reply-To: <540975F3.7050806@tibbo.com>
References: <540975F3.7050806@tibbo.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.10.1 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: wrong automatic dependency
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
X-List-Received-Date: Fri, 05 Sep 2014 09:13:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Dvorkin,

Le Fri, 05 Sep 2014 16:36:03 +0800,
Dvorkin Dmitry <dvorkin@tibbo.com> a =E9crit :

>=20
> Hello!
>=20
> I wrote my own recipe for crda.
> (http://wireless.kernel.org/en/developers/Regulatory/CRDA)
>=20
> Dependencies is:
> DEPENDS =3D "libgcrypt libnl"
> RDEPENDS_${PN} =3D "udev wireless-regdb"
>=20
> Crda Makefile is using python to rebuild it's database in=20
> build/installation step.
> After installation I have several packages: crda itself, crda-dev,=20
> crda-doc, ... etc.
> In my image I'm using only 'crda' package that doesn't need python.
>=20
> But it seems Yocto detects python and add automatic dependency of python=
=20
> to my image anyway.
>=20
> $ grep "crda" ./*.dot | grep pyt
> ./task-depends.dot:"crda.do_build" -> "python-dbus.do_package_write_ipk"
> ./task-depends.dot:"crda.do_build" -> "python.do_package_write_rpm"
> ./task-depends.dot:"crda.do_build" -> "python.do_package_write_deb"
> ./task-depends.dot:"crda.do_build" -> "python.do_package_write_ipk"
> ./task-depends.dot:"crda.do_build" ->=20
> "python-pygobject.do_package_write_rpm"
> ./task-depends.dot:"crda.do_build" ->=20
> "python-pygobject.do_package_write_deb"
> ./task-depends.dot:"crda.do_build" ->=20
> "python-pygobject.do_package_write_ipk"
> ./task-depends.dot:"crda.do_build" -> "python-dbus.do_package_write_rpm"
> ./task-depends.dot:"crda.do_build" ->
> "python-dbus.do_package_write_deb"
>=20
> Is there any way to get rid of python dependency in this and only
> this recipe? it makes my image significally bigger.

are you sure python is drawn in your image by crda ?

With the existing recipe, I don't get python RDEPENDS in crda :
http://layers.openembedded.org/layerindex/recipe/4179/

$ cat cortexa9hf-vfp-neon-oe-linux-gnueabi/crda/crda/latest=20
PV =3D 1.1.3
PR =3D r0
RPROVIDES =3D=20
RDEPENDS =3D eglibc (>=3D 2.18) libgcrypt (>=3D 1.5.3) libnl (>=3D 3.2.22) =
libnl-genl (>=3D 3.2.22) udev
RRECOMMENDS =3D=20
PKGSIZE =3D 21773
FILES =3D /usr/bin/* /usr/sbin/* /usr/lib/crda/* /usr/lib/lib*.so.* /etc /c=
om /var /bin/* /sbin/* /lib/*.so.* /lib/udev/rules.d /usr/lib/udev/rules.d =
/usr/share/crda /usr/lib/crda/* /usr/share/pixmaps /usr/share/applications =
/usr/share/idl /usr/share/omf /usr/share/sounds /usr/lib/bonobo/servers /us=
r/libcrda/regulatory.bin /lib/udev/rules.d/85-regulatory.rules
FILELIST
=3D /lib/udev/rules.d/85-regulatory.rules /sbin/crda /sbin/regdbdump /usr/l=
ib/crda/regulatory.bin

Eric

