Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5844CCD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 18:04:41 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.92])
 by mx.groups.io with SMTP id smtpd.web10.8520.1712772273227349670
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Apr 2024 11:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Rs/Ml7qR;
 spf=pass (domain: siemens.com, ip: 40.107.6.92, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4fR+GBtHzZzWaB8IfChQrJl0h5eArLwgn+fKO/EF06kn4CbWx+iSdKXggJeeZFwDDbbndMKgTk2A7Y76TKfKxOiKRJVFlGT/cD5yYJiMzUd3jyu9wa8rGc7YZaEUw+bLqdJgi+U8cphton5I1/U76/AN2XKrAzi32hl7zceGtvFXvg7OaCgbsaNlwehHxtipdytcWq1fuAQNNftwj1WJt1WhNJOxNgbE76tzg0ws5cU0rNMXfLhg8c8EvFCsoclw2UMRQ/J/hzVOgXcdx/5m8Reap3msjtSnA8RaKOHZ3unpIo58O+eIo9IMxyhlyt26jhbhM6tkfTAqi32QzR2fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qswJickHPWzFAfElu1B90bZoKmnToZqZpVKbYoYj6bs=;
 b=FOO1PnihUqFxc/A/TwPRZGrZ1adPsUPqxhn7uuC4VDJ2g/+6jV3IMEp+48bfGNLmwpHzfD71+BXzUqOMjm8bT2vrsD21YiYa+t1Nfc9vSKXI4Y/Ic4cJP/xtBGG+0G+CLC2rAmJPnJEahnOh7Y6d2Uj8O1GbpTOsu3Ywe1aa8mZON8IFFtuzpPCr6rqp0+mSbMvP0NXLK7eMF3sceGyQxvjbPnPWNZrdrZ87QZIGA/aobO2S/v3jYwnCDbrBkIbHTxFM8tdhzLU1hF/mXKrZznHNv+lo8WPxy5Djo8+W/QjmrpFIC8RLVXfElw7t+5dd2ecQokWykOvLXwn3Gds4wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qswJickHPWzFAfElu1B90bZoKmnToZqZpVKbYoYj6bs=;
 b=Rs/Ml7qRCCiHBFla+s0HMXeI3z3/RtZ/VUfBWNVkTHUUSEp2/6500ZIsReuR4VA94CZmfATAjxRqAK0dAiR+4ZtQ4KwG1sLzXyRC/gBV8YnkUqY/21uN+wT1hHcMjTechIwsQvAqVOW38rFW45I+abZUaJWHa/9dvqZfGZiKLLYlLrKJYXPqTCOAeejhe1BU3S4yvhry53h1831H+KZ7OmWmgULgfMSpE8JFt4ZNL2MG/sbOjZwJ11ozc1WrjqdIxXGTIlCWPU3j5QbKPbH2cxW5W3alSGR5WOaN0JJ9HA0uAYoDzayq2eRDqs72vevbiBCjEFUPuwiUKBQn1nstEA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AM0PR10MB3684.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:151::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Wed, 10 Apr
 2024 18:04:30 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fd78:3502:7564:1891]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fd78:3502:7564:1891%4]) with mapi id 15.20.7409.053; Wed, 10 Apr 2024
 18:04:30 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] systemd: make predictable name mac policy
 opt-out
Thread-Topic: [OE-core][PATCH] systemd: make predictable name mac policy
 opt-out
Thread-Index: AQHaiYMz9L+lb5XHbEKUptuivabAZrFhsmKAgAAWwjA=
Date: Wed, 10 Apr 2024 18:04:30 +0000
Message-ID: 
 <AS1PR10MB5697E503E226D55C1F88550FFD062@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240408070450.27686-1-peter.marko@siemens.com>
 <2E4C61C4-1C5A-46C8-A193-3C484F5D634A@arm.com>
