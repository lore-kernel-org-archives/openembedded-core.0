Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6AB8373237
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 19:10:44 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 04 Aug 2015 12:10:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,610,1432623600"; d="scan'208";a="619244634"
Received: from orsmsx105.amr.corp.intel.com ([10.22.225.132])
	by orsmga003.jf.intel.com with ESMTP; 04 Aug 2015 12:10:43 -0700
Received: from orsmsx109.amr.corp.intel.com ([169.254.2.247]) by
	ORSMSX105.amr.corp.intel.com ([169.254.4.34]) with mapi id
	14.03.0224.002; Tue, 4 Aug 2015 12:10:43 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: "Hatle, Mark G (Wind River)" <mark.hatle@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "jurobystricky@hotmail.com"
	<jurobystricky@hotmail.com>
Thread-Topic: [OE-core] [PATCH 0/2] Support for VirtualBox guest additions
Thread-Index: AQHQzix/unjTe8g7O0uKLsMGe8OzUp38e9OA//+WZcCAAH3VgP//k0/A
Date: Tue, 4 Aug 2015 19:10:42 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B6101D471A@ORSMSX109.amr.corp.intel.com>
References: <1438634128-4347-1-git-send-email-juro.bystricky@intel.com>
	<55C0E631.7070703@windriver.com>
	<6E51916E4A1F32428260031F4C7CD2B6101D46F3@ORSMSX109.amr.corp.intel.com>
	<55C0F729.5000908@windriver.com>
In-Reply-To: <55C0F729.5000908@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: "Purdie, Richard" <richard.purdie@intel.com>
Subject: Re: [PATCH 0/2] Support for VirtualBox guest additions
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
X-List-Received-Date: Tue, 04 Aug 2015 19:10:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am pretty sure initially I tried to use kernel-devsrc  to install Virtual=
Box guest additions.
It did not work out of the box for me, there were either files missing or t=
hey were not in expected locations.
It is possible it could  be made to work with some modified installation,  =
but the size is an issue=20
as well: kernel-devsrc packs over 500MB (uncompressed).

The source code is only needed when you want to reconfigure/rebuild the ker=
nel.
Out-of-tree modules generally don't need any additional source code, typica=
lly only header files.


Juro


> -----Original Message-----
> From: Mark Hatle [mailto:mark.hatle@windriver.com]
> Sent: Tuesday, August 4, 2015 10:32 AM
> To: Bystricky, Juro; openembedded-core@lists.openembedded.org;
> jurobystricky@hotmail.com
> Cc: Purdie, Richard
> Subject: Re: [OE-core] [PATCH 0/2] Support for VirtualBox guest additions
>=20
> On 8/4/15 12:25 PM, Bystricky, Juro wrote:
> > I agree, the name "kernel-headers" may not be the most fortunate, "linu=
x-
> headers"
> > is probably more fitting.  The recipe installs the files in a similar
> > fashion that is done by
> >
> > apt-get install linux-headers-$(uname -r)
> >
> > Typical contents can be viewed for example here:
> > https://www.archlinux.org/packages/core/i686/linux-headers/
> >
> > These files are needed to allow building  of kernel drivers against
> > the running Linux kernel. In a way, it is a subset of kernel-devsrc,
> > but including  ".config" file used for the actual running kernel.
>=20
> Again this is part of the purpose of the existing kernel-devsrc package. =
 So
> what is missing preventing this from working.  It likely needs to be adde=
d to
> the kernel-devsrc package instead (or a sub package that is created by th=
e
> kernel-devsrc recipe.)
>=20
> > Having these files installed, it is possible  to compile additional
> > kernel drivers that are not part of the kernel-devsrc .
> >  VirtualBox compiles some of their own drivers this way, others as well=
.
> > There are many other scenarios where you may want to add a new kernel
> > driver to an already installed Linux kernel.
>=20
> Yes, this was part of the design behind the kernel-devsrc, make sure the
> sources and components used to build the running kernel were made
> available to the target so that out-of-tree/external kernel modules could=
 be
> built to match the running system -- as well as the ability to reconfigur=
e and
> rebuild the kernel itself.
>=20
> Bruce is on vacation this week and may not be around to respond, but addi=
ng
> yet another package is not the right answer here.  Lets fix what may be
> broken in what we have.
>=20
> --Mark
>=20
> > Juro
> >
> >
> >
> >> -----Original Message-----
> >> From: Mark Hatle [mailto:mark.hatle@windriver.com]
> >> Sent: Tuesday, August 4, 2015 9:20 AM
> >> To: Bystricky, Juro; openembedded-core@lists.openembedded.org;
> >> jurobystricky@hotmail.com
> >> Cc: Purdie, Richard
> >> Subject: Re: [OE-core] [PATCH 0/2] Support for VirtualBox guest
> >> additions
> >>
> >> On 8/3/15 3:35 PM, Juro Bystricky wrote:
> >>> In order to support VirtualBox guest additions, kernel headers need
> >>> to be present in the VM. I am aware we already have two
> >>> packages/recipes that are somewhat similar (kernel-devsrc.bb,
> >>> linux-libc-headers), but none
> >> of them is suitable for this purpose.
> >>> Besides the kernel headers, some additional files (scripts,
> >>> Makefiles, .config, etc) are also required.
> >>
> >> linux-libc-headers is only for building applications.  kernel-devsrc
> >> is for building modules on the target.
> >>
> >> What do these specific modules need that are not present in kernel-
> devsrc?
> >> (I really don't want 'yet another' confusing package added to the
> >> system.)
> >>
> >>> The new recipe "kernel-headers.bb" can in principle be used by other
> >> images as well.
> >>> It is not limited to the Build Appliance and hence is not a part of
> >>> the Build Appliance recipe.
> >>
> >> I think kernel-headers is a bad name for a package.  It could be confu=
sing.
> >>
> >> --Mark
> >>
> >>> Juro Bystricky (2):
> >>>   kernel-headers: linux kernel headers
> >>>   build-appliance-image: support for VirtualBox guest addtions
> >>>
> >>>  .../README_vbox_guest_additions.txt                | 78
> >> ++++++++++++++++++++++
> >>>  .../images/build-appliance-image_12.0.1.bb         |  4 +-
> >>>  meta/recipes-kernel/linux/kernel-headers.bb        | 66
> >> ++++++++++++++++++
> >>>  3 files changed, 147 insertions(+), 1 deletion(-)  create mode
> >>> 100644
> >>> meta/recipes-core/images/build-appliance-
> >> image/README_vbox_guest_addit
> >>> ions.txt  create mode 100644
> >>> meta/recipes-kernel/linux/kernel-headers.bb
> >>>
> >


