Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B992F51413
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 06:56:08 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64367.1772780162343408661
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 22:56:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=J3FwxOct;
 spf=pass (domain: siemens.com, ip: 40.107.162.30, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8zXKVG1iLoAglBcYBEOKHkKjIVTrHeCW8mPXY1xM1lTfTJmiKax1JKKkDlnkq/kupT8vLTsgQKHTkEEpl8wqARgZK1iVi8SS43XvhIU38xsjDI6KLetpBCe0R2Np3yu1eKw5U8FCajGZImEptChErrZZ7sZhw3HNTig8s0VpbzqqbYjpuQqKKNVRXoSZknX088bWhyJBsfpMGAwje+WayOMFg/itWKrRzBt+BrXSfL2ZJ/4zTWTCzMN6DRRT2yS4FEYusS/11UGAqA89APItXHe90Ds3El3uuq4dAd7OLaB185ToKOGHsrJEgPY8/hliT2cojpA84r5UPOj9qF+fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vldwcjwc8t/mQLtEfxNE9sJ95kbFGYY4b0aUOwNQfuw=;
 b=WCWSOAkBpb00Ee/E6Gb6fAfPGTnM9CG8oeEeeIbJl/gXKnbXyahm7X+3SJsXdABSC93sMQZuq3tswwcL25zrWYhuN2dMiyVgsCU6CNFv2cNHDy4PFuhHOYscbF4qE89TdV0hOLBzYX/MKD4m6CYyLaf9bkqJOs5poTatfUnH+ltgVUMmjHhLkSFWEs8o7yiuqVzSyZX7jxXVfnU01Sbq8JrP7wNrCMC16Z0cPcThNVQQX6b2XKTUJO/2SAfSHp98EfupAqGTeevijHPQfq0bkjh9WW201oTgux4ymBcutzkg+mfYX4PpUrLq7urjTlkU3agQqnSq0HyHu3S/FjUJxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vldwcjwc8t/mQLtEfxNE9sJ95kbFGYY4b0aUOwNQfuw=;
 b=J3FwxOctHZh8ml9nbOgCtGDwr3meLgH6shOtsAPkAYoDHA3yuOCLIn7Xk5OdKz4jTPIi2vXjBvVYwUfq7Yw3l7ykiEy6M/aWPWS113DGjttN1pXs8D6r615V9aFTqkTaUQYmg1ZvyhWTJoaOjDkt69JadeHhlxp1HczP9FW7DoEu7EkeXcqQlL2NWtz01C+a3DSPfWE94fVrBg1WK0oBEoS1MbO6ZIo6DliHeIwV7n1W3KK7l9SndWRylAeCK0v7XWmELoR+CSXqDc51RZ7o+YfMGnDASUGwEZtKsofviV++TGwRDMBL52+re3FyIZFhhHQGD36CVdBTw2iLSPbTMg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB8PR10MB3499.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:137::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 06:55:58 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 06:55:58 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] libpam: set status for CVE-2024-10041
Thread-Topic: [OE-core][PATCH] libpam: set status for CVE-2024-10041
Thread-Index: AQHcrNPnSoQ/04GA3UeVEmu3RIdKNrWggqwAgACQJEA=
Date: Fri, 6 Mar 2026 06:55:58 +0000
Message-ID: 
 <AS1PR10MB5697CCD22A7A1C7CD6664BD5FD7AA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260305191136.1520512-1-peter.marko@siemens.com>
 <CADySD0Hv_A+xywb2UCDiH2-iAAsmO_RHoB7QabJkbsa7Ncr3xA@mail.gmail.com>
In-Reply-To: 
 <CADySD0Hv_A+xywb2UCDiH2-iAAsmO_RHoB7QabJkbsa7Ncr3xA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=953492f5-65f8-4f49-a341-04896dd03ead;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-03-06T06:55:36Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB8PR10MB3499:EE_
