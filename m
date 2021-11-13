Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01847C433F5
	for <webhook@archiver.kernel.org>; Sat, 13 Nov 2021 16:49:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.657.1636822196791449828
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 08:49:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=B6BgO28W;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=69513d83c9=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1ADGiWXi009300
	for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 08:49:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=SlKJwJWyys0EPxxdrrBfYM/5qGKVsISJSPkwkl9lM5M=;
 b=B6BgO28WgI6hhijjMJDe8dREDalrEHs27Vmp6qMwYuAIpiurFSUBumGfTuu1LrscqzdP
 YZS3adYxURLqUJAZlSIKah7pHW25jWJRRpAzPaaqgW2hOlDPgqgS+qOiIIGG/yaJbzuG
 jTTLcg6o8TIjApGDtSUMq7NQcwo+TVvvnTIFO+gHY1+iCvLP6Xh5t38hmtysUSqG/o7d
 h+STR/eBm1uXQGSSodwMsxeloilQTeqTwB4mTmzQGBcDTvLzPeEKFMGZK8Xy7BJuokhm
 z8/2PR9h+fq4Yk16wp7G4bdT9KWJuKJuSLpqCWP2herygiG+knqxP5SXjQZfv7YW38TB 8Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ca9h8083n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 08:49:56 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1ADGntmM019473
	for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 08:49:55 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ca9h8083m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Nov 2021 08:49:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDG7v3FOaveKEFldv3DQCm4N9hzTWi0lcJmYlhYuzVDkR6zT2rbo0QckMGIW07KEBZGu7w4GH5uEgm4CnTjHlHzFUIDwKvHD1MIglGF3dg7+J2xrcqiHKTk0UiUknl8FEfg00BvfUFBMSPxhUNeBsti1T7JpjcrkBboy49Llwj+oimEwtO255FyuUC6kaefp54Z+ZOXG2pp4ovtsWMMw/Wjy+ba9naMBzmgGpNrWE7tNGs8g6vGySkLsAaMMUCe9b+do/TrbOu47yH0GkzToJJq5BQrvf4BXctfsEp+P3nwpYuidj4i63MNKa2DzLKw9TAWGrKVrac1fD3VWyo+iEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlKJwJWyys0EPxxdrrBfYM/5qGKVsISJSPkwkl9lM5M=;
 b=czrXuoQC5bv5BBxvnWc01cAKdnjrtibOzb31dlbkJWGJvpXYYS2aIs1FgyLgjA3xxy8aXMEw3LViHydnwoeHAy4wy/AYrW8FZnETSLe3lRjSeF+Yv1hFllEo7qKM3Qi9h20qqshbK3gYdvTgKceFziAH/CsNYmyWVTjfKcaOqZaWbDsTEQEzFn1oJjJMqYeA2tP2BLIyPQn15vIpDJD2vgHCrvmjM/Dom6jgZDwFWYBHkz6xKDLLEGDftvX5U+kTp8q3RVbpxRlq1NoRnc8F1uLBj1mWQfiCMhY3cn++uptLM0i3vjfe7V4Mbxk6JY4aGINSijJP7yLz2CVSspJOoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1485.namprd11.prod.outlook.com (2603:10b6:301:d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Sat, 13 Nov
 2021 16:49:53 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4690.027; Sat, 13 Nov 2021
 16:49:53 +0000
Subject: Re: [OE-core] [PATCH] python-numpy: move recipe to python directory
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com
References: <20211113134505.353043-1-yi.zhao@windriver.com>
 <ba2b422b552fa9690698041e4b8199a115b2a3dd.camel@linuxfoundation.org>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <c8223a95-2d98-a95e-91c7-201923af9772@windriver.com>
Date: Sun, 14 Nov 2021 00:49:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <ba2b422b552fa9690698041e4b8199a115b2a3dd.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: HK2PR0401CA0020.apcprd04.prod.outlook.com
 (2603:1096:202:2::30) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from [128.224.162.174] (60.247.85.82) by
 HK2PR0401CA0020.apcprd04.prod.outlook.com (2603:1096:202:2::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Sat, 13 Nov 2021 16:49:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d34ecd0-4fb7-4060-5113-08d9a6c59d36
X-MS-TrafficTypeDiagnostic: MWHPR11MB1485:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB14850829D75EBD51D8F54B24F9969@MWHPR11MB1485.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:469;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PtM5XwbwzkPnUXKq7x+qxtVSqcMJuMForF8svrUyyyE/Gki3IRge3iXULAGevHDSe1Krz2YGUfp5F4y7RBvB1Q9c3La+Ua8rycSIg6geuHT2kFTBtDZgrUv6cB82xJGL/4m8yjED+0NtnwbS0SU7LtsZTYQ3Lp67JLD8cTT4bBer4W14Yl1nTIpb8ONZzJttUfo51jLrszZxPRDi4bbOjgT0aGtLkCj4GEERgMdEBpEsUBQHuYrWWXP03mIb9+hv9zVJTvwMTZOvpGYjre4V+yeytsn3SbAxjJ3j8VQeT3d7+bzxDQSJ0fsFEeoPofAWR0FTShJT+75V2gYRct98hF5CokWgwj+PgBH/bsG79hNhtOpziU4alOpeyLbF4yILh1eJDPr4IgLyZZoqo8+GZQWYRGl7QmllCt6WQ1Uefq66UNJtIXRV939gmslUS2YKDQs9ZoE+lCcvnutx0cAuA5jMstxyK4n2K+tdO2cW7fVSacUkS0lgUUHSGDB8KqCjl3OaZCKytyRIMeJfTv5RMNUYnTEY7SMOCHvxaoMr1g/J5AtMIx9cQzAP75a8SX7CeXAVsrNMcUCi1/N+saLmIKIafAg8QUaT2oPher+ZwO4DP0VxJayby1WMBNLMA2uEzOtX5tv5ka3poY6rDiTlIIUgAwuiIeuJPD3uSbt6CKe21X5lD7izwnwpZa9R/w5Prtms/DIiAlcXwEiVU0i48RWexHizMHmqyKByVyy0NgvQ3BLmOJfMTUpLaDcy1RiHe3JvyndPeE2O8wwb9qc9ymcrSxLp37IHK46K5Qk9H8qm7DaH8qC4OiMb0d3q9VdSZRbAMus1Jc3Oehv8GSVqx8UF9xpGtnC7pfLGSQw4REzw+tS+TTojT/vg0ToiCoJr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(508600001)(6666004)(52116002)(8936002)(44832011)(956004)(36756003)(66946007)(186003)(66476007)(26005)(6706004)(66556008)(31696002)(53546011)(4001150100001)(2906002)(83380400001)(16576012)(316002)(86362001)(2616005)(38350700002)(38100700002)(966005)(8676002)(31686004)(4326008)(5660300002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WSs2RWZPZTNBdnJrVE4zL0gwdVc0aVFIZDRvT0VhbGhHcno0YkdINVFSYW5Y?=
 =?utf-8?B?SjhnbTBDcExlRDRXM0NoYWY3NStMZjlycXh1NUcwZFpUYTRYNERBbW9iRC9v?=
 =?utf-8?B?WVJzRmp6TVI3MTU5aUtUd2w2eUhRb1VrdTd1Z3JxU1BJWU5qWXZhWnI5TURG?=
 =?utf-8?B?aHN5bWFjbzkzV05MNjJvL1N5S1I4d3Frd3M2VVpGRWU0aFBkYmhKR1IvaWVv?=
 =?utf-8?B?SjB5ZEErRTdTWCtsYk9UcGZKMVBFcUZidTJOQlZFR2FGV3lYZGtPWGVJNTJF?=
 =?utf-8?B?N1k0M3NQTzFCSUFlRUVlMndUcEtieUx3V2dMT01iZjVVTmE2WVVRK0FlN1N0?=
 =?utf-8?B?UVNnMGtiTlM1bXFrUElBbXE1VzUrUDJ3VXp4QXc4OE90U0QrVkVzVTFPRFhm?=
 =?utf-8?B?M2l5VVAvdzNYRm1lRzQyWUFZdlVkd2NteUI1VmRqSWRvUWRPTFNBM0NaSVB5?=
 =?utf-8?B?K0d6c1NVUWNtVWYwZmpEZnlDVmt1MHYyVHhzTHB3NXo3QTBGSy84dVRXM2JY?=
 =?utf-8?B?ZVBGUmFPaTJSeU1WRlFTV2JIZGZSQmpZbWUzdG11VXRUNW54YUloV09lcHVC?=
 =?utf-8?B?SnVxbExIMlk0Z0luUFpsME16c1RKcEZsaHJseGJGMGdhcGNCK0FCb1JhVDBY?=
 =?utf-8?B?TmZzUUl6djlaaTlBRW1YVzdvYmFaVFdEc1pKVlM2RDNIT0YvREllc2VoaWly?=
 =?utf-8?B?UjRzZ3BIbUpZWmtoeGRwMnVYVkhKa0tBWHFOQ2pMc0lnSXNLSC92dGNWVm1o?=
 =?utf-8?B?U3F0UjM3eUlzTElYN0UwZ0tvU3ZrNEl2dFYrSC9TVWhTVS8rL2tWcVpSbXVQ?=
 =?utf-8?B?dVR5bE5qZllGWkh5TUUrWWJTUmszY0tvNHBaRGUrVWV0MHlSRmFYdXowZlBS?=
 =?utf-8?B?THJaUVNNdTFza3JyZk5Za05tK3llK1dsazB3VWl6L2ZtRUI0R09BWGIxWmlz?=
 =?utf-8?B?OThrcUJBMzNCNVhWVWpwUHVlOUJtOUU5bmlvWE5wTDBSNGRZaEFjeHRDc1pi?=
 =?utf-8?B?Tzg2M0lqc2hQVWpVZnZ4bWcxZXhETzJMMGFyWEJnTFdDSlREbWRHc0NKU2R0?=
 =?utf-8?B?YmNDZDJOTXNuK3R3eGk1Z2pWdGFMMThPdWIwc3BjRE1qSEFMNlArMHY1UnQr?=
 =?utf-8?B?M0JuU2h6dDM5MmQyWmxSSjU5NVFudTU2UVBiU2dSQWUxRys1MXhzR0RyTU9J?=
 =?utf-8?B?aXk5eE42WFJuNkFvbXBRcE5rMStVSUpuaEVKRXVFVkxzRStVazdITXBkOXhy?=
 =?utf-8?B?Nnh4dUg4UUxsdGNiRkhWYndTNUJVSmZMZWFjQm5yU1pVRmdsYjVEMGNxTkdr?=
 =?utf-8?B?NE1KN0g5cU1EM1BrUlVuaTVkUTJUa2Nyd3o4a05wdnhaQWtpVFZ1YVV0cjZp?=
 =?utf-8?B?WGpvZHV5YTNpdXZUVUlqNHBCaVNVK1pWQVczTWt3ZGpjaVB0SkUzVkcyaEIz?=
 =?utf-8?B?b0I3NitUbnNETmVUKzgwbFhCcWJWdGNCOVphQ3RmL0pyUml6SGsrMGZPTE96?=
 =?utf-8?B?aWVMSWVubVAxa3BudkFwVGNzK2pjTG9JMEpsMWUreU5aVVJNczlhTHo4ZXps?=
 =?utf-8?B?ZWpKSU1ZZFBmVG05TXBHbEwzNHBHQ0NNQVRsVDk0TlM5dUNtc0FGV3BySEpD?=
 =?utf-8?B?MUU3K0svRG5QMVcrU3pROTJyemFQR0daRitVL005VzBuNHJ0K2w2ejJXWmU2?=
 =?utf-8?B?Nzl4U2NCTmxZbks4NHUzYTJjTk1hUTJqcDl5ZzNFZFRxU0p5c0QrdWRRamtJ?=
 =?utf-8?B?K3RScDRBRHlybVFDN3ppR0k3Q2VSMlIydm9IQ1FsbGlsUHZPbzlUd2JmM09J?=
 =?utf-8?B?dGdpTjJaM1JiR3BTOHMyVzZHbWJLTkhXVzREVzZ1OEVBUkptVWlZNjVVQkd0?=
 =?utf-8?B?Wm82SUlJbEdtOEE2SDB4cXNOU1VNWHprTjRjVjBWR1lFTm9WWEhDdmJuQ05i?=
 =?utf-8?B?M0JvWFdzVGxCQ3VXTi9Kb0V3WmJPNFNHcU5VdklJKzAwVjJSSjZYbmZxNmdK?=
 =?utf-8?B?RnllZHlKbllWeWRwbklIWlk3TjFhOWRZSmVWQ3NidXVKOEdiQlJDV2p2YS9n?=
 =?utf-8?B?Ui9VblVyREJVUWp6T3VKZmtyeWFabVRxeUxoa2dxZ3JoQkJISlJKR2J4SXNP?=
 =?utf-8?B?VjlrYWl2U2MyUU43aVY0L2tYQ0lUTU5hdi80Y0pWNWJySmFXOWFiYnMrbEZV?=
 =?utf-8?Q?/QiuouCB9GyxCzeXnOKl1Qw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5d34ecd0-4fb7-4060-5113-08d9a6c59d36
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2021 16:49:52.8704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gdpT5ZzcgpNfFrlmrUDgKurGNDACkbP81wvZzIY8GBJs2f6nkqsYmFRpZwvnFliA7tCDyxZsIE9MPqgQB8U5BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1485
X-Proofpoint-GUID: BPU6Lfs61m7jO1PLst49h2-tH3PbiBKr
X-Proofpoint-ORIG-GUID: _7V4q8jCEzY3vH_L6J_aVuZ5yPN0Nd22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-13_02,2021-11-12_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111130098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Nov 2021 16:49:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158248


On 11/14/21 12:27 AM, Richard Purdie wrote:
> On Sat, 2021-11-13 at 21:45 +0800, Yi Zhao wrote:
>> This recipe had been moved out from python directory since 2016[1] in
>> order to share patches between python2 and python3. But now there is no
>> reason to keep it in its own directory as we only keep python3-nump.
>> Move it back to python directory.
>>
>> [1] https://git.openembedded.org/openembedded-core/commit/?id=9bffe2f9fb4ce6c0b265f27e5b484fbe076c6349
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   ...01-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch | 0
>>   .../python3-numpy}/0001-numpy-core-Define-RISCV-32-support.patch | 0
>>   .../{python-numpy/files => python/python3-numpy}/run-ptest       | 0
>>   .../{python-numpy => python}/python3-numpy_1.21.4.bb             | 1 +
>>   4 files changed, 1 insertion(+)
>>   rename meta/recipes-devtools/{python-numpy/files => python/python3-numpy}/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch (100%)
>>   rename meta/recipes-devtools/{python-numpy/files => python/python3-numpy}/0001-numpy-core-Define-RISCV-32-support.patch (100%)
>>   rename meta/recipes-devtools/{python-numpy/files => python/python3-numpy}/run-ptest (100%)
>>   rename meta/recipes-devtools/{python-numpy => python}/python3-numpy_1.21.4.bb (98%)
>>
>> diff --git a/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
>> similarity index 100%
>> rename from meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
>> rename to meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
>> diff --git a/meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define-RISCV-32-support.patch b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
>> similarity index 100%
>> rename from meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define-RISCV-32-support.patch
>> rename to meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
>> diff --git a/meta/recipes-devtools/python-numpy/files/run-ptest b/meta/recipes-devtools/python/python3-numpy/run-ptest
>> similarity index 100%
>> rename from meta/recipes-devtools/python-numpy/files/run-ptest
>> rename to meta/recipes-devtools/python/python3-numpy/run-ptest
>> diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.21.4.bb b/meta/recipes-devtools/python/python3-numpy_1.21.4.bb
>> similarity index 98%
>> rename from meta/recipes-devtools/python-numpy/python3-numpy_1.21.4.bb
>> rename to meta/recipes-devtools/python/python3-numpy_1.21.4.bb
>> index 8988a5bc39..a3ea4ab5aa 100644
>> --- a/meta/recipes-devtools/python-numpy/python3-numpy_1.21.4.bb
>> +++ b/meta/recipes-devtools/python/python3-numpy_1.21.4.bb
>> @@ -47,6 +47,7 @@ RDEPENDS:${PN} = "${PYTHON_PN}-unittest \
>>                     ${PYTHON_PN}-ctypes \
>>                     ${PYTHON_PN}-threading \
>>                     ${PYTHON_PN}-multiprocessing \
>> +                  ${PYTHON_PN}-json \
>>   "
>>   RDEPENDS:${PN}-ptest += "${PYTHON_PN}-pytest \
>>                            ${PYTHON_PN}-hypothesis \
> Looks like there is a dependency being changed too which isn't in the commit
> message?

Sorry that I forgot to mention it. I will send V2.


//Yi


>
> Cheers,
>
> Richard
>

