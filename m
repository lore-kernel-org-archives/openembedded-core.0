Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D33E6CA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 11:45:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18735.1756381550491111381
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 04:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=JGpXh9qh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1335d894ee=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57SA2asI3682229
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 04:45:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:message-id:mime-version:subject:to;
	 s=PPS06212021; bh=aJa4dBMCo2qzyt9ebl2FBzSzCRUAOzgXLpWcItzgAoM=; b=
	JGpXh9qheGl46qd0xC89rbYqfHKJpcaA3GMhXCuKHX3XTXhqVxSBkMwPfcgR5u6Q
	qK6Ilf+UM3KL9Nx+9UwZSa8heKTpo3V1f3tkqj92m5djccdrh6au8SOTmN3LE7eQ
	pBhA2jdXHdXUtxswnqGMRbAfmwmSyDOcl07y8K6GRxTbhIAIj9DI/XtlEPgLtsrh
	GsdwJDgS+dCsPw+pAA9PiEwx0SkIyGo3tgFdoYhiSJ+rThAWrmEq7rtB/on5vQ5s
	Ej1Kst9uT1Cv5YpXdyyU4hHHDOaVaXfrjylHBRXDXiSF0zIf1s3/pc9KCyPTQg75
	uUJB0hHLeTmEsL6+Co3kPA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q8x25ns1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 04:45:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMfjLdF93QB7bVi2h/eH3EsTHA/0myuIp+SoHj1MpRmGIK1P9A34H8qbGR4yl0EtDusW3t7jO9zLojqCyhCPAm+hf/lxhyO0h+MFs8GhkgsF/m4uj1n9u1umKjsKsp5fPGTJZ7e3BcbLEZfLg/HPLXeBy28nBYAFySw16I710f1z6VfxALShzLerlKcECW+E51o8qt4TFxH+gm/FVHdXEScZvMITH5tHM7IEj4Vo0nPSlYwZmWNDg2qhAoNZzD9L2WXc44b+v3ZeVvAaKsHxA+o//XC/9boCdTPJnF/CFxK2IP34j1M52Ig1wltgZf1BJBv+KuIxxUyIMGJ5JW+zkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJa4dBMCo2qzyt9ebl2FBzSzCRUAOzgXLpWcItzgAoM=;
 b=aDCUbjKXTtH6SdiLnU3o1oIOtxY7bXCv5JdR73UBsKQR38Z3tbDw3MkRIli8LMsrK8FRJ/ma6vHNDvrp+N9JGvorSX4y+SWi1x0UO5ZLtWRyq4bOD/O0Z02HhiWTYr1GA+eTeRajrOAZGLYzuh5QuuFnSagyK/JDIZf1cekb6f7hb1g1mSQA7dqjJI0nCw2ERQ8NbsaQIv+ayEZ277heVieRWqKwrwp22j/pd3yHdxueOyef3VL940N4p+f99FDJctxMRTesmZgprmfv+vS6GEHN84GBpyi6y+P1N4PqExQX3eBMFetXXXcWvC1m6H/P7KJknQ5+ANHV8VWbgaVEPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH0PR11MB4773.namprd11.prod.outlook.com (2603:10b6:510:33::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 11:45:43 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%7]) with mapi id 15.20.9052.013; Thu, 28 Aug 2025
 11:45:43 +0000
Content-Type: multipart/alternative;
 boundary="------------MEaddEcrTNY0WbZ9cR32RIQO"
Message-ID: <29f1bfef-97ac-44bb-b2de-63661a38e814@windriver.com>
Date: Thu, 28 Aug 2025 17:15:36 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "Kokkonda, Sundeep" <sundeep.kokkonda@windriver.com>,
        "Dora, Sunil Kumar" <sunilkumar.dora@windriver.com>,
        Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
