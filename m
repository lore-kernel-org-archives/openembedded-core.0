Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A027C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 13:58:35 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.71])
 by mx.groups.io with SMTP id smtpd.web08.10508.1647525512733177653
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 06:58:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=tmDD9LA7;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.1.71,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ktN18sOUNTkWoPH4eS0pAw1ybwvruOuSm0/6horTQaMHcBzwPlRJxqsKJTxL8+5QYTedXFEE04qXy/i46aXenUgzJ8cV7geWFsSMQDDwPcG9wc7oIZ77mDji9wSrArSt0QXzPUkp9TKc97KfL9oqVMhBJrsk5taTB8KkGcJHWUdZO2O2mSLVPyP+4gAFV1EOkyf4gWEDPCIFLajXDq/I+9ztBkpDp2sFw+1ZOLpllq2EYOPiWaorFfBIjna2CUwCMBvPulZYUsBM4KPkz7p3Xo/jsfNMWzshiVL3DpeCVpzIiieGQ3QdhFlVckDuaeasUiE3EF8hPiTZVnBkDVa+gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4q8jYkNyLjqW9lZqZVG+kQiYbzNSgcN+inaD1ET9YA=;
 b=nSkGAlwUQGCQc4flG55NPXG5twjYmymLpccnsqSmAaIfF3sgaTE5U0o+wP1IvtkM9E6oqUvhsQOsKECHQ2G+M9Fr7DP4b9Dhm70XNlH8e6CtAClfs5dLv0hDqxL6JADXEDzmvGNWubZ3EvKxJZY53WhNEHRuBD76oCTI3Aq+OH9o1unzDetV+MbGnn80NNDVLbI4oZ4WLbiBjllN8W8OqNkNr29rx3PQDHRay/G31Skjwkbrom5q8KEdqCo89RcVa2zvypeB5/zWyM4BiOBfSeH4Th8C3Bh/n0ug5QXe6J7j88Omoy/S5zB1tUTBvLkfEEIu+IOvjXYzJGEova8qOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4q8jYkNyLjqW9lZqZVG+kQiYbzNSgcN+inaD1ET9YA=;
 b=tmDD9LA79OZDypetdvKXyXRpHMQxU67PH8Qrb+d/D6wWceRvR5RK7J4uiEWD6d6IQl8d1C7XosZcrZ7N6fnmYs8Ak+ZOfPmJo1FYECYIf7dv5rZHHcjHHLRI3uZHmDPR1Foajz69XudXN41mVEWH274Q2FdX14bET4aDsT4mX3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM5PR04MB3282.eurprd04.prod.outlook.com (2603:10a6:206:3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 17 Mar
 2022 13:58:28 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391%6]) with mapi id 15.20.5081.016; Thu, 17 Mar 2022
 13:58:28 +0000
Message-ID: <4ce04dfb-fe3b-4b78-2efa-72183984868d@theobroma-systems.com>
Date: Thu, 17 Mar 2022 14:58:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [OE-core] [PATCH 26/26] buildtools-docs-tarball: Add test for
 building documentation using sphinx
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
 <20220317115700.993924-27-richard.purdie@linuxfoundation.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220317115700.993924-27-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0101CA0063.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:1f::31) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97c37961-20fd-4555-8de6-08da081e36b6
