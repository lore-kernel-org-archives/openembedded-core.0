Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B124AEB26FB
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 18:47:51 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.578.1770749267170421343
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 10:47:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=cVtknnzk;
 spf=pass (domain: est.tech, ip: 52.101.72.45, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQOBeVg2j0V0uNGM+sWl5iYusZpa0P+lHVTTV8zOkTSBbG8XMdxg9nSvuC3l55lSwcN1glecqN8qhoAnlzQ3HhyeOeqVEvAwWM8cNPXcNTebRwtU6XXDbQn8Buw4JyLBrrTBk2rUMa3w9q3bJTWjB98lxnPaEbyepA9VZVhnBB2BeeR+ordfJHDVgP+COwt26/AR9mG97/xaKWDx++xq3sHywNnrs03tXTbmlGmjRGbUyPhcyZGn+wrTf4kWHZ0m+MjC/ofgm4BoWchzM68iEmQBFfQreSYn0wUHnJ4zLnzD+d5c2YMy+80jMA6GrU5m1rE053REff81e6jYlSGcxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGdb9gZ2Gym6ZC4ZupVtgIJRDhpn3P2Lmkeb0+AfJck=;
 b=WRmKQpN2yN+2gGewCa16aL/PxfUBQG7ynEqpbZFipYQM9y0j+ib8/zTPaI97y/8j/S95r7PNYqu4OdjDfhlZ48Hx8Na9y/jq2R06kaYYRZLQvcFwdfr5bGk/j4iXLVug0u2zCQGqz/+VhfA4TnkWoBZUn75h5XQ62kRPhOZnuGp18KM+F9Oo4hZ9RldGJ2kEaXXe0s6yw3a+VGaXm2nr4djKBfUwZpsddcIF5KST1OHQV+0KuHGkJ/qLhUQaEZn87uhGKbc739lD+1iNQh7xeYJWpk1xTWP/L/KyzOgFcHnoShZhj6VHpqPKqh7pSZwNNIHadscJM7i9S4MFyde1Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGdb9gZ2Gym6ZC4ZupVtgIJRDhpn3P2Lmkeb0+AfJck=;
 b=cVtknnzkS6lcX2+8P+Jwu8QGYOvoSzjiPrQ8W2iiX/r1PWny7rBkroZ09fwG1IDb3+b8oePys5Pv0baGzCDQ1CUdK2X9cOiIB85+tebugCd1WrZFzms1Qg+dWk0ggRrI734dmDfpMIcJ8IJHCUrnmQd+COjMzadW7exZF6hoGwtZywvT3hZMBt6WsDdIKiSAEXaShm75uZG464DJCN7nTtlQwuKvqJLPzokNX1tKbKBuxpewg8xvAFaAYXtaX3S7uTZOgeMZpslEj2rfqU1KIlmtoY/QsAokx5zltlQLfpQgrVERDb35AIMtsYuJLe4Tsap/b8eZIk79WbuUOvtFHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by AS8P189MB1303.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2a7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 18:47:26 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 18:47:26 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v4] libconfig: add ptest support
