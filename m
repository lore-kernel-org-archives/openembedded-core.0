Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D00CAC5BB
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 09:27:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4820.1760088443088517157
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 02:27:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=DP0nHGwz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2378ef0ff0=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59A73F2A2142128
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 02:27:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=sjqsLhRBvmY9OP09DUoSbGbMcUfGd4xUPl2rPsKo78A=; b=
	DP0nHGwzR35ONpJvWNe6FWKfvTpjo/h4/hPuSbPFiO6iimAA/RB8JiIbtY++bkoX
	qO9rtJYmOsJnSNo59DZsR+skmfVQaRSi4+M0MnvMnnl7x9JjYiv6nHMPlxbGSgrf
	WbJ4BR0wHj/Qd/p38FNmKvTG8S9ZswCS2WQNK3yEPF7eokGPxezqiMWC1llJ1fb2
	nosK0Ps3wnJ5jvXg8/Stf4xCkhWGbR6Amf3yATymfr+p4mYsmtQ6Ro6RAaXTkTJp
	3Z+GQtdTSVWZxCX1VURNLO/RebjYn/j2DFGpQCSlXSlQH7RY4vJkVYHP68jg8TUD
	Ul3GSRg2TY8GPRc3bENukA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012003.outbound.protection.outlook.com [40.107.209.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49nx2x1xwd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 10 Oct 2025 02:27:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhs91IzQpTAfooQyYN3ph4QOOjpT7R6s2kkQrFZ8zQH9EuFWL/4p55fTA5GuPjY82HwVFqMfJbKV3pYiKYMtX6AWUTCBKsi0u5jiDnf7EVPVbTuRM1kh7E9xRFSt6Eom9liWNfoA8wds6ph8azxjVvP0WR+HOK2jqlqcbJ5NWQe3/bCQSa2gE+mw5G/oANkrKCk08ACvIEta24GnR9P9fv2j4MQpyJ3QdSiITxEvbEUAuep2J1nuFrthgMV/9gycAfwdB4OtzubinA+3auj8Ffh5d0UETdSknExNsQc/bhFsgh+0drDDQqH9mgMNAUqK3KKkk9u2qS/m7uaphwq6bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjqsLhRBvmY9OP09DUoSbGbMcUfGd4xUPl2rPsKo78A=;
 b=uMClRTACynscghAiAQA2ZRKrsw1J0riYHgW0BEd+b84YXHttUAwm5Rsw1bCi0i40um8ieNq0swz5Kaot0f0ynokQF/ezRLyERBu3BUeWC9273f6RfQlsYbjgJFcUZNz5YnyQtBoeLVTpwzoD517CQNYPqRD+eY+IGifh2EivUwwj8gh2u6EC2WsVW2m1pJWwPYS5MjpC925oFD4oxWoP0BPVa+9NZXmKFzM+d8YuYulHNTLUH60BvqE4olJWovItXu5DDZxWn8L4ToUDyyCNtyDnahq06JlhDn7wmvpVHO/szaaP9paQztcjy6KcpJxSw0oHmUB2e4cVo8OWz8kMDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SN7PR11MB6703.namprd11.prod.outlook.com (2603:10b6:806:268::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Fri, 10 Oct
 2025 09:27:19 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9182.017; Fri, 10 Oct 2025
 09:27:19 +0000
Message-ID: <c92e491f-6348-4c73-b899-c28611a5f803@windriver.com>
Date: Fri, 10 Oct 2025 14:57:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V3 1/2] rust: Use clang instead of rust-llvm
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Khem Raj <raj.khem@gmail.com>, Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
References: <20250926102411.3742996-1-Deepesh.Varatharajan@windriver.com>
 <9433bf5a-8648-4142-a17f-69092253dd46@gmail.com>
 <f07bc225-e3b6-4ac9-b6e4-de52d4053618@windriver.com>
 <CAMKF1spO_MP=CtN8rdG3S=YE2qmUEVYfCDsRrxzo6pipvpJD6w@mail.gmail.com>
 <55dd2edb-6faf-446d-b28a-4bace9859169@windriver.com>
 <CAMKF1srTjQc4ib7vo4+OPdDxzKj6fWowniUQajcvRGy-nUDv2w@mail.gmail.com>
 <a7b7c7a1-7110-427b-b883-c097e62c447f@windriver.com>
 <d9e3ca199410d01d4703bc5a07e16632e8a41272.camel@linuxfoundation.org>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <d9e3ca199410d01d4703bc5a07e16632e8a41272.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA5PR01CA0189.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::17) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SN7PR11MB6703:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d9b0e67-1714-4255-6b4f-08de07df35ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K0RWVklMWjhxcENKdTdHa0M5amVnMDVjUVl4NE5QdksyaStaNWVQa2hySjUz?=
 =?utf-8?B?d3djbyt0WDhZa0toazZSQjQrMndFcHdRVVlBZzFvTHIwUUszemdSYXJ4eFdq?=
 =?utf-8?B?L1VFMkpOWVJqdm95QWVCUmZQWGh2NENEakE3eUtCNGNiZHpzbFlka0d1OXVs?=
 =?utf-8?B?dVVCZzUzblY2c3lOUXovbmxNbTZLeDBiWFdRNTNrMG83TkFEeHkzM3hyVEor?=
 =?utf-8?B?YnNJOGRpMzhTdUFIcFYzbkdnRzJ1RkFhUjcxdHdyVjV2Y2FOUjlESC83Nnp2?=
 =?utf-8?B?cU5DMzFhNHd0UTN0MTlCbnlVeE5kNHExMUdYQkEzUXd3VmdYaXdpeE9Tc2tO?=
 =?utf-8?B?V0hvc1JBT2hvMWI2MmdxOEROTS9zT1ExSFBmOFJrWW4rblp4NzBKbjN0OU92?=
 =?utf-8?B?OXlwdGdkNUtTRWpKbk5lWnZHY3ZEVTNtZUZIWC8xeUlaNXNmdmI5VkdxcTV4?=
 =?utf-8?B?NlU5NWVQTXhORzB2RlppeHp1bHNEb0h6TmZnM25IeHFRTGxUOEZmcTZCM3RM?=
 =?utf-8?B?d2lISG5TdEVQeXYrZ1hvc1h2eURxdDBJcFVacXdUVXBVL3FKUUhIOEJwWUdo?=
 =?utf-8?B?UGJnK1NQREp5TS9UNCtDcHoxcGhtTkJoYjExRnZvRGl3L2dUVXJQelVOQW1M?=
 =?utf-8?B?UHJsSnI3RHFxWmFKck4wSDVyb3pUc0gwdEFBNy90SEdBdk8zcjEyT1ZGcUFE?=
 =?utf-8?B?LzNTK0lMVmRrangwVmNnazl4d3FXY29FMy9VNGV1TStjVFRiVEFIUGhJaUIr?=
 =?utf-8?B?UGFtS3ZyTXpyaHdkRmFpQWsvNjMwMFM5S2tESXdLODJrVVZyU2dRSWh5QzZC?=
 =?utf-8?B?dmlSSGN1QWxLNG12QmlJT0NRSWJaZUgyNlg2R1F1MHBSZk5MdnczQWg1TUJU?=
 =?utf-8?B?dHFZUkFGL3AydkxnZ1IvckpDd1MrRDdyNzZiRGlZdlFvVHd5cU01ZWpmZ3JF?=
 =?utf-8?B?bC9jd1ZpV3pCOXlkblJaS2RyaU10WFRmY3BtejRVQTVHekVRVHh3VndxaGwr?=
 =?utf-8?B?VVliSGVDNkdhQVNYRmVRN3ZYbmIvV3lOaDVmRDR5aTdQL0xpdVgvb1Ntc2Y0?=
 =?utf-8?B?UklxY1hMSHJwQXNJYzYwUWszSW85djNvNnJUakptc2RHT0M0bnZvaHNkT1hE?=
 =?utf-8?B?NGR3VGZ3dC9hVlhudEdkbnptR3I5TDhHa0JKR0NVNW85Yk1zSEUrUUJrVW5P?=
 =?utf-8?B?Rm9rbVRGNHBsendrR1M3NTJvejhITXlPNkNpTGhoTU5Xam9HMFlIdXN1a0Vs?=
 =?utf-8?B?SlJZci9pUXB0bDZQY2JuVWNRc2F5eGo0aTQrTEozNW5kVGlFbU44TE0zTjE4?=
 =?utf-8?B?Vm1ydVFDdVA5ZVozRlRUU2VxRm9pOU1zUHlWT3FUMDIrR2xScUdZVTBHZmww?=
 =?utf-8?B?cW9xNXdsSloxc0NHUUIxSjBhRmg0NGJsM2UybkhxS2xCeStlUU91R2s2QVJC?=
 =?utf-8?B?TlAzWnJCcmtvT2lkRWZzajNTUUdDSkNpL05WS01aUVQ3cGhiUzdoTnYyUHBh?=
 =?utf-8?B?Q3ljdTdaZk92bGZ1eFliM3YrWmR4VUVqc0tUeXNtcUZneEFza1Z6ampuR3I0?=
 =?utf-8?B?ZURyZUxONllocTBJZ3YyZTlrT05NT0xQSG44YWpQQVJ0Y1loT1dNT2lNYWVL?=
 =?utf-8?B?MVhHcytZUEwyWlVuZXU0K2x3a1NKM0NMMHp5b1EvRXVqSzE3V2dJYi9tano1?=
 =?utf-8?B?NmVna0xGbXdkRGVYeGhSdVFHTTVnc2diM3JKdVk3Vk5RaCtibXNFZVRHb244?=
 =?utf-8?B?UU5BMkZSdlBuY0g1Z0tZVG81QWdsMUFJYm44ZDRYakVkdHYrbjVPejgwTHJy?=
 =?utf-8?B?ZUExNjNSb3NpdUxkV1ZrU05GTFgvamVXSUs3TXlRalBqUmwra0l5dmx3Zmth?=
 =?utf-8?B?TXJSSjE3NXQ5b2xGYnRUaGlVbXBrSzBaYXUwaG1RT0ZqUXc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bUpiaVdtcDdLcHZPdEh2TGhRVkdNRjgwSUNhRDh0amkxN3hXNGxhODBWTTd4?=
 =?utf-8?B?WW1ldXBLN2plM3FTMG1kbEt5SGZpVm53RitpdExmVlhZS0cvazM2OTRycUNU?=
 =?utf-8?B?WDRsd1JUZHlleldhcWJOakpMeVIxenJzeEptSUs5TlZ2KzNjR0pHUTNSdUM2?=
 =?utf-8?B?WDNWc0o0dkczQ3c1RzhsaXRHZ2RxVWdUMVEvZTFSQThWbmhzZTV3b2dXVk5G?=
 =?utf-8?B?aWE0bzRkN20rMXE0eHFuYTd5N3dXdVNSaldrNDNHa0lEUHhLSkRONDBLOWJv?=
 =?utf-8?B?dnlXNDFiU0RUS1ZKb21LQ1pjRjB4cng0UFFqYThRKzBZSVBEWHRYOFJyOFRl?=
 =?utf-8?B?WWJGYW1Yb0lGZ3NabTBIbkVPRnJrMGUzanpWdGdkcUlJMzNPNkhRWWI3MEVo?=
 =?utf-8?B?Rml3MkZsdGdCMUlKamhnTG5tZ1FOSWtMUHBxSmN1TXgzWUE4S0x5YW5XTjlO?=
 =?utf-8?B?K1lJaXkwc0ZRR0NMWURSWVJIOURFeEtDeUs2WElvUThVR1Q4R3hZRDRDMUgz?=
 =?utf-8?B?ZmxpSUdmR0ZwR1FvM3lKTWQ1L3liU1Z4ZnRFd0w0eEc5VDlkMHgyMTV5NkNM?=
 =?utf-8?B?TVJtRWtwa1pZYi9kdzh3eVRKOWp2NXgzTmxNREc5RHEyS0UzSFE4SHlROFhp?=
 =?utf-8?B?cHVkVVZzczc0enRVbVVnUWJraG1KMndEcGx5RlJubkFKVUlONFZaUWgwUHdB?=
 =?utf-8?B?eFhIMjZLb3N2SENsMk9rbTc5WDRrUkNjbmN6VjBoUFNSektLV29CK3FHUVhr?=
 =?utf-8?B?SHZPYktBNHBNTzdjUlVYdFVDS2I2RFVWM21TcmQyQlZuSy9kSmU1RUYrZUVm?=
 =?utf-8?B?T0o3aTA2WDdtdEdOa1dKbHJWcVZyZS9CZEEzZUkrUFBEc0RPWXhrVVk4VFpZ?=
 =?utf-8?B?TFhUODgyb3BPekhrL1p5K25GeG9xOG1OTVlGdGpTY1dOUk1zaFlZb0dMbDdI?=
 =?utf-8?B?ZUlkSDAvYUJxZzA5UWJ2bWlrQ2JSNmp5T0toWHJCdW02WFZ2RkMvNEpNVUFG?=
 =?utf-8?B?NlJwOVlvRDl5bUcrWjFwNTY1SEkySENNUGZrMXhIOW9TTXdOVUxyTVlEMFY5?=
 =?utf-8?B?OFQ2Vi84NDN0N1NsVnlURVdtdDV3ck5TbVNnd0dNTlFXcStOc3VVejVSc2c5?=
 =?utf-8?B?eVA5VUdiOGJDTnZETXZwT0RscmNoUVN1UXY4WHErcE9wcXhobDlIWm9QNWdX?=
 =?utf-8?B?Nko4aWdxVUVmK0YvNnMvMmRqL0VKd2ZITktJenZUOXVmQmNGYlZHWmk2WGNW?=
 =?utf-8?B?Y1AvbkFxSlpDenpjb2xHSG04N3ZyQXArS2JIRFdMODlwMVN2MjJhY3RKVGNG?=
 =?utf-8?B?T3pRUVNxcU9BdWYzakNKdE5Cakh2MC9aeUhTRml2Ri9UVkFpTzhSYnJ2Zitj?=
 =?utf-8?B?M0NlL0lMYkJvN1VpeHdEdXFPdVhzcUFPSWU4ay80dGdUMU5JM3VKM1RMYmZO?=
 =?utf-8?B?RmQzcmpFUGxWRUVieWF6Z0JDS3lHVnZZNElnblRmU0NWekJKMjBhczJqMzd5?=
 =?utf-8?B?WDJvZFAraUh4WVNlRFVpcDVQU1RtM2FCV2pOZWhDaFBLMkZLSjZQNlBHSEww?=
 =?utf-8?B?RFpEaE1vUG9qM2pia1l2Ym9GOGVHZElCNUlyRHNjdGQvdTNYNGpFOXNuZnB3?=
 =?utf-8?B?MStHU3dzUnk0NGdldzRpais1ZUc0dSs0T0dhRzM1Q0xhV2FCQjVLNllyYVlE?=
 =?utf-8?B?YzV4MlljV3BpQXFSQjdWaFBaT2VQMnRYN3JFWlZldFJ0Rk54RkRzQW9CUURJ?=
 =?utf-8?B?d0VURTIxdzZhWVlzM3pRbmdUV0VuL0hiRkYyUVBTMVpiMWVvOStJYlU3MmM2?=
 =?utf-8?B?OVMrOW53QmNQcEVKNWZhQjErYjU0SmZnMmFhL09RZEx0VTRxVWxpanpBc1Mz?=
 =?utf-8?B?RXpjWlZaM0FEVFdUUlpJZWh6bGVEWGZKWDNDellGV0R5cXY0UnZCUEx0VFJZ?=
 =?utf-8?B?TVJhVlYwLzhCdVFyc01iWWNCL1hzRnQ5WWk4Z1RmYXJNZGlWeXlWUGMxYWNU?=
 =?utf-8?B?aktZV245UFRQZTZ4QktlODlTUzd0ZHhMWXJpa0RNSlNzTFNCRUMzYWZXM0t0?=
 =?utf-8?B?MXRrcUNIQ3pMYmVUdWNaeW9pOGtsYXVpT3JaMjk5bTI5Q2xiRnY4YTRDMENW?=
 =?utf-8?B?cFUweFZ1eHF0ODREcTFVQXBCS0QxWHpqZmw3SE0vK1NwVGtPeXBEMExlcGpB?=
 =?utf-8?Q?Fi/T5hEMwgfw9YuW0po1P5k=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d9b0e67-1714-4255-6b4f-08de07df35ab
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 09:27:19.6668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rbd21fC2yoQpkJUKxi9cs+UJ2E8kEN88ROzNfZyUxHBKNRWjqdKsSVsNl/QJJZlAVBDE4nUxIRoFOuLFcd5gAz4LBbXHX30vHT+R584mde46SRhJdhFkGiomEXlh+Ug/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6703
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: G-yPbRLDSvJ9efJTrdam7DhR3svOw3KU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEwMDA1NCBTYWx0ZWRfX2ylxbLB355db
 /OxkJpjUSyC8iYD5MmkwbncXBNfJJIE7mv/7+/Rk3a3MlL97oF11C9e4jae7W3I9PyJn+1iFCYX
 MIin4kFK7qxYVA+kMqvZbaN9tqaCZOYqFFou8q1d+yvR979EMe4vrGanzKbwVoyUK3cf3lAH7vo
 ommWnel4CsMtJGF374zG2O3gd/qjQTT8MfDqqBxfBT2uuVoRfTioo+ralNQQaiL0kA9x+yHDu4h
 8d1IT3KHzDfmDMj/RsXT/PAffJuncISTlFjNtUd/WJE7bRvCgbEEbRrDdP7vEfvJos8AV1bdU12
 n3Js3/krk30a1yiuXYaW7B24jEcrpq09Xq3O8yr/XFTCo+enNUlCU1e5ZtltvvStEpV543CJ+Vw
 iquj4GMB+zQ7fcpSbLpNsMynDmo/GA==
