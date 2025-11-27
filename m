Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA270CFD2F6
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 07:00:24 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13097.1764226816247539414
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Nov 2025 23:00:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=TRD/Edkx;
 spf=pass (domain: siemens.com, ip: 52.101.70.11, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xy/vLlxySfaPIIRXNqtRKitcAYd9fTIo7aEx7ywOmzO8ZZBeKJsNA4N3LBeRxJmcsRypM9Hvi/fhwYKvh/wc+evuq7uC0gslQnTdotL6U1woGSrWuhEdEV1IVF1MSsdY8H4nNPs1m9X79yFA4gS3nJQil0/ZFzIJxyTWPjXtiAGdVMcpDjy9Unr9lY7D1UHnzjtEWSnku+mCq886Bbga0KeAK0KKAb8tRVMpcFpJu7XfzSPL4wEKFA1tG+rhydDHCfxK54lvEmn47HrBdHuotdypQoqD0j387pPT2jQZI6cp15T350RfV6oAL4tWzmwkRZx8IGnl5F+JkNbRYhIENQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaB1a7WSaFIcGcKOF3jrCYvK9q8oxMNeBiPAc/4zGWs=;
 b=evYus7VwqfjsjKmsCll/eovZAVrqYSZpm93eB/+LQvVU0Ib8IFfOQdgnCS+NdjKrHVAYbk3yX4UeDzKfQsWreNqfDZK1hAutc9qNPy41ypE0+qZeDHZJhE4/t8tCBcrrrNcz6ykMzNVBoGAjdqANB2eIss2+Hz+bEDFrM7Mwcgd6L8+eNg7bRCqRRlX4r0Mr7sWdw36f5eZB7LLYZKfHQMvPCUwwg50PPt2AzHvdylj4EeiPi4RKAddux8hf+c4WOBz6ebuJQOiYq6V3SYKOuavtkY1/0mq9hU+veP+MkOZFC+EIqQJA+oVZRKbmhCxCyjkrYL0fnV+Ex0KgPaOolg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaB1a7WSaFIcGcKOF3jrCYvK9q8oxMNeBiPAc/4zGWs=;
 b=TRD/Edkx1E+iCJ0D4VzmxWJIzIHFgUsCj9PMzELYl6cvpxhQOI2Oos2qIgFPhApWazOX9N5eSjVP7Wm1pT8I9tDgSJHoAJlZGgEQe7i18tLF3mxh2hS4lztmwLXeimX2Ns7v+dO9DKMP5iREdmTC5ZZhkNm1L9VOEOyuZcZoJ5OCJEi+jhgk1dX5ycpzqROyQSjK1pM4XeOV0xk8OonBJPxOB3gZYqqUXMXZ/4uIZMZGBu4fCN+X5lsyL6zMMIic7vWJL22MnelyJcfo+gA5u57/7Y7rQiQMY8LWOlBR8EvQaw9RBuAsG/vd9o1LS7iAR35vTD3QlfuTWqpZUzh5Dg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS8PR10MB6531.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:566::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Thu, 27 Nov
 2025 07:00:11 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9343.016; Thu, 27 Nov 2025
 07:00:11 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Mark Hatle <mark.hatle@kernel.crashing.org>, Steve Sakoman
	<steve@sakoman.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][scarthgap 14/21] lib/oe/go: document map_arch, and
 raise an error on unknown architecture
Thread-Topic: [OE-core][scarthgap 14/21] lib/oe/go: document map_arch, and
 raise an error on unknown architecture
Thread-Index: AQHcW/22yxLF02wKskuG7bN5X9cOULUFuwYmgABi+CA=
Date: Thu, 27 Nov 2025 07:00:11 +0000
Message-ID: 
 <AS1PR10MB5697C9581D88FF708572830CFDDFA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <cover.1763849517.git.steve@sakoman.com>
 <e6de433ccb2784581d6c775cce97f414ef9334b1.1763849517.git.steve@sakoman.com>
 <187BB63A9D5CD718.192695@lists.openembedded.org>
 <bc058d00-62fa-4c96-ba4d-7b9357f48651@kernel.crashing.org>
