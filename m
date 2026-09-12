Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D4C4C88E53
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 14:38:03 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7883.1789223881170796934
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2026 07:38:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ZgfXl7sn;
 spf=pass (domain: siemens.com, ip: 52.101.72.44, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wWbNF76kricsZoCXmLsV/WE13c6iF8fPUcc1uiVfKJ7xcY4ioCLkn78NabpKsQ3X0rOdsY7/zyjDvt+2nZqHUCM1BDDu9Vmq3yuxxDA4uQowcbGaCcg9LOR2TGooOkW46rhpQaGbbZNpeSGW9xh9UKVm+zbz0yJQb0656vRAr+08C22UV6BcdiuqY5tQ9YBl3mwz7ktimTx3HqZHVomFXcyVcXefiDhk0yGwR9t0LyhgI3jLfJC/FUQtjjeuQY2Sua2O04ZeVw9rUC70hdGmLQdrY/KfQBXjvvMdZc7nTKITnnmv28ljlPYj/pb/sLGU5ulqTeLBDCVJWyLYALGprQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddzGUVm2b9/OVqVOSDcaBt6Irh27byVFmU36SzRMH4E=;
 b=R7QMKQobGwveVz6WUZlXt3j122d5uQsUlhcmxnYApnU27FYlSVZGI+dVloPB0a/XpNjj+iVExQzVNa9wxFog6gAuKbRKzUx2+lcuFzcsQKhLdB9A0XyG/kqfaRwV/s/78kR9f2RXKzZ+1N8Wi5EzLQCn0+jZd+7arremFROXjxQd+eHaSd80FtPhis4UlUiYdKXkEXkILB4fjJepQI2QDwb2jg7YJuEdhW5Y+4wGMo91iymLdmwyNKg6fIM3Q7moUtnauR9kk6HNfFnzrRkOp+LRZy14uY5IZZAS0TBc/bZXMKeG6FdnrSwIwXv1/wzxDd4AXcb+Kyfh98jSH0u/Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddzGUVm2b9/OVqVOSDcaBt6Irh27byVFmU36SzRMH4E=;
 b=ZgfXl7snh3Esm410XCg31WZu2srySjgWVjnjLYsbTn2USmviZNrM+yVXwA51tX0llKRkE5EV9XmnKVkdSVG+zbOOEPvGChnz5Ur9shYrAaJUmjt3QVk1mPp76HJUox8pQEHZSvGfpyN23Ye+pZQXqevb2yrqGkLejG/fxk/4/58iPQGAWM+S1e/h6o02LJVY6tT9VH4PqHIytM4CK2VxlbaVGVVutyKbf2EKEUxfT+9qeHmaIc9ienY53gKbYWTViVJTvk9urk0w+a7xIYXbmdJKquZGBNK+fM7lYqDN/EVNUuAK8EQX44D3yZPX7GIwqwsheIIMBqtNyUn6FViQuQ==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by PA1PR10MB8972.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:448::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Sat, 12 Sep
 2026 14:37:56 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 14:37:56 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "hthakar@cisco.com"
	<hthakar@cisco.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external@cisco.com" <xe-linux-external@cisco.com>
Subject: RE: [OE-core][scarthgap][PATCH] python3-ply: set status for
 CVE-2025-56005
Thread-Topic: [OE-core][scarthgap][PATCH] python3-ply: set status for
 CVE-2025-56005
Thread-Index: AQHdO2PKgRG1+z1+O0ijXlri31Xo5LbJIgMAgAHvGNA=
Date: Sat, 12 Sep 2026 14:37:56 +0000
Message-ID: 
 <AS8PR10MB507315C1FA2936B1B4EF91D8FDBD2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20260903051903.3667481-1-hthakar@cisco.com>
 <DLCD6S1OFYVG.1UJ6XDWKX8OJ6@smile.fr>
In-Reply-To: <DLCD6S1OFYVG.1UJ6XDWKX8OJ6@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=43a38481-ed9a-4690-a530-d5f76f15fa17;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-09-12T14:35:23Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|PA1PR10MB8972:EE_
x-ms-office365-filtering-correlation-id: 58914104-e876-4d10-0555-08df10db6f71
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|4143699003|6133799003|22082099003|18002099003|55112099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info: 
 ABRvNRJFs6W7W1/9/Qt7wGwPtBxNCHnRydaX18iTbhE/y4mN/1hwm5PmbM+Xp2chVSDWOYt299Pl2827FInEAb5ceFCxcJu/8mQjua4puSUdRg9TvN+KEI0fhWqB1PNxaW93cOwFFOBWi3QBSNxQQK3on9rOqlV+2W89tdNww+4O0+9TV7c2XnOSSoLEwh99ej8PQzxh2yGFCVS/K/qfjjp0v5F37Ku95K677LlO3EXc4rnz3kE8/7q4isOwnCSvZ0CWLafTBSAZx3MLW5APqyuKN7eR7cETl34EufQEnjWqsJn8hBZzuVF/kp5nwhYL6wQ1KlcsXBeo1kFrFR21pbbCZ4YsCbeg6SvHvJeWjoazyj11R7VFDzUOXr14JmB1bpxAA7IcXXWBAaDl6FOW2GVUG0eqyfpMPUfvSs9/zoVmtJGrf4LsZmqSEYiaxy+j6CT7cD4r7KkX20Z+T/Ncb3rVG4rWw4BMAPqDVAek6uL+l6Z0M31OapU9xUsgNZOg809/JwcCnpvYoV0TGl/SCTDqXGrwZduvfqpmY9al3oaKexOIOO5W0dlNI2X3yk4pqB2BIfaLfuuc6Fl2KFKIy2F93RWLRCCytyDy2yYBFe0wDq4Q5WHYDH9mg54EcAnKUaqR/N5IK/1yKT0KEQQB6cOcUR10qgo+2gAtTxe8QVqNbQGRpMv9dFGp/SI3K2Oylfiijf6QrFzzFYKP71WaX7L1ER3IhrYfrWjotIBr3Zc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(4143699003)(6133799003)(22082099003)(18002099003)(55112099003)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?K2p3MDNwazV3R1J4UFZIOGNhYm5jWU5VZFlmV2NCZS9tUHQ5ck41Y1ZxbCtJ?=
 =?utf-8?B?YWhJUzdqbXpXZkViMG5xbWVvRzN6U05QRXBrM1JrUnRVWHhSekw0bzZEM1dS?=
 =?utf-8?B?dU5CM2ZHbVJBYjNXNmNReWpReHNkNkdSZkJGZ1FkOTBFbGRqN2ZzVU9nbkZu?=
 =?utf-8?B?c0c3R3hMNkVKMDd2Q2RzZDNiUjhROHNucFpPbFkzbjhRWHZxMFVTOFozM0Y1?=
 =?utf-8?B?c2MzR3JCZDlLWUZpZXVsWXlnbnVWWkdGV01PdjI2cVlSUU55L3pCZkRqemRx?=
 =?utf-8?B?emt0ZTNTR2ZuZjdaZHJGejhSQ2M0di90d09qQ0pzbU52b1cxTVpIejNhdmM4?=
 =?utf-8?B?bXZMUnpjaWRFVDh4WU1rdytibEhHT2tNZW9BcEE3MTZ3OGdoTnRkVXR2RFZx?=
 =?utf-8?B?QndwY2NyRHdqK2kyR3drVjF2Q0JRRjUxL3hxMVdzOHA5cHo3ZXlnTksxQVJu?=
 =?utf-8?B?WVY3bFlHVnlvTUlRVjJJUy9FdUlzUnZUTTRIQ1U0d2Jjck1FSzdzSW5MTWdB?=
 =?utf-8?B?cW5SU2hUdWs3dis3QWIrMmloeXJUODVhN1d0b1UvWU56SnVRWHR4MUtiREhQ?=
 =?utf-8?B?RnAyam83QWQyUHg3RkFoV3ZkdjRERmFERnZhNVNTSWZZWWIzeXZFTy9Ic04r?=
 =?utf-8?B?R3FsY0NlNkUvRmJJWmxmdnk0ZnpnNVNaNFpwYzZieVZzcEFodFFyaU1zcUk5?=
 =?utf-8?B?NEQrOXRmYVoyZk9oSUZSY2UzNXJXbzQ0UlB1YlkyTm5oM2JNaG5ySDI3UW8y?=
 =?utf-8?B?cnpCTkloR0F2SytYb1NzMDlsK3lBeTdXNUZKRHc3N1JDc1EvOHJzdng4TVBu?=
 =?utf-8?B?QTNwcmEvL2R3c0pJaEJJZkxVcUoyUGxQRWpZa05Obkp6QUVRZ3BwdnFBV3pE?=
 =?utf-8?B?cUF0bStuL3FQaHNsTEFWODlUY3BKUkYzOVpOOGh2c0M5MlRHd2dnRFU3bWVi?=
 =?utf-8?B?NHlhQS9SRWlzSG9iOFljMDVnSFllc0dpMHBaWkI3RHNhK1R0czdYNzhvSk9v?=
 =?utf-8?B?Q3RRY2p6TnF2SjVTcWZsVUkxZkhwcjloQVA2bWJLbHhXM1NLN3Rta2NlQ3ZV?=
 =?utf-8?B?Vi9nWThwVWROWHNyLzVzSmhFWllVMWFtNWh4cU5GckxsWE5LOTgzUU1kalNV?=
 =?utf-8?B?a2IyU25McDBoNjBrcWZab2NlVC81Nm4xUjhzT21JWHZ0Z1RYN2llK3hwdC9F?=
 =?utf-8?B?NnlKdGdPb0VCcjFFLzFVcTVZZHhEMDhxVUZzWFdJUFk0elAvMmZSVXlPczdV?=
 =?utf-8?B?U1o0OGhPdFg5Q0xjRE9BOVpXNm5KdHFMZHMwejV2NnF0Yk1ucnB3NVdxZnR5?=
 =?utf-8?B?VU5EZ3p4Q3BWbkV4QzFiSEUyQkxMc1FZR3FTNzlTNmdaOGVBaDYzS0U3ZUMy?=
 =?utf-8?B?MkxQRjBxSmJaOHRzRmxHVm5wSUdKeUJscVZ2ZkZxdys1K0x2VmxGYWE1ZEx2?=
 =?utf-8?B?bUpSYzB0YVE2c3BFblRONmErd2RjMmVhQ3daWURMWWEzN3ZIS0VxaWwyVXFZ?=
 =?utf-8?B?elVVdGRaWEp5RjJCOXlnYjBaT2JpcUJtb2VyUGs2TUhGQnRJbFp3K0JYL3dW?=
 =?utf-8?B?b1JoVkVKR21QZ2FsQm9wdkVFREZOVmpDUTY2MlBKaXNEallOUWprMDRIVHJY?=
 =?utf-8?B?NWl1ckNlZWVDYzI5emp2cmZHcXY1a05EdzJWUUlJKzMzUEc2S1QvMXBXbktw?=
 =?utf-8?B?bkdvQ3lkZ0E5NFdja0NOM0U5VGl4U3Y5eHBjN2NSanQyNll6T3VBNUNwVEJv?=
 =?utf-8?B?NWM4TXhldmlpYVcxUm1FUnZua0Nab0FISklXRU9FMlcxUllzOXFFTnhZSzlp?=
 =?utf-8?B?WXBDSzB4OFpVNzhYeGR1ckRVWnF3OHFzUkpBcEtwWFQ2elV6UVBmZmh5WVBN?=
 =?utf-8?B?dXVOYzVldUZ2ZjFiQkx4eXVBWllpWkRGd09Jemt4bkk3SXVvY3UrYUhBMkNy?=
 =?utf-8?B?THpiWklnVFZoK01qVVpzc0JTbFpVSjZuM2t0ajd2Y2pwM2VGbXh5aVJFWS9w?=
 =?utf-8?B?aGVIM3BsYU9GQlV0SEt6dGgrOGR6aGtRNGh1OTRRREYrL3lGSUdKMytiSGdD?=
 =?utf-8?B?TXF5dURyY0ZQd1pnWVRYU2xWdDJiYU5TM204VmdwajFOaS9GVXpJOWQzclFh?=
 =?utf-8?B?bm84K08vejRReUV3MGd3Zk9IcjBwRWptK3hHSGJwMlFTazIybDJMRVdvZFo2?=
 =?utf-8?B?dFRXWkpJU2FTVkRjejdmRi82OFZYczlxVnpUOVdhNFhGamhkK1ExMUhzemdv?=
 =?utf-8?B?QWJvQjNiSWZtMXZUa3FnQUFKd1hZcXE4N25QaVFwZzVmcHNzNFpsZUFCMnFJ?=
 =?utf-8?B?YkxUOWhLdGk2MHBqQlhXZlJUM3o1TGZXSStYU1JpUERnemFnSml3dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 58914104-e876-4d10-0555-08df10db6f71
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2026 14:37:56.3385
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pxglJ//rXmeJeZh99er8h3cUFuI5Z2T3seeBduFwgVWETauSQfI7ad5AvHuNpuMEGy3Zht2xC5BgBTllIriUBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8972
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 14:38:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245703

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBZb2FubiBDb25nYWwgdmlhDQo+IGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gU2VudDogRnJpZGF5LCBTZXB0ZW1iZXIgMTEsIDIwMjYgMTE6MDMg
QU0NCj4gVG86IGh0aGFrYXJAY2lzY28uY29tOyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IENjOiB4ZS1saW51eC1leHRlcm5hbEBjaXNjby5jb20NCj4gU3ViamVj
dDogUmU6IFtPRS1jb3JlXVtzY2FydGhnYXBdW1BBVENIXSBweXRob24zLXBseTogc2V0IHN0YXR1
cyBmb3IgQ1ZFLTIwMjUtDQo+IDU2MDA1DQo+IA0KPiBPbiBUaHUgU2VwIDMsIDIwMjYgYXQgNzox
OSBBTSBDRVNULCBIZXR2aSBUaGFrYXIgLVggKGh0aGFrYXIgLSBFIElORk9DSElQUw0KPiBQUklW
QVRFIExJTUlURUQgYXQgQ2lzY28pIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0K
PiA+IEZyb206IEhldHZpIFRoYWthciA8aHRoYWthckBjaXNjby5jb20+DQo+ID4NCj4gPiBQTFkg
My4xMSBjb250YWlucyB0aGUgcGlja2xlZmlsZSBwYXJhbWV0ZXIgZGVzY3JpYmVkIGJ5DQo+ID4g
Q1ZFLTIwMjUtNTYwMDUsIGJ1dCBleHBsb2l0YXRpb24gcmVxdWlyZXMgYW4gYXBwbGljYXRpb24g
dG8NCj4gPiBleHBsaWNpdGx5IHBhc3MgYW4gYXR0YWNrZXItY29udHJvbGxlZCBwaWNrbGUgZmls
ZSB0byB5YWNjKCkuDQo+ID4NCj4gPiBObyBPRS1Db3JlIGNvbnN1bWVyIHVzZXMgdGhpcyBwYXJh
bWV0ZXIuIFVidW50dSBpZ25vcmVzIHRoZSBpc3N1ZSBmb3INCj4gPiB0aGUgc2FtZSByZWFzb24g
WzFdLCBhbmQgTlZEIHJlY29yZHMgdGhlIENWRSBhcyBkaXNwdXRlZCBbMl0uDQo+ID4NCj4gPiBb
MV0gaHR0cHM6Ly91YnVudHUuY29tL3NlY3VyaXR5L0NWRS0yMDI1LTU2MDA1DQo+ID4gWzJdIGh0
dHBzOi8vbnZkLm5pc3QuZ292L3Z1bG4vZGV0YWlsL0NWRS0yMDI1LTU2MDA1DQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBIZXR2aSBUaGFrYXIgPGh0aGFrYXJAY2lzY28uY29tPg0KPiA+IC0tLQ0K
PiA+ICBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGx5XzMuMTEuYmIgfCAx
ICsNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBseV8zLjExLmJiIGIv
bWV0YS9yZWNpcGVzLQ0KPiBkZXZ0b29scy9weXRob24vcHl0aG9uMy1wbHlfMy4xMS5iYg0KPiA+
IGluZGV4IDA4NTVjODcxY2YuLjViZWQ5NzcxNTggMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBseV8zLjExLmJiDQo+ID4gKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBseV8zLjExLmJiDQo+ID4gQEAgLTE2LDUg
KzE2LDYgQEAgUkRFUEVORFM6JHtQTn06Y2xhc3MtdGFyZ2V0ICs9ICJcDQo+ID4gICINCj4gPg0K
PiA+ICBDVkVfUFJPRFVDVCA9ICJkYWJlYXo6cGx5Ig0KPiA+ICtDVkVfU1RBVFVTW0NWRS0yMDI1
LTU2MDA1XSA9ICJkaXNwdXRlZDogRXhwbG9pdGF0aW9uIHJlcXVpcmVzIGFwcGxpY2F0aW9uLQ0K
PiBzcGVjaWZpYyB1c2Ugb2YgUExZJ3MgcGlja2xlZmlsZSBwYXJhbWV0ZXIgd2l0aCBhdHRhY2tl
ci1jb250cm9sbGVkIHBpY2tsZSBkYXRhIg0KPiA+DQo+ID4gIEJCQ0xBU1NFWFRFTkQgPSAibmF0
aXZlIG5hdGl2ZXNkayINCj4gDQo+IEhlbGxvLA0KPiANCj4gQXMgZmFzIGFzIEkgY2FuIHRlbGws
IHRoaXMgcGF0Y2ggaXMgYWxzbyBuZWVkZWQgb24gd3J5bm9zZS4NCj4gSSBjYW4ndCBtZXJnZSBo
ZXJlIHVudGlsIHRoaXMgaXMgZml4ZWQgdGhlcmUuDQo+IA0KPiBDYW4geW91IHNlbmQgYSBwYXRj
aCB0byBmaXggdGhpcyBvbiB0aGlzIGJyYW5jaCBhbmQgdGhlbiwgcGluZyBiYWNrDQo+IGhlcmU/
DQoNCkhlbGxvIFlvYW5uLA0KDQpJbiB3cnlub3NlIHRoaXMgd2lsbCBiZSBmaXhlZCBieSB1cGRh
dGUgb2Ygc2JvbS1jdmUtY2hlY2sgdG9vbGluZy4NCg0KUGV0ZXINCg0KPiANCj4gVGhhbmtzIQ0K
PiAtLQ0KPiBZb2FubiBDb25nYWwNCj4gU21pbGUgRUNTDQoNCg==

