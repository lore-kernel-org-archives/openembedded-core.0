Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC7ACCFA04
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 17:43:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1932.1762278213694214160
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 09:43:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=VMosDRf0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3403628e3a=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A458O3Y2608395
	for <openembedded-core@lists.openembedded.org>; Tue, 4 Nov 2025 09:43:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=HVir+0iRdMKuTuZNrIawta
	dPrGTltJz/dCgHvD5LEhE=; b=VMosDRf0VsT7FGXsfi+jP+lGrnZTmP+ZWbl2tm
	aaAnwFEyNfZPyqHephudihZ8e7WCkMeWttEJp+SQE4qlDGVnXSzImki0APc9xxOZ
	C3WSdr9fktTMWBufTfP1sopITeuAssPgz5Wn1FnG5UQKTlNa8xGnQvAs5zhD5c1K
	RHGOdr+eIjR6KlxceJnjeofO6U+tj7ZdjhLyQGwxMGT2uFY7oNEnO7eqGwO7LAnh
	HwPyQhuVUJiVSfkdV0/oRsCtccicesAAUHpnb23gi7uNeTKIAO9GtXJUTvAsjWUU
	0FYQ8+7vTiyH1BY3rwrLtwXWcxnUbSpohaaJ7OHbx1FwOJjQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013062.outbound.protection.outlook.com [40.107.201.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a5hqek6yp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 09:43:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHLx/JPxq6q5l8Qaon+HAwXcp+Zk4usz3HjnibuzYA6PMiPCIHplWmYedZ3kmrvt9+qhelhJ+n1Wy4hteGjgDq6O8i004ufPoZj0/09sg7jjjy1XkFVGe6bHd6qBomJSJ41fqckDPzS5Ssx5y8yyxseavNDueYcz495g+89ORZCjuu5BgQX98ur/oqUxJlQh6Tk66B/8b9oMfLHpoFbZe8OCglponEQ7dlHGnhH3gOx5iPHlIL1oSw1jCNdaVox1V/MBow5vxZo01T8R2AM427U+F4RuPbVKK9qbhKDpNZzvEYLXAugkGKyWPdeWiWkBx0JxK0Mv5s9tj2H7yDXZgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HVir+0iRdMKuTuZNrIawtadPrGTltJz/dCgHvD5LEhE=;
 b=c4GKHO0fBgFeuyAxIQ9zTl6uSN+RiMw8ZOKjwuMTp/kwSYbh2glq8wHMEMch2j75SMuhyHuEcWcQH9kxmhS5w9yv7l+Aq+E6cDqMo9imdUORpimeUxnHFkqT6LaguW9mdT9vFOb5wrkFWZ769QAwZe/7T0l9RGjomGcmrG/0v+N7iBPn/DiSgydqviq/UsLQU9A0NspKtSGLUTSDdwpDAMR7TCh6S5OR1yCpyafOM3nfRSh3IcrnJmYgEqZNxSShEMYmjyrGOmmdEbjEVU5J9gQOJNvn6/QyErSH6kNMp45XL2fMjkpo8MnxgylwbDqXIlZdx/0FWmONYgziKIq11Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by PH7PR11MB8455.namprd11.prod.outlook.com (2603:10b6:510:30d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 17:43:24 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 17:43:24 +0000
Content-Type: multipart/alternative;
 boundary="------------PWcNqMTh6byx0b1UrhRlFUHA"
Message-ID: <0a5dc5e7-4b26-4f3f-8cad-ee42b3cc6553@windriver.com>
Date: Tue, 4 Nov 2025 12:43:20 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH 6/7] linux-yocto: enable Rust support in
 kernel configuration
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org,
        Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Sundeep.Kokkonda@windriver.com, elmehdi.younes@smile.fr
References: <20251023112547.4044904-1-Harish.Sadineni@windriver.com>
 <20251023112547.4044904-7-Harish.Sadineni@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20251023112547.4044904-7-Harish.Sadineni@windriver.com>
X-ClientProxiedBy: MW4PR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:303:16d::13) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|PH7PR11MB8455:EE_
X-MS-Office365-Filtering-Correlation-Id: 0169a40e-c211-437c-dc33-08de1bc9a74e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L0R0NDlCcVJPNnpGOFFTdnFHVHdMakQyYmVQOTMva0JTaEtDelZVZnZEa3FH?=
 =?utf-8?B?cmw0bytlejBCb2M4UmRaZktsN3ZoOXpNZGprTGk4L0Vud1lVcVhDb1JhZldq?=
 =?utf-8?B?MGo1NFEzSG8wMHJ0U1hwdE9jWkFGaUVlZVp6ckJvbGx2blh3NHlDdmwrS0tv?=
 =?utf-8?B?dkFvcm1CVkZmRVZudXovbXdzVVVKMW8rMzhETHQ1TWZvVTFJdGFtZGkxZDNm?=
 =?utf-8?B?WWM0WU1XdnV5SnplRDQ5STRZYmhXREZPOWx2UWlBV1NiUmNBMmpTYWR5UGM1?=
 =?utf-8?B?WEQxQlkyKzFuOTZNeHVBWVpLeW5udFp5ZjRqd0hPbG4zbENmMlkzRWcrR2Jx?=
 =?utf-8?B?Ni9WVVBZelZqTVM1eHE2M2poQlZhTlBlbjBUM1k4bGhzRkZHb0tTZ1Awemxx?=
 =?utf-8?B?eDdPeWN4dWFpa2YzRTNaZ0NpdFQ2NXZadDZ0bitMS3VqVHd4V3JQUGVIVDFP?=
 =?utf-8?B?eUI2QTg3a1hIZCtpRkRoT2pBZ0htYk9TWVdDa21aK1lULzgvK2hKK0RTZDd2?=
 =?utf-8?B?THozeFhrZlJ3ZG9CM2UwT0h5OTl2RUFIWWlFcjJnL0lQbE1zbXc4V3hXSmQ2?=
 =?utf-8?B?ZExzb0JTVTJyYWhiMTByMDZFcGkrSEt1dkRuWEswVk9PZ1JuWFh1ZForVWRW?=
 =?utf-8?B?Qk04Y2luZlltSmdtY2tpcUNqKzVrUUZzb1Bua25VenVmZmZjdlBOVGU3bVUx?=
 =?utf-8?B?R1d3eWxNTXdJQjRmMnlScXdOTU51VnhTQjhjeG1IM2xYTmF4dVc2aWw4OWIz?=
 =?utf-8?B?dkhLSzJubE1mQ3NtQndRSXhzVHVWa1oxd0VvYU1qQmVtZTJmcUpLNFpRMnZG?=
 =?utf-8?B?WHhuWEpUSFVKNWYySWJvcWl6c0QvcUV3eDQxclF5a29ObkZVQXB5a1ZhRlor?=
 =?utf-8?B?RmVkYlcrVGdkSVJvRFkyS1h0US9TdWV1Q1lEdjBPZEk4WEhmN3VmOVR5TFRs?=
 =?utf-8?B?MS8vUlI4TzZrWnB6eFQzbW1LWW1kNjhPY1hDRld2eDdnTk9CblUwbG1MRkFu?=
 =?utf-8?B?NmhKRFRqdndnZ0VOYnpOUGhrQUtJMzZnSmtOTURUN1BWbzQzdFFZMjhQN3FK?=
 =?utf-8?B?ekxza09ZZ2dTV1BwUXQ5ZDRUUDhYU1AraUdVSmxxOG9UdzhuMC9PRUpBcTlj?=
 =?utf-8?B?Uk1LbUdlQ1lXSmhDa0VxTVN0RDR2VUxzNURGblhybGtZRms0V1EzeEZidSsx?=
 =?utf-8?B?b0djaEsvM3U4RmdYU1hUczhvdll4QXl0WUUzWEprRTJETHhSbTJXY1pjaUZG?=
 =?utf-8?B?Mk03ZUozWVRXV21uZm1XeitOdXl6K0ZMZU43ZXBDcHVNdEMrYWZvb1BTc2gr?=
 =?utf-8?B?VFVIRUJCRjNQWDJuQ2k5eTlVa1dEUGFENklnSmViZUJjcTZHUDMxRzIzYTBo?=
 =?utf-8?B?aTFtb0orR1hzUzFjbVBEWWNuUFBaT3RJMTZXdW9LM0EwSTliOFUvRFplcWhm?=
 =?utf-8?B?TnlPalIvUThZS01zZ2daK0lSd2V0Sml0SkFDelVnSWV1dlBhcUoyVjZEUDdz?=
 =?utf-8?B?MW5PTno2Ynk4WTNQWmpTa3BDMkhlSWNEbHBMa2N0MysxZThWV2FLaXZFS21E?=
 =?utf-8?B?aFdYSlNGUjlCV29aczVoZmg5aHBoQytiVFJtbHFlRktFemFMZ2kwdWw3WDVi?=
 =?utf-8?B?d0hJQU5nM2ttTDhQSG5OZnZiMzBHZWMwT1RpNVgwTWtwd1JCKzRRN0hXaU1P?=
 =?utf-8?B?S3RNanUzVU1sUHlTemlmN1V3aStENWVVeVN3N283NHpOWkpDcGUzc0JVZU9R?=
 =?utf-8?B?cjBNbmI5eUVCSXdCTzdQeXNqNWE1Q2NtM3FrK2lFNFRGdXRoc1g5YTRYZmRt?=
 =?utf-8?B?NHJMSTQwaW1HOE5aMTdFOU5uZTU2YitkNnNOZlJWclc1Z29oUWhYaU51azV2?=
 =?utf-8?B?VnZ0TmN5WUJIOG9hUmdPN0hJcS9QKzByakNBdklvcCtOSnR6Q3BNZy8zdWU1?=
 =?utf-8?Q?isB2mxPMZzg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bnFEMTViYUFSQy8wcStycDRUK294aE82WWdyMEMwQ0pzT01WYUFQaTBLZjht?=
 =?utf-8?B?eHAzSUZWM1FWZFd0NENUVHpXemhBaGE5K3cvbGhDbEVmTUJtR2VxU2wvR2Nv?=
 =?utf-8?B?Y3RVblJ5NzBFR1dkMDJ2UlBFTVhoWXlGSXhrZEh0dTRiTERqSVd2Kzlwa1Rr?=
 =?utf-8?B?WFkwbmRmQlRJWEk4WmtsTktremZ2dlpYRXptaWhSL3VUNFArTVR1NUg0WHI3?=
 =?utf-8?B?S1BGL2JkbG5Kb2NpVkgrM0dsMEo3RVA2QWkvT3lUdUFGUFoxalhoaWJva21x?=
 =?utf-8?B?NFNIS3dOdnRDVjdHKzRUNWQ1bkIzRFREaFNIb3lQK2lXc0xCTGFPMDZsQ0M2?=
 =?utf-8?B?QVowd0Z4bDZoMm5CMUxxTW5xS2FaT2lobVlWRTBKWjAyazM0Qkl5NVlqeGIv?=
 =?utf-8?B?UEZ4d3d5bkt3dnU3MWYyMlFWc3RZaXpoRGpBeGFtQ1EvRE16RVlHYmo4MFhO?=
 =?utf-8?B?Vm9aNVVRbFp2QXpHY2d6aWhYWis4RGx1bndjTFlDSW90UUp4V3NDWm1PaFBz?=
 =?utf-8?B?NFpzMWdXZDlKS3JxZHpkUWkyNjdzd3FObW5pS2tUTVcvRkFzdE1uUlR0cndJ?=
 =?utf-8?B?RTYzSGs2MjRHSGlRZkZxSlFrMHlXOURIQ01PZTR4VEFrTldESzMrS3FqT3ZV?=
 =?utf-8?B?UEZNaDBKenZTNUJ5aTdpUlFVTTR3UURyM3BsalBtTGFuZTRLWkd4aSs3OFpW?=
 =?utf-8?B?V2d3RjU5aVZ4VEJwRmEzZ0Y5bFI0dlZxL3VxRE42TUt6aHJ2YXBuU3FNUlk1?=
 =?utf-8?B?S0JxWjB1MVJDbDNMSzdMSzcxUHdJZ0x6OXZ6Ni9lRDc1bjFPdWFQdzNaN1Q4?=
 =?utf-8?B?aU56Y3Q5WG9UY0xUVkVXRkRIeXJYUVI3OE03QmZqb0VrUzB1L3Vlc2E1dk9X?=
 =?utf-8?B?WENIdFVBUnZLL2lQWTZXV2REWG5OZXZjMVBxNEVhRWdyaURnbElIV293QllY?=
 =?utf-8?B?WkIrNWc4TmtJSXhIT0I1SDBya3FlMGhjSzA3SHZSRDdzYXJVRmZ5dWZFVFVC?=
 =?utf-8?B?bzk5V0RDbmtoY3djOVhkU25xYk9aSUlKSHl1UVdDRE8zNmJMOXJnMzJjSDQr?=
 =?utf-8?B?OWlyR29FN0FPNmFXbW9QY0RFNWVUeXk3NXBQMUZTeTc3dFdUeUpXMzlaZmQw?=
 =?utf-8?B?clJCaEZBMlZTa0IxalVnZEZEelVrN3dtTlFrRUdhbkZvR1ZQbGdpWSt4TVli?=
 =?utf-8?B?S0d2a2FOamY0b1ZMdloweWk5ZHZMNVdOZmN6eWZKS2FhTG12aWNPTis5eC9T?=
 =?utf-8?B?aC9CN3EyQVdqU0RqWkpjR3dnM0ZORUx0QTE2d1hVR3ZqVlRtT1JwN0RzeENL?=
 =?utf-8?B?QVQ3cHErcmlqalFhZjZQRExHMlN3dGZWNzU3dFhPb1BOSWQ5SThMVE9SbUd2?=
 =?utf-8?B?MWRuTGs4b3NHN3pObnVOQzZTNzdQQkFRcDhRWHdaYTBlakhoQjZxZGlmU3Q3?=
 =?utf-8?B?bkM1SEkxWXF5bnRoSVhMSUJRUXZVR0tXSjRhZjYwN2pXSWJPSEV5cHRlNDEz?=
 =?utf-8?B?UEdZdElBZXlTVk5LN0hzOHlqWVZib3AvV3ZsaTliajFKaTRHWnpUYXVmd2t5?=
 =?utf-8?B?OURTM0tqZkNYdmRUbzliSy9RVTBpUndTUkRzVjFKSVlSa1dzT3ZmZWgvckhM?=
 =?utf-8?B?elY5Q1FWM05HUkdBRWdxYmthcmdOc2pkRks3dFZERzB4eUQyK0pNTkZHdGFo?=
 =?utf-8?B?WTVXcGV3ci9seGdHOGhZQ01UMUZYVGJSQ3Y2TVhJWmU2eHVlVVhLQzNGeWRl?=
 =?utf-8?B?ZjJkaXE2aFlBMkRnbGVqVTc2b3grSkJwdlZ3R0dRV3p0Rm9wUVg5WDQ1aE5o?=
 =?utf-8?B?aTA1MlZXQVUrUitKMU5qUXpGZWVZNG5NZlE1YklhdmhjMmIxNWFac1U0UklH?=
 =?utf-8?B?cCszeng2SldRK01JUFpIUkdiUVI4eTRmVWpQb3U4a2Z3RThiVERnTjV2cUVC?=
 =?utf-8?B?dy9rYU9Cd3FMTHR6MnVscnFHRm52U0NIMHJaVDdqck1ZaXFtZC9LNmdmUzlr?=
 =?utf-8?B?UjNDcDJIY3A3ckI1OVBBOEkxMkt5YUhObklLUHZTTTRFaVdKLzdvSEg3eU01?=
 =?utf-8?B?VEVWUnFCbXp0NXdtYU81b2pVN2FRVkVBZEtLR2dINTdVM0JpajJOcVJRRk9w?=
 =?utf-8?B?TjF6d3poMDBRSEhRMml4K0ZHeHpRN0wvQmF2ZjJ0V2xJbUxhMkpKYjBaUVJz?=
 =?utf-8?B?d2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0169a40e-c211-437c-dc33-08de1bc9a74e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 17:43:24.4263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Y17mtpyzpUO/xyjoN7GZbcSqcynvJAWTpKmSdGMJf9B+6YcPrdImfE0zDxPvReFk39CkJpjfs4msvsOhzwiriN6Vw9iv1WNTo8GlwQNZ8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8455
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=HJPO14tv c=1 sm=1 tr=0 ts=690a3b45 cx=c_pps
 a=2HCcruDS7e3rZRcUQV6B1Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iGHA9ds3AAAA:8 a=Dh-9_RHuAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=69ReA-0zyhO7UNb8XXkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=VO4LNry1-8sA:10 a=e5Rqoxz72u0A:10 a=k41wlmQAcKrvtVk2J_0A:9
 a=-qD9SflgdzCVKfl9:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=jioklrMam_EbeH-ZsVr9:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: _GvnPzvuMBJQX-azrAoM0-nJ6cYqHaaa
