Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC11C55191
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.84])
 by mx.groups.io with SMTP id smtpd.web08.28606.1649681083123628090
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 05:44:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=EtZs5mad;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.84,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVyk/Dn0zdTPpS0VbgFLbCrE3PTiQlMa86UlZ469W2um0egxM/flr6oqBIRTShspCtsVykhPB4HojlaH4FmhNHoYZ8jOT/w3+Bu60UPxowuXihQ8rPFET4YSqoFNgQBM++1qkTz4Zh4uv6Byhoc0b87oamQ1b9ZAFQnngycncYvzliXlS3sx8FtAIM4j95bsvlqI5n38IoxxT6OlZDD8kuTEaelHEh0QLwHV14XqzF9NQmcMHdkMBKBL8YHGVIiZK06PvoTEV4ZhNqnzKcp1pi48KmiwEVPuFPMj4uTQONjEGvpYd/pprxrQhfqP3Is6bRCaK/3U0E7zHV1cIAt3yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88ETpvX9hlbcZu+OoWDKT55+EEeawWasSI3jmhaLWxA=;
 b=nhs/GlklEXZz/+whZ1nk1z+tYQm8XJybpLL+epPFD+pyggX6vdB8kJFnZOXKbmTUYlsr3NoI6uMIIM4SOg52Q8ptNTYyFxhowwk5dYQV+M8WQB2kl0Dw04khSOKOfqrjPD8o0EnyGxo3cZGwaO4RO6DV/sKIgCC7kJ23csUR0smTfG32QgU2/OHhoq8DvRWCsIOVGs8uyA2Hhe3YLvOj9KtWNnOtvrTFVyueXZNXH3K+xRFiyzlA62KcHQGu3mG1h6gT5+s5/XRZAGVTTlOAxTl9bEVTeg+g2A6NfNZ/zq4+1tPmForydC74ZiW7D2UPa2hNYxzJHoBULHTt7h9Rcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88ETpvX9hlbcZu+OoWDKT55+EEeawWasSI3jmhaLWxA=;
 b=EtZs5mad32ZIW9XFHt3Q8xWj/32dPhh1GqKy0oYmamlwslDkwxY3JSL+M/+rrQ2VZJLCymgKIweFvXr6RN15k8m+gDiGV5SctlN+XxKrBpe2lzTIpZJX1jYA2SChrlTRC4qIeqZxfCCWwiTSFu7diMZqDOWsbvd6YVgod3J6ru4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by HE1PR0402MB3433.eurprd04.prod.outlook.com (2603:10a6:7:87::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 12:44:36 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::bd4b:4dac:7747:3093]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::bd4b:4dac:7747:3093%8]) with mapi id 15.20.5144.027; Mon, 11 Apr 2022
 12:44:36 +0000
Message-ID: <14c57054-5488-6419-ab60-ee1592ffa799@theobroma-systems.com>
Date: Mon, 11 Apr 2022 14:44:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [oe-core][master][PATCH v2] libarchive: backport patch to fix
 CVE-2022-26280
