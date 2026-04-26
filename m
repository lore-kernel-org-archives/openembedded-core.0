Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D6CFF885E
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 19:17:35 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25653.1777231051295094714
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 12:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=UPTBcGfc;
 spf=pass (domain: siemens.com, ip: 52.101.84.67, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zHPg7OIqDl1oYeyKIBNw3+S0jwqJqsSO+wuSQISNvp4+f0XL2Mw7+FnQ6WhsyoNriqxJs5O1FmbqoC5APUU37dwpdmHK0UW2g/yuXXtwAeJRqdUwkXMPk6kML/+lQBnq1caMN8mN2L9V5wSJXWsG1+3UvzrKBQ4P+Qiql1lvEZR7BvPKMwD057A4Ou7BhSmN3bGR4ySaGFibFN7tGEpB2HLjnmAsDGm4HLGwF+UOg0tofq7LRI5JzVQbZ9f6quyvKzSAJPwzbSvVuWGeh14od3LIbW70TYuGZXZ3Y8pz33hrCGYTUDeEUDJPfYcF91buxcmSIjXAXkLIjr3jGtOgcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7ig2605ohYaGXRIkGxg4s3Cw8YRKTvOKHNZGslkEUM=;
 b=AU2TjJVYyuobe0vf3nrKFr8LBvMcMHVRpUaPLNlAwI3VRz92gmg67HhyhCSbTkFB/zgD4aeoJmFX0gqhwZ7QgzzjSuZZaan8Tw6rbP+EKRHi4e0YBVrcw/DRG3iStDI2+or33jeBAD6mGDiNUyJZN8O4bHDA+qtZ0WBhGj0+VQx1UCXWH+NmhkvZX13tT0Q3OC9Bmf/r3XHBBOi7UhTlc+/+sr1S2E98nI+OpZyGwE/fVEGv24bpCdceNET38wbtbJwGNujOzQWQ/m9juCRGvcmlsoLSBPA0/BwzxuZqWXIU2/wxVdQjz/fNsS0SyFhqEvMKOvoDpmukFL780rBsAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7ig2605ohYaGXRIkGxg4s3Cw8YRKTvOKHNZGslkEUM=;
 b=UPTBcGfcd4xxVpkjb78H8sZho3XWndHyq+zycLqHgVrbSgXWAyAJc8eFIGAAASeGD91x95cT0BB4kAi6cd7Df+UwUR6nh7iXhZKPOnBz91flOYeFYbZyHF/79t2pW/aOsCkrS6tL2bAPfZX/3eJfUKbDH1AjvYxBPVlbV+RTWRl4GUGOzUigeSqS9ZSI+1wExIVinHY5cLTXaoXlcqHlUehRiGWIt+aFJCA2alLZEpIRbcUvJiL2bKxIFy+ab8zb5I0ymO7cmH4hUXQ48AvYTETyW2GjGvKJHrESazUzRuhjQeSbi6QsVyfF/xEKT30snDIulYnuTBBotay54fQCqA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PA1PR10MB8730.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:440::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Sun, 26 Apr
 2026 19:17:26 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%5]) with mapi id 15.20.9818.023; Sun, 26 Apr 2026
 19:17:26 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Benjamin Robin <benjamin.robin@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH 1/6] sudo: set status of CVE-2025-64170 and CVE-2025-64517
Thread-Topic: [PATCH 1/6] sudo: set status of CVE-2025-64170 and
 CVE-2025-64517
Thread-Index: AQHc1a2c4nfU2PoDb0Gu4igJzr1G07XxtrJg
Date: Sun, 26 Apr 2026 19:17:26 +0000
Message-ID: 
 <AS1PR10MB56977CF6AB8F681734EAD75DFD292@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260426185025.13217-1-peter.marko@siemens.com>
