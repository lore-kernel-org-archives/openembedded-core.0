Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6064C54E65
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 07:30:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5501.1747812649527543292
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 00:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7236463a26=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L3Llqh013116
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 00:30:49 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfs8yjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 00:30:48 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54L7Um63025068;
	Wed, 21 May 2025 00:30:48 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2177.outbound.protection.outlook.com [104.47.73.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfs8yju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 00:30:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AaxBKCUObR9AB/ZIb3yw6v9KZvbW3S0GD58OPuEn7kYbxNuD6T/DOeIuJPkK5uXRANIjInY2fKXVm4ToNc+LIeuoq561oYJOcpa13XK9Y12LdM6/oJ8T8OsWcEncoTg+LRnMtGkDbc1MyAmghwzfYRow0X5qY870EOS+vqFJdC6lkooivYkZ8mgF+DjqQBa/nPcO0RorX+9z6H8XzW+Yc7HxDfmhrC5lzO8MYaHt33Te9QwREEoLmVOO+8JdW70mhLMg2D5pTP7Nzr592bnxEaYdA5ReTcDHqBkOGflFW1LDVU6H188TJHeFAV42wnapWb0dwaLkggj1KIQJu+MlLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0r00kRTgto7gXUl0Oij8aBL47j5Mj0OsOd0sFd5kAZQ=;
 b=IB9ZCisdnXB1t0MWbW8e19QqqKGpggmufneNQym1KqN3N7YcJ/7QmlJDgk/FF4UVt7WnB5wvkpT16eLpVY3CAD+zl2EQIFFQyOOXXQqKXjv5vrRsC6EfGM+hMEbnHKxUJUSyyRWcguDilvMRUQCa8REAeJ6sxYmHcF8kMBpX6DyS0ZUe7N0AsiBt0TfS9jBLLbZJA130QREoz1HT2oN2Zn+ESJ8hBLVF+hhtMoCCHzsFeJuKQ433lOyZXqy7xFlK7kXiESsJjB3O27CE5FjaPAjOU3O/F4apHhJpsprrhT7dEzeQf4/qxUX4k8cz1taWlxakUg7CTMTXm7QuNjn5CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by SA1PR11MB6871.namprd11.prod.outlook.com (2603:10b6:806:2b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 07:30:45 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%4]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 07:30:45 +0000
Content-Type: multipart/alternative;
 boundary="------------o6zdwFtbuAs9GQN0hUSIjkuO"
Message-ID: <8c746297-3fab-4fb2-bf68-a588fc608a33@windriver.com>
Date: Wed, 21 May 2025 15:30:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/4] libxml2: upgrade 2.13.8 -> 2.14.3
From: Hongxu Jia <hongxu.jia@windriver.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        hongxu.jia@eng.windriver.com, openembedded-core@lists.openembedded.org,
        "Marko, Peter" <Peter.Marko@siemens.com>
References: <20250519081000.2298461-1-hongxu.jia@windriver.com>
 <DA02WU2YGQPI.3KXN4YKUA7LDR@bootlin.com>
 <3fe8a12c-d5f5-43a9-b325-2cf2bcfa8a4b@windriver.com>
Content-Language: en-US
In-Reply-To: <3fe8a12c-d5f5-43a9-b325-2cf2bcfa8a4b@windriver.com>
X-ClientProxiedBy: TYAPR01CA0200.jpnprd01.prod.outlook.com
 (2603:1096:404:29::20) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|SA1PR11MB6871:EE_
