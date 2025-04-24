Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F76BC369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 04:29:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7318.1745468970641133359
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 21:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=620965273c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O4RfMc032312
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 21:29:30 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jhd1rdg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 21:29:29 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53O4TTvI003635;
	Wed, 23 Apr 2025 21:29:29 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2047.outbound.protection.outlook.com [104.47.56.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jhd1rdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 21:29:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwPjutGoiE7JEbQ9zTFcgQFbuwB6JUhFSG1b4rVsW7hr1MZ7OSP32WX6Knwx4Ec/J5AWwLSLujsAKV7Y67B5eKJCWQPzZv+KD8D5kvRBo4zBl7rkqVf1yb1yoBUAwtieCYgfj3EMSCca89hp5T8lOZemMX8XYkWJRRGQI0C+jjT+m3J9Ide7bOrdtizQEQogur9UAR4mJA0N0Cq3+GZCjUkjbkmaUxCN+SBNdwik8WJOXrLsopI7XiQGvVw0Ob0bs+HMQRvrFp/yAFxmv30/Av/16F+LpArPCwKgEOvAD2XudhnySZ0UAYgfPio2WLk1tznGfc9wyUVcESK9BMM/DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hq2BOn7ofFcNbgsAPG7Ha2V9Pw32A6j0mbjSSKboGI=;
 b=xevmK5/3xVlWWjUZS3VQ4FTh0V62pKf2YQoHaAZAAI8dRbJIg6Ce9cBLUSSFq2KJKrOn/w5oSDAwke0CK5ARlYDdawRmttUKhxz0YEtGSwpl8ZZrjIoBMwy/l0T3BTbeFcZ7MY6b3GAsPi2FylZnurPucqFC+R5fX859R6LWIaZGrVL3rh3NEY2EljCubWOJsITYkZpg0dFFn8YtmWo7d0qrpx7agVV4hCsK+2uYKrm5g0Xj4IwS375QD9SmIHEPtQhKARxcXO2fc47Kev7esesg698pw1IzpxF6uhj1Z8glO20xWkjz1wI2og6OTPchAVVc8LbmKnMjao+8kbo6zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CH3PR11MB8494.namprd11.prod.outlook.com (2603:10b6:610:1ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.24; Thu, 24 Apr
 2025 04:29:27 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8655.033; Thu, 24 Apr 2025
 04:29:27 +0000
Message-ID: <1ff938bc-cd01-4fa8-9da1-b5481d86f405@windriver.com>
Date: Thu, 24 Apr 2025 12:29:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] sassc: fix runtime version
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250421090611.3862686-1-yi.zhao@windriver.com>
 <20250421090611.3862686-2-yi.zhao@windriver.com>
 <CANNYZj_Zfs_eqK4GDdH_5yj5uGcttoHQ4uO1=uQ3u55--SV7Sw@mail.gmail.com>
 <4e3faf82-60b7-4538-bc64-5c03d4ba99a5@windriver.com>
 <CANNYZj9EC2=+XLtNRuwNHWNCqkKYfnCoCFm+1BNzwfsTTTGvmw@mail.gmail.com>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <CANNYZj9EC2=+XLtNRuwNHWNCqkKYfnCoCFm+1BNzwfsTTTGvmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0154.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::14) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CH3PR11MB8494:EE_
