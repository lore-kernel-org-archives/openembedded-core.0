Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 349DFC28B28
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 21:03:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.21631.1741381372587478320
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 13:02:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5161eb5657=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 527Kvh0r024343
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Mar 2025 21:02:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456cux3tbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 21:02:51 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 527L2o8S000924;
	Fri, 7 Mar 2025 21:02:50 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456cux3tb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Mar 2025 21:02:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aLUPH4I5QOnrdPWLSSxg6ESj+Lg2Uu8LUiHMpvK3teVN0IlF+wReTkvu7RPKqinbmS+kqlgMozPaCXqJ9rUqS/2pufR6K2Q1yu90UjNQEMedFyNPynlhWPpjCHA01ZAEI3K2tanxT2pZPjZgVi2zFUaCeGo5iKJ2rF8UKjujIQg0mrmh98PORGlhq+s5kBMm0+NEemQUYWHxzfQ+Io3QSmGxHbfnzXiAWT+vsX6G+DBOlGiTvmRfTHq37hL0/ibKeC/HTC71YUHmDX7/P9P92xtPw/G0w6Y9u/CocS8eoWC0cIwaBgPeAxM0jRqy+wi4ayWwfS7ml0bJMa1ZLKDfWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiDxmhmpkzSSfhz4Ts+Mcwe2tEdOCe+LLzaMo1LNnHA=;
 b=caiaVVMLOX7cvuHitFQLlrJL7YL+Z56hCP3LQ2bMVSPwZLCUKMz0D7d+xH9kNh9f8dSwszA5MjVcR1WuFLJ7uuRi7OC0BrzF2pwSfXVVFQJ3BPGhLma99KgFfR6DsVfjPCR98hoXptWW5wrNtM2FyuuVHcd+/qYMiUH+ipdDzKw5Ro6UtOLx5qx3BmD6rXRi3PsLof1JSnnCQRagp2UguAy1QQAIS/GuAKMga6Uo+bxXZ+ITmelhyIgtfe7hC+n8gUS4Zh8cSzjHJyzV37KD3ct3KCXEyuzWmzVHcProBiHszdy3ftUWThDyDoewBYN08THtBSr50ml+9yxDhTRYEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Fri, 7 Mar
 2025 21:02:45 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8511.020; Fri, 7 Mar 2025
 21:02:45 +0000
Content-Type: multipart/alternative;
 boundary="------------FX12QTozi2XjfnrKMYJmYUzO"
Message-ID: <c411d58d-bd27-4107-9b98-e39de14204df@windriver.com>
Date: Fri, 7 Mar 2025 16:02:43 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V4 2/3] rust: Upgrade 1.82.0->1.83.0 --> bloat
 alert !!
To: deepesh.varatharajan@windriver.com
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Khem Raj <raj.khem@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20250305134459.2275598-1-Deepesh.Varatharajan@windriver.com>
 <20250305134459.2275598-2-Deepesh.Varatharajan@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20250305134459.2275598-2-Deepesh.Varatharajan@windriver.com>
