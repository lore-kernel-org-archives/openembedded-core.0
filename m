Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 927686E5D0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 17:25:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 04 Aug 2015 10:25:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,610,1432623600"; d="scan'208";a="777685413"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
	by orsmga002.jf.intel.com with ESMTP; 04 Aug 2015 10:25:02 -0700
Received: from orsmsx114.amr.corp.intel.com (10.22.240.10) by
	ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Tue, 4 Aug 2015 10:25:01 -0700
Received: from orsmsx109.amr.corp.intel.com ([169.254.2.247]) by
	ORSMSX114.amr.corp.intel.com ([169.254.8.72]) with mapi id
	14.03.0224.002; Tue, 4 Aug 2015 10:25:01 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: "Hatle, Mark G (Wind River)" <mark.hatle@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "jurobystricky@hotmail.com"
	<jurobystricky@hotmail.com>
Thread-Topic: [OE-core] [PATCH 0/2] Support for VirtualBox guest additions
Thread-Index: AQHQzix/unjTe8g7O0uKLsMGe8OzUp38e9OA//+WZcA=
Date: Tue, 4 Aug 2015 17:25:00 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B6101D46F3@ORSMSX109.amr.corp.intel.com>
References: <1438634128-4347-1-git-send-email-juro.bystricky@intel.com>
	<55C0E631.7070703@windriver.com>
In-Reply-To: <55C0E631.7070703@windriver.com>
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
X-List-Received-Date: Tue, 04 Aug 2015 17:25:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I agree, the name "kernel-headers" may not be the most fortunate, "linux-he=
aders"=20
is probably more fitting.  The recipe installs the files in a similar fashi=
on that is done by=20

apt-get install linux-headers-$(uname -r)

Typical contents can be viewed for example here:
https://www.archlinux.org/packages/core/i686/linux-headers/

These files are needed to allow building  of kernel drivers against the run=
ning
Linux kernel. In a way, it is a subset of kernel-devsrc, but including
 ".config" file used for the actual running kernel.

Having these files installed, it is possible  to compile additional
kernel drivers that are not part of the kernel-devsrc .
 VirtualBox compiles some of their own drivers this way, others as well.=20
There are many other scenarios where you may want to add a new kernel=20
driver to an already installed Linux kernel.=20

Juro



> -----Original Message-----
> From: Mark Hatle [mailto:mark.hatle@windriver.com]
> Sent: Tuesday, August 4, 2015 9:20 AM
> To: Bystricky, Juro; openembedded-core@lists.openembedded.org;
> jurobystricky@hotmail.com
> Cc: Purdie, Richard
> Subject: Re: [OE-core] [PATCH 0/2] Support for VirtualBox guest additions
>=20
> On 8/3/15 3:35 PM, Juro Bystricky wrote:
> > In order to support VirtualBox guest additions, kernel headers need to
> > be present in the VM. I am aware we already have two packages/recipes
> > that are somewhat similar (kernel-devsrc.bb, linux-libc-headers), but n=
one
> of them is suitable for this purpose.
> > Besides the kernel headers, some additional files (scripts, Makefiles,
> > .config, etc) are also required.
>=20
> linux-libc-headers is only for building applications.  kernel-devsrc is f=
or
> building modules on the target.
>=20
> What do these specific modules need that are not present in kernel-devsrc=
?
> (I really don't want 'yet another' confusing package added to the system.=
)
>=20
> > The new recipe "kernel-headers.bb" can in principle be used by other
> images as well.
> > It is not limited to the Build Appliance and hence is not a part of
> > the Build Appliance recipe.
>=20
> I think kernel-headers is a bad name for a package.  It could be confusin=
g.
>=20
> --Mark
>=20
> > Juro Bystricky (2):
> >   kernel-headers: linux kernel headers
> >   build-appliance-image: support for VirtualBox guest addtions
> >
> >  .../README_vbox_guest_additions.txt                | 78
> ++++++++++++++++++++++
> >  .../images/build-appliance-image_12.0.1.bb         |  4 +-
> >  meta/recipes-kernel/linux/kernel-headers.bb        | 66
> ++++++++++++++++++
> >  3 files changed, 147 insertions(+), 1 deletion(-)  create mode 100644
> > meta/recipes-core/images/build-appliance-
> image/README_vbox_guest_addit
> > ions.txt  create mode 100644
> > meta/recipes-kernel/linux/kernel-headers.bb
> >


