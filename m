Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 079BFCDB47C
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:35:49 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20964.1782221738840881784
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:35:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=j7NU3y8S;
 spf=pass (domain: est.tech, ip: 40.107.162.56, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3oz3y1gOw/0wTPZEX5iNdD+a61FUOO9rzqx9WRe9zIZgK8a7JjqVg0K4iyotyNlt8OjNd7MyVPTOOtsxYN4CuMZKrnG22qD1r5XyBXtusB2AjvgXfCdtIW/td/CkevAkjow7uHvywFRD0cZDkwNwrPjphI6cSriu0NLmQUQzZnUAVrZkZ8tZmXx4vblpFDF4ivK5hhp3bOqsYkVTcDsTDeqCyCKuVFhQO/+Or/zWlZoPuGrX0cyjsesAoW2IL4YsbADB0gcw15aSxONc2+UgpmZ4xQqcFz+2UEpKv+RAn7Kv6AjeDgpapWio1raHj2SJ9z7e6Y7fxSQfMLcpeMkaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRine/urH+Q7ZPoCPTb3TWVvtaBMAYSGgF052Skjb1Y=;
 b=AUKez4c5dBCqwW9/Xbv9a3HOGtOzDvt169xkAiHAVUpxEmOWxEQ3E1QeFfxWy0iCLmsP+vMkhqhaX5600rQ3TychM1DLcWyEccgEkO1RntO8Am+WdVUI5kFRXeflfzTnqwa8/PY1riaps5l+Nk0XJrwMLqlkPK9mFQ9r5JKFcKl+BfumUWBaKm3y0V3mEwWSGdiDEemuayOc8o6Dk3oIa3LQC7IY6Cs+mLqq+T0Lszb322yr7fT7Kr8nUBF2MZrSXNe2BazgEDRaggfnKBpLiNzvIIzcvWBk6d+ERbdTTOi3DxphmXdHIQ5a6+YEowZioMFCitJGDvw8Ha60nyy/Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRine/urH+Q7ZPoCPTb3TWVvtaBMAYSGgF052Skjb1Y=;
 b=j7NU3y8SA58KW3FdmxVXz5U1L4hcQSRlJXVYCfayPoduEgZ06wZGCc0DYQ0LP7Oz8r47DbnAfA5X48PupfchxDyyI33gKse1Yt3eQe4cFysQn9w4Fm7Qy3TwCn2ar3GtzURzs31tAMX4fSanLmHdk3/eX4Ai/l756ixYNG007xV6yp7wyAc9hDP1tjhCG6yH4CJTqsYpw7ESyiGwpmio16cdpQeMP61u4MDwSAO7rcuUP8WvxqRrEbhMDDh7QwjFk72mVlGRU/Aho01rS/n2hFnyMnKHT/oFsRtlu0xK4ZakgbrGM4eUdtOr5JJ2tJKK3tTTZbL0XxjicuapRhsI2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 VI0P189MB3639.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d7::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.19; Tue, 23 Jun 2026 13:35:35 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 13:35:35 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>,
	Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 7/9] oe/patch: pass GitApplyTree commands as argv lists