Subject: Drop rust-llvm and use clang instead
X-ClientProxiedBy: MA0PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::16) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH0PR11MB4773:EE_
X-MS-Office365-Filtering-Correlation-Id: 51962432-d178-40eb-413b-08dde6286b63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SDBVeFZXM2dRVE4zdG00SFVmdmM5bm56eHpqeFMwdWZFSEpGK3FYdk9DTUtI?=
 =?utf-8?B?TDNRWW5JcG1kbTBCbmdzODNwQXVRUTJLNWJCcjAwb2ErQlZWa1FEaFdabGFG?=
 =?utf-8?B?Uk12aWJ1STg3QktucHphcGhkc0RsbGlyQ2p2eSs4MXNtdXZ2QU9kclRqc1dG?=
 =?utf-8?B?Nm80K3B4ZmNzaThWQjJBWmVGWGI0SUNPQkgrRlpKSmFSSjZObTlEVCtWbSsv?=
 =?utf-8?B?eDI5WlAyYVJpeVZiQUhwVWhoNHVYd3o4VmlpQ2NWT2ljMSszNTRoV3ZHaVpC?=
 =?utf-8?B?NHdQMmxnNDB2WGxMa2w5aXdkRTlyYlpxd3VoUWwrMk9HUWFBMk04VGFxeUQ0?=
 =?utf-8?B?N2x4dkNrVkVhT2lScm5jODhlY0pFUSttV0J5TW45NWNGdWRSZExSdFpSbVgx?=
 =?utf-8?B?a0JoS0d5eW5IZWJLZjI5UmpiRFVXZ0xLb0NjUHNGcGVyOVF2TlRVYks5MllJ?=
 =?utf-8?B?eVgrYUhtUDAwdk8zVTd2MWxSSjQ3RzExVjF0YmNUc0hZQW9QOEhuSERJbnFR?=
 =?utf-8?B?K1ozd3hiVmRoZlh6aFNzSEdLa2FYS3hVdXdPYzd1ZU5QcS96TFlONkZiTUlk?=
 =?utf-8?B?MFBEbVQrdnRaOWtKZ0tETkVsTkJScS81UmNzdmwyRzl1Tk1DeWs3RWxsV2ZE?=
 =?utf-8?B?cnk5a3BLalpHMVF0Z3IycGRkVkt3dmlEa2tiaG80VXp2WjFoazNFTHhWc1lh?=
 =?utf-8?B?WFZQQWpmc3BheHNCQzFwUTVZZWhPNUFYVjFnMXEzT01nallhc3FYTkFMNlg3?=
 =?utf-8?B?ZVBIYXduVzd2eGoyS2dGVnlPeDRLL2V6dENDeUFlSXg4ZGhBcjRPWVN6ZU9D?=
 =?utf-8?B?RHNVdm5XTjZZamFraWNSWi9Za2dEK1pIbVUwWnJIOXROMEowMVpCUjdDZEFC?=
 =?utf-8?B?T0xWWjhBNlE2Mk43d0t0R1hYSEwxQWlCVlpORDhUSUlHVlRBdVN4bzQ4WDZq?=
 =?utf-8?B?QkhwNjQxNHRjaXRCdnZwTGFYbFVKb3hpdC81Yi9sY1o4OXJ0V21wVVphS0NE?=
 =?utf-8?B?R1BJdEp0aklEYmFkclpwQ3BsZVFEcGZnaG5YTXh0aTRTWnlsb0RZWUtKbDFq?=
 =?utf-8?B?V3J5c2dsOUswZ1NIekJMQmJES3ZpZzcwUk1tL2NiTWhsMlNYcXBFTlZKUGFC?=
 =?utf-8?B?dXh6QjJQUDJHcGtidnpmTXlvckNIaCtnamowNjlzUlNScWlpZEFxRjFpRzFS?=
 =?utf-8?B?c2psenV6Qy9ya0FrUHdlS2ZLMUpRWVpMaEZtZVZUU3ZJUGtjemxYZlhVeXZv?=
 =?utf-8?B?MCtXWkFmZ0Q5aWtORUFldzdhQ0lQM25HSkNLdzlWZWZDbUtMa29RL3VoRzRz?=
 =?utf-8?B?ME9rRnBrcFJpaHJabHlYVmQxVUpQVUo2R1pMNjZwdkZNc2ZxTTlzUE9Nb0lr?=
 =?utf-8?B?REVkL0RhZnRkTFd2QlB6TGJodERjaHJHRkhRU3p2bW4xNzBjTFRhVEFVeFlm?=
 =?utf-8?B?UndEZldjQnNmaGkzK08xL1JkRk5UeFdXZjgzRFlPd2YxenJwM3A2eTh1RkNh?=
 =?utf-8?B?OVN4RmtTVmtiQ1lyNjdIMzRQWUg0UnpwQk9mQ3pVNXZXK3YrZEdIK0N2U2Fj?=
 =?utf-8?B?MFZZekQzT256YXJlYzRrZWEzbmZrZlpBNnlTMVN5anV3cTVTbDlYU0FEaith?=
 =?utf-8?B?S3NFWlJkc0dxWEsvYlc3aWVkdXVMeW5aanlTYTRONjVOTHYvdDhyWUtzc2lT?=
 =?utf-8?B?SHpiYkNsdTljNjdSakJOaE8zYmVUUkp0SkJJN25zRVJyeEg5SlppeE5QMGsz?=
 =?utf-8?B?U2VXd1UzOXZSa0t6cEd4aVJmMStVaXVRcXVxODF5QzdzS3hyeUlXMUx1LzFv?=
 =?utf-8?Q?4zNshk4WAt/CEFallc+ewYoXu07EQevD7GiyY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TndMSWdKNURqYlQ3cHdvQWVDbGM2MXE1UWh1MzVjM2JYU0xObW8wbHVVUzlm?=
 =?utf-8?B?ZFFUcmhTL01ndCtHeHVJQWNWalRXMUVMKzdsdEw0STY1R25BRTdyVWNTdHh0?=
 =?utf-8?B?bmlBdnJRbk1CdGZaOTZDb002VzJmMFl6OCtDVEtUVHEwVEpKVGtXamN4SHRu?=
 =?utf-8?B?OHdacmw0dmpMZ2p6Qm9BZWJsNnQvZnVNTkNkRVJmYlhXVUNRQi8raytVdUp2?=
 =?utf-8?B?ZUFaVHZuSUxBcC9lNUxHeTZ1MFNQREhTWHVDeTlGb01DcU1CT2h4U3g0bWZm?=
 =?utf-8?B?dlNqSktsTDVNVmVqY2lCZkZSNGNha2xvWHcwUkpiMndmdUNaZmVQbG0xbzJz?=
 =?utf-8?B?dUZBM09VNWZXVzc1dlk5RCtBbnpLQWF2QWlBVGozVE1JR0ZuejY5aG9qRGFZ?=
 =?utf-8?B?dGdmZTVLMzArbmkwYXBRejlnOFBqWUdFVzR6T3l2MWUyUy9COWhkTUxIdzBR?=
 =?utf-8?B?cEMzdUllajRHK3Qzd0lXWkJaaXpoejI4ZVJxUHJxZ1JlK2JYZFRlcjBFb1oz?=
 =?utf-8?B?STI3TEFhakRMZFl4YnlEcHVwYVVaLzhqUnBuN2V5WFExMXRaVTh0M2ZmTFRx?=
 =?utf-8?B?YmFoSy93bkcvNS9INHNxQXhiYXQ1Z0JTdExiQnpoU0h4aE5sK29KMGRRVWhk?=
 =?utf-8?B?dlluQUFKVXBUL0kwSnhGRldkb09jL0ZId0V6SnFzZGxiVWdEOFRBSC9YMHMv?=
 =?utf-8?B?eGh3a3QzQjJlZVhUd0tsSXN0dUJYSWV2ZDNFQlpWV2ZVTVI1TCtCSFZZMHdz?=
 =?utf-8?B?NVNtMUZwRmZlV3h3TTFaN3dkeHhnQ3NOY1dnK2NGNGQyK2dRUlBIVVFpOWFR?=
 =?utf-8?B?NWtYK2lrc3JVYVU3SHFsaVd0bCtraWpTVmtneVRWTlNJZ0U5b1BwUk44SXU3?=
 =?utf-8?B?VWVzVWoyVEdjMXIydCtmanVqWUN5U2RPb2o4UUQxcjJwdTNScGN5NDZIMXRV?=
 =?utf-8?B?N2lCMisyRVMwNTZTOGh6NzU3VnB3OUNhQXM3S3BxS29HZ3JiRC9EQ1NkRVU1?=
 =?utf-8?B?c3UvTmtTU08vckMrOTB2TW9VZTlBMGZLbUdhYjdYQ2s1WmRxcVZmR1NCSWhX?=
 =?utf-8?B?RXBWVnoxNHNGdkYxYlphYWx2YlhOWFNjS0hYZDlpUHdXOG1nMzhHeUlyYnA5?=
 =?utf-8?B?REoyZXJWNHc4UENIZy9aVlFrd1RBR1RWTkdEWDU4NDZJWEZGUGtObURneFBh?=
 =?utf-8?B?Vmk1M3NjSmFNRkNoOG8vNXpnQWJnSFh5Ky95T3NTSnVMM0ZVSkxxLzlJZkJq?=
 =?utf-8?B?dXBvT0drSE5VYzRhaHZVMWlmSHdoemVOVnFaMnlrUk9saFlKY1lUdXFPTWNF?=
 =?utf-8?B?SnR1d1N3RVM5cTBGNVhvcUFUelNCR000M3ovVUZVdlV0Y2Z6TkpML1BvNmlw?=
 =?utf-8?B?VlVIdWR3US9WVmZFZW1XTEhNRzkrTXpzMGtaSFBvQlpWdUxYMDhXMjlKZDFJ?=
 =?utf-8?B?UFErYXphM0lKQ0VQTHZXZHRua2tZYlVxWHBXMElwanNGTVdQQjhOWER1amtG?=
 =?utf-8?B?WHF6dnplUi8va0tTcGxwTStFYzl1M2VFZ0I2a09tc1JLemdmanAzdzBDRnRF?=
 =?utf-8?B?cUJLVHV6TEhTbjVWdnpPQVF1ZHdCOGVwVnpGWG5CVEZMampxek5SZ1kyemdI?=
 =?utf-8?B?ZEh3V0N3MjhLd3hOcWFtUkx4eWFjaTYyQ1k0ek1xSmtRQ21qMjBNckY3bE1L?=
 =?utf-8?B?QktiOVhLaEI4NGI4RGgwWnlPSGxnVG5kbG53N3NsTmxzbWRhLzR5U1VSR3Bz?=
 =?utf-8?B?Q1lRM2l4SENVbHh6cVBuWGJpMFFiWVY4cDl3ZFV6OHFZT0pTcnpEZ2g4cll4?=
 =?utf-8?B?SkhBQVNIMEFHT1N2SVRjOXVLQTV6UjVxUitVcmNNdFpBL0g3eWFuWDJ4MjRx?=
 =?utf-8?B?R0VLTnowS3RZSmp5MXlObUd1WldIaWkzV05LbURhaUpHTDNuNE9oZHdIOFBj?=
 =?utf-8?B?bTFDUWJxckVKSEJVKzRBQVowVENYWWN0NjlZT05zUTZyUnVoMXpZdFB4VUdH?=
 =?utf-8?B?aHAzV3M2ZmlOeWdVeitVUEhzN3ZsQVhOc05BdDBDUDlwWXNUOGEyblVPVys5?=
 =?utf-8?B?L09McnBjTUpPV3VCU2FqQW1abmhoa0RoTWp0Nll1NWdDZTR3YTB6M2tWdDdy?=
 =?utf-8?B?dktsbEJobzJvZGVnSlFhaWJZT1B6a2hrRXlJV0YvL091a3pOMGp4bzRib1FW?=
 =?utf-8?Q?RIwanJrnUtXJ7giHGPYM5Os=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51962432-d178-40eb-413b-08dde6286b63
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 11:45:43.4336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tbdc0NUHJ/UumPBuAj9uKq6w/VLQym438IFoEVdW4pA/yVaRPeOdvXem76JtVILWgKkS+zZJnab2rLGCxiYtY+7JFdIqGCijiEW7a3WXkxqDJgyIDXIzpir4UnyRVvS4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4773
X-Proofpoint-ORIG-GUID: EJ1WQOnmTPRz3Pk8KpGYSSD2CeAKoWHu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDA5OCBTYWx0ZWRfXzARaAJxAJVtM
 /jfRryK4cDCt46MhnUhPqcf6SpwkX300I0lvu377/faD8d5vHGBvK4St7G57QO88W0JrLTaFs9r
 1Xs7XqvVji1I9xGSPtdMRwPVTWdeNd4uf7h5f2APqfQ7hvOQ9eE8LO4b4SMim2/DK1mRWQnmmXD
 5+bvminnt1AvNAQ21bxstuMQ4g6LhGf0vRqWxsowoA9Uswy2qxcDOaGBYncZLN0T+VXIhPkkaur
 2Ns0+J70FdyC0t2d+8wt1hPd6kcSP2e5vjpmm51HIwL8/1QWu3Ro2XgQHzAHYmAkbqKbIynn2r4
 joPNbuyFqopFR6TWvNxFIohbNg+QnuU1GiUAwRlG3nLAVk7fdyEQVcycYY8auo=
