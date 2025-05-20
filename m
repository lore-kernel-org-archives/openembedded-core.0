Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00790C5479B
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 14:12:43 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.83])
 by mx.groups.io with SMTP id smtpd.web10.21874.1747750361039470158
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 07:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=qjlcLjLJ;
 spf=pass (domain: siemens.com, ip: 40.107.21.83, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IwZ/r5aUU8W/KHL7xH/4GkVEhMwpBleEjqIkStx+LoOznlHKgMrSv3f4P0q57t7PTxG+9+iPj2yG3xzNanLXbmqBhx1yAtXD+CuXlqkpfw3/bVyKSYC1Cso4FBNmFAdax8v7weoDufLQgDtdneRpXUOxVJPAYcQ/3HkdLyFJThAXckAV6fuGuR/JEUFPA1639zAqx9axdUAcMBqH+x/W4cdESOxYYobp+DtnIkYRGQfdnzZaBbxCoVzhSn5Hh2/a0j/g6xw4SjV0kxqPWpYcpmItA5kX7Qwzri5ofQOPogLWKls+1jFOmkVsyuB4N7IzicIvkGqjMy0eV9xXydrk2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4j+yUBRzFmbgiVzTPI6CGmTsCbSvf9ND/P8i7nv75k=;
 b=WnbmfMnU8VzjRQ1y6s8OBjK9uRCLJ0WC8i6Fh9F8+rxCbHvy8Tqutmp2+mSlItDt/k2QLqD33Rr8akNLO3g0OTJUG13KX2y5wcwABNeIPy9fGjdqzLSMXq3JHSF5ZVmmewwBUa59HixgtZuihwKMO446qbhyPA9u+vD05UqYl8gNeJaNlXZS1LADEtpIJwdFrQhkNsR0a3TyQHtw8kQQtjtOHlCWy3PorHhoiQOsy6TXUSmln9lwAv+3tuazGH37cNMdB5CG+C8RxgOq7csYKL8QZS7vLL5UuzF//sCeai1YUa72CSM/fwSRMmQkczP/Po4SMa+PdqVRQgXuJJlm2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4j+yUBRzFmbgiVzTPI6CGmTsCbSvf9ND/P8i7nv75k=;
 b=qjlcLjLJhAo0oKwsEEdWscEQaKktyKkVJRt24rv9eYJGQcVE4psfCoXwhXfpvKxADFHwiPeTqejK836GCS0+APKdupscit0IFrtAv8XRJ1Zql5IgNXhoDaghtQT1KeDqBO454HNc2V5xt/clE4wS0WJZuSnxMlxNhfD+bmJRNx3VYxJ1v446OL9Hxu/Dm+acf+9iUhBiTuhiabABIGOakLbcvkzQOuU4YW9LNp3sth+1doASovi5Ur71ic1CsuNx2YfUHYQ1uRnIpmwOwWT2Hih9kbfvjKJNPGbVTJN0+VWsvMr+cV/uLAGG1vzHzVaR8gZE1+3hb/aHfySGZt0/0g==
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by AS8PR10MB6246.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:54f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 14:12:35 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda%5]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 14:12:35 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Marco Felsch <m.felsch@pengutronix.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "marex@denx.de" <marex@denx.de>
Subject: Re: [PATCH v4 00/16] FIT image improvements
Thread-Topic: [PATCH v4 00/16] FIT image improvements
Thread-Index: AQHbyK5q6RzfcGjRfE2hPioA1wgnL7PaVESAgAE81QA=
Date: Tue, 20 May 2025 14:12:35 +0000
Message-ID: <00604ae09cb8ef2022d228df46d39282a4ff42a3.camel@siemens.com>
References: <20250519110838.82978-1-adrian.freihofer@siemens.com>
	 <20250519191835.hxcmtjxrgpm2lybs@pengutronix.de>
