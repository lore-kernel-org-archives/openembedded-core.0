Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04429FF8861
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 08:49:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38935.1777279769483129646
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 01:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=F7JQq7Qn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8577f77343=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R4sqiW3413137
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 01:49:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=7fKOm0G3RK/GorhK/KpxKiR6VYiTronRhGPfg9wImbY=; b=
	F7JQq7Qnq7GxtwmHCtdnUO2utDMJU0cqxHqRTu8bbDGm2d8bu/uoetYi1hXUKsU0
	0NW3KkQMEC652/+lORNLjye/PKGycGhfq1tv6N8Hyx6gfMPtnQnhTR5L38focCCq
	NKfBTRIehlMYe1btSijlkjylut1WFVfTYVJB+x4oOLNbki8nswNjvh75MnJOIiG3
	1Y7tIJDgkpKd1EExUrroMDKSH7RUFurpvkD96sy8BscNewvm+f1PwcHKsdBn/jao
	gyxkHfxV5jYeEUnm8em5w3KD4rmDz5WEW75rhKUhFTd4cchIIV0+zn9pJTN+a4FN
	6rUgQTor0yXyuCE/L5nc8g==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012055.outbound.protection.outlook.com [40.107.200.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4drw4j1eu0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Apr 2026 01:49:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XW+ihamhp0PP8fQ0JeMFSTrdf4Ei82CMb6nkIfGWq7IEBLyHha3ZmX3/FaPwV2cIBSPxOVhfaqxdEG6LB6FDXRg6/0bWwAp+t3Z/K8DLUIWXxIxqfrHehJualks2PI1VjExxwlFeG4lU+4TX3XFuxRz2K8tPLjp6WfRMLYj4bluSfSnPhNew3Nfr8wqLhcKfFJVIZW4VxvFNtmSPl2PiHlklxaVDcONN85HbBuUToT2ge+iEJ3FrUlTy7ZTzvIQpPbo9auPOZve1bGl/ifbWLA61JqjHxDObw7LWoG7DK1tpJrTvalIRGOTkWw1qGpLcCpbl/GPMhADLoL3OImXtHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fKOm0G3RK/GorhK/KpxKiR6VYiTronRhGPfg9wImbY=;
 b=QZgsGXIpfMKEagVGZ4Lg6C+2iZ1k5QWfHiVOtobfzEdTVvCooZJ3wMjF7Yt/VYi69+SgLHexsqRaioC0gpIcHpo/KFro61T8xQ9LLZ2MPrPb58HKRxriK/rEk1id8vUBk7wr0lvhCofGHzjg2XEZRYJGIzaa+KBoh/QV9b1FgpMzcqpAZwbosbK7eS+AyNfz3xcOpdM6vIlKPF8MnjOt63lGv/XjSWewjiR+/XAO5YVjy7OpNZ4CMviB/pMQlwu3IP9VMCNoikrW0E2gnABRznf3Eq/k1kHCVPxhDZ1cLkBv7nQ9KlKnvEWBsrBybN6VMajpLkydVoqw1Ka9VWz4Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB9683.namprd11.prod.outlook.com (2603:10b6:806:4df::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Mon, 27 Apr
 2026 08:49:24 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 08:49:24 +0000
Message-ID: <25ab1432-5860-4985-8827-e1a672f66a9a@windriver.com>
Date: Mon, 27 Apr 2026 16:49:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] meta: simplify conditional operations with
 bb.utils.filter
To: joaomarcos.costa@bootlin.com, openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com
References: <20260424151718.13081-1-joaomarcos.costa@bootlin.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20260424151718.13081-1-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SEWP216CA0086.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB9683:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fdfdcb1-ac7a-40f3-b318-08dea439e1e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	FjoTmm+6iawhmI2FRJEf1eYPac2yd25Mcx6PsIyBDtwweMR68iUQVYkN2rSmksryiHbdZHduxcL2CpHgnXIE+vkmMzGHFiP7nSrAMVCl7LmtbNHVXpTx0JD+hbV+24+6jgwsxkuBwVaquOLz063wfXcxcskEiBUUtjaRymRMgMnMFlgYRt/YgrbMsDGFDfYt2t8u0BMSE00IqbZiK6ECFmw1eTh/nIImlteUPROdQFXYk03xgGvDWw/sdpZ5XCzD37t4FbPwMwQFtGoNZR5cKJ1LtYj7dsWmTrWNr3oqn8b7UpcO+LMpwZ4Tb08ZK2PhwRtMnFBVBbqY5i28yFqAb5ApKQoiQqCsOmEmSU4Jv7HjI1NtmFRF/spbpgnBP3+1oODshmkZjkbAySF0DTTczA7b8svw/bvsT4CRWgcV5byu/Cbz6EIQQCKBx8FgJFneCK6WqHcLnUIl6qvOAcOtjGcyS3eiQpEkB8PKGx9rePKyELd9lfln9eOVlK9eTwoPT3AuPzc2cK7/6ffL7VBrXzbih03tXOqxAHCR7eZ1lajs1DkRSrQx8o2vOiztnxDKCx5jhb1NdyU8oMC9xF3fN2biELOjt4C3Zw0pUrONlqZw3I4FDLooQ0TzbEbegAk6vBU4MX2QvazoPQNESAurblFjkSgJ+8/A4TEIfLxsZSHxha6w59Aef+m6qKL95vVHYW+HT7WvQiNI2TO4qKpmTA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cnhyL2RqUFVuUzlzdWJwV2tYMlRDOXdHWjRIQnA4eGlRbm04L0QycWtuQ0x3?=
 =?utf-8?B?RnVIMGUxSEgzQmpPOXR0NmxYYVYzc2xvV1R2R3JHK081L3pQSndmcUE0MHpU?=
 =?utf-8?B?SkRkWHgxZkdPSzVjWFlFam9XUU00WHhFbEE5WlRWeUVxaVZ4NE9KdmNKYThC?=
 =?utf-8?B?QU82c2lRUWo5NnlxOU1XMjZMV0NPbnFORmE2Y1BXbU5LTEF6MGJCOENhem53?=
 =?utf-8?B?MDdzSURDa0pqMnFJUkZRSEVUS0hyUFhKdWFiOEZuNkxLdm8ranE0VGlBbEVK?=
 =?utf-8?B?MFhkZ1c4RzBMaFBscmh3SXRtb0YvWUE5d3ZsaDRQbE5XcWJJbjZWNEJsNGov?=
 =?utf-8?B?NzdHbXovYStyYkpNbmc5OWFSOU5qeVE0RnZERkQ4bkRPalJ2bWM2ZEdReVVO?=
 =?utf-8?B?bVplSGRzaGJSNVBGSEhZbWVTQktkZG5Pc0xPS3RhTEVFalUvUkI5KytzMjlL?=
 =?utf-8?B?U3BUa1dQSTJLenFISmxuZEFRN2xReldWbGw3cGdlSUgycDZ4WjhqTUsvM3NK?=
 =?utf-8?B?cURwaE9kd0RXcytNZCtMb3NFbnBTN3RTWEprRU9JTS94eE4zUlVKNC9LWkxo?=
 =?utf-8?B?aFNvT3Vjbnd4V2FZVTlTTnlxaG84YjFkWERLZ1kwZTh1RHJvWGEyMkhHSTNJ?=
 =?utf-8?B?U1ZZL2F1c3JTdGpXY2NEelhJaWU3clhEL1FOOW9wWEVCQmpTM2h3ZU1TSUNn?=
 =?utf-8?B?T0kxMGJzRkM1R25RNFczSWdUN3U4MUZSalhsUFZERVEvRjBOUUFOa0lWNlVX?=
 =?utf-8?B?cW9BTjVYazIxZTd6dngxN1BuTWFJN1pGNDExV0plN29vTEY5cWw3clZKaDk2?=
 =?utf-8?B?ekxoYUFzaXN1SWQvV0trTEUxMHp4Uk5PV1ViUWZMREtGWnU1R1p0Q0dNSVpS?=
 =?utf-8?B?L2krcUdYTWdxSEplRXhaOGZaV2pqaFJrSnBDRnRKQkdyY1NTZUFXY2I4TGY0?=
 =?utf-8?B?WlpldG5BeWZBeDF3bnJNdTVibDd1Q0J4UmV2TW5hVXltemk2U0JpTEdYOFly?=
 =?utf-8?B?bDVsNEhjd0p2dTR6aytHTmhEYksxOXBXM04wcHdXdWZOdkk1Z09RK21uZUMr?=
 =?utf-8?B?ZlhHOUsxbmxPT0pKbmhjM0lnNkI3K0VORmhtRUhDcVBpcG1ZWXlrYnZZTFlx?=
 =?utf-8?B?S0NxK1hqZ09zNHpFbFFidnZsSlNuZVBnbmp3M3o5SDNnOUd2TnJIRlVRWUVM?=
 =?utf-8?B?ZHF5M2p3Y2NEYytuVUtsZzJEcytSck5tOXUrWGlHY3VCdUFyWXl0VGxLQ2x6?=
 =?utf-8?B?ZEh6dUV5aEhsZkd4QWVMSzI3SFM5RExtT1l2SkQ2RG8yM0MyQ0VxWDUxaVRX?=
 =?utf-8?B?OFFxQWVkcCt2SUlOSEdNMGRIQ1VNNVpWTFc2NTVNcnhHUEx5dFA2SzZCMitk?=
 =?utf-8?B?aGFrM3Q1aGE2Nm5DVy94a25EQS9MU3pNNkx1TU94WC9FaTJ4bXFlZlNZVGRs?=
 =?utf-8?B?VGhqU0JxaTMvYUpLczYwWmlQbmRYUy9KMmRxanFDa1BPdEFVWWhWK3lJRXVw?=
 =?utf-8?B?anFIUk5yWTJONHZ0QmVvcG9sU0RESXFFdlg3dThXK0Z5TkhzMGtaWFp1OFU4?=
 =?utf-8?B?NFAva2o2M2d5TThSL05PV0VCdmdmY2ZnaElGbEhEanVxM3hzVmliV0VIbmkz?=
 =?utf-8?B?eTA5UnpRMGVvTXdZdURKcUU2V3dNL000TTkwTTZObkdxVzBzcFl5UDJSRWpz?=
 =?utf-8?B?Q0hpckZ4ai8vcmxtL012cnY5L21pdFlSendFRGp3OXNOYVNSUlE4U1dXUG9K?=
 =?utf-8?B?SVNPTFNrdkhUbElncW1ZVzNSZWRRbHI3dWhFcmVkS3lsemlWdGV0dFhUWFV4?=
 =?utf-8?B?SHpNWGtuaU5GQ0hpMVRtY3Z6YndxTDZxRHlOdDBlMUNWTktSYXNiUjdLakIy?=
 =?utf-8?B?QWk0dGRNOUNiLzgzUktEMzBwa3hLRnlrM1ZiVWZqaXhOSWd6RU1Cc2ZuVVp2?=
 =?utf-8?B?OGlCcFZwOEw3aUo3K3RLa3FCM2RpV2h0RldOa0srUWFja1hxVkc3bmwyUk9D?=
 =?utf-8?B?WXlYbHYweUpnUkl3OXNHcE5PamtPOUJTdkNRUmp0UFlhNVNjR3NrdGZtdEMw?=
 =?utf-8?B?d29DRkVJWVBSak04eElVN253aGs2SEZITzl6a00vbWZCOVJsL2hGbTB6TEhX?=
 =?utf-8?B?UExpYWh1ZHQwTDgrNmczM2ZZdGNCaUdpS0x5MkpQMzFHa3pUdURKQ2IrWisv?=
 =?utf-8?B?UlY4TEZPTjZFYWlDVVY0RkxVNXpZR1BJZ1B5YXpRbDE3cHFvNTc2RXR5M0Rm?=
 =?utf-8?B?WXRoeHo5RWlyS296S2NwM0NVS2lqcjhMcVFtYXpBL0NzVy8xd3RGMlFyOWxn?=
 =?utf-8?B?OC95a2NzemlZSXI1SE5oSS8wUDE5VWdCQkprWmRkL0tvY1o0c1IxUT09?=
X-Exchange-RoutingPolicyChecked: 
	m+3ckmsloQFU6iDpDImTL9seK1lu2Sr2mb86lHpvlyUhGwn9xfpdkPDPr4iqNvIMMADgCum402jhoiECCuk6O82alSg3rOe4hoFEZfpZ0/5N7Rswx6KtpZB22GsHNnRSOErXTNKXFDPEuuO2HAWwTdmPJ2rYRgBC9bf609067mowDbYL/0EZKaAcRDtBJAzc5vfYIVzdXntB5WHU5gES52Y9xt4vD97w511w2q8MlILk5C6pmzkfeDYbmhUTWI0VIBhyOH5DOZPc/d1tubHqx8hsNFwL8WdBn5AVrC7SoqvJCjees4fFNeLI9AsL7xPWp5vNMYxQzvoAQO4b6CX4vw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fdfdcb1-ac7a-40f3-b318-08dea439e1e3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 08:49:24.3842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PhBY89H5q8LX6tMesFnrQGqM09ufJdBastti1rz1EV/ZZ650pKe+wSuwlVFSPMbFfKg9p/ZSEx1vLzceppyADA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9683
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: WaABn0PtF5LNa6G1OSh9ZLcDarRT0miA
X-Proofpoint-ORIG-GUID: OrxU_EYWbKltOqD33dETS7FzqS6LDZZ_
X-Authority-Analysis: v=2.4 cv=Iroutr/g c=1 sm=1 tr=0 ts=69ef2318 cx=c_pps
 a=JQIjQaBRt2POjw1IEeT7Rg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=Q4-j1AaZAAAA:8 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8 a=S9gTlzo0dvUnpunD3AUA:9
 a=SEQqGJoodhfD4dgQ:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=d3PnA9EDa4IxuAV0gXij:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA5MyBTYWx0ZWRfXz5JsyZMjAwaD
 kslr80SlrCSXcWltAZ20IWtLzBZDI/7wwpGiqmJR29ueogKTjPnTxez5KBdD8nn0yMgQ7qU75Uq
 gL5wttCBexV23kwYcwEQPxXe2VKLUmsrOphV6KSTxtdlB2fx1K2PGTYVDrNzLQg5+ne/dr5VtZA
 in4MsCuEH0KSogweQ4wQVGuQpna/z4sUwOQEL/DubJFWhv6oQVd158HgT4Hwcb+l2PgVaje8SdK
 P2H6STyN+iZp1pcad18qhHAnrB/ARAKo71k9fXb8yhY+kyh5k7V7RUHD5C2GC4hndoCFARTDhZI
 MM/JY1BMlz2SqlaBqH1wWAsRISsS71coK9FAVeUZdY+MeQCL4aHixTJ0K059VpYG1smmdo7ol0r
 5d+s8GFE8VjyEhiSz4kUe6TurPO6YKkJNntJnNoVknZF0yTGFWEkmHqHFyE8VMOoFJ8YnokOcn+
 w+wgmPtqFD0zPAJCo3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270093
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 63R4sqiW3413137
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 08:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235995

When using filter for two different things, isn't it a little strange?

Take the first change you made as an example:

-ERROR_QA:append =3D"${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', =
' usrmerge', '', d)}"
+ERROR_QA:append =3D " ${@bb.utils.filter('DISTRO_FEATURES', 'usrmerge', =
d)}"

