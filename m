Received: from ausxipps301.us.dell.com ([143.166.148.223])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Michael_E_Brown@Dell.com>) id 1TzuMG-0001Ub-Ru
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 20:27:11 +0100
X-LoopCount0: from 10.170.28.39
X-IronPort-AV: E=Sophos;i="4.84,554,1355119200"; d="scan'208";a="63951656"
From: <Michael_E_Brown@Dell.com>
To: <dvhart@linux.intel.com>
Date: Mon, 28 Jan 2013 13:09:39 -0600
Thread-Topic: [OE-core] udev blacklist ineffective
Thread-Index: Ac39iKAKtGmpAlhtSZO615mYVtsp6QAAU3C0
Message-ID: <DB6E482E89290547898851B8CC9D8110DC3609E1@AUSX7MCPS302.AMER.DELL.COM>
References: <DB6E482E89290547898851B8CC9D8110DC3609D8@AUSX7MCPS302.AMER.DELL.COM>,
	<5106C8D5.9000705@linux.intel.com>
In-Reply-To: <5106C8D5.9000705@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: udev blacklist ineffective
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
X-List-Received-Date: Mon, 28 Jan 2013 19:27:15 -0000
X-List-Received-Date: Mon, 28 Jan 2013 19:27:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> _______________________________________
> From: Darren Hart [dvhart@linux.intel.com]
> Sent: Monday, January 28, 2013 12:52 PM
> To: Brown, Michael E
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] udev blacklist ineffective
>=20
> On 01/28/2013 08:36 AM, Michael_E_Brown@Dell.com wrote:
> > I have two embedded systems that share some devices over an i2c bus. On=
ly one system may load the device driver at a time, and loading the device =
driver is already well-controlled by the HA subsystem.
> >
> > Our new yocto build with udev enabled is auto-loading these device driv=
ers with catastrophic results. We must absolutely prohibit such automatic b=
ehaviour for our list of devices. I have tried:
> >
> > $ cat etc/modprobe.d/blacklist.conf
> > blacklist seepmtd
> > ... cut ...
> >
> > And this does *NOT* work. I have tried renaming blacklist.conf to
> > modprobe.conf as well as creating modprobe.conf with these blacklist
> > entries.
> >
> > This is a huge blocking issue and I have been unable to figure out a
> > workaround for it. I would appreciate any suggestions.
>=20
>=20
> OK, so... this needs to be addressed.
>=20
> However, can you just not build/install the drivers for the system that
> shouldn't be accessing them? Or do you require a more general image?

Both systems have to access these devices. They just cannot load the driver=
s simultaneously. The driver load is under control of the HA process that e=
nsures that only one system at a time accesses the devices, and takes care =
of fencing, etc.

We have a custom FPGA that can switch access to the devices between two sys=
tems, loading drivers from both systems twiddles bits that ought not to be =
twiddled and catastrophically crashes one or both systems.
=20
> You will need to provide details about the version of oe-core you are
> using, kmod or modutils, and any relevant DISTRO configurations you have
> made, which bit of software do you expect to be honoring the blacklist, e=
tc.

Yocto release 1.3, danny branch + meta-oe/meta-systemd for system startup
udev_v195-r10
libkmod2_9-r0.0

Distro is poky + systemd

What is happening is that, on boot, the udev Coldplug startup step is loadi=
ng drivers that must not be loaded based on i2c discovery.
--
Michael


