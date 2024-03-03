Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F9A4C48BF6
	for <webhook@archiver.kernel.org>; Sun,  3 Mar 2024 13:18:22 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.45])
 by mx.groups.io with SMTP id smtpd.web11.72759.1709471897480260212
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Mar 2024 05:18:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=aosJzV4A;
 spf=pass (domain: siemens.com, ip: 40.107.13.45, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxCwzwZwwlFE8jVshzRlRtiJv0YrZyylsh+fWNWjw0AyPUmg2JLTmmMeVzEA1tjMGiSfFi0BlI5SSMaxYZDy6SEeKO9x5csDzSqQlX2AjYWsqrv/+VDwWHAVuVR6XPFU0ZpE/Ghx268Vz4S7tOxJABtYuBz7339BjgZhR8T66P3QVdBLAb+nYPiBQOhIsDVRIr2juvLL17348UGZuxZ5AVtDTdMyo4VPPGuj3NvPjhm7FsCkkOLZLHEjsc7j9mo30jGK/UmhQt963OmayvZVXrNg69xu7nsk6TpWosuGR2IL/hrSu2nRnV7pmcIzu2Jj92U8L8vGk1KWTTfNVRmb9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQgWsygFttJJJY/5iDFoaBlmMkbcuO2LcxocQn/Rjd4=;
 b=FkRiyzDPd7ejkIM/Am7bCzpjDPJbuDRvwCCtt8hTlSTVwiaKqQL1+SeXfwON9YWHH/9EvYHj1Ej7TdaIR0R/ccfvu3FfsvMGQm0hF+pmxpaAkhrdJJkaOlCwP07os53R3ZBhNLsQzxRDF2mfi8/sk+C9rWnRs5pYJQ9MP3JKxArOdgMTaWXZBvalTw7G98APc1wt+DIpbywdEpf26WQpUdh0P3dvXnDroF0U3yq3yeDpt9i2AOPT/nBcGZW3VrdqLmCEC1gkAKhhoyM0OUlNkZxNokqMEnsBXkkK6Lw4gYDUVPpF3yvf7d1PX90qTc0lb8qwV30zMuS1HPkm1DSYJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQgWsygFttJJJY/5iDFoaBlmMkbcuO2LcxocQn/Rjd4=;
 b=aosJzV4AQGmdrzTHplcNMkj2l0i7kczmWaOTo9MmASYJTonsOI/dw9U7FhZ7JoLDir4O7usS0rG34njHNWAoQsAqYdPgmOAV8cinxdGrVo9W1o6JwjPNqhsUXEbr069gbi21/dQjTselvmIkYjDF6kwSMoBuQGR+sOe0g+09rs/SmqX1hYFDbJOk6AaqLfykeI6oXFdtMP2MBcYOIx9GRtnNZtBgJ+KaVDzhWvQi9lOWzyVXf2Ep9aAkqwB/DRgg4PLiWfPSQtT+tLx563PFEKkPV5AuKUO/u74aIjhhtGMJDjDgM0jKU3nSjSFjaODPX3UPFuHuUPYYk2Iv/Oid5Q==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AM9PR10MB4104.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1f2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Sun, 3 Mar
 2024 13:18:13 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c496:afda:bc34:6b5e]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c496:afda:bc34:6b5e%7]) with mapi id 15.20.7316.039; Sun, 3 Mar 2024
 13:18:13 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	=?utf-8?B?U2ltb25lIFdlacOf?= <simone.p.weiss@posteo.com>, Steve Sakoman
	<steve@sakoman.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: RE: [yocto-security] OE-core CVE metrics for master on Sun 03 Mar
 2024 01:00:01 AM HST
Thread-Topic: [yocto-security] OE-core CVE metrics for master on Sun 03 Mar
 2024 01:00:01 AM HST
Thread-Index: AQHabVySrfAmIzWQP0ec2Gqqj5uz17El5wCAgAAM8oCAAARvEA==
Date: Sun, 3 Mar 2024 13:18:13 +0000
Message-ID: 
 <AS1PR10MB5697DA05C2BBC97F0BAFF040FD5C2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240303111845.7A4DE106912@builder.sakoman.com>
	 <f9e113a874a6c71e73bed3a062da1b06520dcabb.camel@posteo.net>
 <d30f4cd0293437624736e21d82d14081f0c23d48.camel@linuxfoundation.org>
