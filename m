Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD183C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 10:57:18 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.84])
 by mx.groups.io with SMTP id smtpd.web11.46924.1743073036183690222
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 03:57:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=A5hQQnPA;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=A5hQQnPA;
 spf=pass (domain: arm.com, ip: 40.107.241.84, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=utI1AjMixzCJLThL0lyMMRuDG8MxD+NBvqjLxPnl3DgDM0KQVmPXYQf4CSyEvt114iTq8OGwyU74qFt4YeccukTrCShAKdU/aoGaTVtopj9UkOj2xUYT69I+RdxoiAhp4uq0CVLVoit+XdbkI1TsBbmRT/4V3IuwxPWwQf1JOJ+1wVuCRsHZ+6lZuZldq6MMqhacDEYOpBWKO3d1DluRxNknxXO2bgWsQ+Irv39Zu2vKff9TdBkrNGIZJO90IazVzpf36aq0u5xghkJaig7z7JzBmtLUnqFi0Ce/rrndzA1pvOKJz7hu/f5fPoLZZhoEbc1UDnJYM+siRutvTDM/Tw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzGUeAKxgzn986LszXCDK9nnFTgb5rYWXerrgvJP26Y=;
 b=ibv097PCASTnwavUAmhds4twTHj2g8V5vPi6vydUK4YsA1O2fzaMgLp0EVhDW6MLR/Xx78BngR1/HPtfixKWrE7Mp0ji5PuAXEJLzDMDuLjQwgRNx6IdzRe1HWnX0ENcCORtEli6Df+UjfWJO307yod6THHG2NCLMc6U353hSJyMY7rsTItN3hO5weip5bxyqDe3tA+9oZpbOiA+T/NI+4AuKsadtD0eiIMyDt0eh73SfgHA7Qj7AqohVGeocoYC7lleLeTq6HJEuy5YsgeLKFagusk03BfGbuGTx//xXMnuVvIN5dQFROWfuR3u3kSjXdu0vK+Y8AWj7YTngJpOKQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzGUeAKxgzn986LszXCDK9nnFTgb5rYWXerrgvJP26Y=;
 b=A5hQQnPA74sNFJNlQNC2swrNUwqoDtT6kOqqf8ffWOK2uNMB0sdQgytpD+vp/DmP3zzi24MxhQz9/z7hCiK4foJHfx1ZaoZXDDIN0tk6RN7S66DS4Ch/Bqh8WT0xzNPsuSuq/zhEi5NjBLwbvI937XwvZn8viaEt89IMYpTFtRQ=
Received: from DU7P250CA0029.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::18)
 by DB9PR08MB6362.eurprd08.prod.outlook.com (2603:10a6:10:25a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 10:57:11 +0000
Received: from DB1PEPF000509F7.eurprd02.prod.outlook.com
 (2603:10a6:10:54f:cafe::1) by DU7P250CA0029.outlook.office365.com
 (2603:10a6:10:54f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Thu,
 27 Mar 2025 10:57:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F7.mail.protection.outlook.com (10.167.242.153) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 27 Mar 2025 10:57:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YOoot5lKaTD1qHbWaSJ1zoteXvJTyoX6oB5WG6mhuCWXTp/0ao0AbzbCrne4A5WdGQamubtqNEmaOtG0xZGl4OTcvoWpokUyFjmAX3xC0d26P+HF6MNeYV2BnVcETs3sxM3Uq87POrCM33vHmePUjWI9fDvPCVqwqYtDFRcNFuDNwuxokKSt20SJHxCveS0C2+Yg31xCfYPXoL4R7totW/WpvobIVOxVx9uzGORM1j8K3xgQwM43LqVWKBgPpafjrkFBq6nQPxSvroLGNiDKrlpct6/oFzfRWdQK3tnDUy7jVaXPYhzmqQaUBuvwCnKyMafqaMlu2g5pO7zd+qH+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzGUeAKxgzn986LszXCDK9nnFTgb5rYWXerrgvJP26Y=;
 b=hXcPghrKS14dfg41ILvSGytqTDD42D8wer75O/5Dhci10DeC8XuLF15sQu8x1zACVpdm/Z72lGBFfDYZB53Arw9jZfyaNMu/SRF1jv3hCpDXNdul/LX13E3gvT5wijLrKqp0UC+it0hXW4KMcxl/iUxyScT6VYkS7wAMQm4K63yPMIhRjB3IBYVJtjGA+5sF+Bly19HsHxUcWBar/JwAeH83YDHKe5xVb5BSxz5QSuiPCXMNmFw3lbV7BMynkDm9X349XsxXqJIbXCMqvcgsir2+BSC3rU3GjuHBrF/F5XGEyRnTR6gkDxJMPW/PMLEOx8u7JI1LyiSP1vt53Sa/mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzGUeAKxgzn986LszXCDK9nnFTgb5rYWXerrgvJP26Y=;
 b=A5hQQnPA74sNFJNlQNC2swrNUwqoDtT6kOqqf8ffWOK2uNMB0sdQgytpD+vp/DmP3zzi24MxhQz9/z7hCiK4foJHfx1ZaoZXDDIN0tk6RN7S66DS4Ch/Bqh8WT0xzNPsuSuq/zhEi5NjBLwbvI937XwvZn8viaEt89IMYpTFtRQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB5619.eurprd08.prod.outlook.com (2603:10a6:20b:1d8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 10:56:38 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 10:56:38 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "randy.macleod@windriver.com"
	<randy.macleod@windriver.com>
Subject: Re: [OE-core] [RFC PATCH 3/3] time: fix runtime version from UNKNOWN
 to 1.9
Thread-Topic: [OE-core] [RFC PATCH 3/3] time: fix runtime version from UNKNOWN
 to 1.9
Thread-Index: AQHbnuCo9+gHIg4n6ESgBmLiaz119bOG0AWA
Date: Thu, 27 Mar 2025 10:56:38 +0000
Message-ID: <CAE523D0-3B64-41CD-BCBC-3B584776F7D3@arm.com>
References: <cover.1743052694.git.Qi.Chen@windriver.com>
 <4fb03305a3cf138c9a40f40e04004b022989d520.1743052694.git.Qi.Chen@windriver.com>
In-Reply-To: 
 <4fb03305a3cf138c9a40f40e04004b022989d520.1743052694.git.Qi.Chen@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB5619:EE_|DB1PEPF000509F7:EE_|DB9PR08MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bcce5a9-3b47-472d-6299-08dd6d1e1fd7
x-checkrecipientrouted: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?d3YvQ2N6T0lMU2x0N3Jjb2M1d3pJRElDZGYxcVVoSmgyN3oyWUh3Tlh6YStN?=
 =?utf-8?B?clZtcmg2S2dBTFdiY1ltdEI5UEVxSWVBem5MMVBzVThwT1ZWWEJDRldic0sv?=
 =?utf-8?B?MEE4MXp0RlFyOTdjNEoyeXRpNWViYjAya05Wd0RUamtUSkRTc2NIY2FKUU1z?=
 =?utf-8?B?Y0ozcDQwbWF3NnJiYzNBdEJ0RlRuck11V2RNMnlWdjZHWWxUU2RkR3Q1YlY4?=
 =?utf-8?B?cmtQUDhMZGtXUXRpNklvcFEwelN6MzBCbDZJN3FWWW52R3JMWWFWUXZwTFdS?=
 =?utf-8?B?YzJ1M3lqMUhNUlJnTDI0KzFvYUs2OVZNRmZiNVNkQXVDWVNBdzRKVFFLdW9p?=
 =?utf-8?B?clpRT016RWNOU2FMa3g2M1YzUGRmb1ZBcU84N0pPL0UvVjBGTmtzYjZCbnhU?=
 =?utf-8?B?alJoSUs0ZFlrK3kybTZjSGdCazFid013ZkFzeEdvQ3pMenRMZnFnZ2xJcWpo?=
 =?utf-8?B?a21JK0x6Mllnc243K0ZvTCtFZk5SMWt6YUROWEo4U1VkNUJwSjBCOEc1Rzly?=
 =?utf-8?B?amQ1emJaUENnR2hzS2JxQ0RpMWNwMWdPNEJIaSsvQnFvbDBieGZXSWMxV0Z6?=
 =?utf-8?B?c0RmMTVHOWc2cDZycmVlK2poOVZMZjY5aHZjMjFXQW9FaENtUDU0VFRmV0w2?=
 =?utf-8?B?ZklDWGRSTjZrVUhhSlRwdkFGeGtRVzVObkxTa1BXbmRiM2NHZEJmYS9wbENR?=
 =?utf-8?B?R3pIcndQRGNMYnh5M0ZqaVd4M21INkg5N1docDlFTVVPZUNlYkY0UkU2d2R1?=
 =?utf-8?B?ZkxCdFVaQjhVdW5MSEhoUXJtTzBQa0E4WXR2OVdiV3M2V3BCQ0hvUWRwU1B3?=
 =?utf-8?B?V3piUUQ3UHV2azJFbW5vbEJIYTByOGpEYnpwNUZ6VW1HQkVMWFpRbkZzcWJN?=
 =?utf-8?B?Z0l6V1NtVmtqa2kvWTVJWmJvd3VqbkVNOWlON3VOSHZsUGNTRjhDSTlOcklI?=
 =?utf-8?B?NFpmVVR3ck5XVVNWSmRBd2dMQ013MVh0WXc5cUNuOTRPZURPeTc0dEhnZE45?=
 =?utf-8?B?TDlnNTVjMTVEYXhUbStjL3ZLTkdvNjRCcXpZVUx6SFJZVUJUeDU3N01pUFQz?=
 =?utf-8?B?ak1mcWFGb1F4NFYrYzlodjJMZjUyTFUwWks5aFAvWlluaXJENTg1Tm5VVHpi?=
 =?utf-8?B?OWJKTWhqV3ZwTHYwRjF5OHhKeG1WbHRSTnpjTzR5Vk9BUS9NUlFyRGVmZHJR?=
 =?utf-8?B?ZitnbXRrdjFmU2FmK25CSE1LTis1UXd4bEx5YmNFNDg4Q0o1Y1YxTWJGbXg1?=
 =?utf-8?B?Z251MUVuUzhCVlFsWUxzc2luem5ZcUwwM1ladXZ5MWxKMkxHRFVKTTBXRlRY?=
 =?utf-8?B?c1d4Qkk0azFXK2g5ZXdRbVYvcytKYmIvb0UySm9qUldLWWNxbmJvSlVWdENz?=
 =?utf-8?B?ZXkwdm1kUWxEWlNyQnpRMHhaK1g4TFFhZ3hGb3BQMFN3VElreW1tUklkYnVl?=
 =?utf-8?B?RHNub3dMVnpGOG92U0Vnb2YwbklZaEkrS256WUhnM1NMbTgvV3V2Y2FscmNi?=
 =?utf-8?B?cGhLVjIrWEp4aTFRQ3R4Ym5QM0FxM2RhbjQ0a3VjR3NDS2c0V1BiMitaMmhY?=
 =?utf-8?B?VTVnTlBwa3p5cm82TGdDZ0V1VW5ObGNIZ21jaWI1ZzB4b2IvNVNmU1ZaRW8x?=
 =?utf-8?B?N1FHM3NlZ1lhMkUzeFFONFY1VmRKYmg4WHVhbFY1UkJ3QzJqN3NyODNIdzYx?=
 =?utf-8?B?STB4SkpseERLYW9rUGJxaHo5VWViZ0hNNDF0THlGZ2Uzdkt1OUdETWZRS2FN?=
 =?utf-8?B?MWh5dTJzTzNTZVUyeDNydzlNNWhGRmNubUVxWFRPSEQ2dE40c2I2ZFZ5MzNG?=
 =?utf-8?B?Q0p1QWJpTjE0Njd4d0xKUUEvNlAzeW1wMXdvNHFTSFMvOHdNODluYVptYkUx?=
 =?utf-8?B?UUs3a1g2Q1FxTUM5MlppSSttQmErMmVWNFcvRWtvYlkva1dtUEJUM3BNSkZP?=
 =?utf-8?Q?jpHBLAwIUqimshg0ACLDCTY6gKXnBQsS?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9BFB7CF8ADEB0429FCB3C55E7570CFC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5619
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	aacbfe71-fb94-4c54-6fc9-08dd6d1e0c6d
NoDisclaimer: true
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|82310400026|36860700013|376014|35042699022|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YVBPd0VxMmcvZjV1c1ZFR1VuL2V4K2NucUVTSDNkUzFyQWpNYS80em5QU01P?=
 =?utf-8?B?V0xoK29qeWxnaVM3eEtjclo1OVVsL1owcHA4NHN6eS80L3R6VHcyWitLczFV?=
 =?utf-8?B?cmNVb3dZaHNJanY2MEVGakc0NVlxd0FtemsrVFg4N2NwVHdWWGhaQlh1U1pQ?=
 =?utf-8?B?Rk1Fd0FCbUh2T0ExeFQySm1CL3F4NGNaSi9FdGlZdG45eC9BSnlvUW9DR2lR?=
 =?utf-8?B?cmRhRlpxQmxOOWhBZkQrcWZRV2EvbmtNS2owaVpYaUVmRURrMVF4L0JrL0Mv?=
 =?utf-8?B?THdmN2ZBTmNRdk1VVCs3VDBqb2s2U1NGdnFuSG94MVdsTWl0L1Uzd3pKaWFW?=
 =?utf-8?B?dXJraWZ6R3N1VXMvWWo0QSttbWFpMEdBUWRndm02bEJ6QmRSYTFYa0xKWW1u?=
 =?utf-8?B?bGFmcENyYXdwcWhnaXViWjJyNldZSm4xOFFHK0o3NXhtaDB0SUUyc0JId1RT?=
 =?utf-8?B?dXRZWCtVUWptNWFKWEZBcFdEdWdvdExjbWxENkdhUWZJcUEra1VITDUzUXVh?=
 =?utf-8?B?cjRtU1J6UGJjK2hFZ0NjZHA5VlFoWkhFZzVqT1NtdmFtOWkwWTl3Mkh3VFRR?=
 =?utf-8?B?RFoyekJOSWhXeWZtMUZCQkJOdE5zeWdETjNhS0g1WmpHN1REMmlmVzdhVWc4?=
 =?utf-8?B?RGNQWE1FejFEcEh0Smwwa2pSNDM1ZDNhUjIzMitOYjJKaFdBT00xR1pSL3JE?=
 =?utf-8?B?R0ZxYmtvUUVFeCs2UEFsK084bXNWWFVHRTdJU1ZpaHlNL2hSZ1M3VWE0ejdr?=
 =?utf-8?B?TUYvODlQV29LOENjMGJJMFdORnhDcytkRGp5Zjd4T1IxQ3dDT29LV01ZZnM5?=
 =?utf-8?B?TWcrKzZZQ3d3M20rTkRvVmxLZ1ZlVUxQSnZ5clNvMzFqdEJXaHR5d29RVndx?=
 =?utf-8?B?REsxVmxPS2c0UnFIRk1mVzNwdmFTb3hMaWlyZ1N6Z0VoWHcxU2hmbEh6NTR2?=
 =?utf-8?B?U0p4STJ1cVJsbnFRUGc5MVZUY0dyWjBXZ3NHcXBHdlpsdm5Sc2tNK2xLbFQy?=
 =?utf-8?B?TThheDYxSXNzaEJmeWYyU05yTHljM1VTbnl1UklRTUhQUGhFZkkrUHFnYVV2?=
 =?utf-8?B?WWxCWWw1NytoY1cxbTlsRUlYSXJBb3VCTUJyUXVsbmV0VFduTDZSYXZOTzJo?=
 =?utf-8?B?UnJoYTRISjVqMERHMUpDOEQxb2hWS3Y1TW1UbTBoSVNpRWlRWk9GWTEwMEk0?=
 =?utf-8?B?c1dFTDZzWG03WHpLRW02bzg1RWtrNjI3aldQZDY3VzdrY2FuVmFUd3VKVVpS?=
 =?utf-8?B?Zmx3UXN0cnJZYllSajNkbjNYWkFUVGIzN0hXZnJOcExhelJudXFmUlRCd1RS?=
 =?utf-8?B?b0dkR1J3RFZucTNXVnkvWHNQTFVtTXJKRlp1RUxJUVhUSHpMWStMUk93RGoy?=
 =?utf-8?B?ZlNxT3p3L0w2aEhodVd3TXdSNUxqSEpvOGtpcEgxTzZYdFIvWEllbGRMQzJz?=
 =?utf-8?B?WE00WlQzTmswOGxlZEhlTTVhVXR2T0w2YTVJU2JiUW1abVhlc0xuN0hMOTRL?=
 =?utf-8?B?QThSRkpZcHR5TnZTQkRtWlRnRGR6SzdNT2Y0VnpZSGRQY0pRYWJPekkxdkxh?=
 =?utf-8?B?NUM3eWczdDdXcDdoUVA3VndEQVFENjVuMzhrT2x2ZnVxa00reDhBaW1OZU90?=
 =?utf-8?B?UjRkNzRZSUVleklQQ2VweWtIUnBhUitJQ2hkN09IeWc3eE13dW8va0lHem1C?=
 =?utf-8?B?VjkrVVRVUkZKZ2J0YlNCaDgyRWVnRmRjOGhDKzFSZHBwYVFRNW9rV1lESHNz?=
 =?utf-8?B?eElENmk4SXdHaHFWMjRBSU1ibSs3L1hpUTZNdWRnV0hzNUNVVFFsTGdiRVVy?=
 =?utf-8?B?MWN3Tm50UHYzTE1pMDZPVUtLUGFYdjF6bUhYQXJ1Y1ZuanQwQkNIQVBSYmtE?=
 =?utf-8?B?N2dVd3N4SHRyYUhDWjB4M2lpMU0vR0ppRHVCSlZnNUdadlp1SkJXR0tVamZ5?=
 =?utf-8?B?Tm1MWTZsWFkrTGxvTjZsdmxUSDZNNzFSRk11KzZxTHlkcnI1YUZNdFVEbVd6?=
 =?utf-8?Q?9U4g0zMoA3NXMgCoWZL5O+g02Q15Yw=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(36860700013)(376014)(35042699022)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 10:57:10.6196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bcce5a9-3b47-472d-6299-08dd6d1e1fd7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6362
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 10:57:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213721

T24gMjcgTWFyIDIwMjUsIGF0IDA2OjIxLCBDaGVuIFFpIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDxRaS5DaGVuPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+IA0KPiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+DQo+IA0KPiBUaGUg
cnVudGltZSB2ZXJzaW9uIG9mIHRpbWUgaXMgZGV0ZXJtaW5lZCBieToNCj4gYnVpbGQtYXV4L2dp
dC12ZXJzaW9uLWdlbiAudGFyYmFsbC12ZXJzaW9uDQo+IA0KPiBCdXQgdGhlcmUncyBubyAudGFy
YmFsbC12ZXJzaW9uIGluIHRoZSB0YXJiYWxsLiBBbmQgdGltZSdzIGxhc3QNCj4gY29tbWl0IGRh
dGVzIGJhY2sgdG8gMjAyMTAxMDUsIGl0J3MgdmVyeSB1bmxpa2VseSBmb3IgdGhlbSB0bw0KPiBn
ZW5lcmF0ZSBhIG5ldyB0YXJiYWxsLiBTbyB3ZSBhZGQgdGhpcyBmaWxlIG1hbnVhbGx5IHdpdGgg
JHtQVn0NCj4gYXMgdGhlIGNvbnRlbnQuDQoNClRoZSB1cHN0cmVhbSBnaXQgcmVwbyBoYXMgaGFk
IGFjdGl2aXR5IHNpbmNlIHRoZSAxLjkgcmVsZWFzZSBzbyB0aGVyZSBfbWlnaHRfIGJlIGEgbmV3
IHJlbGVhc2UgaW4gdGhlIGZ1dHVyZS4NCg0KQ2FuIHlvdSBsaW5rIHRvIHRoZSBzdWJtaXR0ZWQg
Zml4IGZvciB0aGlzIChodHRwczovL2xpc3RzLmdudS5vcmcvYXJjaGl2ZS9odG1sL2J1Zy10aW1l
LzIwMjEtMDEvbXNnMDAwMDAuaHRtbCkgYW5kIG9ubHkgd3JpdGUgdG8gLnRhcmJhbGwtdmVyc2lv
biBpZiBpdCBkb2VzbuKAmXQgZXhpc3QsIHNvIHdlIGRvbuKAmXQgb3ZlcndyaXRlIGEgZmlsZSBp
ZiBpdCBhcHBlYXJzIGluIGEgZnV0dXJlIHJlbGVhc2UuDQoNClJvc3M=

