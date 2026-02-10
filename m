Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E89EB2713
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 20:39:22 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3168.1770755953495520897
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 12:39:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ZSh20QMm;
 spf=pass (domain: est.tech, ip: 52.101.70.18, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DNGONxbam9UNEP/Pf6u+uv+ZIr/U0Jv0vSCHk/EsKOWobW+iO/C3/BeuTLCWG6/Wx3T3bdEghDiNE2nA91XEcGIQimUffDDEegAWMnaZHZbR6ZldIvJMEEHiotKd+9OKOfYXDu+6o4Hevg56zfjw1zI3apq0xtF7gthHmeRqACgn/xiuqSHlcFPagbWZQc1aWfeMDqLpaNGRtwyezy7C+k6Mbux8axMFVr59pDANUtvX/zy/po5cVhoAnHP5yGhBR3lArzmZs7H7Uo0iO8JifsQFOp5UJre4jum+irVjL96dw1Xf5472iWXk+Bv5Ej9Rv5wvw1r8R0sgbD97aSE4sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eXQDOopxDLX8M0Wp8GTBOkvsWK0RUo79LOU65/htX4=;
 b=CwPnW2AXTsIOYYjSUpzscFmN+G7YL6H1pNfoj7Vrs4KVnSZv/dOdTzQN3Kd0vzd5WsKZ0TKMUiCEv+z8d27bRd7oVkKshYKKShKn8TRR/FtGtjrxNeUpJxsJFpN1QxrsPA4FbjOmKc/frPoes5DdclclM+9M9ULkI3at6ZWpUqfC++6yROkFwyHNtv0HFPbbXfISt5LIvG3cXxsaerDXP3mBw27ZwK3lqD7TmHm6kjYKZlzGu2Jc3qROhMGfMlL452jZHry0kUayeuaKPIj+p4HkwB9BVWNn9ElOCu3KVPKZkOCrnvPxNyuIxCx9t3YR7z8xu5NVOx7+KyYgcM75iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eXQDOopxDLX8M0Wp8GTBOkvsWK0RUo79LOU65/htX4=;
 b=ZSh20QMmd01kamwPw4TbCpPZvp6DI0Ok8EV72LNTGMYEVNVzY2V4B00Ym/r0D77pVUygKaNhIbf9X5znyknmbZOaMYULGRFBFiJRsXVSgAZ1DRdc7mDsqZuxZIhjNKmOqvx+Rg7qlu9eyavE2ZK88CfaayaK2LyANmC5GwVNoM9C4rZkGSmzm8hTSpGbpqZBhfHmWg9Pppxnk74YLm7NhvKnNdVPa0cKw2v/BEfLyQVXLxCf9NIr6xmIheCGk3v7R14hf4LByjYrUdT23caGrOdotzqr2isXkzizwk0InRgi6LTxvNnqWBnfXq/meTNOK6wUglB70RFiKdrqIDh5pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by FRWP189MB3226.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:178::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Tue, 10 Feb
 2026 20:39:09 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 20:39:09 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v5] libconfig: add ptest support