x-ms-office365-filtering-correlation-id: 46b53336-3278-4e03-8946-08de7b4d6b9d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|4022899009|376014|1800799024|7053199007|38070700021;
x-microsoft-antispam-message-info: 
 2bsWRMG73bIMkOw8Eyd6m1QECr0dObnUncbt+00fvhwhOEyND+9VoKfnYutc5yXTfOJh7bVAtQTpF0BcCHE61Lf+kqT+uLlt8aqYkNYYNCk1KSDL5kpxh/8kysLUiM36Q/uRDp8Xu/mu8JQjSY5UugBVeMaXMHD0yuQ2rDCGwCyNZNHS34iFWYSkNSa1oWh4z9vgQtBNrQnalUIln4CXIciPTqcU5Xsy+KnxdgZQEaSEldn6VD4MuIWNq4ZXkUhe3Wx4UhwjfWqcO0PkDiR8fK1vLt0Br212/3oLY7spC/wzdVeRzrjRD1EVVawy+SL/w1kskMtK4/IGKfRuDs/NPdMA1tM193fbdJb3ViHu1bwyPlySYze0HMFS84NpFu/mk059nOeLvfjLik1eL2wh9nEz595o+8otseYCbBZFNiAVMUOs0oLt4RuViTY4fCA81qdReKVIsDqkcBZF1v/SWM3jeOkR3PSjZXtPIg2FDeDsp8Mh5gWgIpqBM8vS9QdPz2e63S2aqiwwo7BixCbiFCpVLptIPvLbAq8Z+QFU8RS9EsVtrB8M+BSrOlLPrMFVxV48A9YMxM4DqXBDsV8jh8b0gndzaPRUXe3B6oNR3GVDDQYFGqLMNE+/9+CVxJUkJ0O8rruV3KPvVr/XOrgcC0/ssplBB1mP9yJNAG9CKsCexpk4OTyaScUTA4v6KIRHhRaNbHGiJdGxfXYzW55piAsWCznsqIjLyHK9sdEAW8WocXW0+ovB9U8ObmgYi/jO
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(376014)(1800799024)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TjE3akc1dUgwOTVwdzJucnd3STg3ZGdOcG51Y1JNRXhZWW11RmVRNHM0MU9H?=
 =?utf-8?B?b3ZocmRlZ0RYelA0bzJ2Sk1xempLc044QnNIVFFUOFFZMGFVWmRBS3ZLUVpj?=
 =?utf-8?B?aWd4ektTVnpGRGVOZElQK25KS00vazZEUWNKRHh5VU9mb0lxM21XbURuL1hY?=
 =?utf-8?B?RzFUQ2N2Z1RqY0tlWGZNOWRmUWV0Q1NKMWowbGRVdjJKeVZ1NUZUeDRUdEUx?=
 =?utf-8?B?U0xXNEVDa0VMeU01Y2RIdmtIQUNFR0J5c1QwOEIvWUoyZFBOZmRGRGxmOGcv?=
 =?utf-8?B?V0tCR0JmUXRET2F4YklDOXNEUFhtK3RweXdqNEx3ZHdyenFYSzRGbnJDSGtT?=
 =?utf-8?B?aUJDWG40aXBEK0RXYXJ0RWFHK2VpeVZ3WCswbTArWDZtb0lFbEREeHp0WVFs?=
 =?utf-8?B?YnBkd0tkbVZBeVNydlBCMTJxODNONkhrZDgySkM0RVpEMUUyR2hKbUJlYWNZ?=
 =?utf-8?B?MnNXZzNydG1lakcxTWJjdzlockkyYmxPZXhENG9VS05GLytKd2ZWUDlhcTlI?=
 =?utf-8?B?TUk4YW8ydmV5Vkd4VkdwSnJXUTVnK0xYSVZwalJzWVBIS2k2NkVoNlpCdlpH?=
 =?utf-8?B?VXJjc1ZVRE9KSzdkbnJsYU9FcWpKTFVna0pwZUc3d1RRNEs1b2cxeW5lcU1t?=
 =?utf-8?B?a3YrZVZjTURoanl2eVVId1JuZW82RVErNXpCdzc2c0YvNElqL2ZuSzhXS21x?=
 =?utf-8?B?MHk0OHZhWk9DZktsVXRMRXRKeENGaERpN2RqRXJBTmFEMjVvT1Z3UkFITUxm?=
 =?utf-8?B?YTBndXlnaG0zMU50VkdQZHRxM1VGdXBPdkM4b3UyckhScDRDNUE3aGZ0bXJn?=
 =?utf-8?B?d3hReWlQaXFBYTZsS0hOS3Nxa0dOQWFDTXgxMzBGTWIveUNnaFRCRFVYeFpm?=
 =?utf-8?B?Y0VxZTZNMUcwNlZmdnZTQWk0b2hXUTgvRFFBcHJZa0w4UWdPaFdZSDJmdHlm?=
 =?utf-8?B?Sy9UQlh6QysvTlVaRlBkUGZHYzhqV1d3bjNjUlpRS0tsL2tpSHc0UkFuZnYz?=
 =?utf-8?B?QmV6b1VPcjFXQWVDSlkyRm9la2hIa0pCenBWMzZaT2VMOEZ1RXJyd2FjODZC?=
 =?utf-8?B?YThvZlRZbjdITThVK2JlSGJrUzFIbGlWSWhhTU44QW9lYW04Mm8zVG81SXJF?=
 =?utf-8?B?STdVVmtUcUNRS3I0QVFuWnpKd1pabUoxUThFQi84TmFWdW13Z3RSSHBvQ241?=
 =?utf-8?B?VDFKQno4UHVDMzFZS0VTNkxUNzdMTmU0YVFRcnRlNmFhYmlEMWZyNG1Ib3FO?=
 =?utf-8?B?elV5YytGaTRCTXJoaDl5TkFTVENORDZYNnd1cEZYbnV3MlBaTVUzT2ZjUnli?=
 =?utf-8?B?TXRrS3Fjcm9uWTFUUC9NclFiL2hTM2dORGZVUzA4bHYrQ0N6YWFqODhZQUZE?=
 =?utf-8?B?NHdqL1N5R0VlelIreFJZZ2Rtb2dkVlByaXFrelJBRGpCVWVNNysyTEVOVHJX?=
 =?utf-8?B?YmdoME5nQU1ycXdLZ0kxS2J4dEZ4dStQRWpEOWhpU0hVK21sMml6Skw5aUJ5?=
 =?utf-8?B?UGVLMGVmd282MHJOaG1MUGMzNVU5ZFlwN0VtZU0vZlI3NVRMRGJ6VlF5ajdI?=
 =?utf-8?B?WlY5djhIQ2dEbDBZTlZqVmg0ZThMdEk3U2wvZDFSSDF6YlZpV0V4Mi9mb0xT?=
 =?utf-8?B?OGtxSXRGZTFQbkhSTXFpVUFxL2x0M0czR3JWb3RsUGNnQVdvWG54MzQybnNN?=
 =?utf-8?B?c3NmcVEyN2VKNDVleXp3N3VOUW1zcEJMbTk4d2M0cTBhSWxlUU9yK0tIZXFK?=
 =?utf-8?B?Vk9HWU5uVWpEdmNTYXpVRW5UdHhmYzducWZWdzVMT0pDRGJZN3pwUGpnYm8r?=
 =?utf-8?B?cWtlMWxoY3B2RDJzUXh2dVhpd1JXS2FwOVZUU2VwS091VTRyVUlvYXZRaHEz?=
 =?utf-8?B?MnpGalRzc2RqVXBxMTVmRVp0N0NwakRMa0Uva29YTmJBTmFRQTZwbEtkT3pa?=
 =?utf-8?B?UUg3cXBvVnV3YTRHSVpLWWdlVzNwcFdBUUdyTzMwZ0txL2ZyNEJTa3RpUTlr?=
 =?utf-8?B?SzJKd0xuOU5EaHpCeHRzSjViemRhcVB1YTJMelpZRUJXRkhqZGNheXo4czRm?=
 =?utf-8?B?ZWE2QTQ0a2pLRGY1YnNCWkJMK1V4NVVuYzFXbFpHelBlMTBXK0lvOGlZTXdG?=
 =?utf-8?B?eVBmckM1dXNBMWtUVGdQdzFta1MrYldvQ1VUN0RIbzgzQjZmeFM3UUVnTzZz?=
 =?utf-8?B?YUhjdHlKUnR6VTdBbEtGdjJFbXloNnU3cEFXTExNalhkNFRxVGJpN2JaeDQ4?=
 =?utf-8?B?c1ZRNVZRaUZRekZNMnIvbDY2OTc1NkJVWTM5Z0I3T2o3MWh5OXFnZEtyTmg4?=
 =?utf-8?B?bnZjN2hVMXovVDJVdDRTU0FMWFRBeStkeGpVZUM4cTM5YXBPRjRSZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 46b53336-3278-4e03-8946-08de7b4d6b9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2026 06:55:58.1242
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lu9jVoUE+0EDX2mIMhzWLVgi933Te5BGj8dgAmmGQ2ewBfT5UElLLX7ZunkkWPyJFo1TbwOTw68EPGMqZzhjCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3499
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 06:56:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232536