In-Reply-To: <20260426185025.13217-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=289c6839-d623-434b-8c47-90956eb17144;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-04-26T19:15:21Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PA1PR10MB8730:EE_
x-ms-office365-filtering-correlation-id: edb459b7-c100-4153-5cbd-08dea3c873a0
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003|55112099003;
x-microsoft-antispam-message-info: 
 Z83xwLnDaFvRtZPxG8xBAIMyC8Lo/QiZRIJmJPBzPZ3sGW6sblrNZYr97TQeKjcP3sLO58xTKrga0p+RJSgRjk2Owt3ftHKFz3netUlHfgmiiiJTfNXOybP4Qh3kOy9plqwTh4KygIkHvJbCpzLX4yjafFCAHS9g/0Xy9f6zd5QJ5DVOJabLK/Egw1YGXz8T9qOjtOqgwpDk5OTN0Z3Y883ylxkMykvrgimnPIB6RlJxVR7ttNSk/RH/lRsZ+wtj72KjACFTs/GMLQaQpTEnBL3eMWPChCpHJXIwr8HmMAas0PzvY2SJl/z8uIO/IyqDsP+MLLcJfSVOBUdBqkfD32OqHZj6ofj4w4DeCCMRMoCxc1lI7zl6CApRcdwQOc4Y8mdvx+m5tuwOroD7BrM7foBhXVOebV/wOPpoPeCPbcR520CkClIJui6yvnBE/Bix/IELR8vWmE8kOA0YwbhXVF4M3OA3LapIxwhJOLvSeYaj83AcYNuCj987AqJ0muYi3muc26rln3LjdOZGvEKB4RFRZBNpQXqgxZmENBSBvLatnf9iRHUpLuvXvx7Yr6xa60v9SDBBlb6EJopsjSrPi707VZkerF8dTjTJJBQknGBbojIdznjKm/yGxizyq7U2TVa9C4kq1u2fo2Gp62fwOfmI1k8j0T3plzq/32uz6rYD2v6HAGyQyNKGwyA1u3UCMwOpF6CSaOiK6PBvz3S15e0IeJKMf1g4k/EfzLa4jusrOGQ2IsafNaZhdiLMcT617ka54Y6Ml0YC4qTAPuH+xCr49PhmyfESEuDZfkYnM5w=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?S3/Kt1ftCv+pqlFaGMq5W2ajLYHmZGBiZ0VZHR8/RkAMvB5zrIn/4raa9BRt?=
 =?us-ascii?Q?U9XIiYaX2o4Ni3+3dXXj1Y+667H6OXWsjRkogESALS5hzjlY8igKPOrEhmP4?=
 =?us-ascii?Q?fz6R2xDQrgVGdO8MuAmTi4ec8PvbZ1Pm+nsgZVJGWofnrNdCTZh19tvw8diL?=
 =?us-ascii?Q?00tTAWpRKfJyUY9zFIJKMFTsZ3d4L7zcqV4rE2Z16LWGcTY8mpIxkTAPz66e?=
 =?us-ascii?Q?uuep2ceoUPVXAZtDpuEMB2hzhR8gxpyP7RKUI9D2s/LQgfdv+FMNrqJUohMU?=
 =?us-ascii?Q?RMsiBXXuZ9xW/eUk1AskYenJH6MIoA0ziYWxEtPVIbdzkqX8WA1eCTyWSUP4?=
 =?us-ascii?Q?69i7mH7divrx3wfjpBeEz5xtFjVsBgqDlRLyB7d+/TrRLlAdzR+PnKF8sddT?=
 =?us-ascii?Q?irnx41w9RUWSI5QhRm3waBpY68GgjAsO0MwaAWXyCt0Hbh6l8jVus+gmrs79?=
 =?us-ascii?Q?Ltrm+j+gAyyNmPxJVvdKjhL6hSLoHJgSEG68deaBmwKmidwJ0wzH4oP7EQcG?=
 =?us-ascii?Q?KE7zQjWABzO+c+LnW1Sv5kwK1LADaWfR2hzdCCuhn6NjIFQuGXF1hMaeJts6?=
 =?us-ascii?Q?aNQtEUVxXuAfk9OO36LB25TnQNtBE7tmVgwVW3SR5gjA22Xvy7BBtI3m702l?=
 =?us-ascii?Q?9aA2T0dtUhBpS7ht4lRXfx12AsCUjxu2Q/f0hq83n19YF5p4e7FRAEiYCLPn?=
 =?us-ascii?Q?T8ckmmcK9d/b0xLmyErkRasIHw9EzMtIhjmOfsnGnJLJQxSbBK+h3zshw3Yv?=
 =?us-ascii?Q?Ym+aa8oHGH5s2usCuWs4W5k/9dChnfLPp6oNQYfU7q0pqzSCTpr9YQ+Td9OE?=
 =?us-ascii?Q?YxnfdKdHiUAerHDqAGfaL8wwQPHZ9E/fcUmzHzriaP5AgsQW3kHHof+PPbJK?=
 =?us-ascii?Q?DOvKXbwQqrHDidJR/B+K56nv2MSBI/Jtbytr2dAJAY/gx3vudagOk6GzVt+r?=
 =?us-ascii?Q?Kci/zWfs7ojVW4SMEUXij2tZxUtU6hbd7nd1mfbOVDIVft92kAdSLoP/svTI?=
 =?us-ascii?Q?0ydWh2MZ09USv016X/+tCUpBKqYFm4PNDZ/HmnA9rXYPRsqA6ztLK8Ju0/b4?=
 =?us-ascii?Q?p6tkaBHVbcpoCvVdNrAWQoZyT0PCzbvo5s4qSaqVtOWoY4y2xyy/kBeMb2a4?=
 =?us-ascii?Q?YMI1k5eDXOlqO8N/Jm2RTMay14sIBAPuEMbspHTi3x7trCIDLSgCaAzmv7TU?=
 =?us-ascii?Q?oKnma3VgFdl5O0lqPgein18zEgxzhpLUoXJ9lGdQu33TkeOwow+uvJrMOGeJ?=
 =?us-ascii?Q?Tpgpiz0tDMZTX/6QsJNdB8HiFsIHKoo9aUsa3iusHbpytTMpqmq32Q4/3Dbp?=
 =?us-ascii?Q?rvYsGOdeo2Xx0rpG8a0+OH2sReHBHuHmDJvq8sVXgxiU4I88erin2rtIu7JW?=
 =?us-ascii?Q?5T2kKF3HCpIc9es4nqjdRHPkCnu5AkfiKNC4eXn38R9y4xvOVpnIZBWeBX0y?=
 =?us-ascii?Q?SoSbJmewlivFeX/a222TQuX+/2JEXhxe8ykoLTp4lAGBHuZkJCIMmi8SaN7v?=
 =?us-ascii?Q?uWsAIUYSHLcoyaIcQRXP0/EscQKPPHi9w1s++eClNtKo9w93/97YasciGuEd?=
 =?us-ascii?Q?75G/OI19BqACDrF7O9vfsOIX32nJ08OYXd9Ard2V2Wd/AZwzkvFMExWzPQDg?=
 =?us-ascii?Q?Qu/7KfKyaafzq2Peg6Ll2jJANdT36QsfX7TgQAHpZplh0L9ibVqSrQ2kh9Zl?=
 =?us-ascii?Q?nKp/+UDx4Rl3RLwZwB73jEsoV6dSxs1AaRnf+awUtss46ILZ4ZXH1R2FHsg3?=
 =?us-ascii?Q?FOdl0A9KLQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: edb459b7-c100-4153-5cbd-08dea3c873a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2026 19:17:26.1682
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LsVqyJs3efoSqR36uL2mbXzluBKl566m9f3eoVItXnbVLAxU5KOOpMa22zoJzrqmWMfvlJHGRket4tzSCBzIgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8730
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 19:17:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235968



