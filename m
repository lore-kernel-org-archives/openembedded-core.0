Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1DEC36017
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 05:52:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.45435.1743400354223278250
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 22:52:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=61856e1cce=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V5PnfI000306
	for <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 22:52:33 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45pgck9dnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 22:52:33 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52V5qWDd007165;
	Sun, 30 Mar 2025 22:52:32 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45pgck9dnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 30 Mar 2025 22:52:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VP5B8e9VEoDLHzR9RxKgm9jgLBUI/ESHLQSWdIEEg4zgeTh4g8fzbaiX4mO8dortdfouAlzObmfOg1PfYZakUx892wO+PfK71YRf5ZsY5bmpucuwrfLyYtYTXbyK+rTk2jeoCtdDReFxw3i7jN3ZbZFRX6vT2tx9s6Maa+K0KUoaS7Ogt4miy/HvrK8A0H0Hz0NLRmrN8qaaN0d0wVlqS8h4pcioXoaxMTODED+Zwigd4HylqWJGDDat6RrteBlylSIo8caQVtQ9tvkk9zaV2pZoDRG3ylraAOVFAmk2Z44rkq3r5PxQrsjZqwjlwZTNpFDNzbUPnnnmjb0VRGpnAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HnLeV+4Pjl+49Pfl3NEh8uijjtzTK2kBPYoGZRvXu7c=;
 b=PDDDVbjEkf9096bmxuR38hoDSpSXrwZaII9LHVBAPVYYQyHVQLIMEQ9Vkg4BY84j+OYEJjDLKKeFIUVWsb5JPnAIw0fpPFmfVH/F3eWv4KzFcSY7CUQ7mCn4hxRb4kpftOG3azB63WIT0u6MJTI03NlhCeM46s25T3+3ROPwqZzVQT219dXDqMfazWw3JpP3BxXDdjChtEQ9vAn0DAkqbcgH42DO5j3azQwhSHQ1h1JblVw7mh0R+78DxD3yHFYcio50qv1f+wFEFTvD5X2mANTnxy1wLSFjbljeH0n8TOtJ0JDo9Se0t9DrxaNjxFl7eYeawvunoTGl/6oBRpxulA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by PH7PR11MB8036.namprd11.prod.outlook.com (2603:10b6:510:248::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 05:52:30 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%3]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 05:52:30 +0000
Message-ID: <d7a8bb9d-42be-4c3b-bd4f-16065ed24dc1@windriver.com>
Date: Mon, 31 Mar 2025 11:22:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/3] rust: Upgrade 1.84.1->1.85.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        koen.kooi@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
        Sundeep.Kokkonda@windriver.com, Ross Burton <ross.burton@arm.com>,
        Jon Mason <Jon.Mason@arm.com>
References: <20250328143005.880998-1-Yash.Shinde@windriver.com>
 <20250328143005.880998-2-Yash.Shinde@windriver.com>
 <BB6CE0C2-6EA2-44F9-8B16-8981A0B19BDD@oss.qualcomm.com>
 <5307873e784b5d21f94f5e23dc3a4ad0796b5bdf.camel@linuxfoundation.org>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <5307873e784b5d21f94f5e23dc3a4ad0796b5bdf.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::27) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|PH7PR11MB8036:EE_
