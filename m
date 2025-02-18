Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965A3C02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 14:29:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.20671.1739888946695555283
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 06:29:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41443ecf2f=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IAsKWO001430
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 14:29:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44thw933s7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 14:29:05 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51IET5BW023695;
	Tue, 18 Feb 2025 14:29:05 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44thw933s5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 14:29:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHNdfU3QW2BNTyFMq2e2hNh/gnxFp2d7rqb0JHxCrxbBfvzjnyhxqJ1tQAdVbzcXf3fQs2zUaJVPzWj94kG7Atu0otDVv5qwb2P79nHxtk+2boTY8gK2n5kw1ZJCIO3Z4tjSYmE8THT12vioI4YGqb6oojiCQtcytqiZBPivqqZ14mA8foLQyHbAJydm4+WdOME5eJIkCFnop25M8mi5lcJIfCCy96v0Cci3Bb1zzV4bvxyAE0PmBxtD/yYrDBnwZoGKBX0yV+CVsL1Lmfm9O2hWJlP7scc+ZblUoyTWp/HvP99/1/qvClinJXgRjJ7TP2CEdj4nopMOANhWeaOvsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+pzQvxaWZ12Fk43byngzQhsSWtuwDNBbvZ5+8zgyPI=;
 b=d+EXdkee96IOYuAGUNL+1Y6w5xyHynDCm5d8XTe1Oz6VwAfWF1ihK1ALVIaOi9k4n/8BZ0tIzdLpu9BRZZFJtFzHfaTz30iiVEgwMaUmvYl68KKM0t/JCYgDpJnQ3Y+romy64MC0ZeKNaZeTsabiOzLtV1JWXg/kWmcj2V1UVYetPI0VxUfgotl9XLYOWWIkiadaEuV9KI3qTk98jqwF36CoSHyy+JUngjVfqlW/bxXhOZDbtW0raXIXaLz8yAXAsD7FeEmrJMTx3yGhdIZFEq/9I6LDR9n/1Hxew5llYAc1oLPTwI23lejn30AHhAeqWzDCOJb90e4Jlr/5jdtAkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15)
 by SA1PR11MB8445.namprd11.prod.outlook.com (2603:10b6:806:3a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 14:29:01 +0000
Received: from CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::7cb0:dd30:85d3:8f69]) by CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::7cb0:dd30:85d3:8f69%5]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 14:29:01 +0000
Message-ID: <872b9a1a-a85d-4455-91d7-ba9772bdcea1@windriver.com>
Date: Tue, 18 Feb 2025 19:58:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/3] rust: Upgrade 1.81.0->1.82.0
To: alex.kanavin@gmail.com, deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org,
        Shivaprasad.Moodalappa@windriver.com
References: <20250218133352.2360384-1-Deepesh.Varatharajan@windriver.com>
 <CANNYZj_BrGJn5nkQd5CuBwwd3Hga531f6XLdc4esO8=GQemtAQ@mail.gmail.com>
