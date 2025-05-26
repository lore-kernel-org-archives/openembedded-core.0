Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A493AC54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 21:56:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.38319.1748296577869686938
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 May 2025 14:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=72419a8751=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54QLt2xL004218
	for <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 21:56:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u3b12390-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 21:56:16 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54QLuGdI005984;
	Mon, 26 May 2025 21:56:16 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u3b1238y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 21:56:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A69xkssqVrwaUOtB+lW+PooK1mtjcC81u/sjAXjpKx7R/6rEVOeG6Qxbx3br0tv0B6eg/M4XQfycxB3blBEVpUmjiGbJYA9WsN6Mx5vhRo/yNiQ6ekZ4MAIzKBPmNvlZvzDP2Z4Z8WxpBx1F09w7b/idASsuRhPN7nhoFhJi/M+7118dLBWUSBmb80EknOZwN6X1cgadD+NNeaIr/xZkO2z2zvMCKBxOJw5WpRQqb7Sfkox3FFW75kXkLSPBAFF1Wtdgc/llYokRGVPP49qoG7wvOtjGwjM8/G77gzh66u1VamQasARrGXw0JyRmdarKYfxNDSRTFXoVpoEWt/RStw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afYEz4oYZvAmmgjn8b+41ISgZq5TEtnTqrWFlQ+IbCg=;
 b=AztuHOyYj6EM0k1ppFKgJWcz6PECp0e82xb1kbDDRleIKO8WsLOILpQV+f40hKtN3I9kI87uhWay/9AYBebUUhfVRqGfQl5XxpqnkO9cTHBCLpyaa1MeZcR7oE288E3PvW+YuUvll/F7l3d3yPchRp1Q0H/N2ZN5YSI1zbdSc9ATITabjIM47X+usOUo6sLfS/+vtISPri9DNII4N0Re8tZE1TmSaLU90BKXhv1EsCtOTRNjIa4CO852rvqgoOFnlgcxbuvMGDPyta56pKzZ3XHlntJWkl4hhenU71nK4kSVsdGqhRieilWfVuHuB9r4FWb3qqwwdmmz0ZbixcUQIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by PH0PR11MB5048.namprd11.prod.outlook.com (2603:10b6:510:3d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 21:56:13 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%5]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 21:56:13 +0000
Content-Type: multipart/alternative;
 boundary="------------XbJkQS7rd98VOy8FEfxG1jNU"
Message-ID: <c026eb76-cf75-4210-8a70-72666286551d@windriver.com>
Date: Mon, 26 May 2025 17:56:10 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 12/28] openssl: Link with libatomic on
 x86/clang
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>,
        Ross Burton <ross.burton@arm.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
 <20250520-clang-toolchain-v2-12-db97c2eb3756@gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20250520-clang-toolchain-v2-12-db97c2eb3756@gmail.com>
X-ClientProxiedBy: PH7PR17CA0056.namprd17.prod.outlook.com
 (2603:10b6:510:325::17) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|PH0PR11MB5048:EE_
