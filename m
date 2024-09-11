Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 746C2EE49B9
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 14:31:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.23072.1726065061139093444
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 07:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=998409ca54=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48BAogT6026598
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 07:31:01 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gj44cha6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 07:31:00 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48BEV0Tf027491;
	Wed, 11 Sep 2024 07:31:00 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gj44cha3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 07:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O03XOjkOAmVkgZCFPIAQe4NxC69ibiRKTjjTo5utbiOwnjTJEhBcxACKvXZ+YVr6FmekBKBIfDCZOkp/bVGlDCEhyH8ewLXb77jxVs6yTRNwZhbz+GA96PUFUThNw5FMHrMLZqgpfMgIyiu2BvoKkkFVyKbupdrcoTlf4LNPOoP1hv9CZjsI0ymQkhOfIm+8qAb4sVMzO7q0K/uTwAnZ7i8AI7IEUOdKmXJ/F/UYSMVKUCi/u1T1htQ0eHC4ktualpD4jEdBgcbDZmdhjpwlBwG+oArvE6pA2bK5Q4F0Fcnvc/ZQ0+9ePA9v/hwk2rqVed0c50gJvGUq1C+NyHebhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sn35I8KqY3CRoqUS8qQrgs3SksHTDYjXfY1+stdthnw=;
 b=y+H6cgx2TJMfyXtGjuikSfQXFEllNo4+EO3bT5mi2g4BPHLgS5YezPwzLQCKZz7uePr3es1TtdJMOwI/+oZp4Qceh7pRJMMSVTjvkj1zCx5zWlGg2b/oR7a/Wwb6SPVFSJDRxzjt9m7BDX643TVSfXcm6prYmB0cadN4ysa1fY1QhPi8EbvmNeOuV6pbkih+EWc2mShUKdYnenbZDcnI5hTqYKM9giYVCqr7901Zfw+qwbKJljKxbpBFS8VNGBHReo5UA9rSe+HZqePEsqlbkIVCZfi3L5pDkta/JgE9KQzMoEIfCjSs8L//d8dR8d3N6cV+zZAfr+AylpZzCL/NzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB8527.namprd11.prod.outlook.com (2603:10b6:510:2ff::9)
 by PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.18; Wed, 11 Sep
 2024 14:30:51 +0000
Received: from PH7PR11MB8527.namprd11.prod.outlook.com
 ([fe80::3b8:836:a6b7:dcc7]) by PH7PR11MB8527.namprd11.prod.outlook.com
 ([fe80::3b8:836:a6b7:dcc7%5]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 14:30:51 +0000
Message-ID: <cbb94a55-956f-43cb-8498-be809dd87058@windriver.com>
Date: Wed, 11 Sep 2024 22:30:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 1/1] classes: Print bitbake branch and
 revision
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <cover.1726059965.git.liezhi.yang@windriver.com>
 <ad2b2df4041f0c721d1a82de0fe759d896c6bfb6.1726059965.git.liezhi.yang@windriver.com>
 <CANNYZj9JE_syrcCA1t=O-AYT=UhZXb=TY+v5Q1cON7oPKQEPRg@mail.gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <CANNYZj9JE_syrcCA1t=O-AYT=UhZXb=TY+v5Q1cON7oPKQEPRg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP301CA0017.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::8) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8527:EE_|PH7PR11MB6771:EE_
