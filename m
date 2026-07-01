Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1C4C43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 12:57:01 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44279.1782910614485564141
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 05:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=COYqRgsW;
 spf=pass (domain: siemens.com, ip: 52.101.65.32, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nNCFeABdPtV63eNUNeeoyURQ2zIc+UpLtupwMvdW1ieGW6o3JetMRC1DffOqwVmnHDiuQTPFEkunDGkS57V00vr+xPOHlZKz7POrwi4qnNy6AfmSUS0br+e2kLM5NaubLjygJB23GOdsyvoT6Ex2Az0bSB9TeCaGkYLLveeuAUC8lez3HUt3X+Y7SLHq4JT+3EjpwpFwh7Ji13sp9zcqExVcySbChOnVjlYi9sqGLUc+bFO9nDuYB9Eh3fVIPRm+GkoMHysyw14uHcj/KmdYq5YWmWJ5kK74pTLwAS5xEoJnK4PGtBgRPH+q0ReVktZceIbZ/2YkjI/QjBXbrsKhpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oluy2mh2VXdc4iRnIpG5GRkiEXA8lXnNI5nXGuTssfo=;
 b=k1sKbn72GuEe7FP9x9BsR27LbmJE6tOOP9+/d9dilo9c51Nv8Bq+55M6GJShYHIiFV77iDlvZ4TejAqoLDhpon52E+fBkFouTLNghBRLniH6zM9g3CXoGp/nH3ge6eNtupJ/qci5rn7sTPw+d1q0FqC6fwHoEx+LE4IkN+DzDoUHL9ySWjsN/UzIWNc2PPGmRdJ8XP7AEiYvTsSyWUtDkqYvyTynsCy4+sMi3biK1O1JqxglicNLqP/EZymPuKS4CSLzplzlE0u477FGhIuVhfr040nJK2N78JYI1eQN4U64L7f/xY8aXaax3O+85Zee+Vztj0pgwUHeDbY7ouyF2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oluy2mh2VXdc4iRnIpG5GRkiEXA8lXnNI5nXGuTssfo=;
 b=COYqRgsWXR4H083BHaVzVI1IYcOH51VmIJjbHgQgI1neu48ejJx0h3omvKDqs6CCOKiya6qKJtLfirKHRk6oHwMKb6fFl91T8d8fX6mICZlzF6SnAudY2ZYJUdX0l6gQZ+Y/yFLYS/KtDxaV1OiyHoordy1tIW1ER99bYg45nF+MLr51xNDW0gKT4zSUvisBhfbaMjSI4i8i/Kg7Y/zYea2d85lCKvSZTyuFobuYzYkOXqxoumPtc045F2lgd8+FU6muU5O2fHo2u6TONhNFQsGfb9f78rLx2UMDpk2aIfGP6peAZNC45dh/GfYEzr84HOyCbYSIPLSJs+zzhDSUmQ==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by VI1PR10MB7810.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1cd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 12:56:50 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 12:56:50 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "anna-lena.marx@inovex.de" <anna-lena.marx@inovex.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] classes-recipe/sbom-cve-check: fix sstate cache
 mismatch in sbom path
Thread-Topic: [OE-core] [PATCH] classes-recipe/sbom-cve-check: fix sstate
 cache mismatch in sbom path
Thread-Index: AQHdCUCEloJ2LV5vGEO4tcKpH9Ki5bZYdvMAgAABPeCAACPygIAAAYig
Date: Wed, 1 Jul 2026 12:56:49 +0000
Message-ID: 
 <AS8PR10MB50738D7F3F0F8A1DBFF52429FDF62@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20260701100045.3903557-1-anna-lena.marx@inovex.de>
 <CAMSfU+6RkR=8Ze0DMg-376Pw=_pE+kC75osYiwMtHmTCbdp5Bw@mail.gmail.com>
 <AS8PR10MB50732D19DC22A9F050502AEFFDF62@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
 <148656.1782909853265533546@lists.openembedded.org>
