Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6644DC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 12:59:19 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8382.1784552348885546592
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 05:59:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=co2qRaG5;
 spf=pass (domain: est.tech, ip: 40.107.162.12, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FToggUL6Fn6dbMnR6jKmzb2FjEEuoPDPQeGRFrsI+PK4ypDARToGcKZE2XPtZyVGmYbdSllPJ9m6ONQ5yZm+wN7Snxod9rqgU1VS3xoMDONa5A4k3Zdze2sf9bki8U0V3aBiiEWd0ACyZzwV5UqeCXEnEl2yrOZZ0bhEnWscP40G3T8362CQacFeLBb2K9lWJuVYCtQvtNWlBMBT10QkKCVyUmPKYzFGu5m+fMDEKOG2Yx/GCOOU+cIpavoOvtuTDIXtNRk7C9XRbWV7h2A2cLC+EG4CjHNZxwZ9/yOct+01f1uW1kPXLRp5MPclyRR9UiaTO88xxW0ai99RD4PQbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSEsIt9ZDd9cHLzRey7MFrL4G0EXnTZfXIkGy26X7cY=;
 b=hiPBBR/FnWmpcEC8LDKzr6+Q9NripAMreZVFVqNO/zxHL8kIZjavWx5oTX8MBlWLJUpJBGdNKajh5bzshUPwEr/FdvK30sMgeTlbgK7E3LQvXYQvpYTR8IeY63D0vbsdxJUNDD4geOOM8uY7yLKVgDG/xUfuYk8rtPzh+Q+MArTsjIELeS1POF47LWErifXGZzjGBlEs6Z2q1qtlAPk5gHEhbrSYrtirMIZAMNXyofdSg+/mAvjCX9S+4NJ/Dm8OLRi/M4w//b7XYFvGE4HJxthX7xlMaHPZHh5d9POwVlF332PSZOd2SPnKzt+ImabO8mxrhCyimDkHVJ3f38ZzqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSEsIt9ZDd9cHLzRey7MFrL4G0EXnTZfXIkGy26X7cY=;
 b=co2qRaG59z6JxMRnvPjCJ2H4qpp7Q6XCLYIaOtHb+L2gxxyl0G3WQdtFRpjgrwxCihpEu8OdxFTKIR3hW4iyipnriy00R22si3jnhj57rhtNkeUjNDBH0QePLjsByRr8E7ZDKWknSsmTUB+OWkHx+kjt9zLJlTwmC2shbZZyJwr+wbQ4qbTNVM6CV1+cumY/swmKcpo5hXABOy3z1FrNPTmaYNWLXqcqTm2Ihh/xyqItC8A97W/RDQ/PnxcfQxnvO2WR4sB4eNPe/VQQfDT7stqp8EENgFngOmFtnBc2pv+rx80J1g5oxakj0kq5YwK/bWVbjK9fqfIFnW6JzTsLbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by GVXP189MB2103.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Mon, 20 Jul
 2026 12:59:02 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0245.009; Mon, 20 Jul 2026
 12:59:02 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v2] libarchive: ptest: run tests from tmpfs to avoid inode overflow failures