X-MS-Office365-Filtering-Correlation-Id: 361b58f3-b845-4500-ce74-08dd82e89913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UUo3N05uVktOV0hJTWFyZm5pREdjMnNVL0FIR1YzMFo5OGx6OGZDQnQ0dWdv?=
 =?utf-8?B?ZC9rTU5iQzUyTWk3NlpPd0RVR1RPWTVaMWxrKzZCR2tnYThwcWZrTGJyc0Fi?=
 =?utf-8?B?VkUrbUxKU0lLUTAzc3lJbVBlTzFqdEV6dzAwVzJvc3U2T3Z5QlE3c05PNEFB?=
 =?utf-8?B?SWJRdXNXSW1iYTV6czJZRkc5VmRrcDBlRkZTYmYvM3FaTm4rbktlamtabXI0?=
 =?utf-8?B?ak11c0g4VElBTDRiZ2VsOVZpdzlMdXo2VnI4YjJ6OGpMOXR2bkRzcTVZanky?=
 =?utf-8?B?eFRZaEJIdlF4YTRZamN5bFhIWVBxenI4WjZ4YW94VEhBNGNjeEcvVC9mc25u?=
 =?utf-8?B?cFYzWGhiSkpjdkdubUxEVnB6QW5HVWlxMEp1aHBTQ0dkZG9STVV2U3pBSkFw?=
 =?utf-8?B?VUVPMWZlTENOUnk3RVBnZ1RqVFBmaTRKWEo1TG5KdWtLSWxFVzhuTWlEd0Zv?=
 =?utf-8?B?RzlBaC9TVUlBcExzZlFPSFpOYTJzZ1JWbk5qVEdzeklLZnJKMjhvQWlNZlZN?=
 =?utf-8?B?Y1FtU3JHZ1YvZmRzdjFLZGl4TFNtRW5hQ2xYMWtLZnY0MzdmcjZsSUx3TFJ3?=
 =?utf-8?B?c3h1Qm5QVHBzVUlLMVR6THdpVEppQjQ2YnI0SDdBWjhPSGxPZWVhTjE4dkwy?=
 =?utf-8?B?cDJXbC9ucEJOL3NNM3dmakpRS2dwYzVQYitaeWhXc3hIOGQvc1pFczhET3Vy?=
 =?utf-8?B?V3cvSTJ6SURCa0tEU3o0d05lczBnNEN1ZXU4a3RwZVNLRmY4dU5wSExHSGdz?=
 =?utf-8?B?dSt5bEM1aUdJeU9WZ3dVK0tPZ1htOG44SzN2aWlUc2RvWm1OKzR6SG1hMHRI?=
 =?utf-8?B?SGhOTFZ0eW1tSzMwMW9hcXY4N3pjbDBycEo0RGo3SmlvWlNIK1orNU9ZcUNV?=
 =?utf-8?B?aVhESk9xOHB6dy9nejFtNHl2ZXJRM3o1Z2dtNnZ6K3NmU3JRTm9ZaGcrNzNC?=
 =?utf-8?B?b2hsbVBDczdpQ2ZOdFpEdEt6MHFxOStRdFZkN3VmdGxCdDVzZjVZdFVPSTA5?=
 =?utf-8?B?Y3lKaHhnOTNabi9ZeHRUOUVjd3luRm1vRUt5elc2NFppY3VPVktnMzNGREcx?=
 =?utf-8?B?OWlKc3FoenV4RUhnRjFuTjM3V1dJdTZENGxpMk9KOVhXUE9waU9Oc1pUak1r?=
 =?utf-8?B?RHBqbUJ4NHYrU2tXRWRDeElpVGJiZStCczlQWkwxa0x6SXFHOW50eStuNEJt?=
 =?utf-8?B?dG1lbGJLMjVuY0FvU2ZHM1lVL3ZYQUVRSWN5ZFQ5bUx4N2NRWHViR05GRlhY?=
 =?utf-8?B?My82R0QrTmJBL3A2L0lHSlpTZjBaTXBva2djVEUxWEcyanY3aHQzY0F4UGI4?=
 =?utf-8?B?ckp6R3l1MytFWS9oTXIxa2QzNjAvZmVCaGQyczdlQk5qMDNyVEdBVzlEMzVq?=
 =?utf-8?B?eXVLL1VEclg4T0p6REUrc1llWWYra3ZJZTBQbVAvQTJOQm5KMWN5RTNkRXpx?=
 =?utf-8?B?aXEwNUpFQU8velNtYVVSU2RodWRoSXh6L1NqTS96c1lLS3l4VDcrMDRqOUZs?=
 =?utf-8?B?cHYzOFo2KzEvMDFWU0h0aHRSc2dsc0FCZWpHK2VrNE41TFd0S0o5MGNJSXZL?=
 =?utf-8?B?VWp3a01FVkVsR21YaEdmSnNCaEtqVDFJMTllWFRRVFlkdTFjTnFQLzErVDhv?=
 =?utf-8?B?WmMybEJFaXdyTVlmeGtDMDdranZPUW5tcmdYUVAxWDdwVzJuUHkwYWpGV0h3?=
 =?utf-8?B?NDBvNldWWlovVW1BZlpiUXhidDRXVnd0SmFPTDFBNjBuYnJMRUQ5ZStpSWdx?=
 =?utf-8?B?L0F2TjI5Tzl5N285ZmNpYm82UlhTZENkb1pCZlZHMi9QTVpHeWtTM2xhUWlw?=
 =?utf-8?B?Q21lN0FSM29ReWZWUFpETVg4ODFqekxQSkFSSWZtR2lRTTRRSEpYSGxqYzBW?=
 =?utf-8?B?VjVCUVFFMG1ZcGN3SHlxMURYa29FYnpSMlRmT2NCUTlJVmRZekRiU2hSQjA5?=
 =?utf-8?Q?krEjHyb2wII=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Mm5FZklGMzZJTm1lK0QxaStMV0hhYXNKaTNZanpLcmhVK1lBbzU3a2w5aDBB?=
 =?utf-8?B?UXZQK2FXQTJ5ejZLWVc1L1hBWk5wWmM4ZWxxYVpLdUxDaUZBWnI2QW44b2Y2?=
 =?utf-8?B?QzhGcStKb3pWaEFYTjF4RVdMcHdLei9qbW5zWUd3UU9sbkFWZWRQczByK0U3?=
 =?utf-8?B?YVlNM2R6TG5ka20zUmYvN0RKOFR4Z0RqZkZtZkQ3azI0N0YrOEdQRFQ5TzBm?=
 =?utf-8?B?bUdlTmtwSmU0REZIR3lhSkJDYkVLOGVLTVNyNWtmTytqdXJ1SWFkbzdQNHMz?=
 =?utf-8?B?WjZXemVLL1BSOXh1WitsTVdlMFhjT0FCVXRGczFTZ20zMExneW9hOEZTMlhl?=
 =?utf-8?B?bkdmUkx5OG5WNnFEb2F5NTV1Zm1sWktiRGQvVUhDZ3VxVVQxU3gyZWsvVlBp?=
 =?utf-8?B?SGxYZnBLU0FSUFR0UERob3ZDWUhlcHBqT1NvUzZUUlpGSFRMWW9rY2s5YlFp?=
 =?utf-8?B?Qm4yM2VKbUR0bFMwTXIzZ2Exb09jd1QzWEhIS2Y5OWgxVXJkV0E2YW1OTjYx?=
 =?utf-8?B?cm9HSHgrSW9kSzdVRHRDbUpMWk5SNUdMTlluSlczemVUMHRnWDNEQklOVFdj?=
 =?utf-8?B?eDhsYWdQdG5hN2ViZEJlbjNxMFpPNklZL2tIUG5sdjZUOG1xcDU0d0QrcGNp?=
 =?utf-8?B?d3lzYWY2OVkrMUl3K1M4SHdQMVdOcXFTcUVDbUFaYlh1aHJ6Wll1ZktIMHJT?=
 =?utf-8?B?akxYS2hRaG9ha1YxQXhZSjlxS2swUFdMcmU2dmJKTzR1dUxtN3JIUzVQbnB0?=
 =?utf-8?B?Mk9TTSs3OThPQjVyck9Jaml3WmxjenNWU3VqT20xOTNUSlFwckYvVFc3Zm9Z?=
 =?utf-8?B?enI2cVJFWXBRVHVJWU9CTnVrUm1uOVdTay81QW5qdVkwa0pINkUwT0NCdjVM?=
 =?utf-8?B?RURmNC9XMVA0Y095MitteGJ6ZkZTQjY5RDVrWVRRemN0alVFK0QrMWx6ZnZF?=
 =?utf-8?B?ZkQrZ21IeE0zM1hhN2MxK2dpR25lMVNweXEvNEpEYXpJc3JZRS84UE5lZzB6?=
 =?utf-8?B?T2l4OGRITXNQREM0NnJYbDRqVCt2WStIT1RYL2lhR1AvN2tseVhZYXBUT093?=
 =?utf-8?B?OW1UNSt1eldCRy9rNXR0RFhCeFB2QmtxR2VSY3JYblFVMFRxM3pQeUc1REdF?=
 =?utf-8?B?aXVuRWgrUU5Pcmk0QmpLODNwb3VsczFsWmRJbXMzOGVhbjVGNCtxQ0h2ZGhF?=
 =?utf-8?B?VytQd2RoSHFEalB4SU50REFkYndDQ25MSDBFTy92NlJMcEM4Uy9JM3BxVlFx?=
 =?utf-8?B?TVZhby9lVTBkK1NyR3Mzb1hWR1hBeU5qUDhEV0k1OUlkYkt5aGR5d3JhSDFU?=
 =?utf-8?B?eUpJR3RrQ2tONlBIRU1hLzZ0OXVoTHRSZ0Y2M2JVTkx1U0NQeXh3Rzc3WWwy?=
 =?utf-8?B?UElsd29SS2JvTUtLak5rNnBvMW01cjM4NHRWcTh2VlIxbGFwNndTejduaHFW?=
 =?utf-8?B?dVcwYUorcFhGM28yc29rMEdnemRIVXNXNitBTEpjbHRSdWpnc3dsMExoYU0w?=
 =?utf-8?B?eWtVTXFCTGxuU2ZnYU1rVFZJdjc5cC9UUXByOGxlOVlGejBKZHF1QXpScXEv?=
 =?utf-8?B?c09PTGMrcmFCbkVrRS9pUzRSRHh3Qnp0cGNUNmN2TUZGbHdjc3dhNGJYcEVH?=
 =?utf-8?B?dmFyelZQWXNqYkJXVE84eUg2QXl6VncxZ2svN0hNNkx0T3pESVdpQ0JvZHRh?=
 =?utf-8?B?bmJPL1JBV1lmY3VweE9zZTlHMisyT0JkSHBhVkN1RUlaZ3FNblBLb0c1dG9Q?=
 =?utf-8?B?NkR5dnhhdXlEOWpKTitJSlhvcHg5QlZSdGpYeldqNFNNSzFPemV1Tnk3c3A4?=
 =?utf-8?B?NHFka0hzdHUrZ2RVZHkxWjZnNXd1Q2hqN0I3bkhEZmI4eGZLSFhzK0RDaHpR?=
 =?utf-8?B?Z1p0NEZDVlJJOEljdHNHK0JQb0NsWDc3TSt4bkROaWJ6TEswamR3Ullxamtj?=
 =?utf-8?B?Y3E5SVRteUVzc3NQT1FsZVAyZFprNXFBWmNOMDlKU3NnRGNqcTZpQ0duZ2xv?=
 =?utf-8?B?eGg2WklONklEc2ptalFtNzJpZUpkTEw3Q0NvRWxjYkc2ODhEOGdIeWZsT1hP?=
 =?utf-8?B?M0syRjgrOGFqRmlMbkwxNjFsakExUGhyTVpnRmEyZnFYR21qemdHSndpNERU?=
 =?utf-8?Q?SMkJ1uwGGkI4O5sLJ/HM0YHpi?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 361b58f3-b845-4500-ce74-08dd82e89913
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 04:29:27.1192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vhccImTcQ5lIE+cEcCy6mQkENdQQRitpkz2/0QC0fyBmdfPP/D13RVpUOLRKluqGTPSOPuHslA2Cr57wAvC6PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8494
X-Authority-Analysis: v=2.4 cv=ZNDXmW7b c=1 sm=1 tr=0 ts=6809be29 cx=c_pps a=e6lK8rWizvdfspXvJDLByw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=01PRjVHeztJRqzWzDZwA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: VLs-wTaHvM28h-PczKy1xf39DdSLg4AX
X-Proofpoint-GUID: YLO5Y1GwYNZZTsRvZHMPuLcRPodBloyd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDAyNSBTYWx0ZWRfX7UnxRF4WmBmX jHqE0MNrPBtLJAGdT0jxk3AQYXhS2/S/gcJjqhHNNCbWMJjek/+L0vHg1S6t6DQ1gY24JqVHluf xy4TKx0Zb3fQlgHaWPs6YUJY4AFa64ZPCXSLqCGlCZx1pLI0zIn4cwpDsyOY4xYHGzRNFQn4dXy
 DWbrlmupN+GpvHM047W9CkRXNgEpHCIS6GnNFGkwfGyZ6uaIBUTgzgIj6dhpuKHQXZZKdrUgjBE Tc5fPZHRBMA7mrUfrXknKlCrx1+/F2Bo2kd2SyJEv0ASiDPrFPsfUbM388DW8v2SO4mCvLjbWnP HluqDeGoP/o7r+3bteEFpwboBnT8+pvQaOl02E+u67ATpmo71n3uxxwHjEHdEvQV5WLWwWByXdV
 heEyvAgQSvM35U8yxYHUmiynRXJDiSU/XI2ehB9oRZZaoCsTNygqiJ24aB43OV+/lZEkjFhM
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_01,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504240025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 04:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215325


On 4/23/25 22:59, Alexander Kanavin wrote:
> On Wed, 23 Apr 2025 at 14:50, Yi Zhao <yi.zhao@windriver.com> wrote:
>> There is already a sassc_version.h file with version number [NA] in the
>> source directory. When ${S} != ${B}, the generated sassc_version.h is
>> located in the build directory, and the same file in the source
>> directory is not overwritten. However, the latter is used during build,
>> resulting in version [NA]. Can it be fixed by inheriting
>> autotools-brokensep? Or copy the generated sassc_version.h from ${B} to
>> ${S}after do_configure?
> I think a better fix is to make a patch that deletes the bogus
> generated sassc_version.h from the source tree. Normally this patch
> would be offered upstream, but it looks like this upstream is
> inactive, so you can mark the patch as Inactive-Upstream [last commit
> X years ago].


Thanks. I will send v2.


//Yi

>
> Alex

