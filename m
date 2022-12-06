Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE42C352A1
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 23:59:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2114.1670371180153303605
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Dec 2022 15:59:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=p6SJmyn2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9339579541=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B6Nxd1d002237
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Dec 2022 23:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=LT8KCRFE22a9lc99apOmAzvp90SbG39SJxwWgYUmEXI=;
 b=p6SJmyn2fUnu+xzGs1PcVcIOTJRp9syY/iaMcpiMbcLDVzVpBYAgR5w2WPgVRxb/M0dz
 zdkDj6U5xS23xcW6W7Dlh4aW9cshkAAGmvHBdB2JvM/FQWasXvR0PCYAA9u9w8Dh76lb
 Tene1D69wsGbj9hyV7GZCaesWgj27bN33G+hobFA7WOAe4hq+AyUZEk7hlT8BMIp38yA
 itZYSGgagtnkSTBRb18k07BR7PQ1TcKQFYJO0/D1opnUMI7aEeKRAFJBelRJenNeRwG7
 4gZbdkMiDoDf+sH4tMzSJKrXFX+HPz7HVQtBTmRD6soEPHbRWkW8855XAtEaCWuk1vw1 nA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m7we92ya7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 23:59:39 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B6NxcWk002143
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Dec 2022 23:59:38 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m7we92ya4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Dec 2022 23:59:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tj4qVVvbPrlDrE9WkB4CEtqTUKUcg5QPzpntSGQ+4/+CHjqgvhzyPBLs2GHaoimU46xOQLISX2BGBVhYEXrl59Yrn+Tv4RXPwuDQWexiqzaCj6vc4VpSQUxPSMWq1VwY5l+vg/lK5LKvlZzAg+NWSkPE49czupcuC8aB+vlVh51esKfJ9jhci8Sg3mhqwW9Y+wTy+jGhlCKtXK2M5xnXv55nOg3vABiUyEUDQMnfpK9NLhs7UAdClawHugmDW34/WtQ0YeEM1nsY5KAkqo7mGwfL+sLlx/lZYkdXGVE7F7Rt7sUIUZsBC38Sn0Zc/hVoYohK3xXTvD96A3kwCYJZaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LT8KCRFE22a9lc99apOmAzvp90SbG39SJxwWgYUmEXI=;
 b=IxCzPz3ego1tBr1jPhJecmlNuc8g9qULpHLfeleng1RkEESt62L3T04QjVj7sEUKoeUelYed8hafMiiU0zX7RgZwz/1aSbqN8qYMLFPCVd4q5ySWNo+HMSdVgyVNUK7N+eWjFHdbuhKkDDuHLsTpWlKusVpf4zXs8n9+iv3WGGIGH9ZLcVLWIoluHTloqnJtMh8fJoEkWZk/T1zUBd8NgUY1UYlNSxSq4nW+bgTnGLVcwrYc+geK1bh+6sAoFkLcU4wAPetCqrlFu8f29Ct2HSwwd2B4jTvjbcFJ7rKICzF/Xc8Q030fuyQ17e2H6qcJ+S3iWIfEEyCKCSadaxobSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SJ2PR11MB7548.namprd11.prod.outlook.com (2603:10b6:a03:4cd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 23:59:35 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 23:59:35 +0000
Message-ID: <9a1ba933-8445-fb39-1c58-c8a690de2e03@windriver.com>
Date: Tue, 6 Dec 2022 18:59:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [kirkstone][oe-core][PATCH 1/1] libarchive: fix CVE-2022-36227 --
 and langdale !
Content-Language: en-CA
To: Joe Slater <joe.slater@windriver.com>,
        openembedded-core@lists.openembedded.org,
        "steve@sakoman.com" <steve@sakoman.com>
References: <20221206221600.28214-1-joe.slater@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20221206221600.28214-1-joe.slater@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0051.namprd08.prod.outlook.com
 (2603:10b6:a03:117::28) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SJ2PR11MB7548:EE_
X-MS-Office365-Filtering-Correlation-Id: 1579c457-26e2-4e15-3d99-08dad7e5ed26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Nv7iiLxLQtJSROJ1xoXWwU9PWKikOgh6euyKse1ErAUn/T3KyHG5a+6P072t8wHedBRBsQqouOxJDCCwZcq754Zrayhpfq9D+NC5RhcXT0b2TrVHu6kp78lbs2HjLo1Rtap8ZndECP6GlsQh3Aunv2eCub26KP816TChjDMr73grm+fSiFR8oVI++ozHb88sEjzw+Y7IDdGJf8w+X+9vYg/sChTrH79DuGfThbJVi/oE9eAktrq4yfyX+tueUb2cVqvJQG6oMkr3aHyYjQbkxb07rpljqnozAgUksP2vKzZmJyr4woXSjmBC61XLZ0Io0BozA84c99qG74HYheWlffq/UsI43ll+NxcyM6amWo3d8RzCCqlJRppuzLRToUBqAXIn7zPfsL5WOjS13Dyfe3V6abr/B9SV9mm6geiCKrCfl6HeXJRjU93zjrO6S5HjA1pATIcQP5jzl9G6hzJsSfwoHgnD6+t1rw+juxgs0EkPay8KqKiTD4n64HVVdPp5Jg6tsBWybvYBSiylyG5ZtWSCpGiMWR+9lNXiT8pk98Us0ONGhIW3s4ouY71aVT5EKyYlD6cU6Kgr75kRqLmekXQg4kiUEGTdi4QqlrdmeG60FaJcTBpYQsTR7GKBXLSyTSDghJAYa0rhQEhAWMsazPN3aLHXQ3v7g0b3N3602x3S23OgbS5UupGxmo3uP9LZ/o4Zcusjl0YY0B5T3+MhixVmkgrN55KydTCYBU0YO7NjXmdWxKwXq3DjhvZiP4RpUvfaXK1iJJyyUspgRwdLQQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(346002)(376002)(136003)(396003)(451199015)(83380400001)(31686004)(86362001)(478600001)(31696002)(53546011)(6506007)(966005)(26005)(6486002)(36756003)(186003)(2616005)(6512007)(8676002)(5660300002)(41300700001)(6666004)(66476007)(38100700002)(316002)(66946007)(66556008)(8936002)(110136005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZVUvQzZGMXdXRnNiK1RRbjY3NTZvN3JMODY2V2dya2RSbC95cVJtblpmMjNk?=
 =?utf-8?B?OXNUUmw2bDhUUXJNUjBhSDlJVXVGWlBiUDRzK1dKMVdhcWZhb01aNVROR3dl?=
 =?utf-8?B?MjkvY21iN2lzKy8xRjRJYUR1clppaldSM0NoMG1OT2xnOU55YUg2Mk80QVBk?=
 =?utf-8?B?ZkQ3S1ZnSzNwYXFZdWo1bjE0K3JZRHZKaHp2RVdIb0p2TDBNNHhycktXemdq?=
 =?utf-8?B?eVE5OWNqY1dZVVZEM3NwM0c0WGxvTlVmMDRRcllNWklEdlc5ZDNUWkF3RmZq?=
 =?utf-8?B?cUNJWUJQcU1QL2Y0M1NjRG1lcUhGMEhMcGo2ZzNsemVyOXJwWFpVSEk1MVF1?=
 =?utf-8?B?WG4wd0VMUndVdEthcUVsak14d2lzZEpZR3V5ekk4azNPTFJFa05MS1kxblhJ?=
 =?utf-8?B?d0l2cnR4SHJJTVVEYnZiYnRuY2Y5dVQ4bEViNjBVMDJ1S21DaHBJbjduMkl1?=
 =?utf-8?B?cmhuQk5saldSWTFCT1I4d2ZYY2k5QkVvOE0yV1lGS3dpNG5Qa01KVEhxU3lt?=
 =?utf-8?B?SHBWeTcyQXNuRzcxK2J3a3ZESUdLa2MwVFFrVUY4OEo0ckU4endXT3FOSEds?=
 =?utf-8?B?bkJlRENXSDRDWmR4ZjlUM2JOS0dUdWJ6VlpQR0psQ2l6RkU2VTlvOUpVN3Vk?=
 =?utf-8?B?Y3ZZMTh0YmZHMjNiM3JrbDNvTTJWankvQnNmZXdVZWU0MWFmYy9nTTBVeDEw?=
 =?utf-8?B?a1lSaGczbWtadFVUMFNhQUFaMFM3YmFhaEExNDNObVNjTG9pVDdwQ2RQR09z?=
 =?utf-8?B?QWErcFRMRXl0eng1M1lzdUNyNDE3MTE4TTNkc1pub2ljNXU3Z0RnNzNtUDVv?=
 =?utf-8?B?R2NVTTFHb25pYWthUmVqK1hML2ZsWTlQZ3U2bW4wY3I2czlGeHFIQVBDcFp4?=
 =?utf-8?B?MW9ZV3UvSVFKS1FjbjRUNmVabkQ4M2VzWjVRNFF1UmhYQWNhM3hxbFl3Z21F?=
 =?utf-8?B?ckwwby9kbEJKYmhaZ3ZTNDBjWmJ2Rm03RlBlUjRDVFJEY0tjUldJRUF1Z1F4?=
 =?utf-8?B?UkJyanloSEpsYTZaUmg5Ny9sUi9vOHhTQ2p0TE5oTEJtWEFnR2FETXpGTkdH?=
 =?utf-8?B?L3lCRlBhVmttcG9STFBSU3cya25kb08xbUN1Q3djU1VGWGVvb2FnSXB5eklS?=
 =?utf-8?B?b3NWS2dmTkkvZGlqcEpNemI2bzVLM09rSU9wWTFLQlI2Q2NCVnMzOWxBOEs3?=
 =?utf-8?B?U0djUkhaZ0dWSnVFUTlJa3JISjBTMnRFMlc4KzJWK3VweWFHNktjRTdqT3Bq?=
 =?utf-8?B?V3pwUTVuUVdMdHVkNVI4OXppTW5CZHNPWlFSSFI5K1VkZ3JxWXREcExkclho?=
 =?utf-8?B?VFlnSkNqWmxJVm5WMlMzMTNiOVJEVW52WmpiKzZEVnh6MTJtQVRHWHF4TmhO?=
 =?utf-8?B?eEJyZGM1aE9icjIvbkpCRDhWa2JrSDRJZjNVR1ZuRGpoeXVFTmVuZndBQWpO?=
 =?utf-8?B?dHVmZEpwL2Qyc0s0KzhYZ0M0SUNPRjFPS3FyNW10a0xNdkpQTUNpOGxtYVdV?=
 =?utf-8?B?c2hxQ1Rwa1JBMjNrV0NrRjFMN2JoY2cwekVmY0ZTMXJMdXBvLzZGRlJHbXNU?=
 =?utf-8?B?enRZNXowbnI3NnZVc2VyTndzblFKc0pZcXl0QXIwazh2SGZEVXppMGxKRC9K?=
 =?utf-8?B?ZnNOVGpKQzlMSEhnbHBraGdlV1RyNTg3M3hIb2NVZ0JXYld6aWNITGptUzVJ?=
 =?utf-8?B?Yzh6Nm9Xb1pySWNEVUFuZTdkV2NVVWNYTThtK2ZKMzd5U1UvdVkzd241c1Rv?=
 =?utf-8?B?ME84QndPZVVyYWVtU3lwRlcxUWhDUlhnQjFha1VnbW9FSGZsU3RZOTZSYXY5?=
 =?utf-8?B?RVBhQ2p1cU9WSjZSQTFoWEdjdU9iL3lraVd4TW91ZVBWZytmdDZBYlFTR1BG?=
 =?utf-8?B?MDFZQjlFaGdTRkpYQmZkSWpFRStBQXhiZnd4djVqK3ZxSjEvamRMSnJrMHo5?=
 =?utf-8?B?K0E1cTg0Q1JZSWFZWHo5aFFvaGEzSTBLNFhFa0M5MitIRWVhektKSHowYkMr?=
 =?utf-8?B?VXdBU05LaEFXYmhUeW56YW5STGkrME5PWUVSY2F0SmV1SGFTeTZGTVQwLzYv?=
 =?utf-8?B?ajRGS2lFVWxBSDN3RklTNXFMZlpEWlJiTFVYQUFTU252WnhZbk9JZktidWJM?=
 =?utf-8?B?OW5ZYnNkNW9DU01JZnFHTkhEUjNadXpHbmsyM0JKRysyWnRHYW15c0ViMStk?=
 =?utf-8?B?K3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1579c457-26e2-4e15-3d99-08dad7e5ed26
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 23:59:35.3785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wEMO+UHEDHufufjzXD+NDz+qNX3xw85NXEzOkMlZY2i+/++SsqR6sbNoMsF/jvzb/Xxu8ojAq/Cxq6RNnkImasOJdld4k3ImSjGzrE5AZQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7548
X-Proofpoint-GUID: WaihEj7DUEjSSLoygkAr1YZl7bSX6Z3U
X-Proofpoint-ORIG-GUID: RE_kc5egtkePwkQqz6RmV3DmsMCwUd0A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_12,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212060202
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 23:59:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174336

On 2022-12-06 17:16, Joe Slater wrote:
> Import a patch from libarchive applied after release 3.6.1.

Thanks Joe.

Steve,

This should apply to langdale as well.

../Randy


>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>   .../libarchive/cve-2022-36227.patch           | 48 +++++++++++++++++++
>   .../libarchive/libarchive_3.6.1.bb            |  4 +-
>   2 files changed, 51 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-extended/libarchive/libarchive/cve-2022-36227.patch
>
> diff --git a/meta/recipes-extended/libarchive/libarchive/cve-2022-36227.patch b/meta/recipes-extended/libarchive/libarchive/cve-2022-36227.patch
> new file mode 100644
> index 0000000000..4d13bf6492
> --- /dev/null
> +++ b/meta/recipes-extended/libarchive/libarchive/cve-2022-36227.patch
> @@ -0,0 +1,48 @@
> +From bff38efe8c110469c5080d387bec62a6ca15b1a5 Mon Sep 17 00:00:00 2001
> +From: obiwac <obiwac@gmail.com>
> +Date: Fri, 22 Jul 2022 22:41:10 +0200
> +Subject: [PATCH] libarchive: Handle a `calloc` returning NULL (fixes #1754)
> +
> +---
> + libarchive/archive_write.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +---
> +CVE: CVE-2022-36227
> +
> +Source-Repo: https://github.com/libarchive/libarchive.git
> +
> +Upstream-Status: Backport [bff38efe8c... unmodified]
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +
> +---
> +diff --git a/libarchive/archive_write.c b/libarchive/archive_write.c
> +index 66592e82..27626b54 100644
> +--- a/libarchive/archive_write.c
> ++++ b/libarchive/archive_write.c
> +@@ -201,6 +201,10 @@ __archive_write_allocate_filter(struct archive *_a)
> + 	struct archive_write_filter *f;
> +
> + 	f = calloc(1, sizeof(*f));
> ++
> ++	if (f == NULL)
> ++		return (NULL);
> ++
> + 	f->archive = _a;
> + 	f->state = ARCHIVE_WRITE_FILTER_STATE_NEW;
> + 	if (a->filter_first == NULL)
> +@@ -548,6 +552,10 @@ archive_write_open2(struct archive *_a, void *client_data,
> + 	a->client_data = client_data;
> +
> + 	client_filter = __archive_write_allocate_filter(_a);
> ++
> ++	if (client_filter == NULL)
> ++		return (ARCHIVE_FATAL);
> ++
> + 	client_filter->open = archive_write_client_open;
> + 	client_filter->write = archive_write_client_write;
> + 	client_filter->close = archive_write_client_close;
> +--
> +2.38.1
> +
> diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.1.bb b/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
> index c795b41628..8213940ad3 100644
> --- a/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
> +++ b/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
> @@ -32,7 +32,9 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
>   
>   EXTRA_OECONF += "--enable-largefile"
>   
> -SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
> +SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
> +           file://cve-2022-36227.patch"
> +
>   UPSTREAM_CHECK_URI = "http://libarchive.org/"
>   
>   SRC_URI[sha256sum] = "c676146577d989189940f1959d9e3980d28513d74eedfbc6b7f15ea45fe54ee2"


-- 
# Randy MacLeod
# Wind River Linux


