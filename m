Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152D0E68965
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 09:35:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8544.1730367313585943010
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 02:35:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1034bc41e5=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49V6spAi018941
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 02:35:13 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42gyxjwrjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 02:35:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S6A1FyzWhRS+og7zJvcZPX7TKzkLQqNMEMMy8XOpxJqc9YvqX4IB2gFy0CI1Av8ce33bnqNRyflkdekZI4ajYsT7fjSSFZ8SlYuxi4+Y225s7EnXnmipzmGuwJrrY2V2NaNLLn7nhTkhfLnnpZVxM6Y9dwXGExkqlDn4WMBptPXltJ6IhP7ZBww0Fm3Kc2ApaAp7KxAvzck2DMgnLBto7lCwnEcSKmNs2KQ2himHvZyEHD+uo7z0RaqsQ4iMxD/E2s0b1qelhYWiEkNhPKYPNM+huVYSrm2gBdED8/3CAR2PFPNj1B+/UEsXpU7J/lhmIa7LFjusAz4vipGv/ydijg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ix2+HXjpcv/FzKfXcJp2uReH3jEC0Gp++qARth1MkFQ=;
 b=sFj4qemFd3CHccWMLZr5lzwRXQud/caJmv5o7LMsWPxJk//GxxKu5lDlecOvHYuoq7eJv9EMdZhqP1HXVm/ZaxDlozro8lS55exiyr5qxivZmL34iLQgkAAaH1XW2DPhUuLXC1HARJ69KvdzDatO/C9T1DNC+ajKES/4GaCFn/N8p35pDMaJdBGih1INFdbd4yEnW2XmBBvwIfGcAsj5XQjLVJhS32kxr/9jLQOvB68nVX66H3eoJ2LCyKpUmrhsmiQbv1peajZvYabS6XBU0YIvpLnDo3O72DT33SxwBRgXqXL7YLpQXPSwdFQpgMtRKFm1plbhTGtGY7rpOtHDXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by LV8PR11MB8700.namprd11.prod.outlook.com (2603:10b6:408:201::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.24; Thu, 31 Oct
 2024 09:35:08 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%3]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 09:35:08 +0000
Message-ID: <7a5cd559-7db3-461d-bef6-10e4545e1b8a@windriver.com>
Date: Thu, 31 Oct 2024 15:05:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cargo: Increase RUST_MIN_STACK size to avoid SIGSEGV in
 DEBUG builds only.
To: Randy MacLeod <randy.macleod@windriver.com>,
        openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20241030111601.284064-1-Yash.Shinde@windriver.com>
 <90fa600f-7b0a-4dc6-a58a-90997995ce86@windriver.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <90fa600f-7b0a-4dc6-a58a-90997995ce86@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR13CA0202.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::27) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|LV8PR11MB8700:EE_