In-Reply-To: <20250519191835.hxcmtjxrgpm2lybs@pengutronix.de>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3529:EE_|AS8PR10MB6246:EE_
x-ms-office365-filtering-correlation-id: f7cc1432-a0a2-4253-058c-08dd97a85ec0
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?SjZDRTJZT3hETTZiZHA2dTdzMTdEa1ZsOEVTTldxOVdOYkZ6akQrUEh4bVhn?=
 =?utf-8?B?S1hvb1liUDd1dHlGcFZHaVNqeG4zZjRlQ1Rva0hackMwaDlkbUVuN0U0V2Nn?=
 =?utf-8?B?bkxsUkFzUkVhZ3pxbXRuV2tlQ2IvTHlkYU00cDB5TEpZSFBPU09SS0IxV2Zz?=
 =?utf-8?B?eDZjUnJhbGlYQ0pMRzQySFFJbmpRdU1vOVQwWm9OQzF6UXdzOTV6SXNiK0ZJ?=
 =?utf-8?B?VVFlT25CTTF3ZHArdjAyN3RtUnFBZUtjdy9nbWVrMVdEMVVnYlYwdFJhS1ky?=
 =?utf-8?B?VGpEV29BRi9ieEVzS05hNXYzOFFBcDN4aHV5OWtQTnhTdGFEUjV4SWhhRFcz?=
 =?utf-8?B?NjZ1VTgwdTZNYlhlYkJvUm9qUTc3OUY0RkhTd29yc1Q5ZmlucVh2S0YwK2pX?=
 =?utf-8?B?dm4xU0daNm5XbFNrQVIyYWM5VSswRW1ENEhISmF0eFdEVGxlU1BqTitHWkFX?=
 =?utf-8?B?NXMzRWhIY3BPS3RjNVJmbnl0alk2a2hheUx2RHJJYXdCYTUwMGNPRWJwaUZH?=
 =?utf-8?B?ZjJHT1dYK2FTUm9xZTcvNC9SNDdjaXhQZXY3UG5qcWZYSXJEaEMxV3BrQTB6?=
 =?utf-8?B?ODBsdWpDUDlOQloySlROaFZtMkxJTnZNczg4R2hyVWJ6ZUhIYk9KQWR2cmIw?=
 =?utf-8?B?aWlpM3lmN0NwYlBGVTBiWCtUbXJITEtNMFppTVBkQVJNSk5Rc2pTOTBqYUx5?=
 =?utf-8?B?TjVUenhiajk0OTFLYmh0VTFTSngwa3ptNWZublVOSXFSSWNRZEM5dk5zTSti?=
 =?utf-8?B?eEVncVJNTEc4TnFZOHFwVjdJcW9vNjVtYzd1RXlmbnVtTjZaNWhUL2kvM1lz?=
 =?utf-8?B?SjJSUTVKR3NIOFVXbkxMUDZUSmwxZ0RrR1laQ0oxWVB4OFVPK3ZBcUhQREJv?=
 =?utf-8?B?OHdkc3psUDRoV25uV1RWZzlIVGE1aHU4MDkvQkRPWGg2aGFNaGxnMkJ4ZFpN?=
 =?utf-8?B?MnJIWDBjUGNoSm5FQnd1NWxOdks2WGRxZDZTU0NiaStJaWxvSzJCRXZnSk92?=
 =?utf-8?B?ZmNuVWFvbkppQjc5M2lsYVZMU0xSeTVjclNFRmE1Ky9WdzZuWXg3U1poTjBI?=
 =?utf-8?B?QW8wYXZNQjl4OUhkanNrc2JYQXRGQWVYMG81eVQwK2h5Qyt2bkNhSTczWkpH?=
 =?utf-8?B?czBXYjlYVkZHaUsrR3Azb3lpSDg3WXNCWEpIbjNiT2l0UndpQ2R2cUowc2Vv?=
 =?utf-8?B?djJHcW96UGduK2xFbkh1ZmFtMHd5V2gxZDhvQ1NmdzkwazZMdmRCN1ErSHhX?=
 =?utf-8?B?THRvdU1aSTlxbk1lU3RyVWl3RTBzbTZCQml6UGx2M1dqaUtHZStSS0JYOSty?=
 =?utf-8?B?OEFWZ0lieVpvWmVNTFJ3cDRXd2tLaXVNZTU3b0ZFa3BYUjB0MWthWnBoNnhk?=
 =?utf-8?B?U0RZWjFIZmNTVWw2MDhWZWxvcGp3a3hPSCtzWE91WWJRUjUzWVZKRmpjZGJl?=
 =?utf-8?B?M3VpemNaVFd2ZHhIY2o5NUx0VnNHSWI0cUc2VU1BTUw4QzlCbHliZ1FTOWxp?=
 =?utf-8?B?d3JoTk1BSkxNVDFDcFUzNkJGYUdPMzdBNkt6NVh6bkYxMityMXFLd0J4OUo0?=
 =?utf-8?B?UkQ0OFplRElUZ0xobURTcmtYUzFkMlFqRmZqV0NjNXlSWjZHcWlOalZiMldo?=
 =?utf-8?B?UlFMamg1NXR2YlhlMDV5NjhmbDlEV2ZGK0N4SlZrcDFyNUF6cjdTTFJPWDc1?=
 =?utf-8?B?OERjY1N5cGNFOW0yQTR0ZW1CSjdtTTkrOXY4Ym5YWW04ZkgzL1YwZHlOR1Q5?=
 =?utf-8?B?YjJGb3JyQXNtckJUVTBkTzdUZmxJS0R6YUhBUUl0SDNOaUx5L3hkWG96UjNi?=
 =?utf-8?B?ajZ1OVM1eXplM3J2emJJSkt1bnBGS04zRjJRcVRtcFEvaU10UDZJSDJ6N1hE?=
 =?utf-8?B?Sk9wdVNpZ0p5Um5lc09kMVVwaXpMUXVJUW9DTlJzbDFkekZ5Q3dLQXJlc3A2?=
 =?utf-8?Q?3f9iUiTwloQ=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZlhBdUpJSzlKakhEWlJOU2xXWFJXQm94cUREV3pUMGtRVDc4dVlQMENWV0Vr?=
 =?utf-8?B?MVUwUG00NDU2SmRBSjdiOGh1U2dlWjQ3dDBwSHE3QXo3TTZ1aEtwbWFmSDZJ?=
 =?utf-8?B?SXVxcGJmWGdjNDBFTFRvMUFOdkVrU28rTVpleC9ZRGtFeXI3TUVjcG9GaElS?=
 =?utf-8?B?MHRHRHoyT3A1ZWZYLzhsZlNDVWw3azZVUU5IbTFZOGkzYTE4eE81WVgrQmRZ?=
 =?utf-8?B?eDVYQ0xWVTJVdUR0ODNyWmZVM3U5ZUMwMlRQUEJyYnRRYS8vWTRnZTlGanND?=
 =?utf-8?B?clBwdDY5ekc0OWkxVmZGQXBIdytLTFE4Q1ZmKzBMemJhYlJLRURHTElKTzY3?=
 =?utf-8?B?OVlDZmFUNUs2a1hSall2Q3BNVGlnMlY3RnNYdGs3TFArUm5uWVh3VmMzNito?=
 =?utf-8?B?NmtHU2Nnakt5SWgwNE0wb1RKVmhaVnFkRTd4M2tNS1kxcktocnZmV0t0TDla?=
 =?utf-8?B?RzBKVXRPQlNxSThWV0praXNtYmRPS0FhK1VvK0ZkdGlhWXk4ME04UGlOdTNk?=
 =?utf-8?B?VWY4ZFlVNUpuc2NoY3UraHJUdWJFYWVzUUhQQ3FqMmxIR2R0c3dmTWl6bDlp?=
 =?utf-8?B?UlVpd2RkNHA2NG40TWtMbkl3elJ5QklIaHhiQVR6NlhBWndqUk9QVi9yWHA2?=
 =?utf-8?B?ckVONXllTnJueUhxUUZlQ3o4OEN6Vm1JZ1FtaFlNc0tGVTRxUG5MNmplZmtR?=
 =?utf-8?B?Y1lJOGtiY0E3TFJkbWJuVXpBeGx0dVVmemwyc0s2THpScXBDbWxDV0cyU3Uz?=
 =?utf-8?B?VXVVNzhnZk9YTW40dWFXaTMzK0ZsRmNiSUdYQjRiSVAzbXdyOXU5dkpla3dk?=
 =?utf-8?B?WDE0T3ZOSzJhQmZHMXRrbkprMFREUEQ1ZHp0ZHJ3TmdwcU1HL2dYOFltelIr?=
 =?utf-8?B?V0U0L1VwN0tBVjc3WTFLeWhQaGJ3aXlIVEw2bnMvZmdtaUxBakNocHY2a2Zw?=
 =?utf-8?B?R3oxZmRuanF0N1VaR09IQVR0VU1KZWxKb0d5TmVZQ1BqY0FwT1prWUg2UmR0?=
 =?utf-8?B?Umgwb2hKNjg4Szg3OUJvQ2pPRUdyN1NMS0ZsYitqUWpsK29JR0JuMUFuRllh?=
 =?utf-8?B?R1hIRDg5ZUtRejJ6c3Q5N0ZLeHV3YUpGaVlsYnROZVJ4NjczdkR0d0g4bXRZ?=
 =?utf-8?B?VjdiWTJvaXYyQmdZZS90OTBDY0pCSkhPcmZEcFlBdGJpU0VJRWw0NEFyV2Y3?=
 =?utf-8?B?LzltbGFic2wveXlaUUFrTkw1eGVIWFQ2UU90OGhtWC9Ec3dTUVpKa0RZTGIw?=
 =?utf-8?B?ZXJCMzJybmUwOVVBYUNUUFdDOU1OSUVkeGNISC9mVlE0aE40cERIK3QyZklQ?=
 =?utf-8?B?OVpMYmxabk8xNnZUMW50ZjdxTkF2Q01JdEVuN0dTSWFQc0ZKQjRiVkdNcWQ3?=
 =?utf-8?B?VXQ1SDdObWtaS3d5RVh6TGJ1T0d5RU5VdFB3cmc0UCtzb3haQVVyWCsyZmNQ?=
 =?utf-8?B?bldSaVRiOGduZ0tvZWxzWmRvSVkvYjZJSlRsS1NLR0hSMEZxeWh6dmtIdTdl?=
 =?utf-8?B?RFNOQTZvY1BsWmQrOWxSRVFGRTZFNlo0VGd1ZHNYTmxVYmpFZW1EcWlETUFZ?=
 =?utf-8?B?ODFsR1NHWVI0MTcvOUZhdVBNZkJyZUpINWxpdDlOdXZUdHdnTkxFVFY0M0kr?=
 =?utf-8?B?aW5xcENzWVlBSnZlWWdmRURNZ25UTTVZeGtaenoyRkJOVmtuMHgwdVhCdjVM?=
 =?utf-8?B?TVhUdnB6bExXb29ZNXl1b1VlelNDUnV6Vlk0T1dnL28rUWVkODkxNWYyQmpK?=
 =?utf-8?B?QXBoU0cvUXVsc01VcmRSNTNkOGNnWEE0SUtQaXRaamd6dEhDalhOVTlUa2pr?=
 =?utf-8?B?SnQ1SkZaVjBvNTEwbHEzUDFja0JobFZhNWEwYkNSR0RnRDFGa0pKd2ZnTEtG?=
 =?utf-8?B?M1RwN29SNjloc3FJclRPdzhVU01JdmZJS0hHdVcvOE9oWW1ZZHdxcXBWejJZ?=
 =?utf-8?B?b1NMQTRucjJLK3hxVmF5TDBLeDZQOGsyOElMbnBnbVlSS2w5UkJNRDhxYUVV?=
 =?utf-8?B?ZzZFQUxSMlBQOHVIcjliNkJua0IxSDhidW0xL3RlejEza0FkV0s5b0dkQ1Ax?=
 =?utf-8?B?Rm1NRVZwMTBrcmxaS0VBZGhudGNYWGhBQ0h3aU9JdXNaNTBtWEJ3SkRqTmZ1?=
 =?utf-8?B?KzkwUEJNR09mWGJaS1FCS2FReUxFa3poMGg4RHZiSHZmbWs5akNaQ2VXQlBa?=
 =?utf-8?B?b3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FEB3665AE673454FA526FD58F2E72B81@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f7cc1432-a0a2-4253-058c-08dd97a85ec0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 14:12:35.6354
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rmCa9sT3r5Qc8jGMqzg7QD42uSxG3VkTfdaa95KlfSr0u6DdeVYoqVNhg/zH7PsMYgZ02JBYHdcdbxqj014MUpCyPkhJTVs554aTgVCiHtg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6246
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 14:12:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216917

