Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A540EC1434
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 12:01:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16814.1772539279939116068
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 04:01:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=szdlgJOU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75228a3b20=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6234TvtU1495135
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Mar 2026 12:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=9qYgOCZYXxZ2+P4ctprHyn8GwFYQEOK1YpgPdeCp6Co=; b=
	szdlgJOU8yv/hVB0UUh5znrYJCYexPJsO85j5r3NedxuIHpFz/lnBW7vL5Kb5oUO
	ZVN0lhkImNTTR0wIWMFApsyCM+WFzDVIIf58AZHm8fpse2DbHvhNbZpV8Bn41hnu
	Pto2v/dXZRAL/j60ZGEEd3FOWGlLzDSTGbCP7qY5yP3Cgo3QNFQlTbGpDtBb7qcN
	IYtnc8TkxAsMYgiT9Wd4N8ZNFoXnNoa2MWPHpcXifYZZpQJe38DDUSpn9WE+vC85
	FypyE5HoiV71MRUGGMy7TmvYaMCzqFB0uR7sJ0NUf5mP/i/Oij21ZHB5Iw6rG3XN
	LH+31Moo9A+rIseGlt2KKA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010000.outbound.protection.outlook.com [52.101.193.0])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4kmk6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 12:01:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mtPjB7z39h2XrP5xw2Y8hUZmVfYilrtAzfzw0zEPvPlaZZa7vvnMe2cENgQHLKp+tbNjvbp1BzwdJgPQhUnX/er0GBttAp+CqQ+pxzs2my0oWQ008VtBztAfI5w7SGYbylXLMY4CaWonKeiZL5RP1y82FHTACx4/rTuR6Sqpo+5zd2sHmb3TRVsDjSfQMnrF7KhzMoF52p61LCcR7G5XRdxeB86N48mIzHji3/+KWADRUQz7XJuTABtyME8mXUtBT4J2mtJNB30aq7Zr97Sq9EANOd7tGR8KYGiYAO1uExqG5S5D2wMG0tN3WUu1EgW7SJ7AwAMziAZyPN0Mt/yrBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qYgOCZYXxZ2+P4ctprHyn8GwFYQEOK1YpgPdeCp6Co=;
 b=BnANB61LFoCGXtjqCegQDjGkJ7j7M/rtmvQk7aNIHBjANY/skLqb7zh83XZ5jLRO6HDi/BbteTFIp7f9IOuTTvxo3nsNSkHVqQNRZwA2OvWGPkV+cjqcxffyKsD8icYXwhrVkvJYP5p9C6g0sIvn8WVCpWb/3VvRDqrYT4xScwmDVpGvDA1/VhOdvCtGMQV1lRZTGx8OVtfCqOmZaZFAXiqj022dWHMilyHLE0H8LzfJhjjiLW36lGDYLEHctV38zx5xh2KgMWF6NRrLcAX1Y6g5aDZzkJK8KWC6so6YoRuK1/R3D17g2UwX0QEZw2QFc7ej0t1rsxunVQMx2ryQWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by CY5PR11MB6510.namprd11.prod.outlook.com (2603:10b6:930:42::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 12:01:15 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3%6]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 12:01:15 +0000
Message-ID: <e4bed048-61eb-425a-a3bf-a3906145938d@windriver.com>
Date: Tue, 3 Mar 2026 20:01:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v7 1/7] package_rpm.bbclass: Drop external
 dependency generator to support rpm 6
From: Robert Yang <liezhi.yang@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        mathieu.dubois-briand@bootlin.com
Cc: alex.kanavin@gmail.com, Ross Burton <ross.burton@arm.com>,
        openembedded-core@lists.openembedded.org
References: <cover.1772367692.git.liezhi.yang@windriver.com>
 <8e2bf6e0befe331a0f834687317a3dcd2d735b92.1772367692.git.liezhi.yang@windriver.com>
 <2bbd3ebdc7f525fc5fdb5848ec6d80c70dbb9e22.camel@linuxfoundation.org>
 <86d3c351-16e9-44bd-8b38-b8c6ed75aa0a@windriver.com>
