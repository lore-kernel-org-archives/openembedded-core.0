Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3B5C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 08:49:41 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.58])
 by mx.groups.io with SMTP id smtpd.web11.31707.1702457375987577445
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 00:49:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ssLqwF6h;
 spf=pass (domain: siemens.com, ip: 40.107.105.58, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jXzA4feNXHJnSqFOWzHBCDrfsnE+hqJ+t7K47gQZmpvNj88iIrzFnrnjgZwqHhIvL4O7LwBN0qzkCjCgkybuJbz/m5Jte67/5Ypbop8ETKM00C1lpBuszmxf1jCaHAyJtUj5/eD3ps7TJiZTxTR1ALl/cLVii0EvkVBcqziViVMllx2Anmp6L70SG+ebBD7EMfijnE6/g3a3OIrBi5ch5Ni29zr3EWrEU6ghW1fi2xV93EjuG3kPnh9KLw7uI52etc8NFfEzdAsQXcD5xfBL9XhKm8dzThmwXtqKQB5Pd9lN9FZlwwFDPF+DXMZJ4eNgeBGF+ik9RfiszBfFQrKRYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYjgVhFGMhteZcqPRtNcWsFD5akozDvO5UUHke8v0XQ=;
 b=HRLiF3LKpnZ0cDLp3RHV6NhJ72drVfClTqWoza4+y//9dMtKddIwX4xXeNeVPJXeO/JDL9Wwlx1io7cHQf3E1HPM8f/ciU8Cln9W5VA5pMO/UTS7oF+0jHtxLW/14VLtzlMgAimcHW5JBtntv6iRy9GXQfER7wenKxeo28pFAvI4me0h/b+42fH1xJtekdkdpVwkhcynobITTDVWog3CFM+TK0BWd9jpxm/HkbNkpSwLMSA5yn4NmVmWX2oSeSEizg+AfwjnwQ1fCp5UpChTzCK+RQHTpc4zkjvw4iXTbWVF3vlFM52ZunM8LYRXLiV6Vg6blytRCIBGn5RvRa9jRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYjgVhFGMhteZcqPRtNcWsFD5akozDvO5UUHke8v0XQ=;
 b=ssLqwF6hSwxIr2kHFB2nOaGXK8thvsYq8Nd8gakmiLQOk7kj7+mRd4ORPPTxyetCp/kLbea0sVt+xS4lgi4iAc8Hmy1cen+SNDYP+v2xMWsLbkFpchmOcPv8OhNPlEdcwvRH4SyLh64nd46rLKq5Wdrd3zDuAjjyQqOGoSrJG5Lkni0dMHbvrg3jxnvqMztvrqZWsmiWH4LUq4Np92d3Lp02ilrjBuOVSfbiJMLsB8acKrX+iKUByzoOvLFvg0mQrMEYriAt9DV33yNWxJfjPpIK4fTaUdRsGY1wL6vdqt99wjAFQMjcLnt6onfKDxsUAaeAUIu1nbWCjNnBSF/0nA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS8PR10MB7304.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:614::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 08:49:32 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::238a:d0f9:cdcb:d066]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::238a:d0f9:cdcb:d066%3]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 08:49:32 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "Lizhi.Xu@windriver.com" <Lizhi.Xu@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "anca.mihalache@windriver.com" <anca.mihalache@windriver.com>
Subject: RE: [PATCH] [OE-Core] tzdata: only the timezone subpackage
 tzdata-core is retained
Thread-Topic: [PATCH] [OE-Core] tzdata: only the timezone subpackage
 tzdata-core is retained
Thread-Index: AQHaK+OtjYTY9LkqzUmxxKYlTJxtkLCm6GXg
Date: Wed, 13 Dec 2023 08:49:32 +0000
Message-ID: 
 <AS1PR10MB569788ED46F7A4B4B18DDE5FFD8DA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20231211033927.1042557-1-lizhi.xu@windriver.com>
