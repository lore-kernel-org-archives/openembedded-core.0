Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971C1D58E6D
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 06:56:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.154997.1772434595368872109
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 22:56:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=bpcvKmie;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7521b89b40=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6226KCqo1556269
	for <openembedded-core@lists.openembedded.org>; Sun, 1 Mar 2026 22:56:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=xlQ9fezyBjNkAP3wv0PVo/
	/HpxixFBSZLzGaa86pc9M=; b=bpcvKmieBEjJ38d82f4VVT0cm3GGe2Freyx1l8
	dNxPCC17YlJHfCFWmaUi+M7IkBpUpsEdZCOBMmvBx4IVFpW5x7hb+2U/9vSC4diu
	os0rjGEsBgSiVujpEvxy4Da3ohxfQbqflY0JpcP5fdjA9CwTVNB1hB4h7MRyEsde
	L4Dt8P6XBsyOg+F20SLPG6U0eulYGhqp7ri+D6s3G+a6XVR//1PJQ0/0iE38XCXV
	hKGrXSRg03e3URw07j9WqwTY8DnVw4GTZL6usu8bfDalEBlNCB/YVYktrUh1Q0ud
	PSofxCOVyl5pzrgGmX06RW0m8hf1bjXOJdfz+3bRiSKK36Eg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013023.outbound.protection.outlook.com [40.93.196.23])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckvh41pfv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 01 Mar 2026 22:56:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPYHWnauF2ML1u1DSni+MEm+p29mPB0rzFNjL13vdbjNoVi7gS5IiTIcrpYgJFyUWt7gRvn6Z/bFCULMEBBf3zWO0CKislzNb22fPqKUsRNsHMPIs5gUqJHKrf73rxgL/0u1ZHXt1J+CWxF6+VaXr9IrA+0iBCIkxkw2PYo0SOYmy1scGrlv0KMM9m7EciGSmQoZpb6rSqA63YTUGU9teKbZXWp00nTc9RL6B+xWSpkpIQo6j51ExcHcI2ZxynnHgaNesAaviTpbP5kD8GoedwTCkw9wTrY8LLp29cHmEDngLTkG2Cjj6+ouCvS0kFfYR2FezBiwWNYALSy2+lJKug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlQ9fezyBjNkAP3wv0PVo//HpxixFBSZLzGaa86pc9M=;
 b=fCIYYrMHwcWlW2ArnIf6ysJgQg0kpZg9Y9uEyQHMPXIr+qpLYmZhCI6IV7WfVIPyP92eSV2BhCIhuGDOqIe8b1V2/8zWRqm2FDN2iC1yD1JkjSfwCa2nQA4XL5ZBPE916gO7oEgvJxqzx6NnKpuveidEDLec1nJXzxolBXVrfzYakOEliw1ab9xDmcg2fE8c+sTBT8BSvzpvgVBLCK8dDaWyHSfnlGmPqeV5cwhNOgoUnkamG0gkd9Sap3JggU/KDntbUNDCqRHLwEcDf0aetMTAOX6ICXBUi+iec+3eH/bLJstAQSbtrYrg+vn6mYpggOvMT2tKKRXnIvTB0my5Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by DS0PR11MB7852.namprd11.prod.outlook.com (2603:10b6:8:fc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 06:56:30 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 06:56:30 +0000
Content-Type: multipart/alternative;
 boundary="------------C8aSPodU5nw0HXokLxjhJFCL"
Message-ID: <4976379c-144e-4863-8922-3962c4daeb21@windriver.com>
Date: Mon, 2 Mar 2026 14:56:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [AUH] python3-rdflib: upgrading to 7.6.0 SUCCEEDED
To: Randy MacLeod <randy.macleod@windriver.com>,
        "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>,
        Alexander Kanavin <alex.kanavin@gmail.com>,
        "Li, Changqing" <changqing.li@windriver.com>,
        "Chen, Qi" <qi.chen@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <0101019c720ee382-b27e2993-68bf-4034-a5b8-1bc9fd0d4663-000000@us-west-2.amazonses.com>
 <6733c658-47d6-488b-8f0a-ea19bf20df47@windriver.com>
 <TYWPR01MB118611CAA2AAC1BEC4086414ADC72A@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <afd3d79d-4201-4fa7-ae3e-174702e692a3@windriver.com>
 <TYWPR01MB118617E05B1321306A4EBAE85DC73A@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <bf03027d-1e5e-491e-8f01-6ba833ea00ec@windriver.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <bf03027d-1e5e-491e-8f01-6ba833ea00ec@windriver.com>
X-ClientProxiedBy: TYCP301CA0029.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::15) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|DS0PR11MB7852:EE_
X-MS-Office365-Filtering-Correlation-Id: 589799b9-9e90-4951-ea5a-08de7828d517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|14052099004|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	CPez+OCs7zX4X9WSbIz+1b69oYShEQU4ZqPEf32xgfhVGZXL3aNHGaQn8JXpwcFp0TN9qDFlvEPYh+X++amPZ5mMcLPBV1Slm/1vqnRGoBUpOYBqcfEGlLaCNwrObGoYp4DXjZMQzQUibmBhM2jhDxjrx9x/G3Xli3ZskuDqhysQWl/lZ92N9QZb0sWVo8A1F8LnMQLXPe/ztemHELCT4MyoKFzWm6j/DP7fb/JmSRMnlIQF7BvgGZ2HtLQcm1o4DfAjgKjjIS7KG02JYuuwv9qp4+Q/s3ysQNMan0wLn7sV0VsYbtF/oM/k48NWVax32lBkQ795ImI8ZatkPlXVNo4or6I5z0XstQhNn4FfSYP87G3o8jThwzCedU8UKL3LgC+ldBnOaJA0s0vD7D6fy795M2wENgKP8g+ZagbLat1YMxlXch8SvSbBWr9awTAlj1V4ZthoaJbsymC3j7hjVByaG54WcNqfVEIgv2WE8wsf7lEabtFCyVlZ7h7M1AmfwtdnyLGyFdv/0MiCJNUsYfnijmDwMne62ItDa4XGiUZ3/XIdC/bVrIcq2S7exPy9U2W+GPl9c50yGMRUmTcS256RvvEX4SPM+0DIidgfvGE6pDajgc+m5f4A+cPMvpwNn8o8Bn0Z7qgt68l9oZT8aGA04seOASNAqY7ggTsEzfpZj4ImjEzScvrX5roSGRO+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(14052099004)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d0l2UGJXZFZCV2lJYmtEN05xMkRyeGQzS0IzaEd1OXdoREpEVG11Rkh6MHdl?=
 =?utf-8?B?cXFXR3MxNWt3SmVXY2RiN3MvOGVGUmlvN1hIdnRoRS92dXpVN0Z3dXlrdHVv?=
 =?utf-8?B?czk4NkxwZko0VGtvaHBUTjZIanUwQVozeDQ2UmNWQ2taUXJVY0YwaHVuREtX?=
 =?utf-8?B?dlBrc1FUdWpKNUdPMzJhYVRxandjSm9vbHlzMXdsVDJIUjl0b25nZ2RPNFkx?=
 =?utf-8?B?Wk9CS3djV2hSYlJtSU9va05XcFVVdXVlQW9hU3E4cVdSTkpEWjFrOEZ2YlJm?=
 =?utf-8?B?OENvZ2dyZXMvUWxXVW14U0dvS3hBUnh5cjNDVkZ4VVBDeEVTZit1alFTTUQ0?=
 =?utf-8?B?N0tVTnYzRTFFdGtZRURFQVROeVZYQVJmMmZYTXJ5b0M5N0Z0Wm5VbG1SMWd6?=
 =?utf-8?B?Q3NaNU9HSDVSZm53MTkva1JuRnhTM00wWDR4MGtKMld6RUlZYXFEdU9zZXZW?=
 =?utf-8?B?elhqOHRpMU1rU3g2WlRXQjZLdjdtWHRJUHl6Q2RNeE5ud3ZLVm1rcGF6T2Jn?=
 =?utf-8?B?YXZkcVJJb2VVd0pRQmpEMlV3dmNnVUYrTlovSzlzb3MxVitPaG56eHRnMkQ2?=
 =?utf-8?B?aFdMT0ZjOG40ZHd2cThOUWdoUjRvdjAwOVNUQ1VDZnNrRFYzREhnS284bU1y?=
 =?utf-8?B?Mlg5MS9FWTRwTklIRXlpK1F4Y0E1dDNuYzhNOURHZCtYajdMVmJYVFErV2R3?=
 =?utf-8?B?d0tmUHZhS25rODAyWmFPYmRCbTRpNXRpcTZWaEU3eW9lNkhQUGE3NGE5bkNt?=
 =?utf-8?B?TDg2MWJJVDlKVmNMRll3MjlFTDFLOXBwNjA4cHlPdlFUdUZVUnY3V1hkUTJa?=
 =?utf-8?B?bEtnRm9LQkhTeWNGZC9oaU95amp6bmhpRE9uUmtFODJhaEh5TnB4b0ZveWVD?=
 =?utf-8?B?em92TkduMlRlY2VZbGpPRWY2Q1ZpM2dvYXJlenRvQytnMFFFRmVZOVhQNkhG?=
 =?utf-8?B?bDFob3BCamZQMUw3MU5sdk10a2RDdDJ1dzhKaDhtRHBrOVcyd1h2blM0eFFD?=
 =?utf-8?B?TWJ5OGtHRU5TYU9jcUx1Y201djBUMVpxVWM3Yi9VbVBqMFMwbG0rWE1TdTBR?=
 =?utf-8?B?bHYxdm9rTXJUQUhPb3NNS3NLWEVSd1R4c29qeUtuekJERmpqMlZKRHlaVmRU?=
 =?utf-8?B?ek14WlNHRStNd2tvMS83Q2plL2kxUTMzMVRLZXJxUzEwS0FUaW9mYXYrMThC?=
 =?utf-8?B?YmI5MTVLQldIS0pZVEJtR2F6V01OV2JVYXlNbDc4OGh6eHpsNUFvcDJiS2lH?=
 =?utf-8?B?Q2hwWnl1NUxvU1J1Yi9EM2hLNWR6S0F6Z3RhSEo4dytJVCtvVHdsMkxOdnV2?=
 =?utf-8?B?T2ZBcjY2MFJJbkhEdFV3VHFackdmMXJqUEhzaDVsUGtiZVNxYWZTL2dzaTZi?=
 =?utf-8?B?ZGNsVTQ0ejBRczA3QzEwVDNRU1cvbmp5Q2RQb0FlSXFYTmlVbnl1ckNhWkpF?=
 =?utf-8?B?WEtzV2xISG9QTnU3Nmo5K2FHYXpha3RMRDFlZnJ5bnIzcW9rTlVwZ1Rka1NN?=
 =?utf-8?B?WGRTK0t2dzIxL0NaN1V2cW5DWGZPaHpkUmh5ZTV6c2E3eXRrbnBlV3Qvd0VR?=
 =?utf-8?B?NXRsbE43aVN6Rm9GQ1p0T1hUQWI2b2xIWGtyMHd4RklTU2NxOWZiZFBRa25R?=
 =?utf-8?B?eUsxV1NVZDFJL2hjdFNBd3UzODRvSW5ZSnc4dFU4Y2RUWjJtaGRiY2h5L20y?=
 =?utf-8?B?UXJGQklYR1VMQURzbi9raFRmQ3VBeFc4WTJzdGtSeEVEWWwvS3dMZWFFc1M3?=
 =?utf-8?B?SXBEU2JKdDQ2UnFKMmxZY0NhejNMbWRqekpKeVBRUXJMVFROYjFReWdHckRr?=
 =?utf-8?B?aVMrV3ppUmxvZ0ZVL25nZzQ0VjdkajVqZWdVRDlTQWdNK2Vhd0RYdHVqT2Fr?=
 =?utf-8?B?VUtTdkFNL3gyQXBKdCtBM0QxVktKM052MVkvWU4rSkI4YmJaQnhDTll6cWoy?=
 =?utf-8?B?SGZIRDRpOG51eUZkN3NHOEdhbUI4d1ZBREMvZ1hib2wybUxPRHMrbDdQNmY1?=
 =?utf-8?B?RlhPZElnRzJsMkJNbTFvODg4TXRVM3hOdGdSUW5DWW5VaFBRNUt0dU9LRnpI?=
 =?utf-8?B?WnVzc3A0VU9mSnFnL3grVU9UcTY1Tnd2UThOODMwdkx4a09JK0JLbFM5VXdH?=
 =?utf-8?B?L3NYVGZEc0dqcysyN0FqeHE2cDZIdWdhOWZlZ0R3ZWpDSk9jd3ZZOHBQSW95?=
 =?utf-8?B?QkE4NmkwdWJQSCt1UjRZTVAyL3IyYis4NHRTdkRQVUk3U1lrYmZLUGtySGRw?=
 =?utf-8?B?S2gzS1RTL04rYVIyUCt3ODBTRnNkeElTb0FYSDdGT1E5dVVKOUJkYmhFWms3?=
 =?utf-8?B?dkdDSWd2SWpGakxvVDdtaEdqL3I4eXJuMy9lY0pYNzd6dWpYZGhPUT09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 589799b9-9e90-4951-ea5a-08de7828d517
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 06:56:30.6081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLJP7mW/PajS2tFV3K4co6iEOKpAQ2L2Y/ysueSTA0xBRBuej7Ee2J0H/zlOrrGgC0uPANTPVywAMAoBw5xIsw2Ac586yimpJ5dpfxVV2YA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7852
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: ilg0KL5_v_5OYqVYmFeugnjjbDb1VpDi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA1OSBTYWx0ZWRfXw8CXJQqBetni
 5mbwWf7f8vmkWbvDEcGvjXmXG6lsOGctoXKWcYL0F0DD9OjfY7uhwHRK1+EpukJQwgoODGtlE5h
 kWSohdN3Yb6TSgt/wgR8GTwVTM22JCOA45undSq6/7rkAXFFits9VEATd8g8MYHMA77CWrF3aVl
 gFFAS+chDPq3/17h9xArJudst1vb4P7MShncm/ZP5EDv87DM10YkpNWyZE165lhFcfjImx95J4E
 UKY3bd6Y4DiEY4rBXOKyQigU+dbJ+wvrh3AwI3aFJxJ5Wz8/SlsE298JEnojg8Be7Y6XFW9Tg8U
 anAg4DWUt3MUiXX/Dj1+tnrLO9XfnKPI7noCHQyc4sNz+8bwWEDQR2JPWO9z5ZSgxcHqAJ6mxPM
 i7wg1UZSOzILLxybFY2NHOTVKlZmTxgoG3NqTTfLHGK2dUejudugYsecB5hRzheSQpi2wbGAvHQ
 ndfNAuMFyvAtmmnXg1A==
