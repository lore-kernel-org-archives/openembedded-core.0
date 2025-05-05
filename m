Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04E9C369C2
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 04:06:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.43154.1746418010150065118
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 21:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7220e56557=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5453vqRA032275
	for <openembedded-core@lists.openembedded.org>; Sun, 4 May 2025 21:06:49 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46dee395qt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 21:06:49 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54545HB6009381
	for <openembedded-core@lists.openembedded.org>; Sun, 4 May 2025 21:06:48 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46dee395qs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 21:06:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+ZxlkTigD5apZn9kobFBxDM5rJjD1hqOx07fKAtX0MSb1vsSOKE0KD8BcrbpAO8xkvp15bpfviHY18Qw7wcXCCg2753eExmBe2jn5g9+GDiQ4rtoAs3gWGWg0rq2P8DDp29hxcQ76CuVXF83Py4qcoZA/Kk3OPEwufONtdRnzN9pyttZ0zCISL8+Ogw4341t/HG7eErrW6Xi5QmGw0Ht3ruodzc4xUpd166bt0dyavDXagCVOVQ7PxAW9P+i854ZtXgk6kzqx7ABYBcWSrlNviSM8pBCWq3MDgAMinNR1UANjTe4TN9N6s9qsPZ3GaD5c4CRx3cRSuut02yy1TvGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgQ1UaN4JBigm0JJH97qLErCE4fKGq9XuLJzDJNhyNI=;
 b=UchS4M0M4xbuR52OMjP33OUeJiOogJdFCMofCCPd155zK/+sRAG84Zky4I/dtR3XFT7XIgoa6GpMhaHX5HUHBLekIQrVTUf433DGoNIIuBhv5qwGNcC23nkgzVcvXpaxFWr4zW1JUXwDmcZrxWpjoWzZhP7DxgU2JX8kXt4mWG1CUkP1VMTOfbXiTJNiLkUwjoUZ7NcWQfevo63nkD9ViOonnez7bAcx0fRpeaUhYxEYmdxkbQzJZ7ihGHUCGibk+cV4l7hnxefGKPVuBwRmtJMFHFH8QSVOG+kVCQMH+RRAKIsUAJjSs4oyx5A1f8/ZFeqcWX9k7in7caRxC/llLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DM3PR11MB8683.namprd11.prod.outlook.com (2603:10b6:8:1ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Mon, 5 May
 2025 04:06:43 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.8699.026; Mon, 5 May 2025
 04:06:43 +0000
Content-Type: multipart/alternative;
 boundary="------------Y1xMc1jeHHBbnnMPgQgJsj8b"
Message-ID: <55bd7dac-0ce8-4e0c-8e2c-0872e6fbdae3@windriver.com>
Date: Mon, 5 May 2025 09:36:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH] glibc: stable 2.39 branch updates
To: Randy MacLeod <rwmacleod@gmail.com>, raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20250501030313.638148-1-Deepesh.Varatharajan@windriver.com>
 <CAMKF1soiQ=bmtZwHLLZ4OAEHA=8r04mQ0ATyFmcCaZmy27tXVQ@mail.gmail.com>
 <c887b509-4283-4488-8e82-8ba35ca99678@windriver.com>
 <CAMKF1srKGQAWrGhw-g9ZNtgNvNyUKfT2iSbs30FQQMOAnoD2UQ@mail.gmail.com>
 <CAK6=ix6W7BiMLD=nGQTRTXSPn4pi_jAYRRFFVADOsf_MYoDMNg@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CAK6=ix6W7BiMLD=nGQTRTXSPn4pi_jAYRRFFVADOsf_MYoDMNg@mail.gmail.com>