Rml4ZWQgaW4gdjIuDQpUaGFua3MgZm9yIGxldHRpbmcgbWUga25vdy4NCg0KUGV0ZXINCg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmt1ciBUeWFnaSA8YW5rdXIudHlh
Z2k4NUBnbWFpbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCA1LCAyMDI2IDIzOjIwDQo+
IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtvQHNpZW1lbnMu
Y29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBT
dWJqZWN0OiBSZTogW09FLWNvcmVdW1BBVENIXSBsaWJwYW06IHNldCBzdGF0dXMgZm9yIENWRS0y
MDI0LTEwMDQxDQo+IA0KPiBPbiBGcmksIE1hciA2LCAyMDI2IGF0IDg6MTHigK9BTSBQZXRlciBN
YXJrbyB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8cGV0ZXIubWFya289c2llbWVucy5j
b21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBQZXRlciBN
YXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4NCj4gPiBUaGlzIENWRSB3YXMgZml4
ZWQgaW4gdjEuNi4xIChwZXIgWzFdKS4NCj4gPiBOVkQgdHJhY2tzIGl0IGFzIHZlcnNpb24tbGVz
cyBDVkUgZm9yIFJlZEhhdC4NCj4gPg0KPiA+IFsxXSBodHRwczovL3NlY3VyaXR5LXRyYWNrZXIu
ZGViaWFuLm9yZy90cmFja2VyL0NWRS0yMDI0LTEwMDQxDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4gLS0tDQo+ID4gIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9wYW0vbGlicGFtXzEuNy4xLmJiIHwgMiArKw0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL3BhbS9saWJwYW1fMS43LjEuYmIgYi9tZXRhL3JlY2lwZXMtDQo+IGV4
dGVuZGVkL3BhbS9saWJwYW1fMS43LjEuYmINCj4gPiBpbmRleCA4ZmI2Nzk4M2VlLi43MTMxNjNm
ZGJhIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9wYW0vbGlicGFtXzEu
Ny4xLmJiDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BhbS9saWJwYW1fMS43LjEu
YmINCj4gPiBAQCAtMTcwLDMgKzE3MCw1IEBAIENPTkZGSUxFUzoke1BOfS1ydW50aW1lICs9DQo+
ICIke3N5c2NvbmZkaXJ9L3NlY3VyaXR5L2xpbWl0cy5jb25mIg0KPiA+ICBHSVRIVUJfQkFTRV9V
UkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXBhbS9saW51eC1wYW0vcmVsZWFzZXMiDQo+
ID4NCj4gPiAgQ1ZFX1BST0RVQ1QgPSAibGludXgtcGFtIg0KPiA+ICsNCj4gPiArQ1ZFX1NUQVRV
U1tDVkUtMjAyNC0xMDA0MV0gPSAiZml4ZWQtdmVyc2lvbjogZmlueGVzIHNpbmNlIHYxLjYuMSIN
Cj4gDQo+IHR5cG8gImZpbnhlcyINCj4gDQo+ID4NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09
LQ0KPiA+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3Vw
Lg0KPiA+IFZpZXcvUmVwbHkgT25saW5lICgjMjMyNTEyKTogaHR0cHM6Ly9saXN0cy5vcGVuZW1i
ZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLQ0KPiBjb3JlL21lc3NhZ2UvMjMyNTEyDQo+ID4gTXV0
ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTE4MTU3ODQz
LzM2MTk3MzcNCj4gPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1Yg0KPiBbYW5rdXIudHlhZ2k4NUBnbWFp
bC5jb21dDQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPg0K