X-ClientProxiedBy: YT4PR01CA0449.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10d::21) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SJ1PR11MB6083:EE_
X-MS-Office365-Filtering-Correlation-Id: 18aa318d-eeb0-4fa6-ba21-08dd5dbb687a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eVlFaDdZdDMzeHE1S2VDcnRtR0M0WVNrT0xMQVY4ZUhkVGRZd2lxeWQ0M0FC?=
 =?utf-8?B?UnNRaGNhdkhMNWoxZzZPMlVDVHlIUkwydFk1ZVZtMk5FNlVDekpiNFFiMmt6?=
 =?utf-8?B?ZFplN2JyU2p4aDNRYStJQWk3SXZJR3lLOWorRVYzSzJ0Ukw0ZGhDaWVKdlFD?=
 =?utf-8?B?Z0YwY09RVEI3UEhKbzJiN2lhdDg3TGtoUDBYNzRMOXVVRzFYWGlYeEZ0Y0Vz?=
 =?utf-8?B?ZWx6QjZTaUxPMXJ2MTNtWms4cG0weE1vMWpaOVBqSE9Pb29wczFoVzVNTlpS?=
 =?utf-8?B?RTNQWHpOT1hoTWNxV0F1Zmsrdk40S0pZeTI5M3dQVjRHNnpzM2U4ZmtzWDB0?=
 =?utf-8?B?OU42T01Ndjhmdjc1bW5PdzFycXVkbUtsakZsbWxVbkxJMXdwRi9USk1NVmJl?=
 =?utf-8?B?UXdvYjg1dG1SVGpVUUZwV2ZpVWRkYms2dFdlc296Z0QxY3RnMElFU1NKbksy?=
 =?utf-8?B?N05TOGVyUFlKZWpQaDhsdStibm04ekFvcytVTU95TWhtUUVNYXZjOStlcVlq?=
 =?utf-8?B?dW5VbFFLNVFWSDdFN0taWTNzRTBtejVGWXhZSlZ4Und0ZWkzb2xoMjNXMW0w?=
 =?utf-8?B?Y1JwUzR6bDhSaHZ0RUhOZnV1SlROV2tvc1d0K280Rm5ZSGJhSXFuUUN0Nzcx?=
 =?utf-8?B?d3JGam1CR3ZhQU5NQ1lJejFKTGNKZDZPcEhBdzhaQXpUcGFsOXlWNmZNSUEz?=
 =?utf-8?B?amk2RVdJMGxTUEVNeUlIcFhRWXQ2dkFkTHBJd2VVRTBkQmtwN0M4cWdDTnAw?=
 =?utf-8?B?cWU0djE3Sk8wODZEKytzVGdsUURYZmRtVjcrSnp5Y0pZNnpiS1ZmaVozdklW?=
 =?utf-8?B?MzFTUVljeVgyNFZXZ3RVd3ptL0VMbmZxditQVVNxVlRCUXE4R1V1L3FERzhV?=
 =?utf-8?B?bFdsTjBUOW5PZmcvQnI1dE9MR0dVbEZSQnRWSWJ0T0E0em1wb2tjeDRYK1Zn?=
 =?utf-8?B?bWhVSFRvY2l1ZXptd2RIYWh0bmFlNlJmQVJ1eVY1cjRZWEpDRzg0RXB5QTMw?=
 =?utf-8?B?dWM1cmtNZlNIdG50Nlp4SXpCalB1SnhTb1VOVnBSOUJHSmNnUGowbjVqZk8x?=
 =?utf-8?B?Z3lKQ2lMTE90U052eXlnbXg0azR0T3VxOUFLM2Z6M1BIMTdrOHhQSzQ3amto?=
 =?utf-8?B?VHRYYmxJSE9FN2lRSHhtR0hZdnBsVzF6T21TeWpuSGtzalE2MTBUSWwrMXhG?=
 =?utf-8?B?L0x4M3l1eGdrWENQS0lHL2plblQ5dHJqUk9IbUZ5ZWFpcjI3K0VaQ0I1RkZi?=
 =?utf-8?B?dnhjVEh6OW5nYW1OYTBwSWduT00wZ3BQczVKYzIybFlxWWw3UXl6a1Q5Qi9i?=
 =?utf-8?B?bTcveVVNSnZDZGRZMWRJQzc4YXNWeXhUdGVKVnZhLzZxU3ZNd2JqRlR3MlFu?=
 =?utf-8?B?Wk1BZzVQTEhqaUpOZHdPV3JkTnBRUjVkU0JsZXdOaXhucFV4d0RELy9MeTMx?=
 =?utf-8?B?WmJhVEoxRXhra1hNQ3VadE1YN0hwZkNVYmNUL0szZElNOC9JSXdUVEVaeXE2?=
 =?utf-8?B?RVpuWWZkQW5FamRZKzMyOWk5OW1oUmdQV0pGNXdkNUhkdDRnN3d5RmZrUTUy?=
 =?utf-8?B?MjhZYTk1KzdtWGErM3pQSXhacm9vT2V6OStRTzNnbEllSzhlbEo2OU5BMS8r?=
 =?utf-8?B?Zjk1b25NeWo2T0RYbjRzeGVIdVBvaW54ZmVLKzBKSWFmd2pNT1VsQ0lGY0Rl?=
 =?utf-8?B?SDZqM2pVQU5McVVWNkhMNW1lWXcvN0J3TXdKV0xrVHlhQ0dSejNwWVdtdUx1?=
 =?utf-8?B?YWYrcTJSaFU1eUFrbmZ2QnNUYTJKL1EzSnRhejZPK2E0R2RjYWo5WWJodjRt?=
 =?utf-8?B?S2IvMXlSZEhMWHRtQXIyUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aEd2ai9jWGFMT1FiQ1ZvaUtZSGlBU3VBSkpOaEJjNWUxVHVZWGRvV0VvSm9Z?=
 =?utf-8?B?MWtPVUJtM3k4TWNXMDJSQmZIb2VzemZrSkNQWjg5WHR6ZUl5TDJFUzFsTll5?=
 =?utf-8?B?akcrYUJGUUpZNlo3LzJGVmRHRWVSVUJVcFkrNHJvT3h4RnVaRzNiUEtlOWJh?=
 =?utf-8?B?Qlp6YjdZU0Y0VGZMNm9WNlJGVnJ4Uk1rMTc1TUJvdllrSkNDcm5HV0NYQ1JG?=
 =?utf-8?B?REZvd0d3M0EzUGh5cmVlUDNsR1VXQVVNeXZ0aGp5VjkyMWxqdmZIbjNrKy9H?=
 =?utf-8?B?MldDSGVMUzIzMStBaUhhb1E1NXN1SmRaNWV3Z21tV3NVcW5XS3J4aUxwa1Zo?=
 =?utf-8?B?SURNcFB1SlBuVmhPOWZ4VHdYSXBzK09UZGI2Qno5YXdwTERZWXE5N1NOam0r?=
 =?utf-8?B?NFFXenYya1FVdkVST0JYM0ZOUzdEbjZRQjhMc0J2NXlYWENhYzJYQVF2ZmNE?=
 =?utf-8?B?ZGZHZ3FCZHEwY1d5UWk3ZUJwZzFQN0hQSk5xOEtNVVJ5cWpSVlNqeVlQMkNE?=
 =?utf-8?B?TTRRL3pmakp5RVp0MzEvbmlNMHFvNXFqSVhDbXpWQXpkYjBsMnJRMkljYS9x?=
 =?utf-8?B?VG1qYXBkdjZKZWN1eTlCeW9SbVkvRjFtRjBRRTlwNUJacmppSXUzQjliMm1n?=
 =?utf-8?B?dC9UckhlSk5FVzNuWndhWkU1eHAyL2laSHRlVi84cjdpNWwrVm9iT2F4R1Fm?=
 =?utf-8?B?cmQzd2hOUEs1MnREUkpMRkZoRW5NQyt1MnZvL3dFSHlqeGFDUWtNSmlRYlQy?=
 =?utf-8?B?cFBNcEp2Q3I5SXpVTC9ZOHJ2ZDhvaWt3d3RZY25kVUdibmlLYURLWjFSZkpG?=
 =?utf-8?B?ZzFGTHA0enZ3amZJSXBERnFwdFJWR29xemhCNDQwdnZFNEpjbVhqbGtyNEsw?=
 =?utf-8?B?VEZoKytPdGIrYmtxT0pWOUZKUTVEcTZUK2Q1a3JLRGtUSlpOWnloWHVZYW1Z?=
 =?utf-8?B?SmtONHZvbG9lbS9yNXhwWE95ck5vMjg3VVVyNWFXOGVTVkxVOC9iNldFRXU2?=
 =?utf-8?B?VmJZMEkrUDhyeDA0aEI0TWdwcUVpYWlkcThPVW9hdXFQVHFIRGF1aXNhbXJV?=
 =?utf-8?B?NnIzbUNYQ0cxNXMvY25MRTlOdnBHeTM3V3AyTk9Dbk44N0htYjBxK3FnQkVx?=
 =?utf-8?B?TXhyYVJQWk50UStVOUdTUmRtQmhFTUwzd1ZyV3ZkZm5STDR2Q1p0K0trVUxn?=
 =?utf-8?B?eEp6Tmt3UUxQenhLeUY5ak5oeGpFOVpsRE5Lc2JUWlFwcytONjJlT3Vnb0ky?=
 =?utf-8?B?VGdpL252clpuQjZybFRPekl2anNMZTNUQWlLMWEwQlc0dExoQ3lNZm9JOTZ1?=
 =?utf-8?B?NTZFQkVpSzhteTZXMmRZQVhIZ0NQY1NIeVhnbXZFTjBGNHpORmczdlF1Vmto?=
 =?utf-8?B?UStRTngxSC9BU05wVDBmaEhUeVl3Qm5FcUpwQkFvanRoZUFVd0QwQXByMVZB?=
 =?utf-8?B?Zmgya09BM1V3ZWRLbWdUNWVnTFdWd2FqSHVMOWFsQ2J2cDNRemtlWnJHYTZ1?=
 =?utf-8?B?Yk40a3V2Qyt1V1JteldrQ3lNbnY2M1o3SFc3RDBzeTh3Wm02UWxrQ05DaGpB?=
 =?utf-8?B?VXZreDNVZzA4Zmp4TTNDMjdGTk5Vam1RNS84UUVZc3EvN0JTN2hlcStTYWNE?=
 =?utf-8?B?eFkzYVM2WitQcFJ2cXd4ajVndms2emRiQUI5MVlPSU1aUCtOcjZQN0NoRmpV?=
 =?utf-8?B?MCtYWmMrMW94YXpqTzdWejhjcUJaaDQ3S2F4a2FIdURBc2VPNWVvUmlYMFNq?=
 =?utf-8?B?RzZsdVNhRS8xREdtMEJtMjJ4MzFtWmNMZ1ZteVI3YU1FK2FWb2Y0RzZaZHl3?=
 =?utf-8?B?YUhUbWl3NUpQMnBzYld2ekRMTUJJYzhGWTZGbldCblNlNHl1eWlQY0UwZXpN?=
 =?utf-8?B?bTQ2emZOUmNwUVFLczgyL2hPNU1uUkkreXZpY3Z6dlZBcUN5RjJrVUhJODVY?=
 =?utf-8?B?WGkrRGJiK0NlVFQ3bmtEenFEZThZQjVxWE82aFlGeHpUZDc5L3JQQVRDS3hu?=
 =?utf-8?B?b1RUQktEck1RT3A1MWhBSjBXWU5sLzJYTGNXbU1ydlg3Mzk4ZXhlcUpuUnlF?=
 =?utf-8?B?bS83cnY3YUt3SWE2Y0FMRTA4TjBMZmRLTU9OazBTSzJGWHBBUWFEaTdIWE94?=
 =?utf-8?B?dnpzUmlGTjlyd3V0OWl2WFpwYk1oWHlXczZFaTRyRHZoRmdxNlRKWHQrUnJI?=
 =?utf-8?B?VkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18aa318d-eeb0-4fa6-ba21-08dd5dbb687a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 21:02:45.1533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rQuAL10zwgEh0aqspCm8faR2sTGovu7nT9+GjurN2PI4qTTZu0LQDR7aZJS1i5QLbBP+XtB96uoYYG51Bdd1V3X/fgOuOiAlLLvdcn0u6HM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6083