X-ClientProxiedBy: BY3PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:254::23) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DM3PR11MB8683:EE_
X-MS-Office365-Filtering-Correlation-Id: 04dfcec3-394b-4056-d058-08dd8b8a3e5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SjJqMXovdGhpRGxHSjQ3NnpwMWdwTEVXOEVrWnlUUkhHelpJbzZ6OEZyZzVj?=
 =?utf-8?B?enkzZ3RnQTEwanZtR09obFBNbzBXVjJza1NmSjc5OTFHT3BndUVyelYzeUxZ?=
 =?utf-8?B?Mnk2VjhZQmY1WWtFVS9tNVdpbkJoT1EvT3VVQjA5cUxHM2RxQUpvOXJWVFVm?=
 =?utf-8?B?bVhIVGVva0hSMzgrNHAwQXRGWEFjTnR0cExkazF0ZWlCOVVYMzg3d0p1OXVR?=
 =?utf-8?B?cFoyU1pyM0tFNGZ4NzV5OTB1b21Idm1kSFhnTi9zQ2NFTFhaZEtHTjhtbkI0?=
 =?utf-8?B?Y3g5OUpjZ2psS0MzWjBXTCtaak5LR3R3QmNteXFQV3pnNXhCZkJBeW9ieVBl?=
 =?utf-8?B?eGdjQWV4WW9XQWtnMCs4QTRKSjBjUU1IanJkSjJ4ZWlBTUN4R2JFbWI0RitK?=
 =?utf-8?B?bnhFbmNaZS9KbWtVeXBwa2pNbGp5TzNoenc1SVZBU0hsY0MwZmp3TTBLZU53?=
 =?utf-8?B?Snd6OU1XWDlMVFZPd00wVGRncFJSUEIrdWdVTE9JQTN0Tm5GYnJqdTkrRkJl?=
 =?utf-8?B?RFNWVDhXVnR3WEhNU2RkVEJQMmpHcTVpNVBrcVpydTFkWkpHdHArMXlwV0Jn?=
 =?utf-8?B?Q1hBMTZZTnRQS044MnBVQ1lMcjBwWkF1clJSMVNGSmtkbHlGRkhZZEVkbkkz?=
 =?utf-8?B?WlZSVDZ3ZXI2ei9Bc3N4cWI1YUtjditWWVB0aDRweXp0eUtFelEyb1RIcU8v?=
 =?utf-8?B?UEhvNWNJcGkySFpOK3ZwcStyRnZnZ2hpQXQrczhKcFpwdktnOWZqOE52VThJ?=
 =?utf-8?B?MDhzT3hLYWlKTEpUU1NGMGpVQnh5cjdBT2NkQTZ3bU9BU0FsR2dNNG5SK3lO?=
 =?utf-8?B?VmVHRStEZ01IcXBOZHVQeEl5M1FYaWcrTklOV1JWOWhJR0RXSjVtRFBEbm1K?=
 =?utf-8?B?c0MxcERiR0pRK3Z4SkkzVG9sRnVRSlMyVUZjRGNOZmhaL0RnZTVOMy9OYWIy?=
 =?utf-8?B?T3Z6eVNwbEhVUEoybGViT2Y4TmE0Ni9hSmVTYzJ5d25EVnRtS2FsQjhOMlEx?=
 =?utf-8?B?TldYVS9Dc1JsbGMzZ2wwcnBaOVZDNVdWV24yVnpLV0RkT2hGYTNvU29uN1Fq?=
 =?utf-8?B?cURRSXZtVnlIdHZWQ1V6U240MFRTUDB3OXBpcWxFRlBnT0JpYmZCQWdSUHBG?=
 =?utf-8?B?cGxIRXBCOW5WQWcwSDAvVGc3MVF6QTcxNVZ5UVZBK25qQ1prVVJJR1dpbnZL?=
 =?utf-8?B?VDJ4RXRZMHNQdk5YVDZFQmhWeXdNK3g2TWZkNGZCZGJpRitIYTZ3NzF2YzZu?=
 =?utf-8?B?eW5rRldSRUswWXBPRGR3YVVvb0w3dEpDc1dSdVdPdk94UDZZWjRMbWNDYXUy?=
 =?utf-8?B?dHcvamdjak1LN3lHakJLa3Q5U1VOL1I1dlhmK2tBVUFsYzA5RnBnRXBTbnNr?=
 =?utf-8?B?aUU5WXBoV0dxZEU4SytrcEN6MlpBMjRsZUZMSUdURys4ckpETHUxQ2lUUVkr?=
 =?utf-8?B?MmZZVUtPb2ZQaUw4WktTNWFxbndTVGFpODJSbkNRcWFUS1FpMjRtS29IYTZV?=
 =?utf-8?B?TEsvMjBUUDVlR1B4RFpGVlExUm16My8zSnd2aVk0REVqcmpKRDdwcnhzQmFZ?=
 =?utf-8?B?YWtvZFVPeTNoQ3pZc1M3WitmQ0tBUUxpbkhyejhpcjBHOXZFM3dsc21FUVdE?=
 =?utf-8?B?TUlWZWoxUDA2TTVicEVzRVk5MXpmN1V5LzcwV3N2WnpEdTI2ZklDRlVNdFRL?=
 =?utf-8?B?ZWFjSlhxYjJoYUVnZTFqSWRmQ0s4aEdVKzZoNVdmU2VSK3dibW9oZlN1eUIv?=
 =?utf-8?B?Z2t4VmpCVWhVR202TjFub0R2VHIvb3ZhVXN2ZGx2ZzhnU05rZUZoUzZvckpq?=
 =?utf-8?Q?ICANF+YHEUQvbV+e6WPqoz5Bc8Odw4pLJfAi0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OElCVGNwdmZiWXM5bTBhQU16WHBOTktFQlFzb2h0L1BPTTFCaDFnZFNINFo1?=
 =?utf-8?B?dlptSDMyazgvcHlMeDkvOTVhSW5UNHR1VTFxc3hqRFVKbFJQNDUydVFYRDEy?=
 =?utf-8?B?Y3NFZ2VCS1drbWlpamN2dGJYdGtRbVVNUk44cGRscXFObWIxR0ttcTVMZkNX?=
 =?utf-8?B?clFod24wdGEzdGlJQTEvQVBtUFdzQTVsa2VYbzEyaTBROHhMclF4dGxFekVS?=
 =?utf-8?B?Qm0wWDQzblo4WVdzUGNJM0pNUVJheHdXbkZkNE9kTFBxVmNJQmxiSlpuaVla?=
 =?utf-8?B?VXJVbjRZbmVsaUorbDdQL0lvRjQycjRTQU1XTFF0MVI5Z2h5SGErQ2ZLN2RQ?=
 =?utf-8?B?R1U3T2Q0MTQzam10bmpEa0lWQmNvdzFrN3BITzJRTnRZZ241L3NVaFFqRnJI?=
 =?utf-8?B?UHRzcEloWTVOb3lUTW1ROFpxdlhlOE0vOXE0V1psRG5HMjFkOEVxT3VUZnlU?=
 =?utf-8?B?UkhwSERBMzVyNTlqMFlhZ0ErWnpoa3JBa21XWW0ycE9PMTBpSHM5Z2pqVW5L?=
 =?utf-8?B?bmdFN2pHOG9ucCs2UVdxME9YQzlZRGc0Mlk3SncweDlsZWpWQXRLcGpxUWRI?=
 =?utf-8?B?VDZhenY5VFVOZGRHTXlBYitxT1k4Q3A5cjdRaXY4L203OGx0ME4wUTlGaUow?=
 =?utf-8?B?bTVTb3RuRUZZREJnaXpLYnJGK25HK3NjWWk0MTZPK2xRWWJNRjRtK3g5MGpF?=
 =?utf-8?B?cU00cUhYdXVhVVZ4a2t0MzJOQ1luRWF6MDJzaCtiajQxZk03RW5lUklQc3J4?=
 =?utf-8?B?Y3NsOGZHNWN3RVZWcTRPdVBHQllVOFdVd3RpZ0V0VjF4RFBIQmVDRlRKSW1S?=
 =?utf-8?B?bVRob2NnRzdGdVpKVWV3dHVYV2JqNGU3WGpVY3pseXhIelRJVzM5QlY3M3pL?=
 =?utf-8?B?Rzg1TTV2Q2tFNHRoT09qQlp0N3JYY2FpdUNqU25QMEQ3bHJpYXJWUWRzUWNq?=
 =?utf-8?B?V1ppTzJTL1ZHYWpUUzJkanRxTmwxaE8zZ3E3ckJvdEIvRS9DeGJPQ3NEd2gy?=
 =?utf-8?B?TVMrZzhjaS83endJeE80UTJsU2lKbkxibEUxSytJcXJlVWJScHZxNDhNN1ZR?=
 =?utf-8?B?WHJWV2w0QU9zT292bGdwSUFTeGhMRWV2aXZZdHcra0xzSlFlZy82TjluU0xq?=
 =?utf-8?B?UVdDSWFpZi9aTkN5M21YMnNNeEtKdGxvVVpJT296aFBSZ21mT0JWaUV3NVQ3?=
 =?utf-8?B?V3Z2MVRHWWtWK0xCNmY2YTFRelhVMHA2ekdEdmVHV3VCVDl0Q0FkZEliV1I3?=
 =?utf-8?B?RkJpL1czNERocTRtckVLNU1NK25ZOGkvQzZpajNvbUtlQmFtUVZqQ3NaUkth?=
 =?utf-8?B?K082cEQ4Z3I0Nm1vWnVsMkdERU53VWRSc1hlOFlEakxxL1ZROXNNTy84Y1NB?=
 =?utf-8?B?YmJGUDBZN3FkV2VjM1FPSWs4TGZxSTNBZUtXVy9tWUU3djM1UUFmcElQQ0xi?=
 =?utf-8?B?QlhHOS9zT2VaR3FiV21mRFBxYmhWeDBtbmd6Sm5ra09yazBDR3ZMTENqQkIz?=
 =?utf-8?B?TVhjRzArK3ZZU0VoSzVwdTVSU3hLZk1qc3hpakFMamVMNFZyTXZaV0RQalN6?=
 =?utf-8?B?TXRSMGtWb0ZodzFhK09uOGVSYjVvQkFQdGZIOUVqUDIxYWt3MnpNR3NhYkJ1?=
 =?utf-8?B?UENXcUNjQkIreUhaWnpkeHE5U3BNS296dzJZazNYcE5uNWQzanBseTRGSlpl?=
 =?utf-8?B?UDVFTk5ydVpFVVVLdC91OG5uMHlRRXBOelF6cVRUenIwRUV1amFWREJwZjRK?=
 =?utf-8?B?VDhqemFXNGhXSDk3ZmJkU2VrbElTOFRxdG5CcnFERm0zMjVaZ0FyQ1VlVU03?=
 =?utf-8?B?M3dvNjFZN1puR2pZbFpJNkJSWlRVQUd4T1FVWlZSbHUzckpiVXQvclovcXpL?=
 =?utf-8?B?SElSMHNmbXZiOWdTZXhSNG5qKzNHTTI5N0ppdHRZUkFhSk1yUG1FQTFYcTg1?=
 =?utf-8?B?ZFFMTHBXLzBCeEV3MGVraE5QU1JmSjZmNS84NmhmOXJhamE4Q2s3SHkvd0pV?=
 =?utf-8?B?SFdCN1M3Yks3UXJGcmpGOWRBcHNyYWZZcGxhOTdhL0d2TllGdGxPdmpzS04v?=
 =?utf-8?B?aE9pbFlmY2ZiV2QzSkJuTElLRDhuKzEycmhaQlI5Rk5FK0hkMHRMYlJNdHRU?=
 =?utf-8?B?dHhSMWFtSEVMUDB2ZUVHKzJnQ2MwUU5IWm9UQVhMeFIxOUJoc1c3RFFoaEpl?=
 =?utf-8?Q?jDYXn3RuOcJyXY5K7gIRahE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04dfcec3-394b-4056-d058-08dd8b8a3e5e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 04:06:42.9888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rEISgEVVA+2Wai4hv3Y3otxNfjc+RDK/2WWSr/RZ1qHjPkNvPNh367uNl4yStmgR4M3TNkIMTEIiUVHWfUEBXsWpOEirvA+i4BWaO+zcsaPvbumCn106azR5f1OMWj8x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8683