Content-Language: en-US
From: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>
In-Reply-To: <CANNYZj_BrGJn5nkQd5CuBwwd3Hga531f6XLdc4esO8=GQemtAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::6) To CH3PR11MB8443.namprd11.prod.outlook.com
 (2603:10b6:610:1bd::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8443:EE_|SA1PR11MB8445:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a2bf32f-5950-4cc9-42e9-08dd50289673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|10070799003|4022899009|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OGEzVUZxT1REN1NHTVFYZWlLZURLRVFkaW51cUpwR1ErejdEblpNR0VWM3Z3?=
 =?utf-8?B?Vk85QkErem04dWZDczl6VUFNNjBYc2pRTFArbWQ1RXlTQ1E0MGpzdEYyR0Jj?=
 =?utf-8?B?TGU4NFE5elhtT3ZSQzRFdGpyYkt6ZDVxR1M3T3FVM3EvZDRtb1VGKzJEc0hz?=
 =?utf-8?B?bzVteHVOcjNvUHo2Tm1tT00yR3Z0YVdSMHB5Z2lMVEJqZVF2NjcrWWVKRnF0?=
 =?utf-8?B?SnZOVjJQZFBIVVlJTHFNaTJCZjBQNlJUUUFGRG1OQmNiNmx2Z1lZWXFleXRD?=
 =?utf-8?B?aDhoaEc0anhIcmVYUFNBRkMraUV5YzFNNjlKUmxuRnd1emVXdTBkRmR6ZzE5?=
 =?utf-8?B?MnNrMFkxVWlETk5DQ281SVdSc0ZMWnFOaGZUNFZ4V3JxN3pRcWl0SlBEU3lv?=
 =?utf-8?B?OHFESXNlbnZGZWIwWWFvRVM3WncyUXc2Mitjb29CazVMb2x6K24vNmZwejk2?=
 =?utf-8?B?UElpOVpXblRNemJXMVVBK0p4REFrQUloYzlJT1h1ZTBOUnM5VFU5NThseCtu?=
 =?utf-8?B?bEtjNkpOOGk5eE43SzhxQnB2UjE2Szluc0gxMkFLcjBNYVpnWGVjN1lJME9V?=
 =?utf-8?B?a1RBMWRQdWFQQzZTdFltdkkreHdaeDJVb0xzR3EyMkwrQzRKSWI2TXg5UVR2?=
 =?utf-8?B?NWxMTWNvQjlLbndOcVdWZlZFMkN6MC90UURUcTFxRWlKQlBxdVB3QjZUN1JI?=
 =?utf-8?B?Skg4WGxMMEdVUmExZzV1NzdqRUMwUDMvZ0ltN0MyV2RLOVFSRUxQUytpc0lX?=
 =?utf-8?B?MFVWbzFoT2J6TkJ3SGFEMTNWODBzN2ZxUlFUdGttY2VuUFJjczhuRUhaR09l?=
 =?utf-8?B?WmVhZDY3SXZ3RjVGNjNrRzZkUjZQY0tEMWRlTmJpdjgyUUFNMXY2Ym5reGZX?=
 =?utf-8?B?cFpuTHBRM21WejNMcXNqTE5OR3pDa3VkSXg2VGRnVEZLMHVacENsTUd3TWZF?=
 =?utf-8?B?ZFB2cGRHVk5PazRLckhyMm1UOC9uRm5VWGE1alM3UjZWQWRidjE2dExyRm5L?=
 =?utf-8?B?Z2l3UU1IVVVxWUo2Nm5WVDhwc1hFQi9TWUNoalV4cE5RTFR2N2xVNzR6WEI1?=
 =?utf-8?B?WVhkVFZtM2pOMm01K3JNMGQ3ZWxNUUFzMURCZkQ1d2xYb3puWnBEWXZ5eVZl?=
 =?utf-8?B?NmloRnZDUmM3TzExekVDYVNQZ29nOElTZVAyYUxlL01qQUNUNnVRN0s4VDdO?=
 =?utf-8?B?L0pmS3B3QTg2RkJ6UUkrUXJSenRDaU5La0xmcmM1UzI0SkROdU5iMEdNd2x4?=
 =?utf-8?B?UVN6MnBEVk5RRHFPMkM0WUljNUVOb1dBbENFN0hINWVvVnd0SGtMbGI0OXF0?=
 =?utf-8?B?K01mSUtsaGM1bWF2KzcvS3RoK09FNkZIazUxL0t1UEtQMHpBd0NEYk1SRUFO?=
 =?utf-8?B?Ti9FU2YyaUo1WFd5REp2eE8yUGdXUVNZbE90R05xWEFHa2oxRHd1cU5wcjRk?=
 =?utf-8?B?RzZSUzFVMTh3d1FlQ281N0xhV1pha3ZneHdyemhpb0ZOeCtrVlE2VGh4OHdQ?=
 =?utf-8?B?QzMxejNCSjJYT09wZi9nRWpLVXpnb3ZUWUxaNXNMZllDN3RxcTBiZm45L3Ew?=
 =?utf-8?B?czRJVmZVZEdWUW13UzVPWlhDTDlveS9PcEJUNmEvbGlHSG5GRGZ6dm5Qd24w?=
 =?utf-8?B?bVF6amY5UUpKTGEySkdRenFOUGw3RWh4RXRCVUJUUDRGS3pFV0pLQm5zWVNz?=
 =?utf-8?B?aXk5eUFEanpoMFFNNzkrTHU3UkJuaW5zSElJemdLMWtqa3BYT1BIS2I2cDY1?=
 =?utf-8?B?MTJhbS9Uc1M0S2pBaDdMbk1HdlhYR3djaHpOeThZcjFrekdBbXF3RW1iZGNs?=
 =?utf-8?B?ZUlOV3pZL2xzQmpsOE51Zz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8443.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(10070799003)(4022899009)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cGpPNWtjaFA3K3o0STZpZVJDbTFWdjFDZHErZG1Bek5wTjdjWXF4ck5mdUNU?=
 =?utf-8?B?a0krM1RrZldGNjQxUm84TkVlVVFnc3BtRFVmMjRFMEFVYWZvSmNFZkE1aFlW?=
 =?utf-8?B?bVpobGZuRFE5Y1QvTThVMEUwSkNNMDdqOVlCUFhKSTlIRFVWYVByd1VMVEh2?=
 =?utf-8?B?WjU0bnY5d2ZaSWI1dXVHNmFFKzhaVEU4d0VaNXhCckFDNG9hWDk0UVVQSTFL?=
 =?utf-8?B?dHhLakN1WHVlU2xmQU8zYmswL09kZU92MDRkeUhSVWtzYzdxaXR2aFF0WGdh?=
 =?utf-8?B?QWV3QTRYVlB1OWEvdk1FVmQ5b2VFQTlSU04rc3pCVFZDQUJrazNNNUZzZk9P?=
 =?utf-8?B?SHRaTGtZajByT0tKcHNlZUVZeWNrS0VmeW5VQjJYOGxLY3J1K0I5UlF1MmNB?=
 =?utf-8?B?MmhtUHhTdDA1ZkU5REExU0IzdGhXTzRhMHFoUWJ2TXhjT1ZRajRNbGFFQjZM?=
 =?utf-8?B?Q2NVdEdrSW9nY0pBTW5GUzNxMElGOXpEMUxEbE91bDRrdFUxeGVPcnJZUzlZ?=
 =?utf-8?B?ajkzbWtHSW9FTTBuUHVTc1pjYmM4OHlxV0JZbDg5K3h1V0tPMG1aaGJScys2?=
 =?utf-8?B?Z1RISndqQ0RlOGFKMlFocEhsZm9iYU1vWWhOM1VSTzJVV29hbXJ4c0kyT2pv?=
 =?utf-8?B?ck9jUUlYNWF5aDdjVkF1bjdLb0xmcGE5Y2ZqRFlaLzNCeXcydjR1Q1NWdC9r?=
 =?utf-8?B?UVVCRkR1TTJtTmJVQmpnL1M0TXFhYjdCQWFrUUF2L0NuTFhEOVBBZFFHU0Vz?=
 =?utf-8?B?UTk2ZVhXVDBMWWhaWDBCQzExYWMzTjhHbUNyYWRvdTZyNXNZV3Z3ZVFzeklN?=
 =?utf-8?B?eEFycXcwLzQ2NFFpRXZWdEpneitTNW9FZzQyWkwvNFAzODArQWkzOWZ0QkN1?=
 =?utf-8?B?ZUczL29ENGo1QTJiRFQ3UHQ3NHRuSzUvV3hGK3lQeFY2a1dQU2RjdmdXdlJh?=
 =?utf-8?B?S0NFdVpHMENOeE83MGNFekhJbTRILzA4RXpYdXRRWVZpTGVYeVVlb1ptNHRO?=
 =?utf-8?B?NG1Uc3o4bWZ0ZU1GazB6QVY4ajVrOFpKZFBFRVNtZzJPVGhPWDU2Y1BjbS9I?=
 =?utf-8?B?bkVZM1RUYTBrQm9ISm44KzlaOFNqZ3c4S081TzJIVmRjdTE1L2swQkJNdHQx?=
 =?utf-8?B?cXd3Umo1cTJKZnRtb2ZicmVtREwvOUpZNkt1ckRtRHZ2SGZqNTlSQWRreURp?=
 =?utf-8?B?WDFsczFHSlVjQmhiSFBQWTJaci9IUlVTY1JiamtWekphcnQ4R0ZIbEVoZ0h6?=
 =?utf-8?B?L3VhWHFxbDBDVDNHeVhSNlF2aFFjT214ZmtFdDBOZjV5YnIzZWtsSDlEWXRU?=
 =?utf-8?B?UWZqWmJ2aXZ1MnVjLzhpRlhDSnBXVFBtejlhbHgvM0Y4K0NPRldBcW9RcEt2?=
 =?utf-8?B?TXQ3dU03NFVDaW9ESnZsZlNrckMyMXgrNlJmOGpmV1FvSnFCcjJkNUVGaDht?=
 =?utf-8?B?YnNtRVRRZFY3dUlZV2hDK25CMm8zWjFWdHM0c3ppcjh2WE45QkJHQndiYVVG?=
 =?utf-8?B?bThPQjJadlZpMXFjN20vRis1Z0dMNVhhd2NGYlh6TnFYVHBuWVg5ZFJTY2Vv?=
 =?utf-8?B?N1Jtc3FTUElzOHhTTlpISUw1bVNKTGlKNHlXM25pMzduN21kNUZPTndjL21p?=
 =?utf-8?B?UEI5eE9vVjU3SzdoZE95bXdMSDVmL2pLSkhwN1JqcE9XaFFNQ0l6bTVubEpN?=
 =?utf-8?B?czkvSXg5ZkFHZjhHVmxpVEVwdHJUU0VtaU1EemloMEVmZjFnTk5pVlVneVNz?=
 =?utf-8?B?c1NJKzY4VjAxWHQ4dW5oZHRUR0RVZURZNTAvM1MxUHQzZW1sU3kzbGdXcVVj?=
 =?utf-8?B?clRIT1E0UlJpUFphRG9wbW5xb3p6UmFjOW5aRU9tWlM0akFZbUxrT2liOWFG?=
 =?utf-8?B?czBpV0NvWFFDUzZBVnVDSVVFUEsxNHVRRlIwNE8zdm1ibVZNL3BZYTV2TEl0?=
 =?utf-8?B?bGdybjVhUGloc2ZLRTZ1ZW9DcU1mMjlNMENvcmR0Nk5BOERDeUltOTZRTDlV?=
 =?utf-8?B?N2huVjI3T1E5RXlQVXFyWlhLRHdRVkk3S1kwWEJZWjRSL1VaczhCVHU4TlFv?=
 =?utf-8?B?NnRVcjdtQjduWm1QNFdnSEJ0SmZOUzQ1azQ3eGFDRFJ1SFZ1endoLzIxT2Mz?=
 =?utf-8?B?SGM5ZXpjZXN6cGVrQXJRR0p2WTdGMWZYRWRvdEVodHdLZlc5T3Y4bDBhdUQ5?=
 =?utf-8?B?aFluTkNZWkwvQjdYVk1HN0FHc3ltelRyY3RDUEwrTEo4WXl0OFU2R3N2anh0?=
 =?utf-8?B?S2NQUmRrYWE1czNKQU12TUl0aU53PT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a2bf32f-5950-4cc9-42e9-08dd50289673
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8443.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 14:29:01.3893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CzAKWRrZNmJamERBrBOStfWI5c0p37UEi3cIrQZ87phH1ikrGZmx+6xKJ0wrz9c8M1cUYj8iQmtg3d444aC1DTqDbpycq2ahex5vaIMFygs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8445
X-Authority-Analysis: v=2.4 cv=CZzy5Krl c=1 sm=1 tr=0 ts=67b49931 cx=c_pps a=c8UlD/aNTkVRGuk1JCy5IQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10
 a=ei4SEBeUAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=qhxIPH8sN_DzcxWlB0oA:9 a=QEXdDO2ut3YA:10 a=jKzLeVjVkCkA:10 a=8zIOOLb7Ym0NljyPXbuS:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 0piyVdyIeqC7EzxrSYBoIewn2PV6A7wW
X-Proofpoint-ORIG-GUID: m-7hQKJ0QrH-ol6reRb7QcDCcSz3WfzM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_07,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502180109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 14:29:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211624


On 18-Feb-25 19:14, Alexander Kanavin via lists.openembedded.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Tue, 18 Feb 2025 at 14:34, Varatharajan, Deepesh via
> lists.openembedded.org
> <deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
>> Rust stable version updated to 1.82.0.
>> https://blog.rust-lang.org/2024/10/17/Rust-1.82.0.html
> Thanks. While it's good to have working recipes for each major rust
> release, we're kind of falling behind upstream. Should we just jump
> directly to latest rust?

Hi Alex,

The current rust release is 1.84 and we will be starting with 1.83 
immediately.

I prefer to do incremental upgrades, if we jump versions the issues 
debugging will be more difficult.


Thanks,

Sundeep K.

>
>> --- a/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate-hashmap.patch
>> +++ b/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate-hashmap.patch
>> @@ -1,4 +1,4 @@
>> -rust: reproducibility issue fix with v1.81
>> +rust: reproducibility issue fix with v1.82
>>
>>   A few crates are using the updated version of the 'cc' crate and this is causing the generated object file names containing a unique hashmap id.
>>   By the following changes same hash values will be genarted even for diffrent build paths.
>> @@ -65,6 +65,92 @@ index fe919a5239..2b1f442019 100644
>>                })?
>>                .to_string_lossy();
>>
>> ++        // Function to find the position of the first occurrence of the target substring
>> ++        fn find_target_position(s: &str, targets: &[&str]) -> Option<usize> {
>> ++            let mut pos = None;
>> ++            for target in targets {
>> ++                if let Some(index) = s.rfind(target) {
>> ++                    //If a target is found and pos is None, set it
>> ++                        if pos.is_none() || index < pos.unwrap() {
>> ++                            pos = Some(index);
>> ++                        }
>> ++                }
>> ++            }
>> ++            pos
>> ++        }
>> ++
>> ++        let filtered_dirname = if let Some(pos) = find_target_position(&dirname, &target_substring) {
>> ++            dirname[pos..].to_string()  //Keep everything from the target substring onwards
>> ++        }  else {
>> ++            dirname.to_string()  //If target substring is not found, keep the original dirname
>> ++        };
>> +         // Hash the dirname. This should prevent conflicts if we have multiple
>> +         // object files with the same filename in different subfolders.
>> +         let mut hasher = hash_map::DefaultHasher::new();
>> +-        hasher.write(dirname.to_string().as_bytes());
>> ++        hasher.write(filtered_dirname.as_bytes());
>> +         let obj = dst
>> +             .join(format!("{:016x}-{}", hasher.finish(), basename))
>> +             .with_extension("o");
> repro-issue-fix-with-cc-crate-hashmap.patch header/commit message
> should be updated to explain what this new code (added to the patch)
> is for. There's presumably a problem with dirnames, what the code is
> doing to address it?
>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211619): https://lists.openembedded.org/g/openembedded-core/message/211619
> Mute This Topic: https://lists.openembedded.org/mt/111250269/7677583
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sundeep.kokkonda@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

