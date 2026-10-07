Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67207CA6009
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 05:58:35 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2034.1791352706928220788
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 22:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=KUPT+kdo;
 spf=pass (domain: est.tech, ip: 52.101.83.50, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/3yX/NcrcxcIIIf2lTfI+x8jXGWRjbJRVZVEE/xX36VFLwofYHmEQ4frCp5km0tRjk59UtUbpyaGjZo6yi6g1/DvJOrGUF6u6TEftlpEqppDL3rBQZirmOaMuRpZs5xEZ9Q5xf8L0ogJPoMvxhMNYJY2x7CfiKju0Wxlj/z/QmVUykGBC/NVqP3vNc/YmR/0xvuGvtfkNgiYDLfpuKPMqWKn6QAmOxJm60/4ZHIQENS056kUF0wMNr9x7mg0ldnJUYGp5MlpREphwazeTBn1mgCcRdbdl8GzEt9BlgOYNsKhzf/ur3UTHID12Ia2KJtVPzmqUba1hFZo33XmTV2Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nqpd/8m3AodM5orJd8P/xPxV5k02LB3hHY1bED7CCQA=;
 b=p5NRJGa2ETuwDH3eT7R+932Ow5OJFaAIm43OoxRaj22sUO+3s1bqIhKJZ7Hf0EkmC5cyB9xcU5Y7M3UnI9xqjpOaOS7QYeodYiXSbKpIVolitf9/Oy16R2MiJzH/XV9qQaVjgLCPO6fN8YmnttDA8GxLzYDYHqBoSATOKx3+I3HilFHXdyyDxZSczChEs4REdaeDQqzTfCXpnuA2pa3zAgZcd1EWAcUd3vHHoVXF5F0PSTyxjEa2Ramr8pzALAsARJ80lS8mDoZwQMfeOjAXiyFd9e7yhxImflVrxDqYYlzLcAKFKcLmWTid9JkUOuA9nAlYKwGFQY1Kw7QQ5YlzzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nqpd/8m3AodM5orJd8P/xPxV5k02LB3hHY1bED7CCQA=;
 b=KUPT+kdo0RkuwicK9WXaQCqOy6zC1yhpP/21K6PJlJRY16dX4RJac83PS1tL+64Pl9t07sGZoTpCzVS7mecmk4983dAh61KWbPj94QGDglLzNkQxTsmdgKRyRMlqh2jQa+NYziryTRT6PPLzYH5nhX37RYZtLOEiloB60TH3groa1vtAC5FUlFhFSUV3zY6rsuXvoOVDSYf5OzdOhN8fI6CfOLtbaJ4DSgAEx4Vo/ILkBKVobkSj62cQsw14TYO7vnaVkvgmo6IrwO8t0R1TrMHtIULHV4rp1frojW63wWnSGodEdm091ITFhsEqJqaGR8+fISXn8mraeYgJNtHy5A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM8P189MB1316.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:246::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Wed, 7 Oct
 2026 05:58:27 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 05:58:27 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] python3-hypothesis: upgrade 6.168.3 -> 6.168.5
Date: Wed,  7 Oct 2026 07:58:18 +0200
Message-ID: <20261007055820.59633-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261007055820.59633-1-jaipaul.cheernam@est.tech>
References: <20261007055820.59633-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0047.eurprd04.prod.outlook.com
 (2603:10a6:10:234::22) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM8P189MB1316:EE_
