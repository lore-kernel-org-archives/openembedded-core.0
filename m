Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C28CD5BBD
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 10:31:57 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20665.1763029916364235971
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 02:31:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=vucxb3ys;
 spf=pass (domain: siemens.com, ip: 52.101.70.63, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVwTFBTxDd4wFNtrFfmTWJ60BftxZrAgS1m0G59abG5hjByBH9Pcwi0UzzqMHungbSt81D31BElj0ykG8e7jSBh9U3RzNTYhcFzb7qk55oN28vPXRqRk2pc/Levf2a1Ue329VHEhC5tFnfHLBz3CQrGYCgfgWQSR/pb9xcsTD4s0de/aH/gK8FMi70a8C3rGhAy8Go986GGr3m3BGT/N6/5KODriHX4bhKtbAiDToUKfpche2s9Yp+Qakj28QEHezNi8rFzeIa9f62tYtIAxTGFDMWD8AFPpLozxj6FlmisHY4LPUvmqNwm8NG0D9nmoHSOpqs4DtOzZOAKvXfVGXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2roRfGCNVJ2V9GSHr4XNkC0+/Pf40roZSrRYh2wRXPg=;
 b=ppApm7DutSat+0ETzncLe6ObPP3Ikro7waeGyHIjlcVkvTJdFioR2ht8gvqczPJEMqDreGtf83+VEmJEXxLKHBpJePm/EmgsfjvrMN81ephh1/JHzpHwtMYCuNE49i2mmE9U3H8c/jdl+XcwanR1ikXf6LMV68pmkHR6yHpeMUH6ldudDh9MiVt2pepUgKGY6XZhIcbGVUqshwhwMZKM05ZlERb7rKusExs5ZzYzKSqe0W6IyHski7T2j3lq+FqJigK+3TuzL/nvpy0pgHmgunS/KUdp2BTpDlI9rfngtRmKJy+RE5rvDJVB9+PFMNdPjMCFOBStYORhqsi1WfSoqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2roRfGCNVJ2V9GSHr4XNkC0+/Pf40roZSrRYh2wRXPg=;
 b=vucxb3ys5hvlsEs7rda2bB451Q0sxVrJSFSAp04lPnNn759YPycZ0HlQ2nGHRgjMWox9/q9K3ZQ17r7A6lqTqnBTc4yNmnmnshqRuidNpAps8PozEQyuhtFq/trfEOLnAagxzW18P0vnp8muPIGmjAHfYj6P8LiWdLhI9CeTqly5No2yw/JnDuXBaOnsMHBTOiFj8JGOawkDAB/BuUahW5Nnoj89e/DNFLxzzs/DUu8HlYdm34LCvJFEbUJ1AOlPeDXG/7hyiHWSAROceRwCB8RT49Uc3746pcP7SSfz+MEmE1k9BpN7gFhfA0hVH0cnETBX2x2/atk0gvhI4nd6oA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV2PR10MB6430.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:b0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 10:31:50 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9298.015; Thu, 13 Nov 2025
 10:31:50 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Quentin Schulz <quentin.schulz@cherry.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] go-helloworld: fix license
Thread-Topic: [OE-core][PATCH] go-helloworld: fix license
Thread-Index: AQHcVHUsY492P+nyfE2wBQCQG8PSzbTwXYEAgAAK19A=
Date: Thu, 13 Nov 2025 10:31:50 +0000
Message-ID: 
 <AS1PR10MB569727915AEE60012FA94E07FDCDA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251113081148.32411-1-peter.marko@siemens.com>
 <f37fbfa0-d3c2-42c6-a6df-8916e2b92af6@cherry.de>
