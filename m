Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 130C7CD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 13:56:55 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8177.1778680606847913268
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 06:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=Dl8rJ/RH;
 spf=pass (domain: ericsson.com, ip: 52.101.83.36, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OuUc6mkbYJaSYLP5/BTplVq+/t1qNSFFSskWh8H0xg4k3OCBUD+Uz+Q6uJ9QwTqrHG9mHb8suhhmWju4XLYOn9CyllMQPS3uraA3MUJVfxgDirg3kbk0my6g3U5D5Gzv13RRYd4MdBjckmZM15i25coA6OzDKIxBYV/Oos4+KeGOtAcsMmsPSoKzTi2WsoS9Bb4pOrmjqhYeirPt7ERh3NQwjOlx7x8jiHPcDHtez5EY6gC0jaHT4RtF3ZOl6HgXodoxkp2L1rsuTZROtH8GP1Z12dHSQKulzCVoU0FAYl8bbSql3nD8VjQBzbQ9Tjc9laKy1ikGbmmYH44o+sniFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmMhnHYWlEbMS9Xh4qmSJTRLCj6+RP7DeRLvyFZSW/Y=;
 b=bzMYJfifhri1vybEakqPSmpFj6CJsmZBjbzIDFUcjfMkUa3Ujw2nTVeDtf46WxX269pjjIVREkF8oQGawPDLzUwfEhtUTYoEMi3dXn7YLZLuzfFrOXIlnt151pBzQS3Wknzy8EQkRG/jUkeTKWdtVNe3cnciEePdMMkKfhz8HlcZuIu2vqx1FPuXoavqT4CDaq1Q24dHWYz2YMViPj8e7NGn2osAMS1nsVRtiNcYKJjWM2YrLBbvSSaAt4QxgHurXONArIYp4/LY3ex46qKOxkAHS20jhUjvAnfNT7QxzL0L2B69d+2rE4ts5dVPKPPVwOqNsfa5+lWedy3q715nSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmMhnHYWlEbMS9Xh4qmSJTRLCj6+RP7DeRLvyFZSW/Y=;
 b=Dl8rJ/RH9sVOEQuQDAwHk6p0OyNmezajrYE79+MNMmfpxPc0rIx6vkPFLOTeq1z+yeGtl3d75+X2pnyXrz/CUztOvT4VxgjHerp4CSIZ03mgm7Mo2tlMCF/7EpU6BQFRjYfjcyH5HwSun0Z4J0Zhx0BBtvmoHU0GndHhCf18bXGP7Fy+c+MFELO1KwsSnCETHe8lXjbYY5SkKGS8HoHj9JA7+iEYJflb0LI4Gw6/7b2ARF7N4mvCIr4advzpVZjImM5SQWx/RLNW1V/eihbmRjLluJZz0/0rRMOugT4GrGBMc3u54/Z5bVrEoe+tj6pIrtd5Y+D8UEfeO0p55zc/sw==
Received: from DU7PR01CA0031.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::10) by DBAPR07MB6744.eurprd07.prod.outlook.com
 (2603:10a6:10:193::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.17; Wed, 13 May
 2026 13:56:38 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::59) by DU7PR01CA0031.outlook.office365.com
 (2603:10a6:10:50e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Wed,
 13 May 2026 13:56:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 13:56:38 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 13 May 2026 15:56:37 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 9A9F04020840;
	Wed, 13 May 2026 15:56:37 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 822327003739; Wed, 13 May 2026 15:56:37 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v3] devtool: upgrade: extract changelog between versions