X-MS-Office365-Filtering-Correlation-Id: 62157307-8fb7-4621-1c73-08dd983965fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ck5LNURJbHFOZnFLb0JyeWp2ZmJFRWFiS3pTSVRNU0JYYm1kZGUxWW1OTTVB?=
 =?utf-8?B?RjNESHA0ajhpc1FaUWlIV25CSUp2TXhpdGptalBaRFB3ZUhjdDJxbXdiVExa?=
 =?utf-8?B?eGRyNncwclhGR0VKRm9mS3dXdTloUVBIZVBqR1hSZmVkK0tuRTJMTXkrVVFy?=
 =?utf-8?B?TEdNU2VQWXBycjVYdXFRNzdKOXkxWlBXQXYzRmJ6RTd3TE0xTTJBKzdyUWRO?=
 =?utf-8?B?ZXFJcnBURkt1T2srYm1IR3B4ZXRjR09sd29hVW5UYzViWktWTzRHdkFJNnFy?=
 =?utf-8?B?QXViN3ZiYk1aQkxFNFczMkhIK0IwR3o2OStjWUpKL1k0VmRFY05hWjRUQ1BK?=
 =?utf-8?B?ejFrdmkwaGRIVmxlT1RxN1JBd0NXOXVkYlFGaGpaUDAyK0hKL1pnUnFvVFNB?=
 =?utf-8?B?MUlFZnd2MDV0ZUVBa1NqL21ldFFQMEhyMXR5OVB6SzRxai84aVcySzdKZWlX?=
 =?utf-8?B?c2JYSjhFYVkyRm1GTG83MjlZa0JIeEFmZFh2bDBtRGpQY1pJQWZxR3dnd2tI?=
 =?utf-8?B?b1loczcvR3JnVmJNZENiZUVPb0QyU1NiOWJwVjgwRlNidHVXWWRYTkROc2tC?=
 =?utf-8?B?a0NqNEhQdjZydlZkSVI3RHdqb3RxTTk3bkNzZW1TS1crRWVIL1M0QnQxbFVS?=
 =?utf-8?B?b0Izd3FHelVoWk03MjFGV1FVMjI0SEU1S1UveFVlc1NVcGxSN3RWNG5ZNW9q?=
 =?utf-8?B?SE1oOHMrTGZka3Q1cEtJcWM5NmJ0MUpRYjV5VHFCTFB4WCt2TnFGdEY1VS8v?=
 =?utf-8?B?ZXlNaHpZelR3OUdVRzZtWDhTRWhZUWZWdkpwRnMzWWY5dHdqZExGa2dRaUF1?=
 =?utf-8?B?MCt6N014aUJpb2tlK2V3MWlLcFFJZ2NNT1JPQjBqZTZsYnZkSEtSc05LM3N6?=
 =?utf-8?B?c29ES1dBcWJEQUY5ZkJONVFkMm52Ykk0dGpwbWxWSWtRa1JCWUVZcWwrUjZE?=
 =?utf-8?B?eld2NmhaMkRBcW1VUHF1eVZ6VFFGSGc4OGhvSXJpMjNXYkNwUkxvOElBWGlz?=
 =?utf-8?B?UXFiZWZ5VUl4azkyaDdQS0pvQ21vU1gwV3dFcWd3eFBZbHdQYUN3SXRHUjZ5?=
 =?utf-8?B?aGhpNnNHNVZHb1JtU0loWm5RS0Jsalg5Nng2YW1Pa0NwNlhBdlI3YmxGUWRx?=
 =?utf-8?B?OGU2aSthdlFzSzIyQzEySWxRb2lYcDhjWElyMWV1N1JIbnQ3K1BlRXRGWDlD?=
 =?utf-8?B?KzdQSEJIZWhOR0orVFZKMHVjYlFQc1NUTkpxb2xHRGtSNGNjNFNJMVJKbWpj?=
 =?utf-8?B?N0dGYTJJYllQRkNmK0NFbitvcFNVd3d3cldQZUppTS95dnJOWU80aWZOUXk0?=
 =?utf-8?B?VkN2YXN3NVFOMlpSZS9jY0VMeUViOUhRM1dxbzVoYnl3RkdhcmVEdTFPb1lX?=
 =?utf-8?B?RHVsOW56NFFYRmN0VW5tV1dlcy8zUEZyY1B5S1lTM2x0YnRScXQzekZDU0ZI?=
 =?utf-8?B?bjRmZ1BqVWZhdHRpcUgwMWtsVVdoOENJcWErekpnanpUallYLzh0Y0lpQXY5?=
 =?utf-8?B?dEpZem1Ia0YxczZBbmo5cUxEZ05KWTN4aGtqcXdwcEZkZVJvVzdUOW9ZWWl6?=
 =?utf-8?B?YjE3RDMzUE1kWlNoR2NyUFV5emVRMmVvNUVqSFoyM2xldndDek50L2tiQXJy?=
 =?utf-8?B?WENEb2Z5Qjd2NkN5Z01yTmVLeDJxS2tmUmMwZkdsSnM4bWNVQlpKVHQ0Q1cv?=
 =?utf-8?B?bmtwVy9VeVRXN2RkNDZGRjdHb3pKTFBrV0ZvaGlucHFUZFl6NDJKOXFBTEQ0?=
 =?utf-8?B?NGxNL1NRZTdGaUlhcXN1cTY2bU1wQm0wamw4QTdxMmZpdWM0eDU0Wm5kQ3Zj?=
 =?utf-8?B?OG5SeFVNNG9NK3YrUFhrdUJPanlHVkJIWG9xSmc4ZFNaQUpNbzB6UWJkT1M3?=
 =?utf-8?Q?KbeXJQU3rEEVj?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cnQvL2dEazlCSmZGZHh3ZmJ1NEhWMEM0SnFtaVFpOW1LN0dNNWdtaVladVVU?=
 =?utf-8?B?WVZGTS8vSVB0R3M1eW1hNkE0Y1ZRVGUreE9IUXNER29hb3FYNFFjZHc3TjhB?=
 =?utf-8?B?Mllxd3M2S0t0VVVDT1BMbVZLZzhhbzAxNk5jTS9MczZueVluOTJnZ0VTWnJJ?=
 =?utf-8?B?cmNzaGErWG05U0xZYlVvTTlSZnNjWGFtUXBkcU44YnVMaStvYWVsV2V6c0Qw?=
 =?utf-8?B?UWZnOHBDaFZ2b2s0UldSZlAxYUZRajZLS09SRkhISW14MWY0TS9ZakU0T2RG?=
 =?utf-8?B?em1qYURpUTNaelduR0xVcDhGRXhYemJLSlZ1b05QeEZyWDZjSGdqRHIxOCtM?=
 =?utf-8?B?b0dsUVZDODVlam44dEE4bS9Sek9xQldIMVE0YjRYdUFRRGV4b3VFejRRNVJV?=
 =?utf-8?B?a3VyblBqSldrZE9qcWMrNzBDbUhWVTB1QXRhWi9tamM1WERKSzFZcUowdkdK?=
 =?utf-8?B?a1A2dWd0YVd5NlZJUjlvdnhJVlZ4MXA2OVRlTHBPUjlzUU11Tm1SdE5CVUhC?=
 =?utf-8?B?c21zdk95SHpUTUFaTDdWOHNObnlqVWcwR1VQWC94ckVOb3VMYXg5OWVidlo4?=
 =?utf-8?B?aDdReXVUaUdlTjU2QTBoNEE2S1dZZHdJbVpZSG50a1ZyNXQ3ZjVDcVFWcnBy?=
 =?utf-8?B?ektaSzVidElmZzRpNlBsRmxvb1lnY0FocTY5VjlqSlAxMlRZektudEdhczdJ?=
 =?utf-8?B?eVpaSU53SXV1Zk9KV1RQN0R0U0ZDdWMrRXdqVU0wbUFVbnpkRnVpTUR4SGVL?=
 =?utf-8?B?TjQzMVJvL2ZyWVVBdHF4c2tTTllHNG5FTEhKMnhBMHlZdzhrbVN4YmVoTXBq?=
 =?utf-8?B?eWVGYUhqNTRtVHNpMkZiNXdELzBJZU9PVmJ6NHVueFQzZHdKdnJ2OTdlb3lj?=
 =?utf-8?B?Q3M5eUNSUVFKSjVYMkYzeFg0UnNNL2k0WGFNbnBiUkJEczNlNFdxUjdUampW?=
 =?utf-8?B?N1ZoamRlbVlOckNKQlcrTlpRL2ZoNGtaZ2VEbEswQUlOemFtaER6SGJpUzZl?=
 =?utf-8?B?S1dqZVhaWlpuN1JqZDA0SVEzS0hVdHkwSlloWTZyK3dUb3dIcWpneUxJTkJU?=
 =?utf-8?B?WFgrUmkzRTJkRWEweG53b25rWGRTTTdkY21sVG9CcDE3T29ETVpqbVAvSzM2?=
 =?utf-8?B?c0JLU0YvOWY5aWd2bmY0d2JkYXhrQ0tOaTZmZmMrekVYbmZBdW1CTkxxcUFP?=
 =?utf-8?B?N0Q4NDIwZmtVbWR2U2R2OWxTOGR3YTdSYnJwdXVFNUgwNFZ3dDZ1M1pjbVZ4?=
 =?utf-8?B?SEhUYnExZlB2dFgxSDNrbHh6TFhGZSs3eWNFQ005cmdEZ0Z1aENSellOay9u?=
 =?utf-8?B?SzlIZXhoNitwdXJIMjZ3K0ZQRnErWm5QS1hEZzJwV29QSERKekI4Z1JlZ3Bv?=
 =?utf-8?B?UWxNdUtJZktpQ1ZpM29RakdRSmsrSXcrdzluUmRERE5lK1FxRHF0am1rcW1O?=
 =?utf-8?B?ZmNtZnNRa1QveCswcWlhOEM5bU9jOXMwWkJ1Szl6TnhRbzBLSmUwNEk0RGZV?=
 =?utf-8?B?czJnaXhyTTVkZnN3dWRJZGZaQ2FhZk5OTXJBNXR0NlpPVnNMek5RUTZ3RVAr?=
 =?utf-8?B?S3hJMWhEQ09XNVdQdU1VUWxmZEFCUjVML0VJT2dCZDI1L2xnWWFmZnpvbXVM?=
 =?utf-8?B?bVFKaEFhejJoMmFPeHg2aGkwUG1zejM3QmErM1NQQ1ZUQm96TDB6Yjh3YUts?=
 =?utf-8?B?UDJVdFlmZjZ3bm1IM1MzaHhVTXM5WEhacll6Mm1CemdBVlpMWG94MDlQY2ti?=
 =?utf-8?B?eFNobmZmaDJyU1VMTXhteThaL2s4am1iRWsyaE5tK25FQXc4WlFjV3dEN2dI?=
 =?utf-8?B?K0NYUkRVZkRkWUVScksvQjlLblRkS1o4dzVQd3d4NUk5MXRpdDM2WHZ6aklI?=
 =?utf-8?B?ZTYvc2NpQnBxcDk2QVZmY3RSbWdNalhxeG9KekViZGt6Q1pkTXJySTBXUmtG?=
 =?utf-8?B?WXJzTGJDZUIxcUFLS0I5S0FBSGtWTjFlNDJEa3Y0U1cvSHBiS2E4d2N6ZnBs?=
 =?utf-8?B?d1dhWkc0SDNoSXVnYmFwOHp6SktBcjFCZy95R0RVT3NVT2F1QVE0aU5CQkN1?=
 =?utf-8?B?dndVRUs1S0U3OEVrcHJnUzlGS2lZNGJiWnA2NHB6RnU2NDIxU0RFQXJBWHlK?=
 =?utf-8?B?UmxVTWZaSnNiaE92R3crejRUZzZDd0hieVNDQUxEWmNRVnJTN1h1clp3bzdT?=
 =?utf-8?B?TFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62157307-8fb7-4621-1c73-08dd983965fa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 07:30:44.9206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O1c8sgsJ+40XQsKp0G0GLXnYdt+TajW0Zc47BnQNymr1cb+jFTzikmniL5W2YNNk2NXylwwbKSiN1lA/IeHCMNrhcoX+uGdFRFk/yj5paAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6871
