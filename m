Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E88CAC5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 05:40:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.558.1749102036966481028
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 22:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8251f2c3bd=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5554e50e015833
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Jun 2025 05:40:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9q3hg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 05:40:35 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5555eZma007811;
	Thu, 5 Jun 2025 05:40:35 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9q3hg5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jun 2025 05:40:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3f6z0YRMhYcThQzbf42E4VaJ13rR6iixVCNOsv3zNBv1NZHnQGGhkba+8/WdB5IlDn8lOESmL27blJLDMovttMun0F/ANvqX3Yb931hBcWX3XpaCAmQE0EPzvgASjZmEhbeRabPt+/dc+9W9/cQkVwkKhNfRWoAKGiu/Gz67aABxwMe5nqagyCmDSxV1u4OtVDbS1Vgc1jhrcT/91E4uTAix/gEsnBuv+RbJho6QP9Ph9qNbbuupzElGYgpuuKRaaJe82nnV56nRLUI8eYNPRbPFV+RvsZpALMLNbdWBfGPKuLSZwq6Nvl0FmGqffgpaqH2bQv5u2QrDGJwM++GOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8XmSqE0gYCr5NwQ/wcKeN52qWZmupx8+xDDdcaxCXI=;
 b=Ndgmv8wAWllFSPnOS2OBczfQiVL9O1ftxgHz9ffG8nrQ3EHCOfJ8My2b1O5r5S6yOF9l56Avv81CbUWvWFFWt26aLFkLbVDXyJxJmlttljhjjXBwq9Hz1rA6LWq15v0EA577Mm2WjYA9/4TzhFnLpgwT8xOo6MiZHn91gHnXSPoq+6VYTaeNsVjct2I2KyrCs5DHVS+B/6r1uNgs+x90gX0sKC2cRp2ffF+9+6KEdGslCtP3bRxhI02AOjb40DCIbaDSJVEdtO6ovrdH0fLe1VC9mk2pps6fPCez0M1NwHIPpL2wYSkLltyDKBTjXxXlcWlP90qCftWzTMMkbcsxsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by SA1PR11MB7016.namprd11.prod.outlook.com (2603:10b6:806:2b6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 5 Jun
 2025 05:40:32 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%6]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 05:40:32 +0000
Message-ID: <b15478ea-58b9-419b-80a6-504813f3e3bb@windriver.com>
Date: Thu, 5 Jun 2025 13:40:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] autotools.bbclass: Copy
 gettext/po/Makefile.in.in to all po/Makefile.in.in
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <cover.1747817251.git.liezhi.yang@windriver.com>
 <ec444128381202080ec89649e127d0e6ae6cbdf5.1747817251.git.liezhi.yang@windriver.com>
 <20864857-AF77-4A76-ACE2-B5548B42A7C4@arm.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <20864857-AF77-4A76-ACE2-B5548B42A7C4@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SYBPR01CA0116.ausprd01.prod.outlook.com
 (2603:10c6:10:1::32) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|SA1PR11MB7016:EE_