Date: Tue, 23 Jun 2026 15:35:19 +0200
Message-ID: <20260623133521.17053-8-anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623133521.17053-1-anders.heimer@est.tech>
References: <20260623133521.17053-1-anders.heimer@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0253.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::7) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|VI0P189MB3639:EE_
X-MS-Office365-Filtering-Correlation-Id: c7d5be4f-17c5-4b6c-ff31-08ded12c4e4e
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|11063799006|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: GuKAKFEPb6p9svbvFq5eaT1JOMEBAfMmbSBD9QwSv44gZoiykt8PPJXs5eQZbc+EVKrpoBPl2auyhV5skWZLfPOKOVtb/itgunX1zIApa9L8+wtR6EjY0n2bTtQvoTaBp4ubqJy+SrmualNYmVMARZ72OhVGioFN+ZdWBdUp1i6HHDRPQ7GaxB4oUt1QugdHu7oarN/r+ta4XsQDHdAnoFgk7lOUj/3FPwprswtfOMux4SyxON1aGSPQKaW2mv4Ww+hhte4dQPBjeTjASHVZoWkLXJq/ClHDKlPVyq9SH0AuUKcUo1j/vZTxiKTifoxpIv+HBPydvP8EKHuWzhpwiZdAwUPtZhXvjOMIODPaJUaNGPGhCknLfuRI0sbarHFN8bYcpNZX7ztZQZSZc8HOm2x3A0MIxKOdh2VDfIYfPg5F4ZONYGajvYzLty7FIfNZB9xLfrd4aUv2RvaJRJ9IuEMDS3ieukwGj6RelyRDngLTisOj1w2zAOXvUHg/iLLTgs7CYvUuSsOAKKegoWurYHrrQQtMoAHEbd9tt/TmhTnAmsqzQ4JxCemDRO/3kg2DLyB/A46oyTSxCGHmJ9DFiPe5jRcSOFZYgJxPxh3mA8iiOtS1U8Uxp7dtndH1nNEeHRjllOUAaHQJeq2p1WnaBQJy2y3xRJfYpkFur18QV0o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(11063799006)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KLZ1Lbl34s2FtkQdvKp8O+LrIZl9t44sp0y4b8YuxigfNEs9Ja2u/+R6wOE3?=
 =?us-ascii?Q?Q6Q3Vv8vadPElIAJxdgvI+0T1V4EMCFgfYXGXEHbnPr8cmWkiAhaUmX7GiVn?=
 =?us-ascii?Q?5K1LFVb0Couw4sk0soKTI/Yo5y7ljrLilT/faHGE6w11A0Hg/hasnr98fhCh?=
 =?us-ascii?Q?lpm+SLpJbJDyqhVc9vVj4wpg3j1RzZZKZgHCxdB8ls198PvYZZ7D6ZRLy1bU?=
 =?us-ascii?Q?ABmCDQIe57fSxb6gefrE93rH2v/geaS8A0rutmSYHdSuYhK3PLeYGeURtFJO?=
 =?us-ascii?Q?t6QoL4AQ6LRrOgl06CxqyKCdD1X5BAHd6GGBcG7+ILQ3qD+2YizbAU3KIRfB?=
 =?us-ascii?Q?o6iUZFWSDM5xntfvt+v9fo9jSaTNxEGIMDeX8KSweBGIpunQU0VBJ0Psg7NZ?=
 =?us-ascii?Q?e204MI6KL2j8EPdinagMmpi26kga6gJ7tBNqCJdiv1iwr8XHWTaByEeTIcpg?=
 =?us-ascii?Q?jP5I+rQ/hs6av6ONx88Uz/ez302/kmfOOZAHQNBS/1fFoah7ZfxuYllIv5kL?=
 =?us-ascii?Q?JJo664GDEaOCYwr6zQQ3ljHRygDwbsD5UUnQpIt6OfK/b4CKAefwaRu6qX0s?=
 =?us-ascii?Q?cXZ74WIDvN0uRFfXrMbgZTffBmuwPxF0cnEq3Lz++kP2efSuhpDUUoRMdgCZ?=
 =?us-ascii?Q?/urkt2hQbzYbQhal7yvCNKZFF2CrRreE512fI7iZFmOSI0qTOpJtF36cv1cJ?=
 =?us-ascii?Q?tiWmEsLxUfjtsSFGV94zBAZ8G/FybISFzMPIE97GW2tXqudNZf0KVXNpQON/?=
 =?us-ascii?Q?mMDVFE1EMiwxyHldMMOf8yQa3Tdt7h6CboAI7CCrxIZl92smAs6V0kdY9mNf?=
 =?us-ascii?Q?HZoT3Yock27ahEC+mtRBI/JXtgBRGB4Yh/mCmmlTl/igxkaERZQbdk4cqH3s?=
 =?us-ascii?Q?nJIs3eHjlfGFArZeu77i6bm7NGVYl7c7cbmDcYbuVYUfHX7T3JHE4byIppNU?=
 =?us-ascii?Q?tFy+hi+UwrgmPMBkieFfWQGLLtbkb6YRkT0I3DBce6wkyr13iuz7sPWr2JXI?=
 =?us-ascii?Q?V8js3TeNEPmLFsfMSy92hRcSMHl/0QV3Y7DCKLXoLQV6NUQfXIoUQsXJAkcT?=
 =?us-ascii?Q?cdDE1d04IqoGBLwbEU/tYZuy56aGaMP8bbrQjRPT2dVYB9ILMCJU/6P2kQS5?=
 =?us-ascii?Q?VAz+J/r+lxO0MeToWlgeFipva92HrChMvDgObYr4LcXGwaFhC38PVVqdowjJ?=
 =?us-ascii?Q?/4B++Zu50CkPw4QC5Dy8cbhc94Jz9wRr4O8dshrf31C+N4HoQFkFC2gZ3nCb?=
 =?us-ascii?Q?NtrgUVejxKNQeE3zJXcpOX3UgCtIJFbtX3i1KugjYereKVS3/e1chOWNlRg+?=
 =?us-ascii?Q?XnKMhp+80z4vcEEGGpKxr/tKnriSSka+U3ShouI7QOASzoBVTlsfFhYtYyMu?=
 =?us-ascii?Q?nT64PtDIxVVOzEqzCSl5R98Fvp1PkEPz84x/YkXabcZKVzuFB0oU6PpiWrac?=
 =?us-ascii?Q?3aPoXCmEHThGrbWTGZaGDdikeoxbMxP5bqjo8FmPY6xOcLBPHD7pLQXaN6mT?=
 =?us-ascii?Q?PdDwY2mQi3oGJeKvT9XjpZTKpCOrpuK/eBhw0W7g1Oei0AipcR1eIHz7edg4?=
 =?us-ascii?Q?KLChJCz6V7W4oQtl19qE4wWZs6kBTlSFXyauLODs75RX9ulbI+eo469YYVeN?=
 =?us-ascii?Q?lDkFq4g446K7zO7/u0AY9lB5oNLXDYwFJIxRIMeOIs/AoBfeZdGIpNINrAd4?=
 =?us-ascii?Q?T8xWQjcxx47yaT5XzY7uWXu0vQBYmxqOxksiw0OUTTx9n3LVqhIin9XqrtgT?=
 =?us-ascii?Q?qm/5MMjenw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c7d5be4f-17c5-4b6c-ff31-08ded12c4e4e
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 13:35:35.6982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61yT/Yb2sutP9PrbIS+wv0vX8OvEu371rlpVLvtFffHtViqBxFOyFcceX7c/nR8dJ+MAAEwAYFKjvWdZfSaDZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3639
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:35:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239400

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