Date: Tue, 10 Feb 2026 19:47:19 +0100
Message-ID: <20260210184719.7219-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128140635.43214-1-pratik.farkase@est.tech>
References: <20260128140635.43214-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0639.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::6) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|AS8P189MB1303:EE_
X-MS-Office365-Filtering-Correlation-Id: ee3faaff-a10f-4dad-75fe-08de68d4d5a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?c/FhAJcJMbstneHHST+IeZemBZuWHB//lavkyBy6TneGxrjAWtEIW9dD7EHw?=
 =?us-ascii?Q?S2srM1uYPPge1rB0HwRkjascyIIK8RMZwYKX9TPLOS1QD6lI1xI/h7hZ94gj?=
 =?us-ascii?Q?lCe2ehtqXCLtw2isG6X0m7YBSm1crFD7UY9HArjKysd+CbQqpIgWzDFjK59l?=
 =?us-ascii?Q?QoQdVvS3fo2uGXXPb0Da/7QxNxm3wmVg9O7hkzAchxU5jDaIGwmTJV+nnGZP?=
 =?us-ascii?Q?Ybrby6lAz3MeKbm1PK39E2+vZW7zaKuLoIdSL7MLE1oeEHCrtcJ0O67dSnfZ?=
 =?us-ascii?Q?IxfLm7Miot/YX10JFLZn/h6olTrcNKCqKh4UFLd6KiIzxSQufz2CKTicSG3z?=
 =?us-ascii?Q?o4rwNrrXVG8Vb8/BahfU01Ixgfit8YLMFMQZYIPX39jp7AA1sn15WlCPeyBg?=
 =?us-ascii?Q?HWDuv7fDAUAnuy78L+6o30fi8/MCCXDmAsfdNTq/i2+9z7cAhPv5QGZE560J?=
 =?us-ascii?Q?nQUu+P+kDDW4TRp4IoDGYYAo1VMmnZNbwJ+r/a1OM+9H638Zw+e5gYLObIR8?=
 =?us-ascii?Q?gQc73fgdWHqOW7BWGhu3nZqMr0fK23VnzmOI2DSckZB4gW5ThNs/CO+tEyG9?=
 =?us-ascii?Q?5J4xu5jnZZRs+Vj+JbN07VIgIkGc7zp6Dk058oGF8VP3LImLRZseHxhwgn5Q?=
 =?us-ascii?Q?XA/w/sZB1KRB+OR6Y1JtH6U7fXR70MsgoHNMCNNMDdfTUZMJEBEgCLSokLrj?=
 =?us-ascii?Q?agxdl7/m+MMqKcXacKkNAeRxzWbgskrWNStjTXhOaTyLJs/gj+fxg7g9HJDB?=
 =?us-ascii?Q?srL4nE/L6uaY1E4hRy22PRlOfVyPUQ4oNAgmtf2FEFpbE/xDMqMi4juH9QEx?=
 =?us-ascii?Q?ELjLcbR6S25lM+X4d+gyaNXvS2JnT7v+uRXt3764VcntAQvAydYJGFvw3pAy?=
 =?us-ascii?Q?bxg/jAXXyX48snV+LpVPODOWUzjTtVQSUc7qiPL/6lzVFaz14k3lHBUrIqOE?=
 =?us-ascii?Q?9pqo/OIyJjaxdrtRSnMj7+lwWg9M9pl2tC9o8+8YZUPxfa9hJY3tz+dpUvCx?=
 =?us-ascii?Q?uRn08mTGuIISYGYZZUI84NtPc3LciV7YBlN5/a3OjcBruScWC+jh7Mik9NYX?=
 =?us-ascii?Q?JBcL2TA8jDYDZg9XZjgaFFU/PUPCHZ+6B+Xeo52gylKL6V9Z0Nw0GEosthSG?=
 =?us-ascii?Q?uho/om9+cdw83+cdawaCngxyuVkK4NYaEXrYEG/G0zneondXlFVOcR6sQ0zq?=
 =?us-ascii?Q?gY6i2mD2NSxkTvKXPBD/WOjEIiFFG0UxkuwnIsK8VtTlZL5bqFiEqHhYNnoS?=
 =?us-ascii?Q?DjPUicLnTCz0i4VIhGwtOqO295SqIt15YFk9psBQaf3Xf2kw2NFC/61Pf+Oh?=
 =?us-ascii?Q?mLmAEA7Ogcf5zmf7wULf7937LaiukrsBtv76F0haWiulqhFTi+QbyaXP5EGz?=
 =?us-ascii?Q?vv1n6EmT3KCHeiwd4upjUmhk456f6xL19CVXwYOc2iau+9cA7AIPCfdGk5kT?=
 =?us-ascii?Q?n833dOhmICKfVoxLKSffBfnpmdHmPqahwLiSJC2j6dHs66toDMsuAmVAJHS7?=
 =?us-ascii?Q?CXmWWD/EeaWilBXreWhpOsZV83Wim0gFDDye/iE1qAocLgv53N+8Gh1vwMjM?=
 =?us-ascii?Q?T9dGjbF0l0E/10Bn6f0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eI3tofksrnXyJrK1G9zeiW9ulwF2pJXFnHXAXwMXtv7XoEshT1a9+2YM2Z39?=
 =?us-ascii?Q?cUzzTiuPhqx8bZSseyVYGDlZE/Jxb1POjlfOfqw+JK3hmRLYa+dQcCwMrfNc?=
 =?us-ascii?Q?rgeAXwJ972RdXVJqIzCF+Vc6Q4uw21rrZw0XlltDYKqwDrRXD34LHvQ/uJ8M?=
 =?us-ascii?Q?JANwLbmy9wFg0RRUVd0wunqBz46iMbYo8q2zq0x8FiGNXJTC38xdB1/Qd4U5?=
 =?us-ascii?Q?47hfF3h/KrRTKbdUmWqJiJBCbe28aiknbblswjmtUTeBblxCdNeYoKSwHB2s?=
 =?us-ascii?Q?PhFk6iM93ibzzgoQbO0jLgZVAGknsWjmHUj+v5Iqt8ciDdFwgBZ84cU/ntHF?=
 =?us-ascii?Q?+Ff5UDAa0oXbzneKbXyrO7tPxLxMPuixmEOLpFUAeY5QLzhtUZwRG6kpNC0A?=
 =?us-ascii?Q?ymvJ/Brw9vitGnZVR+OxVpuHlckrjYv3UbcH8fnlj6Hjm5tidswWFBN4dKio?=
 =?us-ascii?Q?R/N2Jc7/naYIXa5sjynm8GJdtb97cwPGh+xGNouxvPaG6abb+HvIYsU2n4mV?=
 =?us-ascii?Q?iayBRRGa3C5iXMDEstnU2fo2ggCJN0YEWZVSZGl4GtWJKLzW6PAhY7Wbwqdv?=
 =?us-ascii?Q?obC9NZaMRQa7+w97OQ2rc1Swhe6THar9io06z3PI03IlSqhvMfnadd+sUkSS?=
 =?us-ascii?Q?DI6vkJ4gPq/Y/L/+Kabu71IlxI//fZ+mw/d1QWxoUONRUEsMynfabNFAbqp4?=
 =?us-ascii?Q?sGv6+aAGHF3dAcqpx0ki0A+DpBeh3Iwy1BZHyNGy3qh42NaAzbdUJT7lqUB+?=
 =?us-ascii?Q?Sa5zqcYaOoZRYiMeaCHXyUSiPfbeFX/sNQSrULhbi/5HT9epWPZ7yKWTgrhs?=
 =?us-ascii?Q?gmXqMWPiA+jrdxs/o76eQI4sVfkXHuHrr6cdNap0zoMrIbwSzi7JyPnsQC4k?=
 =?us-ascii?Q?y02yIlxJ9+MnVJ8aZ7StpMkxuV306bHQvrH0Fbu8Hbe4oFKVvNGo9JpjbW1r?=
 =?us-ascii?Q?YYhmL+XgYOdwqKJcgbvvhWUZ/TooCB/xdYqVqsWP90LHjQ91z5bxGP1jjQjH?=
 =?us-ascii?Q?2CZc1/WizTEIiba5j+eULD7OvEXBhFARmhBzARd1v3MSnYX6zVJFPdNbE4lX?=
 =?us-ascii?Q?1j9HR7kfm3OApYc2XVA91io24zeXvl3RGM+J3QFPBW6h2fSI2B+Li8N1DYpi?=
 =?us-ascii?Q?+aIgxDXp5mkIjX9mOfZQBG/oM+r7VENF1HJ4dG82TxKwY3QjXfsxDpdkzEfO?=
 =?us-ascii?Q?GL2K5OmM0wNgnLV7Xx0hInqy5FaivuMsLTi9tQiB0nhvIaBw5uVUp9zEU2qd?=
 =?us-ascii?Q?1/3sDGdhcSUeyOrvv3+8wkuGxOKR9xsgED5FxJ62qA1vN3+2kJW/y0VdeYk9?=
 =?us-ascii?Q?2JjBL9MkbsDiDdtFwmZahYYy3U0v37mVlqLqzQ+w+WdcNk0THAMW44JXpF7C?=
 =?us-ascii?Q?IuRyteJnQGGqmJEoubzCZu2kzCrdASdBsLF1CvWeyMp/WVdeja43nuqmBsn+?=
 =?us-ascii?Q?nIm7E8O1o/ZO/R6vzgnVC/rs0K8PMzGhgP52MLXpriJJAlOf5LhLQsHKV20E?=
 =?us-ascii?Q?M7Lmkcx7Ya0iRJ8IIOTBhj9ls7Gyusoh7TewkXAx7SobUGY7NmMndmlbb4du?=
 =?us-ascii?Q?1YOz2DnU8ZPlzOitzw+dASOipNAf0Fd1xSil7NQL2F8jDWENUum1vLdwgPv1?=
 =?us-ascii?Q?zOvQjP5/LJFxIAND9b2gRLo3OhJvvlrFz3Lu8fWaZeNm53A+BlsLNvK/3YlL?=
 =?us-ascii?Q?0KZNUaebbDdBUN8Uahi1m8FllYRllUKGkSQJ5DiVmEDhiKFl/B6p0jPW5ATD?=
 =?us-ascii?Q?ae9+A0FI0Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ee3faaff-a10f-4dad-75fe-08de68d4d5a9
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 18:47:26.1944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m3T+vbxQTYFaHF2YPXVVqFug52gRCQrIpkQvyuI5oG3q0Scqv4Wme18u84YyGUBmm0xHehL+0/fZs1nAzZkJuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB1303
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 18:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230926

