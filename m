Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75AE8C88E78
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 08:39:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15325.1769416755251182086
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 00:39:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=JPMoFX4c;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5486ac34a2=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q5QLNB1378374
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 08:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=lVDk7EEACspKBk/TFHhEv/
	dqd9t8ujb2ozo+d4J+LRo=; b=JPMoFX4cYY3ySttdrL5hY+olnb3NAHrW9rBA3H
	BpkkkcTmYFQHI4SkV3l77G0nZwSfz3gy+E3qXnJal6My/AxXpLhiY1lX4mDfwHCn
	lnL3woLTcUWRu9kfl53tdwVUizBkMbqofm+Vx3MNPtL3HB7hchxR5SMLZAVDaCuT
	KuUlQe/z0g2U+svcMyo+1Ys47qtS0S2yPkabJL9jq/lKk5swM5NLpGFWxkNQEFgm
	Ca/yIudGSKMYeocBVRQ4Vl2QbS8eq9NV6X018L8Ed72/bf9g0rymJ4HSGXcF6atA
	N8MAdnKexcqlh701k5y7AZAN9VXQmZ1qG/gk5OOWQFVbsqAg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011066.outbound.protection.outlook.com [40.107.208.66])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bvka01n8b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Jan 2026 08:39:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjXflB4GuUhmesvOurWLCP7mnezz+6QXiNWM8IwlXvETExqUflP42VF7admqMcRknQador2HTfsuQ77os0VGmgljYBtNuM9zVICt+Ohqm4pesngRqrZnNjRcjvytKkBn81HVwXXj7tto8avrP5gU0oRa9WgTU6DLmRurdiJU6wkbGpNX/2sg8IGK2GWnMbjrvhN+38fW8iYZqzgLRildEOR3367z2KwrnCSYUrxCU+BdA5OU0lzmZF9BRmVIBm7agNQTKxBNsK1+yO9HKa8a9HaVFHNo3sphtEB7JtZIDjoxqSEz5KawxH1iO4maWm1Vydzo0KYeTF6A6Wn3Qf+N7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVDk7EEACspKBk/TFHhEv/dqd9t8ujb2ozo+d4J+LRo=;
 b=NEmWF0yjfyNoimfPtR0nwyiz5MnWzGks9aiYGrfmdQo4yThePaBWtpuGRYDtfG2lLymkzvEcpssaUjsyFXg0Y3cX6zm0Y6w2n6mTmIEc/eMxSqCwn4ycOQ8Il8KYg04uPagdhQDjV4gBvg0PL/atlVE01fHl7R4P6TvElUIMpGpBUThpFZ0CiaKXxfhE7FtBRix34q8trDBebLzg6WzXs2VGXRksddwwJXuLeogOAmlUR2JMFH9gNcP4DhUzAuDLuLdIBVSECoEgcuc4YibJ7w+wGIvyjzh3k3tO5xj79+a57upKJsZxnQYjaydqu4LAg57/v5EVW1gOCCXtUjsg3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by LV3PR11MB8696.namprd11.prod.outlook.com (2603:10b6:408:216::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 08:39:11 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%3]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 08:39:11 +0000
Content-Type: multipart/alternative;
 boundary="------------Ym5qoCyNbIf2oABMKTNzUmra"
Message-ID: <8684a6b5-809b-41e4-a3b0-c99b424a1b2a@windriver.com>
Date: Mon, 26 Jan 2026 16:39:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][PATCH] bitbake.conf: remove DEBUG_PREFIX_MAP from
 TARGET_LDFLAGS
To: rs@ti.com, richard.purdie@linuxfoundation.org,
        mathieu.dubois-briand@bootlin.com, alex@linutronix.de,
        otavio@ossystems.com.br, kexin.hao@windriver.com,
        tonyb@cybernetics.com
Cc: afd@ti.com, detheridge@ti.com, denis@denix.org, reatmon@ti.com,
        openembedded-core@lists.openembedded.org, vijayp@ti.com
