Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB600CF58D3
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 19:48:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16045.1763581701980875917
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 11:48:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=eGJpokHF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3418077aaa=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ97PVH2988320
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 19:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=T1VCPsZRNxW4tbeSUbR6sK
	IMOgHJ3cJq4pR81+l1vPo=; b=eGJpokHF9JFXMGLVoDyobfqXy1qBX9TCrA4OUi
	5H/MLteeljrDjicuApxzZcEssinFjSTeleuFNL7zxs5A+PQTl0n9s1efjaTbOcXh
	tL2HFRZD6kGU0gcO//9JqTHaofhyUlrzA/0ZLpWzzKuXqylmLp+O4R/jWei5+Cni
	/P0saWCrpkJmFy0jNBkIiC+y6KA4DyWSPV1U1Ph/d+Po2k8Th5Ed0g/UItwpqUE6
	eNYMtvdih1vEOY+zo4Fw/PA1j9TLzP209wzOfOxvyfdt1Lhhl198A2Vf+8CHzSiO
	yVeBzjBWNAGaE01ja+Q6NAXHPyhJHX16GoL4Av7W99rGW2Ow==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010067.outbound.protection.outlook.com [52.101.56.67])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ahayrrr3y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 19:48:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LP65KKi48AUttHLnPGc0jM+vS4vxBnJYNq7VJ0TYI76PevxK420VzvtReMHnPRGZ7txe7reuS2j3zOdPPjOeCWTLDYCPskqhm9lHoIpGO1+hT0jY+UA79GRctyPPixhkPHmFe5HHBdzIIqUMaGz0N7z5VywUC93nJR/QEat1ePQYJZ2nK/Nf8IhrlhlPN+dG5tgqTvAOdWNpFf48XEY7bxJcfhLMKhX6/ZDmm1sBcbxPmzDzxS71vwutAO97atnjKgEpxil4loYnWjQoJbB/KvZe8LkTgypEfSZkVgG/OCj2wl9kzZEgRizFG8265IObWdCzjWCYK1/K3GBGtnrMtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1VCPsZRNxW4tbeSUbR6sKIMOgHJ3cJq4pR81+l1vPo=;
 b=DJFNNK4r4v1VlC9RlHIgwD4LlgrIs+74w5pLaFi01u1moxD5/kw+STJ+HZHiOgbUd+NzWSuWlcqpwMwOi4V05112j8xqJ169UiCyU4nKAySKDuiu3MtNpf9d4vXxxo4QWKbK5yaJsZmfpReFd8ADi8/rZUFnX0i+dmPLsv0ZkUDLIOeRgYGrVw07EeOWirBxPmaZdbQOIFQ4Svgd2FT8TfPJL0uo9blF4dY38/NbiCeZIdFvscOJylXk4VRwpBNFPrJ325GnbBzS/tG7tM080MgvBCFWk2KM9syC1c9AH2o0G89ZrbhjlJMaN2LkFlxLTKTtkjq8MJ+lZjStfBUn1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by PH0PR11MB7470.namprd11.prod.outlook.com (2603:10b6:510:288::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 19:48:13 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 19:48:13 +0000
Content-Type: multipart/alternative;
 boundary="------------81tmWQwdzauCRYVKnLaitjVF"
Message-ID: <71685d1f-3b10-4a2b-bb9b-a2fa5e35ccda@windriver.com>
Date: Wed, 19 Nov 2025 14:48:07 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 02/11] linux-yocto: add clang-native,rust-native
 and bindgen-cli-native to DEPENDS
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, elmehdi.younes@smile.fr
References: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
 <20251119164804.256364-3-Harish.Sadineni@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20251119164804.256364-3-Harish.Sadineni@windriver.com>
