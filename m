Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB4DCD5BC0
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 08:02:58 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11459.1779696177377070278
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2026 01:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=HC/xE8hj;
 spf=pass (domain: ericsson.com, ip: 52.101.70.26, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sipp617Uc1yEjvCbt67dQkMqjlsYtSHlGrIVIWPguUymv/oawkDb5Sie7kMyVvwsFwdzoTgVgDmRIhZLsrCRnszPYEeAI7f4pIuwgnW+hwYV76YZNuwStrPyCwDsaImvBEMEPKfdSiiwWk37mmS4DH/ys0B88UmTRNsGKpFwYHWnDFQBjcaILrEoD4RmYtxGh5OYwlzKtk2cEpeu+TArYoi/3R5kA4/qjKRIWzOrCByqTxYMHhctB783S9oy+xHdBLvZhjWLsBOzt8KoNfieNFmW9fk5SDd5tnKi1apB4ezGYYLzko64NZ5/80qcrxP5yjvfMWFRMcDR6kReClnJ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGOw7MT7U3iGy25oaaCpnlI1qw8N9VmZ/X4skaMoLfw=;
 b=Q9CuamzmvwIvLmWA/7ZEhbvcfwHyoagzznv6nGJ2BLADQozBI+j4plNOrjNkbPabjlj81m2YSkPBQUEEmIayKRg1iaARY806alBCrhvzNotFaeMBhg4a9QlT+bBpFUTJSv5tng08dGfQI5Yv+bfsjxhnqf1IxEwco9MJbx0Z9M14qoB2oIw0i7bDOjBWgiaUazLqTpsqBq2cFN0r6Tq67L/qJl2Y5tvsCVTcFuJWIrTKyQcml8/0L4h9tGK7JLvG26os7Wlw8j7ih2dWgvWZuioAH6/OVEll2Jki4OuEohHFKs3KvZthrrAogb4e75eAjdayxzrfZY4Faq0UjOw12A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=arm.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGOw7MT7U3iGy25oaaCpnlI1qw8N9VmZ/X4skaMoLfw=;
 b=HC/xE8hjJdSJw48etDgqmYO/J6Bgf9vs+EtbBJlP1mnClrTpLSvaxPl6OA3KecS8SAFGiR9y91MLC4tanCYxLR/tgApqC3L6b3AWOGxaH3oKXh44coSktQ7uveIXI5KGNkLWCOIU+mlTlA0ArPwXSB9uBhlAVmR45gqKvpvONBzvkKefUk8UBCk+76YwZ9pw5shZDHMm6k/ESyIDWgAHRdt+ks26zxNgGXirwbyKb73JJfd6cAY5hLdOjhsHXVoqvO11mYK2kgrtVugvMSmjj1ijRVzvGHEV7KBLRlwbewry/KuWcdu69wiNqKL/7lVM66hkMqKZXOMnChiRjIOePQ==
Received: from DU2PR04CA0249.eurprd04.prod.outlook.com (2603:10a6:10:28e::14)
 by PA6PR07MB11555.eurprd07.prod.outlook.com (2603:10a6:102:51c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 08:02:49 +0000
Received: from DB5PEPF00014B9A.eurprd02.prod.outlook.com
 (2603:10a6:10:28e:cafe::92) by DU2PR04CA0249.outlook.office365.com
 (2603:10a6:10:28e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.20 via Frontend Transport; Mon, 25
 May 2026 08:02:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB5PEPF00014B9A.mail.protection.outlook.com (10.167.8.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Mon, 25 May 2026 08:02:49 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.65) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 25 May 2026 10:02:32 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 2386C40217AC;
	Mon, 25 May 2026 10:01:15 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 0931F7003739; Mon, 25 May 2026 10:01:15 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, <ticotimo@gmail.com>, <tim.orling@konsulko.com>,
	<richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
	<yoann.congal@smile.fr>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v5] devtool: upgrade: extract changelog between versions
Date: Mon, 25 May 2026 10:01:05 +0200
Message-ID: <20260525080108.940237-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9A:EE_|PA6PR07MB11555:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f57a2bb-8f26-49f5-61c1-08deba3403a9
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|5023799004|6133799003|11063799006|3023799007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	RpLn/3ow0/modN1PZVwZEBcJZefhOGOkBgQVSgvU1LErMy8jJPgENLpNfDuPmlLhfhxyaOGkfd2P56DLZDRdSkn+7BUlRRKZIC09Ov2mGgf8JZLjEH7Iwq7t7bJibk1oEHiY0NBdl+y3Azib8NvOqMsthB0w80/VuDOp64FaAADwnRprszBFe3XSkMiYC4qvv/6RNDPKm4KGCV2Y0ONlcDbTKjxZ7FIlKVJ/6lkzril7e4FQ5isIvXVgZmRdYsiuoxz8ISen4CaHH5/1yNWr0LQLkIFxznQ7tDrJPRinFklKuMLMjVoIx6l99+vacj4MjKw6+hQZztX3gOth/WC6k4w/g3ZXf6Y+2SN+pYbJH5ANIWfO54+Cm6nydfdmjpIXasahLqRwkE3zlUWbA+CogNo9d/cRW3gVLkukpmxFqUhp+2n6MBU6XFKsWFNANH9P2TMBqV1fIQuRkRvU7+hVkGMya2Xc0WMmxw4wxwcRpolLd/e2w2JQ7AFiGALFV+DWbLlivuEIMmR4vkJ321M0F8Y0w0SyVkbDkLL5Fa/ZYaUOB7j9fVRAMYZvwODfPYBTzkNzWC8c645YkSl7gUhSaMiNSUyT6BpIJhW8GIB1yl5vSsDdOAZ0w91ARzl/7X1h6DMw8ArKfPtezK+uuAfaEp5yCUYFNv1NG85Ta0c/5QlxtsMgc0eIy5UsjhZwu3hZZZ+u8BBfST9EVZjbGtvgY6Ef+zlDAViupulot7Gfd+M=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(5023799004)(6133799003)(11063799006)(3023799007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	O3XdaIAauPnA6Ow1PE4TZgIFwgllGihuOd0Ss5ZWhH3p4/cZZBdsYks3ti6XI2rPut1REmldIwYo1+nPXzD70ReR4qLVWGlZ5PUDorBTlDZqs6f8vKyzptwpSfSD8I2fKBDx7o62e8MlEim7kkosjXdZDVXrQAAotUWf8Xv19563eCAr5UJuCpAzUepI+io+t20VCRNfMB9vAz87qEGiWT25kvs0c1xxJKRTn/j5xqzGdT+R1JCZ0bqqfn1dELv+Ck1AZpOU1FwsAm63naBaU5ZKqmraiYpOntGixELI5YycX3KgSFHPmUargiUjlLO99YzTAvTz+8Z8eBktq6l9B6QWBNxgTRWPDg9unnRUSEHDlwdNmU/QudvDV4MLs/+rDC8z2yucPrSCPCPwKMfjz/XU/D9/MYpBDiinOUkWgDBMxmjKXIMD2Dity1iuTfiI
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 08:02:49.4844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f57a2bb-8f26-49f5-61c1-08deba3403a9
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR07MB11555
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 May 2026 08:02:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237570

From: Daniel Turull <daniel.turull@ericsson.com>

Automatically extract changelog information when upgrading a recipe.
Uses the devtool-base tags created during upgrade to diff known
changelog files (NEWS, ChangeLog, CHANGES, etc.) between the old and
new versions. For git-based sources, falls back to git log --oneline
if no changelog file changed.

Prioritize per-version release notes files containing the new version
number (e.g. v2.42.1-ReleaseNotes, changelog-9.20.23.rst) over generic
changelog files. When multiple per-version files match, all are included.
For standard changelog files, picks the one with the most new content.

Resolve RST .. include:: directives by searching the source tree for
the included file by basename. Strip RST comment blocks (copyright
headers) from .rst files.

Collapse runs of multiple blank lines and strip leading/trailing
whitespace for cleaner output suitable for commit messages.

Output is written to workspace/changelogs/<pn>.txt and cleaned up on
devtool reset. This allows AUH and other tools to pick up the changelog
without implementing their own extraction logic.

Add test cases for existing test recipes.

Tested with AUH with changelog support (See yocto-patches)

master 2026-05-22:

commits in https://git.openembedded.org/openembedded-core-contrib/log/?h=3D=
dturull/devtool-changelog-test-master

TOTAL: attempted=3D130 succeeded=3D94(72.31%) failed=3D36(27.69%)

  - Total recipes attempted: 130
  - With meaningful changelog: 107 (82%)
  - Without changelog: 23 (18%)
  - Commit failures: 0
  - Empty body patches: 0

  Recipes without changelogs:

  - cargo-c: devtool upgrade failed
  - debugedit: devtool upgrade failed
  - diffoscope: only PKG-INFO changed
  - gcc-source-15.2.0: devtool upgrade failed
  - gdb, gdb-cross-canadian-x86-64, gdb-cross-x86_64: devtool upgrade faile=
d
  - gtk-doc: devtool upgrade failed
  - linux-firmware: binary blobs, no changelog in tarball
  - nfs-utils: no changelog file changed
  - python3-certifi: only CA bundle + PKG-INFO changed
  - python3-cryptography-vectors, python3-cryptography: devtool upgrade fai=
led
  - python3-hypothesis: no changelog in PyPI sdist
  - python3-maturin: devtool upgrade failed
  - python3-poetry-core: no changelog in PyPI sdist
  - python3-pytz: only timezone data changed
  - python3-trove-classifiers: only classifiers list changed
  - python3-uv-build: devtool upgrade failed
  - python3-wcwidth: only unicode tables changed
  - sqlite3: amalgamation tarball, no changelog
  - vte: devtool upgrade failed
  - xwayland: no changelog in tarball

master 2 months old: (2026-03-22)
 https://git.openembedded.org/openembedded-core-contrib/log/?h=3Ddturull/de=
vtool-changelog-2_months_old

TOTAL: attempted=3D239 succeeded=3D181(75.73%) failed=3D58(24.27%)

  - Total recipes attempted: 239
  - With meaningful changelog: 191 (80%)
  - Without changelog: 48 (20%)

  Recipes without changelogs:

  - acpica: devtool upgrade failed
  - autoconf: devtool upgrade failed
  - busybox: devtool upgrade failed
  - cargo-c: devtool upgrade failed
  - debugedit: devtool upgrade failed
  - diffoscope: only PKG-INFO changed
  - gcc-source-15.2.0: devtool upgrade failed
  - gdb, gdb-cross-x86_64, gdb-cross-canadian-x86-64: devtool upgrade faile=
d
  - go-cross-x86-64-v3: devtool upgrade failed
  - groff: devtool upgrade failed
  - gtk-doc: devtool upgrade failed
  - icu: no changelog files in source
  - iproute2: no changelog files in source
  - libcap: no changelog files in source
  - libdrm: no changelog files in source
  - libmpc: devtool upgrade failed
  - libpciaccess: no changelog files in source
  - librsvg: devtool upgrade failed
  - linux-firmware: binary blobs, no changelog in tarball
  - llvm-project-source: devtool upgrade failed
  - nfs-utils: no changelog file changed
  - python3-certifi: only CA bundle + PKG-INFO changed
  - python3-dtschema: no changelog in PyPI sdist
  - python3-editables: no changelog in PyPI sdist
  - python3-hypothesis: no changelog in PyPI sdist
  - python3-jsonpointer: no changelog in PyPI sdist
  - python3-maturin: devtool upgrade failed
  - python3-pdm-backend: no changelog in PyPI sdist
  - python3-poetry-core: no changelog in PyPI sdist
  - python3-pytz: only timezone data changed
  - python3-shacl2code: no changelog in PyPI sdist
  - python3-spdx-python-model: devtool upgrade failed
  - python3-sphinxcontrib-svg2pdfconverter: no changelog in PyPI sdist
  - python3-trove-classifiers: only classifiers list changed
  - python3-uv-build: devtool upgrade failed
  - python3-wcwidth: only unicode tables changed
  - python3-xmltodict: no changelog in PyPI sdist
  - rpm-sequoia: devtool upgrade failed
  - spirv-llvm-translator: devtool upgrade failed
  - sqlite3: amalgamation tarball, no changelog
  - time: devtool upgrade failed
  - vte: devtool upgrade failed
  - wayland: devtool upgrade failed
  - wayland-protocols: no changelog files in source
  - wireless-regdb: no changelog files in source
  - xwayland: no changelog in tarball

AI-generated: kiro with claude-opus-4.6 model
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>

---

v2:
- squash v1 patches into one commit and keep commit messages
- Integrate test cases with exiting devtool selftests

v3:
- do not silently skip the test if changelog is missing

v4:
- fix typo from commit message and AI-generated tag

v5:
- add file where the changelog is comming from
- expand include directives
- expand per-version matches
- prioritize per-version files over generic changelogs
- collect all per-version files, pick largest generic changelog
- gate RST comment stripping on .rst extension

AI-generated: kiro with claude-opus-4.6 model
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 .../python3-guessing-game_git.bb.changelog    |   3 +
 .../devtool-upgrade-test1_1.5.3.bb.changelog  |  25 +++
 .../devtool-upgrade-test2_git.bb.changelog    |   3 +
 .../devtool-upgrade-test3_1.5.3.bb.changelog  |  25 +++
 .../devtool-upgrade-test4_1.5.3.bb.changelog  |  25 +++
 .../devtool-upgrade-test5_git.bb.changelog    |   3 +
 meta/lib/oeqa/selftest/cases/devtool.py       |  27 +++
 scripts/lib/devtool/standard.py               |   8 +
 scripts/lib/devtool/upgrade.py                | 160 ++++++++++++++++++
 9 files changed, 279 insertions(+)
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
index 0000000000..a37f796a0d
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.cha=
ngelog
@@ -0,0 +1,25 @@
+Changelog for devtool-upgrade-test1: 1.5.3 -> 1.6.0
+Source: doc/NEWS
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
index 0000000000..aaab809736
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb.cha=
ngelog
@@ -0,0 +1,25 @@
+Changelog for devtool-upgrade-test3: 1.5.3 -> 1.6.0
+Source: doc/NEWS
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
index 0000000000..0ce6547c77
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb.cha=
ngelog
@@ -0,0 +1,25 @@
+Changelog for devtool-upgrade-test4: 1.5.3 -> 1.6.0
+Source: doc/NEWS
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
index 8930fde5d6..ba56a34d81 100644
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
@@ -26,6 +27,32 @@ from devtool import exec_build_env_command, setup_tinfoi=
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
+    'releasenotes.md', 'releasenotes.rst',
+    'releases.md',
+    'whatsnew.txt',
+}
+
 def _run(cmd, cwd=3D''):
     logger.debug("Running command %s> %s" % (cwd,cmd))
     return bb.process.run('%s' % cmd, cwd=3Dcwd)
@@ -529,6 +556,127 @@ def _run_recipe_upgrade_extra_tasks(pn, rd, tinfoil):
         if not res:
             raise DevtoolError('Running extra recipe upgrade task %s for %=
s failed' % (task, pn))
=20
+def _resolve_rst_includes(content, srctree):
+    """Resolve RST .. include:: directives by reading files from the sourc=
e tree."""
+    result =3D []
+    for line in content.splitlines(True):
+        m =3D re.match(r'^\.\.\s+include::\s+(.+)$', line)
+        if m:
+            basename =3D os.path.basename(m.group(1).strip())
+            # Search for the file in the source tree
+            for dirpath, _, filenames in os.walk(srctree):
+                if basename in filenames:
+                    fpath =3D os.path.join(dirpath, basename)
+                    try:
+                        with open(fpath, 'r', errors=3D'replace') as f:
+                            result.append(f.read())
+                        break
+                    except OSError:
+                        pass
+            else:
+                result.append(line)
+            continue
+        result.append(line)
+    return ''.join(result)
+
+
+def _extract_changelog(srctree, pn, old_ver, new_ver, old_tag, new_tag, wo=
rkspace_path, is_git_source):
+    """Extract changelog between old and new version using devtool git tag=
s."""
+    changelog_content =3D None
+    changelog_fname =3D None
+
+    # Try to find a changelog file that changed between versions
+    try:
+        stdout, _ =3D _run('git diff --name-only %s %s' % (old_tag, new_ta=
g), srctree)
+        changed_files =3D [f.strip() for f in stdout.splitlines() if f.str=
ip()]
+
+        # First pass: collect per-version release notes that changed
+        # Matches files with a version number whose path suggests release =
notes
+        # (e.g. Documentation/releases/v2.42-ReleaseNotes, docs/relnotes/2=
.53.0.adoc)
+        parts =3D []
+        source_files =3D []
+        for fname in changed_files:
+            if not re.search(r'\d+\.\d+', fname):
+                continue
+            if re.search(r'(releas|relnote|change|news|migrat)', fname, re=
.IGNORECASE):
+                try:
+                    file_content, _ =3D _run('git show %s' % shlex.quote('=
%s:%s' % (new_tag, fname)), srctree)
+                except bb.process.ExecutionError:
+                    try:
+                        file_content, _ =3D _run('git show %s' % shlex.quo=
te('%s:%s' % (old_tag, fname)), srctree)
+                    except bb.process.ExecutionError:
+                        continue
+                if file_content.strip():
+                    parts.append(file_content.strip())
+                    source_files.append(fname)
+        if parts:
+            changelog_content =3D '\n\n'.join(parts)
+            changelog_fname =3D ', '.join(source_files)
+
+        # Second pass: pick the largest standard changelog file (NEWS, Cha=
ngeLog, etc.)
+        if not changelog_content:
+            for fname in changed_files:
+                basename =3D os.path.basename(fname).lower()
+                if basename in _CHANGELOG_BASENAMES:
+                    diff_out, _ =3D _run('git diff %s %s -- %s' % (old_tag=
, new_tag, shlex.quote(fname)), srctree)
+                    if diff_out.strip():
+                        lines =3D [line[1:] for line in diff_out.splitline=
s()
+                                 if line.startswith('+') and not line.star=
tswith('+++')]
+                        if lines:
+                            candidate =3D '\n'.join(lines)
+                            if not changelog_content or len(candidate) > l=
en(changelog_content):
+                                changelog_content =3D candidate
+                                changelog_fname =3D fname
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
+    # Resolve RST .. include:: directives and strip comment blocks.
+    # Only applied to .rst files to avoid mangling plain-text changelogs.
+    if changelog_fname and any(f.endswith('.rst') for f in changelog_fname=
.split(', ')):
+        changelog_content =3D _resolve_rst_includes(changelog_content, src=
tree)
+        # Remove RST comments (.. without ::) and their indented continuat=
ion lines
+        filtered =3D []
+        in_comment =3D False
+        for line in changelog_content.splitlines(True):
+            if line.startswith('..') and '::' not in line:
+                in_comment =3D True
+            elif in_comment and (line.startswith('   ') or line.strip() =
=3D=3D ''):
+                pass
+            else:
+                in_comment =3D False
+                filtered.append(line)
+        changelog_content =3D ''.join(filtered)
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
+        f.write('Changelog for %s: %s -> %s\n' % (pn, old_ver, new_ver))
+        if changelog_fname:
+            f.write('Source: %s\n' % changelog_fname)
+        f.write('\n')
+        f.write(changelog_content)
+        f.write('\n')
+
+    return changelog_path
+
 def upgrade(args, config, basepath, workspace):
     """Entry point for the devtool 'upgrade' subcommand"""
=20
@@ -610,6 +758,18 @@ def upgrade(args, config, basepath, workspace):
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
2.34.1


