Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B186C982DC
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 12:01:51 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9502.1789732906865116349
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 05:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=mqSFxacx;
 spf=pass (domain: ericsson.com, ip: 52.101.69.10, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPu6YNti+hUVAzNkjCcqcH+vEXBPKwik6VI6GbdC2NoKk1sq3m5o1+Z2IjTovYdLa2Oxi7CMuqC+SFOdFHHOeRPStIheQzzGEVNHMg1nVoKAG63O4Ea2JGNygSgPQPVCj/kYDby1bmVYs2bXeCIhZ0KNIsr1W7Ia5eyHAqJXmq46R1FhuhVLIN4pppZV3fGmIdH89LpnybjV6PT3dm08ON35JV+QVdabM8fUAAEeqQmsurRjCukytU3VQTYYwQNuiLQpJdOMwy7Iw+hAz6xruZjhQnjEPPHdLcQ5cyYzGU0GDOVGsVWwKPoY9wAYZWAFu1g0A719onejwRvb1FDSFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQc+M0cU0dz+wyPs7bMGMrdTUNhOQFUxpOxG34T1uDY=;
 b=hD2umA3POdRrVcbJrl1YdntNrqOsfANQfiD0eBA7e+CcoLf5Ldq0bXyOF/tRTjLeQG0JL7pGXgZ6PZD7XS03tKi4DRoZC+UlmIiw6gBSgMMQHoBg7FIgLSCXnQqkg3I6WL6BBpTCulu4siZvsS+ENiMZr0zhgz7bUsqXbc5GKZDxNR0NVmI1+xcmZ1aZNlvxzj6rGSq3ItfhWub3sByyfQFluupyIxQYJrjKV1DlajW17x3/mAMAIiMQo6UjPZLuwFVacaRQJhR+DLXo37USqlJlTYjnVlR/GJlG+UPddUIRx6+eF4rEULXvkfyl08emGdPQQuIKAX69UryP1FvUPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQc+M0cU0dz+wyPs7bMGMrdTUNhOQFUxpOxG34T1uDY=;
 b=mqSFxacxE5u53E4ooyaU3DiFOt0niZwN8DHkMV0GhOs6izA5fUxWzI/PwwHEyh5OG9tKXj3OQmOBF9VDSVht9wsEDeYk6jAivoS1MyaF5ZqVu/KkbZzvmByozhImkstvF3LuhT4on414zJZtPBB5i6EaLjumH6/83QaKnT3Fy75NqGdeXJKaaVS8awBI5GZjeekiADujq256YRW0dWjaVHL3tNwtu4NKHWOD95KEisONL4uhvsMBcGUECLZp60gSJj2S7IqCKb7u+406kYrf2MMVxi7TJXqXMuUsoMwddNUwETThQEDl9RIErx5Tu3/gS0jf7OqzBeRi9T4/Ju5vMg==
Received: from DUZPR01CA0187.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::17) by VI1PR07MB6590.eurprd07.prod.outlook.com
 (2603:10a6:800:185::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 12:01:42 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::28) by DUZPR01CA0187.outlook.office365.com
 (2603:10a6:10:4b6::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.13 via Frontend Transport; Fri,
 18 Sep 2026 12:01:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Fri, 18 Sep 2026 12:01:42 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 18 Sep 2026 14:01:41 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 6E86295816;
	Fri, 18 Sep 2026 14:01:31 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 40D41700CF25; Fri, 18 Sep 2026 14:01:31 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 1/2] devtool: upgrade: write changelog metadata as JSON sidecar
