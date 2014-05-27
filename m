Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 00AD46B70A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 07:02:31 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 May 2014 00:02:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,917,1392192000"; d="scan'208";a="437203467"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by azsmga001.ch.intel.com with ESMTP; 27 May 2014 00:02:29 -0700
Received: from irsmsx107.ger.corp.intel.com (163.33.3.99) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Tue, 27 May 2014 08:02:05 +0100
Received: from irsmsx103.ger.corp.intel.com ([169.254.3.58]) by
	IRSMSX107.ger.corp.intel.com ([169.254.10.208]) with mapi id
	14.03.0123.003; Tue, 27 May 2014 08:02:05 +0100
From: "Stoicescu, CorneliuX" <corneliux.stoicescu@intel.com>
To: Anders Darander <anders@chargestorm.se>
Thread-Topic: [OE-core] [PATCH] oeqa/controllers/beaglebonetarget.py: add
	conditions for files copied to /boot
Thread-Index: AQHPeOWMVDmFi1dc5k2VAoXUcCMnmptT7DeAgAAUOFA=
Date: Tue, 27 May 2014 07:02:04 +0000
Message-ID: <33115ABC4887814E8A92A08FBC93416B0A271EBD@IRSMSX103.ger.corp.intel.com>
References: <1401117992-30582-1-git-send-email-corneliux.stoicescu@intel.com>
	<20140527064629.GA7185@ad.chargestorm.se>
In-Reply-To: <20140527064629.GA7185@ad.chargestorm.se>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/controllers/beaglebonetarget.py: add conditions for files copied to /boot
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
X-List-Received-Date: Tue, 27 May 2014 07:02:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Anders Darander [mailto:anders@chargestorm.se]
> Sent: Tuesday, May 27, 2014 9:46 AM
> To: Stoicescu, CorneliuX
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] oeqa/controllers/beaglebonetarget.py: add
> conditions for files copied to /boot
>=20
> * Corneliu Stoicescu <corneliux.stoicescu@intel.com> [140526 15:23]:
>=20
> > Sometimes the rootfs archive contains the kernel file
> > (core-image-full-cmdline) or the dtbs files (core-image-sato). Adding
> > verification to add them if they don't allready exist.
>=20
> > Without this, the first condition would fail and the image deploy task =
would
> stop.
>=20
> What failure and errors are you seeing?
>=20

'[ ! -e /mnt/testrootfs/boot/uImage ] && cp ~/test-kernel/mnt/testrootfs/bo=
ot/uImage' returns exit code 1 if the first condition is not met, and thus =
the deploy task fails. My version would return exit code 0 weather or not t=
he first condition is met.=20

We could also modify the way the commands are run to ignore that exit code =
but that would involve more changes, many of them not needed or expected by=
 other commands and/or target controllers.

> > -                '[ ! -e /mnt/testrootfs/boot/uImage ] && cp ~/test-ker=
nel
> /mnt/testrootfs/boot/uImage',
> > +                'if [ ! -e /mnt/testrootfs/boot/uImage ]; then cp
> > + ~/test-kernel /mnt/testrootfs/boot/uImage; fi',
>=20
> It might be that I've had no coffee yet, but I can't see what difference =
your
> change is making (apart from being more verbose)?
>=20
> The original code checks for the existance of /mnt/testrootfs/boot/uImage=
,
> negates the result and copies the test-kernel if the negated result is tr=
ue, i.e.
> if /mnt/testrootfs/boot/uImage doesn't exist, copy the test-kernel.
>=20
> > -            self.deploy_cmds.append('[ ! -e /mnt/testrootfs/boot/{0} ]=
 && cp
> ~/{0} /mnt/testrootfs/boot/'.format(dtbfn))
> > +            self.deploy_cmds.append('if [ ! -e
> > + /mnt/testrootfs/boot/{0} ]; then cp ~/{0}
> > + /mnt/testrootfs/boot/'.format(dtbfn) + '; fi')
>=20
> See above...
>=20
> Cheers,
> Anders
>=20
> --
> Anders Darander
> ChargeStorm AB / eStorm AB

