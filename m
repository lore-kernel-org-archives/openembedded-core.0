Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54271D75BAB
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 04:05:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3400.1732161892819184425
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 20:04:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=105597799c=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL3OwnM005294
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 20:04:52 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xusq4w88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 20:04:52 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AL44pc0030415;
	Wed, 20 Nov 2024 20:04:51 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xusq4w85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 20:04:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Khw379u78UpwfNILJGGMeKPZhxeR8/dm3Np4qCm4rx2MzoHI73d+Hy9QSFJi0TlHGVUasUuz+tPQxuNhr0Z6D6F2cxl1YUX2cLKEHsHNPIq0FbLD8eGsHlvqLhqCjyRZFj3edf/YPHjboYVS5BL19Pz1riS/yRQn9GdyqlwKCrNh3SgOQGd92p35ocS6iYzCAuZAo76Jwg6KkNC91RC3wZQ8JnTKfaN3Fiux3gPDSGQVO4Q6O4bQ6orEJgblzH6ICqgOA5oIoPdvnNJ6CPqf7OJr4nu3CwUEgq5Vx1r6lQE12Ut9arh0NntPu/iCaDZAJHY8Uzu3WLqhUzyE0hdXKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsjiCFniqyJzmLvKDIjIlhw8zZSCVDP3cE1cCRcZOyA=;
 b=Ct9SIGB8/cEdOYxQNtmnjzdEfkaXKWw5waFn0Z2Ge8hwl+7zT1XBt/a16Z51BInSCdF+PG1JD8mV67KuwZetGY+cWNJcusYN9Ymm2VfCitBGRL9rz9JNGfVA4EvVKo/ImBh4bWbz6Uh1rIGEwTXDye5XTdyp8WAF89RLAAn96HsllheXj6bVI4hxglmpRerdT47MmH4msafhChy928tnfPVDIJizqcrT3I3MCAQEthwZIOu4QRtK2jOTJw8r2P7uV764iR7zV8YIAZl45moQA2IhudZNcrP5SwIOSlfiZfZt89fHX6Jt3PnpDxjjA8+nlElifV7s+fdI8zV1YToUFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DM6PR11MB4673.namprd11.prod.outlook.com (2603:10b6:5:2a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Thu, 21 Nov
 2024 04:04:49 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%7]) with mapi id 15.20.8093.018; Thu, 21 Nov 2024
 04:04:49 +0000
Content-Type: multipart/alternative;
 boundary="------------hMEDgYu9C4gCl2K7cRg0tVAd"
Message-ID: <f715fbb4-bcea-4ac6-b460-0d99d0603794@windriver.com>
Date: Thu, 21 Nov 2024 12:04:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rxvt-unicode.inc: disable the terminfo
 installation by setting TIC to :
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20241105101214.4095063-1-changqing.li@windriver.com>
 <B3814EDD-D5B5-423E-AD39-BC71478CBAF7@arm.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <B3814EDD-D5B5-423E-AD39-BC71478CBAF7@arm.com>
