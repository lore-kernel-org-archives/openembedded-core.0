Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09CD4D29DDC
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 07:01:10 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com (OS0P286CU010.outbound.protection.outlook.com [40.107.74.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53635.1768287668697606816
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 23:01:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=CuTWAQns;
 spf=pass (domain: fujitsu.com, ip: 40.107.74.45, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yc5pRE+sV4R7NDz9hu5KgxEmdHi1D95XjyWHln+VRrA8sSM9FnTDzVpsSYc9EAkDycK67TGmgK4ZdZ64C1HvGPOucdO6Ah+JVjkGBxPkm5Extvura4264qsbC3WzZJcT8KHsoPWs+pOEXWnq23ikwW+IO1YPhYK5nKbDpKxTCazrNbvbLWJr/JvnaTZYhbAiAjk711B0rpFjgCJRVC5su/Qk1OE3XTUMVXblEYIAzsKr7OvPZsVp2aXX2ZDCZne+AZvr8VTmvPiDb1Q5ARUVieTjEnE+IL3tDDfntbV/PlYN1SeLZxGKTANoD1M0ImWy8FhPSjwZyI1HgM5KinF4TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbJiqxMtceyg94GVHrUeyeJFp9PxggCW+MDBVFzk8pk=;
 b=jH4AjyXH/4LxHlYQniA9NgENfEGz/mreHQ/cQ0hfz45ve5EBwRWgiQKFHqWlClmREJvaPlTerdNc8rprTXR/49C2pArC/b2jKD5X+Y5rjkUkGQ0aApvInL2vqeLoC+ihvGRXw+lPP+aXFjHc4dJtUugHTVGkdyCgsNCO+D2+XNu1AXQUmtXZQDjZL4DEyMC9g4xRLz+KdRKHZ/kV/11fXrOeuwbEI9ltTAfMss6d75CFz+uSKeRLgJQbUxZzn1s03OB8w+ROu7L8QQwYH8I2P8lfQwfdma7ensRya7l09CM07XiOTar/57YRP+Kk4LlzwDYKQ7KPKLb81xCTMnzvUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbJiqxMtceyg94GVHrUeyeJFp9PxggCW+MDBVFzk8pk=;
 b=CuTWAQnsmAkPA3D1dd4+zTTHkdVfgTMrVTDP6COkiWvd7FzrgmnmeCo6BVYESBpGqMqaMq5x2rsxDPzY7kQmFB702zydVnFouOHMj9rXyB/nimldToUexLI7hnx85LnRZ39zlkzbBsJfOW7IrNWd6yUSxFLy2gml9D9myqy+nh3fVJlTA6iUx7xltX0O9ZkFWob50RpjtYZ41YJ2ns0Nd5iwhHbj4MInfQOTmNMqBXk4yvc9WLZddF/1Dg2XJuHGk+doEStZZryNEEGAV8mJkIVs846CWUHXz3uyEjhsVwYUKQ69LyrzfEh6kn2C9WaIcYoH2U1nZZqN88/AERwAAQ==
Received: from TY3PR01MB10110.jpnprd01.prod.outlook.com (2603:1096:400:1d9::5)
 by TY4PR01MB14056.jpnprd01.prod.outlook.com (2603:1096:405:208::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 07:01:04 +0000
Received: from TY3PR01MB10110.jpnprd01.prod.outlook.com
 ([fe80::2c3b:3362:fd90:f8aa]) by TY3PR01MB10110.jpnprd01.prod.outlook.com
 ([fe80::2c3b:3362:fd90:f8aa%5]) with mapi id 15.20.9520.003; Tue, 13 Jan 2026
 07:01:04 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: libcap-ng upgrade depends problem
Thread-Topic: libcap-ng upgrade depends problem
Thread-Index: AQHchFl2CM/CK/+Tg0KKigpNzBI94w==
Date: Tue, 13 Jan 2026 07:01:04 +0000
Message-ID: 
 <TY3PR01MB10110411E2A03C12CAB153BCB9B8EA@TY3PR01MB10110.jpnprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-01-13T07:01:04.043Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB10110:EE_|TY4PR01MB14056:EE_
x-ms-office365-filtering-correlation-id: 41fa842c-a855-4407-c62f-08de527184b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|7142099003|38070700021|8096899003|1580799027;
x-microsoft-antispam-message-info: 
 =?gb2312?B?Z05WSi9LeStXM0ZmNm1nai8zbmE1TGZvVFNoTWlRNkJHSnYwTkMrYTk4OU5x?=
 =?gb2312?B?NUFoaFlOT1MrQk00bTd0Q1o0OVU2YlRwV0pWRUVBTzQ3YmRVWTN5cU9XWTFr?=
 =?gb2312?B?dUJRMkVmY2JNNmxoU00vL3dpZlFKS01ScG9GUnBzODQ3K21ud29KMmxnMCtz?=
 =?gb2312?B?VVpnQVJvNDJ3dFU0d2xxSk9oRjE4OTNOMTc2UVVRYkJOaEJKcWp6OU8yalA0?=
 =?gb2312?B?WHZBOFVFc2E3elVVdVRiSkxaeVN2Q2JpTmljMTVaS2xGM0tvNjhGSm5tbnZs?=
 =?gb2312?B?UkVhOUNtOUVONWFObXg1YUw1V3MwbmlKeGg2TThrcy80QzgranlkV2hSMHRU?=
 =?gb2312?B?a3lPKy81ekRGdjJMcVZOSnZYVzZFWUZvTkRsUmo5b3Z2RmZKSjllZUp4L2I3?=
 =?gb2312?B?RWFyUnFkalJNd1ZIQ1ZZUC8yVUJxVi94OFdETWc0c1d6dzNqNUxTUDRIL0xV?=
 =?gb2312?B?V2pkVnN6bXBZdTd3ZkpzajFqTUlvbktqMk9VK2NNWjVTSWxrd2N0NHB2Wk5q?=
 =?gb2312?B?bWh1K09JMjh3Ump3cVdlQVI5WGcra0FQSmZQZ1N3Q2trdUhoZy9CUnFUN0h0?=
 =?gb2312?B?SlRKcFAvTWhyd3c4SGUrV0lOY2s1YVVXcmlCSklqb3VPdEdMNkpnOThXQ2pI?=
 =?gb2312?B?cE9QYitJSHptV2lQWHo1Y1NwZUloTDNXZG9HTkYwdSs2YWVLSUlYSG5TU0dz?=
 =?gb2312?B?VkRaVjQ5ajhxUFowNERGZldMWGpUMkRTZHIyT29nSW9IWkJTcTUrYnBRU2JS?=
 =?gb2312?B?QnpSeUZBS0NhOE9VM3dQbnJlMmJERVNaUWJhbUo5WTdxNHloQ3V0eEVYL1o4?=
 =?gb2312?B?c2w4cmlVUktObTdUTW1VV0hManp0SzlvZTZVQmNqRC9hUElFSHgxU0gzOHY3?=
 =?gb2312?B?bVFjdHBXM0RLaTQvN211VmUwQUszYU95YXpsa0M0QXFLZkhZSUJ1bXg4VFpn?=
 =?gb2312?B?RG1UUlNHdTRGb0EwSUdYYjAxdm9DT3JQdzR4RzBhcTA0Tys1WTR5L3FSeXc4?=
 =?gb2312?B?ZFd0Z3ZiMzFCdmQvTHRiQVpkYWdBVlQyYTQ4YlFJV0NFUkkzTitIQU92SmNP?=
 =?gb2312?B?QTBoQm42bi8xVTBPNGdQd1R2dU5XT2pIQ2dqN0RFS2YrMU1TRXJpZm1sbmlx?=
 =?gb2312?B?Z3NNbzI4RnBCTW1WRk13dEZSQXl1M2JKL01hWDhHa0JyVGxnaE1jUTRnZ2Vt?=
 =?gb2312?B?S3lYdWQzdkJjZUY4NVFrcmgxL0FxTTI1a2lKd1AzRTUzdURqa3hoRDR6YUp6?=
 =?gb2312?B?N3I2YVlNZjhPUVl6cGFnUHZGMldhV1MyMkNsbDJkWUtZY2tFSm9nVjlpc3ND?=
 =?gb2312?B?dytMb3A5dGxzcWNTdldmTXJJaHFBVkk4UFgwYXgvUkVVNE45aFJMZEJHMHpr?=
 =?gb2312?B?RlpBVitpSXl4Qkd1bjZqTEVnOE44dnRQdGZlV3pWUkQ2ZnJOKzJiU05FKzJp?=
 =?gb2312?B?bGV1TjgxVms0aTFRRGFxTS9FK1IrTjRFc1BoZzE1TEx6VTZ3dUVjQVZ0QnhW?=
 =?gb2312?B?NXMzN2EwR2MrdVk5OENsSW5wMGdjQ3F5YW5RajJ2Q0VSUzlVSkpzTlVjV2R3?=
 =?gb2312?B?RURHeDJkSi9va2pTdlFoVFh5RFNPaVdTUkNRdEtSVVdHNWpwWjFBMXRkbjJT?=
 =?gb2312?B?R1pDWFdUTi85dDFVeGxCUjd2TjVmR2ZGdE1LZVpqSWNkbzl4UXRjUkNsSlZx?=
 =?gb2312?B?eVhlRXNlZmVhWFBpOXg0dmQ2Q0ZnQ2ZOTlVKREZ4alRtczZYZHJNSnlGMURz?=
 =?gb2312?B?Y0lWdXVlU3U2a0ZhaVVzN2FudTQ4WExsRWZNZFl1dmt5QXBwbDlyWWo4TEYw?=
 =?gb2312?B?WjF0L0pYTGtuOWM2aEFBVy9vNnA5ZmNyMUdqSlkybE8vLzVhVnR5cjBUTjk4?=
 =?gb2312?B?OExJUzVad1pUV3diRStUNTJBcC9JUUJNMUhSNDVDbHJ1QWc0ejNKVTNKdndh?=
 =?gb2312?B?WjZKZGgvWDY0R3lDdHhNUWo0aE5xa0NYTUZDNEVjMVFwamdjTDBXcUsvU05i?=
 =?gb2312?B?ZnRCVmNhcUZMZmd6QWk0ZEd4THVCb3pBdjNvZjZ3dnFxTStlbzUzOFpsc0hn?=
 =?gb2312?B?NUJoZXJ3ekdSbDI5QmJYbENlSkFJUjdYZXZHQT09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10110.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7142099003)(38070700021)(8096899003)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?eHBkUm9PdHV0SmFkRi9keUtqSW1TYjdMK0czOHY1SWxWVVZOMFd6WmJDSC9Q?=
 =?gb2312?B?VkxqTnVqdzhwN3RyalB3RGNTckNiV3pPSmJyUE1xczByNXJiVTE4UklwL2Y1?=
 =?gb2312?B?V2p6dXRmVjFBajNCdWMzRkFPSmJiUjd5dkhBR25yN1VMNi9UVCtNd2o4aUla?=
 =?gb2312?B?TWw1TTczUFArNk1Dc25sZXNVK0JGajZGWXBiM1JucEhRNUptbSs3TnFnSll0?=
 =?gb2312?B?ZmxycEJIOE5HaDRZKzYzQUcycS9wRDhMakxZdHhpZU9GYUllak92ZEFhSkg3?=
 =?gb2312?B?SlRuREFnRTltRnV3NUdmMFdYNTVjMm9kcVEyYm1wWmV3QWs2VE53aGgwNDRH?=
 =?gb2312?B?aXpPTEh3dzNjelhpTWQxckxEOEpES21EM1p2cDhFSmV1bVptekQyS01VSVlP?=
 =?gb2312?B?S3doQ3ZnWUxiZjMrdXNybytyTjdYdEIwb1BKeU5UZ3FaejNjenZRR0F3ZzVp?=
 =?gb2312?B?bUxXWVVjV0RUY0VrVEt0eGtiR3duNTZRc28rOWd6c2VjcGRjRllHcWRqM000?=
 =?gb2312?B?emRqeExjTllpdHMxSkRFRk1qTnczZzZObmN4dUk5bWRCTk80WGJWdjYyVkh6?=
 =?gb2312?B?Z1BWNWxFK0IzalowRmxJWTl3UkIrUUs2bmZ5SkV0Y0lVTHUrdVFhbGM3M0FY?=
 =?gb2312?B?bXE3ekk3ekdQNFUvd3pGc2RDc25sRlRMZDVhcHN6aEpCbHlXWHV4QWhBYk45?=
 =?gb2312?B?RE9XQ3g4T0cwVElqUHhqTGtiTCtaMXlLbVhUTG1lTWRtWVdDeC9VYysvQlVt?=
 =?gb2312?B?Q25VcEdJVlV4NjEreWU5VWhLNGd5cytxcVl2bUdTeEZQL0FEQ0RjM0pRRG0w?=
 =?gb2312?B?bkVXUlpacEJZeWxrOWcwZ2ppaHRqcmxSWW91aE5wV0VDR0oyYnAySXYvRnhz?=
 =?gb2312?B?cEN2RGw1MjY0cHc0OXAwKzdlOUR6dllIZFBCYm5UeXlzN25OYTMwNkVlUWpG?=
 =?gb2312?B?S0JYdGFHNzNRNTl4d0pjckVIcmx1VllRN1BPOGRQUjIrK3ZwbkNIR2pVei9l?=
 =?gb2312?B?MVdOZ1U5WTlpL1B3dkZFR2lKekJVbmtTWmtmTHI4K0ZOZUkwQTBFUi9iSjBM?=
 =?gb2312?B?US8vTkllSXIzUlZBa21pSVZLSS9TWHF3VEdJOWVYVEZSdDJjN0NoK0NFSTJi?=
 =?gb2312?B?Y1pueURCUGpyRy9ncG5lQlppY21LSnNzWlhaOCtMaWk4Y3JMYWR2OXczWno4?=
 =?gb2312?B?Uk5YYUkzb3FyaGFoVVRRQVByMldKSERSdCtJYzRJRElDbE5QNjZod2NrVmdr?=
 =?gb2312?B?VC8zWTV6dlRDaDNKdkpCNjlnVkprTHNnSEhKL3JuenVHZmxubWd3TkErWDFL?=
 =?gb2312?B?TGxmWlVxNmkvbWhFSlh0L0Nla0RGUmhzZ1JmcU94NTNnNUxOZ2duQkdWNzRw?=
 =?gb2312?B?R1NFeUNMK1BEczlaNWc5WVUxamVZUWVtVzQxSFIxaDQwQ3dMUER6NkxFclZU?=
 =?gb2312?B?eWVjTnlXcG9LZ1dsTW1ua3BZSFQvRThVS1hCMUJNeFMwSzJ0NXZuOVZFUy9M?=
 =?gb2312?B?UWI5RUliQWxnc0l1c2JsN2Q0QU5GclY2bmVoK2NjQkpFdnEvZ0FlNFcvSm1S?=
 =?gb2312?B?cnA0a0FoRVowSkhBMXcweGtpL1VsMTVCaloxdUlLVjkvY1VhNCtucWZUSG9a?=
 =?gb2312?B?TWhEVnh0aVk5VmVVS3BuYlFxRGViVTRDb09oczBXalpVSm5PNDJrU0FLSWxx?=
 =?gb2312?B?U3VUMUpxemphdlg5dkdrUEtFSDdUa2o1TFIzVVlEVGJaQmJVSUhRbDRSU2Zm?=
 =?gb2312?B?cVc0UTNQNXB0d0dlQ2M2UW1qcWFrcW5NL0NHUVRzOXBLM3dINm1URE1UdEI1?=
 =?gb2312?B?SkhxaUdmK0pySlg5cmZoQTNXRnM1YUlORjQvVU9adU91MkRTci8rd3l4UjFJ?=
 =?gb2312?B?Q2twNHUyQVN3VEpaUlVHb1VlZDdWd01mV09UV3FMUGRuRUxCOXNOYktjUXhK?=
 =?gb2312?B?K3g3RjdUY3licjRxUVpya0c5OHZJQU9hakNzS2VnSEVtdkdaTnRpcU5vbkJP?=
 =?gb2312?B?dTJMeHZvN2FaSlR4V3dRUHlUcDVhVHA5R1l3NFZTbGlJWTNKOHB3a2RvT2Q5?=
 =?gb2312?B?OUtIajJIRnU1U0RNTjVKM2lzNGhWMmY3MGdMd3VGZzFBZ0p3WE5KSHVXMnZO?=
 =?gb2312?B?MkFuYmdZK0JzOTZQYlBYVEE0b01wLy80Wis1S1RqSFdWYXBNK1NWNnB1Rmdt?=
 =?gb2312?B?RFlzM0hOYndHcDg2L2gvODRTL1Nud1F5bU9PY0NERW16RlptSy9ReVpkOUhp?=
 =?gb2312?B?MEFiQi95YlBienlIVEZGcitIdlZHaWJXRWFiV1dtcGR0YW5WL0wxeUNUY2Zt?=
 =?gb2312?B?VloyakRqSURWTGs0SncvV2pvNFFQaC9LdUcxeFNFaXNxTWNUS01UUT09?=
Content-Type: multipart/alternative;
	boundary="_000_TY3PR01MB10110411E2A03C12CAB153BCB9B8EATY3PR01MB10110jp_"
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10110.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41fa842c-a855-4407-c62f-08de527184b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 07:01:04.3954
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4lBG8Khxa4Fmaf+V2LmBkaZ1PMZXQFZO1Xf5XfO9Q0mmnyu0+XL+kug7ckWztTbMhEYBp+s0zw8dpwRDWu1XTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 07:01:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229226

--_000_TY3PR01MB10110411E2A03C12CAB153BCB9B8EATY3PR01MB10110jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQWxsDQoNCkkgdHJ5ZWQgdG8gdXBncmFkZSBsaWJjYXAtbmcgZnJvbSAwLjguNSB0byAwLjks
IGJ1dCB0aGVyZSBpcyBQS0dfQ0hFQ0sgZXJyb3IgZHVyaW5nIGRvX2NvbmZpZ3VyZQ0KDQp8IGNo
ZWNraW5nIGZvciBnYXdrLi4uIChjYWNoZWQpIGdhd2sNCnwgLi4vc291cmNlcy9saWJjYXAtbmct
MC45L2NvbmZpZ3VyZTogbGluZSAxNDg2Mjogc3ludGF4IGVycm9yIG5lYXIgdW5leHBlY3RlZCB0
b2tlbiBgTElCQlBGLGxpYmJwZiwnDQp8IC4uL3NvdXJjZXMvbGliY2FwLW5nLTAuOS9jb25maWd1
cmU6IGxpbmUgMTQ4NjI6IGBQS0dfQ0hFQ0tfTU9EVUxFUyhMSUJCUEYsbGliYnBmLCcNCnwgTk9U
RTogVGhlIGZvbGxvd2luZyBjb25maWcubG9nIGZpbGVzIG1heSBwcm92aWRlIGZ1cnRoZXIgaW5m
b3JtYXRpb24uDQp8IE5PVEU6IC9tbnQvY29udHJpYnV0aW9uL2J1aWxkX2ltYWdlL3RtcC93b3Jr
L3g4Nl82NC1saW51eC9saWJjYXAtbmctbmF0aXZlLzAuOS9idWlsZC9jb25maWcubG9nDQp8IEVS
Uk9SOiBjb25maWd1cmUgZmFpbGVkDQp8IFdBUk5JTkc6IGV4aXQgY29kZSAxIGZyb20gYSBzaGVs
bCBjb21tYW5kLg0KDQpJdCBzZWVtcyBsaWtlIGxpYmJwZiBpcyBuZWVkZWQgYXMgZGVwZW5kZW5j
ZS4NCkJ1dCBsaWJicGYgaXMgaW4gbWV0YS1vZSBub3QgaW4gb2UtY29yZS4NCkRvZXMgYW55IG9u
ZSBoYXMgZXhwZXJpZW5jZSBhYm91dCB0aGlzIHByb2JsZW0/DQoNClRoYW5rcw0K

--_000_TY3PR01MB10110411E2A03C12CAB153BCB9B8EATY3PR01MB10110jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi All<br>
<br>
I tryed to upgrade libcap-ng from 0.8.5 to 0.9, but there is PKG_CHECK erro=
r during do_configure<br>
<br>
</div>
<table cellspacing=3D"0" cellpadding=3D"0" style=3D"width: 468pt; border-co=
llapse: collapse; border-spacing: 0px; box-sizing: border-box;">
<tbody>
<tr>
<td style=3D"white-space: nowrap; padding-top: 1px; padding-right: 1px; pad=
ding-left: 1px; vertical-align: bottom; width: 208pt; height: 14pt;" align=
=3D"left" colspan=3D"4">
<div style=3D"white-space: nowrap; font-family: Aptos, Aptos_EmbeddedFont, =
Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color=
: rgb(0, 0, 0);">
| checking for gawk... (cached) gawk</div>
</td>
<td style=3D"width: 52pt; height: 14px; white-space: nowrap; padding-top: 1=
px; padding-right: 1px; padding-left: 1px; vertical-align: bottom;">
</td>
<td style=3D"width: 52pt; height: 14px; white-space: nowrap; padding-top: 1=
px; padding-right: 1px; padding-left: 1px; vertical-align: bottom;">
</td>
<td style=3D"width: 52pt; height: 14px; white-space: nowrap; padding-top: 1=
px; padding-right: 1px; padding-left: 1px; vertical-align: bottom;">
</td>
<td style=3D"width: 52pt; height: 14px; white-space: nowrap; padding-top: 1=
px; padding-right: 1px; padding-left: 1px; vertical-align: bottom;">
</td>
<td style=3D"width: 52pt; height: 14px; white-space: nowrap; padding-top: 1=
px; padding-right: 1px; padding-left: 1px; vertical-align: bottom;">
</td>
</tr>
<tr>
<td style=3D"white-space: nowrap; padding-top: 1px; padding-right: 1px; pad=
ding-left: 1px; vertical-align: bottom; width: 623.997px; height: 14pt;" al=
ign=3D"left" colspan=3D"9">
<div style=3D"white-space: nowrap; font-family: Aptos, Aptos_EmbeddedFont, =
Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color=
: rgb(0, 0, 0);">
| ../sources/libcap-ng-0.9/configure: line 14862: syntax error near unexpec=
ted token `LIBBPF,libbpf,'</div>
</td>
</tr>
<tr>
<td style=3D"white-space: nowrap; padding-top: 1px; padding-right: 1px; pad=
ding-left: 1px; vertical-align: bottom; width: 554.664px; height: 14pt;" al=
ign=3D"left" colspan=3D"8">
<div style=3D"white-space: nowrap; font-family: Aptos, Aptos_EmbeddedFont, =
Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color=
: rgb(0, 0, 0);">
| ../sources/libcap-ng-0.9/configure: line 14862: `PKG_CHECK_MODULES(LIBBPF=
,libbpf,'</div>
</td>
<td style=3D"width: 69.333px; height: 14px; white-space: nowrap; padding-to=
p: 1px; padding-right: 1px; padding-left: 1px; vertical-align: bottom;">
</td>
</tr>
<tr>
<td style=3D"white-space: nowrap; padding-top: 1px; padding-right: 1px; pad=
ding-left: 1px; vertical-align: bottom; width: 485.331px; height: 14pt;" al=
ign=3D"left" colspan=3D"7">
<div style=3D"white-space: nowrap; font-family: Aptos, Aptos_EmbeddedFont, =
Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color=
: rgb(0, 0, 0);">
| NOTE: The following config.log files may provide further information.</di=
v>
</td>
<td style=3D"width: 69.333px; height: 14px; white-space: nowrap; padding-to=
p: 1px; padding-right: 1px; padding-left: 1px; vertical-align: bottom;">
</td>
<td style=3D"width: 69.333px; height: 14px; white-space: nowrap; padding-to=
p: 1px; padding-right: 1px; padding-left: 1px; vertical-align: bottom;">
</td>
</tr>
<tr>
<td style=3D"white-space: nowrap; padding-top: 1px; padding-right: 1px; pad=
ding-left: 1px; vertical-align: bottom; width: 623.997px; height: 14pt;" al=
ign=3D"left" colspan=3D"9">
<div style=3D"white-space: nowrap; font-family: Aptos, Aptos_EmbeddedFont, =
Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color=
: rgb(0, 0, 0);">
| NOTE: /mnt/contribution/build_image/tmp/work/x86_64-linux/libcap-ng-nativ=
e/0.9/build/config.log</div>
</td>
</tr>
<tr>
<td style=3D"white-space: nowrap; padding-top: 1px; padding-right: 1px; pad=
ding-left: 1px; vertical-align: bottom; width: 207.999px; height: 14pt;" al=
ign=3D"left" colspan=3D"3">
<div style=3D"white-space: nowrap; font-family: Aptos, Aptos_EmbeddedFont, =
Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color=
: rgb(0, 0, 0);">
| ERROR: configure failed</div>
</td>
<td style=3D"width: 69.333px; height: 14px; white-space: nowrap; padding-to=
p: 1px; padding-right: 1px; padding-left: 1px; vertical-align: bottom;">
</td>
<td style=3D"width: 69.333px; height: 14px; white-space: nowrap; padding-to=
p: 1px; padding-right: 1px; padding-left: 1px; vertical-align: bottom;">
</td>
<td style=3D"width: 69.333px; height: 14px; white-space: nowrap; padding-to=
p: 1px; padding-right: 1px; padding-left: 1px; vertical-align: bottom;">
</td>
<td style=3D"width: 69.333px; height: 14px; white-space: nowrap; padding-to=
p: 1px; padding-right: 1px; padding-left: 1px; vertical-align: bottom;">
</td>
<td style=3D"width: 69.333px; height: 14px; white-space: nowrap; padding-to=
p: 1px; padding-right: 1px; padding-left: 1px; vertical-align: bottom;">
</td>
<td style=3D"width: 69.333px; height: 14px; white-space: nowrap; padding-to=
p: 1px; padding-right: 1px; padding-left: 1px; vertical-align: bottom;">
</td>
</tr>
<tr>
<td style=3D"white-space: nowrap; padding-top: 1px; padding-right: 1px; pad=
ding-left: 1px; vertical-align: bottom; width: 346.665px; height: 14pt;" al=
ign=3D"left" colspan=3D"5">
<div style=3D"white-space: nowrap; font-family: Aptos, Aptos_EmbeddedFont, =
Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color=
: rgb(0, 0, 0);">
| WARNING: exit code 1 from a shell command.</div>
</td>
<td style=3D"width: 69.333px; height: 14px; white-space: nowrap; padding-to=
p: 1px; padding-right: 1px; padding-left: 1px; vertical-align: bottom;">
</td>
<td style=3D"width: 69.333px; height: 14px; white-space: nowrap; padding-to=
p: 1px; padding-right: 1px; padding-left: 1px; vertical-align: bottom;">
</td>
<td style=3D"width: 69.333px; height: 14px; white-space: nowrap; padding-to=
p: 1px; padding-right: 1px; padding-left: 1px; vertical-align: bottom;">
</td>
<td style=3D"width: 69.333px; height: 14px; white-space: nowrap; padding-to=
p: 1px; padding-right: 1px; padding-left: 1px; vertical-align: bottom;">
</td>
</tr>
</tbody>
</table>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
It seems like libbpf is needed as dependence.<br>
But libbpf is in meta-oe not in oe-core.<br>
Does any one has experience about this problem?<br>
<br>
Thanks</div>
</body>
</html>

--_000_TY3PR01MB10110411E2A03C12CAB153BCB9B8EATY3PR01MB10110jp_--

