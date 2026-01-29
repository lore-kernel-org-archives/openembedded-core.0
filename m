Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC1AD358E2
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 08:31:05 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10768.1769675458525755206
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 00:30:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=F/DuzR0T;
 spf=pass (domain: est.tech, ip: 52.101.72.7, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MxqqO4pkzKDEbFlRJYpwoT+oVP7HDS9NYSb7QNB8hXqdLCmB9IzeUx2i0UTi6H7oLkhB9ZsG6QtoRlpWyAo5YsyzDj2Ec5p6NcZZ3B6rL/Rci9nbLiQ8cjMOFaY1pLqgmtEeoP9wBkRBrLKXGiIxHESJadqtYdRt1/qDHukIek8JfNdM51Bs2XmsxWuycW+9qsUkiexqS1QEKQxgpTCn2QDuuXrEyimm0pdMl1ZwHzw1jfgQzhUDkssrBS4MgeQziANAm/tH+BrkK7u2u7Zkn3O55sjDsNrKn7luGlDuQO5pSlT35HinHawpfYr8i0X+LMndXZWNTijb4vGGBPkvGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZBGZZRl6vTuUSxEpK+1Dn9Hcv/QC6c1SMv1nRpkSl8=;
 b=QTBvwJgwsp9EZrzweBFAWvi36JK2jXEdo9y8Zhn6R8kvIAzZeMVLkPIJ0Q/2Ypt1xemPFKva6uQVtKK5HWR2ePqaefkLf4RVI/kN0ockdGAa8QQ05hfuKNLrKaE9Y0wKjSAhmSNmn1lbmsJqGnbukmChyVf/fhAlGj8SOXotP3WJ/mfxy2oyq279bjFHCGckjg70JpXuhKXTCdRPzLHmHlz0nzVuK81VPyNo4ZFtDStnwMZF1gXzPw2CUlA2N0OCYRdDg9kPNzDTR32Cf+N+7JM9gF7BPbARnTzqPdut1rrgViEs2TeB9/8o20WTTQHupoxN7+rv9kEwoqbDFA90vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZBGZZRl6vTuUSxEpK+1Dn9Hcv/QC6c1SMv1nRpkSl8=;
 b=F/DuzR0Td4CHUyGI+CPJ7zCXXmcj832WmQ9YfWOyHgaLRTWjZeeP2egsgTVtS2/DOCpz8mRdG/qN4Tzreb8VzpMQbKrXmFJhFzWnIEzYWxjk6Kxb6ix8OkLV+lJAQkzx3qRX2udte+sn7KGJt6Ec4VmtzLXCI2NomWqt+766RoHjH1L2Skb8xRWZrptkpZUwRPSb4CuveC425BCcZqT9z6T66OwNNel21CyuApCado6bFazuGXNGlfO4rY1rLHt8f+s5Q0e2JNPg8sDaikoLk4jw1Kfeg3k6hHO0Nu8tNgH7ZY2PfCAkoMgBbfYImqi0s808woaoOtbmaDa9eFZJHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::a9e)
 by GV1P189MB2217.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:9f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 08:30:51 +0000
Received: from DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM
 ([fe80::e967:c0a2:c8e1:99e]) by DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM
 ([fe80::e967:c0a2:c8e1:99e%5]) with mapi id 15.20.9564.007; Thu, 29 Jan 2026
 08:30:51 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v2] libconfig: add ptest support
