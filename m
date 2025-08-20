Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7D7CA0EDC
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 14:40:42 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.13])
 by mx.groups.io with SMTP id smtpd.web11.488.1755700835417536183
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 07:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Xzyib9Zp;
 spf=pass (domain: siemens.com, ip: 40.107.130.13, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N/UUFwssNH7WTLeBsjbVZ8RB1TxELoaJ1DbcnUGFcX0ytt2myHdhVNvhneSMyepF01Vt/lewB89LSQcW0GFEAlEcR4x5o4vurSVZss2p/LdDGfvZEHEfMKwdbOY+RTnb9fSocXfaE5an9GFiNxcL9pJKKGfD8KhlADJR2MoSA5Cblg5F/+mquz2JBzYifpp7eyjy1Sl//BOZvR/JU1OkbOzSr8neifmVq5CcGTaOKgzajK1YZ+xwoCJslhq7qnICWTM4yJhqOf0pF9Yk/Hm6ETWwwoEaIBoX5Yx/7AKA423FtprAcJHKNcN5JaEzNmIUr0oA6P4GvS/ltHN8JfNCQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzcGNSWB8jedO7uY/NtwBMRvsOGXx/WmBVw6IEawLyg=;
 b=MOJxbMJ7qVZaUyZdYrodfXGI2+0rxB+xW9w+Rz7IliHQA0K/b9hT/YUIDKXKRyiCbvVkOxpDuNo2OluVzZm/XyHx8wkcvmsWM9mYEOgE/1Id31fREJM2yF0xWKdFNSB9VWqhTocL4GpeByJ+Bnhxi6kcbsWo19yRFXtxlkLolmtxyhbIlZ38ErIvHP8d/4taGLU3rSyQwRPgor7VMwRv9X33fYssIX3HIv93TMDnpL7Y1h33xJySFD49I1shqF0DFrrX8VLTwCJnbo95n+pPMmey/CnH00KruIcXqzLPj7c/Spkf54JRue3Wt3+A0wPhcsiYRJ1i5ZeoudTdE9SxDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzcGNSWB8jedO7uY/NtwBMRvsOGXx/WmBVw6IEawLyg=;
 b=Xzyib9Zp2v7QTSul2E2cCDGAUGsrxq5ajEXRJl/gZzlmXFmj6sWIxEnitmu/VWLMot5qD9oTn9aFi7Hvg0wKpJdORjJEZdpvdzbSMdA6mMidID9aHsq4TSKXjs0QOzKTE05asM09tXbwQPNwOJhjixxcxHSrM59PjXBNYl33nKKvQlEXga3aUlAjkZPyVwJJSW1pznOAQPRFKEd40LbhTx7SD4bXtLv5XWfwvPWWq3eKUJfONHaQkjviej3RCklY0meo/JQQSlgqXdGA7LSxyxPYbaO4HvGlikTqUgF76jbNcB3TPQeYHhSKgHUnltH2d/ph7xmEJFXXppbuJlIgXg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS1PR10MB5165.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4ad::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 14:40:31 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 14:40:31 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Khem Raj <raj.khem@gmail.com>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>, Ross Burton <ross.burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 3/3] m4: Fix ptest on musl
Thread-Topic: [OE-core] [PATCH 3/3] m4: Fix ptest on musl
Thread-Index: AQHcEKTh6NWJlinn5kqi3BM9cLCb4bRrFJoAgAAOeICAAEHFgIAAOJAAgAABR8A=
Date: Wed, 20 Aug 2025 14:40:30 +0000
Message-ID: 
 <AS1PR10MB5697C7D8E470853393F57036FD33A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250819010128.3519760-1-raj.khem@gmail.com>
 <20250819010128.3519760-3-raj.khem@gmail.com>
 <DC71FJJ2QC94.35CLO3OBAN1BF@bootlin.com>
 <CAMKF1sqTdHQrCUYK3dGGzi+=mGZBogaR1TD2r+zMSkJWz3vWUg@mail.gmail.com>
 <DC77JFI2499F.1BTYUM51QCASE@bootlin.com>
 <CAMKF1spYCYK3PJ-Keauh1Z3n7i6xq1TUJMfSbCB_Gu9S_80FbQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spYCYK3PJ-Keauh1Z3n7i6xq1TUJMfSbCB_Gu9S_80FbQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=c80f575b-d2e1-4cb4-b01d-d115455f2d61;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-08-20T14:37:41Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS1PR10MB5165:EE_