T24gTW9uLCAyMDI1LTA1LTE5IGF0IDIxOjE4ICswMjAwLCBNYXJjbyBGZWxzY2ggd3JvdGU6DQo+
IEhpIEFkcmlhbiwNCj4NCj4gdGhhbmtzIGZvciB5b3VyIHBhdGNoZXMgYW5kIHNvcnJ5IGZvciBq
dW1waW5nIGluIGxhdGUuIENhbiB5b3UgcGxlYXNlDQo+IGhhdmUgYSBsb29rIGF0IG15IGJlbG93
IHF1ZXN0aW9ucy4NCj4NCj4gT24gMjUtMDUtMTksIEFkcmlhbkYgd3JvdGU6DQo+ID4gRnJvbTog
QWRyaWFuIEZyZWlob2ZlciA8YWRyaWFuLmZyZWlob2ZlckBzaWVtZW5zLmNvbT4NCj4NCj4gLi4u
DQo+DQo+ID4gV2hhdCBnZXRzIGZpeGVkDQo+ID4gLS0tLS0tLS0tLS0tLS0tDQo+ID4NCj4gPiAq
IHNzdGF0ZSBkb2VzIG5vdCB3b3JrIHdlbGwgaWYgYSBGSVQgaW1hZ2UgY29udGFpbnMgYW4gaW5p
dHJhbWZzLg0KPiA+ICAgVGhlIGtlcm5lbCBnZXRzIHJlLWJ1aWx0IGZyb20gc2NyYXRjaCBpZiB0
aGUgYnVpbGQgcnVucyBmcm9tIGFuDQo+ID4gICBlbXB0eSBUTVBESVI6DQo+ID4NCj4gPiBodHRw
czovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzIw
MzUxMA0KPiA+IC4NCj4gPiAgIFRoaXMgaXMgYWxzbyBwcm9ibGVtYXRpYyBmb3IgU0RLIHVzZSBj
YXNlcyBzaW5jZSB3b3JraW5nIHdpdGggdGhlDQo+ID4gICBTREsgaXMgYW5ub3lpbmcgaWYgdGhl
IGtlcm5lbCBnZXRzIHJlLWJ1aWx0IGZyb20gc2NyYXRjaCBmb3Igbm8NCj4gPiAgIGdvb2QgcmVh
c29uLg0KPiA+ICogQSBGSVQgaW1hZ2Uga2VybmVsIGlzIG5vdCBhdmFpbGFibGUgYXMgYSBwYWNr
YWdlLCBidXQgYWxsIG90aGVyDQo+ID4gICBrZXJuZWwgaW1hZ2UgdHlwZXMgYXJlLg0KPiA+ICog
VGhlIGl0cy1maWxlIGlzIGdlbmVyYXRlZCBieSBjb21wbGljYXRlZCBzaGVsbCBjb2RlIHdpdGgg
bG90cyBvZg0KPiA+ICAgY29kZSBkdXBsaWNhdGlvbnMuIFN3aXRjaGluZyB0byBQeXRob24gc2lt
cGxpZmllcyB0aGUgbWFpbnRlbmFuY2UNCj4gPiAgIChhbHNvIGJlY2F1c2Ugb2YgdGhlIGluZGVu
dGF0aW9uIHdpdGggc3BhY2VzIGFuZCB0YWJzIGluIHRoZQ0KPiA+IHNoZWxsDQo+ID4gICBjb2Rl
KS4NCj4gPiAqIFNlcGFyYXRpbmcgdGhlIEZJVCBpbWFnZSByZWxhdGVkIGNvbXBsZXhpdHkgZnJv
bSB0aGUga2VybmVsIGJ1aWxkDQo+ID4gICBjb21wbGV4aXR5IHNpbXBsaWZpZXMgdGhlIG1haW50
ZW5hbmNlIG9mIHRoZSBrZXJuZWwgYnV0IGFsc28gb2YNCj4gPiAgIHRoZSBGSVQgaW1hZ2UgcmVs
YXRlZCBjb2RlLg0KPiA+ICogVGhlcmUgaXMgYWxyZWFkeSBhIG5ldyAoYnV0IHVuZm9ydHVuYXRl
bHkgY29tcGxldGVseSB1bmFsaWduZWQpDQo+DQo+IENhbiB5b3UgcGxlYXNlIGVsYWJvcmF0ZSB3
aGF0IHlvdSBtZWFuIGJ5ICd1bmFsaWduZWQnPw0KDQpUaGVyZSBpcyBhIEZJVCBpbWFnZSBpbXBs
ZW1lbnRhdGlvbiBpbiBPRS1jb3JlLiBJdCBjb21lcyB3aXRoIHRlc3RzIGFuZA0KaXQgaXMgd2Vs
bCBkb2N1bWVudGVkLiBUaGVyZSBpcyBubyBuZWVkIGZvciBhIHNlY29uZCBpbXBsZW1lbnRhdGlv
bg0Kd2l0aG91dCB0ZXN0cyBhbmQgd2l0aG91dCBkb2N1bWVudGF0aW9uLg0KDQo+DQo+ID4gICBp
bXBsZW1lbnRhdGlvbiBmb3IgY3JlYXRpbmcgRklUIGltYWdlcyBpbiBtZXRhLW9wZW5lbWJlZGRl
ZDoNCj4gPg0KPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuZW1iZWRkZWQvbWV0YS1vcGVuZW1i
ZWRkZWQvYmxvYi9tYXN0ZXIvbWV0YS1vZS8NCj4gPiAgIGNsYXNzZXMvZml0aW1hZ2UuYmJjbGFz
cy4gTGV0J3MgaG9wZSB0aGlzIHBhdGNoIHNlcmllcyB3aWxsIGxheSBhDQo+ID4gICBzb2xpZCBm
b3VuZGF0aW9uIGZvciBhIGZ1dHVyZSBtZXJnZSBvZiB0aGUgdHdvIGltcGxlbWVudGF0aW9ucy4N
Cj4gPiAqIFRoZSBuZXcgaW1wbGVtZW50YXRpb24gaW4gUHl0aG9uIGlzIGFsc28gYSBwcmVwYXJh
dGlvbiBmb3INCj4gPiBhZGRpdGlvbmFsDQo+ID4gICBmZWF0dXJlcywgc3VjaCBhcyBhZGRpbmcg
ZGlmZmVyZW50IHR5cGVzIG9mIGFydGlmYWN0cyBvcg0KPiA+IGdlbmVyYXRpbmcNCj4gPiAgIHRo
ZSBjb25maWd1cmF0aW9uIG5vZGVzIHdpdGggZ3JlYXRlciBmbGV4aWJpbGl0eS4gQ3VycmVudGx5
LA0KPiA+IGV4YWN0bHkNCj4gPiAgIG9uZSBjb25maWd1cmF0aW9uIHBlciBkZXZpY2Ugbm9kZSBp
cyBzdXBwb3J0ZWQuDQo+DQo+IEFsbCB0aGUgYWJvdmUgcG9pbnRzIGFyZSBhbHJlYWR5IGF2YWls
YWJsZS9maXhlZCBieSB0aGUNCj4gbWV0YS1vcGVuZW1iYmVkIGZpdGltYWdlLmJiY2xhc3MuIENh
biB5b3UgcGxlYXNlIGVsYWJvcmF0ZSB3aGF0IHlvdXINCj4gY2xhc3Mgc3VwcG9ydHMgd2hpY2gg
aXNuJ3Qgc3VwcG9ydGVkIHlldCBieSB0aGUgZml0aW1hZ2UuYmJjbGFzcz8NCj4NCk9uZSBhc3Bl
Y3QgSSBwYXJ0aWN1bGFybHkgYXBwcmVjaWF0ZSBhYm91dCBPRS9Zb2N0bywgYXMgd2VsbCBhcyBt
YW55DQpvcGVuIHNvdXJjZSBwcm9qZWN0cyBpbnRlZ3JhdGVkIHdpdGggaXQsIGlzIHRoZSBzdHJv
bmcgZm9jdXMgb24NCm1haW50YWluaW5nIGxvbmctdGVybSBiYWNrd2FyZCBjb21wYXRpYmlsaXR5
LiBPRS9Zb2N0byBoYXMgY29uc2lzdGVudGx5DQpwcm92aWRlZCB0aGlzIGZvciBtYW55IHllYXJz
LCBhbmQgbGlrZSBtYW55IG90aGVyIHN0YWtlaG9sZGVycywgd2UgcmVseQ0Kb24gdGhpcyBzdGFi
aWxpdHkuDQoNCkl0IGlzIGVzc2VudGlhbCB0byBjb250aW51b3VzbHkgaW1wcm92ZSB0aGUgZXhp
c3RpbmcgY29kZSBiYXNlIHdpdGhvdXQNCmFsbG93aW5nIGl0IHRvIGJlY29tZSB1bm1haW50YWlu
YWJsZS4gSW50cm9kdWNpbmcgYSBzZWNvbmQNCmltcGxlbWVudGF0aW9uIGZvciBmdW5jdGlvbmFs
aXR5IHRoYXQgYWxyZWFkeSBleGlzdHPigJR3aXRob3V0IGNsZWFybHkNCmRlZmluZWQgdXNlIGNh
c2VzIGFuZCBhZGVxdWF0ZSB0ZXN0IGNvdmVyYWdlIGlzIG5vdCBhIHN1c3RhaW5hYmxlDQphcHBy
b2FjaC4gU2ltcGx5IGFkZGluZywgcmVtb3ZpbmcsIG9yIHJlcGxhY2luZyBjb2RlIHdpdGhvdXQg
cHJvdmlkaW5nDQphIHN1aXRhYmxlIG1pZ3JhdGlvbiBwbGFuIGZvciBleGlzdGluZyB1c2VycyBp
cyBpbnN1ZmZpY2llbnQuIFRoaXMgbGFjaw0Kb2YgYSBjbGVhciBtaWdyYXRpb24gcGF0aCBpcyBl
eGFjdGx5IHdoYXQgSSBmaW5kIG1pc3Npbmcgd2l0aCB0aGUNCmZpdGltYWdlLmJiY2xhc3MuDQoN
CkkgaG9wZSB5b3Ugc2hhcmUgdGhpcyBwZXJzcGVjdGl2ZSBhbmQgd2lsbCBzdXBwb3J0IEZJVCBp
bWFnZQ0KaW50ZWdyYXRpb24gaW4gT0UtY29yZS4gSSBoYXZlIG1hZGUgZXZlcnkgZWZmb3J0IHRv
IGFsaWduIHRoZSB0d28NCmltcGxlbWVudGF0aW9ucywgYW5kIEkgYmVsaWV2ZSB0aGVyZSBpcyBz
dGlsbCBmdXJ0aGVyIHBvdGVudGlhbCBmb3INCmltcHJvdmVtZW50Lg0KDQpSZWdhcmRzLA0KQWRy
aWFuDQoNCg0KDQo+IFJlZ2FyZHMsDQo+ICAgTWFyY28NCg0K

