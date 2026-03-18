Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D339F103E185
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 13:59:00 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14679.1773842336433472398
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 06:58:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=azjy4UQC;
 spf=pass (domain: siemens.com, ip: 52.101.72.36, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RXlvzqFBxZ2u+sDBi+3eS7q5rqnu5n2OWX5EkxJnOHnjQrcoxerT3vnpSgQ5745WdHV9CU2sBlaggZXyOIFQjrS4OOnjaY2r4uLfR6fF8GzyRqOP9P+pNjdq9VsPlJXGfwf0IcYpYQqtR2L7uy1f2wRmX2oRg5yDoSPS5VxbdqLltxM4C5I4fUyGu2chpRsF3Ovv7FOYzzlxSFGLlshHnXid7PXWfz8VyJQoW8hhU3gNTrglgaBFvUGrbEvshCuZ1ernTkid7wT/pkgcytNUtq8kWhLa+8c7e8RAko40UKCrVCWfY7A10APQtBdUydpFDMcxj7ME/nCVjIdWkdZ9tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3hSWHubLJalC1We0qrlL1+nue8faG6wNzeW+/VmiVI=;
 b=JGrsuq6qe7CEL1JbqR+LwEm+WszuIcjMy60bLHj1k5Ee9OKk3e0lwbfIYM+RYkhDXDey9+yCZPzt77f8jjvjkBnRjjxl7AffJtd248UQlYWFoyqgjnRFgq+07R8KcLT1n9O5gJW0QRh1I3uKh4V7vHDAg/3GqTgP8kitzoHOaYK5S2J+h6ObjFFUSdCCQmmuVd2++XG4uMnFxxDX8THs8iItpCWZHpeGLkreahyD+pBTsucWVC4X4hN3mPsuCHexHHVNQlG5gNr4LviHfgdnTzLIZzTDIxO59k6DU6/RX7jYTdM41HSJeVORHDpUMAszeP34qDcKuTmqgDyQY9ycag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3hSWHubLJalC1We0qrlL1+nue8faG6wNzeW+/VmiVI=;
 b=azjy4UQC1R4Hg1EEjXvs+cojA1xK2sclFSH8BWWNC0VKOL2rllYHEy0yui9wXJr7rqFQ6NZ6w4JpGCt3Ajz+F2+4JzAbEQaYIjWQtyE2NxGTn/0fE9OI3inXEmbEF0iqlcrxGVAjQcFqBA/w89oX9Fh/7dRzsgy0DHYyR3SRlJka+HxNEt+DhfHDfHLZx1R+TGz35sqtG3MChgDJtX8qDt9IEdfAAUEoxX/MfqQ8LM1R0hRHkVKyNn4Z3OCMupIFi8yAegyteCTdQviQhlOk3L35rC4/2SSqj9uBMEavbs+r143x+UyQw72+6Ly7ZnTb1s9E7bxjOx0mi00/ajXOdA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB6227.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3ee::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Wed, 18 Mar
 2026 13:58:50 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 13:58:50 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "ankur.tyagi85@gmail.com"
	<ankur.tyagi85@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][scarthgap][PATCH 3/3] tiff: ignore CVE-2025-61143,
 CVE-2025-61144 and CVE-2025-61145
Thread-Topic: [OE-core][scarthgap][PATCH 3/3] tiff: ignore CVE-2025-61143,
 CVE-2025-61144 and CVE-2025-61145
Thread-Index: AQHcrf4cIOqk22yYZ065SAKIWP9aPLW0XiAAgAACKLA=
Date: Wed, 18 Mar 2026 13:58:50 +0000
Message-ID: 
 <AS1PR10MB56979261E8061598669F8586FD4EA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260307064540.1257672-1-ankur.tyagi85@gmail.com>
 <20260307064540.1257672-3-ankur.tyagi85@gmail.com>
 <DH5YA0P6BUNT.1ORBJDTA4DDT3@smile.fr>
