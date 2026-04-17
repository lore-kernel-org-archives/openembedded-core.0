Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49154F43699
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 12:09:11 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43414.1776427742206288266
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2026 05:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=jhOAXtnA;
 spf=pass (domain: siemens.com, ip: 52.101.70.51, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LhyM5CteRasa/tqfwuhYhdGlvG0u4aKz7dWjhBYLQ7FksnsFRtxYifnSySNU6EC4VJpPTYnlCMYm9NWV+d0m03+He9eNXpkm6lg3x0uEI7l0HlDmXDqfT+8p5729VmCoGq2UN5QDxZdNO5ANlv27V1WmoMD/0hwHhvxTqUZBr3N1Yzgu+NG5Tris4LwdvvJqFsPncNH1R7Mig2FApqYtigJYXsDj+YHJX3SDva76HrY5jylfi4xSSlZiCpsVoDjEsaW0uj6BWGCjVwPBU6PnHDmbX5hxJ+M6qWsnjvExxBjit9Vv+jBl7bVQWWfJSUIelvJXPy4Xe0bnXMHYD1OJww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SB0aoCzC6EdXT7OD/3aKtzmIByouC1XiBtRIOSyrj+A=;
 b=D2VaqkEkj75n6YT5kfYKJPIiItSdjl+e3MzEHQ3sVyLSPG1ZoCtb9CX5Fysn48CIRiJMh25yYdS/Lw4gsYfOKU3nt0zDPSycyIxxIOJAAnRx0pI5Jv8is11rGrxiCeVe0Yj64AFhFb7w/E2Aw4jhNSOnyLscfaH8Sn1fiwdX9GQ04KMa/p2Sk1OqyfrXViBa777hR0L9suR2zb2ImgmXwEp9ZlSZHqQlSk1HXCA4ZqPjT+zH51NrFeACywJ324pr9R8krNEpTc1nzy3MgH+2VQwXAvOsPzQznnvWjn7vl/YbbX9zKBPtq9tFN9N2rCAy8wjryJK+aVJg3J1D9BCGqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SB0aoCzC6EdXT7OD/3aKtzmIByouC1XiBtRIOSyrj+A=;
 b=jhOAXtnA3OxJNUDvUUqjemL/pzUdIcGQDa1O9uWf6027qSnzcovweVTsj1iEiBQ8zcrLf2NdORKrRbBmUWdFJD5iEEeqeBBG2paoH+eQa0Lr2FKob8T0ySnc+MMXlW+VAmt1s8BuO0GuhgSgsaMuRmU3smPDqc18pooABc+SH/EfMTuQwJoJB8Ej6KVWV4UgO13GtuTarBKwvc7sDhiaWirI8Vl2xYKNZow3tw3MeZyYBEV7QkV72oetx9yDAVxuRnUT8iiiEpsEJQSPPaeLNSgRxp6ccU+1IKo+7kjYRG2KYfjRn2LVkWTht0KIIU4SQRprAvSeDEyr9uS8KW0VkA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB5380.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:333::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 12:08:58 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%5]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 12:08:58 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>
Subject: RE: [OE-core] [PATCH] create-spdx-3.0: rerun do_create_recipe_spdx on
 patch changes
Thread-Topic: [OE-core] [PATCH] create-spdx-3.0: rerun do_create_recipe_spdx
 on patch changes
Thread-Index: AQHczkSFynLD3P4WJU+nWKjctRa5kbXjJ/SAgAAA0CA=
Date: Fri, 17 Apr 2026 12:08:58 +0000
Message-ID: 
 <AS1PR10MB5697092EBFE519DAEDAA2127FD202@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260417083025.95554-1-peter.marko@siemens.com>
 <3b0b8c914e99882168b9415dba9d001a4381e150.camel@linuxfoundation.org>
In-Reply-To: 
 <3b0b8c914e99882168b9415dba9d001a4381e150.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=c2608b87-9810-470d-a1ac-06080c86a640;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-04-17T12:06:41Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB5380:EE_
