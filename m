Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A1FDCA5FEC
	for <webhook@archiver.kernel.org>; Sun,  4 Oct 2026 08:58:04 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20578.1791104277460993141
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Oct 2026 01:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=vovTlQ80;
 spf=pass (domain: siemens.com, ip: 40.107.162.0, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxfRVSGxbZDQphCN/v+JzIOadW4V2fw8j+Rg+2ueKYrQ/s7JbIG/aAUuSRzpsv/x4L3Ndeov7NNW3HK5/q1fFlgiGRNmJI/hYnjXZ6fmzWwpw6+IANDmHAoF8IGppMMXu/33hqKGvu2ktonmNPfnXodSX6bm5Ozpb7eA3TI3ZlTbmJSMgDFi6HvrGpWYajDW4O8TmQG+G9lkTVNJ3Rtu3KvHXwl0NMYKsDNg3xCPgMg4DWzHGh6QdHfcXnA3Nt8bPg0IdD4G/clXQMRpOetvAlOyVQv6zNXFCwiXY9MjvmPTpUXzr1dbCoKkZNXP3UO4XD5zCIPWyzkZxS6oA4SoiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDSY6MoYdCGDfTPTfBxZAPaDRMJjQ9seI+Sjswvk6eY=;
 b=xXJmRmRfCmeDkCsXOA7Ud1FU2NG5ZldXthFVIubOrwtUO0bQ31gbcb4J0RVpagjzo/jgFU0RSOoKC8fmUyAs+k+4ViQjMHWHSXEs73ssBiSk6IhYUk6U/OM2JbqU7nPL1TX0fY3fWcQVMH9PDGSkZ+odpfpQpXq2AP2Nh3hP7D8E8UZzPXst8quKc3+5etLHlB/MJhcnI2dJ67Z5WrZn/9icpd5857hg/vgZ/0fMgj4H4UIOP1XQio8ZgQYpQnGo8fciLHcYHcDfaMD3TA3WOF3lu0qZpGoJEvEUR/vHB9AUjfjXK/h4yEcbUA6I3JvlXibdhorVV8/1mlxLEiYZ6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDSY6MoYdCGDfTPTfBxZAPaDRMJjQ9seI+Sjswvk6eY=;
 b=vovTlQ80g/Z0KGpoUhAs1w7VlWKr9p6cWI5wlHJOHcgu378PtDdWV72+0sgUCCpM2NVak06o3JfSLFX2DRPrI4uwSVzqK4axUbHunO7zvXGtCqqcSls5qYNsgCAnDyHYXMAcRegB1psXNd+/w8+W4LSH1mYmEGTCQg9OBh6GHmYSqOJnrOE1FA2u0ohCVGe6hWyImFkfyZhn61gIt7ngXGmhpP6BMdMuOv4IesOPMkA7JjYeuO5Zls3Ol5lSKTvrti3Z0sjcVKyaUaXiI2Q/GaiFBL3rOqSr3KtcdyX3FzFJlyOflGDCmskuArOfv0pxEzjVOcsVTFbe/xIwnDb9kA==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by DB9PR10MB5307.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:337::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Sun, 4 Oct
 2026 08:57:51 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0472.016; Sun, 4 Oct 2026
 08:57:51 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [scarthgap][PATCH] systemd: patch CVE-2026-4105
Thread-Topic: [OE-core] [scarthgap][PATCH] systemd: patch CVE-2026-4105
Thread-Index: AQHdU3BWlqC/CgRf0USo4SALLyaEpLbs/dcAgAAFicCAAAokgIAACAfA
Date: Sun, 4 Oct 2026 08:57:50 +0000
Message-ID: 
 <AS8PR10MB5073DDB5D1D54D58B624D0F8FD972@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20261003194926.1818550-1-peter.marko@siemens.com>
 <DLVVMW89P2VR.3URHAQSDYGZM1@smile.fr>
 <AS8PR10MB50736590C11386E097CE5C96FD972@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
 <DLVWTUYUN7V4.3NAGXC9ZGHDTC@smile.fr>
In-Reply-To: <DLVWTUYUN7V4.3NAGXC9ZGHDTC@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=08f04c96-922e-4ee4-ab35-e2dc52bae5f0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-10-04T08:56:14Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|DB9PR10MB5307:EE_
x-ms-office365-filtering-correlation-id: b2c1c479-9dc0-429d-7bb4-08df21f591f6
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|55112099003|22082099003|18002099003|38070700021|4143699003|6133799003|10067099003|56012099006|11063799006;
x-microsoft-antispam-message-info: 
 zVTPHxrzIrr4qndY978kz3U37P2mQeInn11g1Vo+WAoF/e7MqJlb7PGyqk6na4wO1RiPZa0hMdDELj7SNxgBdHUPG6e4XlQg+BPjNUMCQzEh2BAr0p9exZIWgTtnv+c5/j+Oi/cjIArDLh4BzgrifGRv5D4gt6+CP0wweNQ08TAqjXuKvZvSqNQjYjVV40sQ60ajrMOgj/qwb4O/a9Pbj2yn7vGdajF4K4/WpoP5ZqS8ajS8J6PL/0w9kW3awljYgxg+WwthTLgxYUFKjUnlbtHtMn8f358sbLu52HpNSzqvRIUMT56fQS8H3tgRVlrX8tsBCIoBC92TLnizw1Ora6BObJ0HhaFfZsc0vgnbXRvZ2gdzLBxjPD7w9UB+QE9ohtjEJ3Tk7pl8Q6q6Rpo96gkEsCMSUGbdIAu8dKqxSAIqtQNvdQCp6lAq2zRSa7c+TUE056vDwlLsVxEQgoOp24eUhAGgFH5ZVIWO8Av444cqDWAZvmgUy4DV6xZpgkiPSJe+/LsNTWn6NwN3lg/c4ykAoXIwVzaIpC0QoVrckB+5G/NIsPNoCIQOG1WbiBh3toxJvM0XGEOXC8/LlKoEJVvk4q+K8W0ciUPieQ8dp1bZOZ1fwMJloaAbumGoik3NpG2BKDXmU63otHeVQjhzL8lvsT0/WDUR1wQaRjEjBoU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(55112099003)(22082099003)(18002099003)(38070700021)(4143699003)(6133799003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Z05YTlczdFd0akR2RStaMkxGQk1mb21mMDdhbDRxNUFlcDVJQzI0b2F1cVJ4?=
 =?utf-8?B?dzJhNjgzMVcya3h5MGE2b3JYUFBVV3dmWTIzSTk1cEZWdndWMndCVlhtVE12?=
 =?utf-8?B?ZS83SXF6MU9hTjJyaHNlUTl2OHBTb1dEQjBzbmZzb0RsaEFtbXF0TTZGTHJT?=
 =?utf-8?B?dVBWckdMQzFDWkxoK0RncnAwZmF5aXYxKzV3TzFiaGZEbE9KSGhpTFl6Z3Q2?=
 =?utf-8?B?aVZXWHdsNVVaWFdYSTJxZ29TaGY3RWE3cmNXbW52R21JTTBDYi9oWXZ1c2hO?=
 =?utf-8?B?WGZRU2ErQThlVEg3RXUyYldRSkhBZ1AxcGF4WUx6b0pObWlzMjhWWVF6ZDky?=
 =?utf-8?B?eVNCb2tCbE9yS3NyM0VSQmFKUEVTVHJkNkhYaU9qM2oya3BYaU9PUDRGdTZ2?=
 =?utf-8?B?MVdSTDJTQUxDVWc0akR4R3JrK0taY3VLaDF1azhhaTVndGtvaXY2Z1gvN2Rv?=
 =?utf-8?B?bVU5Vm44UkFTVEMyQmJGK05KSFkwQThMeVM2ajF3Mkl6UDZMWGdoQTAxdTRk?=
 =?utf-8?B?SUJOYVZ3d3ZvelJNTnZGOStMZkd6aWpDR09HYmpBSEtGUUNtY3o3REkxZitM?=
 =?utf-8?B?MUFLRFJNdzlEd0ZPZ2NRYkRaUnFwd2N3YzRLNGErekR2YkczQ01aaXozMnNX?=
 =?utf-8?B?bnZ5di9JTlNBQ2xyUGQrWmJYaGdrcDIvcUM1b2MvVy9HejV5K3BRQUZJZHJr?=
 =?utf-8?B?M3NsLzlDdld4TWFaV09OR2tSMkNlQUx5NnArUHJ0d1FHa2oyZk1LOUtkVHgv?=
 =?utf-8?B?NitQTW9iNnlXbGZYYmdWakk5N0lKWERKWFkxelFzYzNiS29mSHdCN3Q0QzBh?=
 =?utf-8?B?UmVaTXNBdnRpSWhqdW1COXJ3MTErTkg2eHMxbTBKeG5PSWdQcDV1Znd4eFZz?=
 =?utf-8?B?K2JDb3pOcFllcjIwWi9TOXZqcWpXNVRNT2ZSa3Y3VlNuc0pnbDFTWjlpWE1O?=
 =?utf-8?B?WlhlREQ4d0s5VHAzSVZHYWhJdGw2bDNBcE9IVFdHNlhRZDdZa3RHZktLdWQy?=
 =?utf-8?B?azNFVHAwYnloRmdhd1M0NGFhVGVpODRYL3RmL2p6SmNmK0pwQkV4MXd6NHpE?=
 =?utf-8?B?OEZua2p3akY3cGx1TDlJZk5URHBCQml4SG5kN3MzUVNQNmRibVBVZGpnOXpS?=
 =?utf-8?B?M0h5OXlNcUphT2o5dXJrbExZb0QzVFVvZFo4dUhxQi9QQUZOZ0RYN05PbFJu?=
 =?utf-8?B?dEloN1kwc3N2ODFUUGNDaDdqQTVBN205TlBtNkxFc0lqRVZ5SDFjZXNkdnM3?=
 =?utf-8?B?TzkzU0hDTnZCc015ZTFOV3ZYNXhNZkJVM3VGQXJ2RFRScFcxaks0L284Tkkv?=
 =?utf-8?B?TTlUYXBUdm4xODZwQmVYVk0zK2ptSEs5VVc4VW5PZFNOSGJvSWJkUE5LUGgw?=
 =?utf-8?B?QmtqN2ZicVhmN3V6Q0NpaXJ6ZHVXenJROC9FVVYzUGVKaWpPK0dvQVppYUg3?=
 =?utf-8?B?ajdqZzFmN3JNSUhydnFla2ZoTzV2dWhvcTRtWGlHWS92YWRhbWFjUHhiUEUz?=
 =?utf-8?B?aGxsME9Ia3k1eW5zVlFXbXZ3a05zYzFVZnIzN0Z2U1lVMkkzQjIzUGt1THhL?=
 =?utf-8?B?cXRIZzNLVENHM1h5b01OK0lpM1Y4T0lCSjc2SlptVkVSRWQ1Vy9sWW1RU3ZR?=
 =?utf-8?B?TTlJMUJlYzFzTXNZdWQ1QjR5MVlYUVJzaU9IRWdGMXB2L2xOV1FVbFozRnlW?=
 =?utf-8?B?YVNwNmFCbW9GaXh4T3l3dk1mak80RG4yYkhhU1Blclo5dUF2Kys4TWNmell3?=
 =?utf-8?B?OXJ4NFlGU3puS0JGa09EVFNMdlNlaUVuVEhlTjZFNmd3ajMvMGpjVzhlemtt?=
 =?utf-8?B?WU1wb09icHkzcy80N2tUcm1kc2k3VkdGYUNvK1FmZUltZWRNd3hYSnMweE9Z?=
 =?utf-8?B?Wmc4NGpvN3crOTRNUTNnaHRhZDRKL2lUQ04rZTgwbXFBR2RCY01RV09uMXUv?=
 =?utf-8?B?V0ZIZ2VKOWhhYlZKYWk2Vkt2K1N4M0pWNWthUXVjR1JudXlQTERxdW9kUWZI?=
 =?utf-8?B?TzBFR3MwVjNuUGhXanN4eTFRRHRhZzZpVUtKNk5rNmVGU1dIOVM4WWFiTWZn?=
 =?utf-8?B?ODZPMHAzUklERTFzMHVVVytUUmYwRUhQRlBZYlg4TUN5bURTYTRNYzFIZW9u?=
 =?utf-8?B?cHE3OW02Qzh2cGhnQkJQa1dRZUk0TVhTTGo0L0F1bnVhY3dCQ1VXOHJ2Ujgw?=
 =?utf-8?B?UnR2VVhKUWQwTmxza3Fndm5HWmZNYUUyNXVMYzYwZ3hvWGdRVzk1QktIdlVi?=
 =?utf-8?B?UmR2WU5IazRqVEx5RWpMaUpIdG1BTFJBd2N2cEVSM2RiQ0dyQzdaUHNnQTlr?=
 =?utf-8?B?andMdFVGR0Q0cDV4QXh6bzFtcjFDbVJiYVY3UjhLeWlVSnh3K2lZdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c1c479-9dc0-429d-7bb4-08df21f591f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2026 08:57:50.8610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZiutTDf/S05Ez+uRSAKPXi18m2czW0v3QdoEsQSW3zeH55ILfjK55D53us35mPihAycyBTDGYO00sgUMknNWuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5307
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Oct 2026 08:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247198

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWW9hbm4gQ29uZ2FsIDx5
b2Fubi5jb25nYWxAc21pbGUuZnI+DQo+IFNlbnQ6IFN1bmRheSwgT2N0b2JlciA0LCAyMDI2IDEw
OjI4IEFNDQo+IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtv
QHNpZW1lbnMuY29tPjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtzY2FydGhnYXBdW1BBVENIXSBzeXN0ZW1kOiBw
YXRjaCBDVkUtMjAyNi00MTA1DQo+IA0KPiBPbiBTdW4gT2N0IDQsIDIwMjYgYXQgOTo1MiBBTSBD
RVNULCBQZXRlciBNYXJrbyB3cm90ZToNCj4gPj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWNvcmUvaW1hZ2VzL2NvcmUtaW1hZ2UtcHRlc3QuYmIgYi9tZXRhL3JlY2lwZXMtDQo+ID4+IGNv
cmUvaW1hZ2VzL2NvcmUtaW1hZ2UtcHRlc3QuYmINCj4gPj4gPiBpbmRleCA3MjA4MWY5MzhkZS4u
MDI0YzY5ZTlmZGEgMTAwNjQ0DQo+ID4+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvaW1hZ2Vz
L2NvcmUtaW1hZ2UtcHRlc3QuYmINCj4gPj4gPiArKysgYi9tZXRhL3JlY2lwZXMtY29yZS9pbWFn
ZXMvY29yZS1pbWFnZS1wdGVzdC5iYg0KPiA+PiA+IEBAIC0zNiw3ICszNiw3IEBAIFFCX01FTTp2
aXJ0Y2xhc3MtbWNleHRlbmQtcHl0aG9uMy1jcnlwdG9ncmFwaHkgPSAiLQ0KPiBtDQo+ID4+IDUx
MDAiDQo+ID4+ID4gIFRFU1RfU1VJVEVTID0gInBpbmcgc3NoIHBhcnNlbG9ncyBwdGVzdCINCj4g
Pj4gPg0KPiA+PiA+ICAjIFNhZGx5IGF0IHRoZSBtb21lbnQgdGhlIGZ1bGwgc2V0IG9mIHB0ZXN0
cyBpcyBub3Qgcm9idXN0IGVub3VnaCBhbmQNCj4gc3BvcmFkaWNhbGx5DQo+ID4+IGZhaWxzIGlu
IHJhbmRvbSBwbGFjZXMNCj4gPj4gPiAtUFRFU1RfRVhQRUNUX0ZBSUxVUkUgPSAiMSINCj4gPj4g
PiArI1BURVNUX0VYUEVDVF9GQUlMVVJFID0gIjEiDQo+ID4+ICAgIF4NCj4gPj4gSSBkb24ndCB0
aGluayB5b3UgbWVhbnQgdG8gYWRkIHRoaXMgaHVuayB0byB0aGlzIHBhdGNoLg0KPiA+DQo+ID4g
WWVzLCBJJ2xsIHNlbmQgYSB2MiBzaG9ydGx5Lg0KPiA+IEZvciBzY2FydGhnYXAgaXQncyBpbXBv
cnRhbnQgdG8gcnVuIHRoZSB0ZXN0aW1hZ2Ugd2l0aCB0aGlzIGRpc2FibGVkIGFzIGl0J3MgZWFz
eSB0bw0KPiBtaXNzIGZhaWx1cmVzIG90aGVyd2lzZS4NCj4gDQo+IFlvdSBtZWFuIHRoYXQgdGhl
eSBvbmx5IHRyaWdnZXIgYSB3YXJuaW5nIGxpa2UgaW4gdGhpcyBydW46DQo+IGh0dHBzOi8vYXV0
b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8/Iy9idWlsZGVycy8yOS9idWlsZHMv
NDc4NA0KPiAuLi4gb3Igc29tZXRoaW5nIGV2ZW4gbW9yZSBkaXNjcmVldD8NCj4gDQo+IFNpbmNl
IEkgZG8gY29uc2lkZXIgcHRlc3RzIGZhaWx1cmVzIGFzIGVycm9ycywgSSBtYXkgdGhpbmsgYWJv
dXQNCj4gcmVtb3ZpbmcgJ1BURVNUX0VYUEVDVF9GQUlMVVJFID0gIjEiJyBmcm9tIG15IHJ1bnMg
KGJ1dCBJIHVzdWFsbHkgc3BvdA0KPiB0aGUgd2FybmluZ3MpLg0KDQpXaGVuIEkgcnVuIHdpdGgg
Y3ZlLWNoZWNrIGVuYWJsZWQsIHRoZSB3YXJuaW5nIGlzIG5vdCB0aGF0IG9idmlvdXMgYmV0d2Vl
biBhbGwgdGhvc2Ugb3RoZXIgb25lcy4uLg0KSSdsbCB0cnkgdG8gYmUgbW9yZSBjYXJlZnVsIGlu
IHRoZSBmdXR1cmUuDQoNCj4gLS0NCj4gWW9hbm4gQ29uZ2FsDQo+IFNtaWxlIEVDUw0KDQo=

