Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47BEBC433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 09:04:05 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.79])
 by mx.groups.io with SMTP id smtpd.web09.61845.1643792643383909560
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 01:04:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=r5cFKxjm;
 spf=pass (domain: siemens.com, ip: 40.107.14.79,
 mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QshkI/l416Gpf88HxtRyH+7DgKQPYN0Y61w3VLnqUaA40gSS5qZt9Qf1EHpkgh/jqhms2YJYMTarCiR+L+ULJSeb/u7e2eljz+ecBQDYLroLYZTgOYxfgOWALJn88NytqK+iLemjC3FNd1WlqJ1sv5sTG5u9EQcOMo2NHaq8lJoEelvwbssIpcqmJAuxN6DjEfb/eepNiy9JA+ycy0KGZZgkNDeJzmVhhsstbpK4e0CU3FruLtTlFhvNVLBRVTHevlR70DkDJzAdj2OIO981VhfykQh9qolQcOa453+3rRVt7sEm3GLB6YLvvYpnXN1VsiLBy6Sg4D/JAdCg9en/+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXxnWyymF8wry+z3XmuAZwlaiOGDZN5Agat+4bRyPNE=;
 b=jn8KTgKgHHDk2WqtuPZalc1RG3a/eJ8/OSuW8vUNSVIv1+4o65wBrB55vQ0iZARj4hcKE7Kr/OFugZtnT8hkLis4Lk8dkYXQXKUWusFHXL3Dain8NkRcwOlGjs5afq2VzTGpqDdvpy3UsjcKLtPxR/JcEc0Tx/Z1KdOjOustjyBZMIVnn5lXBxotMzhnDQmS5Azocn6sIRzjPFInb3OMRuPaXeAL1GYrqQw9/VFfnib2+dwczuL91no+nbIY3yxqapxxCUS/e6Tn1uNXohbP3cuz4/J1UDjIwTv9CWBLlCdraZEfFUAOvHHtm6UbGVTY/4ezKg9oGN+hmkLH7DEdVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXxnWyymF8wry+z3XmuAZwlaiOGDZN5Agat+4bRyPNE=;
 b=r5cFKxjm5y7GRmhIcCZvHBbONcLOLihS8F5apY1FR8OhoQN4H3VgSgYbTbh93W7ZRJT4++V5sRLWooN9MXwwMVi6G9DxRXbSaMdU9EfclCm1tsN3uKGJCXWlCRf5mMeKxhLIlTii8kAFZzjM+P63WUZK9qhru6UPQYMnbbrlkTf1ipFEZ9hepxvMHBr96Er78AtjDexXx9i5N2fMogNrliuDOdsyqCeYKxT7cPeTKhVQUoDLz1vjpMCrWy2SAYRtCI/cVf1oHiEVimuMbsQX+cIVwWmqBB3tSovVVyr73r3KBOklj1Ytffg/Ca4RluUWIuEiwOjXLK4OJvLx9M2Xjg==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by PAXPR10MB5088.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:217::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 2 Feb
 2022 09:03:59 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a891:c3c5:9b77:c2da]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a891:c3c5:9b77:c2da%3]) with mapi id 15.20.4930.022; Wed, 2 Feb 2022
 09:03:59 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "marex@denx.de" <marex@denx.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "peter.kjellerstedt@axis.com"
	<peter.kjellerstedt@axis.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Revert "featimage: refactor style"
Thread-Topic: [OE-core] [PATCH] Revert "featimage: refactor style"
Thread-Index: 
 AQHYFKdFKazkG8IFIU+R02wKcIxavqx5L5cAgAAJAoCAAAZAgIAACdGAgANu4YCAACwJgIAC9awAgAAYEwCAAAz/gA==
