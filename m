Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16DA1CDE008
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 12:44:27 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6140.1782305058372622363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 05:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=0TM5IKgU;
 spf=pass (domain: est.tech, ip: 40.107.159.13, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0eqU+Hc4Mzstxu9xMXX3npH1HL98Hvf/ANyZgiYtWFRmFgOBfV1tH7ZVyW5auv/6s0dAsUjNUD/RY0+Mc7t8GNVKCTpuAcZ1lbThTm+Bx5x0CwdBYFIOUns1DQX6oDcoE5Uwlx4DejiGNpfwx47yUk5At53LdSEWSF1B1NNqKefRQ6tNq+VExdUU6UsTk4y/uKQqF7sqwHv9R+/RdyHXpB6J4hGhxmNnWw/kQl9slafyMdTtEJE5FWw+GRE0DLG/w6jEz8rZThCNWyJiBFG6fFB8zFgzGMCsvy5IAaosDSZtMhcd6WYJ2PO37Y3V5fAJtMARPqkWgGUBervmXu8KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRine/urH+Q7ZPoCPTb3TWVvtaBMAYSGgF052Skjb1Y=;
 b=ZjavUyTQVJEXvVnEGEPOBtOZF8jDhFh6GZ2nRbRFt8+bA1xLOfDzlknPsUMb/QZUYlllYpX5vHZv0IQeVVTtHOTdXR6XuO1q1h1QW+6AK/qLsHSt1V/2yf7EO6vAKbR9wkAiuj8ghP10NrE5iMVU3GT3aveFE2MdmvTAl00AhetC8wxuPQdjjV5JgMFpbWIH3ZyEvDk/Gkpv05RloOGq7YAkkySG4Z/aivied2AVyhVDjAGzAZmLvbTJYWKGrm8PA2hh6FMG7ZB9Qy9xYrYG8bT8Q0pBLASYfkCAVPAxMox9d7S8r52hGpnYm8JByiUQSsxPUnJp4ObaBJpGiB4ksw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRine/urH+Q7ZPoCPTb3TWVvtaBMAYSGgF052Skjb1Y=;
 b=0TM5IKgUhMQz/nDRtHw67AGdBLdeHiZzy+ahvoSp6UDwz0fgwWd1h8jbDTLHdTGShJW6PDO5YDsAAxzNgWb7vmK/9xO9tZde5wu7J7zu4nudJbXeAmxTS8oKVsqIfkK+3Y8N8yt6PsmK3N2ovQ12Q3aXd6QPq8ZMaBYhbkGkowh3uKHJyC7aJZIoobuUjVXOcFIUEqJnGD1NCu+xIzkaCb0LdVXHNfJCY6nK6BpS+uRw1m4U3OKI24Xmz2xv7U5DuHJTTJAf+EMutlyeNxPHJD8DII5uZm4ltaHhdhokUFB5JCWMr48fhky/tbMICEZlz2JgU4GAB4SqaQjUnCsQxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 GV1P189MB2739.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1c9::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.20; Wed, 24 Jun 2026 12:44:20 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0159.013; Wed, 24 Jun 2026
 12:44:20 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>,
	Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v2 7/9] oe/patch: pass GitApplyTree commands as argv lists