Date: Wed, 13 May 2026 15:56:32 +0200
Message-ID: <20260513135633.3197130-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F5:EE_|DBAPR07MB6744:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d78d354-4f59-4fe1-7e45-08deb0f7740b
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|56012099003|11063799003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	VIVX10yjKGFRo1pEx8MQ5YH4tfHQ+ZoY7chNzbRvFeTfLIOBTtCQmPyKHAjj8k0/q5SeV9zXxcrKggnpzHG/rf48NvEzsAtFfDXGIqOwU8fgpcu/MJAg4Vk7u1VuHAi2AfUb/QoB1/bBE3ZYSOWUryhPE8vtkq+v3e9c5WZM4g/eZhbIw1pF+GVqqvj/PeSXmX5Tdu2fcaJA3S2C8ogRV32JaiEuKw/X4mZpbVTT89Niuxsh+HUeZaIKKe0/5oVRUjYPFrGABEolmX1gIzXc9WAqeFhgQF4zScvFDHFpQiS81etxj6pv0b1OZDDRCHxUGRPKQiV/0W376HH829QkVtMMO8mODhvtuxEKz/Qff7KsKV8mGz5xZVG84z6diDd4bS0QW0xDR3d7Mnp2BrxlyOoGaxTnPH90fFhq5Zq2VpErj5ENcbssQF5gOhhx6zBfVp9WQhMbU1RUx625vddenEdGF54ceIhX48J7gBjtbmULv6dhYtr+WMpaMkytA1fWSq9QmQZfTNWw1eAww8uKgOT+4JrjrTXLLIdYKB/aB5lCYIZ0AGFEcUSyOIbq/rRGiHURALW4SNC1UA1Cno/5WJ3NrPomL7cdGDvZ4LqOMAyNFRiTnbPPfv0P79sDdJF2wMq8U3CHdz8zHPp4qwT/dr65j4zR2vUActizulDEyG6SsoOQqjPdbuKjW+7B74yH97wR9VkEXcykntAd/z3/G1tbdt1jRgImnMNIojT/haI=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(56012099003)(11063799003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	w1DtT8gbGV6+Aellc8KMYfyNn91Ks5p6kWaybHOkfHDreyNu/kMXLHlfbgpf2qPhS4ytjt9acmWobxHlG8ky3CZjnRZaM3AVGFfc33ZcgD/+86gQggIH6lfhaOrhnwjTjWCWxsj6wNOtVOwPPCVpLDKIwWwC6fbxSL2V/skFkldN0/d6ihRRrb5FWRT6Ia7FSlSwts+K5RBJyuq/uMSjVQOXeOCT+UuCWdmYUgE7UsHC2OD5zh0aGiHJMuzScSQE+f0LBUhiKMDlnfucxNHJOerCHSGEa0Te8mXDBUYW0j6hC52473TFsM9cAha5VOzV8uRVEMRw9byuwPzlwEOphkFjek1vLzPh7nh6Po5IrL3/pRGCPfMHPg8t0ntbhdlMfAKA1nNrMl9wOUZRzB79EPhoQMruheiGks7RkrA53fBxPJvZZ23XjGhqrxMMs3Q7
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 13:56:38.2773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d78d354-4f59-4fe1-7e45-08deb0f7740b
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR07MB6744
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 13:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236986

From: Daniel Turull <daniel.turull@ericsson.com>

Automatically extract changelog information when upgrading a recipe.
Uses the devtool-base tags created during upgrade to diff known
changelog files (NEWS, ChangeLog, CHANGES, etc.) between the old and
new versions. For git-based sources, falls back to git log --oneline
if no changelog file changed.

Also match per-version release notes files like git's
Documentation/RelNotes/2.53.0.adoc or mesa's docs/relnotes/26.0.3.rst.

These are detected by matching filenames that contain a version
number with a documentation extension (.txt, .md, .rst, .adoc).
Their full content is read via git show since they are new files
rather than modifications to an existing changelog.

Collapse runs of multiple blank lines into a single blank line and
strip leading/trailing whitespace from the extracted changelog. This
produces cleaner output that is suitable for inclusion in commit
messages by tools like AUH.

Output is written to workspace/changelogs/<pn>.txt and cleaned up on
devtool reset. This allows AUH and other tools to pick up the changelog
without implementing their own extraction logic.

Add test cases for existings test recipes

Assisted-by: kiro:claude-opus-4.6
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>

---

v2:
- squash v1 patches into one commit and keep commit messages
- Integrate test cases with exiting devtool selftests

v3:
- do not silently skip the test if changelog is missing
---
 .../python3-guessing-game_git.bb.changelog    |  3 +
 .../devtool-upgrade-test1_1.5.3.bb.changelog  | 24 +++++
 .../devtool-upgrade-test2_git.bb.changelog    |  3 +
 .../devtool-upgrade-test3_1.5.3.bb.changelog  | 24 +++++
 .../devtool-upgrade-test4_1.5.3.bb.changelog  | 24 +++++
 .../devtool-upgrade-test5_git.bb.changelog    |  3 +
 meta/lib/oeqa/selftest/cases/devtool.py       | 27 ++++++
 scripts/lib/devtool/standard.py               |  8 ++
 scripts/lib/devtool/upgrade.py                | 95 +++++++++++++++++++
 9 files changed, 211 insertions(+)
 create mode 100644 meta-selftest/recipes-devtools/python/python3-guessing-=
game_git.bb.changelog
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test=
1_1.5.3.bb.changelog
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test=
2_git.bb.changelog
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test=
3_1.5.3.bb.changelog
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test=
4_1.5.3.bb.changelog
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test=
5_git.bb.changelog

diff --git a/meta-selftest/recipes-devtools/python/python3-guessing-game_gi=
t.bb.changelog b/meta-selftest/recipes-devtools/python/python3-guessing-gam=
e_git.bb.changelog
new file mode 100644
index 0000000000..571220b2a4
--- /dev/null
+++ b/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.ch=
angelog
@@ -0,0 +1,3 @@
+Changelog for python3-guessing-game: 0.1.0 -> 0.2.0
+
+40cf004 Sync with maturin tutorial source
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3=
.bb.changelog b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.=
5.3.bb.changelog
new file mode 100644
index 0000000000..04d9be5103
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.cha=
ngelog
@@ -0,0 +1,24 @@
+Changelog for devtool-upgrade-test1: 1.5.3 -> 1.6.0
+
+1.6.0 - 15 March 2015
+  - fix lstat64 support when unavailable - separate patches supplied by
+    Ganael Laplanche and Peter Korsgaard
+  - (#1506) new option "-D" / "--delay-start" to only show bar after N
+    seconds (Damon Harper)
+  - new option "--fineta" / "-I" to show ETA as time of day rather than ti=
me
+    remaining - patch supplied by Erkki Sepp=C3=A4l=C3=A4 (r147)
+  - (#1509) change ETA (--eta / -e) so that days are given if the hours
+    remaining are 24 or more (Jacek Wielemborek)
+  - (#1499) repeat read and write attempts on partial buffer fill/empty to
+    work around post-signal transfer rate drop reported by Ralf Ramsauer
+  - (#1507) do not try to calculate total size in line mode, due to bug
+    reported by Jacek Wielemborek and Michiel Van Herwegen
+  - cleanup: removed defunct RATS comments and unnecessary copyright notic=
es
+  - clean up displayed lines when using --watchfd PID, when PID exits
+  - output errors on a new line to avoid overwriting transfer bar
+
+1.5.7 - 26 August 2014
+  - show KiB instead of incorrect kiB (Debian bug #706175)
+  - (#1284) do not gzip man page, for non-Linux OSes (Bob Friesenhahn)
+  - work around "awk" bug in tests/016-numeric-timer in decimal "," locale=
s
+  - fix "make rpm" and "make srpm", extend "make release" to sign releases
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.b=
b.changelog b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.=
bb.changelog
new file mode 100644
index 0000000000..b7f0019d56
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.chang=
elog
@@ -0,0 +1,3 @@
+Changelog for devtool-upgrade-test2: 0.1+git -> 0.1+git
+
+6cc6077 dbus-wait.c: Fix typo
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3=
.bb.changelog b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.=
5.3.bb.changelog
new file mode 100644
index 0000000000..d9994fe063
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb.cha=
ngelog
@@ -0,0 +1,24 @@
+Changelog for devtool-upgrade-test3: 1.5.3 -> 1.6.0
+
+1.6.0 - 15 March 2015
+  - fix lstat64 support when unavailable - separate patches supplied by
+    Ganael Laplanche and Peter Korsgaard
+  - (#1506) new option "-D" / "--delay-start" to only show bar after N
+    seconds (Damon Harper)
+  - new option "--fineta" / "-I" to show ETA as time of day rather than ti=
me
+    remaining - patch supplied by Erkki Sepp=C3=A4l=C3=A4 (r147)
+  - (#1509) change ETA (--eta / -e) so that days are given if the hours
+    remaining are 24 or more (Jacek Wielemborek)
+  - (#1499) repeat read and write attempts on partial buffer fill/empty to
+    work around post-signal transfer rate drop reported by Ralf Ramsauer
+  - (#1507) do not try to calculate total size in line mode, due to bug
+    reported by Jacek Wielemborek and Michiel Van Herwegen
+  - cleanup: removed defunct RATS comments and unnecessary copyright notic=
es
+  - clean up displayed lines when using --watchfd PID, when PID exits
+  - output errors on a new line to avoid overwriting transfer bar
+
+1.5.7 - 26 August 2014
+  - show KiB instead of incorrect kiB (Debian bug #706175)
+  - (#1284) do not gzip man page, for non-Linux OSes (Bob Friesenhahn)
+  - work around "awk" bug in tests/016-numeric-timer in decimal "," locale=
s
+  - fix "make rpm" and "make srpm", extend "make release" to sign releases
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3=
.bb.changelog b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.=
5.3.bb.changelog
new file mode 100644
index 0000000000..3a37271eb7
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb.cha=
ngelog
@@ -0,0 +1,24 @@
+Changelog for devtool-upgrade-test4: 1.5.3 -> 1.6.0
+
+1.6.0 - 15 March 2015
+  - fix lstat64 support when unavailable - separate patches supplied by
+    Ganael Laplanche and Peter Korsgaard
+  - (#1506) new option "-D" / "--delay-start" to only show bar after N
+    seconds (Damon Harper)
+  - new option "--fineta" / "-I" to show ETA as time of day rather than ti=
me
+    remaining - patch supplied by Erkki Sepp=C3=A4l=C3=A4 (r147)
+  - (#1509) change ETA (--eta / -e) so that days are given if the hours
+    remaining are 24 or more (Jacek Wielemborek)
+  - (#1499) repeat read and write attempts on partial buffer fill/empty to
+    work around post-signal transfer rate drop reported by Ralf Ramsauer
+  - (#1507) do not try to calculate total size in line mode, due to bug
+    reported by Jacek Wielemborek and Michiel Van Herwegen
+  - cleanup: removed defunct RATS comments and unnecessary copyright notic=
es
+  - clean up displayed lines when using --watchfd PID, when PID exits
+  - output errors on a new line to avoid overwriting transfer bar
+
+1.5.7 - 26 August 2014
+  - show KiB instead of incorrect kiB (Debian bug #706175)
+  - (#1284) do not gzip man page, for non-Linux OSes (Bob Friesenhahn)
+  - work around "awk" bug in tests/016-numeric-timer in decimal "," locale=
s
+  - fix "make rpm" and "make srpm", extend "make release" to sign releases
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.b=
b.changelog b/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.=
bb.changelog
new file mode 100644
index 0000000000..7c5ecf3505
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.chang=
elog
@@ -0,0 +1,3 @@
+Changelog for devtool-upgrade-test5: 0.1+git -> 0.1+git
+
+0a60d6a Add dummy commit on tip for testing
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py
index 5ed69aee1b..5a6f38f8d5 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1944,6 +1944,22 @@ class DevtoolUpgradeTests(DevtoolBase):
         except:
             self.skip("Git user.name and user.email must be set")
=20
+    def _check_changelog(self, recipe, oldrecipefile):
+        """Compare extracted changelog against reference data."""
+        changelog_ref =3D oldrecipefile + '.changelog'
+        self.assertExists(changelog_ref, 'Changelog reference file must ex=
ist for %s' % recipe)
+        changelog_file =3D os.path.join(self.workspacedir, 'changelogs', '=
%s.txt' % recipe)
+        with open(changelog_ref, 'r') as f:
+            expected =3D f.read()
+        if not expected:
+            self.assertNotExists(changelog_file,
+                'Changelog file should not exist when reference is empty')
+        else:
+            self.assertExists(changelog_file, 'Changelog file should exist=
 after upgrade')
+            with open(changelog_file, 'r') as f:
+                actual =3D f.read()
+            self.assertEqual(expected, actual)
+
     def test_devtool_upgrade(self):
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test =
cannot be run with a workspace directory under the build directory')
@@ -1982,6 +1998,8 @@ class DevtoolUpgradeTests(DevtoolBase):
         with open(newrecipefile, 'r') as f:
             newlines =3D f.readlines()
         self.assertEqual(desiredlines, newlines)
+        # Check changelog
+        self._check_changelog(recipe, oldrecipefile)
         # Check devtool reset recipe
         result =3D runCmd('devtool reset %s -n' % recipe)
         result =3D runCmd('devtool status')
@@ -2016,11 +2034,14 @@ class DevtoolUpgradeTests(DevtoolBase):
         with open(newrecipefile, 'r') as f:
             newlines =3D f.readlines()
         self.assertEqual(desiredlines, newlines)
+        # Check changelog
+        self._check_changelog(recipe, oldrecipefile)
         # Check devtool reset recipe
         result =3D runCmd('devtool reset %s -n' % recipe)
         result =3D runCmd('devtool status')
         self.assertNotIn(recipe, result.output)
         self.assertNotExists(os.path.join(self.workspacedir, 'recipes', re=
cipe), 'Recipe directory should not exist after resetting')
+        self.assertNotExists(os.path.join(self.workspacedir, 'changelogs',=
 '%s.txt' % recipe), 'Changelog file should be removed after reset')
=20
     def test_devtool_upgrade_git(self):
         self._test_devtool_upgrade_git_by_recipe('devtool-upgrade-test2', =
'6cc6077a36fe2648a5f993fe7c16c9632f946517')
@@ -2051,6 +2072,8 @@ class DevtoolUpgradeTests(DevtoolBase):
         with open(newrecipefile, 'r') as f:
             newlines =3D f.readlines()
         self.assertEqual(desiredlines, newlines)
+        # Check changelog
+        self._check_changelog(recipe, oldrecipefile)
=20
     def test_devtool_upgrade_all_checksums(self):
         # Check preconditions
@@ -2075,6 +2098,8 @@ class DevtoolUpgradeTests(DevtoolBase):
         with open(newrecipefile, 'r') as f:
             newlines =3D f.readlines()
         self.assertEqual(desiredlines, newlines)
+        # Check changelog
+        self._check_changelog(recipe, oldrecipefile)
=20
     def test_devtool_upgrade_recipe_upgrade_extra_tasks(self):
         # Check preconditions
@@ -2116,6 +2141,8 @@ class DevtoolUpgradeTests(DevtoolBase):
         with open(newcratesincfile, 'r') as f:
             newlines =3D f.readlines()
         self.assertEqual(desiredlines, newlines)
+        # Check changelog
+        self._check_changelog(recipe, oldrecipefile)
         # Check devtool reset recipe
         result =3D runCmd('devtool reset %s -n' % recipe)
         result =3D runCmd('devtool status')
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py
index 42fb13872d..2a3a62d081 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -2046,6 +2046,14 @@ def _reset(recipes, no_clean, remove_work, config, b=
asepath, workspace):
=20
         clean_preferred_provider(pn, config.workspace_path)
=20
+        # Clean up changelog if present
+        changelog_file =3D os.path.join(config.workspace_path, 'changelogs=
', '%s.txt' % pn)
+        if os.path.exists(changelog_file):
+            os.remove(changelog_file)
+            changelog_dir =3D os.path.dirname(changelog_file)
+            if not os.listdir(changelog_dir):
+                os.rmdir(changelog_dir)
+
 def reset(args, config, basepath, workspace):
     """Entry point for the devtool 'reset' subcommand"""
=20
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.p=
y
index 8930fde5d6..e37ad07ea1 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -9,6 +9,7 @@
 import os
 import sys
 import re
+import shlex
 import shutil
 import tempfile
 import logging
@@ -26,6 +27,31 @@ from devtool import exec_build_env_command, setup_tinfoi=
l, DevtoolError, parse_r
=20
 logger =3D logging.getLogger('devtool')
=20
+# Common changelog filenames found in upstream source trees (matched case-=
insensitively):
+# changelog - util-linux, coreutils, dbus, acpid, hdparm
+# changelog.md - libslirp, ttyrun, python3-maturin, libjpeg-turbo
+# changelog.rst - python3-pluggy, python3-packaging
+# changes - openssl, python3-babel, icu, tcl
+# changes.md - openssl
+# changes.rst - python3-babel, python3-pathspec
+# changes.txt - python3-lxml, icu
+# news - systemd, glib-2.0, libxml2, dbus
+# news.md - libxml2
+# news.rst - python3-sphinx
+# news.adoc - ccache
+# history.md - python3-requests, python3-hatch-vcs
+# history.rst - python3-idna, python3-docutils
+# releases.md - rust, cargo (includes CVEs)
+# whatsnew.txt - libsdl2
+_CHANGELOG_BASENAMES =3D {
+    'changelog', 'changelog.md', 'changelog.rst', 'changelog.txt',
+    'changes', 'changes.md', 'changes.rst', 'changes.txt',
+    'news', 'news.md', 'news.rst', 'news.adoc',
+    'history', 'history.md', 'history.rst',
+    'releases.md',
+    'whatsnew.txt',
+}
+
 def _run(cmd, cwd=3D''):
     logger.debug("Running command %s> %s" % (cwd,cmd))
     return bb.process.run('%s' % cmd, cwd=3Dcwd)
@@ -529,6 +555,63 @@ def _run_recipe_upgrade_extra_tasks(pn, rd, tinfoil):
         if not res:
             raise DevtoolError('Running extra recipe upgrade task %s for %=
s failed' % (task, pn))
=20
+def _extract_changelog(srctree, pn, old_ver, new_ver, old_tag, new_tag, wo=
rkspace_path, is_git_source):
+    """Extract changelog between old and new version using devtool git tag=
s."""
+    changelog_content =3D None
+
+    # Try to find a changelog file that changed between versions
+    try:
+        stdout, _ =3D _run('git diff --name-only %s %s' % (old_tag, new_ta=
g), srctree)
+        for fname in stdout.splitlines():
+            fname =3D fname.strip()  # strip whitespace/CR from git output
+            if not fname:
+                continue
+            basename =3D os.path.basename(fname).lower()
+            if basename in _CHANGELOG_BASENAMES:
+                diff_out, _ =3D _run('git diff %s %s -- %s' % (old_tag, ne=
w_tag, shlex.quote(fname)), srctree)
+                if diff_out.strip():
+                    # Extract only the added lines from the diff
+                    lines =3D [line[1:] for line in diff_out.splitlines()
+                             if line.startswith('+') and not line.startswi=
th('+++')]
+                    if lines:
+                        changelog_content =3D '\n'.join(lines)
+                        break
+            # Per-version release notes (e.g., git RelNotes/2.53.0.adoc, m=
esa relnotes/26.0.3.rst)
+            elif re.search(r'(\d+[.\-])+\d+\.(txt|md|rst|adoc)$', basename=
):
+                file_content, _ =3D _run('git show %s' % shlex.quote('%s:%=
s' % (new_tag, fname)), srctree)
+                if file_content.strip():
+                    changelog_content =3D file_content.strip()
+                    break
+    except bb.process.ExecutionError as e:
+        logger.warning('Changelog file extraction failed: %s' % str(e))
+
+    # For git sources, fall back to git log if no changelog file was found
+    if not changelog_content and is_git_source:
+        try:
+            stdout, _ =3D _run('git log --oneline %s..%s' % (old_tag, new_=
tag), srctree)
+            if stdout.strip():
+                changelog_content =3D stdout.strip()
+        except bb.process.ExecutionError as e:
+            logger.warning('Changelog git log extraction failed: %s' % str=
(e))
+
+    if not changelog_content:
+        return None
+
+    # Clean up content for readability and commit message use
+    changelog_content =3D re.sub(r'\n{3,}', '\n\n', changelog_content).str=
ip()
+    if not changelog_content:
+        return None
+
+    changelog_dir =3D os.path.join(workspace_path, 'changelogs')
+    bb.utils.mkdirhier(changelog_dir)
+    changelog_path =3D os.path.join(changelog_dir, '%s.txt' % pn)
+    with open(changelog_path, 'w') as f:
+        f.write('Changelog for %s: %s -> %s\n\n' % (pn, old_ver, new_ver))
+        f.write(changelog_content)
+        f.write('\n')
+
+    return changelog_path
+
 def upgrade(args, config, basepath, workspace):
     """Entry point for the devtool 'upgrade' subcommand"""
=20
@@ -610,6 +693,18 @@ def upgrade(args, config, basepath, workspace):
=20
         logger.info('Upgraded source extracted to %s' % srctree)
         logger.info('New recipe is %s' % rf)
+
+        # Extract changelog between versions using the tags created by
+        # _extract_new_source(): devtool-base-new for git, devtool-base-<p=
v> for tarballs
+        is_git =3D old_srcrev is not None
+        newpv =3D args.version or rd.getVar('PV')
+        new_tag =3D 'devtool-base-new' if is_git else 'devtool-base-%s' % =
newpv
+        changelog_file =3D _extract_changelog(srctree, pn, old_ver, newpv,
+                                            'devtool-base', new_tag,
+                                            config.workspace_path, is_git)
+        if changelog_file:
+            logger.info('Changelog extracted to %s' % changelog_file)
+
         if license_diff:
             logger.info('License checksums have been updated in the new re=
cipe; please refer to it for the difference between the old and the new lic=
ense texts.')
         preferred_version =3D rd.getVar('PREFERRED_VERSION_%s' % rd.getVar=
('PN'))
--=20
2.51.0