X-MS-Office365-Filtering-Correlation-Id: 03c47164-1b87-40ba-7db7-08dcd26e5509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TjdvRWN2djdGTzRYSWpKekpRTmRWK2FrbXVUVGxKd2xtam4wYVhVMDQyWlhC?=
 =?utf-8?B?dWh5eDVRUzAxeGZaUlo2YldoSUxZaTFIOGNINzM0SnRyVEgrRGwxdURrSC9W?=
 =?utf-8?B?K0lKVmlONHZiNWVia3g4SmdSWWJpVkl6RGVKR000MUtlUDBjRnAyWkwvb3Bj?=
 =?utf-8?B?ditCblNmeGIxWEg0RUo2WXNKUnBKdTJXcW96UTRsVzFBSXpXSUhlQ1ZvSWUr?=
 =?utf-8?B?Vkt0aUV2RzRDRGlJZkdYK3Q0b1IwOExPTGtGcC96akMvayt5Tk16Q3VPWDR4?=
 =?utf-8?B?b1FHSzIxWUJKcnhBbVcwZGpHSStNZFBDVFhGZXBJRVpnYnpVdXNlYnZSSjI2?=
 =?utf-8?B?U3BZNlFyVEluTzVteTlVWmdIS1JIWVhqUkFKajU3bGVhVzRudmQ3QW1tNHN0?=
 =?utf-8?B?NlBCb2l0V3l5bUZidnA3dGtYWlNROWIyUS9VbTNKZ0hMeXZuM2hxTUptbG5P?=
 =?utf-8?B?OXVZK21NS202bTlLM1dpNlB2WjRqOW96am43QWRnZllWQUswVlJJb1hBU0NH?=
 =?utf-8?B?aFgvWFR5TkZuTUJWV0dwbzBQOWsrTFZlV3BxSUxsdDI5emRJdmVNZGJFVk8r?=
 =?utf-8?B?T1lwMU5NRHIyRjEvcitsMlVEdnYyTHpGcjNzY0ZRRmljb00rbXR4RFQrWG5n?=
 =?utf-8?B?UzNmdUVYTWx1S3Q5L3RCWURldDJvTDhvREpOK2N4NVcvZGpQa1g3QjJ2MXlH?=
 =?utf-8?B?Y3JINmtjbjB6b29mencvZThERy96NE9rUVd6cjBac1poZlpuN2lSZGlqL0tV?=
 =?utf-8?B?Rml6ZHM4RWlpRXJobzRSMVhMK0p2RjRCUGt6UVlEbnBITXMxRk1JWjdFMkZN?=
 =?utf-8?B?azVEZTFUNmhFM0dxLzc2NEdOcHJSM3VYc0JrWFBzK3BuaWxIdmIyeGtDeXc3?=
 =?utf-8?B?a1N2c0ZqM3FVTnp3Ym1jVlFaZ2s1S2ZmWmNmWUU1Wmp6UGMwZ3lrLzNJUjlZ?=
 =?utf-8?B?WUQvc3BUNFh6aU5XNlpNRlBPemxHbGFYcURaWE8yYWhQQ3ljQUozbDZGU1Nm?=
 =?utf-8?B?Q1hrcG9EOXhBTFI2NlUzamtlNlpXNWplQ2VJZ1NYMHBONDJKRnVOSVgvVTAw?=
 =?utf-8?B?Q21DVFlVckFKQnB0VzlMMWU0MDFjWlhyZEN6K3FEdWhRajRoYkNEV1h5a3lQ?=
 =?utf-8?B?eTB3OEpLVnFpMnkxSFduc2lnQ0JFN01HN1J1LzRUOXl5akFQbjRDSU10ek1Y?=
 =?utf-8?B?RkhmZzJmOWJBZHQwdEdGNGd2dWMxeEYwdW1XZE4wL1VWbDFKcUNCL2JRaVRk?=
 =?utf-8?B?OXhrZHhudlhLTzJHVWo5aWY5R3FsVzQ1U3pzU2d6TGw0QmlqOGk2aThtZldz?=
 =?utf-8?B?MWZ5MnlKMU5RU1lua2pUYUg4Q0hBelNJWkV1MmUxcFdTY3lxUFBEazUwbDA2?=
 =?utf-8?B?N1cvNTJ2RlZ5NC9iMjFxVnRsMVh1YllSK3RMTDN0VG8xTHh0YnZMT2x1QW9p?=
 =?utf-8?B?QW1hWk01SEdQUk94ODNtaXNIUXc5NXFpOWlsQlUxUGpkdFBNUENpdjE2eTkr?=
 =?utf-8?B?TE15SGFXNy8yRDJFZisxbjRTS0JGb0VCS2ErNHZ0NW12STdwSzlMc0ZhaVRx?=
 =?utf-8?B?NmF0NldTQjZKaUloSVdVaUdROTFSUEVEV0YvQVd4OVZRbndRWjBYMHdnS0JH?=
 =?utf-8?B?ZVdsT2Fzb3RIdyttSVlaTHdIdDE3REVHaGxDak1ZSjhnbmhEaFVPR0pKMnNE?=
 =?utf-8?B?OHdRTzh1N3ZNOU9BM0o2eW5HaUdIL2JNMkZYYVhOaDBLUjBLdkN5amZwS2RN?=
 =?utf-8?Q?70NIFgN/cwWRjXxdUo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8527.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WHo0a1lQRVBGZFJEOHFpc0s2NXMxK1NacHZTMVphUVJtd1FTOGF3bTllN1hS?=
 =?utf-8?B?SmtRUGR5WlJJaEhQQVRXZlptb1VuZTBOZUUxU3VxMlpQSHplbGgzYnpXY3c0?=
 =?utf-8?B?dlFTTFo0K1c0emgxcXlha1VKVzczcnhWWjBwemR4bTI3a1dLTFFKaTUrazl0?=
 =?utf-8?B?NGhiRjZuT2FBSWhZTWpJaks4OEJ2OFVjUktvK1pQQlRGbEovVVIySEtMMnhq?=
 =?utf-8?B?YWJPZERHdXMzL3VSQkpwWElqWU54VjRmcGtrM2hNOU5qS1NpNVlBRHovd1lx?=
 =?utf-8?B?MXRWelNvblFpYW44V1ZOZytueTkvVE9oK3pQMEFpNzhkYm1IOFpaZVVKa0pB?=
 =?utf-8?B?cXZOUWR6TTRPMEFVSE1YNW5heGFzelZBaFBhQ0NjRDExaUlCRkNMWVlKVHBN?=
 =?utf-8?B?cjlid3E4MVE1YmM2SWpCR0RDL2hGZW1jNjBoS1BUVkVidi9oelR3Nk83RElN?=
 =?utf-8?B?UEwxNmcvUjFFOEVTR0VQWGYwTTRMQ3JVQ3VNSlp1TzdEZE9YRWgxMkkzQ0Y4?=
 =?utf-8?B?ZkFvOEtPd09BZkNvK0dzUlpwMXRNNXArQlFMV0UweTFKYTV4cHMzRXkyV25E?=
 =?utf-8?B?WlJtSEVmcXZxc212REovUG16VmZBa3VOV2o2U1IyM0Vaa3BBbytiRC9wUDdU?=
 =?utf-8?B?WERIaHNINnF4TS9ZWjdCUmltbXc3TVRSQUdyR2xDd1lMZWowNG9jT3JoTXNY?=
 =?utf-8?B?TldaTWFGRWtOYi9DZ0FCMnJxdmFHQmlpdTd2NE53UGdWeTlWbVowaU4rSDBx?=
 =?utf-8?B?cG9BalhUWElMMVdhekdJMEZqRG9MUzNpVmZqUlVrMEI3NGRnY0VnREd6OXpP?=
 =?utf-8?B?Ly8zb3kvblUwbVZPYk05S2xmbmo0cWFhL3pFcWFvRTYvQ3ZzWVZPQmRXM3JW?=
 =?utf-8?B?Uk5CSnVxdGNKNnRUWmVpQXdXQ0RwaHdIUkxyUDZsbWY2ZGxSUmwvWVhFckFn?=
 =?utf-8?B?M0lJMjlaY1R0WkluVUVZTXJUWkVjYlZncnhCZTJjL3JITVVXT3ExZnN2ejFx?=
 =?utf-8?B?ZXUzRmIrSUVqMUMwRCtxdnVpbWdad1hBKzhuSjVaSzZhYXRtZm1DZGc5dTZJ?=
 =?utf-8?B?ell3RkZPdm9iWDR3VFRPOHNLVXZSVExkdDJjY3FESjl1ejVoSzU4SnkzQTBC?=
 =?utf-8?B?TmJOZUljdENIRFMyd2VPdDZsRy8wUUM4Vzc1Zk9sMHRMVnpiZ2NBYVdUQ2kr?=
 =?utf-8?B?V3h5cVlucEJnQXhVeUs0NWhoWWt2bkkxaEcxOFJ2WTVHam1vdmNYR1BSZVhG?=
 =?utf-8?B?ejlqejlGMVhTTWVhWE1lYXRkVUQybk4rL1JQcjhuRUNmdERQSVJVWWVCZlBV?=
 =?utf-8?B?eHdjWkE3ZncwYkwrVU1FQzgwc2EzdEZnRmJueDA2VVpSK1Vmd0VxUThEVHFS?=
 =?utf-8?B?YUVzZEdOT0ZnRTZvUWpLMG4vSGhlR3gxQ0NoU3MxUzhxN2grWGVJVGVqOTZX?=
 =?utf-8?B?WEhKelVuYzBNZU43VTFVcVBYM2pybDVtQUl2bU0raStPTGJZNndtVzh3Q2U0?=
 =?utf-8?B?d0tURlVDd1pMSW9SRG1SYnhzb0ZwMGNQT2JvZkVES1pZZ1FxSFRwa0txckV4?=
 =?utf-8?B?cFRxWE1ZaCt2VlBrcUw2b0pvc1ozSmlaV0Z1NkJQcEZxR0RGdWhXOU9wU1lC?=
 =?utf-8?B?WnZxMEFpWlJQelRqc3dYczVXbmRFVGdzNVhCaDIzRG0yWEtldGU3eHl1NGVq?=
 =?utf-8?B?aERwcm9VU0kzakRNNENjdFhVNUVYS1NkRldlYWtMdnRSaTkybTdkNGZzT241?=
 =?utf-8?B?UXRaaW8vMG1RbEYvMFd4S1owV2hjdzFiRFc2RFduTi94TmxVYUlKV2VJOHAr?=
 =?utf-8?B?d3k1dmIyQlVwU3dnTW1QcFdrb3FvclJ4THFNbWR1bGtVSUR6WEJnMXFCRG85?=
 =?utf-8?B?OGNRdVhTbTJqdmhvQVM3Q1ZaRVh3a0s5aVdURDVWSVRnQm9laG8zSkRLZGJ1?=
 =?utf-8?B?c1BFNitIbHBJMWc5NHlOWTQzTlp4d3pmL1ZPamJiVkFxVE0rY3JFQzNXZis3?=
 =?utf-8?B?dm0zT1lqZ0Vkdk9CM3BzVHVDc0tITlIrZkc4SVFBcjZPajdXeEdPSW8wVjk1?=
 =?utf-8?B?R0RPRkdER0ZFZTNiUXZQTDhZYkF3SGdrVkJVa1NpcXB5WmFPS2FFQTVEbTZE?=
 =?utf-8?B?MTY1K0dWbUFuSFlLRzQ1cGVjRUlYOXBaaW9nZ1BnLy9FUmxhdnJtWVdOKzNw?=
 =?utf-8?B?aXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c47164-1b87-40ba-7db7-08dcd26e5509
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 14:30:51.2287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ARjXgcx6z+icg2HD2YQyhPUGU/rVKLBjc6JTFjf/xGhqnbCijpI1ClCqgHKexC1BxqDRTEN23oO+mOCXc204+TROwIVFa96DeI0erLFphjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6771
X-Proofpoint-GUID: r7ynwaG6uHZLLsz9xSbrqWVz737fuctF
X-Authority-Analysis: v=2.4 cv=DZxFqetW c=1 sm=1 tr=0 ts=66e1a9a4 cx=c_pps a=sGbpJkUcFVeWJOR+0qTsNQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=HZGjNNntEjgwefYVQJoA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: IHZwMipXL3sMBBpWyBWSbsuddOvOW9G2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_12,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409110109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 14:31:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204389



