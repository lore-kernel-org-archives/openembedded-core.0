Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01723D116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 19:50:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.503.1764618598756723680
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 11:50:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=oWrnBDpx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4430cb968f=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B14trLq3279537
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Dec 2025 19:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=Fp4Uy+n0I3DEMgRAzglaqY
	mjSWZhbqwHwhgy5JLdUxg=; b=oWrnBDpxH+fqHtefMh5eIL4o5Ju9FVVPdlSeoF
	uGOV94+MEl838xqWlkfxbv9X0Ts8GAePlGZ5xYvEcOWWe3vkv6NnBS3tT3igQbvU
	4JmL8wc4i/Z3vSX6DsmgNY6dpbnWc3VDy+gj6RTiy6hnkYL1uBA07MwL5Wsgd2bW
	lBybwBq4OeWY441BgU4/sayD1MFzRaeLjZt6K4+ipFDvLBkbGhs+6rL9muuj9Zax
	4c766/M3I1CzSdx1bhcNWn203h0CH3M/cxwhLtefybfYN4ZgMAI9Prp/aJFgkrdR
	jPqiWaREts5GCX9v2mfNNZ/KEFxXxGfTroJTBSvtfzmEpJZA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011053.outbound.protection.outlook.com [40.93.194.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqp21tas5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 01 Dec 2025 19:49:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P8VM82InKTq4D02Og0p1MOppjfy/Unk+U8OeE7eTCv7SHhcplRh44/kDh2UFT+roBNHdzYFeyo50WJdtIhqZM6icNF6MR8ZdVzKM78tGCLQnlZjp5tmy/2RdnNYWXWh1Dq7CXcYoCBVG4zcIalydF1WEHd+mW5/8XjaIHtXgZsKOiPxoYDwVpjzW/6T/FcqixBKVAQCNwFEqF0eRYHS0VhrKlM8TXyi4+T+BJGPpYmUpJ6rWRaoBfu4hKjwzFBztZjOZtqYbe6wv6O397VgZ24BALC90YubJMfmx+8T4aiQ+8WAIQpm+UQuO6hKBLJtW9v7SpLityD2HgcmlWD34PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fp4Uy+n0I3DEMgRAzglaqYmjSWZhbqwHwhgy5JLdUxg=;
 b=ur1cYhVZd6z0rr5l2gerol5F66MkB+Ztq05X9cDuaeKebMLGB02AB3qKoNtPq0y1iuGQ7YE7EuQAXG8V/NmIa71LGIvKA5Sn4RzT0sffluszemdo0bm2rg/PKdU0tkEPgyZu3dDLUeuxKmXx85KjnYTToL5KlGsVk+ObDoM20HNosMb3CGiOumCY9b6OVKzeRQobbq8gk1egAVYHJ9T5l2GjHoneT2wiQ9GuKhwx7eFjBOpMPG6JUV/E3oFtvS++0Vbj9PIwSOvhNE/DdDkXYMs5v/iMed+7PtfiG1azg4TvZfjx+6Za2BK/6tHtTpfqh29pLleOKrYjIscqb1KxHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DM4PR11MB6453.namprd11.prod.outlook.com (2603:10b6:8:b6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 19:49:51 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 19:49:51 +0000
Content-Type: multipart/alternative;
 boundary="------------as0w4VNRTl18JWSQ4tAXohf8"
Message-ID: <794d6651-84ca-4bc9-9465-d053b68a6da5@windriver.com>
Date: Mon, 1 Dec 2025 14:49:48 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3] populate_sdk_ext, create-spdx-image-3.0:
 ensure image SPDX/SBOM tasks are retained for eSDK installation
To: maganuru.jayasurya@windriver.com, openembedded-core@lists.openembedded.org,
        "Chen, Qi"
 <qi.chen@windriver.com>,
        "Jia, Hongxu" <Hongxu.Jia@windriver.com>, jpewhacker@gmail.com
Cc: Sundeep.Kokkonda@windriver.com, SunilKumar.Dora@windriver.com
References: <20251105121432.3987350-1-Maganuru.Jayasurya@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20251105121432.3987350-1-Maganuru.Jayasurya@windriver.com>
X-ClientProxiedBy: SJ0PR03CA0129.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::14) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DM4PR11MB6453:EE_
X-MS-Office365-Filtering-Correlation-Id: c765ed3b-dabf-42ed-9b0a-08de3112ca89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|376014|366016|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QXIvb1c5NXhyaGk2MUJQTVdaS0FrUnZGc1N5S1ZmV1VWUXR1N0xpVWVMQmZ2?=
 =?utf-8?B?ZWt5eXZLdWtjT1BkR2gzcytCZnBEajRGTWUvVGxUM3RBcnVwN1Q5NGhYbEx0?=
 =?utf-8?B?MXI1UUdUdFVKZ1dXaDFhTWl1aTVMRmIzZWt3b1pCUENDT1pBQ3F5Nk1vMkFr?=
 =?utf-8?B?OXNCUktoTGNLRmhOY05Cc0h5cmNHZU9TRFRpaS95V3ZIL2c4VEE2R1B5TkI4?=
 =?utf-8?B?eGRaQ1J1UTFEd3Z6MVBVNzNoS1VOdVVZOEhsWGR6T0JxVndCeXc0RmpZMXF0?=
 =?utf-8?B?VWFyK2ZScmROUjlTN25abm4zTGEyVDJZT3JVSG1BclExekxMNTl1MUZGRC9t?=
 =?utf-8?B?OFppWTV3SFRNWUNsbzBDWVZuVlhKWDdNNzkwVTBJMEtIb2RvZHBEa1U5blpj?=
 =?utf-8?B?RkJvU2RDSEN5N1RXblZHUm5wQ1BGSS96Ump5TnFIUGpSMnN2UVNFbEdVTkNs?=
 =?utf-8?B?ZkRlNXY2ZmVXNUZBNzhIZmIrSWFXTjZUSVdJMnVwVjhKZlNoTlJEdXdCZEda?=
 =?utf-8?B?U1F2aHFla3hDbXc5YWl2SFlwQ1JLMTFRbU9tUjdBM2MxV0ZwV0J6NDd3eG0x?=
 =?utf-8?B?WVdMT3lqOTRacUZ5MnJGVno3UGtTSFA3VEN1d3NBdHM0WjJCOHhlUCtYNE56?=
 =?utf-8?B?ejFtbDFJWFVoaEduY0RxazV4VnJna3hGVFpqNFY1TzR5MWNQeXNPN1JBMC9r?=
 =?utf-8?B?MFAyU2orUVp2alB3SjZyOEZjblJNQW9Lc0VVTE4rM2FCZVd4d0ZSUVV1Mmlw?=
 =?utf-8?B?eVhaTzdyREt6TzNwdFhBQnFCRlUwaUxFMDJWdE1OK2tNWUcwamZTVFhZd2w5?=
 =?utf-8?B?RkdUd3VJcDJLeWlIcWljd1VBZTFyYjRQYWNFMFZKVVQzZXpMRnVUditRczZP?=
 =?utf-8?B?eTQ3Mmo4VXp3aWV3SVdIUVl5OVByVFZCRmpZVGk4anRkVmVwaloyU1pqemsz?=
 =?utf-8?B?NEkvYjdGQUtkRk85UWhsU0xpQ2RPd0FTcWFOMFFqZkRaQytha0toYmg2TStr?=
 =?utf-8?B?V1JiNzZnaEpKelIwcE1xQmhRTmlGUEJQdmY5Rm41UnVHYkpoRVJMSnI3WS9U?=
 =?utf-8?B?WVY1MkhBbjRsVmxGL0t4S3FVSm5xSitYUGtpWHpGNEx1UnM4aW5pRjZ1ZUVQ?=
 =?utf-8?B?Q0JkK3cvWGNYNDNjYnlVU2lTc2hoRlVDYnFJcXl3WmpsZXE4YmNRb3Q0TVJC?=
 =?utf-8?B?c3BGT2s5cnhFNWtPRnB5UytCMWZjVFhicittQlZyUjBuMWxpelQycjhMRHIx?=
 =?utf-8?B?K0FGSWxWVGw1ejFVZDlUN1loTGY0V004RG1qeHhtS0t2U1A0MDdsZjdnNnRa?=
 =?utf-8?B?RE96aklKMEVHamxidlBTQ1Vja1h1NTJ0MG55eGV5MWhwY29xT2R6VU5uOVlL?=
 =?utf-8?B?YVpJekR1SFUrdTNvTytTc3hnbWExNVMyQXdMdW5PY2tDVDJmZjBxMXFnY2FO?=
 =?utf-8?B?V2dWa1hxZnpGWEcxY3RuMkZVdmxBN0ZYajFEQmlaVlNYaXNEL096OHBRVDk5?=
 =?utf-8?B?NG5jUWVtSlBPQ09KTC9lbUp3SUFnTGs3OFVYMjI0TlFNdTZpMVBQdmJjcThR?=
 =?utf-8?B?WXF0Mzk4QXc4NEtidzBwREE5SUtCd0ZSbHdraEl1YnNyVm8vQ1QwSC8rb2cx?=
 =?utf-8?B?Ty9qbmliRWFSNkU1MEJybXZzRDFnSlU0OFYzVWFpRnBrREZ1cjVCSGs1Y2Jp?=
 =?utf-8?B?RVFDTmJkQmlYRlVHSUk4eG1ibS9uN2ZLd1B4UE1Cb1ZENGtwNTFhYVh1RXA4?=
 =?utf-8?B?TWtpaVUzUWZHNk5Xc29JMm4yU3A5clZXTGY2Sm53Y3pMT1hDdFZkblUyUm5O?=
 =?utf-8?B?TktXb2JwZHRUdk42Uk5aanlYNzFsdmVwV0p3Sm10aEE3RCt0UkJrcnlnRjZN?=
 =?utf-8?B?L3VIOVlnMERyWis3MEMvY25XTVNSMjBWb2kxanJxc1k0SHo2blRGOCsvOVdw?=
 =?utf-8?B?Vk56KzJYS1RNZ0M0TVREMGNwQmFGMUlEa2RDTkJqV0tNRjJwYy92OEFMcHcv?=
 =?utf-8?B?RmFzUWExL0FRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VENnMkRjelFpT1Zza04yZERQOXBRbzEzY2toMU9yeldwakFMNHMrYllCQy90?=
 =?utf-8?B?VUNNK0JtYlVXWG1QMEFnWXU0RHAvb0hqNkI2QURudFdzK3Z2RytOVGtiR1lF?=
 =?utf-8?B?QlVPODdsUmZCM2VlZGd5bHFTaWdXQklZaEJDN0VHZVc4UzFWNXFWYjl3anFw?=
 =?utf-8?B?VkVJT3J3b3RvSEUvSDdLK1F0TUlUcjFmdnp3OG90UXIzdDlUMDhzY0hoYU4v?=
 =?utf-8?B?NHV6a05OV3pMZXJJcjJCSUhhTnhQN0JSNGpxaTAwYjIzQ2hBM1JCSHEzMDU0?=
 =?utf-8?B?YzdMRVV1N0xEVUVoZkF3UGxKRlBPSHRSR3BldXNIWXNBcitGQlFQK0lUM3ZT?=
 =?utf-8?B?Ykp3dGZFQ2ZtZHo0MHIrMTFFNktOODlnVzcwWVZKL0FEVEd5THR2ekhRQ0Jl?=
 =?utf-8?B?N2NURmhhZXFhbG5DdWNTamdJdm9wQzdHUWNQSklRbDFQOWlsWU1xb0JCa0RV?=
 =?utf-8?B?UmxsUU5vQVROa3Zvd3pxRXJFdHNjVUFqdzdEYlArNXhxbnZBWjIrL3d1ZHkv?=
 =?utf-8?B?dUd3UFR2djJMd1BrcXZ1T3FLcjY2OHVzdUx5S2RENEhMMWtyQWhsSzFlUEpj?=
 =?utf-8?B?TUErV3liT29vUHNvN3ExR0g0Ni9xYncyN2hzT2tHSnhhbXlESnM0VlA0QTMy?=
 =?utf-8?B?cThEL3B2Nlg1bFJhdlJjYk9iNnFlOVNRYmRGcWdTWlZYY2lXejE0aURONTdm?=
 =?utf-8?B?ODltQnBiSytBek5qSGVTTjNpMlQycFBBVS91Q3hrTllLSjM4UzNVZ3IwSFZW?=
 =?utf-8?B?RmdxZ2lCRWNEdVdxNnA4K240ZktDMWJXVVpEYkI1Tjhjc3NodlNwVm1hVzZy?=
 =?utf-8?B?cVMyOG94dTdnVnVsR3dXa1JKeUl3VHN0R1ZzQlhQZzUvTS9Ucm43MFNyVEhY?=
 =?utf-8?B?MGI2bnNRTEhQUkwzaVdQek5TWFdNeGZiZlBFRUJGaVNmUkRWaDFqMXVqd2FZ?=
 =?utf-8?B?a3huMGdkM1pWanRUR2Rqc2EvRGF1YWN1Z0NpdnJVOFBQdzFSN3pwaFptYzZn?=
 =?utf-8?B?ejM2V2NzOWJIZ2tUWjVtN3NZRG5RazVTalc1bVlxdzA0N092STduRWNjME0z?=
 =?utf-8?B?VkxLaXp6MWhYdGFRdkh1SFA1QldOWnYzRSs5N0VMeTU5cWtHOHFYYU5ibVVs?=
 =?utf-8?B?U1FrRE9OUmxwUDh0dFQ5QzhRTWpjMTdkOFJwd1dpRVB2SEU0MTUyQ29QRkZq?=
 =?utf-8?B?Z2JMdU40bG0vT3V2RzFoVldSMDljSHpHT29tQ2szd1dFSGw4YVFiR2k1b2NW?=
 =?utf-8?B?alVsYWo3cGhyMEg0aWxMTFVzUk9BRDVWRE9LT09FSDJZUk9vcUIvajU3SE1y?=
 =?utf-8?B?USsrL013YkFER3pNcjBqTVg5elFIS0FvU2pkUjEzaXFSeStpREwvRFdCYkNr?=
 =?utf-8?B?T3ZndG55aHh0ZVpIdHNWMW9KUFFIeEdrNDhwbnpPUlUvd1NmWDRBeDdQcFVE?=
 =?utf-8?B?NjJqeWFack9MRVVWVVVlaERGMUpSV0g0anJSekNId0pmYjEvTVR5MjRRS1Fh?=
 =?utf-8?B?NnVmcVdZMG5jYUZIMnBiemtFZ2JVdDV0RVhRSTZzUmlBZFV5VE04YXhVTDVY?=
 =?utf-8?B?Zm5tMUtDdEpzek1LYWtvcFFuWjJ6c1owUFZQUXV4ZkxnbDVzZ2dwSHhaN1hV?=
 =?utf-8?B?SUZnY01sVFRTMEs0ZU1vK1ZmVWFtb0dXSzF3R3ZMR1kyMklxYnVFQkRZbDM5?=
 =?utf-8?B?SjRMWFRQMWRmTnUzOEZzU3FId3czQm9pbW1zQlRocnVQb0RXcC9tTVV0Tkhh?=
 =?utf-8?B?TXlnRDZDaXhWMEFNWkQ4WnhJclR0WnplVXBDT0lVcHk4ZmpzOWVXQVJhenBN?=
 =?utf-8?B?c09FcEY5UnorZ2Y1TEJSWlB5UWtRWU5zUjNJd3dDMWhwUzZWSVVUdzBValp2?=
 =?utf-8?B?dVJ0QXFqcW1qVTgwZmYzUnlGd2hUN1ZLTnRRaEVaUFdNL1ZRbnpEcU03bVk3?=
 =?utf-8?B?Njl4dkpUdTlHNUNSVjFmbnNSWHdKT3hJTjdxVEEvUFNBKzk0VFhBdEx1bGR6?=
 =?utf-8?B?Q0M5dDVFUnZJamtiSmNxNlZGb09DbmJkWjdmcjNtcmJGMG9TMG5yaGVtdk4r?=
 =?utf-8?B?VVUzbW1zcFJTNmdHU0xEdHQrTlZ1SGl0ZkxvalJaRHZuejhldk9VNkxjbTlK?=
 =?utf-8?B?M3J6NmdMamRBNitXVUd4TGx6ZHlGMHRydkN2dk9zVnVuWDFKcTRGTkNsckJN?=
 =?utf-8?B?dEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c765ed3b-dabf-42ed-9b0a-08de3112ca89
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 19:49:51.3651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OrzduZuJg5F8rGaxTBX6VQ0F/s5+VFy5WFiYkKwaZLHVf7HsrBV0lXGAxjTfhFu75g9R1D7CYSI5+duoBnJ5sc0k0EMVLwxx3Z6tpWe000U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6453
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: AOF7-hwr8Lgw9hCGxK-n5RaBQx3WaKFd
X-Authority-Analysis: v=2.4 cv=OLAqHCaB c=1 sm=1 tr=0 ts=692df165 cx=c_pps
 a=SqiBG769zjf53VTvhFyIdA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=e9-ISCnCy_cG1zRpO7IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=LL2tRf8ejww1KewghXIA:9
 a=8N-uk4vA_y2Eyqyv:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDE2MSBTYWx0ZWRfX1yaaufJsci5t
 C7mfZVhTpfd+t2uTCsEpA4+pPbBntu1eU7KsGWFB6Zb0OE3LtG5H5kxOTFJCgOYUOkJ/K4MPvc8
 tcea5Nq62KbCI1JASg2a3tdXClq2cOg029UJd1lA5FljjffM7BgD4YGD3Vmf1f3FVsTZ/dlT9nu
 KAyeOMNA0/mF+Gb+TKckn1zyHj8qu+GCnaE1jYs0mE3TNtKJnL+D9FbOJjz0F3oxwYH1ftS18Zx
 D2Wa7nyx8GIHKoL5oXKEYyyeBbuKDkRTnBUEE1ug3GTMDXlOF3cg7Z1QF3qYD7+p9RZITa1lhlc
 g9y8XLGjf7AA23UYoqGMk5EAvBksKJzpSAqsCSJ4LzS02zb7w9k6wrcEZpHmnyow5bA2mPvx0pF
 D13wTelz2Sjx8JrEIqpkXt6scUr/AQ==
