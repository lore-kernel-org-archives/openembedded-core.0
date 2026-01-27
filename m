Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13787D25923
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 02:50:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1191.1769482198374393958
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 18:49:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=POcAubkC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54872b1b3d=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R1KimC3430825
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 02:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=rPSSNvPTqis6bZJsEHS3US
	Acwdm5/qVvI9AsLpQUOb4=; b=POcAubkCtHkZWDVaQq/nPiyHrr/uTZVlRYvuOg
	khFMHuibYyrwSePi5IuzTNhawwSM+//H4hQubMUJzi2vxIlzFlRYpT747jPQpp8e
	zvL9cd0QpxBK4qwrYW5JVO8PJ0C7Sut43TLIABpB2VgTbVgZEg7z160rYT3W1ZCB
	9bEZgSbJ1vqkfqwetfpCEN3A5wyN3ghwZnm4ofTa06qK0CUaQFkKNcRy70OsCkzl
	0WJJ/bRw3HImPRggMJZoSVkvuPPHkb66GZqLT3AXW3KcgNHkJktOgXttsvVfam+S
	cks1SBxGjIpF2AUx9pQWeVuVYZN5pu/wQY0Ys3jBZClj2jcA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011007.outbound.protection.outlook.com [52.101.52.7])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bvka02pkh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 02:49:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqgGO5mPP7TAbDTNPOmIRCJCH83L5tBGOP/VqWrSCU9HCHOqQvkI9t/PdYNHW/2MYYBCOYDnkU0J6i/DyNjim1g3j2raJFM2iWbIN1F8bJaMph4Y8/sds/QfnmxvWZn5qlrBO7nJev4AkqBX1+PHWIIUXPEmH/T1CHxaabkWSxdJvj9sEym1vDjjvH/F3py3YpINhece1yIhqBpUbz0XgqCMCkuSC9uTAIKNBOm9tcQcITVZhYzGX4eruCcveGmiTJlpj3RxWzfjfF2fDeNzF7qos3GPernzXUBM0CsGnNjveLQRVxW8z7hWbryvZXL3COF2ZVOsHoW1BqNLGoY30Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPSSNvPTqis6bZJsEHS3USAcwdm5/qVvI9AsLpQUOb4=;
 b=MbZQmafsmBt7+sflC1EJtjMxSSfo1cGMqjMkqKsMrJcUbjU5wiS7AB5Cz9ClMg9ASQfqleR6DIBi65G9OSgUhkNcyV48WO3SteoE65eZtn4uiW6aWRidEjRnj5BFH3fj9zz7XbKZeDJu5BWH8Hx1KyeQ+vKYItssljnePuS26xesQg6uo4hhAmfskDQ3v1T3ht5ZLDFwqZUbJ9Iwh+8AhGgdYEtRmmb0sSDVRSd9sPzJYjbrzYNop5m5uPOQx/3pbyiyBhm+Uc5OxIpi6SEpKnwZPG13y5jDbFZD3kr2OHfNjjvQAFoPXQ4Pj7zzxLR/mWlx4YUQal1dg+WUkJlQyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DM3PR11MB8683.namprd11.prod.outlook.com (2603:10b6:8:1ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 02:49:54 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%3]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 02:49:54 +0000
Content-Type: multipart/alternative;
 boundary="------------3HmG9W2mvGx1K0m2eAHZgXgE"
Message-ID: <117668c8-bc3b-46ea-9d2e-b205e3f2f827@windriver.com>
Date: Tue, 27 Jan 2026 10:49:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][PATCH] bitbake.conf: remove DEBUG_PREFIX_MAP from
 TARGET_LDFLAGS
To: openembedded-core@lists.openembedded.org
References: <20260122194959.13457-2-rs@ti.com>
 <8684a6b5-809b-41e4-a3b0-c99b424a1b2a@windriver.com>
 <0387b4a0-1457-4de6-9571-022b997199e4@cybernetics.com>
 <DFYTFOYS891P.2A5CKLOKP5KGI@ti.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <DFYTFOYS891P.2A5CKLOKP5KGI@ti.com>