X-MS-Office365-Filtering-Correlation-Id: fdb225ac-c416-40a7-8c8e-08dd9ca021b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|366016|376014|7053199007|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MTNVS2xZK0t2MmRWQjlHcXE5RnpjRGdKQ0h4R3hsTFNqU3poNldLTSsrdlQ3?=
 =?utf-8?B?Q25MREl4YlJnQ2EyeExJNTAzd1daVjZ0eGNQek94dEN0OStab0lrTUZUSisv?=
 =?utf-8?B?S0N4M0VGdDZZTG91NHYvQlUvQWNQYmdwOHc1b1ErdmlsMHpkYmpvMEF1U3NS?=
 =?utf-8?B?aThFb0VrdWpubXhkVCtidXRPenBoOVc2NUVOVUhraXFvS3hIajkvNUIzRi95?=
 =?utf-8?B?TXI5c04vU203YnFkdHlUOEt4cTE5OWY0T1BTY3VGak9XSnN6aEErdVRUcE5C?=
 =?utf-8?B?Mm01UE5tbkxPZXBralphRmFmcTZuT05EVVcvZ05ZOEtqdms0STB6aFQvUmxx?=
 =?utf-8?B?V3A2eGRzVGFHWlRoeU5xTlROVkhBYjhxdVdxS0JkQzVmMWcxZVJVUFE3ejM5?=
 =?utf-8?B?L044bVlsU0E1WUdxUXRMSmVzMnpybG4vS1JFTi9yVnlKdDRqWnRXMWtYNFh1?=
 =?utf-8?B?NWtxNm5vd3JRWFhlZlZvN083S0xPOHRrR2l1ekhveHdIWG5ldGg5UXFVQ3Fq?=
 =?utf-8?B?Qm5DWURxRWxWemhSQThwSytBK1o2cWNkY1BNN3RyNk8zYWVJR0owQXVjMVJ4?=
 =?utf-8?B?b2JZL1VmbTEzMEdBbHJIbUNDZzV3MEZ3Y1RMbmlJT014MU02OUJnTVZUY3ZZ?=
 =?utf-8?B?UjZ1eU5LWXNoWjNIcjVHOUwwelY5ejd2SFN3ZXpjZDJvVnJuZU9MZVJtczJJ?=
 =?utf-8?B?QjV0SVZVcGRtK3o2OEtDczl4UlZsaG1ZMVdhWEZTSzRXZHB2eFZuWlZvMlM1?=
 =?utf-8?B?OWx4N1ZUbVdCYXluaHprd3FCdUs3bTA0MGFRb1kvVTZjdWQ2MWUxdWt4Nkxu?=
 =?utf-8?B?MUtBaXU5REkyMi9LTEhPWHNEa3VycWcvV1V2dE5NMXN3UVlBY09nTUUrL283?=
 =?utf-8?B?VmJSQksvNnBSUzcvYlZWOVlqK1djTGhmb2ErZ1ljbG03N0ZwVHZweW4yd3hp?=
 =?utf-8?B?Y3RDQVBtaWszbnEyNDdwdi91VWttcUZwVkRGS1lNdnJOdkR1SWQyeG9valdE?=
 =?utf-8?B?a3BvWkZNSlBRWmtJVVpYc3NGY0pUZEF1SVp3enBFV0o5R1BaUnFmVXdoUE9F?=
 =?utf-8?B?TG5Gb0FjSzhmZzlubkx0QkxWTFlEWEw1dGh6bGtYVWZiWW03TUlBdC9BV2xJ?=
 =?utf-8?B?TnJhRkRQVmNLYUhpSDNKaFdGemIrQkF3UHRUYWVuZFVmU1pQN1czV3NkRzF0?=
 =?utf-8?B?aDVreE1XS0tHeTlLR2V6Ykdtd2dzVFU4Q3Q2RGJhaEYzdnZta3BvNXFvVFVY?=
 =?utf-8?B?TlBkTE1NSEtDU3ROamFRR0doRm5VdmY3M21rdEhMcWN1UnR4RXNGeCtiVGNY?=
 =?utf-8?B?bmI5SnFVWXhGY203b3B4UDM3WGROdWlhM2ltMDl5Q2UvdzJxTVJWbVNWT0dB?=
 =?utf-8?B?djJiaTR0VndkTWJiTlNQU3pENm82UlBSc1JTNHQvZHdSWmREQWlXYUg1Q1ZS?=
 =?utf-8?B?d0k0Vm41a3drTjZkQkxQejRBcjZ5eURYeGdXRExvQ0FhU0EyTWovVklSczRU?=
 =?utf-8?B?a0dDZEF6UUJjeEtJY2ZpMTRhNkpFK05kZ0xOcTZaSkVpeXBCQTcvNjVTWjhX?=
 =?utf-8?B?WERXUzBHS3NLaTVHemI5MkNnWXBtMHNrV0xLZm5Rb1V0U3JpbHp6K1BESTBY?=
 =?utf-8?B?ZHNURXd3SXRNdUd4amUzcUcydEFnWEx5R1VBN1ZGalk5YjVwdmhEYWZiaTlG?=
 =?utf-8?B?elFIQTgvU0JPZ1pWN2xLaFZVQS81Mkt0eThUckJJbGxROUFpU2FKYWpJNFBL?=
 =?utf-8?B?VlBIeUY0UG56Y25HNUJtcmZ0Q3RFc1E1MmF0TGhsVk1hOXM5WFJ6a0M0ZTBW?=
 =?utf-8?B?UXJXN0ZMd0hKTkNEbnNyUStMd1AySWhSZ04rR0haYm5Ib2g4bzNqOVo3SHdQ?=
 =?utf-8?Q?+Afe/ro+5/slC?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014)(7053199007)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TkY1MlZEa2hINHFkcFFhUDZNUmlhMFd5N0Z3RytjcjljOWYxK0VMY1lkdTJ6?=
 =?utf-8?B?Mkh6dlR4aUNPa28wRU1Ud1ZWSXRCKy9EM2RpSkw1NCswQ01KZDZ5TmZIRUlk?=
 =?utf-8?B?QkRrWXRtMEdXZHNZa2F5TVl3MXl2S1hIZU5oc3pSTnAzSnRUWXV4NVJJY0V2?=
 =?utf-8?B?dWxqQ2xBZ0RMRkpSdzVpYk9zMGZGVmsxSXM2TzlYOElydEFYL0JUSjhFTU84?=
 =?utf-8?B?ME94NjdlejB3RTJkTlZJU2ZmMnB2SFJhQzZRdExJZGxkcUU1VEp0SHNOZEhB?=
 =?utf-8?B?MWFHWTBkNHpKRlloNFdCQm5PQUZPZjhzbE1XVGlwM3EyTjVSNVJkdURqcmd3?=
 =?utf-8?B?OWlObVR5bFB4SHZBNjA4RHI2SEM5cHpWTVZhWnBvNmlxREF2d0oyZEw0ZU9m?=
 =?utf-8?B?aXQwNG9iWENDbk9GQzV4NWJkMlFPaUpnck5YcHR0a1p5YnAvK1gyTXcwOHht?=
 =?utf-8?B?dGpOSkxlSERIM2JUNU51cWh0TzBCdDJmVHhVWHVYeFhoWDEvMkZZUTU1WWFS?=
 =?utf-8?B?dTdOZGFrMS9RNEdqcHRQU0RLMmVRNjJsaFhoSk9FWTVQc1psSGV1dEVUWmxn?=
 =?utf-8?B?MVIvU3Bac0JxS3ZXK3NrcEdrZHhIWjJnQnNZM2JIVHhzNWhUUlJTblg3L20v?=
 =?utf-8?B?VDZDNTNrZEk3dVVPMlBQWGI3bzhCR2NTUzBGRmhZdFVrY0VUbXJOU2ZDNE9S?=
 =?utf-8?B?QWZVVTdCS24ycWcyMGFYeVpqVGZTTTZrdEk0T3h5aFZGZHkyUW9lSnlZMFdn?=
 =?utf-8?B?UHlFZmpoOXNxa3AzVjhYRW01ZUNTMGhwZ1RVZmxkS3ZqemNaZ1Y5NHR2LytT?=
 =?utf-8?B?S0QzbDU3cGJGUWRkZjE1V2JUbUxjS2d4RDNld1NmQWYyT2Y4WjFvbTljYXN2?=
 =?utf-8?B?aTM5YnNSUnhOZERvdEwrOC9KcXMwM3d6bkluV3NySXNyVW9pWjdvZlZZSUtG?=
 =?utf-8?B?RmI2aUFYL1ZYaVJkVHQ2dDV5aml5T05RSTVBOHhaUEc1a2wwRUtkVlZPaGJl?=
 =?utf-8?B?a01WRUx2WWMwRGhmK0xaU28wNDVoYzd3SGxyMUtMZU94T3ZmUFhNWUVlbVN5?=
 =?utf-8?B?UTZkWFRzQUc0bk5Ya3hQK0JTMWQxMXB3cy94emVwY1VWelZyb1FiNHZQb3dZ?=
 =?utf-8?B?RE9odm5vRDd0aHJsb3ltTjk3N1dhaVBqa2VQMlNiQ09nY2pDS0MrSUpRdlI5?=
 =?utf-8?B?a1g3bmRmQWJWeG8zcXhQdVdJVlZMWmJRNWsyZE54QkYzeHpNbzlWc2VPVGQ1?=
 =?utf-8?B?d2FWWlBFVnhza0gvOW9DTFkxZG9PV2NuR3F3Q3pWOExyL0s2T3VLUkpSOFBJ?=
 =?utf-8?B?RnRpbGNrZjZtZVNiYTZpSHROZVhBc2pneTM1bXFwUmo5alVORTlIOHo1VzMz?=
 =?utf-8?B?S0tTMjJJRXNqbDBFV0ZaenBsT0RXajdIQXlJSlFSWTFxTjI1RHVLeDNLSy9x?=
 =?utf-8?B?Z1FkZTgzYVhQejQ5ci9rSUVDZCtTS2FYazZIc1RXa2lVRlJ2OXhFQXU3VGVo?=
 =?utf-8?B?NEtRQjJJQittUml5R1kxL0RwUE10eVpZdWtWbmEyanA0WXh3KzJyZmt4UHla?=
 =?utf-8?B?U21jOVlJOWgySXdXbUJPY3k0UXlPRjltb3Y3SjJFT1EyamJIYXRaTHlBR2Rh?=
 =?utf-8?B?SnFiTTFWMkRMWXRRZmRoQkRJamt6M1g4MjlUVGkzQjU2UklJZE1NMmlweU5h?=
 =?utf-8?B?ZCsyZzFVQTdmd3Z2MUJrMzk2S093c3MwVERXblNDWGwySmR0b3RTWDVjR21K?=
 =?utf-8?B?WHRSdUFYTVA0aTRCeHBOQkFyUGtvYkhCNEtKREFOZ2FDRFk1YWVYYkgyRGF4?=
 =?utf-8?B?YzRSUkJ6dStWNGNmTS9wcHpreXA0SDRyRWs1b2RpSU9zandiUWZlZ29VdGRU?=
 =?utf-8?B?Tjg0UTVySUZDZXdBSjRDZFZiSnFzano5RDlvVEU3aEN2MWVZcHE1SE9DQk5z?=
 =?utf-8?B?QURVU2ZVOVFFeEE3RjdRZktOUnMzQ2Zabjd1ejZ5TjFhM1dNK05LTXpSZ3J5?=
 =?utf-8?B?S1VUMG00eVNmVGd0R3dJNzlaTGhZbS94ZHFlZ1pMYW92VkhCK0UxN2FDeEdy?=
 =?utf-8?B?Si8rUkI5WWd5QU43Z3ZqTGVWSnlEMFN4dkswUitpSHlpdVgvUEdkbG55NEwx?=
 =?utf-8?B?NVJ2ZXNyYjZsZkxOdDFrb24xY21Ebms4QlMrLzNEZXVZZHJPQ3JyajExeUI5?=
 =?utf-8?B?MFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdb225ac-c416-40a7-8c8e-08dd9ca021b8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 21:56:13.2806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q6c81YMuYcidDwVvisZgFUye6jhgBzWTAGR0GHxe07tHX/R9mwvh4EC4n67fiwfZbu3eVU4vucFztaz3vTVJAGxTAB85M8mZFyunBptNLHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5048
