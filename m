Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93771CD343F
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 16:57:57 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.743.1778173070815299045
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 09:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=BrLRnFz7;
 spf=pass (domain: siemens.com, ip: 52.101.69.45, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zdczz+Lpd+KeC8xgC77hZ5hvb9wdpyiS0WfvjPL/R0iyBeOnrCvjHxAL/MdQp8I1DC/t4pwQ8Lb0yQigWJ2ZGsqLTO5U7k+ReTc0fedx14uhVNcsFDFdDmLTL3aVkVDEVQQ82KDe6x6Km1ZvVr6QJtUEgBcUlR4hRu2DO2HojnQP+hUbI8230dk8JHCQCs0xVb0UebRHGUSNKI7BGguZMkfmHr9lFR9xDKPEyhuT4zYiN3abkGjhhUJ0UArL6855ZmlfqRLmUGLF+xI4u3A6c9xGKJSliY1rquI58DoZCVPHNIrCqhQMefzCaX1ZWXEMqHYHLrRtECMMAfig5WC4zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOqsWV9y4BdBSWFzyWef56LplmrY2XIEHnt98ZEBUOk=;
 b=HMPkIG7ElWjADW1BedCZPkfIuQNQdwHG7j3BOEyq1UjIfmqCBcrc3UI8tJubt4DDJ52GduByiPDINz7MgaKcZW6oT3X3tIrxukrp0hj/fs348u2BctpLWMRa2CdgDHatm7a+CQYgNq+7qHfD1LUfa/cf7Cks/5CieX5Dc6tNc9Xt5VNwGuC6Afl4HR8emVpOO2LrjOQNV+q3T9lot81TGfh8an5yTjMm932v0yAHtkp6Z7YR+/Af0jRqF8x9+kxO8RhAimOvjwllHA3zJZGAxSObc4y6K90oRBsHY3qZuAwpW/duYNhjQtShuczcflwyhRZKO+OzdbGQdbZ8+W1awg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOqsWV9y4BdBSWFzyWef56LplmrY2XIEHnt98ZEBUOk=;
 b=BrLRnFz7g799A8aa2fS+14bvjLtX8NNapweb19Z+KD0JVhx+OpGyV+qyZ1Q2E8JA0paenY4ifbHIGqobkJvGWWMHZXAXqqwMoCRq2vg4LIKBHkck/b/r7k1ZW2lyjqdfzbRv3Zi8OIKKI4lfjA0k+2tN72/oRqI1665m+UdmF1vqaFnzZSOqyTkm9peImA723E679FMaOwNyCm/yp3n5f5weSiEj8dHgZjk0v+hQVnCSEfIAOdsH9B5YJClFNOxnsWqolHB3R74gZaLJSgavJ4Pmszg5NicbDgp8eG8ihBs6+RKOi8p+bR2PBMcFkoygXfuMHBAXkmtq8sdaDXv6Yw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU4PR10MB8757.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:569::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 16:57:47 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%4]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 16:57:47 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH 0/3] sbom-cve-check: Update to version 1.3.1 and update
 CVE databases
Thread-Topic: [PATCH 0/3] sbom-cve-check: Update to version 1.3.1 and update
 CVE databases
Thread-Index: AQHc3j7OWms8rA6jH0mhPkm6DaLiWLYCx/0A
Date: Thu, 7 May 2026 16:57:47 +0000
Message-ID: 
 <AS1PR10MB56978E2A173EF807CBAADF31FD3C2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260507-update-sbom-cve-check-v1-0-3c398db78f5f@bootlin.com>
