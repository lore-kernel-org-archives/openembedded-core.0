Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99531C5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 15:53:01 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.16])
 by mx.groups.io with SMTP id smtpd.web11.11397.1749138773428094440
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 08:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=X3DDHFuc;
 spf=pass (domain: siemens.com, ip: 52.101.65.16, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y4etNssYt69syHNBw2EJb/8Lr4rCWLwluSSc3JeszsEKGiB4juADLdvJRr2jG9jDlvUAGmEpRwfQzJonMU0ltQfJ80JQOZ/4c2AusqZhw/lJQ9Yytympzj57mRo8E4IaQgiEJl/c9KjtPa4/5eqNR8XZHcjIoQ/tRHmbkX33CdeP6PgkmdZv56Td62PAEzrNmaxz0B2OpVtBsGysfrH1+WxKnUGFNLOoiNGnbl9wxSMco3yZieTFVte4NvEEhW2DtJS7MrYloH/a9Bf/4SXKpz/7+XsKJHX7L7dRq4RqSw9zGsPN1BVxwH7eT6b9Mr6dhe2e1/+EU+2gjMUA35CkyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7MtGVpsg5Dd1451DI453B8QL3bFeZk6lnBbSboH9sI=;
 b=u9gRI/cu48U8hnBXCFQQf9YTucbsK33CEEIWjkwZsUftnRzykvHrWPtnotUBkO3i9WO0s8vJ+Za2NaaqbNPTqtDF9FfVayAKYGyPVXWyGSRwO4Zpo21srey9heml1MgYUiiLwclaf7AHVFew0/63m+h0FBwM8fgM+qnhluNoNjU8p3kEj38hWxvc96TzIZPlvgn/T+HHe50mSIQpSqKLs986Krl9pDJWHP3gv+6pEtN4Kw/7x/idOQEQM0trS3iGsDhVU0px5i31G34TW14uzL48jkkzR8cR8kxtY5aRZSzxXNl7gM1tt+qAwUoL78IouPpSQptFd+lDEDpbA0oifQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7MtGVpsg5Dd1451DI453B8QL3bFeZk6lnBbSboH9sI=;
 b=X3DDHFucYMBtFfjTYPaEfCXQI5tFI39rvfFActeq+RwSkVUTwCtBWVvnz163XonpsTrhEzLsS9KoXZbB7iN+YvV6Plx/k++qrkBAEauxARuWw0k/CFSKmvIzpGbsgYzgA+flDshxorUxnfo9LgVRv2ryW5iMzRSukjhvWVnBcL6oPFDYs9I1Xib9DGba0S6Gh6tfSSnmqhQ42IQSm7oU+yftcz5ryaB2LSNPtXNpbYQ0nKOphd5IxIGtU8vZSTdSr+KkL+/ARaJJH5yAQLBYgOYCJbLvDe+r1JktXj3n6RnAydzYwEd91CYBWbyZdxsrYDEwQuJ9ivwmFhMPT8Ir3A==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV1PR10MB5866.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:55::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Thu, 5 Jun
 2025 15:52:50 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8769.037; Thu, 5 Jun 2025
 15:52:50 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 01/16] libmodulemd: put version in recipe
 filename
Thread-Topic: [OE-core] [PATCH 01/16] libmodulemd: put version in recipe
 filename
Thread-Index: AQHb1i91ryzqz9GeMEql9SnpmSn9YbP0thlg
Date: Thu, 5 Jun 2025 15:52:49 +0000
Message-ID: 
 <AS1PR10MB569780F67AB030E8A0B92B50FD6FA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250605153508.961682-1-ross.burton@arm.com>
