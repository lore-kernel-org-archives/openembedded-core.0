Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA41C87FCB
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 06:00:56 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.20])
 by mx.groups.io with SMTP id smtpd.web10.15202.1754632849559033297
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 23:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=N9OsP+hT;
 spf=pass (domain: siemens.com, ip: 40.107.162.20, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRLkCaEM24TfrpOT2h0axGUA5cSQZjyDrN35NkkIVNqW9CvzdPaOATS91YQI7eMpRJtGKkO1u37QOxoo/QHndsWZHcqZarkoSl+6wwMmhBo7hohU+YTmgPYBS6s0kH1jBFBl53cQwlpXu12BGFVcDY4kq4oZs3FbcbBZ9+dHdya5rP8SzuQMy/yUys0sKGkYiNZV3aKOJP1OgHji4XoeMn1F50Ju1ONEL8uZJ1UTh0fG9API9zId1+91tJQwEi91il2AwlNXvXki7qcKtC8bfZNnBIyZ2imT9UVY4xM+mYDWpeMmov+R1wzN1Azu75YjkkCauU0doUKa7KKT3uXVQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kcb0misUA8yXBo8BYF4Zcz8vCpv/I/tFZka7v2/tivM=;
 b=ApztqG3Km54R00txV+8kkEb4nfapTN5v3rcipEiNLlXz4LYV9qEcKahiyB1coD5OVsBgtfJTqBiYsiB7TjvB/5mR1bf6ZFuFPWUgGcEAMp4k+owepTSW8oVMkH2g0I2vQlFif3ZB7shmCrS1YotCeu9oszzREbytP4VWNxMFNjjI/YQ7F0Jiq3XPjM7K32LO1DbnDwsyUjtFi6yWOKjpgZFeQ9bx962YF3lyAyc1sMyCiJkoixxZsJkVkp6M+eThKvFexrq8K81hoLmE5RWRxpQUGfANIGbNYo+8PL37ZDjqqg2cYOJ+ew+P3cqU5u1TkObjjKR1iOLbhznpZLhTbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kcb0misUA8yXBo8BYF4Zcz8vCpv/I/tFZka7v2/tivM=;
 b=N9OsP+hTzJKKzRfvfd5H/Vn+F9/ln/U/OVoauXrd/UvAS6n3dqGk2OsGetzvCFXNThMReTDaVikrodQ7Gr4NFMLCMKJgkJ6PclV+Ci574cUb9VcSNni4ESw8JJ/ZBKQpM3DKfulHDiDbBhEv3EwrQSgZcFDdAmkf6rLKg6Usa+zW/r6chAspirwhsMjS+u9oQH6V6c/2KxcEJhbDtgT4/vPy8JDTZ0q9K4RjVyRajGSTE5WGjlUJaAolgTWtz6V+hbcLiGFvV/t7vRyXbmeZced0X2CiH3I0lJ5TeTjHCrUTL6P/cHA/tIPcH7SKO7RMxu88+uymDV6Uavm8r7Vc5g==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PRAPR10MB5228.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:290::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 06:00:46 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 06:00:45 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 1/3] oe/utils: extract method for parallel_make
 without d context
Thread-Topic: [OE-core][PATCH 1/3] oe/utils: extract method for parallel_make
 without d context
Thread-Index: AQHcCCiEOy2HXpGez0SG7w8EVmaqTLRYQcpA
Date: Fri, 8 Aug 2025 06:00:45 +0000
Message-ID: 
 <AS1PR10MB56979F115CE1DEEFD2A6977EFD2FA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250808055059.8851-1-peter.marko@siemens.com>
