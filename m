Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2F4CD4F26
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 07:25:13 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70056.1778570704860889674
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 00:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=GniiQ3da;
 spf=pass (domain: ericsson.com, ip: 52.101.72.23, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=faV5ij0WG5E3G9LtTxxHrThuHVpU0HTlIkTckSeMEYAS8QcC+MFGYt0NJtr5iFUcO/7PhlI1jQ/SKm5cWUzJbmT8ZZqsAQrjEqhjXMu7sEz1p7STbNp0lasHjJNv5PQX0okUJcEEOCtpb5KZNQhyXu7fAvn9PxWCXJLVLEK4zZQI9O3OdIgkZ5q4UiEguJuy1EeM6hqoJ7333lNgQiNk5Nl7zu4raUQ2CMNVO+PZMuuaT9vWTBL+lAzGTOMkbcvH/fjhv/nGYoZbQ7g2A/wbvG5rnuMUhbbbVmWqI1OgpW72UUFc3sXscSB25EXQoS4xkUXGlxXfgZWomSwJ8jUxpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FogVPrgh1h2ys6nFmRwOchabOLyapNCXxEPyqAwIMU=;
 b=PzobJxI74e4wTpHUsL1Mr5vZO3MsO/7O7j9x6WqahWLeiMriwSblVl6ra4Ov5aaoFCSXSabh8xIrpon8QyozBgMolqccoay6Mm+XH9U0BkcAjjw6TI8Yc5nt6z4E5V8AuKmQSU51iNuu8CS2HHcRuTCOqI1+NkuoSxCus4Da9k7FeN/cbp0uQmbq2adbTEdyipvhAKOZyO5lETrVgJy7fK36sYL2g9uwwGs+G91cWrMQ5Vu4utkmmwcRRGqifpzI8fMMcCZxszI2ZVfdfOXAOK/DYj4o+QSR6uXYDkPuGbQEY5sWxvawH5tGFx3g2eDo4ATeLjFXOecvOALuN3hmHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FogVPrgh1h2ys6nFmRwOchabOLyapNCXxEPyqAwIMU=;
 b=GniiQ3daRlGsIs/lPM2R2jH4U1tx1uNd9CUtwnIec2NthUTxxSk8v40VjeTOmiTNOaE9vVKoqRYAdgYUtI317mfk0RXNPU28fZwAfsJkeUNS/qCVD5AyergK2uvrVitnVejH4ziuV/ea6N5LAqv2LJ7uTwWmaR0cSLXOoJLOHITzdgHMZk7J2IiQL2CoNqWfSZ6N8PociDeS7YS74cTxNXgLnXRhTQVz4GPHJ3YsVpozhZG455MekuAEBBT4BzF+xKhcH8pj1XknvJ8oH6OUr0RYDFv/LEDj166+n+ZvHooEv1VYkxLHzUV2hDrzZzTSVXrUej1BSKF1YdLrzx+Ejw==
Received: from DUZPR01CA0108.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::23) by VI0PR07MB11179.eurprd07.prod.outlook.com
 (2603:10a6:800:303::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Tue, 12 May
 2026 07:24:56 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:10:4bb:cafe::c3) by DUZPR01CA0108.outlook.office365.com
 (2603:10a6:10:4bb::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 07:24:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 07:24:56 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 12 May 2026 09:24:56 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id CD7A34020675;
	Tue, 12 May 2026 09:24:55 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id B8D6A7000582; Tue, 12 May 2026 09:24:55 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 1/3] devtool: upgrade: extract changelog between versions
