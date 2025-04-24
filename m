Return-Path: <L.Anderweit@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD380C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 14:48:34 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.92])
 by mx.groups.io with SMTP id smtpd.web11.17112.1745506106963030680
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 07:48:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=AefwSSUS;
 spf=pass (domain: phytec.de, ip: 40.107.105.92, mailfrom: l.anderweit@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9r+4JrH6vy/zhUOtgQd4JC7DTNgjSdEa7As5TqxB5w3M3BYNomTP/mtxu1xS2kHqP3yyjiEbR1woc0e7UyC3nu+833VCfRXVluEgUvmbr3vQBKjM80iUyTRw/Rd8ct35Vxj98o3hpHHj/Wum+E7xXz5/xnHH+RX+eRz6tFBXk5j7vIhSSB6pHUJ++NhlRdydaZiEib5ZX5tkAb7yBqPC8n6PQz4HajdwUsvNw5fz28+wRWd974bzDZMMhW1rjI+i7xmmdiVn86UWdI5CGigmDymMuPsqDnNBbKstYT0vc58ujpN241nZt+rE017hkFAY30D1aCa3aTx/2f2l1wX+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ufkb8d3vPpL2K4ZlC7kapbJkwAREyv/eNVWwUfn4UzY=;
 b=OYxbIQgMjt/CSAX4C1DM2aqw37NQlBm+8POnktEyM9m0uu7BWIv4sWKOSDBQKjezvVakWIGrxZk+9xDybr+nqpO1i3u/ywEUSZtUtjhi+r0qoPfdlSfJlxNx/BdtlajL86h/h+fF5thAkttYGXOk9Ypm6rfKrvbThF8jfw0/9LzXC+s2t1UCwyqluB8dnYnE2ASpbfLIGcOVn59/W4ba/sHWAgBB0map2xQ5PPXgK1zCthEaMRzZz1/TDLBDnxcdDVNwmdeHAFOlLsEqqK2KoMw43AQc0xhDmcyfO7olohM5EFYV1/8nvMx+TuffLIsKks7Sd/kN5DkAWCfDXwWi7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ufkb8d3vPpL2K4ZlC7kapbJkwAREyv/eNVWwUfn4UzY=;
 b=AefwSSUSCP3V3NPVjX4eZGT/xnc2SK90DO4LOw3tRMHwDXw/fqoa02q4HQNFDdugcHTlRvjso7/WISPrg5Uk2cCZ4ypg//dN4ffn5zfkppnIAoFR7WgYCjzhf+xhmdxV+A7aMpFrGxNWcTO35mmRfaZjz0X8v3XAXcWn94fG/qyM9j0gPHaJAIWwAyh+OCbVZk6IjtB0M2AmVNjaXhv+Whl3ECWvQUC35U/ZT/i26qeq4vMW6pBImXWqJ1tt0WYKQE1W+dNpD47E3tna5lI6FssKs1bfZ2WwWAB9SN8QbRFuzO7oKP4MJn1cWpUM0ETbxKNfxmovAFVjtViXdGs6uQ==
Received: from DU0P195MB2174.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:473::19)
 by AS8P195MB2188.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5bd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 14:48:21 +0000
Received: from DU0P195MB2174.EURP195.PROD.OUTLOOK.COM
 ([fe80::4d14:78aa:6a04:d38c]) by DU0P195MB2174.EURP195.PROD.OUTLOOK.COM
 ([fe80::4d14:78aa:6a04:d38c%6]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 14:48:21 +0000
From: Leonard Anderweit <L.Anderweit@phytec.de>
To: "mikko.rapeli@linaro.org" <mikko.rapeli@linaro.org>
CC: "upstream@lists.phytec.de" <upstream@lists.phytec.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] meta: classes-recipe: uki: Make initramfs
 optional
Thread-Topic: [OE-core] [PATCH] meta: classes-recipe: uki: Make initramfs
 optional
Thread-Index: AQHbrt6yiDk7KCOzbkGT5XWpQrUgwLOy8hkA
Date: Thu, 24 Apr 2025 14:48:21 +0000
Message-ID: <c9b8d665dcf3eff622d561b895ee613bc3f384e1.camel@phytec.de>
References: <20250416-master-v1-1-be5e7309c5a8@phytec.de>
	 <Z__DW-Vchk7l1MQ9@nuoska>
