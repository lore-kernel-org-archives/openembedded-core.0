Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E96C36017
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 05:53:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.45436.1743400380872097019
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 22:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=61856e1cce=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V56Pc3005848
	for <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 22:53:00 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45pgck9dpg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 22:53:00 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52V5r0VT008028;
	Sun, 30 Mar 2025 22:53:00 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45pgck9dpd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 30 Mar 2025 22:52:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNikyiJwbuEaRJEkvY3g7YegKuj+VmWUljf5bjA4D5jgPocTBYSGApa7svPRp581/zAAyzne7D4bYuEdOJ/SFoMOt7dkVY+5n1HmMaKmqWJxnIuMJDOPODov1QmOkz2pXtOSyWqeReO/dPYwzJsv8Mz3OYOVBrgXHdKvuNgizq7P3uszSnfxlZvyz9EDvjbSvfOKthAXIRpu3EpgQycTqw7HpW0iFmyxianjy9Wfjr5JoWBbDcAFv9CYnYAQkiTfA55hpY0+AiCjQu/72KgZd3OzaB3QrgRhMv8XTrnebdABmv3u7dpkBBbr6mIKw5w9k5P6P4EZ4ONQmg3/dGRUSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uszo99MLIhQdRhcmm6nlOFcnM39sKr/ey85WqHVlk5Q=;
 b=mM1nDqtinjWb+SOfsVDojKzlPjz335Oxoiz3zCg2zeSRY3W6aB30/y1lRg1E1uWCKg0opz5ld2q2NP+s0Mr6+qYWOaGbHOvSfdeX8iBci5tYlhhe5NnjG4HQ8jjRd43YHt6LmWFH8lI0k/Rw5E98xRhbTXYNrcOIVxck79ktV/Gm3V4nH/FLqcoIHgUqYCXL6LB194M3uKV7K/bAnB4enrT6U4P+1KVLyMaVgbsDYn/cxJmuChZTZM5oD63Yclk1pug6XdgMnUWuqdTVri51mhQ9VcOs2ZQZXWAsEFUpE23Yb/cu00qJNazmSjjjZWmfyfbpG+ZhU4ayWyGaN0c1Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by PH7PR11MB8036.namprd11.prod.outlook.com (2603:10b6:510:248::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 05:52:57 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%3]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 05:52:57 +0000
Message-ID: <0cfce4a9-6736-4bac-8eb9-d00a41c0b4b0@windriver.com>
Date: Mon, 31 Mar 2025 11:22:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/3] rust: Upgrade 1.84.1->1.85.0
To: Khem Raj <raj.khem@gmail.com>, koen.kooi@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
        Sundeep.Kokkonda@windriver.com
