Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A154FECAAA1
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 13:25:35 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.46])
 by mx.groups.io with SMTP id smtpd.web09.3956.1662470734052888044
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 06:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=VDeiFEFP;
 spf=pass (domain: kpit.com, ip: 40.107.239.46,
 mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPX7mb8vCDFOSrTpsJbuuo5PdKqOTQvDJYOQp0dorbmnFh2W0pF31KTKMYn8GnuDVbqMp5XV1gqquFDizO4qdPwLmGmlN9+N6PVDoPaea/e0FPCV79N0WWGuMEKoYQisW5/AkTR6WxlqJMxQiF7Kg6Cg40cnuYWRrPmzATA8mTDmpVWioj6JVAGKNR/FndhIi+y+4BVM+nByBN1oezEY978gqqH4+R5fYVSXrHwtIPXWAL/JmHr6sRhWLu/Kr0iQw+Ppgg92nFqiF/fDSizVB0wOVilPt5nPP97VHYXbuW7K4KV2XdQX6nnOgPMh3yTNiqgSNAsRWrUm2zK6t3Pp8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5W0x3oElmdOsBa0eZC0akwZ2ycJHQWhv3SWXUkdIQw=;
 b=c3nm0u0czkj9VulHOleIZJzmU8F4IvHalszjm826QvNx0+xysroGUn6d0u3E+sPQSwh5flSIQclWWIHYcUPjeShLfKAWdLFHkPICqrTY38khJQSw5mw9A7NI+3OYDcYYPXC2BORnY2eLxE9Ptdrqv5Qhlt2G8QE8AXP5RshzFr8wQeEPAI5BZvCABGXV6CQQaJ0OwxDAIOxO/3m4AxdY50s4J8zyksf5axSgC4UTT0zoiT/UJf+Klw1eOBPIfY7E83JbV7F0mf7fDdzm9Yg97z6jEvreVhhOtLWxrqZtGXc+k9y7gxV4xY/OBLpcLTLovyZmVlnZw2u9DglqiwQDSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5W0x3oElmdOsBa0eZC0akwZ2ycJHQWhv3SWXUkdIQw=;
 b=VDeiFEFPA9Pc7imEfpgO1LvwO3GUDjkzU2NevPtEjRjNDniNnuikYgdNcO2ZwXhgBbcXUvWQFuVin9BH7AGnxhUkDdfxYmIt07rEEtQgJF/cNoedJoj1Sj+iXrDcCM2/pc1mlyDdkgNWYhmmQW4XoCqybs4IH0hZUK6mzdFOHlw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from MA0PR01MB8613.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:9a::12)
 by MAZPR01MB6633.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:71::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 13:25:26 +0000
Received: from MA0PR01MB8613.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::61d5:a175:83f5:e2b]) by MA0PR01MB8613.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::61d5:a175:83f5:e2b%5]) with mapi id 15.20.5612.012; Tue, 6 Sep 2022
 13:25:25 +0000
From: Akash Hadke <akash.hadke@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com
Subject: [poky][master][kirkstone][PATCH] busybox: Use ISO 13400 timings in
 zcip