Content-Language: en-US
In-Reply-To: <86d3c351-16e9-44bd-8b38-b8c6ed75aa0a@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCPR01CA0202.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::15) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|CY5PR11MB6510:EE_
X-MS-Office365-Filtering-Correlation-Id: 6047f8d5-e411-45b4-6ea6-08de791c9220
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	FQA2NaIxkl3kvTK45rIG5Lq00QbIIr81GyAy3bmgNAC/lyzMqr9nUaugAi2M/RO7W1DOG8Hc0zYpig7iBWT23RcFvZYkCpkjBzfTe2DVQNhZGSy1xoHGqhYFPE9BF7BvN5XzaY6FABQua7CLbxATKMa7yKQ/6az2q7b8/e0zsAjXZXZySKYkLXmNuvs9bXkMTCKHm80DQSIq2kzAKUsj9N0vTDA6LhnUOGlIn/i19Djq5yzEDtumL9cXQIl06eh5s6EOwfa6K6b9NFXgO/hDbD04wqfClyPHXhqakqDXmIBmxlvXaCMeiVOBrDUgYJS+qmo4WL7EJ4rQwZmEvPtKeOYeutb3MX/OGetS8/6SD3B2NKFz9Od4nMlod//VLoO3N1O1Mlton3yZbP3EvLh/+eJ+FmD5DjUtjwl67m8xG1WQ4vd/Nq/s2EwVV9Erf6HT5t1++IcSMPMhsvvAKoZLNKoU5atwMI8vgFNNe139f1FtVj4XrGhj3Ekjujf7mYEojhuS0eyrVwH0XMZp5o8bFCAlN3tckRIQk//tsP+hhtr8shek6SVb4+Z2yC5BHgzsACIpDtF5+JwXpQyIPmmGm+t29fzzojxZQITWi9EoqaNbNtURi++pHplsflyezw1I0LRWNWsNV8+AlrVLyc3eoIglAyq5lEZJn3+GcGvSWCAALdU5S814sGDwJSSo7xb1S29foMXuBd6iHFqcIPRg+FfH9P18hvhN3WofCPR8J6lYJhrOJN3ownSmyXq2RzJf
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZXBYeFo2TEdzOGZDcVpYVWt1b04wYTJ1cWt0YmpRNis1QW84UGNFaEQ5MG82?=
 =?utf-8?B?U1l5SFlmQVRGTm1vMUhieC9PZWljeDFTVVlQZGozUEZNaUt2dXNYUlZVNVFz?=
 =?utf-8?B?US9ER21xY2ZkNmd6d0w4ZVp4RjBjTEpjTVJVOFBZQ0szcDdWYzlpQ3Uzd1Bz?=
 =?utf-8?B?Y202cEljODZYdU10aHp2b1NpOXRDT3pHNmFJR053S0VieFQzZ0NuVzdVUWht?=
 =?utf-8?B?QVVSbGpSSnRhNjQwYUsxVmZ6cUk4ZHR3bUF5L0ttWXE4TURlN0pTb3czVFRx?=
 =?utf-8?B?ckhGRnltaXlLUzN6aDNVMzAyTkVoYmRrdDFRbWx3Yytyd1ZBeVpBd05CVFRq?=
 =?utf-8?B?UkNlVHltWjc5OEFVdlVodW51QnRZMTgwV3dRUjdNMlBocCsra3pRNVlvMnF6?=
 =?utf-8?B?cElkRkppSDd2QUtOVGVwVWs4Y0d2cDUwMHZmL2lVaXpBTGtIZzhFeGp2L0tN?=
 =?utf-8?B?d1lrTW5MWGhiYUl1Z1dCNitBeWsvMXFPZnhpZGQrNlB2SXZWTEdPVlg1dEtV?=
 =?utf-8?B?VzF0ZFpKWlVsWmphc3lCSGtSTHJzNS8yczV2WGR1MjFMU2I3Uit6R0ppd3Bt?=
 =?utf-8?B?MERNU2NneGZWU1luMWIzR3RQaWdoVE1ReEdrQmtpaTljQXFOWEhGcit1T1ZP?=
 =?utf-8?B?aGZPSUxGNWE2emlmL3h3ejYwRHFKeGdKZ1EyVVU1cEYzb0x3b0kwL3NCckRZ?=
 =?utf-8?B?Ynd4YVYzTzNKU1lxQmpSNkJ5TEF3emlZc282SEs3SG8zZHQvL0hPVUgyclNo?=
 =?utf-8?B?MHZwOHM3enlHdjVGOFN3WDlReUU3SVovMVhRdW9FV3M5eWlwTS9aVXQ2WjNp?=
 =?utf-8?B?bElnTmFMOTNpMTFyZlBDeTRPUGQvWUJNb3c0d3VxZVFVMVNqQ2NVcmowbzdx?=
 =?utf-8?B?Y1hBa3JURHdmWndoM1JZWHNSZlpxcno4eGpEM2hvTDNkeFVKTitoMGtZYjUz?=
 =?utf-8?B?azc5aVJJRHhySDZ6UDZHei90bkJoU2wvdk05bU12Q29GdGZkRndpUFVrMUlI?=
 =?utf-8?B?TnBoU1R5UGdGc0lvaW96ajR0Nkd0QlJETU1zQ2IwQjBnVmFIOUFvVVdpL1ZJ?=
 =?utf-8?B?ODRaVXFxYVdyTHc0N3FjMW1JWmxLYjJJYmZVdnJUdjBmRnFqUmZRZ3VXUitE?=
 =?utf-8?B?YnJxTyt5SVZGR2tvVkZicGcraGhBdTZ5RlJXSVNqY01CdDNIb002Mk9KdFhl?=
 =?utf-8?B?OUxnUVNqWWx3VEx2OHFrVEU0ZTFIbjhkSUFzTHAxem9EQ055SHFiZlpmcEF6?=
 =?utf-8?B?WVFtZmNucFl4MnRTSkZWeVRaT1lGbkFQNjBBZCtOVndEaGNHNjJEZ2lPWDRx?=
 =?utf-8?B?RUxFK2xzU3VzcjZMR3lOd0F2blRkd2hCSlJXeXpsNjBKNUkxbk90MnFhemRK?=
 =?utf-8?B?aHJ4cXRMNDdUbWRuTTJHZzZQN2VUSUxRNGdNd3ZRNnU0bElnNWdJNkoxYmYw?=
 =?utf-8?B?Rk5QNXpSVmlYL2w3TEtNejk5L1lJeFdicjFQc28vZnZ1THdoZXIzSCtDQzF3?=
 =?utf-8?B?Z0I5UmRMeGFlMU9lcmpyNU1OQ0xNM0h4dmlac3hIQUVvaVlHODBtdHAxWmVq?=
 =?utf-8?B?eStMV0tHTXUwbzRvV0ZBbGtwaHRiN0dNS3BZcGx2bFZaSFVOUWFUWkFWZnk3?=
 =?utf-8?B?WkVOZFdFSXpKc3l6L0ZHT0huUC9BQkUwUlhETjJoVUIraXp6Tlo3MFpEbXBt?=
 =?utf-8?B?ZStYQW1QNUk2Q2Fjc1lVMXhEejZpakVvV09tcXVyMGhWZHJOWllJdnFES1hQ?=
 =?utf-8?B?SVh0MmhZTkVsY0FxRDV4c3lQdWNQbmVvNkJTMEdMM3hPbmdrWXpwZkpkUHBH?=
 =?utf-8?B?ZFpwYWE4ZU03T1hGOGdCTCs2SjVFTDU0cG0rMStLckJ2SFNuMHNkSktzTE1s?=
 =?utf-8?B?TnNHWXFWQTd4YTJKc09sVW9LYi9SRjZkdGV6ZmMzTEQ0NGdoMkhyUFNmNXVo?=
 =?utf-8?B?WEhVWXRxbWZpR3A1Yk4yTUZhRUF5WW9PL215Z09HMjM3akFyaHFxOEFKZC9V?=
 =?utf-8?B?MS9OcUx3VWQ2SmlKeE05cG52V3NXOTg3SVcyMFp1aGJhRStkMVBNajNjUExL?=
 =?utf-8?B?VzdFWGgzM0lxRGRmV1dvZXN5VUt0b0ZOU1BTSis4a2I4SDBYa2FFaUZ5ZDNv?=
 =?utf-8?B?Sk1sVTFCTWM5RXpHVXkvZnI2bHR4ZUtROXhBUXVFOEx5emNCem5CV1lNNHBM?=
 =?utf-8?B?QjQrenVaNUlRcHIzaU5MZjBiQ3BwQm9zQVExbE1QdmZYT1RWTGsvT0pUOVR6?=
 =?utf-8?B?SjR1ck5odTFrNm02ejF3c2xlcWcwZjVBSEh4TFFHcFovVU1OMW1ZcWl1cHQy?=
 =?utf-8?B?WmVPVUdMMHkvSzMwWFdBTnJZR2pGYUFmVGZRcEhnR1RGRkJLdHBML2V5bXR5?=
 =?utf-8?Q?HyrOHT2WMgX5UHdM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6047f8d5-e411-45b4-6ea6-08de791c9220
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 12:01:15.2362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XknomV/iFD8Z2iTysvVpTOd4wtG652f3NPEqhYe0rbXxxDq8YUL/rTPiY6+zBjArpKrY99hj151n4C0RkacUJS2wAWuIVzEEvoXKk4GIuwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6510
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a6cd8e cx=c_pps
 a=ucUdQIQ8V72PEv2waZrxmA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=bYnFuPGLkvGW-qOXtBkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: jmxl5QhTL92FCc8nLRCB5qdhxgiQFalv
