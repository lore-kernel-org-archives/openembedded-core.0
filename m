Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QZbGr-0003i6-Ki
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 06:12:02 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jun 2011 21:08:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,410,1304319600"; d="scan'208";a="21750007"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga001.fm.intel.com with ESMTP; 22 Jun 2011 21:08:14 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 23 Jun 2011 12:08:12 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 23 Jun 2011 12:08:11 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Thu, 23 Jun 2011 12:08:10 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jun 2011 12:08:09 +0800
Thread-Topic: [OE-core] [PATCH 1/1] libc-locale: split locale handling from
	libc recipe.
Thread-Index: Acww0dAE+3gLi1JxR2eqp9irZeFRMwAchfjg
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12D6A3E0A9@shsmsx501.ccr.corp.intel.com>
References: <cover.1308732995.git.dongxiao.xu@intel.com>
	<d7c256ba838d05c85c6e7c2569f0a6c7b276ab17.1308732995.git.dongxiao.xu@intel.com>
	<1308743075.21613.82.camel@phil-desktop>
In-Reply-To: <1308743075.21613.82.camel@phil-desktop>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] libc-locale: split locale handling from libc recipe.
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
X-List-Received-Date: Thu, 23 Jun 2011 04:12:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Phil Blundell
> Sent: Wednesday, June 22, 2011 7:45 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 1/1] libc-locale: split locale handling fro=
m libc
> recipe.
>=20
> I still don't quite understand why the virtual/libiconv provider has move=
d from
> eglibc to eglibc-locale.  Can you explain what's going on there?

Generally, the purpose of this patch is to reduce eglibc's do_package time.

Since many other recipes' do_package have dependency on eglibc's do_package=
, thus the sooner eglibc could finish its do_package, the ealier can other =
do_packages be executed, which improves the parallelism.=20

From our study, we found most of eglibc's do_package time is used to handle=
 locale. Therefore we split all the locale related stuffs into a separately=
 recipe eglibc-locale.

Thanks,
Dongxiao

>=20
> p.
>=20
> On Wed, 2011-06-22 at 17:01 +0800, Dongxiao Xu wrote:
> > *libc's do_package will cost a lot of time due to the locale handing,
> > which may delay the other recipe's do_package task and affect the
> > build performance.
> >
> > This commit moves locale handling into a separate recipe *libc-locale.
> >
> > Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> > ---
> >  meta/classes/libc-common.bbclass                   |   23 ++++++++
> >  meta/classes/libc-package.bbclass                  |   24 --------
> >  meta/conf/distro/include/tclibc-eglibc.inc         |    2 +-
> >  meta/conf/distro/include/tclibc-glibc.inc          |    2 +-
> >  meta/recipes-core/eglibc/eglibc-initial_2.13.bb    |    4 ++
> >  meta/recipes-core/eglibc/eglibc-locale_2.13.bb     |   58
> ++++++++++++++++++++
> >  meta/recipes-core/eglibc/eglibc-package.inc        |   32 +----------
> >  meta/recipes-core/eglibc/eglibc.inc                |    4 +-
> >  meta/recipes-core/eglibc/eglibc_2.13.bb            |   12 ++++
> >  meta/recipes-core/glibc/glibc-initial_2.10.1.bb    |    4 ++
> >  meta/recipes-core/glibc/glibc-locale_2.10.1.bb     |   50
> +++++++++++++++++
> >  meta/recipes-core/glibc/glibc-package.inc          |   29 ++---------
> >  meta/recipes-core/glibc/glibc.inc                  |    2 +-
> >  meta/recipes-core/glibc/glibc_2.10.1.bb            |   12 ++++
> >  .../meta/external-csl-toolchain_2008q3-72.bb       |    1 +
> >  15 files changed, 176 insertions(+), 83 deletions(-)  create mode
> > 100644 meta/classes/libc-common.bbclass  create mode 100644
> > meta/recipes-core/eglibc/eglibc-locale_2.13.bb
> >  create mode 100644 meta/recipes-core/glibc/glibc-locale_2.10.1.bb
> >
> > diff --git a/meta/conf/distro/include/tclibc-eglibc.inc
> > b/meta/conf/distro/include/tclibc-eglibc.inc
> > index a4c648e..90de04f 100644
> > --- a/meta/conf/distro/include/tclibc-eglibc.inc
> > +++ b/meta/conf/distro/include/tclibc-eglibc.inc
> > @@ -10,7 +10,7 @@ TARGET_OS_powerpc =3D
> > "linux${@['','-gnuspe'][bb.data.getVar('BASE_PACKAGE_ARCH',d
> >  # Add glibc overrides to the overrides for eglibc.
> >  OVERRIDES .=3D ":libc-glibc"
> >
> > -PREFERRED_PROVIDER_virtual/libiconv ?=3D "eglibc"
> > +PREFERRED_PROVIDER_virtual/libiconv ?=3D "eglibc-locale"
> >  PREFERRED_PROVIDER_virtual/libiconv-nativesdk ?=3D "eglibc-nativesdk"
> >  PREFERRED_PROVIDER_virtual/libintl ?=3D "eglibc"
> >  PREFERRED_PROVIDER_virtual/libc ?=3D "eglibc"
> > diff --git a/meta/conf/distro/include/tclibc-glibc.inc
> > b/meta/conf/distro/include/tclibc-glibc.inc
> > index e5843b0..748c23f 100644
> > --- a/meta/conf/distro/include/tclibc-glibc.inc
> > +++ b/meta/conf/distro/include/tclibc-glibc.inc
> > @@ -10,7 +10,7 @@ TARGET_OS_powerpc =3D
> > "linux${@['','-gnuspe'][bb.data.getVar('BASE_PACKAGE_ARCH',d
> >  # Add glibc to the overrides.
> >  OVERRIDES =3D. "libc-glibc:"
> >
> > -PREFERRED_PROVIDER_virtual/libiconv ?=3D "glibc"
> > +PREFERRED_PROVIDER_virtual/libiconv ?=3D "glibc-locale"
> >  PREFERRED_PROVIDER_virtual/libiconv-nativesdk ?=3D "glibc-nativesdk"
> >  PREFERRED_PROVIDER_virtual/libintl ?=3D "glibc"
> >  PREFERRED_PROVIDER_virtual/libc ?=3D "glibc"
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