In-Reply-To: <148656.1782909853265533546@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=02ba70f4-73bc-4d5f-b46d-51ffd88b8978;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-07-01T12:49:42Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|VI1PR10MB7810:EE_
x-ms-office365-filtering-correlation-id: 57482271-29b1-4ff1-9f02-08ded7703792
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|55112099003|4143699003|38070700021|56012099006|11063799006|3023799007;
x-microsoft-antispam-message-info: 
 CsayTLzNLdCxmKOk1jFSRs55b6QmTKX42lGQf4Z+BTZMkSFVxTFjEW7lepTfdaESpkFMZdU2iQKR2ozNmprORi1o1TYJMWuJMOZyFigoRTPbNg9zF6Tmj3A0c7deuJEkrH/jW/lHNi88Yc5EEtjAGjJRyxkC9ub6RNAehuNs8V5AD9YdcFdCnWDLLBYy9OjwoevfGiEWsyxoqh7aHjRx2sskUkbfTkWPkx74sdP1uXdtetAcUgY07h/TXmPi79nxPZYwSr8bSXDAjdIZFXZ8sBmtYFyJNZ00dlCepNdnbIGWCFKD67hpba8ZaSlUUIC1zI6PiMHcldjUz1viPtTFW7GL5iadZWIzISY9v1hox7hmKOlrgbK+WJNNv5CcPRaRQ5D0tZIJ3CfI0k9Ues+DbbTLhqBrq/cRYQFf1IYufrxF7I7Q4gRvRZvObrwbWMK4or75xnk8RW7zMLm3rqWMMLEWGY91rEl1aQqZD6YQYRCH+PWfdA23Yhx51cbp0TVuFzP7tr+qHvOdk9IIYylfWmPV6gEoW3VDz7EPzlG9836bw5ZvJddpriKk2LTzpCNMfq7MSgQu2BcMWgFnArCFKnJh6F5F/IQC/lG3/qJTbhFlg/dJrXS8XcVtmXEEhmWK2sYnQrd7+8Z+l8VhXpM+rkx6+sGE0a9cUteRLCSMtAG1f9sUQiyvC1UkHBF5HbGWUcypqFOhYlTXGss4i6eINs4oo9m0XmcsX0ILuB7G54U=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(55112099003)(4143699003)(38070700021)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NlAxVmZlWllpVEROdENuWGxHMDZuRWxJN21hdDE0U2FsWjUwT0RWbzhmWFZD?=
 =?utf-8?B?dTJwQkE3WXVINXh0cnU1RE1uWlY1bmxPQjZBZXdyakFpZ3FEWmN3d2ExRVRr?=
 =?utf-8?B?b2xud0xCcGlxODhhZTk1LzBrNlZZdGlLaXJsYkhvallzMHpqeTRPbzRKQXpy?=
 =?utf-8?B?cldlZHY4aDluVXZEREIyZklVMDdKeFp2L3J4MUFwVlJTeVNnRmxOenZZcU9E?=
 =?utf-8?B?d09teHZjMmRFcyt3Wk1kVWJBUnpDQ0cvemRxM25EVnVJVk1NY0ZtLzB4WTFn?=
 =?utf-8?B?dkhoNG0zTDg4cUk4NHZmRUR3dmplb0xYSnF3eE1MVnVYQWlxTE9YNzBBdzlR?=
 =?utf-8?B?SWJiU3ZSZUlXQWx3NVFmM0xHWnVvUDd3ajdua0RtT1JWbWNnbTEvQ3FITlBR?=
 =?utf-8?B?a1FsaHBYalJ6TUZHZCsxVXhaY203UUM2TG42WmNDL3Z1NnhGVXJwQVEya1Iz?=
 =?utf-8?B?d1gxeU1xQm9Kb2FPMm5YamM4MHFzbkpOb2FJeUxBTzJudGtyR2Iva0lpREdl?=
 =?utf-8?B?YjQrSGlaMSthcHZiVDgwbkIyTFVnNlQxa0FBa09OdkQzeTZtOTZadzRtWlU1?=
 =?utf-8?B?WkovNDMyd0VPMjlrUlBtMXlZQ203UWJRcHNJMW9ZbVdLdDRFc05HMmVXVFh1?=
 =?utf-8?B?TndFSTdRQjJ2cisyWG1aN1pQUEYvaU0yTUJ3R1ArL1hERHM2K05YWEIvN25P?=
 =?utf-8?B?RXovVDlNbE5OekprYVUySFY4Q0JNRU9aV1lob2pQYTlYdmY5Z0pQdzBidlZB?=
 =?utf-8?B?MU4ySXVYaTRYbXN4LzgrdzFSVXlBd2pWUVJYQkx2MWI2M2FKUlRjZGh2cThK?=
 =?utf-8?B?c3pSUUwxNTBJYlBWMjk0MkFKa21qYzFqSHJKRURENzFtakROTisxQXU2UVdi?=
 =?utf-8?B?YnZXSEZEVEduOWZCYXRQT3BOVkNDSE1WUVNhazZqQ0l5L3MwYndzb3hXcUxh?=
 =?utf-8?B?VGdkczZmWXdYM0NtTWNaVWRCcGUxZWxCVFoxcVEweFVXeWhpTnhaWmJ1Z1BY?=
 =?utf-8?B?UlJpKzg4c3dFOUUvak5kMk0rQXdUbWJ6cGNzUm9pVDBEcytNeWR3VnVNdXVJ?=
 =?utf-8?B?VHIyZlBNM3R0eFdqcTI1Z2RRUktvTk40N1d4OFNSVEFwc1BvWThDT00wUUVJ?=
 =?utf-8?B?VlAza0NYbG01cm5DcWRBZDJzaWxyVGtXdnYxM3ZDd0pUWTU2cVY5NklvQnhk?=
 =?utf-8?B?NTF4SU96V0VNM1pvU1VPVGRMZklRQnFBTEdEa1lRRDg3bXR6NkpSNk5vb1lT?=
 =?utf-8?B?NzcyR1o0a1ZhS2grZG90bWYxcXBmWUpPTW1lODJHVFQ3U3FLVWgrbTlMTkFJ?=
 =?utf-8?B?VE5pVzVxVW44eklnbDJsajFmdm1yalpvK2ZaSU5VVVRNbndYMjI0RS9MWEV5?=
 =?utf-8?B?NHI1cXpseUV6R0laQ1RLb05jTDFpSjdyQy9leVRUK3o1N0ZvcmdJTkJYbUFK?=
 =?utf-8?B?VW1yQTVXSU5XbXVVTlZrN0F2b1lDa0Ixb2JrUkp1ekx5eWtxb2J4WlZvNVhG?=
 =?utf-8?B?UmMxYXI3c2lLMEpVSUU3b01FcW1uS3BjZVZWSnNlcEM1bUUyQmJkOW16UjM1?=
 =?utf-8?B?Tkdsb3pxNXRkZFdJQnAvR3BnN252WTlyREE1QlRGa09MeVAxMkZlc0diQk1o?=
 =?utf-8?B?ai80K2xvdmxpQ0htVHV2MVdLSFFsS0VXV1ZmOHZ4UXlQclQ4WTB1bWhpeXhu?=
 =?utf-8?B?ZkYzd3hBRTVvNTl1dEY4Nzh4RlUrM05UaFVpN0J1WUVKbE9jRjBVZWNtU09I?=
 =?utf-8?B?M3NCQXo0UUFjc0ZQK1haZ0RUcEw2NXRVa2twRVFaL0JJckIxSHdEZElFYzJn?=
 =?utf-8?B?b1VuN1VYWUtUSmE0N1B4cmhrRXNIdnhKV2RJd0dkZXVIV2ZyUm9WdGhpeVJU?=
 =?utf-8?B?dXU3UWtDV09aMFhCVk9SMkhMcFR3b2RiWmgvWlV1LzBmK0ExRm5LRlVna1Ji?=
 =?utf-8?B?ZHFiOXZXQ2JOSWJwdmJxNGp2WkEyVys2SVY2REx1VTZPUUNuMy8ybU1DOVdK?=
 =?utf-8?B?L1Q3b3JFRDYyN3JrbXlEak96UWdFNlVnek82V0RzSU1HblBUTnl5SytkdXNj?=
 =?utf-8?B?SXZtdlRvYk5pSEpqcmhMNy9vdFhLTDZpWFlJRDZSUm82a3FnZU5DdzlCSGRH?=
 =?utf-8?B?bUxBT1BJZWpoT3RQVjRwaGdYNWR4YnpWZk1JMEQ3d0RzamErU0ZiWlIySXBB?=
 =?utf-8?B?c1VMTkFNeE5uVWFzOGhqRTMvWjh3Qzh0N0tSWFFCS2hMZ1FMUTV6ZjVWZEtQ?=
 =?utf-8?B?QkxxZGdHd0hlZm1iSENKc05iVkFtRnkwSitvek5wN2tBMlkwbjIxVFBONGE4?=
 =?utf-8?B?enZ6SHVxSDNiQm5NMzljc2ZCSWdiU2s5NGZsMFFOQzFkZ2NxaCsyQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 57482271-29b1-4ff1-9f02-08ded7703792
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 12:56:50.0852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AfvEsm5lqnV8CTo8ZDoq1gkrR6bbVnjSIr6ZS+qAaICf9RqjDl9E6KZmsMEaYKcseJOrQ9FXzdZrX9TGJdJ8JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB7810
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 12:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239983