X-MS-Office365-Filtering-Correlation-Id: af92a5bf-1ef7-46b3-d59a-08dda3f37cc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V3picm93d3NHa1g0S0tKNVMyRzNsTStRU3lsdUpadmFkRUJBSS84cW1xNC9J?=
 =?utf-8?B?Y3YxSTJtSHUxQ3dldjN1cmdid2tvdS94Z1UrWXJ6VDd3QW0zMTBlVjBsakxi?=
 =?utf-8?B?dktWa2J5RDY5S2diczNDbTFYV1ZBMm01dWYzcnpmaHFTQjVNdHV4SjdTTFRN?=
 =?utf-8?B?YUgveFJyY25zcWM1MWV3YUNOb0xzdXVHbG0zUUxFUUlLaDJmQmNZWmh1dG15?=
 =?utf-8?B?aHdqSGpKdkgwbHloNnBnd3RUNGtDVXNucm9IN0VjK2t4blB4dFc0VndMb2t6?=
 =?utf-8?B?NmxnZFU1YVg0cHpETjVidnJGdlgzaDE2S0dSUmR2dzltVGM5aUtNN0V0M2tN?=
 =?utf-8?B?VmJ6UisrYTJsR0x1WDA2OEtsYSszcmpCb0dpUVJ1VEJmUDJmLzdNcUF6am1Q?=
 =?utf-8?B?elB4MTdqWThuWlNlcXU5a3JGZ0JtYmxxSUpISklSTFhSREZQM3hCYXpwemVJ?=
 =?utf-8?B?Y1Q0dDZQaDJCWWx0bUNUdHgyWnNkUUIxa1R0TTQrb2JvREFpWnlIWGxaeFVF?=
 =?utf-8?B?eVc2U3VxV010MjgxZFdQS2ExYkE1Z0Q2WnJCb3JUSmpQeUxYNEdKZEJzM1E5?=
 =?utf-8?B?K0srdGRvanIzaHFkWVN3Ukp2Y2xvYVBETk5kalc1QmExRzExdFhrYVVEZVFt?=
 =?utf-8?B?RmY1Zll4MWZTRUlsYTZ5Q2pwdGtKbHdBQVZWWWN2a1F5MTZBaGJJT3AxdmZl?=
 =?utf-8?B?VThESHNzcWd3Ull4OSs5d0RwTzJObWpGMENmcW9OQlVpZG4rOWsxSmtSczMv?=
 =?utf-8?B?Qm1LNk82WmFmMGtTR3FCZTRxb0Fla0RaSUQzTnRaRHltZDRpMEFPcWdicFJt?=
 =?utf-8?B?clgzeVVncjhVWDg2bnBHTlJ1cnVVTmN6UVZ1ZVEvRnZaeXBlYUNjbzZDbnVK?=
 =?utf-8?B?VlBEU3JLUmF2SVVnRjh1MVNyME9RK3JnOXJrUklnSTRrbWRlQnNoYnp3S1d0?=
 =?utf-8?B?czA2ajFENGRDN2xPdDN5blRSbHBSUHBKWU5raDROSjlNK0M2cGVzNFBucHI0?=
 =?utf-8?B?MXhESzJNL2ovT1Q3TnZUYXgvTVlrYTJXcXRtd3UyTXAxbVovQm5lb2p4Mzk3?=
 =?utf-8?B?dmUwM2pHTTRvQjc1MUF4aUxXUFBDQWlYRnNtTUtYeGtUTUJoTmNObzN0V29Q?=
 =?utf-8?B?b0tMdFpEUVpJYjFjNEtyazdZY0tYNGJESVdCbmR2V3o0dG85R0dNL3FtTE51?=
 =?utf-8?B?N3VpYVlyN25XWlM3SVpqZWd4Vm9vSCtURGs5OTB1dzl3Mk5OSlNtTk5ud3FH?=
 =?utf-8?B?R1IvT3JDb0FYV2ttY2x5cVpVdktzRzhhcDIzZmhHL0RkVjc2M3BzNjJ1Y2VY?=
 =?utf-8?B?czdzWTlVY0VqQjlOWGtCb1pTd0taR0FtR2wxalpyOGR0T2JvWm9BRVZ3SlBL?=
 =?utf-8?B?a3AxSUhzMzNjVFFWeFpQSWJ0NU9YcjlsSGZOa3pxNVZXeVVhQVllcWpTSlpI?=
 =?utf-8?B?U2tibkp3eUdvYXlxZEhPaWFIRUNRYy9zV0pMUmg0WVdBMXQwcTh0NlRVZnIr?=
 =?utf-8?B?U1E0cWU3YXNlRkJyYnBwK2JCZW8vK09tODg5dm1JNlk3R3hjMHRxUEQxUHB4?=
 =?utf-8?B?QmtLVVdmbXh0SmE5YURDOTBWcE5UdERSMnorYitPb0p0TGowQUVwMW1HZnVL?=
 =?utf-8?B?dlArdzE2R1FOVFpvS0ZHUnpudVh5blR5OWYzcFIzSnJDK09TQmJjVHdlZmdp?=
 =?utf-8?B?a09kaWN3TzF4TEZNV1U5RkdqYzlSWXFob0hYMWdWNkVBQmVXOUZ1TU9OdHNO?=
 =?utf-8?B?MERDMzdiaGJiQkNIRzE4MmR6WU5IYUxtRDkyc3BDYW4rV3hyTUt1SndkTzBI?=
 =?utf-8?B?Qm5rUitxcjNaQlhzY3BHb3pwOGpXTzBMR3ZxZjlvUWhuRjlQZDZnNXltd0dC?=
 =?utf-8?B?TVUvdUNNNENaUXRjWC9GL0QxWWJvSEVxVStZMndKSGxMRXd4SjdiZ3lLMzcw?=
 =?utf-8?Q?ZtEd16kF5tc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UlU0djJDVldWRm9wN3FCUktGenZNK0dGRzduUWx6ZjBMLzRQWDBmVi9MaXV2?=
 =?utf-8?B?RUJ4ZzlBRUtpSkpLQkVPSld5bENjdjVnVlFBa0NYSXdGNUFhVnBCZ0JhYVJY?=
 =?utf-8?B?U29hTUU4ZlgyOE9DWFQxMUtLQWQwZlFUdENsL3ZVNDdtN2xSVWdMTUk1bGY2?=
 =?utf-8?B?SCtTMS9BOW9Oa3Jra21HRmxvbGpaTXlzbU9PZ2dUell6Z0wyQ1JzeHcveVhN?=
 =?utf-8?B?OStrU2NiVEg5Ymx1NkRvYWdtRjFzRk9SaE9hQ3VualhiNjl4dlVrVW5lOHNw?=
 =?utf-8?B?K1gySEFxcDFCTG5KUEJOTGZwWjVOUmFiYWoyeG5XRmNqSEhxQStkUU9TRTJi?=
 =?utf-8?B?NlhuWDZxZmQ2V3FxZWw4K3NxOUdGeHpFNXp0aFJMMUFCSnNBNkRmWlBrSWd2?=
 =?utf-8?B?dnd3RmUzbmNwa0JqaEZnNHhpQ1BUMHN3QXNtRHg3aVVaSWp4aEhQVklrdFVj?=
 =?utf-8?B?SnY0T0ZWcHJBWUZRNjV1bDNjaFpQc2NxSVBST2xwS3o2T1RSOVo1aG9SNHB5?=
 =?utf-8?B?NmhsN3NzaDQybCt4UnpNSTdwbERidG9NZGtURmQ3SVNnNkZvRHhKeEV5aTFX?=
 =?utf-8?B?VE9WVFoyaWJIdXFFK2V3bXZOTk1kSlkzMXFYU25XUUZEaGxNcHZCaFJ4UmNo?=
 =?utf-8?B?WE5kZXorVmpCWjBXYXRTVVRqUHlwaEZNZGo4MUZqaXJJSEhRSk81dEk3aHF2?=
 =?utf-8?B?VTNDSEV2UVljUFdVZCthNlFXVTEvRDZDQW1XZVJQM1N2djR2QTk4TjZwa2tw?=
 =?utf-8?B?NDRRYlY1RGRKS0FhMlBzVC9ZVlFXRjFYcW9aRk1YSmdadURPNXdtUXpXbXQ1?=
 =?utf-8?B?bUloekV2UFN0V0ZFdmI3L3hRK2J2Zmo2Z0ZZSGk1K01YRDY4M3lHcFlCcWlh?=
 =?utf-8?B?WkQzQ1hVTXRCTS9IMUF2TGxEVVlZYlI4YjB2dEdsRnQwRjc2aStkRzRDUnor?=
 =?utf-8?B?WEJpaWJ0YmZ5ZldNNEhCZ3MycXB4RG5sdWNQd3JQS2MwSXhFZDk1TDVtakdX?=
 =?utf-8?B?VlNyV0huV0ZpT0l0RnZnREcwVUQ4b0RTV05BZitxNnZESEViNDVnejVHWXhI?=
 =?utf-8?B?TStOM3R6SWF0Y3R3V3cydWZjYkxnOWFkU2IrNFVRbmJScTEzNEZDVExFVmdw?=
 =?utf-8?B?V0ZFWmJpQitVUVY1czJYa0ViUmNaNkdOTndvcjNZaEpNMDNNRjZvY0xvanUz?=
 =?utf-8?B?SGxVZmZTNkFjY1JHcXVTdWp6Q05XRW9PbkxMZEVPMDZPQWx1eHgyT2dTeVlt?=
 =?utf-8?B?d3A0NjFkSXMzaVovV3o5V0NHbzdsTlFwQmJucGJ2d0xLVDNkMFB5QkJpOTVt?=
 =?utf-8?B?YXRJNGN2bmh5M3pnd21rTldDeEd3YWhPMlhyN2N0dEJPbHhpZWRPdXRWVlFz?=
 =?utf-8?B?ZWZJWnBtRGh5cVEwT2JRbEl5eXI1SUVCMnV4cnJkUzhhZXNFUnZzMGFUQnI0?=
 =?utf-8?B?OGcyYU43WlF0UVdMSlVMZmlsaFYwemRxc00rSEY4bEpXelVXckZQQlVCWE1v?=
 =?utf-8?B?YnJtdzA1RHhnQnB2cVRiSlo3bUQ1K1Bhb255YzRhMGZMUUREY2xXSkhrTVkr?=
 =?utf-8?B?WDdDZ2JieU9pS2dUd0tTQTlOcDVNMjRkUGpyamNZaExMQWUvK1hiVTJ1Q3FX?=
 =?utf-8?B?d1Y2OEdpNncvZDlISzZHMUF4UlZQUWdkdldyKzlLZmVDTnFpRm1ubUIvTURD?=
 =?utf-8?B?ODJ1TkkxVmUyWTdnQko4SnkveWNObUJ3aGVuRFNZTmRoNnZmU3dyamxqbXJh?=
 =?utf-8?B?VUsrN1lZQWtZZVZINFp1bzVCZ3UyOS9pUC91bVowRTJmQkxTdTlFWVJoWHk0?=
 =?utf-8?B?SXdBM3JlcFlGM3NnTHdmVGxtRU9BNTkyditIWHNPZTkrdVZVR2o2N2pKajZu?=
 =?utf-8?B?ejI0clhzRWhWWGorRUwvQ3BOOEFOV214VWlqMXpYWDBic1VJUUluUERvMVcv?=
 =?utf-8?B?N24vVDhEbFFoUEtNNXh3Q2t4YmR0bFB4RFBZMkV4Q3JydDRnaUpheWlvalpu?=
 =?utf-8?B?VWVlc0pNck9STStFY1E5NXVrRkNBVDducGFFdmFJUSszV2hSdXVRRU5RM0JE?=
 =?utf-8?B?V3F0eTJ2K2JCQkZHQnNlejdDM1MxQ0dMOHdzZlQ4dVdEaE9wVHZqWVdOdUpK?=
 =?utf-8?B?T01veUtZQjUrc3F4ZTkwZWprN2VEMS9oOGNSNVNma0JhNmVwWVRjanBNZnor?=
 =?utf-8?B?YlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af92a5bf-1ef7-46b3-d59a-08dda3f37cc8
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 05:40:32.3493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5taFQmiFBOC/Ou/GYQVTweRt6xqg3MCoB7o6xSi90Sxr2nGdpefW6i+BklXOB+IoHCk3zQSNvKjCsU3wjsGS8r+uCclOOqiwhbTezh6RvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7016
X-Proofpoint-GUID: Q89xpnW69sRuap7358Yv8s77Dn2tyMLv
X-Authority-Analysis: v=2.4 cv=X8RSKHTe c=1 sm=1 tr=0 ts=68412dd3 cx=c_pps a=7lZyNaC2F/ThP7FyJEKG4w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Q4-j1AaZAAAA:8 a=FS0UvM9RxAVv_x4knw8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA0OCBTYWx0ZWRfX3BcoYRvP+uGy OkIrPe2pU9RFQg+2lCo9EqkZNc3eoeAlD57GKwADvfuos9CERkIInK1hw/iaCGtnufyrQ0cJZyb FqpCz7DMNdSgbmxgdG/cGNF26ZoFVbFzFtFhfMe9qgqmuA+2Vnwu0ygvchZFFzpwbnGDy7g1j0N
 TQ8aMvC85IXguPhjPgHbsjRXW+PjMnX6hQ6Oe6j921B1IJ4zD1ijyCUtbkXUd+GkvBNZ+ZZGPWU KRF1w3dXQaAv6XHWAROVOk7XkwrZmEbIQo32HKGu42SPkVGtx4CVVSJi4rrJvx08CqRjDn1Xers YEp2efj7DOMNUameqBbux/ODz+1NElNwrR45wvINuBwoYHjALZVjCmmwHlNC3HBuk9Nplcj/pgH
 Fa2cNU0ZoKNsgFXyInOuHyiY7J1AUpWZUUnrHzjq0U+zKonE+0cFA1m9qzUcXKtfebz9hPqG