X-Proofpoint-ORIG-GUID: 4lvCj9rkSeQJfmmKx06fX3ew2W627gF5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDE0OSBTYWx0ZWRfXzjDHC78mIbvh
 WT/6pQUpX5gvKSF/+uQa4vhQGvAc6za0i5NpwIUjGCVzqyiN29FkAXv450/1++krVm6JbaGq4lB
 aJsLDPLa9Pq+eFoiOe6GyxbZVHmO+/zHDYdclpGhcM0Qr24RAemEzR7cDK/xnH1eLxWzS3uH1o9
 FgSo2SoUPJKHfRimgbXCx4U8nDtOB3aLYGpbU2OafWGRTkO82EcUZmvUgJNxyoba5dG/gATBBJU
 ulJpBsDgmzGd6L4NOXh4tUbHUUogI0mrpCzmEdoE8aJp1LyamBsqR3zJqMhBUewjU+57DbdT/1M
 gFYQuzZeOqtjTSLMj3VlBPtH8U0rBYYeT2BZtqVXhkxAvGdkGXZs4RhKCaxVxPp9Bx4Ip1UDNPB
 kIJjs3I2TaJMyFLBSlsxtyOkzL+Y2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_02,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 17:43:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225741

--------------PWcNqMTh6byx0b1UrhRlFUHA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5A458O3Y2608395



