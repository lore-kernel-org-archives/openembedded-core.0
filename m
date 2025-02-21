Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37534C021B2
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 01:02:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13170.1740099732874929925
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 17:02:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4147d8631d=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KNa2p0030451
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 17:02:12 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00kb5m2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 17:02:12 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51L12B9Q026099;
	Thu, 20 Feb 2025 17:02:11 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00kb5m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 17:02:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h5SL4yfo7ACIx9giKHp3c2iD4WEAzEaz2JSQ4ljMgmlEpxpy3JD6BH4HDGgb/C+UjJo3Al5xUK+yTrh7A0XNdmW4Z3NI2S+G+xG+/VkZXLIx7o5yYzEXBiQukUl2e9pUcLNxoMw2zX27qxwpK91lRaghr7w7CKHzvfIZoMQVZu5nVLwrZ6FejevsBD0005HaDsgLefBu2NSlb5ZR8vFPqgj9z61u2+EV7SpV+ubqxuFKhzEtP/ZSvqcdZZ2rY14BjBOlqPjidVQFNdiUirl7gAwsYUimCQQcuBSWMjCDE4BmjVSb2pbDopFoPe3mY/o+nfpni9qIvlwjQb8Mg0HEdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlJWTzvfohj/1N2xD3klmqrjnn8cwBtGxowR6a0FXlI=;
 b=Eht0BU2QHyP3vHV890YKvizxdajTSArEkFM8AV2Wt5MLUVbGoMqfGcJ+G4jW5JE/tp1nhnIoQq2fChNEgQJqPIcWW5kczJ1NxutHlYWdAAVd7BCf47QSJsP1qBFaASsY2k3EIFKdOCJUowyEXh35yhFOuZ4L1rH8eylKyPXeHJzGUpcC+LqKe7MRiVr+Q2xQ1O8MKa7laK1OYS1JD8LZ/a4Za7UeCkSxALcpPlJ1Om++5Bj4G6fugXnf1QY5i+ljXS76tQDjuKK1HGHtofNOgJVu53KrpI4PyMw4SB+C43E/J9qurVcM4EAhj9FCBdtG3+HpLa9znUetEkCVtO58GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SA3PR11MB7528.namprd11.prod.outlook.com (2603:10b6:806:317::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Fri, 21 Feb
 2025 01:02:08 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%5]) with mapi id 15.20.8445.017; Fri, 21 Feb 2025
 01:02:08 +0000
Content-Type: multipart/alternative;
 boundary="------------J60Z6LBlQpk3DZqh0KqzB6EC"
Message-ID: <fc834b9d-4003-4b20-88bd-ccd9f5a6c63e@windriver.com>
Date: Fri, 21 Feb 2025 09:02:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] man-db: fix do_configure "Argument list too
 long" error
To: Ross Burton <Ross.Burton@arm.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <1811EBCBC381E647.26783@lists.openembedded.org>
 <0146cc17-13cf-4322-ae18-425b822085ae@windriver.com>
 <D749D0A1-5948-440E-98B4-1B7F49CFE6A2@arm.com>
 <a9da630f-524d-49d7-91d6-777324545f87@windriver.com>
 <B4E286BE-E1C3-4989-9675-7A81153CC3D3@arm.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <B4E286BE-E1C3-4989-9675-7A81153CC3D3@arm.com>
