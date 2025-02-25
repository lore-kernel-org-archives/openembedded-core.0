Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B94BC021A4
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 02:03:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2168.1740448989408319462
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Feb 2025 18:03:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41516efc5d=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P1kECe014599
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 02:03:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44y3t2k3ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 02:03:08 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51P237h6007997;
	Tue, 25 Feb 2025 02:03:07 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44y3t2k3kq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 02:03:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBuj4U/C5Tjzm9zS4WRD+Dn8DQoBya9EX1mSRYd010ucB9lKo21jGmf4+Xcq8q4aZjLYFVpjcWPJWEnRFa5HvuKVuxcxrIbCD6hH3ZEKi8M39uyc4C3x6n2fFOFXpPWRvn/w4HISR2z1DmlOS947YBLDXGhdfwzr8l92QvBB2t5SPUozyUzIGID8ISS3U2oXz2n1NVq/DUJtlUwJbX2bgzCE7KvzvKUD6wEop1z9/SYpEkF/e/l5Us180dq5iQwMfviUII9hFd4KR/jEWnw/AItNbwvl2uCWRHqmZqQr5RAolOGs6rdGkiccUFyYAPa6EQi9Ay4ljkpFkp03j6nUnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B853wMPJCTBBbEPDoSuSTzrOzmp++XbLmpYDXY1hWx4=;
 b=yac1daWbnPrTae1TRvwKsWtg701q22r6y9vn9nGxEuEL39Mb9G0J/Pe8N8T7tsMkWVqShZXXWRlCmjZSDsl34DL3g98gJopMe34TOMuL1FIsTUval3C6UFsMKgiz+ebtXKYslujYvqVnwAkUOSfECf3kPReKryJ0FxuncTGlxOkvE6irzylFnOUIbku9fivK1cRljrM4doXM2B3+TxS4g1oGmnqahH0Z0SCqsyDxzTBlsKD84rQYutSlaUkU2CGvr0nUJ5tr+yJaQC+QLDF9Co7sVci1oJYCHPvAOcjZwh4vjwMB1LzcJK6kRQsBRJit7l4fUQHmx7M+7Hyb+5zShA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA1PR11MB6194.namprd11.prod.outlook.com (2603:10b6:208:3ea::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 02:02:59 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 02:02:59 +0000
Content-Type: multipart/alternative;
 boundary="------------DvUfiUK6ni00pUYkX3LBrvI4"
Message-ID: <23e2fa72-4225-4dfd-8d5b-cd8afe03b411@windriver.com>
Date: Tue, 25 Feb 2025 10:02:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] Revert "python3-ctypes: depend on ldconfig only
 if distro-feature set"
To: =?UTF-8?Q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>
Cc: openembedded-core@lists.openembedded.org
References: <20250220035724.1460062-1-changqing.li@windriver.com>
 <nvmjowjub7hxr4wz4njvcwdi5mo2g4ppiixrsdgr5zrqs3dwch@mrwc5mgkqid4>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <nvmjowjub7hxr4wz4njvcwdi5mo2g4ppiixrsdgr5zrqs3dwch@mrwc5mgkqid4>