X-Proofpoint-ORIG-GUID: 2elgFIH62bcsUwUfSqC3hTunzF8UjYxO
X-Authority-Analysis: v=2.4 cv=VpYjA/2n c=1 sm=1 tr=0 ts=6834e380 cx=c_pps a=4IGGKwhCMA6ph+0beaNuyw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=vdplopQNjbzVHCqlbu0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mweKzTRC2vev3sG8ZjYA:9 a=c_k6z5Jrj9HSP-zd:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: GFddBT822zSNYun1WYIEfZ4Bq8c_UVZZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDE4OSBTYWx0ZWRfX6Sn9PJ+v+BKL psItuy9E9eLaM84q234jMppEWMSpr+rWnBPgW8MRl1Ybk4JOcYK/OF2Yj9sQVg4J7kyX8NAm0Dj cCqdEzUSHq6oC0aloKn6Owjn2RcJGtE8dqqlhZQ0NaWwQfrh2jvZKQMPxZY0HEKRPBiOKehI56x
 Uy5wxuTnM6gngWcuF45HZfVXdCAnkzUtEmMB6s5mq5e31HdTqEX9D8BPKqMOXoVxt5E7Q2G3BHb imaztarYd3D/0Mjwqp38bCxaRwA6Ia80CHpdyQbdqKJCKT4QpLTNBqbzh+g6RW+NPBWkM3OGuYW PieGai3p+Z6PegS1mHaboGRc3MUCwldas2ViSMEU93vpktb9JpcwUm7tW8erZ9MpOykHd7M3cEa
 4Ia6dj/v9SIkFV1CL2rCWcG5Z/QEipXDnLx0RIsqB7QndUZV2fKmMmSUD1sDMRuVt6jlL+Gg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_11,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505260189
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 21:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217278