Date: Wed, 24 Jun 2026 14:44:05 +0200
Message-ID: <c401412f909d91e8bbe350c948c30064b14396d9.1782304923.git.anders.heimer@est.tech>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1782304923.git.anders.heimer@est.tech>
References: <cover.1782304923.git.anders.heimer@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU6P191CA0030.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::9) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|GV1P189MB2739:EE_
X-MS-Office365-Filtering-Correlation-Id: c6feb819-41a3-4d40-36af-08ded1ee4f80
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|22082099003|18002099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: O91j+wmb8vIJ2XK7YDNS5NnI0z2x1euMql/Cy4V7Vg3f2quSd1WZnQP2UmsAdsdMeMti6erJj5xdSrMf0UPOHU9FBrGTcXb1N80ZsNjcsfUJ46bPjVgu0ML9Erl+J1bczquvvRgNle/TDokwaNcvUamP9TDzJbYHnY0Dd0WjzE+HCjQ28t7RT9V9V1YZOSmunQ5w9o/nAgIrHN4F97rdN/XflBDwiDd1YEzXt9lo36uH8IXpH16NwHXEgDDnb6NEuTDq6doVRXndQn8lHb+rqdpt2xE14n6bxXn79sgQO4OxmprQ+vdYfMHb7LTASupZfQcBSDat//kB1Bz6EusXImzSTaka7/TLRUfwm8w8esAMiogpYe5ggJvtX6YXFmR9FMlU1a/GIQUyLOHlqcgb3bMSfWH1IS5if2AoBrxnVbwLw7WfFXHC2RY80YTVObzzxFR5xS7JB9xr5xllNE7RISLqHeqZmSEZITTc7Nj0qCMSWoS9Lt1g6VwQ2GNDbREbm1hEqeRuQZ505W3SQB/aJXodua/3bBDa2HwthAZSf1wVreRmAdRPy1tPn+rbH7e0bSEMoqPbwYA33dPCkLo5xBk7kGOG1Xco41+3rvjI3Q+3TYSCdGWiPOKtCG1PsmtMSUnlChB94z6RmVK4O3/DN+fJQ4wpEo7pamTT8MvE6KQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vwftBJPgOmAZ8WGcDkdD5Gk0Em8WE4IsX10q4JQioN+1oYYusCGqUWHs9Dwh?=
 =?us-ascii?Q?j0AiE/p1KAomzx8+tW6NWisxVbPObDu+QWu3geW6exFecAB58bf1deMKpDAM?=
 =?us-ascii?Q?awhJtoSArm2KLau/GKOvnyI4tZ8TISvF+bsn7QIdo5oPK+OdZkVV1IzFmWtS?=
 =?us-ascii?Q?nxp4/WWFmDqeGCuWszB7nyT9+cqfifJAGiO6VWJsi2c7+VEEoM4VEOTkATV0?=
 =?us-ascii?Q?BJgxQy8LToyTJ5dj4UOUboutlJ7Z5AIJ+lgv0AathVJ11jWqoH1yvlT3XZA7?=
 =?us-ascii?Q?KRqYGBfXIlw/CBep3fZYYqdxG7CZaesuxPIThze9k6Gw1wFmV+3R22le7n38?=
 =?us-ascii?Q?SJDpfpXUWubAah5g2niKfnsPxRoaLqxH6cha6dLzPo445sMBpvh600k5xbhr?=
 =?us-ascii?Q?wS40npLJlI4v/HKTJDOtwr/ND4WoAb9qUzLK/kt9f8nXQq6RV/5l9NsU+RaI?=
 =?us-ascii?Q?OnzcDjROckJOMte8e79bUCStlR+IRT7Pn5nMgVLzcNePq0BmtEYw90wS/G8X?=
 =?us-ascii?Q?HV4F5w7UddFfIns1SR+1Yme/62IqLvb3Q3XicKsty5GqnwNGVrn7p1tQ97fU?=
 =?us-ascii?Q?XExi2cKqnYWfXhupnxnKc2sIIUSctkAcqseu+7eP/r9hY/EMWd812U4FLXmt?=
 =?us-ascii?Q?td0/9S4MefcLn94YdBfD3vAVqcJu3hz8nkWoc9jSDk/6bcLt4B460M7fDCGr?=
 =?us-ascii?Q?5MGK7fiyOLIy+XQ62fjH7thvPuKSHFtqD+MkTmgiub4Cbqf+5UmPwIliUY1Q?=
 =?us-ascii?Q?PGC7xe+dn261yKJ4/wNhnteUTZ3UsQ0QlKW5C2ELyzUItw/MTcnvf5DuhyA0?=
 =?us-ascii?Q?xkTQXldL86nd/mATTNchVU77s4HNNx/P/+mg3laQuWf5W5kBNwqM3qhTH5rp?=
 =?us-ascii?Q?J6WSowUU741NfOXAz9w+BmMfX3BOk3Hpo92XfBSSZgKPwBuu0mB6wghv6qx3?=
 =?us-ascii?Q?FfgKNiMvuVdj4GXV2idH0A7gjatE+6oJJw3ofZ1voMa/NtKWI67vSbRacjWy?=
 =?us-ascii?Q?cHOmLYzzY1MtUstN8a8sU3BK961LQrcUYvxsLw+V9NWIdrauyfPTBNkVfXI0?=
 =?us-ascii?Q?YRvpNjSWt7Xmuz31KmBiDy5H221Uw9bY9DXjnwsndV8LQnXnF/Wi8NBNf3Pz?=
 =?us-ascii?Q?MoWTBN7lgaOARPr+8lsRuJtQ0SfPg186tMU8D2KOy0peoYC6dblEyjeJL2l2?=
 =?us-ascii?Q?u6L60Ri5KmJK6kUTGGkLWt2fRrjwQOmM7UQVT14WWtL/fJbyMAJqq+OIJxff?=
 =?us-ascii?Q?NTS19R9x3cHXszFZylnYPAoh3okPbzG/+cgkek5X0vPS7uBgbp/2Ccchx/YV?=
 =?us-ascii?Q?xX1MdzFxiVROdrJt2OcG30AAP1FqVWcYeGa+ORucb9WR4QRym2FGkT94ekPf?=
 =?us-ascii?Q?QEa6RnCnGN72JfyYtBnfJcOdXgd4vfNxKYcVy3msKml+UGYYueLfYLGPHz0/?=
 =?us-ascii?Q?HJoEpYB8wjFrO4U4m/oL135XaZw3cxW8tkef2BnNByXkDYd9GCAPhAIb+Vqh?=
 =?us-ascii?Q?6BaCOrE7pITC/D/i4lJbXT29NRnoAhN0geDAFhlc+tXyyWkD+pMT+ZKNEPWG?=
 =?us-ascii?Q?njCzaIndDB/SmDgtuKXa69ktB0zBjIqiFBGXUJMVIMzRohfD3gQsMA/mjwFm?=
 =?us-ascii?Q?+6CnJ4oRoR2/MZEyGh6K7nMpLDEY/xc7gS3f+xfmraxVrn/XYvyCYTYhkHrY?=
 =?us-ascii?Q?bqUiWI71qZT0m0BwtVCXHvAMzLuHiZpyj3leYPUTygdIHDVUq1fiajz4yOhY?=
 =?us-ascii?Q?dihrfkg30w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c6feb819-41a3-4d40-36af-08ded1ee4f80
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 12:44:20.0516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dgvBa8+fH5Gh3IqRGX82Cd1c3Wcq45GBvqqiDFxJ5j5bhfjzlNH59RTzMTUOxhN6eXmg59L8iPxoxAtKnzBimQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2739
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 12:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239502