Date: Tue,  6 Sep 2022 15:24:55 +0200
Message-Id: <20220906132455.40077-1-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::20) To MA0PR01MB8613.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:9a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0PR01MB8613:EE_|MAZPR01MB6633:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d4f0e79-67a6-45dc-22f2-08da900b422e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uJkPn82I9xeVHRHqgOwmminNL2I+n6qhPw1GWTgDNaTZv7VC52mdvqGACWNJ6uYx3Uv+ZCOaqD142s+upn2WADwvnXbCVam0r4DJSFJ9tBuFe4M/BeyviPOHYIxfPvt+7hVL88ymZFeHH5jLqrbPcQLqcBlQvxE9qIluqQma5IZK7ZnYqnHskA4DrYtwE0ZEu5jirJ5ipVEx+aAbTuIoq0w9N7jGYFpqMvBqQPZz2y2OrFIwIlh88DhLFGvaFbId/ebUlaFM3+7snFQCkRyUiKM5uIBM0lNoXTj7EW4UJpX7lXVoGxIV9mockiqPyoguLkNSeMVKCKbGFmgVE/9ut+XTwpT3b8LrHHKbqxgvKkTLFXICLJJLgP9MhP/5l/9n0DdSMsrq9LtZdq2yq1W5byUxDtyLZGOLxRcj5wMd29XeeMVxQDh0hEBTV4aIrj2SRuvmLqNhmD176hWwv9JAZq7922eRQVObhP1s/H5nz3cIv2I3SO4axJiwl6ghZXCY2xMB9DbA24bjnPhVb8xRU/jorzyYdYEq9pg8iUYrrquyR6FdI8iRS0bM/2UEtdzz4d6R2rTIz7NmHxdCBiJaskIznLxMb7V2N3PSGOO7X9BsoNZvBiHcSa/WXlgYke8aw3pKhRgLB06fa787EHX7yFKbw4Kt47rpKPjkZbrVScH49Y4CwVvGrCFlfzN6YpLAsInGHREIH6wPDhMaNqafZcLuu1yitbRgdILkDI22jxWJyVuGYVF5F2wFvpdAhQovJYZ7Vt/Zn09X1Q2oiA45S66/qWar++b3dn+RzZgos5w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB8613.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(41300700001)(8936002)(2616005)(6512007)(2906002)(83380400001)(5660300002)(107886003)(44832011)(52116002)(6506007)(86362001)(1076003)(36756003)(6666004)(186003)(966005)(6486002)(26005)(478600001)(38100700002)(38350700002)(66946007)(6916009)(19627235002)(4326008)(8676002)(66476007)(66556008)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mrkze4P9HS20azEd8nwjGGAkYlyybhhKxYJdAyRIrV+nUlTOBOzogPQxXbiS?=
 =?us-ascii?Q?NvdWgIiWkikKryPjaVnKv5cnIgKMk5HD7Wyj1KAkHkW9QbvDmE6B7Ewzz3Qa?=
 =?us-ascii?Q?Vd+khl+LjgFVyb51QNm1+RKVdgxbuGrY7R75gjwKGN7YCp/Q5OA9v/ZO0aEE?=
 =?us-ascii?Q?j6XQ7tZgR9uK8gA5EOqYt16sV/u39crgqzZ5bO6Fy6YGzIBHjQsrrKWvQdNN?=
 =?us-ascii?Q?SIXBlHjN5BKZdaLFLrPb8wlrjIhyu8AKXsrqn63cMQccUOqX2fodu4As8ATc?=
 =?us-ascii?Q?6Nu8X/chE5MboDt5Ks2Xz9OK55TUnPH4hagTU5rfSc8hMx2dOLdq+6on6t9a?=
 =?us-ascii?Q?ind5mwrM79NacH+bx/U2g2Gh/ZNPWCZxYnSxdfaH8D087J2k/ufAkSmEhIpZ?=
 =?us-ascii?Q?E1mSQh5S3P3qbkFdWbjK0zFsv6YU4+NZ9HEEmFX+z7lNBVwm0Ehm01fxmUNj?=
 =?us-ascii?Q?a0ulEImgVul5ppyOwVRNYMLlaZNX+WEBwginhfjwVz8xXxUsg7rxk7Ey0yAT?=
 =?us-ascii?Q?ZKedV1fIFPXlTFJVHRq8RGlXLY2RXFBYN98VAkXF4YxnIWe0NIWBOEoDpho3?=
 =?us-ascii?Q?Ks85GCgpx2Pnkm2VFxETDp5GFogv3+Lkei2VgVd5MePqF3EYfL+Ng67L7Azb?=
 =?us-ascii?Q?AlNKD8HF/yYVMfmcOxku7PJwDKDA+jwKJ/pfAHPaAa5jlq4GblXMP8bCZy5t?=
 =?us-ascii?Q?QwaGv5/wqOUdH27x/p49X25O5/ERLAQAGfp83BOB/bTNbESDSpo1AMII9MoF?=
 =?us-ascii?Q?B8lcDjT2T7VL/rJK1RbQ01Gdh70HVBU+4EC2+Eo4gCuQg1msKCRT+artuSsb?=
 =?us-ascii?Q?bUACeX7OXTaR39M3f+fv0KerqcdOxl09veFomyy9PstoBe2ZYSZf8tZprxTI?=
 =?us-ascii?Q?hSRTOs1GwR+9kpPLlxeu2FzMzWk8fHLNacbxY+u+3Sc34ak/2f16HQT1euaV?=
 =?us-ascii?Q?TNlyywlbTBLOARSc7ZKdEeuZSPoh7oU2WxUAx58Ts0uyh+8xjlNdmyd6Mx3k?=
 =?us-ascii?Q?J3uuDduQFPo4P5lyW8vSwXdt8OUS5zfeUfOvqYhxynJk2bQNkY5eM3AwqBLw?=
 =?us-ascii?Q?rAeh+G6WbcvS4lcHKQUuqfNFMa3RsGzxa/crx/YucZHbCGTXSk4H2BJysrxf?=
 =?us-ascii?Q?Xa5HqQDwsxD5p/DzxhvFRcW5XPLSf2Ztm+hxwG31un8KyIfYQLiSuXAE3mIL?=
 =?us-ascii?Q?jgmmoYWGZyUHCn1SCdzOe7SSaKW5bwDWTK2gzavpyl6sLstPFkEWHvcaYSrQ?=
 =?us-ascii?Q?/A0N/SrMtYnCD+4qqhl7dMAU+gSsHJD4khLhjF6usictPRAg8FhZu7hPsfq4?=
 =?us-ascii?Q?C6cDupho1dm/cAuUGMhhkfrRATzPDQcvPAnV70YVwf37KwY9R4gYNUBEbcrt?=
 =?us-ascii?Q?bcbnn1xlL3E8N4yU0dzSxEiZ8+IIhE/4J2ENXVi7oh815Z6F0fZ2KTrMTp+O?=
 =?us-ascii?Q?ZD+Gs3lFe/qtXoC0J9J3Xe5XEgmeWlDIgqIHWT9CBCEMe6/CdSFvNqbkHv9M?=
 =?us-ascii?Q?O0xuiE4pwFl9oTVL03yuP+FCifzrtIo/QlaMsP9kb3weI4Iz+zMm7YEZ+JeX?=
 =?us-ascii?Q?tubskXHWZxxAQc4C6rsxGIX7du3vk3lJGPoKcXJQ?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7d4f0e79-67a6-45dc-22f2-08da900b422e
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB8613.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 13:25:25.7268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Ip23ou7b4kbENmCiPtqpXGjHopvNlFewpLNEQwuEmIzD1QMpUv83UZdpA0xw9rHXTi2rmKWTNB3jUaxUU3VLKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB6633
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Sep 2022 13:25:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170352

