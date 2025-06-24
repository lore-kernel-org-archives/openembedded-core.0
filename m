Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4CD5C77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 07:56:06 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.36])
 by mx.groups.io with SMTP id smtpd.web10.3280.1750751756979066481
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 00:55:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=cUD6vcTO;
 spf=pass (domain: ericsson.com, ip: 40.107.130.36, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GwEKj59uFUff8bKVZaXvmJ0bGIjdCXHiL35ZbNa2zp98QqbJi9elADuKdPaZoKvAaIgN7mVFLZUhLE79H4/kCnV+ntiPKdC2Xc7+ldE6520GxI9HPsfD4++y4tKc03HDbKaLFjptdW4L7irvvA1ithOVgDLsTNmp6onqTZUQfYyZNFJVfwkrO2sPQnl02i1ro7wUAVZPwOy2F7Lu43uAKyyyzKWN2DnfLjFWR1MAUIb6/II77JET3BA3uMEqHb2SQoqtaE/ILOYLveLOKI69Bw1QXzm/REJOFoh5oWTvrk73tPVNClS0HoNS+PKOQBWvRB4CZoKw+TT00y1YVgT4cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHRZnWKvoTnATRsBZYJ0H7s8sZekanKc2I++d1YT99Q=;
 b=KtL41LTzWsRqNkz19lxtJNLzwcC4UrRtwK/Ik5yeXf/ZZDkMp/eyhS51vksHG4vZUUIWbc4Bc7mUVsb3/Nh2NES3Yae7l7ortC/DwYErU1BqoPrmO0s6owYsF6oIVvbesB3HvblYYoc6TXLXat1/7BiNjfiFxwrxSnUqUS9nE6oOnuqlAQGKaMKP6p/67YnRMo9OO7DyCVJYC+V+R6523Mlln9ko2wvq1Hh7sCKIZYRtblTVXVFBnrpwDqginTQp+iVIcroMsSJff5r9t3arK9WXEsY4WusryupO0FEc7/p6Fv5k0+HXK3lKyVpRfms3Iw19Uosu+BV37pTobs+SyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHRZnWKvoTnATRsBZYJ0H7s8sZekanKc2I++d1YT99Q=;
 b=cUD6vcTO9UCy46G9zAEpGFUSdVWUhVBzmUYVT1Y2fQaQMGjHWNGx6iFoVofxNJJTBElw033N7Z7SLpZp0fhXEQO2fWfOUAwNP8BsWo/FI5DnY6zJO0o+VdTqTLvgyP1wghpo1msNN+Jl5nTqSWQGElqH7i0GrsATTle6NC6L6YTKgnG9Epxrdt2Em+jYv1ZxcKEoMx5jr2BYxLlIqnr3wWBf7gp0oV+SnSQpZP37z3qyaDS2nSdvpHbq9lMPTOeyvuKdEpcPjUm16EA6UhGEFc/JbtRp03YGk/aHd16SnrEwt51sbwcMI2KcSZTOFxdRHS6k30+YzgzHUsT3LAcdzg==
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com (2603:10a6:102:61::16)
 by AS8PR07MB8342.eurprd07.prod.outlook.com (2603:10a6:20b:441::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Tue, 24 Jun
 2025 07:55:52 +0000
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b]) by PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 07:55:52 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Steve Sakoman
	<steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>, Yocto TSC <tsc@lists.yoctoproject.org>
Subject: RE: [OE-core] [scarthgap][PATCH 1/2] package: export debugsources in
 PKGDESTWORK as json
Thread-Topic: [OE-core] [scarthgap][PATCH 1/2] package: export debugsources in
 PKGDESTWORK as json
Thread-Index: AQHb4PbW2NffJtzwFESr9CHHwmXEZ7QKml2AgAawnQCAAK1YcA==
Date: Tue, 24 Jun 2025 07:55:51 +0000
Message-ID: 
 <PR3PR07MB66662FD0DE13B9DA92F1E75C8A78A@PR3PR07MB6666.eurprd07.prod.outlook.com>
References: <20250619084736.1940747-1-daniel.turull@ericsson.com>
	 <CAOSpxdaq52nk4PmHEjnm3P2yc4EPh+A_JEAgewbLHeQJtgMotg@mail.gmail.com>
 <a041e18e26dc44c399aa86b6c8ecef15eb3dcbaa.camel@linuxfoundation.org>
