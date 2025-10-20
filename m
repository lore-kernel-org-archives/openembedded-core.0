Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD3ACCD193
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 04:37:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10988.1760935033665801391
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Oct 2025 21:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=e3KjmIJR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=238810fc8b=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59K4IV6W1993732
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 04:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=XW3i1T8u4+YiUZrQaM5Kl6DYPlz7YT9oyHOH9x7gW4U=; b=e3KjmIJRABAc
	aSMQaHIo30Di7N32flTzeU+Wy4vl2A86z87gFuF4XRfokLDrAP/1CoLqHO08NELU
	vMzIXILnU0aUUYLE+fbU1u1VA+SpdDMPUwsqhili8DlGKaIxLcfB6w7+y12sUibg
	9bCVtZG3+Q/mmDJkqtM66S/e1AwMIpiWKYMrtJwev+naczbq+fKshohDztbyj0kl
	mSPO5n6oL9ZVybiUH5FVQSr5DgPC+plguGDkstWz4rkKsqJkQLO3B+3nixuyo8Vk
	WpunXAa4NMpxS68wN1yY596jemUtkoxBoHkmws5+olAyOi4/68IUqmOYL6oY8qZo
	g6MJgD7o/A==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010046.outbound.protection.outlook.com [52.101.46.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49v03y1gmk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Oct 2025 04:37:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M16JeD5ZLKPty7mu9sVOHQZLXM4eQp8ndWW89TpUpe89DlFEtqw5uVGP9NziEmLKNMv4OseMiiiIe6tbNxsHGMCWn6f9bZVD0F+nGso3mdwTTbFP1RL0KOmBJ3znMItrPV+FGXAztdmid35QNcULZLAOSxfPOBFsYoJsOzSFBIhlzPACkIJiaSKz9yG/OsfafY+Y6TZflKNAS7mm+thHndXgoqZzYr+tKKmAojNpcRgQLQ9uRfpuA/3mg4H7DCPSrNbjgmWU2sEnzrChCXv2pPh8It8fMoG43uZ7YLVyf8w9GJanTKE+4Leeh9+LP9jUGtxrtNvFpFbopK2JAAXhkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XW3i1T8u4+YiUZrQaM5Kl6DYPlz7YT9oyHOH9x7gW4U=;
 b=ZasRC6F8e06IiRYNpnsOcGOZT+rKgDvGpyoQKZgOtXfxBzkY9ux2jZXb6bKy6nWdg+0qqOhLoieONz5NmMANU5RHlcAE6SSVweA9dM2SyNmtKbgex44KhfrZzcXDt1iNyDLYHaHiHTdjuDLVxKbpXj+ajG3iufLn/jNix/fFMoqejqekTNjKNMjZml6VSLkl+I1Q0kZBjUcjjXPzDLvKI9NHiE7jowzdPnn/OTNgMB2CZ7OnMXn1XvMCMUK/lNPPCFWYAzDn3GrqvXAh7cLJgtAvyB1ki4u+HUoiEtO/AY9hOaMQeWt8NPvp+rtzdatOhmL+bQyp9innOhNKr0EHbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by CH3PR11MB7179.namprd11.prod.outlook.com (2603:10b6:610:142::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 04:37:08 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%7]) with mapi id 15.20.9228.009; Mon, 20 Oct 2025
 04:37:08 +0000
Message-ID: <113b6b91-1b28-4297-943a-40953bddfd8e@windriver.com>
Date: Mon, 20 Oct 2025 12:37:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH V3 2/2] systemd: upgrade from 257.8 to 258
To: mathieu.dubois-briand@bootlin.com,
        openembedded-core@lists.openembedded.org
