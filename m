Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D919EC52D7C
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 02:56:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.89485.1723604195219870014
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 19:56:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8956145dc1=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47E2p3Os029749
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 19:56:35 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40x3g03f9q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 19:56:34 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47E2uYXa004936;
	Tue, 13 Aug 2024 19:56:34 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40x3g03f9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 19:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SMHD1KcDdf3ZrYoEc1j672AVVs6b1VrWCpIU+7MVKMy0rkZwHqdiVhDIdfT9swXg3Z47qyR+FgiolVVb6pCbRMVDAhxdAkq/iTn3PhSIKfjlS3Lthr1mMMj/+2Dn5IuM3jcyqpfWW8oJ9YpmyEsNR8MPDNg02iyx54vOUtql+wt1qpquxuVra1ulDJ9wuCbAzwBfEJEd4wS5PVbCM45Bhrh/ku91iS7dQUQtxNYEtZ6bowe5YuJImjwA7+oQ4wJH44LCYY46YFLT05MR8tm0jMuP649HvlAsPsglgXdpT/n713VAxdaqakQNe39s2Ri5LlkDtnJ5Oa46hGuX/1Ym/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gN1TWV7rw/uI5o6vtV+PuAvXTalhTmlCCjvIoNQjGCc=;
 b=ZN+UzDFyRlQ/610S0jxkRsFT/AS7MWo1oh/Pcbk8vLEMTK/yF3TgOATCRAAMLfg3efJb1/aPQx8cnsMtUx53LjxZwLUgZSYx0hnV0HgLSUF49p2gejPuG4/Lcw7SxJ4lo/aniEjwpddEkMwUP0CyQUgDGgyCQ5D0wXQHUmuR6UslXGC2jBXhVi7H/cGueEN2l6+1kL4e65Ng9TCUv3kBYqD+L4gp3cbC66OR0pAtWv6qyWIiDvXYVvWHhOunzhQMQlsFACBuYgIzYvpoWIWrpFp/4NXv2SUn2tIDXtYxMerl8d15anM0e0nguvdtBS7/MV+c6XQQvo5uySCYdeqnqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA1PR11MB7197.namprd11.prod.outlook.com (2603:10b6:208:41a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Wed, 14 Aug
 2024 02:56:30 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.7828.031; Wed, 14 Aug 2024
 02:56:30 +0000
Message-ID: <7f6a3ca8-1eff-0288-d667-2824dbcfefc9@windriver.com>
Date: Wed, 14 Aug 2024 10:56:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][PATCH v2] python3: skip readline limited history tests
To: Trevor Gamblin <tgamblin@baylibre.com>,
        openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, alexandre.belloni@bootlin.com
