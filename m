Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF115F44872
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 14:06:53 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.35])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.156971.1775830011871784674
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 07:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=SuFHGMMJ;
 spf=pass (domain: siemens.com, ip: 40.107.162.35, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xL3qnj1C0MJ0BtszPPYpDSjll+cszK7C1vtA16xnyMHM/UoU5Jn5Iqo9khUrpkKvogW99j4tr090MuClzwzILDNvkCbWLbJwmQlJS23dPp782uh9+I62FXC+5qfQ9vckRT56VWvohtVJGD0IXOFShUc2vpqfRzEMANBJvsvgfr1QVRzDlwFl3bm9fqHHdI3bgAmloNnFSfy2fjvM99EhAqGhIFYQb2RRJfGKEbu32wEiB/ZOtAv94xgaepgFb1ryEXVFzoYcwxkrvWnhMpEgxnYF10OS3TY6RM05UQUb0WgOg2IxDfLHqk20RVhj4ELTvboWUhE1LOlwNWDaFRBH4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GdCygUTUGe1F5wraEzvBlCK2FUa7H5FP0maXCiVYBcM=;
 b=ZUWasJypPzEO7E0rP0nwoHbrdORHFKSWCQhuPGre5LnZdiQdYBjSSwSWNwGNA1MrxR2J1a7RBMI+yBCQo0Gi8unVY0xQ1cdWGEHyavgPzKLSt987WFNfbyGNgvtJMnQFq86d3YvudAbYWgT5XuZd48Jk/wgOg6j/tbJ0SLmYyM0am2R2jD3dmcx5b2Pn88Z+6vQntM5XbjRuejG/qOszlNagnIZHtiko+naaA+ADPWDdk/CXsrVOcIVj4GkNDXfHeYC1pXCaGovf0yGiomy5gNkLgkgKyyQ3Ii7Jq6WRUpmlgjJZV/Tt/tDb38E06qNZH12TuwpuLeifgAcFJTCC5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdCygUTUGe1F5wraEzvBlCK2FUa7H5FP0maXCiVYBcM=;
 b=SuFHGMMJB6swEgoarc6GrADKDNoowmxlDnose/i/OOGB04vM097F/QzDQnqBsxyo/T0AM+YjYvRAXUxxnIfTFK3MDAZV+9CeDtD8ZP6lscy1GcPiXdoiO2CMOuF35JBOgWCg9vtYBjCSw3o1W3GgP5kJ81GPJpxyi73etk8f4ZY3rqNhTdY2xEMpQdBPuTsnYu0LM2A13Q907PsqLqqbJD98yzBTTdS6o5JqNEVZvsHoCddRBz/VgwGmtXROl0SfBsPggCYvYPW4iO6tJbXqm1ANT3MOYqm7uxC1IrLLEdTqIps9P2mm0cBCDCIp6fMYocmZTNJn0ObIdCVO/03r7Q==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PA2PR10MB8992.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:422::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.44; Fri, 10 Apr
 2026 14:06:48 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9769.041; Fri, 10 Apr 2026
 14:06:48 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>, Patches and discussions about
 the oe-core layer <openembedded-core@lists.openembedded.org>
CC: Benjamin Robin <benjamin.robin@bootlin.com>
Subject: RE: cve-check vs sbom-cve-check, redux
Thread-Topic: cve-check vs sbom-cve-check, redux
Thread-Index: AQHcyPEcHfk74ge+GEKe4KvI0SFZ1rXYU8EA
Date: Fri, 10 Apr 2026 14:06:47 +0000
Message-ID: 
 <AS1PR10MB56975389F54123AB6CC84424FD592@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <EFA287EA-FB51-4610-8DD9-A0BB8541808B@arm.com>
In-Reply-To: <EFA287EA-FB51-4610-8DD9-A0BB8541808B@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=0216403c-7b1e-4e13-9b7a-8ee7598ee825;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-04-10T14:03:33Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PA2PR10MB8992:EE_
x-ms-office365-filtering-correlation-id: d893e134-7d43-49f5-d725-08de970a67d5
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|55112099003|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: 
 v62vBjZ049e7sj+TwAVxy1FVbHkM47NyUpMlGsv908Yph96z7yVFVC40xu+PIAcuMPirL0cCsyAYpqTF8Mu5BH5/6MlmCbpydpfjoO4HrcXXygEtPCEhPaoofqr8A25HOGRUZPzIZoGZFNdRTIlacrtAHDtQwST39FvHDUQa+1ud+5RVlTU5e/2ss5xNEcKEGgik1tXxrxgO1sF6AbUs9+qL/BAXDweLSH4oNnYLrc4rcT5wI8kJXcQN3raA+/+Lqz+A1LwLsOqRdMuJGKdpt/idK8IFuDJYotb6cn9DBuk9zgZ9k0Gs6IYY9Q3tqpeP0QoVFZaX2q00SWiXiOywhJ15RRLEk3OQ2oxOpQ1InhEqvmoEsIOniS+sa00WFyN4nXyA1IEzymriSvZrxHTmpGt15zU+PUA0//DjUL4nkh/K6uk33pGApXPdSTJN90szgMIzFiS5/k1BKYbKojrhkiUcY425FK+keTiOqa514FR4cuvYsYHtUzH27PX71e3dfJnxUb5pH67IRvOV0pVFx+HMb2NJC3QxdbjwHlj+PF7tLHmriS78CV6RqhJvO6XmycWitm6br56BnIsCfWcd6J4hIiqH2WM8VoBKJc/GKzJKUZQoKdOrWfMgjNzVGsV6d1kJ/6kO1csrWn4tMEZFIGmI8/h8nJ7kr6zYi35n3bL2y/jh1xMfu6HlCwNR1E4gcqgQIfMctuj+EVP967SYOSKigK632YoUMVh+m035LUE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(55112099003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UWFQVnR4QzBZU081SDNsRDFpdVRVc1IrMHNJV2plVTd6Sm9KN0JUZlZPMnR4?=
 =?utf-8?B?K01wbnB5YnZsZU5aN2tMQTVvOTFQRGw5blVDL0dlSVNTV28vLzBCa3hyL3hR?=
 =?utf-8?B?QzF6TTZwazBoLzFzc2dpeXBOZzByMTVyemhqS2ozS0s4by9BNldKR0dyT0dZ?=
 =?utf-8?B?cDRQMjEwOWd0Qjh2U1RQK0thTGprcHdNbUw1a3dXeVZtM2xSbXhmKzJhQ2dD?=
 =?utf-8?B?LzZwdnN1cVFXNE1KYmFXbHR2ZVdWMWYwbllVdGtDY280ZkpHVnhoMW1RcThL?=
 =?utf-8?B?a1lkemZweUgxUktOelpjMGhVY3RTUk4wRW04Nk55eXdKakluU28ySDNUT3Rk?=
 =?utf-8?B?UWdON011UWhsTEo4L0IvYWZrb2xIakF5ZDB2dXlCd1F6R2xCWGtlUk9XTU1y?=
 =?utf-8?B?alNramJodmtrV0s2TGRsdkIyODBTRmJQS0xLeFRzVEZCRlhNaStQTEFDSW5U?=
 =?utf-8?B?b1NWanZnTmlaMEplcjdSdExKMDRmMnArTkdnMXR5TUN5SHkyd0dMWEtyaFYx?=
 =?utf-8?B?Y0xCS0tQY0RXTEdQam94UUZOM2NtakZWdlcxVTdJaGV6ek1DdGQzZ1paVmZ0?=
 =?utf-8?B?WkdEdEJJMDN5YnRHazVxZWFyaVpSMmVvKzVKUmI4cGxRWmVVMTM2bHJjM3g2?=
 =?utf-8?B?S3ZCVDloQlNQc0hxM1RhK1RCVk9ra0gwY3B2bUJHb2lDSERxTm1ZMko0ZkN4?=
 =?utf-8?B?RFAzQWExRnVFMm1uUytPY3E0MVBqWjcrZzBYUWpoc2d4N0xPMFUwdVB6bWJP?=
 =?utf-8?B?ZjgwTXdDU0kxV0RmMjZTazZLYTdiTzh6VW94VHo1aFdUUkpXcmRSVzlrU1dt?=
 =?utf-8?B?bUZ4cjYzVENqbnlqekpRS29mVXJPcWNsMFBORzd5NlBaNGF4N1FUNjRSQnY1?=
 =?utf-8?B?c0UrZmROUUVsU3RuMmU4RGJSajdiakJOS3ZCUHk3N0NMclVhTCtYWjhNdHcr?=
 =?utf-8?B?YklYUThoejNjNUhpamhwVXdFWk9GMjlHUUJKNkR3dXZpcWMrVnFiZWd6VEZZ?=
 =?utf-8?B?WDZkUFdYbDJlTURoaHhXUDRuNExaWTVEMkc5UmVicWZFSTlqMkNFTWhab1Jv?=
 =?utf-8?B?U2pYM29ZSEo4cjZQMThJcER5UkhoODdiZC9LZTFDSTh0ajVMM3dPTjNPcjNK?=
 =?utf-8?B?R1lHb0publB4MXVRSk0zTnhDM3RVMVZFRFhCQUEzU2wrajRjdzBEYnRiL0po?=
 =?utf-8?B?YjhCaXpMSlpnK2R5ZXZON3gzQmZDSzBzdDk0czhiVzhtYklMaS9MK2l3RUtV?=
 =?utf-8?B?bWdsUFkrd0VVeWNLSkxTYTREZzJMdENJNEJNbVFad0VMSlRjUnhLOTlYTWNB?=
 =?utf-8?B?UEhOcmFiNFZGVnkyd3Rkby9MbGFhS0tYTFZUVy8rOHRrNG9JanZXNnJtU0ZN?=
 =?utf-8?B?ZG9xOVBrdThZZ09CVEFZRDdQOC9aakg3Y2xwRlFxT2pLb1pzTzNaVzgrZE9m?=
 =?utf-8?B?c0JFWGVHa2wybEtTOG5RK1ZqWWhFaXNNRDFKTWU1RDFESUU2cGpGUnJJZ3B2?=
 =?utf-8?B?UXNOaFpDMWExeXZnUFZjT2hHZG0vWlB6Z1FQMklVaUlZQVdpOEFDUy9ueHRW?=
 =?utf-8?B?TzFpNGR5b3lKNHFWQkhmbFQwbVRYYUowbGxXN2pydEMvTmFKVHlHcStNc3Rs?=
 =?utf-8?B?TWx0bUEzRHpRNjZBSERoeUd6N3ZQa2x2UGxubUw0YnNXanJCNGIxTDZYSy9h?=
 =?utf-8?B?ejc4eE5oK0VmN0hJWXdPeUE4eG5VUS9mNEgyL3JUalgybHo1MlNhWCs4YXFI?=
 =?utf-8?B?emRCVlpZWDRGT1UweTZiMjJlUm8wYklDK1N5dDBVS2xrMVRVRXVDa2R5ZFht?=
 =?utf-8?B?SUdLb2wySnA4RFdtWTV1WmdxZmpWK0lkb3RBVDdXWWZVcHNxUzdKTjhvYkxB?=
 =?utf-8?B?UDczMnRUanB1Ym4rc2dTTTM2eCtqa09DUDd4QTgvZnJFVUk5cWNmUzFXRUc2?=
 =?utf-8?B?NitNdWJWSUoxM09rbnp6bVAzUUNTV2EwTmJVNjVmZWZJMWkyc1hxWUFFS2tC?=
 =?utf-8?B?c0tSMThWcmFCUml5TVF0UnpXM1hvY3pVWFNZTkdxUytzL3VraDFhbWxUL1JM?=
 =?utf-8?B?MjRwTlJWZi9BbndpVjFSZllsQzMvWk5TbDNHS0tXWjBORXNiakEwTDMvNlhR?=
 =?utf-8?B?YlhmTWwwWUwxZG5waHoyNUxkaVpNVEZOQ1hJeTVPTXlmUC9SWnU4UDVmeUFC?=
 =?utf-8?B?aDJMZmtQWks3NFhsMmZKeVJsQkY0b2VUV0dQcW9PWW9EODFIMnVqWjN2U3FK?=
 =?utf-8?B?VjB4QXJ0SnhiS1ZxeFUyOUpqT21hQUY3eTYyR1FlRmtQMXJaclNpMStBZ0RK?=
 =?utf-8?B?TnkvalloQ3RxYlkxcGw0VjcwT05QTkhLZVBTWVJWQzlCVVc0RFl3UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d893e134-7d43-49f5-d725-08de970a67d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2026 14:06:47.9788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: frhHNqaIXOGg4E8gClejh6EE+WaLp8C+MrIFeWM+mAFwhCbBGySstOc4UcZ7dOcl8jTKcG/m+TGHQubmhXLDCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8992
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 14:06:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235035

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBSb3NzIEJ1cnRvbiB2aWENCj4gbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KPiBTZW50OiBGcmlkYXksIEFwcmlsIDEwLCAyMDI2IDM6NTEgUE0NCj4g
VG86IFBhdGNoZXMgYW5kIGRpc2N1c3Npb25zIGFib3V0IHRoZSBvZS1jb3JlIGxheWVyIDxvcGVu
ZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCj4gQ2M6IEJlbmphbWlu
IFJvYmluIDxiZW5qYW1pbi5yb2JpbkBib290bGluLmNvbT4NCj4gU3ViamVjdDogW09FLWNvcmVd
IGN2ZS1jaGVjayB2cyBzYm9tLWN2ZS1jaGVjaywgcmVkdXgNCj4gDQo+IEhpLA0KPiANCj4gc2Jv
bS1jdmUtY2hlY2sgaXMgbm93IGludGVncmF0ZWQgaW50byBvZS1jb3JlIGFuZCBhcyBwYXJ0IG9m
IHRoZSBtaWdyYXRpb24gSSBwb3J0ZWQNCj4gdGhlIGRhc2hib2FyZCBtZXRyaWNzWzFdIGdlbmVy
YXRpb24gdG8gdXNlIHNib20tY3ZlLWNoZWNrLiBMdWNraWx5IGl0IGhhcyBhbiBvcHRpb24NCj4g
dG8gZ2VuZXJhdGUgb3V0cHV0IGluIHRoZSBzdHlsZSBvZiBjdmUtY2hlY2vigJlzIGJlc3Bva2Ug
SlNPTiwgd2hpY2ggbWFkZSBtaWdyYXRpb24NCj4gcmVsYXRpdmVseSBlYXN5Lg0KPiANCj4gQSBs
aXR0bGUgYml0IG9mIGpxIHByb2Nlc3NpbmcgYW5kIHNvbWUgbW9yZSB0d2Vha2luZyB0byB0aGUg
aW50ZWdyYXRpb24gbGF0ZXIgYW5kIEkgd2FzDQo+IGFibGUgdG8gY29tcGFyZSB0aGUgb3V0cHV0
IG9mIGN2ZS1jaGVjayBhbmQgc2JvbS1jdmUtY2hlY2suICBTb21lIG9ic2VydmF0aW9uczoNCj4g
DQo+IC0gVGhlcmUgYXJlIGxlc3MgbmF0aXZlIHBhY2thZ2VzIHNjYW5uZWQgaW4gdGhlIHNib20t
Y3ZlLWNoZWNrIHJlcG9ydC4gVGhpcyBpcw0KPiDigJxpbnRlcmVzdGluZ+KAnSBhcyBib3RoIHNo
b3VsZCBiZSB3b3JraW5nIG9uIHRoZSBzYW1lIHJlY2lwZSBsaXN0ICh0aGUgd29ybGQgdGFyZ2V0
KSBidXQNCj4gY3ZlLWNoZWNrIHdpbGwgcmVwb3J0IHBhdGNoLW5hdGl2ZSBhbmQgcGF0Y2gsIHdo
ZXJlYXMgc2JvbS1jdmUtY2hlY2sgKGFjdHVhbGx5LCB0aGUNCj4gd29ybGQgU1BEWCkgcmVwb3J0
cyBqdXN0IHBhdGNoLiAgSSBzaGFsbCBmaWxlIGEgYnVnIGFib3V0IHRoaXMgYnV0IGRvbuKAmXQg
Y29uc2lkZXIgaXQgYQ0KPiBiaWcgcHJvYmxlbSBhcyBldmVyeSBuYXRpdmUgcmVjaXBlIHRoYXQg
d2FzIG1pc3NpbmcgYWxzbyBoYXMgdGFyZ2V0IHZhcmlhdGlvbnMgdGhhdA0KPiByZXBvcnQgdGhl
IHNhbWUgQ1ZFcy4NCg0KU21lbGxzIGxpa2UgImFzc3VtZS1wcm92aWRlZCArIHJlcGxhY2VtZW50
LW5hdGl2ZSIgdG9waWMNCg0KPiANCj4gLSBUaGUga2VybmVsIENWRSBsaXN0IGlzIG1hc3NpdmVs
eSBkaWZmZXJlbnQuIFBhcnRseSwgc2JvbS1jdmUtY2hlY2sgcmVwb3J0cyBhIGxvdA0KPiBtb3Jl
IGlzc3VlcyBhcyBpdCBsb2FkcyBpc3N1ZXMgZnJvbSBjdmVsaXN0djUgdW5saWtlIGN2ZS1jaGVj
ay4gSG93ZXZlciB0aGVyZSBhcmUNCj4gc29tZSBpc3N1ZXMgd2hpY2ggZG9u4oCZdCBnZXQgcmVw
b3J0ZWQgY29ycmVjdGx5IGR1ZSB0byBhIGJ1ZyBpbiB0aGUgdmVyc2lvbiBoYW5kbGluZw0KPiBp
biBzYm9tLWN2ZS1jaGVjayB3aGljaCBCZW5qYW1pbiBpcyB3b3JraW5nLg0KPiANCj4gLSBTb21l
IENWRXMgYXJlIG5vdCByZXBvcnRlZCBkdWUgdG8gYW4gZXNjYXBpbmcgYnVnIGluIHRoZSBTUERY
IChzcGVjaWZpY2FsbHkgdGhpcw0KPiBoaXRzIHJlY2lwZXMgdGhhdCBoYXZlIENQRXMgbGlrZSAi
Z3RrKyIgb3IgIndlYmtpdGd0ayvigJ0uIEkgd2FzIHdyaXRpbmcgYWJvdXQgaG93IHRoaXMNCj4g
c2hvdWxkbuKAmXQgYmUgZGlmZmljdWx0IHRvIGZpeCBidXQgQmVuamFtaW4ganVzdCBzZW50IHBh
dGNoZXMgdG8gZml4IHRoaXMuDQo+IA0KPiAtIHNib20tY3ZlLWNoZWNrIGNhbm5vdCBzY2FuIGEg
c2luZ2xlIHJlY2lwZS4gIGN2ZS1jaGVjayBjb3VsZCwgYnV0IHRoZSB1c2UtY2FzZQ0KPiBmb3Ig
dGhpcyBpcyBtYXJnaW5hbC4gIFRoZSB1c2UtY2FzZXMgdGhhdCBzYm9tLWN2ZS1jaGVjayBleGNl
bHMgYXQgYXJlOg0KPiAxKSBXaGF0IGlzc3VlcyBkb2VzIG15IGltYWdlIGhhdmUgKGJ5IGxvb2tp
bmcgYXQgdGhlIHRhcmdldCByZWNpcGVzIGluIHRoZSBpbWFnZQ0KPiBTUERYKQ0KPiAyKSBXaGF0
IGlzc3VlcyBhcmUgdGhlcmUgaW4gZ2VuZXJhbCAoYnkgbG9va2luZyBhdCB0aGUgd29ybGQgU1BE
WCwgaW5jbHVkaW5nIG5hdGl2ZQ0KPiBhbmQgdGFyZ2V0KQ0KPiANCj4gLSBTY2FubmluZyBpcyBz
bG93ZXIgd2l0aCBzYm9tLWN2ZS1jaGVjayBjb21wYXJlZCB0byBjdmUtY2hlY2suICBJdOKAmXMg
YWxzbyBkb2luZyBhDQo+IGxvdCBtb3JlIHdvcmsgYnkgaGF2aW5nIG11bHRpcGxlIGRhdGEgc291
cmNlcyBhbmQgZG9pbmcgYmV0dGVyIGFuYWx5c2lzLiBJdCB3b3VsZCBiZQ0KPiBpbnRlcmVzdGlu
ZyB0byBwcm9maWxlIHRoZSB0b29sIHRvIHNlZSBpZiB0aGVyZSBhcmUgYW55IHBsYWNlcyB3aGVy
ZSBwZXJmb3JtYW5jZSBjYW4gYmUNCj4gaW1wcm92ZWQuICBBcyB3aXRoIHNib20tY3ZlLWNoZWNr
IHNjYW5uaW5nIGlzIGRvbmUgb24gaW1hZ2VzIG9yIHNwZWNpZmljIHJlY2lwZXMNCj4gaW5zdGVh
ZCBvZiBvbiBldmVyeSByZWNpcGUsIHNvIHRoaXMgcGVyZm9ybWFuY2UgaGl0IGlzbuKAmXQgYXMg
bm90aWNlYWJsZS4NCj4gDQo+IE9uIHRoZSB3aG9sZSBJ4oCZbSBzdGlsbCBhYnNvbHV0ZWx5IGhh
cHB5IHRvIHJlbW92ZSBjdmUtY2hlY2sgZm9yIHRoZSBuZXh0IHJlbGVhc2UuDQo+IA0KPiBGaW5h
bGx5LCBtYW55IHRoYW5rcyB0byBCZW5qYW1pbiBSb2JpbiBhdCBCb290bGluIHdobyB3cm90ZSB0
aGUgdG9vbCBhbmQgaW50ZWdyYXRpb24NCj4gY2xhc3NlcywgYW5kIGhhcyBiZWVuIGluY3JlZGli
bHkgcmVzcG9uc2l2ZSB3aXRoIHF1ZXN0aW9ucyBhbmQgaXNzdWVzLg0KPiANCj4gQ2hlZXJzLA0K
PiBSb3NzDQo+IA0KPiANCj4gWzFdIGh0dHBzOi8vZGFzaGJvYXJkLnlvY3RvcHJvamVjdC5vcmcv
IGlmIHlvdeKAmXZlIG5vdCBzZWVuIGl0DQo=

