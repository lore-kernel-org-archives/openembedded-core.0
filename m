Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71621CCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 11:48:23 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.12])
 by mx.groups.io with SMTP id smtpd.web10.16422.1759837698084492578
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 04:48:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=f80LKQSA;
 spf=pass (domain: axis.com, ip: 40.107.130.12, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ik30B3KFA/T7ArzXMbQB8YPYm4IKXZOnj5WNZKdbJdfGnMCD6PTRTKtbUfQ46/w14Lmow88A6vhITcyyBEdeG1e6Vxpra7ypU14jC03WWG57qWpp3aR+G3jAEqLr/z5yIy6t1lngrazPrYL1sQx5QUSUpKNl23Ian8td+oBnvHfRDiKV411yrr9snd1Ic9fHkte4CCE9Xdv2JMsoq9NVZ7H3pNJg+qhXqUtbKDrLVDEUUq3A8U5l/Gwqg4+npEESbaLT+uhuMYlD3FQBLKAw0WqEEBFalJ6z0PvnFFm6OxIBNhZ1aZZm7lA1MDAlfGq0nt0qiqKD0atOSWOgktG5Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMp1TQTCZpOnqFqLb3HqSMdn4iKikyd1GNKhoPdB8iQ=;
 b=ST3tygE9hCRHDx2/tZoITnmhxF0GcrGWbmwtr4KvQ0HEilVRHCFGAjondI9oBfaHlihV6WTuC8qmGMSnKy9WjwikCqrSsqVi76ZeX4uo+UroxcXFBdISZwTzyz371ZOAxeCWtYC7lwTRWd7Muxp9H3l1v1JoAjTx3xQJkDPMlEtcCjlPsxj3B67+DrkKnk4FqrmCW8l8FQBhqF93KECyboREyladd6JaOUhtI0Sc6Tx/heChUibAGuap2+s4/CJez6uFOXBYqraQV8jHa9grPgfv22KT/Ae1npkOLYTubZTOUCgwSg8+N51xuImF+ep0H3iNG6I8aQ/5310qZlwcHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMp1TQTCZpOnqFqLb3HqSMdn4iKikyd1GNKhoPdB8iQ=;
 b=f80LKQSAKjvslSVv5pvuBgEtbao8i9ePyiG3xIdRHCyEiOM1RoFoqg7YKQMHDOP96RSItBjoiBvCc57SPLJwwF+e9F8bF6xAnqgkczb41YwL6GNoJHa7KGCts9jzrcJ7ix0p1aYJn8u9lzsHO/zxtqwoINlhHAvWFkQF1iGfBsQ=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS8PR02MB7287.eurprd02.prod.outlook.com (2603:10a6:20b:3f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 11:48:10 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 11:48:10 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ross Burton <Ross.Burton@arm.com>, Khem Raj <raj.khem@gmail.com>
CC: Adam X Nilsson <Adam.X.Nilsson@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Adam X Nilsson
	<Adam.X.Nilsson@axis.com>
Subject: RE: [OE-core] [PATCH v1] core-image, populate_sdk_base: Add
 zsh-completion-pkgs image feature
Thread-Topic: [OE-core] [PATCH v1] core-image, populate_sdk_base: Add
 zsh-completion-pkgs image feature
Thread-Index: AQHcNv1FqXvGXlErD0+y7yUutUA0prS1ojSAgADbhoCAABIpUA==
Date: Tue, 7 Oct 2025 11:48:09 +0000
Message-ID: 
 <DB5PR02MB102131C9AEB85566B1683DBCBEFE0A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20251001160212.2588471-1-Adam.X.Nilsson@axis.com>
 <FF7BA9D0-A09D-4D43-9CBB-5CA991E825BF@arm.com>
 <CAMKF1sp1hb6ZSr=B6iAThoXcRQFD+h7vKxVcmPq2RoqeF2in0A@mail.gmail.com>
 <BF7A5C48-4C48-40E4-B846-486473FE2D01@arm.com>
In-Reply-To: <BF7A5C48-4C48-40E4-B846-486473FE2D01@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS8PR02MB7287:EE_
x-ms-office365-filtering-correlation-id: ec3040cd-bb4a-4ac6-b65e-08de0597637f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?YTdRM1lna1lWcDhENW1wc0FVRUR5Tm11MzMvcVUvVVkzcmxHYnUwSUdWOUJH?=
 =?utf-8?B?UTNCR09iN0VmVTl6cWI3dUhTUVlPaE9TQVVIWGMvVjRPQzVKSGkwRDNBaWdU?=
 =?utf-8?B?ZWZZT1ZzT1I0Vkk2dnJ4WWhzWVNZcmV5MDNjTkxsS2xjYVpiaVo1TWVlQll5?=
 =?utf-8?B?a1paNlQ0QW0xWjJqM21ZZVUvcFlGbnVaeDJZY1ZBRlcwbGlMb1NkNFFWdFh3?=
 =?utf-8?B?eFJQdGhJVk53ZjFDVWsyeERXblMxZm5nWXJoWnM1UE1yNG9GcmNUbmd0ZFNs?=
 =?utf-8?B?dFRtUUhEKzIvQXYxSWJjNStvYVBRakIwUWtwa2VONHcyQzlJNmFwUEo2MmEx?=
 =?utf-8?B?Z0FlZWtBZnMxWm9oVzR1OVdwUmxOMS95ODBQUnduRVlyS3BZeWtnR3lIdVlU?=
 =?utf-8?B?S1c4KzVwUnAxc2pKVzJlSnJRTUYvdXVPQkVPejNyNTNobXYwelZoRDdQdFcr?=
 =?utf-8?B?VVg4ZXZVWlBaMnowMWJFK0xkVWlVM1JpaThkSUdSWmZyMW1vMURQNDlSb0gr?=
 =?utf-8?B?OWYzZElUY3p5TWpaYzN0VHJoVUNsVE5uQVgwL2MvdDZ3TUhPK25yOFRuS05j?=
 =?utf-8?B?MXdmQlR1NHpWVkU3ZG1IemFiYXFya09tTDVJY2hBMDE1UzloaW5SUHpHemc4?=
 =?utf-8?B?Yzh0ODBvdWRpQ0tLUWdNRmZ2MEkxY3hNbSt6NGlsc1BNTzAvdS9zQ3JxcWIv?=
 =?utf-8?B?UXR3dnQ3TFJrNW55YXN4TUM5ZXU4NGdjalNNRml1K0lzaU5lbE1sRHRpS2N6?=
 =?utf-8?B?ckhNZnBFT1F0VUFzYTMydVZBQmphazVFcFo5OG9ZMjBmNmRVODFaM08yRUFG?=
 =?utf-8?B?QzlUQ2pxRlFlQXp4eGQ5NllQbXM3VkZWT0F4K2RzbzQwSG5kZ3RUOWhnMC9x?=
 =?utf-8?B?bkI3L3hKdXVuN21BQVlIdU02OTZWNHp0YWgzbkcrZHdOc3F6eEhndThmK240?=
 =?utf-8?B?b1RveDdLZjVteDhya1hCdm91YUs3cHdQVHhCSUFBNmR6K0hKMkNGSG1xUnFE?=
 =?utf-8?B?c3BYZy8xK2NOOGpTZTMxTXlTVEtVZ2FMWGMzdWJVR2s1SGhacFdhcWFsWGtY?=
 =?utf-8?B?Q2tPQnNYT3h1V0UwZHZKYkV0cWpRQmtaSUJMNlhBWmF1OSt3ZmxObXVDYjZy?=
 =?utf-8?B?RHBnK0RRc25lNkpXaW5nbFpZQks0MTN5dnhFaVdpM3Q4SkJFanVNSVRReTJH?=
 =?utf-8?B?VFFvUHpsWXZ4LzlJWHNNZVJCek80ZjBuNEk2ZjRSdDZMcWx0TVpaMG5RZllY?=
 =?utf-8?B?SUx1OE9YcGhhMnFHL2NneHphNlB1TVdxeitZOUFUMU5DclVoVEt2MHFvUkZv?=
 =?utf-8?B?MGlxTnNtTENkWVpaRkNaSXlIUjNPVzNoaTIwSldVcE1mcGsyb0RiRnlISmpK?=
 =?utf-8?B?QlJFcEJ5UGFlQlN0YjRuUDArcE4rSXp1YzZPUkFUWlBNV2JmNi9kSENDZHZB?=
 =?utf-8?B?eENOMHdlYjI1cUZUcWZMcUR6T0x4N2tidFFiTFBKZGJHNDJrakFyUkFYTkx6?=
 =?utf-8?B?SWRGZmpPcjc5bW55Ty9IN3hHZTU2WkcyL09RbG92dU9WRHZDdWVQUGNFTmtV?=
 =?utf-8?B?K1A3QmJlNTFURG5ibTVaMzVMSWZFbDc4cStsUndpa21JT2ZBQ01TN0lnNE1y?=
 =?utf-8?B?Y0VuRGdJZkI3Z0srQXpSMmRDUFZJVjJQUmN1dFY1RzE0TVNjbmkwbXEyUEhw?=
 =?utf-8?B?Wmk5UDFLcE1ybVRERHVncnFvMG9wMUZwNFhIQkh2VU5kSkJsdGJ3RTVUU2Nm?=
 =?utf-8?B?eUhzZk1iQmEzVEJoZGptVTc3dW5BMXFTOEpXNE5ISFVmQWF0bVBUSHB3cHd2?=
 =?utf-8?B?MmdleHd0MEhlVUx0UG52anAxYWtJdlo3aHZGTVhuVDByNTRJNmVSM2VjRkRk?=
 =?utf-8?B?K25TdU5nYjFkMFJSTGI0SC9CMkxDV0pwWTVBbHlXaytnc2tkUHA5NVlCZURh?=
 =?utf-8?B?Wng2VVh5L0ZHK1Z4ZnlnWitiRnI4WlUyOTA3R0ZvTHNmQTlDbHdDSU01Zjdh?=
 =?utf-8?B?UHhhL2FRLzFrZUI5Wm1oblVmU2RwaThoRThoWDZSMFQyYlNwcFhDWUtnc0FS?=
 =?utf-8?Q?sF0ehI?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?d01Yd2pSOFJqeHBWMFhzR0hNNnBIdWZpTis1YlJQbFdxSlN5U0Z3d2IvMGxw?=
 =?utf-8?B?WnBhbUVnbko3MWV2TTUyaHlHRzFnVzVIY2YydHE1bTVML2tnVTVGRzlRYnN1?=
 =?utf-8?B?RWdQajRQZWFZWXJiQ0FFTlRWWm9UY2RGOHV0ZWQxNkN1c3pvR29sNzVCVDdU?=
 =?utf-8?B?SDNUS0tFc2VVaEtQT2IzTktFcUQ1ZWV3ekY2RXhQc3dRZmszUjk3c2xjb2Yx?=
 =?utf-8?B?cEpqUVVhR1RVNUNOYlRTR1Vyczg5UXNzVTRvZ21UdjcwUU9JMU52cmFCSisz?=
 =?utf-8?B?OENydExRdjZYd2lsYnBNZDFEdUVUV2w0bFIydDlpQndjeENMS08xOTFLQzJj?=
 =?utf-8?B?a1lZWFZaa2ZvaXlPQ0Rkdlh3cCt1bkZmYkdKUXhwSkdhaTNYWmw0VU9GeTM2?=
 =?utf-8?B?blF5RnpYVldBVFdXbmlFVEZzb3p0TERWV1k5QnFFeURHdERNTFptanJxSHRm?=
 =?utf-8?B?WUk4RHpXNFVuakJjWU5iNjhHdXoyZWdYaTkySk1sdUdDQUlQYlBNckp1L29J?=
 =?utf-8?B?NzZBaTBDSG0wU0NkSTVHNjZ4TnpRS1I5dnBleVF0SzlxejdjZDNWZkd4RENI?=
 =?utf-8?B?ZkVZQUFSc25lQURRSXU4TnN6YlJHQldUcldvbXA2WmxJN2RnRlJ2SXhYc2o4?=
 =?utf-8?B?WkhVZVFjTVkyZFBWT2YxVGhtbkU3amlVZy8yNmZERENFODlDQWVrbWNYY1FK?=
 =?utf-8?B?VS9YWEhGOW5Td0VUTVR3aFRjRE44UE9pOXl6UE1iL2VoS0xURXZXRWtONDRs?=
 =?utf-8?B?Zm9CL04rYlBpUlZWVER6RGthWEU4cXNaeVM3QjdCNnJmYkFvd2xXWm1Pc0xy?=
 =?utf-8?B?U253aXAwRU52YTdrYVp0VjBOekxrSzBmRWg1RlppREZNSVF2dVV5WU9wS0xo?=
 =?utf-8?B?djdLTDZwNEJacXczRzZhSXQ4VXFmaStYaUdIQ01PNXp5OWoxbkkzNkY2MVp2?=
 =?utf-8?B?eGxHbTlQUFlsWXJoWWh5b3VWbkdqdGRrS2lNb1ZBbk5BNnQ1VEpyUHllOWhz?=
 =?utf-8?B?K09ublpncWljcjNhYlhlbzNaOUFDUDNHQXkvcVRhZUZIeVo3YUNXMVl2S21s?=
 =?utf-8?B?aytrU2NUclVHc0c5YyttakhUZTJxeHZ4UldQQ08xYkJyd1VrRVBkTktsYlAr?=
 =?utf-8?B?WmtPUld5SlVNMUxYdEw4SnNOVDJha1NFL2JzVEZ2VVA1cW1PdExBOWhERHlT?=
 =?utf-8?B?QW9QNWJxQ05CRkZIZTVGdktCYVlFSDVCTUZNTGZhN05ldy9PdXBZVVhGTzBt?=
 =?utf-8?B?THczbHNpSFlxdEpIeDA5V0JVNVpUZzh4WFFNaGFPZm1PWXJBMkord2xuMWRh?=
 =?utf-8?B?dmx1SlVzSmpNMkMzeDJ5N1JpbThNemVXNURqRFlqNVZjZklld1BZdEpLQlhF?=
 =?utf-8?B?N0kvYXhoMkgrZjlUeUR5dmpBRzNlTVZKY1k2OUp6Wk9TOXllN1RYVWFkbmZh?=
 =?utf-8?B?NmJmMVBoVVpJWEhpcEI3SDlvSWs0NDNHbmh2NS9QZnBjbzErZm0vTkJ2bjFC?=
 =?utf-8?B?Y1R0b1AreWxPN1BDc3oxTHkwZ21YbHIrVFB0UFZidytad2F2d0lFekJyVVFP?=
 =?utf-8?B?cXM4bGYyZVI0UzE3Q3kwYjl0d1kvVmN6dWpwQk1ObHlETFZEd0lJWGwxUXNs?=
 =?utf-8?B?eFRiZnI5aWk4QkF1TXIvQXIzTGVEYzF6YXBxSUNIaUx0QWVmd1lCcCt1ZUlL?=
 =?utf-8?B?NDVSMVd6MkhoWE1TQWxkWU9PWU1FQm5jNHJxNDRjbzBMR2w1azNHUzRPR1J1?=
 =?utf-8?B?WnFvb1VIYmhzcUlPMTVKKzcrb0RHeTlDWTMxeHl5WkFISDl6YldzU2NDOXVM?=
 =?utf-8?B?blN4eHRmR0U3eUt3WjJSS3FjbU5ydm0wNS9IcFlLYi9vbDI4SC9pQWQxdTBw?=
 =?utf-8?B?WjVNZ0NxK1ZGMDVKRlNMZWhxK2FNNzI5eStnYkhwdTFrSzgyaXViMjFxdHV3?=
 =?utf-8?B?WU81aDY5c3VSNXNwU0M5ZkR3V0J4ampXcUxuQTVGdDRMYjZuNlZOOGdWQTFY?=
 =?utf-8?B?OEpGTVMrMTl0eU1mZ2FkeUJ1MkNFTFlUTzVxQTk2NGkvVzc1aG5LdTR5dUV3?=
 =?utf-8?B?WlhqVE1sWGQySjBRSmdFZVJqWFBFVGptbElJUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec3040cd-bb4a-4ac6-b65e-08de0597637f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2025 11:48:10.0549
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kEu0nBbFUiIBa9hhEltat677U4X5SUe4nP+7vDkQYHazqcK50HMWE/Ppa8wZFJuD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7287
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 11:48:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224526

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb3NzIEJ1cnRvbiA8Um9zcy5C
dXJ0b25AYXJtLmNvbT4NCj4gU2VudDogZGVuIDcgb2t0b2JlciAyMDI1IDEyOjM0DQo+IFRvOiBL
aGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KPiBDYzogQWRhbSBYIE5pbHNzb24gPEFkYW0u
WC5OaWxzc29uQGF4aXMuY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZzsgQWRhbSBYIE5pbHNzb24gPEFkYW0uWC5OaWxzc29uQGF4aXMuY29tPjsgUGV0ZXIgS2pl
bGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
T0UtY29yZV0gW1BBVENIIHYxXSBjb3JlLWltYWdlLCBwb3B1bGF0ZV9zZGtfYmFzZTogQWRkIHpz
aC1jb21wbGV0aW9uLXBrZ3MgaW1hZ2UgZmVhdHVyZQ0KPiANCj4gT24gNiBPY3QgMjAyNSwgYXQg
MjI6MjgsIEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gT24g
TW9uLCBPY3QgNiwgMjAyNSBhdCAxOjEw4oCvUE0gUm9zcyBCdXJ0b24gdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgPHJvc3MuYnVydG9uPWFybS5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+ID4+DQo+ID4+IE9uIDEgT2N0IDIwMjUsIGF0IDE3OjAyLCBBZGFtIE5pbHNzb24g
dmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPEFkYW0uWC5OaWxzc29uPWF4aXMuY29tQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+Pj4NCj4gPj4+IEZyb206IEFkYW0gTmlsc3Nv
biA8YWRhbW5pQGF4aXMuY29tPg0KPiA+Pj4NCj4gPj4+IEFkZCBhIHpzaC1jb21wbGV0aW9uLXBr
Z3MgaW1hZ2UgZmVhdHVyZSB0byBpbnN0YWxsICotenNoLWNvbXBsZXRpb24NCj4gPj4+IHBhY2th
Z2VzIGludG8gYW4gaW1hZ2UuIFRoaXMgaXMgc2ltaWxhciB0byB0aGUgZXhpc3RpbmcNCj4gPj4+
IGJhc2gtY29tcGxldGlvbi1wa2dzIGZlYXR1cmUuDQo+ID4+DQo+ID4+IEJ5IG15IGNvdW50IHRo
ZXJl4oCZcyBqdXN0IHRocmVlIHJlY2lwZXMgaW4gY29yZSB0aGF0IGhhdmUgLXpzaC0NCj4gPj4g
Y29tcGxldGlvbiBwYWNrYWdlcy4gIFVudGlsIGl04oCZcyBtb3JlIGNvbW1vbiwgSeKAmWQgc3Vn
Z2VzdCBwdXR0aW5nIHRoZQ0KPiA+PiBDT01QTEVNRU5UQVJZX0dMT0JTIGFzc2lnbm1lbnQgaW4g
eW91ciBvd24gaW1hZ2UgcmVjaXBlIGlmIHlvdSB3YW50IHRvIHVzZQ0KPiA+PiBpdC4NCj4gPg0K
PiA+IEl0IGRvZXMgaGVscCBwZW9wbGUgdXNpbmcgenNoIGFzIGRlZmF1bHQgc2hlbGwgYW5kIHdv
cmtpbmcgd2l0aCB5b2N0byBTREtzLg0KPiANCj4gRG9lcyBpdCB0aG91Z2g/DQo+IA0KPiAkIGdp
dCBncmVwIEZJTEVTLip6c2gtY29tcGxldGlvbg0KPiBtZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1k
L3N5c3RlbWRfMjU3LjguYmI6RklMRVM6JHtQTn0tenNoLWNvbXBsZXRpb24gPSAiJHtkYXRhZGly
fS96c2gvc2l0ZS1mdW5jdGlvbnMiDQo+IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9wYXRjaGVsZi9w
YXRjaGVsZl8wLjE4LjAuYmI6RklMRVM6JHtQTn0tenNoLWNvbXBsZXRpb24gPSAiJHtkYXRhZGly
fS96c2giDQo+IG1ldGEvcmVjaXBlcy1rZXJuZWwva21vZC9rbW9kXzM0LjIuYmI6RklMRVM6JHtQ
Tn0tenNoLWNvbXBsZXRpb24gPSAiJHtkYXRhZGlyfS96c2jigJ0NCj4gDQo+IEhvdyBtYW55IFNE
S3Mgc2hpcCB3aXRoIG5hdGl2ZXNkayBidWlsZHMgb2Ygc3lzdGVtZCwgcGF0Y2hlbGYsIG9yIGtt
b2Q/DQo+IA0KPiBSb3NzDQoNClBsZWFzZSB0aGluayBvdXRzaWRlIE9FLUNvcmUuIEp1c3QgYmVj
YXVzZSB0aGVyZSBhcmUgb25seSB0aHJlZSByZWNpcGVzIA0KaW4gT0UtQ29yZSB0aGF0IGN1cnJl
bnRseSBjcmVhdGUgenNoLWNvbXBsZXRpb24gcGFja2FnZXMsIGRvZXMgbm90IG1lYW4gDQp0aGF0
IGl0IGlzIG5vdCBtb3JlIGNvbW1vbiBvdXRzaWRlIG9mIE9FLUNvcmUuIEFsc28sIG9uZSByZWNp
cGUgdGhhdCANCmNvdWxkIGJlbmVmaXQgZnJvbSBjcmVhdGluZyBhIHpzaC1jb21wbGV0aW9uIHBh
Y2thZ2UgaXMgYmx1ZXo1LCB3aGljaCANCmN1cnJlbnRseSBoYXMgaXQgZGlzYWJsZWQuDQoNCk9u
ZSBvZiB0aGUgbWFpbiByZWFzb25zIEkgc3VnZ2VzdGVkIEFkYW0gdG8gc2VuZCB0aGlzIHBhdGNo
IHVwc3RyZWFtIA0KaXMgZm9yIGNvbnNpc3RlbmN5LiBTaW5jZSBiYXNoLWNvbXBsZXRpb25zLXBr
Z3MgaXMgYSB3ZWxsIGVzdGFibGlzaGVkIA0KZmVhdHVyZSwgSSB3b3VsZCBleHBlY3QgdGhlIHNh
bWUgcG9zc2liaWxpdHkgZm9yIG90aGVycyBzaGVsbHMgKHdoaWNoIA0KaW4gb3VyIGNhc2UgaGFw
cGVucyB0byBiZSB6c2gpLg0KDQovL1BldGVyDQoNCg==

