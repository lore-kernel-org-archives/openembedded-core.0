Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B11F8C88E59
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 16:13:13 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9712.1789229583478427468
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2026 09:13:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=QnqL12G7;
 spf=pass (domain: siemens.com, ip: 52.101.70.3, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iOGRThCrHAY6FQMdi8a5kCp0n7lOTL7OXhrQoQDp7iun9abxM+IKNkFLbdP6O8g4ZO6/QiWdpTk9q7M+VdR0cHmy/ofM/vKnIkuZDKm8598agDF1r1HVpXp+lz0PLby70iumrYrwNKJrQVnR8+IYooeySP3vkFwOilSPAPAw7EI1LVQ6g/tHjxcAKbUvsOsgTsQxFPj8TQeU/pXegv6EwAVxVdzQQEsMNLBILsAJnRyZ4l4X82B+X+y3Wg9RAfw/vyZbZEyr5mnQwjBC3I5Fph/53jTcqT02X4pD6s0Iohy7uZsigxflv+wGTHZZ/txndrqiefoDVx79dSTkYViJoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEouTa+IMJPnHIoGydi6gjX9/dHauAfUit605SOGlEo=;
 b=UNLSlvtl4avHpdwLEkuzqiAeGjAul34ChlY3IkFa8YBis8ZQIMzrdXtV8qzqIDMNtFq2/IoVkFDROwzq4YyimThja4v0g9RzxqtxKj49A6RS/GnBcd7YajR0uU40vQQqepj28epNkClWcgtExbMfkpTuErJbaYTWnq1SOqzEMchAWC8xrsjjcO80fyx5eE/goiosq6hvm/w9TcnYkxOsgXNJ0P1VUmY/TRP1S2PyoKFjCLW3Xx0vBmplo1mGyLRGvzyDLVMw84lu+AR59gFEJAMg6lNUmu/1ZhLX2yyay+co1jmT7rcbuy6zHmPiFeeFwRivNJFMrSAWpejxmxwApw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEouTa+IMJPnHIoGydi6gjX9/dHauAfUit605SOGlEo=;
 b=QnqL12G7K05NiJJcys8TgJgSqoy4qAIhYIpDupbkGDXgTKkwynIFNo9T+p8WwdXqDY3ZsJhGnnZxq9zWXE6INzVznXdD/PdDStJyI0Kb34w7yQigz2xxJI/gTVkysp6jXujvh1/ip2gMoiq4M0h3fhlvHWdQ+v+6XCeu54/yMtZto8BJYmcJO+ejpmqJS8wcXVkc+UZtoSYPgvUoNqJSmpgBGLlJh/F6WbYR2avSOGwaPsEtckCgdaV86uJukBUxLb5uK6rXt3xYN8+7jZ/rRd8H1PwXcDQyxx82RavQ9F0ckVAAIHVadFoxQ46cEb9X/bAZWr82EYDHOgb9YnFTMA==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by PAWPR10MB6903.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:33f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Sat, 12 Sep
 2026 16:12:58 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 16:12:58 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "yoann.congal@smile.fr" <yoann.congal@smile.fr>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>
Subject: RE: [OE-core] [wrynose][PATCH 1/3] libslirp: fix upstream version
 check
Thread-Topic: [OE-core] [wrynose][PATCH 1/3] libslirp: fix upstream version
 check
Thread-Index: AQHdMxgphTQnafNC1kSKGPTW7KZ6Zra9ZDAAgAEKTYCADM2TsA==
Date: Sat, 12 Sep 2026 16:12:58 +0000
Message-ID: 
 <AS8PR10MB507373EE139A44A2BC291050FDBD2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20260823155741.2091982-1-peter.marko@siemens.com>
 <DL5Z475KF36A.2GWHJC82115IA@smile.fr>
 <CANNYZj8F6OBVu=cnCnEbAnCGVNBrex9uaTvkqtzwCFg=nKaByg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8F6OBVu=cnCnEbAnCGVNBrex9uaTvkqtzwCFg=nKaByg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=a50cb722-5980-4793-8030-fdbe418aafb4;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-09-12T16:09:44Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|PAWPR10MB6903:EE_
x-ms-office365-filtering-correlation-id: 5c8bdb15-c440-44fe-8c42-08df10e8b62e
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|55112099003|22082099003|18002099003|38070700021|4143699003|10067099003|56012099006|11063799006;
x-microsoft-antispam-message-info: 
 1Wk+BzK7Xk6SJjD+qoQ7SeC3eSVvTah4UMvUVhbeqdw1ZZVUraqJ7XFBO4UXCl7cqQD9vLJiF1UUV7WQLlyytpz35LJz6FS10GmdLxIuVQ07sgnT4kJ+XXNDbLjTSY2K/fIf0p0gllrgMnsbtDGrBfXvPFc0fiaMItathTTYcJCB5BUcC1ZBQZElkSmoF4AeUnMmSTxETdtH47tpi/HC+HttpcckLHO/NTxM6wZbrx+U1hNABFUyccmJSg2LYje9DvyUa2VNytJ6gPTSuQTHyv+lNzcAJcZIYoipodx0pVnGo3Ehd75gaXr25unHg+GP3WVH5JBXuNuX59TXN4ywOe1SK8wn4gOGySvXRQ/+7aYHqyQ5QxP9q43aQjAJkKYuQUzm7tfo5lk2VBneNmhuvZCgmg2XQH3KaFFMBOegCVd7OKB6aT5C8LIVT+LkYIgHV+WqqcK5v8MrHsSGp21DKbnK4nYpp8lUwUbNxGI1vvg+ot6fuUepP1ctmrkv24eyv0H/DyT1ehi+pxSgxMBR42jnyTd2sDQjUyCeFEu0c+4IpIgp6OHn4wz2xBlFMhjcWcGbW/RmqT0nqJRNgGHSLyyKUQwAKsAmXghqYBChATu5dj1lGAMfIq/gr73pt7MEk/KHYKwC8JtX9qJ9waystbbk/VNPEoUs9VKANAVziAzclHeMX9selF5tIHrwZMkY7H6tSb+PJ4O2AQhxVqq2scXGlAVxQ2+cJgunZKLMP4c=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(55112099003)(22082099003)(18002099003)(38070700021)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?emJvT3pnVDBSNVdzN1ozSW11VUFFdTlLUEpicm9WdENJaUV4MTBzS2JaV2FT?=
 =?utf-8?B?b1FjemF4eDEyZDM3WGlnRUdFZ0VwSllyQjJmcWkyMms3WDhUSU1GUU1LelVu?=
 =?utf-8?B?djFhNXBBSkFtSFMxQkR6Tk5hUHllZWVtZHpCUmVKUDEyckNUN3kzdXJPMjhZ?=
 =?utf-8?B?aXZOekJxbmZOeVZhN3dHVUx0NkVJMjM1WnlWdEUyNy9zZmY1VCtNWnNzY1ND?=
 =?utf-8?B?c2hBeVZJc29rNGY3d1NadEhuY1pvTXNPUmZ3bGZjdCtvTzFtenU0cWN1L0J1?=
 =?utf-8?B?Zld2VDhwZ3h5MmRmQXRZSzgwWkNsbm1NUGpQZWs1cUJUdVNnOFg0QnYxdmlV?=
 =?utf-8?B?RXRCUDVNN3JaNVVuQ0UzZGJjSWQwR09PckV5eUdOTEE5OVFMTHZCMmxCR3hB?=
 =?utf-8?B?a3VPY0xJUkdNTkM4bDdhaWM5cjRsT2hNVW0yTmE4Q05PTGN0WURCWXBqU3BX?=
 =?utf-8?B?R0RqWUZhUjlMK2VIYVlUM3dZU2pvMGRTR205clM1cjJrTFRpbVl1TmpYU0Vv?=
 =?utf-8?B?T0F5Znl4REJuc0xwd1QwN0Fzc1NsNDdNa1JTZlR0cHUvWGZjbkF5YUFlZWx6?=
 =?utf-8?B?WUpINC80M3k3RGJYb0kreDFwV2lqSCs2cmJzQTlLdTVFYUdyS3Q5aVBQYlVQ?=
 =?utf-8?B?eTFiblZ4aDA5Rm12dk5UM0ZvTDlUWlpZRUcvRkNzNDRQUVRMamZhbnd3TytJ?=
 =?utf-8?B?R3A4NjlPd1hMTE1IRTZ1MzZhNGlxc20yeFM4S0I1cVUxS1l1WWV0OXg2VUNR?=
 =?utf-8?B?bk9EMWdOSVE1dFRaZnYyeWJQb0k3cnJxcUJBNVJNUS9xcXV0WHdHSXV4YUFZ?=
 =?utf-8?B?OHJOdUQzTEJyZ1FzeXdZYnd4NzhLd0dxUHRYWDJEMmZqV0RGbWZBbjZOZGk0?=
 =?utf-8?B?dGlzV0NFdW9GSERSQUN5Yk9rNUNzYW9pTUcxLzQyWEZ5Ry84YWxGS2QrVks3?=
 =?utf-8?B?bW9hMFhkRUNLZEdBMFpHaDZkN2pIczJtajRqeEZQUmFWZHJERHkzYW81b05k?=
 =?utf-8?B?NFBsdFVtM3lIWmx6cjEvUzZZeU5pM0VqRDJHRlFQMzBsUVU3Z21nYmJ5eVlG?=
 =?utf-8?B?N2wxVmo2WmNGbHpubjFaMzliZ3Uvc0JyRlRPdFA4eEtrL3RNUTZRclRjMWRV?=
 =?utf-8?B?MHlQeEZRUnBnajRpZFZORFJnem5zY1U2WDIyMFFhcmQyaW1JRk9UcW9RdFQ2?=
 =?utf-8?B?eFBueFlWVmdBdW9qdnVSWVJzNXROTkNIYmc0S1oraDNJOWVUS2V3S0xiRVor?=
 =?utf-8?B?Z3ROWndiR2szSER1T3Fwb3BudmJYMlU3WGMxczJudkZrK2pqZ25zc2tWaWNP?=
 =?utf-8?B?TlpDYjJ4KzNmQmhTWVltWnczWE5FeTY0YWJBZ0hHbEpJM1NWaEYwN0JYMnFr?=
 =?utf-8?B?VlVSWXhnTUtjMlZXMnRCSWgvbVkweXk5L0h2T296MmxVVnpRVXJFckUvREo2?=
 =?utf-8?B?d2FLUlF4bHloSkxmSjQ3ZmZxVWlSeTB0Y3dUVllvVEtyaEVUVHFaYmtrSld3?=
 =?utf-8?B?LzdWRlI2UXlndVA0WFQ2d043MWJHdXJ4Y0NZUHlpRU9MUkYyNXUzSkRSd3Nr?=
 =?utf-8?B?djZtclF6VjFyZE9RaUF4VnFaUzEwRUdsNXpFZnlEeVZjRW5XRXNKVER5NGFj?=
 =?utf-8?B?bHRPSmpxL3puOXhWQkVFSk1kbTR3QkFxb0NHd2hkSldUcVUxWkk3V1V0RHVS?=
 =?utf-8?B?ZThGai9Hb25DOHFTTkEyWFFndXJId1FuaWlQMWZYQnAyb1JoTXhrT0ZTUmZ5?=
 =?utf-8?B?VXpjTU43MzMxZXVTT2lManU1Q2MyVTF4dENhN3hMVGwxcDFjekZFQ3VFdXdt?=
 =?utf-8?B?cDVtYTRzd000MjBYeUpaWkNHc3J3alJrZXgwYzFLY09Lc2VkK0NDRllaWVlB?=
 =?utf-8?B?Z0pNbVVHYzJQRy9rWnNqZHA2ZDlmOUFycHBOdjNvdEcwckJZaDBnNktZeDBX?=
 =?utf-8?B?a2hiYURSaElxU25EUDZNSHJCTjFJeEhhVVowb08rRzFVYloyTVhsakhTUlFt?=
 =?utf-8?B?RnIzMjBlWXUrR2JDK3V0ZzVmSEg2M3IvOTF1VnEyNDU4ODZtdS94bEpKcDQ4?=
 =?utf-8?B?ZEhSQTBhM3N5QzFrSlo1cWRweWhtNHlkSVpkWEhpT05NbnVYczlnb3JUcFpl?=
 =?utf-8?B?c3ZvcXh5N1J6TXR0cHZKcFVLVDlZNitPUGtIQ25XT3JpUktCaGpqK1gwMlRr?=
 =?utf-8?B?bU9qWHFmU013WUQ5WWhQN2h5T1Y5QWhzcSsxN0FmQThIKzI1czlLbTVoRTY0?=
 =?utf-8?B?cVZNcnhoc1NjbUpnYnBPYlRwOS9sVjVxTmlLd0Ixamd3MVdqVjlObEJTenVB?=
 =?utf-8?B?a20vbk5YZ2RHeStWbk9DRWp4WGxzUENweEJjeVhjdG9INFhheXZBdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c8bdb15-c440-44fe-8c42-08df10e8b62e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2026 16:12:58.4568
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gxG6xqiqISrh1YWk+qakUQuC1aVFQ9t1KtW2OH5wbuLay1kT8kqryTKUZ+x75DxDklWfuVVMxF5zystmN3m5Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB6903
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 16:13:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245705

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleGFuZGVyIEthbmF2
aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDQs
IDIwMjYgMjozOSBQTQ0KPiBUbzogeW9hbm4uY29uZ2FsQHNtaWxlLmZyDQo+IENjOiBNYXJrbywg
UGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtvQHNpZW1lbnMuY29tPjsNCj4gb3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09F
LWNvcmVdIFt3cnlub3NlXVtQQVRDSCAxLzNdIGxpYnNsaXJwOiBmaXggdXBzdHJlYW0gdmVyc2lv
biBjaGVjaw0KPiANCj4gT24gVGh1LCAzIFNlcHQgMjAyNiBhdCAyMjo0NSwgWW9hbm4gQ29uZ2Fs
IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDx5b2Fubi5jb25nYWw9c21pbGUuZnJAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4gVGhhbmtzIGZvciB0aGUgc2VyaWVzLiBC
dXQsIHdpdGggcmVncmV0cywgSSBkb24ndCB0aGluayBpdCBpcyBhY2NlcHRhYmxlDQo+ID4gdW5k
ZXIgdGhlIHBvbGljeToNCj4gPiAqIDEmMy8zIGFyZSBub3QgYnVnIGZpeGVzIChVUFNUUkVBTV9D
SEVDS19HSVRUQUdSRUdFWCBpcyBub3QgdXNlZCByaWdodA0KPiA+ICAgbm93IG9uIHN0YWJsZXMp
DQoNCkkgZG9uJ3QgcmVhbGx5IGluc2lzdCBvbiB0aGlzIGNvbW1pdCBiZWluZyBiYWNrcG9ydGVk
Lg0KSG93ZXZlciwgaXQgd291bGQgYmUgdmVyeSBiZW5lZmljaWFsIGZvciBmdXR1cmUgY2hlcnJ5
LXBpY2tzLg0KU2luY2UgdGhpcyBsaW5lIGlzIG5leHQgdG8gYm90aCBTUkNfVVJJIGFuZCBTUkNS
RVYsIGFueSBjaGVycnktcGljayByZXN1bHRzIGluIGhhcmQgY29uZmxpY3QuDQoNCkknZCBsaWtl
IHRvIGtlZXAgdGhlIHNlcmllcyBhcyBpcywgYnV0IEkgY2FuIGFsc28gc2VuZCBpdCB3aXRob3V0
IHRoaXMgY29tbWl0IGlmIHJlcXVlc3RlZC4NClBsZWFzZSBsZXQgbWUga25vdyBZb2Fubi4NCg0K
UGV0ZXINCg0KPiANCj4gQmVpbmcgYWJsZSB0byBjaGVjayB1cHN0cmVhbSB2ZXJzaW9ucyBpcyBh
IHZhbGlkIHVzZSBjYXNlIGZvciBzdGFibGUNCj4gYnJhbmNoZXMgdG9vLCBldmVuIGlmIHRoZSBm
dW5jdGlvbmFsaXR5IGlzIG5vdCBjdXJyZW50bHkgdXNlZCBieSBZb2N0bw0KPiBwcm9qZWN0IGl0
c2VsZi4gVXNlcnMgY2FuIGNoZWNrIHdoYXQgdGhlIGxhdGVzdCAob3IgbGF0ZXN0IHN0YWJsZSwN
Cj4gaWYvd2hlbiB0aGF0IHN1cHBvcnQgaXMgYmFja3BvcnRlZCkgdmVyc2lvbiBpcywgYW5kIG1h
a2UgdGhlaXIgb3duDQo+IGRlY2lzaW9uIGFib3V0IHVwZGF0aW5nIGl0IGRvd25zdHJlYW0uDQo+
IA0KPiBJdCdzIGEgKnZlcnkqIGxvdyByaXNrIGNoYW5nZSBhcyB3ZWxsLCBhcyBpdCBpcyB1c2Vk
IG9ubHkgaW4gdGhlDQo+IHZlcnNpb24gY2hlY2sgYW5kIG5vd2hlcmUgaW4gYWN0dWFsIGJ1aWxk
cy4NCj4gDQo+IEFsZXgNCg==

