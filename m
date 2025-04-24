Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B658AC369D1
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 11:10:23 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.12421.1745493022002739496
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 04:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UanGZrY3;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso562391f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 04:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745493020; x=1746097820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qnmWx2qm8HDuNbXl0BSTpiMkRi1bOT/TSQNrq+w2BIY=;
        b=UanGZrY3mbC7c1ai4BH7qceTfC8Bpd7HbNV/I+snANvtl7CDXM0nWgcgP3f0VW3eUg
         4myewjM5VRoYw3TBdVEXMmTz3XlHqnVSCU80KAmVayg1t+foPHM1lPIuJ9bI1gSNZiu/
         CmSN+7a41PjEzh7DM7ABKq32MKoNzRV2sXsFCYNXqoWWgyDyq1qojoCEDjDLvaAVDdmG
         h9UktP12SXOSRAtNak2VCoff7wS868e3OpKzmykwWro0SduaDKcJoSxdj5mKwL/duNKc
         UI1TsOIQjRPXCowcBmq4JlfffP2auA7we2pV1ck11Nc4x+Id4pmC7qfQBVnI64wOZLCv
         1VFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745493020; x=1746097820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qnmWx2qm8HDuNbXl0BSTpiMkRi1bOT/TSQNrq+w2BIY=;
        b=j7qJaHB2cppICiRR1YVzuYTRYYd1v7ylHtnpk4vpokFiXH37YyLoeKXDX5USO67vSp
         pILhg0SbOXiO9RDTlzf8RBXBexUIUYQY1Gc76lfU4ShWQO3wAqPXvJzB9C8ImagC82ST
         BBXlFRHO9B5K7SwaZxT8whqDT75GXkyDR84V/fkgqtJS/iDakM/cyeuU8dfANOrrpqvF
         KOfObhKKo/2fU8g0XzMSfY6133w6fqz38Km+Qkx/EI40t7znUgxKTK3A1JDIPAuD1oaR
         rYD4tlTooNROn/JMP8YdD9TZjSog9Ld/cSJurH2NETumCCFr5k0tjax9L17EySK/cHpV
         Z9Vw==
X-Gm-Message-State: AOJu0YyGDVzulH/XI1UczzzBfr9Al0s0XEtZqFBtGwIdSiCQSDoiZBZA
	Meq+c57d4o3K9WBRM5WBAPckPFneUoeo5s7AqRQrVrZLlHb45bM5p4TZQw==
X-Gm-Gg: ASbGncsLzwsAL2LpZsLRfFvvoiXc4Ib+AXO/ascaEbn5DYtupZ5BpTB+YadEmniggOr
	B0yS5ReQyMsKqkzjvVYVc4Rp1hjoNgmWw8dblFkvtfscJASnrxeRe3QOSKT543u+8yazhyj1gSp
	S0Fy6NkkAgW7teOh92oiMj2AS55GWKQxWAjXbkho6EpaLyelLtsuvGiT0J8gb5oPEPk2vhXoeek
	LUm6TeInSRU/L0VPBHMUZEU0vtrrcD6wf1Gei+spLTfTHBh/g4DzyWZygOxpt4k/DNoE/L29XlA
	JGabUYz6QQGHF9bRlQsCtd7Zzcgi5ibBdtjdlSumek9FYIYu7frQV2YmS8cFExNZwPnFUfKdYQy
	Xtg==
X-Google-Smtp-Source: AGHT+IHPdOin+C8g0wx1FVZXK9GftbDzEJfJn9J/WD865yYV0xgfOIIUDg43u3XvYZ+S5/kuWeK0wA==
X-Received: by 2002:a05:6000:240b:b0:39c:1257:c96c with SMTP id ffacd0b85a97d-3a06cfa9c7bmr1770009f8f.56.1745493020130;
        Thu, 24 Apr 2025 04:10:20 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d5323b4sm1753499f8f.66.2025.04.24.04.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 04:10:19 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/4] devtool: account for sources in UNPACKDIR
Date: Thu, 24 Apr 2025 13:10:11 +0200
Message-Id: <20250424111014.905507-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 11:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215360

From: Alexander Kanavin <alex@linutronix.de>

There's a couple of assumptions in devtool that sources
are always in a directory under WORKDIR; this is no longer
the case since introduction of UNPACKDIR: some recipes
are starting to use

S = "${UNPACKDIR}/git"

or similar, and so the logic to determine source locations
needs to be tweaked accordingly.

The issue is that oe-core has no concept of 'top level source
path' (S points to where the build is started from, inside that
top level location), and yet devtool needs to know that in order
to move the complete source tree correctly to a workspace (and possibly
other uses).

And so devtool performs convoluted path calculations from WORKDIR and S;
now this has been extended to include UNPACKDIR and became more convoluted
but hopefully it won't get any worse.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/devtool-source.bbclass |  8 ++++++--
 scripts/lib/devtool/ide_sdk.py      |  2 +-
 scripts/lib/devtool/standard.py     | 25 +++++++++++++++++++------
 scripts/lib/devtool/upgrade.py      |  2 +-
 4 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-source.bbclass
