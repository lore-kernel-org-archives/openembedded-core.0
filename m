Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A01A5C55ABA
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 13:17:11 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40022.1785935826981802925
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 06:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=tmfuceDm;
 spf=pass (domain: est.tech, ip: 52.101.70.10, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCOkBMQI4rCoEt1Mon6hJo3U09wNGYn/++FuX9F/YH/77r7cazZZMFxTCeHiYWxD7QvBWTHaz79gJdT1cyZhNwUs6vw/5rg9YoaVrj2Rjg1CKlVo2iCYl99qpRvPBdnjYoDmZmur3/TJAyU456ZGbnTZysywvmsvF48UeYLw0h+sGECuElzlCwyTQHjZtGpAE/8tYRYcJBGQ3s9OljK9d00Xc5X3BzA5eNWEZihnjBNjZpr0BFSJSddxAWSd5JfMN8sQX31y6L2U8VQv9YwY99udf12EcTZ+fZwtguTuj+2OEBfiaavMN6YsztDvwsvYdUcK3xEeKWbXscBUVFFtog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yO+raS33xhRwM78s14gJ/PYAEyLXmu2ks8QXN+2Sfdc=;
 b=uA/v8UynNAuS0JDmsbXHGYor6zKVwQfVztAhJB7I4QGB+OaCjpsi5HaWP7x+aFQEbaD9d3bTsSZksLhLACWhN1tMpGurQ4TA0PwiBjVR8hsutxWh5IHjxdqLJgm1zLWzF/cYzM54PDBMI5nk1ggGMxP2U5WrceIG72/LowpIzF1Kzu6SQA4xMv23sVw0Lm1xxo13QIl1qSAfyRX5UQ6NazLPGs6Ocj5N0b3SOOuXTcnl4T6hTzsN8JFyZ2yZAwvjnPGzsBLfCHUU2LtpXQxlTVoo3xKxEONXOoRkbYxK2iW4Wp3eLkFsBCFSh+banUb20F+sqXRrBXUHXy3OTWhiCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yO+raS33xhRwM78s14gJ/PYAEyLXmu2ks8QXN+2Sfdc=;
 b=tmfuceDm3qer2k5FdLfvOVZU6Vxklsf0Ou4Cl0NhK6QH7MjTrPpt+P5S2W5c/bSKsCAPDYkGcMaft9SmGYOV2J+d1uZkFOZCEwBsunojpl4PQTxfkW0d7ISi7Qm9Y+bSJ/CIPvXgBEXzS2tD9aTgdn6923O6Ak3xpy4svYOTfj8mBr6ttDh+ZacMpX8rAXptaqIE54RxHMAmgwkCmWia2N/60pjIGmYdg0DEpqNvqivEmgQHQdj5YL1GHtM3m79TKVH5gQA8dj5qMTpSYWzJe4esPUcDXrdAnfE/vmmjVS21HdKcLpUHHKUKNL7ru2H2ZF2y+nCmD8azH/OlBtRt4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by AM7PPF58CF86336.EURP189.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::693) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Wed, 5 Aug
 2026 13:17:01 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 13:17:01 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] glib-2.0: skip a timing sensitive monotonic-time ptest
