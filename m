Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52CFEF06E3
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 14:48:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26614.1770562109865090038
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Feb 2026 06:48:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Dn81A3vf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=649997dc9b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618EmTKS1966730;
	Sun, 8 Feb 2026 06:48:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=69v6wI1uNL8w4BER+Co5ByO+t+p0hreLnK6vHl8zZN4=; b=
	Dn81A3vf9Y8qLQqciN0PmENoQos3c9Qumsy0JkKFkZaqn/XwjfzLUKEWsqlPq65e
	0YF6YbuZ/cZd3J1nxY0xxhmzUcXwHD1oKHrFPD8mhQ98g/7UkCqQ7u9ApE6PhcXO
	a4XkyG/xH4pBVZ7ZCauuOOBYnq4dKPS7R61HAMEHGF5e5O05P9Lfy186FkxrnXfZ
	5qTL8Tul37ERraSPn2qk1h3a+QI0Up77/8Uc1fcMZHYSQYdkisJ5UxS6rpLI9Hfx
	6jIeu6ErCZAKIHMCzOk9oNfpVYlKPPmmZl7rquKeytZqWiySmezZmHi/0dHayt3d
	Rm3af0FFKng/muWzSgXdmg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011034.outbound.protection.outlook.com [40.93.194.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c61j4rv1v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 08 Feb 2026 06:48:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDuDdJOP6hjMXQBRmbO+DW94U9jw/ch7sHNtnH+fBxMgDfBZp8RVDpv+N38vFbQGtCQBcjeyhnjoX1x4XvQP2Si5s80QwDhMUeiiPsRf/pzeKVP7fi1Xq8fVNCyyc5f8xDle/8pptMq7RHSNGwh/+r8bHjRHQPOyPYQN5f43ihOdJRxsJnxSLD3oepF6pAl48u6M8n+Y5n/+QwtuZPcOTBtXKzTeo9D/DT1/Gh7tkxng1vgejQx9him53upuorizmWn+oymqwJfxqYtA1f64Sm6TCrBps/I2J15rlf6Uau9m5VaguWrJ0XivcGPWRLkFk0hXz+H4iX9t7M4Ce3v8ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69v6wI1uNL8w4BER+Co5ByO+t+p0hreLnK6vHl8zZN4=;
 b=RBY/wEuekUu6yf8iqS9ivmtsRJdRToDz6pSP6h3xcmv8aTqBpi/LAlmzSg7ZBrGaqrJNyvPPTvsnl8hDD1Sod3BVPwu7iEhPv9G00CsLkr8Sao9G8mrw1uBZsjWBwxuZieov+BnT8bHEatFItz0shak0pSPQ7zSnEBw4aCpx/KQH0fAiq/BYxxoAxkz3go+w7/Vx+UPURDQqliqv4nJfdxLhcrLFb6Oo/wVkooW4alftAiSdC4+d0q1kRNW7GmgJRKLqIjQbRP0H9FBW1ltBntiKZLy8XzkFRqeuBoK2mwdNyoce3mwgpyS8e13LPUG0ECb8qVJdmxbp+2rsh31+rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by PH7PR11MB6521.namprd11.prod.outlook.com (2603:10b6:510:213::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Sun, 8 Feb
 2026 14:48:26 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3%6]) with mapi id 15.20.9587.017; Sun, 8 Feb 2026
 14:48:25 +0000
Message-ID: <c06afc61-5580-4c91-9360-c011b5db102f@windriver.com>
Date: Sun, 8 Feb 2026 22:48:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 2/2] rpm: 4.20.1 -> 6.0.1
From: Robert Yang <liezhi.yang@windriver.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, richard.purdie@linuxfoundation.org,
        mark.hatle@kernel.crashing.org
References: <cover.1769148163.git.liezhi.yang@windriver.com>
 <212239fdc34e812c1e827917d5db83fecac2a3f3.1769148163.git.liezhi.yang@windriver.com>
 <DFZDD2VAMRIY.3LGF8BHLVYMLG@bootlin.com>
 <495ad555-f9e8-496a-99ea-4b04702ac23d@windriver.com>
