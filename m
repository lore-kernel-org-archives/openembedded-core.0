Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18EB0D5E128
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 10:49:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19470.1765882163856638137
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 02:49:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jLaJQBNH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44450448cf=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFCGHqp2623297
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 10:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=nmle9PPeTWgNWrKIIu2FcU5eec71EdfmJisZQV+5U4M=; b=jLaJQBNHDltQ
	a1zLdQvLTYJLy1kTQB6+n539sa2DN7aOjeXtrwi5OIn5hFXU8zEzRDqxaFkcMFtD
	+ds7k8jiypx8sJtJMFLHB510K/3zRVZPzUFiGe7iSJ5WoRMUc4nj9GWIC4dcrH1z
	qtJEBfUPMueYhxCJbvhYJU8ybmzjFLW/9z0MvB2523TLWfHJiOMZ5D1AFAToS6o9
	m8Su0iwfQd8vpbn6/8jFO8k5PPxZqubxblPGBBRH9igYT3x+fxU4IdyAM7GyOyhM
	VIIGqARMzXUQbnYy9au9BD6aioywxBD2YpgYeTYTw7DOab8B4MYlVrWLZurXucYB
	lRpfuuXmdA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010004.outbound.protection.outlook.com [52.101.61.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b0y48b0na-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 10:49:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6LLAYcK1TsK3Nf5ySPZWI6VLfdVNfKA+PjhFzlHfIGnkn1q6+1f3t9BDnogu1Ea262Qg/NH4ncsXFhOKXOcJLaf3LDMI37I4AkEjvE+VqyJxTN8VUMfYJhtWr4Yrp2UNDY9BKd1SqGsAN2QPY23hlMwZm/0TAtNuyzAI/ThyNIbNAh39lCLDjL+dPW8YL+PFxxjPdz0F2jZP+hc8W1j+w5nEdQHTJmx8loEJQf3zO7OL4xywSSRE0QlTPGiYyi0JhPALqE5zZ2RxZcoaeZ1zS7cZ6BYUpFFNNtKw4Tt550btah6g37fH4+GRsuzmNdSFtlPDOe3qdwItUqq2DXYnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmle9PPeTWgNWrKIIu2FcU5eec71EdfmJisZQV+5U4M=;
 b=hPVM0LZotXcKtALYxRdSg3yXJVOvQUOpIN0Jw5vtdaswG3QtSqzfFWVGpoNL2mKlvlEVL5ZuMLNyfojKf580vSOtdnN3zw19li/SgUhQpDdzjl7bzTuakG3gR70vPY7mRcHqRLzysNB+ogszsM6MgnJZhjF1HHqxwOxUZNsFFsR545PX2x+Pz4Qe8ZTwzrS7QGtMXpywSBqcgkW3Si0OHsIcgWJ38w1i67pDa+8X2A15nMIrw0TGtX2U29BPVVpheFpKrLHKMM0y0x7NpKUR3kctOEksjku0L6uyUHvsVS4+J1BARo76OwrIld9ZWqkkNJYKPTUozi7BGTJ1FLx7bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 10:49:19 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9412.005; Tue, 16 Dec 2025
 10:49:18 +0000
Message-ID: <c0d06db9-f163-4421-80ae-97136b09d6c5@windriver.com>
Date: Tue, 16 Dec 2025 18:49:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] gstreamer1.0: install Gst-1.0.gir to
 ${libdir} for multilib
To: openembedded-core@lists.openembedded.org,
        "Burton, Ross" <ross.burton@intel.com>,
        Randy MacLeod <Randy.MacLeod@windriver.com>
