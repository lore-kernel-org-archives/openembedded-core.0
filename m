Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81DD4CF3961
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 16:48:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11801.1763570908457616954
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 08:48:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bXFG9dpG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34186f8fde=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJC6IXd318537
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 16:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=L4ikhk6u0
	c+7kwr1vLKbIVuraTuN81aqlgOxtK9QgrY=; b=bXFG9dpGebnhVLEsMNI0llFH3
	FFF1bnBc5Oq1ImyuRIHlD56sCk5o15VXTfAej4P3cTZ/64ERxlgIm3rmj322NSqj
	iAf/kmkOiq50YWu7emVr3c27XcLQLw+gJ8cN7D1pGCzv1GMZPfBtd8oUMy9ZJpz8
	p4eAaB7F/Fzla36hXRQS3PocGdrjdCjHtryV4d2YcQkPkJjeGXeYWJ+EwZPjqbhH
	DKasvqxyqAaO6tSPshFR9RT3zu2ncRZgDWtJhZvL+SO+qZLiigjaQ8e8Bo8aelvt
	lZYpreq7K5EcUcl4y8CAtLcmEy/QDRMGxHc/4uxSD1PtXoOIeD+5C2R0yRv3Q==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011060.outbound.protection.outlook.com [52.101.62.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeeqwncu5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 16:48:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qVks3xrXiouNh/DTmWYqw4TDxJA0ZYI/rGlKgXZE3JV0ODDsmRjnlIbxvp3jGdOR2B1wEE1tWQ2MZfLFw3iZnkW0Ytpro43SzU2Q67xT8vdYSNwE//v07ipVzc6R6iESkjeRGTVxuh7DufS//lyjL9T3yPlWbTBDTr2TO0Qw9tJ45/YdpEKf4MiTIxur7sNUpEjYxYwSLAp1QhkpBILgXtyG3CU2XbJehfg8+rjHNluEyotu0D3aicjKLFbFZvaLNjyppb8HAUFrzelJvijFhW9XEoyyHIASWtS4SMKO5fL91h8A7EbrP1QsPHjg9XQ6y4LBDzViBagjDVPO1h4TBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4ikhk6u0c+7kwr1vLKbIVuraTuN81aqlgOxtK9QgrY=;
 b=Fj8jNPc1uY9HxvaQwZCmoM6ft1lfDVzgNa83SEEyk/HJbJohe3olIq5MW2jekQKCczLoHnTc2POz5qX6Nm6WFScvw4zk4mrKxcoHUHlWZuxAE51e59/gv9Ar5kYboBnJ9oIup5e7Xl1N8M21ahOdTUTdVxF0Ni0pzG+zMVBiTMvDx+bJ/4IHuuO+eoaz1UIg+lmdYNFCoq6S/BSUDvVSQdV7W9qyGnqVdgoZLiVXJ9sPqcP4d+iRhmke5guj7yBN0VGCdSykuLRnIj9G6p86smDuOWCnGYw6P+BaHLLk/gqI0z8tPpsTQMQJ8yTnZj7nKXzNttPsVHZR3JIjC7W4zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB6122.namprd11.prod.outlook.com (2603:10b6:208:3ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 16:48:22 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 16:48:22 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, bruce.ashfield@gmail.com,
        Sundeep.Kokkonda@windriver.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH RFC v3 00/11] Enable rust support for linux kernel
Date: Wed, 19 Nov 2025 08:47:52 -0800
Message-ID: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0203.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::28) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA1PR11MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: d2c2e1dd-11a9-4ae9-40fd-08de278b732f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NjdrUjk1Wkdhdks1WlVRTGZtV2prbjV1QnVvU3Z5Vy96NVRJYW5tek9nT1NB?=
 =?utf-8?B?ZWV2SE8rdGcvaEtwOXQ4K2hkNFlwMzMxS3g0cW03OHRVMlJ5N1pnSm5xSjBZ?=
 =?utf-8?B?Tm5Xd3JhTWZGTzl5RzBvcmVZVG5YTnVnUFhDUHZaQldVYVlWOERBZUtrZmVM?=
 =?utf-8?B?Tm9GM3gyUmFMa0RBK0NtWi9aRWdTWXhRUUgrcExUYzJTckNqVlpiWlhJN1BH?=
 =?utf-8?B?OTdaMS8xS2xMRjF6UmJrTFo3Y0VkQktncmRaU3dNNENWekc4cTVMQmkrNjF5?=
 =?utf-8?B?eUJ5TzNsQ0dtUmluVGhHU1JyRWVCcHJod1BmdEZmcFh0S21nWHBJdHFJNnJn?=
 =?utf-8?B?SGt0bVdzRTNqemk1NjBuZ256SVlTdStwY1EzYUErcTg5QWpWbDU1QXJ3UUFP?=
 =?utf-8?B?WGZYZkhKZG4vUFdUVjdXeDlwdDBvK00rR0w5SlBxRElQc3ZHSGRnaUZqTGlU?=
 =?utf-8?B?cklsZ1BaVTBzb1lrc0VOUHZic0l0T3d0WGdncTZXT2FRYVZUU0xxc01sWjYx?=
 =?utf-8?B?elhYL3BGM0JVQ08yUTJjK3U1S0UwZC8wb2czcXlQTDJsVkVnSWV3YzBCa21M?=
 =?utf-8?B?aEpEdCtKYTlSLzR3akVKc1pEc3NRNDhsQlRmeGJpMS81YVRuQlN2L2hIL1BX?=
 =?utf-8?B?a0lNRlVvMU1hdXVhbVFWcGtlQ2Q1V3p0dGhkZDVsOGk5NHplcGg4eDIzRGNh?=
 =?utf-8?B?M1pSZ24yWUl3Wi9DeDBnUi9NcTBSZWFkakVQYm9lZWo5aHpoYnhUYUpBS3dm?=
 =?utf-8?B?MlhEOVRZbDBTM2pNVFZkN3I5SGhhZTU5V0hwM1RIZEY0SEJZQ3hueEc1M2pF?=
 =?utf-8?B?MDdpK3FDUVJIeHFWTWRJZkFOVTNSYnRMcVFVTUt3Qm5QbDkxZk1yUHRmRUVV?=
 =?utf-8?B?eUpLSDI3YUwvMDloS2JsNUc0K1paMGd6ajhNRWFQcVVWNSt2WlRkSjlScENH?=
 =?utf-8?B?YUUzb2tpOUxJOUUxakFqRlNhZ1h2SVF6SE9CQ1pBR21qT3VvYWEvM2NZSmdw?=
 =?utf-8?B?b0lCeXEvYitFK2V0U21vWTRrbVhXQ1lkb1Y2K2dtNFRzQ2IydFhQMHI4d21o?=
 =?utf-8?B?aXB4TkIrK2IzVEFXNDk0UHRpQkNMZko5VlFGeHJMNUtNeU5xQjlnaXdDTEdG?=
 =?utf-8?B?SU9PaFA0eTc1V1lRMXU1ZjA2MHczYW1sRjc4S1p6MzduOUpFWGdJeUNnWFpR?=
 =?utf-8?B?eVlUczF3aXo2VXk1Z0hVRlZWRXV6bXRPMDc2V0NMSHhrTTlNUVg1Wm5EemNk?=
 =?utf-8?B?akRyWUQwS29KT0s0Ujhzd1c1NmxnM2lTd1dHWFNBcko0cVpvd1VoUmJGcWRH?=
 =?utf-8?B?OXdwWjBURGZ0RDVPbjZ4WVZGK2VVcjR6NkEwb3dLcklNWUM4Ky9aeWxqRlBG?=
 =?utf-8?B?cXBrNnNGcU8yZkNGWmQxeUNCdkRONkh2UW9ydlFDbk1FZFlTQ1RJN2ZyYUJa?=
 =?utf-8?B?aVFzdkdEL2I2c01ucGo5Yk55WlI0NXBJK1lUZi9pV3NFbFVKOWt5WjVYWVZm?=
 =?utf-8?B?Y1VKUUw2akR6c2JGUUZiNmZJWVRnRldaSzhjN09nNnBZc1IzK0Y0MEx5Qlpk?=
 =?utf-8?B?SDdwV1EzYmRETGtHL3BZdmV1dmdTdndJSkl5QWxRRm15eXA1TG9SRElLOG9j?=
 =?utf-8?B?WnhoVUYzREpWUWFJRkV1T0JKZVZielQ3UzVDOEhQdzUycGRia21lWitEL2Zw?=
 =?utf-8?B?eURQNXNZUlRWWmlFWVdqQzE0TW00THYvZU9LWEo5U0J4dFQxTTFqeU5sdWJN?=
 =?utf-8?B?RnJ6WDl4dzkwUm1na1VWSnRLVnhRZkt4VDJqK0Z3NmFUdzRKNUozU3lJRXZy?=
 =?utf-8?B?MkpzM3U4aVBZaDVNNWduNmZ3UXFmLzBCbVRzSkR3bzduckVJZkNITDgrM1I1?=
 =?utf-8?B?THVnS1BFS1lxQ1FzWWtmN3ZhYTl6S0pzeklSeVpjbGlFa0JyZjBWdGVBc2hW?=
 =?utf-8?B?OEZZYkJ4U3dRT0dSUzl0YnFBZzRjNGUxT0xXQ0xHNnptUTBWRjljU3hIMERs?=
 =?utf-8?B?bGFFMEVCRHU4cUFKaitkMXpVcjF2SFIyZVFCM1FVQzNNNG5LYjdHOUsyMlhV?=
 =?utf-8?Q?lZradd?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UnoyemhFSms3K2R3bkZpL0xSVFVpUnN5cktnMXJvOFBLaVZqOGZ2RWdxQnhS?=
 =?utf-8?B?ZVM1OXlJT2Z5UEVFbFl4OG9ER3F5VXNyZTU4dU1GWitDTE5WVi9yN2pqMnls?=
 =?utf-8?B?cS9EK05xaytlYlhteDc4ODZ3QW9NRHYwb3djU1ZadUNZMjJubGNIbnBkNnI1?=
 =?utf-8?B?R3BWbXhJOHhLQlR6WWpSK3UrVzB1aFRsL0s0QzEvUXNGdFZDbGU4WGQwcElD?=
 =?utf-8?B?dmd2UVBRV05QWjFvYU9LVjdwOERoWkJtUW56YUE2UlNhc3k4Q1FubkxLaWhj?=
 =?utf-8?B?eWtFZnRpWmhEMkxOOEhvVFpGSnhWV25WTEg1ZkliTndiN2VPclRMWkVBSis3?=
 =?utf-8?B?bThOUW9TeG9mRzN0ejc1ZTdLaVR2b2NDY3l5aHZMMXJGRC93UytEejZEVG1u?=
 =?utf-8?B?eTBCUjNqOEFZYjVzajd4UWFPMTRiK2txcnJVMjJmUmtlU2kvSTJ4VFBZWXpi?=
 =?utf-8?B?YTVmd09qMXZ3R3VoQWdTYXl3eEV3bENHeTZYdEhJbWxPZmxHSW9DWHRKSmg1?=
 =?utf-8?B?Y3RsSm9lRXBYRnRZdUhJTG11UDJpTk13VEYyTncwUGMyRGJZeG5Oa1cvUVdB?=
 =?utf-8?B?NThRUHZEZlAvZk15ZWlwYUg3R3Z2cXZBek9lcVdCVnlpZGYyYWtZaG10c3ZT?=
 =?utf-8?B?VGtoWGdHS2lXQjFpZkt3WTZwcFNnOEVCQXF4eHNRR1BnbHpSaXJtL3cxdHpS?=
 =?utf-8?B?cnhMUEEwNEk2dE10WTQyOVNIZ3ZMTjc0WVRIWnoxak8yeEVXeHAzTHlWeDRl?=
 =?utf-8?B?NGcyRnZ3S0VJeTB1aGtEMFphbFBYWXh0L1I4U0NoVklCVDlGN1FuK2N1YWYr?=
 =?utf-8?B?WEhkbDZYL0R5NjEveDlDbVJNMDJxdDZPMUJMNVk5ZHllWWsySHJFSG9FbDVw?=
 =?utf-8?B?SWJhYWtpbmZXZ2FNeUhkd1Jsby9vc0xsRFU5STNpQ0wrSnFWamRpQkxGaTRw?=
 =?utf-8?B?S3YrQ1ZOT0xxS0pHQ3A4RVhZRHVpNmZVc0FZZXN6ME01bHhXKzByUkJIMUUy?=
 =?utf-8?B?SjR5RStDempQVWU0dDY1aGdDaEZCeExickpoeUFtZlpJYzhrOTZRYmZCS1h6?=
 =?utf-8?B?MmoraURHV1ZsaHV4a3lnYkVycFA2bzU0SW5BK0pLTUZoOXJ3V2t5dHBOcDlX?=
 =?utf-8?B?ME9vK2N4V3NKcm92MGphQWJqMFV0NUJxaE0rZnlpZWdzSEpqNEVpS1lnOVpM?=
 =?utf-8?B?aUFleDZjMzRScmVVbVlWa2VqR0c2UDBieSt3ajNaTUZOM0FvdUNZZzJOYWpF?=
 =?utf-8?B?L0M2VlNnY3ZmVm53V1VsVnZRS3ZmMXpNbGp0bnBlUEswalhzZTNoMExTTjVV?=
 =?utf-8?B?QU1ZRFdPbWk5TnFQUDV1OXVSNVNDSFNwNGdkRlVSVGlZTDFEbjhNVXJubGwv?=
 =?utf-8?B?K3pnYXQwMks0YlBpcFBndks0K2pHdEJZMVlsYlVaeG9KZVdtTTBkek16ckJk?=
 =?utf-8?B?V3psNFQvTDZjRURIV0RzTmNGaHQzT1FBNjZQcU9LMmpLa1h4UTlVTjk5RnIx?=
 =?utf-8?B?VlcrUFlra0VHQmJNNVdhUE9YL3lqWGxqRFM2S3JQNDhkZU96S2IxQkc4U1Uw?=
 =?utf-8?B?T0lYdWFhQ0V4QWtCb05uYUp1bklBU3ZnenhWUUtjeUxuemgvUU1sNWVkWGI5?=
 =?utf-8?B?Y0tUV1VyQ0lNcUhvR0hzRGIrWVpQZFJBMjJBWjFpemdoSC80VU1Id29uam9k?=
 =?utf-8?B?bnZzajZtQ1k2aGVlZHc2SFZuNWw1a1h3NHNVV0ZSd2h4RTZFRlloM1loN0tp?=
 =?utf-8?B?NEhXZEd5MzBkUXlNSTVIOC9XaEFwbWQzZE81dDAyS0NnZGpvZEZWSGI4Z0dv?=
 =?utf-8?B?bEdDWldFa29TUEJ2RDVQYnV1Qjc4dnMvNlE0STE1N0wzMDh6TlZYWVM0MWhj?=
 =?utf-8?B?L2Y3dVFOL0dyOWxFTmhWZys2ZnA2MXBzcE4vMmdNTjNyWHVYQTRwVVczS3dD?=
 =?utf-8?B?QzIrcnhvak54K0NxSEJVWDJWVGN4R2JHL3V4b0VjeTlnL1JiaVRpandBY2lC?=
 =?utf-8?B?QzB3ZGhCTFZRWlJrVEJPVmVnRlE5K0JzdGF4a2YwY0lTT1BiOVZ0Q0lpeFQ0?=
 =?utf-8?B?UENjNWdtdk9FQmU5Vi9UYWN4cjY4c0VkeGRqMzJjZUhCdnl2Njh0Z21qZE03?=
 =?utf-8?B?RGROY0RwOFhSdldSL0Nra0lxWmZtb2Y5VGVEcXNSTmtoZzBTaGVWRjI3dnk2?=
 =?utf-8?Q?mHFhH8v81YIVOlFJsRoS6is=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c2e1dd-11a9-4ae9-40fd-08de278b732f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 16:48:22.0783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WaJsBEDdtKx199yItb6IiT+eAdbYY5AtluRzQh98IQxlUnlZ/+9AHUDTXu9XXvPNZNv5saOhJJHtGjxlHuBMzlB9o9bxuc5KkbV4zk0xsNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6122
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEzMSBTYWx0ZWRfX2z4zCvI3vVeD
 iyq9OEtNQjuyVJ1hd8IiBsKfiyNE2RC2dXmNb/oNlnV4X2XABG6LKFhkmU2uZw5niiZ3Gzsk2YO
 y6GsIY9llS+WTtOiJy3ySXKQL2dStVrXlxlZ2FPds/gTzb3AJ/2F1uKZj9TbLGULSiEvv6abbW5
 I/vHBM+N3z+isnw/qwBC82VlC8wb8IQnwFdySLCUe5sbsvRL/eTXmZbwnlavnjiyTKp7CiZx+7n
 Rj3yxHD3Dk6YZZmUzt9SBNe24uFHIlFo49caE8dxKYMwSvyCyIb0OzPEugUb3e5QtvQ5R6Vcg5B
 2xhxT3N1HvCL/L4X9j96y8g29wEMYm7I3Gj+8QKh2Y/YVWGSeJQGtblQaDrhkfCe2MtfnEOWdtk
 cNpWzJaqNZSp1wErip9dmpI3K0WG9g==