References: <20251016084700.1537381-1-Qi.Chen@windriver.com>
 <20251016084700.1537381-2-Qi.Chen@windriver.com>
 <DDKQEKP5R8RA.185ZCAGQ6EA07@bootlin.com>
 <DDLHVDCXIV53.3EI69FW87CCB8@bootlin.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <DDLHVDCXIV53.3EI69FW87CCB8@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::12) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|CH3PR11MB7179:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a7574ec-b35d-4a68-efe1-08de0f9253e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|4022899009|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?alFzSjEzUUdhampMWGJWaFlicFlXRGVxUnEycmxzaFBkd2pNTDZRelBobytq?=
 =?utf-8?B?VE5UcnQ0bWFNZ2x2TDFIQUZNeFpieFV5Z25qdU9iaFIrOVV6QW50bmlOaDNp?=
 =?utf-8?B?K3F6cGdVSDlOQlBqeWYvY1BjcXdYdXltOC92Qk04RUhZRnBwVEFkR29mREJZ?=
 =?utf-8?B?OWsvQ3RHUDRwZHZIMkRVS1dDbVl2SmZnUm1pU3hnY01nSFI4eVBmU0hqc2RZ?=
 =?utf-8?B?dEJYWDhITjdiRGJsRFlKaTJTVGw2T0laU3VqTTlUYS9HZnQvTTZYZFo5MmtW?=
 =?utf-8?B?TytpT3plUFJybjdmb0xNbkRsbituOXpQMlNnL1lFNDJpRGZPVXViakV6TE1i?=
 =?utf-8?B?eVdRSnU3dTN1ZS93a0dWMDA1VDBGajlQVVNCSE8xc1NzVEhVZzJYZDdlYy80?=
 =?utf-8?B?SVgvUVllTUxMYTdRRVROTTAwZENVQWVEZ2pvYVp2MTZWNUoyMWxURFpaYzFR?=
 =?utf-8?B?MTg3cUg3b2x2Ri83Q2FkM0liRnZQaXN2S2lHbWhpLytveUhzSFIrS1NlOVlF?=
 =?utf-8?B?QzgzNklPK2U4SThSeGprU24rcU0yenVnbERGYXNqQXE0dWxxN29sTkx3dzZB?=
 =?utf-8?B?THhqVGdoL1A1WTVCbmZTNWtlRlgwR0tIcmo3MFBkNUt4am9kc2hNYzdHT2ts?=
 =?utf-8?B?dVFWZEFic1dJdTY1YWFkTXZ0V3l2VDZQVGp3aTZuTjI5cWVuemtRVjIyTWVK?=
 =?utf-8?B?R3VqRkZJMUtXRmppZzNnMVd6VDFqT3dkR0ptWndaUHFqNG5nMVViTGxyZ0FZ?=
 =?utf-8?B?bWoyWVJKZ0JMS3B0VDltcks4Zkd5ODgxYUYyNkZHWXJ0K003NHA3aEo5M1V4?=
 =?utf-8?B?cFVSckppNGtQM2E1azdPOG96OFBtZ0R3akxFUW4zbHBKYVlTRExMZkMybS9o?=
 =?utf-8?B?TjFtMjZYQXJSa2RhSnJtM3ROZ2dXOVVsNkZmWDNkbGNha3B4WUpXaTVoclcw?=
 =?utf-8?B?amJrWW84ZmNWM3ZNTkx5WWkzMVdVTStRNEM2VFdDWXpwRlJsZFkrMU5XV2dT?=
 =?utf-8?B?czFGZWlzRWsvRER1ZE5zNXAybkdBMjBGMnBHSEFlWDU3UDRBeER1aEFPT1pW?=
 =?utf-8?B?WXR4bW9YUVJKT1dSaWlYaHVDUFliSVRDQlUzaFJRUFE0d2FiUFBndXM0U0dG?=
 =?utf-8?B?UDJiby8rSkJ6YVMybi9vYkNDMUNzZ1BoTFFGanRnWEVROUNOd3JqWllmc1RI?=
 =?utf-8?B?T1ZMUm5PSnd2ZXBHT3B0ZXlTWmdLSzYzWWdFeGhmeXB6WXVrckUvS3M0a1dT?=
 =?utf-8?B?ek11TVRFWjhXOVFaTlhmZ3ZQQjBmUHB1K2xPcU5YWlRtZlBzbmtLOE9BOERP?=
 =?utf-8?B?OStiTDc5NjZsS0MxdklzY3k3ell3RVVqVlk3WmNwUVIxbmcybDdLNzdQNEJK?=
 =?utf-8?B?WkxBakJsaVNDUzBkckRJYjFqWWVsSmk3a0NCdE5CSFVJb2JsTkNwYmpyWFBL?=
 =?utf-8?B?QmV1Nzlld0dIRXE5WGtONzZRVlROQTFDbWVuaDRZZ25IODdvbzVPS1o1Z21v?=
 =?utf-8?B?OXRjSlgvSkxKME1wY253a3B0MGkyeWw5c3RyejNscjJDUEV1QzBJZGZVQk0y?=
 =?utf-8?B?c2pQamtwTVg4MTNDdVREZ2lTdFVvakZHNFRGanUyM0dmVGM2UHd4a0xZRVpu?=
 =?utf-8?B?dzhzSEx2TVJnWVJQMmxpNUREaFMwOXdwLzVPU3JLS1RNNXJMRjdHNWdmcnVh?=
 =?utf-8?B?Ky9GQkpvdmlBdWw4c3ZmK0dLaEVKYlRSS1hFK2N4NmNhN0xzREFQQVR2bHNv?=
 =?utf-8?B?ZkFvakp0UzI0QWlJT01BUTFhOHZzNjdUN3NBWGdUc2l0L0Z1OXF3R1Uzc1FH?=
 =?utf-8?B?c3o2UXNhODdsY0pMOXI3R1dmY09SalZZUzBlYnY3ZzNEeEdKZmhBZlNPYjBl?=
 =?utf-8?B?dWhFY3EzUFF4eGNNL241TmJ0NkI2YVcrV1k4Rys3eWhEbFE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dmtPYWtCTWo5dVd1cUR5ZVloOHhuNFJYSXBocHNpaDlVVHVPU3lsNkttV2NY?=
 =?utf-8?B?Q1MvSFVteGZLWkdtT1hucm15bGExeGExNm5XUlRFdFd0MTZORkJVQjhCMjdC?=
 =?utf-8?B?UzAwbUxTVjZCVytJTG56ZzRmdmIyOGQrcmxFYW91NWlKS080N3hqZFR1NHNC?=
 =?utf-8?B?ck9HL0UyT2NyK0hlUTBsMXFPc1ZKVUNFSmhLVUR1QktBV1VQQ0daZ2NuWFlK?=
 =?utf-8?B?dVNkVGhCYXhja1N5cHVQT1BycjI2WXo0QzVOQTdSamUyelhOVTk0ZDRKZy9O?=
 =?utf-8?B?VkwrOWovUE9mU0doMHNkazhQc1hPZlNuYXY1Q0phTGhESGdTQit5R1hmNFhi?=
 =?utf-8?B?ZW5NYkdNd3k5bktPci9BeThTZm44ZFZja01qWFk0Q1JlS1p2dVh0MFFKWmQ3?=
 =?utf-8?B?eXF5ekZWSEdMMXN0Y2FrRWdoNmtnZk5yUkhGQWVDTTFpc3F3N0Z1a01MRmxm?=
 =?utf-8?B?Tm12WlpLVnlrWGp5Nm5BcTJRMGFPcW9RZU9CL3poK2krei8zRVloWWN5c3NQ?=
 =?utf-8?B?bXNiS1hUUHpVcXZEVFlHaWtpalpkVkY1amp5cFVaNnFrbVhIeUxsRC9zTXBS?=
 =?utf-8?B?ZEswcVhBRUJuTVFacTVtU3VCeDgzczZjRVo0YVhLeUlhYStyeTZ1MWEzUEw5?=
 =?utf-8?B?SERTTVFDNjl5MkNQK094U1ZFalhtTkw3d0FCM21kbTZZSmphUTZ4Vm1iZ3lp?=
 =?utf-8?B?eURIOGtBSkY4clZmQzZSMFVRYXBhT3h6SmhPazQvd2tiQkZjanpXSXp6bTBU?=
 =?utf-8?B?R1Q2Zk5JVlp5KzV4bEpjaE5lWHdmcGJ2bXRVbmp0a3Y1ZkhROEJnM1NRaTlq?=
 =?utf-8?B?ek14RzF6VEM5L3pqUHpPb3BMVDFVQkFSdnd2cytoTkZEQkwxaks2enFXUUlS?=
 =?utf-8?B?dkxxZjdSaWJKMkVBK21sdFlhdiswZmpFTTEvQjc2dXFqMkhyRUh0R1JtbDNm?=
 =?utf-8?B?VUw4QkEyWXNxYWVtZ0F2TUJxaWI2VFBuTjJSSlM3bmFBbERuUi95dFVGVUJY?=
 =?utf-8?B?ek4wcGdjTE42S3ZLMkROemVUOElLTStsNVJUd1RRdmVrQTJSSVFocjNENFNr?=
 =?utf-8?B?Ykkra3hRN1FQdEFHMVpoRHZvYVg5M3F2YU55ZGRTc0JZNjArTHNtaXNKZlNK?=
 =?utf-8?B?b2JuTzVCaG01ckFuTEJ4b2RHSGZsVHR4akZDOVhKc2NrdHlpRlFUT1JUZXEv?=
 =?utf-8?B?RHhzNVVZejRSb2piRkhrUWowMzdrY0kySkZXY2syaHgrV3gyejMyVnhvSG1u?=
 =?utf-8?B?UVRGbXRwcUh4djJmYUpYbElsMTlKd3psaHVocDNJVzgyOTFLcUVacWYxbEph?=
 =?utf-8?B?WHhwd21CTjRRZHZWZy9PZGRNUURUY3pRWUJ6TWt1QlYyblYyLzRRd1Q2N3dU?=
 =?utf-8?B?K1Z6dVg1VGEyVlFla09rYUNNYzk2OTE4K3AyMFpVQWJtWnM5bXhqTTB0eEhF?=
 =?utf-8?B?MzBXdlAxZWY4eEV0UStxcXJxZENROFRqTDY5ck1RRVAvVWRQL2pzdmpsbFdU?=
 =?utf-8?B?cS9IaXg4RU1abC96aE45RERqWTlqb3RnRTZUcnhGVmd4ZlRCM0doMkxQbGJl?=
 =?utf-8?B?RFJNU0llTTZnQzRXRm5OZDRDMjdZQzJ6REdmelJqWVI3VWZQb2dKbkdpVmtp?=
 =?utf-8?B?bmY2RVV4cGpKbWs1RXpSVVk3QWd3alNNY3dxc2Y5QmJmVGN2WVpCT2k4Tkhz?=
 =?utf-8?B?Uzl4WHY3QmU4TEFlWDdneXBORHdhMUhBU2N0MGRneHRhQjh5Q2N6QS9iSFNG?=
 =?utf-8?B?b2h4R1EzZ3ljMk1NVHhIMk15dzJCc2h2aW9NWTF5MkN1WDhsUm1XenBmMkZ3?=
 =?utf-8?B?RXNiQlpudWdMWjdKOUhyajhUVEozRncwcXFreFY5MzFseGFIMTVFTjhjeDJT?=
 =?utf-8?B?NGV5Y3JTME5JZTA4THRTbzI3a1l3ZFk0RTVPV3huaTdrR2k1QkgzWjRVSWEy?=
 =?utf-8?B?MXhVUG5HT0QxOU5FbHU2Y3IvcTduUVlPdFlTVEVHME1TTENCcjBVNTFiNTFY?=
 =?utf-8?B?TXJKalJiaTM2Rmx6cG9tY25KamJRTmZVZHlma3M2QUVxclh6R0RlTGw4OGRm?=
 =?utf-8?B?NWpiYTdOZXRuLzlnb3g1ejRjSGdLY1BCdU40QVE4Z01peDNVcHRVUFpqVmQ2?=
 =?utf-8?Q?DoFpBR2jRjN5jefAdVr1gntg4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a7574ec-b35d-4a68-efe1-08de0f9253e2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 04:37:08.1881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l/4A0qIBCB+u7DNRKRQgaUojSWPpXEXEShpLkd8I4oUB/7j+Gsxxo/+WVPFyxZnzrWpg1UlwHA6ZIqkYA07zkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7179
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: akQLA8tJ6UOrUkG6DEOklMb8UaOJgoBp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDAzNCBTYWx0ZWRfX7FOeUHT/xO6l
 ptMZ5F+pHj/m8YPGO1iIeflNhnSw3nKSIMsOaL9x5j1INIgctrbVIzi7qWQZ4IUG0edSj/Knp7y
 Tc1l7uV3/WXEupxDPO1ttT6by6z1cAqiwKksHS3HjNbyNOC/ytPq3fC//YdlL05BppeZxEjicwo
 YUAj4fCIFl06e6EcvpxIe2z3QpsKONczSqAQmUFH4GEPWLPQ3mlLrTkxP2j6dsOqqJyq9nCcWCH
 9a7WoG/9hmq/sKxwU5/AIGfaV3ska1Bw75XLC1Qqq694TpGJRevkBMjmbWBVw9Pr7nslu2z0joZ
 tRFQqr73tAYlG/tdgpO6nfXrgxP4W/dV826KIVYi37cziHylIcJHhhRUO/DPmDk7fNgi86iFZBP
 0Tr3i6UvN2UBTDHfhoeaocEQu6EeQQ==