References: <18807B69349A79F6.984558@lists.openembedded.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <18807B69349A79F6.984558@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::23) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|IA3PR11MB9136:EE_
X-MS-Office365-Filtering-Correlation-Id: 42d8a6a3-fc03-44c8-1108-08de3c90c33c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|4022899009|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Ukd5T2ZreUlwNlIzaUVNcUNRT1FOckdHQ3lvMEMydHFPWGFtUHYzWXFrckVT?=
 =?utf-8?B?TEpjZmdKMzcyQ2Y4TmdnVTFHdE14cWRBbVBxZXUyNWIzNjJSRHo4LzRSRkM4?=
 =?utf-8?B?aXdLNVBLRU8vaEdTMC9tbG9JdjB5UGg1dzdSM3grcGRpZURhQmNkVzEvOU40?=
 =?utf-8?B?Yzg4eUdHN3JiWGhnc3BDNUxrd2RtcEh5OER1Zk1SSFp1Snh1QjVHZXdKZUFm?=
 =?utf-8?B?YjFQblV6RFRadkl0ZHBDWHBYeW9zdjJ2UmFDNGw5NVo4bld6YXd3YkR1V1RO?=
 =?utf-8?B?SzdxT3N6WEtZdzVBU2IrQzBmQlhVQUE4aXpVcTFCQlJoVUhUYlQ5WFRLcXgy?=
 =?utf-8?B?ZG8vODBLVWJScVM2cTBCU0l6aVJlZnpRcy94SGpiOUxDaGlYWmxwQU4vWEZt?=
 =?utf-8?B?eVdUSnB0UUhNZ3FkYW5UczZoZ0hrWTBsa2E1SVhSVVdvTnJQY1JXWWtMclQ2?=
 =?utf-8?B?N3M3YVdTdjF6bFBzME5weE9HemdMNG5iS0QwRDgyZk5MbFFwQisxZS9JQzcr?=
 =?utf-8?B?V1lla3d4bzZkbjREZHRkVkVPTXlkYzFKYXlJNkFDNjZ6YVJDL3NDOWNTN3kv?=
 =?utf-8?B?Yko2NC91TjhPWUwya1BuWGY3eXl4YlRwNldCTytabFVyMnFzR1ljRFc4U01K?=
 =?utf-8?B?dG9uRlZQTlI1RmgxUjZHMVB1VDJRaDgzdlhzczl0U3ZNcmZqSlFVUTMvQW9l?=
 =?utf-8?B?d2hZditOWDg0eC9oenozcEFzeXprQUhhU0FVSVB0L0s1WFlsMGdGeEQyTDdw?=
 =?utf-8?B?NE1vUmJ2WGk1VGlJU3ZFdzFTSTNRSGRwMUZ1S294WVpleTJqRkFNNFk1TWRU?=
 =?utf-8?B?dzlaQ1czWFBrM1ZQcGhtRVJoaW8wYnprR0ZUTE95ZHp6TGhBcEgxYXFOcDBy?=
 =?utf-8?B?MHhmcHFCQkpObTZER1R5RGFvYzNzSEhKUnhOYk1mNFlHNmllR2lRcENTWlZZ?=
 =?utf-8?B?SEJSUVZFU1praktoUzhMcUhUZXowWWpvaHFFUEdPRzdqdGpkelNiclJPQzk0?=
 =?utf-8?B?VVhWWFRzbkFKMWVCbGxiK3BHUXJqN2ZWdXB0THpTbEc3VHZhbWs3UWlPTWdm?=
 =?utf-8?B?TmxsbmlSak50VStUbUNhTW12VHorZDBRbXJZc3R3M3ZieFZRWXU1TEV1Q3gz?=
 =?utf-8?B?TEFid2hYNnphUnMwNUxpMUlqdkdKTHZITUc4TXJVR0lXd1UxTXd1bjJpcHQw?=
 =?utf-8?B?NVR5SE9WVWZkcFY1MWdZeVB0SGNicnNReWNwNWhyQk1CU2ZaMEd2RVBuUXV6?=
 =?utf-8?B?SmVuQ2piSDlyOEFYYVMwTFYxTDY2eTU4YjZac0Z0Y1V2TlRxSlloTHo5N3cy?=
 =?utf-8?B?UzREb01qb3pUNktBd3NhU1M0ODFxd1NMN1VPYk1HejNHQ215eEYrbW1DMDE4?=
 =?utf-8?B?eWVuTWlCWGlmVmJlbGRoNG04NGw3LzhrNkhqaUZTZ0Z6Uk9oaC9jSUJleWJ4?=
 =?utf-8?B?ZWw4SStaNVZOaFhBUFFuUXRNVVNPeXRWczVmTDY3SjhQekRncHQ1M1BMS2x4?=
 =?utf-8?B?c2VKKzZWM2FlUzNjNkxaOUk0RHJvc05MdWhLb01VNUVaMG44WjFWRnJKMlFZ?=
 =?utf-8?B?aS9LZUQzSGZxQmx6WFVkUGIrZXlxU01KWEN2MmZzVW5pcUZmZElYZTdyZFBN?=
 =?utf-8?B?M04rcWpxZXpWS1lkRTlpOVdBZk5zQ0dKeHRpa2JKSmNPYzc1bnNuODlHTHhC?=
 =?utf-8?B?cityVXZPRTNWWXVoNzlFRk9uWXNBL01vQzd1ZU1rNVJyMnRIR2hsZENrQStC?=
 =?utf-8?B?SGV4RkxxWlFvcllnaUFndERIVWJ1TkVLbDh2Vk9mbzBQbXltaDg0aXFpK2Zt?=
 =?utf-8?B?dkZnNGJvSGFPOUFIM2NIVjc2R0ljNjRKVXRPWHlNZkZEK3Y5Q0ZNTWRYMSs0?=
 =?utf-8?B?c3h3OTFLOXE3K2YzcGNlQzlzYjc0MW9aSVQ3UDdqQTFOaWc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZkJySWM0TkNwSUV6Tkp5QlY4QjFPK1FBTnhLREVYREhNSVVIeU9kTVloM3F4?=
 =?utf-8?B?djVxRTB4Vk00czZKclpmOXM4TFJyY25oSjZlZ1hwME15TlU1eG1HcWFhdTIv?=
 =?utf-8?B?cDdkYTNmcUMzNFBwVndXY0VVNmR1bmNCYWVlNVVRSks1SnM0aXI0Rk9sVVda?=
 =?utf-8?B?RXBxRDlHa3I2ZmNvUEJpZXZnWWI4KzdZcG96MGhqK1RzZVg5dEhUNUx1MkY3?=
 =?utf-8?B?L3ZmQnJreGVEdGhWQ0dkMjdBS3dqMThBbWQraWw5bTIyQlpWbFY1MG5sZStT?=
 =?utf-8?B?M3hGSWJNVVlUVjNCM0lJa3lhYmNxZFA3b0FUZE00OWRjTldLZEt4NEMvVUh2?=
 =?utf-8?B?R2Y3NTV1U0Y1SStUM3lmYmkvMVlsd2NUSlpOd2RtRWgwOEgvUWV1UExjREIv?=
 =?utf-8?B?N2Urb0V5Mm5LSyt4ak4rWFpaTUViMXlVLzI1NlZNT0NPZEMrY1c1MVQ0UzEz?=
 =?utf-8?B?QmRKK1hpeUMreUFSVEh0YUladUtCejFwY2ticlZzd0VsV1lKbmhlTSszSTF4?=
 =?utf-8?B?WlVLRm9HaUI1aGtpZ2tkcEFrUGFNOHZLY1lYTVFNdXg3VWJXbXNTc0ljRHFK?=
 =?utf-8?B?Z056YXB2bG1rUTU4TFVzQW90eTNwMFNGMzVZQm5SSGZ5QTlLSkRWc3ZPTEZP?=
 =?utf-8?B?cHFXQ3o1NWRtaWUxT0VMMlVxUWJFSmw0QTg3VlFDbnZ1T3dqbzAyaWhZbkMz?=
 =?utf-8?B?N3cycnYxRUZ3RlovK3M5VGtESEloZklpSHoyVTRsN2czRlVsWUcvM1pUYmZv?=
 =?utf-8?B?TlJmUndIdnBkVG5ZckJDNzZJMTZuNkpyMmRDMFBSMmNFUEtzUlFOanVxZFdZ?=
 =?utf-8?B?NFcxK2RCeC9CdWJGT21KSTJaT01rQk8vYWozblVyVmpRS2t3ZlBZaUpKUm9W?=
 =?utf-8?B?eENIRzE0bGNJL05mMDBLZHpQdVJ5RWZ2UUMwWEZWTWFrMjh5bSt3VWY4L0FU?=
 =?utf-8?B?cEgzYXFnVDRNWWJhUnpZbS95WDBuWGxSSWlFeFlGTEtXMSs2TE15cUhHYnJm?=
 =?utf-8?B?d0dCNVJ3azB0T1Q4U3UzOCtLWHNCMmdrZm5lVlVIWHlBdGZaeFNUVEpxaFdi?=
 =?utf-8?B?T1Byb29zMVN5WkZlckQvNkFSS2toQ3VSOWpqUFpJVGhER2U1ZHRZN04wVnp1?=
 =?utf-8?B?NE5HRzFKUWx5RTY3L21DYmtPNE10K2ZNYjBlMVdXSmxXQmVFRmYrcC90OS9Z?=
 =?utf-8?B?V2diWmZ2NzEvS3cvazBjVUxCTkt6TWFNZWlZLzFXdkJDbzJabk1xczhzZ3N6?=
 =?utf-8?B?TWEvY3RldjNVd0RCd0I5dHpuOHFHc3F3QXlTaG1BUGRPRExYNVBndGJpVjZP?=
 =?utf-8?B?b3kvSE9CNTJQUER3MlJ0ZUQrQ3ZQamlicU5jeDNhRTFsNkZKSVg1dVh2cjcx?=
 =?utf-8?B?MDhrekNkeiszc0dWcW55MTM4aXRqa21jUXNxSDBoNEw5OU82aS9aaTRaczl0?=
 =?utf-8?B?aVhlWnZ3Y0JTa3prZXk1RzY1R2xkajFlQjhVYVlFZHdab1dKbGNSQ0xKWmUv?=
 =?utf-8?B?cDN5d3gzRGpuMkFRTXZYbEY0MjFNQk5tYmJhN1k5cythWENJa25qaGUrdUEv?=
 =?utf-8?B?TzBFY3lXNDFrUlRJTU05RG02R1RaZXJocks4Tmw0S1lma1VhSTdLMmp4SnhV?=
 =?utf-8?B?a2RTRktsdzZhK3NjVnNjZnA0Ulk2QU5WaDlNb2ViWEwrZDRHY096c2Z5U1FW?=
 =?utf-8?B?Zjl3eE1xMy9wTk5SR2xQVGp2WnJZT1BCUHFKYUpxblozdVFSSHoyU2ZaZWJZ?=
 =?utf-8?B?b0F0YnZCTlJYNTVIUU5CdXNPSjJmTG9JRUY4WGxoRXV3TUhIcmhWVTVqRWFI?=
 =?utf-8?B?amhBWFRhYjFIOXR3bGNGVlh2ZTN1Vm40NDVvYmkySFgrMmE3eS9ZSmVKSFIr?=
 =?utf-8?B?RENNdkwrTW5yTXJTL1N6VGI2VjZvYm5VSXRvZ29IYkFPOUFSeWE0QlhmUXJh?=
 =?utf-8?B?ekpBOUQ4TVl6dHRqQ2VKQjZORVVUbGRabE5wZjRhVHlldTdQc28waVJ6RWpZ?=
 =?utf-8?B?bDhZTjBlK2UvUmVOUW1pR1UxRjBGYjJFVHNkNlc5NTBBZm0xUDR6a3pSemda?=
 =?utf-8?B?L0l6WUlKLzc5cmg4Z2g2VG11OWYrWnZ3UFlHOXZVK0dXVWlSSFplVDI2VHBm?=
 =?utf-8?B?QlhQbmxMbjl4NHh4ejgyeHZzKzJZblNkcWpNUmhnaVFFNEx0Q2hKSWhHSzhJ?=
 =?utf-8?B?Zmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d8a6a3-fc03-44c8-1108-08de3c90c33c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 10:49:18.4591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2v2y6auRCY0KuPH0Mb6uBwdwgWl4A0GsX346kPqkDrWqZOCoJwObOwnzYUObNBqRZr/ZVvUi/iMCq+qdra3NcUewyjudNxoBN5ZSXXc5/qQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9136
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA4OSBTYWx0ZWRfX9aWu9cdUAM+J
 LlIm1aBSw5AFlej7lb9Nd4/v27hWbUq+QTiOa34s6SoatoovBaM1CwliqkqVqP2yW0ZMOWYqdW9
 3dZ+JpgWjt3bvXSfTFp74dpGME79YtFtI/0ARHswU5E7B12X3ZTVov4pzLHDeWn41Tp6vhIs1A5
 J/fTjeVN0T3IiRXtd3s3Jvt7llrkfH6L+xI5UuM2AUkvygKP46AJdGTcsmj9+6u2ukfrBGo7gXF
 C91R2m7ep3UGPnoV8GN2xlSe7GZWcqfGFijOWcsbYnAo4KoHzCkkz3lon03VRMhZDHUYt5KZTwd
 rBk2NR9PCBdq87gQidxA7jnCU3UIT8+cBXmV47kcEDOWHng85jI+fFiXf0Z1uIJ3xupbqVL1Ds5
 GumzldB1azgdcepIgrRPYuv98R4eEw==
