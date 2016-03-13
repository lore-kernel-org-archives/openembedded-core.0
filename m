Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id D7B0B73175
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 02:35:28 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id z76so187482210iof.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 18:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=GOZUUs7fifKZfMj2nhrhZbNbmwrWmpPYQEDsWWLZt7E=;
	b=wdsDJc6adJWaeo7SHtM4TJBZ67mBVJYRJg8MH15EpPPcnzK99CK2LakDVC7GNyJbfv
	bib15DAXSQly2fqFGGmqaNLNXwO4HY5LCQkJ7+jAt+tGr2Rs8p8e3ZekzDdxI4etMfVR
	lasbu+8o9518JD0fMtTatHeROMdPLqiNWs/J7hCrW8SJ7+4aKUrJvk65/R/UScjY9Fgx
	vOUjpS+kagFGh1ZbfKMoPt2Dj+0kiT1aZ9foyLrTJXvCyOEMKezjD9ZEq39VKyV/WdYt
	WfYQN/NNNPi5SSAJJ5ChgaEay96VmC9SQDY6ltW2FzRKMOh8AkXCf71W3JxZ9Dt7xkUN
	YerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=GOZUUs7fifKZfMj2nhrhZbNbmwrWmpPYQEDsWWLZt7E=;
	b=MmDMCKFhkzGEzItTQHE9MkQBpxcgw1WS26i72G+WN+X9cEDkmWT5ip/TuxHOuAoMcl
	X0IB1fFyhLIX+zXYKu2Woyzntyv8mYX5D6sdjQszZ/omcAK3UOMYaSy5/d+nOicY8tgb
	lc6fRNqvL5+wmAfFNJZxKL88bjUBbMxLqaWSMnVYEgXBpAnhGpV82zh3A9ZBnM1WGazJ
	yB9qDuKDFmUMzYEa1II3Ob2P65DVkGKoHuCcohelnE/7d/Y9FTJfaY6EAkS7USvEc23/
	p5lLiYpCvv7kWlmUFR+MMzwem5+vrzlem6aOJf0cts9h/mrKhI12jjEN3uFkd1B3n7zC
	Ve1g==
X-Gm-Message-State: AD7BkJLct6OJ75xw7/wEqggeOrkIbnUsAI2+htac8v2HUgL0Xy5wCiJHF5prejyNIc1ZxA==
X-Received: by 10.107.11.213 with SMTP id 82mr20655097iol.152.1457836528926;
	Sat, 12 Mar 2016 18:35:28 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	k6sm3934378igd.8.2016.03.12.18.35.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Mar 2016 18:35:28 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Mar 2016 21:35:29 -0500
Message-Id: <1457836529-32388-1-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.7.2
Subject: [PATCH] metadata-revs: provide more information
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 13 Mar 2016 02:35:29 -0000

Provide many more details concerning the repositories that are used in a
particular build: the remote information, the layer, the local branch, the
remote branch the local branch tracks (if any), and the HEAD commit.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/classes/buildhistory.bbclass |  6 +++++-
 meta/classes/metadata_scm.bbclass | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index b6b4324..1b0ae0e 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -615,9 +615,13 @@ def buildhistory_get_build_id(d):
 
 def buildhistory_get_metadata_revs(d):
     # We want an easily machine-readable format here, so get_layers_branch_rev isn't quite what we want
+    import subprocess
     layers = (d.getVar("BBLAYERS", True) or "").split()
-    medadata_revs = ["%-17s = %s:%s" % (os.path.relpath(i, d.getVar('BBLAYERS_FETCH_DIR', True)), \
+    medadata_revs = ["%s\tlayer:  %s\n\tbranch: %s\n\tremote: %s\n\tHEAD:   %s\n" % ( \
+        base_get_metadata_git_remote(i, None), \
+        os.path.relpath(i, d.getVar('BBLAYERS_FETCH_DIR', True)), \
         base_get_metadata_git_branch(i, None).strip(), \
+        base_get_metadata_git_remote_branch(i, None).strip(), \
         base_get_metadata_git_revision(i, None)) \
             for i in layers]
     return '\n'.join(medadata_revs)
diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_scm.bbclass
index 0f7f423..31a2c54 100644
--- a/meta/classes/metadata_scm.bbclass
+++ b/meta/classes/metadata_scm.bbclass
@@ -73,6 +73,15 @@ def base_get_metadata_git_branch(path, d):
         rev = '<unknown>'
     return rev.strip()
 
+def base_get_metadata_git_remote_branch(path, d):
+    import bb.process
+
+    try:
+        rev, _ = bb.process.run('git rev-parse --abbrev-ref --symbolic-full-name @{u}', cwd=path)
+    except bb.process.ExecutionError:
+        rev = '(HEAD does not point to a remote branch)'
+    return rev.strip()
+
 def base_get_metadata_git_revision(path, d):
     import bb.process
 
@@ -81,3 +90,12 @@ def base_get_metadata_git_revision(path, d):
     except bb.process.ExecutionError:
         rev = '<unknown>'
     return rev.strip()
+
+def base_get_metadata_git_remote(path, d):
+    import bb.process
+
+    try:
+        lines, _ = bb.process.run('git remote -v', cwd=path)
+    except bb.process.ExecutionError:
+        return '<unknown>'
+    return lines
-- 
2.7.0.rc3


