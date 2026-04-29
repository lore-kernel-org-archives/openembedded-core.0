Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FED9CCFA13
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 17:14:08 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1478.1777482842907803874
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 10:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=gZNBHUlq;
 spf=pass (domain: siemens.com, ip: 52.101.83.70, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KE0OgSrJ9bKKKgUvMb+4KD1xm9O5DJu5MYhYf1FEFOr1zHHkwXPGNhALVdTkevaDL19ol0kzphNMIRw/AoZ2ZmTCZqj697UsB60BzdSV5NTEj/ChcV4voobGbyJu5jUPYcfzy6cNr2I+4DU6dYFXf404Gw0rBY10MHiQAWyfuTHRvrNCq9tZ64Ds1kxWhn6SddsMGK5RLueoFYQfvEVs8iBTf8uJDffktHc0Sk5wkU7zb4q7qsxco6Ui8dWrsKWd9jsUIxW51bv1WAhXeKY5Ws2wCFtvxY5d9aw+2hMn7xOxSc4erbHHnDU0p3pHjC3hR8tAr5X23oPiJ4RrFdoNbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aedQ17IDogBpol0ZOvGY3ngvrG6KbimRveNQWiU6ux8=;
 b=Mruzxc5c7FEfSqZbVpdqmflF0Eko+ZciSq6OjqFOa7IdcZgyxXkqeGvSzpvZSe03B534deeis0u4FPxqJ4z4ItaiKDPkgFyb+j7tZHOJvPBs+31m9X1QohmVr4cJwqok75DFQjw1ifPwycTHc88iL6D+jXUpPAjuyRBHZzR77saUOz4xiL2ev962os22j61UWVEurWNrPkuqclcvq3FdiCb1iqSbsm8FXbHj6nn2L7WHf+Biu8dDO+GsOoxjRNf+Y/TVh0KcGaWk/HE6tLFS57HAH1dvqsZ+eO27mmr177eaX+YB4BLCTadvSqUXP6/q/Ve0zTWgGZ4m+JYn6gssFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aedQ17IDogBpol0ZOvGY3ngvrG6KbimRveNQWiU6ux8=;
 b=gZNBHUlqn+DqJJyXlSRZ7jmdFlhbSjGaI7mSvbWpmIT4og/JHrXxIFNdkg9rHddLFWLcXuqIKteWJLt6fVo7XpOWwcREzexrG9WUIgtMiNfPiAgtz3Ea0QG79YWVCcpsH/bW930MjtoMucRvh+EUYXLSdg853hj8oX7rORi1FZtwkYWaMnhqFvigxfjM/1vH98bHej3MnXHk58+wXTNs9wCdCxXgbqpspI0y/rB/AJfIPNnKY9gqepBWp4ZjjIJogZdY1jTxVGjaD8QpsYg+jMH9ebrnWOJbGmbB9fduSd+lIbTEg6F+ItOlCsgcpgwLRbgnZ98fpYBRWzWh4hOEuQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV1PR10MB8902.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1ce::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 17:13:57 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%5]) with mapi id 15.20.9818.023; Wed, 29 Apr 2026
 17:13:57 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Benjamin Robin <benjamin.robin@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH 1/6] sudo: set status of CVE-2025-64170 and CVE-2025-64517
Thread-Topic: [PATCH 1/6] sudo: set status of CVE-2025-64170 and
 CVE-2025-64517
Thread-Index: AQHc1a2c4nfU2PoDb0Gu4igJzr1G07XxtrJggADIdgCAAjL5kIAA9O2AgACiqQA=
Date: Wed, 29 Apr 2026 17:13:57 +0000
Message-ID: 
 <AS1PR10MB56972D5D144DE00D1F5838B3FD342@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260426185025.13217-1-peter.marko@siemens.com>
 <RRV3rhtPRj-XxHaMgbEl5A@bootlin.com>
 <AS1PR10MB569741551B057DB782B91C58FD372@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <guQOcvruSnqgA-55eCHYSw@bootlin.com>
