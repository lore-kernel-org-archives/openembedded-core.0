Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC11AECD9B7
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 01:13:58 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1170.1770340437776681887
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 17:13:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=mkEAqQCP;
 spf=pass (domain: axis.com, ip: 40.107.162.68, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2Q3EeiShFJsIlPuxFkUZdKzYilgcnJ6/5o7holUVHLB3IPje39D9q/8rK1s8uC0jm0rzwgBzJ4qM7KvH8xR0QoAyP2GdE+jmxKF3qWhFONoNK/iCwVTkqbgxs+MICP1n+n4laIn1pzWEQ8o8PA/E60nCZULkm5qYyKXW4KPb11Iwcbu7PBcyVF2NM3kEwsaY9xQmzvHfUDkmK8PJQGpNtMS/yO7Yhtx3Wbkj9eXXdXG5Si/j+Zw01BUpoQ3y6D5o9QsYDdareYUyoRNOeBU+dfiRUySKovmucgqUiY5J2pfFduS+enTnuHPFFp7wqF2gxRfU7FZh+w2JkKAyWPbwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qR2nGYFPK3igALWcqjoB3qxeEYHrdfD9vxgkesCqE5o=;
 b=ho0JBIioyXY28O2s5fbVh5mkSVi4BEI/Vk/4fmkzXn5SXzxmOsfcVK8Bfu5Iz9piRO3kaEyPSiEf6FmjOOqvUrbBjd+JMhEmHasl4JTtK70lozqqPM//gKia/m1lzjikJCX48sGSRcGmWqHNPFDp0/912AZ1F7STiPSzwzUL37c7H8DEfj+FEGFvqXX9v+sIa9ZJ65xb28MF3ZQHVhc4BsnDkS9dPU2oD9b/yPlpxyEKg4iuTM6DgEfVvj3BmbFkyLnVDrNP0mIKmO4cNfWxwtGosCMri/0KT242UiBj9xhqctdYPqpID04RdalzqYniwcbEYlNQoWgg4Pwhb130Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qR2nGYFPK3igALWcqjoB3qxeEYHrdfD9vxgkesCqE5o=;
 b=mkEAqQCPQEEJsf4RZkZ+m5n35g3XGnVqYNmeq0SciFIFobXAoyARmdXUJbvAUzqhMUSRETiZPuNPx8AAE4ejYc084rBImpbPw+yM7YtEfVjZ4bQeW6iv0D5Nhp8fwxaACPjGOZhb83si6Bop8S8gfDJ+UHIy9bLknbmpxNsGPhc=
Received: from AS4P250CA0016.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::8)
 by AS8PR02MB9531.eurprd02.prod.outlook.com (2603:10a6:20b:5a7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 01:13:52 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::e4) by AS4P250CA0016.outlook.office365.com
 (2603:10a6:20b:5e3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 01:13:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 01:13:51 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Fri, 6 Feb
 2026 02:13:51 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Fri, 6 Feb
 2026 02:13:51 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Fri, 6 Feb 2026 02:13:51 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 50C85A6E
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Feb 2026 02:13:51 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 5A37A12042A; Fri,  6 Feb 2026 02:13:51 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] devtool: standard: Add new patches in correct order when finishing
Date: Fri, 6 Feb 2026 02:13:44 +0100
Message-ID: <20260206011344.1788785-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000040:EE_|AS8PR02MB9531:EE_
X-MS-Office365-Filtering-Correlation-Id: 286b38e9-389f-42fc-f331-08de651cfd7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vDyzki0ecxQJK4Fq533gekIou9twuqGsG3btHYML2yiWfhV4FownWTqFXI6u?=
 =?us-ascii?Q?vQWpndMSZ8pzcfbf0P39teoAkxZPS6yp6+W2sgWWhJOj7TXOpdRfEkq94xTt?=
 =?us-ascii?Q?Fd9O8vesPL7mAVdt662YeAl6YCBL43IwN8PeGXL5JUzYe8+nGRIG5bBQWLXt?=
 =?us-ascii?Q?g6y4lD8h98o+RLReyEiQ7zmAaHCnyntQ+Gun+AAb9RPuB+aTAskhQU/JLzKB?=
 =?us-ascii?Q?Ul/N9n/t6epdtKhzQxzU/qOmKTkkfdrHLJr71IjFVYPX7LG2m28ZF6HrqvyW?=
 =?us-ascii?Q?3WDUk5Ok7HrFxAjT6zEMvp/PUBDtJKHWX4V/oEhLxOzHZI7JXNUbu2Uwxztq?=
 =?us-ascii?Q?1mrCwBZq32uzdKalUkRx9enAA7GvlZJTxUApAbBlLNI1fMeuhL8CBinPaFLd?=
 =?us-ascii?Q?m+jmGkjTk1UrmSzkWbefbMy3F05QJLrilJtaGglznVrtdTLR0YziVKtQUhA+?=
 =?us-ascii?Q?sEWk6tIs6Cq5UMbV0rOS2GOEYqhg3y94eq3ZJYbVttmogBbt0HxdYXHavCCV?=
 =?us-ascii?Q?fS880b/2zE+Q3S9zz41rUmWSS2TQn+PxXkjdH/aYvw1S7+LTK7+0wIAHOiW+?=
 =?us-ascii?Q?bCmFxXtYyNpQ2krDw+gVeZHCEoWgqtdOe2KwrJZWPBRijPMQ4mDSE8XjBg2F?=
 =?us-ascii?Q?ibRB1Otvs7889BpQTWbWuJevGpaU8zbu2npFwOMOBQJZKME71dJUDRAP/G2q?=
 =?us-ascii?Q?Lc+KV6CnGN7iKiUatGjY6i62fS9laI9hoI/2H4Q9o1CH4sr9BtOxkEagIs3n?=
 =?us-ascii?Q?8tdoN3OBh5i7I/s2aMpj506LrT666bGcQUXo4X/SpIPegUD3H29dG+u/AMna?=
 =?us-ascii?Q?Oo0MeEC68PkBIGaS0o4TwtqaZ9UeP9gYGPhpeJe+3hGlAKNDj7TIZDHN+n34?=
 =?us-ascii?Q?yNe+Yj+VondHUPzkWSKjRvy7daRaD6Iwqw1ZfynxwLVZamYItcsty9OOXLeV?=
 =?us-ascii?Q?QozUz6iyMAjHzcmVW2/EDNCwKIZCyPCSHeREhHEK8JbHOkjIIyQ6YSpj4GG1?=
 =?us-ascii?Q?lowWHDZjMBqZaDDAefLvN4siwXiM0yStiKOLZnfO+C+jS3iCDrCKjJSB0CLD?=
 =?us-ascii?Q?K6ry8Uwie0ccgO15MVn1ymQgvxBtIfHBx9qDwMqxCUjcPOry2CWTO5Zu8Q0Y?=
 =?us-ascii?Q?gWo3tXoXsTQJUjfgikkvRTSSVj5OndZAu12kBl2RcpnLCf0H+bBHxGau4vds?=
 =?us-ascii?Q?KSNCVL/KiQM9NRoyo7f+XrED7aF3DVgypOKyirniPg2YUEJH9ju0/jogknxY?=
 =?us-ascii?Q?YTcow7UqJMXQmstaWZrQzmJJR1bADSDN+EofKa9sIjrDJ7uBTZ3GTrRPMNaC?=
 =?us-ascii?Q?Xf+vNP/Q+wGZ0Cyss+AhgvGq85/f1H3B78lTjrd9L68k7toi06GWXcaJNDZ7?=
 =?us-ascii?Q?uJCtKLDth5pVG/jCz+i+QZXbcOVW5O2a66Z5NfV46P8IzDU0J34U6dXcSyP8?=
 =?us-ascii?Q?+3yjkQFcb5VqFq56C/qZo06QUDH4kKiI+QPYa+ceQJopblKmINxNZsa+4fd/?=
 =?us-ascii?Q?v95x/YyuIrx1sGVjyh4XY/6WYjmQj6YKSTcm2txeibrH8XcVC9GlCqenAI0+?=
 =?us-ascii?Q?WPREGhGpcsZD9Bx3CZUAuSO9aTVIvSSlebuzqAmybX2tKjso3kJ1AiAWKTAX?=
 =?us-ascii?Q?q4bBhK6dbsT24oKG36Wt+go0bN1X4iJ8mUG1ERewRa6d2DsamAE7UfmmyHbs?=
 =?us-ascii?Q?s1aMfA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	jeDuoS9kKFK8QFgiDg76wXLuXs2pjqKxEAxJyXsZJbnZLJJOVwQhSXwlLKpRlz+w1sTNTUojyFshZ56DpUkkROknwoPNmkdbIG4B5uc4y9weR3+s1I/QySVcU6hrfbsfMvLt6r0YKYWqAJHZqJ/TzKFG8JD4SBk2B4Tmnp0TsTDzHJLSkrL9JWTJSlYJFSy6ZwWEX5scbSqomLpYWTSjwyn4Dhq6A3lzmIuAGhinn0Rj2jc9NsY6YmPwcafGqRu4asPuccCf2cmBojZeDWD3aeofTMFROzMGgPO07W2V6+geHiYbFwje0lKqL+uwGBrjil3rco3S5MZNcuVQZN9cySCHomgEjKDlrd/334kXmkbHSzaTerh09pS4J8In93IHGv7SayAHrKefUrabGu+njcxl7+DWYWt9P7yToL3bFnRjldCS/WwMcz1fKuh6V/tg
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 01:13:51.9071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 286b38e9-389f-42fc-f331-08de651cfd7b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9531
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 01:13:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230590

