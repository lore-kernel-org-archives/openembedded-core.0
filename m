Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C9DF55431
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 23:23:47 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.34])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34131.1771975418170128863
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 15:23:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=hvGt3PIr;
 spf=pass (domain: axis.com, ip: 52.101.66.34, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DB59LL7cm0+r0OPMspOhFOT5DyIDOTJYQ042BSkDVqb0jnlJV0wdvVB2WYR3zlSi4ZSH4sWP5V5EzTKqssgoLJjDyG9iFdHUZxjZSOsB7/bZTI6FZ0NGDPOJlTLbrQInzH2cb1f3vyydWXxjj1e8hPTFCzXDLJTrdvsYtSZ2rA3AkdIj/Vx3o219D3w7TWUUcTsT7EhAL8pox9Npp7+Sj+RVQVFJNEN0qKgbi15Yk4ouqiHQLQ8zf49I4HaCJq/rZz1Muf0q40zhzOAiqf+7rSh3fv3KXABf33/5gPEBoKFvI19YVyrbjrf1Ap5qoNnM8iCwC2v5l1dWDq0HEZHIDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1G57fmt7JTTtglihaf0gnYICQRrHTYacKzbcAsBzCUo=;
 b=VTsNguOkMpgI7j5tqInWMzKDxB/yFdIdCC0lcqReyn/iOXqQLRYrcYudc2wPM+tNYlnXHjfppkXKyELdU4zd0479dabFgEuqqV/kWtt/fd3tw4AsnSMt4F3FMTgMAmNwm/+L+vswiEuLAYDanjXyFE+jXb8JtY6nMQv5j9v+FTN83XhZYa5QYOWS6MZNDnxSPcm7DxP66nA3p/iOq60QOhliNcfDc2OpQtqBLT9M8eFitS1edj4pswAmVeWhF0h/shyUL4cRKpJDTdYL3kMvG9B+6CrP0oAU+PTNQrWCzIX4Tfz3eQkyrDiarlrE3xSmz/nHqMR9BA5WebQIzTY81w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1G57fmt7JTTtglihaf0gnYICQRrHTYacKzbcAsBzCUo=;
 b=hvGt3PIrrmLLUub9I7gfHfF/LJZW473Wn6WDPCmskWjmryAoVO7aokJBOJfKS+g16pqlkKeelfa1Xkv0JfwnwGMYjAw1U92xwaUf/34E3XaitOp0O11eetdGrTxDUt+z2OoQdoPPr62ApmBwH1rwqmr7WqvoGs1KsDVRESv7V6A=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PA4PR02MB7070.eurprd02.prod.outlook.com (2603:10a6:102:100::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 23:23:34 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.20.9632.010; Tue, 24 Feb 2026
 23:23:34 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] devtool: standard: Add new patches in correct
 order when finishing
Thread-Topic: [OE-core] [PATCH] devtool: standard: Add new patches in correct
 order when finishing
Thread-Index: AQHcnDJzEL6dlVRUBEC8KAREV60QBrWBFykg
Date: Tue, 24 Feb 2026 23:23:33 +0000
Message-ID: 
 <DB5PR02MB1021366509B2DAEF9D1BD72C9EF74A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260206011344.1788785-1-pkj@axis.com>
 <4a2c5d68e143c2260023afbdb67ab25573c7a49c.camel@linuxfoundation.org>
In-Reply-To: 
 <4a2c5d68e143c2260023afbdb67ab25573c7a49c.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PA4PR02MB7070:EE_
x-ms-office365-filtering-correlation-id: af325766-b3d1-4edd-cafa-08de73fbbabb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Z2VOU0s3a3ltdEZzS3hsMGU1Vk5tTkhFeU1RWFZwU0dqdTRNMEtjaEZOWDZP?=
 =?utf-8?B?b09MVUtJWmZiRVZzajJLeFdKeVl5VUZ4a0RZVG9VajlSNkhKbXlBOHppZlBa?=
 =?utf-8?B?Z2k4QVhPTVJ1OTdOMjlsZGlwcjA2c3hqOVlkdlFYWUdtd3FYelJ0Rk9pRnU0?=
 =?utf-8?B?YVptcDM4SDNuRTl3WitDVGZZL2FDS3MzcDJEdDB2Nm90MERDOUpRM3hVS0tV?=
 =?utf-8?B?YmVLVXJBYW5GdG0rR0RmcG9pL2pOQ3c4U2M3R3JlMXdtampreXlUalpHQit6?=
 =?utf-8?B?TTB1T1pKdDJTOEs3a1hoNGVRejNrY2tzbzdSUTFicXdFRWc5SWtJcndHcTlN?=
 =?utf-8?B?RFk4cE42UUFFYW9DTXd3YVF3cUF5Qkc0VEFtcVFpemVSYlpnTVRwRWRzUzA0?=
 =?utf-8?B?ZnREYUhNSjUvNlZrdmRmdjNnUHdFRFNxVzNCOWZnelpLTzZXeTU5TTVtbVpu?=
 =?utf-8?B?QXVEVnNaMDVNbWJJUG1OMHlMeWVGUDc0Q2hwb2N3QnZ6bWc4OTFLRU02Tk1L?=
 =?utf-8?B?UmZ3YTV1RzkyejFScEc5VUROcXdZMmtPZzU1U1p2NHF4M0Nydytza3ZhNzZx?=
 =?utf-8?B?d2EwYko4LzNSN0ErVXU5dS9BNERCcEY5cE9sWjMyMGxyeGhObHBVdkVqa3VQ?=
 =?utf-8?B?cXM5RzhUQk8yY2YzaXBnSTZHdHdvV2pxYmlCS1F0WHZHaWc5L05CR2hvcTdv?=
 =?utf-8?B?QWJiNXJ0Vk9vY1ZCRzVXWC9FVUM1dWh3b3h1b2lJTWZOakQvWWhDOU5WazhN?=
 =?utf-8?B?L1plSUtpNjVKellJVlk4bUExbld6SEttMFc3UW5ZcHpmQ1htd0xaSE9tSHht?=
 =?utf-8?B?MlRHaTNXT0VyTzdBeU5SdThkN0NFWElTeDg2cWs2M2xJMFNueDVvZFM3VDli?=
 =?utf-8?B?WEsrZGZzUVNRWXpjUUVES0Y3WW1JRXJFaXNiTTZXZlVWcHpDRENuVnlFOXFR?=
 =?utf-8?B?QXZhYWdNOERtenZXLzFZVCsyQ3RmWS9GYTY2YW5NaUNuNWhYWjQ4MmR5Um1o?=
 =?utf-8?B?bGxCNVRabkZkZU1KeE9EYmZFZHIwaUdUZ0FLaGdrVTNEbXNqcnVHTFBZcHls?=
 =?utf-8?B?aTdjNjAwWEI1a3hpQ3N1NUE0VkhQOFpVbVNtTXRIWmI2ckJLT1J5bnF6eFpQ?=
 =?utf-8?B?NEdNTUhLK1k0MlhDbE9qOTFuQ2VsSHNIb0l6WUdXdmZxcmhqdWptSm45RWNm?=
 =?utf-8?B?SVdOY0lYdWE4NFBKTG4rS2cvZFNUcHVNWWFKMTJKekF4Q05jV1VOSU1TSktl?=
 =?utf-8?B?eDgwR0FRQ3RZbHFPa2pHQ2VBdzhMSm1XWkhFVVU2OUxPL1BTV0RZYXc1RE12?=
 =?utf-8?B?QU56TG1ad1dXaGlaMVA4R1pvUHhrcVRoQmRVRHFHMkllWEIvOC9FSVM2UDh3?=
 =?utf-8?B?VVdteUZ0UHhxOXZuYlBGV1dFVlVqMTRvVDcwTTZ5ZVM5TkpGRDQzTUlTUllZ?=
 =?utf-8?B?WnFNRTZzSHdFWWg4UjB1aUx1eElCUjhRVHVpNVA2SzdwLzBqd1dabFhCa0gr?=
 =?utf-8?B?VDBSQTA0bXNOVGpTR2IrOWVUWUdIb0w2YWxaKzVuSkM3ZzkxVmU1Z0U2YVh4?=
 =?utf-8?B?bkFsbnBValU3STkyM1NSTHlDR1k5ZDNmU0lVdUpsMVRyZkhYTmdWWlJNc3I1?=
 =?utf-8?B?TEVtR3BQTVMxWmlsajJMb1A4Z0pSeVc2NXRlUHBmbFIwUkRGZmJVbGZWaXYv?=
 =?utf-8?B?T2NBekEwejhxNmtKSXdKczlQNnY4SUZKblR0cnVWWVkzNXdVOEUxbFNqVENV?=
 =?utf-8?B?WVpWTnF1cHZHZGMwZmJMalhsZkk4VVJnTzhmNERURzVxN0cyb29jRkljc0w3?=
 =?utf-8?B?ZTBzVDlsKzl0NmZlcThoeVc3ME5WM2RSaUFIbkJSdkw0RVJRZU1uWUN2eGpR?=
 =?utf-8?B?SlgrS0hxajVLQXQyMXdnTURPcDIweVhpWUp0VklLbFk1UDRDRk9vRXZLUkQ5?=
 =?utf-8?B?Q0xvWEI0OFJ2anhzWnRIVzBjT0t2bkwxRStFajE0MFpXanBsS1plVStFcjcx?=
 =?utf-8?B?eWFRMGRqS3hjM0RBdE5pVHdGU2E0aVE5TzczMElUWCsyakgvT2RDT3ZJTVZB?=
 =?utf-8?B?TGFFYnduazJYTWZpRnR5YkFWTis1a3VVWnFzRjFTRk96M1NHZFlHVXN6NXNp?=
 =?utf-8?B?UTh3NEVOUkQ1RkpGb3NhRzVHQkRERHRYVDZ4M2Vxb2lkQ2pKcm5LMklrSlht?=
 =?utf-8?Q?Soc/b2QDBkcTB5cj23ukixk=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SzF4MFJXWDVRVjhxN3JCWW9ORFdQUGV4ZVJ4VkVOdkgwODBWUjJMeWJORjM4?=
 =?utf-8?B?diszZkh6bUwvUGJBVWdkcWtGRHg2QkJtTzZBa3pZeVJFTWd2RjJYRmxXK2Y2?=
 =?utf-8?B?V0VGcFhKUVg2eDVmNVcycnZKNUxoTmhnaDY4bFJlV0ZGZUN6MTVIbWlUQ0lQ?=
 =?utf-8?B?YWZIa0kzd2F3UW5KalJ5c0paWkpPTGJhZitiVzRTSXdKMXljMmVDU1ZhWVJt?=
 =?utf-8?B?TFlEa2Q5N3BSb29MMGg5d1pWdDgzczRsWG5aeHc1cXprb05HNnBJTzZCSG9J?=
 =?utf-8?B?NjRoYmRCczloVXZoSE1rWGtGOHAvdEMvR1FBemxZLzZNZTcvWTY2dXZlTzlq?=
 =?utf-8?B?R1NDVkRESHBTVFBCRDJJbDd6V1E2SVZJa1hrZER2VGppM3ZnU0MxeWQ2OVRY?=
 =?utf-8?B?d0g0dGlVNVdPQ0M0dXFXaEg5U0owN0FyaWVzbUdnV2d4MytUaEJ0VEk3M1JG?=
 =?utf-8?B?S1RUdU13cEhxUG9aNElpY1hvREY3TTJGT05vK0plUXRqWGpTcEllQ0FQTVhp?=
 =?utf-8?B?a2h6ZVFuZ09USjRQTjlDVGt4NWgrTXc1SEhGcE1GZVBNSDB4a1RaK3c2bGJW?=
 =?utf-8?B?VUUwQmE1YnpJaVZvSUlhWGlYWmZpeHVIS05nakk1VnZEMTRCTFAzM2xHY01K?=
 =?utf-8?B?dUs4WDBSWGtzVFBnbTFKblpLemRiY01TTTRnRFlZQi8zVUJRZGJhbW15RVpM?=
 =?utf-8?B?M1BPZEQ4aDgyS1lZRHRUblFCRVVwT1JIVUsrS09hWTN0LzhRZitNenJEcmdB?=
 =?utf-8?B?c1h5Z2I2Q0hKVE5zQnJqQ1k0ZUpsaWdCYWxyUFZZb1N4SUJDQUJYeWlhYUMy?=
 =?utf-8?B?L2E0bmp0cnRIQW1FcklYNldQZzRTcmVDdEpMa3RTYkEzbFQ0aGN1bkV0UXYr?=
 =?utf-8?B?cHZNclJrQ2dheTkzazJNTklsNU9MNk9XUVVyTFNJYkVYWjlwQ0lMcTdnMUVV?=
 =?utf-8?B?RE1iS2ZVbWhGNlNXRkIzQTdlbEhpRGRrbzRHdVBLYXgzU3NhN2hZRDF0TzJ0?=
 =?utf-8?B?TEJGRTdrbXc2TTRjL0Q2eURUekpDZVljS2JCSHo2Z3dFaWNhMHhTMis0SFpz?=
 =?utf-8?B?aFo1UzRxSWkrWkZ3dkVGWE9OVFZkbmpleEFUYmEyQUlIeks0TjZ1NUdOL1ZW?=
 =?utf-8?B?RXJqQXpwb3NKdDlyREdDakNENzlxK0NSbzNjQ0JJWVRiWFpRZmk4MWdSZzVo?=
 =?utf-8?B?MWhIbVltV3c0NE9nTTJHMGFxRU1jd3ZtWjlFTjEvWkVxZzhTR005bjk0UjBD?=
 =?utf-8?B?U25tRnFjSTRlUHFvN0FYaDZzOFlldElhY3BKdC83d0IwUGdmWldhcEl6bjBP?=
 =?utf-8?B?c282Q1dhUFZJN0g2TWYyUGpBVUR2VUMzNW0vVzZ6SkJWeVVINlN3NmZ3Sm9U?=
 =?utf-8?B?Y0ErUVlHSklSWWxLRTZyMldWUnZTQ24xMWRqdkp1bEVYZnYra2ZkckVMQTJZ?=
 =?utf-8?B?VVdRZGRzVEY4QjQyV0cwczNHVVI1SGtlR21tYTRtdFpkNk5mSDJ1OGRFQmdX?=
 =?utf-8?B?ZXViL1hzSnUvWGNVRklBVlc3c1hiK0prQnFlN1FFNkFSS0g4SVdtRk0vazhJ?=
 =?utf-8?B?bkZFNHpUWXNML3FZVXZaNWhHSG1kYStvcnlzNDlnVktNWE5oeVAwSTRubmpF?=
 =?utf-8?B?Mm9pRjBNdUdVa1JsYWNhTzdIYmpveWkyOW1wVDkzeXA3SWNEd0gvc0dOSysz?=
 =?utf-8?B?UVFlOEd5aGtIOXA3dG1abXFoVm1LdXl2OVA3eWh4a3JyWGlaR3JyRHpGTEFW?=
 =?utf-8?B?dEl6YUhaMGpOaVJwOFlRc3UxOTBMZ251MXhTbVNWNzdVNDRMYTBxeVBlSGJF?=
 =?utf-8?B?TEFpTXpiWFVZQnZDaXJjUmJkZGJvenpLZ1VUcE4rRFU3Y0FTZHBNY0ppK0FP?=
 =?utf-8?B?RDEydHllWWNRT3JkeU5PcSt4NXo4NkRjT1FpaUtTUWJjZVNxQTZoWU1GdWpK?=
 =?utf-8?B?bVQyOGJUaGFsMWE5Y0piNk5OVGVXaTRRT3JsNHdSTjdTWExYYncxWVNpTmk5?=
 =?utf-8?B?WElkMHIrMzRhbmpDaXJQYzdSU3hrWWhyWElKK3lheVZTNFNpdWRLWmFvVlRR?=
 =?utf-8?B?Y3VGdlB5aTdUYnBpUiszcDg4RzhjUUFTMHZIUUJVRWlWUzJHbXd5SzJRQjd5?=
 =?utf-8?B?cHltRStnZ3ZSMWpYb1M1R0wyeVFpZ0o0NjA1cFF5aHh1RkZTaXJJSlVUZzY0?=
 =?utf-8?B?SVdPczdtZ2xyVUI0OFNXYkdzVWVOT0c2aWRCU245c2x1UWxsWGtnT3ljelpC?=
 =?utf-8?Q?s/loVBefRtx0UaoTWYL3f9ZhHM14WtQJv6dpouRFEE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af325766-b3d1-4edd-cafa-08de73fbbabb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 23:23:33.9478
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9J16f7aMsUF2BAVEaMXuySeLKG930l4YjHUB/1TLrPAWg1bbZsJ50hH/Ha/GV/aW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB7070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 23:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231920

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogZGVuIDEyIGZlYnJ1YXJp
IDIwMjYgMTY6MTYNCj4gVG86IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0
QGF4aXMuY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBT
dWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gZGV2dG9vbDogc3RhbmRhcmQ6IEFkZCBuZXcg
cGF0Y2hlcyBpbiBjb3JyZWN0IG9yZGVyIHdoZW4gZmluaXNoaW5nDQo+IA0KPiBIaSBQZXRlciwN
Cj4gDQo+IE9uIEZyaSwgMjAyNi0wMi0wNiBhdCAwMjoxMyArMDEwMCwgUGV0ZXIgS2plbGxlcnN0
ZWR0IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+IE1ha2Ugc3VyZSB0aGF0
IG5ldyBwYXRjaGVzIHRoYXQgYXJlIGFkZGVkIGFzIGEgcmVzdWx0IG9mIHVzaW5nIGRldnRvb2wN
Cj4gPiBmaW5pc2ggYXJlIGFkZGVkIHRvIHRoZSBTUkNfVVJJIGluIHRoZSBzYW1lIG9yZGVyIHRo
ZXkgd2VyZSBjb21taXR0ZWQuDQo+ID4NCj4gPiBQcmV2aW91c2x5LCB0aGUgb3JkZXIgd2FzIGEg
cmVzdWx0IG9mIHRoZSBhcmJpdHJhcnkgb3JkZXIgdGhlIHBhdGNoDQo+ID4gZmlsZXMgd2VyZSBy
ZXR1cm5lZCBieSBvcy53YWxrKCksIHdoaWNoIHR5cGljYWxseSByZXN1bHRlZCBpbiB0aGVtIGJl
aW5nDQo+ID4gYWRkZWQgdG8gdGhlIFNSQ19VUkkgaW4gdGhlIHJldmVyc2Ugb3JkZXIgdGhleSB3
ZXJlIGNvbW1pdHRlZC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtqZWxsZXJzdGVk
dCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPg0KPiA+IC0tLQ0KPiA+IMKgbWV0YS9saWIv
b2VxYS9zZWxmdGVzdC9jYXNlcy9kZXZ0b29sLnB5IHwgMzAgKysrKysrKysrKysrKysrKysrKy0t
LS0tLQ0KPiA+IMKgc2NyaXB0cy9saWIvZGV2dG9vbC9zdGFuZGFyZC5wecKgwqDCoMKgwqDCoMKg
wqAgfMKgIDYgKysrKy0NCj4gPiDCoDIgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwg
OCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+DQo+ID4NCj4gWy4uLi5dDQo+IA0KPiA+IGRpZmYgLS1n
aXQgYS9zY3JpcHRzL2xpYi9kZXZ0b29sL3N0YW5kYXJkLnB5IGIvc2NyaXB0cy9saWIvZGV2dG9v
bC9zdGFuZGFyZC5weQ0KPiA+IGluZGV4IDFmZDU5NDdjNDEuLjdhZmI0NjU0Y2MgMTAwNjQ0DQo+
ID4gLS0tIGEvc2NyaXB0cy9saWIvZGV2dG9vbC9zdGFuZGFyZC5weQ0KPiA+ICsrKyBiL3Njcmlw
dHMvbGliL2RldnRvb2wvc3RhbmRhcmQucHkNCj4gPiBAQCAtMTMyMiw3ICsxMzIyLDExIEBAIGRl
ZiBfZXhwb3J0X3BhdGNoZXMoc3JjdHJlZSwgcmQsIHN0YXJ0X3JldnMsIGRlc3RkaXIsIGNoYW5n
ZWRfcmV2cz1Ob25lKToNCj4gPiDCoMKgwqDCoCBwYXRjaF9wYXRoc3BlYyA9IF9naXRfZXhjbHVk
ZV9wYXRoKHNyY3RyZWUsICdvZS1sb2NhbC1maWxlcycpDQo+ID4gwqDCoMKgwqAgR2l0QXBwbHlU
cmVlLmV4dHJhY3RQYXRjaGVzKHNyY3RyZWUsIHN0YXJ0X3JldnMsIGRlc3RkaXIsIHBhdGNoX3Bh
dGhzcGVjKQ0KPiA+IMKgwqDCoMKgIGZvciBkaXJwYXRoLCBkaXJuYW1lcywgZmlsZW5hbWVzIGlu
IG9zLndhbGsoZGVzdGRpcik6DQo+ID4gLcKgwqDCoMKgwqDCoMKgIG5ld19wYXRjaGVzID0gZmls
ZW5hbWVzDQo+ID4gK8KgwqDCoMKgwqDCoMKgICMgU29ydCB0aGUgZmlsZW5hbWVzIHRvIGF2b2lk
IHRoZSBhcmJpdHJhcnkgb3JkZXIgcmVzdWx0aW5nIGZyb20gdXNpbmcNCj4gPiArwqDCoMKgwqDC
oMKgwqAgIyBvcy53YWxrKCkuIFRoaXMgbWF0dGVycyBmb3IgYWRkZWQgcGF0Y2hlcywgYW5kIHRo
ZSBhc3N1bXB0aW9uIGlzIHRoYXQNCj4gPiArwqDCoMKgwqDCoMKgwqAgIyB0aGV5IGFyZSBwcmVm
aXhlZCBieSBhIGZvdXIgZGlnaXQgbnVtYmVyIHJlc3VsdGluZyBmcm9tIHRoZSBvcmRlciBpbg0K
PiA+ICvCoMKgwqDCoMKgwqDCoCAjIHdoaWNoIHRoZXkgd2VyZSBjb21taXR0ZWQuDQo+ID4gK8Kg
wqDCoMKgwqDCoMKgIG5ld19wYXRjaGVzID0gc29ydGVkKGZpbGVuYW1lcykNCj4gPiDCoMKgwqDC
oMKgwqDCoMKgIHJlbGRpcnBhdGggPSBvcy5wYXRoLnJlbHBhdGgoZGlycGF0aCwgZGVzdGRpcikN
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgIGZvciBuZXdfcGF0Y2ggaW4gbmV3X3BhdGNoZXM6DQo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICMgU3RyaXAgbnVtYmVyaW5nIGZyb20gcGF0Y2ggbmFt
ZXMuIElmIGl0J3MgYSBnaXQgc2VxdWVuY2UgbmFtZWQgcGF0Y2gsDQo+IA0KPiBUaGlzIGxvb2tz
IGxpa2UgYSBnb29kIGZpbmQgYW5kIHNvbWV0aGluZyB3ZSBzaG91bGQgZml4Lg0KPiANCj4gSSBk
aWQgd29uZGVyIGlmIHdlIGFsd2F5cyBudW1iZXIgdGhlIHBhdGNoZXM/IEkgYXNrIGFzIHRoZSBj
b2RlIGluDQo+IGV4dHJhY3RQYXRjaGVzKCkgY2FsbHM6DQo+IA0KPiAiZ2l0IiwgImZvcm1hdC1w
YXRjaCIsICItLW5vLXNpZ25hdHVyZSIsICItLW5vLW51bWJlcmVkIg0KPiANCj4gd2hpY2ggaGlu
dHMgdGhhdCBpdCBtaWdodCBub3Q/DQoNClRoZSAtLW5vLW51bWJlcmVkIG9wdGlvbiBvbmx5IGFm
ZmVjdHMgdGhlIFN1YmplY3QgbGluZSBpbiB0aGUgZ2VuZXJhdGVkIA0KcGF0Y2hlcyBhbmQgY2hh
bmdlcyBpdCBmcm9tICJbUEFUQ0ggeC8yXSAuLi4iIHRvICJbUEFUQ0hdIC4uLiIgd2hlbiANCm11
bHRpcGxlIHBhdGNoZXMgYXJlIGNyZWF0ZWQuIFRoZSBmaWxlIG5hbWVzIGFyZSBhbHdheXMgcHJl
Zml4ZWQgYnkgYSANCm51bWJlci4NCg0KPiANCj4gQ291bGQgd2UgcGFzcyB0aGUgcGF0Y2ggbGlz
dCBmcm9tIHRoYXQgZnVuY3Rpb24gaW4gdGhlIGNvcnJlY3Qgb3JkZXINCj4gcmF0aGVyIHRoYW4g
cmVseWluZyBvbiBhIGRpcmVjdG9yeSBsaXN0aW5nPw0KDQpZZXMsIHdlIGNhbi4gSSBoYXZlIHNl
bnQgYW4gdXBkYXRlZCB2ZXJzaW9uIG9mIHRoZSBwYXRjaCB0aGF0IGRvZXMgdGhpcy4NCg0KPiAN
Cj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KDQovL1BldGVyDQoNCg==