In-Reply-To: <guQOcvruSnqgA-55eCHYSw@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=44f4b808-d37d-42b8-a94b-4310dba733d4;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-04-29T17:06:36Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV1PR10MB8902:EE_
x-ms-office365-filtering-correlation-id: e2b5c220-a8d1-4cd5-1943-08dea612b2be
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|18002099003|22082099003|55112099003;
x-microsoft-antispam-message-info: 
 e6IaJ9Ru4f58lNLQ3JxtcpfNatoycoa7QiiUC/NrE+WY4wtSe4gguX/jGrK0Za6boxBYE6RVQsSZmNaLGRekA9vFKhyC8zFAntaZKjrRpqeYjjTlmIe3eRs+zPzGeTJVWPugHS2jDhcwD8bN4Ii2dYOK20HlrCAiNBeWxV30CnzlibPzVmyDtyaCJS46gY7nRj0YiZqNR7Oc7rx9EBWtBCJkQgyG0LCRS6197fWQYNx3Za/ukk3+TRz7knXJiK7EpnleQJ8q1lzSvCkwooiv2WDmhAtVtUQgI8G0WzF7K9tcUA753NUkBYsh3yY31bwBggVbM3DqO4ZKNaeHtrhNijzNlTXTNey3HzfzlHaiZrB0xKvQvu1YL61GeDFxmcja3MPDQqOjhXCOU1yvop5muXFdav3n68CSLLzGs4g4Kc42dpH9p63MVyaPgnK6UwhBiToAtXpxY3IBS3z/zS1uBGKu/vSS7ttCo8OJCZ1hrefNVSmNQqjVDDGEOnIiZQFM2Rdu3bySRp8yBQ5S/76nxoAYbsBzeaxPaQ3SFEeqwBZoOho3AoA/1x4QOe4I7M4snlXAB8xiNuNq5VFkkkOqQdWvnqbNhSEcGFdKpVv+LLQZ2jcdl+ZjnUQCsNo6tJEm9Y2Ty5folMMC1iqYE0pvls2Jp8TFZ2s1gYQo9t09ogWcBk0st6LzL+s5aS8bae+reVghCN9yOeLh9E6KC9/ePYR4oIqa5JuaeaKfAAaB9kGrubn0R7Wvxz3SdJ/20429
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Uk1XN00wRitGcTJ4WEdIb0s2bTQ0WndSWk04ZUJVd1pSNGtEeWs5VHdpeFlV?=
 =?utf-8?B?NjBPT2VEMUIyK0trVkhkWkJQUU1aNUh3Y3VhREE2ajlqcng4eVRMOGtldVR5?=
 =?utf-8?B?bnBEZFFVN0E5ekFHS3VKc05Xemk2SVVmRENVSlBzSGdCZmlJbERkMTllWUNP?=
 =?utf-8?B?K2R1Q3YzcnNpMmt6OVdnSmppd0NwSmd4eTR1OGZlKzJnVHZiYmZmb0J3WC9L?=
 =?utf-8?B?TzRuNGhFaThNMmU4UTkwdXJzTDZGYU9QWVBvbmNTN0VtS3VZb1lNSTRBUGJK?=
 =?utf-8?B?YkpDOXBHQnU2Zlludm1BZ0J4WDU3Zi8rYTZtZ1hEdlQ0aTJNMDZHVWljd3Y3?=
 =?utf-8?B?MWZDLzlqWmpFZVlrallWbGhCK25nVlppUUJ1K1FaNDRWSWJoV012WGkwTW03?=
 =?utf-8?B?S0NqNUtQN3J6K3E4UWpvWUZWTDFvVERhUEZXWDlGTnZ4UnFmZmZJOWFaT05k?=
 =?utf-8?B?ZE91R3lGTTc0WXRBTStvaEZHcnArdjBYTkdFcmVQMG12dy9WQXNqTFh2M0Jx?=
 =?utf-8?B?R1AxMWdpTFZwWmt2SVVodkxLTGRUbStIYjBZUmZqQVBYRWdUVGNEU0xHSnlm?=
 =?utf-8?B?NmcwUUFtSDYvSXNFWVpzcG04UTVhRkJOem5zaWtYenVYV0JObk9ad2dHVVd6?=
 =?utf-8?B?T2FYK0d4NWJPeVBMVHJScjVPdFYzOFNjVVU3L3crRlZnSjlwMnVoRGFWVko0?=
 =?utf-8?B?MThqUFpzd3NlS2xkVmhGZDJ5eWxSKzJrd2FSbmdCUDhXN25HeXhTZHJFV2tM?=
 =?utf-8?B?OXpCRnR1dWFCeStCemRZNllzZzE5Q1ZzQmN0MGxCRGR3VTk2SnhORndZRWRt?=
 =?utf-8?B?WGJ3QlNaOTVqRGZlNmRNdWkxSCtoYk9ZMlNrUy8vQ3NScHU5OHp2czRBWHZx?=
 =?utf-8?B?Z3Z0R1MyR3lpN25QYzJ5Q1FaSXcvanplK2tzZVM1eHZCZjZLdjlDeU96aVQ1?=
 =?utf-8?B?WUQ4UFB4dXJjb0hlY0VDdE5KZks1U2VrUU8vWXgrUEJPcFMrb3NIU0xBUGpS?=
 =?utf-8?B?SWpwTlBseXV3L0tUT0NJWnlpS1JoWXlidWgvU2psL2hCNmZneXBubi9Gd2lm?=
 =?utf-8?B?d0lrd3JmS3dKaEZtS3Exb3k4SnRqaFBFb3BmTmwzWWdBRndHTmZyalNnL1dG?=
 =?utf-8?B?V3g3NUt4ZjY4V0MwRENqbGZCRXBmT09ucFRKdmFXRnFpUjZEUHdXOTA5djVK?=
 =?utf-8?B?aFZjSTF0MDI3MlJnRU4yQXV2SGdnbTVtYTcveXZ3QUxhakgzWkVvT3AwSlZh?=
 =?utf-8?B?eHhxSTRRWjFRZ1krNWtnWVZsUVpzdEd4bnBuVGJwSnRpK2dHYjNNeVhOSWJ0?=
 =?utf-8?B?MUs4TTlqdGZSVVg1QWlVdHgxcmVBMitZWTE0WTB5akhKanNtWS9MZkM3WEti?=
 =?utf-8?B?blJTZHV6Qlp1bUJtUXk3Z2gvVHJpSnhwZS9KQXhXUTloSXR6K0JxQUFLWkMv?=
 =?utf-8?B?c1d3bjlocGJRb2tZa08zTGNTYVoxTXpHRG4yWndLbUNHa3FZQTVJTFRxSmdQ?=
 =?utf-8?B?OHlkdG5WdHZzTHVaVnBIbFE3Mk1mWTN0RThwVkdFOEx1QWpmQ2VBTlBqNXFr?=
 =?utf-8?B?L2Zyandka3VMMU1SejVETVFuRGh0ai9iREFqNHhFZzkxdmd6eENwOHUzY1Ri?=
 =?utf-8?B?aFZFZkxXclNqVjlLMjFiRTYvVFNEckxmc2pFcmplSXF1dklvYzBrMVUzYjZp?=
 =?utf-8?B?aHY1dmFFeEtNRDFVUzcreUtzZmNSVGVHM3hYOVVIdTRkWjU1aGFybEE0TFAw?=
 =?utf-8?B?OE43WTBjczZPNE5JN0FOd3NWRjYya2dYZldMc1RYcmlOclFFekdxd2ZIdkov?=
 =?utf-8?B?K1ZoTFhXZk1DOFlRWkVRdVI4RUM5amYxc1UrMEl3dUREY1FnU2FyVkNWYlVN?=
 =?utf-8?B?b0lSOVA5R2pxQjM5dE1CZDQrWEdEV0ZoMHpyMkxHaG1oT1Fydnkrd2JGSDUx?=
 =?utf-8?B?bTBBYkdEUFh5UDFlUzlHTjdXYTA5K3RpV2EzRnltclZLVzJrRkFCb1duK1BJ?=
 =?utf-8?B?MjdXRG5MM2libjlmSHU0eGRIaDBYTFNKaHVVUzJDdWx4SlV0TE1oUTN4elFK?=
 =?utf-8?B?Y0pKM3JGWDRpWUJIY0Yzb0ZPeEMyQnI3a3IzSC8xRDBZaGZWNzFVM0NCVnYx?=
 =?utf-8?B?V0RaUUVJcUh3RUQ1ZnN2STJSYTVwS1Y4ZXhkZEMrVFJ0cjJSZnlMa2oreVBF?=
 =?utf-8?B?eE1nYzVzU1ZRUEZHcTc5ekhyeCt5L2U3aTlFNllqZEx1YnkyRVNVVDhhNFE3?=
 =?utf-8?B?cXV1MkRFcnRRdlFVcjRWeTU1MUJrSXFYbmxTdm1XdEd3VDBNcC91THk0eHlh?=
 =?utf-8?B?aS9VQlVXa3NsblBiRFNRdnk1U2tzTjdUODJmUEt3NWdwNDROcEM3Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b5c220-a8d1-4cd5-1943-08dea612b2be
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2026 17:13:57.1172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m2WKbeqLQkGNF8AKCimmG2Z9nLkO0bxwdE9iYVbx232+mKM7s00NXz+KPpps85EUdvROr880sIdlWi7O3Q6GXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8902
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 17:14:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236126

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmVuamFtaW4gUm9iaW4g
PGJlbmphbWluLnJvYmluQGJvb3RsaW4uY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEFwcmlsIDI5
LCAyMDI2IDk6MjQgQU0NCj4gVG86IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMxKSA8UGV0
ZXIuTWFya29Ac2llbWVucy5jb20+DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS82XSBzdWRvOiBzZXQgc3RhdHVz
IG9mIENWRS0yMDI1LTY0MTcwIGFuZCBDVkUtMjAyNS02NDUxNw0KPiANCj4gSGVsbG8gUGV0ZXIs
DQo+IA0KPiBPbiBUdWVzZGF5LCBBcHJpbCAyOCwgMjAyNiBhdCA2OjUx4oCvUE0sIE1hcmtvLCBQ
ZXRlciB3cm90ZToNCj4gPg0KPiA+ID4gPiBCZW5qYW1pbiwgYW55IGlkZWEgYWJvdXQgdGhpcyB0
b3BpYz8NCj4gPiA+DQo+ID4gPiBZZXMsIHNhZGx5IHRoZSBDUEUgb2Ygc3Vkby1ycyBpcyB0cmlm
ZWN0YXRlY2g6c3Vkby4NCj4gPiA+IFdoeSB0aGlzIGlzIHRoZSBvZmZpY2lhbCBDUEUgb2Ygc3Vk
by1ycywgSSBkb24ndCBrbm93Li4uDQo+ID4gPg0KPiA+ID4gV2hhdCBpdCBpcyBoYXBwZW5pbmc6
DQo+ID4gPiAgLSBGcm9tIGh0dHBzOi8vY3ZlYXdnLm1pdHJlLm9yZy9hcGkvY3ZlL0NWRS0yMDI1
LTY0MTcwDQo+ID4gPiAgICB3ZSBleHRyYWN0IHZlbmRvciBhbmQgcHJvZHVjdCBuYW1lLCB0aGVu
IHdlIGxvb2sgdGhlIHByb2R1Y3RzIGRhdGFiYXNlDQo+ID4gPiAgICB3aGljaCBpcyBidWlsdCBp
biBzYm9tLWN2ZS1jaGVjay4NCj4gPiA+ICAtIFRoZSByZXR1cm5lZCBDUEUgYXJlICJtZW1vcnlz
YWZldHk6c3VkbyIsICJ0cmlmZWN0YXRlY2g6c3VkbyINCj4gPiA+ICAtIFRoZW4gd2UgY2hlY2sg
aWYgdGhlIENQRSBpbiB0aGUgU0JPTSBtYXRjaGVzIHdpdGggdGhlc2UgQ1BFLg0KPiA+ID4gICAg
Q3VycmVudGx5IHN1ZG8gaXMgZGVjbGFyZWQgYXM6ICo6c3Vkbywgd2hpY2ggbWF0Y2hlcyB0cmlm
ZWN0YXRlY2g6c3Vkby4NCj4gPg0KPiA+IEhlbGxvIEJlbmphbWluLA0KPiA+DQo+ID4gSSB3aWxs
IHNlbnQgQ1ZFX1BST0RVQ1QgdXBkYXRlIHRvIGdldCByaWQgb2Ygc29tZSBvbGRlciBzdWRvLXJz
IENWRS4NCj4gPg0KPiA+IEhvd2V2ZXIgZm9yIHRoZXNlIHR3byBDVkVzLCBJIGNhbiBzdGlsbCBv
bmx5IHNlZSAic3Vkby1ycyIgYXMgcHJvZHVjdCwgbm90ICJzdWRvIiwNCj4gYWxzbyB2aWEgbGlu
ayB5b3UgaGF2ZSBwcm92aWRlZCBmcm9tIGN2ZWF3Zy5vcmcvYXBpLg0KPiANCj4gWWVzLCBidXQg
dGhpcyBpcyBub3QgYSBDUEUuIEFzIGV4cGxhaW5lZCBwcmV2aW91c2x5IChzZWUgdGhlIHN0ZXBz
IGRldGFpbGVkDQo+IGFib3ZlIGluIHRoZSBwcmV2aW91cyBlbWFpbCksIHVzaW5nIHRoZSB2ZW5k
b3IvcHJvZHVjdCBuYW1lcyBleHRyYWN0ZWQgZnJvbQ0KPiB0aGUgYXNzb2NpYXRlZCBmaWVsZCwg
d2UgbG9vayBpbiB0aGUgcHJvZHVjdHMgZGF0YWJhc2UgZm9yIGFuIGFzc29jaWF0ZWQgQ1BFOg0K
PiBodHRwczovL2dpdGh1Yi5jb20vYm9vdGxpbi9zYm9tLWN2ZS0NCj4gY2hlY2svYmxvYi92MS4z
LjAvc3JjL3Nib21fY3ZlX2NoZWNrL3Byb2R1Y3RzL3Byb2R1Y3RzLnRvbWwjTDE2ODgNCg0KVGhh
bmtzIGZvciB0aGUgZXhwbGFuYXRpb24uDQpGaW5hbGx5LCBJJ20gc3RhcnRpbmcgdG8gdW5kZXJz
dGFuZCBob3cgc29tZSBDVkVzIGdldCBhc3NpZ25lZCB0byBjb21wb25lbnRzIHdoZXJlIEknZCBu
b3QgZXhwZWN0IHRoZW0uDQoNCkhvdyB3YXMgdGhhdCB0b21sIGZpbGUgY3JlYXRlZD8gTWFudWFs
IHdvcms/DQpGb3Igc3VkbyBJIHRoaW5rIHRoZSB0YWJsZSBpcyBjb3JyZWN0IChhbHRob3VnaCBJ
IGRvbid0IHVuZGVyc3RhbmQgTlZEIG1vdGl2YXRpb24gZm9yIHRoYXQpLg0KDQpIb3dldmVyIGZv
ciBTREwgKENWRS0yMDI2LTM1NDQ0KSBpdCBsb29rcyB3cm9uZzoNCmh0dHBzOi8vZ2l0aHViLmNv
bS9ib290bGluL3Nib20tY3ZlLWNoZWNrL2Jsb2IvdjEuMy4wL3NyYy9zYm9tX2N2ZV9jaGVjay9w
cm9kdWN0cy9wcm9kdWN0cy50b21sI0wxNjA4DQpXaHkgZG9lcyBpdCBtYXAgc2RsIGFuZCBzZGxf
aW1hZ2UgYW5kIHNpbXBsZV9kaXJlY3RtZWRpYV9sYXllciB0b2dldGhlcj8NClRoZXJlIGFyZSBk
aXN0aW5jdGl2ZSBDUEVzIGZvciBib3RoIHNkbCBhbmQgc2RsX2ltYWdlIGluIE5WRCBEQi4uLg0K
DQpQZXRlcg0KDQoNCg0KPiANCj4gVGhlIGFzc29jaWF0ZWQgQ1BFIGlzICJ0cmlmZWN0YXRlY2g6
c3VkbyIgKHdoaWNoIGlzIHVzZWQgYnkgdGhlIE5WRCBkYXRhYmFzZSkuDQo+IFdoeSB0aGUgTlZE
IGRhdGFiYXNlIHByb3ZpZGVkIHRoaXMgQ1BFLCBJIGRvbid0IGtub3cuLi4gQnV0IHRoaXMgaXMg
dGhlDQo+ICJvZmZpY2lhbCIgQ1BFIGZvciBzdWRvLXJzIGFzIEkgYW0gYXdhcmUuDQo+IA0KPiA+
IFBldGVyDQo+ID4NCj4gPiA+DQo+ID4gPiBUaGUgZWFzeSBmaXggaXMgdG8gZGVjbGFyZSB0aGUg
cHJvcGVyIENQRSBvZiBzdWRvIHVzaW5nIENWRV9QUk9EVUNULA0KPiA+ID4gd2hpY2ggc2hvdWxk
IGJlIHNldCB0byAic3Vkb19wcm9qZWN0OnN1ZG8iLg0KPiA+ID4NCj4gPiA+IFRoaXMgYmVoYXZp
b3IgaXMgZG9jdW1lbnRlZCBoZXJlOg0KPiA+ID4gaHR0cHM6Ly9zYm9tLWN2ZS1jaGVjay5yZWFk
dGhlZG9jcy5pby9lbi9sYXRlc3QvZGVzaWduLmh0bWwjZmluZC1hcHBsaWNhYmxlLWN2ZQ0KPiAN
Cj4gDQo+IC0tDQo+IEJlbmphbWluIFJvYmluLCBCb290bGluDQo+IEVtYmVkZGVkIExpbnV4IGFu
ZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9ib290bGluLmNvbQ0KPiANCj4gDQoNCg==

