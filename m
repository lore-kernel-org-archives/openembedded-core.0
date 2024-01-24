Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FD1C46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 20:10:50 +0000 (UTC)
Received: from MW2PR02CU001.outbound.protection.outlook.com (MW2PR02CU001.outbound.protection.outlook.com [52.101.48.25])
 by mx.groups.io with SMTP id smtpd.web11.33623.1706127041418814834
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 12:10:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=selector1 header.b=CH8yKm9Y;
 spf=pass (domain: ni.com, ip: 52.101.48.25, mailfrom: alex.stewart@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbmkEEOx8UU0A1TnNZkNV34/+36cBrZtP/T/mfTqFBrPQV8rWTs38twEnGj7ugWCpGAsXEBVWG+qNd8E520MLlzqw0HdLRlKzIWwO/qMWCjGd6ZHGURgBapjdkI8b8j8Pg2997UHbvsE3DsM8jjK6mlXFYxwGvstRgZrUq1bNMpTsraX8oyMN/RcL+pCGubW3nSEfD3nm+gCBj8KA/aSYGm3ICkY3bepBHNSe5jTzP2zVZhhFl/3A8kFpw/4aPnxj/YW29E77PzbEBqbJSvSDO6p9VKh4e5xWAFHGQjs6A7jWt5dVB0g7L2P5VwfWFy/K7PrTdVLtrIsZ6tMMcPFnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTDvkpWH5Tvq25Tpy5+znDOwHsVP8JGw+VqtWTN/3Es=;
 b=h4zEeRfqpxuqpKb9dFZ6dbZyQ4LXaBT+XhEo1PeCwn2oDBjm46/0tcywfU1t0kfBJeIAXuGZbBgFkAzADR/rgn6pIZCwtrKgC73/AIKBdlinj6s0TB1JTUHl+xWtv7WEm33MLRZRqmgZQ9uiQe5dRPpP72W5oPhFF2qEP9/sZf+IGqp2mL3F50s308O+pAupXrTx4TUsdiq8VCcCaMSQCugapwLDKASPYKU2N4x21xuwM86ZbQtD/PXO9qhylHfMzyA7T+b3H0Ma9QWFsCbxObzsbvriRu1kns1rFFpGbYNuB5nJXMzQyjeXaUlf3nEa7czRE2aBfwLTuILc6Lulmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTDvkpWH5Tvq25Tpy5+znDOwHsVP8JGw+VqtWTN/3Es=;
 b=CH8yKm9YINjbLwNo23hsyPOL51KXGLSHnZ2DCif3VumjpfRaODyq0tWcdd+RkTk2+58O+sFqGOZLE54s0DBlzuj4GE1A2sw4aeWs026dGNkY0yZDVv8ZeC+U87pld/h8RKIrn03BnbJoDWd/DEDmSyNE5/WrEhsfaq4Z5t6DvIs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from DM6PR04MB5292.namprd04.prod.outlook.com (2603:10b6:5:107::25)
 by DM6PR04MB7019.namprd04.prod.outlook.com (2603:10b6:5:246::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 20:10:35 +0000
Received: from DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::2ca6:7e51:b54d:c163]) by DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::2ca6:7e51:b54d:c163%4]) with mapi id 15.20.7202.035; Wed, 24 Jan 2024
 20:10:35 +0000
Message-ID: <f64220e8-be7a-428d-b7d6-913ecaf05ee1@ni.com>
Date: Wed, 24 Jan 2024 15:10:31 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [dunfell][PATCH] opkg: Fix bad memory acces error observe in
 file_read_line_alloc
