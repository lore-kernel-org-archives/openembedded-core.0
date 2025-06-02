Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA89C5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 21:29:08 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.1])
 by mx.groups.io with SMTP id smtpd.web11.6933.1748899739717878189
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 14:29:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=o0s9so4L;
 spf=pass (domain: axis.com, ip: 40.107.130.1, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ew7/6/Yll2nf5erc79UucQ29QG1X52/i50ftOTY+Bd7ag+kPFnwhOQYqjtx7DJ68xPNKw1h6ki7BpBski0zmH9NJ4KddNp/2fHMNOm6GMIehff3qB2MvHw0kiCOZCWWpMo9rNbkooOMUZLrRIDne97zg1S9bIskMEP9yLRxIUozCrvgjrdx6KqsnfMuMvAxeWQMFpnBsMmjmGCfFS5glLN3NL10R5BMJXkyvGWc/g78vbpLSfVSeS5EAXTEAS1A5bGLjZnlkg/rloNAar9GW6YWVrebdURXUQdO4EGdV/pAnDHmd8Q9c/YmwlQOAqRxLJTtZ+NuBv7KoP1LHikAL6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+HA2zm6xf8Vu3EoOZtfZHmYTYtHMGQs+gqb915lAEk=;
 b=aL6HdbttolQ47YCMW7JEXqnHT28WKkH3/jxocqXD8F1o5MEpmtdHr1bBiKXZxK4HN9LlctQy75Tms7vNUPzWUJCNEhz0Jk8tEUu7zHBHOUPMQIQVzZ86tPpO+RZiyBSrUygkWQZxAkJyh26AP7JtWHD15BZJ66ay7c+PePbXqU9JsjM5M+Thh6sJiVNblZ2dhI087viKKb624N6G34vmowK92BoUm31BCX/Yq8raD2OmV3+dZg6DlUDxj1bgG5Cj7xWlibDP9BvQ/tmprAuTKIwHErwXI5yzYTHAuNDzyx3PbxxlioIBRBlDC2r5Vbq2p9UPL2io1Qs+bI4mYcTmow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+HA2zm6xf8Vu3EoOZtfZHmYTYtHMGQs+gqb915lAEk=;
 b=o0s9so4LcWGsKsStfAqwGn9EmmiMXfMX4VT0+uzfVFGHEPuAtC++Erckbn6XhpBM0TY+apiCHXr6lzv1egIQtvvRYqJwUv91ZdufCq8E7x43WA/vvet9jMKAVYNL2zS9saFs1NfbcU7nVSkNXnJTUP43YbGXjO15mDPi5fop+5s=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB9PR02MB6553.eurprd02.prod.outlook.com (2603:10a6:10:21f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.17; Mon, 2 Jun
 2025 21:28:55 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%5]) with mapi id 15.20.8792.027; Mon, 2 Jun 2025
 21:28:55 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] m4: Backport a patch to build with
 --disable-nls
Thread-Topic: [OE-core] [PATCH] m4: Backport a patch to build with
 --disable-nls
Thread-Index: AQHb1AMR8jjGqEfrKU6Bs8Fm6WZuULPwYc6Q
Date: Mon, 2 Jun 2025 21:28:55 +0000
Message-ID: 
 <DB5PR02MB1021399880FF8C4713979F904EF62A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250602205614.781885-1-pkj@axis.com>
 <55a42d0d521b79f23d687800ae97f0df2152d7c3.camel@linuxfoundation.org>
In-Reply-To: 
 <55a42d0d521b79f23d687800ae97f0df2152d7c3.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB9PR02MB6553:EE_