In-Reply-To: <20250605153508.961682-1-ross.burton@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=181df98c-2c39-4b6b-99d8-5616cb5495f5;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-06-05T15:48:08Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV1PR10MB5866:EE_
x-ms-office365-filtering-correlation-id: d7a1a1e8-6ebf-4673-4905-08dda4490632
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?6Xbxj1m9VCIT8pL932Lw2J/RBSh2tfBEIFriewr8nNvViZRSw+LOFTqf8ZBR?=
 =?us-ascii?Q?yLiGO0MwfbZGnaXlVoyVOgn6mgGMig3Xw1ONvG+c1y+wSWiqTwe+klcJZLWM?=
 =?us-ascii?Q?SluMMDsXFVieFXrJpnB3MZKzX1Gwkz19AwbBDXrGM2xGRJlw/ud3Q3+uJJU+?=
 =?us-ascii?Q?qCmULAHTFeQR/x797Y7wYV5GZjqHl4BSqFT4xcU/c8fr8fPSAr23t8kzJVPy?=
 =?us-ascii?Q?af006uaHsATYIkAJO6MQCDUWY2vSQ5612/9/FghFFveKMXUivBaIDVGZOCxt?=
 =?us-ascii?Q?KWFp84U+Vd+RHLG/BsqHIptXqUZyW18IiMHzhOCNWC8lovQBqMEAl5ob3/I3?=
 =?us-ascii?Q?3VTdeYCjeVu9dVvr276jYD9ZCcbup+Zw+YafrH5DfHWHaZx4G16sR9MSk7NX?=
 =?us-ascii?Q?zldcwKjj1bshwuThP1dr9A7ou00b0OYBjmjxo5/tPTxlMdA8Ew7g9nA02DTR?=
 =?us-ascii?Q?edrCjVwTT08Q6rFFIY7/Ft30KCF8RTuCMiAa0/xQjnjRzMohVnAUHqpvF0zr?=
 =?us-ascii?Q?CCB9kIa41Dxyi0BbZgjF66la6kaXcpbvlN/H6VbRxVJs+ZzPxkuMnmKVJAOe?=
 =?us-ascii?Q?+NV4sJCapPDla5305knX8w1fUPHPwsoKNqG1MmhdquBkzqaFr/qGnJSMXHbS?=
 =?us-ascii?Q?v+Lu84/kGQEk6aAA1mphtBN9X0u4fs4JJnNRB0fpYc3TqgEk7ZGuPRfIn9Fb?=
 =?us-ascii?Q?Kg8tWgXhQLmnyzMerPE6sr+29caPxUuZ/iDjZ1bo3HEX6Zrdn3Lz0gx7me8Y?=
 =?us-ascii?Q?5kGhURee5sE0728wZ/dzjCkT9c/ZHsUAvS2BcWsiSa/pBU9ebae4o5g4uHI4?=
 =?us-ascii?Q?dbPjI3mD9gabfz6G57zqljBxK4gXKQQdI4MMgMSREr0Kt53Sfk/aiFOaltR6?=
 =?us-ascii?Q?snUSL5G9mSwCaojU1AfC/dCAHGM0ML/aUGlYCr9vcvF650gUyetc/59oJ5io?=
 =?us-ascii?Q?VMBrGle1RgqkP6e1kdvEgREarq7Hr/SlA4gdc3mZ8+1/fOXS9r8Wyr1kcxD5?=
 =?us-ascii?Q?yTqgpSPtofpsz1i98hYPEJlzJbKVVOkXVZzu1MiE7zvgGnWPg8HcLdMf2qon?=
 =?us-ascii?Q?pTvp0omtwAjnKR2D2daAiwk3/VTlzpBPCRnfFKRy+DbpVaC1Wf0O5YoS4A1W?=
 =?us-ascii?Q?QEkH98RmVfIpxmxd2zb04FzLrx57v/wSzump6waCjJqgpPW2xBcmQcblzI2P?=
 =?us-ascii?Q?TSPlDII1xEkHe742swsZYGAJ0IDxwzPflBuX9plTeWyQWIlgKKe4vLNATe/I?=
 =?us-ascii?Q?WcSCRAPkxsaVfyOoMpi0BmMIPvPXnjw1n9UGBcAptsKbJZefZnIXScKRJSpA?=
 =?us-ascii?Q?lM5YncGp57EXpiZf96c/qG9GCEkjNDGu81viXgeUUEpTgut65wtvNqS1RlQX?=
 =?us-ascii?Q?KZluxM9iNTouvPQnaEb/pndg5HGjU4qW7dbJNBEH4PSRwKAiyYbU6xD1yGrO?=
 =?us-ascii?Q?zQy9tTu5DN251Ko4iPN42sIrPVSzNeyRS0IkR7+fQxTIHSNIql3ZAg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?egIygKhXbSOHcXBiS3U0FNaWmUomWDtHGh+G2Mr++G/lsPnVkcK57N4XzUHo?=
 =?us-ascii?Q?jQzCnPutUQmSMwxcSUGHfGXp0Hl/xjkSZU/kuWlOAxPUQO62GzJNJv2g3bI9?=
 =?us-ascii?Q?hJAbK8VFOTbzp8mwqw3/PLYjAszg6y1tLfplMuM2NDBHy9SC/E2Jil+mFWCK?=
 =?us-ascii?Q?cPOmlgkv0RKohM6zZnHecu3s1NT61MqM5r0V5v0oP9yaW1IDcFAZ0tqdBHu2?=
 =?us-ascii?Q?Ww5lqiyWlQz8AduoUfexH+lj4Cw9Cq4Ei9akXN2LFMzzX/bQOJ0YNtaHRDv2?=
 =?us-ascii?Q?I89c/sWRrGG75A4/t1VNBvh+mkFkEJehUM7+enz12u1PdtFepRDI/45S3PFr?=
 =?us-ascii?Q?Eu6R4XQWMCqEMftMuCduRUXGNGypMRaImgrwwXhmLjbrr86dOOhmJ5jkO15Q?=
 =?us-ascii?Q?VutzOththRnn5TJqpboquPYEI5dBsOZvz1zqIvxYniosw/qXaN8rF82QCADn?=
 =?us-ascii?Q?7waP4Gsu1Pcn859hWYOd3BDknb/Ouz4Glki3jXFeukFBAmLTBrLFDGcvZlPz?=
 =?us-ascii?Q?ubS8IHvYxOfjmUzyEzHJNtubvj36weRacaOmxHUIa0Ds9qCKhdwLJGbmyIa/?=
 =?us-ascii?Q?67mXorlde12KhWsCYN/cogczdG7GufY0UqE5gBPRE+8oyb/PSrgsiTCYpVAt?=
 =?us-ascii?Q?MW+gXga7s6h/H2JKQaPi0fHcHGTeqpOwaKb+2eQEssa5qu6cAOW4VLWF1aKW?=
 =?us-ascii?Q?f8IXeCi2t/LO07lv02jDYHIFnRcFVVESt5Oc9EFbsiTVeHuVN60i12PQ8qD+?=
 =?us-ascii?Q?cTzzLYhBCH4bu6NYFvDyvlchpan3KUBktOa/9H4NectlwNe8szEa3Ntmh0jg?=
 =?us-ascii?Q?xVre3EFWJqC3OjaQm5N+jfVmJTCrUtREYTDXXqie8Y5PbTERI7Peeni7zBP+?=
 =?us-ascii?Q?b78N9C6iSnp6QpTUxfeTxWiXRvwp255n4zbnNis3xOiSYkq+dua4wBB0JtWl?=
 =?us-ascii?Q?AH4XlExBKtsn6PPZd/suJbofFamj584Smud4sXEwb/QqK3OKtlH0kz7FDc5+?=
 =?us-ascii?Q?bFVjd2GUtMoY/YE+k1W070EktRKmJZN+RfxoAe4hfBdNzWeYnEBS8y7qGszz?=
 =?us-ascii?Q?EpsImS/IhtH0kPSP8L/6baINIYIWw8cDmoBzxr+lRLQGw5r39kSIVFU79cY9?=
 =?us-ascii?Q?RA6a1zPXRPFxDCQxt0a9JPWq/gopVch8P6GKZvzQuxqSALspEGvn65tNVPqn?=
 =?us-ascii?Q?h7f2NTbG7TH+jnqrUVDDKW1NSskeRALuixYFiRQGbf4/62aNjY4yeIvtPGwi?=
 =?us-ascii?Q?hjpnHf2e/6FdCWiy33bUBMO31X3hOR8jfM5mhMYPsE+1iZjgiEPYKRJe+Rc5?=
 =?us-ascii?Q?djpbhSNsuLssEEPCUHTZFu44EB8zpbxZo5El/o40+p/ECGsp844Z1jtF7IEt?=
 =?us-ascii?Q?U878iaMwXrIZ/oP4peHmodAmHWTbQ8xwuZcNM7wTJyiBoPnT/idSN5uoXo2f?=
 =?us-ascii?Q?NJHPrGB8rMUIygM6jw9vQ0KtmPP8iDEip5so34nqIYUTeQoA2qV9SSBDqfdq?=
 =?us-ascii?Q?e7G1qRsJZp9X9yeiOBp0vn/nbrqhMt5XznvbpED+YvGsLhHc+7tDwETbIg63?=
 =?us-ascii?Q?CH9KTCvyafhBJpKLZi+gXy1YDXutZVzxYJXQnETN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a1a1e8-6ebf-4673-4905-08dda4490632
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2025 15:52:49.9711
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9jGxWz2AX9UMWuwpasqje8lfI0Jb13Uz+OoIaep3WdzndD8DeVS1xTBJJWe/AoTicDkPvLtLV0/J08d5xC3J/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB5866
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 15:53:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218053