On 2025-10-23 7:25 a.m., Sadineni, Harish via lists.openembedded.org wrot=
e:
> From: Harish Sadineni<Harish.Sadineni@windriver.com>
>
> Add initial support for building the Linux kernel with Rust enabled:
>
> - Introduce `rust.cfg` to set Rust-related kernel config options, inclu=
ding:
>    - `CONFIG_RUST`, `CONFIG_HAVE_RUST`, and `CONFIG_RUST_IS_AVAILABLE`
>    - Rust sample modules and developer checks (overflow/debug assertion=
s)
>    - Disable BTF and module versioning for compatibility
>
> - Add `rust.scc` to include `rust.cfg` via `kconf` in the kernel featur=
e stack
>
> - Update `linux-yocto_${PV}.bb` to:
>    - Append `rust.scc` to `SRC_URI` and `KERNEL_FEATURES`
>    - Suppress `buildpaths` QA warning due to Rust path inclusion during=
 builds
>
> Signed-off-by: Harish Sadineni<Harish.Sadineni@windriver.com>
> ---
>   meta/recipes-kernel/linux/files/rust.cfg      | 20 ++++++++++++++++++=
+
>   meta/recipes-kernel/linux/files/rust.scc      |  1 +
This is fine for an RFC but at some point, when Bruce asks for an=20
non-RFC version,
I expect that you will need to move this to the yocto-kenrel-cache,=20
perhaps under:

https://git.yoctoproject.org/yocto-kernel-cache/tree/cfg

Take a look at the yocto-kernel-cache repo and docs:
https://docs.yoctoproject.org/kernel-dev/advanced.html
if you haven't already.

>   meta/recipes-kernel/linux/linux-yocto_6.16.bb |  4 ++++
>   3 files changed, 25 insertions(+)
>   create mode 100644 meta/recipes-kernel/linux/files/rust.cfg
>   create mode 100644 meta/recipes-kernel/linux/files/rust.scc
>
> diff --git a/meta/recipes-kernel/linux/files/rust.cfg b/meta/recipes-ke=
rnel/linux/files/rust.cfg
> new file mode 100644
> index 0000000000..293438e8e0
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/files/rust.cfg
> @@ -0,0 +1,20 @@
> +CONFIG_RUST=3Dy
> +CONFIG_SAMPLES_RUST=3Dy
> +CONFIG_SAMPLE_RUST_MINIMAL=3Dy
> +CONFIG_SAMPLE_RUST_PRINT=3Dy
> +CONFIG_SAMPLE_RUST_HOSTPROGS=3Dy
> +CONFIG_RUST_DEBUG_ASSERTIONS=3Dy
> +CONFIG_RUST_OVERFLOW_CHECKS=3Dy
> +CONFIG_RUST_BUILD_ASSERT_ALLOW=3Dy
> +# Disable module versioning
> +CONFIG_MODVERSIONS=3Dn
> +
> +# Disable BTF debug info
> +CONFIG_DEBUG_INFO_BTF=3Dn
> +
> +# Rust availability
> +CONFIG_RUST_IS_AVAILABLE=3Dy
> +
> +# Indicate Rust support present
> +CONFIG_HAVE_RUST=3Dy


