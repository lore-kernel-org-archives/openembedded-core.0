Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E3EC36018
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 05:53:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.45608.1743400398365030690
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 22:53:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61856e1cce=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V4vkvO023521
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 05:53:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45p7u8sqcc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 05:53:17 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52V5rHhM005785;
	Mon, 31 Mar 2025 05:53:17 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45p7u8sqca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 05:53:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fjYyrQ9iEyhBaBX3WZnUvDLQavkR73fL2ZlOS82ElfIxYR2TbVJTVEYEEhVOFovs3AsEj9/i38UodHpw2jIReErOu78AueAw9BR2ooT0IRsWT9q1w6Iz2BbYhguLa3StZtfm/bVmFzm9KDN3x+Qps37bC7Ws8whe5641YD/rS2PQEerkaOslIv+qI9+Bgj71F2um1fkqIgMDEJp5AdbpcFZrvCX0mBWVMdXIZBaMzDhmh1MMr+Ov7Dk+ZSekXelcurZ2vuVMBMMUMD7+1TrQeZ7yB8I6eN53EK2TSnbTxQr8DxYTc6mZdDLMh9LMTaCOXG9JWRRI9+boJds990bPIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38+m7no26YfIfdgY/Pixp7xKTJpbqrwdtnQw57TxKIM=;
 b=cRDWF43tFWff04z3S2VRHl5fcUBCBpCIZMK+yC9hbci77vtEDfQjiRs+SkILX7oET6XH+VgfS1hNiwWZlHHOuxXWc8RUv6hcB8YEgqqUZ+ZnOnv7zW3ZDUHOTk6lOs/KjmiV9rMS4ArbtWV80rYXKBx7YaII1bgCap+LHglSYDcDF5T0f/RE6IaXxLvdTzNUJb5tG/bro9irsvOnpII1U7S5lQKFV3t88/6jpXH0zzDrFqBMWhYtPARPQNqkznv2VFS33x48ltE6qT2KUyNAtBT0PY+R7w0qB2uOfGF3I5/zh3suqksAbtcuRQyNQ5bTuniueDpMhuIWwYFchR8axw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by PH7PR11MB8036.namprd11.prod.outlook.com (2603:10b6:510:248::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 05:53:14 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%3]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 05:53:14 +0000
Message-ID: <ae548b74-5ad0-476c-95a8-dcd5290cbf2a@windriver.com>
Date: Mon, 31 Mar 2025 11:23:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] rust: Upgrade 1.84.1->1.85.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Randy MacLeod <randy.macleod@windriver.com>,
        openembedded-core@lists.openembedded.org,
        Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Cc: Sundeep.Kokkonda@windriver.com