Date: Fri, 18 Sep 2026 14:01:24 +0200
Message-ID: <20260918120125.770604-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|VI1PR07MB6590:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e0999a0-c670-401c-bf5d-08df157c9a8a
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|56012099006|11063799006|3023799007|10067099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	os2gHgt8QffUNHykFx+idMuc5FTcVYeqyJxPGZLn31PIdTRaF8XLessglpApjqPmw9IWQzNEbw9lOUAOXkF2qeDS0cHd4e4Em6K4E+vdXjolEp3Djb/j9MnGgrsyHrjcJZZV/LhwK9tFvgjVXYf1vsOa1+jHrBbHIMSj3JFNvyEhqZgBS89SAwYp+Nn5EIquSG6rp9bLmJUI6jSUGnMUtEaaoX18aOMwqQpUcUZ4Y5z+pVJaiKPy2oQjlWslc9F2Q7XpOEd3XzBYnKORsk350maTj+6EBvpPeHyD8plQuyXp9ZvFxzq0Yan90t3VYzvscPbu3fD9BPkCk8sWltdGPNsfrib/IysEkM401I78gs0li0TmhDyHNQNbF3wpBOPMLuTjciaAg8QAP9ZH86XRPXFctcEuDqtuLurfiHAxA5zEXfwGUgfENVsDyOh8685VVL15KEsxxrMcGa3DT31925a55sflya7X6H81yLlL41MDYr6f1DpW/XYeFFAIJu7oi/PQjLOI4PuhpkFugK52uR9sDE3JKN0+wx3V7NDwMc0j8I1vtXVZpJoZyxf419KaMbk4FE/DOI0SPV0O/UWOjZ5JrYA8OmebewSSJOni0nHQ7zgm9hQRbAw3VSecRKdJA1UO0D/0G/76CekzG82kEubdnsgNe29w6eTtkuRbvV44cewM1E0WQS1tKj7i7y3A5W4kGZh8u2cD/4BQRDofNw==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(3023799007)(10067099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	uJorbJ3NRvCIQXrc0pfbZn11705j8wnxoNaoUScf3wV15WrpbcSpCMRij6yhVwIFyHh6Yl8EtdUtxmYNOC8/39xVhgw8qK8um/NSen9Eh1WxoTuE3MvbUYFzEp1q/Zl052p6X5r7Ejq+UEUlpWpbF6yPWu1UdlTrY46hVS/rtBd9DLJdYcuw03R/UGrC7PMe6+NpDNVHBaOK36poEVfArX5TVgfr3MB600bPRwJysPeot3JjUSOvO77tb1I0oZREBhOW6n9IhDauCcwfJX0GTyb+1afKyFEBNIbzZ5DMIYSdTJ5pjZf+r6DNMxl5MIkDJzEQ0+GkAFwf1N1agYCn/yb4AkqA1NDgathLK+3Co63aTq6VRk/3zwualJzJkTbDmZi69v7j05uaBrDgB7lIf+EX3hUz9a2CocpV3woPYPCyrZGrgiwL3pNFTzGC68Dq
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 12:01:42.1959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e0999a0-c670-401c-bf5d-08df157c9a8a
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6590
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 12:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246214

From: Daniel Turull <daniel.turull@ericsson.com>

Add changelogs/<pn>.json alongside the existing changelogs/<pn>.txt,
to include metadata. This makes the upgrade/changelog metadata
machine-readable without having to parse it out of the .txt file.

The .txt file no longer has the 'Changelog for ...'/'Source: ...'
header lines, now containing just the changelog body; that
information moved to the JSON file instead. devtool reset now cleans
up both files.

AI-Generated: Uses Kiro with Claude-sonnet-5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 .../python3-guessing-game_git.bb.changelog    |  2 --
 .../devtool-upgrade-test1_1.5.3.bb.changelog  |  3 ---
 .../devtool-upgrade-test2_git.bb.changelog    |  2 --
 .../devtool-upgrade-test3_1.5.3.bb.changelog  |  3 ---
 .../devtool-upgrade-test4_1.5.3.bb.changelog  |  3 ---
 .../devtool-upgrade-test5_git.bb.changelog    |  2 --
 meta/lib/oeqa/selftest/cases/devtool.py       | 17 +++++++++++++--
 scripts/lib/devtool/standard.py               |  9 +++++---
 scripts/lib/devtool/upgrade.py                | 21 +++++++++++++++----
 9 files changed, 38 insertions(+), 24 deletions(-)

diff --git a/meta-selftest/recipes-devtools/python/python3-guessing-game_gi=
t.bb.changelog b/meta-selftest/recipes-devtools/python/python3-guessing-gam=
e_git.bb.changelog
index 571220b2a4..ef0052160b 100644
--- a/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.ch=
angelog
+++ b/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.ch=
angelog
@@ -1,3 +1 @@
-Changelog for python3-guessing-game: 0.1.0 -> 0.2.0
-
 40cf004 Sync with maturin tutorial source
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3=
.bb.changelog b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.=
5.3.bb.changelog
index a37f796a0d..15d7baeeb4 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.cha=
ngelog
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.cha=
ngelog
@@ -1,6 +1,3 @@
-Changelog for devtool-upgrade-test1: 1.5.3 -> 1.6.0
-Source: doc/NEWS
-
 1.6.0 - 15 March 2015
   - fix lstat64 support when unavailable - separate patches supplied by
     Ganael Laplanche and Peter Korsgaard
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.b=
b.changelog b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.=
bb.changelog
index b7f0019d56..ac133c483f 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.chang=
elog
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.chang=
elog
@@ -1,3 +1 @@
-Changelog for devtool-upgrade-test2: 0.1+git -> 0.1+git
-
 6cc6077 dbus-wait.c: Fix typo
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3=
.bb.changelog b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.=
5.3.bb.changelog
index aaab809736..15d7baeeb4 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb.cha=
ngelog
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb.cha=
ngelog
@@ -1,6 +1,3 @@
-Changelog for devtool-upgrade-test3: 1.5.3 -> 1.6.0
-Source: doc/NEWS
-
 1.6.0 - 15 March 2015
   - fix lstat64 support when unavailable - separate patches supplied by
     Ganael Laplanche and Peter Korsgaard
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3=
.bb.changelog b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.=
5.3.bb.changelog
index 0ce6547c77..15d7baeeb4 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb.cha=
ngelog
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb.cha=
ngelog
@@ -1,6 +1,3 @@
-Changelog for devtool-upgrade-test4: 1.5.3 -> 1.6.0
-Source: doc/NEWS
-
 1.6.0 - 15 March 2015
   - fix lstat64 support when unavailable - separate patches supplied by
     Ganael Laplanche and Peter Korsgaard
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.b=
b.changelog b/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.=
bb.changelog
index 7c5ecf3505..8077da3e21 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.chang=
elog
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.chang=
elog
@@ -1,3 +1 @@
-Changelog for devtool-upgrade-test5: 0.1+git -> 0.1+git
-
 0a60d6a Add dummy commit on tip for testing
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py
index 84e020cd3d..dda59a3459 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2337,21 +2337,33 @@ class DevtoolUpgradeTests(DevtoolBase):
         except:
             self.skip("Git user.name and user.email must be set")
=20
-    def _check_changelog(self, recipe, oldrecipefile):
+    def _check_changelog(self, recipe, oldrecipefile, old_ver=3DNone, new_=
ver=3DNone):
         """Compare extracted changelog against reference data."""
         changelog_ref =3D oldrecipefile + '.changelog'
         self.assertExists(changelog_ref, 'Changelog reference file must ex=
ist for %s' % recipe)
         changelog_file =3D os.path.join(self.workspacedir, 'changelogs', '=
%s.txt' % recipe)
+        metadata_file =3D os.path.join(self.workspacedir, 'changelogs', '%=
s.json' % recipe)
         with open(changelog_ref, 'r') as f:
             expected =3D f.read()
         if not expected:
             self.assertNotExists(changelog_file,
                 'Changelog file should not exist when reference is empty')
+            self.assertNotExists(metadata_file,
+                'Changelog metadata file should not exist when reference i=
s empty')
         else:
             self.assertExists(changelog_file, 'Changelog file should exist=
 after upgrade')
             with open(changelog_file, 'r') as f:
                 actual =3D f.read()
             self.assertEqual(expected, actual)
+            self.assertExists(metadata_file, 'Changelog metadata file shou=
ld exist after upgrade')
+            with open(metadata_file, 'r') as f:
+                metadata =3D json.load(f)
+            self.assertEqual(metadata.get('package'), recipe)
+            if old_ver:
+                self.assertEqual(metadata.get('old_version'), old_ver)
+            if new_ver:
+                self.assertEqual(metadata.get('new_version'), new_ver)
+            self.assertEqual(metadata.get('changelog_file'), '%s.txt' % re=
cipe)
=20
     def test_devtool_upgrade(self):
         # Check preconditions
@@ -2364,6 +2376,7 @@ class DevtoolUpgradeTests(DevtoolBase):
             self.assertIn(param, result.output)
         # For the moment, we are using a real recipe.
         recipe =3D 'devtool-upgrade-test1'
+        old_version =3D '1.5.3'
         version =3D '1.6.0'
         oldrecipefile =3D get_bb_var('FILE', recipe)
         tempdir =3D tempfile.mkdtemp(prefix=3D'devtoolqa')
@@ -2392,7 +2405,7 @@ class DevtoolUpgradeTests(DevtoolBase):
             newlines =3D f.readlines()
         self.assertEqual(desiredlines, newlines)
         # Check changelog
-        self._check_changelog(recipe, oldrecipefile)
+        self._check_changelog(recipe, oldrecipefile, old_version, version)
         # Check devtool reset recipe
         result =3D runCmd('devtool reset %s -n' % recipe)
         result =3D runCmd('devtool status')
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py
index ac9e7cd61a..0d933e68b1 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -2074,11 +2074,14 @@ def _reset(recipes, no_clean, remove_work, config, =
basepath, workspace):
=20
         # Clean up changelog if present
         changelog_file =3D os.path.join(config.workspace_path, 'changelogs=
', '%s.txt' % pn)
+        metadata_file =3D os.path.join(config.workspace_path, 'changelogs'=
, '%s.json' % pn)
         if os.path.exists(changelog_file):
             os.remove(changelog_file)
-            changelog_dir =3D os.path.dirname(changelog_file)
-            if not os.listdir(changelog_dir):
-                os.rmdir(changelog_dir)
+        if os.path.exists(metadata_file):
+            os.remove(metadata_file)
+        changelog_dir =3D os.path.join(config.workspace_path, 'changelogs'=
)
+        if os.path.exists(changelog_dir) and not os.listdir(changelog_dir)=
:
+            os.rmdir(changelog_dir)
=20
 def reset(args, config, basepath, workspace):
     """Entry point for the devtool 'reset' subcommand"""
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.p=
y
index 58165541f6..cdc85fe7ae 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -9,6 +9,7 @@
 import os
 import sys
 import re
+import json
 import shlex
 import shutil
 import subprocess
@@ -730,13 +731,23 @@ def _extract_changelog(srctree, pn, old_ver, new_ver,=
 old_tag, new_tag, workspac
     bb.utils.mkdirhier(changelog_dir)
     changelog_path =3D os.path.join(changelog_dir, '%s.txt' % pn)
     with open(changelog_path, 'w') as f:
-        f.write('Changelog for %s: %s -> %s\n' % (pn, old_ver, new_ver))
-        if changelog_fname:
-            f.write('Source: %s\n' % changelog_fname)
-        f.write('\n')
         f.write(changelog_content)
         f.write('\n')
=20
+    # Metadata sidecar file: keeps upgrade/changelog details machine-reada=
ble
+    # while the changelog text itself stays in the .txt file.
+    metadata =3D {
+        'package': pn,
+        'old_version': old_ver,
+        'new_version': new_ver,
+        'changelog_file': os.path.basename(changelog_path),
+        'changelog_source': changelog_fname.split(', ') if changelog_fname=
 else None,
+    }
+    metadata_path =3D os.path.join(changelog_dir, '%s.json' % pn)
+    with open(metadata_path, 'w') as f:
+        json.dump(metadata, f, indent=3D4)
+        f.write('\n')
+
     return changelog_path
=20
 def upgrade(args, config, basepath, workspace):
@@ -831,6 +842,8 @@ def upgrade(args, config, basepath, workspace):
                                             config.workspace_path, is_git)
         if changelog_file:
             logger.info('Changelog extracted to %s' % changelog_file)
+            metadata_file =3D os.path.join(os.path.dirname(changelog_file)=
, '%s.json' % pn)
+            logger.info('Changelog metadata written to %s' % metadata_file=
)
=20
         if license_diff:
             logger.info('License checksums have been updated in the new re=
cipe; please refer to it for the difference between the old and the new lic=
ense texts.')

