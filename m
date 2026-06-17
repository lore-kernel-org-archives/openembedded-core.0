Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A1ECD98F2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 16:11:05 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.55])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19523.1781712648522575094
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 09:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=xbMyx5uf;
 spf=pass (domain: siemens.com, ip: 52.101.69.55, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bTJA1NXyylWTBJqHKdQsDN6XF05AYpxHZF+cWv7k31xgSiKmRVb7YTJb/2EJB2wvjfIaVndZPqGLaNezxNjEULi5zBqRs4QHra8Cv9sCUHGi8aCLGvigze8zeIQFEnpHa2aIoOdam0WdOc/1hCmMyBHQQE4xBS63KvJm0ej2NtqkDY1VZ9rD6eUL//JUFAOVumAuWTN5i8pjgSnIl32VBgid9Ugo19rKQToq2CwrROGp2C39zfazvMm0UNaJjvXN3ELJUe+68+MwMfew9ZUedziFHXHbtTBCzhC2t350gPjhzMPABc/Eaaxm8HdPBsKihTAA8nb179NEjKT+xYwa0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DvzmYdFR5bEV4nVIxJS8XLJW4lJFRf+2HfvwlhCrsNs=;
 b=Jbvz3XNB2It5IyqfZnnXH01d2TBoAv3xfodZynujjNyELbQ+Rqv4tVcWeDVkhUnO77LwBh1oJg1Bj6YRImi10RaSFk/4VaKIcHut7hpR5ISbIklUC2EthEn4lyn2y6wssXYIfOQlUY3monLJSwylY0tNbku5qmxydnWHhqj4H3J4WtCvvbdyxNHBEB91u8CIeG8ZqAqrGlxkVLal1DlTRFL+hZ3hnzVQXmK9TPf/WoN0TDJOoml9Sodz8VNBjVx5NivrSQy0XQET9ax2WUZf3ZDajO2FfPGcbe58it6vitojJa41progf6rIjSWax8Xfk0Kndcrks7HA3GPJNGxZCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DvzmYdFR5bEV4nVIxJS8XLJW4lJFRf+2HfvwlhCrsNs=;
 b=xbMyx5ufRWL6wfFoPbrlyyTAShiurxJFi73deNO33AnYTBvYUo5L0ljzCmaVN9l+3xaXqJTcQoaIcEfBms6GMZ9p3eDSHEG+AnUM5l6FmMS6Tl7AeatI+KOQz0eJkyK5uYMsMr/1NQ98+fClkGpNs1V0n5DELTfTmA/Ar/yt901UrnPjFsrpRy8H1wp2dgMWEol70yrBK1AnBjiFMzTOp2jE+Se976PzI92jiD3WvGqsHRq5eqJqqmTAcGTGn3lbxdgyyqoZjzJDR2K1cIP4hPXlSjTiKIicRpTgccga/D56VWqNwNTNcFmmLkrju34GvS106hA5/UfjwnBb85zIuQ==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by DB9PR10MB5137.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:332::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 16:10:43 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%5]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 16:10:41 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core] [PATCH 2/3] libpcre: remove recipe
Thread-Topic: [OE-core] [PATCH 2/3] libpcre: remove recipe
Thread-Index: AQHc/clcaYSyb0nod0WieRgWLxZMt7ZCjocAgABVxeA=
Date: Wed, 17 Jun 2026 16:10:41 +0000
Message-ID: 
 <AS8PR10MB50732FFF648B29B3D26E23F8FDE42@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20260616194959.3748347-1-peter.marko@siemens.com>
 <20260616194959.3748347-2-peter.marko@siemens.com>
 <DJB9ANBS943K.UFIZ5E6NY3GB@bootlin.com>