Date: Tue, 12 May 2026 09:24:44 +0200
Message-ID: <20260512072446.2323529-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260512072446.2323529-1-daniel.turull@ericsson.com>
References: <20260512072446.2323529-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B93:EE_|VI0PR07MB11179:EE_
X-MS-Office365-Filtering-Correlation-Id: ed329146-50dd-44d0-26f8-08deaff791a8
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|22082099003|18002099003|56012099003|11063799003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	bd/58Sn3KkA1S6of1+nJubIE/bfQ6HPF98mfkotT2l438zr6/EFJCV98LyyMHgTGQRpp0FBh3MrtZgbFIR7Mh0uI6aKZtwrvJNTLD7XGjX8/jfv3L9mKFlSPhF9tXudc+K/UFOA1IkylU1d6RrEaisRCT6J+c3ziqEUZeKQCMrRoqBmy+RXtBlqFJT4lGiaDc/0DnKTFNA5BrFL+bmlL9dCAzEvSeBtaxM8E7cWUvZqDMk5/3btwa+UXIm2XBBu2pbuVKICIgm2r6cwr2wFs/CrnBz5ozax+80oWibC1dcv0RK+R1YXZeI82WSA+AshU5kHI9dng8YPdQqM0RNQ7P4UyIHeJfLSt3ZTZw+MH1OgMZ43ra+UvvXrZvzYpwFitHwgHr2L6axeQ+nZ2+lzbrrUCVLDwkVPmf4glkVnNNtExEtIVpetynmAbvGipnAsnvKOj9Ing1WngtS+2iRX+ginaAQ90B708CXHfHPqIMWnZiyAzsIhV8pZVONRTS3jDcZdmPGDUeKNlqdCdKvsyuh3AhzBWpTaauHZsGl8Yalf2oQi2n64Mwe4VNyrw/S/wzk5lNHIxbRvDvRJuYUS3kEq4wWzOWRz5ICVuw118RTkqmNxTSmnrfJm1k8YC5bqLLLeIHlckRX2E41J5JJIdg93/Gw2mmPo2/k707nY3hkUKyKCvK4bhoCc09pZV9ViHh5Re9rh3HVBpFrhwkohl9refbQ/cgCbAv5UcJ1CCGm8=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(22082099003)(18002099003)(56012099003)(11063799003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	lny90pLJg0L38DEIbr1QJLbVcq/81xSqhj/yqxZ37iuFQ+A4VlOQ1KFL8F7V56Dqss1OGN3RZjaa5vU3mj7NGjVJKguI0E8xRkhN2P//X2JLYlW2yKYQvWcYAe49gVuJxTIxRQ27b68nIHxEUhuFlDw6lMqZ4NvqtrAYJQzyY8wWIGJXsk+cL1BIB4zlj0QrDCWGHoOQJoFsTv/CnP00Tguqf2Z0iN27o4afV6xTe+5jKT0IlyHQ0xQlM6ZslTlI0qvN9HPPWSUex30RcOzVbzyCeKh+UaaTp0n3kxYktywUnSRt9UAgz9eVinsBpQwgHOYA/B0QdSHysU0RHU8LC1+PKjhg5kIzimu/BOQN5bnfQKdiQjkETOoc6kpRcGmf2yAUlyOgydDPAFSpPQebW569QKJDG8CjzAfJU5UTGCCqqCXdoTL8k8DFx0OQUBIn
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 07:24:56.7866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed329146-50dd-44d0-26f8-08deaff791a8
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR07MB11179
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 07:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236857

From: Daniel Turull <daniel.turull@ericsson.com>

Automatically extract changelog information when upgrading a recipe.
Uses the devtool-base tags created during upgrade to diff known
changelog files (NEWS, ChangeLog, CHANGES, etc.) between the old and
new versions. For git-based sources, falls back to git log --oneline
if no changelog file changed.

Output is written to workspace/changelogs/<pn>.txt and cleaned up on
devtool reset. This allows AUH and other tools to pick up the changelog
without implementing their own extraction logic.

Assisted-by: kiro:claude-opus-4.6
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 24 +++++++
 scripts/lib/devtool/standard.py         |  8 +++
 scripts/lib/devtool/upgrade.py          | 84 +++++++++++++++++++++++++
 3 files changed, 116 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py
index 5ed69aee1b..ea788021e6 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2028,6 +2028,30 @@ class DevtoolUpgradeTests(DevtoolBase):
     def test_devtool_upgrade_gitsm(self):
         self._test_devtool_upgrade_git_by_recipe('devtool-upgrade-test5', =
'0a60d6af95d22b4c50446559cd41942a8acd2d57')
=20
+    def test_devtool_upgrade_changelog(self):
+        # Check preconditions
+        self.assertTrue(not os.path.exists(self.workspacedir), 'This test =
cannot be run with a workspace directory under the build directory')
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */worksp=
ace')
+        # dbus-wait has ChangeLog/NEWS files and one commit between these =
revisions
+        recipe =3D 'devtool-upgrade-test2'
+        commit =3D '6cc6077a36fe2648a5f993fe7c16c9632f946517'
+        tempdir =3D tempfile.mkdtemp(prefix=3D'devtoolqa')
+        self.track_for_cleanup(tempdir)
+        # Perform upgrade
+        runCmd('devtool upgrade %s %s -S %s' % (recipe, tempdir, commit))
+        # Check changelog file was created with expected content
+        changelog_file =3D os.path.join(self.workspacedir, 'changelogs', '=
%s.txt' % recipe)
+        self.assertExists(changelog_file, 'Changelog file should exist aft=
er upgrade')
+        with open(changelog_file, 'r') as f:
+            content =3D f.read()
+        self.assertIn(recipe, content)
+        # The commit between versions fixes a typo - verify we got real co=
ntent
+        self.assertIn('typo', content)
+        # Check devtool reset cleans up changelog
+        runCmd('devtool reset %s -n' % recipe)
+        self.assertNotExists(changelog_file, 'Changelog file should be rem=
oved after reset')
+
     def test_devtool_upgrade_drop_md5sum(self):
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test =
cannot be run with a workspace directory under the build directory')
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
index 8930fde5d6..6adaf5185e 100644
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
@@ -529,6 +555,52 @@ def _run_recipe_upgrade_extra_tasks(pn, rd, tinfoil):
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
@@ -610,6 +682,18 @@ def upgrade(args, config, basepath, workspace):
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


