Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4527AC433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 13:41:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.84068.1657028496704050413
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 06:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MLLjY1q8;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=4185742758=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 265CPf1U028734
	for <openembedded-core@lists.openembedded.org>; Tue, 5 Jul 2022 13:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=buE2lJH4E9VBs5HK4KCLNt+RVKGGSWzmwuzYkGcXId0=;
 b=MLLjY1q8USVGzMsnBTvi6no2A31Gk4R22K7J6wQCEHDsx9/R1ryKwO5U18iR0d1IkZZn
 qt42o4a5X6RcFmxI/T7nAOvZQrwGqnEupr8Ul94fTCyQzhEheof2C48X94mh7Lb70rc7
 a6r7+SIDmWJlPzuwkBEz0IkETC9AUAqD1UPPUkXVimj5uXJZabIOpMPufMuclhOGlOOV
 cO5pketrDipAsNQnRI0HcoxFbS/vjpsA7o6RMHANbqVt5unQlHnGR17UPUtSHiqd8wDf
 +HJ63tWC3H7hOumvSIw+zOmc+lnomTvY71OCn0mDCrRzqMd4WnJcDQSLDuyQ+hFDY9Qa fQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3h2b8326qs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 13:41:35 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 265DfZ91021198
	for <openembedded-core@lists.openembedded.org>; Tue, 5 Jul 2022 13:41:35 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3h2b8326qr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Jul 2022 13:41:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KiWH7vkr/8mGUm3637s9PYs/A/74rDf1q/4Qt31Y3oTmpTTBQfurnmjdFO9HvBPwUBdfuAFU3EAMHm+wWcPwhSwx8Ce/L4VEn3Cn7GJ+cCNWv2QpxyeGjP5pLBT97w67ImvhkzOMOEEk2BkSTdbo2bsAij6lSslTEejESfXGxkdN5SbXgFOqBhLXzJ3TnBCLP6NYa+EPEV4gOgBKu02mIeadd0JYhnImgVFfpN7V4vhX27UCf8W+eRIaxfDs/gyeMjSw1Q5wYsmzi6jQNIiLz8SgYMEKVyclqMaQACwO1GUY8hihnRJoQyEitZRWULyCMNR3BLSSbiR12qa1BvSrUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=buE2lJH4E9VBs5HK4KCLNt+RVKGGSWzmwuzYkGcXId0=;
 b=C2CHOx/fB90YMDVsItVz9zPMIrl1cz846cUOw7pFY5kw0BS42ZGLR0uOTz97n7iLDUA1H3APyYg4CPvwtGyESoWLtgoIZ5bNbkx7e80JjGuparLHovarE6IXQ1qpLSyOwsG1EDVyab//+h9wRAn8HnZEya1f1UE7+AkhZC2wl4Q91/aom90w2vzpCOooyWCb/k8FadOilmaek1DTlwh+ajVTt1kZ9Hf3cVOoMrs2XzUAEc8u2QCro/HiFT73Bt1gBhn3bdhpS0i7VazxneHWFYEfOaRgDZnn54rlpO2mXVfeGqpHI7RWoYmsP7m99JtlbiaG9a7W4FuxMavfc9Estw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by BN6PR11MB1315.namprd11.prod.outlook.com (2603:10b6:404:49::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Tue, 5 Jul
 2022 13:41:31 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::d84b:7432:aca3:bbff]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::d84b:7432:aca3:bbff%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 13:41:31 +0000
Message-ID: <e7c2caa9-4f43-8a1c-4cf9-4b064166d966@windriver.com>
Date: Tue, 5 Jul 2022 09:41:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [kirkstone] Binutils : Binutils-2.38 Stable release
 updated with latest commits
Content-Language: en-CA
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
        openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda.cve@gmail.com,
        shivams@gmail.com
References: <20220705035905.163902-1-sundeep.kokkonda@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20220705035905.163902-1-sundeep.kokkonda@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0069.namprd03.prod.outlook.com
 (2603:10b6:a03:331::14) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2af0574a-d7f6-4a1b-153e-08da5e8c11b1
