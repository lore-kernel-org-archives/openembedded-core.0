Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 691767713C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:22:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id F3A0B609013
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 16:21:29 +0100
Message-Id: <bd8ff33cf2439536c6e41cf0ee9dd8fb3b64770a.1445527096.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v3 08/52] metadata_scm: rewrite git hash logic
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
X-List-Received-Date: Thu, 22 Oct 2015 15:22:20 -0000

From: Ross Burton <ross.burton@intel.com>

The code to get the git and branch hash for the current commit in a specific
repository was quite complex and prone to breakage, replace it with subprocess
and git rev-parse.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/metadata_scm.bbclass | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_scm.bbclass
index 237e618..64465fa 100644
--- a/meta/classes/metadata_scm.bbclass
+++ b/meta/classes/metadata_scm.bbclass
@@ -65,18 +65,19 @@ def base_get_metadata_svn_revision(path, d):
     return revision
 
 def base_get_metadata_git_branch(path, d):
-    branch = os.popen('cd %s; git branch 2>&1 | grep "^* " | tr -d "* "' % path).read()
+    import subprocess
 
-    if len(branch) != 0:
-        return branch
-    return "<unknown>"
+    try:
+        return subprocess.check_output(["git", "rev-parse", "--abbrev-ref", "HEAD"],
+                                       cwd=path).strip()
+    except:
+        return "<unknown>"
 
 def base_get_metadata_git_revision(path, d):
-    f = os.popen("cd %s; git log -n 1 --pretty=oneline -- 2>&1" % path)
-    data = f.read()
-    if f.close() is None:        
-        rev = data.split(" ")[0]
-        if len(rev) != 0:
-            return rev
-    return "<unknown>"
+    import subprocess
 
+    try:
+        return subprocess.check_output(["git", "rev-parse", "HEAD"],
+                                       cwd=path).strip()
+    except:
+        return "<unknown>"
-- 
2.1.4


