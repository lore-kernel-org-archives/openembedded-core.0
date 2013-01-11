Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TteSi-0004wB-FD
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 14:16:09 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Jan 2013 05:00:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,451,1355126400"; d="scan'208";a="272690638"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jan 2013 05:00:39 -0800
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.95]) by
	IRSMSX101.ger.corp.intel.com ([169.254.1.13]) with mapi id
	14.01.0355.002; Fri, 11 Jan 2013 13:00:38 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH V3 2/2] connman-conf: configures connman in qemu machines
Thread-Index: AQHN7/ZY6bFCTbo960KZCJ+LFt75FZhEFSsQ
Date: Fri, 11 Jan 2013 13:00:37 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB161DCDD0@IRSMSX102.ger.corp.intel.com>
References: <1357901618-21786-1-git-send-email-cristian.iorga@intel.com>
	<1357901618-21786-3-git-send-email-cristian.iorga@intel.com>
	<lysj67ykmo.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lysj67ykmo.fsf@ensc-virt.intern.sigma-chemnitz.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: Cristian Iorga
	<public-cristian.iorga-ral2JQCrhuEAvxtiuMwx3w@plane.gmane.org>
Subject: Re: [PATCH V3 2/2] connman-conf: configures connman in qemu machines
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
X-List-Received-Date: Fri, 11 Jan 2013 13:16:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Enrico, see my answers below.

Regards,
Cristian

-----Original Message-----
From: Enrico Scholz [mailto:enrico.scholz@sigma-chemnitz.de]=20
Sent: Friday, January 11, 2013 2:23 PM
To: openembedded-core@lists.openembedded.org
Cc: Cristian Iorga
Subject: Re: [PATCH V3 2/2] connman-conf: configures connman in qemu machin=
es



Cristian Iorga <cristian.iorga-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
writes:

> For qemu machines, connman should not configure virtual wired interfaces.

This is not a qemu-only problem but affects all platforms with nfs rootfs, =
isn't it?
	In this particular case, it's only related to qemu in the network environm=
ent presented to a virtual machine.
	There is a separate patch for the $nfsroot issue.

Setup whether to disable configuration of interface should be done dynamica=
lly and based on e.g. whether rootfs is on nfs and/or if kernel cmdline con=
tains 'ip=3D...'.
	In my opinion, that's debatable. Qemu images for sure won't have a DHCP to=
 send request too (as the setup is done now); as such, the build system can=
 decide in advance to blacklist ethn to connman.
	To me, the $nfsroot fix is OK. It is done dynamically done, and on need by=
 need base.



> Wired interfaces (eth0) are assigned static IP addresses by the=20
> virtual machine manager (qemu). This packages places the eth0=20
> interface in a list of blacklisted interfaces, forbiding connman=20
> administering wired interfaces for qemu machines.

Unfortunatly, this breaks DNS in the machine because DNS server information=
 are not retrieved from DHCP anymore :(
	In which machine? qemu*? Is there a DHCP server to work with? That's the m=
ain problem that I am seeing, that there is no DHCP server, and, in the end=
, connman will assign a Zeroconf IP address to eth0.
	As far as I know, there will be no DNS server set if Zeroconf is used.



Enrico



