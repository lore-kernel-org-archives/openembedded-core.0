Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE3CD6A249
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 22:27:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7139.1731623266225974589
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 14:27:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1048ec1062=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE6o079030582
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 14:27:46 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwppcd5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 14:27:45 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AEMRiDh016787;
	Thu, 14 Nov 2024 14:27:45 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwppcd5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 14:27:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDHBRjDOusJF98bKvfLMx0sFnT1UnaRk4tDSJaKFycXuRAokIUyI/6bZAX+iiTb6K9abCfo02g6ODtpYWfPc5r2k5ql6qEfHKtQZCnRlF/6diTpeHqw8J5kK0T26iUfQJ4bCPHnXlpot5nJJIx4pe/nNITc4u7PHAul5oRLTZjygTJjvoVV2wsrO+C1aSzKxnk5yL/fxNoaLUaPbVP2T5sNZ2Szf74lDZp5pRXSPd6jnMHl5rnlPKxnCMdIeGH6eFZ5LgTv3LhCkUoDJ13hDk8vN5/uyATe4AfVGZii7bVysSREHWUdv/HeqYhtPeiFvwmHrDKRcirFNdQ8Rj+slIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BUqnQnt4mwrWDfcPmFP7Ls1FVKlVfAozBvSr23/PmGM=;
 b=unMynANz/p1yy57Xzd88GyUZmLBZ5ltJw+xUmCi1PJXFsV/RKMYX0a/RAQEC0szHSuk/EwvKgfjBcdmEnFKU6i/DQx1FYw/HWcrOibpr7Tuu9vidt1vEoYFuCe6PxjFhJ9baRuHwwdffiXguNcD1rgAhHeJCiPdV/vyikTRqawS22DHNSBUuf6G1MMl5yG26bdLPSkAW+LHfNOt7F0AsStIre4hAgI23hnhVgjcWwGLwJ6gCB26oGhYnwWuBb6k7N4R+WHc24SQ+5IgjQIO5bCilwC+wJhKzDafoP7PjLSzUTIae1AEwl5uVO/1hzpYoui6gTU2NuOPUYfvDIrSyzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DM6PR11MB4658.namprd11.prod.outlook.com (2603:10b6:5:28f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Thu, 14 Nov
 2024 22:27:41 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 22:27:41 +0000
Content-Type: multipart/alternative;
 boundary="------------mRShFpuBvO27PdbSRyt1XAA9"
Message-ID: <f5a1f3e7-e808-4854-892d-49a77b909e64@windriver.com>
Date: Thu, 14 Nov 2024 17:27:38 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH] glibc: stable 2.35 branch updates
To: raj.khem@gmail.com, Deepthi.Hemraj@windriver.com,
        Ross Burton <ross.burton@arm.com>, Stephan.Wolf@kontron-ais.com
Cc: openembedded-core@lists.openembedded.org,
        "steve@sakoman.com" <steve@sakoman.com>
References: <CAOSpxdYM8XVLTVWg6jkZrGPmPG1MVfQMH17aASKgHOK+6zLGgQ@mail.gmail.com>
 <7336.1727954530167946178@lists.openembedded.org>
 <CAMKF1srVR3LZW3Hq45XWxvFe5dkkfAxySqBzsZuyts576pqEYA@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAMKF1srVR3LZW3Hq45XWxvFe5dkkfAxySqBzsZuyts576pqEYA@mail.gmail.com>