X-Proofpoint-GUID: _CyC_H_FcmHeFjAg4f9P98ab66_s8tOC
X-Authority-Analysis: v=2.4 cv=OuxCCi/t c=1 sm=1 tr=0 ts=691df4db cx=c_pps
 a=VmiGRewH7mEIsprpaxNw0Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=HzRlP5ouLR9e6J-S4LYA:9
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: hpBkWSuByjEcBVTTnKWfoNAERri0IqOy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_05,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 16:48:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226560

From: Harish Sadineni <Harish.Sadineni@windriver.com>

v3:
- Addressed v2 review feedback regarding adding dependencies to a variable and assigning them using (?=).
- Moved staging of Rust libraries for the Linux-Yocto 'make rustavailable' step from linux-yocto.inc
  to kernel-yocto.bbclass.
- Made copying of the Rust library directory into tmp/work-shared optional and performed only when
  building rust-native when rust-kernel is present in DISTRO_FEATURES.
- Split rust.cfg into three separate config fragments: rust.cfg, rust-samples.cfg, and rust-debug.cfg.
- Disabled ccache for Linux-Yocto builds when rust-kernel is present in DISTRO_FEATURES
- Added an oe-selftest case for the Linux Rust sample


Summary of changes:

- Patch 1: Extend 'bindgen-cli' to support 'nativesdk', allowing it to be available in the SDK environment.
- Patch 2: Add required dependencies ('clang-native', 'rust-native', 'bindgen-cli-native') to the kernel to support Rust binding generation.
- Patch 3: Install the Rust standard library source ('library/') into `work-shared` and which will be later copied to
           linux-yocto recipe-sysroot-native.
