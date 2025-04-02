Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2BF5C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 06:29:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1770.1743575343778495207
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 23:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6187ac4f7a=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5325kD5x025065
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Apr 2025 23:29:03 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45rtf2gb8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 23:29:03 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 1 Apr 2025 23:29:02 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 1 Apr 2025 23:29:01 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] patch.py: set commituser and commitemail for addNote
Date: Wed, 2 Apr 2025 14:29:01 +0800
Message-ID: <20250402062901.1214976-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: LcDm_OAA24Jh-JuxjxTolor4Qk4iYaWv
X-Proofpoint-GUID: LcDm_OAA24Jh-JuxjxTolor4Qk4iYaWv
X-Authority-Analysis: v=2.4 cv=fM453Yae c=1 sm=1 tr=0 ts=67ecd92f cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=A1X0JdhQAAAA:8 a=fAFh94CCbQmsslZHghoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_02,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=669
 lowpriorityscore=0 mlxscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504020039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 06:29:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214170

From: Changqing Li <changqing.li@windriver.com>

When PATCHTOOL is set to 'git', and user don't setup
user.name and user.email for git, do_patch fail with
the following error, fix by passing -c options.
CmdError("git notes --ref refs/notes/devtool append -m 'original patch: 0001-PATCH-increase-to-cpp17-version.patch' HEAD", 0, 'stdout:
stderr: Author identity unknown
*** Please tell me who you are.
Run
  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/lib/oe/patch.py | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 58c6e34fe8..edd77196ee 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -462,21 +462,23 @@ class GitApplyTree(PatchTree):
         return (tmpfile, cmd)
 
     @staticmethod
-    def addNote(repo, ref, key, value=None):
+    def addNote(repo, ref, key, value=None, commituser=None, commitemail=None):
         note = key + (": %s" % value if value else "")
         notes_ref = GitApplyTree.notes_ref
         runcmd(["git", "config", "notes.rewriteMode", "ignore"], repo)
         runcmd(["git", "config", "notes.displayRef", notes_ref, notes_ref], repo)
         runcmd(["git", "config", "notes.rewriteRef", notes_ref, notes_ref], repo)
-        runcmd(["git", "notes", "--ref", notes_ref, "append", "-m", note, ref], repo)
+        cmd = ["git"]
+        GitApplyTree.gitCommandUserOptions(cmd, commituser, commitemail)
+        runcmd(cmd + ["notes", "--ref", notes_ref, "append", "-m", note, ref], repo)
 
     @staticmethod
-    def removeNote(repo, ref, key):
+    def removeNote(repo, ref, key, commituser=None, commitemail=None):
         notes = GitApplyTree.getNotes(repo, ref)
         notes = {k: v for k, v in notes.items() if k != key and not k.startswith(key + ":")}
         runcmd(["git", "notes", "--ref", GitApplyTree.notes_ref, "remove", "--ignore-missing", ref], repo)
         for note, value in notes.items():
-            GitApplyTree.addNote(repo, ref, note, value)
+            GitApplyTree.addNote(repo, ref, note, value, commituser, commitemail)
 
     @staticmethod
     def getNotes(repo, ref):
@@ -507,7 +509,7 @@ class GitApplyTree(PatchTree):
         GitApplyTree.gitCommandUserOptions(cmd, d=d)
         cmd += ["commit", "-m", subject, "--no-verify"]
         runcmd(cmd, dir)
-        GitApplyTree.addNote(dir, "HEAD", GitApplyTree.ignore_commit)
+        GitApplyTree.addNote(dir, "HEAD", GitApplyTree.ignore_commit, d.getVar('PATCH_GIT_USER_NAME'), d.getVar('PATCH_GIT_USER_EMAIL'))
 
     @staticmethod
     def extractPatches(tree, startcommits, outdir, paths=None):
@@ -654,7 +656,7 @@ class GitApplyTree(PatchTree):
             raise
         finally:
             if patch_applied:
-                GitApplyTree.addNote(self.dir, "HEAD", GitApplyTree.original_patch, os.path.basename(patch['file']))
+                GitApplyTree.addNote(self.dir, "HEAD", GitApplyTree.original_patch, os.path.basename(patch['file']), self.commituser, self.commitemail)
 
 
 class QuiltTree(PatchSet):
-- 
2.34.1


