Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RccyP-0007xX-8C
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 14:09:45 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Dec 2011 05:02:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="89044784"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by orsmga002.jf.intel.com with ESMTP; 19 Dec 2011 05:02:18 -0800
Received: from pgsmsx103.gar.corp.intel.com (10.221.44.82) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 19 Dec 2011 21:02:17 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX103.gar.corp.intel.com (10.221.44.82) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Mon, 19 Dec 2011 21:02:17 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Mon, 19 Dec 2011 21:02:16 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 19 Dec 2011 21:02:14 +0800
Thread-Topic: [OE-core] [PATCH 1/1] initramfs-framework: provides a modular
	initramfs
Thread-Index: Acy11ZIava+jvR6BThCuymIRntM39AIeGFZg
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12ED44B60F@shsmsx501.ccr.corp.intel.com>
References: <cover.1323292966.git.otavio@ossystems.com.br>
	<0ab4225dfaee3c59d5200f9d73d75e4b44f3a498.1323292966.git.otavio@ossystems.com.br>
	<4EE0FEEA.7080806@linux.intel.com>
In-Reply-To: <4EE0FEEA.7080806@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] initramfs-framework: provides a modular initramfs
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
X-List-Received-Date: Mon, 19 Dec 2011 13:09:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Otavio and Saul,

I tried to build initramfs-framework in Yocto master, and it reports the fo=
llowing multiple provider issue:

ERROR: Multiple .bb files are due to be built which each provide udev (/hom=
e/dongxiao/poky/meta/recipes-core/udev/udev_164.bb /home/dongxiao/poky/meta=
/recipes-core/udev/udev_145.bb).

I saw initramfs-framework RDEPENDS on package udev-utils, which doesn't exi=
st in latest udev-164, thus it will try to include udev-145. This caused th=
e multiple provider issue.

Could you help to have a look at that?

Thanks,
Dongxiao

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Saul Wold
> Sent: Friday, December 09, 2011 2:16 AM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 1/1] initramfs-framework: provides a modula=
r
> initramfs
>=20
> On 12/07/2011 01:23 PM, Otavio Salvador wrote:
> > Provides the API and modules for a modular initramfs. The currently
> > included modules are:
> >
> >   * initramfs-module-debug adds support to dynamic debugging of
> >     initramfs using bootparams
> >
> >   * initramfs-module-udev: enables udev usage
> >
> >   * initramfs-module-mdev: enables mdev usage
> >
> >   * initramfs-module-e2fs: adds support for ext4, ext3 and ext2
> >     filesystems
> >
> > Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> > ---
> >   .../initrdscripts/initramfs-framework/debug        |   82
> ++++++++++++
> >   .../initrdscripts/initramfs-framework/e2fs         |   28 ++++
> >   .../initrdscripts/initramfs-framework/finish       |   46 +++++++
> >   .../initrdscripts/initramfs-framework/init         |  136
> ++++++++++++++++++++
> >   .../initrdscripts/initramfs-framework/mdev         |   30 +++++
> >   .../initrdscripts/initramfs-framework/udev         |   22 +++
> >   .../initrdscripts/initramfs-framework_1.0.bb       |   57 ++++++++
> >   7 files changed, 401 insertions(+), 0 deletions(-)
> >   create mode 100644
> meta/recipes-core/initrdscripts/initramfs-framework/debug
> >   create mode 100755
> meta/recipes-core/initrdscripts/initramfs-framework/e2fs
> >   create mode 100755
> meta/recipes-core/initrdscripts/initramfs-framework/finish
> >   create mode 100755
> meta/recipes-core/initrdscripts/initramfs-framework/init
> >   create mode 100644
> meta/recipes-core/initrdscripts/initramfs-framework/mdev
> >   create mode 100644
> meta/recipes-core/initrdscripts/initramfs-framework/udev
> >   create mode 100644
> > meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> >
>=20
> Merged to OE-Core
>=20
> Thanks
> 	Sau!
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


