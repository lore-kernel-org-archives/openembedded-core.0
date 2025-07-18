Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4756AC83F1A
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 05:35:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14271.1752816911161776696
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 22:35:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9294f15c75=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56I58ow02465713
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 05:35:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47ybv006cw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 05:35:09 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56I5Z93H2510183;
	Fri, 18 Jul 2025 05:35:09 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47ybv006cu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Jul 2025 05:35:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDBG/8uj/Mm5oX1LJDo6v3SLkF2+RFXlnt/QCexuaBsGSHDnI5seRCBYEVvFmy2eXXNFg5wfuxLlCSK2082vBWDjXvMgFbeHnKsffcaptf6RMH5NPU1BYwidcAgffi4vgNLjYYYNW57HU65TjzUYft2rsKKnT4ys/y/VAHEyp/pidhagM/j8WQpxZLz6uwkL6Qp+rKWMReBqjKOzyyqxKRYXpNTljnivcFO2+XgTKU/VKCyYFmMUys/0Ce1qiLxNVmKt6Q3j2wCQO/WO/qz1J0O2MxteUWIwolKyNDJoiuO8p4/X5NkVhWmSuSJdXAbsvF0Wg/SHFE/m2MfiJcTukg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sorURSCrt04axwiPV2LSeUkoxGlksERZYXX7hIsPNzI=;
 b=bL+RCczeMYlKF4P/HopjHCjVy/3Ber4PYkTi36IYSHo+tx47h6lQF7fp7wof5vtrNM17iR/GsmVgo2Rdaavvgtmo99REIG9DWnSsfqOdDpg2GzXVT5y5GGLnkosYuBebslYbAUXkwXMy19AHI8AvlLUC3vfAOgXMb1ZQffeIQijwPoeYI9cBY1d60L7Xs6x7vlv0To0ifAhk+txtVk7MJRbvQV0pC4f6vxhjmm9KFzZXZ+auzgIZPMt7JBp9cGVeHqE4HXLijTpTN5w7nWjWCBiy+RieGWnuaI2ZluKo1uzj4xXobxrmyBVruhTAaumubEKtB7B4QFDOcgNOsGv6WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA1PR11MB8575.namprd11.prod.outlook.com (2603:10b6:806:3a9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Fri, 18 Jul
 2025 05:35:05 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%7]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 05:35:04 +0000
Content-Type: multipart/alternative;
 boundary="------------L7pb6UPQHzvg3u67aOxnc74F"
Message-ID: <3cc18115-453e-41f0-b0b4-a8ea63e42b4a@windriver.com>
Date: Fri, 18 Jul 2025 11:04:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [walnascar][PATCH] glibc: stable 2.41 branch updates
To: Randy MacLeod <randy.macleod@windriver.com>, raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com,
        Ross Burton <ross.burton@arm.com>
References: <20250717085837.227414-1-Deepesh.Varatharajan@windriver.com>
 <CAMKF1spmKJ_OwsJLYkJJqA3a6MrkHsKCZeVNQUZg1Bx2hueBSw@mail.gmail.com>
 <b727f10b-b809-460a-8684-ee9984ece58e@windriver.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <b727f10b-b809-460a-8684-ee9984ece58e@windriver.com>