In-Reply-To: <20231211033927.1042557-1-lizhi.xu@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=839a768d-d9ee-4d13-84bd-bf6d573e6a71;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-12-13T08:40:55Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS8PR10MB7304:EE_
x-ms-office365-filtering-correlation-id: 397fe58c-9e38-47df-9e5d-08dbfbb86d0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 w8Aa+6rtKavP5yzNcuOYVieX9I//3BnSSTL94zq0DVXA+N7ou19sF3IoroIsaVVYQWL1aN+HgOQLNqNiMGp0lI0JIb3qzqlK2T++neTbf+HL05QqMuSEqLU2CzGYYYMiBIMhPVuOSxLDM3ggHZk8cpro+yJY01YfCwpWw2OA08ux8ASZRbwronfE394OXeTtT7BAFARxgpv9GDY2kbKwg6D70MW3XxZK9VWkSD4EkXoNHA2D0sJwBv10lZrQ8vorxvvW0Y890fg1zr/eF/LvXH9LU031Skh57r9ykMIP3DVeUk8oQvaoOU/3J9BP/bXyQSB2q10XzEYfW0BYNF8HYvDeN20g6z19N0+M+UUu1QAlv73QScfEanxbWua4G1YRaD+YMytgXp0yVoonQORtHO9TrWcoT8dYH9CgAKcc5bUnwCnjSYlvPkqxj3vBFWLJKCatR/KXxpJpqXVPvT1XwjTeTsbFFq+lG+zbZ1CUJEc7sEuxK+80IZHHiC70OHbw38rYeE9ZBXX2xg06Gqo5PvmRzec1NAkberxWAk03KsTspni5zV5D+BuVTnq+vk3yLJ87nNnVsQIVo/nr/3yznYFozvTG5PWCS211SlfEQ3e35/knYp9j1aZ0bmcMfXEY
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(346002)(396003)(136003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(55016003)(71200400001)(26005)(6506007)(7696005)(9686003)(33656002)(82960400001)(86362001)(38100700002)(38070700009)(5660300002)(4326008)(41300700001)(8676002)(8936002)(52536014)(53546011)(83380400001)(122000001)(316002)(66446008)(66476007)(64756008)(66556008)(76116006)(66946007)(2906002)(110136005)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?nHa8RyY8RBIjE62Rp9t1+nTdFjD3Yc1FjB1L8MazrQmjZ4wD4VIO0hCNrhlk?=
 =?us-ascii?Q?mAxzX14LLQyAvkP5crHPYod4rmZooH3CagHgR9xjLHrYPgi1A0ZpUR/Kb6Xb?=
 =?us-ascii?Q?Vv+ly4mvXJfGQzmj/iZajMaUGCHaA/1e2/Jy7U192yPh7VOyk5PHTQIO3R57?=
 =?us-ascii?Q?IX3bH6zL6zYRvHthq3dAEgIUlWd71V3DnkLG6wQfW5pGF/82kFlmSLpvHej0?=
 =?us-ascii?Q?9B4CvDocjqlqUuwGb7agYelTjvMhr9wyD3ONCnHFxnd/fs5+AbRKujVx92Iu?=
 =?us-ascii?Q?+CLAhAfIth96zZX+LWsHXBrQMFFsQUSituP3pzZWXpgLd/MP3LqQuP/xIl4q?=
 =?us-ascii?Q?L15HNRszAL4u2CEUgXp33GXF8Xh8SjaKEcAgschFOc+TFlv5KsCRRjp24Rjp?=
 =?us-ascii?Q?M9axGdalZgFEu40iz2XxyE30NbcelPPRQpPvEXMGCZjMO3T6ZrQPA+rqe9M5?=
 =?us-ascii?Q?Nk3ABbAv/05A6keX+EEhFirg0A1+akHt2RPVhFpCMdkJx02iEdDkVMcVmiJl?=
 =?us-ascii?Q?k49LH9YszBg6WcIquVFG8R67ZGZo4nmdeioMn6Z5AzpVq6w6i0RRWolvEbZZ?=
 =?us-ascii?Q?mmOdzQvWEAGuKnn4locJ/883jZeBMzcSeurw1/nYwDbIhyBUxXYbzk70rlji?=
 =?us-ascii?Q?eUoqBLMdmu6V6YPErMQzd+SWOuPafNKUKmIJg5uAgOV6ZpY63edDhiGfxcts?=
 =?us-ascii?Q?P8EviESpPqgUufFUEg7P4WYzEdssn/zp5XPp34ZzqFj8voP2GBJYJzTIzXEK?=
 =?us-ascii?Q?bKPZIzsOSvp2UX9KsRKTH0cUiDPBT5S5upLRq3W/X5KBOb6K7UnfgAA6OKOj?=
 =?us-ascii?Q?/Z7uDmflNz+7RRQm9Jku4jxRP3TuGcyw+BjeLgtyu7JNBgrnfg9OLLbEUL4C?=
 =?us-ascii?Q?v9BEq1tvwjpQfwcHzG1HB1f9KIlwWC2OfcRxnp90LkzCwhrj+b8LvSCEOYmL?=
 =?us-ascii?Q?9e6PoZRDbiv2NUuol38nwjHe/dHlI34iUSoWyBbZ9iPnyOOqFB0hdLmQzgei?=
 =?us-ascii?Q?cPclL7TYCXsaqPm7lX7AI/P+bY9jMFXRDrxcLxFlkvsNP6gmtEMZMJ2WhrMq?=
 =?us-ascii?Q?nZtAvlJpT5hMCFTWxf62huweZREjffLzT7mYhxFZoqPSydraYxFye+YmTzOC?=
 =?us-ascii?Q?rJJ6ia18n0N1vyZXDp6s7sdRF95ycfcnf6T7CFOT7mj6DfpQwD+UFIMlzKb6?=
 =?us-ascii?Q?pURzUTXhjiFDeNkvye9aHEslEpimTg6Zq/KVhLwt3/W5DgDpxu11p5+ZJsQc?=
 =?us-ascii?Q?YMAYe8P4L+tJwJdbBM3i5gKKE9YhzpwiovRkb+iRAyk+I/P14+3DhLdzuIHo?=
 =?us-ascii?Q?G4vC4LmaEtjqnUByJqq7MEb4E08NhoVfI/RygWxW+A+A41NgWaVDqtk1hYvM?=
 =?us-ascii?Q?vNfRmEeqP07O++h1P3dCSJvJq8VSNtIo/ElkP+oQjpNjd5n0+KK9e8j4v1nh?=
 =?us-ascii?Q?NCctIEU0lTSzQTgTe4ID2PeOzWGYigS0n/VvaJcRsJQ5+RGc7D/yKFclJxDz?=
 =?us-ascii?Q?TKRl8MoIfUHFLafdo6fDSChjOZ8vGKPt8VMByUQ+WWoDIV1sB+FQZ5qK6Yn3?=
 =?us-ascii?Q?08Mlv+PJXYSFdDYwLN9jGBy4x99CwDT//oze6Ma9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 397fe58c-9e38-47df-9e5d-08dbfbb86d0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 08:49:32.5074
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8V6cvhFEk0O0js8QNgqggENR6qaTe0t9LOU6MOMWTFVwhUvb+k+nvETjXDNo8iP2ouhllZDmMzx7r8c4bYWSdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7304
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 08:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192273

I don't think that this is a good idea.
Currently you have a possibility to add to your IMAGE_INSTALL either tzdata=
 (to install all data) or tzdata-core (to install minimal subset),
After this change, you can add tzdata or tzdata-core to install minimal sub=
set (these packages will be now equal) or dozens of packages to install all=
 without a good way to track changes in packages.

Also, this change would require analyzing all components in all layers whic=
h depend just on tzdata if their dependencies need to be adapted.

Much more reasonable is that you install tzdata-core in your images and let=
 the option to install all via just one package to the others.
Or alternatively change the depends to rrecommends and exclude the recommen=
dations in your images.
Or add RDEPENDS:${PN}:pn-tzdata =3D "tzdata-core" to your distro config.

Peter

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Xu, Lizhi via lists.openembedded.org
Sent: Monday, December 11, 2023 4:39
To: openembedded-core@lists.openembedded.org
Cc: anca.mihalache@windriver.com
Subject: [PATCH] [OE-Core] tzdata: only the timezone subpackage tzdata-core=
 is retained

> To reduce the size of rootfs, the subpackages contained in tzdata.bb will=
 now default to only retaining tzdata-core.
>
> tzdata.bb by default pulls in all possible timezone data packages which i=
ncreases size of the final root filesystem considerably.
> The customer would like to have extra timezones configurable so that only=
 tzdata-core is chosen by default and rest of the zones are optional.
>
> Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
> ---
>  meta/recipes-extended/timezone/tzdata.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-exte=
nded/timezone/tzdata.bb
> index dd1960ffa7..7b1d4fd460 100644
> --- a/meta/recipes-extended/timezone/tzdata.bb
> +++ b/meta/recipes-extended/timezone/tzdata.bb
> @@ -201,4 +201,4 @@ CONFFILES:tzdata-core =3D "${sysconfdir}/localtime ${=
sysconfdir}/timezone"
> =20
>  ALLOW_EMPTY:${PN} =3D "1"
> =20
> -RDEPENDS:${PN} =3D "${TZ_PACKAGES}"
> +RDEPENDS:${PN} =3D "tzdata-core"
> --
> 2.43.0


