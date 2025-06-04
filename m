Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2FC1C5AD49
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 02:28:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7165.1749004126446527529
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 19:28:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82504e28f8=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5540Vrr9004951
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Jun 2025 19:28:46 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2055.outbound.protection.outlook.com [40.107.100.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rsuy2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 19:28:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yI/gA89nSBNEvF5l3C6Kz0/8h3pdLx1eauyAho5CKue7l+9J/4QLqp0ZfqF7GtnrSvArwfZshPnNnH41xX2/RlLU1gNSN7FTLKiSsGEvO18QBoY3fgjoAyTvG0xuxs4TBnAZfEII/zmssDqu6iAm669MNJWEFN4vSoCxlxQnMoDHrVb1Yl9dB2hfYjEEmzSbe8SxcRCx64ZFRZAJwSv6lwffPrUbMIcwGI1j6/Ey3XPje7AxB6mq6+XhZQExN5KGkIvkAzS36qHeqSOULs+iQ2zOry8PoQnQ6LXULrt3L+8REHRexoTFKRmuPwtbba5O0eZC4fo7LW//fCpF+K2iGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ossdMFtRHmN06KrEDf2cwtTB9rm4+ic2xnALQDglDI=;
 b=L6ifK69CsCPTSf8f5lov2h/tnxiSQ5bTLKfPxersUTavx6t5sS2TKi+Hq2wPlnsjwGQH/tyg0e0wwcHIFppgH4wzuHE39ihZJ/V9Oe3+1XSGxfWt3wO2CJbqbOgNSOHNCoEU81bIIUzbKCXxWopi/Pyld8BsuaL3BtxQd6bZcRlZSQYteff8LiBJGWYE9RMgLdYASiIFqKIX+bir+0aRSh7NgPXnbd0rKRAWqCcSyQ7Y8r42eoGnmJxuYlbCPx3Wz8AFosj1zaBuO9EmbumwVTBSUK5akqzKvT+IDegPEtn1sO6PMheQSOtmn0LqqzhYAZt2ZU8SjJcI40MqE+2ocg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM3PPF01A5BE19B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f04) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 4 Jun
 2025 02:28:42 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%3]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 02:28:42 +0000
Message-ID: <eb44dbc9-bf68-4cc4-90d0-cbc4d1612cf2@windriver.com>
Date: Wed, 4 Jun 2025 10:28:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][walnascar][PATCH] yq_git: add back apply=no for SRC_URI
 diff