X-ClientProxiedBy: TYAPR01CA0062.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::26) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DM6PR11MB4673:EE_
X-MS-Office365-Filtering-Correlation-Id: b1b812d8-24a1-4434-754e-08dd09e1a46d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VS9jdVhVVDVYTVZLZFNhaXQ5U2NDYU9peUIvL015S1RmN3loSmxiV0FiR3dr?=
 =?utf-8?B?VWtjSW9Pc25BUm40YVZRS0VzK0NoQUJsMFpNdWdQNDl5WkxZRHFsTzgxR3hR?=
 =?utf-8?B?d0FKNzdlRVFnZitiZGUrTFdNUyszeVFHVkJ0bS91ZTF5TFd6cHRPS0EyeWkv?=
 =?utf-8?B?NGdQZWJjQ2RPVkhzUjlhZTV3dFVseThyaTBFS0NyVW51Q2xPV0pBeURoMjM3?=
 =?utf-8?B?cUY0RE5RTVNrWGFEa1BxYkdudmRxbURZaWErOUJuM1F3VGo0OExSU0pUS3VU?=
 =?utf-8?B?WHlLbFpzL2Q3Q1dhVFdFOXo0Rkd6Z1NkOWxBSWZ0NTdhWWh4NkpIU0pIa1Jw?=
 =?utf-8?B?S05uYkUwbWhjdEtVUHJWQ3RyUmtLNllpOXFic3M1N2dJa1VPWmxSTWZSWndS?=
 =?utf-8?B?SmxUb1VSdU02M0Y3MDg4NHJFL2dpVGdIVTNoYnJBUFliOHZ4TDl6c2h3dUQ5?=
 =?utf-8?B?VUlYTGp1aUdXb2hqMHdIa1BDd3Joc0IzT0h6Y2RwVEZOcXdQRUF5eVd5VnRJ?=
 =?utf-8?B?RkRFNDFLMW1SSEFjRlFLNnVJZDJHN2VaTW9DbWErUW1pS3hQM29FMmR1ZXJ2?=
 =?utf-8?B?SHFYOWVUdnA0cVRiTFE5bFJ2ckQ2Z05tWUN6bkNwc2Z6Sk9xWFZKY21JTml1?=
 =?utf-8?B?SjJKME1wOHRLRHg2aTViVDF4WlBtNkkzcUFLUzQ2ZDVwejhFN1p3a09WY1Z1?=
 =?utf-8?B?dGhNZUljUlNqQ0ltWmFwbDljek8rL3FBTTI3VnpyeXdZcDJJb0xGeG5QTDlp?=
 =?utf-8?B?NklqNlBXWk90SDQ1bEo1SmJKbi9vWS95RElDeFl1bVNxdmZpaHppeXNoc0tR?=
 =?utf-8?B?ODh3OGh1cThiQTBCaHBQSkRGdE42c3FDRjJkWGVYSHMyNHo2WVpSZjJYdC9I?=
 =?utf-8?B?MDdnTUhuZkc3aVZoQVlnaFlpYlk5a0lhSXJsRUIwSnNGcDZTSGwzUGNocHZk?=
 =?utf-8?B?V204RDFnMGJLQWdnRVB5N1dCNk9xUXl6UzNDVEtmWFlqdTRUNjZCWTk0eUo1?=
 =?utf-8?B?b0FaM1F5QUYwejNHZng0RjFHeXRvUEZmME55MmRjcUQ3ejc2NndYMFNnTkFo?=
 =?utf-8?B?ZEhRWU13dHF6eUJVTlhLS1FkYmYrNW1JUTVBTTMzQXRzb2xhZTNHalVDZ0RK?=
 =?utf-8?B?VU1mMCtlaE1rR0dIU1JMellPdUtYRENPQjZoR1pVdFVwVGJnVGc5WG5OMHE5?=
 =?utf-8?B?eGMvSE1hZEJHSU9zc2t3TGZuQk4yN0FCQUcxNWgzb1dYanpGWGl1aERZNDJz?=
 =?utf-8?B?cVVkbWF0aERaRVdCOWpHWFI0REw0QnFKbmVaR0R3SnpoZUpNdkMxeENDRWNV?=
 =?utf-8?B?bjdBeTB0YkErOW9jTGxuUW1SQzFWTmlpeDF4VTNNRlpxR2lPTDNhbDV4NVFP?=
 =?utf-8?B?UXJCTUJCSStzZis0UEkvSGtyN1BMalBHRWMwdVlYbklDdU5BZGQ4V3BzL3F2?=
 =?utf-8?B?RGpTUGwxRHQwNjNwSm5vMlU2WjlodTluRlFSK2lVSWk4SXJPSG9hV0srZ09y?=
 =?utf-8?B?V0F4Zkg0OUU1V28rMGJhNjkvc1Fzblk3Zm82bElmUVVVZzFNbXZxNkx6QUVt?=
 =?utf-8?B?TVRFSmZFaVo4OTlMa0dVeW1HT2FjRlJ1aUlyQmJtVnV1NDlKUDdLdnBUV0hD?=
 =?utf-8?B?enorUFV3d21WNmVOd1VsMjZTUk12SmhiYWRJVEhJeFZIZXVwNVVMTkIrQVVp?=
 =?utf-8?B?eFk3b2VFQmg2MjlrVVRRdXJEQTYxR1o4amI2VnVhU1h1T3dldXNUeGtTOEd5?=
 =?utf-8?Q?w6b0SG+GMKiHk2LVRxNvWmry2icS8s16iq2TlYW?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L3NoWDB2a0JQd25ZYWYzTUdjRE9MTEhHcDNPU21iMG1Zck8rS1dzZTlkYXZj?=
 =?utf-8?B?OGY2ZmNiYi9VTXpici9ubEFGNXkrRlhhVTY5cXltK3hLTEdqVXRQK25nbEFR?=
 =?utf-8?B?MHVTeEZsRE82L0hEOXhNUlRRT05Ed2crSlZMaFE5OTlDY3dLTi9wWk1wNEVI?=
 =?utf-8?B?dnZJWnNuVEVoaGFLaTVMejlMZTM2b3NZTEZKNGNLUEVyc0hTWE1rU2cySzAv?=
 =?utf-8?B?R2VYOVVjSmNyRFREYlZQRHpTOU1YbDVpSXFIUGUxVERIMEtrYmpEZGFmQ0hx?=
 =?utf-8?B?UitEdDNRZERGMWZXaUtUS0xUdHpPTTZVUlhrWU1KWVNWbDJOTmpJTGpxS2ZP?=
 =?utf-8?B?OFBxV241c3BrYWhvbTh1VGthL1RJRVVBMGlpS1dReldTR0dyR2E5T1p6Rm1H?=
 =?utf-8?B?b0JTbVZCK3hHMGIzTGJnbzJNYkF0b3B1b2F5RVg4dXlXZnNiR0dzdlB4ZUsx?=
 =?utf-8?B?a1k5ZFdxWWRVZnJhcDBCcHVROFYyOWNNRHc3dkFuRlBTdjdha1NmQ0xiczRo?=
 =?utf-8?B?TVJQcGFWT1RMWEZ5cU4zWG5EbXltcm84UmhlMFNTdlpNb1dqMHQrTW94VytJ?=
 =?utf-8?B?OGhIWWRmRzBtSEFtQk10ZnErb0lvVGFrTnkxVFlyaFR2ajNQbGQvWG5TZXFQ?=
 =?utf-8?B?eXA3VWkwd1lyZWUrVE51dEdVZkZUYTdHSndsdVd0SzlydFUwRmtBMVc1a3JD?=
 =?utf-8?B?OUt2TWovdWN4Z1hEWDdwbEtyVUJ0MEtsS3lVdXdtTlNMSXMxOTZlcnNkdnYx?=
 =?utf-8?B?M1BvaGphZ1hiV1hleW1PdTR2YlgzODRISHg1bkxTUW9pcHpWRHV1Tk01UW1y?=
 =?utf-8?B?ajcxMm5IbmJrVVBJMkwzd0RXUHZTbjBVRTdhKzNhQ2pEeHd5RlduaUc4dWkv?=
 =?utf-8?B?bkVRZGpDVzlEMkNzZ3UvWTNEckNMdU9qQlFhZWxjQ3pyeWFQd0lBQ0dydEJT?=
 =?utf-8?B?NXgvUUJtWTI2a1lIcE1ZMDA1UnFvS3F0RnVLWUQ2WUhOODIvVFBPMlVGd2dF?=
 =?utf-8?B?MjRDZmxDc0NKZ3RybkJMeEdDcU5mSnRJcFBnMWlFSUhQTEdpa2k0Lythcm1p?=
 =?utf-8?B?V1N5WWxDNVJEay9XNmFlUXh2UFJSN3BtNWFld0FxYkJPbUZRU3BZZUtEaEQ2?=
 =?utf-8?B?VzdKcmNFcUNiaHZFQmFiaHQ1WWdNLzdUa1hZaHBPVzA2TGJRL3VBdzVPOXpU?=
 =?utf-8?B?U3N0WHExNUNFYzRqdEcvbXZHSFVUQWliRHZEMlNjMGNLUzRWL2pCM0xXVkhY?=
 =?utf-8?B?SUdwWEdQZGM3eCtnUXBIZ2VTWXZ3WmlBLzlWZDVRbERzbVNMS1h6dWxORTlF?=
 =?utf-8?B?LytjL3hBZUk5WERaamNZeDRUb3dEbU03SDlaMGJiRUhReFBuREx6ODlla0Vi?=
 =?utf-8?B?ZWNUZ0lSNU9mbHZ6dzMwL3o2NWw4WlEyQzVOamNCNG9CSkI0SS9EK1FwL2Yv?=
 =?utf-8?B?b0JwOUpKRUtZcENpTEVERzFRYm5hS2s5TFllRXpsa3QwaUhpYm4xSmNaazQy?=
 =?utf-8?B?SnVwTEJJVThvTjVsV3BkOTBRSy9URlJhTGJvd0VLZGdxK0E1MlRtYTBUdm5B?=
 =?utf-8?B?Z2tqRWN6SG5TRDZCVkE4Y0JNUWNLYzZoYnZueXFDaHgxTXAvVWs5eXl0bjFy?=
 =?utf-8?B?VUhoZE83eTZQd3NOL1NnbzVLVnQvZjBaVlpHY05iVXVWSmw1SUNBM1NWeHpG?=
 =?utf-8?B?Tk1rUDhTa25ndHZ5MUtxaHhMYTcwanh1d1kvOEtiakVhd2hQT3NaR1hzZWVm?=
 =?utf-8?B?TVhDYnlDL0I1Q0lqUUFiakppa0w1dGVxaWZBNmpDZzc2MUNPR0h4OGdMRk42?=
 =?utf-8?B?YXhMNlJ4Tzl0N2l4YlRuRlJDbHpwWUExME1LMVEyeEN1Z3NSM01SYlc1N1d0?=
 =?utf-8?B?Z2c5eFU1cGxUdFF6WnpmZnVmL1cwYmN0cTNZTC84aktYc1p6ZTc5MXpqbGJU?=
 =?utf-8?B?RmN3a00xS1FJaVVYYWNjSVpyQkM1SXZFRTFncU83Ti9JREJIbGJQTGZ0alMr?=
 =?utf-8?B?Rm9PakFtWFBOWUxGbEEyeDdNakNodVE3VFBlZm9LSzZVSlBoTEZsQ2wxUzVP?=
 =?utf-8?B?RU9sS0hlU3ZtS21DR21pWFRGeVQ3ZVNGKzlTNnNRVmIvWUdHb2c2dHN4Q2ZE?=
 =?utf-8?B?MXdzY29mK3RmSVBaajRqNEJtc0w5ckFnQmFSNldYazRWS24vd1NhWTFwOGVa?=
 =?utf-8?B?Mnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b812d8-24a1-4434-754e-08dd09e1a46d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 04:04:48.9784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jauVP9UWWTVQ7JCHbMFhSYMyk2OOJ+H0ta70lD/9Tta2AXLgU/FzM/cFptV2UDeYxck5QBIDqtixQXKa7lJuw19lNBw7ctMd5WRRT0eYodM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4673