To: virendra thakur <thakur.virendra1810@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20240123052820.50430-1-virendrak@kpit.com>
Content-Language: en-US
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
In-Reply-To: <20240123052820.50430-1-virendrak@kpit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::29) To DM6PR04MB5292.namprd04.prod.outlook.com
 (2603:10b6:5:107::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR04MB5292:EE_|DM6PR04MB7019:EE_
X-MS-Office365-Filtering-Correlation-Id: 026ee88c-a268-4d24-f048-08dc1d188620
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Xu2Q7Ju/R+AfwKb8ufqr/glf9HXPtYvRreMCGwr0puRbHec50zstfnwMh5uSDcbKyLYExx/KtCK3Pc7EU0pxWBcEgNUFkekSLnm4Mp2BmyR9GPszOuFNquIAw8O2cqrEygQ5E8CBeoQ4CjKkkYKDwiWei9F4FbOU80YksNfMS8+IclgpuCJfSuEDk7+oNBM/0skBx+WpYAbfeEhb8vCGCf+L6O2Rfs1dcYQL7G5CXH8eVQOLSwaAe5jd7Cq/2vtUJRQp4O6DF60gb14BSALJJqeT1mFEpRpQWmz9s3pM2XSn2DIUtchmMR4TV+xt+q36Neu42r1YUrWRGgYZ940Bd2ktaYMZTN4q1ZOC6ijm7gohRcKlKDfLno+iehUDbbZwxwrAFk8JACRm+OoGVCS+ExZZ8Js+LOo/HTcEE9rMMeykAbBaQfTTgnbKUTodLcNiwKa1xJzxOsuvIW+SUbvDXB/H9NJ1omKT2JaTPZQ0GLpqoiJ9PGEl18F3ji7JASXDsMhigh5QOo+H4iNgoCWDcra0BtLXoduJqKksufe/B2Jw74D5m/KpTFlIOW1ASPl9OOOaXNQPR7xtuyELQVOOCjF1q46EBegBMwefw4lBy+LhJdP6eBrV6ysp9rCLKd6VxxXrzXdlW5NigDC1rejlOvHPiPsiH7Eob0Pj+aNqNxGK12+OleZmRxRxvX4678Xqt4sFDh3qPNTJ8z9M+Pq7HWycxrlLmPJ0GIyTFOFaG2I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB5292.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(396003)(376002)(366004)(230922051799003)(230373577357003)(230173577357003)(230273577357003)(230473577357003)(186009)(64100799003)(1800799012)(451199024)(83380400001)(6486002)(31686004)(478600001)(8676002)(26005)(44832011)(2906002)(66946007)(316002)(66476007)(8936002)(86362001)(38100700002)(31696002)(966005)(5660300002)(6512007)(66556008)(36756003)(2616005)(36916002)(6506007)(41300700001)(55236004)(53546011)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MEs4cXIvcnIwSVlrY0RJTXcwOWhqcTlMdXNuRlhCeUc5VXZqMkh4dzNwVnBu?=
 =?utf-8?B?UlY2bW5WOVJ3bXZHTVBNUitMekF2RU9sTzl6bEZMK21EQnNIUWJ1elUwanA4?=
 =?utf-8?B?K2RIbkZpMHVsTmdka3Fjemc4SStFVnZuQWQ2TGYwQ2JaQ0hkVVJ4Ynd0QzBX?=
 =?utf-8?B?a1gxazR6WXduckFTSHdReFNWbVYwR09XRWdTaGdDTWJjQVVQMWg5OE1ld0Ft?=
 =?utf-8?B?UkZXa2Ntb01MYzcwQjR0c2c1OUVlcFBKbnhTcEV2aWFzbmpCWG9PTTluL2pv?=
 =?utf-8?B?VWpGQWt2L1pRemMwWFBvOFpzd1AxWXdHU0dFK0tBNEhxSmhRTk05alNURFg2?=
 =?utf-8?B?STNUczh5NjA5Q1Z0UldlcTd3Q0k0YkFrSkZvQWFKaTk4RWljOFZmSXRLczl4?=
 =?utf-8?B?aWJleGs3QnhlNWlGMHpUYVl4dUE0YXgyOXlvMXVZREg4ZFJmNjVDaXNQNW5t?=
 =?utf-8?B?WElyQy9zcjZKcSttSnhEZkZaZDVUcytXRmxtaVlLSW1uRmNYTXFzR1Y0M3N5?=
 =?utf-8?B?Sm5XT2pNcHE0ZjlPUHpicHBpSmlGdTRqdHM5dUJJaU5SQnN5Qm4yODFGaXZE?=
 =?utf-8?B?blNRaWZERDlFNkhDWlZBRmVlTjV3N2ZJWlNzZjQ5dEVqRmhWSERVWTZOZ2lS?=
 =?utf-8?B?SEcrdkhBaWhFcGhYSnlGditqVWt2Q1NHVVljc2RWL0JtTy8zNDJsZGlqd0xi?=
 =?utf-8?B?QUpZVGx4Vzh4SzNMMTFGakZkd0tFT01xc2xORi9pQU9QeXh6cVV2b2Fobndh?=
 =?utf-8?B?ODZkNlh4YnBBamdjWDgxT3dSZklqV0QxSFZXWVdFQ3dEdUNhWVJ4RlhuS2V2?=
 =?utf-8?B?U0hqbG9maHY4S085bThqeThNc0ZzVCt3dElGdkdicFB1YU1WY0xOZXA2dTBk?=
 =?utf-8?B?VzRmWDBIbTJWbGkvVVMwTXFiSzJnWFMyZklyeGtxdG9Bd0wxUXZnN1BNT1lX?=
 =?utf-8?B?eXAySHhINUJzckpoRWs5eWdSUTd2V3lrdFJPZ2RtNTZEUVVLZW1ySHBlRHZB?=
 =?utf-8?B?S1hFM0QyY0FBeVZmMVRNbzQvUThNS1B6Tjc0Q1VCblJWUXVYTnk1dFNYd3BF?=
 =?utf-8?B?VXljNmlJSWkxVmNXb3haY0JxMjdnZ09qeTV4NUtrUklmcmpFeEovY0w1WTIw?=
 =?utf-8?B?eUdCRDFoeHBrU3NOdGNLQW13cnZXbjhhcUFmSzVNVnA4Q1l2R2R6ZnlIanpN?=
 =?utf-8?B?OWNXcDZHSk1GTUdUaGlNTlVSSVBDMThXOXRKT1UvOEgrNXJuaGY0eGVOeDNm?=
 =?utf-8?B?dmo4K1hMWThUWlFyL0tWT0hsSW92enpCNWRQR2p4bHpxbVhPSWZjK0FDQ2xX?=
 =?utf-8?B?YkRoUDZwMW1HdlYxMzY5cTRQbDBlZW1ZYzRWWmtCc2xzQ1piQU0yYWxwcCtY?=
 =?utf-8?B?SGtaL1hYWWcxb0pWN3J6cCtYOUIyeTJ6YzcvbElla0ViZUtTeWE1M0RISXRY?=
 =?utf-8?B?S1Bwa3RoQ2JsQ2pYeFdCWlVmWDhoWW9ZRGpHWTN5MUZsTXJwVDVndGkwSy9X?=
 =?utf-8?B?WndiWHNCL21hMDJDdzhvRkd4ODU0aGZDZXk0bnNqREtIYTNVVm52clZhWU1n?=
 =?utf-8?B?YnlGUHUwOUpBNmF5MEhsT0dzUUtJbGE3Q21zY1hVMnRTaWhCanoyb1BWcDRx?=
 =?utf-8?B?ZHUvWEJsY2NlRVRYdzRROWVnV0lzaHh6dGM3bmtzeXVrVi8xSUhrRmJXdlN4?=
 =?utf-8?B?V2FHLyswYlZudmNoMTVUR0FtV25Yb0M1eXVPOGVGY1ZRODlEd29MRzBoSUlr?=
 =?utf-8?B?UzBzUXkvZzJOVEl6NEkycGlrY2pXdWQzRlBvZTNhSFV6cUNQdTZUdUNXN3RC?=
 =?utf-8?B?OXM2VWRvWitMdzA4T0Y4UWhZTEdyZU1ZT2wwTnFQeEJtYlo4dkwwUHVuVkNX?=
 =?utf-8?B?M0NCdHFQNjFiRjBYNE02a0RLTVJZdkNLTG9tK2htUC9hUm9aOGpJcVNmaXNo?=
 =?utf-8?B?N2laMHBNZ3FzYTZUbmQ1RXNYZ2hpZ0xJaTBjMGFtM3A5cno0cHM2Y0lOcHhz?=
 =?utf-8?B?OXprQlM3NW0rcnlyZFpnMGhybTB5TmhVQnNHL3RxMThxb2UzNFh6cDF0dlE5?=
 =?utf-8?B?Y0ZPZjlOejg5K1JMQTJsZnpMQzdzbDJIZVRKN0c0bFh6MGRCRXJZMGlXOFhC?=
 =?utf-8?Q?Pj5ffi1uI5lWA1DwQVhMLa2NN?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 026ee88c-a268-4d24-f048-08dc1d188620
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5292.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 20:10:34.8769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 29YsrdT55ERii6AMuLKKWeA7BH+jKARJPmvB+eifQjmsRcvXP/Jfan1lBFt8f0VS98W019CJIIJKOK7KUf5P+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB7019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 20:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194299

ACK. This is a valid bug fix backport from just after opkg_0.4.2's release.

On 1/23/24 00:28, virendra thakur wrote:
> [You don't often get email from thakur.virendra1810@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> In the case of a zero length string being returned by fgets(), the condition
> checking for a trailing new line would perform a bad memory access outside
> of `buf`. This might happen when line with a leading null byte is read.
>
> Avoid this case by checking that the string has a length of at least one
> byte.
>
> Link: https://github.com/ndmsystems/opkg/commit/8b45a3c4cab95382beea1ecdddeb2e4a9ed14aba
>
> Signed-off-by: virendra thakur <virendrak@kpit.com>
> ---
>   ...possible-bad-memory-access-in-file_r.patch | 50 +++++++++++++++++++
>   meta/recipes-devtools/opkg/opkg_0.4.2.bb      |  1 +
>   2 files changed, 51 insertions(+)
>   create mode 100644 meta/recipes-devtools/opkg/opkg/0001-file_util.c-fix-possible-bad-memory-access-in-file_r.patch
>
> diff --git a/meta/recipes-devtools/opkg/opkg/0001-file_util.c-fix-possible-bad-memory-access-in-file_r.patch b/meta/recipes-devtools/opkg/opkg/0001-file_util.c-fix-possible-bad-memory-access-in-file_r.patch
> new file mode 100644
> index 0000000000..bec21e67f4
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg/opkg/0001-file_util.c-fix-possible-bad-memory-access-in-file_r.patch
> @@ -0,0 +1,50 @@
> +From 8b45a3c4cab95382beea1ecdddeb2e4a9ed14aba Mon Sep 17 00:00:00 2001
> +From: Jo-Philipp Wich <jo@mein.io>
> +Date: Wed, 1 Apr 2020 21:47:40 +0200
> +Subject: [PATCH 001/104] file_util.c: fix possible bad memory access in
> + file_read_line_alloc()
> +
> +In the case of a zero length string being returned by fgets(), the condition
> +checking for a trailing new line would perform a bad memory access outside
> +of `buf`. This might happen when line with a leading null byte is read.
> +
> +Avoid this case by checking that the string has a length of at least one
> +byte. Also change the unsigned int types to size_t to store length values
> +while we're at it.
> +
> +Upstream-Status: Backport [https://github.com/ndmsystems/opkg/commit/8b45a3c4cab95382beea1ecdddeb2e4a9ed14aba]
> +
> +Signed-off-by: Jo-Philipp Wich <jo@mein.io>
> +Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> +Signed-off-by: virendra thakur <virendrak@kpit.com>
> +---
> + libopkg/file_util.c | 7 ++-----
> + 1 file changed, 2 insertions(+), 5 deletions(-)
> +
> +diff --git a/libopkg/file_util.c b/libopkg/file_util.c
> +index fbed7b4..ee9f59d 100644
> +--- a/libopkg/file_util.c
> ++++ b/libopkg/file_util.c
> +@@ -127,17 +127,14 @@ char *file_readlink_alloc(const char *file_name)
> + */
> + char *file_read_line_alloc(FILE * fp)
> + {
> ++    size_t buf_len, line_size;
> +     char buf[BUFSIZ];
> +-    unsigned int buf_len;
> +     char *line = NULL;
> +-    unsigned int line_size = 0;
> +     int got_nl = 0;
> +
> +-    buf[0] = '\0';
> +-
> +     while (fgets(buf, BUFSIZ, fp)) {
> +         buf_len = strlen(buf);
> +-        if (buf[buf_len - 1] == '\n') {
> ++        if (buf_len > 0 && buf[buf_len - 1] == '\n') {
> +             buf_len--;
> +             buf[buf_len] = '\0';
> +             got_nl = 1;
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/opkg/opkg_0.4.2.bb b/meta/recipes-devtools/opkg/opkg_0.4.2.bb
> index 55be6547c0..3ebc27c8ee 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.4.2.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.4.2.bb
> @@ -16,6 +16,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
>              file://opkg.conf \
>              file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
>              file://sourcedateepoch.patch \
> +           file://0001-file_util.c-fix-possible-bad-memory-access-in-file_r.patch \
>              file://run-ptest \
>   "
>
> --
> 2.25.1
>

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