After removing PATCHFILE from the git-am command, the GitApplyTree apply
and commit commands no longer need shell syntax. Build the commands as
argv lists and pass them directly to runcmd().

Remove shell quoting from git -c, --author and --date arguments now that
those values are passed directly to Git instead of through sh -c. Update
the devtool upgrade caller to use shlex.join() when it still embeds
those options in a shell command string.

Keep run=3DFalse command generation as argv lists and avoid adding notes or
committing fallback changes when no command was run. Run the dirty-tree
status check from self.dir so it inspects the patch tree consistently.

Reviewed-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Anders Heimer <anders.heimer@est.tech>
---
 meta/lib/oe/patch.py           | 50 +++++++++++++++++++---------------
 scripts/lib/devtool/upgrade.py |  2 +-
 2 files changed, 29 insertions(+), 23 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 9240637189..c76b78fcac 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -419,9 +419,9 @@ class GitApplyTree(PatchTree):
             commituser =3D d.getVar('PATCH_GIT_USER_NAME')
             commitemail =3D d.getVar('PATCH_GIT_USER_EMAIL')
         if commituser:
-            cmd +=3D ['-c', 'user.name=3D"%s"' % commituser]
+            cmd +=3D ['-c', 'user.name=3D%s' % commituser]
         if commitemail:
-            cmd +=3D ['-c', 'user.email=3D"%s"' % commitemail]
+            cmd +=3D ['-c', 'user.email=3D%s' % commitemail]
=20
     @staticmethod
     def prepareCommit(patchfile, commituser=3DNone, commitemail=3DNone):
@@ -464,9 +464,9 @@ class GitApplyTree(PatchTree):
         cmd +=3D ["commit", "-F", tmpfile, "--no-verify", "--no-gpg-sign"]
         # git doesn't like plain email addresses as authors
         if author and '<' in author:
-            cmd.append('--author=3D"%s"' % author)
+            cmd.append('--author=3D%s' % author)
         if date:
-            cmd.append('--date=3D"%s"' % date)
+            cmd.append('--date=3D%s' % date)
         return (tmpfile, cmd)
=20
     @staticmethod
@@ -593,9 +593,9 @@ class GitApplyTree(PatchTree):
         cmd =3D ["git", "reset", "HEAD", self.patchdir]
         output +=3D runcmd(cmd, self.dir)
         # Commit the result