In-Reply-To: 
 <d30f4cd0293437624736e21d82d14081f0c23d48.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=8d1cb1c1-5f57-44eb-8b2c-0b0fe23d8fbb;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-03-03T12:51:47Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AM9PR10MB4104:EE_
x-ms-office365-filtering-correlation-id: d3890ab4-9f1a-4d35-cab5-08dc3b846158
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7p+MFqI1dUpTk0112Kuff+jEdDvmwOZWPbdnBpcs4nBzTQ9Kt1hkehkIzM8lCSxEc/I2NpIbIetFynIylhfCI12ATV+XHgPwnTtD11Acz7uypNyk6pEhgunmRwHDkkaSvptyNBu0NFtpII06jyA2749F9jTYfvdjeFP3LjL23bciwruBZd6G2qQWr5zdb8QYN0+88g+RUbkZwwcAcYgckKQAcUVp6H6BhU2QhG4W4WUCusRZV/TvhjsgQIt1s4V++MLmJxBQQHvbqjX4KMvu0viT2VkyTWbsUsWL2x0ib2mn82AD5103cuDPqKMi71cNesNw2w+DxFpIJj45eNPpmVVGpn+sgk5ddkzJHQqGlml3L81NpHdN6XlhONMxb1FPNxLCR3kyVMlSgtEG8zxUAJTqQQQpDmkByQ9/P81Q0PrtmFM0PJUlr/mGqrQwMr6ggWTAvfWuXxCeSGOwW/ze1A80iYYQAg2ZdivGBmtMtKFqmTsrFQmRMNsMm2k1gBJWf1wcBpb5y4cc16vO8GOeDTDq4g3nFkQeCdhUGF//q3nAUvJ2kWsNjJ/Pmdycuaf4Xunyu3+3d7sC0tQUxDWnRRhPXqkea5/meYscEJmWGgZnmImEqfuA9eagEKBEfgI0KwPvc/yMAAgVQxTfCOTnStlcW8Pb7JxqLAaQ3n55cH4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eWVZOG1lVFVBWGhtcDlEemhQZjRPOEcyUU5PRm5SZFU2TE1HbEUyUitOL3NP?=
 =?utf-8?B?Y2NQWWFueGZoY1FNZUxSTFhGbk9SZ2dIUkhsa21SZXZyVW9vOGpIN0hnb2oz?=
 =?utf-8?B?SHJicXViSENJUEkvWDdyLzRKbU1RMmtLbDBnQ056NzNsZk8rUEZ2dEsrbFN3?=
 =?utf-8?B?SGJrUWdUWFRweDBFWlhlSVBma0xwT3NVblBXMWJQVDJaZ2ovcDd1Z0k2b2Fz?=
 =?utf-8?B?SXE5dUlSeVBPNCtmY2FxYUIyVlhsOFBydWd5RWY1aUwwR0NYbTdHYmN5U3Bz?=
 =?utf-8?B?ckxQMWJncEVOL2VJd0lEZ0F5K3YxSkF6Z3RUbDdYM3IxeEVsNVpsK054NGg0?=
 =?utf-8?B?YmFab2pReDZ4UTUrSGpqY2dDcGpHbjdDNVlaRURQbFUvTklQWnpQT05oUGYw?=
 =?utf-8?B?ckxzRHh3Tk1pdVUzMUFOencwZitSWmo4eVY2ZENyYlFRNFlKN1IveTdjT09u?=
 =?utf-8?B?bmtVVjlxVHJIVUxlcFlhZEkxYU5wWXBLcFBOR1crNjNkMFRXS2o2aEY1akgx?=
 =?utf-8?B?aTJHaGpnQ0RXOTlxeHpSWnVpZERDYjdJdDNTN05KWXRsNkVnbElYY2EwdjZp?=
 =?utf-8?B?Z1EzOWtqSVV5Z2dTU0YrcnNwVGFWelhkQmRMRlp5REFoTS9yaldSUUY3WHFC?=
 =?utf-8?B?VnF0dW5LTmUzU25sYWU5M2xaa2N2VE1SRmRoQmJ6N3BOaUNaaDQ1b0RJSkJx?=
 =?utf-8?B?MTRsSkU2SWZhanVIa0pxa0lxRzVuWFVqSmVrYTFhOS9mR2daZ041clJnODl1?=
 =?utf-8?B?SzZSeHlmSE9wZkxNOGZWWkVmcDQ4TEJJZ3U4TG5Ua0M5V0M1Z1JOVFAwbnpo?=
 =?utf-8?B?S2FTNUVwRUZFZk5Uc3VyKzZscXBpVExUTmVnQW0xRnZYTGpDNk1UcHVoUldT?=
 =?utf-8?B?UVhzbVVBdWh1YXEyNnYvOU9nSVVGeU5qVCt2UVVXZVF0T1FrZUFUclBSaER6?=
 =?utf-8?B?S0F3NENkKzdxcU9wSmFTeUlxdVZBQWVWRGIwQTFxYS90M05ESllEOEQ4KzRQ?=
 =?utf-8?B?TTAzSEo1eStxZzZLbW1DQkhNUmFCWFBSMlRuNEFXMGpLVk5taE5uWlpIQkxo?=
 =?utf-8?B?NUU0bFBLVTNiMGpDM3NpcFRFZXFiaVpJVW9saTF4Q0NWZWl1eGJvRVg4dEJw?=
 =?utf-8?B?VDZlZ0xKY0UvT1VCOHlDRXBGeHlzUWYrR2pDOW4xanlVaTVnUHNSbkFmd0Rq?=
 =?utf-8?B?Q29kZ2plRWRZcGxWSitsWmp0c2Q1czE3czFvMGVzTGIxTm1PZ2dmMkN0aUho?=
 =?utf-8?B?UDhUM2JLaENQc3J4SlRFU0RkSEV0d2o4MDZEcjVaY2VjMFFZVDZMU0g3b0hE?=
 =?utf-8?B?a2VuL3hZT2wxZElWdDBSVExxU1pJdGQ3a0dQVnErRk1iYlUzRWwyNFNpalEr?=
 =?utf-8?B?dytQbzlXYTFSTm5sV0gxZlJFMVZSaWlJbFFVdFcyTkFEWXRTV2V5SWRtNzA5?=
 =?utf-8?B?MDJHUjg1NTFnTExkL2xqM2txeVJWd05Bc3lEekNhc25USEVObXNQWjFLSVYv?=
 =?utf-8?B?SDVsMktDeHcybXlZUDFDMXU1Mmx6emlRTi9YeW5ONlFlZCtVYm05SHdnZWN5?=
 =?utf-8?B?K3kvWkdrZFphYytxSWVCZTJnMzRscHZFcG9iRVAyZUYxOE1yNythZWIzSU1K?=
 =?utf-8?B?d2hYVUJTdTRNT200cU54RWJtWFQvRlFYYmF6TzI3d2hvdmtTWkZYMlV0eFE2?=
 =?utf-8?B?WFA4VG1MUU0rbTJWSkVzc0UyWmZsdDhYMEJHaDVaZi9Oc1dZV0FRWGYyUC9u?=
 =?utf-8?B?R2ZIQVJSZTdtbC9qYjZ6YnRQNnJFOEJVRnNEMlBaU2xQSENQNWIzWndpa3pM?=
 =?utf-8?B?NnVISmdFRWZJbkJ1UVNGcDNlNTI4d3ZrRTE5emk4RElSV3puTWUzY21idHFJ?=
 =?utf-8?B?RzZ5cUhKb1YwRFpxTE5XZm9hWi94eHlnaFdLVzdRU2psZmk0UnMvaHFUR0Q5?=
 =?utf-8?B?T3BaSy83aTZ6VU5lemttVTVOQWhURVQwblNkTFBvZ2xReHBPdUVBV01kcThn?=
 =?utf-8?B?SzdrTE43YWF0V1owY0V6VjlmdmpFY2Rlc2daSEZDTWRqQ1V6MWd0TXNkaG13?=
 =?utf-8?B?VC9zYU94TDQzMnNVRDBWdVhVMTRSYjJiNzlkdjRybU4wWVkvN1JQd25kVkQ1?=
 =?utf-8?Q?hW0JBwpMSFpgU6MBqpCI9C8C6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d3890ab4-9f1a-4d35-cab5-08dc3b846158
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2024 13:18:13.4623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /NatS+myUM1KCkHG2wNhTOP4qvejEMfLuyLCarGojcOfblKmiGz6ZUp2ecyWCTIvTbrIhZxU7qViJw+V0YRNow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Mar 2024 13:18:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196562