X-MS-Office365-Filtering-Correlation-Id: 03432d83-7101-43a2-0351-08df2438015c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|56012099006|11063799006|260925022911599003|260925021911599003|260925021311599003|18002099003|10067099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	fCtIiFyDxdS5uvIgJQ8svV2QmJWeBLLiuB9DMKC/WRgThWGoOjuZrf6Q5NbJ29Y3Pg9pNuEqteE9dWeosD67zulGUZwDBywTcWYIyGIvLX8uXWKL5/85hTQU8T2gJ1TbJZEJoAfXXfytspo3c0RR8WESpr6215+jd8WWVbYi5Gk7J8GuurycyaS+uSk/8cXnGv32ng9ApRUS7G53QPXHkjvDKHf0+O1sGLr+CcvzFT5GMVxzOs4PRJ9OB1E13SJeQ+F+UPl7q2yyQf9/l0XBcRQZrlD1ve3YexT21JRsZNVmdqMkjBEC1q6hcahLiYQdSN2aPGnM9SUwO2tIvzN09gyxfqECTGJDS9vJ9ncXkqw5hhoItPWisOXy7FsV3XtBZjZoCbssJUTZZ8Vosa4MJ9Jiqe63lSSwoUHTo7yUAyhVuTCXVK9EqJUcWbH9qZXZy6wBgkN6jitbmx+j4Q58TA+QRjM4H61ZiXGFIzQ9wibx3pKsRSzAiRYHQIBqxSAIG/h0a5F1LOxpp84o3GV+p0QCJPHrRtu+W51ItOgUk2pPW/IWtejYGzMT/BWz8mVJ0biez9R+7Qg8BMebYfmEQJ6jAtAE6zOejlD5OuLl9v4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(11063799006)(260925022911599003)(260925021911599003)(260925021311599003)(18002099003)(10067099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4amwE6BMBqdQuuQn6N+zI7SqlcgP4cVPUPrXqnwiABbQu25sGB3cZeISP/lw?=
 =?us-ascii?Q?1m7q+P3YNy11Arudvv3/7g39ewyg+nhfYmADxccc73+Zoh5fqPhfZbI8k5lN?=
 =?us-ascii?Q?PctLYoszRi0cmLHK7cgdXeQVwau5+jLHl6SFqBl4UP89VCYnrKwgDBr3/GnZ?=
 =?us-ascii?Q?+zTqW5hmitxNHy/6bYpeJzXEOjgnfGJb4f62GQVymYbwRmnfCOZp4EbCIEjy?=
 =?us-ascii?Q?eB6JyX30caiDLE539QWaml7ue3O21EZxOoHhcnO8nWhs7SJg9TBa6/hAD/cS?=
 =?us-ascii?Q?VMuayihXSxSqjuL0LkbGuf91tFU4wicjtryU9Bipw2QjdEdcN+wkK54HWLYN?=
 =?us-ascii?Q?dc34w2yGtzFCsGuOt6OF4/y3oRLTf9YrIDfN2fSIMUkbr5W8fy3h+sUnW8SC?=
 =?us-ascii?Q?LZAXH0rCG1yL62zYwuyXISgNftCLO+ed/KxT4WCPtRhmzBx8wDahrOtFgkb5?=
 =?us-ascii?Q?EIwGnRMP9pnjC9svSHZhiXyemKOiZCFw8ux5bsfvhrn7DkmQ3N3GtJQGRg9B?=
 =?us-ascii?Q?SWht3pAxuJTfYLn9GJ1Utm9q02n8JxjUPRwyML+vtCOK14MRsXnqsViCQOAy?=
 =?us-ascii?Q?xduBMGGXlui2gZWmQZemxeijIN18voY+2JJHzM575d4c/8NXdFofgglCPugl?=
 =?us-ascii?Q?BKR1wEL42Gancz4Y3qJz6Dt6dLF8KR2fGTSAoINkVluOjH0PdogfheIpBGNs?=
 =?us-ascii?Q?0U6ufjuM65ppTkmLpGhWElMKR4eBG4NYtEuwMTyy+WuVTdevLnQtyY3frJRW?=
 =?us-ascii?Q?GNOfffs/bK5k06/OykhrEoiQmoqaFRBDw+Lkc0axLzJ5bJ8zOuErG9Vj/pk4?=
 =?us-ascii?Q?bmxlRZhWUOiK3ihVkakwGC3hGLs20fQO5VGJrfU4ojrTpw3n7NR9+4MreamL?=
 =?us-ascii?Q?c7WNJ5v+TAbbqEW2JLVHXQCmI3ShwqSNj51Ws1fQ65verPg9H2GB+UkQyXra?=
 =?us-ascii?Q?GR8dkjWQ/TdwmBgLw6gESHW5NsdnIgsQZCKyeLAurRSIc6KMyo3Us7uNZfK6?=
 =?us-ascii?Q?JI3x7yV1dzbytLhSTBsH7T6SrzWTTNyqIK6gb92tNCyvoPoZnMFbmKujSwp2?=
 =?us-ascii?Q?xixLRlx2QRUMR/TwLYFF9sCw4LYg4hCLAobYVnoFcyq83o9twlXUWEM7Y56K?=
 =?us-ascii?Q?6u3eTe6cq4EejNRl0hkynJRnxMP/GJ2RMFep/DH1sQZuX0Bu+mZaN2IvpiKr?=
 =?us-ascii?Q?Z8Kj5ut299388mVIzDmXJHS53rRw/gW8lRGpuXPKrP9eNPExw3zzzcdssLCd?=
 =?us-ascii?Q?Q4PvWiSYN4cwMh0IpJQGZvDV0oHQbgLk8LlG+SLZa3ihXKbHytoGzgJHC1LV?=
 =?us-ascii?Q?Et8hLBmQ3VvggT2h++iJKVMBU28IAt8AZoEb4aMMQKefQM3Rgjnk8FEx7fBT?=
 =?us-ascii?Q?1PBiEoKHGlVQzwxF30GaM6PUdOPwCQ+tKJw8emlQRnT2dUa7cjtnDKeR+TlP?=
 =?us-ascii?Q?x51mMU5XayeIOfsqPQOi/w10xul0AOOpdCqMPD/oAyUhMX85v8YLRcYv64Sw?=
 =?us-ascii?Q?8t9PdfLQXuR1xZbbd1hRPcj8t7yNhRL/po/istzjrlKlkz7GO0Nqtz+1nTfN?=
 =?us-ascii?Q?JdifALGQJ3c50ZOU+zW1OUITFfWhilO8Zm9GeZrA26lVTG0e2GmWbLsluySr?=
 =?us-ascii?Q?+kHz2MlZWpb99n/VBuOm0V16d5x4u2AuX75j/9TiRuQx9zQ7JZHxwfd0DPEh?=
 =?us-ascii?Q?s2Vf9yGmJpP273Rzqh3dlWRJYF8P7Bs/zJSxIQDzTg/tqoq7NqW9yag5oz90?=
 =?us-ascii?Q?PMqcHCLP3qJc92r+pd/O0EtjMNh2sSs=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 03432d83-7101-43a2-0351-08df2438015c
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 05:58:27.0621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BWC+WFlVV3weR/dC0UbNc2KPUYSJHR7XjEWa9/Dn8MZkdMiy1kapkNj30wtFW2twT8K/LoTuOVyBhsLsVgzechk2iQLdzG8Yk0wFtHAWUQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P189MB1316
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 05:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247372

changelog: https://hypothesis.readthedocs.io/en/latest/changelog.html#v6-16=
8-5

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../python/python3-hypothesis-crates.inc      | 20 +++++++++----------
 ...168.3.bb =3D> python3-hypothesis_6.168.5.bb} |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.168.3.bb =3D> py=