X-Proofpoint-ORIG-GUID: YZtLBWZau81ii29WrhkWpO3YNHnHGiop
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010161
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 19:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227139

--------------as0w4VNRTl18JWSQ4tAXohf8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5B14trLq3279537

On 2025-11-05 7:14 a.m., Jayasurya Maganuru via lists.openembedded.org=20
wrote:
> From: Jayasurya Maganuru<Maganuru.Jayasurya@windriver.com>
>
> Fixes [YOCTO #15726]
> Fixes [YOCTO #15853]
>
> During eSDK installation, errors such as the following may occur:
>
>    <task>:do_fetch attempted to execute unexpectedly
>    This is usually due to missing setscene tasks.
>
> Investigation showed that image SPDX/SBOM tasks
> (e.g. do_create_image_spdx, do_create_image_sbom_spdx, do_create_spdx)
> were missing from the locked signatures and therefore not present in th=
e
> eSDK sstate cache. As a result, these tasks attempted to run again
> during installation.
>
> This issue is resolved in two parts:
>
> 1. Task ordering fix:
>     The do_create_image_spdx task now runs before do_sdk_depends by
>     adding do_sdk_depends to its "before" list. This ensures the SPDX
>     image generation tasks are completed before locked signatures are
>     created, allowing their signatures to be captured.
>
> 2. Locked signatures filtering fix:
>     In populate_sdk_ext.bbclass, SDK_TARGETS (e.g. core-image-base)
>     were previously removed from the locked signatures. The logic has
>     been updated
** this part **

See below.

> so that SDK_TARGETS and their multilib variants are
>     retained, ensuring their image SPDX/SBOM tasks are included in
>     locked-sigs.inc and preserved in the sstate cache.
>
> With these changes, all required image SPDX/SBOM tasks are captured in
> the locked signatures, and eSDK installation completes successfully
> without unexpected task executions.

Hi Jayasurya,

This work is coming along well and may in fact be=C2=A0 done
but would it make sense to split the work into 2 patches if the the=20
changes are not completely inter-tangled?
The goal would be to make the changes a bit easier to review and focus=20
the commit log even if the
problem reported isn't fixed unless you have both patches.

There's also a problem flagged by patchtest:
FAIL: test shortlog length: Edit shortlog so that it is 90 characters or=20
less (currently 104 characters)=20
(test_mbox.TestMbox.test_shortlog_length) and slitting the commit in two=20
could help with making the shortlogs shorter! ;-)


Also, in your for commit log related to:
meta/classes-recipe/populate_sdk_ext.bbclass

please explain *why* the changes for populate_sdk_ext.bbclass are needed=20
especially expand on part just before "** this part **" and what the=20
impact of the changes is. This came out of a (too brief) patch review=20
discussion so there may be additional follow-up questions from some of=20
the other people involved.

Qi and/or Hongxu,
 =C2=A0=C2=A0=C2=A0 Can one of you reply to this thread and agree to help=
 Jayasurya to
review these changes and the=C2=A0 v4 commit logs to ensure that they are
so clear that they easier to quickly review please ?

Thanks,

../Randy


>
> Signed-off-by: Jayasurya Maganuru<Maganuru.Jayasurya@windriver.com>
> Suggested-by: Joshua Watt<jpewhacker@gmail.com>
> ---
> v3: Moved the logic from create-spdx-sdk-3.0 to create-spdx-image-3.0
>
>   meta/classes-recipe/create-spdx-image-3.0.bbclass | 2 +-
>   meta/classes-recipe/populate_sdk_ext.bbclass      | 9 +++++++++
>   2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/c=
lasses-recipe/create-spdx-image-3.0.bbclass
> index 636ab14eb0..f070b7e697 100644
> --- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
> +++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
> @@ -69,7 +69,7 @@ python do_create_image_sbom_spdx() {
>       import oe.spdx30_tasks
>       oe.spdx30_tasks.create_image_sbom_spdx(d)
>   }
> -addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_creat=
e_image_spdx before do_build
> +addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_creat=
e_image_spdx before do_build do_sdk_depends
>   SSTATETASKS +=3D "do_create_image_sbom_spdx"
>   SSTATE_SKIP_CREATION:task-create-image-sbom =3D "1"
>   do_create_image_sbom_spdx[sstate-inputdirs] =3D "${SPDXIMAGEDEPLOYDIR=
}"
> diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classe=
s-recipe/populate_sdk_ext.bbclass
> index 2859320ddf..2838ca1a03 100644
> --- a/meta/classes-recipe/populate_sdk_ext.bbclass
> +++ b/meta/classes-recipe/populate_sdk_ext.bbclass
> @@ -460,6 +460,15 @@ def prepare_locked_cache(d, baseoutpath, derivativ=
e, conf_initpath):
>  =20
>       # Filter the locked signatures file to just the sstate tasks we a=
re interested in
>       excluded_targets =3D get_sdk_install_targets(d, images_only=3DTru=
e)
> +    sdk_targets =3D d.getVar('SDK_TARGETS')
> +    ext_sdk_target_set =3D set(multilib_pkg_extend(d, sdk_targets).spl=
it())
> +    excluded_set =3D set(excluded_targets.split())
> +
> +    # Ensure SDK_TARGETS and their image SPDX/SBOM tasks are included =
in the locked signatures,
> +    # as they are required during eSDK installation.
> +    filtered_excluded_set =3D excluded_set - ext_sdk_target_set
> +    excluded_targets =3D ' '.join(filtered_excluded_set)
> +
>       sigfile =3D d.getVar('WORKDIR') + '/locked-sigs.inc'
>       lockedsigs_pruned =3D baseoutpath + '/conf/locked-sigs.inc'
>       #nativesdk-only sigfile to merge into locked-sigs.inc
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225754):https://lists.openembedded.org/g/openembedd=
ed-core/message/225754
> Mute This Topic:https://lists.openembedded.org/mt/116133120/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------as0w4VNRTl18JWSQ4tAXohf8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-11-05 7:14 a.m., Jayasurya
      Maganuru via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251105121432.3987350-1-Maganuru.Jayasurya@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Jayasurya Maganuru <a class="moz-txt-link-rfc2396E" href="mailto:Maganuru.Jayasurya@windriver.com">&lt;Maganuru.Jayasurya@windriver.com&gt;</a>