References: <20260122194959.13457-2-rs@ti.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <20260122194959.13457-2-rs@ti.com>
X-ClientProxiedBy: TYWPR01CA0024.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::11) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|LV3PR11MB8696:EE_
X-MS-Office365-Filtering-Correlation-Id: d9a45dcb-412c-49fe-e19e-08de5cb660aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|4022899009|13003099007|8096899003|7142099003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MWQ4M2lyNFN4dlMrb1g1a0J2bm1ka2svNFF0elRidUdvVnpabG5aTmV6dkdK?=
 =?utf-8?B?MEdZRS9hZndrcTV2SmlrTWpUYU8yK0ZCdmRjZk5YWUpFYW0vR1lhTzZrNkhw?=
 =?utf-8?B?M3VYZFNpN3FLb0psWHZtbXdPdERlNkwwSitHOGF6WFlueXFqaThCZjZ6amU5?=
 =?utf-8?B?ZHJkYXdxcDFRS2paOFg5RnBLV0JuN1VTbi9xVytpTjBUT1NHZERJT0ZqMEtU?=
 =?utf-8?B?ZjJ0ZHZiSEZmN3ZDZTk5YXZ3L0V3RUlNZG5hcmRJbzdMWTlWdURNTklOYnhn?=
 =?utf-8?B?RzZZeVg3TUdyQk5XcjVjZTBmaGhDeitQWFU2bEQ0VWtPVzRiNDNzSzBHQVpH?=
 =?utf-8?B?WFgzRzB1M0FGYjJab2UySFFBb3hETENvVFpubHVWRzV0TFhwN211U2NjZWNs?=
 =?utf-8?B?MTlyNldPY1hiVjd0cm5HbmZyV0wyd3pJTndSVlNMYllxblJUckx4MnJpTVdx?=
 =?utf-8?B?TktSMm5CRE5WSWFzVys1Y3UxbVBXS3BTbVpvME85REc0SHNydFFJQ1hKYysv?=
 =?utf-8?B?ZzFIbzF0dWRMenBoczN4QURvRzhZZ25vN3ZKQ2NDTlduUks2TzJxaWd4ekZQ?=
 =?utf-8?B?c1pYNjUxdWpGcVFkNTZDN1cvMThoR0tBNHdSNjBlTzdxbnJhWE1jVTNOa3FL?=
 =?utf-8?B?RW9YT2dpdVhITjFoVVZyc0pWa2ZnS2RlVTV3Y29qdnNBeXh0VVZTazk5cnBZ?=
 =?utf-8?B?dGJ5VVA3dm5za1E1TnJTbWMyc05GaXRiVGlzYnQ2cDNadFFPejU0M2h6bUFI?=
 =?utf-8?B?N0cxR2xCMFlpSTU1TEhPZmpFdVNRaVhCaTBiOFBhNFNlK0VLeWpISVFQQ25x?=
 =?utf-8?B?bzA5b2RGcmtuZTZFWVF0eW5ieDFlclNQd21jR2V2N2ZpbE9pTGhGL3ZMRVNk?=
 =?utf-8?B?WVdDOXZVNWJ5MzJwbEhGbEkrbGdDU0FYdXNWQ1g3ZXVtZWs2aVdtRGllbWVH?=
 =?utf-8?B?Qkl0S0lCS1VFY2FrdWxmSC96MGdFbFNNdHRNdHQxNXhCL3NHLzlyMUhiNjRo?=
 =?utf-8?B?ckdrdnB5blE1K0c1dWJGZWhSRWRqdTZ3ald4WUtnOWpOdGExd0hhNjhaTVJ2?=
 =?utf-8?B?T2x2N1VUejlEcWpCMnRSRmdNSzU0alc2ZzFWT0t3TU52bnMyakZyZmJ0enBk?=
 =?utf-8?B?MVlaNnBqbko2cGJlWDZ2M3FwWFArVk82NzdVbDAxekVPenA0QVhNNWdIYkZa?=
 =?utf-8?B?VmlXWVhQeHQ2MExNdSs2S3MyRzYzeStkeitXcHgrMGFJTXpFOTgvT2xoVzZp?=
 =?utf-8?B?b042NytoRVZxZVhNYVE3dHNKTkpOMnRjVlZQVk1IVXVHVUEvUzB4VnREMmlZ?=
 =?utf-8?B?Z0J5NThVemE5djU1VjNVdXR4bTVNWktOWmlPc3liQ1ZBMFNsWnpNbmh3Y01R?=
 =?utf-8?B?WEU0TFNZcG9QRjFnUzhiMWtTU0hmN3VVM01Eb280STIxVzlqdUdoeHVIY1ZX?=
 =?utf-8?B?S25DY0ZxVjNxNlQwVmt3UVduU2Jzb04wU0NScnhqdUE3aEMzY2p5MGduV0xZ?=
 =?utf-8?B?NWNYdHZRdnZwd0lNNU1IZGN3SXFmNVRsVjN3YXdWUDU5OFdRbHZXN0FodEx2?=
 =?utf-8?B?NWNoZjJFdHdZZkdiTHQ1aVY0d3ZEd0xNdm1BUW40N0RNNmNmYkpOWnpKMVIz?=
 =?utf-8?B?ZXg4TEVoZEpEclFobkJhQUFMTWFKa2dtNVhCcS9ROUVEYlhaTFgrRTdWZzEy?=
 =?utf-8?B?bVlPSmhJb1ZhMkQybDlqTHF5bG1kKytCeWZlejdzdkFrSVlWRjZaQ2xLVmlw?=
 =?utf-8?B?ZkxhRjArYXJHMndyY0VGTm4zMkVwK2h1QTRQK0t6NGNhdElKWkVYMnNHZldn?=
 =?utf-8?B?c044WU5Ic280VklRcEM5Wm84Q2MwS1JodTBYNG5hNjJkMHBqai81TS85dUVM?=
 =?utf-8?B?TkRKSVkydXV0WUl6WGtIdWtZOWlkSFNUNnVZRDE5d2JqQ2FpZXdnMnRMRHFZ?=
 =?utf-8?B?b1ArQTJQWXNrckNoeFpRaUVJQ29lcHJ6VmIwK2N1M2VuL1FLNHRMbHBIZmQw?=
 =?utf-8?B?bmhtVitCM3BaT1NkY2tDZkgvL21hQm5yandjbWlmaDVHRDRadHMyaU1EN0Nw?=
 =?utf-8?Q?FT0TCB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(4022899009)(13003099007)(8096899003)(7142099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QUJDOXFjZDhVZHhNZHVqRWgrcmdQZEFSelh2YUQwVS9tcHMwNzJ4R2s2V3NH?=
 =?utf-8?B?SGI5QjdETGtoOEVNSnErTFg1V2RIOW5LOE9tbzk3Sk0rUUVzZXUyTDhkLy84?=
 =?utf-8?B?TG1pY3lOVjZWUXhVZkNPMVVjRFlQWllwNGRVbFdlZFgrVnJETXZvcm9iNzNw?=
 =?utf-8?B?ZHA3a1gzSHpaVjJpZXlydFhTMjBpZWx5d3lUVkcranlEYXJYakJRcUZJRXRj?=
 =?utf-8?B?dk5HbXczUnIzWmR1TWhPejErMm9hMnluUEZHQXZYTGNIb243eVZwSXpBaHhk?=
 =?utf-8?B?RHZjejJLeU9ycWdwSVFTeTF1bEpxcXpLUTI0V2V4N2s2VnRrU3MxTHBJdlIv?=
 =?utf-8?B?bkhEQ3oxL09wZUtxVzVpT3YyZG9VK3pJR0h6dzJ2dTkvamxHUUwvcjYwcGEx?=
 =?utf-8?B?VktoaUp0TWszTjdCKysyMllBdlhpSXIvRzZORElGU2dZYkF0bEJTdUF2S0Yz?=
 =?utf-8?B?Vkh0cHE3cUVDN05PbzBFakhSQUc4UmVoQmxyZkRjeEdDMHVTUVRiQ0MyVWI2?=
 =?utf-8?B?a2FUK3hySHlzVnNDeHBzQ0wxU0FzZTBXVnE5Slg4cDBTZTZiaWgyZXFnSUUy?=
 =?utf-8?B?WjlzSmw5aWRzV0FKY0IyQUluWjcvWEhPM1FxMEJjemcvNU1kckh1cEJvVU96?=
 =?utf-8?B?K3MvbzF6YWVSZTUrcTlwekRCNW1DUGJjbE53SzhmMzhOOGhZYVJ1RWRZcG5p?=
 =?utf-8?B?NGVKOHVCYXFhWDFRUzlEWnhuZlVpcWlRY1IweCtYZ00wZ0huMXdQdHpsMTYr?=
 =?utf-8?B?NjZXRHdQMkF6TThUcHcyRkpmVG05M2ViM3Npa2ZmM1ExL3dNSVVjWmt0dEsv?=
 =?utf-8?B?OWFRS1NpdWZqVnZGYklOSG83VkxmRWNEYmRodHdkbC9BN2tmd2ljM3drVFFD?=
 =?utf-8?B?cURLSmY0SlJmTEpGeHhlNFhqcUNCVS9Zem8vTDRRdHBIeEIvVWhIcktUamlr?=
 =?utf-8?B?Z3hYZ00rbGg4akE1Z05ySi9jSG1xelBhbC9BSGVucXYrNE0wZDhlSUl5N1BJ?=
 =?utf-8?B?bFRrUFlmb3BUQnhYVDdXcmpKM1FnR0JsSmRyOGJBREowdW4wd1RpeEVMem1j?=
 =?utf-8?B?RnAvUlhycUU5bThOcDZrRzJpejFpSjRtWVlLVzBoaThqTU0zYkdYTWI5T3RG?=
 =?utf-8?B?SWdGRjdKMGJ1R05admFDQmIrTGs4VnluaGtHNmNRc2loTGhuZ3hWT1RhcGE4?=
 =?utf-8?B?K0U2TFVDL2MrN3Z6Ukw3WGdzTmVTb0VLT0JXVHNiNW5zVDlCVCsyK2lHOUli?=
 =?utf-8?B?L3MyU1Jxc2trMlFQcWNYT1NRSUsremJIZEdlUVhJWjZWU0NWbnhNN2FjZ3Yv?=
 =?utf-8?B?RjNRUTMvV3lJZmVSUzI1dTNBa0x0Q1RLZVEyZVhVQ1BSVjhiK1VWRnI4OHhJ?=
 =?utf-8?B?a3JKeHZnSnlZa3BKekZKeVVobTVDUmxXdGNDcDVOWUxZalJjNmdlaXdnSUZG?=
 =?utf-8?B?U24vSTVobmc4WExJYWFIaHhTN21uRUlxS1JLakZxV2JhTEw3ellYQWdPaVZB?=
 =?utf-8?B?ZENJbTBVT2xFcWpPUVpqeGZlUkZJSEpjU1FYMVlWSDBSRnErU3VTSTRKQlFj?=
 =?utf-8?B?a0tKemZGZDdNTXVBWDZhWi9BeW9CR0ROdzU2VC9GZ05wLzNjK2tKaDV3S09n?=
 =?utf-8?B?eHNCYTd2WUFjK2FyVzQwTk94SGdKYTlVTnlrL2FQTFVsVG1OTnluTHNKb3lJ?=
 =?utf-8?B?WDVzWmRVSDQwTmFabVBGTHpMbldyQWdMcHQ5REJiNmQvSksxOUJ6eFFVVmZt?=
 =?utf-8?B?cWxqemsxRWJTK0FMSGNueHBsbkRTV2ZHeGJjWFdUODJkdU9Qc0E5TVEvTjFk?=
 =?utf-8?B?TktyM1V3bmNpQjJwVGRhcVREYXdiczAzeTRpbC9HWklRcVNqdzVHQkRyQzdm?=
 =?utf-8?B?a3pxeGtJWEdwcjVKcks5WmFWZEwrNjVpbmVCUGFRNmFvTXJtbFh6THRsLzJV?=
 =?utf-8?B?U1Ayd0sxcHUyeTZjV1VoM2tKNng3WXZNdWM1cTZ6WEErVGpzUjZ5cjNYeTh4?=
 =?utf-8?B?QVBWMWp2U0VXNWdQbzl5TE5Fak9vQ0c5VmRnOUhoK3RPNndIWEJmaW83bUll?=
 =?utf-8?B?MC9mT2ZZeVk2Q0dldXJrcHAwZTNNb0g3b2N3TjM1TVBpMzJ5blZHQkR3Wm8v?=
 =?utf-8?B?VGtibHpPRzkvclF0MHU0OEJ5RE5QL29SbDZLOWpFZWNGUGlTb3IweEJQRXdO?=
 =?utf-8?B?ZENxdlpJV0lQbHBCbTljdTIraWFhcDZ6Z2MxZExnQS9GdVYxV0hCWEtJWGhL?=
 =?utf-8?B?bi9oQWZQRkVxZFBaZzZyMmlwUFJNMlV1ZGV2aExWNy8yS2IzTDhHcXg4M0pv?=
 =?utf-8?B?ZWxUdVVtL1V5bm5Rbm1QV2U5aGpWYnNNcCszVzlhZWpiVnhlODUvRDBGNkVm?=
 =?utf-8?Q?ukHUJZa7U/KV/Uro=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a45dcb-412c-49fe-e19e-08de5cb660aa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 08:39:11.0886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cLAI1f68TiQ2VjMydeZuSdBB8wHh+aH2mZXJYKYSBv3Zikjha2+6KTGjw02OglK4rV0zObXq1Q8Gnhqcje8R+HNw1eKlNsVW3p3Kj1mMxvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8696
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=I+hohdgg c=1 sm=1 tr=0 ts=69772831 cx=c_pps
 a=+lVouGy4Ef+S63FV+3Relw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=mDV3o1hIAAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8
 a=sozttTNsAAAA:8 a=t7CeM3EgAAAA:8 a=M1kY8KbR6tdB85lAAj4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=LVVdaqqDU9W9cF4QaU8A:9 a=DVBJa8-idjRy-D0H:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA3MyBTYWx0ZWRfX+hXJ+mHrHQXH
 6bhh6gsfEqcXXXDVABCM3orBNyGE9cIj6ec7yo1WZAOaJXMMLgqYHmAdvKiMPdH9RPkrNUCy/Y0
 ky7SHwsrISvYDTNHuTXJlAkYdXBZree33TZXX3Tb7+Mtk9LvVflvAks2P6YU+AeDd2peyADOn7H
 jxJMV2ETi0q9qED0qQho9uibQWQZUVDWUVv6iWj1YkbDECvU2Jk5RhigLWD10vybAZusY6AX04U
 GukQXxgryh8bu9K0Fprxza3UiaIZeOsywmUJBXGgDM1RVQjiOedCA0KdVy2tUPtNWMFriD6AwFF
 nMJzpve3aktBgoTYpvi/Ygs0VAqaFyxNqZtv2iDMMQLaaFvnvlEgx57vahy85ndvxUx/AcYKRwO
 q51KOeAvCxE6EqruHYsSpuXbLN3/yvmpBcO62IeBnQDbipQEWtr5Ho2PsQf3NrvoTvNEWWF+rdX
 EU1TXaQ+Q4q0Dkv478Q==
X-Proofpoint-GUID: v5XLEjaEgB57bjXJuljDpFgA_qhWraku
X-Proofpoint-ORIG-GUID: c8JioHwnbixyeYrjm1kMJCXe8rF4uPjx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 08:39:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229974

--------------Ym5qoCyNbIf2oABMKTNzUmra
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60Q5QLNB1378374


On 1/23/26 03:50, Randolph Sapp via lists.openembedded.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> From: Randolph Sapp<rs@ti.com>
>
> Now that the previous bug affecting binary reproducibility has been
> addressed [1], we can revert this patch. This will resolve issues with
> cgo applications becoming unreprodcible.
>
> Currently go considers link arguments to be sacred, meaning any change
> should produce a different binary output. They ensure this by baking
> link arguments into the intermediary output, changing the content ID of
> that step. As such, the marco prefixes inadvertently end up adding buil=
d
> paths to the output binary instead of removing them if they are passed
> as link arguments to cgo applications.
>
> These paths are later stripped out again, but at this point the content
> ID of the dependency has changed and thus the build ID of the end
> application will be affected by the cascade of hash changes. See the
> upstream bug for more information [2].
>
> This reverts commit fddaecc88979967d0e00e2fafdbaaabec030da9f.
>
> [1]https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D101473
> [2]https://github.com/golang/go/issues/77218
>
> Signed-off-by: Randolph Sapp<rs@ti.com>
> ---
>
> This resolves the previously reported emptty issues:
> https://lists.openembedded.org/g/openembedded-core/message/228549
>
>   meta/conf/bitbake.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 88f4d0df69..da873c3f4e 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -634,7 +634,7 @@ TARGET_LINK_HASH_STYLE ?=3D"${@['-Wl,--hash-style=3D=
gnu',''][d.getVar('LINKER_HASH_ ASNEEDED ?=3D "-Wl,--as-needed"
>
>   export LDFLAGS =3D "${TARGET_LDFLAGS}"
> -TARGET_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED} ${DE=
BUG_PREFIX_MAP}"
> +TARGET_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}"

