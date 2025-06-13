Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A26C61DB2
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 05:03:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2945.1749790980124799256
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 22:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82598fc9cb=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D4cEgh029874
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 22:03:00 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm68m6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 22:02:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hahh0E7GMfknj8d+J5KHpQaoo19DugzXt8AFMjhj7qpLuQmRtfCgsNlMW5gekJ3AUHtCkCLFCP9lvkDISLDBqXOMAar44b1p8DVWvyOcpic8d2qBtAP+ymAtVr5q2AmuNqDTAYPerpvGkHmrWjR7MDb2Dz+2JZdQgxITPA1P8pscHHQJjb6J+YLe8dTSUfaw5BkjakATA8Y8q02jJwEIbIME/rwHn/HEhBYusdQlN5N1ADbO03IxX+cjbXU4nvZhDPE7fVVByveRsOxc85gHDeykRak91i9c7V56mmJwIun1cNSxI1hff4qEJfYME8rmv7XLot+c9PfQsLJ5DQqQ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJ3XWPta89EeGw7a7QusT/W2GmS7uHPg1hqc/b59Tuw=;
 b=P/2LETxiN8rXQ0JKliV2i3br9by0FP2calTK+EnXGTEspsEFDYGXUkJJ4ctbM602rJoiBFMvnTpLZKHTttnh38RhIBdI4hvL99L9RfVR+Sit8VvLBezCgYCMfL6Fw2/SmdaigKD2I0N8DD5o0qPObZ9i/LSli8xek3ELC80+k7LP3CNTOHOByvEcfEvw/aoMLinkUjKFXfh1mVNSXQOJUirsvenCCbuP+M4T72UG9mQT+bS+qz/q24ETMUmTlwKHKGE+cmX/9Oe5sMBQQnP5qBJ1SD4AyyoqQUSpAzkrMTBPQMN11UoTjY3Bgb78G77EBbyjnOjPsHGi1pTkHThk3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by SJ2PR11MB7425.namprd11.prod.outlook.com (2603:10b6:a03:4c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Fri, 13 Jun
 2025 05:02:55 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%6]) with mapi id 15.20.8769.035; Fri, 13 Jun 2025
 05:02:55 +0000
