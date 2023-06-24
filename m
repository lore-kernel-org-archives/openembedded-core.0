Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 244ABEB64DA
	for <webhook@archiver.kernel.org>; Sat, 24 Jun 2023 18:06:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.21505.1687629975336435497
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Jun 2023 11:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=nHsDHIsE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5539ef131b=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35OHwjAw000583
	for <openembedded-core@lists.openembedded.org>; Sat, 24 Jun 2023 11:06:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=oZOOWhnHP1idaC1ttI/
	0vTB/XgFWNpEMNly7QExImAA=; b=nHsDHIsESUSOxwfDJcKmG3B8qBnH1k6cwD+
	5VPoWxn10tTE358YLXPi9PiRwqMzT7uT64a6gbuGJsMCijuepaJxidze2XmbSikL
	bV5jCdgh0WRMnFRIuIAVjPfubJAQCimAiU0X7hS0Auz9/5chLLcobnVvapPXQmtH
	h34FU+PFLOi9qDV3H7cc72C722YDA35xty1x6l6tBTMJh6Vl7Prok7m8kWidbsew
	yUAJ5G84WZ6I5Wlaxre9ECsGXGIMD31G2GKpc4fHcLvrA0ZQ2rYjFfxZbVWGnsJ8
	LwL5lS1iwNPLercDC/8AEfSvHfruMPyKkCX/11YMMSBqIDfxbRA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdurxraps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 24 Jun 2023 11:06:14 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 35OI6DUp013566
	for <openembedded-core@lists.openembedded.org>; Sat, 24 Jun 2023 11:06:14 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdurxrapp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Jun 2023 11:06:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdbkBpDK610GfmbEr/oQ3Q4uvYIkQ3WXUBz9eOJVYM2gJ4oNRnVzFBuZVKSfkv1kB+VWgXzNlM7Mcbh/tyLYW35/BMYsgg/SsPRQQLSCUeZbEz7qTukFcfhuR6m2rhC3ard2CICzsIQsxTpqpS16LyiJekcb4k9MeUxWj5J9e9axcBYFnPWIzcufVSEpCYHNqvkEzeAGPFn/z8bMAJpNOCxHqUX6tk4T6XUaox41f4KktN6UGeoHMEWmq2YSJgInm32P5Jtb/+V8MNYi/SND9esLVOZ2ksjyLiyuZ0WiKipRmWpq0XQxlbSMhXckFSn6XurgxEZHQcZDP6w4TNE91Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZOOWhnHP1idaC1ttI/0vTB/XgFWNpEMNly7QExImAA=;
 b=YUjj5P+D21n2zbmQQgdUqINy9Q260Wpag06ZR4ZvqCVmzMf4TAaUqxyZZPnn7ubUjbc+39onnTes+0NwFwFqtE7gPenZMWjK+2Lre6W2JOZNJE9D0nGdP9fMnCFb00GMgDhkCf4nNIRWK292ViyQgQPng1ZSmUPiobevPi8s/0/aGEBfUIOHeT4XaNrpeRiPHos4i7xbPCXOxNnUZIC96YTCD78oGLIop3J9ODkTJLdtGFQC+xWw5rXD7mV8exfoJ5smETI2279sAP7mxwkj94bPx4jcUWPzv1ISeIodAvlq/kdK/X2LOsuzO/iX/fEMpfL8uClHlne28PFqqS/NmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CO1PR11MB5060.namprd11.prod.outlook.com (2603:10b6:303:93::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Sat, 24 Jun
 2023 18:06:08 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::5a4c:c35b:8704:34d5]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::5a4c:c35b:8704:34d5%3]) with mapi id 15.20.6521.024; Sat, 24 Jun 2023
 18:06:08 +0000
Content-Type: multipart/alternative;
 boundary="------------ARClsETxA76DRhUKFjqv0hre"
Message-ID: <d1da12c7-9f24-0139-9a21-d43f154e4ca1@windriver.com>
Date: Sat, 24 Jun 2023 14:06:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [mickledore][PATCH] gcc : upgrade to v12.3
Content-Language: en-CA
To: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>,
        openembedded-core@lists.openembedded.org,
        Khem Raj <raj.khem@gmail.com>
Cc: naveen.gowda@windriver.com, shivaprasad.moodalappa@windriver.com,
        yash.shinde@windriver.com, deepthi.hemraj@windriver.com,
        umesh.kalappa@windriver.com
References: <20230623164055.89846-1-sundeep.kokkonda@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230623164055.89846-1-sundeep.kokkonda@windriver.com>
X-ClientProxiedBy: BYAPR21CA0005.namprd21.prod.outlook.com
 (2603:10b6:a03:114::15) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|CO1PR11MB5060:EE_
X-MS-Office365-Filtering-Correlation-Id: 61a09186-9038-4ca7-9ebd-08db74ddaf2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vwz4PKqmV790OX0Bk3s/vi3zfCgaNXWg2sEmcYfxlzp7C5OVCvlhoMhPplSwuuqPE/6nvFulj8i8qi4tKXyTagBntRWg906KqcYBxyipyceDl2uKhip4+Drp5ZAoxnQaXwxjEcniUSAgmTXF3FH/9QRppRhVdyIByTs3SBqU6JMQPr/ekH5xkFFOif++0AL3cijboPejY80FcTw73c+19MUxR6gPm5eNOEHOHftVCxQS9Fdo9IoAUQxIwiPZFNv9Y7GGXqT0ykIVavRPTBN+YJLfaN3NWAWLmxWTenALEFjJgqiPOS1rP28+KsZ1RPyDX4C4j4THf0RfuBm7dPckVUBxLdi0n4MkMxlKKUoYUJKLwH/gU2XNN2B4JSqm/H+7EQ+KgljB0dZjiM04/9U+/dAbuS7zlNdHTF2v6tcefbPUUFsqU0G6+xLRuh9PwAn0EZp2ZYiOeWzAB2yDhIG/wJBpU0Y8AmOkTAPGm1L5g3Xjoiq5mi3OZucehtVkgGrZno0V0o2oufDdqiZ1Abqq4KFLTMv66PG0UNauDLm9XiMGPcT/HWZAK96yOXZ9IsC2nL45XOrh+TJYOGJ/6zpSzI8rhGwYxOU2SliGGz3gVyPdxGu4Wd1psdtAv9rZ03LbKCt2L1p0lljksh59p8NQdurkAFlMLZneqnIdtwkjnvfrz5yk1c67bM0hjgS1p0GM
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39850400004)(366004)(376002)(346002)(396003)(451199021)(8676002)(8936002)(66946007)(66556008)(41300700001)(66476007)(316002)(4326008)(6506007)(53546011)(26005)(6512007)(107886003)(186003)(2616005)(478600001)(110136005)(6666004)(33964004)(966005)(6486002)(4001150100001)(2906002)(5660300002)(30864003)(21615005)(166002)(38100700002)(36756003)(31696002)(86362001)(31686004)(83380400001)(43740500002)(45980500001)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aVV4ZWpVYnB4ekFBMVJsellUY1ZWaHU2aVBwcmduTGhPcE40QXRNSWJ1NnB1?=
 =?utf-8?B?VExIdGl0bW9Ic29idExpWkkxTFN5bFUwRTk3elB2MHhtUSt5LzNDaGRNV2JO?=
 =?utf-8?B?bXBQR1lnRFhBdTlQdnh0RFhkMWVDa1FMTndtOXhPSjBPZ25Ha3hGaGpzNkI3?=
 =?utf-8?B?TFBZMXZsTFNkek5IeFVlT3IxSWNYWXJLN01aS1NxcGpFWGZZUlhneHhiMENt?=
 =?utf-8?B?NE94QmorMmZFbjdQWWZRWUl4Mjhvck9LU2hXRlEySnNkZmJOeXgyVGs0MlpZ?=
 =?utf-8?B?akZ3K0pTYlhsL05TSlJXWGk2WEtXZ2JIa3gvdmtINnpBYUc4eFJsbUVNSlpX?=
 =?utf-8?B?Q1ZOb20rdlJJT2h6aStlZzg5UTVNSHR1R3M0ZHBWbnhUN2ZSejhkZDNlT1Q4?=
 =?utf-8?B?V2ZmdzM1MkNEZHdMdXZUcGFkMXVmT0hUMGtGNWZadGdYakVYZjJXSm9pSVJi?=
 =?utf-8?B?ZFZCcWpQY3doQUo5bFBaSVlpRXdqOVVoVk8xRlNlYkxRQnUxb2FsalF5cndQ?=
 =?utf-8?B?ZUVnU1lyK01iR0RpU3Z5Z3RWUC9rVG5FVXYxQTNNTjlkcUxRZ01hQjJxZ251?=
 =?utf-8?B?alV3Q2ZTbk00TDBtYk1lTUVnMWZvZWFTZmcrazNZaXN4TzV4Z1E4TU53MnJU?=
 =?utf-8?B?VzFka3FKSmJ0VXdsSTZWZjA4STBQMHR6K3N2cEZlMjRMRWxIbU9qWnB0L3BT?=
 =?utf-8?B?NmU3OUdwckp5NzNCeU4wc0lYa2JwRGxzU0JMbGVKektqMFUvTEptcXdaZngz?=
 =?utf-8?B?UWhEM3RCcytMeFpEajc2N2J0RHNLNVBWb3ZmeVNQb0sxbmU2Z3NoRGNtdzhw?=
 =?utf-8?B?NHo4T25jNDY2TU92aENBRzBFdm43aEsrVm5adS8zdkkwRTZCazhJaTltdlM1?=
 =?utf-8?B?WGc1K1BPa0pLRUFYMHJMRUhJUVk4Wkl5VG5sUzdrSGRCVHhFN2JVU1o5MFQw?=
 =?utf-8?B?WlozenVFc3RNa3dBcUtGcVRHbkJjb1N0bWU4Y1oxODNtdmlUZmd1ZUZPWUdz?=
 =?utf-8?B?WENDUW84dmM0bkp2alNyZ1Q3a3grcDduRkVuYWNWNWF6K0IzRzQ2cC9oUjRT?=
 =?utf-8?B?YW9uMWZnZnhaSnppcENTT0hVTVhxNFltRW5LRUZHcmk4VEFMcFBpVVlwT0lH?=
 =?utf-8?B?M3ZFMm9zMjc2bHZqWUV2RXBhcU1DSHV3STUzS3hQbk9DMG1WNnhEY204Mkgz?=
 =?utf-8?B?WUhBYXYrcWFkUnhoc2FlcEN3QzFGN0tDR2xzMmFWV1h5bXlWa3lCaTBxSHNS?=
 =?utf-8?B?LzRUQjlSM0RvcU9LdkJ4TDVNOHFFYitLWmZJaENEWlptbVJjRElwcWVjNmE2?=
 =?utf-8?B?UmdNOWRYSTI2ck9NOStSc1JZVWU4Z0YxZjNJcFRqVUIxeStHeXEva2p6aHJH?=
 =?utf-8?B?WlNDQlFPQURVRGFDVlM4WW1Jd3BqWTJyUEloRWVGVVFYQVRBQk00RVFub21I?=
 =?utf-8?B?ZzNpcVF4b3FoUnhlTEd3SkJMTEo0bkZ0OU9ZUUM1a0ZHNldqOFNHK3gwei9i?=
 =?utf-8?B?a21IOUlsQWFHR2xzM09Ld1Q5WHEzbEorWEFsMEZOSWhRL3FwRW9ETk9SdG9N?=
 =?utf-8?B?dkdnUWFxd2xYaUFSTXIzY05jam1jOU4zRVc0TVROK3YxbWk2a0RsMlJuLzdw?=
 =?utf-8?B?Rnd5d1htcTRyVlkraStmQ1NRRHRwUGJFckpPQkRmRU8wUHg5eTA4YlBXVHhR?=
 =?utf-8?B?akNYUFNTbTNwTktUQUlvTzlZc3J1cW94RnV4SjlENWZ4WENoS2tLSGhCUzRE?=
 =?utf-8?B?UExzb3laN1JDdVRCeHNzVkxib1NGUC9tOERsSGVURmZ1UmI2bEFzRlZBYU5u?=
 =?utf-8?B?L1FiMEcwN2c2S2c2YWNqQ0U3NDFyK2g4SW56UllmR0krZURyeHp5OC9mRlhZ?=
 =?utf-8?B?NityUUFOaFBvTXgxdXg5a1NUcXV2czdodk05eDBPOVBkZ2x3TTc2Z3hWZ21V?=
 =?utf-8?B?WDkzNmo2U1VYTlVmb0hnUS9nSXlKUFQ0OEU5WTM0djkrdnU0MlFNenJuZ3lw?=
 =?utf-8?B?ODlOQ3VIdjZmY1NvcDdiSlVMQnJEaXEwR1lTVnBXOTIwQVF1aUtGczlzZjBj?=
 =?utf-8?B?dUxycXlrRExvWUlMRFhYZXF2d2REaXJRMlVNak1ORkV1alNIc0U1WEpWTnda?=
 =?utf-8?B?ajdtSVBlOWdxVG9HUGtMeEhpZTBtTldZSy9pMTdpa0JQQ0dzR1NlUnRrMER3?=
 =?utf-8?B?UVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61a09186-9038-4ca7-9ebd-08db74ddaf2d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2023 18:06:08.3351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /cUKFxwNQWef9TLLJssq3S69uacfCJK9BZZnf9CwzIEuyclTbfm+/YdQ7J9PojMCBLLMGGZfpdtzcHyPx9OA+kUZdwWXw07SiTRPgVF8oOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5060
