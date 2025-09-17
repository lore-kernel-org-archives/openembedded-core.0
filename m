Return-Path: <barne.carstensen@danfoss.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175ACCA0EE8
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 07:27:01 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.52])
 by mx.groups.io with SMTP id smtpd.web10.17034.1758094014295967432
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 00:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@danfoss.com header.s=selector1 header.b=f/UzJiVo;
 spf=pass (domain: danfoss.com, ip: 40.107.159.52, mailfrom: barne.carstensen@danfoss.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+bmZs8G/DwCb2Q82NeTvAhZUwk8uDLF1rvLwnarmsx2GqlLDxj7XQNA/pVgklLGOj909dz3T7eOsuE2iGHrumllPGGFm63sm13J5MS2B9AyWXh8AMnDSB47wUlbkSPV0MolsQwZZoYUEoOacczZPQ36kZ5MQa3mxPekzrRP22OTrLefcHcaBGS4jE0GsfX/BwuJ+knBWErAlD/qDlY8eA2HL6UBnJzDpaPQyoaz6rDfShYxf4gQa3KV6FDhHRxTmmAo4IZWZ718yM4JTfO+0yocjeYgyWM6LP85/K8QMhtL5B7Ci/VpEciiR0gzB5IqMIdIomoMQArgEihr3I3bwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S03zGH16yrmcL4T9yKOylAhQYmmFI+0HyXtgFdeQuNw=;
 b=rF7cyR2nSKu/ejKQDL1usaSpDv6lWtDrQ4tSu2r5XFf0Dx37MMLZRHaVKYViaeQwOgHufqrC1ek0OfsO+e0ZLl3Q3DBtnSwfG/UGuzsQCP8I1hdaWjqxkGEaTD+U06eD2Y07vWSwYw8ZN+CYBW2UWt19/cbCvaixjg+NmU6YVvEL+Q52hEgIyXlBksnupFqf4Xzw9qRTntyggtelt/kn2Fm5EkMQCEcWKExz5i6MCLZDGYhciLlut1gI18zr3h3/l6Dq4mHCiLVQ1p/qWt8TRtqOXRpQy0xix+d1m58Pk0Jx2D7QIL9muAQX1uJVhWfnAlL1Vy+5/ck3O79eLGq3tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=danfoss.com; dmarc=pass action=none header.from=danfoss.com;
 dkim=pass header.d=danfoss.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=danfoss.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S03zGH16yrmcL4T9yKOylAhQYmmFI+0HyXtgFdeQuNw=;
 b=f/UzJiVofFVuyTTiUwrQmkWkP6yfJkFSZ5tPTIOIU3wu4gg5qNAcH10ZmayfrsZFxoSWhHw7qfc9eKmZ1lgqd82hBwa1EVpUDjVRQ56ttHh3i6veF7++dogNHaiAXr05QhTLGIoBvlCZKjrmzD7LsplBu0Myk42zUnUw1NGwa36WxhluwzFxw+X/5Mpu0xaavaZJu7WimzEFHU04/RNQYf0cSpus+yUL7iLT8hiwbZVgG96jje3TSHniLt2DhP4Vqr5suBZ+KRpt3Veqrw/ARxSjLHbvRCrjXwbHia33mR++2aV0KI9MSpW1MK+hShLTkbo5cOlnxywLKgj8tyzXPQ==
Received: from DB9PR01MB7210.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:216::23) by AM7PPF5D466AF4D.eurprd01.prod.exchangelabs.com
 (2603:10a6:20f:fff1::793) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 07:26:49 +0000