Date: Tue, 10 Feb 2026 21:39:05 +0100
Message-ID: <20260210203905.6407-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128140635.43214-1-pratik.farkase@est.tech>
References: <20260128140635.43214-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0006.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::18) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|FRWP189MB3226:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b9be779-36c9-4b6b-1b48-08de68e47130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ttk+3py7hRwa5p2IE3YNEsCFPfQgZ/P7jkcxsO+tdUGCY6em6M7fUiXVyU3U?=
 =?us-ascii?Q?/ajxryy/VUZ1W0VcQVlH01Bw+prXHUnQv0yyQGGBAvGK/ffLfZyfEdvbVt7B?=
 =?us-ascii?Q?Dz0UmT0pcls5Y7zFyJsdE+qSvQf966RzAlkG0H73lDft6XzhwbB2aAWBsTeu?=
 =?us-ascii?Q?HD45WUBaOgONzlAyHV2FDeDmZvpcOWntBAtwHIVol3E2oH35LTEAbYx77C4v?=
 =?us-ascii?Q?bbfeuhZ+gl2UhFDFDu+K+ptXP1qOR0hSvkdcl4WcCk+tN/K0JnxJU1/Nd4KO?=
 =?us-ascii?Q?EOHE94m7bI1GlP0vBE4DInS0WKWM84SNLV1vKXFyFgumSJkk4RRk9oF3fqKh?=
 =?us-ascii?Q?+Tcxdlyh9yvh7UC9/Bu4Kla6JiGgnF/aW/g+wi+vGs+c05an1H4VMyRT5eD8?=
 =?us-ascii?Q?FcoUaL38N5gptru713SjWGKRd+vB5HVYKuyqqUqGKk0q30WOIPKS4ureDP4a?=
 =?us-ascii?Q?6lQYVg/uZWfGCFaOid1f/Qx5N4cO7mInJ/yJ8GwcZxmCmrPEBCgtvHrLkHBx?=
 =?us-ascii?Q?99IlYo8DzVjuqhOZaTZ8cpy5EKQl75djB5BspmYLuxGfEIk/F4lUOtmEPTW9?=
 =?us-ascii?Q?vbtOP1oIhAZXImo/dc2RLMw2D7NC7X1xytcTLRBWqgNlnVYMcoJgscoUjHHO?=
 =?us-ascii?Q?16gfkLuE2O1hrDNl3eJagDBUT7k5xuaAQOyq58JjZsqT7CpAoQcI2ib3k75E?=
 =?us-ascii?Q?PD9T/Ghdr1GvGQveUMHhmGzIodLEAL5u26IK/xwo4Z0nb2ROZLhY+prH9aXQ?=
 =?us-ascii?Q?19flDgjihebOf4ytjq7j0xu//O2sXFwYsNH4JxSzDsmicyIdWY7pAXe8VRcR?=
 =?us-ascii?Q?CP71C1GbJR+nYNYkXlw2ZLlpuFEvQb25Nynp57ruFeSWsgdAh00wA4A7e1RM?=
 =?us-ascii?Q?flJc5PwQw4qPH9Lzb1vXkWHd2D63IJAPju4FNzczUphcAfFuHAHUDxxoy8wq?=
 =?us-ascii?Q?7b1mOw12ujnG2trvIGr1579rWDx/3Vtam3sRYGcSAorHckuPKyx6SkCVxtRu?=
 =?us-ascii?Q?ZUQU2MN63CZ2VF/S6YSPbmKoifyJMFRmPmyhZd/mJXmnl7HMGCO1JgZ8CzXT?=
 =?us-ascii?Q?XIuuyKduNqgl6yUwU4MN3Zyh3VJDvm4PepRAKeOLhWgdxvr64MRj99IiUe41?=
 =?us-ascii?Q?riD8wL/6zyCLcbskxXppNvwE81bDfJ4seVHdk2YjuWTUn4GsUHVjVKToPDFv?=
 =?us-ascii?Q?GeMQVDYPwqZW3b9Pzap/x4fjGpNFP2bqQWKNzosxq7y+jPDO+7eLfztGWDj3?=
 =?us-ascii?Q?iyNEsXl4nRFNTlUaBCRh2wnePEXzFtJtOS/OPwrLVhuV+n85VKSLuISBnJr5?=
 =?us-ascii?Q?XfjFVjSbNC7muD+SDFOUnUnsjSuoUpE4b8b6Gx9LSqxyMxoAdogUxMRdZMct?=
 =?us-ascii?Q?Tp7bcgtfamomjYHqHE0KkJx1Z1jRglhc2iaj+Iss6u4PNEwDiD+/TD1Ze3W6?=
 =?us-ascii?Q?CsVQTiW7aM9y3Ehtx+g27DZP2ZA2Rf2yjZJcDcVDQGi1BhCLcTT8NED9kNIl?=
 =?us-ascii?Q?O5qxbr3ftbzyXvs0mss7l8aZoUu6GEPiXm8jv2LMHc43yGd+8TySRPGaRLWo?=
 =?us-ascii?Q?350Xxx/XgDwgBzwamCk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9Lir58F1qjL4DxFTxFbknanusr/RTblp8nuFzFQEdYkdX36OwlA1jnSUiJtM?=
 =?us-ascii?Q?zGjLVegbahElpgBlpwxAeokkTIY+KYidNG/Zlsfra7Tjx2kMheMwgXrUmwNq?=
 =?us-ascii?Q?1y2jJSYUYQUBH2y4sJ8S3gtxIyzOu+Q1Hkx6834EZqlXfG+s3CkunuHYgXLx?=
 =?us-ascii?Q?XJPBRsABTOcUGFfZJQ4dcL19gjt5a8PtgQynaYzmzkrTLazM8AxV6AhrB41S?=
 =?us-ascii?Q?C7/5tVXprUtLI3mvw5uK7MwDtzB7buXQ8c60no5LsGfrptr3m7LCa6lFLSzk?=
 =?us-ascii?Q?kRv8n3D2xTlWuGnVupC3MXwgmSXYf+jCgIGLpPxhYRTBJGbnJ4wrtAc/18if?=
 =?us-ascii?Q?dq1SyD4VsgAd5xzBgtatTBku4/CEVYHnqHY6BoUG97ST/gUM1p7KYOF23mCD?=
 =?us-ascii?Q?da+RqpwVKsIQ0WF6AFOCq0V5PyOEZdZn3wfVuPV1KQFEdEw0IHnlXD42ZU9C?=
 =?us-ascii?Q?rn80T3becNgO7Y+zU7hb95qhc0dVZWev3MwswVLKDqLCJiio8NjB/tuk6nmO?=
 =?us-ascii?Q?IiZMSU0HolQ7kDztToRJwu0OJG1IOQePldRCWEmLgR90NbI9fpeNCRqCf85r?=
 =?us-ascii?Q?W1wAVJ3oBLTcKKKHvViZreOqBs1HdOp0jA+b6cBEANin+v959X8mlUzrK1/c?=
 =?us-ascii?Q?6Nn1dec9jNt6imyXnUFG3eLIkIprNVEojJQfVhgbPNMGkoqgM01C9D364+IX?=
 =?us-ascii?Q?alwHDKJ+CTnnRJBpYVGmgzoy6jsHYQiSWakT9gfY9BQmydBf/bJNeMCeAi6t?=
 =?us-ascii?Q?DDbPfOL9KPriJWfnxT9qYol6ZR0OFoof1K4raguyNE0a/rJE30vRcol7WoA5?=
 =?us-ascii?Q?gCDPoOQVRtBLsDUzTFiGy/PUdLpQA0vbDP8oYSIfhRt6aHVYgIgdOqbNUdLi?=
 =?us-ascii?Q?RA2s9fxbfcXv1rjwQn4V1KARweb9KBGicyFR6KROiQywAnjbDJrjiqNPxlW5?=
 =?us-ascii?Q?/dXVPMK5quIdq+BRHtHSiCQZ6i0qgZtKb6uFGGjVFGWe7YGBH9u1/qbcZ/0v?=
 =?us-ascii?Q?xu+WX5+w8VcewT8tvU7OKeY0bb2KqCoihW1cRKgSujtk70bIHrCoj/MMtGjI?=
 =?us-ascii?Q?dHAy9yaRivd0p35tS89eB93jBghwY9zGHgKi+fadYhNgG3M3AinCYrSSodzA?=
 =?us-ascii?Q?ip0A9HBTJZP1FBr6VD1ZHBVSJ5nwaGR/6Ys4Te0Oqd8qFDf5xGC6xU0BmTAD?=
 =?us-ascii?Q?cHj6shsB1oC0ogEG6I5z8NrPDcIYQH+RH9ZLWQc+t4Ri+aHEoLfXbblBfaHz?=
 =?us-ascii?Q?nSHLBCK2sokBdYx93nLbf6/PFI4vqljgO5aKNgXPKLorP03xaHA+l8vEq4bV?=
 =?us-ascii?Q?v9os07MPdC8XhMocx3y8WZQDO3CAFqPv1Rni7gBNAZIGWFT45mPgc/XKhvI4?=
 =?us-ascii?Q?RKtuuPsgzvF6rkZRZ+D8Q49y5w2BeXKetnRGfXVaUg3SrWnL4HhfsYCSDO4X?=
 =?us-ascii?Q?wmEKfi57b1oh9hfGH0uKQFliZfUv9EYMku97x9VFIbkgN9dS99pfThkXDiZz?=
 =?us-ascii?Q?NixhzuMPB2ZQ4140UV59lYGB8rMabU0sRsv58dnoX8jpNwL4KChPqJaH0T8g?=
 =?us-ascii?Q?kYSLyhkQDBZDt/ksGpz/c9XYfflq0TT35lpsiRr2BR6EYEBxlwapmASaXX2w?=
 =?us-ascii?Q?edVCGWTpslSM7R5EzxklqGD95Pq2ymiGzF8diW+6H05Qssv7n2ZJrOZpMMsj?=
 =?us-ascii?Q?wmTI2TQzeJaEljnK6DPkx0cZDidg91ujFNnymiWOA4qBQN83SOt8TCadhq/E?=
 =?us-ascii?Q?6VgF+C1VUg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b9be779-36c9-4b6b-1b48-08de68e47130
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 20:39:09.5274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vf0dkTCoUFRvvtz9p+K/3TGqcrgJxa2llNAMPlchtCWoaKcEtK9/OXmo2jcivWq+O+xcJuz4gPFxqpVe9ug7Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP189MB3226
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 20:39:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230936

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
Changes in v5:
- Remove existence checks from run-ptest

Changes in v4:
- Remove conditional installation guards in do_install_ptest()

Changes in v3:
- Use ${B}/libtool instead of libtool from PATH
- Fixes TMPDIR build path leakage
- Resolves ptest runtime dependency QA warnings

Changes in v2:
- Removed RDEPENDS on bash
---
 meta/conf/distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-extended/libconfig/libconfig/run-ptest | 12 ++++++++++++
 meta/recipes-extended/libconfig/libconfig_1.8.2.bb  | 13 ++++++++++++-
 3 files changed, 25 insertions(+), 1 deletion(-)
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
index 0000000000..047d9554be
--- /dev/null
+++ b/meta/recipes-extended/libconfig/libconfig/run-ptest
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+cd tests
+
+for t in libconfig_tests; do
+    ./$t
+    if [ $? -eq 0 ]; then
+        echo "PASS: $t"
+    else
+        echo "FAIL: $t"
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


