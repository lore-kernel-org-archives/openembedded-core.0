Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SXJsp-000837-7Z
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 00:18:19 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 23 May 2012 15:08:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156381758"
Received: from orsmsx606.amr.corp.intel.com ([10.22.226.128])
	by fmsmga001.fm.intel.com with ESMTP; 23 May 2012 15:08:01 -0700
Received: from orsmsx153.amr.corp.intel.com (10.22.226.247) by
	orsmsx606.amr.corp.intel.com (10.22.226.128) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 23 May 2012 15:08:00 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.157]) by
	ORSMSX153.amr.corp.intel.com ([169.254.13.207]) with mapi id
	14.01.0355.002; Wed, 23 May 2012 15:08:00 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/9] tar: fix build
Thread-Index: AQHNOHfFmMjGfkgzek+agPTQCts56pbXppYAgAAzNYCAABW0sA==
Date: Wed, 23 May 2012 22:08:00 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C030EEED2@ORSMSX106.amr.corp.intel.com>
References: <cover.1337731469.git.nitin.a.kamble@intel.com>
	<9fcc40151424883e9f660dfdd3a3eb52213701c1.1337731469.git.nitin.a.kamble@intel.com>
	<4FBCBFA6.8020307@mlbassoc.com> <1337780891.8248.73.camel@ted>
In-Reply-To: <1337780891.8248.73.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Subject: Re: [PATCH 1/9] tar: fix build
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
X-List-Received-Date: Wed, 23 May 2012 22:18:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: Wednesday, May 23, 2012 6:48 AM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 1/9] tar: fix build
>=20
> On Wed, 2012-05-23 at 04:44 -0600, Gary Thomas wrote:
> > On 2012-05-22 18:05, nitin.a.kamble@intel.com wrote:
> > > From: Nitin A Kamble<nitin.a.kamble@intel.com>
> > >
> > > Avoid this error:
> > > | rmdir: failed to remove
> > > | `/srv/home/nitin/builds/build-gcc47/tmp/work/i586-poky-linux/tar-
> 1
> > > | .26-r1/image/usr/sbin/': No such file or directory
> > > NOTE: package tar-1.26-r1: task do_install: Failed
> > >
> > > no PR bump as no change in the output.
> > >
> > > Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
> > > ---
> > >   meta/recipes-extended/tar/tar.inc |    8 ++++++--
> > >   1 files changed, 6 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/recipes-extended/tar/tar.inc
> > > b/meta/recipes-extended/tar/tar.inc
> > > index 0533b82..5c2325a 100644
> > > --- a/meta/recipes-extended/tar/tar.inc
> > > +++ b/meta/recipes-extended/tar/tar.inc
> > > @@ -18,8 +18,12 @@ do_install () {
> > >   do_install_extra () {
> > >       install -d ${D}${base_bindir}
> > >       mv ${D}${bindir}/tar ${D}${base_bindir}/tar.${PN}
> > > -    rmdir ${D}${bindir}/
> > > -    rmdir ${D}${sbindir}/
> > > +    if [ -d ${D}${bindir}/ ] ; then
> > > +        rmdir ${D}${bindir}/
> > > +    fi
> > > +    if [ -d ${D}${sbindir}/ ] ; then
> > > +        rmdir ${D}${sbindir}/
> > > +    fi
> > >       mv ${D}${libexecdir}/rmt ${D}${libexecdir}/rmt.${PN}
> > >   }
> > >
> >
> > Why not just use
> >    rm -fr ${D}${bindir}
> > etc?  No need for all the extra testing...
>=20
> I've mentioned this once before however I'll do so again. I think these
> empty directories were a bug in automake. It looks like automake has
> fixed that problem and no longer generates them. I think the correct
> thing to do is simply remove the rmdir.
>=20
> The reason we used rmdir instead of rm is we wanted to know if these
> suddenly started containing files, not silently delete them.
>=20
> Cheers,
>=20
> Richard
>=20

Hi Richard,
  I was trying to make the commits compatible with both automake 1.11 & aut=
omake 1.12. Now after discussions with Saul, I understand that these commit=
s will go after automake 1.12 update goes in. In that case we can remove th=
ese rmdir statements.

Thanks,
Nitin