X-ClientProxiedBy: TYCP286CA0067.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::9) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DM3PR11MB8683:EE_
X-MS-Office365-Filtering-Correlation-Id: d214109a-a6ce-45e7-bb81-08de5d4ebfc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|4022899009|13003099007|8096899003|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Q0cyWlErd0hWRS9oTEEwRFEvV2ZObTV2OENWU0ZiT0FXcXFPeEZFdEJSQytX?=
 =?utf-8?B?bkZsYTNQZTYyRCt1NGsva3UzeDB2TExLdGJ1dXVkOHlkeG5uTERhSS9MUWJ5?=
 =?utf-8?B?TGtEbC9mS3M5VFdVT2hJSFdEdU9LT1pUamFNUC9RbGZENHdZRmZweThpME5E?=
 =?utf-8?B?U1VKSVNYUnN4TUM3UzBzK1RWVUhDK1JWVytpQXE1RENFMlMyRHlaVWFSVEpQ?=
 =?utf-8?B?QnN3bEF3bmxkeDFHM0c4UjJOSnRXQVJNakVZb08rMzQ5NXFUVmQxd3QvZEpS?=
 =?utf-8?B?K2dIaVVwNmMweUovcHJEMjFHK1pnZ3RWWGQ3RVZ6VVp0Mk83TUNYTUx2OWY4?=
 =?utf-8?B?YUliZ0J0TnlSUmJYUGpCK0hYK0wwQ2lQUFFUcHBGczRadFFPUEp2cHo3Y0wr?=
 =?utf-8?B?bnNVVjVOQXpxK080Ky9QZTZpaDV1ZnRvK0dPYk00WGU5RnRGNjB2MFpXTUJr?=
 =?utf-8?B?SFlyQkpuMGdDTVNkWmZ6dkZmWGlENER3dHZLY3BIUWlXSzJXWlFKWktENStm?=
 =?utf-8?B?Qnd5enIzR2xKQUZlUG1iZFhTT1psM00rNzRPazJPRGRLUjRrNEN2VTlqSnRY?=
 =?utf-8?B?L0hRR1lFN3BxcDVpZGlsZTFhNkNMS1FzY0RCYmhkZWszZ0NpeFIzSHN6Uksr?=
 =?utf-8?B?elRFNnFja3ZBSkwxQnNYT2Jac3M0WFlVWlBiVkViekF2RFlER1JsL3ZIRmsz?=
 =?utf-8?B?YitidnpMTmVPQ1VBdGtoSTUvc2xlRmtJR2xPMXNEb25FOUwwT0JEdWp2czR1?=
 =?utf-8?B?TGRFTTR4TS9ZRU4vN2J5RlJnZXVtUTdkVnoxTnFZeGdDWUowVXhpU1U3Ykp6?=
 =?utf-8?B?aElVZmJQeUkrdEFIUnhGUGZKd2xjdExyRGg0U3JuK0lXTzNnTEdZenVPY2xy?=
 =?utf-8?B?bU4yV1lKdjR4dFdUNEpOeFRLa0szMFVydmtzNGJJaDlPU2Z6bzBqQnlSelhJ?=
 =?utf-8?B?WTF1Z1BubmNVY0FZdEdHbTFudm5GSytabkFaWlJUY1B3T3I3Rko1TmRKZEVM?=
 =?utf-8?B?MUJ2Z3djM2t6d29zSUN6Ykp5QVN3eHc3S1dWNVA0T2RLRlZtaUxkd092T2tw?=
 =?utf-8?B?K1BhSW1tL09jdm1pWWZsQis1VHRjVXBYajduTmErU3ZHakpjbjVHTVl2WVI5?=
 =?utf-8?B?RnlzSlozYiszMFVTVVBZbzIrZkxCK0cwSXkreUlFbHRxc2J6TG4rb2tZTVNh?=
 =?utf-8?B?Ty9jSnkyNE52ZlZrMllrYlBOVlQxMXB1UWR6UzFZMkQxRlVHU3JhazBHbWtT?=
 =?utf-8?B?Nm9zREFoNXJROTcyTjBlTU5VVjRFS1NvbGdqZ0NzMk5pcEMzajFwNzQxSjkx?=
 =?utf-8?B?ejgxRmdwNExQR09QcGhKTFdKbW9nb090L2tXOEhBeVJiNzBaU2FRSVZEL1Nu?=
 =?utf-8?B?NXduN05qbHU4SGxpelBYZVNONWdPeFkvSllDeDVMZ2k4RjhjRzFQa0lBblZT?=
 =?utf-8?B?Y25GSGtRaWVncVJKZHQ2eWlaamVFallmL245L2FlOVNDbUU0RUZnWUlWL3dE?=
 =?utf-8?B?YzN2Sis5OHYxN2h0RTVLZ1ExbUdJNzE1RERsNjdsRUhzVVlvR1hOUy9MTTFK?=
 =?utf-8?B?RDdVdThSVGRBK042TmVSNXozSHo4RTNpV0o3QUZPVjJaVU9CMmZmc1gwQXB0?=
 =?utf-8?B?bHkwWE81Mks5M29kYkh2djBzY011MjdFOElaaUJaN3dKYVhJa29LMEoyNm9P?=
 =?utf-8?B?blg2U1NWOHRzbmpxZUxVeHJPemtWamg3cjdSZS9GYU5qb2plWnNrWkhabGZn?=
 =?utf-8?B?MVZ3Yk93NDZwUTkxaVg4VXNaa1paOURpdlA4cmpsQ0svOU91S1ZleUI5MFZt?=
 =?utf-8?B?TTJuSlgwWnpKVUpYUjN4VXJiaGFGajl0TGl4L29xMFN2bjYxWlJ5cEl1VXhr?=
 =?utf-8?B?MVFaNFhYQnZGOWRsUlRkN01JODdUQ2Z3RmxIT29Wd1c5b2lrZVl1bEk4Q0xk?=
 =?utf-8?B?bGdTdy9mTW0yZElTckQ5TFN0L3VQYVBDTXZzRFVxNFlKUk42R2pNVTNUbFFj?=
 =?utf-8?B?Z09KNVFncW5XczRWWnFpWWl3UUNRTmF5YTNPNFBQR0xLVlpEMlFUZUJZWEJn?=
 =?utf-8?Q?4r81c4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4022899009)(13003099007)(8096899003)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RTRjZWFuUVJZVWp3RER1b0gvVERtRWtiaWJ6MGM1eVJYNndWeDQzMVhTOUFD?=
 =?utf-8?B?L2dpZ0N1SUhPMDd3K3ZKUmZkQkpQODJLTjVCUnVoY1d1NlA5MkNyTVFCOEky?=
 =?utf-8?B?ekE0cVhuSzNnNkszalMwV21PZGhHTkNCVmZyYzBQaEFnKzVSeGt0MUxaSkhk?=
 =?utf-8?B?WC9RenhhNkdtOVltR3MrWUVHWnA1RFpDeHpwMkRXek1qNFE1T1VIM3h5YnJn?=
 =?utf-8?B?NmF0bVpMMjk1a0FXbWJiZHlIdWZtVUw4Uzh6c1FRekszNXJvTDFZaHBXUG1K?=
 =?utf-8?B?by9WVUZTWWlXcHFlSjg1bVNiN2tydUZBZ3JYVHlXYkFLakVtNks2OWFpbWkw?=
 =?utf-8?B?Tk53ZkVWTmdJTE9Tb25VK2YxVG11bFV5L2pWSUNQQkw0UHRtWURCakpLZDM1?=
 =?utf-8?B?ZlQ3MlRQNG5QbitBSFh6OVVJbnBsaWtSTHJ1QjNrbExJUFRsRjVsdkRCaUIy?=
 =?utf-8?B?cUVXTDR1QzVwTEdsNExZaWtOTW1aclBqTERrdFNSb3pWSFcvQU4vOVM2NVdo?=
 =?utf-8?B?MCtDZ1lIS2Q1S3RxZXoyYXZaR0tUT21FRzdEbGhNT1ZvcGZrVWY0U3hsempG?=
 =?utf-8?B?VUpJL3ZBSWtZUmdOWXF6MFNTUU5jWGhYTDRqZkI5MG90TGdoK1pud0luY3h0?=
 =?utf-8?B?aHFuZWVkTTV3QXFMTE95djlrMC9ja0VLK1JPUjAwdTRGQVA1azMydUtpT0Fj?=
 =?utf-8?B?MUtYaU9SRktKNVNVMXU2bVkrTmxtRXNNVVNUZWRYa0U0Uk5rcGlnWGVhM3FV?=
 =?utf-8?B?QUc1NnpjNUZuR2JSYlo2RkFnNmp0dG00a0JTTFhaMk00N3BQOS95QWJHQ0U2?=
 =?utf-8?B?RklXamNLanU4dzV5L2JxNXdmR1lEQnAvUTlob2kzZURiVGswWi9yY2FLNzlK?=
 =?utf-8?B?S1dYV2tCVmRQYUdYRHJjd01OeG9KcHZhZnBPKytuK3labllUaEkxaFMvaThH?=
 =?utf-8?B?U2xrMWhPajNCS3JIY0FJRVhCRGFrOGp6WVVmQmVlV0NJN0w0eWlyNjNET1U0?=
 =?utf-8?B?em9ZbTZzNHZUOTJ4NTZHamtGYm96YWFhcDFoUGh3bHZsMmc4dVFlRlBuZDF2?=
 =?utf-8?B?UDh6K2p6TUpBVEhpVmJNcVJMK05NMmNKVG16aHZadkRKWnFGdGN4aTlXdmJx?=
 =?utf-8?B?NzA0ZnJVbE5QUGQrV0JaL3RhN3U0czNkSlNHZ1F3L1dVVkFmcnJ1UC9salZ0?=
 =?utf-8?B?QjNKZXpTUnRZTGZZeCszWVM3S0RyNEVQUjEremNHSnpqRU5DdUFGVmFPdzEw?=
 =?utf-8?B?U0JzZUpWNnlWSWhhVndZUVdEOGZPd280MmxUSC96aGtxbmNEUmRNS09PWXZN?=
 =?utf-8?B?OFUwOER3NDdDbnAzTFJUZXF3MFNqT1dkKzNDenFZS1VnZHZoQm1UZ1hWZE4y?=
 =?utf-8?B?ZDlhNzkzOEh1VExlMU5CRU5URm80UUZGYjRUY1YvRTFIRkRkOENjTnJzVUpr?=
 =?utf-8?B?Q2srRVgrWnlZbWF3bnVGQnE0c1VTZ1FyT1JFQ1NwU0cyTjNwNVJGaEJidENL?=
 =?utf-8?B?VE1RUHVma0ZnYTFmdysyMi9UZ1dCQk1RK2ZUMUYzZ0dRTk9RLzJEa1A2alBi?=
 =?utf-8?B?Wi9Ib2Q4ckduSXJaZDJWcVJudEw0VTBDN2owWGNXamNONzJyQzR5eE00a01D?=
 =?utf-8?B?N204bWZudVM3SC8vdHV6L3gxQ2VSdnA1eXYwMTY2Sk5Ha3hsRnNUOW9WakJB?=
 =?utf-8?B?MkFUUmVubmFLQmtIeHcrQlZ2Vm1aZzIyMEkrSUxMTTd6ajBBVnNESjIyNko0?=
 =?utf-8?B?dWpPeXJac3RCYWkxT2Q5c0lLMmxseGgxeTZ2SUhrY2J1MUFVS2dSV2FjWUVD?=
 =?utf-8?B?RmJzUTRGVGJiWEdjejlwb2cxQUJYdzJEQzlVY1luUGpGNWtJODZrSjNEUDNq?=
 =?utf-8?B?bkdQQ1kvTVFicTl5Z3ZKRERocEVKUVMrNlRuZVN0ajh5ZkxzcEEwcEtnYk9v?=
 =?utf-8?B?UG4xOXcxc0JkcFBLMk90UThIcjVIOXlsUkxESzVITHZqWkk0U3QxQjhVcS9X?=
 =?utf-8?B?cmkzdG5sRU1pT2krVitJbzY4c3M4WU9Hb0FhK1ZTd1oycWxORkFKU0lGRnpa?=
 =?utf-8?B?UGswdzVIeTRwUm5WYTltL096NE81ZXFwRGpWZFZaeXNsOG5lK1Yrb0JMLzVx?=
 =?utf-8?B?SHZITjExWllMSlAzWU1DaUpCVHA0S2IvMUd5M2ZKbUxzNUJsQzB2OVljdlhI?=
 =?utf-8?B?bjh0eTZwaUFSNDl5ZXJ2SXhYOEtGa091cTRJcHEveDROcUx3K0tpeXdjakIr?=
 =?utf-8?B?NWlZQnJ3Q2w0V0VOUUxNb0UwOVBrQS9PYUVTZXpCVy9mQmFTK2JoQlh3azRG?=
 =?utf-8?B?NFlxUXNmcjhmZk9URjM3VTZjV3oxSURFL29CK2kybkRlUGgzVGNOVEZnbjBy?=
 =?utf-8?Q?viPnBAS7/thWhW8o=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d214109a-a6ce-45e7-bb81-08de5d4ebfc3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 02:49:54.1549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lzX7QBHXRsBTczw3BD3q0DXt1pJZCv8NdZSBgLeIWT4g0pv34gLMCbvZtfkp9gRhOS7NFlio59Ul6q36P5WDmIsPsPOyWON+iiFFmWvwQqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8683