X-ClientProxiedBy: SI1PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::11) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|IA1PR11MB6194:EE_
X-MS-Office365-Filtering-Correlation-Id: 47308536-958a-43cc-d4d1-08dd55408739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TUI4OUw0cFNlc3dIQ1RhNXNHRmN0ekF6aDZsN0pBeU1VYUdkMnVTZUFFbkpJ?=
 =?utf-8?B?eE1rd3lIQ0hJY0I5Z3pVNFhyRnZQbmgwVDJoUjJEUHlaMnlJTmErUW5BRkpE?=
 =?utf-8?B?OWJFQm9ETkJYL3lzelhLZkQ0aVJGRW5rRUViMXNnZEkwY0VUdnZWUm5oQjlw?=
 =?utf-8?B?cktGYUs1QmJuam5ieG4zV0RPZUZpWVJSQXphdWgxYmIwaE9yaEtwRm8zUGtC?=
 =?utf-8?B?UENUclhZcC9vN0pNWElMbW1OVmN5OEZ4WmJuWDdldW5hUGZLYlJrbHZvQ3ZX?=
 =?utf-8?B?YnUrTEs5UFZJeTVaU3pKbUlIRldRU2QvamtEM1VNUUtSTW9JbXdOTWVIUDB6?=
 =?utf-8?B?bWtMMnRFR3UzSjFDaE9mNXdBeXNKSnFXTEN4NlgvMUFKTGlmZWNyWmZPNlYr?=
 =?utf-8?B?SFMzYVRCM0ZmaUlVWER5UUlhWU95aVFzVFFYTGFjZThOU0dhdTNJOTBXMi9I?=
 =?utf-8?B?dlNzcDBYZy9hYUJpTEpqSU5wRjNXcnQrQlorS2IrendCblNxTjNYT0Jyb0xm?=
 =?utf-8?B?bFlTNkVQWFRFYmNaY3lvNGlJWjY2dk9EZ3Znc243R01CWU1NK2plYnBLOEM3?=
 =?utf-8?B?VDJsUmE3MFpxTkhxWFR0ZU82MlJxTml5bW9STENJOXN5Q3Q4bExEMG5FbE90?=
 =?utf-8?B?QUVGR0h3M1ptMDk1WTFBVTFiK3JSYWszbmxXVDJTbjNOUzYrUU1rR05aVHNX?=
 =?utf-8?B?Nk1rR0IvVE5sTEpaNmtTd2ZrckFKdEI2NDZ0VHJORWdQcEdvZVJhaG9KZ0Nw?=
 =?utf-8?B?ajRrQ3dQM09iYXhFTS9Gb1NaNVVLazJXZ1d0MXNFVWc2S1lPaHNMemk5OHdC?=
 =?utf-8?B?NWFMcE1nZEp1ekdXUCs5RndhMDRzUENpMnpIYkFQczc4RWlML015Q3VJaEpi?=
 =?utf-8?B?UVJ1YWZKcHNWZk40RitwY1dGd2xLU0dQRVRRcEkvU2IyQ0JHbUlzS0ZDc3Bu?=
 =?utf-8?B?U05VVi9qRkc0Zko0Y2FsVGZXTHJSMWtiU2NJd3NGRVlKSnZuQWdyWjJoa1Ji?=
 =?utf-8?B?cVRjV2NuR1hXT3hLRk1aY0NXY2Q3NkdQUndZRVMvdUVlQTYvTFhEQ3ZkdDN4?=
 =?utf-8?B?TC82bkhBaGEvajQ1cnFHVVdvVmlsUzJ1emlKZE5mQlhyK0lpeDdkQUdxbG8x?=
 =?utf-8?B?MzZjbEVpTW5oRTFteXNSYkdhVXAzY2hLV0FDOXl4ejE1SmVOd0lOdFdRRGVz?=
 =?utf-8?B?akMrUmlENGF4K3NvUlJzR0hUbHZRM2IvN0l5SWNsRUs2TGxaTHQ5MTBXbWFY?=
 =?utf-8?B?V1Rldy92NzRhT1R1TlpOWnV5azZuM1lMZjFPbUtDa0dTd0RaQTBSaWtTN2l5?=
 =?utf-8?B?ek43YjNCU0pRdlpFRUwyOElUUjAzT05wRkhjOTVvUS9ScTZpN2RWa01waU14?=
 =?utf-8?B?czJXOWZ3dEQvM08zd2FxOVNEUVBvMHVhRXdOZmxXcWR3LzlnTTF3Y1c1dEtB?=
 =?utf-8?B?TzEyUGV2cmgxWVE5a0E1NHN2K0xLbUtWZDNjaC9iQmJJRzBvTGRPV2pMN0xP?=
 =?utf-8?B?elFNajJySXRnMzZ0YUNzTlp1WitUa1V5U1l0dmVrOGE4aEhBOFRDdVE5VzlJ?=
 =?utf-8?B?NWJaa1I1cnpocDlNblB4VkNicVFhdUhWcDFxa05yVGxISGhkN1dKQXZBQ3Nl?=
 =?utf-8?B?ZlNrV0lDVE94TnFEb3M0ZWt3czRHK3ZFR3pteDNJOEpMWHhaWkszNFRsWGtm?=
 =?utf-8?B?RytWWFRBS25pcGRidWNzcE9KMkZ2NjcvdktRWkFPb3F2Y1U0S3VyZHJDVHJF?=
 =?utf-8?Q?UKqU0GatxDRug1dWuQleB69sOmu7qTusk3wT7X3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M2ZIM3hJdmR0elN1OWxQVWJOTnpjSVJJTjNGMDFtVkdhdngxVEZSZkhjUmsx?=
 =?utf-8?B?aldjL1FWZ29wNWFvTjA0NDB1eHJYNFh6eEYybUJCdm9GYVdVUXhhNmUwWlFq?=
 =?utf-8?B?eDlWUEJ5Q0NBd3NPWjBRNGNIY2pORzZHUURYM3QyWTYxOWl0MTdsSDVKZzdU?=
 =?utf-8?B?SFNQWmxPaFZTVCt4azA1MnZKcm5VUUFPOEgrRkNPano1ZVdYbWNNME9jQzFS?=
 =?utf-8?B?eHFzbHNrYjEydjZaM0szRVF5aWFkZTVlSUkyWkNHZnlCOEVJaEVoWHZjTmo4?=
 =?utf-8?B?bUJ2bWlzc2JyWGVRQTUydmdhdEU0QjBBSFhLTnJvZUtIZmU1Nm1rbGMxSTds?=
 =?utf-8?B?VDJ5WTdtSTRFRUs5Z3lFcy9pZjNxZzQ2Ym0vMmZLaHJXN2E1a2pMR2o5dmhh?=
 =?utf-8?B?dkJrUmM3bXd6cWlBTGNWb2VtMC9hSUtWcjRqUFlyZzhxazQwVnY1bXV3VDQ4?=
 =?utf-8?B?ZmdMZDJvQ3E0V3E0MUNacFZjZDJrVHF3SU9LK21GZGorY2dZUCtjMVF4TmNk?=
 =?utf-8?B?Wmc4T1dWU0FudUVjQVZvZDJGUFhvaGl4MVgyb3lMV1RFamNTWk4vTWcwaUI0?=
 =?utf-8?B?blZjSHV4RjZvb2pjMFlEeTZzMVlqM0M0UHpSeVFGWnl4RDc5U0c3NHhLMzhE?=
 =?utf-8?B?MlhRczBYZEo5SWZ2OVpCclNHVkN0VkxYT1pVSXdRd1Z1V1BZbXFjNlByVGpX?=
 =?utf-8?B?TTlOUUpMNDIrQ2JHbGV5MVNlVEZia3ZwWU9vNnFDeEVpaFM1L1dhY1hhVjNO?=
 =?utf-8?B?RE94ZTJoQ1hFci9FS0Y5bEhaMVhhdzVSMXNBVnVydXRnVXc0QWUyVHJEOG93?=
 =?utf-8?B?dkhJYmlaQ3h4TllEU2wyWG9BelZHOWxxTlRLUGFhNWVRaWNhSWliVFRkK0pn?=
 =?utf-8?B?emhQUTlySXV3dEl4bTk4QUFLMGV6TGRiVTBSbG1aV05iMEp6dDJVTW1YQk1q?=
 =?utf-8?B?THJjbXk0bVQ5cExGWTBuSG1sUlp3ODVDZFUvK3IvcytzN2MyYVRFVW9XSlpu?=
 =?utf-8?B?TXdhSTlaUHBpc0k4Sm9tOXc3ZG9uNjg4anBtQU5JVmpYN3c0eHUzckVUamVp?=
 =?utf-8?B?WURuTHljbFdnTmt4bU4wR20zSUNSWXNHRUlmMExicjRPcHR5YUh4N0pNMTVw?=
 =?utf-8?B?aStaN2FOY1NQaEEyNnh5L1ZNUzRRVC9BRVptSWlEUTVqa1N6dXdKUmpkajM5?=
 =?utf-8?B?WjJDUU5TbVVHcFdwRTF0aDhJNzEwM3Z2SFllNjI0SmhTUjQva3MxQzRoeEhy?=
 =?utf-8?B?eDNPLytLR1FsNjduOWZzZFc1VmRXVjMwYjF3c1VoeFM2cU9adUw2c0E3KzA2?=
 =?utf-8?B?QXZDK0wzU0pSRnRRR3BlWUw0NFU4MElNWDdFc21NR0F0RVQ2NXpiT1lWUkFm?=
 =?utf-8?B?dGk5elA4QzNqYThYa3pJS28zcEVLRGNoS1p4N1BrZWNCNUFLdW84dDB2MHNE?=
 =?utf-8?B?cXBmdlVqMUlXcGorOU5ObzdtYWFmMjg5c05xbHRMS01Oa05EMGt6eURaNUll?=
 =?utf-8?B?VmtiTTJaM3NSNC9jSFlsM2ZVbGp5WnRmbkJjL3lJV0I2Yk5KV3hLZXNiNkNI?=
 =?utf-8?B?Z1UrMExpdEFTMy9VbWlGS1R3eHdNcW9FNEJwTkVEWlkrTkF1RVQ5RG1wTWl3?=
 =?utf-8?B?T3ZVc0c5cVkxUENoazBWdFV3Rnc5b2JhWUFOaXFDK0ZFODZlZEcySlJacHYw?=
 =?utf-8?B?N2U3WnVtby8xYzNvRFZtemNsRW9sQjB1eldGQmVpZzRvTDNxcFEvcEdlTjA1?=
 =?utf-8?B?QjFvc0J3WklYQ0tIRGltS0lFc1c1NXQwOEpSMmIyM3dzcGxkcWIzb0RKUGtK?=
 =?utf-8?B?QTdRU0twZ2RCM29KZENRYnpFUDh5SE9HSVlRaHJQVDRLVHBENk0wWjNTN1RB?=
 =?utf-8?B?aVgvNHhmdHc4LzZ4eU5Mb2RxWGgyKzVURWIzSVZxNmNLR0M3eHNDcXNIQWNz?=
 =?utf-8?B?QTFQSFliUUVuRVFlM1VTeXdaeFNzOWxPd3Z3VS9LdFg4ZXlCb1Q4cHpPUDVy?=
 =?utf-8?B?UXQxbmRHWDljL2FVMWMxdmhtOU9hTWw5ZWVjSVlwbDk5WG1ZVThPVi8yOGp4?=
 =?utf-8?B?Y3FGR05GNUxxNE14aGZ1NFBYWWowQURjaDN0VklyTEJidHJMVXRwL1NNbDMx?=
 =?utf-8?B?Q1VYN2Zya0lEbDU3Wnd0TnJHOHhFSDBTZ1E0QzFQNDRiU1NkdUt2SHcxUjh3?=
 =?utf-8?B?Y1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47308536-958a-43cc-d4d1-08dd55408739
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 02:02:59.3473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwhZrpAKHaURLs/qCegvPZ3tQ76G8ek00JGAMNEWtYRkJbfrAJiXhaEs5ZuySXQ1V5fJFP9t8wBJ7w51nGbn87QvAmBAI6rx/ruZjA1PClw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6194
X-Authority-Analysis: v=2.4 cv=eoIlzppX c=1 sm=1 tr=0 ts=67bd24dc cx=c_pps a=F7QtyTBSWJEVkVFduP+sHw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=Q4-j1AaZAAAA:8 a=l_88qD64AAAA:8
 a=6q5ANwHFTC3T3MT6qykA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=wvPkM9v7g1_ikmSEda4A:9 a=Rtq7SB3vzJt-WMqI:21 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=sgQlBcfP8EIGAiSWe9Wv:22