X-Proofpoint-ORIG-GUID: tgYuADqKOI4o4GF0sp9iMDF2enWby5jl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA5NCBTYWx0ZWRfX/39wjmGZzkAa
 8r3ZZ0dn+VEvKj6sAexGXX/WkM3Cza7JWlHEFUfS/MEV2iEv8R5B55VWRrQU01V0dfUgRi16CeL
 TfRiVKTuNmdvlfub49KrYofnT1kjsWBf7dwQCoYzu5uKwewclyugaDKEn7zbm1v9qYJvg1ybq/Q
 UAtibkyZQYNhfN8BQuAdTYdVXhfk4texvoItSrz/8Zsm1sQBrECMX4yOdIGYc+LXG6tSWblyyST
 fsA4em1m1r69QxIXHyLp4vxerZNwOCmgZliUnv96kVw+d7SVdmA8jMK+MjjENM3pWOfv8kBi8rK
 vWn2LErO72mqf+r5N3HLtZbejtyamoevVDm9kPCUCk+dSczdosm+gSlvvLIbiX0pJdZ3mgH309n
 y0IAIGq6YrcPbOWABLdiRpZ8Q4jAMvSjmK+daKxZxQer6FyHkbXegrWGFJHQXGyi3vTVV7vcI+B
 bfz5WZxV2myRfb9Xdgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030094
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6234TvtU1495135
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 12:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232307

