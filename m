Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 486ADC3ABD9
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 09:27:19 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.50])
 by mx.groups.io with SMTP id smtpd.web11.98518.1747214835220628683
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 02:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=yPXE61Tg;
 spf=pass (domain: siemens.com, ip: 52.101.66.50, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kI12mMZd+L7D/bYPxwFFujE+/72ECOLREo+U97GFO0hO/L4OCbl4cUfhO1prN994m1Vll7GMunKq6FO9hkZ4XF2vd7GwN+tdPiOiNFFd4IO1KGTm+mUI5kLOB9xLnXNKjVsvVfZnWDEXgF+jpzCs927kZvJBKIrUQqdG6A1irfGnymAuM1ZKbef/OkjZv/PQasjwCOL7j6Nc5lpfgEG1Dvm3fti/3sOZj9Rg/O/6BIFztE9pzlQ6qbP0wiYCijDnydh81371RsuLXVYUaXfAXFqJcgLCcupuE0IQd64yNkvUuxFO17sN/7uq2hYl992XGSxZ714OHtrBJDj6lwmlsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhXkeoxoZtaky6jFVUzqtd4QqiXLp/+0h8gwxrUhp+o=;
 b=srDRLwT3N5QYA4HLHIlCBIuJk+ppeoGrXhsIMIbs+nAjf22/J9zPprywRvhAgkJ/y397BHMfjz44iyibFHvTQFsQyir6nE5U9IEBX9aW+0M51oP27dHODflr1GhdtZPUStHNChNVuOnqBrrbCSP/k6J9c1DkYdbkh6Dvvmoijjb5ykX8CwG+ocbjlwgMlQdSslKYHnbJmLeFRPG9TPcb4kl2TE5hO4srP9Xx8yAIkogYtkA0P7YjuzZKznmxtDxpsIt8fy3omtpyII9LDsyJw/r3ch6H+ZBviIv9xIh6rLGHnefHJe/bz8ihucLTiau2phb7NxGRwhgosCKNP6bbaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhXkeoxoZtaky6jFVUzqtd4QqiXLp/+0h8gwxrUhp+o=;
 b=yPXE61TgaA0lEj0x907x4D9aO5DsBhf9BgWdHGhsaLQjaDzlC0+xKmMpZNp3Dmc8LrBfUAn8fykWUoAwykSU0Rd1+VPvuPCLX9JXwqjuYVI86wba2hqruV7zq/bhaI+jXXerJhQg1wOs0F5RutT/U/OyVN7uP2ETxsWClYyOFDIwsUnsKAOo04KqJC6Xuf+gVU/L3UGjFJ7OIa30UjZpLgCQ5K3ZM7tsH4ITxhXjgpkSoOviPQq+R72QLuQl8o8du1je4t7A/Or/AxNb2LaP2ES/SZYJ2lc3F3hQUFPh6iEWfdi4nFtdu6h/G0XblPXSw8kiK63pgUk88tBUVXA23g==
Received: from VI1PR10MB3535.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:13e::21)
 by VI0PR10MB8668.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:232::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Wed, 14 May
 2025 09:27:11 +0000
Received: from VI1PR10MB3535.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1bda:8069:a646:6213]) by VI1PR10MB3535.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1bda:8069:a646:6213%5]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 09:27:11 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 00/22] FIT image improvements
Thread-Topic: [OE-core] [PATCH v2 00/22] FIT image improvements
Thread-Index: AQHbxE9tvLgYyghl9kOXi4L2p+dRg7PRvysAgAAc8gA=
Date: Wed, 14 May 2025 09:27:11 +0000
Message-ID: <e25aae376ab41b430239aaf82bd88ee1b17f49ce.camel@siemens.com>
References: <20250513213834.87830-1-adrian.freihofer@siemens.com>
	 <D9VPRGJ8731P.9EAZ98WZ431T@bootlin.com>