Adding tag to SRC_URI should be done only on recipe upgrade.
Reason is that build will fail if shallow tarball is generated before this =
change as it does not contain the tag.
If we want to add tags to all recipes which are missing it. bitbake needs t=
o be adapted to add tag names to filename to distinguish old and new shallo=
w tarballs.

Peter


> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Ross Burton via
> lists.openembedded.org
> Sent: Thursday, June 5, 2025 17:35
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 01/16] libmodulemd: put version in recipe filen=
ame
>=20
> A recipe that fetches from git but is otherwise a released version
> should not be using _git.bb recipe names.
>=20
> Put the version in the filename, and drop the explicit PV, and set the
> tag name in the SRC_URI to verify the SHA.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../libmodulemd/{libmodulemd_git.bb =3D> libmodulemd_2.15.1.bb}  | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>  rename meta/recipes-devtools/libmodulemd/{libmodulemd_git.bb =3D>
> libmodulemd_2.15.1.bb} (95%)
>=20
> diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/=
recipes-
> devtools/libmodulemd/libmodulemd_2.15.1.bb
> similarity index 95%
> rename from meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
> rename to meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb
> index 0c730329230..10aa6c543c3 100644
> --- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
> +++ b/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb
> @@ -4,9 +4,8 @@ DESCRIPTION =3D "${SUMMARY}"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D25a3927bff3ee4f5b21bcb0ed3fcd6bb"
>=20
> -SRC_URI =3D "git://github.com/fedora-
> modularity/libmodulemd;protocol=3Dhttps;branch=3Dmain"
> +SRC_URI =3D "git://github.com/fedora-
> modularity/libmodulemd;protocol=3Dhttps;branch=3Dmain;tag=3D${PV}"
>=20
> -PV =3D "2.15.1"
>  SRCREV =3D "e7f179eeeb6eee1403f090fc43a3c80bb08b5bfd"
>=20
>  S =3D "${WORKDIR}/git"
> --
> 2.43.0