References: <20240813164101.3425564-1-tgamblin@baylibre.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20240813164101.3425564-1-tgamblin@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA1PR11MB7197:EE_
X-MS-Office365-Filtering-Correlation-Id: 45c81d1d-ed45-4996-46bf-08dcbc0cb28a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|4022899009|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OGQzcTdvMmxXbURSTFZod0ZsaE0xUFRzcXhhSC9SRmJoZjdRVjUyREEydmdh?=
 =?utf-8?B?SjQreGUwUVlkOGM0MFJ1dzh5d2JMcFlqTzFYR3R4NEVSN1c3R1V4enNNTUhl?=
 =?utf-8?B?MHpCZnRRb0JrQ290TnJwRHFpaDJTME9mWVZEZmZiaTlzYUpCL3RHMzFYVHR2?=
 =?utf-8?B?V1NoZ1U0YVZyalk1WGc2RjF3bzdVczRHQzY4MFd0Umljc3RKaVlvdzJBVCtk?=
 =?utf-8?B?YUU5czJvSUJpcjFtU3NIV25aZWFrajkrQmdsbC9zOEdVM25VcVJwcTZCSFdM?=
 =?utf-8?B?ZVMrVDJFQkdOemxLMi9QNEVTazc4MGJiQ3dUV2UzRWxHVXBkOVRIZWhjSFpu?=
 =?utf-8?B?SkhhclM0b3lIQVpnN005ZUtqdmE3dE5VWmVleWttK1BWdWtUMHZBeGZCN3Fi?=
 =?utf-8?B?Zkg2WVR0WmdwZmh3U1ZEMzdlcUViN1E1aVp1Z3ZYOGJ4SEpkOENNY096b212?=
 =?utf-8?B?MjJxT2JjL2Y4TFBLZ0JWbTJTOHdVU2dqdHFHenpEZkZmMGVmTGNlSzJBdllL?=
 =?utf-8?B?RldUckEyMk16UGo5b3ZQdCtEQTBONjRYb3lNUVpaZ2FmYWdrTnE2azRvM2VW?=
 =?utf-8?B?Qmh4SHBJZHY4SGdSWi9ub1ZzcUNQS0FQbjE5SWZLMXQ3ZmtrYkp3NGRCdTVW?=
 =?utf-8?B?cTlnYVgrVDRjS3RrMG9GS3RmaVY2eUZmK2VUYnlVM21hRlRsNnRNcGJoWXNF?=
 =?utf-8?B?dDJaRWtMdDQ2M002Nmh6cFZCUHdNUHZmbGZOMTZna2ljSUZGOElwM0tNVWFi?=
 =?utf-8?B?WldSUi85M1pwMEVrN0c4eEhRNDFXWVdYS08xVkoxUEtyTXo2dTQ4ODQwMndk?=
 =?utf-8?B?WVNSWUs0N0l3bTEwSWFaS2hBY3FsSHErTWZvdHhoTy9hTVBwaVU0VkxkY2x3?=
 =?utf-8?B?TFg2ZkkycGRkVGN3M3ZOd1Rrb0dhcExhUksrKzdKb0dSZWwyVXdNRFZjRVl1?=
 =?utf-8?B?NkFqMzFtR2t1bnhmSDk3QlBRdDRaWGpnY3dOQ05DZDQ0dWdLcEhINEdMSU9X?=
 =?utf-8?B?dUlVL3gyb0hNWnpjbXlqREJ2QStDMHdsR0xSQ3lYeE80QkpNekdCNkt3dXA0?=
 =?utf-8?B?bGcwOE9yR1YrMFFEQUtlS3VzMXJwaG5JNFhmOWJkT2c1YTRKQkU4OFlXQ0hj?=
 =?utf-8?B?WlE5VkNWM01hS0V1RmcyUG5YWTRTQmMvRjk4QVBTei9ad3pZTEQvM1lXYjlL?=
 =?utf-8?B?RFhoUm5nMFY2UnRXeE5PR2UxU3RpclF5TTUxYVU2bE0reGx3ZW5tRGhRVFNq?=
 =?utf-8?B?eTlOdDRCbnBhbzNJdUN0Rm5rKzB4SDhHTXZHVHFvTWhVRmxVRXAramdESlp6?=
 =?utf-8?B?TUxDeENzNmZiQzcwb3NxYUp0eTlkOVVMdFhqOFBabG1wV1grZk42N3dKeXlv?=
 =?utf-8?B?RGdUbTRta2JLb1JLUVVxYmxseXc0OVd5YmE5Z2JvZWVDOGRyRWdySjRvWWJs?=
 =?utf-8?B?cENjUlBVakd3MExXTjhIb2hEVFhuQ2VKaWowU2N5akQ3dk52WUZkQS9tNytB?=
 =?utf-8?B?b3VYQXhpaTcwb1BkaDBDdkFpRWU2cllxcHFtV0ZGMk5hTWJIQVJ2RW0zcUMz?=
 =?utf-8?B?RVdQaDdsWFhsekFGcUxjVWhvRVVGYzdaOFhFQVR5SkJaK0owUjRTeVVLUVM5?=
 =?utf-8?B?L2RJVkdsOUdFUkkrSjFLT1lCMU81MWpxOWt0N2djOWFHcEc5WDI1NmpYaG5m?=
 =?utf-8?B?bFo5YjR4Q2JpL29mOTkrak9RTVVRSmhmWENvdFZJR2JPQXBkZzI0aXpXd0J3?=
 =?utf-8?Q?6ha9ZozuybNhhdvacQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eFZERVRselArdzlKQjZseDRaZC8zYzJNYnpwT082Y2xCNitaZGRQMkJnNnVs?=
 =?utf-8?B?bHBwVHh1ZldsRkFMUWxyRVpMZUpTaFpRcmJzOERxN0lxcmJLWHM2OW1uaUtz?=
 =?utf-8?B?M3NHaTdJeklXY2FNWjdSRUx3NjRSa3E2TExLVUJST0tDd2tRUkhlRGpFN3JH?=
 =?utf-8?B?WHc2NnBZTkZya3BVa1VDcnc4K3pjK256OTBSbkJJNno5T1RjS0YwNitMSkFU?=
 =?utf-8?B?VS9rMGVxRUUwMzR3NGNoeTZhUGVjREx1amRGUmlYdkdGenN3VDVENVFka3kv?=
 =?utf-8?B?ZVdZY3lvMU1Sc09SQlRiME96TElhdWcyTUpzMWcya2VaOGIzbkkvWHYvVzZM?=
 =?utf-8?B?NFNqOG5iMWp2MU1pOENhb1RiOHV2ODB0eW9XYWk4QTh0REJQS3hMNk93NVhN?=
 =?utf-8?B?T0FNSXYrbWMvc1hMT0hFQzQ0djdCd0Ewd1JyUnVYQldiZEtDSk9rWHdjdlJs?=
 =?utf-8?B?N3dHcDZPNGtFY3EzdFdsTzhxc09aZGZzV2FrY2MzTjRUaXR3UEJiR3hORlU0?=
 =?utf-8?B?RzAvOWh2b29WSGNmZ0wvd2tWZDhzNDV1RXZsa1psYWRGazBqMVg0RVFCUzh0?=
 =?utf-8?B?dnJ3aWkrMW1LVzFmN3h6LzBWU2JMVmRKSEZGSHVlR0V0ZE9qd0xWZW8wVXE4?=
 =?utf-8?B?RXhpNi9JQldiTCtuRlVOc3hsd0pJVTNHMWZDRGtBZklkSjZ4K0RjSmY3QmJV?=
 =?utf-8?B?RlZaaDVwMXVUNUNBL2cxRDQzTzdvQTl5eEMvdFRFV0c5b29HSWtjWHNPRlpx?=
 =?utf-8?B?UmNBdGhBcCszeFJsQU8rcm52TXFmbWprZ3A2U2lqTGNSczJBOUM5TFpaLy9m?=
 =?utf-8?B?cGVQSkFPNm9mYXNyU1pJQzAxZUE4RXlyNzVBQ3B3NWhZTzN3c3dxM1ZWY25x?=
 =?utf-8?B?WVhEZlBnTktGdjlkdmJIa1daRTJtY01MdFBITXVGSVhlS1hsRE8raWRIc0xM?=
 =?utf-8?B?dlBVQ2RQNWgzQUpLR3BBN0hhSERrZVpsRlZ4RWs0ZEVlRnNmaDI5eXZodnJF?=
 =?utf-8?B?MWQ3cS80cnJLTEo4TS9FWC9NeFpKRFhRTGs3Z3ArMCtFbytGZktFNlhkK3hu?=
 =?utf-8?B?d0Y4WlJvWTh3WnlhQVlaZFRlZy9WWjZVZkZCa3V6UGlaa3NPM1RqN0hOUTVX?=
 =?utf-8?B?cnJod2oyZ2RNUzh5cVByMHpOQVgrOUhRc1JYMk56dWpzdjlqU01JaTFDV1kw?=
 =?utf-8?B?d1VzYXdERUVFOW5HODFJa1BYNWJVWWRPYkJCeXd0VklISm5nclN1eUV1R1E0?=
 =?utf-8?B?dXVaWnlUK2JVNm5VMGxtdXI5RVkxL215bEJ1RDdIWk9CbG5MUEdBa3dHdFVs?=
 =?utf-8?B?eGp5NDRaclU3NXVoZ3I2ZUNqR3Z5VWNCdVlkMXBSdWhYVzg1eU5UaVp5ZHJX?=
 =?utf-8?B?OHVrdDc1dHM2QVZhR0o2Z3cvcG9UU2ovYXpRRU1WTlN3V0Z0SHg3TU1sQkpX?=
 =?utf-8?B?STF6T2NaYnpFTXh3RlNuWjY2NnBhckkxRG9zU040N21mOFNZbk5GU3NkdnNB?=
 =?utf-8?B?bWJ6NmJNejRLdUd2dmdoUkt4SzRNNk5HcERKbEVyYUFMc1FRTHdHQlcxcE9H?=
 =?utf-8?B?amp2V0crZTh3MTl3andOM3gxSWE2RnZKWDRJR1R2eXhTNzNya2lLUGFtRkgr?=
 =?utf-8?B?bzR6MmJkcjZWV3BFMjNnbEsyUXdhSHZUSGppWTVEM0pRRFFQRkZ6cmFlcUhO?=
 =?utf-8?B?RndNSjZuL3lKUVNMMzM3QVV5OXNMMzh6NllYYTZWVDZrcHFvT2VRWmxCa0p0?=
 =?utf-8?B?YWhCcXFveTNvdGZRcmRFa2NiSzd6SHpMSitKMVNzS0FkZGZWUm9ndHBaTVdF?=
 =?utf-8?B?OEZodDJUcHNDUFVGbDh3ZmQ5Z3VoZWZGZ3I1Y3huWVI2Z0crclptZHI1TXJJ?=
 =?utf-8?B?K2w0dFQxVmRCV3NUdGhpaVF0SDBDc3laZzRGaEVyMyt5N2RnMGplTVlFMXJX?=
 =?utf-8?B?TzQ1ajVhblB3cEtuRE1pY2ZIMEx0YmdDYSs4R0h3L2tVTUo5VFpORWxrZVE1?=
 =?utf-8?B?R2xNL0NqUkF3Q3c3V2c2ZFlyT1BHbnJTRnNTMlNsK3ZWME5NV0pqenNoWTUy?=
 =?utf-8?B?clNQdlBicFpoTHZ3YVRXQjJ1V0U1RmdOTkpqZmRhZENQc3NuVFVhTzRzUTJF?=
 =?utf-8?Q?WPq1UQFVZenauuDt+Uu552I1t?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c81d1d-ed45-4996-46bf-08dcbc0cb28a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 02:56:30.2055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kUUk2hta+dJHzFYvVbgTALArAwpLqNGLS0UTZoGDdduRdT02NRL2LWh8miZ/MNXQO0aD/P2vbdVD6pVxJ2eOJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7197
