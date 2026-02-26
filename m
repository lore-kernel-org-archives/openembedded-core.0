Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2766FCE07B
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 13:17:10 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69773.1772111826526331611
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 05:17:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=CUhvuiEr;
 spf=pass (domain: siemens.com, ip: 52.101.84.21, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ptlxux0gEDGtvPdhjC6LpEKW7s6gckzuUIcojG+bG0nB8xFmHs0XN4qgbeM4b3QJiDcM+Q0BXL0jvH4CBcF9iefTEXe4IwXIgBxnBKCTWP4X+km2UXsF84ZLg2zJJC6SXreqaABjC9H2Qix4LcciUeOtmz8JvynF2/56gf2tsmK4WVp5vt1hpLp8wiqK+kPoGKGOSaqOFFxsQbIee69hTGHRqNnGZQe6vXbCO0w3hE/w4LOGTTm4TS0QmLZWo0yHEbcKIrtbF05JKWB8q+CeSnucaj4lypHe43CSLXmxtFDzWF0DapUsHA7SbqEev/+J9R2eMWZb+8Q/zX7ubSnqew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AkmnY8udxtpJROzhSBFke5wn6SAIYnHNtTgEaB7xaCk=;
 b=H0FFsmR1xBC8GjMTSfNA/zaIC38NgAtfqMBhM/sdh9rduaX8tLan0dWRZjftTsD4h9RV1G3gjkXHpc5gS2j8qcgmf5u0LPO6cTm4U+ZSww6kIQYuA1S+cKh/tRyLvXIekksWXMCswNrgS3aAKhg6fmm6Jq7s2uwb6kPNtd9I8YfcEmWVoDv/fPOgAQehv3bpOn8/8SGm6fTwOHp65/fz3Rc/WLdhaXCyntDIGXaMUfN8tNFiIGKnw3pIE8ZAHsT65laO7SqwPQfv8OEzWulPAuPhKh2jYbqKSD0+SoaLuw5nHcsPiDTYJVcdDv3uTATyFNVv2BLAnBUQ6ZXVCAgC8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkmnY8udxtpJROzhSBFke5wn6SAIYnHNtTgEaB7xaCk=;
 b=CUhvuiEratcgP/j71W1KMmpFTSwDwUSZn6ctZT351YUtVzYJPFBpAgPRSRkLAsdGCRrc1PiUSufd9PtrJLaTxX+Y0EMGKFEPGHJMF02O1efbFmCzqGfQ5QmjChoSBkmWwVR+OgVI0S0GvilrrsDy5LGiOa1hT99nPV+ud6M37BSRm1C/cdDNzr6p9QI3pjAI3TvdFMyOkrWOUD38lqrbfA5N3ETlNaFP5K3VAYG42MNzVlkYQaM/i9VG8rTyepHh4iu8tcWAiI0NpJRKBiX/8XKJ3v3ovNvMuoYWgVsNa/JWcQiCOkowxsHuZq6z+Zr9/WNb1tfxnMa5ghgQUpuOhQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS8PR10MB6795.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5bb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 13:17:00 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 13:17:00 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "hetpat@cisco.com" <hetpat@cisco.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external@cisco.com" <xe-linux-external@cisco.com>,
	"vchavda@cisco.com" <vchavda@cisco.com>
Subject: RE: [OE-core] [PATCH v1] util-linux: Add vendor to CVE_PRODUCT to
 exclude false positives
Thread-Topic: [OE-core] [PATCH v1] util-linux: Add vendor to CVE_PRODUCT to
 exclude false positives
Thread-Index: AQHcpx8RVtAiNQ9ekkiAhFezM7taArWU9WFQ
Date: Thu, 26 Feb 2026 13:17:00 +0000
Message-ID: 
 <AS1PR10MB56971BBFD5AD6036EBE1190DFD72A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260226125415.53196-1-hetpat@cisco.com>
In-Reply-To: <20260226125415.53196-1-hetpat@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=b763e1a5-bcea-4339-bee8-39b40f643f9d;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-02-26T13:14:18Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS8PR10MB6795:EE_
x-ms-office365-filtering-correlation-id: 008d7668-6c0d-4e1e-c57d-08de75395347
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 DL0P0dZ4wlgFRUad3btlC1L3vs0QB2K6couw2ZWLRcWpc+u4GQ8AQBZ/6oaVDjUz/gpI2sGUONDQWCRJPOHGMyzFaYNK6P4NCHO0/KhrffGgGIVBWPdRYRR2WuS7/flJs5OEh/7ldGoPQ9veR02shsUE0IP/9CEVpsqEYmUZETbUjs2Y4LfvKYsQJFcyVSTDUjtPeJVuy4hgA145ZI+ACuTKXmcdBRSbs4+jHUv6HMo/vVUwbLpyqwYxdJEiZ1epIhT7Pg7jnpOklOXYWq2LwLFO1Oe57bf0x18NF2XylyOg+qUSYrae3h/XwjF0x8MO+lAsmjfJFNnlZP6q52OVXm2XySRinEomTkO1x+8CC/+bN8XhlMFYFPm3MkaCANUsjruT9hPdiLgaHFdRsmKqMKDbDXQMZBOmssrr0g9p9SYMpGo15J+UzBC9VJQ+G/6pJzHUCCV+TL1SNGn4JHI0PKiI6GaUSeicE+JXnldOpmVHJPBJBns1x4tf1D3v80kWOmjyQ6oEwaEL/ZI7HZVP6xxxwmM7p3sQRntBAEqIG/qEt3SiyppFD4ydqRIvIRlLqNkggSHu4ce2pvlzrNI5T/1NVOOhIrC66XsxNOHaAIkRdUv5hC4OorkFNmnUBipizoO9cBiByMz3i7us1VW+q63apK8PFcu0K9JHcIl83FJCNWPcgw74Ooidyj+t2kNRx39Y+bHrvIhfVXbe+rF6pNwNOOH1ydU3h3K1pquM5/+uDOwhZeW8A3IIHrfAzvmMZIK7BY3C8cX8ynqVqq0bSzeRmAS+yPRoFpZ+1rdz9FY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?KAn2nGxpad4Tget6gzzzMrKuokesG7HjDuLt8tr6E0gtfW6BcUSxNdmk+tHY?=
 =?us-ascii?Q?jahpf0OAI2D7xejjD/ISGvLs9cbXab2QxqE9nP8X7JmMm7etMQtZ5mRJBPx8?=
 =?us-ascii?Q?JjqbBjF3Y4adaApveHQr8sw/aYDyKf+Nn4mcPt+uhP2BK4P65D3/1hwCYTt5?=
 =?us-ascii?Q?37e8Vu2+QsS9swgAe+RDN5p+YNtBcPIJ2CUH5ZUeZSKzus9NAD3I+Ru+Hupf?=
 =?us-ascii?Q?TZo0gJtSKexOc5/3ryPI8gXYpScyJ4KLHBdrRJ79cJ5rM7gADuaLb9dtCG0C?=
 =?us-ascii?Q?LMu0hJzvfvqvnr1gv6moYeLEUUAX+9jVS+Zz4QJcpvusmyl2wFk27NveMqAw?=
 =?us-ascii?Q?Wie3xzGfcclkUsakfb98ahUci9w3HWKoLW4rzguWpg13hqn50hHXQ46wZNz/?=
 =?us-ascii?Q?rSJIA7OGUIgojp65bg1Ls8idjM/bjWK4musnt9uvtOjDPsgW0BpucnpIdAk1?=
 =?us-ascii?Q?9FYMVFxbWrq8ibqkWDD5ttT3UvHmnMcyrcz+PF6tTyT1HQ5vRxR17nZ2okOB?=
 =?us-ascii?Q?dC2S+XvltSqWd+N3caSAKL/K/X4taUF9AnZRQk/Y1VDAs7pOmWLeHpUTGDoL?=
 =?us-ascii?Q?ZAgnGxC9Zp4PoI/jYqSClshUFUO8kLIYSSTk2EyoYew0aZIYKzmkGPUt0I0+?=
 =?us-ascii?Q?9ZLS7hBtSQ7NcUsp6V3fNlDlVbkPv+kNZLRrDAHhbP8oPkb5mGJqMwqprsjo?=
 =?us-ascii?Q?mZWKv8UL7b2tsFd/CpHdeOUnlOm9aTVPrgFJxCKg1JsU5wMDccOB+JuepS2m?=
 =?us-ascii?Q?jN3ZvQ/h/04F29huMf2WnsmjRTIihzXzXms+/Jk70HkbxN8o6N6pgpFUad2x?=
 =?us-ascii?Q?KnumnlPGY+risEVseAcnkWal2LQlt3BulS3zP3wCxvboxC/24CqkpCGTgFQL?=
 =?us-ascii?Q?R52sSWXyPpmemvlcvwVvq/cH619piEqy9bwUyPIJsiHeDDkD3V2H0y6KXTbQ?=
 =?us-ascii?Q?oLKHmVaW3/QHy8wcNJwD94gb6TE4BdwCxSpljE6h+v4MuQepg/KvRilOhEy9?=
 =?us-ascii?Q?GWGohYaPrUmRwiWstTyeSlsT/LVRl4c/rLrWYqu9Djtkv8Y3mmvlxDb4trwN?=
 =?us-ascii?Q?qdmPBvOokjT0KnSP+xnc7UD3sTsy9Wc53RuP3TL/J6qm+Ue7oCSFzYqedV65?=
 =?us-ascii?Q?9D4JByfrmFeOvwmVpl4oWwZgJts5nyleHcGI9uUkXHz22qb9okdgmiKYCn+9?=
 =?us-ascii?Q?/vIiDg45upM7q/f3/3s8Kt2c7Z7DXASboyFOkoH9Ku4ihh5LxBSwMT+4VPgd?=
 =?us-ascii?Q?MrvczMi7pPSsFYfxs8jsw2TRH2iRluj3B5R89774ZcQ1HhxTHlj4pfGAhxF1?=
 =?us-ascii?Q?6w3Jyb31NBEeU8FzBKovNs1+UzQh4cHDQwh2f9CVOLDxB5zLV+C/DTjbo973?=
 =?us-ascii?Q?PuPXDv1epU0b64wECtDGJz2+br8olVwEkeCLCHejxocH6e0qOnGue8LT5rsK?=
 =?us-ascii?Q?XLdZbFMcsyGjdDGs2bXqIHPx2dNBr9ZatpZAVcvLDzJI2l9tIJwwjeledNw9?=
 =?us-ascii?Q?LmSF3rILbhDWU8XF71HadcL6JsOTcCt/f6hmGNVIJ9RWaZevYDDIhQ5MNEti?=
 =?us-ascii?Q?66ZbH71DzMFMuhzbiQjr2qnj/m3SgkkUqbGA7grrrBlo3KvnI+dmXR+VexTT?=
 =?us-ascii?Q?lE7ln06kztq2/bojcLoq17hbdmFIFLH/GgqQ8PZfNcXhQeJRdAYoAtszwHzW?=
 =?us-ascii?Q?hmweK33NPgXy1/swovQ96z8KwgHnK/HZPrj3y+yT5HIczIzkoIumwmWuY6jL?=
 =?us-ascii?Q?EUzsdUvJrg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 008d7668-6c0d-4e1e-c57d-08de75395347
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 13:17:00.3360
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6AjNg7ToRp7VuwQU4AVDqbYN6KE3HNhT6VwNBWi+dgvHt0BG5RvUrwBJdEr1spk+6pILkNGzqy+frsw2wbjltg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6795
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 13:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232023



> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Het Patel via
> lists.openembedded.org
> Sent: Thursday, February 26, 2026 13:54
> To: openembedded-core@lists.openembedded.org
> Cc: xe-linux-external@cisco.com; vchavda@cisco.com
> Subject: [OE-core] [PATCH v1] util-linux: Add vendor to CVE_PRODUCT to
> exclude false positives
>=20
> From: Het Patel <hetpat@cisco.com>
>=20
> - Added the vendor to CVE_PRODUCT to prevent false positives.
>=20
> Signed-off-by: Het Patel <hetpat@cisco.com>
> ---
>  meta/recipes-core/util-linux/util-linux.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-
> linux/util-linux.inc
> index deb9bfd064..81fefa5afa 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -24,4 +24,4 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-
> linux/v${MAJOR_VERSION}/util-lin
>=20
>  SRC_URI[sha256sum] =3D
> "3330d873f0fceb5560b89a7dc14e4f3288bbd880e96903ed9b50ec2b5799e58b"
>=20
> -CVE_PRODUCT =3D "util-linux"
> +CVE_PRODUCT =3D "kernel:util-linux"

Which false positives are you trying to remove?
I think that all of these are correct and there are not false positives:

sqlite> select count(*), vendor, product from products where product like '=
%util-linux%' group by vendor, product;
29|andries_brouwer|util-linux
16|kernel|util-linux
56|linux|util-linux
1|util-linux_project|util-linux