Hi Mathieu,

Correct Ross' email (I had planed to ask Ross for help about cairo, but u=
sed
the wrong email, now the issue has been fixed, thanks all the same).

And please see my reply below.

On 3/3/26 17:41, Robert Yang wrote:
> Hi RP,
>=20
> Thanks for the comments.
>=20
> On 3/2/26 18:57, Richard Purdie wrote:
>> On Sun, 2026-03-01 at 04:25 -0800, Robert Yang via lists.openembedded.=
org wrote:
>>> From: Robert Yang <liezhi.yang@windriver.com>
>>>
>>> The rpm 6 doesn't support external dependency generator. Oe-core used=
 it for
>>> per file dependency which was saved into pn.requires and pn.provides,=
 but that
>>> hasn't been used any more since 2012 (rev:
>>> be40f6d0bb80274366af00461112af65687a4de8), and there were no complain=
s or
>>> updates in the past 13 years, so just drop it to support rpm 6.
>>
>> This commit message is confusing. I think we need to be clear about th=
e
>> following:
>>
>> Is this file dependency information written into the existing rpms wit=
h
>> rpm 5?
>=20
> I think you mean rpm 4 here, no, it isn't:
> * You disabled it by default since 2012 (rev:=20
> be40f6d0bb80274366af00461112af65687a4de8), and said:
>=20
>  =C2=A0=C2=A0=C2=A0 Since few people use the per file dependency inform=
ation, this patch
>  =C2=A0=C2=A0=C2=A0 goes for the faster approach. It can be enabled if =
anyone needs it although
>  =C2=A0=C2=A0=C2=A0 I'd mention that its being used to us as this code =
may well go away in
>  =C2=A0=C2=A0=C2=A0 the future if nobody complains.
>=20
> * And even if we enable it manually, these info are just used by rpmbui=
ld,=20
> others shouldn't use it?
>=20
>>
>> After the changes, do we still have the file dependency information or
>> is this being removed?
>=20
> Yes, we will still have the file dependency information generated by rp=
mbuild,
> here are related code from rpm:
>=20
>  =C2=A0=C2=A0=C2=A0 /* If new-fangled dependency generation is disabled=
 ... */
