Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 31A9A6FFED
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 01:40:51 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id 77so1549693itj.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Aug 2017 18:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=TZS88i6m6R8t/1fRVL19nHImYbuR0swHVxqQHqb/HHM=;
	b=fexNM9Ozxz7/vPaU3H1iGleihmfZ8YMSjTmi2GScASRni/3+gxGpR3FY1hBXDkfDhP
	tp7YyqXxOMB19tcmzHla/QtoVVtM7bo+McR/gui233h9dJUez+WmvMIHiyNpVyb5ufvh
	5ZmarG5yUD990BF7fPVoV4kbc38T21y5UALIRsRkbihVlfid8wfOqz5O9cdziYIcHHGV
	Z25tbtdWtnpfPoQEat02ja5kSRDfKgD2NChYSQ6cbkiadj4+bjjACIgzm29CCXf5jpQa
	R9GXgR7RcY6b5iyi4gmY08KJKc8npCIyBPgM9p2AWnWb91wEHgr/R5eK+rxlXZdSgFsB
	dF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TZS88i6m6R8t/1fRVL19nHImYbuR0swHVxqQHqb/HHM=;
	b=KoVxHJ0HtoIh+qOuUCr3YfNYbnUhlkWghH6Kmb5j0UpazyyVtHI7DtxiwC25r0uUrl
	jyvSxae+ZwE00s6N+b7v8xYazwC+sRrnbOi0V2MqpT9shWXKYmJl+/gE32xwTSzsJHQA
	O0vNq3tqRB8P56SW93z/g8sHR2rZmpLYz5JFVkUPCLMmVeivd2/k5QCLyFf3ffcJN+8m
	kCrhisSxAKNChf113tK/wVTptkXmnaeq7t3PktNr/rfOMDrMiZMNYLCSVRiW5l4JzwJT
	rXoJrIdLZtwIfCzgDsYL8f7iOGBRx8zYSoUW5aEsNeAxImwRSe71yCd4s/jp8bhClQub
	guww==
X-Gm-Message-State: AHYfb5h9nOlAm7yuvrdLQaAUsBTXbiF5wOINUPAPS8Ny+3CwUU2rLfvC
	IJqqVUJlQOI/Cel7Y3o=
X-Received: by 10.36.125.11 with SMTP id b11mr2820204itc.47.1502156453203;
	Mon, 07 Aug 2017 18:40:53 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:a83:3700:10fb:b4c1:2c33:798c])
	by smtp.gmail.com with ESMTPSA id 193sm68485ioo.84.2017.08.07.18.40.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 07 Aug 2017 18:40:52 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Aug 2017 20:40:45 -0500
Message-Id: <20170808014045.8352-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH v2] externalsrc: Handle .git not being a directory
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
X-List-Received-Date: Tue, 08 Aug 2017 01:40:52 -0000

Use git rev-parse to determine the location of the .git directory, in
case it is not an immediate child of EXTERNALSRC (e.g. when using
submodules). In the event git can't resolve the .git directory, fall
back to the non-git method for hashing.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/externalsrc.bbclass | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 9aabb426d9e..14a61d4201f 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -182,13 +182,19 @@ def srctree_hash_files(d, srcdir=None):
     import shutil
     import subprocess
     import tempfile
+    import re
 
     s_dir = srcdir or d.getVar('EXTERNALSRC')
-    git_dir = os.path.join(s_dir, '.git')
-    oe_hash_file = os.path.join(git_dir, 'oe-devtool-tree-sha1')
+    git_dir = None
+
+    try:
+        git_dir = subprocess.check_output(['git', 'rev-parse', '--absolute-git-dir'], cwd=s_dir).decode("utf-8").rstrip()
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


