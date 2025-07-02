Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7FC9C8303C
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 10:57:23 +0000 (UTC)
Received: from smarthost01a.ixn.mail.zen.net.uk (smarthost01a.ixn.mail.zen.net.uk [212.23.1.20])
 by mx.groups.io with SMTP id smtpd.web11.20873.1751453840468015051
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 03:57:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=SHKL1jDF;
 spf=pass (domain: mcrowe.com, ip: 212.23.1.20, mailfrom: mac@mcrowe.com)
Received: from [88.97.37.36] (helo=deneb.mcrowe.com)
	by smarthost01a.ixn.mail.zen.net.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <mac@mcrowe.com>)
	id 1uWv9S-00ElC9-Kp
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Jul 2025 10:57:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=VVQqf9qVqZQM7p54fYOT9doFalaMl+tMu1jGhwgYUfM=; b=SH
	KL1jDF+NlOdfpKUL6hhcQy+g62KLlnHZ6gOxMC/yJXGJt7k0105GRMgGQLTd3iOcXV3SA692EQKnv
	AS+wFKpB9Gx+insXPp+R/7YgirjchkAvIp1td6FGmDkfJottE2VSoPxzS7JudK1DNF6tm8VQ8RfJE
	XoUVcB32cpLNpBSRNLcCmrACskhXL3qGhp+0dBz/DWVqUwxOwLQrADitGc7127Kuc6hpLSx0LhIm7
	Wxbdb+tXzJuWXBSLPStj5f1XxDMTO/fjhGdE3EEP3oKIjBSEqzmazBJjLDGcqqrAFruhfTFhqifEl
	gNo1u17Bg4jqVL1Cy+b/Xovmxgk/SfZA==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.96)
	(envelope-from <mac@mcrowe.com>)
	id 1uWv9R-005CWr-0S;
	Wed, 02 Jul 2025 11:57:17 +0100
From: mac@mcrowe.com
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] externalsrc: Always ask Git for location of .git directory
Date: Wed,  2 Jul 2025 11:56:58 +0100
Message-Id: <20250702105658.3862855-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-smarthost01a-IP: [88.97.37.36]
Feedback-ID: 88.97.37.36
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 10:57:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219820

From: Mike Crowe <mac@mcrowe.com>

externalsrc_configure_prefunc assumed that the .git directory is
${S}/.git. This isn't true for submodules at least.

srctree_hash_files already contained code to ask Git for the correct
path to the .git directory. Let's move that code to a new find_git_dir
function and call it from both places and make the behaviour consistent.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/externalsrc.bbclass | 44 ++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 70e27a8d35..527c99ab69 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -28,6 +28,20 @@
 SRCTREECOVEREDTASKS ?= "do_patch do_unpack do_fetch"
 EXTERNALSRC_SYMLINKS ?= "oe-workdir:${WORKDIR} oe-logs:${T}"
 
+def find_git_dir(d, s_dir):
+    import subprocess
+    git_dir = None
+    try:
+        git_dir = os.path.join(s_dir,
+            subprocess.check_output(['git', '-C', s_dir, 'rev-parse', '--git-dir'], stderr=subprocess.DEVNULL).decode("utf-8").rstrip())
+        top_git_dir = os.path.join(d.getVar("TOPDIR"),
+            subprocess.check_output(['git', '-C', d.getVar("TOPDIR"), 'rev-parse', '--git-dir'], stderr=subprocess.DEVNULL).decode("utf-8").rstrip())
+        if git_dir == top_git_dir:
+            git_dir = None
+    except subprocess.CalledProcessError:
+        pass
+    return git_dir
+
 python () {
     externalsrc = d.getVar('EXTERNALSRC')
     externalsrcbuild = d.getVar('EXTERNALSRC_BUILD')
@@ -169,14 +183,16 @@ python externalsrc_configure_prefunc() {
             newlinks.append(symsplit[0])
     # Hide the symlinks from git
     try:
-        git_exclude_file = os.path.join(s_dir, '.git/info/exclude')
-        if os.path.exists(git_exclude_file):
-            with open(git_exclude_file, 'r+') as efile:
-                elines = efile.readlines()
-                for link in newlinks:
-                    if link in elines or '/'+link in elines:
-                        continue
-                    efile.write('/' + link + '\n')
+        git_dir = find_git_dir(d, s_dir)
+        if git_dir:
+            git_exclude_file = os.path.join(git_dir, 'info/exclude')
+            if os.path.exists(git_exclude_file):
+                with open(git_exclude_file, 'r+') as efile:
+                    elines = efile.readlines()
+                    for link in newlinks:
+                        if link in elines or '/'+link in elines:
+                            continue
+                        efile.write('/' + link + '\n')
     except IOError as ioe:
         bb.note('Failed to hide EXTERNALSRC_SYMLINKS from git')
 }
@@ -207,17 +223,7 @@ def srctree_hash_files(d, srcdir=None):
     import hashlib
 
     s_dir = srcdir or d.getVar('EXTERNALSRC')
-    git_dir = None
-
-    try:
-        git_dir = os.path.join(s_dir,
-            subprocess.check_output(['git', '-C', s_dir, 'rev-parse', '--git-dir'], stderr=subprocess.DEVNULL).decode("utf-8").rstrip())
-        top_git_dir = os.path.join(d.getVar("TOPDIR"),
-            subprocess.check_output(['git', '-C', d.getVar("TOPDIR"), 'rev-parse', '--git-dir'], stderr=subprocess.DEVNULL).decode("utf-8").rstrip())
-        if git_dir == top_git_dir:
-            git_dir = None
-    except subprocess.CalledProcessError:
-        pass
+    git_dir = find_git_dir(d, s_dir)
 
     ret = " "
     if git_dir is not None:
-- 
2.39.5