In-Reply-To: 
 <a041e18e26dc44c399aa86b6c8ecef15eb3dcbaa.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR07MB6666:EE_|AS8PR07MB8342:EE_
x-ms-office365-filtering-correlation-id: a38983f2-f05f-4bd3-f29e-08ddb2f48a69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?WDI2Ky9xd2FybXZkZ2o2Vk5FbFJjY09yVFplcUhYamRxOEZRcTliNjlNdVJD?=
 =?utf-8?B?OEdTdFNZN1N0dFJwcHYrdzhsSlNlMzgxN2hUaGpwVTNVNkZVd2pGc2VoRlhQ?=
 =?utf-8?B?MVczb3E1RHQ2ZXFyK0svL1V1dHhvK3MxSVVQZG9MQmp2OXUzZmgzalBIRUx4?=
 =?utf-8?B?S2luelpXdkZ0UzNjbUUreldId0RvQmg5bzVHd0JNcWpIdURzSEdNdTBGUUUz?=
 =?utf-8?B?N1p5MElBNThpVmNhZUI4V1V0TGV0SzVCZzUzdjQrNHFNbnFTMWpCZTBCR1pR?=
 =?utf-8?B?cXhscUIyNS9GODJZTFZFTG9nbXpheTRtRGd6NU0xdjExWGRXeVYrcVhjaUtB?=
 =?utf-8?B?SUQ3M0V4bTRxK1RsbG45eGtsSlpmSG0wd3MvNHVTdExaM0FJckVtOE85anBE?=
 =?utf-8?B?Mlg4Ty9pek4wVVk2bzNXMDNoTzF1ZnhtWWhreXptSDVFUUd1QThESWRUeUJz?=
 =?utf-8?B?Zk02Q1NqdWJndzRGL1RobGV0d3ltNXgvdnd0OFNqaG9NL3QySmxGWFl5MDdu?=
 =?utf-8?B?eEdkM1R0c3hHYTYwaGJtMmxIZDg3RXBmRFZlV2lSUXJZS3VaM1lJTGg5MXFB?=
 =?utf-8?B?YnVLdTlXaWRPcjduY1JDRTFrVlEwSW9KS0pteVViVjJjMjQwdFBsM2xYejZC?=
 =?utf-8?B?d0xpc2o4OG5aeG9WS3pMazdPaEtzS3Zydkw1Z2dQN2RGczk5aEkxLzFHTXJx?=
 =?utf-8?B?R01XSkowOTUyQTA3ZnVUNzJQVzlpWTk5cmlSTTJrQVAzWDdsYXlNcVhpZXAx?=
 =?utf-8?B?R3Yxcm9tTzNiYXExMFJEc09xMzlJZjZQU29jRG5kOElmMHFvWVhVWld3REtH?=
 =?utf-8?B?SnJ3V2lqOHVBTHpnQ3F4MDZ3SW52WEtIb1pia1hJZ1QrMUFEOFhJLytGWExO?=
 =?utf-8?B?NnFONG1XZ2tWdkE1M09uUkdtRWtBYW1GSnFIVGlRNCtXM2VBait0ME5IckpZ?=
 =?utf-8?B?NjFZYy9XOUdkazdYMUw1cjVTb1B4eXphb1FneDJIMU94bmFHQ21ybUh4eWha?=
 =?utf-8?B?UmkxdG1tU3RmMXpselBvcTI2Rktxek9BN1IrMjZqMEdtcmQxc0E5ek4yZHZa?=
 =?utf-8?B?K3hZRlM0NnFVZXRDQUNieStBTEg1eUVkN2d5bnlPcjZyWXB0S3hWTHZRbkJB?=
 =?utf-8?B?eEh4UUp5Um1ybkoyVkFMVzZVbXlINU8yMTA4S1dQencxUnFjamR1NXIwSG0x?=
 =?utf-8?B?N0lKVHl4YkROdzcvcEc5aHo5NDhzeEE2MjI5QmpKV2xLMWhmT2h5bjNueUtW?=
 =?utf-8?B?NXNTeTlpSXM1bmhaa3FqbnZJdVdKbkNTWXRkaVJyeGtKZENEbkpPUWNQMGdP?=
 =?utf-8?B?VUJTZi9xNkxxNXREcnY3ZjBDUEMxeGFrcEFVNTFkaWVsRWZTQ2JxV2JhMEx6?=
 =?utf-8?B?M2txZk1JTXhqMkhiNW9yVFhOUmRxY2QxWEQvYUtTNTlFT2VQYStibEJJRGhS?=
 =?utf-8?B?OUlYWmZzT2drMURVMWxYcSsxOGx2L2hNaVFJWnBIbC9zaDJyamYyQ0xrcEp0?=
 =?utf-8?B?cTUzYTM5dHNLaktiMVk1MzR4K3F3Q25xWCtac2JOczRNa0g0OGRYWHZVTktQ?=
 =?utf-8?B?ZXFUQ0c4OTkrcldBeUhTdXNNVHFqNWRvYnBGSkNJMHRLdktMcFpMTTdlU0Fs?=
 =?utf-8?B?YjNnMXpFSU9DT3ZmbE9XYVpGWHB1NjMwTGFUcFNYZlZQdkNsNE5SYlRWVXFI?=
 =?utf-8?B?UkdSOHdheC9HUXdTdEwzVHFyc0NjdTJiVWdud05BT0QvaUs3Ulh0V0NHdytr?=
 =?utf-8?B?U0U5Uk1PeG93cjJsTGNJdzBmTkpCVGdvWVpzTWVhUEJpcmptZy9lNlprSzZh?=
 =?utf-8?B?MjVVcTZOdHg3bDkwR3hCMEs1cUs1Vitkc2VzbEpVV0xMS1NzbXZzaEhaa0x3?=
 =?utf-8?B?enpPRWtNeHpWYXgvTGc2dTRMVExNYmtxamVGSkk4ZmptTEZWMnliQ2RIUE5k?=
 =?utf-8?B?MlFtZDlFS0xNVkREaEZoVzE0alBWZkMrVDVrQStoaElPVWxRSjFWcy85US9j?=
 =?utf-8?B?ZWZySGtuWEJ3PT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR07MB6666.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?KzBDb01ZU1ZkNEFucHQwazBjZEdGVUtCVjYwVURuODloZ2l0L1Z1RmUvOTZX?=
 =?utf-8?B?d3RLTW1zbnB5bzRyMkpsYXlEZ3VmbU90cC9WcDliRldPbUdtc3p4S2tFeDg2?=
 =?utf-8?B?eDNycnY2Y2krVEZMYjg5MFcxeHdUak1aNE42OFRKTkt4VUxtUmd3UTc4MW1K?=
 =?utf-8?B?b1VtbVJweUtOMEc2RE1tTjUwR1k4TkRDUEc4aGVTQ3dVc0p2NmRIa0dBVW5N?=
 =?utf-8?B?bDVIT3RQVVpaWGdOeWJ2OGN6cllLVlNyazhpaUVVYnlFTjI4WDVKeTlIUHZh?=
 =?utf-8?B?eWRSelVxS29YTjE4dlZNcGZFUkVoR3J1RE4reTVSTWN2K2RUWE1wdXpPbFpX?=
 =?utf-8?B?NG5vMmhpSkxUT2NnckIvZEJLaXJEUUJMMXJPRVdmOHdzZXNIaFU5TWRiYmZC?=
 =?utf-8?B?ZitWdkNiQ0ZaVENPNldMV2NPdFhKdmxGQWwwUGxkR3UrTGpOZGM5ejRMZzgz?=
 =?utf-8?B?V1VJa01Cb2hSd3BPTTNtNGc4S1JCVzczRGxJLzdkYWNEZGk0dHdrOVRFWGg4?=
 =?utf-8?B?UFhYU0Z5bjV6VnM3WHVGVWZIVUFMRjNqOG4wMmdQcmNDR0lraU9RcndFRnhC?=
 =?utf-8?B?NktQem11dlBjcjB6YUVER1dFL2RCeDJCWDJBbVdyaDRkcTlZMDhib29JekYw?=
 =?utf-8?B?dVAzMVE4em9xQ1RzbW5tSDF3dkRHeXZrK3pJbXIva0puckVRR2NsR0szWjgr?=
 =?utf-8?B?WUxIdm9VOURRRlBOeUdYMTJlNHlwUVlzdVUvOXh4T0hrYWJvVElkUm0zUjNv?=
 =?utf-8?B?VHMzUFIyN1FJVFZVaXNaeGw2UW9VbktTM3lCcXZwSXdBT1VIOGRCUkZZcWNv?=
 =?utf-8?B?SDc5bVJKMFF6aWswWEJsMG5hbnpETFNzaFBGbHB1RFZVME44dzgxUzdZWHlv?=
 =?utf-8?B?eG83aUdNa0x2RmhZakRYTGE3V2wzTFRIS1ZWQ0NaOVA2anBjMXlCWnBjZ0Z1?=
 =?utf-8?B?WU1sZFdJY3hUUldiL0h6a2xVbDRTRVpieE05eCtEdmFHUmQ2MmplTkxsVnY2?=
 =?utf-8?B?N1VlNGNMbk5nY3B0OEhUckNqMVdMMy9zTlljV0RjcDBVSFBnVkxSS1VWcEd4?=
 =?utf-8?B?dXpIU3oyRkdvdElJRW8wVDJ1RndmZ3N3SHg3SFFiem5KQWVsY1dQKzJIVGk1?=
 =?utf-8?B?UmNNY3RXSStMQ2lINFFac0lwR2V4R3BKc0RSaHkraHorZFVBSU1aS2pWTzU5?=
 =?utf-8?B?YmNTbWhSRCthc25CU2JJM2FXZkM0VFhaWkwyaUNuN2V1NWs1cVNJR2ZkdTcw?=
 =?utf-8?B?RmV0U0ZTUmVkaWVuUTc4S0wwYTNydisvU1dMaEd3ZnJZNGhNd050QnhhYzVI?=
 =?utf-8?B?bjQvNGkyS0FLejlKR0xjcnp5bEtXcVRiKzF5ZGNsNHNuTzdjQTFWdW1pZktU?=
 =?utf-8?B?TnBpWlEyWHp5NzFudDdVRys3N3hOWXlyOEZWTytsR0ZHdkhsdzlOZVVUc3d1?=
 =?utf-8?B?OU9tZVhBRW9VUXpCQWZvaDMvOTl4emxJVEI1TldackpSeFlYaUY5TXhINjZJ?=
 =?utf-8?B?L2haOGdQQ1UrUnFCZUttME1rbVdMQm5VZ3dGcE42QUhIa0U4TFY0TkZMOFRF?=
 =?utf-8?B?Q0RsTkZ5Tmd4M0JBZU9MVDRoUE1vY04xN3RJcEo3b01LdEVVT2NBT3p3REtk?=
 =?utf-8?B?T3N6YkYrZXpOT2pFNmdiOGVid0tmdUpNTWZZdEN2NDhRZ3BCeFFxZ1E5Z0Fv?=
 =?utf-8?B?dUV4U1kyem9teUEzOCs1VWltRWlMVlN3QlFoNVA1alprY3VxRHovVUdoY21E?=
 =?utf-8?B?eGxidmNYcmFMRnBiNmhud29nSzdLd0pZYU44Nm5YQjNhQ0I2RlBnYWo4RnFo?=
 =?utf-8?B?RHZIUkZIemM4Q2h3NzJpd0J5bEhkcUgwaUFWaERpRHV4UVlJQWtZd01vcU92?=
 =?utf-8?B?VDBCaW5WaVRHYlBMUUJoNVk5UFY0c2UwZHYxdGtuSnN1MlZVV3RtNml0c29l?=
 =?utf-8?B?bjRwMGU2MkZ0MmxSb2t3dXF2TjhUeUZzN1FxenlXZERYeXd2aDQzdTRUUVFi?=
 =?utf-8?B?TVNEeVUwbXF1MVhDQ29EN25BQkZrZG9NSExNUzZjVFpJaGswV2pEWXBoTmQx?=
 =?utf-8?B?TFppcFpIZjhKSmFtUEJySVl0TGM4ZGhjYmRlVVhmcnFRRzI1UXVSSnhWZnBt?=
 =?utf-8?Q?+iLfvdBCUuJhONMjbPJ2mB8we?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR07MB6666.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a38983f2-f05f-4bd3-f29e-08ddb2f48a69
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 07:55:52.0249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KqO6i2Pdj+F1UdF+hp49B1CnW8WoxW6VQmt9X3RRxuoBhUaAZdbv3Odqbxl7xr6+xYC2bTgIwlBMshWfKPJvtelKIROM5onr0DtYBUfXt8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8342
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 07:56:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219232

