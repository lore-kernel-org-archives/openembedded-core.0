Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 793B5FEFB53
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 13:57:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.96392.1772200642245960872
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 05:57:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=FEaTkqdS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=65185c03f3=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RDsXrM3484452
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 05:57:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=Plx4zo+aohfIf7sEg5rsks
	oC4oFGbeKlSJwopDhZ734=; b=FEaTkqdSjNFsxMQd0cd5O2S4h4chzwdpWNrANK
	kk+ho8nb9rphHPtDzW6XE+RaVxPbodrp4fOHi6K29F1+XPEtapqPMcKiq17ru2Vz
	6sK2VMEw5M0WlpX0emVePCU+hE29VqK7ZKPMxqnAEj2xiU4VRaStzApI0FdhtGB/
	vdNYr2i15dcUOzfpmNAoeJn0OArmco/8t8/HpOljkYH6qkahGjIqMNwB0mtg4mKk
	TjDZQqFdnISTpOkDrWzGubrcvT3ZYSKgcSIDR+Nu143BxfENTApmQE/gD5kvuXmh
	LBMERKDyPxh8/Zdbk0nDYoa0yyBg4UtAXL90X20wKpVJvLHA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010063.outbound.protection.outlook.com [52.101.85.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cjdu2t05y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 05:57:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eDe3eYY604v+GufjdGD2wKidTqCw/vOJzy8OEeqLXDJWdKRpJNYSA55xokFHMi+5nCXd62LIhofesLORLP+PpmgzANIX7AfQxtJQ4HGgGCRhQzzx9BPl/hkwRikh0zPCfvKFhRNk1PCguCBePw7JDY2Vr7QBAvMNQql56exxeXC+0l8HkrAv4mAGLqH0XPDyd4GGfwXDJ+U4Uc/ubz9elHL+RYjpl4dpmnRWxk4zi5W/rhlnDR+1TUMgBELYbwD5IxARTu68EqgYIfFgnVhH9dkAqqr+YqYX+RmjKGUYZhdl8lZKayI/LUb15Fefhy0Kzk7ZYNNHtWOIFGdikFIv8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Plx4zo+aohfIf7sEg5rsksoC4oFGbeKlSJwopDhZ734=;
 b=t/LbsLTEY1T9QcriuZ/gSZMLQNyIr44fei9LwUD9b0W5VQEbbp7YnlGbWAoXAdg0gA0IGntkQJnqLMm/xk0Lr87Q+WjntKsgtDnNRsfna2/+4Djjd+jVU5u51HspnOo6jSOoh8SdxW/6zegs8M4K9S7sMz+j41qziTYRwK80ykj1d2Yh2Do/PWSYQc91wmC2u/t/IyrocqA62+eNr983WfW0jsq+uvZyoBiLm3Xt6uWNPnuqygKG6hqUiRYsXuyloNzQYgS1zOmdcqCb+3ZIYN4b1OgN7o8A2pLpcTjvlWoOaI3YMHVIb/ClmCcSwZdNRiKVOxFX1yMVlhZoSx0TRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by MN2PR11MB4599.namprd11.prod.outlook.com (2603:10b6:208:26d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 13:57:17 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9654.015; Fri, 27 Feb 2026
 13:57:17 +0000
Content-Type: multipart/alternative;
 boundary="------------Y702lxm00DZukd2k8jCnW4Ca"
Message-ID: <bf03027d-1e5e-491e-8f01-6ba833ea00ec@windriver.com>
Date: Fri, 27 Feb 2026 08:57:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [AUH] python3-rdflib: upgrading to 7.6.0 SUCCEEDED
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>,
        Alexander Kanavin <alex.kanavin@gmail.com>,
        "Li, Changqing" <changqing.li@windriver.com>,
        "Chen, Qi" <qi.chen@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "Jia, Hongxu" <Hongxu.Jia@windriver.com>
References: <0101019c720ee382-b27e2993-68bf-4034-a5b8-1bc9fd0d4663-000000@us-west-2.amazonses.com>
 <6733c658-47d6-488b-8f0a-ea19bf20df47@windriver.com>
 <TYWPR01MB118611CAA2AAC1BEC4086414ADC72A@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <afd3d79d-4201-4fa7-ae3e-174702e692a3@windriver.com>
 <TYWPR01MB118617E05B1321306A4EBAE85DC73A@TYWPR01MB11861.jpnprd01.prod.outlook.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <TYWPR01MB118617E05B1321306A4EBAE85DC73A@TYWPR01MB11861.jpnprd01.prod.outlook.com>
X-ClientProxiedBy: ZR2P278CA0037.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::19) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|MN2PR11MB4599:EE_
X-MS-Office365-Filtering-Correlation-Id: d8d87381-dd8a-42fc-6957-08de76081e11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|4022899009|366016|14052099004|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	sTV5MMbpUu8x0GRVLVpYQFTRIYsXjs1DsBTIkZGWGbfrm11RjFqPuey1vBoApqNcKdt/fKwOEAjCOrwkDJf/NVduJTBpLY6xnAQq+HsCSqzGTY7Rl4XdhEXoeW/fLNBO1VlpDbIArAFqy3ScH/h7Mca4dx0hjt6Ri9YB2wJ0XRtyh4Didsn50HunoXSkwlb6wVoXYuw6XbxQ9b6sx8t/F6jVatiFd894LncBmVYfLx0D0FLXO2olDA5k25XzKaL7vI1hl6TBtWFLZcXptxWaxjaxBcguZ62+2wq/T3mRG0te3xWa6EUOV6xbl6D81OV95FAq6TxjyBxmvUPNuANhvAWxKGwQJWlxb/CTxZDSfr3fY1c5WM5IUPqLJSDlZx0E6S0Xw/OzlQKQST18OpaTm0p9PHkxgOGFnlp/LG4Q81ucLx1mnnGHdyYQ8sTn3j2aIn9BxGc2cFcElAryv5BWbPhfz/L6TS1Q8ih+25gOX1nH7l/zaeGfXJ+YhF6xrcXbkPReBhcXFtPbAz9i+0DC3FJ9tRuwTSfHkiEEyuWFYtscnSSwfjSuoFGQUrENYU73G+XCQqIxQmcvFE1mh39q8//ce+is6h4BdIXxqPq++UDDLxvrK/c69HqjhlZAuO05NH/kLC1Osj01JjlSbDNwE8TLp2IxkPhUT0oKkmLRwHj6yDg6QXTmRj+E8HrRIUmc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016)(14052099004)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q25aUWdvUk53SU9XaU1uYTZweThuSHJIbEJCWElIUzJNOXRia0plM3NQUE1v?=
 =?utf-8?B?NFRDZ2JubXJrQ3N1VE45bmgyTjhwcHdEM1VVa3JJVzhWOTFZYm91TkhPT0t5?=
 =?utf-8?B?L2FpeXFWL1RwUTlDWlNCSnFsRjlKbnBDbU5oUUlhUHZmOFFHdkpleW9GS3hK?=
 =?utf-8?B?TjRHbFZjY3ByVUNmNE9kc0IwTU5qaHM1UXVGQ1JxclEyUmJhamcyUlBlNWFa?=
 =?utf-8?B?SE9SOVNRZWR4Ui9PQWlxbDFwZWFKMVNqS1pIdVFyTkZuMFFqa2lmbXAya1FK?=
 =?utf-8?B?Ti9jaVVRWVBERVJIcVZBYUMybVBTcUxGZk9vem12SE9hVTJKR1ZpTG1JZTBO?=
 =?utf-8?B?OERJMDZUandwK3VYWjhjbHdYRUtPRHRTQmxya3drQS9hTWxFdEphbER5UjhN?=
 =?utf-8?B?NHlkeTVJUlRvcWVZbVZGWFJQQXpMQzhtZk1SR2RxQmI4bkw3N3JRKzVEbHJF?=
 =?utf-8?B?OHY1RG5lbkRwQW1xeUtlVGpNY3FQZjNIYjVNZ2VvKzNVT05hYkRxVDF1eTFy?=
 =?utf-8?B?T3M4UTl0d0JlbzBaMkRjMU5nQU9TeXdOVTBVdjdnTlRTdjhnYmtSMGxNMUZE?=
 =?utf-8?B?SmtxY3VvNlgxcmVVSDlRendxQWlqZEZvZGlzU0gvdUtjQ1Fkc3JZR3lKSjYv?=
 =?utf-8?B?a1JsT3JnSWYvWVZGK252Ujh0K0g1YnZ5aVlJOVR0OUVDbGNsQkJOdDlnMU41?=
 =?utf-8?B?SmltM2huSWxvM3IvYUhXUTFnSlA2RmRpUmxMY2ZyU05Ed1hYMDE4YTlLa1R3?=
 =?utf-8?B?NnZHZkRZR05tSVNySXBraGdreVVBVWFTL2tzN1ZhSnBUbFlvd2U5UWIvWHQx?=
 =?utf-8?B?NTJzVnIrZkRuRHdnVjcxdGw5UHlFSHlRYzNiUlRGRlU4N1MvWjdLaVlPaDVF?=
 =?utf-8?B?SExJUEdIMjBFSEZyQ3d6UGFuTm4zUVpEMjVoSkxnbHhtZlVqaWZVSXZjSUlk?=
 =?utf-8?B?dDRPeW1kTnZxVktHQXBqRVVRNWdZZlJFOVhncDJoMTlqcUtWeXFHYS9vbXkr?=
 =?utf-8?B?YkpOaW5YelFEUXRZUVVTRzV1WWEvYmxadFJpaWZaZmMrVmJ3QjJwNVRqbmd4?=
 =?utf-8?B?ZmdaczZEdU9pMXAwdE4wUXRQK2R2VzA3MU5rVGltSlFwSnJzWDJFRHo0MWpj?=
 =?utf-8?B?M1VEL3ZhVnQrNytGdGxTOUxPZThabWp3OE5Sc2N2M2ErUFFJOGNMVEZ6Umtx?=
 =?utf-8?B?a01pRjJhdkMvWmxKNTVnM1NwR0xZVTdGUUdFNS9rSkR6VjdNRU5yYkRhWTZR?=
 =?utf-8?B?SHZJL0VrRHFYRXhvNGxCSjNlVjYvVGdsQWZJVy9OVDJiT2FQQ1hZZTRZTXpl?=
 =?utf-8?B?ZkxmNUpIU1BBSFBTNnBPYnd1NXU1cXlEZEoyS0VMK0lhME9YdXY0cDJKMDIr?=
 =?utf-8?B?eUd2Z2t4OXdPcUx4RDVUVTd1bExjU0ZFNGtZZldsMGROc3NtaDBJd0RYdEFn?=
 =?utf-8?B?T1ZqU1JLRndHSCtjT3ZPSnc2UUtZVVZBN0xOTmZoYWxNZ2hiWmhKZ0pDREND?=
 =?utf-8?B?Tm91dmFTSXNUUkM1c21pRWRaYktFVzJuMm5wanpFTzZiSm5vcFhROVQxVU45?=
 =?utf-8?B?VW1rQ0xYTi9oMndPYmpqN2hxVUdLR1J0ajBSWDc3dE9nNExnN0orT000YVdY?=
 =?utf-8?B?TlRwRy94Sm45V0lHTG4veEFEQURGOHFha1FDL0R4dkJsdXp5REttcjlkenhE?=
 =?utf-8?B?dXY1cmJhdmhDV0ViTUFmMUp0RC9QektWNENOcG4rckw2RFlwa3NDbG5hQlho?=
 =?utf-8?B?TjVYNkFzWGZuN2xlUFkzVWIxek5YaS9GZW1zKzQxOThsYUx0WXhXZ1NyL004?=
 =?utf-8?B?OHFQVVVXaEp6Yjl1Y2hTODQ2dnArUXc0TzFQc2hxcjJJMHJBWldJQ29MaVpU?=
 =?utf-8?B?QlBEZS9mRHpJTENoYkFjZVlVQTFPcTgrUXJxNGJmeFlsQm1TemxYTTZLU3h3?=
 =?utf-8?B?blVwYUNLNnp6SDRKYzRPSUVNL2NLb05aUmFGejM5OCtvLzJFQ2kwKzl3R3ow?=
 =?utf-8?B?ZlRzRzE5ZXF0SXN4dWdxcTVGTlRmam50WmdiNUdNeFhFQ3lBL3ZpS0FvWGh3?=
 =?utf-8?B?Yzl5QS9zZXJidjVwQkp4M0d6UlpjWWFlVEtqUGY2bGFUL3U5RDdyZVluVlB6?=
 =?utf-8?B?QlRZR1NwSWJ5TTNoQmFRSDhCNzZKOFphZU1iUFVyaHhrZ1M0Q1I0b2hVenFk?=
 =?utf-8?B?OTR1Vk94OGZyZFQ4dmNBV0w5WTNlN2JLVVpJRHBZT3NLVjlpZDY0VUplQzZP?=
 =?utf-8?B?RTYwWDZWZHJ2R0xXRHgyMlRCK1pudWtycTlPUU83M0pRZFAxempMcmRaZlJE?=
 =?utf-8?B?bFlqQnpoZThyeHFUSW0rUS9lNnRJaDVwTXpEbExlakhjVEF3NytGVG9rOWlx?=
 =?utf-8?Q?rjKn8AkB5OxTQ6PM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d87381-dd8a-42fc-6957-08de76081e11
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 13:57:17.2452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zyOyWwjBLUEW5avp182bnCXIdZavx65GQ17DPbXTtm9kMCskXukMiu5C7ilxeL8xrtn+0oYa3kYV9oPR0Mz6GzjrqsZT+My6r5NZwc+5lBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4599
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEyMyBTYWx0ZWRfX+dLvx2QlIDvt
 w67nBwRUieJKfucXHHcjgSXfYc1O9qsnnJu4s4FVZ9htD4yXkoy6ARXZnZtNU2+jA8pcwpk3n6l
 xVbFmNR9BUTkZQi0gv11gPp+77Bj5MyrddI86yB0v2unFI0NfuVyY+FVoCnnWFZ8kR+Wqo1XOXF
 BiHUhmGbUVYZObqVwFsP2fFe538GvAgNi5MB5amePizmzTf4yEBtMm33YJeQiN1cxnOQGIGodLs
 ovSe7ypmlkDQHdPdvHXqf3YXrH/bF7qGKdp9D1y0dvci7Qajl8/bsNZPpHt62pSKStttoxiSjY1
 XM5MI01cjFSj59fcTtR98xqVqKDHCDZ5d8IuLht1MuWpwnqnIFzyqhcLm3XuZvpCwa6V4ID47Ah
 NKHV1GK/jeMJo2y/CmZODH3iI40WpalPpV0YbQ+LfvQqVZ7MSVWFvtxKUSRGd7c/SrP3BbiIWoc
 szJTqmLGJtXx0lJGSLg==
X-Authority-Analysis: v=2.4 cv=WpMm8Nfv c=1 sm=1 tr=0 ts=69a1a2c1 cx=c_pps
 a=mOz+rD6hbbSUvRiPFvEd3g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=VwQbUJbxAAAA:8
 a=B8ibFTVmAAAA:8 a=omOdbC7AAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=lvnylhGAL_xXEEN_wnwA:9
 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=UqCG9HQmAAAA:8
 a=v_4YMzQNA-WfGdjZCkUA:9 a=tBItvyIc3ICdbNTk:21 a=UiCQ7L4-1S4A:10
 a=hTZeC7Yk6K0A:10 a=_W_S_7VecoQA:10 a=xvSgdcfEVHFitugM1GHH:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: UeJxQXtdY_6WboAckBiWV2CFTYWA3gVx
X-Proofpoint-GUID: hnVXUhVV4YLvp1GUaWPWdY-cubk6mOw0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_02,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270123
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 13:57:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232100

--------------Y702lxm00DZukd2k8jCnW4Ca
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61RDsXrM3484452

On 2026-02-26 8:53 p.m., Mingyu Wang (Fujitsu) wrote:
>
> =EF=82=B7=C2=A0 Should we prioritize upgrading the successful ones firs=
t and deal=20
> with the failed ones later?
>
Changqing, Qi and I are doing most of the AUH FAILED recipes.
If you'd like to do some as well, just say so.
>
> If so, there are about 60 in total. Should I take the first 30
>
Sure, first 30 is fine. (1)

Hongxu, Qi, Changqing,
Will you review and do 31-55 ?

> =C2=A0or the last 30?
>
> =EF=82=B7=C2=A0 What is the deadline?
>
The 6.0-M3 build date (2) is Monday, March 9 so the deadline for major=20
updates is next week (March 2-6),

earlier the better.

Note that openssl will remain at v 3.5.x since that's an openssl LTS=20
release.

Thanks,

../Randy

1)

