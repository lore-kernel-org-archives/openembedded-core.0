Return-Path: <jhofstee@victronenergy.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E782FC4167E
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 19:49:23 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.120])
 by mx.groups.io with SMTP id smtpd.web12.1302.1649185501958885853
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 12:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@victronenergy.com header.s=selector2 header.b=IphO2WNR;
 spf=pass (domain: victronenergy.com, ip: 40.107.13.120,
 mailfrom: jhofstee@victronenergy.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1dkDBwsB05+4BRHGBmKHKFkrhGCUDDuV1+yhP5NyCHndH/iMKGyqdbhlAI8SCiRlDHSKRfB7uTOwX4S6G1907Qd526/WC40r6dcRCyF1dFEthfPpm2VkWhXxlS74P3qNcHXqRivEmS3J38ok/cyfB0+JE8Um2G4CWrZe0SBZlt9PrIwUaHJq7agfcwH3dTQGydLr5m3rg2CaS10YW6yuDUZUbS0eT8wh9kGKOWnUV3k2LUVFFOMx0zb+8DTzpk2P6qKi8h8DbNTFsn3PdZxm+XgB8HSls/2At4YBDtiYT90uZtxyFlrssIkXifYH5pjfRA/Yoq6tlQA+DDWj9tSzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjUFNQaNAc5Tec/buasm0hxhkbDi0zgR14q0/S8LoB4=;
 b=SyoO2At1rYewkWuE57K9JJ/Ym0elT+BR8EmEk34GspsngU95KZ6xadov4dqipQuC7kibM9JLWSiJwzqs1U+5cE1KPkdbAauoMmX9MPL/5d90Ua39z0kSx1NbAkkolXfcw6UAdJM7joL5aMsy9L4/v2EKUZvAFFSHgyvD86Y7MvO7cEPcSEaX+Hdifp/B4pkSHLXwxkPhkSIegNWfyru1BOec4kmKjqtkF3MZZdH03LKcz81u+ppm48ToVKG1U0i29aM73sb5CpxGKP1PFJxV343/AHd9j/oUJmMPX8FpvX7MAuoZgxbYLnedy+MJRN3JIQX75AIiwpMfJwn1sbfU7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=victronenergy.com; dmarc=pass action=none
 header.from=victronenergy.com; dkim=pass header.d=victronenergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=victronenergy.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjUFNQaNAc5Tec/buasm0hxhkbDi0zgR14q0/S8LoB4=;
 b=IphO2WNRCOqXNIJOCdAvcW8qOkykR9VGIIclrxlxjX9I0MorE6WUYR54ZdznYBYw4k4FTIuIclopBLSY3vdVXahr3ztbEKJvQKUQ4PsIT/MrmdOh6nzElzPBK/kr2SgwUtHB4b1aKjaBvvHJvxOvhbt/j5l1ucDOZGcw3loXAiE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=victronenergy.com;
Received: from AM5PR0701MB2979.eurprd07.prod.outlook.com
 (2603:10a6:203:48::13) by VI1PR07MB4062.eurprd07.prod.outlook.com
 (2603:10a6:803:2c::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.16; Tue, 5 Apr
 2022 19:04:57 +0000
Received: from AM5PR0701MB2979.eurprd07.prod.outlook.com
 ([fe80::3da3:88:4224:24af]) by AM5PR0701MB2979.eurprd07.prod.outlook.com
 ([fe80::3da3:88:4224:24af%3]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 19:04:57 +0000
Message-ID: <f4e17d13-71cc-b25b-9a56-207ca89c76cd@victronenergy.com>
Date: Tue, 5 Apr 2022 21:04:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
Content-Language: en-US
To: ross@burtonini.com, openembedded-core@lists.openembedded.org
References: <20220329130741.2430737-1-ross.burton@arm.com>
From: Jeroen Hofstee <jhofstee@victronenergy.com>
In-Reply-To: <20220329130741.2430737-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR07CA0057.eurprd07.prod.outlook.com
 (2603:10a6:207:4::15) To AM5PR0701MB2979.eurprd07.prod.outlook.com
 (2603:10a6:203:48::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14d9a72d-3930-4d1a-0b49-08da17372cb9
X-MS-TrafficTypeDiagnostic: VI1PR07MB4062:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR07MB40623BA19918469E16EFF80AC0E49@VI1PR07MB4062.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Uya4koGfEP9GXxqjOoHmpljtJl9cOpYNni5CE2M8U43l5j2qSLsYFXLruBl8b5XCr2Ro5VtUUU6nc9vQt69wEEQQCBuHkKcQXhzeL5ouQfV9OLYsQ7WML3mfXtSYHO+CuwQkrdkYZMDdtHZWzcGGkeO2+8WRGFs6QFJUydJny8WylcXWqBhqm4EgkhArDoHNuC4GMrpqlYHCyrN5B5LkHE7eb3u29I+mMSsKXwlSAk7j01NUe1Z04ZI0C+EYbB2L6SJK0tyI7EhJfNAMHltCohZThjLg0zSIFLRrZixuYkK1kDst/JWkk/ywi3Kmp7O/RPMJHb60smbVh+iUNY3p2c7D5vjv4h1vlzMckgg+X8Aors6jhSUTQ/kK9nIrXoht/ClCQMAOg7pP4C5Rn/q68ziTmaZ5WE3TW8GQUfy7SJzH9XDRwPYOq6VMeEEocxux9eMt3vYIXcgT88ig/yktKlB8OtM8UQMSf0xhu3StJJCjzDKed6JUffDVZMv9CuJeMEkmD5ZlpTNsln/JdcRwI/0bqynYpDItLaejadd+miz5CgjqUetUzokNiqPgDpT9Tt72w1I/+V20RJTCFkXwe35QeR9B3tpWGdIH4IM4/bxyPuS4FK6tlI/pmS5DYRxhliXB0s+QRWXCLVLMr1/jPNtMWz406m/S2RPX6NPRPlpIVigBs3F65mb/5xWFAzPK7oRom5lHAZopwpM/szoN/M1ewtFTJy7oz9uiGFEqhqSrJl21+YVXlxphopG35FcaDLpXHuczQqV7/T4zYJ6GDlWOsxzDsDm/xIrgBbu9ofToOUELRe0JnvvCK/tRYfZZFODDZXuDTE4kgzBWcE5j+qcsT4cqQTWgO1JTfA14HMA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0701MB2979.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(66946007)(966005)(31686004)(8936002)(508600001)(31696002)(6486002)(4744005)(36756003)(5660300002)(86362001)(53546011)(6512007)(2906002)(6506007)(38100700002)(66476007)(66556008)(186003)(2616005)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T3F3NkhhK3h6cHkvSnJiL0ltRVN6MFVtdStPQmpqSG5oL1gwdXdvTmk1SlI4?=
 =?utf-8?B?dUpCb0dub04wUzZvVElkUXlnU1RkU21ZNWdDdm9Rcjljb0xWbC9WSU9zSGpG?=
 =?utf-8?B?RXVLTzd1NndMOERBRGpkQzA5MFptcEQreE1FRFRXdjhEQkdwQk0rRS9hREgw?=
 =?utf-8?B?bzBzRFpreDJLZ3QwcDdmeUNpSWFUYTNnZkdpNUhyNGg4WC9lT2dQcE10SzJr?=
 =?utf-8?B?Z0NXWjJZMzNJcWhqa3ljbjJhcVM2SVg3d1NmSjREbDlFZk1TK1dLMVRsdjdz?=
 =?utf-8?B?a0dYbkJPYjNhaTc0MEwxWXNVclp0UnlKWllOckdkZ2FBVi9kbVhOLytOSFNl?=
 =?utf-8?B?VTM1RHo4eERBVTZKcG5teW9GTzNGWjh5M1BIdjM1VENVYnlOYzlmOGZGcTlG?=
 =?utf-8?B?ODFiQzNjZUlxVjQ0NFZBd1IwNlRZTHdiOUdnaVVzeE9GNU1jc0RiY0orNGJZ?=
 =?utf-8?B?bUxJYnF0SFRiN3JwZzhReE15elFpNlRmbW1xVklPNThiZEdnZURtYWNDZVR2?=
 =?utf-8?B?bEF4aENhYUZ4cWVMWlBpalhZK2JKVDlvQXJ5TU5sZStUakF3NFhBcTcvZ0RI?=
 =?utf-8?B?blhyUGRyeGg1Mm1nTjNsTkloTHdyTFRGaDFkOFk3MUxacHJoeTU5T0JWSGxF?=
 =?utf-8?B?RjJsaG8vY2NDaXJnRjVWL0Zta3BwazZwdWlyU2ZpbHhPaXZhOGV4UkEzUEF6?=
 =?utf-8?B?Z05uczgxL1N2citnT1ZOOVNHeEVPN3FjVEJuSjFwQmFLbzhucE1WQWJKUXN0?=
 =?utf-8?B?ODE3dnd2RmY3dXJvdWlEekVOWm92R2I0WGx6enN2V3ZOVHppZDgwZVhwU1R6?=
 =?utf-8?B?RmZLR01qK3JjTU41Q2VwcmtYbmx1c1Yyc1prRUY4QVE1MC9RY2VQSWMxNU10?=
 =?utf-8?B?Mmw3Z3o1bWpiU0xHdDV1bjhuWmN3WlJhTG9ZTllpVzNPUWVZb05qQjB4OGVC?=
 =?utf-8?B?NUlCL0x0UE9Lc21CZHdHZnpiN3Ywby82MEoxY3QrVGF5QXFReFRhR090QXho?=
 =?utf-8?B?ZkxoajFORzVPMllzeTg1cHpieThCY2JCUDlxc2kyeE0rSjA0WW1HbC9VYXFn?=
 =?utf-8?B?OVMrRkFiNG9NWWFoOWl5ZFh4UmVLTXN4Z3l3SzhuQXc3NkpsWVdLTm9GaytZ?=
 =?utf-8?B?djBDUndJTlZvcTNkcytlZ2JVUmV2NXhoYi91K055Rk41RXM2T3ZXYlh6Mi9L?=
 =?utf-8?B?Q09yeHliVnpKNlc0ZkpKc04yYURxZXk5QzBTR1VQTURYcE44djU2MGVHWWIz?=
 =?utf-8?B?elhXKzYzTEJQTlJQWnI5ZXFkUVRmeWVMbFNxaGwvcXJnamw2dVNTcy8xcFU5?=
 =?utf-8?B?S1N1Yzd0VVhHZ1Ruc0RPWk1RZVloWHdQOVh5Q3NiN2lHaGM3Z2J4ek9iVzZH?=
 =?utf-8?B?K0JiVkRRcE82bythVUt3WDFSRS9qUGIvSkRFb0tHSzNRTHB6ZnFsRDdMWXVF?=
 =?utf-8?B?QVJTdlcrcllzSWdQdUZlRE1zTzlCNzRZbDlZYU9wUjlEeGRwVURuQ1BWdWd5?=
 =?utf-8?B?Q3MxU0xhcTgzRDBURDdCaWFwZnNveTlyc2xLS0ZRSUZhVFRMclpYOHlEcUdl?=
 =?utf-8?B?aDdybHhlT3Q4dDhWWVlTdmxDVVkrZFA5ZXI5WVR6SWFSYnJHWDBSUUxITm1s?=
 =?utf-8?B?TkQrNVhORXBQWXVmZ0xjdUxKVVZYK3R6bm8xMDkvbkU2dkR2cHRnNmh0NHJn?=
 =?utf-8?B?WkQydVpmNDdBb1FDK3RnMXFVcHRRUWh3Ymx1L0RpR20rbUtuUCtYZ1pHZ2hM?=
 =?utf-8?B?L0o3aFdna0Q1QjNyMmdCd3NlUGxqVVdsSWpyblc4b1FBdjY4a0RwTWpGUHMx?=
 =?utf-8?B?NUd2WDYzaGlJaUptVnJsN0VNMHBiQ2VvU3VyR05SVDZZMWhSeXhwQWVsZWZx?=
 =?utf-8?B?N2FsNm8wZDJwRFVQczE1T1JEazBRd2M0TjBBemtTOVZWSVJKR0syWm9UYk8y?=
 =?utf-8?B?TStpQ0JDY0VIbEg1TlRBck9jcFFNcm1ySTVIWHZVNW00SUJkRS9aQUlaZGZj?=
 =?utf-8?B?ODd1MlRvOTlOeTBJNjdhbEpkU05HS0RlWkcwc1hvdmFrc2NtTWxlR0xKTit3?=
 =?utf-8?B?dVFwU1NQV2JLNXl1RlJ4anNIb1pLQ2VhZjFsekNJMCtmckdLU25rd2NDTlpC?=
 =?utf-8?B?eGM3UlpESzR3YmNQWW1vVjkvZWJleWVLb0NZY1RMeWkxOEdrUnBTZGkzQng0?=
 =?utf-8?B?bTNMMC95RUt4TUFFSDhRTG44bkROelhCNDl3aXhzaWsxbDA2OENoV1NycWZo?=
 =?utf-8?B?aXhLR2FEZFllZVRGb0RSM3ZnemtvVGJiaVVqRGE0K2VybDEwbzM1MTBKSWNw?=
 =?utf-8?B?cFJ2TXBZcTFZMnovYVcrS1FLWXF4OWpxM2dCSEF5aWkvc0dpdEdSV0VPY3Ex?=
 =?utf-8?Q?sQ2Ecr/cqvfrmc1RSkKAw+tKSYc15aaoswBjzmUeg8zai?=
X-MS-Exchange-AntiSpam-MessageData-1: Nm9HxJSftA13uUJgcUcoo3zetwako5ydJx4=
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 14d9a72d-3930-4d1a-0b49-08da17372cb9
X-MS-Exchange-CrossTenant-AuthSource: 
 AM5PR0701MB2979.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 19:04:57.0436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 U6LZM8TNfYg0vMAYpBK3TyIbFP+Vq6cMS3WYdlIUYUIPwMsn3AffaYftj/xaaC/u6VIIxRQRnRsTZdBfcRf5ZkZpsFkudYN4OZUBIwxre8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB4062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 19:49:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164052

Hello Ross,

On 3/29/22 15:07, Ross Burton via lists.openembedded.org wrote:
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   .../zlib/zlib/CVE-2018-25032.patch            | 347 ++++++++++++++++++
>   meta/recipes-core/zlib/zlib_1.2.11.bb         |   1 +
>   2 files changed, 348 insertions(+)
>   create mode 100644 meta/recipes-core/zlib/zlib/CVE-2018-25032.patch
>
> diff --git a/meta/recipes-core/zlib/zlib/CVE-2018-25032.patch b/meta/recipes-core/zlib/zlib/CVE-2018-25032.patch
> new file mode 100644
> index 00000000000..5cb61836419
> --- /dev/null
> +++ b/meta/recipes-core/zlib/zlib/CVE-2018-25032.patch
> @@ -0,0 +1,347 @@
> +CVE: CVE-2018-25032
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
>
It seems there _might_ be another patch needed.

https://github.com/madler/zlib/issues/605
https://github.com/madler/zlib/commit/4346a16853e19b45787ce933666026903fb8f3f8.patch

I can't judge that though :(

Regards,

Jereon