X-MS-TrafficTypeDiagnostic: AM5PR04MB3282:EE_
X-Microsoft-Antispam-PRVS: 
	<AM5PR04MB328227E774AE9B480EF6FB44C2129@AM5PR04MB3282.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8Zf310LnDS8zEIIdXmlRKfqlbKQjEbM0Xq62qD6cXHVzqYkBaFnwDoEbLd0akZjWpX7NnxeEes3vUT3xPwWzppB6V9eji/gMj9QLvdaKJlLkPoBFvY5vXsUBjE03zUmhu0mdC+tkW8B4+W3PCzYCgysT78aQ8PbII4SAQPLcwbhsGQ8XvtANYsR1Rhtbvb07owSe8omHqqL983W77AOuOlaBBU3Hs8Y/8h6GnXrSNQ+NFdmNMZK2sVco8fKsW2W7hZrCpvCdp24V8x6vDTjmE2q2pxtYkSuWwFv/MleU7SkAjCuaukDi/g6LKmIE4jhdgEktRRX99NQmKWyA82SZNlu0yH0ThvGGcWrsbUI0fd8FNRCr8FRrKFdq+BCWZ/h//kfUvnA80iyKAiEPS4UpwDflMktGM46SougWAjX02xhCWIH1RgQean0BiTqP+UmHNUqcUJJydW6hSG87Q+avEMEWZ6BwKIa7Xjg9YlHq7p9Ie3Z3DttWqcdAJwc6/ZdMGuBgnf+rlOEMiUG2fo8KPxfgxgQFEGsUUv4+xyZus+P/r/LuoWxTB8QSTdAYexGFSW/Owf8rP9LBnQC1MOWqBgiHvK0aVjnpE2M1BZBsBvJ58ur9+M0ezgvRU7uRTKfdTV/ydJJqwCtEIfcB43XkptQdNJra0Cb1KJUAReA5pP4KXvHI5KT4ZSaAbRxcA9iKHFeEIGFdSGWCi23dfFK0VnBQ6ltCLFn/RmtHjS4YJw0mO+OkhFaJf0rJCOh1tuBZxgAR84VMMAgHU5P8Ktgl3vusX557CA9wtZRnAZ2DNIaUnhYOBR0dm1jlLHE0wYFALfA9wuolGIpxjo9G1yXSPQC9nJ2N3W6SxIvyzfSwW18=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(83380400001)(66556008)(66946007)(66476007)(36756003)(8676002)(86362001)(31686004)(38100700002)(186003)(6486002)(966005)(31696002)(508600001)(2906002)(53546011)(6512007)(44832011)(6506007)(316002)(2616005)(6666004)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MnE4NUpQRGNrdmErWDZVN09CeWFEVTg4M05lY1JQdU5WWk53cW4xSlJZeDRC?=
 =?utf-8?B?S3JuL0NDTzAvNjhHRWM2WnI0RzIxdDFLM3QwNHVtWkhod2Nxa002ZkdsM3Bi?=
 =?utf-8?B?c3d1TVI3V3U3bGJkMTdwVkc5SmduWE1zRUh2UHQrQU1oeFRmaW9yb2FOSStr?=
 =?utf-8?B?Vm1oWXJvZ3J0elpPWGJsK1FEcjgyUlMvQ0l1SjhDb0RUSTRYUThhYTBKcXFN?=
 =?utf-8?B?SU9KMTFxYVRTeFl6T2FJZzBrNE1zN01KNXNxazNoVXo0Um03eHZMa0ZnT2xn?=
 =?utf-8?B?N1FZQ0hjUEdzN1B0NUdCV2sxdUVBeXRCR2hjanQ0dC9RejFBVVZHTXFUWkRx?=
 =?utf-8?B?bEQxNzFuVWdLMi8zTHVTU0lwVFBQand3czcxUStiOUdnd2JZeDN3cHloQVA2?=
 =?utf-8?B?b2l6elN3ZXU4SHBMUTlSdFJaQkEyUUQzYktrUWpEcnJhdUFKU1ZvZzkwTlRH?=
 =?utf-8?B?c1FpUjNRT0ExMUVPcEp3T2l3T3d0QXJvMkMvU1JFNEMyRTUvM1Y5SGM0d3pJ?=
 =?utf-8?B?ZC90OEZucDJBc3AvY0FjdzVSSFo2U1g2NUZ3UzZkaDZkVEhpU2VoZ0VQYUdP?=
 =?utf-8?B?T25neU9uUUJyWkpVbG9ueXMxZTNNdm5SYmFmY0NUekZTbmtzNVlYTzVGOWFH?=
 =?utf-8?B?Q0RWZmVTdm1RRXRJWWJmb05QdnpDNnlWOXN4Mk1Fcmw1ZCtVZ3hudHd3Nlh3?=
 =?utf-8?B?ZFZFVEF0YXZuR0JudVBDQkVKNGNhbTNkSjg2TXlmYjlpRkJjRlc3QnR4ajBk?=
 =?utf-8?B?SW5sNkU3T0VZenMxWGZPVzNaalBDUDRrak5lT08xVGVlL3NLUVlhQjVGdFF0?=
 =?utf-8?B?OGlyLysxL3pjdjZoMmZnOHFVNVhoUVdGV3I2UUhySms1ZXJDa3ZyUFFya29m?=
 =?utf-8?B?bE1ML0NxZzVucXdTNHdLUVN5bG9VNW52ei9zNUZYYzJxM2pFaEY3ejI5SFRt?=
 =?utf-8?B?Zm8yMFljUisxS0pEWXZ5dnhlRWxvd3JsOWdzYy9LOHpITWliYnJ5ZTlGOHQy?=
 =?utf-8?B?REYxWjZLczdQSm81dndKZVpxVGhrcnl1dlFEems5ZldKb2ZDb0VPdXNKUFZS?=
 =?utf-8?B?WkJMY1gzZkhpVDNsRGtUZTZOZUxWMXQ2TEdlRHJPQWkvYTFGNi9uYlJpanhJ?=
 =?utf-8?B?aGxCQ1F4cHlrZFhzNkJsNk1Tbm43dUpVOUcvcFNNMmMrNThqNVVmdHZxU2VL?=
 =?utf-8?B?TjBYQmNueEhMMmppSC9ldXBVK0NVQjhXZXhqMDVqZnJqWWMveWU3RnM3UzNt?=
 =?utf-8?B?TWJ2UXBvcFRnbHVxQWZNQnA1V0NwMXFpTzdGV3ZLbXA1dXBWQ1VCS3RYcitZ?=
 =?utf-8?B?dGUyN0hEazUwRTZqWnRQd2NJczhWMEhNUFo0R255bFlkMGhYYzB0MjhuMjhO?=
 =?utf-8?B?OTMxYU5DZXZJeldCQzJTdVIzaU13UTZkM0RwT3NvNkhZOUkzL0tscUZXOE9Q?=
 =?utf-8?B?VW52Z3JnTGlKUG1xOG9HWFVKMG5iaHhzUzVuVU1VQ1ZudjU0T0g1N05hUlFZ?=
 =?utf-8?B?amo5L0lFWmtSYldxOXBDRVA5cm51aSt1ZzhSYXhhdDl5WElDRHh5cSt0NkFn?=
 =?utf-8?B?MllFRlNVckJ4eGp6em1lSlFpcXhpQVp6TWJlUUlEcUQ2aVlUWGNYNEJPcVYy?=
 =?utf-8?B?UFNobmtZUG95clFPWTEzQnY1ZmV2RFM3bWE1U0N3bjJweEpiNDBKR0hscmZN?=
 =?utf-8?B?cEVCYm5PYjBzQlVwMmlLRUR2ZmhubTJ4V29yd2VMTklMa3hka0c2Y0NSdFI1?=
 =?utf-8?B?U0ZkalZOSTdwY01oa0RtSUV1K0ZIWmRmbmt3NzN6MHBwOVkwRXkvZ2N0alRE?=
 =?utf-8?B?M0JYQ2N5dGdhTitvSmhmcUo0b0lpVDczRG5GUmZmTVNGTHRuL3R0aXVVSjNL?=
 =?utf-8?B?bjJlV0FsOWs4MGt1RStYOEJvMThQUHZtUjdzbDdsRnFIcFpQWHQydmx5aFk3?=
 =?utf-8?B?amZRZndoZGp1dG5uSFJaNTA1Q2JvYWlmUDFib2p3NmhtQ0lOZ0pIMzZob29N?=
 =?utf-8?B?UFdkNlZ0NGhCZEZLMFFwRVVKc1ViVC9oMjN6T201VjJ6NnY1V3F0eG1Rc2Ux?=
 =?utf-8?B?ZmdQWld1VGpmMmtZRXRiNmtjU3Q2L1dJRndTUT09?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 97c37961-20fd-4555-8de6-08da081e36b6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 13:58:28.7570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 bEVMKxrhqv9herJglH4d9us7pg5s+W+hisTxMbM1+oF+7fAOD4d9gnr0TurhNPbIENICw1YAgnMFfEkvYD3xsLBE/k9MTbD3eh22ju5wqFfWjQsgNBymI5jJNvN6zylc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3282
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 13:58:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163417

