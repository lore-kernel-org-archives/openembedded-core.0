Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E35C27C43
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 13:42:26 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.83])
 by mx.groups.io with SMTP id smtpd.web10.8951.1717076536079334482
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 06:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=P3N7NacA;
 spf=pass (domain: axis.com, ip: 40.107.7.83, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVpkfh/u+EqifnYnHKP+uk6sAWmnW8K/4vMs8cg4/ggu8/7sxS6XsJQ5mbIQ+nFbIhJSkMeBSi9/hrQxS7jHxrst41nObMBSirdKgkNB87t0s8yek1ko7BfJFRV4OcZOLBRAsPbuBJDW358NxUzr1IvD13P2EbPAMfpLIZ6g1cybtle1Zxt8IXBKr4QSdJOSlvYZGKMKz/fOnkt+cyZMXEsMMh0YrAxr3nOpvh1COEr27Dxbs5mM26Aa2iV83xGlH0lhRliGMobCDxYVDFwJarfcjZ88j2g9nEau4C27uS78OpDrM8vPkyFXKl4cqkdiEMbzKnL33AEQ0CAGcZ77tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15Z9YY1rOYPdVihTrW3sCw7iNWb41jV7KAWM/gnLqH4=;
 b=FChnF1/aKYwSIgtxONOERBAfMb4YUyfUn0L/SyDx00zMSzF3KZd3Y3XtgkOznmK5KyeiG45RjT2SfuqrQATudjUh4AnxKTng5FOgD3ulVfgJXf0oCCUOW9U/yPMpKPx2FvRXS7cd87nFP1Y47JZqAIdtB5gKQVYvRdVl7PLDgkfsdOoExWTF1rcMnXP4EJu4nkluhHhUijOGKyqnl8g6yg9rfQg0pajneNlYZ7KDZvqYFxoGsKoGFGkivIJkahALtH+kM2+cWd5wQMrzCFfvLlXHnY5HdJB2Q0lNjCBasL1dImRQVudZx89eomUgN5WUFKWhWLnTP1h5Nm0GjT0eLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15Z9YY1rOYPdVihTrW3sCw7iNWb41jV7KAWM/gnLqH4=;
 b=P3N7NacAdjAniygBnbzNE7YCSfLL91nK8Fs4h1AvaVKdTwrITUKO8gBnbKVBYSZb6zePfZo1RWKcjjHNk1K85ddI+VnR2tc8n+mkxINiF2UtjzXxDw9ZDNEdLretcQrYkLxOSHRTE62tYEqak5cRmFinYGpwSh8GKhPmVlgaWRs=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB9PR02MB9827.eurprd02.prod.outlook.com (2603:10a6:10:451::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 30 May
 2024 13:42:11 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 13:42:11 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: =?utf-8?B?U2ltb25lIFdlacOf?= <simone.p.weiss@posteo.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] tzdata: Add tzdata.zi to tzdata-core package
Thread-Topic: [OE-core] [PATCH] tzdata: Add tzdata.zi to tzdata-core package
Thread-Index: AQHash3N9gb1KiB7jk6/VK9tsN7D+rGvyU/Q
Date: Thu, 30 May 2024 13:42:11 +0000
Message-ID: 
 <DB5PR02MB10213AC9954564F2D4FF183C6EFF32@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240529231252.325820-1-simone.p.weiss@posteo.com>
In-Reply-To: <20240529231252.325820-1-simone.p.weiss@posteo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB9PR02MB9827:EE_
x-ms-office365-filtering-correlation-id: 0f642211-3163-45ca-c188-08dc80ae4edd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UnVaRjhYT0xZT0t5UWtOQmRpZFhuNjA2cFNZOEZ4ODlpbkRhNHoveFhWdW56?=
 =?utf-8?B?TjJydGVkcVVvaE84WStYL1lSTG8zSFBuQzQrR3VRVGdZaWxRbjE2R2NUYVBR?=
 =?utf-8?B?T1laN2V2TTV4RmdwdlN0RmxtbHEyR25XMFNMUTVrN29sMXAxQlordXE0dnVW?=
 =?utf-8?B?Q2xsQTk3SUNRaTlOdlQ0WUdLL01jd1Vkd01ZNEd6bkVvZ0VoZVFGMHZWa0hw?=
 =?utf-8?B?TjJNVlVOalBNZGZ6TzVkaHU3MnVDNklVSFMzMzNNRm13ZVUra01FaEgzWExC?=
 =?utf-8?B?cEtOT0dHYm1XUU5LVm1tQWozclptR0lWRFFlcmxFc3lJMndBK1ZGZ294djFZ?=
 =?utf-8?B?Nk9JZGJNaExXL2VkOXI5TVhrb1FCSi80ZkdJa0VaRWNMSjlUdG1JY0RqT1ZU?=
 =?utf-8?B?Q3pxT29YbllpVnByMlBUM3pZZkJrZHJhczNMeVNEWC9VL0FDajBKakd2aWI3?=
 =?utf-8?B?d2VFampodGI4cHlMWWJZU3RpZDNXVnZEVzd2T0xUd2RYNkp2MTVUQ1BEQ0xE?=
 =?utf-8?B?OUhVSVY1MmNnbWEvV0pRbStEQllPSVRoQ0ovZzROVEZkbDhGOXc1RkFDbGVW?=
 =?utf-8?B?d2JzOE5uRE1YdnhSby96dVJlU1NJR3I0a2xZWk9BbDZrUzRIcEJHQWdPRDMv?=
 =?utf-8?B?RlJ1NjNtRFZldjBRM1N2V0VRK3pPMGZJQWVvTnVod2FtVitYdmVFMkhpZ0Jk?=
 =?utf-8?B?QUxiaDcxWFFxb1ZIUFRyNjE1eDVDeUovcEhRWDFBcHIyM0NBcDdoMnBlUytR?=
 =?utf-8?B?Q1FJYWxkMUJrMG5KSmZnRE9HUzZuaTc4bmIwT2dHV01sb21LcXhoT2txUlJq?=
 =?utf-8?B?My9SdVRoblFRdGIrKzYwL2IrY24wZ3doM2NaTERLYmpxems3Q090OEJiZXc2?=
 =?utf-8?B?QVZwY2JjNHF4MjZOT3Axd1MrN1VZdC9kSHE1TlNpbElrTXJqeTVVeUJUNTJX?=
 =?utf-8?B?bXhtNis1d0F4VXc0aXlNbVFQRDN6dmlENVJRUEwyQ0svckwwK0hncUo1UW4v?=
 =?utf-8?B?SHY0TElKcTZqMm0vUDZUVFJsWGNPVWNDb1d6WTRlT0Q3eE9JWVdBVmV3MWt3?=
 =?utf-8?B?NVp5bjZoMGdZTHNRTXB3L2xReHdkbUszeTZDZFowejNpQnVYUHhsR3JHanRB?=
 =?utf-8?B?dUV6QTdLclBwZVhuckdBTnBPV0VJSWNQN3ZlemV0MUhsc2x3VzlsbklzYVBw?=
 =?utf-8?B?K2xETWhyZDg3THBjNEJwK25BZXoveE9pdkJNS21BRW42MkIvb2VqaXFFaGhG?=
 =?utf-8?B?VW9lZUVhNzNuSnByUFFBT3NoQndONUloTWdRMUwzVU9sUXFyV0tCRTROTStX?=
 =?utf-8?B?MWVmZGVSVmdrME1XK0lESC9qSkZHWXplQkdCWkxKQmFzNlZuTEo5dXhiTEdv?=
 =?utf-8?B?VUhJSDU3TjBtKzdObmlHd2J1ajY2dDhsZ1dnRk1wN09lVHBtS0tKbktENjVx?=
 =?utf-8?B?REtaTkdnZ3pvcytTK0JQd1JnSGZ2Z0tLcGFmcktNK0pqTTNDQ3FLdVlWUUZm?=
 =?utf-8?B?OXFEeWtWRno0QUlRLytHTWdHQjljNVFMUE04MUk3U2g4NkhyU3pqMzVpWm12?=
 =?utf-8?B?azYyL3NYVWRsVUZHeHlxQzFCOTBnUXdQRmpNa0p3MUVqQ1ZsZUV5TXFGYUxk?=
 =?utf-8?B?UXpJQXJzcHJLVVJpc0ZrMHlheHlHTEh4SVp6SU5hRjJEQUFVcDVNU0FZK1Vp?=
 =?utf-8?B?ejhsWVlYNGV4R2RjS0RjcFpGcmR0aHJ3cDRuYXdNRC9tREpXNGt6QmVsT3ZQ?=
 =?utf-8?B?ZFBaL3kySVo2aGZ1QzRueDZMVjlEUEY0MHFMU3VpK3VxLzZocUY1WTdEY28x?=
 =?utf-8?B?M2tPcnhYNG1sWExxaDFydz09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bi9hNEZFU3lWVzJoY09jUHVyMy9BcFZvZ2trVWlBYlMvazV1UVgzeVFjQWNi?=
 =?utf-8?B?RWdJYk5ZTE40NlplY0RoK1NYQ1pXQWtaYTc3V01oWnV1eVErbmowL3kzZ3VO?=
 =?utf-8?B?Nm0zc2Y0d2dPSERSeE1iYlh5MG4wRVRrYlFvRm4yMnNDYnVGTnM1Nk9vZXN0?=
 =?utf-8?B?Vm9rclErVEpvU2JOYktKWDV1aHowL1ZmNzY4RGZJckRQSkI0Q1RZQTk0UCtH?=
 =?utf-8?B?UllZblh2Rmk0M0s2S0lIL0FxU0QvR2lxN2gzL3U5SEplRVI0L0Z0OUduMDJs?=
 =?utf-8?B?UDVhZ0s3VHFhKytHaytkNmxSMXhRN0czVWliRlozZjlJUnVjNkFVRUNqQmxk?=
 =?utf-8?B?ajd1OTVLZjJtYWw1dUZvak1pOU5WNkJtNm9PaUhYeWQ2ejhBdThzUHBHdFFS?=
 =?utf-8?B?QVNaN0R1dWFNZVpVeXJnZDByTWRyY2t6d1c2QjR5bnZxWFRudmFVSHhxTmdE?=
 =?utf-8?B?SWxWUWxHUEtHa25ac0lGRjRkZW9EVjcrQUthV3IrbnNHbytGYjlXdnkzU3ZN?=
 =?utf-8?B?TXUxL3NweFJIbTNPSUdFaU1KaTJsSEo3Ni9Md0UyOHhjL2d1NSt5cy9Rejk4?=
 =?utf-8?B?c2FRUjNock5PNjRJeDgzVHI1TlFuNEJDQnlydmJramdKWUpaQTNKMGkzYVlJ?=
 =?utf-8?B?am51bDduSk9NaUlEeldBRHlWeTFhUUVQVjhUS2FzTk9PUC90ZTJPK1I2OFI4?=
 =?utf-8?B?RTkrVHNveG9Pc05QcnQvV3doMjlTa2NoU1AwaEJpQlp1TFhIWUNWSWFkNTMz?=
 =?utf-8?B?bkEvTjFvcmhGazB5N1hMc3ExTDBkOUFseXVPTUdxUTB3WjdJd1Yxd0dlUVVx?=
 =?utf-8?B?ODNmak9wUDQ0SmcyM1ZQMU9oYjdyRjFyNDlDV1lIeVJwc2RQdVc5YnR2T211?=
 =?utf-8?B?SXVHQllRZzBGbnJSZXczTTZNelRWSFhjdFltY3VnYUtWdVFGeGNma1ZLeWNO?=
 =?utf-8?B?dnJjZFp3c3BJOExyNVVqbTlRT21yV2d3UDJzUW1Xc1BTdEdYQVNvMHF3cERa?=
 =?utf-8?B?U0RWbWx1eGVpRlk0VXZVQUEyOWdjOHRTbVhuaVp1bXppeVBtbFdOeUFXUkw0?=
 =?utf-8?B?VFNzTDBVUkIyOE90NTM1SlpvMmNQeklYOVBYeGdzcXNtN2RVOW9vTWRmK2J0?=
 =?utf-8?B?UFZIWi9xQlBVTWJ6a3RNQmtJSnl5ZVpqMHd2QWpmZElYUlZCTjJTdVEraTUx?=
 =?utf-8?B?M1Z3MUhNQy9lMndHVDMvNFpFUHkyOHRtZ3VrcmorL0R2MFRGQ0xMWXYzRzBS?=
 =?utf-8?B?RExzVmlRczJwYkk0Q1BMRDNsS1ZPYVp3eHNBc2R6QTlwa05DR1dSS1ppK1VE?=
 =?utf-8?B?OGdtTlM3L2RMTG9TMFlUT3hhS09LT2lpMjBROHBpN0s2bFV2bGFYbDdwZ0lp?=
 =?utf-8?B?SjRhdkN4VkRQaFBpV2M3L21JNTcyTDc2WG03QVMya2FibXJ0L0RLbkl5aG1N?=
 =?utf-8?B?bkcvWXloY2RZNXI4UUdMalgwMGlNRVFTUXFKWjJaYm1RYStMWmhZSEUzZWNB?=
 =?utf-8?B?c1psQUNtQ0JQM0NjUk5HNUZablROczNWR1ozWjB6TThYdmxoYmJja1V0d2R3?=
 =?utf-8?B?VVNWVjl6U3RvamRNZHBwSGxuTWVSMVRyQThNLzlhbGV6cGV6Rm1oSnlmd2c0?=
 =?utf-8?B?OU5aT1BaUGpaMTVOY2FncHBCOUFwS0I3VVRVZjV4RzlOOHI3ZlQxdHJVbGlv?=
 =?utf-8?B?Sjh4TVVNWSsrSzhpRGpjOEk1YTIvS0dwblNhejlXU1pqVWNjSWFPUENvMW5G?=
 =?utf-8?B?WFE2SWEvOHhiYjdDeE5Rd3ZiQlNUY2ZpV0VvS0Z1aHRYZms1YWZ3T1lKV1Av?=
 =?utf-8?B?WVZ3TDM2cEZjUDNvYnFxWjJGUWNWdmRWUHl0dE1UMUlLVzVHYzhyVmxqaVgv?=
 =?utf-8?B?K011VTEyLzFIeEwxK0hGNThJb2F6WVZ0RFFBeXQ1eUZ2Q2JmUlJmeDlTUWtq?=
 =?utf-8?B?djdhcWZ3VXJRTk9FTG9jMEp0QWFqNG43MCtBM3lsNVFaME56YTA0Sm9SVFox?=
 =?utf-8?B?aEhQZVg5M0tvb3JWN2xQY1gwckhXMHgxQ0JtN3NJNCs4Q3hTdm9TM3RwL0Nj?=
 =?utf-8?B?d1NzZlM3R3RjODVJZzVZYzFFUGp5aXVNbDdYRzZRR1VveERMcDNQMkIxR3Jl?=
 =?utf-8?Q?0egY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f642211-3163-45ca-c188-08dc80ae4edd
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2024 13:42:11.5270
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eUmFw/U4vwwu0DJNQGwW/27xHgVZiQ4C1OmohKyPyAuKqtmbdlGViKCs/8/AJfF6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB9827
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 13:42:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200022

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgU2ltb25lIFdlacOfDQo+IFNlbnQ6IGRlbiAzMCBtYWogMjAy
NCAwMToxMw0KPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiBDYzogU2ltb25lIFdlacOfIDxzaW1vbmUucC53ZWlzc0Bwb3N0ZW8uY29tPg0KPiBTdWJqZWN0
OiBbT0UtY29yZV0gW1BBVENIXSB0emRhdGE6IEFkZCB0emRhdGEuemkgdG8gdHpkYXRhLWNvcmUg
cGFja2FnZQ0KPiANCj4gRnJvbTogU2ltb25lIFdlacOfIDxzaW1vbmUucC53ZWlzc0Bwb3N0ZW8u
Y29tPg0KPiANCj4gQWRkaXRpb25hbGx5IGJ1aWxkIGFuZCBwYWNrYWdlIHR6ZGF0YS56aSBpbmZv
IGZpbGUsIGFzIGUuZy4gU3lzdGVtZCBleHBlY3RzIGl0DQo+IHRvIGJlIHByZXNlbnQuDQo+IA0K
PiBbWU9DVE8gIzE1MTcyXQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2ltb25lIFdlacOfIDxzaW1v
bmUucC53ZWlzc0Bwb3N0ZW8uY29tPg0KPiAtLS0NCj4gIG1ldGEvcmVjaXBlcy1leHRlbmRlZC90
aW1lem9uZS90emRhdGEuYmIgfCA1ICsrKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL3RpbWV6b25lL3R6ZGF0YS5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC90aW1lem9u
ZS90emRhdGEuYmINCj4gaW5kZXggZGQxOTYwZmZhNy4uMzAxNzU3NDBkNyAxMDA2NDQNCj4gLS0t
IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3RpbWV6b25lL3R6ZGF0YS5iYg0KPiArKysgYi9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvdGltZXpvbmUvdHpkYXRhLmJiDQo+IEBAIC0yMCw3ICsyMCw4IEBA
IGRvX2NvbmZpZ3VyZVtjbGVhbmRpcnNdID0gIiR7Qn0iDQo+ICBCID0gIiR7V09SS0RJUn0vYnVp
bGQiDQo+IA0KPiAgZG9fY29tcGlsZSgpIHsNCj4gLQlmb3Igem9uZSBpbiAke1RaT05FU307IGRv
DQo+ICsgICAgb2VfcnVubWFrZSAtQyAke1N9IHR6ZGF0YS56aQ0KPiArICAgIGZvciB6b25lIGlu
ICR7VFpPTkVTfTsgZG8NCg0KVXNlIHRhYnMgdG8gaW5kZW50IHNoZWxsIGNvZGUgaW4gT0UtQ29y
ZSAoanVzdCBhcyBpdCB3ZXJlIGJlZm9yZSkuDQoNCj4gIAkJJHtTVEFHSU5HX0JJTkRJUl9OQVRJ
VkV9L3ppYyAtYiAke1pJQ19GTVR9IC1kICR7Qn0vem9uZWluZm8gLUwgL2Rldi9udWxsICR7U30v
JHt6b25lfQ0KPiAgCQkke1NUQUdJTkdfQklORElSX05BVElWRX0vemljIC1iICR7WklDX0ZNVH0g
LWQgJHtCfS96b25laW5mby9wb3NpeCAtTCAvZGV2L251bGwgJHtTfS8ke3pvbmV9DQo+ICAJCSR7
U1RBR0lOR19CSU5ESVJfTkFUSVZFfS96aWMgLWIgJHtaSUNfRk1UfSAtZCAke0J9L3pvbmVpbmZv
L3JpZ2h0IC1MICR7U30vbGVhcHNlY29uZHMgJHtTfS8ke3pvbmV9DQo+IEBAIC0zNyw2ICszOCw3
IEBAIGRvX2luc3RhbGwoKSB7DQo+ICAJY3AgLXBQICIke1N9L2lzbzMxNjYudGFiIiAke0R9JHtk
YXRhZGlyfS96b25laW5mbw0KPiAgCWNwIC1wUCAiJHtTfS9sZWFwc2Vjb25kcyIgJHtEfSR7ZGF0
YWRpcn0vem9uZWluZm8NCj4gIAljcCAtcFAgIiR7U30vbGVhcC1zZWNvbmRzLmxpc3QiICR7RH0k
e2RhdGFkaXJ9L3pvbmVpbmZvDQo+ICsJY3AgLXBQICIke1N9L3R6ZGF0YS56aSIgJHtEfSR7ZGF0
YWRpcn0vem9uZWluZm8NCj4gDQo+ICAJIyBJbnN0YWxsIGRlZmF1bHQgdGltZXpvbmUNCj4gIAlp
ZiBbIC1lICR7RH0ke2RhdGFkaXJ9L3pvbmVpbmZvLyR7REVGQVVMVF9USU1FWk9ORX0gXTsgdGhl
bg0KPiBAQCAtMTQxLDYgKzE0Myw3IEBAIEZJTEVTOnR6ZGF0YS1jb3JlICs9ICIgXA0KPiAgICAg
ICR7c3lzY29uZmRpcn0vdGltZXpvbmUgXA0KPiAgICAgICR7ZGF0YWRpcn0vem9uZWluZm8vbGVh
cHNlY29uZHMgXA0KPiAgICAgICR7ZGF0YWRpcn0vem9uZWluZm8vbGVhcC1zZWNvbmRzLmxpc3Qg
XA0KPiArICAgICR7ZGF0YWRpcn0vem9uZWluZm8vdHpkYXRhLnppIFwNCj4gICAgICAke2RhdGFk
aXJ9L3pvbmVpbmZvL1BhY2lmaWMvSG9ub2x1bHUgXA0KPiAgICAgICR7ZGF0YWRpcn0vem9uZWlu
Zm8vQW1lcmljYS9BbmNob3JhZ2UgXA0KPiAgICAgICR7ZGF0YWRpcn0vem9uZWluZm8vQW1lcmlj
YS9Mb3NfQW5nZWxlcyBcDQo+IC0tDQo+IDIuMzkuMg0KDQovL1BldGVyDQoNCg==