Add ptest support to enable automated testing of libconfig
using ptest-runner.

The implementation uses libtool --mode=3Dinstall to properly
install test binaries, avoiding issues with libtool wrapper
scripts. Tests are built via 'make check TESTS=3D' to compile
without running during the build phase.

The test suite includes 16 tests covering parsing, formatting,
binary/hex values, escaped strings, and various edge cases.
All tests pass successfully on qemux86-64 :
START: ptest-runner
BEGIN: /usr/lib/libconfig/ptest
[TEST] ParsingAndFormatting
parsing testdata/input_0.cfg
parsing testdata/input_1.cfg
parsing testdata/input_2.cfg
parsing testdata/input_3.cfg
parsing testdata/input_4.cfg
parsing testdata/input_5.cfg
parsing testdata/input_6.cfg
parsing testdata/input_7.cfg
[ OK ] ParsingAndFormatting

[TEST] ParseInvalidFiles
[ OK ] ParseInvalidFiles

[TEST] ParseInvalidStrings
[ OK ] ParseInvalidStrings

[TEST] BigInt1
[ OK ] BigInt1

[TEST] BigInt2
[ OK ] BigInt2

[TEST] BigInt3
[ OK ] BigInt3

[TEST] BigInt4
[ OK ] BigInt4

[TEST] BigInt5
[ OK ] BigInt5