Make sure that new patches that are added as a result of using devtool
finish are added to the SRC_URI in the same order they were committed.

Previously, the order was a result of the arbitrary order the patch
files were returned by os.walk(), which typically resulted in them being
added to the SRC_URI in the reverse order they were committed.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 30 +++++++++++++++++++------
 scripts/lib/devtool/standard.py         |  6 ++++-
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py
index cf5ac6e9d7..0c5f11b58f 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2286,6 +2286,11 @@ class DevtoolUpgradeTests(DevtoolBase):
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
@@ -2305,8 +2310,15 @@ class DevtoolUpgradeTests(DevtoolBase):
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
@@ -2315,7 +2327,7 @@ class DevtoolUpgradeTests(DevtoolBase):
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
@@ -2328,15 +2340,19 @@ class DevtoolUpgradeTests(DevtoolBase):
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
index 1fd5947c41..7afb4654cc 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1322,7 +1322,11 @@ def _export_patches(srctree, rd, start_revs, destdir=
, changed_revs=3DNone):
     patch_pathspec =3D _git_exclude_path(srctree, 'oe-local-files')
     GitApplyTree.extractPatches(srctree, start_revs, destdir, patch_pathsp=
ec)
     for dirpath, dirnames, filenames in os.walk(destdir):
-        new_patches =3D filenames
+        # Sort the filenames to avoid the arbitrary order resulting from u=
sing
+        # os.walk(). This matters for added patches, and the assumption is=
 that
+        # they are prefixed by a four digit number resulting from the orde=
r in
+        # which they were committed.
+        new_patches =3D sorted(filenames)
         reldirpath =3D os.path.relpath(dirpath, destdir)
         for new_patch in new_patches:
             # Strip numbering from patch names. If it's a git sequence nam=
ed patch,

