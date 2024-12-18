Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA313E77187
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 13:32:45 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.79])
 by mx.groups.io with SMTP id smtpd.web10.105473.1734528759568351778
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Dec 2024 05:32:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=SO1v9Ct2;
 spf=pass (domain: cherry.de, ip: 40.107.20.79, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3wLSwx8Fl6nMDS868mSCuMdB0RRfwZgeHMMekmaQ+KivagYL9YBqtPdsDE1qCEJuBVX12JyK0Ge48Wm91JCusIrbwX1jwVtwxzugF5B24SK6FxjT7vbl3ErrkHGUnaPPxAQHv2qmbi2IPqPTxqO2LKbvuNVcxpjAqGXiihQR0Ga7xegoDtqhvBBbP/2jUQ8Q0Kr0Ew5nfR8LrQuAHJd9OJe8GR7oNUt2XZwTrys7hofCyedHstyrY/TxdQi2JSxSiyl8tgn43iSpO946ClzKTkHlx6y9e3umMUG9qwDR//8FooMvr+GERkJt7HXmZt0WjmP09rTa3iTqKL8KtFLJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3yPIrThrppUsuB4IuxnIDX6QwKMImRzRJpuL9ehHA4=;
 b=POZuAIAgVMzqSlGIyJUl1rMzgCgCs4vUt3SEhzrN9FagspDCakLM0Rm3Jhc6kHAfFqxmL27RLhGlAu5D3zpflm7EJ04oa2wEb5Q5KG3LsXaX2PPRPXC3SOqejPXgkxQuZsuPuLBi1w+qrurExIzm2X5oiKg552qlzm5RDl52va8r214bflYBzqie5kji9L+d+wQfwWagEOGX7lmYK0BnoSC0ZERdkmw+Rc3LwCyWuJa/TV1+Iige9LjRQuYH3iwP8ntv/QfN6dD8RyupBSkeoNNbPoPq6o1IIIecjMH2J+Xfixkr1LKju/U8M5pXXElBMpmtrCeSKSf2j7HSG3A9dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3yPIrThrppUsuB4IuxnIDX6QwKMImRzRJpuL9ehHA4=;
 b=SO1v9Ct2kEJ2J1U5KAWCtaO6akoahgZLrgh5DQwbVU9AXtseqq+IR4w3MsaB7/3YuAxmC/ojuXd0lFe1RIQV5ttTJezJL+W8YpzgcCbZE2vqp9n8n4NUtrD0DS7ha/2vTEaycx+rJUgm2fmWDBECZBmpPaduDpaXnqWf4QENEag=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI2PR04MB11027.eurprd04.prod.outlook.com (2603:10a6:800:276::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Wed, 18 Dec
 2024 13:32:35 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8272.013; Wed, 18 Dec 2024
 13:32:35 +0000
Message-ID: <3edaa887-9925-4503-9126-22fcb0a6175a@cherry.de>
Date: Wed, 18 Dec 2024 14:32:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCHv2 1/2] classes/ptest-python-pytest: add a new
 class to consolidate pytest ptest functionality
To: derek@asterius.io, openembedded-core@lists.openembedded.org
References: <20241217231202.3384873-1-derek@asterius.io>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241217231202.3384873-1-derek@asterius.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0217.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::9) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI2PR04MB11027:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ef5cb61-d842-4336-3b15-08dd1f686c4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Zm1mNTdpUi83V2NzaFRwdEx4WFlEVVBRT3dORDJzeVovSjEvTGx1YkRtR2wr?=
 =?utf-8?B?NGdVR3BLcHZCMmtDWUFocjZKUGVDWStaeWJwNjZsWTdmemtRcnV4MzRtNDJr?=
 =?utf-8?B?MnNtRnBxang2Z2YvL3kyR2hvbFNwRVR1ZmNHVmFDaDA2U2hSaEd6QXdnU2xx?=
 =?utf-8?B?RVVlOFl5ZWNmSGFpZWlrR3liWk5obnduazRsTHdRL1NaUS9jcVJwS0xTbko4?=
 =?utf-8?B?TCtCMTJrbHMxV2ZIUUNqU29oQXk1ZXdLYjB0QmM0NU1hZG5wN3VHN0x3azho?=
 =?utf-8?B?RVJtWWw5UzhZNHZBR1l1dnRhT1ppdnBuYWJWQTRkWUtzZFFlQ2VvSWlFVXBV?=
 =?utf-8?B?Q3BFZXpBWStMWmZOQ1NHNWN1VCtJNWh5K1p0R0hDS09GNGE1N3VpSklIVXpl?=
 =?utf-8?B?YkpZdWNMU0M5RWE1Y0ZzUmZ6dE5nclNaaXJvK1FNNEtGNGswd3M4UmxienRt?=
 =?utf-8?B?bitMNWI0ZWVVc1Vma2JqWkg5MGNiTkxEUGNGbDB6amR1NndtNGs5Y0JsSlhM?=
 =?utf-8?B?VUxMRDVGaVRCZWV2NU92c0lQME14bXhXSC9PZ3VYM2o1ckxIakh1L3JFWWky?=
 =?utf-8?B?NkE0cnl3bk1IYVlyeXBwbzU2OWhGT3FOWXNmRXFrOFRZUEdoUzZWSzhDNjFV?=
 =?utf-8?B?MTMxWVhlUCt3UURZOW5iU01WczNDbkNpY3lRaHFGV3ljdUc4L2xGNEtZNWdE?=
 =?utf-8?B?S0EwMW9KM0dEZTNkL044aXAwUmMxSEtXci9uVkNGSjBPN2lMb2JydUVEUnJB?=
 =?utf-8?B?VmFQemE0Rm9aTjhaOFV3bFVDZjhGb01UeCtCVWpTNUdwbEhVdU5QemFyRWxD?=
 =?utf-8?B?a0NYWWJCM3pjMThYaGlrL1dFQWZDVEl0R3FQZHRoMUJ5THZkckFORDI3aTBs?=
 =?utf-8?B?V0JUb3hIZ1dzdG9NMk5ocjVhL1l3WW45ZGhHZWUrQ3RQOC9XQmdFV3FWUDM1?=
 =?utf-8?B?ZTk4Q29rbWdlOFFhbXk1bXF6NEYrZysvaHQrRmdFRldDeDdVZUpEOC96YTVR?=
 =?utf-8?B?clBBcytxRjNuWHVNWU1SVHNndFpGM25nemhpWXdkOGZYMUpWL2V1MVBwU0g3?=
 =?utf-8?B?V3YvaE9rNHh5eXpLTnVLMWZ0dFBmeWNUSkpkTXdLL2hvbU55SmRMWjVHVWtX?=
 =?utf-8?B?KzFza2YxYVlkRlBINHpLdFIwR0h6YjB2U0Zob2JrTUZlcytjbC9PQzJDcVhO?=
 =?utf-8?B?cVdEa0JQZm1GYnlvenlxbzhaUWFUZXRycDJScHAvRGUyK2dzSVU2Y09OZ0g5?=
 =?utf-8?B?THIxdGNoOVlyL2M3SUxYdkJTOG56SW5EdkdzcHY2TG9yNkViYlpSMzFzblE0?=
 =?utf-8?B?d1hZeldGdk1NZ1R0ZXd2OVpTbWhjT1JJYnRvZ21JK0JpaEpDWThtUGpmcEZl?=
 =?utf-8?B?aDRmM2tXS2hqanpLK0JOdTVzYk5nSnZXb01NemdNa1duT2tUSFI3Uk1YSDRN?=
 =?utf-8?B?Ulh2K1pxMThjM24yNjdiNmZwcCtyMkFET2phQy83WnBGdjVtU1VmM2xiYlFi?=
 =?utf-8?B?TUQva2ZNWHA0dFhLcDVIK2UwT0VCWjhQakNrMXprVXM2bEM5dDV2M3QvL0ln?=
 =?utf-8?B?Qmd6V1JUZzFUM3NJaU8wK1NqZTFIY1JQVWZtTWVrQmJ0TmQ1dnBHYU9YaTRq?=
 =?utf-8?B?YWZMTXhTMDhFc1FITHZmOWpxYWtoZi9Pa1hvazZhSUgyMXEvWXpUcW5tQ2VC?=
 =?utf-8?B?L3A2bjNvRnJ2L3I2bHgyZlFQcmZkWFdRRjhoelA4OVBocWxEdkVNMlhNM2hB?=
 =?utf-8?B?cXpUcEcxdGZtYStVclR6VmtzQXdFYWZGOUp4YzdOU0lDcTE1VmE2MURoU0JW?=
 =?utf-8?Q?Ozsi3O721fN6tGYgaSgqTRqGAy4sqv04/w/C8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aFZIMDZPQ2JTMXYxQW9yWWlEL2tRTEp3ZWd5b0lPS29ud0JxUmlEY21MSFUz?=
 =?utf-8?B?U1JVcEtYdDNtZVR5ejRCeS84NzZud2x1TnZyaVZOQnhxa1hVM1lPY2M0czQ1?=
 =?utf-8?B?dDB4WXpCalFycUVJVkVVelozVEJFeWZNa3lLd2ZocEdGZXFiSU0xWVYvTHNx?=
 =?utf-8?B?Q0Evd1RLenBjQlRHcitQbERXcHBSSFpVakJKcU1BenF4L1BYcmxwaWxQdHRl?=
 =?utf-8?B?cit1TzN4MWpDVE8zWUhOL0paQlBFRVF0MXkvdFpaeHR4UGpweWp1dS9hclky?=
 =?utf-8?B?Q0JYdUJ5b1l3ck93cnlkMWJHS3FCalhiSnBncWg2M0ZCbXZhMlp3aHNGakhu?=
 =?utf-8?B?ditQZ2Nndy9zdldDb3lXbHdMWHpDVy9OU0czTlJURWQ3ckt0ZWE2YjlyQllH?=
 =?utf-8?B?aFlzK0JvQjB3MjNUdmtBNFdpZmhvOE55amtXcTNxN1ptR2ZhR0ZPUFFiVTZy?=
 =?utf-8?B?VTVsejhXWHJVZUczZjNmbmlNbVBHcS9WcVlNZXJSMGExV1ppZzJ3ZTFNa05X?=
 =?utf-8?B?cFpJTGhGVnp2ejdzK2xPNmJRUG5JSXVqTkpDTHlJcjVTOGY5RUt1WmFGVHdq?=
 =?utf-8?B?K1hVTEVtd3pMT3I5ZTJRTjk1b1NsMGFWR2pqV09VMlhMNnRTbDlSY3FjSFlE?=
 =?utf-8?B?eW02SHNiZnZzekNldnJlTEVRU1pUU1JWaEI4S211Y2d4QVovdTAvSytkdXFB?=
 =?utf-8?B?blBlTjljOVhRL0ZZT2JxR2Nlbk9PSkRhSmRQUFpuR09vQmdpVGF0U3R2QWE5?=
 =?utf-8?B?RGFWeUlsS3ZYcE00VS8zajU1U1hPS2FacHZZN0w5NDJtdDgzTDlnbzV6Njha?=
 =?utf-8?B?VGtua0ZmanZwNHpWOWw5Wm5KcmRFYTR1YWNVRGhML0hNWllXSVBFL2VEMmZz?=
 =?utf-8?B?ckVMY3VHaDVJTnFoNEEzYlNvNUJvVTZaOXM2TWNXMHJqSVM0T25CK1VkU1B2?=
 =?utf-8?B?c0hVV214RlBZYTVXY2N5QkNkdy9vV3VVR1A4SXp1MEhWTk95WVpJOFlOSVo2?=
 =?utf-8?B?TWxsQlNjWjAzTjhvc3VnQVpkR2RKZ2h6QWlJTWpDV2NIQWxhblN2WHBQcGlB?=
 =?utf-8?B?dG1lcW1wNmRiWlYvdnlEODVaeGppUFZXN29xR3pXdml6a2xOd1licWVvb3Ez?=
 =?utf-8?B?WDBTaDJ3YllEOTYvaENiVU5xWGRxZG01Sy8wUFFUaktCY3ZGK092UXFrb1Vr?=
 =?utf-8?B?RnB3Q2NlQjJ0QVlMc0h4MERoRHFHRmo1YTVCYVAyRy85V3VnR244R3NPWVpt?=
 =?utf-8?B?UlZGR0dUbzl3Y3hXSW1YZFBWM0NpQzNBRXFMaEZ4M0EyN2UvZGZzckhuMTlM?=
 =?utf-8?B?U09TTlNrY2F4WXYyemVTbVVKUHRsb0FwcGI2b3JTeC9YMUV2aFcvVnppZWdF?=
 =?utf-8?B?SEV4Y2pLOGNydWxISkVkc3hRYUk1OXJOWTBYT01NbFJqYWgza0d3Z0RUNTZi?=
 =?utf-8?B?VUxGcmdyckl2TW5jWnhRM0xXZ1pVRE82NEp0T0ZRUFVrbGMxR243blVuNjQ4?=
 =?utf-8?B?Um1CTkYweWdGOWN2TjBHQ1lBQ1ZUWVlKUER4WkxiZjZVU043ZEJlVEdYZlI3?=
 =?utf-8?B?cGtuUjBIY1JZY3N2T0Z4Nm5Rb1hqMnRSeFVtYVlQRm1rOU5Sd2pXTTRISk5Z?=
 =?utf-8?B?M2FsL1FpYU5VT2R5WEs0dlZSZUptSFJ0UmZOaFRWd1FZbjVGcUpwbnQzN2tw?=
 =?utf-8?B?cnlJczYwcHh1eEV3TWs2ZzRKYkxQMnJZeDhITG5ZUzZmdS81R0VNYmZieTBh?=
 =?utf-8?B?YkdscFVRSW5vYXJ0ZmdvRWNqbkM2M1JZeXljbTRVS1ovY1BNT1lHc08wOEpK?=
 =?utf-8?B?STdnRy9DbXozQzlaSXorNHpHSWVUaERvZWptcVdURHhLYXU2N0VLZHJCcmRF?=
 =?utf-8?B?YUd5NmlSekdrbVVDazNnWGhQQUlzU1NKbGZ4RnBGcWFrVWtZUjVGRm9IOS91?=
 =?utf-8?B?RmlMQTFtcXJHcGtXYmZmWE4rN0R4SlgvdUxvZThrdzVlVnZLL21QQXBYMzlS?=
 =?utf-8?B?aktqSHU0KzNhUEZGSWcyY3JOU2MvQ2paei85S1UyWWVZRlVQNmgyRUh3MytI?=
 =?utf-8?B?SGdSUUxTT0JQOTVTTkluRU9maFN2QXIza0ZYekg3dHZvVlBKemtrYlJBM2d5?=
 =?utf-8?B?WFJtNVVldVFsMnFhVEhYYmkwb2UvTkRIeVJpRUdBcVNUQ3A0ZWx2YWVGYy8w?=
 =?utf-8?B?emc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef5cb61-d842-4336-3b15-08dd1f686c4c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 13:32:35.1539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MFLB2q2fQf+WqBXLqmJcdD4EihQCN9lF9urr/EUTon5/S0BRs2XoyBw/m6Rbrkg0lAuoaYWadhRB7tPtKS4eG1VISONVHGoWcsbNx2ycLZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 13:32:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208870

