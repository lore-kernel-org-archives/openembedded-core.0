Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6571D1062893
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 12:44:44 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20060.1773233079694918441
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 05:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=JQfSVM4N;
 spf=pass (domain: siemens.com, ip: 40.107.162.18, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMBX0whFLa1hOJz4cIhUVti9sUQvfnUvXvDhE1h4565w6k7J+MKEq/Zy0LloRt5cy8O0vGRwcVokyW58S7wwienXSC4yFGdF2CsVXyMBeuJCyCQsQJXYofLE2zRe9wS2LRVvvnZkFY9z8RJSCpzHSJi04ko3ZTJ4tALSlVfyPXNdD71eGFb2gQiGPevKNef90/E5Zfvv8xVY+H/s+T3ebIfj+J0pDYuJq+MwL00eL0DmUzaWPWGZ+c+6wSrQ3GaY0N0sfD+2ytEjGJZ1iwaAgHknLVuCJ16/iy7rzyP5DT9P4NMARL3+LSFm5gBb1R7nDcfccZvH1eMHy3UQVO9/Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AdL2+m4cky+bTdukC8HgZvKEQMPo6mZ+gtAWDHI1cPU=;
 b=GprTgOLs+bzUoDeZj/i/cfinjJMCMnGEG1fwJKiARCqwtcgeKvscXvIDTrJCUzNXkGCyvutQ0K3gttjK3ny195ktZlXzgaSllVJdkTLK9AuAkIr3IHJgVUrk/PQD4N58gNSXdxxBHY3pa5+pd+uFmsJKYHjnzIyZFSLSYkNwIibLT0JeLO7lPygbDiAq32QC8HvpHGNAXwfiigzisHVGzo9aTr0wQeDII9bTHxOjI5j++vhzGw7Gjo0f5MQJNQIN/Rzt190XYkwo/4mb7vyz80CkkY8bx7TLiy9ooszvTtV/ANEMbh/uPTG64GptbIYMvpqh3ToNIbBGF2/Tm0/DTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdL2+m4cky+bTdukC8HgZvKEQMPo6mZ+gtAWDHI1cPU=;
 b=JQfSVM4NBGONAtU0BzHrzpYVp1XvIlUgkdWDS9d0TfVI1Y6+AnYjWD8+E20NwZ2uO5+QFCZqCGsD8g9eNEs9Ydg2qRyqlH31+fDU97FL4Aly4/fEJ52/Rx61PoOKKUV/GgAqzqmTyT7dlOKZ0AVmMSTx5P4vy27tVJqETvDE7l0mFxY7Hoi4XlW66UkTkKH9rYZqLo44rstgygdYeREWgQk4Cd6XiPvTHj0WQxihcJikmqSuthCO6sz7Psf8Af0c47blY0jMXa6OX18Rov+0VUtjKyMEtEpqJkyvzQ6kYBDdps1iQwesmAlHBJqTbvWMujBY8qt/ZFD7vCsV/othXg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by VI0PR10MB9153.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:232::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 12:44:35 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 12:44:35 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "zboszor@gmail.com" <zboszor@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/4] bash: Add INSANE_SKIP=build-deps to ptest
 subpackage
Thread-Topic: [OE-core] [PATCH 1/4] bash: Add INSANE_SKIP=build-deps to ptest
 subpackage
Thread-Index: AQHcsVK5X2TpsUomhEOtITNyffU12rWpRWBQ
Date: Wed, 11 Mar 2026 12:44:35 +0000
Message-ID: 
 <AS1PR10MB56977E851FCBA7CBCE3B4652FD47A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260311122922.4160133-1-zboszor@gmail.com>
