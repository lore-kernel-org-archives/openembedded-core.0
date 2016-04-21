Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id D002360667
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 09:42:54 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u3L9gqd8020335; Thu, 21 Apr 2016 04:42:52 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016042104423298-160989 ;
	Thu, 21 Apr 2016 04:42:32 -0500 
Date: Thu, 21 Apr 2016 12:42:22 +0300
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Message-ID: <20160421124222.70717b89@adi-pc-linux.emea.corp.natinst.com>
In-Reply-To: <20160421070331.GA24300@linux.intel.com>
References: <1461164775-2983-1-git-send-email-adrian.ratiu@ni.com>
	<20160420180838.49f65959@adi-pc-linux.emea.corp.natinst.com>
	<20160421070331.GA24300@linux.intel.com>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 04/21/2016 04:42:33 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 04/21/2016 04:42:33 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-04-21_06:, , signatures=0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: isoimage-isohybrid: add grubefi configfile support
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
X-List-Received-Date: Thu, 21 Apr 2016 09:42:56 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 21 Apr 2016 10:03:31 +0300
Ed Bartosh <ed.bartosh@linux.intel.com> wrote:

> On Wed, Apr 20, 2016 at 06:08:38PM +0300, Ioan-Adrian Ratiu wrote:
> > I forgot to mention this is v2... sorry.
> >=20
> > On Wed, 20 Apr 2016 18:06:15 +0300
> > Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> >  =20
> > > The latest wic kickstart refactoring introduced a bootloader option
> > > "--configfile" which lets wks' specify a custom grub.cfg for use
> > > while booting. This is very useful for creating stuff like boot menus.
> > >=20
> > > This change lets isoimage-isohybrid use --configfile; if this option =
is
> > > not specified in a wks, it generates a default cfg as before.
> > >=20
> > > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > > ---
> > >  .../lib/wic/plugins/source/isoimage-isohybrid.py   | 53 ++++++++++++=
+---------
> > >  1 file changed, 32 insertions(+), 21 deletions(-)
> > >=20
> > > diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/s=
cripts/lib/wic/plugins/source/isoimage-isohybrid.py
> > > index bc99283..8440581 100644
> > > --- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> > > +++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> > > @@ -27,6 +27,7 @@ import glob
> > > =20
> > >  from wic import msger
> > >  from wic.pluginbase import SourcePlugin
> > > +from wic.utils.misc import get=5Fcustom=5Fconfig
> > >  from wic.utils.oe.misc import exec=5Fcmd, exec=5Fnative=5Fcmd, get=
=5Fbitbake=5Fvar
> > > =20
> > >  class IsoImagePlugin(SourcePlugin):
> > > @@ -94,33 +95,43 @@ class IsoImagePlugin(SourcePlugin):
> > >          """
> > >          Create loader-specific (grub-efi) config
> > >          """
> > > -        splash =3D os.path.join(cr=5Fworkdir, "/EFI/boot/splash.jpg")
> > > -        if os.path.exists(splash):
> > > -            splashline =3D "menu background splash.jpg"
> > > +        configfile =3D creator.ks.bootloader.configfile
> > > +        if configfile:
> > > +            grubefi=5Fconf =3D get=5Fcustom=5Fconfig(configfile)
> > > +            if grubefi=5Fconf:
> > > +                msger.debug("Using custom configuration file "
> > > +                        "%s for grub.cfg" % configfile)
> > > +            else:
> > > +                msger.error("configfile is specified but failed to "
> > > +                        "get it from %s." % configfile)
> > >          else:
> > > -            splashline =3D ""
> > > +            splash =3D os.path.join(cr=5Fworkdir, "/EFI/boot/splash.=
jpg") =20
> I know, it's not your code, but it looks like the result path(splash
> variable) will not include workdir. Look:
>=20
> In [2]: os.path.join('/path/to/workdir', '/EFI/boot/splash.jpg')
> Out[2]: '/EFI/boot/splash.jpg'
>=20
> In [3]: os.path.join('/path/to/workdir/', '/EFI/boot/splash.jpg')
> Out[3]: '/EFI/boot/splash.jpg'
>=20
> It works this way:
> In [4]: os.path.join('/path/to/workdir/', 'EFI/boot/splash.jpg')
> Out[4]: '/path/to/workdir/EFI/boot/splash.jpg'
>=20

Thanks for spotting this. I'll send another patch to fix it.

Ioan

> > > +            if os.path.exists(splash):
> > > +                splashline =3D "menu background splash.jpg"
> > > +            else:
> > > +                splashline =3D ""
> > > =20
> > > -        bootloader =3D creator.ks.bootloader
> > > +            bootloader =3D creator.ks.bootloader
> > > =20
> > > -        grubefi=5Fconf =3D ""
> > > -        grubefi=5Fconf +=3D "serial --unit=3D0 --speed=3D115200 --wo=
rd=3D8 "
> > > -        grubefi=5Fconf +=3D "--parity=3Dno --stop=3D1\n"
> > > -        grubefi=5Fconf +=3D "default=3Dboot\n"
> > > -        grubefi=5Fconf +=3D "timeout=3D%s\n" % (bootloader.timeout o=
r 10)
> > > -        grubefi=5Fconf +=3D "\n"
> > > -        grubefi=5Fconf +=3D "search --set=3Droot --label %s " % part=
.label
> > > -        grubefi=5Fconf +=3D "\n"
> > > -        grubefi=5Fconf +=3D "menuentry 'boot'{\n"
> > > +            grubefi=5Fconf =3D ""
> > > +            grubefi=5Fconf +=3D "serial --unit=3D0 --speed=3D115200 =
--word=3D8 "
> > > +            grubefi=5Fconf +=3D "--parity=3Dno --stop=3D1\n"
> > > +            grubefi=5Fconf +=3D "default=3Dboot\n"
> > > +            grubefi=5Fconf +=3D "timeout=3D%s\n" % (bootloader.timeo=
ut or 10)
> > > +            grubefi=5Fconf +=3D "\n"
> > > +            grubefi=5Fconf +=3D "search --set=3Droot --label %s " % =
part.label
> > > +            grubefi=5Fconf +=3D "\n"
> > > +            grubefi=5Fconf +=3D "menuentry 'boot'{\n"
> > > =20
> > > -        kernel =3D "/bzImage"
> > > +            kernel =3D "/bzImage"
> > > =20
> > > -        grubefi=5Fconf +=3D "linux %s rootwait %s\n" \
> > > -            % (kernel, bootloader.append)
> > > -        grubefi=5Fconf +=3D "initrd /initrd \n"
> > > -        grubefi=5Fconf +=3D "}\n"
> > > +            grubefi=5Fconf +=3D "linux %s rootwait %s\n" \
> > > +                            % (kernel, bootloader.append)
> > > +            grubefi=5Fconf +=3D "initrd /initrd \n"
> > > +            grubefi=5Fconf +=3D "}\n"
> > > =20
> > > -        if splashline:
> > > -            grubefi=5Fconf +=3D "%s\n" % splashline
> > > +            if splashline:
> > > +                grubefi=5Fconf +=3D "%s\n" % splashline
> > > =20
> > >          msger.debug("Writing grubefi config %s/EFI/BOOT/grub.cfg" \
> > >                          % cr=5Fworkdir) =20
> >=20
> > --=20
> > =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core =20
>=20


