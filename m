Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 39357780CD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 02:19:56 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id f16so856936itb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Aug 2017 19:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4HrMnHlWixjOeNfW6PT4FAbcrOSVMm6xbf+B9dtaFZE=;
	b=haudC6UImzMzjaOolU5NuO/dmp/RRqZWdetB1FN4ky6x4D60xlCcyvAmMZGp1chIvi
	Urd6UDPVAcDZOSAh4l1hjMH3EbxrJmYblCHGJJqAk4hPR0meXiltydzYu9hZDw7upfHw
	tP/KQoA/A6DP1EGun6UFc0FGQPK3rIhwOrjFg4K9GkdEptU4XF+4xZup2FRoFsK7OdfU
	wBvnpODZZOuGKKxGSxRZWscDRZeyyByzdEOYrHldogLSjqz5bn6Wen9YrUz//si7J84O
	ZGKYnQ2vG/JEwbBFY7OheHbK5BcVHh+c3hirI4mFNfvMzP0poQmoSiLA9i/MyOmhBJ/M
	flnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4HrMnHlWixjOeNfW6PT4FAbcrOSVMm6xbf+B9dtaFZE=;
	b=GQQeugFOrNPUwJdtSZLMHGWgAuPZTS2AawcaDFiCvM2PHQLTxzAGfWsNdbtzOCTxPt
	feumLOOG/CvN9ZohM9gR4J3GCWqXLT54XZCipnbNnXlT936oO8iP8NRTn4p7zrAU299H
	kUAXHW6Tb99lXzuA/1vi8dG66gtr0lIsatEHDSET30fLg5mMiX8fBPkU8NQApXkn0ZrE
	XJWyBkA1g6vdm4x4AZkeS+RmKJWTvFUrsXThtjDnhBKr0WtlCw3XP928/jWOd66uP36y
	PTnDBup7YmQTQTaqUNaD3sDsZC0bYGHcQc43JMpo6p/eq5VulVL9Orq5KuSLCAmGh3MY
	jU0g==
X-Gm-Message-State: AHYfb5jJpCyD/8fi4XvEW//xx1N8v9dftSce02SVzbS6fIOTTmhbKGk9
	GzautpSrfpUO8ex3BQc=
X-Received: by 10.36.99.69 with SMTP id j66mr9026879itc.100.1502331597300;
	Wed, 09 Aug 2017 19:19:57 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:a83:3700:10fb:b4c1:2c33:798c])
	by smtp.gmail.com with ESMTPSA id
	y72sm2522355iod.40.2017.08.09.19.19.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 Aug 2017 19:19:56 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Aug 2017 21:18:32 -0500
Message-Id: <20170810021832.14800-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH v4] externalsrc: Handle .git not being a directory
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
X-List-Received-Date: Thu, 10 Aug 2017 02:19:57 -0000

Use git rev-parse to determine the location of the .git directory, in
case it is not an immediate child of EXTERNALSRC (e.g. when using
submodules). In the event git can't resolve the .git directory, fall
back to the non-git method for hashing.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/externalsrc.bbclass | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 9aabb426d9e..8141f25e041 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -184,11 +184,19 @@ def srctree_hash_files(d, srcdir=None):
     import tempfile
 
     s_dir = srcdir or d.getVar('EXTERNALSRC')
-    git_dir = os.path.join(s_dir, '.git')
-    oe_hash_file = os.path.join(git_dir, 'oe-devtool-tree-sha1')
+    git_dir = None
+
+    try:
+        # git rev-parse returns the path relative to the current working
+        # directory
+        git_dir = os.path.join(s_dir,
+            subprocess.check_output(['git', 'rev-parse', '--git-dir'], cwd=s_dir).decode("utf-8").rstrip())
+    except subprocess.CalledProcessError:
+        pass
 
     ret = " "
-    if os.path.exists(git_dir):
+    if git_dir is not None:
+        oe_hash_file = os.path.join(git_dir, 'oe-devtool-tree-sha1')
         with tempfile.NamedTemporaryFile(prefix='oe-devtool-index') as tmp_index:
             # Clone index
             shutil.copyfile(os.path.join(git_dir, 'index'), tmp_index.name)
-- 
2.13.3


