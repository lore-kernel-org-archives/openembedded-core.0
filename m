Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 574ABD6D253
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 01:27:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.85984.1732757246236800009
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 17:27:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1062ca15bd=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AS0Y4IC029517
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 17:27:25 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 436719rfg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 17:27:24 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AS1ROTE008269;
	Wed, 27 Nov 2024 17:27:24 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2048.outbound.protection.outlook.com [104.47.55.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 436719rfg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 17:27:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sgZuLkJxHOgwfdOelieF0UfnU6CoSVrNcuU9PFsOWdp072PNAsI3SBzDWrVmb3cu0IUR9fzF/0NSXn86cyEnV7QmMUljuzUbpI+WFm2BXU9id4LU3A8zo2MFjdZtTK4YNcWwnSQWKd5VQBf3+41AowlXtRiGAa9xcLM9UXJ23/JzCL87p6/4dPt54atdv2gWcIAF3lsMDThh+h+P0A6CGTsH4Xw/V+3bcoebrnzQSzIEdYyVgzaCBCeo8WBU3wSfRsCG6Bjc748WeYs9cOgQVRjf8XCXm8ZS0Wyoc4VszGr9pv6zXNojLgSQfRabLeiI7GNela9ptJsAPhL27ZRTAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+isEwa/4Bg1gT24kTWfC8w/II/QmGBb8krUr92IlF4Q=;
 b=a/nlcSnCyLUzFIxc6sO1b9BdvTf0u2nC3FYJKBj2yKW2rEjJXzO3Mn4PUL8G8hho7snREH8NdfsXtSHj2bmmPoq0GuDpSYdhwdf3DXNJ633jjrfyAhdD14vSG/+3LDYqeGgMUL1TuFPcG/RrZ/AuXSdc3J5K/xBgcQuvM36dKW+ITWTZsvHFO1b26rRKmQCpaOgwuIJyaddv13pxCBdCWtODwakyT54jIt/CH4+1dHpMlP781GAICFRtT962i8dSPaJ2DVVXoUGfPrYcA1PhRqJqvPQ1MGNktbsuzMf0mq6pCwLOC2Uc5/k4jDxUcbCPTzxQIBQN875o1LauCWclMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MW6PR11MB8392.namprd11.prod.outlook.com (2603:10b6:303:23a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Thu, 28 Nov
 2024 01:27:19 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%7]) with mapi id 15.20.8093.018; Thu, 28 Nov 2024
 01:27:19 +0000
Content-Type: multipart/alternative;
 boundary="------------EphH0Fs0FFhKQ6TtC0sTw4Va"
Message-ID: <eefb89cc-5222-400a-9272-be9e7a6ffe4a@windriver.com>
Date: Thu, 28 Nov 2024 09:27:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH] libsoup: fix
 CVE-2024-52530/CVE-2024-52531/CVE-2024-52532
To: vanusuri@mvista.com
Cc: openembedded-core@lists.openembedded.org
References: <20241127091158.1928488-1-changqing.li@windriver.com>
 <CANQUz19Q57qGrzCSYc31vs0ng1P2gnRqGvJQBvW=U-tLpZ6m6g@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CANQUz19Q57qGrzCSYc31vs0ng1P2gnRqGvJQBvW=U-tLpZ6m6g@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0160.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::7) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MW6PR11MB8392:EE_
X-MS-Office365-Filtering-Correlation-Id: 85275756-4e2f-4022-7b0e-08dd0f4bccbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UmxsQ1VPTWEwWTQ5VXk0VlVqVEIxQkdBZzBLV3BHZXg3Q2hOelFoUHQzY2wv?=
 =?utf-8?B?V1JsMmNVTmFFbHZ0cnYraGxaaWU5TVEydU45Tm9PYVBLc0xpOFpxVitKRHhM?=
 =?utf-8?B?ZG93VzlrYlgwbFR1VWNnQzkwNkhzUFZPTko3RGVwR0JjVjRFcll5VEJZTnhl?=
 =?utf-8?B?WmtOWWk4S2tuZjlwUE82UDgyK0FTT1hKU29MRjFXYktXYmtZeUFPbXcvRUpN?=
 =?utf-8?B?YW1icnVEMGUvb24vRW9jTXpwbzZKcHREZ2R4QWt2OXQ2cHg5YjQxbW12ZkZh?=
 =?utf-8?B?d1pHYnhjZUtaMm1pWFRXdTNtMUJjVHpreEN5cXJRUEJ2cDhEZ0hDVWd6V3Av?=
 =?utf-8?B?cXlhZW53d2hCTzFIcXAzdnBjdXowNnU3ODRWMlBTOHF4STI2OElVRnZiUHdu?=
 =?utf-8?B?bEFwTk96dERnY3lCcUJyZEROVElOdlUvYWZtZWdrMlRmdTNDUGQ5b3NFdkNH?=
 =?utf-8?B?UUZtb0VFVisvMkZFbGlOdDQ2NkN0dVZrang0ZzBWNmNWRXpJT0JTaGRydUVk?=
 =?utf-8?B?bzRaYU9EcTRyY01ZR2VsaGY1aVpTR1hqNHpuZGNWWHZMOGRLVWRjdHRwMFN5?=
 =?utf-8?B?TUEwcGhWZ3RoTWZiSGczaSt1VEdSM1J2azhYVFZOSUUzNWFnVjUycnVGNVBK?=
 =?utf-8?B?aEZSRlhyZjhBYlE3SEVIamNmUGlQdWhGNVlnVy8rMjVKSU1aN01BSGRaSkFT?=
 =?utf-8?B?ZDlGN2RMQ1I3dXNaOVVZOVpiV0oveXZhOTNEaUdYWTBaZVNyNnVlYmFESmxw?=
 =?utf-8?B?SFp6MElSNUY2SGVqNHkzUE9TdWJBbjM4WmYxcng0N09VaDVTdmhwbzJxY0s1?=
 =?utf-8?B?QjdkSTdzS1pYcE44cUZrY05XR0Fhem5yc0RpUmdHTjdqMWNvUmtYM3dmbEpL?=
 =?utf-8?B?M3AxNFpkZUtBRlExT3RSWFZpS1pITXVabnlVY3pOUTIzbjlEcFZmTkorTDJi?=
 =?utf-8?B?ZHovRnJndGFCRE1hUW9XMGJ3MmQxL25vTkhjKzdrYXJpODFUWWtnZ3laaW90?=
 =?utf-8?B?eUZueW94NkQyeU1FQzR2OUpnUFVuSDBkSFpURUVUK3B0UCt0c0hSRXFVQmxq?=
 =?utf-8?B?K0Y2cjg3dG1LQlBQemk1VVJMMloydXpxTGRrQlNZcytzVDgxVGtBUDRWVFhl?=
 =?utf-8?B?ajN3Z0s3V2ppcEUzanMyeUhIRmxyelFJc2FTQStKc29LaWY3SU50YlFOWWl6?=
 =?utf-8?B?V2VyOWZSSkFsYXd5a0xaeDNDN09VNHJsQjZNOElsZVd3VGpiU2R0emNKVnhz?=
 =?utf-8?B?OTdRc1hkbFRqM0FoQVE3WlB2VGNVWlV6T3p4UFdVTHU5QnZEZmh2bW5aUURT?=
 =?utf-8?B?eU01MFd5RTExTlo4ZDFqOElEK3dvYUhFbTdGMDJ5RFlJWVB3ejk1OFlTTytH?=
 =?utf-8?B?OVg4ZE03a0F5WXNpb3h5Zzh5QkY3a0ZvRTlzNlpSVFJaSWVlRFNmYzFKcW1N?=
 =?utf-8?B?SmFqdnV2QURtUTE0ZTQ4RGpNazRzK1lJVXh0UEd1a29RakE1VFdTOWkwaUVC?=
 =?utf-8?B?OTJ1UG96UmtwZDZRMkJ6ZTNhV0FDR1V1S1MwUWxqZ2xMMUlqZFVKUERHK3pt?=
 =?utf-8?B?ZjlBeXl4aGxZTUhucDZrTUh0YjZwUC9hb1Vya3ZSS3Z4MEZNNGN2eFUzTTRi?=
 =?utf-8?B?TVc2bFZOS3lyR1hMVHZVS2F4aEdDTG5CclJBV2JBRS9CemhidmFqVGYrN3d0?=
 =?utf-8?B?UjVOR1dnb25MLzhMcko2ZkFmd0s3K2xRS2RlMm5PK0MvYjh4VjlkZ0FJcWVL?=
 =?utf-8?Q?Q6wxUmsJvwoIvYeEr4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YVZ6dm92K0dUZ1VqV0RTbGUyRDg4K3hNZnIwaHJwdjZtNXIvZ05aR245QTVV?=
 =?utf-8?B?dDVubTduaGdTckdPTjZid2RLNS9EYm9BWXViV1Jvd0dvbmJ0c3o3Z25VTVYx?=
 =?utf-8?B?K3JDWnVLQjQvSnJHcTN0b29qcm8waGZUa2wxR01pak81bnFLYVk5Z2lsQWNa?=
 =?utf-8?B?Sk9LVnBpaFBZdUsrRUlOcTQ2bEtwVVhmR0psOVdXM1F1bFVCNzdRY0VnQ1FD?=
 =?utf-8?B?N25hOUhBY3FKVzNXYU4rZVNOL3dVYVpPK1JvWVNDcnVPNjgrOURzeDRvVnVD?=
 =?utf-8?B?TnBhUk5qZkk2MmJxcUtxUm05RWVYSzJCc0xrY3lHdWNtN3R6Y3N6S2NWM281?=
 =?utf-8?B?RU5lbTRBRDdxTFJZTThqWlpQeFphUTQ5UjRmbjNVWVhYRFJ4MDZPVlZPTkNJ?=
 =?utf-8?B?MGRjQjI1THVoMHV6WjVsWWpWWHpuamw5bENKN2QxVW5pRFdjc1p5UzFKb2tk?=
 =?utf-8?B?amlOcGY2QkdmbXBvRzVLb1NjalpCWmFNV0gwTUUxb1ZoWVc4V0xybWxKSCs0?=
 =?utf-8?B?RXZUTG1QUlc3OTRjWG5YcStKTG1rUGczMGdEclB2WDZ2Zm0xM3V0TFEzc3RU?=
 =?utf-8?B?eUxMN2lDRnpmME5pa3lmbEUyZXZvR1A2UG5SZy9PcjVyL2xQM3JDekJZTWxJ?=
 =?utf-8?B?TTVHbjY5N3VuZDYyWTNTakdYemRFaXRjbVZPL2h2ZnZ6UExQOU0xTyt6RkJo?=
 =?utf-8?B?d0dLUFNLbGMzS3dDTjZ4UmFlT0FNcWtQcWh1b2l5L1FMSG1kdU1sbXRhaExF?=
 =?utf-8?B?U0RzaG00ZlI1MjNVNExMMlJ4NElUQUtGV0tZRUxTQjNNemw4c0NSK3E4dGlH?=
 =?utf-8?B?N3dIb2F2OGx0cklLL3lSR25TWnB6MjhzUy9meUovV1RiNlZFNUpsTGRIeDI2?=
 =?utf-8?B?ZllaLzZNK3JRWHRuanNxUDBicTBYZkJVWkw3VzRGUWFjM3hJYy80SEIyU3Ur?=
 =?utf-8?B?N0UwaVBDcVgxVTJJd1NZOTUvUWpwK3ZjcElpZWZnWGkyblRDQURqanUwUkhS?=
 =?utf-8?B?TUFVNXgrcHltSTRIYVY4MGtZOUdWNDFEK056NlZTUWhuN25NZ3RFeVU0Y2pY?=
 =?utf-8?B?aGd5Y0hVQ0Zvb0lxZnBhYXAyc1BwYS8wTEp5SmhmSmQzT241aTVxai9nRC94?=
 =?utf-8?B?WkNFNjYxUlZDRDN2SVdmMkJmbzNtOHpuZVByV3NocXV1S3Z2eHlMRVF1eVVC?=
 =?utf-8?B?UTU0c000QzFvdmExUHFISDBYUG0rbUZRRmZZRVFGd0p2bkV1U292QldEVjhR?=
 =?utf-8?B?bFZibXVpSkZLWTZFbHVjemJFMm1iZHYzcFJhQlJwbmVKQTBKRnBlYWZaMXA5?=
 =?utf-8?B?K0xYWlozRm0wTWg4cDBmTUdzWHk2T0hGZkVqcjRmODI1QWRoNloyMk1IV2ZL?=
 =?utf-8?B?eDlpR2JaNzBDREYzVVliWmZNR3oyZ2JQTFNNZjdrZnJPK1RTVkphM1lMRTFq?=
 =?utf-8?B?dHM3Z0xKSlYzd1FJWnphdmt3T2ZzeGdDQ1dHQ3lreFd0YlpLMFZNRm02blVW?=
 =?utf-8?B?clQxMjc3Q1pDaUJNYlBCVXU3czBpbFlVZldjZGw5d2crOFRHS0lsUmE5ZGU4?=
 =?utf-8?B?OHYyYzlCK1QvSkJMdHdWR3BITGJyYVpaSXd6eGttaHRUWFZLT1dhZUYzK2x3?=
 =?utf-8?B?QkI0QnArVlBxdEZaUW8rbW9DQkl3MXFKU1BXdnVNKzJSbkhBYVB2dmltbTJU?=
 =?utf-8?B?bUNpQ1VWMU5XRk9VaXl1bmhneTFTa3JnQjRNNWNwMy84Zm5wNEM5L3k2UnhZ?=
 =?utf-8?B?a1RsQVBtLzZQSTBSMTJ5YUR3ZEliM3ZTTWo2aXZxVmtSWkpwSDdUT0ZBc1VC?=
 =?utf-8?B?U0xRa21YSXd5aVVzSFJGMHFpQXlmYTcvRmQrRndjZEkzUTRHSVVpRmx6ZDhK?=
 =?utf-8?B?U2NBS1gzR3hFU3Y2Uk9vYXMyMkxwMUlTQ25nYXBxU2trckdsY0VhaUxTT1F5?=
 =?utf-8?B?ckZ5R0J1dEl1VmJRcERIQzkxVnBieVV3QjlKMkp5a3BTMlhPSi9qYkFYVlAx?=
 =?utf-8?B?KzBkK0Z1RTh2ZTFFYk41dXhkME5aOGpGTmo4MnNqOGJya09yRi9rcUs3N1JY?=
 =?utf-8?B?Wm9FT0JqRXFpbGZhMXN5Y1ozNWhoalpEaHRnWDJZQkJjZDdMTWdvbkY5LzZa?=
 =?utf-8?B?L1dSUE12OFZOUkNWcXE1K3RmOVdkT1dGeXBXVkJHL0NHUFMvcVZFSWI1T2ds?=
 =?utf-8?B?Rnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85275756-4e2f-4022-7b0e-08dd0f4bccbf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 01:27:19.2956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2u68LJVtSvaN/fKAZ5L4VFoknChwzrh6irLU/0s7eSvcN56WOPnIv/eQb+GJ09yCzbOJACOM+VVv2oyf7vQoMqtz3DoB2hhvvf0MmJGinK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8392
