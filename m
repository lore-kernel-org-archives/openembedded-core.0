Return-Path: <Quan.Sun@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96516CD3445
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 21:35:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.587.1778276154626725291
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 14:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=XBaMv3ZX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9588a7e730=quan.sun@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648L6g3H3194500
	for <openembedded-core@lists.openembedded.org>; Fri, 8 May 2026 14:35:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=URudFSCRldfnGtK7SsHjqZwGADMU5TxL0Jk+IJiJ9og=; b=
	XBaMv3ZX/p+vP5r1qP+XznzSefmLy/pbBV6hwwHJPZ5x2isQG8L6VQwijIh+joyC
	VjNh+9uqdW5CntDVKT2vYTRvpzK+7aRZUHDZNyiJqzU6lPYSINOVOsI+XBhB6Dj9
	gnoQykCSaJAsZAvuEravMEQHVBdrrEDrOpN7J44g0no3UywFzGHIXKDnx62YTxeK
	LpijXbkNCKOQC5WBEcEe4P+4couTjYgyZ9LPuTfSr19ZugH1tcqgqfOxgrC/qzNI
	t+bVgVZaz4QGBUqJ2rTCd6E5OmK078Pu/iwb5Fp+tfVKOZv1Cs5uni6osnq4/ogX
	/3Yz7iyzc+dMDNOnKl6nFA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012011.outbound.protection.outlook.com [52.101.43.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e1hmn0f8m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 08 May 2026 14:35:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UA3ruXs5r/0++OTRMqS0GiFD0ggUjtrqpsk4Bvc6LJNOgz3dGVYiAREj3z6cf12zNnNQKS9ytByyzDF55T2BkpwW4teaQ9XCDgVy1SoKsl4PiAfK+UD9F63kd87r0NIbVs1VPEpg95vma7oaUJQrdiTkmfmuRSoTfgbOI2vLiUxD0c0/tZmhK1ULUOssfrL5SAUQu/1b/buR3PWcvsZ8lMh2RecMOEibe68J9IDtJC3W9gqUX6ioECAZhtrvuv8ALkhMdRQel2QU/hK7HY4kY6HJ85U/BsevHrTRnISr8yCXbXHQGCeozbHl9jYBGRXsR08Ad1sWo7vcd0Vfm+vBjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URudFSCRldfnGtK7SsHjqZwGADMU5TxL0Jk+IJiJ9og=;
 b=B5kjQ7HN1+RisQ1l2t2Mi3J6Ug9T0vwCVl7tYgAqDXObR09ImtTVyP25dVjWwAAfkgfdr+WCy2Q7xfki+yxPqgqELp0DUA/I7+4Oi8LQEPAJLbhv6VNbPo2X/lHI4cqfwvtXIuedGcS5DlbHNo/L7JxYt3p5QxZg9WIgP1T5rG8K5Y+pojQ7lboWI9WTq1LGa8IP7cQXPwI27xAVMGsKHwErYtSDicVF3xfdTWmDnEkXE8mta84wyOlrq8nEeXq7nyMuT6VB3UTuruO5HY5SKQDb8u7aQseHEkk2Nm8xThTZCyDUkg/OlN0ltNhIIEiTUzx2EFNyOkvXvjmSfGI03Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7283.namprd11.prod.outlook.com (2603:10b6:208:439::10)
 by DM3PPF90FB92BE6.namprd11.prod.outlook.com (2603:10b6:f:fc00::f38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Fri, 8 May
 2026 21:35:50 +0000
Received: from IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8]) by IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8%5]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 21:35:49 +0000
Message-ID: <cade15f0-ae3f-4de9-8a8d-1adf2d13d3b5@windriver.com>
Date: Fri, 8 May 2026 17:35:48 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20260506214835.1578529-1-Quan.Sun@windriver.com>
 <CANNYZj_++oDps3s2uq51a7j3CQgK1MSuuSgY9Cz0-wFtE2gnSQ@mail.gmail.com>
 <2705098e-1dfe-4d9e-af37-aedf6771c392@windriver.com>
 <CANNYZj-A=+pbW3B-jHLpmLCVtYd=hWZY4J2SmL6ame9cDx=JvQ@mail.gmail.com>
Content-Language: en-US
From: Quan Sun <Quan.Sun@windriver.com>
In-Reply-To: <CANNYZj-A=+pbW3B-jHLpmLCVtYd=hWZY4J2SmL6ame9cDx=JvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: YQBPR01CA0159.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::19) To IA0PR11MB7283.namprd11.prod.outlook.com
 (2603:10b6:208:439::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7283:EE_|DM3PPF90FB92BE6:EE_
X-MS-Office365-Filtering-Correlation-Id: 44002db8-c7c7-4e81-a21d-08dead49c5d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	WLo5mS89eyE56NvHKCeHLNHT4r9nBqDR6wWkJBhKCK4vLe6SqLanBVSuv1Y4k6npzy7Z8k3IcVAzLHiUd6NXZD1TOa+/16X5TZ6SIhCIni1Qb+UtyxcJXLakcwWRinrpcjKNrOrqcJw3yTb0tOAg/5iFSGvRnM/sHJJbLMWgbY/I4qQ1O0JOHrfO7hADmz1VqWqDaOwU5O7nQ/z61MfDfiJJ1LfLWptci2Uh6L3yHIS/MLwASW663L4rgBcJwqmFvlrP0wbL6A/ULLd3arJlK6tLOrUA1yN4xJ+qt53gTusNKuyNo8fk9tw3WxVjVV4FhqS6zcoWDr7uvYeaVtc9kWqfYpWYWsl5RWdruX4HFoLLBrzV0857E1LLno4x02l8WnMZBwKsKGzTWYyOSMjF+blTDGK+Wa3INPIKeAy66LdHQya6NzNSw2YqnoBeml90p7+PlnvSND3o55Uqz+XG2GVCfypN3G3JLQeDdwxDAkV298/OyvkqkL8BBLrwTGx0f4Q72vEVhXfjLruQQQgtY1TJCCjonKdhEF8cX7M9sXLYTTetvhCJa4TQM8/YWl/P+Owq+OwBKcrJs5mOP6damzglzjXfpcb3Fh9GVIhd0ownGTZCPzq+p5gcaivQ6hMZaxoX6TQWXKmHhxP4EhaG/IRXz5GjZ8DmcCqIikrZxpPkb+wWLJpirT8/YKM9XlpL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c25DZHN3L0JrUUJZSUsrdXZ6c2tmQ0NYQ0p4Sm4yYWg4WTF0Z0F1WitUT1Bi?=
 =?utf-8?B?d2Q2b3N2aHptamlKK2I2RHNWakhHMzBYUkl1TTZSTGxhdWtVNzVKRFBXR2Fx?=
 =?utf-8?B?Qm5oL01wZmtNNTVCbWlkZk1NV24vNXppYU51MlNpNktMNDZUbThBMGtBeFkv?=
 =?utf-8?B?V0dFc243ZDBOVi9jMzBsclRqN1Ztek85WFRzcnprK0hUS1pHTXVoWDJ3eVY0?=
 =?utf-8?B?NkV2QTdhOFRDSDMrajNFMlBGSVZCYS82ZVRpeUtkV05pUDM1M25xOVdJN3ov?=
 =?utf-8?B?Q1BzaHV6b3hMS2xHY3Q4QVN6bmNvRnBPMHhQemxMQmVqdTJwVXprclJrcFJO?=
 =?utf-8?B?SGxLMVR1Ym92b1FZS240OHlPU0ljMFRmaW5QQ0RTV2JnSFQvTW14UlZRamU2?=
 =?utf-8?B?QndZdGR0NkVkN2plVGhrTUJHNm02b210eFk2d0FNNlFGSVQrNW9tNTF4TkFU?=
 =?utf-8?B?SFkyUWRZMkNGWFp1TDVEVEhFMHhlTngyT3FuNlF0eWROakg5SHFTWkxYNmQw?=
 =?utf-8?B?cG1yaFBPYklPaVpnL3ZNNGRUVTYreHVsMnVTLzNCSUczMUczZTQzU3diaFhB?=
 =?utf-8?B?WlRJc1M4V3VxUGtTdkRpbHNHdkJGMjJmL2ViWHV1dDNJVlcxYlBqMHNrNXpR?=
 =?utf-8?B?M1lHd2UrRCtnVGVuTVhVbDNrM0VTQURYT1hCT0trWndLa0JJYnhnNkFIV2hG?=
 =?utf-8?B?emo4dXJzWDVOL0JtT0xKejBjNElhb2VCVzVQR0JDSjRTNFBUYVQ3NThjWmlO?=
 =?utf-8?B?dkdjWGtHREI4LzMvb0ExSzNIOUpzbWdWNStBb3hNdEhsZWZiUGlBVldHcHBp?=
 =?utf-8?B?ZGJZWmhOTFd3R1RaYTVsUGhMRkdMV2NMZGpQaHgzdjBDeWFDNWJENjFHTWFk?=
 =?utf-8?B?RUNzdW80NStXNzE4dTNIbUpSVy9yWS9vVi95VjVtYjVZQnQvUER6dVJzcGxj?=
 =?utf-8?B?V09uZEpWZ0JrRENYakltRk4waUFsaS9UN3p1K1ROaW1VUkVIOEdYUmxpK0dC?=
 =?utf-8?B?TFN4bUxnY29OZk15bkxjQ0VVWDM4S2hCd0wxM0xuc1hrQVJlQ2ZQWFI1anBV?=
 =?utf-8?B?ejV5ZDBJYm5BeXRRYU84N1VMQzc3NXlsRVlGL1IxVWJkOWlhc3FBUnZaSXJL?=
 =?utf-8?B?c1EwSTRUTE92cHFTMUdzV0dkRmpVb0hOWW5hL3hKdXNOMG5CbXlZeXNuWE9a?=
 =?utf-8?B?Z1pSRE1yT1QzY2tzR2NjckhSai9DZzBGVjNoSzNOZGIzem4yMTM2RVhRN2pq?=
 =?utf-8?B?ZVNUL3h3VjRZakxWZmltMURBbVdoNmlaNkI2YWQ5QS9YL3ptU2JWOXkxMWRU?=
 =?utf-8?B?djhkSWUrYUs5RkR4QVlQbmNXWlN6Q0QwbjJLV3JsdlllRmU2TDZBcGR6WDA2?=
 =?utf-8?B?YnlOaFYwbTEvWVNOaVdzOGUyc1NjRGYwOVExMTRGTnByblNJalBoM0VOV1p5?=
 =?utf-8?B?VitDekhWN1BOZkJpNlIzbDBYMDJNVXNZNmNkTmNobDZCZ1BNcTFhL1pzOFZ6?=
 =?utf-8?B?NmFVS2NKUEJsMkl3M01ZNGVVa1VxMEZaekdIcDdpWXNrSXdDendGeXRmVkli?=
 =?utf-8?B?QWQrVzh0b3hMLzNnd3Bua0Qyd0FGdDk5ZjVrelNiZHlYUzkxaW55b3BBZ280?=
 =?utf-8?B?MWROblVLa0FUQ01kYlFkaVE2NmtnM2Q5STBNTUw1OXFwZFFRKzloUUtCTUo0?=
 =?utf-8?B?bzJhY0psbnJRcWh4a3VVWFJaK09nNjZUb0JwTS9sb25HUUkvMTVHeEc2UlNo?=
 =?utf-8?B?bHdQYjhnS1FIU0xwZVB0OHlxcUVneDF5YVZqZzBNRGFLbWxWOWJPRjlZS0dX?=
 =?utf-8?B?YytmT2JVZUE4ejh0bERQWmZwTkc4SjB3QytWeDhYS1dyQXgzNm93NU5QWGhm?=
 =?utf-8?B?YWpOMjQraWl2N1Jrc1kxekQvbzZmUkF3ajZtOE9oTFBuNHRWWlp3ZFA2WHk3?=
 =?utf-8?B?Znk2K1pDQm9qeVlYQlRiWXJkbFBTbmlLRG9GSllTeU13NkZrQmwwa29WK2JQ?=
 =?utf-8?B?VkJMenMzUTQyK1JKVmJqVkdjQ3RtUW93N1hrOUUrdC95UDJ1cVltRnV1blRJ?=
 =?utf-8?B?aStOc1RmV2REUm5SZVFhejRpQjdTakliRDBJbnlBeWlDcXF1Tnoxa0xGU045?=
 =?utf-8?B?S1RldEQxNkFBV3RQVHVZS09ETVZ6TTduaytLaTNKdmQ4S1FHak1ScFY3dWtm?=
 =?utf-8?B?bWV2aTB6T1VDcm5KUzVQOTN2RUJ1SFRaL2RHZVdTc0FKeWUzWlBSWThLUERP?=
 =?utf-8?B?RkVMVU40d3pZdWhtb0tRSGFpblRHNVRJb296TmlEdnFMOUNOU0lacURuWWxE?=
 =?utf-8?B?dUM2SFp6ZXV1NXYxaE9SK1hodnM3Qk96cnNYdk5ZK1c5cTZrL0ZJZUIzOGpN?=
 =?utf-8?Q?ayleZ0WxULHHKxMV3rl0ITTQSjf5j2lapJ1cYGI8QbYcL?=
X-MS-Exchange-AntiSpam-MessageData-1: fbsWuO4k6w5OWQ==
X-Exchange-RoutingPolicyChecked: 
	JzDf01jpl9n5qNyl+KTQg0nSs+kcxHOicPj8e1aEDMvuq8w1GJ/tN+Nuy1qNIlqYalVo3BvMF7Rmo3axN0pw5leHp4q43yz0N0YU2DznxyxPBcVasDGbb6MmHDlWWmVTQOhO5gioot6lxXJKgfLCAcgW9TsMkKZ4nam5neOoflfEQx0nE8KRgPA5NUEmSmBMIwTSWpuVuq14pNyh57pT3xPpI0afWC2FDxGe2A/9fS3U5jvp1h1G2Swuk65zzf0QVUtmPBN2tLe9nzOr2UF/XbX7dbSUWY74KYfqeCApsFT3CGZemKENmSRmhXc9uOB0Tl9erBQ2lrOs1FwdD0S0OA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44002db8-c7c7-4e81-a21d-08dead49c5d4
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 21:35:49.7713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ipVuDYeJ4zKZGovLjjhY9Sel4/BaYcFFq1ucHfSHEnAHv7Go8CNzoQZulV7nWFhek2JDMCrBtEAcRewh5Rzt9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF90FB92BE6
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIxMyBTYWx0ZWRfX/mlD3Mfax6kQ
 OczNSgV61gFsWonquDil4LWfeMbtFUJbHUbeod6In4UCao6yXT4+6jb9PgFi+g5NsUaM/BvKUse
 hQPufC8GnHjWCk0CkJyLzvNr38drt1ECyNaolF4SZy/64MUBPs08lqG1WVb1uitFtoGlUqzrcK+
 zhjViWXvcXKVeiC6L5BgnC/4XCUZY3aAKu3NnLkqTG8lzmr01ulcpTs8CAA3DIY5YTCj8Va9OOw
 t/l1AwTWlJ/QfpaTk7pzGr2x0CMRgyTs6OHKyxn73hCXmGngCbalTQn9tXypGBL1RgbLsILQ2Mr
 7LlX68xet72SVthDT1dXbyH5ciP4rmY1+rbdbFOS3DtqlIXuFdVqQXr8XH7UVoI/S+51j2JoEv/
 2dn7/4Zx3imdF5l/Mh+wvvtCo/cifuXAoFb5BepxJR0n44mzVogEfbC/siKmZwtleo9D+QT/R5g
 DpKiIVVsjwzoTCYjBYg==
X-Authority-Analysis: v=2.4 cv=DsVmPm/+ c=1 sm=1 tr=0 ts=69fe5739 cx=c_pps
 a=/yS4kdDgObtqNMJizKN72Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=t7CeM3EgAAAA:8 a=e5umqjUN4aLH4j1U0tIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: P_zVhmGwqZC9VYKcRv5g_eWIARm4SHF6
X-Proofpoint-ORIG-GUID: 73r_Xry2tYD3eo07dj3sukowwfIdvuS9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080213
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 648L6g3H3194500
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 21:35:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236740


On 5/8/26 16:08, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu, 7 May 2026 at 22:29, Quan Sun <Quan.Sun@windriver.com> wrote:
>
>> When these subprojects are built standalone (outside the main QEMU mes=
on
>> project), they fail to compile because they cannot find headers from t=
he
>> top-level QEMU source tree (e.g. include/standard-headers/ or root-lev=
el
>> headers). In a normal upstream build, the parent project provides thes=
e
>> paths implicitly. OE's build environment triggers standalone subprojec=
t
>> builds, requiring explicit include paths.
> I'm afraid I don't understand, and I can't reproduce the issue. I
> deleted this patch from SRC_URI, and qemu-native, qemu-system-native
> and qemu (target) still build just fine.
>
> What kind of error are you observing? How can it be reproduced? What
> exactly triggers the 'standalone build' and how does it look like
> compared to 'normal upstream build'?

It's weird when I was working with the upgrade using the devtool, I=20
clearly got build errors and that's why I added that patch. But as you=20
said here, by removing that patch file, the build does succeed.=C2=A0 =C2=
=A0I've=20
verified that the patch is not needed. The libvduse and libvhost-user=20
subprojects are actually built as meson subprojects of the top-level=20
QEMU build, not as standalone projects. I've tested qemu-native,=20
qemu-system-native, and qemu (target) without this patch and all build=20
successfully. So Dropping that patch file. Thanks a lot!


