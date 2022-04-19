Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A7DC3527C
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.85])
 by mx.groups.io with SMTP id smtpd.web09.3314.1650369773593160648
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 05:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=njZLoVGS;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.1.85,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EOvGSZJ2oA5yKBJexNf6lBo7EI1C/vZ5lQvymD7fqNmfAwDyZik0/USV4HNOyJ8t58I8PrydB7b3bH3bmaqWOA6NVFV0v7miNEoTLV1VdX9RASQ2XT6umkvCx3uX/XhBJu5KjL4feeAE4qBKG3n1N4aJkymu8HMQJwgk7DpEQYUQ0aaGnsJWNZjkNOlz2q0rBHSaZ39QDNCR9jHcf0iMcLZorlQLofXJ/+wkyRooWFfNeMas3brAtR8/f9qWH/+6eCrZWwuYcUnPbcFOFR/scsglOVEk5tINWXkmERYLa+2LuJt6j3Sm1IlNIqaoGLeDYyyE6EUjBIQ2Di/O9fu7Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xabDIDvN8lVrTD9CSp/isKi8+953w1bdwE9gQw0bifw=;
 b=dvm6Cym3B98bSZA4gsJMs4dWYEe1J8IBK40qIKAciZCS+FMLYcloMmn3bHN5sZ4noqHvZ9b5aUh2eY4DWDMzPYK0eBjQ2TDwvwY0G8/w30MDk3XB+QNzkIJgvUgmnCglXY1URWZmAvFceSYihRx1Bbb5KF/Z5lxbrlg3v2umJiP8MtZT3fx9Wfr2ONbm0S8s5VvJsjuBsqAhy9ijGBc96VI75PQd4W+7H0MNtuNGeyHmTBUsNFJeC/YcI0Y0hEKCT/sWZR6u4hn10oAH7tD2cgZCnb+T65E59+YD1doGpIuhz/KHFEGCtdBiLGDU30+z9NETrxWFLfZeEwCpnx0vPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xabDIDvN8lVrTD9CSp/isKi8+953w1bdwE9gQw0bifw=;
 b=njZLoVGSgyR8VI1z1Okf9kJkh8Fs0FC4tE2OV2hVQpudAvrjomAvhKq7GazLSH3PkKX0oyPaisebmLj9QkM8vpqGtOGyATzFS18oAogfvceE0UKJT8MZ1NqJgTuEsOzU8LOzkgInqoK/xKRfOItOYq5QLN/xtfrKHzpZZ2SA1q0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DB7PR04MB4651.eurprd04.prod.outlook.com (2603:10a6:5:36::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 12:02:49 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d58:89cc:5b41:f13f]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d58:89cc:5b41:f13f%2]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 12:02:49 +0000
Message-ID: <bb475691-6e51-8a7b-7da6-5ae584f063e4@theobroma-systems.com>
Date: Tue, 19 Apr 2022 14:02:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH v2] libgpg-error: Add ptest
Content-Language: en-US
To: Simone Weiss <simone.weiss@elektrobit.com>,
 openembedded-core@lists.openembedded.org
References: 
 <e56e9b09-e7c4-4654-8f85-f8f27e78ee5d@denue6es010.ebgroup.elektrobit.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: 
 <e56e9b09-e7c4-4654-8f85-f8f27e78ee5d@denue6es010.ebgroup.elektrobit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0023.eurprd08.prod.outlook.com
 (2603:10a6:803:104::36) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3684b47a-6080-4a6d-1ec3-08da21fc8649