X-Proofpoint-GUID: 7kJtmzLYDOzdKd0adATJfCXbq6H-c9EQ
X-Authority-Analysis: v=2.4 cv=Z/3h3XRA c=1 sm=1 tr=0 ts=69a534a2 cx=c_pps
 a=iHXbSHwDNs+yH6wS+48/mw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=VwQbUJbxAAAA:8
 a=B8ibFTVmAAAA:8 a=omOdbC7AAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=_JlexQ3jhijeLTg8Y2sA:9
 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=UqCG9HQmAAAA:8
 a=nAVe7_1CYp6MitnHToMA:9 a=uukINRVnFzDq6k7u:21 a=UiCQ7L4-1S4A:10
 a=hTZeC7Yk6K0A:10 a=_W_S_7VecoQA:10 a=xvSgdcfEVHFitugM1GHH:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 06:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232180

--------------C8aSPodU5nw0HXokLxjhJFCL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6226KCqo1556269

On 2/27/26 21:57, Randy MacLeod wrote:
> On 2026-02-26 8:53 p.m., Mingyu Wang (Fujitsu) wrote:
>>
>> =EF=82=B7=C2=A0 Should we prioritize upgrading the successful ones fir=
st and deal=20
>> with the failed ones later?
>>
> Changqing, Qi and I are doing most of the AUH FAILED recipes.
> If you'd like to do some as well, just say so.
>>
>> If so, there are about 60 in total. Should I take the first 30
>>
> Sure, first 30 is fine. (1)
>
> Hongxu, Qi, Changqing,
> Will you review and do 31-55 ?
>
Sure, I am working on 31-55 and will send patches before March 6

//Hongxu

