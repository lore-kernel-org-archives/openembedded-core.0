Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2459D262B3
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 02:00:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3192.1768960827010074736
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 18:00:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=MLtF9Mkj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5481fe97a1=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L1ZJFM1784890
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:00:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Y/CNTDpaF4NyArq79+8ytR/lclUtWxAPXmHrIiZqVkw=; b=
	MLtF9Mkjis191oRJlbDj3xrYSbweaK0V14rlKQ2UpArGPpDbTUgG2t9EV6Hk0LGU
	USOYot8xweyCDc1iQgd9DGK4p/udOlGvO24vW7YfNiF5ZU93f2vm4qhd5hF2Mvd/
	YB+NpiNQHK9/LCi5D2rQux4puM85v7YzETK0F38ufwOXZsYS294Sppa8OGEnA+ht
	/H5cWT8VhtNkGOBsm76DsTZxbOOnLyC8Vtxemfnl1WN47Yg183pZVaeFVRK8dMPD
	AEr1Npny64XUrp+dnzJm7QdBRzbAak1wh7kaPYu+lLXduIgWwGphtuXB2gzmEfar
	TIx5bkjVnmuOvvABRCXeXQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010019.outbound.protection.outlook.com [52.101.46.19])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4btn75r0px-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 18:00:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QOkSPK2KaX5lQf8XtYaA+2xOuARNlvCIEHAQHfRAJd6PYc7j3vjZFg4e8oIfOBKBcwYDqIzdan15H5ifd/y8XiRy1Sj2Hec+xZinsWj86AjLVAA7kXZaBvROOEb5ajfYa3/K9NPgpq/YhCZn1nNADyGQTJ3cLOdw0KBeJs4gEl6gybS7Z/bu76QQ6+tB4cIdzoUyk24JGPpbomyaYGIe+TFJ11HV+MgISr3o3A3+ByFpdLw8A594+0TTwP6LsttfYc5iljFrbQFcuGi0W+8S9yIn/tvFcA7V7uTQw6Jewul+9Lj54zhFko4YGJf+IOd+ZhDR17pV4b/Qy6J+wwe8oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/CNTDpaF4NyArq79+8ytR/lclUtWxAPXmHrIiZqVkw=;
 b=jPnT0Kof/aH+vsIe+VKx5aZHwJC7HecYkNniDR4Sjao5YyZuDRLbOO06w6mHb39j8bE+0/l9GZ5DR77ueVGzvRv7S9c98rRMv1nTZnBkD2Fg4K3xLacQ9HfWHZHOsgjAixhYa4Yg0ljFBNAFO19ZAnbb+zpj5Znvpg+Y6kdaC1uPIYDeL25oTLjdMya+CrrhLWlZPWXo2abpFP8FxR6QlX7fCtPNsHW3X82E/jgmU7i8nqVkrfHY/2/zjrrynBjGsfUX/ZUfCJF1BMh60yn5vr5GvmxviyazORqBlDsHZRe5VmCuw1nfdHnZwVUK8UVg4NRbl7vqgvX0F2hc2J+1dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SJ2PR11MB7713.namprd11.prod.outlook.com (2603:10b6:a03:4f6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Wed, 21 Jan
 2026 02:00:23 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%3]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 02:00:23 +0000
