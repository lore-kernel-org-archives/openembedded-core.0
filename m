Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2916FC55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 10:00:28 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37001.1785924022513953289
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 03:00:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=iwNmiJoC;
 spf=pass (domain: siemens.com, ip: 52.101.69.22, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QOLgC1IMuhDNlfkO2cK1Oj16Pg6RYYrd5P5dXtdyQn0oPQDJuTnrQrk0oyrkPJ1OM9lHbF75tq42Uk8NcGDBVxco/0+aXpHBqdg/90LoY6es7gvDQ9J7GQiUIZxEWGj+2qYBJDvFf4Jw2Hinco1gkIIvUG0qkoOSKJBY2jWXUmuKjP83eO+CGv3bCaeDSV9jUHIRgpW97flY75+T2IZVtXFGzNxHjRaWmsF5z5HKPyznMDgDmn7i76o3PQ0oZlWGs/WSa1ghAwtWarxmJLbREwAL5lA4btGKjo2FZjmV1iCVdln10I8GM11HoLxIEB/cZXJtPNaAlIKxoSqd2D7LLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0E6dEG6JKxUoJlUEq06LE0tceLV5j6OLJVR8Qimc04=;
 b=IXKgfVpz3+6AohF/NXkgPoxJhu9tE+TNmUf1UQ2M9xEcuZnpbGaqZLtbkFUUE81eW3ZTxWC15X0wlbKYZBtq3DuJfae7hdOHdNd7K/U23V4XsRWpw95w2BRr+uNkPibjXNzjFg5rfix2P/18GU5ybU9cTTx0P7xDQZXl8niKaXA/+qAd05LXTlBPV7Np/INFx9fZ2WGT9wesBJMtolNMEq4bbEW+YL8eU+b8KiexOXkBrAfmebdP1NnHNJJQKVFzJl6EHZVm3LV/vHNwnUGbRHr7QTm9w3tGC7bn59+o/oq1uaieiL4xWEmvEXnkzzD8Mw9aVC2PqEl71jEPNoy8fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0E6dEG6JKxUoJlUEq06LE0tceLV5j6OLJVR8Qimc04=;
 b=iwNmiJoC5MVCf9wr2T/Iwja74U1Apa2bZe9Uwuw+zmRfSOaEJ40B6rf2NafAhJiozzYsTDZry2Md5xmluCUVZB3E1zpuDY9moXUaNds+HK0eoC4EPvErvMouC737mBkDu/mhq21RGvoQor0+LAd4sCpBy07tEmPaUHHbLNzPd/dboZ6P/tWYAjuKdOOIX/FEGn5LPgQcCP/+fEWqfO35sav+Vk8qP52pvkJonkZhJr4bX6UlkrAEUmvOiM2mdk1BmiX85Z0+CDm9pp1LzyLRNZCR0zIPUsTBLRpHs3XjYB0LuI/pyn6Tb+XYMR5KzV2tYGjZoaIWI3PAC7DYSAB7Kg==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by AS8PR10MB6103.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:571::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Wed, 5 Aug
 2026 10:00:13 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 10:00:13 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "ross.burton@arm.com" <ross.burton@arm.com>,
	"olivier.benjamin@bootlin.com" <olivier.benjamin@bootlin.com>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
	"pascal.eberhard@se.com" <pascal.eberhard@se.com>, "wahid.essid@se.com"
	<wahid.essid@se.com>
Subject: RE: [PATCH 0/3] sbom-cve-check: Update to version 1.3.3 and update
 CVE databases
Thread-Topic: [PATCH 0/3] sbom-cve-check: Update to version 1.3.3 and update
 CVE databases
Thread-Index: AQHdIyof+A0k30pV+kmPWkqXERry4baPOB9A
Date: Wed, 5 Aug 2026 10:00:13 +0000
Message-ID: 
 <AS8PR10MB5073728DC68610A9254ED210FDD32@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <20260803-update-sbom-cve-check-1-3-3-v1-0-c0e5e198030e@bootlin.com>
In-Reply-To: 
 <20260803-update-sbom-cve-check-1-3-3-v1-0-c0e5e198030e@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=c61d3bc9-0d0c-49b4-99aa-9d5a3fdc6191;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-08-05T09:46:01Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|AS8PR10MB6103:EE_
x-ms-office365-filtering-correlation-id: d77cdbe8-5cf7-4133-acbf-08def2d857f2
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|22082099003|55112099003|18002099003|11063799006|38070700021|10067099003|56012099006;
x-microsoft-antispam-message-info: 
 7WfiGfEH5a+3+4Yh5dDUzcWAdO/34r2jpIdtA07tXYpB1QfE4J7BFeHAO1/eN6zXhDHShSKf+WLplOJdUZOYh8I4D8WTWj/erae3C3TddHWTeaHG4SS6JamA4dXI6USkX8L//jTWWUYKJbfvJChkW19V0pkHiCkqxSoaSNl3tqBVxEZ2/HPHsu3wEGNNTdHKQncZ2T3VyQvmf0VV2PYi2I0dozqgobt/PVn4iLHxjRJ96otTHsmrkwtRCZWJVrNLJvYtLtHrq4xIEgEnG7SUdHKfsjp7TExHTmC6FA5bUaA8abrVz/BdjtWZn7YnJH6Hfz8YL+XnzBbEAgE1OH2+craAwBhPjLw55PRiXseHURrscrAx8FFafP9jrIm5zxjRhmph7Pn5JjBKiBfr50N2OJlgjWrlogBlA4DwPiOTUHzO+Wv/LRU19sLTp4dk86w1Jy2BsfqsdE+dBI+A1bixH+Q1aUzcR7zaiVfkpXDW7xsHk50TK8MGRloPIC1mM2BVhWDix9JJ/J3az7ivZ5Bamb2+uov6KZkA9WDWouCEx7oVrSaxKfqv72Hbpyep425Hb2tJQlFiSVXGIySK79LYO5hDFvZD6UH1c6LrsWUfB04+oFvkv2/mpzQ5SCewOlCLXqWtRm3mHRImODb+X3TWIz/UogaWGMpIjZhEkL+/dnovJl+G5z5BzE2OFSOiSzoF6sgD4Qo8VoKYTFSjbzcFiotk/8AfoxjEXrCC1kc3tug=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(55112099003)(18002099003)(11063799006)(38070700021)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZHRBY2pPd20vVjRWQ0tsQ1g5L3l3Z2JjR3JwVnM1SmlqRGw2M2U2bXlQeFEr?=
 =?utf-8?B?d2doV3ZkajNUWDFFR0xsU0UzOTViUnNJVVhwdndRRk0zYjFialMxRFBLNjZm?=
 =?utf-8?B?bTNWZG1qRkpYV2FwNDIycmJYQWJ6ZHBuMVgvQ2JEOWkvaFN0S3RmOFJIRTFZ?=
 =?utf-8?B?b2FYRVdORlh1L0dmYy9La0czeHlBbElYaFZYQ2JJODRVdTI4Uk92TEZHRy9t?=
 =?utf-8?B?QTd1WDhYZi82WXRNMHhqYjBVT2JTSWpwbnhKUm1UcVRqcVQ0TFQ3dzlFa0lR?=
 =?utf-8?B?d280T1Y5ZUZSZ3hCVzRqanFEbkdpZG50SE1hdm52NVlXYjNad2ZKYnp5cmQ0?=
 =?utf-8?B?eEpMMjhBaFgzZG45UkpPdDMrb2dnRDFjU2NnczFFVTB6WUtnWUdGMGl6YVEv?=
 =?utf-8?B?Qkl4QTRVVWQrRHJ1RWJqUUt4Tmgxek4xeGlwd3E1MHUwdTB5R09mM3VoUEJF?=
 =?utf-8?B?cmhjdDZ4WTNGc0tjMUhyNy9ZV2Y0VG1zSFRZVVBacDRRcjdZb1JYK1Y2VjBs?=
 =?utf-8?B?dUJsVU1ySmtvaDhQcGFManhRNkpKVDg2RGhOZ2NORmtyUG9TT0NIWFZibXFz?=
 =?utf-8?B?amxuRjAxTmlHQzFhREZuQS9zRG5TaHlDZ0dVcHJzWDhrbEcwQzVoL0tPRHl5?=
 =?utf-8?B?M2MwZUNlNnBZRzU4bWdqRkxrcFpWeGhEOXV3U2xaaHRqTllFSFRvVW5DeGdz?=
 =?utf-8?B?UEFTNndkbGR6eTJjclFEcWh5R1NGRURIc0pWdlBUMkMwbUxNU1hyaC9OeGpH?=
 =?utf-8?B?OTlyMWRQUHFKMjZlalk1VjlkOStLUGdqQUtFaEJ4QlZjK3ZIbU9YRVpZd0R5?=
 =?utf-8?B?VVMxdC8xRHg3b1dveFVSckVXVENMMndOeUV0RlhVNnZRcWVNV0ttaExqM0tO?=
 =?utf-8?B?aXdpdm42SkJORVNINEZHMXRhTTMvaW1oNUNhaWFGb3dWVGcyRWFEZlUxMlhF?=
 =?utf-8?B?dHdqUGxhQzdLcFhNMjBuZkVtYjAzNE96UGswdHZScGtIVStLMW94WDF5Nm9D?=
 =?utf-8?B?MVVjUEY3djRablBlVGUrWldLK0FzYTZHK1A3SVY1RDAwRFBWMlRxeFViTUk4?=
 =?utf-8?B?R1BKRDc5bDhkUmVwR1J0Z0N4ei9qV0pZcGFIV3FWOWtyMFI1QWJNMlB1bUFs?=
 =?utf-8?B?SWcxQmNySVBzd0cxdC9uenpWTWlMUVM5S293VE9MZnB0Y3k1WEc4WUU4UEtx?=
 =?utf-8?B?SnoyelA2anRVWUZpZXlNc1VLTVYyaVhvZklLT203Yi9oYUpRZlhjeW1meHN5?=
 =?utf-8?B?c2dzYzk0SFA3ZFlWa2hXS0ZReVA3TkphM2JZcDVGVVVEb1pIUUR2WCthWFF3?=
 =?utf-8?B?dXQ3Mkl4RDYzUzErVUxDcEFaL2hnT0IxQnk0TjVBRTB0c2VjQkdIVlp1Qjg5?=
 =?utf-8?B?aXhrNS9QQitHYVM5R2lCWDMyR0Zqc3l0bHc4aUpXeWxMTCtRVURLRC9DY0Vo?=
 =?utf-8?B?Q0lSR1NIQUc0TDVLaDlzM0wwNVBGRkxJRTRHbWxveTIyK3d0cGJBR1JFTk9X?=
 =?utf-8?B?VGkwTDRmMzRNY21yYWh0dy9EdE9ITU1EUURtVkkrUFJQamhhWWpZUnp1T1Rj?=
 =?utf-8?B?KzdpcDZTRW13QmdHRGVqSDJFZ3RYcklIM1FpYzJlSTlkVlE0OGZRQlRUM09Z?=
 =?utf-8?B?QmNHa2xsTmdQcmVvUElMcTBxcTZVSkRJSDNFclQrNkY1RFhQNEJCZEpHNUJ3?=
 =?utf-8?B?d0tPVjlBU3VGdlNxUjRGOWpJeHNUUHNINnRjY2ZEL08rNHdveHRhejMrZmZE?=
 =?utf-8?B?MDhibEFBQkpkTVJsZ1ppZGJuN3BNY0Y3Zi9QU05VTzl0YklkZUVlU0wxUkVw?=
 =?utf-8?B?MzZ0YTBnVm1IbWEzSGI1anBBSWYrVVFtRUJDTFpweis3eTdnbEhjTzMrSTd2?=
 =?utf-8?B?dk1EYUYwc3U5Nm8wOHppK1MvQ2dJTkRYd3RrSDl2ZnozNjNvTUE0bTlUai9t?=
 =?utf-8?B?TFFRMHFOenBoUE0xb2srWGEwQ3ZKaFluNkNlTThjdzBkcWlnS0J1R2g5dFpF?=
 =?utf-8?B?TEtMSVZvQ3MwRUxHWkFIOHZ3djRyUmZKZnFEUlJYTGFPazJqWlNBTlFycTNr?=
 =?utf-8?B?K2N4TXlnRFliYU16ckJkbWxQbktqR3NVRzh3UDVRUVE2RWFXVzY4R0xueDdU?=
 =?utf-8?B?Z3ZRczZtSzlIY1lGMHRaUGNURjRFSk9OWkVTS2hGZ2VLVVVqbm1oRDVCbTNY?=
 =?utf-8?B?QWhBOHpsdjdUK1F3T2k5NmNNM0VnR085am5HYUVvbkkrRW9ScXJiaWJZVUVG?=
 =?utf-8?B?NDFLeFU1NmplWEZEcC9VeDBxUTJrQnVRaDhTTzFMczZLMTZaSnduK3IwVVk4?=
 =?utf-8?B?QVlRL1I4VXQyT0NsY1RwZ083ZytONU5TcmVqeC9WNHpzMy9tdGpxdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d77cdbe8-5cf7-4133-acbf-08def2d857f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 10:00:13.4958
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VIp9NoLMr0rCJGIUdvimC4RaEXtqSt8bahixWQtPJYpHfs85GnJ0rdYJRL20lhATsnI1emHDbvw5DCghel/RLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 10:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242850

SSBoYXZlIG5vdGljZWQgdGhhdCByaWdodCBhZnRlciBtZXJnaW5nIHRoaXMgY29tbWl0LCA5IGhp
c3RvcmljYWwgQ1ZFcyB3ZXJlIG5ld2x5IHJlcG9ydGVkIGluIFlvY3RvIG1hc3RlciBtZXRyaWNz
Lg0KKHdoaWNoIGlzIGhpZ2hlciBudW1iZXIgdGhhbiB3aGF0IHdhcyByZXNvbHZlZCBieSB0aGlz
IHVwZGF0ZSwgd2hpY2ggd2FzIDMgb3IgNCkuDQoNCkFsbCBhcmUgY2F1c2VkIGJ5ICJuby12ZXJz
aW9uLXJhbmdlcyI6DQoNCmdudXRscyBDVkUtMjAyMy0wMzYxDQpnbGliYyBDVkUtMjAxMS0wNTM2
IA0KZ2xpYmMgQ1ZFLTIwMjUtMDU3NyAod2FzICJGaXhlZCBmcm9tIHZlcnNpb24gPjIuNDAtMTcu
ZmM0MSIpDQpvdm1mIENWRS0yMDE3LTU3MzENCm92bWYgQ1ZFLTIwMTktMTQ1ODQNCnB1bHNlYXVk
aW8gQ1ZFLTIwMjAtMTU3MTANCnB1bHNlYXVkaW8gQ1ZFLTIwMjAtMTYxMjMNCm9wZW5zc2wgQ1ZF
LTIwMTUtMzIxNg0KcHBwIENWRS0yMDIwLTE1NzA0ICh3YXMgIkZpeGVkIGZyb20gdmVyc2lvbiAy
LjQuNy0yXFwrMnVidW50dTEuMyIpDQoNCkkgZ3Vlc3MgdGhlIHR3byBhYm92ZSB3aGljaCBJIGV4
dHJhIGNvbW1lbnRlZCBhcmUgc29tZXRoaW5nIHdoaWNoIGluIHRoZW9yeSBjb3VsZCBiZSBsb29r
ZWQgYXQgYW5kIGhhbmRsZWQgaW4gY29kZT8NClRoZSByZXN0IGFyZSB1bmZvcnR1bmF0ZWx5IGFs
bCBkYXRhIHNvdXJjZSBpc3N1ZXMuDQoNCkknbGwgc2VuZCBhbm5vdGF0aW9ucyBmb3IgYWxsIGFu
eXdheS4uLg0KDQpQZXRlcg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IEJlbmphbWluIFJvYmluIChTY2huZWlkZXIgRWxlY3RyaWMpIDxiZW5qYW1pbi5yb2JpbkBib290
bGluLmNvbT4NCj4gU2VudDogTW9uZGF5LCBBdWd1c3QgMywgMjAyNiAxMToyNiBBTQ0KPiBUbzog
b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBDYzogcm9zcy5idXJ0
b25AYXJtLmNvbTsgTWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpDQo+IDxQZXRlci5NYXJr
b0BzaWVtZW5zLmNvbT47IG9saXZpZXIuYmVuamFtaW5AYm9vdGxpbi5jb207IG1hdGhpZXUuZHVi
b2lzLQ0KPiBicmlhbmRAYm9vdGxpbi5jb207IHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb207
IHBhc2NhbC5lYmVyaGFyZEBzZS5jb207DQo+IHdhaGlkLmVzc2lkQHNlLmNvbTsgQmVuamFtaW4g
Um9iaW4gKFNjaG5laWRlciBFbGVjdHJpYykNCj4gPGJlbmphbWluLnJvYmluQGJvb3RsaW4uY29t
Pg0KPiBTdWJqZWN0OiBbUEFUQ0ggMC8zXSBzYm9tLWN2ZS1jaGVjazogVXBkYXRlIHRvIHZlcnNp
b24gMS4zLjMgYW5kIHVwZGF0ZSBDVkUNCj4gZGF0YWJhc2VzDQo+IA0KPiBUaGlzIHNlcmllcyB1
cGRhdGUgc2JvbS1jdmUtY2hlY2sgdG8gdGhlIGxhdGVzdCByZWxlYXNlLg0KPiBUaGlzIHJlbGVh
c2Ugb2Ygc2JvbS1jdmUtY2hlY2sgYWRkcmVzc2VzIHZhcmlvdXMgZml4ZXMgYW5kIGltcHJvdmVt
ZW50cw0KPiBhcyBkZXRhaWxlZCBpbiB0aGUgY2hhbmdlbG9nIFsxXQ0KPiANCj4gVGhpcyBzZXJp
ZXMgYWxzbyB1cGRhdGVzIHRoZSBzYm9tLWN2ZS1jaGVjay11cGRhdGUtKiByZWNpcGVzIHRvIGZl
dGNoDQo+IGEgbW9yZSByZWNlbnQgdmVyc2lvbiBvZiB0aGUgQ1ZFIGRhdGFiYXNlcy4NCj4gDQo+
IFsxXSBodHRwczovL2dpdGh1Yi5jb20vYm9vdGxpbi9zYm9tLWN2ZS1jaGVjay9ibG9iL21haW4v
Q0hBTkdFTE9HLm1kI3YxMzMNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEJlbmphbWluIFJvYmluIChT
Y2huZWlkZXIgRWxlY3RyaWMpDQo+IDxiZW5qYW1pbi5yb2JpbkBib290bGluLmNvbT4NCj4gLS0t
DQo+IEJlbmphbWluIFJvYmluIChTY2huZWlkZXIgRWxlY3RyaWMpICgzKToNCj4gICAgICAgcHl0
aG9uMy1zYm9tLWN2ZS1jaGVjazogdXBkYXRlIHRvIHZlcnNpb24gMS4zLjMNCj4gICAgICAgc2Jv
bS1jdmUtY2hlY2stdXBkYXRlLWN2ZWxpc3QtbmF0aXZlOiB1cGRhdGUgdG8gdmVyc2lvbiAyMDI2
LTA4LTAzDQo+ICAgICAgIHNib20tY3ZlLWNoZWNrLXVwZGF0ZS1udmQtbmF0aXZlOiB1cGRhdGUg
dG8gdmVyc2lvbiAyMDI2LjA4LjAzLTAwMDAxMQ0KPiANCj4gIC4uLntweXRob24zLXNib20tY3Zl
LWNoZWNrXzEuMy4yLmJiID0+IHB5dGhvbjMtc2JvbS1jdmUtY2hlY2tfMS4zLjMuYmJ9IHwgMg0K
PiArLQ0KPiAgLi4uMjAyNi0wNy0yMy5iYiA9PiBzYm9tLWN2ZS1jaGVjay11cGRhdGUtY3ZlbGlz
dC1uYXRpdmVfMjAyNi0wOC0wMy5iYn0gfCAyICstDQo+ICAuLi4tMDAwMDA3LmJiID0+IHNib20t
Y3ZlLWNoZWNrLXVwZGF0ZS1udmQtbmF0aXZlXzIwMjYuMDguMDMtMDAwMDExLmJifSB8IDINCj4g
Ky0NCj4gIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0K
PiAtLS0NCj4gYmFzZS1jb21taXQ6IDZhOTE0OTRmMjlhMWY5ZGEyODI4MGJjOTM3NzE3MTRjNDU0
NWRhNDYNCj4gY2hhbmdlLWlkOiAyMDI2MDgwMy11cGRhdGUtc2JvbS1jdmUtY2hlY2stMS0zLTMt
ZDkzNDdmYjU2YWU2DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IC0tDQo+IEJlbmphbWluIFJvYmlu
IChTY2huZWlkZXIgRWxlY3RyaWMpIDxiZW5qYW1pbi5yb2JpbkBib290bGluLmNvbT4NCg0K

