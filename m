Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545D8CA5FED
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 19:38:01 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3608.1791315473997337857
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 12:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=AMQ8+HLM;
 spf=pass (domain: est.tech, ip: 40.107.130.70, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWk82WaA84/n8pX6pE+GLBNusscWoejhrwnoXnurUvnMP7Gq9YU6n217L9fVA6vA+MNFAXbtmqPg4E+nSE5s7gCDi3cNSr/3UXsgXn2bLAMKl9I1vLRjQUvu1x41Kb9itIo5MYNifR40K3nzrvRl6L9bvwsJz6/Elj5dUZv4S2KFhVm9or6qd1mGBB1jiZlph243KWv4BSBLVtxuR5sQNA75tLsIQqdt1OuVOQvkDNLH54TMErdvMbIlfepYet3ACVTD/TFu1p4wyjGgQdkW2ejcQfg5I1lE7yR0b4oJSgijeVuB+/CZIe5tA2vFaH0qatAgaMiRqYERcJ6pR8pDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxEL61+3DuGbwgu5kyDMstTw69v6FECJark/hC0uXmY=;
 b=MaoTQZKfbOcANy2S8djEgQsrHTrJrxaDZ0w4BNW/x//PnBRZ6g/BwjUDLAdQSbJZ3b33ShAmInlLAgcRznY+WF2ydgJI+zWXZgFtSY9CPSyHVSOY1VKIIGMfReWKSWiStI3Q5/yOxRi0oF1CnBaP1y3kzMY057sMa8A3tbpWTNu6el3y9Rj633xku7YSLZNoV5Br9m2J/01F2LMJDpeZYwWfZaCU3J+tZuikXl9q1XiOyzvKZBTvr/OZhdI2/hnWWUn8JpW+hHgiyoliMpwfy1wFP51UnfZ7pc0TZTlM2Z81q/F+I/xvhryUXkv4E4f+bahuyBH0vVb0jri6pQsEkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxEL61+3DuGbwgu5kyDMstTw69v6FECJark/hC0uXmY=;
 b=AMQ8+HLM2t4H/ELLrQG2Z6ork+aH3TSOrt2iWaVNkziVowa0nEZbXffEuwkRgixlUPCxvJMJvX6EkkWNjF37zufai9z7e1S54H9QL/UMbER8zHOn9zoFj4HM/w8lCroD7cCHcQ8uTu/4C4jrJBLDcZj75c//QYXTFpDx0MrmTigO5ZS7nDXCVFgbANdxUEf3aLtizZRrJaDSgfs1gBCg7u+ObMkrKKxQweMOrdeii+0VER9Y4p9A7mQCQyxgeuyZXAcer+Y8jyCFkdHb1vmnqm3Ad0HqM9S3bDCmhlz8FztJNmpJ5zmH9E+PXOWwffac5aXd3JAd22itV66gKuLT0A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV2P189MB912416.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:3b9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Tue, 6 Oct
 2026 19:37:47 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 19:37:47 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4] systemd: Upgrade 261.3 -> 262