X-ClientProxiedBy: SI2P153CA0025.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::12) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SA3PR11MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: 83dc78b7-cef6-48a3-52b3-08dd52135d67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RldpMFhGc2xVcGlySXp2WEdnMmlQQnlQVFllbjN3YlpVUGNnYzVWc2pmVm5o?=
 =?utf-8?B?TmV6WDEwSWZlN1A2WFZGWWhHdUIwNis5dXJ6Nzh1Tmk3WEhiOE5kRUhCQ3lK?=
 =?utf-8?B?L0U3OVJjVzVWbktnVXFxUXZnTnlxUXN1RUpDOWlybE13bXFFR0pmOW0xL0pO?=
 =?utf-8?B?Tm9BYlNYdW5SWENUNWNYVkM5cGFaY1NsUGp2OUV5Tno2Smw5amRUeU5xTFBq?=
 =?utf-8?B?RWV1QjlTNE5PbjFUMllnMXBqa2ZiWmNNeHZITDRxeGszTGtPcGpKWE9HQTNx?=
 =?utf-8?B?M25nSFE1TnRCeDhuZ0xPRXFGSTEyd2NzeGM4T08vRk50dWhsUTNJOXVtUmcz?=
 =?utf-8?B?Tm94ZmRsNGtuYUVPYnJlWTNpWGhlVXpTY2xrRHM2cDIxYmRWRzE2SVU3Tkxh?=
 =?utf-8?B?VWtDaUhyOXk5T3YwNXhkVnNKSHF3L1BIQ2ViOUM4NGNHa0N4Zjlkbk41RGFr?=
 =?utf-8?B?T1lTd3ltcTdtQjZiQnBOeHh4VWNlbVJoSkRHK250Ylp6Qkh3ZTdpU3FIcTRN?=
 =?utf-8?B?K2V3M21IWEhXRDVTQUxjZWJPMEt2b2VzcllLOVorMW9ab1RzM0s0SnNIRW9W?=
 =?utf-8?B?NTUrdllOa0ZJL3J3cGxIM0JrMXozWjIvTGF3MW9GVnE1d3EvUFR0NEdRVmNu?=
 =?utf-8?B?SkluaGhPVTlEMGRDVGhRSHBSNFo5K1pBUmE2Qm5FQ1hHaGNlWFJ1dG1ZNHk3?=
 =?utf-8?B?US8zUEtselp0bG1XOWlaRk1tVDg1M0ZEYkREODZYR0FZRWVjR2FkTWV2OXQ3?=
 =?utf-8?B?cWQvNVBFUHZRZ2l5aFVtMk9oc0doNlhZa0JyaFVTVXJlOXJFbEQyYk91Tnlj?=
 =?utf-8?B?VmxJQ3Y0NHdnZWZoenBQd2xZWXp2bUszY1dTbXVSaGJUdm5RbmM4bmhiMGk5?=
 =?utf-8?B?SUdRejhNRjZHOUMzcGFFMzdUR3dsZXI5MENEUFZVUEQyc1lUNU9pVks3ejZp?=
 =?utf-8?B?OHZUeTZJN2NEVUZrNS9mMlpZTFduUHFGMmlQK2JxbTJrbTBCWm94MkFMSVhl?=
 =?utf-8?B?Y2ROVm9RNUpFSi92bEh4aGY5Y0xmUzRBZWZub1NNUXlqK0Y1NmczL0ZRZ0dm?=
 =?utf-8?B?MmtaRkNKTDVwZ1F6VXNKSklHYUhXUExtWUI0TnZxOVFCWFVLOW1BZG9Cd0ls?=
 =?utf-8?B?VytHdDNoNS9GczIza2M2Q29jU3ZoNklTb3BpQ1QwRkg1a3R3R2JsTWZmYjJq?=
 =?utf-8?B?dlc3aWRwdk1STU1uRnNPVFczQlVSMkdzdWVKZGk3VWg5TGhmTzVEZjZDT2dW?=
 =?utf-8?B?SGh3TjNBUkJ0N3FUNDZpQmE4WHkxV1A4ZGNOS0hVaUY5QmRxUXg4LzFiUjQz?=
 =?utf-8?B?Q2pGbFlrUDcvS2hqYVNKeWNoWXJZRDFYMnQ4NGhNRHl4Wi8yRldyc3U3LzNC?=
 =?utf-8?B?MVBsK3VESGhjY09OcEhwVjl2VThnczU1TFhoc0FaSUtiV0NNSUpUVHNBTWIz?=
 =?utf-8?B?cndHc0wyaGk3N1owNVdzVHhFaEI4MHJKTld5SXBZSnd4ZWJqV0oycE03S3Vr?=
 =?utf-8?B?dHFyVUI1TFRZR0xOQWpKdkJvSXM5L1dWVFAwRWhQaTN1YTB0TFAzdHJlakRm?=
 =?utf-8?B?RFdGaUJYVEt2R2thaS9WaWR6YThsMXk2R1AvOWNETzA4MnllREF5L01uZHVq?=
 =?utf-8?B?bldNbTFrTnBUSGpZaWVUTllVWnk3OGVSQmZZVTNaM0lFdmJVVU5meEMrcGJP?=
 =?utf-8?B?OTBhRWRlT2JYQTlOdGkzVk56WlpTSGl3R2dLUCtYbnptb0VmelB1SHZkMno0?=
 =?utf-8?B?a1YyMCsxTE5YSlRPYk5hd3ArZmFqOUU5TnlVU0xWL0NpV1p2TEY5K1BYWUlJ?=
 =?utf-8?B?eGM5bEVCbnNlTEVUYkNLdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dGNJU1QzVFpTRmVtbmg1WnNDZlRnRjYzUitxTVdYZ1crVklPMUlScVJkK0tj?=
 =?utf-8?B?MHRTRHdYeGRYOExJVy9Hb2RQYTlCa09WaW5VS0xURTZxclNXV2NrWGZnVnpK?=
 =?utf-8?B?WnF3cDJpb0RJWmhOa2k3cG9VaG5MUGV6QWkrNFFRRmZXMU1mR2FHek9nM2tn?=
 =?utf-8?B?dHdQZUV6Y1F6NlZsbTRSaTBwQW0zanFsUWY1bGlrakI2SGVkZHdxZ1o1SXdZ?=
 =?utf-8?B?bVhSUDRZUzVxTzEyWjJxNS8rTXBOZUxqUWsvRHQ3YTlPZ1NKclUvc3lyaVV0?=
 =?utf-8?B?aThiR3JwUjVocU5ibXJpLzBhZjJoSVQwcHd6S1V5alVnaDREVitSd0pUQko3?=
 =?utf-8?B?TEV3azlQSVFjWWlXZVVLMGM2cDRxekZYQzh0Umx4OURDM3ZlUWEvelNlUHRu?=
 =?utf-8?B?ekpFQkFmQzN5Rmxnb3NpeG5xZ2NzTEVXUDJoa29FNkFROUNsdDdNYTc5eG5j?=
 =?utf-8?B?OUorOFhreXA2ZFkybGxKQWZzdnprdDgyNTFwdkhMdkNtMUE1UnNSbWswRXVj?=
 =?utf-8?B?RDU3OFBWRUwrWGtQWVhOZWpwWHcrYUhCa3IrNUlYZXhDaDlWUktGS0VCZ0NK?=
 =?utf-8?B?cXo0cllHd1Z3L0xZUjdGcmZ6RGtUSitZUUZJeENQU2RQSnVsNGFUay9aWER2?=
 =?utf-8?B?NHIxWjFrTTJaV3VONTI5RTBJNWFFMWJ4YVZST0JuZ2dvdjNqOFo2RDNzVHlU?=
 =?utf-8?B?VzhSVkQ5TlI1U1J4OXREVHEycSt5ejF5eDh4YnE5QTE5TDhMNXEzVFFwTmJz?=
 =?utf-8?B?bTZEUEFZSHBLWHUwV2NsOW1ReEtLdUFIOUg0YnJIZ3RuN01BVFhmR2ZkTEFz?=
 =?utf-8?B?Q29idEVzM3RZTW8rOTJsUktkQXVSaUJMbDFYdjNzNlZXOXBCYmJmQkQ1dFZ3?=
 =?utf-8?B?K1g2UlprNjgyZXRiMUFqZHNBK3o4TityekFId2IraTUyeTZDekY1S1RIVnVS?=
 =?utf-8?B?WllGM0hsQVZRd2RhVFllRHVRNE5JZW56QmJBYjNQc2JvRDYrcUo3bmdQWENn?=
 =?utf-8?B?Y3JQdlpNSkhod2dSSWJoMkl5cENVd1BuWTZWQjloTHFQNVl2Vk1MR0ZYY2Yy?=
 =?utf-8?B?NUVQeFFqaEdBTjNkZkV0TUFGU2xOK241cFJ0Uy9lZlNySXppemdWT2I3NkV0?=
 =?utf-8?B?VHBaa2pPN2lQcVdPYlVDRlhuQW04dHNxWkJ1b2VNUG5zcnZvblNxZmc4cjJn?=
 =?utf-8?B?eURFamlOOUZXVFl5NFBCY2piVnBYUmExNkJDM2lYSkZ4aWZkQXlwaEp5cmh2?=
 =?utf-8?B?aWFYS2lkWFlibWltWjhNT2x4RnlaSDFnNzJvcWxPRG1NakxPdFdVMTExb2pm?=
 =?utf-8?B?OW5hcUhBcnEyKzhqZHM2TEJFblhKU3ZON1dEUjcvMDYxVm93dEdSYyt6YnIr?=
 =?utf-8?B?eWNvSHd3WmpqYjlGZVE5T0ZSc2c1amVRVFpKRjdYM0dqa0tiM0J5YVhuZWlC?=
 =?utf-8?B?L3loMEUwUjhPSmZCbUkwMGdWY3VEaEtCK1lkbXp3Szg2RGRiK290QXpBRlhZ?=
 =?utf-8?B?YWl6MXBnT2ZMQzFrbzYwVWFFM3NUMXB4a3A1cVZvOGF5S2dqOFE0YkQ4TVVG?=
 =?utf-8?B?aVdoUGVJNlc1LzI2ZjB4cXRDM2FsVDRBT3FQaU1zZlppNUhHLzNORDduYmxm?=
 =?utf-8?B?K3JSWkdrUzJ5M3hlTm8yOHFxdHVaU3FXZm00R1JSRmhXdG15cERxa1ZSaEh0?=
 =?utf-8?B?Ym5TdS9oK0hhMEtqWnNBb0kzWHR0dkpLc0lqT2FpVHp6d0x1ZHhWOFJ5a1FE?=
 =?utf-8?B?NGVqbmREc2RBOEVhSm5ZbzJtM09hemsxbzJpSklYKzBNVERtVkNqM2UzYzRk?=
 =?utf-8?B?bG1lWTdRNFlKYkFYclAzZTVRZjVxZ2JudFZRY0FFM1BnRU15cmJ2MXJQOHl0?=
 =?utf-8?B?c28zaG1nL1lTQUNIVmJLRTFKWnU4RGdSUGpWK0V2cGJLZVMzSW9wUEkvUFBH?=
 =?utf-8?B?YStNbldlNWZ0ajNYcktpcXFFOGRIK3AvOWNaWHJtalo1dUl2cE11RzJVRS9W?=
 =?utf-8?B?TXMzek9hcmc4RTlDcVkvVDlmY1gyRFdVN3VQWHhtOUY2VzdpL01qcXVnQk9a?=
 =?utf-8?B?R1UrVyt1RGVHT2FvMjMxL05hWUVzcXRYZXNkVzZsYmN1UUlHdzJhY1NwMGUw?=
 =?utf-8?B?WUZqU0liemJaa2FjY1hlL0RQbmtaWkFVWm9SbEgyWVhnTjF3NnloVHNmZnlj?=
 =?utf-8?B?Mmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83dc78b7-cef6-48a3-52b3-08dd52135d67
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 01:02:08.3124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zM8EpHIwgVh6o1dfOc7z/Whh2VDoyUQeEnZYhQJQPaNMXal8zwKSoAv50gBZWGk5BpttTuAqTMgGqbX81oWa9SQ4pT3nz4NEVO6VUGNPilU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7528
X-Authority-Analysis: v=2.4 cv=N67TF39B c=1 sm=1 tr=0 ts=67b7d094 cx=c_pps a=ur2hu7Zt/Tb0cWAHmjvzJg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8
 a=t7CeM3EgAAAA:8 a=H_s-dRVaXMttQp2y_dYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=7CQSdrXTAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9 a=aDc3OViGwkw5bsip:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: aiwyMU1-b38u5mpsRzmYqme-cAwFEPqQ
