Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 797B0C7115E
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 09:00:13 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.13])
 by mx.groups.io with SMTP id smtpd.web11.10314.1750323603655443760
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 02:00:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=UgiAyhEm;
 spf=pass (domain: siemens.com, ip: 52.101.69.13, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXVZVbl2koU6q0qZCd2ZNShLpxE9VlougrC377TnM56xrzMJhBEU3T3xKvK34cEMLHwZY0pvBeeneyGNQACqxB3L/sMqld3xvcOc3B/lESbziJDTNzfn2BmP3K8lekvw24McrBKAdpIkLRBgf4lGd/r2JJtnrmosnbYgaIbGs7Qppv0LHtL1voilu1jboYtwhlfCFG9q7uhEuXYhuLwXTIj9XEwvaCNcXoQuaAejfDL9FgiXReUoLork6CCmBL5rnnKHjUuThnvSOZj/ziknxUebaRwW+nISXww3OUwrP8XhfwK05+s2R6pn7tj2z1i7xnf9uopUh3vmOfZXsDAhsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0f1/KKHoP2MP6XEYb7kMAHC+vhTlVZYQDdjaM797lOI=;
 b=rKC2y/HT4B7VBg/PVKeO0ppPAF6fbPzU/R/cibZfUwk4YSToiGZh6//7mEZwUi1quRFUEKP9CnvgIf7PK31sbfI4ZMS2MreijCui910lOsu0wkkXjDLl8NeemMu38peVV4pq7uaPbP6EIy8tH0c27zuFRcky48hQsDIvdbHdqEeZO5YHXeH+b9FwMucTtC6KmLE0v9i0xUoogsJq6ubvsN2egtxdXakiXrG+5OqnrMyQsNXuSkZ7ZDJdBYqQ2ZebrIOVC+8efPhAHpOeamZvmyojEKQo0My+vFnNbaWQPY6dVVZikJHXXW90z6LDPdiZI/89axxJGx/hk9BR9ZQ4MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0f1/KKHoP2MP6XEYb7kMAHC+vhTlVZYQDdjaM797lOI=;
 b=UgiAyhEmK7r6OFBcy2lI8dPc+OWdlSDcPYaTMhfdmGFCddOESATH+TyivdnNHcJLIipzbNmzCvdUQLoskaB5vjHPx6aSmqcm3ZchSf8xKtYp6/Zsif2SN0NNNp2ySxynB9ZANVja74rYVYV/A27DJ8sLYta2CqMlDE2w0mY0wxb87ow+x8a13zwtosj+f56g+4mF6BUhWf7umjn+c4uxfYbgzotoDT4y94mrK/2Wz2C1vABMof1eMZA2Jn9O8zseXu/O/FTotbykjsow+eD8grwBPGB6vUJzuCKYwJ/9cQTws9ssDpIeCBsl0cA/lIzK8b21AnpnQHXwX8zXtZeEmQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB7360.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:444::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 08:59:57 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8835.018; Thu, 19 Jun 2025
 08:59:57 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Andrej Valek <andrej.v@skyrain.eu>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>
Subject: RE: [OE-core] perf: nativesdk
Thread-Topic: [OE-core] perf: nativesdk
Thread-Index: AQHb4O9Dw3CSbtvDaEiCfnIKRN5igLQKHV+AgAADOACAAAGFAIAAC/nA
Date: Thu, 19 Jun 2025 08:59:57 +0000
Message-ID: 
 <AS1PR10MB569796A8477A0D6B2E8892BBFD7DA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <7dee70c7-d0a8-44ea-94a1-2c4be581208e@skyrain.eu>
 <CANNYZj91bFZAMB0XiLyEewy6t0RnrtNAZGEsiV+znM5xSY7S0Q@mail.gmail.com>
 <5a82dfcd-f526-4da7-a39b-081d7b689f57@skyrain.eu>
 <CANNYZj8LHBsahWB6k6SHZygNVh7jcyDLV5H6n77FcTGnmRXdUw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8LHBsahWB6k6SHZygNVh7jcyDLV5H6n77FcTGnmRXdUw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=3c880854-7ffc-4128-af00-7f5eee16975f;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-06-19T08:55:59Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB7360:EE_
x-ms-office365-filtering-correlation-id: 7db3fd91-40de-4dd0-bbfe-08ddaf0faa50
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?eEJ5UURGV2hkMm9qa0huQ2haMWI0cDA3ZVBHcmZ5T2FTaldxOHk4Z3pJeENx?=
 =?utf-8?B?QVhYSmRPQjQ3TW1JM2FVa2djN1Z1Q0Q1T2xqSXNQSjFwbVJRNXQ0SXFuMW9K?=
 =?utf-8?B?bkNON2lCeURZdzlFR0xTOE41c1pid3ljNndLcHVzWGFDS2JXSnhGMEQ1MGdG?=
 =?utf-8?B?L2tnUlR3SVloVlVCYjhpZ09nUUMrcUgzV1U2L1ZoNXFxcytyWGhNb3JBdkNM?=
 =?utf-8?B?SjY3bzJ5MXZnRWdVMGxRcFRoYWZyV3JwQzB1T3JGL2x3TC9WaG1SekE5dDVP?=
 =?utf-8?B?MHVqVVpLcDhqVllaUHN1UHVKdlJRYnJaeFlzODVKcWVSWUV6RkhDYndkSm1p?=
 =?utf-8?B?Nyt5V3gvc2tzcWFVT3F5ZFIxeDdmd3ZIbk1MN3c0a2h3clFQT1Y3ejhGWHZi?=
 =?utf-8?B?dWdnZ0xySmlQVUF1VEJIZEVUbFdGNmR3bXA5YVhHUVcxVjBSWFlRWjVka1NC?=
 =?utf-8?B?bTRpV0paK2tjdDdPSyt0MjR2YXVsQTQ3bHBmNVkxdC9FL0RmeWViNU5rTmtS?=
 =?utf-8?B?L0dPMkVvb2tpMnJEVWxuNlgzd0xiZUZiN3pJOEtoVFdrR2ExeitneXlwSGpH?=
 =?utf-8?B?OWgzeXJ3NTkvcWpXVG84SWtEcEx2UnU4eGJORWR0RUtSU1RLSmVybE9acmJH?=
 =?utf-8?B?THA1OVVqRHdEL2pmLzB3NGdpN25KNlpoWVBjMEpXbnRoUk1kQ2Mwc0J1V250?=
 =?utf-8?B?Wjh4S0ZZUjJmdzl6eHNGRkRnNm0rMlV6OGxGd2kyc2VDeTByTDlPTkpyQUky?=
 =?utf-8?B?SUF2RW82ZjJTaU91MjhrTi91K2drMHZKK3U3a0xxV0JRNzl0NHp5NmEzYUlG?=
 =?utf-8?B?aWpqMEdNenpzK1BucHFrMnVNT2FtTmZPeWlHeVdqMER2U2RHcE5RUGU0QWxP?=
 =?utf-8?B?Tm00SWxIbVRrNzJsMFhZTVlzZDFsbzR2VjluOVljL3hvYVg5NWhEeWZkTVJD?=
 =?utf-8?B?Z3FVVEkvQ3ZjVTBBcmtwRWIzQ05sNDd3K2Erb0pIYjZEeXV2Ty9LZjJ3ZlFM?=
 =?utf-8?B?TjdhNkNweExyNVpJU1p5UmtwcjY2NTJiQWU2K3Fjb0h3WGJFR2FVSG9SZDFz?=
 =?utf-8?B?RTU3dDRnTVBkSW15R1JQWjUxWEtDOXRodXFwdDljRUJ3SUxPbWp4bjNScTlO?=
 =?utf-8?B?VHZpS2RLV014WS9MUkozb3F5K3p1NFhTV1c5dEJ2RHFLcHR0R0x0Vi81TDh4?=
 =?utf-8?B?WmpORmdpUkQrRDRicElrQm9OeEdVUHd1V0hwRGRvanMwTXpWK1o4MzRoSmlp?=
 =?utf-8?B?S3JlaHdHcGw0WTlZb2lPMTNGemphOVhZMWhQUUEwTm42MThaU1NNM1NWU3Fu?=
 =?utf-8?B?WlZCT0RveHp6anRYenlxLzhJYVdFOHphV2I1UG9xOVRpSUZ0VWFaVXNmWmpY?=
 =?utf-8?B?SWVjMTJMaGJZUWY1SmpSYVJ4NFRxckdqMHFOcFVqK2NXVG5CMktYZUtmVXVU?=
 =?utf-8?B?ZXlEN0RCOGlkMHVnMkJoZDlkbVcxVnJJajhCT1ZiK0Z5NkIxSWRFM2ZRd0s4?=
 =?utf-8?B?QlNBOCtSYU1kcUJsdmVIZC9STHFsSWZIdkFtN3dNYnRqMnRuREtRNTErT3pV?=
 =?utf-8?B?T2R6MXRrV05pVE8yeHQrYlFmTngxU0NrTjg3ODQwTFUvZ1ZYaUNmK3V6WGd2?=
 =?utf-8?B?bUNwM1k5YnNqQWcvVHdVTGVVUFpCUnNBRnAyTURFdzdKajNpMEVOR3dRcWNB?=
 =?utf-8?B?cTQ5VytZeUthbzE5Uk40WlNqRG5UWTFuSzV4ZWxocENRRnBtWFV3WWYyV3hH?=
 =?utf-8?B?U2xyeHdhNTJITlpyeHEvTW41eUpNSm9hQjZNenZVZmFaTHl4Tnk1ZHgwNUVk?=
 =?utf-8?B?S05TRGY0Mm5ISW1XbjRDMGp3U3hpZ2FGTTg5TUE2VXhyYTdEQ0RSYndoVG5T?=
 =?utf-8?B?REhVQzE2SElFRm5GN214dGQ0Z29wcktwMXZkdi9ramg5WWJIeGo0RUZjU0ts?=
 =?utf-8?B?UU1CN21CRldZdE5Ca3JyeDZiMFVtb2svdkVkaVFROVpJVHJONGpMNjdGNkdZ?=
 =?utf-8?B?LzJFSWNVdnlRPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VDhsSHdvVTNpbExMay90TmxTbTRYYTJzdDJJTmNxWWZTOTg1bUgrQWIzek5u?=
 =?utf-8?B?bitWeGFGa0VMOFplbncvWG0rdmhxQ0UvUWQxemJtNk0vQmxIM0FQNEQ1cGhI?=
 =?utf-8?B?cEVub29IQXUvU09sbUErVytHYXlxWUgxMzl2TFM0OTYvbHRWdStob2lwa2R3?=
 =?utf-8?B?UkxBajJjK295M3Jna3FSRThHU1Y4NnVPWUFodHdzbVl4QnFEVHJoamY2d0Zr?=
 =?utf-8?B?dU83czFoU2trQlVwNEFWUUkxd0FEMUlheTA5RHg4ODEwWk11R21hTVNIbDNZ?=
 =?utf-8?B?b3lSTGtsSjJ1Tk5mL1d3bzRVM2J0SUVYMXZ2UTh4VUUrTEhqa016L01vTE9F?=
 =?utf-8?B?U0VuZ3lYNU1JVDYxUjVrZTE0S1NBS2pzWVlkWmZsZzhlZUF2R0h4UTgrTWNo?=
 =?utf-8?B?eldyazJ5R052OWpOZmpTVGdUTmpuZ0V3cWsvclRsNFl3anU4Yk4wdVVkTGNL?=
 =?utf-8?B?SDRuZlJjMjhDMjdoRGNocG9jM0JLaGpUOGNsdXo3YWtSeU9Mb3AzbVFIRWlm?=
 =?utf-8?B?eUNFZ0Q5aVI2N2JHTlZ3N0FUOXVYdStWZHRrckh0Q0VRMTZRNGZjQ2FqRlhD?=
 =?utf-8?B?Y3VGZ0pCWVhFN2RGS0ZTWW1sUmRYQWJ3UTNMeWMzV0hXV0w0M3FKRGFXeDlY?=
 =?utf-8?B?UmtBVTFYWG5qUHlMQ24ySTZWc3FBWEhtS3J5QlBYaFBKU1cybUhBaWxOWmlU?=
 =?utf-8?B?MUVFYkM5VjFBNzRXOVFxUEszZjZGVjQyWXdVN1Y2bld6UWxYMlluV0dDMVdt?=
 =?utf-8?B?ajA4d0RIcjhWc2F6Rll1T0MxOUZ3R1luMFhiellEZjFZMjV6bC8wN1lLM01w?=
 =?utf-8?B?K3lvdG0veVZKeENPWFI4Qk5pdjQyZm9Ed09MS0pJNFd2VnJodjVCUE5pUTUy?=
 =?utf-8?B?TGhuOHFQbk9FY1p4OHhPTUlIa21yYWdkMWtxaXQwK3R2RFA5N3VONVhBbFk3?=
 =?utf-8?B?emNSR1R4VDhkNzBWZDRFS3V5VzJDdFdhVzkrckYySk1FKzJQQ0xPaDNob05H?=
 =?utf-8?B?TGgwU0VpbVpzOXpObzhBSmJORjVnT2V1cG9DNU1RcU1rbVk4OUhHcndmNkNJ?=
 =?utf-8?B?cTAyc0lQQ25pa2p2aFNtSlhPM3R0Nm53Wkw2T3dQcnJ4dVZKNHh5clNwKzEx?=
 =?utf-8?B?dFU3dmVCd2JSb2JONHJRREtHSjFPbUZoRzU3Y3l3dmlyYjhtU2VWUGhSbFhy?=
 =?utf-8?B?YktmWXhQTU5jZHVVWGtiSExISkErelp1MDNCRjZDRVo1cVZMSjFnYzVIV05X?=
 =?utf-8?B?TGZTQlhqdjZRUllyZ0w0OVMrMGhINHg3N3JrNDhYWGcwdzE2YlVyQVRlS1Ry?=
 =?utf-8?B?K2pVcG9McndUalU1aC9nTjRiT2FBTFRKaDJBQlBhRHJUYnQxQk9JUnR2ak5K?=
 =?utf-8?B?OVlLNFlMbVM0RERnMU5hNDlwcGsvci9QYm5wQ3lQNkJyQ1huWDVEVHFYWWln?=
 =?utf-8?B?S25raUNRS0p6NkJneHIwV05BQlBla0Z0NU1vUFpiczY3dkI3Zzd0TlJvZjZD?=
 =?utf-8?B?a1oxaTRkRkxrcGloeTVESUNPZlRWd3ZxdnVSamVCZEl5TUY4MmUydnNaeGVs?=
 =?utf-8?B?SEt6V2dQVmc5eHAwWVlTR1kxdlk1TFI4bTJMU3l2YTROUWZ1U0FPTTNkSHds?=
 =?utf-8?B?aW9BZnRUbDROajNiOU1ZSE4wVDNrWERaNDRYMHNhRlhTOVFYYTYvQnhTcEhw?=
 =?utf-8?B?WXZ2MUxla3VZNWxLMUxNOFhEQUhORkt4b0ZLM002UjJKNXFqcGRtNnc2cWd0?=
 =?utf-8?B?cXdrOXJFWW5yZE8yOG1rM2RTRWJmaFhjQ2lsNlNsL0xkcUdlb3loTHlHQ2Vj?=
 =?utf-8?B?bFhkQWdpdm1TYUVaTk1hbGlia0dyL2s0TTIzUjJKUEd4anFDK3lRWWhZUi9i?=
 =?utf-8?B?S24vTDJaQTI4OEhGWjNsdXh6YlA5SVBjbmN2ckYxdjB1QTFOSlBJdzhkVlFO?=
 =?utf-8?B?cFd1cUJTMVpPZElwZWZaR1VDYTlNeHVNUXNIeWdJbzEzQkk5Ri96bFFDMEd3?=
 =?utf-8?B?RkdCbTkxdHVOL2NMOTE3eUdiaVpERExNK3hHSzlUWUt0bkRBRVV4ckJZU3RF?=
 =?utf-8?B?L05oazdlWFBvYTVlNFdwWTF1KzFjSWlINjVUZDMvM2JNY0NGOGM1cUczS2p5?=
 =?utf-8?Q?UIPdBReYVZfDYqLEAgchI0U8S?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db3fd91-40de-4dd0-bbfe-08ddaf0faa50
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 08:59:57.2836
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J+d5fi50rKVdRv9ZCu3+xi37IwfQyjFXaGdIPqnHcyKLCayKmhvGtdbEnr85lmMWEzNC5mQ/qeIyqXe8ioIahw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7360
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 09:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219062

V2hhdCB5b3Ugd2FudCB0byBkbyBpcyBub3QgcmVhbGx5IHBvc3NpYmxlLg0KUGVyZiByZWNpcGUg
ZG9lcyBub3QgaGF2ZSBpdHMgb3duIHNvdXJjZXMsIGl0IG9ubHkgY29waWVzIHNvdXJjZXMgZnJv
bSBrZXJuZWwgYW5kIHRoZW4gYnVpbGRzIHRoZW0uDQpBbmQgeW91IGNhbm5vdCBkZXBlbmQgb24g
dGFyZ2V0IHJlY2lwZSAoa2VybmVsKSBpbiBuYXRpdmUgcmVjaXBlIChwZXJmLW5hdGl2ZSkuDQoN
CkFsc28gSSBkb3VidCB0aGF0IHBlcmYgc3VwcG9ydHMgY3Jvc3MtYnVpbGQsIG1lYW5pbmcgYW5h
bHl6aW5nIEFSTSBwcm9jZXNzb3IgY291bnRlcnMgb24geDg2Lg0KWW91IG1heSBoYXZlIHRvIG1h
dGNoIHlvdXIgbmF0aXZlIGhvc3QgbWFjaGluZSB3aXRoIHRhcmdldCBkZXZpY2UgbWF5YmUgdG8g
cG9pbnQgb2YgZXhhY3QgcHJvY2Vzc29yIHR5cGUsIG5vdCBvbmx5IGFyY2hpdGVjdHVyZSB0eXBl
Lg0KDQpQZXRlcg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC0NCj4gY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgQWxleGFuZGVyIEthbmF2aW4g
dmlhDQo+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU2VudDogVGh1cnNkYXksIEp1bmUgMTks
IDIwMjUgMTA6MTMNCj4gVG86IEFuZHJlaiBWYWxlayA8YW5kcmVqLnZAc2t5cmFpbi5ldT4NCj4g
Q2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDog
UmU6IFtPRS1jb3JlXSBwZXJmOiBuYXRpdmVzZGsNCj4gDQo+IE9uIFRodSwgMTkgSnVuIDIwMjUg
YXQgMTA6MDcsIEFuZHJlaiBWYWxlayA8YW5kcmVqLnZAc2t5cmFpbi5ldT4gd3JvdGU6DQo+ID4g
bWF5YmUgSSBoYXZlIHRvIGRvIHNvbWUgbW9yZSB0dW5pbmcsIGJ1dCB3aGF0IEkgZGlkOg0KPiA+
IEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayINCj4gPiBERVBFTkRTOnJlbW92ZTpj
bGFzcy1uYXRpdmUgPSAidmlydHVhbC8ke01MUFJFRklYfWxpYmMiDQo+ID4NCj4gPiB0aGVuIEkg
cnVuOiAiYml0YmFrZSBwZXJmLW5hdGl2ZSIgYW5kIEkgaGF2ZSB0aGUgc2FtZSBpc3N1ZToNCj4g
Pg0KPiA+IEVSUk9SOiBwZXJmLW5hdGl2ZS0xLjAtcjAgZG9fY29uZmlndXJlOiBUaGUgc3N0YXRl
IG1hbmlmZXN0IGZvciB0YXNrDQo+ID4gJ2xpbnV4LWxpYmMtaGVhZGVyczpwb3B1bGF0ZV9zeXNy
b290JyAobXVsdGlsaWIgdmFyaWFudCAnJykgY291bGQgbm90IGJlDQo+ID4gZm91bmQuDQo+ID4g
VGhlIHBrZ2FyY2hzIGNvbnNpZGVyZWQgd2VyZTogbWFjaGluZUEsIGNvcnRleGE1MywgY29ydGV4
YTUzLA0KPiA+IGFybXY4YS1jcmMsIGFybXY4YSwgYWFyY2g2NCwgYWxsYXJjaCwgeDg2XzY0X3g4
Nl82NC1uYXRpdmVzZGsuDQo+ID4gQnV0IG5vbmUgb2YgdGhlc2UgbWFuaWZlc3RzIGV4aXN0czoN
Cj4gPg0KPiA+IC9ob21lL2J1aWxkL3RtcC9zc3RhdGUtY29udHJvbC9tYW5pZmVzdC1tYWNoaW5l
QS1saW51eC1saWJjLQ0KPiBoZWFkZXJzLnBvcHVsYXRlX3N5c3Jvb3QNCj4gPiAvaG9tZS9idWls
ZC90bXAvc3N0YXRlLWNvbnRyb2wvbWFuaWZlc3QtY29ydGV4YTUzLWxpbnV4LWxpYmMtDQo+IGhl
YWRlcnMucG9wdWxhdGVfc3lzcm9vdA0KPiA+IC9ob21lL2J1aWxkL3RtcC9zc3RhdGUtY29udHJv
bC9tYW5pZmVzdC1jb3J0ZXhhNTMtbGludXgtbGliYy0NCj4gaGVhZGVycy5wb3B1bGF0ZV9zeXNy
b290DQo+ID4gL2hvbWUvYnVpbGQvdG1wL3NzdGF0ZS1jb250cm9sL21hbmlmZXN0LWFybXY4YS1j
cmMtbGludXgtbGliYy0NCj4gaGVhZGVycy5wb3B1bGF0ZV9zeXNyb290DQo+ID4gL2hvbWUvYnVp
bGQvdG1wL3NzdGF0ZS1jb250cm9sL21hbmlmZXN0LWFybXY4YS1saW51eC1saWJjLQ0KPiBoZWFk
ZXJzLnBvcHVsYXRlX3N5c3Jvb3QNCj4gPiAvaG9tZS9idWlsZC90bXAvc3N0YXRlLWNvbnRyb2wv
bWFuaWZlc3QtYWFyY2g2NC1saW51eC1saWJjLQ0KPiBoZWFkZXJzLnBvcHVsYXRlX3N5c3Jvb3QN
Cj4gPiAvaG9tZS9idWlsZC90bXAvc3N0YXRlLWNvbnRyb2wvbWFuaWZlc3QtYWxsYXJjaC1saW51
eC1saWJjLQ0KPiBoZWFkZXJzLnBvcHVsYXRlX3N5c3Jvb3QNCj4gPiAvaG9tZS9idWlsZC90bXAv
c3N0YXRlLWNvbnRyb2wvbWFuaWZlc3QteDg2XzY0X3g4Nl82NC1uYXRpdmVzZGstbGludXgtbGli
Yy0NCj4gaGVhZGVycy5wb3B1bGF0ZV9zeXNyb290DQo+ID4NCj4gPiBTbyBub3BlLCBpdCdzIG5v
dCB3b3JraW5nLg0KPiANCj4gSXQgc2VlbXMgYXMgdGhvdWdoIHBlcmYgcmVjaXBlIGRlcGVuZHMg
b24gdGhlIGtlcm5lbCBzb3VyY2VzIHRvbywgc28NCj4gYXMgaXQgc3RhbmRzLCB5b3UgY2FuJ3Qg
YnVpbGQgaXQgbmF0aXZlbHkuIEknZCBkaXJlY3RseSBlbGltaW5hdGUgdGhlDQo+IHRhcmdldCBk
ZXBzIChlLmcuIGFjdHVhbGx5IHJlbW92ZSB0aGVtIGZyb20gdGhlIHJlY2lwZSwgYXMgYW4NCj4g
ZXhwZXJpbWVudCkgYW5kIHNlZSBob3cgZmFyIHlvdSBnZXQgd2l0aCBiaXRiYWtlIHBlcmYtbmF0
aXZlLg0KPiANCj4gQWxleA0K

