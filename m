Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3590CF94CC9
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 05:50:41 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70903.1776837032022726046
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 22:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.51 with ESMTP; 22 Apr 2026 14:50:29 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO sniperexo3.lge.com) (165.244.147.13)
	by 156.147.1.121 with ESMTP; 22 Apr 2026 14:50:29 +0900
X-Original-SENDERIP: 165.244.147.13
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO PUWP216CU001.outbound.protection.outlook.com) (40.93.139.6)
	by 165.244.147.13 with ESMTP; 22 Apr 2026 14:50:29 +0900
X-Original-SENDERIP: 40.93.139.6
X-Original-SENDERCOUNTRY: unknown
X-Original-MAILFROM: jaeyoon.jung@lge.com
X-Original-RCPTTO: openembedded-core@lists.openembedded.org
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=doQ9/34OR/bE+HAmMYXFXqX0BBvTaJ1iYIPw3PA2MD1ExQAaA35QPolZ1cGXh+1STFgooHM7//pQh9tH+XZpMgIxgtYEcx8PTxs03WOxmdYpTLjS/R6nUhAoC++ylAQbjsYysINJ/SucOl0cS5EZhABbSJuD3X/YGr0O5JRU2kAXa34AjY+JqFrnQ87rrYmUUlESQ2UdpgmFOz0Y1o0GDxMdxY8dc5Jej/Fd8u5SvkXjL7qVzXoVQFvImnFdQyBHUF8y5BrFPzA0UBeMNrdAJ/J6b2PmagXAkFKhbjeokQV0PcPO83tmPPMIRpu40jzFw9jaLIrEw3lxiHKaDC9HAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+bG7oXVHpdyrzk04X9ekdYx57Mz9/poDVOD/FAAmAY=;
 b=sKtz0NxnyCN0RHQ/8t+cbZO1eZudGJrSFNn4hpuI/sUetitw//tATddUu1htu0f6pFmRaGvB79xxadwnTDBeYpBH02rkFrA14OyTfDNlPrVTzZZAupzx1DHkwh0y8KFOoeToE4ttBDQe3gr5AjvMSSaNvrmfHcvIhKw+tn2kM31i3S4UAebymCGKpcb0bcfnki5Fm89sc0x+3reSdiTFFfuQjQp8NwQeyu8TwUmKBGUYgLrydrB9Ik4sSUkdi3+/E3NlP/q03t8txYd6rGSmlShSvkO1uZb7qeSwZdWrqyGhtoxGEnAmkLceDkj7rMCc2S5Aj9u8UYwEaLTwClH2EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lge.com; dmarc=pass action=none header.from=lge.com; dkim=pass
 header.d=lge.com; arc=none
