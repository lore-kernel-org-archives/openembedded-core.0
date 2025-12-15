Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC70ED5B863
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 18:17:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1295.1765822651446897321
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 10:17:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=BwwQAmBi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4444e3ab80=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BF3e2Hj865295
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 10:17:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=vbNtsUlaPBZPmC9flhEvSd
	8j/JyIBK8O4AxZeBXCyvo=; b=BwwQAmBicqaLWb22LMYpHcBTgFdAxGTZbw75Pi
	sPr3f4YJvmB+W300eGejF05FxPr6FixpBZ4Q2kqf8CnN0QZvckxiJKuGwwW5cjHc
	1utcxA+tiVHSoIj61QcP1o89Cvm7RhS0fFak6A1rzpwPanyM3CriAGvASdUyFsKQ
	HgptTMo/3XRbf1UQozVM1YFNF1RO0a1bjcjQWPfC9wFzEW3exdnWfDTtvKnFoUUx
	q6FQKHKK2xtyP8+lLTFj7Hfm9Lv3FikpaXhTy8snUUS9zwTOJ087EY6NsOwoMj3D
	6xKscdLinrU0KFmq4cRr1MKVhpEwk+1eOt+a5gT3Ft+OuT6A==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012028.outbound.protection.outlook.com [40.107.200.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b14a5j015-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 10:17:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7D7EhbOlu59IZpn/yVCZF4BIc0HqvOWIuCO3xoQn3a/xO83mf87XA/2QDo/YhL7z4hRRvb52hOXNnd0L3Z7VmJj09dNOTGFxo6nhdZjf40K02w/8ZShGitlre2ABbWw1xpE3s7q60gdH1xL64blL6Kk/tjHVsEL+fMuOMkV9lTA+fX9TkuBxBs6iX8g6JsmFtdUdhUh6XE4gN70r1WCpMaZlHowTstFxL37O0ncVnIpXI8gkfrvvA9YIfvbvX33SyKR7WgqakPIcQhOkmGuzTiyTQt9qjMvahBstoABy3MgFI+1BTZ252nCfrlMaGe0ERtePEfjjZB31JVQ9A7/Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbNtsUlaPBZPmC9flhEvSd8j/JyIBK8O4AxZeBXCyvo=;
 b=T83d45s81nAHfCKyRm63W7jIx+a0qzYrl8NZvUicQgko1npCkRU0CkSE6J6910in7nSyuEvp3dzqNRV0DjedzdYVYl6p6jt3f3exqr89UGIVAnrJwTWb8HX4+m7bg9iMqFwy7idUUK25AsyjE1OdsqfMzGrRjiXzHf78Zjpbf/5/RtuZBroldvuLLLigr9aM4n+rJyRWPbWqbcJHOq1wDij1Q+I3AizVcDjsnU9gZGhrPVXBHXWqLLqR6d/haOd3iEMbXZaXeMe+Ns4t3cLuMCQ6dlUzfFJpkFG1oVGUA5czxjEKjBcS0Vixy8PNZ6AuW2tGxSUQezBf0N5+jLc/gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CO1PR11MB4995.namprd11.prod.outlook.com (2603:10b6:303:9f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 18:17:28 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 18:17:27 +0000
Content-Type: multipart/alternative;
 boundary="------------cyJHQArLtER2Yk0Dhs35qSfR"
Message-ID: <57dd38bf-653d-4b74-8de4-d05f4d2b9797@windriver.com>
Date: Mon, 15 Dec 2025 13:17:24 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] fitimage: Add support for
 UBOOT_MKIMAGE_EXTRA_OPTS
To: kavinaya@qti.qualcomm.com, openembedded-core@lists.openembedded.org,
        Adrian Freihofer <adrian.freihofer@gmail.com>
References: <20251210110443.3230272-1-kavinaya@qti.qualcomm.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
Cc: reatmon@ti.com, benjamin.missey@non.se.com
In-Reply-To: <20251210110443.3230272-1-kavinaya@qti.qualcomm.com>
X-ClientProxiedBy: SJ0PR13CA0026.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::31) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CO1PR11MB4995:EE_
X-MS-Office365-Filtering-Correlation-Id: df74b27e-319c-4d2e-ebef-08de3c063412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|4022899009|8096899003|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ejlxS2M1V0MyRGdLRXEvYnl6RXV0OExNNTU4cElsT2h0d1kwQ00xQlJYcjY3?=
 =?utf-8?B?eVY2OXJlU090SmdSVjFGK3hRcElhM3hNaTVoZFB4RExhR3VWSUIrU3h3ODl4?=
 =?utf-8?B?QU5xQ3FQbjJ2SU1NNkxHV082d1FJTnFsL0pyNHd1YUJyQTVjUmRJbVp3a2tQ?=
 =?utf-8?B?YnNzYTA3cHN2c3d0MnlCNWRmWGk0VlJYUldZVEN6Njh0TmJ3dVhVYlREalRl?=
 =?utf-8?B?R1RQSHhTVmRESG8xMlM3Z1V6NnJ6ck5JTHM1dzJNd2F4MVFDZURZQXJ4cWdW?=
 =?utf-8?B?QWI2Y1pmcUVLZXM1RFcrOExibk9WYnRLUUNkTzgzWXRzUHZDbXZJNWFYQ0py?=
 =?utf-8?B?NFdhWWJPSEVPTkxiTHZ5c2xOeXJ4K1g5M1oxNDdaa3hScHI3ZkFUOUt1c1Q0?=
 =?utf-8?B?OUJIUjJrcmEyWGNkOGpLTkZGNG9zaG1Na0FwNzBVb3Q4a2FBdDN3bk1pcXl4?=
 =?utf-8?B?RnVMWWZ0dHBxWHFVbFA5UmtSNHE5eE4xUDFFNGUzN1ZOSmdLc3U1YmZhUTg2?=
 =?utf-8?B?Mk5pWU00NUI4ZzlxRENxN283MUMrY05vNVVYalpnMFBmYzBJdzI4WVFPd3Fn?=
 =?utf-8?B?UUMwOVRJeW0ydHUwN0N6emNycUx4M0FwbkM2OEwybDBlSHNvMmJGQ3JXSVJh?=
 =?utf-8?B?WEp1V1NvQ3VJMmVkMUFYQ2hHRmUvb283ODVpdE41TFJ3TWVUMGlmenkraFBy?=
 =?utf-8?B?Zk1KbW94WldOOFVmUmswaHBJMEJHaEIyYjlvSjU5MVo5STNKKzhITXpSdXA0?=
 =?utf-8?B?cFpvcWVqUk91QVpmbFpac1hWWFdHL2tPNEtGb0RPNVBIaHRjTk5YR1FVelVR?=
 =?utf-8?B?TmZOVXd0dUNIU3M3dzA4NFkxRmF4OHVjVXhjd1BaV2dsaXBEbm45NFg4dUN6?=
 =?utf-8?B?MlNlOUl3YXZ0S2EydWRoWCt0OHVKRDY3WTd5dHROVXBYUjFpODFzRzg2cUdR?=
 =?utf-8?B?L01pVjhvaDhZMjNXTkZ6TjRNWmpmYlRnN3dCTExiQlM3Q1ZQTnN5eGNTMkVH?=
 =?utf-8?B?MElYa3JkQUQvY0tpalBvd1hhcHVLUUlvRVNkMThuQTk2QnpneWJkMnJaM2pI?=
 =?utf-8?B?a0x1M29EYmpyWnYyREhOYzJUZTRPU1VJQXBCZFcwYThidTJhcTg5cUtxZjJK?=
 =?utf-8?B?d0VERGgwNm95YXUza1JBR3VuTDhGY2FIMzJMYnIrVGJFSlF5WHJUOERlbWQr?=
 =?utf-8?B?WnB1NmpZVkx5c0dJRXlTSy9laGg2MkZIc0l6eWR1YWJ2RGZ0d2JtaWk3QTBj?=
 =?utf-8?B?SkhIeEI3TG56U2pTL2NGUnJSbm9hMjVpd3plRXFLb3VLYU1RVm5IcGdMU216?=
 =?utf-8?B?WGR2OCt3UHBYWmNaOHZlR0NyVEN4RzVCeHFyVElyU3huRCtiWjVwaXlWQnRQ?=
 =?utf-8?B?aUg3R3ZiM3BJd01DakFKWWNabTFGN0F3REJsdm5GNCtyZ3Ewd0I3L3h1R1dh?=
 =?utf-8?B?bjlFbDlUZ1g0RWFyclVIZW1qUzZuU0psbVZmQTRBaWFjOWNSVS9IZlhPQkwz?=
 =?utf-8?B?MVhuUWoyYThKNktiR256WDU0WjBNQ2pTUHZyaUwwL2FHSmtvNStHRkNEZWhH?=
 =?utf-8?B?R2x1aVgxWTh5clBKdDRhL0d2RVJxd1I4R1hiNGl3OW9iMSt0ZEg2Y0RXRXRx?=
 =?utf-8?B?cVhrdDdIOTFNb2x1aThyVUdXQXhDNFBtS1p4TGNaRFN1M0NpZ1VwYmRDenRm?=
 =?utf-8?B?TUp2UndzS3owQXNqaFZNS3BqMTB0NXBTY2l2Wks0djcrOUgzY0IzbFlzNElK?=
 =?utf-8?B?dklTSWUxOE9hcHd6Wk51NTFnRW9VWFB5ZWNnc3RUSEtTQTZCVy9vaWZDNFBB?=
 =?utf-8?B?MytpUzdrbkVMSkxWaUY1ZnNwV0MrYUxMcW4vWVdEVmNPVVJwMmZwK2lKRHdB?=
 =?utf-8?B?TE83M250TFlxcjAxZXdGRnBLbERpVTRURkI3NFhrTlhKUUVpaG5UOUh3M1FL?=
 =?utf-8?B?YlFPRlNJN2ZRNm45RUlXTVJVU3F6UEFHTWkyY1VVc0ZUR1ovdnVrQnBwTmU0?=
 =?utf-8?B?dUh2QjZKZWlnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009)(8096899003)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S1JUV0V6MnF6NnMxQWsvUFRRVUs2N29kUG42dnJ1Z0R2V1VVRDJtL3MwellK?=
 =?utf-8?B?cFJTeVN3Z2ZTejA2OUVQODh4WmpxZXF4U0srSjcrVm9tZUlCc256aTdlVjZm?=
 =?utf-8?B?OW45blQ0Y25oWTM2ajVPSm5mYzFmQ3c5ZmRFc1RmamZnSVZ5cXJCWmN6UWpB?=
 =?utf-8?B?bTZxUTBIUUxLOUwwRi9Xdms5REFIdGlUMCtNeHdYb0luc2dOQk1MdjNHcGRG?=
 =?utf-8?B?cXdDY0loMnZmemE4QkMzS0ZQK1U5bkhmMHVrM014SjFDdE1LaTFpS3paOWNp?=
 =?utf-8?B?Wkt6dEtOYVRCSFJReXZFb25GOGhBeXJvSEVkM1F4MDdaSGo4U0xGVCtta2xY?=
 =?utf-8?B?djZYRlpYYjgzK2dreUhDR0VEdGR6bE9EY2xKcHlJZy9JaXNRaHQ0Y2Erd3Nl?=
 =?utf-8?B?SzZlWi9tRm1PeGwxcGRtUmp1d20vYTdzU0dHUk51M2x1aEkrNy8vUW16UUxy?=
 =?utf-8?B?NlEzRG5iYlY5U1JWU3Q4UkRFYlQ5UjRVMmUxU3hFMC9pUlc2QnFncHQ1dEMz?=
 =?utf-8?B?czdMZCs3QU5wbXExRFZFZStRRTZxK09yRUtqRGxsSzh4M0VGMkRGNVZlN3VZ?=
 =?utf-8?B?c2hCMjVqdWNkbU1IRG5PSGIwNzRrR0ZvTXNxR3NJMXpOLzNvWmxXL0NGSVRt?=
 =?utf-8?B?aUxZVEhLcnZKZVFGK2ZyL09Bb0ZOczRXRWR0UVRPam0yMFloTHZXY1FjeDNQ?=
 =?utf-8?B?bnQyRXJ4Uk1GakF3aHVXcjFaeEhyZ0t3dEJCREY0MWZvc1ZYSTIrRExRNkIw?=
 =?utf-8?B?b1pUYnhRcm9hN2pxTEo2RDhLRnd4TWUwbEtFRGh6V2plL1lQbW5hK3ZSNHJP?=
 =?utf-8?B?Z3VTenkyU1FqOHVLenN1bjBpKzNQVnpKUnRSZlNaWGl3bUxjSFNPQjNPcUFC?=
 =?utf-8?B?b2FuV2gyS3FuSlVsYW5oQ3lpcnRqRkU3cHYxUHdFOWZaOGVPaWdLYWpJWU1S?=
 =?utf-8?B?NkkyMlJrTWJEc0szVUxmTDJudktiSzEyQ2RQVGpkcjZvL3lieGU5WHBWRDUx?=
 =?utf-8?B?S1JZM0ZsTmVmbkl1b3ZvRDZ0cHAxQm1xTmhtNVlMQngyd2xzSEE4NEVIdVUx?=
 =?utf-8?B?TVEySkhiNU85WFV6VkJjUnI3T1RjMlppdUNnTUtodUZ2QjFHWFF6ZkJsRUhJ?=
 =?utf-8?B?R3loaitDMEFWdGVhT2k3STJkZldweE1PY3paZ1JGNmRYUDYxY3VGZGJFZk5j?=
 =?utf-8?B?N21hallOVG5UY3l6bEhSeEF0VG55S3BQZEZxUkFWemZFNGpiZ2I5Y1BVcTVK?=
 =?utf-8?B?RjlieUtocFJBTEZ0b3E0dDBuYWpmUERBOEpoQlp3UjRyWDFPelVzWnlKaEEz?=
 =?utf-8?B?K0pNRHlIY1ZQRzZBb1Vtb0YwRmdGUGt2eFBiM0h6YnpnUDNKQmw5ZGhrY0sr?=
 =?utf-8?B?aXp3NU01cGVtZCtwNUhVdnlINlhLd09LRWR6TFZOOU92SmJEcnpJdUxiMnd3?=
 =?utf-8?B?eG5KcmtwSHZVbDBzY1lZamFJeXh4ZDlFOXZaN21NNXhrdklYeERVQ0lmOEFB?=
 =?utf-8?B?SjFkNEhTVXpWVGFXSy8rU2ZXTHBiMkRrYVYvWEx2eUZ1eWJLRENhc2V2TDE5?=
 =?utf-8?B?T3h6K1dLSE43dTQwTXU2NUFyVm53MVovK2c0S3VlZDhhb3VRaVVscml0MkU2?=
 =?utf-8?B?NStDUUlnZWY5aVJ5cDgrTUx5T2kvYXYyQ2x0ZVovS2dvaHNHMXhZOGtSS0lH?=
 =?utf-8?B?cFBVNUtNUkpqM2RoWnFtalhIVlJmUmRCVkpzdG1WMm4zTGhqeDVJM0orTkE0?=
 =?utf-8?B?YnllTFNwRHFQUTAwMlA0K0dPZjBrRDFabHBEZnoyVVV3Znp4WG9QRUFPcmMw?=
 =?utf-8?B?WitSL2VWbzgrc3ZXVHR1NE1YTzRlNXhYaTBTZVA1ZnZUWE5DZFVvMWlQY1FH?=
 =?utf-8?B?Q25CUEpGUXNVVThKc1YzMTVxYm5xeFBKMXlITHZadWlQVjMzWGNCOEZCWUd4?=
 =?utf-8?B?V0UwSk5aYkRUT1hTR25wSU5DRFFiUW5oQlhNOUVydFBjVHRhazB6dEJPcnBi?=
 =?utf-8?B?VEdFM2Q1T05FVDRObUZUYVlFcFVXcjJQdmNVVEN1bjFvOERXZ082WGU4VmZB?=
 =?utf-8?B?MGZJN0cxL2g3V0xkaktndER5N3FVdWFwQWVyWE5PVmxmWmxJL085MS9SY3VL?=
 =?utf-8?B?NEovK2RXYk5HU3JnSGw2UTA5ZlJ1SDRRU2ZOTkVwVHNqdjA2eWROWThjUlU4?=
 =?utf-8?B?Qmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df74b27e-319c-4d2e-ebef-08de3c063412
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 18:17:27.6451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B8+un0HPLS+s1RSHKNFsikXnI0CwR8uHJSqFnur+pBYsgtcARhBaWfUmwNCMrXpDeX3IR9x7EAaeuMU0jWcmx+SLbUDUrloGi9iJs6OUPY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4995
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 9s2BLVMK-I1NRERCndM0LIfimKtQLREF
X-Authority-Analysis: v=2.4 cv=bs5BxUai c=1 sm=1 tr=0 ts=694050ba cx=c_pps
 a=7whtcbPCeBOLW6TxF+pv5A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=t7CeM3EgAAAA:8 a=ZTzaO1AOIgWP0hCjnJUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=vKk-oOVNXzgKa_AZo4cA:9
 a=AjlkD8WrwA0vq_B5:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE1OSBTYWx0ZWRfX9xyEsjVuApuW
 B+nxWWJEqukVFzOxbsb26h9GJIVE2oNtNMNhMXpllVIWH9UJV4LtYoH5Gro9M8kfdn7pN3qTBIe
 by1OYsnb1/gqyqulMswSxMBQZyX7TVi+89rTAMMiPkwcWjO72S5kYgEHLXv7qzfeCCUaNo3BWQE
 OrnuLOmqm4qqYM9vCqblAPkPvQn5ZYbHzREY4HKZXkXYK72mWCP3bSuvML4a+/1ZzONzHCuQnNW
 EfPYhqtaPqq8wghMuc9XqhZNbDR48nvX0gQP7QPxTmzTvnWJ7aF2DihBuSdvvjDnGRTzgryXodP
 W3OH+7F2ZhNDtaFDzDKtm8zWNnEEAE4jnBuqqU2sN3QcL44IMOdFGSasgvQSxBtbxVWnDd+P5lZ
 34Rh8e648qyx0LKKBMeYVB39AabXhA==
