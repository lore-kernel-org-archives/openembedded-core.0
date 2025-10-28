Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC71CCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 04:05:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1198.1761624310943011915
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 21:05:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=lGZARL4C;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23964b911a=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S1KVMv124175
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 04:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Ukw2yH7beeIfpAYP1kB0N1BZYxpTzXQ20wM3/pQIuxM=; b=
	lGZARL4C1gFAh8sz/8rxNgIC2r9syKI7i+eS/iftc/bQbLvqexRjzBMDDh/nr56k
	PbdfbxR47zVdJt1rwyddClSd/x+27W6l8MWbCU0gAHzibjsHKIsfdj9/CThrRfIy
	I94OsUPXhxRi9bWskXFEn47dn0viMwkqgY2oazPfSLQP9wv0iPSosQFc+RtKYm0w
	P9oTN11hig1SaQkdLZa+Fk9+8Yfs9Iz1rhrVxpzJQWXFGoPLbvpxN6qXdqes/4Z9
	WVzN9JR+2UMSto/O5YG6Jd6y4+uywx6oOBshbgrBeRwn9ZjE2sexhR0t7zTxuE10
	YErN2QqRlC7hQGfPouicnQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010003.outbound.protection.outlook.com [52.101.46.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0ks02scy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Oct 2025 04:05:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MA46UVybfi7qial0wleu2l/AzD46Z5/5lXp6LFcB2vrhBivpiSLddsFfI+SrTUo4dcf5km2ZkkSBkJFXhHa1uiVgmGnrcjslJs+qR0m97blnVD3t5kMNPePzNC2jU/19LM/jepsxJsBe4EmJ9hDkf87Hc/s4jIp4zKGLoGAM2J3PrlEu9T/ovjlzOU1SIhtD9b4JFCX9bQoJ/Z6nxXeZtp0MA+9KJWgOdnQzT6hLDMy2hpYho2edc3j3bU2Ka9qjC8U/+0ICDT9GV01VMKGRhRbsSIakvDAKrAzP3mR/mfeHhvDlGTqPoiErMhd1hYiy3ppQ80i2ytXJ5jUcpWQFWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ukw2yH7beeIfpAYP1kB0N1BZYxpTzXQ20wM3/pQIuxM=;
 b=DOt0VR36uq7LMeFUXLmQml1jO+YqWLXoUZzYv7KTNvyuSwzzog1eSeNEgrS/JH92LNctxQhAYvoOLGtpz/UO8eevsj6x1T/uM8lDpc4EUMrxQNd8t8G52au1dn1QKtX2V4KVHrJhqr2vbGI3C64GNFP8IRSP8pJvYABIRl3dGMHuSPW9FWiPP+D59Rb6rALYQu+HL3ILRm9fkRoAXohiT+WKQCwBN1pQiVCeb6m2IMPVDQy/+cbnoaOKMDge8BxGvJHwlOMYihwMm+MDNmOYUerPjPuqolOQX1iXGPlBJY8ehYnCafdSvcF7wzVsxVS4FssH3bKSMkN40+/piVle9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by CH3PR11MB8774.namprd11.prod.outlook.com (2603:10b6:610:1cd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 04:05:05 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 04:05:05 +0000
Message-ID: <bf0302f7-db8e-4ab9-acaf-332abc83e8d5@windriver.com>
Date: Tue, 28 Oct 2025 09:34:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [walnascar][PATCH] glibc: stable 2.41 branch updates
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
References: <20251027084704.3219220-1-Deepesh.Varatharajan@windriver.com>
 <CAMKF1sqBvR+BmO2XLKK2=mOP-CLCtrijRPWCggMTO4=Z=ymPDw@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CAMKF1sqBvR+BmO2XLKK2=mOP-CLCtrijRPWCggMTO4=Z=ymPDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA5PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::10) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|CH3PR11MB8774:EE_
X-MS-Office365-Filtering-Correlation-Id: b17b6f00-0cb3-440c-25cc-08de15d72d18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R0NHUEFJdVNCSkVMeTc0M3M3UDBwVWNOTnovQllScDJ3SEVIdC9NR0o1dkwx?=
 =?utf-8?B?NUxqVWZjeFNLSHF4WVR4VzdvUitXVksvQjVHbjROdVA0QTRndnZEWmh0Z01J?=
 =?utf-8?B?cHNkU0wyTnFjNzVFdFV5U2J4QU9HUzZLaFo3TzNZQ05OcWh5M1NrWDl4aDBR?=
 =?utf-8?B?Vkg5YzgzZmI2Q0lKQTNZQ1F3NXA5VUd0cFRYNlFlWEZXOXRSVmJ1VjBPTjZL?=
 =?utf-8?B?b2ZFYkxGS3JmM0tiMCtZdDIxSlBQaXpiMDFzQ2xPQXY1RFVINURBaXExK2U2?=
 =?utf-8?B?T1Y0VTE1WkhHSU1SbUd5cGhuem9FSEsrbFhxOEtRUk5ldFBoZXB5NUwvRVdp?=
 =?utf-8?B?YUFBdWVCUXJYMG00aVZUV2c5cENjOENVQ1RRMEFKcDNFMkR3c2NSQ0tSa3JS?=
 =?utf-8?B?V05YZkdyMlEyeDhLOFYwbnN6UktEMGhUWXlDdGF3TGxud01jZkh2SHVHZHNJ?=
 =?utf-8?B?VjlRc1NicDI4L1FvZlN5N2dsWUpURy9UWFRGQm1mV1NncUVrZzhMWU00RkFO?=
 =?utf-8?B?c1lhZ0QyWHo1WmIzdGhjZlRBOFVTV1BvL0prclNiZ0xOK0dqdUdaZ2gvUGpF?=
 =?utf-8?B?eUtYTDJQS3VpYjUxQjc2VDNjWmUzTUZHMktKWDQxcmdxc0tUL1BmVUQ3a1Uz?=
 =?utf-8?B?eEZQUUU4aEcwUy9DNlhrNDFYd2pPVzJHYW8xV2tNdjlYeW1UOGNnQUthaHJB?=
 =?utf-8?B?aTNLb1RscjN5NURaT05nQTZqVVRiaXdnOVlja1Q5dFlvKzRLMEFmRHJVU1dO?=
 =?utf-8?B?VU5UN3RvTHg5SS9nYUEyZTVxLzhiVUlZNDBlWjVhSjNMbFpSeXRkVnFlZ2ZQ?=
 =?utf-8?B?LzA1OGJUeXBrY2JNSmM3dFo2VjZFMnJSSXVybUs5OWp0QlNwZFBUTHBmSUps?=
 =?utf-8?B?enBtSkQvMk5RUHlqSXNlUkxlbm92S05EQ3dGRHNSbjFYTUo3MXNYeWNZN00z?=
 =?utf-8?B?ZGg0SFE1TDgvN3Q2UUU1eGxCUzB6VGZQWWg1QjFMU3pNRkJobGJxbVQyYVdk?=
 =?utf-8?B?WmlYc2NCVnZvQ1BKN3BEc0MycGZ0RDZQNjJITHdiWGpvdTh4TTA2Wk5XRHhX?=
 =?utf-8?B?eHRqajRLS2NlUE1XZzFEWlRaOU1IUWJQOTE5elJkbDArbk41MEhUTVNqZ2k5?=
 =?utf-8?B?SWhNWFU0RFBxaXBXTnFsSzlDbUNOT0xNV2QwcmxxdDdqWFZWenNwTXQzL0xS?=
 =?utf-8?B?TGt2bU9aY1lGR1NmNzM5ZDNQamozUkE3a2lrRHVXclorMVpLTUdhSjVuVVlz?=
 =?utf-8?B?N1cyYnc2aC9oTnNOWmRQUysyWEx5OXdBclNDTDNtMlhHN3h2RzA3TVlwdU5K?=
 =?utf-8?B?bnMwaW1lcFMrR25sNlJnVS9XM29reU81SmpaTVZGRm5zTHpVWHN5T2lNQ2JJ?=
 =?utf-8?B?a09EU1Z1aGgxV2ZMN3VLYUIzb2ljdE5jMHREeDNaU0NYMWl6NEdZdDIrTUdE?=
 =?utf-8?B?RHc1SmI2T1hjK2hpcUltckF1RHljcjhocGJwMExqTTltTlNZK1p0UllBSVQ5?=
 =?utf-8?B?U3l3aGhpd3Q1dHdHT2dFaGp1RkpYd1UwL1MyOGdHdXI5Y0x4Y2J5bko1eU05?=
 =?utf-8?B?c0tvNE1uck5LZkNrak5UZ29YQmlkUDJtTHBxN2xpUXk4Kzk5QnNHTVdJd3Ri?=
 =?utf-8?B?dFVwY2VlelprcXhkYmV0NzdlTGg5M3BCVXFjYURvWVRIMG1MdTIyeldGOGRJ?=
 =?utf-8?B?NnFBYjE2cjlRZExYd0JKbjZNNUd0WjkrcmNLSHBwQm9CWFJUekxhNXBDS3lk?=
 =?utf-8?B?WXZuSXNBc2tyZmU4a1VJRnk4ZTUwTzRENnNnUkl4UUxxZjlGMGcwYjFWWVRD?=
 =?utf-8?B?bHFOOTFNdlpMazVZTTBMRGVURG9rZUJMVlpUd1NrV0cvdmtSL0E5WU1DczJm?=
 =?utf-8?B?SEUyZTVMSElZelEyQXhzcCtmQ0h0M1lpamNadVYwbDk5QkE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R3NQOW9tbWZSYXNTOVFRRnJ2L3NxNlpyMHgwWnhHSUR5Wk8zcmFGanRJaWFo?=
 =?utf-8?B?M1QxL3NXT21ISGFNYjFHQWRpbE1EeVFyNDB2b3p6QWFvaEZxenY2U1ljZVYz?=
 =?utf-8?B?RERqUXZXT0JVRTRwWHM4K3dLMzhOWGMxQlB0Q3dSVnd2U1dRaE9aRGZZUzYr?=
 =?utf-8?B?UjdHUVF3RVQ5bmVJQU9kdHJ3cVlza09UdU9mMVZiN1FsQk9pd2U3Q3V5dlB4?=
 =?utf-8?B?cGZQdWw4L1kyYWN3M3BRZFpxUC81QWh3dG40UVNLa1FlbFN1K25GdC9UYmRi?=
 =?utf-8?B?M3FlaGtjN2FYNVJ6Y1A4cUhRSHpNQmdnV0J5dFpLRUhmYzdrYm5BZFFuSTFE?=
 =?utf-8?B?b1ZYeTVmTFN3TE55QURWR1Z4K2ZWeHhsLytKcnNLTHU4dUNoMmEyaHJUVStk?=
 =?utf-8?B?bnpJT3crbXI3cy9CREZMRTF2K2k3S3BpcUdWSVFncGljRmpIMjFwSjVSaDhx?=
 =?utf-8?B?V2tsZmRHNDBMU1lCK0c2dWNpZE1tY0E1WmVsOFVwa2FFaDN1T2h0QjJrVEhV?=
 =?utf-8?B?WkhkVEREZmt0bTNvNE1vSmlsSmxZeGVTMzA3elBvL1A1WVFqWksyaTA4K1hZ?=
 =?utf-8?B?WnpFdG5YR21DRWlUWWJjeEdXYlFBQUh1SDcySy93b3pXbjRNdzU0QUNWNTJV?=
 =?utf-8?B?a3JIWUZpTmlHUFg3dTViUStKRjRSVDBiaTZmdWRJYkR1ek1MaUlRbWVORjVM?=
 =?utf-8?B?YlFPQ1VwTmNoeG04WGY0NENLaEFCRUwxUE5OeUNoSFJlSGhleXd3UTEzSlBR?=
 =?utf-8?B?SGtDVnJ0OU5mWUdHTlJNN1AxQmNFMXFVcVAzUEs4Nk11VkhJcXdtUklzdXZv?=
 =?utf-8?B?TmdPcmJkdHJsVXRVWVk5OGpNdlg2clArNnVKV0c4R0dHK2NFMjduNHNLMlN3?=
 =?utf-8?B?K0diY2xkdCtKb0xqYjc3bkxsNlY0M2g2aWIvU2R4SzExUU1NMXlYSjBwUXRR?=
 =?utf-8?B?MzhvV1VoQ0kxcTJKTlhjeTJhWnhnQjgyYjlBOE84R01rMlNoN0x2bS83eUFN?=
 =?utf-8?B?Ykt2NHFTazlNM25qSmtGNWYvY2tZTUZ1bEdLNE5HQnpvVkhxSDk1V3NDY3FL?=
 =?utf-8?B?S2NVVFNmZ09LSncreiswQU1CTkg5QmROd1VsQjZsSU5CNEpxdmwzYXNabU1j?=
 =?utf-8?B?Y3lCaHpNdEU0eG1EOTBySkcvcThOMWFlMHdXU2trS1dRWVUzbkt5eURRcmRI?=
 =?utf-8?B?TnQ2bU0xbXBzdHh4TXpLTm43d0FCTDJiM3A0Zmg3LzllV0ZpaDJ2amIzb01z?=
 =?utf-8?B?RzBQTXFIM2ZIcUJXMzdEMHpRWHl2WXpnWk16bHltMThvMVM0QkxIZisvMzBF?=
 =?utf-8?B?Ym5hRU5IOTgreG5DZmhhNHF0cHQ1ckRpWkdHTGY5L1lVZVJqdWFJR0tBcGZu?=
 =?utf-8?B?c3dBWFppUU9aa3NPWi9xNXNoa0JMNlozc3F6K2ZyT1lCSVluUG1md29zTmZH?=
 =?utf-8?B?R0hIcUVtZERJZmNIeFRPWkFveFhJZG5wUmtnaFphbjdNTXllSnBKZi9KemNz?=
 =?utf-8?B?TEpUbDNHVFFMVVJQUTdhUXE5Qy96alhpYjRWOTB2bGFCSTlvK2RCZENoNkJv?=
 =?utf-8?B?aXhjUnM1cTZ6MGNGclJiNGZmcGZLOENoWEs4SXp3QnZKZmZCbkFrbVljQUp2?=
 =?utf-8?B?Lzl6eEtRR0tJOXBZTFk2alVybkw4OTgvNkkzeWp6L1NEVE1hNnF6NGV5c1Jv?=
 =?utf-8?B?NnVFSk04ZDNOalpsOEhVcTgzdFpPaE44NVFxNkczVHMwNWlSaTVCV2hMS0tF?=
 =?utf-8?B?ZjUyQlY1dHc1ZmpKUmFmZW5MempHZzNtYVdzYTlTWGp0VGwydUhkREFpS3k3?=
 =?utf-8?B?djN4L0VuK2sxTnlqcHpHeVNEcjdINGhsTmM1bk4vMzd3eSt6cHQ5c28rTnRJ?=
 =?utf-8?B?a3ZWMnVNa05QS3BjL3pGdEVQZlFJcmhLR2tQcUZsa1RRaEt2NW1DQU5vb0RW?=
 =?utf-8?B?U0IvMmNDRk9uMmxUSnhWYzVXN3pCZm84czJBcjZxMDYwMkh4clQ3Y2VDclpG?=
 =?utf-8?B?UzFBcVVCa0I0MXFnTU04NVZHbzU5RzRRcE5OcWhZaGloOFVOYzNUWThRN2p0?=
 =?utf-8?B?OHE2Z3M2TWZCOGZMczBFZ20wOFZMSCtDM25NdEl3WVQrZEVqUlBvRGd0cFpt?=
 =?utf-8?B?MEFNZFU0bFVXSzllR0NqSmYzQXM0TkFVYndRRjM1cTFSNDZ0QUM5cGU3OElK?=
 =?utf-8?Q?yzOeBGcRpIsXl6lW890n6+Q=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b17b6f00-0cb3-440c-25cc-08de15d72d18
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 04:05:05.5306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WQ2BO+uUJfWNuIUgWnsZxrUBaEAGlDLXAxoNUl8sUkkOGj1ST8nR0ZKol5DgrdohxOU7Ps4xRL9Gu4kGoCyq5RcxWPG1gUoTJ8HPHhtw8vO9va2DNb58iBl1Z88FNW2Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8774
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: rRnrxPw51GCUKWALYWyBb2VyD6p98rDb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDAzMyBTYWx0ZWRfX0JxyRlq9sNJo
 2f2Pzj6yw3/8ToVYral1PfaMLk8xkPtPM+jGHSRLGTCwXJeCOnXBvj9cDxY2eeZFU9I5cVLEx41
 y7NY96aiWELfOxgZgxo8pdQB4GC4WLkoHrDCnmCpSR2SZxE9eNzXg6QoCcL0pPHYRPuvFiuXqtR
 bG3NgdAH5gSUzD4CZD8sWoJXXtjmOCvPW9+heM68zpNJ9+sc9LlamocRHB6+lQe3U9zJgJonO87
 3pubUyeHJvErUJYWj9D+qcOvGkqvSgvOvTAtlTqd7na/STELWLySeT51lgkthYPYj1Nt2CCKMJF
 6UEneGNGXaBbbhfrbuPnaqNoMYnBHQ2REEBIYU/wpofIZRCRMBi9yZe6cS0PXaux24PXB3YRZ+R
 MWJ/UcJMmrDxJq1W8LftV04zsxtuYA==
X-Authority-Analysis: v=2.4 cv=CIknnBrD c=1 sm=1 tr=0 ts=690040f5 cx=c_pps
 a=AKd2An130fSphkJyqL6rzg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=CCpqsmhAAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=Di5YcMDegeDDIqg5exQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ul9cdbp4aOFLsgKbc677:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: vTV0-4DdaSDrNF4VInuDdITFyAZK8PGY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280033
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 59S1KVMv124175
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 04:05:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225374


On 28-10-2025 00:43, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Mon, Oct 27, 2025 at 1:47=E2=80=AFAM Varatharajan, Deepesh via
> lists.openembedded.org
> <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> git log --oneline e7c419a2957590fb657900fc92a89708f41abd9d..cf926cd7fb=
9500035be19bca90ba9c855dcfcf92
>>
>> cf926cd7fb (HEAD, origin/release/2.41/master) nss: Group merge does no=
t react to ERANGE during merge (bug 33361)
>> 9867e44cdc AArch64: Fix SVE powf routine [BZ #33299]
>> a52c9b75c7 Optimize __libc_tsd_* thread variable access
>> ed4672abb5 i386: Add GLIBC_ABI_GNU_TLS version [BZ #33221]
>> 7aa907241c i386: Also add GLIBC_ABI_GNU2_TLS version [BZ #33129]
>> c1bec0b52d i386: Update ___tls_get_addr to preserve vector registers
>> aa5dbd5332 elf: Preserve _rtld_global layout for the release branch
>> 42f9c70ac2 elf: Test dlopen (NULL, RTLD_LAZY) from an ELF constructor
>> 3f3b4fdd0b elf: Fix handling of symbol versions which hash to zero (bu=
g 29190)
>> e2d9e9eb26 x86-64: Add GLIBC_ABI_DT_X86_64_PLT [BZ #33212]
>> dd87fcda43 x86-64: Add GLIBC_ABI_GNU2_TLS version [BZ #33129]
>> 85780b6055 elf: Compile _dl_debug_state separately (bug 33224)
>> b05ce0de3d elf: Restore support for _r_debug interpositions and copy r=
elocations
>> 9d6577fdff elf: Introduce _dl_debug_change_state
>> 4a3e5f1e4c elf: Introduce separate _r_debug_array variable
>> 940d821afb Use TLS initial-exec model for __libc_tsd_CTYPE_* thread va=
riables [BZ #33234]
>> 5d8614b284 ctype: Fallback initialization of TLS using relocations (bu=
g 19341, bug 32483)
>> f409ec073f Use proper extern declaration for _nl_C_LC_CTYPE_{class,tou=
pper,tolower}
>> 330cd035df Remove <libc-tsd.h>
>> c467918138 AArch64: Improve codegen SVE log1p helper
>> 6db0f659c8 AArch64: Optimise SVE FP64 Hyperbolics
>> 503f7a7d33 AArch64: Optimize SVE exp functions
>> 307a8a4434 AArch64: Improve codegen in SVE log1p
>> 2a0b52fdd6 AArch64: Optimize inverse trig functions
>> 0bb6dad5af AArch64: Optimize algorithm in users of SVE expf helper
>> daa4de5253 AArch64: Avoid memset ifunc in cpu-features.c [BZ #33112]
>> 1502c248d5 nptl: Fix SYSCALL_CANCEL for return values larger than INT_=
MAX (BZ 33245)
>> 513629b14d elf: Handle ld.so with LOAD segment gaps in _dl_find_object=
 (bug 31943)
>> f48de98bce elf: Extract rtld_setup_phdr function from dl_main
>> 62928cf7d8 elf: Do not add a copy of _dl_find_object to libc.so
>> 373408c19f stdlib: resolve a double lock init issue after fork [BZ #32=
994]
>>
>> Testing Results:
>>               Before     After    Diff
>> PASS         5829       5837      +8
>> XPASS        4          4          0
>> FAIL         240        242       +2
>> XFAIL        16         16         0
>> UNSUPPORTED  161        161        0
>>
>> Testcases changes
>>
>> testcase-name                            before           after
>> elf/check-dt-x86-64-plt(new)               -               PASS
>> elf/check-gnu2-tls(new)                    -               PASS
>> elf/tst-dlmopen4-nonpic(new)               -               PASS
>> elf/tst-dlmopen4-pic(new)                  -               PASS
>> elf/tst-dlopen-constructor-null(new)       -               PASS
>> elf/tst-link-map-contiguous-ldso(new)      -               PASS
>> elf/tst-link-map-contiguous-libc(new)      -               PASS
>> elf/tst-tls23(new)                         -               PASS
>> elf/tst-version-hash-zero(new)             -               PASS
>> ctype/tst-ctype-tls-dlmopen(new)           -               FAIL
>> ctype/tst-ctype-tls-dlopen-static(new)     -               FAIL
>> elf/ifuncmain8                            PASS              -
>>
>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.co=
m>
>> ---
>>   meta/recipes-core/glibc/glibc-version.inc | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-=
core/glibc/glibc-version.inc
>> index 881a9cce2c..b3a66f0a40 100644
>> --- a/meta/recipes-core/glibc/glibc-version.inc
>> +++ b/meta/recipes-core/glibc/glibc-version.inc
>> @@ -1,7 +1,7 @@
>>   SRCBRANCH ?=3D "release/2.41/master"
>>   PV =3D "2.41+git"
>> -SRCREV_glibc ?=3D "e7c419a2957590fb657900fc92a89708f41abd9d"
>> -SRCREV_localedef ?=3D "fab74f31b3811df543e24b6de47efdf45b538abc"
>> +SRCREV_glibc ?=3D "cf926cd7fb9500035be19bca90ba9c855dcfcf92"
>> +SRCREV_localedef ?=3D "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
> What does localedef bump bring ? Do we need it ?
We need to bump the version to include this commit:
https://github.com/kraj/localedef/commit/cba02c503d7c853a38ccfb83c57e343c=
a5ecd7e5

In glibc_2.41, they have backported the following commit, which is=20
incoming via this stable branch updates.
https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Da894f04d877653be=
a1639fc9a4adf73bd9347bf4

Without the corresponding fix from localedef, the following build error=20
will occur:

In file included from glibc/locale/programs/ld-monetary.c:33:
glibc/locale/localeinfo.h:241:20: error: expected =E2=80=98=3D=E2=80=99, =
=E2=80=98,=E2=80=99, =E2=80=98;=E2=80=99, =E2=80=98asm=E2=80=99=20
or =E2=80=98__attribute__=E2=80=99 before =E2=80=98attribute_tls_model_ie=
=E2=80=99
 =C2=A0 241 |=C2=A0 =C2=A0attribute_hidden attribute_tls_model_ie;
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~
>
>>   GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dht=
tps"
>>
>> --
>> 2.49.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#225324): https://lists.openembedded.org/g/openembe=
dded-core/message/225324
>> Mute This Topic: https://lists.openembedded.org/mt/115971173/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

