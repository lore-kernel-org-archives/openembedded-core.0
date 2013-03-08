Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rich.dubielzig@windriver.com>) id 1UE6Hs-0004eq-Rv
	for Openembedded-core@lists.openembedded.org;
	Sat, 09 Mar 2013 00:01:17 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r28MidVe015048
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 8 Mar 2013 14:44:40 -0800 (PST)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.233]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.02.0342.003;
	Fri, 8 Mar 2013 14:44:39 -0800
From: "Dubielzig, Rich" <rich.dubielzig@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj
	<raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] eglibc: Handle QA warnings in nativesdk
	(denzil)
Thread-Index: AQHOHElXK0TV068+LkC4fetN1lYpupic4UUAgAABBAD//4DGgQ==
Date: Fri, 8 Mar 2013 22:44:39 +0000
Message-ID: <4DDB2CE82D9BF44DB2EC2903AD859F8185595A10@ALA-MBB.corp.ad.wrs.com>
References: <1362780455-31958-1-git-send-email-rich.dubielzig@windriver.com>
	<6A439775-3C47-4E34-949C-83FC024875A4@gmail.com>,
	<1362780900.9443.109.camel@ted>
In-Reply-To: <1362780900.9443.109.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.80.133]
MIME-Version: 1.0
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eglibc: Handle QA warnings in nativesdk (denzil)
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
X-List-Received-Date: Fri, 08 Mar 2013 23:01:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

=0A=
=0A=
From: Richard Purdie [richard.purdie@linuxfoundation.org]=0A=
Sent: Friday, March 08, 2013 2:15 PM=0A=
To: Khem Raj=0A=
Cc: Dubielzig, Rich; Openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH] eglibc: Handle QA warnings in nativesdk (den=
zil)=0A=
=0A=
On Fri, 2013-03-08 at 14:11 -0800, Khem Raj wrote:=0A=
> On Mar 8, 2013, at 2:07 PM, Rich Dubielzig <rich.dubielzig@windriver.com>=
 wrote:=0A=
>=0A=
> > /var/db/Makefile and /opt/(sdk path)/etc/ld.so.conf were not=0A=
> > being properly handled by the do_package task in=0A=
> > eglibc-nativesdk.  /var/db is now deleted and /etc/ld.so.conf=0A=
> > is being included in the -utils subpackage.=0A=
> >=0A=
> > Signed-off-by: Rich Dubielzig <rich.dubielzig@windriver.com>=0A=
> > ---=0A=
> > meta/recipes-core/eglibc/eglibc-package.inc |    3 ++-=0A=
> > meta/recipes-core/eglibc/eglibc_2.15.bb     |    2 +-=0A=
> > 2 files changed, 3 insertions(+), 2 deletions(-)=0A=
>=0A=
> Could you rebase it on master please ?=0A=
>=0A=
> >=0A=
> > diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes=
-core/eglibc/eglibc-package.inc=0A=
> > index 3298dea..d51d943 100644=0A=
> > --- a/meta/recipes-core/eglibc/eglibc-package.inc=0A=
> > +++ b/meta/recipes-core/eglibc/eglibc-package.inc=0A=
> > @@ -50,7 +50,7 @@ FILES_${PN}-dev_append +=3D "${bindir}/rpcgen ${libdi=
r}/*_nonshared.a \=0A=
> > FILES_${PN}-staticdev_append +=3D "${libdir}/*.a ${base_libdir}/*.a"=0A=
> > FILES_nscd${PKGSUFFIX} =3D "${sbindir}/nscd*"=0A=
> > FILES_${PN}-mtrace =3D "${bindir}/mtrace"=0A=
> > -FILES_${PN}-utils =3D "${bindir}/* ${sbindir}/*"=0A=
> > +FILES_${PN}-utils =3D "${bindir}/* ${sbindir}/* ${base_sbindir}/ldconf=
ig ${sysconfdir}/ld.so.conf"=0A=
> > FILES_${PN}-dbg +=3D "${libexecdir}/*/.debug ${libdir}/audit/.debug"=0A=
> > FILES_catchsegv${PKGSUFFIX} =3D "${bindir}/catchsegv"=0A=
> > RDEPENDS_catchsegv${PKGSUFFIX} =3D "libsegfault"=0A=
> > @@ -121,5 +121,6 @@ PACKAGE_PREPROCESS_FUNCS +=3D "eglibc_package_prepr=
ocess"=0A=
> > eglibc_package_preprocess () {=0A=
> >     rm -rf ${PKGD}/${includedir}/eglibc-locale-internal-${MULTIMACH_TAR=
GET_SYS}=0A=
> >     rm -rf ${PKGD}/${libdir}/locale=0A=
> > +   rm -rf ${PKGD}/var=0A=
=0A=
Isn't this ${localstatesir} ?=0A=
=0A=
And as Khem said, fixes need to be considered for master first, or at=0A=
least mention this is fixed in master if it is...=0A=
=0A=
Cheers,=0A=
=0A=
Richard=0A=
=0A=
________________________________________=0A=
=0A=
In the current system a /var directory always gets created within the root =
of the image/ directory under the eglibc-nativesdk build, not as a subtree =
of the opt/ install path.  ${localstatedir} points to a var/ directory that=
 resides within the SDK path.=0A=
=0A=
I will try a patch that rebases off of master.=0A=
=0A=
-Rich=0A=
=0A=