Message-ID: <a66da3ed-f19e-4552-bfa0-f15204282db1@windriver.com>
Date: Wed, 21 Jan 2026 10:00:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] go: fix multilib file conflicts
To: Ross Burton <Ross.Burton@arm.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>
References: <20251222032455.2683666-1-changqing.li@windriver.com>
 <522E1A76-C605-4C0C-AB6A-F568E5676905@arm.com>
 <979d9d7f-8a2c-4cb3-8849-d8724f3d0f58@windriver.com>
 <D3892BD1-671E-4177-9154-08CA89880ADC@arm.com>
 <1889E2B366748363.2902090@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <1889E2B366748363.2902090@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SJ2PR11MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: c14f9a9a-72ab-4de0-b54a-08de5890d675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|4022899009|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NjFLOFdTSFgycndsZXZqMk5uYXBXYjJCQkVDeHFDS25kTVhDTkJ4Wm9sc0po?=
 =?utf-8?B?cEhienVCMTVmOG82d2lWK2dpSHNUR0hIRjJCcG5mT3BsMm42akhiTlpEUy9L?=
 =?utf-8?B?UHBsSmc5bUZkZnNvblhBMFlwcHNXZXdmdEFObHpKZVg1NklRTzhMT1BXcFc0?=
 =?utf-8?B?Z3VBZHNTUUNoZHJPK2YyVzFEUE93eWJxa3p2ZnI3a2VLQzhJdmZ6bnNTVGQ4?=
 =?utf-8?B?OGQ1aGFqLy9JTEdiN2dVZlRYMnpVZGJsalhYSE5BWm9hZmp2YmtUeVhpMjlp?=
 =?utf-8?B?a1FkRjJJU2hOQVB3djVPMklTSktxMGZRV1BjTjlESVAvUGhTWHVRRlZGOHYr?=
 =?utf-8?B?SkRMZyswNGlac2pySGJQNW41ZTlEakFEMDVBNFBwWCtQa05scmVicmE0aURp?=
 =?utf-8?B?ZTZHMTIyb3hpR1ZyT2VBeFM0YnhhcncxSEdRZENrVnVsSWUyenlDeWhoTFlH?=
 =?utf-8?B?bmVleEYwM05qK1pLVzVhT1R4RWc1dU50NWVhV3N6SUFMUlpxRlVtYTFpVDNq?=
 =?utf-8?B?VFdzSVpXa1ZXZ1g1S3RMZnp5Q1RJRmk5Skw3QUs1TGk5bFQxaC9mdmxvREJI?=
 =?utf-8?B?WW51Zjl3VVhSSDIxbkRZVEJET0RweHFHbVBRcThUUEVYL1VCMGxwall2VG5X?=
 =?utf-8?B?aUVEVlZmdlFUYnN3dUovQzhRT05kbHBvSmhlQ3Z4bEs5dzVra1J0V3dXOWcy?=
 =?utf-8?B?SnJzYnJwcGJTbG54RjFqU0pnc3M0VS90SHVLK0s3MTQyekxtQTQwZXRPd2xY?=
 =?utf-8?B?VzhCYk42cWhzQVVWY1JrZ0ttZHJrL0xvRmFGcHQvdjNqY21tTVRaU2dEU0hS?=
 =?utf-8?B?a2ZLMFhrTWJoZHlsTVI5L1ZZQ1BjMFljT3N1NFhKRVdSczI0aWpOMXlEeWQ0?=
 =?utf-8?B?b0U1bE9UY2ZvK091bGpzTTFIN05XZ2ZLN29zM2Z4MzQ0aTFBd0tYUDUwT2wz?=
 =?utf-8?B?MnFOSmw3ajhMMFI0QjZlUFNOTVZGR2x3bk5wTW4zY0FQd1hrNnM1K2NOT0RE?=
 =?utf-8?B?eUxVc2Q4eHIrdUNuNFlTN21sMDk3TTB0cGt1YXg0VlVpVzI0WVBScDRrL29M?=
 =?utf-8?B?dVp5ZFdCUms1b3hDd0dVTnFEQ2RsRDlCazJaQkFzeks4RzdtQWJWOEFnOHpR?=
 =?utf-8?B?VkZFZnV3bzhFT0JYNEx5eWJpeThPMUxUZzd2d2pmSlUrQnZ2V2llZEthVTRw?=
 =?utf-8?B?bnBkNkdsQ00rQ050aWVFUW45TDkvZXdYMHltZGJVWS9oYW00TFdkaXlQbnhw?=
 =?utf-8?B?TXROWk9yZzd5NGFnZWp2MFFOWlFPVHhScWJMbzhWRTJOY3hJdUFhR0JNaXly?=
 =?utf-8?B?QVlIeXVaajl5ZmRiYW1mZ2ZheE5UQnFDV25KZS9ySENJWUlISG9GVGJDbXVS?=
 =?utf-8?B?Z0VHYUhtQkY3a3FralIrMkFRLzVKT0I5dmhxSjFmbWFLWHJmU2k4Ym1pZ0p6?=
 =?utf-8?B?dVNIUm5jdHN5K1loT2ppdlh4MGlndi85QzVweGdTOXZrbFJJdHFRVFZoSVVh?=
 =?utf-8?B?bXFrb2ljSVFVQmI4aHJ4aW1rTDdTbEwvU1M0MUdIdzVzSFJ2NGZOYk9wM0dZ?=
 =?utf-8?B?K0J3eTh3Y0orc0c1enBXOFdQUElSRkpxWjQydlFsMkhlNGNSQkJOSmdYRnRl?=
 =?utf-8?B?b1dONi9RckF5ajNkVXpKelJISDdwNlRTMllTdXpVU0dZaG9EcVg3c3R3VUxE?=
 =?utf-8?B?a2Qyc1N1WmJ6bVcyY2RReVphWE1BVW83ZE5PalhxNk5SZDJNZVlYUDk5YzBS?=
 =?utf-8?B?LytpVXI2VXZ2eDAwWkNTRGpCVXB6NVZEZkVPZmtDN2tCU1JtTnJpbi9mMlBt?=
 =?utf-8?B?ZDB5aStnZG1IaHFVVVVTZ2pJVERLZzRuWmRJNWl5bjU3eG5pTll1UGJpTlZT?=
 =?utf-8?B?NzdkMHJYMExSckttZ08rdU9sQ0VjUEZUY2FGVXplakxUMlBHS3lFd21JOWZB?=
 =?utf-8?B?TkI0ck9VQzg0YUVrQmlSSUFoNnoyVmhkWUErRUVXWjRMQzY0a0FLK3g3elhU?=
 =?utf-8?B?UnZCTDhRUjhaODFMcU1PR2VvWFo0cjZpcUhHODRFOXlKeDRMT3AxZDFuU08w?=
 =?utf-8?B?NTZQaVZiVnMyK2Q4YTF6ZEsrNUhsL1I2ZFVNbkd1SC9FMU10Z1BKVDI4MUFQ?=
 =?utf-8?Q?Zj9kC/U6ZhHFCHN4YGsLfNe3U?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MXdyRFI1YWtEUXIxNFBYZElhcGF2d1RlK25zT0s3Wjh6cEpra0NrT0NTekpQ?=
 =?utf-8?B?WGlsbngxRkpPUjFDR1R5NWRwZWh2VzFYeENnWHJBZGlUb2lPZ2NSVDhseVFs?=
 =?utf-8?B?S2hQZkxpT3ZjdmdMT3dORVFtOEN5Mlp6czIwdGRXL0NJOTZZaVlyNWs3aitZ?=
 =?utf-8?B?MWFPaGtlYnM1VXZ5MHN4dENlVVNTckh4ZGhaUTRYRGg5RVp3NjQ5eC9HdUh3?=
 =?utf-8?B?ZDVoNlZCbmlvZEs1TWxjMzZib201S0RPYXRhRkFDVWRwejJIN2dsWjN0bEJ2?=
 =?utf-8?B?eG41bzNDakZCNDQxR0NzU093QkJHN2k4aXBZanF2SmcyK2F0QnF6cldVVU1N?=
 =?utf-8?B?dytjRGNsVGxTUlI5cWx6WENIQkdmdEdXemUwOHE4bGtpbVNwaklGK2treGdI?=
 =?utf-8?B?Wmt1R0YvbUh2MmJFb3BEVFRCV2h5dFFnVkcvYXBSLzVXK2RDS0tYR0NjdGVr?=
 =?utf-8?B?Uk4wT0JNbC93cGRSVjg5dTMxblBwenYvVnZtY1o3dkpPMDEwUXdicGZLMlJO?=
 =?utf-8?B?N3BFNXNMUzBYdHVLVHJqTTZ1dmhlU0JjVHI2NmdKQnA2UkFsMUtZSTR2RDZj?=
 =?utf-8?B?MEpYRENIbExZZjdaRGc1eklPZFcxUjBHdXMvaFgxcTVVREpUSnNYbFZvTjlH?=
 =?utf-8?B?VXQwY1JRVFZtMS9qK1Q0NHhrRGZ2cWViemM2Uzc2QmJ0eHlsSzdMUDZTSmZz?=
 =?utf-8?B?eGZpajBPQnNjaVlIMXZLeE1DZXlIWlRObURCWVBIbGtQM3VwL29rbXNXREZu?=
 =?utf-8?B?UGpqUC9EUUZBZ2pUU01IcDkzM0ZCcjMwaTc1MTJqSWp5Z05IbTYyUythSTFr?=
 =?utf-8?B?T25RZDVkUWEvN3ZNS3ZoT1FwL2JHSjFxYUdmOXpnY3RMQkZNUzF5dFROQm0w?=
 =?utf-8?B?bTQxNGpSVXd0eU5KYnVhS0VXaXE2YkhaaHpwQnE2RktYV1VDR1JaU2NyZkZT?=
 =?utf-8?B?akxnRi8vODhkeDBTS09BQmUwV0h2Y3VCOWU2YVpQZnRzRWgrTEVueGErS3R1?=
 =?utf-8?B?b2F2MFQxU29ZUndGcE12MmNjNFVlNGlQc0luUTY2Q051ZkQrdVBtM0dSekVq?=
 =?utf-8?B?Zk1ISkpBWUg5RDBhTk9yMU1EK1R0MnpkUEM4Vlh6d3A0eVpXZXJWTnhOQTUw?=
 =?utf-8?B?SmRjYVUzS2dyR3VHbUpnUDJCWjdxbTBnVzZtNGQxUXI0QkdzaUtwQzlOTHhC?=
 =?utf-8?B?YUErQ1huMjBxeDFxMXpIRmZoNmxiWmhTcmRzU0ExMWIraHBJUWVpcm9CUjRC?=
 =?utf-8?B?cUZGU2oxR3Z0N2ZLb2t1UFcxTHJnVm9MNFhDd1VKb2hLY1REVGlnQjVNZVo3?=
 =?utf-8?B?bjVhYUg4eGJVd3dRd0M4ajBDWm9YNVhxNUJ2amY0WEM2QTFsaklwbXZQdU9L?=
 =?utf-8?B?ZTFIN1VkanhubnM4M1UxcW44bUJEZDJGQXlKRHRXdlhVayt6K3ZNS2Q5NXMy?=
 =?utf-8?B?N25ib1R0UFlkVDlXbERBcnZ3QW9xNzVNMksyQWhyYk1FckVsd1FpZ01XTUJv?=
 =?utf-8?B?Y1NSSjVZWDJJcHBuZEhIa3ZMYkNxWm1jQk11YWtFcmVyeUtodll3SStaSnZV?=
 =?utf-8?B?VGlpbU10eUMrdGpFTFJkbkhTTkFxcXNHN2hDMGMxUmRObjAxMUwrV2lGQmta?=
 =?utf-8?B?VEJ0WTVmN093RXV6eFRJdGQxS1FvTklGblJUbURlMk0yOVJzZENLWGY0elBJ?=
 =?utf-8?B?cUFxYnFxaWJ4Wi9xWlYxUVc2eENOR1JFUXRIemhMZHBYR08vcFFMc3VvbnI2?=
 =?utf-8?B?OWk2bldYRjJ2ODZKcWtjT05rbXFyUWNid3NQdHdrTVhSOGpiNUlYRnlNaTRV?=
 =?utf-8?B?Y3B0M2FnNExpY0g0SUQ1Q04zR0t1WTZyWW8xQ2hlUE9BOTlkQTVsbCtPQm0w?=
 =?utf-8?B?Y3U5bkRxNElTa0hndUs4bXFJZjVQWFZsa3pNTWdzUnRaOEtrMm9ueWE5c2VG?=
 =?utf-8?B?UkJudkd3cXdpWkFsQWsyd1ExRkRnZUtOS1YxVHdseFQzSGVmeXpWclhrWHRZ?=
 =?utf-8?B?OVY3WkxTNEwzOHZMaTE5ZVNpUUxGQVJpYW8wb1puWFl2NWJoei80eEpwczJs?=
 =?utf-8?B?T3UrNURwY0ZJOW50dFFmRFpZUHFDaUowRjNsaUNGVDlHYUlxTlZnQ3pvSzFi?=
 =?utf-8?B?TXIyenZ6cTB3UVo3a3Q3aStkSHZLKzZnbWdRSW8vWHZYQit3Tjc4OVl0dnNP?=
 =?utf-8?B?UEdhbHExSC9WUjVBQlp6SUpTS0JzbzJMTHNxM2xqTWRFRDh2aHFlcWRobTA5?=
 =?utf-8?B?RFBPKzFNd1pDZDRlNFU5TFdWc0VYdGs4NGNvOTk0U2RRK0dMRXIwN3ZQdGsy?=
 =?utf-8?B?NWg5Mjc5UTdlU0phb2M3QWhIVGlyWGI5OGZ6ZFRwdVIydGZENEpnN2Ntc3gz?=
 =?utf-8?Q?bJiwroYVB0I1tv4E=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c14f9a9a-72ab-4de0-b54a-08de5890d675
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 02:00:23.2492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3T1NrzipaBqhzfHO3h3mXgNB1PIsHqeJNygMr6c8iLbYAY4nLX7guayh8e1PMD4FiOB6RD5ptD1k8dzyl03KuJq2cm8MQgs0IIoBx0MSzHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7713
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: F4mF08rJcQWxEAMkWI0746iVvtOLZ_0g
X-Proofpoint-GUID: kJu4H2R18qFkYODoYki-ajLeR-0mYmvN
X-Authority-Analysis: v=2.4 cv=fpzRpV4f c=1 sm=1 tr=0 ts=6970333a cx=c_pps
 a=cN7CqoUBHbDFA2NMQtMNyA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=IvQJNAUUq8ru2VKf7xoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDAxNSBTYWx0ZWRfXw1qJNf/kqSW0
 rY7ewrSaWLfPWeVkpjjKcmqNcYUCgsE80lYMscmK4I8nvXZU4dALbgnHX3HQJS8Uq6km2cJ1i6Z
 T62UIgBmG/YjcFsmYgV//n/JaSCHXRDYdAvwwOtFLq7DiniZ851ogocY/++Qt63h3XG70fRYXd7
 JOs04X8G99k0Whe/gPESxSKNc6Q4qgjEKw3wzVOX/uaqwiC14jx6Ue+9zvkgRUL5Y8wZWAaL9cj
 ICnj8a8KexJxW7pe1T9y1YxJg4tNO2HxTfq+zZCus6teykMBMSF8yERX3LRdXP57ONmBxgv6VhB
 Mv0Om7TQjdIRVlLMzb91ZbiSUSBkaZUN1e/wuWakgn1VWMx3ChLgBb8z3zi61UUy/AGzOLCKrjD
 Yr4uCuQSsp0rlKcL5qsjMmTk5zzKQvt5dBMxR4tRoK4EI+XHuzBMH9fhMrqcDGF8rbzPt6jyL4K
 fakeBeLD61TzAgtmIeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210015
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60L1ZJFM1784890
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 02:00:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229793


