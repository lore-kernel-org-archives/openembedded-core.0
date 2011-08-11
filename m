Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QrJSP-0003hq-Bf
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 02:49:10 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 10 Aug 2011 17:44:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,353,1309762800"; 
   d="scan'208";a="5993995"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Aug 2011 17:44:36 -0700
Received: from pgsmsx104.gar.corp.intel.com (10.221.44.91) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 11 Aug 2011 08:44:33 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX104.gar.corp.intel.com (10.221.44.91) with Microsoft SMTP Server
	(TLS) id 14.1.323.3; Thu, 11 Aug 2011 08:44:33 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Thu, 11 Aug 2011 08:44:33 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 11 Aug 2011 08:44:32 +0800
Thread-Topic: [OE-core] [PATCH 5/7] multilib: remove MULTILIB_PACKAGE_ARCHS
	variable
Thread-Index: AcxR8pgGWV9VYL3HT6SG22N8IuOmRgATepjgAV/N6CA=
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12D70F72A7@shsmsx501.ccr.corp.intel.com>
References: <cover.1312384552.git.dongxiao.xu@intel.com>
	<ba3e6c58f74119dcdf1c26cfa6f31ab1383004d1.1312384552.git.dongxiao.xu@intel.com>
	<4E396A0A.5010205@windriver.com>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D7029D0B@shsmsx501.ccr.corp.intel.com>
In-Reply-To: <D5AB6E638E5A3E4B8F4406B113A5A19A12D7029D0B@shsmsx501.ccr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 5/7] multilib: remove MULTILIB_PACKAGE_ARCHS variable
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
X-List-Received-Date: Thu, 11 Aug 2011 00:49:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Xu, Dongxiao
> Sent: Thursday, August 04, 2011 9:00 AM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 5/7] multilib: remove
> MULTILIB_PACKAGE_ARCHS variable
>=20
> Hi Mark,
>=20
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of
> > Mark Hatle
> > Sent: Wednesday, August 03, 2011 11:32 PM
> > To: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 5/7] multilib: remove
> > MULTILIB_PACKAGE_ARCHS variable
> >
> > On 8/3/11 10:19 AM, Dongxiao Xu wrote:
> > > multilib package and normal package shares the same architecture
> > > deploy folder, thus we do not need the ${MULTILIB_PACKAGE_ARCHS}.
> >
> > This is incorrect behavior, at least for RPM.  The folder should have
> > the pkgarch specific to the tuning used to generate the multilib.
> > (Behavior may be correct for deb/ipk.)
>=20
> Yes, ipk package name is different between normal package and multilib
> package (tagged with MLPREFIX), so even they are put in the same deploy
> folder, there should be no problem.
>=20
> However for currently for rpm multilib, the normal package and multilib
> package are in the same folder with same name, thus one will override the
> other.
>=20
> Take "initscript" as an example, the normal rpm package name is:
> "initscripts-1.0-r127.x86_64.rpm". However the lib32 version of initscrip=
t's rpm
> package is also named as "initscripts-1.0-r127.x86_64.rpm", putting in th=
e
> same deploy folder: "tmp/deploy/rpm/x86_64".
>=20

Hi Mark,

Do you have updates on the above issue?

Thanks,
Dongxiao


