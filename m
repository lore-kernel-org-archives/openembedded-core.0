Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B798CC83F10
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 21:22:14 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.675.1693171328699408286
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 14:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=o7I1FmfC;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=UtxaKJae;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1693171328;
  x=1724707328;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=8CVvsk0EWhDNi98tlBh6yC0PEB79rtCxwBIIlpWuvy4=;
  b=o7I1FmfCWbwj1lQ1Yehj10zLN+iyJx1p0PdMt0y7DO6mhiqSRrhpBGDX
   vftwmKiUsENrBpOUPCBjA9aJR+nJeOFWPWFzD2l9y9qS89kkDDRLie5by
   hSwcA3CzZ5CeTxoXNdJ+XAD6eaky1izskCTG4m9ZNzpgK4DFKEWf3ituZ
   b6bJYrfvsZ/5E3Jmw4Pj0gfPS2UKPgzcB6hF4hOO/FHOuMuXyiyMTzG03
   4FjAJzYOcj9HrB0pr0qiJCMcs2zomzHOzoCXIiBmJTdAzW8k9MqYgOkm6
   IKJHrKE8PxzbT6JAHsW+D2KYOdbiP86Dj3G0meuKlTra58naFptT9WC+7
   g==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SUVW4Os1RPq5SOsjgZw2N9DZY+Ezn8sZRajc6coYJdsN+RziOxOfy4XfjSRGiC3GI9jugOaJAr7q7jDyRsawmeZwuscmjgYK+FZZxMkEeqT0jQ4GpwFJCJ4/8mGmnEFEevVONC6klGPs2Kz4mzO2XCRJL/y6t2/34kMkn8mGldcupR6dX6i26EXn4E6cnYL13PFNfSAbbks7Te8Nhyhqu42EeWwgqP5vTdgRX0R41ELFQChKh/zda9oCc3fh0hupGC3XXSXbCIHqb2IHZSN3+fVasqxbyTFKV0lia5c746+5ImrA3p/BN7pgM+KmyUUkf3Esl56pi3oOQ7X7nCQkVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CVvsk0EWhDNi98tlBh6yC0PEB79rtCxwBIIlpWuvy4=;
 b=enwsv/SPy+FRj6Nz401fnJffg+ZgVvaGdZ1toEd2p6V6teP/eq0bf7Rz4dOx7cu75TIjjz74A1792nBqWyemGSQWC585SvLznM8D9aOYG3yIeIUdGY2RR79uTNcdEslT+jxYw0wfZHaZdTbD/EYoTFpVB1DMjR9bttLGyII9M3JbWRV2vRiYOaOWTm6SorVnIPePMs+Z4nMdftEtfkj9r7R+MkXxXbwPJz03+zsLcVIjE7Lbp6JY4YU4iIndKvrsbZe79c0h3o1z/Zaygx5kgxpoTcTEzi8E3s7lwcVJuyjMfT3niU43F0wBcX/X6SuKSFf7w8wHiPLrQ0jv7juPdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CVvsk0EWhDNi98tlBh6yC0PEB79rtCxwBIIlpWuvy4=;
 b=UtxaKJae2Zx3MCLRMohvfBv92j18MZOgfcmodbDanzd01WL2k+bODuN7piuIEkoU4GNG8yATRrZD3+mfLPgNPUyo54DgqPVs5CXMmHlFcLKNnWZYAbv7jTTVLs6Zcl1k4ZJaqoXQbOcxensac0LakXEVTJn2geugcbv9h12dcyM=
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: =?utf-8?B?U3TDqXBoYW5lIFZleXJldA==?= <sveyret@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [meta-oe][PATCH] volatile-binds: Calculate the name of
 the /var/lib service
Thread-Topic: [OE-core] [meta-oe][PATCH] volatile-binds: Calculate the name of
 the /var/lib service