References: <20250328143005.880998-1-Yash.Shinde@windriver.com>
 <20250328143005.880998-2-Yash.Shinde@windriver.com>
 <BB6CE0C2-6EA2-44F9-8B16-8981A0B19BDD@oss.qualcomm.com>
 <CAMKF1soMjq2unU3+i1iBVgPYZ=HEDY4SBdZ+Sx1DH1Po_p5TWw@mail.gmail.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <CAMKF1soMjq2unU3+i1iBVgPYZ=HEDY4SBdZ+Sx1DH1Po_p5TWw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MW4PR04CA0353.namprd04.prod.outlook.com
 (2603:10b6:303:8a::28) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|PH7PR11MB8036:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b2b1212-9467-43de-9455-08dd701849aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NFpHZTQrK0tvOE5kcnhzS2x1L2lKR2MzaUhueDVxcGhkcXVJRktqMjQvODRD?=
 =?utf-8?B?dU14OUJMb0pRdSt1eGU3Q1FnbFNseU5aY2hzRVJ5QmxTd1BnNFR0RXdBOFBz?=
 =?utf-8?B?OXZuRjBwRjlGRU8zYlF4cHdpd2pHbURzQlQ5azllWU5yclN1VTJvK1o1RDhk?=
 =?utf-8?B?KzdzbEVNVWNGQks3czBJYUk1ZVc5ODI0QjVWdjBNeWVsbkMrQTJBYlViK05L?=
 =?utf-8?B?a1RYSWpndWt1V0VMUFNnR0pJSmdHcmxGaUdHZm1veUNHUk9ZaHFUY1B0RnVN?=
 =?utf-8?B?VDVUOU1tb3lsOXB5WkxxbVVuZzJST3M3UGlhd05HOVJsQmtLdUg1SWV5YmM0?=
 =?utf-8?B?SGRRTzdubGMwR2NsSDlKSFB1YmwrOHFReGo5NUIyWWszcmVpQ0x4YlgrSkxB?=
 =?utf-8?B?QVhJeGJqYWdQcnhFYjFuTGFEdEtrdStDa1FvQmlKQUVKZjZNTkNJM3dJTzFm?=
 =?utf-8?B?SlZkdEhNQlkvNHFZSndEUE5PbHJWUWpBcjlPODNsODhGb2xNNmVYVk9mK1g0?=
 =?utf-8?B?a3dCcGdCdVVWQ3dkN2w4WVQ3cS8zaXJrMEdiVXpsR2lGV1U1L29pT0JyaWpB?=
 =?utf-8?B?VWNJQ0Q4RS9tSmlxbWFWb1FpQ3FMQWtyZHlIOTl2S1RCLzZlOFU1SzlkeFdl?=
 =?utf-8?B?VkVOTzZ4Q2hMdElJVW83V1JnQ3dhaXE2Y2M5VnVZaDlnV1Zub3ZjT1h3blFS?=
 =?utf-8?B?Rk1oYWVLbnVYNENUQ1k5N1c4TWJzd0MyaS8zSm5tOXBkTlJlL3Y5TkdYM2Zr?=
 =?utf-8?B?RXorQXNQSUJLdXVKa3YyUnlKOXV1R1F1SFBTYlo1SXJUQWJnd0dqZklqNnhH?=
 =?utf-8?B?dTNWaTV4RWFKZVZYODZxZk5WaVZQRGhkR2VaZDNYL3RCVFUyVngyMlcrSWhI?=
 =?utf-8?B?aitnckNwbWxaVjQ1S3Nwc01JV3ZnL3R4d1p2UzdvaGMvNnZIS3kzMGFVUk5k?=
 =?utf-8?B?NTZmaTlyY0JnQU04QVNxTEZXeVMxSVZ3TXE3SjVFeDVXRmtVc0xIbFU5TjBu?=
 =?utf-8?B?Qm9YcjZjdi8zbkFRRHB0dEtOVjI2YVpmbUMvdTF0MjJ3bkNFcnpmWE4zUndW?=
 =?utf-8?B?Q0x5aG1RMUV4Y0JTWWNNb2t2cHNiYUtVaTJCTkFIZHI1a3ZqbnRpNlVkREF6?=
 =?utf-8?B?c2xhaTdIZUlZMnBuZW53MmxZMjJ2VG5XSElaVWRFZG9GV3VibnQ2RkNrSXU3?=
 =?utf-8?B?QTRjQUxaWm0vSVVtaTROWDlRVjhhVVkvL2FkNFhEWjZJa2Y3YldVRXJJa2RI?=
 =?utf-8?B?V0JXdGxlT2VhdnB3eXByNEc0bTE5TG0rYkgwTk4ybnIwbE5ITmVEUjV4aCtK?=
 =?utf-8?B?YVV5Rm9xMDRla0NIa3ZKckJNQlFuRUUwbjdKOHF0N2hwQWxiYy96WHJMcjFJ?=
 =?utf-8?B?VVJzRFBNR1hkb25UcWo4Mm9uanlIbFhkdjNicmVpVHBYV29YeVdYMGxmeE84?=
 =?utf-8?B?N1kxWFY4R0ZJVG1UWjNBaWE1VFdsY2hiNmNqYnFCY3RaRmVUKzFxNmgzVytL?=
 =?utf-8?B?emJqdVNCbmFLN1pjYzdHd3MwR2t3UVpTNExlNmw5ekFBbkZ4bDN4YkJZRE04?=
 =?utf-8?B?dkRJaGx6OWtZVHVUN1N4Y0swcndJZ21VQ2Y5bFZEV3NDdXp5MThIQnJQZWlT?=
 =?utf-8?B?MVV6Ri9zREd0VTdGMkNLTmxrMzNWUjkvenZRVzcwYkpHQndZQ1o3dmdKYWxh?=
 =?utf-8?B?MS9HeGFUSjM5NGFpNDNJQnpIZ01SeTB1VTA0OWhSQWpvdTM5UWlTOFJTWXpE?=
 =?utf-8?B?Y1ExdXhXNkNMRzI5b3ZlT2dWbkRBOEVCM29CZVliNDEybm9Cb1pGU1hwblZE?=
 =?utf-8?Q?QutlC9+xNTT8U8D5YipzFx0dX3ts7AaGvzq70=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VGVpbUcyUUJUOUc5UjMzc25xVVJWcFJyWXErZWs5VS85amRYMmRXU1pUVlpY?=
 =?utf-8?B?NkFJQTRJcm5TVVBTZjVQRzFDOHdyOXg4VmhwTzBNYnEzbWtGL3pPSXc1WmpR?=
 =?utf-8?B?SG8vb3NpUjhXVXRsZTgyY09GVFdrTVdnUW5oV3VzdVNGUVRnQ2V3Z0ZDTHA1?=
 =?utf-8?B?UzZxaVJxOVBDdWdoaWMrWGV5b0s5a3BBNExPaHdVZ3R5VUU0QUlXV1djWFVv?=
 =?utf-8?B?ajBSRlYwUzlIZkpkOTBRd2R0QkxTc1UyWGp1Wk52eHFXRXVhemNaUWN0TWZL?=
 =?utf-8?B?a3lSczZGTDA0eEcwV2I0N1dEQ3RuSEpSYnMxeGNkbEl4clpOZXg4bVpjNzZM?=
 =?utf-8?B?UXJzaEFmK2J3S1E0VXpnRWFoMVVkT096OWtla3I2bmJFRDdNazNXL3FYamhN?=
 =?utf-8?B?WGMydktwbWR0cVZYNXZXNmhySGRtTDR0MG5Za0IwaFFOdzUzRGcvTzFNWEVY?=
 =?utf-8?B?SVFMM1Vwdk40RFJpZ1Q4Y3JLZVM4NndZNUM0TXlVN3o3amlKT0VKbU1kT0U0?=
 =?utf-8?B?Tm5SUlV3QkNpeExXc1R4cEppTFJaVVVxNnVkaml1QW5oVmNsM1R4N3BLeXRJ?=
 =?utf-8?B?T1ZnMk5Rdk1lbUVOTXVYVE5FZWsrN0wvZ3o2UHh3ejkyZm1NY1RxNlFJYnJS?=
 =?utf-8?B?Z1M3cGZIbU1TQmhVc1pTNzVxYlM5UDRra2UyTkZ1d3BJQ05VeHJtaGp4ZGkw?=
 =?utf-8?B?NURtNnRMS1NCSG1yVjB1cC9vOU9rN09FRUd6QXFmdythd0w3MW9yQ0o5dTlq?=
 =?utf-8?B?MENOVFlBOGRtZmZMRnR6R3QxaDREYk9QQVBvT2E2WFJiZXBacU0rbUhPK3dN?=
 =?utf-8?B?cGVSTE41Sm8rNkZIUlNlTWZqN3c5bFNoc1J6ZmhSaXZjeERmM3RseWUzT3Fq?=
 =?utf-8?B?SGlYZWVOQzYwZUhDNEdmWkc1ZXNCR1NaUm10Ni9EZmNWemxkMVI2ZXVoa01r?=
 =?utf-8?B?V0JXMkpuY25QL3RBUXRPeGhUbWNnRGdUUnFuVk5vSzVWWmJkYTZxWkYwYmhG?=
 =?utf-8?B?czc2MERtYWgreFNSV24xTGN3aTc5dVBGbE9aNFFYd3BNbEZJS05ZNi9lTEpV?=
 =?utf-8?B?M3BOVW1FT1JnSEpOUTJYWGlHQmFmdEYyTVdOVTVnVGM5RmZvSjg2K3h1dVIx?=
 =?utf-8?B?bjBrYnhRYU5IT2gwelZiYXNzQ1Z6YTYxWFpDbndFaGgrT2V2M1ZUOEdNMS8w?=
 =?utf-8?B?dFFldjl4UlduSHBYZ0V5QUR1eFV2SjJRdDh1WGlwWGYvdnlzSDFtZjgrNXd1?=
 =?utf-8?B?akJnTzhONUZnMFN6Z2ZubHdmSzlZd3M2UDR4Vm54MmtkamEwQXpuais5aFVB?=
 =?utf-8?B?VGpYa24valJjQkNNUDNEd1l5cHpVa1RrL1BIdnZPVk01YjJLclBOWjV6OEZO?=
 =?utf-8?B?dC9mdHZnZjc0Qlh3cUhqTG9FdVBySEsyYWVMbGFWeHRwWTFUYVE2Y2pxN3di?=
 =?utf-8?B?TFR4VnR1MzJyN1ZQeVIzNTZMQXlMdVZVODNTalNreHpDUUVaaG1OYzh5Sm9x?=
 =?utf-8?B?WnlaWTlKc3FrdGp5S3dVQjdkOWlHRUtQVTJjSTk0eks0RFd4ZitUanJnL2U1?=
 =?utf-8?B?cFppNGU0aytIditWSHF2MUtUUFZiY1NibFA0TEZiMW56YlowaFU5NU5BODdl?=
 =?utf-8?B?cXA5VmhXa0xEbC94ekRHdU83OWU0cSt5aHNKR0puUDU3TjlxakhqSmtjV3Vy?=
 =?utf-8?B?RGVBQXlyc3BnbVRsbjMwOTZ1QkU4VnoreWdueEhzOHlwYUtlalp6cUJpc3RM?=
 =?utf-8?B?TnFaZ1N0cnZhTjRIOUdLdUI3N1Y1OHk4aHliSVVFSXlDZENFU29lZ0NSQzZa?=
 =?utf-8?B?RWo2THg2cE9KRzlkN3QvRzN2UzRtRXU4U1dKM1ZYMGF0RmtMaC9uTTlrYjVk?=
 =?utf-8?B?c2gvMGdMVFpqa0VMa1ZjZmE4QjAxQkdKRG9SOEJneXlzbUhQTGpIeW9rQ1g4?=
 =?utf-8?B?TWcvK2RNd1NYaHVhMU8wcjVCN3pBRUFNYkVXR0RuWG5ibGlOZ2g3NzExYnJu?=
 =?utf-8?B?NFNSQ0ovbGpmaEhKdElSTEZsNkk3MUJRQjN1MlI3SWxZWFZyRkJlM3VxM04x?=
 =?utf-8?B?NkpEQWQxOUZaWHlpRGo1U2ViTjhjVUd6SEwzdlZYVEs3Si85UTFkaTV2VVd1?=
 =?utf-8?B?ekpGQVhsV1ZIMmloNmVEZUJhcTZuK281SnBwellRQWZVeVg0VnNFcjQwTDNC?=
 =?utf-8?B?WGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b2b1212-9467-43de-9455-08dd701849aa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 05:52:57.5186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oAKj1AkqFI2oP4AoAQETdeach/ec8c9DwQwZyJ5oS6cuxPJWIyfSkL0/CycOEriKlIjZ6BMuNzF4vv3jIAAcdSembYpCl4D01SLx6/saxiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8036
