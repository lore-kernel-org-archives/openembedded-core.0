Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A4AC54E66
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 23:17:00 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.57])
 by mx.groups.io with SMTP id smtpd.web10.10921.1710371813314773389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 16:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=OTBBJsfJ;
 spf=pass (domain: siemens.com, ip: 40.107.22.57, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8BtL461mJUJvH3BHf+ut3gKohRmGZ+jS68ofx9oL6j4z5x0I2Y2NSPwNX1N4oBNNGJpTCSDF0j/SKq/jb/PgG636QLW6m5+3NK8HpWfHXzeYAI3YiE5W1Z+7ckQ5bP4OX+UMwcrcZ5k6DDIa1jkh6LTBjSvU3NH9Of+xICLRRo61LZCQOlU5ebiyX/Kl1g+cDaAFKHEVp8GXtwQIdC+JChO0j+MxNYPpWMu+F1UfvBZa2sCkWMwDxAS+5vpqTw13vqrNWgARI8OlnVlhDdPP+Ge7KwLfXhol/xnPaybr1cxCFPShjMej+FH061nERNBgoj2UHIUG/zZD4ilYNf42Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1BsnkF03czvfG7tsFWamm1cHHlZ7OQnJczQfPGKfyo=;
 b=DWUHUH4Dy2ZvCeK1VTjfGPx/C32pLkCUh/PFZOwwDhw+LKhec3+MwMnJqtjPprfzlxC/m6luoyhw6ZYFjYwVDAbktfDJc0KwXaAiuA08KIDryZFx6X5QFe96IG3z8gFBRC5sS4PfHT0QiQMXJb/Bk/W7CGkLDU+owjDnDSdpUpKRVDhol+dNqGlLU8AyNEEcleAxG0EUkxirxci+2NWSMoWYf9YOg9/2IeNfYhboaOjYRvnm6e4LUAzzKS5Rh1cKbx3NYiz4numUOREdR8sisyHafd8+wU0RVrH0k5WhM3Td+FZOpMrYc3LNFybjwHIPisCAHoYaaOtJ7+r7QJToMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1BsnkF03czvfG7tsFWamm1cHHlZ7OQnJczQfPGKfyo=;
 b=OTBBJsfJEHkuzdK2x1TF1Auf8/xmPgpPmvtlUAwy3C/sQ37vqll0T78z22q2SjBoAeJXNCgTxmTiSZm5E/8HaU40ksf0j2Gzg/cIlXhR14TjsKfm9gusp/8oxxL//b9NlMu5W65azb1Fl4R9eiSl48wAwQcdZ///+8hkcnc4nWFGjWOKSriMbS+pWsV9NMCatsOhR9VqTz0K8mrithusMpYNbXWW1/d2gcV99wTVEXWkK1q9eNojPQz10xKf/TcryeQ1I3RBTX0dXB0MS533V/4wvO/7GSCbBOn9KPz1o/+ONqpRVAZl7hhnXyQCOncehTZkncA6wAXhcIU6YUmNnw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB7360.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:444::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Wed, 13 Mar
 2024 23:16:50 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fd78:3502:7564:1891]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fd78:3502:7564:1891%4]) with mapi id 15.20.7362.035; Wed, 13 Mar 2024
 23:16:50 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] meta-ide-support: depend recursively on
 populate_sysroot
Thread-Topic: [OE-core][PATCH] meta-ide-support: depend recursively on
 populate_sysroot
Thread-Index: AQHadW7PAXyLU1WcwEazAWXLeh/Xi7E2OfEAgAAPMrA=
Date: Wed, 13 Mar 2024 23:16:50 +0000
Message-ID: 
 <AS1PR10MB5697015A57EE67279A40D02EFD2A2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240313174844.3580697-1-peter.marko@siemens.com>
 <8255529b7b4bdbc695f53e1ad4e9cdf9162cb785.camel@linuxfoundation.org>
In-Reply-To: 
 <8255529b7b4bdbc695f53e1ad4e9cdf9162cb785.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=e3f313ae-cdc2-44ad-96e0-408107015330;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-03-13T22:58:45Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB7360:EE_