x-ms-office365-filtering-correlation-id: 1e2131d5-61cb-4815-31ca-08dddff78364
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZFZnbjYxdHJoYzgzSTlKcUNmV01JZVNOZDQrVjh3bjYzTFd5MzVIb2RZY2Ro?=
 =?utf-8?B?bEVIb29GVHRqT0cybGRoWEJJTXhLdU1DZGpPK292aUJLc2pGSW5pZXZtaHpN?=
 =?utf-8?B?WTVTS1IyRkRXbGVZMXMvUjZTTUNDVkNYRjR1LzI2MTQ3WmRncVcxWEtFSFFQ?=
 =?utf-8?B?aUVMZ0RXQWtnRitQWFEvdW1kSXhDTEhCU1VoaWFKSldTY0NPK2c2SnZacXhH?=
 =?utf-8?B?K2ZUdjQ3bXA4Yms4QlhnWWxSZldrOTJTREk2UW9admR3dnR5eUt5QmY4dnlO?=
 =?utf-8?B?RzJYQmpSWTlRM1BFRi9DMnArSjBndEh4aFhTUjZ0WVVBRzBQTU9yaXpRRlYw?=
 =?utf-8?B?U21JdkJyV2RpWTlwOUd3YnhERHRkZjNtZTJKZktBZFE3WHoyNVo0UVlrVWFX?=
 =?utf-8?B?VGFJZDNoZ3ZKVWpWclRoOVFuUGpaaFduczNzOGZnd1dwMDlTZXFiVHZ1UmhD?=
 =?utf-8?B?bEJtM00ydVVybHBNa3JIRUphR0RsbnpTeWd0UzNYWUhXTy9GbExUSW5aMHpv?=
 =?utf-8?B?SjJSZjRxQ3dUQ2FESnBSNVBQSGRoT1dUT29ZSTVPNHk0anVYcFBNeVZpZXNG?=
 =?utf-8?B?aTVkdzhYZllIbU15eWhxNkRMc1ZpQTlnOHVZNjB6b2hISXFUbm53QXZySmdh?=
 =?utf-8?B?UkpmM2NNUzlCQlZZRHZDTmRGMUlQQ2JpZldXVG1UQnhINWVBdGNYbGdiMHFZ?=
 =?utf-8?B?ZHBnNnNORVV1RTFheEhHUnJVMWZtY3ZBS0xoQndUeSs5QmU0QjBnSlp2QlZw?=
 =?utf-8?B?OW0wczhDbGZNZnZseFNXMWpGemQwaHZNRU5tMUVKNWhRQVptbDVlV2JCd21J?=
 =?utf-8?B?TjBoYytaVDZuOVF5V0psSGJubHJZTHJQbm11SXdEbWcxeUhIZk0zOVQ1N0cr?=
 =?utf-8?B?N0FZR3VXTmROTjM2eFZrcE9YSUtrUklEUHlxbytPeXRTVHZFcG9jRGtYcjdE?=
 =?utf-8?B?ckJ4SFdmeWdUaHc3cDRnSXpqS2dDeHE2OGZSOEdyNlFGeHNLSit2K09EMHBj?=
 =?utf-8?B?MGNEa1RnVzZ2S2QwZDhXWnFuU0hROU5OQXNuU2RscHM1N2dPYnh6Lzh6VUlB?=
 =?utf-8?B?b2RTa29aSzBUdHlpUnF1UitsNHFjMHZhVUc4RmtVUzdjMkRtUnhxQzdsOGRO?=
 =?utf-8?B?RjZKeGV3djNkM3dQRlNqbHFZdWpjRG1sTnp0OU52OGZxOFlFc3RzUUs1QUF5?=
 =?utf-8?B?Ni9jTWZ6NzdFYjBBL25kRk1rWEFrdVdrU21yKythRFZaU0wyazZYYlp5Z3R2?=
 =?utf-8?B?R01FUWVZeGRLUGdzN2VCRFBIMlpvcHc3T3J4S3lva1FCSTkwN0hFenFuQmkz?=
 =?utf-8?B?Si9GK2NQU1ZjRE4xKzF3Vm1VYUM1Uk5LRUp3OUIwdkY1Q3Erbi9pSHFBNjJw?=
 =?utf-8?B?UlYvZjh1YXBrSFluRWhob1ZKU0E0a3JEWDMzSUJUaUtFQlkzNU9pY3VvV1lv?=
 =?utf-8?B?c3VpKzlvRDRHTFdUNms5NGNSQTRtWkNCWmRualFNZEs3R0RvNlZ6OSsrc1Uz?=
 =?utf-8?B?ZzZOb2Z2NlVkbUxwK0lpNWlDWjNzdnVJTXFFZFo4MFVqdnZIcDgwUTJ3Y2lm?=
 =?utf-8?B?RWxjV2l4YkhLMG55VGp6Z0tZVEZFN0R0NDQxaG5ZcTF3SXdLellFWjhnaGFs?=
 =?utf-8?B?d2FJbHBzWDl0alE5S3l3TFNNWUtGV0RxRytGZVhDN0paMFdBeFcralY4Qkxj?=
 =?utf-8?B?bGFQaEtTRnE4b0FtTVAvd05vaEphRi9GTUVnVkVSYnUzU25QVElCRUJrQWZF?=
 =?utf-8?B?R0hwbnk2NVNIekRyc3ptOXhBU2pJUVRHaTh0QjBpWGFhZjdtbnpTdGYxaUp6?=
 =?utf-8?B?WlBnTGpZeTZ0MndnN1gwdTREUXIvOU9RcllkUkVQVVZKc2w2Q0JMWHArODU4?=
 =?utf-8?B?V0swdE1CYzJxNjNiV0JiSitLVGNXOW5PNXY0SDRrL0ZCTzdJN0wwc0d0Ukps?=
 =?utf-8?Q?awjG6CLaqpI=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eFpBZG42dlJpSHdYaDJ2VHNGUXpWSnhzMUgwd0dCZ0o4WitkUkE3QzBuMUhP?=
 =?utf-8?B?anozSmZmNWJqYkxKc3NOdi82NDBBS3htRDNMcGZ6Zk0ybkNabDY2bGZ5K2Fk?=
 =?utf-8?B?TUwxUk5XWi9UeWRuRU5NZ1NZdVplV1RxNWNBbEhibG1XSHFqYUt1Rlpram9F?=
 =?utf-8?B?Sm1SU1A1NWZzL3MvODBtdG5lNWZINEE2RVBycVhPZTJidGxVczZEWGFnd25S?=
 =?utf-8?B?N2Ewa0VxSHl4N3BsWnBmZnFFZnVGWW10K0NPenFzUDNNMlh1bUNBRlNjalJm?=
 =?utf-8?B?LzdlWFJ3OUw4dktlNVo5czAyaU4raHdDZ1RHa2ZaNWNkd1RQaytrNkNjZ2R5?=
 =?utf-8?B?bDlrTDg3S3BwZitqRitaZEhnRGR0V2E3UkhxTGp1Y000N1BRUmx3WjRXekpm?=
 =?utf-8?B?VnRWWjhUUXVkTlVIU0RPalpJK2Y1NDE3K1gzMDlqZGFMMktGZ21EZlE5S2V0?=
 =?utf-8?B?MUNiQjFvaDdNSzBFbENmUFdBeDVFd1MwTGhwdVRNMmxzMXhXRXQxU05oc2lL?=
 =?utf-8?B?aWtvL2ViQUl0a29pdCthMjBESmIxayt4ZllTZ1dhbFY1ZXdTZ2Jnc1JrWUdV?=
 =?utf-8?B?VkZwWldKaGIzU1RKNkxQbU5VREVaRjhKYzJFZ2JtRDJpaUpXYy9FVXdIS1BN?=
 =?utf-8?B?L2ZyT0YyZ0hNTStucVRaa3dhZ3lsS21Jcm44TXhkQS9yZnlNM0dHU29zOVpP?=
 =?utf-8?B?RFdRQ3FVRFFZNXVJZ1E4M3dTN1RRempkZVlQNm4yWEQ3NHNLMWpmTjg1bElO?=
 =?utf-8?B?ZjZpQlB4eGplV202ZDBiTFlkajZ5Z2VEU2h2U2NjQnBnSWcwNTBwUSs4V1FN?=
 =?utf-8?B?QnZvamwwUjVSdXZoM3ppcThLclAyUWFSVjdWN2lUeDVWREpCNUFucEl5eURM?=
 =?utf-8?B?UFJLcGNkQ2l6VjJ5OUkyY0NpQlFiVklzT01CcW1mSmlxWW8wTzRKbGFKZG5u?=
 =?utf-8?B?VjFIU0hSWUhmVkNLMVloTE40TXdxRVh5cG40dFZmUllPVVIxbE1MUDRpWjhx?=
 =?utf-8?B?SWhBbzJ3Q05JcmVtUC9RUzhObk83cTJya1E3MXdJYmFnUENlYVlFUU1EcmQv?=
 =?utf-8?B?Q01GdWdJdWwxdG4rbEQwNkJwS2NqWVRsSjVnZzFjYk1yNTJtMHR4WGpHRW1R?=
 =?utf-8?B?K0RGL0FDTG9NR2dmbnJYeGVZbUdab0lrNFRNTzYrM0trcUR5S2syVXE2MnlD?=
 =?utf-8?B?a0x6cVBpeEExbUgzWGVoaXNqYlhmR3MzYml2VktxdE4zWC83SVZldmc4Und6?=
 =?utf-8?B?bEo5WjVDY0VGYlBxZzVxSGRvNllQM3FKT09kZDVzL0VuTGVaYk5HSFFlZys0?=
 =?utf-8?B?WUhWaEthWjBTWmxuc09hVVc5Qnc5L1ZuUWRqWTN2eDJkaGV2bjgxM25tT01T?=
 =?utf-8?B?ZlNyS2RQRXJncUhtelB4QXVCc1kxODdIL1NnRkU3bVNFZ3dpUTRVeFdGRjc0?=
 =?utf-8?B?NmZIUnVQcW4rWkczM2JraUpPSFlPUGxSNlJ3dG9zQ0xiU0NyUW1uNUIveXRp?=
 =?utf-8?B?eXc4VEo5MTJzRWJjeTcwbDFQeGNyZCtTWDFsVzM5MTlKakowQmRZY1hVOGdM?=
 =?utf-8?B?YUpxbnA4UFZBRlhPQmpmMkxvdUVGNUw1OVZSa3BhWmJsQzA0N0ZKUmlPczYy?=
 =?utf-8?B?VVdpTXFsMVZsLzh2NVpGampqUVBBYnVnZDBUNGxIYzJlQnFQR2pxTndCbUZI?=
 =?utf-8?B?SkQ5djlKckdwVnJhMTcwZmhQYXlSS3BKaWdEWEhrRlRURmRIeVVNbHNXV2FF?=
 =?utf-8?B?d3JwcXVzZWo1U09FMnljaHpWYThJWWxnK3RDLytmby9vN2svcVpGT1N1N0Jt?=
 =?utf-8?B?OGo4ejZSNlYvV1ZtQyszbWFjcHR0aFZIUWtRYWhUSGVqZXdDVkZqVEtuWTNB?=
 =?utf-8?B?dURWSW8yUnlSeERUTnlLRXFrMmpVODNESFkva043M3gzVUVxMlhCRzFWZVk3?=
 =?utf-8?B?MGhmNkdZeEV3QkFQMEw1QVptQ2FsZVdMV2FxY2NFNTMvcEF1MnNuNGlEQXIv?=
 =?utf-8?B?a3hHNGFGOWNrZkk4bitiWWlrQ3F3Mnowb2g2ejZIMkVFdTRJV2ZVYVlWVkZX?=
 =?utf-8?B?U29DNGJka1FCUWxwQm9UUGpGcGdOT1pkKzBCWDgzVW81SVNVZ3hOQkpSWjdM?=
 =?utf-8?Q?0GyaqjdssxSdN7xJ2wfQJBkLy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2131d5-61cb-4815-31ca-08dddff78364
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2025 14:40:31.0156
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w/TJm5MxUU7lV3hYEQGdDxKv+TYp/yOBkkoHcGpY00QIU8eoifKD6DnHzxE5zzqPKbxAVhufyFS37KHoapuXwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5165
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 14:40:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222188

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBBdWd1c3QgMjAsIDIwMjUgMTY6MzMN
Cj4gVG86IE1hdGhpZXUgRHVib2lzLUJyaWFuZCA8bWF0aGlldS5kdWJvaXMtYnJpYW5kQGJvb3Rs
aW4uY29tPjsgTWFya28sIFBldGVyDQo+IChGVCBEIEVVIFNLIEJGUzEpIDxQZXRlci5NYXJrb0Bz
aWVtZW5zLmNvbT47IFJvc3MgQnVydG9uDQo+IDxyb3NzLmJ1cnRvbkBhcm0uY29tPg0KPiBDYzog
b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTog
W09FLWNvcmVdIFtQQVRDSCAzLzNdIG00OiBGaXggcHRlc3Qgb24gbXVzbA0KPiANCj4gT24gV2Vk
LCBBdWcgMjAsIDIwMjUgYXQgNDoxMOKAr0FNIE1hdGhpZXUgRHVib2lzLUJyaWFuZA0KPiA8bWF0
aGlldS5kdWJvaXMtYnJpYW5kQGJvb3RsaW4uY29tPiB3cm90ZToNCj4gPg0KPiA+IE9uIFdlZCBB
dWcgMjAsIDIwMjUgYXQgOToxNSBBTSBDRVNULCBLaGVtIFJhaiB3cm90ZToNCj4gPiA+IE9uIFR1
ZSwgQXVnIDE5LCAyMDI1IGF0IDExOjIz4oCvUE0gTWF0aGlldSBEdWJvaXMtQnJpYW5kDQo+ID4g
PiA8bWF0aGlldS5kdWJvaXMtYnJpYW5kQGJvb3RsaW4uY29tPiB3cm90ZToNCj4gPiA+Pg0KPiA+
ID4+IE9uIFR1ZSBBdWcgMTksIDIwMjUgYXQgMzowMSBBTSBDRVNULCBLaGVtIFJhaiB2aWENCj4g
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiA+PiA+IEZpeGVzDQo+ID4gPj4gPiAu
Li8uLi9zb3VyY2VzL200LTEuNC4yMC90ZXN0cy90ZXN0LWMzMmlzcHVuY3QuYzoyNjE6IGFzc2Vy
dGlvbiAnaXMgPT0gMCcgZmFpbGVkDQo+ID4gPj4gPiAuL3Rlc3QtYzMyaXNwdW5jdC5zaDogbGlu
ZSAzNjogICA0MDIgQWJvcnRlZA0KPiA+ID4+ID4gKGNvcmUgZHVtcGVkKSBMQ19BTEw9IiR0ZXN0
bG9jYWxlIiAke0NIRUNLRVJ9IC4vdGVzdC0NCj4gYzMyaXNwdW5jdCR7RVhFRVhUfSAzDQo+ID4g
Pj4gPg0KPiA+ID4+ID4gRkFJTDogdGVzdC1jMzJpc3B1bmN0LnNoDQo+ID4gPj4gPg0KPiA+ID4+
ID4gU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4NCj4gPiA+PiA+
IC0tLQ0KPiA+ID4+DQo+ID4gPj4gSGkgS2hlbSwNCj4gPiA+Pg0KPiA+ID4+IFRoYW5rcyBmb3Ig
eW91ciBwYXRjaC4NCj4gPiA+Pg0KPiA+ID4+IEl0IGxvb2tzIGxpa2UgdGhpcyBpcyBicmVha2lu
ZyB0ZXN0cywgc3BlY2lmaWNhbGx5IG9uIHFlbXVyaXNjdjY0Og0KPiA+ID4+DQo+ID4gPj4gVHJh
Y2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxhc3QpOg0KPiA+ID4+ICAgRmlsZSAiL3Nydi9wb2t5
YnVpbGQveW9jdG8tDQo+IHdvcmtlci9xZW11cmlzY3Y2NC9idWlsZC9tZXRhL2xpYi9vZXFhL3Nk
ay9jYXNlcy9tYXR1cmluLnB5IiwgbGluZSAyNSwgaW4NCj4gdGVzdF9tYXR1cmluX2xpc3RfcHl0
aG9uDQo+ID4gPj4gICAgIG91dHB1dCA9IHNlbGYuX3J1bigibWF0dXJpbiBsaXN0LXB5dGhvbiIp
DQo+ID4gPj4gICAgICAgICAgICAgIF5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eDQo+
ID4gPj4gICBGaWxlICIvc3J2L3Bva3lidWlsZC95b2N0by0NCj4gd29ya2VyL3FlbXVyaXNjdjY0
L2J1aWxkL21ldGEvbGliL29lcWEvc2RrL2Nhc2UucHkiLCBsaW5lIDE3LCBpbiBfcnVuDQo+ID4g
Pj4gICAgIHJldHVybiBzdWJwcm9jZXNzLmNoZWNrX291dHB1dCgiLiAlcyA+IC9kZXYvbnVsbDsg
JXM7IiAlIFwNCj4gPiA+PiAgICAgICAgICAgIF5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXg0KPiA+ID4+ICAgRmlsZSAiL3Vzci9saWIvcHl0aG9uMy4x
Mi9zdWJwcm9jZXNzLnB5IiwgbGluZSA0NjYsIGluIGNoZWNrX291dHB1dA0KPiA+ID4+ICAgICBy
ZXR1cm4gcnVuKCpwb3BlbmFyZ3MsIHN0ZG91dD1QSVBFLCB0aW1lb3V0PXRpbWVvdXQsIGNoZWNr
PVRydWUsDQo+ID4gPj4gICAgICAgICAgICBeXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl4NCj4gPiA+PiAgIEZpbGUgIi91c3IvbGliL3B5dGhv
bjMuMTIvc3VicHJvY2Vzcy5weSIsIGxpbmUgNTcxLCBpbiBydW4NCj4gPiA+PiAgICAgcmFpc2Ug
Q2FsbGVkUHJvY2Vzc0Vycm9yKHJldGNvZGUsIHByb2Nlc3MuYXJncywNCj4gPiA+PiBvZXFhLnV0
aWxzLnN1YnByb2Nlc3N0d2Vhay5PRVRlc3RDYWxsZWRQcm9jZXNzRXJyb3I6IENvbW1hbmQgJy4N
Cj4gL3Nydi9wb2t5YnVpbGQveW9jdG8td29ya2VyL3FlbXVyaXNjdjY0L2J1aWxkL2J1aWxkL3Rt
cC93b3JrL3FlbXVyaXNjdjY0LXBva3ktDQo+IGxpbnV4L2NvcmUtaW1hZ2UtbWluaW1hbC8xLjAv
dGVzdHNka2V4dC9lbnZpcm9ubWVudC1zZXR1cC1yaXNjdjY0aW1hZmRjLXBva3ktDQo+IGxpbnV4
ID4gL2Rldi9udWxsOyBtYXR1cmluIGxpc3QtcHl0aG9uOycgZGllZCB3aXRoIDxTaWduYWxzLlNJ
R1NFR1Y6IDExPi4NCj4gPiA+Pg0KPiA+ID4NCj4gPiA+IHNlZW1zIHF1aXRlIHVucmVsYXRlZCwg
SSB3b25kZXIgaWYgaXRzIGZpbmRpbmcgc29tZSBvdGhlciBidWcNCj4gPg0KPiA+IFllcywgSSBj
YW4ndCB1bmRlcnN0YW5kIHdoYXQgaGFwcGVucyBoZXJlIDooDQo+ID4gWWV0IHRoaXMgY29tbWl0
IGFsd2F5cyB0cmlnZ2VycyB0aGUgZmFpbHVyZS4NCj4gPg0KPiANCj4gTG9va2luZyBhdCBsb2dz
IHRoZXJlIGlzIHNvbWUgbW9yZSBpbmZvICBpbW1lZGlhdGVseSBhZnRlciB3aGF0IHlvdQ0KPiBw
b3N0ZWQgYWJvdmUgdGhhdCBpcyBpbnRlcmVzdGluZw0KPiANCj4gU3Rkb3V0Og0KPiBUcnlpbmcg
dG8gaW5zdGFsbCBweXRob24zLW1hdHVyaW4tbmF0aXZlLi4uDQo+IA0KPiBpdHMgcnVubmluZyBs
aWIvb2VxYS9zZGsvY2FzZXMvbWF0dXJpbi5weSBhbmQNCj4gaXQgc2VlbXMgaXQgbmVlZHMgcHl0
aG9uMy1tYXR1cmluLW5hdGl2ZSBpbiBzc3RhdGUgY2FjaGUgYW5kIEkgd29uZGVyDQo+IGlmIGl0
J3MgbWlzc2luZyBiZWNhdXNlIG00L200LW5hdGl2ZSBkZXBlbmRlbmN5IHdpbGwgcmVidWlsZA0K
PiBweXRob24zLW1hdHVyaW4tbmF0aXZlIG9yIHNvbWV0aGluZyBpcyByYWNpbmcgd2l0aCBpdC4N
Cj4gDQo+IFRoZXJlIHdhcyBhIHNpbWlsYXIgcHJvYmxlbSBpbiByZWNlbnQgcGFzdCBhbmQgYSBy
ZWxhdGVkIGZpeCB3YXMgY29tbWl0dGVkDQo+IGh0dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcv
cG9reS9jb21taXQvP2lkPTIyMzljMmM5MWFiMzVjNjdjY2Q5NWFmZTA1NzM1MDANCj4gMzdmN2Qw
ZTU5DQo+IA0KPiBJIG5vdyB3b25kZXIgaWYgdGhlIHRlc3QgaXMgZXhpdGVkIHdoZW4gaXQgZG9l
cyBub3QgZmluZA0KPiBweXRob24zLW1hdHVyaW4tbmF0aXZlIGNvcnJlY3RseSBvciBub3QuDQoN
ClRoZSBmYWN0IHRoYXQgbWF0dXJpbiB0ZXN0IGlzIGV4ZWN1dGVkIG1lYW5zIHRoYXQgaXQgd2Fz
IGluc3RhbGxlZCBzdWNjZXNzZnVsbHksIHNvIGNvZGUgaW4gbWVudGlvbmVkIGNvbW1pdCB3YXMg
bm90IGFjdGl2ZS4NCkFsc28gc2VnbWVudGF0aW9uIGZhdWx0IHN1Z2dlc3RzIHRoYXQgdGhlIGJp
bmFyeSBpcyBpbnN0YWxsZWQsIGl0IGp1c3QgZG9lcyBub3Qgd29yayBjb3JyZWN0bHkuDQoNCj4g
DQo+ID4gLS0NCj4gPiBNYXRoaWV1IER1Ym9pcy1CcmlhbmQsIEJvb3RsaW4NCj4gPiBFbWJlZGRl
ZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nDQo+ID4gaHR0cHM6Ly9ib290bGluLmNvbQ0K
PiA+DQo=