- Patch 4: Added 'rust-kernel' to DISTRO_FEATURES_FILTER_NATIVE and DISTRO_FEATURES_FILTER_NATIVESDK, the 'rust-kernel' feature automatically
           propagates from target DISTRO_FEATURES to native/nativesdk builds
- Patch 5: Stage the Rust sources into `recipe-sysroot-native` for kernel build compatibility, making them visible during native builds.
- Patch 6: Update `kernel-yocto.bbclass` to invoke `make rustavailable` during 'do_kernel_configme', ensuring Rust readiness.
- Patch 7: Add kernel configuration support for Rust (via 'rust.cfg' and 'rust.scc'), enabling the Rust build options in kernel config.
- Patch 8: Fixed buildpaths errors when rust is enabled for kernel by appending --remap-path-prefix to RUST_DEBUG_REMAP
- Patch 9: Disabling ccache when rust-kernel is enabled for linux-yocto.
- Patch 10: Copy Rust kernel sources into kernel-devsrc build directory which will be required while running 'make prepare' in sdk.
- Patch 11: Added an oe-selftest case for the Linux Rust sample.

Benchmark test-result for x86-64:

For bitbake core-image-minimal
+-------------------------------+------------+-----------+-----------+-----------+
| DISTRO_FEATURES               |   real     |   user    |    sys    |  FS usage |
+-------------------------------+------------+-----------+-----------+-----------+
| rust-kernel (enabled)         | 46m1.720s  | 0m28.864s | 0m3.696s  |   58 GB   |
| rust-kernel (disabled)        | 30m1.053s  | 0m20.091s | 0m2.748s  |   33 GB   |
+-------------------------------+------------+-----------+-----------+-----------+