x-ms-office365-filtering-correlation-id: b848673d-82d9-4bf5-9cf0-08dda21c7ab6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?d2wrMnJuS1g5TlJnZnlBY0lqTHhYcVRpbFY4ajZoaVhaSEFoeXh2Tlh5TkV6?=
 =?utf-8?B?VkZyZW9YZytneHBKOWgrNVRCSEc0T1dsZlZkcURJbUV6eVUvUjNsVnVNUXFF?=
 =?utf-8?B?b1dCNWgzU2NvSUgxcDhmemMyekJsOTJrY3dlL2JJR2FUZENybHg4aFgzaEda?=
 =?utf-8?B?RXBTbGE2N29xbk9oRThrb1d3ZS9RQkc5dTk4TzJ3YXBla1Zhb3BJblJtdVBP?=
 =?utf-8?B?cGlRVEtGMXl0eS9PNStjWEM5cW0zQ3dOYVZUclM4V3JEUkhIa3J4eEtUb3ZT?=
 =?utf-8?B?ZHE0VmNPNlpEWlNEU3Q3S3d4eStKdjY5Z3VyRGpxU2IveVNaRDVHNWRyNkxm?=
 =?utf-8?B?Z0szQzJqRkJYRU94SXl1ZnhReEU3bFFySTFvTzhZZFJtMXorbStLUndCMW1M?=
 =?utf-8?B?RmFiSkMzc2Uwemp5QXVoR24zclEwanVnek0yNVJhU1pKUDhNeG9SckdxcUhQ?=
 =?utf-8?B?ZGZieTBtdDh3NTd3bysvd0lNU1ozendJOW05UkdmWGRyVi85Y2xTQzRxdmp5?=
 =?utf-8?B?VEtCcFp1Qy83eE9qR0V0aDdQdTh4SlZ4SW1KNkI3Rkx3UHVCaFlPTHZFZFZY?=
 =?utf-8?B?c1QzY0dIcEhzb3RKVmVXZnBQUlpVVkhCT0kzbVF1bDkvdUZlRUl6VTlqOEpy?=
 =?utf-8?B?Q0V2UmpQSmtwWWdiR2pkakc4VU5zTmtDeFdQMm12L1M3Sm16WWc2cXJkMjRJ?=
 =?utf-8?B?WFU2cDZRTGd6U1V5cnMrOHprTUIySlVaaUtYNlpDcG9CM093OVlqTmdFNlpH?=
 =?utf-8?B?SGNOMGh2WGZhcldtSzZOYUY1U3cxb2Q0RUg0cFVlVEJ1VlNNc3BLMVlrTU5h?=
 =?utf-8?B?amZ4R2dlWk8vWnVOUFlxYTBHMU5nMU9YQ2JGSERZSEg2TDk3ejN2czJ4bFpC?=
 =?utf-8?B?WHpzS2pkZnM2S1ZlbXFnZTEyL0tmek9lSU41OWJjaE9TTUd4bDhXVGgxTTdB?=
 =?utf-8?B?RjBxTW10eTJtSzJ5QWU3KzdWdkc3eUpnN1Q4Z280WWRncXU3VXpydTBvRDhY?=
 =?utf-8?B?b3BweTJQZ1NKUHpTYUhPeXo4WlNNOVRObE5tOFpNek5CVGZCRHNCZ1gxeThl?=
 =?utf-8?B?d24rSytmNHUzWCsyYld6bGpTS2RWMm1iOVFrZVVPR0E3clRZSURvMm1tZkk0?=
 =?utf-8?B?dmdoUk91ZUx3NVI4Z25pNG9SdDlJYm9rdXh4eG5FblNud0cweVpWTGxSdGt5?=
 =?utf-8?B?RlcvcDZGQVZZS3k4UXZaT0tOazM4SDVDejJvMndFaVROVFRuanlUK0VNMHpX?=
 =?utf-8?B?blFrWTVxWnorN1A0Wnd4R1ZSQUQvVTBMT3JiN3FEWHdxd2txWCtrVmlJZjhp?=
 =?utf-8?B?NThHUTNJb3Z0am5CdEhsOHVMRVIreFRzdi9hTHRQN2lMc3hESFlVY2JIMFhJ?=
 =?utf-8?B?WWNyTmJTLzBpdVlpdm1pNC8wam1oMDZneldLc3JNU1pwc1JiWFNzd01nSUVp?=
 =?utf-8?B?bW1SaE9rcVNzYzF0NEhkMXd4aWtrOXRsOFNQUE1OWkorMzhvTkR2enNmOW1h?=
 =?utf-8?B?ZnZHUmtFRWJLaFF3WDRXV1N4L0gwWTZwS0h2c0ZPb1VLN0VRbXQ2ZlQ5d3Zw?=
 =?utf-8?B?THZJV05ublZidDdFU1pHMm1ZaFEwMDYvSUJqckROZE1KTGo3cEMvYnBZVG8w?=
 =?utf-8?B?cCtDZUlzdHU2YWJxRHRURktjMW45a3EzQWVNQmROdkhobVh0ODBFYzFBaXVy?=
 =?utf-8?B?UHg0SmxKN2orSnRzL3pwT2Y1ZW5ZL0ZFTmQxVjZIbnJtSEM0VEQwOHExcGY2?=
 =?utf-8?B?VGc1dHpoS2lzM2RZQ0lDK2lXMkNnS2l0aFlPaFZ3U3o5Q1doZVlWM2pIc25R?=
 =?utf-8?B?MnQrNHFCcmRMdWxDN01XN0pFcm1rM09RS3dvVmZ0cXdVTUM0ZHlISE9yVDlU?=
 =?utf-8?B?cjE0MSs1dExKOHFJQTZJdmNuQ0hHWDZtOWRLKzdSbkcrcy8zUlUwY2J5RXlQ?=
 =?utf-8?B?a2I4WTNyM25iSDJEdHhZTlpaSTdNZGNVZWhKWWJVMTYrQXJRK3J6ajAvdVBv?=
 =?utf-8?Q?FWZu25u3LcQ+PxRig5BHy+hqiA11ms=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bUpnVTRUM1BCQ0JENCtKSFkvNmFtY1hsd0VZVnNEV2tpS3NzcXExMExKMXFh?=
 =?utf-8?B?MFU0cTZrblRFVytmUTBxMWVMYnlpUlhWcmxSeDBQMXF3bnZyZzlURklkTGl1?=
 =?utf-8?B?aWlwQWtRTHRXMGRGQkVBL0E1NDArdDdhT0tZQU4vbkJUR0Z6V2lJOWlIa0Jj?=
 =?utf-8?B?cWNjN1cyZ3BmeWZuY0lpU01FMEtKOTErUDZlc056RkhGYVZadWppNmZVTkhF?=
 =?utf-8?B?cGdmcGIya1R2UmdNb2lSbEdYSytycEY2K3Vld0thaVdvQ2tkTXZxOE5POG1o?=
 =?utf-8?B?RFpENVpGUTZGSWFkL0ZWR1h3N0JNWUo3SGtxT1RwaTBMVmtwVndqMDBiR3cv?=
 =?utf-8?B?VVpTbE5UUExTZkhKTGk5N250d2VId2krUlo5OS9BNlArT0wrZFpXQS9NdVR3?=
 =?utf-8?B?bVJvaHVTWXZ3ZlUyT1pWU1JuM1l0NmdhYkpSRGdYR3lmQzFCbk1pMXZTMnEz?=
 =?utf-8?B?M0tRdFd2UmRzNXAzOXdHQkRYNmtzallMTjEzQVB1SGhRSnZrZ2JSQ2RCUDdp?=
 =?utf-8?B?Y2hBVE8rV1pYOVJPcU9sUTBja0M3YWxlUW5Tc2hkcDg2Y1NPSnVPR0pXL1lZ?=
 =?utf-8?B?WDAvNFFENklDYjFPeHlBYWUra2YzT1BiOFJ3aDRZSUVBRmRpb0I1RE5VWEJ6?=
 =?utf-8?B?UFVabmtSYkZZVVV5dmI3MTVyNWozb2g4eGxTbTZuVzhDT0NiUWhiV2VhUkVC?=
 =?utf-8?B?V25DbmNxRTNPQUUzUnpCSGpuMHA4SCtDYmFlMVpsM3BreDV6SlRZYzhGT0Ns?=
 =?utf-8?B?d3p0RG5rWVRaWkkvYXlNamNpL0tLOXdSZW5zb0FDM3dOeTBGbTJIRkpBZWtZ?=
 =?utf-8?B?ZFNCc1p2WHBxd1BLVWlRSHdYWGRzL09WM3NlRlQ0QkRXeXpLNkM1Rk1VTVJt?=
 =?utf-8?B?VWJ1cjFiNFhSajNnU2Uycy9leW0xZmhzT09PZjFSVmxxV0FXS3Z5THlrNHd1?=
 =?utf-8?B?T3RKOEtSVnhWdW9sYVVybDZlMVdjN3IxaEJKaWhzcUZzQkJydHZkUzZzUExV?=
 =?utf-8?B?azZsSjlHTVY3cmFXNVFubnlJN0w5MlJ6RlJ0bEdJbzBhdzdmOHI4a2tNcm1G?=
 =?utf-8?B?azVuanlrMHdFM3ZRT1YrbWJVSnE1cGFSNE50dVF4T0h3WW5ndUFLcXkzblFK?=
 =?utf-8?B?NzNyWkVhem9SSURaSWVoN0JiTVV6VE50dmxUWHVOSmV2N2JlUGZUQUduZ0RQ?=
 =?utf-8?B?eHNlTnZST1BWUk1XaGJFR2dLMjJPWExvWmRqdmJPYld2VEo2QXhqSnozQzFh?=
 =?utf-8?B?OTRjZVdMZnk2TTl1Y1VJbmJtNlF0ZTQ4VElOQUxOY1QyN2ljcU43VmQxTlVN?=
 =?utf-8?B?NmdUU1ZHL3hWWndCaERnMGg0WDV5MzhNK0FXQnJ6N2s0YjZ3VmxSbTRTM0o0?=
 =?utf-8?B?NHNLbnE5ZHB2dHIxTVgxLzl0bnNtdC9yQUcybCtwaCtGN0RnbjVPRk41OFk2?=
 =?utf-8?B?Z1I3VEVwbXc3QkNnS1dPaTJuSEJtUlN2VjZoU3YrSnlIS3dCWUlZZ0VicVlm?=
 =?utf-8?B?TmFxSFdVbnFMR1pVbXh3Z3BYTnZFZXQrZEJxd0libGE2Y3pyUkY2ZU9ocXJR?=
 =?utf-8?B?cHpHMlpRMjJFYy9wekJwN09iR2MyendjaGpGc01TTVlRVmU4VXQ2amNFTTVp?=
 =?utf-8?B?d0JRdTM0SkcxZUpYMnNMeHVSY09rOE9lQ1VBTE9lUjI0TlZ3UUZuMHM5aVp2?=
 =?utf-8?B?ak5Kc3RaUnduRjFRQ05XeCtvbGlIamdqaHRCVjFsTXVVRkxiZFhNYXQxaWEv?=
 =?utf-8?B?Zi9zdXp1YmJEZUd6N0MxM1M2Q1NjZnpzTXFiWTM1SXNHYW94aTNYTTVTRWwy?=
 =?utf-8?B?M1RBWVRmRmtlMlI0Q1JRN0NMZ1NPbnlKbktBR2VYTnRhN1VJcnlzeENPZWhr?=
 =?utf-8?B?VU4yU0J3T2hrMWRpUEFhcVZVaVpHSjRFeUVxOExDYzhiSzhJY3pvZmJoUEJi?=
 =?utf-8?B?S2VmWDFTdG1Va3RoTmRJWHZyTzFBaSs2ZDZuMWEwV2tudWdBYTE5Q0JmNE5a?=
 =?utf-8?B?WWhSQU1jQ3dIaHVlaU1CSExHdTVlVnNyWUd4ajdVQTJlOVVLMWM2bTFlaVFV?=
 =?utf-8?B?MmZnK1JWQkNaZEY4T2ZWNkFHVC96N0h3aXNSTytsZDhiTUhuckpIMzAyOWE4?=
 =?utf-8?Q?BPgA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b848673d-82d9-4bf5-9cf0-08dda21c7ab6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2025 21:28:55.7723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BhAhYWqlgRRtqV3txYg8qTTOuvHx0xxAFnnvDK15TYVI/aESynGt0toWKY6yDoEc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6553
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 21:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217734

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogZGVuIDIganVuaSAyMDI1
IDIzOjEzDQo+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlz
LmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVj
dDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIG00OiBCYWNrcG9ydCBhIHBhdGNoIHRvIGJ1aWxkIHdp
dGggLS1kaXNhYmxlLW5scw0KPiANCj4gT24gTW9uLCAyMDI1LTA2LTAyIGF0IDIyOjU2ICswMjAw
LCBQZXRlciBLamVsbGVyc3RlZHQgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+
ID4gQnVpbGRpbmcgd2l0aCBVU0VfTkxTID0gIm5vIiByZXN1bHRzIGluIHRoZSBmb2xsb3dpbmcg
ZXJyb3JzOg0KPiA+DQo+ID4gwqAgbGliL3NwYXduLXBpcGUuYzogSW4gZnVuY3Rpb24gJ2NyZWF0
ZV9waXBlJzoNCj4gPiDCoCBsaWIvc3Bhd24tcGlwZS5jOjIxODo3OiBlcnJvcjogZm9ybWF0IG5v
dCBhIHN0cmluZyBsaXRlcmFsIGFuZCBubw0KPiA+IMKgIGZvcm1hdCBhcmd1bWVudHMgWy1XZXJy
b3I9Zm9ybWF0LXNlY3VyaXR5XQ0KPiA+IMKgwqDCoCAyMTggfMKgwqDCoMKgwqDCoCBlcnJvciAo
RVhJVF9GQUlMVVJFLCBlcnJubywgXygiY2Fubm90IGNyZWF0ZSBwaXBlIikpOw0KPiA+IMKgwqDC
oMKgwqDCoMKgIHzCoMKgwqDCoMKgwqAgXn5+fn4NCj4gPiDCoCBsaWIvc3Bhd24tcGlwZS5jOjIy
MTo3OiBlcnJvcjogZm9ybWF0IG5vdCBhIHN0cmluZyBsaXRlcmFsIGFuZCBubw0KPiA+IMKgIGZv
cm1hdCBhcmd1bWVudHMgWy1XZXJyb3I9Zm9ybWF0LXNlY3VyaXR5XQ0KPiA+IMKgwqDCoCAyMjEg
fMKgwqDCoMKgwqDCoCBlcnJvciAoRVhJVF9GQUlMVVJFLCBlcnJubywgXygiY2Fubm90IGNyZWF0
ZSBwaXBlIikpOw0KPiA+IMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqAgXn5+fn4NCj4gPiDC
oCBsaWIvY2xlYW4tdGVtcC5jOiBJbiBmdW5jdGlvbiAnY3JlYXRlX3RlbXBfZGlyJzoNCj4gPiDC
oCBsaWIvY2xlYW4tdGVtcC5jOjIzNDo3OiBlcnJvcjogZm9ybWF0IG5vdCBhIHN0cmluZyBsaXRl
cmFsIGFuZCBubw0KPiA+IMKgIGZvcm1hdCBhcmd1bWVudHMgWy1XZXJyb3I9Zm9ybWF0LXNlY3Vy
aXR5XQ0KPiA+IMKgwqDCoCAyMzQgfMKgwqDCoMKgwqDCoCBlcnJvciAoMCwgZXJybm8sDQo+ID4g
wqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoCBefn5+fg0KPiA+DQo+ID4gQmFja3BvcnQgYSBw
YXRjaCBmcm9tIGdudWxpYiB0byBhdm9pZCB0aGUgcHJvYmxlbS4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPg0K
PiANCj4gSSB0aG91Z2h0IHdlIGRpc2FibGVkIG5scyBmb3IgbmF0aXZlIHJlY2lwZXMgc28gSSdt
IHdvbmRlcmluZyB3aHkgd2UNCj4gZG9uJ3Qgc2VlIHRoaXMgZmFpbHVyZSB3aXRoIG00LW5hdGl2
ZT8gUGVyaGFwcyB3ZSBkb24ndCBoYXZlIC0NCj4gV2Vycm9yPWZvcm1hdC1zZWN1cml0eSBpbiB0
aGF0IGNhc2U/DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQoNCkNvcnJlY3Qgb24gYm90
aCBhY2NvdW50cy4gLS1kaXNhYmxlLW5scyBpcyBlbmFibGVkIHdoZW4gYnVpbGRpbmcgbmF0aXZl
bHksIA0KYnV0IC1XZXJyb3I9Zm9ybWF0LXNlY3VyaXR5IGlzIG5vdC4NCg0KLy9QZXRlcg0KDQo=