X-ClientProxiedBy: MA0P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::9) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA1PR11MB8575:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ec26839-ca72-4d73-92ca-08ddc5bcd879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|4022899009|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T0d0SWxRbE9jU1ovN241THdvQjdvYmxXVzUrMlFvaE9ZREJrckE4WUNKVEhr?=
 =?utf-8?B?VlBrc0FnQkZ5RjhqbmpGeXlDTnV1M2JCNFNWVTVGcEtoNFVSZWZmRXZqNm5j?=
 =?utf-8?B?VTRlTm9sS3FtaU9EYnd1RnhXTEpVcUd4UWJkNXVmcVBLWEg3RzlzTWxuL1RD?=
 =?utf-8?B?RGdnTVFIak1FdHpsSmxhejU1NmEwTVgvNE41V3NtTDROeDh2NmpOSXQySHlp?=
 =?utf-8?B?SVZBOHNTbFlMZlduSDVBVk0xb0ZLbHJPLzNIZENlUlRUUWRrdVF5UW5zOGk2?=
 =?utf-8?B?QWtQUUxUMFFkMlNIL2dKc1p2eEtURzFEcmFTWkM5NDJvWWs4RFpMQjUyYVNt?=
 =?utf-8?B?WGliTXJPTjVuNElEMnd6d2h3aXQweng5NEVVeE5SSm44RHJJMEZaSnlpZi9j?=
 =?utf-8?B?STNvR2o3ZEhlaDJBRE1HQjRsQldiNFV5aC9ldUlrcEN4UTNCaFNqL0JUK01q?=
 =?utf-8?B?c2JhNjJLdVFINVo4WSswcEhVbTI0MU5QVU5BK2IvTnBSQzNRcFk0aTh2ZXBq?=
 =?utf-8?B?VnBqUElqQlVZUCsxSFFuUzJQaEpvK21qQ2Q2MkNiSGY4aURNVUJPYzdPR0hL?=
 =?utf-8?B?RkNYRDNBY28vWWVlTlJET1JmR1U3dm5RODZuSmF3MnpITng5UG5DN3Yva0c0?=
 =?utf-8?B?dVVZOFVXMi9zR2JWRU9ac3RER1VmSjNDbHhvNHdUV3lBRHdYRjNBUmhYM2wr?=
 =?utf-8?B?MzBCeWN6YWZJSG1yOXJHOG1BanFMSVpTREgyaCtBdWFKS3BJRC9kbHFOSys4?=
 =?utf-8?B?enlENnAyb25nUE9pd2dLbEF3R05VeVZOUVh3Q05XQU5iVERxand2ZlVlc3gw?=
 =?utf-8?B?WWEzRktLbzJ3Z3YrVmpUT1dXRUJqS2QxbGx1N2ZMMjNEcFMvYjZzaEpsSlNz?=
 =?utf-8?B?YnBXRnVpYyt3a28vRWRHdnRoQzdKT1prVkFEQUxDUnFuU0NudEd2YkVVUGlo?=
 =?utf-8?B?NjVqMkNING1pdUViY2RtZVlXR1N3TlRtT3YxUHc5bHZ1RXJXbzM5aFBpZGY4?=
 =?utf-8?B?M3ptcnlWRFl6NjBpVE14U0xjYkk0WXFzdjdQT2xQWnpxNFVoL1hwQ0laRHBw?=
 =?utf-8?B?aTJDQys2RTBCWC81d2J6OEhWdE9PczlIV3hMRDByWmxmSU42d1JCYTlYdzZK?=
 =?utf-8?B?VzdMNmVFR0NtVEI1SFRXOGpYS3o3NWcvck1rbzZJNEMwaGt2aE5tOGpia1hX?=
 =?utf-8?B?WGxyVWwxNzkwTnExTC9kOGFlZExGK1JibHRldm1pdURPcGN1YWxIM2pJZGkx?=
 =?utf-8?B?NTJKcGxLNnp3L2hJMG5tVUZ2UG4vVndoenF4Nkg4UUYvbGJUOEdoa3RqRUFh?=
 =?utf-8?B?Zk95OWVlNktNSExleDEzSVduNTNHMjJuQWYwMzdFdWVsbVI1aDd6L2xmZnRn?=
 =?utf-8?B?ZnhZTk1iYWdCSXc3em9waDF0bXVMT2ZITFVvODFUUHIwTFN5N0dpNityOGlG?=
 =?utf-8?B?eDQxY3J2UWltcCtlYUQ4b2RJZ0dOZU9DRHNFSFlWK0kzUjUxczBWb0docFJh?=
 =?utf-8?B?eUw0Z1JHQi96RGNsaGZ6ZjNtU0l5UXFXa05LZkluRks3dFYrdWR4YU5tVk8w?=
 =?utf-8?B?a0ViNFdxUkw3bzBISGxWZjlHVU9mQWV1UGltdUhua3kxOWdOc3VrdCtlQ3Z0?=
 =?utf-8?B?U2VTSXRLcWVveXFyWVFNZWdDaFFHTlNRUUwxNXRtUXNvb01wVzhyTjVyQnNS?=
 =?utf-8?B?ZDJxSVVDdUpUQWF5WUtBUlVWelF4TGlLZVFtU0FsRmtVeUxEQ0M2VGZqU3VZ?=
 =?utf-8?B?THdZekRQMWpMK1FiU20zb3FiTHpEUzdQdGhqczNZaHFRVzFZam96OXhGUFlX?=
 =?utf-8?B?ckt2cHRhYW9iRzdDaDZxSndoN0FWRFd4ZXlEYXZyYWJWMkhxMzF6TnZoVVZJ?=
 =?utf-8?Q?NQUSapcjjz+07?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(4022899009)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aVY4SnhkZkRQMHc2TlVoVGV1UkZ0NGhsc0FmNUdNOFpmWTRMZnBteEJqaHEy?=
 =?utf-8?B?WWt0L1dTTUpNemwxcktvUHBnQmZpTlFQd3FMdnJlRm5EUXVvdWZpdG5Mb0VX?=
 =?utf-8?B?TDVwa2RBaTQ2QityMHpWeFdab1dyazVJSmtNR3dwcVpQdlN0bDNJZFhVN05H?=
 =?utf-8?B?STBKdE55TXk2RGxiY040M0VZTWd4cHAvOHQxaEdRZjFaTkV6N0FGQ3lUT2h2?=
 =?utf-8?B?YVdpSGpsMnR5RnVJd1FjQjhJdGsvUGFJWnJqL2JldzBQQUs0NzNScWg5ZU1s?=
 =?utf-8?B?SDBXcFA0c1ZpNTAyb3FVM0pTc1dhSUdiTzk0UllIaWFmVjcwaWU1ZTRWazRs?=
 =?utf-8?B?TDA0cnZRcnMwSkFtQVB2dm51QW1UbnJJUGZVcTc1M1JERDc0RkhEUWNuN1RY?=
 =?utf-8?B?WEp0SG1SWUw4Q2FSUEx2QnFVUTFEaEJ3K0lpbWlhZlViYzZSSW13ZjNrb0Zn?=
 =?utf-8?B?OUQxcFlSSklCTnE5QTQ0a1duTEw4WktaY1FuKzV4M3ZvTlZGRFpnODN5azVV?=
 =?utf-8?B?QXdZdkx0SXhIMW43RTNDOGNmclpLY3JHcW1QTUhCekNNaGxlZmg2eEkzbHZu?=
 =?utf-8?B?WnhWQmRTejFKMVFLeHhqTm45Ylp4U2VOQURrLzRqQTBqREpPU05EVGtlZ0U3?=
 =?utf-8?B?bTZ3VXFmUmpQN2JSeFY5N1hLR3gwb1paZTFXL0VWZyt0RzFQVDRiZlVSSGxK?=
 =?utf-8?B?MHRsa045UVhiMlhKdjc5QlJnN2IwMktVUkhKSVRjMVdxZ2w2cXIvSW5iYU4v?=
 =?utf-8?B?RE9GbEVzSWdlMDNtTE1xdXFOSHFDUFJxNnEyYlpoYUJzWDQ2VXdVeDZiYTVU?=
 =?utf-8?B?Uk1jTEdyN2VzNmFDSWNTbWJjNll6REpReVNyZ0VlSHZUem92Q2RsbCs0NXEv?=
 =?utf-8?B?MUY4bWZjbS9STUtOU0tPVVFYTEtncGdGTTVGd3dQZExJbFBFTTVpQ0JqK3h1?=
 =?utf-8?B?T2thY29wVi91UGpac3Z2Vjd0dkduWG12Z2U2MmR0VmE5MTdvbDhPQzl5bjJW?=
 =?utf-8?B?NVZnTUN6K3RldzVDeGdlMDRNcEt5K1FuUHFURjVQSS8yRklvTG4rcDlWSzdw?=
 =?utf-8?B?b1VlYnF5R255ZnlYa0c2WHRBbm43QlY5TlZRNmszMVBta1VQdjBpV1FWcnUr?=
 =?utf-8?B?RGladVBXTllFakJwMW9xNFJkU2FiV1E2MEZCZ1VaakZ2SUh4NXNYeHc1b3Np?=
 =?utf-8?B?c1dhYTJDdmV0UkxmMmttbDh2NlFPYlRsRE1zcndnUFBCbVdXYWxTcE5xMmFI?=
 =?utf-8?B?Y1R4QUtNWnBxQkMxT3VPS3BGWnhGelR4cUdDQVhNemRxdWZsNE81Y0NEZjJ3?=
 =?utf-8?B?cmJTTmE2NVBCSXQxL3JjTkJrcVFKVjlnYWducVNvbm1aS3o2a0tuR2QzNEtk?=
 =?utf-8?B?S3QrSlQzdUsxbXllZ0hiZDBONVU4S0RBenJMS1UwSnlOeXBLY25JeklDQzlx?=
 =?utf-8?B?Z1dsVk1XVGd2UzF4ZFoxMkY2cnFMRWRqQTFMY1FzN3hxSVRDaXhDYnYrZzZG?=
 =?utf-8?B?VnFSOHdET3d0VUlBeFRPTFptakFONktOT1FKaGRPOFlhUXhEOXNSanpmV2wr?=
 =?utf-8?B?OElmaU9rNCtpcHdUaDVqbWU2dzIvcXQ0R0JubHBjM0U3ZmlWdDVlNjRqQWpL?=
 =?utf-8?B?R2lzZTBzcjVULzJqZHNGQWxMc1psYlB2dUhzS3d6QnRBalBhSmszd25LWm44?=
 =?utf-8?B?c3kzQUVjZTJreTR5V1NlYWxBNHJEZUkxUWZnVXV1ZUlHa2NnaTBVY3VvWTZL?=
 =?utf-8?B?Q1ZEZjBQZ0xKL1dyak9uL1QwVmxhVnQzU1R0bS9Qbko5Z0Q5K1ZvenlocGU2?=
 =?utf-8?B?d3RpWFkzb3ZnL0x2M3lRMGV2dENqY3pudHpoUm9FZCtyRmVha0dDTmFlZk5F?=
 =?utf-8?B?VzU3M0pvNUJtUTNtUW5TSHFDdkt4c1lrcXlSa3F3aFRRbzg4Y29RZkdmZHQ0?=
 =?utf-8?B?NldkdEtLMzlHSldpNHRmaXA2ek5SVFVzaEp2SzNKYjhxN1RUSTAzRmVKTWxv?=
 =?utf-8?B?QnFJdExPczVqanFrWVNVOXd1OXdKazBJU0QxY2hKeUUwRnU5amszYmIyYzlh?=
 =?utf-8?B?SFZrRHJhZUFMbXN5VXdadENRUnM1Q3AydGNPNzBkYnJoZTg4QnFZQnF4U1BV?=
 =?utf-8?B?b0N3bk9xYzB3ckJ0cklkdkdNanRCanJKMHBtbUN4Q3N3b3RnRkd4Ymd5ek9O?=
 =?utf-8?B?YytsdFpjZTJVaTVZSlFPTUp3eUxBcFIrSHFBUEFzaU8vTmtmcmtMSVBicnVW?=
 =?utf-8?Q?SWOfD/lgl/eHM2Z80eZewKJTD40Obig82kQZpLaQTM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec26839-ca72-4d73-92ca-08ddc5bcd879
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 05:35:04.6711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5sMpX6FY95GFpSKKaMCDEYksN0adzeuKUgnPEyGsW/6o86G4jb5bd4Ei5f961MntFS1aI4AzUVPozYr1clSbJU/oXt0ChMW2zP3vVLFqNNS3gOKS/r16k755q87KsY/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8575
X-Authority-Analysis: v=2.4 cv=dbCA3WXe c=1 sm=1 tr=0 ts=6879dd0d cx=c_pps
 a=xvwQcxOyB39F00Ilg3n1Ug==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=f0SDuQZ7lDsKr-VwdhwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=NRHxsxtgZx9PW38AkZEA:9
 a=MnbOrNW1eendGSfl:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-GUID: TawltGXvWurqSfSu-HRVW9h_LbKTId6N