VGhhbmtzIPCfmIoNCg0KQ291bGQgSSBzdWJtaXQgdG8gc2NhcnRoZ2FwIHRoZSBzdGFuZGFsb25l
IHNjcmlwdCwgb3IgcGVvcGxlIGNhbiB0YWtlIGl0IGZyb20gbWFzdGVyPw0KDQplNjBiMTc1OWMx
YWVhNWI4ZjUzMTdlNDY2MDhmMGEzZTc4MmVjZjU3IGltcHJvdmVfa2VybmVsX2N2ZV9yZXBvcnQ6
IGFkZCBzY3JpcHQgZm9yIHBvc3Rwcm9jZXNpbmcgb2Yga2VybmVsIENWRSBkYXRhDQoNCkJlc3Qg
cmVnYXJkcywNCkRhbmllbA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiBT
ZW50OiBNb25kYXksIDIzIEp1bmUgMjAyNSAyMzozMw0KPiBUbzogU3RldmUgU2Frb21hbiA8c3Rl
dmVAc2Frb21hbi5jb20+OyBEYW5pZWwgVHVydWxsDQo+IDxkYW5pZWwudHVydWxsQGVyaWNzc29u
LmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7IE1h
dGhpZXUgRHVib2lzLUJyaWFuZA0KPiA8bWF0aGlldS5kdWJvaXMtYnJpYW5kQGJvb3RsaW4uY29t
PjsgWW9jdG8gVFNDIDx0c2NAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4NCj4gU3ViamVjdDogUmU6
IFtPRS1jb3JlXSBbc2NhcnRoZ2FwXVtQQVRDSCAxLzJdIHBhY2thZ2U6IGV4cG9ydCBkZWJ1Z3Nv
dXJjZXMgaW4NCj4gUEtHREVTVFdPUksgYXMganNvbg0KPiANCj4gT24gVGh1LCAyMDI1LTA2LTE5
IGF0IDA4OjIzIC0wNzAwLCBTdGV2ZSBTYWtvbWFuIHdyb3RlOg0KPiA+IFNpbmNlIHRoaXMgaXMg
YSBmZWF0dXJlIGFkZGl0aW9uIHRoZSBUU0Mgd2lsbCBuZWVkIHRvIGFwcHJvdmUgaXQNCj4gPiBi
ZWZvcmUgSSBjYW4gdGFrZSB0aGlzIGJhY2twb3J0Lg0KPiA+DQo+ID4gSSd2ZSBjb3BpZWQgdGhl
IFRTQyBzbyB0aGV5IGNhbiBhZGQgdGhpcyB0byB0aGUgYWdlbmRhIGZvciB0aGVpciBuZXh0DQo+
ID4gbWVldGluZy4NCj4gDQo+IFRoZSBUU0MgZGlzY3Vzc2VkIHRoaXMgdG9kYXkuwqBUaGUgY2hh
bmdlIGFkZHMgYSBzaW5nbGUgZGF0YSBmaWxlIHRvIHBhY2thZ2VkYXRhDQo+IGJhc2VkIG9uIGV4
aXN0aW5nIGluZm9ybWF0aW9uIHdlIGFscmVhZHkgY2FsY3VsYXRlIGR1cmluZyB0aGUgYnVpbGQg
c28gdGhlDQo+IHBvdGVudGlhbCByaXNrIGFuZCBpbXBhY3Qgb24gZXhpc3RpbmcgdXNlcnMgaXMg
bG93Lg0KPiANCj4gV2hpbHN0IHRoaXMgaXMgYSBmZWF0dXJlIGNoYW5nZSwgdGhlIHVzZXMgZm9y
IHNlY3VyaXR5IGFuZCBoYW5kbGluZyBDVkVzIGFyZQ0KPiBleHRyZW1lbHkgdXNlZnVsIHNvIG9u
IGJhbGFuY2UgdGhlIFRTQyB0aGlua3MgdGhpcyBjYW4gYmUgbWVyZ2VkLg0KPiANCj4gQ2hlZXJz
LA0KPiANCj4gUmljaGFyZA0KPiAob24gYmVoYWxmIG9mIHRoZSBZUCBUU0MpDQo=

