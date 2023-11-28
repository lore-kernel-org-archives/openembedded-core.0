Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 601BAC07CA9
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 13:50:36 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.48])
 by mx.groups.io with SMTP id smtpd.web10.32863.1701179434932928070
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 05:50:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=prZEMue+;
 spf=pass (domain: siemens.com, ip: 40.107.13.48, mailfrom: alexander.sverdlin@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNINjvuPcMhfWoAwigXIO8hfmqMrQJ/ch4E55Mtqfq9hjrRT1apkO2tBL7R1svLjjhOyv4Hkz6bxJnmo5bNRU2TSYcRAKChipSrGd5rIPTqRoaiwlC0MPlBoDK8W95Bqa9DBIBprphCSHFGgitHMMWltk+ho8+HS5Gqnxdd8EA5QuRFQX02HVEHC+W2c2n7e2zTzef/BkV06U0dWckxHm45r9pYtWmc/To5Ki8f0A4+Tyl2M4AXd3HIxeB10OYhCI5Z+e9TL0wmjHMB3HksSznVSMzoEdROSfX4TMarj+pLYhBXhPVWcrBC0fEWji+JJaw3dMJlyV8gKa+uiiIXGxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uE3iOoOXro+59u2aKsQW03cYJc20wFiSiVM0zwzDg2E=;
 b=RSyaOTJM9Eo/KBfxOX4XzqsKxGArZ4pTL335KCR0A/JxaPwVvQGhbL+uOlgwXbIq7DQXlHqQR7Ksakz1vBdianMQrXR71h02+vNH8i3P1N17lIh+S3bkBGX7P2q0vkUOTMx+gwjU9gBzQKo4CXWs66nTTjXDlqqXl3RoEuDLXtijHrJ8TXAshbUJEoiXbrmZGsYDrFubKqyRfDaIEaI8aidrXgExhhH9nD2ct6sJn+KpNZkaIOCYDOnHY5TFvlHpLkotI282OJXOev79V3EO0VG0c1HaeMRDqTmlRWV/bXzKnTMGPqFZ3jPZyIeeWu4HmOOx6ySSpr5KXqnIuXDuPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uE3iOoOXro+59u2aKsQW03cYJc20wFiSiVM0zwzDg2E=;
 b=prZEMue+SxGt/GAoMXmn64jExR11DarXRF2WyE3NoJag+R6ad7AReV9OctVLGFTXVIZBQ+wfd1W1M+DDxJuPzuMcm2Tw6Pw3PmIeISjixDezXWtqgZczhYc62D6kmXxZzKo6b8VkXQk7UZVDqpPTPEO1D55FRaA1tmwmNb+9lyjbb25qxilg350aVg8W5aeTokRbuFVGE1oS4Eij0jlM5y6TPXXGOigEuemEy4j9MZpxQQakSqdGpFqhHKeHQQrr2Y99xl1jWO9c+A+XZLvbT6sY31ClhovPWpkLwsaYNKZiqudu7AsA/O4ghrOcBGYFF1LsblWS6pSdL3Vr620klA==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by DB4PR10MB6262.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:382::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 13:50:30 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f1e6:2701:4840:b64f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f1e6:2701:4840:b64f%5]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 13:50:30 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Marko, Peter"
	<Peter.Marko@siemens.com>
Subject: Re: [PATCH] linux-firmware: use install-nodedup make target
Thread-Topic: [PATCH] linux-firmware: use install-nodedup make target
Thread-Index: AQHaIf2XfJbicLFP+kCeMjlzTNVne7CPumCAgAAFVoA=
Date: Tue, 28 Nov 2023 13:50:30 +0000
Message-ID: <e0c37461b71d6159a2867726388fbc052bb4f624.camel@siemens.com>
References: <20231128131954.337015-1-alexander.sverdlin@siemens.com>
	 <CANNYZj92XtmcpJpyo1eo04X1dpqPmU6cCKVhpP7aJnMK6RWPTQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj92XtmcpJpyo1eo04X1dpqPmU6cCKVhpP7aJnMK6RWPTQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|DB4PR10MB6262:EE_