thon3-hypothesis_6.168.5.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis-crates.inc b/m=
eta/recipes-devtools/python/python3-hypothesis-crates.inc
index 080e6ed7f4..57a1c2c29e 100644
--- a/meta/recipes-devtools/python/python3-hypothesis-crates.inc
+++ b/meta/recipes-devtools/python/python3-hypothesis-crates.inc
@@ -12,11 +12,11 @@ SRC_URI +=3D " \
     crate://crates.io/portable-atomic/1.13.1 \
     crate://crates.io/ppv-lite86/0.2.21 \
     crate://crates.io/proc-macro2/1.0.106 \
-    crate://crates.io/pyo3/0.29.2 \
-    crate://crates.io/pyo3-build-config/0.29.2 \
-    crate://crates.io/pyo3-ffi/0.29.2 \
-    crate://crates.io/pyo3-macros/0.29.2 \
-    crate://crates.io/pyo3-macros-backend/0.29.2 \
+    crate://crates.io/pyo3/0.29.3 \
+    crate://crates.io/pyo3-build-config/0.29.3 \
+    crate://crates.io/pyo3-ffi/0.29.3 \
+    crate://crates.io/pyo3-macros/0.29.3 \
+    crate://crates.io/pyo3-macros-backend/0.29.3 \
     crate://crates.io/quote/1.0.46 \
     crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/rand/0.9.4 \
@@ -41,11 +41,11 @@ SRC_URI[once_cell-1.21.4.sha256sum] =3D "9f7c3e4beb33f8=
5d45ae3e3a1792185706c8e16d0
 SRC_URI[portable-atomic-1.13.1.sha256sum] =3D "c33a9471896f1c69cecef8d20cb=
e2f7accd12527ce60845ff44c153bb2a21b49"
 SRC_URI[ppv-lite86-0.2.21.sha256sum] =3D "85eae3c4ed2f50dcfe72643da4befc30=
deadb458a9b590d720cde2f2b1e97da9"
 SRC_URI[proc-macro2-1.0.106.sha256sum] =3D "8fd00f0bb2e90d81d1044c2b32617f=
68fcb9fa3bb7640c23e9c748e53fb30934"
-SRC_URI[pyo3-0.29.2.sha256sum] =3D "4688ddedf473e32662b9b067670129a8afb8c1=
8e351482c70d62ba4a88171e8b"
-SRC_URI[pyo3-build-config-0.29.2.sha256sum] =3D "f41027e41b4bd03f6e60f9f41=
7fe24a6341a6bb744edd62b6f709f2a52ea30e9"
-SRC_URI[pyo3-ffi-0.29.2.sha256sum] =3D "e591a95526fead067432c3b3a33fc74770=
b87b1e04e73671090d9c2055a2b327"
-SRC_URI[pyo3-macros-0.29.2.sha256sum] =3D "73225868fc1cd84eef2c3c230ddb912=
73bf1de46aeb8a4248da76d32a0924a1c"
-SRC_URI[pyo3-macros-backend-0.29.2.sha256sum] =3D "571575aa3749fa6216757dd=
47d2a3e7ef360f329a40f0666a9fbd14889024952"
+SRC_URI[pyo3-0.29.3.sha256sum] =3D "700d18fa267b73b9b521fd7e13580e2f446916=
f176cacee1ab63fcc8191f1655"
+SRC_URI[pyo3-build-config-0.29.3.sha256sum] =3D "7b3fc0c4d08f6bb10e71fe39d=
fb9e2f59c6eb6854e22ec8092f50c69a4499adb"
+SRC_URI[pyo3-ffi-0.29.3.sha256sum] =3D "dfc0b8e19df29aad7086cf977bb0c2a2f1=
43e30567eb113e9cf72b62ca698330"
+SRC_URI[pyo3-macros-0.29.3.sha256sum] =3D "6100e8a4b5eba53afaa5ed078364851=
a0b2499c553a44c31026b929049b49dc6"
+SRC_URI[pyo3-macros-backend-0.29.3.sha256sum] =3D "6143877a16e82b5a727b712=
7ff4cd86858a24a28d745d72f43e6f227c7b1bdb3"
 SRC_URI[quote-1.0.46.sha256sum] =3D "dfbc457d0c7a0759a614551b11a6409e5951f=
6c7537be1f1b7682b9ae9230368"
 SRC_URI[r-efi-5.3.0.sha256sum] =3D "69cdb34c158ceb288df11e18b4bd39de994f66=
57d83847bdffdbd7f346754b0f"
 SRC_URI[rand-0.9.4.sha256sum] =3D "44c5af06bb1b7d3216d91932aed5265164bf384=
dc89cd6ba05cf59a35f5f76ea"
diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb b/m=
eta/recipes-devtools/python/python3-hypothesis_6.168.5.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb
index 980161d42c..93580094f0 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.168.5.bb
@@ -16,7 +16,7 @@ SRC_URI +=3D " \
     file://test_rle.py \
     "
=20
-SRC_URI[sha256sum] =3D "a43388f9067678fef6e13bdff325b6cfa6961a590498bb37f7=
ff31589c83bc75"
+SRC_URI[sha256sum] =3D "76b9226962fe11d40858253a967eda95bb65811365286317e0=
118f4ec8f808c7"
=20
 RDEPENDS:${PN} +=3D " \
     python3-attrs \