Content-Language: en-US
In-Reply-To: <495ad555-f9e8-496a-99ea-4b04702ac23d@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2P153CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::22) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|PH7PR11MB6521:EE_
X-MS-Office365-Filtering-Correlation-Id: 3567aeb3-c506-4387-b351-08de67211d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YzVYU3NELyt5VnNNSmRJYnZ3dWlTNUtqdVc1dVNSbEZ5TXU3TisrTnBieVJt?=
 =?utf-8?B?dm0yb0dlR2VEaTZLMXB1VHloWmFmckhFMVlNaW5lVTk2alBxRGczeEZRT2Zz?=
 =?utf-8?B?Z1lLL2E0bmdsakliR1BUc1NQSUZLSWEzSkVSY0VTQXRBNU5UWVdySVNuN0wx?=
 =?utf-8?B?QTBlRllPdWxrZHJXUG1ya0JzNmppMnFsd0xOajNQSmFFUmNKSkNEdlJsUmJq?=
 =?utf-8?B?eW1OK2x2T3ZUa3h5V053WWl6RlM1YTgvcHpwR0xXYkRxbGkxUnhFV0VET3h6?=
 =?utf-8?B?LzN1VFZqR053bU0yckhnNUhGOG9FYm1nQ2VCcXRnNkJTMTd4cDJNaTlkZUF3?=
 =?utf-8?B?d3d4VEd0aVNoK0R6Szdjejl3c3hJV0s1RTRnUnd3TDFncDhqY0JCdFJWbVNN?=
 =?utf-8?B?dWJpaktvaWVqN3JSNWlrKzBNdkdNbERxcFZ0RVE5NEduT1hlVFh6YkFXUXc3?=
 =?utf-8?B?VEIzdEhOS3JiWHV4S1FJRUUzYW9mRWhhRFRRQWZWd2FHQjVCaVdXOHhCS2RB?=
 =?utf-8?B?WXVERUVHYjZFUnBPY1AvSnNhdFdOdE5lYU5OOEF4L2xtNEcvbStjN1ZyQkU4?=
 =?utf-8?B?cFZrWXF4THhwMHBnb3B4S1NCTHhySHMxMkliMWJCZG9PL2FIMnUxaTNZclRw?=
 =?utf-8?B?M1J1bHZRU2orWVVkdmFCUU5QWXlpUytUblVRWEpnbGdaKzhKbktVQTh5QW5i?=
 =?utf-8?B?eS90K3ZBM2JYMkJUOVlzcmF1Nm9UbmF5VU5PRkE1MDNNQi9KbkVYSVJDU3N1?=
 =?utf-8?B?aENrMGluN3F2dkZDc0Vkclg0UkY5NG5JVGtSZzhPaFUwaDZsdldxUkNUdS80?=
 =?utf-8?B?My8rVFAyS3RJK2JGS0F6S3Y3NDNDQjBmVkVvV2RUd2dhRjA4aHZaSGR2aXd2?=
 =?utf-8?B?UGpTOHVnMDFBTE5SNWZYZlZGOE1iaUVjWEQ4UkZ3NVFuTC9iU2xUczZVNWhJ?=
 =?utf-8?B?dGpFaVNyTW9RY3Z3S2JSanpBeUI2SS9YZFFJVmFzOWx0U1U4TUYxL2gzbUQr?=
 =?utf-8?B?WFo0aWdPZ1hOTXFUMnRJd2tCa3JuQitld1BZSkRidVVIWjBkQnNQdmdLU3hY?=
 =?utf-8?B?akZCRGEyY0RoeGU5d2w4OTZHK3R4T2JxZkNKNFZPOG1JcVJ6QXlwTTA4eEJO?=
 =?utf-8?B?eExvYzNKc3F3R1hxL0RZV2ZXdkpjbS9jdG8yR0VhS1JUSWlpMFhMcWZNbmZh?=
 =?utf-8?B?YmZiRDNObUNLTWIyanBBcElUYlAxQlNDaDFrN3VHODVsMFhWV1QvdXlQNGJ1?=
 =?utf-8?B?N3NhMU4waXdLZjJwNGlTaFA2Z2JCK1RvclJZSjdDV0V3MUlTNTNIblJXNzRQ?=
 =?utf-8?B?YkVOOXNKUksxQ3JDNUVNc0VTQzRJL3QvekU2RWN1YWlNMXY0M2pwU0hvbWJH?=
 =?utf-8?B?dlNXRHVoRzdxQjNkaU5XR0JhU1NQM3U4QnRJbkxyQWxxOUR2MGpYYUFmRWdk?=
 =?utf-8?B?aVFzQ29rVTBwMzlTMTNJK3NzWkppaFZjU05MQUVBY3A4QjhzN0F6d1BnZXhI?=
 =?utf-8?B?MUR4ZXFzTFE5WDJnSDRKNTI2RnJqd2VHSTM4eEhwMEZtRTFLM0RqdlV4bG1X?=
 =?utf-8?B?OHRmWjR3RXczT3d3TEU4R2pQQTJKSXZ5UHNjbEtpam4wNENTS1JVME10L25x?=
 =?utf-8?B?cGh2cUIwRWZ5aklwbjdGNk9ZbDdyQTV1MnZjOXhlalNRcjRjYk43MlJNTEth?=
 =?utf-8?B?ekIybWtBU0tGN2V2aEVYOW02VExVSDB0WlBZMEpJeWJWRkkwQUZaazZnbXlh?=
 =?utf-8?B?TTBMUDBaK3VWNGNDdk1Ydm1YR3dNc2RxU2tQQlp1eDZkM3J6d1g5MUp1WnlT?=
 =?utf-8?B?aUk0NEt1SVVkUUFsaXRjRXVmMlptM2UzRUxBck1odk9hc0pXempCQVZzMGx5?=
 =?utf-8?B?TFpXNmk5NDUxUGtreDhRSmtuS1k1bTVEbTlIcWlBdFZlKzhEZkhaNkdWRWlp?=
 =?utf-8?B?KzY3cmQzcUR0aklOLzFlL0VyWnQ4V2dxTDMyaXRzS3dabTdzZWZ2NngyaEhJ?=
 =?utf-8?B?QXdLNjNVVnBhL2F1NnJuQVVWemdTM1pPc0RPNlF4QUdaVGorUmhUZ3ZuM0xG?=
 =?utf-8?Q?afKDpZ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ck5oelRCVVhyZG0xSlRObjVEMzJiU0xoS01JRHdtUGFXUDlKVWx1NFNFaUdz?=
 =?utf-8?B?aXlIZE1KZEx1OUVQRlZqdS9kS1VjZzZIZG1KalUyanJidUtWT1ErRDRSUytN?=
 =?utf-8?B?VVBVcmx2YlVZY0RHWmNjSUM4VERlRGhIM294NUdMbUlqS0lRN1c0bnVHdnJu?=
 =?utf-8?B?WThLdUhTOUVFV1Bpb0tzSU9kZ1FNbTBuVjUwelJEajFGRlRUUWpaWUxiMklp?=
 =?utf-8?B?czNtMVpaNTVoK0dXVUhIcERZN1Y3NEsraStDR2VvR09EKzFnMVBLc1BlLzZF?=
 =?utf-8?B?c1MwMU9hRWd4QTRNMlUrV21pUGhWSVRLbkc2UU9ZK3ZKNTFrYmRrN0JGN0pO?=
 =?utf-8?B?a240ZXNGZXdsektIZFRraWFwU0VQZGhrbzV5V252M2hDbTBBQlR0UHRzTFB3?=
 =?utf-8?B?Nzd5cWhOTmd6Qzc2VFlBMkk4YkZZRnB0YnhqZU5vM25uQ2paQVFoYW13TkN0?=
 =?utf-8?B?ek5hUmdLL3ZkLy9lc3ZZekEyaHlxTmU2b3VJYmVFZVcvRGcwbkxjemVCRlZ6?=
 =?utf-8?B?K2d4MEpEbXE5S0NrTWFFcTZWQkRkbjZib2Z1c3NIeXFpNTAyMkxUbXVkdWJU?=
 =?utf-8?B?UFhoOThZcGpGTWV4OEVNZjIwK2Z4Q3pNWndaMUtDOVBBbU5SeGIvOUpuYUx5?=
 =?utf-8?B?NERMdm9GdmhGOGJSL1Rocy90WEx6cnloWS83TStCdlkvVmlBY2tpUE9FNGlJ?=
 =?utf-8?B?SlR6dGttSjhKbG9qaGdiUmx0ZTUzbVBwdzd1QzdTRjZROGY2YmhDUVhqbzB6?=
 =?utf-8?B?dXZXeFUyTWYrTm82d1pWMHlYOFZmYjkvOXRjSG44WWlRU0lreEJ3d0V5azJC?=
 =?utf-8?B?UFM4Vnl6V3hyR1ExYklyTjdISzRDVUk2U1hjYlMrYzliNEFVMmR4Y0dxNUVU?=
 =?utf-8?B?TzAxNmNkaUg0VjhCS013Tk84WEsrQ3FOZzBkSWxqcnErYzhuYWw3K0JueW93?=
 =?utf-8?B?aHBvYTQ5akF5STFkNCtzM08wRkw1SjBSRUQ4ZkNMZCtJSVA5KzEyMFpLdENK?=
 =?utf-8?B?dGJNQUJ5VGNEVC8vbDdyQWxuT2JVTmxNTWd1d1dCQTBTYWcyeVI4Lzh6dGtU?=
 =?utf-8?B?MG5GQ2V3aGJzTkVCTGFkb3o4cEZMWW1ZNWgyRFJZYnNxV2hJODRmN1VCN1RC?=
 =?utf-8?B?amRLUitFM0pPMElWb3BjN0xHSEtRdklPMHpONHQxNUpzdmVzaENCZUliVnFQ?=
 =?utf-8?B?bDZGRCtxeUozRWRFMnIxdkhIY0dyL0pqMUpqSFkwc0w1dzg4ZDhFVUdvV05Q?=
 =?utf-8?B?amgvUXovcWxFMEFIRm5NQnAxOWV1TUc5VzBRV0R3bWpIUjlWczZZTmlOU2Nx?=
 =?utf-8?B?NS8vSWF2dU5tSG0xUy9Hb2x3S3NUM3UvRlgzZlErM0NxR1ZiN2E4NEhGQmZY?=
 =?utf-8?B?aEtoMDlQUktHcnV1YWswRWdXempXbUF4THovbDlSbnNYK2d4Q0xlMG5la3Jy?=
 =?utf-8?B?R01KNzRKSXJMb0lQOVVPMDZkVXpsWHlJVklDc0dSK3NSQlpGUnJYRlRUNUtq?=
 =?utf-8?B?aGF3RVUzSjBtdjdsYXBKbnpiSCtTRUVaT2tuMVpFbnlKZUV5czF0MkR4YVQ1?=
 =?utf-8?B?THBqSlFsWjhwb2JMVjRid3JXb2doNGxsT2hndkVuNXVHQXV4UytWdDBUaE4z?=
 =?utf-8?B?UWY2NTVhSFBoOWdCVlBhREdyZUVOSUtpekthbmlURWo2eHBETGhaamNMMi9H?=
 =?utf-8?B?WWN3U0xBRUdLS0xLTGhOV2YrOHBCVDhma0pDS1F0dHpncytjS1dwNjFQOWVx?=
 =?utf-8?B?ZERNOWt1cWw2YkgxdWQ4YXp4UTBabGwyZzNNbnhOYWJRc0Qzd01FcnhTY0xH?=
 =?utf-8?B?bTBWOXd0by9RNG4wY1lQU05SV3c0ZENjbWJ6YlgyTGtwOHFSVGRiUlgySjhi?=
 =?utf-8?B?K3JNSEMveEp5aG5zRitUS0hPMVNCS2NJcyttV2phK2M5N1NjUTlEMG9VRnVZ?=
 =?utf-8?B?ZkxuQ1YvL0ZET0dtam9aU1hHSmlQM0ZCRDhmYWs1UGMrNDlNYnVwZzBHMFF1?=
 =?utf-8?B?a1V2Y2FaN2tHYWJnL29CYjJJbzQxY0VFaTJ3REt1cnZSQTN0S09BM3BRY0lz?=
 =?utf-8?B?K0tQKzlLSGFnRkRGSDlCK2ovOGJOamVUT1RjY0lySFNQcGtRL2tPYitQclBk?=
 =?utf-8?B?QisyOGpqUGVlQlVSQjA5aVdzd2RsL0RKRy9HaHBBY0NPWmJ5Mmh5YVpxM0w2?=
 =?utf-8?B?TXFtWnAzZm1aSTA3ZlcvUXgvRldwdWZBdUpNM0NISnFHdU44ZVdFenNqWTln?=
 =?utf-8?B?MkVxVmxJU21aaDhnTlJ6bzh6ai9UWFkzK1J0c05FNEN0bWZ0aWF0Ly8rM08v?=
 =?utf-8?B?N1BtU3dzMDkrUjZ5OHlBS3diaFloYUhNVDhZaVJjemhZZUZ2UmFmSHFTQkZv?=
 =?utf-8?Q?obBxq1RccjrxVZm0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3567aeb3-c506-4387-b351-08de67211d2f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2026 14:48:25.7276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kwXdt8Z8mJLl1vLOuRUfePQ6yJRG6+8sLCCk4xXHj6uJAAqdD9cjGkJg5NqeghBoF2lKqKBw0kuOKl7nYdWTUaQSSvNXDRMc6wC2DEld9Jc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6521
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Wb0BqkhX c=1 sm=1 tr=0 ts=6988a23d cx=c_pps
 a=Ja8eqYkQVLI9FgEzOga41Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=mAICuo4sAAAA:8 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=lmxavKG9m5Q2ZZS-lWUA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=eCMZ9PnozbMVJGdlLxYy:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: -uccuwT0jUZN3JXsRMFdbRxaDFDot7Gp