On 1/12/26 12:52, Changqing Li via lists.openembedded.org wrote:
>
> On 1/8/26 18:10, Ross Burton wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the=20
>> sender and know the content is safe.
>>
>> On 6 Jan 2026, at 01:15, Changqing Li via lists.openembedded.org=20
>> <changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>>>
>>> On 1/6/26 02:08, Ross Burton wrote:
>>>> CAUTION: This email comes from a non Wind River email account!
>>>> Do not click links or open attachments unless you recognize the=20
>>>> sender and know the content is safe.
>>>>
>>>> On 22 Dec 2025, at 03:24, Changqing Li via lists.openembedded.org=20
>>>> <changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>>>>
>>>>> From: Changqing Li <changqing.li@windriver.com>
>>>>>
>>>>> This is for fixing the following error of 'bitbake meta-go-toolchai=
n'
>>>>> when multilib is enabled:
>>>>> Error: Transaction test error:
>>>>> file /usr/bin/go conflicts between attempted installs of=20
>>>>> go-1.25.4-r0.x86_64_v3 and lib32-go-1.25.4-r0.core2_32
>>>>> file /usr/bin/gofmt conflicts between attempted installs of=20
>>>>> go-1.25.4-r0.x86_64_v3 and lib32-go-1.25.4-r0.core2_32
>>>>>
>>>> Why would you do this though? We don=E2=80=99t support installing ba=
sh and=20
>>>> lib32-bash either.
>>> Hi, Ross
>>> The issue reproduced when multilib is enabled globally in local.conf=20
>>> by following config:
>>> ```
>>> require conf/multilib.conf
>>> MULTILIBS ?=3D "multilib:lib32"
>>> DEFAULTTUNE:virtclass-multilib-lib32 ?=3D "core2-32"
>>> ```
>>> bitbake meta-go-toolchain will failed with above failure.
>>>
>>> [snip of meta-go-toolchain.bb]
>>> TOOLCHAIN_TARGET_TASK:append =3D " \ ${@multilib_pkg_extend(d,=20
>>> 'packagegroup-go-sdk-target')} \ "
>>> [snip of meta-go-toolchain.bb]
>>>
>>> go is in packagegroup-go-sdk-target,=C2=A0 it is extended by=20
>>> multilib_pkg_extend.=C2=A0 so both go and lib32-go will be installed.
>>> go is added in to packagegroup-go-sdk-target for providing entire=20
>>> toolchain include compiler.
>> Maybe the packagegroup shouldn=E2=80=99t be doing that expansion then?
>
> We don't want go to be extended, but packagegroup-go-sdk-target not=20
> only include go, it also includes go-runtime/go-runtime-dev, we need=20
> to extend go-runtime/go-runtime-dev.
>
> so fix go packaging for multilib as this patch to avoid the conflicts=20
> issue.
>
> //Changqing

ping

//Changqing

>
>>
>> Ross
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229183): https://lists.openembedded.org/g/openembed=
ded-core/message/229183
> Mute This Topic: https://lists.openembedded.org/mt/116896974/3616873
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
changqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