Hi,

After check the related gcc bug and yocto bug,=C2=A0 gcc bug comments 21=20
([1])=C2=A0 and yocto bug comments 13 ([2]),

my understanding is that,=C2=A0 when lto is enabled,=C2=A0 even with gcc =
fix [3],=C2=A0=20
we still need DEBUG_PREFIX_MAP in LDFLAGS

to make bin reproducible. Also seems Tony's commit [4] is after gcc fix [=
3].

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D101473#c21

[2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14481#c13

[3] https://gcc.gnu.org/g:7cc2df084b7977653a9b59cbc34a9ad500ae619c

[4]=20
https://git.openembedded.org/openembedded-core/commit/?id=3Dfddaecc889799=
67d0e00e2fafdbaaabec030da9f


@Tony, @Randolph, Could please correct me if my understanding is not=20
right, Thanks.

//Changqing

>   # mips does not support GNU hash style therefore we override
>   LINKER_HASH_STYLE:mipsarch:libc-musl =3D "sysv"
>
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229857):https://lists.openembedded.org/g/openembedd=
ed-core/message/229857
> Mute This Topic:https://lists.openembedded.org/mt/117408334/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [c=
hangqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------Ym5qoCyNbIf2oABMKTNzUmra
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#ffffff">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/23/26 03:50, Randolph Sapp via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260122194959.13457-2-rs@ti.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