Message-ID: <ef0d7c5d-d97f-4339-ac8b-28e7313159b8@windriver.com>
Date: Fri, 13 Jun 2025 13:02:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] ovmf: fix CVE-2024-38797
To: openembedded-core@lists.openembedded.org
References: <18488187B35E401C.461@lists.openembedded.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <18488187B35E401C.461@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:195::19) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|SJ2PR11MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: ddd71997-b9b0-4d25-72d1-08ddaa378e89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K2phaThZVmhlMThENGFqUXU5ZElKdXVUOEdHVm16eVpVV0Q0VlluNTJrMHRE?=
 =?utf-8?B?TG92TzFuYjVWY29zQ0l6YWhYQWFyUFRUTWtVOXVONm5CMW4ydzQ3NzRHWUlv?=
 =?utf-8?B?dDNzUi9kWDk3czVuQUxVZktELy9wVFFubk9QenF0Z3ZIT1pibjdaVGpBaGZa?=
 =?utf-8?B?SGkwTWNhME1UOXNxVmNpWXVhVFpoblBOdlhxTVhRdHNLZkswUTY1QXBydHFx?=
 =?utf-8?B?dFVvNWhzZDZiN1BMV2NIbkN1RkpLRDFBVy9ORkpoY0l6MFVjK202NzJtL21p?=
 =?utf-8?B?TVZqbTVRNVplanYzbksvZGpkalVoNC9nV0FWYWtjT1h1YlZWcGViUjNMVUho?=
 =?utf-8?B?L0pHNUM5b2EzSVo5dlpuakloK1QzRmtOUWk0U0pIcEFrenRFUTJWeUJSY3FS?=
 =?utf-8?B?cGJBWVpxL09XbURxams1REZONzNEVmhOQzZFREZURHZuM3ppYU0wQ28xZlph?=
 =?utf-8?B?WkwrM09PZWxSckgrNU5vRTVMTksrMzVabW15TGo0Qk1tcytET1VGSDY5Tm9Q?=
 =?utf-8?B?MGsraC9tSmQ5RDZRUkdsWFpaK0lqYlYxUndLL29rL01QZ214ZHl4VmhBUVBG?=
 =?utf-8?B?TThROHVxVXdHM3ZNbVgzZ3dIRmxzYkEzT0EvRmVna3prUGU0TlVsNGtGeWhF?=
 =?utf-8?B?TFV0blJTcDFiUnBucnJseUs4a3dTRm9Qa1dtUmNucGZxQVUyTEF6RUV1OGZu?=
 =?utf-8?B?SjI3cmhWTVBtcDZ4eUxDMDZFMllRZHRuK2hvcXIvZEtqeENGanpncTJZRExT?=
 =?utf-8?B?bTducmVEWVlZbUQ4ZHl0T2lDaTdpTEVNTUEzaHcxclRjRTM5TGFOMUk5ODRX?=
 =?utf-8?B?K1Nhd2ZjRnRHUFB6R0RhdUVtZWFMSlJBb3FPQXI1dmNTdmFaaFFpeTNFalhS?=
 =?utf-8?B?RUgzRVVNQ01PVjZxVStudkl5MitRNk02VWxMbE5vSm9QU0lyUkVmaWEwdDgz?=
 =?utf-8?B?UEJZZVhLRUpKSFQ5QUZjVi9zQjJ5NmVFUkhzSzhxYk40U0NXZUxXczgvY1Ry?=
 =?utf-8?B?alFnemJPRjNmakdzM2RPK2lnaGdBbkhYUGUzRkZEQnYwNDk5eWtPZURBaGxz?=
 =?utf-8?B?WmFYWUNURHA1NExFWWxPNDVBNEhJRStEMFlMcmtDYVVES2FlNVdELytkdmhs?=
 =?utf-8?B?UXptcDZoWENpKzQwZEE2cU56WE1FSkkrQWNCdWh6OFc4Nk5hcDhlbC9JWWhy?=
 =?utf-8?B?UlJOWG0rS3F0QmtBYk9QMUNlSFhsL2tKc3UyTnF1eHN0V1lXT2FWUDFjanF0?=
 =?utf-8?B?Y2xSeTJycmw1elMxL09NakY5bUZmV0RnWGhkQjlOaFdaS2ljWUdYNlBlcUhU?=
 =?utf-8?B?OEw3ZEV4OU5XWW8wK2UxS2krQjlueUlEQWRnSDlJYjBFbnJmVVQ1TWpSeDJS?=
 =?utf-8?B?ZU0xM0hFRXdFc0EzRTNMbktORFJQaWREWG14QURZWkU0QXNta1RHK1RweXRL?=
 =?utf-8?B?cmIrSVpYYVhLZXluRDBsN2FSWjVZbTFFdGViVTB4L2JwMzkxRjdkaG9OKzBW?=
 =?utf-8?B?djRjOVNjMS9UY2RwQUlsbllEOEp5N1dYME1wM2NhQ2I4NEszNkpqSGxISDRi?=
 =?utf-8?B?TEF2SThrVG1tUnJqMVNmT1ZackxIeGc3Vmk0MlZpekxFU2dpeUtMdDYrUFlL?=
 =?utf-8?B?SGdOVmZ3Rm5SQ21IOFhaMUlwM0RzcHh0Q3pFV0ZLZFdyTEdTMjJ2aFNtS0NN?=
 =?utf-8?B?S24wRVdKeXVrOEtGdFJ4SmEzSWl0ZGQ4dTU1dk9Bc2kyTTluZjduVko5Y2FI?=
 =?utf-8?B?QUhNdjVDUG5vby9aSmVDTytWUG1mRUk0aGdzWUI5eERHbW1SYXNCQmxaOTBk?=
 =?utf-8?Q?wpDL9vlbAGpaMqbOuU0ICSJ0ZJtiVFeIyZvbc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?THdRZWxaRWJKNUtHV0lKVStoL3JDdVhuUXFndlZIY3M2WTZMRlBZcDJmUGFC?=
 =?utf-8?B?ZTJSMGNhZUc0ZUMrODVOVDg1bHdOQ25hUUsrbHFlS04wbituL3I3bmlqSEFy?=
 =?utf-8?B?eTJaRmdBZndUOHBpeWJoYkhDMVIrMk53TjRXRUE4c2dRcmh3YThpbnJmOERE?=
 =?utf-8?B?Y0ZUS0JvcVZhbFcwZVRubXNKbGFvSjNyTVZHVi9YM3JlaTgyNnJGNTJnb2RB?=
 =?utf-8?B?Zm9uQmpVQWMvTnVBNEpIRTgrSFBFYi9OSjA3YUVwWm9Qb0ZCaS8zVUpjQ3NK?=
 =?utf-8?B?UGFlaWJScEQyYWFiMmhtRmRNZ2dyb1dNRHZ2MjlQUUljWGdkUUpuMFdYMFRG?=
 =?utf-8?B?bDFRSTdncXVVSUNFZ2ZLVkpGSnR5cjBkbS9xTS9YdDh5U0pPZ2xmSEZFRTFF?=
 =?utf-8?B?dVBzVit0aVhYdE1EVzlLRGlhVVJLUXFoSEdNdzRJSnlpaEZsdFJkZDRIUWdL?=
 =?utf-8?B?eGg2WHA2T2NxQ1RFNS9pb09tSElNTHVvK3gxOTIySGNPMTF6cmJDWkEvWnN6?=
 =?utf-8?B?SDhEazZUYkw0N0R5aWxDR0FTR29pTU8yWnVOREpoUnU4TmdDSEdxU1E4U1Zn?=
 =?utf-8?B?L2NiMVFubXh0SXE5N2k2U01yNUhYRFRSMElZMEczaU1KWlIxcjFNc0FYWGhP?=
 =?utf-8?B?WERrbGxhNlBHTG1NSUJVZ2FGUElsWGlTVndtdUY5QkltNlhGUFEzeUttYWFp?=
 =?utf-8?B?QTAyR3dZTjQvbGlmTWUzNjdGbGxQWkxyU0w0aE5NdngyRzJDcXQ3ZUNhQWt6?=
 =?utf-8?B?Zy9QZkNmZHUrZHd1TTQ4dlJ1dkVDSVYyRXVLdmRCUVBqZE13S2tMTUFheUFn?=
 =?utf-8?B?dldYQnRDYXdpQkZwK3NMcTlaWTNEYk5xVlZEVWQwT1E5a0NJeVI1RXU1M0lZ?=
 =?utf-8?B?OXR5ZFlBblcwcncyTERWYkh0TlFid09YcktDbzJSUHU1WVpIQ0xsaFR4U2Iz?=
 =?utf-8?B?ZHloQVFDQVJIRTQrK0lRdGtZN1ZzZ29iNllLbEJKcmgrUWZKQ2JHYXJ2K3JW?=
 =?utf-8?B?VUdhN0t6aWd1S0ZBU0lUZUJzUEd2MFk1NjlZWUZDSTNTTDJhalZSZDZMcytx?=
 =?utf-8?B?SzlzazJXakNpMFpEU1JwNERYRUs1Qk5uRm1HT1RQTlYyUmpKR3cwTDhycHJT?=
 =?utf-8?B?dXlDOVpmSVF5QU91WUZMUU40eFFrR3Z4Y2lDT1FiKzdJTmpEbXovSmhRRE92?=
 =?utf-8?B?d0d3eDVsMWd3SlJwZm9NMWxaSGNxaTNjQkJPK2Y3c0xQZ2U0SDEyZXoycHpT?=
 =?utf-8?B?Qm5tYk1YTEZlZ2VmU2JZVFNxVXVydklkaWp1cW1DSXl4aDBlOUFQQVVmRUpX?=
 =?utf-8?B?d3lNSTY0bkcvZWxPQWUyUTFWOWlGcHUvb3V1RVJ3Z3ZrRGRpalE5aWowdytD?=
 =?utf-8?B?L2JhaWdXZ0hsNURBcXRrOUZCYXF3cGt1WG9HSDhuMGx0dHBaVEJIZFlLckZW?=
 =?utf-8?B?UkcrdElXUEZLYnY5dXhIZ3dxQkpscmxIeWcySEdCSEpwaG4zcUk5MXY4LzVB?=
 =?utf-8?B?OEVVUExwcmF5VWtQcDRNSi9RcUJuQWlPWFJUcVZJM1Nua0VzNTVUbHlPU3hL?=
 =?utf-8?B?L25xdkNPZmpqRzEzRVk5ZnRtMnVFRjBvOEx6Qjc4L21VaGNiblAweWtRU2x5?=
 =?utf-8?B?Q1U4M0c1ekJNUTloU1l2cFJVVnRWY2hISmVkcVA1TVN1RU9ETFlZY3hkSllz?=
 =?utf-8?B?OGhRckhmMXN5dVVPeHIrd2REQk4rY0prS05uei8wcGVYQmNjSjhmTU1rNlhZ?=
 =?utf-8?B?MVpHSUE4YjQ1cnkybGxab3F3d3FVVkVwSzFlWVl2MFF3VG9hT3ZaMTNFZlBF?=
 =?utf-8?B?ZGs3T0RGck55SnhFS0VDcTlXUEFSaVZkaS9haTFXSWk2ZmVyMkJBMmkrV29n?=
 =?utf-8?B?a0c2VGFOcjIvQ1drS2FzZ3BOQXlrYk56cGFTb2I1WWNjVGNvS2srd3hzdWs2?=
 =?utf-8?B?dndlWERDQ2kzRGhiclMwTDRmY1RjMVgwQzhMcGErTUtXQ0t2SVZ1SGlhaEtU?=
 =?utf-8?B?RWpxM1NTQjdWanBRemxrTm5hc1NIQTJpUUdrenlzVE9pQ2xTR0JhOVlwL1VE?=
 =?utf-8?B?YUVDUm1KdERoelphWTdmYS84SVcrTzFhTEgrU284LzQwbEVjbHlUSk04K1ZC?=
 =?utf-8?B?czlFb05EZitTT1JtbFFPSW1pWEtOZ2k1MTdsa3NDZGk2bldKUnMyWjZQMHNu?=
 =?utf-8?B?S1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddd71997-b9b0-4d25-72d1-08ddaa378e89
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 05:02:54.9373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xl5qSasdxirXkXPhkC1sCtagnrwbY5T83xHKMX4c5335JcY1d9T1Cqeqe5pB5q277pPHVFPS/1zP+zxCD6xvFzb6BRKf3i06fbMjOwasCXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7425
X-Proofpoint-GUID: fJzmRGiDu0Mt2t25CFLSRV8A095Xzqod
X-Authority-Analysis: v=2.4 cv=L74dQ/T8 c=1 sm=1 tr=0 ts=684bb103 cx=c_pps a=ZwOCfSBgJ6FT52HY8rp51w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=PYnjg3YJAAAA:8 a=hqBzw_eTAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=yMhMjlubAAAA:8 a=QyXUC8HyAAAA:8 a=mzXZ98EA_o4JsIFIHssA:9 a=MRw_IcwRwWj9AOZ2:21 a=QEXdDO2ut3YA:10
 a=bkWp_v3HvcftT6DRAIDL:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDAzNSBTYWx0ZWRfX8tfFx16lveq2 YVDQ3A/l4yIYudTkAxP0oBQ2BhRKBg+STYB1n0lgDzh+ol0LzzKzLMgJn+RTNoqjYfm4RFXAjnl +TNme0QXyqfvQiVht44UsmaUEjKaVUJAUSJiwUXVKJzjXXYKPrJ6hMr/gfJ3RIQH10M7o47kYom
 dCvHF+nxjkY9iUD4NtD5iXCXeSMOCuk+n4hZ/GOq6YFj+xWNAYtZd5jKPgpfZzPOFevxnMLOCFT mbcC+x9XALoLrhxtVyX2MjIfy1XE5XMlK7QkGH4Temb7X1O5IT4XTHsVIcxC7RacQPBNIwFo6BJ t334M7X2aji+FrDASoQSv1xESoYgpa+tB34HZtdPrhYZ0wK9B3ShFcKebKT62rLwvA6BSeijMNz
 3ixClNS0rIuws5UoOh+7InBy7YfpzW1QWRor9ukzlwoNcfZBbrqMpodPIJTX6waoB1Ge7/J3