> I think this should be an issue to fix, also we need to think about how t=
o co-work
> with ipk side.
>=20
> Thanks,
> Dongxiao
>=20
> >
> > (If RPM sees two packages with the same .arch, it assumes that it's an
> > upgrade operation.  If the .arch is different then it goes into the
> > multilib mode and will be able to install both packages together,
> > assuming the conflict resolution results in a working --
> > non-conflicting -- install solution.)
> >
> > --Mark
> >
> > > CC: Mark Hatle <mark.hatle@windriver.com>
> > > Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> > > ---
> > >  meta/classes/package_rpm.bbclass      |   13 ++-----------
> > >  meta/classes/populate_sdk_rpm.bbclass |    3 ---
> > >  meta/classes/rootfs_rpm.bbclass       |    3 ---
> > >  3 files changed, 2 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/meta/classes/package_rpm.bbclass
> > > b/meta/classes/package_rpm.bbclass
> > > index abedc68..9d0eeba 100644
> > > --- a/meta/classes/package_rpm.bbclass
> > > +++ b/meta/classes/package_rpm.bbclass
> > > @@ -27,8 +27,7 @@ package_update_index_rpm () {
> > >
> > >  	# Update target packages
> > >  	base_archs=3D"${PACKAGE_ARCHS}"
> > > -	ml_archs=3D"${MULTILIB_PACKAGE_ARCHS}"
> > > -	package_update_index_rpm_common "${RPMCONF_TARGET_BASE}"
> > base_archs ml_archs
> > > +	package_update_index_rpm_common
> "${RPMCONF_TARGET_BASE}"
> > base_archs
> > >
> > >  	# Update SDK packages
> > >  	base_archs=3D"${SDK_PACKAGE_ARCHS}"
> > > @@ -76,7 +75,7 @@ package_update_index_rpm_common () {  #
> > > package_generate_rpm_conf () {
> > >  	# Update target packages
> > > -	package_generate_rpm_conf_common "${RPMCONF_TARGET_BASE}"
> > base_archs ml_archs
> > > +	package_generate_rpm_conf_common
> "${RPMCONF_TARGET_BASE}"
> > base_archs
> > >
> > >  	# Update SDK packages
> > >  	package_generate_rpm_conf_common "${RPMCONF_HOST_BASE}"
> > base_archs
> > > @@ -203,10 +202,6 @@ package_install_internal_rpm () {
> > >
> > >  				archvar=3Dbase_archs
> > >  				ml_pkg=3D$(echo ${pkg} | sed
> "s,^${MLPREFIX}\(.*\),\1,")
> > > -				if [ "${ml_pkg}" !=3D "${pkg}" ]; then
> > > -					archvar=3Dml_archs
> > > -				fi
> > > -
> > >  				pkg_name=3D$(resolve_package_rpm
> > ${confbase}-${archvar}.conf ${ml_pkg})
> > >  				if [ -z "$pkg_name" ]; then
> > >  					echo "Unable to find package $pkg ($ml_pkg)!"
> > > @@ -223,10 +218,6 @@ package_install_internal_rpm () {
> > >
> > >  			archvar=3Dbase_archs
> > >  			ml_pkg=3D$(echo ${pkg} | sed "s,^${MLPREFIX}\(.*\),\1,")
> > > -			if [ "${ml_pkg}" !=3D "${pkg}" ]; then
> > > -				archvar=3Dml_archs
> > > -			fi
> > > -
> > >  			pkg_name=3D$(resolve_package_rpm
> ${confbase}-${archvar}.conf
> > ${ml_pkg})
> > >  			if [ -z "$pkg_name" ]; then
> > >  				echo "Unable to find package $pkg ($ml_pkg)!"
> > > diff --git a/meta/classes/populate_sdk_rpm.bbclass
> > > b/meta/classes/populate_sdk_rpm.bbclass
> > > index 5fb0234..f33e4a9 100644
> > > --- a/meta/classes/populate_sdk_rpm.bbclass
> > > +++ b/meta/classes/populate_sdk_rpm.bbclass
> > > @@ -115,7 +115,6 @@ EOF
> > >  }
> > >
> > >  python () {
> > > -    ml_package_archs =3D ""
> > >      multilibs =3D d.getVar('MULTILIBS', True) or ""
> > >      for ext in multilibs.split():
> > >          eext =3D ext.split(':')
> > > @@ -125,8 +124,6 @@ python () {
> > >              localdata.setVar("OVERRIDES", overrides)
> > >              # TEMP: OVERRIDES isn't working right
> > >              localdata.setVar("DEFAULTTUNE",
> > localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + eext[1], False)
> > or "")
> > > -            ml_package_archs +=3D localdata.getVar("PACKAGE_ARCHS",
> > True) or ""
> > >              #bb.note("ML_PACKAGE_ARCHS %s %s %s" % (eext[1],
> > localdata.getVar("PACKAGE_ARCHS", True) or "(none)", overrides))
> > > -    bb.data.setVar('MULTILIB_PACKAGE_ARCHS', ml_package_archs, d)
> > >  }
> > >
> > > diff --git a/meta/classes/rootfs_rpm.bbclass
> > > b/meta/classes/rootfs_rpm.bbclass index 7c06064..c188d27 100644
> > > --- a/meta/classes/rootfs_rpm.bbclass
> > > +++ b/meta/classes/rootfs_rpm.bbclass
> > > @@ -209,7 +209,6 @@ python () {
> > >          bb.data.setVar('RPM_PREPROCESS_COMMANDS', '', d)
> > >          bb.data.setVar('RPM_POSTPROCESS_COMMANDS', '', d)
> > >
> > > -    ml_package_archs =3D ""
> > >      multilibs =3D d.getVar('MULTILIBS', True) or ""
> > >      for ext in multilibs.split():
> > >          eext =3D ext.split(':')
> > > @@ -219,7 +218,5 @@ python () {
> > >              localdata.setVar("OVERRIDES", overrides)
> > >              # TEMP: OVERRIDES isn't working right
> > >              localdata.setVar("DEFAULTTUNE",
> > localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + eext[1], False)
> > or "")
> > > -            ml_package_archs +=3D localdata.getVar("PACKAGE_ARCHS",
> > True) or ""
> > >              #bb.note("ML_PACKAGE_ARCHS %s %s %s" % (eext[1],
> > localdata.getVar("PACKAGE_ARCHS", True) or "(none)", overrides))
> > > -    bb.data.setVar('MULTILIB_PACKAGE_ARCHS', ml_package_archs, d)
> > >  }
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