X-Proofpoint-GUID: snQugumZ2989fuCF9003uflRXnoSqII4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502210005
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 01:02:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211784

--------------J60Z6LBlQpk3DZqh0KqzB6EC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51KNa2p0030451


On 2/20/25 22:40, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 20 Feb 2025, at 08:56, Changqing Li<changqing.li@windriver.com>  wro=
te:
>> For  autotools.bbclass,  how about don't pass -I $i to acpaths,  suppo=
se that upstream configure.ac or Makefile.am have set the correct AC_CONF=
IG_MACRO_DIRS, ACLOCAL_AUTOMAKE_DIR, or ACLOCAL_AMFLAGS.  if the recipe i=
s not correctly set,  the recipe is responsible for set correct acpaths t=
hemselves, or better to  send patch to upstream, set correct macro dirs i=
n configure.ac.
>> Eg:
>> for freetype,  according tohttps://github.com/freetype/freetype/blob/m=
aster/autogen.sh#L165,  we can set acpaths=3D -I .
>>
>> I tried to do a world build with poky,  only 3 recipes failed at do_co=
nfigure,  I plan to test with all layer under meta-openembeded later.
> Right, that=E2=80=99s what I was getting at and what I=E2=80=99ve _almo=
st_ got entirely working in a branch:
>
> https://git.yoctoproject.org/poky-contrib/log/?h=3Dross/autoconf-wip
>
> I think the remaining problem was lttng-utils behaving very oddly on re=
builds.  I=E2=80=99ll dig into my work log and do a rebuild, but I hope t=
o be posting it shortly.
>
> Ross