X-Proofpoint-GUID: 1WyMX4af8yrLer18gNmv7lYgTObmZ9ta
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA4MDEyOCBTYWx0ZWRfX9uNDtajdgBFN
 B4tWhk2VHWKMUmjCSxTJVATDvwCe/VXAQJ77aM/yYUxWREk69EeiChqQNbLJdxgLy7z5iRGAYMp
 tA8UJdqfR/eJhX+Pad+t/kXODPyG9vLrsXEcPkayrWLLG9A8hRnsVpXfzZLXRgamATiq+bstlYF
 r6e7acOs1kVL/aGlJB2VaFa6WKCWqbbXJ2q/EEpWT5rPKISfrT9tZWKbdjaXVPFarv8jTV5C5Az
 dEHrTiFf8z16M20QBx9QEj4wOgElP49dYAaikVKw72mKJs8YTA8z4C+aRG6t+jS26Ib4Fgth1ot
 K/h2ZjAWGXNu6+LmClIEcicWJ7MJRPgMdbGG8RnpxOnOfibWRDqX6zPeJylKuu0eU/9XvUF0IRc
 1SRj8jxVYAoOla/DbIseRaCeHX1vOaV2uZKBYJFSZC5wq6+dypIGh3SV0r448cohnzjXDz4erpc
 +LVj75ExpblBM2SQxUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_03,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602080128
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 618EmTKS1966730
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 14:48:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230678

