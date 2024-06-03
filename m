Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54834C25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 04:23:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.75414.1717388603790432316
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 21:23:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=688417d902=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4533snEE030419
	for <openembedded-core@lists.openembedded.org>; Sun, 2 Jun 2024 21:23:23 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yfxwys98a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 21:23:23 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4534MPGS004498
	for <openembedded-core@lists.openembedded.org>; Sun, 2 Jun 2024 21:23:22 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yfxwys989-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Jun 2024 21:23:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCnOrTqNrFwqXEIimfAesQYYlKkOji8wK5orAV56O7QTzYmeZVcCw9b0f3jSGpbzNnIkdDBp276QizpJSM5XAmLPYqy5KN49mDvHy2t/QnzjKVYppw9+s48zavf1GHMYa5CKHX9ASBJ8QJ8NmZenRTxFjoHxGdkVqNzzdu8nxmU38xy96eMzB04Pgu/pbBsUziRkjRzsU51XmHX23YkTgzbGMnOeR2q0d2L2IGSPTcNnVjSFO1C1gfWXx7F0cvBnKcvwowCsZl/phJLlRXHEPxA7xFrn/8EOwZHrwmaXaXtvtFA6m4vL0q3JQrDcTFd8eEpERArGfKqqIIZ11LdXtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jw4YFP1Ta7q2fmO1ZqEDKBOM1AgOUN/Hk8C18x60580=;
 b=ggDju5Lv8yhN7+0CFN/GsfYVHvB3pyuRjB1iYj/esYdYxoebd7SRqiwyDd9aMjXLJmxG0pN+6vvs63s0UHKInHlNO5BP/zX4iJCGb7dKX4P46quy+HX61qcVTBM+WM/ckVn35nqDln32RqpdRDMkkkTABMrVWTB2askaYehO8hRCdy75zvUTK55h2bed5BgTr15qUyJpZepo3ql5lT6Cc00TV9/uUXyu9PnNkgm5hK8k0t4NaBnHmcaX0lxbMMYSjLZPuF526WLHlu3x5KXGNQ/U8onmc0bQsIzOFjViiXOLJpVJmXh35IIC496mkoAO9IeyzfRdYg4STuSaMadupw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB3063.namprd11.prod.outlook.com (2603:10b6:a03:89::11)
 by CY8PR11MB7244.namprd11.prod.outlook.com (2603:10b6:930:97::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Mon, 3 Jun
 2024 04:23:19 +0000
Received: from BYAPR11MB3063.namprd11.prod.outlook.com
 ([fe80::25e9:e6a:756e:dc99]) by BYAPR11MB3063.namprd11.prod.outlook.com
 ([fe80::25e9:e6a:756e:dc99%5]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 04:23:18 +0000
Content-Type: multipart/alternative;
 boundary="------------63JnVYKy1qm11fz0203DQB4v"
Message-ID: <4f2d2a18-77cd-45aa-a419-6f4f3f82da89@windriver.com>
Date: Mon, 3 Jun 2024 09:53:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Rust reproducibility issue summary
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        richard.purdie@linuxfoundation.org
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
        "Shinde, Yash" <Yash.Shinde@windriver.com>,
        Randy MacLeod <Randy.MacLeod@windriver.com>
References: <2e75c6169cac05273b3edde52ea820506ce9d3fe.camel@linuxfoundation.org>
 <CANNYZj_LwCwmX+aKDDEYijMLuEehiUDJbMKcFvwtpM_rQAcxhA@mail.gmail.com>
Content-Language: en-US
From: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>
In-Reply-To: <CANNYZj_LwCwmX+aKDDEYijMLuEehiUDJbMKcFvwtpM_rQAcxhA@mail.gmail.com>
X-ClientProxiedBy: PN2PR01CA0175.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::30) To BYAPR11MB3063.namprd11.prod.outlook.com
 (2603:10b6:a03:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3063:EE_|CY8PR11MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: 465128f3-77e4-4e12-d647-08dc8384e537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|52116005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dzJ2STZFODc2ZXpnUFV4Qm91WHo0R0hOazkvbkZhUFJDS25xOHpuSmxoSDBT?=
 =?utf-8?B?V0xRdjljZzFFbXBSZmtPMHdmbUlaa0ozZGNSSnppcXp6NXMwd1lQS3V6T0lW?=
 =?utf-8?B?M1h0UVRpbzR4OHJCN0VYakw5eUM1dHJjU09ielBnZFdxUG1Dc3BOTkZPRHZE?=
 =?utf-8?B?QlFlRXVsNzVheVpyQjExOVgvNEFlNmswcDFSdWVubnJPMG45cWVUT0pDaG9F?=
 =?utf-8?B?RU9GSGIrZWZmQmJTNGJBZGt4WUpRVVlzYllzNG9zR2xVVEU2dSs2NUJwS0p1?=
 =?utf-8?B?WHYySjJHZ0s0UHY4QVd6N3FpNWovL0lUaTNqTk5Ka1ZDdGFneXN3U3Rkd21O?=
 =?utf-8?B?N0trT0xzZHN6S1VDY1dCOFcxY1lQODE1SlBOOXhydWtHR09uUGNXbE5pbDdF?=
 =?utf-8?B?ZEcwOW5YY0lEYStNRGlpRzNvdSsrUUpLcUdYMkpaTysvcHNMUGJSSGxQNngy?=
 =?utf-8?B?aDRRU2RuQXIvWFN6azAvazNWNjhBSTl0VXNwaE82UDVQTEdtanhaaGthMlkx?=
 =?utf-8?B?M2VvbStsbHJlVkp4b3IwL2grK2pZdmJiMFh0S2NsaVdFWk9RZUx6NVNycytY?=
 =?utf-8?B?SEZHYTYyeUdybFVldDRocURLUWhWdlFNRXJSV0tONkxLaHYwU1VUUlBqOWEv?=
 =?utf-8?B?RFBobHB0TVovSGdNckZCSDNqeHF6SmpZU1lNRVZjN05wNndPd3cwOEJkY21q?=
 =?utf-8?B?Zy9wY3JsSjl6NXc3NlQ0N2oxOWEvMlhUR1YwenE4Yk5YcjEwY1k5T1VuV0Rq?=
 =?utf-8?B?NlNDd1F2Sy81czgrYk54Tm01WEVmS2IzRXJ3TStkTVlvNXpGa1NkZStmd242?=
 =?utf-8?B?eVNnbWt4ZUhKVWpoNzVaS0FoWGFVeVp3ZEtOM2ZaVlppNFM4VjNEcktpY1Ex?=
 =?utf-8?B?SzcvVVM2SmR2SncwZHhZNFl6dEpuK0Z1ZWNyNWV6MXFzQjNtZ09JbCtxK1ZY?=
 =?utf-8?B?eTcxem8rKytxYWJ0SjNaL3hXZ1JndVVTRno5am9McGNsMjZtUjNWdXgwTWxp?=
 =?utf-8?B?d3JwK04ycmpzcm9RMmpONjE1LzFKY0JVa1duNmIzQzIxZzdoZHlxVTlxWVlo?=
 =?utf-8?B?dmY4OXM1Wmc0dFR5Zit6WkpZTSsxYWVxRjMrM2h4alc5UERRZDFseGFadDhk?=
 =?utf-8?B?VHRodHQ0bGJQY3pNRC9pdk5ENDhlTEVZUUduSVhDUFVScVJMdXhEb2wvTHRX?=
 =?utf-8?B?di9ZQ2dWdlZ1UEJUeFEvNS9abmJZRGpMSEpyUGR6MXd6SklEdnhDYjQ3UWUr?=
 =?utf-8?B?dTUxY2ZUMk9xRGtvWUtaOXpYZFpPeGEzWDZrUU1ydkUvcUhPOWZObmZ4NVBR?=
 =?utf-8?B?YVI1cjdyMEdEVHVESm9Ta3BvWDRHU2lFUWx1QzNOTDFjaFNUKzFpSEIrcWFE?=
 =?utf-8?B?NEhZMk13MVJCK1M3dWRlSjM4QXNTMktJeHhoRGM5UUJvMUV2ZSs1VEo3NHlB?=
 =?utf-8?B?V1JVQllEbU9Hekk2VG1zTkpHbWhRMHRiMlpzdXVidFlOdTRHUHVNYUtlb3Zl?=
 =?utf-8?B?ZDYrejlRUWxjTS90b05sbjhtbmY2VEpQMTkxZnRRV1lob3F4dUdUNVhKdWVS?=
 =?utf-8?B?eW9oTW1HZ0pHNUZpcTV4Z1RkMmdXU0JhOWdhVEtyNDNDTThhT1ZTQ1RLQjVq?=
 =?utf-8?Q?GJ0rIgUgrT9QUJCqdT6Cvt3k/YmyZuP/0vS58LVNIz3I=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3063.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(52116005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T3lBSENjaG04QzBDTFdIZ0N0OStWeFdnRlRHOEZVK0ZCeHJSdzhwOEZWa1dk?=
 =?utf-8?B?bnY2WXhjSlEyVnFQc1N4ZWZqNTA1WVZDN3hBME5oT3VPazl4Tnc3d3NVWnBv?=
 =?utf-8?B?YnNOcWIzUGdyQi9Wc3BoQk5VYmU2SkEvOTE1S0EveHM1SU44YlNmbnkrcTd2?=
 =?utf-8?B?YlRLMW9ySTdkWWZPNGRnS3VzRXMwYXRjT2JBYkVsV3VZL0h5Vms1UWRqM0ZR?=
 =?utf-8?B?enFkT3RUMVBWSEVkVTMwR0E5d3YvWWwwM1JNTnQyZnQvYnE2RlVpQ0FxQVVM?=
 =?utf-8?B?WEgwNWI1Ti9ObTlJU2kvai92TFo2cmdUQ04vWnJ3VEFuOTREbFZJL2tJVjNj?=
 =?utf-8?B?eTJKV1p5RUFUUWdGcitCRFJMTzlFekxHWHVEekhsbjZQUHpXMnhxSjU3UEVz?=
 =?utf-8?B?NmFTeHhDL3NDeCtGeEJnandNa3lZL3RXM0E3bW91N0hPR1p5SU5RdjlMRjN6?=
 =?utf-8?B?UzBpdGl6Ym1OYUNRc1FNb3BwZ3hpbDNkdDdPMXozQVVnbTUwUVhCNG9BbkJ1?=
 =?utf-8?B?algxY21vWWRIUksrYUNzMGFZVFJuQWVnYnEyL3ZSb0Z0bFNMWEgrMGlSN0o1?=
 =?utf-8?B?UXJwRHYzTnc4VkdGMVRaTjFFLzdIZ285RXZ0djhqYVpibS9YL3J4RXgyaTJ1?=
 =?utf-8?B?YVYyT2hpcXpmNFJ5NXNtREorVXVZVXNETGxzUU9uSTJ5S0c1TmtXTE1SeUtT?=
 =?utf-8?B?endua3RQb0ZFU2JoTXc4ZElGa1o3c3FBVXEvL25kU0NnaEgxd0gxb3ZYQWVH?=
 =?utf-8?B?eUdaVnBwWXppdGM4L1VuV1hDalMwTlp3MzVja1IwNUsxVjFIeWNBcHNEYWZJ?=
 =?utf-8?B?akUvd1Zyb2dyR1YzbHRtWUZPbCtjN1licVpwZE9YMFVaenFzN1BMMW84QUZa?=
 =?utf-8?B?QmNnSFJ6dlUrN3lxeWJ1aUdWOUl6MDVrWkpndmFFcWNBM2tzVmV0VHUrRTZY?=
 =?utf-8?B?N3g4M3RvT0xOWnZLc3RwYmM2TU9RSlRtRjlaMko1dkIwOUE1OWpBZkVSRkhU?=
 =?utf-8?B?ZTUyaExOU3NzWDcwblQ0R0lOajY5OXZGVHVBa0JxTDliTU1hWEtGMFZJa3VH?=
 =?utf-8?B?M3Y2cm1XdWtOK1BURWNmbFYzeEUrc3RnaFpjQUZzMkpwVE5yTnZJdTNNR3Fo?=
 =?utf-8?B?aUpFMXZsaUg4ZVNUT0FWcnQrRnBiQmRIRTNWa0VzcGs1aFk5SXdTSFdpUjNs?=
 =?utf-8?B?RWtVZXhMOXNmYmV1WlpjLzk2bXdLWjUzWFphTjIrTndid0JzOHYrbS9nM2FT?=
 =?utf-8?B?UllMNThLb2VnTHIvUzkvSk5STW1XSk4yNWVUS0tBVis0b2R6MDlmUnhsaGlM?=
 =?utf-8?B?aWprUUxDb09PZFlDRFZtZEJyVkZSTGE3ZEVab015VGxJUnpZWXRoQWVvL2ox?=
 =?utf-8?B?bWE5MnV2UHdNb1NSQkFQdUQybnZzaGovenByNDVKM1luNS9ZQ294ckRtODJS?=
 =?utf-8?B?NmxySFRzSk9JOEpDVVkrbG04aldrUFhDNFJvY2dzZ0ZiVEtjRVVkSWpSZ0dE?=
 =?utf-8?B?bm04Q2FjWncxbnA0VXl6MElvbmNwZGR0K1Fzd3liUnZ3VlFGaWxkT1FSY21u?=
 =?utf-8?B?WTIvR0RQbzJPVlM0ZjFJaUR2Y01kZDEyemErTkt5WFNQTy92Um1KcHRzZHdV?=
 =?utf-8?B?b0xUNTZpMlFVQlMrR21XS25KSUdEdUszQlkzak9zRy8yK0p6UzJTMVVkblFB?=
 =?utf-8?B?aTMyR1BpZXpjYm4xSHVnWWczdmhseENYRHk0VTl1TUM3VENxSDVuN1c0dFVC?=
 =?utf-8?B?NUs2ekpqODIzWU0rbkI1ZVk0eE5HZE1hRVNuWUU3SUxrOE9USXdqckJndjFp?=
 =?utf-8?B?ZHArZ0RWU3NxdUUxN0x4VWFlekgxQW5hUFN0M3ZpdXJWZ2NsTWF3ZGgxTVhj?=
 =?utf-8?B?NlEyNGcxRVFzbllaZkhKN3pucC9iUTZSUHFGa0tDaTBDWTNlMEIvUkgvcUJ4?=
 =?utf-8?B?TWh1aGpVY0ZnUnQ3a2JOOWxqMjJCUG5zODRPa3FVSG5Ham0yOFhWR08vVDEv?=
 =?utf-8?B?STVrSStIZWlmcFR2Q1RRS0RLRFMyR3lqZ2s1emNVZThMaGdVVWlaRWJ6VFIw?=
 =?utf-8?B?UlhSdnJuN2djRHFDSUpjeGs0Y3hvQnExSEt2T3hwQ0FMM2ZVVDZZbW4zZVFF?=
 =?utf-8?B?QXBWVjZ6MkIzanN5bmV4bVlLYTh3WnlGVlcvSzg1SmZLL2NlSVRJakFIdzlJ?=
 =?utf-8?B?alVNVG9nMzFiMVNPQ0p0VkorMzNDTjdQd0VzbUxjYlozYlQyWTlMaFo4ZW9E?=
 =?utf-8?B?QmNSa2o3NzNvZitEVWJUbzNib3FRPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 465128f3-77e4-4e12-d647-08dc8384e537
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3063.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 04:23:18.7319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWmPlsNZ1+mOh7cOuZzSOjpMGZ8q2qVnnAioHxppHR+JQCLTercKXQuzqOrWCFjq1Fvqa9QcLjSn3gjbYy1DmymcT920U6YUdXNEFVxDxUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7244
X-Proofpoint-GUID: Qjvaz2Br4a8Ipq6-zqiek760GOtHw0F3
X-Proofpoint-ORIG-GUID: 2KwpV9q8vbw7NnUU_Tr_xz-rIuHSMm6K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-02_15,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2405170001 definitions=main-2406030034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 04:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200231

--------------63JnVYKy1qm11fz0203DQB4v
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 01-Jun-24 15:57, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Fri, 31 May 2024 at 15:28, Richard Purdie via
> lists.openembedded.org
> <richard.purdie=linuxfoundation.org@lists.openembedded.org>  wrote:
>> I've been asked what the reproducibility issue is and what data we
>> have. I ran a couple of test builds on the current autobuilder and the
>> test cluster. I added in the diff at the end of this email, just to
>> limit the test to what we're interested in.
>>
>> The test on the new test cluster passed:
>>
>> https://valkyrie.yoctoproject.org/#/builders/37/builds/36
>>
>> However the build on the current autobuilder did not:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4876
>>
>> and the different binaries generated are here:
>>
>> http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240531-l872m0ip/packages/
>>
>> We need to get to the bottom of why these are different and the test is
>> sometimes failing. Any help appreciated!
>>
>> It is unclear what we need to do to reproduce the issue on demand.
> One possible lead is in the original attempt to fix this;
> https://git.yoctoproject.org/poky/commit/?id=321aebfa281bd28e368c684ece57867f6bd0cbe7
>
> It is not yet clear if disabling PGO makes things reproducible, as the
> same commit also prevented the non reproducible binary (rustdoc) from
> being installed (with the demangler line).
>
> PGO as the culprit should be either confirmed, or ruled out first.
>
> If PGO indeed helps then the next step is figure out how to disable
> (or tweak) it in a way that doesn't cause issues with chromium:
>
> https://git.yoctoproject.org/poky/commit/?id=694b85a217209787fe8c503a4b697dc6c2bfbe84
Hello Alex,

Initially we did enabled PGO & rust-demangler options for rustdoc 
reproducibility.
https://internals.rust-lang.org/t/rustdoc-binary-is-not-reproducible/20027/5

I did not get any info (from doc or community) on how and why optimation 
is affecting rustdoc binary.
https://internals.rust-lang.org/t/rustdoc-binary-is-not-reproducible/20027/6

However, later we learned that the '/rustdoc/' is reproducible without 
PGO also, and so removed for chromium project. And after removing PGO 
also we've not seen this rustdoc repro issue on autobuilder.

The issue is not reproduced on my end to confirm the PGO is root cause 
or any recent changes on rust recipe causing the issue?


/Sundeep
>
> Alex
--------------63JnVYKy1qm11fz0203DQB4v
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 01-Jun-24 15:57, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj_LwCwmX+aKDDEYijMLuEehiUDJbMKcFvwtpM_rQAcxhA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Fri, 31 May 2024 at 15:28, Richard Purdie via
lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie=linuxfoundation.org@lists.openembedded.org">&lt;richard.purdie=linuxfoundation.org@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
I've been asked what the reproducibility issue is and what data we
have. I ran a couple of test builds on the current autobuilder and the
test cluster. I added in the diff at the end of this email, just to
limit the test to what we're interested in.

The test on the new test cluster passed:

<a class="moz-txt-link-freetext" href="https://valkyrie.yoctoproject.org/#/builders/37/builds/36">https://valkyrie.yoctoproject.org/#/builders/37/builds/36</a>

However the build on the current autobuilder did not:

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4876">https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4876</a>

and the different binaries generated are here:

<a class="moz-txt-link-freetext" href="http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240531-l872m0ip/packages/">http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240531-l872m0ip/packages/</a>

We need to get to the bottom of why these are different and the test is
sometimes failing. Any help appreciated!

It is unclear what we need to do to reproduce the issue on demand.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
One possible lead is in the original attempt to fix this;
<a class="moz-txt-link-freetext" href="https://git.yoctoproject.org/poky/commit/?id=321aebfa281bd28e368c684ece57867f6bd0cbe7">https://git.yoctoproject.org/poky/commit/?id=321aebfa281bd28e368c684ece57867f6bd0cbe7</a>

It is not yet clear if disabling PGO makes things reproducible, as the
same commit also prevented the non reproducible binary (rustdoc) from
being installed (with the demangler line).

PGO as the culprit should be either confirmed, or ruled out first.

If PGO indeed helps then the next step is figure out how to disable
(or tweak) it in a way that doesn't cause issues with chromium:

<a class="moz-txt-link-freetext" href="https://git.yoctoproject.org/poky/commit/?id=694b85a217209787fe8c503a4b697dc6c2bfbe84">https://git.yoctoproject.org/poky/commit/?id=694b85a217209787fe8c503a4b697dc6c2bfbe84</a></pre>
    </blockquote>
    Hello Alex,<br>
    <br>
    Initially we did enabled PGO &amp; rust-demangler options for
    rustdoc reproducibility.<br>
<a class="moz-txt-link-freetext" href="https://internals.rust-lang.org/t/rustdoc-binary-is-not-reproducible/20027/5">https://internals.rust-lang.org/t/rustdoc-binary-is-not-reproducible/20027/5</a><br>
    <br>
    I did not get any info (from doc or community) on how and why
    optimation is affecting rustdoc binary.<br>
<a class="moz-txt-link-freetext" href="https://internals.rust-lang.org/t/rustdoc-binary-is-not-reproducible/20027/6">https://internals.rust-lang.org/t/rustdoc-binary-is-not-reproducible/20027/6</a><br>
    <br>
    However, later we learned that the '<i>rustdoc</i>' is reproducible
    without PGO also, and so removed for chromium project. And after
    removing PGO also we've not seen this rustdoc repro issue on
    autobuilder.<br>
    <br>
    The issue is not reproduced on my end to confirm the PGO is root
    cause or any recent changes on rust recipe causing the issue?<br>
    <p><br>
    </p>
    /Sundeep
    <blockquote type="cite" cite="mid:CANNYZj_LwCwmX+aKDDEYijMLuEehiUDJbMKcFvwtpM_rQAcxhA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Alex
</pre>
    </blockquote>
  </body>
</html>

--------------63JnVYKy1qm11fz0203DQB4v--

