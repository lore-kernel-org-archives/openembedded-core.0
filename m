Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 598B0C25B75
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 12:15:46 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.80])
 by mx.groups.io with SMTP id smtpd.web11.10129.1717157738302705086
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 May 2024 05:15:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=RHiCzkmz;
 spf=pass (domain: axis.com, ip: 40.107.6.80, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VMLPNGzs64JBk2Pqsh50PNbm2vqy26FL1+yTg2Z5X158X0jP6FFKljf98yHFaxKhbJbmYASRwPSKaMfkKmIUKDD9X/TwLahU/82Jqha4DUzucSX76uVOVoUlIYDH2PoOdbZvCa3TG+u8sWicog0ByFrTQRT19xqHy7rTxeNdp39wA4Rg+U8/UXIitm6DIFzqwVc1v1RUOveWIW1p+kjdoSM8+Bc6dtdm5pxEaPAedbRzjJtHvQbREPcdKlh9TKvNSsUlYzX/wcWmNt2elgS/mi3LZTg8Yu/5roS/WqS8cgsdlM1ffDkOHPlwmB2t3pprMPkLoO1Z4akVyI6JLHIQ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Zifify/ECHfMld95qEvnSv99SH5D0oGNwoAyTNaRiA=;
 b=L+tJFSVDYn1QSTXcF2diXmuJI/IxsOqjGdObo/LDnc/Z6r3f8ZnAZHsBLylq9FfLJkg/YfnarOtFSnDkXYpK3X0xd76WS7TryolanFO4ZxYGLnlD12pGTsnG9iyzGFvfmCCCuscESjQEBm8d4Fju8lCxROh3N+CN/tD3hld804spi4OCoyd4pF11XuOO0ISoJPhRbU0uDZ/4z3Sd91AGgdkuJJAbWXg3BdvC8KNRcLkwa7fvGUxjIgHZWIaDnHszsvtJSAQjRV88HzEaV4KBR3IVgW4b9ZbsLbGvOEZEuZ74Z/8fc6dk6j75WQX6vafBCwEWtgIKulm9dCvduue4jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Zifify/ECHfMld95qEvnSv99SH5D0oGNwoAyTNaRiA=;
 b=RHiCzkmz8Rh/gX5VCkA28q04FbQ91weJEQYOb1xyNBSFFcnei3AT2/HhNoH6SZGdg5x631fqfAtR3BZBFyxX4tshjqyKZCzdU7311gUFLD7qu0++Wo88z1cz46fQ2gt5kfVMnCGcoxN91414p3jTrnK8od82DUgXCDfmnTe+2x8=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU0PR02MB8831.eurprd02.prod.outlook.com (2603:10a6:10:410::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.23; Fri, 31 May
 2024 12:15:35 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.7633.021; Fri, 31 May 2024
 12:15:35 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"samuli.piippo@gmail.com" <samuli.piippo@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] base/bitbake.conf: use default assigment for
 UNPACKDIR
Thread-Topic: [OE-core] [PATCH] base/bitbake.conf: use default assigment for
 UNPACKDIR
Thread-Index: AQHas0U/yuWtaMCXV0+JmcKJ4qBTDbGxK+KAgAAQiYA=
Date: Fri, 31 May 2024 12:15:35 +0000
Message-ID: 
 <DB5PR02MB1021304C871E874C8DE7912D8EFFC2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240531102742.3550748-1-samuli.piippo@qt.io>
 <826f0ba9b922b70525d95e45f4f72f2f10b53e8c.camel@linuxfoundation.org>
In-Reply-To: 
 <826f0ba9b922b70525d95e45f4f72f2f10b53e8c.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU0PR02MB8831:EE_
x-ms-office365-filtering-correlation-id: 9c0453a3-f7df-42e0-5c57-08dc816b605f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?WU9LaUpCbytwa0FvdVRQUUdKYTRZS3I4c1lEcnZ4aTM5KzJvbmJNOEQyMzBT?=
 =?utf-8?B?M09wOE9GWkR4a2hPNXdUT1BQeVdqb0hWcGhqYzdxSS9mOUh2YWV5VzFXbXdC?=
 =?utf-8?B?M0trS1B5VVg4dXdEK1VtYlMxaG5Dcm5rWFJidHVmSXdCM1F6VW9yMHdwWlBT?=
 =?utf-8?B?K0V2MHFoZEZQeUdwWnRBbFdCSkJFZ250ZDZ2RVo1QklFd3Y4aTc2OTdZWkl5?=
 =?utf-8?B?dDRyVmtsaTVicmVveDYyQkNraXZtUmozVWRPc1JsbWtCMVk2aURMM3BHdGlX?=
 =?utf-8?B?cWhMNUl2U2l5YVlYQjNBNC9PSjNxUkRuRnY3UWF1dUFZbXRyNkZyNGMyUHRS?=
 =?utf-8?B?dmE1Q3dQQ3o2dFV2dHc2d0tMZHNQa29rSWpya2xDN2ovN2tDemFtODFweVln?=
 =?utf-8?B?OUx0Ti9UdE96UzRuMnVVdkYwbndRaDZEeXoxczZCNSswVUhySEMySG1tNGdq?=
 =?utf-8?B?eHhSZDVkUHdRV0w0MGxkVnIzSUxuNllveTRhRkhHMHhkK01aUWFIaWRhZWsz?=
 =?utf-8?B?ZjhsdGFKZHZ4SmtUL3RMdUNNemt3RXZyOE90Um96aUJ5akVHVUNwNjBDVFdT?=
 =?utf-8?B?THkvR0dXcUx2R1JNaGdLQjByQjFxSGJhMmNycUhIdU40NmJBanNDVWhhaDJR?=
 =?utf-8?B?Qkk1OWs0N2FLckhaZ3V1dnQ1ZHBIdkx4VUJOdzBIK2E5dUk5VE5taGNac3p3?=
 =?utf-8?B?SHJ1aU91ZklFczhOeSszdlhTSFJrQ1djZEZkdHBPajFOcVB4dVdXdkRyRmoz?=
 =?utf-8?B?d3cwWTdIWkJreU9obkw4dWFyWDFYdGdLQXRDb2ZodmwzOXU0ejNTRlVUUmhi?=
 =?utf-8?B?ZDVCQllPREJiWUJvakNTTVh1Smw5RGF3UnNHZ2M0aVpIMXRwYU54N200TXRS?=
 =?utf-8?B?cGs3R3cvTWh5QXFHOWRYcXovRVVqRFRDbVoxUVdPUnQ1KzVKTjVWNU52a3pv?=
 =?utf-8?B?VXY3djJBV3JIZGl6R0Jkb3Myby8wRzdMYUFSbzdrc29zOUZ5aHJiSTFBYjM3?=
 =?utf-8?B?Zm9jN253eFkrZzBRcFhoQWxEdmRNQ0RLSUVIV05xSUVXU0MwMXJJMzhsQ0ht?=
 =?utf-8?B?Nk1RRjgxK3doeVJKa2pjTEsxWlh5V092eXJtNnpOT2NKRVlWQWVkdmhGckxJ?=
 =?utf-8?B?M1JCOHM4WkxEbWhmMGFiTWx1Nk13b2pjalBxSlAwWThLMzBtOVlGU095cGMv?=
 =?utf-8?B?ZVRBYUNHdzdOS0Rsdk5ZclBmVk1WT1kyOGdxRVYyYUt5bE1iRlJCLy85ZjhI?=
 =?utf-8?B?UFg2NHg5NUx6MHREeVptUkVIbGUwYkxVZldWZUFOUFNDQVFSUGprTVhZL1Qr?=
 =?utf-8?B?YWdKTEl6N21PVGp4dVFhaHlrWm1qOXk4Y2RpaUYrcmthZURER3NqZFduTUti?=
 =?utf-8?B?eStRaUx1dmNwSFY3N0Vnc3Y1NHdtYlhaRVFJYmJIZm1BbmhNc25XeHcwVkwv?=
 =?utf-8?B?MS9RZ0YvZEpubFliK2s1T04zcWNZTUk0cU5zRkFSNzN2NVU2dE9Ya1p4cDJG?=
 =?utf-8?B?dlJHOTV6clBjUFV5OUUvMElrQU9uQytPQkRPN0ppdi9LNnBUaFZ6S3BYeFNY?=
 =?utf-8?B?bEM4dU9GQnJRa2h6Y1VxeDR6Qmw5bmdiczcrWVhJVWZaOGRJb2lRMmhKSmY1?=
 =?utf-8?B?emx2c1pIbTBoZG02WHVCQ28rNkgxSEloMVBoT2k4YXJVNFR0RStMeUh4TElq?=
 =?utf-8?B?TUk5bzhnTE8wekdFZ1NWRE5xMG1SL0kyRlB1bXY0R1pTRjNNYzM4S2xIOHE0?=
 =?utf-8?B?NlNOWkQzZGNGRlhnU3NpRHJMb0NuejlEWEIyZXN3MDFxWkE4RmpwTm1YM3Qy?=
 =?utf-8?B?eUlUcDdhWFRZdjdBMkg4dz09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UFBGOXd3em5xM2RpRUNPSG1wQlZtZUF5TEIzMWdpWnFkRXhZR0xEWkFjUmJF?=
 =?utf-8?B?WWd2S1RnRlA1SVg5SzVpWHlxQy9aNnBhOGdqVEpzMzF5RlBSZElPZEFqT3ZM?=
 =?utf-8?B?aUc5Ym9hSzZlNitsN0ZQRTRCYXpIQnM0STE0S0JWNlhzM0t0Mzd1WllOaXVF?=
 =?utf-8?B?ZVlUSEN4VWpOdzZNT0RlaGRacmVzMloxZXVHc21RTmIzN1dXWE4ydVV0b0hn?=
 =?utf-8?B?NXJkMXA0TGpPY2RkdUZmamxaTC8xOS9hellWc0xPN1hVeGg2WXJCaGhIcFhq?=
 =?utf-8?B?cHNsaFhaQTRWV1c4U3cvdlJlVG9QOGFBbTdGNWVaSFNBRkVldEFHNlc2dU5s?=
 =?utf-8?B?eTZuTXZGLzZDL0tQTmo0MnlicTJtWDZZTTRodUdleGIySzMzVW8zU1NvVmZv?=
 =?utf-8?B?T3Yxc2ZhbDFCU255dmMrYXZ6aEFTUC9Sa2g5anA4bzRnazBEVUJsSms2SE5V?=
 =?utf-8?B?SlBNN1c2SlZxMmVDTWJzYWNvMjFNR2VybFhpYVExdWNKNUg1TWpJakhDdmxJ?=
 =?utf-8?B?N1E1c3cxcG9FY2xtSFBqZnZ2bVpqNnQ2R1MwckNTN3lqS3dCdUF4V3hvUUlD?=
 =?utf-8?B?WW1HaGVLOGRJYUl0cXNTYzhUbC9qL2Y2ZmNCaUNteWlhQlR4WTQyZzdkTlBQ?=
 =?utf-8?B?UVpld3hnRW5OS2dWc3loZURIcU8wclhHYjMzcVlabk80TjhWMHNjMWRLK24y?=
 =?utf-8?B?cm95RUJDdVVyS09aVkk1Tnk0NTRLVFJVeW95SGFjTnNiRWtKQXJZNGllVEVi?=
 =?utf-8?B?T1dPenpGSXNLR2VWZ1orTWQzTjAzLzJqb0VWMGwzUmVDempCVjdFMnRxU0pk?=
 =?utf-8?B?cVhQNWYraiszK2JqekNvVHQ3OGdrUTNWNUtPSkI4SmlEcmsxb0s1d3lrR2xy?=
 =?utf-8?B?UHozV2tuNklFclF1UzQrcFVFNWtCanlhWmNPRlhOV2NXMGJJR1hBK0VjckhX?=
 =?utf-8?B?UUVHMXl3OWttV3VHZzM2WkxxR1N5ZUR4NDZpZmVJQ3JCbHR4ekFyYW5GRnZz?=
 =?utf-8?B?dUlyU1l1anhjeUIvVExZT0JiTFgzMktlYXVpaXVTZDljQWcrWUJmNEY3dmVO?=
 =?utf-8?B?YmJoc2p3K0hPWGN5QXhDZGp5U1dDaWtLbjg2ZStaZkRoVURlNnEzaTJ3Z3VZ?=
 =?utf-8?B?bUJ0bitVK2NjTlErZlcwUTBNdm96djlkVWFNTVdhQWluVCtpaWJrY2FLZkF0?=
 =?utf-8?B?MFdZZ3lXeUlzR29wbXdoNjd4ajV1allKcEJrcXpZeTE0QUZhL0lUSGtORXVT?=
 =?utf-8?B?T2toV3EyYUlKK1pPRThJZWhqREJyUmV3WDZ1Ykk0VVp0L0RIb1B5SXBESDNz?=
 =?utf-8?B?QUg3VFN1SzBWdm52MDNveWgrNmE4ZkNPVFZiazFWMVpRalp2TldNUWlDWjg4?=
 =?utf-8?B?YW05TG1vTisrUVdsNHpsUDBtZnVOOTh2Y0QvbWdvWk1kMDBLRk05NDBqNGJL?=
 =?utf-8?B?WE44MWtlMFZ3NmJDRmpyK2l1dUZMeEo3SUxOdGIvSFRDU0RWWjU4RjUwaTcw?=
 =?utf-8?B?TTBZd2ZrVlFwZzMrTms1VjF5UmxUUUR1N0lva3FoR0dEWFJIWmRldFVtaW9C?=
 =?utf-8?B?SnZ4amhpQmo4UWRRVG5iVzdXSkdlRnZlSUNOb1dTZEprRmV0WDJ3ME9rNWNo?=
 =?utf-8?B?bERJcm9WMFZZNklqMW5sMldOeFVEck9Ld25NS2F4OVBiVlozdmkwK1hLWGlq?=
 =?utf-8?B?SFdoM1J4ejNnenJQeHNqSFludVRWdVBUVmlIVnNzSWluSUx0OFBKMElkekJJ?=
 =?utf-8?B?Q3A1c1A2c1FNMGQ5aGdqcG9HTlRpa1Q1VlhzUFRSYlQ5bWVTbDEvaFE3aEpS?=
 =?utf-8?B?NUNYSnVkZk9jUDI5Qmt5dHh5QWlXWDh2dFhVSGloOHIyUFhaVTQ3aVVqSzNZ?=
 =?utf-8?B?V2JsVUJWMk9HaGQ3aHFINjBFQjJPTk0ybXZaRGZpNGJyZjhVL21FNG1VSm1n?=
 =?utf-8?B?Mm9uSUJtVTNISDNrOWtQUFdZVUE1SllBZEVGNWVicExra1FmelZxUkFDS29O?=
 =?utf-8?B?U2pVMXozSzZLSVpMQTdsaysxUmJ2bEJ4LzN6QXk3VGI4ZzRLN1Fjci9pL05S?=
 =?utf-8?B?aEx4YnVDWFpHc2pyUHdFeWExanBBZ2c1aTZ3NDhxNkZ6YjJaL3oxNWtrYUxL?=
 =?utf-8?Q?Us6c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0453a3-f7df-42e0-5c57-08dc816b605f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2024 12:15:35.7683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhFm622ddtW2SAb2tEaPQO+vMJKoozMLjA/f6Vta9lZvocNMGVFfCbd7mVRSubgU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8831
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 12:15:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200069

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgUmljaGFyZCBQdXJkaWUNCj4gU2VudDogZGVuIDMxIG1haiAy
MDI0IDEyOjU3DQo+IFRvOiBzYW11bGkucGlpcHBvQGdtYWlsLmNvbTsgb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRD
SF0gYmFzZS9iaXRiYWtlLmNvbmY6IHVzZSBkZWZhdWx0IGFzc2lnbWVudCBmb3IgVU5QQUNLRElS
DQo+IA0KPiBPbiBGcmksIDIwMjQtMDUtMzEgYXQgMTA6MjcgKzAwMDAsIFNhbXVsaSBQaWlwcG8g
dmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+ID4gVGhpcyBsZXRzIHJlY2lwZXMg
aW4gb3RoZXIgbGF5ZXJzIGFkZCB3ZWFrIGRlZmF1bHQgYXNzaWdubWVudCBhcw0KPiA+IMKgIFVO
UEFDS0RJUiA/Pz0gIiR7V09SS0RJUn0iDQo+ID4gd2hpY2ggYWxsb3dzIHRoZSByZWNpcGVzIHRv
IHdvcmsgYWxzbyB3aXRoIG9sZGVyIFlvY3RvIHJlbGVhc2VzDQo+ID4gd2l0aG91dCBvdmVycmlk
aW5nIHRoZSBkZWZhdWx0IHZhbHVlIHVzZWQgaW4gc3R5aGVhZC4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFNhbXVsaSBQaWlwcG8gPHNhbXVsaS5waWlwcG9AcXQuaW8+DQo+ID4gLS0tDQo+ID4g
wqBtZXRhL2NvbmYvYml0YmFrZS5jb25mIHwgMiArLQ0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBJJ20gZ2V0dGluZyBhIGJpdCBmcnVz
dHJhdGVkIHdpdGggdGhlIHJlcXVlc3RzIHRvIG1ha2UgY2hhbmdlcyB0byBjb3JlDQo+IHRvIG1h
a2UgaXQgZWFzaWVyIGZvciBwZW9wbGUgdG8gd3JpdGUgbGF5ZXJzIHdoaWNoICJ3b3JrIiB3aXRo
IGFsbA0KPiB2ZXJzaW9ucyBvZiB0aGUgcHJvamVjdC4gVGhhdCBpc24ndCBzb21ldGhpbmcgd2Un
dmUgZXZlciBjb21taXR0ZWQgdG8NCj4gb3IgZW5jb3VyYWdlLCBxdWl0ZSB0aGUgb3Bwb3NpdGUu
DQo+IA0KPiBUaGVyZSBpc24ndCBhbnkgYW5hbHlzaXMgb2Ygd2hhdCBvdGhlciBzaWRlIGVmZmVj
dHMgdGhpcyBtYXkgaGF2ZSwgb3INCj4gd2hldGhlciBpdCBpcyBhY3R1YWxseSB0aGUgcmlnaHQg
ZGVjaXNpb24gZm9yIHRoZSB2YXJpYWJsZSBnb2luZw0KPiBmb3J3YXJkLCB0aGUgY2hhbmdlIGlz
IGVudGlyZWx5IHJldHJvc3BlY3RpdmUgbG9va2luZyBhbmQgSSdtIG5vdCBrZWVuDQo+IHRvIGV2
YWx1YXRlIGNoYW5nZXMgdGhhdCB3YXkuDQoNCkFjdHVhbGx5LCBpcyB0aGVyZSBhbnkgcmVhc29u
IGl0IGlzIHVzaW5nICI/Pz0iIHJhdGhlciB0aGFuICI9Ij8gT3RoZXIgDQpzaW1pbGFyIHZhcmlh
YmxlcyBzdWNoIGFzIFdPUktESVIsIFMsIEIsIGV0YyBhbGwgdXNlID0gd2hlbiBzZXR0aW5nIA0K
dGhlbSBpbiBiaXRiYWtlLmNvbmYuDQoNCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KDQovL1Bl
dGVyDQoNCg==

