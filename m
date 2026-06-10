Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FD1CD98C7
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 08:21:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15422.1781079705657035827
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 01:21:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=kQ+0ao1K;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=06216acf1d=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7jWfI522048
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 01:21:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=GYEKQaUChTl67u12BGCBL3bZVaLmGbnyuvO29wGEDoM=; b=
	kQ+0ao1KSlJBX/fjhLLrWgLpQMDcUe129c+zj8o96NX09VYY/7uITZZuborMFXmV
	PkAa+YZqxjJJ8Ex8j0nI4rBSb5bsV0ecpZ2v1hh+4W3x1aPDEXXieJYNhJ/IHlc7
	WSOIg5Be9Lsxlli2X8EUzSkKuoTT0EtQKeUccSMzoGZfnyVsY2MsqSri4h1dnpLj
	jv1a1D9YbrKSs1cRLYZmhr57PqfDAbDveNSgIgf3BeAa68w0i9RUVReC7Oau9wkl
	LfOolYsmvhfPlWQlS+zBWEQ/6W62yfWBmRxFUsaX7AXdBF9lOuNP6EvBtnz5rhz7
	5jFoIRQTL/NcJDX/9lpxlw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011010.outbound.protection.outlook.com [52.101.52.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4epwkb0bmr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 01:21:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5rtSTFURD6deaZbn++s0OY5pFoCAgV5kBACVjSjNxJgQgjZa0Amq59BSyYB8F9ZKWitHvoXusITEbgpeHFSbtk1dXVotk8ia1M8MVI1x81Fm9+VVm3bAWeeiEcbfnLvhs/RCbSSxJkj6VbEkLMllGEb53jZDhGuK0QoUk+lSTYBtIu6sz/Wli3twCIKki4yosA+uRnKF9QJZ3Wb3EPMPx+y8acRsUTxIGg4v/G7UxF6KV3ANoeNeMcHHKfkcDlWXwvVvxDR/s1uurhBaxzuFqQPyQMFT7Q+c0HbzrolPwl+tqS1luK1wPnoF/RPJdWAZYf3Qj+2ZdyyIW7hMDnIUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYEKQaUChTl67u12BGCBL3bZVaLmGbnyuvO29wGEDoM=;
 b=Tv4H42duNlLB3wfEM2cc7XL3mumcP8oSwIdM0G+r4ZrcaS94G1cmKKxiQ7+iYg+iRxOPRNXfJ3mdWsGMAwVKtLteTHIMlK5pn8WRbdzaKSeDXke9PZkoddRi32mFWjS5QfLXmJctwpWKcKyh3GvYS2EgiSRjsXjQ3e6c0Bu3KTok/q53EJt2snPG0BjlwRnbmWdZKSjRZfXZgQ79hgJ5qwQnTcr8okh7ayOGZwIhLANbk7VfULsLcjNxFgKtj6DOGl0MSRvHK5dYH0AHVLSTWfupzGE53USLtGa/DiXOBDE+4R8rNfAadGiRH2grHbUahk/5AJDo5SZ/WDlh+YE7xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CO1PR11MB4932.namprd11.prod.outlook.com (2603:10b6:303:98::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Wed, 10 Jun
 2026 08:21:40 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%4]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 08:21:38 +0000
Message-ID: <9b710df5-be32-4f51-a1ed-7883716f6919@windriver.com>
Date: Wed, 10 Jun 2026 16:21:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] diffstat: upgrade 1.68 -> 1.69
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20260603030911.3769426-1-changqing.li@windriver.com>
 <936DE046-F202-4C73-A1F3-3A2FEC8E89F4@arm.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <936DE046-F202-4C73-A1F3-3A2FEC8E89F4@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::20) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CO1PR11MB4932:EE_