From: Randolph Sapp <a class="moz-txt-link-rfc2396E" href="mailto:rs@ti.com">&lt;rs@ti.com&gt;</a>

Now that the previous bug affecting binary reproducibility has been
addressed [1], we can revert this patch. This will resolve issues with
cgo applications becoming unreprodcible.

Currently go considers link arguments to be sacred, meaning any change
should produce a different binary output. They ensure this by baking
link arguments into the intermediary output, changing the content ID of
that step. As such, the marco prefixes inadvertently end up adding build
paths to the output binary instead of removing them if they are passed
as link arguments to cgo applications.

These paths are later stripped out again, but at this point the content
ID of the dependency has changed and thus the build ID of the end
application will be affected by the cascade of hash changes. See the
upstream bug for more information [2].

This reverts commit fddaecc88979967d0e00e2fafdbaaabec030da9f.

[1] <a class="moz-txt-link-freetext" href="https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101473">https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101473</a>
[2] <a class="moz-txt-link-freetext" href="https://github.com/golang/go/issues/77218">https://github.com/golang/go/issues/77218</a>

Signed-off-by: Randolph Sapp <a class="moz-txt-link-rfc2396E" href="mailto:rs@ti.com">&lt;rs@ti.com&gt;</a>
---

This resolves the previously reported emptty issues:
<a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/228549">https://lists.openembedded.org/g/openembedded-core/message/228549</a>

 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 88f4d0df69..da873c3f4e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -634,7 +634,7 @@ TARGET_LINK_HASH_STYLE ?= <a class="moz-txt-link-rfc2396E" href="mailto:${@['-Wl,--hash-style=gnu',''][d.getVar('LINKER_HASH_ASNEEDED?=">&quot;${@['-Wl,--hash-style=gnu',''][d.getVar('LINKER_HASH_
 ASNEEDED ?= &quot;</a>-Wl,--as-needed&quot;

 export LDFLAGS = &quot;${TARGET_LDFLAGS}&quot;
-TARGET_LDFLAGS = &quot;-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED} ${DEBUG_PREFIX_MAP}&quot;
+TARGET_LDFLAGS = &quot;-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}&quot;</pre>
    </blockquote>
    <p>Hi,</p>
    <p>After check the related gcc bug and yocto bug,&nbsp; gcc bug comments
      21 ([1])&nbsp; and yocto bug comments 13 ([2]), <br>
    </p>
    <p>my understanding is that,&nbsp; when lto is enabled,&nbsp; even with gcc
      fix [3],&nbsp; we <span style="white-space: pre-wrap">still need DEBUG_PREFIX_MAP in LDFLAGS </span></p>
    <p><span style="white-space: pre-wrap">to make bin reproducible.  Also seems Tony's commit [4] is after gcc fix [3].</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p>[1]&nbsp; <a class="moz-txt-link-freetext" href="https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101473#c21">https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101473#c21</a></p>
    <p>[2]&nbsp; <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=14481#c13">https://bugzilla.yoctoproject.org/show_bug.cgi?id=14481#c13</a></p>
    <p>[3]&nbsp; <a href="https://gcc.gnu.org/g:7cc2df084b7977653a9b59cbc34a9ad500ae619c" style="color: rgb(96, 112, 207); white-space: pre-wrap;" class="moz-txt-link-freetext">https://gcc.gnu.org/g:7cc2df084b7977653a9b59cbc34a9ad500ae619c</a></p>
    <p>[4]&nbsp;
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?id=fddaecc88979967d0e00e2fafdbaaabec030da9f">https://git.openembedded.org/openembedded-core/commit/?id=fddaecc88979967d0e00e2fafdbaaabec030da9f</a><br>
    </p>
    <p><br>
    </p>
    <p>@Tony, @<span style="white-space: pre-wrap">Randolph,  Could please correct me if my understanding is not right,  Thanks.</span></p>
    <p><span style="white-space: pre-wrap">//Changqing
</span></p>
    <blockquote type="cite" cite="mid:20260122194959.13457-2-rs@ti.com">
      <pre wrap="" class="moz-quote-pre">
 # mips does not support GNU hash style therefore we override
 LINKER_HASH_STYLE:mipsarch:libc-musl = &quot;sysv&quot;

--
2.52.0

</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#229857): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/229857">https://lists.openembedded.org/g/openembedded-core/message/229857</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/117408334/3616873">https://lists.openembedded.org/mt/117408334/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------Ym5qoCyNbIf2oABMKTNzUmra--