You'll have to review this list to divide it up into:
 =C2=A0 1. a minimal rust.cfg and perhaps
 =C2=A0 2. a rust-samples.cfg
 =C2=A0 3. a rust-debug.cfg=C2=A0 if that's really what=20
CONFIG_RUST_DEBUG_ASSERTIONS and friends are doing:=20
https://cateee.net/lkddb/web-lkddb/RUST_DEBUG_ASSERTIONS.html Also,=20
you'll need to explain and justify each option or set of options more=20
clearly in the commit log.


As Bruce said, the next steps are:
1. Rust being optional and off by default 2. Rust binary / prebuilt=20
components to minimize the overhead and dependencies of rust and related=20
tools on the kernel.

Anyway, this is a super start and I understand you have a v2 almost=20
ready that makes kenrel rust-support be optional so send that now and=20
we'll see what the next step after that is.


Thanks,

../Randy

> +
> diff --git a/meta/recipes-kernel/linux/files/rust.scc b/meta/recipes-ke=
rnel/linux/files/rust.scc
> new file mode 100644
> index 0000000000..4686d9ce5e
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/files/rust.scc
> @@ -0,0 +1 @@
> +kconf hardware rust.cfg
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recip=
es-kernel/linux/linux-yocto_6.16.bb
> index 2188c7fed2..fda964e78d 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
> @@ -77,3 +77,7 @@ KERNEL_FEATURES:append:powerpc64le =3D " arch/powerpc=
/powerpc-debug.scc"
>   # Check again during next major version upgrade
>   KERNEL_FEATURES:remove:riscv32 =3D "features/debug/debug-kernel.scc"
>   INSANE_SKIP:kernel-vmlinux:qemuppc64 =3D "textrel"
> +INSANE_SKIP:kernel-vmlinux =3D "buildpaths"
> +INSANE_SKIP:kernel-dbg =3D "buildpaths"
> +SRC_URI +=3D"file://rust.scc"
> +KERNEL_FEATURES +=3D "rust.scc"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225242):https://lists.openembedded.org/g/openembedd=
ed-core/message/225242
> Mute This Topic:https://lists.openembedded.org/mt/115908712/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------PWcNqMTh6byx0b1UrhRlFUHA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2025-10-23 7:25 a.m., Sadineni,
      Harish via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251023112547.4044904-7-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>

