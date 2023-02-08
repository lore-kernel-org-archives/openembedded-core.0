Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E657C636CC
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:48:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3517.1675842529832046290
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:48:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=TkZOUlme;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=14035990f2=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3186usjG032142
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Feb 2023 07:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=F2QTu3s1Qbg8nzZ+SxPKYPqXR0wWWH75HwNJSb3rXl0=;
 b=TkZOUlmeAKDT890aWhXCrSylrfKOjHZuuCakt1F3pF5CKMTxuskw6L6I2VqQMYJyoHi0
 x80wNqBQriog799UU52EYkZ1nEDopcrYWMqvLWcc8bnXZ5c0BV2ifbWNXO7yrnhYa1fr
 9Jbmfm4aEKAp2qBQx3latsFogGLPfpvzuyj+Go/ss1rvHoz0yanuf7m+CT8r8kBW6i5U
 SKrZkVaJwTWh2pOgaHqINzGVJyNHJpR/pCYXhlz1ag0PVb9AFTzIOTUhDvN4Je60sq97
 nW21d2VZbjC2NxouFJlRFL7cbo8+KDrQ1el/pBHc7a9kAAmc2ZrY8mCd1dev/f6gh2va jg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhebabtpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:48:48 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3187mmi8021267
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Feb 2023 07:48:48 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhebabtpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 07:48:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHmy1Cop2eCTbGbAoRreeqM7noGb5zhR/tRg737TLYMr7nx3HqSlJJXTWpN7OONCfMud4p0ZLqziUna3hdxOuvog8TNHvTULrqL0BBoVUIfZrNKWeWZUcI5YUOHWJLvcHtL9LghLInsKsLkAcQL4Q+pWwpipOBnu2Sgcvl+PR+exhJ8PONSQphKWo6QrsVDwph6/qoZ6JWIIsANGHGiCM6emE1LQ34PBFgr9eQmuNJJbKx/ORJEfqJ5+hHXA3erwj1bLZYg61L2d4p51afRoMu+FoRihKo7VjD4kgoPYO2ksxZR3E+t09VthHEz4yEfUR1DmAaFAoRfzKfXSIRGhQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2QTu3s1Qbg8nzZ+SxPKYPqXR0wWWH75HwNJSb3rXl0=;
 b=Pu7sPcFtXaYshwO5ECGL0T+0MZyngnckVeC+H176TjNV0Z0EVKNqAnVi97qvAR953+KzZEBVvcORC+8NFYJbkof87Le8lt0PI2yOgkyySiMMX6GeAU0QO2aduM72mLvoFH3PMmUfSZTH+ffDVN+VhPt8pBwWkEO4acR+6Enmq0zLJX23VW9seRxR3ZYBjV8u5JimzZUA2H+9DwN2Flf43YZBZPEqTaKXM1WDynvxVKaEyX18UrCWMDkPSbJ8ythradYXikrREyZN65l2GLU7gejBvYUyf+qL8SpGaUNEIr3O9mE6rYUCP4kt3qvlvMCV9CBWCsCQ2VPF2xUQTgL3oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB6328.namprd11.prod.outlook.com (2603:10b6:8:cc::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.32; Wed, 8 Feb 2023 07:48:46 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7%3]) with mapi id 15.20.6064.034; Wed, 8 Feb 2023
 07:48:45 +0000
Message-ID: <91a725de-88b4-6dad-cd41-f6a44cd5d685@windriver.com>
Date: Wed, 8 Feb 2023 15:48:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [PATCH 01/52] ifupdown: update 0.8.43 -> 0.8.41
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0084.namprd03.prod.outlook.com
 (2603:10b6:a03:331::29) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: 4db78a31-9fd4-4a23-d8f9-08db09a8e7fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MBTRqdqq0felXggxUlWjoyoVtUUbpPGyQbYpBflZTbk97ZsDl8pEXG4JJbwD+4Zj/XU7gcTGflnISqCL8J+M7YPcfX/YFP7wGe9TYhIdZsTM9okORJhUGIzYx+LsC2zW0QsLuuSN8D/WuffDOACrgYP1HqdnC561RLdzJHNSm1S0xozc2/wjfGt1jIj0So6SiAqSncTSiR4fPzzXtEidmHEiX5CSmiw1AOv9i5LuPgtkgz1f9XSqqn7WNjUgmaP4eUaEF7rTlo2r1B8R07p2W1JRyoGsj0DI6KckTCJFdfTncBxlehJdqc/Fygn4wexAgXdioSe1j/XbNlEb8Yo/3yX5222Y712CeS0Hxv0c247Wl7Dtzlfza/LSiqn/XyvqD410WGW/4VNNaU4oifErXU0SyuuTKVj48QbDC+Xc3UfD5Sm3GaRS4X9uiJDMoJTFhjxbDY759Nnb8K+00Fo2j3sJ2WiXaEIiGG2IQ/n2URCim6q+8jswvdrqr+psH5PaaddsR5gsNIB69yFd6gVx7W/1jZ1+NgfTQeTK9Q7MZXjthB7AM+7tNaahJVhhYa8DDd9n6680uyhyF7Q0QNp9xtWO1Bo89nRvQ7vEuQaZR+JhvDfxebInCazJWLtN6AZwunK2udRxIDWFlTzf63+iOFy9190b3KGw0sO2kigwPcWKEKs1xBFZu1I0n5z/ZSuCkEEa8IxOc20tNo4mdhSCWcb1n6wzQSEEaM3Mufl5EKHqvP7HM1BWh945he70ii1bL6NkopMm46aQKiw8Y1A+p1ojati7yRCArp8KoCa8jP+OjKRuJgsSl3w7iVQz0bON
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(39850400004)(136003)(366004)(376002)(451199018)(5660300002)(31686004)(8936002)(66946007)(30864003)(186003)(26005)(6512007)(41300700001)(38100700002)(86362001)(31696002)(53546011)(8676002)(4326008)(66476007)(6506007)(66556008)(66899018)(966005)(6486002)(2616005)(316002)(83380400001)(6666004)(15650500001)(478600001)(36756003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dzF4ZDVwWXNuZTh6WHRCd3J1MGdWYWFvanJCb25JZUZRbDFXeERXMXB6VElB?=
 =?utf-8?B?c2cvN2pUV2xHUXZyZ2tVOHVUL2szby8ycUMyc01VWDEyUDRqaU1KcjBrVnZU?=
 =?utf-8?B?TFpud0JyaXVqdHNUU0drSWpDTG8vU1JCdDZuUFlIdnRtbmhBeitTQU92d0cw?=
 =?utf-8?B?M3Ixb1MwNlRDK1hjVTI3WXd4UGdSRUVxL0pZWEZRQlZLRGV1SUszQXdsc1kr?=
 =?utf-8?B?ak5pZXFzVnRUREozSnVCMlBXK0psZ3ZTeFgvcTlpclNmWk5GVENzRlZFc2hI?=
 =?utf-8?B?cHJaN3h0SkxvbUZ0YXR1NnExYTBidVc3T0syaXJCalM5OW9LUjZtYlpRNnBk?=
 =?utf-8?B?U2xNTGgxTjdaQkdCZ2VoUHhvYXZMYkw5TVMrN1pxTk5YNzgyMlBwVVVKdkcx?=
 =?utf-8?B?dUQrT0pKb25iSHllRVRKZUh4S3I2a21MNEZIWnBqa25mY0U4Ni9PRmlUSWh1?=
 =?utf-8?B?Y3RLd2Nkd1k3Mzc2TXlvVDBtRGVtM2xqZTB5VlhuOEJPNWdsUkFJQ1A4SCtO?=
 =?utf-8?B?alhzYkNTdE5ybk9pd2x3THNOY2E1R3pOeGlMcmpLcWx1UlVrc25pbXNFdlRk?=
 =?utf-8?B?ZTVLVmFtczFXaW1pdjVpUjFLV1ZLdHYxWkxjTnN3ZUhReUpLRHhzWDArUHpt?=
 =?utf-8?B?M1liMmIreE1kcGd3TFo4M1RXdXVsclVQR21rZFZIdmpRNUZobU1vMGFVL3Nu?=
 =?utf-8?B?MG45aWliUnl1YVhMNjNJSFJPUnBvL2ppbXU5M2JIVmliMFlBb1F5SDhIbk5N?=
 =?utf-8?B?Z1JXSHIrVTViUjM3TDRFTUV5UVVpQUw1TWZvcG16MXp1dm1BU2RoOTlpUHFW?=
 =?utf-8?B?VE1vcHJXandtcXBBRXF2TmlhYTJEZk9JbGZodWM4TW1tRFZ2THB4Y0wzQ2V5?=
 =?utf-8?B?RXpJUXRkdEg4NFF6V1pHL09iTVJQK3RLT1lVWWthRWdycU5SU1NjUkxaUmpV?=
 =?utf-8?B?eXRGNzQ5V2hpZFZjNDVuUklZcnVRZUxBcUtadWN5R2dTdjFzZy9veUU0bThs?=
 =?utf-8?B?bjVBNHFFWk84SnozOUQxK0dHVUlwdkJQL0QzamdCRlBxRXY3eWhMNDJHaitk?=
 =?utf-8?B?aitXSGp4Y1ozbWU0RER1ckpvV0t2YzVEYVZ4REpVYmhMYnM4SklEQ0xzZGxO?=
 =?utf-8?B?cDJZVngyUzlJa053UWdNMU1SSC9nQUR2eE9RQWpJMmlnSVNpOCtSNEhBQUJj?=
 =?utf-8?B?eU42QU5UaEtYWmRDalVKemFnaVJJUERMbC9nL2ovZ0dXc3FtSEdKN01iQTNO?=
 =?utf-8?B?c05VLzY4SXhvMWt5SlhQK0NNSjJjbXFORXhyaWt6Z21CWmY3Y1BMWlFZNGxj?=
 =?utf-8?B?dHFmOVArN0NvNEpQd1NIZnpKd3NZejVDMERQV2ZnREhES2hwd0hxdHZ1Mk1T?=
 =?utf-8?B?OFhORkljQmdPd3dqUkZDN0N4bTZDdXMvK08rNWEzZGxhMkxoNzU0ZGJIUnFh?=
 =?utf-8?B?VFZiV0xyZ0lQTmxRQXA2UE5TUkVMTUtUcVREYXZtUzk4NVFFOEFrMTFGa1Vy?=
 =?utf-8?B?aGpEZ2cwTlNnRTJtbVZCbDZhRTdoTm9FalFSbDdsbVBQUlBJUVFObFpmWVoz?=
 =?utf-8?B?Wmh5TWMxWW5iODY0ajNmTnQ3Z0FrWmNMcjRpaUNWMzRISDJUcHRrVlNOSWRx?=
 =?utf-8?B?bVU2OEp3S1RLNlJrREwySGt4QTJUTlVtM0ZJaURVV1BpNnp2UitNV01kSjdC?=
 =?utf-8?B?OWtyVHdzN3FmTHdxU0NobXlTMzV6cW9JOHZwN0YrQ3huaDEwOEdzRWRaSjRa?=
 =?utf-8?B?NHgzY1Z4T0NUYnc5UGlMMUduRGN2WHcrM0N5SmRxY2JRQ1daMGVuWXNsWllS?=
 =?utf-8?B?dytsdlZ0K0YxUE1hQTBTTG5LT3RXYlJaazlyYno2QjZyUVhYSDlMU0VmYmtX?=
 =?utf-8?B?TEJ0aktMaE5ORkNwWXRyWGxUL3ZyWDd4b3RXdURTTWVhQ3J3MVpsamdqcGxV?=
 =?utf-8?B?a05WdDBoeUxEc2RrZGROZDlPdThOeGFMK0h1UGY3R1Zxd2txNUVpbENrN2VW?=
 =?utf-8?B?eGFWTEdxbk9LblVhbG1ZUXhxbGtnRXhZZXZKaTQraHpnYVgxZnlJU0RyM1du?=
 =?utf-8?B?OEY0dGRpb3Q5SjNvcVMrZGFuM1FLWGdpK2phczVpdVFNTDJBUnFiQlJ3czUx?=
 =?utf-8?Q?xL0IXu39yE8qY4pP+S1K7qmiF?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4db78a31-9fd4-4a23-d8f9-08db09a8e7fd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 07:48:45.5791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5XkQd/+PlFe7P+DIryv79K3Y7tdm5Y6lZHT7RUxKAnEdr+u6XlqlNUCNCufBQA7ySEWv64mFO2PkfSGD72s+gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6328
X-Proofpoint-ORIG-GUID: JV2xAsQZp0aMRQYWuJIwY_8tjMCfCMJ-
X-Proofpoint-GUID: Ak9_sWUDmkIZk3aiP5eKYvMPGk8Ua-Ex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_02,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 adultscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302080068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176894

Typo. It should be 0.8.39 -> 0.8.41

Regards,
Qi

On 2/8/23 15:20, Alexander Kanavin wrote:
> Do not apply patch conditionally, there is no need for that,
> and conditional patches are problematic with upgrades and devtool.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   .../0001-Define-FNM_EXTMATCH-for-musl.patch   |  8 +++-----
>   ...not-use-dpkg-for-determining-OS-type.patch |  3 ++-
>   .../0001-ifupdown-skip-wrong-test-case.patch  | 12 +++++-------
>   ...t-rely-on-dpkg-architecture-to-set-a.patch | 10 ++++------
>   .../ifupdown/files/tweak-ptest-script.patch   | 19 +++++++++++--------
>   ...{ifupdown_0.8.39.bb => ifupdown_0.8.41.bb} |  8 ++++----
>   6 files changed, 29 insertions(+), 31 deletions(-)
>   rename meta/recipes-core/ifupdown/{ifupdown_0.8.39.bb => ifupdown_0.8.41.bb} (92%)
>
> diff --git a/meta/recipes-core/ifupdown/files/0001-Define-FNM_EXTMATCH-for-musl.patch b/meta/recipes-core/ifupdown/files/0001-Define-FNM_EXTMATCH-for-musl.patch
> index 7bf02ea536..6c4ed526bf 100644
> --- a/meta/recipes-core/ifupdown/files/0001-Define-FNM_EXTMATCH-for-musl.patch
> +++ b/meta/recipes-core/ifupdown/files/0001-Define-FNM_EXTMATCH-for-musl.patch
> @@ -1,4 +1,4 @@
> -From ff714d6461569d69b253089110ec659e4ebec248 Mon Sep 17 00:00:00 2001
> +From 8dfbcf02e424ba1fdef587d81c9e08a37ab8c1b6 Mon Sep 17 00:00:00 2001
>   From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>   Date: Tue, 2 Jul 2019 20:10:42 +0200
>   Subject: [PATCH] Define FNM_EXTMATCH for musl
> @@ -24,12 +24,13 @@ function); did you mean 'FNM_NOMATCH'?
>   Upstream-Status: Submitted [https://salsa.debian.org/debian/ifupdown/merge_requests/5]
>   
>   Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> +
>   ---
>    archcommon.h | 4 ++++
>    1 file changed, 4 insertions(+)
>   
>   diff --git a/archcommon.h b/archcommon.h
> -index fe99950..f257f9d 100644
> +index 818b0b6..ad9cd1a 100644
>   --- a/archcommon.h
>   +++ b/archcommon.h
>   @@ -1,5 +1,9 @@
> @@ -42,6 +43,3 @@ index fe99950..f257f9d 100644
>    bool execable(const char *);
>    
>    #define iface_is_link() (!_iface_has(ifd->real_iface, ":."))
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-core/ifupdown/files/0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch b/meta/recipes-core/ifupdown/files/0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch
> index 57c8d04fd7..6e15a25224 100644
> --- a/meta/recipes-core/ifupdown/files/0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch
> +++ b/meta/recipes-core/ifupdown/files/0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch
> @@ -1,10 +1,11 @@
> -From 7ace0656bd325f9e7749f2cde641eddc057bc98a Mon Sep 17 00:00:00 2001
> +From 7fe516cbaf9fda09d99dcb54d4645367cffc8a4d Mon Sep 17 00:00:00 2001
>   From: Alexander Kanavin <alex.kanavin@gmail.com>
>   Date: Thu, 9 Jan 2020 15:38:06 +0100
>   Subject: [PATCH] Makefile: do not use dpkg for determining OS type
>   
>   Upstream-Status: Inappropriate [oe-core specific]
>   Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>   ---
>    Makefile | 2 +-
>    1 file changed, 1 insertion(+), 1 deletion(-)
> diff --git a/meta/recipes-core/ifupdown/files/0001-ifupdown-skip-wrong-test-case.patch b/meta/recipes-core/ifupdown/files/0001-ifupdown-skip-wrong-test-case.patch
> index c751e4fab0..9ae24da51e 100644
> --- a/meta/recipes-core/ifupdown/files/0001-ifupdown-skip-wrong-test-case.patch
> +++ b/meta/recipes-core/ifupdown/files/0001-ifupdown-skip-wrong-test-case.patch
> @@ -1,4 +1,4 @@
> -From 98243deface88614e3f332c4a85d04a9abce55ff Mon Sep 17 00:00:00 2001
> +From 782d8a869c266820d0f34974436f244f67afaea7 Mon Sep 17 00:00:00 2001
>   From: Zqiang <qiang.zhang@windriver.com>
>   Date: Mon, 19 Apr 2021 14:15:45 +0800
>   Subject: [PATCH] ifupdown: skip wrong test case
> @@ -10,23 +10,21 @@ and are skipped directly.
>   Upstream-Status: Inappropriate [oe-core specific]
>   
>   Signed-off-by: Zqiang <qiang.zhang@windriver.com>
> +
>   ---
>    tests/testbuild-linux | 2 +-
>    1 file changed, 1 insertion(+), 1 deletion(-)
>   
>   diff --git a/tests/testbuild-linux b/tests/testbuild-linux
> -index 1181ea0..5f148eb 100755
> +index 2fa1b8b..2c69856 100755
>   --- a/tests/testbuild-linux
>   +++ b/tests/testbuild-linux
>   @@ -3,7 +3,7 @@
>    dir=tests/linux
>    
>    result=true
> --for test in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18; do
> -+for test in 1 2 3 4 5 6 7 8 9 10 11 16 17 18; do
> +-for test in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19; do
> ++for test in 1 2 3 4 5 6 7 8 9 10 11 16 17 18 19; do
>    	if [ -e $dir/testcase.$test ]; then
>    		args="$(cat $dir/testcase.$test | sed -n 's/^# RUN: //p')"
>    	else
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch b/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
> index d1c3d260ed..7b4b761e6a 100644
> --- a/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
> +++ b/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
> @@ -1,7 +1,7 @@
> -From 40257d65b338b6e2ed9d89d6fa7c7b8701a4c311 Mon Sep 17 00:00:00 2001
> +From fc8e8d4cb19ff30e69aa1855332544f1017f974c Mon Sep 17 00:00:00 2001
>   From: Paul Gortmaker <paul.gortmaker@windriver.com>
>   Date: Wed, 6 Aug 2014 14:54:12 -0400
> -Subject: [PATCH 1/2] defn2[c|man]: don't rely on dpkg-architecture to set arch
> +Subject: [PATCH] defn2[c|man]: don't rely on dpkg-architecture to set arch
>   
>   In yocto we'll always be cross compiling, and we'll always
>   be building on linux for linux (vs. *BSD, hurd, etc.)
> @@ -13,13 +13,14 @@ like the loopback device not being configured/enabled.
>   
>   Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>   Upstream-Status: Pending
> +
>   ---
>    defn2c.pl   | 6 +++---
>    defn2man.pl | 6 +++---
>    2 files changed, 6 insertions(+), 6 deletions(-)
>   
>   diff --git a/defn2c.pl b/defn2c.pl
> -index 8798dc2..f2551c7 100755
> +index fa7a02e..bb4987d 100755
>   --- a/defn2c.pl
>   +++ b/defn2c.pl
>   @@ -2,9 +2,9 @@
> @@ -52,6 +53,3 @@ index 6ddcfdd..c9c4dd0 100755
>    
>    # declarations
>    my $line;
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch b/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch
> index ea88a9086a..fa6bb84df3 100644
> --- a/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch
> +++ b/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch
> @@ -1,14 +1,19 @@
> -Tweak tests of ifupdown to make it work with oe-core ptest framework.
> +From a6bb2ac5f521c678abbbdb1960d28f750f4357a6 Mon Sep 17 00:00:00 2001
> +From: Kai Kang <kai.kang@windriver.com>
> +Date: Mon, 3 Feb 2020 17:33:11 +0800
> +Subject: [PATCH] Tweak tests of ifupdown to make it work with oe-core ptest
> + framework.
>   
>   Upstream-Status: Inappropriate [oe-core specific]
>   
>   Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
>   ---
>    tests/testbuild-linux | 11 ++++++-----
>    1 file changed, 6 insertions(+), 5 deletions(-)
>   
>   diff --git a/tests/testbuild-linux b/tests/testbuild-linux
> -index 5f148eb..d9b1698 100755
> +index 2c69856..05f0703 100755
>   --- a/tests/testbuild-linux
>   +++ b/tests/testbuild-linux
>   @@ -1,6 +1,7 @@
> @@ -19,8 +24,8 @@ index 5f148eb..d9b1698 100755
>   +dir=$curdir/linux
>    
>    result=true
> - for test in 1 2 3 4 5 6 7 8 9 10 11 16 17 18; do
> -@@ -12,7 +13,7 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 16 17 18; do
> + for test in 1 2 3 4 5 6 7 8 9 10 11 16 17 18 19; do
> +@@ -12,7 +13,7 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 16 17 18 19; do
>            echo "Testcase $test: $args"
>    
>    	exitcode=0
> @@ -29,7 +34,7 @@ index 5f148eb..d9b1698 100755
>                    >$dir/up-res-out.$test 2>$dir/up-res-err.$test || exitcode=$?
>    
>            (echo "exit code: $exitcode";
> -@@ -20,7 +21,7 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 16 17 18; do
> +@@ -20,7 +21,7 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 16 17 18 19; do
>             echo "====stderr===="; cat $dir/up-res-err.$test) > $dir/up-res.$test
>    
>    	exitcode=0
> @@ -38,7 +43,7 @@ index 5f148eb..d9b1698 100755
>                   >$dir/down-res-out.$test 2>$dir/down-res-err.$test || exitcode=$?
>    
>            (echo "exit code: $exitcode";
> -@@ -28,9 +29,9 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 16 17 18; do
> +@@ -28,9 +29,9 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 16 17 18 19; do
>             echo "====stderr===="; cat $dir/down-res-err.$test) > $dir/down-res.$test
>    
>            if diff -ub $dir/up.$test $dir/up-res.$test && diff -ub $dir/down.$test $dir/down-res.$test; then
> @@ -50,5 +55,3 @@ index 5f148eb..d9b1698 100755
>                    result=false
>            fi
>            echo "=========="
> ---
> -2.17.1
> diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.39.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.41.bb
> similarity index 92%
> rename from meta/recipes-core/ifupdown/ifupdown_0.8.39.bb
> rename to meta/recipes-core/ifupdown/ifupdown_0.8.41.bb
> index 7096bc94d7..5dbd6193b8 100644
> --- a/meta/recipes-core/ifupdown/ifupdown_0.8.39.bb
> +++ b/meta/recipes-core/ifupdown/ifupdown_0.8.41.bb
> @@ -8,15 +8,15 @@ LICENSE = "GPL-2.0-only"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>   
>   SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https;branch=master \
> -           file://defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch \
>              file://99_network \
> +           file://run-ptest \
>              file://0001-Define-FNM_EXTMATCH-for-musl.patch \
>              file://0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch \
> -           file://run-ptest \
>              file://0001-ifupdown-skip-wrong-test-case.patch \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'file://tweak-ptest-script.patch', '', d)} \
> +           file://defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch \
> +           file://tweak-ptest-script.patch \
>              "
> -SRCREV = "be91dd267b4a8db502a6bbf5758563f7048b8078"
> +SRCREV = "369d9d3c13a0c56ad09fd4f13b4a80eb9a94e270"
>   
>   S = "${WORKDIR}/git"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176841): https://lists.openembedded.org/g/openembedded-core/message/176841
> Mute This Topic: https://lists.openembedded.org/mt/96825753/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