I had blocked by another issue in the past week, the rpm 4.20.1 couldn't =
find
any requires/provides on pkg-config files (.pc), but for rpm 6.0.1,
qemuarm64 and qemux86 can find them, but qemux-64 can't, so there
are do_rootfs errors for qemuarm64 and qemux86 when install the
dev pkgs, such as:

      Problem 1: package python3-ptest-3.14.2-r0.cortexa15t2hf_neon from =
oe-repo=20
requires python3-dev, but none of the providers can be instal
led
       - conflicting requests
       - nothing provides /usr/bin/pkg-config needed by=20
python3-dev-3.14.2-r0.cortexa15t2hf_neon from oe-repo
      Problem 2: package libglib-2.0-ptest-1:2.86.3-r0.cortexa15t2hf_neon=
 from=20
oe-repo requires glib-2.0-dev, but none of the providers can be
  installed
       - conflicting requests
       - nothing provides /usr/bin/pkg-config needed by=20
libglib-2.0-dev-1:2.86.3-r0.cortexa15t2hf_neon from oe-repo
     (try to add '--skip-broken' to skip uninstallable packages or=20
'--setopt=3Doptional_metadata_types=3Dfilelists' to load additional filel=
ists m
etadata)

I finally found the root cause and fixed that, this is because the macros
(_lib and _libdir) for rpmbuild is built from rpm-native, they may not wo=
rk
for target recipes, the fix is passing the correct macros to rpmbuild
when do_package_write_rpm:

diff --git a/meta/classes-global/package_rpm.bbclass=20
b/meta/classes-global/package_rpm.bbclass
index 30696aa45f..526ac57982 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -622,6 +622,8 @@ python do_package_rpm () {
      cmd =3D rpmbuild
      cmd =3D cmd + " --noclean --nodeps --short-circuit --target " + pkg=
arch + "=20
--buildroot " + pkgd
      cmd =3D cmd + " --define '_topdir " + workdir + "' --define '_rpmdi=
r " +=20
pkgwritedir + "'"
+    cmd =3D cmd + " --define '_lib ${BASELIB}'"
+    cmd =3D cmd + " --define '_libdir ${libdir}'"
      cmd =3D cmd + " --define '_builddir " + d.getVar('B') + "'"
      cmd =3D cmd + " --define '_build_name_fmt=20
%%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
      cmd =3D cmd + " --define '_binaries_in_noarch_packages_terminate_bu=
ild 0'"

I will send the patches after more testing.

// Robert

On 2/2/26 21:01, Robert Yang wrote:
> Hi Mathieu,
>=20
> On 1/27/26 20:27, Mathieu Dubois-Briand wrote:
>> On Fri Jan 23, 2026 at 7:13 AM CET, Robert Yang via lists.openembedded=
.org wrote:
>>> From: Robert Yang <liezhi.yang@windriver.com>
>>>
>>> * Add a tag to SRC_URI so that there will be errors when only change =
the
>>> =C2=A0=C2=A0 filename during upgrade it, as suggested by Alexander.
>>>
>>> * Rebase the following patch:
>>> =C2=A0=C2=A0 - 0001-Add-a-color-setting-for-mips64_n32-binaries.patch
>>> =C2=A0=C2=A0 - 0001-Do-not-add-an-unsatisfiable-dependency-when-build=
ing.patch
>>> =C2=A0=C2=A0 - 0001-Do-not-read-config-files-from-HOME.patch
>>> =C2=A0=C2=A0 - 0001-Do-not-reset-the-PATH-environment-variable-before=
-ru.patch
>>> =C2=A0=C2=A0 - 0001-When-cross-installing-execute-package-scriptlets-=
wit.patch
>>> =C2=A0=C2=A0 - 0001-build-pack.c-do-not-insert-payloadflags-into-.rpm=
-me.patch
>>> =C2=A0=C2=A0 - 0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N=
32.patch
>>> =C2=A0=C2=A0 - 0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGD=
IR-.patch
>>> =C2=A0=C2=A0 - 0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefin=
ed-.patch
>>> =C2=A0=C2=A0 - 0016-rpmscript.c-change-logging-level-around-scriptlet=
s-t.patch
>>>
>>> * Remove backported patch 0001-CMakeLists.txt-Fix-checking-for-CFLAGS=
.patch
>>>
>>> * Add the following 2 patches:
>>> =C2=A0=C2=A0 - 0001-tools-elfdeps.cc-Remove-format-module.patch
>>> =C2=A0=C2=A0=C2=A0=C2=A0 There is no format until gcc 13.1, so remove=
 the format module to make it
>>> =C2=A0=C2=A0=C2=A0=C2=A0 work on hosts such as Ubuntu 22.04.
>>>
>>> =C2=A0=C2=A0 - 0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-=
4.2.patch
>>> =C2=A0=C2=A0=C2=A0=C2=A0 Fixed:
>>> =C2=A0=C2=A0=C2=A0=C2=A0 GPG check FAILED
>>>
>>> * Add scdoc-native to DEPENDS to fix do_configure error for both nati=
ve and
>>> =C2=A0=C2=A0 target:
>>> =C2=A0=C2=A0 Could not find SCDOC using the following names: scdoc
>>>
>>> =C2=A0=C2=A0 Note, both target and native need scdoc-native, it is us=
ed for generating the
>>> =C2=A0=C2=A0 manual, the man pages in *man/* are scdoc sources
>>>
>>> * Add /etc/rpm to nativesdk-rpm to fix:
>>> =C2=A0=C2=A0 ERROR: nativesdk-rpm-1_6.0.1-r0 do_package: QA Issue: na=
tivesdk-rpm:
>>> =C2=A0=C2=A0 Files/directories were installed but not shipped in any =
package:
>>> =C2=A0=C2=A0 /etc
>>> =C2=A0=C2=A0 /etc/rpm
>>>
>>> * Test info:
>>> =C2=A0=C2=A0 PACKAGE_CLASSES =3D "package_rpm"
>>> =C2=A0=C2=A0 $ bitbake core-image-sato world
>>> =C2=A0=C2=A0 $ bitbake core-image-sato -cpopulate_sdk
>>>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ---
>>
>> Hi Robert,
>>
>> Thanks for your patch.
>>
>> Some tests are failing after this upgrade, you can see them with
>> "bitbake core-image-full-cmdline:do_testimage":
>>
>> AssertionError: 1 !=3D 0 : dnf --repofrompath=3Doe-testimage-repo-=20
>> qemux86_64,http://192.168.7.1:41395/qemux86_64 --repofrompath=3Doe-tes=
timage-=20
>> repo-noarch,http://192.168.7.1:41395/noarch --repofrompath=3Doe-testim=
age-repo-=20
>> x86_64_x32,http://192.168.7.1:41395/x86_64_x32 --nogpgcheck install --=
=20
>> installroot=3D/home/root/chroot/test -v -y --rpmverbosity=3Ddebug busy=
box
>> ...
>> %post(busybox-1.37.0-r0.x86_64_x32): execv(/bin/sh) pid 624
>> error: failed to exec scriptlet interpreter /bin/sh: No such file or d=
irectory
>> %post(busybox-1.37.0-r0.x86_64_x32): waitpid(624) rc 624 status 7f00
>> warning: %post(busybox-1.37.0-r0.x86_64_x32) scriptlet failed, exit st=
atus 127
>>
>> Error in POSTIN scriptlet in rpm package busybox
>> =C2=A0=C2=A0 Installing=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : libc6-2.=
42+git0+453e6b8dba-r1.x86_64_x32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3/4
>=20
> I found the root cause, it is because busybox and libc6 depends on each=
 other,
> busybox' elf files depends on libc6, and libc6's postin depends on busy=
box'
> /bin/sh, the do_rootfs works well is because dnf-native has set
> RPM_NO_CHROOT_FOR_SCRIPTS=3D1, but it would be failed for a fresh rootf=
s.
>=20
> In rpm 4.20.1, it let the installed files' Requires win, so it installe=
d busybox
> firstly, but in rpm 6.0.1, it let the postin's Requires win since posti=
n would
> run immediately after the files are installed, this does make sense, so=
 it
> installed busybox (which provides /bin/sh required by libc6' postin) fi=
rstly,
> then we got the errors. I couldn't find which commit made this change b=
ecause
> a lot of files and functions are refactored during 4.20.1 and 6.0.0 (no=
t .1),
> I also tried bisect, but failed because a lot of do_patch or
> do_configure/do_compile failures for each build.
>=20
> For libc6's the postin is:
>=20
> #!/bin/sh
> if [ x"$D" =3D "x" ]; then
>  =C2=A0=C2=A0=C2=A0 if [ -x /sbin/ldconfig ]; then /sbin/ldconfig ; fi
> fi
>=20
> This doesn't make sense for lib6 since there is no /bin/sh or ldconfig =
when
> libc6 is not ready, so we can just remove libc6's postin to fix the pro=
blem.
>=20
> I will send a V4 for it if no objections.
>=20
> // Robert
>=20
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/305=
9
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/3107
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/312=
7
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/310=
0
>>
>> Can you have a look at these tests?
>>
>> Thanks,
>> Mathieu
>>
>=20