X-Proofpoint-GUID: IGqEDBq-4ONSTzqEJ5bQAk2eCKt748h9
X-Proofpoint-ORIG-GUID: 3dGZJXXDL4HZ1MNi3JSOel1UeK4J26vy
X-Authority-Analysis: v=2.4 cv=d9mnygjE c=1 sm=1 tr=0 ts=673eb164 cx=c_pps a=19NZlzvm9lyiwlsJLkNFGw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=tSaX5HRWDUtA8DFbX9wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=7CQSdrXTAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9 a=VF_Ll7obKUu_xVR-:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-21_02,2024-11-20_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 mlxlogscore=882 spamscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411210029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 04:05:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207500

--------------hMEDgYu9C4gCl2K7cRg0tVAd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AL3OwnM005294


On 11/21/24 00:51, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 5 Nov 2024, at 10:12, Changqing Li via lists.openembedded.org<changq=
ing.li=3Dwindriver.com@lists.openembedded.org>  wrote:
>> --- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
>> +++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
>> @@ -37,6 +37,7 @@ do_configure:prepend () {
>> if [ ! -e ${S}/acinclude.m4 ]; then
>> cp ${S}/aclocal.m4 ${S}/acinclude.m4
>> fi
>> + sed -i -e 's#@TIC@#:#g' ${S}/doc/Makefile.in
>> }
> A brute-force sed feels ugly and prone to silent breakage.  Wouldn=E2=80=
=99t this work just as well:
>
> EXTRA_OEMAKE =3D =E2=80=9CTIC=3Dtrue=E2=80=9D