from:=20
https://lore.kernel.org/openembedded-core/?q=3Ds%3AAUH+AND+s%3ASUCCEEDED+=
AND+d%3A2026-02-18

  1.*[AUH] vulkan-samples: upgrading to=20
3abbdf8b5a3bf250f6475f9fe674567b14e9b1ad SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720efc92-2a644a4d-6491=
-4e40-8256-d47ae154c19a-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [93%]

  2.*[AUH] xorgproto: upgrading to 2025.1 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720efd45-87be0bf6-c07c=
-45fd-918c-46213772c1a9-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [85%]

  3.*[AUH] libtraceevent: upgrading to 1.9.0 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720efd67-f015fd77-3e1c=
-440a-8e5f-3fa1adcc6db8-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [71%]

  4.*[AUH] librsvg: upgrading to 2.61.4 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ef9c0-c37255a9-2afe=
-4bfe-92cf-d0cf08eabeb8-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [23%]

  5.*[AUH] gstreamer1.0: upgrading to 1.28.0 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720f0596-80b51276-f911=
-432e-aca5-2a096f3b683b-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [21%]

  6.*[AUH] libadwaita: upgrading to 1.8.4 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720efa26-30b70cf6-eadc=
-4bd7-aff2-fbde8c08bd45-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [6%]

  7.*[AUH] wireless-regdb: upgrading to 2026.02.04 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720efefb-70cdcf59-5cfe=