X-MS-Office365-Filtering-Correlation-Id: 54e37f05-e11b-485e-8034-08dec6c94b18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|18002099003|22082099003|4143699003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	8hpDExw/DZ7LHe/JMBiD+p7a6F6qse3Xo3kAidtWGUxBVky+8rEtrxvcyv0OIVTWM5k6W3oMmEUUP8zq0dZNV38IrH7ToYlRVTHN9hFxTdf5gySN8scZS90ykt9NlKRHn5uLDxJxMkM/wonUaZeZIy8f4PH2z/wygZibezdHU6Dzs4nVoNoWHSjr7ikZFCq2ibfN8ZPKh6DMOGBvT4wdsia7M1WcT9EVAOrzb31JiSC97u00xVHwUCkvxDWlOLlAR3+6+I4g2owYp1VjYUCSrZclbslMMJR/RlgvcKifIdtqR+BTcZfBFHsMdrq3OWrRQgF2Po4bYn2QA7GR/DjY12AVt/RdNDBkjzy5JG+xI0NXHYHxtW6pC5RsQGe0kkMMODwr6khMQeGS5fu6CGDU8VR8JvRg+7LHgndbCiHP8O9csm/3gWju+P5sqkmsmE5/CBa2HXqGAZf/I9qJmUjb+DL34fIg/l/pHwwYmmPwSymZPkbJs6Dzwfnp0OwaCo3kHyvvSf+vETGejetM/Lq1mdcLPaL+6qSHVa3N5UEGMVOHk8wFhdu5EEfL2orMmzwb3Dc2iVgXTjqoyHSmWtxQ9j32gkE40XofQuUwkYTJVykWJCvrWUUu6iy5y/RmU4TSGu9w7d0YJWi8TA/5rdv+ekivhRbUu3Gf8ucj+N3GTRmyDHfghjt6G+2ylEGWXbR/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?anJraDFSZWc5aTAvSC90bVp5WDhab2twR1Nxc1hJZzRwcFhkakNJb1pEc3Jn?=
 =?utf-8?B?b3JMQlNyQ09RK1I4cC9zV3pQRWVic0FNWGx5bTM3VXBYenZBUGhZM0szMFp0?=
 =?utf-8?B?YThuRXE4WXgyb3gwMDZCN0FrNnJNd010Y1l0T1ExOElTbG5KR1dwcVRBelhL?=
 =?utf-8?B?ZWNSalhxQXhQQjFKQXVPSFlUUDRVUEJIeTZEdklPcFZ1ZDlCZTM1aVZrUndE?=
 =?utf-8?B?aGFWS0xpVmZzUHN4RGIvd2pBRko2Z3RtbndXckQrdzhGR2FzaFRaQ2d3aklB?=
 =?utf-8?B?YWhJeUdLYW9pYjBFaVlUUlNZN0FVbXVpenl1VzhQV1NHcDZjRHlWTzFXYlQ2?=
 =?utf-8?B?TDV0ZG5OSnNDOWd5ZXVLS1lzVTE0WlpLZjJsdEtIUVhwd2libHoxMFo0cGNO?=
 =?utf-8?B?YkRzQjZValZTUzZTOEFUc3M2ZEs1b1FOZm1KeGVqTmEvS1NyRCt5WERPRzh3?=
 =?utf-8?B?cG5idGswT2N6NkNjNVM1WXNQRVBTOTNYc0FJZk9VWDNsdjV2dEljZGR3SEdX?=
 =?utf-8?B?emoxZlFYcnhPRHJBTnZKQnNoUWREUTJzMm05L2RwbzJRdy9HempPb0FvQkZE?=
 =?utf-8?B?b2dEdlN1OWZ3ZXMzNjdFNUdXSmt2aGFHTFZBT3B5clhlTEt5T1B0YXJGQjZJ?=
 =?utf-8?B?OUR0OXRDYWlHOFpUWUk1eEhRTG1xbHFYODlveHAzY2JhV2xRNDFKUUNFRmRi?=
 =?utf-8?B?bU1DTXIxK2RGeHJ5TWJZZUlETFhjYzhnbXg3eHlBZ3Q3UU80T2VSMWlBdGE0?=
 =?utf-8?B?ZVlEVmt1L0lpOGtXTVh0dXlPMFFVRUhhWFJIZ2NTay9KdmlTaHZ4VmZPUnA0?=
 =?utf-8?B?c2FFYXhVTlFSUHBSd1lSbUdEYjFEbkxxNTA1RTUrbGZXVVhsd2tycmJ4YjQ3?=
 =?utf-8?B?dlZOZ1plRTZmODcvZkJ0TTJId3pvSE05T2tsVmVPVklLWmFRU2FvL2p6b0E4?=
 =?utf-8?B?cmtuK2xrOTVkNElCbnpYUE43TksxWXVXV0haMVUrNVZlYXgxTDVnZ3F2Lzlu?=
 =?utf-8?B?VXQrM1BpUTVYQTlNNGFrTjdjdVkwczNvb3g1TjM1K2pGWHRaREtnQnhKaktk?=
 =?utf-8?B?Tjg1TWI0elJ4K2VtZDdUclVKOUZ2ZmlmUnpDVHdnL1h5d1JZTE5GQzBqT09Q?=
 =?utf-8?B?NjN1d2p2NnNKRGpvc09tU281VnJ0cTBYME5qaU5SQzhjNkMwOGdGOERVWjZR?=
 =?utf-8?B?N3JEallYejZTbzlabThOS2VZdS9CQllwT2xINVNyTENCUUxjTUdsOUV3YWc1?=
 =?utf-8?B?OEVkQlVzTXM3ai9WWk12OU1xejZDaERyOW5vNHlCQzNpK09rUHVuSTg4ZWVa?=
 =?utf-8?B?RTJWVXlic2dUWVZtbHdJVFN3NTNNOXB4SzRTUmVsd2pyU3FHdURXNHRNQmVM?=
 =?utf-8?B?Sk9qMGhDWG1NZ1Awb29nbjAzZ0ZPYnFZS3dhczFzVjVLakozUXlKVzNxZjFN?=
 =?utf-8?B?dmlzQXpTL2h5NUpMWFdsSEQrRlNhYkpGM0U0OFlJbXNYRlM0NXJOdE1IK2VM?=
 =?utf-8?B?WWdTbUVuclpTQ3Z1YU5JRUhWRmZWWTN6TWwrSHUzdnZCNjVyYkN4RWNPMlhS?=
 =?utf-8?B?SW4xYml5K2VmLy9pTTRVTDQ5dXpOMGx4eHRqVk1PUklTVng1RlZGSWNnTVk2?=
 =?utf-8?B?OWxYNGxnZXhOWTVqN2E5dUpIejkzT0lTYVp5Zlc4aHlFejJTVEcwR0NBMTJG?=
 =?utf-8?B?SzN0bU44ampacG9pVjNqenMwL2dENnlzcXNGZ2xaam1oU2hodEsvbkNKdGps?=
 =?utf-8?B?enhwV09YeFJrb09rYkpYYkt2U3YwOFZ4YlBiU1g5N2x6STEyNTkvdHNqM0Uw?=
 =?utf-8?B?ZjdUUm00azRGRlJ0NEdlRnRuZGhkd2lSa0p2Y0VjdW50ay90bWZNekNyR3Jk?=
 =?utf-8?B?UW50VEl5SmlBOXo5NVBPQnZ3endnUUJRTFo0ZHhMSGkzdHlzaTZSN2ZwaEhs?=
 =?utf-8?B?eWRYZXdSU1hmeUpHRVZyaUhwOXlBa3lnSDhidndSNUtjRG5HYlUwazZWN1BG?=
 =?utf-8?B?NUdjcEZDdzF1VURielN0Q2xZQ3BKWFE2QnFIMXNTL2lVQWVwdklqcVFjK2lq?=
 =?utf-8?B?aUhBajI1WlZnM3dINHExa21lcStZd0thV1RybzRJaTd4NFd3SjFqcXFsUzBX?=
 =?utf-8?B?a3hXYkxQdEI4TnkxQUE0c2V0TE14dXFLMjE3b2JNYnpaYklCNnB2UXFYRlE2?=
 =?utf-8?B?c3daMWpJa21lT0UxaGNkNUMxRmZ2WU40MndMekIxNEt1YnlqckM5MGdpTU9s?=
 =?utf-8?B?Y1NWWWNKUUlMb1pJRVdFTVJnRVRjczBzL1dTTVhGTkNVbkRIR2VGZkNOVGNl?=
 =?utf-8?B?M3NHSGEybFBYZnV2MkVWRzBlY2FEaW5DODg5c3FZOEJyblBxaGltTytSc3FE?=
 =?utf-8?Q?BZuK/161Z8SfnvIg=3D?=