X-Proofpoint-GUID: RtEZGKRFVxx6HFn1OgBr4iBhCQkHqckO
X-Proofpoint-ORIG-GUID: C_123icz_12giX_HM_yeRjggadO_ltF5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_12,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502250012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 02:03:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211861

--------------DvUfiUK6ni00pUYkX3LBrvI4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51P1kECe014599


On 2/25/25 07:36, J=C3=B6rg Sommer wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Changqing Li via lists.openembedded.org schrieb am Do 20. Feb, 11:57 (+=
0800):
>> The reverted commit causes regression when ldconfig not in
>> DISTRO_FEATURES, before, without ldconfig in DISTRO_FEATURES,
>> ctypes.util.find_library(name) can find the lib if it is installed,
> Hello Changqing Li,
>
> Did I understand correctly that gtk+3 was found before, indent of ldcon=
fig
> was in der DISTRO_FEATURES? But after the change, if fails.
>
> Where is libgdk installed? In /usr/lib or somewhere else?

Hi,

libgtk is under /usr/lib. See:

root@qemux86-64:~# ldconfig -p | grep gtk-3

libgtk-3.so.0 (libc6,x86-64) =3D> /usr/lib/libgtk-3.so.0

root@qemux86-64:~# python3

Python 3.13.2 (main, Feb 4 2025, 14:51:09) [GCC 14.2.0] on linux Type=20
"help", "copyright", "credits" or "license" for more information.

 >>> from ctypes.util import find_library

 >>> find_library('gtk-3')

 =C2=A0'libgtk-3.so.0'