X-Proofpoint-ORIG-GUID: kX-65fOmdTwkJzxl1NsAZwJG4GIZcAJ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 mlxlogscore=888 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506050048
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5554e50e015833
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 05:40:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217985

Hi Ross,

On 5/21/25 18:21, Ross Burton wrote:
> On 21 May 2025, at 09:50, Robert Yang via lists.openembedded.org <liezh=
i.yang=3Dwindriver.com@lists.openembedded.org> wrote:
>> The previous code only copied to ${S}/po/Makefile.in.in, but there mig=
ht be
>> other po/Makefile.in.in in ${S}, for example:
>=20
> I=E2=80=99ve made it my life=E2=80=99s work over the last few years to =
slowly remove all the crazy from autotools.bbclass so I have a counter-pr=
oposal: what if gettextize works now?
>=20
> If there=E2=80=99s a new gettext release we need to integrate, then it=E2=
=80=99s absolutely worth investigating to see if the tooling now works ou=
t of the box.  Unfortunately what the breakage actually is has been lost =
beyond a comment saying that it=E2=80=99s =E2=80=9Cbroken=E2=80=9D.

Sorry for the late reply, I did try gettextize, but things will be worse:

1) gettextize doesn't work for sub-po directories such as runtime-po, we =
sitll=20
need find and sub-po/Makefile.in.in and run getextize there
2) The recipe gettext-minimal-native doesn't provide gettextize, so we ne=
ed
    check whether gettextize is present before run it, we need copy the
    Makefile.in.in manually if it is not present, that will increase the
    code complexity.

So it seems that my current patch is the best choice we have.

// Robert

>=20
> Ross