X-MS-TrafficTypeDiagnostic: DB7PR04MB4651:EE_
X-Microsoft-Antispam-PRVS: 
	<DB7PR04MB465193F7CAD618AB46632956C2F29@DB7PR04MB4651.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OCenFpOmu7c81ZvD3jJvZvB/GahpPdn+oFtU91cJev5K0BlfTGUjMjZmSc4tWsvJ3/hLdYvZcNPCS2WW0i5vh3fmLSUvXyJu/LfRKcyDzaO29dwfmPuFMd59d38zZVAPWGli6gkv+/UZtrDRAv+nFExJfkfwO08rk588kNn4/pDlmLI+hZR7ipGMcSr3R8yFtwiE9ETplyBRiIz3QPhzqSAyaqIN4oQdTaNU9mBd+viWPfHEseMtt8HBhL8PinJO2ggKd+XMokiF4gHd4ClWr13Z5N0tfqkr0OI8dHsimiCKUQJFd0bVdVkkmGzYUT094FbBzCgr6o0L3gEjZBo44GXQfIyCGwKHofDc7zY4n8/iJq3ry+4Uan8L3N8fyFo9+93hobnV2bxsHfeuFN5XN8+T8FY3mOMJYsZI1ZDf1pFquxOqWaSMnX2bht4pMY8yOLADuCKplgMJIYGd4LOij1LwTAG+SrRUUbirvPE/ZwG5cnjTb68uccyhOl/JB3Pc7XOnxh7l9n5GmIENENTXvP+yZ+hOEEiNLx+f+opJvsBhkxrqgkxvUZ2IXGx65VPjXezsFzlr+tjwPLM4U2sEqwe/BHe7j0kUmB4DsVITFI1X6Elny5VR8ylpiG9QdIYffBxoqOgoOrQe1Ur+Ss3kGfj1tys5oz7rgkBgEzIbX7HX1QwiY4LsLv9cMEc/gjuj2dA8lNAocVvl/9QCWPmnwm8SqCikWis0pBwCyLpZC6a663L+jUmUkZEGrMe3yD+DRbX9JLVsio8+0Hjvf7lLVzGnX2RrD2p8LfaCh+QFDfyVNYHN6bJBMkDTj1gw+XYY
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(44832011)(36756003)(8676002)(186003)(38100700002)(86362001)(31686004)(316002)(31696002)(6486002)(8936002)(66556008)(5660300002)(508600001)(66476007)(2906002)(53546011)(83380400001)(6666004)(6506007)(6512007)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L2Nuc0gzV3JOaEQwUlBIRDJlQ3dEeGRsWXZ4NGdxTjFpekdNR0drVXlIME96?=
 =?utf-8?B?d1NUUURUS1lQT1BZM3lqWVBnZkFKbXNnckF5UGpjcWZKaEpLc1JsaHdXMU5x?=
 =?utf-8?B?NWpWWURGSGkvd3JSM2szamxPNEFjRHRzUzRkY3NmRGhOL3VHYzlXWDM0UmIw?=
 =?utf-8?B?QkxlSUVuNFg5d2JRRU5PdHJ2ZVJmdHc3WWNoZzZlTkdwWGZIQjZIWitROHFN?=
 =?utf-8?B?b2NqTTBhNWFvaTJNb1VqZXdBUnREMW5adHFHazhLSDRiOW1XQXBtZlljaDJi?=
 =?utf-8?B?Rm1rK0dwODIyRHJlcC9iUTBmbFpCQkVvLzRDd1VIYnVBMy9YZnQ4Q0pPbXVh?=
 =?utf-8?B?blB0SUd4RHUrY0o3NTVoQlc3aXJYMlhzbDdhL05tM0ZhOUl0MFU4cWpLQU1a?=
 =?utf-8?B?Zy8zYWo3b1hQbWNMREVtKy90NmpFVGgzVTczbnh0YkRyNC9TN0tHZXhibEta?=
 =?utf-8?B?Tmk5NlFOMjI3ZWhielFBblhUMjJPd3BSK0tZaC9qcTlEbTB1SHdKbVA2UFBX?=
 =?utf-8?B?aHY0QlJ1RkZCbFlRZ3k3b2dQVTB4a1dJYWdsL1I5YUtoYk4wZ1R6UkZzU3B5?=
 =?utf-8?B?d2dkbVFKZ0JoSDJ5Y1dKU2UvMG5GMWlFbVZWYzE0Y0xqengxbnF1bDhOeU10?=
 =?utf-8?B?ajcrbFlrcmdCQkN1SjVsQVBqSFNOQkU3SHJKVlI0TSt4RERiQytRLzhDRkZJ?=
 =?utf-8?B?bXh0a0JTWGpwR0dpdnBoY3pnendra0Jqc3FDUzJ6TVV3bWM4TDhnNzVCYi9W?=
 =?utf-8?B?bXdqYWFmNU5WMEJCZGdrbHovTWJ6RHQ2Tm1ta1pYQjY3YitLbmFjdkJ0TktC?=
 =?utf-8?B?cVM3cUhzQVNTaGVSSjRSaFhYUlIzNURsSVVPUHQ5dUUyMDdwYVVqbWF6ZWJx?=
 =?utf-8?B?Z2M3bDBwbHloTytEV2tnMXpnblBDUURacHJEMTFzb3RJNmluallCNUV2cy8w?=
 =?utf-8?B?NTRaa3FYZ1grU3FMWDl5Q2h6T0RVN0lyYkVnU3p6YWhlQk9pREw1VTM4enNH?=
 =?utf-8?B?SnpkeFVNRWNJdkNTalB6U2J5WlpZeGtFNDZJcS9nNWdYbmg5YzVtZVR6b055?=
 =?utf-8?B?azlEN2N5VUpSalZxSVl4MExYNEZFVjhVNEs5T2Y1UnpCYlJEb0E1TEZtN012?=
 =?utf-8?B?SHBMdWE3TTV6ejVkd2xZSkRvZnlIYTFNVVlUTXhZYk5YN0YyZXpPOTdjVk9v?=
 =?utf-8?B?bnNYSkRuek1oWnlXVmt3VVZDS3Fhb1hwMkI1VGFyZE1rV1hWRVdFZXIyRDRD?=
 =?utf-8?B?TmdZTTE3MFlNZXh5ZFlIbU4waWxjUzl2U2JmYW1uUUhlckFiRmlUaU1lV2xE?=
 =?utf-8?B?MFQ5MmJXS1BxTmNjWE5tYXIrQXI4c05ncGhzeGlPaElJRGJjN1RPSU9lTm5O?=
 =?utf-8?B?QUkwV0FnVHloMk9jWGh2M2kzM1U3bjlLZjQzcDNsWlUxVE9qaUZtYThsYzdh?=
 =?utf-8?B?c29mTFdUUm5Xc0lSN2ZzRmN6Z3B4Q0Mxc044elVySjFEOWpqdW1vazRzQkxX?=
 =?utf-8?B?MkRrVWJvZ0lXVUNudHFiSUFKRnR1SGtmNkRqbVVxdmduT1YwRDRlRUFlWVgv?=
 =?utf-8?B?YlpRRDZKTGk0TktNeS9UUkU0cEg4MDIwRFhyWEs5UG5ySENyb2FXUTJJV2Rj?=
 =?utf-8?B?TFhEa1pqOUVaRTMyT0JTVjJEanRMNDNqQmpMbHdTUHA2S2pSaDVQMUF4S2Zl?=
 =?utf-8?B?Rm40UE9DU1c2V2VDWlZDbjMzR1RrWTJ4WHc0c3hnQ0hxdm5lQXpIK2dDR1Q3?=
 =?utf-8?B?Vng2b0FVYjd4KytIVDNmVGdmRUY5UzhtTXEzb2pTMTQ2eS9HUGtnTFFGMFV6?=
 =?utf-8?B?SDIxMmpTdHM0d1RTWkp4cUlZbFU5YmdrODFBVGxPWXRabGE0ZFRDc1RXM1M1?=
 =?utf-8?B?aDJnTGxqaHdETVdQN292bzN2OVNEenFGNWF2QjN6YzQvUXVrd29WOEF1MzBB?=
 =?utf-8?B?NjIxQmZjUm1qd2JWcTN3VExLWEN3bzVhN3BGMlF1ajJOMWJuRXBFcVBHc01M?=
 =?utf-8?B?OG5Vb1A2eGVVV2JWREMxL1JBcWJQbUtMZG1FOXA5N3pxWTNvRHlWb2Uyc0FY?=
 =?utf-8?B?ckcyOU1CU0wxaDZGL3ZMVHFQSGJIaitPS0t0WEhkNFEyL3lnZVZMa0xTc1lX?=
 =?utf-8?B?a3VGdUNKbkdTcE1sWDlPVFppR3VvR1dXSzJUS1lweHlIWjVNY2U1dVBFbkZP?=
 =?utf-8?B?RTkrejlLT2h1b0tuR3BkQTY1a2hZaEQrMmNMUy9Wc2lYenVlVEhPcnVLQnhj?=
 =?utf-8?B?MUg3b2xDUjBpUGpheUw5d3IwWit1S2czQU9hdXhRV1ptR2FUTzJnV0pyL05Q?=
 =?utf-8?B?RHBqNXFzaVQwZ1Q3R0dpT3dSMHJseTI0M3c4U3dSdjBUQ1JBVjA3anlqRys5?=
 =?utf-8?Q?WT2P6znX1zdtF2Gx3CNFXZW2hZ2oMobVRtVwMIcbCOz4p?=