Received: from DB9PR01MB7210.eurprd01.prod.exchangelabs.com
 ([fe80::67bf:897b:9f85:b32a]) by DB9PR01MB7210.eurprd01.prod.exchangelabs.com
 ([fe80::67bf:897b:9f85:b32a%5]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 07:26:49 +0000
From: Barne Carstensen <barne.carstensen@danfoss.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "randy.macleod@windriver.com"
	<randy.macleod@windriver.com>
Subject: RE: [OE-core] [PATCH] Fixes [YOCTO #15965]
Thread-Topic: [OE-core] [PATCH] Fixes [YOCTO #15965]
Thread-Index: AQHcJwT8jD4Qjy9jkEW2hSvUcVczgLSV0SdSgAEkEHA=
Date: Wed, 17 Sep 2025 07:26:49 +0000
Message-ID: 
 <DB9PR01MB721006FC2064A4FF2F7AA6288717A@DB9PR01MB7210.eurprd01.prod.exchangelabs.com>
References: <20250916122517.1965-1-barne.carstensen@danfoss.com>
 <1865C555FCF7D165.11775@lists.openembedded.org> <aMlo-hknGOEJqrGP@nuoska>
In-Reply-To: <aMlo-hknGOEJqrGP@nuoska>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8d6a82de-332f-43b8-a8a7-1928fd67507f_Enabled=True;MSIP_Label_8d6a82de-332f-43b8-a8a7-1928fd67507f_SiteId=097464b8-069c-453e-9254-c17ec707310d;MSIP_Label_8d6a82de-332f-43b8-a8a7-1928fd67507f_SetDate=2025-09-17T07:06:45.0000000Z;MSIP_Label_8d6a82de-332f-43b8-a8a7-1928fd67507f_Name=1.
 Business;MSIP_Label_8d6a82de-332f-43b8-a8a7-1928fd67507f_ContentBits=3;MSIP_Label_8d6a82de-332f-43b8-a8a7-1928fd67507f_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=danfoss.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR01MB7210:EE_|AM7PPF5D466AF4D:EE_
x-ms-office365-filtering-correlation-id: 66a53547-3983-4454-f5a8-08ddf5bb90b0
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-7?B?M0JoWG1hMnZsVE1GYWV6Ky0zenNJZGtYRWRmUSstZGxNa2x2M1ROcS85ekJv?=
 =?utf-7?B?YUd1TnNuRlorLWdQUTViem96ckFBRUV2MUtuZVBJOEIrLUpueFp4bEU4YTRx?=
 =?utf-7?B?cTFURC9xKy01TnpaZE5qbCstaFFmVistRmhER3FuTlc3cXcybWh3V3hqaW1F?=
 =?utf-7?B?aE03eFZ4T2VCaElzeWFqUHdWKy03bG1VblhoM1I5aFJUcGkrLWpydGVZNkNZ?=
 =?utf-7?B?bUw1eFVuYk1jeFFjWmI5ZnBNUkt6ZUZMcFVoR3hIMnI4bnpEdGZnbmp6dXZq?=
 =?utf-7?B?cC8ySk5hd0g3MS9nQnFDams0OWJLZ3lVQ2Y1dXlkN0xOeVpZTmp5VjlDejZo?=
 =?utf-7?B?RlBleDZuTUFHaystcHpRdFlIdnNMSlczTXJSVnNDUmlUZlpCRVIyYnVWZkRE?=
 =?utf-7?B?YmxuOUdsNUpqVFhWYUFibHhHNUN4VkxHeHpjMk40c2dwSWo1Y25vMWtDbXU0?=
 =?utf-7?B?REczLzhna0FFa0tMVjFhRXNsSldSdFdYRndubUttelVxQ3RYOW1RZ2R5UE9G?=
 =?utf-7?B?OGw5U2JQR1Nab1NNbmpMRDhQZCstSTVYamxzOC91QmFCSnRsRkhnMGNkODZv?=
 =?utf-7?B?NFFWYysteUdGUEc3TmNEYktRbC90NThuS3kwZ2p6U3d6UnBpZ05wOHNZRm9N?=
 =?utf-7?B?emcvZ2pjdHFKbi9iSUVSdlVNRHVFYmFkdFN2T0tkanVWTnc1a3N0OTVBelNM?=
 =?utf-7?B?QWMzbzFrUjV1bGZpSnlWdlZxci96VnJxZDY1eXQ0bnUvamhnUFRRVWNycmhx?=
 =?utf-7?B?Y0lSaVFJSEJPVlAzZEEyUDFPY2o0Q01Vd1dmMHZZclZ2US92MHpnTDdzUWdl?=
 =?utf-7?B?VXJmdHdvTEhvQzZFNGswbjBFckZBd2t6Y2hFbmNXZGp2ZFhwZThWaVR0TUxu?=
 =?utf-7?B?VHVwKy1IcUdQVGRkY01kWXBLSjRBQUdyWUFpa3dVMCstallHcXJBTlZDVVYv?=
 =?utf-7?B?Z0czVFhnTFpKRTluYnRnaUxmWHFONGtGdm56VW1lWXhOTmlzbTVhUXpjNEdr?=
 =?utf-7?B?S2R2N1h3SGUvdGR4ZG5Ka0RWWm9KNzFPNEhxczFERWNJd3BVekFUQXJmZXNV?=
 =?utf-7?B?VXo5b2FQOHdXOSstdnNUNGE1eE42VEpEVHNJa05tUVIzTlhRQjVmbUZjT2o=?=
 =?utf-7?B?ZCstYW1abERWODEyUkdhdUp0ZjNuSllxS01LTnhFSUJCSXRkWDN3WFFTWXR4?=
 =?utf-7?B?cVRrOVRIM1BXWmZSN1h5VlpFY1VnUXJkZXNRRDl6WTBHYTZTbEplSS94TnlW?=
 =?utf-7?B?YXlqb1FSMXBuYzE5RWYyUUdxM1k5RWZ0aHFiMXgxZ2JHMUdObjhPb0NPdDE1?=
 =?utf-7?B?dGpGWGFLM2NoRWVGdzN5YXR1bGhyN1pPT0xtSloxR2RtL2svYVBvMy81YUg1?=
 =?utf-7?B?amg2dDZERnpqVkZBYXhXREZpZklGVG84WDVIVUd1YjROOExpd29qZzYvMk9p?=
 =?utf-7?B?OHcyMS84Y0dIMGxGT3kwVWdNMC9DN2pxOGtXUDRUcSstcGQ0THN1cTZhMXFU?=
 =?utf-7?B?SC9CdW9CZWdaT2FkUS9qd1FQSmZSYVpldXlUTWNkMlpqbmFRMUV1QmlSUVhY?=
 =?utf-7?B?ejIxS3BtNGpCT2xvS1d1MXFmWHQxTVdXMGVWSTVpTWFZU0V1eDJPSUU4eVND?=
 =?utf-7?B?QjJIeG9LMklhREUrLXBMdlVocnJaV2JQSkprT3BCenpYZWFVSWNRQkhUQ0VJ?=
 =?utf-7?B?R1RROE9UeXhIaTJmaG9HOFhpSmJhem9HRmxRem1KcUhvNlZjTUVZOFB4WW02?=
 =?utf-7?B?OWhlRXAwVmRySkorLU9HQjkwT01WeEI2TjQrLTQycldWU3JFMWI4UC9LNXRm?=
 =?utf-7?B?VEdmMlBpTjl4dzYxRnpHVjBsYm5xMUlOTE8wT0ZxSFpPTk1Sb2VvVUpqdFB1?=
 =?utf-7?B?V3NZZDZCNndyWUc4bFBoalg1c2huNlB4cHpxczlpVzB5bzRENnR3WG9sKy13?=
 =?utf-7?B?NmIzdGNwaTF4TEJKR1A3L055aVNoNXVWNHFKVystekdDdytBRDAt?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR01MB7210.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-7?B?MVNlTDFySVNSL0c0TU1CZWN0TmI1M0JrT05iV2ZIbXRtT3g1MC9QcWJTdFZa?=
 =?utf-7?B?R2x5aGZQaUNnN3pPVnRhVFQvYTZuU1J4R1ArLWw0dGdBN3pBKy0va2hWYVNY?=
 =?utf-7?B?aXRFd0pwQ055MS84bkMzbVVBQTdYeSstMTZFZ3lHeFNMVk5TMHVhdEJxaVdz?=
 =?utf-7?B?RVlzTG52VFJzMkhpQ3NqL0RIYWc5NHp2VDc4R3hVNEorLXBtT3dhQ1p1b3Rt?=
 =?utf-7?B?cDU0c2NWTDBZcDI4cWcwbCstcUM2WXZUREcrLWJRc0pDSFVaRVFxakt0eE84?=
 =?utf-7?B?enVBVms5bFV6dEJsZlJncHZvalhYMGpNQXVGL0xwRnh0bHNGZzBpdW14VUZY?=
 =?utf-7?B?anlURnRyT1RTMFdNS0RFZ0pJRk14bTJ3WnV4a0xldUZxMFNmQWg1VmV2NjNB?=
 =?utf-7?B?MXVlcEovejFndUpzN3czZjVVVHN6WTlraVlHVnRLRVUzakhuT2xxWlpOTlpM?=
 =?utf-7?B?cjk5MVNVajBFWmliYm5IYmp2RUw0RkUrLVN5Q1Bjd1BQTlpnRTBraEZkZ2I=?=
 =?utf-7?B?NSstdTdRT3NxRjQwYmZQNDR3aExvVXZzR2tTQ0svaERMRlhVc0gyOHRISXNI?=
 =?utf-7?B?ZkhlZSstaystZmtVUFlCZnU1OGhpRystVGdSNHJWVVVCQ1A0MWdZbktSanFM?=
 =?utf-7?B?OTNYMDcydWNLY1NvU2EvdnU3YkVjMktZRTQ0b2JPYlRBOHhnaVlUNjZwc0lr?=
 =?utf-7?B?NXptL1pMWmpUVUsxL3FFZi9IRVZjbTE4UUpmS3huYTJHM2tvV0t1TDZSekJ4?=
 =?utf-7?B?T2EyYWpjbTJvN1FaM2pWelY3QzRPejhBUzdZRkJkNTB1bjNRRSstbSstUmNU?=
 =?utf-7?B?MkV4NjdSSDhKUXBURGRTdlppV1lhckdQN1p1YzFRZE1TNWp6ckJ5TEYwSEtT?=
 =?utf-7?B?eml3enZpSFBtaENTV0czYmtuVFdxcystSEdTcmJRZW9CYk1KYUlaUnRSekZm?=
 =?utf-7?B?UnFxVFZCVTRNTjdFb1c4M2FGb1ZvL1ZQa0lHeUV2Ry8yMGZPUGNSZzR2T3Bv?=
 =?utf-7?B?TVc2QjNWdkpUVystVCstcGlUQXF3dklhWC9qTG9CVHhXSUgvUTlIYWFOVTdI?=
 =?utf-7?B?dDR4dm9TOVgzMUQzTGRnTVBDb3RwTlNpZkZYM21RVVFvc2JqL1ZSZTNCU3lQ?=
 =?utf-7?B?ZVZnSlNGUHhFL1JXTHhwSGpQMXVhM1ZwdEpwWXYzMHdMKy11NW5SVjQ0Ky0=?=
 =?utf-7?B?cSstdGVLUkRmOU9ZQ3o4M0lrRldRNE9YME93TmxxdlRJL1VzQmV0ZUpEemJp?=
 =?utf-7?B?S2JFREgycHY5aHVrbFNHU3ZWWmhTZk1SRFNQZ1dWcmFCbVFiVDNnZnBNTXlF?=
 =?utf-7?B?QWQ4R3g0TVE5NWNhVUJkUTd1ZHRSQzRKRVA0L3BUeC9yVlhESGRmVDZWQjZM?=
 =?utf-7?B?SnMwR04ybWRrSG55bEorLXpHbXhYODY1ODM1Ky1vbVFKajhxSzJuOW5BbVMz?=
 =?utf-7?B?eHN5N21mSlZoaFdkdXBKNk9BekhaT3YwOVdjOGFFaFJ6OXdJMm1qQystYXM=?=
 =?utf-7?B?ZystL3B4MjFvM3dpOVA4TTgya3VLVUZ3ZkRRa0g1T28xU3NsMWhkZFZPbzgv?=
 =?utf-7?B?WDEydGJFempwTzJaSVZBei9rdkhWQ2lFeHpCbUkzRzM1enQwSHQ5T2tsNWZq?=
 =?utf-7?B?WmhGQ3I3NVRROTA0TDBzODd2WEduRldHKy1kTEdKcXd3d1ByTWFWYistemtY?=
 =?utf-7?B?ZGM5cm1IeHhWTnhZV0o5T2RQVkowU1JqcXg3ZlVwY1JYNystTC91ekkrLWJS?=
 =?utf-7?B?UmN3dVlQSEZFUzYzVjA1TmVNRmYyUjBqNWJDOGgyRURsYzVvVFlhYnJtWFp4?=
 =?utf-7?B?YzBJTndpdVRiN3krLVR3anlUUzM0OUJuN3Q2NE1EQTRoNDhzbERjUEloeUxy?=
 =?utf-7?B?Y2g5MXFiU2QzYk1iS01XNVZFWTBRKy1uV0gxdDljUkI1RWdieVJyb0M0M2hC?=
 =?utf-7?B?eEpGS1V3VUx1Zm5sa2QxV0lpWjZNTUxNQ0grLUpNWXg4VHhBRjBVeDFTMSst?=
 =?utf-7?B?aVVtTENycjhESWZGcGdER2ttWmgyOVp5MTJYeDlGS3RhLzZEWEhrdy93M2E=?=
 =?utf-7?B?Ky13aU92cDBZSjZubSstamlFd3VFWTdlTVJKTU1xUU5FVWhTM2Mva0NKNGw0?=
 =?utf-7?B?bDNVcUtIcWtsQTd1Vistd3lKZjcwRHdWNDNIRUNCNmptYUhpOVdLMlFHRlFB?=
 =?utf-7?B?Y3ZCemtSeGMyTEpaZXM0cjdueUNqWistdjdHQVIxVlMwRDMyc0RBdUE=?=
 =?utf-7?B?K0FEMEFQUS0=?=
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: danfoss.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR01MB7210.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a53547-3983-4454-f5a8-08ddf5bb90b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2025 07:26:49.1344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 097464b8-069c-453e-9254-c17ec707310d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GiG92Pbm6A+2GFzhOceM6qgBgzH8ubuN/zP83DBEX6QZKf9SgAllv8wqsEO0r+xUbG48xTqWxpLdzUPbUhQ/gjSO/rWUPQwJG5OwT/dFp2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPF5D466AF4D
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 07:27:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223583

Hello,

Okay sorry, was my first time sending a patch and in the manual (https://do=
cs.yoctoproject.org/contributor-guide/submit-changes.html+ACM-implement-and=
-commit-changes) was written to use that form. I am a bit in doubt, which b=
ranch should I use as reference? The target milestone of the bug is set to =
5.3

+AD4-Since the commits are bit scattered, these from master branch would be=
 needed if not already in the relevant branch:

+AD4-e5e8f2aa0a63d testexport.bbclass oe-test: capture all tests and data f=
rom all layers 05e97d5e6e24b oeqa context.py: use TEST+AF8-SUITES if set
+AD4-2d900c3061e12 oeqa/runtime: set self.runner and handle None

I cannot find these commits, but do you ask me to cherry pick these as well=
?
Thanks for the help and sorry again for the inconvenience. I will try to se=
nd the patch again with the right subject and reference branch +2D3eCg-

Barne


Classified as Business
-----Original Message-----
From: Mikko Rapeli +ADw-mikko.rapeli+AEA-linaro.org+AD4-
Sent: Dienstag, 16. September 2025 15:41
To: Barne Carstensen +ADw-barne.carstensen+AEA-danfoss.com+AD4AOw- openembe=
dded-core+AEA-lists.openembedded.org+ADs- randy.macleod+AEA-windriver.com
Subject: Re: +AFs-OE-core+AF0- +AFs-PATCH+AF0- Fixes +AFs-YOCTO +ACM-15965+=
AF0-

+AFs-You don't often get email from mikko.rapeli+AEA-linaro.org. Learn why =
this is important at https://aka.ms/LearnAboutSenderIdentification +AF0-

Hi,

On Tue, Sep 16, 2025 at 04:09:58PM +-0300, Mikko Rapeli via lists.openembed=
ded.org wrote:
+AD4- This is not for master branch and subject line should be something
+AD4- like +ACIAWw-branch name+AF0AWw-PATCH+AF0- testexport.bbclass: always=
 capture ignore files+ACI-
+AD4-
+AD4- On Tue, Sep 16, 2025 at 12:25:22PM +-0000, Barne Carstensen via lists=
.openembedded.org wrote:
+AD4- +AD4- Copy all the parselogs-ignores file so that they are always pac=
ked
+AD4- +AD4- into the testexport.tar.gz (even when testsuite parselog is not
+AD4- +AD4- selected)
+AD4- +AD4-
+AD4- +AD4- Signed-off-by: Barne Carstensen +ADw-barne.carstensen+AEA-danfo=
ss.com+AD4-
+AD4- +AD4- CC: randy.macleod+AEA-windriver.com
+AD4- +AD4- ---
+AD4- +AD4-  meta/classes-recipe/testexport.bbclass +AHw- 6 +-+-+-+-+-+-
+AD4- +AD4-  1 file changed, 6 insertions(+-)
+AD4- +AD4-
+AD4- +AD4- diff --git a/meta/classes-recipe/testexport.bbclass
+AD4- +AD4- b/meta/classes-recipe/testexport.bbclass
+AD4- +AD4- index 843d777e3b..2f473a8811 100644
+AD4- +AD4- --- a/meta/classes-recipe/testexport.bbclass
+AD4- +AD4- +-+-+- b/meta/classes-recipe/testexport.bbclass
+AD4- +AD4- +AEAAQA- -79,6 +-79,7 +AEAAQA- def testexport+AF8-main(d):
+AD4- +AD4-  def copy+AF8-needed+AF8-files(d, tc):
+AD4- +AD4-      import shutil
+AD4- +AD4-      import oe.path
+AD4- +AD4- +-    import glob
+AD4- +AD4-
+AD4- +AD4-      from oeqa.utils.package+AF8-manager import +AF8-get+AF8-js=
on+AF8-file
+AD4- +AD4-      from oeqa.core.utils.test import getSuiteCasesFiles +AEAAQ=
A- -120,6
+AD4- +AD4- +-121,11 +AEAAQA- def copy+AF8-needed+AF8-files(d, tc):
+AD4- +AD4-                      oe.path.copytree(src, dst)
+AD4- +AD4-                  else:
+AD4- +AD4-                      shutil.copy2(src, dst)
+AD4- +AD4- +-
+AD4- +AD4- +-    +ACM- Copy all parselogs-ignores files
+AD4- +AD4- +-    parselogs+AF8-ignores +AD0- glob.glob(os.path.join(coreba=
se+AF8-path, 'meta', 'lib', 'oeqa', 'runtime', 'cases', 'parselogs-ignores-=
+ACo-.txt'))
+AD4- +AD4- +-    for f in parselogs+AF8-ignores:
+AD4- +AD4- +-         shutil.copy2(f, cases+AF8-path)
+AD4-
+AD4- Master branch is quite different. There the tests and their data file=
s
+AD4- are now copied from all enabled layers, not just core.
+AD4- So I would rather port those fixes to relevant branches to avoid
+AD4- duplicating maitenance.

Since the commits are bit scattered, these from master branch would be need=
ed if not already in the relevant branch:

e5e8f2aa0a63d testexport.bbclass oe-test: capture all tests and data from a=
ll layers 05e97d5e6e24b oeqa context.py: use TEST+AF8-SUITES if set
2d900c3061e12 oeqa/runtime: set self.runner and handle None

Cheers,

-Mikko