>> =C2=A0or the last 30?
>>
>> =EF=82=B7=C2=A0 What is the deadline?
>>
> The 6.0-M3 build date (2) is Monday, March 9 so the deadline for major=20
> updates is next week (March 2-6),
>
> earlier the better.
>
> Note that openssl will remain at v 3.5.x since that's an openssl LTS=20
> release.
>
> Thanks,
>
> ../Randy
>
> 1)
>
> from:=20
> https://lore.kernel.org/openembedded-core/?q=3Ds%3AAUH+AND+s%3ASUCCEEDE=
D+AND+d%3A2026-02-18
>
>   1.*[AUH] vulkan-samples: upgrading to=20
> 3abbdf8b5a3bf250f6475f9fe674567b14e9b1ad SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720efc92-2a644a4d-64=
91-4e40-8256-d47ae154c19a-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [93%]
>
>   2.*[AUH] xorgproto: upgrading to 2025.1 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720efd45-87be0bf6-c0=
7c-45fd-918c-46213772c1a9-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [85%]
>
>   3.*[AUH] libtraceevent: upgrading to 1.9.0 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720efd67-f015fd77-3e=
1c-440a-8e5f-3fa1adcc6db8-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [71%]
>
>   4.*[AUH] librsvg: upgrading to 2.61.4 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ef9c0-c37255a9-2a=
fe-4bfe-92cf-d0cf08eabeb8-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [23%]
>
>   5.*[AUH] gstreamer1.0: upgrading to 1.28.0 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720f0596-80b51276-f9=
11-432e-aca5-2a096f3b683b-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [21%]
>
>   6.*[AUH] libadwaita: upgrading to 1.8.4 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720efa26-30b70cf6-ea=
dc-4bd7-aff2-fbde8c08bd45-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [6%]
>
>   7.*[AUH] wireless-regdb: upgrading to 2026.02.04 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720efefb-70cdcf59-5c=
fe-4743-9d80-3dd85045bd1a-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [88%]
>
>   8.*[AUH] hwdata: upgrading to 0.404 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720f07cf-6767e43b-a5=
2b-4d18-98ee-40d76d5fecea-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [86%]
>
>   9.*[AUH] sbc: upgrading to 2.2 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720f057e-b288e732-e0=
b1-4740-8a59-bb2c4721cc3a-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [78%]
>
> 10.*[AUH] libpng: upgrading to 1.6.55 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720f049d-80a54c02-68=
dd-42cd-9d2d-79794522e22e-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [74%]
>
> 11.*[AUH] spirv-llvm-translator: upgrading to 21.1.4 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720efc92-79e79fb7-44=
25-41ff-8ac6-4cadd283268a-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [73%]
>
> 12.*[AUH] p11-kit: upgrading to 0.26.2 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720f0d63-15862410-e8=
34-4522-9f92-27b1b7061aee-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [36%]
>
> 13.*[AUH] gstreamer1.0-vaapi: upgrading to 1.26.10 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720f05ca-7c385378-8f=
46-4e71-a768-f1d79c5a2b96-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [10%]
>
> 14.*[AUH] diffoscope: upgrading to 312 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720f076c-b5fb3143-99=
3f-4eac-9026-84108f2d417c-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [81%]
>
> 15.*[AUH] enchant2: upgrading to 2.8.15 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720f076a-186fde78-b3=
a0-45cd-8146-01a7031d4eb0-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [77%]
>
> 16.*[AUH] libxmlb: upgrading to 0.3.25 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ef9f3-9dc752f6-8d=
21-4281-8c8f-a327e92979a2-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [73%]
>
> 17.*[AUH] taglib: upgrading to 2.2 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720f0e87-1584c681-c1=
12-4ccc-9210-f93ebc34d917-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [45%]
>
> 18.*[AUH] libgpg-error: upgrading to 1.59 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720f09da-8ad9c535-91=
64-44c7-8a11-f850c20d6433-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [42%]
>
> 19.*[AUH] libsoup: upgrading to 3.6.6 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720f0cef-41fcba72-3f=
31-406a-a0aa-efad029519bc-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [39%]
>
> 20.*[AUH] gtk4: upgrading to 4.20.3 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720efb38-0e0ae483-95=
9f-4e4a-962f-1a4f9094cacc-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [3%]
>
> 21.*[AUH] rpm-sequoia-crypto-policy: upgrading to=20
> f3f5fa454345b03039ee3d904964fc14829637ce SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ee8c4-1326c100-12=
27-44cf-aa45-b611809bcaf8-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [99%]
>
> 22.*[AUH] rpm-sequoia: upgrading to 1.10.1 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720eec05-fafadaa6-b5=
b2-4f6e-a03d-f32a637ce76a-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [13%]
>
> 23.*[AUH] fastfloat: upgrading to 8.2.3 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ed3a7-50032806-50=
70-42f5-b052-81c743a6e20a-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [86%]
>
> 24.*[AUH] ttyrun: upgrading to 2.41.0 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ecf1b-045c38a9-72=
cb-43e0-992c-0f95c4a363b8-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [84%]
>
> 25.*[AUH] ed: upgrading to 1.22.5 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720eefb6-5503fe20-6e=
22-4ca3-92d3-61e465568822-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [84%]
>
> 26.*[AUH] libuv: upgrading to 1.52.0 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ec780-9a3b8a18-6b=
4d-489e-afbb-1fe42d50ea1b-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [81%]
>
> 27.*[AUH] less: upgrading to 692 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720eef19-1f0dbf2e-85=
ca-4a23-b82b-6386cf40820a-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [73%]
>
> 28.*[AUH] ccache: upgrading to 4.12.3 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ed245-3ba8458b-70=
64-49f5-a6bb-edb8295f35ae-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [67%]
>
> 29.*[AUH] libcap-ng-python,libcap-ng: upgrading to 0.9.1,0.9.1 SUCCEEDE=
D=20
> <https://lore.kernel.org/openembedded-core/0101019c720ec5f6-8ae46777-3b=
7e-46c5-8ba3-c82106bd8312-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [55%]
>
> 30.*[AUH] libx11,libfontenc: upgrading to 1.8.13,1.1.9 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ec568-78714733-d5=
5b-4bab-a2ec-abbcd8f4b599-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [47%]
>
> -----------------------------------------------------------------------=
-----------------------
>
> 31.*[AUH] ell: upgrading to 0.82 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ecf45-43f50ef5-8b=
79-4cbd-9089-7d80b9631d72-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [15%]
>
> 32.*[AUH] font-alias: upgrading to 1.0.6 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ec439-848d68dc-4c=
90-4645-9999-2e97cd69ae30-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [86%]
>
> 33.*[AUH] python3-markdown: upgrading to 3.10.2 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ed968-18664721-e3=
f0-46cf-ad90-20360651118b-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [78%]
>
> 34.*[AUH] gn: upgrading to 9d19a7870add65151ff91bcc26252bb7521065cf=20
> SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ed760-810dfe91-05=
57-4084-a56c-85eae3d063ed-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [55%]
>
> 35.*[AUH] python3-cryptography-vectors,python3-cryptography: upgrading =
to=20
> 46.0.5,46.0.5 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ec412-e2eaf0f8-88=
2b-48c9-8903-0d11c7b57e89-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [44%]
>
> 36.*[AUH] ncurses: upgrading to 6.6 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ecf0b-976a5a4a-43=
99-4b36-ac4c-e46263c3d9d4-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [33%]
>
> 37.*[AUH] btrfs-tools: upgrading to 6.19 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ed1a2-4fde9b9f-9c=
8d-4c4c-afa1-073bfc465527-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [16%]
>
> 38.*[AUH] openssl: upgrading to 3.6.1 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ecad9-289adab8-03=
84-4f80-84c3-984eb261e560-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [9%]
>
> 39.*[AUH] zlib: upgrading to 1.3.2 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ed212-3bcc8dde-06=
40-4d2d-8054-e8e60ecbf04d-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [9%]
>
> 40.*[AUH] connman: upgrading to 2.0 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ec958-2397828f-7c=
04-4eb4-ac3e-ef4cd75579b1-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [5%]
>
> 41.*[AUH] xauth: upgrading to 1.1.5 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ec3d9-fbc6621a-a0=
d5-4800-94df-bb6a03cf2443-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [83%]
>
> 42.*[AUH] python3-testtools: upgrading to 2.8.3 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ee3c2-d28e1975-17=
9b-4b55-860c-e09ad43167f8-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [77%]
>
> 43.*[AUH] python3-xmltodict: upgrading to 1.0.3 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ee886-e523bc47-c9=
dc-4dc0-9a5a-f2d61344fd24-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [76%]
>
> 44.*[AUH] python3-pyproject-metadata: upgrading to 0.11.0 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720edd35-9236884d-27=
e6-45a0-ba5e-e34afa46938f-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [73%]
>
> 45.*[AUH] python3-hypothesis: upgrading to 6.151.9 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ed94c-2009b040-52=
5b-4ab2-9613-40999971f57a-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [69%]
>
> 46.*[AUH] python3-wcwidth: upgrading to 0.6.0 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ee68b-95243140-64=
4b-462f-8dd3-df2ef0d5f97b-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [66%]
>
> 47.*[AUH] python3-rdflib: upgrading to 7.6.0 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ee382-b27e2993-68=
bf-4034-a5b8-1bc9fd0d4663-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [60%]
>
> 48.*[AUH] python3-trove-classifiers: upgrading to 2026.1.14.14 SUCCEEDE=
D=20
> <https://lore.kernel.org/openembedded-core/0101019c720ee4f4-beb714ed-88=
3c-433e-a890-db8952300533-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [58%]
>
> 49.*[AUH] python3-pycparser: upgrading to 3.0 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720edd0d-c84824a7-f9=
59-4f88-ba0f-6ee99b384e06-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [52%]
>
> 50.*[AUH] python3-pip: upgrading to 26.0.1 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720edbdf-8b775dee-95=
ce-4959-b25d-0036f159e806-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [27%]
>
> 51.*[AUH] python3-poetry-core: upgrading to 2.3.1 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ede90-4a44d733-8f=
fb-40a2-876c-a9f925ab73e9-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [18%]
>
> 52.*[AUH] python3-uv-build: upgrading to 0.10.4 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ee748-45965cc5-3c=
70-4c94-adbe-01a1c9e65852-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [13%]
>
> 53.*[AUH] python3-maturin: upgrading to 1.12.2 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ede9c-79777fa3-22=
2b-491b-b353-f1dffbdc4e95-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [10%]
>
> 54.*[AUH] python3-setuptools: upgrading to 82.0.0 SUCCEEDED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ee6c6-e45fb965-bd=
06-42ab-8623-4f7aa90bb139-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [8%]
>
> 55.*[AUH] glib-2.0-initial,glib-2.0: upgrading to 2.86.4,2.86.4 SUCCEED=
ED=20
> <https://lore.kernel.org/openembedded-core/0101019c720ead92-1bd0d0ba-9f=
ff-4d9f-8682-fd339a3c6cfb-000000@us-west-2.amazonses.com/>*
>      - by auh @ 2026-02-18 18:41 UTC [15%]
>
>
>
>
>
> 2)
>
>
> From the Yocto Status email:
>
> - YP 6.0 M3 Build Date 2026-03-09
> - YP 6.0 M3 Release Date 2026-03-20
> - YP 6.0 M4 Build Date 2026-03-30
> - YP 6.0 M4 Release Date 2026-04-26
>
>
>> =C2=A0--
>>
>> Best Regards
>>
>> ---------------------------------------------------
>>
>> Wang Mingyu
>>
>> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
>>
>> No.6 Wenzhu Road, Nanjing, 210012, China
>>
>> TEL=EF=BC=9A+86+25-86630566--8568
>>
>> COINS: 79988548
>>
>> FAX: +86+25-83317685
>>
>> MAIL: wangmy@fujitsu.com <mailto:wangmy@fujitsu.com>
>>
>> *From:*Randy MacLeod <randy.macleod@windriver.com>
>> *Sent:* Thursday, February 26, 2026 10:26 PM
>> *To:* Wang, Mingyu/=E7=8E=8B=E9=B8=A3=E7=91=9C<wangmy@fujitsu.com>; Al=
exander Kanavin=20
>> <alex.kanavin@gmail.com>
>> *Cc:* openembedded-core@lists.openembedded.org; Jia, Hongxu=20
>> <Hongxu.Jia@windriver.com>
>> *Subject:* Re: [OE-core] [AUH] python3-rdflib: upgrading to 7.6.0=20
>> SUCCEEDED
>>
>> On 2026-02-25 10:14 p.m., Mingyu Wang (Fujitsu) wrote:
>>
>>     I've also been on vacation since 2.18 and just returned to work.
>>     I'll handle the python3-rdflib upgrade.
>>
>> Thanks Wangmy and I hope you had a good vacation.
>>
>> The bigger question is the > 50 packages that AUH managed to upgrade.
>>
>> Will you also do most of them or would you like to split this list=20
>> with Hongxu/Qi/ etc?
>> If you want to split it, please reply with the packages you will do.
>>
>> Thanks,
>>
>> ../Randy
>>
>>     =C2=A0--
>>
>>     Best Regards
>>
>>     ---------------------------------------------------
>>
>>     Wang Mingyu
>>
>>     FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
>>
>>     No.6 Wenzhu Road, Nanjing, 210012, China
>>
>>     TEL=EF=BC=9A+86+25-86630566--8568
>>
>>     COINS: 79988548
>>
>>     FAX: +86+25-83317685
>>
>>     MAIL: wangmy@fujitsu.com <mailto:wangmy@fujitsu.com>
>>
>>     *From:*Randy MacLeod <randy.macleod@windriver.com>
>>     <mailto:randy.macleod@windriver.com>
>>     *Sent:* Wednesday, February 25, 2026 12:42 AM
>>     *To:* Wang, Mingyu/=E7=8E=8B=E9=B8=A3=E7=91=9C<wangmy@fujitsu.com>
>>     <mailto:wangmy@fujitsu.com>; Alexander Kanavin
>>     <alex.kanavin@gmail.com> <mailto:alex.kanavin@gmail.com>
>>     *Cc:* openembedded-core@lists.openembedded.org; Jia, Hongxu
>>     <Hongxu.Jia@windriver.com> <mailto:Hongxu.Jia@windriver.com>
>>     *Subject:* Re: [OE-core] [AUH] python3-rdflib: upgrading to 7.6.0
>>     SUCCEEDED
>>
>>     Hello Wang, and everyone,
>>
>>     Alex mentioned in the YP tech call today that he's on vacation
>>     starting tomorrow, iirc.
>>
>>     Alex,
>>     =C2=A0 =C2=A0 I assume that you won't be sending a patch series fo=
r the
>>     succeeding AUH upgrades.
>>
>>     Wang,
>>     =C2=A0 =C2=A0Have you or do you plan to work on that?
>>
>>     If not, Hongxu and maybe others at WR will work on that.
>>     I'm going to focus on the failed AUH upgrade set of recipes.
>>
>>     ../Randy
>>
>>     On 2026-02-18 1:41 p.m., Auto Upgrade Helper via
>>     lists.openembedded.org
>>     <https://urldefense.com/v3/__http:/lists.openembedded.org__;!!Ajve=
Ydw8EvQ!cC2WyezAalR6UZOZ07BsaBry1ZouLbKpeZ9nmC_s0Z9sWMH3AU12RFCRUC7BKKlhQ=
zHFJRMeHgUCGuPSquz_VA$>
>>     wrote:
>>
>>         Hello,
>>
>>          =20
>>
>>         this email is a notification from the Auto Upgrade Helper
>>
>>         that the automatic attempt to upgrade the recipe(s) *python3-r=
dflib* to *7.6.0* has Succeeded.
>>
>>          =20
>>
>>         Next steps:
>>
>>          =C2=A0=C2=A0=C2=A0 - apply the patch: git am 0001-python3-rdf=
lib-upgrade-7.5.0-7.6.0.patch
>>
>>          =C2=A0=C2=A0=C2=A0 - check the changes to upstream patches an=
d summarize them in the commit message,
>>
>>          =C2=A0=C2=A0=C2=A0 - compile an image that contains the packa=
ge
>>
>>          =C2=A0=C2=A0=C2=A0 - perform some basic sanity tests
>>
>>          =C2=A0=C2=A0=C2=A0 - amend the patch and sign it off: git com=
mit -s --reset-author --amend
>>
>>          =C2=A0=C2=A0=C2=A0 - send it to the appropriate mailing list
>>
>>          =20
>>
>>         Alternatively, if you believe the recipe should not be upgrade=
d at this time,
>>
>>         you can fill RECIPE_NO_UPDATE_REASON in respective recipe file=
 so that