x-ms-office365-filtering-correlation-id: 891b27b0-b79c-4afb-a60a-08dbf018fc5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 0Bdp/Q9s67fS3Ln5rgiUl7qe2bSma6Q6KrzgVlQTYxjpZOw7BIDGoiIlTecU/g/vjoZU/VE/Ix6nweZepUW0ibLEsQGqrW1ZJVLBWBiFKemah2XuwNMtP+yCEwaO2foy1PSPlK5UsdPqommW5k0LOjeAWdi/rb1aJlV6cFH9QEm4jSXzNNfsuLOwdeswok77SSOoDasnqhcDxuRFdD3VI4pxTXgjhgpwpvfYyz4X14Rz5O6kyWI4MghdiB4qYf8ahXXvrWumLnKXW6bunvc1AMMkpKn/9gXryCbM6W8lSYSZB4Kss4hEysdQgZSmTJSEEqjAKEYNLsTyxDNpYV8h1h2oDaYvuW6Krsv7Xk8cFQB330uHjWx0PGisGzfD+VbLw/q7OY0g1M9qQR5emEzsoYwiSHKJ+6V0UMzLsZsr63TT9VO/EHI2rxBsjH4f/pzfkWSHFgrsFPWpkK6paOOgqn0iky32nZ6KnC7Jx28oUN5pyRenXFTq3B56L1AKF5WDfRWSGTeUspsHJKUkoiFvyGPvesiJsi2MBPt27Gaejm9wV87RVM3axX6xKqBzo6fec5mh1EP+6eoU56W9N+RpvnPDY9QUfFk6s1/hw7Mb7UlhoToDVb1nL+JFibKF+6Vk1VRjoqrZaCePr/ydTHevBg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(346002)(376002)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(38070700009)(71200400001)(4001150100001)(122000001)(36756003)(2906002)(5660300002)(15974865002)(86362001)(6512007)(55236004)(82960400001)(83380400001)(2616005)(38100700002)(107886003)(41300700001)(6506007)(26005)(478600001)(6486002)(966005)(76116006)(66556008)(66476007)(54906003)(91956017)(4326008)(8676002)(8936002)(66946007)(6916009)(316002)(66446008)(64756008)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?T0d2NkFKZHkwVS9ZQjJlZFdXb1NhMWgrOElxSE5OOHE5K2t5bTNDZXJ3dmtB?=
 =?utf-8?B?bEZFdmJYZFJHYXRQYjJ2czREanFWcThORXlmRTROWUM2VGVTakxFSTRabWpo?=
 =?utf-8?B?b3VxNUNTUkcxWnR4U3lWWTIzakZFNTFuUEVUem5GK0dYL01DMVJ5enEzeUpi?=
 =?utf-8?B?T2E2enJRODViWmpRYmpIaUk0alpHSjlNbXd1YzhYV2pQVGYreHFwblpMR0xT?=
 =?utf-8?B?MGZvVXZVR2kwR2FEbE9vT2RnejFzRzErQVZCUzc2MWVNU2ZaVUoyNTQrUlJC?=
 =?utf-8?B?U2xaN2EvRDdCOG1RMmlnNERmaE56cmtrTGxhbmpYN2xoNWNuOFlZQjA1R3k3?=
 =?utf-8?B?cHBqZ2VkUHJjUjZZUVBxc2QrOGJmbW1HcVRlQ0ZzWjhFUjFPOElWRGV6aENH?=
 =?utf-8?B?RWhiKzJaTDFmNEpWOENHTzNKd1pnTmVuNkJJbi9mUzdIdXFQdWpHbDdIVWE5?=
 =?utf-8?B?Tk16OHJ5RUNiNmh3RElsSVZHbmRhUEUvNTlrbDd4NE16aVhDK2pzZkMwQm5K?=
 =?utf-8?B?MUIxeEU0MWFEQ2hiTzBxNmNFZGhLMnVCK3dCQnRmMVd0M1QxQVcrajRwYVE0?=
 =?utf-8?B?djVsWWVRNFV1bnhyTEp4eGV1UmFJMjJpM21GU25yNDhhZ2RtSXVIdkV2dWNW?=
 =?utf-8?B?TFJ0SzVQbjE5ZHRWWW05Mm9QdFNIT0M3Y3FzeWd6NFU5NVpOamFMZUxHT09F?=
 =?utf-8?B?a3lKNzdSS1dNNWNSbVRTVlUyUTBaMHFwYlNaek1rNVkrdVVEWUx6Y1ZEaG53?=
 =?utf-8?B?czByOGV4VzFpTnVqMUNlT1AwYUM1aFlXbGRZdkgzUlJ4czFIc2l2OGE4UHMw?=
 =?utf-8?B?eUw5SWJQN3NtVzJxenAxalAvaEQ5QnFXOW5LSjJoL2t1QXhqajExdzNkdHVw?=
 =?utf-8?B?bWU0NW9xUlhRSFVrejU1SVRhcFNBd0tCbkd4cXBlRXlDQlZUZWlPdnp5ZkNP?=
 =?utf-8?B?RkdsSTZuK09FeFllZHYya2tjN0MrU0xPeWZ5bzhNT0RuSGgyZVdBcFJRTHQr?=
 =?utf-8?B?enpPVXJuVzhQVWllaEJBdk9wNXB2cUVTTEhrRjc3TXpuU1VsYkJVaDZ2KytG?=
 =?utf-8?B?OWllRzhpdnpIWWJWY2thbm8xOGRaaDlPbTlsMmNjUVA5dFVpVEw0TEg2TXRo?=
 =?utf-8?B?dHNaaDNrLzNCRFU0ZTYrUGJxOW1kZnRhdVp6YjBERTRQTDliRWU0YnNYVWF5?=
 =?utf-8?B?RHhZODhsNEROSG9ST1gvUmgwOUFndk9GbVZIeHEzVy9qcG84T0RBTlhOOUcv?=
 =?utf-8?B?ZXk2akw2RSt0MTJodE10MWNXSzZhdjR6ZSthNXVVNUF2d0dpT1BzMUwxNStY?=
 =?utf-8?B?a25kWkZkWEh0SjhkY2NIOWRCSU90VGNhaHdxcHVmUXpvS2dNV3BZNVAxaVZ3?=
 =?utf-8?B?eVdwd1JKTG5aVkxrL1EwRmdEK1ROcis3V2oreHFXMnRuaDJSdnNuUkxrZitq?=
 =?utf-8?B?UlZiak5OZHFBVE5uR2dTcmlGTDZrSU9MU2dPM1dDd3ZiRkVYa1BUeEFWTmtB?=
 =?utf-8?B?ajJCbEw3a1FKZXJKanVFQnc0c2NvUng0ZXlNQzZHaXp1aUpBOU1XTkpiQ0FM?=
 =?utf-8?B?K2g5bXNjaTN0Y2EzUDdYM2oxZm9qcXRLNFFWQUFPekt0M0xXT3A5ZUEvNkx4?=
 =?utf-8?B?SkdjZW1nYkthL09HTE5IMFllYTN3WENQK3ZNb3g1Q2owSHZPQTNjRG9yTEk3?=
 =?utf-8?B?Zm1Ienc1bHVzdVRkdFpsbFY5RXJ0WkVTa213RE83Z1hlT0xOQktRNWo5WEZj?=
 =?utf-8?B?M0ZiZnVMa2xqSVl5dURYRks1bTZ2ajQzSjBWaVdIYnZ1RG4vT1BHYml4N0lp?=
 =?utf-8?B?MWR4aDRxZWd0NzcwQ1hacG92NTFOeEFZUXl6cTJkRGhyVFZTditoeW1lYjFx?=
 =?utf-8?B?elh5RkN4TkI4ajBxekUxUGYrZGRZMnYrL0EyM09vb3QyNGxiQlBzYnE4Tm1j?=
 =?utf-8?B?WEQ1NVNXZXdhMG5lNlh4UHNUTFEyRnlmUUVTelRrSHVkRTBxVUI4dTUvWU0r?=
 =?utf-8?B?ZnZsc2pzVW5NZDVQb05NamxHQVo4amNiNzg0QlVDbncyelV6RE1CRTlWcStW?=
 =?utf-8?B?VWpkR21seFJhSFBvRjNxbExoTm9SZ1V0alVjUkZHTDZSNldYYXVMaHhibVEx?=
 =?utf-8?B?bWczeGMxWHZkdjRES3Nqd25Nc0E2bWNNT0g2N3ZGQi9sQkN0cDdCSVVOeG9X?=
 =?utf-8?Q?WLHRuNdcW/pqfLXLGkf3KJY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A850344AC90C124EBAD29C5ABFFEEAE5@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 891b27b0-b79c-4afb-a60a-08dbf018fc5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2023 13:50:30.6126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DkwTL+aJGb1wNkwudxPhhBHhuOexnFaXunjLyEqrSmXrEVAiI+xRt+Uam7yYbCZstX/Om/obwbP51OYsYE3w3YxPRiSim/FQ0b8eIgADMyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6262
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 13:50:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191369