X-Proofpoint-ORIG-GUID: x2qcrHpQkfHUEDFM1uLvseYJDFW2s2ik
X-Proofpoint-GUID: yjpa57xF1ZyRbQMUzw-E_HWP8hFkrfeh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_02,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408140020
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 47E2p3Os029749
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 02:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203301

The github issue you referenced here is not an issue that tracks this=20
test failure. It's an issue that introduced the original commit, and has=20
been closed. If a problem is 100% reproducible, at least some open issue=20
should be there for tracking to validate an explicit skip. As far as I=20
can see, tests that were skipped are rarely revisited.

Also, looking at the issue you referenced, it seems that the problem is=20
that we're using editline instead of readline as the default=20
PACKAGECONFIG. It looks like that this new test case correctly reveals=20
our specific configuration problem.
PACKAGECONFIG ??=3D "editline gdbm ${@bb.utils.filter('DISTRO_FEATURES',=20
'lto', d)}"
PACKAGECONFIG[readline] =3D "--with-readline=3Dreadline,,readline,,,editl=
ine"
PACKAGECONFIG[editline] =3D "--with-readline=3Deditline,,libedit,,,readli=
ne"

Can you try using readline as the default PACKAGECONFIG and see if=20
things work?

Regards,
Qi

On 8/14/24 00:41, Trevor Gamblin wrote:
> Python 3.12.5 is failing a newer ptest for reading/writing limited
> history. Skip it for now until a proper fix (if any) is determined.
>
> The new test was added in
> https://github.com/python/cpython/commit/263c7e611bb24715e513d457a3477a=
61fff15162
>
> The GitHub issue is here: https://github.com/python/cpython/issues/1211=
60
>
> The aforementioned bug report suggests that OSErrors like that show up
> when using the GNU readline-based readline module if a workaround isn't
> also incorporated. It also mentions a new readline backend will be
> available in 3.13 that might help, but that won't be available for a ye=
ar.
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
> v2 adds extra info in the commit message and carried patch about the
> source of the test failure.
>
>   ...t_readline-skip-limited-history-test.patch | 40 ++++++++++++++++++=
+
>   .../recipes-devtools/python/python3_3.12.5.bb |  1 +
>   2 files changed, 41 insertions(+)
>   create mode 100644 meta/recipes-devtools/python/python3/0001-test_rea=
dline-skip-limited-history-test.patch
>
> diff --git a/meta/recipes-devtools/python/python3/0001-test_readline-sk=
ip-limited-history-test.patch b/meta/recipes-devtools/python/python3/0001=
-test_readline-skip-limited-history-test.patch
> new file mode 100644
> index 0000000000..851ddd571a
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limi=
ted-history-test.patch
> @@ -0,0 +1,40 @@
> +From d9d916d5ea946c945323679d1709de1b87029b96 Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Tue, 13 Aug 2024 11:07:05 -0400
> +Subject: [PATCH] test_readline: skip limited history test
> +
> +This test was added recently and is failing on the ptest image. Disabl=
e
> +it until the proper fix is determined.
> +
> +See also: https://github.com/python/cpython/issues/121160
> +
> +Upstream-Status: Inappropriate [OE-specific]
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + Lib/test/test_readline.py | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/Lib/test/test_readline.py b/Lib/test/test_readline.py
> +index 91fd7dd13f9..d81f9bf8eed 100644
> +--- a/Lib/test/test_readline.py
> ++++ b/Lib/test/test_readline.py
> +@@ -132,6 +132,7 @@ def test_nonascii_history(self):
> +         self.assertEqual(readline.get_history_item(1), "entr=C3=A9e 1=
")
> +         self.assertEqual(readline.get_history_item(2), "entr=C3=A9e 2=
2")
> +
> ++    @unittest.skip("Skipping problematic test")
> +     def test_write_read_limited_history(self):
> +         previous_length =3D readline.get_history_length()
> +         self.addCleanup(readline.set_history_length, previous_length)
> +@@ -349,6 +350,7 @@ def test_history_size(self):
> +             self.assertEqual(len(lines), history_size)
> +             self.assertEqual(lines[-1].strip(), b"last input")
> +
> ++    @unittest.skip("Skipping problematic test")
> +     def test_write_read_limited_history(self):
> +         previous_length =3D readline.get_history_length()
> +         self.addCleanup(readline.set_history_length, previous_length)
> +--
> +2.39.2
> +
> diff --git a/meta/recipes-devtools/python/python3_3.12.5.bb b/meta/reci=
pes-devtools/python/python3_3.12.5.bb
> index 5665c90fa9..cc2e14baf0 100644
> --- a/meta/recipes-devtools/python/python3_3.12.5.bb
> +++ b/meta/recipes-devtools/python/python3_3.12.5.bb
> @@ -33,6 +33,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/P=
ython-${PV}.tar.xz \
>              file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as=
-failu.patch \
>   	   file://0001-test_deadlock-skip-problematic-test.patch \
>   	   file://0001-test_active_children-skip-problematic-test.patch \
> +           file://0001-test_readline-skip-limited-history-test.patch \
>              "
>  =20
>   SRC_URI:append:class-native =3D " \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203289): https://lists.openembedded.org/g/openembed=
ded-core/message/203289
> Mute This Topic: https://lists.openembedded.org/mt/107879487/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
Qi.Chen@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