> -----Original Message-----
> From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Sent: Sunday, April 26, 2026 8:50 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [PATCH 1/6] sudo: set status of CVE-2025-64170 and CVE-2025-6451=
7
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> These CVEs are for sudo-rs, not sudo.
> It can be easily deducted from first word in NVD descripotion.
> Also cvelistV5 product is "sudo-re".
>=20
> It looks line that new version of sbom-cve-check matches product with
> startsWith instead of equals?

Benjamin, any idea about this topic?

>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-extended/sudo/sudo_1.9.17p2.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb b/meta/recipes-
> extended/sudo/sudo_1.9.17p2.bb
> index d6ee881f8c..12f81c5d4a 100644
> --- a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
> +++ b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
> @@ -60,3 +60,6 @@ RDEPENDS:${PN} +=3D "${SUDO_PACKAGES}"
>=20
>  FILES:${PN}-sudo =3D "${bindir}/sudo ${bindir}/sudoedit"
>  FILES:${PN}-lib =3D "${localstatedir} ${libexecdir} ${sysconfdir} ${libd=
ir}
> ${nonarch_libdir}"
> +
> +CVE_STATUS[CVE-2025-64170] =3D "cpe-incorrect: this CVE is for sudo-rs"
> +CVE_STATUS[CVE-2025-64517] =3D "cpe-incorrect: this CVE is for sudo-rs"