X-Proofpoint-ORIG-GUID: cO9vDlvATBpH-GdTk3ig7lBTCO0Vp5g6
X-Proofpoint-GUID: j5SvUF4RdhJc8FLV-c0jSmO7k9e94p2O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-24_13,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306240172
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Jun 2023 18:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183362

--------------ARClsETxA76DRhUKFjqv0hre
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 35OHwjAw000583

Add Khem since he may want to test meta-oe with the updated toolchain.

On 2023-06-23 12:40, Sundeep KOKKONDA wrote:
> gcc stable version upgraded from v12.2 to v12.3
>
> Below is the bug fix list for v12.3
> https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&resoluti=
on=3DFIXED&target_milestone=3D12.3

Thanks Sundeep.


Did you run a toochain regression test and if so what are the before,=20
after, delta stats
and your summary/analysis of the results?


It isn't a strict requirement but if it's easy, then it's good to copy=20
data into the commit log rather than link it.

In this case, there are 129 bugs so that's too much info and a link is=20
sensible but
it's nice if it's accompanied with a summary.
I don't think we need a commit log update but I'll summarize what I=20
noticed below
to give you an indication of what I'd like to see in future commits.

Most of the bugs linked are "Regression" fixes leaving:

https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&cf_known_t=
o_fail_type=3Dallwords&cf_known_to_work_type=3Dallwords&product=3Dgcc&que=
ry_format=3Dadvanced&resolution=3DFIXED&short_desc=3DRegression&short_des=
c_type=3Dnotregexp&target_milestone=3D12.3

ID =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Product =C2=A0=C2=A0=C2=A0 Comp =C2=
=A0=C2=A0=C2=A0 Assignee =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 Summary
103387 =C2=A0=C2=A0=C2=A0 gcc =C2=A0=C2=A0=C2=A0 libstdc+ =C2=A0=C2=A0 re=
di =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 powerpc64le:=20
segmentation fault on std::cout with ieee128 long doubl
109094 =C2=A0=C2=A0=C2=A0 gcc =C2=A0=C2=A0=C2=A0 analyzer =C2=A0=C2=A0 dm=
alcolm =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 Uninit false positive=20
from -fanalyzer when longjmp unwinds frames
106721 =C2=A0=C2=A0=C2=A0 gcc =C2=A0=C2=A0=C2=A0 target =C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0 jakub =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Error: invalid=20
character '<' in mnemonic since r13-2122-g86c0d98620e
100103 =C2=A0=C2=A0=C2=A0 gcc =C2=A0=C2=A0=C2=A0 fortran =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 jrfsousa =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 A=
utomatic=20
reallocation fails inside select rank
107551 =C2=A0=C2=A0=C2=A0 gcc =C2=A0=C2=A0=C2=A0 target =C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0 marxin __builtin_cpu_supports returns a=20
negative integer for "x86-64"
98487 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gcc =C2=A0=C2=A0=C2=A0 c =C2=A0=C2=A0=
=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 mpolacek =C2=A0=C2=A0=C2=A0 =C2=A0 ICE: tree check:=20
expected identifier_node, have tree_list in is_attribut
109427 =C2=A0=C2=A0=C2=A0 gcc =C2=A0=C2=A0=C2=A0 tree-opt =C2=A0=C2=A0=C2=
=A0 pinskia param=3Dvect-induction-float=3D has=20
a typo for IntegerRange
103081 =C2=A0=C2=A0=C2=A0 gcc =C2=A0=C2=A0=C2=A0 c++ =C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0 =C2=A0=C2=A0 ppalka =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 [ICE] with "using enum"
107417 =C2=A0=C2=A0=C2=A0 gcc =C2=A0=C2=A0=C2=A0 c++ =C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 =C2=A0 ppalka =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 g++ fails to=20
recognize parameter pack in requires-expression
107542 =C2=A0=C2=A0=C2=A0 gcc =C2=A0=C2=A0=C2=A0 c++ =C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0 =C2=A0=C2=A0 ppalka =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 ICE in=20
spaceship_comp_cat, at cp/method.cc:1055
108104 =C2=A0=C2=A0=C2=A0 gcc =C2=A0=C2=A0=C2=A0 c++ =C2=A0=C2=A0=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ppalka =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 ICE in unify, at=20
cp/pt.c:24333 with template partial specialization an
108362 =C2=A0=C2=A0=C2=A0 gcc =C2=A0=C2=A0=C2=A0 libstdc+ =C2=A0=C2=A0=C2=
=A0 ppalka =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 views::istr=
eam is=20
SFINAE-unfriendly
103755 =C2=A0=C2=A0=C2=A0 gcc =C2=A0=C2=A0=C2=A0 libstdc+ =C2=A0=C2=A0 re=
di {has,use}_facet() and iostream=20
constructor performance
105678 =C2=A0=C2=A0=C2=A0 gcc =C2=A0=C2=A0=C2=A0 libstdc+ =C2=A0=C2=A0 re=
di =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 Undefined reference=20
to stacktrace standard library
109165 =C2=A0=C2=A0=C2=A0 gcc =C2=A0=C2=A0=C2=A0 libstdc+ =C2=A0=C2=A0 re=
di=20
std::hash<coroutine_handle<>>::operator() should be const
109182 =C2=A0=C2=A0=C2=A0 gcc =C2=A0=C2=A0=C2=A0 libstdc+ =C2=A0=C2=A0 re=
di =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 unused parameter=20
pack is in expected(in_place_t)
109242 =C2=A0=C2=A0=C2=A0 gcc =C2=A0=C2=A0=C2=A0 libstdc+ =C2=A0=C2=A0 re=
di =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 C++2b=20
std::optional::transform omits required std::remove_cv_t from
99417 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gcc =C2=A0=C2=A0=C2=A0 libstdc+ =C2=A0=
=C2=A0 unassigned =C2=A0=C2=A0=C2=A0=C2=A0 [C++17] std::variant=20
assignment fails to compile
103325 =C2=A0=C2=A0=C2=A0 gcc =C2=A0=C2=A0=C2=A0 tree-opt =C2=A0=C2=A0=C2=
=A0 unassigned =C2=A0=C2=A0=C2=A0 1 << -1 is never reduced=20
to a constant during gimple
106714 =C2=A0=C2=A0=C2=A0 gcc =C2=A0=C2=A0=C2=A0 target =C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0 unassigned =C2=A0=C2=A0=C2=A0 Incorrect casts in=20
macros in amxtileintrin.h
107121 =C2=A0=C2=A0=C2=A0 gcc =C2=A0=C2=A0=C2=A0 tree-opt =C2=A0=C2=A0=C2=
=A0 unassigned =C2=A0=C2=A0=C2=A0 DEFERRED_INIT misspelled=20
in error message
107206 =C2=A0=C2=A0=C2=A0 gcc =C2=A0=C2=A0=C2=A0 tree-opt =C2=A0=C2=A0=C2=
=A0 unassigned =C2=A0=C2=A0=C2=A0 Bogus -Wuninitialized in=20
std::optional
107713 =C2=A0=C2=A0=C2=A0 gcc =C2=A0=C2=A0=C2=A0 target =C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0 unassigned =C2=A0=C2=A0=C2=A0 Wrong implementation=20
atomic_exchange<short> on LoongArch
108097 =C2=A0=C2=A0=C2=A0 gcc =C2=A0=C2=A0=C2=A0 libstdc+ =C2=A0=C2=A0 un=
assigned =C2=A0=C2=A0=C2=A0 std::stacktrace=20
AddressSanitizer: new-delete-type-mismatch on 0
109000 =C2=A0=C2=A0=C2=A0 gcc =C2=A0=C2=A0=C2=A0 target =C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0 xry111 =C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 LoongA=
rch:=20
"unmatched" -mabi and -mfpu setting can break ABI silent
104554 =C2=A0=C2=A0=C2=A0 gcc =C2=A0=C2=A0=C2=A0 fortran =C2=A0=C2=A0 =C2=
=A0=C2=A0 anlauf =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 ICE =
in=20
check_assumed_size_reference, at fortran/resolv

The idea is to show that you've looked at what changed and though about=20
it a bit even if it's
just bug review like I have above.


Html table below for those interested.


Also the release notes are not very helpful (=20
https://gcc.gnu.org/gcc-12/changes.html ):


    GCC 12.3


      Target Specific Changes


      x86-64

  * GCC now supports AMD CPUs based on the |znver4| core via
    |-march=3Dznver4|. The switch makes GCC consider using 512 bit vector=
s
    when auto-vectorizing.

This is the list of problem reports (PRs)=20
<https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&resolutio=
n=3DFIXED&target_milestone=3D12.3>=20
from GCC's bug tracking system that are known to be fixed in the 12.3=20
release. This list might not be complete (that is, it is possible that=20
some PRs that have been fixed are not listed here).


../Randy


ID=20
<https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&cf_known_=
to_fail_type=3Dallwords&cf_known_to_work_type=3Dallwords&product=3Dgcc&qu=
ery_format=3Dadvanced&resolution=3DFIXED&short_desc=3DRegression&short_de=
sc_type=3Dnotregexp&target_milestone=3D12.3&order=3Dbug_id%20DESC&query_b=
ased_on=3D>=20
	Product=20
<https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&cf_known_=
to_fail_type=3Dallwords&cf_known_to_work_type=3Dallwords&product=3Dgcc&qu=
ery_format=3Dadvanced&resolution=3DFIXED&short_desc=3DRegression&short_de=
sc_type=3Dnotregexp&target_milestone=3D12.3&order=3Dproduct%2Cbug_status%=
2Cpriority%2Cassigned_to%2Cbug_id&query_based_on=3D>=20
	Comp=20
<https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&cf_known_=
to_fail_type=3Dallwords&cf_known_to_work_type=3Dallwords&product=3Dgcc&qu=
ery_format=3Dadvanced&resolution=3DFIXED&short_desc=3DRegression&short_de=
sc_type=3Dnotregexp&target_milestone=3D12.3&order=3Dcomponent%2Cbug_statu=
s%2Cpriority%2Cassigned_to%2Cbug_id&query_based_on=3D>=20
	Assignee=E2=96=B2=20
<https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&cf_known_=
to_fail_type=3Dallwords&cf_known_to_work_type=3Dallwords&product=3Dgcc&qu=
ery_format=3Dadvanced&resolution=3DFIXED&short_desc=3DRegression&short_de=
sc_type=3Dnotregexp&target_milestone=3D12.3&order=3Dassigned_to%20DESC%2C=
bug_status%2Cpriority%2Cbug_id&query_based_on=3D>=20
	Status=E2=96=B2=20
<https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&cf_known_=
to_fail_type=3Dallwords&cf_known_to_work_type=3Dallwords&product=3Dgcc&qu=
ery_format=3Dadvanced&resolution=3DFIXED&short_desc=3DRegression&short_de=
sc_type=3Dnotregexp&target_milestone=3D12.3&order=3Dbug_status%20DESC%2Cp=
riority%2Cassigned_to%2Cbug_id&query_based_on=3D>=20
	Resolution=20
<https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&cf_known_=
to_fail_type=3Dallwords&cf_known_to_work_type=3Dallwords&product=3Dgcc&qu=
ery_format=3Dadvanced&resolution=3DFIXED&short_desc=3DRegression&short_de=
sc_type=3Dnotregexp&target_milestone=3D12.3&order=3Dresolution%2Cbug_stat=
us%2Cpriority%2Cassigned_to%2Cbug_id&query_based_on=3D>=20
	Summary=20
<https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&cf_known_=
to_fail_type=3Dallwords&cf_known_to_work_type=3Dallwords&product=3Dgcc&qu=
ery_format=3Dadvanced&resolution=3DFIXED&short_desc=3DRegression&short_de=
sc_type=3Dnotregexp&target_milestone=3D12.3&order=3Dshort_desc%2Cbug_stat=
us%2Cpriority%2Cassigned_to%2Cbug_id&query_based_on=3D>=20
	Changed=20
<https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&cf_known_=
to_fail_type=3Dallwords&cf_known_to_work_type=3Dallwords&product=3Dgcc&qu=
ery_format=3Dadvanced&resolution=3DFIXED&short_desc=3DRegression&short_de=
sc_type=3Dnotregexp&target_milestone=3D12.3&order=3Dchangeddate%2Cbug_sta=
tus%2Cpriority%2Cassigned_to%2Cbug_id&query_based_on=3D>=20

103387 <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D103387> 	gcc=20
libstdc+ 	redi 	RESO 	FIXE 	powerpc64le: segmentation fault on std::cout=20
with ieee128 long double variable=20
<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D103387> 	2023-04-21
109094 <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109094> 	gcc=20
analyzer 	dmalcolm 	RESO 	FIXE 	Uninit false positive from -fanalyzer=20
when longjmp unwinds frames with return stmts=20
<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109094> 	2023-03-29
106721 <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106721> 	gcc=20
target 	jakub 	RESO 	FIXE 	Error: invalid character '<' in mnemonic=20
since r13-2122-g86c0d98620ee3a=20
<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106721> 	2023-03-20
100103 <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D100103> 	gcc=20
fortran 	jrfsousa 	RESO 	FIXE 	Automatic reallocation fails inside=20
select rank <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D100103>=20
2022-10-01
107551 <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107551> 	gcc=20
target 	marxin 	RESO 	FIXE 	__builtin_cpu_supports returns a negative=20
integer for "x86-64"=20
<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107551> 	2022-12-09
98487 <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D98487> 	gcc 	c=20
mpolacek 	RESO 	FIXE 	ICE: tree check: expected identifier_node, have=20
tree_list in is_attribute_p, at attribs.h:155 [C2X or C++11 attribute=20
syntax, gnu::format and -Wsuggest-attribute=3Dformat] or a suggest warnin=
g=20
(release checking) <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D98487>=
=20
2022-12-19
109427 <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109427> 	gcc=20
tree-opt 	pinskia 	RESO 	FIXE 	param=3Dvect-induction-float=3D has a typo=
=20
for IntegerRange <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109427>=20
2023-04-06
103081 <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D103081> 	gcc 	c++=20
ppalka 	RESO 	FIXE 	[ICE] with "using enum"=20
<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D103081> 	2022-12-19
107417 <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107417> 	gcc 	c++=20
ppalka 	RESO 	FIXE 	g++ fails to recognize parameter pack in=20
requires-expression=20
<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107417> 	2022-12-19
107542 <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107542> 	gcc 	c++=20
ppalka 	RESO 	FIXE 	ICE in spaceship_comp_cat, at cp/method.cc:1055=20
<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107542> 	2022-12-19
108104 <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108104> 	gcc 	c++=20
ppalka 	RESO 	FIXE 	ICE in unify, at cp/pt.c:24333 with template partial=20
specialization and pointer to memeber function and nullptr=20
<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108104> 	2022-12-19
108362 <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108362> 	gcc=20
libstdc+ 	ppalka 	RESO 	FIXE 	views::istream is SFINAE-unfriendly=20
<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108362> 	2023-04-29
103755 <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D103755> 	gcc=20
libstdc+ 	redi 	RESO 	FIXE 	{has,use}_facet() and iostream constructor=20
performance <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D103755>=20
2023-04-21
105678 <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D105678> 	gcc=20
libstdc+ 	redi 	RESO 	FIXE 	Undefined reference to stacktrace standard=20
library <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D105678> 	2022-08-=
23
109165 <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109165> 	gcc=20
libstdc+ 	redi 	RESO 	FIXE 	std::hash<coroutine_handle<>>::operator()=20
should be const <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109165>=20
2023-03-20
109182 <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109182> 	gcc=20
libstdc+ 	redi 	RESO 	FIXE 	unused parameter pack is in=20
expected(in_place_t)=20
<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109182> 	2023-03-20
109242 <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109242> 	gcc=20
libstdc+ 	redi 	RESO 	FIXE 	C++2b std::optional::transform omits=20
required std::remove_cv_t from return optional type=20
<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109242> 	2023-03-30
99417 <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D99417> 	gcc=20
libstdc+ 	unassigned 	RESO 	FIXE 	[C++17] std::variant assignment fails=20
to compile <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D99417> 	2023-0=
5-16
103325 <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D103325> 	gcc=20
tree-opt 	unassigned 	RESO 	FIXE 	1 << -1 is never reduced to a constant=20
during gimple <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D103325>=20
2023-05-28
106714 <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106714> 	gcc=20
target 	unassigned 	RESO 	FIXE 	Incorrect casts in macros in=20
amxtileintrin.h <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106714>=20
2022-08-29
107121 <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107121> 	gcc=20
tree-opt 	unassigned 	RESO 	FIXE 	DEFERRED_INIT misspelled in error=20
message <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107121> 	2022-11-=
28
107206 <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107206> 	gcc=20
tree-opt 	unassigned 	RESO 	FIXE 	Bogus -Wuninitialized in std::optional=20
<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107206> 	2022-11-28
107713 <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107713> 	gcc=20
target 	unassigned 	RESO 	FIXE 	Wrong implementation=20
atomic_exchange<short> on LoongArch=20
<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107713> 	2022-11-20
108097 <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108097> 	gcc=20
libstdc+ 	unassigned 	RESO 	FIXE 	std::stacktrace AddressSanitizer:=20
new-delete-type-mismatch on 0x615000000080 in thread T0=20
<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108097> 	2022-12-14
109000 <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109000> 	gcc=20
target 	xry111 	RESO 	FIXE 	LoongArch: "unmatched" -mabi and -mfpu=20
setting can break ABI silently=20
<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109000> 	2023-03-06
104554 <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D104554> 	gcc=20
fortran 	anlauf 	RESO 	FIXE 	ICE in check_assumed_size_reference, at=20
fortran/resolve.cc:1650=20
<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D104554>


Sorry for the HTML table but hopefully people can read it.


>
> Signed-off-by: Sundeep KOKKONDA<sundeep.kokkonda@windriver.com>
> ---
>   meta/recipes-devtools/gcc/{gcc-12.2.inc =3D> gcc-12.3.inc}    | 6 +++=
---
>   ...cc-cross-canadian_12.2.bb =3D> gcc-cross-canadian_12.3.bb} | 0
>   .../gcc/{gcc-cross_12.2.bb =3D> gcc-cross_12.3.bb}            | 0
>   .../gcc/{gcc-crosssdk_12.2.bb =3D> gcc-crosssdk_12.3.bb}      | 0
>   .../gcc/{gcc-runtime_12.2.bb =3D> gcc-runtime_12.3.bb}        | 0
>   .../gcc/{gcc-sanitizers_12.2.bb =3D> gcc-sanitizers_12.3.bb}  | 0
>   .../gcc/{gcc-source_12.2.bb =3D> gcc-source_12.3.bb}          | 0
>   meta/recipes-devtools/gcc/{gcc_12.2.bb =3D> gcc_12.3.bb}      | 0
>   .../gcc/{libgcc-initial_12.2.bb =3D> libgcc-initial_12.3.bb}  | 0
>   .../recipes-devtools/gcc/{libgcc_12.2.bb =3D> libgcc_12.3.bb} | 0
>   .../gcc/{libgfortran_12.2.bb =3D> libgfortran_12.3.bb}        | 0
>   11 files changed, 3 insertions(+), 3 deletions(-)
>   rename meta/recipes-devtools/gcc/{gcc-12.2.inc =3D> gcc-12.3.inc} (97=
%)
>   rename meta/recipes-devtools/gcc/{gcc-cross-canadian_12.2.bb =3D> gcc=
-cross-canadian_12.3.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-cross_12.2.bb =3D> gcc-cross_12=
.3.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-crosssdk_12.2.bb =3D> gcc-cross=
sdk_12.3.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-runtime_12.2.bb =3D> gcc-runtim=
e_12.3.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-sanitizers_12.2.bb =3D> gcc-san=
itizers_12.3.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-source_12.2.bb =3D> gcc-source_=
12.3.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc_12.2.bb =3D> gcc_12.3.bb} (100%=
)
>   rename meta/recipes-devtools/gcc/{libgcc-initial_12.2.bb =3D> libgcc-=
initial_12.3.bb} (100%)
>   rename meta/recipes-devtools/gcc/{libgcc_12.2.bb =3D> libgcc_12.3.bb}=
 (100%)