X-Authority-Analysis: v=2.4 cv=JfW8rVKV c=1 sm=1 tr=0 ts=68b0416d cx=c_pps
 a=iNMpamO4ZYO2Dvx13ve0hg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=iGHA9ds3AAAA:8 a=FhKC5UeoIqeG05-Ktd8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=7-REv8c7eURj18RbIBAA:9
 a=ncbSrDh6ONNg6T8j:21 a=_W_S_7VecoQA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: EJ1WQOnmTPRz3Pk8KpGYSSD2CeAKoWHu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 11:45:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222566

--------------MEaddEcrTNY0WbZ9cR32RIQO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 57SA2asI3682229

Hi All,

We have removed *rust-llvm* and updated the Rust build to depend on=20
*Clang* instead.
With this change, we successfully built Rust for both native and target.=20
Additionally,
we ran a full *bitbake world* build without encountering any issues=20
after dropping *rust-llvm*.

We now add these flags *"-C link-arg=3D-lz -C link-arg=3D-lzstd" *because=
 of=20
this following diff
otherwise we will get errors during link time.

Setup in rust-llvm
-DLLVM_ENABLE_ZLIB=3DOFF \
-DLLVM_ENABLE_ZSTD=3DOFF \
-DLLVM_ENABLE_FFI=3DOFF \