On 9/11/24 22:14, Alexander Kanavin wrote:
> Can you please also add a function that tells if bitbake is in a
> separate repo, or bundled with poky? This would help various tooling
> that is being developed for setting up layers and builds, or creating
> configurations for those tasks out of pre-existing yocto setups.

Yes, I can find the code with "git reflog", V3 is coming:

+def is_bitbake_in_separate_repo(bitbake_dir):
+    """
+    Check whether bitbake is in a separate git repo
+    """
+    bitbake_git_dir = os.path.join(bitbake_dir, '.git')
+    if os.path.exists(bitbake_git_dir):
+        return True
+    else:
+        return False


// Robert

> 
> Alex
> 
> 
> On Wed, 11 Sept 2024 at 15:13, Robert Yang via lists.openembedded.org
> <liezhi.yang=windriver.com@lists.openembedded.org> wrote:
>>
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> There is no bitbake revision when it is in a separate repo, then we have no way
>> to know which version of bitbake is used from the log, this patch always prints
>> it.
>>
>> * console-latest.log
>> bitbake              = "master:165368bad152a14b32b5216b938aa4b915d72a70"
>> meta
>> meta-poky
>> meta-yocto-bsp       = "master:165368bad152a14b32b5216b938aa4b915d72a70"
>>
>> * buildhistory/metadata-revs
>> bitbake           = master:165368bad152a14b32b5216b938aa4b915d72a70 -- modified
>> [snip]
>>
>> * buildhistory/metadata-revs
>> -----------------------
>> Build Configuration:  |
>> -----------------------
>> DISTRO = poky
>> DISTRO_VERSION = 5.0+snapshot-165368bad152a14b32b5216b938aa4b915d72a70
>> -----------------------
>> Bitbake Revision:      |
>> -----------------------
>> bitbake           = master:165368bad152a14b32b5216b938aa4b915d72a70 -- modified
>> -----------------------
>> Layer Revisions:      |
>> -----------------------
>> [snip]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/classes-global/base.bbclass     | 10 +++++++---
>>   meta/classes/buildhistory.bbclass    |  5 +++--
>>   meta/classes/image-buildinfo.bbclass | 13 +++++++++++--
>>   meta/lib/oe/buildcfg.py              | 13 +++++++++++++
>>   4 files changed, 34 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
>> index b6940bbb6f..85c7cb8c24 100644
>> --- a/meta/classes-global/base.bbclass
>> +++ b/meta/classes-global/base.bbclass
>> @@ -226,9 +226,13 @@ do_unpack[postfuncs] += "create_source_date_epoch_stamp"
>>   def get_source_date_epoch_value(d):
>>       return oe.reproducible.epochfile_read(d.getVar('SDE_FILE'), d)
>>
>> +def get_bitbake_branch_rev(d):
>> +    revisions = oe.buildcfg.get_bitbake_revision()
>> +    return oe.buildcfg.get_branch_rev3(revisions)
>> +
>>   def get_layers_branch_rev(d):
>>       revisions = oe.buildcfg.get_layer_revisions(d)
>> -    layers_branch_rev = ["%-20s = \"%s:%s\"" % (r[1], r[2], r[3]) for r in revisions]
>> +    layers_branch_rev = oe.buildcfg.get_branch_rev3(revisions)
>>       i = len(layers_branch_rev)-1
>>       p1 = layers_branch_rev[i].find("=")
>>       s1 = layers_branch_rev[i][p1:]
>> @@ -241,11 +245,11 @@ def get_layers_branch_rev(d):
>>           else:
>>               i -= 1
>>               p1 = layers_branch_rev[i].find("=")
>> -            s1= layers_branch_rev[i][p1:]
>> +            s1 = layers_branch_rev[i][p1:]
>>       return layers_branch_rev
>>
>>
>> -BUILDCFG_FUNCS ??= "buildcfg_vars get_layers_branch_rev buildcfg_neededvars"
>> +BUILDCFG_FUNCS ??= "buildcfg_vars get_bitbake_branch_rev get_layers_branch_rev buildcfg_neededvars"
>>   BUILDCFG_FUNCS[type] = "list"
>>
>>   def buildcfg_vars(d):
>> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
>> index ce3abaa69d..50516e6533 100644
>> --- a/meta/classes/buildhistory.bbclass
>> +++ b/meta/classes/buildhistory.bbclass
>> @@ -764,8 +764,9 @@ def buildhistory_get_build_id(d):
>>
>>   def buildhistory_get_metadata_revs(d):
>>       # We want an easily machine-readable format here
>> -    revisions = oe.buildcfg.get_layer_revisions(d)
>> -    medadata_revs = ["%-17s = %s:%s%s" % (r[1], r[2], r[3], r[4]) for r in revisions]
>> +    revisions = oe.buildcfg.get_bitbake_revision()
>> +    revisions.extend(oe.buildcfg.get_layer_revisions(d))
>> +    medadata_revs = oe.buildcfg.get_branch_rev4(revisions)
>>       return '\n'.join(medadata_revs)
>>
>>   def outputvars(vars, listvars, d):
>> diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-buildinfo.bbclass
>> index b83ce650ad..7b5f84854c 100644
>> --- a/meta/classes/image-buildinfo.bbclass
>> +++ b/meta/classes/image-buildinfo.bbclass
>> @@ -27,11 +27,14 @@ def image_buildinfo_outputvars(vars, d):
>>           ret += "%s = %s\n" % (var, value)
>>       return ret.rstrip('\n')
>>
>> +def get_bitbake_rev(d):
>> +    revision = oe.buildcfg.get_bitbake_revision()
>> +    return '\n'.join(oe.buildcfg.get_branch_rev4(revision))
>> +
>>   # Returns layer revisions along with their respective status
>>   def get_layer_revs(d):
>>       revisions = oe.buildcfg.get_layer_revisions(d)
>> -    medadata_revs = ["%-17s = %s:%s%s" % (r[1], r[2], r[3], r[4]) for r in revisions]
>> -    return '\n'.join(medadata_revs)
>> +    return '\n'.join(oe.buildcfg.get_branch_rev4(revisions))
>>
>>   def buildinfo_target(d):
>>           # Get context
>> @@ -55,6 +58,12 @@ Build Configuration:  |
>>               buildinfo_target(d),
>>               '''
>>   -----------------------
>> +Bitbake Revision:      |
>> +-----------------------
>> +''',
>> +            get_bitbake_rev(d),
>> +            '''
>> +-----------------------
>>   Layer Revisions:      |
>>   -----------------------
>>   ''',
>> diff --git a/meta/lib/oe/buildcfg.py b/meta/lib/oe/buildcfg.py
>> index 4b22f18f36..dab4aa7831 100644
>> --- a/meta/lib/oe/buildcfg.py
>> +++ b/meta/lib/oe/buildcfg.py
>> @@ -71,6 +71,19 @@ def is_layer_modified(path):
>>           # output and a 129 return code when a layer isn't a git repo at all.
>>           return " -- modified"
>>
>> +def get_branch_rev3(revisions):
>> +    # Return 3 items for each revision
>> +    return ["%-20s = \"%s:%s\"" % (r[1], r[2], r[3]) for r in revisions]
>> +
>> +def get_branch_rev4(revisions):
>> +    # Return 4 items for each revision
>> +    return ["%-17s = %s:%s%s" % (r[1], r[2], r[3], r[4]) for r in revisions]
>> +
>> +def get_bitbake_revision():
>> +    bbdir = bb.__file__.rsplit('/', 3)[0]
>> +    return [(bbdir, os.path.basename(bbdir), get_metadata_git_branch(bbdir).strip(), \
>> +            get_metadata_git_revision(bbdir), is_layer_modified(bbdir))]
>> +
>>   def get_layer_revisions(d):
>>       layers = (d.getVar("BBLAYERS") or "").split()
>>       revisions = []
>> --
>> 2.44.1
>>
>>
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#204387): https://lists.openembedded.org/g/openembedded-core/message/204387
>> Mute This Topic: https://lists.openembedded.org/mt/108393122/7304958
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [liezhi.yang@eng.windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

