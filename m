Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 18FE973176
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:15:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBS7F0Jq013846
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:15:01 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:15:00 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:27 -0800
Message-ID: <8968ede9c8cdcd2cbf13bd5bba95883082189908.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 19/40] classes/metadata_scm: fix git errors showing up on non-git repositories
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
X-List-Received-Date: Mon, 28 Dec 2015 07:15:00 -0000
Content-Type: text/plain

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Fixes the following error showing up for layers that aren't a git repo
(or aren't parented by one):

fatal: Not a git repository (or any of the parent directories): .git

This was because we weren't intercepting stderr. We might as well just
use bb.process.run() here which does that and returns stdout and stderr
separately.

(This was a regression that came in with OE-Core revision
3aac11076e22ac4fea48f5404110bb959547a9fe).

Fixes [YOCTO #8661].

(From OE-Core master rev: f533c1bf4c6edbecc67f9e2c62fd475d64668e86)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/metadata_scm.bbclass |   20 ++++++++++----------
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
1.7.9.5