Date: Wed, 2 Feb 2022 09:03:59 +0000
Message-ID: <4db51b69b00365e0aa192f1c3bebd52962cc0366.camel@siemens.com>
References: <20220129002907.84534-1-marex@denx.de>
	 <93bb78f01d7c44c1b5918e1576f2a804@axis.com>
	 <315161c5-6b68-2b4c-37fc-3d10459fdbf8@denx.de>
	 <53514b34002e424584e20150b6b725a7@axis.com>
	 <cd82c692-f11c-0e1d-4b53-950121e0b3bc@denx.de>
	 <c864b18a0e354116059c25ddf03096c90cf8bbca.camel@siemens.com>
	 <251fe11a-7348-086f-364b-b9940fff3d68@denx.de>
	 <613436ece6c481bbd5efda1774bb45be2960988e.camel@siemens.com>
	 <95a6175a-16c8-9676-0918-f69828b8d6ec@denx.de>
In-Reply-To: <95a6175a-16c8-9676-0918-f69828b8d6ec@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26f21440-57d5-4cb2-7a04-08d9e62af393
x-ms-traffictypediagnostic: PAXPR10MB5088:EE_
x-microsoft-antispam-prvs: 
 <PAXPR10MB5088CEF89EEBA2ADA52764F092279@PAXPR10MB5088.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JyrBvwZtYCDuev1k3dXjAV59Ihbc/som2G9G2Mm3+gwAeoo2LNvk5uWKoJp3Ne7FuZaTNCJh2CGhnkyCcKpaYIe5aMj0DrMP6Kv7nbpLQVns8Frtoswo+beuD3SirPyD/GbZqBvRXwmrHKAU8pB0blkUyzLnLSs24r3suMEnBlt7bkP9kwxI71wcuwgn1gmMuVtvmAWQreqZesQ2qIj9xp4dHl45GLwQYSAiEN/jbvU78fnK5pjSE9hK2QtDvoORX5lzb6BPE3QTnu9bbfHNymx8WHGficpL3qZ3uzAzpFIXac/r55tf2kL3S/qDVe9VOspSEaDgDF0yUPpQDaMld3L402LAymPq/F5eTKU2gwsA1NJ6SkdL159f7dXPrxiMA7C0C7/jeIFlVTHXM3uFY5uBBGX9s7i1BY/wpVtE5PDK+knpUZzfeG5j1jC4StPttBK299VzRM3G5kTqr3RF6lpfgcKIzG6lSrrr9h86zDNm6RjI6j60kHPDklBk5Ee4HUbZTkiVCJkD1ypFl5DzsDPmipKtbRQeC6lv7PLPozfaKrmsLx30S8MxKtp5mGrol3+ESd849iSbQ7RTnSu4nDXOlVqok2rqBGlvZZrvAfDffXT/LEFRtbwsTa03L+pTrFs2+Dd2isRst/qKT0X2m73b7XFVE6N/OGUG0RN12l/KFhtV+wk+hz3GACADYzsDBnxehTAn+AjQtn59pyAKNg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(110136005)(82960400001)(86362001)(6506007)(122000001)(36756003)(26005)(186003)(38100700002)(76116006)(4326008)(66946007)(83380400001)(64756008)(2616005)(53546011)(66446008)(91956017)(66476007)(66556008)(38070700005)(6512007)(6486002)(2906002)(71200400001)(5660300002)(8936002)(8676002)(498600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QkFNZnFnZnIzYjBuNTFCclN2b2xSRmJkbW5xS1RGc3p1SENKRG52RmN1TWsv?=
 =?utf-8?B?ZzdqYTRuaWZFM2Z6MG1tQm92VGtSNVVIa25Jb0dZZG5HM0U2YlBTL3laZmRw?=
 =?utf-8?B?akFHRjd6ejUva2Rxdm1Idk11UlNMbUpMUTZjTlJlMEF3TGwxSnZzTUUvYTRO?=
 =?utf-8?B?QWJrYy9EVGg5TFAzMStndHo1L09wT0N1QkhjZVJMQS8yUCttbEJabGVwam9q?=
 =?utf-8?B?cWQzcXVQRytXNXorSTRjSEhQUWVIcWowSmc0UFhGdUpqdGVsVjZ0QlBCK09k?=
 =?utf-8?B?dXY2L3NCbm5WTmY1OGtyQXhzU3VGR3UxYnc5Mm5sTDhSQ3dTM2pOdVRuUTFM?=
 =?utf-8?B?aytIdTAzMGx0bnBTVi9zUGFtMDNOODFtMHkwMFZWZzNxTHMvYXl4VlBydGRU?=
 =?utf-8?B?RzM3VWR1T0FSOXpudU5IMk1ySE5ucnhtMzdKRWg2YklxOTBzREtXYVhjZ2ZZ?=
 =?utf-8?B?N01uYzFYOUl4dmFCUDMyT1lFMkdUOHBERUlJMGdodkhRMXFPc21sL0x5NXVG?=
 =?utf-8?B?OFRKVldXYWxVRE00REY0TGd5YmpqUlhFZDlwVFV4OEpxQ1dEZHJmWGdmUmU4?=
 =?utf-8?B?NkNndERNYk5lK2FXSGFLUHROMld4MGt0RHM0OGtXY3ByQ21TdHhwaGx6YUxk?=
 =?utf-8?B?UUhKRlo0UkhrdHRWSGMvbmNORTJ0Y3BSZzJCVXJTQUk4cDd1TmxtRm5ndzNv?=
 =?utf-8?B?UDdKeGdkVVZaZUtJOVpZa2hSVUlDN0hWai8zYm5oU3VhYXFBdTFrdFNDT2Zy?=
 =?utf-8?B?ajZRT3pTWXhxZVpTQ0pIVmVFMmdaYXEzbGhFOU9DRE1IWHo3SjhwRDRaTXNP?=
 =?utf-8?B?cVUvRDhva1RTQlU1RW1sajhZWkQ4MlJLK3BGSnNucUVqbko2bTNBZnIwbDMw?=
 =?utf-8?B?YWdsU0VMSEl5K2ZKTVRlZWZnL3o4SE1qWjBHRnhCUHFicE1GcW1MSm9yeXpZ?=
 =?utf-8?B?VWJWOGgzR3NXYUR6T2Zoby9FWmR3TkpyNW14TkFvQjhOZGJHc0NHVWFVM3E4?=
 =?utf-8?B?V2FrMUNlVmJYUHZlcXNpNmRaTFpnc2NkcytkajV2V3EyS1gwY3JLWXFjRzFF?=
 =?utf-8?B?cndBVGdCblorZDBkbXlZbHNCRVpwSlVEdnFJVmRKTXRKdElxZUNMZ3ZJNVF0?=
 =?utf-8?B?dFU5aFVJVFZGak4wVVJUVnprN1Z1a09SaDBYdndKMzBjbHBwUjA2YnVjUmZ0?=
 =?utf-8?B?d1JZcUU3K1EvMGpGQzRNZERlUXpoQk9wZURZNXRldEhiZGdQUEMvWU9hQ0lm?=
 =?utf-8?B?dUVWRG9vdUNKY29kQ3ZwL3NaVWFRNmJRZUM2OXlLUXJqekFueHNoYkp1SVF2?=
 =?utf-8?B?elRqMXU5Rkk2Z0xiNmMrbEVvUVlMNzBVU05KQVRNaCs3UUhDWkxWS2ZwU0J1?=
 =?utf-8?B?VlFhaUhMVFZUQXBEMytkdDlXS0xVWXAxdlEyMGNJalF5NUN2QzBjNlhweklK?=
 =?utf-8?B?djZ3bFVlMTJuNW0rVWdrcjhUQkhrTHZoQnFOSExhYTFUVkdPSDNkYStqNUdU?=
 =?utf-8?B?M29UendmeHhLd1d2MVlsSnhYbU55ZWpOT2oyc3hjOG9yYkxEQXhsSTlPaTNt?=
 =?utf-8?B?YnlSaWVUNTlrRzJKVU8wREhqaTdRRmhxN1d1UmdrWEpxSFNWME1wbE1nUWRm?=
 =?utf-8?B?QVhoeWlXNmIxTyt3TDdxN3UzR1RVc29sZ3hEV29uK1B1RUlVeTdNM1hMSytG?=
 =?utf-8?B?aUJxMk4zWGRoNEtvMU96T2tUWG1VZEJqdEJ6WFk0NTJTQUhScjVRcE5vYjd4?=
 =?utf-8?B?b0VHeXlTNTRWcXBTY2F0bms3dG9rb3krSW1EbWU1S0UzTlFHcVpDZkNwc0NO?=
 =?utf-8?B?bVVGblZtVk1PL3doMU9aWjZMQXpGMTZCT1ZGazY2WUE0U21KQ2dUTFptaUht?=
 =?utf-8?B?MmErL1IrQlF4Sm9wNHBkUlZBOGdoL1VaWklJbG9DVUhDdWVuaS9RNDFLYzZh?=
 =?utf-8?B?aFRpdDA1dVg1LzVUakRaUEsvLy9vWDV4S285b1FxTXcyYVlBT3BaZlhlc05V?=
 =?utf-8?B?VG9kaWVZMXJQb1BtZmNxdVN5MTFsTVoyc0RGNUZBY0R0OFB6dkFnNmF2aHVU?=
 =?utf-8?B?VXNQU2V3TkpvWW9HVWlPTjhqZVRhRjRyVDZOLzhJemQ3dDExdkUxT0gvcVBU?=
 =?utf-8?B?N0NjTmJPdUgyckF4dEw0OS9wdzkzWWFlWVliOStKUDBCbWZ3d2Z4TlprMnZL?=
 =?utf-8?B?V1J6aGlCaFJLRzMwazEzbkxRVll2Z2xMcDBnSk4wYWZNMHROa1Jnbmd0b2VP?=
 =?utf-8?Q?e/NqyjERSXoktU5YOTvu4ZZ2mn8Uz7EC1DpmjVLExw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <895F1C36EA86D442B3C2E5DA35568F25@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 26f21440-57d5-4cb2-7a04-08d9e62af393
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 09:03:59.8241
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 dUH030xjHpPMDM35G6v9dmDcEuzg5kIpd66SP0F7PxQ7i053nrkamnCmWkWxKlTA5YGDRp9Tec0IYif9Nvg+AOxibF4lanAVXJ5ki6vAyIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 09:04:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161187

SGVsbG8gTWFyZWssDQoNCkkgdGhpbmssIHdlIGhhdmUgdG8gc3RvcCB0aGUgZGlzY3Vzc2lvbiBu
b3csIGJlY2F1c2UgaXQgaXMgbm90IGxlYWRpbmcNCmludG8gYW55IGNvbmNsdXNpb24uIEFueXdh
eSwgYm90aCBvZiB1cyBoYXZlIGEgZGlmZmVyZW50IG9waW5pb24uDQoNCk1heWJlIHJld3JpdGlu
ZyBpbnRvIHB5dGhvbiB3aWxsIHNvbHZlIGl0LCBJIHdvbid0IGRvIHRoYXQuDQoNCkNoZWVycywN
CkFuZHJlag0KDQpPbiBXZWQsIDIwMjItMDItMDIgYXQgMDk6MTcgKzAxMDAsIE1hcmVrIFZhc3V0
IHdyb3RlOg0KPiBPbiAyLzIvMjIgMDc6NTEsIFZhbGVrLCBBbmRyZWogd3JvdGU6DQo+ID4gTWFy
ZWssDQo+IA0KPiBIZWxsbyBBbmRyZWosDQo+IA0KPiA+IFNvcnJ5LCBidXQgdGhlc2UgYXJlIHN0
aWxsIG5vdCBhbiBhcmd1bWVudHMsIHdoeSB0byBkbyB0aGF0Lg0KPiANCj4gSSdtIHNvcnJ5LCBJ
IGFtIGxvc3QgYW5kIGNvbmZ1c2VkIC4uLiB3aGF0IHBhcnQgb2YgdGhlIGVtYWlsIGFyZSB5b3Ug
DQo+IHJlZmVycmluZyB0byA/DQo+IA0KPiA+IE9uIE1vbiwgMjAyMi0wMS0zMSBhdCAxMDozOSAr
MDEwMCwgTWFyZWsgVmFzdXQgd3JvdGU6DQo+ID4gPiBPbiAxLzMxLzIyIDA4OjAxLCBWYWxlaywg
QW5kcmVqIHdyb3RlOg0KPiA+ID4gPiBIaSwNCj4gPiA+IA0KPiA+ID4gSGVsbG8gQW5kcmVqLA0K
PiA+ID4gDQo+ID4gPiAocGxlYXNlIGF2b2lkIHRvcC1wb3N0aW5nKQ0KPiA+ID4gDQo+ID4gPiA+
IFNvcnJ5LCBidXQgcGVyc29uYWxseSBJIGRvbid0IGxpa2UgeW91ciBpZGVhLiBXaGF0J3MgdGhl
DQo+ID4gPiA+IGJlbmVmaXQgb2YNCj4gPiA+ID4gcmV2ZXJ0aW5nIHRoaXM/IEkgd291bGQga2Vl
cCB0aGUgJHt9IGZvciBiaXRiYWtlIGFuZCAkIGZvcg0KPiA+ID4gPiBzaGVsbC4gVGhlDQo+ID4g
PiA+IHt9IGhhcyB0byBiZSBwbGFjZWQgb25seSBmb3IgdmFyaWFibGVzIGxpa2UgJGEke2J9Yy4N
Cj4gPiA+IA0KPiA+ID4gVGhhdCdzIGV4YWN0bHkgdGhlIGJlbmVmaXQgb2YgdXNpbmcgJHt9IGlu
IHNoZWxsIHNjcmlwdHMNCj4gPiA+IGNvbnNpc3RlbnRseSAtDQo+ID4gPiAtDQo+ID4gPiB5b3Ug
ZG9uJ3QgaGF2ZSB0byB3b3JyeSBhYm91dCB2YXJpYWJsZSBuYW1lcyBiZWluZyBhY2NpZGVudGFs
bHkNCj4gPiA+IGNvbmZsYXRlZCB3aXRoIHN1cnJvdW5kaW5nIHN0cmluZ3MsIGVpdGhlciBkdWUg
dG8geW91ciBvd24NCj4gPiA+IG1pc3Rha2UsIG9yDQo+ID4gPiBzb21lIGF1dG9tYXRlZCB0cmFu
c2Zvcm1hdGlvbiB0aGF0IHdhcyBhcHBsaWVkIGluY29ycmVjdGx5IC4NCj4gPiA+IA0KPiA+ID4g
PiBXZSBzaG91bGQgcmVzcGVjdCB0aGUgd29ya2Zsb3cgb24gYWxsIHJlY2lwZXMgb3RoZXJ3aXNl
IHdlJ3JlDQo+ID4gPiA+IGJyYWtpbmcNCj4gPiA+ID4gdGhlICJ1bndyaXR0ZW4iIHJ1bGVzLg0K
PiA+ID4gDQo+ID4gPiBUaGUgd29ya2Zsb3cgb24gYWxsIHJlY2lwZXMgPyBXaGF0IGRvZXMgdGhp
cyBtZWFuID8NCj4gPiA+IA0KPiA+ID4gYnJva2VuIGJ5IHBlb3BsZS4gQmV0dGVyIHVwZGF0ZSB0
aGUgZG9jdW1lbnRhdGlvbi4NCj4gPiA+IA0KPiA+ID4gVGhlcmUgaXMgb25lIHRlY2huaWNhbCBj
b3VudGVyLWFyZ3VtZW50IHRvIHRoaXMgcmV2ZXJ0IGZyb20NCj4gPiA+IFBldGVyLA0KPiA+ID4g
cXVvdGU6DQo+ID4gPiAiDQo+ID4gPiBUaGVyZSBpcyBhY3R1YWxseSBhIHRlY2huaWNhbCByZWFz
b24gdG8gbm90IHVzZSAke2Zvb30gZm9yIHNoZWxsDQo+ID4gPiB2YXJpYWJsZXMgdW5sZXNzIG5l
Y2Vzc2FyeSBpbiBiaXRiYWtlIGZpbGVzIGFuZCBpdCBpcyBiZWNhdXNlDQo+ID4gPiBiaXRiYWtl
IHdpbGwgdHJlYXQgdGhlbSBhbGwgYXMgcG90ZW50aWFsIGJpdGJha2UgdmFyaWFibGVzLiBUaGlz
DQo+ID4gPiBtZWFucyB0aGV5IGFyZSB1bm5lY2Vzc2FyaWx5IGluY2x1ZGVkIGluIHRoZSB0YXNr
aGFzaGVzIHRoYXQNCj4gPiA+IGJpdGJha2UgY2FsY3VsYXRlcy4NCj4gPiA+ICINCj4gPiA+IA0K
PiA+ID4gQnV0IHRoZSBwYXRjaCBiZWluZyByZXZlcnRlZCBoZXJlIGFkZHJlc3NlcyB0aGUgcHJv
YmxlbSBvbmx5DQo+ID4gPiBwYXJ0bHksDQo+ID4gPiBiZWNhdXNlIGl0IHN0aWxsIGNvbnRhaW5z
IHJlbW5hbnRzIGxpa2UgdGhpczoNCj4gPiA+ICINCj4gPiA+IGNvbmZfZGVzYz0iJGNvbmZfZGVz
YyR7c2VwfXNldHVwIg0KPiA+ID4gIg0KPiA+IEp1c3QgZm9yIHlvdXIgaW5mb3JtYXRpb24sIHRo
aXMgaXMgbm90IHJlbW5hbnRzLCB0aGlzIGlzIGV4YWN0bHkNCj4gPiB0aGUNCj4gPiByaWdodCB7
fSB1c2FnZS4gSWYgeW91IGRpZG4ndCBwbGFjZSB0aGUge30sIGl0IHdpbGwgYmUNCj4gPiBjb25m
X2Rlc2M9IiRjb25mX2Rlc2Mkc2Vwc2V0dXAiLCB3aGljaCBkb2Vzbid0wqAgbWFrZSBhbnkgc2Vu
c2UuDQo+IA0KPiBPSywgb25lIG1vcmUgdGltZSB0aGVuLg0KPiANCj4gRWl0aGVyIHlvdXIgcGF0
Y2ggYXR0ZW1wdGVkIHRvIGNoYW5nZSB0aGUgY29kaW5nIHN0eWxlIG9mIHRoaXMgc2NyaXB0DQo+
IHRvIA0KPiBtYXRjaCB5b3VyIHBlcnNvbmFsIHByZWZlcmVuY2UsIGFuZCBkaWQgaXQgb25seSBw
YXJ0bHksIHNvIHRoZSByZXN1bHQNCj4gaXMgDQo+IGluY29uc2lzdGVudC4NCj4gDQo+IE9yDQo+
IA0KPiBZb3Ugd2VyZSBmaXhpbmcgdGhlIGFmb3JlbWVudGlvbmVkIHRhc2toYXNoIGlzc3VlLCBp
biB3aGljaCBjYXNlIHRoZSANCj4gdGFza2hhc2ggaXNzdWUgaXMgYWxzbyBmaXhlZCBvbmx5IHBh
cnRseS4NCj4gDQo+IFRoZSBjb21taXQgbWVzc2FnZSBpcyBub3QgY2xlYXIgb24gd2hhdCB0aGUg
aW50ZW50aW9uIHdhcy4NCj4gDQo+IFsuLi5dDQoNCg==

