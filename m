Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1SjNDu-0004mg-KK
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jun 2012 06:17:54 +0200
Received: from mail176-ch1-R.bigfish.com (10.43.68.229) by
	CH1EHSOBE002.bigfish.com (10.43.70.52) with Microsoft SMTP Server id
	14.1.225.23; Tue, 26 Jun 2012 03:35:06 +0000
Received: from mail176-ch1 (localhost [127.0.0.1])	by
	mail176-ch1-R.bigfish.com (Postfix) with ESMTP id 532641E01C2;
	Tue, 26 Jun 2012 03:35:06 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -8
X-BigFish: VS-8(zzbb2dI98dI9371I542M1432Izz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h944hd25hf0ahbe9i)
Received: from mail176-ch1 (localhost.localdomain [127.0.0.1]) by mail176-ch1
	(MessageSwitch) id 1340681704582033_20698;
	Tue, 26 Jun 2012 03:35:04 +0000 (UTC)
Received: from CH1EHSMHS027.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.244])	by mail176-ch1.bigfish.com (Postfix) with ESMTP id
	821FC18004E;	Tue, 26 Jun 2012 03:35:04 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS027.bigfish.com
	(10.43.70.27) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 26 Jun 2012 03:35:04 +0000
Received: from 039-SN2MPN1-021.039d.mgd.msft.net ([169.254.1.203]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0298.005; Mon, 25 Jun 2012 22:36:43 -0500
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH oe-core v6] linux-dtb: add multi-dtb build
	support and keep dtb in deploy cache package
Thread-Index: AQHMzn9tDrr0qwwVYki24aA62itX3pYFfRCAgQd1AwA=
Date: Tue, 26 Jun 2012 03:36:43 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A011F83B2@039-SN2MPN1-021.039d.mgd.msft.net>
References: <1326080274-1998-1-git-send-email-b19537@freescale.com>
	<4F0BCFEF.7000207@linux.intel.com>
In-Reply-To: <4F0BCFEF.7000207@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.114]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH oe-core v6] linux-dtb: add multi-dtb build support and keep dtb in deploy cache package
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
X-List-Received-Date: Tue, 26 Jun 2012 04:17:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Saul,=20

In this patch, dtb files are installed into ${D} and ${DEPLOYDIR} by kernel=
_do_deploy, there is a race issue of do_deploy and do_package.

"do_package" runs before dtb are installed into ${D}, so there is no dtb in=
 /boot/devicetree/ and kernel-devicetree binary package is not generated du=
e to empty content.

I will send out a patch to do ${D} install and ${DEPLOYDIR} install in sepa=
rated steps: do_install and do_deploy.=20


Best Regards,

Zhenhua


> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Tuesday, January 10, 2012 1:43 PM
> To: Patches and discussions about the oe-core layer
> Cc: Luo Zhenhua-B19537
> Subject: Re: [OE-core] [PATCH oe-core v6] linux-dtb: add multi-dtb build =
support
> and keep dtb in deploy cache package
>=20
> On 01/08/2012 07:37 PM, b19537@freescale.com wrote:
> > From: Zhenhua Luo<b19537@freescale.com>
> >
> > Signed-off-by: Zhenhua Luo<b19537@freescale.com>
> > ---
> >   meta/recipes-kernel/linux/linux-dtb.inc |   24 +++++++++++++++-------=
--
> >   1 files changed, 15 insertions(+), 9 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-
> kernel/linux/linux-dtb.inc
> > index 7ec7584..fc29d14 100644
> > --- a/meta/recipes-kernel/linux/linux-dtb.inc
> > +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> > @@ -13,15 +13,21 @@ python __anonymous () {
> >   	d.setVar("PACKAGES", "%s kernel-devicetree" % packages)
> >   }
> >
> I am not sure how this worked, I am seeing a problem with building rootfs=
.
> |
>=20
> kernel-devicetree is needed by
> kernel-modules-
> 3.0.14+git1+6ae3d992cf546184010e87a0349810198f1d167c_1+58ffdb8000e34d2ba7=
c3ef278
> b26680b0886e8b5-r2.mpc8315e_rdb
>=20
> This might be a PR Bump issue?
>=20
> Sau!
>=20
> > -do_install_append() {
> > +kernel_do_deploy_append() {
> >       if test -n "${KERNEL_DEVICETREE}"; then
> > -	dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o devicetree
> ${KERNEL_DEVICETREE}
> > -	install -m 0644 devicetree ${D}/boot/devicetree-${KERNEL_VERSION}
> > -	install -d ${DEPLOY_DIR_IMAGE}
> > -	install -m 0644 devicetree
> ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.dtb
> > -	cd ${DEPLOY_DIR_IMAGE}
> > -	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
> > -	ln -sf ${KERNEL_IMAGE_BASE_NAME}.dtb ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
> > +        for DTS_FILE in ${KERNEL_DEVICETREE}; do
> > +            DTS_BASE_NAME=3D`basename ${DTS_FILE} | awk -F "." '{print=
 $1}'`
> > +            DTB_NAME=3D`echo ${KERNEL_IMAGE_BASE_NAME} | sed
> "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> > +            DTB_SYMLINK_NAME=3D`echo ${KERNEL_IMAGE_SYMLINK_NAME} | se=
d
> "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> > +            dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o devicetree
> ${DTS_FILE}
> > +            install -m 0644 devicetree ${D}/boot/devicetree-${DTS_BASE=
_NAME}-
> ${KERNEL_VERSION}
> > +
> > +            install -d ${DEPLOYDIR}
> > +            install -m 0644 devicetree ${DEPLOYDIR}/${DTB_NAME}.dtb
> > +            rm -f devicetree
> > +            cd ${DEPLOYDIR}
> > +            ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
> > +            cd -
> > +        done
> >       fi
> >   }
> > -




