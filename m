Return-Path: <javier.viguera@digi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA70E68167
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 10:19:25 +0000 (UTC)
Received: from outbound-ip199a.ess.barracuda.com (outbound-ip199a.ess.barracuda.com [209.222.82.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9145.1771323559275903802
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 02:19:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=jbVSt9Zd;
 spf=pass (domain: digi.com, ip: 209.222.82.65, mailfrom: javier.viguera@digi.com)
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11023099.outbound.protection.outlook.com [40.107.201.99]) by mx-outbound14-36.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 17 Feb 2026 10:19:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uFh8S+mKtVAzMABBZClPGkQqrZOhCNRRIg5NOIH6xmEMGwM1wi365YXamcZJ5Otq/JEh+Y0JOj+UKrbDgTQxj03T3/8SdSUOWQdDPFsW9F+aUnkMJSePEC/OSTTqSj84bG0AiCOPZipT6Z4C2nFdwniLsUCZ3PcPfRHbxyS+SgHUf87/ZZ/GwD6MeB5Dr2TsnFgcQI4Mfyy31hzjorE4tXpBELsEjxpF9C6qLEhgyFGnlO9RE32rJAXiFTGGKr/NuxV3GucXTapUtwDuVLx+QpXfyWxJL3UTboylwmmMoMDFCDZrEnl0me7OZ8l5R0IEclXKAZ1V/Oh3RNX6ySsNnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHjy0EGPL9I/r4ZOlbJIoLGGqxWgU8aDp1XmL3UTGng=;
 b=RpD2/ShldI/P3p3GwaEHErbrSBa+oF/L8WY9xB4iqimVfsvtF5VvlCPWdM47rH7LgXShGmliNN4gXPRDUsMWm0yet6v72zzT98yO/l3OahF0bz9tC+Gg7MhynSn3I6ldNjZZ/mfF4aC8I9z97iURT6s1pj1nYYcJnhMc0JoFV4w2pga7iYJepSqr2SWMHSXxsQSkZBJvwuKotzSgsJQR2bmKwTBI3v2zkcHXUu2E0WyNCRHnrA8rncbbPS4ZnvAe7LBxyHIETvszHSlrVFmnVuTlRMhCcqv0/8wV9+gGpwL8RYhB/Llm1RaeFLfBomuKUWowoM6VyWwGltxj1JFxpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHjy0EGPL9I/r4ZOlbJIoLGGqxWgU8aDp1XmL3UTGng=;
 b=jbVSt9ZdelxKzU+vziUDLVmkzoU+nCR3Zc5jO24+g2Rnmin1/36yrE3oYHHvjRG34YORf+edxd5NxNVDS8+Ynm96eLUHBDpo5j7yhXZijS31sG/ywQNR/PVmBd8BNkETQeF/kliqqitPBWs91sI/aVYG9YohQh7GNAhzgEvaxs+hbRQD0oNbdMi2GX7ydJxCg89sxgp7ZcnVqYi0488EWocWUHEuTZGFQ5isPeAXZA9gz0EJQq1HOZ4AAWHDOVxEpCr35/sNKuFegXBA30V48FImIQky4A0rx8Jm5yJlq3DP17FqE0fabfihSo0/3z6mQsr9Uy/8iOIzWO6Bk8NzTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from BLAPR10MB5156.namprd10.prod.outlook.com (2603:10b6:208:321::24)
 by DS0PR10MB7363.namprd10.prod.outlook.com (2603:10b6:8:fd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 10:19:11 +0000
Received: from BLAPR10MB5156.namprd10.prod.outlook.com
 ([fe80::228a:7b4f:3287:f13d]) by BLAPR10MB5156.namprd10.prod.outlook.com
 ([fe80::228a:7b4f:3287:f13d%6]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 10:19:11 +0000
Message-ID: <b18d950d-4a43-4797-8c9d-0a7b350d04fc@digi.com>
Date: Tue, 17 Feb 2026 11:18:41 +0100
User-Agent: Mozilla Thunderbird
From: Javier Viguera <javier.viguera@digi.com>
Subject: Re: [scarthgap 00/28] Pull request (cover letter only)
To: openembedded-core@lists.openembedded.org, yoann.congal@smile.fr
Cc: richard.purdie@linuxfoundation.org
References: <cover.1771008295.git.yoann.congal@smile.fr>
Content-Language: en-US
In-Reply-To: <cover.1771008295.git.yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::9) To BLAPR10MB5156.namprd10.prod.outlook.com
 (2603:10b6:208:321::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5156:EE_|DS0PR10MB7363:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f0b934b-227c-42cd-f010-08de6e0dfe3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K0dER0hMT0pBMGZiU1RFWkRJRlFWU0M1RXVpUjBMcWRsdGtaMkRvV2pSSFR2?=
 =?utf-8?B?MGV6ZjQ0TDdPQ1QzUDVDTTMxa1ljQ3JrVW9mWExOL0FLUlFYZUZkYlNpTjA4?=
 =?utf-8?B?RlVPQ2VYUC9yZ2RpTmFtd1FNNFdmdCtTWjhCNENWV3VGc0VCODZ4TXU2T0Vz?=
 =?utf-8?B?UWp1NnU0OXJzMitkZGRqZlE3Z0xXU0xTcEZGL1ZSSkcxZ3ozOE13Y1RvMVlU?=
 =?utf-8?B?Q2ZpMnV1ejVHR1BEVUR0TitRZzhuZE9yZHVIQ2JvbFhGYmRBTi80MWZjNllt?=
 =?utf-8?B?U1B2SzN5em1QcVlHa1pqUzZ0cnpna3B6WkExWWw5cnFZWmxBQmdweUtvMjVR?=
 =?utf-8?B?S0dScE5VYkowaUtYUnhXaFNmZ1BvVDVReWZ4TVc3OGEwTi82YmJtWXB6MFRx?=
 =?utf-8?B?ai8yVkdXeW1TbVB4NXVMTlN5djFBTVRieWg1bEFLYlVGYm1JZ3FaMUpkMkY1?=
 =?utf-8?B?c1VoTDlVbFdkQmN3WmNmTlEwU21GaTRSNUpXUDR6MEUrbkpVRXRNV01CVnhW?=
 =?utf-8?B?b1cyVmZrcVdFczl3WWpBSVZkeEVpVVZRYkJQR2ZnTnpEalRkYWZTTHJVVHhw?=
 =?utf-8?B?MFBrZHI3TU9GUFprYkExU0JxZkJJSi96S1RoOUR0SXF0WUM2Zlg0ZWViZzBD?=
 =?utf-8?B?cFhFVm5DbCsyMVF4cWtBSHZrNWpzQXF3U0VJTjJmSTJOc3lOc0hjTzdScXZN?=
 =?utf-8?B?YmNWUVU2WGF6S3NKeSt4dTU0YnJtMDgrREExWjBuRDdsSlNTSzVaTlRXTEpD?=
 =?utf-8?B?NllPNlhIL2luMUxYSEorTEFWQyt1WWl5Q2pCT2NsZ3ZUMW9kbXkwNG9Xandt?=
 =?utf-8?B?SGZoSVBjbG5rU3FOejhiSWFBV0UxNFNGY0grc1JpSUR0SHMrY2FDRFNGb1Zv?=
 =?utf-8?B?S3pqSVUya0xJdXRJWFJ2QWxBOEFnejNvUjE1UTQrazlSNEQydmFXOXBWdFEw?=
 =?utf-8?B?VG1wSE5sY0ZWSjYyeDRoK2ZhZmRkaGJMOE9yc2k5d3ZSeGdQOTVVWjRldHhF?=
 =?utf-8?B?L1F6RnFUY21uZWtGOGpHMXh6VjljT2wrQnBBMzd2S2xTN0NZWlY2MXdGNzV0?=
 =?utf-8?B?ZUNJOHJrbzErdE4renlFZDRocVBtWDR4cnBjcG5aYUpVWlBYbjUvbGQ4ZWxM?=
 =?utf-8?B?aWVtS0hwTVd0NDAzRVprNFdnbHdiRkRGN3ljOVJGMXhOT2NCb2lZWkNseVp3?=
 =?utf-8?B?T3NPVjNzOWtra1Fxd0JXMXVLbjZ2YkdXdVpZMFhuWE42KzdpMDlMMGNmSXAz?=
 =?utf-8?B?LzZlMHU4MXFUdkhINFZ2M0tzUG1VWG5qa2lXdndTZW91T2RtQ3lWSnVGTGpJ?=
 =?utf-8?B?VVVoWmdpaUVUOFFiSXJ4TDhVbFBpZEUwSy9mVGlxbXZnalQ1RmFsaTB3UEZo?=
 =?utf-8?B?blQ1M2pBeUx0MDZHa2FHUXFIMGhzYnZ5TU5nVk9nbmovMTdQQ0RWY2MrRjcz?=
 =?utf-8?B?QSs0VlJ5cmFvRzNhUU1xM3VGNm9YbG0rdS9FZnBqU0JoTUcvNy9pWk5laklO?=
 =?utf-8?B?bi9TbFVnRTgybXJndlQzMkJuSENVWFZIVml6ZGU0d0dmYzBHRmdaaTZMeDZS?=
 =?utf-8?B?bzNUWjdUS1lEelJyeXNWcXNTbjVJY2lMOW5BSFBLTW5LRTY0S3dMaVQ4UkVm?=
 =?utf-8?B?U1lrWWtGYVFmZjVndXZQRGhDQStqb0x3a3ZJNVhNOEt0bjdRVWFDWEovWVln?=
 =?utf-8?B?c2szWUxwYXp2blVFY2ZMMjhXQUdkSkE2WHgrMWdNYmorQlgvYldmNGlMcFRJ?=
 =?utf-8?B?TjhNNXNCcjYvVG5yeXBvUjlIZFVwZVZ0L2lHRXVHNmg5Y09nek1paUlFSGNC?=
 =?utf-8?B?TGU5WmhGQTRPZDFBSlY1UG42L0RQRmQvU2dFZGdnbDUzRVJkTWJQenBvUXNF?=
 =?utf-8?B?bmRFMVFFcFRVd2NFTjEvTzhVT3JSZTUyNWh1bXUvaHRxUitGZjJLV0xSUHVK?=
 =?utf-8?B?TVZzc3FnRHl2OUd4Q0xsejB5a3JuMmRsYnFyNzdjMlFNalluK0hITldDdzFk?=
 =?utf-8?B?blNVSEtzelEzK2FIK0Uwbk9hbmsvQVJRMkRuVVptYkluQ2hWVDlyNWZmU2FI?=
 =?utf-8?B?MlhVeUo4U0hRZTdDQVFJckVEMWlmNldxazhFVTJWei9xSDlMclRJMFhxMTlt?=
 =?utf-8?B?cjA5NDJZYzc2MmFEc21WdVVIK1luUnd4Z044cmFEaVpNSlZ3NFJMTHdJd3do?=
 =?utf-8?Q?NE1Kevq4s4bwJD+9pzEkL+A=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5156.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Rm5oMDlGNlhsWkJFTEk1L1FPZkhjQ05tWjBuSU1BVXZmdG9FYVdGTzhxWDdv?=
 =?utf-8?B?RC9DTlIzQ1JMV3RlMzR6MmdLMDBGVjZ3ZkxMbElUOXJYTFVOTlM3Y0hVNVdq?=
 =?utf-8?B?YlFVZVZsU254bTdhY3hUY3hwY1V1WHVJOUxxSTExQ2U1TWdPUGJPbHpTU25V?=
 =?utf-8?B?UzhYZUFYWGY4SjdNaUNjMkFHR1p0ZVhQblhoVi9pMGRTM1JPVnNqUWdFNUFL?=
 =?utf-8?B?K3VVWHJrT2dndDQzRWZpSnJCRURoVi92ZEJTY1NocXMxRGVrRDl5UkM4TXI3?=
 =?utf-8?B?Y2djVjNxNmdEMVFUa08zZXR0SDJNSjdHNVQyU01UV0xvRXJQSUxJZHlvYWcv?=
 =?utf-8?B?OVhPK2JhTEQwSmV3OEppU2FCYjJaWE5qRnFTSThDWTY2bHFBcmdiM0tUUDhO?=
 =?utf-8?B?QzFqUHFhRVlZck9iYjFDRG1UWUtjYzJ2TGFubTlBSlcyV0t0MjZqUWZrZHVK?=
 =?utf-8?B?MjAwMmZJa2grZ2J3NUlhcDRFaVdVRGl2ekFDdHlFNFJPdDhXVmRDVkswZzll?=
 =?utf-8?B?V09QbnAwRTlnakRJRm9LSzZERnJNZE5TR3c0dnBPT3lYQ29CakdYeUdBSHV5?=
 =?utf-8?B?ZWVTSFFtU2lYaTE5NXpxdFdxMkt3QkVUVm5FbFJiQnVpblkwSktvdis1ck9u?=
 =?utf-8?B?aXJZUXpYeXo1TGlmSUtuNDlIdTBreC9jaDlEb2VNa25tam1FeFljcU9mUmNK?=
 =?utf-8?B?endNVGtzVC9XOE8wYmNzSlh6TlNrMzdzeHJURVhtSUJNM3VZaWlTcmMrdC96?=
 =?utf-8?B?Wnh5RGhMRmx1TGJweTN0elhna1J6SXdKZjJ4VEliK3pmM3dybXYrZnlMNEdx?=
 =?utf-8?B?Zm96RzlYbVcyNERHVmpHY1JlR28yZDluVTVFR1krL3lielg5SWtYbVpKNldj?=
 =?utf-8?B?dTJaSFBHU0lwWDA2Nmt3Mi80Z2JjdmJ2aDJvVkRmcWRPZ0xyT1l2ZjI3MkVt?=
 =?utf-8?B?NXhmbCtxT3MrYjkrRW9nUlVKQ004dWFBc1VLMU1GbUZBYWVpL1VzUHFoa1R0?=
 =?utf-8?B?ek5aN0RQeThMYXZCdmZWaDY5SlZrNXpsQXBWak1OMTZyakRBNkxtLzhzQThR?=
 =?utf-8?B?NDB3U1dONnovQ2c2NHEreHVad1FNWDF2OGJYeCt4Uzhtayt6Si90TzNhKzZM?=
 =?utf-8?B?djc3cVlTN0d3UkVCMHdEMnVkNkdGdEhlQ1ZmV0l6bldYUUtJTGdnRng3b0NI?=
 =?utf-8?B?Qkt1SlltSkdVMThVYUpscUY4RkxLaG51djlTTCs3TytkQWJpRFlqVnBDTGdH?=
 =?utf-8?B?aGYzd0JOZzA1YUFWVjdVMEFSd2dpdEtlTlNudGI3ZnFtNXhiem1IeTRLYnVG?=
 =?utf-8?B?R1hRa2RzaHFISUthTWQ5MWJUOUtWZ2c0bmRSa2hlckRqWEp2SkhJVU1JTzRy?=
 =?utf-8?B?U1dJclpqTk1oZmJ2TTlQOElGM3V3UkxQUm9nTE10VkRDTmh3Y2FVTTIrYko1?=
 =?utf-8?B?MEdIcE9UYW56UXArMVpybCtTT0hFZWQvTit3T1BiSCs3STdtS09MWmtPMG9Z?=
 =?utf-8?B?RVM3UVBYWnFaRTVZWS9NUSt0YzZmSTgvcCtOcldDM3ZnMWc1NEJzZlNGNWFI?=
 =?utf-8?B?U1A0andjdzdwbGxCcUcybTFGYUZFbUJBQ1l0UTRENVJVeDA0WEw1UXQ1MW5u?=
 =?utf-8?B?TGZUYVRacVBaMkJoTFdiZW1DSmVXSEttWU91MUtRcjRQOUtyblNLVTJtR3dG?=
 =?utf-8?B?czlVWGhoN0o3MmNuVGJnUzV3ZGZEdlpTSjVWckd2d3lQbnJ0R3ZKL0ZuUkYx?=
 =?utf-8?B?N2daQjdHbm1kOUphenc4ZGdISGRwSHlBNEpqZi9HVXB6YzhjeGw2MVJhak94?=
 =?utf-8?B?ZjFXNkExZkFOWjNOL3pqY3dlQWV6M1p5eW9aWWg2WDZpVFd1bmZ5UUtrOFVq?=
 =?utf-8?B?WDJJV3JNRFVHajdEYUdFOVNiL2crTGtSc3NIVkJnSzJYRTd3TGIrNlBOMGFC?=
 =?utf-8?B?SjR4NU5qeDNicDd4YnJoLzNQMU5qdTYzK1B6WFJhUTBmYUNMQWN3OHdXbTRI?=
 =?utf-8?B?Y0c4VDVwTVpjZ0JldCtzL1o0MUI5ZU9wdys5TFQ5RkVwcHA0amJ1YVk0R3JN?=
 =?utf-8?B?UGQ5eHJoNW9nREpqemRRaHF2d3JrOGhkdGdqTWRJQ0oyeW01Q2JpQUFJZnZB?=
 =?utf-8?B?U2NEcEUzV1NJVG16VmN0SitId2VLbGNEWGR4enh6b056RXRvS3NDMlFQeXNW?=
 =?utf-8?B?czNMK0o2KzlCdFRzalFiQ1N1eVFmZXdBemZYWmtBcmxWc09pM3NmaWE2QmJG?=
 =?utf-8?B?ZjBoSEhBU0V3THIvek9GRVRkbHhrM1B2d1h5VWxvaFZXOFN1ODZvRUgzaitJ?=
 =?utf-8?B?MXROQUZock04Um9ZZ09acEo2Zlc2aXVVdCtOZEVkcC95amNzWVlUdz09?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f0b934b-227c-42cd-f010-08de6e0dfe3b
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5156.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 10:19:11.6605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/I7brM0TNlQ3z6hdiTcrxEVjXMGHhRdc6FBwNjRAWLUKYRzVEUFE2fOxQ71qrHwVNcQX93N6n9F44cRMeBzOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7363
X-BESS-ID: 1771323556-103620-7695-106665-1
X-BESS-VER: 2019.1_20260211.2214
X-BESS-Apparent-Source-IP: 40.107.201.99
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVpZGxkBGBlDMIDXZItEkzcLE3C
	Qt1SDRPNXQPC01LcXcNNEw0TLNMFWpNhYAgRhn7UAAAAA=
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.271204 [from 
	cloudscan16-223.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 10:19:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231237

Hi Yoann,

On 2/13/26 19:47, Yoann Congal via lists.openembedded.org wrote:
> 
> Richard Purdie (2):
>    pseudo: Update to 1.9.3 release
>    pseudo: Update to include an openat2 fix
> 

The backport of the pseudo patches to Scarthgap broke the build on 
Ubuntu 20, as it still uses glibc 2.31, so the pseudo-native build fails 
with:

| In file included from pseudo_ports.h:5,
|                  from pseudo.h:164,
|                  from pseudo_wrappers.c:30:
| ports/linux/pseudo_wrappers.c: In function ‘syscall’:
| ports/linux/portdefs.h:59:21: error: ‘__NR_openat2’ undeclared (first 
use in this function); did you mean ‘real_openat2’?
|    59 | #define SYS_openat2 __NR_openat2
|       |                     ^~~~~~~~~~~~

According to poky.conf, ubuntu-20 is still a supported distro to build 
Scarthgap, so I guess this needs to be somehow fixed.

--
Regards,
Javier Viguera
Digi International Inc.