Date: Mon, 20 Jul 2026 14:58:54 +0200
Message-ID: <20260720125854.39562-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720122619.34696-1-pratik.farkase@est.tech>
References: <20260720122619.34696-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P189CA0029.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::29) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|GVXP189MB2103:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a2302b4-eee0-4713-aa93-08dee65eac54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	o/wdzzOWKnsOu3PJuoN8yqaLliQcoOhH+woeHT97ET6FBMZbdLZtxMl4XYCUlbyEgK+bCD6QNsgfwlX14JBBjRAlFFtlhIk7zPPJ4jGrHztdpZUUXfxK1w7C+W4odWLaXWnwyjEBnAHK1qBh9kbFKjihsp+xnP4TothUl3sDa4RysCqxf/GKkDJCVg3XJHSDr0B9xJAzvFyhViHkEOv6L/8SttIVUeehLKAz3rKrLkddP8veUY4xkUmC7Z3rFKTDHwrgIYBtgU/sFO8qS/jDNJgXPAZw8+cEoYD8+59fF3kIgp1OnsVI76Q6ZHhWmMnL8JGAVxBkOBfa8RhO4BTSaUvHkPHim4QN+SomvdhLHwca9iEgXzrGzMo/09DqZFQCSABBEDV3ivPbvoIa1R1i2vQqsfLwM4H+Pz5fbndDnEzMnYlW7AVsFm3wJEXrQXHJtRktPZnyftzXkAipruod0kfvpMLeh25WPAQdfc3g3hf/tY/vbw+1q/V/NE8dROELKrsx0rvcCSlzHeGHVx52Zu9k7x1cTaP1S8zF5hTdjHmkhNV0eYBvFdXUYxgbx6JuzCeGuHsIZ+ghLSdCfRVlZq+ettB0utB9WBraFiiT7bE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Pm7mv7aktqmM+4xV1YNnqKaPaJKldMJJpBBLeoSfDTGGZbL+RltV/e+YLuWD?=
 =?us-ascii?Q?isx6AASOeSxWqhId/0pLjf/X32y0H2ZWCWayxVXKiOGY/C+MznutHo8ESE+U?=
 =?us-ascii?Q?AxB0XeRcxLul9IDPCx+60UFKK/u94KSm0vi1kjcYXmi5Ez3HKN0S/dOFwzwc?=
 =?us-ascii?Q?ayAMjBBR+KwT9cT9I9LsGDXfporrk9n5H/MEfCKoBPTTcTd2CAgEv4bUOHFj?=
 =?us-ascii?Q?b2nJK3JlfI19ZEix57jji9oC4WkGewgaw/SiUSS55YlISLXxdh4955g9fEP8?=
 =?us-ascii?Q?I50TjpVCJ1mqNWCt8Yic6LWAyzN+8OmpErrTzNzyUQaEVzJK/IKzzlkNfken?=
 =?us-ascii?Q?GPW9+HzuHhQ+/us9uAXTYBjrNNWzWg8ciFyT/XR33fowETuxLwRsl3GQbWEz?=
 =?us-ascii?Q?EZ+RWqGZKutQgVDl1UJP2NtimWq40M1KrNGCPFwVfqlhgqIZ5wDadFMc3FEz?=
 =?us-ascii?Q?X4M9D8S+nXMO/GJS3NmMiPPWaa0c5NldVDY1TH+KAjVxMCy9XM0Jp4tl8gAa?=
 =?us-ascii?Q?YuXZS1aBFT1N9i3LB6iIIP6K6UbL/7/totYKpLyLWvySzD8zJ/0cjvYBTPiU?=
 =?us-ascii?Q?x9keQYLg1uR1dyCS2AzWDmTIEO5sMQ29tpXZvnF2Ph9cWQ7LxBRPvHkAiBDp?=
 =?us-ascii?Q?45ZFLk6gfsSNnmC2KgVojv/cl8U9MQ+czuHogZIq6tF6Kmk5X0J0P+yGuVBq?=
 =?us-ascii?Q?ZlSbydkJ8APecAd3JJryRRJhN/pK3Plic+rE3b+wHb1MqbVNi7jA4Z6HGwvf?=
 =?us-ascii?Q?XMA/CzU+VL786qVaQMKfZcIVPrPH78PWfa26zyoTUG2u/hM7pywtOEUHB4jx?=
 =?us-ascii?Q?z5MH/r8XP/hNX7/YAxeB2bMglBWgZsQylWm6JsnLvX5wumbfB/EmEya23U6X?=
 =?us-ascii?Q?4BdtShE6GsaFsPkrA/UvJmMqATBrs6lF1V8cx6y0cwQ5Kle+vEtlfotTEVpz?=
 =?us-ascii?Q?RjEQ9dBZxI+5rALciEPWcDk/TXi49kep1+4LWwZC3zAOL4fJ9YsMNrs/RuxF?=
 =?us-ascii?Q?qIVwJaMJjZpPbd7pcAuMBxUCu/Ba9jhx/F+Usla4/7H5Ik9oirVIs6YJWd9D?=
 =?us-ascii?Q?uoYO1xpUWquuYkpNS2fswI/W6XR7lfED0KHP6qZP7eNAbV56TT43RkeDKzBZ?=
 =?us-ascii?Q?PtXgNSAIsMfQMuvUbbcYaYxYu4gGaoatftOWrLgkrqW49zZleu6LX8XDu7z5?=
 =?us-ascii?Q?uR+nN20uhVUQdTvWIOKQUab1t2320M3PTGbWxl8xE3nlM2QW/d0zenGLVIC6?=
 =?us-ascii?Q?BoqfUjhE9i/9Vb+uONbJaT+MkXRWSHTsqGjvD0TkiUtTILualQRZaclDDllo?=
 =?us-ascii?Q?yhVUs8mH+dnAj45kj1OycKmgxfhY3GLBKQwKTLvSmBf0UZZ9n3z7CLdOcXJ9?=
 =?us-ascii?Q?6WQL5yILmmuBengUaTbRdiCR7a0HK9F91Cgs7+3xickjYcKFw7tNlgtGdtTV?=
 =?us-ascii?Q?PFdvhDU8rZNuD+E+QeFGbq6gx6vGRxUbdiWfkXFGzPWlD7Z9lZIRioDVKvR9?=
 =?us-ascii?Q?PVLQjxtSM2WrwCMRa87HNTzi1XhAz5eZARr1aiJfC24tdwGtlz/DKC8M/rib?=
 =?us-ascii?Q?i72KKH+HZApjVwzFKMnveaTpj+V1TwDfByidtdNFVs73REJN89rFG85L3m3p?=
 =?us-ascii?Q?HMeBpKz7F8NyBYUPFC7I7XA4f5JbZx/ofM0lLnLxNUb75lAEv+NBVclhK5Wc?=
 =?us-ascii?Q?2rCMvLZ+631rNVLjSQJH98l+YA+cBD+7KZpMxUv1RY+WbLDYOM1vQrGTiMg9?=
 =?us-ascii?Q?mYFejR4tPg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a2302b4-eee0-4713-aa93-08dee65eac54
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 12:59:02.6431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gx3V5pxgD2leR4YYM4tqrwGlBwC2kYVH81CxMGqmHgNBmbN8Oy2MQT4mWiQF/z/w6R1ru0WL1x+P2AFvJ6sPnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB2103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:59:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241394