X-Proofpoint-ORIG-GUID: BRpaGi1_FIA1YuNuxHs-McgkErwYotJW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDAwMiBTYWx0ZWRfX5T1fiyTNrUHU
 HzmX3GotB5RA39fIuxjUmna43arB6cBNHu4vaBpJWKk3pdVBI72j0nwwfLS79P+L3+MxocXGmqd
 +a1BsEslAa7krkxxXXQJ7ikdeqk+yfY+GLwLNpwU/bQilZ81Z0dkQBJ9hbE+DvH0eGgWKxOTBSu
 E9G/+t84rh1nFk9HpMUUkhzdbUoR9Wnamah5ioTrOxkmhaP1BGJabrlA7uXk5iOjATRSuINBlRs
 t4kUlTdx5P45udyzO19jABXM7dvj0FDmn7x8pdfyjTIklFIhi4hG/h4KUqEdW8jr6f0CYIb76Sp
 IMfv/MhkGAH6HyY5bt6MDjEcQ1h2eSNDa5xTMOc9j/BzTiilKjuel+12w1YU+JjamrE0QPUjV/P
 kkjoCRvy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507180002
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 05:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220571

--------------L7pb6UPQHzvg3u67aOxnc74F
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 56I58ow02465713


On 18-07-2025 01:17, Randy MacLeod wrote:
> On 2025-07-17 12:40 p.m., Khem Raj via lists.openembedded.org wrote:
>> LGTM
>
>
> It does look good, almost too good...
>
> Deepesh,
>
> Please explain the why the UNSUPPORTED and FAIL results have changed=20
> so much for the better in this case. Looking briefly at the changes, I=20
> almost expect this sort of change but I'd like you to review, check=20
> the linked bug entries and provide a v2 that summarizes why the=20
> improvement happened. Also, did the number of tests change? The sum of=20
> the Diffs is not zero ... In the future, when the Diff is not zero you=20
> should try to summarize what happened so people can benefit from your=20
> knowledge and your easy access to the log files.
>
> CCing Ross so he knows that we expect a v2 with a revised commit log.
> ../Randy
>
Sure Randy, will send a V2 with additional information.