X-Proofpoint-GUID: UT_W4j_hxHyKsSYxzMH1nSu4UULOPb3_
X-Authority-Analysis: v=2.4 cv=Paz/hjhd c=1 sm=1 tr=0 ts=67ea2dbc cx=c_pps a=6L7f6dt9FWfToKUQdDsCmg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=aYMb5APv3qqtVdVCpDoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dI7qjkOEfi4A:10 a=8zIOOLb7Ym0NljyPXbuS:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: D49xvqPqSCrRfNQkNoaFuMFWCNCZjN04
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_02,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=988
 suspectscore=0 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503310040
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52V56Pc3005848
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 05:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213932


On 28-03-2025 23:32, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, Mar 28, 2025 at 8:17=E2=80=AFAM Koen Kooi via lists.openembedde=
d.org
> <koen.kooi=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>>
>>
>>> Op 28 mrt 2025, om 15:30 heeft Yash Shinde via lists.openembedded.org=
 <Yash.Shinde=3Dwindriver.com@lists.openembedded.org> het volgende geschr=
even:
>>>
>>> From: Yash Shinde <Yash.Shinde@windriver.com>
>>>
>>> Rust stable version updated to 1.85.0
>>> https://blog.rust-lang.org/2025/02/20/Rust-1.85.0.html
>>>
>>> Some of the major updates:
>>> [...]
>>>
>>> - Explicitly set float ABI for all ARM 32 bits targets.
>>> Fix: https://github.com/rust-lang/rust/commit/a51fefcaab835b310e2e260=
05b50982d0049d905
>> In OE we allow selecting the ABI using tunefiles, so this hardcoding t=
o hf will do the wrong thing for non-hf builds (which are rare, but still=
).
>>
> this commit has LLVM_FLOATABI introduced, which is what we can set
> based on tunes.
Thanks for the pointers.
I will update llvm-float ABI for rust target config based on=20
"TARGET_FPU" set in OE.

Regards,
Yash.
>> regards,
>>
>> Koen
>>