X-Proofpoint-ORIG-GUID: cftAO_OtlDE9HXChSxDUKicT-fiYjBrc
X-Authority-Analysis: v=2.4 cv=Pd3/hjhd c=1 sm=1 tr=0 ts=68183959 cx=c_pps a=6H1ifQWhBrriiShMtbI+RA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=Q4-j1AaZAAAA:8 a=xYs9qb22AAAA:8 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=Xulbuw_zI2CJpEj9IP4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Ru9XXK_SiqNBhQ9vu4UA:9 a=dXMrRvzmwBmmZyLo:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=6yXVcWBlFjK_M4UFds7R:22 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 7rD1QdvjydlbvMSQkTufo0mdJCPRA2pe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAzNyBTYWx0ZWRfX0HiLsk60lr06 H28+sMKfF/WM8QI5l4NEk65UVO3ofl1gFxpgtgCSf5m3NJ28hE6C29Ax6zD+Zx7hAJjkUWPtvUV x3wxQZY/WzJbUHS4flUH/gRNCRV56WMZA0LzYQAFz7Ea3r45vtGMxPUB06ZPMChMa7IwI+6Z/G7
 eH/nniQUruM5dIM4S7Hy1S/VIca6gDwmJbLKvUUc4ayBICVf76TdkOa0zjfgFdn7WZpkRqMeSSV EB5RDyYayvbIT/jMGI+AN8ky0Tws0pfBbuExVLz2H6ar19JzUhH6y8Sg3akpY/a9CCFYJznTBeG /hd8tq2/uZknH0PLadrlTQrdYwxS8P5ilrrRvLGgUc8j28/2QSvEsOfZlo5HUAvNGDyAqCvaoBT
 qFlzk03pxclYD1GlmnBqoGq+LQ8Flzd38JHaBe3PRSc3zpDShyiDHoKBGh3s+cME7TmnhNMa
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505050037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 04:06:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215975