X-Proofpoint-ORIG-GUID: fJzmRGiDu0Mt2t25CFLSRV8A095Xzqod
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506130035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 05:03:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218575

Also submitted to personal github to assure `git am --keep-cr' work

https://github.com/hongxu-jia/openembedded-core/commit/c1d0bf8c7e17eee0a3dea96db18675af62ddfc1e

//Hongxu

On 6/13/25 13:01, hongxu via lists.openembedded.org wrote:
> According to [1]:
>
> EDK2 contains a vulnerability in the HashPeImageByType(). A user may cause a read out of
> bounds when a corrupted data pointer and length are sent via an adjecent network.
> A successful exploit of this vulnerability may lead to a loss of Integrity and/or
> Availability.
>
> Backport fixes from upstream edk2 [2][3]
>
> [1] https://nvd.nist.gov/vuln/detail/CVE-2024-38797
> [2] https://github.com/tianocore/edk2/security/advisories/GHSA-4wjw-6xmf-44xf
> [3] https://github.com/tianocore/edk2/pull/10928
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   .../ovmf/ovmf/CVE-2024-38797-1.patch          | 43 ++++++++
>   .../ovmf/ovmf/CVE-2024-38797-2.patch          | 63 ++++++++++++
>   .../ovmf/ovmf/CVE-2024-38797-3.patch          | 99 +++++++++++++++++++
>   .../ovmf/ovmf/CVE-2024-38797-4.patch          | 97 ++++++++++++++++++
>   meta/recipes-core/ovmf/ovmf_git.bb            |  4 +
>   5 files changed, 306 insertions(+)
>   create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2024-38797-1.patch
>   create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2024-38797-2.patch
>   create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2024-38797-3.patch
>   create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2024-38797-4.patch
>
> diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2024-38797-1.patch b/meta/recipes-core/ovmf/ovmf/CVE-2024-38797-1.patch
> new file mode 100644
> index 0000000000..066dfa0ff0
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/CVE-2024-38797-1.patch
> @@ -0,0 +1,43 @@
> +From 2c8fb3e5164effc8a370e800fe91db7341e69116 Mon Sep 17 00:00:00 2001
> +From: Doug Flick <dougflick@microsoft.com>
> +Date: Mon, 7 Apr 2025 11:23:41 -0700
> +Subject: [PATCH 1/4] SecurityPkg: Update SecurityFixes.yaml for CVE-2024-38797
> +
> +This commit updates the SecurityFixes.yaml file to include
> +information about the CVE-2024-38797 vulnerability.
> +
> +Signed-off-by: Doug Flick <DougFlick@microsoft.com>
> +
> +CVE: CVE-2024-38797
> +Upstream-Status: Backport [https://github.com/tianocore/edk2/pull/10928/commits/519366f542e9370bee982b1c3687ffedb5cabc21]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + SecurityPkg/SecurityFixes.yaml | 15 +++++++++++++++
> + 1 file changed, 15 insertions(+)
> +
> +diff --git a/SecurityPkg/SecurityFixes.yaml b/SecurityPkg/SecurityFixes.yaml
> +index b4006b4..06b597a 100644
> +--- a/SecurityPkg/SecurityFixes.yaml
> ++++ b/SecurityPkg/SecurityFixes.yaml
> +@@ -40,3 +40,18 @@ CVE_2022_36764:
> +     - Library\DxeTpmMeasureBootLib\DxeTpmMeasureBootLib.c
> +   links:
> +     - https://bugzilla.tianocore.org/show_bug.cgi?id=4118
> ++CVE_2024_38797:
> ++  commit-titles:
> ++    - "SecurityPkg: Out of bound read in HashPeImageByType()"
> ++    - "SecurityPkg: Improving HashPeImageByType () logic"
> ++    - "SecurityPkg: Improving SecureBootConfigImpl:HashPeImageByType () logic"
> ++  cve: CVE-2024-38797
> ++  date_reported: 2024-06-04 12:00 UTC
> ++  description: Out of bound read in HashPeImageByType()
> ++  note:
> ++  files_impacted:
> ++    - SecurityPkg\Library\DxeImageVerificationLib\DxeImageVerificationLib.c
> ++    - SecurityPkg\VariableAuthenticated\SecureBootConfigDxe\SecureBootConfigImpl.c
> ++  links:
> ++    - https://bugzilla.tianocore.org/show_bug.cgi?id=2214
> ++    - https://github.com/tianocore/edk2/security/advisories/GHSA-4wjw-6xmf-44xf
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2024-38797-2.patch b/meta/recipes-core/ovmf/ovmf/CVE-2024-38797-2.patch
> new file mode 100644
> index 0000000000..9bf6645681
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/CVE-2024-38797-2.patch
> @@ -0,0 +1,63 @@
> +From 1a7be26382c4a34504875f094e15fe371d44192e Mon Sep 17 00:00:00 2001
> +From: Doug Flick <dougflick@microsoft.com>
> +Date: Thu, 3 Oct 2024 09:37:18 -0700
> +Subject: [PATCH 2/4] SecurityPkg: Out of bound read in HashPeImageByType()
> +
> +In HashPeImageByType(), the hash of PE/COFF image is calculated.
> +This function may get untrusted input.
> +
> +Inside this function, the following code verifies the loaded image has
> +the correct format, by reading the second byte of the buffer.
> +
> +```c
> +  if ((*(AuthData + 1) & TWO_BYTE_ENCODE) != TWO_BYTE_ENCODE) {
> +  	...
> +  }
> +```
> +
> +The input image is not trusted and that may not have the second byte to
> +read. So this poses an out of bound read error.
> +
> +With below fix we are assuring that we don't do out of bound read. i.e,
> +we make sure that AuthDataSize is greater than 1.
> +
> +```c
> +  if (AuthDataSize > 1
> +      && (*(AuthData + 1) & TWO_BYTE_ENCODE) != TWO_BYTE_ENCODE){
> +    ...
> +  }
> +```
> +
> +AuthDataSize size is verified before reading the second byte.
> +So if AuthDataSize is less than 2, the second byte will not be read, and
> +the out of bound read situation won't occur.
> +
> +Tested the patch on real platform with and without TPM connected and
> +verified image is booting fine.
> +
> +Authored-by: Raj AlwinX Selvaraj <Alw...@intel.com>
> +Signed-off-by: Doug Flick <DougFlick@microsoft.com>
> +
> +CVE: CVE-2024-38797
> +Upstream-Status: Backport [https://github.com/tianocore/edk2/pull/10928/commits/2dcdb41b564aa3cb846644b4b1722a0b3ae5e06b]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + .../Library/DxeImageVerificationLib/DxeImageVerificationLib.c   | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificationLib.c b/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificationLib.c
> +index b05da19..2afa2c9 100644
> +--- a/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificationLib.c
> ++++ b/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificationLib.c
> +@@ -642,7 +642,7 @@ HashPeImageByType (
> +     //    This field has the fixed offset (+32) in final Authenticode ASN.1 data.
> +     //    Fixed offset (+32) is calculated based on two bytes of length encoding.
> +     //
> +-    if ((*(AuthData + 1) & TWO_BYTE_ENCODE) != TWO_BYTE_ENCODE) {
> ++    if ((AuthDataSize > 1) && ((*(AuthData + 1) & TWO_BYTE_ENCODE) != TWO_BYTE_ENCODE)) {
> +       //
> +       // Only support two bytes of Long Form of Length Encoding.
> +       //
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2024-38797-3.patch b/meta/recipes-core/ovmf/ovmf/CVE-2024-38797-3.patch
> new file mode 100644
> index 0000000000..169c78daab
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/CVE-2024-38797-3.patch
> @@ -0,0 +1,99 @@
> +From 4db363db013a92937431234252fc9d84e44fc120 Mon Sep 17 00:00:00 2001
> +From: Doug Flick <dougflick@microsoft.com>
> +Date: Thu, 3 Oct 2024 10:16:57 -0700
> +Subject: [PATCH 3/4] SecurityPkg: Improving HashPeImageByType () logic
> +
> +Namely:
> +
> +(1) The TWO_BYTE_ENCODE check is independent of Index. If it evalutes
> +    to TRUE for Index==0, then it will evaluate to TRUE for all other
> +    Index values as well. As a result, the (Index == HASHALG_MAX)
> +    condition will fire after the loop, and we'll return
> +    EFI_UNSUPPORTED.
> +
> +    While this is correct, functionally speaking, it is wasteful to
> +    keep re-checking TWO_BYTE_ENCODE in the loop body. The check
> +    should be made at the top of the function, and EFI_UNSUPPORTED
> +    should be returned at once, if appropriate.
> +
> +(2) If the hash algorithm selected by Index has such a large OID that
> +    the OID comparison cannot even be performed (because AuthDataSize
> +    is not large enough for containing the OID in question, starting
> +    at offset 32), then the function returns EFI_UNSUPPORTED at once.
> +
> +    This is bogus; this case should simply be treated as an OID
> +    mismatch, and the loop should advance to the next Index value /
> +    hash algorithm candidate. A remaining hash algo may have a shorter
> +    OID and yield an OID match.
> +
> +Signed-off-by: Doug Flick <DougFlick@microsoft.com>
> +
> +CVE: CVE-2024-38797
> +Upstream-Status: Backport [https://github.com/tianocore/edk2/pull/10928/commits/5df518ec510324f48ed1cf0376150960644b41f0]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + .../DxeImageVerificationLib.c                 | 37 ++++++++++---------
> + 1 file changed, 19 insertions(+), 18 deletions(-)
> +
> +diff --git a/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificationLib.c b/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificationLib.c
> +index 2afa2c9..2eca39d 100644
> +--- a/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificationLib.c
> ++++ b/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificationLib.c
> +@@ -618,6 +618,7 @@ Done:
> +   @param[in]  AuthDataSize        Size of the Authenticode Signature in bytes.
> +
> +   @retval EFI_UNSUPPORTED             Hash algorithm is not supported.
> ++  @retval EFI_BAD_BUFFER_SIZE         AuthData provided is invalid size.
> +   @retval EFI_SUCCESS                 Hash successfully.
> +
> + **/
> +@@ -629,28 +630,28 @@ HashPeImageByType (
> + {
> +   UINT8  Index;
> +
> +-  for (Index = 0; Index < HASHALG_MAX; Index++) {
> ++  //
> ++  // Check the Hash algorithm in PE/COFF Authenticode.
> ++  //    According to PKCS#7 Definition:
> ++  //        SignedData ::= SEQUENCE {
> ++  //            version Version,
> ++  //            digestAlgorithms DigestAlgorithmIdentifiers,
> ++  //            contentInfo ContentInfo,
> ++  //            .... }
> ++  //    The DigestAlgorithmIdentifiers can be used to determine the hash algorithm in PE/COFF hashing
> ++  //    This field has the fixed offset (+32) in final Authenticode ASN.1 data.
> ++  //    Fixed offset (+32) is calculated based on two bytes of length encoding.
> ++  //
> ++  if ((AuthDataSize > 1) && ((*(AuthData + 1) & TWO_BYTE_ENCODE) != TWO_BYTE_ENCODE)) {
> +     //
> +-    // Check the Hash algorithm in PE/COFF Authenticode.
> +-    //    According to PKCS#7 Definition:
> +-    //        SignedData ::= SEQUENCE {
> +-    //            version Version,
> +-    //            digestAlgorithms DigestAlgorithmIdentifiers,
> +-    //            contentInfo ContentInfo,
> +-    //            .... }
> +-    //    The DigestAlgorithmIdentifiers can be used to determine the hash algorithm in PE/COFF hashing
> +-    //    This field has the fixed offset (+32) in final Authenticode ASN.1 data.
> +-    //    Fixed offset (+32) is calculated based on two bytes of length encoding.
> ++    // Only support two bytes of Long Form of Length Encoding.
> +     //
> +-    if ((AuthDataSize > 1) && ((*(AuthData + 1) & TWO_BYTE_ENCODE) != TWO_BYTE_ENCODE)) {
> +-      //
> +-      // Only support two bytes of Long Form of Length Encoding.
> +-      //
> +-      continue;
> +-    }
> ++    return EFI_BAD_BUFFER_SIZE;
> ++  }
> +
> ++  for (Index = 0; Index < HASHALG_MAX; Index++) {
> +     if (AuthDataSize < 32 + mHash[Index].OidLength) {
> +-      return EFI_UNSUPPORTED;
> ++      continue;
> +     }
> +
> +     if (CompareMem (AuthData + 32, mHash[Index].OidValue, mHash[Index].OidLength) == 0) {
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2024-38797-4.patch b/meta/recipes-core/ovmf/ovmf/CVE-2024-38797-4.patch
> new file mode 100644
> index 0000000000..86bc950e7d
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/CVE-2024-38797-4.patch
> @@ -0,0 +1,97 @@
> +From cb3342702c5c1f8a4ddbb6d503a98ed720d14eb3 Mon Sep 17 00:00:00 2001
> +From: Doug Flick <dougflick@microsoft.com>
> +Date: Fri, 17 Jan 2025 11:30:17 -0800
> +Subject: [PATCH 4/4] SecurityPkg: Improving
> + SecureBootConfigImpl:HashPeImageByType () logic
> +
> +Namely:
> +
> +(1) The TWO_BYTE_ENCODE check is independent of Index. If it evalutes
> +    to TRUE for Index==0, then it will evaluate to TRUE for all other
> +    Index values as well. As a result, the (Index == HASHALG_MAX)
> +    condition will fire after the loop, and we'll return
> +    EFI_UNSUPPORTED.
> +
> +    While this is correct, functionally speaking, it is wasteful to
> +    keep re-checking TWO_BYTE_ENCODE in the loop body. The check
> +    should be made at the top of the function, and EFI_UNSUPPORTED
> +    should be returned at once, if appropriate.
> +
> +(2) If the hash algorithm selected by Index has such a large OID that
> +    the OID comparison cannot even be performed (because AuthDataSize
> +    is not large enough for containing the OID in question, starting
> +    at offset 32), then the function returns EFI_UNSUPPORTED at once.
> +
> +    This is bogus; this case should simply be treated as an OID
> +    mismatch, and the loop should advance to the next Index value /
> +    hash algorithm candidate. A remaining hash algo may have a shorter
> +    OID and yield an OID match.
> +
> +Signed-off-by: Doug Flick <DougFlick@microsoft.com>
> +
> +CVE: CVE-2024-38797
> +Upstream-Status: Backport [https://github.com/tianocore/edk2/pull/10928/commits/8676572908b950dd4d1f8985006011be99c0a5b6]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + .../SecureBootConfigImpl.c                    | 37 +++++++++++--------
> + 1 file changed, 21 insertions(+), 16 deletions(-)
> +
> +diff --git a/SecurityPkg/VariableAuthenticated/SecureBootConfigDxe/SecureBootConfigImpl.c b/SecurityPkg/VariableAuthenticated/SecureBootConfigDxe/SecureBootConfigImpl.c
> +index 6d4560c..155e755 100644
> +--- a/SecurityPkg/VariableAuthenticated/SecureBootConfigDxe/SecureBootConfigImpl.c
> ++++ b/SecurityPkg/VariableAuthenticated/SecureBootConfigDxe/SecureBootConfigImpl.c
> +@@ -2096,30 +2096,35 @@ HashPeImageByType (
> + {
> +   UINT8                     Index;
> +   WIN_CERTIFICATE_EFI_PKCS  *PkcsCertData;
> ++  UINT32                    PkcsCertSize;
> +
> +   PkcsCertData = (WIN_CERTIFICATE_EFI_PKCS *)(mImageBase + mSecDataDir->Offset);
> ++  PkcsCertSize = mSecDataDir->SizeOfCert;
> +
> +-  for (Index = 0; Index < HASHALG_MAX; Index++) {
> ++  //
> ++  // Check the Hash algorithm in PE/COFF Authenticode.
> ++  //    According to PKCS#7 Definition:
> ++  //        SignedData ::= SEQUENCE {
> ++  //            version Version,
> ++  //            digestAlgorithms DigestAlgorithmIdentifiers,
> ++  //            contentInfo ContentInfo,
> ++  //            .... }
> ++  //    The DigestAlgorithmIdentifiers can be used to determine the hash algorithm in PE/COFF hashing
> ++  //    This field has the fixed offset (+32) in final Authenticode ASN.1 data.
> ++  //    Fixed offset (+32) is calculated based on two bytes of length encoding.
> ++  //
> ++  if ((PkcsCertSize > 1) && ((*(PkcsCertData->CertData + 1) & TWO_BYTE_ENCODE) != TWO_BYTE_ENCODE)) {
> +     //
> +-    // Check the Hash algorithm in PE/COFF Authenticode.
> +-    //    According to PKCS#7 Definition:
> +-    //        SignedData ::= SEQUENCE {
> +-    //            version Version,
> +-    //            digestAlgorithms DigestAlgorithmIdentifiers,
> +-    //            contentInfo ContentInfo,
> +-    //            .... }
> +-    //    The DigestAlgorithmIdentifiers can be used to determine the hash algorithm in PE/COFF hashing
> +-    //    This field has the fixed offset (+32) in final Authenticode ASN.1 data.
> +-    //    Fixed offset (+32) is calculated based on two bytes of length encoding.
> ++    // Only support two bytes of Long Form of Length Encoding.
> +     //
> +-    if ((*(PkcsCertData->CertData + 1) & TWO_BYTE_ENCODE) != TWO_BYTE_ENCODE) {
> +-      //
> +-      // Only support two bytes of Long Form of Length Encoding.
> +-      //
> ++    return EFI_BAD_BUFFER_SIZE;
> ++  }
> ++
> ++  for (Index = 0; Index < HASHALG_MAX; Index++) {
> ++    if (PkcsCertSize < 32 + mHash[Index].OidLength) {
> +       continue;
> +     }
> +
> +-    //
> +     if (CompareMem (PkcsCertData->CertData + 32, mHash[Index].OidValue, mHash[Index].OidLength) == 0) {
> +       break;
> +     }
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
> index aa7de3af2b..ab6c580722 100644
> --- a/meta/recipes-core/ovmf/ovmf_git.bb
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -27,6 +27,10 @@ SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https \
>              file://0003-debug-prefix-map.patch \
>              file://0004-reproducible.patch \
>              file://CVE-2025-2295.patch \
> +           file://CVE-2024-38797-1.patch \
> +           file://CVE-2024-38797-2.patch \
> +           file://CVE-2024-38797-3.patch \
> +           file://CVE-2024-38797-4.patch \
>              "
>   
>   PV = "edk2-stable202502"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218574): https://lists.openembedded.org/g/openembedded-core/message/218574
> Mute This Topic: https://lists.openembedded.org/mt/113619744/3617049
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [hongxu.jia@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