X-ClientProxiedBy: FR4P281CA0351.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::14) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|PH0PR11MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: f20cf378-7668-4166-2eb5-08de27a49325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N2c5NzEvd0ZOaFIvTk11OXVVTXhFRTFidnpaWVBIOGplVjRpKytFOWNPNkg2?=
 =?utf-8?B?cFJGMTdwNzBkd2VzQm45bFBrYVJoZ3VoN0dWWTdyT3lQVEE3YnIrTSs0Z3Vw?=
 =?utf-8?B?ZVVYK3JROW5uVnJicTQyWEx6T3d2ZzlRR05lZk40L250V09OcmtzdS8wQTdh?=
 =?utf-8?B?RnJFS0pzMW5DajhBMXRWTVZYajVKWDA0ZUtoQVdVS1VKdHRPWWJuRWdXTllz?=
 =?utf-8?B?QVdEczJ1TFBxZkh1ODcrUGZjUEdUQXg4bldqZUdaUTVvbmxqYlk2ZTlmSlZV?=
 =?utf-8?B?NThmK09DdzBvSGhveXV6UWw2T3F4cHBkTHdqc3psNFgxcHJKTVZZbmFYb1JX?=
 =?utf-8?B?ZVYrZ3lYUVh3TysyYmFrdDR1RS8xNW1lYVhqUEFNQUFnSWE2bHlWNUNpMkU4?=
 =?utf-8?B?THA3ako1R2c2eXhNWVYyTzZsSHJEcHArbU1BU0lxQS9URkJkaUpIazEwaEVX?=
 =?utf-8?B?a01SOUZJa0lDMVlzbGxzNVlEMnpPOFl4TVR6M0YzUUhrdk9QV0I3MVFGWUhI?=
 =?utf-8?B?RmVmbit1VXRjY0pYNVB0SjRpMTBRUWx3UnhOOHBjcEhNSWJTNExQajJiaTYv?=
 =?utf-8?B?RlM0SXhEZHczRVdpWUlPTXBtRFErbG5IWDBQZUxaYmt6MWo0UFVEOXdENXNo?=
 =?utf-8?B?ZHNOckxLUW93b1ZucEpoY3QxcU0xaUUrV1lZZ1NIQ24rN0N1OUVlUUI0eEow?=
 =?utf-8?B?NTZJT3IvVzNPOUpHTll3eDlnaDBEQXJEOVUzakJUN2RhWkpPNTQ2SDJRQzJQ?=
 =?utf-8?B?QlU2dW12Z1MwYVRVZWlka2NlYThVMGRPamlFWFp4NHRGdHVSNnl2VkttakNF?=
 =?utf-8?B?aHhRMXVDN0o4eFIwMGZ3OENybjJBazhnWUlHOTJJalp3dmJob3FheGVYQUFp?=
 =?utf-8?B?bkRRWUk4QlNKakFKSFloRmdTeUx0b3E4R21hUW4rYlNFQ0QyM3lsb05BaTVl?=
 =?utf-8?B?a0NEMkpXby9mdTF5ZlR6dCtkbTU1bFlza2xZaHVPSW1MZlhSeXMrQjZlMElP?=
 =?utf-8?B?Z29OREovb0tKZmZIWDlmNnQ0ZzA2Sks4UjhkLzZGRENFR1BCQUw5SklDMTFU?=
 =?utf-8?B?UXU1YmNiYTNhQldvWEwrdFhRME15U0RDTTNRWWQ1NkZvajYvTytidzltRTMx?=
 =?utf-8?B?c1lCZ0NMVGdLQzJVclNkaVgzejd1T3A4NFMzcU05cU1mNG8zVUQxaXhCY1ZX?=
 =?utf-8?B?OCt0VjRGS2tuWks1RlBJbkY5cVg2NkRRZERwUkJpNHQxQzg3ODVOd21qSVFL?=
 =?utf-8?B?NE5OSUsxQ0Y2bk1uYjNoTTNvQ05VQzZFMk5uUEJxV1JPYll6YTlxbWdLUFd3?=
 =?utf-8?B?ZUdMa085RGdCdG9KeTh1ZjRnVmZRU0w4dzJ0U1REc0hLOGZETDgvd0ZqeVRM?=
 =?utf-8?B?RzhaeFB0VnlpV0pMb0w1aWEzSHFMVVpoUXZ2eFd5TEtLVjhteGc0bnNKdG96?=
 =?utf-8?B?TnhrdkNGZ3U1WmhraWhxSGhMZmc5S1J5cWhvL2lNWVN4VEV4NXhSODd2WTZu?=
 =?utf-8?B?bXE3UzZDakwreWRoQWFXRi8wTzd6RUEvZjJyc0c1Yi9COVprdnBRSDJsZ2Jn?=
 =?utf-8?B?TmNhTkliM1AwaFJqWTkvS2s4STQ4VjBkYUZTcFlhanlHVUVCZGJOYnhlUi9D?=
 =?utf-8?B?YTI1ZnZ6b3pUSFdEbTF6Rk40SjdhN3ZjVVJwZGFCNERuaDFlT1ZHYUJrSExw?=
 =?utf-8?B?WXFKQ3FYSWVWOGxwTmhSUmd2dGtUN1JYUXUyamRlM0hCTVc4VVliNVFITkhZ?=
 =?utf-8?B?S3phZmtxMHZJVFhOZ01sc1FHTHo2MHRDZDQ4c2FDcHZrdXFCOU5hcUt6QVVz?=
 =?utf-8?B?WXc5b2pUTjVNV0ZpOTkvbUgxU0hxNjIyQ1hRYmh3clZzTG04NURrbVJVZVA3?=
 =?utf-8?B?cHo4TXFIanZDMDg5QTFrcVpKb2p5WUVPK2J6UnRwd0JnNjVURXNPNTFKVWJT?=
 =?utf-8?Q?4/uRPZ0CxL297CGhonFG57zoOVQ4vhZH?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SnYrc21SQXYvL1pDRlFXcEl3bkpIcktpdEhhR1Q1c1ZZcUdGekFWcUFnMkt3?=
 =?utf-8?B?dWQwQTIyRzRRL3RBV09rNFQ2c3h4aTJlenJ4a0tPNXlKWEdGMXYzLzRyTkVn?=
 =?utf-8?B?Mk5mTmtlRmlldk85Y096R3lSNTZSZmkrUUo5TkdROVQwK2JLSUdjdllvMzB4?=
 =?utf-8?B?d3E2QjVmcGlrU2FVWCs5N1V3NWp2L3NpQTRseW9BNHZjSUVGTWszN0F4S3lP?=
 =?utf-8?B?R2pIcmduYWlKWEJOTk11OFdpb0ZSVFBhV1k5OXcxY1FoV0ZRYit4dzlhNHdy?=
 =?utf-8?B?SWxqejlFNVpBRXZ6c3l1WXJuUjZRSGYvWDFURGFidzFMR2QyZGZMY0Urdi9S?=
 =?utf-8?B?U1cwTkljcGJGdG5TZGRqTGVvaTFNb0JSSm5DU2RFN244NXZ5SFNieWVDZ0dq?=
 =?utf-8?B?djBuRS92ZEpFNDQ1K3VUNzk3cHhtcXV5Wmx1aUUrOGpaenRRUEdFdVJONHQx?=
 =?utf-8?B?N080SkpxZE1TTk9RQTM4eWZtZy92dUJsb1YzT1NNbk1KUGxMdkN0YnVLdGxG?=
 =?utf-8?B?Y3ZDazdGTUFLczA2MlJrZk5rVVdvMmcyZkFROEY1K1R5dGdWZlA5SGpwMjNr?=
 =?utf-8?B?THVDQkZVNE9nUFphdG1uOUNqdUdqZzdSTUZtc29NTjdJVzNUYjg3RXNlS1JD?=
 =?utf-8?B?UUFjeHlSejBiKzcydENOTkdXMmM5T1M0b0daRjdXQ2hZTlJxNHVKcy9mWDJz?=
 =?utf-8?B?V1V6bS8xRnp5RllMY0tEZW5KOVByL1dXVHRjaDJHSUhHeWY0b05CbGk0Y2Qv?=
 =?utf-8?B?UVFZSnRnamErOGhYd0hqM3JuSjZtYm1EemhDY3lHS2tXeW82Y28vSSszRCtN?=
 =?utf-8?B?Vmg1R1o3RmVwVTlTdUlYQzMzK3dWeEZPT3VZVGVjWWJJdUZEaTIrYVltM09a?=
 =?utf-8?B?RmdZY0JMR2J1K3BwRjl2M2NBRnRQQlZJWUhHR09oRGNOdE55TDdRRGZacC82?=
 =?utf-8?B?U01QcE1xeElQWEc2aFY4VzVWMHRnSFBFVEt3YjgvWXl0U08zTnBDeXpTNUxM?=
 =?utf-8?B?cjBMc29jOThCNW5nTjV4elJNNHpQZ3gvNWc3L0w1NnRnYXpyYVBHVlk2UmZq?=
 =?utf-8?B?eGRTWGFuVzg3aEREbk9MRUNFRG5SVUhjMjQrMENIMWE1dU15OU4zSGcwNTRz?=
 =?utf-8?B?VFZtbmxqYmtnYTh4Y2lpV0x5R09PajJPdjNBenhnb2dUUmJRdGp5WjdGUm9i?=
 =?utf-8?B?UnRZdHRtYnE4NzdWWlcyN0dSYnZuaGpQNmhsM1N4NWlwYWh6aXNGekhQMWd2?=
 =?utf-8?B?SGFQSWd5anBNcThBNE9ROUdNVFpCamN2eDExT2wvb1ZqMkUrVjYwM05VZ0tv?=
 =?utf-8?B?SmM0MWZGVUZ1UFJ2VFErTEYwTjhNQkpQL2REK0VuVU1lcTNkOVc4SFdvQkF5?=
 =?utf-8?B?NmRoYUpaR2hMRjZTMjBua1FielR4ZllpR2Q5bGtQWU1qNVR4V0w2QzY0YUN1?=
 =?utf-8?B?STVrdGQ2c3hicWZ4aE5OaUZCSnRvTVNtcnB2bUxWaEhXb0d4cTRpcTdkT1VW?=
 =?utf-8?B?SE5RV0xnVXh6dFRZcDh1R1dCc3pnUDk5WUFHQ0VNa3RsWlgwUHpJeUU2eHhj?=
 =?utf-8?B?MWdBbTNXc2Qxdm03d0plaWoxbWVuZjBBb2VpMzVnMHNNNjJDelUwZlFqcDBU?=
 =?utf-8?B?SHk1UlppV3FmSW56RGplemVYOFJkQWt5N3E1YmhibE9WUmhtRzZHdXQ0VExT?=
 =?utf-8?B?aU5qS2hBN3J1WFB2UlpaeGdLL0R5b09DQXhQSlNkR252Z0RqMHQvSzJkOEdq?=
 =?utf-8?B?K2U1L2VHcjNWbVZQMGZCeFhjc2hjbGh5QUJsdS9ETTg4OTJKdlVXUjRWaXkv?=
 =?utf-8?B?dnpzMVlsU0U2VngrR3gzeXp6OGVNTlFXQ2QrQUZzNnlDVUV4bGo4dnRuRGtY?=
 =?utf-8?B?Ykx5d1hmNk4vNHAyMklJMEhKb3l0T3hYQ2s1SlJZanJWM0tuK3hMR1pIaVpF?=
 =?utf-8?B?NDNSL3pWVmpkT1hRU1R2dWNjd1Y5RGFadEZadFJpYzRXMzNLNTJBdUJ1MSsv?=
 =?utf-8?B?TkJrTHhiVG5GR3VwdVVaVktiUmVDaEdkUTVlZkhKQzNhZFQ0eXZ6dmh4ZEUr?=
 =?utf-8?B?QTZYaWRkd2p6VDg1WngyQTIyNzhkcEU3YWFQZytTQ2wvQmQ4TmgrSlg5ZlAv?=
 =?utf-8?B?bC8zaUNudzZkSmhWd21YeHoxNGNjRTRPeVdlZzRmRVU1TnpEbld6U1hqNnAr?=
 =?utf-8?B?Y0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f20cf378-7668-4166-2eb5-08de27a49325
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 19:48:13.2256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4FwLrP3GfJL3FEw6gTX1ODgAn29DaCqxLzzSMyWEkmdNg3thZcyY2iq/Z69mPdHlLv/JngwMKfR7yxq5tYpXoj/q2h3ETBglk5pKaYFJZDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7470
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: BudSks-8bw5FbFJrvccptrrjcFIzqtrn
X-Authority-Analysis: v=2.4 cv=EdXFgfmC c=1 sm=1 tr=0 ts=691e1f03 cx=c_pps
 a=rvqTtZJOg9Ha/t6LIbsz2g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=6yfv1bLonfCEyOLC0UwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Rfw2oJpr3f21ZIbSA5sA:9 a=gHjptuiFziQeciKj:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: MvWc-V6F2JlizlOGe1iOveyg6Ydgm4dJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDE1NSBTYWx0ZWRfX4Y+JNMeaFqe8
 zg2Ik9EX7WgQ0DWJTmdnDo3+IWvpWiZN1tpRUFvq318HrsGH9XBeW0MJ+CO7o1/hpKx3/+HfvJb
 BX1MavuMqZILmeu0UfTBDqpCTeFwO6usy2ISExonyOl5g5G01lNO6pWImqIIlDQHqe6m9uuV1mc
 gvz3G9KG1g0VT/afu5PSIbQWuC3HnHUDH0l+DavCRKbEUZfu5B7vTQRpcErE0MVdbHSEZGq9k2+
 BydewqxKl9abinXn3EFh9m+wwQu+DUGRckb+Il89MMF82/X+AHGmGz3Hnx5wjVWvi2sUz63hV6V
 4uNOdqX3+nO1tKDocu5GVavDSAjZaKq14CjF2gugtFOSq6RC6SDpc3Rw6xyKpE8WereK1kg55uN
 3rSY/hdXORGI/va6ZHi0x8eZ/EROUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_05,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190155
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 19:48:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226579