Fixes [YOCTO #15726]
Fixes [YOCTO #15853]

During eSDK installation, errors such as the following may occur:

  &lt;task&gt;:do_fetch attempted to execute unexpectedly
  This is usually due to missing setscene tasks.

Investigation showed that image SPDX/SBOM tasks
(e.g. do_create_image_spdx, do_create_image_sbom_spdx, do_create_spdx)
were missing from the locked signatures and therefore not present in the
eSDK sstate cache. As a result, these tasks attempted to run again
during installation.

This issue is resolved in two parts:

1. Task ordering fix:
   The do_create_image_spdx task now runs before do_sdk_depends by
   adding do_sdk_depends to its &quot;before&quot; list. This ensures the SPDX
   image generation tasks are completed before locked signatures are
   created, allowing their signatures to be captured.

2. Locked signatures filtering fix:
   In populate_sdk_ext.bbclass, SDK_TARGETS (e.g. core-image-base)
   were previously removed from the locked signatures. The logic has
   been updated </pre>
    </blockquote>
    ** this part **<br>
    <br>
    See below.<br>
    <br>
    <blockquote type="cite" cite="mid:20251105121432.3987350-1-Maganuru.Jayasurya@windriver.com">
      <pre wrap="" class="moz-quote-pre">so that SDK_TARGETS and their multilib variants are
   retained, ensuring their image SPDX/SBOM tasks are included in
   locked-sigs.inc and preserved in the sstate cache.

With these changes, all required image SPDX/SBOM tasks are captured in
the locked signatures, and eSDK installation completes successfully
without unexpected task executions.</pre>
    </blockquote>
    <p>Hi Jayasurya,<br>
      <br>
      This work is coming along well and may in fact be&nbsp; done<br>
      but would it make sense to split the work into 2 patches if the
      the changes are not completely inter-tangled?<br>
      The goal would be to make the changes a bit easier to review and
      focus the commit log even if the<br>
      problem reported isn't fixed unless you have both patches.<br>
      <br>
      There's also a problem flagged by patchtest:&nbsp; <br>
      <span style="white-space: pre-wrap">    FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 104 characters) (test_mbox.TestMbox.test_shortlog_length)
and slitting the commit in two could help with making the shortlogs shorter! ;-)
</span></p>
    <p><br>
      Also, in your for commit log related to: <br>
      <span style="white-space: pre-wrap">  meta/classes-recipe/populate_sdk_ext.bbclass    </span></p>
    <p>please explain *why* the changes for p<span style="white-space: pre-wrap">opulate_sdk_ext.bbclass are needed
