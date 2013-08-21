Return-Path: <nitin.a.kamble@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 606246AFC2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 20:49:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Aug 2013 13:49:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,929,1367996400"; d="scan'208";a="366436942"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
	by orsmga001.jf.intel.com with ESMTP; 21 Aug 2013 13:49:08 -0700
Received: from orsmsx154.amr.corp.intel.com (10.22.226.12) by
	ORSMSX102.amr.corp.intel.com (10.22.225.129) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Wed, 21 Aug 2013 13:49:07 -0700
Received: from orsmsx103.amr.corp.intel.com ([169.254.2.129]) by
	ORSMSX154.amr.corp.intel.com ([169.254.11.180]) with mapi id
	14.03.0123.003; Wed, 21 Aug 2013 13:49:08 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3] distro_features_check.bbclass: Allow
	checking	of required/conflicting features
Thread-Index: AQHOjwSKKjsLtQW6HUukbNErD3eQgZmgBHcAgAA7xgA=
Date: Wed, 21 Aug 2013 20:49:07 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C70477227@ORSMSX103.amr.corp.intel.com>
References: <1375395237-17840-1-git-send-email-otavio@ossystems.com.br> 
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: Evan Kotara <evan.kotara@freescale.com>,
	Daiane Angolini <daiane.angolini@freescale.com>
Subject: Re: [PATCH v3] distro_features_check.bbclass: Allow checking	of required/conflicting features
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
X-List-Received-Date: Wed, 21 Aug 2013 20:49:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Kamble, Nitin A
> Sent: Wednesday, August 21, 2013 10:14 AM
> To: 'Otavio Salvador'; OpenEmbedded Core Mailing List
> Cc: Evan Kotara; Lauren Post; Daiane Angolini
> Subject: RE: [OE-core] [PATCH v3] distro_features_check.bbclass: Allow
> checking of required/conflicting features
>=20
>=20
>=20
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On
> Behalf Of
> > Otavio Salvador
> > Sent: Thursday, August 01, 2013 3:14 PM
> > To: OpenEmbedded Core Mailing List
> > Cc: Evan Kotara; Lauren Post; Otavio Salvador; Daiane Angolini
> > Subject: [OE-core] [PATCH v3] distro_features_check.bbclass: Allow
> > checking of required/conflicting features
> >
> > This add support to list required/confliting distro features for a
> > recipe; this avoids user mistake when building recipes/images which
> > would not work depending on DISTRO_FEATURES option set.
> >
> > Adding:
> >
> > ,----[ Use example ]
> > | inherit distro_features_check
> > |
> > | REQUIRED_DISTRO_FEATURES =3D "x11"
> > | CONFLICT_DISTRO_FEATURES_mx6 =3D "wayland"
> > `----
> >
> > In the image recipe allow us to make clear to user that this image
> > needs X11 and /cannot/ be build with Wayland support in i.MX6 platforms=
,
> for example.
> >
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> > Changes in v3:
> > - Move code from base.bbclass to distro_features_check.bbclass
> > - Rework code
> > - Rework commit log
> >
> > Changes in v2:
> > - Rename to REQUIRED_DISTRO_FEATURES;
> > - Remove spurious bb.note;
> > - Rewrote error message;
> >
> >  meta/classes/distro_features_check.bbclass | 28
> > ++++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >  create mode 100644 meta/classes/distro_features_check.bbclass
> >
> > diff --git a/meta/classes/distro_features_check.bbclass
> > b/meta/classes/distro_features_check.bbclass
> > new file mode 100644
> > index 0000000..61b11b7
> > --- /dev/null
> > +++ b/meta/classes/distro_features_check.bbclass
> > @@ -0,0 +1,28 @@
> > +# Allow checking of required and conflicting DISTRO_FEATURES # #
> > +REQUIRED_DISTRO_FEATURES: ensure every item on this list is included
> > +#                           in DISTRO_FEATURES.
> > +# CONFLICT_DISTRO_FEATURES: ensure no item in this list is included in
> > +#                           DISTRO_FEATURES.
> > +#
> > +# Copyright 2013 (C) O.S. Systems Software LTDA.
> > +
> > +python () {
> > +    required_distro_features =3D d.getVar('REQUIRED_DISTRO_FEATURES',
> > True)
> > +    if required_distro_features:
> > +        required_distro_features =3D required_distro_features.split()
> > +        distro_features =3D (d.getVar('DISTRO_FEATURES', True) or "").=
split()
> > +        for f in required_distro_features:
> > +            if f in distro_features:
> > +                break
> > +        else:
> > +            raise bb.parse.SkipPackage("missing required distro
> > +feature %s (not in DISTRO_FEATURES)" % required_distro_features)
>=20
>=20
> Hi Otavio,
>=20
> In my observations, these SkipPackage exceptions do not show up on the
> screen, leaving the user wondering what happened.


With further debugging here, I found that after skipping the recipe it was =
picking
another version of the recipe. So if there is another recipe which can be u=
sed in place
of the skipped recipe, then no errors are reported on the screen. One way t=
o solve this=20
issue is to add REQUIRED_DISTRO_FEATURES to all these inter-replaceable rec=
ipes, which works
in my case, but it may not work for all kinds of recipes.

Thanks,
Nitin



> Also the above logic can be simplified as
>=20
>  # check all the required DISTRO_FEATURES are enabled
> distro_features_split =3D (d.getVar('DISTRO_FEATURES', True) or "").split=
()
> required_distro_features_split =3D (d.getVar('REQUIRED_DISTRO_FEATURES',
> True) or "").split()  for rdf in required_distro_features_split:
>       if rdf not in distro_features_split:
>            bb.error / raise exception...
>=20
> Thanks,
> Nitin
>=20
> > +
> > +    conflict_distro_features =3D d.getVar('CONFLICT_DISTRO_FEATURES',
> True)
> > +    if conflict_distro_features:
> > +        conflict_distro_features =3D conflict_distro_features.split()
> > +        distro_features =3D (d.getVar('DISTRO_FEATURES', True) or "").=
split()
> > +        for f in conflict_distro_features:
> > +            if f in distro_features:
> > +                raise bb.parse.SkipPackage("conflicting distro
> > +feature %s (in DISTRO_FEATURES)" % conflict_distro_features) }
> > --
> > 1.8.3.2
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