X-MS-Office365-Filtering-Correlation-Id: d8f0c0d9-1a1c-4f87-c986-08dcf98f4ed8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?KzB4QXkyYVVqTitDK1ZDV2FORCtadXVkQkxjdlF5VlJ0MldpTEkzck1ReWVu?=
 =?utf-8?B?N0ZFb25NUXhDcC9oUFZ0V0E1QWhnN2p4YTgwUVJJWkJQcVFNOVl3VlFIYkJO?=
 =?utf-8?B?TVg5Zi8vUFN5dEF4SkxHMDN6M2M0a0tiRndqTy9vWktqOUhrd1NQUkZucFd1?=
 =?utf-8?B?NjlQTTV1UWJnaDE1ai93RDlGMEE3aVMzcDF4d1RiZnNPeUdGSm4wSFIwQXNO?=
 =?utf-8?B?blZjakRBNnNOS1h0YmpSL3RxNHNOODcraEtqYXlnZFA1ZnNMY2pISndJRWZq?=
 =?utf-8?B?d0QwUnc0UGpOamxyYUFxUVo4Y1ZQVDRnSVZ5ZFhKaEVJZThiTW5jK01jN2RV?=
 =?utf-8?B?WlN5UUx1c3RlS0ZNcDhnYjROOWJwckFDa09pMnFaRHQrYjhUWFkzZHN5RVdX?=
 =?utf-8?B?b2tDbG0xeGVnZkxQeEpMNVVvMDhpRmxsNUNVOHNGbHEwU1FZdURuSUswTXp1?=
 =?utf-8?B?aFY3bkpPQXJoL0kvVURac3BoR1VHSkFrS3JRYkZIMi84R0JtTlE5aXZaYzZq?=
 =?utf-8?B?d1dQUmM1T2MxOG50M1lKZXVSVGxxMW8xMk9xY1NXbDNxZHR2WTVyby9veGJ5?=
 =?utf-8?B?RTNlWVpobFQ1NFV6YkxSWjFTOWNEY0FMdmNCTm0zR3hNMTY5NWRmNG1Pdkk3?=
 =?utf-8?B?NVlpUUZSbzA4d00vWUNyVGQxeTZRL3pYSVlpME1LSzAvWVBPcFlScTcvbG53?=
 =?utf-8?B?RUE1Mm4vNXRpd08vRkd3dzBYbjlKc2RxTURTaFh2ekIvc2pUNkF5bXBlbG9i?=
 =?utf-8?B?anJuTEFQY3lnZUM1S0RTWmtQVTZuSWMvVjQ1OWFleVlzcFovdXMzb0Fpc2Nx?=
 =?utf-8?B?K2hWQ0VPemZHYmVOZ2pXUGU3cVl0NTBJYjZObTFOZ3N3dnltZi90QUxlOU1t?=
 =?utf-8?B?TS8wdkRrNkFSZS83dWNpcFo3cXowVFQyemE0RzB4UGlsVVM4ZHBHZDhEMlhs?=
 =?utf-8?B?YzFsZ1F3NDQ5UERkL1lZMzdGaEJNYjZYUUxNcUhXdk1Scmwwdiswcng0VjJE?=
 =?utf-8?B?MjdLR2tjZllTRjNESXA1WDF5bU5CTGIwaDhLU3VaUThvNHQ4T3U2VGhKYlJ6?=
 =?utf-8?B?aUFsK0I3OUtRN3VlY3BBL1cxWHUvdUsvbE02MStWNDVxbjNRU04rUEhYZ2xw?=
 =?utf-8?B?RXJFZnVkaWtrMDRjUHNaczRudEl4cmxrcVpxbjFUdnJJcUxoZVlXYTc4dHZh?=
 =?utf-8?B?ZHlHemp3cDd5b3NNc0VtcjhWRkFwODUwMzFHemU2UWRmK3FPalJwZW14WHUx?=
 =?utf-8?B?ZTN0eGM0QnFsNWEvN1B4Uy9HQlYzMzFpMEhlYkxxTEV0SWJzejBDSS9nV3J0?=
 =?utf-8?B?bzRGdmF5UTZxUU1ucFN0VUQzNVhTRGNIdm1lUHcvMElxdjBZK0RrZlVPZHZw?=
 =?utf-8?B?ZFh4YXVhYXIzdXJ4MWJWR3ZCcWxGY08xSE9hL21tUklFRHEwY1ZsOTVuMEw0?=
 =?utf-8?B?V0s3T2VyNlR4Qmo3a1p1Yzh1c0VGNHRiQ3prL0F6L3hLMHJvRHR3MytPNkx2?=
 =?utf-8?B?QkYvVjFFZFMxNVJPdW1EUjRtckU5STF5SHFNTG1ZK01PVjZVa25RVVJVSm9k?=
 =?utf-8?B?eWJVMXp3QmsrVFQ5clNQaEN6SFV1NHZ4NnRhZ2JsakZpSDc1TkpFNThBdytX?=
 =?utf-8?B?RG1TTVlNbGVLZGFKSFdYLzM0Q2RmMVNhVVlWYzZacHR5dnQwYVdzM1FMcHJw?=
 =?utf-8?B?WWJsNzRvZllTMXhuKzBCMnJuMUx6dEVnc0F1c0N1NDRLM0h0bWo2YkhRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b2lWalJzSEdIWUFnQXRQOFgrYVVmclIzaXJzYmtTTnNOTnd5S3hxb2RObERa?=
 =?utf-8?B?cUt0L1p1RkJuNnhOR1BMSGE0Nmthb3Brcjg2UlAyeEFURlVuZDB3Rm91TXhG?=
 =?utf-8?B?SDRGVmZxYkRoNFhHVG44aTJ6eklEMmZnaTRhbGRrYjFZNy9MWFBDSnEzTFFj?=
 =?utf-8?B?Q1FjRjdkTXF6QWZjM0ZlQkhWcmE5Sm00YkRGb1lBbU9NN294ZVlMc1NZOVBD?=
 =?utf-8?B?QjE0NmkwazFjN09ZK3dVYVE0K2pIbUJXNXpWaEhQZHF4bzRvTVhaaUp6STZX?=
 =?utf-8?B?SUlIQlRHTW5DSENMdjZEYUYwYUwva0UyWklSdjhOY1BqOUNMT0phUUl3WWlZ?=
 =?utf-8?B?L0lUSTJHS2NNUFA3cG1vd1RrdDJBSDdBMy9NZ2VFTDQ5ZGVTZ3k0S2RzUzZH?=
 =?utf-8?B?LzBmSzR4bUpRcXE5TG9haE9XSkxrTHFCMmhPQ3U4RXc0ZjhIQTJ6c1dqY3M1?=
 =?utf-8?B?ZllBZXkzRWtsN0hFTDQwZDdoNzRvcTZDS3ByVDZNSWR6TFZVU0pLR21RQVJy?=
 =?utf-8?B?ZzdIZ2dIbUR5THVzMzc2MHRVTzNubGxOSlQ0a0J6enRmUGN2TXd0OUdXSTFE?=
 =?utf-8?B?TTBVNklicWVIdHFOS201VFdVSElKeTJha01SL3Y3d0puMy9jTWZKV3BJbTYv?=
 =?utf-8?B?cmtYZ0NWRCtrY1RlOUdTQld3VmNyWC9NWW1XQ3laZU05WU1SZDBITFp0WmNY?=
 =?utf-8?B?Wkl4TTB3YW1yV3ovcUJWYTlMUEp1UlpyYlhzZjl1aGdTa0c4dnJndFZkRUs3?=
 =?utf-8?B?Q25yQXRBd00xTUVVMEx6bXZ5eHpEZklVRXNxcjZLY3IxeUkvUmVuOThEUHNX?=
 =?utf-8?B?VFZ4anJTeEtkdTh1eU80bXQ3NVBnQ3ZVcUlQNVFTVDA2blhnV1VyNDA5R3Nl?=
 =?utf-8?B?VnBxei9uOUwwdVNsM1ZaTDUwbGpWYU02TlpmM1IyRGZ4eUVacVBqL3B3OFc4?=
 =?utf-8?B?UThoWkEvc3UxS3hsWFRRc1IzZk9JUFVkYXVlUUlhL0x2TWlRYVY1Q3Y0M1JF?=
 =?utf-8?B?RXY4cGpyL1ppeGdCWGdoZ0tLVDFXWEYrL3J6eWpiMDNEVDA3WHlOQk1kWFJV?=
 =?utf-8?B?NHUwM1plQ1FVNFNWTFNhWEU1Y0F4MDZFd2R1dm5pVzFwNVc0a2d3S0EwVGEw?=
 =?utf-8?B?eVlRQkVLRHM1dlQyVGYxd1FNODJpKy9WZFYweS9rdm9vWDNhOEl2ck5jUjVP?=
 =?utf-8?B?dHBGaG9tUEhwd29FN2ZSaUNTV1pDM0p1UHhSUHR0VkdKNjd2YWR5K2dzVVAy?=
 =?utf-8?B?bURyOEhnZDdsUFpnN0hUMThjRTJwMHJmL1ZJbFZIRnMzM0pxMVNPWnR2aklY?=
 =?utf-8?B?SkdiVE5nVTVqME42QjhuVGVkaXA3UGR5QUx5WEI5OVp6UGJwZ1NDL2orQ1NT?=
 =?utf-8?B?WXpXYnBsamlkU2xwd3FOZFExeVFUVERzOGJKRjBWMkcvN2d5V05qSzR5OU93?=
 =?utf-8?B?TzczOFh1S2RQZkJ6Um8xVFJqUGFHNEhKSUhBS2tCRXVEWFZMU1ZaU2ZHVDBN?=
 =?utf-8?B?VHZuMURrSzM4Y3N0aXFyQ0NzbnpkdlA3QnZtQjBNMFRNTW8xZUh4SVNDbnRC?=
 =?utf-8?B?VHpBU1BaUnV1U3pSaDZkQ2NQRmNPZzEwaXdFK0pnS1ZMb0MyblF4blk0M2VG?=
 =?utf-8?B?cmhBblh5Q3ROZVhhT09vZk56MXVDRVo4K0ljZUcvcGNhQVhHOW1PL0pFVHlE?=
 =?utf-8?B?bWJsTVpTS3ZYRnJXTkgwRWZOei9BV3M0eU1kQUdtenplUHFwZ01HNUlaYlh2?=
 =?utf-8?B?NVlRSWRBaWJBVFI5SE5qSm1LOWxRZ0RHY05NRkoyZlZzeHgvSzVaUzZodUpl?=
 =?utf-8?B?dkh2cS9hcjRWRnFCT0kvSmFwVVpRL2Z0alMrVERUQVNidmo1cHJ1bGhqb0xU?=
 =?utf-8?B?RUtUWmxzLzQ1TmU5MThLUUJlRnppV2NaV0tKdXJYQ1ZNM3pCN09VTGo3aTVo?=
 =?utf-8?B?Tjcxak5mNEVlcFpTbmYra2p0dGZBWWtSRTBSL1ZpTUx2aWpoQVdteHZjaXc1?=
 =?utf-8?B?TlVsYmlBV1hVZ3dCR0gxelk5K1JxRFFUOFY0N1VCTXRHekpTa1JpdndOZ25a?=
 =?utf-8?B?ZHFXR3JuMlZMb05sTERZdUtUR051Y2h6ZWQ1bHBVdjVNRE5pTEk2R1ZrQW8v?=
 =?utf-8?B?Q3VNWlgzUmd3U2FpK2djQUxQaEl4bXRqY0VmVEo5MjNkN2FhMlMrcG5HZ3ZM?=
 =?utf-8?B?cGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f0c0d9-1a1c-4f87-c986-08dcf98f4ed8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 09:35:07.9955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLVmIcJ7NCX4leX/9R7gelYgz7jNkDWqwjuGPWvaVKmbAGiRH7DcxobXwTHOS3MM9XDNcE5u7eULnhxjiruSfkuukfb5TA9357LxGDMFSWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8700
