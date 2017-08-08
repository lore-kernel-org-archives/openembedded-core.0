Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 56B056FFEF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 01:46:25 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id m34so1569482iti.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Aug 2017 18:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=v2mu8TFhw6dv2ZaL1whka9dkYCcLGV5giq6ssUXr1FE=;
	b=FLHRRj0M6MlV8sgGKWH35sHsDGTWzIGx9sxNlmFt/tnWs2B8oJ8rMluIkNLzKFr5+3
	dCbVyrPzoZBFFnLB3bY2Ec9lF8qDJ40EcoBAvFFQWWdhvScpy335vajUXckklEP2ZLGA
	LgBABVzdzVBeSQDhIYMd6rT3KTBpfvAnXT8nFuoJLCbnrQF0nApHP4qimKyELZZSum/D
	X5i1kZy59BgXmzrnc/jdZnp1YJ6u0wNE1v6ExcHJ6YIRmrZa1DIQd3ydGqIQZBetMCbx
	+aRTomjkyy/4Qnn/+zx0q2eflpAje/PasLaU+eEUpfLyZpqFPuwh1wOHsFlOM3B3Qg1y
	cJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=v2mu8TFhw6dv2ZaL1whka9dkYCcLGV5giq6ssUXr1FE=;
	b=sL/vwG9Hh08VzgOCfS1qtzfLO6D/Sy2WVHL39Guq545yQx/T48bKs46PxV0AgLIqRE
	hiOmNeTLoayEjgG0wICtXkjEFSa8IAnHKkTX0M6BylU7Me/FmJJDhgWBP3hj8qCMe+00
	7CCEI3xtrH9+CtJj8PZ710G4xgrZk0wfQegDcBLWrZHyqTKnopSuXqbVq9+jLg2gHDzP
	iqIFaIkgCd0wcd4i54bhFZN1q3odUzL3H+tYzlh/yA4A+1PgPu6mmnwC3EGHHf3r7X/2
	b7Dd49VuyCgluoaxfWnivpO4u40IIFaqYqeUlvx+LW72yf4EIBWHj3tnF9pCq6StQ7XL
	CE6w==
X-Gm-Message-State: AHYfb5jQLUhE94UxjPmLaK+VT1CFk8j9pcf11b4KymHJ8fAKFKoAGgj0
	3LvlNsN9m5Sp2Dfm+cs=
X-Received: by 10.36.135.202 with SMTP id f193mr2694407ite.48.1502156787159;
	Mon, 07 Aug 2017 18:46:27 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:a83:3700:10fb:b4c1:2c33:798c])
	by smtp.gmail.com with ESMTPSA id x70sm236980ita.40.2017.08.07.18.46.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 07 Aug 2017 18:46:26 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Aug 2017 20:46:24 -0500
Message-Id: <20170808014624.9506-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH v3] externalsrc: Handle .git not being a directory
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
X-List-Received-Date: Tue, 08 Aug 2017 01:46:26 -0000

Use git rev-parse to determine the location of the .git directory, in
case it is not an immediate child of EXTERNALSRC (e.g. when using
submodules). In the event git can't resolve the .git directory, fall
back to the non-git method for hashing.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/externalsrc.bbclass | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 9aabb426d9e..ea0faaf4193 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -184,11 +184,16 @@ def srctree_hash_files(d, srcdir=None):
     import tempfile
 
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


