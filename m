Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34800CD343F
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 05:55:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2420.1779083733161071773
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2026 22:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GIyn0paL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9598bf1d35=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I4m92j577753
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 05:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Zh3Y6D1T+35AbvM7RN+eRiXkcXhFiVqPv5bc1OHtURE=; b=
	GIyn0paLmOoqnejwAsKDTJgJkQhEK0Vsf35NykO1B2eiOcy9xJZxDLgIkfxYEa6q
	OxajRlhvx+LoILvqsjplH/QluGb0Wl9seUHnAqANltZmhZJ49GjdyOAgcms4YK0A
	5XX6qjVAj/MflqpclUw1hPHryi90ftid36ddk7qdIvHiocjrHkrvs8qsEZ845Azv
	BaLqaK+mwvG4cKOJKGmS9FpT/XZ30Rj8JfasTowtqBRnTjk0WsrbV3qhAfUFrGvT
	Q8pJz4oGT62r+fgUsWxCgTVIn13P++p+WNPMC0zp53f4dVt5LV8f7A4Wc5MyR4f1
	w1iINqf+Rj1YUHrWX001DQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012037.outbound.protection.outlook.com [40.107.200.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6ecf1n9p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 05:55:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPIwLh+HaNv825YS6Bgz2x85/5BegiS0K5fFESC79Rx45WDiHJBuqni7HRGX7PDJoBPGyo0a9FLxLKX8QL9FvPCxY2uC42XoEIEi9m4fz6i8sGm6m+DLlQW4E2SY3lR3xR8frSsSP0qYylrfNjic9Dew/r/BWnIYBQ3mx3Lj7zVFwh6en4pTTOZ7gieyeBur3aDZ0wpjIF7l6CHlIX3lRLAENgi1scjUlCiz9FVMB5vuCdOy0l1y5KCM7CNZj8qd2mRHvPMSZX8U+yJF4cdVaPhGxMz6Q9WSO3W4cUbOu8z/YFVSJOVRLKyo5yb37Pkv7L8NO714RS2rwaXf4DpQgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zh3Y6D1T+35AbvM7RN+eRiXkcXhFiVqPv5bc1OHtURE=;
 b=FG/3XCPkWO/CnihEJSkEjuyLsc3m6KwEypUsOkS2YJtFvFtwyHhi9gamnsoJpEjFwh7IakudtzRwZzoTHmra/AQsI2DT5IOnrCW+TSCYcsdFj2vVy9SxvcLpPgFOO7gisC9kxXg2Cp/7Y/y/K7enbNn7jN0iZzWuSG9oGeR5/KdH7wAnOtjUNGC45Zf1svbCJvSZ4CUEi0Wb1oKqC5WmJwbgQZIKy2ZfIWVMg9qMelIuDciTdQ3kyVtj/FCXklRyLOtHSfQZoEkl5OH/bKnM3biJ/ziNvhZ6rcCjgLjDXMSe2kW7GidhpCOQ3nY1xR6GPmGbBJqH+oU1LRb6wuSPuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH2PR11MB8780.namprd11.prod.outlook.com (2603:10b6:610:284::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Mon, 18 May
 2026 05:55:28 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 05:55:27 +0000
Message-ID: <3a19de35-8ac4-4912-a3e5-fac97956a4d2@windriver.com>
Date: Mon, 18 May 2026 13:55:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH V5 1/7] recipeutils: add optional stable_upgrade
 parameter to get_recipe_upgrade_status
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "MacLeod, Randy" <Randy.MacLeod@windriver.com>
References: <20260513052334.2271800-1-Qi.Chen@windriver.com>
 <DIIC2A22J8TH.2IC6O1ZQ1MODS@bootlin.com>
 <CO6PR11MB5602B1780BBA2AD5C925D884ED042@CO6PR11MB5602.namprd11.prod.outlook.com>
 <CANNYZj8pf8FtsRjZpnMGP2egY+Wc9aw4ZDz2DR=rqv74Oopk1w@mail.gmail.com>
 <c128db5e-2ef5-4c93-9cc9-ae55f31f7da0@windriver.com>
 <CANNYZj-JLp8MwK5UnjVUrdBtmqDM_+dQiodU0QgMiW7zcToOjw@mail.gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CANNYZj-JLp8MwK5UnjVUrdBtmqDM_+dQiodU0QgMiW7zcToOjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0039.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::17) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH2PR11MB8780:EE_