In-Reply-To: <20260311122922.4160133-1-zboszor@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=85ec09ab-910e-4ded-aa8d-8616cccc1514;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-03-11T12:38:49Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|VI0PR10MB9153:EE_
x-ms-office365-filtering-correlation-id: 3d848e20-0a66-45fc-1c4c-08de7f6bf391
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003|55112099003|38070700021;
x-microsoft-antispam-message-info: 
 ZoqBdY+BdCFU7x7yG77hBK7gPm+Pn4EgzHo0xziLm1ibYsq+e8NtAxZHt7/jWWG7C8ABLIXlgOv34zE6o1FLKkPHdzKrOG2DC3WwUGHazVuYUrVM9ucAgeUf8d1uisiVsrOdXnGY7LksigL4WnvWnS34+HyIP8o7O5xHX3njQaOyavE+vjCKWr1aEv/T+sPyKCOdsgEWYJaqJyNAK1nmlB82MU+Yenn8QIr+n7ExzM4L1jTH6i2ATlCHUc0uLCLIDd1NhQqgTaOsl/SgGeS6uJqtn3Yt/3PaARX6kG8eB2ql1n+zZ/eqJUIW/yThWfIbQj5c8aqIkpKpgunkhqlebXBX0XWrCmSgSTmDmdVfJww8um/Z64nZhAn77JD2etvJ3HrpvaeT3Gf52/rpWBjtr0Z0lFufCf2a/AqYNRrHuw1+umVHF03/rRF1YGXOa4ua/ie/LrMq1uPzm4KwPMLFDMVNhTSoyFRSSnq4fPhkOy9G30BB/FxS1cqPKh4sdd/udzLZakvBMTPaqiAqz+vV/5yvwbexbbPFbVDffqdxd7REaVwK4pnusHMrhDGGGNrSydwzmA7yIbIjThr1MnoVoou8Vo9UcLmRgqAViz7WV8XYlE0j7QW/l1Rcv7giI2FhnOQJ2I5UVZeCTUhzOLNX4JPScSpsDBniyoSGgooe1TKuVGGjZ4E4FLZbvjFvDRyKWsInzFP5LO2+Y87wrLd8G+BqcTSuP+cRYDPgd3dlo3wqMuVyuBqiSJVPxGuL5Z4pCXl3L7I8DOqXeM5einrhJETG79Hn1BgWduG+9pAkITM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003)(55112099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?czBVRXpqY2RWMXRhbFN2SDJLV3dLeXUzZmxLL1pBeENnNDFpbmt3S0lKWWxT?=
 =?utf-8?B?MDg5eGNUWXNCaC9HNTBzdGxQVUwzL0pjRmV5ZU9mNXBaYlRGbTd4L2ZJc3FH?=
 =?utf-8?B?N1BOYXVzMk9wb0tDSnBqQ3p2d1Vrb3UrV1FjV2pLOFM3L25Udi9RR1BubE0w?=
 =?utf-8?B?OCtUcHg5ZElzd0xjazdTbmRGZFVtQVFZbmdtK1J0bXB5Zk1JLysrTHYwUnhy?=
 =?utf-8?B?MDIrYmpnWktwVkpYUHBRSVMzc1ZVSmRBemQxRTBiSEZ2TlRCcEhpZjRJN2JB?=
 =?utf-8?B?TTYwWHdrSUlwNWRmckQ1SllOeHJpNEJhVjBuTnJWMVpqQ1lGK3YrSnFkTytR?=
 =?utf-8?B?UC90S2xjNzBVRUdYUFhGaDhhUlJ1YjNmdmxtL0lQWEhUbXVETjJsS2ZnaDha?=
 =?utf-8?B?RWJGem83Wm1KUWpOaExyemxuandwQnpFdEM2clY1RDF4NDVISTdCMGxyWnBB?=
 =?utf-8?B?U1o1NTB4U1pVY0djTi9GbmQzdFljM1M0cDF5WkJQSFlJQTZkRk1YTFJjMm5U?=
 =?utf-8?B?a3l6REhkTmg4UmNaSnlHcnJLZkRTa3BrK3R4SjZRWlA4em93VnlGb1BUdkxo?=
 =?utf-8?B?a1c3QjVGWndRY2h6cStqRzlDVENodzd0ZzJRL3pCdVE2S1VDN3ZMYmdhaTJH?=
 =?utf-8?B?MHVEajZJSTFGMi9ta1R6ek1DYjQ3R1JrL2JLSkx2S3Z4UWZwcHlMWmRoZE52?=
 =?utf-8?B?ekIvbHlwRnV6WWtJS3R6YnJScEgreHlqbE8xOGlYL2FWQURQZWFmTlZ6RUE2?=
 =?utf-8?B?UVdHN2hzb0JvbkdJQWxNLzhoMG5xT3N6ZHZERHRCTnVJWHJNVFIzVlBOaGZB?=
 =?utf-8?B?TUthOUt5YkRGY3hmM21PenZjNlM5MVVqUnpISHVMZ0Y4aU85b2xiUHZGRlFj?=
 =?utf-8?B?ZDAzb2t0THNMRGg4dkNyRnRnQVBMZ2Q4STNibkRDWG5xY0JCRFdTSnBRUUtt?=
 =?utf-8?B?NjBPcmVWL1VtdnVGeDhOK0ZUNnNWZTcrNDNKV1NRcHF1cUlaQmJONjRmT1Rp?=
 =?utf-8?B?K0ZhZW9OaFV4YU5WZHZKMGMyTjk5V3Q3aGpscm5kUlpHRlBIaHhralE5S1Rw?=
 =?utf-8?B?M09uSnRQTXgvbTIrNlZCYTFSRXU3M0NFVm42aEtxQlo3V1Rzb3lKYUlyR2dO?=
 =?utf-8?B?TGRTejJIM242SDNIS0FkZVd3dEc3dG8xZzU1eEZTWmZzVWVrdVdvZ2RzMjkx?=
 =?utf-8?B?bUYzNWxxUjV6MHhwL0cveVd0OUxOWndpK2tlVVpWbHYvWHBqSWxkamJUelg1?=
 =?utf-8?B?aWR6OEdqN2NNdXFHbk5OemlxdmJNMUlYeWlpS0NFd1BmaWZDSDhnclRSM0dh?=
 =?utf-8?B?SFZlRkRaSEZTV2lSNGRhUmxJK21XQ1k1V3dXblVTS2JPVm1wbUdUZW9IUU9H?=
 =?utf-8?B?Q0pmTkkzbW5qblord3JURmVWSGwzdE41M2x2WkQvc3ZNcVpxWjlZa3g1bFRq?=
 =?utf-8?B?MGdRVkJmM2tZazlDVnpUUDJFdDZLVGcvR2xYNzUwUDZaK1NGdzRTQjhPNmRH?=
 =?utf-8?B?N2pIMFJtL3hRQ243MDlITXZwTWFjVUlGME9EVjBJSml2ZGozK0tIckZwR08v?=
 =?utf-8?B?emJWQ3hpYjVHV05zYlZQWUhRc1d4anRkK1JUTjdnM2hNYUFrOFR2Y0szVVlj?=
 =?utf-8?B?SlUrU2J1aThmNDJyVVREQjR5UVMrQnV6cU1HeTZySHdUdkJkMGhaVjl2VzZy?=
 =?utf-8?B?d1BxSm1uam9KYXNWNzVETTd0RmtielB3ZW1zY2JVMUVIeVpMVzY0OHhheUc5?=
 =?utf-8?B?OTRvSlRrbU9aWnNUNzVNRGxKQVo2Ty9Kb0FRdURrWmpEN2NyU2VleW5DdW9Y?=
 =?utf-8?B?RnNta1ZnQVc3TXVZcFpyQmNvU1FmL1g2c2F4UWtMazFvamtZRmRQcVNUVUJl?=
 =?utf-8?B?UmxsdlNNamVWZE00ZFZ4TFdlMWk5UWh5czI0VG0zcGE5NElZa2U4QUN4eWVY?=
 =?utf-8?B?NTUzbUUyYXFqVDNyNndWbkZKSXQzSEpKNXRHWnUyS0kvTXlTcUFaOWVTS0s4?=
 =?utf-8?B?eWVSaWRKb1NqVzFacE5MQ2c1aE1hNUFaUXpGMlViNGd2dUR5OG5aMzdTZG00?=
 =?utf-8?B?Q2JXRVBqcWIxY3hITkdsSG5ZS0NqWDR4Q3Z1bGhSOVZuVjZwc0VrS1loSnpK?=
 =?utf-8?B?V1JGMERLUWRScW9IUjhaN2ZPdHhudGx6V0Vqd1ZzRkxzaDJLNnBNcG4zOXZI?=
 =?utf-8?B?Z0g0Q29NWlF0SXdXNjRSMkpFZWE0VXFtZ29vdE8ybG1OTTNGMHAwT1lWaE1I?=
 =?utf-8?B?QTdFcC9mMFJ0dGtrNit1SFd1R1BieURGdTdGSVNMZkFpNDdrQjhoRFoyOWpQ?=
 =?utf-8?B?ZUluRHFQYVJ0TURzTzV2blpvczU2cW5paU5GVmlFZmE3OFY2QzFGdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d848e20-0a66-45fc-1c4c-08de7f6bf391
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 12:44:35.7744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y8DQaDQecN3VsApImWA77xmPO5lb5/FMeSh3pCLxxBdoqOybgvlnGPBOjO9KtOk/+rvIYMvakouLEbRFTaj1OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9153
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 12:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232876

VGhlc2UgSU5TQU5FX1NLSVAgYXNzaWdubWVudHMgYXJlIHdyb25nLg0KVXNlIEdMSUJDX0dFTkVS
QVRFX0xPQ0FMRVMgPSAiYWxsIiAob3Igc2VsZWN0IGp1c3QgdGhvc2UgeW91IG5lZWQpIGluIHlv
dXIgZGlzdHJvLg0KDQpQZXRlcg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRl
ZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgWm9sdGFuIEJv
c3pvcm1lbnlpIHZpYQ0KPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgTWFyY2ggMTEsIDIwMjYgMTM6MjkNCj4gVG86IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IFpvbHTDoW4gQsO2c3rDtnJtw6lueWkgPHpib3N6b3JAZ21h
aWwuY29tPg0KPiBTdWJqZWN0OiBbT0UtY29yZV0gW1BBVENIIDEvNF0gYmFzaDogQWRkIElOU0FO
RV9TS0lQPWJ1aWxkLWRlcHMgdG8gcHRlc3QNCj4gc3VicGFja2FnZQ0KPiANCj4gVGhpcyBmaXhl
cyBhIFFBIGVycm9yOg0KPiANCj4gRVJST1I6IFFBIElzc3VlOiBiYXNoLXB0ZXN0IHJkZXBlbmRz
IG9uIGxvY2FsZS1iYXNlLWZyLWZyLmlzby04NTU5LTEsDQo+IGJ1dCBpdCBpc24ndCBhIGJ1aWxk
IGRlcGVuZGVuY3k/IFtidWlsZC1kZXBzXQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogWm9sdMOhbiBC
w7ZzesO2cm3DqW55aSA8emJvc3pvckBnbWFpbC5jb20+DQo+IC0tLQ0KPiAgbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2Jhc2gvYmFzaC5pbmMgfCAxICsNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9iYXNoL2Jh
c2guaW5jIGIvbWV0YS9yZWNpcGVzLQ0KPiBleHRlbmRlZC9iYXNoL2Jhc2guaW5jDQo+IGluZGV4
IDYzNDIwOWM5MTEuLmI0M2IxY2JmODkgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9iYXNoL2Jhc2guaW5jDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9iYXNoL2Jh
c2guaW5jDQo+IEBAIC0zMiw2ICszMiw3IEBAIEFMVEVSTkFUSVZFX1BSSU9SSVRZID0gIjEwMCIN
Cj4gIFJERVBFTkRTOiR7UE59ICs9ICJiYXNlLWZpbGVzIg0KPiAgUkRFUEVORFM6JHtQTn06Y2xh
c3MtbmF0aXZlc2RrID0gIiINCj4gIFJERVBFTkRTOiR7UE59LXB0ZXN0ICs9ICJtYWtlIGNvcmV1
dGlscyBwZXJsIHNlZCBzaGFkb3cgdXRpbC1saW51eC1zZXRwcml2Ig0KPiArSU5TQU5FX1NLSVA6
JHtQTn0tcHRlc3QgPSAiYnVpbGQtZGVwcyINCj4gDQo+ICBSREVQRU5EUzoke1BOfS1wdGVzdDph
cHBlbmQ6bGliYy1nbGliYyA9ICIgXA0KPiAgCWdsaWJjLWdjb252LWJpZzVoa3NjcyBcDQo+IC0t
DQo+IDIuNTMuMA0KDQo=

