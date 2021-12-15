Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACBCC433F5
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 10:06:42 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.92.65.79])
 by mx.groups.io with SMTP id smtpd.web10.38558.1639562801205818505
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 02:06:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=nCYwwaC/;
 spf=pass (domain: outlook.com, ip: 40.92.65.79,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cKmYs2RjUhL1SuBZBuQBMAYB1+axhKDvDu+8wLPZRwHBwuqacbSBGTuLCCNPz++9N5YeE3aDgowvJG4JFjmHZKRf2Ft5xqhaqEPeFF7D8czmAICNu8QJ2VK4xkQfZh9uJ2Bmu4SmFa2XKhVCUqMw78B+Q8Hh8agkJ+RwCOeV9tEeWxMtGbPxSSACm3/ECg7VSfsmsuRaaOiMGofUOjFnTSFB0RD6KCiCRdf6y3+evJ3GlhrT7eSOibH/Msu7xkj5rlme5f1MIuA4UuSh5w+9gwrr2hvT1He7bDGAw+smVe5jBwpV0PW0N8aFg0rNcug+LTjcfC3rDuO/yH03KSUBqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbT4YyUDTEaFTd5uKKyuhD9LLd9AcIGx76DuO4A5OD0=;
 b=ZirRE/bLOLvkf6OoviDm/+f/+G3x2bvyjFiNiBHTd5jTIS522y4uGxJ0YysX8JGk2N1poJhaCxuQU5CnZL61OFBVEzTLh5fq48Ntb+MZwssmwUmt9Zc6E4iQ0ZQGVXR/27Tv+X2AC1zy/9ZpXs2kDTB2SgIQlLLgBZFXPeHlejEh22dQququAek/d7w9P783mVkNX5hnqUx6s5VnqCfJaL/EJHMeOX2qD+vpy0rbsGPDzccIpHBLaZzhAOXMoCG/c0H3i16yKEC2UnPqNwDYPFFfA5YaKMT6UeMbeerHVVwGniGX5FOUe8e51CAKoqv892dXB5X7eUOOdBAGJs42BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbT4YyUDTEaFTd5uKKyuhD9LLd9AcIGx76DuO4A5OD0=;
 b=nCYwwaC/yrgDnYN5HdfkEX5/2r4vVsP1sDh2aAfNnS4IVxaHj0rjJBLu9KB35j0F1LYa5mnC8Sai0jPERtibqCcWv/+QH+C96Bim0Xe6HH2mWR3nRQOmorKy/4PzotxSK7/dMD1F1u1EuLuVKY6eAAj9AWydRPbOutFuCzVJQ3jLdKFW0EW2KXGnbdqmN0oWrXgUHH5s4gp5fGgjPj/+fw6SNsyWjDzQdPPT6mdIREzE6XiDlYMjR7f4SH4c7K9oiTXw4utbvsEsUc+2WnwAI8bJZRMVD51nqWIeJ0bNXI2qLwamXuIaa4R04QWAVz+wHiE7+dv/x0sYx9F36Un50Q==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB3634.eurprd09.prod.outlook.com (2603:10a6:208:180::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13; Wed, 15 Dec
 2021 10:06:38 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4801.014; Wed, 15 Dec 2021
 10:06:38 +0000
Subject: Re: [OE-core] [meta-oe][RFC PATCH 2/2] insane: make patch
 upstream-status configurable
To: openembedded-core@lists.openembedded.org
References: <20211215100344.3266900-1-kweihmann@outlook.com>
 <16C0E58BF5CDEB84.23449@lists.openembedded.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642F33198D3E8BC03E9B403A8769@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Wed, 15 Dec 2021 11:06:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <16C0E58BF5CDEB84.23449@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [C0AwqMv927p+YBf/CyZ26ftXAOqK1xS4tSKoEhx4Io3jTndIXMUcfpHxdXgsWcBg]
X-ClientProxiedBy: AM0PR04CA0070.eurprd04.prod.outlook.com
 (2603:10a6:208:1::47) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <9e2967a9-4ec1-3d9a-1dd7-80d0ca3bdae1@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9faf80c4-4089-47b6-7c21-08d9bfb29581
X-MS-TrafficTypeDiagnostic: AM0PR09MB3634:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ovt3Pm+2OXIUHpVCNwmb0xjG4S6UQ2bQf3M1CwrSkTYFdiCF5i9twFC+FDJbL4KA6OHpxZZG/eW9HVfz6SpPStdBnOGA+qrUS/aocG6L6fJBLNxYnvTfBc3j2xUwollGH22+9VMzjPUc3692JXpUtM4+bGzvL+58fB0AbWpCv6u0qB6J0C2kIXBuFKbWUe7DYHh4jCHo7VKA+7+vED7kBZbdc9doV5xDSkC4zMEiYnKcn6vMTOdXwhAVNnt25EdAHrZ7Jkn8r2CZLirUWO8R8CTE3+Nfbay8bcUlzQnbVfpcKKO9mWQkS21KtyhNsZ+pI+NBmzOfYYf6sHxyeI/ICfiDt7VpwkChqOFI+jMTc6R9CqsI5VWg3WQUGEivvmCgA62Xz5aV3e+69Kntr8Qvqqyq1aNBFs2T8/WNG76dUpDEuum+VF9GMGTt4XU+IaoTxre1G747VhHhgNXnMaNXvrrIkhVgfPevsW5SCut/IChg67sC5YQIMDfiUFuvhDQqw7nxobgfW8edLxVkYX5qt2XPab7yL3t8dETUch4isyb5zG99EcDrtm1n73B/jNCiIFIrp6cNWUBmEAzh4fy/sACHcqMf21RezRuXwxv49Kgopostl24FD31TeJ11EBMdKPQ8uRwUSTrTXwEwuQObeTjVYjFE9BcORxf5iCkJjR0=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OHovOEFGYmhsVUhmaUpSTjJlUTRQSDg2K1RHMThpWG9uYjdyOVRBbXA3R0sv?=
 =?utf-8?B?cDlsNUhSZzRWcU84WUhGU0swaUdmZm80Z0cydnZ0aEhkYjJLQnNsME9kSEVU?=
 =?utf-8?B?ckpyQWRkSHlZdTl0Q0VjVHN2MkoydzZQSkJiMkJMNmxXOTl1dUNRMitpNGF3?=
 =?utf-8?B?VC9JMWVNUUtsWWt2TURPWjhSMjJoUkZ0eEJJdi82ZHRiV09uRU5MdWMyUVdt?=
 =?utf-8?B?QUNmSGllc2N1R1pUVW94YTJTUkxjby9reGk0ZW1QSlZLZEJwYmVCN2pYb1BE?=
 =?utf-8?B?dk9QTUd2aFBidlJBR1UvZnZnb3BRVHg0K0xiZjVtMHpmWEFrVmJJZWUvem8v?=
 =?utf-8?B?a3RGREIwVFpVaG1QSURpS0lCOTZyVFBhYXVJRzNiSGRDWDVTaW5QVE9IVkJk?=
 =?utf-8?B?TTJtR0JUNGMzK3l2dmx4V2pWTEdIRmorVDNkemIxeGdPSEsxTitOSkhSNGFH?=
 =?utf-8?B?UnNQZUt5UFBwa1VIWktyNko5eDAvQWFrdDNDOU9wYTl2NE9UcFgxNG5SR2FY?=
 =?utf-8?B?MkhPQTcvYkFkaVN4enBsSmY2TjZnM0N2RGZ6cmhQQWhtUlRTeU1aMG52ZmxK?=
 =?utf-8?B?ZXBKTHpPWEtoMURYMlRlKzBaWnJaT01KT0p6UWYvNTNTN0MyNlR0ZTNlYmdT?=
 =?utf-8?B?S0tTWWJIRTVTbHRlbnhMUy94NU1YRkJCb1JwU3E2ZHRRLy8yZU5weDE1YkVr?=
 =?utf-8?B?eW1BM2w5T0NXeGlJWmhiK2QvZDZnQjBURFdLVGhOUDF2VmdqczJBUEJIbVhm?=
 =?utf-8?B?SDdiQVBlSndyWHBTaWpoVjUrVXZYMWpkeWlKK3lVaElaNWZ2dC9kVFVtbXlB?=
 =?utf-8?B?VWRiWisrWkpXeUxWZW9vSUgxamR6ZlNXUnNwQkFPN2VTVi9nVU1PR1BRelB6?=
 =?utf-8?B?eW1HN2hsZ25IMGVCcURqZStKZHRGNzgzMGJTbW8zRlhpdG1VQ0M0cURJS1Va?=
 =?utf-8?B?dE5pS0NCL0o5MjNXanIrZlFJUExQZllra0hBeUJ3a3NGNnV4Ui92SFFIS2ky?=
 =?utf-8?B?SVgyaUtXV3BuSU1WWlJNNmNtRUV6QTdWcUxHalBDRStjNXVGME1VblhQaE8x?=
 =?utf-8?B?ZVRpOTBXYlM1UTNnM2RUc2hxQU83bDdiSUUvcXZHWGZSYkhkSDFVL0pGZVhD?=
 =?utf-8?B?Z29DR0lSc2pWRHUwdjMrTjBDVVFtVzh6UlhRMTlwVDJJeG5Ld2hhbUpjaW90?=
 =?utf-8?B?MzF2Zi9SejlVTUdRN3g4VitYVUVrMzZGc00zUHQxT1RJb2tSdnZTbjVVV3RC?=
 =?utf-8?B?cjBGT1JWRDh3QWc4cVNSQ0lyUEZ4Z2c0Tlh6amNKb2ZnT3h1ZDhrTncvRFZy?=
 =?utf-8?B?dVlzNVN2VjhOaEZhOFY3M3UxU1R5QWppQUd1YmkvTWF3VThIVXpvcGQzdDlL?=
 =?utf-8?B?YndtNFJVWnFtV3c9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9faf80c4-4089-47b6-7c21-08d9bfb29581
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 10:06:38.7084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB3634
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Dec 2021 10:06:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159719

Picking up where Alex left it last time, this proposes a different way 
to make the layers where the Upstream-Status check is run configurable.

Please share your thoughs - esp. about the vardepsexclude, as I so far 
don't see any other option to get rid of the BBFILE_PATTERN creeping 
into the task hash

On 15.12.21 11:03, Konrad Weihmann wrote:
> instead of hard coding /meta/ into a skip condition introduce a
> variable called QA_PATCH_CHECK_LAYER containing a space
> separated list of layer names to perform the upstrem-status check
> against.
> 
> as this will add BBFILE_PATTERN_* and therefore host specific paths
> to the task hash, we need to exclude do_qa_patch function from
> task hashing.
> As it is a postfunc it should run anyway, once do_patch needs to rerun
> 
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>   meta/classes/insane.bbclass | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 240f3aad62..c19cc6f629 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -65,6 +65,8 @@ QA_EMPTY_DIRS ?= " \
>   # message if the directory is not empty. If it is not specified for a directory,
>   # then "but it is expected to be empty" will be used.
>   
> +QA_PATCH_CHECK_LAYER ?= "core"
> +
>   def package_qa_clean_path(path, d, pkg=None):
>       """
>       Remove redundant paths from the path for display.  If pkg isn't set then
> @@ -1171,12 +1173,15 @@ python do_qa_patch() {
>       # Check if the patch contains a correctly formatted and spelled Upstream-Status
>       import re
>       from oe import patch
> +    from oe.recipeutils import get_layer_name
> +
> +    check_layer = (d.getVar("QA_PATCH_CHECK_LAYER") or "").split()
>   
>       for url in patch.src_patches(d):
>          (_, _, fullpath, _, _, _) = bb.fetch.decodeurl(url)
>   
> -       # skip patches not in oe-core
> -       if '/meta/' not in fullpath:
> +       # skip patches in all but the configured ones
> +       if get_layer_name(fullpath, d) not in check_layer:
>              continue
>   
>          content = open(fullpath, encoding='utf-8', errors='ignore').read()
> @@ -1298,6 +1303,7 @@ do_populate_sysroot[postfuncs] += "do_qa_staging "
>   
>   # Check for patch fuzz
>   do_patch[postfuncs] += "do_qa_patch "
> +do_patch[vardepsexclude] += "do_qa_patch "
>   
>   # Check broken config.log files, for packages requiring Gettext which
>   # don't have it in DEPENDS.
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159718): https://lists.openembedded.org/g/openembedded-core/message/159718
> Mute This Topic: https://lists.openembedded.org/mt/87741230/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

