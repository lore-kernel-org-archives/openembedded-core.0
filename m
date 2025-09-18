Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A40CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 12:55:33 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.54])
 by mx.groups.io with SMTP id smtpd.web10.13345.1758200126527095023
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 05:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ACND3NGB;
 spf=pass (domain: siemens.com, ip: 40.107.130.54, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJq3CKQhbjtbTm2qtTmDS0aVJc0aN2StTClffGKyZ6LE3XrPicv2MzLIk8sFE13mYL4jFEuBtaW1WuiPGXLDQqBPBeuYBzZTy0E5NSaef/rxcb/mbwPGVD8/oN9gCsO8gZmsM200UIGfZ/0f2UDm23dnxDbb/NDIcRmIh/9vJHI/fJohHGw0cXnoactpyCTTT4H8S3uaIteZ7PqMcs4Mm0mdRguAD39bJjknF8d59MfC7/S6Y50MkMfxHg4lqhsDhIPaXeRl5DmweNU/c8KzFaj0KDus7tJ8H1tNaGSA3fKIVzo+4dbm414Ek406GSjMsjnfaB8ksnlZcCzZgRZTKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdZ0Mxq3g67+Opd57NWOqh1CFnp0KLSWeFfcH+G0FUg=;
 b=GuMqqPzZefsnODACl6IG+KAQA5ZtpzHankVqFoDlxhtHfARR279FqIe3bxegNCJJ/bW9NX/GAl+z4+AjUyhyYVAqDhBi+aaL9Mi9ywnDr8KjNR3wgE3zl24rGVva/0OTTAKNqU7X69u1SRAROmymT+TSyWsGRg0cVxKWEBVDI706ml9wYpvfTmKmP+3sw435M110wU9cPvDXBJN9mzIRy/+MDLiEvewIXqH7PvRGDPSlM9Crei+IFv3Op72jxm+slK+uCD+U2Wvi6kBVKZiQbxalkqRxxqmrQCo/ezdQU55e7cM03KQPcZhaw0BM8s+/mVWtRXfe6IAxCfBEg52sgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdZ0Mxq3g67+Opd57NWOqh1CFnp0KLSWeFfcH+G0FUg=;
 b=ACND3NGBGa1y0SJ87Egceun2y9AuhUh7cUaHRJn/Ph3kglJPQ2fBsdSaNALktc74Q3nPBPFxVHkYuMKUCuVdQZX/5fm0c9NyRh3NFoYqd92ZO5I7UuByR2XoMVjpRr5tFB6nKhplyMaV3atm3K9203tIKAjYGHvl20xdc/jnlCNo1daQRyNq+sl8PLTYmU9YM26xJPTz021bKb42EDRACHQ92WjVoo7QpS1P/dFa4HIAUwLUrYZ758yo2/k0o3EXtUw9v47O7Wlmwvq0tqVu5dlogyo7VnRKbpCSi+C9pdXJ1Xlv424bQLVA3iK3c+1IN7TgJ5pnaApEA+q7N7xKbQ==
Received: from PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:266::11)
 by AS4PR10MB5444.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4bf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 12:55:22 +0000
Received: from PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4144:34cc:64ca:dd9d]) by PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4144:34cc:64ca:dd9d%5]) with mapi id 15.20.9115.018; Thu, 18 Sep 2025
 12:55:22 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Niko Mauno <niko.mauno@vaisala.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core][PATCH] cve-update: log timestamps and add force update
 for future time
Thread-Topic: [OE-core][PATCH] cve-update: log timestamps and add force update
 for future time
Thread-Index: AQHcFrumwGixcN0FPEGgqgjaa0aiarSZB1kAgAABWqA=
Date: Thu, 18 Sep 2025 12:55:22 +0000
Message-ID: 
 <PA4PR10MB5707144A5B4B39EEDF739AEFFD16A@PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM>
References: <20250826185922.20154-1-peter.marko@siemens.com>
 <a9a5777d-d622-4e89-9888-3989f884e816@vaisala.com>