X-Proofpoint-ORIG-GUID: 7dxpozcOdsMbNBTsruOK6SQeWAtHvGVy
X-Proofpoint-GUID: Q3qYauR_yF1Mz5FFgviBF94a8Mc9IIWZ
X-Authority-Analysis: v=2.4 cv=Z/8WHGRA c=1 sm=1 tr=0 ts=6747c6fc cx=c_pps a=+hq7TYb7Jqj0EztKBnUMzg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=ySjF6f4xAAAA:8 a=PYnjg3YJAAAA:8 a=42A6NSW8AAAA:8 a=GHR8O2WEAAAA:20 a=A1X0JdhQAAAA:8 a=t7CeM3EgAAAA:8 a=V2sgnzSHAAAA:8 a=vggBfdFIAAAA:8 a=xNf9USuDAAAA:8 a=VcAbqkiA9PcDI0g6X0gA:9 a=NZgXx8A_9icBqQij:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8
 a=hRUeiFDKXmxO659onisA:9 a=J_cNjVyLXs7iTP3n:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=T1a-OTYGVawA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=SVe2G6S_LxxHVpu7-jkk:22 a=xFGF5xgqTccuvRc6b-n5:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-27_12,2024-11-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 mlxscore=0 priorityscore=1501 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2411280011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 01:27:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207973

--------------EphH0Fs0FFhKQ6TtC0sTw4Va
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AS0Y4IC029517


On 11/27/24 22:16, Vijay Anusuri via lists.openembedded.org wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
> Hi Changqing Li,
>
> Fixes for CVE-2024-52530 and CVE-2024-52532 already submitted and=20
> landed in kirkstone-nut.
>
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstab=
le/kirkstone-nut&id=3D5c96ff64b5c29e589d776d23dbbed64ad526a997=20
> <https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dsta=
ble/kirkstone-nut&id=3D5c96ff64b5c29e589d776d23dbbed64ad526a997>
>
> Could you please send a v2 patch for CVE-2024-52531.

Got it, Thanks, V2 coming

Changqing

>
> Thanks & Regards,
> Vijay
>
> On Wed, Nov 27, 2024 at 2:42=E2=80=AFPM Changqing Li via=20
> lists.openembedded.org <http://lists.openembedded.org> <changqing.li=20
> <http://changqing.li>=3Dwindriver.com@lists.openembedded.org> wrote:
>
>     From: Changqing Li <changqing.li@windriver.com>
>
>     CVE-2024-52532:
>     GNOME libsoup before 3.6.1 has an infinite loop, and memory
>     consumption.
>     during the reading of certain patterns of WebSocket data from clien=
ts.
>
>     Refer:
>     https://nvd.nist.gov/vuln/detail/CVE-2024-52532
>
>     CVE-2024-52531:
>     GNOME libsoup before 3.6.1 allows a buffer overflow in
>     applications that
>     perform conversion to UTF-8 in soup_header_parse_param_list_strict.
>     Input received over the network cannot trigger this.
>
>     Refer:
>     https://nvd.nist.gov/vuln/detail/CVE-2024-52531
>
>     CVE-2024-52530:
>     GNOME libsoup before 3.6.0 allows HTTP request smuggling in some
>     configurations because '\0' characters at the end of header names a=
re
>     ignored, i.e., a "Transfer-Encoding\0: chunked" header is treated t=
he
>     same as a "Transfer-Encoding: chunked" header.
>
>     Refer:
>     https://nvd.nist.gov/vuln/detail/CVE-2024-52530
>
>     Signed-off-by: Changqing Li <changqing.li@windriver.com>
>     ---
>     =C2=A0.../libsoup-3.0.7/CVE-2024-52530.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 150
>     ++++++++++++++++++
>     =C2=A0.../libsoup-3.0.7/CVE-2024-52531-1.patch=C2=A0 =C2=A0 =C2=A0 =
| 116 ++++++++++++++
>     =C2=A0.../libsoup-3.0.7/CVE-2024-52531-2.patch=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 40 +++++
>     =C2=A0.../libsoup-3.0.7/CVE-2024-52531-3.patch=C2=A0 =C2=A0 =C2=A0 =
| 136 ++++++++++++++++
>     =C2=A0.../libsoup-3.0.7/CVE-2024-52532-1.patch=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 75 +++++++++
>     =C2=A0.../libsoup-3.0.7/CVE-2024-52532-2.patch=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 46 ++++++
>     =C2=A0meta/recipes-support/libsoup/libsoup_3.0.7.bb
>     <http://libsoup_3.0.7.bb> |=C2=A0 =C2=A08 +-
>     =C2=A07 files changed, 570 insertions(+), 1 deletion(-)
>     =C2=A0create mode 100644
>     meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52530.patch
>     =C2=A0create mode 100644
>     meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-1.patch
>     =C2=A0create mode 100644
>     meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-2.patch
>     =C2=A0create mode 100644
>     meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-3.patch
>     =C2=A0create mode 100644
>     meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-1.patch
>     =C2=A0create mode 100644
>     meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-2.patch
>
>     diff --git
>     a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52530.patch
>     b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52530.patch
>     new file mode 100644
>     index 0000000000..fb6d5c3c6f
>     --- /dev/null
>     +++ b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52530.pat=
ch
>     @@ -0,0 +1,150 @@
>     +From 04df03bc092ac20607f3e150936624d4f536e68b Mon Sep 17 00:00:00
>     2001
>     +From: Patrick Griffis <pgriffis@igalia.com>
>     +Date: Mon, 8 Jul 2024 12:33:15 -0500
>     +Subject: [PATCH] headers: Strictly don't allow NUL bytes
>     +
>     +In the past (2015) this was allowed for some problematic sites.
>     However Chromium also does not allow NUL bytes in either header
>     names or values these days. So this should no longer be a problem.
>     +
>     +CVE: CVE-2024-52530
>     +Upstream-Status: Backport
>     [https://gitlab.gnome.org/GNOME/libsoup/-/commit/04df03bc092ac20607=
f3e150936624d4f536e68b]
>     +
>     +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>     +---
>     + libsoup/soup-headers.c=C2=A0 =C2=A0 =C2=A0 | 15 +++------
>     + tests/header-parsing-test.c | 62
>     +++++++++++++++++--------------------
>     + 2 files changed, 32 insertions(+), 45 deletions(-)
>     +
>     +diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
>     +index a0cf351ac..f30ee467a 100644
>     +--- a/libsoup/soup-headers.c
>     ++++ b/libsoup/soup-headers.c
>     +@@ -51,13 +51,14 @@ soup_headers_parse (const char *str, int len,
>     SoupMessageHeaders *dest)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * ignorable trailing whitespace.
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */
>     +
>     ++=C2=A0 =C2=A0 =C2=A0 /* No '\0's are allowed */
>     ++=C2=A0 =C2=A0 =C2=A0 if (memchr (str, '\0', len))
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;
>     ++
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Skip over the Request-Line / Status-=
Line */
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0headers_start =3D memchr (str, '\n', le=
n);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!headers_start)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return FALS=
E;
>     +-=C2=A0 =C2=A0 =C2=A0 /* No '\0's in the Request-Line / Status-Lin=
e */
>     +-=C2=A0 =C2=A0 =C2=A0 if (memchr (str, '\0', headers_start - str))
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* We work on a copy of the headers, wh=
ich we can write '\0's
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * into, so that we don't have to indiv=
idually g_strndup and
>     +@@ -69,14 +70,6 @@ soup_headers_parse (const char *str, int len,
>     SoupMessageHeaders *dest)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0headers_copy[copy_len] =3D '\0';
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0value_end =3D headers_copy;
>     +
>     +-=C2=A0 =C2=A0 =C2=A0 /* There shouldn't be any '\0's in the heade=
rs already, but
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0* this is the web we're talking about.
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0*/
>     +-=C2=A0 =C2=A0 =C2=A0 while ((p =3D memchr (headers_copy, '\0', co=
py_len))) {
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memmove (p, p + =
1, copy_len - (p - headers_copy));
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy_len--;
>     +-=C2=A0 =C2=A0 =C2=A0 }
>     +-
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0while (*(value_end + 1)) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name =3D va=
lue_end + 1;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name_end =3D=
 strchr (name, ':');