X-Proofpoint-ORIG-GUID: bKK4tw7r5M7Qt49fwUfHWD5osPwY1lJQ
X-Authority-Analysis: v=2.4 cv=Uolu9uwB c=1 sm=1 tr=0 ts=68f5bc78 cx=c_pps
 a=BcPl/o76WFXIZ3b3OvynCQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=FsBkGTZwUshad-CP3YAA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510200034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 04:37:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225093

On 10/18/25 21:49, Mathieu Dubois-Briand via lists.openembedded.org wrote:
> On Fri Oct 17, 2025 at 6:18 PM CEST, Mathieu Dubois-Briand wrote:
>> On Thu Oct 16, 2025 at 10:47 AM CEST, Chen Qi via lists.openembedded.org wrote:
>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>
>>> 258 Release Changes:
>>> https://github.com/systemd/systemd/releases/tag/v258
>>>
>>> The 'runlevel', 'initctl', 'telinit' related contents are removed
>>> because they are offically removed in v258.
>>>
>>> Disable tests explicitly. This is because we're not installing any
>>> tests. There's no point building them out. And this puts extra burden
>>> on making things compile for musl.
>>>
>>> gcrypt and gnutls PACKAGECONFIGs are removed as "OpenSSL is now the only
>>> supported cryptography backend for systemd-resolved and systemd-importd."
>>>
>>> musl changes:
>>> 1. This version has big changes in musl patches. The goal is to
>>>     help maintenance. I want patches to be more easily applied
>>>     to new versions. The count of files modified by musl specific
>>>     patches decreased from 113 (v257) to 34 (v258).
>>> 2. All patches are re-evaluated.
>>>     This version of systemd introduces big changes in header
>>>     files and other places. So the previous musl patches are
>>>     re-evaluated one by one. Those that are dropped are considered not
>>>     needed. A few new ones are added. There are some notable ones.
>>>     0012-do-not-disable-buffer-in-writing-files.patch is dropped because
>>>     there is not runtime error.
>>>     0016-Fix-the-segfault-for-glob-related-codes-and-define-d.patch is
>>>     added because this version of systemd uses strv_free to free gl_pathv
>>>     instead of relying on globfree provided by libc.
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>> Hi Chen,
>>
>> Thanks for the new version. Still, we get some errors with post install
>> scripts:
>>
>> ERROR: core-image-sato-1.0-r0 do_rootfs: Postinstall scriptlets of ['bluez5', 'ofono', 'connman', 'xserver-nodm-init', 'avahi-daemon', 'rpcbind', 'run-postinsts'] have failed. If the intention is to defer them to first boot,
>> then please place them into pkg_postinst_ontarget:${PN} ().
>> Deferring to first boot via 'exit 1' is no longer supported.
>> Details of the failure are in /srv/pokybuild/yocto-worker/qa-extras2/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/temp/log.do_rootfs.
>> ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/qa-extras2/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/temp/log.do_rootfs.2882514
>> NOTE: recipe core-image-sato-1.0-r0: task do_rootfs: Failed
>> ERROR: Task (/srv/pokybuild/yocto-worker/qa-extras2/build/layers/openembedded-core/meta/recipes-sato/images/core-image-sato.bb:do_rootfs) failed with exit code '1'
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/26/builds/2590
>>
>> Can you have a look at these, please?
>>
>> Thanks,
>> Mathieu
> Sorry, another issue that I've just identified, during image tests:
>
> Traceback (most recent call last):
>    File "/srv/pokybuild/yocto-worker/qemuarm-alt/build/layers/openembedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>      return func(*args, **kwargs)
>             ^^^^^^^^^^^^^^^^^^^^^
>    File "/srv/pokybuild/yocto-worker/qemuarm-alt/build/layers/openembedded-core/meta/lib/oeqa/runtime/cases/parselogs.py", line 185, in test_parselogs
>      self.assertEqual(errcount, 0, msg=self.msg)
> AssertionError: 1 != 0 : Log: /srv/pokybuild/yocto-worker/qemuarm-alt/build/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato/1.0/target_logs/Xorg.0.log
> -----------------------
> Central error: [    27.402] failed to find screen to remove
> ***********************
> [    26.897] (**) Option "Device" "/dev/input/event1"
> [    26.955] (II) event1  - QEMU QEMU USB Keyboard: is tagged by udev as: Keyboard
> [    26.956] (II) event1  - QEMU QEMU USB Keyboard: device is a keyboard
> [    26.959] (II) event1  - QEMU QEMU USB Keyboard: device removed
> [    26.991] (**) Option "config_info" "udev:/sys/devices/platform/3f000000.pcie/pci0000:00/0000:00:02.0/usb1/1-2/1-2:1.0/0003:0627:0001.0002/input/input1/event1"
> [    26.991] (II) XINPUT: Adding extended input device "QEMU QEMU USB Keyboard" (type: KEYBOARD, id 7)
> [    27.049] (II) event1  - QEMU QEMU USB Keyboard: is tagged by udev as: Keyboard
> [    27.051] (II) event1  - QEMU QEMU USB Keyboard: device is a keyboard
> [    27.401] (II) config/udev: removing GPU device /sys/devices/platform/3f000000.pcie/pci0000:00/0000:00:03.0/drm/card0 /dev/dri/card0
> [    27.402] xf86: remove device 0 /sys/devices/platform/3f000000.pcie/pci0000:00/0000:00:03.0/drm/card0
> [    27.402] failed to find screen to remove
> [    27.428] (II) config/udev: removing device QEMU QEMU USB Keyboard
> [    27.431] (II) event1  - QEMU QEMU USB Keyboard: device removed
> [    27.472] (II) UnloadModule: "libinput"
> [    27.508] (II) config/udev: Adding input device QEMU QEMU USB Keyboard (/dev/input/event1)
> [    27.509] (**) QEMU QEMU USB Keyboard: Applying InputClass "libinput keyboard catchall"
> [    27.509] (II) Using input driver 'libinput' for 'QEMU QEMU USB Keyboard'
> [    27.509] (**) QEMU QEMU USB Keyboard: always reports core events
> [    27.509] (**) Option "Device" "/dev/input/event1"
> [    27.567] (II) event1  - QEMU QEMU USB Keyboard: is tagged by udev as: Keyboard
> [    27.568] (II) event1  - QEMU QEMU USB Keyboard: device is a keyboard
>
> ***********************
> 1 errors found in logs.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/2588
>
> Thanks,
> Mathieu

Got it. I'll fix these two errors in V4.

Regards,
Qi

>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225075): https://lists.openembedded.org/g/openembedded-core/message/225075
> Mute This Topic: https://lists.openembedded.org/mt/115785954/3618072
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


