Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C53FCD4F21
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 10:25:27 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.72070.1778581525395181821
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 03:25:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=yuf/i96c;
 spf=pass (domain: siemens.com, ip: 52.101.70.5, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2Iea4H+F2beqYXoqGfJVOFnpQ/TCKxN9OxGtZzHRmZK4c+me2LY6JeXBkIZCkk1FSLfQnUZv4DwttJYZPv9+ZkmtiTagAu8dDJNRSfqK4Xd6cGEomM95dINu0Nt+pkrLdGVbxNi7JvFkGpvho2WQhHk34JbPaFbluKJ2V3lFeW2a9P4NdfpSRO8ZAYqv52mSNgNJhTul3neNmjjemQLBQlkWUUthgc1KcW+ovPJohfzOvm1rGWhZIa5J6jl++QQNOOburqXBNKKs8v5zbBqAbyl2RyAdZHuLhq8b7F2TNIzt+8Eqj5f1LCsq9IAYaiISncUd2hlRuayj3CDwusU1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBn7MVN3t7i7yrb6iHiavL9S8P7UHW9VT/6JHRqbrOI=;
 b=UAWWof37USStJAsu6F2xv9gUytubotL61df4/lFi1RGDNrBVka4NgCnSEs7WwQ80AMD1PMaWKmNZZDu68dMpuzFOSHGSXa3PDi9Os6BpAnVRc55PedNuHnTy0j/sFxrNxy1lCbHbsll1zHKdwxD10QzVmX4cXntEAOUtJi5rZAr064Tq1PaSfdLfzyHSM641+7ljCNuSa1b2K7sA45fT2lG3T+HkD8dZh/Owd8UVIWtWCD6ANN4ki1PKzmRmYyLRMX6jDMFBL4pbUHAtbRR2vyjB0rqJdFACNxsKdwiK55IcmOWA76iQZ3NKSozgkhlyiZm/LyJzI8Z7zE1h8eONSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBn7MVN3t7i7yrb6iHiavL9S8P7UHW9VT/6JHRqbrOI=;
 b=yuf/i96ctVcDke27DQ8+2Eh8wR0hzzgqnh4BFSF9EbJvHCDdy6U/xeGYHb0KOVpH+v6N5VZ9tp0KCZNafjIKS1bhd/E5tx8A1l6YCKOFajtpr+i+j69dg36RHSzIO8klPWV0tjFdXk6iQt5mz0GyTz8kZL+2Ae9HcoxgP9GBdxrcYh5ZQAn3PtOIUrAwVA6hxD7f2XGrNXhh9XqVjCn1PKVYkenSHiFJgvZtvUyRtZfc1huV9KtVS5Xfe/adnOBcdUyMlEXuvJjrsoReNx6pnwiokum3oS5nVBD+Pie0N9f/6Aed2dfbF/AkIapelTgLg4OCNDvTAcGDo6s+Lr6Y1Q==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by VE1PR10MB3791.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:169::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 10:25:21 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%4]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 10:25:20 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>
Subject: RE: [OE-core] [PATCH] sbom-cve-check: set PV from upstream tags and
 ensure version checks are correct
Thread-Topic: [OE-core] [PATCH] sbom-cve-check: set PV from upstream tags and
 ensure version checks are correct
Thread-Index: AQHc4feOvj824O0d+k+1jYZdCs8HKLYKK7UwgAADP4CAAAAmoA==
Date: Tue, 12 May 2026 10:25:20 +0000
Message-ID: 
 <AS1PR10MB5697CACF2C8E08CEC0842DAEFD392@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260512101002.2282038-1-alex.kanavin@gmail.com>
 <AS1PR10MB5697F0913DB780BDCC207D55FD392@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CANNYZj8oQBkKCETD92U3RhJkEtqiyv0b0j8XS5VgY__AH9UDAA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8oQBkKCETD92U3RhJkEtqiyv0b0j8XS5VgY__AH9UDAA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=17c5b105-f0f5-4d3d-9f1c-90db12aabed1;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-05-12T10:24:30Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|VE1PR10MB3791:EE_