X-ClientProxiedBy: SJ0PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::18) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DM6PR11MB4658:EE_
X-MS-Office365-Filtering-Correlation-Id: b1b622fb-121c-41e1-f4fc-08dd04fb8d3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|4022899009|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UkFxT3A2Ukg5M3R1cW9qYkFobFR5THQ1dkM0R0ZOVEVYWHZhT2EyLzhVMWVh?=
 =?utf-8?B?RzJOY1psa2hmNDRTZi9BRWFKM3N0ck1LL0ZBZUdUaXovaXBybk9hd3JDaGx3?=
 =?utf-8?B?cXR2Ri9iSFFnWWV5VUtGd2l6dXFEeG9lTnc5Z2tpYkl0UTZIRUI4OFFGSTQ2?=
 =?utf-8?B?YTU4NENHY0w2YlpiaTVSNHNmSnVJNDdLazI5Y2pJbVhPbEsxRW15TEt3OHlI?=
 =?utf-8?B?bWphQnZxZnRud3hWSXlmVEFNSzhleHV1cDZSckYzeU5TaUZRcUJFazJKdVNn?=
 =?utf-8?B?MFREaWdaS1ZGaVVacWd3bW1VQTF2aU9BSGNaOThJNC9hYWg3RFMyejR1RVZo?=
 =?utf-8?B?TzgyNWYrdUpFNkFLd21lQXRTZ2NGMU5CUkcwb29Gb1FwYlNyWlE5YWhyRStM?=
 =?utf-8?B?cW9hTDlicklabnlRbXkwRnpoWnI1V2l5L3VrWG1MdWtZa0Z4MTFlSFdlalUv?=
 =?utf-8?B?UnZjSkltRGh4a1MwNW9KVHBnZWRZVW1rUTVBUzNXcEw4U3BTNVZzdlFkTVpR?=
 =?utf-8?B?a1N6a2ltMWRLcEJvY0JicFl2WFc4MnpsZHBHaGpNV3krWlZZUXREbFd2amlO?=
 =?utf-8?B?VFBPQmsrVHl3R1Z6OFFKb29lWGFyQzR4Rk9ETWRCdlh6dUxhUExLekxJUlR5?=
 =?utf-8?B?YlkzaDRHdFo5eTBPT2h3dGFVSGxETXJUWWYrWlNxUUs1VDZBRlhIWmR6Q2c1?=
 =?utf-8?B?N2htV0ZYM1Z0ZW1XcG53OW9UUlZpRDAwbVF1OStJMW1UQkJnSUcrMUdFcFAz?=
 =?utf-8?B?TTR2SkZaM3VNMjdwM0R3ZG9qV2JyV1crSmNRcG9lNE5oQ0gzWnRCTlBjakVr?=
 =?utf-8?B?NVkvREdUSzVoVnl2Qm11djRTcE4wckJ3UDlTZVc4Q0ZoN2xEMDJkNndyVCtj?=
 =?utf-8?B?M1I0TmdJYkF2bU9uL1ZwZk5wNW9lU3VPREdzZkJPakUvdytLWVR1ZnNYSXFy?=
 =?utf-8?B?VDByMEVUdTEzMkxFMmVVTmlDa29MdHhzS2dEb3RjUEt4U3ZRNDdoc3BaSjM0?=
 =?utf-8?B?MCtVblBiY3hUNmFVVVd1Nkphckt1TTdiVkMwSS9HT3BUU0xNK3BtU0k3WmZB?=
 =?utf-8?B?N0VaYjZqTHRSd3p1ck1SeFpZQi9LUmM5RXBzdXV1YTRuaHlGcEpGbU54cW5V?=
 =?utf-8?B?c0twY2NTQVpYNVlWVUhHZmZINmt4N3Y2eFR5NU5OcDgybnY1MEx5QjBXZW9M?=
 =?utf-8?B?R08zYkU1VllUc1o4OFpzdC9qeDdUaWJrbFhHUG9xT1AwVEttaElsMFNLaHBK?=
 =?utf-8?B?U2xxMlRIY3U1eitibG15eVR6MWNNbHZYYTdWTlNldFlLOWpPNHdXVURQYVNM?=
 =?utf-8?B?OXpQOEZkRHFQby9la3VsdS9WRzR5a29ZNVdycjhtdDJsY2tkN2tmOUlZRzNB?=
 =?utf-8?B?RGhVRE53WEMvQytjbktZMDVqY3p3NC8yK0JTYjRIVitEOGpqR3UxM0xSREgx?=
 =?utf-8?B?YTd6Y1FMNGVMTWFkRjlsZGpZdmdMb2VWWEgzSmRLUWFnZElJcFNSRDFEL21Y?=
 =?utf-8?B?REtPcXl2bFc5T3cyRm5JUnQrOXAzeW1PblZ2VG1ZK2J4b3BWNkVZTFRpRmV4?=
 =?utf-8?B?TTNqeWN2RGE0cWErVHVhSlVLTVJZM2ZYOHpHSmxjM0ZhTHlxTTJpZmQyRzhU?=
 =?utf-8?B?YXRVdDB5b3FlRk1wblROa1ZwV3hubmJQWEI2cDlrRnZ5aUJGU2Z2bjR2amtN?=
 =?utf-8?B?VkNtR01LV2VWZGtTNDdCekdmdUloWldMQ1RLYkpSdTYrbUY3NEluSEJnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(1800799024)(366016)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MWdpZldPY1g1dko1NVk1c1hHT2V0OStvVWpYcWV0cVFUdml3VmNvK3lTSmFE?=
 =?utf-8?B?TmNRMUhWSEFWbDZxbFRGVWE2MWFKR21KT3RsQ2ZsOERrODBoTGZRUWNoYk5I?=
 =?utf-8?B?am5kNzRnYkRNYUZ2QVFWOEdBSXpPNURLRDUrMHJDcFJPT3V5aElQWDBuMHVl?=
 =?utf-8?B?UkZSYUt2eTZ5RzVLNnpsZUw1eDA0dHlqRVEzK0oyUTdYMUpnNkh3T1NMeitV?=
 =?utf-8?B?QkphQXRRUG9NQW1XK29vbk1neXY2OGx6cTR6WWdiNWpmMzZyRXpjK3kwMWM0?=
 =?utf-8?B?Z1Z3OE5MRnNWZEhpamtBSlg5ajEzdVhPZDZjbWNnb1ZSMXcwNVRaWUpoL2xu?=
 =?utf-8?B?S0QrSitDU3pPSlEzaTN2SlhkUm9YYy9IbHRmaWxXT0dGTEZVcUg5NzQ2bGxq?=
 =?utf-8?B?QkNPekFIWnR4ZWV6Q3pBOHBXeEoxN0FBMllESWsvWENZTXVMTW5mTUVNTWE2?=
 =?utf-8?B?b0FRcXB3cS8rNStIbURkbFZ2eFNrTDBMb0dNeUZwV1EzMjlNVXNjajlaK1g0?=
 =?utf-8?B?aGMxVlRtSjJNZVl5TkRLd0pLQnlKWmpWZG04cUZGVFpHdHB2bFVodHdyVHlV?=
 =?utf-8?B?L1FNVmQ0RGpFUkJNT2RGUGNsTU5pZXhCb1hVNHZQaU90WVFaUlY5c0VTWFp6?=
 =?utf-8?B?N0RTK1dEMlV2Q1k3OWk1SmVlcllWRGhWTEtqbVB3aGxqbmJsemw4Q3E5YVUx?=
 =?utf-8?B?QitvOFlCS1c4TUNtaCt6ZGhheUd5MUJsNTBwS2N4WDc1UXI3TU04NTVZR1lK?=
 =?utf-8?B?VEZ5VEVzMWw2MXgzWFB1ZDdxT1JHdlZTbjJKeUhBM2NMY1d1ZlV4R040U05E?=
 =?utf-8?B?NnJpeVhUT2ZBbkQ0SkZMSW9RYkdXemJEelNmYnlTMUxnd3VIL2sxY1A5bVNu?=
 =?utf-8?B?bmtqWmxheTBZQ2N2TFlvQmNYckxmRHNkTWlhOGQ5Y21EVDZZdlBQMHc3U3FW?=
 =?utf-8?B?Yy9qeXpPZURoUVlQVTBhS25mVXlSMmFiaXFUWDkyRVpEY0pEVm1ENkFFcjBI?=
 =?utf-8?B?cHo1NmVCKysxNnBodHN2V01FTmFBWDRQRVFsM21YYkVnS2M3TEhLZ0kyQTRr?=
 =?utf-8?B?YmVDYk8xSUdEbTUyOW1TclBTWFJFME8xcE1EbCtTaTNtdHo1RkhXckwwRlI0?=
 =?utf-8?B?UDRUTG5XRlVWK0xnNktSWk1zNkEvNWtIZ2tDdGhHSWtLU0dmZzNsRkphUFFF?=
 =?utf-8?B?SzFLMmJBMVB0eHRPV3ZVZGRWVllFQ3F2bEsxSnVQRXNia0phYWd3NUthcFRn?=
 =?utf-8?B?ZkpyZExTWHg3NWpDMnkybmFVVnFla0RINlNHaUlIYjZEWktmYkxPU01IdkNl?=
 =?utf-8?B?WDBoU0RPdS94dGVkdy9BV2xyejRGS2xud3ZuOHkySWxyZ21ZRG5BdVpXZUND?=
 =?utf-8?B?WXdCWExzaE4zYy9IU3dUb0dvUHhYQ0I2K2VlRUd0NEE3K21uamU1dTZxbkhm?=
 =?utf-8?B?MndFb2JGMEVjSWJSbXZrSVgramI2elorQWNSZ2xjbWtxdUI5VUllWnQ1ZnBw?=
 =?utf-8?B?TVg1SmpwNVJIWTREU3pHQ0xiMngyYXFIdUZwWkZNM1lqb3ZQTk5idk9Mck1H?=
 =?utf-8?B?azJxQldhUk9VVkFxdzN5c0tjdWthVW9hTDNVeUpnMUs0WGkxWm8yT0o2Umlu?=
 =?utf-8?B?ODJQUytLU28zNXhkWkFDZE5ITXQyMUZNYlRrdklPVlluNmlrYndyekxEN3VO?=
 =?utf-8?B?Q0tGVUNVcWtnV2NTNnFiSysrMUZFTlpxVHp3TGphY1M5SXh0VVVnMmduaURn?=
 =?utf-8?B?ZjIxZVVHcTA2SEtxbGdHS3FYWEVQaEM0WWhNNkVxS3BZdzE2cGMyMU13VVNH?=
 =?utf-8?B?TDlaMC9sUG9Fdk00S1dIRFlJeW5vVTU1NEpUWmdMV3NuN1JXSGNTQ3ZPSU9l?=
 =?utf-8?B?STJ4Qmh4MVQ4Q3BMTmNPWXArWWtEenNnUUZLOWZsOXVpVEhHWWtKSjhXWEtQ?=
 =?utf-8?B?K3JoM1ZvamtsQzNBckxoKyt4RmJvRW9scWcyOUZxTkZoR2F1UkZURTN2NnQv?=
 =?utf-8?B?LytyTmVDZXBRVmNGSGFTNVd3c3FKTGowVHUrNnE5bVV0UVBIUW1YU1N3SG55?=
 =?utf-8?B?MzZxd2M5cjV4Rnd2NlczSERjRkpQdTZZQzBkNzRGUU5IcEdmRVlMMUtiWXE1?=
 =?utf-8?B?c1lkU21DdUxYbFdzc3hFdjdNVWh3TnhrMHd0QUZUZzhTU0xiRmkzWG1nMHdn?=
 =?utf-8?B?ZWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b622fb-121c-41e1-f4fc-08dd04fb8d3c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 22:27:41.1788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 914GEXWeh0PqeH6WQu3Mh8pxWEMGW19KzI2F6nf+CMl67wp17oHmLrxD9h+rSFvCPNQPxKJQl7SlZoRD1EOBzCwQQC479l4+y2JL98S6dE8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4658
