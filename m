Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DBE2CAC587
	for <webhook@archiver.kernel.org>; Sat, 13 Sep 2025 10:28:18 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.64])
 by mx.groups.io with SMTP id smtpd.web10.2552.1757759290259592956
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Sep 2025 03:28:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=AWkURNHs;
 spf=pass (domain: axis.com, ip: 52.101.84.64, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIjvNYVbudnHra+dQ7BpMkVcKfuSDrH40V1JGhKnn3NTkdF+158/XvejY97g3SsJaSrYCIpr8YAefy8tGXQG1qHR/zjCJMFmFxw6ZIUyQfUmQgjBlVkVFSgwmb7v2/xLrZpux+wNuhWVazHm5O/L8bEBoSfNd3MOxRz+61NRT5uN46izEbmmyd1VYSE4ORCV/aUHMCACCaUIAqBLNHrcEJrhUxNjDXDlvnHSb2rBdwl1caKyoKTognksAO8O+M9iprx+NAOP0ssw3ZxytpFPaehplufvSRUzhz7UQoJcdytG8R190JG5fMe0e58QdM8eCNlp3GGXTcAhtfHbImGsUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Q3t7hNi/XgRQcHA75DgpexA6g4jiJchAhURDbigmkQ=;
 b=o7WVnrLndP6gVaixcLkb0vRbyAGTz+PVkm1Lullwcqfj5rwz7KSLDpgpB3BzCQpLrMMdxAy1i4NvCn9hb+vL0wtox6DQMbcJwK+8xLbomM+gWHrui9S2uy1BoOzCtWEWmnJ0eYvAq148AiY7jAsVFoYJrko51/7Rz9k0k7rK5SaZn96DzdNljBSedSmNW3wqmkAofmhtxWqelX0KLFIvp6S3LiejpNcPGJrs//v1mMrEnVj+VFB1vap4nHE+MpBq5qZ1Kq9/EKh7F2ZFSDutpF/zMHDVvXmh5Oj1Ly+eH5Mr1IXC7xAquDhH+QzQ1tW0Q5Pv2DNfKzv//XZL0SnXTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Q3t7hNi/XgRQcHA75DgpexA6g4jiJchAhURDbigmkQ=;
 b=AWkURNHsRPMyJgq+6fOqPciskevtfr6FTJulMhlseoSD8ZB9E9QVdBVr+iwqSjFEuPtCBR1hhF9tucAFDbqMgHdGBAv1j3lO/W+f0G1I29qDEFrAdc6KX5NQMyeo5YMew8ZD9HOJQtH6Lf5ZwDFaKrYlrGYGtkZKj5wwrk7aso4=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AM0PR02MB5827.eurprd02.prod.outlook.com (2603:10a6:208:180::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sat, 13 Sep
 2025 10:28:07 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9115.018; Sat, 13 Sep 2025
 10:28:07 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Daniel Wagenknecht <dwagenknecht@emlix.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core] [PATCH] os-release: do not add empty parentheses to
 VERSION
Thread-Topic: [OE-core] [PATCH] os-release: do not add empty parentheses to
 VERSION
Thread-Index: AQHcJAEXptMgSXhsxkqXxuyAverq4bSQ5MWA
Date: Sat, 13 Sep 2025 10:28:07 +0000
Message-ID: 
 <DB5PR02MB10213CC660236ED26287025A1EF0BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250912161917.844344-2-dwagenknecht@emlix.com>
In-Reply-To: <20250912161917.844344-2-dwagenknecht@emlix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AM0PR02MB5827:EE_
x-ms-office365-filtering-correlation-id: e3437e74-a669-415f-ec0a-08ddf2b03aef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?1vzLNvtMOzsvmkWo7j2r6eBa7HDaWVpsRyhX/qFd4ae8slD6zGeD7o+i85zU?=
 =?us-ascii?Q?WgkUfWCowmIPwy9RXcZY1p/KyiDbhGsfueqmve3Ds+pb0SlcdNW6hseHH72o?=
 =?us-ascii?Q?40o1C0FLtgSruFTjvZ70cQLKwBiaMRlu+b35+jGEfXKrNeu50h3B7cxy6Xe2?=
 =?us-ascii?Q?ClIpTMyMbvpeSggPoQM6GsQ+MB2k+bLbIJfn4EauVoyMK1Jqe3qNv5Av8itr?=
 =?us-ascii?Q?LEknEd7qdZQceOuV9E4U8Mea45qA0j0VHj022j2nerrhyzfQEpFAi9imOxQ+?=
 =?us-ascii?Q?nD1qTww8r7QwnfRYiBN04HCCqBrvK+omxQqgF/RzwzM0dl6HqrslDE3YqLMu?=
 =?us-ascii?Q?k1WNr57hsIi3rYk4VR4CfDizee+bCEzakL30jioOCEvfK1ebau5rZDcYamSk?=
 =?us-ascii?Q?cGfAYuKwOiCccY7CB74qeAZBzsTwodxwlCxtH+C4H4Wrok9S+UeSYcIa/8J+?=
 =?us-ascii?Q?OxbEzpWjpxcTrQKQhiZiqk0yEpy2Aa2D/VcFXNeReirlIDbuqblTx4mV6DpN?=
 =?us-ascii?Q?aKauYb7dlgh1F3ZnQnUCSX/fdpkNaCIjFhNGe5ETKsy/E3CWaK+jrkZPHhaA?=
 =?us-ascii?Q?CcZYnFBtpLRVuJ+zUiNhAXzjv6woPNc34XfW9dqSVjSiKH+fCMDYGxsNkzY8?=
 =?us-ascii?Q?CBujBPoD6kFe/IgtCNJ0x7jezAcKZo2O7GTKQDt7CNuUmE21njE6dLk7e1TR?=
 =?us-ascii?Q?+Negc/wqXQCG3UMs+cvPVzEwi3TB5PTDJzzOsl4BnMit94QNQkTx0mmtKB84?=
 =?us-ascii?Q?FjXaZOUvtVZnrYghJWWDbQr+tfJURMWyLHMtbQvwyxkSErKNXXtcaV19pymS?=
 =?us-ascii?Q?taKYBM5orhKUkNsS6jHFOwIIWn6KdpIjbNWPDC8l784SrNbF5H/9XAP+ayDm?=
 =?us-ascii?Q?6kJEr/TZuRLj57RVAi5cMoGaR4LhBtGX/spg5QOyGp73r7CGjS0m8TeoGmZe?=
 =?us-ascii?Q?YZ1GXF6BDK2LdIomaIeRfbsCyZHH54MSVD9rJ2/7+KgpkKwoq7iLoN9vGPNm?=
 =?us-ascii?Q?LCFCmwgk/jBQfQtg9+vKOQZftmHMY4M0GR/KZIOjXUTSJtf8rLtkMCztAXvF?=
 =?us-ascii?Q?e9sbBwqX4O1e3lZRBzfj7awGsyBY7b4bD+tSXCFeet7blSUVOnqCvk0t3C8X?=
 =?us-ascii?Q?4RhlLpS6DochjkZq7OFvemXul/Rc/oow1VWlmiSvVDhVWFwHovvD5Xse/QVN?=
 =?us-ascii?Q?UbttIOnxRoJtqFIlRxulDQdxpKBf1s1B/KKUudowZxdL4LjtWfgjVLjNRUji?=
 =?us-ascii?Q?LeR+ADKj0gEVNSy03cFES7cSdTciIJrGSPA+mOnFROE21LAZixzlnYDHFia9?=
 =?us-ascii?Q?aeRIA3r8O6/a5OjfPhn3SWoU2/6IbNM9VE+Gho40Gt4Ea1j0kTk6eUqSbDSd?=
 =?us-ascii?Q?9v5JM/CNj6Kb+llfCL7TlyssSoXbiUYyyPHDfwF/GLqijJGOBIP3ZiWDCmRc?=
 =?us-ascii?Q?mRlmqd5/Ft8TdjYVFTI43NrV7TCPdjpFI30z6rUuLV3AbTgKSOzZgmg5Dwsz?=
 =?us-ascii?Q?WNG1KhRS62ohDc0=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?n8XxmpgXIOLax8EewlDKiWO0vHYAWdK4SBhA3Fi58d1extuG1D7MesKsTxCC?=
 =?us-ascii?Q?/XzLAVJOnmgdfUcLGdi2jlV68DfGeo46CFxQEcDZ61P+JaxX/xgYWHdRyF9C?=
 =?us-ascii?Q?LyEESN+EyRtjkbzRj4O5IaprLeBaEGDibHaNMhB+R+1xjUcx4RR42OfiW9Gx?=
 =?us-ascii?Q?kVVGAEam2XKIg5u+74NxbcPCnm+ZSbQF5+AoAkfeyGEZWsQtrzcn6GipIbN6?=
 =?us-ascii?Q?7zCpJbd+SF7OaD0v0+2NrrWVmfUo1u3RDLZLLXmeTGAUJmJiagCo4ffcZ3RZ?=
 =?us-ascii?Q?iyv3wjDJQDCZwAJYsNlTiWF2emwMwO+tdZNRe7IPL9Qi3Nfgrrg6bqkzU/KX?=
 =?us-ascii?Q?W/xo86f5w0YTWfDYeLnZSRJIndWniIp3pxHOeeLQYlRjSGL7mxkoY6pa/C3n?=
 =?us-ascii?Q?xVuhAEauQQ8f1krGiqkIvvpShQ64TuWe8pJd/NencZX5KpVT5PkNA/VD7cry?=
 =?us-ascii?Q?vsXj7PG5ADKY0dzB7o2jRRL0I7ySeUFx+8I8gxauhzDhr2jQnQ81P6FYZv1K?=
 =?us-ascii?Q?OhR5PaFEt89MIvdgaKPZiPepQ2rhTjCgweuXln/aty4kE2flL1HaW62V2fgb?=
 =?us-ascii?Q?ECcF1Nwv8Ng7+7KANkVnxfH0bsvait8v5PMAxY+H+hEBQGjTx7hp4ldoyCLk?=
 =?us-ascii?Q?xC73ryEe+9VBbpZJVN3YcIWgQwaLxprKpNKddAyR/GkIh62vif6IkTM9zgna?=
 =?us-ascii?Q?ELHlCZtTqMLjjeRIJfrx+vBLms+urCZCJLAZKPKV9lbXUW8K07TB4ZVp7JJu?=
 =?us-ascii?Q?pz8fe+5SsoR+yTBWeDEq2F4STbjuW3BEcQZfD7W4aDeorVTNGprNvg2Rmf3i?=
 =?us-ascii?Q?tWrR2vNlfxOsvUZc0nq/pQ9x1g1KQSk/seVFBB6vYsDijBWLwKo2wW4VLPft?=
 =?us-ascii?Q?S0I/3D+q7YvZ0NjmWNX7vJ3DsOe08WjIPNwpDeNp2T1mEuW6E1i+lExUTfFl?=
 =?us-ascii?Q?kOx5pTRnA8NNLELscy6BI7JoLcSJjQZFmd1km97Mt/AYlGZc3BaW2XWFhpnQ?=
 =?us-ascii?Q?8UJGEJskOaUlnVg2ZbDhVcfPkGAa822gWnIamSWzryB27nsizQAOBIfAyzVu?=
 =?us-ascii?Q?zchFslgFx2/JK4NMrAaTRslnKTSUp0/2M5H1e1qVzDDizrXRykyFr2BxX/zj?=
 =?us-ascii?Q?XPntB/QhyGyye8iFN//k0JP6cKZHj+By94kM8TdhMV0KYpTt6w2A1KJjV5kP?=
 =?us-ascii?Q?baYrYA+EXIv9N5jbBZ6NfRO/3FIsRd4N+ncKJ+z63R2vSMU/wL93pIHfE2FV?=
 =?us-ascii?Q?hgZGLcTxGvU6c4HHhQZDHyZoa4bV1xh47/CfXSOJd55tImIxASZRCl8wLBcT?=
 =?us-ascii?Q?ZLEMHzL668/EMZ/VDKfxAdpKBKsZhpiL5Lh++gbqNm4ITYOPycj67VKBMRnP?=
 =?us-ascii?Q?QuySoyjJq6CJ3iZHfIDIVXUEnYwA7GiPkBMgRiD8AV9IOby4viAwqzRm3MiZ?=
 =?us-ascii?Q?kzpUGEsTtcdLWPx0g1FTJm9VXIIyw++AyqlXsG4NsXJSGINbKg3n586f0Dg6?=
 =?us-ascii?Q?l/PJ46O2BhRk/FfGyCq1Lnk/rLy3tBJx9sTXND+f9qUCsW6Xgle0573ppA?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3437e74-a669-415f-ec0a-08ddf2b03aef
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2025 10:28:07.3249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sma5JmGVBlVt8kVCRxX1fGAOcaT0MihQQ+T0/qAF8RRN3aO3PL1epLBYk7Nun03r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5827
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Sep 2025 10:28:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223342

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Daniel Wagenknecht
> Sent: den 12 september 2025 18:18
> To: openembedded-core@lists.openembedded.org
> Cc: Daniel Wagenknecht <dwagenknecht@emlix.com>
> Subject: [OE-core] [PATCH] os-release: do not add empty parentheses to VE=
RSION
>=20
> Setting DISTRO_CODENAME to an empty string previously led to a VERSION
> field in /etc/os-release containing empty parantheses, e.g.
>    DISTRO_VERSION =3D "5.0.12"
>    DISTRO_CODENAME =3D ""
>    =3D=3D> /etc/os-release:
>        VERSION=3D"5.0.12 ()"
>=20
> This is probably not what a user expects, especially since it is quite
> common to set variables to empty strings to disable something in OE
> based builds, but using `unset VARNAME` seems pretty uncommon.
>=20
> Instead of adding the parentheses with the DISTRO_CODENAME if the
> variable is in the datastore add them only if the variable is not empty.
>=20
> Signed-off-by: Daniel Wagenknecht <dwagenknecht@emlix.com>
> ---
>  meta/recipes-core/os-release/os-release.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-co=
re/os-release/os-release.bb
> index e1906d05d..65e63a342 100644
> --- a/meta/recipes-core/os-release/os-release.bb
> +++ b/meta/recipes-core/os-release/os-release.bb
> @@ -22,7 +22,7 @@ OS_RELEASE_UNQUOTED_FIELDS =3D "ID VERSION_ID VARIANT_I=
D"
>=20
>  ID =3D "${DISTRO}"
>  NAME =3D "${DISTRO_NAME}"
> -VERSION =3D "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODENAME if 'DISTRO_CO=
DENAME' in d else ''}"
> +VERSION =3D "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODENAME if d.getVar('=
DISTRO_CODENAME') !=3D '' else ''}"

To cover all bases you should then use:

VERSION =3D "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODENAME if (d.getVar('DI=
STRO_CODENAME') or '') !=3D '' else ''}"

One thing I do not understand, and this is mostly a question for RP,=20
is how the first DISTRO_CODENAME is actually expanded in the above=20
definition. I would have expected it to be:

VERSION =3D "${DISTRO_VERSION}${@' (%s)' % d.getvar('DISTRO_CODENAME') if (=
d.getVar('DISTRO_CODENAME') or '') !=3D '' else ''}"

Or are all variables in d somehow available as Python variables=20
inside ${@...}? Because then a lot of such definitions could be=20
simplified, like VERSION_CODENAME below which would become:
VERSION_CODENAME =3D "${@DISTRO_CODENAME or ''}".

(Though that also seems odd as it could just as well be:
VERSION_CODENAME =3D "${DISTRO_CODENAME}"
)

>  VERSION_ID =3D "${DISTRO_VERSION}"
>  VERSION_CODENAME =3D "${@d.getVar('DISTRO_CODENAME') or ''}"
>  PRETTY_NAME =3D "${DISTRO_NAME} ${VERSION}"
> --
> 2.50.1

//Peter