In-Reply-To: <D9VPRGJ8731P.9EAZ98WZ431T@bootlin.com>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR10MB3535:EE_|VI0PR10MB8668:EE_
x-ms-office365-filtering-correlation-id: c39830b5-4a9a-4f97-b319-08dd92c98180
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?T3VqZVA2Y0xCQjN3d05GUGhocWhJWUxHQWUvU25uZHdyWkZWTS9LQ08rS0Za?=
 =?utf-8?B?UzBzT1NkNmRGaGd1NllzaXUwZlVKR2NvTTZOM3laSWttaUJ5dThpTVRVbnpR?=
 =?utf-8?B?VlFQU3B0U1lqVEJVZ3JSMWZsZElwdUJqRlBwTW03aGgzQ1N5UGQzY09kRWg0?=
 =?utf-8?B?ay80WUZvOWg1Si9ZSGpONU9mTlRXNXFXellQdGxtckRFS2ROeG9wMWlKSUps?=
 =?utf-8?B?eU1nazZSSnRKZW1rRFNDdDgxUDNZK0xSekN1TTVRQy9NVmR5d2RNdUc5QlN4?=
 =?utf-8?B?SlFGemVzaDlIWjJIUnNvR0tjWUNNdmIzS3VwanhhaXQyNFArQmVXTnlXaUtO?=
 =?utf-8?B?UFhqUG1CeG1hVjJqRmdqSXhna3FRdThqN1JocVE1S21JWXZSSWNzcTZHdlRO?=
 =?utf-8?B?Y2cyZms4YlcveGJQZlY5UWphSWdWUkl3UHBtaGdKVXpqa2drdmZFbXNHWEJj?=
 =?utf-8?B?d0dYZHVnT2xNVlgvZ1lnODRodVltOVdVSUtieVdCWEFtOXdTYmV2cXRid1ZI?=
 =?utf-8?B?c0ZreUhHRUJ3bmZwdis3Q0tVcU5xMDlFVHJrek9jeWNUUk9XbDlLY1U4NDV3?=
 =?utf-8?B?c1VqRnhOKzJwZE40bW02MndtemlFTWllRDhuN2NtUFY5cGVkODB1OTlRdFBu?=
 =?utf-8?B?YWw3YkNBVmpUTGJXNmFJUzRvZUFMLzJ3ZC9uUloyMFlHczlRS1JMUndVWjlO?=
 =?utf-8?B?U2pOdUl3K25VSHZNbkVtdlBSYmtJMTF2b1VvK05QR1AxR2VGcUFOV0dDdnpC?=
 =?utf-8?B?SFNaY1ZzWVVYU1hDSVQyY1dJTTZEZm1wSHRyRHdxQ3lNZ0dTU3NoYnN1NzVK?=
 =?utf-8?B?S3Q5aFp5WWxMYmRoMUdaVlRHaDVQWGtHUTVLdVdLL09uOWErTkxxZ2Y3MExX?=
 =?utf-8?B?Vk5MRDdxVjlCM1hWQU5mVFEvTk5NdmNDRFd3dVJKVVdRdzRyT3VzVVZjUnZQ?=
 =?utf-8?B?Ly9aQjMzYXlaK0JXb0lkVzBWanducXhLVnN5TlFqdFB6L1ZKbXQwdWNDR2th?=
 =?utf-8?B?Uy9iWGlzeHYyMzlWL05RN2pPWUdTd1lSeU80TjNxTHloaXpEVjUvWWFsNzFV?=
 =?utf-8?B?OXB2Y3puMWFJbXltMFhoRDRLaGN2ZHVCYzRBWnc2eml0b1JUejU5TWtSSWI5?=
 =?utf-8?B?S1gyKzR6TFo5SmpkTSt1VmVBblFBbHVDNnZES2Jyc1BjT2Y4SGl1bUZpWTNH?=
 =?utf-8?B?V2xoNVpyUVl4eVVoOXQyTnMxKzN2RitaYnY2SmlMbW11RXp1eUtQN0ZCUU0v?=
 =?utf-8?B?aVR5T21XQ3ByS1RFaFd4TkJjQzc4cnBaY0c4c0hqMGNPM2FzLzBCKzRkRlo1?=
 =?utf-8?B?NFRScCtzbmxYNGRRd2R6ZllkeDZ0bENDZnpsdDdWWC90OFVCZTdQYnZ5Mity?=
 =?utf-8?B?NFVFZWh1VzljQUw2OGNPMm03ZktqQnpObnM4NkFIT3hVMDh3VVl6Z0JqUUdy?=
 =?utf-8?B?bUoxZ3V4REEwcVUwZFpqK0J3ZDVsVkFqMnpBV2xOVzZzNSs1NWVVMXNIV3NR?=
 =?utf-8?B?YjlLTmYvSDFidmhWUFJHL0w4Y3lGdXJpd25VNXdDR01sMmZQMEhXdzNJbkhX?=
 =?utf-8?B?eW1rMlB6M3htU0piaVJRckJZVmE3ak9OY2RpVTgrTlkxTWtoRlQyVWdlSmls?=
 =?utf-8?B?ZmFtSHc5dkdCOTEvSFZmbFVhVTAxd0ttTDNvMk9kRHg0dGhWUjBxaGdvd2VY?=
 =?utf-8?B?Y0Iza1JiQ2xaRUdvVzdMbFpnVjZpd3ZGUkVJWFBUMTB4VzFZQ1J0Y0JYa0tT?=
 =?utf-8?B?cjluVm5wWlFrNnZYaGFsMTdLTzZ6OXhwSWpqbFlqMkdpMzdPQWZEQXY1N24z?=
 =?utf-8?B?dmNqeXlzUXFOaXlkUURYNlpLQ2t6TkxPenlnSHdQWk1qQzJacHJlUGhxVW55?=
 =?utf-8?B?QXIzbTN6bVE2Q1l1a0l2cTc5ci9nc0pWNmlYSnJERFkwK21YODE1V3EyeDYr?=
 =?utf-8?Q?vfJN+tt3pO0=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB3535.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eUltM29DZlFlNVNRZVNrbHlpWS9iZzhzbHVpaUdlZGpRWmp4NTIwbTBCZU55?=
 =?utf-8?B?NU1BQXVITFRraWtwVnZnc0lVWmZ2S2dOVEtuZFRvUEtXa0o1M1h6TDV5aTAy?=
 =?utf-8?B?SnhrNmJHREIzK1orT2lPVE1RM2JyTHdQVTlwcXNNa25KN1NYTENCQnhYWGhn?=
 =?utf-8?B?M3Zod1E2bWVjcXVaQU90dmx0enExQU1CTFNuWlQxUC9XNmRwNi9UVEVJRmZ2?=
 =?utf-8?B?azJUY1JtTUxjTE5LYjRTRHpWV2hGTG1vMnRBVkovVFpCeUd2UEoxYlplcUM2?=
 =?utf-8?B?S2ViL05VOUNoaTNUYzJ0c3gxSnBoa2NwM3pNVVVrQktSVkFsQzkxUDlmMXpK?=
 =?utf-8?B?RDFQTHlNN1BYc3lWN2ZueGRzVjNKdjQ5TzBUWFQ2UmM2TUtsdGptem1xQlUr?=
 =?utf-8?B?Y2w3dElHNWhtWGlDL0xkRWs0bU1qRnBKSnh5d0lqWk11VXFDYnV5NERXVDRE?=
 =?utf-8?B?MmZQT1d6dnVRMzlML2RMdnJvVjI3WTdxaFEwb1lDLzA2YWhlYm11bXg3UUxh?=
 =?utf-8?B?NE8xZ2NuU3I4RElvOHlrVFNUQU1MNnRQOHVIOWNVdXU5L3VnMDlNYlRCbzZs?=
 =?utf-8?B?NVRoelQ3ekJZcmRKLzZEVksxNklhcXJ3NDUwbW5leWxCdk4yb05kRE5xQ29S?=
 =?utf-8?B?U2NOeU15MXBVaGFXZUNMc0NyUGpxVEFYQ2NKNWVrU0liUjRsNVNlZkJyN1pj?=
 =?utf-8?B?VUFMdS94WGFBMUNOQno4Yy9aTUszK2ZvUzR5T3p6Ulp6UnNwZDlndnI2T3dl?=
 =?utf-8?B?WjY2UU40NFpTY2xldyt0eWF0WjRGdHl0cEwvTmRuWEFBczdwcVRiVmdUMUtv?=
 =?utf-8?B?VWxpL1dYb2VKTTQxYlFYZ3ZMSkdCVXJYRDZVazd1bEt2c2xWb1VzQTJaeGNa?=
 =?utf-8?B?UGduKzNlNTIzQ09XbGpDUk00czVwSTFBVE93NkpOUXMwQUk1SGNZd1dzQUUy?=
 =?utf-8?B?Wi9jd0RXdTZDM1diclYvSjh5Tkk3RmR4S2dMbkd0WjVzUDNyelNxZ0t5M2FB?=
 =?utf-8?B?UkowVDNXaU9CMnFicEFyTUM1RkFGb3FReVFTcEV6K0M1dlcrMENMU2NlL2lE?=
 =?utf-8?B?OE9hNk9ydG9OTzBEUXJodTh0ZFYvZDU0WUtjZEZZMDRsd3pFMWszeVk2QW5y?=
 =?utf-8?B?Q2hzUEFUN0wyRytNSUZQc0JWd05DRE9SazVjMjRKY01sckdrTUdjQUxIcHl1?=
 =?utf-8?B?NmliQWVMR0U5QTdreE8xc083RFU4ekQ5NURrelovMlR3OVJGMlpHRmtNWGJ0?=
 =?utf-8?B?bmR1TWVQMHZLNVNmNDVFRGdkeXllcWYraHFwb08vTzdmYWlSeDNRSEtwWHJX?=
 =?utf-8?B?VHErUVFraXh3K3RPN2FlR09QZlVwb014VEo3TGlrc254VFd5TGhqL05wM0lN?=
 =?utf-8?B?Mm1IUnV4d0FLRy9tOE05cTRSYjR1RStmYTVBOXU3TnR2RWFXZlU5S1dvNXha?=
 =?utf-8?B?U3FlaUZ3cXIvZE5RaGJ5U3N1SWlkZXZRcS9RODAra2lDK1NQZjA0a3dzeC9O?=
 =?utf-8?B?Zld4SXg5cndiNzF4a3ZpbWpCZVBRaERQQVhaU2h1N3NhM04vM25aaGg3TFF5?=
 =?utf-8?B?U0ppWGxEMTI3eGpaWnNZQnMwRm9mQm5QNzNoZi9uczhybmlmVkU0SCtmUGxu?=
 =?utf-8?B?TlZOREJIazRXQVU1ZXlLbnZhYmUxTjFCRDdDM3Jyb1JSQ1dGYmxaVDlXZEpW?=
 =?utf-8?B?MjBRMmNHNUFXek1nMzluOEVLaUJ5dDM1Y1dLYmRXL09uMFptNXdtU1J1SjJP?=
 =?utf-8?B?UnFURzJSb0RzdjYxNFhWQk9LNkJzckZZQlhnQmFFM3Z6djFGZE4vTk5Mampq?=
 =?utf-8?B?YkxRM1VINktwQ0Q1WitEU0FHTFVOZzU3WDA0cFRsUllUYUJEVUVKQnVnR1JP?=
 =?utf-8?B?V0RaUTZyUEJlTkxDeGNQeXJhVkwxTXlkRy95Kzg0LzFRWXFFdm9JbEtxeHR5?=
 =?utf-8?B?dWtGZjM2L21zTWc0R3UzNmQvVUpqMTM5aDZHNm9LRHF0cnU2Zis5NjloOHRG?=
 =?utf-8?B?WVgzZWVhVElEdnQvK3JDYkxzQ0lvSTR4S3laT0tCZjRaZ3RzR0x2OHFHdzN6?=
 =?utf-8?B?TlpwUytKTWZNbklONmZqV1Fmb1M2S0JSOHd4d3F4RVBZSUNRczE3bjN6MHZX?=
 =?utf-8?B?MGVRVjRqc3JFK3RLWXpkT3RnclhUUnBRREZCRGEvMTVwOGJKbFQvMno4L1NM?=
 =?utf-8?B?OVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C28B3FE5D56E44AAA27C690428D8A61@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR10MB3535.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c39830b5-4a9a-4f97-b319-08dd92c98180
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 09:27:11.4850
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /+c2cWRrae8aMpZu1ErWdClT6CdKySCJGFh647/uC/sMzvBv/eDYYHs2/+nXhByNULOyEJcHVxMb39SAw86ptfIulsiPCia5U7Sx52hdsPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8668
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 09:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216489