X-Authority-Analysis: v=2.4 cv=I+hohdgg c=1 sm=1 tr=0 ts=697827d5 cx=c_pps
 a=St7v3kIWLLX4ycmTPR678g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=mDV3o1hIAAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8
 a=sozttTNsAAAA:8 a=t7CeM3EgAAAA:8 a=gG22cs3rQv3BWUCNQCMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=UBFVfQAFWYhimOpKR3UA:9 a=ougeJFaNfIdF4aoZ:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAyMiBTYWx0ZWRfXwUqRJyL3+F4V
 XSdyMGUlsx/saoEKU/mYe8tWFaT1Q6YWE/xD1X/kBDYzP0VjFNAhMb5YUc25xnxsU+LZ1A8cTxl
 rzNbOUycTX6S0e3q3Tr6IixKiAr/n/tsAbdaWQiBcTZq6k0J8YSrRJHUwFzk4FS2FNcNczi/emr
 pDl0PxrWiJocqwWX3xRv0NzUv5FFYb8oUNaJ6ktnoELxjK8XbBhyBvwv+tJ385zfP/7KvWluheR
 ndRMfWB9wkv8A5/TnwdzPdS83MLwjMaqa3xIxs4YBmeILyOVqzQF5bBN92Ty90x0lf5kD/dcRBg
 nJ2JoLyrH+VOl3168EUK/VswXNBl6cZRwa7VUA3jfgekcDMewF2JzXZ+ZOYjIaGwYenFv4GP4rF
 JNknHryLfCukxMgx3YzrmsM/de8sPZYj24qDs8BoBGm/njvlQoBNHkn4jttUkbs+dfSu5vJbZKQ
 SFaiLSIl9boviRcipVQ==
