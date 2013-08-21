Return-Path: <nitin.a.kamble@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8899F6B0CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 17:14:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Aug 2013 10:11:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,929,1367996400"; d="scan'208";a="391057187"
Received: from orsmsx105.amr.corp.intel.com ([10.22.225.132])
	by orsmga002.jf.intel.com with ESMTP; 21 Aug 2013 10:14:28 -0700
Received: from orsmsx156.amr.corp.intel.com (10.22.240.22) by
	ORSMSX105.amr.corp.intel.com (10.22.225.132) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Wed, 21 Aug 2013 10:14:28 -0700
Received: from orsmsx103.amr.corp.intel.com ([169.254.2.129]) by
	ORSMSX156.amr.corp.intel.com ([169.254.8.154]) with mapi id
	14.03.0123.003; Wed, 21 Aug 2013 10:14:27 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3] distro_features_check.bbclass: Allow
	checking	of required/conflicting features
Thread-Index: AQHOjwSKKjsLtQW6HUukbNErD3eQgZmgBHcA
Date: Wed, 21 Aug 2013 17:14:27 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C704770C5@ORSMSX103.amr.corp.intel.com>
References: <1375395237-17840-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1375395237-17840-1-git-send-email-otavio@ossystems.com.br>
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
X-List-Received-Date: Wed, 21 Aug 2013 17:14:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Otavio Salvador
> Sent: Thursday, August 01, 2013 3:14 PM
> To: OpenEmbedded Core Mailing List
> Cc: Evan Kotara; Lauren Post; Otavio Salvador; Daiane Angolini
> Subject: [OE-core] [PATCH v3] distro_features_check.bbclass: Allow checki=
ng
> of required/conflicting features
>=20
> This add support to list required/confliting distro features for a recipe=
; this
> avoids user mistake when building recipes/images which would not work
> depending on DISTRO_FEATURES option set.
>=20
> Adding:
>=20
> ,----[ Use example ]
> | inherit distro_features_check
> |
> | REQUIRED_DISTRO_FEATURES =3D "x11"
> | CONFLICT_DISTRO_FEATURES_mx6 =3D "wayland"
> `----
>=20
> In the image recipe allow us to make clear to user that this image needs =
X11
> and /cannot/ be build with Wayland support in i.MX6 platforms, for exampl=
e.
>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> Changes in v3:
> - Move code from base.bbclass to distro_features_check.bbclass
> - Rework code
> - Rework commit log
>=20
> Changes in v2:
> - Rename to REQUIRED_DISTRO_FEATURES;
> - Remove spurious bb.note;
> - Rewrote error message;
>=20
>  meta/classes/distro_features_check.bbclass | 28
> ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta/classes/distro_features_check.bbclass
>=20
> diff --git a/meta/classes/distro_features_check.bbclass
> b/meta/classes/distro_features_check.bbclass
> new file mode 100644
> index 0000000..61b11b7
> --- /dev/null
> +++ b/meta/classes/distro_features_check.bbclass
> @@ -0,0 +1,28 @@
> +# Allow checking of required and conflicting DISTRO_FEATURES # #
> +REQUIRED_DISTRO_FEATURES: ensure every item on this list is included
> +#                           in DISTRO_FEATURES.
> +# CONFLICT_DISTRO_FEATURES: ensure no item in this list is included in
> +#                           DISTRO_FEATURES.
> +#
> +# Copyright 2013 (C) O.S. Systems Software LTDA.
> +
> +python () {
> +    required_distro_features =3D d.getVar('REQUIRED_DISTRO_FEATURES',
> True)
> +    if required_distro_features:
> +        required_distro_features =3D required_distro_features.split()
> +        distro_features =3D (d.getVar('DISTRO_FEATURES', True) or "").sp=
lit()
> +        for f in required_distro_features:
> +            if f in distro_features:
> +                break
> +        else:
> +            raise bb.parse.SkipPackage("missing required distro feature
> +%s (not in DISTRO_FEATURES)" % required_distro_features)


Hi Otavio,

In my observations, these SkipPackage exceptions do not show up on the scre=
en, leaving the user wondering what happened.
Also the above logic can be simplified as

 # check all the required DISTRO_FEATURES are enabled
 distro_features_split =3D (d.getVar('DISTRO_FEATURES', True) or "").split(=
)
 required_distro_features_split =3D (d.getVar('REQUIRED_DISTRO_FEATURES', T=
rue) or "").split()
 for rdf in required_distro_features_split:
      if rdf not in distro_features_split:
           bb.error / raise exception...

Thanks,
Nitin

> +
> +    conflict_distro_features =3D d.getVar('CONFLICT_DISTRO_FEATURES', Tr=
ue)
> +    if conflict_distro_features:
> +        conflict_distro_features =3D conflict_distro_features.split()
> +        distro_features =3D (d.getVar('DISTRO_FEATURES', True) or "").sp=
lit()
> +        for f in conflict_distro_features:
> +            if f in distro_features:
> +                raise bb.parse.SkipPackage("conflicting distro feature
> +%s (in DISTRO_FEATURES)" % conflict_distro_features) }
> --
> 1.8.3.2
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