The increased in time & fs usage is due to kernel rust dependencies in
linux-yocto. These will get solved by using pre-built binaries from
meta-rust-bin (WIP).

WIP:

- I am  working on try to use make use of prebuilt binaries for rust and cargo using meta-rust-bin layer which is having compatability issues
  with oe-core master branch.
- rust-out-of-tree kernel module recipe and selftest is in progress (by Yoann Congal)

Test results:
- tested with oe-selftest case for the Linux Rust sample for  x86_64 and arm64.
- tested with rust-out-of-tree kernel module in sdk for x86_64 and arm64.

If everthing is fine, Can we send this as patch?.

Harish Sadineni (9):
  bindgen-cli: extend BBCLASSEXTEND to include nativesdk
  linux-yocto: add clang-native,rust-native and bindgen-cli-native to
    DEPENDS
  rust: install Rust library sources for 'make rustavailable' support
  bitbake.conf: Include "rust-kernel" in native/nativesdk feature
    filters
  kernel-yocto: stage rustlib sources for linux-yocto 'make
    rustavailable' support
  kernel-yocto: add rust support via "make rustavailable" in
    do_kernel_configme
  linux-yocto: enable Rust support in kernel configuration
  kernel-yocto: Fix for buildpaths errors when rust is enabled for
    kernel
  kernel-devsrc: copying rust-kernel soucre to $kerneldir/build

Yoann Congal (2):
  kernel-yocto.bbclass: Disable ccache when rust-kernel is enabled
  selftest/cases/runtime_test: Add test for Linux Rust sample

 meta/classes-recipe/kernel-yocto.bbclass      | 28 +++++++++++++++++++
 meta/conf/bitbake.conf                        |  4 +--
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 24 ++++++++++++++++
 .../bindgen-cli/bindgen-cli_0.72.1.bb         |  2 +-
 meta/recipes-devtools/rust/rust_1.90.0.bb     | 17 +++++++++++
 .../recipes-kernel/linux/files/rust-debug.cfg |  1 +
 .../recipes-kernel/linux/files/rust-debug.scc |  3 ++
 .../linux/files/rust-samples.cfg              |  4 +++
 .../linux/files/rust-samples.scc              |  3 ++
 meta/recipes-kernel/linux/files/rust.cfg      |  3 ++
 meta/recipes-kernel/linux/files/rust.scc      |  3 ++
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  4 +++
 meta/recipes-kernel/linux/linux-yocto.inc     |  2 ++
 meta/recipes-kernel/linux/linux-yocto_6.16.bb |  2 ++
 meta/recipes-kernel/linux/linux-yocto_6.17.bb |  2 ++
 15 files changed, 99 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/files/rust-debug.cfg
 create mode 100644 meta/recipes-kernel/linux/files/rust-debug.scc
 create mode 100644 meta/recipes-kernel/linux/files/rust-samples.cfg
 create mode 100644 meta/recipes-kernel/linux/files/rust-samples.scc
 create mode 100644 meta/recipes-kernel/linux/files/rust.cfg
 create mode 100644 meta/recipes-kernel/linux/files/rust.scc

-- 
2.49.0


