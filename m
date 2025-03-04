Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E766C021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 13:54:35 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.91])
 by mx.groups.io with SMTP id smtpd.web11.20925.1741092464317382358
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 04:47:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hotmail.com header.s=selector1 header.b=tdIjEGpo;
 spf=pass (domain: hotmail.com, ip: 40.92.89.91, mailfrom: johanneskauffmann@hotmail.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FzDGcOD61ETcYbfhjzChGta0QZUtD6e2E3INYqjeGseRFWXWD6eqa+8LTOVyH2VVxqtqUM8SBkA1X6wr6u8VHFm03zJxqATBlWijwo7obOB+xO4DmdqT2vHIDPLjwWee+bSLPC9t50x1TcgBlnVgtDmil/CdhH0FEdKWUAiYBEbqDiZR3A7JZNI3SsnGmCGZj4DoBtFDkWDVl3/rHQq9o1HTmtIRHW8XqJmWFSEqZQUCEBZmzqwTX4H0L6ZcbUcpu1RZT5+lQNqNrL/Lm99C72nNqTNVJ2NRxVSMCKrniAJQQ9XpMOfMmtcGr6siWC+UGbo/BEi0utEwudbhWD1Idw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9R7d5cKC9IK+G0+4DzYLT/96uKWqjn6GnozjWfl66k=;
 b=YWqj4U+F4YQDrb6sJNBImb1lPl6OIH0/+xX/mhuNjBtOkY/6m3WoQFXIcJu952a0t1+8wugRw+MDANVTqgyYjBBuE/jKdcXSd92W8Kpbg8A16kvRwhvIQHxmZBxGVLsX0UIwuDXa+9vTZlEWoxVPEzbutNegokSkFw295e9P8X1/rTkz01amLK24fWejG5yrCN/bEMV8UU/VSV6f0LCGrwyGf9JcA8uG/MVMKeDtR0HfCwAN5tdXj8tVE0Uvbdn1/WcWiyBfnNqP1unzzUBmuVIJtn3hS5wVLcZJs6VbrhQCs110vxgcLAKmbbcSi+TgKFRUvtQi/Sn3B6J0AM+5bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9R7d5cKC9IK+G0+4DzYLT/96uKWqjn6GnozjWfl66k=;
 b=tdIjEGpojwwjNn6KBHlmREKCJjpCigTSubTn80GHqr6xsMXv0sIvjlMDtzxYVXCnVpM8GeYjX5d5wjbzCp4IGfzKQHb5W4IV5dajULPbjbIWrMccMSvO7LdAijVA5C/TscO1jY5guKvPQ687M8TpzSvnsW7qvUECUxYNN4nWIAZ9fZdsQPnb/DCYgv1J5mtGvXfoOpQ9G0V9eGxIX35MttFkOPcfAnw/I83KF5b41EDEArkOsGQ7hNL7rH3kxxoO2cuF3BE6Dm2wFsxVyce+wwHXzA8an+bEaEFkvOUfLOE0sBmWtKSw5O4j3kRCprmUOBGozX7qvU/mcZc+FpKCCw==
Received: from PAWPR02MB9054.eurprd02.prod.outlook.com (2603:10a6:102:337::21)
 by DU4PR02MB11052.eurprd02.prod.outlook.com (2603:10a6:10:587::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 12:47:41 +0000
Received: from PAWPR02MB9054.eurprd02.prod.outlook.com
 ([fe80::fc9d:63d6:522a:5540]) by PAWPR02MB9054.eurprd02.prod.outlook.com
 ([fe80::fc9d:63d6:522a:5540%4]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 12:47:40 +0000
Message-ID: 
 <PAWPR02MB90548864E6E3053735FA99A0A6C82@PAWPR02MB9054.eurprd02.prod.outlook.com>
Date: Tue, 4 Mar 2025 13:47:40 +0100
User-Agent: Mozilla Thunderbird
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mesa: Fix missing GLES3 headers in SDK sysroot
From: "Johannes Kauffmann" <johanneskauffmann@hotmail.com>
X-ClientProxiedBy: AM0PR02CA0118.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::15) To PAWPR02MB9054.eurprd02.prod.outlook.com
 (2603:10a6:102:337::21)
X-Microsoft-Original-Message-ID: 
 <8c34910e-4969-4b1f-804d-2b6bc2177f95@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAWPR02MB9054:EE_|DU4PR02MB11052:EE_
X-MS-Office365-Filtering-Correlation-Id: 66114c4d-1e4d-4573-243d-08dd5b1abff7
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|5072599009|5062599005|15080799006|8060799006|7092599003|6090799003|461199028|19110799003|12071999003|21061999003|41001999003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OVJWTERXayt2dGQ2NGEvZlppclJuRWdCeS9CbUtrVFBkK0VhUmtrMXBVeFRR?=
 =?utf-8?B?bE5uTElld2pwUUYvVjB5eUJWRlZVT2JsQlkxUkNQYnhSdENKMmcxUnZuS0h6?=
 =?utf-8?B?UkxnZ0UvSFl2UzdTUW1qbURMcDF3d1N1R3J5Rkh3Q0NHOTIwbWFpYnV1S3gy?=
 =?utf-8?B?TkJBbzFZOXBwWGFUQXZOQ0tUems2MDJ4bng5RWdIdHBZU1dvdlVrT3dYalVy?=
 =?utf-8?B?UkIvSHA5dnAwVjFjdS8xWmhhK1RSRHpwR1JKem96eDZPbTdjWTN2RkNUNU5w?=
 =?utf-8?B?am0raTJQQ01rTXZnbjJtdE5EU1EwNnk5dmRTTWlsZ1dxSkEydDdYVTlqZkdO?=
 =?utf-8?B?R2krbHNaZjNERUcwbE90dnZyWmN4SmJESTluVC83QlNhWnd3aDY5Q3lSRVZ5?=
 =?utf-8?B?RUxVVEZDUzNvcllNT2llNU9QU2FhUHFobzVBQmtRVTVyMll4NVBaVTlla3Jl?=
 =?utf-8?B?bEZraEFjVXI4UGZNd3ZmamhEdDRtY21vZEQwMGlqd2VOSml4QnR2YXEzVkRz?=
 =?utf-8?B?YSsvcWc5bW5lbGJIaHUwTUNQZTFZVStRUCtzT21yUHl1MzcvbGNDR2tjWFRj?=
 =?utf-8?B?di9XTmJzaTBjTlBkMmNnQmQvWmxaYW8xUExwaWtwZFFPNVk1RlR0ZHh0N0Js?=
 =?utf-8?B?SVY0bk9GNk5rcWZGd3prZHlKOE9wc2dQL0JjQW5rWjdMNTlsUmc4WDZPQ0dE?=
 =?utf-8?B?MXNWN3BNMGRLVnlVbDRpMTUrTXZISXF4SVlPL1hzUTlFNEdaZG1HaW9jMEln?=
 =?utf-8?B?VE8zenFUZE1ybXQrcS9MTFkrUnJUMWVFbkhGTzJST0ZkSzM5ZEsrdks1ZTc3?=
 =?utf-8?B?OVJlUW9MWFdkaHFPNWlJbjV2ZTZIQmFrTGszQjQzTzBtdWF2dDJWOWk4bnhn?=
 =?utf-8?B?Mm9RU21UK2RmTWhwK2hNZkZYeU9lRDFyL0FWVnBnNzNmc05kNTdSTlhRNkZr?=
 =?utf-8?B?aDlieHJKM3QxNXJGQ0hOcElsNTNPdi9TYU5sdDVEcjNYeXpNa2FCazZ6cWZD?=
 =?utf-8?B?QUlRc3ExSUVnNHpKU0ZmSUlDWW1DNUZHQ0xGK2p5eEwybGlrSllFdzdVTk4x?=
 =?utf-8?B?VDExQ2R2RGVwbFZYcm5vd21nUGxQSU5yajBFd3dmSVF3UDBYbTZoeml4bnlR?=
 =?utf-8?B?ZTF6SkVOcUs0QUUvazd5UXh2ZnlrUzNGaU5GVi96clFpYlowL0xvMWNSODRE?=
 =?utf-8?B?cTNocVI5TElaUzlVZE5FaUc2TS9hVGY4dmFhaUdxWVpqa0pEdUxVbXkyU3A1?=
 =?utf-8?B?Qk9hcE41emp5WDNGWWFHR0RnVXJHSERUMTNyYnp3cmFaOWpaWlMrako5RFo5?=
 =?utf-8?B?aFR4QTByUzNrWVVtRit6YmJVSUFwcnd4R1g1OXFwTzhPbGdQam4zSHJ1eThp?=
 =?utf-8?B?VVVnQXFQN0hQR3V4STIxUXNNZGdTYnF5SXNSUmFiN2R4N21CWDdTMnZCSHFm?=
 =?utf-8?B?TW5ZUHNkYlZoeG05emp6TDZnME5yTk96cXF2VjZnYmhCYkg1bVpQTmprUE1E?=
 =?utf-8?B?SXZRNWZhSVRhNm1HWXdWTjFzczFnMHV4SmtLRDBsdUcvRVZ4Q3FzSmtvSnph?=
 =?utf-8?B?dFVia0hJOEpaYXFqTEI5cTlRcXJJRlFuL1FuVmgxM2U4WTRNTUZaR3gzL2Vv?=
 =?utf-8?Q?XxApEdekCWlsnNNfo7II0HBd7tXsHBMhQg8v7VWArXOo=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VzlVTjRndlhabm8yME11amJsNzdtelBLOHhXMzY0ZlZGT1hhTDNBSDUrWTFr?=
 =?utf-8?B?eVJtUmIzdG04U2E1R0p6anNEeU1ueCt3SjFwWkM3WmtCcGxjcEYrditvNGND?=
 =?utf-8?B?VXNaM1pSaVZCTWxLamRoZ0QyN3JWL3FZOHJrRCtSeUp5bGNQVjUwSng1L2Za?=
 =?utf-8?B?bWYyZ1U2Q3NDU1daTnFKZkJiNzRTNWpHT3ZMb2o4eGg3cXpMNEYrNkVFUW5r?=
 =?utf-8?B?am1ucUZNRS82SkVXcUtMb3JXcFJFNUk3c0VtZFJZTFI5ZURIcTNiZ3NtZ09k?=
 =?utf-8?B?Zk9SYlExV0k3TmpBakJreGJSZ0RwNloyeFE5MzhWam40azZ2aHRtWlZMb1pj?=
 =?utf-8?B?N2JCd3MybEdHL2JRY3h6cm9BS2doMDBIdWljbXRHam9LeitEb3JQTTFlNmlh?=
 =?utf-8?B?d1krVFVNa3JBdTZ0Yjk2UThoRitGc2NwSFM4dDNDOTkxcyt6eUZQQ3pYa0tU?=
 =?utf-8?B?MS9MYXpXc0VIZ3RXUVp4dDZtVlNwdnp3c0ZhUytjNEZJN2k5SEZrUHUzYmw1?=
 =?utf-8?B?c1JZSnJudGN1WUM2RzNRM3N5cDRhNmh2ei9VQ1NRaWtJWUZ1RlNLajc2YTQ4?=
 =?utf-8?B?czBMM2VvUFFDOTNXbllJdU5jWFVtcWVIc0NBcFNoR0ovMFd4d2RCM0dqNkUy?=
 =?utf-8?B?c1dZZUFPV2NDWlVEZEtzWnpnOUFKcWk3VWdJQmszamNlcXdsMmRlZ3hOUGY2?=
 =?utf-8?B?bUVLOEJjb2dUUk1wSE5lTVZxQ0JkNGtsR3VZaWhkQ3ZBR1AxTHNiayswekd1?=
 =?utf-8?B?cFF1TnF0Y2xBdU1DcEJEZWJMY2l4VjROZkd5Q2w3L1ZvV3EvTGw0VTFpRks5?=
 =?utf-8?B?SmI1Y09mREpnTnBtMWxCTzViUjJLWEdrZnNkUGdEaHRGNVBkaUJhYUtWMDJU?=
 =?utf-8?B?VDBIeWtKTWREcWcvQlhWVnh1NjFJUC9UTkJxRnJHMFN2cmxndUpEeHBKajlo?=
 =?utf-8?B?OEl3OXdIYzQ4SThQS21rTnJzYmdKeEFxMWw1cXNhTFFTZEJzVXlEWXJYeDRX?=
 =?utf-8?B?QzY4RHhHOUZtb2p1SDBYcVljeGVFckdETlhaMHdQR1dwWktNNEFIZUN4bkJK?=
 =?utf-8?B?TDRCSEdOQXhHaUxTaDBHMHZiT1FjblVNdDRaN29hZHJ3Z1FtaUR4cStjWUZ6?=
 =?utf-8?B?aFUwc0xjRDNNNGc2UktjMld3N3Y4SEtDeVJ3S0hDWmNGOW5KODErK2F0OHNP?=
 =?utf-8?B?eUp6U3dHT0dvcWsvdGVRZkRqUWtzSlgrVUphcXlzTmZWNTFHK0kyMkRpUWUz?=
 =?utf-8?B?dEZ4TXVjQUI1U2U2WHBYNDNtL0VadWw0QnFSTHB4dDlaeHU0VXFsVkZlL3A3?=
 =?utf-8?B?UnJleGQyUURUbzBnNmRpR2ZzbTFZMTl4V3BKMnp2ZUlmKzJaNFhxTkQ2NmNo?=
 =?utf-8?B?blBOeWJwcmpNSWtyVWgrUG9iYmpESXlYVUp4YkVWWERMdVkyQk1qOGxkR2ZE?=
 =?utf-8?B?cm5IZ2FyQS9McW80RDd2cENYSVJJV0hBaFRvTEhTOGdKVnRYYVZzdUlINzN2?=
 =?utf-8?B?UXc0WG5BRTJ4b09NaWJYSlhsYnY0SkpVVWg1UGh3M1Q1NG9aYS9odVdLWlJD?=
 =?utf-8?B?SENaMFJKVmVibGlnSlhGSFVmbHYxMHZlOHl1aGJCa2RBZWhiRXlYalRVaE5o?=
 =?utf-8?B?bnlMVW5FcGxUdC9SSXJNNWttbHhrRVZGM1dTV0ZrbDhQeG50WWx1WVFyS2Nt?=
 =?utf-8?B?OUNYeW5RaGcrVHFiMDNKQWFqZlllK2lVNWFrek96UFJxUmpCSHc2bXd3PT0=?=
X-OriginatorOrg: sct-15-20-7828-19-msonline-outlook-12d23.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 66114c4d-1e4d-4573-243d-08dd5b1abff7
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9054.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 12:47:40.8106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR02MB11052
Content-Language: nl-NL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 13:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212285


Building weston with core-image-weston SDK fails:
```
../libweston/renderer-gl/gl-shader-config-color-transformation.c:29:10: fatal error: GLES3/gl3.h: No such file or directory
   29 | #include <GLES3/gl3.h>
      |          ^~~~~~~~~~~~~
```

Both GLES2 and GLES3 implementations are contained in libGLESv2.so.2,
which is packaged in libgles2-mesa. However, the headers are split
between libgles2-mesa-dev and libgles3-mesa-dev, which is why the
GLES3 headers end up missing in the SDK sysroot.

Add a dependency so the GLES3 headers are properly associated with
the GLES3 implementation.

(From OE-Core rev: 7e1308ec413e69a8427ac5998431005d9e4b8033)

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/mesa/mesa.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index afac8014fe..3c85a3ac55 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -191,6 +191,11 @@ RDEPENDS:${PN}-dev = ""
 # development package of libgles3.
 RDEPENDS:libgles3-mesa-dev += "libgles2-mesa-dev"
 +# GLES2 and GLES3 implementations are packaged in a single library in libgles2-mesa.
+# Add a dependency so the GLES3 dev package is associated with its implementation.
+RDEPENDS:libgles2-mesa += "libgles3-mesa"
+ALLOW_EMPTY:libgles3-mesa = "1"
+
 RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc spirv-tools', '', d)}"
  PACKAGES =+ "libegl-mesa libegl-mesa-dev \
-- 
2.43.0