index 9762003ba75..d4e307e886b 100644
--- a/meta/classes/devtool-source.bbclass
+++ b/meta/classes/devtool-source.bbclass
@@ -92,9 +92,13 @@ python devtool_post_unpack() {
             for fname in local_files:
                 f.write('%s\n' % fname)
 
-    if os.path.dirname(srcsubdir) != workdir:
+    if srcsubdir.startswith(unpackdir) and srcsubdir != unpackdir:
+        srcparentdir = unpackdir
+    else:
+        srcparentdir = workdir
+    if os.path.dirname(srcsubdir) != srcparentdir:
         # Handle if S is set to a subdirectory of the source
-        srcsubdir = os.path.join(workdir, os.path.relpath(srcsubdir, workdir).split(os.sep)[0])
+        srcsubdir = os.path.join(srcparentdir, os.path.relpath(srcsubdir, srcparentdir).split(os.sep)[0])
 
     scriptutils.git_convert_standalone_clone(srcsubdir)
 
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index f8cf65f4a84..e1717bc4ab5 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -334,7 +334,7 @@ class RecipeModified:
         self.srctree = workspace[workspacepn]['srctree']
         # Need to grab this here in case the source is within a subdirectory
         self.real_srctree = get_real_srctree(
-            self.srctree, recipe_d.getVar('S'), recipe_d.getVar('WORKDIR'))
+            self.srctree, recipe_d.getVar('S'), recipe_d.getVar('WORKDIR'), recipe_d.getVar('UNPACKDIR'))
         self.bbappend = workspace[workspacepn]['bbappend']
 
         self.ide_sdk_dir = os.path.join(
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index cdfdba43eef..9a8f990d84a 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -625,7 +625,12 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
                 srcsubdir = f.read()
         except FileNotFoundError as e:
             raise DevtoolError('Something went wrong with source extraction - the devtool-source class was not active or did not function correctly:\n%s' % str(e))
-        srcsubdir_rel = os.path.relpath(srcsubdir, os.path.join(tempdir, 'workdir'))
+        unpackdir = d.getVar('UNPACKDIR')
+        if d.getVar('S').startswith(d.getVar('UNPACKDIR')):
+            srcparentdir = os.path.relpath(d.getVar('UNPACKDIR'), d.getVar('WORKDIR'))
+        else:
+            srcparentdir = ''
+        srcsubdir_rel = os.path.relpath(srcsubdir, os.path.join(tempdir, 'workdir', srcparentdir))
 
         # Check if work-shared is empty, if yes
         # find source and copy to work-shared
@@ -742,14 +747,22 @@ def get_staging_kbranch(srcdir):
         staging_kbranch = "".join(branch.split('\n')[0])
     return staging_kbranch
 
-def get_real_srctree(srctree, s, workdir):
+def get_real_srctree(srctree, s, workdir, unpackdir):
     # Check that recipe isn't using a shared workdir
     s = os.path.abspath(s)
     workdir = os.path.abspath(workdir)
-    if s.startswith(workdir) and s != workdir and os.path.dirname(s) != workdir:
+    unpackdir = os.path.abspath(unpackdir)
+
+    if s.startswith(workdir) and s != workdir:
         # Handle if S is set to a subdirectory of the source
-        srcsubdir = os.path.relpath(s, workdir).split(os.sep, 1)[1]
-        srctree = os.path.join(srctree, srcsubdir)
+        if s.startswith(unpackdir) and s != unpackdir:
+            srcparentdir = unpackdir
+        else:
+            srcparentdir = workdir
+
+        if os.path.dirname(s) != srcparentdir:
+            srcsubdir = os.path.relpath(s, srcparentdir).split(os.sep, 1)[1]
+            srctree = os.path.join(srctree, srcsubdir)
     return srctree
 
 def modify(args, config, basepath, workspace):
@@ -907,7 +920,7 @@ def modify(args, config, basepath, workspace):
 
         # Need to grab this here in case the source is within a subdirectory
         srctreebase = srctree
-        srctree = get_real_srctree(srctree, rd.getVar('S'), rd.getVar('WORKDIR'))
+        srctree = get_real_srctree(srctree, rd.getVar('S'), rd.getVar('WORKDIR'), rd.getVar('UNPACKDIR'))
 
         bb.utils.mkdirhier(os.path.dirname(appendfile))
         with open(appendfile, 'w') as f:
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 0dace1fb240..e584e03e17c 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -571,7 +571,7 @@ def upgrade(args, config, basepath, workspace):
         else:
             srctree = standard.get_default_srctree(config, pn)
 
-        srctree_s = standard.get_real_srctree(srctree, rd.getVar('S'), rd.getVar('WORKDIR'))
+        srctree_s = standard.get_real_srctree(srctree, rd.getVar('S'), rd.getVar('WORKDIR'), rd.getVar('UNPACKDIR'))
 
         # try to automatically discover latest version and revision if not provided on command line
         if not args.version and not args.srcrev:
-- 
2.39.5


