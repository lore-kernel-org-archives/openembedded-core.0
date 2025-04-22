Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F14C369D3
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 12:59:15 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.66])
 by mx.groups.io with SMTP id smtpd.web11.39167.1745326751118726065
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 05:59:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=KwsQHny5;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=KwsQHny5;
 spf=pass (domain: arm.com, ip: 40.107.22.66, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Q98kOJddXpHCxjvVo+C0bQS8Npm2pv5RtdRqyxeVlHV1Eho+6S5v5X2yvk7KXaBlY6vV29gmrewdNUoyCzHYrQr3r6GdEmAFjt0O+EScOOwnB9ECVmPvXTB/V+e3OkaRn2nzsOXalUjML0EC5KIdYMqaitsFW/NBiOb9en5rP9n5AEWxPo38qn7MVYNyN9vnqWdj8khdlhvtcsEwlnelTGI4CB5qV3KocYlQD/ibprL+LhTi19vj1J54cbGhF6L+fk3S9QFhl+vp4NMN9mjPh4fp5i4WvAlzQV2HM/ObRj3aiq7U+0EOvQLY1Zw0P/uS2G0VRFKLE3diMB9rBfcLsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NN5Xm662+52D99RC4WHhsLrVz1L9dO5beehxANUOz8s=;
 b=E/UKoaO7rfsLIW/oo+dy9JJvYEeLBFMkb5M/OPY2qAaitekOpgThesu8Jii/vRgQqHezrGGatjiAXdQn6pOaeqj4S8gmUa58M9w/sz5L7qLySs89mSmsg21YNi/9E/j89OdyE7uRV12byw4Dv+kvNz4R3iuM8W81vHkcHll+H34Red3/0CHAhxwXJXB3kvkja54/zRemS57Z6ZQEI/QojfBCdlH3JbI4m/BJF+PIvNKgO66hynRp1Mr75ZFKKVsrwUV6H8ohm2nKbO2rtH9qbtCvv4M/tzD1rjqDHCumPFbniTWhJ2/hYmOBXX3ztqjCALOvQ4z8p9ppWWGcb0ZHBQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NN5Xm662+52D99RC4WHhsLrVz1L9dO5beehxANUOz8s=;
 b=KwsQHny5CllZpfknMxoNM8K1Be0zDIQL4XfLDUHxVtEtfpHm42MkboeDuqlnXuBWirXOIBXKduXG7I+OaaVix44fNnDzEs9hmKYZKmsScyL69i4k2aTXY9QH8oTMxBLbECPMGupITo3tG+vz44FTYW31PorkF508+UN11RcPloY=
Received: from DU2PR04CA0008.eurprd04.prod.outlook.com (2603:10a6:10:3b::13)
 by PR3PR08MB5785.eurprd08.prod.outlook.com (2603:10a6:102:89::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 12:59:07 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::bf) by DU2PR04CA0008.outlook.office365.com
 (2603:10a6:10:3b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Tue,
 22 Apr 2025 12:59:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Tue, 22 Apr 2025 12:59:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bfPAP8jKtMlMz6bgGmM/ijkg7Z0VCadkbnluIzxl/6dT0EpMycjFvE+M8miziK/qhR10ykJBDOcVUn9M9fn1NYzWmqRgsUbN10UtxZN8MnJ+wCYu93CtqDyM+BQNGhoEAjhKS46t7bycdsoTuS7f/kfHFZqbgDygEwVvgCwY8zt2R/bzzNtRbz5A1f9BCuGYPEsc682t+HNhlzdArrHDoMym2DygpkS4mlnD5rMIjtz34CCuI7qOfLh4WWD0SLotBEWBF2eyr04S/sUlLJ6cvD4pGZvrxefkwPn2FMAzPH5+EVl8ggs8R/m1DQXJK/iFVnqbOgoaDxSKZ/b5q/mumg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NN5Xm662+52D99RC4WHhsLrVz1L9dO5beehxANUOz8s=;
 b=ZSRPCE1BoaVv5NiO+7ewg8otx2ls1E6DjTUx2lubvwkQBaA1WPmbzL5doHcMkgROEDiQneSRM2gTaVpfISevs8/x7LAT88c7H0UHi/UzoJNn/ehO+jMcvO8t+r8rEIZLPYL6TnYoLhVos6eSWw3f1Yc0iOGOZREGQmxp4UC4VffOqTmpY19+QaR7yq6GZz1n4cajXQz0k+7pJaW5zggbh/8bRp/SkVQYv8DCS/xpnnT3PAqGe7lzfdtlyRaoFjCOCuHqjMPVSfqVi+e/d13jTOHNm+YabgX+30R3qRl6+xhcfABdAdaIxTiwnVNWRtQ1/UN784JybfriNVmaBLOGZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NN5Xm662+52D99RC4WHhsLrVz1L9dO5beehxANUOz8s=;
 b=KwsQHny5CllZpfknMxoNM8K1Be0zDIQL4XfLDUHxVtEtfpHm42MkboeDuqlnXuBWirXOIBXKduXG7I+OaaVix44fNnDzEs9hmKYZKmsScyL69i4k2aTXY9QH8oTMxBLbECPMGupITo3tG+vz44FTYW31PorkF508+UN11RcPloY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8656.eurprd08.prod.outlook.com (2603:10a6:150:b2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.34; Tue, 22 Apr
 2025 12:58:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 12:58:31 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Koen Kooi <koen.kooi@oss.qualcomm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] autoconf: upgrade to final 2.72 release
Thread-Topic: [OE-core] [PATCH] autoconf: upgrade to final 2.72 release
Thread-Index: AQHbr6v9uoiKvnuafEKeLa5ew4Fon7On+PMAgAdoGICAAEwOAA==
Date: Tue, 22 Apr 2025 12:58:31 +0000
Message-ID: <BAD77261-0590-4FDE-9B66-867EBD9CB242@arm.com>
References: <20250417151813.2295435-1-ross.burton@arm.com>
 <AB3E4ECA-B3F8-4221-9988-7606C0FF1C3C@arm.com>
 <F1487D3E-B2F6-46A6-AFA2-011D6F05FFCE@oss.qualcomm.com>
In-Reply-To: <F1487D3E-B2F6-46A6-AFA2-011D6F05FFCE@oss.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8656:EE_|DB1PEPF000509E4:EE_|PR3PR08MB5785:EE_
X-MS-Office365-Filtering-Correlation-Id: f302b862-21fb-4a10-68eb-08dd819d763b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?R29HOGIwb0x5cXFDalpZRk1FQXVJZ294aGE1MVBBZG1SUTV5ejYrV2lwZk1G?=
 =?utf-8?B?VG1yQXRCUkpnRWR0RHpZK2tYd2tyTDViMVMzdEV3M3IvQkRVL25laUlNYjZK?=
 =?utf-8?B?SUFhR1FDcEphVVpzYmViTk5DVE03TkdsRkkxYStBcU1DOUlOWUJickdmelBK?=
 =?utf-8?B?MTRNdXkzTXk2K3dNTmlJSVJhL0w1aVJteGRMVDFTTUZKWlRjcnpsK1BRREJw?=
 =?utf-8?B?N2NNaFRzYm9vaHdWYTdvSitFbjBJV3ltSUthaTFYTUpzUjIrbVViRTJHcWIw?=
 =?utf-8?B?ektKQ2VDbkZheUZVK0JKM0gwbHkyUndtOCtKZmFnd0c2Q3l2cnA5aFU5WG02?=
 =?utf-8?B?dUJoMUozV3ZLMW1GM3BVTUtsMmEzQ2p5amUyVHlTT1BCMW1JMVg5Rnc2Skls?=
 =?utf-8?B?MXFBS2NaZ2xCQ203VXd4STdYaUdZQUxZWFJ6aXRqWm5KV1VPUlgyZnloUHMy?=
 =?utf-8?B?TTJLeTBwTFlnTFRqeUQ3cXczSWc1QlZSUU1mL1JyVmpuMVk1WW1hTGphaTF2?=
 =?utf-8?B?dlArd3VVODdQTU9yOWgxMFF5VWViTnRUcmVXNkl4dGlYd2dkV0Q2dEpXKzIr?=
 =?utf-8?B?QWhjOWM4UlZLMUlUNEtjTy9wZ0FwdnVhSGs3Vi9DWjVGc1Vaa0ZPY0d3WjJr?=
 =?utf-8?B?QnkzLytuTUwxbXB6NjBKYllJM0RqN3VQQ2dZdldMekJSWTBHdHVmNGtMbXpM?=
 =?utf-8?B?QWJYelpBOEMydFBLc0UwR25GVDZab29mQmh6cmVxL1FvY01FM1BOS1pXeGQ1?=
 =?utf-8?B?WnEzWGtKaTJXajVsS0ppSWJMVWJPVS93ODNMTEZHZkVlMTV3ODk5V1FHUVlu?=
 =?utf-8?B?eHd2WE1scklsOGg0ZXRoTU1jZk9GMTlxL29CQWVuZmFGR0FzWGUzVUpqeFlW?=
 =?utf-8?B?VmZoMjd0UnJST011QlU5Ny9VZWlGTnpxeTRJa2VCTTJVMDlSTGlpczdVZmVJ?=
 =?utf-8?B?elp4Vjh0Rk9aNS9zbUhBdGsvRmRZSDdtdk9DcUgzMTl4emdzS3hnZjNpaEVP?=
 =?utf-8?B?NTQwZmRYcjY3SS9sNGNZbFZoY0pKZWVUZDA1Q2RIVjh2T21kNTd5YUUrclJy?=
 =?utf-8?B?RFJEMWRqKzdFZk13M0lTQUR3enVJMzhRNzJ6UE83WHVGSkFEZ3YxcGpLWmxj?=
 =?utf-8?B?WDNLanlnWDI1eWlnaEtsSlhSNzdMWnpzeVR1Z3VuckxTMTM5LzZOdE1CaEg5?=
 =?utf-8?B?dmpLQzREU2oxYml0WjdzMlJmOXFYcjRHUEhhWCt5NGYwUXFrWWk0UWt1WFQv?=
 =?utf-8?B?RVpDakVWd29aa3gzeFNTMXR3dG9JRmhhbitRUERlZG1JM09XUUVWNW9BVjFJ?=
 =?utf-8?B?VGxmN0NZK2crZk55a3hRUmtMeUxWZkQ1N0pCNWkxK0JRRUVNc2o1a0IvOFIz?=
 =?utf-8?B?c0l2TlpHRWhGNzZYeWs3ZzRkZEJYUkdRNUg4dkFacDdvSWpWbXZ5WDJGNnFz?=
 =?utf-8?B?UEsvaHpMeFZKRnhFOFhuUzRNNEhPN3hpT2VQUXhOMkJnTU0yKy9xYzFtWGNs?=
 =?utf-8?B?Y2VySDhPMndGRDBwZFVjaE10WTNsQnQrRUJUUmxGME56VmFpL1Vqb1VVZVNJ?=
 =?utf-8?B?YXkrUldmalNzR0Y3cDNJYVFMK0RITzdpclp2QUhCTWtWTEJOQnB1UVk5TEh4?=
 =?utf-8?B?b1lPRmI4b3lmTU9seWVESTQ5ZjFOTC9BZFk1SUFWaDlVeTNROHlva1BZbzky?=
 =?utf-8?B?YWVpdTBSeVdxZVowSVk2aWZjMXI0Q1dyZG40d2FkSk95bEpCcDM3MzFTbjQ1?=
 =?utf-8?B?MTFjRzk2NGhMUnN3MytrcW52TEdVUURGYUJ4S0dLNHYrMGVERUxBa3puZnAw?=
 =?utf-8?B?UkF4Y2d3YWJEMzhzVGhUV3hkeXpGMEUvUXNEZVZ1Y3U2em83Z0sveHp2WStS?=
 =?utf-8?B?V3JyZ283bFhtcUdZMzZTOVdXWGhSQlB3R2xkYjF1NjZUY29XNUtWUGpnZk0y?=
 =?utf-8?B?TGpSb1prT3I2NTg1Z3p3bGYzaEY1dXNIaldXVSt0ZUM4OC9sQnEvRUdkU3Vz?=
 =?utf-8?B?eUxhZXpFQVZ3PT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E393455BE68A444E8747F7C670A20AD4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8656
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b0ffa255-0572-48f6-27a1-08dd819d6283
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|35042699022|1800799024|82310400026|36860700013|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MHlUdlo3d2Jhd2Z6aGN6OUVWbEc3M3E2a0dyYUR0RWFFVFFSTFFjckl6Tno3?=
 =?utf-8?B?SUNYaEVEczZBNW1QV05TUHhLVjV5KzREbm9HczlsWWR4ZzV3cVlvZzVFa3Fj?=
 =?utf-8?B?eGM4TkMvQ3ZlKzlTMUx0MkdrdW9nZTNGZ2MvdzFWb2Z0WFE0NDgwOExoQkg4?=
 =?utf-8?B?bW9yRTgvUHpra0YwQkRZYk15Y1RUN0toSlQxUnhxZ1NZaytQVHFLZUl1QVpE?=
 =?utf-8?B?TEV2SjV5VFFXZEdXSGJ0NGFQemluQXREMThOeEFwR2NnWnp6K3VQaHVFd1FN?=
 =?utf-8?B?SFljZzNjTmprL0QrTkZ5UGVQZ3NkMEFKOWROaTYza2FId05OMG5XQjdkQUlY?=
 =?utf-8?B?a25waU51MUJyYUdiTTAwT1JEOXZUa2lZSHozRjFtS3pTSktxSUg3bkI3bnZq?=
 =?utf-8?B?dkZpZ2N5VkJremwyRzJUWFoyZDRxMk5MRTZweWJCQmNEQ1RUS1pGcFRXZ3Y0?=
 =?utf-8?B?UVlWMjQ1eEVDMlZjTzZtZzd4MjR2S1dhUUZxODdoNnJWNGswNWJHSWhnSlhK?=
 =?utf-8?B?b1hzTVh1eHFwOThxcVVoR3g3SzYxYVFURnNXbThBSDRNQTlXSFU0UTArNDlX?=
 =?utf-8?B?YTVOMWdCbDJIcUV3bEUyanZ1cWtER210QmJOaG80T01yQW1DbHVTYXZhY2pC?=
 =?utf-8?B?UDBPcEhSZ1BnVndueTNFUnNwbVJNUzRwUmVhTVU5R3hwVDc2Z3dVV3cxZFp3?=
 =?utf-8?B?djlWRnhhOGttK0Y0YWl1UFZ2ai9UeFJMbnI5NU1zN0w1ZTY1WnBhQ2VkaG12?=
 =?utf-8?B?QlVhS2hnME56S0w0VXQrdWlOZk9ON3I5OC82UEdKeFRySFg5eTFONld4MEx1?=
 =?utf-8?B?Wk5yNGhHcjlnRVZ4NDZZK09jTUx1bUNZYjhSamZVQytVeWFxWGRLMkt2VUli?=
 =?utf-8?B?dGFVUyt4TnRMbVdWTkFVZlE4M08yK1ZMeXpJT0VKaElBdEN2ejZZM0tyVHY1?=
 =?utf-8?B?aEpJdzdoN3JmS2l5clQ5d1FobDVYaElTTGk3SHdBZnZBYzV5Y2hkNHJVdkln?=
 =?utf-8?B?WjN6anZTbXBlTW1kT2E1SXY3dmswQXpBd1cwRy9YM3NiNnc4THhsOHowN0ww?=
 =?utf-8?B?RFB0RUIyRFlmdHAvbWNPZ1pKc2xla0tiU1FkdHRDNGZ2MmNLTnRyeG5VaGtX?=
 =?utf-8?B?b25ia25WbXMzajBuZDRaQy8wUVUrdnB0RjZkN3ZBMlZMNC9LRXM1OW0vT0ox?=
 =?utf-8?B?dVlGcWwvelo0bDlHNE9NbS9yODB1YlpLYWZMV21KTDRLQjJ0WnZBbE4yNmg3?=
 =?utf-8?B?ZStxbTZTdmVBN1NDTDcvTnlXalVCbXl5YzMwN2VGZkw3RDNGcE9xMStYS2FC?=
 =?utf-8?B?NXUxVC9VMzZKbVhEdjl3ZDA3UENGd0N0SWNFRExIbzU1bnhpcEJCUXdKTXZn?=
 =?utf-8?B?dytMYk5JZS81czNEUkRtZVdtSHZUVmdYSG1xeEx2VFdGSmd3Q3hSWFlQOE9L?=
 =?utf-8?B?YnNFODVzaWd3Nm5RVk00RE9YMS9NTzJJYW5JUk1xTUdKSEx4M3ZmY2NmbVc0?=
 =?utf-8?B?eVpzUWRjbjdlNnA0UThESFRLOFdhbUNCR0NDVDI1Zi80UmFQWE9vSEE3dlZk?=
 =?utf-8?B?dkwxbTlnN3E5RkZsa01hRkI3ZmQ5REFLOW1KaWp3bnV4RmlGclk1eCs0NGFD?=
 =?utf-8?B?czF3WTBMQlZCYzNSSGM0WkJ5dTQwN0RvOS9vdkJsdjY1SkthK1dpdGxhbktP?=
 =?utf-8?B?c1I3a3lOaWVaTFBjOEduWVNYWFdWdloyNjI2Q0UxeG5IakVZOXNEQjVnRlIy?=
 =?utf-8?B?b3ZlVjNYa3NaZmQ2UWhXeVkxRmxMbzR3dENXNVAvRnBVdFZ4b1RoZDUyR0xQ?=
 =?utf-8?B?eTFmaU52TzhmZ0hRcUE4My9iNjNwUVBuNzlWYytTaFZZemo5dERuK2cySUlo?=
 =?utf-8?B?ZWVVT0tQZkpuQTZxTTNWME9OU0oxMCt2aFYrL3lTVU1yR1JjUzBNOHQ1aEJq?=
 =?utf-8?B?VjFWNDFqOUpVSXM5cEhSVXlGcytNL0NHOHlsaTlEbGsveS8yQTZPVy85MTAx?=
 =?utf-8?B?V0RrYWxZLzlRS29kbUtWK2gxWWtkTk90UUhESVJDMlkwVFpEMXh2L0VHNHJv?=
 =?utf-8?Q?QCKMlK?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(1800799024)(82310400026)(36860700013)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 12:59:04.9463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f302b862-21fb-4a10-68eb-08dd819d763b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5785
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 12:59:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215205

T24gMjIgQXByIDIwMjUsIGF0IDA5OjI2LCBLb2VuIEtvb2kgPGtvZW4ua29vaUBvc3MucXVhbGNv
bW0uY29tPiB3cm90ZToNCj4gDQo+IFNvLCBlaG0sIGlzIGludHJvZHVjdGlvbiBidWlsZCBicmVh
a2FnZSBhIGdvb2QgdGhpbmcgb3IgYmV0dGVyIHRoYW4gc2hpcHBpbmcgYW4gUkM/DQoNCkkgZGlz
bGlrZSBQRXMgc28gSeKAmWxsIHNlbmQgYSBwYXRjaCB0byBzZXQgdGhlIFBWIHRvIDIuNzJlK2Fj
dHVhbGx5Mi43MiBhbmQgaG9wZSB0aGF0IHRoZXkgbWFrZSBhIG5ldyByZWxlYXNlIHNvb24uICBX
aXRoIHRoYXQgaW5jcmVhc2VkIHVnbHksIEnigJltIG5vdyBoZXNpdGFudCB0byBiYWNrcG9ydCB0
aGF0IHRvIHdhbG5hc2NhciB0b2/igKYNCg0KUm9zcw==