Thanks Ross,=C2=A0 hope to see your post soon.

Changqing

--------------J60Z6LBlQpk3DZqh0KqzB6EC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51KNa2p0030451

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 2/20/25 22:40, Ross Burton wrote:<b=
r>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:B4E286BE-E1C3-4989-9675-7A81153=
CC3D3@arm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On 20 Feb 2025, at 08:56, Changqing Li <a class=3D"moz-txt-link-rfc2396E"=
 href=3D"mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.co=
m&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">For  autotools.bbclass,  h=
ow about don't pass -I $i to acpaths,  suppose that upstream configure.ac=
 or Makefile.am have set the correct AC_CONFIG_MACRO_DIRS, ACLOCAL_AUTOMA=
KE_DIR, or ACLOCAL_AMFLAGS.  if the recipe is not correctly set,  the rec=
ipe is responsible for set correct acpaths themselves, or better to  send=
 patch to upstream, set correct macro dirs in configure.ac.
Eg:
for freetype,  according to <a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://github.com/freetype/freetype/blob/master/autogen.sh#L165">https://g=
ithub.com/freetype/freetype/blob/master/autogen.sh#L165</a>,  we can set =
acpaths=3D -I .

I tried to do a world build with poky,  only 3 recipes failed at do_confi=
gure,  I plan to test with all layer under meta-openembeded later.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Right, that=E2=80=99s what I was getting at and what I=E2=80=99ve _almost=
_ got entirely working in a branch:

<a class=3D"moz-txt-link-freetext" href=3D"https://git.yoctoproject.org/p=
oky-contrib/log/?h=3Dross/autoconf-wip">https://git.yoctoproject.org/poky=
-contrib/log/?h=3Dross/autoconf-wip</a>

I think the remaining problem was lttng-utils behaving very oddly on rebu=
ilds.  I=E2=80=99ll dig into my work log and do a rebuild, but I hope to =
be posting it shortly.

Ross</pre>
    </blockquote>
    <p>Thanks Ross,&nbsp; hope to see your post soon.</p>
    <p>Changqing<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:B4E286BE-E1C3-4989-9675-7A81153=
CC3D3@arm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
    </blockquote>
  </body>
</html>

--------------J60Z6LBlQpk3DZqh0KqzB6EC--