X-Authority-Analysis: v=2.4 cv=eZtvfKEH c=1 sm=1 tr=0 ts=67234f50 cx=c_pps a=F+2k2gSOfOtDHduSTNWrfg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=Q2JQxpYB7dK72cIan9MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: LnfmIkbnLXNVOQfXeB2LS2v0md2KeTWE
X-Proofpoint-ORIG-GUID: LnfmIkbnLXNVOQfXeB2LS2v0md2KeTWE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_14,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410310071
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 49V6spAi018941
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 09:35:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206573


On 30-10-2024 19:54, Randy MacLeod wrote:
> On 2024-10-30 7:16 a.m., Yash.Shinde@windriver.com wrote:
>> From: Yash Shinde<Yash.Shinde@windriver.com>
>>
>> For some Rust crates, like building p384 in DEBUG mode, a SIGSEGV
>> is encountered as follows:
>>
>>       note: rustc unexpectedly overflowed its stack! this is a bug
>>       note: maximum backtrace depth reached, frames may have been lost
>>       note: we would appreciate a report athttps://github.com/rust-lan=
g/rust
>>       note: backtrace dumped due to SIGSEGV! resuming signal
>>       error: could not compile `p384` (lib)
>>
>> WARNING: Backtrace (BB generated script):
>>          #1: oe_cargo_build, /home/poky/build/tmp/work/core2-32-wrs-li=
nux/cargo/1.79.0/temp/run.do_compile.3262358, line 193
>>          #2: cargo_do_compile, /home/poky/build/tmp/work/core2-32-wrs-=
linux/cargo/1.79.0/temp/run.do_compile.3262358, line 165
>>          #3: do_compile, /home/poky/build/tmp/work/core2-32-wrs-linux/=
cargo/1.79.0/temp/run.do_compile.3262358, line 160
>>          #4: main, /home/poky/build/tmp/work/core2-32-wrs-linux/cargo/=
1.79.0/temp/run.do_compile.3262358, line 206
>>
>> Setting RUST_MIN_STACK to 8MB conditionally for DEBUG builds only hand=
les
>> the stack overflow and SIGSEGV.
>
> s/to 8MB/from 2MB to 8MB/
>
> Best to explain what the current default value in your commit log in=20
> case the rust devs increase the limit some day.
>
> From:
> rust.git on=C2=A0 =F0=9F=A6=80 v1.80.0
> =E2=9D=AF grep -C 1 DEFAULT_MIN_ST library/std/src/sys/pal/unix/thread.=
rs
> #[cfg(not(any(target_os =3D "l4re", target_os =3D "vxworks", target_os =
=3D=20
> "espidf")))]
> pub const DEFAULT_MIN_STACK_SIZE: usize =3D 2 * 1024 * 1024;
> #[cfg(target_os =3D "l4re")]
> pub const DEFAULT_MIN_STACK_SIZE: usize =3D 1024 * 1024;
> #[cfg(target_os =3D "vxworks")]
> pub const DEFAULT_MIN_STACK_SIZE: usize =3D 256 * 1024;
> #[cfg(target_os =3D "espidf")]
> pub const DEFAULT_MIN_STACK_SIZE: usize =3D 0; // 0 indicates that the=20
> stack size configured in the ESP-IDF menuconfig system should be used
>
>> References:https://github.com/esp-rs/rust/issues/214
>>              https://github.com/rust-lang/rust/issues/122357
>>              https://github.com/rust-lang/rust/pull/122847#issue-22012=
54359
>>              https://github.com/rust-lang/rust/pull/122847/commits
> Is there an issue open for the p384 crate to reconsider their stack abu=
se?
>
> If so, please include that link. If not, create one and link that.
>
>
> Thanks Yashe,
>
> ../Randy
>
The second issue mentioned in the references is still open but there=20
aren't any recent updates.
Also, Sundeep had reported the same issue in rust and llvm before:

https://github.com/rust-lang/rust/issues/113612 (closed as not planned)

https://github.com/llvm/llvm-project/issues/76920 (open, but again=20
points to https://github.com/rust-lang/rust/issues/122357)

Let me know, if you want me to send a v2?

Regards,
Yash


