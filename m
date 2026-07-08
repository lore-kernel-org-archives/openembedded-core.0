Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3374C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 12:01:26 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6563.1783512083596861226
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 05:01:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=wzA0BOV0;
 spf=pass (domain: est.tech, ip: 52.101.70.69, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WpOtE5VKweUp3VuuvdLPY3Ld4jE2isK/zYNN2G73ZDzsbCbrvQMHQCjxWL93+a0fvHBb4Bu7Z2c9ndRNBU4ePq62z9mJuK1jgylmoEKB32RgVidTZHHTJslqRIyMFBN3YQ4ycEtRJis5ZgvLu+WOsFsM870XyX1uS3h+w0OptZGI3rAb1xv9E4ejEPVlCWacXMp5grjRPgEPJRUvSFD+N950gh5MhUhElCwOPQspD+k4dVFsBsVo8pIw1K8PZC/CjGU2Zc4zLG7Vd6n+btiy7d7iK6MOw+/YXTAk03uJO+dtQfHNuaH1SfL6zU1/+0e+Tkr2SmiyIwbp4H2/xN0XXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1EIWnBmcwyVrVUkY2FcHXPhhp6tPrvaY5UWmW6/wWk=;
 b=B1wZQkEezclQlL0rGfvk6+sTeYTrU8xX/olyQkIB6v7ZgFNhh7XTu0u6YZwQmOYcgXaAlKFbYFH3HQBwVYuxZjvTiV71j1AAT3I3uL+pcZPEE/El0Zy6i79HlyHiFU/9td9nPfofbaog01qaOFDTQeZsatesmWl4wFI0ng1ok3lLB8uoyavxMi41vwbo+z5QUpypujdHdtz3sDWP14+ow2ACgdXHW6WIbQdyphvponQ9sT2Kfy+dCed9NSlWV4pEz7VYSwy2wBw/52fwXCYNgnzdEAzVLe4GNElUNeml+k4d7JIfAuxgQbVOhJ6oDG7P7+WG99/RO6fhmdJ6JP3nnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1EIWnBmcwyVrVUkY2FcHXPhhp6tPrvaY5UWmW6/wWk=;
 b=wzA0BOV0FO6DWmwciyb6WJnmXusU42deDPVjqW6ICauROVDWRKbUORSKAslTbY6kMQerYX9Edff7kRQ2U6EPKDcL+RWHyU+L9mEQ6N52nUjd6ZpCiTaIDu46927lSqcde/KQlO+jiyTRacldUxj5GtpreeX2luFrLZJvCMXJb2t4Q94GsfUoRaWEU07lHBkNpyHXf5ftFrfdhdhA06ikTyWHxskITGnOb217IvmAb/eoq9Uy4sVZH+A20tU/NXOEx64q1j483OARAIJEqdzaNIASLhm8tONj1Dm98aUCkPatE2rosVyNk2Qw5x5m3op8+249/sHmyMDxOTnxEIyrLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA4P189MB1165.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:c8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Wed, 8 Jul
 2026 12:01:19 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%8]) with mapi id 15.21.0181.012; Wed, 8 Jul 2026
 12:01:19 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH] glibc: stable 2.39 branch updates