X-Proofpoint-ORIG-GUID: 8_qy_SLnfoPCuORz8OnU3PTfjScrfdjs
X-Authority-Analysis: v=2.4 cv=N78k1m9B c=1 sm=1 tr=0 ts=68e8d17a cx=c_pps
 a=9H9ADJ10uJ0pYmVeXPB43g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=ei4SEBeUAAAA:8
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=R9nGaZw9AG3y5CAOIbsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Hqou25T6mLgA:10
 a=8zIOOLb7Ym0NljyPXbuS:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510100054
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 59A73F2A2142128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 09:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224673


On 08-10-2025 18:24, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, 2025-10-08 at 18:19 +0530, Varatharajan, Deepesh via lists.open=
embedded.org wrote:
>> On 08-10-2025 01:47, Khem Raj wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
>>>
>>> On Tue, Oct 7, 2025 at 4:10=E2=80=AFAM Deepesh Varatharajan
>>> <deepesh.varatharajan@windriver.com> wrote:
>>>> On 02-10-2025 00:59, Khem Raj wrote:
>>>>> CAUTION: This email comes from a non Wind River email account!
>>>>> Do not click links or open attachments unless you recognize the sen=
der and know the content is safe.
>>>>>
>>>>> On Mon, Sep 29, 2025 at 1:29=E2=80=AFAM Deepesh Varatharajan
>>>>> <deepesh.varatharajan@windriver.com> wrote:
>>>>>> On 26-09-2025 23:00, Khem Raj wrote:
>>>>>>> CAUTION: This email comes from a non Wind River email account!
>>>>>>> Do not click links or open attachments unless you recognize the s=
ender
>>>>>>> and know the content is safe.
>>>>>>>
>>>>>>> On 9/26/25 3:24 AM, Varatharajan, Deepesh via lists.openembedded.=
org
>>>>>>> wrote:
>>>>>>>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>>>>>>>
>>>>>>>> Updated the Rust build to depend on Clang instead.
>>>>>>>>
>>>>>>>> *Summary of discussion with the rust upstream about using latest=
 LLVM