Hi Richard,

On 3/17/22 12:57, Richard Purdie wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/lib/oeqa/sdk/buildtools-docs-cases/README  |  2 ++
>   .../lib/oeqa/sdk/buildtools-docs-cases/build.py | 17 +++++++++++++++++
>   .../meta/buildtools-docs-tarball.bb             |  4 +++-
>   meta/recipes-core/meta/buildtools-tarball.bb    |  5 ++++-
>   4 files changed, 26 insertions(+), 2 deletions(-)
>   create mode 100644 meta/lib/oeqa/sdk/buildtools-docs-cases/README
>   create mode 100644 meta/lib/oeqa/sdk/buildtools-docs-cases/build.py
> 
> diff --git a/meta/lib/oeqa/sdk/buildtools-docs-cases/README b/meta/lib/oeqa/sdk/buildtools-docs-cases/README
> new file mode 100644
> index 00000000000..f8edbc7dad7
> --- /dev/null
> +++ b/meta/lib/oeqa/sdk/buildtools-docs-cases/README
> @@ -0,0 +1,2 @@
> +These test cases are used by build-docs-tarball, and are not used by the testsdk
> +class.
> diff --git a/meta/lib/oeqa/sdk/buildtools-docs-cases/build.py b/meta/lib/oeqa/sdk/buildtools-docs-cases/build.py
> new file mode 100644
> index 00000000000..5b0eca046fa
> --- /dev/null
> +++ b/meta/lib/oeqa/sdk/buildtools-docs-cases/build.py
> @@ -0,0 +1,17 @@
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +import tempfile
> +from oeqa.sdk.case import OESDKTestCase
> +from oeqa.utils.subprocesstweak import errors_have_output
> +errors_have_output()
> +
> +class BuildTests(OESDKTestCase):
> +    """
> +    Verify that our docs can build using our docs tools tarball.
> +    """
> +    def test_docs_build(self):
> +        with tempfile.TemporaryDirectory(prefix='docs-tarball-build-', dir=self.tc.sdk_dir) as testdir:
> +            self._run('git clone git://git.yoctoproject.org/yocto-docs %s' % testdir)

