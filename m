Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D25C433F5
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 08:50:18 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.63])
 by mx.groups.io with SMTP id smtpd.web10.1504.1653641411846458947
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 01:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=Z6DnMLri;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.63,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GT0JS4H2k3RIgNxiZKVOz9sbYpO79DceTcpGw/EhNwf0lz+wwc6ZS81mI03uHxbLx1tmBvUXfcsuhpavr+lW0A/Zg4AiJVKhzhHQQUjnPbxcXBejbPIn9Pq0aaeCFSeRZlOuoQbH/6pta4j8JFmqOy8I8veDg3Dqh2ASL/ELKUTM5frI/DsIngJBoG/N9O1e7lEKp00RT0/u0bXaYZDgQi5Ablq2zk1ozPpNE3woQDKLQD6xAcWEmCzIQJjO2/qxEtIr2bXxPAfCtY03qQKNDoLYOXK09mXT+eYUkXVm0OBsQjANU/RSyxkWqGKPjyqoHRlwwJHZeax0Oi32qz0KJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGVwdoG99sTsFbPxQCnd7RzLFYJOwzGDaQ3hjDxnFqM=;
 b=DWPTiYYWs16JA+x7HSkQGkKgXddK2CXso37ss/NIB+avGVCSteVikUq0Izy+bJrNgwLjVirVVu8mFr0gVVQyuugPHAQdBcxQR9hDnmBzb55rCK4UodiJygEOxpW0XYLm+w05gCcZdK+pdusiVgQVhwGDnPqXm/ILbbhEuHeE4k4XqnEZuaWqi/DDR6qqudtcG9z0Y9rFS2wehfKB47dieZ5VFxcItJoWNQ5zlXcQ3VoEwXvlBrBpoFLezN2p3uFm5eMJ9NvGfAj4RNBY2vObfHX0ND9fc2mEKuzOr7qydiYCiil2D+kZczUnDbw7cEVqsl6fup3B8pxxj6AdqcjOeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGVwdoG99sTsFbPxQCnd7RzLFYJOwzGDaQ3hjDxnFqM=;
 b=Z6DnMLriXIs7175RgKmYTYReptrLEXYJdUiSZNHiRMVvhs6nFHWsqkWApNBNWKffQVlwE9h3bdTMIDDF+vTNqbvlTScUd/OTA4VDFGA0MF2snRu3BHMlsJOb6y/SY0bNHfCFL8Fg1hoM/u8pMz4pPC8DkkEGxzW88J5y644ATng=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by PAXPR04MB8365.eurprd04.prod.outlook.com (2603:10a6:102:1cf::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.15; Fri, 27 May
 2022 08:50:08 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::880a:6606:6f57:dd0a]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::880a:6606:6f57:dd0a%5]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 08:50:08 +0000