Add initial support for building the Linux kernel with Rust enabled:

- Introduce `rust.cfg` to set Rust-related kernel config options, including:
  - `CONFIG_RUST`, `CONFIG_HAVE_RUST`, and `CONFIG_RUST_IS_AVAILABLE`
  - Rust sample modules and developer checks (overflow/debug assertions)
  - Disable BTF and module versioning for compatibility

- Add `rust.scc` to include `rust.cfg` via `kconf` in the kernel feature stack

- Update `linux-yocto_${PV}.bb` to:
  - Append `rust.scc` to `SRC_URI` and `KERNEL_FEATURES`
  - Suppress `buildpaths` QA warning due to Rust path inclusion during builds

Signed-off-by: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>
---
 meta/recipes-kernel/linux/files/rust.cfg      | 20 +++++++++++++++++++
 meta/recipes-kernel/linux/files/rust.scc      |  1 +</pre>
    </blockquote>
    This is fine for an RFC but at some point, when Bruce asks for an
    non-RFC version,<br>
    I expect that you will need to move this to the yocto-kenrel-cache,
    perhaps under:<br>
    <p><a class="moz-txt-link-freetext" href="https://git.yoctoproject.org/yocto-kernel-cache/tree/cfg">https://git.yoctoproject.org/yocto-kernel-cache/tree/cfg</a></p>
    <p>Take a look at the yocto-kernel-cache repo and docs:<br>
      &nbsp; <a class="moz-txt-link-freetext" href="https://docs.yoctoproject.org/kernel-dev/advanced.html">https://docs.yoctoproject.org/kernel-dev/advanced.html</a><br>
      if you haven't already.<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:20251023112547.4044904-7-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">
 meta/recipes-kernel/linux/linux-yocto_6.16.bb |  4 ++++
 3 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/files/rust.cfg
 create mode 100644 meta/recipes-kernel/linux/files/rust.scc

