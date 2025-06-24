Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1071C77B7F
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 22:43:15 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.23])
 by mx.groups.io with SMTP id smtpd.web11.2007.1750804987266210549
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 15:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Nnl//JGL;
 spf=pass (domain: axis.com, ip: 52.101.65.23, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RFf4n+6JkwbCypiQ0ugeDOukFDlO+GFki/U9iBAPWZfH7aosZjpkLC+uG2isnfI8EiIwuXOflRUbxEcmg6TMfcr8n2jON73sOrJRUJNBfJhN3vPg15ZsG2rDiZ+rajebTPCq1lvBdcmokjSj3TBPNJyaOVwiO1TMBGEEyTEE2zTbte3MN6OU8gY8qxByQe/MyhXnCp60VCdrJUGMyOngMTTgaEbFU59b7UJoiQgV8OF3zXMW4LtYsQ4Ceze0cyCB0/P2s82aHIZMnp5ryLAQMOfwpJ4mNg0cbSgg8nei4XVWTor8nzSeAx0a5EFRJkGvYP9B7UShgkR5eH0Dh+BXjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMcgiDMIQJwTqHpdTkier63CIm9UsfsBhWMKg5kO0eM=;
 b=brtx1n0ljd1nxkstROCZSGhaEFWcgTXxyh9/9EFtVzz3rDN93M9khDPC2Zt5zF43ZwVXFBfegvMdwdUb1X7iTrcaASQNSwiV1dt6OCk/wNVOXW3qZYAwEJpJkLKD0X0m/S7IMHregJ6tXiQf5W7LwnV9Gi97GcDZ2+Tw0IsFzuPdSLvxJHJU7FJk+6Z8yKb8B9WXoi/ERmOFBT2fdByPvvBXEgLRCNYjBFdtQaKuYgG1AxkfrliQq6vjkaJ8Hn5dWs1SUQElCFV+CLidOeuV5oUuLI+61PtbzmXOOsErJR8ruhxqGrtVfVlsgjxHJDC69QrQGvvvHD8vMEb4Ekyeiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMcgiDMIQJwTqHpdTkier63CIm9UsfsBhWMKg5kO0eM=;
 b=Nnl//JGLUuE6M1tORf5+SqHIzkSYCnYL1YZQejCa/K/fZgJfNgzr2/aLJNeLsLHJWEqDjHN56AZ5qPBQ5LKI4ExK8xVvaZBLpJnyTeFZn/96pSB5zXhHMh+jxDyplGJmi5vj6cZBY0DW3iyUWpTY0sTVlhHWEH7VCXSOsIbaLLA=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS8PR02MB9672.eurprd02.prod.outlook.com (2603:10a6:20b:5ec::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 22:43:03 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 22:43:03 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Subject: RE: [OE-core] [PATCH] glibc: Use :append to add to CC
Thread-Topic: [OE-core] [PATCH] glibc: Use :append to add to CC
Thread-Index: AQHb5VcnMpX5KUdz5U20SHhSr1uCo7QS5TJw
Date: Tue, 24 Jun 2025 22:43:02 +0000
Message-ID: 
 <DB5PR02MB10213421A4CCDB7F61E5C5822EF78A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250624215053.3162975-1-pkj@axis.com>
 <66ad34980bea73369408af8719d9a1ecb464baba.camel@linuxfoundation.org>
In-Reply-To: 
 <66ad34980bea73369408af8719d9a1ecb464baba.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS8PR02MB9672:EE_
x-ms-office365-filtering-correlation-id: 8be7c95a-e528-4edf-0d38-08ddb3707a80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MjgrTWRwOU9WVFVGMk5VL1FjN211dlVEdlA3V2ZjcldzcmhTVm52TjVHcUxm?=
 =?utf-8?B?R1lkY3FuRy81dm9YeWZKV01ybmFCdGF0dEVnWXo3Ni9OcWtXQy9zZkwxZTlp?=
 =?utf-8?B?bHJUT2lkVVZ0WnNIZ005TkluY0JTRzYwbkRoc1VrWXR2c21VK3pIbUhreHRB?=
 =?utf-8?B?cSsxVHpmR2lXb3hibmVOcjBKdm9IT0wySm80eWRhMUF0TlpvSzJRUnh4bUdu?=
 =?utf-8?B?bEk0ZjFBaERjY1NXUzZvSUozQnFQbGhFOEpPelQyNWJkS00yK0pXV0dBUWRT?=
 =?utf-8?B?aE9XblpmSUZIMDVpUUxaNERKRGNwZ3dkek5ac2NLYjFtUUxaTjk2Y25EcTQz?=
 =?utf-8?B?MkJMS0UwWjh3WW5YODVwYzFFdTZSS29pZFlWbXZHUFBZYXZLT0JMZmxqWTFq?=
 =?utf-8?B?NFFXeVZ1Y2hoK1ZOQzloRjV5cFFMN3R5aGJWN3QxRG44YzFVR05IY2diWGhZ?=
 =?utf-8?B?YTFBamtzK3pBVnRRWWhtb0ZucWUzZ0ZKYjRmVHlMUUxweHQvNTVGZGRKWmEv?=
 =?utf-8?B?RGl0S0g1Z2VZT09nUmVKY3VzWHpHUkhsQ2VOSXUvQUZLVHlMK0IrcDl3ckU0?=
 =?utf-8?B?ckEwZ1NCRllDUXVUb1BaZnAvM1k2WXJGRTVTSVBSV1ZreDFFWW1VYUNZcnNP?=
 =?utf-8?B?d1kzbHlNUU5FREtsVm82MldESnp4eTdEWldJSWdYV0cwYkszNjhhVC9ueERh?=
 =?utf-8?B?NXZpUnNaVEo3Z1Rza1BQTTlaMXAzL0haSE1wMHhnZGxnR3JZT29BWWxueXBL?=
 =?utf-8?B?Vnp5SDNVS1IzZm01eXdWQkJwMUd0ZTYrQVRLWlJKbmZtSEhxWHhIQlhiUlFu?=
 =?utf-8?B?Q2hlU2Jra3U2cE1jb0FlQlc2M1F6RHVXUUxnUTZRWXZUTHpGd2RUZDhNQml2?=
 =?utf-8?B?U0t5SnE1ZDQvMGRCb09aNEpzSllFZ3ltUnUzaG1ua21GZFJRY3R3MXdzQS81?=
 =?utf-8?B?ajlxSlBuRWJnWlFPWmx4UUd1NE9JTmRCelZVaVB5NlFuOU54VFUyU2dRQ3VH?=
 =?utf-8?B?MDU1OWNQQTEvMy9HSUU5RFBVWk1aTzJTdWxjSVJHV2ZBUjBqQlVRTUt5YUU4?=
 =?utf-8?B?SFlEbzc5Y3lkdVNXT1Njazcwd0pmWG84N21LbHFxM1FjUnNXd2hXQUZoNTZI?=
 =?utf-8?B?OHVWYjVCZkNwYjBUOFdoTW5ydTZ2Q05nSFFEc1B3aG1ub0N1RGxBR3IrV1U1?=
 =?utf-8?B?cFlhTkVuSElDd1hvWkhONjhUbjJKQTJBbnhvZmNFWW1UcTVjaS9ieC9QVHgy?=
 =?utf-8?B?S0RoS2RiRzlSVVl6MEI5S3ZtbC9SbU5LdExDZkJIUGhtMnc1VW5zYXd5QVFl?=
 =?utf-8?B?ak94SGJ1bExlOFhnWHBBcVUyMnVHdytYeTcvR29WM3lyTWhKSVlueEZoaVpx?=
 =?utf-8?B?T0tuTGNqdEhzM0d5dHlmeU9wSXBKUWZVeE1RdFMwUzA5RGpDaHNWOFdQb0g1?=
 =?utf-8?B?bzRIN3g5TGFVWWg4NmF4aUhGM2lNcTVLY1V2ZHpYYlJWTmxNUUxDUjRNc2I2?=
 =?utf-8?B?RmplYTdRVHcvKzhyUnFPWnJCbStaeUJkS2VjQmErNi9mazdyYmZKSVlFZ0pl?=
 =?utf-8?B?SkJHWHZURXU5Sm05WTZpRC8vREdDazQ1YWR1d0w3d0wzYjNjb3gxQjhkVEgw?=
 =?utf-8?B?MXhvWUJHTHl2aHZCL1hXMUlINDIvYXNHZXZkbEJyaDNDWWswaDNlcHo0L1ZP?=
 =?utf-8?B?R3pZOEUwbnZsMklzSkJXVGZQYTc0SnBDYnQvUVAzLzl1YTRXSUZhS3hyM1Jl?=
 =?utf-8?B?cGg4VDFra21wRnpoUHZ6emRIdVM2dWxRUDRZSzV4V0ZoR3NBVEsrQXpCK0Vo?=
 =?utf-8?B?TnE0VEdEanBvR3JUTUMwQ3Nra1hTR0c2S2UrdDRVNTRxNTJTKzhMMHNOS09s?=
 =?utf-8?B?ZkpuUXlCeWQxZVF3NURNMkJPZEU3djlTRi9RMWV0NmpYaDMxR29QVmVCM0Nn?=
 =?utf-8?B?S1NXMHZpaU1xYm5aWDVMQ0xGUGViZ1c3NFN4Y1kwSmRZRmxtRDVkR3Y3VUZ1?=
 =?utf-8?Q?83FMi4F2abrxoan+n4FAYonsa44gy0=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Y0RnRkxpcVJNTGV1Y29tWmMyWTA2Y0FIQ084Ry9GR1VpQmgwN01idGdVL002?=
 =?utf-8?B?cTJHMVRKRmgxRVdyQmtDZGErbS92VFhCb1JHTUpPcFhSc2hoWEdCVkN3L2ZJ?=
 =?utf-8?B?dlBzVXZOVmlPcmpFcDBBL3F6S2JGNlkzNi9tMmdHeCtzajdzNnNkSEhKZWI1?=
 =?utf-8?B?RmdURU1zbk84ZkVIUG15VHlYYjFSb1k3RmswT29XSURMdmtEbXA2Vm0rdkZI?=
 =?utf-8?B?T2ZPTjJJSjFjQ3pzTG9HYmwxSkZyRUN4cHFDWU5sVElEY25PbXNvY1NqU3Uv?=
 =?utf-8?B?SzQ5a1FBbnYwbmdOUUl1RlAzMk9tRmU0SUx1WDlEMkUvQU1zQnZwRFVzTlBD?=
 =?utf-8?B?VFhjZlZIS3ZNdzBxOFptNEY1MGVtMC9UWEtzVi9sRTN3cXUvRXpFWWdqUUFH?=
 =?utf-8?B?K3lvWGdZSmlGN3ZveU1HMmlqRU5XU3VzSlNPTGVpRU83UEw2eDErZVdmWThi?=
 =?utf-8?B?cWphbVc5dFJjWVlOaTJ2UG4xL3Ntd0p6RkFmV1RCdFBTM3F2OEZ0c2VpeWlO?=
 =?utf-8?B?VDRSUUdOUDREckZ3OENRM014cDBiZTU2M21oMVlMaFE4WWpPU2RNRjZUNXNV?=
 =?utf-8?B?S21zaDUra0I3N3J5dmcyQURVbVFVWFVndFI1cWlDanJLNjI1SG9qTlBmaW9C?=
 =?utf-8?B?T1Fla1RDSDhsbHkwQVIyd1dSaTcrUTdmb2NFOWZkdVhuYUllaTNUNU1ic2hr?=
 =?utf-8?B?dHR2NlZRYXlTTFl0dWVtdjRtbGpaMjFZeWpNcSsxQ2pyTkRMY2d5OVE0SVRG?=
 =?utf-8?B?RDZlTFRIV0RwMmtkRUpxYlNDa3AySy93VEIydmFGckJTS3F0RjJTbEZZalY2?=
 =?utf-8?B?bUdleUxaeDRSMUk5a1BNUllPZ2VpTFljbmhuVzlhUGRxRDFxd2RpcmlHU2Yw?=
 =?utf-8?B?Y2kvNEhMOFFMWS9XZk9jRCsvNklVbi9aUDFmaVNyWVlQYjYwdlN4KzlDRnlG?=
 =?utf-8?B?RThZM3NWS2x1dkFDZkRyWnJHeUsyKzlKVnZRM3ZaMlNHSCtDajhJMEU3U2FV?=
 =?utf-8?B?VFhZd1o3SzloemRxMnBBajZxNXBUMWhmVU9NNG9seXF1TVYwYnlqQUV5Y05G?=
 =?utf-8?B?LzFGTFF5dklwS1JZajcwVTdJbDF0ZjVpV3ZIUTduRWlGdFlZdzE5WWtjYWFr?=
 =?utf-8?B?YXUrR2RxU2FzZnAwSVVuMFpEckdVQzI0Uktkbm9sZXpLdCtDbHVjZlA4aXhX?=
 =?utf-8?B?MW9zZWdXbGRXQm83aDB1cmo4alZlMHY2QTRIeFMwSTFiaUhQTSsrL2tLVWRp?=
 =?utf-8?B?cGI1eHNEd01yYnh2ZFFweGMxdzFVNWZvdTNIRHl2MU5jblFQMkhSNUxoVTIv?=
 =?utf-8?B?dkdxdWdoMUNEdGhXTFY2NzBISmFyMW9CN0JJRVd4M0twVldrd0pyR2hGSFps?=
 =?utf-8?B?dUQvMjZ3TCtGck80bWJ5UFYyMUhxRlRRV2pJeHBNWUFyU2l6K1hsS0ZndXg2?=
 =?utf-8?B?d2V0MHJSNktyZWp3NzhsZCtmTzF2SVRGSitrZ0xiYnhBSXlHZ1QvOUhXRG5h?=
 =?utf-8?B?dFVucFFrc0wveHQvM0FRYWxBZU1JU1c0c1ovMmJvNmdkcUZsRTVyRlB2SWVn?=
 =?utf-8?B?dGNUK21NMW9QQVlVU0tsM3pZZ3grQkFEcWxLNDVnNjBnWmJWZXYxNWt3cFBJ?=
 =?utf-8?B?VTFyTW53bXJrRzR1dEhMSWdES3lsdTFMV0oyempWNWduOFdSMnZDUGwveEY5?=
 =?utf-8?B?a0ZpTzI3ZlE3c0xJcEk5eTlPUGRtTkdZcjYyRkNFS0JaOXlVSGoxcS94NkY2?=
 =?utf-8?B?bmpkcmJIOEZwMDJxcGVlQVJPVkU4MWx0ejE4ZnRoZmRSdUVrMXNVYzlUb1l0?=
 =?utf-8?B?enpCNkZnR0xpVWxTdVdJVVdId2hCSDJCVDVDbEFKclNldS9PR1NyeXJ3UjJR?=
 =?utf-8?B?ODk3WnozTENOK1Q3d0hnTEk5QzF0QUhlMlVoT2ZMYWo0TkJ4SHZKS1BVTXY3?=
 =?utf-8?B?MTVWZ0R2R0FSQWhId0ZkTDV5cUVmL21VbXk4L2wzQ1ZEWml0WnczWlpOMFgz?=
 =?utf-8?B?T0h5VTYvUjRYR0VaSi9pT2l1c1o0VS80bUM1amlmQ1ZFRkZBT3lncWJWeXpH?=
 =?utf-8?B?ZmJlQTYzODNDbm1IWGYzRXlkbkxabWZZS3NDVmkwM2RPa3NIaHZZSHkxSENL?=
 =?utf-8?Q?OIJc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be7c95a-e528-4edf-0d38-08ddb3707a80
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 22:43:02.8925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MDXfieRgg2//2XvB5DfJw46+YLxlcDAvUi2VjgFIDoGe3S9JuziYysZRk3QUEmwf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9672
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 22:43:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219288

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogZGVuIDI1IGp1bmkgMjAy
NSAwMDoyNw0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhp
cy5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBnbGliYzogVXNlIDphcHBlbmQgdG8gYWRkIHRvIEND
DQo+IA0KPiBPbiBUdWUsIDIwMjUtMDYtMjQgYXQgMjM6NTAgKzAyMDAsIFBldGVyIEtqZWxsZXJz
dGVkdCB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBEdWUgdG8gdGhlIHJl
Y2VudCBjaGFuZ2VzIHRvIGhvdyB0aGUgdG9vbGNoYWluIHZhcmlhYmxlcyBhcmUNCj4gPiBpbml0
aWFsaXplZA0KPiA+IHZpYSBpbmhlcml0X2RlZmVyLCBpdCBpcyBubyBsb25nZXIgcG9zc2libGUg
dG8gYWRkIHRvIENDIHVzaW5nIHRoZSArPQ0KPiA+IG9wZXJhdG9yLiBJbnN0ZWFkLCBDQzphcHBl
bmQgbmVlZHMgdG8gYmUgdXNlZC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtqZWxs
ZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPg0KPiA+IC0tLQ0KPiA+IMKgbWV0
YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmNfMi40MS5iYiB8IDIgKy0NCj4gPiDCoDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjXzIuNDEuYmIgYi9tZXRhL3JlY2lwZXMt
DQo+ID4gY29yZS9nbGliYy9nbGliY18yLjQxLmJiDQo+ID4gaW5kZXggNzc3MWZhYzA0MS4uMmVm
NzM4ZjViNCAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliYy9nbGliY18y
LjQxLmJiDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmNfMi40MS5iYg0K
PiA+IEBAIC0xMTEsNyArMTExLDcgQEAgZG9fY29uZmlndXJlICgpIHsNCj4gPiDCoH0NCj4gPg0K
PiA+IMKgTERGTEFHUyArPSAiLWZ1c2UtbGQ9YmZkIg0KPiA+IC1DQyArPSAiLWZ1c2UtbGQ9YmZk
Ig0KPiA+ICtDQzphcHBlbmQgPSAiIC1mdXNlLWxkPWJmZCINCj4gDQo+IEdpdmVuIG15IGhhdHJl
ZCBvZiB1c2luZyBhcHBlbmQsIGlzIGl0IG5vdCBwb3NzaWJsZSB0byBwdXQgdGhpcyBpbg0KPiBD
RkxBR1M/DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQoNCkdpdmVuIHRoZSBjb21taXQg
bWVzc2FnZSBieSBLaGVtIHdoZW4gdGhhdCBsaW5lIHdhcyBhZGRlZCAoc2VlIGNvbW1pdCANCjYz
MjQ4ZDJjYmQ3YTE1YWVjNWI4NjRkMDA1OGZlOTE5ZWIxN2M0NmMpLCBJIGRpZCBub3Qgd2FudCB0
byByaXNrIGl0IA0KYnkgY2hhbmdpbmcgaXQuIEhvd2V2ZXIsIHRoYXQgY29tbWl0IGFsc28gbWVu
dGlvbnMgYnVpbGQgZmFpbHVyZXMgaWYgDQp0aGUgb3B0aW9uIGlzIG5vdCBwYXNzZWQgdmlhIEND
LCBhbmQgc2luY2Ugd2UgaGF2ZSBub3Qgc2VlbiBhbnkgYnVpbGQgDQpmYWlsdXJlcywgbWF5YmUg
dGhpcyBpcyBub3QgbmVlZGVkIGF0IGFsbD8gQnV0IEkgd2lsbCBsZWF2ZSB0aGF0IGZvciANCkto
ZW0gdG8gYW5zd2VyIGFzIEkgaGF2ZSBubyBpZGVhLg0KDQovL1BldGVyDQoNCg==