SSBhbHJlYWR5IG1lbnRpb25lZCB0aGlzIGxhc3Qgd2Vlay4NCmh0dHBzOi8vbGlzdHMub3BlbmVt
YmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTk2MTk5DQoNCkkgdGhpbmsg
dGhhdCBwYXJ0aWFsIE5WRCBEQiB1cGRhdGUgaXMgbm90IHdvcmtpbmcgcHJvcGVybHkgYXMgdGhp
bmdzIHdoaWNoIHdlcmUgY29ycmVjdGVkIGJ5IE5WRCBhcmUgc3RpbGwgc2hvd2luZyB1cCBpbiBw
YXRjaG1ldHJpY3MgYnV0IG5vdCBpbiBlbWFpbCByZXBvcnRzLg0KDQpGb3IgZXhhbXBsZToNCmh0
dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMy02
Nzc5DQpodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZF
LTIwMjMtNjc4MA0Ka2lya3N0b25lIGhhcyBnbGliYyAyLjM1IGFuZCBudmQgcmVjZW50bHkgZml4
ZWQgdGhlc2UgdG8gPj0gMi4zNyBhbmQgdGhlc2UgYXRlIHN0aWxsIGluIHBhdGNobWV0cmljcy4N
Cg0KRW1haWwgcmVwb3J0cyBtYXliZSB1c2UgZGlmZmVyZW50IChub3QtYnJva2VuIHlldCkgTlZE
IERCIGNhY2hlIG9yIG1ha2UgZnVsbCB1cGRhdGUgaW5zdGVhZCBvZiBpbmNyZW1lbnRhbD8NCg0K
UGV0ZXINCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IHlvY3RvLXNlY3VyaXR5
QGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgPHlvY3RvLXNlY3VyaXR5QGxpc3RzLnlvY3RvcHJvamVj
dC5vcmc+IE9uIEJlaGFsZiBPZiBSaWNoYXJkIFB1cmRpZSB2aWEgbGlzdHMueW9jdG9wcm9qZWN0
Lm9yZw0KU2VudDogU3VuZGF5LCBNYXJjaCAzLCAyMDI0IDEzOjM2DQpUbzogU2ltb25lIFdlacOf
IDxzaW1vbmUucC53ZWlzc0Bwb3N0ZW8uY29tPjsgU3RldmUgU2Frb21hbiA8c3RldmVAc2Frb21h
bi5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyB5b2N0by1z
ZWN1cml0eUBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQpTdWJqZWN0OiBSZTogW3lvY3RvLXNlY3Vy
aXR5XSBPRS1jb3JlIENWRSBtZXRyaWNzIGZvciBtYXN0ZXIgb24gU3VuIDAzIE1hciAyMDI0IDAx
OjAwOjAxIEFNIEhTVA0KDQo+IE9uIFN1biwgMjAyNC0wMy0wMyBhdCAxMTo0OSArMDAwMCwgU2lt
b25lIFdlacOfIHdyb3RlOg0KPiA+IHF1aWNrIGNoZWNrOiBObyBuZXdzIGZvciBhbnkgb2xkIGlz
c3VlLCBleGNlcHQgY3Bpbywgd2hpY2ggaXMgZGlzcHV0ZWQgDQo+ID4gYnkgdGhlIG1haW50YWlu
ZXIuDQo+DQo+IFRoYW5rcywgdGhhdCBpcyByZWFsbHkgdXNlZnVsIHRvIGtub3chDQo+DQo+ID4g
DQo+ID4gPiBGdWxsIGxpc3Q6wqAgRm91bmQgNDEgdW5wYXRjaGVkIENWRXMNCj4NCj4gSSdtIGEg
Yml0IHB1enpsZWQvd29ycmllZCB0aGF0IG91ciBwYXRjaCBtZXRyaWNzIHBhZ2Ugc2F5cyA1MCBy
YXRoZXIgdGhhbiA0MToNCj4NCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0by5pby9wdWIvbm9u
LXJlbGVhc2UvcGF0Y2htZXRyaWNzL2N2ZS1zdGF0dXMtbWFzdGVyLnR4dA0KPg0KPjovDQo+DQo+
IERvZXMgYW55b25lIGtub3cgd2h5Pw0KPg0KPiBDaGVlcnMsDQo+DQo+IFJpY2hhcmQNCg==

