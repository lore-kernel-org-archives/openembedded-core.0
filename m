Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C8EEF531D7
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 21:20:48 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3642.1776115244193287098
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 14:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=BpU1ehwc;
 spf=pass (domain: siemens.com, ip: 52.101.69.53, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohBSWn9TKvsbsUDs4f8PoobDqv5JCzVJdETWQQOHHtVHoGafQ//Ra5k8oUuMSEPDL/RGSa6zTsbuo1CZLa3VQ8GzxLrkysuC142U36ORje/4Il0kYFtchxJUaDJYXOCAGSudhqIhbzTXPWQOMrmGVRiD5qxtcSzh/+0ZvU1XmLlLxvBYLxRHCft1i4koERY7aQQ387HOV0Zk+Cbt/dMJ45CR2BhbuZvrG1eySfcez+LegJMmm5z+hUm7IkHwF5WzsVFYfywVtVqZLCr8KxU2jufgaQx0rAqW/n6aPqOPcAjkkMXAmgrqoeeRXfe/VStjUHVRRmO+inWkU1ZlDJzO2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EYBppWeJC1KtB7bzgYy5mM1o+hImW/eP0+IId2EcYw=;
 b=QNiipYwZmYT+0ltbxAy5jSB0I2gD0q1P5bo0BCrP/O+jpBM2VK6CQC/Wcyy9vxcvHy3L01yFG/niGUivYXZrIblcGU8fpkhp8Ow72G0uKX6V9Niv0ID8zgNi5bL4Pn+arJQuPfszXfqRhH6nt6S1w1FnTH4U4L7Jv8eQAmje9BM+rxRqBs0XRtbCIHXPTsSmg5tIfumAMYi3TBsI2QQOFrQuVlmbw9DlQHQf33pHys9/WmkAcIzKjIETxl+HnZyz2FkyzJRZZHLtUUY86cbUvFaKu8zYylpu/yGa68OdFQEL1BaU2M6dzWXZCZ23EzU95esz14xlrUUvVmGIZn8KYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+EYBppWeJC1KtB7bzgYy5mM1o+hImW/eP0+IId2EcYw=;
 b=BpU1ehwcTcYs77YmOLRAglBQswLq8aXD4p3eQUrxM8p5KJ4Qn7A344fy1TWATNo4E1FaLU9Q7cTMw0J3wFVp8MaDNQWDR1QA1r5JmTevQvOq1iUF+vC2R3tzPBsk/EfxN64JRK+c7qNbg//K//GmRrkyghVriEAVaUsV9/b6ZzOC4ftRyli4qhn+11cNolwda7LXAJQCvuu3shcXETxNABcF2QOx6YEDHMpC7oRxYHVPrdNxBPcE94fuTC6v/GStiPvCpdX1CBJA9iVw+24sJxOqe07nWExWkqF5WKBaL2gD71FZRUzAaMyANBuQgcjd/DkUWIOy+vAJuDGjCfoI0A==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB6412.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:408::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 21:20:39 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 21:20:39 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: OE-Core ML <openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] OE-core CVE metrics for master on Mon Apr 13 13:29:07
 2026
Thread-Topic: [OE-core] OE-core CVE metrics for master on Mon Apr 13 13:29:07
 2026
Thread-Index: AQHcyznwHD8mOIjWRkKjC+COc6vVQrXc3Z/ggACWMICAAAs1QA==
Date: Mon, 13 Apr 2026 21:20:39 +0000
Message-ID: 
 <AS1PR10MB569717A09C1B55741BDBB689FD242@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260413113708.69695-2-yoann.congal@smile.fr>
 <AS1PR10MB56971C974B642A7B02678B29FD242@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <19D8E9A0-1552-432B-96B6-DD30EB1E9CBA@arm.com>
In-Reply-To: <19D8E9A0-1552-432B-96B6-DD30EB1E9CBA@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=e1d0b606-77ea-47a6-a3a4-2fa95282a0cd;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-04-13T21:16:04Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB6412:EE_
x-ms-office365-filtering-correlation-id: f072f325-aa97-41e0-b3e5-08de99a282f6
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|55112099003|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: 
 zGmck3c8af7iQE2CuaR5E6c+mYThkzL/QC7CVxlg+hafPIagOj40XaNuXj4IJ+Nsd3vP6h8J2hn4gUHO/yNWXEAwi7qVTVdbUL6/T9yYtbt2VCK+yQxgK5ccSJ5g9uaomN5L8NPG34EjMAoTQKPL4FCQ+tKzM2uzLq2oBNKSWx6PJcsVHboe57rRA5lv7V7t9X2gvPBEYwHtSqzpTxn/fDvaKgykp0G1636Naf3XlLoS21Tm1m/SUZXpWGmOnT2FDUL8rL/KoudiIcmxlyvVj71F+OJu7d6qqdL8XZWpn9WRXIB3hkPomWBBvL8HbGI+4VfYMl1Sry0Uh9EHU2uOZKujvW/v7cPFUDQzhzNZIidwT45kiJaWxUIpTVzwYFRbP0Vi5eMLsZ5FOMHB8Ef9qCxzrs6F8OP3Ucwn5vRN0f498OlBdKrNTciTznilBguERL/ieJRJ+KI6okEQPbCiM8vhK1zDiYwH332COxOuRO6zmaIysPWpWgtUgWOfYAIU46HlmSoY1lSBY4ylIQRNNnnbDTTWHV175QJQPIBEMr2TNcqXCzemDttH4mVkbTaAFq0h8uOS0Yg3164TZdKoRFcmEYySWnoXE4rR/VOGyx2U2aWZOafAabFg3qi+ZI7kqFtfcIszod/rTk9Uf/o00i+XMzJMZNciZ3EJyNnfrkBtNpVLyV9kyp1YXRcnWOVQZlQmJZNBFBRIvnRVAMTa++zCQNQMfRv8zLobXjR98PIloR4h0XawXlIja10Y2xfT5eEg4Vvvo940JNjuv17hqpjPkU88+VM0Sv9cZXU9ufo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(55112099003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eE9NYVVFdDE4d2JDVFBHVkc2elE1RVE3bUxBL2xFY3lWRkRKeDh0S0d0MTB2?=
 =?utf-8?B?b1lna05QcjlrU0MvUThBZ2ZyMTNuS0w1Tys1SGMvcElnOGwwaDlqL0VOTi9P?=
 =?utf-8?B?aFVxZ1ZoVnh5bGNSNWdVSytUVE4rWGY5VlZ3Z2RNWER4L1IyQUl5RDZ6NjZF?=
 =?utf-8?B?dmpZQWx1eitSV0s0YStRUDdjOG80cWJKcXVkY2lHemlVRENjR21FdG83SjI2?=
 =?utf-8?B?djUvd0ZlZzlyTTVjSDFNUk8rRnZwcE8waytkS1MrTU9KMlNMNUYzL0xJNTBo?=
 =?utf-8?B?VUU0UUFEY2hKY2tnNC9vK2tVSEoveG5TSHl0TkdJT0g4cTc3Z1R0YnUvZXRQ?=
 =?utf-8?B?UmFhVXFDZzNzN25XbE1yNlFSOUFuWmZkdDJMNjJKUkswNjRYVTVOVm9VM2xT?=
 =?utf-8?B?WlhUUHZ5QmpzZ2N0N1NNdkF4TkZKV3lTbzg1L00yT1pDMXE0eDBJQnVVRUIz?=
 =?utf-8?B?UmExV0syVEc3dU5lQ2x1dXg0aWxWb1VWNlRNSjB2VHYwamU0eUovbTZwRjA0?=
 =?utf-8?B?bWE3eHJCb0x5MmxraXI1S3N4OWZxOFFRNjBGL1V6OGxmczBuNXFPajQ4VVhZ?=
 =?utf-8?B?QzFneENCRlgvZXRQUzVZR2pya0Fnc1dBZDBEU25rOFlnaWZJSnVMZ1h1aWJL?=
 =?utf-8?B?VDhidDN5TE5lN3Fva2JTSXlLZmwxeGYrUmg5SGwyN21mZy9xUWxhTEN0TW0w?=
 =?utf-8?B?OEY4WmxkTzgyWEYwNWJ2Z2s4aWVidTVUQmgzSnJBQ2VRMEJHVC9qbFdxdDBT?=
 =?utf-8?B?WktCam5XRUJ5T1FsVURoQ3FVK3FRWTVuNkFnUDVWL3JVbzljZE9XTE1BRlB6?=
 =?utf-8?B?c2NMNHdWVXh3SUJvNDhibG50d1p1blhqdld6eXJCazBEaWpBVEJKbjBUaEtQ?=
 =?utf-8?B?NmhDUUZ5cTI2VW5OeVdGRmV4emhQK29TNEUzaWY0dysvT1ZkeGhwQ3h4ajFq?=
 =?utf-8?B?RWVubzB6dlB1Z2U3MjN6cW9oSlpXQVBLa1dFL0RoOXY2b1AvSmdxb1BWc1Y0?=
 =?utf-8?B?U05RMEUweWo5SFRuTHhxSlJ5QlJuSllkU25UNVNneVBhOGRyUmVpbGpJMm85?=
 =?utf-8?B?Q0d6RFhLaTBpT216KzJvWFEzbkU3ak40RXdvT3FiTDc4cDJGU1NoQWNBYVJG?=
 =?utf-8?B?R09pd3BqaFJ2ZG1MRGdtWmZqY1FHNzRvZUcxQnYyb0lmd1VPejkyK2RVbWgy?=
 =?utf-8?B?TlhOcnVMVnJaN2dodVVLVTRnVFBLUkYrOFNMY1A5dUxPWnh3b1hSMW1OWk1O?=
 =?utf-8?B?ZEs5SlB4Q3RkYlFMc2pEZ3JhOTAzeDVGMVZjclh0VUlLbWFRK1BlTzYveWNa?=
 =?utf-8?B?NUR0ZlNZbWdZbkMwcy9lbVhUb3hmS3Z0VVBWeFVhanhvK3BGNHZDOTIreDlD?=
 =?utf-8?B?YUNzRDdOZ1ZFbzFHVnRiY0Q0VEVlYjNnVmg3bnhlVmVwM2FJTCs2WGx1V2lv?=
 =?utf-8?B?bUhEL2lqK0NTb3JkdkZvRXVjaEZPZHdzUUVxeStKczZEeHZVNDZQbjZ2MitV?=
 =?utf-8?B?Y0ZONHRMMlJRR2Uxejk0MjBqQVFvcCtocHVxdm90RTJ3M1JBQUFMZFFGbG9C?=
 =?utf-8?B?NlVVSnRRWmdUK1U0eUNsS2dUeStzNmNvNmRQZkljZ0xGZGRlRGM2Z1Q3b2Jt?=
 =?utf-8?B?Z293NDdhSDBHKzI0QVhKV29yMGk3YW9mbDFKRFVrSWhaTUxMLy9UNmJsZTE5?=
 =?utf-8?B?UTE4NnV5dGR1RjhhangxelN4N2tFeE1QbUdlWVh3QUs4OUs5U21tUDN2ZHlm?=
 =?utf-8?B?STduOCszTUhKU0V5d3JNSXh0UXVrSFMxbmVRSTBranlIMHZycExNd0syMVVX?=
 =?utf-8?B?K25Vekd4Wk1BVzlXZUhpUGF3OEtoNkhmYnJ3bjlBZk1pdFU3aVlSdXAwdkhi?=
 =?utf-8?B?cVNlZlMxdnQ0Q0xGRnR6dHJRMysrNkNGdG01RUFJWFFMSFo1RDlOZFdyNmZx?=
 =?utf-8?B?OVAyRklCb3Y2amJ4Zzh4djNGZmp1K0VjSC9DTXorcm9uUE1xMEF5d1hxMGR0?=
 =?utf-8?B?TGkwSFBZSnRhRkxWSXBqd043MzRhQll4Nmc5c3g0QTNNYnVHRXV0cDNCR21C?=
 =?utf-8?B?NmsrTExyaFdkbFd5NS9jS0t6MWtaTm40M1lKSElmSlNuUGRmVjR2T1B6aDFF?=
 =?utf-8?B?UVc3U1hJeE9ZRWg3VUEzNERqdzhuTWxWMFBTMndvNituVHlqcDBCZC8wSG9o?=
 =?utf-8?B?cDZ1eHA3Nm1zazNqSVlEZE04czF3aml2ZE9PMFcvSzhLRXo2T3l3N09UYmFN?=
 =?utf-8?B?NFFxWnlKZHM1OXVmQWlQSjNvYjN1T0NUVmtJN282L0tySC9jbVVWWGJRcSs1?=
 =?utf-8?B?TllnN3hNbzVYZmZVeTRvOUp0SE04eldUUlJQYWQzSml4VmFiL3VvZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f072f325-aa97-41e0-b3e5-08de99a282f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2026 21:20:39.3776
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d3Ooj01hjqa6Cih8DD05tnQRlOPT5fidFrENy41XA7JNMYNGD5+eOeGvJHBKpWWhZgAf9VLB54LHL8nPHqg9pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6412
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 21:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235129

SSBoYXZlIGp1c3Qgc2VudCBpdCBvdXQuDQpJIHdlbnQgZnJvbSB0aGUgZW5kIGJ1dCBkaWRuJ3Qg
Z2V0IHRvbyBmYXIuDQoNClRoZSBtYWluIHByb2JsZW0gd2h5IGl0J3MgdGFraW5nIHNvIGxvbmcg
aXMgdGhhdCBJJ20gdHJ5aW5nIHRvIHVuZGVyc3RhbmQgd2h5IHNib20tY3ZlLWNoZWNrIGlzIG1h
cmtpbmcgc29tZSBDVkVzIGFzIFVucGF0Y2hlZC4NClNvIGZhciBJIGRpZG4ndCBmaW5kIGFueSBk
ZWJ1Z2dpbmcgdGVjaG5pcXVlLCBqdXN0IHRyeWluZyB0byBtb2RpZnkgdGhlIGZraWUvY3ZlbGlz
dFY1IHZhbHVlcyBhbmQgc2VlIHdoYXQgaGFwcGVucy4NCkJ1dCBpZiB3ZSB3b3VsZCBqdXN0IHdh
bnQgdG8gY2xlYW4gdGhlIGxpc3QsIGl0IHNob3VsZCBiZSByZWxhdGl2ZWx5IGZhc3QgdG8gcHJv
Y2Vzcy4uLg0KDQpQZXRlcg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IFJvc3MgQnVydG9uIDxSb3NzLkJ1cnRvbkBhcm0uY29tPg0KPiBTZW50OiBNb25kYXksIEFwcmls
IDEzLCAyMDI2IDEwOjM2IFBNDQo+IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkg
PFBldGVyLk1hcmtvQHNpZW1lbnMuY29tPg0KPiBDYzogT0UtQ29yZSBNTCA8b3BlbmVtYmVkZGVk
LWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBP
RS1jb3JlIENWRSBtZXRyaWNzIGZvciBtYXN0ZXIgb24gTW9uIEFwciAxMyAxMzoyOTowNw0KPiAy
MDI2DQo+IA0KPiBPbiAxMyBBcHIgMjAyNiwgYXQgMTI6NDIsIFBldGVyIE1hcmtvIHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxwZXRlci5tYXJrbz1zaWVtZW5zLmNvbUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPg0KPiA+IFRoaXMgaXMgYSByZXBvcnQgd2l0aCBvbGQg
Y3ZlLWNoZWNrLCBzbyBvbGQgbWFzdGVyIGJyYW5jaCBoYXNoLg0KPiA+IFRoZSBuZXcgc2JvbS1j
dmUtY2hlY2sgbW9yZSB0aGFuIHRyaXBsZXMgcmVwb3J0ZWQgQ1ZFcy4NCj4gPiBFc3BlY2lhbGx5
IGtlcm5lbCBqdW1wcyBmcm9tIDEyIHRvIDExMCBvcGVuIENWRXMuDQo+ID4NCj4gPiBJJ20gc2xv
d2x5IGRpZ2dpbmcgdHJvdWdoIHRoZSBuZXcgZmFsc2UgcG9zaXRpdmVzIGFuZCB3aWxsIHNlbmQg
Zmlyc3QgYmF0Y2ggdG9kYXnigKYNCj4gDQo+IEkgd2FzIGFib3V0IHRvIGtub2NrIG91dCB0aGUg
bG93LWhhbmdpbmcgZnJ1aXQgYnV0IEnigJlsbCB3YWl0IGZvciB5b3UgZmlyc3TigKYNCj4gDQo+
IENhbiB5b3UgY29weSBtZSBzbyBJIG5vdGljZT8NCj4gDQo+IFRoYW5rcywNCj4gUm9zcw0KDQo=

