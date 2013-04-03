Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1UNRiR-0001Op-8C
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 19:43:29 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r33HQ54o028925;
	Wed, 3 Apr 2013 12:26:05 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r33HQ51s011992;
	Wed, 3 Apr 2013 12:26:05 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Wed, 3 Apr 2013 12:26:05 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>, Darren Hart
	<dvhart@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] linux-dtb: Add simple DTB symlinks for
	devicetree
Thread-Index: AQHOMIXOlpBe3OqXY0icySBo822p3ZjEvmLw
Date: Wed, 3 Apr 2013 17:26:04 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594BB9DF@DLEE11.ent.ti.com>
References: <1364575688-19681-1-git-send-email-Chase.Maupin@ti.com>
	<515B455E.4030504@linux.intel.com> <515C5442.4060307@windriver.com>
In-Reply-To: <515C5442.4060307@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-dtb: Add simple DTB symlinks for	devicetree
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
X-List-Received-Date: Wed, 03 Apr 2013 17:43:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On
> Behalf Of Bruce Ashfield
> Sent: Wednesday, April 03, 2013 11:10 AM
> To: Darren Hart
> Cc: openembedded-core@lists.openembedded.org; Maupin, Chase
> Subject: Re: [OE-core] [PATCH] linux-dtb: Add simple DTB symlinks
> for devicetree
>=20
> On 13-04-02 04:53 PM, Darren Hart wrote:
> >
> >
> > On 03/29/2013 09:48 AM, Chase Maupin wrote:
> >> * This is similar to the symlinks provided for the kernel
> image
> >>    in the /boot directory of a file system.  The goal is to
> have
> >>    simply named symlinks in /boot that mirror the device tree
> >>    name in the kernel sources.  This is so that programs like
> >>    U-Boot can easily find the default device tree binary in
> the
> >>    /boot directory and use that when booting the kernel.
> >> * Use update-alternatives to handle proper creation and
> removal
> >>    of the symlinks.
> >
> > Hi Chase,
> >
> > So I have no experience myself with Device Tree. Adding Bruce
> A. for some
> > additional review.
> >
> > I am going to assume this is the right thing to do for u-boot
> systems.
> > Which devices have you verified this as working with?
> >
> >>
> >> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> >> ---
> >>   meta/recipes-kernel/linux/linux-dtb.inc |   20
> ++++++++++++++++++++
> >>   1 files changed, 20 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc
> b/meta/recipes-kernel/linux/linux-dtb.inc
> >> index ec6c375..66cf255 100644
> >> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> >> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> >> @@ -45,3 +45,23 @@ do_deploy_append() {
> >>           done
> >>       fi
> >>   }
> >> +
> >> +pkg_postinst_kernel-devicetree () {
> >
> > Please use tabs for bash functions. Oddly, I see the only tabs
> in this
> > file are in the anonymous python blocks. Doh.
> >
> >> +    cd /${KERNEL_IMAGEDEST}
> >> +    for DTS_FILE in ${KERNEL_DEVICETREE}
> >> +    do
> >> +        DTS_BASE_NAME=3D`basename ${DTS_FILE} | awk -F "."
> '{print $1}'`
> >> +        DTB_NAME=3D"devicetree-uImage-${DTS_BASE_NAME}.dtb"
> >
> >
> > Is "uImage" always correct here? Or should we be using
> > ${KERNEL_IMAGETYPE} here?
>=20
> I was trying to figure out the same thing when reviewing this
> change this morning.
>=20
> I'm not alternatives expert, but isn't DTB_NAME just the name
> of the alternate being introduced ? If that's the case, why not
> continue to use what the rest of the linux-dtb file uses ?
>=20
>              DTB_NAME=3D`echo ${KERNEL_IMAGE_BASE_NAME} | sed
> "s/${MACHINE}/${DTS_BASE_NAME}/g"`

From the do_install section the file I'm trying to symlink to is installed =
as

install -m 0644 ${DTS_BASE_NAME} ${D}/boot/devicetree-${DTB_SYMLINK_NAME}.d=
tb

So there isn't quite a variable that holds the proper value.  However, I sh=
ould be able to make this match more with the do_install section by using D=
TB_SYMLINK_NAME.  I'll send a patch once I make the change and can test it.




>=20
> But outside of that (and Darren't already pending comments), the
> approach
> looks fine and valid to me.
>=20
> Cheers,
>=20
> Bruce
>=20
> >
> >
> >> +        update-alternatives --install
> /${KERNEL_IMAGEDEST}/${DTS_BASE_NAME}.dtb ${DTS_BASE_NAME}.dtb
> ${DTB_NAME} ${KERNEL_PRIORITY} || true
> >> +    done
> >> +}
> >> +
> >> +pkg_postrm_kernel-devicetree () {
> >> +    cd /${KERNEL_IMAGEDEST}
> >> +    for DTS_FILE in ${KERNEL_DEVICETREE}
> >> +    do
> >> +        DTS_BASE_NAME=3D`basename ${DTS_FILE} | awk -F "."
> '{print $1}'`
> >> +        DTB_NAME=3D"devicetree-uImage-${DTS_BASE_NAME}.dtb"
> >> +        update-alternatives --remove ${DTS_BASE_NAME}.dtb
> ${DTB_NAME} ${KERNEL_PRIORITY} || true
> >> +    done
> >> +}
> >>
> >
> > Thanks,
> >
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-
> core