In-Reply-To: <20250808055059.8851-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=c7ab3698-cd07-4131-b796-f681b4fe3464;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-08-08T05:55:33Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PRAPR10MB5228:EE_
x-ms-office365-filtering-correlation-id: e07fa2ec-5b7f-46e1-7e44-08ddd640ea8b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?//yMXImI9+lI3GmjWfQuJPdMphUSqlC6lFtITlHj1plO9HnpjUwIlw8ap5pd?=
 =?us-ascii?Q?7zF3gkE6OuAQ2nQZFtLkKISH8ekHkxzj8a+QU7Tng9FnwCsBgLp899Xli4XZ?=
 =?us-ascii?Q?KrQW7jJ+3UoZgihIYLuRZyltB3ParLus9JnQNRqunHZ9hZoQJQbiBw4ol6Ym?=
 =?us-ascii?Q?isbrchAjKa/2aDcLHeG7hMxVqimGUdc9uYbIweO0T0CQMRU3/0jbKJBo1QK2?=
 =?us-ascii?Q?nIr4axd5MmVUFV4OUa12tPIg2h+pZq0lBnBCtnkRxuCpGO3cU/oLxMJ/EtlT?=
 =?us-ascii?Q?klcJJ7ZpDZQNFb3E7s692245fRm5tOId+wJWK5BZgVZUFn9S/pxoU6mExXM/?=
 =?us-ascii?Q?AKMV28m7pRzYjrxySu+jbmCympPyB3pbFeepN5ySn4zzHdAH0C0BU/J0Qw1h?=
 =?us-ascii?Q?J6mfEZrRm9yJpHSDDkfxSXtVoRiHszC/baYifMq4OKMQjfilfuhml4GX4RoI?=
 =?us-ascii?Q?BpOwiZOxCMBuhl7rQkB3tFvHn0Mkk3s+z8e9ogjQZAabrVqAyPjAkmuYgWs7?=
 =?us-ascii?Q?7nEX9YgToiNKccDs1ZzeMar8bXWHs61nrcZ9CCSqnNziLeZ2mZ+6sww6XDCb?=
 =?us-ascii?Q?Hv5PUPebH8xk17926Uzgdo6SFEvkCF5VMY/MY1rvL+qE0DnF+ZvOJ4QhGM/Q?=
 =?us-ascii?Q?Kc11aaV5bICYoisWobMR+mmOTR3AszSx2+DG+AG3habrSED/INXnpa0ggz6a?=
 =?us-ascii?Q?rGj8l+MyumwnF2RraOrN7Jlh5pmEKBNk6F+poM4MkYyj8fuCaNRsXYNpaB+J?=
 =?us-ascii?Q?NKdXOg//Fg4gf9GahgKe+3TY+hqyVNNPpFO9RYEQThcxeu/YpyxBeV3rPi/t?=
 =?us-ascii?Q?U4/VJZo6P0RzQIUe3bdFOWRPKq2TCPFNMmVgpzdYe10FnAl9fSNRbWGTvXTS?=
 =?us-ascii?Q?fTbjJosUMgEDhMicEmGzrPvSJ9QecyYDKaZi1g3H+zlUHazkAvLdzvGiOK5c?=
 =?us-ascii?Q?TuF4jO9NAzRrazUyMjrzCo2Gx3V/Qv1E5D9oGPBWIMqT0NY/FW+mwydLsFtv?=
 =?us-ascii?Q?DahbetBeFzTux/HkBJhxwckpnSmmds8W3IrQlcQLO4wYw76PBZBCKak9+NM3?=
 =?us-ascii?Q?tvh5ZE4EV4WDTYENAv4EVIgYeDj5IteWqHNV74qIMJTDIsxI1V3fJ+awwFEv?=
 =?us-ascii?Q?zVhuybul9vDOBiZ5NgkRi5cTVz/OUsaVSwz3qODY4Z77jsKUZbB8ilj/Csy2?=
 =?us-ascii?Q?7Qclq6B7SO4gtTKJV+ggC53VTo2WdVSGVH6qbPvNgINKDDaMLihGALcjNisS?=
 =?us-ascii?Q?KeVXCtHqOgOS6ifRwOPAB4nWdrc3yZtwZdRvhHS1812qvFWHtMoZYnrjyYuW?=
 =?us-ascii?Q?6lvb8V4ZlH7487NiPHPdRivbh3+xFf052hsYQRrTbBhhqwosc1dzdILe2Mea?=
 =?us-ascii?Q?qfC4pz3Tx2Ja13b5+v+fpdHiqYH3ElRPoRJ4pi/xhWMJrzUMPG4wcdT1i9Nl?=
 =?us-ascii?Q?Sf/ymNXYMZA8NWuwh3YleiyLIBb+0TJkRki4n8AkoOQ5yz4ck5K8Qw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?LOkiN3YOixQLDo2iLab0A/FUaDyGonROmiK/e4fMxRZ/aGI7GkFSe9R6OONj?=
 =?us-ascii?Q?EQFDZKJWiBqZV3leUJM6PngHSvcg9Hh6NYglSzY4tdhqWfrNuImBSB4+bbCX?=
 =?us-ascii?Q?DiXCE+Nqj/UL01QwbVmyc5Zn0QUrfLuhgF7K8IquiZui8wcc+Uqz1EIlc29T?=
 =?us-ascii?Q?zhcJwlD88gxygCERjYMHaVL2AMoXMh6PebbGsDu3CLPSMup0pN88Zb+ETbbO?=
 =?us-ascii?Q?HdvAiQVT9wp3aKzTU+DwIjUTeDbSstm80bg0pcLBeGBQv24N8GlQqrm338tO?=
 =?us-ascii?Q?Y5Km13QGeoKZRqa8PHrN6KSYB/HgsqSUqiN/22mGkeOJQPbPCMKuTctN81Ns?=
 =?us-ascii?Q?yiM7Wi8PYKpnIzGgKcP8g/mrIkpdwjCIfg+iXOyhKwfR0Crmdq+yo1UMCNNK?=
 =?us-ascii?Q?h8SAEMTPgBBGTST7ykKRu5aQobBdpQgoHc4SvOyLD+IC9dhgnKQJjQS9KHf/?=
 =?us-ascii?Q?YLUNZlhCfZ5QQeHXa/m4Fhl33T9f+pjknYVAUltU0IMnOMDeKMFraH1RFyon?=
 =?us-ascii?Q?VjwC65HRHKyEk1GkDur6ZdWF47Vp+Gl/B/h2abm0AL/DP41psV6X44VT3/IR?=
 =?us-ascii?Q?dpTH5H432qw/arLhiiSIULtMIxjm96TJeoR39h8G3jZJTpwG4a7k/uwMjl+S?=
 =?us-ascii?Q?4kHG+KUzOobQb1996iaoRBi4lX6qnJa+rQAVlGI+lOMZe7l4XbC24rHALqD2?=
 =?us-ascii?Q?IPN7qxVrG6ADSax+tneiCVBIkPBTJpBvA+zKvVVfm+Mco0PaDE9SAVGFpqea?=
 =?us-ascii?Q?enRYmrwWmnRs7XRAkA5fjoY4FhjoEcisyKfIJHd7Q/34MTA/hU66qcC81gRY?=
 =?us-ascii?Q?hGZuIPRPXrbZFpMDfW1xtJ38IuFaDOB9mWc87l/rmBTs1i6iHgwnQM4i15zc?=
 =?us-ascii?Q?lN2t/HpF44G6kA+5+jNMJzpK36egHcwOSJkeI/5bdNwMIqNpeeBDovS6d/du?=
 =?us-ascii?Q?00mFanini2ef8fcnE+XGvaTOl1h5WVP3ulPVP/edjuhYk0gIvUXmn3ev1JUE?=
 =?us-ascii?Q?uZD+2BLqeCjQXYkufKxK084oC+lGdIBd1FpiCcdlUcGKsRlmQy6UbclDsTLm?=
 =?us-ascii?Q?+TPbxMkBh7jTfPDQ2tgYTGWJmFslLUyJADAkjVEHSkbiaKR+1OBxlEKuDieL?=
 =?us-ascii?Q?ZG652Q6SKlipuu3CofPdqZxX1GGpvsvOw95XSjmJKqm4rrmj2x8H53Dw034z?=
 =?us-ascii?Q?QSQ3d7TvTQMbznSZia0mEZnbdHaJU795ExBL9ayp01TnamikQVtVr081zEor?=
 =?us-ascii?Q?36bHjYxEjgjQgnh0s6f4ipUXrzYsGAjPFe4lwzmLxrbA5tdRjAr5W9oTUVTr?=
 =?us-ascii?Q?2FXmuK2vUG3qpZsm9ZOD78/MJX/j217kF6wK/GTPPkCbApZhSUwP/vO5QAvF?=
 =?us-ascii?Q?WYN+EvRYiNz2EYOdTChA3csClQd2GG2CZAaut3yawOTiOchAGUa98wuRA/pb?=
 =?us-ascii?Q?Anso0DdVXYBltE/aRfN/gSn6ot70i8gYAFgHrZ+XeDm9lUl/IbzzlSD4ssZ2?=
 =?us-ascii?Q?lUWQCwl+uVkvq1Ta56RxvRizXiFUWP8rRdnZkcbwi0hyC6DHiST6IG98RzYd?=
 =?us-ascii?Q?I0HcLs6LqSymgnWIoXHHGm7i3eEqzwXIoCmse3ej?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e07fa2ec-5b7f-46e1-7e44-08ddd640ea8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2025 06:00:45.7647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z7Dre9dLTn+8kNrHhjJq9YKkbOHpU+u/wV57vN3/4PhPnHzpIcLkDM+++ZZAyFw1/eCJoxkf/4XxVDKsZTzONQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5228
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 06:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221594