X-MS-Exchange-AntiSpam-MessageData-1: S+5wXXC7Ob4AmrRxXoxvCU/3idokkP/ZK+U=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3684b47a-6080-4a6d-1ec3-08da21fc8649
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 12:02:49.6010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 aujuXdpnb4jlV4xHaAmvBy3S1ZWJ3LODieuz9g1qsr6rIjTffBAXBEXccz7H6n+cRQrQn7h/N23DOlQeWc6qCv9J8rlQH47nAAsisaAQGo2OpzbMVu1V06SBp4Pj3qVf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4651
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164627

Hi Simone,

On 4/19/22 13:50, Simone Weiss wrote:
> Add a ptest for libgpg-error to core-image-ptest-all. Avoid refreshing the
> Makefile in qemu as this would fail and is not needed. All tests passed on
> a trial run.
> 
> Signed-off-by: Simone Weiss <simone.weiss@elektrobit.com>
> ---
>   meta/conf/distro/include/ptest-packagelists.inc    |  1 +
>   .../libgpg-error/libgpg-error/run-ptest            |  3 +++
>   .../libgpg-error/libgpg-error_1.44.bb              | 14 +++++++++++++-
>   3 files changed, 17 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/run-ptest
> 
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index b51cce4d9e..54a290871e 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -25,6 +25,7 @@ PTESTS_FAST = "\
>       json-glib-ptest \
>       libconvert-asn1-perl-ptest \
>       liberror-perl-ptest \
> +    libgpg-error-ptest\
>       libnl-ptest \
>       libmodule-build-perl-ptest \
>       libpcre-ptest \
> diff --git a/meta/recipes-support/libgpg-error/libgpg-error/run-ptest b/meta/recipes-support/libgpg-error/libgpg-error/run-ptest
> new file mode 100644
> index 0000000000..2d23159eb0
> --- /dev/null
> +++ b/meta/recipes-support/libgpg-error/libgpg-error/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +make -o Makefile runtest-TESTS
> diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb
> index 41adad0ede..174350f6f5 100644
> --- a/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb
> +++ b/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb
> @@ -17,13 +17,16 @@ UPSTREAM_CHECK_URI = "https://urldefense.proofpoint.com/v2/url?u=https-3A__gnupg.org_download_index.html&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=Ui2nY_A44KZmC7L6iMWtxuDvE93ZJlqF6JBUrDd0WDdFkCl6mzBvzpKLYNZl_LoY&s=COyYRgd304K6MYfcq1-IwYlkbAwWuGQIkGvx8_TtSyU&e= "
>   SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
>              file://pkgconfig.patch \
>              file://0001-Do-not-fail-when-testing-config-scripts.patch \
> +           file://run-ptest \
>              "
>   
>   SRC_URI[sha256sum] = "8e3d2da7a8b9a104dd8e9212ebe8e0daf86aa838cc1314ba6bc4de8f2d8a1ff9"
>   
>   BINCONFIG = "${bindir}/gpg-error-config"
>   
> -inherit autotools binconfig-disabled pkgconfig gettext multilib_header multilib_script
> +inherit autotools binconfig-disabled pkgconfig gettext multilib_header multilib_script ptest
> +
> +RDEPENDS_${PN}-ptest:append = " make"
>   

s/RDEPENDS_${PN}-ptest:append/RDEPENDS:${PN}-ptest:append/

Note the _ changed to :, because of the "new" override syntax that 
applies to package names too.

Cheers,
Quentin