X-MS-TrafficTypeDiagnostic: BN6PR11MB1315:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VmRVTmpRWk0vN0x4ZmJjQTdwRisvTzZYWWlVRmxScUtlcittako5Q1lVSjFz?=
 =?utf-8?B?aUNZYXEzNVY1Wm9YSGpqQUF3VmpSZ0JLQ3ZJVjViODQxcFBtTXdHOFh1dURG?=
 =?utf-8?B?YThYampCdFJGdkhpRGFBZ05IeTNsMWRUOTJGVS90cmE0V3VRU3NNM1hWVDRs?=
 =?utf-8?B?OHhHK1JkaG5pZmNpODVuNSs4ck5SeTdpMWNIVjJDYm9pUUViQWxtY2pXT2pW?=
 =?utf-8?B?c0hNSzRWOTF5VE5UeU1lZGgxQkIyNGxhbGRqcElOYm9CQ3lpKzY1VTRMdW5y?=
 =?utf-8?B?U2RpRnc1UTJ4WCswbElOL0Y1d1oyTWE0ODN5eUxDK1pNRGtLTjhZYkRzdXgx?=
 =?utf-8?B?Q3FOZS9RbTV2L3JJZ3pyUE1xKzZUNTlIZmd4WUg3QkdOYlVhQitzWDRRSGN0?=
 =?utf-8?B?RTNnT1JSeHNPWW5UWUovb0NUZmRibUFpNTcwTmpFcHVjaE9rNGQvaFFkUGd5?=
 =?utf-8?B?NHdSRjBnQTBjOTRrVHZXY1lNazBIcjJ5RWV5cjZYSENMeERNd1hIejVzYTFS?=
 =?utf-8?B?ZDlYTFppY0tMQ3I4L1BYdjl5WlNvY09hZWh1blNVSUwySU5yMXllY0hhQ3RU?=
 =?utf-8?B?eUhDR0pYRmJsSHhkQS85WDlpNzh1K0JvQllWWjlRdXFaTy9Kc1pwb29tUzV1?=
 =?utf-8?B?L0RFVjJJR3pvUkRCTXYrbnQ1OVNYb2JHNFJYaVYwbjV2Rk5JVTQ4WDdWYWs2?=
 =?utf-8?B?WmM4NmZuK244Zk42d2IvWTN4cFZzOFhMN1RvYlI4MjdXelRnOEIzNG5XNGpJ?=
 =?utf-8?B?ek1kU2lYakJSb29yNElKTkpyajduTU5BYXhkTnBMcXF5YmdzdjBRWWJFek5z?=
 =?utf-8?B?d1JYU0FLRDNEUXNDOVlVSlZSWUwreXc4RnVsZkJwQkJJR3orNy94TFdRTStK?=
 =?utf-8?B?OUwrS01BMHN1ckdUdElLSHE4YVNvUXpsUjEzN0xrZVN2SHhlRjFTbXlDUnM4?=
 =?utf-8?B?MWZxNnZrZGdQVko0Ukl3dnNWMUdjaTZkcm53NUY5dzhpSnNkVVhkZitKd1Fl?=
 =?utf-8?B?WXZDWEswR3ZpR1JXZWtXOStrSU1raUhQd1VoM2lPZkZDZWE5Yzg2NWxGTW5m?=
 =?utf-8?B?WWlTV2ZUMWhPeHNLNzRDeWN2RWRYMFJqcWdIQ3ZTTHRwUm8zbEsxd2pJUTVo?=
 =?utf-8?B?cEtvNUd2VEFUSjNLOTdCVk1oUURNalpzek1TNk1UYTlibXkyVm5RbldZTExN?=
 =?utf-8?B?ZUVWME4rUWIvUS91S256Z1Fkak9FNnFIM3BhY0VOZUtCbmk0K0RBbGdQUHlO?=
 =?utf-8?B?WHNUNHlQOVZTbnZyWjVoa0Zjckl6S3lPc0sxMmU0ZXc1T3FGZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(366004)(396003)(136003)(39850400004)(478600001)(6666004)(6486002)(966005)(41300700001)(26005)(6512007)(316002)(8936002)(5660300002)(31696002)(53546011)(52116002)(86362001)(31686004)(186003)(15650500001)(4326008)(8676002)(66556008)(66476007)(2616005)(66946007)(36756003)(38350700002)(38100700002)(6506007)(2906002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U3hYQ0VML20rNkxac1FsaUc2N3RpcllyVDRZc0xJUEFBQVdvSnFUaDY4QVZw?=
 =?utf-8?B?S2JDRmJocSsxVXc0UEs0YXlNZFFOZThzWFpyNDBVWWZjZ3N2VnhoNTRmd1JI?=
 =?utf-8?B?eHFQYVN1bGxlQUNHaklLb2ZhK1BHRk0vRDcxNERiak95V0d4QktSRjlZRkps?=
 =?utf-8?B?SFE2Y3YrM3ptMVR6R0FqalArT0R2NHBqSTlPbGM3Y1kwZHhrWHRoWUg0L2VC?=
 =?utf-8?B?TmF6VDBZZ25UaERUc2lVSHJvVGxaU00zTk9sQVBBQkk0YXFvVkN6ZmtIM0w1?=
 =?utf-8?B?cUtrK0tWcjRDT3B3aUlvQnZuZjRmMEdhdXZKYjVaMnN1SDQ2R0xXLzN1Sy9U?=
 =?utf-8?B?Z3FPUE5ZcFB1NnJOR0FhZTdJUEI1MzVNUHZhMXF0a29ZNDdtMzR5RTBsUWdt?=
 =?utf-8?B?Ym12OGkxNithN0trMHowRDRpWDNUV0RYUmdHT1BhNU16SlFDcnZsY0c2WmNG?=
 =?utf-8?B?NGZWQm8yLzNkUVlaREkwR0dvaHNmMjRrNTl5c25obEZpTGg4RGk4SFRPOGkr?=
 =?utf-8?B?NStxaWplNWFSZHpDYVMwUVAxWGlrbzZueWRySGJKVzZzZUgwSWphS1YvNU0r?=
 =?utf-8?B?RGtwTFQ4NEVTQmNZOUdrZlBRYkJKZjVOa0tRSGprTFpCT1U2cjVoeXJEUGFE?=
 =?utf-8?B?SndMZGJyc0VGQURiUHVzbTBHckVLOG0yWWQraFBBbnNEV05Fa1Y4RUtVbFU1?=
 =?utf-8?B?dktuT3piVDkrNTE0WFNHUGhSdUhHMXBuL01nbm1iaFJoV1Q5aFdTYUM4dUpR?=
 =?utf-8?B?cEpPTFJyU3lkQUh1VkVSSmdzd081ekNpdHQxUHdBRnozcGFLaFBNOEtJalFr?=
 =?utf-8?B?ZWY2TUttSFFqV0RSVW5nNUhLZ1U4L3ZQS3htT1pGTmFJNWxFWU13b3JzbWwv?=
 =?utf-8?B?Q204UEl1MDNmMjY1WjFIeGVOWGQvSERseGs1N2kvNXdoZW5tZ1J1eFFwL1Q1?=
 =?utf-8?B?V2JTcG9zNkw0Qms2WG5nYTZYMnFxajBGTU5XbkwyeXZQVWR4VTBjSjNRdjcy?=
 =?utf-8?B?aWRyNUFRTVV6WGNqb1pxcDZUMlRIb1prVzRsQ2hIeWNNM1dTb2RIWTJIZXBt?=
 =?utf-8?B?VkpNOXkwRzAyMlZtYkE0bHdtV0ZPRVZDaThvUkhwZ1Y0NjgrREEzM3hGb29Z?=
 =?utf-8?B?OFlnUzkzSUtCTHZCR2M5N05ibUtsM0RONmNubVlRMGptdEtoRVRPRjlodWJt?=
 =?utf-8?B?Zmp3MGRJaVVzQnJtSFJMdENyeThjV295NWNNQXZtT0o3YUJtZlUra1k4SEFP?=
 =?utf-8?B?a2hITHpXZWh0NDE1cWRRMS9FaG54VEY5ZXBKRzI4S0xYMDBLMHRXQ2E3cmxz?=
 =?utf-8?B?eDhtWWNlbFlWRHptZ201cERuVkhMK2JlVStBNkdJSnp2Snd0cVNIRHkxQjdE?=
 =?utf-8?B?UnhxOHhFUjlzTitUVHdQbFRzTnRJaEE2aTh4RWhZU0V3QVdLQzlGTlNEbm11?=
 =?utf-8?B?M3dVdU9nY2xvWmpZQTJVTFcreFFoUUNhbHptWWhSM2NGeGhYRCtvbmY1RE9L?=
 =?utf-8?B?WHNRU0NweFZiZ0NPeGRNdTlCbEIzTXVHYXNyOHo0RzE4cCtPYVRmQzBoN1RX?=
 =?utf-8?B?aytzQTg1YVV4aXlpc0EvNHpQU29Jcjd1UmhJN0RudithL0tMbTQ1VTBzRFhF?=
 =?utf-8?B?ZDYzVERTVHcrR3RLWVlxckkxNzR5aU95U3JqYVBmMno1d01zc01iSUZ4S3ND?=
 =?utf-8?B?NnFURmltZmZONnVQL21oenkreVpuRmlzTy9rODkyNDlMdjRWSzFCUGR0QmJj?=
 =?utf-8?B?bzUvNEM5ZVZFRHl5YVRORmdHUGk3RDQwNDRQaWUycks5dkduZC90a1RKWFFk?=
 =?utf-8?B?YktVbGk5ZWFWRUFacGxyR0htRkwvWUJZUUFYZit2c3hsaWdTd3RCN0hiL29X?=
 =?utf-8?B?S3ArR3BySEtjTHRqQnNIOTh4M2NyeGs4NHl2aTZDckhEWndLOEE2OWNja1FF?=
 =?utf-8?B?bUVvZWpFbVlDVC9ZeXowTmd2bExyWkNNaGZOR2w3VVJSMlVPV2p2VlJtS29t?=
 =?utf-8?B?cERQb3ZxNzNTZjNsVXVoNThKcE9RTnBZT2IySUhsSnRCbzVvTENmYm4xdTVn?=
 =?utf-8?B?Z1VKd2RXK05kZkZ4K0c1OVljWjBFU1pVZW9KVllJVmt2R1ZmY05rTFVTMDRY?=
 =?utf-8?B?cWRibTM4NERXaGsvdUpSUEkxbFA2UTJvQmVtT3VnUFJVS2JMVWF5N1JtL0p2?=
 =?utf-8?B?Vnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2af0574a-d7f6-4a1b-153e-08da5e8c11b1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 13:41:31.3315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vJx/LV0UelpACuItHLsoXljluqTVYpzU++90zYkLVFw/+BjKFQIFXJTxDZ9JxXv3HSEFzowH179JgzIzqK/TuZBVkXT/XWkO8BKzxZcdp38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1315
X-Proofpoint-GUID: nKwydBlRlwPc_eeTs9w0g5A3qOGp3vqf
X-Proofpoint-ORIG-GUID: 5PODIhv7V8F-HYSm-wAxzypm89E0wZxF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-05_10,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=964
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2207050059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 13:41:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167655

Re: [OE-core] [kirkstone]

Your short log is:

Binutils : Binutils-2.38 Stable release updated with latest commits

Please change it to:

binutils: stable 2.38 branch updates

See style from other binutils commits in oe-core:
$ git log --oneline meta/recipes-devtools/binutils

On 2022-07-04 23:59, Sundeep KOKKONDA wrote:
> Below commits on Binutils-2.38 development branch are updated.
>
> binutils:
> eed56ee299b Automatic date update in version.in

These "Automatic date update" logs aren't helpful, filter them out.

Otherwise, looks good, please send a v2.

../Randy

> 8e001ed8f2c Automatic date update in version.in
> 6b2a26c63ba Automatic date update in version.in
> f0b5a0b5687 Automatic date update in version.in
> 5cc2bdc75bf Automatic date update in version.in
> a06ed65fce8 Automatic date update in version.in
> 164daf3d644 Automatic date update in version.in
> 8b1dda80a5d Automatic date update in version.in
> a4577d4f18f Automatic date update in version.in
> 614000f9d7b Automatic date update in version.in
> ebd859d2cc4 Automatic date update in version.in
> d2823f8c27c Automatic date update in version.in
> 949c11728ca Automatic date update in version.in
> fe36d34f258 Automatic date update in version.in
> 0dae8bed68e Automatic date update in version.in
> 884e81eeb2c Automatic date update in version.in
> d61f79dc474 Automatic date update in version.in
> c86fbb1d885 Automatic date update in version.in
> 724f6468fb1 Automatic date update in version.in
> aef4bdb2ed5 Automatic date update in version.in
> db802012a3e Automatic date update in version.in
> b28a1fd5055 Automatic date update in version.in
> e1ea1dafff6 x86: Properly handle IFUNC function pointer reference
> e35ea91a86c Automatic date update in version.in
> 1d81266d92e Automatic date update in version.in
> b0530a6f3dc Automatic date update in version.in
> 81d275cb83f Automatic date update in version.in
> 794474ead0b Automatic date update in version.in
> 220b941f1e0 Automatic date update in version.in
> 912f2e4449d Automatic date update in version.in
> 93054037f1e Automatic date update in version.in
> bc8ba34fc24 Automatic date update in version.in
> af58abfd800 Automatic date update in version.in
> d200cde62c8 Automatic date update in version.in
> 31fd6cd3d76 Automatic date update in version.in
> 475549dc3ac Automatic date update in version.in
> ffc7aa903b9 AArch64: Enable FP16 by default for Armv9-A.
> f20245c35f2 Automatic date update in version.in
> 39c6088537b Automatic date update in version.in
> 6a8f2255438 Automatic date update in version.in
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
> ---
>   meta/recipes-devtools/binutils/binutils-2.38.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
> index dc0a2a4054..c2502e0901 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.38.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
> @@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_38-branch"
>   
>   UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
>   
> -SRCREV ?= "134f17ef688ba4c72a6c4e57af7382882cc1a705"
> +SRCREV ?= "eed56ee299b9ef8754bb4e53f2e9cf2a7c28c04d"
>   BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git"
>   SRC_URI = "\
>        ${BINUTILS_GIT_URI} \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167634): https://lists.openembedded.org/g/openembedded-core/message/167634
> Mute This Topic: https://lists.openembedded.org/mt/92179043/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux


