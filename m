Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 197FCC25B79
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 05:46:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.21549.1716788755703180861
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 May 2024 22:45:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5877b6f631=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44R4o20b027653
	for <openembedded-core@lists.openembedded.org>; Sun, 26 May 2024 22:45:55 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ybfgg9722-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 26 May 2024 22:45:54 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 44R5ggDp001235
	for <openembedded-core@lists.openembedded.org>; Sun, 26 May 2024 22:45:54 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ybfgg9721-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 26 May 2024 22:45:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvLqYlEJ4AuYscDaS71MmrsjZRX/pJsFUjjFgEQLuS6kn7cBTg2iy1dqcxareq4CgDujJoFiaIx2IjWI+KQbWe88hJ9oyTIa92bifo9evEi2QRCH5g1h76GSc7bD2ET7VIQDb2j8ig0uefJ6YxO5y4fOjSz6TjbmvPgP1O5EG613rInH09RoFjJ2TmyHM6yLrA1rYXfo3VMcMvRTjOnLNRAeRed6e/0jSAQaEMmdVFRctDx8EkV3g0cXyao66CkA5DfjR52SeZBgDnK+9iqUxYAaE1NdkaMSqBlB/9C0+f++opzWxApLorL5gORAIBdCGGvX15CM4un1EFE9s6FqKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odBeQq3of/2OSBWtOomviWOJwWuTj/oY3rIOhZEFxl0=;
 b=n5gZE94oLGkfR29hG7dIUwHD8jGYf9eQ1DW894R+79QKJld09fkWwP5fPL16KYaEZWzXaSmYuL0OEZkyd8Rmi6/J02HWoj9Yh+K4lHqiaRaKOtuLwhWXDJIBWMAUyvHH9xpLRulR1noPBsxSBkSgr5X/+uFDokC5ktcSSSn02VKXumgUoFrtr0GbCVGEw1d7Ifd78pAE5bF3geTscOq8iTqB0HsRJNwkWB3/t0uWaJpMqomW/XQutWI3wL5JAxdMO+eUuW7H53qb2c+6cn5VFQUNDWpRN+17l6PS6mDlNgbQ4tCdf8dfu1zKZjS6sb5LlaDHTmonCrARQzZyGY/NXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by PH7PR11MB7572.namprd11.prod.outlook.com (2603:10b6:510:27b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.28; Mon, 27 May
 2024 05:45:51 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%4]) with mapi id 15.20.7587.028; Mon, 27 May 2024
 05:45:50 +0000
