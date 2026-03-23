Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 060EAD58CBE
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 03:44:01 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com (OS0P286CU011.outbound.protection.outlook.com [52.101.228.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9870.1774237432174032660
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2026 20:43:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=BOlTGV/T;
 spf=pass (domain: fujitsu.com, ip: 52.101.228.53, mailfrom: wangmy@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFfP8sByy4ADazLQgLIR4Z7sBGYPe0xA9SY60ne/a4fgiLJB91S8vrHk6aCrrDzjgo767vX+b6+Arf0SPUdj9nQcM9QbqVnZUNjrDSxFisHTRNOUPeCt3/rkw0XSUGtopqXbycFVIB1oSaKKn/f3SRMJbgZ/BFvehUAp9c7al9FnkUuyKop2743dsO7jDilMf2Z38yiLxvmiwPXZ9VVHVzijDYLhmLM2FAw0C/45xtmGbS8fo3ViYmFOiJnnWF/7O6KxaK+MqfLCLg7h8Zg5RLI3MPSUna7FirCEl9odw4B8YckFLrAdortEh+lPyWKEzfWf9LIaZ4mNlftJfZVeVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJvyu8tQURFxx5Q4ZWv+OrwZprNtKiHp4KDhfsB1XVQ=;
 b=Jv0/geoMrTwYXfokaTnEE7m3G2a/zf6/ZfoYVwMKEdBaKG1uMeJpKyUfkxFUztE1Edr7WyFYrprMd6JfjVkOHaYCKilmoe2bvapfuUK/jb9EVtYbpwzBqfvK5WIJylKkPQmL4uq1XcVkBcmjUf41kOTwIzXpa8g0qhH48zbL3v4fTVUNGXBPs4hLtlmeIdtdSJvxWh8INla22d0cKVpZCJu6G0Mkx0eEEmqBcTO9aLbf7G7eUWA8VstooHMZEEJdYvU4tzPYW4xR+bd+UUdZiIdg2E6NscNGdCCyP4At7mzKNCbJB9sAUBdgH3eH3b2GZ6mlJdJwjBCWXa2480ItYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJvyu8tQURFxx5Q4ZWv+OrwZprNtKiHp4KDhfsB1XVQ=;
 b=BOlTGV/TWLPn1BBdOcu5UKTxU/t0t77hkdF2ly8t79E5lLHfnbKuE9d4h3tkBzjZlVH0QHbYRuU7FKSUdfKpEPgAu94WadR9/lbwZTocsd7uQnLWy7sr92LX7d9oa3Ob84M34CMqHXgBicsXen9Nu+CvDv6/kKB3XJyYvPEdEOCIM+JJdESHoZTgBiZ+PNBTf3cm/V1yo7RwnWs4V0ynxuChRk1G8AJ/D1s3tmJ2FPtTaL6pa8zy4rsqTlcI6qqeCLAY8oM/YnY1akM5b+R1pWVR+5PdBz1OTYnsb3KjdjQumKJ2ouqiQYrvsPnoTRPKqqJXyTPpDJnLoZ2umU9uGQ==
Received: from TYCPR01MB11866.jpnprd01.prod.outlook.com (2603:1096:400:3e2::9)
 by TYWPR01MB11029.jpnprd01.prod.outlook.com (2603:1096:400:392::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 03:43:30 +0000
Received: from TYCPR01MB11866.jpnprd01.prod.outlook.com
 ([fe80::14be:e1e3:4902:aca4]) by TYCPR01MB11866.jpnprd01.prod.outlook.com
 ([fe80::14be:e1e3:4902:aca4%7]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 03:43:29 +0000
From: =?utf-8?B?V2FuZywgTWluZ3l1L+eOiyDpuKPnkZw=?= <wangmy@fujitsu.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 19/40] lttng-ust: upgrade 2.14.0 -> 2.15.0
Thread-Topic: [OE-core] [PATCH 19/40] lttng-ust: upgrade 2.14.0 -> 2.15.0
Thread-Index: AQHct4k/uNiMK//dMEO/nYFVOrI9YrW13TgAgAWiHnA=
Date: Mon, 23 Mar 2026 03:43:29 +0000
Message-ID: 
 <TYCPR01MB11866EFD2C457A7B32B77F9BFDC4BA@TYCPR01MB11866.jpnprd01.prod.outlook.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
 <20260319101332.2067-19-wangmy@fujitsu.com>
 <DH6SW5NRFL5I.ARPDBHZCXP22@bootlin.com>
In-Reply-To: <DH6SW5NRFL5I.ARPDBHZCXP22@bootlin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9YjVlYzVmYzQtMTIyYS00MzQ2LWI0YTItOTM3OTllZDEx?=
 =?utf-8?B?Zjg3O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjYtMDMtMjNUMDM6NDM6MjVaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?B?ZC04MWUxLTQ4NTgtYTlkOC03MzZlMjY3ZmQ0Yzc7TVNJUF9MYWJlbF9hNzI5?=
 =?utf-8?B?NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfVGFnPTEwLCAzLCAw?=
 =?utf-8?Q?,_1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11866:EE_|TYWPR01MB11029:EE_
x-ms-office365-filtering-correlation-id: 03c0d8df-0a10-4899-4c83-08de888e593c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|1580799027|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: 
 KsscREVmObIvzDV/VYACgIzDTbPIPIdESqQ0M0AKNF3oAC0EoVosjnToQVs2t9SpHfSOOnQbsqCpL1pF5lAhsZTeEdMPJ8aUUwRipL33BpxAVYveBnRvsZDF+aSPPVR5krNNm7WB78BWehopO44yBx6rOnDUFqAZljn9wlUwm6B+Vmm07eGaf503awxkxIoeiAyv58mC3fFKs+9AY/uMm9+p/ZZtNRI9U7EIWZTPT7nIyTBv+hqfDsmS5PmP9/YjrSoBrsMoIGO0s2CHL3SkK9y4FWTp/SiAqJNepf0nWscjvuDctNh5R9ddeALfK60ixWKi/sLUzRq+MDEVGqa7cjOuf88rwDNdTfxml9h9a2VV6dJXUaHuQH5yAkVW3yPbfr3k1hAuoPVCI+hSlFCn/V0StVDKAm5pUbqHWrg2L59y81tkfx0Pg4oxRC46joWzcev9nltMru+XidPQwq7EbESrjrXRS11gxsSttizBASw0sGP3mGfUm2d32+ZbggY6DpJDSvp6fWnMTqIrJDJRivI6eFtRV/TFheMvs+X2a+gLnpHl7JcSG2UD7OsfVhZvVSJUKw2v1k1YK2HOd6bJ/w3LcjnUro8ZaMI0xN93iu0fHlMbCY8cVzySZaJnXIhTDLSuMunGgL9ykDTcG6db9dQegSPkJ3iwxd2Y5eoOfIicl0NoLS1yG7boTtMgALjQXrNl8yEfUvEmGKyRuqojrW6J8bsMfBzCZB2ER84cyYHDqa7szadrYBDqYSEBc065
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11866.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(1580799027)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?b0VmVWkxaGRrd1dwei9xV0JWNHlOYlZWdnZ3ZloxWWVoUTNvY1F5eS9aSDND?=
 =?utf-8?B?YWpYTTUwRG5yVm0xNTVtSktIb3ZIbmpjU2xNd3N3djU1MUpaakppeWM4MDZa?=
 =?utf-8?B?Skk5T1BxUW15QWFTNi9jYXhHYjd0LzhyVklScTVOaUZOUU1YTE1lRVdoVzRR?=
 =?utf-8?B?Z29aWjBmK01tSk1yR1hmY0pjb0JmRkdzQXJsR0NMZ1RvUmQ2SVUzR2hiekdz?=
 =?utf-8?B?Q1pZNm0ra0NLekFNcXpRaXB5UWxuM1lORXpCV1pXNWMzZ1ljZEpka011Vmdi?=
 =?utf-8?B?UU5mUyt2OGkyemY1aTRKM1lNb3FWTEtQamFKWmxBUUJncThUZTNYaENLNzBT?=
 =?utf-8?B?aXg4UEFBQWdJeFF6aEl6OUNZblI1Z0s0cDdHaEdTaXUwcTYyb3FMSU90UE9u?=
 =?utf-8?B?eVpvSGh0ZS90S0lvRXE2dFNBYUc3LzlTdVJYU0I4Um9sVDh1MFdiZGxrRTZ6?=
 =?utf-8?B?U3J2UWlneVZ2MlRMNE5Ia3NwU0E1ZUZYbVpCYmxNalNWUkRNd0VRM3dkb20r?=
 =?utf-8?B?MVFkcVhzRHNuaWNCMGpiZUNCU3RWZWpWUzl1OThaYjI4SDRvR1VoSjJNRzFh?=
 =?utf-8?B?ODZMbmlSVzgvWXMzWjNYNlpxbHk0MTB5M1ZkSFA1aEZ3OXZINmx3TWFKQW9O?=
 =?utf-8?B?ZmZidkJtOUQzb0FLdkc4Z2czckpXRWVOTUFoUEo5blVoTzZQWE1hTXpVZzN4?=
 =?utf-8?B?VVZjSGVOSy84UzNwQlJzVWFWQW9uVU5mTmpseFcwMXh2V2RsYkhFV3MvMUs1?=
 =?utf-8?B?OTQrU05IZG5qdGI5c294UGdxOFFSSmMrM3V6UWtVQkNFejJIRG9IVzhSbk95?=
 =?utf-8?B?NkNwZGs5dlczcVBRM2J6Q2JrN0I0T0ZyQkgweFEwNThhZnROQUtURDR6U2Fn?=
 =?utf-8?B?eHNncGlIL0ZjZFBmUTk3OU82dUhCUnhHdzVNZHFqMG5UN1hhcklLbzkyZFVT?=
 =?utf-8?B?TDdCMG1XMjQ3ck4zM3N0aE5TamY5bVhlVStyTXk5bkVVWE1WWWxHVCswNlFk?=
 =?utf-8?B?eEZCcmcvUlA2UEpkU1cvenc5RUlVQWxTN0J6YWlXL0hsZC9MdkRzVHhHQmlj?=
 =?utf-8?B?REhlaXg1akd3dldNSmQ2dCtTb3Q0YU9zOHFrNnQ2eGVGSFVaS1dHcjdIUXBx?=
 =?utf-8?B?ZFFWV0tGNGRBc3dKMFV0NUZQSUdGSkRna0VEYlZXa2dxcVJabUgzSmlYMVVT?=
 =?utf-8?B?MVRGYnpzSy80NUNoSGY0WGlIRUI0cnBJYnZ3TVBDQlBCT3VXOWlrcWh2TzR2?=
 =?utf-8?B?RHQ3TUNpTmNmSXV6cTNLS0d6TW9FekRPZ2hYQTNwQUI0amZtTG5lUlN1MUpB?=
 =?utf-8?B?Z2wrdDZXUmFvL3BjblVzQ3RXWTdVekRYdVE4a04vTXk3YzkzazU0RWcwM1ow?=
 =?utf-8?B?aUxOQjZuVk1aNGx5YkhjVEcvcWZiY1p4V0VlWmo4eEc2cDg3d3AzM240YlVh?=
 =?utf-8?B?RE1RM2Ria1BzbjU3OWEwZktnUXIvQUVRZ1A3TmxKZDNJaXVqZzBHcTVBQjVP?=
 =?utf-8?B?QythTTBHWUNEOGtyTW00U1NtZmFydG41RStFbjVCeVFIR3pkY2Z0SUZZZ1JH?=
 =?utf-8?B?aGpxZGZYaTJEbmFPMVJXYTFrcjYvWVlSWHhBWitTaitqZHhsZ2xLc1FpQWhD?=
 =?utf-8?B?Q2xDeUQxamxienRXcFNHaWhTK29rR1hQNjNYNzdnaGtmNk9NR2o3WDBseWEw?=
 =?utf-8?B?d3JCNlljZjNyV0JrMloyL1k3RUY1MnZXU1luNWNIVDV4cFZSNU1HQnJrNXZ4?=
 =?utf-8?B?c3FKSXN1YlV0L1NSTlpCR0Zrb2FhUkFacjFGL0I5cUZUTCtnRDBCcGluSStr?=
 =?utf-8?B?QjQwTU5ZSHVsVXcwMWNzK3RvWkZkbk5tVHgwYWNka2c3YmphclJmbE5wTC9m?=
 =?utf-8?B?V3gzaWdGbWxraWlodHJtMGlGb1RvSFk5dENKZnBJazlNL1dRYWhjNThuRG4z?=
 =?utf-8?B?ZC9YMkZlYlN0SGI0ajQvWHozL2dUc1R2NTNDS1dyOVRMRWhSdW85SnpPeFNK?=
 =?utf-8?B?SFJpM2lIampabnp6eSt4NWJsYmU5NjFzTFpUSURFenVLR3prcTNvNXo2bE9Y?=
 =?utf-8?B?dEF2Q0IvTWgvMVVUalpqeFFUK2ZHait4ZEtaQW1VTDQxV2lEb0k2ZFkzSkV4?=
 =?utf-8?B?Z0o1Z2R2NDI5SC9HdnU5ZHRxNGRua0NoTW13UkRCMVNBUjNGSkJ4ZFoyKzhO?=
 =?utf-8?B?a0tHK2J4Q2ljT3YrckFQVmN5Z3ZXK2VmbS9jc3JJTGVPVThMcGtya1pZZVli?=
 =?utf-8?B?bGh6NmxXa3V2S1N0MXVCb1NndTZVMURNemJwNTlGcUFpcndyOFhwbDJTZytm?=
 =?utf-8?Q?/wXSXOIXmsY3CcHP/b?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	TO6fdN7qepbCeZZ020r81enAVM4yUWt+qWLl9zSlzv/JvsANR0uQA82c4mxjFwPDZG97X6gCxZK/Jd7YKePPhC14SvjFKIR4TsehfgLtVC/rFU5teHpl0+mYEPd9uFIYSdN2f9VnAJRuRqEGphaWqB0m6x50taU22RSmU3QKOYbOBYyC2wb+hJREBJLIkMhdtoBnVscXFrLF4QyaoZI9h9BxvFRvflF/gnr8qnNS62sTf5YBLD7auGKRiaJiISG0kWXgCP4AaUX2Z9fdK0orLSszJIrX/iH7Kgy0G2uaKqgafn9OKzcFa8+wy9qT2phMx6wNyvtoi9OABbyMSCDLpg==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11866.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c0d8df-0a10-4899-4c83-08de888e593c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 03:43:29.6133
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tJhqAZFnKKemqrfdsCMGmfvcalE+A3/lX+G2McmadHn7wUISfuepeSKg0th5st8qvDVV2HRO9QfZnDOdVwTYHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 03:44:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233695

SSBoYXZlIHN1bW1pdGVkIGEgcGF0Y2ggb2YgbHR0bmctdG9vbHMgZm9yIHRoaXMgdXBncmFkZS4N
Cg0KICAtLQ0KQmVzdCBSZWdhcmRzDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCldhbmcgTWluZ3l1DQpGVUpJVFNVIE5BTkpJTkcgU09GVFdBUkUg
VEVDSE5PTE9HWSBDTy4sIExURC4gKEZOU1QpDQpOby42IFdlbnpodSBSb2FkLCBOYW5qaW5nLCAy
MTAwMTIsIENoaW5hDQpURUzvvJorODYrMjUtODY2MzA1NjYtLTg1NjgNCkNPSU5TOiA3OTk4ODU0
OA0KRkFYOiArODYrMjUtODMzMTc2ODUNCk1BSUw6IHdhbmdteUBmdWppdHN1LmNvbQ0KDQo+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hdGhpZXUgRHVib2lzLUJyaWFuZCA8
bWF0aGlldS5kdWJvaXMtYnJpYW5kQGJvb3RsaW4uY29tPg0KPiBTZW50OiBUaHVyc2RheSwgTWFy
Y2ggMTksIDIwMjYgOTo0MiBQTQ0KPiBUbzogV2FuZywgTWluZ3l1L+eOiyDpuKPnkZwgPHdhbmdt
eUBmdWppdHN1LmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMTkvNDBdIGx0dG5nLXVzdDogdXBn
cmFkZSAyLjE0LjAgLT4gMi4xNS4wDQo+IA0KPiBPbiBUaHUgTWFyIDE5LCAyMDI2IGF0IDExOjEz
IEFNIENFVCwgd2FuZ215IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IHdyb3RlOg0KPiA+
IEZyb206IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiA+IC0tLQ0KPiANCj4g
SGkgV2FuZywNCj4gDQo+IFRoYW5rcyBmb3IgdGhlIHVwZ3JhZGUuDQo+IA0KPiBJIGJlbGlldmUg
dGhpcyBpcyBicmVha2luZyB0aGUgbHR0bmctdG9vbHMgYnVpbGQ6DQo+IA0KPiBFUlJPUjogbHR0
bmctdG9vbHMtMi4xNC4xLXIwIGRvX2NvbXBpbGU6IEV4ZWN1dGlvbiBvZg0KPiAnL3Nydi9wb2t5
YnVpbGQveW9jdG8td29ya2VyL3FlbXVhcm02NC1hbHQvYnVpbGQvYnVpbGQvdG1wL3dvcmsvY29y
dGV4YTU3LQ0KPiBwb2t5LWxpbnV4L2x0dG5nLXRvb2xzLzIuMTQuMS90ZW1wL3J1bi5kb19jb21w
aWxlLjIyMjc1MDgnIGZhaWxlZCB3aXRoIGV4aXQNCj4gY29kZSAxIC4uLg0KPiB8IEluIGZpbGUg
aW5jbHVkZWQNCj4gZnJvbSAuLi8uLi8uLi8uLi9zb3VyY2VzL2x0dG5nLXRvb2xzLTIuMTQuMS9z
cmMvY29tbW9uL2NvbW1vbi5ocHA6MTIsDQo+IHwNCj4gZnJvbSAuLi8uLi8uLi8uLi9zb3VyY2Vz
L2x0dG5nLXRvb2xzLTIuMTQuMS9zcmMvYmluL2x0dG5nLXNlc3Npb25kL3NuYXBzaG90LmhwcDox
Mw0KPiAsDQo+IHwNCj4gZnJvbSAuLi8uLi8uLi8uLi9zb3VyY2VzL2x0dG5nLXRvb2xzLTIuMTQu
MS9zcmMvYmluL2x0dG5nLXNlc3Npb25kL2NvbnN1bWVyLmhwcDoxDQo+IDIsDQo+IHwNCj4gZnJv
bSAuLi8uLi8uLi8uLi9zb3VyY2VzL2x0dG5nLXRvb2xzLTIuMTQuMS9zcmMvYmluL2x0dG5nLXNl
c3Npb25kL2J1ZmZlci1yZWdpc3RyeS5oDQo+IHBwOjExLA0KPiB8DQo+IGZyb20gLi4vLi4vLi4v
Li4vc291cmNlcy9sdHRuZy10b29scy0yLjE0LjEvc3JjL2Jpbi9sdHRuZy1zZXNzaW9uZC9idWZm
ZXItcmVnaXN0cnkuYw0KPiBwcDo5Og0KPiB8IC4uLy4uLy4uLy4uL3NvdXJjZXMvbHR0bmctdG9v
bHMtMi4xNC4xL3NyYy9iaW4vbHR0bmctc2Vzc2lvbmQvYnVmZmVyLXJlZ2lzdHJ5LmNwcDoNCj4g
SW4gZnVuY3Rpb24gJ3ZvaWQgYnVmZmVyX3JlZ19zdHJlYW1fZGVzdHJveShidWZmZXJfcmVnX3N0
cmVhbSosDQo+IGx0dG5nX2RvbWFpbl90eXBlKSc6DQo+IHwgLi4vLi4vLi4vLi4vc291cmNlcy9s
dHRuZy10b29scy0yLjE0LjEvc3JjL2Jpbi9sdHRuZy1zZXNzaW9uZC9idWZmZXItcmVnaXN0cnku
Y3BwOjQNCj4gODg6Nzg6IGVycm9yOiAnc3RydWN0IGx0dG5nX3VzdF9hYmlfb2JqZWN0X2RhdGEn
IGhhcyBubyBtZW1iZXIgbmFtZWQgJ2hhbmRsZScNCj4gfCAgIDQ4OCB8ICAgICAgICAgREJHMygi
QnVmZmVyIHJlZ2lzdHJ5IHN0cmVhbSBkZXN0cm95IHdpdGggaGFuZGxlICVkIiwNCj4gcmVncC0+
b2JqLnVzdC0+aGFuZGxlKTsNCj4gfCAgICAgICB8DQo+IF5+fn5+fg0KPiANCj4gaHR0cHM6Ly9h
dXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvOS9idWlsZHMv
MzM5MA0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9i
dWlsZGVycy8yMi9idWlsZHMvMzQzMw0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVj
dC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy82NS9idWlsZHMvMzM5NA0KPiANCj4gQ2FuIHlvdSBo
YXZlIGEgbG9vayBhdCB0aGUgaXNzdWU/DQo+IA0KPiBUaGFua3MsDQo+IE1hdGhpZXUNCj4gDQo+
IC0tDQo+IE1hdGhpZXUgRHVib2lzLUJyaWFuZCwgQm9vdGxpbg0KPiBFbWJlZGRlZCBMaW51eCBh
bmQgS2VybmVsIGVuZ2luZWVyaW5nDQo+IGh0dHBzOi8vYm9vdGxpbi5jb20NCg0K