>>
>>         automatic upgrades would no longer be attempted.
>>
>>          =20
>>
>>         Please review the attached files for further information and b=
uild/update failures.
>>
>>         Any problem please file a bug athttps://bugzilla.yoctoproject.=
org/enter_bug.cgi?product=3DAutomated%20Update%20Handler
>>
>>          =20
>>
>>         Regards,
>>
>>         The Upgrade Helper
>>
>>          =20
>>
>>         -- >8 --
>>
>>          From 6a230684782cbe47a4f0e5fe6c2268da57091fea Mon Sep 17 00:0=
0:00 2001
>>
>>         From: Upgrade Helper<auh@yoctoproject.org>
>>
>>         Date: Wed, 18 Feb 2026 13:46:27 +0000
>>
>>         Subject: [PATCH] python3-rdflib: upgrade 7.5.0 -> 7.6.0
>>
>>          =20
>>
>>         ---
>>
>>           ...dflib_7.5.0.bb =3D> python3-rdflib_7.6.0.bb} | 25 +++++++=
++++++++++--
>>
>>           1 file changed, 23 insertions(+), 2 deletions(-)
>>
>>           rename meta/recipes-devtools/python/{python3-rdflib_7.5.0.bb=
 =3D> python3-rdflib_7.6.0.bb} (34%)
>>
>>          =20
>>
>>         diff --git a/meta/recipes-devtools/python/python3-rdflib_7.5.0=
.bb b/meta/recipes-devtools/python/python3-rdflib_7.6.0.bb
>>
>>         similarity index 34%
>>
>>         rename from meta/recipes-devtools/python/python3-rdflib_7.5.0.=
bb
>>
>>         rename to meta/recipes-devtools/python/python3-rdflib_7.6.0.bb
>>
>>         index e421aa2bac..1b830e8aa9 100644
>>
>>         --- a/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb
>>
>>         +++ b/meta/recipes-devtools/python/python3-rdflib_7.6.0.bb
>>
>>         @@ -1,10 +1,31 @@
>>
>>         +# FIXME: the LIC_FILES_CHKSUM values have been updated by 'de=
vtool upgrade'.
>>
>>         +# The following is the difference between the old and the new=
 license text.
>>
>>         +# Please update the LICENSE value if needed, and summarize th=
e changes in
>>
>>         +# the commit message via 'License-Update:' tag.
>>
>>         +# (example: 'License-Update: copyright years updated.')
>>
>>         +#
>>
>>         +# The changes:
>>
>>         +#
>>
>>         +# --- LICENSE
>>
>>         +# +++ LICENSE
>>
>>         +# @@ -1,6 +1,6 @@
>>
>>         +#=C2=A0 BSD 3-Clause License
>>
>>         +#
>>
>>         +# -Copyright (c) 2002-2025, RDFLib Team
>>
>>         +# +Copyright (c) 2002-2026, RDFLib Team
>>
>>         +#=C2=A0 All rights reserved.
>>
>>         +#
>>
>>         +#=C2=A0 Redistribution and use in source and binary forms, wi=
th or without
>>
>>         +#
>>
>>         +#
>>
>>         +
>>
>>           SUMMARY =3D "RDFLib is a pure Python package for working wit=
h RDF"
>>
>>           HOMEPAGE =3D"https://github.com/RDFLib/rdflib"
>>
>>           SECTION =3D "devel/python"
>>
>>           LICENSE =3D "BSD-3-Clause"
>>
>>         -LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3D7006e973486c4700556=
f6d58cba0ab6c"
>>
>>         +LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3D0ac0171cee5250c44d7=
d49847ae53a3e"
>>
>>          =20
>>
>>         -SRC_URI[sha256sum] =3D "663083443908b1830e567350d72e74d9948b3=
10f827966358d76eebdc92bf592"
>>
>>         +SRC_URI[sha256sum] =3D "6c831288d5e4a5a7ece85d0ccde9877d512a3=
d0f02d7c06455d00d6d0ea379df"
>>
>>          =20
>>
>>          =C2=A0inherit pypi python_poetry_core
>>
>>          =20
>>
>>
>>
>>
>>         -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>         Links: You receive all messages sent to this group.
>>
>>         View/Reply Online (#231360):https://lists.openembedded.org/g/o=
penembedded-core/message/231360
>>
>>         Mute This Topic:https://lists.openembedded.org/mt/117879875/36=
16765
>>
>>         Group Owner:openembedded-core+owner@lists.openembedded.org
>>
>>         Unsubscribe:https://lists.openembedded.org/g/openembedded-core=
/unsub [randy.macleod@windriver.com]
>>
>>         -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>          =20
>>
>>     --=20
>>
>>     # Randy MacLeod
>>
>>     # Wind River Linux
>>
>> --=20
>> # Randy MacLeod
>> # Wind River Linux
>
>
> --=20
> # Randy MacLeod
> # Wind River Linux


--------------C8aSPodU5nw0HXokLxjhJFCL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6226KCqo1556269

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2/27/26 21:57, Randy MacLeod wrote:=
<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:bf03027d-1e5e-491e-8f01-6ba833e=
a00ec@windriver.com">
     =20
      <div class=3D"moz-cite-prefix">On 2026-02-26 8:53 p.m., Mingyu Wang
        (Fujitsu) wrote:<br>
      </div>
      <blockquote type=3D"cite" cite=3D"mid:TYWPR01MB118617E05B1321306A4E=
BAE85DC73A@TYWPR01MB11861.jpnprd01.prod.outlook.com">
        <meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered m=
edium)">
        <style>@font-face
	{font-family:"MS Mincho";
	panose-1:2 2 6 9 4 2 5 8 3 4;}@font-face
	{font-family:=E5=AE=8B=E4=BD=93;
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:=E7=AD=89=E7=BA=BF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:"\@=E5=AE=8B=E4=BD=93";
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:"\@=E7=AD=89=E7=BA=BF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:"\@MS Mincho";
	panose-1:2 2 6 9 4 2 5 8 3 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:=E5=AE=8B=E4=BD=93;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}pre
	{mso-style-priority:99;
	mso-style-link:"HTML =E9=A2=84=E8=AE=BE=E6=A0=BC=E5=BC=8F =E5=AD=97=E7=AC=
=A6";
	margin:0cm;
	font-size:12.0pt;
	font-family:=E5=AE=8B=E4=BD=93;}span.HTML
	{mso-style-name:"HTML =E9=A2=84=E8=AE=BE=E6=A0=BC=E5=BC=8F =E5=AD=97=E7=AC=
=A6";
	mso-style-priority:99;
	mso-style-link:"HTML =E9=A2=84=E8=AE=BE=E6=A0=BC=E5=BC=8F";
	font-family:"Courier New";}span.EmailStyle22
	{mso-style-type:personal-reply;
	font-family:=E7=AD=89=E7=BA=BF;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}div.WordSection1
	{page:WordSection1;}</style>
        <div class=3D"WordSection1">
          <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:=