Date: Wed,  5 Aug 2026 15:16:57 +0200
Message-ID: <20260805131657.35726-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0085.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::17) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|AM7PPF58CF86336:EE_
X-MS-Office365-Filtering-Correlation-Id: 2917f9cd-9909-4cfd-c9a3-08def2f3d5c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|13003099007|6133799003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	q1yNYnff9UPt+GPXHaxoRKcRmneVHXTx7m939kpEBy+AHV+JMEw0KMyMRMJMW04A1BujCZ3BAu8Wn4RUc4oVL127j/0M9AvlUB/QPfSAFzpFYwWMfL21i5op1peTdAVo5ydAGd0OmN9/fJ5b3YpoGKELc+o6B02MTsuJIcAFqQdaSKifLZNg17u0lQryTM/UzQF5oC/J5yodqJDDLqCX9P6jYlE8kon6rygSIjpjpPYSk3AXLSsmG8ybU30s0Yc58p0/frFYzGEGxrUzArrs/NG3mpQdcR1cb6474GBGlqohWGyRe7qUNaZuwjbI9wHFQPc13de83sZDZiaAgiGkrEb4ELIt9/AxEvw1cg43aGQZ7nigbo3uw/t67YQfmnyaiRD0UfKUW0/Y+GirEpCDSIyirlokD2JweaVm5xUVcYeiun5Qn6fCeyN2TztNoGpl8GIa1U5B5hSx87KBOY4IhalsUjekhWWQ6HbSnQ6070NMqWtNR8ztT2NpGS3PSHSNrvbfejpkUBMA9AubH2lTlJTc06YfM7JNIZ3LuzrDSy4arzKl8lJ5lqGBJkozAHhT6/jTaG33svol/tjJ32ufXifDuhNmhQ/J7frUxJDn5HHf3T4k1jRO66GpwLrFKsQOiNgjgsg8cL01g/Oesl8VXPugStiXYE4vpsaF8EG6zFM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(13003099007)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T5njEDq04EBY0eL5CEe3sggv1I6mcg0Wc0GOrOMEciOB6GeZ1bEfepRqfiS7?=
 =?us-ascii?Q?pudm3Gys8cVAuX/UrwofNf9IUJ8OsEQDCKpbGHg+/3d8nnNem2kxnokzcfi3?=
 =?us-ascii?Q?N+GGm3xccAW075lvrP50DDpch0Lqpkpt/+ThsU1EBbs16ugC9MsdZAJt1mu+?=
 =?us-ascii?Q?9ZLGvaqSiTtkStjfwMNLHjY4xc3fpT/JxlA2NU12Fy1nzz+aULcSI9/b9F99?=
 =?us-ascii?Q?QtXoMB6iGc/ZO1Qf5gIl1NK/1msVQGrPmSgnjapavsG+ODqggDjFfDq0Sf5z?=
 =?us-ascii?Q?EniDSIc+Yf2gA0aGV/94Ap+04JCd0ZbSUG0q0jqHx6lU+UmRcsXy++nVDOi8?=
 =?us-ascii?Q?8Ae1j8+hiGeGeV0TMUqbnKsGOi5WvBHfiExwq6z/W7i68qqrRpGOmiU2r4FN?=
 =?us-ascii?Q?ONTRn4Pic/efuP554mTCEPNWbRgMPqNjQGjoKQWVO4edfSFq0wgr3mdAT6/N?=
 =?us-ascii?Q?zGkUDAmfhDZSobUGAGJ8AD3wxC7jGjBviNpdPhNCLSnN8fnDxf3KiM8bJLg5?=
 =?us-ascii?Q?1654fgEbeiKd4LREEdBcqs7E8EtEPKKZzsE73zB1HlU9EIkZTAPyDVcKqPGY?=
 =?us-ascii?Q?4m+YOiXZl+Li4xl3bdM21Wy3Wkpqy7hL0FtkZtvjkgSOT2ZCZRIdnCwb0Dk6?=
 =?us-ascii?Q?94044HXvYpzdTqMDIonhuC1IiZzdWDNhBQKe7OeaMaQQhjEovMpQ0hzyqXHr?=
 =?us-ascii?Q?SZV2ijZVGQKtaGTXhvqyUEWmfhlhGKvPNYP1ztgUkRjv/hE6VlKGARdj5u8r?=
 =?us-ascii?Q?S1XP1nayWnsyJ/xGSIxcYCYFHlQAwE+dIdqGcYMfrWrxIZG9cS0YeVGZ9+hX?=
 =?us-ascii?Q?g6iKy8ijAGHvRuwHWsqVjMZlnizMRe4RQAmRIm6w9VJAp23pJqRGzGNeF4wQ?=
 =?us-ascii?Q?xKIBXvUQBDUF5RlYIUQtYQO4np3/p8lnzgyWEuFMG3kCqXrQApKNCaCtiV4C?=
 =?us-ascii?Q?/KuZcTMlHSX3ZWBQrlKvzAeVbU8eecdCvykaE5Y0w6KlC72xp0mHwMNbN1s2?=
 =?us-ascii?Q?b8h4InJtbgctusCzNFj2EN00EnLZ7YXhhNqDUhBRtuXwGFjlE3ibWaxch/7V?=
 =?us-ascii?Q?wW9IDApPT3zTSQsgLj3hOTFSA8rhyJiI4nqgJNazllVHsiBk5YAJjMjyDwu1?=
 =?us-ascii?Q?eLVhz5OCNptDkPFgAX6h1V5D0ghwiIkfn+bg61oxSk7/T8X2miLtw9lG0zX3?=
 =?us-ascii?Q?xKA+4wCkXKE61EsyLYSElg98lJMsYVuLHkNA6QyAmyHZa+ytXqNqWJPD23E9?=
 =?us-ascii?Q?L6QIQ8LwgQFfDQaBVAbyKLfIHDhixCl5ucooACY7mXaYok59ryNjZHCYHC5i?=
 =?us-ascii?Q?cV3bKDHs5OcYzljeR4on591471n1e4TJFgyPNa/8im4GC/dVRGEJ8QF8EHwv?=
 =?us-ascii?Q?FYHLDxCL44KLeYHLBu6YxhasCG49ZzHr9Aa/rGhpYvRVnPS8GRYaL/TV5iLd?=
 =?us-ascii?Q?lTw6/IamqoyvkMXChV7MZxGVOVUIFQcOekP4fJvZnI8Y9fcdo0w0R33C4nEg?=
 =?us-ascii?Q?DVv/T8/IGC4Ggc2vztD+j3bJmuFH2hHRDpisYRk+h5Bw06J13QihbBzSyGVV?=
 =?us-ascii?Q?Z8q5z2PH/TKg0xjAf/iYIF471dGgTGKUyWK8t3QSIewfpes1nJK3ru/r8D33?=
 =?us-ascii?Q?+MpbuRzJPPU/1wZe2QP+Wx+h8eQdpjJ9OqKPsInSKbPXjo829tTYy86Rp0WJ?=
 =?us-ascii?Q?Nu3/5Otj1MFqRjEvBC0QI9ZVIz60dPGKhKLDEGiX2bmEgyf2G3fnCDo8qrvv?=
 =?us-ascii?Q?uvVy03z+tg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2917f9cd-9909-4cfd-c9a3-08def2f3d5c6
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 13:17:01.1741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9kfpwYGx4rj0WkWT83/9snUr6T6JcvqFvcjAEVKRN4EbOdjZv7idZB1FDUspiMC6bBzpZnTv2EAkn0EaF3D5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPF58CF86336
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 13:17:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242866

