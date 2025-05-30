Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F164C5AD49
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 23:24:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1136.1748647470239370294
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 16:24:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=824517fc39=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UNK3p3024182
	for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 16:24:29 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46udmm6v27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 16:24:29 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54UNOSvd029509;
	Fri, 30 May 2025 16:24:28 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46udmm6v26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 16:24:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L2ALpLAuiTSZ+Z0WuMTDO0ptuE6PT1AFaW/VvGHEfamDiprpf8A364IMLJ7ZQAXjtr9nhqyPf3N9syFb/4emrkLoowo9V9naId8BueeO/PDRpmSutfe2pkMSP48nDhWihv453awnH4qRBA43z7CU3K6jxZ0SzOKRSY7klzx6s/5jupn49GbBZMcPHM+rH1NBnnHU9JdoUo62niwdJfjS9mvMbfePd9kgrAywFCkBTnFcIQc7mIyAUCZFlR7tbLcRJy0sPeu8VwOVKtJa2KkEYFQ6gMxbgU0iEz2TA4vXFns0mic1TUY6lm95fh5fARv759hiKgjDv/V3Jaq51AHcgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMl1R4GJDUFF5WPZ2LaT7expxDqgPpBYfPW7SxipIYU=;
 b=vhNBoJRNNT0YWLdXgCC+v1W9BOZ6j7KrCmN89RUSPfeFoD2uM/Ns1YMQh/UbQ9XmtRYhYvkDez0MMqmRuhjDrn1HppT/nqQSEPBNSkjUOqh1F+LkEPDj0Ixh0qUx6w6zzaWv7gfzi4C09mdJohXY9CwisSHbLv+1IrRQu7D2V3Z/dbjxD8vDFS/tEDkpG9CIlbPO3Vos1sBlxKY12sNljqIo2AkP8l4MeTJUYb2Tq90qhyvlVSiWjPONz9zHAQovoGQo96tJgn3BRQZfl+21PKn0SgtMb7E85JF4KDerQqPfTZQD4CPZ82gbJpQb4agj572hioh8tM8VERPhF9X92w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8505.namprd11.prod.outlook.com (2603:10b6:408:1b7::21)
 by SJ0PR11MB4941.namprd11.prod.outlook.com (2603:10b6:a03:2d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Fri, 30 May
 2025 23:24:25 +0000
Received: from LV3PR11MB8505.namprd11.prod.outlook.com
 ([fe80::e59d:2e70:4371:48cf]) by LV3PR11MB8505.namprd11.prod.outlook.com
 ([fe80::e59d:2e70:4371:48cf%3]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 23:24:25 +0000
Content-Type: multipart/alternative;
 boundary="------------cSwu4vsM2W7NE8y2tBsHVSFh"
Message-ID: <e4a1df5f-d11d-4fef-9f05-4060fad5f110@windriver.com>
Date: Fri, 30 May 2025 19:24:23 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] SDK magic file issue
To: tom.hochstein@oss.nxp.com,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: neenareddy.busireddy@nxp.com
References: <5019da94-791c-459a-87e5-3f94422bb079@oss.nxp.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <5019da94-791c-459a-87e5-3f94422bb079@oss.nxp.com>
X-ClientProxiedBy: DS7PR03CA0242.namprd03.prod.outlook.com
 (2603:10b6:5:3b3::7) To LV3PR11MB8505.namprd11.prod.outlook.com
 (2603:10b6:408:1b7::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8505:EE_|SJ0PR11MB4941:EE_
X-MS-Office365-Filtering-Correlation-Id: cf834cdf-fab1-431d-0037-08dd9fd11dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cnVZQk94eDNQS3VCU3JDZ051dGg3UXY1OE1ZdWlKaDRabS9VOVkvR2tyYzVG?=
 =?utf-8?B?SFllRzNMWHM1cVEwNU9vbGx6ckhLRGtkRzAxMzExbDhLdDM0RHFlTEFkTmFG?=
 =?utf-8?B?VVdJWjVBUUdEMXZXelBQRlRETUs2dzFhV0NWZklvSkR4Z1ZmbmcvWlJhZGdX?=
 =?utf-8?B?TUJHSnpobXc1K2JIL0NLRzRUOW1ZbG9xVDB4NXExRnZZb3JlakNDWFdoeHRx?=
 =?utf-8?B?Qy9hUG5hK2RsRU5wMHlFTzlXRWpvcFd2V2EwRW5mak9wWXRLLzhzcjF6dHZN?=
 =?utf-8?B?aWdQZ3NkS0pBVUZHb0IrZlU0aUdPWHNNc3c2OTNkL25BQTd0TkpLQ2xIUTBH?=
 =?utf-8?B?cWxHVUZUTlVkdjFHc2tkbzV1b3JUZGprckZ4NWRqc2d0Zkg1VVVRa1dwS25k?=
 =?utf-8?B?TTlRemgyUHZHeituSGJtTTVMbmgyR2VteHRITFNOU0I4UGlsYTFYL1FIZXFh?=
 =?utf-8?B?anBVbnkxcXQva01NeFhPWUNmOEdGdXFIM3RNYUIwRVYrR01vQnBvLzA1YUpk?=
 =?utf-8?B?Mi94TkpTL0pUb0J3UHNsZTZ4VEx4MGdNaTJabEhDNGhFaUFBanVrL0ZFZlhU?=
 =?utf-8?B?dEliT01uUEt2K3ZLNE5zTXhHVXBkKzJiT2VteEZRSllVNnNaV2c2cGNZalZr?=
 =?utf-8?B?QTRMc21hOTZaZjllS3oxeTRJd0hRck5IdHY3RXlwbEpxTE1nVjNmZHF4Wkln?=
 =?utf-8?B?ZjNET2diTUVkU0c5UTZFVGJVeExseExwdVVRYmJ1QzR3NlpNSDVQSUJqTUVn?=
 =?utf-8?B?K0pkVXo5MnVJTVdxV2JWUkppWFFtOVNwWTM1b2J3eFRmZ1c4VWdaMGhCMjhk?=
 =?utf-8?B?RTl6SkJWditVcHlTbXYyTWU1alN4ZURMNzVmN29Da0MyZHdudHFCZERZaTBD?=
 =?utf-8?B?NVdnK2NhVFZrZ3RxbkFubGhjNlBzZ2RFYkdydmhsS0J3UFM1bDJEdVhUNnI0?=
 =?utf-8?B?QnF5R2RBb3lOUWFIQ1Rqd1ltN21mcGMvTGxYS1I0aC93cXQ0NTYvMmNKSGhi?=
 =?utf-8?B?VDVORTVpTCtoZkhZdHI5UnRHeGZ4OVQ3bCtVT0hnNERrUTBYSm1FRW9jV2Vw?=
 =?utf-8?B?WXRETmtwVVhHRXRaZUtuM1paUmg0NmNUdkxDbXJNNmlPT2RXc0k5MGwyd0RL?=
 =?utf-8?B?bVJGM3QyRzZDbjl6bGtEdTFCMjNSRi9BVnltWGN5enFWMlpmNXRpYkdadFJv?=
 =?utf-8?B?U2p1N1U1d0FVbWJtdUR1S3FOOElrOWVvaDZLWmxjWTc3OXB1ak1GR1dLMGFz?=
 =?utf-8?B?RFBGTTFXR295MS9QcGpQZHpucWdMOVpzRG1pVFErQU5XUGNwVlI0YXBkVEc2?=
 =?utf-8?B?dUVVT3c4cnU1Q0tjRFJrcWN4eE5EYkZaVWxWQ0x1Rnk5L1pmNXpOTUZUckls?=
 =?utf-8?B?VTBjTTJTR012NVBXa0phaTdKUkM1TG92QmUxcUU1VkxMYml3MDZoSHg2L2sr?=
 =?utf-8?B?WTdTOFVQeTUwS2JaN1pZSmgrVktYNnZqY08vUFhXUjk5SS9zaFlrcURqcXFm?=
 =?utf-8?B?U0ZFTUF6Ym5VYUN1WldBYXZia2Zsc29pUWZ5Ym56RHd2ZzhhQ0JDN1QxWkhD?=
 =?utf-8?B?c2lBSitwR2Jka205Y25lNjM1aEpSeTNwOTViR21oTFJWZHpKN1N0ak8waWxt?=
 =?utf-8?B?RCtBWFpoNjlVY2FFeHpsNjdFdjhMNlFJaHBqNUpQcVo1S21aVlE4d29kZEpS?=
 =?utf-8?B?WWFQUDlNQTNodVkwYmRlNCs1ZmRyUWV2L2RvbmJHellTeGdVZlJvZjIrUERj?=
 =?utf-8?B?K013TWlBRmpIeFNtTWFNVWNFMlp1c0ZZMWNKVDFjdTNkNUE3a3FpZTY1Sjlk?=
 =?utf-8?B?dGQ5aCs3T1hsL1REZjdML25XQ3BIUktEdWhnNGh4WGthL0lCV1E3My9zRStS?=
 =?utf-8?Q?7b7P86yThiDES?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8505.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L1RtVVNmSlZaVWJjYXVsd3NnRFdhWk81NVZuRU02aGhBdGZ5ekEvSUlQSW9K?=
 =?utf-8?B?clBCQ3RRTFNJMFV6OW9MZ2MzOU1pblRXdU41ZERtVGpweEtxMVMvWVhkdC9U?=
 =?utf-8?B?aW96QWRzSkVDYlhPdWNwcU5oMk4xd2ZtYkJLYmVVb2JPS2xaMStuT01XNkU0?=
 =?utf-8?B?WTZudHRkR21sdEtjTm1YVkJXdWZCVVdyMlhHdFNZRW5YbUtjZzduK2tjVFcw?=
 =?utf-8?B?WG53clQ3RXFiYkJMS2E0djIzQ0lBdFB5N0FzTDNVcGdMVVJXYWhRc05sZXNU?=
 =?utf-8?B?Q0FVdHNxRHhzL2h2VU1TWlJKa01TdXJUQnluRWQrNytSS1o5Q2UxcHN5OGJ0?=
 =?utf-8?B?cEtEYWV5Z3RZZTFIc1Z0RUhhZzhhTmkyUVpGRFNFaUhPakVkcEo2V2JPM0li?=
 =?utf-8?B?WDBLRHdOV1VWczBteUpxcWhvUHZZbmZJYW15RXNlWldtRmFZcDlqclhFd1Zi?=
 =?utf-8?B?NkhYZkZwMXNZOUZXVWZDdmovbmZlS05GQnREeklIZG1ZZUNIKzlCQkdOR3Zi?=
 =?utf-8?B?MDhxZkJrNHIzc2xGNjQ0eloza3FoNWxwNC9QYlJCT05YMzZuNFdUNkovNnV0?=
 =?utf-8?B?ZU9nN29lalRMVDJ5MHhzc3pncXUvMVFXYVFsZXdhWk51aVphRzFQM01pMWQr?=
 =?utf-8?B?RXVOeklaTFRkcnFDZVBkaHNaZGE3U21LclNBOWxuREpRQ2VNSEpRTnZoVnFm?=
 =?utf-8?B?QUZFRXJoS0ZDNmdZbzVuRmp4UTVHazZoaTEzMEhmRHFiaHFOSzU4OXRDUnhK?=
 =?utf-8?B?bjR2UjFkZkF0ckZaSGd2ZzRWNWxoWUpZbk1OaHRTdytMS0Z2WTdMZXNaMzhR?=
 =?utf-8?B?YWY4TWxWQk1iam15UFBmcVA0RXMxeVBwSXdEQmlockFVN2pWSlQ5bVNwcEI1?=
 =?utf-8?B?amp5TjY1Rldsb1VvbnpCQTFjYVMzdWJlK0o2UzNxa2VSMUQ3NjFCZUJ1MEg5?=
 =?utf-8?B?cXFzTG82bkNOdUhFQlVBZ0NmRUlBWld2NHlhcVg3aEVCWnExNlNTM0dvZ2Yx?=
 =?utf-8?B?clAwR3laa3FwWkxSQkh2RDV0MFZ1cktlV1pDc0VScXRjdUNCbWdBamp4eWdG?=
 =?utf-8?B?eTFaWm1MSVpnRDlaMzhjMjh0dm4vd3NsNHBScjRhbTVuSVc3NlJIRlN2OG1X?=
 =?utf-8?B?alEzN016TnpsK0J5SHFYaHNIV1BvaVVXRXA0RTBVZzJzazJDUE9tRG01dnN0?=
 =?utf-8?B?MDl4L251YkVzamgzaXpIZkliS05aajB5d2RuMDVqcmMxdUwvM3Z2NkRkcGF6?=
 =?utf-8?B?Z3dkNmNXVkZ0YWo1emxjbmZuNGVGL1ZVaHhHdkxvYXRqeStqZy9rTFpGWkh5?=
 =?utf-8?B?TnM0bHM3QUx3WEQ4ZUJjS09DcG5wb2Jqa01tYm9KOHl1QWFBc0RQdkZXc2xE?=
 =?utf-8?B?N3dpT1VhQ0VVWGMvWlpKSmhCOVVWTUtBanVtR0EzUUpmblZ2Tmx0aG1QdGtE?=
 =?utf-8?B?UzRNZkMrNGdseXJHZFRSSzBJMkpxdXcxY0ZRV3dvMnRRSmtXd2JnKzZhd0l3?=
 =?utf-8?B?OUtOakZUcHdqNEdNMW0wQkgzZytlU3ZSN2JKbkpvVzB1MlhMRitONkZMTW9q?=
 =?utf-8?B?RUpjb09uR0ZMVi9NVC9WWHNvSEFmdFl5MWpFenBPN0FrREpaSThMQkxzZUtP?=
 =?utf-8?B?d3ZIUlUwTHo2L2RhdWJ5NENicTNDL0d4eWJHQ041RzR2T3RURmtMZy9NUUh4?=
 =?utf-8?B?V2UyZmN1SFRUV2pMOXVDdWF6ZUV1aUdUWWFhK29KQTUrbUFGQUlwNW0xYmRm?=
 =?utf-8?B?WnYzdUxWRlhCVUIxblVqRXZkMmNxZDBWSmQzN2xMUWh5MGt2bGt3UDkzRTRv?=
 =?utf-8?B?TmNOaUk5RTMwVFJLb0E4ZEE5ZUx1RzF4RURtRW1OZXBlVW5zWlkzVndobXpD?=
 =?utf-8?B?enBLMUdNcW14MGtnQmNnRmZJWmdzMjUrUkVuZGRFU1BmSnJDMkRMVWVWTHFX?=
 =?utf-8?B?YzZkaHBGUk15WUV1emxXYWM2L0xVMDhjKzdXRDMrdGttdEJLcEV4K2NKclYw?=
 =?utf-8?B?YnVxazRhd014NThHS05TemhCWDFPMWQwV1ZaL2JmV1ZWZUVsY3d1N3dwNDIr?=
 =?utf-8?B?L1NpeTlvVlc3RllBUDAwTGlqbk1iR2g3eVFRM0lramdjWXNySkZmZDA1VWpo?=
 =?utf-8?B?Q3FMSzBPaStONkVPa2JVOXArbWNnK3cxV3lqcEpjMjZ6UG1HYlMxbjVKVzRm?=
 =?utf-8?B?QWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf834cdf-fab1-431d-0037-08dd9fd11dd9
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8505.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 23:24:25.6244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STBS31hlkzoplNiMV3jmtOYbL5X8xxzfZ+Pbt4ve4svoviN+k35L8icTWAkVNVEUOk19ZyDCirZczO12NybLbDoApPfe0JkqJzWAnVPcnWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4941
X-Authority-Analysis: v=2.4 cv=WpErMcfv c=1 sm=1 tr=0 ts=683a3e2d cx=c_pps a=puZe5eoxGduuDGzu18ke6A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=7ypMOgA4AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=_MPfxbuHk9-cwn19yDoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=8AirrxEcAAAA:8 a=SSivmikL2EJsll3dQ7oA:9 a=LktWXY5ZVSeWGTnf:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=_RmYLEJ0N9D68yuZCUi5:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDIxMCBTYWx0ZWRfXzqhzQaqpSfYD zrbTdP12yXkdjpeRCuAhDT7b4dS+C9rLAkZ3F+D/y4hq3wt+VHCGTmYt5rawY/Cv7WggiSa05lZ J6Z+vZZh8znI/2VYHbOnAnwx+YWFUsrln0+7Io5PcfiZVNPv4FXYKKNfPAVAHTDxkX0hdA5hQkc
 6MM56lZhO3U3LluFd2I06JzUQk6iFdXZruz9qN7VrRN97xWPgFMrp89hMW3iIu0IoOMaQJgp3Xb qhpkhXPV7Uy9PD0lFwHcvw3YykZmUmbwadQuJd3QT1NWUucy1qkB2Z/CUsffEoNJJp/YddC0xZ7 PsPHxuwOcjgDkuNLsQRfVFVLgEWyvvpo/zgEpsQPxPE5Jik/gMSHU2SMQvAwwnMi8AJJMEFloAH
 TQnTo11gpnyPCs2IOkThMCLKJNAdTOQ8D8eWyq8MgHYdkpfVIKxp46GO/RrxHAKkRHga1qMA
X-Proofpoint-ORIG-GUID: Z5X78xCsFBLag0ln_P3T7HfQR4ZyJFNn
X-Proofpoint-GUID: OW-jp3nnvbBrI8pCmZs3-r9hK7sIS3l9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_10,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505300210
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 23:24:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217553

--------------cSwu4vsM2W7NE8y2tBsHVSFh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 54UNK3p3024182

On 2025-05-27 1:34 p.m., Tom Hochstein via lists.openembedded.org wrote:
> Hi All,
>
> We're having an issue doing an SDK build based on Walnascar. The log is
> filled with thousands of magic file warnings like the following:
>
> ```
> Building libteec.so
> =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src/tee_client_api.c
> /opt/fsl-imx-internal-xwayland/6.12-walnascar/sysroots/x86_64-pokysdk-l=
inux/usr/share/misc/magic.mgc,=20
> 1: Warning: offset `=1C=04=1E=EF=BF=BD=13' invalid
> /opt/fsl-imx-internal-xwayland/6.12-walnascar/sysroots/x86_64-pokysdk-l=
inux/usr/share/misc/magic.mgc,=20
> 2: Warning: offset `Version=3D' invalid
> /opt/fsl-imx-internal-xwayland/6.12-walnascar/sysroots/x86_64-pokysdk-l=
inux/usr/share/misc/magic.mgc,=20
> 3: Warning: offset `http://www.difstream.com' invalid
> /opt/fsl-imx-internal-xwayland/6.12-walnascar/sysroots/x86_64-pokysdk-l=
inux/usr/share/misc/magic.mgc,=20
> 7: Warning: offset `=11' invalid
> /opt/fsl-imx-internal-xwayland/6.12-walnascar/sysroots/x86_64-pokysdk-l=
inux/usr/share/misc/magic.mgc,=20
> 8: Warning: offset `Firmware v' invalid
> =C2=A0=C2=A0=C2=A0 %<--- S N I P ---%<
> /opt/fsl-imx-internal-xwayland/6.12-walnascar/sysroots/x86_64-pokysdk-l=
inux/usr/share/misc/magic.mgc,=20
> 4765: Warning: offset `' invalid
> /opt/fsl-imx-internal-xwayland/6.12-walnascar/sysroots/x86_64-pokysdk-l=
inux/usr/share/misc/magic.mgc,=20
> 4766: Warning: offset `' invalid
> file: File 5.45 supports only version 18 magic files.=20
> `/opt/fsl-imx-internal-xwayland/6.12-walnascar/sysroots/x86_64-pokysdk-=
linux/usr/share/misc/magic.mgc'=20
> is version 19 (No such file or directory)
> ```
>
> This seems to show the root of the problem is the build is using the
> file program 5.45 from the build machine, which does not match the 5.46
> magic file specified by the SDK. Indeed, we've worked around the proble=
m
> by downgrading the file recipe to 5.45.
>
> So, why is the build using the file program from the build machine? I
> tested the basics and can see that sourcing the SDK setup script does
> make the SDK file program the selected one.
>
> This is not easy to debug since I don't know where the file command
> invocation comes from. Perhaps 'strace' will help?
>
> I'm hoping someone might have an idea to help narrow this down. Thanks
> in advance.


Not off-hand.

Could you explain exactly how to reproduce the issue and maybe create a=20
YP Bugzilla defect?

../Randy


>
> Tom
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217318):https://lists.openembedded.org/g/openembedd=
ed-core/message/217318
> Mute This Topic:https://lists.openembedded.org/mt/113329951/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------cSwu4vsM2W7NE8y2tBsHVSFh
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 54UNK3p3024182

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-05-27 1:34 p.m., Tom Hochstein
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:5019da94-791c-459a-87e5-3f94422=
bb079@oss.nxp.com">Hi
      All,
      <br>
      <br>
      We're having an issue doing an SDK build based on Walnascar. The
      log is
      <br>
      filled with thousands of magic file warnings like the following:
      <br>
      <br>
      ```
      <br>
      Building libteec.so
      <br>
      &nbsp; CC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; src/tee_client_api.c
      <br>
/opt/fsl-imx-internal-xwayland/6.12-walnascar/sysroots/x86_64-pokysdk-lin=
ux/usr/share/misc/magic.mgc,
      1: Warning: offset `&#28;&#4;&#30;=EF=BF=BD&#19;' invalid
      <br>
/opt/fsl-imx-internal-xwayland/6.12-walnascar/sysroots/x86_64-pokysdk-lin=
ux/usr/share/misc/magic.mgc,
      2: Warning: offset `Version=3D' invalid
      <br>
/opt/fsl-imx-internal-xwayland/6.12-walnascar/sysroots/x86_64-pokysdk-lin=
ux/usr/share/misc/magic.mgc,
      3: Warning: offset `<a class=3D"moz-txt-link-freetext" href=3D"http=
://www.difstream.com">http://www.difstream.com</a>' invalid
      <br>
/opt/fsl-imx-internal-xwayland/6.12-walnascar/sysroots/x86_64-pokysdk-lin=
ux/usr/share/misc/magic.mgc,
      7: Warning: offset `&#17;' invalid
      <br>
/opt/fsl-imx-internal-xwayland/6.12-walnascar/sysroots/x86_64-pokysdk-lin=
ux/usr/share/misc/magic.mgc,
      8: Warning: offset `Firmware v' invalid
      <br>
      &nbsp;&nbsp;&nbsp; %&lt;--- S N I P ---%&lt;
      <br>
/opt/fsl-imx-internal-xwayland/6.12-walnascar/sysroots/x86_64-pokysdk-lin=
ux/usr/share/misc/magic.mgc,
      4765: Warning: offset `' invalid
      <br>
/opt/fsl-imx-internal-xwayland/6.12-walnascar/sysroots/x86_64-pokysdk-lin=
ux/usr/share/misc/magic.mgc,
      4766: Warning: offset `' invalid
      <br>
      file: File 5.45 supports only version 18 magic files.
`/opt/fsl-imx-internal-xwayland/6.12-walnascar/sysroots/x86_64-pokysdk-li=
nux/usr/share/misc/magic.mgc'
      is version 19 (No such file or directory)
      <br>
      ```
      <br>
      <br>
      This seems to show the root of the problem is the build is using
      the
      <br>
      file program 5.45 from the build machine, which does not match the
      5.46
      <br>
      magic file specified by the SDK. Indeed, we've worked around the
      problem
      <br>
      by downgrading the file recipe to 5.45.
      <br>
      <br>
      So, why is the build using the file program from the build
      machine? I
      <br>
      tested the basics and can see that sourcing the SDK setup script
      does
      <br>
      make the SDK file program the selected one.
      <br>
      <br>
      This is not easy to debug since I don't know where the file
      command
      <br>
      invocation comes from. Perhaps 'strace' will help?
      <br>
      <br>
      I'm hoping someone might have an idea to help narrow this down.
      Thanks
      <br>
      in advance.
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>Not off-hand.<br>
      <br>
      Could you explain exactly how to reproduce the issue and maybe
      create a YP Bugzilla defect?</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:5019da94-791c-459a-87e5-3f94422=
bb079@oss.nxp.com">
      <br>
      Tom
      <br>
      <br>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#217318): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/217318">https:/=
/lists.openembedded.org/g/openembedded-core/message/217318</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/113329951/3616765">https://lists.openembedded.org/mt=
/113329951/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------cSwu4vsM2W7NE8y2tBsHVSFh--

