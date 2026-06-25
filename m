Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555A1CDB47F
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 07:45:46 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6412.1782373539690132296
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 00:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=FmTudkgY;
 spf=pass (domain: est.tech, ip: 40.107.162.61, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqp9TwbqvFhCC1bf/HoZJrp638PvEiKGQc1EDuWQEyOlYpmv2zI4vMfeWOOpb6Jqgbh0xKQD4dY33eJ3GlY3/FK0+Cci0bkMmW7Zd7ihyzaLvm1msWvmBdsIGv+3Bu/5BHnxokuY6Oh/mURRYzSkeJ8UiMCkeWWnIVtIRj3hYXEDiuAnyKZOcsHRRZOy99EZlThX8lga0qkPaV1QnSPWe+njcT+BPyAUxeRdB/9/6mI5TcJo0dIAAvx84Z5wCQ0CvD+qkglEyJ7B3xpTkTbe46A1OS6zcgZW3Ls4VxHHzSEnK9DMqhkVbnpI8rJZ+IgZQPUoIV+hEpOKFMrN4jjmOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtN/Al/7oV3P8PZaBFTtY4jprIIRm50DdMZypWmCgMM=;
 b=ftE/P0/tctvJEtb8gloxcHmWJ5XLTVU0cWpNk8VSdPd7y7I0TXDNsmi7BHn77nyVQP9Z514tmCVG3mnHyQUiIf1rYf8tje1/4MVhyV3MjkkLLU0+2qxd6gSjAjNHCbsah7WTxQKyUfOwySlXM2u2mGWfs14UzoQJWqRHNIu00cL1/1m+xJcS/jE/VZp/GufJ15DjCnKttDnUgj/utHWs5xH146633/u+1FfonCDv+gb/vP+rUiGL39uOCG54ANHH9XVJiYz/uW3yFIdHiPK26EE8LTec02OeS2AUgt5jbEW3HSe/T6aXBbpa54sqnVoqCS54QWUP0Vg500aEL/1z1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtN/Al/7oV3P8PZaBFTtY4jprIIRm50DdMZypWmCgMM=;
 b=FmTudkgYJS2uA8+mJTf0A+GafuW/iMSvFtj7k5c4zuWPwNfxdvblFFZodxPekhOsNxbjcttr7LEd/Hw8+uWYsvYzZIxkbNKD/Qn9eUHVCyxAPKh3PA3IcAwymxngDuS7b4I7c8i7MDcpAucoKm4PLfw7NWWEgGtPi2DBa9GjEhKD7515LzJgnQX9SBTUol5stF8Y3+c+ngy2o+pu8PDxL6+kE3bcmx/odnQ0NLoKPUo/S/lbL/IsmbOPs7biCzCZLcltmQikdrjvmpLlQXrnunH01uh1iQ8B1ncdZrTouI3QlI/2iCrxmg1clJEOmywc3kKTNFSdtAw/KSdUEKk8LQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM7P189MB0775.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:11d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 07:45:34 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49%8]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 07:45:34 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>,
	Anders Heimer <anders.heimer@est.tech>