-4743-9d80-3dd85045bd1a-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [88%]

  8.*[AUH] hwdata: upgrading to 0.404 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720f07cf-6767e43b-a52b=
-4d18-98ee-40d76d5fecea-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [86%]

  9.*[AUH] sbc: upgrading to 2.2 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720f057e-b288e732-e0b1=
-4740-8a59-bb2c4721cc3a-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [78%]

10.*[AUH] libpng: upgrading to 1.6.55 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720f049d-80a54c02-68dd=
-42cd-9d2d-79794522e22e-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [74%]

11.*[AUH] spirv-llvm-translator: upgrading to 21.1.4 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720efc92-79e79fb7-4425=
-41ff-8ac6-4cadd283268a-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [73%]

12.*[AUH] p11-kit: upgrading to 0.26.2 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720f0d63-15862410-e834=
-4522-9f92-27b1b7061aee-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [36%]

13.*[AUH] gstreamer1.0-vaapi: upgrading to 1.26.10 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720f05ca-7c385378-8f46=
-4e71-a768-f1d79c5a2b96-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [10%]

14.*[AUH] diffoscope: upgrading to 312 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720f076c-b5fb3143-993f=
-4eac-9026-84108f2d417c-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [81%]

15.*[AUH] enchant2: upgrading to 2.8.15 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720f076a-186fde78-b3a0=
-45cd-8146-01a7031d4eb0-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [77%]

16.*[AUH] libxmlb: upgrading to 0.3.25 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ef9f3-9dc752f6-8d21=
-4281-8c8f-a327e92979a2-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [73%]

17.*[AUH] taglib: upgrading to 2.2 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720f0e87-1584c681-c112=
-4ccc-9210-f93ebc34d917-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [45%]

18.*[AUH] libgpg-error: upgrading to 1.59 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720f09da-8ad9c535-9164=
-44c7-8a11-f850c20d6433-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [42%]

19.*[AUH] libsoup: upgrading to 3.6.6 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720f0cef-41fcba72-3f31=
-406a-a0aa-efad029519bc-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [39%]

20.*[AUH] gtk4: upgrading to 4.20.3 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720efb38-0e0ae483-959f=
-4e4a-962f-1a4f9094cacc-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [3%]

21.*[AUH] rpm-sequoia-crypto-policy: upgrading to=20
f3f5fa454345b03039ee3d904964fc14829637ce SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ee8c4-1326c100-1227=
-44cf-aa45-b611809bcaf8-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [99%]

22.*[AUH] rpm-sequoia: upgrading to 1.10.1 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720eec05-fafadaa6-b5b2=
-4f6e-a03d-f32a637ce76a-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [13%]

23.*[AUH] fastfloat: upgrading to 8.2.3 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ed3a7-50032806-5070=
-42f5-b052-81c743a6e20a-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [86%]

24.*[AUH] ttyrun: upgrading to 2.41.0 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ecf1b-045c38a9-72cb=
-43e0-992c-0f95c4a363b8-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [84%]

25.*[AUH] ed: upgrading to 1.22.5 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720eefb6-5503fe20-6e22=
-4ca3-92d3-61e465568822-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [84%]

26.*[AUH] libuv: upgrading to 1.52.0 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ec780-9a3b8a18-6b4d=
-489e-afbb-1fe42d50ea1b-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [81%]

27.*[AUH] less: upgrading to 692 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720eef19-1f0dbf2e-85ca=
-4a23-b82b-6386cf40820a-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [73%]

28.*[AUH] ccache: upgrading to 4.12.3 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ed245-3ba8458b-7064=
-49f5-a6bb-edb8295f35ae-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [67%]

29.*[AUH] libcap-ng-python,libcap-ng: upgrading to 0.9.1,0.9.1 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ec5f6-8ae46777-3b7e=
-46c5-8ba3-c82106bd8312-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [55%]

30.*[AUH] libx11,libfontenc: upgrading to 1.8.13,1.1.9 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ec568-78714733-d55b=
-4bab-a2ec-abbcd8f4b599-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [47%]

-------------------------------------------------------------------------=
---------------------

31.*[AUH] ell: upgrading to 0.82 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ecf45-43f50ef5-8b79=
-4cbd-9089-7d80b9631d72-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [15%]

32.*[AUH] font-alias: upgrading to 1.0.6 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ec439-848d68dc-4c90=
-4645-9999-2e97cd69ae30-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [86%]

33.*[AUH] python3-markdown: upgrading to 3.10.2 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ed968-18664721-e3f0=
-46cf-ad90-20360651118b-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [78%]

34.*[AUH] gn: upgrading to 9d19a7870add65151ff91bcc26252bb7521065cf=20
SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ed760-810dfe91-0557=
-4084-a56c-85eae3d063ed-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [55%]

35.*[AUH] python3-cryptography-vectors,python3-cryptography: upgrading to=
=20
46.0.5,46.0.5 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ec412-e2eaf0f8-882b=
-48c9-8903-0d11c7b57e89-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [44%]

36.*[AUH] ncurses: upgrading to 6.6 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ecf0b-976a5a4a-4399=
-4b36-ac4c-e46263c3d9d4-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [33%]

37.*[AUH] btrfs-tools: upgrading to 6.19 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ed1a2-4fde9b9f-9c8d=
-4c4c-afa1-073bfc465527-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [16%]

38.*[AUH] openssl: upgrading to 3.6.1 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ecad9-289adab8-0384=
-4f80-84c3-984eb261e560-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [9%]

39.*[AUH] zlib: upgrading to 1.3.2 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ed212-3bcc8dde-0640=
-4d2d-8054-e8e60ecbf04d-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [9%]

40.*[AUH] connman: upgrading to 2.0 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ec958-2397828f-7c04=
-4eb4-ac3e-ef4cd75579b1-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [5%]

41.*[AUH] xauth: upgrading to 1.1.5 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ec3d9-fbc6621a-a0d5=
-4800-94df-bb6a03cf2443-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [83%]

42.*[AUH] python3-testtools: upgrading to 2.8.3 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ee3c2-d28e1975-179b=
-4b55-860c-e09ad43167f8-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [77%]

43.*[AUH] python3-xmltodict: upgrading to 1.0.3 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ee886-e523bc47-c9dc=
-4dc0-9a5a-f2d61344fd24-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [76%]

44.*[AUH] python3-pyproject-metadata: upgrading to 0.11.0 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720edd35-9236884d-27e6=
-45a0-ba5e-e34afa46938f-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [73%]

45.*[AUH] python3-hypothesis: upgrading to 6.151.9 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ed94c-2009b040-525b=
-4ab2-9613-40999971f57a-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [69%]

46.*[AUH] python3-wcwidth: upgrading to 0.6.0 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ee68b-95243140-644b=
-462f-8dd3-df2ef0d5f97b-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [66%]

47.*[AUH] python3-rdflib: upgrading to 7.6.0 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ee382-b27e2993-68bf=
-4034-a5b8-1bc9fd0d4663-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [60%]

48.*[AUH] python3-trove-classifiers: upgrading to 2026.1.14.14 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ee4f4-beb714ed-883c=
-433e-a890-db8952300533-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [58%]

49.*[AUH] python3-pycparser: upgrading to 3.0 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720edd0d-c84824a7-f959=
-4f88-ba0f-6ee99b384e06-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [52%]

50.*[AUH] python3-pip: upgrading to 26.0.1 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720edbdf-8b775dee-95ce=
-4959-b25d-0036f159e806-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [27%]

51.*[AUH] python3-poetry-core: upgrading to 2.3.1 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ede90-4a44d733-8ffb=
-40a2-876c-a9f925ab73e9-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [18%]

52.*[AUH] python3-uv-build: upgrading to 0.10.4 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ee748-45965cc5-3c70=
-4c94-adbe-01a1c9e65852-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [13%]

53.*[AUH] python3-maturin: upgrading to 1.12.2 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ede9c-79777fa3-222b=
-491b-b353-f1dffbdc4e95-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [10%]

54.*[AUH] python3-setuptools: upgrading to 82.0.0 SUCCEEDED=20
<https://lore.kernel.org/openembedded-core/0101019c720ee6c6-e45fb965-bd06=
-42ab-8623-4f7aa90bb139-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [8%]

55.*[AUH] glib-2.0-initial,glib-2.0: upgrading to 2.86.4,2.86.4 SUCCEEDED=
=20
<https://lore.kernel.org/openembedded-core/0101019c720ead92-1bd0d0ba-9fff=
-4d9f-8682-fd339a3c6cfb-000000@us-west-2.amazonses.com/>*
     - by auh @ 2026-02-18 18:41 UTC [15%]





2)


 From the Yocto Status email:

- YP 6.0 M3 Build Date 2026-03-09
- YP 6.0 M3 Release Date 2026-03-20
- YP 6.0 M4 Build Date 2026-03-30
- YP 6.0 M4 Release Date 2026-04-26


> =C2=A0--
>
> Best Regards
>
> ---------------------------------------------------
>
> Wang Mingyu
>
> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
>
> No.6 Wenzhu Road, Nanjing, 210012, China
>
> TEL=EF=BC=9A+86+25-86630566--8568
>
> COINS: 79988548
>
> FAX: +86+25-83317685
>
> MAIL: wangmy@fujitsu.com <mailto:wangmy@fujitsu.com>
>
> *From:*Randy MacLeod <randy.macleod@windriver.com>
> *Sent:* Thursday, February 26, 2026 10:26 PM
> *To:* Wang, Mingyu/=E7=8E=8B=E9=B8=A3=E7=91=9C<wangmy@fujitsu.com>; Ale=
xander Kanavin=20
> <alex.kanavin@gmail.com>
> *Cc:* openembedded-core@lists.openembedded.org; Jia, Hongxu=20
> <Hongxu.Jia@windriver.com>
> *Subject:* Re: [OE-core] [AUH] python3-rdflib: upgrading to 7.6.0=20
> SUCCEEDED
>
> On 2026-02-25 10:14 p.m., Mingyu Wang (Fujitsu) wrote:
>
>     I've also been on vacation since 2.18 and just returned to work.
>     I'll handle the python3-rdflib upgrade.
>
> Thanks Wangmy and I hope you had a good vacation.
>
> The bigger question is the > 50 packages that AUH managed to upgrade.
>
> Will you also do most of them or would you like to split this list=20
> with Hongxu/Qi/ etc?
> If you want to split it, please reply with the packages you will do.
>
> Thanks,
>
> ../Randy
>
>     =C2=A0--
>
>     Best Regards
>
>     ---------------------------------------------------
>
>     Wang Mingyu
>
>     FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
>
>     No.6 Wenzhu Road, Nanjing, 210012, China
>
>     TEL=EF=BC=9A+86+25-86630566--8568
>
>     COINS: 79988548
>
>     FAX: +86+25-83317685
>
>     MAIL: wangmy@fujitsu.com <mailto:wangmy@fujitsu.com>
>
>     *From:*Randy MacLeod <randy.macleod@windriver.com>
>     <mailto:randy.macleod@windriver.com>
>     *Sent:* Wednesday, February 25, 2026 12:42 AM
>     *To:* Wang, Mingyu/=E7=8E=8B=E9=B8=A3=E7=91=9C<wangmy@fujitsu.com>
>     <mailto:wangmy@fujitsu.com>; Alexander Kanavin
>     <alex.kanavin@gmail.com> <mailto:alex.kanavin@gmail.com>
>     *Cc:* openembedded-core@lists.openembedded.org; Jia, Hongxu
>     <Hongxu.Jia@windriver.com> <mailto:Hongxu.Jia@windriver.com>
>     *Subject:* Re: [OE-core] [AUH] python3-rdflib: upgrading to 7.6.0
>     SUCCEEDED
>
>     Hello Wang, and everyone,
>
>     Alex mentioned in the YP tech call today that he's on vacation
>     starting tomorrow, iirc.
>
>     Alex,
>     =C2=A0 =C2=A0 I assume that you won't be sending a patch series for=
 the
>     succeeding AUH upgrades.
>
>     Wang,
>     =C2=A0 =C2=A0Have you or do you plan to work on that?
>
>     If not, Hongxu and maybe others at WR will work on that.
>     I'm going to focus on the failed AUH upgrade set of recipes.
>
>     ../Randy
>
>     On 2026-02-18 1:41 p.m., Auto Upgrade Helper via
>     lists.openembedded.org
>     <https://urldefense.com/v3/__http:/lists.openembedded.org__;!!AjveY=
dw8EvQ!cC2WyezAalR6UZOZ07BsaBry1ZouLbKpeZ9nmC_s0Z9sWMH3AU12RFCRUC7BKKlhQz=
HFJRMeHgUCGuPSquz_VA$>
>     wrote:
>
>         Hello,
>
>          =20
>
>         this email is a notification from the Auto Upgrade Helper
>
>         that the automatic attempt to upgrade the recipe(s) *python3-rd=
flib* to *7.6.0* has Succeeded.
>
>          =20
>
>         Next steps:
>
>          =C2=A0=C2=A0=C2=A0 - apply the patch: git am 0001-python3-rdfl=
ib-upgrade-7.5.0-7.6.0.patch
>
>          =C2=A0=C2=A0=C2=A0 - check the changes to upstream patches and=
 summarize them in the commit message,
>
>          =C2=A0=C2=A0=C2=A0 - compile an image that contains the packag=
e
>
>          =C2=A0=C2=A0=C2=A0 - perform some basic sanity tests
>
>          =C2=A0=C2=A0=C2=A0 - amend the patch and sign it off: git comm=
it -s --reset-author --amend
>
>          =C2=A0=C2=A0=C2=A0 - send it to the appropriate mailing list
>
>          =20
>
>         Alternatively, if you believe the recipe should not be upgraded=
 at this time,
>
>         you can fill RECIPE_NO_UPDATE_REASON in respective recipe file =
so that
>
>         automatic upgrades would no longer be attempted.
>
>          =20
>
>         Please review the attached files for further information and bu=
ild/update failures.
>
>         Any problem please file a bug athttps://bugzilla.yoctoproject.o=
rg/enter_bug.cgi?product=3DAutomated%20Update%20Handler
>
>          =20
>
>         Regards,
>
>         The Upgrade Helper
>
>          =20
>
>         -- >8 --
>
>          From 6a230684782cbe47a4f0e5fe6c2268da57091fea Mon Sep 17 00:00=
:00 2001
>
>         From: Upgrade Helper<auh@yoctoproject.org>
>
>         Date: Wed, 18 Feb 2026 13:46:27 +0000
>
>         Subject: [PATCH] python3-rdflib: upgrade 7.5.0 -> 7.6.0
>
>          =20
>
>         ---
>
>           ...dflib_7.5.0.bb =3D> python3-rdflib_7.6.0.bb} | 25 ++++++++=
+++++++++--
>
>           1 file changed, 23 insertions(+), 2 deletions(-)
>
>           rename meta/recipes-devtools/python/{python3-rdflib_7.5.0.bb =
=3D> python3-rdflib_7.6.0.bb} (34%)
>
>          =20
>
>         diff --git a/meta/recipes-devtools/python/python3-rdflib_7.5.0.=
bb b/meta/recipes-devtools/python/python3-rdflib_7.6.0.bb
>
>         similarity index 34%
>
>         rename from meta/recipes-devtools/python/python3-rdflib_7.5.0.b=
b
>
>         rename to meta/recipes-devtools/python/python3-rdflib_7.6.0.bb
>
>         index e421aa2bac..1b830e8aa9 100644
>
>         --- a/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb
>
>         +++ b/meta/recipes-devtools/python/python3-rdflib_7.6.0.bb
>
>         @@ -1,10 +1,31 @@
>
>         +# FIXME: the LIC_FILES_CHKSUM values have been updated by 'dev=
tool upgrade'.
>
>         +# The following is the difference between the old and the new =
license text.
>
>         +# Please update the LICENSE value if needed, and summarize the=
 changes in
>
>         +# the commit message via 'License-Update:' tag.
>
>         +# (example: 'License-Update: copyright years updated.')
>
>         +#
>
>         +# The changes:
>
>         +#
>
>         +# --- LICENSE
>
>         +# +++ LICENSE
>
>         +# @@ -1,6 +1,6 @@
>
>         +#=C2=A0 BSD 3-Clause License
>
>         +#
>
>         +# -Copyright (c) 2002-2025, RDFLib Team
>
>         +# +Copyright (c) 2002-2026, RDFLib Team
>
>         +#=C2=A0 All rights reserved.
>
>         +#
>
>         +#=C2=A0 Redistribution and use in source and binary forms, wit=
h or without
>
>         +#
>
>         +#
>
>         +
>
>           SUMMARY =3D "RDFLib is a pure Python package for working with=
 RDF"