x-ms-office365-filtering-correlation-id: 55ece4bf-a7c1-4403-de0f-08deb010c4cf
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|55112099003|38070700021|11063799003|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: 
 7KBsF+tpTroyvJVt+bR3ZWi+T5nTPgNCVwX52W9DCChoLOCrlFBoYFQqbJcNyp5PbFAhwSadC033ofbWqLQBFFkn+Qq5WAr3iYNJz33xAwhTFgfp0+WKn2r1W5VRi/D9QTByXbLDjJuYb6d8FOEpalJWssSt8HgFjZ5EkV+lv1JCAbBruJ0DI6NUTzxw81vsah3+RIyaDbrRN2xJ1s05EJGq1sCbUAK/J2FBYC4XEsNyiQySy4mnFgL2rg6OBgvNFuNvBmlmCKulVHVwn8J1Rv+PzZY2ln+KYSofbP3OEr8iBJnXmvuG4bJwdtT8eJ6jg8ZvmuMEowoYZTrzocCuyK/OJxY966Cb+BHAH3j8cPY4MAOs/Rn8OzhxeHl4MDlYHu048amko29dwpRgHXyR+fsBu39nGJTeVScfOa44xDm0S4V3o0We7VwYUpcn9MPe9Fzi2WxfKOzyTTq0fcMTLKi9Xrnjrm3jQp1yQ4lxhK30ON6XD7eCdSS9SW8MLP5/IdXk9gbpLwPtiMsGi56JYnpoolDOAxa+mrzYU3uw0sW0euxTvV6lyYm3NeQ2Vs1L0zEAJ9flNZpmZfwQXuZ7Q3JzUHO/T1w+rLF+nvDItoWCUKr50ZCDwTBDRITBe0dqeKQ322J/8+93A8yrBhtifixogNHt+oEjXaGh/8MxHMU69NuZRS7/kPKYERAdwmif+IYrBcyYN8Cj3FiRY79g5yd3uhI7d3TeEbQeKSHDXrzv0/nwYY8KK2uwIwMVVycR
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(55112099003)(38070700021)(11063799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?STVYamxuM3M5bXc0VWZBZUxXVE94RUJWMm9kUXh4M2U5N1lvZExvRzJBUEg4?=
 =?utf-8?B?NmxrU2ZiM3ZFMHY2MFMyRkQ4U1Z3a01WbnNSVjU4L1Jyc090STVlQjgzamd6?=
 =?utf-8?B?K1BRMG9qRU1jMzhxUkozSTd6ZXlMYjdTdHRQeE1rWkdnVzNzdHcyeUh1Tklw?=
 =?utf-8?B?czRoaUpJblVlQXJZWlN1WnVHaGE0MUp3L1A2K1RNVXVTekZJejg4MFBpbVVK?=
 =?utf-8?B?VFFseDNiSS9nY0RZNUxzL0hQWmpSaWdKbnR2ZUhvdTRJUk53Q2FyL0t1VEFj?=
 =?utf-8?B?OTBrRkNTQ0RpZURqOUg1RGhUNUVhazE2cU9XdVdocFBINWhjdnVNdVRqbXlO?=
 =?utf-8?B?K2VqUnFjRzNGdHIwd1k5VVNXM1lKZFdIMXRvSXgxMUgyVzg4Vk1NWng4ZFdR?=
 =?utf-8?B?NGM4bFZWNXJyV1BrWHY4QlZHb0ZNT1E5cHN4b0p6RWRBOW5aUEVGRUZGSDNp?=
 =?utf-8?B?ejZaMnNENFJhc3A0UUF1WWwwTGJhcXdHZXo2dEM0RUlYNzQvRTdnUS9WVEUw?=
 =?utf-8?B?WHpwNy9lYkxYS0lvd291dXBuVnFYSjhzMU5LUTVZZ2l2VDhpc1B6UTBJRFMy?=
 =?utf-8?B?QUdaWndMUzVqRGZ6aXlwUVhoRm5mOTQ1N00yaXJ1Y0dnK1hYSWUrejlaNXha?=
 =?utf-8?B?OW1YWlA3QUh5a2hHdUlmUjNHNmFXaFI4a3VXczlLY2s3TVd5VkpOOHNmdStO?=
 =?utf-8?B?UzZxUGhNZnRMSWE1aEhsZDlCL0hid3BHbEZvcUlEOGJ3VHlFTDJ4d1VhanFa?=
 =?utf-8?B?NEp2WmZJL01WOU8yeWZHVUNsMlRJS3JJQzB1UVI3U0QyOGNiWE93UUpzL05Z?=
 =?utf-8?B?ZDlrOWpjYUJiRzdsSmdzeEY1bGNCajBzQW9wc0dMSHdFaEZMemtCU2tSQ0RJ?=
 =?utf-8?B?NCtmSUZuelpMY0FmQ3RjRDZTdG5rY2xwTXBMQW0wcmNNZUlHMmNaYnpNRkQw?=
 =?utf-8?B?VDR5OHFPMS9jRmpHUEJVa1VnVHUrK1BvZmVhMWJVSG1tRURQMldsSlBJSlRw?=
 =?utf-8?B?cWRXU0t0d1NWNVRLL0lFSEt6MzJSSWtuSDFMMVZtWFdVQ2hnZkpPLzhjYVRW?=
 =?utf-8?B?S2ZVTkNYSWx6SFhrbWdUbzd6YiswUHppZHFQaXZFdW5mN3NtSGVnc3FXNHhI?=
 =?utf-8?B?YnJaOEhqbUNZOU5TZkVwQmpoaTRMOWhkT1pXVjBwa0liczlBRUFNNW42V2Zu?=
 =?utf-8?B?MlZsVHYxaGEzQmZpaVJGT0JBS0xjVm5xRkZtZ0JqVEh5andEM1RQcUJmdTlI?=
 =?utf-8?B?eHU2dXFVV2hVMDRsWFhwMHU5RElUaklTQUJXc0hzVWQrRTY5ZXJLTkpEMmlw?=
 =?utf-8?B?MkJyc1lMWFNiWk5XY2hwbC9aOXMvVHVFV3p2UzNDamlSV0xmbXVtMjFTMFVq?=
 =?utf-8?B?VGpOczByMGdCdGFlejdFY0R1U2hlczJwMVlhUlpwcm02ZjEzOFE3VjVQb2Zi?=
 =?utf-8?B?Tlc3RWVGZzl2Z3dpYTVXb0NOekpBMDA5YnpmaUk3c0Ztbjh3UEdiTFlMQldM?=
 =?utf-8?B?bnBIZkdWNkdkS0lCQXNPT3FpQ3BsZ2FkbWJkcDlIbVVIdk1IclB3YmdjcHRp?=
 =?utf-8?B?ZXRsaW5pZGU3U2pCakljbjh1Mi9EZWRWbytwS1dWOTV4UnlhUWpUWmJpTkpR?=
 =?utf-8?B?ZXA2dE1PeFQrNTY5SzFyS29Bc2ZoMGhFdkNoWVZVL0xMRUhCU00vOS8zeEdH?=
 =?utf-8?B?OGRIay9Sb2ZNQ1VvUGpDcXNTa01GVFRaT2xCWmZJUFRUOVN3WHRLeHQwcjVv?=
 =?utf-8?B?c2libGFFeTd1TThVcE1sREJkY3lQS25DWHhKZVBvT1BFNGhJV3ZneUR5RVpZ?=
 =?utf-8?B?NFdEdWJrdnYzdnkyTHRtQVN0QXAvTU1rU3pCaS9lWEdMUVYzS3lHZ3o4aUpO?=
 =?utf-8?B?VTQySUJYcHJtRk56TTg2THY2TFpxNGJUWVF1Q20xN1BpQVJvdzJJNkdyMW9V?=
 =?utf-8?B?NFhvK2Fmc203dFNRUjArR2RlTnd4cVBTc2FyRTZFNE1BRGlrcUR2bGxYZTV1?=
 =?utf-8?B?RW1CNmFZOWUxQTdLYVdVU2VQaS9vZlhIWGV3T0JoY0RIL0pqcVdENkNET0hH?=
 =?utf-8?B?OFAwdTBMWmRQSVRpUVZFR0tXUmFLbGtqVEpSQ0pFT0RhWFFoYkg3OGhEWGMz?=
 =?utf-8?B?Q0E5eVRVWWkxR3VKRkFnQ3IvMU8zMGVsdVQvc1ZuMFFZY21CbkxseGdKd0R3?=
 =?utf-8?B?OUpyYWxDMkpoUGxaM3J2ZEJrZTM0YU9EelBhUDVtVElyaG02Rk1OQ3NHLzkr?=
 =?utf-8?B?RGxCYnVkTTkyelhOTC8zd3hCZVdXTlRqTDYrUktmMjhJU3N3akhCL0dKU0M4?=
 =?utf-8?B?Tm9DS05QdmhlMjZEUWVFYnVRR0pKWFREM2pxS0t6K0d6cDRVUUF5UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ece4bf-a7c1-4403-de0f-08deb010c4cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2026 10:25:20.0997
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QjgQ4QUYV2klPl8mueqaZMkt2EOMiFzqhQRLnrcV1mG9XX8DVEmQXTiA4B3BUqgwEPV51pb0w2n7AEL/NYM1LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3791
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 10:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236878

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleGFuZGVyIEthbmF2
aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE1heSAxMiwgMjAy
NiAxMjoyNCBQTQ0KPiBUbzogTWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpIDxQZXRlci5N
YXJrb0BzaWVtZW5zLmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc7IEFsZXhhbmRlciBLYW5hdmluDQo+IDxhbGV4QGxpbnV0cm9uaXguZGU+DQo+IFN1
YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBzYm9tLWN2ZS1jaGVjazogc2V0IFBWIGZyb20g
dXBzdHJlYW0gdGFncyBhbmQNCj4gZW5zdXJlIHZlcnNpb24gY2hlY2tzIGFyZSBjb3JyZWN0DQo+
IA0KPiBPbiBUdWUsIDEyIE1heSAyMDI2IGF0IDEyOjE0LCBNYXJrbywgUGV0ZXIgPFBldGVyLk1h
cmtvQHNpZW1lbnMuY29tPiB3cm90ZToNCj4gPiBUaGlzIGlzIHByb2JhYmx5IG9sZCBjb21taXQg
bWVzc2FnZSB0aGF0IGNsYWltcyBQViBiZWluZyAxLjAuDQo+ID4gSSBjYW4gc2VlIHZlcnNpb24g
cHJvdmlkZWQgaW4gZmlsZW5hbWUgb2YgcmVjaXBlcyBiZWluZyB1cGRhdGVkIGluIHRoaXMgY29t
bWl0Lg0KPiANCj4gVGhlIGNvbW1pdCB1cGRhdGVzIHRoZSBmaWxlbmFtZXMgZnJvbSBub3QgaW5j
bHVkaW5nIGEgdmVyc2lvbiB0bw0KPiBpbmNsdWRpbmcgYSB2ZXJzaW9uLCBhbmQgaXMgYmFzZWQg
b24gY3VycmVudCBvZS1jb3JlIG1hc3Rlci4gRG8geW91DQo+IHNlZSBzb21ldGhpbmcgZGlmZmVy
ZW50Pw0KPiANCj4gQWxleA0KDQpNeSBiYWQsIHNvcnJ5Lg0KVGhlIG9yaWdpbmFsIG5hbWVzIHdl
cmUgc2hvcnRlbmQgd2l0aCAuLi4NCg==

