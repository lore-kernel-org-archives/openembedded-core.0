Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1UNOob-0007A7-UI
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 16:37:30 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r33EKHrL011726;
	Wed, 3 Apr 2013 09:20:17 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r33EKHSW020345;
	Wed, 3 Apr 2013 09:20:17 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 3 Apr 2013 09:20:16 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Wed, 3 Apr 2013 09:20:17 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Darren Hart <dvhart@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] linux-dtb: Add simple DTB symlinks for
	devicetree
Thread-Index: AQHOL+ZelAkDDmOu90Ktwmhm5gF6R5jEi9tw
Date: Wed, 3 Apr 2013 14:20:16 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594BAE12@DLEE11.ent.ti.com>
References: <1364575688-19681-1-git-send-email-Chase.Maupin@ti.com>
	<515B455E.4030504@linux.intel.com>
In-Reply-To: <515B455E.4030504@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-dtb: Add simple DTB symlinks for devicetree
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
X-List-Received-Date: Wed, 03 Apr 2013 14:37:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@linux.intel.com]
> Sent: Tuesday, April 02, 2013 3:54 PM
> To: Maupin, Chase
> Cc: openembedded-core@lists.openembedded.org; Ashfield, Bruce
> Subject: Re: [OE-core] [PATCH] linux-dtb: Add simple DTB symlinks
> for devicetree
>=20
>=20
>=20
> On 03/29/2013 09:48 AM, Chase Maupin wrote:
> > * This is similar to the symlinks provided for the kernel image
> >   in the /boot directory of a file system.  The goal is to have
> >   simply named symlinks in /boot that mirror the device tree
> >   name in the kernel sources.  This is so that programs like
> >   U-Boot can easily find the default device tree binary in the
> >   /boot directory and use that when booting the kernel.
> > * Use update-alternatives to handle proper creation and removal
> >   of the symlinks.
>=20
> Hi Chase,
>=20
> So I have no experience myself with Device Tree. Adding Bruce A.
> for some
> additional review.
>=20
> I am going to assume this is the right thing to do for u-boot
> systems.
> Which devices have you verified this as working with?

OMAP5 uEVM and AM335x EVM.  For these devices U-Boot does a simple extload =
from the /boot directory of the dtb.  The goal here is to have the dtb name=
 in /boot match the name that would be generated when you build the dtb in =
the kernel.

For example the omap5-uevm.dts file is compiled as omap5-uevm.dtb.  So usin=
g a symlink with this standard naming makes it easier for u-boot to detect =
the device it is running on and look for the standard file name vs devicetr=
ee-uImage-omap5-evm.dtb.

Also, for people that want to load the dtb from other locations such as a d=
ifferent partition on the SD card they can still just copy the dtb file fro=
m the kernel build and not need to modify u-boot to use the different file =
name, just the location.

>=20
> >
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  meta/recipes-kernel/linux/linux-dtb.inc |   20
> ++++++++++++++++++++
> >  1 files changed, 20 insertions(+), 0 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-dtb.inc
> b/meta/recipes-kernel/linux/linux-dtb.inc
> > index ec6c375..66cf255 100644
> > --- a/meta/recipes-kernel/linux/linux-dtb.inc
> > +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> > @@ -45,3 +45,23 @@ do_deploy_append() {
> >          done
> >      fi
> >  }
> > +
> > +pkg_postinst_kernel-devicetree () {
>=20
> Please use tabs for bash functions. Oddly, I see the only tabs in
> this
> file are in the anonymous python blocks. Doh.
>=20
> > +    cd /${KERNEL_IMAGEDEST}
> > +    for DTS_FILE in ${KERNEL_DEVICETREE}
> > +    do
> > +        DTS_BASE_NAME=3D`basename ${DTS_FILE} | awk -F "."
> '{print $1}'`
> > +        DTB_NAME=3D"devicetree-uImage-${DTS_BASE_NAME}.dtb"
>=20
>=20
> Is "uImage" always correct here? Or should we be using
> ${KERNEL_IMAGETYPE} here?
>=20
>=20
> > +        update-alternatives --install
> /${KERNEL_IMAGEDEST}/${DTS_BASE_NAME}.dtb ${DTS_BASE_NAME}.dtb
> ${DTB_NAME} ${KERNEL_PRIORITY} || true
> > +    done
> > +}
> > +
> > +pkg_postrm_kernel-devicetree () {
> > +    cd /${KERNEL_IMAGEDEST}
> > +    for DTS_FILE in ${KERNEL_DEVICETREE}
> > +    do
> > +        DTS_BASE_NAME=3D`basename ${DTS_FILE} | awk -F "."
> '{print $1}'`
> > +        DTB_NAME=3D"devicetree-uImage-${DTS_BASE_NAME}.dtb"
> > +        update-alternatives --remove ${DTS_BASE_NAME}.dtb
> ${DTB_NAME} ${KERNEL_PRIORITY} || true
> > +    done
> > +}
> >
>=20
> Thanks,
>=20
> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Technical Lead - Linux Kernel


