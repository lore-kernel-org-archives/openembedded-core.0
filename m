Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E36FC9EFF
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 15:00:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10479.1772895653582518677
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 07:00:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Ed7irTMi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=752655555d=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 627F02Nk2523908
	for <openembedded-core@lists.openembedded.org>; Sat, 7 Mar 2026 07:00:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=UiAWKnbJ+Cuwy5+QNxI1QuhGOqe2Oi0KB98+JpUQJr8=; b=Ed7irTMibzdL
	dQxTPB6YZlLEV1FqHoYjyAfBl3x5qUvbv/c28NlphUPPDyh4xGemflWRQKOvwsjp
	flA1nsnWrexcsBV2uJbmRUnjbpeW5fytKGvg0MwW7u3oFO+w32S2seojCCBs2txC
	frVmT3QeXjqmxVbFGnlwHhc2tkK1KgMGn4FsbL4ZkfknSbs4sba/fwzz7pmB93dg
	mDmLhfkOyQ8YsEFnh7vudIi5ZQ/RIS4Q22zPg0YShsw2EtJG7yGQUtGuhtBzlJoW
	Xdxr8F353xDeoV6HNNcQ19qw8y4+BBZt+2Pv1DBFcKPrEKWihhnZbvbNcIe+vZki
	WX8cCSkpuQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010018.outbound.protection.outlook.com [52.101.46.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crmdm025h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 07 Mar 2026 07:00:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQ9pa35Can6ZRph1LfOwcAqd9DLsZDO15m3HC2Wei0gFFRIi+QSNIgJTXPEJFixQM+G+/6Taf+PND0PUuVHHrhupFY4HBL3Hb8ZKSLVy7rHtTAhQWAgvny0cS84rRuB0ImO1w/Di0gRGIgBMLR4cfPCmT239auAwfnPT4Y8OLuYQwp6aOP/xP1iNnVheKDgNCrRRpo3ZNIINpF0WI5buPpIJxJ0rKqUpwxwPHCr+0BBr9WcX7F6KgiA9SSkgvO0ySEmD5z/gS2VpLFgMbny9tBBQV8XhDPdObU80L9I+n3W/KrSLVm46Pwpq+j3HiFJgxtqmxHBI/jI/0EqGCxqAdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UiAWKnbJ+Cuwy5+QNxI1QuhGOqe2Oi0KB98+JpUQJr8=;
 b=hn7s9c32iE4tFtxKWV8Xe54CtZI17HTZePYRvADS17OCc0FD/m4Mc7Vmz1IRlGPHnKatg50Mm6gHEwnNiS+0hlWPnHOw1mFD5PC8GxjhlcsjXnYkRr+hEIwjOQDwQBk5EeuHsA2E/MgtUy5dvdaar4s/lmUV4rgakW3dvGB2TEIaH9Z5TwvhLiluuh9jKWD7xxSA3Fg9TGkgtRCyaz3JhNt7DJb16GIpmYjCUWvabSs5wrlFWfM9mpn4eCaganLR9MwZHBsH0yia9imM/kqVmGdbtICbC0hUCOlQ1dUUoszx+8EY1lrNn5+AaCBrFnYtkNUsltRmZGcMwt4Sey2Zww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB8527.namprd11.prod.outlook.com (2603:10b6:510:2ff::9)
 by SA3PR11MB7628.namprd11.prod.outlook.com (2603:10b6:806:312::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Sat, 7 Mar
 2026 15:00:47 +0000
Received: from PH7PR11MB8527.namprd11.prod.outlook.com
 ([fe80::43b7:b38f:e039:a5ee]) by PH7PR11MB8527.namprd11.prod.outlook.com
 ([fe80::43b7:b38f:e039:a5ee%4]) with mapi id 15.20.9700.003; Sat, 7 Mar 2026
 15:00:47 +0000
Message-ID: <f9600ac4-c65f-4cf3-8b50-7c6e90563538@windriver.com>
Date: Sat, 7 Mar 2026 23:00:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/3] m4: upgrade to 1.4.21
To: martin.jansa@gmail.com, openembedded-core@lists.openembedded.org
References: <20260305180333.306176-1-martin.jansa@gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <20260305180333.306176-1-martin.jansa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SL2P216CA0093.KORP216.PROD.OUTLOOK.COM (2603:1096:101:3::8)
 To LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8527:EE_|SA3PR11MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fe8efe7-6e16-4702-de2e-08de7c5a4dce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	wq0SEgIR4usSA2qI4D6e9C46yGHFrvm45v6iLvrD61wMr7QLTZygWf/ktc0umed9n03pagmNvyG1ifxNWU2HksMNbJbW7cjL2g8kHFclWJR/ut2HzwFn1h6WXYcvs+5KvHFVE9hKrlRCOv2xk+M1DuDB5SQ9T/xyHODri1/UQu/Ye799vRHUk2AeUtRHSr3BaU7Hiepmxm/sllrpGFbDAD0cvxF8ThrGEEw6vVgaG5ouEC52H+K5aP4pWSr1nwUG9UlP1Wg9UMT9SoLk3DOQEXOGfFGtQuChwW37DxO2h/axb3aLKToZRuy8N1PPk7GXBZIlSfs+hNbfpq9YIH4XNhW82js8xcAb9SsB3/TZekDQEG2oq7ocQDk+J455wMh11nJOQAv9K3KP/an8NaL1QeiWf2ajT+1GtVYjm+JH68vDR759BawYm9q0sT7TlVf0hIHLsC5b0vwaG2S+UlidR89fGHqYFoEiYq0yDea2nrmCe5d0AEkoHxjbZri47btGd6Ch4ui71GoaPh4jRdlZH0Gu8q6D+++IFlAoZDDrC8T72AId+aTymYoINrmBAHP24HOXhEVGHbmYn2VoJwhd38I3Se/x12Uqq1JpbvNp25cfigw290ty9t8TwHipvihgUf354vKba6U4HmbOcX4bxH+92zTrOtBY7SIXcAMAYrJdVVES2E+YM71GyvhQoGCj
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8527.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b1BtbHhkcnFKbnBUTDEvVWEvdlpURkorMlNNYk9QcGU3Rnd6bFg3OGtWR0pL?=
 =?utf-8?B?Q1lPdmhrdGlnR2I3RWVmUVhLUVhlVFdkcGcwcXVJNStvTDYzU2lYSGlYN0VN?=
 =?utf-8?B?eU1zNEhwSEE4RU53TUpZZkx2SU43TDA1OHRtNmxycnhVZTRLL2xkZkUrMmtE?=
 =?utf-8?B?N3E3R09wdHE2TkZEZlRaSlZRK25vT1F2MWRXc2hld3k5NWtaLzVzUWZFSjJw?=
 =?utf-8?B?VnF3YU95ZVRBdEhVV2poSGFrR2xqWFZ5Z0IvOHJwWW5ZMzYvYW5Hc1dEMjZn?=
 =?utf-8?B?U0ZrQSt1K256aHBjVzVqYVBiclNZSCsxWFdDNnNsOEtZQUh5UG03TDFJb3la?=
 =?utf-8?B?WWxTM1BRaFNiK3N4c0J5Uk1EM25aNEpzRElZdUwyV24vbjBYSEswK1l3ODRr?=
 =?utf-8?B?bVIxMTBwZTFQdGkzcVhRaUwvTjgwTE93cWR2Q29iSlpHOHFjZzVXNVowS1FO?=
 =?utf-8?B?N3JzVTN0TzJmSURKenVPcWpGMitOT3B0MU14RTd2N0RHRXZMM2Q0dnFXczVv?=
 =?utf-8?B?VWVBM04zV2pRbGZlSkxVTnh1elREOEtDalFhMWpvK0QxSDViRHd1ZTNXQ0FX?=
 =?utf-8?B?RExzekNTelpVVTJmaEpGQ3MvUjBYU1BmQWdsTVI2dDdtSVpCL0YyRFhTZG5M?=
 =?utf-8?B?d1czSzMvemhEaldoSC9BbTcxUEhMNWtiNFA5VVV5aHBOQ0ZZb1lNY0QzeHc3?=
 =?utf-8?B?ZEpRYW5URHRLTUxWQVlOZ0RCUDVGNTlPaStGNW9HWDFxWGZHL3BZMW9hd1Av?=
 =?utf-8?B?Mm9GYUVGcjkwZ2xkTmtPMnJtMVFjMkpHbnI5ZXNtM2d4TmNUSEh0Vnd4T0FS?=
 =?utf-8?B?bjRFWlhldWdudW9vUEJVaERrMm03ZUVqVkV2eTk0dGtFQm91NjNCZmNvZW1J?=
 =?utf-8?B?ajF1cjZ2dEUyd1ZvZENMeFlhT0J1M2FBNU4zTTJDdDNqMGdIM1BKUGRnMVJy?=
 =?utf-8?B?YjFqV3Q3alhHMVFVK1FZR2I5WnJxbFBpemRCTG5jVlhDSy9KYWlWL0xzQ2lL?=
 =?utf-8?B?bmxrRTdadUUxSmNXeVZwT3pSOXhKZXZpdzgwbTU2aXg2VWtadm5URzl0ZVNB?=
 =?utf-8?B?N3F2M3YrbS84Nit4WW9BSjJ5M2c0T3hYak5iVENBQng0Zmg2S2xsSlBtdmIx?=
 =?utf-8?B?dWY3Mjl4bTBJMFNMcG5IaHliakhZZ0dkTHM2N2IrYnRRdGI2TVUzSk4xb0Mz?=
 =?utf-8?B?MjZ5NUQrRk9QRXBwZENpbjNhYkh4L0hOT1I4NFYyVVpxVUdCajBFTzhRMitZ?=
 =?utf-8?B?d0V5L2RaZ0lrYTNWUkI2clNWanUycHlpWUdyMzdSQzFtbnp5QkVOVEdxUGVM?=
 =?utf-8?B?V3FzdHJFMDFaTi9ZMWI3RVdXL0JFNkVvTXB2dW5Sc1Fsa0pLZW9zaG14NU8z?=
 =?utf-8?B?RlNnWE9UUkM2K3EzcGh4MUJ2QnpSRnBUc3pHVHdlVWh2WkhqSDlBZ2ZvUjZX?=
 =?utf-8?B?YUJwbkE5Y3YxczJwWktyMW5Xc1pCNHo2TEpRVTlkVTlFcWxqMU9LVTU1VnA2?=
 =?utf-8?B?eTc2QW1CcE1yRFVrLy81NWtEdDd0a1I4NGhWWEhKN2ZUK1M3UytyOEN6b0No?=
 =?utf-8?B?YWRFTTVraGR0WTNlcXFxZXBoNDdpUjJ4L1g1c2wzcGo1eVpmR1NQcVVmd0Zv?=
 =?utf-8?B?aGx4ak1POXdYb3I1T0JVd0lQZldVZkEvK1RzL0R6NFVEVFFSUDhQV2hJOENH?=
 =?utf-8?B?ZTVCSkZWTExSVHZ0TFZQdkxlSng3b05UMXFrZEdjSlNYeEx2dHdGbysvU0hh?=
 =?utf-8?B?emlkcHdIb3ovQytoMy90TkF3UWNwanpNd3JsR05ONTJTcmNCNStmQ3FuTzE5?=
 =?utf-8?B?aXlaV0QvREViVW5TR0JyWkxULysxQitOalJyWmpNbi9MVmFObTVjd1ora3NI?=
 =?utf-8?B?RHdOMVJWUFEwWXNRT1V1dEN2RnBPNkRmMlJ6NDZ2ZVA0QUw2aDRaZFp0NGR6?=
 =?utf-8?B?Qi9OUXAremlXSzR1MXg0M0l0UGtvRUtoSStMSHdIRDlhWVJGQ2QxY3VQUHdz?=
 =?utf-8?B?TW1CMGdTUVpabTA0aE9qUFBuQktObVVoeklmSlRoOEJHeW1YWFpXUE5LTnZY?=
 =?utf-8?B?NjNSc2VsNjZHUnNGZ3dNdm94THhBU1hNQmQ0RzYwelJEMTJBUXB5Z0Q4V253?=
 =?utf-8?B?ZlBLV0xyakUwQ2dSQWRydDRTWHRqdmVvSStIMTRmRU8yTDhmVjN0TkpYRVMz?=
 =?utf-8?B?bUdMOHFJZi92dFIzVHFGSk1lbE85Z1liL3kreUxoT25id0syWDZQdWpOMEx2?=
 =?utf-8?B?RWZWYXJOb25DQTh3aUVyOGxnS2ZZV3BKaTdSTWlFVFlmU2NkRC9TeWVSMEJm?=
 =?utf-8?B?RnFzL3N1dWEydWo0TStuc3puVGUxdjZ0d0hTM1BlVkpvVHgxOC9oYjhnOUY5?=
 =?utf-8?Q?b4tSkuGXjsOZ+46M=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe8efe7-6e16-4702-de2e-08de7c5a4dce
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2026 15:00:47.4929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/dH1QasFerftlukTMol7hoHvOqUPTk0N2fQEhJXW8HgGeYxQpGuYpgAjk+WUaMiJ9/odK8xUj1te63aYh74Sli5tK+rqQGr65+496PtSQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7628
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: s0xZao3CRO4PMCSJp7pPodK_7MZBqQOy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDE0MSBTYWx0ZWRfX0f10ZpqGHkBU
 qRQcOtPobpfx5QmCJsc26dKGc0wbsaV+oqlqNbUn6tWUQqaJbUNV/mXWpLNMX2SRpS6LKOjuTQ5
 zLYZSEmlwDUXjRkXmB9s2IYS7OzDmhEHCfXKiSsJB4SBy0WcuahdkLV2stJUi2u698Sg7dZEyDc
 surI9jAz1Amn8cHr5RxvMbn36m0Cv1vuEwU6DIMfMAfHGi4emp6CLroxbZjSlqtU1gerdtWmx9W
 6bwb999ta3YSBGv+ik/8f6cxiFTBsNznMKd0CVWJ3GGMl5/T0+K3duMyZJuWH9IVsHl2e3yJgyp
 n1H3g94vy+tjCip0VhuEY1uuQFFbF2pcN0Ate8/RQZn4ZnwqKZeMQgcLexoX7FBUmMiHxa7MEA3
 KB2m37VJLt1nSvbbB4LcoNOuV3uu88+/Fo+kAquqnIJB3Ipi8w/Jq0QiJUEccRrGfS7yxSX3IUt
 ka4h6cH6eXSKaZl8t0A==
X-Proofpoint-GUID: aSqfTSOXHFSilb7gy6MgpkqnV46u81uO
X-Authority-Analysis: v=2.4 cv=QppTHFyd c=1 sm=1 tr=0 ts=69ac3da4 cx=c_pps
 a=xtX6lszn+wSwJ/mzueWfcw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=mDV3o1hIAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=4_4KAXEiAAAA:8
 a=AYdrOdEoAAAA:8 a=3-RhneuVAAAA:8 a=t7CeM3EgAAAA:8 a=uIOwkH6wlgEkYOFJrw4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=2dBW64JbcpvAzUZBiPf5:22 a=OGUpGO79hC_v-Tb66Uh5:22 a=VLVLkjT_5ZicWzSuYqSo:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070141
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 627F02Nk2523908
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 15:00:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232612

Hi Martin,

On 3/6/26 02:03, Martin Jansa via lists.openembedded.org wrote:
> From: Martin Jansa <martin.jansa@gmail.com>
>=20
> https://lists.gnu.org/archive/html/m4-announce/2026-02/msg00000.html
> This release is being made mainly to cater to recent glibc changes in
> light of the C23 language standard.  However, it also includes fixes
> for some corner-case bugs in eval and when using the defn macro on
> builtins.
>=20
> Fixes m4-native builds on hosts with glibc-2.43 like:
> ./stdlib.h:827:20: error: expected identifier or '(' before '_Generic'
> ./string.h:777:20: error: expected identifier or '(' before '_Generic'
>=20
> Remove 0001-gettext-h-Avoid-gcc-Wformat-security-warnings-with-d.patch
> which is included in gnulib revision used by m4 since:
> https://gitweb.git.savannah.gnu.org/gitweb/?p=3Dm4.git;a=3Dcommit;h=3Db=
eee8d26382460010338c37f9dd9f823aa9f4ee8
>=20
> LIC_FILES_CHKSUM was updated for barem4.m4 and testbarem4.m4 from:
> https://gitweb.git.savannah.gnu.org/gitweb/?p=3Dm4.git;a=3Dblobdiff;f=3D=
examples/COPYING;h=3De623b2b9394cbd1784a4964bbac105050296f33b;hp=3D7e73a1=
219b542fa035facc47cdb3dd81132e6373;hb=3D900a90f624cee4a8c1c02c4d6a61ef1ed=
26a17d1;hpb=3Dc7b96d682958532c4eb2d5c2d81bb6ac342fd410
>=20
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>   .../m4/{m4-1.4.20.inc =3D> m4-1.4.21.inc}       |   5 +-
>   ...4-native_1.4.20.bb =3D> m4-native_1.4.21.bb} |   0
>   ...gcc-Wformat-security-warnings-with-d.patch | 133 -----------------=
-
>   .../m4/{m4_1.4.20.bb =3D> m4_1.4.21.bb}         |   0
>   4 files changed, 2 insertions(+), 136 deletions(-)
>   rename meta/recipes-devtools/m4/{m4-1.4.20.inc =3D> m4-1.4.21.inc} (9=
0%)
>   rename meta/recipes-devtools/m4/{m4-native_1.4.20.bb =3D> m4-native_1=
.4.21.bb} (100%)
>   delete mode 100644 meta/recipes-devtools/m4/m4/0001-gettext-h-Avoid-g=
cc-Wformat-security-warnings-with-d.patch
>   rename meta/recipes-devtools/m4/{m4_1.4.20.bb =3D> m4_1.4.21.bb} (100=
%)
>=20
> diff --git a/meta/recipes-devtools/m4/m4-1.4.20.inc b/meta/recipes-devt=
ools/m4/m4-1.4.21.inc
> similarity index 90%
> rename from meta/recipes-devtools/m4/m4-1.4.20.inc
> rename to meta/recipes-devtools/m4/m4-1.4.21.inc
> index 5c4ba09288..ce9fe2be8e 100644
> --- a/meta/recipes-devtools/m4/m4-1.4.20.inc
> +++ b/meta/recipes-devtools/m4/m4-1.4.21.inc
> @@ -7,19 +7,18 @@ GNU M4 also has built-in functions for including file=
s, running shell commands,
>   inherit autotools texinfo ptest gettext
>  =20
>   SRC_URI =3D "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
> -           file://0001-gettext-h-Avoid-gcc-Wformat-security-warnings-w=
ith-d.patch \
>              "
>   SRC_URI:append:class-target =3D " file://run-ptest \
>                                   file://0001-test-c32ispunct-Check-for=
-musl-along-with-glibc.patch \
>                                   file://serial-tests-config.patch \
>                                 "
>  =20
> -SRC_URI[sha256sum] =3D "6ac4fc31ce440debe63987c2ebbf9d7b6634e67a7c3279=
257dc7361de8bdb3ef"
> +SRC_URI[sha256sum] =3D "38ae59f7a30bf9c108193cc5c25fbb06014f21e230c7ed=
e2eff614f7b7c37ed8"
>  =20
>   LICENSE =3D "GPL-3.0-only"
>  =20
>   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e=
440464\
> -	            file://examples/COPYING;md5=3D4031593b2166d6c47cae282d944=
a7ede"
> +	            file://examples/COPYING;md5=3D005f2e201a0526c1d1d79dd6303=
ecf23"

There are new license in the example files barem4.m4 and testbarem4.m4, i=
t just
says "This program is distributed under a Creative Commons Share-alike li=
cense",
but not version is specified, I guess we should use CC-BY-SA-4.0.

// Robert



>  =20
>   EXTRA_OECONF +=3D "--without-libsigsegv-prefix"
>  =20
> diff --git a/meta/recipes-devtools/m4/m4-native_1.4.20.bb b/meta/recipe=
s-devtools/m4/m4-native_1.4.21.bb
> similarity index 100%
> rename from meta/recipes-devtools/m4/m4-native_1.4.20.bb
> rename to meta/recipes-devtools/m4/m4-native_1.4.21.bb
> diff --git a/meta/recipes-devtools/m4/m4/0001-gettext-h-Avoid-gcc-Wform=
at-security-warnings-with-d.patch b/meta/recipes-devtools/m4/m4/0001-gett=
ext-h-Avoid-gcc-Wformat-security-warnings-with-d.patch
> deleted file mode 100644
> index 6fad05041f..0000000000
> --- a/meta/recipes-devtools/m4/m4/0001-gettext-h-Avoid-gcc-Wformat-secu=
rity-warnings-with-d.patch
> +++ /dev/null
> @@ -1,133 +0,0 @@
> -From c4dc0ab4424fca31635b7837b1c180f7d3df8ede Mon Sep 17 00:00:00 2001
> -From: Bruno Haible <bruno@clisp.org>
> -Date: Wed, 28 May 2025 15:14:07 +0200
> -Subject: [PATCH] gettext-h: Avoid gcc -Wformat-security warnings with
> - --disable-nls.
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Reported by Holger Hoffst=C3=A4tte <holger@applied-asynchrony.com> in
> -<https://lists.gnu.org/archive/html/bug-gnulib/2025-05/msg00225.html>.
> -
> -* lib/gettext.h (gettext, dgettext, dcgettext): With gcc in C mode,
> -define these as inline functions.
> -* lib/sigpipe-die.c (sigpipe_die): Use translated string as a format
> -string, relying on the format string checking done by 'msgfmt -c'.
> -* lib/xmemcoll.c (collate_error): Revert commit from 2025-01-17.
> -* lib/xprintf.c (xvprintf, xvfprintf): Likewise.
> -* lib/openat-die.c (openat_save_fail, openat_restore_fail): Revert
> -commit from 2024-12-10.
> -
> -Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gnul=
ib.git/commit/?id=3D6e5015dd557b20ae4a0829c4bf78480ce2f4cb04]
> -Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ----
> - lib/gettext.h    | 49 ++++++++++++++++++++++++++++++++++++-----------=
-
> - lib/openat-die.c |  4 ++--
> - lib/xprintf.c    |  4 ++--
> - 3 files changed, 41 insertions(+), 16 deletions(-)
> -
> -diff --git a/lib/gettext.h b/lib/gettext.h
> -index ea0c27e..bb3d975 100644
> ---- a/lib/gettext.h
> -+++ b/lib/gettext.h
> -@@ -59,18 +59,43 @@
> - #  endif
> - # endif
> -
> --/* Disabled NLS.
> --   The casts to 'const char *' serve the purpose of producing warning=
s
> --   for invalid uses of the value returned from these functions.
> --   On pre-ANSI systems without 'const', the config.h file is supposed=
 to
> --   contain "#define const".  */
> --# undef gettext
> --# define gettext(Msgid) ((const char *) (Msgid))
> --# undef dgettext
> --# define dgettext(Domainname, Msgid) ((void) (Domainname), gettext (M=
sgid))
> --# undef dcgettext
> --# define dcgettext(Domainname, Msgid, Category) \
> --    ((void) (Category), dgettext (Domainname, Msgid))
> -+/* Disabled NLS.  */
> -+# if defined __GNUC__ && !defined __clang__ && !defined __cplusplus
> -+/* Use inline functions, to avoid warnings
> -+     warning: format not a string literal and no format arguments
> -+   that don't occur with enabled NLS.  */
> -+__attribute__ ((__always_inline__, __gnu_inline__)) extern inline
> -+const char *
> -+gettext (const char *msgid)
> -+{
> -+  return msgid;
> -+}
> -+__attribute__ ((__always_inline__, __gnu_inline__)) extern inline
> -+const char *
> -+dgettext (const char *domain, const char *msgid)
> -+{
> -+  (void) domain;
> -+  return msgid;
> -+}
> -+__attribute__ ((__always_inline__, __gnu_inline__)) extern inline
> -+const char *
> -+dcgettext (const char *domain, const char *msgid, int category)
> -+{
> -+  (void) domain;
> -+  (void) category;
> -+  return msgid;
> -+}
> -+# else
> -+/* The casts to 'const char *' serve the purpose of producing warning=
s
> -+   for invalid uses of the value returned from these functions.  */
> -+#  undef gettext
> -+#  define gettext(Msgid) ((const char *) (Msgid))
> -+#  undef dgettext
> -+#  define dgettext(Domainname, Msgid) ((void) (Domainname), gettext (=
Msgid))
> -+#  undef dcgettext
> -+#  define dcgettext(Domainname, Msgid, Category) \
> -+     ((void) (Category), dgettext (Domainname, Msgid))
> -+# endif
> - # undef ngettext
> - # define ngettext(Msgid1, Msgid2, N) \
> -     ((N) =3D=3D 1 \
> -diff --git a/lib/openat-die.c b/lib/openat-die.c
> -index 3fbb5d8..79a5b23 100644
> ---- a/lib/openat-die.c
> -+++ b/lib/openat-die.c
> -@@ -34,7 +34,7 @@ _Noreturn void
> - openat_save_fail (int errnum)
> - {
> - #ifndef GNULIB_LIBPOSIX
> --  error (exit_failure, errnum, "%s",
> -+  error (exit_failure, errnum,
> -          _("unable to record current working directory"));
> - #endif
> -   /* _Noreturn cannot be applied to error, since it returns
> -@@ -53,7 +53,7 @@ _Noreturn void
> - openat_restore_fail (int errnum)
> - {
> - #ifndef GNULIB_LIBPOSIX
> --  error (exit_failure, errnum, "%s",
> -+  error (exit_failure, errnum,
> -          _("failed to return to initial working directory"));
> - #endif
> -
> -diff --git a/lib/xprintf.c b/lib/xprintf.c
> -index 4d9a3e5..790af53 100644
> ---- a/lib/xprintf.c
> -+++ b/lib/xprintf.c
> -@@ -45,7 +45,7 @@ xvprintf (char const *restrict format, va_list args)
> - {
> -   off64_t retval =3D vzprintf (format, args);
> -   if (retval < 0 && ! ferror (stdout))
> --    error (exit_failure, errno, "%s", _("cannot perform formatted out=
put"));
> -+    error (exit_failure, errno, _("cannot perform formatted output"))=
;
> -
> -   return retval;
> - }
> -@@ -67,7 +67,7 @@ xvfprintf (FILE *restrict stream, char const *restri=
ct format, va_list args)
> - {
> -   off64_t retval =3D vfzprintf (stream, format, args);
> -   if (retval < 0 && ! ferror (stream))
> --    error (exit_failure, errno, "%s", _("cannot perform formatted out=
put"));
> -+    error (exit_failure, errno, _("cannot perform formatted output"))=
;
> -
> -   return retval;
> - }
> diff --git a/meta/recipes-devtools/m4/m4_1.4.20.bb b/meta/recipes-devto=
ols/m4/m4_1.4.21.bb
> similarity index 100%
> rename from meta/recipes-devtools/m4/m4_1.4.20.bb
> rename to meta/recipes-devtools/m4/m4_1.4.21.bb
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232503): https://lists.openembedded.org/g/openembed=
ded-core/message/232503
> Mute This Topic: https://lists.openembedded.org/mt/118156597/7304958
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
liezhi.yang@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


