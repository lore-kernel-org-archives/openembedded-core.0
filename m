Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E67AC43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 09:03:15 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88180.1782723786673313136
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 02:03:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=moXcJT24;
 spf=pass (domain: siemens.com, ip: 40.107.162.54, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mFmXqjW1NR8aJO0X4vipEoODFnclxgEunDYXRu8y0OGxkOJFRr9Df4pktLiQGszZYXOMebr51t7k2/14XV8XLoCsTnPrdlEorfa3bIKJfYx+PqSPjcw0J7cmioatOFk6eDGWSFVbsyaXoQtRLkD5FJpqjnBM1nFz8YQVD76WpBdnyAcOAHkZ5chzztn4To2zRvwGyEQMrraDrr4Ls8P+HGF5FemQ2qzftMtfwEsRu65JVg3uDd3EY7dqvjXYbAigOxz0D3ls+nyBsZfJ1XRS5fpmnOeKq8ZvC80+Fdjtxy3qbumjqEANr8WgJz3k7ZqH+ZE3HakFOA7K77DpDIaLUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMocyuRUdAE6kTTsvBN9tviFrMdhimLMDBTnpxZv2PY=;
 b=O3kwc3WIbCCYvl+nLrgDFu9RFPcQVyRyL309lCxJL8QBfMDz4Tr+ReuTMqVr2oirbXLGjLwJpThNuM7zcpZvqZKFDolYkKOJyQGbomEujnGWhHgvttPe2pisk9yZ1voiWPv8xMXi/IxCjJPUzZRgtPLftYW/AYbu1u5n9Crj3Jgvr3JvGkgvWGuO7Y6nNTinQOtL4KeNehJnTEdrTkgTefO+CWKASyVntT2FERnYEayA+BU2t4vwFEweDw+08KHnylrmi4+QsuR7aOdazm+rp7LwHtapas4bMD0zNShfgEwfqP8YMbYnyVjZcrsnIkrd4eMXIoKx7dwhy+DaecO9iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMocyuRUdAE6kTTsvBN9tviFrMdhimLMDBTnpxZv2PY=;
 b=moXcJT24NXSOoikLQr5rCDbobzN+kjz9E6o9duVTkZqWXVPO+TpTqXn/4siuIYZ5nqtKrvih6OGCMlC8G9BLPdTLs1aztLw+M6RTvCz3wx5OU7o7L5vUXdSkzmstuH7qIJuhiVo+dCVjXWqCe1JsMBpxxWaM5rfW9T4+Lo5Bt5ii1P08D0nQeiw9C3TtjskgWZ4c5081AzUW7FYRg7Q//0q7XuB2tyEJsizlVRC0FPZuTbWjxH/cRnSWPGKZM4BeEulniDTWEB1h158MRoqlkm+JzU4EfY3jtViOjgNARTq8Tt5+wiIOL/djnQm2ygbx2fKONOt1QWney36KC2IgLQ==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by AM0PR10MB3585.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:154::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 09:03:02 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 09:03:02 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Quentin Schulz <quentin.schulz@cherry.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2 1/4] wget: remove pcre packageconfig option
Thread-Topic: [OE-core] [PATCH v2 1/4] wget: remove pcre packageconfig option
Thread-Index: AQHc/n8uYj/r0c95fESwfuQ39rY1wrZNprQAgAendLA=
Date: Mon, 29 Jun 2026 09:03:02 +0000
Message-ID: 
 <AS8PR10MB5073293F28886F82D409EA9DFDE82@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20260617173129.1013998-1-peter.marko@siemens.com>
 <e89fea6a-4cf6-4e1c-9661-48a40e07bba5@cherry.de>
In-Reply-To: <e89fea6a-4cf6-4e1c-9661-48a40e07bba5@cherry.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=15eb5aeb-a2be-42d2-968f-a6724fc1da11;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-06-29T08:59:21Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|AM0PR10MB3585:EE_
x-ms-office365-filtering-correlation-id: ae6a1c88-b8e9-41b5-f328-08ded5bd39ae
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|18002099003|22082099003|4143699003|11063799006|55112099003|56012099006;
x-microsoft-antispam-message-info: 
 a7fEtSsX/Zqgv/RyuI+lECAKfs2tjQxJi8rDK5LdEMyZIIZqmKtlzdLfAFSQFVEhufObO4dv22areyNmKrkeZP1+3RMCJ8Y9Xz550vS+4cG6Mu7iniAufn/x/VeaIh3WEjOUvNym4HHiZSBCHwwSiAeNuk7GI+QBkw4C+Z3SBvG/Qf6zepYKkt8FRzW6+k/7A7fsLTEl43qaWrjW5MWgsGTz9hgSOzk7lE9n8iaWXXWLzNK3rh6Nib7myLxLptqnZSQG1yEzhpNAAO/2L4VAwzhjZhzQ6roWKFghUMNvW04YlliAydk57uT9Dk9zK047AGsTsrKH5yCVkVNpoS2tc4xJJko2saAt24OuIUqYVE3y0ZwtT0bBwXmhLd5/oqzuZU7m4Lkei2vWL8wOP3kD6pogbyi1hO5HYBSi5Un8aomYxcrgtHlVmRSI6uBEEw7xKXEel/fV9PzgDBa6u7Fgy1nTjz/f3E1o3dq42RSBNleZsbqLUUJWjmn4vbhYWA/OYwc/2zyqD1LTrS7XdzfNHQp8cHBAqGO5na83CS8SSRVM/9chd4/ID5Pf0l3UxrspNPPU0GifRQcgymZ+IjCfWLZXsg08I4fc+zjISgTYo6ZFSU1EmDjKefaq4/3pvwHoVRvbbZi7jOtCNXNdRDvyZwl24H3frtE3oUIoKi/O9sCX8CAZLKfiMXKzz452cIL7wT7sAlG1I5N+scOhoRrof03uMNYgPNERyD41VjM3aWo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(18002099003)(22082099003)(4143699003)(11063799006)(55112099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WU9zeWVuUWUycHhHK01zUFhqdjZrM01HTWEvT2FrTllEVUN4Nzc2L2xhS2ly?=
 =?utf-8?B?dTBMNlVtVjV3eHRtelJUaWhqSXY4QVI3aTJGejJZQVo0WnA4K0lUanEvSVZq?=
 =?utf-8?B?RmhKa05lZGt5MHgyMENlSHAxNituUHVDaXdSOEpLckVnSHkrd3JEOE9TdDF4?=
 =?utf-8?B?MEdxUTVUVHFiVzMxQ01rRkg4N2RpRm40UE5wV1RHN0N4R1k1cDl2TEt6aGQ1?=
 =?utf-8?B?cnEvWUJYck5NZVpFUmxQSDVVL3cxYjBvRW5ETmpkYmR6cTB6MmpaTFprZThP?=
 =?utf-8?B?U3VWR0I1WTYrSjhRL29sYmlqcmhJeUdkeG5ZS1B3dktlTVY5L0R6ZVlUV2pt?=
 =?utf-8?B?NmhwcDByeDhtek4weHlEK3JEK2NXV0VIYXF3Sk9IdGFpUy9SRnhMQzEyRHd6?=
 =?utf-8?B?UlpvRThaSG8xTFZLamFvOXBWaklqZG9kdlBZMFVwWFpYaUduY1h4aEhwM1ZV?=
 =?utf-8?B?d2ozbmRnU3h5NGd6eVNDRnl0UEhWUzI2VWlhaEdYN1h6YndqTzduV0dHSDdv?=
 =?utf-8?B?THl6cHBXUkx4ZW94Y2QwWVl5RmhERHJNNmRmekJGajBNenhaK1BOek84VXJi?=
 =?utf-8?B?ZnFoT2xrd1p5WHlGVTREWkdnWGZxck1YNEJiRXZuY0lnT3pWRHk0QlhET285?=
 =?utf-8?B?eXhlbFQyeWJ0UDFKVzZpWEYxQkJBVzJrZGJxTnovMFNlUDVNQllGdURiS2J3?=
 =?utf-8?B?RDVuSkZNdkg4UTUxdkZCMjZMcDZCZGREYm1YanpRajhja3Q5V05vbTVTOStI?=
 =?utf-8?B?WThGL212VFhSQ2RBdGV2T0VkL0J1ZzVCdWQ3cXQ5bGJnaTZjQkJpcEZlOTVv?=
 =?utf-8?B?NWNieC83ZWNXWjhhb2hEWFZ1cVlFeitUekNaRUxkVno4YkZDdDB1aXJiUVZC?=
 =?utf-8?B?czJjU2E0dDR6VGNUNWdHeW44d1Z5akwxRi9iU1JVbGEvVG12L3RzVTdYd2d0?=
 =?utf-8?B?THVieS91ck54N2ZqUDlGSStmZ2Jlay9RaXVIN1lwNnBJVDlkb0lrdmh1ZC9Y?=
 =?utf-8?B?YVkwUjJYMjg3RG9aakhKM2wrZ25WRmRVemFKTmgvdnhQVi91elk0S3h4Njl3?=
 =?utf-8?B?TnBoOUNpOGN0c1pCUklyb21qQjhMc0ZoWmFKazVGdnlpd2tRK0dCR3RzV0xR?=
 =?utf-8?B?YS9TWHU4aXZHWXVCcXdyUjNTYldya2VoV2llTGxWS05nMlhQQXRJakhrdkI5?=
 =?utf-8?B?aEV1TFlSaldOZFVyTE1UYVZJS0NUS1VoS2R5K04vNE05WjVpc1Q4SitQVGNp?=
 =?utf-8?B?UERNQXJmWWQ4YnUvVHhtemgrVDl6bFhHaVdFb0hOQnRrSGppUUZEdVEzcEZq?=
 =?utf-8?B?U1IyN3BWS1dKRjVhcTFDNURvdmZSQkM1T3YrRzlJWUNJMEp5S2hrWlUwdjBW?=
 =?utf-8?B?c3BaWU9yeFJQdzhIYnYxWDlWeEJyREpGRjNKTmxvN3NwY2ZkSCs2WkNESXo0?=
 =?utf-8?B?dlNCWGhibTA1Y0phckk2TWdiNGd6bkhMKzRpVjEzUUNDQWt4RExFMVNQNUFo?=
 =?utf-8?B?V2tSdldBOHkrcnJmdHBIS2N2eDRLbWpNM3ZUWk5CakczZTVsZXpYaVlMc2hU?=
 =?utf-8?B?N1lqYmpRYUNuVjJLUjBpUkxjMnJGdlN1cUYvUklycUFaNFMxQ2YxZkVabVM5?=
 =?utf-8?B?MXVIdzNsTG9HS0l0REdYM0VEakVZTFo3dDNjVS9RQ003WXNGQStNK0w0ZlVU?=
 =?utf-8?B?bmM2dUQ0ODJ4V0JmRTl6SUFzRzdqQkl2YWN3dVdUMHlua1J5blJURGE3ck8v?=
 =?utf-8?B?SyticXVYbnhyd2ZqM3lFYmhwU0gzbm1CMmdRT3Z0R0J2U1JISkFZOFh0bStC?=
 =?utf-8?B?VnpHSW4wcnJzOWdFdFFHVFhKVitaWUNaOWJZS3RNL0NYUlQrYTVZOHhQd1hD?=
 =?utf-8?B?Yk1JZllJWFk4NXptaUZLL2NIQ25DbFFjQUlsRU93NGpGcjVnb1c2Q3Mvelhq?=
 =?utf-8?B?Wk56N3BDSEw0TUltN1kxdnRoTHZDaXNxMm81N0ZTN0twaHZrRDZ1aUtMQVN0?=
 =?utf-8?B?YUZtVFYyTElFUHlXQitpNG96Vzl2VzlYTCtiQ0ZDOEI4bjAwM3hXdFA4S2dB?=
 =?utf-8?B?eWI2UG1VZXJMSDdlb2M3QWtBZ0UrejBsdmpidFFQRzIveTg5ZjFYYXhCcnMv?=
 =?utf-8?B?cTI4YTR0MWNTSEh4bXE3b1cxZkx5elBPNmFidW5wc0dkSGNCM0VBRnNnQ1M1?=
 =?utf-8?B?cERsUE84clpybXlvZFVCMklhdDdrVjZWSG1MV2k0d1Mybi9FdmtEUFo5ODE5?=
 =?utf-8?B?aGUyaVRuVXhJVGI0SHQvRnpLY21ybmpWS3d5MkgreVIzUXorNDF1T3NuOHlP?=
 =?utf-8?B?RjR2dUFVeW14YVlpOWhWTDlCOXYwQ3prNXVVdDA0dmxLVFZGZ2ZmUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6a1c88-b8e9-41b5-f328-08ded5bd39ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2026 09:03:02.5948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RlOLkhDSejiXYExgEzqDPpyFObWW3W/x2LBr0bhgXE5MMBtbXzJyahAKQY7E0Wkg6iIyoQ8NFp88tn45ot/VpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3585
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 09:03:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239738

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUXVlbnRpbiBTY2h1bHog
PHF1ZW50aW4uc2NodWx6QGNoZXJyeS5kZT4NCj4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDI0LCAy
MDI2IDI6MDYgUE0NCj4gVG86IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMxKSA8UGV0ZXIu
TWFya29Ac2llbWVucy5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIHYyIDEvNF0gd2dldDogcmVt
b3ZlIHBjcmUgcGFja2FnZWNvbmZpZyBvcHRpb24NCj4gDQo+IEhpIFBldGVyLA0KPiANCj4gT24g
Ni8xNy8yNiA3OjMxIFBNLCBQZXRlciBNYXJrbyB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3
cm90ZToNCj4gPiBGcm9tOiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+
ID4NCj4gPiBsaWJwY3JlIGlzIG9ic29sZXRlIHByb2plY3QgcmVwbGFjZWQgYnkgbGlicGNyZTIu
DQo+ID4gQWxzbyBsaWJwY3JlMiBpcyB0aGUgY3VycmVudCBkZWZhdWx0IHBhY2thZ2Vjb25maWcg
b3B0aW9uLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtv
QHNpZW1lbnMuY29tPg0KPiA+IC0tLQ0KPiA+ICAgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3dnZXQv
d2dldF8xLjI1LjAuYmIgfCAzICstLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC93Z2V0L3dnZXRfMS4yNS4wLmJiIGIvbWV0YS9yZWNpcGVzLQ0KPiBleHRlbmRlZC93
Z2V0L3dnZXRfMS4yNS4wLmJiDQo+ID4gaW5kZXggZjBkMzQ1ODQ2Mi4uZTY2NTA1OTRkOCAxMDA2
NDQNCj4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2dldC93Z2V0XzEuMjUuMC5iYg0K
PiA+ICsrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC93Z2V0L3dnZXRfMS4yNS4wLmJiDQo+ID4g
QEAgLTIwLDcgKzIwLDcgQEAgU1JDX1VSSSA9ICIke0dOVV9NSVJST1J9L3dnZXQvd2dldC0ke1BW
fS50YXIuZ3ogXA0KPiA+ICAgU1JDX1VSSVtzaGEyNTZzdW1dID0NCj4gIjc2NmU0ODQyM2U3OTM1
OWVhMzFlNDFkYjllNWMyODk2NzU5NDdhN2ZjZjJlZmRjZWRiNzI2YWM5ZDBkYTM3ODQiDQo+ID4N
Cj4gPiAgIEVYVFJBX09FQ09ORiA9ICItLXdpdGhvdXQtbGliZ251dGxzLXByZWZpeCAtLXdpdGhv
dXQtbGlic3NsLXByZWZpeCBcDQo+ID4gLSAgICAgICAgICAgICAgICAtLWRpc2FibGUtcnBhdGgi
DQo+ID4gKyAgICAgICAgICAgICAgICAtLWRpc2FibGUtcnBhdGggLS1kaXNhYmxlLXBjcmUiDQo+
ID4NCj4gPiAgIEVYVFJBX09FTUFLRSArPSAnVE9PTENIQUlOX09QVElPTlM9IiR7VE9PTENIQUlO
X09QVElPTlN9IiBcDQo+ID4gICAgICAgICAgICAgICAgICAgIERFQlVHX1BSRUZJWF9NQVA9IiR7
REVCVUdfUFJFRklYX01BUH0iJw0KPiA+IEBAIC0zNCw3ICszNCw2IEBAIFBBQ0tBR0VDT05GSUdb
aXJpXSA9ICItLWVuYWJsZS1pcmksLS1kaXNhYmxlLWlyaSxsaWJpZG4yIg0KPiA+ICAgUEFDS0FH
RUNPTkZJR1tsaWJwc2xdID0gIi0td2l0aC1saWJwc2wsLS13aXRob3V0LWxpYnBzbCxsaWJwc2wi
DQo+ID4gICBQQUNLQUdFQ09ORklHW2xpYnV1aWRdID0gIi0td2l0aC1saWJ1dWlkLC0td2l0aG91
dC1saWJ1dWlkLHV0aWwtbGludXgiDQo+ID4gICBQQUNLQUdFQ09ORklHW29wZW5zc2xdID0gIi0t
d2l0aC1zc2w9b3BlbnNzbCwsb3BlbnNzbCINCj4gPiAtUEFDS0FHRUNPTkZJR1twY3JlXSA9ICIt
LWVuYWJsZS1wY3JlLC0tZGlzYWJsZS1wY3JlLGxpYnBjcmUiDQo+IA0KPiBCdXQgd2h5PyBwY3Jl
IGlzbid0IHNlbGVjdGVkIGJ5IGRlZmF1bHQgc28gaXQgc2hvdWxkIGJlIGZpbmUgdG8gbGVhdmUN
Cj4gUEFDS0FHRUNPTkZJR1twY3JlXSBldmVuIGlmIGxpYnBjcmUgcmVjaXBlIGlzIG1vdmVkIHRv
IG1ldGEtb2U/DQo+IFNpbWlsYXJseSB0byB3aGF0IHlvdSd2ZSBkb25lIGZvciBzbGFuZyBmb3Ig
d2hpY2ggeW91IGtlcHQNCj4gUEFDS0FHRUNPTkZJR1twY3JlXSBidXQgcmVtb3ZlZCBpdCBmcm9t
IHRoZSBkZWZhdWx0IHZhbHVlIG9mDQo+IFBBQ0tBR0VDT05GSUc/DQoNCkkgZG9uJ3QgdGhpbmsg
dGhhdCB0aGlzIGlzIHVzZWZ1bCBvbmNlIHRoZSBjb21wb25lbnQgc3VwcG9ydHMgcGNyZTIgd2hp
Y2ggaGFzIGVxdWl2YWxlbnQgKG9yIGJldHRlcikgZmVhdHVyZXMuDQpPciBkbyB5b3UgaGF2ZSBz
cGVjaWZpYyB1c2UtY2FzZSB3aXRoIHBjcmUgd2hpY2ggcGNyZTIgZG9lcyBub3QgaGF2ZT8NCg0K
U2xhbmcgZG9lcyBub3Qgc3VwcG9ydCBwY3JlMiwgc28ga2VlcGluZyB0aGUgb3B0aW9uIHRvIGVu
aGFuY2UgdGhlIGNvbXBvbmVudCBmdW5jdGlvbmFsaXR5IG1ha2VzIHNlbnNlLg0KDQpQZXRlcg0K
DQo+IA0KPiBDaGVlcnMsDQo+IFF1ZW50aW4NCg==