X-Proofpoint-GUID: 2lhQ40-wcDPl4dyxNrBbp8cz37Rkj9Jj
X-Proofpoint-ORIG-GUID: 60u0gOuhjHQjeGYwT0SIbihI3EvA1Czk
X-Authority-Analysis: v=2.4 cv=KJNaDEFo c=1 sm=1 tr=0 ts=682d8128 cx=c_pps a=VBfpofCtJTW4YIct4dFqXg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=GHR8O2WEAAAA:20 a=iGHA9ds3AAAA:8 a=a5LkSv8FAAAA:8 a=NEAV23lmAAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=Pxit7gfDrbB0Lm1fM1EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=m9p5bXcFLgAA:10 a=UBFVfQAFWYhimOpKR3UA:9 a=0TF4McwDb7jKJEGN:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=E2cWBXyb0kjxxB1PlMdk:22 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA3MiBTYWx0ZWRfX+hd2DrEi6k6F slD5LXuxmrGkzIP5WDU/0Vi7RdiGy49y9tVBUjpI0PXFGb28plXp6zA4e5NLmU/v352y0KsnFW+ homxm32urO784E6x+aGOAOho/2QSZW78G/4w8Otv3p7ZrKu8L0Ll0LYnm2mtvElkPwEVlzsMGH+
 MbfSrfGwESEM+baCoOz4uLmzz9+SWxXWluu/yVyXEbQYME3gpXpjbpEayL3xvhp3pOxuAHzkKTD THS1eRstW7I6cOYOpZKi+g4c5J13YRA6qbIC0zvffssAnksjHtW9RLeduJ93T93NR/wk0DnXeNw Wu3tIlb0MI1gp5/9gFxiXCf+/bBgOjPnR6G9b4w2mtcaTGfDyzq+ZaP1NJi5esPQw1hI8Ria69S
 afLqR2Q2yf+Uz8KFvD59JHpTV9uY3Zzl/z2ZSZw3iVBbNJII+DQ3Sz4E2Pz0uNrOz9AvR5HM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505210072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 07:30:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216998