Date: Tue,  6 Oct 2026 21:37:45 +0200
Message-ID: <20261006193745.45263-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260928113956.42485-2-jaipaul.cheernam@est.tech>
References: <20260928113956.42485-2-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0665.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::16) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV2P189MB912416:EE_
X-MS-Office365-Filtering-Correlation-Id: 50022184-31ba-4019-0c6a-08df23e14c9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|260925021911599003|260925021311599003|260925022911599003|11063799006|6133799003|3023799007|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	EZWInxdqa/wemE1f0e80xjKaynVSs5T5JNxcHSTkpHgRjbBsBz1ZlQL6spkYwn4GxJogQ+0bdhy1cgSitSrCLYKyLMi5QiWM+dIUixRziq7VbEtr72VEbORKsU/VFAF13PXgJSrlPYnSWi1IO01L8ip8uxafFIwN+MIPG0ThYyi4zT55v9zg9rBvtNwqXoXruPfqUOJ36qyFkW1vswgoDYxwuaTDbs2ZZAV8NEW8cjA4v6eX2wYR+UORUU1ejT9vyM1Kf9G25Vm4PZuW9ldVIRQkS0aZdPNqskvQyeZqpac/pN4J13dKNwU8UQj9LQvXE1ujh6Qsd29akEn9QgdK7NBf6lL72CL/TGM25cfs+L3DYT+8uPQb08wfNvg4FajaN6S4MjgA+Fa7BfT1JWBnNAoRJJB+zRyjhuQPm4QNY+QIvhZhelpzzPdLK703yhsj68i0WBi4BwvxJiDdhJa6aTXBo1/KklqG8Hxne9XI7A05H8VSjepUFrqZk9FPUmPjgnuqTDvZyfEEjTt+DN5LaeNTbfV7Sk4sx58sfmg8RM/3qm71djOWy7eHVZTnUavpxl6D0KjqDuhAaQJUSHBUzG/c3ws2Ah1VQc64C4MA7KPhp57+NzE6nnHePI6GcbuE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(260925021911599003)(260925021311599003)(260925022911599003)(11063799006)(6133799003)(3023799007)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+R/dk6elKEeCSH0ca6KnlWwtVQUfLUN8VaON5G2/5Shzy8vKoXZ6mE5HxPoL?=
 =?us-ascii?Q?MTLJPwt+SkguCE6yaGRQCzdfH6RR4gelkoA1ZDjPyoQ9sql5kmMrxez+4Jdt?=
 =?us-ascii?Q?4McCiD2TVvxrDHMyFXeaB5vmgDrcO01nNGuifCNampGDCTfgQ3SLzDiL5Cu4?=
 =?us-ascii?Q?CzrktQMKO2ejjStnxv8th8uXbnGxAUi5ipPgsjkDcMcFEZiXJ+M/DMU/T+W4?=
 =?us-ascii?Q?r4y0kUiTZrwPk8ndD56qD0cbhMfxu1CXpKGljICU5I4gjFON6DSBHrF/g3Tp?=
 =?us-ascii?Q?FscOXAU9BK4XFS1Nv3EjCJmtb6h0yY0OBX/HV25vhVVYapoW2Ajmfi4tBZ9r?=
 =?us-ascii?Q?cMK+AVvos3dztct2+Uyj8t3XJnI0CUkAVopi3rDpLkZdQTOyHdk+FVd6926f?=
 =?us-ascii?Q?mJBzEvg+tTvkz6qAbIpfc9kpG98aDksJXuC3xmr8nFCTxFcCVffpzmPyTDmu?=
 =?us-ascii?Q?aQK1qWJaUYUhz+qMrgHjZFNXyhCTf2I4Ptc/tZlk/pIASpUFe35ojYLdhasv?=
 =?us-ascii?Q?U89UcU/UwmslP9N9J3xvL1m3jCCzNkErci0P/8a2csRVrLUBWdWMGsB8Ddq5?=
 =?us-ascii?Q?4FSvbT5mYGAyESPsrb6sffaF7TBHp/bI5z8Kq1F9/ZeI46lbfYPwuot3hJQ6?=
 =?us-ascii?Q?ZF2dDtHTfWR9Emn28H1tzQWFEub8d47+MI4NX9bIwb6tZys9xIbzKCpo6Lma?=
 =?us-ascii?Q?xJ/7sem8ak0bK1xz5rgMXI7HkPXPc6Bq7ylV+O5Vj0mZvVQAh9a1DXzq65O2?=
 =?us-ascii?Q?Kmdo60fVrDJTyVQSowP66zlHeI2CM7tH1+eZsYWBlM6mUCnOZCqEFc/0PbSH?=
 =?us-ascii?Q?LA5Ibg0Ge+KmyxMtvXoA+W+aXkEllO/jC2hkPpKkS2cEDj/a5lhlJieXAV0h?=
 =?us-ascii?Q?7bdvtyU2PSS2OJXyhaoYQe9protfTJlRt5/D6JSMjHWj3Mnss52GLHRCK+8m?=
 =?us-ascii?Q?rMub/1Zv17X7ypxCd8BlHlrIC5O2QNIchjY1sqRnS9rSihazpjYd1pWdZ7XZ?=
 =?us-ascii?Q?iqvA8DxY0EluE4521hg3wwX5XSa4F96H7t8lOWTDpmwG7bBEpdzNQwShO0YW?=
 =?us-ascii?Q?neXTqwsLgMBlrMOxFdOjFtJVN1q0sjE5xb4QZ7kbZQoE+ksbUInkYdn/zB7+?=
 =?us-ascii?Q?xro6fLe1GhtCDYHnSCxadwHstZjmaLVChMv0WJX77xQ3abNv0vFN1y67iwqA?=
 =?us-ascii?Q?Q+KL2LXk4qCCPq4HC9V7zkHNIu6B9HCR0u0xNN/tR25SY2jaz21hfSXTOVcD?=
 =?us-ascii?Q?S25IAOeJsd8kEirV/b4SrRAgLAxVdcmmdIBxus1qT2RB48epPnXfOOJz1kDH?=
 =?us-ascii?Q?ZlquBN2T5ncdduPuAOxDVWAQw5CYtLmmn/F7vcMSxfnZ6qQv/YD4HbE5mzGB?=
 =?us-ascii?Q?ELhbXoSypl4xnhIAHNP4VEMHmIRvVijGz6atMfahFGOnGq6AT6UfU+J5KEmz?=
 =?us-ascii?Q?xy5hutx1pjbM3GuxlIVYoTebXt10odNC9QXZtNhyUeUpGg3g0AEkhCdwXIBl?=
 =?us-ascii?Q?NqTwsBOuROG0JD8riEoPVvWctZhoT58VI2L8VrFLTZrTNV8lFNRKjOmJUFYf?=
 =?us-ascii?Q?tepaqtXR47ko32PdN/rwsAE6ZflPGfydlFvwpb44fwA2yr74EUIvRncNKlg9?=
 =?us-ascii?Q?Rh8B6EA/zuWmUp05j4j0UAa3w2fH1ya2tPp36KEq7dbv20oAxZigo5072hbz?=
 =?us-ascii?Q?QXxE1vfwfq30+a+f8+UsytWXkCa54RVCeE/SHCKkNFu2NKjrK6cyXUH+FJvy?=
 =?us-ascii?Q?8zn9tluUlt5z3vuntoKNV2L/6YpmFCk=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 50022184-31ba-4019-0c6a-08df23e14c9a
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 19:37:47.2058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GSLIKkKP7s3AgS32t5dCFjxS2tRqPmxcjt3N2bf0Ht9qmq8RDPm07brBqIAER2LnNWY2mLih7QY6CO9aQOw/3dqQzp1R57mXlQj6JnAeYJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB912416
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 19:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247326