Hi Derek,

On 12/18/24 12:12 AM, Derek Straka via lists.openembedded.org wrote:
> A large number of python packages leverage the pytest unit test
> framework for their ptest functionality.  Currently, many of the tests
> have duplicate code for:
>      1. Installing pytest files
>      2. Declaring ptest dependencies
>      3. Script for executing tests (run-ptes)
> 
> To simplify adding common pytest based ptests, added a new class
> enabling base functionality.  Users can also override the location of
> the pytest files in addition to using their own version of run-ptest
> 
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>   .../ptest-python-pytest.bbclass               | 42 +++++++++++++++++++
>   meta/files/ptest-python-pytest/run-ptest      |  3 ++
>   2 files changed, 45 insertions(+)
>   create mode 100644 meta/classes-recipe/ptest-python-pytest.bbclass
>   create mode 100755 meta/files/ptest-python-pytest/run-ptest
> 
> diff --git a/meta/classes-recipe/ptest-python-pytest.bbclass b/meta/classes-recipe/ptest-python-pytest.bbclass
> new file mode 100644
> index 0000000000..89ff10c335
> --- /dev/null
> +++ b/meta/classes-recipe/ptest-python-pytest.bbclass
> @@ -0,0 +1,42 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +inherit ptest
> +
> +FILESEXTRAPATHS:prepend := "${COREBASE}/meta/files:"