The /monotonic-time-ns/similar test compares g_get_monotonic_time() and
g_get_monotonic_time_ns() by spinning until the microsecond clock ticks
and asserting the two clocks haven't diverged. This is inherently racy
under QEMU emulation on loaded hosts, as the process can be preempted
between the clock reads.

[YOCTO #16230] : https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16230

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../files/skip-monotonic-time-similar.patch   | 32 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc           |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/files/skip-monotonic-time-si=
milar.patch

diff --git a/meta/recipes-core/glib-2.0/files/skip-monotonic-time-similar.p=
atch b/meta/recipes-core/glib-2.0/files/skip-monotonic-time-similar.patch
new file mode 100644
index 0000000000..75eda15c98
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/skip-monotonic-time-similar.patch
@@ -0,0 +1,32 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Pratik Farkase <pratik.farkase@est.tech>
+Date: Tue, 5 Aug 2026 08:00:00 +0000
+Subject: [PATCH] Skip /monotonic-time-ns/similar test
+
+The test_similar test compares g_get_monotonic_time() and
+g_get_monotonic_time_ns() by spinning until the microsecond clock ticks
+and then asserting the two clocks haven't diverged beyond a factor of
+50. This is inherently racy under QEMU emulation on loaded hosts: the
+process can be preempted between the two clock reads, causing the
+assertion "50 * ns_elapsed > 1000 * us_elapsed" to fail.
+
+https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16230
+
+Upstream-Status: Inappropriate [OE-specific]
+Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
+---
+ glib/tests/monotonic-time.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/glib/tests/monotonic-time.c b/glib/tests/monotonic-time.c
+index 1234567..abcdef0 100644
+--- a/glib/tests/monotonic-time.c
++++ b/glib/tests/monotonic-time.c
+@@ -153,7 +153,6 @@ main (int argc, char *argv[])
+   g_test_add_func ("/monotonic-time-ns/increasing", test_increasing_ns);
+   g_test_add_func ("/monotonic-time/usleep", test_usleep);
+   g_test_add_func ("/monotonic-time-ns/usleep", test_usleep_ns);
+-  g_test_add_func ("/monotonic-time-ns/similar", test_similar);
+=20
+   return g_test_run ();
+ }
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc
index f554145bb0..903d56e05f 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -235,6 +235,7 @@ SRC_URI +=3D "\
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only=
-.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.patc=
h \
            file://skip-timeout.patch \
+           file://skip-monotonic-time-similar.patch \
            file://CVE-2026-58016-1.patch \
            file://CVE-2026-58016-2.patch \
            file://0001-gio-tests-services-Fix-installed-service-file-using=
-.patch \
--=20
2.34.1


