Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RLHLB-0003CJ-QD
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 17:37:37 +0100
Received: by wyh5 with SMTP id 5so2469215wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2011 09:31:23 -0700 (PDT)
Received: by 10.216.89.139 with SMTP id c11mr76243wef.37.1320165083581;
	Tue, 01 Nov 2011 09:31:23 -0700 (PDT)
Received: from [10.132.203.100] ([84.241.210.38])
	by mx.google.com with ESMTPS id x40sm39229150wbn.19.2011.11.01.09.31.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 09:31:20 -0700 (PDT)
References: <cover.1320163967.git.paul.eggleton@linux.intel.com>
	<5b7c51578822d870d425fc2bf5bb282c553af292.1320163967.git.paul.eggleton@linux.intel.com>
In-Reply-To: <5b7c51578822d870d425fc2bf5bb282c553af292.1320163967.git.paul.eggleton@linux.intel.com>
Mime-Version: 1.0 (1.0)
Message-Id: <FDA49846-1679-4655-A4EB-D4FFE97FB0F6@dominion.thruhere.net>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (9A334)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 1 Nov 2011 17:31:01 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] udev: Split out consolekit and udev-acl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Nov 2011 16:37:37 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Recent udevs removed udev-acl and ck is on its way out as well. For more cha=
nges do a git log on the meta-oe udev dir :)

Op 1 nov. 2011 om 17:14 heeft Paul Eggleton <paul.eggleton@linux.intel.com> h=
et volgende geschreven:

> From: Holger Hans Peter Freyther <zecke@selfish.org>
>=20
> This can safe another megabyte on the tar.bz2 of the minimal
> image. udev-acl is linking to glibc which will pull in libglib,
> libgio, libgthread, libgmodule, libgobject.
>=20
> 2.0M 2011-07-02 01:57 after.tar.bz2
> 3.0M 2011-07-02 01:52 before.tar.bz2
>=20
> Signed-off-by: Holger Hans Peter Freyther <zecke@selfish.org>
> ---
> meta/recipes-core/udev/udev-new.inc |    6 ++++++
> meta/recipes-core/udev/udev_164.bb  |    2 +-
> 2 files changed, 7 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-core/udev/udev-new.inc b/meta/recipes-core/udev/=
udev-new.inc
> index 0247a83..eac7903 100644
> --- a/meta/recipes-core/udev/udev-new.inc
> +++ b/meta/recipes-core/udev/udev-new.inc
> @@ -35,6 +35,7 @@ libexecdir =3D "${base_libdir}/udev"
> EXTRA_OECONF =3D "--disable-introspection --with-rootlibdir=3D${base_libdi=
r} \
>                 --with-pci-ids-path=3D${datadir}/pci.ids"
>=20
> +PACKAGES =3D+ "udev-acl udev-consolekit"
> PACKAGES =3D+ "udev-cache libudev libudev-dev libudev-dbg"
> PACKAGES =3D+ "libgudev libgudev-dev libgudev-dbg"
>=20
> @@ -57,6 +58,11 @@ FILES_libgudev-dev =3D "${includedir}/gudev* ${libdir}/=
libgudev*.so ${libdir}/libg
>                      ${libdir}/libgudev*.a ${libdir}/pkgconfig/gudev*.pc"
> FILES_udev-cache =3D "${sysconfdir}/init.d/udev-cache"
>=20
> +FILES_udev-acl =3D "${base_libdir}/udev/udev-acl ${base_libdir}/udev/rule=
s.d/70-acl.rules"
> +
> +RDEPENDS_udev-consolekit +=3D "udev-acl"
> +FILES_udev-consolekit =3D "${libdir}/ConsoleKit"
> +
> do_install_append () {
>    install -d ${D}${sysconfdir}/init.d
>    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
> diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/u=
dev_164.bb
> index 689b5fd..7cbe4d8 100644
> --- a/meta/recipes-core/udev/udev_164.bb
> +++ b/meta/recipes-core/udev/udev_164.bb
> @@ -1,6 +1,6 @@
> include udev-new.inc
>=20
> -PR =3D "r5"
> +PR =3D "r6"
>=20
> SRC_URI +=3D "file://udev-166-v4l1-1.patch"
>=20
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