-        (tmpfile, shellcmd) =3D self.prepareCommit(patch['file'], self.com=
mituser, self.commitemail)
+        (tmpfile, cmd) =3D self.prepareCommit(patch['file'], self.commitus=
er, self.commitemail)
         try:
-            output +=3D runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+            output +=3D runcmd(cmd, self.dir)
         finally:
             os.remove(tmpfile)
         return output
@@ -603,16 +603,24 @@ class GitApplyTree(PatchTree):
     def _applypatch(self, patch, force =3D False, reverse =3D False, run =
=3D True):
         import shutil
=20
-        def _applypatchhelper(shellcmd, patch, force =3D False, reverse =
=3D False, run =3D True):
+        def _applypatchhelper(cmd, patch, force =3D False, reverse =3D Fal=
se, run =3D True):
+            cmd =3D list(cmd)
+
             if reverse:
-                shellcmd.append('-R')
+                cmd.append('-R')
=20
-            shellcmd.append(patch['file'])
+            cmd.append(patch['file'])
=20
             if not run:
-                return "sh" + "-c" + " ".join(shellcmd)
+                return cmd
=20
-            return runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+            return runcmd(cmd, self.dir)
+
+        def _committed_fallback_output(output):
+            if not run:
+                return output
+            output +=3D self._commitpatch(patch)
+            return output
=20
         reporoot =3D (runcmd("git rev-parse --show-toplevel".split(), self=
.dir) or '').strip()
         if not reporoot:
@@ -623,7 +631,7 @@ class GitApplyTree(PatchTree):
             if self._need_dirty_check():
                 # Check dirtyness of the tree
                 try:
-                    output =3D runcmd(["git", "--work-tree=3D%s" % reporoo=
t, "status", "--short"])
+                    output =3D runcmd(["git", "--work-tree=3D%s" % reporoo=
t, "status", "--short"], self.dir)
                 except CmdError:
                     pass
                 else:
@@ -631,14 +639,13 @@ class GitApplyTree(PatchTree):
                         # The tree is dirty, no need to try to apply patch=
es with git anymore
                         # since they fail, fallback directly to patch
                         output =3D PatchTree._applypatch(self, patch, forc=
e, reverse, run)
-                        output +=3D self._commitpatch(patch)
-                        return output
+                        return _committed_fallback_output(output)
             try:
-                shellcmd =3D ["git", "--work-tree=3D%s" % reporoot]
-                self.gitCommandUserOptions(shellcmd, self.commituser, self=
.commitemail)
-                shellcmd +=3D ["am", "--committer-date-is-author-date",
-                             "-3", "--keep-cr", "--no-scissors", "-p%s" % =
patch['strippath']]
-                return _applypatchhelper(shellcmd, patch, force, reverse, =
run)
+                cmd =3D ["git", "--work-tree=3D%s" % reporoot]
+                self.gitCommandUserOptions(cmd, self.commituser, self.comm=
itemail)
+                cmd +=3D ["am", "--committer-date-is-author-date",
+                        "-3", "--keep-cr", "--no-scissors", "-p%s" % patch=
['strippath']]
+                return _applypatchhelper(cmd, patch, force, reverse, run)
             except CmdError:
                 # Need to abort the git am, or we'll still be within it at=
 the end
                 try:
@@ -660,13 +667,12 @@ class GitApplyTree(PatchTree):
                 except CmdError:
                     # Fall back to patch
                     output =3D PatchTree._applypatch(self, patch, force, r=
everse, run)
-                output +=3D self._commitpatch(patch)
-                return output
+                return _committed_fallback_output(output)
         except:
             patch_applied =3D False
             raise
         finally:
-            if patch_applied:
+            if patch_applied and run:
                 GitApplyTree.addNote(self.dir, "HEAD", GitApplyTree.origin=
al_patch, os.path.basename(patch['file']), self.commituser, self.commitemai=
l)
=20
=20
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.p=
y
index 061a1ce2a0..74adb29402 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -283,7 +283,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcre=
v, srcbranch, branch, kee
=20
         useroptions =3D []
         oe.patch.GitApplyTree.gitCommandUserOptions(useroptions, d=3Drd)
-        __run('git %s commit -q -m "Commit of upstream changes at version =
%s" --allow-empty' % (' '.join(useroptions), newpv))
+        __run('git %s commit -q -m "Commit of upstream changes at version =
%s" --allow-empty' % (shlex.join(useroptions), newpv))
         __run('git tag -f --no-sign devtool-base-%s' % newpv)
=20
     revs =3D {}