x-ms-office365-filtering-correlation-id: 0ab6bd8e-78a5-4824-4f7d-08de9c7a1aeb
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|56012099003|18002099003|22082099003|55112099003;
x-microsoft-antispam-message-info: 
 tYXjlf5HEcK1CZ1o/8GrxXZ6Aq2p1ALWGH0OFNTZH+1GpX8oXoGUofkEizLeySap4z0T94v5/Zo6LId8zw6An5cRPrA4VdKTopPIYNr4sqpbkuGmZeYU4TtYeIJMKwrEoSSyeMdIZwQU2u0pY2uhVozj//KoegV8M9xZPShzphFN2md6ALIdn4vYcP1XUuBtKYTAhuLhGZPQkz6w+feOa7fUDAfP9AA5asIbR9776PawltCM1CNhT1hcFB4RHJFfQIstA4SpZfEMTl0Ei17D/YbjQ6U/n2YPGe9wsqA2fC7CPM3H9k5yuw3D5Igv9x86gS+m0Y+OUjNDmHZf/AdaPPAaOdWZgBqYY17yO3w9xV3cxRzSrtk3d1iweVh6qoQe24elUdJmjlgjtLGEO64qgrah2871hDryj5ZxXwEBW7mxVpFgIssI/o0kNJ/BE8pPMWS+EvdTYkRq+lqMxXca1YoGIZRvQBFpB92XvlWODAyLVRcMYBk1l8PVbJu07ZQW0YYZfrtg3MpoxOvDk//zOkz8tP36fqp96VJlcS5clx7Z2E1GnS2YN+eQT0xL0W66JMaJ/M2q9bObhdnI61XA3ah+LRQ1OY2s+O+ty63EzeyNI/sDWHiH11TYcjAaxMkdkpJPvMHB+9Y711QjtkNt+ZuMilhSCu7cAfLBHUimicb0PZ98wqqV2AyAKvsnislFfWS9mDilRVzzn4CrDSuelknVCeDutM7b/eDLO20sHWm2w2NhoiToMQ/xItvwiI2ekk6Zk+KuGvJz0WYjdZ5GrahRCOWTgby/QWskIWBl4Dg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(56012099003)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aXdKclB3aExiUDlQYlFnakZlM3pJT3duV3VPMlVWMGcyNTNxZ3U2VGJsenRH?=
 =?utf-8?B?TUlaMzdEeTVSUzJZaVU2R1Fjb3daNHhKTk5pai9pdkkzUENBUXVzNUxEc1B3?=
 =?utf-8?B?aUNETXJjVTFkTmxRUTFFYk1KTVBPNDBOM1E1dlFneDFUbGdnWDhMTUxqeENT?=
 =?utf-8?B?alliUi9OeXd2V1ZPRUpTaXBtNTljL0FqTlJhdmFuYjdhK25WVSs3eDNsa0Ju?=
 =?utf-8?B?dFJleUphN0wrRkFLbElUR282SFlLMTZiZEs4TXJteEVoS3VvUWFQYlFrTlhL?=
 =?utf-8?B?UDNBaFFVb3A3bEFPMW1MZjR3b1RpSHhWV3JLTmM4VU91OFh5Y0ZYOVhiSzYz?=
 =?utf-8?B?YWFFMC9oY2FuWERxc1ZhYWhsUVY4M0ZtbkJNRXU1WnF4RXJSSUxtelhaVFBF?=
 =?utf-8?B?OXNsQWkxRFhnek01bldaZUZLRWNXK0pEZ0FFYUxVK2EzbTRIbXd4N21SZ1hP?=
 =?utf-8?B?bFBoNGV1MWQ0UExWWVBhTjN2dXNSRWMzbG5zVUMwWnpNaVBjaVVVQzBVelZy?=
 =?utf-8?B?bGpwZjdENEl0cTV4TzY2QmF4OCtjRDJMM2JqQUVyZkYrcE9GOXk2d1dmTWxJ?=
 =?utf-8?B?Z0pFM1puRkhmZjNLTTRsYTRrMExBaGdtcFlUcGZyT2ZhSll0QWt6eXhRRDMr?=
 =?utf-8?B?eUx1TjlsUXJSeTFINTVxZkNYcFF6SHNQMUZML0h5WEZmQlBPTVBMbjNvM1Yx?=
 =?utf-8?B?ZXcrTnFtUzMwajVuQ1QzbTIrRmJWbHlYaVBidGI2VG9MRTNjOWNIMUxZemg4?=
 =?utf-8?B?RVlVQnBjL0ZtTG1EUVMvalJtNGFoaHlpdlA3Zm44VGtUOGV4T0xqOU50ZEc4?=
 =?utf-8?B?VGU1T0NEMDNWdG1IRzJzd2REUFlmeDF1Zko5MWI0bG43YVh0c0tKNkR3Y2R3?=
 =?utf-8?B?UEg1amc5OUEzbGFYd1BjTlhHcWdYTWZvYndsQVdFbHJNcmcyWXczbzNDWU9E?=
 =?utf-8?B?dThkSEV0VEJ1VnFhNlVmRHA2SWt3NWhqOWdEUHVPaDFuT0ZteVhqSDQyWmRp?=
 =?utf-8?B?SUdteWgxNWhhNFRld3diVy9maXp3TnJ4dUxOREJueDBJTDVLdTVaOG9lMXd1?=
 =?utf-8?B?QjN2a3NjZGVwTHI4QXFpTlAvVDRIUXBrSEtCdk9mcjBNdG5mWDZhU3lHS2Vu?=
 =?utf-8?B?U2VqZk14TFJRb1NtSVd5aWsxaGZJcEJpbDU4Qnl1YTdOa2pmbHh1TzMybDRR?=
 =?utf-8?B?TTAzTzdDbFNIZUU5Zm0wcWU2NmhvZ0FlWDQ3VkFLUmJoUTFZWDV6ZXN2eWZj?=
 =?utf-8?B?NFNqMzFaQlJDamU5U25sSGErM3BoTGRPNFVlclZHUVVTWG5US0ZQV04wZXB2?=
 =?utf-8?B?Ny9EQmdIbmZBZ2ZoaDRnazBEdkJ0VldLN25PZzJPT25SeHRLQXBRcVpiQkpX?=
 =?utf-8?B?Vm42VDNnVFM1d1ZTTUtRZ29ZaHA1YXNDSnFtTnl3VHdoaUJoREg2ZmVLWlVL?=
 =?utf-8?B?dGxuOHhiSGM1MXQ3bXc0bnVpY3Z0bzY2cXdiSW0wOUd5cVNreHB3akNrZENh?=
 =?utf-8?B?WDFEbzJLaG5YZnJiZk5NcGFiWnRLNXdSQ2l4SFdpc0JMSmFBYlFSWHpsNE52?=
 =?utf-8?B?OU1KQ2lSWjlDVlNMR3U0RC82VmdGeG5VNFQwU0RFUzcxYit2VXJtUDN5ZFhn?=
 =?utf-8?B?WjVXbmsrNGtEOFVvVjlnWmdXcHJDZnZTdGU0WFBSdGRGQkJuS09xZEF5M0Fj?=
 =?utf-8?B?aGJLN09oSG1mOEQ0SEJwRzdha2dJTVVmQXdvRjRYWHY0dVdyczVjTE9JMVEr?=
 =?utf-8?B?MlRRdVMzcWg1bzJYcGhYWUdSV3dTK0xHc2tOdE54ZllCL3FXUU5OZmFIYVdB?=
 =?utf-8?B?dktEMWM0cEptdjhydXVCWnJYTTBBRFl6aGx1Q1ZBZkNIK2xRL3JXZFB6ZDdq?=
 =?utf-8?B?WjAvSHRVdTdTTTN0TC9qMXdzMkZtM21VNnVEV0p3ZmMySDdsNHdYd2JzQ29D?=
 =?utf-8?B?bVNlRGNwbWxhemhqL2NoNWo0cjdManFxVXp3UWFnTWoybjQ5azFwM0pnSGI1?=
 =?utf-8?B?bVo0c0s2VlQ5MUR4NmFENzdHQzI4eFQrQkFRWjJwRjdUZExQdU1mSUZKbG5u?=
 =?utf-8?B?SGQyUVdhZ2J0Z1ovcjhCbFE2MGVmc0VDUlU4MEtRN2czQW9iekFLM3NTNE5G?=
 =?utf-8?B?RmlvOU5wK1h6TXBsUWVvem1HYVZLSmNjc0djVWY5d0gwSG9iVUZjclhQRHlU?=
 =?utf-8?B?d3BjTTVpZlo0a3RzODRxRnlZOHdwZmRFYnZLSGF0ZUNXSHFaakRrMEo2VHFX?=
 =?utf-8?B?UFVDN1FmeXlJdlZoejRzYTNabldHKzUrN2dwbzFDQkhNRVJEeGEzR1FqNWEv?=
 =?utf-8?B?N0xidy9hdEFvSTd5ejllMFJSS2RCbURGcDMxMTlVZ29jTVd4a3h4UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab6bd8e-78a5-4824-4f7d-08de9c7a1aeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2026 12:08:58.4315
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xjVBI6PC7G11ZzdS/soHO5ukGmkphASnYvzM6aCx9snk6sqd3V8SWktOR+WC9e32j3yTsiwlmwUwKDHBEA15Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5380
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 12:09:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235497

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUg
PHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgQXBy
aWwgMTcsIDIwMjYgMjowNCBQTQ0KPiBUbzogTWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEp
IDxQZXRlci5NYXJrb0BzaWVtZW5zLmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IEpQRVdoYWNrZXJAZ21haWwuY29tDQo+IFN1YmplY3Q6IFJl
OiBbT0UtY29yZV0gW1BBVENIXSBjcmVhdGUtc3BkeC0zLjA6IHJlcnVuIGRvX2NyZWF0ZV9yZWNp
cGVfc3BkeCBvbg0KPiBwYXRjaCBjaGFuZ2VzDQo+IA0KPiBPbiBGcmksIDIwMjYtMDQtMTcgYXQg
MTA6MzAgKzAyMDAsIFBldGVyIE1hcmtvIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IHdy
b3RlOg0KPiA+IEZyb206IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4g
Pg0KPiA+IFZhbGt5cmllIHBhdGNobWV0cmljcyBmcm9tIDIwMjYtMDQtMTcgaXMgc2hvd2luZyB0
d28gQ1ZFcyB3aGVyZSBwYXRjaGVzDQo+ID4gd2VyZSBtZXJnZWQgdGhlIGRheSBiZWZvcmUgKDIw
MjYtMDQtMTYpIC0gaW5ldHV0aWxzL0NWRS0yMDI2LTMyNzQ2IGFuZA0KPiA+IHJlMmMvQ1ZFLTIw
MjYtMjkwMy4NCj4gPiBSb290LWNhdXNlIGlzIHRoYXQgdGhlIENWRSBwYXRjaGVzIGFyZSBldmFs
dWF0ZWQgaW4gdGFzaw0KPiA+IGRvX2NyZWF0ZV9yZWNpcGVfc3BkeCB3aGljaCBkb2VzIG5vdCBo
YXZlIGFueSBkZXBlbmRlbmN5IG9uIFNSQ19VUkkNCj4gbm9yDQo+ID4gY29udGVudCBvZiB0aGUg
cGF0Y2hlcywgc28gaXQgaXMgdGFrZW4gZnJvbSBzc3RhdGUtY2FjaGUgd2hpY2ggY29udGFpbnMN
Cj4gPiBvbGQgKHN0YWxlKSBkYXRhLg0KPiA+DQo+ID4gTm90ZSB0aGF0IHRoaXMgd2lsbCBtZWFu
IHRoYXQgcnVubmluZyBzYm9tLWN2ZS1jaGVjayB3aWxsIHJ1biBkb19mZXRjaA0KPiA+IHRhc2sg
Zm9yIGFsbCBldmFsdWF0ZWQgcmVjaXBlcywgaG93ZXZlciB0aGF0IGlzIG5lY2Vzc2FyeSB0byBj
YXRjaCBhbHNvDQo+ID4gY2hhbmdlcyB3aXRoaW4gcGF0Y2ggY29udGVudCAoZS5nLiBhZGRpbmcg
YWRkaXRpb25hbCBDVkU6IHRhZ3MpIGluDQo+ID4gYWRkaXRpb24gdG8gcmUtcnVubmluZyB3aGVu
IGFkZGluZyBuZXcgcGF0Y2hlcyBpZiB3ZSB3b3VsZCBvbmx5IGFkZA0KPiA+IGRlcGVuZGVuY3kg
b24gU1JDX1VSSSB2YXJpYWJsZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIE1hcmtv
IDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPiAtLS0NCj4gPiDCoG1ldGEvY2xhc3Nlcy9j
cmVhdGUtc3BkeC0zLjAuYmJjbGFzcyB8IDIgKy0NCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvY2xh
c3Nlcy9jcmVhdGUtc3BkeC0zLjAuYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy9jcmVhdGUtc3BkeC0N
Cj4gMy4wLmJiY2xhc3MNCj4gPiBpbmRleCA0MzJhZGIxNGNkLi5kYjFjY2MwYzgxIDEwMDY0NA0K
PiA+IC0tLSBhL21ldGEvY2xhc3Nlcy9jcmVhdGUtc3BkeC0zLjAuYmJjbGFzcw0KPiA+ICsrKyBi
L21ldGEvY2xhc3Nlcy9jcmVhdGUtc3BkeC0zLjAuYmJjbGFzcw0KPiA+IEBAIC0xOTIsNyArMTky
LDcgQEAgcHl0aG9uIGRvX2NyZWF0ZV9yZWNpcGVfc3BkeCgpIHsNCj4gPiDCoMKgwqDCoCBpbXBv
cnQgb2Uuc3BkeDMwX3Rhc2tzDQo+ID4gwqDCoMKgwqAgb2Uuc3BkeDMwX3Rhc2tzLmNyZWF0ZV9y
ZWNpcGVfc3BkeChkKQ0KPiA+IMKgfQ0KPiA+IC1hZGR0YXNrIGRvX2NyZWF0ZV9yZWNpcGVfc3Bk
eA0KPiA+ICthZGR0YXNrIGRvX2NyZWF0ZV9yZWNpcGVfc3BkeCBhZnRlciBkb19mZXRjaA0KPiA+
DQo+ID4gwqBTU1RBVEVUQVNLUyArPSAiZG9fY3JlYXRlX3JlY2lwZV9zcGR4Ig0KPiA+IMKgZG9f
Y3JlYXRlX3JlY2lwZV9zcGR4W3NzdGF0ZS1pbnB1dGRpcnNdID0gIiR7U1BEWFJFQ0lQRURFUExP
WX0iDQo+IA0KPiBXaGF0IGRhdGEgZG9lcyBkb19jcmVhdGVfcmVjaXBlX3NwZHggYWN0dWFsbHkg
bmVlZD8NCj4gDQo+IERvZXMgaXQganVzdCBuZWVkIFNSQ19VUkksIG9yIGRvZXMgaXQgbmVlZCB0
byByZS1ydW4gaWYgYW55IG9mIHRoZQ0KPiBjb250ZW50cyBvZiBpdGVtcyBpbiBTUkNfVVJJIGNo
YW5nZXM/IE9yIGRvZXMgaXQgYWN0dWFsbHkgbmVlZCB0aGUNCj4gcGF0Y2ggY29udGVudHM/DQoN
Ckl0IHJlYWRzIGZpbGUgY29udGVudCBhcyBpdCBzY2FucyB0aGUgZmlsZSBmb3IgIkNWRTogeHl6
IiBzdHJpbmdzLg0KDQo+IA0KPiBJZiBpdCBuZWVkcyB0byBkZXBlbmQgb24gbW9yZSB0aGFuIHRo
ZSBjb250ZW50cyBvZiBTUkNfVVJJLCBpdCBzaG91bGQNCj4gaGF2ZSBhIGRlcGVuZGVuY3kgYnV0
IEkgdGhpbmsgSm9zaHVhIHdhcyB0cnlpbmcgdG8gYXZvaWQgdGhhdC4gVGhlDQo+IGRlcGVuZGVu
Y3kgd291bGQgYmUgb24gdW5wYWNrIG9yIHBhdGNoLCBub3QgZmV0Y2ggYXMgaXQgc2hvdWxkbid0
IGJlDQo+IHBva2luZyBpbnRvIERMX0RJUi4NCj4gDQo+IEZXSVcsIHRoZSB3YXkgZG9fZmV0Y2gg
cnVucyBvbmx5IGlmIGl0IG5lZWRzIHRvIGlzOg0KPiANCj4gZG9fZmV0Y2hbZmlsZS1jaGVja3N1
bXNdID0gIiR7QGJiLmZldGNoLmdldF9jaGVja3N1bV9maWxlX2xpc3QoZCl9Ig0KPiBkb19mZXRj
aFtmaWxlLWNoZWNrc3Vtc10gKz0gIiAke0BnZXRfbGljX2NoZWNrc3VtX2ZpbGVfbGlzdChkKX0i
DQoNCk9LLCBpbiB0aGUgZXZlbmluZyBJJ2xsIHRyeSB0byByZXdvcmsgdGhlIHBhdGNoIHRvIHVz
ZSB0aGlzIGNvbmNlcHQuDQoNCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCj4gDQoNCg==