In-Reply-To: <a9a5777d-d622-4e89-9888-3989f884e816@vaisala.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=a3002ba0-a133-409b-9bc3-44f6929cc91b;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-09-18T12:52:26Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR10MB5707:EE_|AS4PR10MB5444:EE_
x-ms-office365-filtering-correlation-id: c2619baa-8e95-4498-7185-08ddf6b2a146
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|4022899009|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?d3NaMVJTUXQxWHlaUWUza0tRTzhQSmlPZ3RNdFVLN3NxWjE1RFpyOHU4TFFa?=
 =?utf-8?B?akRra3V3UFBETkh6ZGlMZXcyYktaci9ma2Q1bUFmbzdMaitqNjJ5S1ZxMVRI?=
 =?utf-8?B?WlZxcGRHQlFuMzJsVXp4N1d5T0lzdk1ZR0RINHczK1N5L3NBRXJGbmI3TGpY?=
 =?utf-8?B?VldEZ1l4TTRwQ0FZWktyS3JjQ0F5RWRveUdlV0UyL2VoSnBDd1RQMXhtZXIw?=
 =?utf-8?B?SXlsUjE4NEdidWNjWS9lZ1lSK2Z2ZDIzMWtxSGF6MVoyb2w4Z0VwN1NzMFd5?=
 =?utf-8?B?YkJITlNKSEJIRkMyZmVVWkowM0YzeTY2bGRZd3p3SDBPNHU3VXFrWk9lN0Rk?=
 =?utf-8?B?NUZRTzFQRHdyVkFLMHhHdjl0ZlQrcnRKdWJBZU5lQjFOMkNrZjFFeGcyY0JZ?=
 =?utf-8?B?ZnAzUGZVMlpjclFpTnZzMUtuY0pteitNaTIvQ0ZmR1B2TXdxejFIM1FIUDJO?=
 =?utf-8?B?aDlPOTdCQVZJOUwyVzZwUEo3a2FzcEc3bWlkUitoM3M3amtrUngxalZzd1Vk?=
 =?utf-8?B?UGF6cVBiM2ZETXQrTUtVY1k4WE5yUkJtQUFCdzhETXZ0QTFma2wvN00yOGRL?=
 =?utf-8?B?NTg5YWErNURsOFJQZzk2KzdqazVWeEIyQ0hQK2dHWlo4dHBLWHA2NTNQNVdZ?=
 =?utf-8?B?SnN1Y2NsdkJyU1ZVUVhRcmlKNERrZ0JtdWRCbDh6aFBUanpiUDNoSVRGc1Nj?=
 =?utf-8?B?MVJtV0ZiMk5WNGsxQ3lzdEk1ZGt6QkNrcW5JVlVJN3hIbllhS2svWUpBOXVG?=
 =?utf-8?B?OUZ3cDI0SXlkZnh1QkZ1QzIrRUN4aktHZ0N2dnNmclAzQXluUHByMUtrN2dh?=
 =?utf-8?B?U29xUThyTlFiZ2lNQVIyekFDWndlZDNwMXZGQnpWcitVZm1lRmpIMmRhaE5V?=
 =?utf-8?B?cnVnWW1vRVhod2dURlhRWW5EOEs5VTFVK0EyMkRaaHJadW5xU0R4NHRWSk1B?=
 =?utf-8?B?Qi8weDZ2RVJodlVrWGYrUXQwUTJWczlqSjFqY09VVlV2VEUyWHNnY2lWOTVy?=
 =?utf-8?B?Z3ZkeUJyR3N0VkphS1dKUXhaRlh6RHpuU1NXekVZaGdNeDhlNjkrUTFieFlv?=
 =?utf-8?B?Z3dac2dreVM4VjdiRlJ0RWhra2ZQck1UVHEwZkFpbU5hdmd0aHBCSWVmRmZH?=
 =?utf-8?B?RnJmSUVxMEFqR29aYlE5RHJQUHRiOWVPRUU3R2NmS3lvSXk5RjFGWTR2Uk9T?=
 =?utf-8?B?ZHc3c1VQUzB4dENEMGxBWlZCMXliU0hHckFJNnhGV2VVekllSGZwL2tYeUVi?=
 =?utf-8?B?N1A5WHdOZ0xaL0YyWUtkVkp2Y0xOMnFoTDdEMWp5dm8wQ09OKyt1SlRXUnhV?=
 =?utf-8?B?Z1RRWUlCbE1KclM4VXdSUzErekhlTDRMa3BzbG4rMHJMdmJVcDZMMDM2LzRo?=
 =?utf-8?B?aW1FazNMaWxqVENORzFVR21Fb01BK1hqbVhkZSt2SnJCeElZNE1yTjdDeUwv?=
 =?utf-8?B?MGN6akRldTRpUE5lRzh1ZmluN1J1SHprenkrTmg5azM3TnhhSTZ2cXlBOFNw?=
 =?utf-8?B?Ly9mMVRYSjdZUEJFb0MzSm0vU0xTV0puNjk2a2wvRlRkNnlGYmFvZ3NoRWdM?=
 =?utf-8?B?R0pUVElYVC9QdHVKZEZ2ZmxrNlVoL0srdnN3U2NoM1M4T3U0TlV5UDg2VzVG?=
 =?utf-8?B?c243blh1OUoxOFNEazJ4blprSUtVMGJLdksvWDRkNm5odFVyUHplV2xYdm1u?=
 =?utf-8?B?a2pNYUhULzNyRGNkU1NUM3RDam9Cc2dzWFkxeDVCNWQwMEh1cVB2dTUvMFZT?=
 =?utf-8?B?ZXdkOFYweVRtUWE4WUpmVWx1OXRUUGFOT2ZMVnlya3N2YitWbWJiYmc4RzBM?=
 =?utf-8?B?R21WVVhHUXRNeXBJaytlamh5N0xYaW96QUZGSEpRcWhJOCtwRWhPdklXUzlH?=
 =?utf-8?B?Z1JOZTdlZUUrYkh4cFdlL3UwdUs0clJWT21LMFJPaGFYZ3Z0eWNHNXZ5Mkxo?=
 =?utf-8?Q?smxI9f0gz34=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RldmeWxaUFQ0eUpLcVBRcTNQdENSbHNVcHM1b1lscklyam9xeUlkNTJ2d2RB?=
 =?utf-8?B?UXRkaFA0VXo2ZXlFWXhSRE1YblBIbjUwUkpDVk5JL1ZKRG95UGVxMHJVa1hF?=
 =?utf-8?B?L1dVYmJHL1d5bEJSb3laVy9NNWtlb1lJQ3d0a2hWWnQ1N2p4U25oVERWZXZJ?=
 =?utf-8?B?YWQyNlk0WTZPbTZXRUFsZkhRS2E1eExram1lK01IdTZ5Qm1KVTcwcUlQUGg0?=
 =?utf-8?B?MWVkTUxrSTQ5bHQzQzVTUDVWcTQxQWY2WHQ0TGRydUtuczNISzJrekRVcXhx?=
 =?utf-8?B?UGYyMXdXZmgyUURzWUdUUWNBVVZzNGVuQ2orNDdFTVkva3ZGSGIrS1pVK3lq?=
 =?utf-8?B?R0hpNXRJemphRS9YNTU0WFNIT1pWcFVpQVQ5QWtldldoR3VraS9ieEZBcWYw?=
 =?utf-8?B?cW1ROWxPV0pKNWxxSVNZcktEWUxrV3hPTlBsajNCTmJIS29LdVJwaTQ1Qk5N?=
 =?utf-8?B?Tjc3SXQyYzFmNld4QlcxdEJKaG5wQWNDNjBFeTg3QWl3aU00N0RJTklIYXU3?=
 =?utf-8?B?ekI5ckF4R2VTekdPLzdWMHBOK0JlTEhzb040SHpDdTR4azNxNnZrSHpmcENI?=
 =?utf-8?B?MURDVi9HdERuVldFNU1LQ3FsZklNMXMvZ1JFWk5VL28wMmNPNkhtWXJTNU5F?=
 =?utf-8?B?NG8wVUpxWTFhRkVRMzhpenhhWjJ1VzNldFNGNjBsR0RzUXc3dHVkOWp2eFdr?=
 =?utf-8?B?WGhTUDRBN0JXeVV0TXdTdHRQYkZEZHFWNUJYMmJzTXk1MW45VXNreVhNYVVT?=
 =?utf-8?B?UmNaMW1XTC8yUjE4b0NUWXEwcFdWSTREbHF6TjV3N3JjdXo5SEZBN1Jod0JP?=
 =?utf-8?B?SWVTb2NHR2hUQ3ZyUmJZWWZ2S0VWTm1GRmpYUnU0YnBQdHpFNWx3NEI0eExW?=
 =?utf-8?B?bksxVnJIcTg4bzVyaG1Cc2VTeE5pRUFVRlhQQmQ5YThqRkRidWx4YjliZElX?=
 =?utf-8?B?UG1JUStNMCtCNFdxY1hTZUV6bzh6a29KOW9OcTVqakZ6WEwxUWRpUWhvR2lt?=
 =?utf-8?B?bkJLODdReVJmQzluL2JYSDd2dzV6Q2NZR3hWRXFvMjc4ZEZWOHRzVGp3S3c5?=
 =?utf-8?B?WUtiUjFMMDVGUHFyOStpRzN0eEJJcjVPNTZLVHRWVnMvRnBOb1YrK1dCR2hh?=
 =?utf-8?B?ZUp5Vytvb3o0enBQb2IxWTE3U3RYeDdyZVkydm9Ua0xJa3hxVkR0Ny9XZTRC?=
 =?utf-8?B?VnROK3p0aGZ0S01sWTJBaUZ1MUkrQ3Q5WmUyNm9TWWdQenZ5cGJ2NFRoZlVQ?=
 =?utf-8?B?VnVQQnpWcFYyYjNSQ2tzb3BBeDdyV1NVMDlYMUNNQ0tnUE9JakNxMU9Dekxt?=
 =?utf-8?B?MVB4eFVBUnpzcTdER1NIT0tEaFZoakVQMkNvM1BIKzFvdlFjZ2ZLeis0b0U1?=
 =?utf-8?B?WXZ3UnhjK3I2VTAvbFFQYXd5L0NMYzRacVN2dE0zYWVuTDFnd1FRay9vdk5Y?=
 =?utf-8?B?YnljenlURHNBcTk2Q3BzaEswSmlFbFNHTW5YUGJwTXVod3hDTUVqbFFKZXhU?=
 =?utf-8?B?Q2FzTlppTkNVT2Y2VWUvbk1xNlp5aytqVXJhMVo1Qlc3djBEMjBoUmdOVzcx?=
 =?utf-8?B?NE1ZYWdIMzB4L1lEZkxyZlY3MFNlcy9hN0VuUFZQaTFMMzNuOFJqcHpScitt?=
 =?utf-8?B?KzQ5VFdDS0Z5bnJ5RnFkK3R5d1F4anNFR3JRam5Rc2ZWU0g5M0Mrclh1UzM4?=
 =?utf-8?B?bmg4L1RpZzl3OGRxaWNWQlczSERyOEpsa1FGMTFNZ2xSSlIrNHdXOG1MdW9Q?=
 =?utf-8?B?TGM0dFFncjVFVkk0Z1MwSGNCUFhYQm1ycFBhUytacEwvRkZIbGVIQnpZSWdp?=
 =?utf-8?B?M0RVWFBWN1U0OGtKOHlWS1Mva09ZYzlOMm1FOE1vOVJGRzNocGNHVUh3Yjl0?=
 =?utf-8?B?SVNEcVc4Zzh5MXZMdFZaVkU0clNQNWhLQ0RlSmlLc0x3SzE2ODkrUHZ1WDlx?=
 =?utf-8?B?UzBROW5PZXJ2eElpU1FEdEUvV2VKaVV3VzRhc1piQ05ldEt2bXI4Mms5R2Fn?=
 =?utf-8?B?YWxaTlg0aXV5YXBVaFJlUVNHaWN6eDJNWWR2cmtkR3FaTDh2M2tKZ1pLRGJC?=
 =?utf-8?B?UWlGQ1Rkd2kxcjduS1FKT0srbThzV2gvYTAwSHVNdkorMFl3ZXJ2M0ZwczNs?=
 =?utf-8?Q?9ZhfluBFgZJnjZ6MCiLgWz/Wq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c2619baa-8e95-4498-7185-08ddf6b2a146
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2025 12:55:22.6598
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y4oQ9S4ROUiky2BpjHuhucZWZe8xAvVbyNIcUwtLrXcFWvRR/xd30nGEY7IKo20ALNd3QrNhNOqqLonhxizIlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5444
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 12:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223639

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmlrbyBNYXVubyA8bmlr
by5tYXVub0B2YWlzYWxhLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAxOCwgMjAy
NSAxNDo0OA0KPiBUbzogTWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpIDxQZXRlci5NYXJr
b0BzaWVtZW5zLmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSF0gY3ZlLXVwZGF0ZTogbG9nIHRpbWVz
dGFtcHMgYW5kIGFkZCBmb3JjZSB1cGRhdGUNCj4gZm9yIGZ1dHVyZSB0aW1lDQo+IA0KPiBPbiAy
Ni44LjIwMjUgMjEuNTksIFBldGVyIE1hcmtvIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdy
b3RlOg0KPiA+IEZyb206IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4g
Pg0KPiA+IENWRSB1cGRhdGUgaXMgY3VycmVudGx5IG5vdCB3b3JraW5nIHByb3Blcmx5IG9uIGF1
dG9idWlsZGVyLg0KPiA+IFRoaXMgaW1wcm92ZXMgbG9nZ2luZyBmb3IgcHJvYmxlbSBhbmFseXNp
cy4NCj4gPg0KPiA+IEZ1dHVyZSB0aW1lIGlzIHNvbWV0aGluZyB3aGljaCBjb3VsZCBiZSByZWFz
b24gZm9yIGN1cnJlbnQgYXV0b2J1aWxkZXINCj4gPiBwcm9ibGVtcyBzaW5jZSB0aGUgREIgd2Fz
IG5vdCB1cGRhdGVkIGZvciBtb3JlIHRoYW4gMyBtb250aHMgYnkgbm93Lg0KPiA+DQo+IA0KPiBD
VkUgY2hlY2sgbWVjaGFuaXNtLCB3aGljaCByZWxpZXMgb24gYSBDVkUgZGF0YWJhc2UgdGhhdCBj
YW4gc2lsZW50bHkgZmFpbCB0bw0KPiB1cGRhdGUgZm9yIHNldmVyYWwgbW9udGhzLCBzZWVtcyB0
cm91YmxpbmcgdG8gc2F5IHRoZSBsZWFzdC4NCj4gDQo+IExvb2tpbmcgYXQgdGhlIGRvX2ZldGNo
KCkgbWV0aG9kIGluIGJvdGggcmVjaXBlcyB0aGV5IHNlZW0gdG8gdXNlIHRoZQ0KPiBvcy5wYXRo
LmdldG10aW1lKCkgbWV0aG9kIHRvIHJlc29sdmUgdGhlIGxhc3QgbW9kaWZpZWQgdGltZSBvZiB0
aGUgZGF0YWJhc2UuIFRoZQ0KPiB2YWx1ZSBpcyBob3dldmVyIGJhc2VkIG9uIGRhdGFiYXNlIGZp
bGUgbW9kaWZpY2F0aW9uIHRpbWUuIFRoaXMgc2VlbXMgaW5oZXJlbnRseQ0KPiBmcmFnaWxlLCBh
bmQgSSB3b3VsZCBiZSBjdXJpb3VzIGlmIHRoZXJlIHdvdWxkIGJlIGEgbGVzcyBwcm9ibGVtLXBy
b25lIGFwcHJvYWNoDQo+IHRoYXQgY291bGQgYmUgdXNlZCB0byByZXNvbHZlIHRoZSBsYXN0IG1v
ZGlmaWVkIGRhdGUsIHN1Y2ggYXMgcmVzb3J0aW5nIHRvIHRoZSBtb3N0DQo+IHJlY2VudCBDVkUg
bGFzdCBtb2RpZmllZCBkYXRlLiBTZWVtcyBpdCBjYW4gYmUgZXh0cmFjdGVkIGZyb20gdGhlIGRh
dGFiYXNlIGZpbGUNCj4gYnkgaXNzdWluZzoNCj4gDQo+ICAgIHNlbGVjdCBNT0RJRklFRCBmcm9t
IE5WRCBvcmRlciBieSBNT0RJRklFRCBkZXNjIGxpbWl0IDE7DQo+IA0KPiBJJ20gbm90IHN1cmUg
aWYgYWxsIHRoaW5ncyBjb25zaWRlcmVkIGl0IGlzIGNvbXBsZXRlbHkgYXBwcm9wcmlhdGUgdG8g
dXRpbGl6ZSB0aGUgTlZEDQo+IE1PRElGSUVEIHZhbHVlIGluIHRoaXMgZmFzaGlvbiwgYnV0IGl0
IHdvdWxkIGZlZWwgYXQgbGVhc3QgbGVzcyBoYXphcmRvdXMgdGhhbg0KPiByZWZlcmVuY2luZyB0
aGUgbW9kaWZpY2F0aW9uIHRpbWUgb2YgdGhlIGRhdGFiYXNlIGZpbGUgaXRzZWxmLg0KPiANCg0K
SSB3YXMgY29uc2lkZXJpbmcgbXVsdGlwbGUgb3B0aW9ucywgYWxzbyB1c2luZyBhIHRleHQgZmls
ZSB3aXRoIHRpbWVzdGFtcCBpbnN0ZWFkIG9mIHRoZSBnZXRtdGltZS4NCllvdXIgcHJvcG9zYWwg
bG9va3MgbmljZXIuDQpCdXQgSSBkZWNpZGVkIHRvIGZpcnN0IGxvb2sgYXQgdGhlIEFCIGxvZ3Mg
YmVmb3JlIGltcGxlbWVudGluZyBzb21ldGhpbmcuDQoNClVuZm9ydHVuYXRlbHksIG15IHBhdGNo
IHRvIGV4cG9zZSB0aGUgbG9ncyB3YXMgbm90IG1lcmdlZCB5ZXQgOi0oDQpodHRwczovL2xpc3Rz
LnlvY3RvcHJvamVjdC5vcmcvZy95b2N0by1wYXRjaGVzL21lc3NhZ2UvMjA4Mw0KDQo+IC1OaWtv
DQo+IA0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2ll
bWVucy5jb20+DQo+ID4gLS0tDQo+ID4gICBtZXRhL3JlY2lwZXMtY29yZS9tZXRhL2N2ZS11cGRh
dGUtZGItbmF0aXZlLmJiICAgfCAgNyArKysrKystDQo+ID4gICBtZXRhL3JlY2lwZXMtY29yZS9t
ZXRhL2N2ZS11cGRhdGUtbnZkMi1uYXRpdmUuYmIgfCAxMSArKysrKysrKy0tLQ0KPiA+ICAgMiBm
aWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL21ldGEvY3ZlLXVwZGF0ZS1kYi1uYXRpdmUu
YmIgYi9tZXRhL3JlY2lwZXMtDQo+IGNvcmUvbWV0YS9jdmUtdXBkYXRlLWRiLW5hdGl2ZS5iYg0K
PiA+IGluZGV4IDBjN2JjNWY0MTUxLi43MTNjNzNlNTc0ZiAxMDA2NDQNCj4gPiAtLS0gYS9tZXRh
L3JlY2lwZXMtY29yZS9tZXRhL2N2ZS11cGRhdGUtZGItbmF0aXZlLmJiDQo+ID4gKysrIGIvbWV0
YS9yZWNpcGVzLWNvcmUvbWV0YS9jdmUtdXBkYXRlLWRiLW5hdGl2ZS5iYg0KPiA+IEBAIC01Nyw3
ICs1NywxMiBAQCBweXRob24gZG9fZmV0Y2goKSB7DQo+ID4gICAgICAgICAgICAgICBpZiBub3Qg
b3MucGF0aC5leGlzdHMoZGJfZmlsZSk6DQo+ID4gICAgICAgICAgICAgICAgICAgYmIuZXJyb3Io
IkNWRSBkYXRhYmFzZSAlcyBub3QgcHJlc2VudCwgZGF0YWJhc2UgZmV0Y2gvdXBkYXRlDQo+IHNr
aXBwZWQiICUgZGJfZmlsZSkNCj4gPiAgICAgICAgICAgICAgIHJldHVybg0KPiA+IC0gICAgICAg
IGlmIHRpbWUudGltZSgpIC0gb3MucGF0aC5nZXRtdGltZShkYl9maWxlKSA8IHVwZGF0ZV9pbnRl
cnZhbDoNCj4gPiArICAgICAgICBjdXJyX3RpbWUgPSB0aW1lLnRpbWUoKQ0KPiA+ICsgICAgICAg
IGRhdGFiYXNlX3RpbWUgPSBvcy5wYXRoLmdldG10aW1lKGRiX2ZpbGUpDQo+ID4gKyAgICAgICAg
YmIubm90ZSgiQ3VycmVudCB0aW1lOiAlczsgREIgdGltZTogJXMiICUgKHRpbWUuY3RpbWUoY3Vy
cl90aW1lKSwNCj4gdGltZS5jdGltZShkYXRhYmFzZV90aW1lKSkpDQo+ID4gKyAgICAgICAgaWYg
Y3Vycl90aW1lIDwgZGF0YWJhc2VfdGltZToNCj4gPiArICAgICAgICAgICAgYmIud2FybigiRGF0
YWJhc2UgdGltZSBpcyBpbiB0aGUgZnV0dXJlLCBmb3JjZSBEQiB1cGRhdGUiKQ0KPiA+ICsgICAg
ICAgIGVsaWYgY3Vycl90aW1lIC0gZGF0YWJhc2VfdGltZSA8IHVwZGF0ZV9pbnRlcnZhbDoNCj4g
PiAgICAgICAgICAgICAgIGJiLm5vdGUoIkNWRSBkYXRhYmFzZSByZWNlbnRseSB1cGRhdGVkLCBz
a2lwcGluZyIpDQo+ID4gICAgICAgICAgICAgICByZXR1cm4NCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtY29yZS9tZXRhL2N2ZS11cGRhdGUtbnZkMi1uYXRpdmUuYmIgYi9tZXRh
L3JlY2lwZXMtDQo+IGNvcmUvbWV0YS9jdmUtdXBkYXRlLW52ZDItbmF0aXZlLmJiDQo+ID4gaW5k
ZXggZjdhMzA2Yzk5NWMuLjE0MTFkMTZlMjBhIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvcmVjaXBl
cy1jb3JlL21ldGEvY3ZlLXVwZGF0ZS1udmQyLW5hdGl2ZS5iYg0KPiA+ICsrKyBiL21ldGEvcmVj
aXBlcy1jb3JlL21ldGEvY3ZlLXVwZGF0ZS1udmQyLW5hdGl2ZS5iYg0KPiA+IEBAIC03MSwxMCAr
NzEsMTUgQEAgcHl0aG9uIGRvX2ZldGNoKCkgew0KPiA+ICAgICAgICAgICAgICAgaWYgbm90IG9z
LnBhdGguZXhpc3RzKGRiX2ZpbGUpOg0KPiA+ICAgICAgICAgICAgICAgICAgIGJiLmVycm9yKCJD
VkUgZGF0YWJhc2UgJXMgbm90IHByZXNlbnQsIGRhdGFiYXNlIGZldGNoL3VwZGF0ZQ0KPiBza2lw
cGVkIiAlIGRiX2ZpbGUpDQo+ID4gICAgICAgICAgICAgICByZXR1cm4NCj4gPiAtICAgICAgICBp
ZiB0aW1lLnRpbWUoKSAtIG9zLnBhdGguZ2V0bXRpbWUoZGJfZmlsZSkgPCB1cGRhdGVfaW50ZXJ2
YWw6DQo+ID4gLSAgICAgICAgICAgIGJiLm5vdGUoIkNWRSBkYXRhYmFzZSByZWNlbnRseSB1cGRh
dGVkLCBza2lwcGluZyIpDQo+ID4gLSAgICAgICAgICAgIHJldHVybg0KPiA+ICsgICAgICAgIGN1
cnJfdGltZSA9IHRpbWUudGltZSgpDQo+ID4gICAgICAgICAgIGRhdGFiYXNlX3RpbWUgPSBvcy5w
YXRoLmdldG10aW1lKGRiX2ZpbGUpDQo+ID4gKyAgICAgICAgYmIubm90ZSgiQ3VycmVudCB0aW1l
OiAlczsgREIgdGltZTogJXMiICUgKHRpbWUuY3RpbWUoY3Vycl90aW1lKSwNCj4gdGltZS5jdGlt
ZShkYXRhYmFzZV90aW1lKSkpDQo+ID4gKyAgICAgICAgaWYgY3Vycl90aW1lIDwgZGF0YWJhc2Vf
dGltZToNCj4gPiArICAgICAgICAgICAgYmIud2FybigiRGF0YWJhc2UgdGltZSBpcyBpbiB0aGUg
ZnV0dXJlLCBmb3JjZSBEQiB1cGRhdGUiKQ0KPiA+ICsgICAgICAgICAgICBkYXRhYmFzZV90aW1l
ID0gMA0KPiA+ICsgICAgICAgIGVsaWYgY3Vycl90aW1lIC0gZGF0YWJhc2VfdGltZSA8IHVwZGF0
ZV9pbnRlcnZhbDoNCj4gPiArICAgICAgICAgICAgYmIubm90ZSgiQ1ZFIGRhdGFiYXNlIHJlY2Vu
dGx5IHVwZGF0ZWQsIHNraXBwaW5nIikNCj4gPiArICAgICAgICAgICAgcmV0dXJuDQo+ID4NCj4g
PiAgICAgICBleGNlcHQgT1NFcnJvcjoNCj4gPiAgICAgICAgICAgcGFzcw0KPiA+DQo+ID4NCj4g
Pg0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4gTGlua3M6IFlvdSByZWNlaXZlIGFs
bCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+ID4gVmlldy9SZXBseSBPbmxpbmUgKCMy
MjI0NzUpOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtDQo+
IGNvcmUvbWVzc2FnZS8yMjI0NzUNCj4gPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZy9tdC8xMTQ5MDU0MTkvMzYxODQ3MQ0KPiA+IEdyb3VwIE93bmVyOiBv
cGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gVW5zdWJz
Y3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3Jl
L3Vuc3ViDQo+IFtuaWtvLm1hdW5vQHZhaXNhbGEuY29tXQ0KPiA+IC09LT0tPS09LT0tPS09LT0t
PS09LT0tDQo+ID4NCg0K