Note that this change rebuilds from scratch (with rn_work or empty tmpdir).
So the patch verification took me most of the day.
Although the value of PARALLEL_MAKE does not change and hashes of configure=
/compile stay the same,
hash of populate_sysroot changes although it does not evaluate parallel_mak=
e at all.
Is this a bug or a feature?

[poky]/home/projects/build/work-ccp7$ bitbake-diffsigs {/tmp,projects/poky/=
tmp}/stamps/x86_64-linux/quilt-native/0.69.do_populate_sysroot.sigdata.*
NOTE: Starting bitbake server...
basehash changed from 3e355b49fe002160af197c4418d78fe5e6e3f5ee2bbd294bc5ebe=
2f6cd62c93a to 13cd423267171f8ba581c9bf6c59a2380690daa9fa5dba3f14f33852d0c1=
38fc
Variable oe.utils.get_bb_number_threads value changed from '7789d42c55d3455=
966829336c3431581e91ea7f90daff00c90ba0bbc747625ac' to '3c2db6724598a1d5fdce=
f41fbb3e0971256afed3a3e1f891cd4b360864802a3f'
Variable oe.utils.multiprocess_launch_mp value changed from '6fcecddf5f515a=
fff9d1970920f983978d2e68da9ef052ec5e434062795d61ff' to '3a7bc5ba90a4b7dcaae=
29af22611269610cad86f9ad8f3db6a27234d046239c3'