Message-ID: <4a09f6b6-885e-49c0-b349-4acbc7145c6c@windriver.com>
Date: Mon, 27 May 2024 13:45:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/3] quilt: 0.67 -> 0.68
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <cover.1716543967.git.liezhi.yang@windriver.com>
 <580a0052e2d2ace4cd80d6bf8f90ee1d45d50d7b.1716543967.git.liezhi.yang@windriver.com>
 <d692b5c3ebebf88fce32b62cc669054227f92ed0.camel@linuxfoundation.org>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <d692b5c3ebebf88fce32b62cc669054227f92ed0.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR03CA0298.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::33) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|PH7PR11MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: 005a6300-45be-4ebe-c0d9-08dc7e1043f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dG9HQjQxT1FXbW5tRWVXMzlHT2l2c3VTTUt6Z1FyMmI2VDFzNjhCY2dFeERH?=
 =?utf-8?B?RmU0Tnp3TGl0eHNpNldMcStQV1B3VlVNd04vM0hvL005WUlPaWw4N3lWZERD?=
 =?utf-8?B?NnBrblBVR1lUbFY3ZCtzc1Z6T3Z4WEIwMTM1LzYrS2prUE9aNEJjcXVoNDB0?=
 =?utf-8?B?KzVWbkFPS0Rpd3hTcy9meVJKekp1RlI2RXFpZU52cVY3Qit0MHNLaE5pUWR1?=
 =?utf-8?B?YkFJbm1PT2xuWTZObGpPY0MwS2RpOTFlOGFvRjFiVDIzUDJ3QVFOTnIwMk8x?=
 =?utf-8?B?OXhBLzcreUdHRVdoeXdxT0tGdURaelk5NTIxTkxlQ0JWNm9tdmhXT3pNczd3?=
 =?utf-8?B?cnY1dUwyZFVhem8rL0p2YnAxakpzWDl5blJHUkZOQTVmcnRwRE1ZTG01TG5R?=
 =?utf-8?B?RHVIVG1MUGYrZGtwcEpaOUYyazc0b1BXc3k5WXBYNklRODI2REc3S3Z3QkFB?=
 =?utf-8?B?MzZ3S3dmUUZrSkRCblVLUmdMV0ozVlFNQTlFQzV0UElaZXlyS2JFcDhoSHFR?=
 =?utf-8?B?UjZDSWdmVC9yT2lVTkVLbm92eWtTSk9yb2FkRy9mYWI2djNNOS80cG9mRWEr?=
 =?utf-8?B?L1NZNHlGWXhlNmpXWnRWU3Zvd25rdTNJWFVRc3FMdWxnczJNcGxaaHFndmlq?=
 =?utf-8?B?ZXRqQUc5ajFlV29zNTBIOXlVYTFCakdLQVNpQ2VIejNibDhCRG5WYTRhV2p0?=
 =?utf-8?B?c1lOeDJ1R1kyTTgwcmgyeWh4ZHRsOXlPQ2xRTnhLVHdEajFQR25KZXY4YU11?=
 =?utf-8?B?T29pTmF0Z1hlWWd6VGxRUDZpbVdnWk40cCt3bUNuclpraXJqa3dqUk5pR1lX?=
 =?utf-8?B?OVBHMVEvMFVIbEY2NjJzeHBLcExPdHRtQUY2cCtkWkNpaWJjOHU3NGFZeStT?=
 =?utf-8?B?dmZyM3drakdYaHd4c3R2aDhOa1dGdkpzZnlreXNBNDN5WWp6cXQxcnFSdHF0?=
 =?utf-8?B?bDRwbkNieXYxSGkxYXlxSmJOOEg5L09KbGdlV3JCdlZaVEhoOGE4MTFZd210?=
 =?utf-8?B?WkhzY21uOEUrM3ppV2M3U2tTV0RmeG4zWS83dFhFYVh2SE9PLzVnNU8rL1J2?=
 =?utf-8?B?RzEybStMY3I1ME4vd1I3V09rbEFIc2FWWDczYzQ2UlJVRjF5ckk3UnJFaklR?=
 =?utf-8?B?Mk4vTXY0eTcyT09URnhnRndpZVcwOUJGVHlSTlliT2I1RWs0Y3AwREttUU52?=
 =?utf-8?B?S1A2QitWME1JL0NFWGpoeGx0WlRWRVdNaEVXSFArdGgyT0pTOEYwWndVTUcv?=
 =?utf-8?B?YTFueEpleDBuSlBzVzd6UEFMQnJTQUQreGppWTl1R0dyOEJYZmFmTGNDUGxI?=
 =?utf-8?B?VGNzYzZhYzZHeXBNZG9qbm42VXZjR0VtWCtqUWsva0VYdDBvclZHQ3ZDYk92?=
 =?utf-8?B?VXAvdzZ6c1JiUVZaajRQek83cU9CR2kyOGdFVldGNXdHZ01nYVdjZnovTkN4?=
 =?utf-8?B?OElYam5nZURIcWpZQ0U2NlkwKys2T2R6RmxnTjVpQnVrTEdNMGZCMTBCMHM2?=
 =?utf-8?B?SkZHK0czR21HZWJheEpxemRwU28ycmFmakJvanFrbER6NmpzRlg4QVZZSENO?=
 =?utf-8?B?VTAvT0dzUXJRWk1rY0owUURzc0lMS0s0dnZ5TkVLUFhJVldOZHkyQVRjOGZR?=
 =?utf-8?Q?hq5Rs223h1A2rqR/1IQkUg+H7F0ca+l6fTi6zyAJlwm0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eXZjQzNndWxaNVZFQmhhVVJTQ0lBS1B2RkVqNHpDUzNJK2I4TmRXYWpXZzNs?=
 =?utf-8?B?WUE4dGZtUUFnTnF1dzYyRHl1U3llMUU0RG5lK1VVanhCTWkzMFlKamJBbVM2?=
 =?utf-8?B?U2llWmlaNkt3TC9wNE5XUHh0aEtjOXozSE5UVU5QREhZUXVCQmlOZkdTKzBz?=
 =?utf-8?B?bGpsQTAyc2hDakRlRHYxc1pGU1d1U3p6Ni9heTNYOHlQUjkzTitxdTlJT3J2?=
 =?utf-8?B?ZVBhaDZ6azBZdFFScklvQThXZHNvT3BaZExKTW5MdkRaa25xM3FMenE2bGhH?=
 =?utf-8?B?QUh1MFlSemdUVDBMNk5IVUJDQklibnVJaDJONHg0SHZjdGIxak00ZDVaTjJw?=
 =?utf-8?B?QUNGNUFNelJNcXA0RkJHYmV2dWtZaXo1RnE0Nk00bVQ0Nm15aStGNTNKckdB?=
 =?utf-8?B?Ynk2MHA3b3FKd3JVOFNJMWZTMDl6d0hjaVkrMXlIRFFIeXRZTCs1OGhkenll?=
 =?utf-8?B?YUZ2Mm4rT0l1ekExRDdPdXlSWC9BcHI1VG9vT1ltc3k3RzVnRzdkRjEza2VG?=
 =?utf-8?B?WlozY3NseVNNVm1PcW9vcVV1Y3dHbHExRC9mdmZJcDJ0VksrU1djUERocHVW?=
 =?utf-8?B?WTlUK1F5UkpvTnBnMXFRdVQxZFNMbWRrRFJNYTA5ZDRZb04ra3FicTRJU0tz?=
 =?utf-8?B?NlJmZmdWOXE3SGNuTmN3eFgwRG1adUVWWDlPK0E2N2hlZ0NPbmdUdVVVT0d0?=
 =?utf-8?B?ZFJTbzJzZ1VJWVd0UVV0TExUYy8vNndzK0RKREVrSUVWc0JYU3B1R25CUy95?=
 =?utf-8?B?TFVRSS9lN1hETXRTKzZGVGdzcGhBWjJTWGU1UGRPcEkwRlMxbEtEbXV6bXZh?=
 =?utf-8?B?NFVYbXFUVmY2UmIyNDhoeHhEWUJhU1p6OFExTlp4Vjl5cGhnZXVUYXRoT0NU?=
 =?utf-8?B?SVdzL054bUtZWWswdUpqNWNWS3FiTS9CWHRVS1crdGdVZ3cxYzZJNjFvUkhY?=
 =?utf-8?B?Vk1QSHZiWGhVY005Z2lUQmVEbzEyNUdVM1JUZ2MvQmZYb2NFSW5OS1ZreGJv?=
 =?utf-8?B?UmpjSnVMNXFLYnAwMGZNdFhybHlWNEZZbDg1b0hIak1jN1N4bjN2ZUpuc3B4?=
 =?utf-8?B?bDlxUWM1L3k2c290LzRERWQva2VhWVFpWXRtNWt6NXJNWXpZL0c2WFRVOEhY?=
 =?utf-8?B?djdoY2dYK3lUMHd0MG1WeEtxaFJSWHR1ZDhCTHBSTGpJdlJuMWk4dUlZbjZV?=
 =?utf-8?B?TFZUeE9KbnpnT25CK1Nmb0JrZmUwMzNaOVZtc0c4ZGx0TWovY05KWDRCSVlt?=
 =?utf-8?B?VFY0Z2lQZ3RINm9KZlVtaGN4RTR1TEM5ci96SXl6ZUFmTjE2cjk1QWxyUVZY?=
 =?utf-8?B?WFU5eWNINlpYNXduVlpmRmJsd0JuUXZXTGZMd1g1ck5aYTBYZWpmZ0RDM0xC?=
 =?utf-8?B?amNXQTVaVjRKbHJWZXN5U1BPQmt6MDNGZEdhUHpzZkxwS29pL3gzenhqajhs?=
 =?utf-8?B?M2xENTJGcjVraFVOZ0NOYmgxWGk4Y3JZYTA5bjRySzBZdVFMbzBnSHNDanJ2?=
 =?utf-8?B?OFBqMVdtMEx1RTJmM2lObk5HUGQ0MHpWcUJnUUNHelRwd09UZ0RrdTQ0QkRV?=
 =?utf-8?B?Q3lGZkxkNDhsay9HWWVKYVVDcEpGMmV4UUU1VWo3MjVqb0VpT3AyTUg2QXAy?=
 =?utf-8?B?M1VSZjVFTjZzcTFwejkyUCtVSHFVQnpqaU9kbSt2TWxXaVVjK01ndjhXL3ZW?=
 =?utf-8?B?MHZZVXNkNFoyN2h5UjNTUndud2hSdHRvbTZ0bnFxbDR4ekxjZUtSOW1uakk1?=
 =?utf-8?B?Z21OUHIwaWxXSVhPaGszNEpTOXZYRk5lOSt1eXNxUWw4VnBXUDY5Y3lYZVBX?=
 =?utf-8?B?UlB4SmJwaDUzOXZGcVh6TGdpNkZXSFhOMnJFdktiODZnVEU2WnYwTXlLY2N5?=
 =?utf-8?B?NHBoL1orMGJtbUNId0pBdWZUaVREVlRDOVIxNk5oUjJJajJuUXEvd1Z3MHZ3?=
 =?utf-8?B?aDQyMFNHSFdMVUltWHZ3aWpGMzB4WWFCY1lXUFo2dzd1NWplR1J4blZnaEQv?=
 =?utf-8?B?dzl6NE1qcGV1ekFMVlR0ajZobkN3RXVjSE8zRXR5NURFdllSQjF5TkY4OEZ4?=
 =?utf-8?B?ZTVsMVdTelF4VTl5REh1emNzamZKb0FNcEtJSE5qaXlxR3pGaS91bHp4UFJj?=
 =?utf-8?B?MFFOVEhiZy9uTFcwd3dPUnNpQ1g3MUtnTU1EQzRBd3ZCTy85ZGpwSno2c0Nt?=
 =?utf-8?B?WHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 005a6300-45be-4ebe-c0d9-08dc7e1043f9
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2024 05:45:50.6276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ozXGsGLZ8Dl872Jg14JEft9v6TUqflWVRUN6d3+ult18gRKVf3s6KB9u7StLhPKsI+pR9I5//IT6wYSVUyWsGjI4in6y933rN52QaqMJMqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7572
X-Proofpoint-GUID: SQkoavwQ2lXg7EOhTHZvoNeO0N3ZtY77
X-Proofpoint-ORIG-GUID: T2SOAlxSSfGbla8dg_N0njJhR5Dw-u2v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-26_09,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=665 priorityscore=1501 adultscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405270045
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 44R4o20b027653
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 05:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199895