In-Reply-To: <DJB9ANBS943K.UFIZ5E6NY3GB@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=4572af15-4b34-48c1-9911-ab308618a00a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-06-17T15:42:42Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|DB9PR10MB5137:EE_
x-ms-office365-filtering-correlation-id: 77fe9984-d4d2-4aa2-d00b-08decc8afa94
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|56012099006|11063799006|5023799004|22082099003|18002099003|4143699003|55112099003|38070700021;
x-microsoft-antispam-message-info: 
 jovg9x+An37GMa3sYZofBaPMK3sIeaPFC7CKQjzyMrsu8aMAGDzWyKy/up+jgLpzq3ROpBwwdPTAMD85rwbcKWp/HiaFRlzx+QDXU/zgtvprI0hrVS5ovjkg0IujIdnh9pvw9pm20BZ9PwgsoA85dsZ3YEg29ATOwlUesX3IJXRyYwkAYUdeR2EfdzpPVGFHBVP1oEKzVieDc0axY3Nvrvm6WxAy9HoaMkTf/CBJvZnQqunb+zjiyFauhXWuNh4qKTi0imah0iD+oziyR1ef9I4z8cDceIhTP8EGYE2gIzcOTUFAZvBNJH6y83lsfyFA6q4YtCQr/6fcj7ZBECXmItVXrpQV2VggviWZD8Ec/H4UDUzRzEPFyjWhrCaHt+DC7ZQfJg28ev5No1fOsZR8RI7uldkX88Dh31HTzR1yXfIhqDy1R+mya3p/dAbovOUeXU5t58PyWLGKiX8/xbqURJcFkU/RvBwJyMzjZkxj8OcvDfCUmHg2O4sPgmeipzBiUNVHWkj5qBUTNPvSZJd1L+Ux0ZgHgEzmNVITK4z55GLqEJ1G3y1d9lB7r9Ntzf7lVftNFntWGSfCkbp2CFW6tKIwp815T8p/Q71VYnRuEALLeIVkDOOpduj3x1uuUw+8dsE6pPuVDCJNSyWFTk0Wqw0W0B32NRUyCWT2eIhDJEI3L08phmzLXWVaPmvArNzg
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(11063799006)(5023799004)(22082099003)(18002099003)(4143699003)(55112099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?K0lkMnlYZTR4OHh3enlIZGUzODBEL0hyOVJlT25mQkpKd0FEY2dxOFhVNGdG?=
 =?utf-8?B?Z2tweG5ySGhWREgvYUU2NFpSK2cwSkI2U2xyVXN2cjZ3S29rcTVMc2Z1eFk0?=
 =?utf-8?B?V2ZSYVkxL0Q3WTVzb1JVbUhTSk0vRUZUeVRURmdLZHcyKzE2T1M0eXFuWmh3?=
 =?utf-8?B?a3hJRVYvT3NiTjhxZCtSaHhMVnUyU05BdmE0Tm9QU0NlUEdpdVRGQlFVZVNp?=
 =?utf-8?B?a244MVloR0RPWTFoZDA3MzhsM244dXJFL3J0bVdycU1PUHhNTTJhanpFWmNU?=
 =?utf-8?B?RXBjWTlndFh3bEpGd29DdEszMCtHMHJ2eUt0YzNkWXVzdW5tRmovNVpmb1VU?=
 =?utf-8?B?a1BLa3gzcW8reHpsazM1c0F1cTJ4R09PRUFRZkgxejM4K2ZtUm1HUndrcm9y?=
 =?utf-8?B?QkZPelhoSFhEUGlpa3k2Mm9KQVFJeEJLT0ZuZzAyZXVwNGxuQzEzbWVjOXNq?=
 =?utf-8?B?eHRzL05JTTQzVHhFVXlDV3duLythQ29pelJhSlVCQWFZelhyaEFwWnUwUkJ6?=
 =?utf-8?B?dFlMcVJuZk1nNVpSM0VPZW5WbzU5WGdxYzRBajFMelcwU2c5WjhWWmdEUDZT?=
 =?utf-8?B?T1RUUEdrUkVUUS9OTXlBaDZPLzRISEthZ0UrK0EzelVWN05pOTdjZERFc21F?=
 =?utf-8?B?OU00QUtpQWNLTXNOTzVrVytaR2NieEZsd1pPYnh2TUx5ZHRuTHZzUW96Q2lF?=
 =?utf-8?B?dG8rWXRhY0N2a0JhVWUyMHplMDZzNWdMRHlDVmtUc1NNdU43eGdaUlNuTUZH?=
 =?utf-8?B?S3hPanN6Rm1lSVFUcEJaRUQxb2RpTWtLc0Zmd21MWFlnUVZadFFjZDQ4OFlo?=
 =?utf-8?B?L2xDVUZxTDExK3VkbEI2QXVHL255a09HNUFLWWVXWkdkQWxEcFpoeUkvVTlJ?=
 =?utf-8?B?WG85YWRCSzNVM3B1NXdSYjh6MUxIM0dSQzlBL2FETHVjdk5MUDYyNDJPUGZE?=
 =?utf-8?B?eUgwb1ovYlVZL29QQk80UnROWDllYTRmTDZEQm5UVG1ucXVwOHB5bHJ1bW5r?=
 =?utf-8?B?aVkwaTlwTDZHRG5LOWxWUTlJNlpkWHRSYkRneHVkYWgvbExpeXFYZWxKUzJ0?=
 =?utf-8?B?MDY0UkZiZXNqMFFPRDI5WW10UHFCT2RwaFc1bEEzSWdOTVZlbjQ1dTZIM3V6?=
 =?utf-8?B?OWdZWkZncjJYbnZyYjZ6Tk00RVNzWjdjYlVyblFsSFBVK1JiRi9lelN0TlRt?=
 =?utf-8?B?RFl5K3J6N2J0Qk9VdWI5TVI0ajVQVVZORHEva05FVmlGemR5aEJyT3dVWG54?=
 =?utf-8?B?NkFqelI1RWNRTklRdkJjMGFvc0xhTDlzOVEvOW0xNDB1MGJsYWJhR00zMW04?=
 =?utf-8?B?bWdXdk1TWlZzdzRFRG1xSWNXZUNXeVBPdUh3UGpRbkpjNHFjNEY4KzJGWFYx?=
 =?utf-8?B?V2VEV24yS2dNT3VzeHdNVmY5dUg1MkR4R3MvQVVCV0N1cElQaXdCV016MDM0?=
 =?utf-8?B?TWk4Q2ZHYzdIeUZ4L0NqR254UWtZbzFwaVoyTVV6QitzNGZKWE1DdS94WWZ4?=
 =?utf-8?B?VHRNK2IxNmducDZaaVBUUXZYY05xU2hYeGZDeFVrMHJFSmtXV1FmTjRHNUla?=
 =?utf-8?B?Vk1LN1hXK3kvQmZ0QzhoNkFKckkzMXdEbUxmL0FCUnJudTlIclVsRXJBbC8r?=
 =?utf-8?B?MnZDVUVzUk0wVWYxSUhnKzNGWWNXR3BudWJGMTR2ajg2R1dEUlRUOHladGJn?=
 =?utf-8?B?SHpCR0o3WXJ6cUc1THZkTGlxc0RVVzVIVDAwakFuc1Exc1Y3ejFRMTNjWURj?=
 =?utf-8?B?RytrM1h1U1JwcEJkSUdEbk9FeUdOQ0RiQTdyUXAzRi9vR0pUd3k5eVhGWnlD?=
 =?utf-8?B?UlBzMmk1QjJXNCtWQ3JiZHVyWHpQVzJSTnRKb1ljRXJiai93OTJ4K0VwbDZY?=
 =?utf-8?B?WHBiMGEyMnBPQ29XaFNhWUt4d0VuMDhuZE5KYTR2VTk1RkxrY24vZW9NWFEr?=
 =?utf-8?B?YXNaWlhQeGJBajdSM2NQaWUydWFmNG1DK1JyQ1dmUnBpdUR5WlJwdjgrNFds?=
 =?utf-8?B?TnpYMHJqYlJ5dHRSSDNGLytWb01sWDNlS1UxYUpyR1NKOWF5aVprSk41dTNi?=
 =?utf-8?B?NUZ5QmpjL3VXUnBidW4vV0ZLaHdlbXhkZXRReDF2RXlNbEIrT1d2a3JFS25p?=
 =?utf-8?B?TFVRdU12TElXbklyUXZjSy90Z25FbVJ6UnNJdnVGazA5bTVVaWg4M2VEZjhX?=
 =?utf-8?B?WGtGajNTZlNhRWxtMThRTURLRnduRzU4ZFVubEVvRmQxQVVTS0tUOTRyeC9X?=
 =?utf-8?B?OG91dWszdXF6SEZ6ZTl4eHRhOFFuMStzWkhEanhheU02K3ZzOHFZbk5yNTdj?=
 =?utf-8?B?WGx4bmlIdlVEbCs3R3V3N3pUL29qdldtREdCemN4cjdBNFN0SU1LZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 77fe9984-d4d2-4aa2-d00b-08decc8afa94
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2026 16:10:41.4760
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cElaHEgI1fLdTlBYTk0Joy/RbRLx5wfCkgoik6z43iWknO2u8w5MHZKZyIoRyjOO13AkIquaFLK10WpLzVJ6uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5137
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 16:11:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239036

VW5mb3J0dW5hdGVseSwgSSBkaWRuJ3Qgbm90aWNlIHN0YXRlbWVudCBQUk9WSURFUyArPSAicGNy
ZSIuDQpBZnRlciBtb2RpZnlpbmcgbXkgZ3JlcCB0byAicGNyZSIgaW5zdGVhZCBvZiAibGlicGNy
ZSIgc2xhbmcgc3VkZGVubHkgYXBwZWFyZWQgKGx1Y2tpbHkgbm90aGluZyBtb3JlKS4NCg0KUG9z
c2libHkgSSB0cmllZCB0byBkbyB0aGlzIGNsZWFudXAgdG9vIGVhcmx5LCBzaW5jZSBzbGFuZyBk
b2Vzbid0IHN1cHBvcnQgcGNyZTIgeWV0Lg0KT3Igd291bGQgaXQgYmUgYWNjZXB0YWJsZSB0byBk
aXNhYmxlIHBjcmUgcGFja2FnZSBjb25maWcgYnkgZGVmYXVsdD8NCg0KUGV0ZXINCg0KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXRoaWV1IER1Ym9pcy1CcmlhbmQgPG1h
dGhpZXUuZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBKdW5l
IDE3LCAyMDI2IDEyOjM2IFBNDQo+IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkg
PFBldGVyLk1hcmtvQHNpZW1lbnMuY29tPjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAyLzNdIGxpYnBj
cmU6IHJlbW92ZSByZWNpcGUNCj4gDQo+IE9uIFR1ZSBKdW4gMTYsIDIwMjYgYXQgOTo0OSBQTSBD
RVNULCBQZXRlciBNYXJrbyB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiB3cm90ZToNCj4g
PiBGcm9tOiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4NCj4gDQo+
IEhpIFBldGVyLA0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoLg0KPiANCj4gPiBsaWJwY3Jl
IGlzIG9ic29sZXRlIHByb2plY3QgcmVwbGFjZWQgYnkgbGlicGNyZTIuDQo+ID4gSXQgd2FzIG5v
dCB1cGRhdGVkIGZvciBsYXN0IDUgeWVhcnMuDQo+ID4gVGhlcmUgaXMgbm8gY29uc3VtZXIgb2Yg
dGhpcyByZWNpcGUgaW4gb2UtY29yZSBhbnltb3JlLg0KPiA+DQo+IA0KPiBPciBtYXliZSB0aGVy
ZSBpcyBvbmUgOikNCj4gDQo+IEVSUk9SOiBOb3RoaW5nIFBST1ZJREVTICdwY3JlJyAoYnV0IC9z
cnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9xZW11cmlzY3Y2NC0NCj4gcHRlc3QvYnVpbGQvbGF5
ZXJzL29wZW5lbWJlZGRlZC1jb3JlL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zbGFuZy9zbGFuZ18y
LjMuMy5iYg0KPiBERVBFTkRTIG9uIG9yIG90aGVyd2lzZSByZXF1aXJlcyBpdCkuIENsb3NlIG1h
dGNoZXM6DQo+ICAgcGNyZTINCj4gTk9URTogUnVudGltZSB0YXJnZXQgJ3NsYW5nLXB0ZXN0JyBp
cyB1bmJ1aWxkYWJsZSwgcmVtb3ZpbmcuLi4NCj4gTWlzc2luZyBvciB1bmJ1aWxkYWJsZSBkZXBl
bmRlbmN5IGNoYWluIHdhczogWydzbGFuZy1wdGVzdCcsICdwY3JlJ10NCj4gTk9URTogUnVudGlt
ZSB0YXJnZXQgJ2NvcmUtaW1hZ2UtcHRlc3QtYWxsLWRldicgaXMgdW5idWlsZGFibGUsIHJlbW92
aW5nLi4uDQo+IE1pc3Npbmcgb3IgdW5idWlsZGFibGUgZGVwZW5kZW5jeSBjaGFpbiB3YXM6IFsn
Y29yZS1pbWFnZS1wdGVzdC1hbGwtZGV2JywgJ2NvcmUtDQo+IGltYWdlLXB0ZXN0LXNsYW5nJywg
J3NsYW5nLXB0ZXN0JywgJ3BjcmUnXQ0KPiBOT1RFOiBSdW50aW1lIHRhcmdldCAnY29yZS1pbWFn
ZS1wdGVzdC1hbGwnIGlzIHVuYnVpbGRhYmxlLCByZW1vdmluZy4uLg0KPiBNaXNzaW5nIG9yIHVu
YnVpbGRhYmxlIGRlcGVuZGVuY3kgY2hhaW4gd2FzOiBbJ2NvcmUtaW1hZ2UtcHRlc3QtYWxsJywg
J2NvcmUtaW1hZ2UtDQo+IHB0ZXN0LXNsYW5nJywgJ3NsYW5nLXB0ZXN0JywgJ3BjcmUnXQ0KPiBO
T1RFOiBSdW50aW1lIHRhcmdldCAnY29yZS1pbWFnZS1wdGVzdC1zbGFuZycgaXMgdW5idWlsZGFi
bGUsIHJlbW92aW5nLi4uDQo+IE1pc3Npbmcgb3IgdW5idWlsZGFibGUgZGVwZW5kZW5jeSBjaGFp
biB3YXM6IFsnY29yZS1pbWFnZS1wdGVzdC1zbGFuZycsICdzbGFuZy0NCj4gcHRlc3QnLCAncGNy
ZSddDQo+IEVSUk9SOiBOb3RoaW5nIFJQUk9WSURFUyAnc2xhbmcnIChidXQgL3Nydi9wb2t5YnVp
bGQveW9jdG8tDQo+IHdvcmtlci9xZW11cmlzY3Y2NC1wdGVzdC9idWlsZC9sYXllcnMvb3BlbmVt
YmVkZGVkLWNvcmUvbWV0YS9yZWNpcGVzLQ0KPiBleHRlbmRlZC9zbGFuZy9zbGFuZ18yLjMuMy5i
YiBSREVQRU5EUyBvbiBvciBvdGhlcndpc2UgcmVxdWlyZXMgaXQpDQo+IE5vIGVsaWdpYmxlIFJQ
Uk9WSURFUnMgZXhpc3QgZm9yICdzbGFuZycNCj4gTk9URTogUnVudGltZSB0YXJnZXQgJ3NsYW5n
JyBpcyB1bmJ1aWxkYWJsZSwgcmVtb3ZpbmcuLi4NCj4gTWlzc2luZyBvciB1bmJ1aWxkYWJsZSBk
ZXBlbmRlbmN5IGNoYWluIHdhczogWydzbGFuZyddDQo+IEVSUk9SOiBOb3RoaW5nIFJQUk9WSURF
UyAnc2xhbmctZGV2JyAoYnV0IC9zcnYvcG9reWJ1aWxkL3lvY3RvLQ0KPiB3b3JrZXIvcWVtdXJp
c2N2NjQtcHRlc3QvYnVpbGQvbGF5ZXJzL29wZW5lbWJlZGRlZC1jb3JlL21ldGEvcmVjaXBlcy0N
Cj4gZXh0ZW5kZWQvc2xhbmcvc2xhbmdfMi4zLjMuYmIgUkRFUEVORFMgb24gb3Igb3RoZXJ3aXNl
IHJlcXVpcmVzIGl0KQ0KPiBObyBlbGlnaWJsZSBSUFJPVklERVJzIGV4aXN0IGZvciAnc2xhbmct
ZGV2Jw0KPiBOT1RFOiBSdW50aW1lIHRhcmdldCAnc2xhbmctZGV2JyBpcyB1bmJ1aWxkYWJsZSwg
cmVtb3ZpbmcuLi4NCj4gTWlzc2luZyBvciB1bmJ1aWxkYWJsZSBkZXBlbmRlbmN5IGNoYWluIHdh
czogWydzbGFuZy1kZXYnXQ0KPiANCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qu
b3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvNTYvYnVpbGRzLzE3NjQNCj4gaHR0cHM6Ly9hdXRvYnVp
bGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvNjEvYnVpbGRzLzM4MzgN
Cj4gDQo+IFRoaXMgaXMgYmVjYXVzZSBvZiBhIFBBQ0tBR0VDT05GSUcsIGlmIHRoZXJlIGlzIG5v
IHdheSB0byB1c2UgbGlicGNyZTIsDQo+IG1heWJlIGl0IGNhbiBiZSBkaXNhYmxlZCBieSBkZWZh
dWx0Pw0KPiANCj4gVGhhbmtzLA0KPiBNYXRoaWV1DQo+IA0KPiAtLQ0KPiBNYXRoaWV1IER1Ym9p
cy1CcmlhbmQsIEJvb3RsaW4NCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmlu
Zw0KPiBodHRwczovL2Jvb3RsaW4uY29tDQoNCg==