X-Proofpoint-ORIG-GUID: XMBOJjBADcqlleoOZn2I9QhjR9sPxqPr
X-Proofpoint-GUID: OYlXWtWCl1KB6g_kMDbwIseq83SAnMUi
X-Authority-Analysis: v=2.4 cv=J4f47xnS c=1 sm=1 tr=0 ts=67367961 cx=c_pps a=GDxOUaUasxmcDRSC7gC2IA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=cTRDXWwZMOAShT_WsBUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=2OWnXNIrHimVl5szvXcA:9 a=BEGbDkkGhxtskS8N:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_05,2024-11-14_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 bulkscore=0 clxscore=1015 mlxscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411140177
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 22:27:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207178

--------------mRShFpuBvO27PdbSRyt1XAA9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AE6o079030582

Add Steve, Ross and Stephan.

On 2024-10-03 10:38 a.m., Khem Raj via lists.openembedded.org wrote:
> On Thu, Oct 3, 2024 at 4:22=E2=80=AFAM Hemraj, Deepthi via
> lists.openembedded.org
> <Deepthi.Hemraj=3Dwindriver.com@lists.openembedded.org> wrote:
>> Hi Khem & Steve,
>>
>> Thanks for checking out the results and your comments.
>>
>>>> Is this regression? and is it a persistent failure?
>> We analyzed the issue further by debugging it manually and observed th=
at the testcase "nptl/tst-thread-affinity-sched.c" passed as expected. He=
nce, we ran the testsuite again after the update and found that the issue=
 was not reproduced anymore.