In-Reply-To: <DH5YA0P6BUNT.1ORBJDTA4DDT3@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=7b517ad5-46eb-449a-9905-eaf130f40e23;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-03-18T13:50:08Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB6227:EE_
x-ms-office365-filtering-correlation-id: 4fabd157-3173-4544-ddb8-08de84f67bd3
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|18002099003|56012099003|22082099003|55112099003;
x-microsoft-antispam-message-info: 
 B+t13sSCAcYF+RIrZQRVfMpo1ePmRQQTwpGnvfdF9PUpJX8nyaxIzrF2rWLKsHLOSBEb0/213NtK8gDfP2Rmpsf/KpTWFiXSOdvvxWkLcBlDjED/B5h8nUB974Icu4OC4JhvAFnSPDe/LbAop6EeU05fCLlNmZIPLOWKIm8+9JCQ85+Yugq8h3jfHbDZw9D8BHABQbi1SJwHKrkP3lig38Tk2jTLsJ6iB79sTkVdqUr6lITLJBXrLvivvDxerhl2c38M5VjT9DbTjp/wPycP42SiwT9ZjUqUj7SsOMW2bNS7G4+Qlev69LBA1fvcmD7danrZ4vm5KiPFSfOEUdjwrMFNk2Rqbqpr/0XzRvdfkR+KLQOGKVuegfxVAlieP+EwTtAn5ckAevJZG4ivThIuL7g4zPa2MoBe3yH8heym4UmhhVvpGKH4D5nKX8hIq0HesRwLFOERAhqXoDhZgXvSnCQoViYNHB3s9+LC3xGtey11LwyF3tDAdRmPDzNC/CslktSy0hmVCBWf7ElCkl/8EPKDmgn+HGAfs5eCug+z4LaxDjsczu4NNOlb3gsWFM70WD+trstp78m7gKWF+mSSZRyW24rVu7n9URvlDhoQ04CYv1Cr2xxyL+15FIl5NVQPqmtmbQ/9Fb2OIo8iqMmSThFf+l9rsQ5VhSZk1HMAuWzw3tPsjjOxVbVLiCmnHsYE7lrqOXCT0e+YIpWZou/sb0No2OhuZT0cd0YbOXTmJvA/QUPM8kQh6CD2Ezwb34ColN8bgy+nSPGVd9jnZMYQV1W0sd6ai5l8artS/S7AQNk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(56012099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eGJCckNFNDlPWmZuQlZHWnlRQVFjWHEwUlJzOERvV2FPZzdaT2pucW1oeHRk?=
 =?utf-8?B?VmhDRHYrbmtBVG5iSGxNSTVKRHhKQnd5KzNRM0FIaEE0QXNacXVMTjZvOFRo?=
 =?utf-8?B?SFI4cGpXeGE2SWNWeno2cGE4aXFrakpGNzFOdkV1OUcxUVFEVVR0dG43WXk0?=
 =?utf-8?B?MHRXSWRiakZ6YVlzMzFBSEgrYmowTmR0YW9xWHRuNUdOS1F6a1FwbFVwdjZL?=
 =?utf-8?B?ZjZ6czN5WTNYM1BXUDlmS0NaNHlDNWRHY3ZhSy92Uy9JcU9iM1BlOG9YNXBu?=
 =?utf-8?B?emFsYmJQUlBsem5qK2hUZTd0ZE9ZUFpDWFdoQmxQbWdZNUcydThWdW9OZWV4?=
 =?utf-8?B?ZTRPbEVGd2R1VHJYYi9uUHBlRzhzUGtpclBRWWxoSzBUb200bXBaRkI5NmlK?=
 =?utf-8?B?ZWVWY1lCVDh0eEQ2WlNNUytBR1BCbHNXMmZseTlkS1M5TlZmZ3VjZ0FjbU4v?=
 =?utf-8?B?Z2RoZjMybm15cy9iTGFGY2QwRmk0dzBXNkZUSDM0N00vcTQ0YlJKME5wUmJB?=
 =?utf-8?B?R2JkZ0xDVkYybnVjMWREUEZYblZsVG5KTTdSSEgxVkdub3NKVUVUMEVFL0xq?=
 =?utf-8?B?TXd4Y0lnUlF1T1ljRkZXaVZYQ2VKL3FxYnBjemxJMnZJZ1FmQTNYRHp6dGhO?=
 =?utf-8?B?Z01CeUNja2xsQUNibTFCa1U2TVNmNVJ5Y3B0WEljNlRDYzFoWEFjclczcmpN?=
 =?utf-8?B?SWlBWVNjYVJVc3VBbXZEbjlsOVZGdmcxMnpidnFlUG1WRDEvY2lGZHpYN3Vr?=
 =?utf-8?B?c2ZwR0F4WUM3ZmxJTmdhUVJ6SGhkdGgxOXNMaG5JZFFuYjZTZlRoWVptNlNE?=
 =?utf-8?B?bUZVVCtFRytXR3lZbnhkdk5RNnR2bEYyS1lvUERPYURBSDJuSkFoc1dTNFRW?=
 =?utf-8?B?bWZFanRzYjdUbnAyakxxbTUwT0tweFQ1dTJNWHFjUk1ZL0lkT0kzTEc1akdD?=
 =?utf-8?B?eHJmcVZscGp6YXgzc01jb2FIcWxaRDYvcEpSTEJVVzdhQlRmTGJaNWI3Mjdz?=
 =?utf-8?B?V1pLc2U4R1RubkttdzhiaSt6SGVjZkVoSU9ZNFM5Zy9KRnpETUg5WTZhMVFy?=
 =?utf-8?B?Q1ZBYis0Um5nK052Y0tCZkQ0KzY5MlBJMXpFQWtOMnhTcEpUSHpIdHBSVVd3?=
 =?utf-8?B?OWFlMmVsU1M5T2hZa1k4RVhDMWt4Wk9teUY0Wmowd3hsbnVESE5UY20zNDdt?=
 =?utf-8?B?bHYvaUwyYjlxU1ZIRTk0SlVnazBJZCs4N0srWnFQQkMwUy9iazBaanF4d2Ey?=
 =?utf-8?B?b1hvOVBOYmlRU0RTVmhHTzZwTXpBVmhiZnIyaTdVWEJocmQ4NzlxdmJPZ2s0?=
 =?utf-8?B?c3BUd2lzcHpQbVNsV3JPamE1MTNSSXkwdDZLVWxFSkhLbmJzcDRydnZ3Z0Y1?=
 =?utf-8?B?akNyb1hHRHFmS2Jad3plcGtPdGxlcUlKY1ZBUFlRbG1sWVZzVUZjTzMySnUx?=
 =?utf-8?B?Y01tVjQ5Z0QwSmQrbHVjSWZCbGxwK1orUVJkLzZReERRcnRWTXpRWjROZ1NO?=
 =?utf-8?B?MHlCYWxlOVdMUjVDVDFrTTFpT0t2b3V4bklLaGdCMXJ2K0hWcW9uVEpTelBV?=
 =?utf-8?B?anhQWTZCcW5KMktJejRDbzJkeERrb2FkOXpnUlp3S3JrVW8rcVp1M3V2aDcv?=
 =?utf-8?B?azlMZnVka3drdnR5c21yU2FxbmpEc2d6V2E2cHJlTk1MVGFVRFNNWG5aM2Yx?=
 =?utf-8?B?c29vVnJ2bDBpZE01WGpWRmpmdXo1QkMwaGRqVndTT0dxTEIwNDZHeHlLYTNu?=
 =?utf-8?B?cjV0cFRCSko5b0Q3SXcrMCtFdGlhazd4a2ZOQzZzVmNIL25hOWxGT2NwQlNl?=
 =?utf-8?B?cjhZK2taam00YUQwWnRyTHBoYzU1STZMZW50QVBscWY1c1IwVkwrblRudFZE?=
 =?utf-8?B?aTE4NDZPcUxBZ1QzSlFBejY5SE9SWGFUSzlYSFIwU2lwS3prYkJZdG54ZDJy?=
 =?utf-8?B?VDU3cVRrbUpBK015K1pWeFdvOGFBa2Y0WVJUZHMxSTd2ckNFVDZFSXlNckZy?=
 =?utf-8?B?OEFrMlVkSjcvREdJRUFybTJXNWt1VktMZGp2SUNGRWVGYXBzUWtwNVVMK01y?=
 =?utf-8?B?Y3d3VGVSdmZWSkJxY29UT3o1NkNYZ3VvNEMxcVhqTGxCb0lKemlUYklnWGVr?=
 =?utf-8?B?a0tramp2MjV1WEJQYWllNlFBY1lFQW9LNEhvOW5nY2t3S2tQZXcyY0ZZM1A5?=
 =?utf-8?B?bGx5ZHhQTlpHTHBTNXpIbkoxLzVnY0I1YVBUTmhpRmFGczM3ejZuREFwWmRv?=
 =?utf-8?B?MGh2dEJBM3N1a3Q1NnNOSzlrSTZXbkRpNk12MzlQSjY3VjdnZU9vMUFoNnpI?=
 =?utf-8?B?ODJJdEhyRW5YanUxRzJjdXcvMnFGODd5TFp0Y0VHN2ZxakZuYlJ4dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fabd157-3173-4544-ddb8-08de84f67bd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 13:58:50.7061
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lNEO2bNMjFCUvVP5GpRQhyFLG7tE3z1Sv0cM5/4Ul8G8F1jjSok0q4HOH6dS/2oGnAevajV0GVSNBZNObDfgDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6227
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 13:59:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233404

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBZb2FubiBDb25nYWwgdmlhDQo+IGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gU2VudDogV2VkbmVzZGF5LCBNYXJjaCAxOCwgMjAyNiAxNDo0Mg0K
PiBUbzogYW5rdXIudHlhZ2k4NUBnbWFpbC5jb207IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXVtzY2FydGhnYXBdW1BBVENI
IDMvM10gdGlmZjogaWdub3JlIENWRS0yMDI1LTYxMTQzLCBDVkUtDQo+IDIwMjUtNjExNDQgYW5k
IENWRS0yMDI1LTYxMTQ1DQo+IA0KPiBPbiBTYXQgTWFyIDcsIDIwMjYgYXQgNzo0NSBBTSBDRVQs
IEFua3VyIFR5YWdpIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IHdyb3RlOg0KPiA+IEZy
b206IEFua3VyIFR5YWdpIDxhbmt1ci50eWFnaTg1QGdtYWlsLmNvbT4NCj4gPg0KPiA+IFRoZXNl
IENWRXMgYXJlIGZvciB0b29scyB3aGljaCB3ZXJlIHJlbW92ZWQgaW4gdjQuNi4wWzFdDQo+ID4N
Cj4gPiBbMV1odHRwczovL2dpdGxhYi5jb20vbGlidGlmZi9saWJ0aWZmLy0NCj4gL2NvbW1pdC9l
YWI4OWE2MjdmMGE2NWU5YTFhNDdjNGIzMGI0ODAyYzgwYjFhYzQ1DQo+ID4NCj4gPiBEZXRhaWxz
Og0KPiA+IGh0dHBzOi8vbnZkLm5pc3QuZ292L3Z1bG4vZGV0YWlsL0NWRS0yMDI1LTYxMTQzDQo+
IA0KPiBUaGlzIENWRTogImxpYnRpZmYgdXAgdG8gdjQuNy4xIHdhcyBkaXNjb3ZlcmVkIHRvIGNv
bnRhaW4gYSBOVUxMIHBvaW50ZXINCj4gZGVyZWZlcmVuY2UgdmlhIHRoZSBjb21wb25lbnQgbGli
dGlmZi90aWZfb3Blbi5jLiINCj4gDQo+IERlc3BpdGUgdG9vbHMgYmVpbmcgcmVtb3ZlZCBpbiB0
aGUgY29tbWl0IHlvdSBtZW50aW9ubmVkDQo+IGxpYnRpZmYvdGlmX29wZW4uYyB3YXMgbm90IHRv
dWNoZWQgYW5kIHRoZSBwYXRjaCBsaW5rZWQgYnkgTlZEIGFwcGx5IHRvDQo+IGZpbGVzIG91dHNp
ZGUgb2YgImFyY2hpdmUvIiB3ZXJlIHRoZSByZW1vdmVkIHRvb2xzIGFyZS4uLg0KPiANCj4gQXJl
IHlvdSBzdXJlIHdlIGNhbiBpZ25vcmUgdGhpcyBDVkU/DQo+IA0KPiBGWUksIFBldGVyIHBhdGNo
ZWQgaXQgb24ga2lya3N0b25lOg0KPiBbT0UtY29yZV1ba2lya3N0b25lIDA3LzE3XSB0aWZmOiBw
YXRjaCBDVkUtMjAyNS02MTE0MyAtIFlvYW5uIENvbmdhbA0KPiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9vcGVuZW1iZWRkZWQtDQo+IGNvcmUvOTQ0ZjQ4MWQyMTRiZWJlYWY1MTc2OWQ3N2ZlMTZj
ZDkzY2JmZjM1MS4xNzczNjUyOTQwLmdpdC55b2Fubi5jb25nYWwNCj4gQHNtaWxlLmZyLw0KPiAN
Cj4gUmVnYXJkcywNCg0KSWYgSSByZW1lbWJlciBjb3JyZWN0bHksIHRoZSBhcmNoaXZlZCBmaWxl
cyBhcmUgbm90IGluY2x1ZGVkIGluIHJlbGVhc2UgdGFyYmFsbC4NCldlJ3JlIG5vdCBmZXRjaGlu
ZyB0aGUgZ2l0IHJlcG9zaXRvcnkgaW4gb3VyIHJlY2lwZS4NCg0KUGV0ZXINCg0KPiANCj4gPiBo
dHRwczovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyNS02MTE0NA0KPiA+IGh0dHBz
Oi8vbnZkLm5pc3QuZ292L3Z1bG4vZGV0YWlsL0NWRS0yMDI1LTYxMTQ1DQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmt1ciBUeWFnaSA8YW5rdXIudHlhZ2k4NUBnbWFpbC5jb20+DQo+ID4gLS0t
DQo+ID4gIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnRpZmYvdGlmZl80LjYuMC5iYiB8IDIg
Ky0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvbGlidGlmZi90aWZm
XzQuNi4wLmJiIGIvbWV0YS9yZWNpcGVzLQ0KPiBtdWx0aW1lZGlhL2xpYnRpZmYvdGlmZl80LjYu
MC5iYg0KPiA+IGluZGV4IDc3Nzc4M2Q3Y2MuLjA3NTQwNjkyZmMgMTAwNjQ0DQo+ID4gLS0tIGEv
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvbGlidGlmZi90aWZmXzQuNi4wLmJiDQo+ID4gKysrIGIv
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvbGlidGlmZi90aWZmXzQuNi4wLmJiDQo+ID4gQEAgLTI5
LDcgKzI5LDcgQEAgQ1ZFX1NUQVRVU1tDVkUtMjAxNS03MzEzXSA9ICJmaXhlZC12ZXJzaW9uOiBU
ZXN0ZWQNCj4gd2l0aCBjaGVjayBmcm9tIGh0dHBzOi8vc2VjdXINCj4gPiAgQ1ZFX1NUQVRVU1tD
VkUtMjAyMy0zMTY0XSA9ICJjcGUtaW5jb3JyZWN0OiBJc3N1ZSBvbmx5IGFmZmVjdHMgdGhlIHRp
ZmZjcm9wDQo+IHRvb2wgbm90IGNvbXBpbGVkIGJ5IGRlZmF1bHQgc2luY2UgNC42LjAiDQo+ID4N
Cj4gPiAgQ1ZFX1NUQVRVU19HUk9VUFMgKz0gIkNWRV9TVEFUVVNfUkVNT1ZFRF9UT09MUyINCj4g
PiAtQ1ZFX1NUQVRVU19SRU1PVkVEX1RPT0xTID0gIkNWRS0yMDI0LTEzOTc4IENWRS0yMDI1LTgx
NzYgQ1ZFLQ0KPiAyMDI1LTgxNzcgQ1ZFLTIwMjUtODUzNCBDVkUtMjAyNS04ODUxIENWRS0yMDI1
LTg5NjEiDQo+ID4gK0NWRV9TVEFUVVNfUkVNT1ZFRF9UT09MUyA9ICJDVkUtMjAyNC0xMzk3OCBD
VkUtMjAyNS04MTc2IENWRS0NCj4gMjAyNS04MTc3IENWRS0yMDI1LTg1MzQgQ1ZFLTIwMjUtODg1
MSBDVkUtMjAyNS04OTYxIENWRS0yMDI1LTYxMTQzIENWRS0NCj4gMjAyNS02MTE0NCBDVkUtMjAy
NS02MTE0NSINCj4gPiAgQ1ZFX1NUQVRVU19SRU1PVkVEX1RPT0xTW3N0YXR1c10gPSAiY3BlLWlu
Y29ycmVjdDogdG9vbHMgYWZmZWN0ZWQgYnkNCj4gdGhlc2UgQ1ZFcyBhcmUgbm90IHByZXNlbnQg
aW4gdGhpcyByZWxlYXNlIg0KPiA+DQo+ID4gIGluaGVyaXQgYXV0b3Rvb2xzIG11bHRpbGliX2hl
YWRlcg0KPiANCj4gDQo+IC0tDQo+IFlvYW5uIENvbmdhbA0KPiBTbWlsZSBFQ1MNCg0K

