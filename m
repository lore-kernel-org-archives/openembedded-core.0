Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id EBC5B605BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 12:18:30 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u3JCIUZs025892; Tue, 19 Apr 2016 07:18:30 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016041907181367-66561 ;
	Tue, 19 Apr 2016 07:18:13 -0500 
Date: Tue, 19 Apr 2016 15:17:56 +0300
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Message-ID: <20160419151756.65c09607@adi-pc-linux.emea.corp.natinst.com>
In-Reply-To: <20160418132411.GA27403@linux.intel.com>
References: <1460983582-15284-1-git-send-email-adrian.ratiu@ni.com>
	<20160418132411.GA27403@linux.intel.com>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 04/19/2016 07:18:13 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 04/19/2016 07:18:13 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-04-19_09:, , signatures=0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: isoimage-isohybrid: implement grubefi menu logic
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
X-List-Received-Date: Tue, 19 Apr 2016 12:18:33 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello Ed,

I've tested it on Jethro. Sorry about this. I'll look at the changes in wic=
's kickstart and redo/resubmit.

Thank you,
Ioan

On Mon, 18 Apr 2016 16:24:11 +0300
Ed Bartosh <ed.bartosh@linux.intel.com> wrote:

> Hi Ioan-Adrian,
>=20
> Did you test if this patch works on master?
> From the first look I'd say it will not work as --menu bootloader
> option is not implemented there.
>=20
> On Mon, Apr 18, 2016 at 03:46:22PM +0300, Ioan-Adrian Ratiu wrote:
> > Right now isoimage-isohybrid creates a single boot menu entry "boot"
> > and passes it the arguments supplied with "--append". There is logic
> > for creating custom grub menus, but it is sadly not used. "boot" is
> > hardcoded.
> >=20
> > This change makes isoimage use the wic bootloader "--menu" argument to
> > create its menus. The syntax used for menu specification was chosen so
> > it does not conflict with the kernel parameter syntax (you can pass
> > custom kernel arguments from the generated grub menu entries, like for
> > example silent booting, thread affinity etc.).
> >=20
> > The "--menu" argument syntax is as following. The argument supplies a
> > collection of menu entry names and kernel parameters. Menu name entries
> > can contain any ASCII character except | or : which are separators.
> > Kernel parameters obey the syntax defined by the kernel documentation.
> > | is the menu separator and : is the separator between the menu names
> > and parameters.
> >=20
> > Example for use in wks files:
> >   --menu "Menu Name:firstarg,secondard|Menu Name 2:anotherarg,otherarg"
> >=20
> > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > ---
> >  .../lib/wic/plugins/source/isoimage-isohybrid.py   | 35 ++++++++++++++=
++------
> >  1 file changed, 26 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scr=
ipts/lib/wic/plugins/source/isoimage-isohybrid.py
> > index bc99283..4b0b035 100644
> > --- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> > +++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> > @@ -101,23 +101,40 @@ class IsoImagePlugin(SourcePlugin):
> >              splashline =3D ""
> > =20
> >          bootloader =3D creator.ks.bootloader
> > +        kernel =3D "/bzImage"
> > +        default=5Foptions =3D bootloader.append
> > +        default=5Fmenu=5Fto=5Fboot =3D "Default boot"
> > +        grub=5Fmenus =3D ""
> > +
> > +        # menu separators are '|', custom boot args separated by ':', =
ex.
> > +        # --menu "Menu Name:firstarg,secondard|Menu Name 2:anotherarg,=
otherarg"
> > +        for menu in bootloader.menus.split('|'):
> > +            menu=5Flist =3D menu.split(":")
> > +            menu=5Fname =3D menu=5Flist[0]
> > +            grub=5Fmenu=5Foptions =3D ""
> > +
> > +            if (len(menu=5Flist) > 1):
> > +                menu=5Fparams =3D menu=5Flist[1]
> > +                for param in menu=5Fparams.split(','):
> > +                    if param.lower() =3D=3D "default":
> > +                        default=5Fmenu=5Fto=5Fboot =3D menu=5Fname
> > +                    else: grub=5Fmenu=5Foptions +=3D " " + param
> > +
> > +            grub=5Fmenus +=3D "menuentry '%s' {\n" % menu=5Fname
> > +            grub=5Fmenus +=3D "linux %s rootwait %s %s\n" % \
> > +                (kernel, default=5Foptions, grub=5Fmenu=5Foptions)
> > +            grub=5Fmenus +=3D "initrd /initrd \n"
> > +            grub=5Fmenus +=3D "}\n"
> > =20
> >          grubefi=5Fconf =3D ""
> >          grubefi=5Fconf +=3D "serial --unit=3D0 --speed=3D115200 --word=
=3D8 "
> >          grubefi=5Fconf +=3D "--parity=3Dno --stop=3D1\n"
> > -        grubefi=5Fconf +=3D "default=3Dboot\n"
> > +        grubefi=5Fconf +=3D "default=3D%s\n" % default=5Fmenu=5Fto=5Fb=
oot
> >          grubefi=5Fconf +=3D "timeout=3D%s\n" % (bootloader.timeout or =
10)
> >          grubefi=5Fconf +=3D "\n"
> >          grubefi=5Fconf +=3D "search --set=3Droot --label %s " % part.l=
abel
> >          grubefi=5Fconf +=3D "\n"
> > -        grubefi=5Fconf +=3D "menuentry 'boot'{\n"
> > -
> > -        kernel =3D "/bzImage"
> > -
> > -        grubefi=5Fconf +=3D "linux %s rootwait %s\n" \
> > -            % (kernel, bootloader.append)
> > -        grubefi=5Fconf +=3D "initrd /initrd \n"
> > -        grubefi=5Fconf +=3D "}\n"
> > +        grubefi=5Fconf +=3D grub=5Fmenus
> > =20
> >          if splashline:
> >              grubefi=5Fconf +=3D "%s\n" % splashline =20
>=20
> --
> Regards,
> Ed