Thread-Index: AQHZ2Qac2kvp+GFBUEObCcALFR3556/+oRQw
Date: Sun, 27 Aug 2023 21:22:03 +0000
Message-ID: <DB5PR02MB10213CA4E209E0F4372B51B8CEFE1A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20230827164918.24785-2-sveyret@gmail.com>
In-Reply-To: <20230827164918.24785-2-sveyret@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PAWPR02MB10168:EE_
x-ms-office365-filtering-correlation-id: 823535fd-c7a0-4f18-611d-08dba743a844
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Kn+1W8kxRVy8U3N+OLtoXV7A76gIZNmdyDX63K4ihltwk2CpdfNKJBMGXXKsNHEdnMe1WCRp6eEF/ylct3tG4E49VJ9TAwRPLY+FeapwPQLpRKrXiE7p9i2dGHl8eleT/kRXdbej0EZruyx/mBRwd/iBuSOZS+2R4CKuMcIYoCihm419e5cuftIOAYOTvOTbV7J74E7Gxb/mvwrm56vlugFE1IM2cvRY6l8MUx3wtwefk971LbMuyAltTG370JwySdW9NdukZTtLGX2rXbzuBKKAsXdLwYjyfus4VseuRG5DCws6AtfU+/DnuONRU1Rw4xX7vhfyVLCyBZE+5h0CQcp2Z+W3Vx60i4QAyaapmg6YcWt/EHjbkNT1JB/Yfox+pyhn5CkY9QeywgYJeqDEd/2PwHEJ733JxildybkwQMKdyu2Yn4ENEKyHUbi5jQgx71KFGXaVgL62Fl0u/Xnt9z/3pU1ZVIwAUsFyPa/JtGR0B63pb73Qo1JHvq+UTRb8vO+r++IyvWUG0sa80N542tP5aMQonxWWSEsTfOSm+HpF6BD2wxi7lWCzdo9Xl6FgD+85czbeqysWi4vbE7Smdlr5WZRrU3N+QJBg4WKEIPkE/3TqmEJV6w9a/Y6l3mEh
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(39850400004)(376002)(366004)(1800799009)(186009)(451199024)(41300700001)(71200400001)(122000001)(86362001)(38100700002)(38070700005)(478600001)(83380400001)(26005)(53546011)(9686003)(6506007)(7696005)(33656002)(55016003)(66574015)(76116006)(66946007)(316002)(66556008)(64756008)(66476007)(110136005)(2906002)(66446008)(8936002)(8676002)(5660300002)(52536014)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eTdxNjhCbGpHY1ZNK2p6eEJSSG44NFh2bklBemxHa1ErWWYrT01MaEYxY2VE?=
 =?utf-8?B?Z0JGWndqSkdLUGRNZnpKKy9DN3ZaOUMxWTdxRTRNWkVTT1dvNnRKd0FKTHZR?=
 =?utf-8?B?N25SMzNINW10TzRQM25pUndhbllBam83YVZLTG9PNkRYb0hhL3NGOCtZdEsy?=
 =?utf-8?B?VkJhZzRZdS9NVUhUckJLV3poMS9FMkZNZHRXNFNJWU5UTXZLcGVEU0NkaGVH?=
 =?utf-8?B?cXNYd0trblFubFlBZ3NJazNZUUNCN0duN1pmYWZ5L0FNZDQyTEJiK3lHK1Jo?=
 =?utf-8?B?UXNGSUtuRTRYMmxsT1FMV1ltKzBXOFZqemgwNytXeFlBMno2eSttajlFbDF2?=
 =?utf-8?B?eVYzN1JRUExMcEhvWS9Xck43VEswcUJLRm5aTzF0K3JOKzJzU0JHb1JObzdD?=
 =?utf-8?B?ZnNsODBLSEpVcFNGYkM2N25vc1JVMG5RL21nSGJ0ZS9hTWdxRXdPM0Zhalc0?=
 =?utf-8?B?dUtkaUhld3ZvaWY1VFl4MkpPc0pobm5PZXVFTHVVSDBRUmU3ODRsbFhEZUlB?=
 =?utf-8?B?SGNienVVcjVJSkJGN2w0TUdzN2ZmNk1IcE5leDdmQUI5eThpWmJZdENkSC85?=
 =?utf-8?B?ZkZYcU1tN2NvRFE4UnY5d1B3aWlGRG5lNnZuQ3dwdlVYczJTTEpDb3JwQ2I0?=
 =?utf-8?B?YWJEdHhWRGNDbVB5NWpFVDNzT0gyOXIxcSszOEltOFZlajN5UVhxV2ZTWUUz?=
 =?utf-8?B?cXBZREg1aGRMOE1GZlNKN3c0MmpXVlhYUTNkc29JVUk3dkxOZUt6NC9ldkhG?=
 =?utf-8?B?eC85cFFlcVMrdlg5d1FETzRLcEZPSER3Y0Y0WlRHZ3B1ditnc3VlbDFTRzl0?=
 =?utf-8?B?QTNobnhYb0V4UHV5UzR1MUE1UXllZ2FCai91QVUyMURTN2JNdGpVSjFNWUhM?=
 =?utf-8?B?Mi9qK3hhVXdWbGJGNEd0Q01mWFFIQ3Q1Nzc3bG5WeFNtUTc5ZjFVWDhzN0R2?=
 =?utf-8?B?cDJiU2dzdFFNTFhOcGNlVWVGbjBoQnBDTDdGMUUyR2xXK3lBcXFyS3dHNWk4?=
 =?utf-8?B?bEJ6RUp2SkpWR3U3ckJodnZ3aVRaMjBRVUlMNmwxQkdYUFhpNEpFMDlZUWhM?=
 =?utf-8?B?ZkFHY25zcDUrSTFOb25sRkIxWk56OHMyYUo5TXp2SWlOMGJBRVhKYlZuWjZl?=
 =?utf-8?B?TmFSYk5VS3ZYa0ZRYmlDZmtGZHZmK29zYzJrMkpGWVdhdHZxOFY0dStPSGN5?=
 =?utf-8?B?NFV2VzRRQXM4YXJNaVd0WHQ4a1cwTzlyRVhmcmtnQXNVQ2tBQ2U1eDJPTTdE?=
 =?utf-8?B?ZlhEc01ubnZVd1VqTHh3a0pzMGNEYmM3My9saUdVNitLU21SWlRJRkN5cVVp?=
 =?utf-8?B?ME1YMHFuMzVTNDF1UDBlWXphd3lPTWE4VEJDbE5jNklybE9DRlJodW5nZEVr?=
 =?utf-8?B?Vi9yeUtzYUtBMEREMzJhMmtHUjlDOXNLN0t3OEpvTmRPMks5QTVpTFBjQ1dD?=
 =?utf-8?B?RUJINkhtY21yTlN1U1E5NWJTSWxtME5QOGtBU0pHZXBuNFN6bzI2RWREOWt5?=
 =?utf-8?B?UFJZVjFqNnVpSmZSbkFnOUgyY2Q2WUliMXQ3Sk1RbWVTdXVua2tDaUZGSmgw?=
 =?utf-8?B?d0hKQ0M5Mi84TVhjdFZOUmdKaERCemRFWVpFcUpnOG5HUHgzZVhQOWVpUjND?=
 =?utf-8?B?bnByR3RGakV6NVIvSVZoSnZqc2FobUQ3L3FIYWZ2d3BrNnA4ak5lVFR1UGZl?=
 =?utf-8?B?L2JaZVcxbzFlZ2lFVm1sbXNLTUswbFlhWDlMMVdXdStvQy9iREd2WkNaa3JF?=
 =?utf-8?B?TEZBVGdiYWpQcEZUaFdLUEppMk54d21NTFZHZ3QxNS9ycWdIc2FIaTd2d3p5?=
 =?utf-8?B?T3doeW9nVWlYdFpMeDhlNFE4L1F3VnVtNFNTeWtwK1FrOXFLYXFRYkw3RkVq?=
 =?utf-8?B?V1Z1ZXo0YWxjZG83SVNab1lOUExzSXROd2liMTRXK3ZnSlRoa3VIZTBMZ29P?=
 =?utf-8?B?a2RnS3hJcko0Q2xxeTRIb3Y1WDh2Vzl5cEZ3all4ZFlQOGRpKzBleURwMFRw?=
 =?utf-8?B?NGV5d0JJbS9aalBEQmVCMGlERlc5bnAwL2t1dU96NEp1bkNpMHY2TFhLejZx?=
 =?utf-8?B?ZjQzZ2E2aDZTbW9RSC9TNWJiT1JEU3dwZUlQYm1FbkR1M2Q4bkxRZEFZTzRs?=
 =?utf-8?Q?bNhk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 823535fd-c7a0-4f18-611d-08dba743a844
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2023 21:22:03.0398
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l8CpS2T1Tuc7ECSKC0c9NHiJFWmRUUCys1XEMdnsQTuW5SvVGVILWAVpN07qlkoo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB10168
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 21:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186806

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgU3TDqXBoYW5lIFZleXJldA0KPiBTZW50OiBkZW4gMjcgYXVn
dXN0aSAyMDIzIDE4OjQ5DQo+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IENjOiBTdMOpcGhhbmUgVmV5cmV0IDxzdmV5cmV0QGdtYWlsLmNvbT4NCj4gU3Vi
amVjdDogW09FLWNvcmVdIFttZXRhLW9lXVtQQVRDSF0gdm9sYXRpbGUtYmluZHM6IENhbGN1bGF0
ZSB0aGUgbmFtZSBvZiB0aGUgL3Zhci9saWIgc2VydmljZQ0KPiANCj4gQnkgZGVmYXVsdCwgL3Zh
ci9saWIgaXMgYmluZCBtb3VudGVkIG9uIC92YXIvdm9sYXRpbGUvbGliLiBJZiB0aGlzIGlzDQo+
IHRoZSBjYXNlLCB0aGUgcmVjaXBlIGFkZHMgY29uZGl0aW9ucyBvbiBzeXN0ZW1kLXJhbmRvbS1z
ZWVkIGluIHRoZQ0KPiBzZXJ2aWNlIGZpbGUgbW91bnRpbmcgaXQuIEJ1dCBhcyB0aGUgVk9MQVRJ
TEVfQklORFMgbWF5IGJlIG1vZGlmaWVkLA0KPiAvdmFyL2xpYiBtYXkgYmUgbW91bnRlZCBlbHNl
d2hlcmUsIGZvciBleGFtcGxlIGluIC9wZXJzaXN0ZW50L3Zhci9saWIuDQo+IEluIHRoaXMgY2Fz
ZSwgdGhlIGNvbmRpdGlvbnMgYXJlIG5vdCBzZXQgYmVjYXVzZSB0aGUgc2VydmljZSBmaWxlIG5h
bWUNCj4gZG9lcyBub3QgbWF0Y2ggZXhwZWN0ZWQgb25lLg0KPiBUaGlzIHBhdGNoIGF1dG9tYXRp
Y2FsbHkgcmVjb3JkcyB0aGUgbmFtZSBvZiB0aGUgc2VydmljZSBtb3VudGluZw0KPiAvdmFyL2xp
YiwgaWYgYW55LCBpbiBvcmRlciB0byBzZXQgdGhlIGNvbmRpdGlvbiBpbiB0aGUgYXBwcm9wcmlh
dGUgZmlsZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFN0w6lwaGFuZSBWZXlyZXQgPHN2ZXlyZXRA
Z21haWwuY29tPg0KPiAtLS0NCj4gIG1ldGEvcmVjaXBlcy1jb3JlL3ZvbGF0aWxlLWJpbmRzL3Zv
bGF0aWxlLWJpbmRzLmJiIHwgNSArKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29y
ZS92b2xhdGlsZS1iaW5kcy92b2xhdGlsZS1iaW5kcy5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3Zv
bGF0aWxlLWJpbmRzL3ZvbGF0aWxlLWJpbmRzLmJiDQo+IGluZGV4IDNmZWZhOWFiZGUuLjdhM2Y1
M2MzZWQgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3ZvbGF0aWxlLWJpbmRzL3Zv
bGF0aWxlLWJpbmRzLmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3ZvbGF0aWxlLWJpbmRz
L3ZvbGF0aWxlLWJpbmRzLmJiDQo+IEBAIC00OCw2ICs0OCw3IEBAIGRvX2NvbXBpbGUgKCkgew0K
PiANCj4gICAgICAgICAgc2VydmljZWZpbGU9IiR7c3BlYyMvfSINCj4gICAgICAgICAgc2Vydmlj
ZWZpbGU9IiQoZWNobyAiJHNlcnZpY2VmaWxlIiB8IHRyIC8gLSkuc2VydmljZSINCg0KVGhvc2Ug
dHdvIGxpbmUgY2FuIGJlIHNpbXBsaWZpZWQgdG86DQoNCiAgICAgICAgc2VydmljZWZpbGU9IiQo
ZWNobyAke3NwZWMjL30gfCB0ciAvIC0pLnNlcnZpY2UiDQoNCj4gKyAgICAgICAgWyAiJHttb3Vu
dHBvaW50fSIgPSAvdmFyL2xpYiBdICYmIHZhcl9saWJfc2VydmljZWZpbGU9JHNlcnZpY2VmaWxl
DQoNCllvdSBzaG91bGQgdXNlICIke2xvY2Fsc3RhdGVkaXJ9L2xpYiIgaW5zdGVhZCBvZiAiL3Zh
ci9saWIiLiBBY3R1YWxseSANCiR7bG9jYWxzdGF0ZWRpcn0gc2hvdWxkIGJlIHVzZWQgaW5zdGVh
ZCBvZiAvdmFyIHRocm91Z2hvdXQgdGhlIHJlY2lwZSkuIA0KSXQgaXMgYWxzbyBhIGdvb2QgaWRl
YSB0byBhdm9pZCAmJiBpbiBjb25zdHJ1Y3RzIGxpa2UgdGhlIG9uZSBhYm92ZSANCmR1ZSB0byBo
b3cgc2hlbGwgZXZhbHVhdGVzIGFuZCBzZXRzIHRoZSBleGl0IHN0YXR1cy4gQWxzbyBhdm9pZCAk
ey4uLn0gDQpmb3Igc2hlbGwgdmFyaWFibGVzIGluIGJpdGJha2UgcmVjaXBlcyB3aGVyZSBwb3Nz
aWJsZSBhcyB0aGV5IHdpbGwgDQpvdGhlcndpc2UgYmUgaW5jbHVkZWQgaW4gdGhlIHRhc2sgaGFz
aC4gQWxsIHRha2VuIHRvZ2V0aGVyOg0KDQogICAgICAgIFsgIiRtb3VudHBvaW50IiAhPSAke2xv
Y2Fsc3RhdGVkaXJ9L2xpYiBdIHx8IHZhcl9saWJfc2VydmljZWZpbGU9JHNlcnZpY2VmaWxlDQoN
Cj4gICAgICAgICAgc2VkIC1lICJzI0B3aGF0QCMkc3BlYyNnOyBzI0B3aGVyZUAjJG1vdW50cG9p
bnQjZyIgXA0KPiAgICAgICAgICAgICAgLWUgInMjQHdoYXRwYXJlbnRAIyR7c3BlYyUvKn0jZzsg
cyNAd2hlcmVwYXJlbnRAIyR7bW91bnRwb2ludCUvKn0jZyIgXA0KPiAgICAgICAgICAgICAgLWUg
InMjQGF2b2lkX292ZXJsYXlmc0AjJHtAZC5nZXRWYXIoJ0FWT0lEX09WRVJMQVlGUycpfSNnIiBc
DQo+IEBAIC01NiwxMiArNTcsMTIgQEAgZG9fY29tcGlsZSAoKSB7DQo+ICAke0BkLmdldFZhcign
Vk9MQVRJTEVfQklORFMnKS5yZXBsYWNlKCJcXG4iLCAiXG4iKX0NCj4gIEVORA0KPiANCj4gLSAg
ICBpZiBbIC1lIHZhci12b2xhdGlsZS1saWIuc2VydmljZSBdOyB0aGVuDQo+ICsgICAgaWYgWyAt
biAke3Zhcl9saWJfc2VydmljZWZpbGV9IF0gJiYgWyAtZSAke3Zhcl9saWJfc2VydmljZWZpbGV9
IF07IHRoZW4NCg0KVmFyaWFibGVzIHRoYXQgbWF5IGJlIGVtcHR5IHNoYWxsIGFsd2F5cyBiZSBx
dW90ZWQuIEFuZCB3aGVuIHRoZXkgYXJlLCANCnlvdSBkbyBub3QgbmVlZCB0byB0ZXN0IHRoYXQg
dGhleSBoYXZlIGEgdmFsdWUgYmVmb3JlIHVzaW5nIHRoZSAtZSB0ZXN0Og0KDQogICAgaWYgWyAt
ZSAiJHZhcl9saWJfc2VydmljZWZpbGUiIF07IHRoZW4NCg0KPiAgICAgICAgICAjIEFzIHRoZSBz
ZWVkIGlzIHN0b3JlZCB1bmRlciAvdmFyL2xpYiwgZW5zdXJlIHRoYXQgdGhpcyBzZXJ2aWNlIHJ1
bnMNCj4gICAgICAgICAgIyBhZnRlciB0aGUgdm9sYXRpbGUgL3Zhci9saWIgaXMgbW91bnRlZC4N
Cj4gICAgICAgICAgc2VkIC1pIC1lICIvXkJlZm9yZT0vcy9cJC8gc3lzdGVtZC1yYW5kb20tc2Vl
ZC5zZXJ2aWNlLyIgXA0KPiAgICAgICAgICAgICAgICAgLWUgIi9eV2FudGVkQnk9L3MvXCQvIHN5
c3RlbWQtcmFuZG9tLXNlZWQuc2VydmljZS8iIFwNCj4gLSAgICAgICAgICAgICAgIHZhci12b2xh
dGlsZS1saWIuc2VydmljZQ0KPiArICAgICAgICAgICAgICAgJHt2YXJfbGliX3NlcnZpY2VmaWxl
fQ0KDQpIZXJlIHRvbzoNCg0KICAgICAgICAgICAgICAgIiR2YXJfbGliX3NlcnZpY2VmaWxlIg0K
DQo+ICAgICAgZmkNCj4gIH0NCj4gIGRvX2NvbXBpbGVbZGlyc10gPSAiJHtXT1JLRElSfSINCj4g
LS0NCj4gMi40MS4wDQoNCi8vUGV0ZXINCg0K