Date: Thu, 29 Jan 2026 09:30:47 +0100
Message-ID: <20260129083047.8083-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128140635.43214-1-pratik.farkase@est.tech>
References: <20260128140635.43214-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0054.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::11) To DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::a9e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PPFB77F8FB19:EE_|GV1P189MB2217:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c1c50e4-7bae-48c5-f36b-08de5f10b633
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eflspW5IGTHAYI6ibNGlsPB7FtBqwguGm8TbLNXs/Jg7SJEK6e8WQ2EMByeQ?=
 =?us-ascii?Q?h7eVGEuMXDV8nX/9g1p7LHYJ1onx+2Htk/9T4JgrDrsdBs/MGxwWLtI0Ph96?=
 =?us-ascii?Q?vcNWzTWlwkCqWmyPbH7VT2EDlzgHg6mxCuEkKHhzfC2evsGSBJ4TwHXn/Xjg?=
 =?us-ascii?Q?6u3HA0VJZc3AoCedBvZAJJrqZvZspAwzQJ3B/9X9EQo4qMwBD+lkkv6dau43?=
 =?us-ascii?Q?GhZ9ruSbEjVwh7DNJGPL9XILysFc8hDcHY1t6Ls+muyiBJVN5VfRNEJeWBcS?=
 =?us-ascii?Q?9RNHYC/fMBn/+A2KFjcJ+TJQoehRN38V0lxzA3swkShSAdyAd3eK06pVIN+q?=
 =?us-ascii?Q?aJ/m4CMfipLdGUxt2pF0/rBu7l1AwiXbxioW2feweLf6YzEVFoi6XWq1Ygtc?=
 =?us-ascii?Q?BT9sK68hVG40J2qPcJklMpJDeQ/X1eKfpgcKi0g2Pjzn7oUvk4As71gljQ5s?=
 =?us-ascii?Q?Bp351NrzJyTDuMIrAmn0sqRl0YALTysQg1abFvnQLvO35/fUB0Kf3n4dM/xi?=
 =?us-ascii?Q?GSZxv4n5gEcNcn/FQSxmDK204qC5W/6mHvmhiri1wPanhDDd5ajbaGtFct6z?=
 =?us-ascii?Q?ZdOYUKwOiFaWG7fMxtbF+MHSmffpsiAYD3njGrmq9ZTqAINFXVb+bJWjccx4?=
 =?us-ascii?Q?i3Xe7z5+BpCHuHXCGe3q7chkD4RFvA1qhga57mlZ3HFs8GbiVZ821K61TwDK?=
 =?us-ascii?Q?hLj38gGsFfYSRTvvDeqVDK58GVGbp9y4DQ3fzg5a7bS+uq63Zb9TMzqUEj7C?=
 =?us-ascii?Q?zA2otK8Xlve/2zGyNBVgPAR+40Q+ZkHYg5SslpHhtwOy8tTXJOIvmGCB2RGz?=
 =?us-ascii?Q?UZMBsir41drLeJEA9e2Jt50hMRztIclKd9ksYkBYvtQcqS51O48E+nSQ82Zu?=
 =?us-ascii?Q?iFKGx44SqeUjIg7KtqeQywV4ZiDiXX5xhVrMlkBZ4DGDkcKFsR0lc0eTE3xS?=
 =?us-ascii?Q?IfT85gEwH5aUT6Bq21laoZnV9mNA23sbqRZGeLjJDe9uLIzLRS7IQZ4NZDtI?=
 =?us-ascii?Q?CqVjh4ISKQsl9xg4Tvt2cI9xCeRm4U6xizO6x9Wmc7IS+qm4HEzfQLahURSD?=
 =?us-ascii?Q?CJ+yQj4lpW3UXNC17yYRmw6yQXjOeyGQAID6KKyQ8S5XEr1zN48OmTXZP9ID?=
 =?us-ascii?Q?698iNbRTFvuzNnmRwCSqyoqcEWTcYJkakB1tFHRPNGn6B/dcAzZL3WCR1pni?=
 =?us-ascii?Q?erKiy53yPvN/AzuMZeAe+H9uiERKviYt+KTJG2Owq+Ja++JM3WG4l7u9/2pE?=
 =?us-ascii?Q?9x5Zhiyo5tsKUl+qO9Asl5wS5Ykdn/sR3rv0m6laaArUlX/vjq4HfDwzQuB3?=
 =?us-ascii?Q?oCYK4DX6USuzhDI/oFMEL7jhUZP7+KxJuVpMo16+AMyBCi9JI7JlLfRDKHl7?=
 =?us-ascii?Q?TtwN8VBNpuG4MCfqyQdypOiGxwCW4ovVMHt7iQzHtAktzLGlo2/yxo4A8gSV?=
 =?us-ascii?Q?HJxXk/KrBkcxwTvy9Pl67jfLwd0J6/OSSvBKdzDvouvLGKVU2ZbKG7cXLpVL?=
 =?us-ascii?Q?x4DPVJiRv6/InZPt58FCp/ZcbadMXsw5xsL1HpCITCQ0eO9vc7sudd/HonLI?=
 =?us-ascii?Q?JTEDZzaWAF9xq/5siXM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?f+TtXPRzW5mom1uAFU6zEGrutS29ZLOIGZe2SpcQ/fcNXRNJywIbuO/ctvFL?=
 =?us-ascii?Q?ID0B5zTwolJAXv45RNiIWkAptPYpatF/XYOaLnuhwYWRLyq3htL4o85RoXci?=
 =?us-ascii?Q?NClvBBopTmfJR48mYd5xR7HspeCy0cH8/xUe0T3EXVgThNvAeaZMAvdERmky?=
 =?us-ascii?Q?XD+ItWmiXVc65v6FGpP0ZB1pljyqyryK9Waf2JV0YVL37gV1sdkyatBbXKTT?=
 =?us-ascii?Q?4dtIZ33PimkUoKcZ0DAWo33XGo1W+5qOLM6xD2SbpB7c1g4WtAgEijQtT5Fr?=
 =?us-ascii?Q?7F3GyMbemHjZuamjSffuqGFSw3moODtLydzAmqBujRaMHDl3DwvNoKJWFjpx?=
 =?us-ascii?Q?wy5uy9uLvfLtNOavLWcBgSmDgmfZkQ/d05h6cc2vit1sgMSGrF8SkQL0qZPb?=
 =?us-ascii?Q?l2PVl976qOD517uwJHwNs0XXUB6O0m9nESRvHlYMzHeAjTTHgybq05c5aBsi?=
 =?us-ascii?Q?bLG5irnnUUAykIG+HRllBHmNFQIs3JT0QjSDrFUM5JJtQlcWJFsXuf64/0Lg?=
 =?us-ascii?Q?qklHgAGyQzMd0Es35ScQSUjtu6vbY4L5H/B20ehY3z3ezeI69ll8Y9+Kd/zX?=
 =?us-ascii?Q?a9BpEHFY2/Xv7QLJ+vHW0zsdzLkEvT7BJgbkXqF8iLeyoXjUGhxvfaggod6K?=
 =?us-ascii?Q?wonpEPH009hoz2OyudYddNDgMYvTvDJhf0EW4mDk7lEb3smvSTnHs5JAvckb?=
 =?us-ascii?Q?NsMa29Es/S3GqJTS5i/dkdXpOF7qXTSJ1VKMNotjim/BMAD1HjFhnBN7NSH9?=
 =?us-ascii?Q?X9dqK6dwUIO3rz6qDh9sMTbU/NmyFS2GVxIB29IoFMDgIJtYyZOoHm/eg+Rd?=
 =?us-ascii?Q?T3esMxUqALJ7CyBlg0JdKwWrb6CE99tLbU1120Ro9vaFxaxcrH4h4OKUZpff?=
 =?us-ascii?Q?uNllMvnpYroQyxbJXF2zIsAH2UE+Q79gS0Gap0cSpmdM6f4E6vukNSqX5L0i?=
 =?us-ascii?Q?tAdEHMtMF08VS7Gs3lAoRBktQwlysCqGOaPcuATKiigMYoP/hN3SBdYMsNWq?=
 =?us-ascii?Q?RVs9Tm0Lwz/F6rBHTDBVPMcZlRmU6CXI8W7O3+qMGqRh+xo57BOMZ82s1UZb?=
 =?us-ascii?Q?+Tmg+LtecMQANmE9S0ZQR7Nne+2hklD41pikeoxnGCfcaqQhPv/SgOjRZ6yr?=
 =?us-ascii?Q?DExu7OBXQ+xl5oY90FdpcxrNRY8hO1N5756N0dKwYGItBtbOb1qQXsF/LH3w?=
 =?us-ascii?Q?fSMvRhOXZ5DnXzCbycRV9V6R3qSyE91VlFHPUoZEH1OxuQJWH1mqFz6slXsD?=
 =?us-ascii?Q?MISTSO9GGdnAZLm0faDY7lZS5Wimj8M5dhtcfrX6NHjMkhFB7y3ae/4yNjc9?=
 =?us-ascii?Q?whaMGyNjgX5uI/2NmToeLy+PBuM5dT/Us5ovbM4DmGjSQOvfoTjBdS/Hnbyg?=
 =?us-ascii?Q?19BTOsbPFu7hpQbLAyfI3fY6V+AN1G+ZxgA9uSg639l9ph4fZCc7dGk8ai5/?=
 =?us-ascii?Q?K+u6uGg44Ay7bhQxXBw1q6hmgp+P/AYQdvYqQKVYcMoj1VURYMWfb+aqok3l?=
 =?us-ascii?Q?vgKF39X0hEeQNtMOP4M4MmoXuRD+qxTl+COt5H6e34cbXLFdQKpGVFF/5Nhv?=
 =?us-ascii?Q?+sjZROFOYz3A6HGNDZbv2TqdUz9YnkLQjOZjT0nTgNPLchYQbSh1/L40BQzV?=
 =?us-ascii?Q?CeZkGAy+xuceHFcPZZ+aT66qirifzlLfTEKwe9Y3F2LH4hAAzi6iIA2ceZLb?=
 =?us-ascii?Q?gNTaloSuvT64IQMkivUwsIQGljg4dKdXhjwMI4/5q5n1IkdbWBgrEX7FZDB8?=
 =?us-ascii?Q?KDzl/nZdgw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1c50e4-7bae-48c5-f36b-08de5f10b633