Content-Language: en-US
To: Davide Gardenal <davidegarde2000@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
References: <20220411124024.3574402-1-davide.gardenal@huawei.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220411124024.3574402-1-davide.gardenal@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0541.eurprd06.prod.outlook.com
 (2603:10a6:20b:485::13) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddf30900-99d9-4376-fe85-08da1bb908e8
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3433:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR0402MB3433504716D8D69EFEB99A5FC2EA9@HE1PR0402MB3433.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QvnQj6tZ63vZdb0gkpAeBAbbvW2nHI+H1pdQRR/sXT9CoxgwUU4cXlbzUFUOLl+409goKAgEmRj+E1LKQ3HpbeHWI6RGWfzR3HDrnBZnnlcBpRXBAuiNZpvaaY1nCGx14IBK5J33B8JCt0tcWGHhbXC4YCpMeaHcSe3SnWlym+dWpM6ZBBqi+f1PQOwJQhoiRf7ZuaP/e86c/CeG+VoG0d7en7yguazeyJzXBq23kzplEO6xAKekZLSF7JOddhnLyV1XWN87XueGMaL9glOngjBnj9Zp3FjmRPfYMUq0fiGp7+8YShiWwv5gVAzbWXF9ZvWG1BYMuCNQ7AbMHg/24xZ0uLfQyRmZunMAQIFQtc29a5mhIAgoCh12ZA0CgHI3mhhG+bc4j0h7980YTJnxjDRhww4nSyGOSBFU6+f2KQOHVDCuqijs/rpgXS44VxSLMKKjh/2snNC2oikhM6cQlrwlzyn3J883q1aCNVDkVr/ssddrqPG3twewhR4/7GP8fp2Reegj1iP0YLTCo0NLR6lGAdickQ+W/wDmzDZu97IrqtrCbBYBokSk9LbbhT8Ki+s2hXP2JVpRw/YGiwaSfPSKCJ1QnqK8XAycVwc4igJijEiVB3H32uNh0APrux0pNZcv+d5MO6ckiIohghFYPjLg5LMCvWFh7qET7hgW8u2lS/Dr9tDvwrCVqMRUm+1xW2cMeKAuKu1QhFUmRX6tdAyFLpkEP4BMZnRdNgBORMiaGzxsu6R7qL2k3P8N6B9V51W3d+Q/0d3w2Nv1/302W49Ney1+0bA/Xk5NKzS37gqcgGBhnxupLCqHQHI3YrFbtscrhUAvLvUlu1LborWAqHRty1WkI9TH5Zlk5C1PMlA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(66946007)(186003)(66476007)(4326008)(44832011)(8936002)(2906002)(31696002)(86362001)(38100700002)(26005)(6512007)(8676002)(83380400001)(66556008)(6506007)(2616005)(316002)(508600001)(966005)(6486002)(36756003)(31686004)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZlB0ZWVQR0hVa3M5c3RMSUJBcVg2VlhhMHVySCtrUUtDQzBjUWxsZVp6d0pt?=
 =?utf-8?B?VDFEUnczZm9Yelp1VWJuR3pralEyNXJ4WXlmTkdnU3lJR1cxSTJKYlhoQ0gw?=
 =?utf-8?B?aVNRZWJNSjJCcWZjV2prTURaczQ1WUs0NEx6UUNxOVdYTEJWR01VR2drcGRq?=
 =?utf-8?B?SmU1NVB3cURNamRYRDhtQUhwNC9iV0hRd2VRdWhrTjlLejkwL29SMTd6Nkcx?=
 =?utf-8?B?MXdydnAyazd6OCtmK1VNcitHVkRQajlWbFg5SHJYRjAwaWE4YlNac21kWElV?=
 =?utf-8?B?VUMzY244cmFUc3JyUktJaWJONitFYzJHUURuUGFSYmh5S21uWS9KMDEyWDBi?=
 =?utf-8?B?cVJEZnhIQkRDSm5FcUFZRnlZTm9TbHpDakkzRi9Dbi93a05EK2ViMHp2bktM?=
 =?utf-8?B?NUo3K1AwMGxUeU1ZbWkwSzJGSHl1NUtmdXpFbUdWcFZCNzhiZWtIcEkxQmhD?=
 =?utf-8?B?NDVLcFpyQTZrbkd5Qzl1Y2EzNVYvTTJtMEJGdERManRNaDNhNmRwcHFENXhB?=
 =?utf-8?B?SHI5Qm1tNUMydDNvckFra3V0ZW1RWUJOeHZIdlJhVUZqSkdwQVozQlZoQURv?=
 =?utf-8?B?a3RkR3RmRU1RWk9IYkVUWFN4c0ZrQ3NSNmtXcW0rcTJZKzdrWEkydjEzQlBK?=
 =?utf-8?B?dXJyZllEbjJPUlRtVEdKRUtHTzgzVXBZNTN5Und1WDhSY2lUTFVXQm8zeHIz?=
 =?utf-8?B?QTA1VUgxL1hZT3BKb3c2aGtTSWd6RklQQWhLekhaVHIwOUh2LzA0ektEdVpk?=
 =?utf-8?B?bzFmcisvY0FjQ0JOaUZ5eDNpS3NCWGp6S05uQm9XNU1iNlI1VFRJUlNrSmU4?=
 =?utf-8?B?U0tObDVKdm5TUVcyNkhldWJSMXJzczZENFdWbElEOTNZdE1Scjd0U2FSRXlP?=
 =?utf-8?B?akE4ZUU5WEk1V1hPekpKR2dFai9sdE5aQUZQQVc2RElpN01YS0Q3UnRXMlZr?=
 =?utf-8?B?V3VEM0N5bTBmSmNPVyt0RnN4UEtvRTV0enhMUSsrMzJCU0ZtVkhza3VFUEo2?=
 =?utf-8?B?THQ4RTRZcjVsSWJCYmNIcmt3ZEl2a3c0UjZxZm9Yclc1cXZTb1g0Qzd5Vy9D?=
 =?utf-8?B?dzBWT0RYZWtLOWMxZmdZeTdjWGVPRWw5QzRiTTJSUitQNVZlUlMzVjBDTGVL?=
 =?utf-8?B?dXdXODRNM01CM2VicUdpNWFKQjA5UENNRUU4L2FiQ0lNSzkzYndCa2RMRGFH?=
 =?utf-8?B?RU5TbU16aUxTRkM5MFg3NlUxSXd5N3pvMXU0QVYvV0NNOUZROENqV0F2K21Q?=
 =?utf-8?B?M2NOWVloR3F1SW1pQnlYcHhpdWxYdEhBc2hpYTRYcytrNEZtTGZhbDNRcTVn?=
 =?utf-8?B?UTA5NXFMRXE4TmszZGZpQ2VxbFB4UXl5ciszNENoM1VlbXNXNysrNUticjd5?=
 =?utf-8?B?YzYweTdoQlQ2WStZY0REOFFyUkVTVDVEcFZ5eklvdTNaUEpRZ0Q4SEFuWExq?=
 =?utf-8?B?QnVBenN1WjNTVEphVC9Wa0gvOE40cTYrMlFpL01nbll1d2h3T2RVNDBoZVdk?=
 =?utf-8?B?d2k0eEFnK0xUVldoZjhQazRPWnV5ejVSL0VWRGZ6cVlXdzJ3c0tQODRIdC9R?=
 =?utf-8?B?SmFlSE8rdmpJeXJtQ3dqeTVQUUhxbDBJeXNGaU55eXlqVUgvOTFtblBJNGhP?=
 =?utf-8?B?U2Jqa3hlcTI0Q01NMDh6UEd5R3hTTHh0aHJYWmJIZXV4MXF3Y0RjMVlPSG1N?=
 =?utf-8?B?bDY4MWo5MlZLVzhvVXRFZkp3MTJpSU9iSWNZUFpwOU9lY2s1UHdmdURSUEZP?=
 =?utf-8?B?aTZSNzAxTkxoNGJCZVIwd2o4SmNIZThYL2YwN0ZJRkd1eE5GdmtZMTNIV25z?=
 =?utf-8?B?S1BDRURvc2RmdlhlTDVmY0dxZzRKYnpPaXEzR3dtbWZHRjB6NWVHR0FScVVv?=
 =?utf-8?B?SHU1T1hXdGh3aUFwaWczRnE5elRyK243Z3pZdWoreVFRMVJoUWd3azBJUWwy?=
 =?utf-8?B?Wk5GeTVMbXRGcWpua2tyWDA2SUl1TE1adVQ2WWJqamRpUytTTDFINW4xOVBn?=
 =?utf-8?B?cm1Ob1JJTmk4NHZBSVUrUlBxbzZYa1pxN2p0bFNHSGNMR25Td2NROFpWdC9W?=
 =?utf-8?B?bzNJSHhJNVBjUFdEbEFBM2Y5cjIvYXI3TDhsS0pwa21UV3pjNmZvVWtCR3lk?=
 =?utf-8?B?YVRnQkVzM0FDUWYzYjF5Si9PcE9NL1BkWnR4UTBPT3ptaG45SXpmc3FhV1Vt?=
 =?utf-8?B?anpYVTFmWm1MK2Z1d3BoTmlZV2tkZ21oTE9QbEd2R2NrUUJIRlBOek8zY2pp?=
 =?utf-8?B?WFA4K2Q3TkhBRmhNaEM1Z3YyYmZ4ekFDcEN0cEt4N2wvSnZ6SzhMOE1vZmZ4?=
 =?utf-8?B?STcybEJXSVVEVllDalJGK29OM2ZvRWtVV1I1SU53RlVmTWxVdndwdFNnYXRh?=
 =?utf-8?Q?jGhKWrMSuvVS7X+Z8etYtkhjjFNFDfwQQ1BWJ?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ddf30900-99d9-4376-fe85-08da1bb908e8
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 12:44:36.0139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 x1j0Qe8E4s05+RUBj+0ElTB7D8H4GRzlGY6qgo7KaembBhVrb8FCwE0DNaJjQlE5Er+2wnw0aTyzbnpLsbQHFnRRAtQVRmrJmKKubMloCT6gX/1pCeVLA1HJPCIrtqJz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3433
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164222