References: <20250328143005.880998-1-Yash.Shinde@windriver.com>
 <20250328143005.880998-2-Yash.Shinde@windriver.com>
 <e961e1bc-bfd6-49b0-82dc-c00ac879ad76@windriver.com>
 <12776bb304a6c5a98f34325fca117ae7a541ef2e.camel@linuxfoundation.org>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <12776bb304a6c5a98f34325fca117ae7a541ef2e.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::29) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|PH7PR11MB8036:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c944528-13a4-47cc-6fcc-08dd701853ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Qy9kWkZBKzhWeXQzSUtRVDF0K2pZenpaVWdwZFFVM3ZOTTREU05XMkJsc2hM?=
 =?utf-8?B?VlJyVjV2WnZSVitGdGl6M1Vtanh5djZLVjBlS3pwNHJGTXNXSEcwdG5EVkNM?=
 =?utf-8?B?T2RnZTFLV1kyeG50VWFMVmdpQWd4VVFVUVFIQU5yRFhjeU83bkgvUDc5NXpX?=
 =?utf-8?B?RnVGV0VQYnFzMkhpT2hGRW9IZU5YaU4zUkhDMTFpaGxMMjVFSFZhWHRSOFZB?=
 =?utf-8?B?M21KM1pZdGx1VkxLR3VuWmNlNlZyZysvY3pxTDdIS3ROc0xHWnFJeS92SlM1?=
 =?utf-8?B?WkZlWXFKcFNjZVlFU21tWHA3MnJVZmZxREwxYW1nUDllN0hnTXZONk4zcXRV?=
 =?utf-8?B?b01NNjdhUnJibjVyYnJSVHVYenBWV1ZKOGErdjYrZW9VdGVnblZObDV4aytH?=
 =?utf-8?B?R1hDN2krSU42M3NFc1VTTENIWTAvL3d3a1g1Y0k2ZmYyeHRXcGtmN0pWUjRq?=
 =?utf-8?B?cDZZUUFVamcvWE1uenhRS2VNSDZocXpMSVBuZmczeit6SkpnVXN0b082RFNl?=
 =?utf-8?B?TTZ6NGR3NWE2WHVBMTlhS3QvZzZYeU5iSkpRbXY3ZmwrZlNBV2lEbE93eGg1?=
 =?utf-8?B?cXQveXhtSlJSS0VRc2xsRFowQWR2cFpubkhyVXFVSXlNa0hpNGVUcjRQMmYz?=
 =?utf-8?B?WGY0bDk4RG5GNCsvZW94U1dwT0svSXM2S2ZJbzAwVzgwTUt5ekVGSDVUTWVB?=
 =?utf-8?B?bVZjNmx6S0kzaHNRemtjRTJFQkhBdGYrcFUzU2dCR3h2WjVLNzdzUjgwVUtK?=
 =?utf-8?B?aDVyOHpZMTMvZzBVTHM3cnRGNS9jV0k2N1BCKzFDaGEySFpmbG1US1kzaGYz?=
 =?utf-8?B?anVIRTZ6MUo3aWQwR3BMOExTWkFPbDhTMnRiV2lVRU5oNXAycGNkZEp1MkVN?=
 =?utf-8?B?Rm8xNDAvYTIrQmpabHZLbGRTL3IzN3BKOEdZV21FUXJVNjJuQ2dzb2dBRjVI?=
 =?utf-8?B?WnUwSEhLckhXSHNpTEJOTU42NTRPdStvUS9pYm9KOUw3QTdhQndoaTlDVlR1?=
 =?utf-8?B?dEhkYmQrZFhZdlBlN1ViVVJPR0U3cHdveTZ6OC9BSjRBN20vRkliK3B1T3RB?=
 =?utf-8?B?ZXhIVEovMFhzeTEvY2hBdVJiSkZQei96RFZualQrSEhBMUp5ZlloSVhPd3ZM?=
 =?utf-8?B?Rk1yaDhhcllKOG40NmNGK2FldFRMRGNUamdWTmYvVTl5aUFmVE1WTlF1REIy?=
 =?utf-8?B?YUYxMHU4aUhWbEkvU1J4SDcwOHhOeWpxWjdIMGVUMXZ3dkZ5VitzbnJmaXZo?=
 =?utf-8?B?Zi9welQ0OHBaSW9GcnpyM2E5V0ZUeHB3WUY4ZFBOVFZON3dNTGQ5Wlg1UWVJ?=
 =?utf-8?B?RkRBYmJzTTd3SVhwNWFsVmsxb29nS2tWNG9ONXU1ZEk0UktBUFhJSnA5aGZE?=
 =?utf-8?B?RGpMMXpEQ2F6L0djczQ3aC8zOGo3QzVaUTZnV28ydWZKM2JXUUdIVUJadzRm?=
 =?utf-8?B?dVFMelF4K2RCMkQzNHhUSlVUWkZFcmhXVk5zaVRuUDRSNk14MzVVTTFyemww?=
 =?utf-8?B?c3cxV2hoNkdUdGdWNlAzemdPS25ja1dQamk0Mjg2UU5HbWJBaWNCT0p3N3du?=
 =?utf-8?B?b3VIdnEwbUxWRWZWQkZLTFROL1U5NTBQTlJxekJYbmMrei9uQzRwbklBS21N?=
 =?utf-8?B?QUFUSnhEUmhKendWVVlHeWZLZ3hRV3o3eGx6cjZyM2NPNjU2SnFXZmMrZkNr?=
 =?utf-8?B?aHdoT0gweUdSMi9aRm10N2lQZC94RWt0THdka2wwajNZL3lLbDJkdXRUdHh0?=
 =?utf-8?B?Q3lJc3h4ZDl0L2xJdnJIdi83cHhzQlp4bUdkNFhMSnJrc1Nrb01PeEFzVW5k?=
 =?utf-8?B?SUszb3J0MTRjcHVmdzhVMlh2ZmR3VnlUcXZaYVBTY0N1TmJMSHp5VjRkd1hk?=
 =?utf-8?B?OXlzakF2WnJ5MExYNjRTTmV4MDJRL1YvdVZZWmJkSyszK3huTFV0YWljdnhu?=
 =?utf-8?Q?rkBwyKc3gcA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c2FDUGJScHNCclBFV1A3YWh3QlVrQ0VmdXFKa0UrUkFRcFBPWFlFbU9JUEcz?=
 =?utf-8?B?R1VSRmZ3UWJnbTgydC9xektLQ1NNRHhqc21tQUtra3JzeFR0Qkh4V0N0OVc3?=
 =?utf-8?B?UUpQZW5FNmVTL3pmK1lzanljOEJjYXFQRlFOdktackdVL2o0MnZQcU55Z211?=
 =?utf-8?B?dktEYmUxczg5cXhvQXlLaEREZXRVZW9Id09XSEJ3dnYzeHdORUM4U0RRRCtv?=
 =?utf-8?B?WGdPd0krK3A0UWNoQ3BuNjFxMUVTbU5pS1FEU2FWTDNUWmZQVjEzYzVnK3By?=
 =?utf-8?B?Nm9Jb2loOXdzUkpId1BNSkZmRmNJTnRQV216clNOUTR1UUV6VHJNZzlmTkRR?=
 =?utf-8?B?cnpVTERHZVdlcUJWd2RxWndGY0hPOFYzNURlcnBhQzdHRVF1WTBuNkNZMjlu?=
 =?utf-8?B?STEyUFNabk9HNTliSktHV20xUzhybnpLT3JNVGExQ3FRZDlmUStlN3pSMmdl?=
 =?utf-8?B?VWt4RTBsYXBWWHJaRjhVSlBiOG1WWitZWTNrdXF3UlQvaktRRFFHR3o0YzBo?=
 =?utf-8?B?YjRNRTNMQlhFOEUxRDhYWGNaYTBYQkx4SzlEVG5yK09UbVFSaG5ZOUJiQWlQ?=
 =?utf-8?B?VzR0emdkbW5BcHNrbHJxYkM3RHlrbVp3WGVUMWZHaUFUM0o1N1F4K2R3Nktm?=
 =?utf-8?B?TnBVcDMrVnozd2N6Ykl4SGxmMEJXaDV4NmJmRGNWVVl1U3A4YmdNaFJNTTNI?=
 =?utf-8?B?WS80cGxXRVloY0FVaTJpRU5RQTdreXl5WnU3bjVXR3g4V1VTQzVhU2xPZTJx?=
 =?utf-8?B?RVBkTTRHZWZaOW1YYldhZWVJTDlIcVBBbjIyZFNuNGtBOUdha1lZWWttb3JI?=
 =?utf-8?B?d0l1dzJ1aCtXRDZPZnFBZzFpTWNLQVhncmRKc0ZTdWhBcndBdnEyZE9TblU5?=
 =?utf-8?B?aXo5WjJWZGJYamlMU1VGN2tjbnhQbis5cTc0THV5NVNJQjBvZ0NXbllncGdV?=
 =?utf-8?B?TGlUYkgzck1Cbm5hUDdJS1FNREI4bk5zMVp3U0hWKzBKK0puMS9yZWZHV3hY?=
 =?utf-8?B?KzIweEU2TDJnUStEVkd5c1NSVGZheDh5RGNMUHhpZzg5QUZ2QTRGUVhld1N6?=
 =?utf-8?B?ZitJUDg2Tk00NzVOM2N4eStxa1ltZkxlRmJOL25vQ2pwY0pNVG9iRzVUNE1p?=
 =?utf-8?B?cTBtYjRPWCtldFlWVkZRRHZFeGUvTFM5Tm5OR2liaUJwTFE2Ym12SFlDMmY3?=
 =?utf-8?B?cjRmMGxqNUU4M05nenZhMENtd2IwdXVCVklMUHF6anZra2NFTEFmRmFLNWN3?=
 =?utf-8?B?bmx0dTJBT2dKTE9ISW9KbGtJbXRvSUNKSVUrekZqRVhQM2ZUT0pwR21YU2w1?=
 =?utf-8?B?aEcxd21hRjNQL2JmV1A1QVl2d0RobkdaOXV6Q09DTVZuTlA3QUhhbWFSZm1P?=
 =?utf-8?B?eGU2b0ZTT2pvU3pOQXJZUDljckJGQVhJOFZxWlJGNTNoOHh2ZFF5eFZJa0dZ?=
 =?utf-8?B?Q2VVT1Z1bm5LT3h5cHdUMDRLMGFRbXp2OW9FN1Zodjg1MkhwNU84d2U2dVJ1?=
 =?utf-8?B?cnBQb3dQSE1hNnhXeDltTmdQbGZQa1J1S0QvM3NPWGVNQXFpQjhXRGZkLzNn?=
 =?utf-8?B?NFI0ZGh4dkcxbEJlbzZURnhWWjJxUWt3TndEM0V4ZmZ3cnZqZEdKbzFQUVFL?=
 =?utf-8?B?b2FwSElBSk1xa0VWaWtxMmczUHpxS2gvVXdXZDV1WDhhZWp5dGNJVVlTRlVl?=
 =?utf-8?B?RStiZDc5S2IrckJVMnZ2eVYxQ2NjUkxhN1BzSVZzZHl3WGFGSmd3dDZTZnJB?=
 =?utf-8?B?d3hEUExCemptZjFrMEFPK3M4U284UVQ4TUttbm5kUXBkd210T1JIMjJsUDNs?=
 =?utf-8?B?WHFFUzlwaXVUNTNjeGpWK0djYWVKZVlGeGVUWURhYkdRT1RUbkw4c1MraHZU?=
 =?utf-8?B?T2EyNXgrUE41U3dWcFFxWXlKYXIrQXFMT2dPbmpuMmxDUVEzSUUrUzhHYjJl?=
 =?utf-8?B?VDZiTXdxSHpMbURZOHJFOW1pNXVtZVFoUkJQNC9WUTZUWEhZQmZJYWY1Qkw3?=
 =?utf-8?B?VEsvR2F6TnZBS1NQUktiQXpWUlJXSlB5RmZmclJqR2s4U1piNCtZUTVFT0Rz?=
 =?utf-8?B?bTkwZWFwam9DUmJsNFVLWTdlOEplN3oyY051ZVlQdER2bVBGMHFBZ1J0d2hB?=
 =?utf-8?B?L3kzTWVxYXVET0ZWaTc4UjFaalBZR1BtdWt5cDNCeHgySG40NWhwYnRUQVMr?=
 =?utf-8?B?Wmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c944528-13a4-47cc-6fcc-08dd701853ea
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 05:53:14.6850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZDIAIjaupCOGiKOkMsfvBBk1swAqV6nidmIf3yWDIzXYo4996WmZHYhwaA6dlkHeNHwUz0cfgjJ+4m6BrnjmAUNeZgeHTKiGhhF48G1kayg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8036
X-Proofpoint-GUID: N0w_SyYraijH2Ui2g_Np_E-XXh9C5X4d
X-Proofpoint-ORIG-GUID: GjZ_np91DJeVDBjUa0CxUI6dMmY_H5HL
X-Authority-Analysis: v=2.4 cv=RNizH5i+ c=1 sm=1 tr=0 ts=67ea2dcd cx=c_pps a=AHWEOuZXH7ukEk4XErmcRg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=t7CeM3EgAAAA:8 a=x371YStIwVRFKkmwGsQA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_02,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0 mlxlogscore=935
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503310040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 05:53:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213933


