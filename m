Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B7FD0716CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 03:36:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3S3b0n6024898
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 27 Apr 2015 20:37:00 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.1.141]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0224.002;
	Mon, 27 Apr 2015 20:36:59 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 1/3] license.bbclass: allow copying license
	not in common licenses
Thread-Index: AQHQgPm/GtphhcLQFEOZsT7Tc5/LmJ1hxBmg
Date: Tue, 28 Apr 2015 03:36:59 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AAF118A4EF@ALA-MBA.corp.ad.wrs.com>
References: <cover.1429781137.git.jackie.huang@windriver.com>
	<92ce281f37748218692be482b3393e81b4b817ec.1429781137.git.jackie.huang@windriver.com>
	<4123755.9MUpYuNdTt@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <4123755.9MUpYuNdTt@peggleto-mobl.ger.corp.intel.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.191]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] license.bbclass: allow copying license not in common licenses
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
X-List-Received-Date: Tue, 28 Apr 2015 03:36:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
> Sent: Monday, April 27, 2015 10:52 PM
> To: Huang, Jie (Jackie)
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 1/3] license.bbclass: allow copying license=
 not in common licenses
>=20
> Hi Jackie,
>=20
> A couple of comments in-line below.
>=20
> On Thursday 23 April 2015 17:38:15 jackie.huang@windriver.com wrote:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > Some package like linux-firmware has many licenses that aren't in any
> > way common, and new ones will be added from time to time, in order to
> > avoid adding bunch of such common license files that are only
> > applicable to a specific package, NO_GENERIC_LIC is added to allow
> > copying license not in common licenses, it should be used in the recipe=
 as:
> >
> > NO_GENERIC_LIC[<license_name>] =3D "<license file in fetched source>"
> >
> > e.g.
> > NO_GENERIC_LIC[Firmware-Abilis] =3D "LICENCE.Abilis.txt"
>=20
> Can we rename this to NO_GENERIC_LICENSE?

Yes, sure, I will rename it.

>=20
>=20
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ---
> >  meta/classes/license.bbclass | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/license.bbclass
> > b/meta/classes/license.bbclass index 73a0e97..990f704 100644
> > --- a/meta/classes/license.bbclass
> > +++ b/meta/classes/license.bbclass
> > @@ -222,7 +222,9 @@ def find_license_files(d):
> >              pass
> >          spdx_generic =3D None
> >          license_source =3D None
> > -        # If the generic does not exist we need to check to see if the=
re is
> > an SPDX mapping to it
> > +        # If the generic does not exist we need to
> > check to see if there is an SPDX mapping to it,
> > +        # unless NO_GENERIC_LIC is set.
> > +
> >          for lic_dir in license_source_dirs:
> >              if not os.path.isfile(os.path.join(lic_dir, license_type))=
:
> >                  if d.getVarFlag('SPDXLICENSEMAP', license_type) !=3D N=
one:
> > @@ -241,6 +243,14 @@ def find_license_files(d):
> >              # audit up. This should be fixed in emit_pkgdata (or, we
> > actually got and fix all the recipes)
> >
> >              lic_files_paths.append(("generic_"
> >              + license_type, os.path.join(license_source,
> > spdx_generic)))
> > +
> > +        elif d.getVarFlag('NO_GENERIC_LIC', license_type):
> > +            # if NO_GENERIC_LIC is set, we copy the license files
> > + from the
> > fetched source +            # of the package rather than the
> > license_source_dirs. +            for (basename, path) in lic_files_pat=
hs:
> > +                if d.getVarFlag('NO_GENERIC_LIC', license_type) =3D=3D
> > basename:
> > +                    lic_files_paths.append(("generic_" +
> > license_type, path))
> > +                    break
> >          else:
> >              # And here is where we warn people that their licenses
> > are lousy
> >              bb.warn("%s: No generic license file exists for: %s in any
> >              provider" % (pn, license_type))
>=20
> Should we detect and warn when the user is attempting to override a commo=
n license with this
> mechanism (which shouldn't be allowed)?

Yes, we should, it doesn't make sense to use this mechanism for a common li=
cense, I will add that.

Thanks
Jackie

>=20
> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre

