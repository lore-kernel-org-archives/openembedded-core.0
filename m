Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC74C28B28
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 02:50:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.28994.1741575023621635547
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Mar 2025 19:50:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5164ebc232=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A2aiso027518
	for <openembedded-core@lists.openembedded.org>; Sun, 9 Mar 2025 19:50:23 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458p9qh74x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 09 Mar 2025 19:50:23 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52A2oMQB015436;
	Sun, 9 Mar 2025 19:50:22 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458p9qh74w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Mar 2025 19:50:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twVJdtVDXOfXli8pH3JkxQwOmtvojq97o7yGL+JfPg7kuo5Mk/aalpVOSWp3CMtl89I+RdPWoBgaF217RJMeRfv/8BP8iZtOm7oTgcdneLxW0RBaY6bvxGMLO9nJ5v13jSu/GnKDEaNI2Dk5zVJZeV/FOv2fvVkUJryUvtUCuEgAT1Ns3yp+r/knNfMrVSoKTnKT8OjdfxUTMFCBZvbkHh3i8VTdjOrZi5kKw1v19GN18VuhFnsT9zgEd4Ytae3wh63HEpE0JMqlUCrlimO6RVKoJ/3eF1ljuhj02InDHhFpNnPV+nlc64fT8+nmIgv0GF2oUZsiqsKdq+kI5KOixA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QWxOR7/l1wKRgm3sDPlQPfj/pHB7fI2Ap376a/CqBU=;
 b=nmWTrnUF0Nf9RScr1B9BmyBoaxQnbN+hzqW9zw34eUKjg9VPgVsW2f1dZXR5x4Pgy4U3ui5C/ZQZTQT6zPEjF990A/WS7Whq3WlS0wfVXkaeXaTJSyzRfvJ3MkrVbgPonPvG+pXGcJeq7oR20ZtQYgwVhVL/fwTUlcZHAawF4bNYDQa6UNIOWUsu4SwFcVDIM33OD18N7SUO7tfRgx15alb6jkNQkE7bja4i9zAFfZIslUhIzGM+TbGv2u74YxJ4WDcDDtNbdoN7JYufbD7icoeya3K3Nl92HebXeXbr5eQtCN97WSYD3un+zyf+srkUwyU/iTc8o8jxfqIWs0GrTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by SJ0PR11MB5136.namprd11.prod.outlook.com (2603:10b6:a03:2d1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Mon, 10 Mar
 2025 02:50:17 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976%5]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 02:50:17 +0000
Message-ID: <fdcdab78-ab77-41f8-bc9a-b9acee540e7c@windriver.com>
Date: Mon, 10 Mar 2025 10:50:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] minizip: Add new recipe
To: Ross Burton <Ross.Burton@arm.com>,
        "mingli.yu@eng.windriver.com" <mingli.yu@eng.windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250307075100.645020-1-mingli.yu@eng.windriver.com>
 <919CBDF5-C00B-47CD-93EA-0A7BFB4B6028@arm.com>
Content-Language: en-US
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <919CBDF5-C00B-47CD-93EA-0A7BFB4B6028@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYAPR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:404:15::15) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|SJ0PR11MB5136:EE_
X-MS-Office365-Filtering-Correlation-Id: ce550039-609d-486d-a04a-08dd5f7e4a55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U3ViRFFQbmJacEtPejJKem5BcWRwL0JJMjAvUmJuelVZbzVmL1NUdEMvVUVE?=
 =?utf-8?B?ZTVxOHNaeFp2ZVFXamZlL1NHVUZWOVZvLzdJVmFpdEFJUnRaUTFZdDN6OEpC?=
 =?utf-8?B?Zzd1U28xeUNXNWpIaU02bTFkbGk4dmJ2bHp2dy90cjVpSCtidGlSZEtIOE1F?=
 =?utf-8?B?TVVMaTRSYitpTXhKRlR0d0xYeFNHSm4vY3RWc0hDaThuUFp0dkMyeVRTQW5r?=
 =?utf-8?B?MnNleHRDTjZ4V29mcWtBRmYrQnJnT3kxMDRXL04rdUtXUyt2OXdJb0pyTDdD?=
 =?utf-8?B?aThoN3J6TXVhQTB2anhyRVMvckw4cll4elNRS1pqN0VGOVpDT0R4ZlZOSTd0?=
 =?utf-8?B?OHFSRVlzTHU3T1lrK2UzWUxQK1h5Um1ENFk4SmkxME5WOFhCWkkwT09JZW9J?=
 =?utf-8?B?cTlmSEhzT09rT2FjMUVMZEh1M3hLS1F6amNBQTBxV0FlV2FxejQ0QU9aMG1U?=
 =?utf-8?B?STFmQkhBd05nZUJFOVB3YmR6MzF4UmdYZEs4SUtRYVlDY2hDZWpPRTdBdWNL?=
 =?utf-8?B?Ky9ieXdTTE4rTjQyY3NUYnZkcXlkWXYxTmY5alVRSjk0OURjamNUNkhpd2ZD?=
 =?utf-8?B?RHhIdDJLbGZ4d0ZxckNpN0pZeTlWYnVrci9WV3hrRHAwZ2Z3OHBqaE5wYzlB?=
 =?utf-8?B?VzVab2hqc1VTRGo4N01DNnp1T0xGT0lXM29MUVJqWnhxUnJWaHlGS2FWQXBo?=
 =?utf-8?B?KzA5RTArcFpuTjdrSkdoQTUzbDZlemFTWHFsR0l3T0JJNUQ2S1BLa0RKczl0?=
 =?utf-8?B?UUJ0N2ZmYnVaQU1iY2dsMXhUc2ErWkhIekVOcEVNUmtyZFgrUlFTbnBWam5s?=
 =?utf-8?B?UXlkUndXaSt5ZUVzdVZsYmNNZFFrbGZrNW5BZVJZSEJjbU5qQXcyNjRYSHRi?=
 =?utf-8?B?TUh0SXNlRVV3dEh6UVZBVnd2SEVMcSsrV05pckhlMWRFbjhVK3huQWFWTXA1?=
 =?utf-8?B?U1FEc1V4eUdBRjhySDF4WE5DbmxHVTFwcDFPMnpFUytYeWNmRnhsR093TWJz?=
 =?utf-8?B?LzR3OSsyV1dpSzhGL2doWW5DaktvWlN6S2d6SmpOQ1FZNWRTM1ZFMFNRQ3dj?=
 =?utf-8?B?MWtCL0hIRXFFc2R0WGRnTEFuT0FjSnYzSFJkbWJFbEp4bUxQYVljcEpic2RI?=
 =?utf-8?B?RGVQY2ZDazJ6ejBrRGg5aElmMnNWdmtyZG1FRytXMXBoZXJqZ1cwVlEzQmgy?=
 =?utf-8?B?cmRPNkhLeEE1UGd0NUJPTkdveGt1OHRyVzdDczNaMHMrejhYeWw5TlM5dTRV?=
 =?utf-8?B?bEhKcFpBQm5FQW9tN1UvbTRBZ1hxR3dsSk9BQzVHZXZtWC9QMnhiMmpicUU2?=
 =?utf-8?B?S2JTc2FSNFJSVDZSWU1lT3F1cjJZOXlsWFl2clIySTBMU2ttaUlIS1BSL1ZN?=
 =?utf-8?B?ZERrVitDc3RnMTVNUUV3YXJzVEtYWkhDTlJDZExTUUoxMzNIN0J2L0tNbXFh?=
 =?utf-8?B?R2NOMnk4K1lzZ0JsZlFEWVIzU2FRWHZIeVY2UkxxaGlVaHRENHpHWENxYXM1?=
 =?utf-8?B?czhaOEVmODJBVHpVeGZuYTloYjBISzAzdFoxUGdpWlQvSks2MmZhdHJ4SThC?=
 =?utf-8?B?Yy9UZjlVbEFWRi9MK0ZZdmxMWkwwR1NWUC93OHZMUnZlVnZhVi91U0x6UStp?=
 =?utf-8?B?N3o2a1pXVVdkYi9JUE1zUUYybEhsbG9INDBFWnJ2cWdrSGJpRHg2NStHVVhE?=
 =?utf-8?B?ZE83VUIwb2NuYTM5V3RSZjg3UGcxUUdKMFJPTHgyb3kweE5HcS8rNU41aWw1?=
 =?utf-8?B?a2o5b2RNRjVEa0tkNjhpOFhKZS9aK1piTzJHdzJ2WEpuWmxGN1ZVM1NLZENY?=
 =?utf-8?B?a2NxM3kvanlGM2c3NFVmQWljM0FVR0YxN0R4WGtJVll2VGFuSDJxa2FXbWl3?=
 =?utf-8?Q?UOeE59IKmdRnL?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VzdzeTcvUGhHN1VkNHY3Y05TVnNia1Njdm1HR2hNZWNuQTFsR2NmTDgvU3Mw?=
 =?utf-8?B?NGJxK3hBWjRhSWlRRWNseHJZRC9TT0RSS0NQZlNibnBhSDBQckhKY0U1OU9H?=
 =?utf-8?B?L1JOd1F0YzU4VjZtNGRJR1RpZjRyTzBHakVVa0dwYmNPN3M3VEMrMHRMZ3Yw?=
 =?utf-8?B?elBDZHB5TC9BbEIwMWVrRGdrZHp2Zk1vcWVFbUo2S0cvWDh4M0k4clYyTHdv?=
 =?utf-8?B?WFdlcUY3eHovY1ZjZWgvcnlVZWZqbkQ4ZGJGSnhTalIwZnZ0Qyt2V2dBaDBK?=
 =?utf-8?B?ZmZNWkhxeUZQV3ZMZnAvSmZDNVZKd09udmhrVkkyd1NCWTAydytmekZTMktK?=
 =?utf-8?B?UHcxaDhUcVJ4S0RSMVZHNFFiREJSaVFPZFJiTVBRUHRFOWFFQjBQTUZVbVJS?=
 =?utf-8?B?VlU3bkZac2ZxSnRveU5NS3RhQ3ZCUEdxUG5WajhIMy9tNkJHN2xUS3B3eHJ0?=
 =?utf-8?B?ZitzZXJTWTM2NitYOUFDS1NYQ3IvTHY3OW1sSHJ3RWZIeExWenk2TmJveVA0?=
 =?utf-8?B?YmY0Q0doRUZCWFcyZ2ZZWHUyRVdUVlBiamFGZHJmMFYrVHcrSGhwVkZaeTh4?=
 =?utf-8?B?RGc2Y09kaG1jcnBVUHJJYWpRZmRXWThyN1hBMWRlVmRvbm9DS1JDYnROQ2Rt?=
 =?utf-8?B?K3ppMllNdzRBd1ZGSWVLQnV1YWNEeWM5YlF1NWhsYnNPVi9ITTZ3RnlUN1R3?=
 =?utf-8?B?bEVzU1FVVk1ZUUQ0L1NEdWhDL3hPNmdsT2hUdXJOb1RjdXRuT2tNL1dIQmsv?=
 =?utf-8?B?RWd2cW9NWWN0dFRNRFFsMWcycmJKRG9Jd2FVanRaUGFhZEJON2o0M0xISnR1?=
 =?utf-8?B?MmRNVUFzTGNvOXdyY0pmOHNWS1FOb2d4d3hEem1aV09HaUNMbFowOSt2Nlkx?=
 =?utf-8?B?ZngzY3RyTksvdFVRdnEwTUtHK2hsRUM4dnBEZHRqOVQrM1BWT1BVWGtkdkFz?=
 =?utf-8?B?TDc0ZWxJdk90ZjNJbXhVa3hvQmtlcXVmWXZoYnEzTXdralFNVmpTK0NvM0FU?=
 =?utf-8?B?YWlnTk5xOFNOblhydlorMTZhbG9RbUdYblA4Y1BoQjhERlpDYkdNZ3VtOG9C?=
 =?utf-8?B?dExUbnRuUkowSTNIUEtYZXFYOVErMnBhM0V5dXpPWkZEeUcwQVpRSEcwVHRH?=
 =?utf-8?B?cTAwZHZuWFk0YVJPRkpCY0tjekJoTjgxRHJnYndYOFdZWGRJeEQ0Zk9LZklP?=
 =?utf-8?B?aVZ1N0pBamxMVkxDVkpEUUFOMWFaaXBhbEphei9DRmtud2FjSGhtT2JpeURW?=
 =?utf-8?B?bStaZWpsbUFRWGdBMmExMEdFWk1uTEdDSEVtdHV6c3plU3NjdjN5cVBTSld1?=
 =?utf-8?B?SHpFU3ZLMHNEcmc3SU5kL1VPVXI4RHp0SkR3S1F2MmllL251aExlU3Z3aFhW?=
 =?utf-8?B?VWM2YjQ2Wi9qcFU4KzVsczZXOWlBaHpldnIvZHE4OXhWMzNhbjI5Mm1QaUZm?=
 =?utf-8?B?QXIzSUJmQ29sNmFFTWtORlVUd2ZDYjM2VTBuSDgwTU1RUDcyb1VIeStydjdK?=
 =?utf-8?B?cHd2YWxzQWxBTHdOaXZ4b09jUHFLamJOODFJK1lzaERvaVcxSmNZejRBUThF?=
 =?utf-8?B?aGtHbnpkTy9qNUdwdmd5STQ2Ui82QnY1T0J6c0daTVBJMExPa2grckVLa2lq?=
 =?utf-8?B?UDVCdlJvU21qaU4yakViK0diTzBnV1lTV2c2b3RIRzNRYXFvRnhvenQrRmht?=
 =?utf-8?B?S2RKYW4xNGc4ZUM2RFJGK1NHWHpnSTNPV01MNkJ6TWd2UHlQMDBYMHlLTHhm?=
 =?utf-8?B?THArcW4zdTZhSFhJbk01UDN3STR2TXE4c0dnSHhHelB4blpuL2o0SmtBdmo1?=
 =?utf-8?B?USsyMEo2ZEM5aW9WUktKYklleXBUS1lObUNGd2dWZ3lEZzR5VURuUjdzL0pS?=
 =?utf-8?B?WXEzOEpDL1I2YUFTOHhOeHFSRHo0UVFXc2dGOFMzdk0wdCtFREdvcW9hZEhx?=
 =?utf-8?B?SFU1UEdrOVNGMXZFRlNJR2MzNXRrd3ZrVncwTlQ3YXo1bkIzbGFUSDBtSm1X?=
 =?utf-8?B?enZ6OXdwbE1iNDhRSXpBaWR2M1dnUVJ3MnU3dTJPVnBjcW15eDkxdkhVVndy?=
 =?utf-8?B?aWEvRENSYmd0MTJLYzgvekkrbVFHVzRXQ3pYMnpPZEI1MDlrTGQ3Z2l2UFZH?=
 =?utf-8?Q?WmwmDVYPDHjP71vKOjSVnQ1sg?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce550039-609d-486d-a04a-08dd5f7e4a55
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 02:50:17.6149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2E1xjyyRA7nvtZ6Kqzd6AJkBn4DUy4QsvTxE91gt6uck6MNVgRK/IJkOjLYlWpfBtJLokC1e7Wsm2jwmtmQwGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5136
X-Authority-Analysis: v=2.4 cv=QNySRhLL c=1 sm=1 tr=0 ts=67ce536f cx=c_pps a=zz2QubYGG/9FVtTd3zWqHQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=szTw6HCbN5ycKscyrgIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: UzfhSxMtHOch3qeiVSXE_Z7gZMuvR6lv
X-Proofpoint-ORIG-GUID: f9B0oIcaopWJx2797jfxJwt-TnFgJn-2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_01,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 clxscore=1011 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503100021
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52A2aiso027518
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 02:50:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212486

Hi Ross,

On 3/7/25 18:24, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>=20
> On 7 Mar 2025, at 07:51, Yu, Mingli via lists.openembedded.org <mingli.=
yu=3Deng.windriver.com@lists.openembedded.org> wrote:
>>
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> minizip [1] uses zlib [2] to support compressed archives.
>>
>> minizip is not part of zlib, but is included in the zlib
>> distribution [1] as a third-party contribution in the contrib
>> directory.
>=20
> The minizip which has "All files under this contrib directory are UNSUP=
PORTED. They were
> provided by users of zlib and were not tested by the authors of zlib.=E2=
=80=9D in the README?
>=20
> Why would we need this at all, and why would it be in core?

If it's not appropriate to send this patch to core, I will resend to=20
other layer.

>=20
> If this is essential, why not build it as part of zlib?

Though the minizip code is distributed together with zlib and it's the=20
third-party contribution under the contrib sub directory of zlib and=20
also depends on zlib when build minizip.

Thanks,

>=20
> Ross

