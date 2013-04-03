Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1UNRKV-0008UA-0N
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 19:18:35 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r33H1KSl031672;
	Wed, 3 Apr 2013 12:01:20 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r33H1KhI014303;
	Wed, 3 Apr 2013 12:01:20 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Wed, 3 Apr 2013 12:01:20 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Darren Hart <dvhart@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] linux-dtb: Add simple DTB symlinks for
	devicetree
Thread-Index: AQHOL+ZelAkDDmOu90Ktwmhm5gF6R5jEuVJQ
Date: Wed, 3 Apr 2013 17:01:20 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594BB895@DLEE11.ent.ti.com>
References: <1364575688-19681-1-git-send-email-Chase.Maupin@ti.com>
	<515B455E.4030504@linux.intel.com>
In-Reply-To: <515B455E.4030504@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
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
X-List-Received-Date: Wed, 03 Apr 2013 17:18:35 -0000
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

Sorry, I didn't notice this comment before.  I can reset this for tabs inst=
ead of space.  I'll send a new version.

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

Good point.  I'll update this as well.

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