In-Reply-To: <2E4C61C4-1C5A-46C8-A193-3C484F5D634A@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=499c6af3-fe7f-4f53-b3a9-91d19dc97404;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-04-10T17:39:48Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AM0PR10MB3684:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 XfvpyZ53a5PWtXJnur33UI0IhQ+fBzWDsGbjE4xkva3fhvYgxgNjeVq3fBzBX7I1EIHug6Y6h1C9zewzWzGnAVoVUxYHuOgkOW+8EhlZQQeM8o2P9mH1WH09OR7OSuRT1+z+/OafYwN63Vn0mQC6Xx9g7akA9EDqLXI/ECKDXnRkB1Xa5Nf3aMlqEBqHwMA7fxyQGKA6KQIwuVSZHGt9UD4cp0HQlbGWuk0GyJ0brFroa2KFqigfpr8nX55M1SlBl7YGynOgsaVDEuwfS9EQyudFC+VXxz9v2WgodQtU3eO0tLn5oRxwwvYwdYfsKHNgVXnoOKCuAQkR3Bif/Kqf4J/0oCafCbITaabiI7ArvgSUo1qYeLnrrQvqiXdDEdjLLZYCvwSOJqM91Bdu8O34TthWgqc62td/3zpBAmjriQJwCdmidP+0TtL1hjaQu1w+qjeX+itvQbyoxghYx+HVzggKr6h6H2CT+roupiNncYuQpMeLKY1Lo2MDS/BGeKmNBiNbbjVvVOVdPbt42yaX59pizZ4orlPdTTOd4FBhMskNJ8EH0/F8aEuhsoG0CAuktYO+KIXYbxshvfeK8ZjhhHaSGjTVYN2a0if+acxbfIQ+1iT0I7/DUAxAhqyoyaVcmqkDwmrHeGBvym6zh7k3na/LhgazhhPG/HEq0m7trT0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aTJ0WWN2eWFIWnk1S05oK21hdlVkbVI5Q1Z6UUZnRzZVQ0I3ODlrSnVMWTJO?=
 =?utf-8?B?VURzT3FPK2Z6ZXRDVE56SHJHYmFTdE84d3lkQzFzNWNoOGpUQndBbU4wVUs0?=
 =?utf-8?B?STFwdzY0SUFIMk9FcERJaUIxZFlBdnFXd2d3clk3Y1dkNjBBUG1Vb2R2dlc5?=
 =?utf-8?B?UFc1YnNmbzdWNVlJOUk1SGlNS2dVS1g0SjA2RDRuVW5GbFd0SDlLaGg4M282?=
 =?utf-8?B?VTl3K3Zza25YdEZ1S1hjQ3RLRTcwSU9LSlB1d2lTTTh3Z3owTDIxMW9oWUcr?=
 =?utf-8?B?bUNrbHpiUGp4cm5nTWw0THZqQnBzTXNXcjduTDl2eWxwM0VySWhsbzg3Z0M3?=
 =?utf-8?B?bjl1WTdVM3ovajdXVjk5ZmlZUHlITVdyd2kzSm1ZdTk0Q3laOVJJSlk3bm1K?=
 =?utf-8?B?dUpZUCtaUDczdzcvMkxnZ1RDVS94NnFZSWxLWElCcFJiZlBPait2TzByMDBZ?=
 =?utf-8?B?ZkgzSXdESGRmY1lTdGw4OFRQdVY2RlBualVvTG5hZmlVZkdYT1ZKblpIYlZv?=
 =?utf-8?B?enFndERZa1ZLcW03TU5JcWtEVC9nM0s1eGNjRElIbHdWNjJuV1kwcEZHTVli?=
 =?utf-8?B?aXdmVHBhTXdVV3BKUDNpT0dFZzZYeGVEelo1cWxSYS9POGc4cVRNNHFneGpz?=
 =?utf-8?B?TUI3YVVnWXF1V3kvaFcxTi9zV1hQWmQxSEs5bndzV3lmSTBKK2pkekE5blEy?=
 =?utf-8?B?S3J4ZmhzTlE3RFhPcVNyT1JiazU1MGdzZjZsb0hvN1JaT292UEtsQzNwUnl5?=
 =?utf-8?B?Rkp5L2FGRnhYaGJnTjcxNzRuVlRnVWZ3ck4wUDY5d2VlQnk2aE01MzRib1hN?=
 =?utf-8?B?WHdab3NtbklPSVdBVGRYQ094MEwxd1NJVzZxeVdKR1U3SWQ0TU43a2dIMmc5?=
 =?utf-8?B?TkVDZ25UZE9xUnNPQ25EaUJEVkllQTJDZGJIY0ErbkNDR1RLZTFzcC8zOXZG?=
 =?utf-8?B?c0lhT052L3JxdFNnVEJSK1R3UHVDcFpGc2hOOU83eEJDOXdQVU80eUJqM1pN?=
 =?utf-8?B?OEtDZW1GV29lWGI1NEl2OWJ3SnlpallIM3BzbnluRy8vK2xpSjhibExLVWZE?=
 =?utf-8?B?SWxPUWc1OHpYckFqVW5hWVhMNk9YZ1hSRHdRMUFLd1YrU0pLbzVBRkRiaE1z?=
 =?utf-8?B?NURnRHRycy9JWUhYdzQ3bHF4cUtjMFhuUnFtM2pOZzBGeDRyamRwMTU2MmRL?=
 =?utf-8?B?MHhmTyswVnFVR3d6MGpoZmtseVhqTHJPYiswaEx1NGd6bDQ1NHpVeVhNTzMz?=
 =?utf-8?B?Z1FneHRhT0lvcjRLaTlQQVNRT1dPamFRV2dCcDlqaEhsNDlrTUp2SSt6akkv?=
 =?utf-8?B?MUhGaDR3M3BaelduNjNRQ3R5RXJPT0dTVUZNRnI0RzBKWTIvSGFlYmUwQ21u?=
 =?utf-8?B?RFRZN2Q2QXhHdTJIVm8xZk94NGxlWnFhYVo4MWhabDJyTHV5VkNkRms5M2lx?=
 =?utf-8?B?K2dJK1RNVDNFbmtMejVhano2QTZpY1NhRk4wbnpVVXdpQ21CRkl1dW0ybnpE?=
 =?utf-8?B?dFFIMUdlMEVydCt4c1ZVRitGdVV2czRFQk5TM09ZcGxHS3VEM1ArKzB5cW5K?=
 =?utf-8?B?SmlIR29QM1paY05ZUUR2dXVvb3lQU0lrUFUxOXIyZTQ3UHVENW9wZlZuenJw?=
 =?utf-8?B?K09tQWZlMVpTbFpQV251ME9hMFNETTI1N2hOR1lFR0pPWVBHZitoUkZ5VkRy?=
 =?utf-8?B?S094M3NLZmVrZ25QM1JJenpXNzl2RzVwdlBBMkdTRmtCMktBcFNNNGNFK1Vy?=
 =?utf-8?B?YjZTeWZrQ3p6UlBCNXN0TjlPbW9SWFVIemRLQnV0QnNkc3FjbEdSODgyazhn?=
 =?utf-8?B?RjU1WlQ4MXZxYzQ0OWlrdmIzMElPK2tTRUd0dzU0c09lVHRzY0FoclI3ZVJi?=
 =?utf-8?B?T2EyNWdCVjk0VmdVczkyRTlkdGtxUndMejdUR21HeiswZkFRbHk4eXhQT2l3?=
 =?utf-8?B?ZGY0T1JyclRyS3R0RllkYjdNZFlqaHZpWkhVdmhvaDZLcG1tVVdiRVpVRVc1?=
 =?utf-8?B?MkppakhONFBOa2lmbVljakNMak13V212Wkw4ekJKZ2tQWGZXRlFzVW5uUVBS?=
 =?utf-8?B?Vkp3bUJDUDFkRGljMzBoQXJxNEc3Vkg1a3JyUzFFaGJ4QjNPcFB2QnVVVUU3?=
 =?utf-8?Q?wmhEk8HTvtGRSKMe0UH1O3Zlw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4054e0fd-ec7a-4190-8dbb-08dc5988ab4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2024 18:04:30.3740
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hxvi4FMq11pSg7CM3RwGsWzCh8jA/bO/xyCcaIxTgHOMssD7YgxpxzemGYKaJP4pk0yBRURUUpbSOYLxzyquWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3684
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 18:04:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198105

DQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUm9zcyBCdXJ0b24gPFJvc3MuQnVy
dG9uQGFybS5jb20+IA0KU2VudDogV2VkbmVzZGF5LCBBcHJpbCAxMCwgMjAyNCAxODoxOA0KVG86
IE1hcmtvLCBQZXRlciAoQURWIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtvQHNpZW1lbnMuY29t
Pg0KQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6
IFJlOiBbT0UtY29yZV1bUEFUQ0hdIHN5c3RlbWQ6IG1ha2UgcHJlZGljdGFibGUgbmFtZSBtYWMg
cG9saWN5IG9wdC1vdXQNCg0KPiBPbiA4IEFwciAyMDI0LCBhdCAwODowNCwgUGV0ZXIgTWFya28g
dmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPHBldGVyLm1hcmtvPXNpZW1lbnMuY29tQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+IA0KPiA+IEZyb206IFBldGVyIE1hcmtvIDxw
ZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPiANCj4gPiBFdmVuIHRoZSBwYXRjaCBzYXlzIGl0
J3MgaW5hcHByb3ByaWF0ZSBmb3IgdXBzdHJlYW0sIGFuZCBpdCdzIGFsc28gDQo+ID4gaW5hcHBy
b3ByaWF0ZSBmb3Igc29tZSBkb3duc3RyZWFtIHByb2plY3RzLCB0b28uDQo+ID4gU28gbWFrZSBp
dCBwb3NzaWJsZSB0byBvcHQtb3V0IG9uIGl0Lg0KPg0KPiBJ4oCZbSBsb29raW5nIGF0IHRoZXNl
IHBhdGNoZXMgYmVjYXVzZSBvZiB0aGUgZmFsbG91dCBmcm9tIHRoZSB1c2Ugb2YgbWF0Y2hlcyBp
biB0aGUgaW50ZXJmYWNlcyBmaWxlLiAgIFByZXN1bWFibHkgeW91IHdhbnQgdG8gbWFrZSB0aGlz
IG9wdC1vdXQgZm9yIGNvbmNyZXRlIHJlYXNvbnMsIGNhbiB5b3UgZXhwbGFpbiB3aGF0IGJyb2tl
Pw0KPg0KPiBSb3NzDQoNCkJhc2ljYWxseSwgd2UgaGF2ZSBuZXR3b3JrbWFuYWdlciBhbmQgZmly
ZXdhbGxkIGNvbmZpZ3VyYXRpb24gbWF0Y2hpbmcgaW50ZXJmYWNlIG5hbWVzLg0KSW4gYWRkaXRp
b24sIGFsc28gb3VyIGFwcGxpY2F0aW9ucyBhcmUgaGFyZGNvZGluZyB0aGUgaW50ZXJmYWNlIG5h
bWVzIHRvIGJlIGFibGUgdG8gY29uZmlndXJlIGludGVyZmFjZXMgb24gZGVtYW5kLg0KU3dpdGNo
aW5nIHRvIGR5bmFtaWMgbmFtZXMgaXMgbm90IHJlYWxpc3RpYy4NCg0KQWZ0ZXIgdXBncmFkaW5n
IGZyb20gNS4wX00zIHRvIDUuMF9NNCBvdXIgd2xhbjAgaW50ZXJmYWNlIGdldHMgcmVuYW1lZCBi
eSB1ZGV2IGFuZCB0aHVzIG5ldHdvcmtpbmcgYnJlYWtzLg0KVW5saWtlIG91ciBldGhlcm5ldCBw
b3J0cyB3aXRoIG5hbWVzIGRlZmluZWQgaW4gZGV2aWNlIHRyZWUsIHdpZmkgY2hpcCB1c2VzIGV4
dGVybmFsIHZlbmRvciBrZXJuZWwgbW9kdWxlIHNvIEknbSBub3Qgc3VyZSBpZiBJJ20gYWJsZSB0
byBjb25maWd1cmUgYSBzdGFibGUga2VybmVsIG5hbWUgZm9yIGl0Lg0KDQpQZXRlcg0K