X-Exchange-RoutingPolicyChecked: 
	snV0WNGTlKXIkePzeXDpdeUdhTU2rASx7xWozotmzW7JopI1DPn+aOKnf8PxznyPTa7GZQOj9X4SWiefleRgICG4Xtk7M3s2JtDvURzFsdJZ535rXMr0Dy5Hz/ak6sxual42lKirFuKBw7jSKW8dJgjBRDcG8TPa70Bh1aSwEZ6aGMUfqsFvnMx2fRlQGAEup1Kt4se2QV9DnFAA+oWJOWDzNlpys93nGdfZaNGJRy1JK5SrIrUw2SZwSPzhRpYBr5afL3qHPAdv3T3AY0lwFlm51zPNRVkaGF3vNaZyYN0DTr5IDZxCsmt0mX6hhKvMb0ZcDHwgOiIFNcp69IPwjA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54e37f05-e11b-485e-8034-08dec6c94b18
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 08:21:38.6525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2X4iAIMOXoLulxaQSWDVwQjzX79yWh1jafZNDtRWU6zXWqm1N8uKbeFUghwNNb+ngksSOUlUDehmFZxo+7ZglTjX3nfgprVY7NpydZBzees=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4932
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3OCBTYWx0ZWRfX8WAdm54zNL86
 gvt/idB8488SQmNZZkvuAuCSk0KgBUUYyKrhV/lpUDPaRoJzvrlyn6ywZh0zuhhN2h4uQDS3Ybk
 Yld0LGK3p8SN7RTxLl8Jfnld0mK6oUpkZYwteP7jQgUaJY2o2LQjtxKP/EngdJaDzd7lgTLY0Uz
 tR9HHYutoGuwU3VJc9Ikv/03X0omfI97cdMDN7Chp0gmVEK7j6/z5XrdqGeD9k1QvhFTiGCZrNK
 xfiMQcBtSxLTf5tl+3Rk/JE3kUsIUn4VwsYc/gvsTr6WPeojnBkb3X82bi7HggfMJDGxWNQexbV
 acU15e9V9aTMB3UOsm8ZGYOcnBSeBJuxB3WEF/utK0oI0JjOFb6cCq/9g9OZpSlCpMH2JK3eOTv
 kWOxa3PDTnMlryLDhvhf4V8735hSaIuJlaaWxbxOHidh4I/CZ99vbK1GlIC/QQRWWXKje59WNzu
 obWOFSsyB9B5LS7tgNg==
