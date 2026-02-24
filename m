Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E7CF55422
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 23:22:57 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34121.1771975366815989747
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 15:22:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=MXyWlnO2;
 spf=pass (domain: axis.com, ip: 52.101.83.32, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kvFijDvO6uX6FrLFsTxKaGnmBMZpRhlq2dDqYixEHnpbBtNgLlroXBJiRyqehrp6JF+LBs4VxnKosIG/BhC0eD8P0P3QQE3hQtmH1Yg8WG53E5SVe10b4NQPCH6F5xV/LxdzuvhyHp1j8PD7RbbUEwRb++tdvAnRGIrR3NFGriXbBkK5Hr/5yykUXEI6/asn0n+FGphlRSG34Ca5gkNdl9t77nkct59Wfa+QMkE/b3f41KKjZ9FMjXNBHMQP1Cq5boHGVZ/cCv93AfSmhngPtvHPY7TnWSwcqX7meU6Wsvqe2dHwZ9TZEvhDSRd8NyduHzTgD42KXOWIbBamhhnWLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpAe5ArrNNzv1uGtu+GSPz9qAGoM8FWFym/qo3Pg7OY=;
 b=EOmMyjTLXe8fQE0dsy8lJbjhwvXgNgFLYVHVXghUATLC2LmVdy9IqHHoOY4ijcf90usul2cdBBtawa1MG1alZF6rYsfwCCieRDBRvYgzbWWH0BBYjEkWDPVwcHY+RydvKEYix9zaori2UbUQU27ymN8fo+0189YNbnKvdDDpRuDOzPt3P6rfHC+wnxPdzAFoH7ie7tfbTJtInj1+1IysKC+353h8ba1Zb4tU7EYSQrZQeeJSsPFzkKUok0/BuMP/ZR0roz6VVwxbQ2aG9GH0++BbMmSQDkFXXG0de1DDg88SGwzMlWhxC+B2M5dqRf/V8fr+PFcSf+eDerhJKklMvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UpAe5ArrNNzv1uGtu+GSPz9qAGoM8FWFym/qo3Pg7OY=;
 b=MXyWlnO2oYHE8CycyqEM1PlDt39/r8RyqFilbeMOyscAmgNXeQzMM9jEpWrzn4vVLGhPZb6MR1E/OCFH+gNydUGNATnuBhNbWgmf6/bl3ncn4pm/5cmtGQxHsORlWeh2PLbED9wzbrYYl+NlVbwSzuMldVcAMf0zvSqIoe6KwHc=
Received: from AS4P190CA0005.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::17)
 by DU4PR02MB11213.eurprd02.prod.outlook.com (2603:10a6:10:5ef::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 23:22:41 +0000
Received: from AM3PEPF0000A790.eurprd04.prod.outlook.com
 (2603:10a6:20b:5de:cafe::42) by AS4P190CA0005.outlook.office365.com
 (2603:10a6:20b:5de::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Tue,
 24 Feb 2026 23:22:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A790.mail.protection.outlook.com (10.167.16.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 23:22:41 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Wed, 25 Feb
 2026 00:22:40 +0100
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Wed, 25 Feb
 2026 00:22:40 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 25 Feb 2026 00:22:40 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 87EF929B7
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 00:22:40 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 8380D120040; Wed, 25 Feb 2026 00:22:40 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 2/2] devtool: standard: Add new patches in correct order when finishing
Date: Wed, 25 Feb 2026 00:22:36 +0100
Message-ID: <20260224232236.2048910-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224232236.2048910-1-pkj@axis.com>
References: <20260224232236.2048910-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A790:EE_|DU4PR02MB11213:EE_
X-MS-Office365-Filtering-Correlation-Id: 209fcd7e-a2ea-4f9d-4aa9-08de73fb9b32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1SWbYImGnP8DxgQi498vwXlHuOZE2Cfqa8xHjYnnN5EHoNqzxrRpILSPbvjG?=
 =?us-ascii?Q?bnjHKkmP+yhbHv4TNR82X1u/xyjN8XbH4CDqhlg+jssHYCDgU/zSe7TcrGOT?=
 =?us-ascii?Q?lxnEaC1o+W5s88eBPXFfQ8OtFFmbncYtd0V8rsoXVMCHk/i0mjZ+uVdR1S3N?=
 =?us-ascii?Q?tYqIJNqHEU/Chm6oMYpW0m4MeJ2eespZ+xNRkn6varJ3dwNdMlgO/j5OxfY4?=
 =?us-ascii?Q?F9Ug3lD0hEPvoqjM9T3gdRp3Y10FRmqIDPUAvpe+JqB++BojhdcCQc0Ng8Ov?=
 =?us-ascii?Q?jdI5MkbVXa9Iuyx9D9pX3t292sjk1elXiIgXN01Jr7+OSf3rS+86zxzDKzX/?=
 =?us-ascii?Q?hOgDLgoyDimfbXGk11N2Xm47tDic4IN6ngyxWQktkTFO31aROTUN/RJJ3Uwl?=
 =?us-ascii?Q?BdI2vSn1sLEYajvJMKTLxEhipjPYxC53qDwk/gt97i5XxKs4S4ce1XE767dp?=
 =?us-ascii?Q?iqwKGlSJniKUw5RcuvFKWxeNleIMFUlLC1cEgJOjR2RnJR9mejicQrzVskuT?=
 =?us-ascii?Q?A99QXt8tFCKpY6WqPwpQCZgg6iXpFlCkDrDLt6O5qOyX2KMwJKMe1Cqk6StC?=
 =?us-ascii?Q?L5ktt4pVOFoAKlH6q6KdiJsAInzp1JltwebpnwQWFlAhzHs6bPZriZJ2tXIy?=
 =?us-ascii?Q?PVF/GAowDakPnHxcysJICyb7IBxVk8k6B2FAINMp6vE/TqDGzbjBGoGamt1K?=
 =?us-ascii?Q?P5FOsNci/qvGZeC7JCHUqdHvwEsFCZeLBXECAGnv56NqPfdXXUGpBdiHtg7x?=
 =?us-ascii?Q?jMXwyXnfX+gNN2jWkQI+8J90m6wIps9HGfuuV6kaaQoMGYeJsHjluFDg3RXx?=
 =?us-ascii?Q?mZ1suNiJjewARHeqTsL6veJEcn/bPevuRSrZmzslUYTOT1fKcK5F92FeCk7D?=
 =?us-ascii?Q?Mc/a2KRmwkoc0vNdtWoEvogZ9SSn7nap15l5zIpto2KIaHc4xap8yLLQD8ag?=
 =?us-ascii?Q?Pov4OTlRqAp6d6jzwI8w/MDi+/dNsQQTgjgBvL7O+5g9jFgJbRq61x+1zT7r?=
 =?us-ascii?Q?YBa+1xSk6yyj23/hvC4LXSTR6xIbamm6ij09/q/l0eHZrtVj7M62r3x4VtMn?=
 =?us-ascii?Q?Pqp22brdSKXndVDDZp0O7ax21Aha8KDxPkBw5H5SwnSIpNLBAuans3S+NVLo?=
 =?us-ascii?Q?ix+H1dnGzdniXONu4cJe+ZiMITvxt7NMSQhg8LRfG4GbArlifvfyty864rMk?=
 =?us-ascii?Q?vRk/LowOT0SXWX4x32LkUMe0bcwkwmO2F9orrIbfcDsq7llgXZQI0HB2vO5/?=
 =?us-ascii?Q?NEDQtfek4KnMyBXDi2q9SZi25umcIMiiV9LKa3aoUrTGy+I3ocxV2eFg0zbR?=
 =?us-ascii?Q?vA9bcQDGH2lqMrBKC2M4gs0rEvVgQjY6FuTxAKRrWw46OF9/5eKfWQtXnUyQ?=
 =?us-ascii?Q?Qkv4v0hrQ3xXJMqYeZi6AQm3ZDN43XaqmHM5xhjJinh9IuOX6dFe8sp5RE2d?=
 =?us-ascii?Q?Eg9RRNnNryUMhsClqzQXOieKfCJMisBhZZRVlxn/Oqc+ixpv99xJxEKTN8D0?=
 =?us-ascii?Q?l/nzLHllt3Occ+/WOy7Dseqo7p7mKdwuwrs4GspVwMCjJVu7xM4kmNwZTTyz?=
 =?us-ascii?Q?bcb50biYlHbCcqi9Z9SQqvaV/GSsPr1TArqiSYrJA8k3goZZyKnGG5RzOfzY?=
 =?us-ascii?Q?DcHmSeDCDbYWn19KaUPTLXVgCkuqZOfDebEqCsuje77VrDvXq0STfPRnTa9Y?=
 =?us-ascii?Q?lWTIkg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5NkV4llfe0yn7DY9Ruwps3/OK1Q+7MRzKnQzAul9vvMtGvl9U7mWhIk6UlEgNVwhGrfbU5Xm1kaRLb4zlA0N8smK5BAQlDpJCON6mU5XdqAWm8LP2V/640b7nzZTpUUsoyw58XllJEYA4v4jvWi+GTLHHlw7wShqQ95HJYFiRbOyTjIH7KR8CcusMITLgs2MniAGHwYc4KroyNYOk7GQCcktrlJ0LUQW69i3BInbdh4bKPtjpSFnbySUIXa/+49t6UtF0/suoRISruYVMUdF+R8wiIoyMtG1ddFu83g6v/XR97kVj0DqNr3hIg0SCLtLU49bGOTn+zGsjlVw4cML5WlFZiTFphyRFXm3TWfyBRYCC4W5GzbBW3cnDqncCk98gNx+WAeD32tHnKlU/8VOgI7qcUPtQeqE6DjjqmFKkH8MCMtGPm1P0omZxRvVx9dT
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 23:22:41.0527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 209fcd7e-a2ea-4f9d-4aa9-08de73fb9b32
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR02MB11213
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 23:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231918

Make sure that new patches that are added as a result of using devtool
finish are added to the SRC_URI in the same order they were committed.

Previously, the order was a result of the arbitrary order the patch
files were returned by os.walk(), which typically resulted in them being
added to the SRC_URI in the reverse order they were committed.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Rely on GitApplyTree.extractPatches() to return the paths to
         the patches rather than using os.walk() to find them.

 meta/lib/oeqa/selftest/cases/devtool.py |  30 +++++--
 scripts/lib/devtool/standard.py         | 110 ++++++++++++------------
 2 files changed, 78 insertions(+), 62 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py
index d1209dd94e..870317d4ff 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2314,6 +2314,11 @@ class DevtoolUpgradeTests(DevtoolBase):
         result =3D runCmd('git status --porcelain', cwd=3Dtempdir)
         self.assertIn('M maps.c', result.output)
         result =3D runCmd('git commit maps.c -m "Add a comment to the code=
"', cwd=3Dtempdir)
+        # Make another change to the source
+        result =3D runCmd('sed -i \'/^#include "mdadm.h"/a \\/* Here is an=
other comment *\\/\' maps.c', cwd=3Dtempdir)
+        result =3D runCmd('git status --porcelain', cwd=3Dtempdir)
+        self.assertIn('M maps.c', result.output)
+        result =3D runCmd('git commit maps.c -m "Add another comment to th=
e code"', cwd=3Dtempdir)
         for entry in os.listdir(recipedir):
             filesdir =3D os.path.join(recipedir, entry)
             if os.path.isdir(filesdir):
@@ -2333,8 +2338,15 @@ class DevtoolUpgradeTests(DevtoolBase):
         self.assertNotIn(recipe, result.output, 'Recipe should have been r=
eset by finish but wasn\'t')
         self.assertNotExists(os.path.join(self.workspacedir, 'recipes', re=
cipe), 'Recipe directory should not exist after finish')
         expected_status =3D [(' M', '.*/%s$' % os.path.basename(oldrecipef=
ile)),
-                           ('??', '.*/.*-Add-a-comment-to-the-code.patch$'=
)]
+                           ('??', '.*/.*-Add-a-comment-to-the-code.patch$'=
),
+                           ('??', '.*/.*-Add-another-comment-to-the-code.p=
atch$')]
         self._check_repo_status(recipedir, expected_status)
+        result =3D runCmd('git diff %s' % os.path.basename(oldrecipefile),=
 cwd=3Dos.path.dirname(oldrecipefile))
+        # Check that the recipe got updated as expected
+        # Can't use self._check_diff() as the order of the added files mat=
ter.
+        result =3D result.output.splitlines()
+        self.assertEqual('+           file://0001-Add-a-comment-to-the-cod=
e.patch \\', result[8])
+        self.assertEqual('+           file://0002-Add-another-comment-to-t=
he-code.patch \\', result[9])
=20
     def test_devtool_finish_modify_otherlayer(self):
         recipe, oldrecipefile, recipedir, filesdir =3D self._setup_test_de=
vtool_finish_modify()
@@ -2343,7 +2355,7 @@ class DevtoolUpgradeTests(DevtoolBase):
         relpth =3D os.path.relpath(recipedir, os.path.join(get_bb_var('COR=
EBASE'), 'meta'))
         appenddir =3D os.path.join(get_test_layer(), relpth)
         self.track_for_cleanup(appenddir)
-        # Try finish to the original layer
+        # Try finish to another layer than the original layer
         self.add_command_to_tearDown('rm -rf %s ; cd %s ; git checkout %s'=
 % (recipedir, os.path.dirname(recipedir), recipedir))
         result =3D runCmd('devtool finish %s meta-selftest' % recipe)
         result =3D runCmd('devtool status')
@@ -2356,15 +2368,19 @@ class DevtoolUpgradeTests(DevtoolBase):
         recipefn =3D recipefn.split('_')[0] + '_%'
         appendfile =3D os.path.join(appenddir, recipefn + '.bbappend')
         self.assertExists(appendfile, 'bbappend %s should have been create=
d but wasn\'t' % appendfile)
+        # Check that the bbappend got created as expected
+        with open(appendfile, 'r') as f:
+            newlines =3D f.readlines()
+        self.assertEqual('SRC_URI +=3D "file://0001-Add-a-comment-to-the-c=
ode.patch file://0002-Add-another-comment-to-the-code.patch"\n', newlines[2=
])
         newdir =3D os.path.join(appenddir, recipe)
         files =3D os.listdir(newdir)
-        foundpatch =3D None
-        for fn in files:
-            if fnmatch.fnmatch(fn, '*-Add-a-comment-to-the-code.patch'):
-                foundpatch =3D fn
+        foundpatch =3D False
+        for fn in files[:]:
+            if fnmatch.fnmatch(fn, '*-Add-a*-comment-to-the-code.patch'):
+                files.remove(fn)
+                foundpatch =3D True
         if not foundpatch:
             self.fail('No patch file created next to bbappend')
-        files.remove(foundpatch)
         if files:
             self.fail('Unexpected file(s) copied next to bbappend: %s' % '=
, '.join(files))
=20
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py
index f4d5d7cd3f..b706d9c7a1 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1325,60 +1325,60 @@ def _export_patches(srctree, rd, start_revs, destdi=
r, changed_revs=3DNone):
=20
     # Generate patches from Git, exclude local files directory
     patch_pathspec =3D _git_exclude_path(srctree, 'oe-local-files')
-    GitApplyTree.extractPatches(srctree, start_revs, destdir, patch_pathsp=
ec)
-    for dirpath, dirnames, filenames in os.walk(destdir):
-        new_patches =3D filenames
-        reldirpath =3D os.path.relpath(dirpath, destdir)
-        for new_patch in new_patches:
-            # Strip numbering from patch names. If it's a git sequence nam=
ed patch,
-            # the numbers might not match up since we are starting from a =
different
-            # revision This does assume that people are using unique short=
log
-            # values, but they ought to be anyway...
-            new_basename =3D seqpatch_re.match(new_patch).group(2)
-            match_name =3D None
-            old_patch =3D None
-            for old_patch in existing_patches:
-                old_basename =3D seqpatch_re.match(old_patch).group(2)
-                old_basename_splitext =3D os.path.splitext(old_basename)
-                if old_basename.endswith(('.gz', '.bz2', '.Z')) and old_ba=
sename_splitext[0] =3D=3D new_basename:
-                    old_patch_noext =3D os.path.splitext(old_patch)[0]
-                    match_name =3D old_patch_noext
-                    break
-                elif new_basename =3D=3D old_basename:
-                    match_name =3D old_patch
-                    break
-            if match_name:
-                # Rename patch files
-                if new_patch !=3D match_name:
-                    bb.utils.rename(os.path.join(destdir, new_patch),
-                              os.path.join(destdir, match_name))
-                # Need to pop it off the list now before checking changed_=
revs
-                oldpath =3D existing_patches.pop(old_patch)
-                if changed_revs is not None and dirpath in changed_revs:
-                    # Avoid updating patches that have not actually change=
d
-                    with open(os.path.join(dirpath, match_name), 'r') as f=
:
-                        firstlineitems =3D f.readline().split()
-                        # Looking for "From <hash>" line
-                        if len(firstlineitems) > 1 and len(firstlineitems[=
1]) =3D=3D 40:
-                            if not firstlineitems[1] in changed_revs[dirpa=
th]:
-                                continue
-                # Recompress if necessary
-                if oldpath.endswith(('.gz', '.Z')):
-                    bb.process.run(['gzip', match_name], cwd=3Ddestdir)
-                    if oldpath.endswith('.gz'):
-                        match_name +=3D '.gz'
-                    else:
-                        match_name +=3D '.Z'
-                elif oldpath.endswith('.bz2'):
-                    bb.process.run(['bzip2', match_name], cwd=3Ddestdir)
-                    match_name +=3D '.bz2'
-                updated[match_name] =3D {'path' : oldpath}
-                if reldirpath !=3D ".":
-                    updated[match_name]['patchdir'] =3D reldirpath
-            else:
-                added[new_patch] =3D {}
-                if reldirpath !=3D ".":
-                    added[new_patch]['patchdir'] =3D reldirpath
+    new_patches =3D GitApplyTree.extractPatches(srctree, start_revs, destd=
ir, patch_pathspec)
+    for patch_path in new_patches:
+        new_patch =3D os.path.basename(patch_path)
+        dirpath =3D os.path.dirname(patch_path)
+        patchdir =3D os.path.basename(dirpath)
+
+        # Strip numbering from patch names. If it's a git sequence named p=
atch,
+        # the numbers might not match up since we are starting from a diff=
erent
+        # revision This does assume that people are using unique shortlog
+        # values, but they ought to be anyway...
+        new_basename =3D seqpatch_re.match(new_patch).group(2)
+        match_name =3D None
+        old_patch =3D None
+        for old_patch in existing_patches:
+            old_basename =3D seqpatch_re.match(old_patch).group(2)
+            old_basename_splitext =3D os.path.splitext(old_basename)
+            if old_basename.endswith(('.gz', '.bz2', '.Z')) and old_basena=
me_splitext[0] =3D=3D new_basename:
+                old_patch_noext =3D os.path.splitext(old_patch)[0]
+                match_name =3D old_patch_noext
+                break
+            elif new_basename =3D=3D old_basename:
+                match_name =3D old_patch
+                break
+        if match_name:
+            # Rename patch files
+            if new_patch !=3D match_name:
+                bb.utils.rename(patch_path, os.path.join(dirpath, match_na=
me))
+            # Need to pop it off the list now before checking changed_revs
+            oldpath =3D existing_patches.pop(old_patch)
+            if changed_revs is not None and dirpath in changed_revs:
+                # Avoid updating patches that have not actually changed
+                with open(os.path.join(dirpath, match_name), 'r') as f:
+                    firstlineitems =3D f.readline().split()
+                    # Looking for "From <hash>" line
+                    if len(firstlineitems) > 1 and len(firstlineitems[1]) =
=3D=3D 40:
+                        if not firstlineitems[1] in changed_revs[dirpath]:
+                            continue
+            # Recompress if necessary
+            if oldpath.endswith(('.gz', '.Z')):
+                bb.process.run(['gzip', match_name], cwd=3Ddestdir)
+                if oldpath.endswith('.gz'):
+                    match_name +=3D '.gz'
+                else:
+                    match_name +=3D '.Z'
+            elif oldpath.endswith('.bz2'):
+                bb.process.run(['bzip2', match_name], cwd=3Ddestdir)
+                match_name +=3D '.bz2'
+            updated[match_name] =3D {'path' : oldpath}
+            if patchdir !=3D '.':
+                updated[match_name]['patchdir'] =3D patchdir
+        else:
+            added[new_patch] =3D {}
+            if patchdir !=3D '.':
+                added[new_patch]['patchdir'] =3D patchdir
=20
     return (updated, added, existing_patches)
=20
@@ -1740,7 +1740,7 @@ def _update_recipe_patch(recipename, workspace, srctr=
ee, rd, appendlayerdir, wil
                         patchdir_param['patchdir'] =3D patchdir
                 patchfn =3D os.path.join(patches_dir, patchdir, basepath)
                 if os.path.dirname(path) + '/' =3D=3D dl_dir:
-                    # This is a a downloaded patch file - we now need to
+                    # This is a downloaded patch file - we now need to
                     # replace the entry in SRC_URI with our local version
                     logger.info('Replacing remote patch %s with updated lo=
cal version' % basepath)
                     path =3D os.path.join(files_dir, basepath)