especially expand on part just before &quot;** this part **&quot; 
and what the impact of the changes is. This came out of a (too brief) patch review discussion so 
there may be additional follow-up questions from some of the other people involved.
</span></p>
    <p>Qi and/or Hongxu,<br>
      &nbsp;&nbsp;&nbsp; Can one of you reply to this thread and agree to help
      Jayasurya to<br>
      review these changes and the&nbsp; v4 commit logs to ensure that they
      are<br>
      so clear that they easier to quickly review please ?<br>
      <br>
      Thanks,<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite" cite="mid:20251105121432.3987350-1-Maganuru.Jayasurya@windriver.com">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Jayasurya Maganuru <a class="moz-txt-link-rfc2396E" href="mailto:Maganuru.Jayasurya@windriver.com">&lt;Maganuru.Jayasurya@windriver.com&gt;</a>
Suggested-by: Joshua Watt <a class="moz-txt-link-rfc2396E" href="mailto:jpewhacker@gmail.com">&lt;jpewhacker@gmail.com&gt;</a>
---
v3: Moved the logic from create-spdx-sdk-3.0 to create-spdx-image-3.0

 meta/classes-recipe/create-spdx-image-3.0.bbclass | 2 +-
 meta/classes-recipe/populate_sdk_ext.bbclass      | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