X-MS-Exchange-CrossTenant-AuthSource: DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 08:30:51.6356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wQ/NXpRxp0g7l64Z1uyFUAB/MKQoHjPrQb4zvfJ1hL9/3xR8Iwo/ZWlHs8Vfw0tzJ/8jrtoad+M5Chey3vunUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2217
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 08:31:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230124

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

Change-Id: Ibd69ccd63ce0168571d46a199c08be59ea748d69
Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>

---
Changes in v2:
- Removed RDEPENDS on bash
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../libconfig/libconfig/run-ptest             | 16 ++++++++++++++++
 .../libconfig/libconfig_1.8.2.bb              | 19 ++++++++++++++++++-
 3 files changed, 35 insertions(+), 1 deletion(-)
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
index 6e08a7b04b..f4319545f3 100644
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
@@ -27,3 +28,19 @@ do_compile:prepend() {
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
+
+    if [ -f ${B}/tests/libconfig_tests ]; then
+        libtool --mode=3Dinstall install -m 0755 ${B}/tests/libconfig_test=
s ${D}${PTEST_PATH}/tests/libconfig_tests
+    fi
+
+    if [ -d ${S}/tests/testdata ]; then
+        cp -r ${S}/tests/testdata ${D}${PTEST_PATH}/tests/
+    fi
+}
--=20
2.43.0