--------------o6zdwFtbuAs9GQN0hUSIjkuO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 54L3Llqh013116

On 5/21/25 11:28, Hongxu Jia wrote:
> On 5/19/25 18:52, Mathieu Dubois-Briand wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.
>>
>> On Mon May 19, 2025 at 10:09 AM CEST, hongxu via lists.openembedded.or=
g wrote:
>>> - Rebase install-tests.patch
>>> - Remove --enable-ipv6, due to upstream [build: Remove check for IPv6=
 ][2]
>>>
>>> License-Update: Mention contributors in Copyright [1]
>>>
>>> [1]https://gitlab.gnome.org/GNOME/libxml2/-/commit/4bd66d4549b2e8925a=
752e0daac3a189d2fec8f7
>>> [2]https://gitlab.gnome.org/GNOME/libxml2/-/commit/dc6f55cf6e03ae63a4=
0e3af9ad6879821558d6a7
>>>
>>> Release notes:https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.14=
.3
>>> Regressions
>>>
>>>      reader: Fix reading compressed data
>>>      parser: Make undeclared entities in XML content fatal
>>>      save: Fix XML escape table
>>>      save: Fix xmlSave with NULL encoding
>>>      Revert "valid: Remove duplicate error messages when streaming"
>>>
>>> Bug fixes
>>>
>>>      save: Fix serialization of attribute defaults containing &lt;
>>>      io: Fix linkage of __xml*BufferCreateFilename functions
>>>
>>> Build systems
>>>
>>>      cmake: Fix installation directories in libxml2-config.cmake
>>>      meson: Install libxml2.py
>>>
>>> Improvements
>>>
>>>      parser: Make xmlCtxtGetValidCtxt depend on VALID_ENABLED
>>>      html: Avoid HTML_PARSE_HTML5 clashing with XML_PARSE_NOENT
>>>
>>> Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
>>> ---
>> Hi,
>>
>> Thanks for your patches.
>>
>> It looks like the libxml2 upgrade is breaking the build of lttng-tools=
:
>>
>> ERROR: lttng-tools-2.13.15-r0 do_compile: oe_runmake failed
>> ERROR: lttng-tools-2.13.15-r0 do_compile: Execution of '/srv/pokybuild=
/yocto-worker/qemuarm-alt/build/build/tmp/work/cortexa15t2hf-neon-poky-li=
nux-gnueabi/lttng-tools/2.13.15/temp/run.do_compile.60377' failed with ex=
it code 1
>> ...
>> | In file included from /srv/pokybuild/yocto-worker/qemuarm-alt/build/=
build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/lttng-tools/2.13.15/=
recipe-sysroot/usr/include/libxml2/libxml/parser.h:25,
>> |                  from ../../../../lttng-tools-2.13.15/src/common/con=
fig/session-config.c:29:
>> | /srv/pokybuild/yocto-worker/qemuarm-alt/build/build/tmp/work/cortexa=
15t2hf-neon-poky-linux-gnueabi/lttng-tools/2.13.15/recipe-sysroot/usr/inc=
lude/libxml2/libxml/encoding.h:173:7: note: declared here
>> |   173 |     } input XML_DEPRECATED_MEMBER;
>> |       |       ^~~~~
>> | ../../../../lttng-tools-2.13.15/src/common/config/session-config.c:4=
32:15: error: called object is not a function or function pointer
>> |   432 |         ret =3D handler->input(out_str, &out_len, (const xml=
Char *) in_str, &in_len);
>> |       |               ^~~~~~~
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/163=
3
>
> Peter has reported the issue to upstream lttng
>
> https://bugs.lttng.org/issues/1427
>
> Upstream replied:
>
> ```
>
> This issue has been fixed upstream in lttng-tools master=20
> https://github.com/lttng/lttng-tools/commit/1eadd115f621b19937dccfc8492=
34d2ae4063234=20
> <https://github.com/lttng/lttng-tools/commit/1eadd115f621b19937dccfc849=
234d2ae4063234>=20
> but has yet to be backported to stable-2.13
>
> ```
>
> I've compared lttng-tools 2.14 vs 2.13, it is hard to backport above=20
> patch to stable-2.13, upstream lttng-tools rework the source code from=20
> c to c++
>
> My question is should we upgrade lttng-tools/-ust/-modules to 2.14, it=20
> seems no stable release but RC is available,
>
> or ask upstream to backport the fix to stable-2.13
>
Because the source code has been reworked from C to C++, it is hardly to=20
backport [1] to=C2=A0stable-2.13 directly,