For the case that ldconfig is NOT in DISTRO_FEATURES, gtk+3 can be=20
found. After commit "python3-ctypes: depend on ldconfig only if=20
distro-feature set" is merged,

ldconfig is not installed, so ctypes.util.find_library cannot found gtk+3.

//Changqing

>
>
> Bye, J=C3=B6rg
>
> --
> Navimatix GmbH           T: 03641 - 327 99 0
> Tatzendpromenade 2       F: 03641 - 526 306
> 07745 Jenawww.navimatix.de
>
> Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
> Registergericht: Amtsgericht Jena, HRB 501480
--------------DvUfiUK6ni00pUYkX3LBrvI4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51P1kECe014599

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 2/25/25 07:36, J=C3=B6rg Sommer wro=
te:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:nvmjowjub7hxr4wz4njvcwdi5mo2g4p=
piixrsdgr5zrqs3dwch@mrwc5mgkqid4">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

Changqing Li via lists.openembedded.org schrieb am Do 20. Feb, 11:57 (+08=
00):
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">The reverted commit causes=
 regression when ldconfig not in
DISTRO_FEATURES, before, without ldconfig in DISTRO_FEATURES,
ctypes.util.find_library(name) can find the lib if it is installed,
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Hello Changqing Li,

Did I understand correctly that gtk+3 was found before, indent of ldconfi=
g
was in der DISTRO_FEATURES? But after the change, if fails.