X-Proofpoint-GUID: yGe9RgH6H3vQ9wG6RJ55akyUmVEkGWXY
X-Proofpoint-ORIG-GUID: 22S7ECVXHa3-mfzJN7H2Z4-07D89QKTa
X-Authority-Analysis: v=2.4 cv=afhRWxot c=1 sm=1 tr=0 ts=6a291e99 cx=c_pps
 a=5LsHMtEjVXEroYtotTqlkA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=Q4-j1AaZAAAA:8 a=VhflCXkplwMHH8GfLrAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100078
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 65A7jWfI522048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 08:21:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238322


On 6/9/26 18:55, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Hi,
>
> On 3 Jun 2026, at 04:09, Changqing Li via lists.openembedded.org <chang=
qing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>> License-Update:  Lincense Year update
>>
>> refresg standard-autoconf.patch based on 1.69
> Typo in =E2=80=9CLincense=E2=80=9D and =E2=80=9Crefresg=E2=80=9D, but l=
ooking at the rebased patch I wonder if we can drop it in this upgrade. T=
he problem before was that new autoconf notices and errors on the four-ar=
gument AC_OUTPUT call that diffstat does (expecting the autoconf fork is =
being used).  It doesn=E2=80=99t do this now, so we might be able to drop=
 the patch and simply delete config_h.in in a do_configure:prepend().

Thanks.=C2=A0 V2 is send,=C2=A0 patch configure.in since failure: configu=
re.in:88:=20
error: undefined or overquoted macro: AC_SETUP_DEFS

//Changqing

>
> Ross
>