so submit the PR [2], try to fix stable-2.13 with minor change

[1]=20
https://github.com/lttng/lttng-tools/commit/1eadd115f621b19937dccfc849234=
d2ae4063234=20
<https://github.com/lttng/lttng-tools/commit/1eadd115f621b19937dccfc84923=
4d2ae4063234>

[2] https://github.com/lttng/lttng-tools/pull/170

//Hongxu

> //Hongxu
>
>> Can you look at this failure please?
>>
>> --
>> Mathieu Dubois-Briand, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>

--------------o6zdwFtbuAs9GQN0hUSIjkuO
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 5/21/25 11:28, Hongxu Jia wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:3fe8a12c-d5f5-43a9-b325-2cf2bcfa8a4b@windriver.com">
      
      <div class="moz-cite-prefix">On 5/19/25 18:52, Mathieu
        Dubois-Briand wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:DA02WU2YGQPI.3KXN4YKUA7LDR@bootlin.com">
        <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Mon May 19, 2025 at 10:09 AM CEST, hongxu via lists.openembedded.org wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">- Rebase install-tests.patch
- Remove --enable-ipv6, due to upstream [build: Remove check for IPv6 ][2]

License-Update: Mention contributors in Copyright [1]

[1] <a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libxml2/-/commit/4bd66d4549b2e8925a752e0daac3a189d2fec8f7" moz-do-not-send="true">https://gitlab.gnome.org/GNOME/libxml2/-/commit/4bd66d4549b2e8925a752e0daac3a189d2fec8f7</a>
[2] <a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libxml2/-/commit/dc6f55cf6e03ae63a40e3af9ad6879821558d6a7" moz-do-not-send="true">https://gitlab.gnome.org/GNOME/libxml2/-/commit/dc6f55cf6e03ae63a40e3af9ad6879821558d6a7</a>

