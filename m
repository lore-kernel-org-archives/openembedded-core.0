Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF0A3D29C58
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 18:13:52 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41036.1768846427767209027
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 10:13:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=o2jQAiEZ;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=o2jQAiEZ;
 spf=pass (domain: arm.com, ip: 52.101.84.8, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=PSGxwE8+6ZckxpeHaCnxobWuhZj6oipFZheFiPQZvFC3pChVg/+tB4bDR8LU2/101w9DHDO8YR4PKD98xf01OVQ1OLKVXOr3N5SAvYarb2gCpq8Lf+1xxyXlisb9kC46Up3XfLiYaG7TZgP8GS8lVdTyMxWBoOvl8/NK0ozfD7vQXT/qP0ggYkMyF0S2/7p02laD1vp8Qb5WAJ0moBtZvxcg9BJPZjsYpUn0e0guQsedC3QFcjKKnWwqwnyqxkcAbzRvkXt2b3rx68GKSgdGvcgS9gHOsi6Dh/OMlyFSVk3YecopTIfw2H+KKG3Uiyyf46yGBKb70LDGa4cz4QCU8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CzOloF2s4Osg6PZNtvFTu4b0JrfSKf4u4W2TnKCrmN0=;
 b=i5iOhtAaxSD7feifUGy7I6qfYgj20wDShc+G26AUx5CJJjP1JJUwjwjViRBDuZ7wC7NFl9FZkxaYB5g2+sCGoupIj4cjzF6aauFjvMxREvyElxHzz1NGJjYa9HBn/mbYxJ9CyhN8qjd1h/aCkD+rfD4aTqMVU+IN2hntd1BTcUQqpTgw+JADpKbd6OVU0rKe7a8jxeIr3mE/FBD2MJR4UKMy1apDX7lPahqF/ShAji8bc4uFWUKJpIfoOQKlmNJNaliVI4GOlu8ymhEQCBFbzpUVZE0+5D0Fpvgvlq6V7nxDt91hop93QC0oaJKC7FhKqVwwL3FEHa7qFcUM5Bqc8Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lge.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzOloF2s4Osg6PZNtvFTu4b0JrfSKf4u4W2TnKCrmN0=;
 b=o2jQAiEZlNbTdeGTztTTyEMHSplEW8y9quGsNnR7YHxendE7+1lAkuIyh4oI8+oZNhCfE15Kbi8cVLsU4MYIIfhlp6CRfe7G93Eo3MLxP9AhJvjwMpDMFb6LWNLbqo5FAgu8EI209KffSu9B5rJVRgefHtkuAqiA5gqjKliraAk=
Received: from AM5PR0101CA0032.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::45) by VI1PR08MB10121.eurprd08.prod.outlook.com
 (2603:10a6:800:1c4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Mon, 19 Jan
 2026 18:13:43 +0000
Received: from AMS0EPF000001A3.eurprd05.prod.outlook.com
 (2603:10a6:206:16:cafe::40) by AM5PR0101CA0032.outlook.office365.com
 (2603:10a6:206:16::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Mon,
 19 Jan 2026 18:13:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A3.mail.protection.outlook.com (10.167.16.228) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Mon, 19 Jan 2026 18:13:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CHBjQbddo9uz9aUuKUHIKuMhEEA+JYcRVE5D7PqYIn5U7eyfzjeOB2UmmkmPQG326qPO77+zCqD3jQtzazi1MfGZq73RGrwRVbLwk29txiVzgCSOS9Aqjyk1oa4fV0/pNxjOVlwKHPbm4OTpGoP4XUkV1J04puHUNUqenRl1sxUYW3rf7XLE/FZq6kaWXZJ+WcsHDbVGQ6zTFJMrm9LHjkbmuaueaHjGkPoGcdCGojjH5+s6ivGs0yJRIXGsWgmNUa3bNntquLQ4KXpBoTNGPHf+RZxaxC0ig7HIdcKzXQB+d+hv4JT9MlgeH03w2asnSLnm1Mgq1RTJS/rTVFvs3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CzOloF2s4Osg6PZNtvFTu4b0JrfSKf4u4W2TnKCrmN0=;
 b=KekaVsrvHWRy2GDin+jQohKQG2ngcodzFrbmYijYvkK0X0mbEC9vPI219xhzWiWpNV0jXFjbrSq8W2Tm3qUL/XobvTzbC+45p1aa0iiz+eKXippkD12z+40YV186zUDZdIWpYheuiT+KDn9e2EqZacZIl7lfSKiuDVJiCbTscrI79fnErmeWhZ00nmhas+EMSnWyB+ELm9/42Y2NL/SwBNlMwkKRgwDLPQIQquJ5vG19J8G73ldaxyAW79kzdbkZkrfEGXzd3qCls7BKUg0RA01KVIJttLvy1evMAproYmRbvnvAlmETEvPKJ8HRzxgH3nR1tcyThrt/PvwZW/T1Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzOloF2s4Osg6PZNtvFTu4b0JrfSKf4u4W2TnKCrmN0=;
 b=o2jQAiEZlNbTdeGTztTTyEMHSplEW8y9quGsNnR7YHxendE7+1lAkuIyh4oI8+oZNhCfE15Kbi8cVLsU4MYIIfhlp6CRfe7G93Eo3MLxP9AhJvjwMpDMFb6LWNLbqo5FAgu8EI209KffSu9B5rJVRgefHtkuAqiA5gqjKliraAk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB5PR08MB10255.eurprd08.prod.outlook.com (2603:10a6:10:4a5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Mon, 19 Jan
 2026 18:12:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9520.010; Mon, 19 Jan 2026
 18:12:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mark.yang@lge.com" <mark.yang@lge.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] llvm: enable LLVMgold.so build by adding
 binutils dependency
Thread-Topic: [OE-core] [PATCH v2] llvm: enable LLVMgold.so build by adding
 binutils dependency
Thread-Index: AQHchdb9BADmyvKPIki5rGNYNrJhRrVZ0qIA
Date: Mon, 19 Jan 2026 18:12:32 +0000
Message-ID: <437B0EEA-925C-40BD-BA9B-7773BBEEE9F1@arm.com>
References: <20260115042452.39219-1-mark.yang@lge.com>
In-Reply-To: <20260115042452.39219-1-mark.yang@lge.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB5PR08MB10255:EE_|AMS0EPF000001A3:EE_|VI1PR08MB10121:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ddd150-19cc-450c-440d-08de578679e0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?eTNZK2JCNldLWnQxRUZGV3NIWE9CaUZHbGp3enlraXhwZXM1REtaZGorSDNr?=
 =?utf-8?B?a0FhSksrTDQwYm1HUVlRb1dObjZDQUcva09aM0dSd2lQS2luWXZaMWNnU2J1?=
 =?utf-8?B?YU94dkQ2NUY5Tm9tWDVDczgyeldvTmtYM0RlMDYvRWlGNjVTMDFIWGp0WW11?=
 =?utf-8?B?VmZVUVdHUzJ4L3BibStBbjJrOUFISXo5VkxNTEI5TmxHU0YrTjh6RjhWa3V5?=
 =?utf-8?B?S3NBQTNGSGVGNWtYZEJvV01qdTlTd0dWbEFWZmhoanBNSUVra1hEeDM2eFQv?=
 =?utf-8?B?bkxZdllSa1FWUXRrME8zWDgyMEdBYmR2cE1YWEFFZzdpeTZtSzFFMTFFMDZu?=
 =?utf-8?B?QmdLc3NlK1VwVU9HWTVWSk1zL3B4bW14YUd5NnMwazFNc1BmcE5JSDgrTEM3?=
 =?utf-8?B?OEJVMkpFMEF2NjZYVDYzNWhpaUlSMnd6RXhKazVGTnhyR0YzWHY0WTJqR1BW?=
 =?utf-8?B?a3k0cHNnZFkzNERHQTI0a2V3VURrMExkdzRhc1BHT1RqNmYzN2U0bU1hV1lv?=
 =?utf-8?B?bXNwV3YvQUFzdmlBUHdwb1hodjM0UzFOZGxia0RpeUVCejNTa2YwaTVnRC94?=
 =?utf-8?B?a1pUanVLL0k3OFhCLzZFdDNOd1NNWXVubEZpZjhxeGtiNnFwTVE2N0dRNkds?=
 =?utf-8?B?UUY0MEZOMGxKREpGZEFNQ0pRQjBoY3c1UEpLM2FRK2phQkJ3YWw3T01TMVY1?=
 =?utf-8?B?NFplcUpja0VlTVpSbU9Ma0dhcFZXWE1CdXpvdEtkL2VESWxTcVdnQUNNT2FV?=
 =?utf-8?B?c3dhMzZkY3VVQ2NmMGlNNTV3M2ovSnQzZjdXV0pNenZxUGtUTmI2R3Myb09o?=
 =?utf-8?B?RFd5UStKQlgwK3JHd3NZNUpiUi80ckU5N3lRREUyL0dNMVZuODRiVUhZc1d0?=
 =?utf-8?B?akhWV21ySTdsS29sQ210cTFwSlVLcG80OCtYQzJ4TFAzaVFpVmNiN1NoYnEz?=
 =?utf-8?B?eFNzSDlhLzNZdTB5SjlOYXRSRXJCZm5HMURQUHlIZGNlRHdJdS9KR0JGWEE1?=
 =?utf-8?B?aHpkSVhUbVlrU3lhSTF5OTRQbTdvUnphSklKekltdkNyUjhDQVlON055cGhq?=
 =?utf-8?B?OEhiZmhzY2ozbUpBdyttaW5rNGhHNVNMRWUvbEpNQlhWcGRBUDdQV0VCcmdj?=
 =?utf-8?B?aWl3VnFoT05OMlRjVmJJQVNPOFRvOEZLbWF6MUpOaWlqa0U1SEVROEVFVCtV?=
 =?utf-8?B?anhsajlkTG9zTXIwY1JwTUIyN3N0cjZYM2tFM25uT3AzOHBDVzFicVVMNjlN?=
 =?utf-8?B?RlRVU2dZazQ5cDNDRVNhNUxHTVk4d2ZMemhjWEh4WEl3anY2amtlanltVVdZ?=
 =?utf-8?B?aWNCYllNY2RYQUtFcittN3dsaFdTa0hWNkdVSGRiekVhK2Exc3FiZzBRT1E1?=
 =?utf-8?B?dnF6U2c1a3U3b29rUGtsWWtseE1Sem1NQVUxK1RsU0FmTk5XalhvdVFVQ2RL?=
 =?utf-8?B?cTI5WDUxNGE0UTZ2b3Erd3ppYzFmNU1yY01HUHVYVkFIU2QxOXNRM3pmRXda?=
 =?utf-8?B?a0xIdWZSckhha3pJeVA3RHl1aGF3RzN0bEd5YUpoZmxNVHNCci9ZTXFDcVVQ?=
 =?utf-8?B?bEZPZ0QveGFZYi9OQy9xdmFXVEpRUGtQY2FEaEhoYWsvYzE1OTNVbUdRTCtP?=
 =?utf-8?B?VzNlYUw1YnB4SS9tdWYwczBHZ1QxTDh3UkNVMFFjazJuWmdwaDFOY1VZbTAv?=
 =?utf-8?B?SmdFTjQwL1FsRjBDSG5ieTV3VWJPd2NGMGJWMWdZQXg2NHdNWElBRWJCS3Fa?=
 =?utf-8?B?L0pYYU5FN21PdlVzb2JTV2Zrd0JmWFRTeis5UUlPU0t0NGJoaWNCQ0xNeEdh?=
 =?utf-8?B?dW9UWEFjT29CdVphMVh6UjZpNk9ad0NTMHRvMjRibThGZ3d5NzBiR3A4d1NY?=
 =?utf-8?B?U2tKMDliMjZLM1lKeXFWZEZ6cWRiSnV3czd1NkhzVWtNZitSYUZXUGpsWDVX?=
 =?utf-8?B?dTFMdDV6b3hUMDlVaERLWlFPZ012T3hDOS9xK1hSb3NxUUFGVElVbkpEeEx6?=
 =?utf-8?B?ek5Bc25SOXRtTXAvVjVaUTYwN2J2YnhnZG1ZcHFiR1lUWWh6dzg3aFU4U3Zh?=
 =?utf-8?B?L3pzS1pDRmcrL2tnVHM2aS9UUHZCQjVzQ0hQcU5mcU10Mmw4WWZoM1JTWGIv?=
 =?utf-8?B?eHJwNTUwY2FpSmkyTWNvVVgwUWdWeElCOFE1RklscHFCY29YVk00ZkNBdVhB?=
 =?utf-8?Q?O+yy36ImtMF65446ag9ykMM=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4EB54EF5901C245BF98395549452E7C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10255
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	71a2619d-7313-4835-942b-08de578650f9
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|14060799003|36860700013|35042699022|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RkVWZFlaUllsRDhWUHN4TSszWktweVBNcGhKM3ZjZjV5RVEyQkJ5TVlwd1Ez?=
 =?utf-8?B?d2tJcGM1dncyaVRFRFo4OS9sdjBwejY5UTd5bkx0WXpMUXVNMWpkN05xUUxP?=
 =?utf-8?B?dUppKytONkJKbVdsazk1QUEzVHBjNEROUE5oMkQzTERKYkdNeHh2QjFBUmRZ?=
 =?utf-8?B?a0cwWnRWZHVpL0hOUlU5K3VHenZ5cTVZNWgxWDRSdmtEQm1Wb2QvditOYTVU?=
 =?utf-8?B?YjluUXh5OXA4QWkxMUs0aTF1WUlKRGZCcXhEOHRpazRnSWFWcCtobG12eEds?=
 =?utf-8?B?ZGdZVFhPTmpXWVMzNSt1OUNhQkJuRUJmZXNER1hKUHFSVjdLWlNwaytsNHdT?=
 =?utf-8?B?TXEwendDa1dTVnl6SHlXbGVTZWlPQm51YmxIWDRnV0xMOXloRHJvRHNGTjFw?=
 =?utf-8?B?RENWUFUzd28xdUlpT09DZU1VU1ZtQ1ZvUURqc2wwTGNmM1pXL0lqSEdIaDJY?=
 =?utf-8?B?eDBPWWF1Kys3WHpPWGRDdHNqeVBrM3JkZkFYNDB6UW80ZUJMQUMvN2ZWcWtL?=
 =?utf-8?B?eDdDSDNEVHhmZkhEYnY3eEVLSnlqd0VOaGl2dWpOb2xYdEJTT2lLSlVrSWg4?=
 =?utf-8?B?YlJyNksrdFhKVng5MHpNN04vOHEzM0NqS253S2ROODJ0cktRNG15cWJ2M1Ux?=
 =?utf-8?B?Zm9sL0dsOHZ5aFlvZDhGL1VMbHBEL2hzbHJMbXVkUjRJSy9WTnVSM3BTd3Zv?=
 =?utf-8?B?S0QyaGc0cGVXUnVKaHJOcFpDd0RnSm81U0VPdkdudUk3MUIzYS9yd1h5SWVZ?=
 =?utf-8?B?Y3FKcFRoZlVoYXZhaVN6cUNYM21tUlZpajVmRmNuYjllVzh4Y2VEZDl5VFB0?=
 =?utf-8?B?bWRBVWxQM0FCLy9NR2pmWEh4U093eVhmU2ZoTXZvbmJOeVhaK25mSkphOFVK?=
 =?utf-8?B?N1BPNXB5WDNJMWtKUEltNmRNaTJOZlZjc2hnOUNQc0JjRmd1TjQ5UnlUOGUz?=
 =?utf-8?B?MkIrWHE0Sm4yU0lBRlc5OTJjeWxGUU03VE5kdy90S0w3dGtESklkd21KbHhS?=
 =?utf-8?B?OXFBQ2lhQVRNYzJuV1AvajRlVkhDeVRDa1FNTDZ5dFpKYjhaQkp6b1pJL2lW?=
 =?utf-8?B?ZjRBb0lnbEM4Z3dwQTAwNmdxb3ZaZ1pURDdTL0dFalozTFRleGF6NWc5YzhS?=
 =?utf-8?B?S0graHpGMFVGT0ZlZnozUm1lN1VRRFlOWVVoQlRydElMSkRYRFgydW9lYlRO?=
 =?utf-8?B?RkV2L2VsbU5QRmVrdFJBenVZd3dRYTVkZlgrZXdTdEJRaG9oWjRGdFZqbXhC?=
 =?utf-8?B?alVWQkNsNVNxRzZlbUppZmlWUWtOS3dFaUplNytPZGdXUEM4NzNTY3o5NGV5?=
 =?utf-8?B?bzNVMkNKU1ByTU1SMkNZbGFiUGZFZjZFQndITUxxU3M2QUFJMkRsN2p5OUVi?=
 =?utf-8?B?Y0RiK285OFRrWnZQRGtqcEFscVR5Wm1CTWVGWjdoOXJGSXBxSEZXNGhwOW5V?=
 =?utf-8?B?bzVESDFiK00vbEhyRmlFQ3FGQXdSa0FOb1JJYjZkTmlKUjlseS80b1ZFSHdV?=
 =?utf-8?B?ZG5nMUsrdVFkZHJtUUZJMThISlU2TVc3b2w0UEt6YURSRE1RdElIVVE1enV6?=
 =?utf-8?B?TEt5OVdFK3RKZkwydk9nVk5uMWJ2TUR4ZDMvQUFITEdBbDZYY0tFazR1ZDdH?=
 =?utf-8?B?ZFlDaUVpVWhWaFdhdUFzUXZNRkpRRml5czdqUTdsWVBKMTZ1TUVzRmV0YlBh?=
 =?utf-8?B?b0FjaTBnMDNVQUQwNmtMc1ZjeDFvU2JwQSs4bWpQbHdXT3E4R3hibEJ6UUpK?=
 =?utf-8?B?TlEvaDN2TDJFSkQyKytvYUhHRm5aMmhndi9xYm9lOFNDK3ovNVhHaFV2S1Er?=
 =?utf-8?B?N3hCV05qdndTRVYwejV5TlowVURIVFJlOTN2ZTBFOHBYQm96Y0pmeHB5WC84?=
 =?utf-8?B?YzRhNUhib1pBMmpoMHQwTHVnMXZTdDZCaHNEdmVncEZGajdENzU2Q3dablRk?=
 =?utf-8?B?ek1TNERUQkNNSEc5a1dGUk5XelRyc01SS1pTckw4R1NvVFRYRmRTSEJ1TDRP?=
 =?utf-8?B?Y3NqcUJGYnNnRDFwc0JTcll0VUtTMXFvaFRLSCtPL0xiREJtTDgyVTNoNmoy?=
 =?utf-8?B?WkloZkZVZU1aY0czU0lsajdLR0taRkdPRUc2T213MmRJRFg1T2hJeWtWeENs?=
 =?utf-8?B?T0hKTmtoakszNkswR2diMS85a0tJYjJJWThZTklTdy9HWWVMaWtCYmRBSzBK?=
 =?utf-8?B?cGNJamh5YXYxcnR3YUQ1cXhrREJyMnpyK0c3TGRuK0RWRGIwYWl5NnJzcGhx?=
 =?utf-8?B?R1N4eUVqWlBVWTJEeEllUG9BUGh3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(14060799003)(36860700013)(35042699022)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 18:13:41.4808
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ddd150-19cc-450c-440d-08de578679e0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10121
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 18:13:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229629

T24gMTUgSmFuIDIwMjYsIGF0IDA0OjI0LCBtYXJrLnlhbmcgdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgPG1hcmsueWFuZz1sZ2UuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiAtREVQRU5EUyA9ICJsbHZtLXRibGdlbi1uYXRpdmUgbGliZmZpIGxpYnhtbDIgemxpYiB6c3Rk
Ig0KPiArREVQRU5EUyA9ICJsbHZtLXRibGdlbi1uYXRpdmUgbGliZmZpIGxpYnhtbDIgemxpYiB6
c3RkIGJpbnV0aWxzIg0KDQpUaGlzIHJlY2lwZSBhbHJlYWR5IGhhcyBhbiDigJhsdG/igJkgUEFD
S0FHRUNPTkZJRyB0aGF0IHB1bGxzIGluIGEgZGVwZW5kZW5jeSBvbiBiaW51dGlscywgc28geW91
IHNob3VsZG7igJl0IG5lZWQgdGhpcyBsaW5lIGlmIHlvdeKAmWQgZW5hYmxlZCB0aGUgTFRPIGRp
c3Ryby1mZWF0dXJlIChvciBpZiBub3QsIHRoZSBwYWNrYWdlY29uZmlnKS4NCg0KQ2FuIHlvdSB2
ZXJpZnkgd2hhdCBpcyBhY3R1YWxseSBuZWVkZWQgdG8gZW5hYmxlIHRoZSBsaWJyYXJ5IGJ1aWxk
Pw0KDQpSb3Nz