Received: from PU4P216MB1133.KORP216.PROD.OUTLOOK.COM (2603:1096:301:72::13)
 by SEWP216MB2784.KORP216.PROD.OUTLOOK.COM (2603:1096:101:298::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Wed, 22 Apr
 2026 05:50:28 +0000
Received: from PU4P216MB1133.KORP216.PROD.OUTLOOK.COM
 ([fe80::b838:75f7:a447:d66e]) by PU4P216MB1133.KORP216.PROD.OUTLOOK.COM
 ([fe80::b838:75f7:a447:d66e%4]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 05:50:28 +0000
From: =?ks_c_5601-1987?B?waTA58CxL1Rhc2sgTGVhZGVyL1NXIFBsYXRmb3JtKL+sKbyxx+BQ?=
 =?ks_c_5601-1987?B?bGF0Zm9ybbCzud+9xyBMaWdodHdlaWdodCBTeXN0ZW0gVGFzaw==?=
	<jaeyoon.jung@lge.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RESEND PATCH] package/classextend: Extend package
 variables for a multilib variant
Thread-Topic: [OE-core] [RESEND PATCH] package/classextend: Extend package
 variables for a multilib variant
Thread-Index: AQHczFwfVrru8dUcL0ugWa4hqeeuwLXqnM1U
Date: Wed, 22 Apr 2026 05:50:28 +0000
Message-ID: 
 <PU4P216MB1133C80B8047B68E076D9F209A2D2@PU4P216MB1133.KORP216.PROD.OUTLOOK.COM>
References: <18A658EDD3A65C64.1176865@lists.openembedded.org>
In-Reply-To: <18A658EDD3A65C64.1176865@lists.openembedded.org>
Accept-Language: en-US, ko-KR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lge.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PU4P216MB1133:EE_|SEWP216MB2784:EE_
x-ms-office365-filtering-correlation-id: 81f96bfc-5326-4330-11b4-08dea0330ec5
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|31052699007|39142699007|366016|38070700021|18002099003|22082099003|56012099003|8096899003|55112099003|95630200002;
x-microsoft-antispam-message-info: 
 HD8ey4ZrWl1i+d5qzPZU3vZyi48dLmjFDIgmEanrVWWAQg2XSBubBQmBPHc9H9OG/U3s65z7Sa9rNYPoT9Wt31mN+FG9aPlEwDNshwbIpE38oqNPDa0+CFnLuzvC7X6cG88/7f8R1V1B22rfVtx2IW5LpNFzO1womzE3LYcDiswaD+tW12iqwRbI9CFeLGiZnb/5dFOOAPkt6PGcd60J9Y0v9SYtQ3z43p7ZeuAnwEW+M27JSF6xSfeHhNFt4RvnpbzB9vY4qmeaarfYxzmkqkKk1VLdNkUNpgTDb55a/1fkR2SDWba2FQ89JSFhvziWNmJhYgtlmn49Ypfyu9I8EWeB98ptHT7TQHLqBPsMsGYUAAisGV+t9qiT+JP6Z5xchcQM/hQI/OI++4Krjm48cDtz9UPyNHyltod1y7SgdrpRESaBFjPbREKQDgrquBEjxNfFiJtIlH4oL4Grn6saYoERN/Ag4YqOCeg+N+FYrqzzodB9pISNaQVxtH24q96lGZxaiRUD27YT/vLS3Ig8d3kXbgbn7ICYllL8GgCf4AnOGgtrnOO3MEY1EimaBngOSPdGHn/jhmnItUN3PrwSBd1QutRoKyYfp9YjsQIQEiqepe78Edjqyn7SBQ6LhX8u1ND6FsYTJBj/OrgPdRtjYKieNBuX3sOu2MvBbcA4MnAMIqe8urLJHTQyTUUcKUpS5Rj1IJhxu9+E1ni2ZxU5UzdYgwg5I/BrravrPT1y/clArmEcY60e4kqgq9aFl+jmwIslmwwr3ah9+ZdD/ypsVMph8EKAH3bJhDveuaeZmFDREcxJu/Igdvtwf2XWxYl4
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU4P216MB1133.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(31052699007)(39142699007)(366016)(38070700021)(18002099003)(22082099003)(56012099003)(8096899003)(55112099003)(95630200002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?ks_c_5601-1987?B?USsrb2xVQWdrMEExY21LVUJiSzZUbTNiRlhqdkVEQkpEUlhqWkg4?=
 =?ks_c_5601-1987?B?ZmFSWXlHb2QyM0NONklDU1BwVjZQeFBwQXJtTldtYXhvRzNsQWcw?=
 =?ks_c_5601-1987?B?VHdtTUppWU9tMFlaM1N1WGN1czc4QjltazhmMzB2Sm5YbTl0ejlN?=
 =?ks_c_5601-1987?B?Rk44blhnaXdmV3NwUGR5Z0JXWHNVZURVM1FZUWhmckxYaTkwbTJG?=
 =?ks_c_5601-1987?B?SzhiWkg1VmlHelVzT2tQMzFydXNDYTZ6ak5rVXQxVEIyaVA3Y3R1?=
 =?ks_c_5601-1987?B?dERTVzkvbzdiMjFHWkQza3RWc0tXaE10KzUzeWxhd2ZjUUMvSjNh?=
 =?ks_c_5601-1987?B?WkFUTUhmak01QnZMWVJWaDAzdFpkVlNUWXlyanpVS3FvdFNaRHhN?=
 =?ks_c_5601-1987?B?VnZqMlhQRlVFdzI3bjA0UHp4czBnaTg4YVYxUEFEVG5SdlowSzRl?=
 =?ks_c_5601-1987?B?cVRBdTc1MUFYV1BPUXZwVDNEVVdOQnlYdUpsT21DTnVTSmw2enZK?=
 =?ks_c_5601-1987?B?V25UWGVzSTQ1WE40Uk9oY2RtM0FPbHFUMnBBNXdJRnlSdXE1Tld3?=
 =?ks_c_5601-1987?B?ZHo0Wk9icnNYWmx2K3VVVE02Wkd5VGRzNFZ6a3ptNDBEdm5rdy92?=
 =?ks_c_5601-1987?B?QlVuR2FuWlMzWTQ1ZGNxd3dqTXhqZzRUSVcrRHFDd0hEa0NMdllM?=
 =?ks_c_5601-1987?B?QkRCd0pzczY3b1JmR2pONUZ2am9xdlQ3MDBlaE9PbkFieTB2NzF3?=
 =?ks_c_5601-1987?B?WmtvVHQvbm9sb0hlWHRXY0tEaDRiZ3B0S0ptM3EwK1V4dS8rMk9X?=
 =?ks_c_5601-1987?B?czh1VVhUankvZmRYVTk4bnpEbG9wYmhROWxxditkaUErS1FYNHE2?=
 =?ks_c_5601-1987?B?ZWliaXZZdzJmbHUrSzNCNVd4cWx1aVJMeGY2Q250Q2syVzVFZGdp?=
 =?ks_c_5601-1987?B?c2YzTlBFVkI2cnJ2ZzZiY2MwMkNzQW5GS3hxNi9MV2xNT2JCVmRt?=
 =?ks_c_5601-1987?B?Z2ppTlhCK20xRlFRaHR1T2g2STRxNGUySDNpRXQ4ZFRlcldGT2pD?=
 =?ks_c_5601-1987?B?OEZhaysxR0xBSHBBZ2dZWm16UHdwZXh6NUZ2Y1ZPVGhHTkp0N1lU?=
 =?ks_c_5601-1987?B?Ujd3ZXNDd3kxSDVJb1NSYUlzUndIU0ttd1gwL1pIWCtLSmE1dnVs?=
 =?ks_c_5601-1987?B?Z0gwdzE5OTVkTHZDL0x1QW5yU0FvSFNrbm4vQ3h2ZEZSK1k3bGxZ?=
 =?ks_c_5601-1987?B?Z3E3Q0tEZHZOZGFEUkVPUStYQ2FGbHI2dXMyOHRqRG9vWU5oTFZW?=
 =?ks_c_5601-1987?B?K0ZlTXdCL1hYalpYOWNvZUtqWHFRS1lsbUdiemc0QWxOTWRTMjRB?=
 =?ks_c_5601-1987?B?OXVFMGJwNFV5Mk82UmZMN1N6UEU2all3ekl2SDRTcTUxMTdoYUI1?=
 =?ks_c_5601-1987?B?RkEvVVhxSGh2R2t1dWI2TUpSRHlMOWhCMGtBcjNhU0NpejNCRTVM?=
 =?ks_c_5601-1987?B?OTdRbmJqUlNXdEwvdWFxQTNhRkFZNS90RjJ3TGRkTzRXenhPRVVi?=
 =?ks_c_5601-1987?B?TEhSdzlKRW1hazZWditQZ3RwVU5WdlFFb0hEQzJhY3hQT0pKRUp2?=
 =?ks_c_5601-1987?B?M1hQbXNCRGRuZ1dndzNsT1VyWVdqdXNxWktobjIxdUp3RW1GQ3NK?=
 =?ks_c_5601-1987?B?K3BrM0daMUFqOHJZVjNEaE9COUVLb3VDMmtlelFMM292angrbS81?=
 =?ks_c_5601-1987?B?ajBrWXFoc0RqcFVYdFc0S1BCMmlVdDgxWU9FU3F1aVdWMTBQa3Ba?=
 =?ks_c_5601-1987?B?QXZvSVFuMWNqWC9NbThXREhNbzdYTzRjVHdhd1pZbnRHcE0vaEVC?=
 =?ks_c_5601-1987?B?NEQ1bm1oeWxCd3RMdDBlWHNuNmZlb0R1eFFFdHM0VUxQSmtad1pM?=
 =?ks_c_5601-1987?B?ZTRrRDB6TitJRWtBcTRnK0V3V0hxRUdxN0lnOTR3Vllwdk9CZjB1?=
 =?ks_c_5601-1987?B?NS95bE1tNkFUd3c0QlhrRmpFSDJxcHdZU21LdUd2YVVPVGxxWHE1?=
 =?ks_c_5601-1987?B?bU9Wamd2Sk5FRkZkQndRcFg4RkdYVGU2bm9lOFdIanJsTHpwTFps?=
 =?ks_c_5601-1987?B?OG9McTJET05ERlFySUl6N3NHd3J3Mm04VU1mVjk2Z2FPUElneHhp?=
 =?ks_c_5601-1987?B?c25PNzd0R2tQd1huV29lZDZvZDdZNzhpQTd2alRoNVN1VHpVK0Ft?=
 =?ks_c_5601-1987?B?QWRkUm8rSDhIWDA1SjBhemhuMnVMN1RSMHZoYXZuMXoxUlNzRWxm?=
 =?ks_c_5601-1987?B?Z0hha3N5RENuZUo5RWtyeWZocEp5amt4a2hhVnIrSUExbjBPOXVZ?=
 =?ks_c_5601-1987?B?UnRaM3hrZ0NRWFp4TVpoYmhMMWdzRmptK1RkOVB3cXhqcTI1Sk1U?=
 =?ks_c_5601-1987?B?ck1wRWFYdmQ3L25rVGVBMFRsQW9ENlFldXhpdCt3Z0lrbTZFM2Uv?=
 =?ks_c_5601-1987?B?Witidnl4ekRqaDM3c3A4S0lSbStYSkZ3TTZHNE9Jc2VoUjV5V0d6?=
 =?ks_c_5601-1987?B?cDhDdCtJMlh6ZlYvemNLeUNmaU5yV0szdkZCOWd6Vmt3azZMOVZ5?=
 =?ks_c_5601-1987?B?dFJVNkEvNlcvZnpFWVZpR0p3c202a0FwV2FvYnlPWEgxMlhSWitM?=
 =?ks_c_5601-1987?B?b2hNbEFVdWNGd3dEanUxYTdJSm43VFRBc0t5SDYyM0FEUT09?=
Content-Type: multipart/alternative;
	boundary="_000_PU4P216MB1133C80B8047B68E076D9F209A2D2PU4P216MB1133KORP_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	mxGKpgQVmw5stD/NaKqaGAYjQI180Ur/ZPOMV8NRWi21g6B2OAeiXi9EVr9pZRkUMZ/lXVEDYzwpU1tPeyejXOGpYOsIWWe1lNH62JU8H6QDlBq3wQ9luCW9YmXPa7LUtW60rvyZGYTdA4BPEMQIQGCnJa2T9B9Ja6I8nclKeQiqpJzy6j7hLI/OfIcNmrkf5gSqTtSdN+63Rh+cygnDX/E5RycMo4fy2Uxc5CeZ3X6yDsu7TISL3aySPJqKuzrPC4nT1Hjt63QLRtjdKjI2GSAVajRTB81wP3mpTe1FC63GwebwddZQvJbJ1oZNXoT4/3Kgtp47NWJSrT6o9Fch/g==
X-OriginatorOrg: lge.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PU4P216MB1133.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f96bfc-5326-4330-11b4-08dea0330ec5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 05:50:28.4146
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5069cde4-642a-45c0-8094-d0c2dec10be3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ctBbeaZ6mW1C6P/21PpEEBkGjsM8y+thfwyM0hPKOk7CCaRf2ndZ2ObQHcgLpnqzWVs6671Jb7QrwxFuT7Ap3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEWP216MB2784
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 05:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235690

--_000_PU4P216MB1133C80B8047B68E076D9F209A2D2PU4P216MB1133KORP_
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: base64

SGksDQoNCkkgcmVzZW50IHRoZSBwYXRjaCBhYm91dCBhIHdlZWsgYWdvLCBidXQgSSBkb24ndCBz
ZWUgaXQgaW4gYW55IGJyYW5jaCBhdCB0aGUgbW9tZW50LCBzbyBJJ20gd29uZGVyaW5nIGlmIGl0
IG1pZ2h0IGhhdmUgYmVlbiBtaXNzZWQgYWdhaW4uDQpJIGNhbiByZXNlbmQgaXQgaWYgbmVjZXNz
YXJ5IGJ1dCB3YW50ZWQgdG8gY2hlY2sgaWYgdGhlcmUgaXMgYW55dGhpbmcgbWlzc2luZyBmcm9t
IG15IHN1Ym1pc3Npb24uDQoNCg0KQmVzdCByZWdhcmRzLA0KLS0tDQpKYWV5b29uIEp1bmcNClNv
ZnR3YXJlIFBsYXRmb3JtIExhYi4gLyBDb3Jwb3JhdGUgUiZEIC8gTEcgRWxlY3Ryb25pY3MgSW5j
Lg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KRnJvbTogb3BlbmVtYmVkZGVk
LWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gb24gYmVoYWxmIG9mIEphZXlvb24gSnVuZyAoTEdFKSB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZyA8amFleW9vbi5qdW5nPWxnZS5jb21AbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4NClNlbnQ6IFdlZG5lc2RheSwgQXByaWwgMTUsIDIwMjYgMDc6MTQNClRvOiBvcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPg0KQ2M6IMGkwOfAsS9UYXNrIExlYWRlci9TVyBQbGF0Zm9ybSi/
rCm8scfgUGxhdGZvcm2ws7nfvccgTGlnaHR3ZWlnaHQgU3lzdGVtIFRhc2sgPGphZXlvb24uanVu
Z0BsZ2UuY29tPjsgTWF0aGlldSBEdWJvaXMtQnJpYW5kIDxtYXRoaWV1LmR1Ym9pcy1icmlhbmRA
Ym9vdGxpbi5jb20+DQpTdWJqZWN0OiBbT0UtY29yZV0gW1JFU0VORCBQQVRDSF0gcGFja2FnZS9j
bGFzc2V4dGVuZDogRXh0ZW5kIHBhY2thZ2UgdmFyaWFibGVzIGZvciBhIG11bHRpbGliIHZhcmlh
bnQNCg0KRnJvbTogSmFleW9vbiBKdW5nIDxqYWV5b29uLmp1bmdAbGdlLmNvbT4NCg0KSXQgZXh0
ZW5kcyBwYWNrYWdlIHZhcmlhYmxlcyBpbiBjYXNlIG1pc3NpbmcgZm9yIGEgZHluYW1pYyBwYWNr
YWdlIGFkZGVkDQpkdXJpbmcgZG9fc3BsaXRfcGFja2FnZXMuIEl0J3MgbmVlZGVkIGZvciBhIG11
bHRpbGliIGJ1aWxkIHdoZXJlIHNvbWUNCnBlci1wYWNrYWdlIHZhcmlhYmxlcyBzaG91bGQgYmUg
dHJlYXRlZCBhcyBtdWx0aWxpYiB2YXJpYW50cy4NCg0KU2lnbmVkLW9mZi1ieTogSmFleW9vbiBK
dW5nIDxqYWV5b29uLmp1bmdAbGdlLmNvbT4NClNpZ25lZC1vZmYtYnk6IE1hdGhpZXUgRHVib2lz
LUJyaWFuZCA8bWF0aGlldS5kdWJvaXMtYnJpYW5kQGJvb3RsaW4uY29tPg0KLS0tDQogbWV0YS9j
bGFzc2VzLWdsb2JhbC9wYWNrYWdlLmJiY2xhc3MgfCAxMSArKysrKysrKysrKw0KIG1ldGEvbGli
L29lL2NsYXNzZXh0ZW5kLnB5ICAgICAgICAgIHwgIDUgKysrLS0NCiAyIGZpbGVzIGNoYW5nZWQs
IDE0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9tZXRhL2Ns
YXNzZXMtZ2xvYmFsL3BhY2thZ2UuYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy1nbG9iYWwvcGFja2Fn
ZS5iYmNsYXNzDQppbmRleCA2NzE0OGZjMWFjLi5jZmFkZDM2YzE2IDEwMDY0NA0KLS0tIGEvbWV0
YS9jbGFzc2VzLWdsb2JhbC9wYWNrYWdlLmJiY2xhc3MNCisrKyBiL21ldGEvY2xhc3Nlcy1nbG9i
YWwvcGFja2FnZS5iYmNsYXNzDQpAQCAtMTY5LDYgKzE2OSw3IEBAIGRlZiBkb19zcGxpdF9wYWNr
YWdlcyhkLCByb290LCBmaWxlX3JlZ2V4LCBvdXRwdXRfcGF0dGVybiwgZGVzY3JpcHRpb24sIHBv
c3RpbnN0DQoNCiAgICAgZm9yIG8gaW4gc29ydGVkKG9ianMpOg0KICAgICAgICAgaW1wb3J0IHJl
LCBzdGF0DQorICAgICAgICBpbXBvcnQgb2UucGFja2FnZQ0KICAgICAgICAgaWYgbWF0Y2hfcGF0
aDoNCiAgICAgICAgICAgICBtID0gcmUubWF0Y2goZmlsZV9yZWdleCwgbykNCiAgICAgICAgIGVs
c2U6DQpAQCAtMjI1LDYgKzIyNiwxNiBAQCBkZWYgZG9fc3BsaXRfcGFja2FnZXMoZCwgcm9vdCwg
ZmlsZV9yZWdleCwgb3V0cHV0X3BhdHRlcm4sIGRlc2NyaXB0aW9uLCBwb3N0aW5zdA0KICAgICAg
ICAgICAgIGhvb2soZiwgcGtnLCBmaWxlX3JlZ2V4LCBvdXRwdXRfcGF0dGVybiwgbS5ncm91cCgx
KSkNCg0KICAgICBkLnNldFZhcignUEFDS0FHRVMnLCAnICcuam9pbihwYWNrYWdlcykpDQorDQor
ICAgIHZhcmlhbnQgPSBkLmdldFZhcigiQkJFWFRFTkRWQVJJQU5UIikNCisgICAgcHJlZml4ZXMg
PSAoZC5nZXRWYXIoIk1VTFRJTElCX1ZBUklBTlRTIikgb3IgIiIpLnNwbGl0KCkNCisgICAgaWYg
dmFyaWFudCBhbmQgcHJlZml4ZXM6DQorICAgICAgICBpbXBvcnQgb2UuY2xhc3NleHRlbmQNCisN
CisgICAgICAgICMgRXh0ZW5kIHBhY2thZ2UgdmFyaWFibGVzIGZvciB0aGUgZ2l2ZW4gdmFyaWFu
dCBpZiB1bnNldA0KKyAgICAgICAgY2xzZXh0ZW5kID0gb2UuY2xhc3NleHRlbmQuQ2xhc3NFeHRl
bmRlcih2YXJpYW50LCBwcmVmaXhlcywgZCkNCisgICAgICAgIGNsc2V4dGVuZC5yZW5hbWVfcGFj
a2FnZV92YXJpYWJsZXMoKGQuZ2V0VmFyKCJQQUNLQUdFVkFSUyIpIG9yICIiKS5zcGxpdCgpLCBv
dmVyd3JpdGU9RmFsc2UpDQorDQogICAgIHJldHVybiBsaXN0KHNwbGl0X3BhY2thZ2VzKQ0KDQog
UEFDS0FHRV9ERVBFTkRTICs9ICJmaWxlLW5hdGl2ZSINCmRpZmYgLS1naXQgYS9tZXRhL2xpYi9v
ZS9jbGFzc2V4dGVuZC5weSBiL21ldGEvbGliL29lL2NsYXNzZXh0ZW5kLnB5DQppbmRleCBkZGNh
MTBkZWU1Li44Yjk2MDJlMzE2IDEwMDY0NA0KLS0tIGEvbWV0YS9saWIvb2UvY2xhc3NleHRlbmQu
cHkNCisrKyBiL21ldGEvbGliL29lL2NsYXNzZXh0ZW5kLnB5DQpAQCAtMTI4LDcgKzEyOCw3IEBA
IGNsYXNzIENsYXNzRXh0ZW5kZXIob2JqZWN0KToNCiAgICAgICAgIHNlbGYuc2V0X2ZpbHRlcigi
UkNPTkZMSUNUUyIsIGRlcHM9VHJ1ZSkNCiAgICAgICAgIHNlbGYuc2V0X2ZpbHRlcigiUEtHIiwg
ZGVwcz1UcnVlKQ0KDQotICAgIGRlZiByZW5hbWVfcGFja2FnZV92YXJpYWJsZXMoc2VsZiwgdmFy
aWFibGVzKToNCisgICAgZGVmIHJlbmFtZV9wYWNrYWdlX3ZhcmlhYmxlcyhzZWxmLCB2YXJpYWJs
ZXMsIG92ZXJ3cml0ZT1UcnVlKToNCiAgICAgICAgIHBrZ3NfbWFwcGluZyA9IGdldF9wYWNrYWdl
X21hcHBpbmdzKHNlbGYuZC5nZXRWYXIoJ1BBQ0tBR0VTJyksIHNlbGYuZXh0bmFtZSkNCiAgICAg
ICAgIHNlbGYuZC5zZXRWYXJGaWx0ZXIoJ1BBQ0tBR0VTJywgInBhY2thZ2Vfc3VmZml4X2ZpbHRl
cih2YWwsICciICsgc2VsZi5leHRuYW1lICsgIicpIikNCiAgICAgICAgIHNlbGYuZC5zZXRWYXJG
aWx0ZXIoJ1BBQ0tBR0VTX0RZTkFNSUMnLCAic3VmZml4X2ZpbHRlcl9yZWdleCh2YWwsICciICsg
c2VsZi5leHRuYW1lICsgIicsICIgKyBzdHIoc2VsZi5wcmVmaXhlcykgKyAiKSIpDQpAQCAtMTM3
LDQgKzEzNyw1IEBAIGNsYXNzIENsYXNzRXh0ZW5kZXIob2JqZWN0KToNCiAgICAgICAgICAgICBp
ZiBwa2dfbWFwcGluZ1swXS5zdGFydHN3aXRoKCIkeyIpIGFuZCBwa2dfbWFwcGluZ1swXS5lbmRz
d2l0aCgifSIpOg0KICAgICAgICAgICAgICAgICBjb250aW51ZQ0KICAgICAgICAgICAgIGZvciBz
dWJzIGluIHZhcmlhYmxlczoNCi0gICAgICAgICAgICAgICAgc2VsZi5kLnJlbmFtZVZhcigiJXM6
JXMiICUgKHN1YnMsIHBrZ19tYXBwaW5nWzBdKSwgIiVzOiVzIiAlIChzdWJzLCBwa2dfbWFwcGlu
Z1sxXSkpDQorICAgICAgICAgICAgICAgIGlmIG92ZXJ3cml0ZSBvciBub3Qgc2VsZi5kLmdldFZh
cigiJXM6JXMiICUgKHN1YnMsIHBrZ19tYXBwaW5nWzFdKSk6DQorICAgICAgICAgICAgICAgICAg
ICBzZWxmLmQucmVuYW1lVmFyKCIlczolcyIgJSAoc3VicywgcGtnX21hcHBpbmdbMF0pLCAiJXM6
JXMiICUgKHN1YnMsIHBrZ19tYXBwaW5nWzFdKSkNCg==

--_000_PU4P216MB1133C80B8047B68E076D9F209A2D2PU4P216MB1133KORP_
Content-Type: text/html; charset="ks_c_5601-1987"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dks_c_5601=
-1987">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 11pt; color: rgb(0, 0, 0);">
I resent the patch about a week ago, but I don't see it in any branch at th=
e moment, so I'm wondering if it might have been missed again.</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 11pt; color: rgb(0, 0, 0);">
I can resend it if necessary but wanted to check if there is anything missi=
ng from my submission.</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Best regards,</div>
<div id=3D"Signature" class=3D"elementToProof">
<div class=3D"elementToProof" style=3D"font-family: &quot;Malgun Gothic&quo=
t;, &quot;=B8=BC=C0=BA =B0=ED=B5=F1&quot;, AppleGothic, sans-serif; font-si=
ze: 11pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri; font-size: 13.3333px; background-color=
: rgb(255, 255, 255);">---</span><span style=3D"font-family: Aptos, Aptos_E=
mbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size=
: 12pt;"><br>
</span><span style=3D"font-family: Calibri; font-size: 13.3333px; backgroun=
d-color: rgb(255, 255, 255);">Jaeyoon Jung</span><span style=3D"font-family=
: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-=
serif; font-size: 12pt;"><br>
</span><span style=3D"font-family: Calibri; font-size: 13.3333px; backgroun=
d-color: rgb(255, 255, 255);">Software Platform Lab. / Corporate R&amp;D / =
LG Electronics Inc.</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Jaeyoon Jung (LGE) via lists.openembedded.org
 &lt;jaeyoon.jung=3Dlge.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Wednesday, April 15, 2026 07:14<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> =C1=A4=C0=E7=C0=B1/Task Leader/SW Platform(=BF=AC)=BC=B1=C7=E0Pl=
atform=B0=B3=B9=DF=BD=C7 Lightweight System Task &lt;jaeyoon.jung@lge.com&g=
t;; Mathieu Dubois-Briand &lt;mathieu.dubois-briand@bootlin.com&gt;<br>
<b>Subject:</b> [OE-core] [RESEND PATCH] package/classextend: Extend packag=
e variables for a multilib variant</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Jaeyoon Jung &lt;jaeyoon.jung@lge.com&gt;<br=
>
<br>
It extends package variables in case missing for a dynamic package added<br=
>
during do_split_packages. It's needed for a multilib build where some<br>
per-package variables should be treated as multilib variants.<br>
<br>
Signed-off-by: Jaeyoon Jung &lt;jaeyoon.jung@lge.com&gt;<br>
Signed-off-by: Mathieu Dubois-Briand &lt;mathieu.dubois-briand@bootlin.com&=
gt;<br>
---<br>
&nbsp;meta/classes-global/package.bbclass | 11 +++++++++++<br>
&nbsp;meta/lib/oe/classextend.py&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 5 +++--<br>
&nbsp;2 files changed, 14 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pack=
age.bbclass<br>
index 67148fc1ac..cfadd36c16 100644<br>
--- a/meta/classes-global/package.bbclass<br>
+++ b/meta/classes-global/package.bbclass<br>
@@ -169,6 +169,7 @@ def do_split_packages(d, root, file_regex, output_patte=
rn, description, postinst<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; for o in sorted(objs):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; import re, stat<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; import oe.package<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if match_path:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; m =
=3D re.match(file_regex, o)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<br>
@@ -225,6 +226,16 @@ def do_split_packages(d, root, file_regex, output_patt=
ern, description, postinst<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ho=
ok(f, pkg, file_regex, output_pattern, m.group(1))<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; d.setVar('PACKAGES', ' '.join(packages))<br>
+<br>
+&nbsp;&nbsp;&nbsp; variant =3D d.getVar(&quot;BBEXTENDVARIANT&quot;)<br>
+&nbsp;&nbsp;&nbsp; prefixes =3D (d.getVar(&quot;MULTILIB_VARIANTS&quot;) o=
r &quot;&quot;).split()<br>
+&nbsp;&nbsp;&nbsp; if variant and prefixes:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; import oe.classextend<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Extend package variables for =
the given variant if unset<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clsextend =3D oe.classextend.Cl=
assExtender(variant, prefixes, d)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clsextend.rename_package_variab=
les((d.getVar(&quot;PACKAGEVARS&quot;) or &quot;&quot;).split(), overwrite=
=3DFalse)<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp; return list(split_packages)<br>
&nbsp;<br>
&nbsp;PACKAGE_DEPENDS +=3D &quot;file-native&quot;<br>
diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py<br>
index ddca10dee5..8b9602e316 100644<br>
--- a/meta/lib/oe/classextend.py<br>
+++ b/meta/lib/oe/classextend.py<br>
@@ -128,7 +128,7 @@ class ClassExtender(object):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.set_filter(&quot;RCON=
FLICTS&quot;, deps=3DTrue)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.set_filter(&quot;PKG&=
quot;, deps=3DTrue)<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; def rename_package_variables(self, variables):<br>
+&nbsp;&nbsp;&nbsp; def rename_package_variables(self, variables, overwrite=
=3DTrue):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkgs_mapping =3D get_packa=
ge_mappings(self.d.getVar('PACKAGES'), self.extname)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.d.setVarFilter('PACKA=
GES', &quot;package_suffix_filter(val, '&quot; + self.extname + &quot;')&qu=
ot;)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.d.setVarFilter('PACKA=
GES_DYNAMIC', &quot;suffix_filter_regex(val, '&quot; + self.extname + &quot=
;', &quot; + str(self.prefixes) + &quot;)&quot;)<br>
@@ -137,4 +137,5 @@ class ClassExtender(object):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=
 pkg_mapping[0].startswith(&quot;${&quot;) and pkg_mapping[0].endswith(&quo=
t;}&quot;):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; continue<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fo=
r subs in variables:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; self.d.renameVar(&quot;%s:%s&quot; % (subs, pkg_mapping[0]=
), &quot;%s:%s&quot; % (subs, pkg_mapping[1]))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if overwrite or not self.d.getVar(&quot;%s:%s&quot; % (sub=
s, pkg_mapping[1])):<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.d.renameVar(&quot;%s:%s&quot;=
 % (subs, pkg_mapping[0]), &quot;%s:%s&quot; % (subs, pkg_mapping[1]))<br>
</div>
</span></font></div>
</body>
</html>

--_000_PU4P216MB1133C80B8047B68E076D9F209A2D2PU4P216MB1133KORP_--