Add below patch to support DoIP/ISO 13400 timings busybox zcip

0001-zcip-add-support-for-DoIP-ISO-13400-timings.patch

DoIP requires fast IP assignment, faster than what RFC 3927 can
guarantee, and so it defines its' own AutoIP timing parameters

Add a compile-time option to use DoIP timing parameters instead of
default RFC 3927 parameters. This option is useful for use of zcip in
automotive use-cases. In pratice, it decreases AutoIP allocation time
from ~10s to ~2s, at the expense of less resilience to collisions

Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
---
 ...d-support-for-DoIP-ISO-13400-timings.patch | 188 ++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |   1 +
 2 files changed, 189 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-zcip-add-support-for-DoIP-ISO-13400-timings.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-zcip-add-support-for-DoIP-ISO-13400-timings.patch b/meta/recipes-core/busybox/busybox/0001-zcip-add-support-for-DoIP-ISO-13400-timings.patch
new file mode 100644
index 0000000000..960805af42
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-zcip-add-support-for-DoIP-ISO-13400-timings.patch
@@ -0,0 +1,188 @@
+From 22b3a1a60ce2d42b82381cdc88a01fc98aaf9954 Mon Sep 17 00:00:00 2001
+From: Akash Hadke <akash.hadke@kpit.com>
+Date: Mon, 5 Sep 2022 14:27:02 +0200
+Subject: [PATCH] zcip: add support for DoIP/ISO 13400 timings
+
+DoIP requires fast IP assignment, faster than what RFC 3927 can
+guarantee, and so it defines its' own AutoIP timing parameters
+
+Add a compile-time option to use DoIP timing parameters instead of
+default RFC 3927 parameters. This option is useful for use of zcip in
+automotive use-cases. In pratice, it decreases AutoIP allocation time
+from ~10s to ~2s, at the expense of less resilience to collisions
+
+Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2022-September/089858.html]
+
+Signed-off-by: Ricardo Leite <ricardo.leite at criticaltechworks.com>
+Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
+---
+ configs/TEST_nommu_defconfig    |  1 +
+ configs/TEST_noprintf_defconfig |  1 +
+ configs/TEST_rh9_defconfig      |  1 +
+ configs/android2_defconfig      |  1 +
+ configs/android_502_defconfig   |  1 +
+ configs/android_defconfig       |  1 +
+ configs/android_ndk_defconfig   |  1 +
+ configs/cygwin_defconfig        |  1 +
+ configs/freebsd_defconfig       |  1 +
+ networking/zcip.c               | 23 +++++++++++++++++++++++
+ 10 files changed, 32 insertions(+)
+
+diff --git a/configs/TEST_nommu_defconfig b/configs/TEST_nommu_defconfig
+index 415f5a802..3f8ca40d7 100644
+--- a/configs/TEST_nommu_defconfig
++++ b/configs/TEST_nommu_defconfig
+@@ -769,6 +769,7 @@ CONFIG_FEATURE_WGET_STATUSBAR=y
+ CONFIG_FEATURE_WGET_AUTHENTICATION=y
+ CONFIG_FEATURE_WGET_LONG_OPTIONS=y
+ CONFIG_ZCIP=y
++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set
+ CONFIG_TCPSVD=y
+ CONFIG_TUNCTL=y
+ CONFIG_FEATURE_TUNCTL_UG=y
+diff --git a/configs/TEST_noprintf_defconfig b/configs/TEST_noprintf_defconfig
+index 9b378fd55..5cfd5b3d7 100644
+--- a/configs/TEST_noprintf_defconfig
++++ b/configs/TEST_noprintf_defconfig
+@@ -781,6 +781,7 @@ CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS=""
+ # CONFIG_FEATURE_WGET_AUTHENTICATION is not set
+ # CONFIG_FEATURE_WGET_LONG_OPTIONS is not set
+ # CONFIG_ZCIP is not set
++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set
+ 
+ #
+ # Print Utilities
+diff --git a/configs/TEST_rh9_defconfig b/configs/TEST_rh9_defconfig
+index 4ac62b9da..1fe074e79 100644
+--- a/configs/TEST_rh9_defconfig
++++ b/configs/TEST_rh9_defconfig
+@@ -791,6 +791,7 @@ CONFIG_FEATURE_WGET_AUTHENTICATION=y
+ CONFIG_FEATURE_WGET_LONG_OPTIONS=y
+ CONFIG_FEATURE_WGET_TIMEOUT=y
+ CONFIG_ZCIP=y
++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set
+ 
+ #
+ # Print Utilities
+diff --git a/configs/android2_defconfig b/configs/android2_defconfig
+index d4b8f1616..eceabbc20 100644
+--- a/configs/android2_defconfig
++++ b/configs/android2_defconfig
+@@ -828,6 +828,7 @@ CONFIG_FEATURE_WGET_AUTHENTICATION=y
+ # CONFIG_FEATURE_WGET_LONG_OPTIONS is not set
+ CONFIG_FEATURE_WGET_TIMEOUT=y
+ # CONFIG_ZCIP is not set
++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set
+ 
+ #
+ # Print Utilities
+diff --git a/configs/android_502_defconfig b/configs/android_502_defconfig
+index 104e70f23..0ed60ae61 100644
+--- a/configs/android_502_defconfig
++++ b/configs/android_502_defconfig
+@@ -968,6 +968,7 @@ CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"
+ CONFIG_UDPSVD=y
+ CONFIG_VCONFIG=y
+ # CONFIG_ZCIP is not set
++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set
+ 
+ #
+ # Print Utilities
+diff --git a/configs/android_defconfig b/configs/android_defconfig
+index 92a66048a..c1d38328b 100644
+--- a/configs/android_defconfig
++++ b/configs/android_defconfig
+@@ -858,6 +858,7 @@ CONFIG_FEATURE_WGET_AUTHENTICATION=y
+ # CONFIG_FEATURE_WGET_LONG_OPTIONS is not set
+ CONFIG_FEATURE_WGET_TIMEOUT=y
+ # CONFIG_ZCIP is not set
++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set
+ 
+ #
+ # Print Utilities
+diff --git a/configs/android_ndk_defconfig b/configs/android_ndk_defconfig
+index 425593454..384304d46 100644
+--- a/configs/android_ndk_defconfig
++++ b/configs/android_ndk_defconfig
+@@ -884,6 +884,7 @@ CONFIG_FEATURE_WGET_AUTHENTICATION=y
+ # CONFIG_FEATURE_WGET_LONG_OPTIONS is not set
+ CONFIG_FEATURE_WGET_TIMEOUT=y
+ # CONFIG_ZCIP is not set
++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set
+ 
+ #
+ # Print Utilities
+diff --git a/configs/cygwin_defconfig b/configs/cygwin_defconfig
+index c09bc9281..30c90d587 100644
+--- a/configs/cygwin_defconfig
++++ b/configs/cygwin_defconfig
+@@ -831,6 +831,7 @@ CONFIG_FEATURE_WGET_AUTHENTICATION=y
+ CONFIG_FEATURE_WGET_LONG_OPTIONS=y
+ CONFIG_FEATURE_WGET_TIMEOUT=y
+ # CONFIG_ZCIP is not set
++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set
+ 
+ #
+ # Print Utilities
+diff --git a/configs/freebsd_defconfig b/configs/freebsd_defconfig
+index 6cbd54895..c09197be3 100644
+--- a/configs/freebsd_defconfig
++++ b/configs/freebsd_defconfig
+@@ -810,6 +810,7 @@ CONFIG_FEATURE_WGET_AUTHENTICATION=y
+ CONFIG_FEATURE_WGET_LONG_OPTIONS=y
+ CONFIG_FEATURE_WGET_TIMEOUT=y
+ # CONFIG_ZCIP is not set
++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set
+ 
+ #
+ # Print Utilities
+diff --git a/networking/zcip.c b/networking/zcip.c
+index 311dfbe4c..03c904d8a 100644
+--- a/networking/zcip.c
++++ b/networking/zcip.c
+@@ -24,6 +24,15 @@
+ //config:
+ //config:	See http://www.zeroconf.org for further details, and "zcip.script"
+ //config:	in the busybox examples.
++//config:
++//config:config ZCIP_USE_ISO_13400_TIMINGS
++//config:	bool "Use ISO 13400 (DoIP) timings"
++//config:	default y
++//config:	depends on ZCIP
++//config:	help
++//config:	Use timings from ISO 13400-2 (for DoIP) instead of RFC 3927,
++//config:	which dramatically speeds up AutoIP allocation time at the cost
++//config:	of less resilience to collisions.
+ 
+ //applet:IF_ZCIP(APPLET(zcip, BB_DIR_SBIN, BB_SUID_DROP))
+ 
+@@ -73,12 +82,26 @@ struct arp_packet {
+ enum {
+ 	/* 0-1 seconds before sending 1st probe */
+ 	PROBE_WAIT = 1,
++
++#if ENABLE_ZCIP_USE_ISO_13400_TIMINGS
++	/**
++	 * DoIP-specific timings, see ISO 13400-2, Section 9.1.2.2, Table 15
++	 */
++	/* 0-1 seconds between probes */
++	PROBE_MIN = 0,
++	PROBE_MAX = 1,
++	PROBE_NUM = 1,		/* total probes to send */
++	ANNOUNCE_INTERVAL = 1,  /* 1 seconds between announces */
++	ANNOUNCE_NUM = 1,	/* announces to send */
++#else
+ 	/* 1-2 seconds between probes */
+ 	PROBE_MIN = 1,
+ 	PROBE_MAX = 2,
+ 	PROBE_NUM = 3,		/* total probes to send */
+ 	ANNOUNCE_INTERVAL = 2,  /* 2 seconds between announces */
+ 	ANNOUNCE_NUM = 3,	/* announces to send */
++#endif
++
+ 	/* if probe/announce sees a conflict, multiply RANDOM(NUM_CONFLICT) by... */
+ 	CONFLICT_MULTIPLIER = 2,
+ 	/* if we monitor and see a conflict, how long is defend state? */
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-core/busybox/busybox_1.35.0.bb
index edf896485e..3b42fdb18d 100644
--- a/meta/recipes-core/busybox/busybox_1.35.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
@@ -50,6 +50,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch \
            file://0002-nslookup-sanitize-all-printed-strings-with-printable.patch \
            file://CVE-2022-30065.patch \
+           file://0001-zcip-add-support-for-DoIP-ISO-13400-timings.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 
-- 
2.17.1