--------------XbJkQS7rd98VOy8FEfxG1jNU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 54QLt2xL004218

On 2025-05-21 2:19 a.m., Khem Raj via lists.openembedded.org wrote:
> Fixes
>
> threads_pthread.c:(.text+0x372): undefined reference to `__atomic_is_lo=
ck_free'

Khem,

These changes make sense to enable clang builds. (Yay and wow!)

There are a couple of cases where we need to add -latomic,
here for openssl and also for qemu.

Is that an upstream <pkg> or clang/lld issue?
Is there a bug reported or should Sunil do that?

In general, how do you want to handle the exceptions?

I'm tempted to ignore the arm32 issue but I expect that some people will=20
not be
happy with that for several years if every. Right Ross?

 =C2=A0Thanks,

../Randy

>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   meta/recipes-connectivity/openssl/openssl_3.5.0.bb | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.0.bb b/meta/=
recipes-connectivity/openssl/openssl_3.5.0.bb
> index fddc4dbc813cd06333d72c38852db14ef39d25c1..0f5c28dafa314e52c3497a2=
e571b572475806e04 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.5.0.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.5.0.bb
> @@ -53,6 +53,9 @@ EXTRA_OECONF:append:class-nativesdk =3D " --with-rand=
-seed=3Dos,devrandom"
>   EXTRA_OEMAKE:append:task-compile:class-native =3D ' OPENSSLDIR=3D"/no=
t/builtin" ENGINESDIR=3D"/not/builtin" MODULESDIR=3D"/not/builtin"'
>   EXTRA_OEMAKE:append:task-compile:class-nativesdk =3D ' OPENSSLDIR=3D"=
/not/builtin" ENGINESDIR=3D"/not/builtin" MODULESDIR=3D"/not/builtin"'
>  =20
> +#| threads_pthread.c:(.text+0x372): undefined reference to `__atomic_i=
s_lock_free'
> +EXTRA_OECONF:append:toolchain-clang:x86 =3D " -latomic"
> +
>   # This allows disabling deprecated or undesirable crypto algorithms.
>   # The default is to trust upstream choices.
>   DEPRECATED_CRYPTO_FLAGS ?=3D ""
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216980):https://lists.openembedded.org/g/openembedd=
ed-core/message/216980
> Mute This Topic:https://lists.openembedded.org/mt/113225023/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------XbJkQS7rd98VOy8FEfxG1jNU
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-05-21 2:19 a.m., Khem Raj via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250520-clang-toolchain-v2-12-db97c2eb3756@gmail.com">
      <pre wrap="" class="moz-quote-pre">Fixes