Regards,
Deepesh

>> On Thu, Jul 17, 2025 at 1:59=E2=80=AFAM Varatharajan, Deepesh via
>> lists.openembedded.org
>> <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>>> From: Deepesh Varatharajan<Deepesh.Varatharajan@windriver.com>
>>>
>>>      $ git log --oneline 0c76c951620f9e12df2a89b2c684878b55bb6795..6e=
489c17f827317bcf8544efefa65f13b5a079dc
>>>      6e489c17f8 Fix error reporting (false negatives) in SGID tests
>>>      11e634ccf3 support: Pick group in support_capture_subprogram_sel=
f_sgid if UID =3D=3D 0
>>>      61e461ed0c sparc: Fix sparc32 Fix argument passing to __libc_sta=
rt_main (BZ 32981)
>>>
>>>      Testing Results:
>>>                 Before     After   Diff
>>>      pass         5807      5813    +6
>>>      xpass        4         4        0
>>>      UNSUPPORTED  164       161     -3
>>>      FAIL         280       257    -23
>>>      XFAIL        16        16       0
>>>
>>> Signed-off-by: Deepesh Varatharajan<Deepesh.Varatharajan@windriver.co=
m>
>>> ---
>>>   meta/recipes-core/glibc/glibc-version.inc | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes=
-core/glibc/glibc-version.inc
>>> index 2d31131e03..a2cfd0f308 100644
>>> --- a/meta/recipes-core/glibc/glibc-version.inc
>>> +++ b/meta/recipes-core/glibc/glibc-version.inc
>>> @@ -1,6 +1,6 @@
>>>   SRCBRANCH ?=3D "release/2.41/master"
>>>   PV =3D "2.41+git"
>>> -SRCREV_glibc ?=3D "0c76c951620f9e12df2a89b2c684878b55bb6795"
>>> +SRCREV_glibc ?=3D "6e489c17f827317bcf8544efefa65f13b5a079dc"
>>>   SRCREV_localedef ?=3D "fab74f31b3811df543e24b6de47efdf45b538abc"
>>>
>>>   GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dh=
ttps"
>>> --
>>> 2.49.0
>>>
>>>
>>>
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#220549):https://lists.openembedded.org/g/openembe=
dded-core/message/220549
>>> Mute This Topic:https://lists.openembedded.org/mt/114200019/3616765
>>> Group Owner:openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub =
[randy.macleod@windriver.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>
> --=20
> # Randy MacLeod
> # Wind River Linux
--------------L7pb6UPQHzvg3u67aOxnc74F
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 56I58ow02465713

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 18-07-2025 01:17, Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:b727f10b-b809-460a-8684-ee9984e=
ce58e@windriver.com">
     =20
      <div class=3D"moz-cite-prefix">On 2025-07-17 12:40 p.m., Khem Raj
        via lists.openembedded.org wrote:<br>
      </div>
      <blockquote type=3D"cite" cite=3D"mid:CAMKF1spmKJ_OwsJLYkJJqA3a6Mrk=
HsKCZeVNQUZg1Bx2hueBSw@mail.gmail.com">
        <pre wrap=3D"" class=3D"moz-quote-pre">LGTM</pre>
      </blockquote>
      <p><br>
      </p>
      <p>It does look good, almost too good...</p>
      <p>Deepesh, <br>
        <br>
        Please explain the why the <span style=3D"white-space: pre-wrap">=
UNSUPPORTED and </span><span style=3D"white-space: pre-wrap">FAIL
results have changed so much for the better in this case.
Looking briefly at the changes, I almost expect this sort of
change but I'd like you to review, check the linked bug entries
and provide a v2 that summarizes why the  improvement happened.
Also, did the number of tests change? The sum of the Diffs is not zero ...

</span><span style=3D"white-space: pre-wrap">In the future, when the Diff=
 is not zero you should try to summarize
what happened so people can benefit from your knowledge and your
easy access to the log files.
</span></p>
      <p>CCing Ross so he knows that we expect a v2 with a revised
        commit log.<br>
        <span style=3D"white-space: pre-wrap">
../Randy</span></p>
    </blockquote>
    <p>Sure Randy, will send a V2 with additional information.</p>
    <p>Regards,<br>
      Deepesh<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:b727f10b-b809-460a-8684-ee9984e=
ce58e@windriver.com">
      <p><span style=3D"white-space: pre-wrap">
</span></p>
      <blockquote type=3D"cite" cite=3D"mid:CAMKF1spmKJ_OwsJLYkJJqA3a6Mrk=
HsKCZeVNQUZg1Bx2hueBSw@mail.gmail.com">
        <pre wrap=3D"" class=3D"moz-quote-pre">On Thu, Jul 17, 2025 at 1:=
59=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:deepesh.varatharajan=3D=
windriver.com@lists.openembedded.org" moz-do-not-send=3D"true">&lt;deepes=
h.varatharajan=3Dwindriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"" class=3D"moz-quote-pre">From: Deepesh Varatharaj=
an <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Deepesh.Varatharajan=
@windriver.com" moz-do-not-send=3D"true">&lt;Deepesh.Varatharajan@windriv=
er.com&gt;</a>

    $ git log --oneline 0c76c951620f9e12df2a89b2c684878b55bb6795..6e489c1=
7f827317bcf8544efefa65f13b5a079dc
    6e489c17f8 Fix error reporting (false negatives) in SGID tests
    11e634ccf3 support: Pick group in support_capture_subprogram_self_sgi=
d if UID =3D=3D 0
    61e461ed0c sparc: Fix sparc32 Fix argument passing to __libc_start_ma=
in (BZ 32981)

    Testing Results:
               Before     After   Diff
    pass         5807      5813    +6
    xpass        4         4        0
    UNSUPPORTED  164       161     -3
    FAIL         280       257    -23
    XFAIL        16        16       0

Signed-off-by: Deepesh Varatharajan <a class=3D"moz-txt-link-rfc2396E" hr=
ef=3D"mailto:Deepesh.Varatharajan@windriver.com" moz-do-not-send=3D"true"=
>&lt;Deepesh.Varatharajan@windriver.com&gt;</a>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-cor=
e/glibc/glibc-version.inc
index 2d31131e03..a2cfd0f308 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?=3D &quot;release/2.41/master&quot;
 PV =3D &quot;2.41+git&quot;
-SRCREV_glibc ?=3D &quot;0c76c951620f9e12df2a89b2c684878b55bb6795&quot;
+SRCREV_glibc ?=3D &quot;6e489c17f827317bcf8544efefa65f13b5a079dc&quot;
 SRCREV_localedef ?=3D &quot;fab74f31b3811df543e24b6de47efdf45b538abc&quo=
t;

 GLIBC_GIT_URI ?=3D &quot;git://sourceware.org/git/glibc.git;protocol=3Dh=
ttps&quot;
--
2.49.0




</pre>
          <br>
          <fieldset class=3D"moz-mime-attachment-header"></fieldset>
          <pre wrap=3D"" class=3D"moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#220549): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/220549" moz-do-=
not-send=3D"true">https://lists.openembedded.org/g/openembedded-core/mess=
age/220549</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/114200019/3616765" moz-do-not-send=3D"true">https://=
lists.openembedded.org/mt/114200019/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated moz-txt-link-freetext" =
href=3D"mailto:openembedded-core+owner@lists.openembedded.org" moz-do-not=
-send=3D"true">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub" moz-do-not-send=3D"true">https:/=
/lists.openembedded.org/g/openembedded-core/unsub</a> [<a class=3D"moz-tx=
t-link-abbreviated moz-txt-link-freetext" href=3D"mailto:randy.macleod@wi=
ndriver.com" moz-do-not-send=3D"true">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
        </blockquote>
      </blockquote>
      <p><br>
      </p>
      <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
    </blockquote>
  </body>
</html>

--------------L7pb6UPQHzvg3u67aOxnc74F--