X-Proofpoint-GUID: E8dQycR24qxEigfs3mdDXvs__02DoG3b
X-Authority-Analysis: v=2.4 cv=ddB63WXe c=1 sm=1 tr=0 ts=67cb5efb cx=c_pps a=+tN8zt48bv3aY6W8EltW8A==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=1NWNoF9oAAAA:8 a=Gz7s5_CCAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=iGHA9ds3AAAA:8 a=bdRy-aQ2P8YTVizYImsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ODQXRAfQNnAA:10 a=UYzkgclQfJ0A:10 a=sE8rR00Velgpw-tK1K4A:9
 a=JNHP_rXFjj2w7P2l:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=8zIOOLb7Ym0NljyPXbuS:22 a=97APRTa-CG6DvPMFVxHL:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: Rw9b_kZCyH3Ttkfcy3orv0h5_yd77J2M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_07,2025-03-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503070159
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 21:03:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212467

--------------FX12QTozi2XjfnrKMYJmYUzO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 527Kvh0r024343

On 2025-03-05 8:44 a.m., Varatharajan, Deepesh via=20
lists.openembedded.org wrote:
> From: Deepesh Varatharajan<Deepesh.Varatharajan@windriver.com>
>
> Rust stable version updated to 1.83.0.
> https://blog.rust-lang.org/2024/11/28/Rust-1.83.0.html
>
> Renamed and modified the below patch to adapt the new version.
> rv32-cargo-rustix-0.38.34-fix.patch->rv32-cargo-rustix-0.38.37-fix.patc=
h
>
> Modified the below patches to adapt the new version.
> repro-issue-fix-with-cc-crate-hashmap.patch
> revert-link-std-statically-in-rustc_driver-feature.patch
>
> Dropped: zlib-off64_t.patch
> https://github.com/madler/zlib/commit/a566e156b3fa07b566ddbf6801b517a9d=
ba04fa3kq
>
> Because of the following commit ,
> https://github.com/rust-lang/rust/commit/68034f837a39387e49fc7d7c5b088f=
5372a1127e
> when we enable lib32, getting build failure because there is a check fo=
r target
> support for "-Zdual-proc-macros" flag not functioning properly when lib=
32 is
> enabled in the build environment. So for now reverting this commit and =
bring
> back the previous behavior, where the "-Zdual-proc-macros" flag is alwa=
ys
> added for building proc macros, regardless of the target architecture's=
 support.
> This would bypass the check introduced in the patch, allowing the build=
 to
> proceed without error, even when building for a 64-bit architecture wit=
h lib32 enabled.


Summary:

rust-1.83 (and 1.84)=C2=A0 has a full gcc-14 tree, bloating the tar.xz by=
 128=20
Mb, unpacked sources by 1.3 GB.
The build impact seems to be 5 GB . This was an upstream error that has=20
been fixed in 1.85.

If you think this is unacceptable, please read on and reply to my=20
suggestions about what we could do.


Details:

Richard pointed out that the buildperf info here:
https://valkyrie.yocto.io/pub/non-release/20250307-81/testresults/buildpe=
rf-alma8/perf-alma8-vk_master_20250307150029_5323603048.html=20


shows that rust 1.83 added 5GB to TMPDIR disk usage !!

The Rust .tar.xz went from 210M -> 337 MB, 1.84 and I checked 1.85 is=20
down a bit to 261 MB.

=E2=9D=AF ls -sh *xz| cat
210M rustc-1.82.0-src.tar.xz
338M rustc-1.83.0-src.tar.xz
339M rustc-1.84.0-src.tar.xz
262M rustc-1.85.0-src.tar.xz

=E2=9D=AF for i in `ls -d *src`; do du -sh $i; done
3.5G=C2=A0=C2=A0=C2=A0 rustc-1.82.0-src
4.8G=C2=A0=C2=A0=C2=A0 rustc-1.83.0-src
4.9G=C2=A0=C2=A0=C2=A0 rustc-1.84.0-src
3.9G=C2=A0=C2=A0=C2=A0 rustc-1.85.0-src

I didn't check for the other 4 GB yet...


Upstream added src/gcc in 1.83. Yikes!
=E2=9D=AF cat rustc-1.83.0-src/src/gcc/gcc/BASE-VER
14.0.1

A full compiler tree - not fun! :-(

In rust 1.85=C2=A0 src/gcc was removed.

Here's the gcc removal commit:
https://github.com/rust-lang/rust/pull/135658

The "(yet)" part of this is a bit worrying:=C2=A0 "... we should not need=
 it=20
for building anything in the tarballs (yet)"


Given Rust's policy of "just update to the latest and only supported=20
release", they're not likely going to re-spin the 1.83/1.84 tarballs
but we should try to get a 1.83.1 and 1.84.1 anyway.

If upstream doesn't fix re-spin:

Should we do that an host the tarball=C2=A0 on yoctoproject.org?
Should we write a custom unpack rule to --exclude=3Drustc-1.83.0-src/src/=
gcc ?


We need to understand why they think they might eventually need to=20
bundle gcc (bootstrapping?) and explain:
 =C2=A0 1. the yocto/OE use case and how painful it is for developers who=
=20
update daily, and pay a huge rust tax, in time, disk space, and=20
electricity use
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 not to mention the download tax it =
places on the YP infrastructure.

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Maybe if they know where we are coming fr=
om, they can show a bit=20
of compassion and understanding.

 =C2=A0 2. that they should be making smaller tarballs for general users
 =C2=A0 3. that they should be working on up-streaming their llvm diffs s=
o=20
that the tarball can actually shrink.

I'll work on that next week.

Note that 1.85 is ~300 MB bigger thanks to a new tool:
https://enzyme.mit.edu/

which=C2=A0 takes arbitrary existing code as LLVM IR and computes the=20
derivative (and gradient) of that function.
I don't know what that really means but apparently it's used for code=20
minimization and therefore run-time optimization.
Most of that 300 MB is a benchmark... sigh.

Deepesh,

Please check for this sort of significant size changes and mention it to=20
people when you notice it.
Also please open an issue for enzyme to ask if the benchmark data can be=20
kept in a separate crate.

Next week, I'll also dig into the 'tmp' usage increase to understand=20
where the 5 GB that Richard reported comes from.


All for today,

../Randy



--------------FX12QTozi2XjfnrKMYJmYUzO
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 527Kvh0r024343

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-03-05 8:44 a.m., Varatharajan,
      Deepesh via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20250305134459.2275598-2-Deepes=
h.Varatharajan@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">From: Deepesh Varatharajan <=
a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Deepesh.Varatharajan@win=
driver.com">&lt;Deepesh.Varatharajan@windriver.com&gt;</a>

Rust stable version updated to 1.83.0.
<a class=3D"moz-txt-link-freetext" href=3D"https://blog.rust-lang.org/202=
4/11/28/Rust-1.83.0.html">https://blog.rust-lang.org/2024/11/28/Rust-1.83=
.0.html</a>

Renamed and modified the below patch to adapt the new version.
rv32-cargo-rustix-0.38.34-fix.patch-&gt;rv32-cargo-rustix-0.38.37-fix.pat=
ch

Modified the below patches to adapt the new version.
repro-issue-fix-with-cc-crate-hashmap.patch
revert-link-std-statically-in-rustc_driver-feature.patch

Dropped: zlib-off64_t.patch
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/madler/zlib=
/commit/a566e156b3fa07b566ddbf6801b517a9dba04fa3kq">https://github.com/ma=
dler/zlib/commit/a566e156b3fa07b566ddbf6801b517a9dba04fa3kq</a>

Because of the following commit ,
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lang/r=
ust/commit/68034f837a39387e49fc7d7c5b088f5372a1127e">https://github.com/r=
ust-lang/rust/commit/68034f837a39387e49fc7d7c5b088f5372a1127e</a>
when we enable lib32, getting build failure because there is a check for =
target
support for &quot;-Zdual-proc-macros&quot; flag not functioning properly =
when lib32 is
enabled in the build environment. So for now reverting this commit and br=
ing
back the previous behavior, where the &quot;-Zdual-proc-macros&quot; flag=
 is always
added for building proc macros, regardless of the target architecture's s=
upport.
This would bypass the check introduced in the patch, allowing the build t=
o
proceed without error, even when building for a 64-bit architecture with =
lib32 enabled.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Summary:&nbsp;</p>
    <p>rust-1.83 (and 1.84)&nbsp; has a full gcc-14 tree, bloating the ta=
r.xz
      by 128 Mb, unpacked sources by 1.3 GB.<br>
      The build impact seems to be 5 GB . This was an upstream error
      that has been fixed in 1.85.<br>
      <br>
      If you think this is unacceptable, please read on and reply to my
      suggestions about what we could do.<br>
    </p>
    <p><br>
    </p>
    <p>Details:<br>
    </p>
    <p>Richard pointed out that the buildperf info here:<br>
      &nbsp;
<a class=3D"moz-txt-link-freetext" href=3D"https://valkyrie.yocto.io/pub/=
non-release/20250307-81/testresults/buildperf-alma8/perf-alma8-vk_master_=
20250307150029_5323603048.html">https://valkyrie.yocto.io/pub/non-release=
/20250307-81/testresults/buildperf-alma8/perf-alma8-vk_master_20250307150=
029_5323603048.html</a>
      <br>
    </p>
    <p>shows that rust 1.83 added 5GB to TMPDIR disk usage !!</p>
    <p>The Rust .tar.xz went from 210M -&gt; 337 MB, 1.84 and I checked
      1.85 is down a bit to 261 MB. <br>
    </p>
    <p>=E2=9D=AF ls -sh *xz| cat<br>
      210M rustc-1.82.0-src.tar.xz<br>
      338M rustc-1.83.0-src.tar.xz<br>
      339M rustc-1.84.0-src.tar.xz<br>
      262M rustc-1.85.0-src.tar.xz</p>
    <p>=E2=9D=AF for i in `ls -d *src`; do du -sh $i; done<br>
      3.5G&nbsp;&nbsp;&nbsp; rustc-1.82.0-src<br>
      4.8G&nbsp;&nbsp;&nbsp; rustc-1.83.0-src<br>
      4.9G&nbsp;&nbsp;&nbsp; rustc-1.84.0-src<br>
      3.9G&nbsp;&nbsp;&nbsp; rustc-1.85.0-src<br>
    </p>
    <p>I didn't check for the other 4 GB yet...</p>
    <p><br>
    </p>
    <p>Upstream added src/gcc in 1.83. Yikes!<br>
      =E2=9D=AF cat rustc-1.83.0-src/src/gcc/gcc/BASE-VER<br>
      14.0.1</p>
    <p>A full compiler tree - not fun! :-(<br>
      <br>
      In rust 1.85&nbsp; src/gcc was removed.<br>
      <br>
      Here's the gcc removal commit: <br>
      &nbsp;&nbsp; <a class=3D"moz-txt-link-freetext" href=3D"https://git=
hub.com/rust-lang/rust/pull/135658">https://github.com/rust-lang/rust/pul=
l/135658</a>&nbsp; <br>
      <br>
      The &quot;(yet)&quot; part of this is a bit worrying:&nbsp; &quot;.=
.. we should not
      need it for building anything in the tarballs (yet)&quot;<br>
      <br>
      <br>
      Given Rust's policy of &quot;just update to the latest and only
      supported release&quot;, they're not likely going to re-spin the
      1.83/1.84 tarballs<br>
      but we should try to get a 1.83.1 and 1.84.1 anyway.<br>
    </p>
    <p>If upstream doesn't fix re-spin:<br>
      <br>
      Should we do that an host the tarball&nbsp; on yoctoproject.org?<br=
>
      Should we write a custom unpack rule to
      --exclude=3Drustc-1.83.0-src/src/gcc ?<br>
    </p>
    <p><br>
      We need to understand why they think they might eventually need to
      bundle gcc (bootstrapping?) and explain:<br>
      &nbsp; 1. the yocto/OE use case and how painful it is for developer=
s
      who update daily, and pay a huge rust tax, in time, disk space,
      and electricity use<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; not to mention the download ta=
x it places on the YP
      infrastructure.<br>
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Maybe if they know where we are comi=
ng from, they can show a
      bit of compassion and understanding.<br>
      <br>
      &nbsp; 2. that they should be making smaller tarballs for general u=
sers
      <br>
      &nbsp; 3. that they should be working on up-streaming their llvm di=
ffs
      so that the tarball can actually shrink.<br>
      <br>
    </p>
    I'll work on that next week.<br>
    <br>
    <p>Note that 1.85 is ~300 MB bigger thanks to a new tool:<br>
      &nbsp;&nbsp;&nbsp; <a class=3D"moz-txt-link-freetext" href=3D"https=
://enzyme.mit.edu/">https://enzyme.mit.edu/</a>&nbsp;</p>
    <p>which&nbsp; takes arbitrary existing code as LLVM IR and computes =
the
      derivative (and gradient) of that function.<br>
      I don't know what that really means but apparently it's used for
      code minimization and therefore run-time optimization.<br>
      Most of that 300 MB is a benchmark... sigh.<br>
    </p>
    <p>Deepesh, <br>
      <br>
      Please check for this sort of significant size changes and mention
      it to people when you notice it.<br>
      Also please open an issue for enzyme to ask if the benchmark data
      can be kept in a separate crate.<br>
      <br>
      Next week, I'll also dig into the 'tmp' usage increase to
      understand where the 5 GB that Richard reported comes from.<br>
    </p>
    <p><br>
    </p>
    <p></p>
    <p>All for today,</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <br>
  </body>
</html>

--------------FX12QTozi2XjfnrKMYJmYUzO--