Subject: [wrynose][PATCH] cmake-native: prevent host libidn2 contamination
Date: Thu, 25 Jun 2026 09:45:26 +0200
Message-ID: <20260625074526.22875-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0015.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::11) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM7P189MB0775:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d98aa52-28c7-432f-c595-08ded28dbd81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	FbXpPsLwwzWdlY8BUQQ15s5WjL5E3Q4613p6pGPBKfGt0y5TeiiNEhwyusL9SDmHZNaFqXATZvDttpvcq2U+jqd7ZNB9KiuxjvYi4L430S6gNEdXdFQCuAalLBhq0qFXHGR8vTkq23TN4nv43DShW0ULbM6sh1IuEm1+fLDdDjY9BF6ELTLgT4befwwreGKZC9K3Tv9gbAYRGEUmfHefArYzrcWEzlMwOqcmIwLHY9oG0aCvq6JbUDgjqydyevQRw09v/aoapR6Ymq/VxC4WRL/Xod7fVoqdLulFa5uOfU0ssSY5oc48I/pzp6OfJauuaNLXnElCCIz3yy5HqYRRjyPbLzNXbl+ZpzEBB0qArpcLX9TVplFBI89YrHdGviyk6ty1wYEPtlQJ4XwK/gX0CZW4x59R2GmLP3CiJqtl/QD3ZRbQIN2eDkdUQMYvBi4Vg37AenDawsjWitjG1IOxHS26iRr6LAy2RPF99M3wrLaZwFkQ36ak0i6vLPWE1Px+t9fFLLUs8XLmaMnKi7H/kQYqxBKz0ea3bAPtnkF31+yFwMOFcHj+QfjBhB8f6r5Gx6l2cQrCAmuE+uQJpuEQEBt/0QxbEhhnByzqVwEVILLpAXaAJXLa2EES1Rw8X0QGCVMdzHj2ZO9Cz49XGs04rmZXKGd9bNed/O5VMFiHpqI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zkiZwLow0hMFK7UP9vvPsLErlVK3Q3miXLXzNGoSxKJYMT21FpdLiliYeLIF?=
 =?us-ascii?Q?FcU7bjT2/Wxuk9ZRgYoBMo4FaiD0LHypp4Kg1qCn8uOnn/9scUuycGSMQ0+n?=
 =?us-ascii?Q?D4vVrYaj8HL/BtcC1mPH12sSND2m1ws+Fx0PPj//MhSi9/l+5iE85nASuKAs?=
 =?us-ascii?Q?12HMyIUw0QbevIt4lysMk6+6VlrgCRqJi0uM6udfBsFsfTC5shXTJWM5ocoW?=
 =?us-ascii?Q?Mdj9iCXy2xqV/0HQsBDwOpAJpPawl1JsVvq+2VI4/KeNCZvzsKFhUphJkG0r?=
 =?us-ascii?Q?lVxtiFGl+VYNS6SWq4KDoXvvo/0L5BcfYw36MB3UEMV+52kyADGCblgaz9r3?=
 =?us-ascii?Q?+oGIAaYOKWkBh3cWaoZrt1Rh0YVCkPHD4A2gZtDbm3H1rJpuPtUcO8DXw19m?=
 =?us-ascii?Q?EutuLOPtzLVBtaegiU4+u7rAK9Iu6jdyuCEUJUyGbqKqwU3hvKa9ZO0wXFYH?=
 =?us-ascii?Q?YBcKrbwn5DpeOxj4UUxjGveynmURahakvwoycLmSvq/n7kmctWEhgwZY59x5?=
 =?us-ascii?Q?hqVK69cho+ziyYZhVPULflkku4ANudFrz1S0E3OmMN9Mk7z1MJ+ku3Ka6Bcl?=
 =?us-ascii?Q?igcx6jGjshD9aWjX8qeeGQLJqgn35uJeboESKh88qG0WvzDV70eRDLwVYVQG?=
 =?us-ascii?Q?Bpm634byRjtR3PCg7hGITa2OAY/bmdJF4t7UyCd0Y6XTzO7NS0d4WKP3jAdn?=
 =?us-ascii?Q?wEy46Tw08kW+tzEKhpVv0o2Ao2aoNqfX05o58rtmOdv62ob2l8e1IVo6IO9E?=
 =?us-ascii?Q?DLkpaB7mNhxQktANKeBR5kCKrYuaQ3rS/xN291M7OO7XGTEDNc731G3RngXQ?=
 =?us-ascii?Q?ZXQkrOvvJgRqwnoyVdxZFmcjQbVBZUhdLyWiz5T+UGIGnUyGbAOdICp+VvT8?=
 =?us-ascii?Q?6Dlw8/pVMdn8bRunhZrUaNX54j0cGTFJpziGqc8Yc0pQhhOBZG1gKhOorrBZ?=
 =?us-ascii?Q?3STDfn7A47FwkeTk25ns+QpXjEjINjT+Dj5Qyn2T+WKxoCPdZ0f+7jWSTqYj?=
 =?us-ascii?Q?V+c3FWYhlNF+7skdBRlEHE9diVeRUcqTau2k6l/w2K4ItJvZXeY+i3QeZ429?=
 =?us-ascii?Q?fCnjjSx39pW9LEZba2yKfp3GIQuEE4sLck2rYr7oWOBp5PW/B/oI+ppavrZJ?=
 =?us-ascii?Q?NJH/MIZdFkx0wZeAOwFg8J+N96loVLwZlbqmdgXyqiIeDDiifwBe5pZhvHuw?=
 =?us-ascii?Q?gNjOCAmCVhnFr+dfFtt/tslNCm8TDzK10epI2I95Zz6It1QmEtLslAqGNKVz?=
 =?us-ascii?Q?ozY2Iyb58OgcBk6gMExbadMdxQTrmGsvG36se8y0+Cqs8Lx4KZY0HAHlq6ib?=
 =?us-ascii?Q?M3NTUJF+DjF8ZXCxmz2hj3mg04rlaJC3TKWCIiuQg8jO/x7ESPpdqcJZnb3l?=
 =?us-ascii?Q?Aw+d/RNPQUYAUxtu+hvFuJvQLIszgT1AUcmC8K8aruyofDeLQ/zYRDS7Rac1?=
 =?us-ascii?Q?dKwEZT1CzwDH4j+buM28dQjdVerFzfaGYUYQAqwRCxvGb1UyVuy7DfMQ4SSa?=
 =?us-ascii?Q?Nv6yXK6g1bAGFxXZpR0H1HJK87jRmTg5qxgSXLn3a20OQcgcgEmRcwDipiWV?=
 =?us-ascii?Q?pNByDonr7rrfldUSTyNJhrYQft8kgccqLfggERfTLNVuokRl7fIShfdBcaEW?=
 =?us-ascii?Q?/yi9q/tUvF/02VwEbulV3ciu3qFqVxzjm//OsrbWWnYNlU91//drDRxv7jJy?=
 =?us-ascii?Q?JVA3njvZFE1UaBsQMW3dD3OzsjFwUToTRcOXZ2SbMFJ4Q1bxqUHKPsyhKtAF?=
 =?us-ascii?Q?d2AKiS8s5Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d98aa52-28c7-432f-c595-08ded28dbd81
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 07:45:34.6007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7OntAGADEnZKQPMmU143/1iszwocVQb2C3k7ukGdq0fKxqC2xSCADAsbge8PoCT9NX+III8j1rlXT3ci3P99UvrGpf3FLF8Y0JSinHRvfhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0775
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 07:45:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239547