SGVsbG8sDQoNCkJvdGggdmFyaWFibGVzIGFyZSBkZWZpbmVkIHdpdGggIj89Iiwgd2hpY2ggbWVh
bnMgdGhhdCB0aGV5IGFyZSBhbGxvd2VkIHRvIGJlIG92ZXJyaWRkZW4uDQpBbmQgYXMgdXN1YWws
IGlmIHNvbWV0aGluZyBpcyBhbGxvd2VkLCBzb21lb25lIGlzIGFsc28gZG9pbmcgdGhhdC4NClRo
YXQncyBhbHNvIHdoeSBodHRwczovL2NvZGUuc2llbWVucy5jb20vbWlycm9yL29wZW5lbWJlZGRl
ZC1jb3JlLy0vY29tbWl0LzJhODA4NDBhNGZlMGQzODI1NGVkM2U5Zjk2Yzg5M2Y2ZTA0ZGI4ZDgg
d2FzIHN1Ym1pdHRlZCAtIHRoZSBlbXB0eSBsaW5rIG5hbWUgdXNlLWNhc2Ugd2FzIGJyb2tlbi4N
ClRoYXQgb2J2aW91c2x5IGJyb2tlIHRoZSB0aGluZyB0aGF0IHlvdSdyZSB0cnlpbmcgdG8gZml4
IGJ1dCB5b3VyIGNvbW1pdCBpcyBhIGNsZWFyIHJldmVydCwgc28gd2Ugd291bGQgYmUgYm91bmNp
bmcgYmV0d2VlbiBlcnJvciB3aXRoIGVtcHR5IGxpbmsgbmFtZSBhbmQgZXJyb3Igd2l0aCBkZWZh
dWx0IGxpbmsgbmFtZS4NCkNvbW1pdCAod2hpY2ggaXMgYWN0dWFsbHkgbm90IGZyb20gbWUpIEkg
cG9zdGVkIGluIG15IHByZXZpb3VzIHJlcGx5IGhhbmRsZXMgYm90aCBjYXNlcy4NCg0KUGV0ZXIN
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEFubmEtTGVuYSBNYXJ4IHZpYQ0KPiBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVseSAxLCAyMDI2IDI6NDQgUE0N
Cj4gVG86IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVj
dDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIGNsYXNzZXMtcmVjaXBlL3Nib20tY3ZlLWNoZWNrOiBm
aXggc3N0YXRlIGNhY2hlDQo+IG1pc21hdGNoIGluIHNib20gcGF0aA0KPiANCj4gSGkgUGV0ZXIs
DQo+IA0KPiBJJ20gYSBiaXQgY29uZnVzZWQgYWJvdXQgeW91ciBwYXRjaCwgbm90IHRoYXQgSSB3
b3VsZCBub3QgYmVsaWV2ZSBpdCBzb2x2ZXMgdGhlIGlzc3VlLA0KPiBidXQgSU1BR0VfTElOS19O
QU1FIGlzIGRlZmluZWQgYXMNCj4gDQo+IGBJTUFHRV9MSU5LX05BTUUgPz0gIiR7SU1BR0VfQkFT
RU5BTUV9JHtJTUFHRV9NQUNISU5FX1NVRkZJWH0iYA0KPiANCj4gYW5kIElNQUdFX05BTUUgYXMN
Cj4gDQo+IGBJTUFHRV9OQU1FID89ICIke0lNQUdFX0xJTktfTkFNRX0ke0lNQUdFX1ZFUlNJT05f
U1VGRklYfSJgDQo+IA0KPiBtZWFucywgaWYgSSdtIG5vdCBjb21wbGV0ZWx5IGNvbmZ1c2VkLCBp
ZiBJTUFHRV9MSU5LX05BTUUgd291bGQgYmUgZW1wdHkgZm9yDQo+IHNvbWUgcmVhc29uLCBJTUFH
RV9OQU1FLCB3b3VsZCBvbmx5IGNvbnNpc3Qgb2YgdGhlDQo+IElNQUdFX1ZFUlNJT05fU1VGRklY
Lg0KPiBUaGlzIGRvZXMgbm90IHJlYWQgY29ycmVjdCB0byBtZSBhcyB3ZWxsLCBhbmQgdGh1cyBJ
J20gbm90IGNvbXBsZXRlbHkgZW50aHVzaWFzdGljDQo+IGFib3V0IHlvdXIgdmVyc2lvbi4NCj4g
DQo+IEJ1dCBJJ20gY29tcGxldGVseSB3aXRoIHlvdSBpbiB0ZXJtcyBvZiB0aGUgbWFpbiBpc3N1
ZSBhbmQgd291bGQgcmF0aGVyIGxpa2UgdG8gZml4IGl0DQo+IG9uIHRoaXMgbGV2ZWwgdGhhbiBw
YXRjaGluZyBzeW1wdG9tcy4NCj4gDQo+IA0KPiBBbm5hDQo=