X-Proofpoint-GUID: tSpy7T1ppoWfZOvrEVJNAeGSYcVeminK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_04,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150159
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 18:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227751

--------------cyJHQArLtER2Yk0Dhs35qSfR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BF3e2Hj865295


Kavinaya, Adrian,=C2=A0=C2=A0 and others who have touched:
 =C2=A0=C2=A0 meta/classes-recipe/kernel-fit-image.bbclass
in the last=C2=A0 ~ year.

This needs more review than we had time for in the YP patch review=20
meeting today.

I think the concern was that there had been some independent=20
improvements to fitimage
and that perhaps no one was looking at the overall design.

This may be a red herring but for example, is there overlap with:
 =C2=A0=C2=A0 meta/classes/kernel-fitimage.bbclass
 =C2=A0=C2=A0 # Options for the device tree compiler passed to mkimage '-=
D' feature:
 =C2=A0=C2=A0 UBOOT_MKIMAGE_DTCOPTS =3D "-I dts -O dtb -p 2000"

If you think this is a sensible, maintainable change, do say so and=20
explain your point of view.

Please don't shoot the messenger, as I don't work with u-boot or=20
fitImage myself !


Thanks,

../Randy


On 2025-12-10 6:04 a.m., Kavinaya S via lists.openembedded.org wrote:
> Currently, mkimage options in U-Boot recipes are fixed, which limits
> flexibility for platforms that require additional mkimage arguments.
> Introduce UBOOT_MKIMAGE_EXTRA_OPTS to allow passing extra options to
> mkimage during image generation.
>
> This is a generic need because different SoCs and boot configurations
> often require mkimage flags beyond the defaults. For example:
> - `-E` enables external data in FIT images, which is essential for
>    modular boot setups, secure boot workflows, and reducing image size.
> - `-B 8` enforces 8-byte alignment, ensuring compatibility with boot
>    ROM requirements, improving memory access efficiency, and supporting
>    predictable offsets for multi-component FIT images.
>
> By exposing this variable, we provide a clean and extensible mechanism
> for developers to meet hardware-specific and security requirements
> without hardcoding options in recipes.
>
> Example:
>
> UBOOT_MKIMAGE_EXTRA_OPTS =3D "-B 8 -E"
> will result in the mkimage command being invoked as:
> `mkimage -B 8 -E -f fitImage.its fitImage.itb`
>
> Signed-off-by: Kavinaya S<kavinaya@qti.qualcomm.com>
> ---
>   meta/classes-recipe/kernel-fit-image.bbclass | 1 +
>   meta/conf/image-fitimage.conf                | 3 +++
>   meta/lib/oe/fitimage.py                      | 3 +++
>   3 files changed, 7 insertions(+)
>
> diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classe=
s-recipe/kernel-fit-image.bbclass
> index fd0d21ceee..5456311f00 100644
> --- a/meta/classes-recipe/kernel-fit-image.bbclass
> +++ b/meta/classes-recipe/kernel-fit-image.bbclass
> @@ -56,6 +56,7 @@ python do_compile() {
>           d.getVar('HOST_PREFIX'), d.getVar('UBOOT_ARCH'),  d.getVar("F=
IT_CONF_PREFIX"),
>           oe.types.boolean(d.getVar('FIT_KERNEL_SIGN_ENABLE')), d.getVa=
r("FIT_KERNEL_SIGN_KEYDIR"),
>           d.getVar("UBOOT_MKIMAGE"), d.getVar("UBOOT_MKIMAGE_DTCOPTS"),
> +        d.getVar('UBOOT_MKIMAGE_EXTRA_OPTS'),
>           d.getVar("UBOOT_MKIMAGE_SIGN"), d.getVar("UBOOT_MKIMAGE_SIGN_=
ARGS"),
>           d.getVar('FIT_HASH_ALG'), d.getVar('FIT_SIGN_ALG'), d.getVar(=
'FIT_PAD_ALG'),
>           d.getVar('FIT_KERNEL_SIGN_KEYNAME'),
> diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.c=
onf
> index 090ee148f4..e470adad5c 100644
> --- a/meta/conf/image-fitimage.conf
> +++ b/meta/conf/image-fitimage.conf
> @@ -47,6 +47,9 @@ FIT_LINUX_BIN ?=3D "linux.bin"
>   # Allow user to select the default DTB for FIT image when multiple dt=
b's exists.
>   FIT_CONF_DEFAULT_DTB ?=3D ""
>  =20
> +# Additional mkimage options for FIT image creation
> +UBOOT_MKIMAGE_EXTRA_OPTS ?=3D ""
> +
>   # length of address in number of <u32> cells
>   # ex: 1 32bits address, 2 64bits address
>   FIT_ADDRESS_CELLS ?=3D "1"
> diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
> index f303799155..15a36310e0 100644
> --- a/meta/lib/oe/fitimage.py
> +++ b/meta/lib/oe/fitimage.py
> @@ -156,6 +156,7 @@ class ItsNodeRootKernel(ItsNode):
>       def __init__(self, description, address_cells, host_prefix, arch,=
 conf_prefix,
>                    sign_enable=3DFalse, sign_keydir=3DNone,
>                    mkimage=3DNone, mkimage_dtcopts=3DNone,
> +                 mkimage_extra_opts=3DNone,
>                    mkimage_sign=3DNone, mkimage_sign_args=3DNone,
>                    hash_algo=3DNone, sign_algo=3DNone, pad_algo=3DNone,
>                    sign_keyname_conf=3DNone,
> @@ -177,6 +178,7 @@ class ItsNodeRootKernel(ItsNode):
>           self._sign_keydir =3D sign_keydir
>           self._mkimage =3D mkimage
>           self._mkimage_dtcopts =3D mkimage_dtcopts
> +        self._mkimage_extra_opts =3D shlex.split(mkimage_extra_opts)
>           self._mkimage_sign =3D mkimage_sign
>           self._mkimage_sign_args =3D mkimage_sign_args
>           self._hash_algo =3D hash_algo
> @@ -483,6 +485,7 @@ class ItsNodeRootKernel(ItsNode):
>       def run_mkimage_assemble(self, itsfile, fitfile):
>           cmd =3D [
>               self._mkimage,
> +            *self._mkimage_extra_opts,
>               '-f', itsfile,
>               fitfile
>           ]
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#227471):https://lists.openembedded.org/g/openembedd=
ed-core/message/227471
> Mute This Topic:https://lists.openembedded.org/mt/116710036/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------cyJHQArLtER2Yk0Dhs35qSfR
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Kavinaya, Adrian,&nbsp;&nbsp; and others who have
      touched:<br>
      &nbsp;&nbsp; meta/classes-recipe/kernel-fit-image.bbclass<br>
      in the last&nbsp; ~ year.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">This needs more review than we had time
      for in the YP patch review meeting today.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">I think the concern was that there had
      been some independent improvements to fitimage<br>
      and that perhaps no one was looking at the overall design.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">This may be a red herring but for
      example, is there overlap with:<br>
      &nbsp;&nbsp; meta/classes/kernel-fitimage.bbclass<br>
      &nbsp;&nbsp; # Options for the device tree compiler passed to mkimage '-D'
      feature:<br>
      &nbsp;&nbsp; UBOOT_MKIMAGE_DTCOPTS = &quot;-I dts -O dtb -p 2000&quot;<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">
      <div class="moz-cite-prefix">If you think this is a sensible,
        maintainable change, do say so and explain your point of view.<br>
      </div>
      <div class="moz-cite-prefix"><br>
      </div>
    </div>
    <div class="moz-cite-prefix">Please don't shoot the messenger, as I
      don't work with u-boot or fitImage myself !<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <br>
    <div class="moz-cite-prefix">Thanks,</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">../Randy</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2025-12-10 6:04 a.m., Kavinaya S via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251210110443.3230272-1-kavinaya@qti.qualcomm.com">
      <pre wrap="" class="moz-quote-pre">Currently, mkimage options in U-Boot recipes are fixed, which limits
flexibility for platforms that require additional mkimage arguments.
Introduce UBOOT_MKIMAGE_EXTRA_OPTS to allow passing extra options to
mkimage during image generation.

This is a generic need because different SoCs and boot configurations
often require mkimage flags beyond the defaults. For example:
- `-E` enables external data in FIT images, which is essential for
  modular boot setups, secure boot workflows, and reducing image size.
- `-B 8` enforces 8-byte alignment, ensuring compatibility with boot
  ROM requirements, improving memory access efficiency, and supporting
  predictable offsets for multi-component FIT images.

By exposing this variable, we provide a clean and extensible mechanism
for developers to meet hardware-specific and security requirements
without hardcoding options in recipes.

Example:

UBOOT_MKIMAGE_EXTRA_OPTS = &quot;-B 8 -E&quot;
will result in the mkimage command being invoked as:
`mkimage -B 8 -E -f fitImage.its fitImage.itb`

Signed-off-by: Kavinaya S <a class="moz-txt-link-rfc2396E" href="mailto:kavinaya@qti.qualcomm.com">&lt;kavinaya@qti.qualcomm.com&gt;</a>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 1 +
 meta/conf/image-fitimage.conf                | 3 +++
 meta/lib/oe/fitimage.py                      | 3 +++
 3 files changed, 7 insertions(+)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index fd0d21ceee..5456311f00 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -56,6 +56,7 @@ python do_compile() {
         d.getVar('HOST_PREFIX'), d.getVar('UBOOT_ARCH'),  d.getVar(&quot;FIT_CONF_PREFIX&quot;),
         oe.types.boolean(d.getVar('FIT_KERNEL_SIGN_ENABLE')), d.getVar(&quot;FIT_KERNEL_SIGN_KEYDIR&quot;),
         d.getVar(&quot;UBOOT_MKIMAGE&quot;), d.getVar(&quot;UBOOT_MKIMAGE_DTCOPTS&quot;),
+        d.getVar('UBOOT_MKIMAGE_EXTRA_OPTS'),
         d.getVar(&quot;UBOOT_MKIMAGE_SIGN&quot;), d.getVar(&quot;UBOOT_MKIMAGE_SIGN_ARGS&quot;),
         d.getVar('FIT_HASH_ALG'), d.getVar('FIT_SIGN_ALG'), d.getVar('FIT_PAD_ALG'),
         d.getVar('FIT_KERNEL_SIGN_KEYNAME'),
diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
index 090ee148f4..e470adad5c 100644
--- a/meta/conf/image-fitimage.conf
+++ b/meta/conf/image-fitimage.conf
@@ -47,6 +47,9 @@ FIT_LINUX_BIN ?= &quot;linux.bin&quot;
 # Allow user to select the default DTB for FIT image when multiple dtb's exists.
 FIT_CONF_DEFAULT_DTB ?= &quot;&quot;
 
+# Additional mkimage options for FIT image creation
+UBOOT_MKIMAGE_EXTRA_OPTS ?= &quot;&quot;
+
 # length of address in number of &lt;u32&gt; cells
 # ex: 1 32bits address, 2 64bits address
 FIT_ADDRESS_CELLS ?= &quot;1&quot;
diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index f303799155..15a36310e0 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -156,6 +156,7 @@ class ItsNodeRootKernel(ItsNode):
     def __init__(self, description, address_cells, host_prefix, arch, conf_prefix,
                  sign_enable=False, sign_keydir=None,
                  mkimage=None, mkimage_dtcopts=None,
+                 mkimage_extra_opts=None,
                  mkimage_sign=None, mkimage_sign_args=None,
                  hash_algo=None, sign_algo=None, pad_algo=None,
                  sign_keyname_conf=None,
@@ -177,6 +178,7 @@ class ItsNodeRootKernel(ItsNode):
         self._sign_keydir = sign_keydir
         self._mkimage = mkimage
         self._mkimage_dtcopts = mkimage_dtcopts
+        self._mkimage_extra_opts = shlex.split(mkimage_extra_opts)
         self._mkimage_sign = mkimage_sign
         self._mkimage_sign_args = mkimage_sign_args
         self._hash_algo = hash_algo
@@ -483,6 +485,7 @@ class ItsNodeRootKernel(ItsNode):
     def run_mkimage_assemble(self, itsfile, fitfile):
         cmd = [
             self._mkimage,
+            *self._mkimage_extra_opts,
             '-f', itsfile,
             fitfile
         ]
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#227471): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/227471">https://lists.openembedded.org/g/openembedded-core/message/227471</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/116710036/3616765">https://lists.openembedded.org/mt/116710036/3616765</a>
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

--------------cyJHQArLtER2Yk0Dhs35qSfR--