10.5pt;font-family:=E7=AD=89=E7=BA=BF">=EF=82=B7&nbsp; Should we
              prioritize upgrading the successful ones first and deal
              with the failed ones later?&nbsp;</span></p>
        </div>
      </blockquote>
      Changqing, Qi and I are doing most of the AUH FAILED recipes.<br>
      If you'd like to do some as well, just say so.
      <blockquote type=3D"cite" cite=3D"mid:TYWPR01MB118617E05B1321306A4E=
BAE85DC73A@TYWPR01MB11861.jpnprd01.prod.outlook.com">
        <div class=3D"WordSection1">
          <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:=
10.5pt;font-family:=E7=AD=89=E7=BA=BF"><o:p></o:p></span></p>
          <p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D=
"EN-US" style=3D"font-size:10.5pt;font-family:=E7=AD=89=E7=BA=BF">If
              so, there are about 60 in total. Should I take the first
              30</span></p>
        </div>
      </blockquote>
      <p>Sure, first 30 is fine. (1)</p>
      <p>Hongxu, Qi, Changqing,&nbsp;<br>
        Will you review and do 31-55 ?<br>
        <br>
      </p>
    </blockquote>
    <p>Sure, I am working on 31-55 and will send patches before March 6<b=
r>
    </p>
    <p>//Hongxu<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:bf03027d-1e5e-491e-8f01-6ba833e=
a00ec@windriver.com">
      <p> </p>
      <blockquote type=3D"cite" cite=3D"mid:TYWPR01MB118617E05B1321306A4E=
BAE85DC73A@TYWPR01MB11861.jpnprd01.prod.outlook.com">
        <div class=3D"WordSection1">
          <p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D=
"EN-US" style=3D"font-size:10.5pt;font-family:=E7=AD=89=E7=BA=BF">&nbsp;o=
r
              the last 30? <o:p></o:p></span></p>
          <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:=
10.5pt;font-family:=E7=AD=89=E7=BA=BF">=EF=82=B7&nbsp; What is the
              deadline?</span></p>
        </div>
      </blockquote>
      The 6.0-M3 build date (2) is Monday, March 9 so the deadline for
      major updates is next week (March 2-6),<br>
      <p>earlier the better.<br>
        <br>
        Note that openssl will remain at v 3.5.x since that's an openssl
        LTS release.</p>
      <p>Thanks,</p>
      <p>../Randy</p>
      <p>1)</p>
      <p>from:
        <a class=3D"moz-txt-link-freetext" href=3D"https://lore.kernel.or=
g/openembedded-core/?q=3Ds%3AAUH+AND+s%3ASUCCEEDED+AND+d%3A2026-02-18" mo=
z-do-not-send=3D"true">https://lore.kernel.org/openembedded-core/?q=3Ds%3=
AAUH+AND+s%3ASUCCEEDED+AND+d%3A2026-02-18</a></p>
      <pre> 1. <b><a href=3D"https://lore.kernel.org/openembedded-core/01=
01019c720efc92-2a644a4d-6491-4e40-8256-d47ae154c19a-000000@us-west-2.amaz=
onses.com/" moz-do-not-send=3D"true">[AUH] vulkan-samples: upgrading to 3=
abbdf8b5a3bf250f6475f9fe674567b14e9b1ad SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [93%]

 2. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ef=
d45-87be0bf6-c07c-45fd-918c-46213772c1a9-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] xorgproto: upgrading to 2025.1 SUCCEEDED<=
/a></b>
    - by auh @ 2026-02-18 18:41 UTC [85%]

 3. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ef=
d67-f015fd77-3e1c-440a-8e5f-3fa1adcc6db8-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] libtraceevent: upgrading to 1.9.0 SUCCEED=
ED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [71%]

 4. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ef=
9c0-c37255a9-2afe-4bfe-92cf-d0cf08eabeb8-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] librsvg: upgrading to 2.61.4 SUCCEEDED</a=
></b>
    - by auh @ 2026-02-18 18:41 UTC [23%]

 5. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720f0=
596-80b51276-f911-432e-aca5-2a096f3b683b-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] gstreamer1.0: upgrading to 1.28.0 SUCCEED=
ED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [21%]

 6. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ef=
a26-30b70cf6-eadc-4bd7-aff2-fbde8c08bd45-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] libadwaita: upgrading to 1.8.4 SUCCEEDED<=
/a></b>
    - by auh @ 2026-02-18 18:41 UTC [6%]

 7. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ef=
efb-70cdcf59-5cfe-4743-9d80-3dd85045bd1a-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] wireless-regdb: upgrading to 2026.02.04 S=
UCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [88%]

 8. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720f0=
7cf-6767e43b-a52b-4d18-98ee-40d76d5fecea-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] hwdata: upgrading to 0.404 SUCCEEDED</a><=
/b>
    - by auh @ 2026-02-18 18:41 UTC [86%]

 9. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720f0=
57e-b288e732-e0b1-4740-8a59-bb2c4721cc3a-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] sbc: upgrading to 2.2 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [78%]

10. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720f0=
49d-80a54c02-68dd-42cd-9d2d-79794522e22e-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] libpng: upgrading to 1.6.55 SUCCEEDED</a>=
</b>
    - by auh @ 2026-02-18 18:41 UTC [74%]

11. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ef=
c92-79e79fb7-4425-41ff-8ac6-4cadd283268a-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] spirv-llvm-translator: upgrading to 21.1.=
4 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [73%]

12. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720f0=
d63-15862410-e834-4522-9f92-27b1b7061aee-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] p11-kit: upgrading to 0.26.2 SUCCEEDED</a=
></b>
    - by auh @ 2026-02-18 18:41 UTC [36%]

13. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720f0=
5ca-7c385378-8f46-4e71-a768-f1d79c5a2b96-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] gstreamer1.0-vaapi: upgrading to 1.26.10 =
SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [10%]

14. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720f0=
76c-b5fb3143-993f-4eac-9026-84108f2d417c-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] diffoscope: upgrading to 312 SUCCEEDED</a=
></b>
    - by auh @ 2026-02-18 18:41 UTC [81%]

15. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720f0=
76a-186fde78-b3a0-45cd-8146-01a7031d4eb0-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] enchant2: upgrading to 2.8.15 SUCCEEDED</=
a></b>
    - by auh @ 2026-02-18 18:41 UTC [77%]

16. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ef=
9f3-9dc752f6-8d21-4281-8c8f-a327e92979a2-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] libxmlb: upgrading to 0.3.25 SUCCEEDED</a=
></b>
    - by auh @ 2026-02-18 18:41 UTC [73%]

17. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720f0=
e87-1584c681-c112-4ccc-9210-f93ebc34d917-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] taglib: upgrading to 2.2 SUCCEEDED</a></b=
>
    - by auh @ 2026-02-18 18:41 UTC [45%]

18. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720f0=
9da-8ad9c535-9164-44c7-8a11-f850c20d6433-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] libgpg-error: upgrading to 1.59 SUCCEEDED=
</a></b>
    - by auh @ 2026-02-18 18:41 UTC [42%]

19. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720f0=
cef-41fcba72-3f31-406a-a0aa-efad029519bc-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] libsoup: upgrading to 3.6.6 SUCCEEDED</a>=
</b>
    - by auh @ 2026-02-18 18:41 UTC [39%]

20. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ef=
b38-0e0ae483-959f-4e4a-962f-1a4f9094cacc-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] gtk4: upgrading to 4.20.3 SUCCEEDED</a></=
b>
    - by auh @ 2026-02-18 18:41 UTC [3%]

21. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ee=
8c4-1326c100-1227-44cf-aa45-b611809bcaf8-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] rpm-sequoia-crypto-policy: upgrading to f=
3f5fa454345b03039ee3d904964fc14829637ce SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [99%]

22. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ee=
c05-fafadaa6-b5b2-4f6e-a03d-f32a637ce76a-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] rpm-sequoia: upgrading to 1.10.1 SUCCEEDE=
D</a></b>
    - by auh @ 2026-02-18 18:41 UTC [13%]

23. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ed=
3a7-50032806-5070-42f5-b052-81c743a6e20a-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] fastfloat: upgrading to 8.2.3 SUCCEEDED</=
a></b>
    - by auh @ 2026-02-18 18:41 UTC [86%]

24. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ec=
f1b-045c38a9-72cb-43e0-992c-0f95c4a363b8-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] ttyrun: upgrading to 2.41.0 SUCCEEDED</a>=
</b>
    - by auh @ 2026-02-18 18:41 UTC [84%]

25. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ee=
fb6-5503fe20-6e22-4ca3-92d3-61e465568822-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] ed: upgrading to 1.22.5 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [84%]

26. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ec=
780-9a3b8a18-6b4d-489e-afbb-1fe42d50ea1b-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] libuv: upgrading to 1.52.0 SUCCEEDED</a><=
/b>
    - by auh @ 2026-02-18 18:41 UTC [81%]

27. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ee=
f19-1f0dbf2e-85ca-4a23-b82b-6386cf40820a-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] less: upgrading to 692 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [73%]

28. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ed=
245-3ba8458b-7064-49f5-a6bb-edb8295f35ae-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] ccache: upgrading to 4.12.3 SUCCEEDED</a>=
</b>
    - by auh @ 2026-02-18 18:41 UTC [67%]

29. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ec=
5f6-8ae46777-3b7e-46c5-8ba3-c82106bd8312-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] libcap-ng-python,libcap-ng: upgrading to =
0.9.1,0.9.1 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [55%]

30. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ec=
568-78714733-d55b-4bab-a2ec-abbcd8f4b599-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] libx11,libfontenc: upgrading to 1.8.13,1.=
1.9 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [47%]

-------------------------------------------------------------------------=
---------------------

31. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ec=
f45-43f50ef5-8b79-4cbd-9089-7d80b9631d72-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] ell: upgrading to 0.82 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [15%]

32. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ec=
439-848d68dc-4c90-4645-9999-2e97cd69ae30-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] font-alias: upgrading to 1.0.6 SUCCEEDED<=
/a></b>
    - by auh @ 2026-02-18 18:41 UTC [86%]

33. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ed=
968-18664721-e3f0-46cf-ad90-20360651118b-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] python3-markdown: upgrading to 3.10.2 SUC=
CEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [78%]

34. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ed=
760-810dfe91-0557-4084-a56c-85eae3d063ed-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] gn: upgrading to 9d19a7870add65151ff91bcc=
26252bb7521065cf SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [55%]

35. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ec=
412-e2eaf0f8-882b-48c9-8903-0d11c7b57e89-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] python3-cryptography-vectors,python3-cryp=
tography: upgrading to 46.0.5,46.0.5 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [44%]

36. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ec=
f0b-976a5a4a-4399-4b36-ac4c-e46263c3d9d4-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] ncurses: upgrading to 6.6 SUCCEEDED</a></=
b>
    - by auh @ 2026-02-18 18:41 UTC [33%]

37. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ed=
1a2-4fde9b9f-9c8d-4c4c-afa1-073bfc465527-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] btrfs-tools: upgrading to 6.19 SUCCEEDED<=
/a></b>
    - by auh @ 2026-02-18 18:41 UTC [16%]

38. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ec=
ad9-289adab8-0384-4f80-84c3-984eb261e560-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] openssl: upgrading to 3.6.1 SUCCEEDED</a>=
</b>
    - by auh @ 2026-02-18 18:41 UTC [9%]

39. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ed=
212-3bcc8dde-0640-4d2d-8054-e8e60ecbf04d-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] zlib: upgrading to 1.3.2 SUCCEEDED</a></b=
>
    - by auh @ 2026-02-18 18:41 UTC [9%]

40. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ec=
958-2397828f-7c04-4eb4-ac3e-ef4cd75579b1-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] connman: upgrading to 2.0 SUCCEEDED</a></=
b>
    - by auh @ 2026-02-18 18:41 UTC [5%]

41. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ec=
3d9-fbc6621a-a0d5-4800-94df-bb6a03cf2443-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] xauth: upgrading to 1.1.5 SUCCEEDED</a></=
b>
    - by auh @ 2026-02-18 18:41 UTC [83%]

42. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ee=
3c2-d28e1975-179b-4b55-860c-e09ad43167f8-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] python3-testtools: upgrading to 2.8.3 SUC=
CEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [77%]

43. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ee=
886-e523bc47-c9dc-4dc0-9a5a-f2d61344fd24-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] python3-xmltodict: upgrading to 1.0.3 SUC=
CEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [76%]

44. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ed=
d35-9236884d-27e6-45a0-ba5e-e34afa46938f-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] python3-pyproject-metadata: upgrading to =
0.11.0 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [73%]

45. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ed=
94c-2009b040-525b-4ab2-9613-40999971f57a-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] python3-hypothesis: upgrading to 6.151.9 =
SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [69%]

46. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ee=
68b-95243140-644b-462f-8dd3-df2ef0d5f97b-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] python3-wcwidth: upgrading to 0.6.0 SUCCE=
EDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [66%]

47. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ee=
382-b27e2993-68bf-4034-a5b8-1bc9fd0d4663-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] python3-rdflib: upgrading to 7.6.0 SUCCEE=
DED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [60%]

48. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ee=
4f4-beb714ed-883c-433e-a890-db8952300533-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] python3-trove-classifiers: upgrading to 2=
026.1.14.14 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [58%]

49. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ed=
d0d-c84824a7-f959-4f88-ba0f-6ee99b384e06-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] python3-pycparser: upgrading to 3.0 SUCCE=
EDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [52%]

50. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ed=
bdf-8b775dee-95ce-4959-b25d-0036f159e806-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] python3-pip: upgrading to 26.0.1 SUCCEEDE=
D</a></b>
    - by auh @ 2026-02-18 18:41 UTC [27%]

51. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ed=
e90-4a44d733-8ffb-40a2-876c-a9f925ab73e9-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] python3-poetry-core: upgrading to 2.3.1 S=
UCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [18%]

52. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ee=
748-45965cc5-3c70-4c94-adbe-01a1c9e65852-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] python3-uv-build: upgrading to 0.10.4 SUC=
CEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [13%]

53. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ed=
e9c-79777fa3-222b-491b-b353-f1dffbdc4e95-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] python3-maturin: upgrading to 1.12.2 SUCC=
EEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [10%]

54. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ee=
6c6-e45fb965-bd06-42ab-8623-4f7aa90bb139-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] python3-setuptools: upgrading to 82.0.0 S=
UCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [8%]

55. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ea=
d92-1bd0d0ba-9fff-4d9f-8682-fd339a3c6cfb-000000@us-west-2.amazonses.com/"=
 moz-do-not-send=3D"true">[AUH] glib-2.0-initial,glib-2.0: upgrading to 2=
.86.4,2.86.4 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [15%]</pre>
      <p><br>
      </p>
      <p><br>
      </p>
      <p><br>
      </p>
      <p><br>
      </p>
      <p>2)</p>
      <p><br>
      </p>
      <p>From the Yocto Status email:<br>
      </p>
      <pre wrap=3D"" class=3D"moz-quote-pre">- YP 6.0 M3 Build Date 2026-=
03-09
- YP 6.0 M3 Release Date 2026-03-20
- YP 6.0 M4 Build Date 2026-03-30
- YP 6.0 M4 Release Date 2026-04-26</pre>
      <p><br>
      </p>
      <blockquote type=3D"cite" cite=3D"mid:TYWPR01MB118617E05B1321306A4E=
BAE85DC73A@TYWPR01MB11861.jpnprd01.prod.outlook.com">
        <div class=3D"WordSection1">
          <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:=
10.5pt;font-family:=E7=AD=89=E7=BA=BF"><o:p></o:p></span></p>
          <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:=
10.5pt;font-family:=E7=AD=89=E7=BA=BF"><o:p>&nbsp;</o:p></span></p>
          <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:=
10.5pt;font-family:=E7=AD=89=E7=BA=BF"><o:p>&nbsp;</o:p></span></p>
          <div>
            <p class=3D"MsoNormal" style=3D"text-align:justify;text-justi=
fy:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">&nbsp;--<o:=
p></o:p></span></p>
            <p class=3D"MsoNormal" style=3D"text-align:justify;text-justi=
fy:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">Best
                Regards<o:p></o:p></span></p>
            <p class=3D"MsoNormal" style=3D"text-align:justify;text-justi=
fy:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">-----------=
----------------------------------------<o:p></o:p></span></p>
            <p class=3D"MsoNormal" style=3D"text-align:justify;text-justi=
fy:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">Wang
                Mingyu<o:p></o:p></span></p>
            <p class=3D"MsoNormal" style=3D"text-align:justify;text-justi=
fy:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">FUJITSU
                NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)<o:p></o:p></=
span></p>
            <p class=3D"MsoNormal" style=3D"text-align:justify;text-justi=
fy:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">No.6
                Wenzhu Road, Nanjing, 210012, China<o:p></o:p></span></p>
            <p class=3D"MsoNormal" style=3D"text-align:justify;text-justi=
fy:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">TEL</span><=
span style=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;;mso-liga=
tures:standardcontextual">=EF=BC=9A<span lang=3D"EN-US">+86+25-86630566--=
8568<o:p></o:p></span></span></p>
            <p class=3D"MsoNormal" style=3D"text-align:justify;text-justi=
fy:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">COINS:
                79988548<o:p></o:p></span></p>
            <p class=3D"MsoNormal" style=3D"text-align:justify;text-justi=
fy:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">FAX:
                +86+25-83317685<o:p></o:p></span></p>
            <p class=3D"MsoNormal" style=3D"text-align:justify;text-justi=
fy:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">MAIL:
                <a href=3D"mailto:wangmy@fujitsu.com" moz-do-not-send=3D"=
true"><span style=3D"color:#0563C1">wangmy@fujitsu.com</span></a><o:p></o=
:p></span></p>
          </div>
          <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:=
10.5pt;font-family:=E7=AD=89=E7=BA=BF"><o:p>&nbsp;</o:p></span></p>
          <div style=3D"border:none;border-left:solid blue 1.5pt;padding:=
0cm 0cm 0cm 4.0pt">
            <div>
              <div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;pa=
dding:3.0pt 0cm 0cm 0cm">
                <p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"f=
ont-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">From:</span><=
/b><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calib=
ri&quot;,sans-serif">
                    Randy MacLeod <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:randy.macleod@windriver.com" moz-do-not-send=3D"true">&lt;rand=
y.macleod@windriver.com&gt;</a>
                    <br>
                    <b>Sent:</b> Thursday, February 26, 2026 10:26 PM<br>
                    <b>To:</b> Wang, Mingyu/</span><span style=3D"font-si=