>     +diff --git a/tests/header-parsing-test.c
>     b/tests/header-parsing-test.c
>     +index edf8eebb3..715c2c6f2 100644
>     +--- a/tests/header-parsing-test.c
>     ++++ b/tests/header-parsing-test.c
>     +@@ -358,24 +358,6 @@ static struct RequestTest {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0},
>     +
>     +-=C2=A0 =C2=A0 =C2=A0 { "NUL in header name", "760832",
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 "GET / HTTP/1.1\r\nHost\x00: example.=
com
>     <http://example.com>\r\n", 36,
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 SOUP_STATUS_OK,
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 "GET", "/", SOUP_HTTP_1_1,
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 { { "Host", "example.com <http://exam=
ple.com>" },
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { NULL }
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>     +-=C2=A0 =C2=A0 =C2=A0 },
>     +-
>     +-=C2=A0 =C2=A0 =C2=A0 { "NUL in header value", "760832",
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 "GET / HTTP/1.1\r\nHost: example\x00"=
 "com\r\n", 35,
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 SOUP_STATUS_OK,
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 "GET", "/", SOUP_HTTP_1_1,
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 { { "Host", "examplecom" },
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { NULL }
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>     +-=C2=A0 =C2=A0 =C2=A0 },
>     +-
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0/************************/
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*** INVALID REQUESTS ***/
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0/************************/
>     +@@ -448,6 +430,21 @@ static struct RequestTest {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SOUP_STATUS_EXPECTATION_FAILED,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, NULL, -1,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ { NULL } }
>     ++=C2=A0 =C2=A0 =C2=A0 },
>     ++
>     ++=C2=A0 =C2=A0 =C2=A0 // https://gitlab.gnome.org/GNOME/libsoup/-/=
issues/377
>     ++=C2=A0 =C2=A0 =C2=A0 { "NUL in header name", NULL,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 "GET / HTTP/1.1\r\nHost\x00: example.=
com
>     <http://example.com>\r\n", 36,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 SOUP_STATUS_BAD_REQUEST,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, NULL, -1,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 { { NULL } }
>     ++=C2=A0 =C2=A0 =C2=A0 },
>     ++
>     ++=C2=A0 =C2=A0 =C2=A0 { "NUL in header value", NULL,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 "HTTP/1.1 200 OK\r\nFoo: b\x00" "ar\r=
\n", 28,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 SOUP_STATUS_BAD_REQUEST,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, NULL, -1,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 { { NULL } }
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     + };
>     + static const int num_reqtests =3D G_N_ELEMENTS (reqtests);
>     +@@ -620,22 +617,6 @@ static struct ResponseTest {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ NULL } }
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0},
>     +
>     +-=C2=A0 =C2=A0 =C2=A0 { "NUL in header name", "760832",
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 "HTTP/1.1 200 OK\r\nF\x00oo: bar\r\n"=
, 28,
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 SOUP_HTTP_1_1, SOUP_STATUS_OK, "OK",
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 { { "Foo", "bar" },
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { NULL }
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>     +-=C2=A0 =C2=A0 =C2=A0 },
>     +-
>     +-=C2=A0 =C2=A0 =C2=A0 { "NUL in header value", "760832",
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 "HTTP/1.1 200 OK\r\nFoo: b\x00" "ar\r=
\n", 28,
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 SOUP_HTTP_1_1, SOUP_STATUS_OK, "OK",
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 { { "Foo", "bar" },
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { NULL }
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>     +-=C2=A0 =C2=A0 =C2=A0 },
>     +-
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0/********************************/
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*** VALID CONTINUE RESPONSES ***/
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0/********************************/
>     +@@ -768,6 +749,19 @@ static struct ResponseTest {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ { NULL }
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0},
>     ++
>     ++=C2=A0 =C2=A0 =C2=A0 // https://gitlab.gnome.org/GNOME/libsoup/-/=
issues/377
>     ++=C2=A0 =C2=A0 =C2=A0 { "NUL in header name", NULL,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 "HTTP/1.1 200 OK\r\nF\x00oo: bar\r\n"=
, 28,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 -1, 0, NULL,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 { { NULL } }
>     ++=C2=A0 =C2=A0 =C2=A0 },
>     ++
>     ++=C2=A0 =C2=A0 =C2=A0 { "NUL in header value", "760832",
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 "HTTP/1.1 200 OK\r\nFoo: b\x00" "ar\r=
\n", 28,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 -1, 0, NULL,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 { { NULL } }
>     ++=C2=A0 =C2=A0 =C2=A0 },
>     + };
>     + static const int num_resptests =3D G_N_ELEMENTS (resptests);
>     +
>     +--
>     +GitLab
>     +
>     diff --git
>     a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-1.patch
>     b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-1.patch
>     new file mode 100644
>     index 0000000000..c8e855c128
>     --- /dev/null
>     +++
>     b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-1.patch
>     @@ -0,0 +1,116 @@
>     +From 4ec9e3d286b6d3e982cb0fc3564dee0bf8d87ede Mon Sep 17 00:00:00
>     2001
>     +From: Patrick Griffis <pgriffis@igalia.com>
>     +Date: Tue, 27 Aug 2024 12:18:58 -0500
>     +Subject: [PATCH] fuzzing: Cover soup_header_parse_param_list
>     +
>     +CVE: CVE-2024-52531
>     +Upstream-Status: Backport
>     +[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407/diffs=
?commit_id=3D4ec9e3d286b6d3e982cb0fc3564dee0bf8d87ede]
>     +
>     +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>     +
>     +---
>     + fuzzing/fuzz.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 9 +++++++--
>     + fuzzing/fuzz_header_parsing.c=C2=A0 =C2=A0 | 19 +++++++++++++++++=
++
>     + fuzzing/fuzz_header_parsing.dict |=C2=A0 8 ++++++++
>     + fuzzing/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 2 ++
>     + 4 files changed, 36 insertions(+), 2 deletions(-)
>     + create mode 100644 fuzzing/fuzz_header_parsing.c
>     + create mode 100644 fuzzing/fuzz_header_parsing.dict
>     +
>     +diff --git a/fuzzing/fuzz.h b/fuzzing/fuzz.h
>     +index 0d380285..f3bd28ee 100644
>     +--- a/fuzzing/fuzz.h
>     ++++ b/fuzzing/fuzz.h
>     +@@ -1,13 +1,14 @@
>     + #include "libsoup/soup.h"
>     +
>     + int LLVMFuzzerTestOneInput (const unsigned char *data, size_t siz=
e);
>     ++static int set_logger =3D 0;
>     +
>     + #ifdef FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION
>     + static GLogWriterOutput
>     + empty_logging_func (GLogLevelFlags log_level, const GLogField
>     *fields,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gsize n_fields, gpointer user_data)
>     + {
>     +-=C2=A0 return G_LOG_WRITER_HANDLED;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return G_LOG_WRITER_HANDLED;
>     + }
>     + #endif
>     +
>     +@@ -16,6 +17,10 @@ static void
>     + fuzz_set_logging_func (void)
>     + {
>     + #ifdef FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION
>     +-=C2=A0 g_log_set_writer_func (empty_logging_func, NULL, NULL);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!set_logger)
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_logge=
r =3D 1;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_log_set=
_writer_func (empty_logging_func, NULL,
>     NULL);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>     + #endif
>     + }
>     +diff --git a/fuzzing/fuzz_header_parsing.c
>     b/fuzzing/fuzz_header_parsing.c
>     +new file mode 100644
>     +index 00000000..a8e5c1f9
>     +--- /dev/null
>     ++++ b/fuzzing/fuzz_header_parsing.c
>     +@@ -0,0 +1,19 @@
>     ++#include "fuzz.h"
>     ++
>     ++int
>     ++LLVMFuzzerTestOneInput (const unsigned char *data, size_t size)
>     ++{
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 GHashTable *elements;
>     ++
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 // We only accept NUL terminated stri=
ngs
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!size || data[size - 1] !=3D '\0'=
)
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
>     ++
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 fuzz_set_logging_func ();
>     ++
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 elements =3D soup_header_parse_param_=
list((char*)data);
>     ++
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_hash_table_unref(elements);
>     ++
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
>     ++}
>     +\ No newline at end of file
>     +diff --git a/fuzzing/fuzz_header_parsing.dict
>     b/fuzzing/fuzz_header_parsing.dict
>     +new file mode 100644
>     +index 00000000..1562ca3a
>     +--- /dev/null
>     ++++ b/fuzzing/fuzz_header_parsing.dict
>     +@@ -0,0 +1,8 @@
>     ++"*=3DUTF-8''"
>     ++"*=3Diso-8859-1''"
>     ++"'"
>     ++"''"
>     ++"=3D"
>     ++"*=3D"
>     ++"""
>     ++";"
>     +\ No newline at end of file
>     +diff --git a/fuzzing/meson.build b/fuzzing/meson.build
>     +index b14cbb50..5dd0f417 100644
>     +--- a/fuzzing/meson.build
>     ++++ b/fuzzing/meson.build
>     +@@ -5,6 +5,7 @@ fuzz_targets =3D [
>     +=C2=A0 =C2=A0'fuzz_cookie_parse',
>     +=C2=A0 =C2=A0'fuzz_content_sniffer',
>     +=C2=A0 =C2=A0'fuzz_date_time',
>     ++=C2=A0 'fuzz_header_parsing',
>     + ]
>     +
>     + fuzzing_args =3D '-fsanitize=3Dfuzzer,address,undefined'
>     +@@ -34,6 +35,7 @@ if have_fuzzing and (fuzzing_feature.enabled()
>     or fuzzing_feature.auto())
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'-runs=3D200000',
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'-artifact_prefix=3Dmeson-logs/'=
 + target + '-',
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'-print_final_stats=3D1',
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 '-max_len=3D4096',
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0] + extra_args,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0env: [
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'ASAN_OPTIONS=3Dfast_unwind_on_m=
alloc=3D0',
>     +--
>     +2.25.1
>     +
>     diff --git
>     a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-2.patch
>     b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-2.patch
>     new file mode 100644
>     index 0000000000..7e0d81ba4c
>     --- /dev/null
>     +++
>     b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-2.patch
>     @@ -0,0 +1,40 @@
>     +From 825fda3425546847b42ad5270544e9388ff349fe Mon Sep 17 00:00:00
>     2001
>     +From: Patrick Griffis <pgriffis@igalia.com>
>     +Date: Tue, 27 Aug 2024 13:52:08 -0500
>     +Subject: [PATCH] tests: Add test for passing invalid UTF-8 to
>     + soup_header_parse_semi_param_list()
>     +
>     +CVE: CVE-2024-52531
>     +Upstream-Status: Backport
>     +[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407/diffs=
?commit_id=3D825fda3425546847b42ad5270544e9388ff349fe]
>     +
>     +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>     +---
>     + tests/header-parsing-test.c | 11 +++++++++++
>     + 1 file changed, 11 insertions(+)
>     +
>     +diff --git a/tests/header-parsing-test.c
>     b/tests/header-parsing-test.c
>     +index 715c2c6f..5e423d2b 100644
>     +--- a/tests/header-parsing-test.c
>     ++++ b/tests/header-parsing-test.c
>     +@@ -825,6 +825,17 @@ static struct ParamListTest {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ "filename", "t\xC3\xA9s=
t.txt" },
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0},
>     ++
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* This tests invalid UTF-8 data whic=
h *should* never be
>     passed here but it was designed to be robust against it. */
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 { TRUE,
>     ++
>     "invalid*=3D\x69\x27\x27\x93\x93\x93\x93\xff\x61\x61\x61\x61\x61\x6=
1\x61\x62\x63\x64\x65\x0a;
>     filename*=3Diso-8859-1''\x69\x27\x27\x93\x93\x93\x93\xff\x61\x61\x6=
1\x61\x61\x61\x61\x62\x63\x64\x65\x0a;
>     foo",
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 { "filename",
>     "i''\302\223\302\223\302\223\302\223\303\277aaaaaaabcde" },
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 { "invalid",
>     "\302\223\302\223\302\223\302\223\303\277aaaaaaabcde" },
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 { "foo", NULL },
>     ++
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>     + };
>     + static const int num_paramlisttests =3D G_N_ELEMENTS (paramlistte=
sts);
>     +
>     +--
>     +2.25.1
>     +
>     diff --git
>     a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-3.patch
>     b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-3.patch
>     new file mode 100644
>     index 0000000000..a47c8747c5
>     --- /dev/null
>     +++
>     b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-3.patch
>     @@ -0,0 +1,136 @@
>     +From a35222dd0bfab2ac97c10e86b95f762456628283 Mon Sep 17 00:00:00
>     2001
>     +From: Patrick Griffis <pgriffis@igalia.com>
>     +Date: Tue, 27 Aug 2024 13:53:26 -0500
>     +Subject: [PATCH] headers: Be more robust against invalid input
>     when parsing
>     + params
>     +
>     +If you pass invalid input to a function such as
>     soup_header_parse_param_list_strict()
>     +it can cause an overflow if it decodes the input to UTF-8.
>     +
>     +This should never happen with valid UTF-8 input which libsoup's
>     client API
>     +ensures, however it's server API does not currently.
>     +
>     +CVE: CVE-2024-52531
>     +Upstream-Status: Backport
>     +[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407/diffs=
?commit_id=3Da35222dd0bfab2ac97c10e86b95f762456628283]
>     +
>     +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>     +
>     +---
>     + libsoup/soup-headers.c | 46
>     ++++++++++++++++++++++--------------------
>     + 1 file changed, 24 insertions(+), 22 deletions(-)
>     +
>     +diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
>     +index f30ee467..613e1905 100644
>     +--- a/libsoup/soup-headers.c
>     ++++ b/libsoup/soup-headers.c
>     +@@ -646,8 +646,9 @@ soup_header_contains (const char *header,
>     const char *token)
>     + }
>     +
>     + static void
>     +-decode_quoted_string (char *quoted_string)
>     ++decode_quoted_string_inplace (GString *quoted_gstring)
>     + {
>     ++=C2=A0 =C2=A0 =C2=A0 char *quoted_string =3D quoted_gstring->str;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0char *src, *dst;
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0src =3D quoted_string + 1;
>     +@@ -661,10 +662,11 @@ decode_quoted_string (char *quoted_string)
>     + }
>     +
>     + static gboolean
>     +-decode_rfc5987 (char *encoded_string)
>     ++decode_rfc5987_inplace (GString *encoded_gstring)
>     + {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0char *q, *decoded;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0gboolean iso_8859_1 =3D FALSE;
>     ++=C2=A0 =C2=A0 =C2=A0 const char *encoded_string =3D encoded_gstri=
ng->str;
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0q =3D strchr (encoded_string, '\'');
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!q)
>     +@@ -696,14 +698,7 @@ decode_rfc5987 (char *encoded_string)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0decoded =3D=
 utf8;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +
>     +-=C2=A0 =C2=A0 =C2=A0 /* If encoded_string was UTF-8, then each 3-=
character %-escape
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0* will be converted to a single byte, =
and so decoded is
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0* shorter than encoded_string. If enco=
ded_string was
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0* iso-8859-1, then each 3-character %-=
escape will be
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0* converted into at most 2 bytes in UT=
F-8, and so it's still
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0* shorter.
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0*/
>     +-=C2=A0 =C2=A0 =C2=A0 strcpy (encoded_string, decoded);
>     ++=C2=A0 =C2=A0 =C2=A0 g_string_assign (encoded_gstring, decoded);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0g_free (decoded);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0return TRUE;
>     + }
>     +@@ -713,15 +708,17 @@ parse_param_list (const char *header, char
>     delim, gboolean strict)
>     + {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0GHashTable *params;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0GSList *list, *iter;
>     +-=C2=A0 =C2=A0 =C2=A0 char *item, *eq, *name_end, *value;
>     +-=C2=A0 =C2=A0 =C2=A0 gboolean override, duplicated;
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0params =3D g_hash_table_new_full (soup_=
str_case_hash,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
soup_str_case_equal,
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free=
, NULL);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free=
, g_free);
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0list =3D parse_list (header, delim);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (iter =3D list; iter; iter =3D iter=
->next) {
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *item, *eq,=
 *name_end;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gboolean overrid=
e, duplicated;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GString *parsed_=
value =3D NULL;
>     ++
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0item =3D it=
er->data;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0override =3D=
 FALSE;
>     +
>     +@@ -736,19 +733,19 @@ parse_param_list (const char *header, char
>     delim, gboolean strict)
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0*name_end =3D '\0';
>     +
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 value =3D (char *)skip_lws (eq + 1);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 parsed_value =3D g_string_new ((char
>     *)skip_lws (eq + 1));
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (name_end[-1] =3D=3D '*' && name_end > item
>     + 1) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name_end[-1] =3D '\0';
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!decode_rfc5987 (value)) {
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!decode_rfc5987_inplace
>     (parsed_value)) {
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_stri=
ng_free
>     (parsed_value, TRUE);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
g_free (item);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
continue;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0override =3D TRUE;
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 } else if (*value =3D=3D '"')
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 decode_quoted_string (value);
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 value =3D NULL;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 } else if (parsed_value->str[0] =3D=3D '"')
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 decode_quoted_string_inplace
>     (parsed_value);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0duplicated =
=3D g_hash_table_lookup_extended (params,
>     item, NULL, NULL);
>     +
>     +@@ -756,11 +753,16 @@ parse_param_list (const char *header, char
>     delim, gboolean strict)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0soup_header_free_param_list (params);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0params =3D NULL;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0g_slist_foreach (iter, (GFunc)g_free, NULL);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (parsed_value)
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_free (parsed_value, TRUE)=
;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0break;
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (overr=
ide || !duplicated)
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 g_hash_table_replace (params, item, value);
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (overr=
ide || !duplicated) {
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 g_hash_table_replace (params, item,
>     parsed_value ? g_string_free (parsed_value, FALSE) : NULL);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (parsed_value)
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_free (parsed_value, TRUE)=
;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0g_free (item);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0g_slist_free (list);
>     +--
>     +2.25.1
>     +
>     diff --git
>     a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-1.patch
>     b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-1.patch
>     new file mode 100644
>     index 0000000000..9afa1bb6bb
>     --- /dev/null
>     +++
>     b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-1.patch
>     @@ -0,0 +1,75 @@
>     +From 6adc0e3eb74c257ed4e2a23eb4b2774fdb0d67be Mon Sep 17 00:00:00
>     2001
>     +From: Ignacio Casal Quinteiro <qignacio@amazon.com>
>     +Date: Wed, 11 Sep 2024 11:52:11 +0200
>     +Subject: [PATCH 1/2] websocket: process the frame as soon as we
>     read data
>     +
>     +Otherwise we can enter in a read loop because we were not
>     +validating the data until the all the data was read.
>     +
>     +Fixes #391
>     +
>     +CVE: CVE-2024-52532
>     +Upstream-Status: Backport
>     [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/410/diffs?=
commit_id=3D6adc0e3eb74c257ed4e2a23eb4b2774fdb0d67be]
>     +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>     +---
>     + libsoup/websocket/soup-websocket-connection.c | 4 ++--
>     + 1 file changed, 2 insertions(+), 2 deletions(-)
>     +
>     +diff --git a/libsoup/websocket/soup-websocket-connection.c
>     b/libsoup/websocket/soup-websocket-connection.c
>     +index a1a730473..a14481340 100644
>     +--- a/libsoup/websocket/soup-websocket-connection.c
>     ++++ b/libsoup/websocket/soup-websocket-connection.c
>     +@@ -1199,9 +1199,9 @@ soup_websocket_connection_read
>     (SoupWebsocketConnection *self)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0priv->incom=
ing->len =3D len + count;
>     +-=C2=A0 =C2=A0 =C2=A0 } while (count > 0);
>     +
>     +-=C2=A0 =C2=A0 =C2=A0 process_incoming (self);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 process_incoming=
 (self);
>     ++=C2=A0 =C2=A0 =C2=A0 } while (count > 0 && !priv->close_sent && !=
priv->io_closing);
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (end) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!priv->=
close_sent || !priv->close_received) {
>     +--
>     +GitLab
>     +
>     +
>     +From 29b96fab2512666d7241e46c98cc45b60b795c0c Mon Sep 17 00:00:00
>     2001
>     +From: Ignacio Casal Quinteiro <qignacio@amazon.com>
>     +Date: Wed, 2 Oct 2024 11:17:19 +0200
>     +Subject: [PATCH 2/2] websocket-test: disconnect error copy after
>     the test ends
>     +
>     +Otherwise the server will have already sent a few more wrong
>     +bytes and the client will continue getting errors to copy
>     +but the error is already !=3D NULL and it will assert
>     +---
>     + tests/websocket-test.c | 4 +++-
>     + 1 file changed, 3 insertions(+), 1 deletion(-)
>     +
>     +diff --git a/tests/websocket-test.c b/tests/websocket-test.c
>     +index 06c443bb5..6a48c1f9b 100644
>     +--- a/tests/websocket-test.c
>     ++++ b/tests/websocket-test.c
>     +@@ -1539,8 +1539,9 @@ test_receive_invalid_encode_length_64 (Test
>     *test,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0GError *error =3D NULL;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0InvalidEncodeLengthTest context =3D { t=
est, NULL };
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0guint i;
>     ++=C2=A0 =C2=A0 =C2=A0 guint error_id;
>     +
>     +-=C2=A0 =C2=A0 =C2=A0 g_signal_connect (test->client, "error", G_C=
ALLBACK
>     (on_error_copy), &error);
>     ++=C2=A0 =C2=A0 =C2=A0 error_id =3D g_signal_connect (test->client,=
 "error",
>     G_CALLBACK (on_error_copy), &error);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0g_signal_connect (test->client, "messag=
e", G_CALLBACK
>     (on_binary_message), &received);
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* We use 127(\x7f) as payload length w=
ith 65535 extended
>     length */
>     +@@ -1553,6 +1554,7 @@ test_receive_invalid_encode_length_64 (Test
>     *test,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0WAIT_UNTIL (error !=3D NULL || received=
 !=3D NULL);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_error (error, SOUP_WEBSOCKET_E=
RROR,
>     SOUP_WEBSOCKET_CLOSE_PROTOCOL_ERROR);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0g_clear_error (&error);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_signal_handler_disconnect (test->cl=
ient, error_id);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_null (received);
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_thread_join (thread);
>     +--
>     +GitLab
>     +
>     diff --git
>     a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-2.patch
>     b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-2.patch
>     new file mode 100644
>     index 0000000000..6ae7845814
>     --- /dev/null
>     +++
>     b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-2.patch
>     @@ -0,0 +1,46 @@
>     +From 4c9e75c6676a37b6485620c332e568e1a3f530ff Mon Sep 17 00:00:00
>     2001
>     +From: Simon McVittie <smcv@debian.org>
>     +Date: Wed, 13 Nov 2024 14:14:23 +0000
>     +Subject: [PATCH] websocket-test: Disconnect error signal in
>     another place
>     +
>     +This is the same change as commit 29b96fab "websocket-test:
>     disconnect
>     +error copy after the test ends", and is done for the same reason, =
but
>     +replicating it into a different function.
>     +
>     +Fixes: 6adc0e3e "websocket: process the frame as soon as we read
>     data"
>     +Resolves: https://gitlab.gnome.org/GNOME/libsoup/-/issues/399
>     +Signed-off-by: Simon McVittie <smcv@debian.org>
>     +
>     +CVE: CVE-2024-52532
>     +Upstream-Status: Backport
>     [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/410/diffs?=
commit_id=3D29b96fab2512666d7241e46c98cc45b60b795c0c]
>     +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>     +---
>     + tests/websocket-test.c | 4 +++-
>     + 1 file changed, 3 insertions(+), 1 deletion(-)
>     +
>     +diff --git a/tests/websocket-test.c b/tests/websocket-test.c
>     +index 6a48c1f9..723f2857 100644
>     +--- a/tests/websocket-test.c
>     ++++ b/tests/websocket-test.c
>     +@@ -1508,8 +1508,9 @@ test_receive_invalid_encode_length_16 (Test
>     *test,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0GError *error =3D NULL;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0InvalidEncodeLengthTest context =3D { t=
est, NULL };
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0guint i;
>     ++=C2=A0 =C2=A0 =C2=A0 guint error_id;
>     +
>     +-=C2=A0 =C2=A0 =C2=A0 g_signal_connect (test->client, "error", G_C=
ALLBACK
>     (on_error_copy), &error);
>     ++=C2=A0 =C2=A0 =C2=A0 error_id =3D g_signal_connect (test->client,=
 "error",
>     G_CALLBACK (on_error_copy), &error);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0g_signal_connect (test->client, "messag=
e", G_CALLBACK
>     (on_binary_message), &received);
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* We use 126(~) as payload length with=
 125 extended length */
>     +@@ -1522,6 +1523,7 @@ test_receive_invalid_encode_length_16 (Test
>     *test,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0WAIT_UNTIL (error !=3D NULL || received=
 !=3D NULL);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_error (error, SOUP_WEBSOCKET_E=
RROR,
>     SOUP_WEBSOCKET_CLOSE_PROTOCOL_ERROR);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0g_clear_error (&error);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_signal_handler_disconnect (test->cl=
ient, error_id);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_null (received);
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0g_thread_join (thread);
>     +--
>     +GitLab
>     +
>     diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
>     <http://libsoup_3.0.7.bb>
>     b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
>     <http://libsoup_3.0.7.bb>
>     index 59cc4a1d0a..20578978d7 100644
>     --- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
>     <http://libsoup_3.0.7.bb>
>     +++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
>     <http://libsoup_3.0.7.bb>
>     @@ -11,7 +11,13 @@ DEPENDS =3D "glib-2.0 glib-2.0-native libxml2
>     sqlite3 libpsl nghttp2"
>
>     =C2=A0SHRT_VER =3D
>     "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
>
>     -SRC_URI =3D "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar=
.xz"
>     +SRC_URI =3D "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar=
.xz \
>     + file://CVE-2024-52530.patch \
>     + file://CVE-2024-52531-1.patch \
>     + file://CVE-2024-52531-2.patch \
>     + file://CVE-2024-52531-3.patch \
>     + file://CVE-2024-52532-1.patch \
>     + file://CVE-2024-52532-2.patch"
>     =C2=A0SRC_URI[sha256sum] =3D
>     "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
>
>     =C2=A0PROVIDES =3D "libsoup-3.0"
>     --=20
>     2.25.1
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207932):https://lists.openembedded.org/g/openembedd=
ed-core/message/207932
> Mute This Topic:https://lists.openembedded.org/mt/109803977/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
changqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------EphH0Fs0FFhKQ6TtC0sTw4Va
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AS0Y4IC029517

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 11/27/24 22:16, Vijay Anusuri via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CANQUz19Q57qGrzCSYc31vs0ng1P2gn=
RqGvJQBvW=3DU-tLpZ6m6g@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500 1pt;padding:2pt;background:#fcfc=
03"><strong><class=3D"msonormal" style=3D"line-height:11pt"><span style=3D=
"font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div dir=3D"ltr">
          <div>
            <div>
              <div>Hi Changqing Li,<br>
                <br>
              </div>
              Fixes for CVE-2024-52530 and CVE-2024-52532 already
              submitted and landed in kirkstone-nut.<br>
              <br>
              <a href=3D"https://git.openembedded.org/openembedded-core-c=
ontrib/commit/?h=3Dstable/kirkstone-nut&amp;id=3D5c96ff64b5c29e589d776d23=
dbbed64ad526a997" moz-do-not-send=3D"true">https://git.openembedded.org/o=
penembedded-core-contrib/commit/?h=3Dstable/kirkstone-nut&amp;id=3D5c96ff=
64b5c29e589d776d23dbbed64ad526a997</a><br>
              <br>
            </div>
            Could you please send a v2 patch for CVE-2024-52531.<br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Got it, Thanks, V2 coming<br>
    </p>
    <p>Changqing<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CANQUz19Q57qGrzCSYc31vs0ng1P2gn=
RqGvJQBvW=3DU-tLpZ6m6g@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div>
            <br>
          </div>
          <div>Thanks &amp; Regards,</div>
          <div>Vijay<br>
          </div>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 27, 2024 at
            2:42=E2=80=AFPM Changqing Li via
            <a href=3D"http://lists.openembedded.org" moz-do-not-send=3D"=
true">lists.openembedded.org</a> &lt;<a href=3D"http://changqing.li" moz-=
do-not-send=3D"true">changqing.li</a>=3D<a href=3D"mailto:windriver.com@l=
ists.openembedded.org" moz-do-not-send=3D"true" class=3D"moz-txt-link-fre=
etext">windriver.com@lists.openembedded.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriv=
er.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-=
freetext">changqing.li@windriver.com</a>&gt;<br>
            <br>
            CVE-2024-52532:<br>
            GNOME libsoup before 3.6.1 has an infinite loop, and memory
            consumption.<br>
            during the reading of certain patterns of WebSocket data
            from clients.<br>
            <br>
            Refer:<br>
            <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2024-52532" r=
el=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">https://nvd.nist.gov/vuln/detail/CVE-2024-52532</a><b=
r>
            <br>
            CVE-2024-52531:<br>
            GNOME libsoup before 3.6.1 allows a buffer overflow in
            applications that<br>
            perform conversion to UTF-8 in
            soup_header_parse_param_list_strict.<br>
            Input received over the network cannot trigger this.<br>
            <br>
            Refer:<br>
            <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2024-52531" r=
el=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">https://nvd.nist.gov/vuln/detail/CVE-2024-52531</a><b=
r>
            <br>
            CVE-2024-52530:<br>
            GNOME libsoup before 3.6.0 allows HTTP request smuggling in
            some<br>
            configurations because '\0' characters at the end of header
            names are<br>
            ignored, i.e., a &quot;Transfer-Encoding\0: chunked&quot; hea=
der is
            treated the<br>
            same as a &quot;Transfer-Encoding: chunked&quot; header.<br>
            <br>
            Refer:<br>
            <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2024-52530" r=
el=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">https://nvd.nist.gov/vuln/detail/CVE-2024-52530</a><b=
r>
            <br>
            Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.l=
i@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-=
txt-link-freetext">changqing.li@windriver.com</a>&gt;<br>
            ---<br>
            &nbsp;.../libsoup-3.0.7/CVE-2024-52530.patch&nbsp; &nbsp; &nb=
sp; &nbsp; | 150
            ++++++++++++++++++<br>
            &nbsp;.../libsoup-3.0.7/CVE-2024-52531-1.patch&nbsp; &nbsp; &=
nbsp; | 116
            ++++++++++++++<br>
            &nbsp;.../libsoup-3.0.7/CVE-2024-52531-2.patch&nbsp; &nbsp; &=
nbsp; |&nbsp; 40 +++++<br>
            &nbsp;.../libsoup-3.0.7/CVE-2024-52531-3.patch&nbsp; &nbsp; &=
nbsp; | 136
            ++++++++++++++++<br>
            &nbsp;.../libsoup-3.0.7/CVE-2024-52532-1.patch&nbsp; &nbsp; &=
nbsp; |&nbsp; 75
            +++++++++<br>
            &nbsp;.../libsoup-3.0.7/CVE-2024-52532-2.patch&nbsp; &nbsp; &=
nbsp; |&nbsp; 46 ++++++<br>
            &nbsp;meta/recipes-support/libsoup/<a href=3D"http://libsoup_=
3.0.7.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">l=
ibsoup_3.0.7.bb</a>
            |&nbsp; &nbsp;8 +-<br>
            &nbsp;7 files changed, 570 insertions(+), 1 deletion(-)<br>
            &nbsp;create mode 100644
            meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52530.pat=
ch<br>
            &nbsp;create mode 100644
            meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-1.p=
atch<br>
            &nbsp;create mode 100644
            meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-2.p=
atch<br>
            &nbsp;create mode 100644
            meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-3.p=
atch<br>
            &nbsp;create mode 100644
            meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-1.p=
atch<br>
            &nbsp;create mode 100644
            meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-2.p=
atch<br>
            <br>
            diff --git
            a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52530.p=
atch
b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52530.patch<br>
            new file mode 100644<br>
            index 0000000000..fb6d5c3c6f<br>
            --- /dev/null<br>
            +++
            b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52530.p=
atch<br>
            @@ -0,0 +1,150 @@<br>
            +From 04df03bc092ac20607f3e150936624d4f536e68b Mon Sep 17
            00:00:00 2001<br>
            +From: Patrick Griffis &lt;<a href=3D"mailto:pgriffis@igalia.=
com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-fre=
etext">pgriffis@igalia.com</a>&gt;<br>
            +Date: Mon, 8 Jul 2024 12:33:15 -0500<br>
            +Subject: [PATCH] headers: Strictly don't allow NUL bytes<br>
            +<br>
            +In the past (2015) this was allowed for some problematic
            sites. However Chromium also does not allow NUL bytes in
            either header names or values these days. So this should no
            longer be a problem.<br>
            +<br>
            +CVE: CVE-2024-52530<br>
            +Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.o=
rg/GNOME/libsoup/-/commit/04df03bc092ac20607f3e150936624d4f536e68b" rel=3D=
"noreferrer" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-=
link-freetext">https://gitlab.gnome.org/GNOME/libsoup/-/commit/04df03bc09=
2ac20607f3e150936624d4f536e68b</a>]<br>
            +<br>
            +Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.=
li@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">changqing.li@windriver.com</a>&gt;<br>
            +---<br>
            + libsoup/soup-headers.c&nbsp; &nbsp; &nbsp; | 15 +++------<b=
r>
            + tests/header-parsing-test.c | 62
            +++++++++++++++++--------------------<br>
            + 2 files changed, 32 insertions(+), 45 deletions(-)<br>
            +<br>
            +diff --git a/libsoup/soup-headers.c
            b/libsoup/soup-headers.c<br>
            +index a0cf351ac..f30ee467a 100644<br>
            +--- a/libsoup/soup-headers.c<br>
            ++++ b/libsoup/soup-headers.c<br>
            +@@ -51,13 +51,14 @@ soup_headers_parse (const char *str,
            int len, SoupMessageHeaders *dest)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; * ignorable trailing whitespace.=
<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; */<br>
            + <br>
            ++&nbsp; &nbsp; &nbsp; /* No '\0's are allowed */<br>
            ++&nbsp; &nbsp; &nbsp; if (memchr (str, '\0', len))<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return FAL=
SE;<br>
            ++<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;/* Skip over the Request-Line / S=
tatus-Line */<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;headers_start =3D memchr (str, '\=
n', len);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;if (!headers_start)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;retur=
n FALSE;<br>
            +-&nbsp; &nbsp; &nbsp; /* No '\0's in the Request-Line / Stat=
us-Line */<br>
            +-&nbsp; &nbsp; &nbsp; if (memchr (str, '\0', headers_start -=
 str))<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return FAL=
SE;<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp;/* We work on a copy of the heade=
rs, which we can
            write '\0's<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; * into, so that we don't have to=
 individually
            g_strndup and<br>
            +@@ -69,14 +70,6 @@ soup_headers_parse (const char *str, int
            len, SoupMessageHeaders *dest)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;headers_copy[copy_len] =3D '\0';<=
br>
            +&nbsp; &nbsp; &nbsp; &nbsp;value_end =3D headers_copy;<br>
            + <br>
            +-&nbsp; &nbsp; &nbsp; /* There shouldn't be any '\0's in the=
 headers
            already, but<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp;* this is the web we're talking =
about.<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp;*/<br>
            +-&nbsp; &nbsp; &nbsp; while ((p =3D memchr (headers_copy, '\=
0', copy_len)))
            {<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; memmove (p=
, p + 1, copy_len - (p -
            headers_copy));<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; copy_len--=
;<br>
            +-&nbsp; &nbsp; &nbsp; }<br>
            +-<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;while (*(value_end + 1)) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;name =
=3D value_end + 1;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;name_=
end =3D strchr (name, ':');<br>
            +diff --git a/tests/header-parsing-test.c
            b/tests/header-parsing-test.c<br>
            +index edf8eebb3..715c2c6f2 100644<br>
            +--- a/tests/header-parsing-test.c<br>
            ++++ b/tests/header-parsing-test.c<br>
            +@@ -358,24 +358,6 @@ static struct RequestTest {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;},<br>
            + <br>
            +-&nbsp; &nbsp; &nbsp; { &quot;NUL in header name&quot;, &quo=
t;760832&quot;,<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &quot;GET / HTTP/1.1\r\nHost\x0=
0: <a href=3D"http://example.com" rel=3D"noreferrer" target=3D"_blank" mo=
z-do-not-send=3D"true">
              example.com</a>\r\n&quot;, 36,<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; SOUP_STATUS_OK,<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &quot;GET&quot;, &quot;/&quot;,=
 SOUP_HTTP_1_1,<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; { { &quot;Host&quot;, &quot;<a =
href=3D"http://example.com" rel=3D"noreferrer" target=3D"_blank" moz-do-n=
ot-send=3D"true">example.com</a>&quot;
            },<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; { NULL }<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; }<br>
            +-&nbsp; &nbsp; &nbsp; },<br>
            +-<br>
            +-&nbsp; &nbsp; &nbsp; { &quot;NUL in header value&quot;, &qu=
ot;760832&quot;,<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &quot;GET / HTTP/1.1\r\nHost: e=
xample\x00&quot; &quot;com\r\n&quot;,
            35,<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; SOUP_STATUS_OK,<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &quot;GET&quot;, &quot;/&quot;,=
 SOUP_HTTP_1_1,<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; { { &quot;Host&quot;, &quot;exa=
mplecom&quot; },<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; { NULL }<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; }<br>
            +-&nbsp; &nbsp; &nbsp; },<br>
            +-<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;/************************/<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;/*** INVALID REQUESTS ***/<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;/************************/<br>
            +@@ -448,6 +430,21 @@ static struct RequestTest {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;SOUP_STATUS_EXPECTATION_FA=
ILED,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NULL, NULL, -1,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ { NULL } }<br>
            ++&nbsp; &nbsp; &nbsp; },<br>
            ++<br>
            ++&nbsp; &nbsp; &nbsp; // <a href=3D"https://gitlab.gnome.org=
/GNOME/libsoup/-/issues/377" rel=3D"noreferrer" target=3D"_blank" moz-do-=
not-send=3D"true" class=3D"moz-txt-link-freetext">
              https://gitlab.gnome.org/GNOME/libsoup/-/issues/377</a><br>
            ++&nbsp; &nbsp; &nbsp; { &quot;NUL in header name&quot;, NULL=
,<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &quot;GET / HTTP/1.1\r\nHost\x0=
0: <a href=3D"http://example.com" rel=3D"noreferrer" target=3D"_blank" mo=
z-do-not-send=3D"true">
              example.com</a>\r\n&quot;, 36,<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; SOUP_STATUS_BAD_REQUEST,<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; NULL, NULL, -1,<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; { { NULL } }<br>
            ++&nbsp; &nbsp; &nbsp; },<br>
            ++<br>
            ++&nbsp; &nbsp; &nbsp; { &quot;NUL in header value&quot;, NUL=
L,<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &quot;HTTP/1.1 200 OK\r\nFoo: b=
\x00&quot; &quot;ar\r\n&quot;, 28,<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; SOUP_STATUS_BAD_REQUEST,<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NULL, NULL, -1,<br=
>
            ++&nbsp; &nbsp; &nbsp; &nbsp; { { NULL } }<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;}<br>
            + };<br>
            + static const int num_reqtests =3D G_N_ELEMENTS (reqtests);<=
br>
            +@@ -620,22 +617,6 @@ static struct ResponseTest {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ NULL } }<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;},<br>
            + <br>
            +-&nbsp; &nbsp; &nbsp; { &quot;NUL in header name&quot;, &quo=
t;760832&quot;,<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &quot;HTTP/1.1 200 OK\r\nF\x00o=
o: bar\r\n&quot;, 28,<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; SOUP_HTTP_1_1, SOUP_STATUS_OK, =
&quot;OK&quot;,<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; { { &quot;Foo&quot;, &quot;bar&=
quot; },<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; { NULL }<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; }<br>
            +-&nbsp; &nbsp; &nbsp; },<br>
            +-<br>
            +-&nbsp; &nbsp; &nbsp; { &quot;NUL in header value&quot;, &qu=
ot;760832&quot;,<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &quot;HTTP/1.1 200 OK\r\nFoo: b=
\x00&quot; &quot;ar\r\n&quot;, 28,<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; SOUP_HTTP_1_1, SOUP_STATUS_OK, =
&quot;OK&quot;,<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; { { &quot;Foo&quot;, &quot;bar&=
quot; },<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; { NULL }<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; }<br>
            +-&nbsp; &nbsp; &nbsp; },<br>
            +-<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;/********************************=
/<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;/*** VALID CONTINUE RESPONSES ***=
/<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;/********************************=
/<br>
            +@@ -768,6 +749,19 @@ static struct ResponseTest {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ { NULL }<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;},<br>
            ++<br>
            ++&nbsp; &nbsp; &nbsp; // <a href=3D"https://gitlab.gnome.org=
/GNOME/libsoup/-/issues/377" rel=3D"noreferrer" target=3D"_blank" moz-do-=
not-send=3D"true" class=3D"moz-txt-link-freetext">
              https://gitlab.gnome.org/GNOME/libsoup/-/issues/377</a><br>
            ++&nbsp; &nbsp; &nbsp; { &quot;NUL in header name&quot;, NULL=
,<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &quot;HTTP/1.1 200 OK\r\nF\x00o=
o: bar\r\n&quot;, 28,<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; -1, 0, NULL,<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; { { NULL } }<br>
            ++&nbsp; &nbsp; &nbsp; },<br>
            ++<br>
            ++&nbsp; &nbsp; &nbsp; { &quot;NUL in header value&quot;, &qu=
ot;760832&quot;,<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &quot;HTTP/1.1 200 OK\r\nFoo: b=
\x00&quot; &quot;ar\r\n&quot;, 28,<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; -1, 0, NULL,<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; { { NULL } }<br>
            ++&nbsp; &nbsp; &nbsp; },<br>
            + };<br>
            + static const int num_resptests =3D G_N_ELEMENTS (resptests)=
;<br>
            + <br>
            +-- <br>
            +GitLab<br>
            +<br>
            diff --git
            a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-1=
.patch
b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-1.patch<br>
            new file mode 100644<br>
            index 0000000000..c8e855c128<br>
            --- /dev/null<br>
            +++
            b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-1=
.patch<br>
            @@ -0,0 +1,116 @@<br>
            +From 4ec9e3d286b6d3e982cb0fc3564dee0bf8d87ede Mon Sep 17
            00:00:00 2001<br>
            +From: Patrick Griffis &lt;<a href=3D"mailto:pgriffis@igalia.=
com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-fre=
etext">pgriffis@igalia.com</a>&gt;<br>
            +Date: Tue, 27 Aug 2024 12:18:58 -0500<br>
            +Subject: [PATCH] fuzzing: Cover
            soup_header_parse_param_list<br>
            +<br>
            +CVE: CVE-2024-52531<br>
            +Upstream-Status: Backport<br>
            +[<a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/merge_r=
equests/407/diffs?commit_id=3D4ec9e3d286b6d3e982cb0fc3564dee0bf8d87ede" r=
el=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">https://gitlab.gnome.org/GNOME/libsoup/-/merge_reques=
ts/407/diffs?commit_id=3D4ec9e3d286b6d3e982cb0fc3564dee0bf8d87ede</a>]<br=
>
            +<br>
            +Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.=
li@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">changqing.li@windriver.com</a>&gt;<br>
            +<br>
            +---<br>
            + fuzzing/fuzz.h&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;|&nbsp; 9 +++++++--<br>
            + fuzzing/fuzz_header_parsing.c&nbsp; &nbsp; | 19 +++++++++++=
++++++++<br>
            + fuzzing/fuzz_header_parsing.dict |&nbsp; 8 ++++++++<br>
            + fuzzing/meson.build&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; |&nbsp; 2 ++<br>
            + 4 files changed, 36 insertions(+), 2 deletions(-)<br>
            + create mode 100644 fuzzing/fuzz_header_parsing.c<br>
            + create mode 100644 fuzzing/fuzz_header_parsing.dict<br>
            +<br>
            +diff --git a/fuzzing/fuzz.h b/fuzzing/fuzz.h<br>
            +index 0d380285..f3bd28ee 100644<br>
            +--- a/fuzzing/fuzz.h<br>
            ++++ b/fuzzing/fuzz.h<br>
            +@@ -1,13 +1,14 @@<br>
            + #include &quot;libsoup/soup.h&quot;<br>
            + <br>
            + int LLVMFuzzerTestOneInput (const unsigned char *data,
            size_t size);<br>
            ++static int set_logger =3D 0;<br>
            + <br>
            + #ifdef FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION<br>
            + static GLogWriterOutput<br>
            + empty_logging_func (GLogLevelFlags log_level, const
            GLogField *fields,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;gsize n_fields, gpointer user_data)<br>
            + {<br>
            +-&nbsp; return G_LOG_WRITER_HANDLED;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; return G_LOG_WRITER_HANDLED;<br=
>
            + }<br>
            + #endif<br>
            + <br>
            +@@ -16,6 +17,10 @@ static void<br>
            + fuzz_set_logging_func (void)<br>
            + {<br>
            + #ifdef FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION<br>
            +-&nbsp; g_log_set_writer_func (empty_logging_func, NULL, NUL=
L);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; if (!set_logger)<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; {<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; set=
_logger =3D 1;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; g_l=
og_set_writer_func (empty_logging_func,
            NULL, NULL);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; }<br>
            + #endif<br>
            + }<br>
            +diff --git a/fuzzing/fuzz_header_parsing.c
            b/fuzzing/fuzz_header_parsing.c<br>
            +new file mode 100644<br>
            +index 00000000..a8e5c1f9<br>
            +--- /dev/null<br>
            ++++ b/fuzzing/fuzz_header_parsing.c<br>
            +@@ -0,0 +1,19 @@<br>
            ++#include &quot;fuzz.h&quot;<br>
            ++<br>
            ++int<br>
            ++LLVMFuzzerTestOneInput (const unsigned char *data, size_t
            size)<br>
            ++{<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; GHashTable *elements;<br>
            ++<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; // We only accept NUL terminate=
d strings<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; if (!size || data[size - 1] !=3D=
 '\0')<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret=
urn 0;<br>
            ++<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; fuzz_set_logging_func ();<br>
            ++<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; elements =3D
            soup_header_parse_param_list((char*)data);<br>
            ++<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; g_hash_table_unref(elements);<b=
r>
            ++<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; return 0;<br>
            ++}<br>
            +\ No newline at end of file<br>
            +diff --git a/fuzzing/fuzz_header_parsing.dict
            b/fuzzing/fuzz_header_parsing.dict<br>
            +new file mode 100644<br>
            +index 00000000..1562ca3a<br>
            +--- /dev/null<br>
            ++++ b/fuzzing/fuzz_header_parsing.dict<br>
            +@@ -0,0 +1,8 @@<br>
            ++&quot;*=3DUTF-8''&quot;<br>
            ++&quot;*=3Diso-8859-1''&quot;<br>
            ++&quot;'&quot;<br>
            ++&quot;''&quot;<br>
            ++&quot;=3D&quot;<br>
            ++&quot;*=3D&quot;<br>
            ++&quot;&quot;&quot;<br>
            ++&quot;;&quot;<br>
            +\ No newline at end of file<br>
            +diff --git a/fuzzing/meson.build b/fuzzing/meson.build<br>
            +index b14cbb50..5dd0f417 100644<br>
            +--- a/fuzzing/meson.build<br>
            ++++ b/fuzzing/meson.build<br>
            +@@ -5,6 +5,7 @@ fuzz_targets =3D [<br>
            +&nbsp; &nbsp;'fuzz_cookie_parse',<br>
            +&nbsp; &nbsp;'fuzz_content_sniffer',<br>
            +&nbsp; &nbsp;'fuzz_date_time',<br>
            ++&nbsp; 'fuzz_header_parsing',<br>
            + ]<br>
            + <br>
            + fuzzing_args =3D '-fsanitize=3Dfuzzer,address,undefined'<br=
>
            +@@ -34,6 +35,7 @@ if have_fuzzing and
            (fuzzing_feature.enabled() or fuzzing_feature.auto())<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'-runs=3D200000',<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'-artifact_prefix=3Dmeson-=
logs/' + target + '-',<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'-print_final_stats=3D1',<=
br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; '-max_len=3D4096',<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;] + extra_args,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;env: [<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'ASAN_OPTIONS=3Dfast_unwin=
d_on_malloc=3D0',<br>
            +-- <br>
            +2.25.1<br>
            +<br>
            diff --git
            a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-2=
.patch
b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-2.patch<br>
            new file mode 100644<br>
            index 0000000000..7e0d81ba4c<br>
            --- /dev/null<br>
            +++
            b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-2=
.patch<br>
            @@ -0,0 +1,40 @@<br>
            +From 825fda3425546847b42ad5270544e9388ff349fe Mon Sep 17
            00:00:00 2001<br>
            +From: Patrick Griffis &lt;<a href=3D"mailto:pgriffis@igalia.=
com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-fre=
etext">pgriffis@igalia.com</a>&gt;<br>
            +Date: Tue, 27 Aug 2024 13:52:08 -0500<br>
            +Subject: [PATCH] tests: Add test for passing invalid UTF-8
            to<br>
            + soup_header_parse_semi_param_list()<br>
            +<br>
            +CVE: CVE-2024-52531<br>
            +Upstream-Status: Backport<br>
            +[<a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/merge_r=
equests/407/diffs?commit_id=3D825fda3425546847b42ad5270544e9388ff349fe" r=
el=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">https://gitlab.gnome.org/GNOME/libsoup/-/merge_reques=
ts/407/diffs?commit_id=3D825fda3425546847b42ad5270544e9388ff349fe</a>]<br=
>
            +<br>
            +Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.=
li@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">changqing.li@windriver.com</a>&gt;<br>
            +---<br>
            + tests/header-parsing-test.c | 11 +++++++++++<br>
            + 1 file changed, 11 insertions(+)<br>
            +<br>
            +diff --git a/tests/header-parsing-test.c
            b/tests/header-parsing-test.c<br>
            +index 715c2c6f..5e423d2b 100644<br>
            +--- a/tests/header-parsing-test.c<br>
            ++++ b/tests/header-parsing-test.c<br>
            +@@ -825,6 +825,17 @@ static struct ParamListTest {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ &quot;filename&qu=
ot;, &quot;t\xC3\xA9st.txt&quot; },<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;},<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;},<br>
            ++<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; /* This tests invalid UTF-8 dat=
a which *should*
            never be passed here but it was designed to be robust
            against it. */<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; { TRUE,<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&quot;invalid*=3D\x69\x27\x27\x93\x93\x93\x93\xff\x61\x61\x61\x61\x61\x61=
\x61\x62\x63\x64\x65\x0a;
filename*=3Diso-8859-1''\x69\x27\x27\x93\x93\x93\x93\xff\x61\x61\x61\x61\=
x61\x61\x61\x62\x63\x64\x65\x0a;
            foo&quot;,<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; { &quot;filename&quot;,
            &quot;i''\302\223\302\223\302\223\302\223\303\277aaaaaaabcde&=
quot; },<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; { &quot;invalid&quot;,
            &quot;\302\223\302\223\302\223\302\223\303\277aaaaaaabcde&quo=
t; },<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; { &quot;foo&quot;, NULL },<br>
            ++<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; },<=
br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; }<br>
            + };<br>
            + static const int num_paramlisttests =3D G_N_ELEMENTS
            (paramlisttests);<br>
            + <br>
            +-- <br>
            +2.25.1<br>
            +<br>
            diff --git
            a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-3=
.patch
b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-3.patch<br>
            new file mode 100644<br>
            index 0000000000..a47c8747c5<br>
            --- /dev/null<br>
            +++
            b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52531-3=
.patch<br>
            @@ -0,0 +1,136 @@<br>
            +From a35222dd0bfab2ac97c10e86b95f762456628283 Mon Sep 17
            00:00:00 2001<br>
            +From: Patrick Griffis &lt;<a href=3D"mailto:pgriffis@igalia.=
com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-fre=
etext">pgriffis@igalia.com</a>&gt;<br>
            +Date: Tue, 27 Aug 2024 13:53:26 -0500<br>
            +Subject: [PATCH] headers: Be more robust against invalid
            input when parsing<br>
            + params<br>
            +<br>
            +If you pass invalid input to a function such as
            soup_header_parse_param_list_strict()<br>
            +it can cause an overflow if it decodes the input to UTF-8.<b=
r>
            +<br>
            +This should never happen with valid UTF-8 input which
            libsoup's client API<br>
            +ensures, however it's server API does not currently.<br>
            +<br>
            +CVE: CVE-2024-52531<br>
            +Upstream-Status: Backport<br>
            +[<a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/merge_r=
equests/407/diffs?commit_id=3Da35222dd0bfab2ac97c10e86b95f762456628283" r=
el=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">https://gitlab.gnome.org/GNOME/libsoup/-/merge_reques=
ts/407/diffs?commit_id=3Da35222dd0bfab2ac97c10e86b95f762456628283</a>]<br=
>
            +<br>
            +Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.=
li@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">changqing.li@windriver.com</a>&gt;<br>
            +<br>
            +---<br>
            + libsoup/soup-headers.c | 46
            ++++++++++++++++++++++--------------------<br>
            + 1 file changed, 24 insertions(+), 22 deletions(-)<br>
            +<br>
            +diff --git a/libsoup/soup-headers.c
            b/libsoup/soup-headers.c<br>
            +index f30ee467..613e1905 100644<br>
            +--- a/libsoup/soup-headers.c<br>
            ++++ b/libsoup/soup-headers.c<br>
            +@@ -646,8 +646,9 @@ soup_header_contains (const char
            *header, const char *token)<br>
            + }<br>
            + <br>
            + static void<br>
            +-decode_quoted_string (char *quoted_string)<br>
            ++decode_quoted_string_inplace (GString *quoted_gstring)<br>
            + {<br>
            ++&nbsp; &nbsp; &nbsp; char *quoted_string =3D quoted_gstring=
-&gt;str;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;char *src, *dst;<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp;src =3D quoted_string + 1;<br>
            +@@ -661,10 +662,11 @@ decode_quoted_string (char
            *quoted_string)<br>
            + }<br>
            + <br>
            + static gboolean<br>
            +-decode_rfc5987 (char *encoded_string)<br>
            ++decode_rfc5987_inplace (GString *encoded_gstring)<br>
            + {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;char *q, *decoded;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;gboolean iso_8859_1 =3D FALSE;<br=
>
            ++&nbsp; &nbsp; &nbsp; const char *encoded_string =3D
            encoded_gstring-&gt;str;<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp;q =3D strchr (encoded_string, '\'=
');<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;if (!q)<br>
            +@@ -696,14 +698,7 @@ decode_rfc5987 (char *encoded_string)<b=
r>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;decod=
ed =3D utf8;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;}<br>
            + <br>
            +-&nbsp; &nbsp; &nbsp; /* If encoded_string was UTF-8, then e=
ach
            3-character %-escape<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp;* will be converted to a single =
byte, and so
            decoded is<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp;* shorter than encoded_string. I=
f encoded_string
            was<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp;* iso-8859-1, then each 3-charac=
ter %-escape will
            be<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp;* converted into at most 2 bytes=
 in UTF-8, and so
            it's still<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp;* shorter.<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp;*/<br>
            +-&nbsp; &nbsp; &nbsp; strcpy (encoded_string, decoded);<br>
            ++&nbsp; &nbsp; &nbsp; g_string_assign (encoded_gstring, deco=
ded);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;g_free (decoded);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;return TRUE;<br>
            + }<br>
            +@@ -713,15 +708,17 @@ parse_param_list (const char *header,
            char delim, gboolean strict)<br>
            + {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;GHashTable *params;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;GSList *list, *iter;<br>
            +-&nbsp; &nbsp; &nbsp; char *item, *eq, *name_end, *value;<br=
>
            +-&nbsp; &nbsp; &nbsp; gboolean override, duplicated;<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp;params =3D g_hash_table_new_full =
(soup_str_case_hash,
            <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;soup_str_case_equal,<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 g_free, NULL);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 g_free, g_free);<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp;list =3D parse_list (header, deli=
m);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;for (iter =3D list; iter; iter =3D=
 iter-&gt;next) {<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; char *item=
, *eq, *name_end;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; gboolean o=
verride, duplicated;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; GString *p=
arsed_value =3D NULL;<br>
            ++<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;item =
=3D iter-&gt;data;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;overr=
ide =3D FALSE;<br>
            + <br>
            +@@ -736,19 +733,19 @@ parse_param_list (const char *header,
            char delim, gboolean strict)<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;*name_end =3D '\0';<br>
            + <br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; value =3D (char *)skip_lws (eq + 1);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; parsed_value =3D g_string_new ((char
            *)skip_lws (eq + 1));<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;if (name_end[-1] =3D=3D '*' &amp;&amp;
            name_end &gt; item + 1) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;name_end[-1] =3D '\0';=
<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (!decode_rfc5987 (value)=
)
            {<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (!decode_rfc5987_inplace
            (parsed_value)) {<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 g_string_free
            (parsed_value, TRUE);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;g_free (item);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;continue;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;override =3D TRUE;<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; } else if (*value =3D=3D '&quot;')<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; decode_quoted_string
            (value);<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; } else<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; value =3D NULL;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; } else if (parsed_value-&gt;str[0]
            =3D=3D '&quot;')<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; decode_quoted_string_inplac=
e
            (parsed_value);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dupli=
cated =3D g_hash_table_lookup_extended
            (params, item, NULL, NULL);<br>
            + <br>
            +@@ -756,11 +753,16 @@ parse_param_list (const char *header,
            char delim, gboolean strict)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;soup_header_free_param_list
            (params);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;params =3D NULL;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;g_slist_foreach (iter,
            (GFunc)g_free, NULL);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; if (parsed_value)<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; g_string_free (parsed_value=
,
            TRUE);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;break;<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; } else if =
(override || !duplicated)<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; g_hash_table_replace (params, item,
            value);<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; else<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; } else if =
(override || !duplicated) {<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; g_hash_table_replace (params, item,
            parsed_value ? g_string_free (parsed_value, FALSE) : NULL);<b=
r>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; } else {<b=
r>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; if (parsed_value)<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; g_string_free (parsed_value=
,
            TRUE);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;g_free (item);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;}<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp;g_slist_free (list);<br>
            +-- <br>
            +2.25.1<br>
            +<br>
            diff --git
            a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-1=
.patch
b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-1.patch<br>
            new file mode 100644<br>
            index 0000000000..9afa1bb6bb<br>
            --- /dev/null<br>
            +++
            b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-1=
.patch<br>
            @@ -0,0 +1,75 @@<br>
            +From 6adc0e3eb74c257ed4e2a23eb4b2774fdb0d67be Mon Sep 17
            00:00:00 2001<br>
            +From: Ignacio Casal Quinteiro &lt;<a href=3D"mailto:qignacio=
@amazon.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-=
link-freetext">qignacio@amazon.com</a>&gt;<br>
            +Date: Wed, 11 Sep 2024 11:52:11 +0200<br>
            +Subject: [PATCH 1/2] websocket: process the frame as soon
            as we read data<br>
            +<br>
            +Otherwise we can enter in a read loop because we were not<br=
>
            +validating the data until the all the data was read.<br>
            +<br>
            +Fixes #391<br>
            +<br>
            +CVE: CVE-2024-52532<br>
            +Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.o=
rg/GNOME/libsoup/-/merge_requests/410/diffs?commit_id=3D6adc0e3eb74c257ed=
4e2a23eb4b2774fdb0d67be" rel=3D"noreferrer" target=3D"_blank" moz-do-not-=
send=3D"true" class=3D"moz-txt-link-freetext">https://gitlab.gnome.org/GN=
OME/libsoup/-/merge_requests/410/diffs?commit_id=3D6adc0e3eb74c257ed4e2a2=
3eb4b2774fdb0d67be</a>]<br>
            +Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.=
li@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">changqing.li@windriver.com</a>&gt;<br>
            +---<br>
            + libsoup/websocket/soup-websocket-connection.c | 4 ++--<br>
            + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
            +<br>
            +diff --git a/libsoup/websocket/soup-websocket-connection.c
            b/libsoup/websocket/soup-websocket-connection.c<br>
            +index a1a730473..a14481340 100644<br>
            +--- a/libsoup/websocket/soup-websocket-connection.c<br>
            ++++ b/libsoup/websocket/soup-websocket-connection.c<br>
            +@@ -1199,9 +1199,9 @@ soup_websocket_connection_read
            (SoupWebsocketConnection *self)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;priv-=
&gt;incoming-&gt;len =3D len + count;<br>
            +-&nbsp; &nbsp; &nbsp; } while (count &gt; 0);<br>
            + <br>
            +-&nbsp; &nbsp; &nbsp; process_incoming (self);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; process_in=
coming (self);<br>
            ++&nbsp; &nbsp; &nbsp; } while (count &gt; 0 &amp;&amp;
            !priv-&gt;close_sent &amp;&amp; !priv-&gt;io_closing);<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp;if (end) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!=
priv-&gt;close_sent ||
            !priv-&gt;close_received) {<br>
            +-- <br>
            +GitLab<br>
            +<br>
            +<br>
            +From 29b96fab2512666d7241e46c98cc45b60b795c0c Mon Sep 17
            00:00:00 2001<br>
            +From: Ignacio Casal Quinteiro &lt;<a href=3D"mailto:qignacio=
@amazon.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-=
link-freetext">qignacio@amazon.com</a>&gt;<br>
            +Date: Wed, 2 Oct 2024 11:17:19 +0200<br>
            +Subject: [PATCH 2/2] websocket-test: disconnect error copy
            after the test ends<br>
            +<br>
            +Otherwise the server will have already sent a few more
            wrong<br>
            +bytes and the client will continue getting errors to copy<br=
>
            +but the error is already !=3D NULL and it will assert<br>
            +---<br>
            + tests/websocket-test.c | 4 +++-<br>
            + 1 file changed, 3 insertions(+), 1 deletion(-)<br>
            +<br>
            +diff --git a/tests/websocket-test.c
            b/tests/websocket-test.c<br>
            +index 06c443bb5..6a48c1f9b 100644<br>
            +--- a/tests/websocket-test.c<br>
            ++++ b/tests/websocket-test.c<br>
            +@@ -1539,8 +1539,9 @@ test_receive_invalid_encode_length_64
            (Test *test,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;GError *error =3D NULL;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;InvalidEncodeLengthTest context =3D=
 { test, NULL };<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;guint i;<br>
            ++&nbsp; &nbsp; &nbsp; guint error_id;<br>
            + <br>
            +-&nbsp; &nbsp; &nbsp; g_signal_connect (test-&gt;client, &qu=
ot;error&quot;,
            G_CALLBACK (on_error_copy), &amp;error);<br>
            ++&nbsp; &nbsp; &nbsp; error_id =3D g_signal_connect (test-&g=
t;client,
            &quot;error&quot;, G_CALLBACK (on_error_copy), &amp;error);<b=
r>
            +&nbsp; &nbsp; &nbsp; &nbsp;g_signal_connect (test-&gt;client=
, &quot;message&quot;,
            G_CALLBACK (on_binary_message), &amp;received);<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp;/* We use 127(\x7f) as payload le=
ngth with 65535
            extended length */<br>
            +@@ -1553,6 +1554,7 @@ test_receive_invalid_encode_length_64
            (Test *test,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;WAIT_UNTIL (error !=3D NULL || re=
ceived !=3D NULL);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;g_assert_error (error, SOUP_WEBSO=
CKET_ERROR,
            SOUP_WEBSOCKET_CLOSE_PROTOCOL_ERROR);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;g_clear_error (&amp;error);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; g_signal_handler_disconnect (te=
st-&gt;client,
            error_id);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;g_assert_null (received);<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;g_thread_join (thread);<br=
>
            +-- <br>
            +GitLab<br>
            +<br>
            diff --git
            a/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-2=
.patch
b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-2.patch<br>
            new file mode 100644<br>
            index 0000000000..6ae7845814<br>
            --- /dev/null<br>
            +++
            b/meta/recipes-support/libsoup/libsoup-3.0.7/CVE-2024-52532-2=
.patch<br>
            @@ -0,0 +1,46 @@<br>
            +From 4c9e75c6676a37b6485620c332e568e1a3f530ff Mon Sep 17
            00:00:00 2001<br>
            +From: Simon McVittie &lt;<a href=3D"mailto:smcv@debian.org" =
target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext=
">smcv@debian.org</a>&gt;<br>
            +Date: Wed, 13 Nov 2024 14:14:23 +0000<br>
            +Subject: [PATCH] websocket-test: Disconnect error signal in
            another place<br>
            +<br>
            +This is the same change as commit 29b96fab &quot;websocket-t=
est:
            disconnect<br>
            +error copy after the test ends&quot;, and is done for the sa=
me
            reason, but<br>
            +replicating it into a different function.<br>
            +<br>
            +Fixes: 6adc0e3e &quot;websocket: process the frame as soon a=
s we
            read data&quot;<br>
            +Resolves: <a href=3D"https://gitlab.gnome.org/GNOME/libsoup/=
-/issues/399" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e" class=3D"moz-txt-link-freetext">
              https://gitlab.gnome.org/GNOME/libsoup/-/issues/399</a><br>
            +Signed-off-by: Simon McVittie &lt;<a href=3D"mailto:smcv@deb=
ian.org" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link=
-freetext">smcv@debian.org</a>&gt;<br>
            +<br>
            +CVE: CVE-2024-52532<br>
            +Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.o=
rg/GNOME/libsoup/-/merge_requests/410/diffs?commit_id=3D29b96fab2512666d7=
241e46c98cc45b60b795c0c" rel=3D"noreferrer" target=3D"_blank" moz-do-not-=
send=3D"true" class=3D"moz-txt-link-freetext">https://gitlab.gnome.org/GN=
OME/libsoup/-/merge_requests/410/diffs?commit_id=3D29b96fab2512666d7241e4=
6c98cc45b60b795c0c</a>]<br>
            +Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.=
li@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">changqing.li@windriver.com</a>&gt;<br>
            +---<br>
            + tests/websocket-test.c | 4 +++-<br>
            + 1 file changed, 3 insertions(+), 1 deletion(-)<br>
            +<br>
            +diff --git a/tests/websocket-test.c
            b/tests/websocket-test.c<br>
            +index 6a48c1f9..723f2857 100644<br>
            +--- a/tests/websocket-test.c<br>
            ++++ b/tests/websocket-test.c<br>
            +@@ -1508,8 +1508,9 @@ test_receive_invalid_encode_length_16
            (Test *test,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;GError *error =3D NULL;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;InvalidEncodeLengthTest context =3D=
 { test, NULL };<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;guint i;<br>
            ++&nbsp; &nbsp; &nbsp; guint error_id;<br>
            + <br>
            +-&nbsp; &nbsp; &nbsp; g_signal_connect (test-&gt;client, &qu=
ot;error&quot;,
            G_CALLBACK (on_error_copy), &amp;error);<br>
            ++&nbsp; &nbsp; &nbsp; error_id =3D g_signal_connect (test-&g=
t;client,
            &quot;error&quot;, G_CALLBACK (on_error_copy), &amp;error);<b=
r>
            +&nbsp; &nbsp; &nbsp; &nbsp;g_signal_connect (test-&gt;client=
, &quot;message&quot;,
            G_CALLBACK (on_binary_message), &amp;received);<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp;/* We use 126(~) as payload lengt=
h with 125 extended
            length */<br>
            +@@ -1522,6 +1523,7 @@ test_receive_invalid_encode_length_16
            (Test *test,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;WAIT_UNTIL (error !=3D NULL || re=
ceived !=3D NULL);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;g_assert_error (error, SOUP_WEBSO=
CKET_ERROR,
            SOUP_WEBSOCKET_CLOSE_PROTOCOL_ERROR);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;g_clear_error (&amp;error);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; g_signal_handler_disconnect (te=
st-&gt;client,
            error_id);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp;g_assert_null (received);<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp;g_thread_join (thread);<br>
            +-- <br>
            +GitLab<br>
            +<br>
            diff --git a/meta/recipes-support/libsoup/<a href=3D"http://l=
ibsoup_3.0.7.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"=
true">libsoup_3.0.7.bb</a>
            b/meta/recipes-support/libsoup/<a href=3D"http://libsoup_3.0.=
7.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">libso=
up_3.0.7.bb</a><br>
            index 59cc4a1d0a..20578978d7 100644<br>
            --- a/meta/recipes-support/libsoup/<a href=3D"http://libsoup_=
3.0.7.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">l=
ibsoup_3.0.7.bb</a><br>
            +++ b/meta/recipes-support/libsoup/<a href=3D"http://libsoup_=
3.0.7.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">l=
ibsoup_3.0.7.bb</a><br>
            @@ -11,7 +11,13 @@ DEPENDS =3D &quot;glib-2.0 glib-2.0-native
            libxml2 sqlite3 libpsl nghttp2&quot;<br>
            <br>
            &nbsp;SHRT_VER =3D
            <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:${@d.getVar=
('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}">&quot;${@d.getVar=
('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}&quot;</a><br>
            <br>
            -SRC_URI =3D
            &quot;${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.x=
z&quot;<br>
            +SRC_URI =3D
            &quot;${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.x=
z \<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class=3D"moz-txt=
-link-freetext" href=3D"file://CVE-2024-52530.patch">file://CVE-2024-5253=
0.patch</a> \<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class=3D"moz-txt=
-link-freetext" href=3D"file://CVE-2024-52531-1.patch">file://CVE-2024-52=
531-1.patch</a> \<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class=3D"moz-txt=
-link-freetext" href=3D"file://CVE-2024-52531-2.patch">file://CVE-2024-52=
531-2.patch</a> \<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class=3D"moz-txt=
-link-freetext" href=3D"file://CVE-2024-52531-3.patch">file://CVE-2024-52=
531-3.patch</a> \<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class=3D"moz-txt=
-link-freetext" href=3D"file://CVE-2024-52532-1.patch">file://CVE-2024-52=
532-1.patch</a> \<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class=3D"moz-txt=
-link-freetext" href=3D"file://CVE-2024-52532-2.patch">file://CVE-2024-52=
532-2.patch</a>&quot;<br>
            &nbsp;SRC_URI[sha256sum] =3D
            &quot;ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b939629726=
83e1bf7c8&quot;<br>
            <br>
            &nbsp;PROVIDES =3D &quot;libsoup-3.0&quot;<br>
            -- <br>
            2.25.1<br>
            <br>
            <br>
            <br>
            <br>
          </blockquote>
        </div>
      </div>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#207932): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/207932">https:/=
/lists.openembedded.org/g/openembedded-core/message/207932</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/109803977/3616873">https://lists.openembedded.org/mt=
/109803977/3616873</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------EphH0Fs0FFhKQ6TtC0sTw4Va--

