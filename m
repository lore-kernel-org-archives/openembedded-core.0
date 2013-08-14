Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by mail.openembedded.org (Postfix) with ESMTP id 9929D61220
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 15:44:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7EFi34s030641;
	Wed, 14 Aug 2013 10:44:03 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7EFi2Te020046;
	Wed, 14 Aug 2013 10:44:02 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Wed, 14 Aug 2013 10:44:02 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [OE-core] [PATCH] linux-dtb.inc: Run dts through the preprocessor
Thread-Index: AQHOmP9k/mnNR2f0O02Gi16UCGKlCZmVJsQA//+scKA=
Date: Wed, 14 Aug 2013 15:44:02 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C51C5AA@DFLE08.ent.ti.com>
References: <1376494338-11646-1-git-send-email-fcooper@ti.com>
	<1376494338-11646-2-git-send-email-fcooper@ti.com>
	<CADkTA4M3MDkpPuZ2kEq6Uz-RfGyDLBUNK0npsxCB=is8M9JMYQ@mail.gmail.com>
In-Reply-To: <CADkTA4M3MDkpPuZ2kEq6Uz-RfGyDLBUNK0npsxCB=is8M9JMYQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-dtb.inc: Run dts through the preprocessor
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
X-List-Received-Date: Wed, 14 Aug 2013 15:44:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
> Sent: Wednesday, August 14, 2013 10:25 AM
> To: Cooper Jr., Franklin
> Cc: Patches and discussions about the oe-core layer; Otavio Salvador
> Subject: Re: [OE-core] [PATCH] linux-dtb.inc: Run dts through the preproc=
essor
>=20
> On Wed, Aug 14, 2013 at 11:32 AM, Franklin S. Cooper Jr <fcooper@ti.com>
> wrote:
> > * In the 3.11 kernel some dts files now include C code that must first =
run
> >   through the preprocessor.
> > * Update building the dtb by first running the dts file through the use=
r's
> >   compiler before building using the device tree compiler.
> > * The logic used is based on mainline u-boot dts/Makefile.
>=20
> We are already working through a change from Otavio that changes the way =
we
> build DTB files, using the in kernel resources.
>=20
> So this shouldn't be required in the end, or at least heavily modified.
>=20
> So I suggest we hold on this change for now, and rebase it once the patch=
 I
> mentioned is merged.

No issue on my end. As long as one of our patches makes it in master and Dy=
lan I will be happy.
>=20
> Bruce
>=20
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  meta/recipes-kernel/linux/linux-dtb.inc |    5 ++++-
> >  1 files changed, 4 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-dtb.inc
> > b/meta/recipes-kernel/linux/linux-dtb.inc
> > index 41dd599..f1aafa2 100644
> > --- a/meta/recipes-kernel/linux/linux-dtb.inc
> > +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> > @@ -21,7 +21,10 @@ do_install_append() {
> >                         DTS_BASE_NAME=3D`basename ${DTS_FILE} | awk -F =
"." '{print
> $1}'`
> >                         DTB_NAME=3D`echo ${KERNEL_IMAGE_BASE_NAME} | se=
d
> "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> >                         DTB_SYMLINK_NAME=3D`echo
> ${KERNEL_IMAGE_SYMLINK_NAME} | sed
> "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> > -                       dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o
> ${DTS_BASE_NAME} ${DTS_FILE}
> > +
> > +                       cat ${DTS_FILE} | \
> > +                               ${CPP} -x assembler-with-cpp -I ./inclu=
de/ -I
> ./arch/${ARCH}/boot/dts - | \
> > +                               dtc ${KERNEL_DEVICETREE_FLAGS} -O dtb
> > + -o ${DTS_BASE_NAME} -i arch/${ARCH}/boot/dts/ -
> >                         install -m 0644 ${DTS_BASE_NAME}
> ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
> >                 done
> >         fi
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
>=20
>=20
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee=
 at its
> end"