X-Proofpoint-GUID: QXgFizYYFww1A2NCbTare4iqsmtzkH9B
X-Proofpoint-ORIG-GUID: QXgFizYYFww1A2NCbTare4iqsmtzkH9B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 02:50:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230027

--------------3HmG9W2mvGx1K0m2eAHZgXgE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60R1KimC3430825


On 1/27/26 04:50, Randolph Sapp via lists.openembedded.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Mon Jan 26, 2026 at 9:04 AM CST, Tony Battersby wrote:
>> On 1/26/26 03:39, Changqing Li wrote:
>>>
>>> On 1/23/26 03:50, Randolph Sapp via lists.openembedded.org wrote:
>>>> CAUTION: This email comes from a non Wind River email account!
>>>> Do not click links or open attachments unless you recognize the send=
er and know the content is safe.
>>>>
>>>> From: Randolph Sapp<rs@ti.com>
>>>>
>>>> Now that the previous bug affecting binary reproducibility has been
>>>> addressed [1], we can revert this patch. This will resolve issues wi=
th
>>>> cgo applications becoming unreprodcible.
>>>>
>>>> Currently go considers link arguments to be sacred, meaning any chan=
ge
>>>> should produce a different binary output. They ensure this by baking
>>>> link arguments into the intermediary output, changing the content ID=
 of