On 29-03-2025 20:56, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Fri, 2025-03-28 at 16:56 -0400, Randy MacLeod wrote:
>>   On 2025-03-28 10:30 a.m., Yash.Shinde@windriver.com wrote:
>>>   RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
>>>
>>>
>>>
>>>
>>> -#After updating to Rust 1.85 we can revert this removal of "src/gcc"
>>> -remove_gcc_directory() {
>>> -    # Ensure the gcc directory exists
>>> -    gcc_dir="${S}/src/gcc"
>>> -    if [ -d "$gcc_dir" ]; then
>>> -        rm -rf "$gcc_dir"
>>> -    fi
>>> -}
>>> -# Add postfunc to the do_unpack task
>>> -do_unpack[postfuncs] += "remove_gcc_directory"
>>> -
>>>
>>>
>>>
>>>
>>
>>
>>
>>
>>   On IRC, Richard said:
>>       I'm puzzled as the rust space fix didn't have the impact on the metrics I'd hoped for :/
>>       I think there is something else going on. ...
>>
>>
>>
>>
>>
> I a look and realised the issue, the trouble is S is not always
> RUSTSRC. I've sent a patch, hopefully the metrics look better this
> time.
Thank you for looking into it and identifying the issue.
This should certainly work.
Looking forward for the results.

Regards,
Yash
> Cheers,
>
> Richard

