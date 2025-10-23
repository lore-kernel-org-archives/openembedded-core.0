Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80ABCCD1BE
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 12:53:42 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.23])
 by mx.groups.io with SMTP id smtpd.web10.19379.1761224014484936511
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 05:53:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=q/yzVw6l;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=q/yzVw6l;
 spf=pass (domain: arm.com, ip: 40.107.130.23, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Q0jJGK3zUcogYmr2mrcVkajZRnM4dfX3GW8FDh1wj6xQx+Xq3vPif/BT8gkvtWYkdFbY7xowASLTjbmlwL5fe230SUbDaKllubRFECbsItdItDX5tqEO9C0Ymoe9TvTmmsoTEUPACFBjf5okMJcjOa2+niu0pnTsJ3zHXmJAyfztkhqRuH8w8//HeLVfqzIKDIvMdtWzz4j7dZqNT+x6B+gKsF/Zrxd/0SnqxvqFp9B9BNFKy3FyC6m8uQFb7BlesK8QNioFRky+7Mvm027htA7gZo0kQ38PAiOYAWqqMhIYeFt4hLCss+5UJx3UgRdvtntpvIS64zeQLB6Sy/oLow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aj/2xQk+lqzT6nG3yJRTSzp9alFFOP4veiO7EiGB9gY=;
 b=ZCHJWWTlg/OXtewujJIhAtD7CwEv8V+tvoZEGgHYZNfuc1OOez+pVHfiP4HTZmtFLO21+b5WFmuEWnzJ7xd5JTE87yi+3weSfGdBSQYcZsHoIQhsiv4bq020gAShBhUGBaa6I2hcSUpSkHZFzM6YuWlHr8NAEAr3cN+04V7dce7cJEPY3Nu4i2FgV1suWUheRuzPo2tc7j+J2ZX3SJ75TkQYyG3XXgjTfaK6/UePagbjfG1xwOmrI+6xSaL+eL0vJXByH2GJZzjcA6VfZdYEcE9Mu/B+SDgXJk77VlkMiCWb+zmTelqS3jpweJJ/fQWyNTDOcSEBZQP+5vCQRh1b4A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aj/2xQk+lqzT6nG3yJRTSzp9alFFOP4veiO7EiGB9gY=;
 b=q/yzVw6lkM8k0qrdVTjKlxa7TV/8hDUkEcXjzjjH96BpGj8Hze7aIQmT4ToxygDObjfyDWgtL/3m6QeNpnP1rVH9H5VaA+hqCfCimFcewW5BapLhBGkashdVcKeU2ekOlgwlhFIcWbBXfHCky8p8JmLUKZb7yKwhlZzCkIs5LCk=
Received: from PR0P264CA0067.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::31)
 by FRZPR08MB10926.eurprd08.prod.outlook.com (2603:10a6:d10:13d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 12:53:30 +0000
Received: from AM4PEPF00025F98.EURPRD83.prod.outlook.com
 (2603:10a6:100:1d:cafe::70) by PR0P264CA0067.outlook.office365.com
 (2603:10a6:100:1d::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 12:53:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F98.mail.protection.outlook.com (10.167.16.7) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.0 via
 Frontend Transport; Thu, 23 Oct 2025 12:53:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vWF1DltO0ITkp7x4wtoFAs7R+Hdg0VZi/HDu6ccFZ0kHJsBvUN1rllEy46FgovQB/CAwjSmKyv2mWbeFSQZQXB/OzI9Wb0Vvp4PpwJ3I3XgF0nfjX50i9a0qb57veMO0j5VJhQ0/WjlehlAyG77CsCyZuczhlZUWi0Co8v8l/A6IJO4y0yEPB18pQ3n3MZ9ZmrdDWXTOzri65rwMnngP5fUzj9dAZPPDUR46eJhXlZpLytUwvULBVGlFIy1T5KVaAkRcgurndA6aFjeesHGVKUkcXTUTc60iJzu+jPw6DccG6TPZHHkMsH0WqiPKhWBOCIn2PnRWL905CCXVM37fTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aj/2xQk+lqzT6nG3yJRTSzp9alFFOP4veiO7EiGB9gY=;
 b=QO1nHQTyp7FleHsNmvdhZtIU++o0VCQUN07Q1iRR5g1rph74KvUxWeVkdTonNdJ5f71Y2AueE9FzL8bIAg5gyxz7w1ezh7llevqtjjlQr8PNWDGWe8/HpDT3CkS9iyQE6lskmYrafD1rcJWekPeips/8gGfIgIXZlwr+BDrYkQSLKL56pj/cetgoxpR1X9K3XmKX+8mLpPW2dQ2ffMuBb6eEltIsHsuArRftzLPLHMdIWE0TyjMRDhaeNLFbXyaF0k+euI/1WRcH7PGSl49e60QQhawWhyqoPgfYhN1mYzEGY+P0O3vfx2uVtUbTgKVgn5Ag/0g/cGr9xb7tgU58kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aj/2xQk+lqzT6nG3yJRTSzp9alFFOP4veiO7EiGB9gY=;
 b=q/yzVw6lkM8k0qrdVTjKlxa7TV/8hDUkEcXjzjjH96BpGj8Hze7aIQmT4ToxygDObjfyDWgtL/3m6QeNpnP1rVH9H5VaA+hqCfCimFcewW5BapLhBGkashdVcKeU2ekOlgwlhFIcWbBXfHCky8p8JmLUKZb7yKwhlZzCkIs5LCk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB7882.eurprd08.prod.outlook.com (2603:10a6:10:3b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 12:52:56 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 12:52:56 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] classes/toolchain/clang: Add placeholder for
 dynamic linker in cross-canadian packages
Thread-Topic: [OE-core] [PATCH] classes/toolchain/clang: Add placeholder for
 dynamic linker in cross-canadian packages
Thread-Index: AQHcP/28JfAFcpvufEKuM8LSEaQfa7TPt+AA
Date: Thu, 23 Oct 2025 12:52:56 +0000
Message-ID: <94242022-56F6-4ECB-8B60-28B76B643F8A@arm.com>
References: <20251018070621.3456800-1-raj.khem@gmail.com>
In-Reply-To: <20251018070621.3456800-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB7882:EE_|AM4PEPF00025F98:EE_|FRZPR08MB10926:EE_
X-MS-Office365-Filtering-Correlation-Id: de6895e2-e871-4a3a-676f-08de12332af5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?aGQydG81cWFXOXRDdzF2ZzNIVDhkaWFPK1U2WDd6dGlWaVAwc1hMbStDVWtE?=
 =?utf-8?B?NVZraUxjd09XcDM3ZDNsRFpWelQzVFpxTDlvYmZpT2drbmZCT2dCRzZ5MTdn?=
 =?utf-8?B?ZnIxdEUzOWRjbTB4VVFTSm5JaXl2ODYyUDMrc0kvTFY1Ym5kdTR0dFh0OEVa?=
 =?utf-8?B?NnBvb2I0RksrbmNscjJ2K1l5bTZTK2tkaER0SGQ0NlZCUmxnY0krWDRPMmZz?=
 =?utf-8?B?MVBVSEh3UFZqRjBWREwzcWhaQmhINXVlR2lnMHllYnpoYWowcGdHOXkwVnNv?=
 =?utf-8?B?WFM0bTJJRGxFcjRBVWN2enczZWltNUpXK2RNZms0bnNGN3g0K3dXY1BqSDl2?=
 =?utf-8?B?SEtCTnBxNUVGc2tmN2hldnFmMUwxc25temlxZHpxb2VjczlOYlB1TjFkVnFu?=
 =?utf-8?B?VWF6QzE3elBkc3F5MDEyYUFud1ljdnBZV0sxNmZZdFNiMGpSYmtDMWN3Wmxq?=
 =?utf-8?B?VlFpYkJENGxSckZPazRnQnJvN3d4cWZzSmcrcENVWG4wWGRwdXdlKy9Mem9v?=
 =?utf-8?B?VW44MkZjemprb1NYQ2tjRVE3alIvVEJhQUo3dG8ydXRFYWxmWkdaSExiMkcz?=
 =?utf-8?B?c1BwOFZkWmR4Um53RVNMaE5CbGlVOEh4ODFrU0NNTXlXTkplTndvQWIxczBj?=
 =?utf-8?B?aXJ6QWtzSVBzSGhwTEZuZ1BzR0l5aFlBK0JBeHF6L21pVWkvbUdOekFGZjFL?=
 =?utf-8?B?bERYNmM1U3YzQkNPazI0SktRdGk4OVZ2Mm9MaFhlSURPOUVnQ1hncUJBNmNn?=
 =?utf-8?B?bkYxZHZUakxVbWdUU29EVXoxUFZqUDVobGJiaW5kbXN2NVRlQVMxb0dVdC82?=
 =?utf-8?B?WW44Tk9EOVU0UjI3emJrbjl0ZWlPQ1VLOWxNd1dYNTNuUDFzTTJvalJUTVJx?=
 =?utf-8?B?bVNSdXgwc2wwVzRzNVljdEp1QVpOY2ZTQU02Y3ZZVWFJMGtWckt1WUE3VFNM?=
 =?utf-8?B?TWFySEx4SVJzQkRxQVNwTEJoR2VWdFQ2QVhpTE8rQ3JHTFBnNGxVZWRuUDZV?=
 =?utf-8?B?M29DQnFtTnYvK1IwZnV1azEwMFFhYlVveU5RSGxJWWFCVXNSQ2drcXV0Y0Vk?=
 =?utf-8?B?WC82Q0R3VHhZZFFaZ20vOWxMNWE2VUV2MkRFNFo0Vk1xSnpjU0RWVFZqS0Jj?=
 =?utf-8?B?T1RER2tBdlJXZEgyZHV3WkJybnhnYTVzRmhwVXBoWlhHVjZBTVFaVmFTY2w2?=
 =?utf-8?B?OVkwdktUSWJxb21HYm5BMDFYbG1GL0F5czh3VjNzRVZKT0EwNDhTcHhCY3ZL?=
 =?utf-8?B?dnNqUjFyaEZDSFhMMlpTcmcyYWlNVWdsKzlaQlhhdiswWW1rWnhuZEJZUjFE?=
 =?utf-8?B?eGtmZ1FPemVuaURwZzBWS1NHMDRPbGFiSmhmRzdMWHJPdWNaZ2YyRDM3K3g3?=
 =?utf-8?B?U0g1d1BaT3hWT0pjSjFTZjFjQXllQ2NPdXNVdzMrclBoM1lFK3dRMnBHN212?=
 =?utf-8?B?eUhwQkptNkRqNGZSc2VuMUFRcEpHSytveG1NY083RVA0UzRadnFEbVhqRFU4?=
 =?utf-8?B?bmw2RFVXMnQ5WWxtTE1xS3ptKytUdEtTd3dGanh5WjJHZHJjK1ZkamhrbkFN?=
 =?utf-8?B?bTErYmZTa0xCUkFIckJwdGRSTFRIZzUzdG55RzVzNU1XT2d5NlFRUzB4QjBz?=
 =?utf-8?B?SXM0VW1yaHQ5azlVUGV2Z2lJRHNsNmtobFNSK3RwUGVGS1lFWlE3cE9FRW1W?=
 =?utf-8?B?MEtjeUQ5eGdvRE9YaVFaSXpNZDBrZ1lvc0NldVpJYThXZW53WkN3eGV2WTBq?=
 =?utf-8?B?WU9MOXRFYWMvRE1xZTJVTDhTNjlJK2EzTXZFN05OUGwwQnQ3ZkZwVno1ZExh?=
 =?utf-8?B?L3RhdmtKRExGbEgvSnMwbC93cWMwK0hBVVRRdkZHMlVuUlpEY25KMCt1N3JH?=
 =?utf-8?B?RHdlYUZFUDJxU0QrSlk5M2o0bXhUdDFzNHZyc3RLdVJkR0owV0hOU2JISUc2?=
 =?utf-8?B?OVE0NlV0UW14VVo0WFRxNFRtejdoUlRNcEZ3NTJhaGUzRVI5TDF6N09NZDda?=
 =?utf-8?B?RGE2bUc5bDQwcWpWSTRCRWFWUE93YWhiL2d4K3JOYUJSaEQrbHdMcUNnWksv?=
 =?utf-8?Q?1slqsf?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FECFD9CDA8813A40A40487FA64DD51CF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7882
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00025F98.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	066f2e86-cf24-4790-3c47-08de12331685
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|14060799003|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aTBtUTJuQW5ydG1xSzRLb2lHQm9kc3Q2WFd0WURwTnNscnNtRExXSERiMnpT?=
 =?utf-8?B?V0tjMGVPTEZ5eUQ2ZGpvS1BGMzl3Vk16QnhiQnJFbGp3SGpnSTdXakhReUJK?=
 =?utf-8?B?UjFGbzJQTWFyZ3k1Y1ZsdTl1a3RrRDExaHhlSDczSjZ5ZjFrMXpWbGVPOStV?=
 =?utf-8?B?OHo0VDVINmY2OGZKZFFFSVoxQXJwUHBpVXRHdHZkbDgwb3VGL3FHV2ZyYUx6?=
 =?utf-8?B?S3VrdTVUWmxqRkNvaVNhUWdnWHFvYklkMXFuUHRoUndsK0JqYm9YUWgxY0FX?=
 =?utf-8?B?a0RuY0VhWDBTR3B3ZUF4TFlIbDRPUHNOdDNIWTdJMjBxM3RVQmVtY3BBdmpv?=
 =?utf-8?B?Ky9tbENwVzh5K1NpZHRuSmw0WGxlR0M5WUhnNGNyTkdPYTQzOHlENGpQbWQy?=
 =?utf-8?B?M3BSYnE3WkE2QkFHbWkvYlZXeG55ZlhmVjZKbHpYeStnbDlPMHJBN2lxTTRs?=
 =?utf-8?B?K1NyQmdjYVlJdlZJdjFsWk5Qd1ZRSEtHZTdOMEo5MmhvQ0Y3cWpJd3dJeUho?=
 =?utf-8?B?bSt1RW4wNk16STN0ci9xcGdRQ1NhNDlLc2RYVU93SnIvTGFqYlZyZXc2ZGNs?=
 =?utf-8?B?eEgyQmI3ZWJPY1ZkSWlHSlJSamJRb1ZRQXRsMStiemREcGRoNlA1QmlCYURo?=
 =?utf-8?B?UVVJT0U4eDQyZEVuYS9lK29RTnNrenAwRlpwbHNhTjRIUmNadHBQNlFrcXc2?=
 =?utf-8?B?ZHNDMzBOYitKYUtyVW9JUjJjcmVtTkhsM3IwWCtaUmZ6eEN2ZHVGMlVlYjd4?=
 =?utf-8?B?VGVTN2wvRGFpVDRTckhHN0lqbThnUXJxbG1GZloycTJzd2IyMGIzNGROSDY0?=
 =?utf-8?B?bUY2WDNWZmE3QmkzSHRWZEVHK2RQYm5lc091NVE5UzJEa3Noam9vRHBxdUdO?=
 =?utf-8?B?bkh3S0ZhOUVpNG1ZdHplQ3dyNU53ZUhZQm15MGNCdkRxeVVPdkZzWUhZOEMv?=
 =?utf-8?B?eGhzcFBpRFdOQ1Qzd3RyWDNFU2t0aFloSlplOHFJMkQyVHR0K0lYRmZiU2x4?=
 =?utf-8?B?QlIxMzJqUGZRTkFNbnVSK1FLQ3JXK3BHcUhjZ3FuWmVxUk5ncnVvQkdSR2l6?=
 =?utf-8?B?TzY2Y3gzdU95akN0RVdRZ0JWb0RSTU9QUVJ0VURnaitSZ3JZY0lxZHcvWnhB?=
 =?utf-8?B?bFhlWms0NEJFbk9uUit4bHhrd1gyQXZMMm9DTnROS09iU0JiTllFR2svVEJV?=
 =?utf-8?B?eGZVKzkvU2Y0ZHVOTHlBYy9yTEZQOTRiNzk0d2xEbENGZUdOZy91RHhONmNU?=
 =?utf-8?B?dURSVlRHQURpbGtvSHFSdEdqMFFYTFYrWEV6REhqemZhcGRyTHFaZko4K3NR?=
 =?utf-8?B?VWRyYlZJMmZ6WWZYUStxSitxTlR2MXZjV2FFNGlWWWJsNlNodWk2ODNTTmMr?=
 =?utf-8?B?REt6MVd6TXl5U2JZbWY2YnhIbVNlb1RKYzZlaThEUjZvS1Fpb2h6TzBmb3ky?=
 =?utf-8?B?VGpxcEQrbXp0a0NjS216NURIR3lleXBkKzNack1iMTZlVzBHeFphL0ozU0Z4?=
 =?utf-8?B?Z2ZnS1dsc2g4eDVHTGRUdkE0QTNoWVcyWW01QjlseDZNWUNoWHBGaHJzbFcy?=
 =?utf-8?B?cG1zQkM1K3hBY2E0eWR5TWQyL0o1ZStGTDZnS3VuSmVjU3dIblg3R3JQMDRy?=
 =?utf-8?B?VXlCVVJGWm45cFpQZHltRkhlenJBYWNsVFF3UmJXWFo1WG5vUCtuTGZ0Y2hx?=
 =?utf-8?B?bzRyUWpVME0vVXI0Z2lWaFMzenhvdFQyY0ZVNGZiR0NHaTltT1NCUC9wVS9B?=
 =?utf-8?B?Z0hXQ1UwRFplZWJLVXdoSmRyTVYvSWdIZVZTSWZUaFJuZWNtdy95Uk9qS0Rr?=
 =?utf-8?B?TWFpVEtjSmRUc1ZHMkVFeDZuR3d1Wmx2bzlDalk0cWlsVEFFVlRLMjZOTWY0?=
 =?utf-8?B?eTJjc2pDUVo4R2tpd1VBdi9TdkJxWkc3MGNxaUxXK0lwOWdQdkFLOHdHSjVT?=
 =?utf-8?B?RUhSM0RIUDd3bW5PRXJ5Yjk4SEl4UUlrL0xTNDFhbnVYMVBFbjR6WkNIRmhj?=
 =?utf-8?B?bVhlTXFobThXUFZnd202VzJxeXpJa3ZVZlhRbTA3M3dHK2svVlJCR3IzSHl3?=
 =?utf-8?B?NW1BVkZObmRIYjV5eE0rR2o3Y2N6aG45cWp2NVByMFgvZUFoaHB2eUMybVB6?=
 =?utf-8?Q?n8mg=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(14060799003)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 12:53:30.6096
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de6895e2-e871-4a3a-676f-08de12332af5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F98.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10926
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 12:53:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225255

T24gMTggT2N0IDIwMjUsIGF0IDA4OjA2LCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiANCj4gY2xhbmctY3Jvc3MtY2FuYWRpYW4gaXMganVzdCBzeW1saW5raW5nIGludG8gbmF0aXZl
c2RrLWNsYW5nIHVubGlrZSBnY2Mgd2hpY2gNCj4gaGFzIHNlcGFyYXRlIGJpbmFyaWVzIGFuZCB0
aGV5IGhhdmUgaW5idWlsdCBkeW5hbWljIGxpbmtlciBzcGVjcy4gVG8gaGVscCBjbGFuZw0KPiBi
dWlsdCBjcm9zcy1jYW5hZGlhbiBiaW5hcmllcyBhZGQgaXQgdmlhIGNtZGxpbmUgb3B0aW9uIGhl
cmUsIGNyb3NzLWNhbmFkaWFuDQo+IGJpbmFyaWVzIGFyZSBvbmx5IHVzYWJsZSBvbiBpbnN0YWxs
ZWQgU0RLcywgYW5kIHRoZXNlIHBhdGhzIGdldCByZS13cml0dGVuIHdpdGgNCj4gY29ycmVjdCBT
REsgc3BlY2lmaWMgbGlua2VyIGR1cmluZyBTREsgaW5zdGFsbCByZWxvY2F0aW9uIHByb2Nlc3Mu
DQo+IA0KPiBUaGlzIGhlbHBzIGNsYW5nIGJ1aWx0IGNyb3NzLWNhbmFkaWFuIHRvb2xzIGUuZy4g
ZnJvbSBiaW51dGlscy1jcm9zcy1jYW5hZGlhbg0KPiBiZSByZWxvY2F0ZWQgY29ycmVjdGx5IG9u
IFNESyBpbnN0YWxsLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdt
YWlsLmNvbT4NCj4gLS0tDQo+IG1ldGEvY2xhc3Nlcy90b29sY2hhaW4vY2xhbmcuYmJjbGFzcyB8
IDEgKw0KPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQg
YS9tZXRhL2NsYXNzZXMvdG9vbGNoYWluL2NsYW5nLmJiY2xhc3MgYi9tZXRhL2NsYXNzZXMvdG9v
bGNoYWluL2NsYW5nLmJiY2xhc3MNCj4gaW5kZXggYjRhMWMxODBmNmEuLjljMTIwNDE3MWZlIDEw
MDY0NA0KPiAtLS0gYS9tZXRhL2NsYXNzZXMvdG9vbGNoYWluL2NsYW5nLmJiY2xhc3MNCj4gKysr
IGIvbWV0YS9jbGFzc2VzL3Rvb2xjaGFpbi9jbGFuZy5iYmNsYXNzDQo+IEBAIC0zMiw2ICszMiw3
IEBAIFRVTkVfQ0NBUkdTICs9ICIke0BiYi51dGlscy5jb250YWlucygiRElTVFJPX0ZFQVRVUkVT
IiwgInVzcm1lcmdlIiwgIiAtLWR5bGQtcHJlDQo+IA0KPiBMREZMQUdTOmFwcGVuZDpjbGFzcy1u
YXRpdmVzZGs6eDg2LTY0ID0gIiAtV2wsLWR5bmFtaWMtbGlua2VyLCR7YmFzZV9saWJkaXJ9L2xk
LWxpbnV4LXg4Ni02NC5zby4yIg0KPiBMREZMQUdTOmFwcGVuZDpjbGFzcy1uYXRpdmVzZGs6YWFy
Y2g2NCA9ICIgLVdsLC1keW5hbWljLWxpbmtlciwke2Jhc2VfbGliZGlyfS9sZC1saW51eC1hYXJj
aDY0LnNvLjEiDQo+ICtMREZMQUdTOmFwcGVuZDpjbGFzcy1jcm9zcy1jYW5hZGlhbiA9ICIgLVds
LC1keW5hbWljLWxpbmtlciwke2Jhc2VfbGliZGlyfS9sZC1saW51eC14ODYtNjQuc28uMuKAnQ0K
DQpZb3XigJlyZSBtaXNzaW5nIGEgc2Vjb25kIGxpbmUgYW5kIGFyY2ggb3ZlcnJpZGVzIGZvciBh
YXJjaDY0LCB5ZXM/DQoNClJvc3M=