threads_pthread.c:(.text+0x372): undefined reference to `__atomic_is_lock_free'</pre>
    </blockquote>
    <p>Khem,</p>
    <p>These changes make sense to enable clang builds. (Yay and wow!)<br>
    </p>
    <p>There are a couple of cases where we need to add -latomic,<br>
      here for openssl and also for qemu.</p>
    <p>Is that an upstream &lt;pkg&gt; or clang/lld issue?<br>
      Is there a bug reported or should Sunil do that?<br>
    </p>
    <p>In general, how do you want to handle the exceptions?</p>
    <p>I'm tempted to ignore the arm32 issue but I expect that some
      people will not be<br>
      happy with that for several years if every. Right Ross?<br>
      <br>
      &nbsp;Thanks,<br>
    </p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:20250520-clang-toolchain-v2-12-db97c2eb3756@gmail.com">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
---
 meta/recipes-connectivity/openssl/openssl_3.5.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.0.bb b/meta/recipes-connectivity/openssl/openssl_3.5.0.bb
index fddc4dbc813cd06333d72c38852db14ef39d25c1..0f5c28dafa314e52c3497a2e571b572475806e04 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.0.bb
@@ -53,6 +53,9 @@ EXTRA_OECONF:append:class-nativesdk = &quot; --with-rand-seed=os,devrandom&quot;
 EXTRA_OEMAKE:append:task-compile:class-native = ' OPENSSLDIR=&quot;/not/builtin&quot; ENGINESDIR=&quot;/not/builtin&quot; MODULESDIR=&quot;/not/builtin&quot;'
 EXTRA_OEMAKE:append:task-compile:class-nativesdk = ' OPENSSLDIR=&quot;/not/builtin&quot; ENGINESDIR=&quot;/not/builtin&quot; MODULESDIR=&quot;/not/builtin&quot;'
 
+#| threads_pthread.c:(.text+0x372): undefined reference to `__atomic_is_lock_free'
+EXTRA_OECONF:append:toolchain-clang:x86 = &quot; -latomic&quot;
+
 # This allows disabling deprecated or undesirable crypto algorithms.
 # The default is to trust upstream choices.
 DEPRECATED_CRYPTO_FLAGS ?= &quot;&quot;

</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#216980): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/216980">https://lists.openembedded.org/g/openembedded-core/message/216980</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/113225023/3616765">https://lists.openembedded.org/mt/113225023/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------XbJkQS7rd98VOy8FEfxG1jNU--

