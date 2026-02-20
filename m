Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 657F9C5AC7A
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 15:47:09 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.498.1771602425357942461
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 07:47:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=T3cVreiH;
 spf=pass (domain: axis.com, ip: 40.107.162.14, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=orK+N5bSwd+0jb26hymLBKzXQRztympmw0JW57eJvFegSNSc1KlpyCpSXILOKt7V8m1NyGn9m+HEkUi1KAgVguzGc/ASXi9KAw7GXdQJTlJvke5jsDNTYl53HNLaJ4By7Z0tjYoziKiZocDOqOCin8Oz8jsqvwPTiQwjCV3vRUG3jLyfx1ACaN2sTUOaOzs+FYbh6AwpD9Fyun7vgNMu6KHyKS6C+MTf5IzhlTd11hIxOoZIYFTVrv4oSBvsA7pMYYrMUnxBhrRFsVnfGSvCR9MjIORhE4dkT0Y/dUjFVVQVTe7nhxs43DnDkYrxmR8qFdF36EnEjXkidVVmAEn0Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eztkZv9WiMlMdyquUwi5rZ6weSYz5qshzg620iGXfiA=;
 b=lXFeW4MNmWvwZme33I2WJ7hhsu8Qd9NUOWhjx2aDo+TZgBKAVbjNu+0xgs9sSAInKbMkGOjGDPreeAoKffmg6dZPrUdczre1m2SDMP6EQrT/6pkqdv5KAbcP1dXapXFer59LfoyiuGaKwIF0i8RujvOqjJ7oLK2UD/3sCsRZkTqCgDzjd6ZyuIolRyhdbcMbT/swooka+Ier7HP20wpG2vZQnaiq4S2WnNTkcFqwm6r1zNl1ZsFYw4DEhpW+iKGOJCmfEL++Njg963KyTxNLqhBgTcg3ApPAhCGJXC9djOLU9kRvXctSgvhsuE3IjAt1A9HoOLyby8sxHkLbP5L9EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eztkZv9WiMlMdyquUwi5rZ6weSYz5qshzg620iGXfiA=;
 b=T3cVreiHCbwLLIVt1BaDx/gZjHbbMC0OzlqmwyRa4+k1AeAFlLUwHVc1SCH7HCPRu3Pwu+Sm7PwMowoo4+BmdGICL9NfLEYlotMMtBE8DYfyJiDa+iF5p0VOG1deL5xcteHwAY3OR1cvra9Lr4IPOudTAcIeX0xYTLVTugSwzY0=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by VI0PR02MB11173.eurprd02.prod.outlook.com (2603:10a6:800:2a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Fri, 20 Feb
 2026 15:47:00 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 15:47:00 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "benjamin.robin@bootlin.com" <benjamin.robin@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "ross.burton@arm.com" <ross.burton@arm.com>,
	"thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"antonin.godard@bootlin.com" <antonin.godard@bootlin.com>,
	"jpewhacker@gmail.com" <jpewhacker@gmail.com>, Peter Marko
	<peter.marko@siemens.com>
Subject: RE: [OE-core] [PATCH 2/2] meta: in lz4 remove reference to rejected
 CVE-2025-62813
Thread-Topic: [OE-core] [PATCH 2/2] meta: in lz4 remove reference to rejected
 CVE-2025-62813
Thread-Index: AQHcolhulAApTyCkmUqwS+uqZTnz/rWLusHA
Date: Fri, 20 Feb 2026 15:47:00 +0000
Message-ID: 
 <DB5PR02MB102131B85A5096A1CB766B037EF68A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: 
 <20260220-update-patch-with-rejected-cve-v1-0-cf113d8a15ca@bootlin.com>
 <20260220-update-patch-with-rejected-cve-v1-2-cf113d8a15ca@bootlin.com>
In-Reply-To: 
 <20260220-update-patch-with-rejected-cve-v1-2-cf113d8a15ca@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|VI0PR02MB11173:EE_
x-ms-office365-filtering-correlation-id: 31195f5f-9965-4ccc-9d44-08de7097492c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?RGdhN25EYWtNQS80OCtZdXg2YTdJVGhmV0RHUGdnNHByaEF6amJxL0ovZWdk?=
 =?utf-8?B?eDkzajRteG9QZDZ4bmlyQkhBajFyK3MrZlZNRitPdXZEZUpXVHAyOFl3QmpM?=
 =?utf-8?B?ZEtNcVlVUmVYY0h4UDJRazZlbnh4T2lZZm11eWdvam5UOThRWG5NZVBVNTJO?=
 =?utf-8?B?aGl1WkcvK2hoMWpUaXArWFhydmNmdDMvUktMdEg2OGpSam54MFNpMXNzSFE3?=
 =?utf-8?B?MGFQc0JuN01lL0loNi9oa0ZxcldiZjFOclBmZVFoYlpMNW80WTkyYTZkNkdI?=
 =?utf-8?B?Qm9VTnpTc3BZM0lzd1NuNFNZVUlqeCtjNE9wK09lRHp0WWpIV2c5ZFhHam1D?=
 =?utf-8?B?R1RZemlYRUUxVC9SZ3RmZ05mNS9BSmFyWWdHQ3RwN3loM0NOTzBUNklld011?=
 =?utf-8?B?TkpjK3B2cjNKcDUyM1hCN21MbFpJZVd6RXp3dXlNQUpkU2xrUVYxQWpIOFFQ?=
 =?utf-8?B?MkEzVGRORS9rRWpMMk1ybXNpWWp4ZFE3NnIwWjJwUjVGeGhDemlBZHVJdlVo?=
 =?utf-8?B?Y0p0ZWZlRGtpSXhBWng5T3FTOVA4YXdrTUcwcXhnSFQ1YTVESGxHSnhYOS9N?=
 =?utf-8?B?cFo5TkRON1NFdWJoSUJjdFBBdVZiTjR6RkNSekttaWdQVXdGQjhRTFdaNzZJ?=
 =?utf-8?B?Q0NrTmw0TmlGNXNENVlDTTR2cFh0SHZ1elBhMXBGVnJ1VEtCT0w3V2lQcVR6?=
 =?utf-8?B?MjhNR2NJb3pGTGt5TVZnTW9UWTRyODhOVDBJckhHemZuZVNLNVRvb2ZLWHZk?=
 =?utf-8?B?TUdLS004TzBNMll0bUw0SVlkOGY2d2dlc0dSNFZGMWNMV2ZtVmFwQUsxaTM5?=
 =?utf-8?B?Uk9zWC9qRlBzaEYrZ3pFbnlzNkxhaHRvd0ZJQ2RrT1hvUUJTSFZaaWNZNmRu?=
 =?utf-8?B?cU92QnNjZGczZUFJSkpSS2cwaXR0WjZoWFhsMWlOYVlMVzg2K1pHbG5IaGxV?=
 =?utf-8?B?VEdyOWdVa3lidGREaHBPeERLdmYwRzdWZGNGR2ZreXlSbHQ4VnR6ZmpMVWJ3?=
 =?utf-8?B?dUhMRmpoN0NKV0xZamUwL2ZJMWNvWHcyaUNEbFBMQnBHSUF4LzIxT0V0K0Rr?=
 =?utf-8?B?SUpRQm9EQzNhbzI0NXhITG9zemttZ3hDbU0yUnhPRStSeFlDRW9BTHBKUmNG?=
 =?utf-8?B?R3ZZQUtURVJKRGdMRm9FckxFQVVENDFJcVFaTWY5eFNZWWo2Y3N2NHpxTXBE?=
 =?utf-8?B?UlM2ZVBOZ3l5MVZQTkpsWHpWM2d2WDB5L0dUVlhvN0wwREFCczM2aUEwMGlK?=
 =?utf-8?B?R0JrM213dkp6ZUcyN3hMY2lCek1OQm1BOG0rbUl6RGsvZHFKMlVGS1ZIb2VK?=
 =?utf-8?B?Wm5NR24vaFAydndGaVRCWFRSVDNDWFQwYnpvWUFWTm1wYTR1cmYyY2hGTmJQ?=
 =?utf-8?B?Qnlsd2E0MTZDY0drRjg0czl2VzArSXJnTlBCQVBud0ViazBXclFVUG1MdkhX?=
 =?utf-8?B?Y0R0WmR6K1FmSlY2aVBySWJ0aHhzU29ydkEwWVNDWjFZY0RpdWdVTFdkMS8r?=
 =?utf-8?B?NTZZeWp2MWFOV0xUMDg4R25TVXVjN0I5NGg0N01xTzJiMGM3cVNacFpRZWNQ?=
 =?utf-8?B?M3BvbWFnS1JrR3lxb09uOFFoSDBsa1dGRDVBOGdaRXFrUFZJY3V1dnRFa1or?=
 =?utf-8?B?bXRMUHljeU5scU5aaDRhdjJpTWFxcjgza3o2ZVdqNUk2YzE2VkErYkNtaS9D?=
 =?utf-8?B?Z1pOTkNqODVWNkZRQldzaVFVZGo5dGJjWGlaeG1Ta0Q5MmhSQmV0ZUljR0dl?=
 =?utf-8?B?U0JPb0NIOFhlamJFS1FYWVQ3cVVUMXhCSHJQSzJUTmUweUd6ZGRmSU84bGhs?=
 =?utf-8?B?OEM1MjNOQ00xNTBqZ0dRZG9vRWJyUmZWdkhoWXFmVmVnOENPejBEai9kMHEv?=
 =?utf-8?B?WlNDbm5DeHF5dU5QRVBQc1JieDB4YmlPRHZIRzJJblBFdmVsUGxLbkRNSExq?=
 =?utf-8?B?ZjJsbUJqRk1RNjN6dm42QmJFU2kwRkloaGZTUXl2bzNpVEF3L1BibkVkd2ww?=
 =?utf-8?B?VW5DSHhkdXJoUVpSSzdlSk5VRTRSblFpTVR5U2tyL05pOGdnR3RSYkFaeXdE?=
 =?utf-8?B?TndVYm1EVFpNSWlUbTNkYjZHTEQ1ODBrbUhMUTVHN0ZxeHVEcGFjYzJ4VVdC?=
 =?utf-8?B?Zm40K1BocW9yM0hmcndNNTBXYit6MCtoZFNGKy9mM3JlRVYzSXJiaktJQ1Zr?=
 =?utf-8?Q?1Xd8/tuIWW0leXigjeh9ZW4=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dVhMdFZRRmlRcU0zdDFla0tmbGdiYmtwWWFhVmxKcHMrVzRmY05WQm5XSmMv?=
 =?utf-8?B?cUpWL3dzRTJqT3REUHNkZ29ZRW5qWEI5TzNWM1VTWU5RVCtZNUpFRWZZOXNa?=
 =?utf-8?B?RW82UGRac2lla3NSWTR5cCtlMnl0Y013aHhmc0o1RzQyWVVlU3VnVUh4YUVX?=
 =?utf-8?B?c1dZNGdwQXlNRDhZZjVIQlloMEEvZXhadXV3emlLSWJvZFdEMFdOcHBORlY1?=
 =?utf-8?B?VUdvMlcwdkJPbTQrQzExUEUvQ0h1UjlpdXdNa1FxcGxrUTdZaWJqVkZ3dGN2?=
 =?utf-8?B?dGtNVjNwc2RKWkZtZE9tSHl0QmFabzNNNG9nM0I5a3o2cmFVbW92ZVowU1Rk?=
 =?utf-8?B?VzZtUTNuSkI5czh3NFpMZVZPK2hXUytCYTREUENVclp5dk13ZVViYk94c0VW?=
 =?utf-8?B?S1RBbmo2b0s5OUpNMkduYnNiSGJ6cHZPNjU1MzVuTXlBMnV5cTdBMlBZMXE0?=
 =?utf-8?B?eUJTOXpROU4yeHBLWkNlRXlCQ29LZDY4YkhxbGI3VFN0Syt5ekV0WVF6cHQw?=
 =?utf-8?B?NlB6M0VGbEZKYmJIaEVDc2ZPZndNM0lKTWlHekgwSGdmTEpES0FRMW5Sb0pY?=
 =?utf-8?B?aHZhbVhiWXEwdlNkMXYzWWUxcFJzOXNmL2g0NCthSm85bldQcWI4cDJ3Q25U?=
 =?utf-8?B?QzRqY0xuRWpkL1d1Uk13aG0rNHV6VEFVR0loOTJ0MzM5bllUSjBsZ0Y3WHpT?=
 =?utf-8?B?V3pQY1BmZTZsS25IZ0JGYnF4eFFyaWFKd0JXMHVDMmxUY055aHEwQkd2UTNq?=
 =?utf-8?B?N2hHbkhFN2VlNW1DS3BobkdBczdrWGhBeEl5QTFWVTBYeGFOSlBuTXNmaWtH?=
 =?utf-8?B?YnhhRGtCYmE5SXJ0VGxKRmhoeXYwRHdQRFlkRHNXeDJhWDcyT1U0YWl4akNq?=
 =?utf-8?B?R2V1b1F1eTdZZ0UveWxNSGNnMk0xOERGeWlURWtKaGlrR2dYRVJ3NlpJZzN5?=
 =?utf-8?B?OFI3YVdQWFBsQjdGSlJXa3JHRVduVFJxeTZ4cnZBWnh2OFdOMWVvZ3lkeDN5?=
 =?utf-8?B?V2VyRTUxb2dsRGNUU3Y4dmRmT3NRcGdRV01GMzZMRjhNU01jTlNicmpEbFdv?=
 =?utf-8?B?MWgyNzNEWittOW82cmR5YTlZaWxwdnFScDVNaHdGSElZcVd4Tk5QeStjZG9T?=
 =?utf-8?B?ME1VYTg4U0FWcHZlcmhydzJBQklpalkyOEF2cForRXN0NndzUlFQWk5rZGdv?=
 =?utf-8?B?RHV2VUkxVGVYWUExanVKSUQ3c1Vta1ZreUtoTGhXczBxdjF5Z3R2YWpKTldB?=
 =?utf-8?B?K1p2bm1jT0wxWW8rR3ZidGpoamNnN0FqTnUyK0laSitCVklhUXd2amJUZVBS?=
 =?utf-8?B?TGZmQzl2WFp2Y0lVQ3c2YzBuZDJ2WXYyeFErQzNPUlBNNXVoTi9jb0tmaEhl?=
 =?utf-8?B?YVN6ZXN3Sm41c05yQWNDaG9CUmhYOGVOc2t4Q0tJVkNCbHB4OTJqUXdrQ1Nu?=
 =?utf-8?B?b1BJaFVTMVpGaE5EcTdxbld5b0dGaDVqYXAvaFczcTJNSmZoTlowZSt3dlp3?=
 =?utf-8?B?bU1KTmlDSWs1NWdZRjhuMUplWHVzZmZoVnNuQU51QmNiZjZlUWJ3OEt1L1lN?=
 =?utf-8?B?dFhCYkFmaU9Gc0pLdlU1UzN5cWRrYm53Vk5NOE1GZ0tPR0NnZzEzWmFVaHNq?=
 =?utf-8?B?OG9QbFY3M0N3eStWRlJqakF2cThKMGIrQ1Y2Y0xLeGx1Z1RvMHFpQVVaUUtY?=
 =?utf-8?B?MXFzeW9ZdVR2bTV3TTJYdnpSaDNOTFgxMWZwV3FBT3c1WWpGUVhKUCs3Qjlm?=
 =?utf-8?B?MDFGUHR3OWMwS3k5cWVLWVFxRytFZ2FwTjBDMUJMWEdwblBtMnhmYWRIbnNv?=
 =?utf-8?B?WXlEL2FLQXdpQjdIbkwvbEN0U20xOUJJT0I2MGZJUVFJaXNUMmRBZDVVSWFm?=
 =?utf-8?B?MUw1V1ZrVmVteE5OWjVwMUNta3hqVWxJUTRNSmtqbWE1Szh3QmZFM3B6S3ZU?=
 =?utf-8?B?T2V3elliNzFwWVJNL0JwYzlWZ3F6ZUVzWUJzWUtldVFNOW9zN0h5SjlZTVd2?=
 =?utf-8?B?TVhla0IwdHV2QktwQjZKdVVlb0RKbUZabmtIOUtKNFlmc1Q0Z2ZhYnk4Qjd6?=
 =?utf-8?B?ZlQ5MzdEaHdLN2hZa0JnYmJFaCtmVHJtTmE5N2RMQ0QxTWloWHEzZ2k0Ukor?=
 =?utf-8?B?aFJsbmdRK3pNSjdOazhnTnFrbnV2ODUxRXJjc29rSFFJRVdKT2k2OEVrZHBh?=
 =?utf-8?B?MmRESWEwSHNwRkFXWjV0d1h3OGtlM0dYN3hZeE1rSzErMXUwMWVrWk5DQ21E?=
 =?utf-8?Q?hHJ6j1CGthIFbq2NW8RZjEgR8EzYJfOt7oPbit1Lbk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31195f5f-9965-4ccc-9d44-08de7097492c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2026 15:47:00.3167
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GzIYhmVIpDjmrXW4LxVLtBLNQD3M4LFoS9hOSKpDaci3NkH+VKCIXHLzgdSj2lQs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB11173
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 15:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231530

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgQmVuamFtaW4gUm9iaW4gdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gU2VudDogZGVuIDIwIGZlYnJ1YXJpIDIwMjYgMTI6MDINCj4gVG86IG9wZW5lbWJl
ZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IHJvc3MuYnVydG9uQGFybS5j
b207IHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb207IG1hdGhpZXUuZHVib2lzLWJyaWFuZEBi
b290bGluLmNvbTsgYW50b25pbi5nb2RhcmRAYm9vdGxpbi5jb207IGpwZXdoYWNrZXJAZ21haWwu
Y29tOyBCZW5qYW1pbiBSb2JpbiAoU2NobmVpZGVyIEVsZWN0cmljKSA8YmVuamFtaW4ucm9iaW5A
Ym9vdGxpbi5jb20+OyBQZXRlcg0KPiBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+
IFN1YmplY3Q6IFtPRS1jb3JlXSBbUEFUQ0ggMi8yXSBtZXRhOiBpbiBsejQgcmVtb3ZlIHJlZmVy
ZW5jZSB0byByZWplY3RlZCBDVkUtMjAyNS02MjgxMw0KDQpQbGVhc2UgdXNlIHRoZSByZWNpcGUg
bmFtZSBhcyBwcmVmaXgsIGUuZy46DQoNCmx6NDogUmVtb3ZlIGEgcmVmZXJlbmNlIHRvIHRoZSBy
ZWplY3RlZCBDVkUtMjAyNS02MjgxMw0KDQo+IA0KPiBUaGUgQ1ZFLTIwMjUtNjI4MTMgaXMgcmVq
ZWN0ZWQgc28gZG8gbm90IHJlZmVyZW5jZSBpdCBhbnltb3JlLg0KPiBTbyBrZWVwIHRoZSBwYXRj
aCBidXQgd2l0aG91dCByZWZlcmVuY2luZyB0aGUgQ1ZFIGlkZW50aWZpZXIuDQo+IA0KPiBUaGUg
Q1ZFIGRhdGFiYXNlIGluZGljYXRlcyB0aGUgZm9sbG93aW5nIHJlYXNvbjoNCj4gICBUaGlzIGNh
bmRpZGF0ZSB3YXMgd2l0aGRyYXduIGJ5IGl0cyBDTkEuIEZ1cnRoZXIgaW52ZXN0aWdhdGlvbg0K
PiAgIHNob3dlZCB0aGF0IGl0IHdhcyBub3QgYSBzZWN1cml0eSBpc3N1ZS4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEJlbmphbWluIFJvYmluIChTY2huZWlkZXIgRWxlY3RyaWMpIDxiZW5qYW1pbi5y
b2JpbkBib290bGluLmNvbT4NCj4gLS0tDQo+ICAuLi4vbHo0L2x6NC97Q1ZFLTIwMjUtNjI4MTMu
cGF0Y2ggPT4gZml4LW51bGwtZXJyb3ItaGFuZGxpbmcucGF0Y2h9ICAgICB8IDEgLQ0KPiAgbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbHo0L2x6NF8xLjEwLjAuYmIgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAyICstDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAy
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2x6
NC9sejQvQ1ZFLTIwMjUtNjI4MTMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9sejQvbHo0
L2ZpeC1udWxsLWVycm9yLWhhbmRsaW5nLnBhdGNoDQo+IHNpbWlsYXJpdHkgaW5kZXggOTklDQo+
IHJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2x6NC9sejQvQ1ZFLTIwMjUtNjI4MTMu
cGF0Y2gNCj4gcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2x6NC9sejQvZml4LW51bGwt
ZXJyb3ItaGFuZGxpbmcucGF0Y2gNCj4gaW5kZXggNGZhMDM3M2ZmNzc4Li4xNTI3Y2M3NTkxMjQg
MTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2x6NC9sejQvQ1ZFLTIwMjUtNjI4
MTMucGF0Y2gNCj4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbHo0L2x6NC9maXgtbnVsbC1l
cnJvci1oYW5kbGluZy5wYXRjaA0KPiBAQCAtNCw3ICs0LDYgQEAgRGF0ZTogTW9uLCAzMSBNYXIg
MjAyNSAyMDo0ODo1MiArMDIwMA0KPiAgU3ViamVjdDogW1BBVENIXSBmaXgobnVsbCkgOiBpbXBy
b3ZlIGVycm9yIGhhbmRsaW5ncyB3aGVuIHBhc3NpbmcgYSBudWxsDQo+ICAgcG9pbnRlciB0byBz
b21lIGZ1bmN0aW9ucyBmcm9tIGx6NGZyYW1lDQo+IA0KPiAtQ1ZFOiBDVkUtMjAyNS02MjgxMw0K
PiAgVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIuY29tL2x6NC9sejQv
Y29tbWl0L2Y2NGVmZWMwMTFjMDU4YmQ3MDM0ODU3NjQzOGFiYWMyMjJmZTZjODJdDQo+ICBTaWdu
ZWQtb2ZmLWJ5OiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ICAtLS0N
Cj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2x6NC9sejRfMS4xMC4wLmJiIGIv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbHo0L2x6NF8xLjEwLjAuYmINCj4gaW5kZXggZjJhODYwMzZi
NTZhLi5mYWU1Nzk2YzJiOWEgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2x6
NC9sejRfMS4xMC4wLmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2x6NC9sejRfMS4x
MC4wLmJiDQo+IEBAIC0xNSw3ICsxNSw3IEBAIFNSQ1JFViA9ICJlYmIzNzBjYTgzYWYxOTMyMTJk
ZjRkY2JhZGNjNWQ4N2JjMGRlMmYwIg0KPiAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2x6
NC9sejQuZ2l0O2JyYW5jaD1yZWxlYXNlO3Byb3RvY29sPWh0dHBzIFwNCj4gICAgICAgICAgICAg
ZmlsZTovL3JlcHJvZHVjaWJpbGl0eS5wYXRjaCBcDQo+ICAgICAgICAgICAgIGZpbGU6Ly9ydW4t
cHRlc3QgXA0KPiAtICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMjUtNjI4MTMucGF0Y2ggXA0KPiAr
ICAgICAgICAgICBmaWxlOi8vZml4LW51bGwtZXJyb3ItaGFuZGxpbmcucGF0Y2ggXA0KPiAgIg0K
PiAgVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAidig/UDxwdmVyPi4qKSINCj4gDQo+IA0K
PiAtLQ0KPiAyLjUyLjANCg0K