Where is libgdk installed? In /usr/lib or somewhere else?</pre>
    </blockquote>
    <p>Hi, <br>
    </p>
    <p>libgtk is under /usr/lib. See:</p>
    <p>root@qemux86-64:~# ldconfig -p | grep gtk-3&nbsp;</p>
    <p>libgtk-3.so.0 (libc6,x86-64) =3D&gt; /usr/lib/libgtk-3.so.0&nbsp;<=
/p>
    <p>root@qemux86-64:~# python3&nbsp;</p>
    <p>Python 3.13.2 (main, Feb 4 2025, 14:51:09) [GCC 14.2.0] on linux
      Type &quot;help&quot;, &quot;copyright&quot;, &quot;credits&quot; o=
r &quot;license&quot; for more
      information.&nbsp;</p>
    <p>&gt;&gt;&gt; from ctypes.util import find_library&nbsp;</p>
    <p>&gt;&gt;&gt; find_library('gtk-3')</p>
    <p>&nbsp;'libgtk-3.so.0' <br>
    </p>
    <p><br>
    </p>
    <p>For the case that ldconfig is NOT in <span style=3D"white-space: p=
re-wrap">DISTRO_FEATURES,  gtk+3 can be found.  After commit &quot;python=
3-ctypes: depend on ldconfig only if distro-feature set&quot; is merged,<=
/span></p>
    <p><span style=3D"white-space: pre-wrap">ldconfig is not installed,  =
 so </span>ctypes.util.find_library
      cannot found gtk+3.<br>
      <br>
    </p>
    <p>//Changqing<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:nvmjowjub7hxr4wz4njvcwdi5mo2g4p=
piixrsdgr5zrqs3dwch@mrwc5mgkqid4">
      <pre class=3D"moz-quote-pre" wrap=3D"">


Bye, J=C3=B6rg

--
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               <a class=3D"moz-txt-link-abbreviated" href=3D"ht=
tp://www.navimatix.de">www.navimatix.de</a>

Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480
</pre>
    </blockquote>
  </body>
</html>

--------------DvUfiUK6ni00pUYkX3LBrvI4--