The bundled cmcurl in CMake 4.3.x unconditionally enables USE_LIBIDN2
and calls find_package(Libidn2). On hosts with libidn2-devel installed
(common on RHEL/EL8), this detects the host library during configure
but the compile fails because the compiler is correctly restricted to
the native sysroot:

  fatal error: idn2.h: No such file or directory

This was introduced in the upgrade from CMake 3.28.x to 4.3.x, where
the bundled cmcurl added find_package(Libidn2) for IDN support.

cmake-native does not need IDN support in its internal curl usage.
Use CMAKE_DISABLE_FIND_PACKAGE_Libidn2 to prevent the host package
from being found without patching the source.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Reviewed-by: Anders Heimer <anders.heimer@est.tech>

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-devtools/cmake/cmake-native_4.3.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.3.1.bb b/meta/recip=
es-devtools/cmake/cmake-native_4.3.1.bb
index 9ab1f0ce73..a859cef151 100644
--- a/meta/recipes-devtools/cmake/cmake-native_4.3.1.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_4.3.1.bb
@@ -31,6 +31,7 @@ EXTRA_OECMAKE +=3D "\
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBRHASH=3D0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_EXPAT=3D0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_CURL=3D0 \
+    -DCMAKE_DISABLE_FIND_PACKAGE_Libidn2=3DON \
     -DENABLE_ACL=3D0 -DHAVE_ACL_LIBACL_H=3D0 \
     -DHAVE_SYS_ACL_H=3D0 \
 "
--=20
2.34.1


