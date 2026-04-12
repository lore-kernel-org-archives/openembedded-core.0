Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3828FE64007
	for <webhook@archiver.kernel.org>; Sun, 12 Apr 2026 08:20:50 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.231982.1775982041778847412
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 01:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=iLs2smGn;
 spf=pass (domain: siemens.com, ip: 52.101.65.65, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Czw3NU7RXsX0narT26/13IBKcKkrJ2bH0LvOr0z7BQUKVtaroIYXwCqWhuyILMz+dNAIBu25jLf/x3NdcCe0Vq4xMS93ySkXTL/WmVTmgHPp38tXzd+Bcpaevb3J+SMsFxqMSvaMBYAEvCGNpDZLfNJg24VMytSviXky1YVmdlH7JPBA9AXcI6f3Y+8wdwz6ucn3iuixDQPG3Vur0Jz9gCao5JAMBD2hxrPu/Yk3L6J+AeHWrjVrsBE0LkiIaCOyKi4zrpoOJ1/eHzOfCVWmanP8PtMqCwtpFID8BXlV9YwA9HdVZ5VzJYc2g4SFw/fiTHCyvCEBqIs9uOnIXnMiJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=euqcvJ4XpNeJ6MkzmRpbv2cJoWrxYjZmsRThok4mLlA=;
 b=Pe1VWySOVg1Nz3KVSzxmnMF895A7pqjPkeEWVShmjFE5mC4wd+4Rl+rF4IvoPZJUcGMOztwrTf6Ld5U/fTE6alRaqPrnDTFGnJbV6dwqAhSjeP4iaHAT9ftjln6uEobGfMGaExr+9jqLCGdM9qBvpgUgK98q81fEpWvVuo3tPpaNzi2XoWIvEBjY55Rs/SbQObRgf4zelixVARe+WhTNdK5uI2GnEuRbZHhsCyoMY8YGqd0kNzM3c1NE/V3t1FJ42kGylE1YP8eMX8A4jgpeTeUSp6naHziqAwmFTybZNnEOa1Zu662S6vXFzMj60RR0V11BICFe1ziohZpPVP9I7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euqcvJ4XpNeJ6MkzmRpbv2cJoWrxYjZmsRThok4mLlA=;
 b=iLs2smGna8ZZZu6LV6zRQ1H594sSmUwE5+7QUCvwgAh/vrgySuWp+sZfX7B9eVQjeHQcy8DU44OOYGvyYDYFLLn5Jj8CwgJJe7PL5iRgCSH7QuCoSmQ0ys3/6Rlety5AYO+HDeNTjuzvLjS0s5CpQ/fltoXaMW2YXfGGAZ8yshl8Slag/F93sv1eJL2dP7DzZkKUiY6b+M0Zsu60e3WIL4DSqSbEwePhUIqg8UrWGznI1wW6C9wI6yVZG/0KC2Tpae3tSNcOgStv/1gh6YPO6IrALh9oZG6K7aXKq2//S82YW0xZkAC3l+j/2nWqtE2JXG+R+U+qd8vTp0slyObSpw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by VI0PR10MB9336.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:2ae::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Sun, 12 Apr
 2026 08:20:38 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9769.044; Sun, 12 Apr 2026
 08:20:37 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>, Patches and discussions about
 the oe-core layer <openembedded-core@lists.openembedded.org>
CC: Benjamin Robin <benjamin.robin@bootlin.com>
Subject: RE: cve-check vs sbom-cve-check, redux
Thread-Topic: cve-check vs sbom-cve-check, redux
Thread-Index: AQHcyPEcHfk74ge+GEKe4KvI0SFZ1rXYU8EAgALCs8A=
Date: Sun, 12 Apr 2026 08:20:37 +0000
Message-ID: 
 <AS1PR10MB569790BEA4996F9FEBBB651FFD272@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <EFA287EA-FB51-4610-8DD9-A0BB8541808B@arm.com>
 <AS1PR10MB56975389F54123AB6CC84424FD592@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB56975389F54123AB6CC84424FD592@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=0216403c-7b1e-4e13-9b7a-8ee7598ee825;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-04-10T14:03:33Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|VI0PR10MB9336:EE_
x-ms-office365-filtering-correlation-id: 082b9fe3-e5a1-4823-0392-08de986c6085
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003|55112099003|38070700021;
x-microsoft-antispam-message-info: 
 L3pH1pjd1jLVAUCVHCRTGt4fML3cqJtgujAMskq0EWUFxIqtbjN0EhuMfE0U2LefSogH6PM0XPcT+d5+S1bf2aNd6dmSZ3JKnfm3++aJowmM7FJpx59+uZMDlPCX/GDa0+9SlwxTLtf+rXfCKbyDnyALiMZGOtFfHL4CxeHHnJu33bT6qLIuYYJcC2RphickxRsWEdX6OHz8/Z7kc4667U3YLaKKRT43UYLi25VvfifzOJBo7LFeBuHZ3F0SFw5UGezJIF9zHplPC71TSF89Yt/CJr/7ZHVpwwX3HtO/vfIqnyUr98/AIlUoRKWMRx+ldboMNr0dFB4uGZh5RMPvJ1wFwMh5I1+W4HfdaRfppEO7gluJNrI7RFLvq7WjX/k2vKzHsehGYhN3sct+6UMgTOPoNhr27TtphKmi2f8QpFhgxi5JZZUJ4n3dN7jc1HLdy4DPMrUTZSTgQtHJKic48QVpvDFbmxW45lMOGsdhsaAfEiwJwNdnU821TvXsBtMbourk/ZpFo74ETBcUamdSTQhHAYPBw0zinhINCDZ09aUJ7cnnhcuzepUJArmtAG1H6+NIWZeQ6IEnphj7rRqj1ZgW70yMfa4wuyWky2buUykoW+4CVRuj/aIJHGfHNE/O8YhpxFSEaDvY+IZo0KQrHBWCoCySfBs5u1XR4gGBYSiITNXfj4ud8CTdfok68LkyJtoC8mbKtX+agaUHqpAKhmk0goLnG94dm9+s1mSMlX0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003)(55112099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WWFCUURBN09KTyswRndNbmxyOExxcGVhSytEakd2OWFsVFJkRmFpblF2bTBa?=
 =?utf-8?B?VVBLQTcxTDBuOXlyTkMxZUVKZStKa2N4UTc1WUhTclYwNXp2U3cxZFNjY1Ry?=
 =?utf-8?B?VTM4S1Y5V3BWcW40dHE5blBvTXBEa09XZGRRSXpBbE9vaUJ4MGtySk5CU0pS?=
 =?utf-8?B?WDZXYVlTby9QMmV1SzY3NVNkVEcyQUl4bGhSL0FuaVFxRDZtTm1lMFVUKzdq?=
 =?utf-8?B?MVlIZVc3NmxIRU1uMlkzMnFuZ0RsaDZFVzk5Z0s5NHVkUDU1a1FKRTVSQ2FS?=
 =?utf-8?B?NCtRSHlmUHY4Ym42SUd3R3lxR28ySDhRVHV0amlrMjdyUGM5MGs3K3JaZlo4?=
 =?utf-8?B?cld4V3lBTWhlTGtJcjROMGpGZVdSSnM4WFhxZ01DNkhUNW5ZemV2b25zZWxL?=
 =?utf-8?B?cElKb25yZks0alFtYkhTZVRZODU5ek0rLzdycE9XNmxZa3QrSCtsaXhZYVht?=
 =?utf-8?B?TE5aUnYvbFFMczRjeUlWeEdTZkxtSzFlZjd5c2xhSThUS1I4SDY3NTRpNUJT?=
 =?utf-8?B?eXBDTWR5ajlNTytPVllFQTNDSkhLaUllTWZKeW51NHJRVnprdTdCOGhodUdE?=
 =?utf-8?B?V1NoemFubTloOWdzZVNoUDZqbG1mNzd3TmxkeUxjYlFBWTFyRW13R2hBb3U1?=
 =?utf-8?B?allLUUdKZkJXQ2IyODF1cDlpUmc1cG54NGxCVWRHUjNjRE1lc2pWb3dTczdz?=
 =?utf-8?B?SnRCS0JsWjdZelFWTXZIVSs3bnBjUkVWOC9kNEJYRnVpTXdJNEdLZ1V2Y2JP?=
 =?utf-8?B?SDF1RzZmWHlRVkxOR0wzUkxwdXV1aTFBNHUvMUhrYVcwaXlpU1JrR0ozZG9k?=
 =?utf-8?B?VnZVcmtoVWwxOEFnRE9nNkd6QldsbDg0RzB4NE5tdDdRQmpyWVhSUjNzQzds?=
 =?utf-8?B?bGZJa1FCUUJBM0UrRkkyQzhXWlI5RHhBaS9aR0xqR0VJNURFSjRxbllJRU9t?=
 =?utf-8?B?d3Vtbk1wZWlGYmZTN2hyRlJZYkpQdWdwMEdZcFhwVVgzQWFGYXg1MlVsTGpw?=
 =?utf-8?B?SzdLZTZ2SXhEYndqdS9xaEFLM0oxN1RhLy9uTjRERGVBakRvUkZkVmpzWWZ5?=
 =?utf-8?B?R0hvZzZTQXlsb3lUOVZyaHF0bmZCWm80d2V2dmU1cDV3Ymt6VzJWbkpwVXdB?=
 =?utf-8?B?NkJDSjBsald5cmY1SlVvcnFrOGxNTTk2Z2w4aUMzaXNmMW52TVRsclhzNjEv?=
 =?utf-8?B?V0ZuZ01WbWNYQTlEZVBuQTIzd0NldHhOYmxCTng5YWlOVDhlbjNYTzI0LzMv?=
 =?utf-8?B?Y3hXV0lEalNGb3hleEJPRGM2Z0tZUVQwOExRUW9PdXcvdXlKY1lGVm41NXls?=
 =?utf-8?B?NjA4VElaaUZZR3Z5Y2h6emhaaWw3Wm5BRzRXSDdYdkxYd1Q0b2VlOVpEcXJD?=
 =?utf-8?B?K2Z2UkR1eGhaNW5nVkFhZlRwN1UwM1FLK1UvU1NjQmJLbVF0YXBPRHkvclJR?=
 =?utf-8?B?ZUFEUTFzM0JSa2FENWV4Z2dvTTJ0dVlZZ2NJay9jcERWZjJYeGRsZ3A1M0ox?=
 =?utf-8?B?S1BuU09BWFJQNXV5OG4wR2JoVkdvbzFzMEJqdE9iNWpHYStaZ3dURy9ubGRs?=
 =?utf-8?B?elBENVVwZklQRHdmQzhBWWpidkpic1pJWDc1bzBDazhQN2lRb2N1RFlja0dG?=
 =?utf-8?B?N2FwczBMcUQ1Q1ZUdmkycmd4Q0VySlZDM1M3bmdvdEM2am5oWHVteDJQWkdK?=
 =?utf-8?B?aWVYN09xTEtzaXV1WDNrTEU0ck80RzE0QVFLUnFHazVTbkRuKzlkY2l3M0JN?=
 =?utf-8?B?NXE4VkxtUWxRV3pkRVhONFFDRXkrOGFKUS9yVVp2NW1RTE1vMzBOamVYaHRw?=
 =?utf-8?B?UFFEbk5ET3JZV09CNDhBUjhDRytRNEhzRFZ3RzhRbDFEWmdtSWJjQi9ZQ2s3?=
 =?utf-8?B?T3J1UUdpNTRrL1BwMHlEWDBmUUh5eXZXTys0a0RUMkNrRHFNZjZBWkhMcytQ?=
 =?utf-8?B?MmF1Q1JlSEw5MngrbXdCanZkZWdHeG5YVVpuVVN5Sm1xUnE5WmtXMUhPaHBR?=
 =?utf-8?B?OVhxc1pxQ2lqdjgvVThUREpROUVuWVlJNlZoUE1OZVRqam9tTis4WjFDTFVh?=
 =?utf-8?B?N3ZLUkQ1ZEN3Z24vNHh5eUQvVy95REFNUmQvTEtkSHcwejZwVUNnSVA4Zm9p?=
 =?utf-8?B?ODR5dlVYRUR3MkJjcEIxR20vZFZxcHpUbXVSSE16SFRON016TkZGUUYzTnpQ?=
 =?utf-8?B?WmhwR0l0bmdPcEMzanpIamZFRlVCUUJGKzJaTmV4amM5N0F3dk15R1BaWTQr?=
 =?utf-8?B?dk10VUg3dzBEb1lTOXhxbVYwNTQvOEpHTmNUSEs5U2g0bzlvQ0lPVDRpTVc1?=
 =?utf-8?B?S2Y5MTFxdFVMNDdYKzZHa2N3NWlQVXY1YlhXNFdkTmdsUFNIbGloZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 082b9fe3-e5a1-4823-0392-08de986c6085
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2026 08:20:37.6109
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9f6/bgIKl81xseyxPO3cDuWJ1PnbGMV4ZMZ5yxuxZfu0QHlT+CvnZpZJP0G9KFPiIP3VhzQEH9O5Qc359xzQ5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9336
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 08:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235055

SSBub3RpY2VkIGV4dHJlbWUganVtcCBpbiBtZXRhLW9lIENWRSBtZXRyaWNzIGNhdXNlZCBieSBm
YWN0IHRoYXQgaXQgbm93IGluY2x1ZGVzIGFsc28gb2UtY29yZSBkYXRhLg0KaHR0cHM6Ly92YWxr
eXJpZS55b2N0by5pby9wdWIvbm9uLXJlbGVhc2UvcGF0Y2htZXRyaWNzLW1ldGEtb2UvDQpUaGlz
IGFsc28gY2F1c2VkIHRoZSBmaXJzdCBjb21taXQgYWZ0ZXIgc3dpdGNoIHRvIGJlIHNvIGJpZyB0
aGF0IGdpdCBkZWNpZGVkIHRvIHJld3JpdGUgdGhlIGZpbGUgdGh1cyB0aGUgZGlmZiBjYW5ub3Qg
YmUgYW5hbHl6ZWQuDQpodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL3lvY3RvLW1ldHJpY3Mt
bWV0YS1vZS9jb21taXQvP2lkPTJjYWM4Y2NlOGZjNmFjZDgyMGNjNTBmY2NlODAwNDYxNjFhZWY4
NWUNCg0KSXMgaXQgcG9zc2libGUgdG8gaW1wbGVtZW50IGZpbHRlcmluZyBiYXNlZCBvbiByZWNp
cGUgbGF5ZXI/DQoNClBldGVyDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogTWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpDQo+IFNlbnQ6IEZyaWRheSwgQXByaWwg
MTAsIDIwMjYgNDowNyBQTQ0KPiBUbzogcm9zcy5idXJ0b25AYXJtLmNvbTsgUGF0Y2hlcyBhbmQg
ZGlzY3Vzc2lvbnMgYWJvdXQgdGhlIG9lLWNvcmUgbGF5ZXINCj4gPG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IENjOiBCZW5qYW1pbiBSb2JpbiA8YmVuamFtaW4u
cm9iaW5AYm9vdGxpbi5jb20+DQo+IFN1YmplY3Q6IFJFOiBjdmUtY2hlY2sgdnMgc2JvbS1jdmUt
Y2hlY2ssIHJlZHV4DQo+IA0KPiANCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVu
ZW1iZWRkZWQtDQo+ID4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2Yg
Um9zcyBCdXJ0b24gdmlhDQo+ID4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IFNlbnQ6IEZy
aWRheSwgQXByaWwgMTAsIDIwMjYgMzo1MSBQTQ0KPiA+IFRvOiBQYXRjaGVzIGFuZCBkaXNjdXNz
aW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllciA8b3BlbmVtYmVkZGVkLQ0KPiA+IGNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZz4NCj4gPiBDYzogQmVuamFtaW4gUm9iaW4gPGJlbmphbWluLnJv
YmluQGJvb3RsaW4uY29tPg0KPiA+IFN1YmplY3Q6IFtPRS1jb3JlXSBjdmUtY2hlY2sgdnMgc2Jv
bS1jdmUtY2hlY2ssIHJlZHV4DQo+ID4NCj4gPiBIaSwNCj4gPg0KPiA+IHNib20tY3ZlLWNoZWNr
IGlzIG5vdyBpbnRlZ3JhdGVkIGludG8gb2UtY29yZSBhbmQgYXMgcGFydCBvZiB0aGUgbWlncmF0
aW9uIEkNCj4gcG9ydGVkDQo+ID4gdGhlIGRhc2hib2FyZCBtZXRyaWNzWzFdIGdlbmVyYXRpb24g
dG8gdXNlIHNib20tY3ZlLWNoZWNrLiBMdWNraWx5IGl0IGhhcyBhbg0KPiBvcHRpb24NCj4gPiB0
byBnZW5lcmF0ZSBvdXRwdXQgaW4gdGhlIHN0eWxlIG9mIGN2ZS1jaGVja+KAmXMgYmVzcG9rZSBK
U09OLCB3aGljaCBtYWRlDQo+IG1pZ3JhdGlvbg0KPiA+IHJlbGF0aXZlbHkgZWFzeS4NCj4gPg0K
PiA+IEEgbGl0dGxlIGJpdCBvZiBqcSBwcm9jZXNzaW5nIGFuZCBzb21lIG1vcmUgdHdlYWtpbmcg
dG8gdGhlIGludGVncmF0aW9uIGxhdGVyIGFuZCBJDQo+IHdhcw0KPiA+IGFibGUgdG8gY29tcGFy
ZSB0aGUgb3V0cHV0IG9mIGN2ZS1jaGVjayBhbmQgc2JvbS1jdmUtY2hlY2suICBTb21lDQo+IG9i
c2VydmF0aW9uczoNCj4gPg0KPiA+IC0gVGhlcmUgYXJlIGxlc3MgbmF0aXZlIHBhY2thZ2VzIHNj
YW5uZWQgaW4gdGhlIHNib20tY3ZlLWNoZWNrIHJlcG9ydC4gVGhpcyBpcw0KPiA+IOKAnGludGVy
ZXN0aW5n4oCdIGFzIGJvdGggc2hvdWxkIGJlIHdvcmtpbmcgb24gdGhlIHNhbWUgcmVjaXBlIGxp
c3QgKHRoZSB3b3JsZCB0YXJnZXQpDQo+IGJ1dA0KPiA+IGN2ZS1jaGVjayB3aWxsIHJlcG9ydCBw
YXRjaC1uYXRpdmUgYW5kIHBhdGNoLCB3aGVyZWFzIHNib20tY3ZlLWNoZWNrDQo+IChhY3R1YWxs
eSwgdGhlDQo+ID4gd29ybGQgU1BEWCkgcmVwb3J0cyBqdXN0IHBhdGNoLiAgSSBzaGFsbCBmaWxl
IGEgYnVnIGFib3V0IHRoaXMgYnV0IGRvbuKAmXQgY29uc2lkZXIgaXQNCj4gYQ0KPiA+IGJpZyBw
cm9ibGVtIGFzIGV2ZXJ5IG5hdGl2ZSByZWNpcGUgdGhhdCB3YXMgbWlzc2luZyBhbHNvIGhhcyB0
YXJnZXQgdmFyaWF0aW9ucw0KPiB0aGF0DQo+ID4gcmVwb3J0IHRoZSBzYW1lIENWRXMuDQo+IA0K
PiBTbWVsbHMgbGlrZSAiYXNzdW1lLXByb3ZpZGVkICsgcmVwbGFjZW1lbnQtbmF0aXZlIiB0b3Bp
Yw0KPiANCj4gPg0KPiA+IC0gVGhlIGtlcm5lbCBDVkUgbGlzdCBpcyBtYXNzaXZlbHkgZGlmZmVy
ZW50LiBQYXJ0bHksIHNib20tY3ZlLWNoZWNrIHJlcG9ydHMgYSBsb3QNCj4gPiBtb3JlIGlzc3Vl
cyBhcyBpdCBsb2FkcyBpc3N1ZXMgZnJvbSBjdmVsaXN0djUgdW5saWtlIGN2ZS1jaGVjay4gSG93
ZXZlciB0aGVyZQ0KPiBhcmUNCj4gPiBzb21lIGlzc3VlcyB3aGljaCBkb27igJl0IGdldCByZXBv
cnRlZCBjb3JyZWN0bHkgZHVlIHRvIGEgYnVnIGluIHRoZSB2ZXJzaW9uDQo+IGhhbmRsaW5nDQo+
ID4gaW4gc2JvbS1jdmUtY2hlY2sgd2hpY2ggQmVuamFtaW4gaXMgd29ya2luZy4NCj4gPg0KPiA+
IC0gU29tZSBDVkVzIGFyZSBub3QgcmVwb3J0ZWQgZHVlIHRvIGFuIGVzY2FwaW5nIGJ1ZyBpbiB0
aGUgU1BEWCAoc3BlY2lmaWNhbGx5DQo+IHRoaXMNCj4gPiBoaXRzIHJlY2lwZXMgdGhhdCBoYXZl
IENQRXMgbGlrZSAiZ3RrKyIgb3IgIndlYmtpdGd0ayvigJ0uIEkgd2FzIHdyaXRpbmcgYWJvdXQg
aG93DQo+IHRoaXMNCj4gPiBzaG91bGRu4oCZdCBiZSBkaWZmaWN1bHQgdG8gZml4IGJ1dCBCZW5q
YW1pbiBqdXN0IHNlbnQgcGF0Y2hlcyB0byBmaXggdGhpcy4NCj4gPg0KPiA+IC0gc2JvbS1jdmUt
Y2hlY2sgY2Fubm90IHNjYW4gYSBzaW5nbGUgcmVjaXBlLiAgY3ZlLWNoZWNrIGNvdWxkLCBidXQg
dGhlIHVzZS0NCj4gY2FzZQ0KPiA+IGZvciB0aGlzIGlzIG1hcmdpbmFsLiAgVGhlIHVzZS1jYXNl
cyB0aGF0IHNib20tY3ZlLWNoZWNrIGV4Y2VscyBhdCBhcmU6DQo+ID4gMSkgV2hhdCBpc3N1ZXMg
ZG9lcyBteSBpbWFnZSBoYXZlIChieSBsb29raW5nIGF0IHRoZSB0YXJnZXQgcmVjaXBlcyBpbiB0
aGUNCj4gaW1hZ2UNCj4gPiBTUERYKQ0KPiA+IDIpIFdoYXQgaXNzdWVzIGFyZSB0aGVyZSBpbiBn
ZW5lcmFsIChieSBsb29raW5nIGF0IHRoZSB3b3JsZCBTUERYLCBpbmNsdWRpbmcNCj4gbmF0aXZl
DQo+ID4gYW5kIHRhcmdldCkNCj4gPg0KPiA+IC0gU2Nhbm5pbmcgaXMgc2xvd2VyIHdpdGggc2Jv
bS1jdmUtY2hlY2sgY29tcGFyZWQgdG8gY3ZlLWNoZWNrLiAgSXTigJlzIGFsc28NCj4gZG9pbmcg
YQ0KPiA+IGxvdCBtb3JlIHdvcmsgYnkgaGF2aW5nIG11bHRpcGxlIGRhdGEgc291cmNlcyBhbmQg
ZG9pbmcgYmV0dGVyIGFuYWx5c2lzLiBJdA0KPiB3b3VsZCBiZQ0KPiA+IGludGVyZXN0aW5nIHRv
IHByb2ZpbGUgdGhlIHRvb2wgdG8gc2VlIGlmIHRoZXJlIGFyZSBhbnkgcGxhY2VzIHdoZXJlIHBl
cmZvcm1hbmNlDQo+IGNhbiBiZQ0KPiA+IGltcHJvdmVkLiAgQXMgd2l0aCBzYm9tLWN2ZS1jaGVj
ayBzY2FubmluZyBpcyBkb25lIG9uIGltYWdlcyBvciBzcGVjaWZpYw0KPiByZWNpcGVzDQo+ID4g
aW5zdGVhZCBvZiBvbiBldmVyeSByZWNpcGUsIHNvIHRoaXMgcGVyZm9ybWFuY2UgaGl0IGlzbuKA
mXQgYXMgbm90aWNlYWJsZS4NCj4gPg0KPiA+IE9uIHRoZSB3aG9sZSBJ4oCZbSBzdGlsbCBhYnNv
bHV0ZWx5IGhhcHB5IHRvIHJlbW92ZSBjdmUtY2hlY2sgZm9yIHRoZSBuZXh0DQo+IHJlbGVhc2Uu
DQo+ID4NCj4gPiBGaW5hbGx5LCBtYW55IHRoYW5rcyB0byBCZW5qYW1pbiBSb2JpbiBhdCBCb290
bGluIHdobyB3cm90ZSB0aGUgdG9vbCBhbmQNCj4gaW50ZWdyYXRpb24NCj4gPiBjbGFzc2VzLCBh
bmQgaGFzIGJlZW4gaW5jcmVkaWJseSByZXNwb25zaXZlIHdpdGggcXVlc3Rpb25zIGFuZCBpc3N1
ZXMuDQo+ID4NCj4gPiBDaGVlcnMsDQo+ID4gUm9zcw0KPiA+DQo+ID4NCj4gPiBbMV0gaHR0cHM6
Ly9kYXNoYm9hcmQueW9jdG9wcm9qZWN0Lm9yZy8gaWYgeW914oCZdmUgbm90IHNlZW4gaXQNCg==