Message-ID: <2605e038-2f1b-07c0-e623-7adbb92e89c6@theobroma-systems.com>
Date: Fri, 27 May 2022 10:50:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [OE-core] [PATCH] cve-extra-exclusions: Add kernel CVEs
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220525164126.358811-1-richard.purdie@linuxfoundation.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220525164126.358811-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0039.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::8) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e20300f-9b2b-40eb-68f0-08da3fbde708
X-MS-TrafficTypeDiagnostic: PAXPR04MB8365:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR04MB8365D2151F6D757D7F67DFA3C2D89@PAXPR04MB8365.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6KeLk6mzqEyx4h+0hfMT0kmlmLQjAbWEHPuez4bZo1Ln+O5MwsdUsLOg6EXwUO5Xd94cMyQic+ono1xILPdWmVxKRN4QDCVeRDd/XRH6o9NTEGrm1C2ExIPqlJXikxgPSdldv++BavTndYTXYIX60xm6/eDscMj0EKSJDWpons/YWkPKvls4cLZqaTnUCos5ZhmFQpUmOUWd27VnvKF87ZXsfixj7nZYvZryq8M+UybH4+PQwp6J1jWDNJY6/fB2uVZFIw0Jg4ofEQKFYyPrImVR05LrR0Umgib3RPH9WBH5p1/XkWpL72ber/Q4FM8VfWOFeGNdAThjYK9Yr9UkJbNUaQzXceiAeni4tuO5GPg0c+dvMu1GJ5R8B2B2KoKLNPprAt37ai3KNbXQGaOyUk3gMJPgKojd0Wf2kORpC7NzdJYHO2ZyUA78Fav6eL+m2ihDpaX75g2W0GBEtnSngRmcw6OPlyazbXzWFh4LNUMBmW+sMpFepmDnf9/7HXIic23SIbOA63N/7jgHuijSBxkW2oGq8t8S8B1Zh14RzgF4CRzJYYSk+j9zdrZq620X+wROUgMctyT6S5YqdVxC1/YxfKlRKsTuShH6eUh9mNcGznZOaZvEAbnt71WuB6QbwXu5w/K6ki79hI67ygS2h178uY7ilSZ+N6cdUbCeQJTh+flrakuq2iM60LHRJjL3WYQiZBfCJzoQl63FmSsBEITMjsbeGGhjxMIhXzSGIo8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(186003)(2616005)(86362001)(31686004)(316002)(38100700002)(66946007)(36756003)(66556008)(66476007)(5660300002)(508600001)(6486002)(8676002)(8936002)(44832011)(6506007)(53546011)(26005)(6512007)(83380400001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?alRTYStIcWFTTzhZNUpyaDYzTkxmSEdLRVlkeVZ6QzNFa0xqekVPS2VDRFJD?=
 =?utf-8?B?a2xLMlVTVEhPKzd1NkJHVnQ1MGRyMGl0QjV4VjM0ZkpUOXo1dzBMT3I5MThu?=
 =?utf-8?B?cFBRYTdQUFMxTXl4VHhrVG93NkJXR0ZiT2dRUjlPRUowTk8zcjZ5MXc5eDZx?=
 =?utf-8?B?Qys2MUlaaGIzYVVZbE0yQmJpRFJvVXFHQUhCWitTeFQ3QzVqS3JwYldEVWtZ?=
 =?utf-8?B?QUJlQ1YrSWQyY0xyS0NteW9sVWxHU3dXWmZ5Y1pZdVBQNStxVk8xMGZtSW0x?=
 =?utf-8?B?cE03QUJBYTV2ZGVHY0xWbjh4bDJlVXl5d2xtVU1qYkFnM2VVcFBPZmxpcVpD?=
 =?utf-8?B?bVJNS3A5UU1DWlhodXdVY2ZxazlGNjFzU3FDQW5nbHhtMWZSMTRTSy9zNi95?=
 =?utf-8?B?N2NPemJ4Q214cE01R1BEZExZTGtXWG5mQTJRWkNRZmJlZm9rWmNvSTJEOUpU?=
 =?utf-8?B?UXZtVis3UW5hYnhOVm1RWktTU2Y3UnhwVU56ZU94QWk1VVFEbFFWdGpob2dO?=
 =?utf-8?B?SnZYN2JibDdHRnZKVzFSYkxrdTk1b0d1YWVIc29ORVRackxEaGpWZGhTbE1G?=
 =?utf-8?B?dHpZWGlueTEvQWEyK2hnVklhaVRlemJzdWlPeFg3OHI5R3NkWlp5M0VjSWVh?=
 =?utf-8?B?VjFsQ2srRHJoaUZUTnpKMjRoRm40T1YxODdOaFUvUm1hNFB5dG9KZ2FUNXM3?=
 =?utf-8?B?a0dxSkZBSnV3aFJHTDlmbWZ4V3RGV0l3VHkrUE5raTZ6S1BvTXE4d1VtMzJX?=
 =?utf-8?B?eDNNRXVqUjduYkE0Y3VnM0Y3VVhtRUhPR0ZGeWx6WVRhUnVjZlBjK1F0VkVV?=
 =?utf-8?B?bEx5Tk96M3FnR21RUENtTThUYXl5QXV4aWVLWTlpQk92VVdTc2ZidTVtaUdy?=
 =?utf-8?B?ZHdWYW0vcFRaSVNrVHljeHdEcWVIT3c1bXpiZUNLVnFoNDFsZUJHQWtSZzVs?=
 =?utf-8?B?TC9XUkl4NWpKY2p2ODdnMmdiQ3JxYy8rbDlBRnppR0JPSzBnVExmdm04Y0NH?=
 =?utf-8?B?SVRZeitsWnRjdmJ4eGNrTml2V3RXWmFGcmlNV21yQlRpYm1veDA3Q3llL21T?=
 =?utf-8?B?a05lVVdUK2V1Sjh0Wi9pUHBRMWFvMlZnRDhha2kwcmZEMHJ2eXA1WXE5TndW?=
 =?utf-8?B?MHlsd3dtN0pZbG10c2RIWFlLQjNHekJrSC9aVGJVblJhWDIwVk1Ec0ZrUGNz?=
 =?utf-8?B?MXMwcGx2Q3pRQUk4YXNzQk9sWWtCM1lxZWFWRmJCdW93OWo5elltMzEzWTZj?=
 =?utf-8?B?R1drTnA2UFBMeWhMYUpEWmNCRzdFMmxWZTEwZjI2MUF1Vk1QNm1LYjhwZ2Y2?=
 =?utf-8?B?aUx6WXF0bTBzV3YrT3Y1WlVsUWxhMXNHT0xkT1lQZGErRjdWNnBzUnlGQ0pS?=
 =?utf-8?B?UUF3OE1UU3U2NDRBcjJGWFB0OGNmcUhHdjBYMFljSUIwNzR3bXlTclVpa1Vx?=
 =?utf-8?B?VDZRSFY5TFQ3VE1aUVA4YndINUo3d1o4Z3g2eDM4THVFVlBGWm5YZndvLzl6?=
 =?utf-8?B?VDlSRmUzQ3oxSGo1Q090dTZGYmEvV0tHc25nOEJBeXFOSXl2MUcrNC8yOVVr?=
 =?utf-8?B?ZERGMW92NFpTVEFia2VvaWhZT3FIWmdzc0ZnRDR2L3k0bDVlbDFKczZmZlI0?=
 =?utf-8?B?WVZLL3phWFZtYSt6dVh4UktUUTFlVFFpRHZ5TTFpd3FydTVTRXp4WlpkVmpB?=
 =?utf-8?B?RWZZc3pNaXV1TGl5QkZCMUVFM01VSXRvNERUQVRSZEdLU2IvWHVQV0FtVC96?=
 =?utf-8?B?UWtpN1diNVRKakRPbkRaSnh0OWxKWENPYUxiUUpYRlYxN2IxMjUvZnIyOWJm?=
 =?utf-8?B?QWF1WHl5S1ROYTREYUgwdUQwelAxOWVQYk9COGRXK2t4d3hKL2FKbExJZE5F?=
 =?utf-8?B?MFYxZUtDd3k2VmcwbTFDQ1NjVGdRRXdCNFNpRGlsY21rSlA1ZVlXMEZaZ2ZZ?=
 =?utf-8?B?RkhPN2RTMWEyaDg3dmEweW5CZUYwdy94NTkzdFNoNzI0UXhIM0Z4S3Bldk1p?=
 =?utf-8?B?dmIxQkpLTlZXUlBUYXR2dDQ4Mk1oTHBqRzR1ZEU4dGpPNnNtbmVxQXdvbG9E?=
 =?utf-8?B?djQwbUxwamZrZWJCWkV0YkRkUWNnbTR1bjBoc3dpSjE5bTB1anlsbTRmOUxm?=
 =?utf-8?B?UHAzNGpTZGV3V0N6TjlPanZKaWFtaTFCVHZSSnp6cThBTGhIU3lyYmV6Mm9B?=
 =?utf-8?B?VG94WDF6Q1VURkNHOFprUmNUZVllM0RDckRlbHBJUVdIK3lpdlEvTllRNExl?=
 =?utf-8?B?L0NIYzNNN3NTcFhjQm1zV1RDNzYxSHZqMjFsbmIrM0hma2s3REZRZTBaemJH?=
 =?utf-8?B?Y3QrWjl3U0hPV29UamFmMzZyQ0ZoRjY0SVNSQU40VWp5VG01KzNFYTlGVS8y?=
 =?utf-8?Q?r2NczQsCmDK+zbmmHw/CqD/0LMlsOr/gkLe6/?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8e20300f-9b2b-40eb-68f0-08da3fbde708
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 08:50:08.4741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kS6fY86WMMQlajsEJRHqwS+wEG6R+r5b6DEWDDdInJxHSEpRm9oCCiz94g8QbgU2hc/xTWYLjSZu4uM/M+lRSySm/rjfnW99Cf0XOvDgGX3/2k+selfotDVw32OEoQZa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8365
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 May 2022 08:50:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166204

Hi Richard,

On 5/25/22 18:41, Richard Purdie wrote:
> For OE-Core our policy is to stay as close to the kernel stable releases
> as we can. This should ensure the bulk of the major kernel CVEs are fixed
> and we don't dive into each individual issue as the stable maintainers are
> much more able to do that.
> 
> Rather than just ignore all kernel CVEs which is what we have been doing,
> list the ones we ignore on this basis here, allowing new issues to be
> visible. If anyone wishes to clean up CPE entries with NIST for these, we'd
> welcome than and then entries can likely be removed from here.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   .../distro/include/cve-extra-exclusions.inc   | 37 +++++++++++++++++++
>   1 file changed, 37 insertions(+)
> 
> diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
> index 6c19cd293ddf..2206d2284ca9 100644
> --- a/meta/conf/distro/include/cve-extra-exclusions.inc
> +++ b/meta/conf/distro/include/cve-extra-exclusions.inc
> @@ -53,6 +53,43 @@ CVE-2015-4778 CVE-2015-4779 CVE-2015-4780 CVE-2015-4781 CVE-2015-4782 CVE-2015-4
>   CVE-2015-4785 CVE-2015-4786 CVE-2015-4787 CVE-2015-4788 CVE-2015-4789 CVE-2015-4790 CVE-2016-0682 \
>   CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418 CVE-2020-2981"
>   
> +
> +#
> +# Kernel CVEs, e.g. linux-yocto*
> +#
> +# For OE-Core our policy is to stay as close to the kernel stable releases as we can. This should
> +# ensure the bulk of the major kernel CVEs are fixed and we don't dive into each individual issue
> +# as the stable maintainers are much more able to do that.
> +#
> +# Rather than just ignore all kernel CVEs, list the ones we ignore on this basis here, allowing new
> +# issues to be visible. If anyone wishes to clean up CPE entries with NIST for these, we'd
> +# welcome than and then entries can likely be removed from here.
> +#
> +# 1999-2010
> +CVE_CHECK_WHITELIST += "CVE-1999-0524 CVE-1999-0656 CVE-2006-2932 CVE-2007-2764 CVE-2007-4998 CVE-2008-2544 \
> +                        CVE-2008-4609 CVE-2010-0298 CVE-2010-4563"
> +# 2011-2017
> +CVE_CHECK_WHITELIST += "CVE-2011-0640 CVE-2014-2648 CVE-2014-8171 CVE-2016-0774 CVE-2016-3695 CVE-2016-3699 \
> +                        CVE-2017-1000255 CVE-2017-1000377 CVE-2017-5897 CVE-2017-6264"
> +# 2018
> +CVE_CHECK_WHITELIST += "CVE-2018-1000026 CVE-2018-10840 CVE-2018-10876 CVE-2018-10882 CVE-2018-10901 CVE-2018-10902 \
> +                        CVE-2018-14625 CVE-2018-16880 CVE-2018-16884 CVE-2018-5873 CVE-2018-6559"
> +# 2019
> +CVE_CHECK_WHITELIST += "CVE-2019-10126 CVE-2019-14899 CVE-2019-18910 CVE-2019-3016 CVE-2019-3819 CVE-2019-3846 CVE-2019-3887"
> +# 2020
> +CVE_CHECK_WHITELIST += "CVE-2020-10732 CVE-2020-10742 CVE-2020-16119 CVE-2020-1749 CVE-2020-25672 CVE-2020-27820 CVE-2020-35501 CVE-2020-8834"
> +# 2021
> +CVE_CHECK_WHITELIST += "CVE-2021-20194 CVE-2021-20226 CVE-2021-20265 CVE-2021-3564 CVE-2021-3743 CVE-2021-3847 CVE-2021-4002 \
> +                        CVE-2021-4090 CVE-2021-4095 CVE-2021-4197 CVE-2021-4202 CVE-2021-44879 CVE-2021-45402"
> +# 2022
> +CVE_CHECK_WHITELIST += "CVE-2022-0185 CVE-2022-0264 CVE-2022-0286 CVE-2022-0330 CVE-2022-0382 CVE-2022-0433 CVE-2022-0435 \
> +                        CVE-2022-0492 CVE-2022-0494 CVE-2022-0500 CVE-2022-0516 CVE-2022-0617 CVE-2022-0742 CVE-2022-0854 \
> +                        CVE-2022-0995 CVE-2022-0998 CVE-2022-1011 CVE-2022-1015 CVE-2022-1048 CVE-2022-1055 CVE-2022-1195 \
> +                        CVE-2022-1353 CVE-2022-24122 CVE-2022-24448 CVE-2022-24958 CVE-2022-24959 CVE-2022-25258 CVE-2022-25265 \
> +                        CVE-2022-25375 CVE-2022-26490 CVE-2022-26878 CVE-2022-26966 CVE-2022-27223 CVE-2022-27666 CVE-2022-27950 \
> +                        CVE-2022-28356 CVE-2022-28388 CVE-2022-28389 CVE-2022-28390 CVE-2022-28796 CVE-2022-28893 CVE-2022-29156 \
> +                        CVE-2022-29582 CVE-2022-29968"
> +

s/CVE_CHECK_WHITELIST/CVE_CHECK_IGNORE/

Cheers,
Quentin