>
>           HOMEPAGE =3D"https://github.com/RDFLib/rdflib"
>
>           SECTION =3D "devel/python"
>
>           LICENSE =3D "BSD-3-Clause"
>
>         -LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3D7006e973486c4700556f=
6d58cba0ab6c"
>
>         +LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3D0ac0171cee5250c44d7d=
49847ae53a3e"
>
>          =20
>
>         -SRC_URI[sha256sum] =3D "663083443908b1830e567350d72e74d9948b31=
0f827966358d76eebdc92bf592"
>
>         +SRC_URI[sha256sum] =3D "6c831288d5e4a5a7ece85d0ccde9877d512a3d=
0f02d7c06455d00d6d0ea379df"
>
>          =20
>
>          =C2=A0inherit pypi python_poetry_core
>
>          =20
>
>
>
>
>         -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>         Links: You receive all messages sent to this group.
>
>         View/Reply Online (#231360):https://lists.openembedded.org/g/op=
enembedded-core/message/231360
>
>         Mute This Topic:https://lists.openembedded.org/mt/117879875/361=
6765
>
>         Group Owner:openembedded-core+owner@lists.openembedded.org
>
>         Unsubscribe:https://lists.openembedded.org/g/openembedded-core/=
unsub [randy.macleod@windriver.com]
>
>         -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>          =20
>
>     --=20
>
>     # Randy MacLeod
>
>     # Wind River Linux
>
> --=20
> # Randy MacLeod
> # Wind River Linux


--=20
# Randy MacLeod
# Wind River Linux

--------------Y702lxm00DZukd2k8jCnW4Ca
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61RDsXrM3484452

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2026-02-26 8:53 p.m., Mingyu Wang
      (Fujitsu) wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:TYWPR01MB118617E05B1321306A4EBA=
E85DC73A@TYWPR01MB11861.jpnprd01.prod.outlook.com">
     =20
      <meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered med=
ium)">
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
        <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10=
.5pt;font-family:=E7=AD=89=E7=BA=BF">=EF=82=B7&nbsp; Should we
            prioritize upgrading the successful ones first and deal with
            the failed ones later?&nbsp;</span></p>
      </div>
    </blockquote>
    Changqing, Qi and I are doing most of the AUH FAILED recipes.<br>
    If you'd like to do some as well, just say so.
    <blockquote type=3D"cite" cite=3D"mid:TYWPR01MB118617E05B1321306A4EBA=
E85DC73A@TYWPR01MB11861.jpnprd01.prod.outlook.com">
      <div class=3D"WordSection1">
        <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10=
.5pt;font-family:=E7=AD=89=E7=BA=BF"><o:p></o:p></span></p>
        <p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D=
"EN-US" style=3D"font-size:10.5pt;font-family:=E7=AD=89=E7=BA=BF">If so,
            there are about 60 in total. Should I take the first 30</span=
></p>
      </div>
    </blockquote>
    <p>Sure, first 30 is fine. (1)</p>
    <p>Hongxu, Qi, Changqing,&nbsp;<br>
      Will you review and do 31-55 ?<br>
      <br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:TYWPR01MB118617E05B1321306A4EBA=
E85DC73A@TYWPR01MB11861.jpnprd01.prod.outlook.com">
      <div class=3D"WordSection1">
        <p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D=
"EN-US" style=3D"font-size:10.5pt;font-family:=E7=AD=89=E7=BA=BF">&nbsp;o=
r the
            last 30?
            <o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10=
.5pt;font-family:=E7=AD=89=E7=BA=BF">=EF=82=B7&nbsp; What is the
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
<a class=3D"moz-txt-link-freetext" href=3D"https://lore.kernel.org/openem=
bedded-core/?q=3Ds%3AAUH+AND+s%3ASUCCEEDED+AND+d%3A2026-02-18">https://lo=
re.kernel.org/openembedded-core/?q=3Ds%3AAUH+AND+s%3ASUCCEEDED+AND+d%3A20=
26-02-18</a></p>
    <pre> 1. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101=
019c720efc92-2a644a4d-6491-4e40-8256-d47ae154c19a-000000@us-west-2.amazon=
ses.com/">[AUH] vulkan-samples: upgrading to 3abbdf8b5a3bf250f6475f9fe674=
567b14e9b1ad SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [93%]

 2. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ef=
d45-87be0bf6-c07c-45fd-918c-46213772c1a9-000000@us-west-2.amazonses.com/"=
>[AUH] xorgproto: upgrading to 2025.1 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [85%]

 3. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ef=
d67-f015fd77-3e1c-440a-8e5f-3fa1adcc6db8-000000@us-west-2.amazonses.com/"=
>[AUH] libtraceevent: upgrading to 1.9.0 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [71%]

 4. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ef=
9c0-c37255a9-2afe-4bfe-92cf-d0cf08eabeb8-000000@us-west-2.amazonses.com/"=
>[AUH] librsvg: upgrading to 2.61.4 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [23%]

 5. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720f0=
596-80b51276-f911-432e-aca5-2a096f3b683b-000000@us-west-2.amazonses.com/"=
>[AUH] gstreamer1.0: upgrading to 1.28.0 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [21%]

 6. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ef=
a26-30b70cf6-eadc-4bd7-aff2-fbde8c08bd45-000000@us-west-2.amazonses.com/"=
>[AUH] libadwaita: upgrading to 1.8.4 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [6%]

 7. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ef=
efb-70cdcf59-5cfe-4743-9d80-3dd85045bd1a-000000@us-west-2.amazonses.com/"=
>[AUH] wireless-regdb: upgrading to 2026.02.04 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [88%]

 8. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720f0=
7cf-6767e43b-a52b-4d18-98ee-40d76d5fecea-000000@us-west-2.amazonses.com/"=
>[AUH] hwdata: upgrading to 0.404 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [86%]

 9. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720f0=
57e-b288e732-e0b1-4740-8a59-bb2c4721cc3a-000000@us-west-2.amazonses.com/"=
>[AUH] sbc: upgrading to 2.2 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [78%]

10. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720f0=
49d-80a54c02-68dd-42cd-9d2d-79794522e22e-000000@us-west-2.amazonses.com/"=
>[AUH] libpng: upgrading to 1.6.55 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [74%]

11. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ef=
c92-79e79fb7-4425-41ff-8ac6-4cadd283268a-000000@us-west-2.amazonses.com/"=
>[AUH] spirv-llvm-translator: upgrading to 21.1.4 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [73%]

12. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720f0=
d63-15862410-e834-4522-9f92-27b1b7061aee-000000@us-west-2.amazonses.com/"=
>[AUH] p11-kit: upgrading to 0.26.2 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [36%]

13. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720f0=
5ca-7c385378-8f46-4e71-a768-f1d79c5a2b96-000000@us-west-2.amazonses.com/"=
>[AUH] gstreamer1.0-vaapi: upgrading to 1.26.10 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [10%]

14. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720f0=
76c-b5fb3143-993f-4eac-9026-84108f2d417c-000000@us-west-2.amazonses.com/"=
>[AUH] diffoscope: upgrading to 312 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [81%]

15. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720f0=
76a-186fde78-b3a0-45cd-8146-01a7031d4eb0-000000@us-west-2.amazonses.com/"=
>[AUH] enchant2: upgrading to 2.8.15 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [77%]

16. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ef=
9f3-9dc752f6-8d21-4281-8c8f-a327e92979a2-000000@us-west-2.amazonses.com/"=
>[AUH] libxmlb: upgrading to 0.3.25 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [73%]

17. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720f0=
e87-1584c681-c112-4ccc-9210-f93ebc34d917-000000@us-west-2.amazonses.com/"=
>[AUH] taglib: upgrading to 2.2 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [45%]

18. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720f0=
9da-8ad9c535-9164-44c7-8a11-f850c20d6433-000000@us-west-2.amazonses.com/"=
>[AUH] libgpg-error: upgrading to 1.59 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [42%]

19. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720f0=
cef-41fcba72-3f31-406a-a0aa-efad029519bc-000000@us-west-2.amazonses.com/"=
>[AUH] libsoup: upgrading to 3.6.6 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [39%]

20. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ef=
b38-0e0ae483-959f-4e4a-962f-1a4f9094cacc-000000@us-west-2.amazonses.com/"=
>[AUH] gtk4: upgrading to 4.20.3 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [3%]

21. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ee=
8c4-1326c100-1227-44cf-aa45-b611809bcaf8-000000@us-west-2.amazonses.com/"=
>[AUH] rpm-sequoia-crypto-policy: upgrading to f3f5fa454345b03039ee3d9049=
64fc14829637ce SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [99%]

22. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ee=
c05-fafadaa6-b5b2-4f6e-a03d-f32a637ce76a-000000@us-west-2.amazonses.com/"=
>[AUH] rpm-sequoia: upgrading to 1.10.1 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [13%]

23. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ed=
3a7-50032806-5070-42f5-b052-81c743a6e20a-000000@us-west-2.amazonses.com/"=
>[AUH] fastfloat: upgrading to 8.2.3 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [86%]

24. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ec=
f1b-045c38a9-72cb-43e0-992c-0f95c4a363b8-000000@us-west-2.amazonses.com/"=
>[AUH] ttyrun: upgrading to 2.41.0 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [84%]

25. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ee=
fb6-5503fe20-6e22-4ca3-92d3-61e465568822-000000@us-west-2.amazonses.com/"=
>[AUH] ed: upgrading to 1.22.5 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [84%]

26. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ec=
780-9a3b8a18-6b4d-489e-afbb-1fe42d50ea1b-000000@us-west-2.amazonses.com/"=
>[AUH] libuv: upgrading to 1.52.0 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [81%]

27. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ee=
f19-1f0dbf2e-85ca-4a23-b82b-6386cf40820a-000000@us-west-2.amazonses.com/"=
>[AUH] less: upgrading to 692 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [73%]

28. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ed=
245-3ba8458b-7064-49f5-a6bb-edb8295f35ae-000000@us-west-2.amazonses.com/"=
>[AUH] ccache: upgrading to 4.12.3 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [67%]

29. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ec=
5f6-8ae46777-3b7e-46c5-8ba3-c82106bd8312-000000@us-west-2.amazonses.com/"=
>[AUH] libcap-ng-python,libcap-ng: upgrading to 0.9.1,0.9.1 SUCCEEDED</a>=
</b>
    - by auh @ 2026-02-18 18:41 UTC [55%]

30. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ec=
568-78714733-d55b-4bab-a2ec-abbcd8f4b599-000000@us-west-2.amazonses.com/"=
>[AUH] libx11,libfontenc: upgrading to 1.8.13,1.1.9 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [47%]

-------------------------------------------------------------------------=
---------------------

31. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ec=
f45-43f50ef5-8b79-4cbd-9089-7d80b9631d72-000000@us-west-2.amazonses.com/"=
>[AUH] ell: upgrading to 0.82 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [15%]

32. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ec=
439-848d68dc-4c90-4645-9999-2e97cd69ae30-000000@us-west-2.amazonses.com/"=
>[AUH] font-alias: upgrading to 1.0.6 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [86%]

33. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ed=
968-18664721-e3f0-46cf-ad90-20360651118b-000000@us-west-2.amazonses.com/"=
>[AUH] python3-markdown: upgrading to 3.10.2 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [78%]

34. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ed=
760-810dfe91-0557-4084-a56c-85eae3d063ed-000000@us-west-2.amazonses.com/"=
>[AUH] gn: upgrading to 9d19a7870add65151ff91bcc26252bb7521065cf SUCCEEDE=
D</a></b>
    - by auh @ 2026-02-18 18:41 UTC [55%]

35. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ec=
412-e2eaf0f8-882b-48c9-8903-0d11c7b57e89-000000@us-west-2.amazonses.com/"=
>[AUH] python3-cryptography-vectors,python3-cryptography: upgrading to 46=
.0.5,46.0.5 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [44%]

36. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ec=
f0b-976a5a4a-4399-4b36-ac4c-e46263c3d9d4-000000@us-west-2.amazonses.com/"=
>[AUH] ncurses: upgrading to 6.6 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [33%]

37. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ed=
1a2-4fde9b9f-9c8d-4c4c-afa1-073bfc465527-000000@us-west-2.amazonses.com/"=
>[AUH] btrfs-tools: upgrading to 6.19 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [16%]

38. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ec=
ad9-289adab8-0384-4f80-84c3-984eb261e560-000000@us-west-2.amazonses.com/"=
>[AUH] openssl: upgrading to 3.6.1 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [9%]

39. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ed=
212-3bcc8dde-0640-4d2d-8054-e8e60ecbf04d-000000@us-west-2.amazonses.com/"=
>[AUH] zlib: upgrading to 1.3.2 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [9%]

40. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ec=
958-2397828f-7c04-4eb4-ac3e-ef4cd75579b1-000000@us-west-2.amazonses.com/"=
>[AUH] connman: upgrading to 2.0 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [5%]

41. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ec=
3d9-fbc6621a-a0d5-4800-94df-bb6a03cf2443-000000@us-west-2.amazonses.com/"=
>[AUH] xauth: upgrading to 1.1.5 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [83%]

42. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ee=
3c2-d28e1975-179b-4b55-860c-e09ad43167f8-000000@us-west-2.amazonses.com/"=
>[AUH] python3-testtools: upgrading to 2.8.3 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [77%]

43. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ee=
886-e523bc47-c9dc-4dc0-9a5a-f2d61344fd24-000000@us-west-2.amazonses.com/"=
>[AUH] python3-xmltodict: upgrading to 1.0.3 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [76%]

44. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ed=
d35-9236884d-27e6-45a0-ba5e-e34afa46938f-000000@us-west-2.amazonses.com/"=
>[AUH] python3-pyproject-metadata: upgrading to 0.11.0 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [73%]

45. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ed=
94c-2009b040-525b-4ab2-9613-40999971f57a-000000@us-west-2.amazonses.com/"=
>[AUH] python3-hypothesis: upgrading to 6.151.9 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [69%]

46. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ee=
68b-95243140-644b-462f-8dd3-df2ef0d5f97b-000000@us-west-2.amazonses.com/"=
>[AUH] python3-wcwidth: upgrading to 0.6.0 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [66%]

47. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ee=
382-b27e2993-68bf-4034-a5b8-1bc9fd0d4663-000000@us-west-2.amazonses.com/"=
>[AUH] python3-rdflib: upgrading to 7.6.0 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [60%]

48. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ee=
4f4-beb714ed-883c-433e-a890-db8952300533-000000@us-west-2.amazonses.com/"=
>[AUH] python3-trove-classifiers: upgrading to 2026.1.14.14 SUCCEEDED</a>=
</b>
    - by auh @ 2026-02-18 18:41 UTC [58%]

49. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ed=
d0d-c84824a7-f959-4f88-ba0f-6ee99b384e06-000000@us-west-2.amazonses.com/"=
>[AUH] python3-pycparser: upgrading to 3.0 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [52%]

50. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ed=
bdf-8b775dee-95ce-4959-b25d-0036f159e806-000000@us-west-2.amazonses.com/"=
>[AUH] python3-pip: upgrading to 26.0.1 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [27%]

51. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ed=
e90-4a44d733-8ffb-40a2-876c-a9f925ab73e9-000000@us-west-2.amazonses.com/"=
>[AUH] python3-poetry-core: upgrading to 2.3.1 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [18%]

52. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ee=
748-45965cc5-3c70-4c94-adbe-01a1c9e65852-000000@us-west-2.amazonses.com/"=
>[AUH] python3-uv-build: upgrading to 0.10.4 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [13%]

53. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ed=
e9c-79777fa3-222b-491b-b353-f1dffbdc4e95-000000@us-west-2.amazonses.com/"=
>[AUH] python3-maturin: upgrading to 1.12.2 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [10%]

54. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ee=
6c6-e45fb965-bd06-42ab-8623-4f7aa90bb139-000000@us-west-2.amazonses.com/"=
>[AUH] python3-setuptools: upgrading to 82.0.0 SUCCEEDED</a></b>
    - by auh @ 2026-02-18 18:41 UTC [8%]

55. <b><a href=3D"https://lore.kernel.org/openembedded-core/0101019c720ea=
d92-1bd0d0ba-9fff-4d9f-8682-fd339a3c6cfb-000000@us-west-2.amazonses.com/"=
>[AUH] glib-2.0-initial,glib-2.0: upgrading to 2.86.4,2.86.4 SUCCEEDED</a=
></b>
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
    <pre wrap=3D"" class=3D"moz-quote-pre">- YP 6.0 M3 Build Date 2026-03=
-09
- YP 6.0 M3 Release Date 2026-03-20
- YP 6.0 M4 Build Date 2026-03-30
- YP 6.0 M4 Release Date 2026-04-26</pre>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:TYWPR01MB118617E05B1321306A4EBA=
E85DC73A@TYWPR01MB11861.jpnprd01.prod.outlook.com">
      <div class=3D"WordSection1">
        <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10=
.5pt;font-family:=E7=AD=89=E7=BA=BF"><o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10=
.5pt;font-family:=E7=AD=89=E7=BA=BF"><o:p>&nbsp;</o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10=
.5pt;font-family:=E7=AD=89=E7=BA=BF"><o:p>&nbsp;</o:p></span></p>
        <div>
          <p class=3D"MsoNormal" style=3D"text-align:justify;text-justify=
:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">&nbsp;--<o:p>=
</o:p></span></p>
          <p class=3D"MsoNormal" style=3D"text-align:justify;text-justify=
:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">Best
              Regards<o:p></o:p></span></p>
          <p class=3D"MsoNormal" style=3D"text-align:justify;text-justify=
:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">-------------=
--------------------------------------<o:p></o:p></span></p>
          <p class=3D"MsoNormal" style=3D"text-align:justify;text-justify=
:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">Wang
              Mingyu<o:p></o:p></span></p>
          <p class=3D"MsoNormal" style=3D"text-align:justify;text-justify=
:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">FUJITSU
              NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)<o:p></o:p></sp=
an></p>
          <p class=3D"MsoNormal" style=3D"text-align:justify;text-justify=
:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">No.6
              Wenzhu Road, Nanjing, 210012, China<o:p></o:p></span></p>
          <p class=3D"MsoNormal" style=3D"text-align:justify;text-justify=
:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">TEL</span><sp=
an style=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;;mso-ligatu=
res:standardcontextual">=EF=BC=9A<span lang=3D"EN-US">+86+25-86630566--85=
68<o:p></o:p></span></span></p>
          <p class=3D"MsoNormal" style=3D"text-align:justify;text-justify=
:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">COINS:
              79988548<o:p></o:p></span></p>
          <p class=3D"MsoNormal" style=3D"text-align:justify;text-justify=
:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">FAX:
              +86+25-83317685<o:p></o:p></span></p>
          <p class=3D"MsoNormal" style=3D"text-align:justify;text-justify=
:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-fam=
ily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">MAIL:
              <a href=3D"mailto:wangmy@fujitsu.com" moz-do-not-send=3D"tr=
ue"><span style=3D"color:#0563C1">wangmy@fujitsu.com</span></a><o:p></o:p=
></span></p>
        </div>
        <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10=
.5pt;font-family:=E7=AD=89=E7=BA=BF"><o:p>&nbsp;</o:p></span></p>
        <div style=3D"border:none;border-left:solid blue 1.5pt;padding:0c=
m 0cm 0cm 4.0pt">
          <div>
            <div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padd=
ing:3.0pt 0cm 0cm 0cm">
              <p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"fon=
t-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">From:</span></b=
><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri=
&quot;,sans-serif">
                  Randy MacLeod <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:randy.macleod@windriver.com">&lt;randy.macleod@windriver.com&gt;<=
/a>
                  <br>
                  <b>Sent:</b> Thursday, February 26, 2026 10:26 PM<br>
                  <b>To:</b> Wang, Mingyu/</span><span style=3D"font-size=
:11.0pt">=E7=8E=8B</span><span style=3D"font-size:11.0pt;font-family:&quo=
t;Calibri&quot;,sans-serif">
                </span><span style=3D"font-size:11.0pt">=E9=B8=A3=E7=91=9C=
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,sans-serif">
                  <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:wangm=
y@fujitsu.com">&lt;wangmy@fujitsu.com&gt;</a>; Alexander Kanavin
                  <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:alex.=
kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a><br>
                  <b>Cc:</b> <a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists=
.openembedded.org</a>;
                  Jia, Hongxu <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:Hongxu.Jia@windriver.com">&lt;Hongxu.Jia@windriver.com&gt;</a><br>
                  <b>Subject:</b> Re: [OE-core] [AUH] python3-rdflib:
                  upgrading to 7.6.0 SUCCEEDED<o:p></o:p></span></p>
            </div>
          </div>
          <p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></=
span></p>
          <div>
            <p class=3D"MsoNormal"><span lang=3D"EN-US">On 2026-02-25 10:=
14
                p.m., Mingyu Wang (Fujitsu) wrote:<o:p></o:p></span></p>
          </div>
          <blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
            <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-siz=
e:10.5pt;font-family:=E7=AD=89=E7=BA=BF">I've also been
                on vacation since 2.18 and just returned to work. I'll
                handle the python3-rdflib upgrade.</span><span lang=3D"EN=
-US"><o:p></o:p></span></p>
          </blockquote>
          <p><span lang=3D"EN-US">Thanks Wangmy and I hope you had a good
              vacation.<o:p></o:p></span></p>
          <p style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US">The bigg=
er
              question is the &gt; 50 packages that AUH managed to
              upgrade.<br>
              <br>
              Will you also do most of them or would you like to split
              this list with Hongxu/Qi/ etc?<br>
              If you want to split it, please reply with the packages
              you will do.<o:p></o:p></span></p>
          <p><span lang=3D"EN-US">Thanks,<o:p></o:p></span></p>
          <p><span lang=3D"EN-US">../Randy<o:p></o:p></span></p>
          <blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
            <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-siz=
e:10.5pt;font-family:=E7=AD=89=E7=BA=BF">&nbsp;</span><span lang=3D"EN-US=
"><o:p></o:p></span></p>
            <div>
              <p class=3D"MsoNormal" style=3D"text-align:justify;text-jus=
tify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font=
-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">&nbsp;--<=
/span><span lang=3D"EN-US"><o:p></o:p></span></p>
              <p class=3D"MsoNormal" style=3D"text-align:justify;text-jus=
tify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font=
-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">Best
                  Regards</span><span lang=3D"EN-US"><o:p></o:p></span></=
p>
              <p class=3D"MsoNormal" style=3D"text-align:justify;text-jus=
tify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font=
-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">---------=
------------------------------------------</span><span lang=3D"EN-US"><o:=
p></o:p></span></p>
              <p class=3D"MsoNormal" style=3D"text-align:justify;text-jus=
tify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font=
-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">Wang
                  Mingyu</span><span lang=3D"EN-US"><o:p></o:p></span></p=
>
              <p class=3D"MsoNormal" style=3D"text-align:justify;text-jus=
tify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font=
-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">FUJITSU
                  NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)</span><spa=
n lang=3D"EN-US"><o:p></o:p></span></p>
              <p class=3D"MsoNormal" style=3D"text-align:justify;text-jus=
tify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font=
-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">No.6
                  Wenzhu Road, Nanjing, 210012, China</span><span lang=3D=
"EN-US"><o:p></o:p></span></p>
              <p class=3D"MsoNormal" style=3D"text-align:justify;text-jus=
tify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font=
-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">TEL</span=
><span style=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;;mso-li=
gatures:standardcontextual">=EF=BC=9A<span lang=3D"EN-US">+86+25-86630566=
--8568</span></span><span lang=3D"EN-US"><o:p></o:p></span></p>
              <p class=3D"MsoNormal" style=3D"text-align:justify;text-jus=
tify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font=
-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">COINS:
                  79988548</span><span lang=3D"EN-US"><o:p></o:p></span><=
/p>
              <p class=3D"MsoNormal" style=3D"text-align:justify;text-jus=
tify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font=
-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">FAX:
                  +86+25-83317685</span><span lang=3D"EN-US"><o:p></o:p><=
/span></p>
              <p class=3D"MsoNormal" style=3D"text-align:justify;text-jus=
tify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font=
-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">MAIL:
                  <a href=3D"mailto:wangmy@fujitsu.com" moz-do-not-send=3D=
"true"><span style=3D"color:#0563C1">wangmy@fujitsu.com</span></a></span>=
<span lang=3D"EN-US"><o:p></o:p></span></p>
            </div>
            <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-siz=
e:10.5pt;font-family:=E7=AD=89=E7=BA=BF">&nbsp;</span><span lang=3D"EN-US=
"><o:p></o:p></span></p>
            <div style=3D"border:none;border-left:solid blue 1.5pt;paddin=
g:0cm 0cm 0cm 4.0pt">
              <div>
                <div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;=
padding:3.0pt 0cm 0cm 0cm">
                  <p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D=
"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">From:</span=
></b><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Cal=
ibri&quot;,sans-serif">
                      Randy MacLeod
                      <a href=3D"mailto:randy.macleod@windriver.com" moz-=
do-not-send=3D"true">&lt;randy.macleod@windriver.com&gt;</a>
                      <br>
                      <b>Sent:</b> Wednesday, February 25, 2026 12:42 AM<=
br>
                      <b>To:</b> Wang, Mingyu/</span><span style=3D"font-=
size:11.0pt">=E7=8E=8B</span><span style=3D"font-size:11.0pt;font-family:=
&quot;Calibri&quot;,sans-serif">
                    </span><span style=3D"font-size:11.0pt">=E9=B8=A3=E7=91=
=9C</span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;=
,sans-serif">
                      <span lang=3D"EN-US"><a href=3D"mailto:wangmy@fujit=
su.com" moz-do-not-send=3D"true">&lt;wangmy@fujitsu.com&gt;</a>;
                        Alexander Kanavin
                        <a href=3D"mailto:alex.kanavin@gmail.com" moz-do-=
not-send=3D"true">&lt;alex.kanavin@gmail.com&gt;</a><br>
                        <b>Cc:</b> <a href=3D"mailto:openembedded-core@li=
sts.openembedded.org" moz-do-not-send=3D"true" class=3D"moz-txt-link-free=
text">openembedded-core@lists.openembedded.org</a>;
                        Jia, Hongxu
                        <a href=3D"mailto:Hongxu.Jia@windriver.com" moz-d=
o-not-send=3D"true">&lt;Hongxu.Jia@windriver.com&gt;</a><br>
                        <b>Subject:</b> Re: [OE-core] [AUH]
                        python3-rdflib: upgrading to 7.6.0 SUCCEEDED</spa=
n></span><span lang=3D"EN-US"><o:p></o:p></span></p>
                </div>
              </div>
              <p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:=
p></span></p>
              <div>
                <p class=3D"MsoNormal"><span lang=3D"EN-US">Hello Wang, a=
nd
                    everyone,<o:p></o:p></span></p>
              </div>
              <div>
                <p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></=
o:p></span></p>
              </div>
              <div>
                <p class=3D"MsoNormal"><span lang=3D"EN-US">Alex mentione=
d
                    in the YP tech call today that he's on vacation
                    starting tomorrow, iirc.<o:p></o:p></span></p>
              </div>
              <div>
                <p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></=
o:p></span></p>
              </div>
              <div>
                <p class=3D"MsoNormal"><span lang=3D"EN-US">Alex,&nbsp;<b=
r>
                    &nbsp; &nbsp; I assume that you won't be sending a pa=
tch
                    series for the succeeding AUH upgrades.<br>
                    <br>
                    Wang,&nbsp;<br>
                    &nbsp; &nbsp;Have you or do you plan to work on that?=