>   rename meta/recipes-devtools/gcc/{libgfortran_12.2.bb =3D> libgfortra=
n_12.3.bb} (100%)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-12.2.inc b/meta/recipes-devt=
ools/gcc/gcc-12.3.inc
> similarity index 97%
> rename from meta/recipes-devtools/gcc/gcc-12.2.inc
> rename to meta/recipes-devtools/gcc/gcc-12.3.inc
> index 0dbbecad4a..4ec03f925c 100644
> --- a/meta/recipes-devtools/gcc/gcc-12.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-12.3.inc
> @@ -2,11 +2,11 @@ require gcc-common.inc
>  =20
>   # Third digit in PV should be incremented after a minor release
>  =20
> -PV =3D "12.2.0"
> +PV =3D "12.3.0"
>  =20
>   # BINV should be incremented to a revision after a minor gcc release
>  =20
> -BINV =3D "12.2.0"
> +BINV =3D "12.3.0"
>  =20
>   FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backpor=
t:"
>  =20
> @@ -64,7 +64,7 @@ SRC_URI =3D "${BASEURI} \
>              file://prefix-map-realpath.patch  \
>              file://hardcoded-paths.patch  \
>   "
> -SRC_URI[sha256sum] =3D "e549cf9cf3594a00e27b6589d4322d70e0720cdd213f39=
beb4181e06926230ff"
> +SRC_URI[sha256sum] =3D "949a5d4f99e786421a93b532b22ffab5578de732136997=
5b91aec97adfda8c3b"
>  =20
>   S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
>   B =3D "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_12.2.bb b/met=
a/recipes-devtools/gcc/gcc-cross-canadian_12.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-cross-canadian_12.2.bb
> rename to meta/recipes-devtools/gcc/gcc-cross-canadian_12.3.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-cross_12.2.bb b/meta/recipes=
-devtools/gcc/gcc-cross_12.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-cross_12.2.bb
> rename to meta/recipes-devtools/gcc/gcc-cross_12.3.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_12.2.bb b/meta/reci=
pes-devtools/gcc/gcc-crosssdk_12.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-crosssdk_12.2.bb
> rename to meta/recipes-devtools/gcc/gcc-crosssdk_12.3.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb b/meta/recip=
es-devtools/gcc/gcc-runtime_12.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-runtime_12.2.bb
> rename to meta/recipes-devtools/gcc/gcc-runtime_12.3.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb b/meta/re=
cipes-devtools/gcc/gcc-sanitizers_12.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb
> rename to meta/recipes-devtools/gcc/gcc-sanitizers_12.3.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-source_12.2.bb b/meta/recipe=
s-devtools/gcc/gcc-source_12.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-source_12.2.bb
> rename to meta/recipes-devtools/gcc/gcc-source_12.3.bb
> diff --git a/meta/recipes-devtools/gcc/gcc_12.2.bb b/meta/recipes-devto=
ols/gcc/gcc_12.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc_12.2.bb
> rename to meta/recipes-devtools/gcc/gcc_12.3.bb
> diff --git a/meta/recipes-devtools/gcc/libgcc-initial_12.2.bb b/meta/re=
cipes-devtools/gcc/libgcc-initial_12.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgcc-initial_12.2.bb
> rename to meta/recipes-devtools/gcc/libgcc-initial_12.3.bb
> diff --git a/meta/recipes-devtools/gcc/libgcc_12.2.bb b/meta/recipes-de=
vtools/gcc/libgcc_12.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgcc_12.2.bb
> rename to meta/recipes-devtools/gcc/libgcc_12.3.bb
> diff --git a/meta/recipes-devtools/gcc/libgfortran_12.2.bb b/meta/recip=
es-devtools/gcc/libgfortran_12.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgfortran_12.2.bb
> rename to meta/recipes-devtools/gcc/libgfortran_12.3.bb


--=20
# Randy MacLeod
# Wind River Linux

--------------ARClsETxA76DRhUKFjqv0hre
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 35OHwjAw000583

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Add Khem since he may want to test
      meta-oe with the updated toolchain.</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2023-06-23 12:40, Sundeep KOKKONDA
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20230623164055.89846-1-sundeep.=
kokkonda@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">gcc stable version upgraded =
from v12.2 to v12.3

Below is the bug fix list for v12.3
<a class=3D"moz-txt-link-freetext" href=3D"https://gcc.gnu.org/bugzilla/b=
uglist.cgi?bug_status=3DRESOLVED&amp;resolution=3DFIXED&amp;target_milest=
one=3D12.3">https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVE=
D&amp;resolution=3DFIXED&amp;target_milestone=3D12.3</a></pre>
    </blockquote>
    <p>Thanks Sundeep.</p>
    <p><br>
    </p>
    <p>Did you run a toochain regression test and if so what are the
      before, after, delta stats <br>
      and your summary/analysis of the results?<br>
    </p>
    <p><br>
    </p>
    <p>It isn't a strict requirement but if it's easy, then it's good to
      copy data into the commit log rather than link it. <br>
      <br>
      In this case, there are 129 bugs so that's too much info and a
      link is sensible but<br>
      it's nice if it's accompanied with a summary.<br>
      I don't think we need a commit log update but I'll summarize what
      I noticed below<br>
      to give you an indication of what I'd like to see in future
      commits.<br>
    </p>
    <p>Most of the bugs linked are &quot;Regression&quot; fixes leaving:<=
/p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://gcc.gnu.org/bug=
zilla/buglist.cgi?bug_status=3DRESOLVED&amp;cf_known_to_fail_type=3Dallwo=
rds&amp;cf_known_to_work_type=3Dallwords&amp;product=3Dgcc&amp;query_form=
at=3Dadvanced&amp;resolution=3DFIXED&amp;short_desc=3DRegression&amp;shor=
t_desc_type=3Dnotregexp&amp;target_milestone=3D12.3">https://gcc.gnu.org/=
bugzilla/buglist.cgi?bug_status=3DRESOLVED&amp;cf_known_to_fail_type=3Dal=
lwords&amp;cf_known_to_work_type=3Dallwords&amp;product=3Dgcc&amp;query_f=
ormat=3Dadvanced&amp;resolution=3DFIXED&amp;short_desc=3DRegression&amp;s=
hort_desc_type=3Dnotregexp&amp;target_milestone=3D12.3</a></p>
    <p>ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Product &nbsp;&nbsp;&nbsp;=
 Comp &nbsp;&nbsp;&nbsp; Assignee &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; Summary<br>
      103387 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; libstdc+ &nbsp;&nb=
sp; redi &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &=
nbsp;&nbsp;&nbsp; powerpc64le:
      segmentation fault on std::cout with ieee128 long doubl<br>
      109094 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; analyzer &nbsp;&nb=
sp; dmalcolm &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; Uninit false
      positive from -fanalyzer when longjmp unwinds frames<br>
      106721 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; target &nbsp;&nbsp=
;&nbsp; &nbsp;&nbsp; jakub &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; Error:
      invalid character '&lt;' in mnemonic since r13-2122-g86c0d98620e<br=
>
      100103 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; fortran &nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; jrfsousa &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; Automatic
      reallocation fails inside select rank &nbsp;&nbsp;&nbsp; <br>
      107551 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; target &nbsp;&nbsp=
;&nbsp; &nbsp;&nbsp; marxin &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&=
nbsp;&nbsp;
      __builtin_cpu_supports returns a negative integer for &quot;x86-64&=
quot; &nbsp;&nbsp;&nbsp;
      <br>
      98487 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; c &nbsp=
;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; mpolacek &nbsp;&nbsp;&nbsp; &nbsp; ICE: tree
      check: expected identifier_node, have tree_list in is_attribut<br>
      109427 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; tree-opt &nbsp;&nb=
sp;&nbsp; pinskia &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
      param=3Dvect-induction-float=3D has a typo for IntegerRange &nbsp;&=
nbsp;&nbsp; <br>
      103081 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; c++ &nbsp;&nbsp;&n=
bsp; &nbsp;&nbsp; &nbsp;&nbsp; ppalka &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbs=
p; &nbsp;&nbsp;&nbsp; [ICE] with
      &quot;using enum&quot; &nbsp;&nbsp;&nbsp; <br>
      107417 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; c++ &nbsp;&nbsp;&n=
bsp; &nbsp;&nbsp;&nbsp; &nbsp; ppalka &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbs=
p; &nbsp;&nbsp;&nbsp; g++ fails to
      recognize parameter pack in requires-expression &nbsp;&nbsp;&nbsp; =
<br>
      107542 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; c++ &nbsp;&nbsp;&n=
bsp; &nbsp;&nbsp; &nbsp;&nbsp; ppalka &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbs=
p; &nbsp;&nbsp;&nbsp; ICE in
      spaceship_comp_cat, at cp/method.cc:1055 &nbsp;&nbsp;&nbsp; <br>
      108104 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; c++ &nbsp;&nbsp;&n=
bsp; &nbsp; &nbsp; &nbsp; ppalka &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &n=
bsp;&nbsp;&nbsp; ICE in unify,
      at cp/pt.c:24333 with template partial specialization an<br>
      108362 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; libstdc+ &nbsp;&nb=
sp;&nbsp; ppalka &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; views=
::istream
      is SFINAE-unfriendly &nbsp;&nbsp;&nbsp; <br>
      103755 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; libstdc+ &nbsp;&nb=
sp; redi &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &=
nbsp;&nbsp;&nbsp;
      {has,use}_facet() and iostream constructor performance &nbsp;&nbsp;=
&nbsp; <br>
      105678 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; libstdc+ &nbsp;&nb=
sp; redi &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &=
nbsp;&nbsp;&nbsp; Undefined
      reference to stacktrace standard library &nbsp;&nbsp;&nbsp; <br>
      109165 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; libstdc+ &nbsp;&nb=
sp; redi &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &=
nbsp;&nbsp;&nbsp;
      std::hash&lt;coroutine_handle&lt;&gt;&gt;::operator() should be
      const &nbsp;&nbsp;&nbsp; <br>
      109182 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; libstdc+ &nbsp;&nb=
sp; redi &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &=
nbsp;&nbsp;&nbsp; unused
      parameter pack is in expected(in_place_t) &nbsp;&nbsp;&nbsp; <br>
      109242 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; libstdc+ &nbsp;&nb=
sp; redi &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &=
nbsp;&nbsp;&nbsp; C++2b
      std::optional::transform omits required std::remove_cv_t from <br>
      99417 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; libstdc=
+ &nbsp;&nbsp; unassigned &nbsp;&nbsp;&nbsp;&nbsp; [C++17]
      std::variant assignment fails to compile &nbsp;&nbsp;&nbsp; <br>
      103325 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; tree-opt &nbsp;&nb=
sp;&nbsp; unassigned &nbsp;&nbsp;&nbsp; 1 &lt;&lt; -1 is
      never reduced to a constant during gimple &nbsp;&nbsp;&nbsp; <br>
      106714 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; target &nbsp;&nbsp=
;&nbsp; &nbsp;&nbsp; unassigned &nbsp;&nbsp;&nbsp; Incorrect casts in
      macros in amxtileintrin.h &nbsp;&nbsp;&nbsp; <br>
      107121 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; tree-opt &nbsp;&nb=
sp;&nbsp; unassigned &nbsp;&nbsp;&nbsp; DEFERRED_INIT
      misspelled in error message &nbsp;&nbsp;&nbsp; <br>
      107206 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; tree-opt &nbsp;&nb=
sp;&nbsp; unassigned &nbsp;&nbsp;&nbsp; Bogus
      -Wuninitialized in std::optional &nbsp;&nbsp;&nbsp; <br>
      107713 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; target &nbsp;&nbsp=
;&nbsp; &nbsp;&nbsp; unassigned &nbsp;&nbsp;&nbsp; Wrong
      implementation atomic_exchange&lt;short&gt; on LoongArch &nbsp;&nbs=
p;&nbsp; <br>
      108097 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; libstdc+ &nbsp;&nb=
sp; unassigned &nbsp;&nbsp;&nbsp; std::stacktrace
      AddressSanitizer: new-delete-type-mismatch on 0<br>
      109000 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; target &nbsp;&nbsp=