Previously, the line is very clear. It reads like: if DISTRO_FEATURES=20
contains 'usrmerge', append ' usrmerge' to ERROR_QA.
After the change, it reads like: filter usrmerge from DISTRO_FEATRUES to=20
ERROR_QA.
By doing this, you're connecting these two variables (DISTRO_FEATURES &=20
ERROR_QA) conceptually.
And the leading space is also a tiny problem.

Regards,
Qi

On 4/24/26 23:17, Joao Marcos Costa via lists.openembedded.org wrote:
> Some recipes and configuration files use bb.utils.contains to check for
> a string inside a variable, and return the exact same string if true.
>
> This can be simplified by a call to bb.utils.filter, since the result i=
s
> the same, and the inline is shorter.
>
> Replace "bb.utils.contains(A, 'a', 'a', '', d)" by "bb.utils.filter(A, =
'a', d)".
>
> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>   meta/classes-global/insane.bbclass                        | 2 +-
>   meta/conf/machine/include/arm/feature-arm-neon.inc        | 8 ++++---=
-
>   meta/conf/machine/include/arm/feature-arm-vfp.inc         | 2 +-
>   meta/recipes-connectivity/connman/connman_2.0.bb          | 2 +-
>   meta/recipes-core/coreutils/coreutils_9.10.bb             | 2 +-
>   meta/recipes-core/ovmf/ovmf_git.bb                        | 2 +-
>   meta/recipes-extended/at/at_3.2.5.bb                      | 2 +-
>   meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb          | 2 +-
>   meta/recipes-graphics/waffle/waffle_1.8.1.bb              | 2 +-
>   .../gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb          | 2 +-
>   10 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/i=
nsane.bbclass
> index feddfe0335..04700be71c 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -46,7 +46,7 @@ ERROR_QA ?=3D "\
>       ${CHECKLAYER_REQUIRED_TESTS}"
>  =20
>   # Add usrmerge QA check based on distro feature
> -ERROR_QA:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge=
', ' usrmerge', '', d)}"
> +ERROR_QA:append =3D " ${@bb.utils.filter('DISTRO_FEATURES', 'usrmerge'=
, d)}"
>   WARN_QA:append:layer-core =3D " missing-metadata missing-maintainer"
>  =20
>   FAKEROOT_QA =3D "host-user-contaminated"
> diff --git a/meta/conf/machine/include/arm/feature-arm-neon.inc b/meta/=
conf/machine/include/arm/feature-arm-neon.inc
> index 174b9b9f2a..2ec354bfeb 100644
> --- a/meta/conf/machine/include/arm/feature-arm-neon.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-neon.inc
> @@ -5,16 +5,16 @@
>   # 'vfp', -mfloat-abi parameter and 'hf' suffix is implemented in feat=
ure-arm-vfp.inc
>  =20
>   TUNEVALID[neon] =3D "Enable Neon SIMD accelerator unit."
> -TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'neon', '=
 neon', '', d)}"
