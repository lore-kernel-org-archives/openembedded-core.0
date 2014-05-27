Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga02.intel.com (unknown [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CE7F96FAD4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 15:13:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 May 2014 08:13:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,919,1392192000"; d="scan'208";a="547166116"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by orsmga002.jf.intel.com with ESMTP; 27 May 2014 08:13:10 -0700
Received: from irsmsx106.ger.corp.intel.com (163.33.3.31) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Tue, 27 May 2014 16:12:02 +0100
Received: from irsmsx103.ger.corp.intel.com ([169.254.3.58]) by
	IRSMSX106.ger.corp.intel.com ([169.254.8.14]) with mapi id
	14.03.0123.003; Tue, 27 May 2014 16:12:01 +0100
From: "Stoicescu, CorneliuX" <corneliux.stoicescu@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Stefan Stanacar <sstncr@gmail.com>
Thread-Topic: [OE-core] [PATCH] oeqa/controllers/beaglebonetarget.py: fix
	conditions for files copied to /boot
Thread-Index: AQHPeX/LC1ZRq2SUA0e187sxZvVZuJtUNfEAgAA07QCAAB2/YA==
Date: Tue, 27 May 2014 15:12:01 +0000
Message-ID: <33115ABC4887814E8A92A08FBC93416B0A276255@IRSMSX103.ger.corp.intel.com>
References: <1401184227-1138-1-git-send-email-corneliux.stoicescu@intel.com>
	<CANr+NRtXiKzXK2aBS6e1vrt-HNRMYqQ5StH-neSsFLZQAbLPtQ@mail.gmail.com>
	<5384A006.8080908@linux.intel.com>
In-Reply-To: <5384A006.8080908@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/controllers/beaglebonetarget.py: fix conditions for files copied to /boot
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
X-List-Received-Date: Tue, 27 May 2014 15:13:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Tuesday, May 27, 2014 5:24 PM
> To: Stefan Stanacar; Stoicescu, CorneliuX
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] oeqa/controllers/beaglebonetarget.py: fix
> conditions for files copied to /boot
>=20
> On 05/27/2014 04:14 AM, Stefan Stanacar wrote:
> > On Tue, May 27, 2014 at 12:50 PM, Corneliu Stoicescu
> > <corneliux.stoicescu@intel.com> wrote:
> >
> >> ---
> >>   meta-yocto-bsp/lib/oeqa/controllers/beaglebonetarget.py | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >
> > As this patch is for meta-yocto-bsp this should be sent to
> > poky@yoctoproject.org list...
> >
> >> diff --git a/meta-yocto-bsp/lib/oeqa/controllers/beaglebonetarget.py
> >> b/meta-yocto-bsp/lib/oeqa/controllers/beaglebonetarget.py
> >> index 53f454b..af56bda 100644
> >> --- a/meta-yocto-bsp/lib/oeqa/controllers/beaglebonetarget.py
> >> +++ b/meta-yocto-bsp/lib/oeqa/controllers/beaglebonetarget.py
> >> @@ -41,12 +41,12 @@ class
> BeagleBoneTarget(MasterImageHardwareTarget):
> >>                   'mount -L testrootfs /mnt/testrootfs',
> >>                   'rm -rf /mnt/testrootfs/*',
> >>                   'tar xzvf ~/test-rootfs.tar.gz -C /mnt/testrootfs',
> >> -                '[ ! -e /mnt/testrootfs/boot/uImage ] && cp ~/test-ke=
rnel
> /mnt/testrootfs/boot/uImage',
> >> +                'if [ ! -e /mnt/testrootfs/boot/uImage ]; then cp
> >> + ~/test-kernel /mnt/testrootfs/boot/uImage; fi',
> >
> > How about reversing the check: [ -e /mnt/testrootfs/boot/uImage] || cp
> > ~/test-kernel /mnt/testrootfs/boot/uImage That would work in both
> > cases, if it exists it won't copy the kernel and returns 0, if it
> > doesn't it will copy and returns the result of cp.
> >
> >>                   ]
> >>
> >>           for _, dtbfn in self.dtbs:
> >>               # Kernel and dtb files may not be in the image, so copy =
them if not
> >> -            self.deploy_cmds.append('[ ! -e /mnt/testrootfs/boot/{0} =
] && cp
> ~/{0} /mnt/testrootfs/boot/'.format(dtbfn))
> >> +            self.deploy_cmds.append('if [ ! -e
> >> + /mnt/testrootfs/boot/{0} ]; then cp ~/{0}
> >> + /mnt/testrootfs/boot/'.format(dtbfn) + '; fi')
> >>
> >
> > Same here.
> >
>=20
> I agree with Stephan here along with Anders comments and this should real=
ly
> be on poky@ list, so a v3 to the poky@yoctoproject would be best.
>=20

Sure, I will test Stefan's version with core-image-sato and core-image-full=
-cmdline and send the patch tomorrow, to poky@ mailing list.
Thank you, Stefan!=20

Regards,
Corneliu

> Thanks
> 	Sau!
>=20
> >
> > Cheers,
> > Stefan
> >
> >>           if not self.serialcontrol_cmd:
> >>               bb.fatal("This TEST_TARGET needs a
> >> TEST_SERIALCONTROL_CMD defined in local.conf.")
> >> --
> >> 1.8.3.2
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core

