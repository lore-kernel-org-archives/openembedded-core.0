Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B67CAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 14:00:17 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.20])
 by mx.groups.io with SMTP id smtpd.web10.17350.1758290416576110423
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 07:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Ye+HkbAg;
 spf=pass (domain: axis.com, ip: 40.107.159.20, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EP2wqPv3VQjnaWJfv/F/dskDwiQniX7L5mEFvym1OSi6qfk3WfiG2pAgHj7TDt/uUJ78bFVP7hUBnTRACoaX6JDBPrUVN1LDq9/EDJz3GHY3g+X2QQi+6lVV8l48B0Y9AjwQVuRa2CIltC+mrkns1B6LwjZQpxGgXQKxHZEI9JfBNNy0SCObAuoqieJH+za2xOGRah9gHs+ZtXRJZDP2g1+0ytIKfhwOFE49/A2uS27Oa77cul5G3eEuOhOGkwFfK5iLxr6ePfyH7vsbjQy9Hw1OTKy7SPc89ElBjFze6b9gaF8g88HnE6OFiwLfFTw0xMz899oefEqqvdRyaMrLJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gts1xvxxr2oWZ1zJq2ivzy1GJ/CkdM16bfbZGI3IUi0=;
 b=H2BBmXG+Y+FeS+wm17go4vBIHz7CrrgTrPoI6x8yJzjjNRPwbrcRz+BHSZwa2ZD190mLWFIRjZzc7YWjvQcKr3j5oZXmjSyABJWnpZlB61V50/qxVAU4i89w56nE3SikFJjUiZyKVJ6kc6DWhylEXYY1AET6KpM/Pisw/e6dImJRPgxWVPKusPwUCGC7SLT2dCmgswR2kZlBbRieyNDIAO3bymu6+vnc2H/DGi/eDQF6d0x1OCF6/jPOyGq8jt2q8Doy3ApEFlUZGnZKRquxlEyShd1hfXp9hNasxpn+fmxnC8JjLbE+IMd4jYfCo6S5mJNIaNKt0E+1+K9KL0aAqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gts1xvxxr2oWZ1zJq2ivzy1GJ/CkdM16bfbZGI3IUi0=;
 b=Ye+HkbAgjcRuOOIMfzaLw5mooj5lr7jJTmly+31MiMMyjVMopWKZVMfyYLeFhkC04urzRPsmy3i2WAzNTN+Q9wLdUqDP2dPZA1lkTOVewGXZnCLFvO3/ZKUmWNSQsH8yC8X/6Ml8r5j7Skk+Z3tB83KgNVKVeFuEbhYR+sTlta0=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU0PR02MB8338.eurprd02.prod.outlook.com (2603:10a6:10:3ba::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 14:00:12 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 14:00:12 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"liezhi.yang@windriver.com" <liezhi.yang@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/1] openssl: 3.4.2 -> 3.5.2
Thread-Topic: [OE-core] [PATCH 1/1] openssl: 3.4.2 -> 3.5.2
Thread-Index: AQHcKRDTb2StlsnF40OPNzXLrWDBn7SaTB6AgAA7hxA=
Date: Fri, 19 Sep 2025 14:00:12 +0000
Message-ID: 
 <DB5PR02MB10213D9AC1AC7D4603BD982E4EF11A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <cover.1758250424.git.liezhi.yang@windriver.com>
 <c33930b39db477506067200c5c4f19cec0079b95.1758250424.git.liezhi.yang@windriver.com>
 <CANNYZj8_iTg7ukB=Zhimh5cDuUKs520AojDta3UyM7jDHFscNQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8_iTg7ukB=Zhimh5cDuUKs520AojDta3UyM7jDHFscNQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU0PR02MB8338:EE_
x-ms-office365-filtering-correlation-id: b5c8adb6-de58-4c56-a7cf-08ddf784da32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dnRRakIzK2taYVdkYXhySG9pam5UZFhLU3FiVHVIbVRiYk1wQ2lNYlovMitH?=
 =?utf-8?B?Nm4wN29xNlliTVFaUGQrTmhhRW92Q0thSEhmMmFUdjB5Z3hzQnEwbVgrVkhQ?=
 =?utf-8?B?bHBqVzM5SjlhYU0xelRvSnVvMThPOFREMjhCbHdLQmVuRWVBTExHNWlEWFlR?=
 =?utf-8?B?L3ZyaUFqUzQvUTBQR1Vyb1g0OTV5N0lWcU1oUUpTYy81aUw5cGIwY2NLMnFx?=
 =?utf-8?B?OTN0ZXpBNG5Ld1ZjTkdJNjNaWGdhQnpFaXFrNkhDenFodGkyMXlsYUlEYS8r?=
 =?utf-8?B?ZGlnSlFvT1QySFByY3ZoUFVEQ2FzNEtXQVA5RWlHS1NRbWkxckNwaFFTbWgz?=
 =?utf-8?B?MDZXT3NOcDVyaUdRVkF6Titqckg2UCs1cHpkSURmNzUremhJaFRWT2kwMmVl?=
 =?utf-8?B?ZjhNa1JjTzg1L2pBdTd2anYyeGsrOE11Um5VMTVhNnpIMTB4N2FZRTJHcitv?=
 =?utf-8?B?aXE0aTFOVG5tN3JnT1JWeVo5bC9ha2RpSUxqTG5Wa0d3SEd1dTJmcjk4MjNJ?=
 =?utf-8?B?R3Bkd3RHWDJabFJpeGpYRlJnY04xMWNRN3NjOU5Ybk1WUUtZaEEraUd0UXp3?=
 =?utf-8?B?ZjZDV2l1eXVaazNGbEpjaWtVdm9ZZUdvMkZSREF2ZERKckhTaHluU1V1cE15?=
 =?utf-8?B?S2VkREZMVUl5SXpOcWNxNzRFMjlBVDlER3VZWndrOEM1dnNvWlRyQnlMRDcr?=
 =?utf-8?B?Yy9DeStPWTlzOGpsTnRBUXg3amZIWU43S2pIMTdPQmZEMyt0aEt0cHdWVm00?=
 =?utf-8?B?UWtHRU53dCt2KzBWWGFlbTRmRUw4S2pMUnI1OTBBMzduNWRKbCs0VWZPM1kx?=
 =?utf-8?B?eTFwOFpma3AvekNtSW1iT0pCNHNEZ0M5c2RXVHFvaFNXZGVpamw0Sm5tSWVs?=
 =?utf-8?B?TGhGbGxZempWbGJmUXIzV3hGVkk0eEZpL3psNHFwUENBTER3SG9LMFdQOHhV?=
 =?utf-8?B?Tk5COEt6VDYzU3JUc09XMWJ6ckFrcmp2WElHSGptMEFKcFNhSktjcno0ME5W?=
 =?utf-8?B?TnhUaGw0UFJIUE9ROHNTMTlVTnR5ZmdRYzk5WVNxeDhMUFJQYzVWNUVVbWNY?=
 =?utf-8?B?dTl4RnorZ0IxQVNJM3dWT3UrL2hlZTlTekFkeUU5ZzZ1UGI1eHhHa2N5NE5p?=
 =?utf-8?B?WGxnRCtzZGc5cDh5V3hibzZNQlM3WU1RZWQxYW9QRGQ0Ly9mOHRxWFZPd0E4?=
 =?utf-8?B?bEIzT3NKSUtnNXIxZmdkVkRlZWFsbVByOXgyK3NHMnBVTG1DRXF2bXk5ayt2?=
 =?utf-8?B?enhqaTVjKzhtZmpOU2lrOVZhUmpUR0NFWWJlNGVqMEZNckpUY3BqRG5KSFND?=
 =?utf-8?B?UFFYZm1oYXVreHdEL1JvZHZyVlNXa2kvUzhYVXlkUXBXNmFrVVdncDhxNVdK?=
 =?utf-8?B?dk1JNUljRjRoNFlsa0djZ1MxWmlTdE5VYkNQTm9iTUVWaFBKei9LdXU0Vloz?=
 =?utf-8?B?SjZmYWM2Wnl2cEcvSWZKR0FYYzRPYVlWdy9MbDh2MnoxcVZtVStISWYvRTlS?=
 =?utf-8?B?RWQ3a0UzaG5SY3piWWh2U3U5aG11M2JMays0cENKWnFkcmhTSUxnbHo1RXo3?=
 =?utf-8?B?MGJRTUg1SFQ3aFBRMXJPbHFCcGEwN09ScHJVeXBXemlqR1hGa0JITGx2YTI2?=
 =?utf-8?B?elAxRitrS0lpNXJaQ2MrUFBwQTFrd3RMK2pmYWE0SUxtVGNEN3Nxd0RaOUlY?=
 =?utf-8?B?a1RnVVNLRmFWK3BaYkVabmJnQ1JsUHhOMzR2MVlKYTNKOVpMaWQ0YTBCUmdX?=
 =?utf-8?B?YVo5R2ttbWRMOHc4RFFXZUpIeVd5TStXcE9qWW90K0VJdkgxNWlJWUd3bm85?=
 =?utf-8?B?NUtJQ2s4aE1iNmRNUEZqbEFrRmNBS0g1SHhGd1lKbExtKytMalNqTkp6WEhs?=
 =?utf-8?B?RlBsWTFGSXA0bi9EZHViQVZIU2tRMEUxWVp4bjZSR0tBZW5DZ2k1ekxYbG5K?=
 =?utf-8?B?WlBnUWFWSkU3OCtJSHNqbHdiYkErQ3hrRkVLN0xoUzNVTExjN1FqeCs5NkZI?=
 =?utf-8?B?SDdwYUVXS2l3PT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?M21xenRkT3FHaGtjY3NsUlN0ai9jRyt4YklvaGlIYjRRSEdLZGpqQVZqakdn?=
 =?utf-8?B?ZDhSZ1RiUVFGMStQYXdSd2ppZzlNbytndnBHUkpBcnlyL2RZVjMwR3daZ1Jj?=
 =?utf-8?B?SkcyMUZmdTM5Yll0bUpYSzk0b25UNVRPaTZWd3MxTkprUzJzNys2elJkdjJv?=
 =?utf-8?B?RTVHcFFYaVF5WnRMQjRsVk5vbjJSMmw0OUZHNUtTWjVYUmI0R3lQdUpZcHFi?=
 =?utf-8?B?bjhzUC8ybkJ4UVJxTkhSZEpiTU0vMUcxYUd2YUdqaHo4anRuV0ZCdWdLS1Vl?=
 =?utf-8?B?VXZ1RTBrbWdteGhHZEVockRpb3pUTFhuOWpsd25rMTdJUzIxV3ZGcWNFUmJs?=
 =?utf-8?B?RGlsbHl0bVVIU0NCMkloOHhxbVkreVRmdTJnZjV3NTFLTE5iOTdFdkZIcWxP?=
 =?utf-8?B?RWNBWWhVYWp2S0ZDNVd0b3AyRENMOTNCY0pzVmtsbjM2L0tYTit1b2k0M1R6?=
 =?utf-8?B?UDVBNnVQZWZTd3RUUVk5RmZPTHhqQmN0Uit2M2w5SjV2QXNiOGJuMzNnM1Ni?=
 =?utf-8?B?cXdDc29sSE9BTGN2ZWUxdUJmQ0pmOEJlNHMyQXgwcTFHVXRxYVdCalUvTEw1?=
 =?utf-8?B?bzhCN2UwYUEzc2srdUJuQVgwMVhBT3dITnk5eXFhQXMyWVVxbURvL3pYRzJI?=
 =?utf-8?B?SFNKZThicDk2T0dtcWFJUm85dXpIZzFsMml3bkkzTEwxTFJ5anpHUEdoU0pZ?=
 =?utf-8?B?bWJqa3luOTdlWDRBcTZUY1pOVjNGSHl3WUdyY1ZHNmNBQUQwT0wwZG9CN1o4?=
 =?utf-8?B?NkJ2NmRrSE8vVHdXQi91OEQ5K1l0SVovUjVUd2FYVzF2V1Zibkh3UStzcklh?=
 =?utf-8?B?eHcwd1ZJSzE3dDRab2VKZmVpYm10cFdzWFdCYTFqanJaYXNKYWRYVXZrN0xF?=
 =?utf-8?B?QVZ2dlBlVFQzUHViTTR1RDFCSEs3aGllWnhjVnRQeGR5TTM4eGpsN0lZcHBW?=
 =?utf-8?B?SER2ekVsM1Z5WnZoaS9MUmJMTGJjNjZtVUEvaEt1bEEweElDd1dramhQRGV6?=
 =?utf-8?B?Q29SdXZOV0M4N1dNMzdMc1U2ODVMSk95czhZWXdsUC8wMFFITVp4YWd4U0xS?=
 =?utf-8?B?bmVKMkp1aEhMbFZCZ0g4SkZVajllMVpkZWdCbU9zaWNobDVpRlJFWmppdW9p?=
 =?utf-8?B?WnpXazJ4SWpnSXhUUkJ4NlNjUkVRQlAvMVllRFBsUXhYZkVIdmQza1lXVUV3?=
 =?utf-8?B?VTkrKzVPbDZnc2UzTHQxUXZNN1FndVJYK3B1Z0JFU0lqWEtaaGpMLzI1U3pU?=
 =?utf-8?B?MnkxMVduN212SVZiL2MxRjVQejFDNm9JMkw2SFgzL1pSbnpsZ2JvbjEybFkx?=
 =?utf-8?B?OHBETjIrbnJYVEJHWk56eE55ZzdsMUZSWlgyS1Y3ZER0cHE3NTN1ajhmNEkx?=
 =?utf-8?B?UHQzb0IwSlRUU2ZtaG53OU1kTzUzUFh6blFqU1cvd2txVVM2ZFBXblRKa01h?=
 =?utf-8?B?c1dZUDJqNEJtUjlvSzZvdGZvV0djZ1hnL1VHejFXMXFadGlGeld1OTZvbktt?=
 =?utf-8?B?a2txSTFBSzZDYTNjWUZvTGh0TFlINS8wWUhrWEl5L0gyWUZ2NUIxeXhEWXZL?=
 =?utf-8?B?bEtNTXVpdksvRXF3ZytyNDd2YWhJUmdvV3hLWlNuWkZtSFJFTFdVM0dEazlK?=
 =?utf-8?B?Uy9xSGRRN2xSZy83RlQ3YXBuc2V6Vi9BVmlMUzFxcCtDR0pibmhzdkY2aUhx?=
 =?utf-8?B?bVRJWStLSlFMYkRlRnEwS0hYRmJzaW01eVZxaDZEWjJhS0hmMTBCUytTOGdR?=
 =?utf-8?B?LzFXV2EwR0NWU0dUVklUcGJhcVRVVlpqR1NFSkppMXZBSmZHb000NHhlaE83?=
 =?utf-8?B?UUhvdUZvcUpObGJYTCtHdzUvOG44RnZjR3ByNzIvaGt3cjNmdUM1L21hWmlh?=
 =?utf-8?B?UXlPa1JCRTVYdUpxcXBNaXQ2VE9VT3c1RVJXanpQR1k4Tkpucm9HT2dvcVV4?=
 =?utf-8?B?eFYxdTNhV0lIdXc4bjM2U2VEVUd3OTVKYU9VS3lpVVh4UlFZZnh2dG5XWHRR?=
 =?utf-8?B?Y2svT2k0OGIvREI5Ym5JQUsrZUp1OVV2OW5FeDRnbUNLcVB4a3kxM0ZwbkND?=
 =?utf-8?B?OCtvaU56cGpnWE1GZWpUZ0gzNEtlcGFidmxRUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c8adb6-de58-4c56-a7cf-08ddf784da32
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2025 14:00:12.4417
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oMHoUDSPFUC+h2kxyslZ702d3CIfQKhl31b9V1VyX7Rm4Rzkd44Y41V3m4t8zOXQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8338
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 14:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223755

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgQWxleGFuZGVyIEthbmF2aW4gdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gU2VudDogZGVuIDE5IHNlcHRlbWJlciAyMDI1IDEyOjIxDQo+IFRvOiBsaWV6
aGkueWFuZ0B3aW5kcml2ZXIuY29tDQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDEvMV0gb3BlbnNz
bDogMy40LjIgLT4gMy41LjINCj4gDQo+IE9uIEZyaSwgMTkgU2VwdCAyMDI1IGF0IDA0OjU1LCBS
b2JlcnQgWWFuZyB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8bGllemhpLnlhbmc9d2luZHJp
dmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPiBUaGUgYmVuZWZpdCBv
ZiBPcGVuU1NMIDMuNSBpcyB0aGF0IGl0IGlzIGFuIExUUyBzdXBwb3J0ZWQgdG8gMjAzMCwgd2hp
Y2ggY2FuDQo+ID4gc2F2ZSB0aGUgbWFpbnRlbmFuY2UgdGltZSBpbiB0aGUgbG9uZyBydW4uDQo+
IA0KPiBZZXMsIGFuZCBpdCBhbHNvIGFkZCBuZXcgZmVhdHVyZXMsIGJyZWFraW5nIHRoZSBwcm9t
aXNlIHRoZSBwcm9qZWN0DQo+IG1ha2VzIHRvIGl0cyB1c2Vycy4NCj4gDQo+IFRoaXMgdXBkYXRl
IGNhbm5vdCBiZSBkb25lIHdpdGhvdXQgVFNDIGFwcHJvdmFsLiBZb3UgbmVlZCB0byBnZXQgdGhh
dA0KPiBmaXJzdC4NCj4gDQo+IEFsZXgNCg0KQWxzbywgdGhpcyBwcm9wb3NhbCB3YXMgZm9yIFdh
bG5hc2Nhciwgd2hpY2ggd2lsbCBiZSBFb0wgYWZ0ZXIgdGhlIA0KbmV4dCByZWxlYXNlIChvciB0
d28pLiBUaHVzIHVwZGF0aW5nIE9wZW5TU0wgdG8gYSBuZXcgbWlub3IgdmVyc2lvbiANCm5vdyBt
YWtlcyBubyBzZW5zZS4NCg0KSWYgaXQgaGFkIGJlZW4gc3VnZ2VzdGVkIGZvciBTY2FydGhnYXAg
YW5kIHRoZSBtZXRhLWx0cy1taXhpbnMgbGF5ZXIsIA0KdGhlbiBJIHdvdWxkIGhhdmUgbW9yZSB1
bmRlcnN0b29kIGl0Lg0KDQovL1BldGVyDQoNCg==

