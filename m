Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 905C4C87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 12:31:38 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.51])
 by mx.groups.io with SMTP id smtpd.web11.86238.1754051496253903418
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 05:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=aOGt5VcS;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=aOGt5VcS;
 spf=pass (domain: arm.com, ip: 52.101.70.51, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HL0k4+arntqun74zBwIiyphar6UXRpK/uTzM1vgyTvQ3J0/wwH9Qqks/vEuoFzAtEcUnanh9viBcpl7td6oNe2hlMz89LKDEW3bXQSdN/R8F6ly/8h48fogM9Md7fHpW7GxCdnaS4U28sPAAA28p++Ga9bCSbbdhy5GwOIssB21aihENpc2OvRnJcUE5LlAD3gN4XFBLZlgo8eetdtcELuvmcpLYTd/ZH9mhaSQ5w5+aqcm6AoSjgbuTFfoOoVKdBq/EKrJ0v20X5f2q0wd19Rx2E3eA4MbWOkJkgHqJGdTItYMc/6hmnY9L/C/NhWS/n6//48Ji9K3jQMbqeQieVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwVBpJUGtsXRQhhC41KBaxvoRFxwMnpef7kmNvYU/38=;
 b=YNqYY3BC4SSrdDyEyYt6fgpg/cCyI1LA3uhVDoCcpCjPA9pAtNQURZ7nssL/hDniq69Pv5y/WiBfJi7WAbKRKHquOdVK3FYyV+lzsYHtdLORfDIciiNC2E2X9e5CGqMTebtlILpOkmpMDx5OzKYtRqRuFGbUeJOAzfIOR7s+uBGl/jWgRjnj1BMFNFO+KqbaFyaqSOJcYwgXSObPcm61vThLddn6VIhzGK3RO8fEJttYUAmp8ymIwjDxlx84DUChrWRLGgtDblfCVqAgbE239QUfyhGX7d1IKXXwr42z0OcYWRE2oExosD5pc8G+zu93DZ5W4FMBu4IE2eSiVIeLag==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=t-online.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwVBpJUGtsXRQhhC41KBaxvoRFxwMnpef7kmNvYU/38=;
 b=aOGt5VcSYxnm1Nlz0K4xKXK+A2gSzBufikxHr9x1DqPd/zZ0xNAMpPXGIPxB476KRYXwRv/G+hfyYj1xT5G0RUgJF36es6k84ca5MoOgMw/RYSbeUzPjkPV1zF1j1OXf4YxRFRDBsy+uC6TuznDFkpTX4Yvm/VqSoCluSBRKCPQ=
Received: from AS8PR07CA0037.eurprd07.prod.outlook.com (2603:10a6:20b:459::9)
 by PAVPR08MB8992.eurprd08.prod.outlook.com (2603:10a6:102:325::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Fri, 1 Aug
 2025 12:31:31 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:20b:459:cafe::e7) by AS8PR07CA0037.outlook.office365.com
 (2603:10a6:20b:459::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.12 via Frontend Transport; Fri,
 1 Aug 2025 12:31:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.8
 via Frontend Transport; Fri, 1 Aug 2025 12:31:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VYVIhLGjrr0GubGOjfrFo8gfdzHTtYDseKpAPzgJep6a2WGVscWnP9igXsDKz4En+apObeAMA65DJV4I0NzxsEZa5Gf69u9zu7w9w5/VLPslQT+B5V/GQrO4BODUBFPIxk1YyzFYFyr80mnIidHC05gBO5D76B96IivGhxtFvxTp2qzVQD0yjAVKKwIkrxo2IV8toZfG/HWB5jYlyORIjqVa8d961G/6iC2vrzym3aBzYPkP9ESYYDmR7i3082MKKIT196Q48/fgbytd7DVQhIExT+786n1NgM16CLBIUNjZrOlwmnBnnQXrXS9AHqZGT+nmox9xgphzca/JZWI6pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwVBpJUGtsXRQhhC41KBaxvoRFxwMnpef7kmNvYU/38=;
 b=n1xcid84g3DJt+inGqwwG4QfkjlqYNEOoxPXKCABESZaoyh8Lj9WmPFBwcl46KagWMymvhnNzfHG+4/i8LobqtI1TRa0/L249H0d4IbAMOQLp2USIGGYLeQjmlzlTGSj/sU8snAwulLpBhg43HqbJ4ZrdPU8HMh7BoPkEc4TYySzu489eV/rPEwThKkpRJswzykeqgVa/B/73yrbRZ8TBXqqBru5zX6iiWGeRXClDd2zfjTrl2V1QyvSI4LsXO8B4JEbW7g+5ZY1KIrgnh0zB7zo2dnHJnVC0qF+82G2iWl/rFifFX07ZaasBCQPZBisj0VZaeOsz/lElOaHvk8YpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwVBpJUGtsXRQhhC41KBaxvoRFxwMnpef7kmNvYU/38=;
 b=aOGt5VcSYxnm1Nlz0K4xKXK+A2gSzBufikxHr9x1DqPd/zZ0xNAMpPXGIPxB476KRYXwRv/G+hfyYj1xT5G0RUgJF36es6k84ca5MoOgMw/RYSbeUzPjkPV1zF1j1OXf4YxRFRDBsy+uC6TuznDFkpTX4Yvm/VqSoCluSBRKCPQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB8PR08MB5370.eurprd08.prod.outlook.com (2603:10a6:10:112::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 12:30:58 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8989.015; Fri, 1 Aug 2025
 12:30:57 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "f_l_k@t-online.de" <f_l_k@t-online.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCHv2] autoconf-archive: add backport patch to fix gl
 detection
Thread-Topic: [oe-core][PATCHv2] autoconf-archive: add backport patch to fix
 gl detection
Thread-Index: AQHcATSSPIsnYfAX0kuPjhVwYAn3prRNvc2A
Date: Fri, 1 Aug 2025 12:30:57 +0000
Message-ID: <E097FB9D-888D-4730-9BD8-E1F9CF76D37A@arm.com>
References: <20250730092958.383275-1-f_l_k@t-online.de>
In-Reply-To: <20250730092958.383275-1-f_l_k@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB8PR08MB5370:EE_|AMS1EPF00000041:EE_|PAVPR08MB8992:EE_
X-MS-Office365-Filtering-Correlation-Id: 51e38753-ce02-4514-cd21-08ddd0f757e1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?L2c3aGd4YmZERTA5K3QxcHYrdS9mRENDWm8wRGc0MTlCT2Qra2pXV2pBVWQ0?=
 =?utf-8?B?Mk00TU9qWHRNOFFpdEFBeTRXdkgzNm9rOFptbk9JUDlodjdIV0FYbGY3NG9r?=
 =?utf-8?B?L0p5S1JVNE9lUFhlM3N1VURYRkt1L0EwSDZlcTY0Ni9JVG5PdUdBL3VQK2xs?=
 =?utf-8?B?Rkw4ZFZFdTBwMGk2MVZUNnQyMTNVRmhkUzB6bUE1Q0pNdzRpZk9jazY2cTBa?=
 =?utf-8?B?VHhBMWZiL3pSeDdncDRpMlpVTExYak5uc2JJdVd0anZpUVNUL2t0YW1MTVdU?=
 =?utf-8?B?M1RGc2dTYnBsK080WFMwd2QyVm5CU1FHdHoxRGJ4dWxsNWV2MDVXZGtVSW1w?=
 =?utf-8?B?bVAvblBKME1rc1U3cStxcjhOcGRZeVJYMTh5cUNVeEx4bFI5aG5SWGFpSURO?=
 =?utf-8?B?UWVYT1FLZUNBOGsyWXl4UHJYUFgwaG1yLzVhcHYxS2JmQytDcXJpTmRseDVi?=
 =?utf-8?B?am12cytJbjkzRGUxSVRZcXQ3MVBsbFNWSWdFMTdERDJWclhvaXdOS0trVjdv?=
 =?utf-8?B?ZEhGQktoNG5wOG5waG45VHRmdytMaytNa08yWlN1MUorU0JPTTgyeldjZnYw?=
 =?utf-8?B?TDFxRm5pNlpoOVZEazBjNitOVUduc25sVHZaK3pvQnovTFNqeThNQ1lnY0J4?=
 =?utf-8?B?MXZOT2NGSjllWHhCRnBNeXN6TlFIeVhPOFNsTllBYlNhWHlQS3dSeDRhWVFV?=
 =?utf-8?B?d21iblk1ZlR0cmpxMkU2MGQreUVTdUpMRFR2NEwyKzE4UGo4TWI5b09rVHRz?=
 =?utf-8?B?Rm51YzdGNUwweWpaa0VwaVJHRlgwUFhCTDEwOVJpc3lvSVI1dGxCTG01T1dw?=
 =?utf-8?B?Z3NaRGdjbFE2OVpyUllEVk5KeUVzb3ZjYUt2cjNTendTZ0w1cTJRbUJJRkNz?=
 =?utf-8?B?VHRqWHlldDN5c2xycGxaamdHZlZTZ3lrNlZNRmlaaDl6QUhCVzFhYXNwNjBY?=
 =?utf-8?B?ZlVVVzY2NWVVcDlpVlVpZ29wellMQTFHQTQ5NDViRDZ6ZUY3eWhEV0hONk9W?=
 =?utf-8?B?bkpPbnlETDd1WmN3OGIwTFVqQ2RzNWJLZE5PcFhocG5Sa1U1djYxR05manhD?=
 =?utf-8?B?NmZJVWluVS9ValVXdVBYTUEvYmJ2cm9keS9oaVpXZ2lMOVR1T3NrYThCOWVJ?=
 =?utf-8?B?aGhsME9lRHRYUkRZOE9zRSt5TnNZTldtdHAvUDVCNHJDaG5VMnBaR0pwYUg1?=
 =?utf-8?B?ejRFcThwYXU5SWVMVHlLTGRaZUFrK0lCN0NydmdjYmQxcjJzdFJ1eDhDaHJQ?=
 =?utf-8?B?ejVsWTNGekpxN0NpNzFWbVNycC9DbjFJNGxzckVUeW9WY21xREdhaGVCSENt?=
 =?utf-8?B?VnZWbFhXWktsSTRGaG9QMkNycytPdWVETldnYUVMekUrVlhCYjJ4S3JZNXBE?=
 =?utf-8?B?bE9BeDZDbFAzUGhVRnRhUlZGTnFuc3RtekNnNFpWTlBjQUV6YktHQVB4TE5m?=
 =?utf-8?B?WGd0TEdrSHNJLzBlUy9lemdrVkdwS3pSZ25NYURBazdTNXFiMGZvWDJjQXp6?=
 =?utf-8?B?eTJobFd3dGxSWmsyVEhVc0hodjFkNGZqQ2lzYmlzdE94UXB4Vnl1Yzl6d09W?=
 =?utf-8?B?MnhVTzIrV2FBSmE2Wi95NGpiRldvbWQ4cFczSk9rSnZNTmlTaVBEejdiLzVF?=
 =?utf-8?B?NkJGcUNJOUhmQURrZmJzZjQ0OUE5YkZmanM4ZzYxZjFydHkzcC92UmlIck5I?=
 =?utf-8?B?SmlRZkZhNExINHVzcGkvdGk5ZHlHTlA0akJrcFZTd1JuUnZZV3V3T3BWa1NW?=
 =?utf-8?B?RHVYWFNVY1JITmcrK1RPc28veVBPVlZPVGVzZkJzL2tmdmZrRFpLdkRjVDFy?=
 =?utf-8?B?V2F1TjZNOXJSbVlta0lUZWtjNDJ2L0x1YS9nVm4ybVlseHRBano4MjdaZGVs?=
 =?utf-8?B?dWF6VDltckdxL0lFR3RnYk84aGZ2czZLWU8xUUFIRWJRZmlZWDh1WjV4T0tK?=
 =?utf-8?B?bGJCV2VsZTVRTHlmKzBPa08yTmRpQ2RLenNRYmFUS09MalhQYXpwVGRsZDhI?=
 =?utf-8?B?ak5zeEo1QjFBPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE3029CBE233A24BB8DF56AA6AB943F7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5370
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b5a7d55f-ed29-4078-c056-08ddd0f74452
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|82310400026|36860700013|35042699022|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y0h6cVVtNmhTaVQvZjlvRUdHYTJMdHp0MkQ0dm1QTWN3UzdBL25lNEZGeEg0?=
 =?utf-8?B?clY3M2szVjBGajRtTHZqVHRHU0hpNksveWVoazdGNFRxdTdUcGR2OHptbTh4?=
 =?utf-8?B?S1BOY082MTJ0TlY5WTZiTjE1QVVMWW1QS29rN2J1akRoZDJOMFBvcitoVHNO?=
 =?utf-8?B?REg3eFBZbGtPMHE2dUJjV0R0QWpSNHBJbnk1dm80ZDBGSS8yU3lTQjEzWkto?=
 =?utf-8?B?c0FNcnhtVGhWc3JBN0lWaFg3MzRLMHZkS3d2MjFHQnZ0dm9ZTkFNV3dmblh5?=
 =?utf-8?B?Wlg1ODRkaEM3cmVxd0dIK1RQRER3RHlTa041TFNaRFFYYWVvNWdKY2JCUENa?=
 =?utf-8?B?cTE5RW80Yk1abG45OU9mK2ZLLzZ0WGxqUG1oQjFucHN3WDVveGdkeFlrNy9i?=
 =?utf-8?B?eTlveXNVMGhtRHlDd1hTWk9STkg1ei9USklXamswaW8zVkhHZ05QeWcxdE01?=
 =?utf-8?B?WGhhWDlNN0NORE1CWThmZDJqNEsvbkJEK3NERlBIVkM3TEJmbkZpT1lVSHZ5?=
 =?utf-8?B?UVBnYmpUWUVnWlBMQTY5dE1qQ3Vta3I2QWMvbDdkQ1EvY3pDOTFmYzc4K0Vt?=
 =?utf-8?B?ZGZKZmxadUZtdjk3MlFKUVdSOWRTUTZEUW5zb0E1bTdKR1VoVHQ3NE1KUVFt?=
 =?utf-8?B?a1dEUDEwd0J6TUxwRFlISkc1Nzh1TWhXQmpGYVMxcnFjTnFySlJaSWQwYjBJ?=
 =?utf-8?B?ZUdqZ0tWNVo5Smt4Q092QjRuaW5pQ3JLT2NQdisycXZwaWRtTi9kQ2QzYkhn?=
 =?utf-8?B?b3JrOWpTVWJlcngxT2ZTdHdJdC9PN0dGU05xS21oZVpXMGw2MXZwdXpaZ1hG?=
 =?utf-8?B?M21CblgwaUdKRVcrRGxvaFVWL3Q2RHpTQm12ZDJkUzdXUmFqUXZocjFXNklV?=
 =?utf-8?B?NSs5VU1UNnplYTFjcjJ4Y0w0UEhNUnltdmVrTXFsZUpQTG9rSWk1SUdQTE1R?=
 =?utf-8?B?Mi9nZFZwM1dmakVXM201MDVDZTlXZFNWM3BadThhRkZ0dit1VWNJbmRvNEY3?=
 =?utf-8?B?M1lOQmc0dlZBRFZGbm8xdEJSZk85UlhOVU1obVFBOTFKVFhkK3ExSEJ0a0Fx?=
 =?utf-8?B?dnU1SkJyNUJZSjlVbVpGZjQvcEkzclpRaXo0dXRVbTg2R0NEcUZqUEw5ajY2?=
 =?utf-8?B?Q3l1U2lUTlE2QU02YjU4dm9MWEFkMjBqTFR2cDRTSXZQdCtYZEo5Q01aWVNN?=
 =?utf-8?B?c2VBK2xCZHAvUkY2eVo4ZTE2bjIrM1NMN0lJRmtGcXRzVlVkUWhFWkp3SjBR?=
 =?utf-8?B?UTMxYUg3U2djSWNqUytEMDdTai9qSExRMjA1amdGbExRcXYyUmxORkhNbW5a?=
 =?utf-8?B?ZXY0NVBTK0N0T1Jwbm9nV0dKcUtWakpncmRIZUdYTVo5MFVhRGwzRXRKTEZT?=
 =?utf-8?B?U1kxSGc2cmR2TGJGeW5vMFZhYncrSURNdVkrSGhudS9KbURqNFpwQXpPZUhv?=
 =?utf-8?B?QWM5V094NVFUWXJuTXFwVThvWFZ0R0YxT2wvS29HSVE2MlJOSXgydnJ4MURX?=
 =?utf-8?B?UEdvRmxCSWduQ01oRmRYQlRzTmhsVnR4cXIzcGU3RzJZbnlBekdaZzlld3lj?=
 =?utf-8?B?b1VaeXdGMTFBNjIxL3NzcTAzdU5aWUJGajdsVVNQb1FIbkRva2VadG1pdFJy?=
 =?utf-8?B?RTJXUUhaVS9qMzV3YzM1Z2hXdzJPOXJ0ZTlsWVQ2VnEzRDRPRURoem1aakxi?=
 =?utf-8?B?VjdEenk0VVI3aTZMbklJbmdzY2JGRUpOZ1E5QllqSHF2eDlXZ2FWQ1JDcVcr?=
 =?utf-8?B?d0VKQkZYMDg5b20vT0NxSSs4cUxRbzQremdjWTZPMDhLZmpUOUVGZStoYjdX?=
 =?utf-8?B?T1NsNkhmV3FrZDY2aTAwM2hjN1ZjL3RSUGVrb3o5VjNwcDEwb1R1NDVpM0ZS?=
 =?utf-8?B?bmM3aWRKZmUxb2ROYWtvZHZ0ZlplOFZ3OGJvUWNLcW14QWljd2NTRTJ1em1Z?=
 =?utf-8?B?U0dBNG5jY0tJQmFobW5jUnNLcWNadjhqeUppY0hNZXEzOVNXenppbjRTRXBp?=
 =?utf-8?B?NWFEeDRJMlE0SW9pT2dIOWRMSTlYWmUzMXEwT0hJUGNwdGpuQThmU0NCbld2?=
 =?utf-8?Q?l9nCOi?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(36860700013)(35042699022)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 12:31:30.5861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51e38753-ce02-4514-cd21-08ddd0f757e1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8992
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 12:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221240

T24gMzAgSnVsIDIwMjUsIGF0IDEwOjI5LCBNYXJrdXMgVm9sayB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8Zl9sX2s9dC1vbmxpbmUuZGVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+IFRoaXMgaXNzdWUgaGFzIGFscmVhZHkgYmVlbiBmaXhlZCB1cHN0cmVhbSwgYnV0IHRoZXJl
IGhhcyBiZWVuIG5vIG5ldyByZWxlYXNlIHNpbmNlIHRoZW4uDQoNClRoZSBzZXJpZXMgb2YgcGF0
Y2hlcyB0aGF0IGZpeGVkIHRoaXMgYWxzbyBmaXhlZCBhIG51bWJlciBvZiBvdGhlciBidWdzLCBz
byBhcmd1YWJseSB3ZSBzaG91bGQgZ3JhYiB0aGVtIGFsbC4NCg0KT2YgY291cnNlIGF0IHRoYXQg
cG9pbnQgeW91IHN0YXJ0IHdvbmRlcmluZyBpZiB3ZSBzaG91bGQganVzdCB0YWtlIGEgZ2l0IHNu
YXBzaG90IGlmIHRoZXnigJlyZSBnb2luZyB0byBnbyBfbW9udGhzXyBiZXR3ZWVuIHJlbGVhc2Vz
4oCmDQoNClJvc3M=