;&nbsp; &nbsp;&nbsp; xry111 &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;=
 LoongArch:
      &quot;unmatched&quot; -mabi and -mfpu setting can break ABI silent<=
br>
      104554 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; fortran &nbsp;&nbs=
p; &nbsp;&nbsp; anlauf &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp=
; ICE in
      check_assumed_size_reference, at fortran/resolv</p>
    <p>The idea is to show that you've looked at what changed and though
      about it a bit even if it's<br>
      just bug review like I have above.<br>
    </p>
    <p><br>
    </p>
    <p>Html table below for those interested.</p>
    <p><br>
    </p>
    <p>Also the release notes are not very helpful (
      <a class=3D"moz-txt-link-freetext" href=3D"https://gcc.gnu.org/gcc-=
12/changes.html">https://gcc.gnu.org/gcc-12/changes.html</a> ):</p>
    <h2 id=3D"12.3">GCC 12.3</h2>
    <h3>Target Specific Changes</h3>
    <h3>x86-64</h3>
    <ul>
      <li>GCC now supports AMD CPUs based on the <code>znver4</code>
        core via <code>-march=3Dznver4</code>. The switch makes GCC
        consider using 512 bit vectors when auto-vectorizing. </li>
    </ul>
    <p>This is the <a href=3D"https://gcc.gnu.org/bugzilla/buglist.cgi?bu=
g_status=3DRESOLVED&amp;resolution=3DFIXED&amp;target_milestone=3D12.3">l=
ist
        of problem reports (PRs)</a> from GCC's bug tracking system that
      are
      known to be fixed in the 12.3 release. This list might not be
      complete (that is, it is possible that some PRs that have been
      fixed
      are not listed here).</p>
    <p></p>
    <p><br>
    </p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <p><span class=3D"bz_result_count"></span>
    </p>
    <table class=3D"bz_buglist">
      <tbody>
        <tr class=3D"bz_buglist_header bz_first_buglist_header">
          <th colspan=3D"1" class=3D"first-child"> <a href=3D"https://gcc=
.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&amp;cf_known_to_fail_=
type=3Dallwords&amp;cf_known_to_work_type=3Dallwords&amp;product=3Dgcc&am=
p;query_format=3Dadvanced&amp;resolution=3DFIXED&amp;short_desc=3DRegress=
ion&amp;short_desc_type=3Dnotregexp&amp;target_milestone=3D12.3&amp;order=
=3Dbug_id%20DESC&amp;query_based_on=3D">ID</a>
          </th>
          <th colspan=3D"1"> <a href=3D"https://gcc.gnu.org/bugzilla/bugl=
ist.cgi?bug_status=3DRESOLVED&amp;cf_known_to_fail_type=3Dallwords&amp;cf=
_known_to_work_type=3Dallwords&amp;product=3Dgcc&amp;query_format=3Dadvan=
ced&amp;resolution=3DFIXED&amp;short_desc=3DRegression&amp;short_desc_typ=
e=3Dnotregexp&amp;target_milestone=3D12.3&amp;order=3Dproduct%2Cbug_statu=
s%2Cpriority%2Cassigned_to%2Cbug_id&amp;query_based_on=3D">Product</a>
          </th>
          <th colspan=3D"1"> <a href=3D"https://gcc.gnu.org/bugzilla/bugl=
ist.cgi?bug_status=3DRESOLVED&amp;cf_known_to_fail_type=3Dallwords&amp;cf=
_known_to_work_type=3Dallwords&amp;product=3Dgcc&amp;query_format=3Dadvan=
ced&amp;resolution=3DFIXED&amp;short_desc=3DRegression&amp;short_desc_typ=
e=3Dnotregexp&amp;target_milestone=3D12.3&amp;order=3Dcomponent%2Cbug_sta=
tus%2Cpriority%2Cassigned_to%2Cbug_id&amp;query_based_on=3D">Comp</a>
          </th>
          <th colspan=3D"1"> <a href=3D"https://gcc.gnu.org/bugzilla/bugl=
ist.cgi?bug_status=3DRESOLVED&amp;cf_known_to_fail_type=3Dallwords&amp;cf=
_known_to_work_type=3Dallwords&amp;product=3Dgcc&amp;query_format=3Dadvan=
ced&amp;resolution=3DFIXED&amp;short_desc=3DRegression&amp;short_desc_typ=
e=3Dnotregexp&amp;target_milestone=3D12.3&amp;order=3Dassigned_to%20DESC%=
2Cbug_status%2Cpriority%2Cbug_id&amp;query_based_on=3D">Assignee<span cla=
ss=3D"bz_sort_order_secondary">=E2=96=B2</span></a> </th>
          <th colspan=3D"1"> <a href=3D"https://gcc.gnu.org/bugzilla/bugl=
ist.cgi?bug_status=3DRESOLVED&amp;cf_known_to_fail_type=3Dallwords&amp;cf=
_known_to_work_type=3Dallwords&amp;product=3Dgcc&amp;query_format=3Dadvan=
ced&amp;resolution=3DFIXED&amp;short_desc=3DRegression&amp;short_desc_typ=
e=3Dnotregexp&amp;target_milestone=3D12.3&amp;order=3Dbug_status%20DESC%2=
Cpriority%2Cassigned_to%2Cbug_id&amp;query_based_on=3D">Status<span class=
=3D"bz_sort_order_primary">=E2=96=B2</span></a> </th>
          <th colspan=3D"1"> <a href=3D"https://gcc.gnu.org/bugzilla/bugl=
ist.cgi?bug_status=3DRESOLVED&amp;cf_known_to_fail_type=3Dallwords&amp;cf=
_known_to_work_type=3Dallwords&amp;product=3Dgcc&amp;query_format=3Dadvan=
ced&amp;resolution=3DFIXED&amp;short_desc=3DRegression&amp;short_desc_typ=
e=3Dnotregexp&amp;target_milestone=3D12.3&amp;order=3Dresolution%2Cbug_st=
atus%2Cpriority%2Cassigned_to%2Cbug_id&amp;query_based_on=3D">Resolution<=
/a>
          </th>
          <th colspan=3D"1"> <a href=3D"https://gcc.gnu.org/bugzilla/bugl=
ist.cgi?bug_status=3DRESOLVED&amp;cf_known_to_fail_type=3Dallwords&amp;cf=
_known_to_work_type=3Dallwords&amp;product=3Dgcc&amp;query_format=3Dadvan=
ced&amp;resolution=3DFIXED&amp;short_desc=3DRegression&amp;short_desc_typ=
e=3Dnotregexp&amp;target_milestone=3D12.3&amp;order=3Dshort_desc%2Cbug_st=
atus%2Cpriority%2Cassigned_to%2Cbug_id&amp;query_based_on=3D">Summary</a>
          </th>
          <th colspan=3D"1"> <a href=3D"https://gcc.gnu.org/bugzilla/bugl=
ist.cgi?bug_status=3DRESOLVED&amp;cf_known_to_fail_type=3Dallwords&amp;cf=
_known_to_work_type=3Dallwords&amp;product=3Dgcc&amp;query_format=3Dadvan=
ced&amp;resolution=3DFIXED&amp;short_desc=3DRegression&amp;short_desc_typ=
e=3Dnotregexp&amp;target_milestone=3D12.3&amp;order=3Dchangeddate%2Cbug_s=
tatus%2Cpriority%2Cassigned_to%2Cbug_id&amp;query_based_on=3D">Changed</a=
>
          </th>
        </tr>
        <tr id=3D"b103387" class=3D"bz_bugitem bz_major bz_P1 bz_RESOLVED
          bz_FIXED bz_row_odd ">
          <td class=3D"first-child bz_id_column"> <a href=3D"https://gcc.=
gnu.org/bugzilla/show_bug.cgi?id=3D103387">103387</a>
          </td>
          <td class=3D"bz_product_column nowrap"> <span title=3D"gcc">gcc=
 </span>
          </td>
          <td class=3D"bz_component_column nowrap"> <span title=3D"libstd=
c++">libstdc+ </span> </td>
          <td class=3D"bz_assigned_to_column nowrap"> <span title=3D"redi=
">redi
            </span> </td>
          <td class=3D"bz_bug_status_column nowrap"> <span title=3D"RESOL=
VED">RESO </span> </td>
          <td class=3D"bz_resolution_column nowrap"> <span title=3D"FIXED=
">FIXE
            </span> </td>
          <td class=3D"bz_short_desc_column"> <a href=3D"https://gcc.gnu.=
org/bugzilla/show_bug.cgi?id=3D103387">powerpc64le:
              segmentation fault on std::cout with ieee128 long double
              variable </a> </td>
          <td class=3D"bz_changeddate_column nowrap">2023-04-21 </td>
        </tr>
        <tr id=3D"b109094" class=3D"bz_bugitem bz_normal bz_P3 bz_RESOLVE=
D
          bz_FIXED bz_row_even ">
          <td class=3D"first-child bz_id_column"> <a href=3D"https://gcc.=
gnu.org/bugzilla/show_bug.cgi?id=3D109094">109094</a>
          </td>
          <td class=3D"bz_product_column nowrap"> <span title=3D"gcc">gcc=
 </span>
          </td>
          <td class=3D"bz_component_column nowrap"> <span title=3D"analyz=
er">analyzer </span> </td>
          <td class=3D"bz_assigned_to_column nowrap"> <span title=3D"dmal=
colm">dmalcolm </span> </td>
          <td class=3D"bz_bug_status_column nowrap"> <span title=3D"RESOL=
VED">RESO </span> </td>
          <td class=3D"bz_resolution_column nowrap"> <span title=3D"FIXED=
">FIXE
            </span> </td>
          <td class=3D"bz_short_desc_column"> <a href=3D"https://gcc.gnu.=
org/bugzilla/show_bug.cgi?id=3D109094">Uninit
              false positive from -fanalyzer when longjmp unwinds frames
              with return stmts </a> </td>
          <td class=3D"bz_changeddate_column nowrap">2023-03-29 </td>
        </tr>
        <tr id=3D"b106721" class=3D"bz_bugitem bz_normal bz_P3 bz_RESOLVE=
D
          bz_FIXED bz_row_odd ">
          <td class=3D"first-child bz_id_column"> <a href=3D"https://gcc.=
gnu.org/bugzilla/show_bug.cgi?id=3D106721">106721</a>
          </td>
          <td class=3D"bz_product_column nowrap"> <span title=3D"gcc">gcc=
 </span>
          </td>
          <td class=3D"bz_component_column nowrap"> <span title=3D"target=
">target
            </span> </td>
          <td class=3D"bz_assigned_to_column nowrap"> <span title=3D"jaku=
b">jakub
            </span> </td>
          <td class=3D"bz_bug_status_column nowrap"> <span title=3D"RESOL=
VED">RESO </span> </td>
          <td class=3D"bz_resolution_column nowrap"> <span title=3D"FIXED=
">FIXE
            </span> </td>
          <td class=3D"bz_short_desc_column"> <a href=3D"https://gcc.gnu.=
org/bugzilla/show_bug.cgi?id=3D106721">Error:
              invalid character '&lt;' in mnemonic since
              r13-2122-g86c0d98620ee3a </a> </td>
          <td class=3D"bz_changeddate_column nowrap">2023-03-20 </td>
        </tr>
        <tr id=3D"b100103" class=3D"bz_bugitem bz_normal bz_P3 bz_RESOLVE=
D
          bz_FIXED bz_row_even ">
          <td class=3D"first-child bz_id_column"> <a href=3D"https://gcc.=
gnu.org/bugzilla/show_bug.cgi?id=3D100103">100103</a>
          </td>
          <td class=3D"bz_product_column nowrap"> <span title=3D"gcc">gcc=
 </span>
          </td>
          <td class=3D"bz_component_column nowrap"> <span title=3D"fortra=
n">fortran
            </span> </td>
          <td class=3D"bz_assigned_to_column nowrap"> <span title=3D"jrfs=
ousa">jrfsousa </span> </td>
          <td class=3D"bz_bug_status_column nowrap"> <span title=3D"RESOL=
VED">RESO </span> </td>
          <td class=3D"bz_resolution_column nowrap"> <span title=3D"FIXED=
">FIXE
            </span> </td>
          <td class=3D"bz_short_desc_column"> <a href=3D"https://gcc.gnu.=
org/bugzilla/show_bug.cgi?id=3D100103">Automatic
              reallocation fails inside select rank </a> </td>
          <td class=3D"bz_changeddate_column nowrap">2022-10-01 </td>
        </tr>
        <tr id=3D"b107551" class=3D"bz_bugitem bz_normal bz_P3 bz_RESOLVE=
D
          bz_FIXED bz_row_odd ">
          <td class=3D"first-child bz_id_column"> <a href=3D"https://gcc.=
gnu.org/bugzilla/show_bug.cgi?id=3D107551">107551</a>
          </td>
          <td class=3D"bz_product_column nowrap"> <span title=3D"gcc">gcc=
 </span>
          </td>
          <td class=3D"bz_component_column nowrap"> <span title=3D"target=
">target
            </span> </td>
          <td class=3D"bz_assigned_to_column nowrap"> <span title=3D"marx=
in">marxin </span> </td>
          <td class=3D"bz_bug_status_column nowrap"> <span title=3D"RESOL=
VED">RESO </span> </td>
          <td class=3D"bz_resolution_column nowrap"> <span title=3D"FIXED=
">FIXE
            </span> </td>
          <td class=3D"bz_short_desc_column"> <a href=3D"https://gcc.gnu.=
org/bugzilla/show_bug.cgi?id=3D107551">__builtin_cpu_supports
              returns a negative integer for &quot;x86-64&quot; </a> </td=
>
          <td class=3D"bz_changeddate_column nowrap">2022-12-09 </td>
        </tr>
        <tr id=3D"b98487" class=3D"bz_bugitem bz_normal bz_P3 bz_RESOLVED
          bz_FIXED bz_row_even ">
          <td class=3D"first-child bz_id_column"> <a href=3D"https://gcc.=
gnu.org/bugzilla/show_bug.cgi?id=3D98487">98487</a>
          </td>
          <td class=3D"bz_product_column nowrap"> <span title=3D"gcc">gcc=
 </span>
          </td>
          <td class=3D"bz_component_column nowrap"> <span title=3D"c">c <=
/span>
          </td>
          <td class=3D"bz_assigned_to_column nowrap"> <span title=3D"mpol=
acek">mpolacek </span> </td>
          <td class=3D"bz_bug_status_column nowrap"> <span title=3D"RESOL=
VED">RESO </span> </td>
          <td class=3D"bz_resolution_column nowrap"> <span title=3D"FIXED=
">FIXE
            </span> </td>
          <td class=3D"bz_short_desc_column"> <a href=3D"https://gcc.gnu.=
org/bugzilla/show_bug.cgi?id=3D98487">ICE:
              tree check: expected identifier_node, have tree_list in
              is_attribute_p, at attribs.h:155 [C2X or C++11 attribute
              syntax, gnu::format and -Wsuggest-attribute=3Dformat] or a
              suggest warning (release checking) </a> </td>
          <td class=3D"bz_changeddate_column nowrap">2022-12-19 </td>
        </tr>
        <tr id=3D"b109427" class=3D"bz_bugitem bz_normal bz_P3 bz_RESOLVE=
D
          bz_FIXED bz_row_odd ">
          <td class=3D"first-child bz_id_column"> <a href=3D"https://gcc.=
gnu.org/bugzilla/show_bug.cgi?id=3D109427">109427</a>
          </td>
          <td class=3D"bz_product_column nowrap"> <span title=3D"gcc">gcc=
 </span>
          </td>
          <td class=3D"bz_component_column nowrap"> <span title=3D"tree-o=
ptimization">tree-opt </span> </td>
          <td class=3D"bz_assigned_to_column nowrap"> <span title=3D"pins=
kia">pinskia </span> </td>
          <td class=3D"bz_bug_status_column nowrap"> <span title=3D"RESOL=
VED">RESO </span> </td>
          <td class=3D"bz_resolution_column nowrap"> <span title=3D"FIXED=
">FIXE
            </span> </td>
          <td class=3D"bz_short_desc_column"> <a href=3D"https://gcc.gnu.=
org/bugzilla/show_bug.cgi?id=3D109427">param=3Dvect-induction-float=3D
              has a typo for IntegerRange </a> </td>
          <td class=3D"bz_changeddate_column nowrap">2023-04-06 </td>
        </tr>
        <tr id=3D"b103081" class=3D"bz_bugitem bz_normal bz_P3 bz_RESOLVE=
D
          bz_FIXED bz_row_even ">
          <td class=3D"first-child bz_id_column"> <a href=3D"https://gcc.=
gnu.org/bugzilla/show_bug.cgi?id=3D103081">103081</a>
          </td>
          <td class=3D"bz_product_column nowrap"> <span title=3D"gcc">gcc=
 </span>
          </td>
          <td class=3D"bz_component_column nowrap"> <span title=3D"c++">c=
++
            </span> </td>
          <td class=3D"bz_assigned_to_column nowrap"> <span title=3D"ppal=
ka">ppalka </span> </td>
          <td class=3D"bz_bug_status_column nowrap"> <span title=3D"RESOL=
VED">RESO </span> </td>
          <td class=3D"bz_resolution_column nowrap"> <span title=3D"FIXED=
">FIXE
            </span> </td>
          <td class=3D"bz_short_desc_column"> <a href=3D"https://gcc.gnu.=
org/bugzilla/show_bug.cgi?id=3D103081">[ICE]
              with &quot;using enum&quot; </a> </td>
          <td class=3D"bz_changeddate_column nowrap">2022-12-19 </td>
        </tr>
        <tr id=3D"b107417" class=3D"bz_bugitem bz_normal bz_P3 bz_RESOLVE=
D
          bz_FIXED bz_row_odd ">
          <td class=3D"first-child bz_id_column"> <a href=3D"https://gcc.=
gnu.org/bugzilla/show_bug.cgi?id=3D107417">107417</a>
          </td>
          <td class=3D"bz_product_column nowrap"> <span title=3D"gcc">gcc=
 </span>
          </td>
          <td class=3D"bz_component_column nowrap"> <span title=3D"c++">c=
++
            </span> </td>
          <td class=3D"bz_assigned_to_column nowrap"> <span title=3D"ppal=
ka">ppalka </span> </td>
          <td class=3D"bz_bug_status_column nowrap"> <span title=3D"RESOL=
VED">RESO </span> </td>
          <td class=3D"bz_resolution_column nowrap"> <span title=3D"FIXED=
">FIXE
            </span> </td>
          <td class=3D"bz_short_desc_column"> <a href=3D"https://gcc.gnu.=
org/bugzilla/show_bug.cgi?id=3D107417">g++
              fails to recognize parameter pack in requires-expression </=
a>
          </td>
          <td class=3D"bz_changeddate_column nowrap">2022-12-19 </td>
        </tr>
        <tr id=3D"b107542" class=3D"bz_bugitem bz_normal bz_P3 bz_RESOLVE=
D
          bz_FIXED bz_row_even ">
          <td class=3D"first-child bz_id_column"> <a href=3D"https://gcc.=
gnu.org/bugzilla/show_bug.cgi?id=3D107542">107542</a>
          </td>
          <td class=3D"bz_product_column nowrap"> <span title=3D"gcc">gcc=
 </span>
          </td>
          <td class=3D"bz_component_column nowrap"> <span title=3D"c++">c=
++
            </span> </td>
          <td class=3D"bz_assigned_to_column nowrap"> <span title=3D"ppal=
ka">ppalka </span> </td>
          <td class=3D"bz_bug_status_column nowrap"> <span title=3D"RESOL=
VED">RESO </span> </td>
          <td class=3D"bz_resolution_column nowrap"> <span title=3D"FIXED=
">FIXE
            </span> </td>
          <td class=3D"bz_short_desc_column"> <a href=3D"https://gcc.gnu.=
org/bugzilla/show_bug.cgi?id=3D107542">ICE
              in spaceship_comp_cat, at cp/method.cc:1055 </a> </td>
          <td class=3D"bz_changeddate_column nowrap">2022-12-19 </td>
        </tr>
        <tr id=3D"b108104" class=3D"bz_bugitem bz_normal bz_P3 bz_RESOLVE=
D
          bz_FIXED bz_row_odd ">
          <td class=3D"first-child bz_id_column"> <a href=3D"https://gcc.=
gnu.org/bugzilla/show_bug.cgi?id=3D108104">108104</a>
          </td>
          <td class=3D"bz_product_column nowrap"> <span title=3D"gcc">gcc=
 </span>
          </td>
          <td class=3D"bz_component_column nowrap"> <span title=3D"c++">c=
++
            </span> </td>
          <td class=3D"bz_assigned_to_column nowrap"> <span title=3D"ppal=
ka">ppalka </span> </td>
          <td class=3D"bz_bug_status_column nowrap"> <span title=3D"RESOL=
VED">RESO </span> </td>
          <td class=3D"bz_resolution_column nowrap"> <span title=3D"FIXED=
">FIXE
            </span> </td>
          <td class=3D"bz_short_desc_column"> <a href=3D"https://gcc.gnu.=
org/bugzilla/show_bug.cgi?id=3D108104">ICE
              in unify, at cp/pt.c:24333 with template partial
              specialization and pointer to memeber function and nullptr
            </a> </td>
          <td class=3D"bz_changeddate_column nowrap">2022-12-19 </td>
        </tr>
        <tr id=3D"b108362" class=3D"bz_bugitem bz_normal bz_P3 bz_RESOLVE=
D
          bz_FIXED bz_row_even ">
          <td class=3D"first-child bz_id_column"> <a href=3D"https://gcc.=
gnu.org/bugzilla/show_bug.cgi?id=3D108362">108362</a>
          </td>
          <td class=3D"bz_product_column nowrap"> <span title=3D"gcc">gcc=
 </span>
          </td>
          <td class=3D"bz_component_column nowrap"> <span title=3D"libstd=
c++">libstdc+ </span> </td>
          <td class=3D"bz_assigned_to_column nowrap"> <span title=3D"ppal=
ka">ppalka </span> </td>
          <td class=3D"bz_bug_status_column nowrap"> <span title=3D"RESOL=
VED">RESO </span> </td>
          <td class=3D"bz_resolution_column nowrap"> <span title=3D"FIXED=
">FIXE
            </span> </td>
          <td class=3D"bz_short_desc_column"> <a href=3D"https://gcc.gnu.=
org/bugzilla/show_bug.cgi?id=3D108362">views::istream
              is SFINAE-unfriendly </a> </td>
          <td class=3D"bz_changeddate_column nowrap">2023-04-29 </td>
        </tr>
        <tr id=3D"b103755" class=3D"bz_bugitem bz_enhancement bz_P3
          bz_RESOLVED bz_FIXED bz_row_odd ">
          <td class=3D"first-child bz_id_column"> <a href=3D"https://gcc.=
gnu.org/bugzilla/show_bug.cgi?id=3D103755">103755</a>
          </td>
          <td class=3D"bz_product_column nowrap"> <span title=3D"gcc">gcc=
 </span>
          </td>
          <td class=3D"bz_component_column nowrap"> <span title=3D"libstd=
c++">libstdc+ </span> </td>
          <td class=3D"bz_assigned_to_column nowrap"> <span title=3D"redi=
">redi
            </span> </td>
          <td class=3D"bz_bug_status_column nowrap"> <span title=3D"RESOL=
VED">RESO </span> </td>
          <td class=3D"bz_resolution_column nowrap"> <span title=3D"FIXED=
">FIXE
            </span> </td>
          <td class=3D"bz_short_desc_column"> <a href=3D"https://gcc.gnu.=
org/bugzilla/show_bug.cgi?id=3D103755">{has,use}_facet()
              and iostream constructor performance </a> </td>
          <td class=3D"bz_changeddate_column nowrap">2023-04-21 </td>
        </tr>
        <tr id=3D"b105678" class=3D"bz_bugitem bz_normal bz_P3 bz_RESOLVE=
D
          bz_FIXED bz_row_even ">
          <td class=3D"first-child bz_id_column"> <a href=3D"https://gcc.=
gnu.org/bugzilla/show_bug.cgi?id=3D105678">105678</a>
          </td>
          <td class=3D"bz_product_column nowrap"> <span title=3D"gcc">gcc=
 </span>
          </td>
          <td class=3D"bz_component_column nowrap"> <span title=3D"libstd=
c++">libstdc+ </span> </td>
          <td class=3D"bz_assigned_to_column nowrap"> <span title=3D"redi=
">redi
            </span> </td>
          <td class=3D"bz_bug_status_column nowrap"> <span title=3D"RESOL=
VED">RESO </span> </td>
          <td class=3D"bz_resolution_column nowrap"> <span title=3D"FIXED=
">FIXE
            </span> </td>
          <td class=3D"bz_short_desc_column"> <a href=3D"https://gcc.gnu.=
org/bugzilla/show_bug.cgi?id=3D105678">Undefined
              reference to stacktrace standard library </a> </td>
          <td class=3D"bz_changeddate_column nowrap">2022-08-23 </td>
        </tr>
        <tr id=3D"b109165" class=3D"bz_bugitem bz_normal bz_P3 bz_RESOLVE=
D
          bz_FIXED bz_row_odd ">
          <td class=3D"first-child bz_id_column"> <a href=3D"https://gcc.=
gnu.org/bugzilla/show_bug.cgi?id=3D109165">109165</a>
          </td>
          <td class=3D"bz_product_column nowrap"> <span title=3D"gcc">gcc=
 </span>
          </td>
          <td class=3D"bz_component_column nowrap"> <span title=3D"libstd=
c++">libstdc+ </span> </td>
          <td class=3D"bz_assigned_to_column nowrap"> <span title=3D"redi=
">redi
            </span> </td>
          <td class=3D"bz_bug_status_column nowrap"> <span title=3D"RESOL=
VED">RESO </span> </td>
          <td class=3D"bz_resolution_column nowrap"> <span title=3D"FIXED=
">FIXE
            </span> </td>
          <td class=3D"bz_short_desc_column"> <a href=3D"https://gcc.gnu.=
org/bugzilla/show_bug.cgi?id=3D109165">std::hash&lt;coroutine_handle&lt;&=
gt;&gt;::operator()
              should be const </a> </td>
          <td class=3D"bz_changeddate_column nowrap">2023-03-20 </td>
        </tr>
        <tr id=3D"b109182" class=3D"bz_bugitem bz_normal bz_P3 bz_RESOLVE=
D
          bz_FIXED bz_row_even ">
          <td class=3D"first-child bz_id_column"> <a href=3D"https://gcc.=
gnu.org/bugzilla/show_bug.cgi?id=3D109182">109182</a>
          </td>
          <td class=3D"bz_product_column nowrap"> <span title=3D"gcc">gcc=
 </span>
          </td>
          <td class=3D"bz_component_column nowrap"> <span title=3D"libstd=
c++">libstdc+ </span> </td>
          <td class=3D"bz_assigned_to_column nowrap"> <span title=3D"redi=
">redi
            </span> </td>
          <td class=3D"bz_bug_status_column nowrap"> <span title=3D"RESOL=
VED">RESO </span> </td>
          <td class=3D"bz_resolution_column nowrap"> <span title=3D"FIXED=
">FIXE
            </span> </td>
          <td class=3D"bz_short_desc_column"> <a href=3D"https://gcc.gnu.=
org/bugzilla/show_bug.cgi?id=3D109182">unused
              parameter pack is in expected(in_place_t) </a> </td>
          <td class=3D"bz_changeddate_column nowrap">2023-03-20 </td>
        </tr>
        <tr id=3D"b109242" class=3D"bz_bugitem bz_normal bz_P3 bz_RESOLVE=
D
          bz_FIXED bz_row_odd ">
          <td class=3D"first-child bz_id_column"> <a href=3D"https://gcc.=
gnu.org/bugzilla/show_bug.cgi?id=3D109242">109242</a>
          </td>
          <td class=3D"bz_product_column nowrap"> <span title=3D"gcc">gcc=
 </span>
          </td>
          <td class=3D"bz_component_column nowrap"> <span title=3D"libstd=
c++">libstdc+ </span> </td>
          <td class=3D"bz_assigned_to_column nowrap"> <span title=3D"redi=
">redi
            </span> </td>
          <td class=3D"bz_bug_status_column nowrap"> <span title=3D"RESOL=
VED">RESO </span> </td>
          <td class=3D"bz_resolution_column nowrap"> <span title=3D"FIXED=
">FIXE
            </span> </td>
          <td class=3D"bz_short_desc_column"> <a href=3D"https://gcc.gnu.=
org/bugzilla/show_bug.cgi?id=3D109242">C++2b
              std::optional::transform omits required std::remove_cv_t
              from return optional type </a> </td>
          <td class=3D"bz_changeddate_column nowrap">2023-03-30 </td>
        </tr>
        <tr id=3D"b99417" class=3D"bz_bugitem bz_normal bz_P3 bz_RESOLVED
          bz_FIXED bz_row_even ">
          <td class=3D"first-child bz_id_column"> <a href=3D"https://gcc.=
gnu.org/bugzilla/show_bug.cgi?id=3D99417">99417</a>
          </td>
          <td class=3D"bz_product_column nowrap"> <span title=3D"gcc">gcc=
 </span>
          </td>
          <td class=3D"bz_component_column nowrap"> <span title=3D"libstd=
c++">libstdc+ </span> </td>
          <td class=3D"bz_assigned_to_column nowrap"> <span title=3D"unas=
signed">unassigned </span> </td>
          <td class=3D"bz_bug_status_column nowrap"> <span title=3D"RESOL=
VED">RESO </span> </td>
          <td class=3D"bz_resolution_column nowrap"> <span title=3D"FIXED=
">FIXE
            </span> </td>
          <td class=3D"bz_short_desc_column"> <a href=3D"https://gcc.gnu.=
org/bugzilla/show_bug.cgi?id=3D99417">[C++17]
              std::variant assignment fails to compile </a> </td>
          <td class=3D"bz_changeddate_column nowrap">2023-05-16 </td>
        </tr>
        <tr id=3D"b103325" class=3D"bz_bugitem bz_enhancement bz_P3
          bz_RESOLVED bz_FIXED bz_row_odd ">
          <td class=3D"first-child bz_id_column"> <a href=3D"https://gcc.=
gnu.org/bugzilla/show_bug.cgi?id=3D103325">103325</a>
          </td>
          <td class=3D"bz_product_column nowrap"> <span title=3D"gcc">gcc=
 </span>
          </td>
          <td class=3D"bz_component_column nowrap"> <span title=3D"tree-o=
ptimization">tree-opt </span> </td>
          <td class=3D"bz_assigned_to_column nowrap"> <span title=3D"unas=
signed">unassigned </span> </td>
          <td class=3D"bz_bug_status_column nowrap"> <span title=3D"RESOL=
VED">RESO </span> </td>
          <td class=3D"bz_resolution_column nowrap"> <span title=3D"FIXED=
">FIXE
            </span> </td>
          <td class=3D"bz_short_desc_column"> <a href=3D"https://gcc.gnu.=
org/bugzilla/show_bug.cgi?id=3D103325">1
              &lt;&lt; -1 is never reduced to a constant during gimple </=
a>
          </td>
          <td class=3D"bz_changeddate_column nowrap">2023-05-28 </td>
        </tr>
        <tr id=3D"b106714" class=3D"bz_bugitem bz_normal bz_P3 bz_RESOLVE=
D
          bz_FIXED bz_row_even ">
          <td class=3D"first-child bz_id_column"> <a href=3D"https://gcc.=
gnu.org/bugzilla/show_bug.cgi?id=3D106714">106714</a>
          </td>
          <td class=3D"bz_product_column nowrap"> <span title=3D"gcc">gcc=
 </span>
          </td>
          <td class=3D"bz_component_column nowrap"> <span title=3D"target=
">target
            </span> </td>
          <td class=3D"bz_assigned_to_column nowrap"> <span title=3D"unas=
signed">unassigned </span> </td>
          <td class=3D"bz_bug_status_column nowrap"> <span title=3D"RESOL=
VED">RESO </span> </td>
          <td class=3D"bz_resolution_column nowrap"> <span title=3D"FIXED=
">FIXE
            </span> </td>
          <td class=3D"bz_short_desc_column"> <a href=3D"https://gcc.gnu.=
org/bugzilla/show_bug.cgi?id=3D106714">Incorrect
              casts in macros in amxtileintrin.h </a> </td>
          <td class=3D"bz_changeddate_column nowrap">2022-08-29 </td>
        </tr>
        <tr id=3D"b107121" class=3D"bz_bugitem bz_normal bz_P3 bz_RESOLVE=
D
          bz_FIXED bz_row_odd ">
          <td class=3D"first-child bz_id_column"> <a href=3D"https://gcc.=
gnu.org/bugzilla/show_bug.cgi?id=3D107121">107121</a>
          </td>
          <td class=3D"bz_product_column nowrap"> <span title=3D"gcc">gcc=
 </span>
          </td>
          <td class=3D"bz_component_column nowrap"> <span title=3D"tree-o=
ptimization">tree-opt </span> </td>
          <td class=3D"bz_assigned_to_column nowrap"> <span title=3D"unas=
signed">unassigned </span> </td>
          <td class=3D"bz_bug_status_column nowrap"> <span title=3D"RESOL=
VED">RESO </span> </td>
          <td class=3D"bz_resolution_column nowrap"> <span title=3D"FIXED=
">FIXE
            </span> </td>
          <td class=3D"bz_short_desc_column"> <a href=3D"https://gcc.gnu.=
org/bugzilla/show_bug.cgi?id=3D107121">DEFERRED_INIT
              misspelled in error message </a> </td>
          <td class=3D"bz_changeddate_column nowrap">2022-11-28 </td>
        </tr>
        <tr id=3D"b107206" class=3D"bz_bugitem bz_normal bz_P3 bz_RESOLVE=
D
          bz_FIXED bz_row_even ">
          <td class=3D"first-child bz_id_column"> <a href=3D"https://gcc.=
gnu.org/bugzilla/show_bug.cgi?id=3D107206">107206</a>
          </td>
          <td class=3D"bz_product_column nowrap"> <span title=3D"gcc">gcc=
 </span>
          </td>
          <td class=3D"bz_component_column nowrap"> <span title=3D"tree-o=
ptimization">tree-opt </span> </td>
          <td class=3D"bz_assigned_to_column nowrap"> <span title=3D"unas=
signed">unassigned </span> </td>
          <td class=3D"bz_bug_status_column nowrap"> <span title=3D"RESOL=
VED">RESO </span> </td>
          <td class=3D"bz_resolution_column nowrap"> <span title=3D"FIXED=
">FIXE
            </span> </td>
          <td class=3D"bz_short_desc_column"> <a href=3D"https://gcc.gnu.=
org/bugzilla/show_bug.cgi?id=3D107206">Bogus
              -Wuninitialized in std::optional </a> </td>
          <td class=3D"bz_changeddate_column nowrap">2022-11-28 </td>
        </tr>
        <tr id=3D"b107713" class=3D"bz_bugitem bz_normal bz_P3 bz_RESOLVE=
D
          bz_FIXED bz_row_odd ">
          <td class=3D"first-child bz_id_column"> <a href=3D"https://gcc.=
gnu.org/bugzilla/show_bug.cgi?id=3D107713">107713</a>
          </td>
          <td class=3D"bz_product_column nowrap"> <span title=3D"gcc">gcc=
 </span>
          </td>
          <td class=3D"bz_component_column nowrap"> <span title=3D"target=
">target
            </span> </td>
          <td class=3D"bz_assigned_to_column nowrap"> <span title=3D"unas=
signed">unassigned </span> </td>
          <td class=3D"bz_bug_status_column nowrap"> <span title=3D"RESOL=
VED">RESO </span> </td>
          <td class=3D"bz_resolution_column nowrap"> <span title=3D"FIXED=
">FIXE
            </span> </td>
          <td class=3D"bz_short_desc_column"> <a href=3D"https://gcc.gnu.=
org/bugzilla/show_bug.cgi?id=3D107713">Wrong
              implementation atomic_exchange&lt;short&gt; on LoongArch </=
a>
          </td>
          <td class=3D"bz_changeddate_column nowrap">2022-11-20 </td>
        </tr>
        <tr id=3D"b108097" class=3D"bz_bugitem bz_normal bz_P3 bz_RESOLVE=
D
          bz_FIXED bz_row_even ">
          <td class=3D"first-child bz_id_column"> <a href=3D"https://gcc.=
gnu.org/bugzilla/show_bug.cgi?id=3D108097">108097</a>
          </td>
          <td class=3D"bz_product_column nowrap"> <span title=3D"gcc">gcc=
 </span>
          </td>
          <td class=3D"bz_component_column nowrap"> <span title=3D"libstd=
c++">libstdc+ </span> </td>
          <td class=3D"bz_assigned_to_column nowrap"> <span title=3D"unas=
signed">unassigned </span> </td>
          <td class=3D"bz_bug_status_column nowrap"> <span title=3D"RESOL=
VED">RESO </span> </td>
          <td class=3D"bz_resolution_column nowrap"> <span title=3D"FIXED=
">FIXE
            </span> </td>
          <td class=3D"bz_short_desc_column"> <a href=3D"https://gcc.gnu.=
org/bugzilla/show_bug.cgi?id=3D108097">std::stacktrace
              AddressSanitizer: new-delete-type-mismatch on
              0x615000000080 in thread T0 </a> </td>
          <td class=3D"bz_changeddate_column nowrap">2022-12-14 </td>
        </tr>
        <tr id=3D"b109000" class=3D"bz_bugitem bz_normal bz_P3 bz_RESOLVE=
D
          bz_FIXED bz_row_odd ">
          <td class=3D"first-child bz_id_column"> <a href=3D"https://gcc.=
gnu.org/bugzilla/show_bug.cgi?id=3D109000">109000</a>
          </td>
          <td class=3D"bz_product_column nowrap"> <span title=3D"gcc">gcc=
 </span>
          </td>
          <td class=3D"bz_component_column nowrap"> <span title=3D"target=
">target
            </span> </td>
          <td class=3D"bz_assigned_to_column nowrap"> <span title=3D"xry1=
11">xry111 </span> </td>
          <td class=3D"bz_bug_status_column nowrap"> <span title=3D"RESOL=
VED">RESO </span> </td>
          <td class=3D"bz_resolution_column nowrap"> <span title=3D"FIXED=
">FIXE
            </span> </td>
          <td class=3D"bz_short_desc_column"> <a href=3D"https://gcc.gnu.=
org/bugzilla/show_bug.cgi?id=3D109000">LoongArch:
              &quot;unmatched&quot; -mabi and -mfpu setting can break ABI=
 silently
            </a> </td>
          <td class=3D"bz_changeddate_column nowrap">2023-03-06 </td>
        </tr>
        <tr id=3D"b104554" class=3D"bz_bugitem bz_normal bz_P4 bz_RESOLVE=
D
          bz_FIXED bz_row_even ">
          <td class=3D"first-child bz_id_column"> <a href=3D"https://gcc.=
gnu.org/bugzilla/show_bug.cgi?id=3D104554">104554</a>
          </td>
          <td class=3D"bz_product_column nowrap"> <span title=3D"gcc">gcc=
 </span>
          </td>
          <td class=3D"bz_component_column nowrap"> <span title=3D"fortra=
n">fortran
            </span> </td>
          <td class=3D"bz_assigned_to_column nowrap"> <span title=3D"anla=
uf">anlauf </span> </td>
          <td class=3D"bz_bug_status_column nowrap"> <span title=3D"RESOL=
VED">RESO </span> </td>
          <td class=3D"bz_resolution_column nowrap"> <span title=3D"FIXED=
">FIXE
            </span> </td>
          <td class=3D"bz_short_desc_column"> <a href=3D"https://gcc.gnu.=
org/bugzilla/show_bug.cgi?id=3D104554">ICE
              in check_assumed_size_reference, at
              fortran/resolve.cc:1650</a><br>
          </td>
        </tr>
      </tbody>
    </table>
    <p><br>
    </p>
    <p>Sorry for the HTML table but hopefully people can read it.</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20230623164055.89846-1-sundeep.=
kokkonda@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Signed-off-by: Sundeep KOKKONDA <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:sundeep.kokkonda@windriver.com">&lt;sundeep.kokkonda@windriver.co=
m&gt;</a>
---
 meta/recipes-devtools/gcc/{gcc-12.2.inc =3D&gt; gcc-12.3.inc}    | 6 +++=
---
 ...cc-cross-canadian_12.2.bb =3D&gt; gcc-cross-canadian_12.3.bb} | 0
 .../gcc/{gcc-cross_12.2.bb =3D&gt; gcc-cross_12.3.bb}            | 0
 .../gcc/{gcc-crosssdk_12.2.bb =3D&gt; gcc-crosssdk_12.3.bb}      | 0
 .../gcc/{gcc-runtime_12.2.bb =3D&gt; gcc-runtime_12.3.bb}        | 0
 .../gcc/{gcc-sanitizers_12.2.bb =3D&gt; gcc-sanitizers_12.3.bb}  | 0
 .../gcc/{gcc-source_12.2.bb =3D&gt; gcc-source_12.3.bb}          | 0
 meta/recipes-devtools/gcc/{gcc_12.2.bb =3D&gt; gcc_12.3.bb}      | 0
 .../gcc/{libgcc-initial_12.2.bb =3D&gt; libgcc-initial_12.3.bb}  | 0
 .../recipes-devtools/gcc/{libgcc_12.2.bb =3D&gt; libgcc_12.3.bb} | 0
 .../gcc/{libgfortran_12.2.bb =3D&gt; libgfortran_12.3.bb}        | 0
 11 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-12.2.inc =3D&gt; gcc-12.3.inc} (97=
%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_12.2.bb =3D&gt; gcc=
-cross-canadian_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_12.2.bb =3D&gt; gcc-cross_12=
.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_12.2.bb =3D&gt; gcc-cross=
sdk_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_12.2.bb =3D&gt; gcc-runtim=
e_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_12.2.bb =3D&gt; gcc-san=
itizers_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_12.2.bb =3D&gt; gcc-source_=
12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_12.2.bb =3D&gt; gcc_12.3.bb} (100%=
)
 rename meta/recipes-devtools/gcc/{libgcc-initial_12.2.bb =3D&gt; libgcc-=
initial_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_12.2.bb =3D&gt; libgcc_12.3.bb}=
 (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_12.2.bb =3D&gt; libgfortra=
n_12.3.bb} (100%)