--------------Y1xMc1jeHHBbnnMPgQgJsj8b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5453vqRA032275


On 02-05-2025 16:04, Randy MacLeod wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
> Deepesh, please fix the labeling error and send a v2.
>
> Randy
>
Sure Randy, Sending a V2 with correct labeling.

Deepesh
>
>
> On Thu, May 1, 2025, 23:26 Khem Raj via lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!d-A5qgU575RYSUFLHx6inmrZafHt5Qgy0SNGj4ohlKZsCCH1611qT8Ptie6BnHgVN06tS=
vBVpUnYgFjbF9Xp52ErYst8$>=20
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
>     On Thu, May 1, 2025 at 8:15=E2=80=AFPM Deepesh Varatharajan
>     <deepesh.varatharajan@windriver.com> wrote:
>     >
>     >
>     > On 01-05-2025 11:24, Khem Raj wrote:
>     > > CAUTION: This email comes from a non Wind River email account!
>     > > Do not click links or open attachments unless you recognize
>     the sender and know the content is safe.
>     > >
>     > > On Wed, Apr 30, 2025 at 8:03=E2=80=AFPM Varatharajan, Deepesh v=
ia
>     > > lists.openembedded.org
>     <https://urldefense.com/v3/__http://lists.openembedded.org__;!!Ajve=
Ydw8EvQ!d-A5qgU575RYSUFLHx6inmrZafHt5Qgy0SNGj4ohlKZsCCH1611qT8Ptie6BnHgVN=
06tSvBVpUnYgFjbF9Xp52ErYst8$>
>     > > <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> w=
rote:
>     > >> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com=
>
>     > >>
>     > >> 3463100f2d x86: Detect Intel Diamond Rapids
>     > >> e09436c2cb x86: Handle unknown Intel processor with default
>     tuning
>     > >> 7620d98186 x86: Add ARL/PTL/CWF model detection support
>     > >> 765ff3d0d4 x86: Optimize xstate size calculation
>     > >> 65ae73be01 x86: Use `Avoid_Non_Temporal_Memset` to control
>     non-temporal path
>     > >> 2be36448c4 x86: Tunables may incorrectly set
>     Prefer_PMINUB_for_stringop (bug 32047)
>     > >> bde201e92c x86: Disable non-temporal memset on Skylake Server
>     > >> 38a7632f2d x86: Fix value for
>     `x86_memset_non_temporal_threshold` when it is undesirable
>     > >> cc59fa5dbc x86: Enable non-temporal memset tunable for AMD
>     > >> 0da58e8be0 x86: Add seperate non-temporal tunable for memset
>     > >> 837a36c371 x86: Link tst-gnu2-tls2-x86-noxsave{,c,xsavec}
>     with libpthread
>     > >> 87ab0c7f7f x86: Use separate variable for TLSDESC
>     XSAVE/XSAVEC state size (bug 32810)
>     > >> 60cd7123a6 x86: Skip XSAVE state size reset if ISA level
>     requires XSAVE
>     > >> 4cf3f9df54 x86_64: Add atanh with FMA
>     > >> 01ed435e2e x86_64: Add sinh with FMA
>     > >> 0edcc77fe7 x86_64: Add tanh with FMA
>     > >> 7ecf0d3bde x86-64: Exclude FMA4 IFUNC functions for -mapxf
>     > >> e1fe22368e nptl: clear the whole rseq area before registration
>     > >> dd8c0c3bbd math: Improve layout of exp/exp10 data
>     > >> a1b09e59e2 AArch64: Use prefer_sve_ifuncs for SVE memset
>     > >> d0e2133470 AArch64: Add SVE memset
>     > >> 0cc12d9c47 math: Improve layout of expf data
>     > >> 0cd10047bf AArch64: Remove zva_128 from memset
>     > >> dd1e63ab58 AArch64: Optimize memset
>     > >> 65a96a6f2b AArch64: Improve generic strlen
>     > >> 4073e4ee2c AArch64: Improve codegen for SVE logs
>     > >> 78abd3ef6e AArch64: Improve codegen in SVE tans
>     > >> a10183b633 AArch64: Improve codegen of AdvSIMD atan(2)(f)
>     > >> dcd1229e5b AArch64: Improve codegen of AdvSIMD logf function
>     family
>     > >> 72156cb90b AArch64: Improve codegen in AdvSIMD logs
>     > >> 5e354bf4e2 AArch64: Simplify rounding-multiply pattern in
>     several AdvSIMD routines
>     > >> 80df456112 aarch64: Avoid redundant MOVs in AdvSIMD F32 logs
>     > >> d591876303 aarch64: Fix AdvSIMD libmvec routines for big-endia=
n
>     > >> f6d48470ae assert: Add test for CVE-2025-0395
>     > >>
>     > >> Testresults:
>     > >> After update=C2=A0 =C2=A0 |Before update=C2=A0 =C2=A0|Differen=
ce
>     > >> PASS: 5068=C2=A0 =C2=A0 =C2=A0 |PASS: 5072=C2=A0 =C2=A0 =C2=A0=
 |PASS: +4