ze:11.0pt">=E7=8E=8B</span><span style=3D"font-size:11.0pt;font-family:&q=
uot;Calibri&quot;,sans-serif"> </span><span style=3D"font-size:11.0pt">=E9=
=B8=A3=E7=91=9C</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font=
-family:&quot;Calibri&quot;,sans-serif"> <a class=3D"moz-txt-link-rfc2396=
E" href=3D"mailto:wangmy@fujitsu.com" moz-do-not-send=3D"true">&lt;wangmy=
@fujitsu.com&gt;</a>;
                    Alexander Kanavin <a class=3D"moz-txt-link-rfc2396E" =
href=3D"mailto:alex.kanavin@gmail.com" moz-do-not-send=3D"true">&lt;alex.=
kanavin@gmail.com&gt;</a><br>
                    <b>Cc:</b> <a class=3D"moz-txt-link-abbreviated moz-t=
xt-link-freetext" href=3D"mailto:openembedded-core@lists.openembedded.org=
" moz-do-not-send=3D"true">openembedded-core@lists.openembedded.org</a>;
                    Jia, Hongxu <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:Hongxu.Jia@windriver.com" moz-do-not-send=3D"true">&lt;Hongxu.Jia=
@windriver.com&gt;</a><br>
                    <b>Subject:</b> Re: [OE-core] [AUH] python3-rdflib:
                    upgrading to 7.6.0 SUCCEEDED<o:p></o:p></span></p>
              </div>
            </div>
            <p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p>=
</span></p>
            <div>
              <p class=3D"MsoNormal"><span lang=3D"EN-US">On 2026-02-25
                  10:14 p.m., Mingyu Wang (Fujitsu) wrote:<o:p></o:p></sp=
an></p>
            </div>
            <blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
              <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-s=
ize:10.5pt;font-family:=E7=AD=89=E7=BA=BF">I've also been
                  on vacation since 2.18 and just returned to work. I'll
                  handle the python3-rdflib upgrade.</span><span lang=3D"=
EN-US"><o:p></o:p></span></p>
            </blockquote>
            <p><span lang=3D"EN-US">Thanks Wangmy and I hope you had a
                good vacation.<o:p></o:p></span></p>
            <p style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US">The
                bigger question is the &gt; 50 packages that AUH managed
                to upgrade.<br>
                <br>
                Will you also do most of them or would you like to split
                this list with Hongxu/Qi/ etc?<br>
                If you want to split it, please reply with the packages
                you will do.<o:p></o:p></span></p>
            <p><span lang=3D"EN-US">Thanks,<o:p></o:p></span></p>
            <p><span lang=3D"EN-US">../Randy<o:p></o:p></span></p>
            <blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
              <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-s=
ize:10.5pt;font-family:=E7=AD=89=E7=BA=BF">&nbsp;</span><span lang=3D"EN-=
US"><o:p></o:p></span></p>
              <div>
                <p class=3D"MsoNormal" style=3D"text-align:justify;text-j=
ustify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;fo=
nt-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">&nbsp;-=
-</span><span lang=3D"EN-US"><o:p></o:p></span></p>
                <p class=3D"MsoNormal" style=3D"text-align:justify;text-j=
ustify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;fo=
nt-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">Best
                    Regards</span><span lang=3D"EN-US"><o:p></o:p></span>=
</p>
                <p class=3D"MsoNormal" style=3D"text-align:justify;text-j=
ustify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;fo=
nt-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">-------=
--------------------------------------------</span><span lang=3D"EN-US"><=
o:p></o:p></span></p>
                <p class=3D"MsoNormal" style=3D"text-align:justify;text-j=
ustify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;fo=
nt-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">Wang
                    Mingyu</span><span lang=3D"EN-US"><o:p></o:p></span><=
/p>
                <p class=3D"MsoNormal" style=3D"text-align:justify;text-j=
ustify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;fo=
nt-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">FUJITSU
                    NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)</span><s=
pan lang=3D"EN-US"><o:p></o:p></span></p>
                <p class=3D"MsoNormal" style=3D"text-align:justify;text-j=
ustify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;fo=
nt-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">No.6
                    Wenzhu Road, Nanjing, 210012, China</span><span lang=3D=
"EN-US"><o:p></o:p></span></p>
                <p class=3D"MsoNormal" style=3D"text-align:justify;text-j=
ustify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;fo=
nt-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">TEL</sp=
an><span style=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;;mso-=
ligatures:standardcontextual">=EF=BC=9A<span lang=3D"EN-US">+86+25-866305=
66--8568</span></span><span lang=3D"EN-US"><o:p></o:p></span></p>
                <p class=3D"MsoNormal" style=3D"text-align:justify;text-j=
ustify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;fo=
nt-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">COINS:
                    79988548</span><span lang=3D"EN-US"><o:p></o:p></span=
></p>
                <p class=3D"MsoNormal" style=3D"text-align:justify;text-j=
ustify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;fo=
nt-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">FAX:
                    +86+25-83317685</span><span lang=3D"EN-US"><o:p></o:p=
></span></p>
                <p class=3D"MsoNormal" style=3D"text-align:justify;text-j=
ustify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;fo=
nt-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">MAIL:
                    <a href=3D"mailto:wangmy@fujitsu.com" moz-do-not-send=
=3D"true"><span style=3D"color:#0563C1">wangmy@fujitsu.com</span></a></sp=
an><span lang=3D"EN-US"><o:p></o:p></span></p>
              </div>
              <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-s=
ize:10.5pt;font-family:=E7=AD=89=E7=BA=BF">&nbsp;</span><span lang=3D"EN-=
US"><o:p></o:p></span></p>
              <div style=3D"border:none;border-left:solid blue 1.5pt;padd=
ing:0cm 0cm 0cm 4.0pt">
                <div>
                  <div style=3D"border:none;border-top:solid #E1E1E1 1.0p=
t;padding:3.0pt 0cm 0cm 0cm">
                    <p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D=
"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">From:</span=
></b><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Cal=
ibri&quot;,sans-serif">
                        Randy MacLeod <a href=3D"mailto:randy.macleod@win=
driver.com" moz-do-not-send=3D"true">&lt;randy.macleod@windriver.com&gt;<=
/a>
                        <br>
                        <b>Sent:</b> Wednesday, February 25, 2026 12:42
                        AM<br>
                        <b>To:</b> Wang, Mingyu/</span><span style=3D"fon=
t-size:11.0pt">=E7=8E=8B</span><span style=3D"font-size:11.0pt;font-famil=
y:&quot;Calibri&quot;,sans-serif"> </span><span style=3D"font-size:11.0pt=
">=E9=B8=A3=E7=91=9C</span><span style=3D"font-size:11.0pt;font-family:&q=
uot;Calibri&quot;,sans-serif"> <span lang=3D"EN-US"><a href=3D"mailto:wan=
gmy@fujitsu.com" moz-do-not-send=3D"true">&lt;wangmy@fujitsu.com&gt;</a>;
                          Alexander Kanavin <a href=3D"mailto:alex.kanavi=
n@gmail.com" moz-do-not-send=3D"true">&lt;alex.kanavin@gmail.com&gt;</a><=
br>
                          <b>Cc:</b> <a href=3D"mailto:openembedded-core@=
lists.openembedded.org" moz-do-not-send=3D"true" class=3D"moz-txt-link-fr=
eetext">openembedded-core@lists.openembedded.org</a>;
                          Jia, Hongxu <a href=3D"mailto:Hongxu.Jia@windri=
ver.com" moz-do-not-send=3D"true">&lt;Hongxu.Jia@windriver.com&gt;</a><br=
>
                          <b>Subject:</b> Re: [OE-core] [AUH]
                          python3-rdflib: upgrading to 7.6.0 SUCCEEDED</s=
pan></span><span lang=3D"EN-US"><o:p></o:p></span></p>
                  </div>
                </div>
                <p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></=
o:p></span></p>
                <div>
                  <p class=3D"MsoNormal"><span lang=3D"EN-US">Hello Wang,
                      and everyone,<o:p></o:p></span></p>
                </div>
                <div>
                  <p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p>=
</o:p></span></p>
                </div>
                <div>
                  <p class=3D"MsoNormal"><span lang=3D"EN-US">Alex mentio=
ned
                      in the YP tech call today that he's on vacation
                      starting tomorrow, iirc.<o:p></o:p></span></p>
                </div>
                <div>
                  <p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p>=
</o:p></span></p>
                </div>
                <div>
                  <p class=3D"MsoNormal"><span lang=3D"EN-US">Alex,&nbsp;=
<br>
                      &nbsp; &nbsp; I assume that you won't be sending a =
patch
                      series for the succeeding AUH upgrades.<br>
                      <br>
                      Wang,&nbsp;<br>
                      &nbsp; &nbsp;Have you or do you plan to work on tha=
t?<br>
                      <br>
                      If not, Hongxu and maybe others at WR will work on
                      that.<br>
                      I'm going to focus on the failed AUH upgrade set
                      of recipes.<o:p></o:p></span></p>
                </div>
                <div>
                  <p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p>=
</o:p></span></p>
                </div>
                <div>
                  <p class=3D"MsoNormal"><span lang=3D"EN-US">../Randy<o:=
p></o:p></span></p>
                </div>
                <div>
                  <p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p>=
</o:p></span></p>
                </div>
                <div>
                  <p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p>=
</o:p></span></p>
                </div>
                <div>
                  <p class=3D"MsoNormal"><span lang=3D"EN-US">On 2026-02-=
18
                      1:41 p.m., Auto Upgrade Helper via <a href=3D"https=