In-Reply-To: <bc058d00-62fa-4c96-ba4d-7b9357f48651@kernel.crashing.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=a78774cc-60b0-4b65-b904-c8ddd1ee68ec;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-27T06:56:42Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS8PR10MB6531:EE_
x-ms-office365-filtering-correlation-id: 26740394-9a00-42a8-bbe9-08de2d829b8a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?U3greXJiZjNtMnY5MnFCSDYwZGdpY2VFUno2OWgzQml5cjVoUnFBTVZZL1Rv?=
 =?utf-8?B?Y2UwbE5SekV6bVhiNDVjWitaL2IrYXR4WnVVMGR1Zmc2b2JWSFpEUmtZR2kv?=
 =?utf-8?B?U1BxczROdUNqN0R1MTFiT3ljK2p3eU9hWGo0ZnZKdjFaWmRMd2IyMFRJTGda?=
 =?utf-8?B?QTZ0c1NQODliT1VPMUZBMmFoMUd1OWVJKzhCcGlRbHlvOEdyWWs3Y01oQWZ3?=
 =?utf-8?B?dEZGS3V5aFpoeEpFVEFUbGZETlVRZDAxY056dm41MGgrdEZFRmJoWnJpa25o?=
 =?utf-8?B?ckdTSHhoeForTFdlZjZSV1VLR2tQK2pvZE5MNHhFdmw0RTl0bmF3c2dKV3RX?=
 =?utf-8?B?MmJVVHB5dEIwREVBcWd0eldEZFR0U0l4L3NsWEp4enNmb0djRGVTZnZ2Y2Jr?=
 =?utf-8?B?NjRVeWNEbEY5NHp1YlBidG45SXVTQkhRNEk5MWVNWWJsb0lNMkdqZWtpZ09h?=
 =?utf-8?B?bmRWN0FRanlEYjZma240c0pTQ1BjTWNwRzAwdzJoK2d0OVF3cWZqRnlLTnlh?=
 =?utf-8?B?Z2RCaUpOS0hoQjc5V2REeEdzanpMMjUzektEVXVSc2dkK1hWUjg0RTU0TzFI?=
 =?utf-8?B?RWROeXpoVzg1S1ltZ0h5WEJNcmQ2MGYyRHJIZytod3pubzJoS3NQWG9kNm41?=
 =?utf-8?B?WjBqSVlXWDdSbXdlT2NYeHJUbjF4ZkhEWnRzRGRSakw0SGFnTUJXOVZUblJW?=
 =?utf-8?B?Rk8vdDJ5UjRoa2FTOWp0bUh2bnNrK0ZRcGMzaUlsS1J5cW83cDkwNEwwaGRR?=
 =?utf-8?B?eW9xck02UCs2SkcyMlF6M3o2eHpXMUxSRTdJT2V0b2RZanc2NWlCYXJyQWVN?=
 =?utf-8?B?RlU2ekJ4WjFLWUx2Zm1JTGgyRjdXRCtMMjdjczYzRUJsckVjZlIvQ2JkeHp5?=
 =?utf-8?B?QVJYNlNyeVdJN2NRc1gzcTNYemJ2QVFPZDZqUDBGL2FHQm5qbmgrUWJUV2Ra?=
 =?utf-8?B?Wm1EZldZS3NvYStkZElCNmRnSUF0bTJLaG1oUUlHOGZCMlNFTVBYNGlGMnhx?=
 =?utf-8?B?bmlsU1lCWXdkRWpxYmx6NWtTczNwenJqMVN0SVk4RWp5WGUyYmVrb1I0d1BX?=
 =?utf-8?B?dG43OVRnVE9KRFFIb0RqaUdPV0owY2xQdzJESVhtSlBOd3RhbEN1ZjhNdnRH?=
 =?utf-8?B?Wk5FSUpxODhqMGRwZzBjeUtaZUY2WDIxSUxGLy9NUU9Vd2luQ3QzWi9zd1dF?=
 =?utf-8?B?Tjd5WVM2TEdRajI3YzdFQnRrMnJIM1J0MENtVTFrQmJVeFM4VE9lbzBpQklN?=
 =?utf-8?B?Q05vUERjQ0FvUXR1SHJ2Z0hJRm0vMUp1c2xJMzlUQ29jWFY0OXBXdGZqZEtv?=
 =?utf-8?B?UXNXbUYxVnFsREJUVXZENXNvSVdKZVV6R1pod1JqbHdiM21sSmgrM3BhNHdR?=
 =?utf-8?B?ZHo0RDVwVndtSC8vbE9kdElRYnRVUG9YUXM4aS9TdmpneWFabDd1Wm1YN2Np?=
 =?utf-8?B?bGNYcWdiMkpFM0NzdHN5bnFMYytZbWZMWjRoZC9JUmdtTVVsc3oyY0ZsQjdr?=
 =?utf-8?B?MEJONjZadm1vbjl3clhMajZ2V1o1Ukwzd2xLcngxRlNzb05WQjl6SWIrc0hk?=
 =?utf-8?B?U0V0MVB5UksyUjY4OG1TQUN3KzU0a0s3S2VlTUtRaS9TT3JlQVVzQkFJWm1B?=
 =?utf-8?B?aVcyaXVnWjdkSlZETVg2UUJsUytBZGtEai9OTnB4em0yTW5CbzI3YXZqNDlW?=
 =?utf-8?B?RlVQU0x6WE5UKzhORWpuUU9DeVhoMHJmMmlSVmFUVDRoaE5ZSFJsMHJMVjZs?=
 =?utf-8?B?SE1nTVpSN1IvUWUvRWVLRDBkbWdlamF3emM2MVlkSG1sc0tldmtLVStIb2VX?=
 =?utf-8?B?dDdYd1pVRDhodjB5RWVxV1k0NUhjUGxzVmpleHlXekRxUTZwNVMzS2kvRlZk?=
 =?utf-8?B?YkNLRWNLdXN5QmxaYm5Qb2RyazJEZ2JPQXBkcnVnYnB3d2ZNaFZuSVBpeUZR?=
 =?utf-8?B?N2U5MDRVQjRydnE3S1czOW1UbnJFU2czbmI2dmJkbE93SGtnZ1BuVFE3Q1FM?=
 =?utf-8?B?eURRNCtyU21OdVI0YjZhUnlId3FDdlFTWEZJcVVzWnVZZjdXQWcxK2hqNkVC?=
 =?utf-8?Q?gqREUp?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WWgxZVVzTmovanh2WTN3UjJOQjBqd09sUW1paWVtRHNRUE5FOWhXaWhQQkIz?=
 =?utf-8?B?RWEwVmE3cFBXQWJVbWllRTJvdEtMMTZnSEE3NEo1enBseFhsTnhKSmRYOXZm?=
 =?utf-8?B?aDFRYTdZcmF0KysyNEhEMzZybnBuNVdsM2d4VCtwMFI4S1AxSzBUNU9XOXdP?=
 =?utf-8?B?QlVzY3VEdW93cDZoNERXanZSYzdyeTZxWnZBT1JGZm5NcE9xTWNQYk1ITTBk?=
 =?utf-8?B?eDJvMTMrODVWZEdNeWNIcTlnU2tISzVOYkQ1MEZoMjlIdFdOSzZVMmR0Z0kr?=
 =?utf-8?B?UWZxQ09jL2dKTDAyMmRGczdDeEU4SEJsWkwwZjB0cWFNVU1WRWlFVzlmdFdF?=
 =?utf-8?B?ZWV2ZVQyRzJBbmJDbDRneFRKMWpJenhrSHZkNithcFBIUC9wSzJtNnE3Nzhs?=
 =?utf-8?B?andHNk1WcEJhVURPS1UrbHlGK1M1NTFZdlZ5bHJnUDA3V0MrSCtlWWVvT0F3?=
 =?utf-8?B?OVhKUFVwanBYaUtwQ0JHQUxjZW5DcHlmdDM0VTBhZ2Y4SVVwK1BNUlZINm1k?=
 =?utf-8?B?c1I2QzhBTVl2MjY5MTJmZEo3VnBuRFhud2FRQitCbTNDNXZUOEMwNFY3cHFw?=
 =?utf-8?B?ak94UEtZK2N1aTIrOXNkSHdZaGxpT0FnZnJ4MEd5ZFdBdU41WXVjZEFZUTRk?=
 =?utf-8?B?WjhqY3BXb2JDQXhBNUE2QUJGTGJOZWd3VWQwYm01ekxoWXFkbG9sMVpaeDBB?=
 =?utf-8?B?THJZU3JOR2JBNFhvVTJmdDdValR1aXVObXdwaklXSmpXZ21DQno1Tzg4Vzlk?=
 =?utf-8?B?cDVyK0RuMUk0NlFvdVNtY0dnYmQvdGxyOEJXTXdLeCtrYlpUQ0VPcGUvelF6?=
 =?utf-8?B?ekI5TmphTys3Zk83bFU3bVh4M0VxZ2ZOV0xack9iM3Zva2tZSVhOZ241NllK?=
 =?utf-8?B?Rnc1ZmJGQVJJMWVjS3FlYVp6akUvcktxcGZlRGJ3dlRMTXRHNmliZVhkekdk?=
 =?utf-8?B?UHBIcjBlWm1FYWRzYkJweThNcSszM0ZRbTRIb3p4K2VNdGl2VDUrZ01wMU1i?=
 =?utf-8?B?N1VDYUNxWG0vclNBNkJ2ZXdIUTdMUnV6SmNCQ3B6YUwwOVlyNEFSbklzTlV5?=
 =?utf-8?B?bTZyUzZiRzFRTm82aVVwRkhGVWlmMlJHZVIvSG9jT1NDVk56Sk9HNjE3U1JT?=
 =?utf-8?B?UjN2VXBJcTEwNVdjcnJTa1ZmL3hYZjA4anhCaGRFbHpjT1Z1elBQS1g1STdF?=
 =?utf-8?B?ZnpWRytLV3NzV3hRbFpIcGFtZTFHU2p0WTlwWGc4SnFxRXdtL2RGMXhHWWkx?=
 =?utf-8?B?dmxMWlJtUk5CaFE0YXU5REFHQ2FCVDVEWkw2UmorUlVoMFpFeUZYVmY5eEZH?=
 =?utf-8?B?TVdNc0hXVURlalZMemVzZ2dqVTROTXFrTVNVZ0RUWkNlcmFNMWp4V0hKbjdU?=
 =?utf-8?B?cll1UEZsSE90MUtnZUo1c09tMmJTSnJka0kycDdvTk8vTTRTeVlPTU13aXh6?=
 =?utf-8?B?cjczRUI0TXFnSE55d1JHWU9lYS9XMFhhc2twdzdFTE0xMnZ3bXZjbnNDUXFh?=
 =?utf-8?B?UWdRQWF3NnlQZWtzTXQ3d3Z2Rmg5L2krZHZxbG1TalpCRWZVTGpZOWcvSzJ1?=
 =?utf-8?B?Zzd2ejFxeGRiT3lJRFpuNmo4Wlc4V3pGVGk4ZCtYMTcrc2d5WS9RdVBTOU9S?=
 =?utf-8?B?WDRpVmVnRm1aMGhlQWxHS3BqRWVKd0xPSUdVYUZpSkJPZVM4aXE1a21NRXM1?=
 =?utf-8?B?OUozYmFmUVUxM3VGaUpWdWFRV3FVL0MrVERFam5nRmx3WFF4dHV5TWtGV2Nt?=
 =?utf-8?B?RklSTkVrTS9INUxWaDByT0Zwa01VNzJCd0JKSFh0dkFmY1NSREsvUHg5ZlhP?=
 =?utf-8?B?eExsS2ozQk9EOXA2L1RyaTRwTFg5QzZSSy9NejYwRGJ0SzZ6a0FCUVpGNDlQ?=
 =?utf-8?B?K2FkUEllZnFzRDNyZ0V5MW42d0JPZW9YblBXNmp5R0NsM0E2bmw5aTVGampI?=
 =?utf-8?B?T0pZYWFERWp1Ri9DRHVkb085T1dLcjBldENSMjVhbDhpL1ZBYUZjOVBCYnln?=
 =?utf-8?B?c3JwYjFZMFBUZjZhMkdnNnh3MWdLRUtUZTU3TUF0Mnd6MHpwaUpnaU1QcVI3?=
 =?utf-8?B?NW5PRkVVbkFSc0RFM1Z3RGkzeFdpUHZoeTBJWDgvMUQwSE5sb25aMnBwalVR?=
 =?utf-8?Q?YYp4ZZSt/PYJNF5MAxmcAZeCr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 26740394-9a00-42a8-bbe9-08de2d829b8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2025 07:00:11.1269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l02yHDXjfcBnUBMmDHfjk5zLJm2qtCmZXZH4Zrq6Z1pCD1VDJTt3QOeurJRaFJkCwyMFJfrnDI5HnWmLs/1eDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6531
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 07:00:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226827

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBNYXJrIEhhdGxlDQo+IFNlbnQ6IFRodXJzZGF5
LCBOb3ZlbWJlciAyNywgMjAyNSAyOjAyDQo+IFRvOiBTdGV2ZSBTYWtvbWFuIDxzdGV2ZUBzYWtv
bWFuLmNvbT47IG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+
IFN1YmplY3Q6IFJlOiBbT0UtY29yZV1bc2NhcnRoZ2FwIDE0LzIxXSBsaWIvb2UvZ286IGRvY3Vt
ZW50IG1hcF9hcmNoLCBhbmQgcmFpc2UNCj4gYW4gZXJyb3Igb24gdW5rbm93biBhcmNoaXRlY3R1
cmUNCj4gDQo+IEkgaGF2ZSBhIHBvc3NpYmxlIHdvcmthcm91bmQsIGZvciBtaWNyb2JsYXplLCBm
b3IgdGhpcy4NCj4gDQo+IEJhc2ljYWxseSBpdCdzIHRvIGZvcmNlIGluY2x1ZGUgYSBjbGFzcyB0
aGF0IGRvZXM6DQo+IA0KPiBweXRob24gX19hbm9ueW1vdXMoKSB7DQo+ICAgICAgaWYgYmIuZGF0
YS5pbmhlcml0c19jbGFzcygnZ29hcmNoJywgZCk6DQo+ICAgICAgICAgIGlmIGQuZ2V0VmFyKCdU
QVJHRVRfQVJDSCcpIGluIFsnbWljcm9ibGF6ZScsICdtaWNyb2JsYXplZWwnLA0KPiAnbWljcm9i
bGF6ZWViJ106DQo+ICAgICAgICAgICAgICByYWlzZSBiYi5wYXJzZS5Ta2lwUmVjaXBlKCJHbyBk
b2VzIG5vdCBzdXBwb3J0IG1pY3JvYmxhemUuIikNCj4gfQ0KPiANCj4gT24gMTEvMjYvMjUgNjo0
MCBQTSwgTWFyayBIYXRsZSB3cm90ZToNCj4gPiBUaGlzIHBhdGNoIGJyZWFrcyBNaWNyb2JsYXpl
IGZvciBtZS4NCj4gPg0KPiA+IE1pY3JvYmxhemVlbCBpcyBub3QgaW4gdGhlIGxpc3Qgb2YgY291
cnNlLCBidXQgZ28gZG9lc24ndCBzdXBwb3J0IHRoaXMgYXJjaGl0ZWN0dXJlLg0KPiA+DQo+ID4g
RHVyaW5nIHBhcnNpbmcgb2YgdmFyaW91cyB0aGluZ3MsIGluc3RlYWQgb2YgdGhlIGNvbXBvbmVu
dCBub3QgYmVpbmcgYXZhaWxhYmxlIEkNCj4gPiBub3cgZ2V0IG1hbnkgbWFueSBsaW5lcyBzaW1p
bGFyIHRvOg0KPiA+DQo+ID4gV0FSTklORzogPHJlY2lwZT46IEV4Y2VwdGlvbiBkdXJpbmcgYnVp
bGRfZGVwZW5kZW5jaWVzIGZvciBHT0FSQ0gNCj4gPiBXQVJOSU5HOiA8cmVjaXBlPjogRXJyb3Ig
ZHVyaW5nIGZpbmFsaXplIG9mIDxtdWx0aWNvbmZpZz4NCj4gPiBFUlJPUjogRXhwYW5zaW9uRXJy
b3IgZHVyaW5nIHBhcnNpbmcgPHJlY2lwZT4NCj4gPiBiYi5kYXRhX3NtYXJ0LkV4Y2VwdGlvbkVy
cm9yOiBGYWlsdXJlIGV4cGFuZGluZyBUQVJHRVRfR09BUkNILA0KPiBleHByZXNzaW9uIHdhcw0K
PiA+ICR7Z29fbWFwX2FyY2goZC5nZXRWYXIoJ1RBUkdFVF9BUkNIJyksIGQpfSB3aGljaCB0cmln
Z2VyZWQgZXhjZXB0aW9uDQo+IEtleUVycm9yOg0KPiA+ICdDYW5ub3QgbWFwIGFyY2hpdGVjdHVy
ZSBtaWNyb2JsYXplZWwnDQo+ID4gVGhlIHZhcmlhYmxlIGRlcGVuZGVuY3kgY2hhaW4gZm9yIHRo
ZSBmYWlsdXJlIGlzOiBUQVJHRVRfR09BUkNIIC0+IEdPQVJDSA0KPiA+DQo+ID4gKGF0IHdoaWNo
IHBvaW50IHBhcnNpbmcgc3RvcHMpDQo+ID4NCj4gPiBJIHNlZSBubyBvYnZpb3VzIHdheSBoZXJl
IHRvIGFkZCBhbiBhcmNoaXRlY3R1cmUgdGhhdCBPRS9Qb2t5IGRvZXMgbm90DQo+IHN1cHBvcnQs
DQo+ID4gd2hpY2ggbm93IG1ha2VzIHRoaXMgYSBoYXJkIGVycm9yIGZvciBhbnkgYXJjaGl0ZWN0
dXJlIG5vdCBzdXBwb3J0ZWQgYnkgdGhlIGNvcmUNCj4gPiBvZiBPRSBhbmQvb3IgZ28uICAoaW4g
dGhlIGNhc2Ugb2YgbWljcm9ibGF6ZSwgcnVzdCBhbmQgZ28gYXJlIGxpa2VseSB0byBuZXZlciBi
ZQ0KPiA+IHN1cHBvcnRlZC4gIFNvIHRoZXJlIGhhcyB0byBiZSBhIHdheSBmb3IgbWUgdG8gYXZv
aWQgdGhlIHBhcnNlIGVycm9yIGluIHRoZXNlDQo+ID4gY2FzZXMuKQ0KDQpPSywgdGhhdCdzIHVu
Zm9ydHVuYXRlLg0KDQpIb3dldmVyIHRoaXMgaXMgc29tZXRoaW5nIHRoYXQgbmVlZGVkIGEgcmV2
aWV3IHdoZW4gcHVzaGVkIHRvIG1hc3RlciBicmFuY2ggaGFsZiBhIHllYXIgYWdvLg0KVGhpcyBi
YWNrcG9ydCB0aGVuIGp1c3QgbWVhbnMgeW91IHNlZSBpdCBoYWxmIGEgeWVhciBhaGVhZCBvZiBt
aWdyYXRpbmcgdG8gbmV3IExUUyByZWxlYXNlLg0KDQpQb3NzaWJseSBzdWJtaXQgYSByZXZlcnQg
b3Igb3RoZXIgYWRhcHRhdGlvbiB0byBtYXN0ZXIgYnJhbmNoIGFuZCB3ZSBjYW4gYmFja3BvcnQg
aXQgdGhlbiB0byBzY2FydGhnYXAgLg0KDQpQZXRlcg0KDQo+ID4NCj4gPiBPbiAxMS8yMi8yNSA0
OjE0IFBNLCBTdGV2ZSBTYWtvbWFuIHdyb3RlOg0KPiA+PiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9z
cy5idXJ0b25AYXJtLmNvbT4NCj4gPj4NCj4gPj4gQWRkIGEgY29tbWVudCBleHBsYWluaW5nIHdo
YXQgdGhpcyBmdW5jdGlvbiBkb2VzIGFuZCB3aGVyZSB0aGUgdmFsdWVzDQo+ID4+IGNvbWUgZnJv
bS4NCj4gPj4NCj4gPj4gSWYgdGhlIGFyY2hpdGVjdHVyZSBpc24ndCBrbm93LCBpbnN0ZWFkIG9m
IHJldHVybmluZyBhbiBlbXB0eSBzdHJpbmcNCj4gPj4gd2hpY2ggY291bGQgZmFpbCBteXN0ZXJp
b3VzbHksIHJhaXNlIGEgS2V5RXJyb3Igc28gaXQgZmFpbHMgcXVpY2tseS4NCj4gPj4NCj4gPj4g
KEZyb20gT0UtQ29yZSByZXY6IDAyNTQxNGMxNjMxOWIwNjhkZjFjZDc1N2FkOWEzYzk4N2E2Yjg3
MWQpDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBh
cm0uY29tPg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJk
aWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gPj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgTWFya28g
PHBldGVyLm1hcmtvQHNpZW1lbnMuY29tPg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBTdGV2ZSBTYWtv
bWFuIDxzdGV2ZUBzYWtvbWFuLmNvbT4NCj4gPj4gLS0tDQo+ID4+ICAgIG1ldGEvbGliL29lL2dv
LnB5IHwgNiArKysrKy0NCj4gPj4gICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvbWV0YS9saWIvb2UvZ28ucHkg
Yi9tZXRhL2xpYi9vZS9nby5weQ0KPiA+PiBpbmRleCBkZmQ5NTdkMTU3Li40NTU5ZGM2M2IyIDEw
MDY0NA0KPiA+PiAtLS0gYS9tZXRhL2xpYi9vZS9nby5weQ0KPiA+PiArKysgYi9tZXRhL2xpYi9v
ZS9nby5weQ0KPiA+PiBAQCAtNyw2ICs3LDEwIEBADQo+ID4+ICAgIGltcG9ydCByZQ0KPiA+Pg0K
PiA+PiAgICBkZWYgbWFwX2FyY2goYSk6DQo+ID4+ICsgICAgIiIiDQo+ID4+ICsgICAgTWFwIG91
ciBhcmNoaXRlY3R1cmUgbmFtZXMgdG8gR28ncyBHT0FSQ0ggbmFtZXMuDQo+ID4+ICsgICAgU2Vl
IGh0dHBzOi8vZ2l0aHViLmNvbS9nb2xhbmcvZ28vYmxvYi9tYXN0ZXIvc3JjL2ludGVybmFsL3N5
c2xpc3Qvc3lzbGlzdC5nbw0KPiBmb3IgdGhlIGNvbXBsZXRlIGxpc3QuDQo+ID4+ICsgICAgIiIi
DQo+ID4+ICAgICAgICBpZiByZS5tYXRjaCgnaS44NicsIGEpOg0KPiA+PiAgICAgICAgICAgIHJl
dHVybiAnMzg2Jw0KPiA+PiAgICAgICAgZWxpZiBhID09ICd4ODZfNjQnOg0KPiA+PiBAQCAtMzEs
NCArMzUsNCBAQCBkZWYgbWFwX2FyY2goYSk6DQo+ID4+ICAgICAgICAgICAgcmV0dXJuICdyaXNj
djY0Jw0KPiA+PiAgICAgICAgZWxpZiBhID09ICdsb29uZ2FyY2g2NCc6DQo+ID4+ICAgICAgICAg
ICAgcmV0dXJuICdsb29uZzY0Jw0KPiA+PiAtICAgIHJldHVybiAnJw0KPiA+PiArICAgIHJhaXNl
IEtleUVycm9yKGYiQ2Fubm90IG1hcCBhcmNoaXRlY3R1cmUge2F9IikNCj4gPj4NCj4gPj4NCj4g
Pj4NCj4gPj4NCj4gPj4NCj4gPj4NCj4gPj4NCj4gPj4NCj4gPj4NCg==

