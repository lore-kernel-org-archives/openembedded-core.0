Return-Path: <Adrian.Calianu@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 2B3F26FC99
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 06:43:25 +0000 (UTC)
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX03.enea.se ([fe80::6ce7:7b51:1edf:e245%17]) with mapi id
	14.03.0158.001; Fri, 13 Jun 2014 08:43:21 +0200
From: Adrian Calianu <Adrian.Calianu@enea.com>
To: Otavio Salvador <otavio@ossystems.com.br>, Adrian Calianu
	<Adrian.Calianu@enea.com>
Thread-Topic: [OE-core] [PATCHv2 1/2] Add wic support to generate rootfs
	image for uboot
Thread-Index: AQHPhkbyxgZGPOuHKEqPIBeQFtAIHJtulkvQ
Date: Fri, 13 Jun 2014 06:43:21 +0000
Message-ID: <A1661D2DDD942248A02617DE63569A0125CBC134@SESTOEX04.enea.se>
References: <5399151E.3050306@linux.intel.com>
	<53996893.88fd440a.0627.25d6SMTPIN_ADDED_BROKEN@mx.google.com>
	<CAP9ODKrZ9qdGooL3YFBayfsURfaXJm513dX67V49ESidSyzRdg@mail.gmail.com>
In-Reply-To: <CAP9ODKrZ9qdGooL3YFBayfsURfaXJm513dX67V49ESidSyzRdg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.14.142]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/2] Add wic support to generate rootfs image for uboot
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
X-List-Received-Date: Fri, 13 Jun 2014 06:43:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Otavio,

	First step was to add support in wic to generate rootfs images only from p=
ackages out of bitbake environment.
	To test this functionality was chosen to generate ramdisk images for now. =
We have plans to extend the U-Boot plugin in order to generate other types =
of rootfs images.

Thanks,
Adrian

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Otavio Salvador
> Sent: Thursday, June 12, 2014 5:02 PM
> To: y@enea.se
> Cc: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCHv2 1/2] Add wic support to generate rootfs
> image for uboot
>=20
> Hello,
>=20
> On Thu, Jun 12, 2014 at 5:43 AM,  <y@enea.se> wrote:
> > From: Adrian Calianu <adrian.calianu@enea.com>
> >
> > Add support in wic to build ramdisk uboot images from list of packages
> > or from an existing rootfs folder.
> >
> > Providing the list of packages starting with XXX-core-boot
> > package(into wks file) will generate an rootfs image for uboot out of
> bitbake.
> > There is also possible to combine an existing/application rootfs with
> > a list of packages that can be installed but the user must take care
> > to provide a basic core boot rootfs or XXX-core-boot package and
> reporul(wic.conf).
> >
> > Some prerequisites are required for this new build setup:
> > ../poky/scripts/lib/image/config/wic.conf
> > [create]
> > arch=3Dtarget_arch (example: powerpc, arm, x86) pkgmgr=3Dopkg
> > repourl=3Dhttp://example.distro/p2020rdb/ipk/all
> > http://example.distro/p2020rdb/ipk/p2020rdb
> > http://example.distro/p2020rdb/ipk/ppce500v2
> >
> >     1) Build an rootfs image from an existing bitbake build:
> >        wic create ../poky/scripts/lib/image/canned-wks/uboot.wks -e
> > core-image-minimal -o .../output
> >
> >     2) Build an rootfs image from an existing rootfs and native_sysroot=
:
> >        wic create ../poky/scripts/lib/image/canned-wks/uboot.wks -r
> > .../path_to_rootfs -n .../path_to_native_sysroot -o .../output
> >
> >     3) Build an rootfs image only from a package list (on wks file):
> >
> >        Add the package list to be installed as rootfs on
> ../poky/scripts/lib/image/canned-wks/uboot.wks:
> >        %packages
> >        packagegroup-core-boot
> >        pramfs-init
> >        run-postinsts
> >        packagegroup-core-ssh-dropbear
> >        %end
> >
> >        Generate rootfs image:
> >        wic create ../poky/scripts/lib/image/canned-wks/uboot.wks  -n
> > .../path_to_native_sysroot -o .../output
> >
> > Signed-off-by: Adrian Calianu <adrian.calianu@enea.com>
>=20
> I really liked the idea and it is a nice step further but it is not clear=
 to me how
> we'll "tell" wic about platform specific U-Boot installation like i.MX vs=
 MXS
> where the layout of the uSD image is very different.
>=20
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