> Thanks, I wonder why it failed the first time. Was the system running
> these suites overloaded ?, I would like to see if there is a pattern
> to these failures.
> for now this looks ok to me to apply.

Interestingly (in a bad way!),
this regression may be related to a problem that Stephan just reported. S=
ee:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15647

It seems that the problematic commit is:
a180e82837 Linux: Make __rseq_size useful for feature detection (bug=20
31965) but let's get that confirmed in the bug report.


The lesson learned is that if there's a regression from a glibc update=20
even a single intermittent failure,
we should spend more time investigating the problem.

Deepthi did re-run the tests both manually and as part of the test suite=20
only to find that the issue
was not reproducible but in hindsight, we could have done more.

We'll work on improving our testing.

../Randy




>
>> Please find the following results after the update which has 2 less fa=
ilures than the results before update.
>> After Update
>> PASS - 4781
>> FAIL - 145
>> XPASS - 6
>> XFAIL - 16
>> UNSUPPORTED - 237
>>
>> Before update:
>> PASS - 4770
>> FAIL - 148
>> XPASS - 6
>> XFAIL - 16
>> UNSUPPORTED - 237
>>
>> Diff:
>> PASS - +11
>> FAIL - -3
>> XPASS - 0
>> XFAIL - 0
>> UNSUPPORTED - 0
>>
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#205207):https://lists.openembedded.org/g/openembed=
ded-core/message/205207
>> Mute This Topic:https://lists.openembedded.org/mt/108647219/3616765
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
# Randy MacLeod
# Wind River Linux