I think it'd make sense to use :append here as we don't want to override 
anything, just provide a fallback in case the 
ptest-python-pytest/run-ptest isn't find anywhere else. This would also 
allow to easily override this file by just adding the file next to the 
recipe, instead of having to add a FILESEXTRAPATHS:prepend := 
"${THISDIR}/${PN}:" in the recipe after the inherit for example.

> +
> +SRC_URI += "file://ptest-python-pytest/run-ptest"
> +

We use append/prepend everywhere but here, should we?

> +# Overridable configuration for the directory within the source tree
> +# containing the pytest files
> +PTEST_PYTEST_DIR ?= "/tests"
> +
> +do_install_ptest_python_pytest() {
> +	if [ ! -f ${D}${PTEST_PATH}/run-ptest ]; then
> +		install -m 0755 ${UNPACKDIR}/ptest-python-pytest/run-ptest ${D}${PTEST_PATH}
> +	fi

This means if we ever built the recipe and don't clean its WORKDIR, but 
update the file, it will never be updated. I don't think that's what we 
want. Can you explain what you're trying to prevent here by having a 
check for NOT installing the file?

> +    if [ -d "${S}/${PTEST_PYTEST_DIR}" ]; then

Shouldn't we use UNPACKDIR for file:// SRC_URI in master?

Cheers,
Quentin