In-Reply-To: <20260507-update-sbom-cve-check-v1-0-3c398db78f5f@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=b518b3d5-461d-42dd-9c22-7cd9e749545f;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-05-07T16:54:59Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU4PR10MB8757:EE_
x-ms-office365-filtering-correlation-id: 2aef946e-3bca-4a8f-b771-08deac59c3dc
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|55112099003|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: 
 cmYBQ9KhUuUcxonYbnj46FPn4mibHcB/JQO/qdD73Ef+0YWow796U8Xhd2NZ6VkoClbG12C7cvNHwnAnH3dsbvRCq1bEZwSrWwbD3j48kAs82SDZiDzMR+b1z4oorjp4cPyFBt59pgHAxInGZP3TVoMDolNRMEZ6CMKKcV6EIeuD4Vn4hbebicwfu6+rTPYzDfulF895Ba5Coj2SD8V33DhLD2W3zAk8w5r9AJczvGyVWE8tRGFz4UAKhIPtv+Wp7uAy8spuLrRXyuxWlDsDfCTaCp0NNzzPdBCDwJim6no8p7nj6fiPmFn6jsqME8X1DT9DpIuibxf7XcBPi6rx5VY0W2XtHDQOU45QB1sEFdMqkoHcuXwvwqRx4BMWSNXy7Jag8ZNWMnS8rvafSTEu31vgCeaLP5Z3biyhcYI24xuw6PrSKiuTndFboJ3fE4ndVT0nUy4dv1qDo7nRtqzNnD5Sd5Y/y2IJesDLzEMZvZG5K4dl05x7zlC6wy3pYyPpKE+NuEp3uuwaWACgdAkC9rmee1DsYGnW6XnDd2wVUEly4rfKCaWbscMhIW2yNAdJXq0lLoVT3usBpUVBL7sAc/DK8eol8AXufvclT/IErwzoxxJQUQdM/GVAaUf6edDwba/t/BRevNowaVPQtmdNwRjjbpw8ISWUS0MqhhezesC6kvgybRMWc14DMWdfAyBRhYXjlHraTBVgNYF0u/DCoRkOs96OXR6GMgFUnNe48SKDU+/FBSXYf9y3nDc3FCdc
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(55112099003)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?S1UrVktlMmJhYXY3U20zbk1kNlBZREtuQ2ZmRHBLNXdOK2JQWTUySjhIOHd3?=
 =?utf-8?B?SXZWa0t1T2Y3bzExWENlZ2tBK01nTnl2bEUrSzhxc1haZWhSWjJHSnlMRGZa?=
 =?utf-8?B?aUdraHRMZVVuUmYxVytKWFd4Sm80Q0N0TDAvdHlFMHFzWmltUjF2VDJWNkpJ?=
 =?utf-8?B?WmJIMFl1ZGRZdFpWRUxxZE5iMTRVRjgrUHdVNjVYMS90OEUxaFhvMEJONjlF?=
 =?utf-8?B?WXh6QjVQdjRyeGpXMm15a2lLOGswLytEYXA3QnlFTjRYWU1vQTczSE52SFB1?=
 =?utf-8?B?OWM3eWgwekdFYmxnOHB5eHZhMlFJUkxTeE1pOXBqeVc4aVplMHJTQk52MHg1?=
 =?utf-8?B?Rk1vcW1GRWVHVzl3N3ovcHJjOUJ5V3FrRTVJMnNIRHlUcGJ3bHVvd0k5eEFv?=
 =?utf-8?B?ME95NnNNTS9XVlBFSDB1dmlCSStGYU1zM0RacjhpSGRlR2FFZVJ3KzhBMkwz?=
 =?utf-8?B?MmpCSFpZM1A0SlFFaEk1TEVkcG1vVGZNTGRiWGxmUXZueG9ZVkF5SFZ0bCt0?=
 =?utf-8?B?ZnArZ0dEMXdvYmh1TlBJUHBvZE9HTU5ISFBSQkpQc3dlYzZacmg0YzBHWFM2?=
 =?utf-8?B?LzRzUm8wNi92YVcwamhhcXI4dG9rYzlDdWFTZEFQTEMrNEdCVGFsek94OEdD?=
 =?utf-8?B?VjZaNU9LZWg2NjZCOFNEa1VSL2RNT2pKNEhQUEx5T0VzWTVmWmlsWW9kbTVE?=
 =?utf-8?B?aHlRUUdsWlhweVRkTlFyTjhGTm5Uc2V1V29wdHpLNnhLeGdlTVUvNmwrM2U2?=
 =?utf-8?B?R25sb0ZoNWRscndERnhrcSsvUnhoVmhQSmthMTVFMVZaRlhxbG1KSFJmanlT?=
 =?utf-8?B?VElRRndUMk53M1UzazkxcC9UbENRR1owUWszbzZwUnFtT09ZTWVhRktEV2dZ?=
 =?utf-8?B?OUtKY1BqYmp3S1RqaG5GOFNuQlJCZy9aM3lzVUNPV20rQno0UVd5cDNCb25T?=
 =?utf-8?B?MXF3SVJjZGVNVTV0Uno4aUpkK3FrdzNYU1JSNTZmTksxTUtMOW0wNHg3L3V6?=
 =?utf-8?B?MStUTUtHNE5KVVVtU0xZcGJoY1FNb0RpWkRWQnJyemdpbWdJa1d3VW0vcncx?=
 =?utf-8?B?dmRTWmhBTmo1WE5pRDQwbmlpWFB2czJDWUNsbnFiWVN1NjM3a3VZMDZMRjBT?=
 =?utf-8?B?RVJEUS95ZEU1RWM2RS9OZ2lVb3g5OTZlSUdpd05YRFFvM0h1amdjcnhqTTVT?=
 =?utf-8?B?YzhqUWxLeWsyakVEdzBsZzRRRnBYSzRxRE1HYWtRL1lWak1QRjJFRmpkUlRC?=
 =?utf-8?B?TjBlUTQyck5SeEFyQXRnazB1K1VQRStUNDc0aWNCY0p2YWl3NTFDWE9BQTlj?=
 =?utf-8?B?aTZ6c1V1Q3FtQ29Fc1hyeEtHaC9sb1lnWVI0NUI0T0R3eGdFb2hId0lST1pP?=
 =?utf-8?B?QWxHQzlYSVRFdVVqcGVZSmQ5YmUyZ0l3MWNZUzdPcVBzOHRNSkhqblBwSzdW?=
 =?utf-8?B?NEgybkM2dmYxcDZYLy9ET2JpUksyTWpBWkkwZndBRDlVL2x1VE1iU09NL2RC?=
 =?utf-8?B?UnYwS2pWZFB6K2NNRVBOTUZTUDZPQTBnUnpPL2g0OXgwT2dqYk1qTEwxTHBS?=
 =?utf-8?B?MmtnRWhBd2pnTGR6b1Fjcm5PM3lDNDZDVmM3aXppQU9UT2k2K2d0YU5wQmt5?=
 =?utf-8?B?SjdzU0lvdEVUdEsvbXljclAwNTJGbzRZNjNTRFRBQTJLT21UTzk3L0o1NHAr?=
 =?utf-8?B?cmJ4NFZ4aDFzYytBWEdveHhZdUVTa1R1cVNyem9PbEptK2Y0N3J3UEZpZjJk?=
 =?utf-8?B?QnBLL096WHl6bzN5VVhYN1pxZ3Y4SjJFOTRkTk1RUkJYcXoybTRMMnVNUTFj?=
 =?utf-8?B?c3djV1ZhUG9VSzZpMTY5R2x6a01uMVZoVDBhMDlKd0x6TkxDK2NPNXdJcUha?=
 =?utf-8?B?ME5nVGJhNnJ3S3lxSDg0ZEZFRlBpOHZMeE9oRnJrSVEzV1I0d3NLWjZzR1Uw?=
 =?utf-8?B?UU1qUEt1MXRkbmpuTjhyeTNnUUN6cURhV0NqVHd3aTFNamtJeXYydk5sci9E?=
 =?utf-8?B?SkIwUGg2bmVlNVFsL2drTXZXR2dGYVFRYUpEUjNFTzZXQ0cvcWlzZVkyOW5G?=
 =?utf-8?B?M1NXS1I1dGFycjJuRkZ0M0lvdGxJcDdzZG01c0FhU0pZVjN1WWk1SGUvaUxt?=
 =?utf-8?B?ckVocDBNTjlJM3VOOVFWamZYQ3FJYmIrSWpCdDQ1RFR5NFU3VGN0ajVFZ3h4?=
 =?utf-8?B?Ukd6VWxOaEFxWm5TcFZHbHdiQ1JJZTlyeDlrbytQdSsycG52eFRIS1J4OU0x?=
 =?utf-8?B?cFdtOWliakdudTFnY3JhV3FaZXFkeXF5c0JHTm5tczhNYk0wMjczM0ZCSjBD?=
 =?utf-8?B?QVEyYktSV0lqTytHR20zTU9RT3ovYnRsOUVuZ0NPcXAzbmsvSkpVdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aef946e-3bca-4a8f-b771-08deac59c3dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 16:57:47.1220
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fSLSAk8zB/+wToY6OZTPM/ReXpqX0JbH8O8SnaPraMBb8sIoHLo/bZR6Dgf9FEXz1RvLJXxRZbh/C+pa9bkTjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8757
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 16:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236606

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmVuamFtaW4gUm9iaW4g
KFNjaG5laWRlciBFbGVjdHJpYykgPGJlbmphbWluLnJvYmluQGJvb3RsaW4uY29tPg0KPiBTZW50
OiBUaHVyc2RheSwgTWF5IDcsIDIwMjYgNjozMCBQTQ0KPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBDYzogcmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0
aW9uLm9yZzsgTWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpDQo+IDxQZXRlci5NYXJrb0Bz
aWVtZW5zLmNvbT47IHJvc3MuYnVydG9uQGFybS5jb207IGpwZXdoYWNrZXJAZ21haWwuY29tOw0K
PiBvbGl2aWVyLmJlbmphbWluQGJvb3RsaW4uY29tOyBhbnRvbmluLmdvZGFyZEBib290bGluLmNv
bTsgbWF0aGlldS5kdWJvaXMtDQo+IGJyaWFuZEBib290bGluLmNvbTsgdGhvbWFzLnBldGF6em9u
aUBib290bGluLmNvbTsgcGFzY2FsLmViZXJoYXJkQHNlLmNvbTsNCj4gd2FoaWQuZXNzaWRAc2Uu
Y29tOyBCZW5qYW1pbiBSb2JpbiAoU2NobmVpZGVyIEVsZWN0cmljKQ0KPiA8YmVuamFtaW4ucm9i
aW5AYm9vdGxpbi5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCAwLzNdIHNib20tY3ZlLWNoZWNrOiBV
cGRhdGUgdG8gdmVyc2lvbiAxLjMuMSBhbmQgdXBkYXRlIENWRQ0KPiBkYXRhYmFzZXMNCj4gDQo+
IFRoaXMgc2VyaWVzIHVwZGF0ZXM6DQo+ICAtIHNib20tY3ZlLWNoZWNrIHRvIHZlcnNpb24gMS4z
LjEgd2hpY2ggbWFpbmx5IGZpeCBhIHBvdGVudGlhbCBkZWFkIGxvY2suDQoNClRoYW5rcyBhIGxv
dCBmb3IgdGhpcyB1cGRhdGUhDQpJIHdvdWxkbid0IHNheSAicG90ZW50aWFsIiBhcyBvdXIgcGlw
ZWxpbmVzIHdlcmUgZ2V0dGluZyBzdHVjayBvbiBzYm9tLWN2ZS1jaGVjay1yZWNpcGUgdGFza3Mg
ZGFpbHkuDQoNClBldGVyDQoNCj4gIC0gc2JvbS1jdmUtY2hlY2stdXBkYXRlLSogcmVjaXBlcyB0
byB0aGUgbGF0ZXN0IHJldmlzaW9uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBSb2Jp
biAoU2NobmVpZGVyIEVsZWN0cmljKSA8YmVuamFtaW4ucm9iaW5AYm9vdGxpbi5jb20+DQo+IC0t
LQ0KPiBCZW5qYW1pbiBSb2JpbiAoU2NobmVpZGVyIEVsZWN0cmljKSAoMyk6DQo+ICAgICAgIHB5
dGhvbjMtc2JvbS1jdmUtY2hlY2s6IFVwZGF0ZSB0byB2ZXJzaW9uIDEuMy4xDQo+ICAgICAgIHNi
b20tY3ZlLWNoZWNrLXVwZGF0ZS1jdmVsaXN0LW5hdGl2ZTogVXBkYXRlIHNvdXJjZSByZXZpc2lv
bg0KPiAgICAgICBzYm9tLWN2ZS1jaGVjay11cGRhdGUtbnZkLW5hdGl2ZTogVXBkYXRlIHNvdXJj
ZSByZXZpc2lvbg0KPiANCj4gIC4uLnl0aG9uMy1zYm9tLWN2ZS1jaGVja18xLjMuMC5iYiA9PiBw
eXRob24zLXNib20tY3ZlLWNoZWNrXzEuMy4xLmJifSB8IDQgKystLQ0KPiAgLi4uL3Nib20tY3Zl
LWNoZWNrL3Nib20tY3ZlLWNoZWNrLXVwZGF0ZS1jdmVsaXN0LW5hdGl2ZS5iYiAgICAgICAgICAg
IHwgNCArKy0tDQo+ICAuLi4vc2JvbS1jdmUtY2hlY2svc2JvbS1jdmUtY2hlY2stdXBkYXRlLW52
ZC1uYXRpdmUuYmIgICAgICAgICAgICAgICAgfCA0ICsrLS0NCj4gIDMgZmlsZXMgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiAtLS0NCj4gYmFzZS1jb21taXQ6IDRm
N2QxYTA4ODVkN2Q2ZjJhNTMzZjczODhlZDVmNWEzNWQ2Zjk5YmMNCj4gY2hhbmdlLWlkOiAyMDI2
MDUwNy11cGRhdGUtc2JvbS1jdmUtY2hlY2stMTA1MGZmMDJhZWZjDQo+IA0KPiBCZXN0IHJlZ2Fy
ZHMsDQo+IC0tDQo+IEJlbmphbWluIFJvYmluIChTY2huZWlkZXIgRWxlY3RyaWMpIDxiZW5qYW1p
bi5yb2JpbkBib290bGluLmNvbT4NCg0K