To: openembedded-core@lists.openembedded.org
References: <20250604022059.2192970-1-Qi.Chen@windriver.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20250604022059.2192970-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0024.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::11)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DM3PPF01A5BE19B:EE_
X-MS-Office365-Filtering-Correlation-Id: e70e03cf-e1a3-4416-d907-08dda30f85a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aThES1dMd2U5ZjV3TTBkZU9FamY4RzRQUFluTy9BSjIzSHAzWU5xQTBxZ2lH?=
 =?utf-8?B?L0pXR1NRR1gwMHEwQS91aFcwVC8zSEZTMnpidVhRbEVqR2o0c3c4NUVRVmNZ?=
 =?utf-8?B?SU8wb3RQVE9JNXZkSFJreFpoWmw4bXV0bzc0MjFsdzQ1cHRKdzYrYStORFEr?=
 =?utf-8?B?cHFoRmFobWM5SEltTVBtb05TYWQ3bVVtQVpBR0o5T3NOZXlDQ0h4YWRoemh6?=
 =?utf-8?B?Qkg2cDJCdmVzeHVrcWtNVG41c28yUnRFL2tsWVN4L3VqSnVCRjVIRm5BUSs2?=
 =?utf-8?B?SWdZK0xFTm14LzREejNzT0xTdjlKeW5MWmRlYWhPL0ZMK0c2SkgyUlQyRDlE?=
 =?utf-8?B?WTZDMVBvaW1TUTZXTzdHQVdrS0ErYlNXNGpwVUpEbnJLY3dZMVlKRWYyRU9j?=
 =?utf-8?B?R2tmR25kMXVvWTR4NEVNMEUyU2pVd0hBTk1jMHBpZDFEdHlmc2JmTWJlNkdX?=
 =?utf-8?B?aDNFM1o4WkcyellqV0E2anBtNlFXSVZvYUVjYnFpWjU5eUl2ajZRYnRlU1cw?=
 =?utf-8?B?eitNdzg1UXg3TnhVdGVDbVpwOEJZckcrNHFEVzltTmRDMHF4NWdCQlpnZGVB?=
 =?utf-8?B?ckJ0R1JrNTV1VEhvQ1FPL0tpeE14SDAyZ0ttT013SmpYZzdLQTI4YVcyVzhS?=
 =?utf-8?B?STRLeTkwKzlkdzNqN29OZGk0bVhVbFNsUGo2RnY0M0dpclcvaEZqb2NJRURP?=
 =?utf-8?B?dWkvdVdOYm82TUV0aU9TK1Q1RzIyUmx5Sk1kdUhKRldXczVBZmlXVzlHRkIy?=
 =?utf-8?B?L2JKeUpwZnhrcnErS3UzTHlWNXl3ZGMxSHRGSDFvTmhuMmhoenV6UFFIb3NK?=
 =?utf-8?B?QjFMWVp5WmorNlBuRi9iOXRTSWR6aHRCSVZBTWMzVUpXZDdWMzNrNXgrcHFp?=
 =?utf-8?B?dkt3M3NNeGhUQnEwT3FVdHhXakhCY2x3UzRRTGR4SWtVNUp3VTB0WUs3SHFZ?=
 =?utf-8?B?VWhuME0wdndOWGFTMXA4aWh2Q0tieU83Nll4WFBZcUVFdytCYzY4czV3UlNv?=
 =?utf-8?B?M2ZFcWhyaEczeEY2NFYrNzhzdkFNMGQ2YVZ2NWVjVHkxNm16NHpTazhsdDNQ?=
 =?utf-8?B?cHNDQnZjMHVGSXlGTFFaeWdBejFWMmQrYmJqbGd1VWpLNCtKYlY3Z0kwTHEr?=
 =?utf-8?B?TXkxN095dTM2NUcvbHlYQ05ocW1pZlpaYWdyd0ZPUEFydVYwR3RKV2pQWVQx?=
 =?utf-8?B?ZVhWRG5vTmhjbzNmUy9pajVFdnBkNndveHpyMC9lMzkreEJpYW9JcGppRzNr?=
 =?utf-8?B?VHJtbGZ1dWFuRlRUYlR6QWh4TGd2YUJPdGltVzEyTEVmakd1VW9yc3VFOXlp?=
 =?utf-8?B?QkRKSzd4NmJMNzYzZGVMRVVKRzg0UWZQRVZHdUIyZHB0bEZpYkxRYk1KcXg0?=
 =?utf-8?B?cUs3REVUTWVqV0EyVS9mMkhYbHJuVXBhbnhXc2JvS2FvUkZoUDdKbDI0NW5J?=
 =?utf-8?B?bmxWS3lnUVFVeE9VaXozQk5PMkJqL2hQZ0puOWlVNDJ2MVNvUExOQU1FczA2?=
 =?utf-8?B?S3JhampBY3BNT0FvWExqVldaYStQYVViRG9EdWRYa1BqRXJCMTFPTTVRdFIw?=
 =?utf-8?B?N241c3pyQXdzSyt5Y1lrS3JrRlUwZkhMNS9XR2JxZ1liRy95NUdLTHRTbkF0?=
 =?utf-8?B?N3lSdUZLdmpyek4zcXJ6SXRKVkY2Rlk4Nm5MYXdJRnV1QS9WWjlJcUxRdzF0?=
 =?utf-8?B?eThIVkp4Wkx0b0ZVUHcwaGlBT3I0UTJOc0RIaVZHSDRaTVZjUTlPeE1CeW9J?=
 =?utf-8?B?RnVVRzYrOWpNR1IvbDZOd0QydzVPSVpNcDE5SlF6TkZOR1diS3FsZTc5K3Ew?=
 =?utf-8?B?dkRzVHJndGhhdUpTcDhwVzlEbzlObEI4dVU2YkpLN0xoa0gxZndtdGF3TXdJ?=
 =?utf-8?Q?ZJTSUUitKo5ir?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R21xV0tGTmZFTmFBYXBydFBxOTlDLy96dmR1SXpXWnVHS1N6YytLMDRHRlNv?=
 =?utf-8?B?MVNKRjJsRDByMUFhakEwUXdUcFBxVmdPMXlpejRja25tbUdXSSsvWGMyRkFy?=
 =?utf-8?B?U3lDUDhpMWVIdW0vemRQMThwV0hueEhTa25peC8vaGo1dlVDdmwwTzF1TW44?=
 =?utf-8?B?ZWt6Nmt1WC91aGMyUjhLb1Q3eDJCMzFEMm1LWjdEQUVyQ2tiRGdZMDdtZ01H?=
 =?utf-8?B?cmlMdXZZSVBSM2FYWUNoNEpWaG5BdkZvdGxkMGdtbnhpenhSd3hVTXdQR0sx?=
 =?utf-8?B?eitNQWVpZ3FoaXNiei8rZ1JYRTFtSER3SnNCSFlpQUoydkl2aTRmdnhET24z?=
 =?utf-8?B?ZHRSSnhTa2UvK29jcyt1U2duVC9GUFRMRGlzMTJuUmhpMndmSWxLY01SaWpX?=
 =?utf-8?B?T2xSVUhKazJvcDlSaVp3SVBjVXNSVFVXbHZsOTZLSEU4YTNVc2pPZ1JpVzNi?=
 =?utf-8?B?azcxc005Wjh0VFBKYTVKdk9NY01SV1I4a05FeEN4alJudW9qQzYrdHJxbGxL?=
 =?utf-8?B?YWxIUTRLbmtocEx3Mzc1eUlJVExCTFdzeXYzN1dNb0p2dFVsS2Y1VTN1RCtS?=
 =?utf-8?B?cFRpY3BLRTFqVC9sWElralpZUGROY2poR3ZnZUwzcG1YSXZBRjNLOHp2L0h4?=
 =?utf-8?B?NUFnZXpJMU5valoxUjFKVllkSEh3QWF6YWUyTVBjK3lNYnVJSlNNc0orU3po?=
 =?utf-8?B?Mms5aytiRnhRSGlpM3ozUE9WV0o1d3JBMm80NkdlUE9uSVpxMEtydXVnajlx?=
 =?utf-8?B?c2hjN242SEJZdWJzRlJiTDFBVHA5UE1uVEk3dTJ5VUNySUMxUnpvZTJqMXdW?=
 =?utf-8?B?S01tcFVuRW81VnNnV2hNR2xMck83U2duTDhKL00zMGJCdXBDSVNCODdVRVhV?=
 =?utf-8?B?TVg2Nnd1dlN0YlhQSll0NkhxNFNYVWpicTdrU1NXZStidWw4RjQyVHZwdy9v?=
 =?utf-8?B?SnRxRHpzTHlBbmtnT0M0VThmeVhLZGdWMnlPUmZ1MzRjY1pQaTJINWVzSFNV?=
 =?utf-8?B?b01PYVZuZVY0cFVZUU1sVkNFa0xhSU5ScEloWitKbDY4NHh2SFZsUVFsZnNK?=
 =?utf-8?B?U1NoMTMxbDRDQUN6R2k5L3FlL3M5SWpVcUtUWFFYWkZQY0lXZWxkbkVUWlpM?=
 =?utf-8?B?YlBSNk51RGlRdmdBTmh3bmFYWHlnZUZXbEMvRHA2TGVaelBOU2lTZjVoUDlX?=
 =?utf-8?B?UkhzRUk2TFVxcWloUVJRSldCNUUzdHlsTDAyMFpGcWJINjh6aHlFUXNQdUhN?=
 =?utf-8?B?WnloamlxYW1hQWc1RHNiRE4veVB4ck1TOTJ5cXdRd2pmbkMrVEVIWEZpREN3?=
 =?utf-8?B?elFwcTNqSklZL1cyMWlvdVZNZE94UldKUDFhRFNtbTdveE8rVlhLdGhXdnBW?=
 =?utf-8?B?L3RTdTJ4bDFFYUVKUXZnSDlXZ1pWelRUZHloV0hlQ0tGQnN3MGQ5QW94VVli?=
 =?utf-8?B?amo1TUlTL1lOajhmNWRzRUlVaGJYSkhZaVY0S2IyZW1zTmxwOEhQT3hXRWJJ?=
 =?utf-8?B?dVpWNS9PWjI3dENySERRRmJOSjNxc1cwa0hXVnV1MlFOZ3hPME45Z0ZqbWRD?=
 =?utf-8?B?TU95QnN4aHF3TzIvVHl0MDdGbE5xUThjTVF3eDY4WGVYR1paSlZKUHQrei8w?=
 =?utf-8?B?RGoxUXBLT2thR2R0MjFnU0lySmd0a0pKYk83bEMvdEYzTHNZY3k2a0MwU0ov?=
 =?utf-8?B?N3RDWUoycjRtVjdZV2tRNzRpWmREcWE2SitUYzl1K1N0MEd2dVl2OU9zYXl0?=
 =?utf-8?B?S1VoVDg1bHYzNlBUd1c3NEQveEhWOUt5TThCSC9kcGtiaEVrOVcrbEdmdDE4?=
 =?utf-8?B?eFJtT2J0RkhCV1h5OVdSNjl0cE53RjNWTkFacVhFVllYWWo4NlhRUVpYQXln?=
 =?utf-8?B?cE9IaDVHcTh2Q1h6cWllTkxNeWtycC9hSjByVTRkZndHdy94UDlQd1IzUGRD?=
 =?utf-8?B?WHBTYmJrclRNLzRLOGJCQUxIQUhReGdXR1VSdys1U3g1MmFOK3A4MWNCd3Za?=
 =?utf-8?B?dlJFWUMvQVpadjlGbCt0dGoyY0h2Y3RtTER0TGxIS3p2SjNGR3R3WXIyd2RX?=
 =?utf-8?B?OFFnY3o2VDAzays4dmdZenVMNFZ5Q2ZMVW1SWnlYSHgwcUhmdDJqMGhMcXZY?=
 =?utf-8?Q?NZMRJ1/+OpsrqHjdRVpOnlvwM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e70e03cf-e1a3-4416-d907-08dda30f85a5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 02:28:42.1804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k5B+0mijLlMEtQegMe0smwFpgPTI1mlKCJM7nwNBAeITt3/MMWHrvQZufSSIwABeIYJAV6vlfQK27NdW8sizIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF01A5BE19B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDAxOCBTYWx0ZWRfX50adewhgxd3h 5R7f1dj6aUsoMSVv7HghOuOJUtsUEApHEeRwIS7TacyPnWzB4rhZdGdjlCVAWGk3KGi6fWeaZvI +hvtRMgHGURRm8G1um6r9cOWm01tjMlGv9TYNmYTezBRGlT69QePD2gqs6/6DFZYiiz3peTQhdd
 yoBJ4eIytZddf2mDzXYXOdFdE5/mPrQI7G4ERHo/u7KMFww9Tof67HeuZQoLZULzpHS+a62BWdB NdoHxSXAqmd5oglIpzbUcoYjU0y6CblzwRiZZeInbuITw0DBMhcNr8cPm1sm+v2ZRW7Yt3SknbO ZQEueIN348rMruFAax6pqX7yt58dnMmICVG8vnCh5EhGwglXVfKEFgalejMpy3tTuhB3jNTiqW3
 Ff5KqpegeN3uCM8XQIk+Chkh8+GEeluPvnCKdd41yXiJwtIBSMsKD8nYovAisntsutiZp6Km
