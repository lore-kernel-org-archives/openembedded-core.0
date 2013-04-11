Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1UQH8j-0002C5-RU
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 15:02:10 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3BCifvm016800;
	Thu, 11 Apr 2013 07:44:41 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3BCifMW022495;
	Thu, 11 Apr 2013 07:44:41 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 11 Apr 2013 07:44:41 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [OE-core] [PATCH] kernel: Add KERNEL_LOCALVERSION to control
	version string
Thread-Index: AQHONk1uq14viwu5ykOrunPSBkx8JJjQ9+VQ
Date: Thu, 11 Apr 2013 12:44:41 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594DD96F@DLEE11.ent.ti.com>
References: <1365630434-7008-1-git-send-email-Chase.Maupin@ti.com>
	<1365630434-7008-2-git-send-email-Chase.Maupin@ti.com>
	<CADkTA4P-9V7X_R12n8SDSAgYxGE9M0Mhfadp85hPwFPFFaM7NQ@mail.gmail.com>
In-Reply-To: <CADkTA4P-9V7X_R12n8SDSAgYxGE9M0Mhfadp85hPwFPFFaM7NQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: Add KERNEL_LOCALVERSION to control version string
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
X-List-Received-Date: Thu, 11 Apr 2013 13:02:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
> Sent: Wednesday, April 10, 2013 7:42 PM
> To: Maupin, Chase
> Cc: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH] kernel: Add KERNEL_LOCALVERSION to
> control version string
>=20
> On Wed, Apr 10, 2013 at 5:47 PM, Chase Maupin
> <Chase.Maupin@ti.com> wrote:
> > * Add a variable called KERNEL_LOCALVERSION which when set will
> >   place a version string in the .scmversion file of the kernel
> >   sources.  This string will be picked up by the kernel
> Makefile
> >   and will be appended to the kernel version.  This is done to
> >   make it easier to identify what revision of the kernel
> sources
> >   are being run.  For example you can use a setting like the
> >   following to add the short commit id to the kernel version
> >   string:
> >
> > KERNEL_LOCALVERSION =3D "-g${@d.getVar('SRCPV',
> True).partition('+')[2][0:7]}"
> >
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  meta/classes/kernel.bbclass |    6 +++++-
> >  1 files changed, 5 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/classes/kernel.bbclass
> b/meta/classes/kernel.bbclass
> > index af58887..9757465 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -48,6 +48,9 @@ export CMDLINE_CONSOLE =3D
> "console=3D${@d.getVar("KERNEL_CONSOLE",1) or "ttyS0"}"
> >
> >  KERNEL_VERSION =3D "${@get_kernelversion('${B}')}"
> >
> > +# Setting KERNEL_LOCALVERSION will place a string in the
> .scmversion file
> > +# of the kernel tree.  This string will be picked up by the
> build system
> > +# of the kernel and appended to the kernel version.
> >  KERNEL_LOCALVERSION ?=3D ""
> >
> >  # kernels are generally machine specific
> > @@ -210,7 +213,8 @@ kernel_do_configure() {
> >         # $ scripts/setlocalversion . =3D> +
> >         # $ make kernelversion =3D> 2.6.37
> >         # $ make kernelrelease =3D> 2.6.37+
> > -       touch ${B}/.scmversion ${S}/.scmversion
> > +       echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
> > +       echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
>=20
> This would clobber trees that already patch, or otherwise have
> the file in place
> in their source directory.  A test to see if it already exists
> and only echo
> the variable if no one has already set it in their tree would be
> safer.

Good point.  I'll wrap this in a check and submit version 2.  I'll do the s=
ame for the U-Boot version as well.

>=20
> This will still be overridden by CONFIG_LOCALVERSION, so it is
> safe
> from that angle, but also note that it can be inhibited by
> setting
> # CONFIG_LOCALVERSION_AUTO is not set, in your .config and
> setting LOCALVERSION, but you probably already knew that!
>=20
> Cheers,
>=20
> Bruce
>=20
> >
> >         # Copy defconfig to .config if .config does not exist.
> This allows
> >         # recipes to manage the .config themselves in
> do_configure_prepend().
> > --
> > 1.7.0.4
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-
> bin/mailman/listinfo/openembedded-core
>=20
>=20
>=20
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness
> await
> thee at its end"