SGkgQWxleCENCg0KT24gVHVlLCAyMDIzLTExLTI4IGF0IDE0OjMxICswMTAwLCBBbGV4YW5kZXIg
S2FuYXZpbiB3cm90ZToNCj4gT24gVHVlLCAyOCBOb3YgMjAyMyBhdCAxNDoyMCwgQS4gU3ZlcmRs
aW4NCj4gPGFsZXhhbmRlci5zdmVyZGxpbkBzaWVtZW5zLmNvbT4gd3JvdGU6DQo+ID4gVmVyc2lv
bnMgc3RhcnRpbmcgZnJvbSAyMDIzMDkxOSByZXF1aXJlIHJkZmluZDsgYXQgc29tZSBwb2ludCBu
ZXcgbWFrZQ0KPiA+IHRhcmdldCB3YXMgaW50cm9kdWNlZCB3aXRoIGNvbW1pdCA0MTI0ZjhmOTI4
ZDUgKCJNYWtlIHJkZmluZCBvcHRpb25hbCIpLg0KPiA+IFRoZSBjb21taXQgaXMgbm90IHlldCBp
bmNsdWRlZCBldmVuIGluIDIwMjMxMTExLCB0aHVzIG1ha2UgZXZlbiB0aGUNCj4gPiBuZXcgbWFr
ZSB0YXJnZXQgb3B0aW9uYWwuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIFN2
ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5Ac2llbWVucy5jb20+DQo+ID4gLS0tDQo+ID4gVGhp
cyBwYXRjaCB3aWxsIG5vdCBoZWxwIHdpdGggMjAyMzEwMzAgdXBkYXRlLCBuZWl0aGVyIDIwMjMx
MTExIHdpbGwgd29yaw0KPiA+IHdpdGhvdXQgcmRmaW5kLiBpbnN0YWxsLW5vZGVkdXAgaXMgbm90
IHlldCByZWxlYXNlZCBhcyBvZiBub3cuDQo+ID4gwqBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4
LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjMxMDMwLmJiIHwgMyArKysNCj4gPiDCoGRvX2lu
c3RhbGwoKSB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgICMgVmVyc2lvbnMgMjAyMzEwMzAgYW5kIDIw
MjMxMTExIHJlcXVpcmUgcmRmaW5kLCBuZXdlciB0YWdzIHdpbGwgaGF2ZSBuZXcgImluc3RhbGwt
bm9kZWR1cCINCj4gPiArwqDCoMKgwqDCoMKgwqAgIyBtYWtlIHRhcmdldA0KPiA+ICvCoMKgwqDC
oMKgwqDCoCBvZV9ydW5tYWtlX2NhbGwgJ0RFU1RESVI9JHtEfScgJ0ZJUk1XQVJFRElSPSR7bm9u
YXJjaF9iYXNlX2xpYmRpcn0vZmlybXdhcmUnIGluc3RhbGwtbm9kZWR1cCB8fCBcDQo+ID4gwqDC
oMKgwqDCoMKgwqDCoCBvZV9ydW5tYWtlICdERVNURElSPSR7RH0nICdGSVJNV0FSRURJUj0ke25v
bmFyY2hfYmFzZV9saWJkaXJ9L2Zpcm13YXJlJyBpbnN0YWxsDQo+ID4gwqDCoMKgwqDCoMKgwqDC
oCBjcCBHUEwtMiBMSUNFTltDU11FLiogV0hFTkNFICR7RH0ke25vbmFyY2hfYmFzZV9saWJkaXJ9
L2Zpcm13YXJlLw0KPiANCj4gMjAyMzEwMzAgYnVpbGRzIGZpbmUgd2l0aG91dCByZGZpbmQsIGFu
ZCBkb2Vzbid0IGhhdmUgaW5zdGFsbC1ub2RlZHVwDQo+IHRhcmdldCBpbiBpdHMgTWFrZWZpbGUg
YmVjYXVzZSB0aGF0IHdhcyBvbmx5IGludHJvZHVjZWQgeWVzdGVyZGF5Og0KPiANCj4gaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZmlybXdhcmUvbGludXgt
ZmlybXdhcmUuZ2l0L2NvbW1pdC9NYWtlZmlsZT9pZD00MTI0ZjhmOTI4ZDUxYTE0MzdlMmZkMjYz
NmIyMGQ1NDBlZGMyODM2DQo+IA0KPiBTbyB3aGF0IGlzIHRoZSBwdXJwb3NlIG9mIHRoaXMgcGF0
Y2g/IEkgdW5kZXJzdGFuZCB0aGF0IHdlIHdvdWxkIG5lZWQNCj4gdG8gdXNlIGluc3RhbGwtbm9k
ZWR1cCBpbiBsb2Nrc3RlcCB3aXRoIHVwZGF0aW5nIHRvIG5ld2VyDQo+IGxpbnV4LWZpcm13YXJl
IHZlcnNpb25zLCBidXQgdW50aWwgdGhlbiBpdCdzIG5vdCBuZWVkZWQuIE5vPw0KDQpZb3UgYXJl
IHJpZ2h0LCBldmVuIHRob3VnaCByZGZpbmQgaXMgdXNlZCBpbiAyMDIzMTAzMCwgaXQgZG9lc24n
dCByZXBvcnQgZW4gZXJyb3IuDQpFcnJvciByZXBvcnRpbmcgd2FzIGludHJvZHVjZWQgd2l0aCBj
b21taXQgY2Y4MzE1ZGVkOWI0DQooIkVuc3VyZSByZGZpbmQgaXMgaW5zdGFsbGVkIikgd2hpY2gg
Y29tZXMgaW4gMjAyMzExMTEuDQoNClNvIHlvdSBhcmUgcmlnaHQsIGl0IHdpbGwgYWN0dWFsbHkg
YmUgb25seSByZXF1aXJlZCBiZWZvcmUgdXBkYXRlDQpvZiBsaW51eC1maXJtd2FyZSB0byBldmVu
IG5ld2VyIHZlcnNpb24uDQoNCj4gSW4gZ2VuZXJhbCwgfHwgaW4gc2hlbGwgc2NyaXB0cyBzaG91
bGQgYmUgYXZvaWRlZCBiZWNhdXNlIGl0IGlnbm9yZXMNCj4gdGhlIHJlYXNvbiBmb3IgdGhlIGZh
aWx1cmUgKGlnbm9yaW5nIHNvbWUgZmFpbHMgbWF5IGJlIG9rLCBpZ25vcmluZw0KPiBhbGwgZmFp
bHMgaXMgbm90IG9rLCBhcyBpdCB3aWxsIGNhdXNlIHNpbGVudCByZWdyZXNzaW9ucykuDQoNCjIw
MjMxMTExIHdpbGwgYmUgcHJvYmxlbWF0aWMgYmVjYXVzZSByZGZpbmQgd2lsbCBiZSByZXF1aXJl
ZCwgYnV0IHRoZXJlIGlzDQpubyBtYWtlIHRhcmdldCB5ZXQuIE15IHBhdGNoIGlzIGF0IGxlYXN0
IGZhbGxpbmcgYmFjayB0byAibWFrZSBpbnN0YWxsIiwNCnNvIGl0IHN1cHBvcnRzIGJvdGggMjAy
MzEwMzAgYW5kIHZlcnNpb25zIGFmdGVyIDIwMjMxMTExLiBJdCdzIG5vdCBpZ25vcmluZw0KdGhl
IGVycm9ycywgZmFsbGluZyBiYWNrIHRvICJ8fCBtYWtlIGluc3RhbGwiIHdpbGwgZXZlbnR1YWxs
eSBmYWlsIHRoZSB3aG9sZQ0KYnVpbGQuDQoNCi0tIA0KQWxleGFuZGVyIFN2ZXJkbGluDQpTaWVt
ZW5zIEFHDQp3d3cuc2llbWVucy5jb20NCg==