Date: Wed,  8 Jul 2026 14:01:08 +0200
Message-ID: <20260708120108.73199-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0086.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::19) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA4P189MB1165:EE_
X-MS-Office365-Filtering-Correlation-Id: 002de8ab-9e47-4c87-b07e-08dedce89f17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|18002099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	k5vT4Afc0yMCtXMzS/V5K9BJKiT8fwdLYAzS+mafywfbin9dR4rkqCr65sqgMJnLeRvX+kRicpgSm03p75wEpChBvSHucO7DpQT/l+r3+S3UGGyKjHf2wT2KqgNxopFZLBx9e45BeYMIMae0tCaLvlZbPQV4SW+tB3pUiTLbgNAWhORIs7rgdeKcOwUtlFuzzuWxwYBBdR8dWZQ5dopayDJhrB0ddWYklz8AoRmTT454DaMJi3moZw+gh7B9WNF041HuJJ5bnp0+MTwi32qgN/Q788nNmXzw71583H9SKufb/nvUwsby0BgDYgmxsEHA5H2/xl9SnaNIDmuAWHBWyU/8reeKryfS+EAAEwuk6m0R9mWFUYdppyraNQa/Q/ZLOcW3FHPrDyqCDKweFR6jMKKzfz2W5FLGwrVuEtfYU4ydCZUKXWRengLwrHagzxrdzA+9dLKRY6eODLHmOPSWsfW6CEF5yzfs0tRzmiALP+xhGP96MLWAG5ClNHGk0mvc/p98t0KDTzYBUjHwKrKACNq63fiCB3Q/nu8AkANR0fE/5QtiFJmcQdLvT8G+i/ivChXzTI36zKdWSO+3h/QAQVuj6FKAx5vxBtqIPh+YHrz2u7+siwODFa9gYLvok2WD9wofnMvXML/HWXituz1S8bWpjTqjblsmwfyHU3oB0SY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IbdPlicEdXiDILkBhCuse+PF9pce7NpxVDTTr4X4J/8pw8WFRsscvJ4Iu+Fy?=
 =?us-ascii?Q?yBXAB5q0lMI25BvVov4tagRRRA7y9AOSExQlEVrcPLTbKjCftXaN1az/tCOe?=
 =?us-ascii?Q?XbNutibyTGF7FHSC0sJoELTrOpJk7EY3b6pvkfvyT0sFUhQYP9RC1g/4C+dU?=
 =?us-ascii?Q?RXU/0oISFjn8WLur7unKbF4Z0bz3FfmBaCzda3ZYrpn2nL/P9idKba5Zby0u?=
 =?us-ascii?Q?6seSKzHgllU6uuinPkKDII+vGEggvphAQvYOJY9gEDUy5ilDdqO4uoW6yKES?=
 =?us-ascii?Q?/bGi8PjkEOh+dkyDGVmtjYLCAOwtPJg5IZiZxKUg5MgIl/G6yr1bnVbJYqrq?=
 =?us-ascii?Q?b5InFPhkbiwo2sYX7rhvq2ZkhfHoZR1ss8aD/RwahMdLKr3FufDnZbxuhGtW?=
 =?us-ascii?Q?JTVjil7NlLL6F8KPKKH2F66JmY0CxCq8S/omjqPVdUbSZSCslb+pzKlx0jb5?=
 =?us-ascii?Q?2aPOhyuFyaVc6f9RMqtp0GzVR8j4rSYbPUfB6FHovF1a61IOj83QMD6jd7gN?=
 =?us-ascii?Q?5T4eQDoeEmjzBMp4eYu9UUWPTADJtsqUIhTKeKqg177YpXyJRhxYTQq33xKH?=
 =?us-ascii?Q?l7K421gIg+MKPCdwz+l8NEWj/UFeaf8xGAA9wCQh38uuXIulZ5Bt474YTRvb?=
 =?us-ascii?Q?9XKKNugIF9DVO4ND/4LdzB51HiBRMwifYr7khxeYo6uJeuym3F56LLbMDf9U?=
 =?us-ascii?Q?S7E3q4FAhmB+A0gHdnj2E5J04R/SqsGcttmr98fuXE3a0VoAA/LzMCmOaf+v?=
 =?us-ascii?Q?rKMKDazhEwB+UEeKYwY/Lfcj+02nTlTab3+MVlbza3BRXOCd88b9YD6cFM8N?=
 =?us-ascii?Q?5lQKxNdTWc2r5xQOSaRL+EDk1R3JhWkUs9JUSwIc7wea0wU8ysQb6ZClhxjz?=
 =?us-ascii?Q?MJli8gHNRF0k7PtOJjxJqc7en/Kv50uE1gmR9JPl/vjWKcLvLzTlAIX2UY+C?=
 =?us-ascii?Q?Ydib9a8lYe2R1pmwMy+ztmdDD0SIoEAnRGdh9ce7Pv0xXtIpZb8v1ax72oyY?=
 =?us-ascii?Q?5FaVVGlbVHfol5nFIM5vblActG78ig2eJKWm/KOHvhQjumYGVFqEFFDPRaOy?=
 =?us-ascii?Q?WOCCFtSZXc8h/r0i3uvvev/V6rvTVPBJ0rT++NgdVvwZhTy2MR5MLKWyr6JD?=
 =?us-ascii?Q?YOGkVL4ajYtkc/NkUy7I0aYnFsged6eBrxHGyyxvQRTfkN2J/UF4mio61kwY?=
 =?us-ascii?Q?wtXxTzsnVnz7zWGpBc4xdGpRJ5aaUs9PGpiSD8SrQSwWqv5p4nAIUjDnMlh+?=
 =?us-ascii?Q?ranEjL3OlOU800xWafqJGk53nAkV4eZ7kwq3luFjLPHPhNTZ7VrgErVMHq9f?=
 =?us-ascii?Q?AHwewAdrM6Zrwz5/mE+JdGNsjSr/IhIcrjNs2D9syU1prPhyiP/bjmvhzi9/?=
 =?us-ascii?Q?xX0peutsiB7+yQ4X1Hpt0ooir+mMgMiyhCrqweUOACXMBjxqp3Y+oFUBns82?=
 =?us-ascii?Q?40++TV++LklPTtCJG+ozOuIHpA6XgQoYL8eIM2HFBsywaI5avuDEiTUEVLTf?=
 =?us-ascii?Q?wz1hpL/n0i9xXrAHnHCk36a9reir100hikUe25epa9PjfOCS+9vNdcUnVyxX?=
 =?us-ascii?Q?zWCZwovdFITWzx3oz7zn2u6C6O72PEE/JrLiCAfvtuk7bXpXvElVe/4Rkfd7?=
 =?us-ascii?Q?SCSONUxyUzqIA+Yy6HTAEVesGumWc/pocLWgq4IUy4lUhih6ENbqN8iVnvjW?=
 =?us-ascii?Q?Ufdtjq8JkdQBVPfUUpPafEzi/dbU0GVU19U17bo65DV0wwJ4tkiqcNYzpNS0?=
 =?us-ascii?Q?0nCUB4ZzKHQ7IuXcKkJPu2ZgyFNimv0=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 002de8ab-9e47-4c87-b07e-08dedce89f17
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 12:01:19.3821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCXPmu7Vagdb7p/NhbiM0loLcY2COCyN5ILwlF45hM5qD4hbAEpnIRpE/iaoH/fnqiZQnRM6pkyUXbc2w9dWyF/Hoq6z70SFySgBtmZOr1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P189MB1165
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 12:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240478