[TEST] BigInt6
[ OK ] BigInt6

[TEST] BigInt7
[ OK ] BigInt7

[TEST] RemoveSetting
[ OK ] RemoveSetting

[TEST] EscapedStrings
[ OK ] EscapedStrings

[TEST] OverrideSetting
[ OK ] OverrideSetting

[TEST] SettingLookups
[ OK ] SettingLookups

[TEST] ReadStream
[ OK ] ReadStream

[TEST] BinaryAndHex
some auto big hex: 4294967296
some auto big bin: 8589934591
negativehex: -1430532899
[ OK ] BinaryAndHex

16 tests; 16 passed, 0 failed
PASS: libconfig_tests
DURATION: 0
END: /usr/lib/libconfig/ptest
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>

---
Changes in v4:
- Remove conditional installation guards in do_install_ptest()

Changes in v3:
- Use ${B}/libtool instead of libtool from PATH
- Fixes TMPDIR build path leakage
- Resolves ptest runtime dependency QA warnings

Changes in v2:
- Removed RDEPENDS on bash
---
 meta/conf/distro/include/ptest-packagelists.inc  |  1 +
 .../libconfig/libconfig/run-ptest                | 16 ++++++++++++++++
 .../libconfig/libconfig_1.8.2.bb                 | 13 ++++++++++++-
 3 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-extended/libconfig/libconfig/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 739995bcfe..7c5810f252 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -29,6 +29,7 @@ PTESTS_FAST =3D "\
     json-c \
     json-glib \
     libcheck \
+    libconfig \
     libconvert-asn1-perl \
     libexif \
     libgpg-error\
diff --git a/meta/recipes-extended/libconfig/libconfig/run-ptest b/meta/rec=
ipes-extended/libconfig/libconfig/run-ptest
new file mode 100755
index 0000000000..d81fcf4def
--- /dev/null
+++ b/meta/recipes-extended/libconfig/libconfig/run-ptest
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+cd tests
+
+for t in libconfig_tests; do
+    if [ -x ./$t ]; then
+        ./$t
+        if [ $? -eq 0 ]; then
+            echo "PASS: $t"
+        else
+            echo "FAIL: $t"
+        fi
+    else
+        echo "SKIP: $t"
+    fi
+done
diff --git a/meta/recipes-extended/libconfig/libconfig_1.8.2.bb b/meta/reci=
pes-extended/libconfig/libconfig_1.8.2.bb
index 6e08a7b04b..c3582828f7 100644
--- a/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
+++ b/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D17c8e32f0f72=
580cc2906b409d46b5ac"
=20
 SRC_URI =3D " \
     git://github.com/hyperrealm/libconfig.git;protocol=3Dhttps;branch=3Dma=
ster;tag=3Dv${PV} \
+    file://run-ptest \
 "
 SRCREV =3D "a42cb47c1526a4f2ed025fcbb2289863375bc898"
=20
@@ -17,7 +18,7 @@ DEPENDS +=3D "bison-native flex-native"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "^v(?P<pver>\d+(\.\d+)+)$"
=20
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
=20
 PACKAGE_BEFORE_PN =3D "${PN}++"
 FILES:${PN}++ =3D "${libdir}/${BPN}++*${SOLIBS}"
@@ -27,3 +28,13 @@ do_compile:prepend() {
     rm -f ${S}/lib/grammar.[ch]
     rm -f ${S}/lib/scanner.[ch]
 }
+
+do_compile_ptest() {
+    oe_runmake -C tests check TESTS=3D
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    ${B}/libtool --mode=3Dinstall install -m 0755 ${B}/tests/libconfig_tes=
ts ${D}${PTEST_PATH}/tests/libconfig_tests
+    cp -r ${S}/tests/testdata ${D}${PTEST_PATH}/tests/
+}
--=20
2.43.0