>>>>>>>> instead of Rust maintained LLVM fork.
>>>>>>>> https://internals.rust-lang.org/t/can-we-use-proper-clang-instea=
d-of-llvm-fork-what-rust-uses/23489
>>>>>>>>
>>>>>>>>
>>>>>>>> *Upstream LLVM is generally compatible:
>>>>>>>> - Rust does support building with upstream (vanilla) LLVM, espec=
ially
>>>>>>>> the latest
>>>>>>>> major release and the one or two preceding ones.
>>>>>>>> https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html=
#updating-llvm
>>>>>>>>
>>>>>>>>
>>>>>>>> *Impact on Yocto Rust upgrades:
>>>>>>>> - Rust upgrades shall always check for updates on rust forked ll=
vm
>>>>>>>> and backport
>>>>>>>> the relevant patches to clang's llvm.
>>>>>>>>
>>>>>>>> *Regarding the rust forked llvm local patches:
>>>>>>>> - There are no local patches on rust forked llvm other than the
>>>>>>>> backported fixes
>>>>>>>> from llvm master.
>>>>>>>>
>>>>>>>> *We now add these flags "-Clink-arg=3D-lz -Clink-arg=3D-lzstd" b=
ecause of
>>>>>>>> this following
>>>>>>>> diff otherwise we will get errors during link time.
>>>>>>>>
>>>>>>>> Setup in rust-llvm
>>>>>>>> -DLLVM_ENABLE_ZLIB=3DOFF \
>>>>>>>> -DLLVM_ENABLE_ZSTD=3DOFF \
>>>>>>>> -DLLVM_ENABLE_FFI=3DOFF \
>>>>>>>>
>>>>>>>> Setup in clang
>>>>>>>> -DLLVM_ENABLE_FFI=3DON \
>>>>>>>> -DLLVM_ENABLE_ZSTD=3DON \
>>>>>>>>
>>>>>>>> *When multilibs enabled:
>>>>>>>>
>>>>>>>> llvm-config expects static libraries to be located in the lib
>>>>>>>> directory rather than
>>>>>>>> lib64. However, since LLVM is built as a non-multilib component,=
 the