>>>> that step. As such, the marco prefixes inadvertently end up adding b=
uild
>>>> paths to the output binary instead of removing them if they are pass=
ed
>>>> as link arguments to cgo applications.
>>>>
>>>> These paths are later stripped out again, but at this point the cont=
ent
>>>> ID of the dependency has changed and thus the build ID of the end
>>>> application will be affected by the cascade of hash changes. See the
>>>> upstream bug for more information [2].
>>>>
>>>> This reverts commit fddaecc88979967d0e00e2fafdbaaabec030da9f.
>>>>
>>>> [1]https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D101473
>>>> [2]https://github.com/golang/go/issues/77218
>>>>
>>>> Signed-off-by: Randolph Sapp<rs@ti.com>
>>>> ---
>>>>
>>>> This resolves the previously reported emptty issues:
>>>> https://lists.openembedded.org/g/openembedded-core/message/228549
>>>>
>>>>   meta/conf/bitbake.conf | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>>>> index 88f4d0df69..da873c3f4e 100644
>>>> --- a/meta/conf/bitbake.conf
>>>> +++ b/meta/conf/bitbake.conf
>>>> @@ -634,7 +634,7 @@ TARGET_LINK_HASH_STYLE ?=3D"${@['-Wl,--hash-styl=
e=3Dgnu',''][d.getVar('LINKER_HASH_ ASNEEDED ?=3D "-Wl,--as-needed"
>>>>
>>>>   export LDFLAGS =3D "${TARGET_LDFLAGS}"
>>>> -TARGET_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED} $=
{DEBUG_PREFIX_MAP}"
>>>> +TARGET_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}"
>>> Hi,
>>>
>>> After check the related gcc bug and yocto bug,  gcc bug comments 21
>>> ([1])  and yocto bug comments 13 ([2]),
>>>
>>> my understanding is that,  when lto is enabled,  even with gcc fix
>>> [3],  we still need DEBUG_PREFIX_MAP in LDFLAGS
>>>
>>> to make bin reproducible. Also seems Tony's commit [4] is after gcc
>>> fix [3].
>>>
>>> [1]https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D101473#c21
>>>
>>> [2]https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14481#c13
>>>
>>> [3]https://gcc.gnu.org/g:7cc2df084b7977653a9b59cbc34a9ad500ae619c
>>>
>>> [4]
>>> https://git.openembedded.org/openembedded-core/commit/?id=3Dfddaecc88=
979967d0e00e2fafdbaaabec030da9f
>>>
>>>
>>> @Tony, @Randolph, Could please correct me if my understanding is not
>>> right, Thanks.
>>>
>>>
>> Yes, LDFLAGS needs DEBUG_PREFIX_MAP to make LTO builds reproducible,
>> unless something else has changed since 2021 to make it unnecessary. I
>> have not kept up with the issue.
>>
>> Tony
> I think there has been some change because I tested this locally with t=
he normal
> reproducible builds selftest and no new packages were added to the fail=
ing list.
> This included oe-core and some layers from meta-openembedded as well.