Hi, Ross

Thanks for advice.=C2=A0 But this @TIC@ cannot replaced by add configs li=
ke=20
EXTRA_OEMAKE.

TIC is defined in configure.ac by "AC_PATH_PROG(TIC, tic, :) ", so TIC=20
will be native tic path.

and during configure process, configure will replace @TIC@ in=20
doc/Makefile.in with native tic path.

So in do_install stage, the doc/Makefile already have a hardcode native=20
tic path, not variable $(TIC)

which could be replaced by pass argument. Seems no interface for us to=20
pass argument to change TIC.

Regards

Changqing

>
> Ross
--------------hMEDgYu9C4gCl2K7cRg0tVAd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AL3OwnM005294

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 11/21/24 00:51, Ross Burton wrote:<=
br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:B3814EDD-D5B5-423E-AD39-BC71478=
CBAF7@arm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On 5 Nov 2024, at 10:12, Changqing Li via lists.openembedded.org <a class=
=3D"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li=3Dwindriver.com@li=
sts.openembedded.org">&lt;changqing.li=3Dwindriver.com@lists.openembedded=
.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">--- a/meta/recipes-sato/rx=
vt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -37,6 +37,7 @@ do_configure:prepend () {
if [ ! -e ${S}/acinclude.m4 ]; then
cp ${S}/aclocal.m4 ${S}/acinclude.m4
fi
+ sed -i -e 's#@TIC@#:#g' ${S}/doc/Makefile.in
}
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
A brute-force sed feels ugly and prone to silent breakage.  Wouldn=E2=80=99=
t this work just as well:

EXTRA_OEMAKE =3D =E2=80=9CTIC=3Dtrue=E2=80=9D</pre>
    </blockquote>
    <p>Hi, Ross</p>
    <p>Thanks for advice.&nbsp; But this @TIC@ cannot replaced by add con=
figs
      like <span style=3D"white-space: pre-wrap">EXTRA_OEMAKE.</span></p>
    <p><span style=3D"white-space: pre-wrap">TIC is defined in configure.=
ac by &quot;</span>AC_PATH_PROG(TIC,
      tic, :)
      <span style=3D"white-space: pre-wrap">&quot;,  so TIC will be nativ=
e tic path.</span></p>
    <p><span style=3D"white-space: pre-wrap">and during configure process=
, configure will replace @TIC@ in  doc/Makefile.in with </span><span styl=
e=3D"white-space: pre-wrap">native tic path.</span></p>
    <p><span style=3D"white-space: pre-wrap">So in do_install stage, the =
</span><span style=3D"white-space: pre-wrap">doc/Makefile already have a =
hardcode native tic path,   not variable $(TIC)</span></p>
    <p><span style=3D"white-space: pre-wrap">which could be replaced by p=
ass argument.  Seems no interface for us to pass argument to change TIC.<=
/span></p>
    <p><span style=3D"white-space: pre-wrap">
</span></p>
    <p><span style=3D"white-space: pre-wrap">Regards</span></p>
    <p><span style=3D"white-space: pre-wrap">Changqing
</span></p>
    <blockquote type=3D"cite" cite=3D"mid:B3814EDD-D5B5-423E-AD39-BC71478=
CBAF7@arm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Ross
</pre>
    </blockquote>
  </body>
</html>

--------------hMEDgYu9C4gCl2K7cRg0tVAd--