x-ms-office365-filtering-correlation-id: 83d7a4eb-e853-4e19-d8e5-08dc43b3a997
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vh3cdHVdmVjX7YGrm5Jmvrnfq8o7I8XN4OdRzQEyu+d/dQXTnwNG03p4wv1o55XevBjqTAPR9A8sRcN/8z+GEM+3OQfolMZ/9JY30J/PGv0xi6nSHNv8VVTYz0V1wT2NEQ5sRkwA9n2dWReOA6e9SISLTQsKbgRYJ7xpZk0J7VLrQYwnot2lcchNM43O329QSX2k4N/20lyvDmHZ3lcW2wBVG1vSlzWiSXC62c4i9OXr4tHrELsk1ELX1AJwupojdfOV98UFLuuzryAjzo7/twqfFdz/KKDNE4c/M+Q2WnViC61UCF9hyrfz03wyE8FdWXb11xYoTYW3ytlxx5IrXzNznzj8bl23Fy46gYXP61WgvLvFbi9k3PX/ERu2m36ghZrQYcbPHMKn2RrWN26N91sJnQwulvb92HfRCMPzwNgyKMm4coUAJQkr0w7si3xWm8/nSMbHYihl2ErTNi3tl1fPUqiutRZ/Zzy8TSHjJLi7ST3KHQvOc06MCCZUUTAPegvjIQvyRAaa8m9vliGc+9Fwq+xPzm1eHhDu4zkeIOkOBejwU1iDM5vQ2+hH3CVr2VYT713VOnNnaOx58ES6Lg/2HDBcE16XQl779laWmM8eIYIj6Yvx0a8VgBb013Dfvw/KvGSh0wNufe8XYEsnjODvtaAINn9CeJACbiIaFEI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dC9xaHEvYzNDWXNQT0RPZy8vQUJKeXZ4NjlMWGJOU1hrRXlQSmdNQkxwK3BS?=
 =?utf-8?B?QnFGbnIwc0VhdlR2RVJNaUJFM1c4aENTOFVjc0hWMzlkYkxIR1pIQ2dqeElG?=
 =?utf-8?B?RGIrVk9KSE1naVJ1eGhyNzdDT3ozeXhRQUl2QTFaQzhSR3lyajRKY3FiTnBr?=
 =?utf-8?B?bTJCWEdXNDJHcVNqVEsxWmJsYmFWT2FCY2x4Z3pFMHREVDJJTXQyVVhXejh1?=
 =?utf-8?B?VThSRGVzc2I1aTczMlhnT2NrOEtkcVJjUnh2NEhtSW01bkZzdGZBNDQrZngw?=
 =?utf-8?B?cmZ4eHRoZVhZK3cySEd0OThHU0U3THBDWWxQWWc1TS9jR3lzN25LbHYvY2tx?=
 =?utf-8?B?dG5zczFGQ3diVHZjeFpGSTZGeFFPNk56dHdaSFRnMUNhZUlDSzdzeHdOT01J?=
 =?utf-8?B?VnFTUkhtQWlQdncyTmgzZXk0dW5OVXQ2cm9HQ0NqaTJoUHh1cmFHelZGSnll?=
 =?utf-8?B?MTl5bWY0U2Z0b0tNYk10STJVeDFxazVObHNjRUdRYnVpN201RVdaQnJueVN6?=
 =?utf-8?B?ck80NFhDMnAwa3g5M3FaQkZ2eENuTDd2RFNRUU5GeHFrbDgvalB1NmRPMjRn?=
 =?utf-8?B?bWRDOHRZZmx3UVNnb2lhdjk2SitYSHovN2F6aG9GM1I2MGE0OGdOM3IvZmo0?=
 =?utf-8?B?eVRtaE1DTEdteUtDMjNyME1NeHdlZlF2eHo2ZThRNUg4ckJQRUVsWWFqZ3lk?=
 =?utf-8?B?bFF3RVZJRlhoenZCbGFuSlZ0QVJLa2dHUVlobVBFVVF6U3ZJSGhPeGZGRHdN?=
 =?utf-8?B?QlRqWWU0OFV3MnFVeEJrbHo1KzRZM0pscGVaVnNmV0VwUzhSUjJyWGFwSUEv?=
 =?utf-8?B?R3BlNTZZeEltWDZ2QUdSVkdKdWJkYURmdWhxYTZOc09jQzBzSHVXdGgrbzVk?=
 =?utf-8?B?M2JscnMyWVBXcmUzOVpHTE83U3pJa2VOa0lTL3gwenlmOXIySzZVZTEwbTgw?=
 =?utf-8?B?MjI4QzFQd252UFNzV1dBMHJsZ0ZnYUY5d0VKVGtpaUg5WHVBNkZYeUpjVHMv?=
 =?utf-8?B?UjZ2YUhTVjljelhhUVFpZjBjZ29iZk5GK2xIMSthUmNpVEo5NE43NkpCQjla?=
 =?utf-8?B?VWFCZzZWcC9jZ1Vrdm9iNjZzRUQrbU1uMWVISC9Xbzd3S3VHemNSa2NWZ2V6?=
 =?utf-8?B?VFJuc3E2ckVlQnRoYmRSMTl2VWFrV2FEeXpxbnB6WXdBN3JTWXpyaDRVbmU1?=
 =?utf-8?B?SHo4bzRWM1dFQjVuVUdrWEozMXhFZjNwUm1aZkE0WGNnZWdvcm9Nd3BxQXJ3?=
 =?utf-8?B?NjN2RnhleGxOcDFkNkpKTzlEc283NjNMUGlnVVp5NHF4OVA3Z0l1M0Y3UE1P?=
 =?utf-8?B?NzljSU5VNGxxejhob2lrellwM2xoK2JleGtsNkZLam84ekhOTUR5TlpLL1Vx?=
 =?utf-8?B?dWV3ckRlclluR1RXQTZpUll0VDUxTlZNMllWUDRXYVBRdVNpOVBXMitWbXVK?=
 =?utf-8?B?ajZTVEF4dmNVa2ZVa2RXelN5REcrc2pOQlRVOUhHQ3VmTzhwOFVtT2s2MHhJ?=
 =?utf-8?B?UUpXaGtTd0RYTVpxVUNob09LcW1UYmlHZ2ZLQlNoS0dUVUorSHliT2RrVnVP?=
 =?utf-8?B?U2dHeUNMRWZmWEVPYlVQTTludXhSTVduNzgxb0lJRkFCbjJyVmpaOGtaOVdT?=
 =?utf-8?B?UE5oK2hxcDZhSng4bXh2SHQ3UmhJVDJXcWRvd1pFR2FCb1laby8wTXZ5M0gz?=
 =?utf-8?B?N0V5dmFWbndoL3JlbDBVNStYMTBYU0hqRmdlbFlzSjZuc25Lb3pQY2FaNVlM?=
 =?utf-8?B?cFIrWFpwYnBhNzEwWmRCbGQxL1ZRckhteVFTVk9kV3kyaGtITTVrV3B3bStv?=
 =?utf-8?B?dGV5NVBzWHFKN1FNK08rZWlMb0VVemJDK2ZpVHNTN0JFRGlEUmFiMjVPdzFx?=
 =?utf-8?B?ZjFnSE90WkdvSzlmNy81NlkxK1dJa0Vjem5pNE4vWmg5a0hwbitaMTJWZnM4?=
 =?utf-8?B?OFM5V01oTVZ5ODBUR0gwV09RUTBhaEd3aUxiTkZWWEU2NnF2QnpreGl2eFFo?=
 =?utf-8?B?dFh1YVVlWTBUQk9nVmUyVUh2NWIyUkdYYkx1WXI2TVE4b0U4K3VQUGl2V0dG?=
 =?utf-8?B?KzN1WThOTEUwamxwMGliV0h5WVpLRnR6VnQ3aWRPOWhqZ0pRZEJ3eHhka0h4?=
 =?utf-8?Q?mBjTBX1XUrwTcVXNqHeBwYwA9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d7a4eb-e853-4e19-d8e5-08dc43b3a997
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 23:16:50.2813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hqCz6kT2tQow+pT0K0NIYI4oggFZft3eiF1IQfR/9BeQxLn3ke9KPuIaaiMAjQzWEqFGz+UirlfuC40YQyCfIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7360
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 23:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197094

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJk
LnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPiANClNlbnQ6IFdlZG5lc2RheSwgTWFyY2ggMTMs
IDIwMjQgMjM6MDQNClRvOiBNYXJrbywgUGV0ZXIgKEFEViBEIEVVIFNLIEJGUzEpIDxQZXRlci5N
YXJrb0BzaWVtZW5zLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0hdIG1ldGEtaWRlLXN1cHBvcnQ6IGRlcGVu
ZCByZWN1cnNpdmVseSBvbiBwb3B1bGF0ZV9zeXNyb290DQoNCj4gT24gV2VkLCAyMDI0LTAzLTEz
IGF0IDE4OjQ4ICswMTAwLCBQZXRlciBNYXJrbyB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9y
ZyB3cm90ZToNCj4gPiBGcm9tOiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+
DQo+ID4gDQo+ID4gRm9sbG93aW5nIHdvcmtmbG93IGlzIGJyb2tlbiB3aGVuIGJ1aWx0IGZyb20g
c3N0YXRlLWNhY2hlOg0KPiA+IGh0dHBzOi8vZG9jcy55b2N0b3Byb2plY3Qub3JnL3NpbmdsZWlu
ZGV4Lmh0bWwjc2V0dGluZy11cC10aGUtZXh0ZW5zaWJsZS1zZGstZW52aXJvbm1lbnQtZGlyZWN0
bHktaW4tYS15b2N0by1idWlsZA0KPiA+IFRoaXMgaXMgYWxyZWFkeSBicm9rZW4gaW4ga2lya3N0
b25lLg0KPiA+IA0KPiA+IFJlcHJvZHVjZXI6DQo+ID4gJCBiaXRiYWtlIG1ldGEtaWRlLXN1cHBv
cnQgJiYgYml0YmFrZSBidWlsZC1zeXNyb290cyAtYw0KPiA+IGJ1aWxkX25hdGl2ZV9zeXNyb290
DQo+ID4gJCBscyAtMSBidWlsZC90bXAvc3lzcm9vdHMvKi8qZ2RiLWNyb3NzKiAmJiBlY2hvIE9L
IHx8IGVjaG8gRkFJTCAjDQo+ID4gc3VjY2VlZHMgZnJvbSBzY3JhdGNoDQo+ID4gYnVpbGQvdG1w
L3N5c3Jvb3RzL3g4Nl82NC9tYW5pZmVzdC14ODZfNjQtZ2RiLWNyb3NzLQ0KPiA+IHg4Nl82NC5w
b3B1bGF0ZV9zeXNyb290DQo+ID4gT0sNCj4gPiAkIHJtIC1yZiBidWlsZC90bXANCj4gPiAkIGJp
dGJha2UgbWV0YS1pZGUtc3VwcG9ydCAmJiBiaXRiYWtlIGJ1aWxkLXN5c3Jvb3RzIC1jDQo+ID4g
YnVpbGRfbmF0aXZlX3N5c3Jvb3QNCj4gPiAkIGxzIC0xIGJ1aWxkL3RtcC9zeXNyb290cy8qLypn
ZGItY3Jvc3MqICYmIGVjaG8gT0sgfHwgZWNobyBGQUlMICMNCj4gPiBmYWlscyBmcm9tIHNzdGF0
ZS1jYWNoZQ0KPiA+IGxzOiBjYW5ub3QgYWNjZXNzICdidWlsZC90bXAvc3lzcm9vdHMvKi8qZ2Ri
LWNyb3NzKic6IE5vIHN1Y2ggZmlsZSBvcg0KPiA+IGRpcmVjdG9yeQ0KPiA+IEZBSUwNCj4gPiAN
Cj4gPiBidWlsZC1zeXNyb290IHBvcHVsYXRlcyBzeXNyb290IHdpdGggcmVjaXBlcyB3aGljaCBy
dW4NCj4gPiBwb3B1bGF0ZV9zeXNyb290IG9yIHBvcHVsYXRlX3N5c3Jvb3Rfc2V0c2NlbmUuDQo+
ID4gRGVwZW5kZW5jeSBvbiBpdHMgb3duIHBvcHVsYXRlX3N5c3Jvb3QgZG9lcyBub3Qgc2VlbSB0
byB3b3JrIHdoZW4NCj4gPiBidWlsZGluZyBmcm9tIHNzdGF0ZS1jYWNoZSBhcyB0aGlzIHRhc2sg
aXMgbm90IGV4ZWN1dGVkLg0KPiA+IFRoaXMgc2VlbSB0byBiZWNhdXNlZCBieSBpbmhlcml0aW5n
IG5vcGFja2FnZXMgY2xhc3Mgd2hpY2ggZGVsZXRlcw0KPiA+IHRhc2tzDQo+ID4gdGh1cyBtZXNz
aW5nIHRoZSBzZXRzY2VuZSBkZXBlbmRlbmNpZXMuDQo+ID4gDQo+ID4gRGVwZW5kIGV4cGxpY2l0
bHkgcmVjdXJzaXZlbHkgb24gcHJlcGFyZV9yZWNpcGVfc3lzcm9vdC4NCj4gPiANCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4gLS0t
DQo+ID4gwqBtZXRhL3JlY2lwZXMtY29yZS9tZXRhL21ldGEtaWRlLXN1cHBvcnQuYmIgfCAyICst
DQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4g
PiANCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvbWV0YS9tZXRhLWlkZS1zdXBw
b3J0LmJiDQo+ID4gYi9tZXRhL3JlY2lwZXMtY29yZS9tZXRhL21ldGEtaWRlLXN1cHBvcnQuYmIN
Cj4gPiBpbmRleCBkODVhYTEyMGMwLi45YWE4N2YzMDU2IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEv
cmVjaXBlcy1jb3JlL21ldGEvbWV0YS1pZGUtc3VwcG9ydC5iYg0KPiA+ICsrKyBiL21ldGEvcmVj
aXBlcy1jb3JlL21ldGEvbWV0YS1pZGUtc3VwcG9ydC5iYg0KPiA+IEBAIC0zNyw0ICszNyw0IEBA
IGRvX2RlcGxveSAoKSB7DQo+ID4gwqANCj4gPiDCoGFkZHRhc2sgZGVwbG95IGJlZm9yZSBkb19i
dWlsZA0KPiA+IMKgDQo+ID4gLWRvX2J1aWxkW2RlcHRhc2tdICs9ICJkb19wcmVwYXJlX3JlY2lw
ZV9zeXNyb290Ig0KPiA+ICtkb19idWlsZFtyZWNyZGVwdGFza10gKz0gImRvX3BvcHVsYXRlX3N5
c3Jvb3QiDQo+DQo+IFdoaWxzdCBJIGNhbiBhZ3JlZSB0aGVyZSBpcyBsaWtlbHkgYSBwcm9ibGVt
LCB0aGlzIGRvZXMgbm90IGxvb2sgbGlrZQ0KPiB0aGUgcmlnaHQgZml4LiBUaGlzIGlzIHJ1bm5p
bmcgYSBsb3Qgb2Ygb3RoZXIgc3N0YXRlIHRhc2sNCj4gZG9fcG9wdWxhdGVfc3lzcm9vdCB0YXNr
cyB3aGljaCB3ZSBzaW1wbHkgZG9uJ3QgY2FyZSBhYm91dCBpbiB0aGUNCj4gY29udGV4dCBvZiB0
aGlzIHJlY2lwZS4NCj4NCj4gV2hpY2ggdGFza3MgaXMgbm9wYWNrYWdlcyBkZWxldGluZyB3aGlj
aCB0aGlzIHJlY2lwZSBuZWVkcz8gQ2FuIHdlIGFkZA0KPiBpbiB0aGUgbWlzc2luZyBkZXBlbmRl
bmNpZXMgdGhhdCBhcmUgbmVlZGVkPw0KPg0KPiBDaGVlcnMsDQo+DQo+IFJpY2hhcmQNCg0KVW5m
b3J0dW5hdGVseSwgSSBzdGlsbCBjYW4gc2VlIHRoZSBwcm9ibGVtIHdoZW4gSSByZW1vdmUgbm9w
YWNrYWdlcyBjbGFzcy4NCkkgY291bGQgc3dlYXIgdGhhdCBpdCB3b3JrZWQgZm9yIG1lIGJlZm9y
ZSwgYnV0IG1vc3QgcHJvYmFibHkgSSBkaWRuJ3QgcnVuIGZyb20gc3N0YXRlLWNhY2hlLg0KDQpU
aGlua2luZyBhYm91dCBpdCBhZ2FpbiwgSSB0aGluayB0aGF0IGRlcHRhc2sgaXMgZGlmZmVyZW50
IGZyb20gdGFzayBvcmRlcmluZyBieSBhZGR0YXNrIGJlZm9yZS9hZnRlci4NCkl0IGlzIG5vdCBy
dW4gYmVjYXVzZSBpdCdzIGNvdmVyZWQgYnkgZG9fcGFja2FnZV9zZXRzY2VuZS4NClRoaXMgc3Rh
dGVtZW50IGlzIGJhc2VkIG9uIGZhY3QgdGhhdCBmb2xsb3dpbmcgcGF0Y2ggYWxzbyBmaXhlcyB0
aGlzIHByb2JsZW06DQotZG9fYnVpbGRbZGVwdGFza10gKz0gImRvX3ByZXBhcmVfcmVjaXBlX3N5
c3Jvb3QiDQorYWRkdGFzayBwcmVwYXJlX3JlY2lwZV9zeXNyb290IGFmdGVyIGRvX3BhdGNoIGJl
Zm9yZSBkb19idWlsZA0KDQpJIGFncmVlIHRoYXQgcm9vdCBvZiB0aGlzIHByb2JsZW0gaXMgaGlk
ZGVuIGRlZXBlciBpbiBiaXRiYWtlL3NldHNjZW5lIGNvZGUsIGJ1dCBJIGhhdmUgbm8gaWRlYSBo
b3cgdG8gZml4IGl0IGF0IHRoYXQgbGV2ZWwuDQpTbyBJIGNvdWxkIGp1c3Qgb2ZmZXIgdG8gcmVz
dWJtaXQgd2l0aCBhbiB1cGRhdGVkIGNvbW1pdCBtZXNzYWdlIGlmIHRoYXQgd291bGQgYmUgYWNj
ZXB0YWJsZSAodGVtcG9yYXJ5KSBzb2x1dGlvbi4NCg0KUGV0ZXINCg==