>>>>>>>> lib directory
>>>>>>>> doesn't contain any library files. To accommodate this without
>>>>>>>> breaking multilib
>>>>>>>> behavior, we copy the required library files appropriately.
>>>>>>>>
>>>>>>>> Previously, when we depended on rust-llvm, this worked because w=
e
>>>>>>>> specified:
>>>>>>>> -DCMAKE_INSTALL_PREFIX:PATH=3D${libdir}/llvm-rust
>>>>>>>>
>>>>>>>> With this setup, llvm-config was installed inside
>>>>>>>> ${libdir}/llvm-rust, which included
>>>>>>>> its own bin and lib directories. Thus, llvm-config located in bi=
n
>>>>>>>> would correctly find
>>>>>>>> the libraries in the adjacent lib directory.
>>>>>>>>
>>>>>>>> Even when multilib was enabled or not, llvm-config would still l=
ook
>>>>>>>> for libraries under
>>>>>>>> lib in this structure, so everything functioned as expected.
>>>>>>>>
>>>>>>>> *Changes needs to be done when llvm splits from clang:
>>>>>>>> In rust recipe:
>>>>>>>> Update the dependency from:
>>>>>>>> DEPENDS +=3D "ninja-native clang" to DEPENDS +=3D "ninja-native =
llvm"
>>>>>>>>
>>>>>>>> In llvm recipe:
>>>>>>>> Apply the same changes that were made in the Clang recipe, as th=
ose
>>>>>>>> configurations have now been moved to the LLVM recipe after the =
split.
>>>>>>>>
>>>>>>>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windri=
ver.com>
>>>>>>>> ---
>>>>>>>>      meta/recipes-devtools/clang/clang_git.bb     |=C2=A0 4 ++--
>>>>>>>>      meta/recipes-devtools/clang/common-clang.inc |=C2=A0 6 +++-=
--
>>>>>>>>      meta/recipes-devtools/rust/rust_1.90.0.bb    | 18 +++++++++=
+++++----
>>>>>>>>      3 files changed, 19 insertions(+), 9 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/meta/recipes-devtools/clang/clang_git.bb
>>>>>>>> b/meta/recipes-devtools/clang/clang_git.bb
>>>>>>>> index 53bca1c24f..3e117b308b 100644
>>>>>>>> --- a/meta/recipes-devtools/clang/clang_git.bb
>>>>>>>> +++ b/meta/recipes-devtools/clang/clang_git.bb
>>>>>>>> @@ -83,7 +83,6 @@ OECMAKE_SOURCEPATH =3D "${S}/llvm"
>>>>>>>>      # https://github.com/llvm/llvm-project/blob/main/llvm/CMake=
Lists.txt
>>>>>>>>      LLVM_TARGETS_GPU ?=3D "${@bb.utils.contains_any('DISTRO_FEA=
TURES',
>>>>>>>> 'opencl opengl vulkan', 'AMDGPU;NVPTX;SPIRV', '', d)}"
>>>>>>>>      LLVM_TARGETS_TO_BUILD ?=3D
>>>>>>>> "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;${LLVM_TARGETS=
_GPU}"
>>>>>>>> -LLVM_TARGETS_TO_BUILD:class-target ?=3D "${@get_clang_host_arch=
(bb,
>>>>>>>> d)};BPF;${LLVM_TARGETS_GPU}"
>>>>>>> compiler we build is building all architectures once because it t=
hen
>>>>>>> reuses same compiler for all cross compilers just by creating can=
onical
>>>>>>> symlinks, this change is not going to work.
>>>>>> We removed this line because, for the clang class-target build, LL=
VM was
>>>>>> only compiling
>>>>>> libraries for the target architecture and GPU targets and kept ins=
ide
>>>>>> the target
>>>>>> sysroot. Since we use the llvm-config built for the class-target d=
uring
>>>>>> the Rust target build,
>>>>>> it was failing due to the absence of static libraries for other
>>>>>> architectures in the target sysroot.
>>>>>> Here the target is x86 arch. So, it compiled libraries for x86 arc=
h only
>>>>>> and we can see the error
>>>>>> for missing libraries for other archs as below:
>>>>>>
>>>>>>>    --- stderr
>>>>>>>    llvm-config: error: missing:
>>>>>> poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroo=
t/usr/lib/libLLVMAArch64Info.a
>>>>>>>    llvm-config: error: missing:
>>>>>> poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroo=
t/usr/lib/libLLVMLoongArchInfo.a
>>>>>>>    llvm-config: error: missing:
>>>>>> poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroo=
t/usr/lib/libLLVMLoongArchDisassembler.a
>>>>>>>    llvm-config: error: missing:
>>>>>> poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroo=
t/usr/lib/libLLVMMipsInfo.a
>>>>>>>    llvm-config: error: missing:
>>>>>> poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroo=
t/usr/lib/libLLVMPowerPCInfo.a
>>>>>>>    llvm-config: error: missing:
>>>>>> poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroo=
t/usr/lib/libLLVMRISCVTargetMCA.a
>>>>>> .
>>>>>> .
>>>>>> .
>>>>>>>    thread 'main' panicked at compiler/rustc_llvm/build.rs:277:16:
>>>>>>>    command did not execute successfully:
>>>>>> "poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysro=
ot/usr/lib/llvm-config"
>>>>>>
>>>>>> "--link-static" "--libs" "aarch64" "amdgpu" "arm" "asmparser"
>>>>>> "bitreader" "bitwriter" "bpf" "coverage" "instrumentation" "ipo" "=
linker"
>>>>>> "loongarch" "lto" "mips" "nvptx" "powerpc" "riscv" "x86"
>>>>>>>    expected success, got: exit status: 1
>>>>>> Maybe instead of removing. Can we change
>>>>>> -LLVM_TARGETS_TO_BUILD:class-target ?=3D "${@get_clang_host_arch(b=
b,
>>>>>> d)};BPF;${LLVM_TARGETS_GPU}"
>>>>>> to
>>>>>> -LLVM_TARGETS_TO_BUILD:class-target ?=3D
>>>>>> "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;;BPF;${LLVM_TARG=
ETS_GPU}"
>>>>>> ?
>>>>> I think we don't want to build all the general arches for target, o=
nly
>>>>> the target arch and gpu arches
>>>>> is what is needed.  If we build all the backends, that will slow do=
wn
>>>>> things. But if target rust needs
>>>>> to support all the architectures to generate code for, then we don'=
t
>>>>> have much choice. Can you see
>>>>> if we are ok to just target one architecture ?
>>>> The issue doesn't originate from Rust directly, it stems from the
>>>> following logic
>>>> in the Rust recipe, where the natively built llvm-config is copied i=
nto
>>>> the target sysroot:
>>>>
>>>>        # Copy the natively built llvm-config into the target so we c=
an run
>>>> it. Horrible,
>>>>        # but works!
>>>>        if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} !=3D
>>>> ${RUST_ALTERNATE_EXE_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; the=
n
>>>>            mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
>>>>            cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE=
_PATH}
>>>>            if [ -e ${STAGING_LIBDIR_NATIVE}/libc++.so.1 ]; then
>>>>                patchelf --set-rpath \$ORIGIN/../../../../../`basenam=
e
>>>> ${STAGING_DIR_NATIVE}`${libdir_native} ${RUST_ALTERNATE_EXE_PATH}
>>>>            else
>>>>                patchelf --remove-rpath ${RUST_ALTERNATE_EXE_PATH}
>>>>            fi
>>>>        fi
>>>>
>>>> Since llvm-config is being copied from ${STAGING_BINDIR_NATIVE} to
>>>> ${STAGING_BINDIR},
>>>> and the native Clang was built with the following configuration:
>>>> LLVM_TARGETS_TO_BUILD ?=3D
>>>> "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;${LLVM_TARGETS_GPU=
}"
>>>>
>>>> The copied llvm-config will expect the corresponding target librarie=
s to
>>>> be present in the ${STAGING_LIBDIR}.
>>>>
>>>> To address this issue, as far as I can see we have three options.
>>>>
>>>> 1) Build clang-target also for all mentioned archs for clang-native.
>>>> 2) Copy all the required libraries from ${STAGING_LIBDIR_NATIVE} to
>>>> ${STAGING_LIBDIR}.
>>>> 3) Instead of copying llvm-config from ${STAGING_BINDIR_NATIVE} to
>>>> ${STAGING_BINDIR},
>>>>         directly make rust-target build dependent
>>>> on  ${STAGING_BINDIR_NATIVE}/llvm-config.
>>>>
>>>> Are there any better or cleaner alternatives to handle this situatio=
n?
>>>> Any suggestions would be greatly appreciated.
>>> I would prefer option 3 since these libs are inherently cross built,
>>> it perhaps does not matter if
>>> they come from native or cross built clang. But that would have been
>>> default before this copy dance
>>> was done. I might have forgotten now, if this was done specifically t=
o address a
>>> case which we can testout now.
>> Making Rust depend directly on the native llvm-config is not feasible
>> because librustc_llvm*.rlib
>> is built for the host architecture(x86-64) . While this works if the
>> target is x86-64 or x86, for
>> other architectures we get the following error:
>> we encounter the following error:
>> ld: .../librustc_llvm-f50ec2a9934e24d2.rlib: error adding symbols: fil=
e
>> format not recognized
>> collect2: error: ld returned 1 exit status
>>
>> Therefore, copying the natively built llvm-config into the target
>> sysroot and unsetting the RPATH
>> is currently the best approach, and that=E2=80=99s what we are doing. =
However,
>> even after unsetting the
>> RPATH, the native llvm-config still references to static libraries for
>> other architectures during
>> compile time. To fix this, those libraries must be present in the targ=
et
>> sysroot.
>>
>>   From what I see, the only feasible solution is to build LLVM target
>> libraries for all supported
>> architectures. Copying these libraries from the native sysroot is not
>> feasible because the native
>> sysroot contains libs for all OE-core targets, while the target sysroo=
t
>> contains libs only for its
>> specific target=E2=80=94copying would cause conflicts.
> Could it make sense to add in symlinks to the missing pieces between
> the two sysroots? We could make that part sysroot specific, i.e. not
> affect the target packages, just sysroot population?
>
> Thanks for the timings btw. Given that, I could be tempted to merge
> things, then look to improve things again in a follow up patch set.
>
> Curious on others thoughts?
>
> Cheers,
>
> Richard
>
As you suggested, I was able to resolve the missing library issue by=20
creating symlinks from the native sysroot to the target sysroot.
However, I'm now encountering a linker error during the build:

../poky/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/rust/1.90.0/=
recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-po=
ky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/15.2.0/ld:=20
../poky/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/rust/1.90.0/=
sources/rustc-1.90.0-src/build/x86_64-unknown-linux-gnu/stage1-rustc/armv=
7-poky-linux-gnueabihf/release/deps/librustc_llvm-3e591ab97f1ae683.rlib:=20

error adding symbols: file format not recognized
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0collect2: error: ld returned 1 =
exit status

Upon investigation, I found that the issue stems from architecture=20
mismatches within "librustc_llvm-3e591ab97f1ae683.rlib". I extracted
the object files from this archive and ran the file command to inspect=20
them. Most object files were correctly built for the ARM 32-bit (target):
ELF 32-bit LSB relocatable, ARM, EABI5 version 1 (SYSV), with=20
debug_info, not stripped

However, some of the object files (originating from the symlinked native=20
sysroot libraries) were built for the host architecture (x86_64):
ELF 64-bit LSB relocatable, x86-64, version 1 (SYSV), not stripped

This mixture of architectures in a single .rlib is causing the linker to=20
fail, and confirms that symlinking missing libraries
from the native sysroot won't work. So to resolve the issue we've left=20
with only one option to build llvm target also for all
the architectures as we build for native llvm build.

Please let me know if you=E2=80=99re okay with this approach, and I can p=
roceed=20
with sending the patch.

Regards,
Deepesh