git log --oneline ce65d944e38a20cb70af2a48a4b8aa5d8fabe1cc..be1e627cd72db31=
161a3b4ce1c8114674f0895eb
be1e627cd7 Linux: Only define OPEN_TREE_* macros in <sys/mount.h> if undefi=
ned (bug 33921)
98bc06a361 include: isolate __O_CLOEXEC flag for sys/mount.h and fcntl.h
3e13579841 Use pending character state in IBM1390, IBM1399 character sets (=
CVE-2026-4046)
0dc95ae109 elf: parse /proc/self/maps as the last resort to find the gap fo=
r tst-link-map-contiguous-ldso
9344c796f7 resolv: Check hostname for validity (CVE-2026-4438)
5663ab0b83 resolv: Count records correctly (CVE-2026-4437)
c53cd6e738 posix: Run tst-wordexp-reuse-mem test
2760e4c5ed iconvdata: Fix invalid pointer arithmetic in ANSI_X3.110 module
ba29a36aa3 posix: Fix invalid flags test for p{write,read}v2
60b039bf6a socket: Add new test for shutdown

Testing Results:
             Before    After    Diff
PASS         4892      4896     +4
XPASS        4         4         0
FAIL         371       372      +1
XFAIL        16        16        0
UNSUPPORTED  224       224       0

Changes in testcases:

testcase-name                                before  after
posix/tst-wordexp-reuse-mem(new)               -     PASS (native)

[Note: posix/tst-wordexp-reuse-mem is a new test added by this uplift
(c53cd6e738). It fails under QEMU user-mode because the test-wrapper
cannot support LD_PRELOAD and MALLOC_TRACE needed for mtrace. Running
natively with LD_PRELOAD=3Dlibc_malloc_debug.so confirms the test passes
with no memory leaks.

nptl/tst-getpid3 is a flaky test under QEMU user-mode (passes 7/10
re-runs). No nptl code was changed in this uplift.]

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.39.bb     | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/=
glibc/glibc-version.inc
index 03a8e5d01e..5d57dafed0 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?=3D "release/2.39/master"
 PV =3D "2.39+git"
-SRCREV_glibc ?=3D "ce65d944e38a20cb70af2a48a4b8aa5d8fabe1cc"
+SRCREV_glibc ?=3D "be1e627cd72db31161a3b4ce1c8114674f0895eb"
 SRCREV_localedef ?=3D "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
=20
 GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dhttps"
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glib=
c/glibc_2.39.bb
index 7958d64eed..f6be1b5fc9 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -18,7 +18,8 @@ easier access for another. 'ASLR bypass itself is not a v=
ulnerability.'"
=20
 CVE_STATUS_GROUPS +=3D "CVE_STATUS_STABLE_BACKPORTS"
 CVE_STATUS_STABLE_BACKPORTS =3D "CVE-2024-2961 CVE-2024-33599 CVE-2024-336=
00 CVE-2024-33601 CVE-2024-33602 CVE-2025-0395 \
-    CVE-2025-4802 CVE-2025-5702 CVE-2025-8058 CVE-2025-15281 CVE-2026-0861=
 CVE-2026-0915"
+    CVE-2025-4802 CVE-2025-5702 CVE-2025-8058 CVE-2025-15281 CVE-2026-0861=
 CVE-2026-0915 \
+    CVE-2026-4046 CVE-2026-4437 CVE-2026-4438"
 CVE_STATUS_STABLE_BACKPORTS[status] =3D "cpe-stable-backport: fix availabl=
e in used git hash"
=20
 DEPENDS +=3D "gperf-native bison-native"
--=20
2.34.1