X-Authority-Analysis: v=2.4 cv=PvyTbxM3 c=1 sm=1 tr=0 ts=683faf5d cx=c_pps a=7vtyjtHNWIjm7SETg3ckJg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=Oh2cFVv5AAAA:8 a=pM9yUfARAAAA:8 a=NEAV23lmAAAA:8 a=294mSKZR-NbTnwO13XsA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=7KeoIwV6GZqOttXkcoxL:22 a=YH-7kEGJnRg4CV3apUU-:22
X-Proofpoint-GUID: Y9_qTWv4doAi6bASCQqD9VavRvk89nvb
X-Proofpoint-ORIG-GUID: Y9_qTWv4doAi6bASCQqD9VavRvk89nvb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506040018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 02:28:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217831

Sorry, wrong mailing list.
Recall this patch.

Regards,
Qi

On 6/4/25 10:20, Chen Qi via lists.openembedded.org wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> This apply=no was dropped during last upgrade. This causes
> do_patch error when using git shallow tarball.
>
> The original patch that added apply=no is:
> https://lists.yoctoproject.org/g/meta-virtualization/message/8804
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   recipes-devtools/yq/yq_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
> index 9682ec95..b1700bd2 100644
> --- a/recipes-devtools/yq/yq_git.bb
> +++ b/recipes-devtools/yq/yq_git.bb
> @@ -25,7 +25,7 @@ SRCREV_text = "566b44fc931e2542778a18423c655ce99b4f1402"
>   SRC_URI += "git://go.googlesource.com/text;name=text;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor/golang.org/x/text"
>   
>   SRCREV_diff = "20ebb0f2a09e612109b224b32f79370409108bcc"
> -SRC_URI += "git://github.com/pkg/diff;name=diff;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor/github.com/pkg/diff"
> +SRC_URI += "git://github.com/pkg/diff;name=diff;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor/github.com/pkg/diff;apply=no"
>   
>   SRCREV_color = "1c8d8706604ee5fb9a464e5097ba113101828a75"
>   SRC_URI += "git://github.com/fatih/color;name=color;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor/github.com/fatih/color"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217830): https://lists.openembedded.org/g/openembedded-core/message/217830
> Mute This Topic: https://lists.openembedded.org/mt/113460032/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