On 5/25/24 18:59, Richard Purdie wrote:
> On Fri, 2024-05-24 at 03:28 -0700, Robert Yang via lists.openembedded.o=
rg wrote:
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> * Remove backported patches:
>>  =C2=A0 fix-grep-3.8.patch.
>>  =C2=A0 faildiff-order.patch
>>  =C2=A0 0001-test-Fix-a-race-condition-in-merge.test.patch
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>  =C2=A0...lt-native_0.67.bb =3D> quilt-native_0.68.bb} |=C2=A0=C2=A0 0
>>  =C2=A0meta/recipes-devtools/quilt/quilt.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
>>  =C2=A0...t-Fix-a-race-condition-in-merge.test.patch |=C2=A0 48 ------
>>  =C2=A0.../quilt/quilt/faildiff-order.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 41 -----
>>  =C2=A0.../quilt/quilt/fix-grep-3.8.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 144 ------------------
>>  =C2=A0.../quilt/{quilt_0.67.bb =3D> quilt_0.68.bb}=C2=A0=C2=A0=C2=A0 =
|=C2=A0=C2=A0 0
>>  =C2=A06 files changed, 1 insertion(+), 237 deletions(-)
>>  =C2=A0rename meta/recipes-devtools/quilt/{quilt-native_0.67.bb =3D> q=
uilt-native_0.68.bb} (100%)
>>  =C2=A0delete mode 100644 meta/recipes-devtools/quilt/quilt/0001-test-=
Fix-a-race-condition-in-merge.test.patch
>>  =C2=A0delete mode 100644 meta/recipes-devtools/quilt/quilt/faildiff-o=
rder.patch
>>  =C2=A0delete mode 100644 meta/recipes-devtools/quilt/quilt/fix-grep-3=
.8.patch
>>  =C2=A0rename meta/recipes-devtools/quilt/{quilt_0.67.bb =3D> quilt_0.=
68.bb} (100%)
>=20
> The quilt ptests fail after the upgrade unfortunately:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6454/=
steps/13/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6645/=
steps/12/logs/stdio

Sorry, it is because quilt-ptest requires coreutils' ln, I will send a V2=
 for it.

// Robert

>=20
> Cheers,
>=20
> Richard
>=20
>=20

