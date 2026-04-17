Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86FA0F436BE
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 17:16:50 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50373.1776446204226766681
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2026 10:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=mtXRd1f4;
 spf=pass (domain: cherry.de, ip: 40.107.130.60, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzURFx0kw/MiANjSiLK1k+zJm+fwYKOIb5qwUDhYVD9WrXVGSLw1IKt7QGTIQU12TzRi5/Zjd8A+Sj4YUmCSRhC20x5ENrKfLM9t5GSz12F5a4I+c0tmHABEsmIPKXVxhd59wUr3RGMjSinZoqLFSNOoi5HDwCl2Vu6mogY7v9Ic2bXlboF8Kd4KDGeF29Bos9Pn2Aj2JenD+kTze8z//s569L4Im1FI0QGx/3YbEd0WfJRSodOn9C+wOZyMZXNIjPW3d9l2a2MMFApnVUGofdaa9+8sUZMRvA1bv6sAAikYJzneVg3fEKWuOU7t9hwmnEkfwZlkOGbKjKlg614j5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvJVnEoUif2q003hVMJMc+36MIZ2Vu+d9vVgin3UEhw=;
 b=Q8eavfGvXmi8LkrDWtAyl4MLdFyR0PJTj8kAaFRaO8Psh6SCDz37f/9Htn0eUroqqLELSGv5ELloLDVV7ZDMcoRDLLTITEjXIkZr9bRtX1Kdm19/CRuh9Sh31rslds76ugeNiMru3kaU03elfRrzpa7BiCPUdGb3/+3WtVYN6D5SkZIuzz33s8qfCezMQSw0Lp0ysFhbNHpISn+IQMg5MxUtlZZGpOJdr0+Q+U9/LzgJX5FmKoARqvnfMTvh32IDckkpkqaA3h5JtpJJzAHVg32EYmdthmRQW8KyyPaWnuuvQNgA0ANiqgwU2DQ5PeJoKQz/2zSa4hEpw7JtBAaRgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvJVnEoUif2q003hVMJMc+36MIZ2Vu+d9vVgin3UEhw=;
 b=mtXRd1f40eIYdqXkX8ThGUS1q5zNoi1vatxXEcTkU6BVAkjczMxrM4k6yJjdKh0iloFOeR/ptcgBcywnOwjmZzT0ZtfF+Por/7t/KmqppdrBO4bzfI7TV8CcIw9NBCqfPLE5pGxu2fIlB48DE3Bn30Ufcml0lv/JPEuQ2Ycv7Xs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by DBBPR04MB7660.eurprd04.prod.outlook.com (2603:10a6:10:20f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 17:16:39 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 17:16:39 +0000
Message-ID: <cbbd5375-bb36-41df-8ef8-5d0a2ffcf5fc@cherry.de>
Date: Fri, 17 Apr 2026 19:16:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] sanity: add check for
 own-mirrors/SOURCE_MIRROR_URL
To: corentin.guillevic@smile.fr, openembedded-core@lists.openembedded.org
References: <20260417160925.339720-1-corentin.guillevic@smile.fr>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260417160925.339720-1-corentin.guillevic@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0231.eurprd08.prod.outlook.com
 (2603:10a6:802:15::40) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|DBBPR04MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: ceeeea3a-cd2e-424c-390e-08de9ca51628
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|10070799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	2WHRNF9CRZf/7greUy9xEISgyZCb/oy3/IGZD3RT18IeiqhhKBkMoFJGSSRbHPl8Kc71yPNE4CPhJM3J7zEpcgQMbJ/xVXqyfw1BLa4rrwtj5Wi8CHwC5Yi+eDMbFIWD7TI+tFQmWULO8VPIXqc405PUYKnRpSn/vFqsYmaN6P37O3BXocnls9pNhXpEk1yTV3D5ZGZeWUDRFcdS1lRHCBFiRGAkWk6WH27sBapE1FTvzXfnxb+4HwAS63J+YemWCtrBr3iCM090jlA6gF7+4AVpTv300+lHtMQs/9w6C4KWkVskaXgYTQHyEHsYOUYFrQqaPfQgdDSNdINP5UVs9pyQNSvAlpACJBxPlOihsAdOKM5+6tdzBYYUWw4IqRKVjm/z52fE7nCF6xgzLrOJmG2s/qS34Ql6kNJCN8ZyQ1d0D6GtNEZ2q9CjrvxCASJYE3KDdiH+J/bw0bb8KXYuHaONBPAQjmKyBJNDRIbb/L2vcbsLPC0IYl++hKhKuzt/GWh5wA26dtL1JBKuNHDOuHkklJnSIZskPLhqK3D/ScEKy+bYxOg3q7RA2TgG82iipc3TP60aViBxtalrod5r/KArdB1lj6Lz+PTN/VRON9t/2XyXXAi7fwAYb/PinjNN1zCwCJgmORLrExcBXhDj5dy182znUG+fu6674Y7U6l0eIZErFp3Va0FKgi2rCrFqGCEuNq7p0LvY53igpzjXqzoSfVLWdrQ808JdfUpBky0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WHRxOUFyWmEvREE1ZVhaZjdXWHJwbDNwakdyK1FlT2xjZUtQcjdNMWMxQTlh?=
 =?utf-8?B?MHdIMmpkRWwxOVRZRVRDKzRXYXQ2VFlvaVlzZ3dnL3NlSmUvb0pweWs1UkFF?=
 =?utf-8?B?a3U2UTVhVTlMNVhRVWx6d2s4RTZQQVBEZ0dTWWRkU1RKTzNpWVhnU0JUc3Iz?=
 =?utf-8?B?Z2pMRlZvbzMzaUI2YnY3TEliemlWdEZWaVB6WHRabHVKNWhpZkhVcmMyWkhY?=
 =?utf-8?B?dmw2NUpHZU5WejhmdFpqYVM4UUZ6WXBTKytSRmRhZlhEZTQrWGJCZUNzd255?=
 =?utf-8?B?a3A3c1RPK2ZoSE1GNlFUaEE4dGFPQzZKWmtPWDNDNHNQTk5USHN0TUFLL2Vo?=
 =?utf-8?B?UmR0MTVqcnZ0NENqRCtUb1Q2RjNVeG1ocjNpNkdJOEVwdXpQN0ZSSE1Jbnh5?=
 =?utf-8?B?ZnVlbmxWSDd0Ti8wSDM1WXBlRUw1amZyemxUL0VNYzllbmtTaXJ2M3VmbE1T?=
 =?utf-8?B?ZnJPclZKbFNHa20zNy91alo4bTUzQkRFY3pGMGJ3Z1I4VmFTYTQ2c2hpTHZM?=
 =?utf-8?B?Nk8vMjU5aStvRXYrN0xrLzdKR3BsNFUrcHdZaytGZGxRbEhLK3ppcmdGTmZa?=
 =?utf-8?B?aTc5eHZwcjFVRkVXTUdiblZxN3ZYSFNUOXE1V3FWa21WSTlEamNNU3UwL0hl?=
 =?utf-8?B?VXRxSGR3RDNuM0tnM05YL3RwWTk1bjFwMVo1cnJRWTdOK1NBc3M1UFY3YTNk?=
 =?utf-8?B?MXIrYVFndTN0ZkNPQmNDNWxWR05IR1hpV3VtdThqQmFacGd2UWhRN0hvaG5C?=
 =?utf-8?B?SnpnZ1VrMWEwaW5FajJDL1lzVGorNHNIMDJkK1VNbXE1dW5XNG52cndjQUdt?=
 =?utf-8?B?YjVrOTJpZEZ3SE52ZFU0TXZtTGM0bWgvYnBUWTZLQ09lOHB6WHVxSk1HWWU3?=
 =?utf-8?B?REFSMHZia3E0K0k0QmhZRHdvcUhub2ZTbi9HTTlnTXovc0xydmtDVFRJbXFL?=
 =?utf-8?B?RjZNZmYxaGxYQ2N4VnBCL0QvdVE0UTVWREVnWUVzbHBIQXBBaWlRUlcrdFFN?=
 =?utf-8?B?QjY5OXFFTkpBOW04SmV1eHpmSncwTmhCb0toMXJIWVdwNk9VRWxFTlpFSHkz?=
 =?utf-8?B?SFRnWjBpdEZ3M05DN0lxMlJnRy9SZWRmeGUySXZsaUF0VkY4d0d1WWk4TXRs?=
 =?utf-8?B?Si9FSUZJT3ZYT0k0L29WVnBNVmg1MTJyVVFYRC9KWXljOVdoUU1xN1IvQnNM?=
 =?utf-8?B?dWxMOXBDTTRXSlUxOHRMM3hSbjhuNzdWQVd5Vjd2dlN6bUN6cHRjczkzMzNz?=
 =?utf-8?B?VXlnT0hlcnZPdVFnQlpDeVYwQ252eFNZbVFMRmdUcWVyZzBPamx6QnlqbmVR?=
 =?utf-8?B?Y1dNY2lPT2dDb0l1bFBzeXhoRUVRWktobGx4cDB6OGdRYXFTVHA0Z2kxcEdo?=
 =?utf-8?B?SXl0Y2REODkwWmFhbXlvZHZUa2VmMlVzNjhuWkdydFJ3emc2cHZUQ0pyTnZp?=
 =?utf-8?B?ZlRRTHNZOTJ5aHowU3hOQzFxRU5lczJybXl5Mk9NeFQrUkxsWlJQU0tyNjhK?=
 =?utf-8?B?VzlPS0UwVW1BWXpSa3hNM2JtYWtCZDRuOUdRQXRmL2dYazd5ME5FVlA1c2RZ?=
 =?utf-8?B?VXBDRFpqZEZQTEV4c0ZSL2x5bFBBUnBWbm1FTjNzNnMwT3Ntb2U0TkNiNlVu?=
 =?utf-8?B?MnBTWmlSYjd1Wjl2ZmtFQldOQW8rVDhBdzgvSTRPam5IWHdoV3gzTDNyUXA1?=
 =?utf-8?B?ckpJWEoyYUNXMWhQbXVaQzVGY3JkRS9RTk40YlE1OE5XampxZUtjU2x3dHJh?=
 =?utf-8?B?bHRYYVI0MkxKa0h5Q25INm9hRUozUmdzSzlQYjdoMzlJaW1kRHFpRFJEbExN?=
 =?utf-8?B?cWJOdmwraDNUTlIxWGxKSTd5K1RPT1BpK2lzVklrcklKeFlKaXFPMVNkVnlv?=
 =?utf-8?B?UFhvclVDVEZiZWZJaXliN3NIZ09XVEdvNVhSUURzaStwcnZ3WkkvQUJZZ0sw?=
 =?utf-8?B?N09IUXl5VjRmSitBbG9saXFLSGwyWXpYdklXd1kxR1FBcW82TXJoSkFhV3lr?=
 =?utf-8?B?anloU2VJOVVuRGc2S282RkIrenBjNUZQK09jajRpNUIwWHVGcHZ2UjBjV2FS?=
 =?utf-8?B?VVRmMXVQdE9SV21rQ1hJU0ZxckVCV1Jqemp0QjJJZDZjSUhhdlpIMUxFSWtq?=
 =?utf-8?B?c0prbXZDMzVLdTNwc2pianJMaUgwR0dQZmlOdnRMQkwxL2QxZ2ZJT2NpRE5J?=
 =?utf-8?B?RU1DRnd5MlowUDJmWXZmOTVhSVNrektDdk5wUUdnV1prU2lma28vNU9qV2pV?=
 =?utf-8?B?dEN5dXVCN3FLZ3o5UHNYbnFkRGZsQ0VnREFkL1E0THl6NnM2OGpzRHozNEtP?=
 =?utf-8?B?akovTmh0NnlUMUhyQW5DY0V6MjVQY09ZWjV5VWZyRWJJTnVjR3QwRzFia1dW?=
 =?utf-8?Q?1eJjNFv6pOpizmr1hOC1LqFB7DXL5yghFYa+L?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ceeeea3a-cd2e-424c-390e-08de9ca51628
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 17:16:39.3677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GA6FbGjOJxLnih+sdeMzoGoC91LmCHoGQ8GHO/Ax4sHlcl7FbfiHUrYQvEACOMHfxZda0mO+mZ9cMmzbSILzrOJ1pp8MMybJPT8t0XXhuy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7660
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 17:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235510

Hi Corentin,

On 4/17/26 6:09 PM, Corentin Guillevic via lists.openembedded.org wrote:
> From: Corentin Guillevic <corentin.guillevic@smile.fr>
> 
> The SOURCE_MIRROR_URL variable belongs to  the own-mirrors class. However, the
> user may forget to define it. This will cause the class to inject incorrect
> content into PREMIRRORS, resulting in the following error:
> 
> ERROR: gettext-minimal-native-1.0-r0 do_fetch: Bitbake Fetcher Error: MalformedUrl('${SOURCE_MIRROR_URL}')
> ERROR: Logfile of failure stored in: /path/to/tmp/work/x86_64-linux/gettext-minimal-native/1.0/temp/log.do_fetch.258066
> ERROR: Task (/path/to/layers/poky/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb:do_fetch) failed with exit code '1'
> 
> Add a check to the sanity class, to detect this case and raise an error.
> 
> Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
> ---
>   meta/classes-global/sanity.bbclass | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
> index 1a490f8d61..b24cec7f2c 100644
> --- a/meta/classes-global/sanity.bbclass
> +++ b/meta/classes-global/sanity.bbclass
> @@ -984,6 +984,11 @@ def check_sanity_everybuild(status, d):
>               "Please set TMPDIR to a clean path with no trailing slash or "
>               "consecutive slashes (e.g. %s).\n" % (tmpdir, os.path.normpath(tmpdir)))
>   
> +    # Check whether the SOURCE_MIRROR_URL variable, belonging to the 'own-mirrors' class, is defined
> +    inheritlist = d.getVar('INHERIT')
> +    if "own-mirrors" in inheritlist.split(" ") and not d.getVar('SOURCE_MIRROR_URL'):

We have oe.utils.inherits(d, <classes>), I'm wondering if we can use 
that instead?

> +        bb.fatal("own-mirrors is enabled, but SOURCE_MIRROR_URL is not defined")

We don't have any bb.fatal in that function, only bb.warn, 
status.addresult() and raise_sanity_error, so we probably should use one 
of those.

Cheers,
Quentin