X-MS-Office365-Filtering-Correlation-Id: 25f7057a-3e79-41d5-af1d-08deb4a20fe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003|4143699003|11063799003;
X-Microsoft-Antispam-Message-Info: 
	eMKwCKYG2oY+w3CXWz3dCEzlvcQ2Huyc4W0xZF7IqW3pqW2j97jhpprPfauVMvLnNOrzQeyNkyYpU4YYzV8loOmvFYIdtg/5VIiz5iUcVD2/knXR9w1HVU5WUCE2eMRIS6jq0RNu8HQxjFL3WCF+oyO+MIDQ8C1XHNg/TMnvbuZlQ48DAmqgN+tUHxXYUOiiOGSnzXzqauEPYYytSMP6SblR+EOvNkpoAoyeDM0id0lQAWgDMPD9RdBNqK2xgZDBeeI+tp/j6usLDV3VNtzInO0IIWKuz/GzhsbZPfRHcQxljExZ4MX19vjov/bUVEGtznf/AOQCuFcYWOFmpYkcZOyWiJwPUTtYUCjnOlGxUrR+tgGxCPNt1XhLOOWgLaXUMcE4JfseNnYJLiX2tZj+H8thG1CLH99Od8MoHfv0wW0rnkYctj94Xy8NYzMDrPKxwyETqXoZWgojQp9vHgyrEmm7I/bUJobxWx63Y+RJcOKl3AVqZC6UDz8NVcPnbtFuyKmfMo+z75pyUs11Pxn7i4JST2//tBw0pTgrZFqI9p7krqHxA73+o0E8WBcoxmM/0macH0mttInzRvYxAagy/easYY3779zUR6MKWB8P8KdyC1u3QmxqJTj7UYNNWbZl5oRRZxndai+JVChiJ2PTF+f/OX4kp1vbIvShF7vDIaag1Yt7Vmc34wne8I/pYnv4
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003)(4143699003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UFRQUFIxREtGWEQvOU1YWHlrbjJuN1Q3WXNVWUJKSlVxM2l2eXhsZVlUNDZR?=
 =?utf-8?B?TzM1SGJ2RVdpdHNtVXFRckJsT3lXT2dvWTUyNFpTWUhaWi8rWDlWZEE1bzFV?=
 =?utf-8?B?b1pjbUdaTDFabHFhNmpmRk1vc203dnNvMFVoY3A4NHQxdmxPN2ZNb3dFZ0Yv?=
 =?utf-8?B?YnlYdEh2RkxGOTV2aWIvUTBlM0ZDMjRnVDN6Qi91Vk5NNm5NOXluU2Q5NXBY?=
 =?utf-8?B?RDNrbGNTUmFXN2VqbWJYMWoyeEt1akhvM2hlUDVsMytKS012N1U4UzYvTlNk?=
 =?utf-8?B?SldzNTAxSkd0WHdHZUFNY2FJL3RwL25lRm91cldYZE4wYWlmcUFHNm5zSVI3?=
 =?utf-8?B?eXhzb2NIdDdGdXRiV3B2aEhpTEt1UVRDSzVITCt5V3E4UnlCVnFiSlRNc0VQ?=
 =?utf-8?B?Q0YwVitXOVR5MVdHdlovYkY5eStPYU1Pa01JSUh6bnpuYnk0Y1ZJZjNVREpE?=
 =?utf-8?B?a3hrakM1clBQa25DK0hpQTRpTTRXRlR4QTZMaXB2U2FzRVdhSXM3TWsxMjB5?=
 =?utf-8?B?VEdxc3pSVzRrdE1ZTXByMHQ4VzdwN1NRSnZKbFI3QXl4MkplK2lDWUtJanhY?=
 =?utf-8?B?VnkyRVc5bE05NE9XbVNtNHlRZlRkR2R3Q3d2K0hoZGN3YUZrOVR1aE8wNGFH?=
 =?utf-8?B?cXdIM2gvUFgzdXYwekpIRW4vMVFsMTVqOUpxYmhjNXRGd2JNcno0bjRNa1FS?=
 =?utf-8?B?Vm4vTkVQRHJPUVJQb0lUeGFzOUxMQlRUTW5CK2JtVmZCMkF4TXhxT1lKNXZu?=
 =?utf-8?B?b3VrN3FTTHBGUjY4bGlFdGdhUE9pVFRBRlR4cW1oR2lMWHJTc0hZRlBNYnc3?=
 =?utf-8?B?MWd3dFdIS1dSbDluWnQ3OTlKYnBaSFlCWnhNV05SdCsvQXcwNVB6U1JaU1N6?=
 =?utf-8?B?eXFWZFBmM1g3YXV2OU91N3oyWWt2d1NZRGlXVndlZ0NxQzNxTTFSL3RPKzRY?=
 =?utf-8?B?LzAzbVFEdWRjMGVOZHJ1dWtNN1hnSDZIdk5NcjBOWHcrZGd6QURkbGt5dkI2?=
 =?utf-8?B?TnFMVytPeDNaZ1RNaVlMMVVFV3dtcGRodDhPL1IzMTBOZk9jYnYvS1dnb0lQ?=
 =?utf-8?B?L1pCNStWWnNwQlhERkZjd3UrV1lERVpEUmJYUm5HVk91czVIejFrTXRWWWFk?=
 =?utf-8?B?c3pBOC9KMmthOTQ0akEva0k5bzdLSDNoMEJTRDNSSEpLR2hySEt4TVNwRTA5?=
 =?utf-8?B?OXE4TkdrY2VJWG5DN0VycEF4SDhwQnFqUDREQzUrOXVwdXMxeVM4S1JCYnB2?=
 =?utf-8?B?Zm9WYWxZcVJjMjBrOHdxUTJ3UnZMNm9GcDI2NXlrRlJmYzhNM0ZkVk5YMXor?=
 =?utf-8?B?TWdXYnptYlNCa1FobSs3YU5IT2JIZE0yUE54Z3c2SlJ4UjJ1S3RSS29lQW9I?=
 =?utf-8?B?Q3FiWFpRQVRtbkNTMXRSV3NKMU9oaldWbXNnMnFUV0d1QjRPN2pQZVZsQUhx?=
 =?utf-8?B?TXRsU1cybUs0YWYxeFZxeHJtbWEzY1NYUkxqRmpQMThSekt6R25oWWlUbWxN?=
 =?utf-8?B?RG8yOEJQazV4UHVqSVhPLytNWGRZQU4rbDgzRDMraFI5UnpXNVU2TXBjeUpU?=
 =?utf-8?B?WWo1KzVwKzFyNjZ0ZlgvWVdyajhLbmtwUjNtSUwzV2hBRFhaSWJ2NVpvZEdn?=
 =?utf-8?B?NWFJUmNkdm5DakJNaXdSWnY0aHgrdXVnVnhLc3hjTlhwWU9xWW9pb2hPKzlH?=
 =?utf-8?B?RmdFbE5JMGpRQjFXeG5RK0g4ekRZaStZTEdlbW9DVWlJT0VMMVNiVUtIcEtJ?=
 =?utf-8?B?Vzk3SE9RWHlRbUMzaHhSUXFwUTU4UzRyS3dJQXE1dTU5ODhxVXp0VFhoczBL?=
 =?utf-8?B?NWJ4WkhUby9mUTR4d21zZ3dvTCt2V0xQL1JkaHZSS0FhWG1KQ0J3a3E4aEtz?=
 =?utf-8?B?enk4NEF2VnQ3V0NnWkdwVTVjYk91QmdtU3BmU0w2ZDBQb1RucFpDeXhrK2dV?=
 =?utf-8?B?ZzNndVBnN1hrVnVHNmpqT2RqWjJrZTZqVDFMamZ6eWJHK2tZTkRRTkF1TUJ2?=
 =?utf-8?B?WWNpdWM5OWxUN2hscG1iUWJBeSt4eHZHQ2g3ZS9jT1ZmckNZUjlOZGRZczBF?=
 =?utf-8?B?YkFFdG45U2MxYXR3eDgzSUE3c2tWOVpMQ2U2SjYrU0VPODdVb01yTDVVWUVH?=
 =?utf-8?B?dHV1QXVGSlZLdjFua1NZSUVlYm5CUUdqbXh4ajF5RU1XRUdtT2g3VUM0cSs2?=
 =?utf-8?B?TnlQb1pvWjFwK0hybjZHcFRzQWFVaHRmTGJDSTI1eDh3aHA2NGpmVDFkNkc3?=
 =?utf-8?B?TkJZREVxMTVNdFQ1aWJpV2xKVGFLbVJTYTd6cEtDeWFDWHZkOXRJUXpOQ1My?=
 =?utf-8?B?emY4TXlhRTVjQ0xDS2RLb3o5QnlBSlFYTVBoT2QvdWhsdXJXYzNqUT09?=
X-Exchange-RoutingPolicyChecked: 
	Dt6AbVAMU1pJllq8rBRrHK7lQKIs6cEaV/fjKCp66BfbKKJZPwYBVpVvibQxS0Qpn1vEl8rn+LMk+ppkwtuJAKJD/OPqPQ50MrDo8rbLN+0Q1DRmpMXw7OkCcOIJnndggLm8GOW9Fag/OIddjuS0OD40j5fz9iCOa/sK15LpVyuV0kvAaYYk56B/3U+l5EC8F8sDRfnaeBv0izJom0x4wx/Cs3ez3fx/0FGi+4aEyGBru11ZXAuXzR91v5qmbgc6UhkFSeyJBuMB15q1k0GWI1y6iFIz+z/w/IwoJ5Q/c1RdPpfn94jR9Rat5zEPpW39rR9sY7Fl2fUTLFQRahisOA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f7057a-3e79-41d5-af1d-08deb4a20fe1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 05:55:27.9395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sO4cCI0CoQJQZbQY2OJT7/FEm3xKLcmd8jrxzo050DD40kKM/+P1t/VV41oWLk90XZvtp6h/Jh3tRwzRcZ+Hxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8780
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: v0xGueAT9OTYJWS1l1SE81qi_TyCoFNv
X-Proofpoint-GUID: vhSHTqq61xclkxtfufZdep5ZPY68apiq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA1NSBTYWx0ZWRfX4y87aswSny3u
 bClLGZrFlRe9OdFy+EM40V6rmkwZw4JGMMhP06gxjTvD6ucvf6pX6rNZhesCQ0Cw1cem3F9I5FG
 FXaQkeYLWugfFTScQB3KliWky/4blO0lD/vNKiR/K9iRVW3OJWDS+pMAAgYWDgkof+w1rdKgqTD
 4MoRWWTntvjMFpAcBQaVXImJuEXFQlonp6mQq12nhobMcviwVX3RofKSAWQyKTcfIYPset7/RYT
 UAr+ndkL88hBkZFvDpNx2Raz5NPZTbgLOYUE5dXcTRaizNoPuJlVk7Y4DCVamXxgSVoPpfladhr
 39qN+3hUCavlPuKJ1vR6GerpHUxv5fBvDfIghXnW0X+hSJR48gBZgweCV+CK5HJ+mnzGi2sqHJK
 jVXLpqU9YwelMJA8ssa6xDrVuGJwHkewZYtYaslqf/pGJO1M48gICpgxmIv8q9VEXCBkhlL/73d
 P69/nj39z+8J4Tm3B6Q==
X-Authority-Analysis: v=2.4 cv=dK2WXuZb c=1 sm=1 tr=0 ts=6a0aa9d3 cx=c_pps
 a=TuEuCTxUJaX1tclN0RLokw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=Q4-j1AaZAAAA:8 a=3rARZqOmqHhNOzOsmWkA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 05:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237194

On 5/18/26 12:09, Alexander Kanavin wrote:
> On Mon, 18 May 2026 at 04:37, Chen Qi via lists.openembedded.org
> <Qi.Chen=windriver.com@lists.openembedded.org> wrote:
>> And in Yocto, we can't set variable like this:
>> VAR1 = r"abc"
>> This will result in parsing error.
>>
>> I'm quite confused about this and any help is quite appreciated.
> You don't need to change bitbake variables. The issue is in the python
> function inside the newly added class, where you need to correct the
> string literals:
>
>      return '\.'.join(stable_parts)
>
> should be
>
>      return r'\.'.join(stable_parts)
>
> Alex

Alex, thanks a lot!

Mathieu, I'll send out V6 with the above fix. Could you please help test 
it on autobuilder? I hope the problem would go away with this fix. But 
if it remains there, please let me know and I'll need to access 
autobuilder to do more debugging.

Regards,
Qi