In-Reply-To: <f37fbfa0-d3c2-42c6-a6df-8916e2b92af6@cherry.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=04f166f5-9075-44a6-a88e-e8c89c3b7a19;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-13T10:31:11Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV2PR10MB6430:EE_
x-ms-office365-filtering-correlation-id: 5d5121e8-40bd-4fd6-41ef-08de229fdb52
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cW1vcFl4SityVE1LZW95aXVZQzU2Rkp2ZlhUYUdWY3FpTWFvajdyQXVJYno0?=
 =?utf-8?B?YUNYb3I4OUlMZXNsVERKemQvRjN6NWpGQUxNQzI4R1ppZEduRVVKWmlmVmlk?=
 =?utf-8?B?d1cxbFo3RzBJdm5aUHo5WWZ6RWVnck8xMVB6WG9sODQwWmJiekNaUkd6enhV?=
 =?utf-8?B?b0NibmVTd0tLaWJEcVhYemU0UU9weWNmSmFwaURBNXIxbmFkZDVYVDJmUmdU?=
 =?utf-8?B?SllFMENNcmQzdC9lT1hYTkt6RnQxay9vZWVZVFpKR0JseWVybUFJMHAyTWJr?=
 =?utf-8?B?cFUyUTlMODlBUk43aWJ0Zm1ENmJXNWRZK3N5blg0UzNHWmh1L2YvdUhFUDZJ?=
 =?utf-8?B?cjVoWDBvbytSMzRYb3ZrNFpQaU1ZWmJVbFM3eUFJOHJnN3JRVC9BZmxJN3hy?=
 =?utf-8?B?bGZNajMyemlGRGZJZUtFYjl6dk50ZVh6cDhzYU9sM2dVcTFvNmhZRlFYbm14?=
 =?utf-8?B?eVZnMGlzT0RqS2d3bXRSNWhSUHlUNWdMaHN0TW1GRzgrZ3hnZk1hbDd5ZDY5?=
 =?utf-8?B?QXpacHFRVU55Zkg2M0MvSjVVbEZPbnhWU3FhT05ZS20vaytDemp2dWF0QUpM?=
 =?utf-8?B?UTI2SHdPREJCd3p2bmFsWjE0SjhJNFp1eTVuYTZhQWFZajVOQURtdEFXclU5?=
 =?utf-8?B?ZXlDM3VMdGRGQUh1OGs3czJpMVErVkljd3ZwTjNKYU9KRlhKS1Q5d2xoRjZm?=
 =?utf-8?B?bGxBY2ZqcUZabE9ET00xWVVObUE2Y25XKzVWVlViT1JnYTJRUEhaNnZvYUF6?=
 =?utf-8?B?VWtmaGhQWUJabGhneExNWFZHYm14eExCcVVKKzBsZ0RuTVZmSmZzZUdRY0Qx?=
 =?utf-8?B?RVRHVU5vT0JOUkQvVWJBVUtDM1lRbmR0a3FSV2xoY3d6WnBZUnBzSlJmc0pp?=
 =?utf-8?B?ZmF5OVVUVnkwOVdFTHhCZE9pa0dMdUp1SjF3YmMvTTZBdnlOalRVUkVBaXJy?=
 =?utf-8?B?WkREUURPNm4veG1aTUF6MnJsaHh2MGtvWTZGbXdWTFo5MVdsenNDOXBuY3pR?=
 =?utf-8?B?eHRFenJadGRXOXY2c01PTmpIY1FQdWc5YUNheldLUmpmMWNGRzI3eldzQzVm?=
 =?utf-8?B?K0xNUGpjODF1cWJMWmx3QzgvaUEvNWkwcUxPayszUVVFYlEwVnRGRGt5TFkr?=
 =?utf-8?B?NTdPQmdld2h2cHBZU3VKN1hvblJNbStZTEhsVkV2YVRGcEtjSU9OdW42WmtW?=
 =?utf-8?B?aFAwb0NTalJaT0Rzdm9JNVYxeDc1RHQrZzNpaHo1T2pkVjYzOU5mNEwzMlpS?=
 =?utf-8?B?SnBlWHF2Njl2NDNMb1M2elpRcE5ORTdOekpOMGlCNGg3Y2x2bEdjcWtuaUNn?=
 =?utf-8?B?Z1VrZ3RpdFZyNW5na2haTWNKZ0pHSTVOYXhwNjdKSXFTbEROTk1ZblE0YVBN?=
 =?utf-8?B?R3NOQWFGeG95NjMvVnNnTVl3d0d4SVQ5R08zREUrWlhoMS90RzJMaFJ2b1U1?=
 =?utf-8?B?VHdWVGVsV3ZxTGk1ZWRJQUpPRjlzWXhtQWg3ZlZ6VWVNUmllRU41cVMzUFhw?=
 =?utf-8?B?bVE5dTZyeE9LZ0dFNU1SWHY1Y25IMjdLczhRVGVndzJFa3VYdVBnemtZT21R?=
 =?utf-8?B?eVFMS01OYlVnbnNST0hpc2QvV2NQMEZpZmdOSmxkVFRtUk5IcnRJV3hLRWlJ?=
 =?utf-8?B?b1BDZjB3Z2s2YmFhbzN2bnBKVXhvVXlGbmg2blJ0SzNJWld4TENadUpNVEVw?=
 =?utf-8?B?WjhwcVlNSGVIOVM3NWUwREx6Mm5Pc1V1Q1pZWWhQWGxBQWluOVEzRzlqeDVx?=
 =?utf-8?B?ZUJGVEJqUTFNUEZnNUxQZ0dHVlZFTDBtaGlKbzdDMzJRRXZ3MjkxM3k5dlZS?=
 =?utf-8?B?dkVhYXg0QW1LS09vdS9hT3RIbEE5cmFEUjdZR2dRZGxIVHBBb1ExREEyU2RY?=
 =?utf-8?B?QXo1UVkwaTYwRzl3THlOWHh2NDlsb2Npdmg1WmhQaTVYd1lDazBvUmV0YnU5?=
 =?utf-8?B?Zi93MFkrcG1FUXZCT3VQWlI3Z2xqYlhra3I5MUJBY3VVRUpwdzFYbzhTdW56?=
 =?utf-8?B?S1Y5enpDUkxpK2ZrUUZ6Z1B6ejUyb0MvZXF0WEtNZlB0YVhLdDkvQ1pVb3pI?=
 =?utf-8?Q?I6wm/g?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cEhFRHVkSXNsZExSS2VUWitOejhONFFFejFjSmxEWEdoaDVwWkJTNFVKWE5x?=
 =?utf-8?B?SFBlcGdxeGhudnJUZmFzd0h3WHk2dFFnbXpqUkxDaU5zSFFuZXYvL2N5cEtR?=
 =?utf-8?B?dExTTHJNZkZQYzNDM0FsR2lCdDl6NHlvMXh1eGdEMWtvN05wZ3hOalcxejBv?=
 =?utf-8?B?dE9DZ0I1WVYxVnVRT25SWGI1QlpsR2lhN3FXUGEraUk3VS9wMGZuTUVKbWls?=
 =?utf-8?B?MnRKaHZuMTNIWVVjM1R6Nzg4eXJuRjl0YUtvODR2Sk82Y1RUQnlEUE1qbXFz?=
 =?utf-8?B?ODJjdDhJdnpMMnlxME04OFo3U2QyMVMzNlBwcDk3MnI3QWtwT2o2Q0N5M0dN?=
 =?utf-8?B?bU01VmpwbkZTSFQ0cWh1L2pkZW8xQXpjR09pcWxNcTJ5SkhpUmdVZGdqckht?=
 =?utf-8?B?VTUrK21oYkt4VkpjYXFsN2ZoOVlmOFRzSTRRSjVqNjNNOEx0ZkVZZGFwTllv?=
 =?utf-8?B?SE1VZXE2N1Q4QkUzeGRoYW9lQUovR0dYNDhLTGhDSFdweHRtV3A2WnFCMGZL?=
 =?utf-8?B?dUZjaGwzWHdkSDd5Lzgxc2JyazBITiswYUFmZ09GY3dmMG1jWjN2RXpob0sv?=
 =?utf-8?B?dVF2cml1QUNJSFFVMEEwbVA3V0lWZlRwTVZ6TlRSRWMvbEozUy9yVkRMZ1RO?=
 =?utf-8?B?a2xlaXBiRkNPZ2J0ZjlBc3FCaStLVnJUdFgrRXljT1FXc1BQTXdzQ1pTYWph?=
 =?utf-8?B?ano2TmIwU0MyT1VnblNBYW5sdG5id0pDMGR3dGF2REYrM0RjZUY3VjNwcEV2?=
 =?utf-8?B?aWw1K21iVjlBUE5WS1d0dm83RWV0eWswL3o1cWM1dkl6NUczZFBDVG05N01K?=
 =?utf-8?B?MFZXZTZ4YnZKbUlIVDJ4NWUwbXJEODgvbTg4SmZFdTRUT2c3dCs1MEJMUllI?=
 =?utf-8?B?L1loSVRQc1VPYlNsUWlYSUpBT1VBbldzc1B6ZFlGdWMvV0hsMzdaY010eWlz?=
 =?utf-8?B?aThZNG1EZVNIa2daaXdveW9wbDlDWVc2R3JOZXYrQ0FlQjdITkI2Um5mVGE0?=
 =?utf-8?B?bG9xeC90bmRRYjlrZVhFS09qWmVWVndRK1V5TmJSOHk1aEorcGlUQTZUU0VQ?=
 =?utf-8?B?VklMNFQrcjNrV3RhbVlnWTVVQUZGMFlSeG84MTA3NWFvNnQ3a1VuVCtZNk9y?=
 =?utf-8?B?ZTFOYVM0MHNKbjcxQlpKMVd0QlBxa1VETXBPbWRPVVV5TzRxOXBwYWVXZ2RL?=
 =?utf-8?B?QlVkeDhaUXhxNjNHU0ozUURPbnZkcWxxbmdnWUEvNjJrbXlpMVV6NXJZYXFV?=
 =?utf-8?B?N25DOVRHWWx2bHp1YnBRVEQ4WThmQlNlUEJxUThkSmdJS2t5R3hMaXI5VVJO?=
 =?utf-8?B?SkxaelpBZVloSkliQUFRQ1l0aVNGd25ZcldkSjZXUVpjelpEU3lrc0VqcEtv?=
 =?utf-8?B?NzVGS2tDcVhtNHFXUURrVDVndUFjTUYvYTVITjN2UUswMVhzUzhJRDMyN1BD?=
 =?utf-8?B?bkcweE5OSkxJd3ROQlFtdzA0eXNEL0NWTmlNS3VMT1RZaklFSnFibGNHTXJU?=
 =?utf-8?B?Mk90R3oyRWNnQ0sySi9yeVpac0JGQXVnUEgxdWlIWHVpWlpldGJGcFROWHlq?=
 =?utf-8?B?TlJwbVdvRElIT2x3MllLTjVybmZ4R3VUOWgzdUNrajYxMU9BN2tZVEZ0MGpI?=
 =?utf-8?B?OEVMRUUxUjUzYzlPaXJIcnpWRDlIaGhXdElpUkZMUjFBUHVpeHJ2L0QzZ080?=
 =?utf-8?B?bnYvZktTQzZOUDNEQWtBUzZsVERCU3RTY3VlSU93eC9Eelh4UkdkQ0FWUzZq?=
 =?utf-8?B?UVFzUUFaNnBwUTArWFVBS2oyak83b3YxQ1QxZ1VqMHFWUWpieGw0MTJXRzBi?=
 =?utf-8?B?ZVUvcnJWT3pSTGt5czd3ZUp6RTBMRzBpTTF0Z2FESmlxZmp1aHEwdWZIckx2?=
 =?utf-8?B?MVZxQzFyMTgzWjZKNXAwSDFCQkxiZVB0SlRqNS9jbXVDWTFTelFDdVdJbEw1?=
 =?utf-8?B?YXVEUUdENXU1bUliMWhRMFVYbkJnQWVtTzdJYWZOOFp5QnpVdUo1TGRWc2x2?=
 =?utf-8?B?ck5QWnRaY20yRVpGaGJlSmx3M2ZWTkVTNi9MejdXenNoNDlQRjhIMm9jN01M?=
 =?utf-8?B?VGxsdEpsQ2EvamdJeklPMEVUNlQ4QzRSWlc0b0QwODhCdkFGY05JdFg4Y3Fu?=
 =?utf-8?Q?HrJFy5MjXljvPHUs9m6EeeOOz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5121e8-40bd-4fd6-41ef-08de229fdb52
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 10:31:50.7735
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1ftVDrtrSYgjnaRL9IYswtvXbhs2X+yb7e4Ar3f+ZKKAawFXjVCEhJKqmLgz6B49zWXuFIAZsIYh7OxOhLPxJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6430
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 10:31:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226233

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUXVlbnRpbiBTY2h1bHog
PHF1ZW50aW4uc2NodWx6QGNoZXJyeS5kZT4NCj4gU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDEz
LCAyMDI1IDEwOjUyDQo+IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBldGVy
Lk1hcmtvQHNpZW1lbnMuY29tPjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdW1BBVENIXSBnby1oZWxsb3dvcmxkOiBm
aXggbGljZW5zZQ0KPiANCj4gSGkgUGV0ZXIsDQo+IA0KPiBPbiAxMS8xMy8yNSA5OjExIEFNLCBQ
ZXRlciBNYXJrbyB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBGcm9tOiBQ
ZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4NCj4gPiBUaGUgZXhhbXBs
ZSByZXBvIGRvZXNuJ3Qgc2VlbSB0byBoYXZlIGV2ZXIgYmVlbiB1bmRlciBNSVQuDQo+ID4gSXQg
c3RhcnRlZCB3aXRoIEFwYWNoZS0yLjAsIGxhdGVyIGNoYW5nZWQgdG8gc3RhbmRhcmQgZ28gbGlj
ZW5zZSBCU0QtMy4NCj4gPg0KPiA+IFRoZSBsaWNlbnNlIGZpbGUgZXhpc3RzIGluIHRoZSBzb3Vy
Y2VzLCBzbyB1c2UgdGhhdCBvbmUgaW5zdGVhZCBvZg0KPiA+IHRha2luZyBpdCBmcm9tIHRoZSBP
RS1Db3JlIGxpY2Vuc2UgZGlyZWN0b3J5Lg0KPiA+DQo+ID4gTm90ZSB0aGF0IHRoaXMgd2FzIGFs
cmVhZHkgZml4ZWQgaW4gc2NhcnRoZ2FwIGFuZCBraXJrc3RvbmUsIGJ1dCBpdCB3YXMNCj4gPiBu
b3Qgc3VibWl0dGVkIHRvIG1hc3Rlci4gQWxzbyB0aGUgb2xkIHJlbGVhc2VzIHN0aWxsIGhhZCBB
cGFjaGUsIHNvIHRoaXMNCj4gPiBwYXRjaCBpcyBkaWZmZXJlbnQgbm93IHdpdGggbmV3IHZlcnNp
b25pIG9mIHRoaWUgY29tcG9uZW50Lg0KPiA+DQo+IA0KPiBJdCB3YXMgc3VibWl0dGVkIGZvciBt
YXN0ZXIvd2FsbmFzY2FyIGJ1dCBuZXZlciBtZXJnZWQ6DQo+IA0KPiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9vcGVuZW1iZWRkZWQtY29yZS8yMDI1MDgxMi1nby1oZWxsb3dvcmxkLWxpYy12MS0x
LQ0KPiAwN2NlMDBhMGYyNTJAY2hlcnJ5LmRlLw0KDQpPSywgc29ycnksIEknbGwgc2VuZCBhIHYy
IHdpdGggdXBkYXRlZCBjb21tZW50Lg0KUGV0ZXINCg0KPiANCj4gQ2hlZXJzLA0KPiBRdWVudGlu
DQo=