The bsdcpio_test odc/newc format tests verify archive headers byte-by-byte
including inode and device numbers. On ext4 root filesystems (particularly
qemuarm64 and qemuriscv64) inode numbers can exceed the odc 6-octal-digit
or newc 8-hex-digit field widths, causing intermittent assertion failures
in test_format_newc and test_option_c.

Run all tests from a tmpfs working directory where inode numbers always
start small, avoiding the overflow condition.

[YOCTO #16231] : https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16231

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
Changes in v2:
- Use cd "$PTEST_DIR" instead of cd / after tests complete
---
 .../libarchive/libarchive/run-ptest              | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libarchive/libarchive/run-ptest b/meta/r=
ecipes-extended/libarchive/libarchive/run-ptest
index d6b4c3f934..4af767b29a 100755
--- a/meta/recipes-extended/libarchive/libarchive/run-ptest
+++ b/meta/recipes-extended/libarchive/libarchive/run-ptest
@@ -1,13 +1,24 @@
 #!/bin/sh
=20
+PTEST_DIR=3D$(cd "$(dirname "$0")" && pwd)
+
 # The fuzz tests run 1000 randomised iterations per archive format and are
 # meant for dedicated fuzzing infrastructure, not routine ptest runs. They
 # regularly time out in the time/memory constrained autobuilder QEMU targe=
ts
 # (e.g. test_fuzz_iso9660). Skip them via the upstream escape hatch.
 export SKIP_TEST_FUZZ=3D1
=20
+# The bsdcpio odc/newc format tests verify archive headers byte-by-byte
+# including inode and device numbers. On ext4 root filesystems inode numbe=
rs
+# can exceed the odc 6-octal-digit (262143) or newc 8-hex-digit (429496729=
5)
+# field widths, causing intermittent assertion failures. Run all tests fro=
m
+# a tmpfs where inode numbers start fresh and small.
+WORKDIR=3D$(mktemp -d)
+mount -t tmpfs tmpfs "$WORKDIR"
+cd "$WORKDIR"
+
 for t in libarchive_test bsdtar_test bsdcpio_test bsdcat_test bsdunzip_tes=
t; do
-    ./$t
+    "$PTEST_DIR"/$t
     if [ $? -eq 0 ]; then
         echo "PASS: $t"
     else
@@ -15,3 +26,6 @@ for t in libarchive_test bsdtar_test bsdcpio_test bsdcat_=
test bsdunzip_test; do
     fi
 done
=20
+cd "$PTEST_DIR"
+umount "$WORKDIR"
+rmdir "$WORKDIR"
--=20
2.34.1


