Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9526C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 08:50:32 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16817.1782809431187880324
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 01:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ahctDYXa;
 spf=pass (domain: cherry.de, ip: 52.101.66.34, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XLhgE1uGpDn9xCdzgNi1iSq0taoB4I4qNKcgFqW/LNSZZeUzKpzDrg+eJVgtHC7cZKBe6pccSL1u0eqmqkVTRiKXseotD20X/3FyTg5Orb7AiIcF471HW7gGYgdebbpZCrcgbn+0yJ9NgTu7mgAibvqP/Hp3r8GBOHjGXqXr5ukJc7UezoN2AvyNjjeFtKyLrxaI17lAO6yqgRm2MYnj9iZ6Z/e+75PET3sFFrw3CgflXRvMzYs90bV97ksCBbk41elaFA1Sc0o5eMpPva/vV3F4SExJ+tL2EJc480knnwK40/wg6Z8TsLdzqA0zj+WHDrN1bRv6ABogsaee/9XEZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0zhLzSu7V+lGoXOD3GIRm+hWSmFC3LyRbQATKBBRUE=;
 b=dXJWPVG0o+JTm+DykfZyzQuEtypzCAnSGV7UmwAL/Wngw3U32YSAaefkh1a3+kudbSnYWWP/UJ+A5S9yaA0u2uEY/LJ7QskP2+6go2JMO3H7/8eV1qZDnK0ZBWMe/i9eKS4M7LYMLsx/FnId0sl2bIUrxCoY6Etfa7z712sErbA1wYMwwdpXuhZlEkjRILw1mc4KsWR2QB0dfNP0EWfke40KylLWxysB0VhdB4cwPJqYS6QRKumbcjFFxylSLatWsTgZ+aM+ycNxxdnZ6Jx9vRM0fK/XA+tuFr0YDDgqg8+dPIQHiRQElo5/nStEro27/lVFiEKQH1B2JTMPQN8yNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0zhLzSu7V+lGoXOD3GIRm+hWSmFC3LyRbQATKBBRUE=;
 b=ahctDYXajU4ByYt4C9FZ4EJEZNGPxATUCOVeM977eRgCrSQ08RqOCXLJ3JzYzR9pls9ZcF1KcOruHxhNsGXQUaz7xV+Ma6eNxDcsvwpW3ilE5Iwg18bfFBi+F7q8mKkqRgemsq8bzFrZ0MBoWlnVPaQAW9dC5JxFEcu9xUvwrSs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AM7PR04MB6808.eurprd04.prod.outlook.com (2603:10a6:20b:109::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 08:50:27 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 08:50:27 +0000
Message-ID: <ba5c264c-bac2-4d8b-a93a-ba41e5c4b52e@cherry.de>
Date: Tue, 30 Jun 2026 10:50:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] meson: Apply clang specific OVERRIDES for
 bindgen
To: contact@schnwalter.eu, openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Ross Burton <ross.burton@arm.com>
References: <20260630-fix-rust-bindgen-for-big-little-arch-v2-1-e6262b34d069@schnwalter.eu>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260630-fix-rust-bindgen-for-big-little-arch-v2-1-e6262b34d069@schnwalter.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: WA2P291CA0026.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::22) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AM7PR04MB6808:EE_
X-MS-Office365-Filtering-Correlation-Id: 7880b573-c514-4dbe-c5ea-08ded684a19c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|3023799007|4133799003|13003099007|22082099003|18002099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	GRZWFl7yeV36DFOVVql+PFGiHfO0Gan+Kkl1BddeB8eO3eIXDv6Hw5sqkj+AdtbTuQ8Lnv0dRwAKkEBfj+IrC9hjrZn2FDDEQ/7vjeSnUnc9VMP8HrogIratpMd0fHQ0vrpjd2R8Ib55nkei2IUMniTEYIUxSoWCW6cAIza25xEkW8UZ/7muvkzh5B9GWrhWGvVZ1CAJl5kNMhuQpZcpiPnIjztmntYFcWO4GmIibqvT84ZW6hj+86IbszpQNa6qpjBBlXyCjWqK7cVMn2LrfG6sg1t9a/fQKD7x2DzQcGQh9FYwhdJrUrs90o7zPFw714az71PWQv0I19/ZyRf2578Je1G/mW3+nF2tf+n2Fo2MJ3Ny5ov1kqSIyu5F0O4qhgk8i41X5yYXAMHQXTSyO2uyfYrTtwF2cHFydPzzKDTdzpDwsWJpPMdswsZyy1rc6uGsIt6G6GgsZYiMzj5rPeUWont9li9flkFkmWqh+32A71CKL4FQ2Zh2SvrZa0VN3TnS96PKOw4oWrVALwRItyVRcgtMcJyGcREQOZsPgLQFyrbvTASmbfeRSa/BPQy5ZUvd0iyUrJ7KRSFumMTYNePtkL6m/oT8Mgo1fMWJIrQpVh2wZkigwgMgHRiDekz8AC97hbp5WRHBaGxgHVPwnlA+xx+8u0L5+IPrqgWC3oM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(3023799007)(4133799003)(13003099007)(22082099003)(18002099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TjJ3elQ4d3pzcjdHNlpkVUJOQVhwUnRYalZjYXVmdzlHby85MG9kbm53RGhx?=
 =?utf-8?B?R3NGaU5iSHRkSmFUWDIwREJvTnRTc3paT3Z4R1VIV0hFdW5xR05RcWRndU5C?=
 =?utf-8?B?YWdYNjJZWEkxVXo5YnpnMjNaZGJQOExPVS9wU1l4QnRYSHRnV01GM1ZSVjJM?=
 =?utf-8?B?ckp6Y0QzQkYvSTkrVUg4bmx6Z1FKdWNLOUx5aFZ6VVU5S0FtT2V6YXZmSmtY?=
 =?utf-8?B?UGI5N0VhcUovV1JTRGQzUFc1TXBpZFQwTHF4Q1luK1RIbmZHQXY5bHFDVXFp?=
 =?utf-8?B?elcweTlxUlVGZ1c3RXpacHNkMGkzZmFpZHZrR0c1RmRTbzYvVnhUanlldGR5?=
 =?utf-8?B?QjN5TUpVakJrbzlJT3lkbUMvUTlPK0hObVdEZ2xxT2Qrdk1wa01IZnRJYVVi?=
 =?utf-8?B?d0RQUlM4dFM2YVRpYnAwV1d0aVZwOW14dmlNZGdjWkxiZDV1VHVKRFhkZko3?=
 =?utf-8?B?K25OczE4cXA3a3daL1Z2dy80Yiszd3lqZlNZaWMyeDlBblhnOHZodkRzS09y?=
 =?utf-8?B?N2gvNm9WS1BPL3k0cGUzekVmbmxvalhlOVNuUkNtVVNOQWVlTEh0NTNwd0g0?=
 =?utf-8?B?UVpxRzg3OVAxaUt4OGFLczJUeHoreHBxYmFWVGFNV0VUMmpKMzRkdHpDQlNP?=
 =?utf-8?B?WVA0RDJDMlVjK0NqZy9uTVpuTW41SEwxL0UyeUU5S0JBY0gvY25WUHE2RDRT?=
 =?utf-8?B?ZzloREJJOW5hZUYzbGlBTTlHNXhVYTFlaG03VUk0TVAreUV3ZTFtaFNwSnpk?=
 =?utf-8?B?Y2lwQWxGY1hLcnA5TjZDYmpkZEtSQm9XR01MMk5HbktyRm95SzlDL1BHUzVR?=
 =?utf-8?B?dWczSVpEdzhJYkFWWERqL1RjMHpFdnBDcHdSU2ZtdGQyUWc1K1lXT1NyU2dP?=
 =?utf-8?B?TUxuV1hFazE2b1VvMzJIWHBnU1BUVjVKTTY1RldvSkpUSElBb2xzNlJRNXR2?=
 =?utf-8?B?RW5pNUpMVnNFR2tJc3R4L21XYXg1U2dUdk1XUmVBRnpicUFmbnF0UXZSQlBk?=
 =?utf-8?B?N2U3R3g4Uk9RNFNkNUduQkpoOUdEMkNhUFBoN29hdjFQc0xtSGxrZ0Rqekpp?=
 =?utf-8?B?U29naUtwTjg4SkZ3THBuNU8xRStqaVM2Wk8rQms1WC9Sd0xkS0RNdTBTWER5?=
 =?utf-8?B?STViT29QOVFMZzFNTW5sNDdVUXJxenNoZHAyQlhiV09Kdlc2UWdLNzRkWFVv?=
 =?utf-8?B?S085ZkxFajUveE5WTTFIeHNEMHBGd3ROMUdRMC9Wckx0TFZGL1ZMWGZHdW5T?=
 =?utf-8?B?N1FoK29sMW9UeWhJWWZEUXlCN2VVVFpMbkdHUjhCNzVZZWQrUEtVWGVCQ2Mr?=
 =?utf-8?B?MlR5UGJ2ejRaOUNSaUNpWWlXK2krczVaL1JmTmMxbGlubXdnWmo2RXdmUGsx?=
 =?utf-8?B?dHU0V2RHbmdHSVRJN1dOWW1PNlFna2ZsUFhycHR0bDZteFBWTWlLK2JoQkI3?=
 =?utf-8?B?SlVIVHZKdmJQQ3ozNmQ4V0NPdVorS3h1R2I2VXkvQUxhYlN0ckdUaU92VDRi?=
 =?utf-8?B?am41Y2VvR0ZUdTVNR0hWcXVObmxpam9mTEhuME9lOFZTWlc2Wkt0R2tJdit4?=
 =?utf-8?B?c2RtL2tHR1ZqNUIzOEgzZkVWVTBzRHpwZnJMejVqMCs3NkJxWkRyeStxWk0y?=
 =?utf-8?B?S1ViMHRUZng0MzgvRTJmdFBFYWpHb0h1d0lXM25MT2NUNnBhOG9pcXV6T1NJ?=
 =?utf-8?B?VHNETDU4Y2VPb28zb3ovYloveEZvempBeGlhS0FWUFdqWG5jL09zWkxTVWxN?=
 =?utf-8?B?bDZsL1BHbjFPamNGL044cEhNNFM1RGRxTE9vUkkvMkxrOU1GNjFxWDVKZWZ3?=
 =?utf-8?B?dXBvK1Q5ZExZbkd6NXFNb2lOUWF4VGw1T2gxUTdwSlRIbDFLSVI1aXNwZ1pa?=
 =?utf-8?B?L2ZscFJHZm9nVFo4ZG8vYjB6OVAxLzdJaWtDVWgwSXIrWHFjWXlRT2IvcTIw?=
 =?utf-8?B?T2gxQjBSWDliNzRIeEc0V2lYb3p5NDl2Z2NubjZlRk5oUFVUb0xueXIybE5s?=
 =?utf-8?B?aFZ5YmtEQUo0NkVzcFk2bnpwNko3bnZZemVQQ0lKQkMvbnd4ZlpNZ1NMb3pu?=
 =?utf-8?B?TFBFMVNYRm5uSG1ZSFF3VFBjUkNUUy9DdElublA4QWhLdVBJZkFEWk9WTnBF?=
 =?utf-8?B?ZzJyOTlXUzJZRzNiQU9PaEQvQTBWcnhJZHphRitNVDNpOE8vTEJQMVFnZ21I?=
 =?utf-8?B?bnpaUWJyekZIL0N0YWhRQlMzdkQvb3k0Zkt0UytndTlML0hhVFJHL3FndDBS?=
 =?utf-8?B?SjlTMHJjQm5SU2dJRkZ0K2V3WVhudFRjRUZxVk5tQVZub2FLdG1lak4zOU0z?=
 =?utf-8?B?Rmp1dUlZVXJuT2FrdjB2Ry9JS1BqRWhhcVlESTlhenRPd0VaZUJxUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7880b573-c514-4dbe-c5ea-08ded684a19c
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 08:50:27.1452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W46XZosD/Gs55rY/XXBF4OY+2rDjt1PujQsC8+D1cf1PFFEWfWa7DymfsLC0Sdt4hOjOunAlwDUDeVCE03+sX5HRj+fERviDXfpJ0/i/W1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6808
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 08:50:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239869

Hi Walter,

On 6/29/26 11:41 PM, Walter Werner SCHNEIDER via lists.openembedded.org 
wrote:
> The Rust bindgen uses libclang to parse target headers, so the arguments
> passed to bindgen_clang_arguments must be valid clang arguments.
> 
> Changing TCOVERRIDE to toolchain-clang applies various fixes to those
> arguments, including big.LITTLE architecture values fix for -mcpu.
> 

Please remember someone (possibly you) is going to read this commit in a 
few years without context, so it'd be nice to explain what the issue is 
and why that fixes it. See the attempt I made in the original patch[1], 
maybe you can borrow some of it or improve it.

[1] 
https://lore.kernel.org/openembedded-core/20260212-mesa-opencl-big-little-v1-1-7f328328d149@cherry.de/

> Note that the target attribute depends on the system beeing built for,
> it is either the host system, the target system or the SDK system.
> 

I don't understand to what this sentence applies in the diff.

> Fixes: a647a0ff4c4e ("meson: correct bindgen_clang_argments")
> Signed-off-by: Walter Werner Schneider <contact@schnwalter.eu>
> ---
> I'm testing in a different repo clone, so I botched the code before
> sending to the mailing list.
> 
> Changes in v2:
> - Fixed new line escape.
> - Link to v1: https://lore.kernel.org/r/20260629-fix-rust-bindgen-for-big-little-arch-v1-1-7f7d70c9d593@schnwalter.eu
> ---
>   meta/classes-recipe/meson.bbclass | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
> index 9bed293603..238c418e26 100644
> --- a/meta/classes-recipe/meson.bbclass
> +++ b/meta/classes-recipe/meson.bbclass
> @@ -59,11 +59,15 @@ def rust_tool(d, target_var):
>       return "rust = %s" % repr(cmd)
>   
>   def bindgen_args(d):
> -    args = '${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} --target=${TARGET_SYS}'
> +    args = '${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} --target=${HOST_SYS}'

Try to avoid changing small things that are seemingly unrelated, or 
explicitly document the change in the commit log if it is required, here 
the added whitespace seems a good candidate for unrelated change. Except 
in meta/classes-recipe/cmake.bbclass, TOOLCHAIN_OPTIONS never has a 
whitespace before the variable is used (the variable seems to have a 
leading space when it's defined, that might explain why).

I couldn't get from the commit log why we need to change from TARGET_SYS 
to HOST_SYS. Can you explain?

>       # For SDK packages TOOLCHAIN_OPTIONS don't contain full sysroot path
>       if bb.data.inherits_class("nativesdk", d):
>           args += ' --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE}${prefix_nativesdk}'
> -    items = d.expand(args).split()
> +    # Rust bindgen uses libclang under the hood. Apply variable overrides for
> +    # clang; Fixes big.LITTLE -mcpu values.
> +    localdata = d.createCopy()
> +    localdata.setVar('TCOVERRIDE', 'toolchain-clang');

I think we should make sure the copy is done before we check if 
bb.data.inherits_class("nativesdk", X) because it could be that someone 
has made some "interesting" design choices of inheriting nativesdk only 
for clang and not gcc. Theoretical and very unlikely scenario but who 
knows, better have sound logic here.

I don't know if it's worth it, but you could avoid a datastore copy if 
TCOVERRIDE already is toolchain-clang. See 
https://lore.kernel.org/openembedded-core/20260212-mesa-opencl-big-little-v1-1-7f328328d149@cherry.de/

Thanks for looking into it!

Cheers,
Quentin