index 636ab14eb0..f070b7e697 100644
--- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
@@ -69,7 +69,7 @@ python do_create_image_sbom_spdx() {
     import oe.spdx30_tasks
     oe.spdx30_tasks.create_image_sbom_spdx(d)
 }
-addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_create_image_spdx before do_build
+addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_create_image_spdx before do_build do_sdk_depends
 SSTATETASKS += &quot;do_create_image_sbom_spdx&quot;
 SSTATE_SKIP_CREATION:task-create-image-sbom = &quot;1&quot;
 do_create_image_sbom_spdx[sstate-inputdirs] = &quot;${SPDXIMAGEDEPLOYDIR}&quot;
diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 2859320ddf..2838ca1a03 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -460,6 +460,15 @@ def prepare_locked_cache(d, baseoutpath, derivative, conf_initpath):
 
     # Filter the locked signatures file to just the sstate tasks we are interested in
     excluded_targets = get_sdk_install_targets(d, images_only=True)
+    sdk_targets = d.getVar('SDK_TARGETS')
+    ext_sdk_target_set = set(multilib_pkg_extend(d, sdk_targets).split())
+    excluded_set = set(excluded_targets.split())
+
+    # Ensure SDK_TARGETS and their image SPDX/SBOM tasks are included in the locked signatures,
+    # as they are required during eSDK installation.
+    filtered_excluded_set = excluded_set - ext_sdk_target_set
+    excluded_targets = ' '.join(filtered_excluded_set)
+
     sigfile = d.getVar('WORKDIR') + '/locked-sigs.inc'
     lockedsigs_pruned = baseoutpath + '/conf/locked-sigs.inc'
     #nativesdk-only sigfile to merge into locked-sigs.inc
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#225754): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/225754">https://lists.openembedded.org/g/openembedded-core/message/225754</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/116133120/3616765">https://lists.openembedded.org/mt/116133120/3616765</a>
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

--------------as0w4VNRTl18JWSQ4tAXohf8--