--------------mRShFpuBvO27PdbSRyt1XAA9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AE6o079030582

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Add Steve, Ross and Stephan.</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2024-10-03 10:38 a.m., Khem Raj via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1srVR3LZW3Hq45XWxvFe5dkkfA=
xySqBzsZuyts576pqEYA@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">On Thu, Oct 3, 2024 at 4:22=E2=
=80=AFAM Hemraj, Deepthi via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Deepthi.Hemraj=3Dwindri=
ver.com@lists.openembedded.org">&lt;Deepthi.Hemraj=3Dwindriver.com@lists.=
openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">Hi Khem &amp; Steve,

Thanks for checking out the results and your comments.

</pre>
        <blockquote type=3D"cite">
          <blockquote type=3D"cite">
            <pre wrap=3D"" class=3D"moz-quote-pre">Is this regression? an=
d is it a persistent failure?
</pre>
          </blockquote>
        </blockquote>
        <pre wrap=3D"" class=3D"moz-quote-pre">We analyzed the issue furt=
her by debugging it manually and observed that the testcase &quot;nptl/ts=
t-thread-affinity-sched.c&quot; passed as expected. Hence, we ran the tes=
tsuite again after the update and found that the issue was not reproduced=
 anymore.
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">Thanks, I wonder why it fail=
ed the first time. Was the system running
these suites overloaded ?, I would like to see if there is a pattern
to these failures.
for now this looks ok to me to apply.</pre>
    </blockquote>
    <p>Interestingly (in a bad way!), <br>
      this regression may be related to a problem that Stephan just
      reported. See:<br>
    </p>
    <p>&nbsp;&nbsp; <a class=3D"moz-txt-link-freetext" href=3D"https://bu=
gzilla.yoctoproject.org/show_bug.cgi?id=3D15647">https://bugzilla.yoctopr=
oject.org/show_bug.cgi?id=3D15647</a></p>
    <p>It seems that the problematic commit is:&nbsp; <br>
      <span style=3D"white-space: pre-wrap">   a180e82837 Linux: Make __r=
seq_size useful for feature detection (bug 31965)
but let's get that confirmed in the bug report.
</span></p>
    <p><br>
      The lesson learned is that if there's a regression from a glibc
      update even a single intermittent failure,<br>
      we should spend more time investigating the problem.<br>
      <br>
      Deepthi did re-run the tests both manually and as part of the test
      suite only to find that the issue <br>
      was not reproducible but in hindsight, we could have done more.<br>
      <br>
      We'll work on improving our testing.</p>
    <p>../Randy<br>
      <br>
      <br>
      <br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1srVR3LZW3Hq45XWxvFe5dkkfA=
xySqBzsZuyts576pqEYA@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">Please find the following =
results after the update which has 2 less failures than the results befor=
e update.
After Update
PASS - 4781
FAIL - 145
XPASS - 6
XFAIL - 16
UNSUPPORTED - 237

Before update:
PASS - 4770
FAIL - 148
XPASS - 6
XFAIL - 16
UNSUPPORTED - 237

Diff:
PASS - +11
FAIL - -3
XPASS - 0
XFAIL - 0
UNSUPPORTED - 0



</pre>
        <br>
        <fieldset class=3D"moz-mime-attachment-header"></fieldset>
        <pre wrap=3D"" class=3D"moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#205207): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/205207">https:/=
/lists.openembedded.org/g/openembedded-core/message/205207</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/108647219/3616765">https://lists.openembedded.org/mt=
/108647219/3616765</a>
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
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------mRShFpuBvO27PdbSRyt1XAA9--

