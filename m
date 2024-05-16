Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55006C25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 10:57:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10554.1715857021284800444
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 03:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=586694f6a4=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44G7rhZI001292
	for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 03:57:01 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y23xymapy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 03:57:00 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 44GArphQ017217
	for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 03:57:00 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y23xymapw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 03:57:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6nUSqWLtn1gjwU6pctfh4KJiXsX49dm4MRC17k6mYXVyGwQZgzFF6430deEuVsSg/69/4leIbj2AdV5YksxsvbZ2835hNEc+0KwzQDr9ya1dOSKfBlYF+6YGwD0Ozy67EpAges0w4N7DkIZyHHG8oggLdrdtUiOHmFIKn6qRQYHJUuKZl0BRK9lgJ+uxGy86jqs+Hz6ONv312iIjNv5aRsfC+q9L5VwJHHRXdhS/N7CCBAkMzvpEpSqdK7p4if55v2gK0q6zhnYEgy9RaR9aee3F1ydmlc56FQ7f+e5ZwSjqhvPfUHKcwp7RYVHTtg1eGx+IZpy5aOe290D/V3I8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQfEDU6o+gS4NkLlrid/D7Ap22IIoP4hk6DDmH6MFu4=;
 b=a6i1A3C8USKTUoQekhqSw5HKlLlIxxtTFIXSMUO82ALDnrzk5eVfMnuNQCb33CBm1azu4/OSIkJ5Sqc9o0t+JBP0eArMUFLBwInUsQw4qBfQBH7k23e8U5ClpOnkyVI1+KH7abJob36uPg92oUVQZCis3Ls+mkKl6GoozmKaH68BWEPbJ7fJImPGNPTnlZA/K2Pq58VJAiBRc1GzGgq+CkUuS1+vfEKUBupRsGtngfrT3R1o0fzS3kFIjfwhbSlHM9LUG2nkZLa4V71GneTvwM24HPmHg4/gItF0FyOEow1OpqxrJLnEdglGw2WaUWh5WSp0EHWoCovXagJXk2aqlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CY8PR11MB7921.namprd11.prod.outlook.com (2603:10b6:930:7d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 10:56:57 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%6]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 10:56:56 +0000
Message-ID: <0d334189-293b-4a11-846d-a0ffd96b2624@windriver.com>
Date: Thu, 16 May 2024 16:26:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Debugging rust oe-selftest failures
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Richard Purdie <rpurdie@rpsys.net>
Cc: randy.macleod@windriver.com, Steve Sakoman <steve@sakoman.com>,
        alex.kiernan@gmail.com,
        "Kokkonda, Sundeep"
 <Sundeep.Kokkonda@windriver.com>,
        openembedded-core@lists.openembedded.org
References: <CAO5Uq5Q4f4Q+3yR6JZcxhXOP_mpmyzJ0yYtO5SO1_6ZOwdHEzw@mail.gmail.com>
 <6447.1712221622103634934@lists.openembedded.org>
 <CAO5Uq5Qd63-mJWhQpdP28kXVtHWjk-607c_RK8xm2dshyfHWJw@mail.gmail.com>
 <a5b121fb-b530-4242-a786-1e7b54655ba9@windriver.com>
 <CANNYZj_gjybr8x2zxN5zSWQjoXRxHv43-vZW6ME_E7hhkqJVcg@mail.gmail.com>
 <533e019b57c5acd6ebb35163fb1794cd28166052.camel@rpsys.net>
 <CANNYZj_yRH35hb4UBVXQNeZ0CTteUu5-abGXL=itgF67yjj_VQ@mail.gmail.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <CANNYZj_yRH35hb4UBVXQNeZ0CTteUu5-abGXL=itgF67yjj_VQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0215.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::16) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CY8PR11MB7921:EE_
X-MS-Office365-Filtering-Correlation-Id: 420c67fe-3a25-4cb7-b390-08dc7596e73b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RWdBelcxcFg1a2RWajRhT1hpMzRiZFdRd1ZkQU1uRDJFRVlYNXhWelVHUE5F?=
 =?utf-8?B?MklsenlLODBYb0pHUGRnNElWM2J1VE96Y3JpL1VJdm8zcHdoUFZJQ3ZDWjBR?=
 =?utf-8?B?QVpwUkFtWlppSS9VS1RQaGZGZlNTajRaK1MreEFiUXc0Q1h2YkZJRlhkN1N6?=
 =?utf-8?B?S1o2dk1xaG1VN0prM2thRXJUSGdRek5jazQ5cExHdkVZVVp2R05XNVdySjFo?=
 =?utf-8?B?V0Zxc2txY2lmNVNkOXk3WElaOXdGNERXcG9GQW44QjBuRVRRdWU4d0dHalJz?=
 =?utf-8?B?TEJsRytGMWtOSEhMK3FRdFZQcFZpUEtYWndvaGFXY3VsUG5tcDlvUld2bnpW?=
 =?utf-8?B?L1I3TVFLaWVuSGRhRzkxZk1GcDhmcjhOVlpEdDQyK0hxYm9WWFVxaXRjaktt?=
 =?utf-8?B?ZldZeGNKZ0p6SmNJV0Ryb21selFwUWl6T1VkMGtjMUJuNmFkWFErdHJIU0ht?=
 =?utf-8?B?MXJscnFOT29UWXU3bXRJSTZneUROcWc5NUFBMzdCQUhsUk1uRnNPaXF0SVpP?=
 =?utf-8?B?L0JOZFJNZTZUU1lGSHBkYXJLTWtrOTBpWmZhbXpoWkh5WHpjYWttSmZqVXFh?=
 =?utf-8?B?bXlZN2tNNS80SUJORzZMRlpyOFlObmt0U1FyMU50ckMrdjZObWRHd0VGRExm?=
 =?utf-8?B?S2J4bVphWER5TWtTTVl1UmZHeVhzT3BJQi8waU9hTnhJbDNEa0VNS3h2eHlW?=
 =?utf-8?B?SFdhZ2ZQM2VvQXpkdFhWSUZPeUx2MXRZQjBxaVJQMk5RdTBtSjNZRHIvSGZz?=
 =?utf-8?B?TGJJV2JZZ3IzZnZyNHRsZlpHVG9KUmN0Vml5TFZJVUdPMTVGdU1nbWdpSGpW?=
 =?utf-8?B?RjNnZUJEK1V1Vk94R1QvSERNcDc0Z3ppV25KMHNBQW50RzF1UFdhNXFLUkll?=
 =?utf-8?B?WHI3bEh3Q09DL3FiczArSG5EMkpDRXM5T2tnWUpvUzF3bkE2d0xQZU1oaTdQ?=
 =?utf-8?B?bldFaXZpdXpVVStMNUdBMUlrMEdLRUlWdjYrVkdML1N6eVlzUTZHY3pDTWhT?=
 =?utf-8?B?ZHJPV2hyNHhJTmdlUDhDdExXKzNSc3ZrSTRYSnFoZys5NlBFOEZrSWNsM0ph?=
 =?utf-8?B?b0hDVENKYno5ZXpmTCtoaVU4NXhpekc4U3RQM2ZYNkhFZzlJZEhUWGJwZWt1?=
 =?utf-8?B?R2R5V1FjYlhuWmVFT1VkcDNuWjRvMkZKUVJWRldyM1d0aGZ3NmVxNk9BKzFH?=
 =?utf-8?B?djVIZWdOR3JNV1hUdmpBdzJhWFpkVW43R1RUNm4rUTJhWFVEaFFKQjJWbWhV?=
 =?utf-8?B?MlV1WlNxSXBXcFB2b0N2cUJCM1djUUdmVStjSDM4TVYrZlRCbm9DbWVrSUtE?=
 =?utf-8?B?THRwNmpmSGYzN1dXOGx1aUVZVFNzTWczNU5JVDdOVllrS0JOQW1vZStTMFY0?=
 =?utf-8?B?NWE3ZWNWbUlaWWcxM2R1R245aFJXbENYYUFFSnpGYzN2Z1VmdnpEYVl5UUli?=
 =?utf-8?B?RmlZY0dHSDFwdC84TE1QT1dQUXdmN0pEMHJFZExDdnkva2l5dnNGdDdRWHlP?=
 =?utf-8?B?NzB0MHFCdStVNmNoWUo2cWNucGhvdFpsNG81VTBWdjZQemJNVXZ3SEVLaDc0?=
 =?utf-8?B?YXE0dXAyZktOMWY5cnU2WnhCc3ZtbkY2cUFUQVJva0x4bVVmZXE2OFo3TlJI?=
 =?utf-8?B?cWFXOWF5SlUvNEZCNzRWcWpKYTVaelNRZnkrSGRxSFhSaFJVOWEyRG1iaWM0?=
 =?utf-8?B?U0hmRTM0ZWdYUlZKOVc4Sm91M3ZsenZaNE8rcVZHYnQ2WWhKbWIzLzNRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SFl5bVk3MURwSzRscm9PamRocE1pT1ptaTlPN2dlbWpYTVlQTk5KQkl6cFIx?=
 =?utf-8?B?V1BqaUJMSzU3WEdUTnBGMUpFNEM0TmZWaE9nbFNqcUlYUzRjbEhZS1VwVUhu?=
 =?utf-8?B?Y3kyMWx5UHZ4VVc5ZFh5ZnFSZS9KU0ppZU8xekV2N0ZWZ1JmMTBMVktnTjlZ?=
 =?utf-8?B?NEd1cW9ISitmYnVvQmovSWxod2hwT2RKblR4RVdRbkh3eTVZVGI1Si92K05a?=
 =?utf-8?B?Um1KbnNzNzQ1dzhrd056eG1jOU9LS2RtaUtrbjYxbGFXdHlzRG1mMnJ0eHZL?=
 =?utf-8?B?V3NXSU51Z2podFhRQmZ6UWx2VVl1R0M4SFJLcG1XQjdQVU0yMzdRcUZ3ZWRs?=
 =?utf-8?B?QnhzWXdvd2ZrMmRtM0dMUmhGRWxYT01oUmxIL2ZZZU9QUUV3UlBqTDl1cVJ0?=
 =?utf-8?B?VWw0d3RXbHA2cHRPVkt1d3hRUU5ublpaNmdIamY1T0p2QUM0b0FzUmRoZ0ZP?=
 =?utf-8?B?MU45ZDlGb2FsT0c2WlN6OFBGRFc3dGpQcW9LeTI1cW1wc2lkK0RhZ3NCWXRQ?=
 =?utf-8?B?VjRHS1Y4bDBLd3ROVGFYYjNxMnJoaDZJdytLNTNLb2ttOXByNlc2bUpyUi9q?=
 =?utf-8?B?aWlkMTZMTEM1NEVsTFJHRnAzT2t1VGVuNUtKQVlVVXFxVGdCeHFvNjZsQUdE?=
 =?utf-8?B?aGRSZUM0ZlUrMVlmcFVoK1FBV3ZCYThkbDRSQWhjb0VYY0JYWHFzRjQ5bExI?=
 =?utf-8?B?N1VtaGdBNXNsV3YveXFTVDdXcXFHVGlPOEM1bkZvVkgyTzl0cEVleGJiTU9D?=
 =?utf-8?B?cmNJbnFGUEtuNGI1UlZ3QkFER2ozR1BXLzRqbGEwb0xXSW1jSlVqdXU4RnVX?=
 =?utf-8?B?V2ZzaGlUeWVKb0F6SzVjNmw3aTRhQ2lEWWRMSzZIRS9hdFFvYjZ3RjF3Mnlz?=
 =?utf-8?B?dlkyUUJWcytucmF2cFFaTmU5azV5eUtIR2t4byswajgwNWRSK2pLb0xTNUMz?=
 =?utf-8?B?ZWlvVnNNU3B6MWNGRWpoa2kvOWxlTjVXMk1KMDlsZ2YyYi9HTG9JQzBLTno0?=
 =?utf-8?B?MEhKS1I0QkNyTXVUSTNrdm1jOWlmVHZ3bVJmRnJabGlvSENYRUx3dmN4OHBr?=
 =?utf-8?B?Q3FIUXUrdmwwd1lYdW0xU0hYeGo1TjRMRCsza08xWHRvOFZqMTZFZmUwa05a?=
 =?utf-8?B?RlZhVEhrRG1PMVVFdjFhMkRESU1NV0xXOHVNZEthazVkbWFBd0dtSkl3YlZW?=
 =?utf-8?B?bnlPUER5WFlFVkFHNXF3RVhDQVVaMFc4UlhpclQyR011WHp6dTE5d3hHbjEr?=
 =?utf-8?B?Q1pTUFNlbGNuQk03djFsM00xcUcxYjJJMW9zd2hmUEtzenhTVUxLa0lFUjFL?=
 =?utf-8?B?Ulg5Y05OQnpKOXNKRVhzd1I1U1RzM2wwYm93L0tpWFRkenorKzlwZFd4MFNI?=
 =?utf-8?B?eStMWk9xK3VEWXRjSmNmSndhQnpyUEJJVEhQeG1Kbm1MZGpCM0V2N2tWbmow?=
 =?utf-8?B?VGJxQkM4eXN0VG5rN0dDbE9VSlhlOHl5bXhIZW5nMGtaQXdsNG1Bckx1QTBT?=
 =?utf-8?B?b25EM0xSRVpCYVkyRDJqYk1CWDZ0MG5JTXI0VDFlSG1oYXZmdENEYm1kNzNR?=
 =?utf-8?B?YVdNd0xpNjRZRDAzWHdPQWY0d1FjOEJ6bWhWazZWNVVvM0ozc3EyUlRhS3ZD?=
 =?utf-8?B?dk9JbnFtbGNuM1RWSTN0SGpxR1l2Z0Rhd0FncUd0S00wdGtNRjB0WFkrc2hE?=
 =?utf-8?B?cDhmaHpUa3U5dnEvR3FOV2dibys2QkNCNXNCdWlSb0Z1eXRXRFE2ZXllTkJM?=
 =?utf-8?B?c3dGbEdRZVJIdzNEbnJzODZ5M0xNWks4NTlVZHZidkpzdkNRc3o1YXR6MW81?=
 =?utf-8?B?U0NEWGhESXVSVXpMTHZaZGdjdlY0Z3lzMkMvYVlvUXJqUE5kM0ZzS3BlOUZC?=
 =?utf-8?B?ZzBwdWl6a0JvWXJpcFNDSzJhRG5JdjVKd2lZU0FQcG5TdTZyNkIxcjZrUGd2?=
 =?utf-8?B?U25oMUVKcDRURDBNY3ZxT0FpdklEVTlUaTJPRFlNR05CdkV0cHpBczJKRDdv?=
 =?utf-8?B?WCt0Z2FhZ0tkdHhrUGtYN1M4eFVWRTNxdnRPT3Fmc1lLWFp4cEMrTDhPbVJi?=
 =?utf-8?B?OEZQdUY3R2FGdGxqTFo2SitVMC9jdk14VHVSYUxMZ3lBbk01WXloSVdjTEJr?=
 =?utf-8?B?S2F1RzBiclM3R2p2c1NsSDVYb1l2aTF6dmg2eVhEdXYyYS9QamwvNFhEU3NY?=
 =?utf-8?B?c3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 420c67fe-3a25-4cb7-b390-08dc7596e73b
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 10:56:56.7603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BCCLfYyaGAyMHApS4du3EXnAhzrDJ9VzxbcCTjpy/CdbkkbemuZaSeR3FuBGQ8DNir4bvhBm14Rz1BdFBASY9ZINEwXnEAQDHdsIySzQCVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7921
X-Proofpoint-GUID: sk2M2lFPFnKbYLhT9FousWeofnlqtjHK
X-Proofpoint-ORIG-GUID: NSM_wpQs5occr74jK_YFTeQLzlz7-TTI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_05,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=977 mlxscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1011 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405160078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 10:57:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199458


On 16-05-2024 15:53, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Thu, 16 May 2024 at 12:15, Richard Purdie <rpurdie@rpsys.net> wrote:
>> There is an extra consideration to this unfortunately which is
>> scarthgap. For better or worse we have an LTS release with a mostly
>> working test suite and this arm/x86 issue is present.
>>
>> Should I take the patches to master, the next instant request will be a
>> backport to scarthgap.
>>
>> That gives me pause for thought on what to do here...
> I suppose we could give people who understand the test suite time to
> unbreak it, before updating rust version. Then both the AB fixes and
> test suite fixes could be backported. I'm going to send the ab fxes
> today, just writing the upstream report now.
>
> Alex
>
We have rust 1.76 and 1.77 upgrades along with test suite working 
locally. Currently, we are testing with 1.78 upgrade.

IIUC, Alex has another series of AB fixes which breaks the test suite.
Should we check the test suite with those patches or sent them to the 
oe-core mailing list?
Let me know your thoughts on this.

Regards,
Yash