>  =C2=A0=C2=A0=C2=A0 if (!rpmExpandNumeric("%{?_use_internal_dependency_=
generator}")) {
>  =C2=A0=C2=A0=C2=A0 if (fc->rpmformat < 6) {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* ... then generate depend=
encies using %{__find_requires} et al. */
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rpmlog(RPMLOG_WARNING,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _("Deprecated external depe=
ndency generator is used!\n"));
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D rpmfcApplyExternal(f=
c);
>  =C2=A0=C2=A0=C2=A0 } else {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rpmlog(RPMLOG_ERR,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _("External dependency gene=
rator is incompatible with v6 packages\n"));
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D RPMRC_FAIL;
>  =C2=A0=C2=A0=C2=A0 }
>  =C2=A0=C2=A0=C2=A0 } else {
>  =C2=A0=C2=A0=C2=A0 /* ... otherwise generate per-file dependencies */
>  =C2=A0=C2=A0=C2=A0 rc =3D rpmfcApplyInternal(fc);
>  =C2=A0=C2=A0=C2=A0 }
>=20
>>
>> I think you're saying there were no external users after 2012 but I'm
>> not even 100% sure about that.
>=20
> These info are for rpmbuild, there shouldn't be external users? And we =
must drop
> it to support rpm 6.
>=20
> And now I can't reproduce the build errors from autobuilder, I suspect =
it is
> because of host contamination issues, I tried to reproduce it on ubuntu
> 25.04 and debian v12, but can't reproduce them, it looks to me that cai=
ro.pc's
> provides (pkgconfig(cairo) =3D 1.18.4) wasn't generate in autobuilder, =
but I don't
>  =C2=A0know why.

I've figured out the root cause, it is because I had added pkgconfig-nati=
ve to
PACKAGE_DEPENDS, it would fail when do_packagedata is from sstate cache, =
but
do_package_write_rpm is re-run (not from sstate-cache), here is the repro=
ducer:
$ bitbake cairo -ccleansstate && bitbake cairo -cpackagedata && bitbake c=
airo=20
-cclean && bitbake cairo -cpackage_write_rpm

$ rpm -qp --provides tmp/deploy/rpm/cortexa57/libcairo-dev-1.18.4-r0.cort
exa57.rpm
cairo-dev =3D 1.18.4
libcairo-dev =3D 1.18.4-r0

Then the "pkgconfig(cairo) =3D 1.18.4" is gone from the provides which is
incorrect. I should add pkgconfig-native as rpm-native:
  python () {
      if d.getVar('PACKAGES') !=3D '':
          deps =3D ' rpm-native:do_populate_sysroot=20
virtual/fakeroot-native:do_populate_sysroot'
+        # The pkgconfig-native is required by rpm's pkgconfigdeps.sh
+        deps +=3D ' pkgconfig-native:do_populate_sysroot'
          d.appendVarFlag('do_package_write_rpm', 'depends', deps)
          d.setVarFlag('do_package_write_rpm', 'fakeroot', '1')


I've updated it in the pull (patch 7). @Mathieu, would you please help to
re-test it if RP has no objections on the external generator?

   https://github.com/robertlinux/yocto rbt/rpm
   https://github.com/robertlinux/yocto/tree/rbt/rpm

for you to fetch changes up to f8fa3090196bae3e12ad76f12f101722d84ca20a:

   rpm: 4.20.1 -> 6.0.1 (2026-03-03 11:29:07 +0000)

----------------------------------------------------------------

Robert Yang (7):
   package_rpm.bbclass: Drop external dependency generator to support rpm
     6
   package_rpm.bbclass: Define _lib and _libdir for rpmbuild
   lib/oe/package.py: Don't add ldconfig_postinst_fragment for glibc or
     musl
   glib/python3/acl: Add pkgconfig to RDEPENDS
   lib/oe/package.py: Don't redirect stderr
   target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
   rpm: 4.20.1 -> 6.0.1

// Robert

>=20
> We didn't get such issues in rpm4 was because rpm/scripts/pkgconfigdeps=
.sh=20
> didn't work in Yocto in the past, now rpm6 makes it work, so we got so =
many
> corner case issues, I've tried do as many tests I can, but still failed.
>=20
> // Robert
>=20
>  > > Cheers,
>>
>> Richard
>=20