> +TUNE_CCARGS_MFPU .=3D " ${@bb.utils.filter('TUNE_FEATURES', 'neon', d)=
}"
>  =20
>   TUNEVALID[vfpv3d16] =3D "Enable Vector Floating Point Version 3 with =
16 registers (vfpv3-d16) unit."
> -TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3d16=
', ' vfpv3-d16', '', d)}"
> +TUNE_CCARGS_MFPU .=3D " ${@bb.utils.contains('TUNE_FEATURES', 'vfpv3d1=
6', ' vfpv3-d16', '', d)}"
>  =20
>   TUNEVALID[vfpv3] =3D "Enable Vector Floating Point Version 3 with 32 =
registers (vfpv3) unit."
> -TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3', =
' vfpv3', '' , d)}"
> +TUNE_CCARGS_MFPU .=3D " ${@bb.utils.filter('TUNE_FEATURES', 'vfpv3', d=
)}"
>  =20
>   TUNEVALID[vfpv4] =3D "Enable Vector Floating Point Version 4 (vfpv4) =
unit."
> -TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfpv4', =
' vfpv4', '', d)}"
> +TUNE_CCARGS_MFPU .=3D " ${@bb.utils.filter('TUNE_FEATURES', 'vfpv4', d=
)}"
>   TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', [ 'vfpv4=
', 'neon' ], ' neon-vfpv4', '', d)}"
>  =20
>   TUNEVALID[vfpv4d16] =3D "Enable Vector Floating Point Version 4 with =
16 registers (vfpv4-d16) unit."
> diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/c=
onf/machine/include/arm/feature-arm-vfp.inc
> index d020100daa..be0c19bd03 100644
> --- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
> @@ -3,7 +3,7 @@
>   # and this .inc file is included from armv5
>  =20
>   TUNEVALID[vfp] =3D "Enable Vector Floating Point (vfp) unit."
> -TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfp', ' =
vfp', '', d)}"
> +TUNE_CCARGS_MFPU .=3D " ${@bb.utils.filter('TUNE_FEATURES', 'vfp', d)}=
"
>  =20
>   # simd is special, we don't pass this to the -mfpu, it's implied
>   TUNE_CCARGS  .=3D "${@ (' -mfpu=3D%s' % d.getVar('TUNE_CCARGS_MFPU').=
split()[-1]) if (d.getVar('TUNE_CCARGS_MFPU') !=3D '') else ''}"
> diff --git a/meta/recipes-connectivity/connman/connman_2.0.bb b/meta/re=
cipes-connectivity/connman/connman_2.0.bb
> index 6f7093301b..e9873f3163 100644
> --- a/meta/recipes-connectivity/connman/connman_2.0.bb
> +++ b/meta/recipes-connectivity/connman/connman_2.0.bb
> @@ -169,7 +169,7 @@ FILES:${PN}-tools =3D "${bindir}/wispr"
>   RDEPENDS:${PN}-tools =3D "${PN}"
>  =20
>   FILES:${PN}-tests =3D "${bindir}/*-test"
> -RDEPENDS:${PN}-tests =3D "${@bb.utils.contains('PACKAGECONFIG', 'iptab=
les', 'iptables', '', d)}"
> +RDEPENDS:${PN}-tests =3D "${@bb.utils.filter('PACKAGECONFIG', 'iptable=
s', d)}"
>  =20
>   FILES:${PN}-client =3D "${bindir}/connmanctl"
>   RDEPENDS:${PN}-client =3D "${PN}"
> diff --git a/meta/recipes-core/coreutils/coreutils_9.10.bb b/meta/recip=
es-core/coreutils/coreutils_9.10.bb
> index 984c5b5292..744d930272 100644
> --- a/meta/recipes-core/coreutils/coreutils_9.10.bb
> +++ b/meta/recipes-core/coreutils/coreutils_9.10.bb
> @@ -222,6 +222,6 @@ do_install_ptest:append:libc-musl () {
>   }
>  =20
>   RDEPENDS:${PN}-ptest +=3D "xz  \
> -                         ${@bb.utils.contains('PACKAGECONFIG', 'acl', =
'acl', '', d)} \
> +                         ${@bb.utils.filter('PACKAGECONFIG', 'acl', d)=
} \
>                            ${@bb.utils.contains('PACKAGECONFIG', 'xattr=
', 'attr', '', d)}"
>   FILES:${PN}-ptest +=3D "${bindir}/getlimits"
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovm=
f/ovmf_git.bb
> index d731bca7f2..38d5d090b4 100644
> --- a/meta/recipes-core/ovmf/ovmf_git.bb
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://OvmfPkg/License.txt;md5=3D=
06357ddc23f46577c2aeaeaf7b776
>   # compiling OVMF twice, so it is disabled by default. Distros
>   # may change that default.
>   PACKAGECONFIG ??=3D ""
> -PACKAGECONFIG +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'tpm', 't=
pm', '', d)}"
> +PACKAGECONFIG +=3D "${@bb.utils.filter('MACHINE_FEATURES', 'tpm', d)}"
>   PACKAGECONFIG +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'tpm2', =
'tpm', '', d)}"
>   PACKAGECONFIG[debug] =3D ",,,"
>   PACKAGECONFIG[secureboot] =3D ",,,"
> diff --git a/meta/recipes-extended/at/at_3.2.5.bb b/meta/recipes-extend=
ed/at/at_3.2.5.bb
> index 112d1c4adc..ee485f67ec 100644
> --- a/meta/recipes-extended/at/at_3.2.5.bb
> +++ b/meta/recipes-extended/at/at_3.2.5.bb
> @@ -9,7 +9,7 @@ DEPENDS =3D "flex flex-native bison-native \
>              ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '=
', d)}"
>  =20
>   PACKAGECONFIG ?=3D "\
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', =
d)} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
>   "
>  =20
>   PACKAGECONFIG[selinux] =3D "--with-selinux,--without-selinux,libselin=
ux,"
> diff --git a/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb b/meta/re=
cipes-graphics/libglvnd/libglvnd_1.7.0.bb
> index 18eeaa5523..c76763f811 100644
> --- a/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
> +++ b/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
> @@ -14,7 +14,7 @@ REQUIRED_DISTRO_FEATURES =3D "opengl glvnd"
>   inherit meson pkgconfig features_check
>  =20
>   PACKAGECONFIG ?=3D "\
> -  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> +  ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
>     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'egl gles1 gles2'=
, '', d)} \
>     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'glx', '', d)=
} \
>     "
> diff --git a/meta/recipes-graphics/waffle/waffle_1.8.1.bb b/meta/recipe=
s-graphics/waffle/waffle_1.8.1.bb
> index aefa0069cf..5d993cf254 100644
> --- a/meta/recipes-graphics/waffle/waffle_1.8.1.bb
> +++ b/meta/recipes-graphics/waffle/waffle_1.8.1.bb
> @@ -21,7 +21,7 @@ DEPENDS:append =3D " python3"
>   # This should be overridden per-machine to reflect the capabilities o=
f the GL
>   # stack.
>   PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '=
glx x11-egl', '', d)} \
> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', =
'wayland', '', d)} \
> +                   ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)=
} \
>                      ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', =
'gbm surfaceless-egl', '', d)} \
>   "
>  =20
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad=
_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1=
.28.2.bb
> index cdf3a20dff..9945e79bf7 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2=
.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2=
.bb
> @@ -25,7 +25,7 @@ PACKAGECONFIG ??=3D " \
>       ${GSTREAMER_ORC} \
>       ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '',=
 d)} \
>       ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vulkan x11', d)} =
\
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', =
d)} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
>       ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} \
>       bz2 closedcaption curl dash dtls hls openssl sbc smoothstreaming =
\
>       sndfile ttml uvch264 webp analytics \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#235868): https://lists.openembedded.org/g/openembed=
ded-core/message/235868
> Mute This Topic: https://lists.openembedded.org/mt/118989280/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
Qi.Chen@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


