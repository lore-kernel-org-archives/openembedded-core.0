Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 19EBA7713F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 14:40:28 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2015 06:40:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,266,1444719600"; d="scan'208";a="681425930"
Received: from pdelcroi-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.3.221])
	by orsmga003.jf.intel.com with ESMTP; 09 Nov 2015 06:40:27 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 14:40:08 +0000
Message-Id: <2137166d10c937a2e34223a936f80697bf92d73d.1447079927.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1447079927.git.paul.eggleton@linux.intel.com>
References: <cover.1447079927.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1447079927.git.paul.eggleton@linux.intel.com>
References: <cover.1447079927.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/metadata_scm: fix git errors showing up on non-git repositories
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
X-List-Received-Date: Mon, 09 Nov 2015 14:40:28 -0000

Fixes the following error showing up for layers that aren't a git repo
(or aren't parented by one):

fatal: Not a git repository (or any of the parent directories): .git

This was because we weren't intercepting stderr. We might as well just
use bb.process.run() here which does that and returns stdout and stderr
separately.

(This was a regression that came in with OE-Core revision
3aac11076e22ac4fea48f5404110bb959547a9fe).

Fixes [YOCTO #8661].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/metadata_scm.bbclass | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_scm.bbclass
index 64465fa..0f7f423 100644
--- a/meta/classes/metadata_scm.bbclass
+++ b/meta/classes/metadata_scm.bbclass
@@ -65,19 +65,19 @@ def base_get_metadata_svn_revision(path, d):
     return revision
 
 def base_get_metadata_git_branch(path, d):
-    import subprocess
+    import bb.process
 
     try:
-        return subprocess.check_output(["git", "rev-parse", "--abbrev-ref", "HEAD"],
-                                       cwd=path).strip()
-    except:
-        return "<unknown>"
+        rev, _ = bb.process.run('git rev-parse --abbrev-ref HEAD', cwd=path)
+    except bb.process.ExecutionError:
+        rev = '<unknown>'
+    return rev.strip()
 
 def base_get_metadata_git_revision(path, d):
-    import subprocess
+    import bb.process
 
     try:
-        return subprocess.check_output(["git", "rev-parse", "HEAD"],
-                                       cwd=path).strip()
-    except:
-        return "<unknown>"
+        rev, _ = bb.process.run('git rev-parse HEAD', cwd=path)
+    except bb.process.ExecutionError:
+        rev = '<unknown>'
+    return rev.strip()
-- 
2.1.0