Setup in clang
-DLLVM_ENABLE_FFI=3DON \
-DLLVM_ENABLE_ZSTD=3DON \

You can find the relevant changes on the *poky-contrib* branch here:
https://git.yoctoproject.org/poky-contrib/commit/?h=3Dharish/rust-llvm

Differences seen in builds:

with rust-llvm for bitbake rust
real=C2=A0=C2=A0=C2=A0 54m54.184s
user=C2=A0=C2=A0 0m13.470s
sys=C2=A0=C2=A0=C2=A0=C2=A0 0m1.380s

f/s usage
41G

without rust-llvm for bitbake rust
real=C2=A0=C2=A0=C2=A0 57m51.015s
user=C2=A0=C2=A0 0m18.129s
sys=C2=A0=C2=A0=C2=A0=C2=A0 0m2.051s

f/s usage
45G

We are open for suggestions, improvements, or concerns regarding this=20
change.

Regards,
Deepesh

--------------MEaddEcrTNY0WbZ9cR32RIQO
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi All,<br>
      <br>
      We have removed <strong data-start="97" data-end="110">rust-llvm</strong>
      and updated the Rust build to depend on <strong data-start="151" data-end="160">Clang</strong> instead.<br>
      With this change, we successfully built Rust for both native and
      target. Additionally, <br>
      we ran a full <strong data-start="281" data-end="298">bitbake
        world</strong> build without encountering any issues after
      dropping <strong data-start="352" data-end="365">rust-llvm</strong>.<br>
      <br>
      We now add these flags <font face="Calibri"><b>&quot;-C link-arg=-lz
          -C link-arg=-lzstd&quot; </b>because of this following diff <br>
        otherwise we will get errors during link time.<br>
      </font></p>
    <p><font face="Calibri">Setup in rust-llvm <br>
        -DLLVM_ENABLE_ZLIB=OFF \<br>
      </font><font face="Calibri">-DLLVM_ENABLE_ZSTD=OFF \<br>
        -DLLVM_ENABLE_FFI=OFF \<br>
        <br>
      </font> </p>
    <p><font face="Calibri">Setup in clang<br>
        -DLLVM_ENABLE_FFI=ON \<br>
        -DLLVM_ENABLE_ZSTD=ON \</font><br>
      <br>
      You can find the relevant changes on the <strong data-start="409" data-end="425">poky-contrib</strong> branch here:<br>
      <a class="moz-txt-link-freetext" href="https://git.yoctoproject.org/poky-contrib/commit/?h=harish/rust-llvm">https://git.yoctoproject.org/poky-contrib/commit/?h=harish/rust-llvm</a><br>
      <br>
      Differences seen in builds:&nbsp;</p>
    <p>with rust-llvm for bitbake rust<br>
      real&nbsp;&nbsp;&nbsp; 54m54.184s<br>
      user&nbsp;&nbsp; 0m13.470s<br>
      sys&nbsp;&nbsp;&nbsp;&nbsp; 0m1.380s<br>
      <br>
      f/s usage <br>
      41G<br>
      <br>
      without rust-llvm for bitbake rust<br>
      real&nbsp;&nbsp;&nbsp; 57m51.015s<br>
      user&nbsp;&nbsp; 0m18.129s<br>
      sys&nbsp;&nbsp;&nbsp;&nbsp; 0m2.051s</p>
    f/s usage<br>
    45G<br>
    <br>
    We are open for suggestions, improvements, or concerns regarding
    this change. <br>
    <br>
    Regards,<br>
    Deepesh
    <p></p>
  </body>
</html>

--------------MEaddEcrTNY0WbZ9cR32RIQO--