Got it,=C2=A0 if DEBUG_PREFIX_MAP is not needed any more,=C2=A0 I think r=
emove=20
DEBUG_PREFIX_MAP from LDFLAGS

is a good way to fix the issue.

>
> The example code given in the report is fairly rudimentary, we should h=
ave hit
> the bug if it was still in effect across a majority of packages if my
> understanding is correct.
>
> I'm also curious to see what golang want's to do about this though. Bak=
ing build
> options into a binary seems a little silly, but I'm sure there was some=
 unusual
> behavior that led them to that point.

+1

//Changqing

>
> As indicated on another thread, we could also just remove this string f=
rom Go
> packages LDFLAGS if that puts everyone at ease.
>
> - Randolph
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230026):https://lists.openembedded.org/g/openembedd=
ed-core/message/230026
> Mute This Topic:https://lists.openembedded.org/mt/117408334/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [c=
hangqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------3HmG9W2mvGx1K0m2eAHZgXgE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#ffffff">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/27/26 04:50, Randolph Sapp via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DFYTFOYS891P.2A5CKLOKP5KGI@ti.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Mon Jan 26, 2026 at 9:04 AM CST, Tony Battersby wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 1/26/26 03:39, Changqing Li wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">

On 1/23/26 03:50, Randolph Sapp via lists.openembedded.org wrote:
</pre>
          <blockquote type="cite">
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
@@ -634,7 +634,7 @@ TARGET_LINK_HASH_STYLE ?= <a class="moz-txt-link-rfc2396E" href="mailto:${@['-Wl,--hash-style=gnu',''][d.getVar('LINKER_HASH_ASNEEDED?=">&quot;${@['-Wl,--hash-style=gnu',''][d.getVar('LINKER_HASH_ ASNEEDED ?= &quot;</a>-Wl,--as-needed&quot;

 export LDFLAGS = &quot;${TARGET_LDFLAGS}&quot;
-TARGET_LDFLAGS = &quot;-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED} ${DEBUG_PREFIX_MAP}&quot;
+TARGET_LDFLAGS = &quot;-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}&quot;
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">
Hi,

After check the related gcc bug and yocto bug,  gcc bug comments 21
([1])  and yocto bug comments 13 ([2]),

my understanding is that,  when lto is enabled,  even with gcc fix
[3],  we still need DEBUG_PREFIX_MAP in LDFLAGS

to make bin reproducible. Also seems Tony's commit [4] is after gcc
fix [3].

[1]&nbsp; <a class="moz-txt-link-freetext" href="https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101473#c21">https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101473#c21</a>

[2]&nbsp; <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=14481#c13">https://bugzilla.yoctoproject.org/show_bug.cgi?id=14481#c13</a>

[3]&nbsp; <a class="moz-txt-link-freetext" href="https://gcc.gnu.org/g:7cc2df084b7977653a9b59cbc34a9ad500ae619c">https://gcc.gnu.org/g:7cc2df084b7977653a9b59cbc34a9ad500ae619c</a>

[4]&nbsp;
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?id=fddaecc88979967d0e00e2fafdbaaabec030da9f">https://git.openembedded.org/openembedded-core/commit/?id=fddaecc88979967d0e00e2fafdbaaabec030da9f</a>


@Tony, @Randolph, Could please correct me if my understanding is not
right, Thanks.


</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Yes, LDFLAGS needs DEBUG_PREFIX_MAP to make LTO builds reproducible,
unless something else has changed since 2021 to make it unnecessary. I
have not kept up with the issue.

Tony
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I think there has been some change because I tested this locally with the normal
reproducible builds selftest and no new packages were added to the failing list.
This included oe-core and some layers from meta-openembedded as well.</pre>
    </blockquote>
    <pre wrap="" class="moz-quote-pre"></pre>
    <p>Got it,&nbsp; if <span style="white-space: pre-wrap">DEBUG_PREFIX_MAP</span>
      is not needed any more,&nbsp; I think remove <span style="white-space: pre-wrap">DEBUG_PREFIX_MAP from </span><span style="white-space: pre-wrap">LDFLAGS </span></p>
    <p><span style="white-space: pre-wrap">is a good way to fix the issue.  </span></p>
    <blockquote type="cite" cite="mid:DFYTFOYS891P.2A5CKLOKP5KGI@ti.com">
      <pre wrap="" class="moz-quote-pre">

The example code given in the report is fairly rudimentary, we should have hit
the bug if it was still in effect across a majority of packages if my
understanding is correct.

I'm also curious to see what golang want's to do about this though. Baking build
options into a binary seems a little silly, but I'm sure there was some unusual
behavior that led them to that point.</pre>
    </blockquote>
    <p>+1</p>
    <p>//Changqing<br>
    </p>
    <blockquote type="cite" cite="mid:DFYTFOYS891P.2A5CKLOKP5KGI@ti.com">
      <pre wrap="" class="moz-quote-pre">

As indicated on another thread, we could also just remove this string from Go
packages LDFLAGS if that puts everyone at ease.

- Randolph
</pre>
    </blockquote>
    <blockquote type="cite" cite="mid:DFYTFOYS891P.2A5CKLOKP5KGI@ti.com"><br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#230026): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/230026">https://lists.openembedded.org/g/openembedded-core/message/230026</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/117408334/3616873">https://lists.openembedded.org/mt/117408334/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------3HmG9W2mvGx1K0m2eAHZgXgE--

