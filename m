Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C751FD2ECF7
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 13:04:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5873.1768914272402238509
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 05:04:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Qz82CeqW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5480c6e3c8=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K3qvPs2794329
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 13:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=YGewjlgCf4jDZoG1sW6w/SBcOfgC+hE3R4rVa1A42FU=; b=
	Qz82CeqW6DFJFZDpnGnLuxQ+3Br4ElYs0BNi+9ermaxWQOkVwnqSx36y/VDV2oA+
	50ANgD7DC1ARG+84OoDHMb02foNAsnt4KiPHUSGIa6UtY9a046ePX+s/LeyqS9Ux
	Eb0GbNq/Z5GS5WWysGqAun1sab1MQlasvcedNXp4UqKce1MAbP9ux3wSA1fe7SzI
	pMkkgyJQysRQPKsT1xdL5wpt3LIlYq3FWfcEEtwmC0VivyKghce1Ic+JdtftFwjH
	3gOY7M37r9/K6UidNtAa2e281UjuX1Gk52T5oJzwxxa09wwA5EvA9DeiE47Ux9qP
	CXsRNPfAVNUiFHOwY6ZO1A==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011015.outbound.protection.outlook.com [52.101.52.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bqymuk2xw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 13:04:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFV5GL0Knew7Xw3mhBHJIrDQwW6Y5wikPaUW/+dZVRzXYN8EuedACdmYl7iBh9L+YEVjvcKe82Kv6CEedqrIF0ZOqEfdA2tPkcNOdp5ve+Dbl145T4SFD0aHxZUxAjCl7GW0afkRkcAe0CtOWp3/oUih3hnlktZjGkjyVoj/yx4568OM4GK/j4+pFw7VaQplrYlFNsyYVP7S0Q30USeaXqMkRRm87jQoMWC2IDW9G6mgtJQRsHmqGNx1kh+Zr1Q6XVL0lELaT07F9rOwWJ+qeZORR3yJgflBd34HEQwrQZhzbicFhXWjSNBuOevzLLKpGGM84IQ45dgc+RF0Su82Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGewjlgCf4jDZoG1sW6w/SBcOfgC+hE3R4rVa1A42FU=;
 b=ixaFOeoMW6bCIPH0yaWLfhW5Pr3fhoVE4ZIf8Y7D0rIfjeowB/5w2VW5B+2o2+IC+FTkBj5GtzY0JSkNYZ8+C8YvXE8Sr32ugKIIsJdbQlEFAAt4KvlhyS/Q8W9coSF2caPdkBHmbKi+/igCZ8+VpgPVDmACX8qEVkIIVwqyBPP9Lz+NT/a4zHi5/9k8AHOHeiCuAkpzAW0540vVfmGWWkp3xF6V/33++9GEHkVqoBvgg7BihgMXJTTvHI0ytXFp8DaYK3lSVR4zrEc7OIOL6VYaJXgSbmyXFjwbf57wgC3aLfxUIDKaFp2lS8tLgIkme1PE5joSfHLl8UtsDHoJpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB8527.namprd11.prod.outlook.com (2603:10b6:510:2ff::9)
 by SA3PR11MB8024.namprd11.prod.outlook.com (2603:10b6:806:300::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 13:04:26 +0000
Received: from PH7PR11MB8527.namprd11.prod.outlook.com
 ([fe80::43b7:b38f:e039:a5ee]) by PH7PR11MB8527.namprd11.prod.outlook.com
 ([fe80::43b7:b38f:e039:a5ee%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 13:04:26 +0000
Message-ID: <3a203618-fa59-4672-9f5b-995aa1e0f3b4@windriver.com>
Date: Tue, 20 Jan 2026 21:04:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] rpm: 4.20.1 -> 6.0.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <cover.1768802844.git.liezhi.yang@windriver.com>
 <c75310f8f8162bcca3c24dcaf9230cbbdec3f399.1768802844.git.liezhi.yang@windriver.com>
 <CANNYZj_pDx1bwBx4wphrnesESKUBJT3atpk5CWcgTQ_HwN0vgw@mail.gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <CANNYZj_pDx1bwBx4wphrnesESKUBJT3atpk5CWcgTQ_HwN0vgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To PH7PR11MB8527.namprd11.prod.outlook.com (2603:10b6:510:2ff::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8527:EE_|SA3PR11MB8024:EE_
X-MS-Office365-Filtering-Correlation-Id: 35818876-2d21-451a-6fd1-08de58247036
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YXBES2dNVGg4N3FNWHpDWFRlbEsrUFdSVDhtUngvdXZobXFLTG5nNFlScVpQ?=
 =?utf-8?B?eUJLdnEzM0U2SU9WZXI3M3g5M1lVS0NCbmdEaDJoZ003N21kRFY2NFd3RWhR?=
 =?utf-8?B?WWc3UmQrUzhFMTMxSFFZc0RXdmozR3A2YW11b05GWlRBTHJ5VUhrbEhJRUZ1?=
 =?utf-8?B?UnlQYkhjNSsyYUpVNVFqUzVjYlNYSzNWTVN2SVhoYjE2bkF5b1NyVWFGRW5D?=
 =?utf-8?B?WXRad1h6RXM2SUk5MUxlWmxvL3ZEM1ZsMEQzbmtvdWc3QnVIdEVFYkVCRnRz?=
 =?utf-8?B?Ukxod05ueGlJaHcwS2VPSjM5dG5sSUdyd2UwR1RWdlVZUThRTVlsS0FRbDE4?=
 =?utf-8?B?WW9Sa0plei9TY3RlRUlwNHpUcEJjRGJtTThkU3UzS0w5WWF0SHQ5NW5iQW50?=
 =?utf-8?B?TXArL3NtcUhqejBKSjQzM1pQUzMxemxEdEJYMHJDWVorcFVmTXhubWpXNkdu?=
 =?utf-8?B?Tnd2aVUxSllUYStyOWdyaEVBNGZYYjFwbEpaTGtNQWhTckFoajNlSTZ1dTE5?=
 =?utf-8?B?NDlDdWs4WUdJeFUySG85TloxM0JVQ1NBNi9zQm90VU5BeFdHQTN4MVVEQlQr?=
 =?utf-8?B?MFhXaCtXbzYzMmtSb0swcUtSRHJ5OE1BWG5wVzhMZnlsd3VBRFlHd1hldDJk?=
 =?utf-8?B?d2xBV3JkNlVnUjNzWjZncE56RGVQT1BMMXEyVjZ3b09UazhUZGpybk85NW9D?=
 =?utf-8?B?N2FGNk1GL1g4aCtFV3ZoN2tDWXBFL1JyOW85VDQxVytITGtSMnd0VDJBcW5X?=
 =?utf-8?B?UWQ0UzkzVW5sWUtscW1BZUdXbXZvZmVhZUU4NzRlL3NYZ1g5QlFKVWppY2dX?=
 =?utf-8?B?Qy90dWRTaXprOWJVSzZMcDhkQm9TK1ZDb0pFSnVrRVk1ZlFUam1nV0Z2N1pr?=
 =?utf-8?B?OXBzVzhsWm9ZU3kwOUdNTkxMSHg4cjU1UmxBa3lZWkM4SDFaUXNodzZsRkRa?=
 =?utf-8?B?QWt0Q0tyd05KQis4dVNmVE1ORXBOVVhQSTk4Y2lHLzNhSTJBNi82Y0lyREd1?=
 =?utf-8?B?Ym9lZzFzd1hjZjNLdUtoMG82R1NIYUI5Q0x2S2N5UkxYS0ZMUTQyYlFLZHFS?=
 =?utf-8?B?cnJiK1FzMXZBVWdIUGRsOWZjTi9hN2lwbElKanhJNldkWWRaRmhYendGTFRm?=
 =?utf-8?B?enM2SDRLOFcwVzJFc01NOGlWdysxWlMySVRHaktzdHAwNGVVVjNFNTRCTkVj?=
 =?utf-8?B?YWJpNFdUNkpqUDNUdW0vQm9SdU9peEFFVXhsRThyT2s5Z0dEdkd0WlhZVVFa?=
 =?utf-8?B?TlBFZHRYK0Z3U1Jka1RLN2c5a2ZsVExEdlh4M29VSW5XMFNiR3RNQWxnZzY0?=
 =?utf-8?B?d3FtK3FJU3Blczg4THlxTWxCcFlzc0UzcFRBc09ta3NQUmR3M2FtMjhtd3VP?=
 =?utf-8?B?VGlwV2VVMTM3WE4vMFA4M3VwWmZiaHBac0NmVlZOZ21JaFBGNVloc0NzWERZ?=
 =?utf-8?B?UzFxdUg3VTJ5NmV1dk5ybEF2ZTlkcnFrYjVvM0JyWUxheFBnb210bGNnL3NJ?=
 =?utf-8?B?TUg5SS9wL0EvaHdvanJXc2IrdHlma1J3VnlVUXBMQzBDeWlQZGU3c0w2ZjEz?=
 =?utf-8?B?Tm9XLzVocWZwbjN5dHdiWFN1Wi9OWVIyaEsxMVU0WnA1Rklrdm1VSi9NbmdP?=
 =?utf-8?B?aE9BSGs1R2FRb1VnaDFRWFZiSlordGJLaStaYUVETFZnVmZub3k5eVdLMkw5?=
 =?utf-8?B?VmZYeCtBMjArQ0ZOL0d1dkVFS2E2dWRmdXJ0QTE2Unl0S0FKVjQxL3FQU2t5?=
 =?utf-8?B?WCs4WTlJeFlOR1Q5TlNDMHV0anFFWWFpL3dUWmxhZzF1c3VuNDUxZWFGaDN1?=
 =?utf-8?B?TVRIb1NoVmwxd3ozQUF0TnRWZDFpOEhFTCt3RFdONkxhcjR1MFZKeklpMlUw?=
 =?utf-8?B?TWZBeHZPZzgvcytuTjRwM3UrUEUvZWpOYy9CZ2l5QXQ3Q0w3eXNPUUNLREhG?=
 =?utf-8?B?bkQvUmc2WFZ3bjFGUmtzYVVidjNsM25JUTNIMVFlK0dQTzR3Tjd0aGtWQUpP?=
 =?utf-8?B?U1hjNFpCM1Z1YkZQNHRmU0tKTHRUVE1MelpMSGJkVjA3WDl4d3Z6c3BMTmdO?=
 =?utf-8?B?RldoR1l5T1lxQ0pucGVwMUo2aVdkWmNDNUdmZmhYS2hvbVViZ2pUS3JlWE05?=
 =?utf-8?Q?YCCA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8527.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NTYxMDl3dXh3d1NER0I3UGlYR1NrUjNlMVA5MUVRMGlKbW02aGxTbUpSWlBl?=
 =?utf-8?B?VVl0N1gxK0JOMmFUMm5rWHRSV3BKeE9lbDhvMFZ1Ni9GaVF6VkorRXc2YWJq?=
 =?utf-8?B?SkJvRFpNRmRNbk9pSFZvbkxrR1NzWWE5a1ZKMXFOdTZKT0RMZElYbFB1a29B?=
 =?utf-8?B?dTB4YUxCbFVWWnd3Q28xOUl6OFNrY2lWZUZma3lGZU15d2lVcjdHREQzVmx3?=
 =?utf-8?B?cTBTN09NR3lzWDV3a0RTK05qdmJxZ2tkY2FvNXpkdWlMRnZ3WTdCRjdMbjNF?=
 =?utf-8?B?cjEwQ1FyOCtLRVR0OUU4OVJOZEdsRFZvbEdNellSdGQrNTZLaS9KcDBqNGtC?=
 =?utf-8?B?azhrQWprckxpRzBLb3ZnVEVUWW1FQnBkK0tvaFZnTUpYOUg5RXpwUEpRNlEv?=
 =?utf-8?B?YStYRDNuVDBKWTJObE5KRkJMb2NuTkt6ZndZVFc4VnppL1d0N0ZyYytpNFZX?=
 =?utf-8?B?NlN3REFIZTFtb2ZGZnVZTVZwMG8yTWR4Q2tFUjVGdkxBeVRJQ2JNY0x0N25n?=
 =?utf-8?B?L3A5R0FWYkZrQy9vLzJJRkN6R0Qza3FsaFZFS2UvNGFLYXVUWUZQY3VaT2Zh?=
 =?utf-8?B?RWxOWWdWM1FnZFh4MytXREd2cDV1TDcxeXFiVi9ld0ZHY0FzYkRtNFRaQ0F0?=
 =?utf-8?B?Tk1LQWE4dFNMMGYzZ2FKNi9xaGdwV3VISERKc1grekJpdXZzcE53UFZHR0pO?=
 =?utf-8?B?WTNJRWlqRm5SSHNlQVh6aDk5ZWlqaXNvb2J1RnFWamd4eEUwVjZVaWxJQ25a?=
 =?utf-8?B?R0FlaEpZR3NhUzhOaTBhRjNGWVVHSk9OYTUwUjVycEFqdm1YemlvZHRVblMv?=
 =?utf-8?B?SDU1dzlIQ1hyUEtYZXVQOGh0MUVDVmpvNmppend6RmlHakRudnJYN29IeVMr?=
 =?utf-8?B?cUlNaUtrTTE5bFdlczdxZjlyNnF0T1MycDBQcFBzNFJuaDBZVXg5dno1dHk0?=
 =?utf-8?B?OGV1Vk81U2RmSmQ0RXR6VXhXdTc5bi9LaGVaYlJFTGRsQkRnS3RTS0xzTSta?=
 =?utf-8?B?UkU2MmdSajA4NXZJV2IzclMrOGNlMnA1UStndWxFbzBLZituOWNtNDFKOHFN?=
 =?utf-8?B?K1pCWmJZYzY0T09XeEw5bHpiajhFSS9GTkpyVkxjaWJiMTdoV2h5Wko4cm9T?=
 =?utf-8?B?M2J4TktKOGNheDFGK3h4TXplZWk5a3RBanBKYkoyOEtFcWw2czYxaEtBcDFR?=
 =?utf-8?B?RE5JUkVzb1FQa282UGJrTFhRSmlOSWtNQ2t5NStBcGVaQUhCeVpFT2M0dTBT?=
 =?utf-8?B?L20yaXVKUmp3VEl3Z0laMDZteWNZcWJsU0VTUG4wOFZiSklGTTUxNjMwRjdX?=
 =?utf-8?B?TldlZ2p4cnphcGVQOUdkNU9KU29EU3N4RzBXSFloSWtVVnh1elFrOGFUVEox?=
 =?utf-8?B?VC9jZW5BNk9CRUEvbU1mT2xzQTM4QWdnTzVvRUpscGtWcUkybjAwejRQK2FS?=
 =?utf-8?B?WlVtUlpPNFRZWGNHaFR6bGY4WFN4TVBlMjdTeGIzQXhqUzgwYUw0amZHUTB5?=
 =?utf-8?B?Z3lVMG5tUkh5ckVBS2ZJQ05va0lRQjVnbk10Zzc1QXk1SUwzZEZZaW5tYy8w?=
 =?utf-8?B?ems1UkxxV1lzTmZSelpicmg1Rno1VG1ISTRDdCtVMk8vKzEyUGVvcUFZVXpo?=
 =?utf-8?B?RzFIS1hXejhqRFBsNWZoR0hKMnl1aDNPbEIyTUlNTHo2b2oyUkMvNVhFbmRI?=
 =?utf-8?B?Z1NSSWdlRGNmelpGQkxuaWZucWxldlN6b2hiend1Z3BDTXhlbFR1Z2p2VGdZ?=
 =?utf-8?B?UW5FRTNxWkRwM3QwUXRsQ2lqdmpVUUI5eFAxeVlkLzU5VndWRjd1VE1XTTNG?=
 =?utf-8?B?RG50dWs4UTdYUVI5RDhPUnM4UnV0QndzZXJZTFdkNG42KzREWFJHNVQ0MW56?=
 =?utf-8?B?NU44Zm9ZMHRaaW1ZaXZHbFRjenlIMGl0LzZvbHB1N1NWQzdsVi9VL3BiTlBn?=
 =?utf-8?B?VTJwSXg5Y2tYYU1pdHdQOUlmTDF1UytBRUdhdktIM3RRYUVSSlY1eVZwOVVr?=
 =?utf-8?B?UGw3cXlETXhQcCtsMzFvcWZva2xLVkluSURjOEdiQUI3QjZpeE1ndmJ1ejNE?=
 =?utf-8?B?eTdaaElESFE4b2lXK2pUZ2FHZ3l3T29LZ3NwYTAxZVJJQkQwQjhEVW1TSjRB?=
 =?utf-8?B?aGhIM3dlb0QraVNwU0FqRjd6Q3duY0p4Nk1YMEVsVWtRM1V5ZERhRVRMKzNI?=
 =?utf-8?B?UXVTYkFFc2ZWZW5ocm9mS1Y4REVKMW1iS1FmSWIzRjg4a2JVWkZWZzhQb1hz?=
 =?utf-8?B?MEROckMrOWVFTnJaeE1QaVN2anErM2tsdUpPYms2V1R2QnZSSy9CQjNXMHFZ?=
 =?utf-8?B?N3RRTnIrc29KNVg2dVhTTWNBWUpsZDU5TnpreDQvbHdUOWhNSXVmczZXZzN4?=
 =?utf-8?Q?67S7gAh9bnMm48NY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35818876-2d21-451a-6fd1-08de58247036
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8527.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 13:04:26.1363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /fNeHOlqXJrI9Wb20AmeLePZwUZG0/cq3yoicr8RQpfdq2YphSZxj4HQKi/rfmX5w2P5TNZr6+a72rEOWe562UH6LVBxYAMnerhuyJ6JdxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8024
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=AqDjHe9P c=1 sm=1 tr=0 ts=696f7d5f cx=c_pps
 a=33ZETTsaPBFHggYVnTYjDg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=7tRIfAq67HE4vNTyWQEA:9
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: IZ1jAXNFsRqm86fd1JJB6U8psvdsd0Qc
X-Proofpoint-ORIG-GUID: LZDcKaJO18BqGNR5zFrT4sK4FhhlW7F8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDEwOCBTYWx0ZWRfX5DrSCoJpG9rM
 ukhkMcd1CaIfhoZiVqeUzhYeEocxQw4XLbMvnxcfRZc6crCIaQm319/QovCf4fGGc02Q2efS9W3
 S7CeYz801cb0vxcU9aCSTFdXAESmvOjSf9Mp2HU+iVncAO1zyS4zgs36FhG1DT6Mm14Nj7RRT8Q
 /8/QAUJIw83fl01jsoMYFcRn6mTGcUoruR2jcoPkM9aa2qYDjIIZMyZW/W+ty2TX6H2BmDT4ZXk
 pitHkm5ZMuv3+pqcg5oaSWppPxb/tI8NOCfmj1e2ww3X/VFr6xmDI+oGdT1IAo7aI5+mPvG+mOn
 u283cGlDtul6D/f9U5+PO114gKxK7ZyXJmXbDDUqCyWybBQf3g8ErVSkvHIY9Nt709cuvhKnwHH
 2n4bzwFI9CXYLu8ITkfa9LygxCbDi9I4xe1xrZEcsiifn7l1yctIxfGajJIjSqJqLvCtBB9M2eu
 ZEnLvZln8T5b3qdxzpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_03,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 13:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229704

Hi Alexender,

On 1/19/26 20:54, Alexander Kanavin wrote:
> On Mon, 19 Jan 2026 at 07:09, <liezhi.yang@windriver.com> wrote:
>>    - 0001-macros.in-Set-_rpmformat-to-4.patch
>>      Fixed:
>>      error: External dependency generator is incompatible with v6 packages
> 
> This one is creating technical debt. I can imagine support for v4
> packages will be dropped at some not-too-distant point. We've had this
> deprecation warning for a long time, but it looks like the matter is
> becoming more pressing now. Can you look into it?

OK, I will look into it.

> 
>>    - 0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
>>      Fixed:
>>      GPG check FAILED
>>
>> * Add scdoc-native to DEPENDS to fix do_configure error for both native and
>>    target:
>>    Could not find SCDOC using the following names: scdoc
> 
> Is this a hard dependency? Is there a cmake switch to turn it off?

I will check and fix that.

> 
>>    Note, both target and native need scdoc-native.
>>
>> * Add bash to RDEPENDS:${PN} to fix:
>>    ERROR: rpm-1_6.0.1-r0 do_package_qa: QA Issue: /usr/lib/rpm/rpm-setup-autosign
>>    contained in package rpm requires /bin/bash, but no providers found in
>>    RDEPENDS:rpm? [file-rdeps]
> 
> All things that depend on bash are specifically placed into
> ${PN}-build, so that the main package will not pull in gplv3 licensed
> items. I can imagine this will fail in no-gpl3 tests too.

I will move it into rpm-build.

> 
>> -EXTRA_OECMAKE:append:class-native = " -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var"
>> +EXTRA_OECMAKE:append:class-native = " -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DLIBELF_FOUND=False"
> 
> Addition of LIBELF_FOUND=False is not explained. Also I think it can
> be easily provided?

Good catch, we don't need this change, it has been fixed via 
0001-tools-elfdeps.cc-Remove-format-module.patch

// Robert

> 
> Otherwise, looks good, thanks for working on it!
> 
> Alex