Hi Davide,

Any reason for not updating to 3.6.1 since it includes this patch (from 
the changelog info at least)?

Cheers,
Quentin

On 4/11/22 14:40, Davide Gardenal wrote:
> Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> ---
> Update v2:
>      Change title from [meta-oe] to [oe-core]
> ---
>   .../libarchive/CVE-2022-26280.patch           | 31 +++++++++++++++++++
>   .../libarchive/libarchive_3.6.0.bb            |  4 ++-
>   2 files changed, 34 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2022-26280.patch
> 
> diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2022-26280.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2022-26280.patch
> new file mode 100644
> index 0000000000..c322e12274
> --- /dev/null
> +++ b/meta/recipes-extended/libarchive/libarchive/CVE-2022-26280.patch
> @@ -0,0 +1,31 @@
> +From cfaa28168a07ea4a53276b63068f94fce37d6aff Mon Sep 17 00:00:00 2001
> +From: Tim Kientzle <kientzle@acm.org>
> +Date: Thu, 24 Mar 2022 10:35:00 +0100
> +Subject: [PATCH] ZIP reader: fix possible out-of-bounds read in
> + zipx_lzma_alone_init()
> +
> +Fixes #1672
> +
> +CVE: CVE-2022-26280
> +
> +Upstream-Status: Backport
> +https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_libarchive_libarchive_commit_cfaa28168a07ea4a53276b63068f94fce37d6aff&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=gRPxVzB4EMk0PAljAspLUdHOoj0XBl1hDKvUE0nQ4-ZYFhgn62aUm-XFsQqztA9x&s=Fu-Kk2GhLiSc9o3rjHQaH-u-51djGq7bKAdxUIMTRuo&e=
> +
> +Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> +---
> + libarchive/archive_read_support_format_zip.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libarchive/archive_read_support_format_zip.c b/libarchive/archive_read_support_format_zip.c
> +index 38ada70b5..9d6c900b2 100644
> +--- a/libarchive/archive_read_support_format_zip.c
> ++++ b/libarchive/archive_read_support_format_zip.c
> +@@ -1667,7 +1667,7 @@ zipx_lzma_alone_init(struct archive_read *a, struct zip *zip)
> + 	 */
> +
> + 	/* Read magic1,magic2,lzma_params from the ZIPX stream. */
> +-	if((p = __archive_read_ahead(a, 9, NULL)) == NULL) {
> ++	if(zip->entry_bytes_remaining < 9 || (p = __archive_read_ahead(a, 9, NULL)) == NULL) {
> + 		archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
> + 		    "Truncated lzma data");
> + 		return (ARCHIVE_FATAL);
> diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.0.bb b/meta/recipes-extended/libarchive/libarchive_3.6.0.bb
> index f078c8ad03..16d6e2af2d 100644
> --- a/meta/recipes-extended/libarchive/libarchive_3.6.0.bb
> +++ b/meta/recipes-extended/libarchive/libarchive_3.6.0.bb
> @@ -32,7 +32,9 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
>   
>   EXTRA_OECONF += "--enable-largefile"
>   
> -SRC_URI = "https://urldefense.proofpoint.com/v2/url?u=http-3A__libarchive.org_downloads_libarchive-2D-24-257BPV-257D.tar.gz&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=gRPxVzB4EMk0PAljAspLUdHOoj0XBl1hDKvUE0nQ4-ZYFhgn62aUm-XFsQqztA9x&s=qjkmUgOa7iMTBMJje9R2Ea_YQJUs8P7nFC_iHFYKT4A&e= "
> +SRC_URI = "https://urldefense.proofpoint.com/v2/url?u=http-3A__libarchive.org_downloads_libarchive-2D-24-257BPV-257D.tar.gz&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=gRPxVzB4EMk0PAljAspLUdHOoj0XBl1hDKvUE0nQ4-ZYFhgn62aUm-XFsQqztA9x&s=qjkmUgOa7iMTBMJje9R2Ea_YQJUs8P7nFC_iHFYKT4A&e=  \
> +           file://CVE-2022-26280.patch"
> +
>   UPSTREAM_CHECK_URI = "https://urldefense.proofpoint.com/v2/url?u=http-3A__libarchive.org_&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=gRPxVzB4EMk0PAljAspLUdHOoj0XBl1hDKvUE0nQ4-ZYFhgn62aUm-XFsQqztA9x&s=fBf6Ji0vNBD7Q-LH4pCiZVZki3Hx8oz4ZOsBhe3yQIw&e= "
>   
>   SRC_URI[sha256sum] = "a36613695ffa2905fdedc997b6df04a3006ccfd71d747a339b78aa8412c3d852"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164221): https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Dcore_message_164221&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=gRPxVzB4EMk0PAljAspLUdHOoj0XBl1hDKvUE0nQ4-ZYFhgn62aUm-XFsQqztA9x&s=C2HDNGm3Nhpg08e9mK5dvm1CHFrZ3LopM1nwfz4za-0&e=
> Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_mt_90393740_6293953&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=gRPxVzB4EMk0PAljAspLUdHOoj0XBl1hDKvUE0nQ4-ZYFhgn62aUm-XFsQqztA9x&s=KwzSKWGpvbMW5RH0CtWdnumfo-O6uHjsm9F0XYF1pY8&e=
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=gRPxVzB4EMk0PAljAspLUdHOoj0XBl1hDKvUE0nQ4-ZYFhgn62aUm-XFsQqztA9x&s=5WNChSXLwAWbWMGzrgajQQoWiwUoCItgd4Y9YnD-J5g&e=  [quentin.schulz@theobroma-systems.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