NEWS: https://github.com/systemd/systemd/blob/v262-stable/NEWS#L3-L877

- Refresh patches for v262
- Drop deprecated meson build options [1]
- Drop 0001-include-fix-limits.h-override.patch [2]
- Add rules: install 60-persistent-media-controller.rules [3]
- Gate systemd-coredumpd.service on kernel >=3D 6.19

  262's systemd-coredumpd.service needs PIDFD_INFO_COREDUMP_SIGNAL (Linux
  6.19); on older kernels its ExecCondition fails and the unit flaps into
  start-limit-hit, failing test_systemd_failed on qemu*-alt (6.18). Add a
  ConditionKernelVersion=3D>=3D6.19 drop-in so it is skipped on 6.18 and ac=
tive
  on 7.2. Upstream report: [4]

[1] https://github.com/systemd/systemd/blob/v262-stable/NEWS#L41
[2] https://github.com/systemd/systemd/commit/6a131b32e0fe948e845ae4bf41f8f=
ed003ec30ce
[3] https://github.com/systemd/systemd/commit/d153b49473
[4] https://github.com/systemd/systemd/issues/43963

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes since v3:=20
   - Trim inline comment
Changes since v2:
   - Add conditional kernel version for systemd-coredumpd.service

Changes since v1:
   - Drop 0001-include-fix-limits.h-override.patch

 ...ve_261.3.bb =3D> systemd-boot-native_262.bb} |  0
 ...temd-boot_261.3.bb =3D> systemd-boot_262.bb} |  0
 ...e_261.3.bb =3D> systemd-tools-native_262.bb} |  3 -
 meta/recipes-core/systemd/systemd.inc         |  4 +-
 ...tall-dependency-links-at-install-tim.patch |  8 +-
 .../0001-include-fix-limits.h-override.patch  | 74 -------------------
 .../0003-Do-not-create-var-log-README.patch   |  2 +-
 .../systemd/coredumpd-kernel-version.conf     |  4 +
 .../{systemd_261.3.bb =3D> systemd_262.bb}      | 13 +++-
 9 files changed, 22 insertions(+), 86 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_261.3.bb =3D> system=