://urldefense.com/v3/__http:/lists.openembedded.org__;!!AjveYdw8EvQ!cC2Wy=
ezAalR6UZOZ07BsaBry1ZouLbKpeZ9nmC_s0Z9sWMH3AU12RFCRUC7BKKlhQzHFJRMeHgUCGu=
PSquz_VA$" moz-do-not-send=3D"true"> lists.openembedded.org</a>
                      wrote:<o:p></o:p></span></p>
                </div>
                <blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt=
">
                  <pre>Hello,</pre>
                  <pre>&nbsp;</pre>
                  <pre>this email is a notification from the Auto Upgrade=
 Helper</pre>
                  <pre>that the automatic attempt to upgrade the recipe(s=
) *python3-rdflib* to *7.6.0* has Succeeded.</pre>
                  <pre>&nbsp;</pre>
                  <pre>Next steps:</pre>
                  <pre>&nbsp;&nbsp;&nbsp; - apply the patch: git am 0001-=
python3-rdflib-upgrade-7.5.0-7.6.0.patch</pre>
                  <pre>&nbsp;&nbsp;&nbsp; - check the changes to upstream=
 patches and summarize them in the commit message,</pre>
                  <pre>&nbsp;&nbsp;&nbsp; - compile an image that contain=
s the package</pre>
                  <pre>&nbsp;&nbsp;&nbsp; - perform some basic sanity tes=
ts</pre>
                  <pre>&nbsp;&nbsp;&nbsp; - amend the patch and sign it o=
ff: git commit -s --reset-author --amend</pre>
                  <pre>&nbsp;&nbsp;&nbsp; - send it to the appropriate ma=
iling list</pre>
                  <pre>&nbsp;</pre>
                  <pre>Alternatively, if you believe the recipe should no=
t be upgraded at this time,</pre>
                  <pre>you can fill RECIPE_NO_UPDATE_REASON in respective=
 recipe file so that</pre>
                  <pre>automatic upgrades would no longer be attempted.</=
pre>
                  <pre>&nbsp;</pre>
                  <pre>Please review the attached files for further infor=
mation and build/update failures.</pre>
                  <pre>Any problem please file a bug at <a class=3D"moz-t=
xt-link-freetext" href=3D"https://bugzilla.yoctoproject.org/enter_bug.cgi=
?product=3DAutomated%20Update%20Handler" moz-do-not-send=3D"true">https:/=
/bugzilla.yoctoproject.org/enter_bug.cgi?product=3DAutomated%20Update%20H=
andler</a></pre>
                  <pre>&nbsp;</pre>
                  <pre>Regards,</pre>
                  <pre>The Upgrade Helper</pre>
                  <pre>&nbsp;</pre>
                  <pre>-- &gt;8 --</pre>
                  <pre>From 6a230684782cbe47a4f0e5fe6c2268da57091fea Mon =
Sep 17 00:00:00 2001</pre>
                  <pre>From: Upgrade Helper <a class=3D"moz-txt-link-rfc2=
396E" href=3D"mailto:auh@yoctoproject.org" moz-do-not-send=3D"true">&lt;a=
uh@yoctoproject.org&gt;</a></pre>
                  <pre>Date: Wed, 18 Feb 2026 13:46:27 +0000</pre>
                  <pre>Subject: [PATCH] python3-rdflib: upgrade 7.5.0 -&g=
t; 7.6.0</pre>
                  <pre>&nbsp;</pre>
                  <pre>---</pre>
                  <pre> ...dflib_7.5.0.bb =3D&gt; python3-rdflib_7.6.0.bb=
} | 25 +++++++++++++++++--</pre>
                  <pre> 1 file changed, 23 insertions(+), 2 deletions(-)<=
/pre>
                  <pre> rename meta/recipes-devtools/python/{python3-rdfl=
ib_7.5.0.bb =3D&gt; python3-rdflib_7.6.0.bb} (34%)</pre>
                  <pre>&nbsp;</pre>
                  <pre>diff --git a/meta/recipes-devtools/python/python3-=
rdflib_7.5.0.bb b/meta/recipes-devtools/python/python3-rdflib_7.6.0.bb</p=
re>
                  <pre>similarity index 34%</pre>
                  <pre>rename from meta/recipes-devtools/python/python3-r=
dflib_7.5.0.bb</pre>
                  <pre>rename to meta/recipes-devtools/python/python3-rdf=
lib_7.6.0.bb</pre>
                  <pre>index e421aa2bac..1b830e8aa9 100644</pre>
                  <pre>--- a/meta/recipes-devtools/python/python3-rdflib_=
7.5.0.bb</pre>
                  <pre>+++ b/meta/recipes-devtools/python/python3-rdflib_=
7.6.0.bb</pre>
                  <pre>@@ -1,10 +1,31 @@</pre>
                  <pre>+# FIXME: the LIC_FILES_CHKSUM values have been up=
dated by 'devtool upgrade'.</pre>
                  <pre>+# The following is the difference between the old=
 and the new license text.</pre>
                  <pre>+# Please update the LICENSE value if needed, and =
summarize the changes in</pre>
                  <pre>+# the commit message via 'License-Update:' tag.</=
pre>
                  <pre>+# (example: 'License-Update: copyright years upda=
ted.')</pre>
                  <pre>+#</pre>
                  <pre>+# The changes:</pre>
                  <pre>+#</pre>
                  <pre>+# --- LICENSE</pre>
                  <pre>+# +++ LICENSE</pre>
                  <pre>+# @@ -1,6 +1,6 @@</pre>
                  <pre>+#&nbsp; BSD 3-Clause License</pre>
                  <pre>+#&nbsp; </pre>
                  <pre>+# -Copyright (c) 2002-2025, RDFLib Team</pre>
                  <pre>+# +Copyright (c) 2002-2026, RDFLib Team</pre>
                  <pre>+#&nbsp; All rights reserved.</pre>
                  <pre>+#&nbsp; </pre>
                  <pre>+#&nbsp; Redistribution and use in source and bina=
ry forms, with or without</pre>
                  <pre>+# </pre>
                  <pre>+#</pre>
                  <pre>+</pre>
                  <pre> SUMMARY =3D &quot;RDFLib is a pure Python package=
 for working with RDF&quot;</pre>
                  <pre> HOMEPAGE =3D <a class=3D"moz-txt-link-rfc2396E" h=
ref=3D"https://github.com/RDFLib/rdflib" moz-do-not-send=3D"true">&quot;h=
ttps://github.com/RDFLib/rdflib&quot;</a></pre>
                  <pre> SECTION =3D &quot;devel/python&quot;</pre>
                  <pre> LICENSE =3D &quot;BSD-3-Clause&quot;</pre>
                  <pre>-LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc=
2396E" href=3D"file://LICENSE;md5=3D7006e973486c4700556f6d58cba0ab6c" moz=
-do-not-send=3D"true">&quot;file://LICENSE;md5=3D7006e973486c4700556f6d58=
cba0ab6c&quot;</a></pre>
                  <pre>+LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc=
2396E" href=3D"file://LICENSE;md5=3D0ac0171cee5250c44d7d49847ae53a3e" moz=
-do-not-send=3D"true">&quot;file://LICENSE;md5=3D0ac0171cee5250c44d7d4984=
7ae53a3e&quot;</a></pre>
                  <pre> </pre>
                  <pre>-SRC_URI[sha256sum] =3D &quot;663083443908b1830e56=
7350d72e74d9948b310f827966358d76eebdc92bf592&quot;</pre>
                  <pre>+SRC_URI[sha256sum] =3D &quot;6c831288d5e4a5a7ece8=
5d0ccde9877d512a3d0f02d7c06455d00d6d0ea379df&quot;</pre>
                  <pre> </pre>
                  <pre>&nbsp;inherit pypi python_poetry_core</pre>
                  <pre> </pre>
                  <p class=3D"MsoNormal"><span lang=3D"EN-US"><br>
                      <br>
                      <br>
                      <o:p></o:p></span></p>
                  <pre>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</pre=
>
                  <pre>Links: You receive all messages sent to this group=
.</pre>
                  <pre>View/Reply Online (#231360): <a class=3D"moz-txt-l=
ink-freetext" href=3D"https://lists.openembedded.org/g/openembedded-core/=
message/231360" moz-do-not-send=3D"true">https://lists.openembedded.org/g=
/openembedded-core/message/231360</a></pre>
                  <pre>Mute This Topic: <a class=3D"moz-txt-link-freetext=
" href=3D"https://lists.openembedded.org/mt/117879875/3616765" moz-do-not=
-send=3D"true">https://lists.openembedded.org/mt/117879875/3616765</a></p=
re>
                  <pre>Group Owner: <a class=3D"moz-txt-link-abbreviated =
moz-txt-link-freetext" href=3D"mailto:openembedded-core+owner@lists.opene=
mbedded.org" moz-do-not-send=3D"true">openembedded-core+owner@lists.opene=
mbedded.org</a></pre>
                  <pre>Unsubscribe: <a class=3D"moz-txt-link-freetext" hr=
ef=3D"https://lists.openembedded.org/g/openembedded-core/unsub" moz-do-no=
t-send=3D"true">https://lists.openembedded.org/g/openembedded-core/unsub<=
/a> [<a class=3D"moz-txt-link-abbreviated moz-txt-link-freetext" href=3D"=
mailto:randy.macleod@windriver.com" moz-do-not-send=3D"true">randy.macleo=
d@windriver.com</a>]</pre>
                  <pre>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</pre=
>
                  <pre>&nbsp;</pre>
                </blockquote>
                <p><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
                <pre>-- </pre>
                <pre># Randy MacLeod</pre>
                <pre># Wind River Linux</pre>
              </div>
            </blockquote>
            <p><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
            <pre>-- </pre>
            <pre># Randy MacLeod</pre>
            <pre># Wind River Linux</pre>
          </div>
        </div>
      </blockquote>
      <p><br>
      </p>
      <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------C8aSPodU5nw0HXokLxjhJFCL--