diff --git a/meta/recipes-kernel/linux/files/rust.cfg b/meta/recipes-kernel/linux/files/rust.cfg
new file mode 100644
index 0000000000..293438e8e0
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/rust.cfg
@@ -0,0 +1,20 @@
+CONFIG_RUST=y
+CONFIG_SAMPLES_RUST=y
+CONFIG_SAMPLE_RUST_MINIMAL=y
+CONFIG_SAMPLE_RUST_PRINT=y
+CONFIG_SAMPLE_RUST_HOSTPROGS=y
+CONFIG_RUST_DEBUG_ASSERTIONS=y
+CONFIG_RUST_OVERFLOW_CHECKS=y
+CONFIG_RUST_BUILD_ASSERT_ALLOW=y
+# Disable module versioning
+CONFIG_MODVERSIONS=n
+
+# Disable BTF debug info
+CONFIG_DEBUG_INFO_BTF=n
+
+# Rust availability
+CONFIG_RUST_IS_AVAILABLE=y
+
+# Indicate Rust support present
+CONFIG_HAVE_RUST=y</pre>
    </blockquote>
    <p><br>
    </p>
    <p>You'll have to review this list to divide it up into:<br>
      &nbsp; 1. a minimal rust.cfg and perhaps<br>
      &nbsp; 2. a rust-samples.cfg<br>
      &nbsp; 3. a rust-debug.cfg&nbsp; if that's really what <span style="white-space: pre-wrap">CONFIG_RUST_DEBUG_ASSERTIONS and friends are doing:
   <a class="moz-txt-link-freetext" href="https://cateee.net/lkddb/web-lkddb/RUST_DEBUG_ASSERTIONS.html">https://cateee.net/lkddb/web-lkddb/RUST_DEBUG_ASSERTIONS.html</a>

Also, you'll need to explain and justify each option or set of options more clearly in the commit log.
</span></p>
    <p><span style="white-space: pre-wrap"></span><br>
      As Bruce said, the next steps are:<br>
      <span style="white-space: pre-wrap">
1. Rust being optional and off by default 
2. </span>Rust binary / prebuilt components to minimize the overhead and
      dependencies of rust and related tools on the kernel.</p>
    <p><span style="white-space: pre-wrap">Anyway, this is a super start and I understand you have a v2 almost ready that makes kenrel rust-support be optional so
send that now and we'll see what the next step after that is.
</span></p>
    <p><br>
    </p>
    <p><span style="white-space: pre-wrap"></span></p>
    <p><span style="white-space: pre-wrap">Thanks,</span></p>
    <p><span style="white-space: pre-wrap">../Randy</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite" cite="mid:20251023112547.4044904-7-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">
+
diff --git a/meta/recipes-kernel/linux/files/rust.scc b/meta/recipes-kernel/linux/files/rust.scc
new file mode 100644
index 0000000000..4686d9ce5e
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/rust.scc
@@ -0,0 +1 @@
+kconf hardware rust.cfg
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
index 2188c7fed2..fda964e78d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -77,3 +77,7 @@ KERNEL_FEATURES:append:powerpc64le = &quot; arch/powerpc/powerpc-debug.scc&quot;
 # Check again during next major version upgrade
 KERNEL_FEATURES:remove:riscv32 = &quot;features/debug/debug-kernel.scc&quot;
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = &quot;textrel&quot;
+INSANE_SKIP:kernel-vmlinux = &quot;buildpaths&quot;
+INSANE_SKIP:kernel-dbg = &quot;buildpaths&quot;
+SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://rust.scc">&quot;file://rust.scc&quot;</a>
+KERNEL_FEATURES += &quot;rust.scc&quot;
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#225242): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/225242">https://lists.openembedded.org/g/openembedded-core/message/225242</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/115908712/3616765">https://lists.openembedded.org/mt/115908712/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------PWcNqMTh6byx0b1UrhRlFUHA--