>     > > +4 should mean more passes after update but the table shows
>     otherwise.
>     > > Can you list the 4 tests which are passing now ?
>     > Hi Khem,
>     >
>     > Apologies for the confusion, there was a typo. I mistakenly
>     listed the
>     > 'after update'
>     > passing test cases under 'before update' and vice versa. The
>     following four
>     > additional test cases passed after the update:
>     >
>     > PASS: assert/tst-assert-sa-2025-0001
>     > PASS: elf/tst-gnu2-tls2-x86-noxsave
>     > PASS: elf/tst-gnu2-tls2-x86-noxsavec
>     > PASS: elf/tst-gnu2-tls2-x86-noxsavexsavec
>
>     That looks good. Thanks
>
>     >
>     > Regards,
>     > Deepesh
>     > >> FAIL: 120=C2=A0 =C2=A0 =C2=A0 =C2=A0|FAIL: 120=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|FAIL: 0
>     > >> XPASS: 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 |XPASS: 4=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |XPASS: 0
>     > >> XFAIL: 16=C2=A0 =C2=A0 =C2=A0 =C2=A0|XFAIL: 16=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|XFAIL: 0
>     > >> UNSUPPORTED: 157|UNSUPPORTED: 157|UNSUPPORTED: 0
>     > >>
>     > >> Signed-off-by: Deepesh Varatharajan
>     <Deepesh.Varatharajan@windriver.com>
>     > >> ---
>     > >>=C2=A0 =C2=A0meta/recipes-core/glibc/glibc-version.inc
>     <https://urldefense.com/v3/__http://glibc-version.inc__;!!AjveYdw8E=
vQ!d-A5qgU575RYSUFLHx6inmrZafHt5Qgy0SNGj4ohlKZsCCH1611qT8Ptie6BnHgVN06tSv=
BVpUnYgFjbF9Xp5wcntotK$>
>     | 2 +-
>     > >>=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>     > >>
>     > >> diff --git a/meta/recipes-core/glibc/glibc-version.inc
>     <https://urldefense.com/v3/__http://glibc-version.inc__;!!AjveYdw8E=
vQ!d-A5qgU575RYSUFLHx6inmrZafHt5Qgy0SNGj4ohlKZsCCH1611qT8Ptie6BnHgVN06tSv=
BVpUnYgFjbF9Xp5wcntotK$>
>     b/meta/recipes-core/glibc/glibc-version.inc
>     <https://urldefense.com/v3/__http://glibc-version.inc__;!!AjveYdw8E=
vQ!d-A5qgU575RYSUFLHx6inmrZafHt5Qgy0SNGj4ohlKZsCCH1611qT8Ptie6BnHgVN06tSv=
BVpUnYgFjbF9Xp5wcntotK$>
>     > >> index da9227ccca..040fc793b1 100644
>     > >> --- a/meta/recipes-core/glibc/glibc-version.inc
>     <https://urldefense.com/v3/__http://glibc-version.inc__;!!AjveYdw8E=
vQ!d-A5qgU575RYSUFLHx6inmrZafHt5Qgy0SNGj4ohlKZsCCH1611qT8Ptie6BnHgVN06tSv=
BVpUnYgFjbF9Xp5wcntotK$>
>     > >> +++ b/meta/recipes-core/glibc/glibc-version.inc
>     <https://urldefense.com/v3/__http://glibc-version.inc__;!!AjveYdw8E=
vQ!d-A5qgU575RYSUFLHx6inmrZafHt5Qgy0SNGj4ohlKZsCCH1611qT8Ptie6BnHgVN06tSv=
BVpUnYgFjbF9Xp5wcntotK$>
>     > >> @@ -1,6 +1,6 @@
>     > >>=C2=A0 =C2=A0SRCBRANCH ?=3D "release/2.39/master"
>     > >>=C2=A0 =C2=A0PV =3D "2.39+git"
>     > >> -SRCREV_glibc ?=3D "662516aca8b6bf6aa6555f471055d5eb512b1ddc"
>     > >> +SRCREV_glibc ?=3D "3463100f2d47f2897a24ba8023a5c7aaf2d26550"
>     > >>=C2=A0 =C2=A0SRCREV_localedef ?=3D "fab74f31b3811df543e24b6de47=
efdf45b538abc"
>     > >>
>     > >>=C2=A0 =C2=A0GLIBC_GIT_URI ?=3D
>     "git://sourceware.org/git/glibc.git;protocol=3Dhttps
>     <https://urldefense.com/v3/__http://sourceware.org/git/glibc.git;pr=
otocol=3Dhttps__;!!AjveYdw8EvQ!d-A5qgU575RYSUFLHx6inmrZafHt5Qgy0SNGj4ohlK=
ZsCCH1611qT8Ptie6BnHgVN06tSvBVpUnYgFjbF9Xp590gwa8V$>"
>     > >> --
>     > >> 2.43.0
>     > >>
>     > >>
>     > >>
>     > >>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#215905):
>     https://lists.openembedded.org/g/openembedded-core/message/215905
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/215905__;!!AjveYdw8EvQ!d-A5qgU575RYSUFLHx6inmrZafHt5=
Qgy0SNGj4ohlKZsCCH1611qT8Ptie6BnHgVN06tSvBVpUnYgFjbF9Xp55qQDNpG$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/112554022/953399
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1125=
54022/953399__;!!AjveYdw8EvQ!d-A5qgU575RYSUFLHx6inmrZafHt5Qgy0SNGj4ohlKZs=
CCH1611qT8Ptie6BnHgVN06tSvBVpUnYgFjbF9Xp53KBFH-Q$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!d-A5qgU575RYSUFLHx6inmrZafHt5Qgy0SNGj4=
ohlKZsCCH1611qT8Ptie6BnHgVN06tSvBVpUnYgFjbF9Xp57USO014$>
>     [rwmacleod@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------Y1xMc1jeHHBbnnMPgQgJsj8b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5453vqRA032275

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 02-05-2025 16:04, Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAK6=3Dix6W7BiMLD=3DnGQTRTXSPn4=
pi_jAYRRFFVADOsf_MYoDMNg@mail.gmail.com">
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
        <p dir=3D"ltr">Deepesh, please fix the labeling error and send a
          v2.</p>
        <p dir=3D"ltr">Randy<br>
        </p>
      </div>
    </blockquote>
    Sure Randy, Sending a V2 with correct labeling.<br>
    <br>
    Deepesh<br>
    <blockquote type=3D"cite" cite=3D"mid:CAK6=3Dix6W7BiMLD=3DnGQTRTXSPn4=
pi_jAYRRFFVADOsf_MYoDMNg@mail.gmail.com">
      <div>
        <p dir=3D"ltr">
        </p>
        <br>
        <div class=3D"gmail_quote gmail_quote_container">
          <div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 1, 2025, 23:2=
6
            Khem Raj via <a href=3D"https://urldefense.com/v3/__http://li=
sts.openembedded.org__;!!AjveYdw8EvQ!d-A5qgU575RYSUFLHx6inmrZafHt5Qgy0SNG=
j4ohlKZsCCH1611qT8Ptie6BnHgVN06tSvBVpUnYgFjbF9Xp52ErYst8$" moz-do-not-sen=
d=3D"true">
              lists.openembedded.org</a> &lt;raj.khem=3D<a href=3D"mailto=
:gmail.com@lists.openembedded.org" moz-do-not-send=3D"true" class=3D"moz-=
txt-link-freetext">gmail.com@lists.openembedded.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
            On Thu, May 1, 2025 at 8:15=E2=80=AFPM Deepesh Varatharajan<b=
r>
            &lt;<a href=3D"mailto:deepesh.varatharajan@windriver.com" tar=
get=3D"_blank" rel=3D"noreferrer" moz-do-not-send=3D"true" class=3D"moz-t=
xt-link-freetext">deepesh.varatharajan@windriver.com</a>&gt;
            wrote:<br>
            &gt;<br>
            &gt;<br>
            &gt; On 01-05-2025 11:24, Khem Raj wrote:<br>
            &gt; &gt; CAUTION: This email comes from a non Wind River
            email account!<br>
            &gt; &gt; Do not click links or open attachments unless you
            recognize the sender and know the content is safe.<br>
            &gt; &gt;<br>
            &gt; &gt; On Wed, Apr 30, 2025 at 8:03=E2=80=AFPM Varatharaja=
n,
            Deepesh via<br>
            &gt; &gt; <a href=3D"https://urldefense.com/v3/__http://lists=
.openembedded.org__;!!AjveYdw8EvQ!d-A5qgU575RYSUFLHx6inmrZafHt5Qgy0SNGj4o=
hlKZsCCH1611qT8Ptie6BnHgVN06tSvBVpUnYgFjbF9Xp52ErYst8$" rel=3D"noreferrer=
 noreferrer" target=3D"_blank" moz-do-not-send=3D"true">
              lists.openembedded.org</a><br>
            &gt; &gt; &lt;deepesh.varatharajan=3D<a href=3D"mailto:windri=
ver.com@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer" moz-=
do-not-send=3D"true" class=3D"moz-txt-link-freetext">windriver.com@lists.=
openembedded.org</a>&gt;
            wrote:<br>
            &gt; &gt;&gt; From: Deepesh Varatharajan &lt;<a href=3D"mailt=
o:Deepesh.Varatharajan@windriver.com" target=3D"_blank" rel=3D"noreferrer=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">Deepesh.Varath=
arajan@windriver.com</a>&gt;<br>
            &gt; &gt;&gt;<br>
            &gt; &gt;&gt; 3463100f2d x86: Detect Intel Diamond Rapids<br>
            &gt; &gt;&gt; e09436c2cb x86: Handle unknown Intel processor
            with default tuning<br>
            &gt; &gt;&gt; 7620d98186 x86: Add ARL/PTL/CWF model
            detection support<br>
            &gt; &gt;&gt; 765ff3d0d4 x86: Optimize xstate size
            calculation<br>
            &gt; &gt;&gt; 65ae73be01 x86: Use
            `Avoid_Non_Temporal_Memset` to control non-temporal path<br>
            &gt; &gt;&gt; 2be36448c4 x86: Tunables may incorrectly set
            Prefer_PMINUB_for_stringop (bug 32047)<br>
            &gt; &gt;&gt; bde201e92c x86: Disable non-temporal memset on
            Skylake Server<br>
            &gt; &gt;&gt; 38a7632f2d x86: Fix value for
            `x86_memset_non_temporal_threshold` when it is undesirable<br=
>
            &gt; &gt;&gt; cc59fa5dbc x86: Enable non-temporal memset
            tunable for AMD<br>
            &gt; &gt;&gt; 0da58e8be0 x86: Add seperate non-temporal
            tunable for memset<br>
            &gt; &gt;&gt; 837a36c371 x86: Link
            tst-gnu2-tls2-x86-noxsave{,c,xsavec} with libpthread<br>
            &gt; &gt;&gt; 87ab0c7f7f x86: Use separate variable for
            TLSDESC XSAVE/XSAVEC state size (bug 32810)<br>
            &gt; &gt;&gt; 60cd7123a6 x86: Skip XSAVE state size reset if
            ISA level requires XSAVE<br>
            &gt; &gt;&gt; 4cf3f9df54 x86_64: Add atanh with FMA<br>
            &gt; &gt;&gt; 01ed435e2e x86_64: Add sinh with FMA<br>
            &gt; &gt;&gt; 0edcc77fe7 x86_64: Add tanh with FMA<br>
            &gt; &gt;&gt; 7ecf0d3bde x86-64: Exclude FMA4 IFUNC
            functions for -mapxf<br>
            &gt; &gt;&gt; e1fe22368e nptl: clear the whole rseq area
            before registration<br>
            &gt; &gt;&gt; dd8c0c3bbd math: Improve layout of exp/exp10
            data<br>
            &gt; &gt;&gt; a1b09e59e2 AArch64: Use prefer_sve_ifuncs for
            SVE memset<br>
            &gt; &gt;&gt; d0e2133470 AArch64: Add SVE memset<br>
            &gt; &gt;&gt; 0cc12d9c47 math: Improve layout of expf data<br=
>
            &gt; &gt;&gt; 0cd10047bf AArch64: Remove zva_128 from memset<=
br>
            &gt; &gt;&gt; dd1e63ab58 AArch64: Optimize memset<br>
            &gt; &gt;&gt; 65a96a6f2b AArch64: Improve generic strlen<br>
            &gt; &gt;&gt; 4073e4ee2c AArch64: Improve codegen for SVE
            logs<br>
            &gt; &gt;&gt; 78abd3ef6e AArch64: Improve codegen in SVE
            tans<br>
            &gt; &gt;&gt; a10183b633 AArch64: Improve codegen of AdvSIMD
            atan(2)(f)<br>
            &gt; &gt;&gt; dcd1229e5b AArch64: Improve codegen of AdvSIMD
            logf function family<br>
            &gt; &gt;&gt; 72156cb90b AArch64: Improve codegen in AdvSIMD
            logs<br>
            &gt; &gt;&gt; 5e354bf4e2 AArch64: Simplify rounding-multiply
            pattern in several AdvSIMD routines<br>
            &gt; &gt;&gt; 80df456112 aarch64: Avoid redundant MOVs in
            AdvSIMD F32 logs<br>
            &gt; &gt;&gt; d591876303 aarch64: Fix AdvSIMD libmvec
            routines for big-endian<br>
            &gt; &gt;&gt; f6d48470ae assert: Add test for CVE-2025-0395<b=
r>
            &gt; &gt;&gt;<br>
            &gt; &gt;&gt; Testresults:<br>
            &gt; &gt;&gt; After update&nbsp; &nbsp; |Before update&nbsp; =
&nbsp;|Difference<br>
            &gt; &gt;&gt; PASS: 5068&nbsp; &nbsp; &nbsp; |PASS: 5072&nbsp=
; &nbsp; &nbsp; |PASS: +4<br>
            &gt; &gt; +4 should mean more passes after update but the
            table shows otherwise.<br>
            &gt; &gt; Can you list the 4 tests which are passing now ?<br=
>
            &gt; Hi Khem,<br>
            &gt;<br>
            &gt; Apologies for the confusion, there was a typo. I
            mistakenly listed the<br>
            &gt; 'after update'<br>
            &gt; passing test cases under 'before update' and vice
            versa. The following four<br>
            &gt; additional test cases passed after the update:<br>
            &gt;<br>
            &gt; PASS: assert/tst-assert-sa-2025-0001<br>
            &gt; PASS: elf/tst-gnu2-tls2-x86-noxsave<br>
            &gt; PASS: elf/tst-gnu2-tls2-x86-noxsavec<br>
            &gt; PASS: elf/tst-gnu2-tls2-x86-noxsavexsavec<br>
            <br>
            That looks good. Thanks<br>
            <br>
            &gt;<br>
            &gt; Regards,<br>
            &gt; Deepesh<br>
            &gt; &gt;&gt; FAIL: 120&nbsp; &nbsp; &nbsp; &nbsp;|FAIL: 120&=
nbsp; &nbsp; &nbsp; &nbsp;|FAIL: 0<br>
            &gt; &gt;&gt; XPASS: 4&nbsp; &nbsp; &nbsp; &nbsp; |XPASS: 4&n=
bsp; &nbsp; &nbsp; &nbsp; |XPASS: 0<br>
            &gt; &gt;&gt; XFAIL: 16&nbsp; &nbsp; &nbsp; &nbsp;|XFAIL: 16&=
nbsp; &nbsp; &nbsp; &nbsp;|XFAIL: 0<br>
            &gt; &gt;&gt; UNSUPPORTED: 157|UNSUPPORTED: 157|UNSUPPORTED:
            0<br>
            &gt; &gt;&gt;<br>
            &gt; &gt;&gt; Signed-off-by: Deepesh Varatharajan &lt;<a href=
=3D"mailto:Deepesh.Varatharajan@windriver.com" target=3D"_blank" rel=3D"n=
oreferrer" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">Deepe=
sh.Varatharajan@windriver.com</a>&gt;<br>
            &gt; &gt;&gt; ---<br>
            &gt; &gt;&gt;&nbsp; &nbsp;meta/recipes-core/glibc/<a href=3D"=
https://urldefense.com/v3/__http://glibc-version.inc__;!!AjveYdw8EvQ!d-A5=
qgU575RYSUFLHx6inmrZafHt5Qgy0SNGj4ohlKZsCCH1611qT8Ptie6BnHgVN06tSvBVpUnYg=
FjbF9Xp5wcntotK$" moz-do-not-send=3D"true">glibc-version.inc</a> | 2 +-<b=
r>
            &gt; &gt;&gt;&nbsp; &nbsp;1 file changed, 1 insertion(+), 1
            deletion(-)<br>
            &gt; &gt;&gt;<br>
            &gt; &gt;&gt; diff --git a/meta/recipes-core/glibc/<a href=3D=
"https://urldefense.com/v3/__http://glibc-version.inc__;!!AjveYdw8EvQ!d-A=
5qgU575RYSUFLHx6inmrZafHt5Qgy0SNGj4ohlKZsCCH1611qT8Ptie6BnHgVN06tSvBVpUnY=
gFjbF9Xp5wcntotK$" moz-do-not-send=3D"true">glibc-version.inc</a>
            b/meta/recipes-core/glibc/<a href=3D"https://urldefense.com/v=
3/__http://glibc-version.inc__;!!AjveYdw8EvQ!d-A5qgU575RYSUFLHx6inmrZafHt=
5Qgy0SNGj4ohlKZsCCH1611qT8Ptie6BnHgVN06tSvBVpUnYgFjbF9Xp5wcntotK$" moz-do=
-not-send=3D"true">glibc-version.inc</a><br>
            &gt; &gt;&gt; index da9227ccca..040fc793b1 100644<br>
            &gt; &gt;&gt; --- a/meta/recipes-core/glibc/<a href=3D"https:=
//urldefense.com/v3/__http://glibc-version.inc__;!!AjveYdw8EvQ!d-A5qgU575=
RYSUFLHx6inmrZafHt5Qgy0SNGj4ohlKZsCCH1611qT8Ptie6BnHgVN06tSvBVpUnYgFjbF9X=
p5wcntotK$" moz-do-not-send=3D"true">glibc-version.inc</a><br>
            &gt; &gt;&gt; +++ b/meta/recipes-core/glibc/<a href=3D"https:=
//urldefense.com/v3/__http://glibc-version.inc__;!!AjveYdw8EvQ!d-A5qgU575=
RYSUFLHx6inmrZafHt5Qgy0SNGj4ohlKZsCCH1611qT8Ptie6BnHgVN06tSvBVpUnYgFjbF9X=
p5wcntotK$" moz-do-not-send=3D"true">glibc-version.inc</a><br>
            &gt; &gt;&gt; @@ -1,6 +1,6 @@<br>
            &gt; &gt;&gt;&nbsp; &nbsp;SRCBRANCH ?=3D &quot;release/2.39/m=
aster&quot;<br>
            &gt; &gt;&gt;&nbsp; &nbsp;PV =3D &quot;2.39+git&quot;<br>
            &gt; &gt;&gt; -SRCREV_glibc ?=3D
            &quot;662516aca8b6bf6aa6555f471055d5eb512b1ddc&quot;<br>
            &gt; &gt;&gt; +SRCREV_glibc ?=3D
            &quot;3463100f2d47f2897a24ba8023a5c7aaf2d26550&quot;<br>
            &gt; &gt;&gt;&nbsp; &nbsp;SRCREV_localedef ?=3D
            &quot;fab74f31b3811df543e24b6de47efdf45b538abc&quot;<br>
            &gt; &gt;&gt;<br>
            &gt; &gt;&gt;&nbsp; &nbsp;GLIBC_GIT_URI ?=3D &quot;git://<a h=
ref=3D"https://urldefense.com/v3/__http://sourceware.org/git/glibc.git;pr=
otocol=3Dhttps__;!!AjveYdw8EvQ!d-A5qgU575RYSUFLHx6inmrZafHt5Qgy0SNGj4ohlK=
ZsCCH1611qT8Ptie6BnHgVN06tSvBVpUnYgFjbF9Xp590gwa8V$" rel=3D"noreferrer no=
referrer" target=3D"_blank" moz-do-not-send=3D"true">sourceware.org/git/g=
libc.git;protocol=3Dhttps</a>&quot;<br>
            &gt; &gt;&gt; --<br>
            &gt; &gt;&gt; 2.43.0<br>
            &gt; &gt;&gt;<br>
            &gt; &gt;&gt;<br>
            &gt; &gt;&gt; <br>
            &gt; &gt;&gt;<br>
            <br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#215905): <a href=3D"https://urldefense.co=
m/v3/__https://lists.openembedded.org/g/openembedded-core/message/215905_=
_;!!AjveYdw8EvQ!d-A5qgU575RYSUFLHx6inmrZafHt5Qgy0SNGj4ohlKZsCCH1611qT8Pti=
e6BnHgVN06tSvBVpUnYgFjbF9Xp55qQDNpG$" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank" moz-do-not-send=3D"true">
https://lists.openembedded.org/g/openembedded-core/message/215905</a><br>
            Mute This Topic: <a href=3D"https://urldefense.com/v3/__https=
://lists.openembedded.org/mt/112554022/953399__;!!AjveYdw8EvQ!d-A5qgU575R=
YSUFLHx6inmrZafHt5Qgy0SNGj4ohlKZsCCH1611qT8Ptie6BnHgVN06tSvBVpUnYgFjbF9Xp=
53KBFH-Q$" rel=3D"noreferrer noreferrer" target=3D"_blank" moz-do-not-sen=
d=3D"true">
              https://lists.openembedded.org/mt/112554022/953399</a><br>
            Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@list=
s.openembedded.org" target=3D"_blank" rel=3D"noreferrer" moz-do-not-send=3D=
"true">
              openembedded-core+owner@lists.openembedded.org</a><br>
            Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://l=
ists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!d-A5qgU57=
5RYSUFLHx6inmrZafHt5Qgy0SNGj4ohlKZsCCH1611qT8Ptie6BnHgVN06tSvBVpUnYgFjbF9=
Xp57USO014$" rel=3D"noreferrer noreferrer" target=3D"_blank" moz-do-not-s=
end=3D"true">
              https://lists.openembedded.org/g/openembedded-core/unsub</a=
>
            [<a href=3D"mailto:rwmacleod@gmail.com" target=3D"_blank" rel=
=3D"noreferrer" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">=
rwmacleod@gmail.com</a>]<br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------Y1xMc1jeHHBbnnMPgQgJsj8b--

