Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC061CCFA13
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 15:31:54 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50778.1762788706532495482
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 07:31:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Rc6C3jSK;
 spf=pass (domain: siemens.com, ip: 52.101.70.16, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQgTvQoIDkN5JuVuV5dowdRc68zEpGp50yf/yhXTgAnzT7lBJkpvZqmxzI6G+s1ABp5J1tgER1CnqrbIkLWf2qOFmUDnSuqWczzFOoXsCn4UHBtt48zUpvV0xiirb+u0AWdc0xf4l5E81PhJAdp4GdOSgPR/KnDBqSBDvETmtCDTXxSQwLYYRZ7Ij187oFwFWOfxCVXQs5UK2PjHjSIoy6g77se7YeC/NYkMNOabNPLC4DVSWsXDtWgjPgncsm3S+GdnHPl5+igAUFLTH1arKpEzo9aVJxRqXkZvXHj9C6t54/paUD5O879Lmz3cvL7cYPP+ToKc5MkMQjkHFoWYVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUDpSYyxhGIEfcP0MWjlwPWCw2ad9tWyAIPzvb4Xidk=;
 b=Q1sHmCDwyrbapzInw+jralkat0YU66C/BtA7RQ+1SVL8HpXWHkaeqtYz194bIsiYVV5HRJ7d8ah8OTSsKHIX04sNZLjikEhehp0wnnPY261JVwGG29ic21UFPka+Vlz8te5fU+fLvFLe5EKDKQn/SzQxDgabSSmlP125qjBntAi+krcST4T1S3pFLl1EOCTwYmMAn02KQ/R476ZtxgL0tF13ZAWXupvBP/qs2NAbjTfRnd2vuNkFxAGGhAFraf/O/VSyqYEveGlGSaRvPCCkzq6CuhN3GYfWAFRix1c3ZJPTvJVhXlSFjB15eMD601tctsvjdF6U4504dcoFsVG6sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUDpSYyxhGIEfcP0MWjlwPWCw2ad9tWyAIPzvb4Xidk=;
 b=Rc6C3jSKP7OBRf/xUqtbvPiGAnu4wGaKzfHgQTG2jXyLuG618+CMPvDip4RfEVYRgg5ubOmZep201VcFHPNCXxrwoTptcEukHZBbrK6O/Reb1/JuzhGx/FDJ5cEfORkYkXcOJdSqly46eakXN/XDjvvwtnDVCJKpsnW7n6qrXbL3ZDA7wUhoNiLlBxUkfKXPSMb0Y0ojUNjRA7Ktq0FYuaiK+DesYNTs+sY9gQ6ErsbmFKwm5GMs3c0U5070ddirFFGOxvEMvgl2klRXd7AWsANS1uOmYDWeOZLmDLWCslA1HSVfEwFQhXIqONPyLDPUfOHVJWbbZ/942B/XT44VhQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PA4PR10MB5609.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:262::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 15:31:42 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9275.013; Mon, 10 Nov 2025
 15:31:42 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Marta Rybczynska <rybczynska@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"niko.mauno@vaisala.com" <niko.mauno@vaisala.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "ross.burton@arm.com"
	<ross.burton@arm.com>
Subject: RE: [OE-core] [PATCH 5/5] cve-update: Keep mtime stamp in the
 database itself
Thread-Topic: [OE-core] [PATCH 5/5] cve-update: Keep mtime stamp in the
 database itself
Thread-Index: AQHcTM6qoOx/HMnrh0mRh2uJmpNwFrTr/3yAgAAMKQCAAAMb8IAABTCAgAAAVMA=
Date: Mon, 10 Nov 2025 15:31:42 +0000
Message-ID: 
 <AS1PR10MB56971CEED209F3CDBFBBB23BFDCEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251103143157.315178-1-niko.mauno@vaisala.com>
 <20251103143157.315178-5-niko.mauno@vaisala.com>
 <1ccdd952a740a2d09774d825cc28bee20ff1525d.camel@linuxfoundation.org>
 <CAApg2=R=nyLt3hiqH5uEKqhp1XZ2WKkWrAH837ZqTGRTVSCWHw@mail.gmail.com>
 <AS1PR10MB5697F694A61CEF460D80F25EFDCEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAApg2=SyfWMcE2OAknOQJRx4uwysiz9bdWnNxR-pPfLb9SgR1g@mail.gmail.com>
In-Reply-To: 
 <CAApg2=SyfWMcE2OAknOQJRx4uwysiz9bdWnNxR-pPfLb9SgR1g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=c1caa614-520c-4ac7-9a53-0feac5c7b9cd;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-10T15:30:28Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PA4PR10MB5609:EE_
x-ms-office365-filtering-correlation-id: 0a11cbe7-2174-44f9-3bf2-08de206e4017
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Ykl1MlJJQU0vRktLa3ZucEwzMm01OVBhdWhtNjFKcW02Y0x6WTk1TmVQMXcy?=
 =?utf-8?B?MDRHSDlMcnpQZWk5d3NEUStIQm8yMnUwNVlnZlUrd01xZ1NNNEkvUTYvZkFX?=
 =?utf-8?B?Z1BZSWlqZGVvTWU4MmNnck91MGV4ZVcvMXo5RFFQTGhPaHhweEdZV2dHT3Ew?=
 =?utf-8?B?Q2t4VjVCbzExL2VndHhwWi9QMDFyK0xhaDdrOEpRM0pKVUx3RE5jcWYrT3Uv?=
 =?utf-8?B?N0d3VFlaTGkvdjBIVm9UMW5mMUVRd2tPL0NIZkRQMFNELzNkOXlMbXo0eHA1?=
 =?utf-8?B?UGY5UTUxcjRoVGNzd2NGMUJoNDVsbnFYVUora2JGWStXMHNBMFRQR3RWdk9k?=
 =?utf-8?B?aThpVU1sN2YyMkF2anJidVVpb1hXdS9oWmdsM3BIUktYOU5BZ294TzFqTytk?=
 =?utf-8?B?YWUveHUydndhSnJrNXNCUHVjNkNTcTNOSGpoeEJmY2VuVDNFbXhRM05xT0pn?=
 =?utf-8?B?T2QxdEZreEVrTUFId1QzNUhOb1hkM0Y2TlcrVmEzcmZwUnVTZWc1aWpXMjNN?=
 =?utf-8?B?TTYyZjF0MGh5VERyVmN5Z1Fva3A5UnAwL1gxMXNpSGhVRkIzRHdYdUMySXFU?=
 =?utf-8?B?L3Mwcy9jMGVjN1R2MFFTUDBLaVhXSEtvbVlCWitGQTNIYUZMYXJ6S0lRaW9k?=
 =?utf-8?B?VWJtbU9iUFpZTmQ2czNXQWdZSDdyYW1VOUZqellDdndrbWJyTzBBL1hJQnEy?=
 =?utf-8?B?Umh5OC9pcUNOVEJVTnZZVzVkOERSYXdqUjE5UVJQdG44bWJ2a0g2Z1hRUUtH?=
 =?utf-8?B?VjE3djhibW9FR3Brc0UvNDB0bWlTcXBtLzNzaTlrQTVIdSt4R3JqS21wdWg3?=
 =?utf-8?B?akJLWGc5bkZaa0FFZ0FsaWxZOFllOFRNSC9LdEZ5Q0czamZ2NytvbXlOeUtI?=
 =?utf-8?B?U0dTUUExakFuc2kxMmF3aVdzYTJyT3F5dFkzcjhnMEZlWTd6MnRkb0JuK1g4?=
 =?utf-8?B?UlpHQWxvSjlsWE9tdDNOUUpKUE1ScHRnL004dVZUYXBHV0taLzd4L0J4WmpM?=
 =?utf-8?B?Vkc1dnBMZUdyVHo5NWtsWmZuc05rRzdNM1dyTHE5R0l1SWMrUGRFYUoySzlz?=
 =?utf-8?B?QlY0Y2xxMnpHZDZ6b09aazQ1ZVpDQ0VHWnhoeE9vdmg5SU5aclkxWjNMK0Mw?=
 =?utf-8?B?SUFvYlNuQXg2SzM0N1N6dVJRSFVNRWZCdlZ5Z09MQVgzL3BCZEZidisycm96?=
 =?utf-8?B?dCswV2FIaW52Y3dzTkZac0RxZ01rR2lCd3g2N2RoUmpDcGdFNUFlc1VQN3RU?=
 =?utf-8?B?TmVtUUhHejZIVFFmck5nTVNwdy9Gc05UYm53clVOb0pWUng1bDFJWEpLTXJT?=
 =?utf-8?B?cndDejRvam1WbE9EUjJya1JsbUdvbldGN0Zadnl6RVhRRlNjbG1jdmpkcHZo?=
 =?utf-8?B?WUQvcUhKNWo1TWhpVG5sWFE3SFJFam1Hc1Q4S2hIdDJSVXBxN21ZTW8rK2F3?=
 =?utf-8?B?WEllVDQvN0krYmE0RFI0RUtaMGJLOXNNSE1HVmdHRllwOHdTWnViTG9wTGwr?=
 =?utf-8?B?L2xZdjZUU0NXTkQ5VXBxL1hhMzRkUFlaR3Q5QlhVYUZDaFFjaWxQUmhKQjZp?=
 =?utf-8?B?d3J3bXhPZGcwWUhwMm8xeXpXdkJyK2gralQrWW9MVWtZTk00N2FURkRtUHRN?=
 =?utf-8?B?REZEOUVxMDAxUXhLVzBWbFN0NURRNlpLdW5yM1diNDNUQktUQXVNWkJ0aXND?=
 =?utf-8?B?anBValZRbEQ2SUdPc3A0dmpweDlQTHVTc1NUM2ZxM29LeC9NbW5OMWlyNEdF?=
 =?utf-8?B?eGUzeVlEYkZWejFKdEltYkFNQS81NmoxWEdxMFZhSFhCKzN6aDh4N0ZKNkh6?=
 =?utf-8?B?L1B5VjIzZE9sZ0tTOC9IVThLN01yT2liMEcxVFVvMnQzVk1Nd3RDb3NvVGdH?=
 =?utf-8?B?TGFuZXJ0VUd4c0RmQWVnU2ZUekRBRjZ3d1NZVGF0RFB0RS90ZHpXMWJVcHNh?=
 =?utf-8?Q?hP4aI2IqGkA+uNUtbqo2VmnURFNOXbaZ?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U2lZUjR4NzB0c2FHNm50RHQzZXMyL3Rrd0ZTcXpCQ2lDa09DZFNxWTFKU1hK?=
 =?utf-8?B?UGdtRkFLc292bXZRVVJsaW4yWExqUmdtZEthRmc2SlpoVm9lb2xKdytUZ1Zy?=
 =?utf-8?B?MS93Z1lJYy9aVytLL3RVVG0wR2htbitXZDFKZlFHeGdOQ2F5NzZzTXNLUEV3?=
 =?utf-8?B?Q0xXbXdJdXRMVzROMDZxbGdwTytJVnVNWVo3SU8yMnlKOFNENEd1NVp2MkEy?=
 =?utf-8?B?cldUTkhtZ01HQi9zUEhGYklyMG9mRFNRbXdZb0tnaTdjb2UxV01QNm5aVllF?=
 =?utf-8?B?ejFPK0lvUTlOWEFXejhVdGhkU3pFcG9WRCtVbFJqRmxCVkNoaVZDNmpUakE1?=
 =?utf-8?B?cDROeGNJZFYrSWUrZEplZnZ0K2N0SDhzN09jTzBUS05hRTM1RVZSZ3Rhdkdp?=
 =?utf-8?B?RjBaR0JDOWxDd2lBLzIvYTlrODRRVDhselg1NUZOcldPSWlBN2R0c3lockJK?=
 =?utf-8?B?U2MrM0lWYkVDUTJyUjQwKzVKVURERVlGRzA1RXhCeGoycktwa3EwQTlOUzNY?=
 =?utf-8?B?SVVKUDZ3RXY5UmNQaFlzWkdxY2pDL29QMGpUUkdRZlhnd2N1Y2FEcXFzT1Bu?=
 =?utf-8?B?OWU0RE9VQWdtUktPZkozckNvTmZ0MTFNczVrVUJrTWh2VTVlejZCdXdEVklY?=
 =?utf-8?B?TFBhUVUvNkMyUDY3bVVyNTAzQmRVMEg4RnNML0FVem0yNDRqLzlqQ2hVRWdB?=
 =?utf-8?B?UjdZK1lwSm5zYWlmYzV0ZVlaekszaW53Q09laWYvTm9kcjVSUmszaWEzZ3Q4?=
 =?utf-8?B?TjNqWUc3SUlMZ1lHK2h5cHpkdzRndCtMTmpoQkp1VDU3ZWpWajgxRTNMRDM2?=
 =?utf-8?B?cDRIeG1vS1dxSWQwa3ZOT1RIeHJ0eUwyOXFDcG95dEpLZi9rZzQ5cFFraEtG?=
 =?utf-8?B?VldOc0Z2K25CMmExN1lWSk96NHVVN1VaWW8zWVVSbS9pRndxSlk2VGJaaDNq?=
 =?utf-8?B?a3Q4ZGJaNU53VkhkYm9xZ1NpanJMTFZQZnhEc1NLYVl1RVNuRVlwTERnTGh3?=
 =?utf-8?B?M1pkVDY1TXVya2ZNQURkakJuZGxMYXYzN3dVNkRYSXJya003MVdrd2ZsU0I4?=
 =?utf-8?B?QkpkZDhlbXdTMDJCeEZhb0I2S0E4TTFYZTAwVG9IR2IyRzlHNEhlWkhzMHln?=
 =?utf-8?B?USs5U3c1UnpvUHN2VkdNOG9hSGxQQ0I2TkNLRVlKRWtsQVp1bEZhUjNDVFZt?=
 =?utf-8?B?aGxFV0FPNENqeVJBZXN0dHlxbGI3dmtzZXQ3ZE90ZjJ3ZTFhUkJlVU1XajdD?=
 =?utf-8?B?RmRVQkZPcWNJQTFldDV1Uk1KWjhETVczYWxHRHBrMGJSZlpJVlh0UzhaWnJn?=
 =?utf-8?B?S3Z5WVVZWkZ5NEJvSWJ3TGhRd3d5TzV2UlFrV3lOVG1MYlV0TUZFOVN3bzd6?=
 =?utf-8?B?UE1xK0tlY1pqMWlCeUxzYysvRTY3VHhZZE5EQ3FDU1NzdzNVdFhtUm9BTHkr?=
 =?utf-8?B?ZXMyVmxLZnRHdzBaUm1yWFQrUy9sU0dvMlQxWnBoemQ5MU5tSFRxdGdHd0pV?=
 =?utf-8?B?TUx6dVduenFMRjVkdEZ6ajlST3BVOTVNT3EzKzQzRXR6NFV0WjNnOEFuSmRs?=
 =?utf-8?B?QTFJcTliVUJtd3VoQWVWQUFSQVRhVkZFMmhpcTlPVy93UG9HV0RMekJtakFY?=
 =?utf-8?B?VUd5Y0h0TVpldEdTTTg1UjlGSXFiTExvMmdWemYvVE1ZSWMvd0dNNUFPeFIz?=
 =?utf-8?B?ZkFDSEJiTmhNZUx2UEo4eVFHNWdiNEdQZWYzLzc5UCsxYisyUkgrSWpsZFJP?=
 =?utf-8?B?b1I1eCtINDUvRDlDay9FN250NWhPK3dZdzNJM200L0FBZVB4UGVZanF6SnJC?=
 =?utf-8?B?UXZ3Z2VkZnkyWXJPT0xjSk1TbFFSK2RoSkZaSWhEcU9ON0tYTXZ2NVg4WE4v?=
 =?utf-8?B?dGdETjI1cVk1dVFqUTZWYkl0U1E0VEV3cTR6U2YyRUFTSDRYWkFYS1lOeGJz?=
 =?utf-8?B?V1R1ckdTblNJZXZGZnVmVnBBQzRwVVU4aWZRSUtaMWFyZ3Ezd1VtYjIvMEZN?=
 =?utf-8?B?ekpDL2pMSW5sWlR5SENmL3NEL013QTlVSGFkYzRndEpINVBmMFhDc3hqbExQ?=
 =?utf-8?B?L3lPeWgxZEIyL0poaFJwT0JmQ2I2Y3BDeWxXZ2tiRDVLdXo1VVVtKy9Db3Ni?=
 =?utf-8?Q?A5tEA2e9ZYLsE+DtXdoedbrnV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a11cbe7-2174-44f9-3bf2-08de206e4017
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 15:31:42.6868
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FVW3oQx/JpbR9TXrwn0BYv9iYY4Pv8BddFlnuLwPftcBnC0scWY7jrbCzBCD7X56fobCzqr1JMvdqkwmVWHoUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5609
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 15:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226127

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFydGEgUnliY3p5bnNr
YSA8cnliY3p5bnNrYUBnbWFpbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgMTAsIDIw
MjUgMTY6MjkNCj4gVG86IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMxKSA8UGV0ZXIuTWFy
a29Ac2llbWVucy5jb20+DQo+IENjOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGlu
dXhmb3VuZGF0aW9uLm9yZz47DQo+IG5pa28ubWF1bm9AdmFpc2FsYS5jb207IG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7DQo+IHJvc3MuYnVydG9uQGFybS5jb20NCj4g
U3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggNS81XSBjdmUtdXBkYXRlOiBLZWVwIG10aW1l
IHN0YW1wIGluIHRoZQ0KPiBkYXRhYmFzZSBpdHNlbGYNCj4gDQo+IA0KPiANCj4gT24gTW9uLCBO
b3YgMTAsIDIwMjUgYXQgNDoxOOKAr1BNIE1hcmtvLCBQZXRlciA8UGV0ZXIuTWFya29Ac2llbWVu
cy5jb20NCj4gPG1haWx0bzpQZXRlci5NYXJrb0BzaWVtZW5zLmNvbT4gPiB3cm90ZToNCj4gDQo+
IA0KPiANCj4gDQo+IAk+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IAk+IEZyb206IE1h
cnRhIFJ5YmN6eW5za2EgPHJ5YmN6eW5za2FAZ21haWwuY29tDQo+IDxtYWlsdG86cnliY3p5bnNr
YUBnbWFpbC5jb20+ID4NCj4gCT4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciAxMCwgMjAyNSAxNjow
MA0KPiAJPiBUbzogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlv
bi5vcmcNCj4gPG1haWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPiA+DQo+
IAk+IENjOiBuaWtvLm1hdW5vQHZhaXNhbGEuY29tIDxtYWlsdG86bmlrby5tYXVub0B2YWlzYWxh
LmNvbT4gOw0KPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxtYWls
dG86b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IDsNCj4gCT4g
cm9zcy5idXJ0b25AYXJtLmNvbSA8bWFpbHRvOnJvc3MuYnVydG9uQGFybS5jb20+IDsgTWFya28s
IFBldGVyDQo+IChGVCBEIEVVIFNLIEJGUzEpDQo+IAk+IDxQZXRlci5NYXJrb0BzaWVtZW5zLmNv
bSA8bWFpbHRvOlBldGVyLk1hcmtvQHNpZW1lbnMuY29tPiA+DQo+IAk+IFN1YmplY3Q6IFJlOiBb
T0UtY29yZV0gW1BBVENIIDUvNV0gY3ZlLXVwZGF0ZTogS2VlcCBtdGltZSBzdGFtcCBpbg0KPiB0
aGUNCj4gCT4gZGF0YWJhc2UgaXRzZWxmDQo+IAk+DQo+IAk+DQo+IAk+DQo+IAk+IE9uIE1vbiwg
Tm92IDEwLCAyMDI1IGF0IDM6MTbigK9QTSBSaWNoYXJkIFB1cmRpZQ0KPiAJPiA8cmljaGFyZC5w
dXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZw0KPiA8bWFpbHRvOnJpY2hhcmQucHVyZGllQGxpbnV4
Zm91bmRhdGlvbi5vcmc+DQo+IDxtYWlsdG86cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9u
Lm9yZw0KPiA8bWFpbHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+ID4NCj4g
CT4gPiB3cm90ZToNCj4gCT4NCj4gCT4NCj4gCT4gICAgICAgT24gTW9uLCAyMDI1LTExLTAzIGF0
IDE0OjMxICswMDAwLCBOaWtvIE1hdW5vIHZpYQ0KPiAJPiBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
IDxodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCj4gPGh0dHA6Ly9saXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiAgd3JvdGU6DQo+IAk+ICAgICAgID4gVGhpcyBzaG91bGQgaGVscCB0byBhdm9p
ZCBwcm9ibGVtcyB0aGF0IHdpbGwgb2NjdXIgaWYgdGhlDQo+IG1vZGlmaWNhdGlvbg0KPiAJPiAg
ICAgICA+IHRpbWUgb2YgZGF0YWJhc2UgZmlsZSBpdHNlbGYgaXMgYWx0ZXJlZCBlLmcuIGJ5IHVu
YXNzb2NpYXRlZA0KPiAJPiAgICAgICA+IHByb2Nlc3MoZXMpIG9uIHRoZSBmaWxlIHN5c3RlbSB3
aGljaCBob3N0cyB0aGUgZGF0YWJhc2UgZmlsZS4NCj4gCT4gICAgICAgPg0KPiAJPiAgICAgICA+
IFNpbmNlIHRoaXMgY2hhbmdlIHVwZGF0ZXMgdGhlIGRhdGFiYXNlIHN0cnVjdHVyZSBieSBhZGRp
bmcgYSBuZXcNCj4gdGFibGUsDQo+IAk+ICAgICAgID4gYnVtcCB0aGUgJ21pbm9yJyB2ZXJzaW9u
IG51bWJlciBpbiBkYXRhYmFzZSBmaWxlIG5hbWVzIHRvIGVuZm9yY2UNCj4gZnVsbA0KPiAJPiAg
ICAgICA+IGRhdGFiYXNlIGZldGNoLiBUaGlzIHNob3VsZCBhbHNvIGlyb24gb3V0IGUuZy4gc2l0
dWF0aW9uIHdoZXJlIHRoZQ0KPiAJPiAgICAgICA+IGRhdGFiYXNlIG1pZ2h0IGhhdmUgaW5jb25z
cGljdW91c2x5IG9taXR0ZWQgZW50cmllcyBkdWUgdG8gd2F5DQo+IGluDQo+IAk+IHdoaWNoDQo+
IAk+ICAgICAgID4gdGhlIG10aW1lIG9mIGRhdGFiYXNlIGZpbGUgaXRzZWxmIHdhcyByZWxpZWQg
dXBvbi4NCj4gCT4gICAgICAgPg0KPiAJPiAgICAgICA+IFNpZ25lZC1vZmYtYnk6IE5pa28gTWF1
bm8gPG5pa28ubWF1bm9AdmFpc2FsYS5jb20NCj4gPG1haWx0bzpuaWtvLm1hdW5vQHZhaXNhbGEu
Y29tPg0KPiAJPiA8bWFpbHRvOm5pa28ubWF1bm9AdmFpc2FsYS5jb20gPG1haWx0bzpuaWtvLm1h
dW5vQHZhaXNhbGEuY29tPiA+DQo+ID4NCj4gCT4gICAgICAgPiAtLS0NCj4gCT4gICAgICAgPiAg
bWV0YS9jbGFzc2VzL2N2ZS1jaGVjay5iYmNsYXNzICAgICAgICAgICAgICAgIHwgIDIgKy0NCj4g
CT4gICAgICAgPiAgLi4uL3JlY2lwZXMtY29yZS9tZXRhL2N2ZS11cGRhdGUtZGItbmF0aXZlLmJi
IDxodHRwOi8vY3ZlLXVwZGF0ZS0NCj4gZGItbmF0aXZlLmJiPiAgPGh0dHA6Ly9jdmUtdXBkYXRl
LWRiLQ0KPiAJPiBuYXRpdmUuYmIgPGh0dHA6Ly9uYXRpdmUuYmI+ID4gIHwgIDMgKw0KPiAJPiAg
ICAgICA+ICBtZXRhL3JlY2lwZXMtY29yZS9tZXRhL2N2ZS11cGRhdGUtbmF0aXZlLmluYyAgfCA1
OQ0KPiArKysrKysrKysrKystLS0tLS0tDQo+IAk+ICAgICAgID4gIC4uLi9tZXRhL2N2ZS11cGRh
dGUtbnZkMi1uYXRpdmUuYmIgPGh0dHA6Ly9jdmUtdXBkYXRlLW52ZDItDQo+IG5hdGl2ZS5iYj4g
IDxodHRwOi8vY3ZlLXVwZGF0ZS1udmQyLW5hdGl2ZS5iYj4NCj4gCT4gfCAgMyArDQo+IAk+ICAg
ICAgID4gIDQgZmlsZXMgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0p
DQo+IAk+DQo+IAk+ICAgICAgIEkgYW0gYSBiaXQgd29ycmllZCBhYm91dCB0aGlzIHNpbmNlIGl0
IHRha2VzIHdoYXQgaXMgYSBzaW1wbGUgbXRpbWUNCj4gCT4gICAgICAgY29tcGFyaXNvbiBhbmQg
bWVhbnMgdGhhdCB0byBjaGVjayB0aGUgZGF0YWJhc2UgeW91IG5vdyBoYXZlIHRvDQo+IGxvY2sN
Cj4gCT4gICAgICAgYW5kIG9wZW4gaXQgd2hpY2ggaXMgY29tcGFyYXRpdmVseSBleHBlbnNpdmUu
DQo+IAk+DQo+IAk+ICAgICAgIFdoYXQga2luZCBvZiAidW5hc3NvY2lhdGVkIHByb2Nlc3NlcyIg
YXJlIHVwZGF0aW5nIHRoZSBtdGltZT8NCj4gCT4NCj4gCT4NCj4gCT4NCj4gCT4NCj4gCT4gSSBz
ZWNvbmQgUmljaGFyZCBoZXJlLiBJZiB3ZSB3b3VsZCByZWFsbHkgd2FudCB0byBrZWVwIHRoZSBk
YXRlDQo+IHNvbWV3aGVyZSBlbHNlDQo+IAk+IHRoYW4gdGhlIGZpbGUNCj4gCT4gdGltZXN0YW1w
LCB3ZSBjb3VsZCBjcmVhdGUgYSBzaW1wbGUgZmlsZSB0aGF0IHN0b3JlcyBpdCwgd2hhdCBpcyB3
YXkNCj4gc2ltcGxlciBhbmQNCj4gCT4gZG9lc24ndCByZXF1aXJlDQo+IAk+IHRvIG9wZW4gdGhl
IGRhdGFiYXNlIGp1c3QgdG8gc2VlIGlmIHlvdSB3YW50IHRvIHVwZGF0ZSBpdC4NCj4gCT4NCj4g
CT4gSSBzZWNvbmQgUmljaGFyZCdzIHF1ZXN0aW9uOiBpbiB3aGF0IGtpbmQgb2YgYSBzaXR1YXRp
b24gaGF2ZSB5b3Ugc2VlbiBhbg0KPiBpc3N1ZT8NCj4gDQo+IAlUaGUgaXNzdWUgaXMgb24gWW9j
dG8gQUIuDQo+IAlJdCBoYXMgbm90IHVwZGF0ZWQgc3RhdGlzdGljcyBmb3IgbW9yZSB0aGFuIDUg
bW9udGhzIG5vdy4NCj4gDQo+IAlMb29raW5nIGF0IHRoZSBsb2dzLCBzb21ldGhpbmcgaXMgdXBk
YXRpbmcgbXRpbWUgdmVyeSBmcmVxdWVudGx5Li4uDQo+IAlJIGRvbid0IGtub3cgdGhlIEFCIGlu
ZnJhc3RydWN0dXJlLCBidXQgaXQgbG9va3MgbGlrZSB0aGVyZSBpcyBzb21lIGZpbGVzeXN0ZW0N
Cj4gY3Jhd2xlciwgbWF5YmUgYmFja3VwIG9mIHN5bmMgcHJvY2Vzcy4NCj4gCU9yIHRoZSBuZnMg
bW91bnQgaXMgcGxhaW4gYnJva2VuIHRoZXJlPw0KPiANCj4gCUV4YW1wbGUgaXMgaGVyZToNCj4g
CWh0dHBzOi8vdmFsa3lyaWUueW9jdG8uaW8vcHViL25vbi1yZWxlYXNlLzIwMjUxMTA5LQ0KPiA0
My90ZXN0cmVzdWx0cy9tZXRyaWNzL2RiLXVwZGF0ZS8NCj4gCU5PVEU6IEN1cnJlbnQgdGltZTog
U3VuIE5vdiAgOSAwNzoxNzo1MiAyMDI1OyBEQiB0aW1lOiBTdW4gTm92ICA5DQo+IDA3OjE0OjUx
IDIwMjUNCj4gCU5PVEU6IEN1cnJlbnQgdGltZTogU3VuIE5vdiAgOSAwNzoxOToyMiAyMDI1OyBE
QiB0aW1lOiBTdW4gTm92ICA5DQo+IDA3OjE4OjE0IDIwMjUNCj4gCTIgam9icyBhcmUgOTAgc2Vj
b25kcyBmcm9tIGVhY2ggb3RoZXIsIGJ1dCBzb21ldGhpbmcgbWFuYWdlZCB0byBjaGFuZ2UNCj4g
dGhlIHRpbWVzdGFtcCBpbiBiZXR3ZWVuIGFuZCBvbmx5IDMuNSBtaW51dGVzIGFmdGVyIGxhc3Qg
Y2hhbmdlIQ0KPiANCj4gDQo+IA0KPiANCj4gVGhlIGF1dG9idWlsZGVyIHdhcyBleHBlY3RlZCB0
byBmb3JjZSB0aGUgY29tcGxldGUgZG93bmxvYWQgZXZlcnkgZGF5Lg0KPiBTb21ldGhpbmcNCj4g
aGFzIGNoYW5nZWQ/IFRoZSBjb2RlIGRvZXMgb3BlbiB0aGUgZGF0YWJhc2UgYWZ0ZXIgY2hlY2tp
bmcgdGhlIHRpbWVzdGFtcCwgc28NCj4gZnJlcXVlbnQgam9icyBjb3VsZG4ndCBjYXVzZSBpdC4g
SSB0aGluayB0aGF0IG1hY2hpbmUgcmVxdWlyZXMgc29tZSBtb25pdG9yaW5nIHRvDQo+IHNlZQ0K
PiB3aGF0IGlzIGFjdHVhbGx5IGNoYW5naW5nIHRob3NlIHRpbWVzdGFtcHMsIGJlY2F1c2Ugd2Ug
ZG8gbm90IGtub3cgd2hhdCBpdCBpcw0KPiBhbHNvDQo+IGNoYW5naW5nLg0KDQoxIGRheSBkb2Vz
bid0IGJlYXQgdGhlIDMuNSBtaW51dGVzIGNyYXdsZXIuLi4NClRoaXMgaXMgcHJvYmFibHkgQUIg
aXNzdWUgb25seS4NCg0KQW5kIG1heWJlIG90aGVyIGV4YW1wbGU6DQpodHRwczovL3ZhbGt5cmll
LnlvY3RvLmlvL3B1Yi9ub24tcmVsZWFzZS8yMDI1MTExMC00NS90ZXN0cmVzdWx0cy9tZXRyaWNz
L2RiLXVwZGF0ZS8NCk5PVEU6IEN1cnJlbnQgdGltZTogTW9uIE5vdiAxMCAwNzoxNzo0NyAyMDI1
OyBEQiB0aW1lOiBNb24gTm92IDEwIDA3OjE2OjMzIDIwMjUNCk5PVEU6IEN1cnJlbnQgdGltZTog
TW9uIE5vdiAxMCAwNzoxOToxNyAyMDI1OyBEQiB0aW1lOiBNb24gTm92IDEwIDA3OjE2OjMzIDIw
MjUNCg0KVGhpcyBzaG93cyB0aGF0IHRoZSBmaXJzdCBqb2IgZG9lcyBub3QgbW9kaWZ5IGl0IChh
dCBsZWFzdCBub3QgaW4gdGhlIGZpcnN0IDkwIHNlY29uZHMpLg0KSSBndWVzcyBpdCBmaXQgdGhl
IDMuNSBtaW51dGVzIHdpbmRvdyBvZiBvcHBvcnR1bml0eS4NCkFuZCBteSBsb2NhbCBidWlsZCBk
b2VzIG5vdCBzaG93IGFueSB0aW1lc3RhbXAgbWFuaXB1bGF0aW9uIGVpdGhlci4NCg0KUGV0ZXIN
Cg0KPiANCj4gSSBoYXZlbid0IHNlZW4gc3VjaCBhbiBlZmZlY3Qgb24gbXkgc3lzdGVtcy4NCj4g
DQo+IEtpbmQgcmVnYXJkcywNCj4gTWFydGENCg0K