In-Reply-To: <Z__DW-Vchk7l1MQ9@nuoska>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0P195MB2174:EE_|AS8P195MB2188:EE_
x-ms-office365-filtering-correlation-id: 09755f08-264e-4aea-8cab-08dd833f0f12
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?L0o0T045aitqZjY3TVAxalFobHQwcUl0bEhlLzJRYUVWYmtlY2N1MEhwOGg2?=
 =?utf-8?B?TnFTeFpvUE9mblBZVGQvd25WNUpPY05PYzBzTGFPQmlTRGdVWUlBeDRpaytK?=
 =?utf-8?B?YUttVDBnYlBVNzF6cjY3NU1PWnV5a3BLdlhTa0R2blVMNlUwMVRjUEdaTzIr?=
 =?utf-8?B?TGxvWjNZUUFhbjJueHpXMkdGbkpQRFhRaklvZFM5YVNuUDNPcGNhUFhFdEFt?=
 =?utf-8?B?cDNFOU8zL2tEelJiQUFzaG5vVWlDdFNaNmZuVUQyRDhaUyt4L25XL0tTMzB3?=
 =?utf-8?B?WW95K1YrTENGaVc1WVIvMXVjc3ZocFA2b2k2eFN1aHhSK28remhkbTVZWnkz?=
 =?utf-8?B?UldZcytVeXlIYXJaclNlT3BRZVgwRTU5VnZEb1NHMHNUcFhONU5nTXJXQmgw?=
 =?utf-8?B?OTA5Qm1ra29JZ0pDbjUyNm9RdDR6OUJjYTh2MjgvUnR5S2FHSzVoQkw3bGk2?=
 =?utf-8?B?a0NtU0pvd3h0QnR2U29DS2p5VE1EREJxS1RxRVNXMFBpSUxoYXVjM3ZrRXZi?=
 =?utf-8?B?WndTMlBBWUlhVkE2MW15KzlCdGpaSG44bUUza1pPeWtESUlJZ1JLSHRGNkJp?=
 =?utf-8?B?eks0MHFDYzBENG9hNUEzVlFpbXV5L09keGFJVVJrYVpHMzEvNDhBNVBxc0pk?=
 =?utf-8?B?Ri8xQ2UzbGd0QmpjNWN2ZlhzVDgxK1ZiekRMRmV3V2JIQ0dtWmVZalhZajBO?=
 =?utf-8?B?Mm5ndEFaVDdZY1dUZEhocm5KRG1LSnhtUVEzUnpwYWdFcE54RWUyczJGcE0z?=
 =?utf-8?B?anZpbjhReTZRczJrL0RmQXVvMWF6cmRwMWpHeVAyekNOcWpVYW1MUWdtVGFZ?=
 =?utf-8?B?UDZvT3ZrakNicW11b3llNG5walNrOXpaUFAwYkRqRmEzK1N5KzRmZkQ4d2s0?=
 =?utf-8?B?dXhhT2Y4Wnhuejg5MXdzZk01cmFvTzREc0FaRzlsbUFEVVpUS1NKWldOaStK?=
 =?utf-8?B?cXVuK2tLS3FhUTBZaERldm5mYVR3STZMQWQzWHA1ajZDK1pHTmR5UmJxNmRH?=
 =?utf-8?B?ck1SVW9iUHdUZnE0V01xY0c2cFgzeGRqem1hd2FxNHZOcHRKVTJHb3oyVFZr?=
 =?utf-8?B?QmpPbm40SmFzSlIycHgvWnJSam1RT1pOVXJkMmlXYUVvdVpZZG13Q3htVlVz?=
 =?utf-8?B?STJ0Lytoc0ExRXFSdW16d0RMK1JJTVZFbkdIZFIyZVA2YzJFREVKQmRJS3Ex?=
 =?utf-8?B?blpWV3dZV3dDSTh2ZGNRb0FhYmZVdHpYNzFISHBPVkhWL1AvbHM1NUNaMGZS?=
 =?utf-8?B?SVg4b0pWQmxIQ3REdUIzalBGV3lzZDdpWDZaSktINElBV2NPVVR5YmhpbFhh?=
 =?utf-8?B?OWFjYlp4ME9wTFFhMTFGMTd0ZUE5bWlrSy8zN1JJditSRnB0dzdWVXByZ3k4?=
 =?utf-8?B?ZW9hcGVmOHRZVGYxSmtTSm1LMCtlQ2RHc2VtL3FFNytSd2prZFhINnl0VWhN?=
 =?utf-8?B?ZHhZRWlSN2lLQnBxeDJNVmp0MlZUQ1hVSlliR0JJTnB4ZFRweTJYZUIvMmtv?=
 =?utf-8?B?dmdBZXpQMFBRWk5WRGJ0Z3QwRGhjMGNNZk12enlnRVF2VGJsWlBPNFJOTFBi?=
 =?utf-8?B?WTE3RURDYzFuM3RMNEN2WlY5UFI3UTdBU2ZHZHhVMDNiaUlJZUhJcUJPbCts?=
 =?utf-8?B?aFQ4dU5FTVVzZWRGbHI5SW1lMnZ0NklkQytQUk9ZRDBTYzlwaWY1Vm0zelFI?=
 =?utf-8?B?NlVvTHdhWnI0NUpZbmtaaXNxYTVIRlg4Sktvc3BrUENPNVFrZEIvVXFnSXY3?=
 =?utf-8?B?STh0Y29PZGJEWlZqY0wyTkxDR1dabFEvZzJjVUw1Z0hlWXl5S3l1Y3J0SGs5?=
 =?utf-8?B?QnYyaU9HQ09ObzBzRUI0M1UycmR0U09LdE91WGFSb1BpdzRtM09BbHFXNGR0?=
 =?utf-8?B?RlA0cVVZM3NyODliNFdOVHJDaFE1K1NaaStZeWpjSkJ3TzYvTld4Y1lESUhs?=
 =?utf-8?Q?p6R9VfXfYi8=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0P195MB2174.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?czV6RURxSlZjc2w2TjdsZG1PcjE1ZWc3djFLVVQ5SEZOb0hKb2JieXVmS0ta?=
 =?utf-8?B?SkRIUndYTk96WUZXQWtpcllldXNLcGUvVm1rMzJ3SVU1ckkwYy9BNzhOL1ps?=
 =?utf-8?B?SnBHdnFjZ040Njdzemx1N1UxNW9HYTQrQWVqaXNnOEw2YXlIUHA3TWZOWGM4?=
 =?utf-8?B?MldIcEh2cCt2ZkxMQ3lvS2ZObXFqQ2VoQnZiTDUycDF0WU9ZVlovdFhxWElO?=
 =?utf-8?B?cGIyRmtmZmlkQjJPcU0yV2QrZVZhZFhlWFE4Z2pRVXhWdVdBclA0aUJiQnFE?=
 =?utf-8?B?SWJzOWRRK2R2azUvd1lsTWVLRk1GRGYyTEZnRzNoOTBROFNRUHRVcEhpenBI?=
 =?utf-8?B?dVlDSUNpSTh6OWpUb3Q4Vm1VQzROSldMMFlrL2hXSzRldmZMZHN2R3NxZTZi?=
 =?utf-8?B?WVJoL1VQc1dXYlBaTGRsalZLdmxhSndZaWxNTDZWVnZONUlBLzd5WldTSVBY?=
 =?utf-8?B?ZmlZT3ZsN0FpaUhMWnVrVGRYRWhXMkswbDRtbE9HWHRyS3pEZC91alJLcVpI?=
 =?utf-8?B?SmJLUTh5Mm5RQXJYV09hY3RnS2ZzT0tIU2R1L014M2ZRdXE3S2ljakk4NkRx?=
 =?utf-8?B?QmpxWVFmWFRIOHUxd044SHR2bldML3BaS3lCaGdEOGpBS05qaGhweFhoMUFU?=
 =?utf-8?B?aWFEaEV5R2VETmVPa21iS0RQR1I5VEk2K0VFalZOdTVJOC9FYnF5akErNE5R?=
 =?utf-8?B?UkIxMi93bUNOVGYyRWhsa3hFT0JXQWttaERSSXlHNG9IOVNweWdHdVFzOGRI?=
 =?utf-8?B?YVpobzVUVUJOTTNOb3VHTERuNXNadW9xKzBkbHVwZ3BHQzg4UDNaZGpqRlU1?=
 =?utf-8?B?b0JRTUpzWEVJaGZiaW5aYWtqWTNLWXJISGg2OUdMakIvWENxcndmbkdNQitY?=
 =?utf-8?B?Ty8wZ3lDeHpxUFAzM3pKTTNvRUtpU21MU0l5cDJsUGQralRvdVJ1MC8rdjVa?=
 =?utf-8?B?NWVvNTl1K1ltbEZhYTlFQWVEc3RyWFdFd3MxeUIwaWQxYUxDOHM5ZkJkc25N?=
 =?utf-8?B?TkptRVFnN1BNUWVJNHlEYXh0eVFISVU2OU1tZTlmYmFJUHptOG5YYnN4cVRS?=
 =?utf-8?B?ZEw3MnhCQ0VnejdiRFl1Mmd0cDNmNEZvenlSNlhVSjdQYTFPRVM5SFJ4a3Jj?=
 =?utf-8?B?TUViNVB3MVlCV0xYQnhvbUNrZmlSMk01VlltTFBhcklza2p6T2tKMG9BR3JF?=
 =?utf-8?B?WStRbkJTVDlKMFp5K0lOWm5EZVd6YXdocjIvL1N2N05aT1g1dzZValBpRkRL?=
 =?utf-8?B?aHJBOFJqNW5mSlUzMW1pS21xVmpDSjdTRUFKYkZuZERkMXhmQlZhV0JZempG?=
 =?utf-8?B?eG1GQ2RCSmVwZjdVbU9tajFqMTd6NWh1dkl3L2VSQ2RoWWVoOUphcFRyMVIv?=
 =?utf-8?B?ZDBKdnJpYXBVQjBIM3JtWnIyREdZVDQzczJIRTNxRGR0OGQ4bTljakQ2c3RT?=
 =?utf-8?B?OCtXZ3RMVXVVdFc2aml0RE1ZUGxKditlbVVhMFRqT1pxaVlkT1ZVeXNUMVF3?=
 =?utf-8?B?cGR0K2JUd0hvUXFLUHNUbmtnYm5TUTRQVXN5eTZlYUxEcHNnMzQxOUxkL21S?=
 =?utf-8?B?dldPbmtneUtvVzlYUThia2MyMDIxNS9DRTdKMFMvaHp4S1FhMmdwb043cHdB?=
 =?utf-8?B?REZUNzFtcWlySWM3dHpnc0FDQit5NnRYY0lvU0hicEM3SVF2TlEza3lKcW84?=
 =?utf-8?B?RXVianFuZlZRVFdScnFvcmFXamw5UEtKSTFURTkzaXYzY3Uwd2dvZWdLeEhK?=
 =?utf-8?B?bG1IV05jM21TL2Y0T0RxdEF6V3d6TG9EbXpkaFJPaHhIVm1mWFF4dEpMM0pl?=
 =?utf-8?B?U3gxbFJiRFV2dEdlbkFlbjE1Umx5UCt6TGRnZXh1YXpHOEZhUEtmUEdFKzFQ?=
 =?utf-8?B?RU5NajdLWDNTa1ZlT29sNm4xR0J4RWtZKzFHVkVjajZYNE51K1p4dmlTNUZa?=
 =?utf-8?B?YmpkNUFtZGxNLzVtUFJUNGh2SnFDdnZQNHRNUHowYjRLRnpKdUsxUmNRcm0x?=
 =?utf-8?B?ZUZocm5La0c4ajgyc2M2WVBtbDloaXl0M2NxamNuMCtJTjBlWTNCaFVjR3lh?=
 =?utf-8?B?ZytSYVE2b3VVZnY0MUlJd0ExelVmeGtxYVVjenR2R1gwY3o3Y0FNTDJ2dzhZ?=
 =?utf-8?B?Zm9UM2hWR1VSbkg1aEZweng2SDhsTWM2SGF6UE5DL2xsSm83WlM0MjcrMEl0?=
 =?utf-8?B?YkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <01C2011CBAD2ED46AB3DA9F2D4E3CBB2@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P195MB2174.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 09755f08-264e-4aea-8cab-08dd833f0f12
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 14:48:21.5033
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8t/MzAb08aQB00dJWjm9cneXBnsWZRIDY+R5KueGH74fIUBhHpgNhQ0v7piDDdXjBoENUUjnwl2muKn09MweXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB2188
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 14:48:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215380

