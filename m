Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 65F32606D0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Aug 2017 22:07:56 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id 77so3313778itj.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Aug 2017 15:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=tUZYkgpBEg2LXNDANwiKQEyGKZmjiee6fJiXmdbbP2w=;
	b=UxMbwyZOxjUwmcOrVs0nKjbQeEpb7b97XMAdsV2e7VJzdv8geW9X/y7vNqYA6q1bxF
	PXp4LYiyrIftazmFamnNGskwUdk9CxVLsL7Cwh1wcYSw7ZGJ1uTOqy7EkujcOq1y87tE
	fuYpdmUy0zWXAPM5b+ixW8nTiuamOK7vCKb71HwbFWlkFz4X8BmaIT3xEXq2S29xIvZb
	LM5rfcHzv8ifh+wQH2ti9mGkIUKBCGCXC6++8myWemzsqheyBAaznZ0iLwTgVGGacD4U
	kdQS+blZ9Cu2WpEy964SVIKG6dBz4RDpKW6FZvzgg1RSqqHmbcOrbQDYBdhy7oDiYqHZ
	sieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tUZYkgpBEg2LXNDANwiKQEyGKZmjiee6fJiXmdbbP2w=;
	b=IuX96lZ+9D2eZViMgxPKpJd3gsG7fH33oWy3LVRYKO77cC9H+ltwNWFt3sa7v7rvPH
	nOVvyQH8jgujxxB6UCQjEqoG1BFMOppjp/fEOq6mF9agqLbiHw7+ezmy3MnBSUXgaIpi
	OsngISAbrmD5Wsua/7IXLw00RQSstbCsIghLiCRMi6mboRRtHay8keVaSL43v3HaZo4T
	n1IvaRjDfuTFtrfCNsX70ATvX9h3BvtaoU+QAARAZjvasqvvDReLP2ntGWMx8mhE9P3F
	9OQD4X3DTYkwiA0f+rBbbpbB1+Ma3CInX+qSyzOP67L4weXVSz8VkBSzZpMXjGW8lNi1
	aU7g==
X-Gm-Message-State: AIVw113gBR7+VUhcKq0mn8zF8DMOJgg/1nu7b7u9SBhoETSwUZVPdJy9
	IXi8Pvx9R8CzZSKy044=
X-Received: by 10.36.4.17 with SMTP id 17mr7226429itb.58.1501970877475;
	Sat, 05 Aug 2017 15:07:57 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:a83:3700:10fb:b4c1:2c33:798c])
	by smtp.gmail.com with ESMTPSA id
	w74sm2215553iow.55.2017.08.05.15.07.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 05 Aug 2017 15:07:56 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Aug 2017 17:07:52 -0500
Message-Id: <20170805220752.2047-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH] externalsrc: Handle .git not being a directory
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
X-List-Received-Date: Sat, 05 Aug 2017 22:07:56 -0000

If EXTERNALSRC points to a git submodule, the .git entry will not be a
directory, but rather a file that points to the actual .git location (in
the parent repository). If this still can't be resolved to a directory,
ignore it and fall back to the non-git method for hashing.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/externalsrc.bbclass | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 9aabb426d9e..ab5cd636051 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -182,13 +182,25 @@ def srctree_hash_files(d, srcdir=None):
     import shutil
     import subprocess
     import tempfile
+    import re
 
     s_dir = srcdir or d.getVar('EXTERNALSRC')
     git_dir = os.path.join(s_dir, '.git')
+
+    if os.path.exists(git_dir) and os.path.isfile(git_dir):
+        with open(git_dir, 'r') as f:
+            m = re.match(r'gitdir: (.*)$', f.read())
+            if m is not None:
+                path = m.group(1)
+                if os.path.isabs(path):
+                    git_dir = path
+                else:
+                    git_dir = os.path.join(git_dir, path)
+
     oe_hash_file = os.path.join(git_dir, 'oe-devtool-tree-sha1')
 
     ret = " "
-    if os.path.exists(git_dir):
+    if os.path.exists(git_dir) and os.path.isdir(git_dir):
         with tempfile.NamedTemporaryFile(prefix='oe-devtool-index') as tmp_index:
             # Clone index
             shutil.copyfile(os.path.join(git_dir, 'index'), tmp_index.name)
-- 
2.13.3


