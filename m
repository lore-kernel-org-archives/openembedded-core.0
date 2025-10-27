Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBAA5CCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 21:50:24 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.37])
 by mx.groups.io with SMTP id smtpd.web10.3622.1761601823909126942
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 14:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=RMBechRB;
 spf=pass (domain: siemens.com, ip: 40.107.159.37, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uV842XoKYlcofF7aNV5p/6JBMFAhFZUsySgXLiiZhbGedauoxd2M8aeKlek5wiSs/ZgXEUSZhmiUrotKDqYoM9AvMrY6I5xGmo/Tnw+0c5YhcZjOxzzQONGH+ZaonqfEeDFBwA2XYOIZah8/vMEtj1lhROswGFNCZz8pvpn1EEEIirLx7pk7irsrRA31NOb1Xwax0jS4LRRk4DrkdpgGEWFfRQ6USdZKQX1tRFQIUlsRTOV5+iIVHM/CwOX+NX73Bsww+wh+mTDy3s1WsFt147yGryLnPFzhZIXUM1Qi/B95qrzziZGboZE+jo8QRSLejwMoTGUBvwZTl6ucVs4sqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/M1LCP+XYkyH3ht0znuPkumUGauLBJQALkkAWFBtTWw=;
 b=sYErvsl3ks7jD4VVDT8kyTDtFfoSutYbsctoPSwxfv1CLg+/7Nyo6q9Y3S18Gi++g//pdh0NE17zK5EwCU7u0opfmuYYatwE/DK7a0FLSJSRS5gdRDTyO4Fou+BXiUDbgtOXZpEKt505i19AiC/3nhIzhqNc6M3sG67j93tXrBlIxn9JfEZYsOYssybdnnyEv64S/1oN8NXlKPqzgfzr7FItPc28+UY1EL4JsuHtOgDJWkHzj33tjKpObS+waoaq+ZStJIj6p+JNC5TbUN+fklvllROgIX+XYEX/kpiklOZxtO9hvyAG+dym4/E7/ykvJDE9FJgBqE+mALfjKrXCuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/M1LCP+XYkyH3ht0znuPkumUGauLBJQALkkAWFBtTWw=;
 b=RMBechRB05vm1MyIU9icgC4Hsb9N/y8qGNxeC+v8Cegd9RniLWWXbGSswgXLJFADxUCn6/2iGpOv6jN30DIrP7sWNRBLMc/jyJiToPDxJYiGnnIYO5PnXYIsDIWb3QHDTDxnA4jfF9MVVfPFkanlKadeJ/PdBYk9B2s37VVbRCa9kvN08hfO2ASPf/b1a8VIBk2xD2psMIL1iUUw6Dq7c8x3B3vGTduDMX3mlh7g/guZGjiAr/TyQN9afwwiLf2oRsgdPzd8/erSU7bTxrFLiON+w1S2K+sFbMCudypC7rJi35RLqll9rErM+WNfDMfUab+2qEKQSojLWxv/ZtesDg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS1PR10MB5649.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:478::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 21:50:20 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9253.013; Mon, 27 Oct 2025
 21:50:19 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [meta-lts-mixins][kirkstone/go][PATCH] go: upgrade 1.25.2 ->
 1.25.3
Thread-Topic: [meta-lts-mixins][kirkstone/go][PATCH] go: upgrade 1.25.2 ->
 1.25.3
Thread-Index: AQHcR4uPTzeNCl9WFUaHZh8By+bc97TWiDkg
Date: Mon, 27 Oct 2025 21:50:19 +0000
Message-ID: 
 <AS1PR10MB569717D99DE80DDDE605A1A7FDFCA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251027214918.3984048-1-peter.marko@siemens.com>
In-Reply-To: <20251027214918.3984048-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=f48fbd55-4d69-4877-9e09-cd3712a8f466;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-10-27T21:50:06Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS1PR10MB5649:EE_
x-ms-office365-filtering-correlation-id: 141db862-b349-4315-420c-08de15a2d2ab
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?o67e1n1fCKRGwNSKM6n46ZgxpaY3cxk5Untlawvmd6QjZDvAo5fyb80JDQi2?=
 =?us-ascii?Q?5Z3AtEru0F+9RyYoYXIrK5wNrKMxFh6RWSzWQM5L/35wOiBqLJ0GRbfKZoAS?=
 =?us-ascii?Q?hW0LZa3Vj59sZnIFfZgiGDHpIgHL5tdJefSw0ajplZBEHvEiENjP4X/eU27t?=
 =?us-ascii?Q?cFfGtUyLCPWqlnLsupBp8UgDIplcHVXh3NsfMGFkXKs1RmMQR6UMV0UDDr6h?=
 =?us-ascii?Q?CR4vHaDE2Ng2LVOEuam0nxh0QoMSQ4kQH+GN8pVEk8OlyfhHAeK9gfkxORvu?=
 =?us-ascii?Q?r5/iRB4sDno7cv5BEgPJQ+R3Z55MzAAlHXxZPC1gi7BEZ0WjvNUgVThLijXM?=
 =?us-ascii?Q?BEk0J6taOuorDPh75J2hNozX5ozHWVGpOR24iPeIsXns/5b/UccxUKlmV8ap?=
 =?us-ascii?Q?Z3YrC2PdF2O4xIyg4uM2m28IbouX+b7aYMuCR6HDu8gWtYIB6H16B35hticO?=
 =?us-ascii?Q?+T/2QeMWsgde1ADd0IGPF4sIvg3BUjrffdkRgUe73ZlqR+zDoElagtO1rTs4?=
 =?us-ascii?Q?BCpOpTMFJ6Ut9YRscnEBVtRN0fYZFbgXyI1VDFn/yUZXNLiTOjAo3yW29c5n?=
 =?us-ascii?Q?2r0gx75KFt4fWyCggchtQnkxsngU2TNQ3nzFrSHFvdFGtcrhXiSC0i0XX04m?=
 =?us-ascii?Q?8I3tJ3xyrSWC/PbL0uLtbdvabfDUcF8YBlksHGZYHIWAEYXHv0/SGvlYE1GB?=
 =?us-ascii?Q?62w6aX2Ho5Ow2Bg/Os7oB7CEFm7JN2kMUwOpBTuF2bxVmEZOBK7uJczfMGIy?=
 =?us-ascii?Q?ZdWXUB3W3DGW4S5ht22hxiCcWvaPWW1pyzxmsJCPNn0egfV7TTrmWoysR2wu?=
 =?us-ascii?Q?333O0jaCdScLBWzjgY/a11ElX9OVyukLHozFK2S6FeScPlrvTgSpmWz9YoG3?=
 =?us-ascii?Q?Tbt0piQyrsTEBH6mXfVZuxnL9UD4OQuVEyH+wCniZ2yZ4qPYbndWtzmwVRiO?=
 =?us-ascii?Q?vhrAr4Y3k8wirQ/jenjfsGIMfG+cOQBj74wI8Vu2lsqe06u5cv8LlpgnQVDO?=
 =?us-ascii?Q?h8sNI+OPBq4yQtWdC/+R/aZBXEdvhOjEhLxzwU052BTb12BzCiFXVygTMw7k?=
 =?us-ascii?Q?yfEDBbCzZ5c+dDxk2/QKkLm88446/tQZ6N05nNN/hmhG/BAciPSQziA4FlaH?=
 =?us-ascii?Q?eRJTqySKW2rKEQZLpDsdrDOtjvA2iMPOWmuaG3BHNPsHnEMKJStJf921wzXE?=
 =?us-ascii?Q?WuIPuZe3opYD+yDl06hQhIxBPv6EHK6dt669Vdo9cMQWtYavRQUn7u7ruwsH?=
 =?us-ascii?Q?cuf33m+e7ASsSHTebwb5AQFRsKjCMtnhUmShaWguZbyoDxJfDr/+HzBMYBp0?=
 =?us-ascii?Q?9sBmE+MmqwYlUEippsOL1Yk8L0rwzqsLdgQ/VwZD32VReuvHyi4Qx2w0T5SP?=
 =?us-ascii?Q?XdsUeDvJ20HpSiN/1sS4hkSjUgzBX2nlXm5JzVTPVZfjgGO6QdG7C/ghtcHZ?=
 =?us-ascii?Q?QhwRHPJr38lbSgkLIPsWAsTS4VnmQ/1iB2TwnuBBErnalaFzYaIt3Q=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Sk9MO+u4PgsCbpPM8XmlvEiluRV4k9FSjT6ZtlnIuKQj4cpUq55sfim1YW5d?=
 =?us-ascii?Q?o5vZ0KAsmY4lLfYPpFXbWPMhdy3TEJYK7HFiXBmHUHqvTJtJKpzYMcg1Eua6?=
 =?us-ascii?Q?Wd8Qg2Y86GdmF76TUR6bxTLyNX43urr8MrCHiv/qkyeJMoQKod5g8fp4A9W+?=
 =?us-ascii?Q?Kquy06jptgsmHvH2ANjNI+7iFSoONDcKhd3MNszpEjtfdE0vIjoYgt+WS6B7?=
 =?us-ascii?Q?DHpwHDaxTKGvE/CkkG8wN6TyYw3mgNu4r7pyzKWgQDfZeodi32Xo2iwUyAWo?=
 =?us-ascii?Q?XK/aCiLfCX1DsKj2pf8C+QgmQfFQi90Y1nqwkFt56pcgKrQj5k3hDua4kUy/?=
 =?us-ascii?Q?mhtoQObjgu3cXA3SOUu5kN5AEtGsuYr/HnJ6BWofw4+74eZUGAf0yX0C8bC2?=
 =?us-ascii?Q?8yQ6/4UmFMntibBo0I2dSlIRm3IK7TFn+ZCsxr7xPDjv/tpQ1S95+e4Pyk5u?=
 =?us-ascii?Q?jXSYbxdeR0ZoJY204RAhSC6NmwiIZnEmW0/iqojfG+EaPGLPcCBCp37x3HYq?=
 =?us-ascii?Q?/KV1Rxvj+KjJXAJGP+YKldjX/TXbev3AguKesb0RQkuE1znCVt8bi7RMU4Ff?=
 =?us-ascii?Q?4FVAH4uW8cJ9mO4GMN78lSazbZm4+EwTZLLmHxWiz0xHyHn8c8mU/9K33AB7?=
 =?us-ascii?Q?a3wCVaiUikeCrC0JCn/XEzuBToRm/zawLweDWG+NPF2R9ryzqM9YSfkZ+vKt?=
 =?us-ascii?Q?dis5dUjwRB/Szev5HmEB/X53HrQePIIHilf/V4snJAZAE5qmyWODLK4FXYAO?=
 =?us-ascii?Q?ZlPD99+RBHHknF3HL73/1dREX9z92bp4NxGNVs9veTWNYlvmWaKIVazkY897?=
 =?us-ascii?Q?TvsTihAdexrHB8EYVN3TRLJDcNFeADOGLDxF721HSS4pzphKa4JaPoAqfc9X?=
 =?us-ascii?Q?GjU6cjvP82iqzH817VDQWr//+Pq/z1tENjZN05ocRH3Wgj92cJcOi1jQJoCZ?=
 =?us-ascii?Q?9cGMRbZVt4g7mTUsbXHMPO6XeBdSkNUHSDZYxH+soDWslyfD6MPUycV+RvzU?=
 =?us-ascii?Q?LfXLTS+SfCKsL3oWhXlDFj6ZUUevF55p2lAziSnE1Cs31R1DekKF4urIlRT2?=
 =?us-ascii?Q?i9r4pRtL6f36MRgLf+qKWE84oLOQxhMEgc0QyNE1q8gMGvsNdgb9noOf0LfI?=
 =?us-ascii?Q?sgW1iz5aUbipvQKKQn9VGNxnQiAqGXQoJI2SXMNrJ6WadqPlalhkbRzY0Tma?=
 =?us-ascii?Q?/P2mGA9N3ILAJwcGOBV+/XFPj804oG4DBulMrNeoUh7yKsdE1r3bc+tKb5Y2?=
 =?us-ascii?Q?ZMH2u+I1Yqtpey/vDF1TG3LU1D2DiD4FDzzc7jF+zXzKWl3ONVhYinmDjIe4?=
 =?us-ascii?Q?4YlARa/7y3kPFc+0K5ZzEDGtCT+SQ2NBvIXYdU4/yuRYeV6uWJ8ccGJ7ZwaG?=
 =?us-ascii?Q?r9UXVfSk5UjVCMtQ14qG11Euw+pjjD0KprdQjxU0RII0IH1CpYqsvHkBp3EB?=
 =?us-ascii?Q?f1H1c/p39npmuXaHG8M4qUJVsy073faim+nx/7jCOiPQGoId90gX3JepVPul?=
 =?us-ascii?Q?5bY8wRtJDEOL8zT3PSQk8pYaIq41zjysGTo4n7XYZA2wuu7pGHB14QH9qG6/?=
 =?us-ascii?Q?NJwxObiQec0A4o6PVvAmspS7mexhzVf2dA+m8wMk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 141db862-b349-4315-420c-08de15a2d2ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 21:50:19.6122
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jVT3ZQjM46CzpqwjhC9smbAssD1ugzkbWl+i32hVza3vvztnk6PLIUWdDjJ/f4H53ZpkIQAy44tQoXnXlA4ANQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5649
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 21:50:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225366

Please ignore, wrong mailing list.
Peter

> -----Original Message-----
> From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Sent: Monday, October 27, 2025 22:49
> To: openembedded-core@lists.openembedded.org
> Cc: jose.quaresma@foundries.io; Marko, Peter (FT D EU SK BFS1)
> <Peter.Marko@siemens.com>
> Subject: [meta-lts-mixins][kirkstone/go][PATCH] go: upgrade 1.25.2 -> 1.2=
5.3
>=20
> Upgrade to latest 1.25.x release [1]:
>=20
> $ git --no-pager log --oneline go1.25.2..go1.25.3
> 28622c1959 (tag: go1.25.3) [release-branch.go1.25] go1.25.3
> e05b2c92d9 [release-branch.go1.25] crypto/x509: rework fix for CVE-2025-5=
8187
> 79ec0c94f3 [release-branch.go1.25] spec: update spec date to match releas=
e date
>=20
> This release addresses breakage caused by a security patch included in Go
> 1.25.2
> and 1.24.8, which enforced overly restrictive validation on the parsing o=
f X.509
> certificates. We've removed those restrictions while maintaining the secu=
rity
> fix that the initial release addressed [2].
>=20
> [1] https://github.com/golang/go/compare/go1.25.2...go1.25.3
> [2] https://groups.google.com/g/golang-announce/c/YEyj6FUNbik
>=20
> (From OE-Core rev: d5f281bf13995117d98af809a2caea91e241713e)
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  recipes-devtools/go/{go-1.25.2.inc =3D> go-1.25.3.inc}        | 2 +-
>  ...o-binary-native_1.25.2.bb =3D> go-binary-native_1.25.3.bb} | 6 +++---
>  ...cross-canadian_1.25.2.bb =3D> go-cross-canadian_1.25.3.bb} | 0
>  .../go/{go-cross_1.25.2.bb =3D> go-cross_1.25.3.bb}           | 0
>  .../go/{go-crosssdk_1.25.2.bb =3D> go-crosssdk_1.25.3.bb}     | 0
>  .../go/{go-runtime_1.25.2.bb =3D> go-runtime_1.25.3.bb}       | 0
>  recipes-devtools/go/{go_1.25.2.bb =3D> go_1.25.3.bb}          | 0
>  7 files changed, 4 insertions(+), 4 deletions(-)
>  rename recipes-devtools/go/{go-1.25.2.inc =3D> go-1.25.3.inc} (91%)
>  rename recipes-devtools/go/{go-binary-native_1.25.2.bb =3D> go-binary-
> native_1.25.3.bb} (79%)
>  rename recipes-devtools/go/{go-cross-canadian_1.25.2.bb =3D> go-cross-
> canadian_1.25.3.bb} (100%)
>  rename recipes-devtools/go/{go-cross_1.25.2.bb =3D> go-cross_1.25.3.bb} =
(100%)
>  rename recipes-devtools/go/{go-crosssdk_1.25.2.bb =3D> go-crosssdk_1.25.=
3.bb}
> (100%)
>  rename recipes-devtools/go/{go-runtime_1.25.2.bb =3D> go-runtime_1.25.3.=
bb}
> (100%)
>  rename recipes-devtools/go/{go_1.25.2.bb =3D> go_1.25.3.bb} (100%)
>=20
> diff --git a/recipes-devtools/go/go-1.25.2.inc b/recipes-devtools/go/go-1=
.25.3.inc
> similarity index 91%
> rename from recipes-devtools/go/go-1.25.2.inc
> rename to recipes-devtools/go/go-1.25.3.inc
> index 9d1cf69..c29f4d6 100644
> --- a/recipes-devtools/go/go-1.25.2.inc
> +++ b/recipes-devtools/go/go-1.25.3.inc
> @@ -18,4 +18,4 @@ SRC_URI +=3D "\
>      file://0011-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.pat=
ch \
>      file://0001-runtime-when-using-cgo-on-386-call-C-sigaction-funct.pat=
ch \
>  "
> -SRC_URI[main.sha256sum] =3D
> "3711140cfb87fce8f7a13f7cd860df041e6c12f7610f40cac6ec6fa2b65e96e4"
> +SRC_URI[main.sha256sum] =3D
> "a81a4ba593d0015e10c51e267de3ff07c7ac914dfca037d9517d029517097795"
> diff --git a/recipes-devtools/go/go-binary-native_1.25.2.bb b/recipes-
> devtools/go/go-binary-native_1.25.3.bb
> similarity index 79%
> rename from recipes-devtools/go/go-binary-native_1.25.2.bb
> rename to recipes-devtools/go/go-binary-native_1.25.3.bb
> index 2320731..79a0f5c 100644
> --- a/recipes-devtools/go/go-binary-native_1.25.2.bb
> +++ b/recipes-devtools/go/go-binary-native_1.25.3.bb
> @@ -9,9 +9,9 @@ PROVIDES =3D "go-native"
>=20
>  # Checksums available at https://go.dev/dl/
>  SRC_URI =3D "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-
> ${BUILD_GOARCH}.tar.gz;name=3Dgo_${BUILD_GOTUPLE}"
> -SRC_URI[go_linux_amd64.sha256sum] =3D
> "d7fa7f8fbd16263aa2501d681b11f972a5fd8e811f7b10cb9b26d031a3d7454b"
> -SRC_URI[go_linux_arm64.sha256sum] =3D
> "9aaeb044bf8dbf50ca2fbf0edc5ebc98b90d5bda8c6b2911526df76f61232919"
> -SRC_URI[go_linux_ppc64le.sha256sum] =3D
> "91dd35ac3f33baa642d9bac22b626bdb5ee0372cf80e7d782994337f81f34417"
> +SRC_URI[go_linux_amd64.sha256sum] =3D
> "0335f314b6e7bfe08c3d0cfaa7c19db961b7b99fb20be62b0a826c992ad14e0f"
> +SRC_URI[go_linux_arm64.sha256sum] =3D
> "1d42ebc84999b5e2069f5e31b67d6fc5d67308adad3e178d5a2ee2c9ff2001f5"
> +SRC_URI[go_linux_ppc64le.sha256sum] =3D
> "68d1a08bf3567f330717d821b266a0be1c5080bd05dc238b5a43a24ca0c47d7c"
>=20
>  UPSTREAM_CHECK_URI =3D "https://golang.org/dl/"
>  UPSTREAM_CHECK_REGEX =3D "go(?P<pver>\d+(\.\d+)+)\.linux"
> diff --git a/recipes-devtools/go/go-cross-canadian_1.25.2.bb b/recipes-
> devtools/go/go-cross-canadian_1.25.3.bb
> similarity index 100%
> rename from recipes-devtools/go/go-cross-canadian_1.25.2.bb
> rename to recipes-devtools/go/go-cross-canadian_1.25.3.bb
> diff --git a/recipes-devtools/go/go-cross_1.25.2.bb b/recipes-devtools/go=
/go-
> cross_1.25.3.bb
> similarity index 100%
> rename from recipes-devtools/go/go-cross_1.25.2.bb
> rename to recipes-devtools/go/go-cross_1.25.3.bb
> diff --git a/recipes-devtools/go/go-crosssdk_1.25.2.bb b/recipes-devtools=
/go/go-
> crosssdk_1.25.3.bb
> similarity index 100%
> rename from recipes-devtools/go/go-crosssdk_1.25.2.bb
> rename to recipes-devtools/go/go-crosssdk_1.25.3.bb
> diff --git a/recipes-devtools/go/go-runtime_1.25.2.bb b/recipes-devtools/=
go/go-
> runtime_1.25.3.bb
> similarity index 100%
> rename from recipes-devtools/go/go-runtime_1.25.2.bb
> rename to recipes-devtools/go/go-runtime_1.25.3.bb
> diff --git a/recipes-devtools/go/go_1.25.2.bb b/recipes-devtools/go/go_1.=
25.3.bb
> similarity index 100%
> rename from recipes-devtools/go/go_1.25.2.bb
> rename to recipes-devtools/go/go_1.25.3.bb