SGksDQoNCkFtIE1pdHR3b2NoLCBkZW0gMTYuMDQuMjAyNSB1bSAxNzo0OCArMDMwMCBzY2hyaWVi
IE1pa2tvIFJhcGVsaToNCj4gSGksDQo+IA0KPiBPbiBXZWQsIEFwciAxNiwgMjAyNSBhdCAwMzoz
NjoyNFBNICswMjAwLCBMZW9uYXJkIEFuZGVyd2VpdCB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyB3cm90ZToNCj4gPiBNYWtlIGl0IHBvc3NpYmxlIHRvIGJ1aWxkIGFuIHVraSB3aXRob3V0
IGluaXRyYW1mcy4gVGhlIGluaXRyYW1mcw0KPiA+IGlzIG5vdw0KPiA+IG9wdGlvbmFsIGFuZCB3
aWxsIG9ubHkgYmUgaW5jbHVkZWQgaWYgSU5JVFJBTUZTX0lNQUdFIGlzIHNldC4NCj4gDQo+IEkg
aGFkIGNvbnNpZGVyZWQgdGhpcyBidXQgZGVjaWRlZCBub3Qgc2luY2UgdG8gbWUgVUtJIHdpdGhv
dXQgaW5pdHJkDQo+IGlzbid0IHZlcnkgdXNlZnVsIGNvbXBhcmVkIHRvIGJvb3RpbmcganVzdCBh
IGtlcm5lbCBFRkkgYmluYXJ5DQo+IGRpcmVjdGx5Lg0KPiANCj4gQ2FuIHlvdSBkaXNjbG9zZSB5
b3VyIHVzZWNhc2UgYSBiaXQgbW9yZT8NCg0KVGhlcmUgaXMgbm8gcmVhbCB1c2VjYXNlIGhlcmUg
YXBhcnQgZnJvbSBtZSB0ZXN0aW5nIHRoZSB1a2kgZmVhdHVyZSBhbmQNCm5vdCB3YW50aW5nIHRv
IGRlYWwgd2l0aCBpbml0cmFtZnMuDQoNCkFsc28gdGhlIHVraSBkb2N1bWVudGF0aW9uIFsxXSBz
dGF0ZXMgdGhhdCB0aGUgaW5pdHJkIGlzIG9wdGlvbmFsLg0KDQpbMV0gaHR0cHM6Ly91YXBpLWdy
b3VwLm9yZy9zcGVjaWZpY2F0aW9ucy9zcGVjcy91bmlmaWVkX2tlcm5lbF9pbWFnZS8NCg0KTGVv
bmFyZA0KPiANCj4gPiBBZGRpdGlvbmFsbHksIHJlbW92ZSBkb19pbWFnZV9jb21wbGV0ZSBkZXBl
bmRlbmN5IG9uDQo+ID4gSU5JVFJBTUZTX0lNQUdFOmRvX2ltYWdlX2NvbXBsZXRlIHNpbmNlIGRv
X3VraSBhbHJlYWR5IGRlcGVuZHMgb24NCj4gPiB0aGF0DQo+ID4gYW5kIGlzIGV4ZWN1dGVkIGZp
cnN0Lg0KPiANCj4gSSByZW1lbWJlciBoaXR0aW5nIHJhY2UgY29uZGl0aW9ucyB3aXRob3V0IHRo
aXMsIGJ1dCB5b3UgbWF5IGJlDQo+IHJpZ2h0Lg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLU1pa2tv
DQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IExlb25hcmQgQW5kZXJ3ZWl0IDxsLmFuZGVyd2VpdEBw
aHl0ZWMuZGU+DQo+ID4gLS0tDQo+ID4gwqBtZXRhL2NsYXNzZXMtcmVjaXBlL3VraS5iYmNsYXNz
IHwgNyArKystLS0tDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMtcmVjaXBlL3Vr
aS5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzLQ0KPiA+IHJlY2lwZS91a2kuYmJjbGFzcw0KPiA+IGlu
ZGV4IGQ5YTdmYjBlNmZlMC4uNGRiNWY2MTRiOTZmIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvY2xh
c3Nlcy1yZWNpcGUvdWtpLmJiY2xhc3MNCj4gPiArKysgYi9tZXRhL2NsYXNzZXMtcmVjaXBlL3Vr
aS5iYmNsYXNzDQo+ID4gQEAgLTc1LDggKzc1LDYgQEAgSU5JVFJBTUZTX0lNQUdFID89ICJjb3Jl
LWltYWdlLW1pbmltYWwtaW5pdHJhbWZzIg0KPiA+IMKgDQo+ID4gwqBJTklUUkRfQVJDSElWRSA/
PSAiJHtJTklUUkFNRlNfSU1BR0V9LQ0KPiA+ICR7TUFDSElORX0uJHtJTklUUkFNRlNfRlNUWVBF
U30iDQo+ID4gwqANCj4gPiAtZG9faW1hZ2VfY29tcGxldGVbZGVwZW5kc10gKz0NCj4gPiAiJHtJ
TklUUkFNRlNfSU1BR0V9OmRvX2ltYWdlX2NvbXBsZXRlIg0KPiA+IC0NCj4gPiDCoFVLSUZZX0NN
RCA/PSAidWtpZnkgYnVpbGQiDQo+ID4gwqBVS0lfQ09ORklHX0ZJTEUgPz0gIiR7VU5QQUNLRElS
fS91a2kuY29uZiINCj4gPiDCoFVLSV9GSUxFTkFNRSA/PSAidWtpLmVmaSINCj4gPiBAQCAtMTI3
LDggKzEyNSw5IEBAIHB5dGhvbiBkb191a2koKSB7DQo+ID4gwqDCoMKgwqAgdWtpZnlfY21kICs9
ICIgLS1zdHViICVzIiAlIChzdHViKQ0KPiA+IMKgDQo+ID4gwqDCoMKgwqAgIyBpbml0cmQNCj4g
PiAtwqDCoMKgIGluaXRyYW1mc19pbWFnZSA9ICIlcyIgJSAoZC5nZXRWYXIoJ0lOSVRSRF9BUkNI
SVZFJykpDQo+ID4gLcKgwqDCoCB1a2lmeV9jbWQgKz0gIiAtLWluaXRyZD0lcyIgJSAob3MucGF0
aC5qb2luKGRlcGxveV9kaXJfaW1hZ2UsDQo+ID4gaW5pdHJhbWZzX2ltYWdlKSkNCj4gPiArwqDC
oMKgIGlmIGQuZ2V0VmFyKCdJTklUUkFNRlNfSU1BR0UnKToNCj4gPiArwqDCoMKgwqDCoMKgwqAg
aW5pdHJhbWZzX2ltYWdlID0gIiVzIiAlIChkLmdldFZhcignSU5JVFJEX0FSQ0hJVkUnKSkNCj4g
PiArwqDCoMKgwqDCoMKgwqAgdWtpZnlfY21kICs9ICIgLS1pbml0cmQ9JXMiICUNCj4gPiAob3Mu
cGF0aC5qb2luKGRlcGxveV9kaXJfaW1hZ2UsIGluaXRyYW1mc19pbWFnZSkpDQo+ID4gwqANCj4g
PiDCoMKgwqDCoCAjIGtlcm5lbA0KPiA+IMKgwqDCoMKgIGtlcm5lbF9maWxlbmFtZSA9IGQuZ2V0
VmFyKCdVS0lfS0VSTkVMX0ZJTEVOQU1FJykgb3IgTm9uZQ0KPiA+IA0KPiA+IC0tLQ0KPiA+IGJh
c2UtY29tbWl0OiAxODNlMDQzZGU0MjNmZDNmNzgzMzM2NmNhNTI0YTZmN2QxN2U2ZDE0DQo+ID4g
Y2hhbmdlLWlkOiAyMDI1MDQxNi1tYXN0ZXItNWRhOWU3NGI4ZmMyDQo+ID4gDQo+ID4gQmVzdCBy
ZWdhcmRzLA0KPiA+IC0tIA0KPiA+IExlb25hcmQgQW5kZXJ3ZWl0IDxsLmFuZGVyd2VpdEBwaHl0
ZWMuZGU+DQo+ID4gDQo+IA0KPiA+IA0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4g
TGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+ID4g
Vmlldy9SZXBseSBPbmxpbmUgKCMyMTQ5OTApOg0KPiA+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjE0OTkwDQo+ID4gTXV0ZSBUaGlz
IFRvcGljOg0KPiA+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMTIyOTQ3OTkv
NzE1OTUwNw0KPiA+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+ID4gVW5zdWJzY3JpYmU6DQo+ID4gaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWLCoFsNCj4gPiBtaWtrby5yYXBl
bGlAbGluYXJvLm9yZ10NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+IA0KPiANCg0K