X-MS-Office365-Filtering-Correlation-Id: b3ffae6a-d53a-4e39-d345-08dd7018394e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bHVkcGhtUWUrenZBL0lQS2U2VElXQ2FrcEt2azBTcTcvU01NNkVLMjJOaWNo?=
 =?utf-8?B?ekp3aU5ZY01PdXMzMjlrMDA2ZXdVUGQ4NStXTzAxKzRCV3FkL294U2t5MnNQ?=
 =?utf-8?B?Yk1HZ1ViSTJkdFJHVHBQYjg2bUxVbUowY0tJUHhuZVJId1BaM3NlNENqajcr?=
 =?utf-8?B?RUJycGxaRkhQRktPMEdDQ0FFZURpQjZKR09TRHN2anpEd2txNTVjWjFQdTVS?=
 =?utf-8?B?OXJKVHhISnlEek9CQkhPZDhzaEg4Y3VRTkthek5hYjlzaXovR3AweGpVM1ht?=
 =?utf-8?B?UjVRMVJEcXpSOWlzcjJmc0dRUXNNWjZZS2RDQWhabVJidy9idi9oSlBMNWEx?=
 =?utf-8?B?bVRFRlA5NDAyZWx1V3UrSktTc0Y4c2xqekpWcUNrdUdCQmp5RGoxM2hrVHhG?=
 =?utf-8?B?MFJqVWg5VUlmOStxWG5IbGJnVjMwTStrQWFibG9CT2VzUk9pY2M4QlFzM29T?=
 =?utf-8?B?a1IrSEs5SzIxM1duTElITDhNMFZRV0g1dzdyVXdFS2FvcGtKdFU4RlE5VlZI?=
 =?utf-8?B?ZUJ4SDlHRTU5SExDOHoxQmNwSHNVU0pGWWdhZDVrUm5IQVBsZWZaTkdQYUpy?=
 =?utf-8?B?UitjUVlCQnAwMnlKYUhRT2tlWS8zejdtQXVvYjk1VGViYzdHNk9jYVFXc1A0?=
 =?utf-8?B?V2JIM1dQci9jdjFhT1ZncElaOVA0WmhhRW9RL0s2azFUWTlIZjNtRlhOTjFY?=
 =?utf-8?B?dE9KYUVhUG5ScmNkWWt6MTNZT2RnUWM3RENpUEtrakxTSlFNb0ZjTnZjazBa?=
 =?utf-8?B?VkszZkVoMDlVNzMwQnhXMVMwOWY0THNhTzdwUEl6YVRFb1BjeXExR2FkOEwv?=
 =?utf-8?B?em9LOWp0OVA5YUc4MEd3eXBrYTg4STVKU001UGtrMUNHRTYwMU00dWU0SlBB?=
 =?utf-8?B?SituUUhiWGtKc3dKaFJlQ3FmcTFYSlJIUE9qWk9Qb3VNMzdsMThUcWxMSWhM?=
 =?utf-8?B?UlpGakpzOUNDYUxlNWFReVFtcnNUV3BXRmhFSHFnOHBEVVpuTHRlL0hqMnND?=
 =?utf-8?B?YksvelZXUmViVU51eWxVNy9vWTQ3RzFlc0c1eVV1NWx6VlE1N0QzVUc2STh5?=
 =?utf-8?B?SVpJdWlpOGVoaUI4Ky8rRVg1bjFDSzdxNWF5ZTJibW05V2dZOHhYeW1ZdXhK?=
 =?utf-8?B?dS9uTWgwNzZPczdISkg2bityV0UwbFgrQWRUUU5kekVRTlA2UnVoNWh2bmM0?=
 =?utf-8?B?TnI2N3c4RGJlcjVQUTJWYmt0UGtDYjk2Skx0QzBXYzVlbnlJM1QrdTU4bGdN?=
 =?utf-8?B?WXd5T1ZCRHlzR0FOMi9ERXdMVEg4czlwaC83dkdTLzNocm91bkN6MS9EVVRn?=
 =?utf-8?B?TVlmazlZZEVqSmJRSHUrKzZkQVRCNUJyNzhjK29tOTVqYmF2TXVrUWpQN29p?=
 =?utf-8?B?N0d6TStSTG9rUXhIMVhyM1NFRyt1SWl6ajc1OTdkWkpGRThWUURtYkxyV1pw?=
 =?utf-8?B?VWdlKzJXdDkxdnoreTVSSFdkNVZIUlRNamdPS1oxTWdtdXZQM0hGT2U1WlQz?=
 =?utf-8?B?TmNwUklINUwwQ3owWE5lN216bXd5djhYTjVOMzRkcTdqL2xzQURqdTBjYzdh?=
 =?utf-8?B?dHZ0aExSYSt2VzNFZGMwS1pNZjFYUXB5ZFMxdWI4ZFAyYVVsZUhCamtmbFdO?=
 =?utf-8?B?eDUzcUJHWnNUbEp4UFNMVnFNNzNmSjF1NWRWcjNJaGQ2dmRyVzUzRmhrVlN1?=
 =?utf-8?B?L3Y5cWI5YmpzY09WN2IyLzJES1BHZWNURmtodHFuS1h5dE1KMW9QaWRMQVc3?=
 =?utf-8?B?S1VENDBvdVQzenhpdkhLcHlLa0lMTFNkbkNKanlkeGJLZW5tdHJhdlA2Zll4?=
 =?utf-8?Q?UW+VNiQuAX5uABUUVSJUE6sYwvLqSlUMXqeUc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eDFPSWdwdlAvZXFtUWVvd2VLZlJxdHpQdlpaQ1VSd1AyeFlHRFE3dzZBUXRy?=
 =?utf-8?B?KzhsVnNreHdwQVc2ZCthVjNpSi9TVmltekltS2h3N25lejJwZnp5aE1VR3VF?=
 =?utf-8?B?SnBicUVkNlpxdkhKTWh0YUJReGV6Q0pRT3Q4eDJMaXRua0x5SU9XZFRtSUsv?=
 =?utf-8?B?TWFOSkdHSWFkakNJeGlJL2grQ3NjdWpVUHNwbnhIRExKRzVCWXdIU09rT3N5?=
 =?utf-8?B?R1JSNUZNK1EvMUNKcWFYcXdnVExEbDVXMElydlArcDN2VUFtTGVUSHBPN3FK?=
 =?utf-8?B?ZS9CLzlzcXN4d21RV1JpZThkd29US2pqMVowNElCQWFTK1VDanc1Zytrc2dO?=
 =?utf-8?B?SXZlUUozOGRFZjYweWVJZVJ1UnZxM1VJVUJYU0IwU2tDWEZORlU3ZmFBNFpQ?=
 =?utf-8?B?ejR1WlVRSVZ3YklMRXA1bzFsYk9xZVJ3eFM1T1hzR05JMHpzY3BROElCeTg1?=
 =?utf-8?B?b1ZJM0c2YjVvZWhRTFBTV2tXVzhUVXhMQ05ySHdGM3RrejlJLyt6cExSZjl0?=
 =?utf-8?B?VGwza29ldHI5VXAwdG5LUWRIQzBmcHNhWDV4RWkrRWlPWHFYTkFBVnpGd1F4?=
 =?utf-8?B?QldJWXcwaTA2Q2hmTW90eE5vcUJib3JlVEJqQ1dSWkxPZDIwcGkyc0hzNGtz?=
 =?utf-8?B?dS9VZjZQZWV0akNmdmxjZ3ZtYmtJWDFlRDdmdmhOQ09QdzN5T0RYUVhoeTlD?=
 =?utf-8?B?Zmw5UkVEVlM0eXBKTHpkT0F1TXA2alRJcUtjVDNpMDFQN1VOK0ZTUHE0dldP?=
 =?utf-8?B?RTM1ZHUwVFBoWVZtS3BXeitPQ0p3bmQxRHpMWmxEOHpHSmM5OXd6WkZJOERI?=
 =?utf-8?B?YUlhQXAwU2t4M3JMYU1PVThudnVhZlk1MkpkenovYWlWK29uYWJHR3J2R3NY?=
 =?utf-8?B?WEZWYzBwQjFlZDNjNG5FODFGQWU2citiQXh4VWo2RUpiV0tYam90UlNHdk50?=
 =?utf-8?B?VjUzV2JJMkNHbjhPUnpzcS9RYnljQzhwM2xINFVUelluU2pWSSsrVzlEWEp4?=
 =?utf-8?B?R1Y3WDRPUzc0NzNtaWRBQXdJKzVITm1uYldiY1Rva2lmQ3QzeFdkRS9xVU5t?=
 =?utf-8?B?d0k2OHVCaVhxTEJHV0JkUHkvWlNHR0dIYy8xS0RDMEF3RnNWRFdMcy85azZl?=
 =?utf-8?B?WlFqUlhKTkgrTjZFaVlrcnBMbkg3RGMwaHBISlNUeFB3elRlaUNpYjZQOVVE?=
 =?utf-8?B?Ni9mWE52Q3pPWmM2VnI1WEtrcGU2VDRpLzNkakFoTFFpa2RpVEZyeHo5bHZC?=
 =?utf-8?B?TVFuYkc3aG9WenZLc1I0NEUzc2h2RkRVejVXRG9NWERacFZOMHhVc1pQU20w?=
 =?utf-8?B?NWd2RG41c2pMS2ppVC9xUlJoald4QnU4S0FRWWx6ejU2eFlHOHNFeEVSMERt?=
 =?utf-8?B?aWl5VVpqYngzSHROZzVNak00MXcyMGJnNkpZOE1BdVFwbmdLNUVxYVZCc1lI?=
 =?utf-8?B?T2FlMm5NS2Zia0MvM2lnNkNTa3JkSEFoRXZwM3lXTDBaN0ExMi8wbzVSRm04?=
 =?utf-8?B?dEJZUmNnbXpoaTUzbEtLV0lyTkZuZ2luOWEyYWxzOU5KNFF0Vy83c2h1MFVu?=
 =?utf-8?B?WVBqMzNNWFdQTy9HMFdjaFI0VExnQ1cvc2JXYVUyQjREY0R5SDQvSnNQQ0JW?=
 =?utf-8?B?WlV6dkVmdUtRQWtabnZweHcxRUs1aDh0Rzdua0dqWU56Uzk2cFNab0dHM2RO?=
 =?utf-8?B?RmlHM0kwT1MxbVlrbE1KVFhWVG9IK2JxR2tPU1JwTzcrWUprSjFsQnE3NzlC?=
 =?utf-8?B?RUdzbmRkVWVaRWNnZHJjak1iQyt2UGJ4UFhLVFZ6KzlLOVdhajdaSE5hd1Z5?=
 =?utf-8?B?ZzhvQU1ZRlpzaDFQNE9zYkNPSzNyUmp3WHVjZWRwb3VQeTc5WEk4ZFE5aThD?=
 =?utf-8?B?ZHNUOGdURXI3UUFrR2M4KzJUTFVockM2TXhMTGhoSjU4Umd1Q2Z4VzBYajNy?=
 =?utf-8?B?VEdCVzJoZW0vdHBmaTVkRVpWS1Z0VksrTjFOMmhkK1lMZzEwa05IamtTb2g5?=
 =?utf-8?B?cHNCdzV2bG5wekVPTW9GVGtvU2NBZ0cyQ1d3VGREZEUxUEIvTDRkRGhaKzk3?=
 =?utf-8?B?d1lBQktLdFo4WG5XNUExZFpPN2JoaGhlek4zSCtsY3hlNDUrcjJYMTYwTmJk?=
 =?utf-8?B?NHdodXN2Z0twaVdFY3ZIWWVjNVBSQVZ6MkxDOE9JR2tlMkIzckNrbm9PWXJq?=
 =?utf-8?B?UGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ffae6a-d53a-4e39-d345-08dd7018394e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 05:52:30.1126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPCqrpo7E8g1gdPX0Lss9mD2rqCMNFdYe9OLr+Pz1aWpLc4WsP+ARQxckMJHgXyn0tCvVPFh1hJzmLJFSXYr6JdMJYF/Hj3u+0fXdDikTeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8036