Release notes: <a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.14.3" moz-do-not-send="true">https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.14.3</a>
Regressions

    reader: Fix reading compressed data
    parser: Make undeclared entities in XML content fatal
    save: Fix XML escape table
    save: Fix xmlSave with NULL encoding
    Revert &quot;valid: Remove duplicate error messages when streaming&quot;

Bug fixes

    save: Fix serialization of attribute defaults containing &amp;lt;
    io: Fix linkage of __xml*BufferCreateFilename functions

Build systems

    cmake: Fix installation directories in libxml2-config.cmake
    meson: Install libxml2.py

Improvements

    parser: Make xmlCtxtGetValidCtxt depend on VALID_ENABLED
    html: Avoid HTML_PARSE_HTML5 clashing with XML_PARSE_NOENT

Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com" moz-do-not-send="true">&lt;hongxu.jia@windriver.com&gt;</a>
---
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Hi,

Thanks for your patches.

It looks like the libxml2 upgrade is breaking the build of lttng-tools:

ERROR: lttng-tools-2.13.15-r0 do_compile: oe_runmake failed
ERROR: lttng-tools-2.13.15-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/qemuarm-alt/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/lttng-tools/2.13.15/temp/run.do_compile.60377' failed with exit code 1
...
| In file included from /srv/pokybuild/yocto-worker/qemuarm-alt/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/lttng-tools/2.13.15/recipe-sysroot/usr/include/libxml2/libxml/parser.h:25,
|                  from ../../../../lttng-tools-2.13.15/src/common/config/session-config.c:29:
| /srv/pokybuild/yocto-worker/qemuarm-alt/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/lttng-tools/2.13.15/recipe-sysroot/usr/include/libxml2/libxml/encoding.h:173:7: note: declared here
|   173 |     } input XML_DEPRECATED_MEMBER;
|       |       ^~~~~
| ../../../../lttng-tools-2.13.15/src/common/config/session-config.c:432:15: error: called object is not a function or function pointer
|   432 |         ret = handler-&gt;input(out_str, &amp;out_len, (const xmlChar *) in_str, &amp;in_len);
|       |               ^~~~~~~

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/1633" moz-do-not-send="true">https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/1633</a>
</pre>
      </blockquote>
      <p><span style="white-space: pre-wrap">Peter has reported the issue to upstream lttng</span></p>
      <p><a class="moz-txt-link-freetext" href="https://bugs.lttng.org/issues/1427" style="white-space: pre-wrap;" moz-do-not-send="true">https://bugs.lttng.org/issues/1427</a></p>
      <p>Upstream replied:<br>
      </p>
      <p>```<br>
      </p>
      <p>This issue has been fixed upstream in lttng-tools master <a class="external moz-txt-link-freetext" href="https://github.com/lttng/lttng-tools/commit/1eadd115f621b19937dccfc849234d2ae4063234" moz-do-not-send="true">https://github.com/lttng/lttng-tools/commit/1eadd115f621b19937dccfc849234d2ae4063234</a>
        but has yet to be backported to stable-2.13</p>
      <p>```<br>
      </p>
      <p>I've compared lttng-tools 2.14 vs 2.13, it is hard to backport
        above patch to stable-2.13, upstream lttng-tools rework the
        source code from c to c++<br>
      </p>
      <p>My question is should we upgrade lttng-tools/-ust/-modules to
        2.14, it seems no stable release but RC is available,</p>
      <p>or ask upstream to backport the fix to stable-2.13</p>
    </blockquote>
    <p>Because the source code has been reworked from C to C++, it is
      hardly to backport [1] to&nbsp;stable-2.13 directly,</p>
    <p>so submit the PR [2], try to fix stable-2.13 with minor change</p>
    <p> [1] <a class="external moz-txt-link-freetext" href="https://github.com/lttng/lttng-tools/commit/1eadd115f621b19937dccfc849234d2ae4063234">https://github.com/lttng/lttng-tools/commit/1eadd115f621b19937dccfc849234d2ae4063234</a></p>
    <p>[2] <a class="moz-txt-link-freetext" href="https://github.com/lttng/lttng-tools/pull/170">https://github.com/lttng/lttng-tools/pull/170</a><br>
    </p>
    <p>//Hongxu<br>
    </p>
    <blockquote type="cite" cite="mid:3fe8a12c-d5f5-43a9-b325-2cf2bcfa8a4b@windriver.com">
      <p><span style="white-space: pre-wrap">//Hongxu</span></p>
      <p><span style="white-space: pre-wrap">
</span></p>
      <blockquote type="cite" cite="mid:DA02WU2YGQPI.3KXN4YKUA7LDR@bootlin.com">
        <pre class="moz-quote-pre" wrap="">Can you look at this failure please?

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
<a class="moz-txt-link-freetext" href="https://bootlin.com" moz-do-not-send="true">https://bootlin.com</a>

</pre>
      </blockquote>
      <p><br>
      </p>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------o6zdwFtbuAs9GQN0hUSIjkuO--