I would suggest to pin a revision that is known to be buildable 
otherwise the test could fail just because a broken commit made it to 
the main branch.

> +            self._run('cd %s/documentation && make html' % testdir)

Also might want to turn off the -W flag which turns warnings into 
errors? (i.e. SPHINXOPTS="-j auto" only) I'd assume we let the 
autobuilder fail the doc builds if there are warnings and that we're not 
interested in that here?

Once this series is merged we should update the docs to explicit this is 
how we build the docs (which provides a known working environment).

Cheers,
Quentin

> diff --git a/meta/recipes-core/meta/buildtools-docs-tarball.bb b/meta/recipes-core/meta/buildtools-docs-tarball.bb
> index 72a256cf04a..72648e3b1cd 100644
> --- a/meta/recipes-core/meta/buildtools-docs-tarball.bb
> +++ b/meta/recipes-core/meta/buildtools-docs-tarball.bb
> @@ -13,4 +13,6 @@ TOOLCHAIN_HOST_TASK += "\
>   
>   TOOLCHAIN_OUTPUTNAME = "${SDK_ARCH}-buildtools-docs-nativesdk-standalone-${DISTRO_VERSION}"
>   
> -SDK_TITLE = "Docs Build tools tarball"
> \ No newline at end of file
> +SDK_TITLE = "Docs Build tools tarball"
> +
> +TESTSDK_CASES = "buildtools-docs-cases"
> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
> index 60f6aac837a..fac91cfc3cf 100644
> --- a/meta/recipes-core/meta/buildtools-tarball.bb
> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
> @@ -99,11 +99,14 @@ TOOLCHAIN_NEED_CONFIGSITE_CACHE = ""
>   # The recipe doesn't need any default deps
>   INHIBIT_DEFAULT_DEPS = "1"
>   
> +# Directory in testsdk that contains testcases
> +TESTSDK_CASES = "buildtools-cases"
> +
>   python do_testsdk() {
>       import oeqa.sdk.testsdk
>       testsdk = oeqa.sdk.testsdk.TestSDK()
>   
> -    cases_path = os.path.join(os.path.abspath(os.path.dirname(oeqa.sdk.testsdk.__file__)), "buildtools-cases")
> +    cases_path = os.path.join(os.path.abspath(os.path.dirname(oeqa.sdk.testsdk.__file__)), d.getVar("TESTSDK_CASES"))
>       testsdk.context_executor_class.default_cases = cases_path
>   
>       testsdk.run(d)
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163412): https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Dcore_message_163412&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=OMOooZJ-LyEYbPnLygc_ZMQ_QcJlTMswj7GtEBTG5ESUaF1pk3aC91BBjKNJF2dK&s=xcImmtC4uU-7XELDbmvTu9iCL8MwcINqvC4iQMNgl9w&e=
> Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_mt_89843344_6293953&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=OMOooZJ-LyEYbPnLygc_ZMQ_QcJlTMswj7GtEBTG5ESUaF1pk3aC91BBjKNJF2dK&s=5BVim6IZaXUSyo0dnYsv9IAwLhrsvuNj5Jki89oQAJc&e=
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=OMOooZJ-LyEYbPnLygc_ZMQ_QcJlTMswj7GtEBTG5ESUaF1pk3aC91BBjKNJF2dK&s=53ufSsaZGBsMBu7rTAP8Vipvhs4ZVcNFg6bnf84ktf0&e=  [quentin.schulz@theobroma-systems.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