--------------81tmWQwdzauCRYVKnLaitjVF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5AJ97PVH2988320

On 2025-11-19 11:47 a.m., Harish.Sadineni@windriver.com wrote:
> From: Harish Sadineni<Harish.Sadineni@windriver.com>
>
> Add `clang-native`, `rust-native'  and `bindgen-cli-native` to `DEPENDS=
` to support
> Rust-based kernel modules or features that require generating Rust FFI =
bindings using
> bindgen during the kernel build process

I'd like to see either a change the shortlog from:

 =C2=A0=C2=A0 linux-yocto: add clang-native,rust-native and bindgen-cli-n=
ative to=20
DEPENDS

to:
 =C2=A0=C2=A0 linux-yocto: conditionally add clang/rust/bindgen-cli-nativ=
e to DEPENDS

or for you to introduce the rust-kernel DF in the body or ideally both.

../Randy


>
> Signed-off-by: Harish Sadineni<Harish.Sadineni@windriver.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto.inc | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-k=
ernel/linux/linux-yocto.inc
> index 4d0a726bb6..41b12b6f14 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -81,6 +81,8 @@ KERNEL_DEBUG ?=3D ""
>   DEPENDS +=3D '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "pow=
erpc" ], "elfutils-native", "", d)}'
>   DEPENDS +=3D "openssl-native util-linux-native"
>   DEPENDS +=3D "gmp-native libmpc-native"
> +RUST_KERNEL_DEPENDS ?=3D"${@bb.utils.contains('DISTRO_FEATURES', 'rust=
-kernel', 'clang-native=20
> rust-native bindgen-cli-native', '', d)}"
> +DEPENDS +=3D "${RUST_KERNEL_DEPENDS}"
>  =20
>   # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahol=
e-native available before do_kernel_configme
>   do_kernel_configme[depends] +=3D '${@bb.utils.contains("KERNEL_DEBUG"=
, "True", "pahole-native:do_populate_sysroot", "", d)}'


--=20
# Randy MacLeod
# Wind River Linux

--------------81tmWQwdzauCRYVKnLaitjVF
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-11-19 11:47 a.m.,
      <a class="moz-txt-link-abbreviated" href="mailto:Harish.Sadineni@windriver.com">Harish.Sadineni@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251119164804.256364-3-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>

Add `clang-native`, `rust-native'  and `bindgen-cli-native` to `DEPENDS` to support
Rust-based kernel modules or features that require generating Rust FFI bindings using
bindgen during the kernel build process</pre>
    </blockquote>
    <p>I'd like to see either a change the shortlog from:<br>
      <br>
      &nbsp;&nbsp; linux-yocto: add clang-native,rust-native and
      bindgen-cli-native to DEPENDS<br>
      <br>
      to:<br>
      &nbsp;&nbsp; linux-yocto: conditionally add clang/rust/bindgen-cli-native to
      DEPENDS<br>
      <br>
      or for you to introduce the rust-kernel DF in the body or ideally
      both.</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20251119164804.256364-3-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 4d0a726bb6..41b12b6f14 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -81,6 +81,8 @@ KERNEL_DEBUG ?= &quot;&quot;
 DEPENDS += '${@bb.utils.contains_any(&quot;ARCH&quot;, [ &quot;x86&quot;, &quot;arm64&quot;, &quot;powerpc&quot; ], &quot;elfutils-native&quot;, &quot;&quot;, d)}'
 DEPENDS += &quot;openssl-native util-linux-native&quot;
 DEPENDS += &quot;gmp-native libmpc-native&quot;
+RUST_KERNEL_DEPENDS ?= <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('DISTRO_FEATURES','rust-kernel','clang-nativerust-nativebindgen-cli-native','',d)}">&quot;${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'clang-native rust-native bindgen-cli-native', '', d)}&quot;</a>
+DEPENDS += &quot;${RUST_KERNEL_DEPENDS}&quot;
 
 # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole-native available before do_kernel_configme
 do_kernel_configme[depends] += '${@bb.utils.contains(&quot;KERNEL_DEBUG&quot;, &quot;True&quot;, &quot;pahole-native:do_populate_sysroot&quot;, &quot;&quot;, d)}'
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------81tmWQwdzauCRYVKnLaitjVF--