d-boot-native_262.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_261.3.bb =3D> systemd-boot_=
262.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-tools-native_261.3.bb =3D> syste=
md-tools-native_262.bb} (93%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-include-fix-limi=
ts.h-override.patch
 create mode 100644 meta/recipes-core/systemd/systemd/coredumpd-kernel-vers=
ion.conf
 rename meta/recipes-core/systemd/{systemd_261.3.bb =3D> systemd_262.bb} (9=
8%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_261.3.bb b/meta/=
recipes-core/systemd/systemd-boot-native_262.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_261.3.bb
rename to meta/recipes-core/systemd/systemd-boot-native_262.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_261.3.bb b/meta/recipes=
-core/systemd/systemd-boot_262.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_261.3.bb
rename to meta/recipes-core/systemd/systemd-boot_262.bb
diff --git a/meta/recipes-core/systemd/systemd-tools-native_261.3.bb b/meta=
/recipes-core/systemd/systemd-tools-native_262.bb
similarity index 93%
rename from meta/recipes-core/systemd/systemd-tools-native_261.3.bb
rename to meta/recipes-core/systemd/systemd-tools-native_262.bb
index bffaf5a2f08..359bc972ccf 100644
--- a/meta/recipes-core/systemd/systemd-tools-native_261.3.bb
+++ b/meta/recipes-core/systemd/systemd-tools-native_262.bb
@@ -18,9 +18,6 @@ EXTRA_OEMESON +=3D "--auto-features disabled"
 # Link the binaries statically as we don't install libsystemd-shared.so
 EXTRA_OEMESON +=3D "-Dlink-systemctl-shared=3Dfalse -Dlink-udev-shared=3Df=
alse"
=20
-# Ensure unused build paths are not in the binary
-EXTRA_OEMESON +=3D "-Dsysvinit-path=3D -Dsysvrcnd-path=3D"
-
 # Target-absolute paths that satisfy both tools from one meson configure:
 #  - systemd-hwdb needs prefix=3D/usr so the compiled-in UDEVLIBEXECDIR
 #    (/usr/lib/udev) matches the target rootfs layout, letting
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/syst=
emd/systemd.inc
index 7b82c930836..3efc48f65bd 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -13,8 +13,8 @@ LICENSE:libsystemd =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3Dc09786363500a9acc29b147e6e=
72d2c6 \
                     file://LICENSE.LGPL2.1;md5=3Dbe0aaf4a380f73f7e00b420a0=
07368f2"
=20
-SRCREV =3D "3255daee1572366b74fe92f002a3d60ecbb27103"
-SRCBRANCH =3D "v261-stable"
+SRCREV =3D "8cc40e0c5e9234bf45084751ac53b1fbfe70b492"
+SRCBRANCH =3D "v262-stable"
 SRC_URI =3D "git://github.com/systemd/systemd.git;protocol=3Dhttps;branch=
=3D${SRCBRANCH};tag=3Dv${PV}"
=20
 CVE_PRODUCT =3D "systemd"
diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-de=
pendency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/000=
1-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index b83803aa08e..0b9eb4ac3cc 100644
--- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependenc=
y-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependenc=
y-links-at-install-tim.patch
@@ -1,4 +1,4 @@
-From 451af4755f0c1da552498682d910f4f4c5209639 Mon Sep 17 00:00:00 2001
+From 4793a67d3d738520f0193a9edff491989e8d77bc Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 21 Feb 2019 16:23:24 +0800
 Subject: [PATCH] binfmt: Don't install dependency links at install time fo=
r
@@ -25,10 +25,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  3 files changed, 7 insertions(+), 2 deletions(-)
=20
 diff --git a/units/meson.build b/units/meson.build
-index 27d8ef2f72..864caa44bb 100644
+index 9f8f8d0e41..9a74236690 100644
 --- a/units/meson.build
 +++ b/units/meson.build
-@@ -168,7 +168,6 @@ units =3D [
+@@ -172,7 +172,6 @@ units =3D [
          {
            'file' : 'proc-sys-fs-binfmt_misc.automount',
            'conditions' : ['ENABLE_BINFMT'],
@@ -36,7 +36,7 @@ index 27d8ef2f72..864caa44bb 100644
          },
          {
            'file' : 'proc-sys-fs-binfmt_misc.mount',
-@@ -279,7 +278,6 @@ units =3D [
+@@ -283,7 +282,6 @@ units =3D [
          {
            'file' : 'systemd-binfmt.service.in',
            'conditions' : ['ENABLE_BINFMT'],
diff --git a/meta/recipes-core/systemd/systemd/0001-include-fix-limits.h-ov=
erride.patch b/meta/recipes-core/systemd/systemd/0001-include-fix-limits.h-=
override.patch
deleted file mode 100644
index d11a5fe3f82..00000000000
--- a/meta/recipes-core/systemd/systemd/0001-include-fix-limits.h-override.=
patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 6a131b32e0fe948e845ae4bf41f8fed003ec30ce Mon Sep 17 00:00:00 2001
-From: Yu Watanabe <watanabe.yu+github@gmail.com>
-Date: Tue, 22 Sep 2026 01:55:01 +0900
-Subject: [PATCH] include: fix limits.h override
-
-This is especially necessary since GCC 16.x.
-
-=3D=3D=3D=3D=3D
-$ gcc --version
-gcc (GCC) 16.2.1 20260819 (Red Hat 16.2.1-2)
-Copyright (C) 2026 Free Software Foundation, Inc.
-This is free software; see the source for copying conditions.  There is NO
-warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=
.
-=3D=3D=3D=3D=3D
-
-Without this change, /usr/include/limits.h is not included, hence POSIX
-constants are not defined:
-=3D=3D=3D=3D=3D
-$ echo '#include <limits.h>' | gcc -E -H -isystem ~/git/systemd/src/includ=
e/musl - 2>&1 >/dev/null | grep '^\..*limit'
-. /home/watanabe/git/systemd/src/include/musl/limits.h
-.. /usr/lib/gcc/x86_64-redhat-linux/16/include/limits.h
-... /usr/lib/gcc/x86_64-redhat-linux/16/include/syslimits.h
-=3D=3D=3D=3D=3D
-
-With this change, /usr/include/limits.h is included, thus POSIX
-constants are defined:
-=3D=3D=3D=3D=3D
-$ echo '#include <limits.h>' | gcc -E -H -isystem ~/git/systemd/src/includ=
e/musl - 2>&1 >/dev/null | grep '^\..*limit'
-. /home/watanabe/git/systemd/src/include/musl/limits.h
-.. /usr/lib/gcc/x86_64-redhat-linux/16/include/limits.h
-... /usr/include/limits.h
-...... /usr/include/linux/limits.h
-.. /usr/lib/gcc/x86_64-redhat-linux/16/include/limits.h
-=3D=3D=3D=3D=3D
-
-Replaces #43824.
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/pull/43831]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- src/include/musl/limits.h | 20 ++++++++++++++++++++
- 1 file changed, 20 insertions(+)
-
-diff --git a/src/include/musl/limits.h b/src/include/musl/limits.h
-index 9620a3b0ac..bcc585be2c 100644
---- a/src/include/musl/limits.h
-+++ b/src/include/musl/limits.h
-@@ -1,6 +1,26 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- #pragma once
-=20
-+/* GCC introduces a spurious, tricky inclusion cycle:
-+ *    GCC's limits.h
-+ *      -> GCC's syslimits.h
-+ *         -> GCC's limits.h (again!!!)
-+ *            -> glibc/musl's limits.h
-+ *               -> define POSIX defines
-+ *      -> define ISO C defines
-+ * This works only when GCC's limits.h is included first, but a user over=
ride breaks the cycle. Hence, we
-+ * need to manually achieve the cycle here. If GCC is not used (e.g., Cla=
ng), then including the compiler's
-+ * limits.h twice should be redundant but harmless. */
-+
-+/* First, get the POSIX defines from glibc/musl's limits.h. When the two =
macros below are defined, GCC's
-+ * limits.h includes the next limits.h, that is, one from glibc/musl. */
-+#define _GCC_LIMITS_H_
-+#define _GCC_NEXT_LIMITS_H
-+#include_next <limits.h>        /* IWYU pragma: export */
-+#undef _GCC_NEXT_LIMITS_H
-+#undef _GCC_LIMITS_H_
-+
-+/* Next, get the ISO C defines from GCC's limits.h. */
- #include_next <limits.h>        /* IWYU pragma: export */
-=20
- #include <assert.h>
diff --git a/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-R=
EADME.patch b/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-=
README.patch
index 175ec7955bd..c64bfa82491 100644
--- a/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.p=
atch
+++ b/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.p=
atch
@@ -1,4 +1,4 @@
-From 0d4a5976056387ff3801fdb7f53e6d0760df0475 Mon Sep 17 00:00:00 2001
+From e36f6fc852f8331791f391a216885b9bea543aff Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Tue, 21 Jan 2025 05:02:00 +0100
 Subject: [PATCH] Do not create /var/log/README
diff --git a/meta/recipes-core/systemd/systemd/coredumpd-kernel-version.con=
f b/meta/recipes-core/systemd/systemd/coredumpd-kernel-version.conf
new file mode 100644
index 00000000000..38ea613da94
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/coredumpd-kernel-version.conf
@@ -0,0 +1,4 @@
+# Requires the PIDFD_INFO_COREDUMP_SIGNAL pidfd flag, added in Linux 6.19.
+# Upstream report: https://github.com/systemd/systemd/issues/43963
+[Unit]
+ConditionKernelVersion=3D>=3D6.19
diff --git a/meta/recipes-core/systemd/systemd_261.3.bb b/meta/recipes-core=
/systemd/systemd_262.bb
similarity index 98%
rename from meta/recipes-core/systemd/systemd_261.3.bb
rename to meta/recipes-core/systemd/systemd_262.bb
index 0901736e7c9..d613f01c582 100644
--- a/meta/recipes-core/systemd/systemd_261.3.bb
+++ b/meta/recipes-core/systemd/systemd_262.bb
@@ -34,9 +34,9 @@ SRC_URI +=3D "file://touchscreen.rules \
            file://init \
            file://99-default.preset \
            file://systemd-pager.sh \
+           file://coredumpd-kernel-version.conf \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-ti=
m.patch \
            file://0003-Do-not-create-var-log-README.patch \
-           file://0001-include-fix-limits.h-override.patch \
            "
=20
 PAM_PLUGINS =3D " \
@@ -144,7 +144,6 @@ PACKAGECONFIG[journal-color] =3D ",,,less"
 PACKAGECONFIG[journal-upload] =3D "-Dlibcurl=3Denabled,-Dlibcurl=3Ddisable=
d,curl"
 PACKAGECONFIG[kmod] =3D "-Dkmod=3Denabled,-Dkmod=3Ddisabled,kmod,libkmod"
 PACKAGECONFIG[ldconfig] =3D "-Dldconfig=3Dtrue,-Dldconfig=3Dfalse,,ldconfi=
g"
-PACKAGECONFIG[libidn] =3D "-Dlibidn=3Denabled,-Dlibidn=3Ddisabled,libidn"
 PACKAGECONFIG[libidn2] =3D "-Dlibidn2=3Denabled,-Dlibidn2=3Ddisabled,libid=
n2"
 # Link udev shared with systemd helper library.
 # If enabled the udev package depends on the systemd package (which has th=
e needed shared library).
@@ -355,6 +354,15 @@ do_install() {
 	# https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto
 	install -Dm 0644 ${UNPACKDIR}/99-default.preset ${D}${systemd_unitdir}/sy=
stem-preset/99-default.preset
=20
+	# Gate the new (v262) kernel coredump socket manager on a kernel
+	# that actually supports it (>=3D 6.19). See the drop-in for the full rat=
ionale.
+	if [ -e ${D}${systemd_system_unitdir}/systemd-coredumpd.service ]; then
+		install -Dm 0644 ${UNPACKDIR}/coredumpd-kernel-version.conf \
+			${D}${systemd_system_unitdir}/systemd-coredumpd.service.d/99-kernel-ver=
sion.conf
+		install -Dm 0644 ${UNPACKDIR}/coredumpd-kernel-version.conf \
+			${D}${systemd_system_unitdir}/systemd-coredump-register.service.d/99-ke=
rnel-version.conf
+	fi
+
 	# add a profile fragment to disable systemd pager with busybox less
 	install -Dm 0644 ${UNPACKDIR}/systemd-pager.sh ${D}${sysconfdir}/profile.=
d/systemd-pager.sh
=20
@@ -799,6 +807,7 @@ FILES:udev +=3D "${base_sbindir}/udevd \
                ${nonarch_libdir}/udev/rules.d/60-persistent-alsa.rules \
                ${nonarch_libdir}/udev/rules.d/60-persistent-hidraw.rules \
                ${nonarch_libdir}/udev/rules.d/60-persistent-input.rules \
+               ${nonarch_libdir}/udev/rules.d/60-persistent-media-controll=
er.rules \
                ${nonarch_libdir}/udev/rules.d/60-persistent-storage.rules =
\
                ${nonarch_libdir}/udev/rules.d/60-persistent-storage-mtd.ru=
les \
                ${nonarch_libdir}/udev/rules.d/60-persistent-storage-tape.r=
ules \