<br>
                    <br>
                    If not, Hongxu and maybe others at WR will work on
                    that.<br>
                    I'm going to focus on the failed AUH upgrade set of
                    recipes.<o:p></o:p></span></p>
              </div>
              <div>
                <p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></=
o:p></span></p>
              </div>
              <div>
                <p class=3D"MsoNormal"><span lang=3D"EN-US">../Randy<o:p>=
</o:p></span></p>
              </div>
              <div>
                <p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></=
o:p></span></p>
              </div>
              <div>
                <p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></=
o:p></span></p>
              </div>
              <div>
                <p class=3D"MsoNormal"><span lang=3D"EN-US">On 2026-02-18
                    1:41 p.m., Auto Upgrade Helper via
                    <a href=3D"https://urldefense.com/v3/__http:/lists.op=
enembedded.org__;!!AjveYdw8EvQ!cC2WyezAalR6UZOZ07BsaBry1ZouLbKpeZ9nmC_s0Z=
9sWMH3AU12RFCRUC7BKKlhQzHFJRMeHgUCGuPSquz_VA$" moz-do-not-send=3D"true">
                      lists.openembedded.org</a> wrote:<o:p></o:p></span>=
</p>
              </div>
              <blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
                <pre>Hello,</pre>
                <pre>&nbsp;</pre>
                <pre>this email is a notification from the Auto Upgrade H=
elper</pre>
                <pre>that the automatic attempt to upgrade the recipe(s) =
*python3-rdflib* to *7.6.0* has Succeeded.</pre>
                <pre>&nbsp;</pre>
                <pre>Next steps:</pre>
                <pre>&nbsp;&nbsp;&nbsp; - apply the patch: git am 0001-py=
thon3-rdflib-upgrade-7.5.0-7.6.0.patch</pre>
                <pre>&nbsp;&nbsp;&nbsp; - check the changes to upstream p=
atches and summarize them in the commit message,</pre>
                <pre>&nbsp;&nbsp;&nbsp; - compile an image that contains =
the package</pre>
                <pre>&nbsp;&nbsp;&nbsp; - perform some basic sanity tests=
</pre>
                <pre>&nbsp;&nbsp;&nbsp; - amend the patch and sign it off=
: git commit -s --reset-author --amend</pre>
                <pre>&nbsp;&nbsp;&nbsp; - send it to the appropriate mail=
ing list</pre>
                <pre>&nbsp;</pre>
                <pre>Alternatively, if you believe the recipe should not =
be upgraded at this time,</pre>
                <pre>you can fill RECIPE_NO_UPDATE_REASON in respective r=
ecipe file so that</pre>
                <pre>automatic upgrades would no longer be attempted.</pr=
e>
                <pre>&nbsp;</pre>
                <pre>Please review the attached files for further informa=
tion and build/update failures.</pre>
                <pre>Any problem please file a bug at <a class=3D"moz-txt=
-link-freetext" href=3D"https://bugzilla.yoctoproject.org/enter_bug.cgi?p=
roduct=3DAutomated%20Update%20Handler">https://bugzilla.yoctoproject.org/=
enter_bug.cgi?product=3DAutomated%20Update%20Handler</a></pre>
                <pre>&nbsp;</pre>
                <pre>Regards,</pre>
                <pre>The Upgrade Helper</pre>
                <pre>&nbsp;</pre>
                <pre>-- &gt;8 --</pre>
                <pre>From 6a230684782cbe47a4f0e5fe6c2268da57091fea Mon Se=
p 17 00:00:00 2001</pre>
                <pre>From: Upgrade Helper <a class=3D"moz-txt-link-rfc239=
6E" href=3D"mailto:auh@yoctoproject.org">&lt;auh@yoctoproject.org&gt;</a>=
</pre>
                <pre>Date: Wed, 18 Feb 2026 13:46:27 +0000</pre>
                <pre>Subject: [PATCH] python3-rdflib: upgrade 7.5.0 -&gt;=
 7.6.0</pre>
                <pre>&nbsp;</pre>
                <pre>---</pre>
                <pre> ...dflib_7.5.0.bb =3D&gt; python3-rdflib_7.6.0.bb} =
| 25 +++++++++++++++++--</pre>
                <pre> 1 file changed, 23 insertions(+), 2 deletions(-)</p=
re>
                <pre> rename meta/recipes-devtools/python/{python3-rdflib=
_7.5.0.bb =3D&gt; python3-rdflib_7.6.0.bb} (34%)</pre>
                <pre>&nbsp;</pre>
                <pre>diff --git a/meta/recipes-devtools/python/python3-rd=
flib_7.5.0.bb b/meta/recipes-devtools/python/python3-rdflib_7.6.0.bb</pre=
>
                <pre>similarity index 34%</pre>
                <pre>rename from meta/recipes-devtools/python/python3-rdf=
lib_7.5.0.bb</pre>
                <pre>rename to meta/recipes-devtools/python/python3-rdfli=
b_7.6.0.bb</pre>
                <pre>index e421aa2bac..1b830e8aa9 100644</pre>
                <pre>--- a/meta/recipes-devtools/python/python3-rdflib_7.=
5.0.bb</pre>
                <pre>+++ b/meta/recipes-devtools/python/python3-rdflib_7.=
6.0.bb</pre>
                <pre>@@ -1,10 +1,31 @@</pre>
                <pre>+# FIXME: the LIC_FILES_CHKSUM values have been upda=
ted by 'devtool upgrade'.</pre>
                <pre>+# The following is the difference between the old a=
nd the new license text.</pre>
                <pre>+# Please update the LICENSE value if needed, and su=
mmarize the changes in</pre>
                <pre>+# the commit message via 'License-Update:' tag.</pr=
e>
                <pre>+# (example: 'License-Update: copyright years update=
d.')</pre>
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
                <pre>+#&nbsp; Redistribution and use in source and binary=
 forms, with or without</pre>
                <pre>+# </pre>
                <pre>+#</pre>
                <pre>+</pre>
                <pre> SUMMARY =3D &quot;RDFLib is a pure Python package f=
or working with RDF&quot;</pre>
                <pre> HOMEPAGE =3D <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"https://github.com/RDFLib/rdflib">&quot;https://github.com/RDFLib/rd=
flib&quot;</a></pre>
                <pre> SECTION =3D &quot;devel/python&quot;</pre>
                <pre> LICENSE =3D &quot;BSD-3-Clause&quot;</pre>
                <pre>-LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc23=
96E" href=3D"file://LICENSE;md5=3D7006e973486c4700556f6d58cba0ab6c">&quot=
;file://LICENSE;md5=3D7006e973486c4700556f6d58cba0ab6c&quot;</a></pre>
                <pre>+LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc23=
96E" href=3D"file://LICENSE;md5=3D0ac0171cee5250c44d7d49847ae53a3e">&quot=
;file://LICENSE;md5=3D0ac0171cee5250c44d7d49847ae53a3e&quot;</a></pre>
                <pre> </pre>
                <pre>-SRC_URI[sha256sum] =3D &quot;663083443908b1830e5673=
50d72e74d9948b310f827966358d76eebdc92bf592&quot;</pre>
                <pre>+SRC_URI[sha256sum] =3D &quot;6c831288d5e4a5a7ece85d=
0ccde9877d512a3d0f02d7c06455d00d6d0ea379df&quot;</pre>
                <pre> </pre>
                <pre>&nbsp;inherit pypi python_poetry_core</pre>
                <pre> </pre>
                <p class=3D"MsoNormal"><span lang=3D"EN-US"><br>
                    <br>
                    <br>
                    <o:p></o:p></span></p>
                <pre>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</pre>
                <pre>Links: You receive all messages sent to this group.<=
/pre>
                <pre>View/Reply Online (#231360): <a class=3D"moz-txt-lin=
k-freetext" href=3D"https://lists.openembedded.org/g/openembedded-core/me=
ssage/231360">https://lists.openembedded.org/g/openembedded-core/message/=
231360</a></pre>
                <pre>Mute This Topic: <a class=3D"moz-txt-link-freetext" =
href=3D"https://lists.openembedded.org/mt/117879875/3616765">https://list=
s.openembedded.org/mt/117879875/3616765</a></pre>
                <pre>Group Owner: <a class=3D"moz-txt-link-abbreviated" h=
ref=3D"mailto:openembedded-core+owner@lists.openembedded.org">openembedde=
d-core+owner@lists.openembedded.org</a></pre>
                <pre>Unsubscribe: <a class=3D"moz-txt-link-freetext" href=
=3D"https://lists.openembedded.org/g/openembedded-core/unsub">https://lis=
ts.openembedded.org/g/openembedded-core/unsub</a> [<a class=3D"moz-txt-li=
nk-abbreviated" href=3D"mailto:randy.macleod@windriver.com">randy.macleod=
@windriver.com</a>]</pre>
                <pre>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</pre>
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
  </body>
</html>

--------------Y702lxm00DZukd2k8jCnW4Ca--