Peter

> -----Original Message-----
> From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Sent: Friday, August 8, 2025 7:51
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [OE-core][PATCH 1/3] oe/utils: extract method for parallel_make =
without d
> context
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> oeqa does not have general access to d variable context and needs to
> determine parallel make settings.
> Extract the code from parallel_make into reusable parallel_make_value.
>=20
> Also correct function description of return value from None to empty
> string.
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/lib/oe/utils.py | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index 779c5e593f..8aa15373f1 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -174,18 +174,14 @@ def any_distro_features(d, features, truevalue=3D"1=
",
> falsevalue=3D""):
>      """
>      return bb.utils.contains_any("DISTRO_FEATURES", features, truevalue,
> falsevalue, d)
>=20
> -def parallel_make(d, makeinst=3DFalse):
> +def parallel_make_value(pm):
>      """
>      Return the integer value for the number of parallel threads to use w=
hen
> -    building, scraped out of PARALLEL_MAKE. If no parallelization option=
 is
> -    found, returns None
> +    building, scraped out of given string. If no parallelization option =
is
> +    found, returns empty string
>=20
> -    e.g. if PARALLEL_MAKE =3D "-j 10", this will return 10 as an integer=
.
> +    e.g. if string is "-j 10", this will return 10 as an integer.
>      """
> -    if makeinst:
> -        pm =3D (d.getVar('PARALLEL_MAKEINST') or '').split()
> -    else:
> -        pm =3D (d.getVar('PARALLEL_MAKE') or '').split()
>      # look for '-j' and throw other options (e.g. '-l') away
>      while pm:
>          opt =3D pm.pop(0)
> @@ -200,6 +196,20 @@ def parallel_make(d, makeinst=3DFalse):
>=20
>      return ''
>=20
> +def parallel_make(d, makeinst=3DFalse):
> +    """
> +    Return the integer value for the number of parallel threads to use w=
hen
> +    building, scraped out of PARALLEL_MAKE. If no parallelization option=
 is
> +    found, returns empty string
> +
> +    e.g. if PARALLEL_MAKE =3D "-j 10", this will return 10 as an integer=
.
> +    """
> +    if makeinst:
> +        pm =3D (d.getVar('PARALLEL_MAKEINST') or '').split()
> +    else:
> +        pm =3D (d.getVar('PARALLEL_MAKE') or '').split()
> +    return parallel_make_value(pm)
> +
>  def parallel_make_argument(d, fmt, limit=3DNone, makeinst=3DFalse):
>      """
>      Helper utility to construct a parallel make argument from the number=
 of