X-Proofpoint-GUID: HFlQdb7D72Bd3s7lS4ojxhi7pjlBsj9C
X-Authority-Analysis: v=2.4 cv=Paz/hjhd c=1 sm=1 tr=0 ts=67ea2da1 cx=c_pps a=19K1aDEwnJ0RahI1emVHDw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=aYMb5APv3qqtVdVCpDoA:9 a=QEXdDO2ut3YA:10 a=dI7qjkOEfi4A:10 a=8zIOOLb7Ym0NljyPXbuS:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Eo-vcIa-8ru_GQ1PKhYX6ehFH3qVnA0F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_02,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503310040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 05:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213931


On 28-03-2025 23:21, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Fri, 2025-03-28 at 16:17 +0100, Koen Kooi via lists.openembedded.org wrote:
>>
>>> Op 28 mrt 2025, om 15:30 heeft Yash Shinde via lists.openembedded.org <Yash.Shinde=windriver.com@lists.openembedded.org> het volgende geschreven:
>>>
>>> From: Yash Shinde <Yash.Shinde@windriver.com>
>>>
>>> Rust stable version updated to 1.85.0
>>> https://blog.rust-lang.org/2025/02/20/Rust-1.85.0.html
>>>
>>> Some of the major updates:
>>> [...]
>>>
>>> - Explicitly set float ABI for all ARM 32 bits targets.
>>> Fix: https://github.com/rust-lang/rust/commit/a51fefcaab835b310e2e26005b50982d0049d905
>> In OE we allow selecting the ABI using tunefiles, so this hardcoding to hf will do the wrong thing for non-hf builds (which are rare, but still).
> Well spotted! The patches did fail in CI on qemuarmv5:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/1207
>
> so at least we actually caught it in testing too.
Thanks for the insights on selection of ABIs in OE.

I have updated llvm-float ABI for rust target config based on 
"TARGET_FPU" set in OE
which should work. I will send a v2 with that.

Regards,
Yash.
>
> Cheers,
>
> Richard