X-Proofpoint-GUID: InthjVD0yumJ0APKinI99eMSSwekPeQ-
X-Proofpoint-ORIG-GUID: kQB4eYK--HBlQMc8S8y3nnFWQ1_B3xIi
X-Authority-Analysis: v=2.4 cv=e5ILiKp/ c=1 sm=1 tr=0 ts=69413932 cx=c_pps
 a=R4qMYQySjg0trGpnu7oNJw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=VEPjROmMFbg3a2tKRtIA:9 a=QEXdDO2ut3YA:10 a=Vxmtnl_E_bksehYqCbjh:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512160089
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 10:49:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227942

Hi Ross,

Randy said you had concerns on this patch?

//Hongxu

On 12/12/25 21:39, hongxu via lists.openembedded.org wrote:
> While installing 32 bit gstreamer package and 64 bit gstreamer package to
> one rootfs, package management (dnf) reported a conflict failure
> |Error: Transaction test error:
> |  file /usr/share/gir-1.0/Gst-1.0.gir conflicts between attempted installs of
> gstreamer1.0-dev-1.26.7-r0.wr2500.corei7_64 and lib32-gstreamer1.0-dev-1.26.7-r0.wr2500.corei7_32
>
> Due to upstream commit [1], the size of padding differs between 32 bit
> arch and 64 bit arch
> ...
> |typedef struct {
> |  /* < private > */
> |  gpointer pointer;
> |#if GLIB_SIZEOF_VOID_P == 8
> |  guint8 padding[8];
> |#elif GLIB_SIZEOF_VOID_P == 4
> |  guint8 padding[12];
> |#else
> |  #error "Only 32 bit and 64 bit pointers supported currently"
> |#endif
> |} GstIdStr;
> ...
>
> It made the generated Gst-1.0.gir be different for 32 bit and 64 bit packages,
> Install Gst-1.0.gir to ${libdir} which splits 32 bit and 64 bit libraries
>
> Submit a patch to upstream to add meson option (gir_dir_prefix) to override default
> gir install location (datadir). When multilib is enabled, install .gir files to
> ${libdir} other than ${datadir}
>
> [1] https://gitlab.freedesktop.org/-/commit/0ee18781f9b210129da23a85236266bf84bafa83#f9880c83c8bdc4d61ac7d51a4a212f602cad5d86_0_39
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   ...ir_prefix-option-to-override-gir-def.patch | 149 ++++++++++++++++++
>   .../gstreamer/gstreamer1.0_1.26.7.bb          |   3 +
>   2 files changed, 152 insertions(+)
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-meson-Add-gir_dir_prefix-option-to-override-gir-def.patch
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-meson-Add-gir_dir_prefix-option-to-override-gir-def.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-meson-Add-gir_dir_prefix-option-to-override-gir-def.patch
> new file mode 100644
> index 0000000000..506e33c61f
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-meson-Add-gir_dir_prefix-option-to-override-gir-def.patch
> @@ -0,0 +1,149 @@
> +From 6fb2149fc5c7b1805c138a52990305a4f53170fa Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@eng.windriver.com>
> +Date: Thu, 11 Dec 2025 18:38:24 -0800
> +Subject: [PATCH] meson: Add gir_dir_prefix option to override gir default
> + location
> +
> +Originally, the .gir files would always get installed into the default
> +location (datadir).
> +
> +This commit adds meson option (gir_dir_prefix) to override it as intermediate
> +prefix for gir installation under ${prefix}, such as
> +
> +  $ meson setup -Dgir_dir_prefix=lib64
> +
> +The .gir files are installed to /usr/lib64/gir-1.0
> +
> +  Installing gst/Gst-1.0.gir to /usr/lib64/gir-1.0
> +
> +Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/10363]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@eng.windriver.com>
> +---
> + gst/meson.build                 |  1 +
> + libs/gst/base/meson.build       |  1 +
> + libs/gst/check/meson.build      |  1 +
> + libs/gst/controller/meson.build |  1 +
> + libs/gst/net/meson.build        |  1 +
> + meson.build                     | 23 ++++++++++++++++++++++-
> + meson_options.txt               |  3 +++
> + 7 files changed, 30 insertions(+), 1 deletion(-)
> +
> +diff --git a/gst/meson.build b/gst/meson.build
> +index c69a6dc..ebe673d 100644
> +--- a/gst/meson.build
> ++++ b/gst/meson.build
> +@@ -322,6 +322,7 @@ if build_gir
> +     'export_packages' : pkg_name,
> +     'includes' : ['GLib-2.0', 'GObject-2.0', 'GModule-2.0' ],
> +     'install' : true,
> ++    'install_dir_gir': gst_girdir,
> +     'extra_args' : gst_gir_extra_args,
> +   }
> +   library_def += {'gir': [gir]}
> +diff --git a/libs/gst/base/meson.build b/libs/gst/base/meson.build
> +index b7aca73..2fb0590 100644
> +--- a/libs/gst/base/meson.build
> ++++ b/libs/gst/base/meson.build
> +@@ -89,6 +89,7 @@ if build_gir
> +     'include_directories' : [configinc, libsinc, privinc],
> +     'includes' : ['GLib-2.0', 'GObject-2.0', 'GModule-2.0', 'Gst-1.0'],
> +     'install' : true,
> ++    'install_dir_gir': gst_girdir,
> +     'extra_args' : gst_gir_extra_args,
> +   }
> +
> +diff --git a/libs/gst/check/meson.build b/libs/gst/check/meson.build
> +index 679a15d..e934526 100644
> +--- a/libs/gst/check/meson.build
> ++++ b/libs/gst/check/meson.build
> +@@ -86,6 +86,7 @@ if build_gir
> +     'include_directories' : [configinc, libsinc, privinc],
> +     'includes' : ['GLib-2.0', 'GObject-2.0', 'GModule-2.0', 'Gst-1.0'],
> +     'install' : true,
> ++    'install_dir_gir': gst_girdir,
> +     'extra_args' : gst_gir_extra_args,
> +   }
> +   library_def += {'gir': [gir]}
> +diff --git a/libs/gst/controller/meson.build b/libs/gst/controller/meson.build
> +index 9d38af8..411b951 100644
> +--- a/libs/gst/controller/meson.build
> ++++ b/libs/gst/controller/meson.build
> +@@ -81,6 +81,7 @@ if build_gir
> +     'include_directories' : [configinc, libsinc, privinc],
> +     'includes' : ['GLib-2.0', 'GObject-2.0', 'GModule-2.0', 'Gst-1.0'],
> +     'install' : true,
> ++    'install_dir_gir': gst_girdir,
> +     'extra_args' : gst_gir_extra_args,
> +   }
> +   library_def += {'gir': [gir]}
> +diff --git a/libs/gst/net/meson.build b/libs/gst/net/meson.build
> +index 60ed92c..b81139e 100644
> +--- a/libs/gst/net/meson.build
> ++++ b/libs/gst/net/meson.build
> +@@ -67,6 +67,7 @@ if build_gir
> +     'include_directories' : [configinc, libsinc],
> +     'includes' : ['GLib-2.0', 'GObject-2.0', 'GModule-2.0', 'Gio-2.0', 'Gst-1.0'],
> +     'install' : true,
> ++    'install_dir_gir': gst_girdir,
> +     'extra_args' : gst_gir_extra_args,
> +   }
> +   library_def += {'gir': [gir]}
> +diff --git a/meson.build b/meson.build
> +index e2127f6..7ecfc2d 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -629,6 +629,27 @@ if static_build
> +   gst_c_args += ['-DGST_STATIC_COMPILATION']
> + endif
> +
> ++gir_dir_prefix = get_option('gir_dir_prefix')
> ++if gir_dir_prefix == '' or gir_dir_prefix == get_option('datadir')
> ++  gir_dir_prefix = get_option('datadir')
> ++  gir_dir_pc_prefix = '${datadir}'
> ++else
> ++  gir_dir_pc_prefix = '${prefix}' / gir_dir_prefix
> ++endif
> ++
> ++# This is effectively the GIR XML format major version
> ++gir_suffix = 'gir-1.0'
> ++
> ++gst_girdir = prefix / gir_dir_prefix / gir_suffix
> ++
> ++
> ++if build_gir
> ++  gst_c_args += [
> ++    '-DGIR_SUFFIX="@0@"'.format(gir_suffix),
> ++    '-DGIR_DIR="@0@"'.format(gst_girdir),
> ++  ]
> ++endif
> ++
> + # Used in gst/parse/meson.build and below
> + python3 = import('python').find_installation()
> +
> +@@ -680,7 +701,7 @@ pkgconfig_variables = [
> +   'exec_prefix=${prefix}',
> +   'toolsdir=${exec_prefix}/bin',
> +   'pluginsdir=${libdir}/gstreamer-1.0',
> +-  'girdir=${datadir}/gir-1.0',
> ++  'girdir=' + gir_dir_pc_prefix / gir_suffix,
> +   'typelibdir=${libdir}/girepository-1.0',
> +   'pluginscannerdir=${libexecdir}/gstreamer-1.0'
> + ]
> +diff --git a/meson_options.txt b/meson_options.txt
> +index 78af552..97c03c6 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -32,6 +32,9 @@ option('examples', type : 'feature', value : 'auto', yield : true)
> + option('tests', type : 'feature', value : 'auto', yield : true)
> + option('benchmarks', type : 'feature', value : 'auto', yield : true)
> + option('tools', type : 'feature', value : 'auto', yield : true)
> ++option('gir_dir_prefix',
> ++       type: 'string',
> ++       description: 'Intermediate prefix for gir installation under ${prefix}')
> + option('introspection', type : 'feature', value : 'auto', yield : true, description : 'Generate gobject-introspection bindings')
> + option('nls', type : 'feature', value : 'auto', yield: true, description : 'Enable native language support (translations)')
> + option('extra-checks', type : 'feature', value : 'enabled', yield : true, description : 'Enable extra runtime checks')
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb
> index 444165a869..88b1af0796 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb
> @@ -21,6 +21,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
>              file://0002-tests-add-support-for-install-the-tests.patch \
>              file://0003-tests-use-a-dictionaries-for-environment.patch \
>              file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
> +           file://0001-meson-Add-gir_dir_prefix-option-to-override-gir-def.patch \
>              "
>   SRC_URI[sha256sum] = "18a5e214114dc501407697dd458514bba62cadd5414c60f793cf70141a4d0bb3"
>   
> @@ -56,6 +57,8 @@ EXTRA_OEMESON += " \
>       ${@gettext_oemeson(d)} \
>   "
>   
> +EXTRA_OEMESON:append:class-target = " ${@'-Dgir_dir_prefix=${baselib}' if d.getVar('MULTILIBS') else ''}"
> +
>   GIR_MESON_ENABLE_FLAG = "enabled"
>   GIR_MESON_DISABLE_FLAG = "disabled"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#227590): https://lists.openembedded.org/g/openembedded-core/message/227590
> Mute This Topic: https://lists.openembedded.org/mt/116745751/3617049
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [hongxu.jia@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