T24gV2VkLCAyMDI1LTA1LTE0IGF0IDA5OjQzICswMjAwLCBNYXRoaWV1IER1Ym9pcy1CcmlhbmQg
d3JvdGU6Cj4gT24gVHVlIE1heSAxMywgMjAyNSBhdCAxMTozNiBQTSBDRVNULCBBZHJpYW4gRnJl
aWhvZmVyIHZpYQo+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6Cj4gPiBGcm9tOiBBZHJp
YW4gRnJlaWhvZmVyIDxhZHJpYW4uZnJlaWhvZmVyQHNpZW1lbnMuY29tPgo+ID4gCj4gPiBUaGlz
IHBhdGNoIHNlcmllcyByZS13cml0ZXMgdGhlIEZJVCBpbWFnZSByZWxhdGVkIGNvZGUuIFRoZSBn
b2FsIGlzCj4gPiB0bwo+ID4gZml4IFtZT0NUTyAjMTI5MTJdIHdoaWNoIGlzIGEgbG9uZyBzdGFu
ZGluZyBpc3N1ZS4KPiA+IAo+IAo+IEhpIEFkcmlhbiwKPiAKPiBUaGFua3MgZm9yIHlvdXIgcGF0
Y2hlcy4KPiAKPiBJIGJlbGlldmUgaXQgYnJlYWtzIHRoZSBidWlsZCBvbiB0aGUgYXV0b2J1aWxk
ZXIuIE1heWJlIG9ubHkgb24geDg2Pwo+IAo+IEVSUk9SOiBsaWIzMi1saW51eC15b2N0by1maXRp
bWFnZS02LjEyLjIzK2dpdC1yMCBkb19jb21waWxlOiBFcnJvcgo+IGV4ZWN1dGluZyBhIHB5dGhv
biBmdW5jdGlvbiBpbiBleGVjX2Z1bmNfcHl0aG9uKCkgYXV0b2dlbmVyYXRlZDoKPiAuLi4KPiBG
aWxlOiAnL3Nydi9wb2t5YnVpbGQveW9jdG8td29ya2VyL3FlbXV4ODYtd29ybGQvYnVpbGQvbWV0
YS9jbGFzc2VzLQo+IHJlY2lwZS9rZXJuZWwtZml0LWltYWdlLmJiY2xhc3MnLCBsaW5lbm86IDU3
LCBmdW5jdGlvbjogZG9fY29tcGlsZQo+IC4uLgo+IEV4Y2VwdGlvbjogRmlsZU5vdEZvdW5kRXJy
b3I6IFtFcnJubyAyXSBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Ogo+ICcvc3J2L3Bva3lidWls
ZC95b2N0by13b3JrZXIvcWVtdXg4Ni0KPiB3b3JsZC9idWlsZC9idWlsZC90bXAvd29yay9xZW11
eDg2XzY0LXBva3ltbGxpYjMyLWxpbnV4L2xpYjMyLWxpbnV4LQo+IHlvY3RvLWZpdGltYWdlLzYu
MTIuMjMrZ2l0L2xpYjMyLXJlY2lwZS1zeXNyb290L3N5c3Jvb3QtCj4gb25seS9saW51eC5iaW4n
Cj4gCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllL2FwaS92
Mi9sb2dzLzIzNzYzNDkvcmF3X2lubGluZQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9q
ZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzE3L2J1aWxkcy8xNDg2Cj4gCj4gClRoZSBmYWls
aW5nIGJ1aWxkIGlzIHRoZW4gc3RpbGwgYml0YmFrZSB3b3JsZCBmb3IgbXVsdGlsaWIgeDg2LTMy
LiBJCndhcyBob3BpbmcgdGhhdCB0aGlzIGlzIGZpeGVkIG5vdyB3aXRoIHRoZSBsaW5lIGFkZGVk
IHRvCm11bHRpbGliLmJiY2xhc3MgYnkgdGhpcyBwYXRjaApodHRwczovL3BhdGNod29yay55b2N0
b3Byb2plY3Qub3JnL3Byb2plY3Qvb2UtY29yZS9wYXRjaC8yMDI1MDUxMzIxMzgzNC44NzgzMC0x
MS1hZHJpYW4uZnJlaWhvZmVyQHNpZW1lbnMuY29tLwoKZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nl
cy9tdWx0aWxpYi5iYmNsYXNzCmIvbWV0YS9jbGFzc2VzL211bHRpbGliLmJiY2xhc3MKaW5kZXgg
YTQxNTE2NThhNjIuLmVhODBhNjI2MGM0IDEwMDY0NAotLS0gYS9tZXRhL2NsYXNzZXMvbXVsdGls
aWIuYmJjbGFzcworKysgYi9tZXRhL2NsYXNzZXMvbXVsdGlsaWIuYmJjbGFzcwpAQCAtMjEsNiAr
MjEsNyBAQCAgcHl0aG9uIG11bHRpbGliX3ZpcnRjbGFzc19oYW5kbGVyICgpIHsKICAgICBicG4g
PSBkLmdldFZhcigiQlBOIikKICAgICBpZiAoInZpcnR1YWwva2VybmVsIiBpbiBwcm92aWRlcwog
ICAgICAgICAgICAgb3IgYmIuZGF0YS5pbmhlcml0c19jbGFzcygnbW9kdWxlLWJhc2UnLCBkKQor
ICAgICAgICAgICAgb3IgYmIuZGF0YS5pbmhlcml0c19jbGFzcygnbGludXgtZml0LWltYWdlJywg
ZCkKICAgICAgICAgICAgIG9yIGJwbiBpbiBub25fbWxfcmVjaXBlcyk6CiAgICAgICAgIHJhaXNl
IGJiLnBhcnNlLlNraXBSZWNpcGUoIldlIHNob3VsZG4ndCBoYXZlIG11bHRpbGliIHZhcmlhbnRz
CmZvciAlcyIgJSBicG4pCgpMb29rcyBsaWtlIHRoaXMgaXMgbm90IHRoZSByaWdodCBvciBhdCBs
ZWFzdCBub3QgdGhlIGNvbXBsZXRlIGZpeCB0aGVuLgoKVGhhbmsgeW91IGZvciB0aGUgZmVlZGJh
Y2suCkFkcmlhbgoKPiBDYW4geW91IGhhdmUgYSBsb29rIGF0IHRoaXMgZmFpbHVyZSBwbGVhc2U/
Cj4gCgo=