diff --git a/meta/recipes-devtools/gcc/gcc-12.2.inc b/meta/recipes-devtoo=
ls/gcc/gcc-12.3.inc
similarity index 97%
rename from meta/recipes-devtools/gcc/gcc-12.2.inc
rename to meta/recipes-devtools/gcc/gcc-12.3.inc
index 0dbbecad4a..4ec03f925c 100644
--- a/meta/recipes-devtools/gcc/gcc-12.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-12.3.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
=20
 # Third digit in PV should be incremented after a minor release
=20
-PV =3D &quot;12.2.0&quot;
+PV =3D &quot;12.3.0&quot;
=20
 # BINV should be incremented to a revision after a minor gcc release
=20
-BINV =3D &quot;12.2.0&quot;
+BINV =3D &quot;12.3.0&quot;
=20
 FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backp=
ort:&quot;
=20
@@ -64,7 +64,7 @@ SRC_URI =3D &quot;${BASEURI} \
            <a class=3D"moz-txt-link-freetext" href=3D"file://prefix-map-=
realpath.patch">file://prefix-map-realpath.patch</a> \
            <a class=3D"moz-txt-link-freetext" href=3D"file://hardcoded-p=
aths.patch">file://hardcoded-paths.patch</a> \
 &quot;
-SRC_URI[sha256sum] =3D &quot;e549cf9cf3594a00e27b6589d4322d70e0720cdd213=
f39beb4181e06926230ff&quot;
+SRC_URI[sha256sum] =3D &quot;949a5d4f99e786421a93b532b22ffab5578de732136=
9975b91aec97adfda8c3b&quot;
=20
 S =3D &quot;${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}&quot;
 B =3D &quot;${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}&quot;
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_12.2.bb b/meta/=
recipes-devtools/gcc/gcc-cross-canadian_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_12.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_12.2.bb b/meta/recipes-d=
evtools/gcc/gcc-cross_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross_12.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_12.2.bb b/meta/recipe=
s-devtools/gcc/gcc-crosssdk_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_12.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb b/meta/recipes=
-devtools/gcc/gcc-runtime_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_12.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb b/meta/reci=
pes-devtools/gcc/gcc-sanitizers_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_12.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_12.2.bb b/meta/recipes-=
devtools/gcc/gcc-source_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-source_12.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc_12.2.bb b/meta/recipes-devtool=
s/gcc/gcc_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_12.2.bb
rename to meta/recipes-devtools/gcc/gcc_12.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_12.2.bb b/meta/reci=
pes-devtools/gcc/libgcc-initial_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_12.2.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_12.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_12.2.bb b/meta/recipes-devt=
ools/gcc/libgcc_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_12.2.bb
rename to meta/recipes-devtools/gcc/libgcc_12.3.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_12.2.bb b/meta/recipes=
-devtools/gcc/libgfortran_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_12.2.bb
rename to meta/recipes-devtools/gcc/libgfortran_12.3.bb
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------ARClsETxA76DRhUKFjqv0hre--

